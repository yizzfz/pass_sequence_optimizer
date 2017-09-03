; ModuleID = 'B.ll'
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
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_seidel_2d(i32 500, i32 2000, [2000 x double]* %4)
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
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %6, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #2 {
._crit_edge.lr.ph:
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge3.us, %._crit_edge.lr.ph
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge3.us ], [ 0, %._crit_edge.lr.ph ]
  %2 = trunc i64 %indvars.iv6 to i32
  %3 = sitofp i32 %2 to double
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge.us.new ], [ 0, %._crit_edge.us ]
  %4 = add nuw nsw i64 %indvars.iv, 2
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = fmul double %3, %6
  %8 = fadd double %7, 2.000000e+00
  %9 = fdiv double %8, 2.000000e+03
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  store double %9, double* %10, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = add nsw i64 %indvars.iv, 3
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = fmul double %3, %13
  %15 = fadd double %14, 2.000000e+00
  %16 = fdiv double %15, 2.000000e+03
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv.next
  store double %16, double* %17, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond11.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond11.1, label %._crit_edge3.us, label %._crit_edge.us.new

._crit_edge3.us:                                  ; preds = %._crit_edge.us.new
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, 2000
  br i1 %exitcond, label %._crit_edge5, label %._crit_edge.us

._crit_edge5:                                     ; preds = %._crit_edge3.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_seidel_2d(i32, i32, [2000 x double]* nocapture) unnamed_addr #2 {
._crit_edge.lr.ph:
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge7, %._crit_edge.lr.ph
  %.028 = phi i32 [ 0, %._crit_edge.lr.ph ], [ %32, %._crit_edge7 ]
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge5, %._crit_edge
  %indvar = phi i64 [ 0, %._crit_edge ], [ %indvar.next, %._crit_edge5 ]
  %indvars.iv10 = phi i64 [ 1, %._crit_edge ], [ %indvars.iv.next11, %._crit_edge5 ]
  %3 = add i64 %indvar, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %2, i64 %3, i64 0
  %4 = add nsw i64 %indvars.iv10, -1
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %load_initial = load double, double* %scevgep, align 8
  br label %5

; <label>:5:                                      ; preds = %5, %._crit_edge3
  %store_forwarded = phi double [ %load_initial, %._crit_edge3 ], [ %31, %5 ]
  %indvars.iv = phi i64 [ 1, %._crit_edge3 ], [ %indvars.iv.next, %5 ]
  %6 = add nsw i64 %indvars.iv, -1
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %4, i64 %6
  %8 = load double, double* %7, align 8
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %4, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = fadd double %8, %10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %4, i64 %indvars.iv.next
  %13 = load double, double* %12, align 8
  %14 = fadd double %11, %13
  %15 = fadd double %14, %store_forwarded
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = fadd double %15, %17
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv.next
  %20 = load double, double* %19, align 8
  %21 = fadd double %18, %20
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next11, i64 %6
  %23 = load double, double* %22, align 8
  %24 = fadd double %21, %23
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next11, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fadd double %24, %26
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next11, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = fadd double %27, %29
  %31 = fdiv double %30, 9.000000e+00
  store double %31, double* %16, align 8
  %exitcond16 = icmp eq i64 %indvars.iv.next, 1999
  br i1 %exitcond16, label %._crit_edge5, label %5

._crit_edge5:                                     ; preds = %5
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 1999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond13, label %._crit_edge7, label %._crit_edge3

._crit_edge7:                                     ; preds = %._crit_edge5
  %32 = add nuw nsw i32 %.028, 1
  %exitcond14 = icmp eq i32 %32, 500
  br i1 %exitcond14, label %._crit_edge9, label %._crit_edge

._crit_edge9:                                     ; preds = %._crit_edge7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge4.us, %._crit_edge.us.preheader
  %indvars.iv7 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next8, %._crit_edge4.us ]
  %6 = mul nsw i64 %indvars.iv7, 2000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2.us ], [ 0, %._crit_edge.us ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge2.us

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %12, %7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond12, label %._crit_edge4.us, label %7

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond, label %._crit_edge6, label %._crit_edge.us

._crit_edge6:                                     ; preds = %._crit_edge4.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
