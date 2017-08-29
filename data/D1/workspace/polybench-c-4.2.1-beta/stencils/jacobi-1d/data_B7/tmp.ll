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
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(i32 2000, double* %12)
  br label %13

; <label>:13:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph:
  br label %3

; <label>:3:                                      ; preds = %3, %.lr.ph
  %indvars.iv1 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.1, %3 ]
  %4 = trunc i64 %indvars.iv1 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  %7 = insertelement <2 x double> undef, double %5, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  %9 = fadd <2 x double> %8, <double 2.000000e+00, double 3.000000e+00>
  %10 = fdiv <2 x double> %9, <double 2.000000e+03, double 2.000000e+03>
  %11 = extractelement <2 x double> %10, i32 0
  %12 = extractelement <2 x double> %10, i32 1
  store double %11, double* %6, align 8
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv1
  store double %12, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv1, 1
  %14 = trunc i64 %indvars.iv.next to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %17 = insertelement <2 x double> undef, double %15, i32 0
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  %19 = fadd <2 x double> %18, <double 2.000000e+00, double 3.000000e+00>
  %20 = fdiv <2 x double> %19, <double 2.000000e+03, double 2.000000e+03>
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  store double %21, double* %16, align 8
  %23 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  store double %22, double* %23, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv1, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %._crit_edge, label %3

._crit_edge:                                      ; preds = %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double* nocapture, double* nocapture) unnamed_addr #2 {
.preheader2.preheader.us.preheader:
  %scevgep = getelementptr double, double* %2, i64 1
  %scevgep34 = getelementptr double, double* %2, i64 1999
  %scevgep36 = getelementptr double, double* %3, i64 2000
  %scevgep50 = getelementptr double, double* %3, i64 1
  %scevgep52 = getelementptr double, double* %3, i64 1999
  %scevgep54 = getelementptr double, double* %2, i64 2000
  %bound056 = icmp ult double* %scevgep50, %scevgep54
  %bound157 = icmp ugt double* %scevgep52, %2
  %memcheck.conflict59 = and i1 %bound056, %bound157
  %bound0 = icmp ult double* %scevgep, %scevgep36
  %bound1 = icmp ugt double* %scevgep34, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  br label %vector.memcheck60

vector.memcheck60:                                ; preds = %.preheader._crit_edge.us, %.preheader2.preheader.us.preheader
  %.018.us = phi i32 [ %24, %.preheader._crit_edge.us ], [ 0, %.preheader2.preheader.us.preheader ]
  br i1 %memcheck.conflict59, label %.preheader2.us.preheader, label %vector.body45.preheader

vector.body45.preheader:                          ; preds = %vector.memcheck60
  br label %vector.body45

.preheader2.us.preheader.loopexit:                ; preds = %vector.body45
  br label %.preheader2.us.preheader

.preheader2.us.preheader:                         ; preds = %.preheader2.us.preheader.loopexit, %vector.memcheck60
  %indvars.iv5.us.ph = phi i64 [ 1, %vector.memcheck60 ], [ 1997, %.preheader2.us.preheader.loopexit ]
  br label %.preheader2.us

vector.body45:                                    ; preds = %vector.body45.preheader, %vector.body45
  %index62 = phi i64 [ %index.next63, %vector.body45 ], [ 0, %vector.body45.preheader ]
  %4 = shl i64 %index62, 1
  %offset.idx66 = or i64 %4, 1
  %5 = add nsw i64 %offset.idx66, -1
  %6 = getelementptr inbounds double, double* %2, i64 %5
  %7 = bitcast double* %6 to <4 x double>*
  %wide.vec70 = load <4 x double>, <4 x double>* %7, align 8, !alias.scope !1
  %strided.vec71 = shufflevector <4 x double> %wide.vec70, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec72 = shufflevector <4 x double> %wide.vec70, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %8 = fadd <2 x double> %strided.vec71, %strided.vec72
  %9 = add nuw nsw i64 %offset.idx66, 1
  %10 = getelementptr inbounds double, double* %2, i64 %9
  %11 = getelementptr double, double* %10, i64 -1
  %12 = bitcast double* %11 to <4 x double>*
  %wide.vec73 = load <4 x double>, <4 x double>* %12, align 8, !alias.scope !1
  %strided.vec75 = shufflevector <4 x double> %wide.vec73, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %13 = fadd <2 x double> %8, %strided.vec75
  %14 = fmul <2 x double> %13, <double 3.333300e-01, double 3.333300e-01>
  %15 = bitcast double* %10 to <4 x double>*
  %wide.vec76 = load <4 x double>, <4 x double>* %15, align 8, !alias.scope !1
  %strided.vec78 = shufflevector <4 x double> %wide.vec76, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %16 = fadd <4 x double> %wide.vec73, %wide.vec76
  %17 = shufflevector <4 x double> %16, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %18 = fadd <2 x double> %17, %strided.vec78
  %19 = fmul <2 x double> %18, <double 3.333300e-01, double 3.333300e-01>
  %20 = getelementptr inbounds double, double* %3, i64 %9
  %21 = getelementptr double, double* %20, i64 -1
  %22 = bitcast double* %21 to <4 x double>*
  %interleaved.vec79 = shufflevector <2 x double> %14, <2 x double> %19, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec79, <4 x double>* %22, align 8, !alias.scope !4, !noalias !1
  %index.next63 = add i64 %index62, 2
  %23 = icmp eq i64 %index.next63, 998
  br i1 %23, label %.preheader2.us.preheader.loopexit, label %vector.body45, !llvm.loop !6

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %24 = add nuw nsw i32 %.018.us, 1
  %exitcond25 = icmp eq i32 %24, 500
  br i1 %exitcond25, label %._crit_edge, label %vector.memcheck60

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.preheader.us
  %indvars.iv36.us = phi i64 [ %indvars.iv.next4.us.1, %.preheader.us ], [ %indvars.iv36.us.ph, %.preheader.us.preheader ]
  %25 = add nsw i64 %indvars.iv36.us, -1
  %26 = getelementptr inbounds double, double* %3, i64 %25
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds double, double* %3, i64 %indvars.iv36.us
  %29 = load double, double* %28, align 8
  %30 = fadd double %27, %29
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv36.us, 1
  %31 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us
  %32 = load double, double* %31, align 8
  %33 = fadd double %30, %32
  %34 = fmul double %33, 3.333300e-01
  %35 = getelementptr inbounds double, double* %2, i64 %indvars.iv36.us
  store double %34, double* %35, align 8
  %36 = getelementptr inbounds double, double* %3, i64 %indvars.iv36.us
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us
  %39 = load double, double* %38, align 8
  %40 = fadd double %37, %39
  %indvars.iv.next4.us.1 = add nsw i64 %indvars.iv36.us, 2
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us.1
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  %44 = fmul double %43, 3.333300e-01
  %45 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next4.us
  store double %44, double* %45, align 8
  %exitcond24.1 = icmp eq i64 %indvars.iv.next4.us.1, 1999
  br i1 %exitcond24.1, label %.preheader._crit_edge.us, label %.preheader.us, !llvm.loop !9

