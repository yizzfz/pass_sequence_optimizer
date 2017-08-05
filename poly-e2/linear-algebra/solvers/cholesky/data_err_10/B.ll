; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %.cast = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %.cast)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %.cast)
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
  %1 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
for.cond1.preheader.lr.ph:
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc23
  %indvars.iv123 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next124, %for.inc23 ]
  %indvar118 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %indvar.next119, %for.inc23 ]
  %indvars.iv113 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next114, %for.inc23 ]
  %indvars.iv109 = phi i32 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next110, %for.inc23 ]
  %0 = sub i32 1999, %indvar118
  %1 = sub i32 1998, %indvar118
  %cmp261 = icmp slt i64 %indvars.iv123, 0
  br i1 %cmp261, label %for.end, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.cond1.preheader
  %wide.trip.count111 = zext i32 %indvars.iv109 to i64
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %for.inc ], [ 0, %for.inc.preheader ]
  %2 = sub nsw i64 0, %indvars.iv106
  %3 = trunc i64 %2 to i32
  %rem = srem i32 %3, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv123, i64 %indvars.iv106
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next107, %wide.trip.count111
  br i1 %exitcond112, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond1.preheader
  %indvars.iv.next124 = add nsw i64 %indvars.iv123, 1
  %cmp964 = icmp slt i64 %indvars.iv.next124, 2000
  br i1 %cmp964, label %for.inc16.lr.ph, label %for.inc23.thread

for.inc23.thread:                                 ; preds = %for.end
  %arrayidx22127 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv123, i64 %indvars.iv123
  store double 1.000000e+00, double* %arrayidx22127, align 8
  br label %for.cond30.preheader.us.preheader

for.inc16.lr.ph:                                  ; preds = %for.end
  %xtraiter120 = and i32 %0, 7
  %lcmp.mod121 = icmp eq i32 %xtraiter120, 0
  br i1 %lcmp.mod121, label %for.inc16.prol.loopexit, label %for.inc16.prol.preheader

for.inc16.prol.preheader:                         ; preds = %for.inc16.lr.ph
  br label %for.inc16.prol

