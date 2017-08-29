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
  tail call fastcc void @init_array(i32 2800, [2800 x i32]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_floyd_warshall(i32 2800, [2800 x i32]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %6
  br label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2800 x i32]*
  tail call fastcc void @print_array(i32 2800, [2800 x i32]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2800 x i32]* nocapture) unnamed_addr #2 {
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %2
  %indvars.iv7 = phi i64 [ 0, %2 ], [ %indvars.iv.next8, %..preheader_crit_edge ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge.._crit_edge_crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv, %indvars.iv7
  %4 = trunc i64 %3 to i32
  %5 = srem i32 %4, 7
  %6 = add nsw i32 %5, 1
  %7 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %8 = add nuw nsw i64 %indvars.iv, %indvars.iv7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 13
  %11 = icmp eq i32 %10, 0
  %12 = trunc i64 %8 to i32
  %13 = srem i32 %12, 7
  %14 = icmp eq i32 %13, 0
  %or.cond = or i1 %11, %14
  %15 = trunc i64 %8 to i32
  %16 = srem i32 %15, 11
  %17 = icmp eq i32 %16, 0
  %or.cond4 = or i1 %17, %or.cond
  %. = select i1 %or.cond4, i32 999, i32 %6
  store i32 %., i32* %7, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %18, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 2800
  br i1 %exitcond9, label %19, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %18
  br label %.preheader

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_floyd_warshall(i32, [2800 x i32]* nocapture) unnamed_addr #2 {
  br label %.preheader3

.preheader3:                                      ; preds = %..preheader3_crit_edge, %2
  %indvars.iv9 = phi i64 [ 0, %2 ], [ %indvars.iv.next10, %..preheader3_crit_edge ]
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %.preheader3
  %indvars.iv7 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next8, %..preheader_crit_edge ]
  %3 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv7, i64 %indvars.iv9
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge.._crit_edge_crit_edge ]
  %4 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %5 = load i32, i32* %4, align 4
  %6 = load i32, i32* %3, align 4
  %7 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %8 = load i32, i32* %7, align 4
  %9 = add nsw i32 %8, %6
  %10 = icmp slt i32 %5, %9
  %. = select i1 %10, i32 %5, i32 %9
  store i32 %., i32* %4, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv7, i64 %indvars.iv.next
  %12 = load i32, i32* %11, align 4
  %13 = load i32, i32* %3, align 4
  %14 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv9, i64 %indvars.iv.next
  %15 = load i32, i32* %14, align 4
  %16 = add nsw i32 %15, %13
  %17 = icmp slt i32 %12, %16
  %..1 = select i1 %17, i32 %12, i32 %16
  store i32 %..1, i32* %11, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2800
  br i1 %exitcond.1, label %18, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 2800
  br i1 %exitcond, label %19, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %18
  br label %.preheader

; <label>:19:                                     ; preds = %18
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 2800
  br i1 %exitcond11, label %20, label %..preheader3_crit_edge

..preheader3_crit_edge:                           ; preds = %19
  br label %.preheader3

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2800 x i32]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %..preheader_crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv4, 2800
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge.._crit_edge7_crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge.._crit_edge7_crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge7.._crit_edge_crit_edge

._crit_edge7.._crit_edge_crit_edge:               ; preds = %._crit_edge7
  br label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge7.._crit_edge_crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv4, i64 %indvars.iv
  %16 = load i32, i32* %15, align 4
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %18, label %._crit_edge.._crit_edge7_crit_edge

._crit_edge.._crit_edge7_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge7

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 2800
  br i1 %exitcond6, label %19, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %18
  br label %.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
