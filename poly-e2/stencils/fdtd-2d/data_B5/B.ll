; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay4 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay5 = bitcast i8* %call2 to [1200 x double]*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
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
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %tmax, i32 %nx, i32 %ny, [1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture %_fict_) #2 {
entry:
  %cmp5 = icmp sgt i32 %tmax, 0
  br i1 %cmp5, label %for.body.preheader, label %for.cond1.preheader

for.body.preheader:                               ; preds = %entry
  %0 = add i32 %tmax, -1
  %xtraiter = and i32 %tmax, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body.prol.loopexit, label %for.body.prol.preheader

for.body.prol.preheader:                          ; preds = %for.body.preheader
  br label %for.body.prol

for.body.prol:                                    ; preds = %for.body.prol.preheader, %for.body.prol
  %indvars.iv15.prol = phi i64 [ %indvars.iv.next16.prol, %for.body.prol ], [ 0, %for.body.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body.prol ], [ %xtraiter, %for.body.prol.preheader ]
  %1 = trunc i64 %indvars.iv15.prol to i32
  %conv.prol = sitofp i32 %1 to double
  %arrayidx.prol = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv15.prol
  store double %conv.prol, double* %arrayidx.prol, align 8
  %indvars.iv.next16.prol = add nuw nsw i64 %indvars.iv15.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body.prol.loopexit.loopexit, label %for.body.prol, !llvm.loop !1

for.body.prol.loopexit.loopexit:                  ; preds = %for.body.prol
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.prol.loopexit.loopexit, %for.body.preheader
  %indvars.iv15.unr = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next16.prol, %for.body.prol.loopexit.loopexit ]
  %2 = icmp ult i32 %0, 7
  br i1 %2, label %for.cond1.preheader, label %for.body.preheader19

for.body.preheader19:                             ; preds = %for.body.prol.loopexit
  %wide.trip.count17.7 = zext i32 %tmax to i64
  br label %for.body

for.cond1.preheader.loopexit:                     ; preds = %for.body
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.loopexit, %for.body.prol.loopexit, %entry
  %cmp23 = icmp sgt i32 %nx, 0
  br i1 %cmp23, label %for.cond5.preheader.lr.ph, label %for.end41

for.cond5.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  %cmp61 = icmp sgt i32 %ny, 0
  %conv11 = sitofp i32 %nx to double
  %conv20 = sitofp i32 %ny to double
  br i1 %cmp61, label %for.cond5.preheader.us.preheader, label %for.end41

for.cond5.preheader.us.preheader:                 ; preds = %for.cond5.preheader.lr.ph
  %wide.trip.count = zext i32 %ny to i64
  %wide.trip.count12 = zext i32 %nx to i64
  br label %for.cond5.preheader.us

for.cond5.preheader.us:                           ; preds = %for.cond5.preheader.us.preheader, %for.cond5.for.inc39_crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.cond5.for.inc39_crit_edge.us ], [ 0, %for.cond5.preheader.us.preheader ]
  %3 = trunc i64 %indvars.iv10 to i32
  %conv9.us = sitofp i32 %3 to double
  br label %for.body8.us

for.body8.us:                                     ; preds = %for.body8.us, %for.cond5.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next, %for.body8.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %4 = trunc i64 %indvars.iv.next to i32
  %conv10.us = sitofp i32 %4 to double
  %mul.us = fmul double %conv9.us, %conv10.us
  %div.us = fdiv double %mul.us, %conv11
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv10, i64 %indvars.iv
  store double %div.us, double* %arrayidx15.us, align 8
  %5 = add nuw nsw i64 %indvars.iv, 2
  %6 = trunc i64 %5 to i32
  %conv18.us = sitofp i32 %6 to double
  %mul19.us = fmul double %conv9.us, %conv18.us
  %div21.us = fdiv double %mul19.us, %conv20
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv10, i64 %indvars.iv
  store double %div21.us, double* %arrayidx25.us, align 8
  %7 = add nuw nsw i64 %indvars.iv, 3
  %8 = trunc i64 %7 to i32
  %conv28.us = sitofp i32 %8 to double
  %mul29.us = fmul double %conv9.us, %conv28.us
  %div31.us = fdiv double %mul29.us, %conv11
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv10, i64 %indvars.iv
  store double %div31.us, double* %arrayidx35.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond5.for.inc39_crit_edge.us, label %for.body8.us

for.cond5.for.inc39_crit_edge.us:                 ; preds = %for.body8.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, %wide.trip.count12
  br i1 %exitcond13, label %for.end41.loopexit, label %for.cond5.preheader.us