for.inc16.prol:                                   ; preds = %for.inc16.prol.preheader, %for.inc16.prol
  %indvars.iv115.prol = phi i64 [ %indvars.iv.next116.prol, %for.inc16.prol ], [ %indvars.iv113, %for.inc16.prol.preheader ]
  %prol.iter122 = phi i32 [ %prol.iter122.sub, %for.inc16.prol ], [ %xtraiter120, %for.inc16.prol.preheader ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv123, i64 %indvars.iv115.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next116.prol = add nsw i64 %indvars.iv115.prol, 1
  %prol.iter122.sub = add i32 %prol.iter122, -1
  %prol.iter122.cmp = icmp eq i32 %prol.iter122.sub, 0
  br i1 %prol.iter122.cmp, label %for.inc16.prol.loopexit.loopexit, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.loopexit:                 ; preds = %for.inc16.prol
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.prol.loopexit.loopexit, %for.inc16.lr.ph
  %indvars.iv115.unr = phi i64 [ %indvars.iv113, %for.inc16.lr.ph ], [ %indvars.iv.next116.prol, %for.inc16.prol.loopexit.loopexit ]
  %4 = icmp ult i32 %1, 7
  br i1 %4, label %for.inc23, label %for.inc16.preheader

for.inc16.preheader:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc16:                                        ; preds = %for.inc16.preheader, %for.inc16
  %indvars.iv115 = phi i64 [ %indvars.iv.next116.7, %for.inc16 ], [ %indvars.iv115.unr, %for.inc16.preheader ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv123, i64 %indvars.iv115
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next116 = add nsw i64 %indvars.iv115, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv123, i64 %indvars.iv.next116
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next116.1 = add nsw i64 %indvars.iv115, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv123, i64 %indvars.iv.next116.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next116.2 = add nsw i64 %indvars.iv115, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv123, i64 %indvars.iv.next116.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next116.3 = add nsw i64 %indvars.iv115, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv123, i64 %indvars.iv.next116.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next116.4 = add nsw i64 %indvars.iv115, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv123, i64 %indvars.iv.next116.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next116.5 = add nsw i64 %indvars.iv115, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv123, i64 %indvars.iv.next116.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next116.6 = add nsw i64 %indvars.iv115, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv123, i64 %indvars.iv.next116.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %indvars.iv.next116.7 = add nsw i64 %indvars.iv115, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next116.7 to i32
  %exitcond117.7 = icmp eq i32 %lftr.wideiv.7, 2000
  br i1 %exitcond117.7, label %for.inc23.loopexit, label %for.inc16

for.inc23.loopexit:                               ; preds = %for.inc16
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %for.inc16.prol.loopexit
  %5 = icmp slt i64 %indvars.iv.next124, 2000
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv123, i64 %indvars.iv123
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next110 = add i32 %indvars.iv109, 1
  %indvars.iv.next114 = add nsw i64 %indvars.iv113, 1
  %indvar.next119 = add i32 %indvar118, 1
  br i1 %5, label %for.cond1.preheader, label %for.cond30.preheader.us.preheader.loopexit

for.cond30.preheader.us.preheader.loopexit:       ; preds = %for.inc23
  br label %for.cond30.preheader.us.preheader

for.cond30.preheader.us.preheader:                ; preds = %for.cond30.preheader.us.preheader.loopexit, %for.inc23.thread
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %6 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %6, align 8
  %7 = bitcast i8* %call to [2000 x [2000 x double]]*
  %8 = bitcast i8* %call to [2000 x [2000 x double]]*
  %9 = bitcast i8* %call to [2000 x [2000 x double]]*
  %10 = bitcast i8* %call to [2000 x [2000 x double]]*
  %11 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond30.preheader.us

for.cond30.preheader.us:                          ; preds = %for.cond30.preheader.us, %for.cond30.preheader.us.preheader
  %indvars.iv102 = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next103.4, %for.cond30.preheader.us ]
  %indvar = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvar.next.4, %for.cond30.preheader.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvar, i64 0
  %scevgep101 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep101, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next = add nuw nsw i64 %indvar, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvar.next, i64 0
  %scevgep101.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep101.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.1 = add nsw i64 %indvar, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %indvar.next.1, i64 0
  %scevgep101.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep101.2, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.2 = add nsw i64 %indvar, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %10, i64 0, i64 %indvar.next.2, i64 0
  %scevgep101.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep101.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.3 = add nsw i64 %indvar, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvar.next.3, i64 0
  %scevgep101.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep101.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next103.4 = add nsw i64 %indvars.iv102, 5
  %cmp27.us.4 = icmp slt i64 %indvars.iv.next103.4, 2000
  %indvar.next.4 = add nsw i64 %indvar, 5
  br i1 %cmp27.us.4, label %for.cond30.preheader.us, label %for.cond52.preheader.lr.ph.us.preheader

for.cond52.preheader.lr.ph.us.preheader:          ; preds = %for.cond30.preheader.us
  %12 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond52.preheader.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next93 = add nsw i64 %indvars.iv92, 1
  %cmp45.us = icmp slt i64 %indvars.iv.next93, 2000
  br i1 %cmp45.us, label %for.cond52.preheader.lr.ph.us, label %for.cond82.preheader.us.preheader

for.cond52.preheader.lr.ph.us:                    ; preds = %for.cond52.preheader.lr.ph.us.preheader, %for.inc75.us
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %for.inc75.us ], [ 0, %for.cond52.preheader.lr.ph.us.preheader ]
  br label %for.cond52.preheader.us.us.new

