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
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  call void (...) @polybench_timer_start() #3
  call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %arraydecay)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [2000 x double]*
  call fastcc void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
for.cond1.preheader.lr.ph:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end18, %for.cond1.preheader.lr.ph
  %indvars.iv131 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next132, %for.end18 ]
  %indvar126 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %indvar.next127, %for.end18 ]
  %indvars.iv121 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next122, %for.end18 ]
  %indvars.iv117 = phi i32 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next118, %for.end18 ]
  %0 = sub i32 1999, %indvar126
  %1 = sub i32 1998, %indvar126
  %cmp266 = icmp slt i64 %indvars.iv131, 0
  br i1 %cmp266, label %for.cond8.preheader, label %for.cond1.preheader.for.body3_crit_edge

for.cond1.preheader.for.body3_crit_edge:          ; preds = %for.cond1.preheader
  %wide.trip.count119 = zext i32 %indvars.iv117 to i64
  br label %for.body3

for.cond8.preheader.loopexit:                     ; preds = %for.body3
  br label %for.cond8.preheader

for.cond8.preheader:                              ; preds = %for.cond8.preheader.loopexit, %for.cond1.preheader
  %indvars.iv.next132 = add nsw i64 %indvars.iv131, 1
  %cmp970 = icmp slt i64 %indvars.iv.next132, 2000
  br i1 %cmp970, label %for.body11.lr.ph, label %for.cond30.preheader.us.preheader

for.body11.lr.ph:                                 ; preds = %for.cond8.preheader
  %xtraiter128 = and i32 %0, 7
  %lcmp.mod129 = icmp eq i32 %xtraiter128, 0
  br i1 %lcmp.mod129, label %for.body11.prol.loopexit, label %for.body11.prol.preheader

for.body11.prol.preheader:                        ; preds = %for.body11.lr.ph
  br label %for.body11.prol

