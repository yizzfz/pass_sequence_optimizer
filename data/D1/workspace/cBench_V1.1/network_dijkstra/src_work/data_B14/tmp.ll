; ModuleID = 'dijkstra_large.1.ll'
source_filename = "dijkstra_large.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._QITEM = type { i32, i32, i32, %struct._QITEM* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct._NODE = type { i32, i32 }

@NUM_NODES = global i32 0, align 4
@qHead = local_unnamed_addr global %struct._QITEM* null, align 8
@g_qCount = local_unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@stdout = external local_unnamed_addr global %struct._IO_FILE*, align 8
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [16 x i8] c"Out of memory.\0A\00", align 1
@ch = common local_unnamed_addr global i32 0, align 4
@rgnNodes = common local_unnamed_addr global %struct._NODE* null, align 8
@.str.2 = private unnamed_addr constant [54 x i8] c"Shortest path is 0 in cost. Just stay where you are.\0A\00", align 1
@iNode = common global i32 0, align 4
@iDist = common global i32 0, align 4
@iPrev = common global i32 0, align 4
@i = common local_unnamed_addr global i32 0, align 4
@AdjMatrix = common local_unnamed_addr global i32* null, align 8
@iCost = common local_unnamed_addr global i32 0, align 4
@.str.3 = private unnamed_addr constant [28 x i8] c"Usage: dijkstra <filename>\0A\00", align 1
@.str.4 = private unnamed_addr constant [41 x i8] c"Only supports matrix size is #define'd.\0A\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.7 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.11 = private unnamed_addr constant [17 x i8] c"Matrix size: %d\0A\00", align 1
@.str.12 = private unnamed_addr constant [20 x i8] c"AdjMatrix size: %d\0A\00", align 1
@.str.13 = private unnamed_addr constant [18 x i8] c"rgnNodesSize: %d\0A\00", align 1
@.str.14 = private unnamed_addr constant [30 x i8] c"Shortest path is %d in cost. \00", align 1
@.str.15 = private unnamed_addr constant [10 x i8] c"Path is: \00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@str = private unnamed_addr constant [53 x i8] c"Shortest path is 0 in cost. Just stay where you are.\00"

; Function Attrs: noinline nounwind uwtable
define void @print_path(%struct._NODE* nocapture readonly, i32) local_unnamed_addr #0 {
  %3 = sext i32 %1 to i64
  %4 = getelementptr inbounds %struct._NODE, %struct._NODE* %0, i64 %3, i32 1
  %5 = load i32, i32* %4, align 4
  %6 = icmp eq i32 %5, 9999
  br i1 %6, label %8, label %7

; <label>:7:                                      ; preds = %2
  tail call void @print_path(%struct._NODE* nonnull %0, i32 %5)
  br label %8

; <label>:8:                                      ; preds = %7, %2
  %9 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %1)
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %11 = tail call i32 @fflush(%struct._IO_FILE* %10)
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fflush(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @enqueue(i32, i32, i32) local_unnamed_addr #0 {
  %4 = tail call noalias i8* @malloc(i64 24) #5
  %5 = load %struct._QITEM*, %struct._QITEM** @qHead, align 8
  %6 = icmp eq i8* %4, null
  br i1 %6, label %7, label %10

; <label>:7:                                      ; preds = %3
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0), i64 15, i64 1, %struct._IO_FILE* %8) #6
  tail call void @exit(i32 1) #7
  unreachable

; <label>:10:                                     ; preds = %3
  %11 = bitcast i8* %4 to i32*
  store i32 %0, i32* %11, align 8
  %12 = getelementptr inbounds i8, i8* %4, i64 4
  %13 = bitcast i8* %12 to i32*
  store i32 %1, i32* %13, align 4
  %14 = getelementptr inbounds i8, i8* %4, i64 8
  %15 = bitcast i8* %14 to i32*
  store i32 %2, i32* %15, align 8
  %16 = getelementptr inbounds i8, i8* %4, i64 16
  %17 = bitcast i8* %16 to %struct._QITEM**
  store %struct._QITEM* null, %struct._QITEM** %17, align 8
  %18 = icmp eq %struct._QITEM* %5, null
  br i1 %18, label %24, label %.preheader.preheader

.preheader.preheader:                             ; preds = %10
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %.0 = phi %struct._QITEM* [ %20, %.preheader ], [ %5, %.preheader.preheader ]
  %19 = getelementptr inbounds %struct._QITEM, %struct._QITEM* %.0, i64 0, i32 3
  %20 = load %struct._QITEM*, %struct._QITEM** %19, align 8
  %21 = icmp eq %struct._QITEM* %20, null
  br i1 %21, label %22, label %.preheader

; <label>:22:                                     ; preds = %.preheader
  %23 = bitcast %struct._QITEM** %19 to i8**
  br label %24