for.cond52.preheader.us.us.new:                   ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.lr.ph.us
  %indvars.iv89 = phi i64 [ 0, %for.cond52.preheader.lr.ph.us ], [ %indvars.iv.next90, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv92
  br label %for.inc69.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.inc69.us.us
  %indvars.iv.next90 = add nsw i64 %indvars.iv89, 1
  %exitcond = icmp eq i64 %indvars.iv.next90, 2000
  br i1 %exitcond, label %for.inc75.us, label %for.cond52.preheader.us.us.new

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.cond52.preheader.us.us.new
  %indvars.iv83 = phi i64 [ 0, %for.cond52.preheader.us.us.new ], [ %indvars.iv.next84.1, %for.inc69.us.us ]
  %13 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv83, i64 %indvars.iv92
  %14 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %13, %14
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvars.iv89, i64 %indvars.iv83
  %15 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %15
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next84 = or i64 %indvars.iv83, 1
  %16 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next84, i64 %indvars.iv92
  %17 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %16, %17
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next84
  %18 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %18
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next84.1 = add nsw i64 %indvars.iv83, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next84.1, 2000
  br i1 %exitcond.1, label %for.cond52.for.inc72_crit_edge.us.us, label %for.inc69.us.us

for.cond82.preheader.us.preheader:                ; preds = %for.inc75.us
  %19 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %20 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.cond82.preheader.us.new

for.cond82.preheader.us.new:                      ; preds = %for.cond82.preheader.us.preheader, %for.cond82.for.inc97_crit_edge.us
  %indvars.iv81 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %indvars.iv.next82, %for.cond82.for.inc97_crit_edge.us ]
  br label %for.inc94.us

for.inc94.us:                                     ; preds = %for.inc94.us, %for.cond82.preheader.us.new
  %indvars.iv = phi i64 [ 0, %for.cond82.preheader.us.new ], [ %indvars.iv.next.3, %for.inc94.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv81, i64 %indvars.iv
  %21 = bitcast double* %arrayidx89.us to i64*
  %22 = load i64, i64* %21, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %20, i64 %indvars.iv81, i64 %indvars.iv
  %23 = bitcast double* %arrayidx93.us to i64*
  store i64 %22, i64* %23, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv81, i64 %indvars.iv.next
  %24 = bitcast double* %arrayidx89.us.1 to i64*
  %25 = load i64, i64* %24, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %20, i64 %indvars.iv81, i64 %indvars.iv.next
  %26 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %25, i64* %26, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv81, i64 %indvars.iv.next.1
  %27 = bitcast double* %arrayidx89.us.2 to i64*
  %28 = load i64, i64* %27, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %20, i64 %indvars.iv81, i64 %indvars.iv.next.1
  %29 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv81, i64 %indvars.iv.next.2
  %30 = bitcast double* %arrayidx89.us.3 to i64*
  %31 = load i64, i64* %30, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %20, i64 %indvars.iv81, i64 %indvars.iv.next.2
  %32 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %31, i64* %32, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %for.cond82.for.inc97_crit_edge.us, label %for.inc94.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.inc94.us
  %indvars.iv.next82 = add nsw i64 %indvars.iv81, 1
  %cmp79.us = icmp slt i64 %indvars.iv.next82, 2000
  br i1 %cmp79.us, label %for.cond82.preheader.us.new, label %for.end99

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  %33 = bitcast [2000 x [2000 x double]]** %B to i8**
  %34 = load i8*, i8** %33, align 8
  tail call void @free(i8* %34) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  %cmp14 = icmp sgt i32 %n, 0
  br i1 %cmp14, label %for.cond1.preheader.lr.ph, label %for.end58

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = sext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc56
  %1 = phi [2000 x double]* [ %A, %for.cond1.preheader.lr.ph ], [ %34, %for.inc56 ]
  %indvars.iv37 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next38, %for.inc56 ]
  %indvar = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %indvar.next, %for.inc56 ]
  %indvars.iv31 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next32, %for.inc56 ]
  %2 = add i64 %indvars.iv37, -2
  %cmp25 = icmp sgt i64 %indvars.iv37, 0
  br i1 %cmp25, label %for.cond4.preheader.preheader, label %for.cond28.preheader.for.inc56_crit_edge

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %wide.trip.count28 = zext i32 %indvars.iv31 to i64
  br label %for.cond4.preheader

