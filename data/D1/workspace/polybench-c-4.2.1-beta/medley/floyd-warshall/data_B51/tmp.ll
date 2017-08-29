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
  %10 = load i32, i32* %5, align 4
  %11 = bitcast i8* %7 to [2800 x i32]*
  tail call fastcc void @kernel_floyd_warshall(i32 %10, [2800 x i32]* %11)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
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
  tail call fastcc void @print_array(i32 %19, [2800 x i32]* %21)
  br label %22

; <label>:22:                                     ; preds = %14, %18, %2
  %23 = bitcast [2800 x [2800 x i32]]** %6 to i8**
  %24 = load i8*, i8** %23, align 8
  tail call void @free(i8* %24) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2800 x i32]*) unnamed_addr #2 {
.preheader.lr.ph:
  br i1 true, label %.preheader.us.preheader, label %._crit_edge7.loopexit12

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  br label %2

; <label>:2:                                      ; preds = %20, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %20 ]
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
  %12 = trunc i64 %8 to i32
  %13 = srem i32 %12, 7
  %14 = icmp eq i32 %13, 0
  %or.cond.us = or i1 %11, %14
  %15 = trunc i64 %8 to i32
  %16 = srem i32 %15, 11
  %17 = icmp eq i32 %16, 0
  %or.cond3.us = or i1 %17, %or.cond.us
  br i1 %or.cond3.us, label %18, label %20

; <label>:18:                                     ; preds = %2
  %19 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv14, i64 %indvars.iv
  store i32 999, i32* %19, align 4
  br label %20

; <label>:20:                                     ; preds = %18, %2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %._crit_edge.us, label %2

._crit_edge.us:                                   ; preds = %20
  %indvars.iv.next15 = add nsw i64 %indvars.iv14, 1
  %21 = icmp slt i64 %indvars.iv.next15, 2800
  br i1 %21, label %.preheader.us, label %._crit_edge7.loopexit

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7.loopexit12:                          ; preds = %.preheader.lr.ph
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit12, %._crit_edge7.loopexit
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
  br i1 %7, label %.preheader3.lr.ph, label %45

.preheader3.lr.ph:                                ; preds = %2
  %8 = load i32, i32* %3, align 4
  %wide.trip.count.1 = zext i32 %8 to i64
  %wide.trip.count33 = zext i32 %8 to i64
  %9 = sext i32 %8 to i64
  %10 = icmp sgt i32 %8, 0
  %11 = load [2800 x i32]*, [2800 x i32]** %4, align 8
  %.promoted = load i32, i32* %6, align 4
  br i1 %10, label %.preheader3.us.preheader, label %._crit_edge10.loopexit28

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %12 = sext i32 %.promoted to i64
  %xtraiter = and i32 %8, 1
  %13 = icmp sgt i32 %8, 0
  %14 = icmp eq i32 %xtraiter, 0
  %15 = icmp eq i32 %8, 1
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %indvars.iv34 = phi i64 [ %12, %.preheader3.us.preheader ], [ %indvars.iv.next35, %._crit_edge5.us ]
  br i1 %13, label %.preheader.us.us.preheader, label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %16 = getelementptr inbounds [2800 x i32], [2800 x i32]* %11, i64 %indvars.iv34, i64 0
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.preheader3.us
  %.lcssa9.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %8, %._crit_edge5.us.loopexit ]
  %indvars.iv.next35 = add nsw i64 %indvars.iv34, 1
  %17 = icmp slt i64 %indvars.iv.next35, %9
  br i1 %17, label %.preheader3.us, label %._crit_edge10.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %18 = getelementptr inbounds [2800 x i32], [2800 x i32]* %11, i64 %indvars.iv31, i64 %indvars.iv34
  br i1 %14, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %19 = getelementptr inbounds [2800 x i32], [2800 x i32]* %11, i64 %indvars.iv31, i64 0
  %20 = load i32, i32* %19, align 4
  %21 = load i32, i32* %18, align 4
  %22 = load i32, i32* %16, align 4
  %23 = add nsw i32 %22, %21
  %24 = icmp slt i32 %20, %23
  %..us.us.prol = select i1 %24, i32 %20, i32 %23
  %25 = getelementptr inbounds [2800 x i32], [2800 x i32]* %11, i64 %indvars.iv31, i64 0
  store i32 %..us.us.prol, i32* %25, align 4
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %15, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond, label %._crit_edge5.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %26 = getelementptr inbounds [2800 x i32], [2800 x i32]* %11, i64 %indvars.iv31, i64 %indvars.iv
  %27 = load i32, i32* %26, align 4
  %28 = load i32, i32* %18, align 4
  %29 = getelementptr inbounds [2800 x i32], [2800 x i32]* %11, i64 %indvars.iv34, i64 %indvars.iv
  %30 = load i32, i32* %29, align 4
  %31 = add nsw i32 %30, %28
  %32 = icmp slt i32 %27, %31
  %..us.us = select i1 %32, i32 %27, i32 %31
  %33 = getelementptr inbounds [2800 x i32], [2800 x i32]* %11, i64 %indvars.iv31, i64 %indvars.iv
  store i32 %..us.us, i32* %33, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = getelementptr inbounds [2800 x i32], [2800 x i32]* %11, i64 %indvars.iv31, i64 %indvars.iv.next
  %35 = load i32, i32* %34, align 4
  %36 = load i32, i32* %18, align 4
  %37 = getelementptr inbounds [2800 x i32], [2800 x i32]* %11, i64 %indvars.iv34, i64 %indvars.iv.next
  %38 = load i32, i32* %37, align 4
  %39 = add nsw i32 %38, %36
  %40 = icmp slt i32 %35, %39
  %..us.us.1 = select i1 %40, i32 %35, i32 %39
  %41 = getelementptr inbounds [2800 x i32], [2800 x i32]* %11, i64 %indvars.iv31, i64 %indvars.iv.next
  store i32 %..us.us.1, i32* %41, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge10.loopexit:                           ; preds = %._crit_edge5.us
  %42 = trunc i64 %indvars.iv.next35 to i32
  br label %._crit_edge10