for.body:                                         ; preds = %for.body.preheader19, %for.body
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.7, %for.body ], [ %indvars.iv15.unr, %for.body.preheader19 ]
  %9 = trunc i64 %indvars.iv15 to i32
  %conv = sitofp i32 %9 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv15
  store double %conv, double* %arrayidx, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %10 = trunc i64 %indvars.iv.next16 to i32
  %conv.1 = sitofp i32 %10 to double
  %arrayidx.1 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next16
  store double %conv.1, double* %arrayidx.1, align 8
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, 2
  %11 = trunc i64 %indvars.iv.next16.1 to i32
  %conv.2 = sitofp i32 %11 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next16.1
  store double %conv.2, double* %arrayidx.2, align 8
  %indvars.iv.next16.2 = add nsw i64 %indvars.iv15, 3
  %12 = trunc i64 %indvars.iv.next16.2 to i32
  %conv.3 = sitofp i32 %12 to double
  %arrayidx.3 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next16.2
  store double %conv.3, double* %arrayidx.3, align 8
  %indvars.iv.next16.3 = add nsw i64 %indvars.iv15, 4
  %13 = trunc i64 %indvars.iv.next16.3 to i32
  %conv.4 = sitofp i32 %13 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next16.3
  store double %conv.4, double* %arrayidx.4, align 8
  %indvars.iv.next16.4 = add nsw i64 %indvars.iv15, 5
  %14 = trunc i64 %indvars.iv.next16.4 to i32
  %conv.5 = sitofp i32 %14 to double
  %arrayidx.5 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next16.4
  store double %conv.5, double* %arrayidx.5, align 8
  %indvars.iv.next16.5 = add nsw i64 %indvars.iv15, 6
  %15 = trunc i64 %indvars.iv.next16.5 to i32
  %conv.6 = sitofp i32 %15 to double
  %arrayidx.6 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next16.5
  store double %conv.6, double* %arrayidx.6, align 8
  %indvars.iv.next16.6 = add nsw i64 %indvars.iv15, 7
  %16 = trunc i64 %indvars.iv.next16.6 to i32
  %conv.7 = sitofp i32 %16 to double
  %arrayidx.7 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next16.6
  store double %conv.7, double* %arrayidx.7, align 8
  %indvars.iv.next16.7 = add nsw i64 %indvars.iv15, 8
  %exitcond18.7 = icmp eq i64 %indvars.iv.next16.7, %wide.trip.count17.7
  br i1 %exitcond18.7, label %for.cond1.preheader.loopexit, label %for.body

for.end41.loopexit:                               ; preds = %for.cond5.for.inc39_crit_edge.us
  br label %for.end41

for.end41:                                        ; preds = %for.end41.loopexit, %for.cond5.preheader.lr.ph, %for.cond1.preheader
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d(i32 %tmax, i32 %nx, i32 %ny, [1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture readonly %_fict_) #2 {
entry:
  %cmp15 = icmp sgt i32 %tmax, 0
  br i1 %cmp15, label %for.cond1.preheader.lr.ph, label %for.end115

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp21 = icmp sgt i32 %ny, 0
  %sub70 = add nsw i32 %nx, -1
  %sub74 = add nsw i32 %ny, -1
  %xtraiter = and i32 %ny, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %0 = icmp ult i32 %sub74, 7
  %wide.trip.count.7 = zext i32 %ny to i64
  %xtraiter23 = and i32 %ny, 1
  %lcmp.mod24 = icmp eq i32 %xtraiter23, 0
  %1 = icmp eq i32 %sub74, 0
  %wide.trip.count29 = zext i32 %nx to i64
  %wide.trip.count22.1 = zext i32 %ny to i64
  %xtraiter36 = and i32 %sub74, 1
  %lcmp.mod37 = icmp eq i32 %xtraiter36, 0
  %2 = icmp eq i32 %ny, 2
  %wide.trip.count40 = zext i32 %nx to i64
  %wide.trip.count34.1 = zext i32 %ny to i64
  %wide.trip.count49 = zext i32 %sub70 to i64
  %wide.trip.count45 = zext i32 %sub74 to i64
  %wide.trip.count53 = zext i32 %tmax to i64
  %3 = add nuw nsw i64 %wide.trip.count45, 1
  %4 = add nsw i64 %wide.trip.count34.1, -2
  %5 = add nsw i64 %wide.trip.count34.1, -2
  %6 = add nsw i64 %wide.trip.count34.1, -2
  %7 = add nsw i64 %wide.trip.count34.1, -2
  %cmp85.not = icmp slt i32 %nx, 2
  %cmp113.not = icmp slt i32 %ny, 1
  %brmerge = or i1 %cmp85.not, %cmp113.not
  %cmp389.not = icmp slt i32 %nx, 1
  %cmp417.not = icmp slt i32 %ny, 2
  %brmerge55 = or i1 %cmp389.not, %cmp417.not
  %cmp7113.not = icmp slt i32 %nx, 2
  %cmp7511.not = icmp slt i32 %ny, 2
  %brmerge56 = or i1 %cmp7113.not, %cmp7511.not
  %min.iters.check = icmp ult i32 %sub74, 4
  %8 = and i32 %sub74, 3
  %n.mod.vf = zext i32 %8 to i64
  %n.vec = sub nsw i64 %wide.trip.count45, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %8, 0
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc113, %for.cond1.preheader.lr.ph
  %indvars.iv51 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next52, %for.inc113 ]
  br i1 %cmp21, label %for.body3.lr.ph, label %for.cond7.preheader

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv51
  %9 = bitcast double* %arrayidx to i64*
  br i1 %lcmp.mod, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader, %for.body3.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.prol ], [ 0, %for.body3.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.prol ], [ %xtraiter, %for.body3.prol.preheader ]
  %10 = load i64, i64* %9, align 8
  %arrayidx6.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.prol
  %11 = bitcast double* %arrayidx6.prol to i64*
  store i64 %10, i64* %11, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol, !llvm.loop !3

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next.prol, %for.body3.prol.loopexit.loopexit ]
  br i1 %0, label %for.cond7.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.cond7.preheader.loopexit:                     ; preds = %for.body3
  br label %for.cond7.preheader

