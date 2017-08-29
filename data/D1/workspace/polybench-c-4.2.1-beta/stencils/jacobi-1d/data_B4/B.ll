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
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 2000, double* %5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph:
  %scevgep = getelementptr double, double* %1, i64 2000
  %scevgep4 = getelementptr double, double* %2, i64 2000
  %bound0 = icmp ugt double* %scevgep4, %1
  %bound1 = icmp ugt double* %scevgep, %2
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %._crit_edge2.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph
  br label %vector.body

._crit_edge2.preheader:                           ; preds = %.lr.ph
  br label %._crit_edge2

vector.body:                                      ; preds = %vector.body.preheader, %vector.body.vector.body_crit_edge
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %vec.ind6 = phi <2 x i32> [ %vec.ind.next7, %vector.body.vector.body_crit_edge ], [ <i32 0, i32 1>, %vector.body.preheader ]
  %3 = sitofp <2 x i32> %vec.ind6 to <2 x double>
  %4 = fadd <2 x double> %3, <double 2.000000e+00, double 2.000000e+00>
  %5 = fdiv <2 x double> %4, <double 2.000000e+03, double 2.000000e+03>
  %6 = getelementptr inbounds double, double* %1, i64 %index
  %7 = bitcast double* %6 to <2 x double>*
  store <2 x double> %5, <2 x double>* %7, align 8, !alias.scope !1, !noalias !4
  %8 = fadd <2 x double> %3, <double 3.000000e+00, double 3.000000e+00>
  %9 = fdiv <2 x double> %8, <double 2.000000e+03, double 2.000000e+03>
  %10 = getelementptr inbounds double, double* %2, i64 %index
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> %9, <2 x double>* %11, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %12 = icmp eq i64 %index.next, 2000
  br i1 %12, label %._crit_edge.loopexit8, label %vector.body.vector.body_crit_edge, !llvm.loop !6

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %vec.ind.next7 = add <2 x i32> %vec.ind6, <i32 2, i32 2>
  br label %vector.body

._crit_edge2:                                     ; preds = %._crit_edge2.preheader, %._crit_edge2
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %._crit_edge2 ], [ 0, %._crit_edge2.preheader ]
  %13 = trunc i64 %indvars.iv1 to i32
  %14 = sitofp i32 %13 to double
  %15 = fadd double %14, 2.000000e+00
  %16 = fdiv double %15, 2.000000e+03
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  store double %16, double* %17, align 8
  %18 = fadd double %14, 3.000000e+00
  %19 = fdiv double %18, 2.000000e+03
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv1
  store double %19, double* %20, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %._crit_edge2, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %._crit_edge2
  br label %._crit_edge

._crit_edge.loopexit8:                            ; preds = %vector.body
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit8, %._crit_edge.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double* nocapture, double* nocapture) unnamed_addr #2 {
._crit_edge.preheader.lr.ph:
  %scevgep = getelementptr double, double* %2, i64 1
  %scevgep38 = getelementptr double, double* %2, i64 1999
  %scevgep40 = getelementptr double, double* %3, i64 2000
  %scevgep54 = getelementptr double, double* %3, i64 1
  %scevgep56 = getelementptr double, double* %3, i64 1999
  %scevgep58 = getelementptr double, double* %2, i64 2000
  %bound060 = icmp ult double* %scevgep54, %scevgep58
  %bound161 = icmp ugt double* %scevgep56, %2
  %found.conflict62 = and i1 %bound060, %bound161
  %bound0 = icmp ult double* %scevgep, %scevgep40
  %bound1 = icmp ugt double* %scevgep38, %3
  %found.conflict = and i1 %bound0, %bound1
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge2._crit_edge.us, %._crit_edge.preheader.lr.ph
  %.017.us = phi i32 [ 0, %._crit_edge.preheader.lr.ph ], [ %23, %._crit_edge2._crit_edge.us ]
  br i1 %found.conflict62, label %._crit_edge.us.preheader, label %vector.body49.preheader

vector.body49.preheader:                          ; preds = %._crit_edge.preheader.us
  br label %vector.body49

._crit_edge.us.preheader.loopexit:                ; preds = %vector.body49
  br label %._crit_edge.us.preheader