for.body11.prol:                                  ; preds = %for.body11.prol.preheader, %for.body11.prol
  %indvars.iv123.prol = phi i64 [ %indvars.iv.next124.prol, %for.body11.prol ], [ %indvars.iv121, %for.body11.prol.preheader ]
  %prol.iter130 = phi i32 [ %prol.iter130.sub, %for.body11.prol ], [ %xtraiter128, %for.body11.prol.preheader ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv131, i64 %indvars.iv123.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next124.prol = add nsw i64 %indvars.iv123.prol, 1
  %prol.iter130.sub = add i32 %prol.iter130, -1
  %prol.iter130.cmp = icmp eq i32 %prol.iter130.sub, 0
  br i1 %prol.iter130.cmp, label %for.body11.prol.loopexit.loopexit, label %for.body11.prol, !llvm.loop !1

for.body11.prol.loopexit.loopexit:                ; preds = %for.body11.prol
  br label %for.body11.prol.loopexit

for.body11.prol.loopexit:                         ; preds = %for.body11.prol.loopexit.loopexit, %for.body11.lr.ph
  %indvars.iv123.unr = phi i64 [ %indvars.iv121, %for.body11.lr.ph ], [ %indvars.iv.next124.prol, %for.body11.prol.loopexit.loopexit ]
  %2 = icmp ult i32 %1, 7
  br i1 %2, label %for.end18, label %for.body11.preheader

for.body11.preheader:                             ; preds = %for.body11.prol.loopexit
  br label %for.body11

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader.for.body3_crit_edge
  %indvars.iv114 = phi i64 [ 0, %for.cond1.preheader.for.body3_crit_edge ], [ %indvars.iv.next115, %for.body3 ]
  %3 = sub nsw i64 0, %indvars.iv114
  %4 = trunc i64 %3 to i32
  %rem = srem i32 %4, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv131, i64 %indvars.iv114
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond120 = icmp eq i64 %indvars.iv.next115, %wide.trip.count119
  br i1 %exitcond120, label %for.cond8.preheader.loopexit, label %for.body3

for.body11:                                       ; preds = %for.body11.preheader, %for.body11
  %indvars.iv123 = phi i64 [ %indvars.iv.next124.7, %for.body11 ], [ %indvars.iv123.unr, %for.body11.preheader ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv131, i64 %indvars.iv123
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next124 = add nsw i64 %indvars.iv123, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv131, i64 %indvars.iv.next124
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv131, i64 %indvars.iv.next124.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next124.2 = add nsw i64 %indvars.iv123, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv131, i64 %indvars.iv.next124.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next124.3 = add nsw i64 %indvars.iv123, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv131, i64 %indvars.iv.next124.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next124.4 = add nsw i64 %indvars.iv123, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv131, i64 %indvars.iv.next124.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next124.5 = add nsw i64 %indvars.iv123, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv131, i64 %indvars.iv.next124.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next124.6 = add nsw i64 %indvars.iv123, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv131, i64 %indvars.iv.next124.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %indvars.iv.next124.7 = add nsw i64 %indvars.iv123, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next124.7 to i32
  %exitcond125.7 = icmp eq i32 %lftr.wideiv.7, 2000
  br i1 %exitcond125.7, label %for.end18.loopexit, label %for.body11

for.end18.loopexit:                               ; preds = %for.body11
  br label %for.end18

for.end18:                                        ; preds = %for.end18.loopexit, %for.body11.prol.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv131, i64 %indvars.iv131
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next118 = add i32 %indvars.iv117, 1
  %indvars.iv.next122 = add nsw i64 %indvars.iv121, 1
  %indvar.next127 = add i32 %indvar126, 1
  br label %for.cond1.preheader

for.cond30.preheader.us.preheader:                ; preds = %for.cond8.preheader
  %arrayidx22135 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv131, i64 %indvars.iv131
  store double 1.000000e+00, double* %arrayidx22135, align 8
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %5 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond30.preheader.us

for.cond30.preheader.us:                          ; preds = %for.cond30.preheader.us, %for.cond30.preheader.us.preheader
  %indvars.iv110 = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next111.4, %for.cond30.preheader.us ]
  %indvar = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvar.next.4, %for.cond30.preheader.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %5, i64 0, i64 %indvar, i64 0
  %scevgep109 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep109, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next = add nuw nsw i64 %indvar, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %5, i64 0, i64 %indvar.next, i64 0
  %scevgep109.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep109.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.1 = add nsw i64 %indvar, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %5, i64 0, i64 %indvar.next.1, i64 0
  %scevgep109.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep109.2, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.2 = add nsw i64 %indvar, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %5, i64 0, i64 %indvar.next.2, i64 0
  %scevgep109.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep109.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.3 = add nsw i64 %indvar, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %5, i64 0, i64 %indvar.next.3, i64 0
  %scevgep109.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep109.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next111.4 = add nsw i64 %indvars.iv110, 5
  %cmp27.us.4 = icmp slt i64 %indvars.iv.next111.4, 2000
  %indvar.next.4 = add nsw i64 %indvar, 5
  br i1 %cmp27.us.4, label %for.cond30.preheader.us, label %for.cond52.preheader.lr.ph.us.preheader

for.cond52.preheader.lr.ph.us.preheader:          ; preds = %for.cond30.preheader.us
  %6 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond52.preheader.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next101 = add nsw i64 %indvars.iv100, 1
  %cmp45.us = icmp slt i64 %indvars.iv.next101, 2000
  br i1 %cmp45.us, label %for.cond52.preheader.lr.ph.us, label %for.cond82.preheader.us.preheader

for.cond52.preheader.lr.ph.us:                    ; preds = %for.cond52.preheader.lr.ph.us.preheader, %for.inc75.us
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %for.inc75.us ], [ 0, %for.cond52.preheader.lr.ph.us.preheader ]
  br label %for.cond52.preheader.us.us.new

for.cond52.preheader.us.us.new:                   ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.lr.ph.us
  %indvars.iv97 = phi i64 [ 0, %for.cond52.preheader.lr.ph.us ], [ %indvars.iv.next98, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv97, i64 %indvars.iv100
  br label %for.body55.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.body55.us.us
  %indvars.iv.next98 = add nsw i64 %indvars.iv97, 1
  %exitcond = icmp eq i64 %indvars.iv.next98, 2000
  br i1 %exitcond, label %for.inc75.us, label %for.cond52.preheader.us.us.new

for.body55.us.us:                                 ; preds = %for.body55.us.us, %for.cond52.preheader.us.us.new
  %indvars.iv91 = phi i64 [ 0, %for.cond52.preheader.us.us.new ], [ %indvars.iv.next92.1, %for.body55.us.us ]
  %7 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv100
  %8 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %7, %8
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %6, i64 0, i64 %indvars.iv97, i64 %indvars.iv91
  %9 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %9
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next92 = or i64 %indvars.iv91, 1
  %10 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next92, i64 %indvars.iv100
  %11 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %10, %11
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %6, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next92
  %12 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %12
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next92.1 = add nsw i64 %indvars.iv91, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next92.1, 2000
  br i1 %exitcond.1, label %for.cond52.for.inc72_crit_edge.us.us, label %for.body55.us.us

for.cond82.preheader.us.preheader:                ; preds = %for.inc75.us
  %13 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond82.preheader.us.new

for.cond82.preheader.us.new:                      ; preds = %for.cond82.for.inc97_crit_edge.us, %for.cond82.preheader.us.preheader
  %indvars.iv89 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %indvars.iv.next90, %for.cond82.for.inc97_crit_edge.us ]
  br label %for.body85.us