for.cond7.preheader:                              ; preds = %for.cond7.preheader.loopexit, %for.body3.prol.loopexit, %for.cond1.preheader
  br i1 %brmerge, label %for.cond37.preheader, label %for.cond10.preheader.us.preheader

for.cond10.preheader.us.preheader:                ; preds = %for.cond7.preheader
  br label %for.cond10.preheader.us

for.cond10.preheader.us:                          ; preds = %for.cond10.preheader.us.preheader, %for.cond10.for.inc34_crit_edge.us
  %indvar = phi i64 [ %indvar.next, %for.cond10.for.inc34_crit_edge.us ], [ 0, %for.cond10.preheader.us.preheader ]
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.cond10.for.inc34_crit_edge.us ], [ 1, %for.cond10.preheader.us.preheader ]
  %12 = add i64 %indvar, 1
  %scevgep134 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %12, i64 2
  %scevgep140 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %12, i64 2
  %13 = add nsw i64 %indvars.iv26, -1
  br i1 %lcmp.mod24, label %for.body12.us.prol.loopexit, label %for.body12.us.prol

for.body12.us.prol:                               ; preds = %for.cond10.preheader.us
  %arrayidx16.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv26, i64 0
  %14 = load double, double* %arrayidx16.us.prol, align 8
  %arrayidx20.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv26, i64 0
  %15 = load double, double* %arrayidx20.us.prol, align 8
  %arrayidx24.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %13, i64 0
  %16 = load double, double* %arrayidx24.us.prol, align 8
  %sub25.us.prol = fsub double %15, %16
  %mul.us.prol = fmul double %sub25.us.prol, 5.000000e-01
  %sub26.us.prol = fsub double %14, %mul.us.prol
  store double %sub26.us.prol, double* %arrayidx16.us.prol, align 8
  br label %for.body12.us.prol.loopexit

for.body12.us.prol.loopexit:                      ; preds = %for.body12.us.prol, %for.cond10.preheader.us
  %indvars.iv20.unr.ph = phi i64 [ 1, %for.body12.us.prol ], [ 0, %for.cond10.preheader.us ]
  br i1 %1, label %for.cond10.for.inc34_crit_edge.us, label %for.body12.us.preheader

for.body12.us.preheader:                          ; preds = %for.body12.us.prol.loopexit
  %17 = sub nsw i64 %6, %indvars.iv20.unr.ph
  %18 = lshr i64 %17, 1
  %19 = add nuw i64 %18, 1
  %min.iters.check125 = icmp ult i64 %19, 2
  br i1 %min.iters.check125, label %for.body12.us.preheader169, label %min.iters.checked126

min.iters.checked126:                             ; preds = %for.body12.us.preheader
  %n.mod.vf127 = and i64 %19, 1
  %n.vec128 = sub i64 %19, %n.mod.vf127
  %cmp.zero129 = icmp eq i64 %n.vec128, 0
  br i1 %cmp.zero129, label %for.body12.us.preheader169, label %vector.memcheck147

vector.memcheck147:                               ; preds = %min.iters.checked126
  %scevgep132 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %12, i64 %indvars.iv20.unr.ph
  %20 = sub nsw i64 %7, %indvars.iv20.unr.ph
  %21 = and i64 %20, -2
  %22 = or i64 %indvars.iv20.unr.ph, %21
  %scevgep135 = getelementptr double, double* %scevgep134, i64 %22
  %scevgep138 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 %indvars.iv20.unr.ph
  %scevgep141 = getelementptr double, double* %scevgep140, i64 %22
  %bound0143 = icmp ult double* %scevgep132, %scevgep141
  %bound1144 = icmp ult double* %scevgep138, %scevgep135
  %memcheck.conflict146 = and i1 %bound0143, %bound1144
  %23 = or i64 %indvars.iv20.unr.ph, 2
  %24 = shl nuw i64 %18, 1
  %25 = add i64 %23, %24
  %26 = shl nuw nsw i64 %n.mod.vf127, 1
  %ind.end152 = sub i64 %25, %26
  br i1 %memcheck.conflict146, label %for.body12.us.preheader169, label %vector.body122.preheader

