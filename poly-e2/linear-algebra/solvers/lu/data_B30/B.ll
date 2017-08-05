; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
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
  %arraydecay3 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  %cmp54 = icmp sgt i32 %n, 0
  br i1 %cmp54, label %for.cond1.preheader.lr.ph, label %for.end25.thread

for.end25.thread:                                 ; preds = %entry
  %call132 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %0 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call132, i8** %0, align 8
  br label %for.cond78.preheader.for.end99_crit_edge

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv4 = sitofp i32 %n to double
  %1 = sext i32 %n to i64
  %2 = zext i32 %n to i64
  %3 = add nsw i64 %2, -1
  %wide.trip.count127 = zext i32 %n to i64
  %4 = add nsw i64 %2, -2
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23, %for.cond1.preheader.lr.ph
  %indvars.iv125 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next126, %for.inc23 ]
  %indvars.iv123 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next124, %for.inc23 ]
  %5 = phi [2000 x double]* [ %A, %for.cond1.preheader.lr.ph ], [ %.lcssa10, %for.inc23 ]
  %6 = sub i64 %3, %indvars.iv125
  %7 = sub i64 %4, %indvars.iv125
  br label %for.inc

for.cond8.preheader:                              ; preds = %for.inc
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %cmp945 = icmp slt i64 %indvars.iv.next126, %1
  br i1 %cmp945, label %for.inc16.lr.ph, label %for.inc23

for.inc16.lr.ph:                                  ; preds = %for.cond8.preheader
  %8 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %xtraiter187 = and i64 %6, 7
  %lcmp.mod188 = icmp eq i64 %xtraiter187, 0
  br i1 %lcmp.mod188, label %for.inc16.prol.loopexit, label %for.inc16.prol.preheader

for.inc16.prol.preheader:                         ; preds = %for.inc16.lr.ph
  br label %for.inc16.prol

for.inc16.prol:                                   ; preds = %for.inc16.prol, %for.inc16.prol.preheader
  %indvars.iv119.prol = phi i64 [ %indvars.iv123, %for.inc16.prol.preheader ], [ %indvars.iv.next120.prol, %for.inc16.prol ]
  %9 = phi [2000 x double]* [ %.pre, %for.inc16.prol.preheader ], [ %8, %for.inc16.prol ]
  %prol.iter189 = phi i64 [ %xtraiter187, %for.inc16.prol.preheader ], [ %prol.iter189.sub, %for.inc16.prol ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv125, i64 %indvars.iv119.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next120.prol = add nuw nsw i64 %indvars.iv119.prol, 1
  %prol.iter189.sub = add i64 %prol.iter189, -1
  %prol.iter189.cmp = icmp eq i64 %prol.iter189.sub, 0
  br i1 %prol.iter189.cmp, label %for.inc16.prol.loopexit.unr-lcssa, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.unr-lcssa:                ; preds = %for.inc16.prol
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.lr.ph, %for.inc16.prol.loopexit.unr-lcssa
  %indvars.iv119.unr = phi i64 [ %indvars.iv123, %for.inc16.lr.ph ], [ %indvars.iv.next120.prol, %for.inc16.prol.loopexit.unr-lcssa ]
  %.unr = phi [2000 x double]* [ %.pre, %for.inc16.lr.ph ], [ %8, %for.inc16.prol.loopexit.unr-lcssa ]
  %10 = icmp ult i64 %7, 7
  br i1 %10, label %for.inc23.loopexit, label %for.inc16.lr.ph.new

for.inc16.lr.ph.new:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv110 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next111, %for.inc ]
  %11 = sub nsw i64 0, %indvars.iv110
  %12 = trunc i64 %11 to i32
  %rem = srem i32 %12, %n
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv4
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv125, i64 %indvars.iv110
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next111, %indvars.iv123
  br i1 %exitcond116, label %for.cond8.preheader, label %for.inc

