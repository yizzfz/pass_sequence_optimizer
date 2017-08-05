; ModuleID = 'A.ll'
source_filename = "cholesky.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #0 {
entry:
  %cmp40 = icmp sgt i32 %n, 0
  br i1 %cmp40, label %for.cond1.preheader.lr.ph, label %for.end25.thread

for.end25.thread:                                 ; preds = %entry
  %call93 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.end99

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv4 = sitofp i32 %n to double
  %0 = add i32 %n, -2
  %1 = zext i32 %0 to i64
  %2 = sext i32 %n to i64
  %wide.trip.count91 = zext i32 %n to i64
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader.lr.ph, %for.end18
  %indvars.iv89 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next90, %for.end18 ]
  %indvars.iv87 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next88, %for.end18 ]
  %3 = mul nuw nsw i64 %indvars.iv89, 2001
  %4 = add nuw nsw i64 %3, 1
  %scevgep85 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %4
  %scevgep8586 = bitcast double* %scevgep85 to i8*
  %5 = sub i64 %1, %indvars.iv89
  %6 = shl i64 %5, 3
  %7 = and i64 %6, 34359738360
  %8 = add nuw nsw i64 %7, 8
  br label %for.body3

for.cond8.preheader:                              ; preds = %for.body3
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %cmp938 = icmp slt i64 %indvars.iv.next90, %2
  br i1 %cmp938, label %for.end18.loopexit, label %for.end18

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %for.body3 ], [ 0, %for.body3.lr.ph ]
  %9 = sub nsw i64 0, %indvars.iv72
  %10 = trunc i64 %9 to i32
  %rem = srem i32 %10, %n
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv4
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv72
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next73, %indvars.iv87
  br i1 %exitcond78, label %for.cond8.preheader, label %for.body3

for.end18.loopexit:                               ; preds = %for.cond8.preheader
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep8586, i8 0, i64 %8, i32 8, i1 false)
  br label %for.end18

for.end18:                                        ; preds = %for.end18.loopexit, %for.cond8.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv89
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next90, %wide.trip.count91
  br i1 %exitcond92, label %for.end25, label %for.body3.lr.ph

for.end25:                                        ; preds = %for.end18
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %11 = bitcast i8* %call to [2000 x [2000 x double]]*
  %cmp2733 = icmp sgt i32 %n, 0
  br i1 %cmp2733, label %for.cond30.preheader.us.preheader, label %for.end99

for.cond30.preheader.us.preheader:                ; preds = %for.end25
  %12 = add i32 %n, -1
  %13 = zext i32 %12 to i64
  %14 = shl nuw nsw i64 %13, 3
  %15 = add nuw nsw i64 %14, 8
  %xtraiter69 = and i32 %n, 3
  %lcmp.mod70 = icmp eq i32 %xtraiter69, 0
  br i1 %lcmp.mod70, label %for.cond30.preheader.us.prol.loopexit, label %for.cond30.for.inc41_crit_edge.us.prol.preheader

for.cond30.for.inc41_crit_edge.us.prol.preheader: ; preds = %for.cond30.preheader.us.preheader
  br label %for.cond30.for.inc41_crit_edge.us.prol

for.cond30.for.inc41_crit_edge.us.prol:           ; preds = %for.cond30.for.inc41_crit_edge.us.prol.preheader, %for.cond30.for.inc41_crit_edge.us.prol
  %indvars.iv65.prol = phi i64 [ %indvars.iv.next66.prol, %for.cond30.for.inc41_crit_edge.us.prol ], [ 0, %for.cond30.for.inc41_crit_edge.us.prol.preheader ]
  %prol.iter71 = phi i32 [ %prol.iter71.sub, %for.cond30.for.inc41_crit_edge.us.prol ], [ %xtraiter69, %for.cond30.for.inc41_crit_edge.us.prol.preheader ]
  %16 = mul nuw nsw i64 %indvars.iv65.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %15, i32 8, i1 false)
  %indvars.iv.next66.prol = add nuw nsw i64 %indvars.iv65.prol, 1
  %prol.iter71.sub = add i32 %prol.iter71, -1
  %prol.iter71.cmp = icmp eq i32 %prol.iter71.sub, 0
  br i1 %prol.iter71.cmp, label %for.cond30.preheader.us.prol.loopexit.loopexit, label %for.cond30.for.inc41_crit_edge.us.prol, !llvm.loop !1