._crit_edge10.loopexit28:                         ; preds = %.preheader3.lr.ph
  %.promoted13 = load i32, i32* %5, align 4
  %43 = add i32 %.promoted, 1
  %44 = icmp sgt i32 %8, %43
  %smax = select i1 %44, i32 %8, i32 %43
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit28, %._crit_edge10.loopexit
  %.lcssa9.lcssa15.lcssa = phi i32 [ %.lcssa9.lcssa.us, %._crit_edge10.loopexit ], [ %.promoted13, %._crit_edge10.loopexit28 ]
  %.lcssa12 = phi i32 [ %42, %._crit_edge10.loopexit ], [ %smax, %._crit_edge10.loopexit28 ]
  store i32 %.lcssa12, i32* %6, align 4
  store i32 %.lcssa9.lcssa15.lcssa, i32* %5, align 4
  br label %45

; <label>:45:                                     ; preds = %._crit_edge10, %2
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
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  store i32 0, i32* %5, align 4
  %10 = load i32, i32* %3, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.preheader.lr.ph, label %35

.preheader.lr.ph:                                 ; preds = %2
  %12 = load i32, i32* %3, align 4
  %wide.trip.count = zext i32 %12 to i64
  %13 = sext i32 %12 to i64
  %14 = sext i32 %12 to i64
  %15 = icmp sgt i32 %12, 0
  %16 = load [2800 x i32]*, [2800 x i32]** %4, align 8
  %.promoted5 = load i32, i32* %5, align 4
  br i1 %15, label %.preheader.us.preheader, label %._crit_edge4.loopexit9

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %17 = sext i32 %.promoted5 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv11 = phi i64 [ %17, %.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %18 = mul nsw i64 %indvars.iv11, %14
  br label %19

; <label>:19:                                     ; preds = %26, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %26 ]
  %20 = add nsw i64 %18, %indvars.iv
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 20
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %19
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %25) #5
  br label %26

; <label>:26:                                     ; preds = %24, %19
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = getelementptr inbounds [2800 x i32], [2800 x i32]* %16, i64 %indvars.iv11, i64 %indvars.iv
  %29 = load i32, i32* %28, align 4
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %29) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %19

._crit_edge.us:                                   ; preds = %26
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %31 = icmp slt i64 %indvars.iv.next12, %13
  br i1 %31, label %.preheader.us, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  %32 = trunc i64 %indvars.iv.next12 to i32
  br label %._crit_edge4

._crit_edge4.loopexit9:                           ; preds = %.preheader.lr.ph
  %33 = add i32 %.promoted5, 1
  %34 = icmp sgt i32 %12, %33
  %smax = select i1 %34, i32 %12, i32 %33
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit9, %._crit_edge4.loopexit
  %.lcssa6 = phi i32 [ %32, %._crit_edge4.loopexit ], [ %smax, %._crit_edge4.loopexit9 ]
  store i32 %.lcssa6, i32* %5, align 4
  br label %35

; <label>:35:                                     ; preds = %._crit_edge4, %2
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %38) #5
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
