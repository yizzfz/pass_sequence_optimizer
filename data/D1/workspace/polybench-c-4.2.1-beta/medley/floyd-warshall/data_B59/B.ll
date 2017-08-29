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
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca [2800 x [2800 x i32]]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 2800, i32* %5, align 4
  %7 = tail call i8* @polybench_alloc_data(i64 7840000, i32 4) #4
  %8 = bitcast [2800 x [2800 x i32]]** %6 to i8**
  store i8* %7, i8** %8, align 8
  %9 = bitcast i8* %7 to [2800 x i32]*
  tail call fastcc void @init_array(i32 2800, [2800 x i32]* %9)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_floyd_warshall(i32 2800, [2800 x i32]* %9)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  %11 = ptrtoint i8* %7 to i64
  %12 = inttoptr i64 %11 to [2800 x i32]*
  br i1 %10, label %13, label %17

; <label>:13:                                     ; preds = %2
  %14 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %14, align 1
  %15 = icmp eq i8 %strcmpload, 0
  br i1 %15, label %16, label %17

; <label>:16:                                     ; preds = %13
  tail call fastcc void @print_array(i32 2800, [2800 x i32]* %12)
  br label %17

; <label>:17:                                     ; preds = %13, %16, %2
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2800 x i32]*) unnamed_addr #2 {
.preheader.lr.ph:
  br i1 true, label %.preheader.us.preheader, label %._crit_edge6.loopexit12

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  br label %2

; <label>:2:                                      ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %17 ], [ 0, %.preheader.us ]
  %3 = mul nsw i64 %indvars.iv14, %indvars.iv
  %4 = trunc i64 %3 to i32
  %5 = srem i32 %4, 7
  %6 = add nsw i32 %5, 1
  %7 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv14, i64 %indvars.iv
  store i32 %6, i32* %7, align 4
  %8 = add nsw i64 %indvars.iv, %indvars.iv14
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 13
  %11 = icmp eq i32 %10, 0
  %12 = srem i32 %9, 7
  %13 = icmp eq i32 %12, 0
  %or.cond.us = or i1 %11, %13
  %14 = srem i32 %9, 11
  %15 = icmp eq i32 %14, 0
  %or.cond3.us = or i1 %15, %or.cond.us
  br i1 %or.cond3.us, label %16, label %17

; <label>:16:                                     ; preds = %2
  store i32 999, i32* %7, align 4
  br label %17

; <label>:17:                                     ; preds = %16, %2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %._crit_edge.us, label %2

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next15 = add nsw i64 %indvars.iv14, 1
  %18 = icmp slt i64 %indvars.iv.next15, 2800
  br i1 %18, label %.preheader.us, label %._crit_edge6.loopexit

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge6

._crit_edge6.loopexit12:                          ; preds = %.preheader.lr.ph
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit12, %._crit_edge6.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_floyd_warshall(i32, [2800 x i32]*) unnamed_addr #2 {
  %3 = alloca i32, align 4
  %4 = alloca [2800 x i32]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [2800 x i32]* %1, [2800 x i32]** %4, align 8
  store i32 0, i32* %6, align 4
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader3.lr.ph, label %35

.preheader3.lr.ph:                                ; preds = %2
  %wide.trip.count.1 = zext i32 %0 to i64
  %8 = sext i32 %0 to i64
  br i1 true, label %.preheader3.us.preheader, label %._crit_edge6.loopexit28

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %xtraiter = and i32 %0, 1
  %9 = icmp eq i32 %xtraiter, 0
  %10 = icmp eq i32 %0, 1
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %indvars.iv34 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next35, %._crit_edge5.us ]
  br i1 true, label %.preheader.us.us.preheader, label %.preheader3.us.._crit_edge5.us_crit_edge