for.cond30.preheader.us.prol.loopexit.loopexit:   ; preds = %for.cond30.for.inc41_crit_edge.us.prol
  br label %for.cond30.preheader.us.prol.loopexit

for.cond30.preheader.us.prol.loopexit:            ; preds = %for.cond30.preheader.us.prol.loopexit.loopexit, %for.cond30.preheader.us.preheader
  %indvars.iv65.unr = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next66.prol, %for.cond30.preheader.us.prol.loopexit.loopexit ]
  %17 = icmp ult i32 %12, 3
  br i1 %17, label %for.cond48.preheader.lr.ph, label %for.cond30.for.inc41_crit_edge.us.3.preheader

for.cond30.for.inc41_crit_edge.us.3.preheader:    ; preds = %for.cond30.preheader.us.prol.loopexit
  %wide.trip.count67.3 = zext i32 %n to i64
  %18 = add nsw i64 %wide.trip.count67.3, -4
  %19 = sub i64 %18, %indvars.iv65.unr
  %20 = lshr i64 %19, 2
  %21 = and i64 %20, 1
  %lcmp.mod105 = icmp eq i64 %21, 0
  br i1 %lcmp.mod105, label %for.cond30.for.inc41_crit_edge.us.3.prol.preheader, label %for.cond30.for.inc41_crit_edge.us.3.prol.loopexit

for.cond30.for.inc41_crit_edge.us.3.prol.preheader: ; preds = %for.cond30.for.inc41_crit_edge.us.3.preheader
  br label %for.cond30.for.inc41_crit_edge.us.3.prol

for.cond30.for.inc41_crit_edge.us.3.prol:         ; preds = %for.cond30.for.inc41_crit_edge.us.3.prol.preheader
  %22 = mul nuw nsw i64 %indvars.iv65.unr, 16000
  %scevgep.prol107 = getelementptr i8, i8* %call, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol107, i8 0, i64 %15, i32 8, i1 false)
  %23 = mul i64 %indvars.iv65.unr, 16000
  %24 = add i64 %23, 16000
  %scevgep.1.prol = getelementptr i8, i8* %call, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %15, i32 8, i1 false)
  %25 = mul i64 %indvars.iv65.unr, 16000
  %26 = add i64 %25, 32000
  %scevgep.2.prol = getelementptr i8, i8* %call, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %15, i32 8, i1 false)
  %27 = mul i64 %indvars.iv65.unr, 16000
  %28 = add i64 %27, 48000
  %scevgep.3.prol = getelementptr i8, i8* %call, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %15, i32 8, i1 false)
  %indvars.iv.next66.3.prol = add nsw i64 %indvars.iv65.unr, 4
  br label %for.cond30.for.inc41_crit_edge.us.3.prol.loopexit

for.cond30.for.inc41_crit_edge.us.3.prol.loopexit: ; preds = %for.cond30.for.inc41_crit_edge.us.3.prol, %for.cond30.for.inc41_crit_edge.us.3.preheader
  %indvars.iv65.unr108 = phi i64 [ %indvars.iv65.unr, %for.cond30.for.inc41_crit_edge.us.3.preheader ], [ %indvars.iv.next66.3.prol, %for.cond30.for.inc41_crit_edge.us.3.prol ]
  %29 = icmp eq i64 %20, 0
  br i1 %29, label %for.cond44.preheader, label %for.cond30.for.inc41_crit_edge.us.3.preheader.new

for.cond30.for.inc41_crit_edge.us.3.preheader.new: ; preds = %for.cond30.for.inc41_crit_edge.us.3.prol.loopexit
  br label %for.cond30.for.inc41_crit_edge.us.3

for.cond44.preheader.unr-lcssa:                   ; preds = %for.cond30.for.inc41_crit_edge.us.3
  br label %for.cond44.preheader

for.cond44.preheader:                             ; preds = %for.cond30.for.inc41_crit_edge.us.3.prol.loopexit, %for.cond44.preheader.unr-lcssa
  %cmp459 = icmp sgt i32 %n, 0
  br i1 %cmp459, label %for.cond48.preheader.lr.ph, label %for.end99

