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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_seidel_2d(i32 500, i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %10

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge1

._crit_edge1:                                     ; preds = %6
  br label %10

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %10

; <label>:10:                                     ; preds = %._crit_edge1, %._crit_edge, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #2 {
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %2
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %..preheader_crit_edge ]
  %3 = trunc i64 %indvars.iv3 to i32
  %4 = sitofp i32 %3 to double
  br label %5

; <label>:5:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %6, %._crit_edge ]
  %6 = add nsw i64 %indvars.iv, 2
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fmul double %4, %8
  %10 = fadd double %9, 2.000000e+00
  %11 = fdiv double %10, 2.000000e+03
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv
  store double %11, double* %12, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = add nsw i64 %indvars.iv, 3
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = fmul double %4, %15
  %17 = fadd double %16, 2.000000e+00
  %18 = fdiv double %17, 2.000000e+03
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %exitcond.1 = icmp eq i64 %6, 2000
  br i1 %exitcond.1, label %20, label %._crit_edge

._crit_edge:                                      ; preds = %5
  br label %5

; <label>:20:                                     ; preds = %5
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 2000
  br i1 %exitcond, label %21, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %20
  br label %.preheader

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_seidel_2d(i32, i32, [2000 x double]*) unnamed_addr #2 {
  br label %.preheader3

.preheader3:                                      ; preds = %..preheader3_crit_edge, %3
  %4 = phi i32 [ 0, %3 ], [ %31, %..preheader3_crit_edge ]
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %.preheader3
  %indvars.iv4 = phi i64 [ 1, %.preheader3 ], [ %indvars.iv.next5, %..preheader_crit_edge ]
  %5 = add nsw i64 %indvars.iv4, -1
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %5, i64 0
  %.pre = load double, double* %.phi.trans.insert, align 8
  %.phi.trans.insert8 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %5, i64 1
  %.pre9 = load double, double* %.phi.trans.insert8, align 8
  %.phi.trans.insert10 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv4, i64 0
  %.pre11 = load double, double* %.phi.trans.insert10, align 8
  %.phi.trans.insert12 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv4, i64 1
  %.pre13 = load double, double* %.phi.trans.insert12, align 8
  %.phi.trans.insert14 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next5, i64 0
  %.pre15 = load double, double* %.phi.trans.insert14, align 8
  %.phi.trans.insert16 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next5, i64 1
  %.pre17 = load double, double* %.phi.trans.insert16, align 8
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %.preheader
  %7 = phi double [ %.pre17, %.preheader ], [ %26, %._crit_edge ]
  %8 = phi double [ %.pre15, %.preheader ], [ %7, %._crit_edge ]
  %9 = phi double [ %.pre13, %.preheader ], [ %21, %._crit_edge ]
  %10 = phi double [ %.pre11, %.preheader ], [ %28, %._crit_edge ]
  %11 = phi double [ %.pre9, %.preheader ], [ %15, %._crit_edge ]
  %12 = phi double [ %.pre, %.preheader ], [ %11, %._crit_edge ]
  %indvars.iv = phi i64 [ 1, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %13 = fadd double %12, %11
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %5, i64 %indvars.iv.next
  %15 = load double, double* %14, align 8
  %16 = fadd double %13, %15
  %17 = fadd double %16, %10
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv
  %19 = fadd double %17, %9
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv.next
  %21 = load double, double* %20, align 8
  %22 = fadd double %19, %21
  %23 = fadd double %22, %8
  %24 = fadd double %23, %7
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next5, i64 %indvars.iv.next
  %26 = load double, double* %25, align 8
  %27 = fadd double %24, %26
  %28 = fdiv double %27, 9.000000e+00
  store double %28, double* %18, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1999
  br i1 %exitcond, label %29, label %._crit_edge

._crit_edge:                                      ; preds = %6
  br label %6

; <label>:29:                                     ; preds = %6
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1999
  br i1 %exitcond6, label %30, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %29
  br label %.preheader

; <label>:30:                                     ; preds = %29
  %31 = add nuw nsw i32 %4, 1
  %exitcond7 = icmp eq i32 %31, 500
  br i1 %exitcond7, label %32, label %..preheader3_crit_edge

..preheader3_crit_edge:                           ; preds = %30
  br label %.preheader3

; <label>:32:                                     ; preds = %30
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %2
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %..preheader_crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv3, 2000
  br label %8

; <label>:8:                                      ; preds = %._crit_edge6, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge6 ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

._crit_edge:                                      ; preds = %8
  br label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %._crit_edge, %13
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %20, label %._crit_edge6

._crit_edge6:                                     ; preds = %15
  br label %8

; <label>:20:                                     ; preds = %15
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 2000
  br i1 %exitcond5, label %21, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %20
  br label %.preheader

; <label>:21:                                     ; preds = %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