vector.body122.preheader:                         ; preds = %vector.memcheck147
  br label %vector.body122

vector.body122:                                   ; preds = %vector.body122.preheader, %vector.body122
  %index149 = phi i64 [ %index.next150, %vector.body122 ], [ 0, %vector.body122.preheader ]
  %27 = shl i64 %index149, 1
  %offset.idx154 = or i64 %indvars.iv20.unr.ph, %27
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv26, i64 %offset.idx154
  %29 = bitcast double* %28 to <4 x double>*
  %wide.vec158 = load <4 x double>, <4 x double>* %29, align 8, !alias.scope !4, !noalias !7
  %strided.vec159 = shufflevector <4 x double> %wide.vec158, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec160 = shufflevector <4 x double> %wide.vec158, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv26, i64 %offset.idx154
  %31 = bitcast double* %30 to <4 x double>*
  %wide.vec161 = load <4 x double>, <4 x double>* %31, align 8, !alias.scope !7
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %13, i64 %offset.idx154
  %33 = bitcast double* %32 to <4 x double>*
  %wide.vec164 = load <4 x double>, <4 x double>* %33, align 8, !alias.scope !7
  %34 = fsub <4 x double> %wide.vec161, %wide.vec164
  %35 = shufflevector <4 x double> %34, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %36 = fmul <2 x double> %35, <double 5.000000e-01, double 5.000000e-01>
  %37 = fsub <2 x double> %strided.vec159, %36
  %38 = add nuw nsw i64 %offset.idx154, 1
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv26, i64 %38
  %40 = fsub <4 x double> %wide.vec161, %wide.vec164
  %41 = shufflevector <4 x double> %40, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %42 = fmul <2 x double> %41, <double 5.000000e-01, double 5.000000e-01>
  %43 = fsub <2 x double> %strided.vec160, %42
  %44 = getelementptr double, double* %39, i64 -1
  %45 = bitcast double* %44 to <4 x double>*
  %interleaved.vec167 = shufflevector <2 x double> %37, <2 x double> %43, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec167, <4 x double>* %45, align 8, !alias.scope !4, !noalias !7
  %index.next150 = add i64 %index149, 2
  %46 = icmp eq i64 %index.next150, %n.vec128
  br i1 %46, label %middle.block123, label %vector.body122, !llvm.loop !9

middle.block123:                                  ; preds = %vector.body122
  %cmp.n153 = icmp eq i64 %n.mod.vf127, 0
  br i1 %cmp.n153, label %for.cond10.for.inc34_crit_edge.us, label %for.body12.us.preheader169

for.body12.us.preheader169:                       ; preds = %middle.block123, %vector.memcheck147, %min.iters.checked126, %for.body12.us.preheader
  %indvars.iv20.ph = phi i64 [ %indvars.iv20.unr.ph, %vector.memcheck147 ], [ %indvars.iv20.unr.ph, %min.iters.checked126 ], [ %indvars.iv20.unr.ph, %for.body12.us.preheader ], [ %ind.end152, %middle.block123 ]
  br label %for.body12.us

for.body12.us:                                    ; preds = %for.body12.us.preheader169, %for.body12.us
  %indvars.iv20 = phi i64 [ %indvars.iv.next21.1, %for.body12.us ], [ %indvars.iv20.ph, %for.body12.us.preheader169 ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv26, i64 %indvars.iv20
  %47 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv26, i64 %indvars.iv20
  %48 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %13, i64 %indvars.iv20
  %49 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %48, %49
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %47, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv26, i64 %indvars.iv.next21
  %50 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv26, i64 %indvars.iv.next21
  %51 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %13, i64 %indvars.iv.next21
  %52 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %51, %52
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %50, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next21.1, %wide.trip.count22.1
  br i1 %exitcond.1, label %for.cond10.for.inc34_crit_edge.us.loopexit, label %for.body12.us, !llvm.loop !12

for.cond10.for.inc34_crit_edge.us.loopexit:       ; preds = %for.body12.us
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us:                ; preds = %for.cond10.for.inc34_crit_edge.us.loopexit, %middle.block123, %for.body12.us.prol.loopexit
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, %wide.trip.count29
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %for.cond37.preheader.loopexit, label %for.cond10.preheader.us

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %for.body3 ], [ %indvars.iv.unr, %for.body3.preheader ]
  %53 = load i64, i64* %9, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv
  %54 = bitcast double* %arrayidx6 to i64*
  store i64 %53, i64* %54, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %55 = load i64, i64* %9, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %56 = bitcast double* %arrayidx6.1 to i64*
  store i64 %55, i64* %56, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %57 = load i64, i64* %9, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %58 = bitcast double* %arrayidx6.2 to i64*
  store i64 %57, i64* %58, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %59 = load i64, i64* %9, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %60 = bitcast double* %arrayidx6.3 to i64*
  store i64 %59, i64* %60, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %61 = load i64, i64* %9, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %62 = bitcast double* %arrayidx6.4 to i64*
  store i64 %61, i64* %62, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %63 = load i64, i64* %9, align 8
  %arrayidx6.5 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.4
  %64 = bitcast double* %arrayidx6.5 to i64*
  store i64 %63, i64* %64, align 8
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %65 = load i64, i64* %9, align 8
  %arrayidx6.6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.5
  %66 = bitcast double* %arrayidx6.6 to i64*
  store i64 %65, i64* %66, align 8
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %67 = load i64, i64* %9, align 8
  %arrayidx6.7 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.6
  %68 = bitcast double* %arrayidx6.7 to i64*
  store i64 %67, i64* %68, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, %wide.trip.count.7
  br i1 %exitcond.7, label %for.cond7.preheader.loopexit, label %for.body3

