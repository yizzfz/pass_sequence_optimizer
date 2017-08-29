; ModuleID = 'A.ll'
source_filename = "floyd-warshall.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"path\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 7840000, i32 4) #4
  %.cast = bitcast i8* %3 to [2800 x i32]*
  tail call void @init_array(i32 2800, [2800 x i32]* %.cast)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_floyd_warshall(i32 2800, [2800 x i32]* %.cast)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %4 = icmp sgt i32 %0, 42
  br i1 %4, label %5, label %10

; <label>:5:                                      ; preds = %2
  %6 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %6, align 1
  %7 = icmp eq i8 %strcmpload, 0
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %5
  %9 = bitcast i8* %3 to [2800 x i32]*
  tail call void @print_array(i32 2800, [2800 x i32]* %9)
  br label %10

; <label>:10:                                     ; preds = %5, %8, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [2800 x i32]* nocapture) #2 {
  br label %.preheader

.preheader:                                       ; preds = %19, %2
  %indvars.iv20 = phi i64 [ 0, %2 ], [ %indvars.iv.next21, %19 ]
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %3 ]
  %4 = mul nuw nsw i64 %indvars.iv, %indvars.iv20
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 7
  %7 = add nsw i32 %6, 1
  %8 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv20, i64 %indvars.iv
  %9 = add nuw nsw i64 %indvars.iv, %indvars.iv20
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 13
  %12 = icmp eq i32 %11, 0
  %13 = trunc i64 %9 to i32
  %14 = srem i32 %13, 7
  %15 = icmp eq i32 %14, 0
  %or.cond = or i1 %12, %15
  %16 = trunc i64 %9 to i32
  %17 = srem i32 %16, 11
  %18 = icmp eq i32 %17, 0
  %or.cond16 = or i1 %18, %or.cond
  %. = select i1 %or.cond16, i32 999, i32 %7
  store i32 %., i32* %8, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %19, label %3

; <label>:19:                                     ; preds = %3
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 2800
  br i1 %exitcond22, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_floyd_warshall(i32, [2800 x i32]* nocapture) #2 {
  br label %.preheader23

.preheader23:                                     ; preds = %20, %2
  %indvars.iv29 = phi i64 [ 0, %2 ], [ %indvars.iv.next30, %20 ]
  br label %.preheader

.preheader:                                       ; preds = %19, %.preheader23
  %indvars.iv27 = phi i64 [ 0, %.preheader23 ], [ %indvars.iv.next28, %19 ]
  %3 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv27, i64 %indvars.iv29
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %4 ]
  %5 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv27, i64 %indvars.iv
  %6 = load i32, i32* %5, align 4
  %7 = load i32, i32* %3, align 4
  %8 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv29, i64 %indvars.iv
  %9 = load i32, i32* %8, align 4
  %10 = add nsw i32 %9, %7
  %11 = icmp slt i32 %6, %10
  %. = select i1 %11, i32 %6, i32 %10
  store i32 %., i32* %5, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv27, i64 %indvars.iv.next
  %13 = load i32, i32* %12, align 4
  %14 = load i32, i32* %3, align 4
  %15 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv29, i64 %indvars.iv.next
  %16 = load i32, i32* %15, align 4
  %17 = add nsw i32 %16, %14
  %18 = icmp slt i32 %13, %17
  %..1 = select i1 %18, i32 %13, i32 %17
  store i32 %..1, i32* %12, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2800
  br i1 %exitcond.1, label %19, label %4

; <label>:19:                                     ; preds = %4
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next28, 2800
  br i1 %exitcond, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next30, 2800
  br i1 %exitcond31, label %21, label %.preheader23

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [2800 x i32]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %20, %2
  %indvars.iv10 = phi i64 [ 0, %2 ], [ %indvars.iv.next11, %20 ]
  %7 = mul nuw nsw i64 %indvars.iv10, 2800
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %15 ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %8, %13
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv10, i64 %indvars.iv
  %18 = load i32, i32* %17, align 4
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %20, label %8

; <label>:20:                                     ; preds = %15
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2800
  br i1 %exitcond12, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
