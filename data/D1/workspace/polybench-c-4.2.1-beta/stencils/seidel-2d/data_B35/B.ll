; ModuleID = 'A.ll'
source_filename = "seidel-2d.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_seidel_2d([2000 x double]* %4)
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
  tail call fastcc void @print_array([2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader

.preheader:                                       ; preds = %19, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %19 ]
  %2 = trunc i64 %indvars.iv4 to i32
  %3 = sitofp i32 %2 to double
  %4 = insertelement <2 x double> undef, double %3, i32 0
  %5 = shufflevector <2 x double> %4, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %6, %._crit_edge ]
  %6 = add nsw i64 %indvars.iv, 2
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %10 = add nsw i64 %indvars.iv, 3
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %8, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fmul <2 x double> %5, %14
  %16 = fadd <2 x double> %15, <double 2.000000e+00, double 2.000000e+00>
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = bitcast double* %9 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %exitcond.1 = icmp eq i64 %6, 2000
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 2000
  br i1 %exitcond, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_seidel_2d([2000 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader3

.preheader3:                                      ; preds = %28, %1
  %.026 = phi i32 [ 0, %1 ], [ %29, %28 ]
  br label %.preheader

.preheader:                                       ; preds = %27, %.preheader3
  %indvars.iv7 = phi i64 [ 1, %.preheader3 ], [ %3, %27 ]
  %2 = add nsw i64 %indvars.iv7, -1
  %3 = add nuw nsw i64 %indvars.iv7, 1
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %2, i64 0
  %.pre = load double, double* %.phi.trans.insert, align 8
  %.phi.trans.insert11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 0
  %.pre12 = load double, double* %.phi.trans.insert11, align 8
  %.phi.trans.insert13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %3, i64 0
  %.pre14 = load double, double* %.phi.trans.insert13, align 8
  %.phi.trans.insert15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %2, i64 1
  %.pre16 = load double, double* %.phi.trans.insert15, align 8
  %.phi.trans.insert17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 1
  %.pre18 = load double, double* %.phi.trans.insert17, align 8
  %.phi.trans.insert19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %3, i64 1
  %.pre20 = load double, double* %.phi.trans.insert19, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %4 = phi double [ %.pre20, %.preheader ], [ %24, %._crit_edge ]
  %5 = phi double [ %.pre18, %.preheader ], [ %19, %._crit_edge ]
  %6 = phi double [ %.pre16, %.preheader ], [ %13, %._crit_edge ]
  %7 = phi double [ %.pre14, %.preheader ], [ %4, %._crit_edge ]
  %8 = phi double [ %.pre12, %.preheader ], [ %26, %._crit_edge ]
  %9 = phi double [ %.pre, %.preheader ], [ %6, %._crit_edge ]
  %indvars.iv = phi i64 [ 1, %.preheader ], [ %11, %._crit_edge ]
  %10 = fadd double %9, %6
  %11 = add nuw nsw i64 %indvars.iv, 1
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %2, i64 %11
  %13 = load double, double* %12, align 8
  %14 = fadd double %10, %13
  %15 = fadd double %14, %8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv
  %17 = fadd double %15, %5
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %11
  %19 = load double, double* %18, align 8
  %20 = fadd double %17, %19
  %21 = fadd double %20, %7
  %22 = fadd double %21, %4
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %3, i64 %11
  %24 = load double, double* %23, align 8
  %25 = fadd double %22, %24
  %26 = fdiv double %25, 9.000000e+00
  store double %26, double* %16, align 8
  %exitcond = icmp eq i64 %11, 1999
  br i1 %exitcond, label %27, label %._crit_edge

; <label>:27:                                     ; preds = %._crit_edge
  %exitcond9 = icmp eq i64 %3, 1999
  br i1 %exitcond9, label %28, label %.preheader

; <label>:28:                                     ; preds = %27
  %29 = add nuw nsw i32 %.026, 1
  %exitcond10 = icmp eq i32 %29, 500
  br i1 %exitcond10, label %30, label %.preheader3

; <label>:30:                                     ; preds = %28
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %17, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 2000
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge7, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %17, label %._crit_edge7

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 2000
  br i1 %exitcond6, label %18, label %.preheader

; <label>:18:                                     ; preds = %17
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