._crit_edge.us.preheader:                         ; preds = %._crit_edge.us.preheader.loopexit, %._crit_edge.preheader.us
  %indvars.iv3.us.ph = phi i64 [ 1, %._crit_edge.preheader.us ], [ 1997, %._crit_edge.us.preheader.loopexit ]
  br label %._crit_edge.us

vector.body49:                                    ; preds = %vector.body49.preheader, %vector.body49
  %index66 = phi i64 [ %index.next67, %vector.body49 ], [ 0, %vector.body49.preheader ]
  %4 = shl i64 %index66, 1
  %offset.idx70 = or i64 %4, 1
  %5 = getelementptr inbounds double, double* %2, i64 %4
  %6 = bitcast double* %5 to <4 x double>*
  %wide.vec74 = load <4 x double>, <4 x double>* %6, align 8, !alias.scope !10
  %strided.vec75 = shufflevector <4 x double> %wide.vec74, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec76 = shufflevector <4 x double> %wide.vec74, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %7 = fadd <2 x double> %strided.vec75, %strided.vec76
  %8 = add nuw nsw i64 %offset.idx70, 1
  %9 = getelementptr inbounds double, double* %2, i64 %8
  %10 = getelementptr double, double* %9, i64 -1
  %11 = bitcast double* %10 to <4 x double>*
  %wide.vec77 = load <4 x double>, <4 x double>* %11, align 8, !alias.scope !10
  %strided.vec79 = shufflevector <4 x double> %wide.vec77, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %12 = fadd <2 x double> %7, %strided.vec79
  %13 = fmul <2 x double> %12, <double 3.333300e-01, double 3.333300e-01>
  %14 = bitcast double* %9 to <4 x double>*
  %wide.vec80 = load <4 x double>, <4 x double>* %14, align 8, !alias.scope !10
  %strided.vec82 = shufflevector <4 x double> %wide.vec80, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %15 = fadd <4 x double> %wide.vec77, %wide.vec80
  %16 = shufflevector <4 x double> %15, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %17 = fadd <2 x double> %16, %strided.vec82
  %18 = fmul <2 x double> %17, <double 3.333300e-01, double 3.333300e-01>
  %19 = getelementptr inbounds double, double* %3, i64 %8
  %20 = getelementptr double, double* %19, i64 -1
  %21 = bitcast double* %20 to <4 x double>*
  %interleaved.vec83 = shufflevector <2 x double> %13, <2 x double> %18, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec83, <4 x double>* %21, align 8, !alias.scope !13, !noalias !10
  %index.next67 = add i64 %index66, 2
  %22 = icmp eq i64 %index.next67, 998
  br i1 %22, label %._crit_edge.us.preheader.loopexit, label %vector.body49, !llvm.loop !15

._crit_edge2._crit_edge.us:                       ; preds = %._crit_edge2.us
  %23 = add nuw nsw i32 %.017.us, 1
  %exitcond23 = icmp eq i32 %23, 500
  br i1 %exitcond23, label %._crit_edge8, label %._crit_edge.preheader.us