for.inc16:                                        ; preds = %for.inc16, %for.inc16.lr.ph.new
  %indvars.iv119 = phi i64 [ %indvars.iv119.unr, %for.inc16.lr.ph.new ], [ %indvars.iv.next120.7, %for.inc16 ]
  %13 = phi [2000 x double]* [ %.unr, %for.inc16.lr.ph.new ], [ %8, %for.inc16 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv125, i64 %indvars.iv119
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv125, i64 %indvars.iv.next120
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next120.1 = add nsw i64 %indvars.iv119, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv125, i64 %indvars.iv.next120.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next120.2 = add nsw i64 %indvars.iv119, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv125, i64 %indvars.iv.next120.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next120.3 = add nsw i64 %indvars.iv119, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv125, i64 %indvars.iv.next120.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next120.4 = add nsw i64 %indvars.iv119, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv125, i64 %indvars.iv.next120.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next120.5 = add nsw i64 %indvars.iv119, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv125, i64 %indvars.iv.next120.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next120.6 = add nsw i64 %indvars.iv119, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv125, i64 %indvars.iv.next120.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %exitcond131.7 = icmp eq i64 %indvars.iv.next120.6, %3
  %indvars.iv.next120.7 = add nsw i64 %indvars.iv119, 8
  br i1 %exitcond131.7, label %for.inc23.loopexit.unr-lcssa, label %for.inc16

for.inc23.loopexit.unr-lcssa:                     ; preds = %for.inc16
  br label %for.inc23.loopexit

for.inc23.loopexit:                               ; preds = %for.inc16.prol.loopexit, %for.inc23.loopexit.unr-lcssa
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %for.cond8.preheader
  %.lcssa10 = phi [2000 x double]* [ %.pre, %for.cond8.preheader ], [ %8, %for.inc23.loopexit ]
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %.lcssa10, i64 %indvars.iv125, i64 %indvars.iv125
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond128 = icmp eq i64 %indvars.iv.next126, %wide.trip.count127
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  br i1 %exitcond128, label %for.end25, label %for.inc.lr.ph

for.end25:                                        ; preds = %for.inc23
  %14 = icmp sgt i32 %n, 0
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %15 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %15, align 8
  br i1 %14, label %for.cond30.preheader.us.preheader, label %for.cond78.preheader.for.end99_crit_edge

for.cond30.preheader.us.preheader:                ; preds = %for.end25
  %16 = add i32 %n, -1
  %17 = zext i32 %16 to i64
  %18 = shl nuw nsw i64 %17, 3
  %19 = add nuw nsw i64 %18, 8
  %20 = zext i32 %n to i64
  %21 = add nsw i64 %20, -1
  %xtraiter184 = and i64 %2, 7
  %lcmp.mod185 = icmp eq i64 %xtraiter184, 0
  br i1 %lcmp.mod185, label %for.cond30.for.inc41_crit_edge.us.prol.loopexit, label %for.cond30.for.inc41_crit_edge.us.prol.preheader

for.cond30.for.inc41_crit_edge.us.prol.preheader: ; preds = %for.cond30.preheader.us.preheader
  br label %for.cond30.for.inc41_crit_edge.us.prol

for.cond30.for.inc41_crit_edge.us.prol:           ; preds = %for.cond30.for.inc41_crit_edge.us.prol, %for.cond30.for.inc41_crit_edge.us.prol.preheader
  %indvars.iv106.prol = phi i64 [ 0, %for.cond30.for.inc41_crit_edge.us.prol.preheader ], [ %indvars.iv.next107.prol, %for.cond30.for.inc41_crit_edge.us.prol ]
  %prol.iter186 = phi i64 [ %xtraiter184, %for.cond30.for.inc41_crit_edge.us.prol.preheader ], [ %prol.iter186.sub, %for.cond30.for.inc41_crit_edge.us.prol ]
  %22 = mul nuw nsw i64 %indvars.iv106.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %19, i32 8, i1 false)
  %indvars.iv.next107.prol = add nuw nsw i64 %indvars.iv106.prol, 1
  %prol.iter186.sub = add i64 %prol.iter186, -1
  %prol.iter186.cmp = icmp eq i64 %prol.iter186.sub, 0
  br i1 %prol.iter186.cmp, label %for.cond30.for.inc41_crit_edge.us.prol.loopexit.unr-lcssa, label %for.cond30.for.inc41_crit_edge.us.prol, !llvm.loop !3