for.cond48.preheader.lr.ph:                       ; preds = %for.cond30.preheader.us.prol.loopexit, %for.cond44.preheader
  %xtraiter51 = and i32 %n, 1
  %lcmp.mod52 = icmp eq i32 %xtraiter51, 0
  %30 = icmp eq i32 %n, 1
  %wide.trip.count55 = zext i32 %n to i64
  %wide.trip.count49.1 = zext i32 %n to i64
  %wide.trip.count59 = zext i32 %n to i64
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond48.preheader.lr.ph, %for.cond48.for.inc75_crit_edge.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %for.cond48.for.inc75_crit_edge.us ], [ 0, %for.cond48.preheader.lr.ph ]
  %arrayidx63.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv57
  br label %for.cond52.preheader.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %for.cond78.preheader, label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv53 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next54, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv57
  br i1 %lcmp.mod52, label %for.body55.us.us.prol.loopexit, label %for.body55.us.us.prol

for.body55.us.us.prol:                            ; preds = %for.cond52.preheader.us.us
  %31 = load double, double* %arrayidx59.us.us, align 8
  %32 = load double, double* %arrayidx63.us.us.prol, align 8
  %mul.us.us.prol = fmul double %31, %32
  %arrayidx67.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv53, i64 0
  %33 = load double, double* %arrayidx67.us.us.prol, align 8
  %add68.us.us.prol = fadd double %33, %mul.us.us.prol
  store double %add68.us.us.prol, double* %arrayidx67.us.us.prol, align 8
  br label %for.body55.us.us.prol.loopexit

for.body55.us.us.prol.loopexit:                   ; preds = %for.body55.us.us.prol, %for.cond52.preheader.us.us
  %indvars.iv47.unr.ph = phi i64 [ 1, %for.body55.us.us.prol ], [ 0, %for.cond52.preheader.us.us ]
  br i1 %30, label %for.cond52.for.inc72_crit_edge.us.us, label %for.body55.us.us.preheader

for.body55.us.us.preheader:                       ; preds = %for.body55.us.us.prol.loopexit
  br label %for.body55.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.body55.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit, %for.body55.us.us.prol.loopexit
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count55
  br i1 %exitcond56, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.preheader.us.us

for.body55.us.us:                                 ; preds = %for.body55.us.us.preheader, %for.body55.us.us
  %indvars.iv47 = phi i64 [ %indvars.iv.next48.1, %for.body55.us.us ], [ %indvars.iv47.unr.ph, %for.body55.us.us.preheader ]
  %34 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv57
  %35 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %34, %35
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv53, i64 %indvars.iv47
  %36 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %36, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %37 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next48, i64 %indvars.iv57
  %38 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %37, %38
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv53, i64 %indvars.iv.next48
  %39 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %39, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %exitcond50.1 = icmp eq i64 %indvars.iv.next48.1, %wide.trip.count49.1
  br i1 %exitcond50.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.body55.us.us

for.cond78.preheader:                             ; preds = %for.cond48.for.inc75_crit_edge.us
  %cmp793 = icmp sgt i32 %n, 0
  br i1 %cmp793, label %for.cond82.preheader.us.preheader, label %for.end99

for.cond82.preheader.us.preheader:                ; preds = %for.cond78.preheader
  %40 = add i32 %n, -1
  %xtraiter = and i32 %n, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %41 = icmp ult i32 %40, 3
  %wide.trip.count46 = zext i32 %n to i64
  %wide.trip.count.3 = zext i32 %n to i64
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.inc97_crit_edge.us, %for.cond82.preheader.us.preheader
  %indvars.iv44 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %indvars.iv.next45, %for.cond82.for.inc97_crit_edge.us ]
  br i1 %lcmp.mod, label %for.body85.us.prol.loopexit, label %for.body85.us.prol.preheader

for.body85.us.prol.preheader:                     ; preds = %for.cond82.preheader.us
  br label %for.body85.us.prol

for.body85.us.prol:                               ; preds = %for.body85.us.prol.preheader, %for.body85.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body85.us.prol ], [ 0, %for.body85.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body85.us.prol ], [ %xtraiter, %for.body85.us.prol.preheader ]
  %arrayidx89.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv44, i64 %indvars.iv.prol
  %42 = bitcast double* %arrayidx89.us.prol to i64*
  %43 = load i64, i64* %42, align 8
  %arrayidx93.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.prol
  %44 = bitcast double* %arrayidx93.us.prol to i64*
  store i64 %43, i64* %44, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body85.us.prol.loopexit.loopexit, label %for.body85.us.prol, !llvm.loop !3