.preheader3.us.._crit_edge5.us_crit_edge:         ; preds = %.preheader3.us
  br label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %11 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv34, i64 0
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %.preheader3.us.._crit_edge5.us_crit_edge, %._crit_edge5.us.loopexit
  %indvars.iv.next35 = add nsw i64 %indvars.iv34, 1
  %12 = icmp slt i64 %indvars.iv.next35, %8
  br i1 %12, label %.preheader3.us, label %._crit_edge6.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %13 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv31, i64 %indvars.iv34
  br i1 %9, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %14 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv31, i64 0
  %15 = load i32, i32* %14, align 4
  %16 = load i32, i32* %13, align 4
  %17 = load i32, i32* %11, align 4
  %18 = add nsw i32 %17, %16
  %19 = icmp slt i32 %15, %18
  %..us.us.prol = select i1 %19, i32 %15, i32 %18
  store i32 %..us.us.prol, i32* %14, align 4
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %10, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond = icmp eq i64 %indvars.iv.next32, %wide.trip.count.1
  br i1 %exitcond, label %._crit_edge5.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %20 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv31, i64 %indvars.iv
  %21 = load i32, i32* %20, align 4
  %22 = load i32, i32* %13, align 4
  %23 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv34, i64 %indvars.iv
  %24 = load i32, i32* %23, align 4
  %25 = add nsw i32 %24, %22
  %26 = icmp slt i32 %21, %25
  %..us.us = select i1 %26, i32 %21, i32 %25
  store i32 %..us.us, i32* %20, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv31, i64 %indvars.iv.next
  %28 = load i32, i32* %27, align 4
  %29 = load i32, i32* %13, align 4
  %30 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv34, i64 %indvars.iv.next
  %31 = load i32, i32* %30, align 4
  %32 = add nsw i32 %31, %29
  %33 = icmp slt i32 %28, %32
  %..us.us.1 = select i1 %33, i32 %28, i32 %32
  store i32 %..us.us.1, i32* %27, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge6.loopexit:                            ; preds = %._crit_edge5.us
  %34 = trunc i64 %indvars.iv.next35 to i32
  br label %._crit_edge6

._crit_edge6.loopexit28:                          ; preds = %.preheader3.lr.ph
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit28, %._crit_edge6.loopexit
  %.lcssa12 = phi i32 [ %34, %._crit_edge6.loopexit ], [ undef, %._crit_edge6.loopexit28 ]
  store i32 %.lcssa12, i32* %6, align 4
  store i32 %0, i32* %5, align 4
  br label %35

; <label>:35:                                     ; preds = %._crit_edge6, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2800 x i32]*) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca [2800 x i32]*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [2800 x i32]* %1, [2800 x i32]** %4, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  store i32 0, i32* %5, align 4
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader.lr.ph, label %27

.preheader.lr.ph:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  %11 = sext i32 %0 to i64
  br i1 true, label %.preheader.us.preheader, label %._crit_edge3.loopexit9

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv11 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %12 = mul nsw i64 %indvars.iv11, %11
  br label %13

; <label>:13:                                     ; preds = %20, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %20 ], [ 0, %.preheader.us ]
  %14 = add nsw i64 %12, %indvars.iv
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %13
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #5
  br label %20

; <label>:20:                                     ; preds = %18, %13
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %23 = load i32, i32* %22, align 4
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %23) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %13

._crit_edge.us:                                   ; preds = %20
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %25 = icmp slt i64 %indvars.iv.next12, %11
  br i1 %25, label %.preheader.us, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  %26 = trunc i64 %indvars.iv.next12 to i32
  br label %._crit_edge3

._crit_edge3.loopexit9:                           ; preds = %.preheader.lr.ph
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit9, %._crit_edge3.loopexit
  %.lcssa6 = phi i32 [ %26, %._crit_edge3.loopexit ], [ undef, %._crit_edge3.loopexit9 ]
  store i32 %.lcssa6, i32* %5, align 4
  br label %27

; <label>:27:                                     ; preds = %._crit_edge3, %2
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %30) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