for.cond30.for.inc41_crit_edge.us.prol.loopexit.unr-lcssa: ; preds = %for.cond30.for.inc41_crit_edge.us.prol
  br label %for.cond30.for.inc41_crit_edge.us.prol.loopexit

for.cond30.for.inc41_crit_edge.us.prol.loopexit:  ; preds = %for.cond30.preheader.us.preheader, %for.cond30.for.inc41_crit_edge.us.prol.loopexit.unr-lcssa
  %indvars.iv106.unr = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next107.prol, %for.cond30.for.inc41_crit_edge.us.prol.loopexit.unr-lcssa ]
  %23 = icmp ult i64 %21, 7
  br i1 %23, label %for.cond44.preheader, label %for.cond30.preheader.us.preheader.new

for.cond30.preheader.us.preheader.new:            ; preds = %for.cond30.for.inc41_crit_edge.us.prol.loopexit
  br label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.cond30.for.inc41_crit_edge.us, %for.cond30.preheader.us.preheader.new
  %indvars.iv106 = phi i64 [ %indvars.iv106.unr, %for.cond30.preheader.us.preheader.new ], [ %indvars.iv.next107.7, %for.cond30.for.inc41_crit_edge.us ]
  %24 = mul nuw nsw i64 %indvars.iv106, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %19, i32 8, i1 false)
  %25 = mul i64 %indvars.iv106, 16000
  %26 = add i64 %25, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %19, i32 8, i1 false)
  %27 = mul i64 %indvars.iv106, 16000
  %28 = add i64 %27, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %19, i32 8, i1 false)
  %29 = mul i64 %indvars.iv106, 16000
  %30 = add i64 %29, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %19, i32 8, i1 false)
  %31 = mul i64 %indvars.iv106, 16000
  %32 = add i64 %31, 64000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 %19, i32 8, i1 false)
  %33 = mul i64 %indvars.iv106, 16000
  %34 = add i64 %33, 80000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 %19, i32 8, i1 false)
  %35 = mul i64 %indvars.iv106, 16000
  %36 = add i64 %35, 96000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 %19, i32 8, i1 false)
  %indvars.iv.next107.6 = add nsw i64 %indvars.iv106, 7
  %37 = mul nuw nsw i64 %indvars.iv.next107.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 %19, i32 8, i1 false)
  %exitcond130.7 = icmp eq i64 %indvars.iv.next107.6, %21
  %indvars.iv.next107.7 = add nsw i64 %indvars.iv106, 8
  br i1 %exitcond130.7, label %for.cond44.preheader.unr-lcssa, label %for.cond30.for.inc41_crit_edge.us

for.cond44.preheader.unr-lcssa:                   ; preds = %for.cond30.for.inc41_crit_edge.us
  br label %for.cond44.preheader

for.cond44.preheader:                             ; preds = %for.cond30.for.inc41_crit_edge.us.prol.loopexit, %for.cond44.preheader.unr-lcssa
  %38 = icmp sgt i32 %n, 0
  br i1 %38, label %for.cond48.preheader.us.preheader, label %for.cond78.preheader.for.end99_crit_edge