for.body85.us.prol.loopexit.loopexit:             ; preds = %for.body85.us.prol
  br label %for.body85.us.prol.loopexit

for.body85.us.prol.loopexit:                      ; preds = %for.body85.us.prol.loopexit.loopexit, %for.cond82.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %for.cond82.preheader.us ], [ %indvars.iv.next.prol, %for.body85.us.prol.loopexit.loopexit ]
  br i1 %41, label %for.cond82.for.inc97_crit_edge.us, label %for.body85.us.preheader

for.body85.us.preheader:                          ; preds = %for.body85.us.prol.loopexit
  br label %for.body85.us

for.body85.us:                                    ; preds = %for.body85.us.preheader, %for.body85.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body85.us ], [ %indvars.iv.unr, %for.body85.us.preheader ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv44, i64 %indvars.iv
  %45 = bitcast double* %arrayidx89.us to i64*
  %46 = load i64, i64* %45, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv
  %47 = bitcast double* %arrayidx93.us to i64*
  store i64 %46, i64* %47, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next
  %48 = bitcast double* %arrayidx89.us.1 to i64*
  %49 = load i64, i64* %48, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.next
  %50 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %49, i64* %50, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %51 = bitcast double* %arrayidx89.us.2 to i64*
  %52 = load i64, i64* %51, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %53 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %52, i64* %53, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next.2
  %54 = bitcast double* %arrayidx89.us.3 to i64*
  %55 = load i64, i64* %54, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.next.2
  %56 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %55, i64* %56, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.body85.us

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.body85.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit, %for.body85.us.prol.loopexit
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond = icmp eq i64 %indvars.iv.next45, %wide.trip.count46
  br i1 %exitcond, label %for.end99.loopexit, label %for.cond82.preheader.us

for.end99.loopexit:                               ; preds = %for.cond82.for.inc97_crit_edge.us
  br label %for.end99

for.end99:                                        ; preds = %for.end99.loopexit, %for.end25, %for.end25.thread, %for.cond44.preheader, %for.cond78.preheader
  %call9597103 = phi i8* [ %call, %for.cond78.preheader ], [ %call, %for.cond44.preheader ], [ %call, %for.end25 ], [ %call93, %for.end25.thread ], [ %call, %for.end99.loopexit ]
  tail call void @free(i8* %call9597103) #3
  ret void

for.cond30.for.inc41_crit_edge.us.3:              ; preds = %for.cond30.for.inc41_crit_edge.us.3, %for.cond30.for.inc41_crit_edge.us.3.preheader.new
  %indvars.iv65 = phi i64 [ %indvars.iv65.unr108, %for.cond30.for.inc41_crit_edge.us.3.preheader.new ], [ %indvars.iv.next66.3.1, %for.cond30.for.inc41_crit_edge.us.3 ]
  %57 = mul nuw nsw i64 %indvars.iv65, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %15, i32 8, i1 false)
  %58 = mul i64 %indvars.iv65, 16000
  %59 = add i64 %58, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %15, i32 8, i1 false)
  %60 = mul i64 %indvars.iv65, 16000
  %61 = add i64 %60, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %61
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %15, i32 8, i1 false)
  %62 = mul i64 %indvars.iv65, 16000
  %63 = add i64 %62, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %63
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %15, i32 8, i1 false)
  %indvars.iv.next66.3 = add nsw i64 %indvars.iv65, 4
  %64 = mul nuw nsw i64 %indvars.iv.next66.3, 16000
  %scevgep.1109 = getelementptr i8, i8* %call, i64 %64
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1109, i8 0, i64 %15, i32 8, i1 false)
  %65 = mul i64 %indvars.iv.next66.3, 16000
  %66 = add i64 %65, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %66
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %15, i32 8, i1 false)
  %67 = mul i64 %indvars.iv.next66.3, 16000
  %68 = add i64 %67, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %68
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %15, i32 8, i1 false)
  %69 = mul i64 %indvars.iv.next66.3, 16000
  %70 = add i64 %69, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %70
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %15, i32 8, i1 false)
  %indvars.iv.next66.3.1 = add nsw i64 %indvars.iv65, 8
  %exitcond68.3.1 = icmp eq i64 %indvars.iv.next66.3.1, %wide.trip.count67.3
  br i1 %exitcond68.3.1, label %for.cond44.preheader.unr-lcssa, label %for.cond30.for.inc41_crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #0 {