for.cond28.preheader:                             ; preds = %for.inc25
  %3 = icmp sgt i64 %indvars.iv37, 0
  %.pre40 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br i1 %3, label %for.inc45.lr.ph, label %for.cond28.preheader.for.inc56_crit_edge

for.cond28.preheader.for.inc56_crit_edge:         ; preds = %for.cond1.preheader, %for.cond28.preheader
  %4 = phi [2000 x double]* [ %.pre40, %for.cond28.preheader ], [ %1, %for.cond1.preheader ]
  %.pre43 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv37
  br label %for.inc56

for.inc45.lr.ph:                                  ; preds = %for.cond28.preheader
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre40, i64 %indvars.iv37, i64 %indvars.iv37
  %xtraiter34 = and i32 %indvar, 1
  %lcmp.mod35 = icmp eq i32 %xtraiter34, 0
  br i1 %lcmp.mod35, label %for.inc45.prol.loopexit.unr-lcssa, label %for.inc45.prol.preheader

for.inc45.prol.preheader:                         ; preds = %for.inc45.lr.ph
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre40, i64 %indvars.iv37, i64 0
  %5 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %5, %5
  %6 = load double, double* %arrayidx43, align 8
  %sub44.prol = fsub double %6, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  br label %for.inc45.prol.loopexit.unr-lcssa

for.inc45.prol.loopexit.unr-lcssa:                ; preds = %for.inc45.lr.ph, %for.inc45.prol.preheader
  %indvars.iv29.unr.ph = phi i64 [ 1, %for.inc45.prol.preheader ], [ 0, %for.inc45.lr.ph ]
  %7 = icmp eq i32 %indvar, 1
  br i1 %7, label %for.inc56.loopexit, label %for.inc45.lr.ph.new

for.inc45.lr.ph.new:                              ; preds = %for.inc45.prol.loopexit.unr-lcssa
  %.pre41 = load double, double* %arrayidx43, align 8
  %wide.trip.count = zext i32 %indvars.iv31 to i64
  %8 = sub i64 %2, %indvars.iv29.unr.ph
  %9 = lshr i64 %8, 1
  %10 = and i64 %9, 1
  %lcmp.mod46 = icmp eq i64 %10, 0
  br i1 %lcmp.mod46, label %for.inc45.prol.preheader45, label %for.inc45.prol.loopexit.unr-lcssa50

for.inc45.prol.preheader45:                       ; preds = %for.inc45.lr.ph.new
  br label %for.inc45.prol

for.inc45.prol:                                   ; preds = %for.inc45.prol.preheader45
  %arrayidx34.prol47 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre40, i64 %indvars.iv37, i64 %indvars.iv29.unr.ph
  %11 = load double, double* %arrayidx34.prol47, align 8
  %mul39.prol48 = fmul double %11, %11
  %sub44.prol49 = fsub double %.pre41, %mul39.prol48
  store double %sub44.prol49, double* %arrayidx43, align 8
  %indvars.iv.next30.prol = add nuw nsw i64 %indvars.iv29.unr.ph, 1
  %arrayidx34.1.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre40, i64 %indvars.iv37, i64 %indvars.iv.next30.prol
  %12 = load double, double* %arrayidx34.1.prol, align 8
  %mul39.1.prol = fmul double %12, %12
  %sub44.1.prol = fsub double %sub44.prol49, %mul39.1.prol
  store double %sub44.1.prol, double* %arrayidx43, align 8
  %indvars.iv.next30.1.prol = or i64 %indvars.iv29.unr.ph, 2
  br label %for.inc45.prol.loopexit.unr-lcssa50