for.body85.us:                                    ; preds = %for.body85.us, %for.cond82.preheader.us.new
  %indvars.iv = phi i64 [ 0, %for.cond82.preheader.us.new ], [ %indvars.iv.next.3, %for.body85.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv89, i64 %indvars.iv
  %14 = bitcast double* %arrayidx89.us to i64*
  %15 = load i64, i64* %14, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv
  %16 = bitcast double* %arrayidx93.us to i64*
  store i64 %15, i64* %16, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next
  %17 = bitcast double* %arrayidx89.us.1 to i64*
  %18 = load i64, i64* %17, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv.next
  %19 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %18, i64* %19, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next.1
  %20 = bitcast double* %arrayidx89.us.2 to i64*
  %21 = load i64, i64* %20, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv.next.1
  %22 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %21, i64* %22, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next.2
  %23 = bitcast double* %arrayidx89.us.3 to i64*
  %24 = load i64, i64* %23, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv.next.2
  %25 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %24, i64* %25, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %for.cond82.for.inc97_crit_edge.us, label %for.body85.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.body85.us
  %indvars.iv.next90 = add nsw i64 %indvars.iv89, 1
  %cmp79.us = icmp slt i64 %indvars.iv.next90, 2000
  br i1 %cmp79.us, label %for.cond82.preheader.us.new, label %for.end99

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  call void @free(i8* %call) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end47, %entry
  %0 = phi [2000 x double]* [ %A, %entry ], [ %31, %for.end47 ]
  %indvars.iv43 = phi i64 [ 0, %entry ], [ %indvars.iv.next44, %for.end47 ]
  %indvar = phi i32 [ 0, %entry ], [ %indvar.next, %for.end47 ]
  %indvars.iv37 = phi i32 [ 0, %entry ], [ %indvars.iv.next38, %for.end47 ]
  %1 = add i64 %indvars.iv43, -2
  %cmp211 = icmp sgt i64 %indvars.iv43, 0
  br i1 %cmp211, label %for.cond1.preheader.for.cond4.preheader_crit_edge, label %for.end47

for.cond1.preheader.for.cond4.preheader_crit_edge: ; preds = %for.cond1.preheader
  %wide.trip.count34 = zext i32 %indvars.iv37 to i64
  br label %for.cond4.preheader

for.body30.lr.ph:                                 ; preds = %for.end
  %xtraiter40 = and i32 %indvar, 1
  %lcmp.mod41 = icmp eq i32 %xtraiter40, 0
  br i1 %lcmp.mod41, label %for.body30.prol.loopexit.unr-lcssa, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.lr.ph
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre46, i64 %indvars.iv43, i64 0
  %2 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %2, %2
  %arrayidx43.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre46, i64 %indvars.iv43, i64 %indvars.iv43
  %3 = load double, double* %arrayidx43.prol, align 8
  %sub44.prol = fsub double %3, %mul39.prol
  store double %sub44.prol, double* %arrayidx43.prol, align 8
  br label %for.body30.prol.loopexit.unr-lcssa

for.body30.prol.loopexit.unr-lcssa:               ; preds = %for.body30.lr.ph, %for.body30.prol.preheader
  %indvars.iv35.unr.ph = phi i64 [ 1, %for.body30.prol.preheader ], [ 0, %for.body30.lr.ph ]
  %4 = icmp eq i32 %indvar, 1
  br i1 %4, label %for.end47, label %for.body30.lr.ph.new

for.body30.lr.ph.new:                             ; preds = %for.body30.prol.loopexit.unr-lcssa
  %arrayidx43.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %.pre46, i64 %indvars.iv43, i64 %indvars.iv43
  %.pre47 = load double, double* %arrayidx43.phi.trans.insert, align 8
  %5 = sub i64 %1, %indvars.iv35.unr.ph
  %6 = lshr i64 %5, 1
  %7 = and i64 %6, 1
  %lcmp.mod51 = icmp eq i64 %7, 0
  br i1 %lcmp.mod51, label %for.body30.prol.preheader50, label %for.body30.prol.loopexit.unr-lcssa55

for.body30.prol.preheader50:                      ; preds = %for.body30.lr.ph.new
  %arrayidx34.prol52 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre46, i64 %indvars.iv43, i64 %indvars.iv35.unr.ph
  %8 = load double, double* %arrayidx34.prol52, align 8
  %mul39.prol53 = fmul double %8, %8
  %sub44.prol54 = fsub double %.pre47, %mul39.prol53
  store double %sub44.prol54, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next36.prol = add nuw nsw i64 %indvars.iv35.unr.ph, 1
  %arrayidx34.1.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre46, i64 %indvars.iv43, i64 %indvars.iv.next36.prol
  %9 = load double, double* %arrayidx34.1.prol, align 8
  %mul39.1.prol = fmul double %9, %9
  %sub44.1.prol = fsub double %sub44.prol54, %mul39.1.prol
  store double %sub44.1.prol, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next36.1.prol = or i64 %indvars.iv35.unr.ph, 2
  br label %for.body30.prol.loopexit.unr-lcssa55

for.body30.prol.loopexit.unr-lcssa55:             ; preds = %for.body30.lr.ph.new, %for.body30.prol.preheader50
  %.unr.ph = phi double [ %sub44.1.prol, %for.body30.prol.preheader50 ], [ %.pre47, %for.body30.lr.ph.new ]
  %indvars.iv35.unr.ph56 = phi i64 [ %indvars.iv.next36.1.prol, %for.body30.prol.preheader50 ], [ %indvars.iv35.unr.ph, %for.body30.lr.ph.new ]
  %10 = icmp eq i64 %6, 0
  br i1 %10, label %for.end47, label %for.body30.lr.ph.new.new

for.body30.lr.ph.new.new:                         ; preds = %for.body30.prol.loopexit.unr-lcssa55
  br label %for.body30

for.cond4.preheader:                              ; preds = %for.end, %for.cond1.preheader.for.cond4.preheader_crit_edge
  %11 = phi [2000 x double]* [ %0, %for.cond1.preheader.for.cond4.preheader_crit_edge ], [ %.pre46, %for.end ]
  %indvars.iv30 = phi i64 [ 0, %for.cond1.preheader.for.cond4.preheader_crit_edge ], [ %indvars.iv.next31, %for.end ]
  %12 = add i64 %indvars.iv30, 4294967295
  %cmp58 = icmp sgt i64 %indvars.iv30, 0
  br i1 %cmp58, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %xtraiter49 = and i64 %indvars.iv30, 1
  %lcmp.mod = icmp eq i64 %xtraiter49, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit.unr-lcssa, label %for.body6.prol.preheader

for.body6.prol.preheader:                         ; preds = %for.body6.lr.ph
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv43, i64 0
  %13 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv30, i64 0
  %14 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %13, %14
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv43, i64 %indvars.iv30
  %15 = load double, double* %arrayidx16.prol, align 8
  %sub.prol = fsub double %15, %mul.prol
  store double %sub.prol, double* %arrayidx16.prol, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.lr.ph, %for.body6.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol.preheader ], [ 0, %for.body6.lr.ph ]
  %16 = trunc i64 %12 to i32
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %for.end, label %for.body6.lr.ph.new