for.cond37.preheader.loopexit:                    ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond37.preheader

for.cond37.preheader:                             ; preds = %for.cond37.preheader.loopexit, %for.cond7.preheader
  br i1 %brmerge55, label %for.cond69.preheader, label %for.cond40.preheader.us.preheader

for.cond40.preheader.us.preheader:                ; preds = %for.cond37.preheader
  br label %for.cond40.preheader.us

for.cond40.preheader.us:                          ; preds = %for.cond40.preheader.us.preheader, %for.cond40.for.inc66_crit_edge.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %for.cond40.for.inc66_crit_edge.us ], [ 0, %for.cond40.preheader.us.preheader ]
  %scevgep93 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv38, i64 2
  %scevgep96 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv38, i64 -1
  %scevgep99 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv38, i64 2
  br i1 %lcmp.mod37, label %for.body42.us.prol.loopexit, label %for.body42.us.prol

for.body42.us.prol:                               ; preds = %for.cond40.preheader.us
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv38, i64 1
  %69 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv38, i64 1
  %70 = load double, double* %arrayidx50.us.prol, align 8
  %arrayidx55.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv38, i64 0
  %71 = load double, double* %arrayidx55.us.prol, align 8
  %sub56.us.prol = fsub double %70, %71
  %mul57.us.prol = fmul double %sub56.us.prol, 5.000000e-01
  %sub58.us.prol = fsub double %69, %mul57.us.prol
  store double %sub58.us.prol, double* %arrayidx46.us.prol, align 8
  br label %for.body42.us.prol.loopexit

for.body42.us.prol.loopexit:                      ; preds = %for.body42.us.prol, %for.cond40.preheader.us
  %indvars.iv31.unr.ph = phi i64 [ 2, %for.body42.us.prol ], [ 1, %for.cond40.preheader.us ]
  br i1 %2, label %for.cond40.for.inc66_crit_edge.us, label %for.body42.us.preheader

for.body42.us.preheader:                          ; preds = %for.body42.us.prol.loopexit
  %72 = sub nsw i64 %4, %indvars.iv31.unr.ph
  %73 = lshr i64 %72, 1
  %74 = add nuw i64 %73, 1
  %min.iters.check84 = icmp ult i64 %74, 2
  br i1 %min.iters.check84, label %for.body42.us.preheader168, label %min.iters.checked85

min.iters.checked85:                              ; preds = %for.body42.us.preheader
  %n.mod.vf86 = and i64 %74, 1
  %n.vec87 = sub i64 %74, %n.mod.vf86
  %cmp.zero88 = icmp eq i64 %n.vec87, 0
  br i1 %cmp.zero88, label %for.body42.us.preheader168, label %vector.memcheck106

vector.memcheck106:                               ; preds = %min.iters.checked85
  %scevgep91 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv38, i64 %indvars.iv31.unr.ph
  %75 = sub nsw i64 %5, %indvars.iv31.unr.ph
  %76 = and i64 %75, -2
  %77 = add nsw i64 %indvars.iv31.unr.ph, %76
  %scevgep94 = getelementptr double, double* %scevgep93, i64 %77
  %scevgep97 = getelementptr double, double* %scevgep96, i64 %indvars.iv31.unr.ph
  %scevgep100 = getelementptr double, double* %scevgep99, i64 %77
  %bound0102 = icmp ult double* %scevgep91, %scevgep100
  %bound1103 = icmp ult double* %scevgep97, %scevgep94
  %memcheck.conflict105 = and i1 %bound0102, %bound1103
  %78 = add nuw nsw i64 %indvars.iv31.unr.ph, 2
  %79 = shl nuw i64 %73, 1
  %80 = add i64 %78, %79
  %81 = shl nuw nsw i64 %n.mod.vf86, 1
  %ind.end = sub i64 %80, %81
  br i1 %memcheck.conflict105, label %for.body42.us.preheader168, label %vector.body81.preheader

vector.body81.preheader:                          ; preds = %vector.memcheck106
  br label %vector.body81

