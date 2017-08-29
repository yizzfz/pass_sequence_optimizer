; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %.cast = bitcast i8* %3 to double*
  %5 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %.cast, double* %5)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %.cast, double* %5)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %6 = icmp sgt i32 %0, 42
  br i1 %6, label %7, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:7:                                      ; preds = %2
  %8 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %8, align 1
  %9 = icmp eq i8 %strcmpload, 0
  br i1 %9, label %10, label %.._crit_edge_crit_edge3

.._crit_edge_crit_edge3:                          ; preds = %7
  br label %._crit_edge

; <label>:10:                                     ; preds = %7
  %11 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(i32 2000, double* %11)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge3, %.._crit_edge_crit_edge, %10
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double*, double*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph, label %.._crit_edge2_crit_edge

.._crit_edge2_crit_edge:                          ; preds = %3
  br label %._crit_edge2

.lr.ph:                                           ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = sext i32 %0 to i64
  %7 = insertelement <2 x double> undef, double %5, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %23, %._crit_edge ]
  %10 = sitofp i32 %storemerge1 to double
  %11 = sext i32 %storemerge1 to i64
  %12 = getelementptr inbounds double, double* %1, i64 %11
  %13 = trunc i64 %indvars.iv to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fadd <2 x double> %16, <double 2.000000e+00, double 3.000000e+00>
  %18 = fdiv <2 x double> %17, %8
  %19 = extractelement <2 x double> %18, i32 0
  %20 = extractelement <2 x double> %18, i32 1
  store double %19, double* %12, align 8
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  store double %20, double* %21, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %22 = icmp slt i64 %indvars.iv.next, %6
  br i1 %22, label %._crit_edge, label %.._crit_edge2_crit_edge4

.._crit_edge2_crit_edge4:                         ; preds = %9
  br label %._crit_edge2

._crit_edge:                                      ; preds = %9
  %23 = trunc i64 %indvars.iv.next to i32
  br label %9

._crit_edge2:                                     ; preds = %.._crit_edge2_crit_edge4, %.._crit_edge2_crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double*, double*) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %._crit_edge.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %4
  br label %._crit_edge

._crit_edge.lr.ph:                                ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  %8 = sext i32 %1 to i64
  %9 = add nsw i64 %8, -1
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge.lr.ph.._crit_edge_crit_edge

._crit_edge.lr.ph.._crit_edge_crit_edge:          ; preds = %._crit_edge.lr.ph
  br label %._crit_edge

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %10 = icmp sgt i64 %9, 2
  %smax = select i1 %10, i64 %9, i64 2
  %11 = add nsw i64 %smax, -1
  %scevgep = getelementptr double, double* %2, i64 1
  %12 = icmp sgt i64 %9, 2
  %smax40 = select i1 %12, i64 %9, i64 2
  %scevgep41 = getelementptr double, double* %2, i64 %smax40
  %13 = add nuw nsw i64 %smax40, 1
  %scevgep43 = getelementptr double, double* %3, i64 %13
  %14 = icmp sgt i64 %9, 2
  %smax54 = select i1 %14, i64 %9, i64 2
  %15 = add nsw i64 %smax54, -1
  %scevgep61 = getelementptr double, double* %3, i64 1
  %16 = icmp sgt i64 %9, 2
  %smax63 = select i1 %16, i64 %9, i64 2
  %scevgep64 = getelementptr double, double* %3, i64 %smax63
  %17 = add nuw nsw i64 %smax63, 1
  %scevgep66 = getelementptr double, double* %2, i64 %17
  %min.iters.check55 = icmp ult i64 %15, 4
  %min.iters.check = icmp ult i64 %11, 4
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %bound0 = icmp ult double* %scevgep, %scevgep43
  %bound1 = icmp ugt double* %scevgep41, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %11, %n.vec
  %n.vec58 = and i64 %15, -4
  %cmp.zero59 = icmp eq i64 %n.vec58, 0
  %bound068 = icmp ult double* %scevgep61, %scevgep66
  %bound169 = icmp ugt double* %scevgep64, %2
  %memcheck.conflict71 = and i1 %bound068, %bound169
  %ind.end77 = or i64 %n.vec58, 1
  %cmp.n78 = icmp eq i64 %15, %n.vec58
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge7.us.._crit_edge.us_crit_edge, %._crit_edge.us.preheader
  %18 = phi i32 [ %44, %._crit_edge7.us.._crit_edge.us_crit_edge ], [ 0, %._crit_edge.us.preheader ]
  br i1 %min.iters.check55, label %._crit_edge.us.._crit_edge33_crit_edge, label %min.iters.checked56

