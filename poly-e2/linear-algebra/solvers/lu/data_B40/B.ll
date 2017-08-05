; ModuleID = 'A.ll'
source_filename = "lu.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %arraydecay)
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
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #0 {
entry:
  %cmp40 = icmp sgt i32 %n, 0
  br i1 %cmp40, label %for.cond1.preheader.lr.ph, label %for.end25.thread

for.end25.thread:                                 ; preds = %entry
  %call93 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
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
  tail call void @free(i8* %call9597103) #4
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

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  %cmp9 = icmp sgt i32 %n, 0
  br i1 %cmp9, label %for.cond1.preheader.preheader, label %for.end56

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count41 = zext i32 %n to i64
  %wide.trip.count35 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.inc54
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %for.inc54 ], [ 0, %for.cond1.preheader.preheader ]
  %0 = add i64 %indvars.iv39, 4294967295
  %cmp23 = icmp sgt i64 %indvars.iv39, 0
  br i1 %cmp23, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.lr.ph:                       ; preds = %for.end
  %cmp325 = icmp sgt i64 %indvars.iv39, 0
  br i1 %cmp325, label %for.cond31.preheader.us.preheader, label %for.inc54

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter2943 = and i64 %indvars.iv39, 1
  %lcmp.mod30 = icmp eq i64 %xtraiter2943, 0
  %1 = trunc i64 %0 to i32
  %2 = icmp eq i32 %1, 0
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv39, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv33
  br i1 %lcmp.mod30, label %for.body33.us.prol.loopexit, label %for.body33.us.prol

for.body33.us.prol:                               ; preds = %for.cond31.preheader.us
  %3 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv33
  %4 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %3, %4
  %5 = load double, double* %arrayidx46.us, align 8
  %sub47.us.prol = fsub double %5, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.body33.us.prol.loopexit

for.body33.us.prol.loopexit:                      ; preds = %for.body33.us.prol, %for.cond31.preheader.us
  %indvars.iv24.unr.ph = phi i64 [ 1, %for.body33.us.prol ], [ 0, %for.cond31.preheader.us ]
  br i1 %2, label %for.cond31.for.inc51_crit_edge.us, label %for.body33.us.preheader

for.body33.us.preheader:                          ; preds = %for.body33.us.prol.loopexit
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us.preheader, %for.body33.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25.1, %for.body33.us ], [ %indvars.iv24.unr.ph, %for.body33.us.preheader ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv24
  %6 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv33
  %7 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %6, %7
  %8 = load double, double* %arrayidx46.us, align 8
  %sub47.us = fsub double %8, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv.next25
  %9 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next25, i64 %indvars.iv33
  %10 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %9, %10
  %11 = load double, double* %arrayidx46.us, align 8
  %sub47.us.1 = fsub double %11, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  %exitcond28.1 = icmp eq i64 %indvars.iv.next25.1, %indvars.iv39
  br i1 %exitcond28.1, label %for.cond31.for.inc51_crit_edge.us.loopexit, label %for.body33.us

for.cond31.for.inc51_crit_edge.us.loopexit:       ; preds = %for.body33.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.cond31.for.inc51_crit_edge.us.loopexit, %for.body33.us.prol.loopexit
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond36, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.end
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %for.end ], [ 0, %for.cond4.preheader.preheader ]
  %12 = add i64 %indvars.iv18, 4294967295
  %cmp51 = icmp sgt i64 %indvars.iv18, 0
  br i1 %cmp51, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv18
  %xtraiter44 = and i64 %indvars.iv18, 1
  %lcmp.mod = icmp eq i64 %xtraiter44, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit, label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.lr.ph
  %13 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv18
  %14 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %13, %14
  %15 = load double, double* %arrayidx16, align 8
  %sub.prol = fsub double %15, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol, %for.body6.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.lr.ph ]
  %16 = trunc i64 %12 to i32
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %for.end, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6.preheader, %for.body6
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6 ], [ %indvars.iv.unr.ph, %for.body6.preheader ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv
  %18 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv18
  %19 = load double, double* %arrayidx12, align 8
  %mul = fmul double %18, %19
  %20 = load double, double* %arrayidx16, align 8
  %sub = fsub double %20, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv.next
  %21 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv18
  %22 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %21, %22
  %23 = load double, double* %arrayidx16, align 8
  %sub.1 = fsub double %23, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv18
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body6.prol.loopexit, %for.cond4.preheader
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv18
  %24 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv18
  %25 = load double, double* %arrayidx24, align 8
  %div = fdiv double %25, %24
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next19, %indvars.iv39
  br i1 %exitcond, label %for.cond31.preheader.lr.ph, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond1.preheader, %for.cond31.preheader.lr.ph
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %for.end56.loopexit, label %for.cond1.preheader

for.end56.loopexit:                               ; preds = %for.inc54
  br label %for.end56

for.end56:                                        ; preds = %for.end56.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count10 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next8, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv7, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #6
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, %wide.trip.count10
  br i1 %exitcond11, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