vector.body81:                                    ; preds = %vector.body81.preheader, %vector.body81
  %index108 = phi i64 [ %index.next109, %vector.body81 ], [ 0, %vector.body81.preheader ]
  %82 = shl i64 %index108, 1
  %offset.idx = or i64 %indvars.iv31.unr.ph, %82
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv38, i64 %offset.idx
  %84 = bitcast double* %83 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %84, align 8, !alias.scope !13, !noalias !16
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec115 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv38, i64 %offset.idx
  %86 = getelementptr double, double* %85, i64 -1
  %87 = bitcast double* %86 to <4 x double>*
  %wide.vec116 = load <4 x double>, <4 x double>* %87, align 8, !alias.scope !16
  %strided.vec117 = shufflevector <4 x double> %wide.vec116, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec118 = shufflevector <4 x double> %wide.vec116, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %88 = fsub <2 x double> %strided.vec118, %strided.vec117
  %89 = fmul <2 x double> %88, <double 5.000000e-01, double 5.000000e-01>
  %90 = fsub <2 x double> %strided.vec, %89
  %91 = add nuw nsw i64 %offset.idx, 1
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv38, i64 %91
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv38, i64 %91
  %94 = getelementptr double, double* %93, i64 -1
  %95 = bitcast double* %94 to <4 x double>*
  %wide.vec119 = load <4 x double>, <4 x double>* %95, align 8, !alias.scope !16
  %strided.vec120 = shufflevector <4 x double> %wide.vec119, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec121 = shufflevector <4 x double> %wide.vec119, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %96 = fsub <2 x double> %strided.vec121, %strided.vec120
  %97 = fmul <2 x double> %96, <double 5.000000e-01, double 5.000000e-01>
  %98 = fsub <2 x double> %strided.vec115, %97
  %99 = getelementptr double, double* %92, i64 -1
  %100 = bitcast double* %99 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %90, <2 x double> %98, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %100, align 8, !alias.scope !13, !noalias !16
  %index.next109 = add i64 %index108, 2
  %101 = icmp eq i64 %index.next109, %n.vec87
  br i1 %101, label %middle.block82, label %vector.body81, !llvm.loop !18

middle.block82:                                   ; preds = %vector.body81
  %cmp.n111 = icmp eq i64 %n.mod.vf86, 0
  br i1 %cmp.n111, label %for.cond40.for.inc66_crit_edge.us, label %for.body42.us.preheader168

for.body42.us.preheader168:                       ; preds = %middle.block82, %vector.memcheck106, %min.iters.checked85, %for.body42.us.preheader
  %indvars.iv31.ph = phi i64 [ %indvars.iv31.unr.ph, %vector.memcheck106 ], [ %indvars.iv31.unr.ph, %min.iters.checked85 ], [ %indvars.iv31.unr.ph, %for.body42.us.preheader ], [ %ind.end, %middle.block82 ]
  br label %for.body42.us