for.cond48.preheader.us.preheader:                ; preds = %for.cond44.preheader
  %39 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %40 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %41 = zext i32 %n to i64
  %42 = add nsw i64 %41, -1
  %wide.trip.count96 = zext i32 %n to i64
  %wide.trip.count100 = zext i32 %n to i64
  %43 = add nsw i64 %2, -1
  %min.iters.check = icmp ult i32 %n, 4
  %44 = and i32 %n, 3
  %n.mod.vf = zext i32 %44 to i64
  %n.vec = sub nsw i64 %2, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %44, 0
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond48.for.inc75_crit_edge.us, %for.cond48.preheader.us.preheader
  %indvars.iv98 = phi i64 [ 0, %for.cond48.preheader.us.preheader ], [ %indvars.iv.next99, %for.cond48.for.inc75_crit_edge.us ]
  %scevgep139 = getelementptr [2000 x double], [2000 x double]* %39, i64 0, i64 %indvars.iv98
  %45 = add i64 %indvars.iv98, -1999
  %scevgep141 = getelementptr [2000 x double], [2000 x double]* %39, i64 %2, i64 %45
  br label %for.cond52.preheader.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next99, %wide.trip.count100
  br i1 %exitcond101, label %for.cond78.preheader, label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv94 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next95, %for.cond52.for.inc72_crit_edge.us.us ]
  %scevgep135 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv94, i64 0
  %scevgep137 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv94, i64 %2
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv94, i64 %indvars.iv98
  br i1 %min.iters.check, label %for.inc69.us.us.preheader, label %min.iters.checked

for.inc69.us.us.preheader:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond52.preheader.us.us
  %indvars.iv90.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond52.preheader.us.us ], [ %n.vec, %middle.block ]
  %46 = sub nsw i64 %2, %indvars.iv90.ph
  %xtraiter182 = and i64 %46, 1
  %lcmp.mod183 = icmp eq i64 %xtraiter182, 0
  br i1 %lcmp.mod183, label %for.inc69.us.us.prol.loopexit.unr-lcssa, label %for.inc69.us.us.prol.preheader

for.inc69.us.us.prol.preheader:                   ; preds = %for.inc69.us.us.preheader
  br label %for.inc69.us.us.prol

for.inc69.us.us.prol:                             ; preds = %for.inc69.us.us.prol.preheader
  %47 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv90.ph, i64 %indvars.iv98
  %48 = load double, double* %arrayidx63.us.us.prol, align 8
  %mul.us.us.prol = fmul double %47, %48
  %arrayidx67.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv94, i64 %indvars.iv90.ph
  %49 = load double, double* %arrayidx67.us.us.prol, align 8
  %add68.us.us.prol = fadd double %mul.us.us.prol, %49
  store double %add68.us.us.prol, double* %arrayidx67.us.us.prol, align 8
  %indvars.iv.next91.prol = add nuw nsw i64 %indvars.iv90.ph, 1
  br label %for.inc69.us.us.prol.loopexit.unr-lcssa

for.inc69.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.inc69.us.us.preheader, %for.inc69.us.us.prol
  %indvars.iv90.unr.ph = phi i64 [ %indvars.iv.next91.prol, %for.inc69.us.us.prol ], [ %indvars.iv90.ph, %for.inc69.us.us.preheader ]
  br label %for.inc69.us.us.prol.loopexit

for.inc69.us.us.prol.loopexit:                    ; preds = %for.inc69.us.us.prol.loopexit.unr-lcssa
  %50 = icmp eq i64 %43, %indvars.iv90.ph
  br i1 %50, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us.preheader.new

for.inc69.us.us.preheader.new:                    ; preds = %for.inc69.us.us.prol.loopexit
  br label %for.inc69.us.us