for.body6.lr.ph.new:                              ; preds = %for.body6.prol.loopexit.unr-lcssa
  %arrayidx16.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv43, i64 %indvars.iv30
  %.pre45 = load double, double* %arrayidx16.phi.trans.insert, align 8
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.lr.ph.new
  %18 = phi double [ %.pre45, %for.body6.lr.ph.new ], [ %sub.1, %for.body6 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.lr.ph.new ], [ %indvars.iv.next.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv43, i64 %indvars.iv
  %19 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv30, i64 %indvars.iv
  %20 = load double, double* %arrayidx12, align 8
  %mul = fmul double %19, %20
  %sub = fsub double %18, %mul
  store double %sub, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv43, i64 %indvars.iv.next
  %21 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv30, i64 %indvars.iv.next
  %22 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %21, %22
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv30
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body6.prol.loopexit.unr-lcssa, %for.cond4.preheader
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv30, i64 %indvars.iv30
  %23 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv43, i64 %indvars.iv30
  %24 = load double, double* %arrayidx24, align 8
  %div = fdiv double %24, %23
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond = icmp eq i64 %indvars.iv.next31, %wide.trip.count34
  %.pre46 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br i1 %exitcond, label %for.body30.lr.ph, label %for.cond4.preheader

for.body30:                                       ; preds = %for.body30, %for.body30.lr.ph.new.new
  %25 = phi double [ %.unr.ph, %for.body30.lr.ph.new.new ], [ %sub44.1.1, %for.body30 ]
  %indvars.iv35 = phi i64 [ %indvars.iv35.unr.ph56, %for.body30.lr.ph.new.new ], [ %indvars.iv.next36.1.1, %for.body30 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre46, i64 %indvars.iv43, i64 %indvars.iv35
  %26 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %26, %26
  %sub44 = fsub double %25, %mul39
  store double %sub44, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre46, i64 %indvars.iv43, i64 %indvars.iv.next36
  %27 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %27, %27
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, 2
  %arrayidx34.157 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre46, i64 %indvars.iv43, i64 %indvars.iv.next36.1
  %28 = load double, double* %arrayidx34.157, align 8
  %mul39.158 = fmul double %28, %28
  %sub44.159 = fsub double %sub44.1, %mul39.158
  store double %sub44.159, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next36.160 = add nsw i64 %indvars.iv35, 3
  %arrayidx34.1.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre46, i64 %indvars.iv43, i64 %indvars.iv.next36.160
  %29 = load double, double* %arrayidx34.1.1, align 8
  %mul39.1.1 = fmul double %29, %29
  %sub44.1.1 = fsub double %sub44.159, %mul39.1.1
  store double %sub44.1.1, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next36.1.1 = add nsw i64 %indvars.iv35, 4
  %exitcond39.1.1 = icmp eq i64 %indvars.iv.next36.1.1, %wide.trip.count34
  br i1 %exitcond39.1.1, label %for.end47.loopexit, label %for.body30

for.end47.loopexit:                               ; preds = %for.body30
  br label %for.end47

for.end47:                                        ; preds = %for.end47.loopexit, %for.body30.prol.loopexit.unr-lcssa, %for.body30.prol.loopexit.unr-lcssa55, %for.cond1.preheader
  %30 = phi [2000 x double]* [ %0, %for.cond1.preheader ], [ %.pre46, %for.body30.prol.loopexit.unr-lcssa55 ], [ %.pre46, %for.body30.prol.loopexit.unr-lcssa ], [ %.pre46, %for.end47.loopexit ]
  %31 = phi [2000 x double]* [ %0, %for.cond1.preheader ], [ %.pre46, %for.body30.prol.loopexit.unr-lcssa55 ], [ %.pre46, %for.body30.prol.loopexit.unr-lcssa ], [ %.pre46, %for.end47.loopexit ]
  %arrayidx51 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i64 %indvars.iv43, i64 %indvars.iv43
  %32 = load double, double* %arrayidx51, align 8
  %call = call double @sqrt(double %32) #3
  %arrayidx55 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i64 %indvars.iv43, i64 %indvars.iv43
  store double %call, double* %arrayidx55, align 8
  %indvars.iv.next44 = add nsw i64 %indvars.iv43, 1
  %indvars.iv.next38 = add i32 %indvars.iv37, 1
  %cmp = icmp slt i64 %indvars.iv.next44, 2000
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp, label %for.cond1.preheader, label %for.end58

for.end58:                                        ; preds = %for.end47
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv12 = phi i64 [ 0, %entry ], [ %indvars.iv.next13, %for.inc10 ]
  %indvars.iv10 = phi i32 [ 1, %entry ], [ %indvars.iv.next11, %for.inc10 ]
  %cmp32 = icmp slt i64 %indvars.iv12, 0
  br i1 %cmp32, label %for.inc10, label %for.cond2.preheader.for.body4_crit_edge

for.cond2.preheader.for.body4_crit_edge:          ; preds = %for.cond2.preheader
  %3 = mul nsw i64 %indvars.iv12, 2000
  %wide.trip.count = zext i32 %indvars.iv10 to i64
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader.for.body4_crit_edge
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.for.body4_crit_edge ], [ %indvars.iv.next, %if.end ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc10.loopexit, label %for.body4

for.inc10.loopexit:                               ; preds = %if.end
  br label %for.inc10

for.inc10:                                        ; preds = %for.inc10.loopexit, %for.cond2.preheader
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, 1
  %cmp = icmp slt i64 %indvars.iv.next13, 2000
  %indvars.iv.next11 = add i32 %indvars.iv10, 1
  br i1 %cmp, label %for.cond2.preheader, label %for.end12

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