; <label>:24:                                     ; preds = %22, %10
  %.sink = phi i8** [ %23, %22 ], [ bitcast (%struct._QITEM** @qHead to i8**), %10 ]
  store i8* %4, i8** %.sink, align 8
  %25 = load i32, i32* @g_qCount, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* @g_qCount, align 4
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define void @dequeue(i32* nocapture, i32* nocapture, i32* nocapture) local_unnamed_addr #0 {
  %4 = load %struct._QITEM*, %struct._QITEM** @qHead, align 8
  %5 = icmp eq %struct._QITEM* %4, null
  br i1 %5, label %22, label %6

; <label>:6:                                      ; preds = %3
  %7 = load i8*, i8** bitcast (%struct._QITEM** @qHead to i8**), align 8
  %8 = bitcast i8* %7 to i32*
  %9 = load i32, i32* %8, align 8
  store i32 %9, i32* %0, align 4
  %10 = load %struct._QITEM*, %struct._QITEM** @qHead, align 8
  %11 = getelementptr inbounds %struct._QITEM, %struct._QITEM* %10, i64 0, i32 1
  %12 = load i32, i32* %11, align 4
  store i32 %12, i32* %1, align 4
  %13 = load %struct._QITEM*, %struct._QITEM** @qHead, align 8
  %14 = getelementptr inbounds %struct._QITEM, %struct._QITEM* %13, i64 0, i32 2
  %15 = load i32, i32* %14, align 8
  store i32 %15, i32* %2, align 4
  %16 = load %struct._QITEM*, %struct._QITEM** @qHead, align 8
  %17 = getelementptr inbounds %struct._QITEM, %struct._QITEM* %16, i64 0, i32 3
  %18 = bitcast %struct._QITEM** %17 to i64*
  %19 = load i64, i64* %18, align 8
  store i64 %19, i64* bitcast (%struct._QITEM** @qHead to i64*), align 8
  tail call void @free(i8* %7) #5
  %20 = load i32, i32* @g_qCount, align 4
  %21 = add nsw i32 %20, -1
  store i32 %21, i32* @g_qCount, align 4
  br label %22

; <label>:22:                                     ; preds = %6, %3
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @qcount() local_unnamed_addr #3 {
  %1 = load i32, i32* @g_qCount, align 4
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define void @dijkstra(i32, i32) local_unnamed_addr #0 {
  store i32 0, i32* @ch, align 4
  %3 = load i32, i32* @NUM_NODES, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %.lr.ph6.preheader, label %._crit_edge

.lr.ph6.preheader:                                ; preds = %2
  br label %.lr.ph6

.lr.ph6:                                          ; preds = %.lr.ph6, %.lr.ph6.preheader
  %storemerge5 = phi i32 [ %12, %.lr.ph6 ], [ 0, %.lr.ph6.preheader ]
  %5 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %6 = sext i32 %storemerge5 to i64
  %7 = getelementptr inbounds %struct._NODE, %struct._NODE* %5, i64 %6, i32 0
  store i32 9999, i32* %7, align 4
  %8 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %9 = load i32, i32* @ch, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds %struct._NODE, %struct._NODE* %8, i64 %10, i32 1
  store i32 9999, i32* %11, align 4
  %12 = add nsw i32 %9, 1
  store i32 %12, i32* @ch, align 4
  %13 = load i32, i32* @NUM_NODES, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %.lr.ph6, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %15 = icmp eq i32 %0, %1
  br i1 %15, label %16, label %17

; <label>:16:                                     ; preds = %._crit_edge
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @str, i64 0, i64 0))
  br label %.loopexit2

; <label>:17:                                     ; preds = %._crit_edge
  %18 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %19 = sext i32 %0 to i64
  %20 = getelementptr inbounds %struct._NODE, %struct._NODE* %18, i64 %19, i32 0
  store i32 0, i32* %20, align 4
  %21 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %22 = getelementptr inbounds %struct._NODE, %struct._NODE* %21, i64 %19, i32 1
  store i32 9999, i32* %22, align 4
  tail call void @enqueue(i32 %0, i32 0, i32 9999)
  %23 = tail call i32 @qcount()
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %.lr.ph4.preheader, label %.loopexit2

.lr.ph4.preheader:                                ; preds = %17
  br label %.lr.ph4

.loopexit.loopexit:                               ; preds = %66
  br label %.loopexit

.loopexit:                                        ; preds = %.lr.ph4, %.loopexit.loopexit
  %25 = tail call i32 @qcount()
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %.lr.ph4, label %.loopexit2.loopexit

.lr.ph4:                                          ; preds = %.loopexit, %.lr.ph4.preheader
  tail call void @dequeue(i32* nonnull @iNode, i32* nonnull @iDist, i32* nonnull @iPrev)
  store i32 0, i32* @i, align 4
  %27 = load i32, i32* @NUM_NODES, align 4
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.lr.ph4
  br label %.lr.ph