min.iters.checked:                                ; preds = %for.cond52.preheader.us.us
  br i1 %cmp.zero, label %for.inc69.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep135, %scevgep141
  %bound1 = icmp ult double* %scevgep139, %scevgep137
  %found.conflict = and i1 %bound0, %bound1
  %bound0144 = icmp ult double* %scevgep135, %arrayidx59.us.us
  %bound1145 = icmp ult double* %arrayidx59.us.us, %scevgep137
  %found.conflict146 = and i1 %bound0144, %bound1145
  %conflict.rdx = or i1 %found.conflict, %found.conflict146
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %51 = or i64 %index, 1
  %52 = or i64 %index, 2
  %53 = or i64 %index, 3
  %54 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !4
  %55 = insertelement <2 x double> undef, double %54, i32 0
  %56 = shufflevector <2 x double> %55, <2 x double> undef, <2 x i32> zeroinitializer
  %57 = insertelement <2 x double> undef, double %54, i32 0
  %58 = shufflevector <2 x double> %57, <2 x double> undef, <2 x i32> zeroinitializer
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %index, i64 %indvars.iv98
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %51, i64 %indvars.iv98
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %52, i64 %indvars.iv98
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %53, i64 %indvars.iv98
  %63 = load double, double* %59, align 8, !alias.scope !7
  %64 = load double, double* %60, align 8, !alias.scope !7
  %65 = load double, double* %61, align 8, !alias.scope !7
  %66 = load double, double* %62, align 8, !alias.scope !7
  %67 = insertelement <2 x double> undef, double %63, i32 0
  %68 = insertelement <2 x double> %67, double %64, i32 1
  %69 = insertelement <2 x double> undef, double %65, i32 0
  %70 = insertelement <2 x double> %69, double %66, i32 1
  %71 = fmul <2 x double> %56, %68
  %72 = fmul <2 x double> %58, %70
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv94, i64 %index
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !9, !noalias !11
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load148 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !9, !noalias !11
  %77 = fadd <2 x double> %71, %wide.load
  %78 = fadd <2 x double> %72, %wide.load148
  %79 = bitcast double* %73 to <2 x double>*
  store <2 x double> %77, <2 x double>* %79, align 8, !alias.scope !9, !noalias !11
  %80 = bitcast double* %75 to <2 x double>*
  store <2 x double> %78, <2 x double>* %80, align 8, !alias.scope !9, !noalias !11
  %index.next = add i64 %index, 4
  %81 = icmp eq i64 %index.next, %n.vec
  br i1 %81, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond52.for.inc72_crit_edge.us.us, label %for.inc69.us.us.preheader

for.cond52.for.inc72_crit_edge.us.us.loopexit.unr-lcssa: ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us.loopexit

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us.prol.loopexit, %for.cond52.for.inc72_crit_edge.us.us.loopexit.unr-lcssa
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit, %middle.block
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond97 = icmp eq i64 %indvars.iv.next95, %wide.trip.count96
  br i1 %exitcond97, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader.new
  %indvars.iv90 = phi i64 [ %indvars.iv90.unr.ph, %for.inc69.us.us.preheader.new ], [ %indvars.iv.next91.1, %for.inc69.us.us ]
  %82 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv90, i64 %indvars.iv98
  %83 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %82, %83
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv94, i64 %indvars.iv90
  %84 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %84
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %85 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv.next91, i64 %indvars.iv98
  %86 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %85, %86
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv94, i64 %indvars.iv.next91
  %87 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %87
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next91, %42
  %indvars.iv.next91.1 = add nsw i64 %indvars.iv90, 2
  br i1 %exitcond.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit.unr-lcssa, label %for.inc69.us.us, !llvm.loop !15

for.cond78.preheader:                             ; preds = %for.cond48.for.inc75_crit_edge.us
  %88 = icmp sgt i32 %n, 0
  br i1 %88, label %for.cond82.preheader.us.preheader, label %for.cond78.preheader.for.end99_crit_edge

for.cond78.preheader.for.end99_crit_edge:         ; preds = %for.end25.thread, %for.end25, %for.cond44.preheader, %for.cond78.preheader
  %sunkaddr134 = bitcast [2000 x [2000 x double]]** %B to i8**
  %.pre83 = load i8*, i8** %sunkaddr134, align 8
  br label %for.end99

