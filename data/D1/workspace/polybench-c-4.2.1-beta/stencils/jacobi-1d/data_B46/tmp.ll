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
  br i1 %6, label %7, label %._crit_edge

; <label>:7:                                      ; preds = %2
  %8 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %8, align 1
  %9 = icmp eq i8 %strcmpload, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %7
  %11 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(i32 2000, double* %11)
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %2, %10
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double*, double*) unnamed_addr #2 {
  br i1 true, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  br i1 false, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  br i1 false, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %1, i64 2000
  %scevgep5 = getelementptr double, double* %2, i64 2000
  %bound0 = icmp ugt double* %scevgep5, %1
  %bound1 = icmp ugt double* %scevgep, %2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind7 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next8, %vector.body ]
  %4 = sitofp <2 x i32> %vec.ind7 to <2 x double>
  %5 = fadd <2 x double> %4, <double 2.000000e+00, double 2.000000e+00>
  %6 = fdiv <2 x double> %5, <double 2.000000e+03, double 2.000000e+03>
  %7 = getelementptr inbounds double, double* %1, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  store <2 x double> %6, <2 x double>* %8, align 8, !alias.scope !1, !noalias !4
  %9 = fadd <2 x double> %4, <double 3.000000e+00, double 3.000000e+00>
  %10 = fdiv <2 x double> %9, <double 2.000000e+03, double 2.000000e+03>
  %11 = getelementptr inbounds double, double* %2, i64 %index
  %12 = bitcast double* %11 to <2 x double>*
  store <2 x double> %10, <2 x double>* %12, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next8 = add <2 x i32> %vec.ind7, <i32 2, i32 2>
  %13 = icmp eq i64 %index.next, 2000
  br i1 %13, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph
  %indvars.iv2.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ 2000, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %scalar.ph ], [ %indvars.iv2.ph, %scalar.ph.preheader ]
  %14 = trunc i64 %indvars.iv2 to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv2
  %17 = insertelement <2 x double> undef, double %15, i32 0
  %18 = insertelement <2 x double> %17, double %15, i32 1
  %19 = fadd <2 x double> %18, <double 2.000000e+00, double 3.000000e+00>
  %20 = fdiv <2 x double> %19, <double 2.000000e+03, double 2.000000e+03>
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  store double %21, double* %16, align 8
  %23 = getelementptr inbounds double, double* %2, i64 %indvars.iv2
  store double %22, double* %23, align 8
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double*, double*) unnamed_addr #2 {
  br i1 true, label %._crit_edge.lr.ph, label %._crit_edge10

._crit_edge.lr.ph:                                ; preds = %4
  br i1 true, label %._crit_edge.us.preheader, label %._crit_edge10

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %scevgep = getelementptr double, double* %2, i64 1
  %scevgep35 = getelementptr double, double* %2, i64 1999
  %scevgep37 = getelementptr double, double* %3, i64 2000
  %scevgep55 = getelementptr double, double* %3, i64 1
  %scevgep58 = getelementptr double, double* %3, i64 1999
  %scevgep60 = getelementptr double, double* %2, i64 2000
  %bound0 = icmp ult double* %scevgep, %scevgep37
  %bound1 = icmp ugt double* %scevgep35, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  %bound062 = icmp ult double* %scevgep55, %scevgep60
  %bound163 = icmp ugt double* %scevgep58, %2
  %memcheck.conflict65 = and i1 %bound062, %bound163
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge7.us
  %5 = phi i32 [ %31, %._crit_edge7.us ], [ 0, %._crit_edge.us.preheader ]
  br i1 false, label %scalar.ph47.preheader, label %min.iters.checked50

scalar.ph47.preheader:                            ; preds = %middle.block46, %vector.memcheck66, %min.iters.checked50, %._crit_edge.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck66 ], [ 1, %min.iters.checked50 ], [ 1, %._crit_edge.us ], [ 1997, %middle.block46 ]
  br label %scalar.ph47

min.iters.checked50:                              ; preds = %._crit_edge.us
  br i1 false, label %scalar.ph47.preheader, label %vector.memcheck66

vector.memcheck66:                                ; preds = %min.iters.checked50
  br i1 %memcheck.conflict65, label %scalar.ph47.preheader, label %vector.body45.preheader

vector.body45.preheader:                          ; preds = %vector.memcheck66
  br label %vector.body45

vector.body45:                                    ; preds = %vector.body45.preheader, %vector.body45
  %index68 = phi i64 [ %index.next69, %vector.body45 ], [ 0, %vector.body45.preheader ]
  %offset.idx73 = or i64 %index68, 1
  %6 = add nsw i64 %offset.idx73, -1
  %7 = getelementptr inbounds double, double* %2, i64 %6
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !10
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !10
  %11 = getelementptr inbounds double, double* %2, i64 %offset.idx73
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !10
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !10
  %15 = fadd <2 x double> %wide.load78, %wide.load80
  %16 = fadd <2 x double> %wide.load79, %wide.load81
  %17 = add nuw nsw i64 %offset.idx73, 1
  %18 = getelementptr inbounds double, double* %2, i64 %17
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !10
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !10
  %22 = fadd <2 x double> %15, %wide.load82
  %23 = fadd <2 x double> %16, %wide.load83
  %24 = fmul <2 x double> %22, <double 3.333300e-01, double 3.333300e-01>
  %25 = fmul <2 x double> %23, <double 3.333300e-01, double 3.333300e-01>
  %26 = getelementptr inbounds double, double* %3, i64 %offset.idx73
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> %24, <2 x double>* %27, align 8, !alias.scope !13, !noalias !10
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  store <2 x double> %25, <2 x double>* %29, align 8, !alias.scope !13, !noalias !10
  %index.next69 = add i64 %index68, 4
  %30 = icmp eq i64 %index.next69, 1996
  br i1 %30, label %middle.block46, label %vector.body45, !llvm.loop !15

