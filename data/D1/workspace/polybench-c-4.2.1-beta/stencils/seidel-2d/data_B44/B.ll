; ModuleID = 'A.ll'
source_filename = "seidel-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_seidel_2d(i32 500, i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader.preheader.preheader, label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %2
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge, %.preheader.preheader.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next3, %.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %3 = trunc i64 %indvars.iv26 to i32
  %4 = sitofp i32 %3 to double
  br i1 true, label %.preheader.prol.loopexit, label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.preheader
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol, %.preheader.preheader
  %indvars.iv5.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.preheader.preheader ]
  br i1 false, label %.preheader._crit_edge, label %.preheader.preheader11

.preheader.preheader11:                           ; preds = %.preheader.prol.loopexit
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader11, %.preheader
  %indvars.iv5 = phi i64 [ %indvars.iv.next.1, %.preheader ], [ %indvars.iv5.unr.ph, %.preheader.preheader11 ]
  %7 = add nuw nsw i64 %indvars.iv5, 2
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %11 = add nsw i64 %indvars.iv5, 3
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %6, %15
  %17 = fadd <2 x double> %16, <double 2.000000e+00, double 2.000000e+00>
  %18 = fdiv <2 x double> %17, <double 2.000000e+03, double 2.000000e+03>
  %19 = bitcast double* %10 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv5, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %.preheader._crit_edge.loopexit, label %.preheader

.preheader._crit_edge.loopexit:                   ; preds = %.preheader
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %.preheader.prol.loopexit
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_seidel_2d(i32, i32, [2000 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader3.preheader.lr.ph, label %._crit_edge

.preheader3.preheader.lr.ph:                      ; preds = %3
  br i1 false, label %._crit_edge, label %.preheader3.preheader.preheader

.preheader3.preheader.preheader:                  ; preds = %.preheader3.preheader.lr.ph
  br label %.preheader3.preheader

.preheader3.preheader:                            ; preds = %.preheader3._crit_edge, %.preheader3.preheader.preheader
  %.0210 = phi i32 [ %33, %.preheader3._crit_edge ], [ 0, %.preheader3.preheader.preheader ]
  br i1 false, label %.preheader3._crit_edge, label %.preheader.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader3.preheader
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader3
  %indvar = phi i64 [ %indvar.next, %.preheader3 ], [ 0, %.preheader.preheader.preheader ]
  %indvars.iv48 = phi i64 [ %indvars.iv.next5, %.preheader3 ], [ 1, %.preheader.preheader.preheader ]
  %4 = add i64 %indvar, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %2, i64 %4, i64 0
  %5 = add nsw i64 %indvars.iv48, -1
  %6 = add nuw nsw i64 %indvars.iv48, 1
  %load_initial = load double, double* %scevgep, align 8
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %store_forwarded = phi double [ %load_initial, %.preheader.preheader ], [ %32, %.preheader ]
  %indvars.iv7 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %7 = add nsw i64 %indvars.iv7, -1
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %5, i64 %7
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %5, i64 %indvars.iv7
  %11 = load double, double* %10, align 8
  %12 = fadd double %9, %11
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %5, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = fadd double %12, %14
  %16 = fadd double %15, %store_forwarded
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv48, i64 %indvars.iv7
  %18 = load double, double* %17, align 8
  %19 = fadd double %16, %18
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv48, i64 %indvars.iv.next
  %21 = load double, double* %20, align 8
  %22 = fadd double %19, %21
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %6, i64 %7
  %24 = load double, double* %23, align 8
  %25 = fadd double %22, %24
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %6, i64 %indvars.iv7
  %27 = load double, double* %26, align 8
  %28 = fadd double %25, %27
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %6, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = fadd double %28, %30
  %32 = fdiv double %31, 9.000000e+00
  store double %32, double* %17, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1999
  br i1 %exitcond, label %.preheader3, label %.preheader

.preheader3:                                      ; preds = %.preheader
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond27 = icmp eq i64 %indvars.iv48, 1998
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond27, label %.preheader3._crit_edge.loopexit, label %.preheader.preheader

.preheader3._crit_edge.loopexit:                  ; preds = %.preheader3
  br label %.preheader3._crit_edge

.preheader3._crit_edge:                           ; preds = %.preheader3._crit_edge.loopexit, %.preheader3.preheader
  %33 = add nuw nsw i32 %.0210, 1
  %exitcond29 = icmp eq i32 %33, 500
  br i1 %exitcond29, label %._crit_edge.loopexit, label %.preheader3.preheader

._crit_edge.loopexit:                             ; preds = %.preheader3._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader3.preheader.lr.ph, %3
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %.preheader.preheader.preheader, label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %2
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge, %.preheader.preheader.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next3, %.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %7 = mul nsw i64 %indvars.iv26, 2000
  br label %8

; <label>:8:                                      ; preds = %.preheader.preheader, %.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %9 = add nsw i64 %indvars.iv5, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %.preheader

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %.preheader

.preheader:                                       ; preds = %13, %8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %.preheader._crit_edge, label %8

.preheader._crit_edge:                            ; preds = %.preheader
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond9, label %._crit_edge.loopexit, label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
