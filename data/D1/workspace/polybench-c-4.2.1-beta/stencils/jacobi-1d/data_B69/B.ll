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
  %.cast1 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %.cast, double* %.cast1)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %.cast, double* %.cast1)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(i32 2000, double* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double*, double*) unnamed_addr #2 {
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
define internal fastcc void @kernel_jacobi_1d(i32, i32, double*, double*) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  %8 = sext i32 %1 to i64
  %9 = add nsw i64 %8, -1
  br i1 %7, label %._crit_edge.us.preheader, label %.loopexit

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %10 = icmp sgt i64 %9, 2
  %smax = select i1 %10, i64 %9, i64 2
  %11 = add nsw i64 %smax, -1
  %scevgep = getelementptr double, double* %2, i64 1
  %12 = icmp sgt i64 %9, 2
  %smax34 = select i1 %12, i64 %9, i64 2
  %scevgep35 = getelementptr double, double* %2, i64 %smax34
  %13 = add nuw nsw i64 %smax34, 1
  %scevgep37 = getelementptr double, double* %3, i64 %13
  %14 = icmp sgt i64 %9, 2
  %smax48 = select i1 %14, i64 %9, i64 2
  %15 = add nsw i64 %smax48, -1
  %scevgep55 = getelementptr double, double* %3, i64 1
  %16 = icmp sgt i64 %9, 2
  %smax57 = select i1 %16, i64 %9, i64 2
  %scevgep58 = getelementptr double, double* %3, i64 %smax57
  %17 = add nuw nsw i64 %smax57, 1
  %scevgep60 = getelementptr double, double* %2, i64 %17
  %n.vec = and i64 %11, -4
  %bound0 = icmp ult double* %scevgep, %scevgep37
  %bound1 = icmp ugt double* %scevgep35, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = or i64 %n.vec, 1
  %n.vec52 = and i64 %15, -4
  %bound062 = icmp ult double* %scevgep55, %scevgep60
  %bound163 = icmp ugt double* %scevgep58, %2
  %memcheck.conflict65 = and i1 %bound062, %bound163
  %ind.end71 = or i64 %n.vec52, 1
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge5.us
  %18 = phi i32 [ %47, %._crit_edge5.us ], [ 0, %._crit_edge.us.preheader ]
  %19 = icmp ult i64 %15, 4
  br i1 %19, label %scalar.ph47.preheader, label %min.iters.checked50

scalar.ph47.preheader:                            ; preds = %middle.block46, %vector.memcheck66, %min.iters.checked50, %._crit_edge.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck66 ], [ 1, %min.iters.checked50 ], [ 1, %._crit_edge.us ], [ %ind.end71, %middle.block46 ]
  br label %scalar.ph47

min.iters.checked50:                              ; preds = %._crit_edge.us
  %20 = icmp eq i64 %n.vec52, 0
  br i1 %20, label %scalar.ph47.preheader, label %vector.memcheck66

vector.memcheck66:                                ; preds = %min.iters.checked50
  br i1 %memcheck.conflict65, label %scalar.ph47.preheader, label %vector.body45.preheader

vector.body45.preheader:                          ; preds = %vector.memcheck66
  br label %vector.body45

vector.body45:                                    ; preds = %vector.body45.preheader, %vector.body45
  %index68 = phi i64 [ %index.next69, %vector.body45 ], [ 0, %vector.body45.preheader ]
  %offset.idx73 = or i64 %index68, 1
  %21 = add nsw i64 %offset.idx73, -1
  %22 = getelementptr inbounds double, double* %2, i64 %21
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !10
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !10
  %26 = getelementptr inbounds double, double* %2, i64 %offset.idx73
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !10
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !10
  %30 = fadd <2 x double> %wide.load78, %wide.load80
  %31 = fadd <2 x double> %wide.load79, %wide.load81
  %32 = add nuw nsw i64 %offset.idx73, 1
  %33 = getelementptr inbounds double, double* %2, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !10
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !10
  %37 = fadd <2 x double> %30, %wide.load82
  %38 = fadd <2 x double> %31, %wide.load83
  %39 = fmul <2 x double> %37, <double 3.333300e-01, double 3.333300e-01>
  %40 = fmul <2 x double> %38, <double 3.333300e-01, double 3.333300e-01>
  %41 = getelementptr inbounds double, double* %3, i64 %offset.idx73
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %39, <2 x double>* %42, align 8, !alias.scope !13, !noalias !10
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> %40, <2 x double>* %44, align 8, !alias.scope !13, !noalias !10
  %index.next69 = add i64 %index68, 4
  %45 = icmp eq i64 %index.next69, %n.vec52
  br i1 %45, label %middle.block46, label %vector.body45, !llvm.loop !15