middle.block46:                                   ; preds = %vector.body45
  br i1 false, label %.lr.ph6.us.preheader, label %scalar.ph47.preheader

._crit_edge7.us.loopexit:                         ; preds = %.lr.ph6.us
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit, %middle.block
  %31 = add nuw nsw i32 %5, 1
  %exitcond = icmp eq i32 %31, 500
  br i1 %exitcond, label %._crit_edge10.loopexit, label %._crit_edge.us

.lr.ph6.us:                                       ; preds = %.lr.ph6.us.preheader84, %.lr.ph6.us
  %indvars.iv29 = phi i64 [ %38, %.lr.ph6.us ], [ %indvars.iv29.ph, %.lr.ph6.us.preheader84 ]
  %32 = add nsw i64 %indvars.iv29, -1
  %33 = getelementptr inbounds double, double* %3, i64 %32
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv29
  %36 = load double, double* %35, align 8
  %37 = fadd double %34, %36
  %38 = add nuw nsw i64 %indvars.iv29, 1
  %39 = getelementptr inbounds double, double* %3, i64 %38
  %40 = load double, double* %39, align 8
  %41 = fadd double %37, %40
  %42 = fmul double %41, 3.333300e-01
  %43 = getelementptr inbounds double, double* %2, i64 %indvars.iv29
  store double %42, double* %43, align 8
  %44 = icmp slt i64 %38, 1999
  br i1 %44, label %.lr.ph6.us, label %._crit_edge7.us.loopexit, !llvm.loop !16

scalar.ph47:                                      ; preds = %scalar.ph47.preheader, %scalar.ph47
  %indvars.iv = phi i64 [ %51, %scalar.ph47 ], [ %indvars.iv.ph, %scalar.ph47.preheader ]
  %45 = add nsw i64 %indvars.iv, -1
  %46 = getelementptr inbounds double, double* %2, i64 %45
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %51 = add nuw nsw i64 %indvars.iv, 1
  %52 = getelementptr inbounds double, double* %2, i64 %51
  %53 = load double, double* %52, align 8
  %54 = fadd double %50, %53
  %55 = fmul double %54, 3.333300e-01
  %56 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %55, double* %56, align 8
  %57 = icmp slt i64 %51, 1999
  br i1 %57, label %scalar.ph47, label %.lr.ph6.us.preheader.loopexit, !llvm.loop !17

.lr.ph6.us.preheader.loopexit:                    ; preds = %scalar.ph47
  br label %.lr.ph6.us.preheader

.lr.ph6.us.preheader:                             ; preds = %.lr.ph6.us.preheader.loopexit, %middle.block46
  br i1 false, label %.lr.ph6.us.preheader84, label %min.iters.checked

.lr.ph6.us.preheader84:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph6.us.preheader
  %indvars.iv29.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.lr.ph6.us.preheader ], [ 1997, %middle.block ]
  br label %.lr.ph6.us

min.iters.checked:                                ; preds = %.lr.ph6.us.preheader
  br i1 false, label %.lr.ph6.us.preheader84, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %memcheck.conflict, label %.lr.ph6.us.preheader84, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %58 = add nsw i64 %offset.idx, -1
  %59 = getelementptr inbounds double, double* %3, i64 %58
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !18
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !18
  %63 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !18
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !18
  %67 = fadd <2 x double> %wide.load, %wide.load41
  %68 = fadd <2 x double> %wide.load40, %wide.load42
  %69 = add nuw nsw i64 %offset.idx, 1
  %70 = getelementptr inbounds double, double* %3, i64 %69
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !18
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !18
  %74 = fadd <2 x double> %67, %wide.load43
  %75 = fadd <2 x double> %68, %wide.load44
  %76 = fmul <2 x double> %74, <double 3.333300e-01, double 3.333300e-01>
  %77 = fmul <2 x double> %75, <double 3.333300e-01, double 3.333300e-01>
  %78 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %79 = bitcast double* %78 to <2 x double>*
  store <2 x double> %76, <2 x double>* %79, align 8, !alias.scope !21, !noalias !18
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x double>*
  store <2 x double> %77, <2 x double>* %81, align 8, !alias.scope !21, !noalias !18
  %index.next = add i64 %index, 4
  %82 = icmp eq i64 %index.next, 1996
  br i1 %82, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  br i1 false, label %._crit_edge7.us, label %.lr.ph6.us.preheader84

._crit_edge10.loopexit:                           ; preds = %._crit_edge7.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %._crit_edge.lr.ph, %4
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
  br i1 true, label %.lr.ph, label %._crit_edge3

.lr.ph:                                           ; preds = %2
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %16, %._crit_edge ]
  %8 = srem i32 %storemerge1, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge3.loopexit, label %7

._crit_edge3.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %2
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
