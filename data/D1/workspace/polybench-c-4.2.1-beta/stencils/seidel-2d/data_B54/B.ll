; ModuleID = 'A.ll'
source_filename = "seidel-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %.cast = bitcast i8* %3 to [2000 x double]*
  tail call void @init_array(i32 2000, [2000 x double]* %.cast)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_seidel_2d(i32 500, i32 2000, [2000 x double]* %.cast)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %4 = icmp sgt i32 %0, 42
  br i1 %4, label %5, label %._crit_edge

; <label>:5:                                      ; preds = %2
  %6 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %6, align 1
  %7 = icmp eq i8 %strcmpload, 0
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %5
  tail call void @print_array(i32 2000, [2000 x double]* %.cast)
  br label %._crit_edge

._crit_edge:                                      ; preds = %5, %2, %8
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [2000 x double]*) #2 {
  br label %.preheader

.preheader:                                       ; preds = %20, %2
  %indvars.iv10 = phi i64 [ 0, %2 ], [ %indvars.iv.next11, %20 ]
  %3 = trunc i64 %indvars.iv10 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = insertelement <2 x double> %5, double %4, i32 1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %7, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, 2
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv
  %11 = add nuw nsw i64 %indvars.iv, 3
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %6, %15
  %17 = fadd <2 x double> %16, <double 2.000000e+00, double 2.000000e+00>
  %18 = fdiv <2 x double> %17, <double 2.000000e+03, double 2.000000e+03>
  %19 = bitcast double* %10 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %exitcond.1 = icmp eq i64 %7, 2000
  br i1 %exitcond.1, label %20, label %._crit_edge

; <label>:20:                                     ; preds = %._crit_edge
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_seidel_2d(i32, i32, [2000 x double]*) #2 {
  br label %.preheader36

.preheader36:                                     ; preds = %30, %3
  %storemerge39 = phi i32 [ 0, %3 ], [ %31, %30 ]
  br label %.preheader

.preheader:                                       ; preds = %29, %.preheader36
  %indvars.iv40 = phi i64 [ 1, %.preheader36 ], [ %5, %29 ]
  %4 = add nsw i64 %indvars.iv40, -1
  %5 = add nuw nsw i64 %indvars.iv40, 1
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %4, i64 0
  %.pre = load double, double* %.phi.trans.insert, align 8
  %.phi.trans.insert44 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv40, i64 0
  %.pre45 = load double, double* %.phi.trans.insert44, align 8
  %.phi.trans.insert46 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %5, i64 0
  %.pre47 = load double, double* %.phi.trans.insert46, align 8
  %.phi.trans.insert48 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %4, i64 1
  %.pre49 = load double, double* %.phi.trans.insert48, align 8
  %.phi.trans.insert50 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv40, i64 1
  %.pre51 = load double, double* %.phi.trans.insert50, align 8
  %.phi.trans.insert52 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %5, i64 1
  %.pre53 = load double, double* %.phi.trans.insert52, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %6 = phi double [ %.pre53, %.preheader ], [ %26, %._crit_edge ]
  %7 = phi double [ %.pre51, %.preheader ], [ %21, %._crit_edge ]
  %8 = phi double [ %.pre49, %.preheader ], [ %15, %._crit_edge ]
  %9 = phi double [ %.pre47, %.preheader ], [ %6, %._crit_edge ]
  %10 = phi double [ %.pre45, %.preheader ], [ %28, %._crit_edge ]
  %11 = phi double [ %.pre, %.preheader ], [ %8, %._crit_edge ]
  %indvars.iv = phi i64 [ 1, %.preheader ], [ %13, %._crit_edge ]
  %12 = fadd double %11, %8
  %13 = add nuw nsw i64 %indvars.iv, 1
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %4, i64 %13
  %15 = load double, double* %14, align 8
  %16 = fadd double %12, %15
  %17 = fadd double %16, %10
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv40, i64 %indvars.iv
  %19 = fadd double %17, %7
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv40, i64 %13
  %21 = load double, double* %20, align 8
  %22 = fadd double %19, %21
  %23 = fadd double %22, %9
  %24 = fadd double %23, %6
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %5, i64 %13
  %26 = load double, double* %25, align 8
  %27 = fadd double %24, %26
  %28 = fdiv double %27, 9.000000e+00
  store double %28, double* %18, align 8
  %exitcond = icmp eq i64 %13, 1999
  br i1 %exitcond, label %29, label %._crit_edge

; <label>:29:                                     ; preds = %._crit_edge
  %exitcond42 = icmp eq i64 %5, 1999
  br i1 %exitcond42, label %30, label %.preheader

; <label>:30:                                     ; preds = %29
  %31 = add nuw nsw i32 %storemerge39, 1
  %exitcond43 = icmp eq i32 %31, 500
  br i1 %exitcond43, label %32, label %.preheader36

; <label>:32:                                     ; preds = %30
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [2000 x double]*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %18, %2
  %indvars.iv10 = phi i64 [ 0, %2 ], [ %indvars.iv.next11, %18 ]
  %7 = mul nuw nsw i64 %indvars.iv10, 2000
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge13
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge13, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %18, label %._crit_edge13

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