middle.block46:                                   ; preds = %vector.body45
  %46 = icmp eq i64 %15, %n.vec52
  br i1 %46, label %.lr.ph4.us.preheader, label %scalar.ph47.preheader

._crit_edge5.us.loopexit:                         ; preds = %.lr.ph4.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %middle.block
  %47 = add nsw i32 %18, 1
  %48 = icmp slt i32 %47, %0
  br i1 %48, label %._crit_edge.us, label %.loopexit.loopexit

.lr.ph4.us:                                       ; preds = %.lr.ph4.us.preheader84, %.lr.ph4.us
  %indvars.iv25 = phi i64 [ %55, %.lr.ph4.us ], [ %indvars.iv25.ph, %.lr.ph4.us.preheader84 ]
  %49 = add nsw i64 %indvars.iv25, -1
  %50 = getelementptr inbounds double, double* %3, i64 %49
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds double, double* %3, i64 %indvars.iv25
  %53 = load double, double* %52, align 8
  %54 = fadd double %51, %53
  %55 = add nuw nsw i64 %indvars.iv25, 1
  %56 = getelementptr inbounds double, double* %3, i64 %55
  %57 = load double, double* %56, align 8
  %58 = fadd double %54, %57
  %59 = fmul double %58, 3.333300e-01
  %60 = getelementptr inbounds double, double* %2, i64 %indvars.iv25
  store double %59, double* %60, align 8
  %61 = icmp slt i64 %55, %9
  br i1 %61, label %.lr.ph4.us, label %._crit_edge5.us.loopexit, !llvm.loop !16

scalar.ph47:                                      ; preds = %scalar.ph47.preheader, %scalar.ph47
  %indvars.iv = phi i64 [ %68, %scalar.ph47 ], [ %indvars.iv.ph, %scalar.ph47.preheader ]
  %62 = add nsw i64 %indvars.iv, -1
  %63 = getelementptr inbounds double, double* %2, i64 %62
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %66 = load double, double* %65, align 8
  %67 = fadd double %64, %66
  %68 = add nuw nsw i64 %indvars.iv, 1
  %69 = getelementptr inbounds double, double* %2, i64 %68
  %70 = load double, double* %69, align 8
  %71 = fadd double %67, %70
  %72 = fmul double %71, 3.333300e-01
  %73 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %72, double* %73, align 8
  %74 = icmp slt i64 %68, %9
  br i1 %74, label %scalar.ph47, label %.lr.ph4.us.preheader.loopexit, !llvm.loop !17

.lr.ph4.us.preheader.loopexit:                    ; preds = %scalar.ph47
  br label %.lr.ph4.us.preheader

.lr.ph4.us.preheader:                             ; preds = %.lr.ph4.us.preheader.loopexit, %middle.block46
  %75 = icmp ult i64 %11, 4
  br i1 %75, label %.lr.ph4.us.preheader84, label %min.iters.checked

.lr.ph4.us.preheader84:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph4.us.preheader
  %indvars.iv25.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.lr.ph4.us.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph4.us

min.iters.checked:                                ; preds = %.lr.ph4.us.preheader
  %76 = icmp eq i64 %n.vec, 0
  br i1 %76, label %.lr.ph4.us.preheader84, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %memcheck.conflict, label %.lr.ph4.us.preheader84, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %77 = add nsw i64 %offset.idx, -1
  %78 = getelementptr inbounds double, double* %3, i64 %77
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !18
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !18
  %82 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !18
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !18
  %86 = fadd <2 x double> %wide.load, %wide.load41
  %87 = fadd <2 x double> %wide.load40, %wide.load42
  %88 = add nuw nsw i64 %offset.idx, 1
  %89 = getelementptr inbounds double, double* %3, i64 %88
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !18
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !18
  %93 = fadd <2 x double> %86, %wide.load43
  %94 = fadd <2 x double> %87, %wide.load44
  %95 = fmul <2 x double> %93, <double 3.333300e-01, double 3.333300e-01>
  %96 = fmul <2 x double> %94, <double 3.333300e-01, double 3.333300e-01>
  %97 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %98 = bitcast double* %97 to <2 x double>*
  store <2 x double> %95, <2 x double>* %98, align 8, !alias.scope !21, !noalias !18
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x double>*
  store <2 x double> %96, <2 x double>* %100, align 8, !alias.scope !21, !noalias !18
  %index.next = add i64 %index, 4
  %101 = icmp eq i64 %index.next, %n.vec
  br i1 %101, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %102 = icmp eq i64 %11, %n.vec
  br i1 %102, label %._crit_edge5.us, label %.lr.ph4.us.preheader84

.loopexit.loopexit:                               ; preds = %._crit_edge5.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge.lr.ph, %4
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