for.inc45.prol.loopexit.unr-lcssa50:              ; preds = %for.inc45.lr.ph.new, %for.inc45.prol
  %.unr.ph = phi double [ %sub44.1.prol, %for.inc45.prol ], [ %.pre41, %for.inc45.lr.ph.new ]
  %indvars.iv29.unr.ph51 = phi i64 [ %indvars.iv.next30.1.prol, %for.inc45.prol ], [ %indvars.iv29.unr.ph, %for.inc45.lr.ph.new ]
  br label %for.inc45.prol.loopexit

for.inc45.prol.loopexit:                          ; preds = %for.inc45.prol.loopexit.unr-lcssa50
  %13 = icmp eq i64 %9, 0
  br i1 %13, label %for.inc56.loopexit.loopexit, label %for.inc45.lr.ph.new.new

for.inc45.lr.ph.new.new:                          ; preds = %for.inc45.prol.loopexit
  br label %for.inc45

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %14 = phi [2000 x double]* [ %26, %for.inc25 ], [ %1, %for.cond4.preheader.preheader ]
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %15 = add i64 %indvars.iv24, 4294967295
  %cmp53 = icmp sgt i64 %indvars.iv24, 0
  br i1 %cmp53, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv37, i64 %indvars.iv24
  %xtraiter44 = and i64 %indvars.iv24, 1
  %lcmp.mod = icmp eq i64 %xtraiter44, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv37, i64 0
  %16 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv24, i64 0
  %17 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %16, %17
  %18 = load double, double* %arrayidx16, align 8
  %sub.prol = fsub double %18, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol.preheader ], [ 0, %for.inc.lr.ph ]
  %19 = trunc i64 %15 to i32
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %for.inc25.loopexit, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit.unr-lcssa
  %.pre = load double, double* %arrayidx16, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %21 = phi double [ %.pre, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv37, i64 %indvars.iv
  %22 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv24, i64 %indvars.iv
  %23 = load double, double* %arrayidx12, align 8
  %mul = fmul double %22, %23
  %sub = fsub double %21, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv37, i64 %indvars.iv.next
  %24 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv24, i64 %indvars.iv.next
  %25 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %24, %25
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv24
  br i1 %exitcond.1, label %for.inc25.loopexit.loopexit, label %for.inc

for.inc25.loopexit.loopexit:                      ; preds = %for.inc
  br label %for.inc25.loopexit

for.inc25.loopexit:                               ; preds = %for.inc25.loopexit.loopexit, %for.inc.prol.loopexit.unr-lcssa
  %.pre39 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.cond4.preheader
  %26 = phi [2000 x double]* [ %.pre39, %for.inc25.loopexit ], [ %14, %for.cond4.preheader ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv24, i64 %indvars.iv24
  %27 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %26, i64 %indvars.iv37, i64 %indvars.iv24
  %28 = load double, double* %arrayidx24, align 8
  %div = fdiv double %28, %27
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond = icmp eq i64 %indvars.iv.next25, %wide.trip.count28
  br i1 %exitcond, label %for.cond28.preheader, label %for.cond4.preheader

for.inc45:                                        ; preds = %for.inc45, %for.inc45.lr.ph.new.new
  %29 = phi double [ %.unr.ph, %for.inc45.lr.ph.new.new ], [ %sub44.1.1, %for.inc45 ]
  %indvars.iv29 = phi i64 [ %indvars.iv29.unr.ph51, %for.inc45.lr.ph.new.new ], [ %indvars.iv.next30.1.1, %for.inc45 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre40, i64 %indvars.iv37, i64 %indvars.iv29
  %30 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %30, %30
  %sub44 = fsub double %29, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre40, i64 %indvars.iv37, i64 %indvars.iv.next30
  %31 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %31, %31
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %arrayidx34.152 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre40, i64 %indvars.iv37, i64 %indvars.iv.next30.1
  %32 = load double, double* %arrayidx34.152, align 8
  %mul39.153 = fmul double %32, %32
  %sub44.154 = fsub double %sub44.1, %mul39.153
  store double %sub44.154, double* %arrayidx43, align 8
  %indvars.iv.next30.155 = add nsw i64 %indvars.iv29, 3
  %arrayidx34.1.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre40, i64 %indvars.iv37, i64 %indvars.iv.next30.155
  %33 = load double, double* %arrayidx34.1.1, align 8
  %mul39.1.1 = fmul double %33, %33
  %sub44.1.1 = fsub double %sub44.154, %mul39.1.1
  store double %sub44.1.1, double* %arrayidx43, align 8
  %indvars.iv.next30.1.1 = add nsw i64 %indvars.iv29, 4
  %exitcond33.1.1 = icmp eq i64 %indvars.iv.next30.1.1, %wide.trip.count
  br i1 %exitcond33.1.1, label %for.inc56.loopexit.loopexit.unr-lcssa, label %for.inc45

for.inc56.loopexit.loopexit.unr-lcssa:            ; preds = %for.inc45
  br label %for.inc56.loopexit.loopexit

for.inc56.loopexit.loopexit:                      ; preds = %for.inc45.prol.loopexit, %for.inc56.loopexit.loopexit.unr-lcssa
  br label %for.inc56.loopexit

for.inc56.loopexit:                               ; preds = %for.inc56.loopexit.loopexit, %for.inc45.prol.loopexit.unr-lcssa
  %.pre42 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc56

for.inc56:                                        ; preds = %for.cond28.preheader.for.inc56_crit_edge, %for.inc56.loopexit
  %arrayidx51.pre-phi = phi double* [ %.pre43, %for.cond28.preheader.for.inc56_crit_edge ], [ %arrayidx43, %for.inc56.loopexit ]
  %34 = phi [2000 x double]* [ %4, %for.cond28.preheader.for.inc56_crit_edge ], [ %.pre42, %for.inc56.loopexit ]
  %35 = load double, double* %arrayidx51.pre-phi, align 8
  %call = tail call double @sqrt(double %35) #3
  %arrayidx55 = getelementptr inbounds [2000 x double], [2000 x double]* %34, i64 %indvars.iv37, i64 %indvars.iv37
  store double %call, double* %arrayidx55, align 8
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, 1
  %indvars.iv.next32 = add i32 %indvars.iv31, 1
  %cmp = icmp slt i64 %indvars.iv.next38, %0
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp, label %for.cond1.preheader, label %for.end58.loopexit

for.end58.loopexit:                               ; preds = %for.inc56
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
  br i1 %cmp4, label %for.cond2.preheader.lr.ph, label %for.end12

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.cond2.preheader.lr.ph, %for.inc10
  %indvars.iv10 = phi i64 [ 0, %for.cond2.preheader.lr.ph ], [ %indvars.iv.next11, %for.inc10 ]
  %indvars.iv8 = phi i32 [ 1, %for.cond2.preheader.lr.ph ], [ %indvars.iv.next9, %for.inc10 ]
  %cmp32 = icmp slt i64 %indvars.iv10, 0
  br i1 %cmp32, label %for.inc10, label %for.body4.preheader

for.body4.preheader:                              ; preds = %for.cond2.preheader
  %4 = mul nsw i64 %3, %indvars.iv10
  %wide.trip.count = zext i32 %indvars.iv8 to i64
  br label %for.body4

for.body4:                                        ; preds = %for.body4.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body4.preheader ]
  %5 = add nsw i64 %4, %indvars.iv
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  %9 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc10.loopexit, label %for.body4

for.inc10.loopexit:                               ; preds = %for.inc
  br label %for.inc10

for.inc10:                                        ; preds = %for.inc10.loopexit, %for.cond2.preheader
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %cmp = icmp slt i64 %indvars.iv.next11, %3
  %indvars.iv.next9 = add i32 %indvars.iv8, 1
  br i1 %cmp, label %for.cond2.preheader, label %for.end12.loopexit

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
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

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