entry:
  %cmp7 = icmp sgt i32 %n, 0
  br i1 %cmp7, label %for.cond1.preheader.preheader, label %for.end58

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count29 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.end47
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for.end47 ], [ 0, %for.cond1.preheader.preheader ]
  %0 = add i64 %indvars.iv27, -2
  %1 = add i64 %indvars.iv27, 4294967295
  %cmp23 = icmp sgt i64 %indvars.iv27, 0
  br i1 %cmp23, label %for.cond4.preheader.preheader, label %for.end47

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 0
  br label %for.cond4.preheader

for.cond28.preheader:                             ; preds = %for.end
  %cmp295 = icmp sgt i64 %indvars.iv27, 0
  br i1 %cmp295, label %for.body30.lr.ph, label %for.end47

for.body30.lr.ph:                                 ; preds = %for.cond28.preheader
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv27
  %xtraiter2331 = and i64 %indvars.iv27, 1
  %lcmp.mod24 = icmp eq i64 %xtraiter2331, 0
  br i1 %lcmp.mod24, label %for.body30.prol.loopexit, label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.lr.ph
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 0
  %2 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %2, %2
  %3 = load double, double* %arrayidx43, align 8
  %sub44.prol = fsub double %3, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol, %for.body30.lr.ph
  %indvars.iv18.unr.ph = phi i64 [ 1, %for.body30.prol ], [ 0, %for.body30.lr.ph ]
  %4 = trunc i64 %1 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %for.end47, label %for.body30.preheader

for.body30.preheader:                             ; preds = %for.body30.prol.loopexit
  %6 = sub i64 %0, %indvars.iv18.unr.ph
  %7 = lshr i64 %6, 1
  %8 = and i64 %7, 1
  %lcmp.mod35 = icmp eq i64 %8, 0
  br i1 %lcmp.mod35, label %for.body30.prol.preheader, label %for.body30.prol.loopexit34.unr-lcssa

for.body30.prol.preheader:                        ; preds = %for.body30.preheader
  br label %for.body30.prol36

for.body30.prol36:                                ; preds = %for.body30.prol.preheader
  %arrayidx34.prol37 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv18.unr.ph
  %9 = load double, double* %arrayidx34.prol37, align 8
  %mul39.prol38 = fmul double %9, %9
  %10 = load double, double* %arrayidx43, align 8
  %sub44.prol39 = fsub double %10, %mul39.prol38
  store double %sub44.prol39, double* %arrayidx43, align 8
  %indvars.iv.next19.prol = add nuw nsw i64 %indvars.iv18.unr.ph, 1
  %arrayidx34.1.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv.next19.prol
  %11 = load double, double* %arrayidx34.1.prol, align 8
  %mul39.1.prol = fmul double %11, %11
  %sub44.1.prol = fsub double %sub44.prol39, %mul39.1.prol
  store double %sub44.1.prol, double* %arrayidx43, align 8
  %indvars.iv.next19.1.prol = or i64 %indvars.iv18.unr.ph, 2
  br label %for.body30.prol.loopexit34.unr-lcssa

for.body30.prol.loopexit34.unr-lcssa:             ; preds = %for.body30.preheader, %for.body30.prol36
  %indvars.iv18.unr.ph40 = phi i64 [ %indvars.iv.next19.1.prol, %for.body30.prol36 ], [ %indvars.iv18.unr.ph, %for.body30.preheader ]
  br label %for.body30.prol.loopexit34

for.body30.prol.loopexit34:                       ; preds = %for.body30.prol.loopexit34.unr-lcssa
  %12 = icmp eq i64 %7, 0
  br i1 %12, label %for.end47.loopexit, label %for.body30.preheader.new

