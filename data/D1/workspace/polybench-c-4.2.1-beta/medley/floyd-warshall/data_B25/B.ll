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
  call fastcc void @init_array(i32 2800, [2800 x i32]* %4)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_floyd_warshall(i32 2800, [2800 x i32]* %4)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
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
  call fastcc void @print_array(i32 2800, [2800 x i32]* %4)
  br label %10

; <label>:10:                                     ; preds = %._crit_edge1, %._crit_edge, %9
  call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2800 x i32]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader.lr.ph, label %.._crit_edge8_crit_edge

.._crit_edge8_crit_edge:                          ; preds = %2
  br label %._crit_edge8

.preheader.lr.ph:                                 ; preds = %2
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us..preheader.us_crit_edge, %.preheader.lr.ph
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %.loopexit.us..preheader.us_crit_edge ], [ 0, %.preheader.lr.ph ]
  %storemerge7.us = phi i32 [ %24, %.loopexit.us..preheader.us_crit_edge ], [ 0, %.preheader.lr.ph ]
  %3 = trunc i64 %indvars.iv17 to i32
  br label %4

; <label>:4:                                      ; preds = %._crit_edge19, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge19 ], [ 0, %.preheader.us ]
  %5 = phi i32 [ %3, %._crit_edge19 ], [ %storemerge7.us, %.preheader.us ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = mul nsw i32 %5, %6
  %8 = srem i32 %7, 7
  %9 = add nsw i32 %8, 1
  %10 = sext i32 %5 to i64
  %11 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %10, i64 %indvars.iv
  store i32 %9, i32* %11, align 4
  %12 = add nsw i64 %indvars.iv, %indvars.iv17
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 13
  %15 = icmp eq i32 %14, 0
  %16 = srem i32 %13, 7
  %17 = icmp eq i32 %16, 0
  %or.cond.us = or i1 %15, %17
  %18 = srem i32 %13, 11
  %19 = icmp eq i32 %18, 0
  %or.cond3.us = or i1 %19, %or.cond.us
  br i1 %or.cond3.us, label %20, label %._crit_edge

._crit_edge:                                      ; preds = %4
  br label %22

; <label>:20:                                     ; preds = %4
  %21 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv17, i64 %indvars.iv
  store i32 999, i32* %21, align 4
  br label %22

; <label>:22:                                     ; preds = %._crit_edge, %20
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond16, label %.loopexit.us, label %._crit_edge19

._crit_edge19:                                    ; preds = %22
  br label %4

.loopexit.us:                                     ; preds = %22
  %indvars.iv.next18 = add nsw i64 %indvars.iv17, 1
  %23 = icmp slt i64 %indvars.iv.next18, 2800
  %24 = trunc i64 %indvars.iv.next18 to i32
  br i1 %23, label %.loopexit.us..preheader.us_crit_edge, label %._crit_edge8.loopexit

.loopexit.us..preheader.us_crit_edge:             ; preds = %.loopexit.us
  br label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %.loopexit.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %.._crit_edge8_crit_edge, %._crit_edge8.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_floyd_warshall(i32, [2800 x i32]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader.us.us.preheader.preheader, label %..loopexit_crit_edge

..loopexit_crit_edge:                             ; preds = %2
  br label %.loopexit

.preheader.us.us.preheader.preheader:             ; preds = %2
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.loopexit9.us..preheader.us.us.preheader_crit_edge, %.preheader.us.us.preheader.preheader
  %3 = phi i32 [ %5, %.loopexit9.us..preheader.us.us.preheader_crit_edge ], [ 0, %.preheader.us.us.preheader.preheader ]
  %4 = sext i32 %3 to i64
  br label %.preheader.us.us

.loopexit9.us:                                    ; preds = %.loopexit.us.us
  %5 = add nsw i32 %3, 1
  %6 = icmp slt i32 %5, 2800
  br i1 %6, label %.loopexit9.us..preheader.us.us.preheader_crit_edge, label %.loopexit.loopexit

.loopexit9.us..preheader.us.us.preheader_crit_edge: ; preds = %.loopexit9.us
  br label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %.loopexit.us.us..preheader.us.us_crit_edge, %.preheader.us.us.preheader
  %7 = phi i32 [ %10, %.loopexit.us.us..preheader.us.us_crit_edge ], [ 0, %.preheader.us.us.preheader ]
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %8, i64 %4
  br i1 true, label %.preheader.us.us..prol.loopexit_crit_edge, label %.prol.preheader

.preheader.us.us..prol.loopexit_crit_edge:        ; preds = %.preheader.us.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us..prol.loopexit_crit_edge ]
  br i1 false, label %.prol.loopexit..loopexit.us.us_crit_edge, label %.preheader.us.us.new.preheader

.prol.loopexit..loopexit.us.us_crit_edge:         ; preds = %.prol.loopexit
  br label %.loopexit.us.us

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

.loopexit.us.us.loopexit:                         ; preds = %.preheader.us.us.new
  br label %.loopexit.us.us

.loopexit.us.us:                                  ; preds = %.prol.loopexit..loopexit.us.us_crit_edge, %.loopexit.us.us.loopexit
  %10 = add nsw i32 %7, 1
  %11 = icmp slt i32 %10, 2800
  br i1 %11, label %.loopexit.us.us..preheader.us.us_crit_edge, label %.loopexit9.us

.loopexit.us.us..preheader.us.us_crit_edge:       ; preds = %.loopexit.us.us
  br label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new..preheader.us.us.new_crit_edge, %.preheader.us.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new..preheader.us.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %12 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %8, i64 %indvars.iv
  %13 = load i32, i32* %12, align 4
  %14 = load i32, i32* %9, align 4
  %15 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %4, i64 %indvars.iv
  %16 = load i32, i32* %15, align 4
  %17 = add nsw i32 %16, %14
  %18 = icmp slt i32 %13, %17
  %..us.us = select i1 %18, i32 %13, i32 %17
  store i32 %..us.us, i32* %12, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %19 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %8, i64 %indvars.iv.next
  %20 = load i32, i32* %19, align 4
  %21 = load i32, i32* %9, align 4
  %22 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %4, i64 %indvars.iv.next
  %23 = load i32, i32* %22, align 4
  %24 = add nsw i32 %23, %21
  %25 = icmp slt i32 %20, %24
  %..us.us.1 = select i1 %25, i32 %20, i32 %24
  store i32 %..us.us.1, i32* %19, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond22.1 = icmp eq i64 %indvars.iv.next.1, 2800
  br i1 %exitcond22.1, label %.loopexit.us.us.loopexit, label %.preheader.us.us.new..preheader.us.us.new_crit_edge

.preheader.us.us.new..preheader.us.us.new_crit_edge: ; preds = %.preheader.us.us.new
  br label %.preheader.us.us.new

.loopexit.loopexit:                               ; preds = %.loopexit9.us
  br label %.loopexit

.loopexit:                                        ; preds = %..loopexit_crit_edge, %.loopexit.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2800 x i32]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader.us.preheader, label %..loopexit2_crit_edge