._crit_edge2.us:                                  ; preds = %._crit_edge2.us.preheader, %._crit_edge2.us
  %indvars.iv5.us = phi i64 [ %indvars.iv.next4.us.1, %._crit_edge2.us ], [ %indvars.iv5.us.ph, %._crit_edge2.us.preheader ]
  %24 = add nsw i64 %indvars.iv5.us, -1
  %25 = getelementptr inbounds double, double* %3, i64 %24
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds double, double* %3, i64 %indvars.iv5.us
  %28 = load double, double* %27, align 8
  %29 = fadd double %26, %28
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv5.us, 1
  %30 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us
  %31 = load double, double* %30, align 8
  %32 = fadd double %29, %31
  %33 = fmul double %32, 3.333300e-01
  %34 = getelementptr inbounds double, double* %2, i64 %indvars.iv5.us
  store double %33, double* %34, align 8
  %35 = load double, double* %27, align 8
  %36 = load double, double* %30, align 8
  %37 = fadd double %35, %36
  %indvars.iv.next4.us.1 = add nsw i64 %indvars.iv5.us, 2
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us.1
  %39 = load double, double* %38, align 8
  %40 = fadd double %37, %39
  %41 = fmul double %40, 3.333300e-01
  %42 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next4.us
  store double %41, double* %42, align 8
  %exitcond22.1 = icmp eq i64 %indvars.iv.next4.us.1, 1999
  br i1 %exitcond22.1, label %._crit_edge2._crit_edge.us, label %._crit_edge2.us, !llvm.loop !16

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge.us
  %indvars.iv3.us = phi i64 [ %indvars.iv.next.us.1, %._crit_edge.us ], [ %indvars.iv3.us.ph, %._crit_edge.us.preheader ]
  %43 = add nsw i64 %indvars.iv3.us, -1
  %44 = getelementptr inbounds double, double* %2, i64 %43
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds double, double* %2, i64 %indvars.iv3.us
  %47 = load double, double* %46, align 8
  %48 = fadd double %45, %47
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv3.us, 1
  %49 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us
  %50 = load double, double* %49, align 8
  %51 = fadd double %48, %50
  %52 = fmul double %51, 3.333300e-01
  %53 = getelementptr inbounds double, double* %3, i64 %indvars.iv3.us
  store double %52, double* %53, align 8
  %54 = load double, double* %46, align 8
  %55 = load double, double* %49, align 8
  %56 = fadd double %54, %55
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv3.us, 2
  %57 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us.1
  %58 = load double, double* %57, align 8
  %59 = fadd double %56, %58
  %60 = fmul double %59, 3.333300e-01
  %61 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.us
  store double %60, double* %61, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, 1999
  br i1 %exitcond.1, label %vector.memcheck, label %._crit_edge.us, !llvm.loop !17

vector.memcheck:                                  ; preds = %._crit_edge.us
  br i1 %found.conflict, label %._crit_edge2.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

._crit_edge2.us.preheader.loopexit:               ; preds = %vector.body
  br label %._crit_edge2.us.preheader

._crit_edge2.us.preheader:                        ; preds = %._crit_edge2.us.preheader.loopexit, %vector.memcheck
  %indvars.iv5.us.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %._crit_edge2.us.preheader.loopexit ]
  br label %._crit_edge2.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %62 = shl i64 %index, 1
  %offset.idx = or i64 %62, 1
  %63 = getelementptr inbounds double, double* %3, i64 %62
  %64 = bitcast double* %63 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %64, align 8, !alias.scope !18
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec42 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %65 = fadd <2 x double> %strided.vec, %strided.vec42
  %66 = add nuw nsw i64 %offset.idx, 1
  %67 = getelementptr inbounds double, double* %3, i64 %66
  %68 = getelementptr double, double* %67, i64 -1
  %69 = bitcast double* %68 to <4 x double>*
  %wide.vec43 = load <4 x double>, <4 x double>* %69, align 8, !alias.scope !18
  %strided.vec45 = shufflevector <4 x double> %wide.vec43, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %70 = fadd <2 x double> %65, %strided.vec45
  %71 = fmul <2 x double> %70, <double 3.333300e-01, double 3.333300e-01>
  %72 = bitcast double* %67 to <4 x double>*
  %wide.vec46 = load <4 x double>, <4 x double>* %72, align 8, !alias.scope !18
  %strided.vec48 = shufflevector <4 x double> %wide.vec46, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %73 = fadd <4 x double> %wide.vec43, %wide.vec46
  %74 = shufflevector <4 x double> %73, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %75 = fadd <2 x double> %74, %strided.vec48
  %76 = fmul <2 x double> %75, <double 3.333300e-01, double 3.333300e-01>
  %77 = getelementptr inbounds double, double* %2, i64 %66
  %78 = getelementptr double, double* %77, i64 -1
  %79 = bitcast double* %78 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %71, <2 x double> %76, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %79, align 8, !alias.scope !21, !noalias !18
  %index.next = add i64 %index, 2
  %80 = icmp eq i64 %index.next, 998
  br i1 %80, label %._crit_edge2.us.preheader.loopexit, label %vector.body, !llvm.loop !23

._crit_edge8:                                     ; preds = %._crit_edge2._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph.preheader
  %indvars.iv1 = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv1 to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge3, label %.lr.ph

._crit_edge3:                                     ; preds = %._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %17) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
