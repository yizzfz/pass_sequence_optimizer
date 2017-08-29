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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to double*
  %8 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(i32 2000, double* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = sext i32 %0 to i64
  %min.iters.check = icmp eq i32 %0, 1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  %n.vec = and i64 %6, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %1, i64 %6
  %scevgep2 = getelementptr double, double* %2, i64 %6
  %bound0 = icmp ugt double* %scevgep2, %1
  %bound1 = icmp ugt double* %scevgep, %2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x double> undef, double %5, i32 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind4 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next5, %vector.body ]
  %7 = sitofp <2 x i32> %vec.ind4 to <2 x double>
  %8 = fadd <2 x double> %7, <double 2.000000e+00, double 2.000000e+00>
  %9 = fdiv <2 x double> %8, %broadcast.splat
  %10 = getelementptr inbounds double, double* %1, i64 %index
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> %9, <2 x double>* %11, align 8, !alias.scope !1, !noalias !4
  %12 = fadd <2 x double> %7, <double 3.000000e+00, double 3.000000e+00>
  %13 = fdiv <2 x double> %12, %broadcast.splat
  %14 = getelementptr inbounds double, double* %2, i64 %index
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> %13, <2 x double>* %15, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next5 = add <2 x i32> %vec.ind4, <i32 2, i32 2>
  %16 = icmp eq i64 %index.next, %n.vec
  br i1 %16, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %6, %n.vec
  br i1 %cmp.n, label %.loopexit, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ %n.vec, %middle.block ]
  %17 = insertelement <2 x double> undef, double %5, i32 0
  %18 = insertelement <2 x double> %17, double %5, i32 1
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %19 = trunc i64 %indvars.iv to i32
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %22 = insertelement <2 x double> undef, double %20, i32 0
  %23 = insertelement <2 x double> %22, double %20, i32 1
  %24 = fadd <2 x double> %23, <double 2.000000e+00, double 3.000000e+00>
  %25 = fdiv <2 x double> %24, %18
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  store double %26, double* %21, align 8
  %28 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  store double %27, double* %28, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %29 = icmp slt i64 %indvars.iv.next, %6
  br i1 %29, label %scalar.ph, label %.loopexit.loopexit, !llvm.loop !9

.loopexit.loopexit:                               ; preds = %scalar.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %..preheader3_crit_edge.lr.ph, label %..preheader3_crit_edge.lr.ph.split

..preheader3_crit_edge.lr.ph:                     ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  %8 = sext i32 %1 to i64
  %9 = add nsw i64 %8, -1
  br i1 %7, label %..preheader3_crit_edge.lr.ph.split.us, label %..preheader3_crit_edge.lr.ph.split

..preheader3_crit_edge.lr.ph.split.us:            ; preds = %..preheader3_crit_edge.lr.ph
  %10 = icmp sgt i64 %9, 2
  %smax = select i1 %10, i64 %9, i64 2
  %11 = add nsw i64 %smax, -1
  %scevgep = getelementptr double, double* %2, i64 1
  %12 = icmp sgt i64 %9, 2
  %smax37 = select i1 %12, i64 %9, i64 2
  %scevgep38 = getelementptr double, double* %2, i64 %smax37
  %13 = add nuw nsw i64 %smax37, 1
  %scevgep40 = getelementptr double, double* %3, i64 %13
  %14 = icmp sgt i64 %9, 2
  %smax51 = select i1 %14, i64 %9, i64 2
  %15 = add nsw i64 %smax51, -1
  %scevgep58 = getelementptr double, double* %3, i64 1
  %16 = icmp sgt i64 %9, 2
  %smax60 = select i1 %16, i64 %9, i64 2
  %scevgep61 = getelementptr double, double* %3, i64 %smax60
  %17 = add nuw nsw i64 %smax60, 1
  %scevgep63 = getelementptr double, double* %2, i64 %17
  %min.iters.check52 = icmp ult i64 %15, 4
  %min.iters.check = icmp ult i64 %11, 4
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %bound0 = icmp ult double* %scevgep, %scevgep40
  %bound1 = icmp ugt double* %scevgep38, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %11, %n.vec
  %n.vec55 = and i64 %15, -4
  %cmp.zero56 = icmp eq i64 %n.vec55, 0
  %bound065 = icmp ult double* %scevgep58, %scevgep63
  %bound166 = icmp ugt double* %scevgep61, %2
  %memcheck.conflict68 = and i1 %bound065, %bound166
  %ind.end74 = or i64 %n.vec55, 1
  %cmp.n75 = icmp eq i64 %15, %n.vec55
  br label %..preheader3_crit_edge.us

..preheader3_crit_edge.us:                        ; preds = %.loopexit, %..preheader3_crit_edge.lr.ph.split.us
  %18 = phi i32 [ 0, %..preheader3_crit_edge.lr.ph.split.us ], [ %44, %.loopexit ]
  br i1 %min.iters.check52, label %.preheader3.us.preheader, label %min.iters.checked53

.preheader3.us.preheader:                         ; preds = %middle.block49, %vector.memcheck69, %min.iters.checked53, %..preheader3_crit_edge.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck69 ], [ 1, %min.iters.checked53 ], [ 1, %..preheader3_crit_edge.us ], [ %ind.end74, %middle.block49 ]
  br label %.preheader3.us

min.iters.checked53:                              ; preds = %..preheader3_crit_edge.us
  br i1 %cmp.zero56, label %.preheader3.us.preheader, label %vector.memcheck69

vector.memcheck69:                                ; preds = %min.iters.checked53
  br i1 %memcheck.conflict68, label %.preheader3.us.preheader, label %vector.body48.preheader

vector.body48.preheader:                          ; preds = %vector.memcheck69
  br label %vector.body48