..loopexit2_crit_edge:                            ; preds = %2
  br label %.loopexit2

.preheader.us.preheader:                          ; preds = %2
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us..preheader.us_crit_edge, %.preheader.us.preheader
  %7 = phi i32 [ %23, %.loopexit.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %8 = mul nsw i32 %7, 2800
  %9 = sext i32 %7 to i64
  %10 = zext i32 %8 to i64
  br label %11

; <label>:11:                                     ; preds = %._crit_edge5, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge5 ], [ 0, %.preheader.us ]
  %12 = add i64 %indvars.iv, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

._crit_edge:                                      ; preds = %11
  br label %18

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %18

; <label>:18:                                     ; preds = %._crit_edge, %16
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %9, i64 %indvars.iv
  %21 = load i32, i32* %20, align 4
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond4, label %.loopexit.us, label %._crit_edge5

._crit_edge5:                                     ; preds = %18
  br label %11

.loopexit.us:                                     ; preds = %18
  %23 = add nsw i32 %7, 1
  %24 = icmp slt i32 %23, 2800
  br i1 %24, label %.loopexit.us..preheader.us_crit_edge, label %.loopexit2.loopexit

.loopexit.us..preheader.us_crit_edge:             ; preds = %.loopexit.us
  br label %.preheader.us

.loopexit2.loopexit:                              ; preds = %.loopexit.us
  br label %.loopexit2

.loopexit2:                                       ; preds = %..loopexit2_crit_edge, %.loopexit2.loopexit
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