for.cond82.preheader.us.preheader:                ; preds = %for.cond78.preheader
  %89 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %90 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %91 = zext i32 %n to i64
  %92 = add nsw i64 %91, -1
  %wide.trip.count88 = zext i32 %n to i64
  %93 = add nsw i64 %2, -1
  %min.iters.check152 = icmp ult i32 %n, 4
  %94 = and i32 %n, 3
  %n.mod.vf154 = zext i32 %94 to i64
  %n.vec155 = sub nsw i64 %2, %n.mod.vf154
  %cmp.zero156 = icmp eq i64 %n.vec155, 0
  %cmp.n175 = icmp eq i32 %94, 0
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.inc97_crit_edge.us, %for.cond82.preheader.us.preheader
  %indvars.iv86 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %indvars.iv.next87, %for.cond82.for.inc97_crit_edge.us ]
  %scevgep158 = getelementptr [2000 x double], [2000 x double]* %90, i64 %indvars.iv86, i64 0
  %scevgep160 = getelementptr [2000 x double], [2000 x double]* %90, i64 %indvars.iv86, i64 %2
  %scevgep162 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv86, i64 0
  %scevgep164 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv86, i64 %2
  br i1 %min.iters.check152, label %for.inc94.us.preheader, label %min.iters.checked153

min.iters.checked153:                             ; preds = %for.cond82.preheader.us
  br i1 %cmp.zero156, label %for.inc94.us.preheader, label %vector.memcheck170

vector.memcheck170:                               ; preds = %min.iters.checked153
  %bound0166 = icmp ult double* %scevgep158, %scevgep164
  %bound1167 = icmp ult double* %scevgep162, %scevgep160
  %memcheck.conflict169 = and i1 %bound0166, %bound1167
  br i1 %memcheck.conflict169, label %for.inc94.us.preheader, label %vector.body149.preheader

vector.body149.preheader:                         ; preds = %vector.memcheck170
  br label %vector.body149

vector.body149:                                   ; preds = %vector.body149.preheader, %vector.body149
  %index172 = phi i64 [ %index.next173, %vector.body149 ], [ 0, %vector.body149.preheader ]
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv86, i64 %index172
  %96 = bitcast double* %95 to <2 x i64>*
  %wide.load180 = load <2 x i64>, <2 x i64>* %96, align 8, !alias.scope !16
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x i64>*
  %wide.load181 = load <2 x i64>, <2 x i64>* %98, align 8, !alias.scope !16
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %90, i64 %indvars.iv86, i64 %index172
  %100 = bitcast double* %99 to <2 x i64>*
  store <2 x i64> %wide.load180, <2 x i64>* %100, align 8, !alias.scope !19, !noalias !16
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x i64>*
  store <2 x i64> %wide.load181, <2 x i64>* %102, align 8, !alias.scope !19, !noalias !16
  %index.next173 = add i64 %index172, 4
  %103 = icmp eq i64 %index.next173, %n.vec155
  br i1 %103, label %middle.block150, label %vector.body149, !llvm.loop !21

middle.block150:                                  ; preds = %vector.body149
  br i1 %cmp.n175, label %for.cond82.for.inc97_crit_edge.us, label %for.inc94.us.preheader

for.inc94.us.preheader:                           ; preds = %middle.block150, %vector.memcheck170, %min.iters.checked153, %for.cond82.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck170 ], [ 0, %min.iters.checked153 ], [ 0, %for.cond82.preheader.us ], [ %n.vec155, %middle.block150 ]
  %104 = sub nsw i64 %2, %indvars.iv.ph
  %105 = sub nsw i64 %93, %indvars.iv.ph
  %xtraiter = and i64 %104, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc94.us.prol.loopexit, label %for.inc94.us.prol.preheader

for.inc94.us.prol.preheader:                      ; preds = %for.inc94.us.preheader
  br label %for.inc94.us.prol

for.inc94.us.prol:                                ; preds = %for.inc94.us.prol, %for.inc94.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc94.us.prol ], [ %indvars.iv.ph, %for.inc94.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc94.us.prol ], [ %xtraiter, %for.inc94.us.prol.preheader ]
  %arrayidx89.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv86, i64 %indvars.iv.prol
  %106 = bitcast double* %arrayidx89.us.prol to i64*
  %107 = load i64, i64* %106, align 8
  %arrayidx93.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %90, i64 %indvars.iv86, i64 %indvars.iv.prol
  %108 = bitcast double* %arrayidx93.us.prol to i64*
  store i64 %107, i64* %108, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc94.us.prol.loopexit.unr-lcssa, label %for.inc94.us.prol, !llvm.loop !22