for.body42.us:                                    ; preds = %for.body42.us.preheader168, %for.body42.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32.1, %for.body42.us ], [ %indvars.iv31.ph, %for.body42.us.preheader168 ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv38, i64 %indvars.iv31
  %102 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv38, i64 %indvars.iv31
  %103 = load double, double* %arrayidx50.us, align 8
  %104 = add nsw i64 %indvars.iv31, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv38, i64 %104
  %105 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %103, %105
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %102, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv38, i64 %indvars.iv.next32
  %106 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv38, i64 %indvars.iv.next32
  %107 = load double, double* %arrayidx50.us.1, align 8
  %arrayidx55.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv38, i64 %indvars.iv31
  %108 = load double, double* %arrayidx55.us.1, align 8
  %sub56.us.1 = fsub double %107, %108
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %106, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %indvars.iv.next32.1 = add nsw i64 %indvars.iv31, 2
  %exitcond35.1 = icmp eq i64 %indvars.iv.next32.1, %wide.trip.count34.1
  br i1 %exitcond35.1, label %for.cond40.for.inc66_crit_edge.us.loopexit, label %for.body42.us, !llvm.loop !19

for.cond40.for.inc66_crit_edge.us.loopexit:       ; preds = %for.body42.us
  br label %for.cond40.for.inc66_crit_edge.us

for.cond40.for.inc66_crit_edge.us:                ; preds = %for.cond40.for.inc66_crit_edge.us.loopexit, %middle.block82, %for.body42.us.prol.loopexit
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, %wide.trip.count40
  br i1 %exitcond41, label %for.cond69.preheader.loopexit, label %for.cond40.preheader.us

for.cond69.preheader.loopexit:                    ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond69.preheader

for.cond69.preheader:                             ; preds = %for.cond69.preheader.loopexit, %for.cond37.preheader
  br i1 %brmerge56, label %for.inc113, label %for.cond73.preheader.us.preheader

for.cond73.preheader.us.preheader:                ; preds = %for.cond69.preheader
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.preheader.us.preheader, %for.cond73.for.inc110_crit_edge.us
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.cond73.for.inc110_crit_edge.us ], [ 0, %for.cond73.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv47, i64 0
  %scevgep58 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv47, i64 %wide.trip.count45
  %scevgep60 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv47, i64 0
  %scevgep62 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv47, i64 %3
  %scevgep64 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv47, i64 0
  %109 = add i64 %indvars.iv47, 1
  %scevgep66 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %109, i64 %wide.trip.count45
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  br i1 %min.iters.check, label %for.body76.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond73.preheader.us
  br i1 %cmp.zero, label %for.body76.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep62
  %bound1 = icmp ult double* %scevgep60, %scevgep58
  %found.conflict = and i1 %bound0, %bound1
  %bound068 = icmp ult double* %scevgep, %scevgep66
  %bound169 = icmp ult double* %scevgep64, %scevgep58
  %found.conflict70 = and i1 %bound068, %bound169
  %conflict.rdx = or i1 %found.conflict, %found.conflict70
  br i1 %conflict.rdx, label %for.body76.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv47, i64 %index
  %111 = bitcast double* %110 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %111, align 8, !alias.scope !20, !noalias !23
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !20, !noalias !23
  %114 = or i64 %index, 1
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv47, i64 %114
  %116 = bitcast double* %115 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %116, align 8, !alias.scope !26
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !26
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv47, i64 %index
  %120 = bitcast double* %119 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !26
  %121 = getelementptr double, double* %119, i64 2
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !26
  %123 = fsub <2 x double> %wide.load73, %wide.load75
  %124 = fsub <2 x double> %wide.load74, %wide.load76
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv.next48, i64 %index
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !27
  %127 = getelementptr double, double* %125, i64 2
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !27
  %129 = fadd <2 x double> %123, %wide.load77
  %130 = fadd <2 x double> %124, %wide.load78
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv47, i64 %index
  %132 = bitcast double* %131 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %132, align 8, !alias.scope !27
  %133 = getelementptr double, double* %131, i64 2
  %134 = bitcast double* %133 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %134, align 8, !alias.scope !27
  %135 = fsub <2 x double> %129, %wide.load79
  %136 = fsub <2 x double> %130, %wide.load80
  %137 = fmul <2 x double> %135, <double 7.000000e-01, double 7.000000e-01>
  %138 = fmul <2 x double> %136, <double 7.000000e-01, double 7.000000e-01>
  %139 = fsub <2 x double> %wide.load, %137
  %140 = fsub <2 x double> %wide.load72, %138
  %141 = bitcast double* %110 to <2 x double>*
  store <2 x double> %139, <2 x double>* %141, align 8, !alias.scope !20, !noalias !23
  %142 = bitcast double* %112 to <2 x double>*
  store <2 x double> %140, <2 x double>* %142, align 8, !alias.scope !20, !noalias !23
  %index.next = add i64 %index, 4
  %143 = icmp eq i64 %index.next, %n.vec
  br i1 %143, label %middle.block, label %vector.body, !llvm.loop !28

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond73.for.inc110_crit_edge.us, label %for.body76.us.preheader

for.body76.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond73.preheader.us
  %indvars.iv43.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond73.preheader.us ], [ %n.vec, %middle.block ]
  br label %for.body76.us

for.body76.us:                                    ; preds = %for.body76.us.preheader, %for.body76.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %for.body76.us ], [ %indvars.iv43.ph, %for.body76.us.preheader ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv47, i64 %indvars.iv43
  %144 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv47, i64 %indvars.iv.next44
  %145 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv47, i64 %indvars.iv43
  %146 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %145, %146
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv.next48, i64 %indvars.iv43
  %147 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %147
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv47, i64 %indvars.iv43
  %148 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %148
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %144, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %for.cond73.for.inc110_crit_edge.us.loopexit, label %for.body76.us, !llvm.loop !29

for.cond73.for.inc110_crit_edge.us.loopexit:      ; preds = %for.body76.us
  br label %for.cond73.for.inc110_crit_edge.us

for.cond73.for.inc110_crit_edge.us:               ; preds = %for.cond73.for.inc110_crit_edge.us.loopexit, %middle.block
  %exitcond50 = icmp eq i64 %indvars.iv.next48, %wide.trip.count49
  br i1 %exitcond50, label %for.inc113.loopexit, label %for.cond73.preheader.us

for.inc113.loopexit:                              ; preds = %for.cond73.for.inc110_crit_edge.us
  br label %for.inc113

for.inc113:                                       ; preds = %for.inc113.loopexit, %for.cond69.preheader
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next52, %wide.trip.count53
  br i1 %exitcond54, label %for.end115.loopexit, label %for.cond1.preheader

for.end115.loopexit:                              ; preds = %for.inc113
  br label %for.end115

for.end115:                                       ; preds = %for.end115.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %nx, i32 %ny, [1200 x double]* nocapture readonly %ex, [1200 x double]* nocapture readonly %ey, [1200 x double]* nocapture readonly %hz) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp18 = icmp sgt i32 %nx, 0
  %cmp315 = icmp sgt i32 %ny, 0
  %or.cond = and i1 %cmp18, %cmp315
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %nx to i64
  %wide.trip.count44 = zext i32 %ny to i64
  %wide.trip.count49 = zext i32 %nx to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv46 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next47, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv46, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv41 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next42, %if.end.us ]
  %5 = add nsw i64 %indvars.iv41, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv46, i64 %indvars.iv41
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next42, %wide.trip.count44
  br i1 %exitcond45, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next47, %wide.trip.count49
  br i1 %exitcond50, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %cmp1713 = icmp sgt i32 %nx, 0
  %cmp2011 = icmp sgt i32 %ny, 0
  %or.cond52 = and i1 %cmp1713, %cmp2011
  br i1 %or.cond52, label %for.cond19.preheader.us.preheader, label %for.end39

