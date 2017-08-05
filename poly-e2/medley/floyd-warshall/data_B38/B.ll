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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 7840000, i32 4) #4
  %arraydecay = bitcast i8* %call to [2800 x i32]*
  tail call fastcc void @init_array([2800 x i32]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_floyd_warshall(i32 2800, [2800 x i32]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %arraydecay3 = bitcast i8* %call to [2800 x i32]*
  tail call fastcc void @print_array(i32 2800, [2800 x i32]* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2800 x i32]* nocapture %path) unnamed_addr #2 {
for.cond1.preheader.lr.ph:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc20.us, %for.cond1.preheader.lr.ph
  %indvars.iv12 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next13, %for.inc20.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv12, %indvars.iv
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 7
  %add.us = add nsw i32 %rem.us, 1
  %arrayidx5.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv12, i64 %indvars.iv
  %2 = add nuw nsw i64 %indvars.iv, %indvars.iv12
  %3 = trunc i64 %2 to i32
  %rem7.us = srem i32 %3, 13
  %cmp8.us = icmp eq i32 %rem7.us, 0
  %rem10.us = srem i32 %3, 7
  %cmp11.us = icmp eq i32 %rem10.us, 0
  %or.cond.us = or i1 %cmp8.us, %cmp11.us
  %rem14.us = srem i32 %3, 11
  %cmp15.us = icmp eq i32 %rem14.us, 0
  %or.cond1.us = or i1 %cmp15.us, %or.cond.us
  %.add.us = select i1 %or.cond1.us, i32 999, i32 %add.us
  store i32 %.add.us, i32* %arrayidx5.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %for.inc20.us, label %for.body3.us

for.inc20.us:                                     ; preds = %for.body3.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next13, 2800
  br i1 %exitcond1, label %for.end22, label %for.cond1.preheader.us

for.end22:                                        ; preds = %for.inc20.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_floyd_warshall(i32 %n, [2800 x i32]* %path) unnamed_addr #2 {
entry:
  %cmp6 = icmp sgt i32 %n, 0
  br i1 %cmp6, label %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge, label %for.end40

for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge: ; preds = %entry
  %0 = add i32 %n, -1
  %1 = sext i32 %n to i64
  %wide.trip.count = zext i32 %0 to i64
  %2 = add nuw nsw i64 %wide.trip.count, 1
  %3 = add nuw nsw i64 %wide.trip.count, 1
  %min.iters.check = icmp ult i64 %2, 8
  %n.vec = and i64 %2, 8589934584
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %2, %n.vec
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc38.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv48 = phi i64 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %indvars.iv.next49, %for.inc38.us ]
  %scevgep53 = getelementptr [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv48, i64 0
  %scevgep55 = getelementptr [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv48, i64 %2
  br label %for.cond4.preheader.us.us

for.inc38.us:                                     ; preds = %for.inc35.us.us
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next49, %1
  br i1 %exitcond66, label %for.end40.loopexit, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.inc35.us.us, %for.cond1.preheader.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.inc35.us.us ], [ 0, %for.cond1.preheader.us ]
  %scevgep = getelementptr [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv46, i64 0
  %scevgep51 = getelementptr [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv46, i64 %2
  %arrayidx12.us.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv46, i64 %indvars.iv48
  br i1 %min.iters.check, label %for.body6.us.us.preheader, label %min.iters.checked

for.body6.us.us.preheader:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond4.preheader.us.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond4.preheader.us.us ], [ %n.vec, %middle.block ]
  %4 = sub nsw i64 %3, %indvars.iv.ph
  %xtraiter = and i64 %4, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body6.us.us.prol.loopexit.unr-lcssa, label %for.body6.us.us.prol.preheader

for.body6.us.us.prol.preheader:                   ; preds = %for.body6.us.us.preheader
  br label %for.body6.us.us.prol

for.body6.us.us.prol:                             ; preds = %for.body6.us.us.prol.preheader
  %arrayidx8.us.us.prol = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv46, i64 %indvars.iv.ph
  %5 = load i32, i32* %arrayidx8.us.us.prol, align 4
  %6 = load i32, i32* %arrayidx12.us.us, align 4
  %arrayidx16.us.us.prol = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv48, i64 %indvars.iv.ph
  %7 = load i32, i32* %arrayidx16.us.us.prol, align 4
  %add.us.us.prol = add nsw i32 %7, %6
  %cmp17.us.us.prol = icmp slt i32 %5, %add.us.us.prol
  %.add.us.us.prol = select i1 %cmp17.us.us.prol, i32 %5, i32 %add.us.us.prol
  store i32 %.add.us.us.prol, i32* %arrayidx8.us.us.prol, align 4
  %indvars.iv.next.prol = or i64 %indvars.iv.ph, 1
  br label %for.body6.us.us.prol.loopexit.unr-lcssa

for.body6.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.body6.us.us.preheader, %for.body6.us.us.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body6.us.us.prol ], [ %indvars.iv.ph, %for.body6.us.us.preheader ]
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol.loopexit.unr-lcssa
  %8 = icmp eq i64 %wide.trip.count, %indvars.iv.ph
  br i1 %8, label %for.inc35.us.us.loopexit, label %for.body6.us.us.preheader.new

for.body6.us.us.preheader.new:                    ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

min.iters.checked:                                ; preds = %for.cond4.preheader.us.us
  br i1 %cmp.zero, label %for.body6.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i32* %scevgep, %arrayidx12.us.us
  %bound1 = icmp ult i32* %arrayidx12.us.us, %scevgep51
  %found.conflict = and i1 %bound0, %bound1
  %bound058 = icmp ult i32* %scevgep, %scevgep55
  %bound159 = icmp ult i32* %scevgep53, %scevgep51
  %found.conflict60 = and i1 %bound058, %bound159
  %conflict.rdx = or i1 %found.conflict, %found.conflict60
  br i1 %conflict.rdx, label %for.body6.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %9 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv46, i64 %index
  %10 = bitcast i32* %9 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %10, align 4, !alias.scope !1, !noalias !4
  %11 = getelementptr i32, i32* %9, i64 4
  %12 = bitcast i32* %11 to <4 x i32>*
  %wide.load62 = load <4 x i32>, <4 x i32>* %12, align 4, !alias.scope !1, !noalias !4
  %13 = load i32, i32* %arrayidx12.us.us, align 4, !alias.scope !7
  %14 = insertelement <4 x i32> undef, i32 %13, i32 0
  %15 = shufflevector <4 x i32> %14, <4 x i32> undef, <4 x i32> zeroinitializer
  %16 = insertelement <4 x i32> undef, i32 %13, i32 0
  %17 = shufflevector <4 x i32> %16, <4 x i32> undef, <4 x i32> zeroinitializer
  %18 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv48, i64 %index
  %19 = bitcast i32* %18 to <4 x i32>*
  %wide.load63 = load <4 x i32>, <4 x i32>* %19, align 4, !alias.scope !8
  %20 = getelementptr i32, i32* %18, i64 4
  %21 = bitcast i32* %20 to <4 x i32>*
  %wide.load64 = load <4 x i32>, <4 x i32>* %21, align 4, !alias.scope !8
  %22 = add nsw <4 x i32> %wide.load63, %15
  %23 = add nsw <4 x i32> %wide.load64, %17
  %24 = icmp slt <4 x i32> %wide.load, %22
  %25 = icmp slt <4 x i32> %wide.load62, %23
  %26 = select <4 x i1> %24, <4 x i32> %wide.load, <4 x i32> %22
  %27 = select <4 x i1> %25, <4 x i32> %wide.load62, <4 x i32> %23
  %28 = bitcast i32* %9 to <4 x i32>*
  store <4 x i32> %26, <4 x i32>* %28, align 4, !alias.scope !1, !noalias !4
  %29 = bitcast i32* %11 to <4 x i32>*
  store <4 x i32> %27, <4 x i32>* %29, align 4, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 8
  %30 = icmp eq i64 %index.next, %n.vec
  br i1 %30, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc35.us.us, label %for.body6.us.us.preheader

for.inc35.us.us.loopexit.unr-lcssa:               ; preds = %for.body6.us.us
  br label %for.inc35.us.us.loopexit

for.inc35.us.us.loopexit:                         ; preds = %for.body6.us.us.prol.loopexit, %for.inc35.us.us.loopexit.unr-lcssa
  br label %for.inc35.us.us

for.inc35.us.us:                                  ; preds = %for.inc35.us.us.loopexit, %middle.block
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next47, %1
  br i1 %exitcond65, label %for.inc38.us, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.body6.us.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.us.us.preheader.new ], [ %indvars.iv.next.1, %for.body6.us.us ]
  %arrayidx8.us.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv46, i64 %indvars.iv
  %31 = load i32, i32* %arrayidx8.us.us, align 4
  %32 = load i32, i32* %arrayidx12.us.us, align 4
  %arrayidx16.us.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv48, i64 %indvars.iv
  %33 = load i32, i32* %arrayidx16.us.us, align 4
  %add.us.us = add nsw i32 %33, %32
  %cmp17.us.us = icmp slt i32 %31, %add.us.us
  %.add.us.us = select i1 %cmp17.us.us, i32 %31, i32 %add.us.us
  store i32 %.add.us.us, i32* %arrayidx8.us.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.us.us.1 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv46, i64 %indvars.iv.next
  %34 = load i32, i32* %arrayidx8.us.us.1, align 4
  %35 = load i32, i32* %arrayidx12.us.us, align 4
  %arrayidx16.us.us.1 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv48, i64 %indvars.iv.next
  %36 = load i32, i32* %arrayidx16.us.us.1, align 4
  %add.us.us.1 = add nsw i32 %36, %35
  %cmp17.us.us.1 = icmp slt i32 %34, %add.us.us.1
  %.add.us.us.1 = select i1 %cmp17.us.us.1, i32 %34, i32 %add.us.us.1
  store i32 %.add.us.us.1, i32* %arrayidx8.us.us.1, align 4
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc35.us.us.loopexit.unr-lcssa, label %for.body6.us.us, !llvm.loop !12

for.end40.loopexit:                               ; preds = %for.inc38.us
  br label %for.end40

for.end40:                                        ; preds = %for.end40.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2800 x i32]* %path) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge, label %for.end12

for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge: ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge
  %indvars.iv10 = phi i64 [ 0, %for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge ], [ %indvars.iv.next11, %for.inc10.us ]
  %4 = mul nsw i64 %indvars.iv10, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %5 = add nsw i64 %4, %indvars.iv
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv10, i64 %indvars.iv
  %9 = load i32, i32* %arrayidx8.us, align 4
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, %3
  br i1 %exitcond13, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.inc10.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
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
