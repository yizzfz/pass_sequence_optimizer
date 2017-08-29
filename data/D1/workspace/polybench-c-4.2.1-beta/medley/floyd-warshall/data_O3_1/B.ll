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
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2800, [2800 x i32]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2800 x i32]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader.us.preheader, label %._crit_edge8

.preheader.us.preheader:                          ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %4 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %5 = add nuw nsw i64 %indvars.iv, %indvars.iv9
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 13
  %8 = icmp eq i32 %7, 0
  %9 = srem i32 %6, 7
  %10 = icmp eq i32 %9, 0
  %or.cond.us = or i1 %8, %10
  %11 = srem i32 %6, 11
  %12 = icmp eq i32 %11, 0
  %or.cond4.us = or i1 %12, %or.cond.us
  br i1 %or.cond4.us, label %17, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge13
  %13 = mul nuw nsw i64 %indvars.iv, %indvars.iv9
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 7
  %16 = add nsw i32 %15, 1
  br label %17

; <label>:17:                                     ; preds = %._crit_edge13, %._crit_edge
  %storemerge = phi i32 [ %16, %._crit_edge ], [ 999, %._crit_edge13 ]
  store i32 %storemerge, i32* %4, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge13

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, %wide.trip.count
  br i1 %exitcond12, label %._crit_edge8.loopexit, label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_floyd_warshall(i32, [2800 x i32]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader.us.us.preheader.preheader, label %._crit_edge8

.preheader.us.us.preheader.preheader:             ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  %4 = add nsw i64 %wide.trip.count, -1
  %min.iters.check = icmp ult i32 %0, 8
  %5 = and i32 %0, 7
  %n.mod.vf = zext i32 %5 to i64
  %n.vec = sub nsw i64 %wide.trip.count, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %5, 0
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader.us.us.preheader.preheader, %._crit_edge6.us
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge6.us ], [ 0, %.preheader.us.us.preheader.preheader ]
  %scevgep29 = getelementptr [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv22, i64 0
  %scevgep31 = getelementptr [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv22, i64 %wide.trip.count
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, %wide.trip.count
  br i1 %exitcond25, label %._crit_edge8.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv18 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next19, %._crit_edge.us.us ]
  %scevgep = getelementptr [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv18, i64 0
  %scevgep27 = getelementptr [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv18, i64 %wide.trip.count
  %6 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv18, i64 %indvars.iv22
  br i1 %min.iters.check, label %._crit_edge.preheader, label %min.iters.checked

._crit_edge.preheader:                            ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us.us ], [ %n.vec, %middle.block ]
  %7 = sub nsw i64 %wide.trip.count, %indvars.iv.ph
  %xtraiter = and i64 %7, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge.prol.loopexit.unr-lcssa, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %._crit_edge.preheader
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader
  %8 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv18, i64 %indvars.iv.ph
  %9 = load i32, i32* %8, align 4
  %10 = load i32, i32* %6, align 4
  %11 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv22, i64 %indvars.iv.ph
  %12 = load i32, i32* %11, align 4
  %13 = add nsw i32 %12, %10
  %14 = icmp slt i32 %9, %13
  %..us.us.prol = select i1 %14, i32 %9, i32 %13
  store i32 %..us.us.prol, i32* %8, align 4
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  br label %._crit_edge.prol.loopexit.unr-lcssa

._crit_edge.prol.loopexit.unr-lcssa:              ; preds = %._crit_edge.preheader, %._crit_edge.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %._crit_edge.prol ], [ %indvars.iv.ph, %._crit_edge.preheader ]
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol.loopexit.unr-lcssa
  %15 = icmp eq i64 %4, %indvars.iv.ph
  br i1 %15, label %._crit_edge.us.us.loopexit, label %._crit_edge.preheader.new

._crit_edge.preheader.new:                        ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

min.iters.checked:                                ; preds = %.preheader.us.us
  br i1 %cmp.zero, label %._crit_edge.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i32* %scevgep, %6
  %bound1 = icmp ult i32* %6, %scevgep27
  %found.conflict = and i1 %bound0, %bound1
  %bound034 = icmp ult i32* %scevgep, %scevgep31
  %bound135 = icmp ult i32* %scevgep29, %scevgep27
  %found.conflict36 = and i1 %bound034, %bound135
  %conflict.rdx = or i1 %found.conflict, %found.conflict36
  br i1 %conflict.rdx, label %._crit_edge.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %16 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv18, i64 %index
  %17 = bitcast i32* %16 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %17, align 4, !alias.scope !1, !noalias !4
  %18 = getelementptr i32, i32* %16, i64 4
  %19 = bitcast i32* %18 to <4 x i32>*
  %wide.load38 = load <4 x i32>, <4 x i32>* %19, align 4, !alias.scope !1, !noalias !4
  %20 = load i32, i32* %6, align 4, !alias.scope !7
  %21 = insertelement <4 x i32> undef, i32 %20, i32 0
  %22 = shufflevector <4 x i32> %21, <4 x i32> undef, <4 x i32> zeroinitializer
  %23 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv22, i64 %index
  %24 = bitcast i32* %23 to <4 x i32>*
  %wide.load39 = load <4 x i32>, <4 x i32>* %24, align 4, !alias.scope !8
  %25 = getelementptr i32, i32* %23, i64 4
  %26 = bitcast i32* %25 to <4 x i32>*
  %wide.load40 = load <4 x i32>, <4 x i32>* %26, align 4, !alias.scope !8
  %27 = add nsw <4 x i32> %wide.load39, %22
  %28 = add nsw <4 x i32> %wide.load40, %22
  %29 = icmp slt <4 x i32> %wide.load, %27
  %30 = icmp slt <4 x i32> %wide.load38, %28
  %31 = select <4 x i1> %29, <4 x i32> %wide.load, <4 x i32> %27
  %32 = select <4 x i1> %30, <4 x i32> %wide.load38, <4 x i32> %28
  store <4 x i32> %31, <4 x i32>* %17, align 4, !alias.scope !1, !noalias !4
  store <4 x i32> %32, <4 x i32>* %19, align 4, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 8
  %33 = icmp eq i64 %index.next, %n.vec
  br i1 %33, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.us.us, label %._crit_edge.preheader

._crit_edge.us.us.loopexit.unr-lcssa:             ; preds = %._crit_edge
  br label %._crit_edge.us.us.loopexit

._crit_edge.us.us.loopexit:                       ; preds = %._crit_edge.prol.loopexit, %._crit_edge.us.us.loopexit.unr-lcssa
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %middle.block
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, %wide.trip.count
  br i1 %exitcond21, label %._crit_edge6.us, label %.preheader.us.us

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge.preheader.new ], [ %indvars.iv.next.1, %._crit_edge ]
  %34 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv18, i64 %indvars.iv
  %35 = load i32, i32* %34, align 4
  %36 = load i32, i32* %6, align 4
  %37 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv22, i64 %indvars.iv
  %38 = load i32, i32* %37, align 4
  %39 = add nsw i32 %38, %36
  %40 = icmp slt i32 %35, %39
  %..us.us = select i1 %40, i32 %35, i32 %39
  store i32 %..us.us, i32* %34, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %41 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv18, i64 %indvars.iv.next
  %42 = load i32, i32* %41, align 4
  %43 = load i32, i32* %6, align 4
  %44 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv22, i64 %indvars.iv.next
  %45 = load i32, i32* %44, align 4
  %46 = add nsw i32 %45, %43
  %47 = icmp slt i32 %42, %46
  %..us.us.1 = select i1 %47, i32 %42, i32 %46
  store i32 %..us.us.1, i32* %41, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit.unr-lcssa, label %._crit_edge, !llvm.loop !12

._crit_edge8.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %2
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
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv5, %8
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %18 = load i32, i32* %17, align 4
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge9

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5, !6}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !3}
!7 = !{!5}
!8 = !{!6}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
