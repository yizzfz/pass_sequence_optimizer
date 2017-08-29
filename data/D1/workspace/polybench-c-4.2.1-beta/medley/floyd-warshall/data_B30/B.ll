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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
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
  tail call fastcc void @print_array([2800 x i32]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2800 x i32]* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %1
  %indvars.iv12 = phi i64 [ 0, %1 ], [ %indvars.iv.next13, %18 ]
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge10, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next, %._crit_edge10 ]
  %2 = mul nsw i64 %indvars.iv, %indvars.iv12
  %3 = trunc i64 %2 to i32
  %4 = srem i32 %3, 7
  %5 = add nsw i32 %4, 1
  %6 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv12, i64 %indvars.iv
  store i32 %5, i32* %6, align 4
  %7 = add nsw i64 %indvars.iv, %indvars.iv12
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 13
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %._crit_edge7, label %11

; <label>:11:                                     ; preds = %._crit_edge11
  %12 = srem i32 %8, 7
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %._crit_edge7, label %14

; <label>:14:                                     ; preds = %11
  %15 = srem i32 %8, 11
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %._crit_edge7, label %._crit_edge10

._crit_edge7:                                     ; preds = %14, %11, %._crit_edge11
  store i32 999, i32* %6, align 4
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %14, %._crit_edge7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %17 = icmp slt i64 %indvars.iv.next, 2800
  br i1 %17, label %._crit_edge11, label %18

; <label>:18:                                     ; preds = %._crit_edge10
  %indvars.iv.next13 = add nuw i64 %indvars.iv12, 1
  %19 = icmp slt i64 %indvars.iv.next13, 2800
  br i1 %19, label %._crit_edge, label %20

; <label>:20:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_floyd_warshall([2800 x i32]* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %22, %1
  %indvars.iv8 = phi i64 [ 0, %1 ], [ %indvars.iv.next9, %22 ]
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %20, %._crit_edge
  %indvars.iv6 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next7, %20 ]
  %2 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv6, i64 %indvars.iv8
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %27, %._crit_edge1
  %indvars.iv = phi i64 [ 0, %._crit_edge1 ], [ %indvars.iv.next.1, %27 ]
  %3 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %4 = load i32, i32* %3, align 4
  %5 = load i32, i32* %2, align 4
  %6 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %7 = load i32, i32* %6, align 4
  %8 = add nsw i32 %7, %5
  %9 = icmp slt i32 %4, %8
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %._crit_edge5
  br label %._crit_edge5.110

; <label>:11:                                     ; preds = %._crit_edge5
  br label %._crit_edge5.110

._crit_edge5.110:                                 ; preds = %10, %11
  %12 = phi i32 [ %4, %10 ], [ %8, %11 ]
  store i32 %12, i32* %3, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv6, i64 %indvars.iv.next
  %14 = load i32, i32* %13, align 4
  %15 = load i32, i32* %2, align 4
  %16 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv8, i64 %indvars.iv.next
  %17 = load i32, i32* %16, align 4
  %18 = add nsw i32 %17, %15
  %19 = icmp slt i32 %14, %18
  br i1 %19, label %26, label %25

; <label>:20:                                     ; preds = %27
  %indvars.iv.next7 = add nuw i64 %indvars.iv6, 1
  %21 = icmp slt i64 %indvars.iv.next7, 2800
  br i1 %21, label %._crit_edge1, label %22

; <label>:22:                                     ; preds = %20
  %indvars.iv.next9 = add nuw i64 %indvars.iv8, 1
  %23 = icmp slt i64 %indvars.iv.next9, 2800
  br i1 %23, label %._crit_edge, label %24

; <label>:24:                                     ; preds = %22
  ret void

; <label>:25:                                     ; preds = %._crit_edge5.110
  br label %27

; <label>:26:                                     ; preds = %._crit_edge5.110
  br label %27

; <label>:27:                                     ; preds = %26, %25
  %28 = phi i32 [ %14, %26 ], [ %18, %25 ]
  store i32 %28, i32* %13, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %29 = icmp slt i64 %indvars.iv.next.1, 2800
  br i1 %29, label %._crit_edge5, label %20
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2800 x i32]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %1
  %indvars.iv6 = phi i64 [ 0, %1 ], [ %indvars.iv.next7, %18 ]
  %6 = mul nsw i64 %indvars.iv6, 2800
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge4, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next, %._crit_edge4 ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge4

; <label>:11:                                     ; preds = %._crit_edge5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge5, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %15 = load i32, i32* %14, align 4
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %15) #6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %17 = icmp slt i64 %indvars.iv.next, 2800
  br i1 %17, label %._crit_edge5, label %18

; <label>:18:                                     ; preds = %._crit_edge4
  %indvars.iv.next7 = add nuw i64 %indvars.iv6, 1
  %19 = icmp slt i64 %indvars.iv.next7, 2800
  br i1 %19, label %._crit_edge, label %20

; <label>:20:                                     ; preds = %18
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