for.inc94.us.prol.loopexit.unr-lcssa:             ; preds = %for.inc94.us.prol
  br label %for.inc94.us.prol.loopexit

for.inc94.us.prol.loopexit:                       ; preds = %for.inc94.us.preheader, %for.inc94.us.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.inc94.us.preheader ], [ %indvars.iv.next.prol, %for.inc94.us.prol.loopexit.unr-lcssa ]
  %109 = icmp ult i64 %105, 3
  br i1 %109, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us.preheader.new

for.inc94.us.preheader.new:                       ; preds = %for.inc94.us.prol.loopexit
  br label %for.inc94.us

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc94.us.preheader.new ], [ %indvars.iv.next.3, %for.inc94.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv86, i64 %indvars.iv
  %110 = bitcast double* %arrayidx89.us to i64*
  %111 = load i64, i64* %110, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %90, i64 %indvars.iv86, i64 %indvars.iv
  %112 = bitcast double* %arrayidx93.us to i64*
  store i64 %111, i64* %112, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv86, i64 %indvars.iv.next
  %113 = bitcast double* %arrayidx89.us.1 to i64*
  %114 = load i64, i64* %113, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %90, i64 %indvars.iv86, i64 %indvars.iv.next
  %115 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %114, i64* %115, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv86, i64 %indvars.iv.next.1
  %116 = bitcast double* %arrayidx89.us.2 to i64*
  %117 = load i64, i64* %116, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %90, i64 %indvars.iv86, i64 %indvars.iv.next.1
  %118 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %117, i64* %118, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv86, i64 %indvars.iv.next.2
  %119 = bitcast double* %arrayidx89.us.3 to i64*
  %120 = load i64, i64* %119, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %90, i64 %indvars.iv86, i64 %indvars.iv.next.2
  %121 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %120, i64* %121, align 8
  %exitcond129.3 = icmp eq i64 %indvars.iv.next.2, %92
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond129.3, label %for.cond82.for.inc97_crit_edge.us.loopexit.unr-lcssa, label %for.inc94.us, !llvm.loop !23

for.cond82.for.inc97_crit_edge.us.loopexit.unr-lcssa: ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us.loopexit

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us.prol.loopexit, %for.cond82.for.inc97_crit_edge.us.loopexit.unr-lcssa
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit, %middle.block150
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond89 = icmp eq i64 %indvars.iv.next87, %wide.trip.count88
  br i1 %exitcond89, label %for.end99.loopexit, label %for.cond82.preheader.us

for.end99.loopexit:                               ; preds = %for.cond82.for.inc97_crit_edge.us
  %122 = bitcast [2000 x [2000 x double]]* %89 to i8*
  br label %for.end99

for.end99:                                        ; preds = %for.end99.loopexit, %for.cond78.preheader.for.end99_crit_edge
  %123 = phi i8* [ %.pre83, %for.cond78.preheader.for.end99_crit_edge ], [ %122, %for.end99.loopexit ]
  tail call void @free(i8* %123) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* %A) unnamed_addr #2 {
entry:
  %cmp23 = icmp sgt i32 %n, 0
  br i1 %cmp23, label %for.cond1.preheader.preheader, label %for.end56

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count50 = zext i32 %n to i64
  %wide.trip.count54 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.inc54
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.inc54 ], [ 0, %for.cond1.preheader.preheader ]
  %cmp211 = icmp sgt i64 %indvars.iv52, 0
  br i1 %cmp211, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.lr.ph:                       ; preds = %for.inc25
  %0 = icmp sgt i64 %indvars.iv52, 0
  br i1 %0, label %for.cond31.preheader.us.preheader, label %for.inc54

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter56 = and i64 %indvars.iv52, 1
  %lcmp.mod57 = icmp eq i64 %xtraiter56, 0
  %1 = icmp eq i64 %indvars.iv52, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv52, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv48
  %.pre30 = load double, double* %arrayidx46.us.phi.trans.insert, align 8
  br i1 %lcmp.mod57, label %for.inc48.us.prol.loopexit.unr-lcssa, label %for.inc48.us.prol.preheader

