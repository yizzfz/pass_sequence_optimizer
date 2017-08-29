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
  br i1 %4, label %5, label %9

; <label>:5:                                      ; preds = %2
  %6 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %6, align 1
  %7 = icmp eq i8 %strcmpload, 0
  br i1 %7, label %8, label %9

; <label>:8:                                      ; preds = %5
  tail call void @print_array(i32 2800, [2800 x i32]* %.cast)
  br label %9

; <label>:9:                                      ; preds = %5, %8, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [2800 x i32]* nocapture) #2 {
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %16, %2
  %indvars.iv20 = phi i64 [ 0, %2 ], [ %indvars.iv.next21, %16 ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %3 = mul nuw nsw i64 %indvars.iv, %indvars.iv20
  %4 = trunc i64 %3 to i32
  %5 = srem i32 %4, 7
  %6 = add nsw i32 %5, 1
  %7 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv20, i64 %indvars.iv
  %8 = add nuw nsw i64 %indvars.iv, %indvars.iv20
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 13
  %11 = icmp eq i32 %10, 0
  %12 = srem i32 %9, 7
  %13 = icmp eq i32 %12, 0
  %or.cond = or i1 %11, %13
  %14 = srem i32 %9, 11
  %15 = icmp eq i32 %14, 0
  %or.cond16 = or i1 %15, %or.cond
  %. = select i1 %or.cond16, i32 999, i32 %6
  store i32 %., i32* %7, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %16, label %.preheader

; <label>:16:                                     ; preds = %.preheader
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 2800
  br i1 %exitcond22, label %17, label %.preheader.preheader

; <label>:17:                                     ; preds = %16
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_floyd_warshall(i32, [2800 x i32]* nocapture) #2 {
  br label %.preheader3.preheader

.preheader3.preheader:                            ; preds = %18, %2
  %indvars.iv30 = phi i64 [ 0, %2 ], [ %indvars.iv.next31, %18 ]
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader3, %.preheader3.preheader
  %indvars.iv27 = phi i64 [ 0, %.preheader3.preheader ], [ %indvars.iv.next28, %.preheader3 ]
  %3 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv27, i64 %indvars.iv30
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next.1, %.preheader ]
  %4 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv27, i64 %indvars.iv
  %5 = load i32, i32* %4, align 4
  %6 = load i32, i32* %3, align 4
  %7 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv30, i64 %indvars.iv
  %8 = load i32, i32* %7, align 4
  %9 = add nsw i32 %8, %6
  %10 = icmp slt i32 %5, %9
  %. = select i1 %10, i32 %5, i32 %9
  store i32 %., i32* %4, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv27, i64 %indvars.iv.next
  %12 = load i32, i32* %11, align 4
  %13 = load i32, i32* %3, align 4
  %14 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv30, i64 %indvars.iv.next
  %15 = load i32, i32* %14, align 4
  %16 = add nsw i32 %15, %13
  %17 = icmp slt i32 %12, %16
  %..1 = select i1 %17, i32 %12, i32 %16
  store i32 %..1, i32* %11, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2800
  br i1 %exitcond.1, label %.preheader3, label %.preheader

.preheader3:                                      ; preds = %.preheader
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next28, 2800
  br i1 %exitcond29, label %18, label %.preheader.preheader

; <label>:18:                                     ; preds = %.preheader3
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next31, 2800
  br i1 %exitcond32, label %19, label %.preheader3.preheader

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [2800 x i32]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %19, %2
  %indvars.iv10 = phi i64 [ 0, %2 ], [ %indvars.iv.next11, %19 ]
  %7 = mul nuw nsw i64 %indvars.iv10, 2800
  br label %8

; <label>:8:                                      ; preds = %.preheader, %.preheader.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %.preheader

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %.preheader

.preheader:                                       ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv10, i64 %indvars.iv
  %17 = load i32, i32* %16, align 4
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %19, label %8

; <label>:19:                                     ; preds = %.preheader
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2800
  br i1 %exitcond12, label %20, label %.preheader.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