for.body30.preheader.new:                         ; preds = %for.body30.prol.loopexit34
  br label %for.body30

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.end
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %for.end ], [ 0, %for.cond4.preheader.preheader ]
  %13 = add i64 %indvars.iv13, 4294967295
  %cmp51 = icmp sgt i64 %indvars.iv13, 0
  br i1 %cmp51, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv13
  %xtraiter32 = and i64 %indvars.iv13, 1
  %lcmp.mod = icmp eq i64 %xtraiter32, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit, label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.lr.ph
  %14 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv13, i64 0
  %15 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %14, %15
  %16 = load double, double* %arrayidx16, align 8
  %sub.prol = fsub double %16, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol, %for.body6.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.lr.ph ]
  %17 = trunc i64 %13 to i32
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %for.end, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6.preheader, %for.body6
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6 ], [ %indvars.iv.unr.ph, %for.body6.preheader ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv
  %19 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv13, i64 %indvars.iv
  %20 = load double, double* %arrayidx12, align 8
  %mul = fmul double %19, %20
  %21 = load double, double* %arrayidx16, align 8
  %sub = fsub double %21, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv.next
  %22 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv13, i64 %indvars.iv.next
  %23 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %22, %23
  %24 = load double, double* %arrayidx16, align 8
  %sub.1 = fsub double %24, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv13
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body6.prol.loopexit, %for.cond4.preheader
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv13, i64 %indvars.iv13
  %25 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv13
  %26 = load double, double* %arrayidx24, align 8
  %div = fdiv double %26, %25
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, %indvars.iv27
  br i1 %exitcond, label %for.cond28.preheader, label %for.cond4.preheader

for.body30:                                       ; preds = %for.body30, %for.body30.preheader.new
  %indvars.iv18 = phi i64 [ %indvars.iv18.unr.ph40, %for.body30.preheader.new ], [ %indvars.iv.next19.1.1, %for.body30 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv18
  %27 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %27, %27
  %28 = load double, double* %arrayidx43, align 8
  %sub44 = fsub double %28, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv.next19
  %29 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %29, %29
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  %arrayidx34.141 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv.next19.1
  %30 = load double, double* %arrayidx34.141, align 8
  %mul39.142 = fmul double %30, %30
  %sub44.143 = fsub double %sub44.1, %mul39.142
  store double %sub44.143, double* %arrayidx43, align 8
  %indvars.iv.next19.144 = add nsw i64 %indvars.iv18, 3
  %arrayidx34.1.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv.next19.144
  %31 = load double, double* %arrayidx34.1.1, align 8
  %mul39.1.1 = fmul double %31, %31
  %sub44.1.1 = fsub double %sub44.143, %mul39.1.1
  store double %sub44.1.1, double* %arrayidx43, align 8
  %indvars.iv.next19.1.1 = add nsw i64 %indvars.iv18, 4
  %exitcond22.1.1 = icmp eq i64 %indvars.iv.next19.1.1, %indvars.iv27
  br i1 %exitcond22.1.1, label %for.end47.loopexit.unr-lcssa, label %for.body30

for.end47.loopexit.unr-lcssa:                     ; preds = %for.body30
  br label %for.end47.loopexit

for.end47.loopexit:                               ; preds = %for.body30.prol.loopexit34, %for.end47.loopexit.unr-lcssa
  br label %for.end47

for.end47:                                        ; preds = %for.end47.loopexit, %for.cond1.preheader, %for.body30.prol.loopexit, %for.cond28.preheader
  %arrayidx51 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv27
  %32 = load double, double* %arrayidx51, align 8
  %call = tail call double @sqrt(double %32) #3
  store double %call, double* %arrayidx51, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, %wide.trip.count29
  br i1 %exitcond30, label %for.end58.loopexit, label %for.cond1.preheader

for.end58.loopexit:                               ; preds = %for.end47
  br label %for.end58

for.end58:                                        ; preds = %for.end58.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.preheader, label %for.end12

for.cond2.preheader.preheader:                    ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count14 = zext i32 %n to i64
  br label %for.body4.lr.ph

for.body4.lr.ph:                                  ; preds = %for.cond2.preheader.preheader, %for.inc10
  %indvars.iv11 = phi i64 [ 0, %for.cond2.preheader.preheader ], [ %indvars.iv.next12, %for.inc10 ]
  %indvars.iv9 = phi i64 [ 1, %for.cond2.preheader.preheader ], [ %indvars.iv.next10, %for.inc10 ]
  %4 = mul nsw i64 %indvars.iv11, %3
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.body4.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %for.body4.lr.ph ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv
  %9 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv9
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next12, %wide.trip.count14
  br i1 %exitcond15, label %for.end12.loopexit, label %for.body4.lr.ph

for.end12.loopexit:                               ; preds = %for.inc10
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