for.cond19.preheader.us.preheader:                ; preds = %for.end12
  %14 = sext i32 %nx to i64
  %wide.trip.count33 = zext i32 %ny to i64
  %wide.trip.count38 = zext i32 %nx to i64
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.cond19.for.inc37_crit_edge.us, %for.cond19.preheader.us.preheader
  %indvars.iv35 = phi i64 [ 0, %for.cond19.preheader.us.preheader ], [ %indvars.iv.next36, %for.cond19.for.inc37_crit_edge.us ]
  %15 = mul nsw i64 %indvars.iv35, %14
  br label %for.body21.us

for.body21.us:                                    ; preds = %if.end28.us, %for.cond19.preheader.us
  %indvars.iv30 = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next31, %if.end28.us ]
  %16 = add nsw i64 %indvars.iv30, %15
  %17 = trunc i64 %16 to i32
  %rem24.us = srem i32 %17, 20
  %cmp25.us = icmp eq i32 %rem24.us, 0
  br i1 %cmp25.us, label %if.then26.us, label %if.end28.us

if.then26.us:                                     ; preds = %for.body21.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %if.end28.us

if.end28.us:                                      ; preds = %if.then26.us, %for.body21.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv35, i64 %indvars.iv30
  %20 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next31, %wide.trip.count33
  br i1 %exitcond34, label %for.cond19.for.inc37_crit_edge.us, label %for.body21.us

for.cond19.for.inc37_crit_edge.us:                ; preds = %if.end28.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next36, %wide.trip.count38
  br i1 %exitcond39, label %for.end39.loopexit, label %for.cond19.preheader.us

for.end39.loopexit:                               ; preds = %for.cond19.for.inc37_crit_edge.us
  br label %for.end39

for.end39:                                        ; preds = %for.end39.loopexit, %for.end12
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  %cmp439 = icmp sgt i32 %nx, 0
  %cmp467 = icmp sgt i32 %ny, 0
  %or.cond53 = and i1 %cmp439, %cmp467
  br i1 %or.cond53, label %for.cond45.preheader.us.preheader, label %for.end65

for.cond45.preheader.us.preheader:                ; preds = %for.end39
  %23 = sext i32 %nx to i64
  %wide.trip.count = zext i32 %ny to i64
  %wide.trip.count27 = zext i32 %nx to i64
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.cond45.for.inc63_crit_edge.us, %for.cond45.preheader.us.preheader
  %indvars.iv24 = phi i64 [ 0, %for.cond45.preheader.us.preheader ], [ %indvars.iv.next25, %for.cond45.for.inc63_crit_edge.us ]
  %24 = mul nsw i64 %indvars.iv24, %23
  br label %for.body47.us

for.body47.us:                                    ; preds = %if.end54.us, %for.cond45.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond45.preheader.us ], [ %indvars.iv.next, %if.end54.us ]
  %25 = add nsw i64 %indvars.iv, %24
  %26 = trunc i64 %25 to i32
  %rem50.us = srem i32 %26, 20
  %cmp51.us = icmp eq i32 %rem50.us, 0
  br i1 %cmp51.us, label %if.then52.us, label %if.end54.us

if.then52.us:                                     ; preds = %for.body47.us
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %27) #5
  br label %if.end54.us

if.end54.us:                                      ; preds = %if.then52.us, %for.body47.us
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx58.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv24, i64 %indvars.iv
  %29 = load double, double* %arrayidx58.us, align 8
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %29) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond45.for.inc63_crit_edge.us, label %for.body47.us

for.cond45.for.inc63_crit_edge.us:                ; preds = %if.end54.us
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next25, %wide.trip.count27
  br i1 %exitcond28, label %for.end65.loopexit, label %for.cond45.preheader.us

for.end65.loopexit:                               ; preds = %for.cond45.for.inc63_crit_edge.us
  br label %for.end65

for.end65:                                        ; preds = %for.end65.loopexit, %for.end39
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = !{!21}
!21 = distinct !{!21, !22}
!22 = distinct !{!22, !"LVerDomain"}
!23 = !{!24, !25}
!24 = distinct !{!24, !22}
!25 = distinct !{!25, !22}
!26 = !{!24}
!27 = !{!25}
!28 = distinct !{!28, !10, !11}
!29 = distinct !{!29, !10, !11}