.lr.ph:                                           ; preds = %66, %.lr.ph.preheader
  %29 = phi i32 [ %69, %66 ], [ %27, %.lr.ph.preheader ]
  %storemerge13 = phi i32 [ %68, %66 ], [ 0, %.lr.ph.preheader ]
  %30 = load i32*, i32** @AdjMatrix, align 8
  %31 = load i32, i32* @iNode, align 4
  %32 = mul nsw i32 %31, %29
  %33 = add nsw i32 %32, %storemerge13
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32* %30, i64 %34
  %36 = load i32, i32* %35, align 4
  store i32 %36, i32* @iCost, align 4
  %37 = icmp eq i32 %36, 9999
  br i1 %37, label %66, label %38

; <label>:38:                                     ; preds = %.lr.ph
  %39 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %40 = load i32, i32* @i, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds %struct._NODE, %struct._NODE* %39, i64 %41, i32 0
  %43 = load i32, i32* %42, align 4
  %44 = icmp eq i32 %43, 9999
  br i1 %44, label %49, label %45

; <label>:45:                                     ; preds = %38
  %46 = load i32, i32* @iDist, align 4
  %47 = add nsw i32 %46, %36
  %48 = icmp sgt i32 %43, %47
  br i1 %48, label %49, label %66

; <label>:49:                                     ; preds = %45, %38
  %50 = load i32, i32* @iDist, align 4
  %51 = load i32, i32* @iCost, align 4
  %52 = add nsw i32 %51, %50
  %53 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %54 = load i32, i32* @i, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds %struct._NODE, %struct._NODE* %53, i64 %55, i32 0
  store i32 %52, i32* %56, align 4
  %57 = load i32, i32* @iNode, align 4
  %58 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %59 = load i32, i32* @i, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds %struct._NODE, %struct._NODE* %58, i64 %60, i32 1
  store i32 %57, i32* %61, align 4
  %62 = load i32, i32* @iDist, align 4
  %63 = load i32, i32* @iCost, align 4
  %64 = add nsw i32 %63, %62
  %65 = load i32, i32* @iNode, align 4
  tail call void @enqueue(i32 %59, i32 %64, i32 %65)
  br label %66

; <label>:66:                                     ; preds = %49, %45, %.lr.ph
  %67 = load i32, i32* @i, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* @i, align 4
  %69 = load i32, i32* @NUM_NODES, align 4
  %70 = icmp slt i32 %68, %69
  br i1 %70, label %.lr.ph, label %.loopexit.loopexit

.loopexit2.loopexit:                              ; preds = %.loopexit
  br label %.loopexit2

.loopexit2:                                       ; preds = %.loopexit2.loopexit, %17, %16
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = icmp slt i32 %0, 2
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %7) #6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.4, i64 0, i64 0), i64 40, i64 1, %struct._IO_FILE* %9) #6
  tail call void @exit(i32 1) #7
  unreachable

; <label>:11:                                     ; preds = %2
  %12 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i64 0, i64 0))
  %13 = icmp eq %struct._IO_FILE* %12, null
  br i1 %13, label %14, label %17

; <label>:14:                                     ; preds = %11
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i64 @fwrite(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.7, i64 0, i64 0), i64 28, i64 1, %struct._IO_FILE* %15) #6
  tail call void @exit(i32 1) #7
  unreachable

; <label>:17:                                     ; preds = %11
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* nonnull %12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0), i64* nonnull %4) #5
  %19 = call i32 @fclose(%struct._IO_FILE* nonnull %12)
  %20 = getelementptr inbounds i8*, i8** %1, i64 1
  %21 = load i8*, i8** %20, align 8
  %22 = call %struct._IO_FILE* @fopen(i8* %21, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0))
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i64 0, i64 0), i32* nonnull @NUM_NODES) #5
  %24 = load i32, i32* @NUM_NODES, align 4
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.11, i64 0, i64 0), i32 %24)
  %26 = load i32, i32* @NUM_NODES, align 4
  %27 = shl i32 %26, 2
  %28 = add i32 %27, 4
  %29 = add nsw i32 %26, 1
  %30 = mul nsw i32 %28, %29
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.12, i64 0, i64 0), i32 %30)
  %32 = load i32, i32* @NUM_NODES, align 4
  %33 = shl i32 %32, 3
  %34 = add i32 %33, 8
  %35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.13, i64 0, i64 0), i32 %34)
  %36 = load i32, i32* @NUM_NODES, align 4
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = shl nsw i64 %38, 2
  %40 = mul i64 %39, %38
  %41 = call noalias i8* @malloc(i64 %40) #5
  store i8* %41, i8** bitcast (i32** @AdjMatrix to i8**), align 8
  %42 = load i32, i32* @NUM_NODES, align 4
  %43 = add nsw i32 %42, 1
  %44 = sext i32 %43 to i64
  %45 = shl nsw i64 %44, 3
  %46 = call noalias i8* @malloc(i64 %45) #5
  store i8* %46, i8** bitcast (%struct._NODE** @rgnNodes to i8**), align 8
  %47 = icmp sgt i32 %42, 0
  %.pr = load i32, i32* @NUM_NODES, align 4
  br i1 %47, label %.preheader.preheader, label %._crit_edge15

