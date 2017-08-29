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
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 7840000, i32 4) #3
  %4 = bitcast i8* %3 to [2800 x i32]*
  tail call void @init_array(i32 2800, [2800 x i32]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_floyd_warshall(i32 2800, [2800 x i32]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2800 x i32]*
  tail call void @print_array(i32 2800, [2800 x i32]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, [2800 x i32]*) #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %.loopexit.us ], [ 0, %.preheader.lr.ph..preheader.us_crit_edge ]
  br label %2

; <label>:2:                                      ; preds = %2, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %2 ], [ 0, %.preheader.us ]
  %3 = mul nuw nsw i64 %indvars.iv, %indvars.iv16
  %4 = trunc i64 %3 to i32
  %5 = srem i32 %4, 7
  %6 = add nsw i32 %5, 1
  %7 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv16, i64 %indvars.iv
  %8 = add nuw nsw i64 %indvars.iv, %indvars.iv16
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 13
  %11 = icmp eq i32 %10, 0
  %12 = srem i32 %9, 7
  %13 = icmp eq i32 %12, 0
  %or.cond = or i1 %11, %13
  %14 = srem i32 %9, 11
  %15 = icmp eq i32 %14, 0
  %or.cond20 = or i1 %or.cond, %15
  %. = select i1 %or.cond20, i32 999, i32 %6
  store i32 %., i32* %7, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %.loopexit.us, label %2

.loopexit.us:                                     ; preds = %2
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next17, 2800
  br i1 %exitcond21, label %.loopexit3, label %.preheader.us

.loopexit3:                                       ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_floyd_warshall(i32, [2800 x i32]*) #0 {
.preheader3.lr.ph..preheader3.us_crit_edge:
  br label %.preheader3.us..preheader.us.us_crit_edge

.preheader3.us..preheader.us.us_crit_edge:        ; preds = %.loopexit6.us, %.preheader3.lr.ph..preheader3.us_crit_edge
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %.loopexit6.us ], [ 0, %.preheader3.lr.ph..preheader3.us_crit_edge ]
  br label %.preheader.us.us

.loopexit6.us:                                    ; preds = %.loopexit.us.us.loopexit
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, 2800
  br i1 %exitcond, label %.loopexit7, label %.preheader3.us..preheader.us.us_crit_edge

.preheader.us.us:                                 ; preds = %.loopexit.us.us.loopexit, %.preheader3.us..preheader.us.us_crit_edge
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %.loopexit.us.us.loopexit ], [ 0, %.preheader3.us..preheader.us.us_crit_edge ]
  %2 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv32, i64 %indvars.iv36
  br label %.preheader.us.us.new

.loopexit.us.us.loopexit:                         ; preds = %.preheader.us.us.new
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, 2800
  br i1 %exitcond35, label %.loopexit6.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ 0, %.preheader.us.us ]
  %3 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv32, i64 %indvars.iv
  %4 = load i32, i32* %3, align 4
  %5 = load i32, i32* %2, align 4
  %6 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv36, i64 %indvars.iv
  %7 = load i32, i32* %6, align 4
  %8 = add nsw i32 %7, %5
  %9 = icmp slt i32 %4, %8
  %.39 = select i1 %9, i32 %4, i32 %8
  store i32 %.39, i32* %3, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv32, i64 %indvars.iv.next
  %11 = load i32, i32* %10, align 4
  %12 = load i32, i32* %2, align 4
  %13 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv36, i64 %indvars.iv.next
  %14 = load i32, i32* %13, align 4
  %15 = add nsw i32 %14, %12
  %16 = icmp slt i32 %11, %15
  %17 = select i1 %16, i32 %11, i32 %15
  store i32 %17, i32* %10, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond31.1 = icmp eq i64 %indvars.iv.next.1, 2800
  br i1 %exitcond31.1, label %.loopexit.us.us.loopexit, label %.preheader.us.us.new

.loopexit7:                                       ; preds = %.loopexit6.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [2800 x i32]*) #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %.loopexit.us ], [ 0, %.preheader.lr.ph..preheader.us_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv13, 2800
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %14 ], [ 0, %.preheader.us ]
  %8 = add nuw nsw i64 %6, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %14

; <label>:14:                                     ; preds = %7, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %17 = load i32, i32* %16, align 4
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %.loopexit.us, label %7

.loopexit.us:                                     ; preds = %14
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 2800
  br i1 %exitcond15, label %.loopexit3, label %.preheader.us

.loopexit3:                                       ; preds = %.loopexit.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
