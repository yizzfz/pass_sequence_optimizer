; ModuleID = 'A.ll'
source_filename = "floyd-warshall.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"path\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 7840000, i32 4) #4
  %4 = bitcast i8* %3 to [2800 x i32]*
  tail call fastcc void @init_array([2800 x i32]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_floyd_warshall([2800 x i32]* %4)
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
  %10 = bitcast i8* %3 to [2800 x i32]*
  tail call fastcc void @print_array([2800 x i32]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2800 x i32]*) unnamed_addr #2 {
  br label %.preheader

.preheader:                                       ; preds = %1, %20
  %.01927 = phi i32 [ 0, %1 ], [ %21, %20 ]
  %2 = sext i32 %.01927 to i64
  %3 = sext i32 %.01927 to i64
  %4 = sext i32 %.01927 to i64
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge22 ]
  %5 = mul nuw nsw i64 %indvars.iv, %3
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 7
  %8 = add nsw i32 %7, 1
  %9 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %2, i64 %indvars.iv
  %10 = add nuw nsw i64 %indvars.iv, %4
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 13
  %13 = icmp eq i32 %12, 0
  %14 = trunc i64 %10 to i32
  %15 = srem i32 %14, 7
  %16 = icmp eq i32 %15, 0
  %or.cond = or i1 %13, %16
  %17 = trunc i64 %10 to i32
  %18 = srem i32 %17, 11
  %19 = icmp eq i32 %18, 0
  %or.cond25 = or i1 %19, %or.cond
  %. = select i1 %or.cond25, i32 999, i32 %8
  store i32 %., i32* %9, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %20, label %._crit_edge22

; <label>:20:                                     ; preds = %._crit_edge22
  %21 = add nsw i32 %.01927, 1
  %22 = icmp slt i32 %21, 2800
  br i1 %22, label %.preheader, label %23

; <label>:23:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_floyd_warshall([2800 x i32]*) unnamed_addr #2 {
  br label %.preheader31

.preheader31:                                     ; preds = %1, %23
  %.034 = phi i32 [ 0, %1 ], [ %24, %23 ]
  %2 = sext i32 %.034 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader31, %20
  %.03033 = phi i32 [ 0, %.preheader31 ], [ %21, %20 ]
  %3 = sext i32 %.03033 to i64
  %4 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %3, i64 %2
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %5 ]
  %6 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %3, i64 %indvars.iv
  %7 = load i32, i32* %6, align 4
  %8 = load i32, i32* %4, align 4
  %9 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %2, i64 %indvars.iv
  %10 = load i32, i32* %9, align 4
  %11 = add nsw i32 %10, %8
  %12 = icmp slt i32 %7, %11
  %. = select i1 %12, i32 %7, i32 %11
  store i32 %., i32* %6, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %3, i64 %indvars.iv.next
  %14 = load i32, i32* %13, align 4
  %15 = load i32, i32* %4, align 4
  %16 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %2, i64 %indvars.iv.next
  %17 = load i32, i32* %16, align 4
  %18 = add nsw i32 %17, %15
  %19 = icmp slt i32 %14, %18
  %..1 = select i1 %19, i32 %14, i32 %18
  store i32 %..1, i32* %13, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2800
  br i1 %exitcond.1, label %20, label %5

; <label>:20:                                     ; preds = %5
  %21 = add nsw i32 %.03033, 1
  %22 = icmp slt i32 %21, 2800
  br i1 %22, label %.preheader, label %23

; <label>:23:                                     ; preds = %20
  %24 = add nsw i32 %.034, 1
  %25 = icmp slt i32 %24, 2800
  br i1 %25, label %.preheader31, label %26

; <label>:26:                                     ; preds = %23
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2800 x i32]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %1, %21
  %.01113 = phi i32 [ 0, %1 ], [ %22, %21 ]
  %6 = mul nuw nsw i32 %.01113, 2800
  %7 = sext i32 %.01113 to i64
  %8 = zext i32 %6 to i64
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %16 ]
  %10 = add i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %7, i64 %indvars.iv
  %19 = load i32, i32* %18, align 4
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %21, label %9

; <label>:21:                                     ; preds = %16
  %22 = add nsw i32 %.01113, 1
  %23 = icmp slt i32 %22, 2800
  br i1 %23, label %.preheader, label %24

; <label>:24:                                     ; preds = %21
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