.preheader.preheader:                             ; preds = %17
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge12, %.preheader.preheader
  %48 = phi i32 [ %62, %._crit_edge12 ], [ %.pr, %.preheader.preheader ]
  %.0213 = phi i32 [ %61, %._crit_edge12 ], [ 0, %.preheader.preheader ]
  %49 = icmp sgt i32 %48, 0
  br i1 %49, label %.lr.ph11.preheader, label %._crit_edge12

.lr.ph11.preheader:                               ; preds = %.preheader
  br label %.lr.ph11

.lr.ph11:                                         ; preds = %.lr.ph11, %.lr.ph11.preheader
  %.0110 = phi i32 [ %58, %.lr.ph11 ], [ 0, %.lr.ph11.preheader ]
  %50 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i64 0, i64 0), i32* nonnull %3) #5
  %51 = load i32, i32* %3, align 4
  %52 = load i32*, i32** @AdjMatrix, align 8
  %53 = load i32, i32* @NUM_NODES, align 4
  %54 = mul nsw i32 %53, %.0213
  %55 = add nsw i32 %54, %.0110
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32* %52, i64 %56
  store i32 %51, i32* %57, align 4
  %58 = add nuw nsw i32 %.0110, 1
  %59 = load i32, i32* @NUM_NODES, align 4
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %.lr.ph11, label %._crit_edge12.loopexit

._crit_edge12.loopexit:                           ; preds = %.lr.ph11
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %.preheader
  %61 = add nuw nsw i32 %.0213, 1
  %62 = load i32, i32* @NUM_NODES, align 4
  %63 = icmp slt i32 %61, %62
  br i1 %63, label %.preheader, label %._crit_edge15.loopexit

._crit_edge15.loopexit:                           ; preds = %._crit_edge12
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %17
  %64 = phi i32 [ %.pr, %17 ], [ %62, %._crit_edge15.loopexit ]
  %.lcssa = phi i32 [ %42, %17 ], [ %62, %._crit_edge15.loopexit ]
  %65 = icmp sgt i32 %64, 0
  br i1 %65, label %.lr.ph8.preheader, label %._crit_edge9

.lr.ph8.preheader:                                ; preds = %._crit_edge15
  %66 = sdiv i32 %.lcssa, 2
  br label %.lr.ph8

.lr.ph8:                                          ; preds = %._crit_edge, %.lr.ph8.preheader
  %67 = phi i32 [ %83, %._crit_edge ], [ %64, %.lr.ph8.preheader ]
  %.16 = phi i32 [ %82, %._crit_edge ], [ %66, %.lr.ph8.preheader ]
  %.135 = phi i32 [ %81, %._crit_edge ], [ 0, %.lr.ph8.preheader ]
  %68 = srem i32 %.16, %67
  %69 = load i64, i64* %4, align 8
  %70 = icmp sgt i64 %69, 0
  br i1 %70, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %.04 = phi i64 [ %71, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  call void @dijkstra(i32 %.135, i32 %68)
  %71 = add nuw nsw i64 %.04, 1
  %72 = load i64, i64* %4, align 8
  %73 = icmp slt i64 %71, %72
  br i1 %73, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph8
  %74 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  %75 = sext i32 %68 to i64
  %76 = getelementptr inbounds %struct._NODE, %struct._NODE* %74, i64 %75, i32 0
  %77 = load i32, i32* %76, align 4
  %78 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.14, i64 0, i64 0), i32 %77)
  %79 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.15, i64 0, i64 0))
  %80 = load %struct._NODE*, %struct._NODE** @rgnNodes, align 8
  call void @print_path(%struct._NODE* %80, i32 %68)
  %putchar = call i32 @putchar(i32 10) #5
  %81 = add nuw nsw i32 %.135, 1
  %82 = add nsw i32 %68, 1
  %83 = load i32, i32* @NUM_NODES, align 4
  %84 = icmp slt i32 %81, %83
  br i1 %84, label %.lr.ph8, label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %._crit_edge15
  %85 = load i8*, i8** bitcast (i32** @AdjMatrix to i8**), align 8
  call void @free(i8* %85) #5
  %86 = load i8*, i8** bitcast (%struct._NODE** @rgnNodes to i8**), align 8
  call void @free(i8* %86) #5
  ret i32 0
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #1

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #5

declare i32 @putchar(i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