._crit_edge.us.._crit_edge33_crit_edge:           ; preds = %._crit_edge.us
  br label %._crit_edge33.preheader

min.iters.checked56:                              ; preds = %._crit_edge.us
  br i1 %cmp.zero59, label %min.iters.checked56.._crit_edge33_crit_edge, label %vector.memcheck72

min.iters.checked56.._crit_edge33_crit_edge:      ; preds = %min.iters.checked56
  br label %._crit_edge33.preheader

vector.memcheck72:                                ; preds = %min.iters.checked56
  br i1 %memcheck.conflict71, label %vector.memcheck72.._crit_edge33_crit_edge, label %vector.memcheck72.vector.body51_crit_edge

vector.memcheck72.vector.body51_crit_edge:        ; preds = %vector.memcheck72
  br label %vector.body51

vector.memcheck72.._crit_edge33_crit_edge:        ; preds = %vector.memcheck72
  br label %._crit_edge33.preheader

vector.body51:                                    ; preds = %vector.body51.vector.body51_crit_edge, %vector.memcheck72.vector.body51_crit_edge
  %index74 = phi i64 [ %index.next75, %vector.body51.vector.body51_crit_edge ], [ 0, %vector.memcheck72.vector.body51_crit_edge ]
  %offset.idx79 = or i64 %index74, 1
  %19 = add nsw i64 %offset.idx79, -1
  %20 = getelementptr inbounds double, double* %2, i64 %19
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = getelementptr inbounds double, double* %2, i64 %offset.idx79
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fadd <2 x double> %wide.load84, %wide.load86
  %29 = fadd <2 x double> %wide.load85, %wide.load87
  %30 = add nuw nsw i64 %offset.idx79, 1
  %31 = getelementptr inbounds double, double* %2, i64 %30
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %28, %wide.load88
  %36 = fadd <2 x double> %29, %wide.load89
  %37 = fmul <2 x double> %35, <double 3.333300e-01, double 3.333300e-01>
  %38 = fmul <2 x double> %36, <double 3.333300e-01, double 3.333300e-01>
  %39 = getelementptr inbounds double, double* %3, i64 %offset.idx79
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %37, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %38, <2 x double>* %42, align 8, !alias.scope !4, !noalias !1
  %index.next75 = add i64 %index74, 4
  %43 = icmp eq i64 %index.next75, %n.vec58
  br i1 %43, label %middle.block52, label %vector.body51.vector.body51_crit_edge, !llvm.loop !6

vector.body51.vector.body51_crit_edge:            ; preds = %vector.body51
  br label %vector.body51

middle.block52:                                   ; preds = %vector.body51
  br i1 %cmp.n78, label %middle.block52..lr.ph6.us.preheader_crit_edge, label %middle.block52.._crit_edge33_crit_edge

middle.block52.._crit_edge33_crit_edge:           ; preds = %middle.block52
  br label %._crit_edge33.preheader

._crit_edge33.preheader:                          ; preds = %._crit_edge.us.._crit_edge33_crit_edge, %min.iters.checked56.._crit_edge33_crit_edge, %vector.memcheck72.._crit_edge33_crit_edge, %middle.block52.._crit_edge33_crit_edge
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck72.._crit_edge33_crit_edge ], [ 1, %min.iters.checked56.._crit_edge33_crit_edge ], [ 1, %._crit_edge.us.._crit_edge33_crit_edge ], [ %ind.end77, %middle.block52.._crit_edge33_crit_edge ]
  br label %._crit_edge33

middle.block52..lr.ph6.us.preheader_crit_edge:    ; preds = %middle.block52
  br label %.lr.ph6.us.preheader