vector.body48:                                    ; preds = %vector.body48.preheader, %vector.body48
  %index71 = phi i64 [ %index.next72, %vector.body48 ], [ 0, %vector.body48.preheader ]
  %offset.idx76 = or i64 %index71, 1
  %19 = add nsw i64 %offset.idx76, -1
  %20 = getelementptr inbounds double, double* %2, i64 %19
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !10
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !10
  %24 = getelementptr inbounds double, double* %2, i64 %offset.idx76
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !10
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !10
  %28 = fadd <2 x double> %wide.load81, %wide.load83
  %29 = fadd <2 x double> %wide.load82, %wide.load84
  %30 = add nuw nsw i64 %offset.idx76, 1
  %31 = getelementptr inbounds double, double* %2, i64 %30
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !10
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !10
  %35 = fadd <2 x double> %28, %wide.load85
  %36 = fadd <2 x double> %29, %wide.load86
  %37 = fmul <2 x double> %35, <double 3.333300e-01, double 3.333300e-01>
  %38 = fmul <2 x double> %36, <double 3.333300e-01, double 3.333300e-01>
  %39 = getelementptr inbounds double, double* %3, i64 %offset.idx76
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %37, <2 x double>* %40, align 8, !alias.scope !13, !noalias !10
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %38, <2 x double>* %42, align 8, !alias.scope !13, !noalias !10
  %index.next72 = add i64 %index71, 4
  %43 = icmp eq i64 %index.next72, %n.vec55
  br i1 %43, label %middle.block49, label %vector.body48, !llvm.loop !15

middle.block49:                                   ; preds = %vector.body48
  br i1 %cmp.n75, label %.preheader.us.preheader, label %.preheader3.us.preheader

.loopexit.loopexit:                               ; preds = %.preheader.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block
  %44 = add nsw i32 %18, 1
  %45 = icmp slt i32 %44, %0
  br i1 %45, label %..preheader3_crit_edge.us, label %..preheader3_crit_edge.lr.ph.split.loopexit

.preheader.us:                                    ; preds = %.preheader.us.preheader88, %.preheader.us
  %indvars.iv21 = phi i64 [ %52, %.preheader.us ], [ %indvars.iv21.ph, %.preheader.us.preheader88 ]
  %46 = add nsw i64 %indvars.iv21, -1
  %47 = getelementptr inbounds double, double* %3, i64 %46
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds double, double* %3, i64 %indvars.iv21
  %50 = load double, double* %49, align 8
  %51 = fadd double %48, %50
  %52 = add nuw nsw i64 %indvars.iv21, 1
  %53 = getelementptr inbounds double, double* %3, i64 %52
  %54 = load double, double* %53, align 8
  %55 = fadd double %51, %54
  %56 = fmul double %55, 3.333300e-01
  %57 = getelementptr inbounds double, double* %2, i64 %indvars.iv21
  store double %56, double* %57, align 8
  %58 = icmp slt i64 %52, %9
  br i1 %58, label %.preheader.us, label %.loopexit.loopexit, !llvm.loop !16

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %.preheader3.us
  %indvars.iv = phi i64 [ %65, %.preheader3.us ], [ %indvars.iv.ph, %.preheader3.us.preheader ]
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
  br i1 %71, label %.preheader3.us, label %.preheader.us.preheader.loopexit, !llvm.loop !17

.preheader.us.preheader.loopexit:                 ; preds = %.preheader3.us
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit, %middle.block49
  br i1 %min.iters.check, label %.preheader.us.preheader88, label %min.iters.checked

.preheader.us.preheader88:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us.preheader
  %indvars.iv21.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader.us

min.iters.checked:                                ; preds = %.preheader.us.preheader
  br i1 %cmp.zero, label %.preheader.us.preheader88, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %memcheck.conflict, label %.preheader.us.preheader88, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %72 = add nsw i64 %offset.idx, -1
  %73 = getelementptr inbounds double, double* %3, i64 %72
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !18
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !18
  %77 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !18
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !18
  %81 = fadd <2 x double> %wide.load, %wide.load44
  %82 = fadd <2 x double> %wide.load43, %wide.load45
  %83 = add nuw nsw i64 %offset.idx, 1
  %84 = getelementptr inbounds double, double* %3, i64 %83
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !18
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !18
  %88 = fadd <2 x double> %81, %wide.load46
  %89 = fadd <2 x double> %82, %wide.load47
  %90 = fmul <2 x double> %88, <double 3.333300e-01, double 3.333300e-01>
  %91 = fmul <2 x double> %89, <double 3.333300e-01, double 3.333300e-01>
  %92 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %93 = bitcast double* %92 to <2 x double>*
  store <2 x double> %90, <2 x double>* %93, align 8, !alias.scope !21, !noalias !18
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x double>*
  store <2 x double> %91, <2 x double>* %95, align 8, !alias.scope !21, !noalias !18
  %index.next = add i64 %index, 4
  %96 = icmp eq i64 %index.next, %n.vec
  br i1 %96, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %.loopexit, label %.preheader.us.preheader88

..preheader3_crit_edge.lr.ph.split.loopexit:      ; preds = %.loopexit
  br label %..preheader3_crit_edge.lr.ph.split

..preheader3_crit_edge.lr.ph.split:               ; preds = %..preheader3_crit_edge.lr.ph.split.loopexit, %..preheader3_crit_edge.lr.ph, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %9

; <label>:9:                                      ; preds = %.lr.ph, %._crit_edge
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %10 = trunc i64 %indvars.iv to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %9
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %19 = icmp slt i64 %indvars.iv.next, %8
  br i1 %19, label %9, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
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
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
!17 = distinct !{!17, !7, !8}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !7, !8}
