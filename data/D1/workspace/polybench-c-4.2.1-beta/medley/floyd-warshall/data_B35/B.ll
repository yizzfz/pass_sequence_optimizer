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
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca [2800 x [2800 x i32]]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 2800, i32* %5, align 4
  %7 = call i8* @polybench_alloc_data(i64 7840000, i32 4) #4
  %8 = bitcast [2800 x [2800 x i32]]** %6 to i8**
  store i8* %7, i8** %8, align 8
  %9 = bitcast i8* %7 to [2800 x i32]*
  call void @init_array([2800 x i32]* %9)
  call void (...) @polybench_timer_start() #4
  %10 = load i32, i32* %5, align 4
  %11 = bitcast i8* %7 to [2800 x i32]*
  call void @kernel_floyd_warshall(i32 %10, [2800 x i32]* %11)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %12 = load i32, i32* %3, align 4
  %13 = icmp sgt i32 %12, 42
  br i1 %13, label %14, label %22

; <label>:14:                                     ; preds = %2
  %15 = load i8**, i8*** %4, align 8
  %16 = load i8*, i8** %15, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %22

; <label>:18:                                     ; preds = %14
  %19 = load i32, i32* %5, align 4
  %20 = bitcast [2800 x [2800 x i32]]** %6 to [2800 x i32]**
  %21 = load [2800 x i32]*, [2800 x i32]** %20, align 8
  call void @print_array(i32 %19, [2800 x i32]* %21)
  br label %22

; <label>:22:                                     ; preds = %14, %18, %2
  %23 = bitcast [2800 x [2800 x i32]]** %6 to i8**
  %24 = load i8*, i8** %23, align 8
  call void @free(i8* %24) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([2800 x i32]* nocapture) #2 {
  br label %.preheader

.preheader:                                       ; preds = %1, %26
  %indvars.iv48 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %26 ]
  br label %2

; <label>:2:                                      ; preds = %.preheader, %24
  %indvars.iv6 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %24 ]
  %3 = mul nuw nsw i64 %indvars.iv48, %indvars.iv6
  %4 = trunc i64 %3 to i32
  %5 = srem i32 %4, 7
  %6 = add nsw i32 %5, 1
  %7 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv48, i64 %indvars.iv6
  store i32 %6, i32* %7, align 4
  %8 = add nuw nsw i64 %indvars.iv48, %indvars.iv6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 13
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %22, label %12

; <label>:12:                                     ; preds = %2
  %13 = add nuw nsw i64 %indvars.iv48, %indvars.iv6
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 7
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %22, label %17

; <label>:17:                                     ; preds = %12
  %18 = add nuw nsw i64 %indvars.iv48, %indvars.iv6
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 11
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %17, %12, %2
  %23 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv48, i64 %indvars.iv6
  store i32 999, i32* %23, align 4
  br label %24

; <label>:24:                                     ; preds = %17, %22
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %25 = icmp slt i64 %indvars.iv.next, 2800
  br i1 %25, label %2, label %26

; <label>:26:                                     ; preds = %24
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv48, 1
  %27 = icmp slt i64 %indvars.iv.next5, 2800
  br i1 %27, label %.preheader, label %28

; <label>:28:                                     ; preds = %26
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_floyd_warshall(i32, [2800 x i32]* nocapture) #2 {
  %3 = sext i32 %0 to i64
  %4 = sext i32 %0 to i64
  %5 = sext i32 %0 to i64
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader3.preheader, label %.loopexit24

.preheader3.preheader:                            ; preds = %2
  %7 = icmp sgt i32 %0, 0
  %8 = icmp sgt i32 %0, 0
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.preheader, %.loopexit23
  %indvars.iv1219 = phi i64 [ %indvars.iv.next13, %.loopexit23 ], [ 0, %.preheader3.preheader ]
  br i1 %7, label %.preheader.preheader, label %.loopexit23

.preheader.preheader:                             ; preds = %.preheader3
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.loopexit
  %indvars.iv1015 = phi i64 [ %indvars.iv.next11, %.loopexit ], [ 0, %.preheader.preheader ]
  %9 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv1015, i64 %indvars.iv1219
  %10 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv1015, i64 %indvars.iv1219
  br i1 %8, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %26
  %indvars.iv14 = phi i64 [ %indvars.iv.next, %26 ], [ 0, %.lr.ph.preheader ]
  %11 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv1015, i64 %indvars.iv14
  %12 = load i32, i32* %11, align 4
  %13 = load i32, i32* %9, align 4
  %14 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv1219, i64 %indvars.iv14
  %15 = load i32, i32* %14, align 4
  %16 = add nsw i32 %13, %15
  %17 = icmp slt i32 %12, %16
  br i1 %17, label %18, label %21

; <label>:18:                                     ; preds = %.lr.ph
  %19 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv1015, i64 %indvars.iv14
  %20 = load i32, i32* %19, align 4
  br label %26

; <label>:21:                                     ; preds = %.lr.ph
  %22 = load i32, i32* %10, align 4
  %23 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv1219, i64 %indvars.iv14
  %24 = load i32, i32* %23, align 4
  %25 = add nsw i32 %22, %24
  br label %26

; <label>:26:                                     ; preds = %18, %21
  %27 = phi i32 [ %20, %18 ], [ %25, %21 ]
  %28 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv1015, i64 %indvars.iv14
  store i32 %27, i32* %28, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv14, 1
  %29 = icmp slt i64 %indvars.iv.next, %3
  br i1 %29, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %26
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1015, 1
  %30 = icmp slt i64 %indvars.iv.next11, %4
  br i1 %30, label %.preheader, label %.loopexit23.loopexit

.loopexit23.loopexit:                             ; preds = %.loopexit
  br label %.loopexit23

.loopexit23:                                      ; preds = %.loopexit23.loopexit, %.preheader3
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1219, 1
  %31 = icmp slt i64 %indvars.iv.next13, %5
  br i1 %31, label %.preheader3, label %.loopexit24.loopexit

.loopexit24.loopexit:                             ; preds = %.loopexit23
  br label %.loopexit24

.loopexit24:                                      ; preds = %.loopexit24.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [2800 x i32]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = sext i32 %0 to i64
  %8 = sext i32 %0 to i64
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader.preheader, label %.loopexit10

.preheader.preheader:                             ; preds = %2
  %11 = icmp sgt i32 %0, 0
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.loopexit
  %indvars.iv47 = phi i64 [ %indvars.iv.next5, %.loopexit ], [ 0, %.preheader.preheader ]
  %12 = mul nsw i64 %indvars.iv47, %9
  br i1 %11, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %19
  %indvars.iv6 = phi i64 [ %indvars.iv.next, %19 ], [ 0, %.lr.ph.preheader ]
  %13 = add nsw i64 %12, %indvars.iv6
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %.lr.ph
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %.lr.ph, %17
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv47, i64 %indvars.iv6
  %22 = load i32, i32* %21, align 4
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %22) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %24 = icmp slt i64 %indvars.iv.next, %7
  br i1 %24, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %19
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv47, 1
  %25 = icmp slt i64 %indvars.iv.next5, %8
  br i1 %25, label %.preheader, label %.loopexit10.loopexit

.loopexit10.loopexit:                             ; preds = %.loopexit
  br label %.loopexit10

.loopexit10:                                      ; preds = %.loopexit10.loopexit, %2
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #5
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