._crit_edge7.us:                                  ; preds = %middle.block.._crit_edge7.us_crit_edge, %.lr.ph6.us.._crit_edge7.us_crit_edge
  %44 = add nsw i32 %18, 1
  %45 = icmp slt i32 %44, %0
  br i1 %45, label %._crit_edge7.us.._crit_edge.us_crit_edge, label %._crit_edge7.us.._crit_edge_crit_edge

._crit_edge7.us.._crit_edge_crit_edge:            ; preds = %._crit_edge7.us
  br label %._crit_edge

._crit_edge7.us.._crit_edge.us_crit_edge:         ; preds = %._crit_edge7.us
  br label %._crit_edge.us

.lr.ph6.us:                                       ; preds = %.lr.ph6.us.preheader90, %.lr.ph6.us..lr.ph6.us_crit_edge
  %indvars.iv29 = phi i64 [ %52, %.lr.ph6.us..lr.ph6.us_crit_edge ], [ %indvars.iv29.ph, %.lr.ph6.us.preheader90 ]
  %46 = add nsw i64 %indvars.iv29, -1
  %47 = getelementptr inbounds double, double* %3, i64 %46
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds double, double* %3, i64 %indvars.iv29
  %50 = load double, double* %49, align 8
  %51 = fadd double %48, %50
  %52 = add nuw nsw i64 %indvars.iv29, 1
  %53 = getelementptr inbounds double, double* %3, i64 %52
  %54 = load double, double* %53, align 8
  %55 = fadd double %51, %54
  %56 = fmul double %55, 3.333300e-01
  %57 = getelementptr inbounds double, double* %2, i64 %indvars.iv29
  store double %56, double* %57, align 8
  %58 = icmp slt i64 %52, %9
  br i1 %58, label %.lr.ph6.us..lr.ph6.us_crit_edge, label %.lr.ph6.us.._crit_edge7.us_crit_edge, !llvm.loop !9

.lr.ph6.us.._crit_edge7.us_crit_edge:             ; preds = %.lr.ph6.us
  br label %._crit_edge7.us

.lr.ph6.us..lr.ph6.us_crit_edge:                  ; preds = %.lr.ph6.us
  br label %.lr.ph6.us

._crit_edge33:                                    ; preds = %._crit_edge33.preheader, %._crit_edge33.._crit_edge33_crit_edge
  %indvars.iv = phi i64 [ %65, %._crit_edge33.._crit_edge33_crit_edge ], [ %indvars.iv.ph, %._crit_edge33.preheader ]
  %59 = add nsw i64 %indvars.iv, -1
  %60 = getelementptr inbounds double, double* %2, i64 %59
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  %65 = add nuw nsw i64 %indvars.iv, 1
  %66 = getelementptr inbounds double, double* %2, i64 %65
  %67 = load double, double* %66, align 8
  %68 = fadd double %64, %67
  %69 = fmul double %68, 3.333300e-01
  %70 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %69, double* %70, align 8
  %71 = icmp slt i64 %65, %9
  br i1 %71, label %._crit_edge33.._crit_edge33_crit_edge, label %._crit_edge33..lr.ph6.us.preheader_crit_edge, !llvm.loop !10

._crit_edge33..lr.ph6.us.preheader_crit_edge:     ; preds = %._crit_edge33
  br label %.lr.ph6.us.preheader

._crit_edge33.._crit_edge33_crit_edge:            ; preds = %._crit_edge33
  br label %._crit_edge33

.lr.ph6.us.preheader:                             ; preds = %._crit_edge33..lr.ph6.us.preheader_crit_edge, %middle.block52..lr.ph6.us.preheader_crit_edge
  br i1 %min.iters.check, label %.lr.ph6.us.preheader..lr.ph6.us_crit_edge, label %min.iters.checked

.lr.ph6.us.preheader..lr.ph6.us_crit_edge:        ; preds = %.lr.ph6.us.preheader
  br label %.lr.ph6.us.preheader90