for.inc48.us.prol.preheader:                      ; preds = %for.cond31.preheader.us
  br label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.inc48.us.prol.preheader
  %2 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv48
  %3 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %2, %3
  %sub47.us.prol = fsub double %.pre30, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us.phi.trans.insert, align 8
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.cond31.preheader.us, %for.inc48.us.prol
  %indvars.iv41.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr58.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre30, %for.cond31.preheader.us ]
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br i1 %1, label %for.cond31.for.inc51_crit_edge.us, label %for.cond31.preheader.us.new

for.cond31.preheader.us.new:                      ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.cond31.preheader.us.new
  %indvars.iv41 = phi i64 [ %indvars.iv41.unr.ph, %for.cond31.preheader.us.new ], [ %indvars.iv.next42.1, %for.inc48.us ]
  %4 = phi double [ %.unr58.ph, %for.cond31.preheader.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv41
  %5 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv41, i64 %indvars.iv48
  %6 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %5, %6
  %sub47.us = fsub double %4, %mul42.us
  store double %sub47.us, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv.next42
  %7 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next42, i64 %indvars.iv48
  %8 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %7, %8
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %exitcond45.1 = icmp eq i64 %indvars.iv.next42.1, %indvars.iv52
  br i1 %exitcond45.1, label %for.cond31.for.inc51_crit_edge.us.unr-lcssa, label %for.inc48.us

for.cond31.for.inc51_crit_edge.us.unr-lcssa:      ; preds = %for.inc48.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.inc48.us.prol.loopexit, %for.cond31.for.inc51_crit_edge.us.unr-lcssa
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond51, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %cmp57 = icmp sgt i64 %indvars.iv34, 0
  %arrayidx16.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv34
  %.pre = load double, double* %arrayidx16.phi.trans.insert, align 8
  br i1 %cmp57, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv34, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader
  %9 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv34
  %10 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %9, %10
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16.phi.trans.insert, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.preheader, %for.inc.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.preheader ]
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  %11 = icmp eq i64 %indvars.iv34, 1
  br i1 %11, label %for.inc25.loopexit, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next.1, %for.inc ]
  %12 = phi double [ %.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv
  %13 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv34
  %14 = load double, double* %arrayidx12, align 8
  %mul = fmul double %13, %14
  %sub = fsub double %12, %mul
  store double %sub, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv34
  %16 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %15, %16
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv34
  br i1 %exitcond.1, label %for.inc25.loopexit.unr-lcssa, label %for.inc

for.inc25.loopexit.unr-lcssa:                     ; preds = %for.inc
  br label %for.inc25.loopexit

for.inc25.loopexit:                               ; preds = %for.inc.prol.loopexit, %for.inc25.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit.unr-lcssa ]
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.cond4.preheader
  %17 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv34
  %18 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv34
  %div = fdiv double %17, %18
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next35, %indvars.iv52
  br i1 %exitcond39, label %for.cond31.preheader.lr.ph, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond1.preheader, %for.cond31.preheader.lr.ph
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %for.end56.loopexit, label %for.cond1.preheader

for.end56.loopexit:                               ; preds = %for.inc54
  br label %for.end56

for.end56:                                        ; preds = %for.end56.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp6 = icmp sgt i32 %n, 0
  br i1 %cmp6, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count13 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv10 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv10, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %5 = add nsw i64 %4, %indvars.iv
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next11, %wide.trip.count13
  br i1 %exitcond14, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10}
!10 = distinct !{!10, !6}
!11 = !{!8, !5}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.vectorize.width", i32 1}
!14 = !{!"llvm.loop.interleave.count", i32 1}
!15 = distinct !{!15, !13, !14}
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !13, !14}
!22 = distinct !{!22, !2}
!23 = distinct !{!23, !13, !14}
