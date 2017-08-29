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
  %3 = call i8* @polybench_alloc_data(i64 7840000, i32 4) #4
  %4 = bitcast i8* %3 to [2800 x i32]*
  call fastcc void @init_array([2800 x i32]* %4)
  call void (...) @polybench_timer_start() #4
  %5 = bitcast i8* %3 to [2800 x i32]*
  call fastcc void @kernel_floyd_warshall([2800 x i32]* %5)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %6 = icmp sgt i32 %0, 42
  br i1 %6, label %7, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:7:                                      ; preds = %2
  %8 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %8, align 1
  %9 = icmp eq i8 %strcmpload, 0
  br i1 %9, label %10, label %.._crit_edge_crit_edge9

.._crit_edge_crit_edge9:                          ; preds = %7
  br label %._crit_edge

; <label>:10:                                     ; preds = %7
  %11 = bitcast i8* %3 to [2800 x i32]*
  call fastcc void @print_array([2800 x i32]* %11)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge9, %.._crit_edge_crit_edge, %10
  call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2800 x i32]* nocapture) unnamed_addr #2 {
..preheader.us_crit_edge:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %..preheader.us_crit_edge
  %indvars.iv24 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next25, %._crit_edge.us..preheader.us_crit_edge ]
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge30.._crit_edge31_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge30.._crit_edge31_crit_edge ]
  %1 = mul nuw nsw i64 %indvars.iv, %indvars.iv24
  %2 = trunc i64 %1 to i32
  %3 = srem i32 %2, 7
  %4 = add nsw i32 %3, 1
  %5 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv24, i64 %indvars.iv
  store i32 %4, i32* %5, align 4
  %6 = add nuw nsw i64 %indvars.iv, %indvars.iv24
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 13
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %._crit_edge31.._crit_edge_crit_edge, label %10

._crit_edge31.._crit_edge_crit_edge:              ; preds = %._crit_edge31
  br label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge31
  %11 = add nuw nsw i64 %indvars.iv, %indvars.iv24
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 7
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %.._crit_edge_crit_edge, label %15

.._crit_edge_crit_edge:                           ; preds = %10
  br label %._crit_edge

; <label>:15:                                     ; preds = %10
  %16 = add nuw nsw i64 %indvars.iv, %indvars.iv24
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 11
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %.._crit_edge_crit_edge1, label %.._crit_edge30_crit_edge

.._crit_edge30_crit_edge:                         ; preds = %15
  br label %._crit_edge30

.._crit_edge_crit_edge1:                          ; preds = %15
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge1, %.._crit_edge_crit_edge, %._crit_edge31.._crit_edge_crit_edge
  %20 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv24, i64 %indvars.iv
  store i32 999, i32* %20, align 4
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %.._crit_edge30_crit_edge, %._crit_edge
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge30.._crit_edge31_crit_edge

._crit_edge30.._crit_edge31_crit_edge:            ; preds = %._crit_edge30
  br label %._crit_edge31

._crit_edge.us:                                   ; preds = %._crit_edge30
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 2800
  br i1 %exitcond27, label %._crit_edge23, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge23:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_floyd_warshall([2800 x i32]* nocapture) unnamed_addr #2 {
..preheader.us.us.preheader_crit_edge:
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge34.us..preheader.us.us.preheader_crit_edge, %..preheader.us.us.preheader_crit_edge
  %indvars.iv49 = phi i64 [ 0, %..preheader.us.us.preheader_crit_edge ], [ %indvars.iv.next50, %._crit_edge34.us..preheader.us.us.preheader_crit_edge ]
  br label %.preheader.us.us

._crit_edge34.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, 2800
  br i1 %exitcond52, label %._crit_edge36, label %._crit_edge34.us..preheader.us.us.preheader_crit_edge

._crit_edge34.us..preheader.us.us.preheader_crit_edge: ; preds = %._crit_edge34.us
  br label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us..preheader.us.us_crit_edge, %.preheader.us.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next46, %._crit_edge.us.us..preheader.us.us_crit_edge ]
  %1 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv45, i64 %indvars.iv49
  %2 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv45, i64 %indvars.iv49
  br label %._crit_edge

._crit_edge.us.us:                                ; preds = %18
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, 2800
  br i1 %exitcond48, label %._crit_edge34.us, label %._crit_edge.us.us..preheader.us.us_crit_edge

._crit_edge.us.us..preheader.us.us_crit_edge:     ; preds = %._crit_edge.us.us
  br label %.preheader.us.us

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %.._crit_edge_crit_edge ]
  %3 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv45, i64 %indvars.iv
  %4 = load i32, i32* %3, align 4
  %5 = load i32, i32* %1, align 4
  %6 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv49, i64 %indvars.iv
  %7 = load i32, i32* %6, align 4
  %8 = add nsw i32 %7, %5
  %9 = icmp slt i32 %4, %8
  br i1 %9, label %15, label %10

; <label>:10:                                     ; preds = %._crit_edge
  %11 = load i32, i32* %2, align 4
  %12 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv49, i64 %indvars.iv
  %13 = load i32, i32* %12, align 4
  %14 = add nsw i32 %13, %11
  br label %18

; <label>:15:                                     ; preds = %._crit_edge
  %16 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv45, i64 %indvars.iv
  %17 = load i32, i32* %16, align 4
  br label %18

; <label>:18:                                     ; preds = %15, %10
  %19 = phi i32 [ %17, %15 ], [ %14, %10 ]
  %20 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv45, i64 %indvars.iv
  store i32 %19, i32* %20, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %._crit_edge.us.us, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %18
  br label %._crit_edge

._crit_edge36:                                    ; preds = %._crit_edge34.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2800 x i32]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us..preheader.us_crit_edge ]
  %5 = mul nsw i64 %indvars.iv16, 2800
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge.._crit_edge20_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.._crit_edge20_crit_edge ]
  %6 = add nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge20.._crit_edge_crit_edge

._crit_edge20.._crit_edge_crit_edge:              ; preds = %._crit_edge20
  br label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge20
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge20.._crit_edge_crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv16, i64 %indvars.iv
  %14 = load i32, i32* %13, align 4
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge.._crit_edge20_crit_edge

._crit_edge.._crit_edge20_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge20

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 2800
  br i1 %exitcond19, label %._crit_edge15, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