min.iters.checked:                                ; preds = %.lr.ph6.us.preheader
  br i1 %cmp.zero, label %min.iters.checked..lr.ph6.us_crit_edge, label %vector.memcheck

min.iters.checked..lr.ph6.us_crit_edge:           ; preds = %min.iters.checked
  br label %.lr.ph6.us.preheader90

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %memcheck.conflict, label %vector.memcheck..lr.ph6.us_crit_edge, label %vector.memcheck.vector.body_crit_edge

vector.memcheck.vector.body_crit_edge:            ; preds = %vector.memcheck
  br label %vector.body

vector.memcheck..lr.ph6.us_crit_edge:             ; preds = %vector.memcheck
  br label %.lr.ph6.us.preheader90

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.memcheck.vector.body_crit_edge
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.memcheck.vector.body_crit_edge ]
  %offset.idx = or i64 %index, 1
  %72 = add nsw i64 %offset.idx, -1
  %73 = getelementptr inbounds double, double* %3, i64 %72
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !11
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !11
  %77 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !11
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !11
  %81 = fadd <2 x double> %wide.load, %wide.load47
  %82 = fadd <2 x double> %wide.load46, %wide.load48
  %83 = add nuw nsw i64 %offset.idx, 1
  %84 = getelementptr inbounds double, double* %3, i64 %83
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !11
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !11
  %88 = fadd <2 x double> %81, %wide.load49
  %89 = fadd <2 x double> %82, %wide.load50
  %90 = fmul <2 x double> %88, <double 3.333300e-01, double 3.333300e-01>
  %91 = fmul <2 x double> %89, <double 3.333300e-01, double 3.333300e-01>
  %92 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %93 = bitcast double* %92 to <2 x double>*
  store <2 x double> %90, <2 x double>* %93, align 8, !alias.scope !14, !noalias !11
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x double>*
  store <2 x double> %91, <2 x double>* %95, align 8, !alias.scope !14, !noalias !11
  %index.next = add i64 %index, 4
  %96 = icmp eq i64 %index.next, %n.vec
  br i1 %96, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !16

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.._crit_edge7.us_crit_edge, label %middle.block..lr.ph6.us_crit_edge

middle.block..lr.ph6.us_crit_edge:                ; preds = %middle.block
  br label %.lr.ph6.us.preheader90

.lr.ph6.us.preheader90:                           ; preds = %.lr.ph6.us.preheader..lr.ph6.us_crit_edge, %min.iters.checked..lr.ph6.us_crit_edge, %vector.memcheck..lr.ph6.us_crit_edge, %middle.block..lr.ph6.us_crit_edge
  %indvars.iv29.ph = phi i64 [ 1, %vector.memcheck..lr.ph6.us_crit_edge ], [ 1, %min.iters.checked..lr.ph6.us_crit_edge ], [ 1, %.lr.ph6.us.preheader..lr.ph6.us_crit_edge ], [ %ind.end, %middle.block..lr.ph6.us_crit_edge ]
  br label %.lr.ph6.us

middle.block.._crit_edge7.us_crit_edge:           ; preds = %middle.block
  br label %._crit_edge7.us

._crit_edge:                                      ; preds = %._crit_edge7.us.._crit_edge_crit_edge, %._crit_edge.lr.ph.._crit_edge_crit_edge, %.._crit_edge_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %.._crit_edge4_crit_edge

.._crit_edge4_crit_edge:                          ; preds = %2
  br label %._crit_edge4

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %9

; <label>:9:                                      ; preds = %._crit_edge._crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %19, %._crit_edge._crit_edge ]
  %10 = srem i32 %storemerge1, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %9
  br label %._crit_edge

; <label>:12:                                     ; preds = %9
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %18 = icmp slt i64 %indvars.iv.next, %8
  br i1 %18, label %._crit_edge._crit_edge, label %._crit_edge.._crit_edge4_crit_edge

._crit_edge.._crit_edge4_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge4

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  %19 = trunc i64 %indvars.iv.next to i32
  br label %9

._crit_edge4:                                     ; preds = %._crit_edge.._crit_edge4_crit_edge, %.._crit_edge4_crit_edge
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !7, !8}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !7, !8}