.preheader2.us:                                   ; preds = %.preheader2.us.preheader, %.preheader2.us
  %indvars.iv5.us = phi i64 [ %indvars.iv.next.us.1, %.preheader2.us ], [ %indvars.iv5.us.ph, %.preheader2.us.preheader ]
  %46 = add nsw i64 %indvars.iv5.us, -1
  %47 = getelementptr inbounds double, double* %2, i64 %46
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds double, double* %2, i64 %indvars.iv5.us
  %50 = load double, double* %49, align 8
  %51 = fadd double %48, %50
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv5.us, 1
  %52 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us
  %53 = load double, double* %52, align 8
  %54 = fadd double %51, %53
  %55 = fmul double %54, 3.333300e-01
  %56 = getelementptr inbounds double, double* %3, i64 %indvars.iv5.us
  store double %55, double* %56, align 8
  %57 = getelementptr inbounds double, double* %2, i64 %indvars.iv5.us
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us
  %60 = load double, double* %59, align 8
  %61 = fadd double %58, %60
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv5.us, 2
  %62 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us.1
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  %65 = fmul double %64, 3.333300e-01
  %66 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.us
  store double %65, double* %66, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, 1999
  br i1 %exitcond.1, label %vector.memcheck, label %.preheader2.us, !llvm.loop !10

vector.memcheck:                                  ; preds = %.preheader2.us
  br i1 %memcheck.conflict, label %.preheader.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

.preheader.us.preheader.loopexit:                 ; preds = %vector.body
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit, %vector.memcheck
  %indvars.iv36.us.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %.preheader.us.preheader.loopexit ]
  br label %.preheader.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %67 = shl i64 %index, 1
  %offset.idx = or i64 %67, 1
  %68 = add nsw i64 %offset.idx, -1
  %69 = getelementptr inbounds double, double* %3, i64 %68
  %70 = bitcast double* %69 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %70, align 8, !alias.scope !11
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec38 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %71 = fadd <2 x double> %strided.vec, %strided.vec38
  %72 = add nuw nsw i64 %offset.idx, 1
  %73 = getelementptr inbounds double, double* %3, i64 %72
  %74 = getelementptr double, double* %73, i64 -1
  %75 = bitcast double* %74 to <4 x double>*
  %wide.vec39 = load <4 x double>, <4 x double>* %75, align 8, !alias.scope !11
  %strided.vec41 = shufflevector <4 x double> %wide.vec39, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %76 = fadd <2 x double> %71, %strided.vec41
  %77 = fmul <2 x double> %76, <double 3.333300e-01, double 3.333300e-01>
  %78 = bitcast double* %73 to <4 x double>*
  %wide.vec42 = load <4 x double>, <4 x double>* %78, align 8, !alias.scope !11
  %strided.vec44 = shufflevector <4 x double> %wide.vec42, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %79 = fadd <4 x double> %wide.vec39, %wide.vec42
  %80 = shufflevector <4 x double> %79, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %81 = fadd <2 x double> %80, %strided.vec44
  %82 = fmul <2 x double> %81, <double 3.333300e-01, double 3.333300e-01>
  %83 = getelementptr inbounds double, double* %2, i64 %72
  %84 = getelementptr double, double* %83, i64 -1
  %85 = bitcast double* %84 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %77, <2 x double> %82, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %85, align 8, !alias.scope !14, !noalias !11
  %index.next = add i64 %index, 2
  %86 = icmp eq i64 %index.next, 998
  br i1 %86, label %.preheader.us.preheader.loopexit, label %vector.body, !llvm.loop !16

._crit_edge:                                      ; preds = %.preheader._crit_edge.us
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

.lr.ph:                                           ; preds = %11, %.lr.ph.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %11 ], [ 0, %.lr.ph.preheader ]
  %6 = trunc i64 %indvars.iv1 to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %11

; <label>:11:                                     ; preds = %.lr.ph, %9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %11
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
