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
  %1 = bitcast i8* %call2 to [1200 x double]*
  %2 = bitcast i8* %call1 to [1200 x double]*
  %3 = bitcast i8* %call to [1200 x double]*
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %3, [1200 x double]* %2, [1200 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
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

for.body.prol:                                    ; preds = %for.body.prol, %for.body.prol.preheader
  %indvars.iv15.prol = phi i64 [ 0, %for.body.prol.preheader ], [ %indvars.iv.next16.prol, %for.body.prol ]
  %prol.iter = phi i32 [ %xtraiter, %for.body.prol.preheader ], [ %prol.iter.sub, %for.body.prol ]
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
  %div.v.i1.1 = insertelement <2 x double> undef, double %conv11, i32 0
  %div.v.i1.2 = insertelement <2 x double> %div.v.i1.1, double %conv20, i32 1
  br i1 %cmp61, label %for.cond5.preheader.us.preheader, label %for.end41

for.cond5.preheader.us.preheader:                 ; preds = %for.cond5.preheader.lr.ph
  %wide.trip.count = zext i32 %ny to i64
  %wide.trip.count12 = zext i32 %nx to i64
  br label %for.cond5.preheader.us

for.cond5.preheader.us:                           ; preds = %for.cond5.for.inc39_crit_edge.us, %for.cond5.preheader.us.preheader
  %indvars.iv10 = phi i64 [ 0, %for.cond5.preheader.us.preheader ], [ %indvars.iv.next11, %for.cond5.for.inc39_crit_edge.us ]
  %3 = trunc i64 %indvars.iv10 to i32
  %conv9.us = sitofp i32 %3 to double
  %4 = insertelement <2 x double> undef, double %conv9.us, i32 0
  %mul.v.i0.2.us = shufflevector <2 x double> %4, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body8.us

for.body8.us:                                     ; preds = %for.body8.us, %for.cond5.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next, %for.body8.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = trunc i64 %indvars.iv.next to i32
  %conv10.us = sitofp i32 %5 to double
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv10, i64 %indvars.iv
  %6 = add nuw nsw i64 %indvars.iv, 2
  %7 = trunc i64 %6 to i32
  %conv18.us = sitofp i32 %7 to double
  %mul.v.i1.1.us = insertelement <2 x double> undef, double %conv10.us, i32 0
  %mul.v.i1.2.us = insertelement <2 x double> %mul.v.i1.1.us, double %conv18.us, i32 1
  %mul.us = fmul <2 x double> %mul.v.i0.2.us, %mul.v.i1.2.us
  %div.us = fdiv <2 x double> %mul.us, %div.v.i1.2
  %div.v.r1.us = extractelement <2 x double> %div.us, i32 0
  %div.v.r2.us = extractelement <2 x double> %div.us, i32 1
  store double %div.v.r1.us, double* %arrayidx15.us, align 8
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv10, i64 %indvars.iv
  store double %div.v.r2.us, double* %arrayidx25.us, align 8
  %8 = add nuw nsw i64 %indvars.iv, 3
  %9 = trunc i64 %8 to i32
  %conv28.us = sitofp i32 %9 to double
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

for.body:                                         ; preds = %for.body, %for.body.preheader19
  %indvars.iv15 = phi i64 [ %indvars.iv15.unr, %for.body.preheader19 ], [ %indvars.iv.next16.7, %for.body ]
  %10 = trunc i64 %indvars.iv15 to i32
  %conv = sitofp i32 %10 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv15
  store double %conv, double* %arrayidx, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %11 = trunc i64 %indvars.iv.next16 to i32
  %conv.1 = sitofp i32 %11 to double
  %arrayidx.1 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next16
  store double %conv.1, double* %arrayidx.1, align 8
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, 2
  %12 = trunc i64 %indvars.iv.next16.1 to i32
  %conv.2 = sitofp i32 %12 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next16.1
  store double %conv.2, double* %arrayidx.2, align 8
  %indvars.iv.next16.2 = add nsw i64 %indvars.iv15, 3
  %13 = trunc i64 %indvars.iv.next16.2 to i32
  %conv.3 = sitofp i32 %13 to double
  %arrayidx.3 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next16.2
  store double %conv.3, double* %arrayidx.3, align 8
  %indvars.iv.next16.3 = add nsw i64 %indvars.iv15, 4
  %14 = trunc i64 %indvars.iv.next16.3 to i32
  %conv.4 = sitofp i32 %14 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next16.3
  store double %conv.4, double* %arrayidx.4, align 8
  %indvars.iv.next16.4 = add nsw i64 %indvars.iv15, 5
  %15 = trunc i64 %indvars.iv.next16.4 to i32
  %conv.5 = sitofp i32 %15 to double
  %arrayidx.5 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next16.4
  store double %conv.5, double* %arrayidx.5, align 8
  %indvars.iv.next16.5 = add nsw i64 %indvars.iv15, 6
  %16 = trunc i64 %indvars.iv.next16.5 to i32
  %conv.6 = sitofp i32 %16 to double
  %arrayidx.6 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next16.5
  store double %conv.6, double* %arrayidx.6, align 8
  %indvars.iv.next16.6 = add nsw i64 %indvars.iv15, 7
  %17 = trunc i64 %indvars.iv.next16.6 to i32
  %conv.7 = sitofp i32 %17 to double
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
  %cmp16 = icmp sgt i32 %tmax, 0
  br i1 %cmp16, label %for.cond1.preheader.lr.ph, label %for.end115

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub70 = add nsw i32 %nx, -1
  %sub74 = add nsw i32 %ny, -1
  %xtraiter = and i32 %ny, 7
  %wide.trip.count.7 = zext i32 %ny to i64
  %xtraiter24 = and i32 %ny, 1
  %wide.trip.count30 = zext i32 %nx to i64
  %xtraiter37 = and i32 %sub74, 1
  %wide.trip.count50 = zext i32 %sub70 to i64
  %wide.trip.count46 = zext i32 %sub74 to i64
  %wide.trip.count54 = zext i32 %tmax to i64
  %cmp85.not = icmp slt i32 %nx, 2
  %cmp113.not = icmp slt i32 %ny, 1
  %brmerge = or i1 %cmp85.not, %cmp113.not
  %cmp3810.not = icmp slt i32 %nx, 1
  %cmp418.not = icmp slt i32 %ny, 2
  %brmerge56 = or i1 %cmp3810.not, %cmp418.not
  %brmerge57 = or i1 %cmp85.not, %cmp418.not
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc113, %for.cond1.preheader.lr.ph
  %indvars.iv52 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next53, %for.inc113 ]
  %0 = icmp sgt i32 %ny, 0
  br i1 %0, label %for.body3.lr.ph, label %for.cond7.preheader

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %1 = icmp eq i32 %xtraiter, 0
  br i1 %1, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol, %for.body3.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %for.body3.prol.preheader ], [ %indvars.iv.next.prol, %for.body3.prol ]
  %prol.iter = phi i32 [ %xtraiter, %for.body3.prol.preheader ], [ %prol.iter.sub, %for.body3.prol ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr58 = mul i64 %indvars.iv52, 8
  %sunkaddr59 = add i64 %sunkaddr, %sunkaddr58
  %sunkaddr60 = inttoptr i64 %sunkaddr59 to i64*
  %2 = load i64, i64* %sunkaddr60, align 8
  %arrayidx6.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.prol
  %3 = bitcast double* %arrayidx6.prol to i64*
  store i64 %2, i64* %3, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol, !llvm.loop !3

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next.prol, %for.body3.prol.loopexit.loopexit ]
  %4 = icmp ult i32 %sub74, 7
  br i1 %4, label %for.cond7.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.cond7.preheader.loopexit:                     ; preds = %for.body3
  br label %for.cond7.preheader

for.cond7.preheader:                              ; preds = %for.cond7.preheader.loopexit, %for.body3.prol.loopexit, %for.cond1.preheader
  br i1 %brmerge, label %for.cond37.preheader, label %for.cond10.preheader.us.preheader

for.cond10.preheader.us.preheader:                ; preds = %for.cond7.preheader
  br label %for.cond10.preheader.us

for.cond10.preheader.us:                          ; preds = %for.cond10.for.inc34_crit_edge.us, %for.cond10.preheader.us.preheader
  %indvars.iv27 = phi i64 [ 1, %for.cond10.preheader.us.preheader ], [ %indvars.iv.next28, %for.cond10.for.inc34_crit_edge.us ]
  %5 = icmp eq i32 %xtraiter24, 0
  %6 = add nsw i64 %indvars.iv27, -1
  br i1 %5, label %for.body12.us.prol.loopexit, label %for.body12.us.prol

for.body12.us.prol:                               ; preds = %for.cond10.preheader.us
  %arrayidx16.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv27, i64 0
  %7 = load double, double* %arrayidx16.us.prol, align 8
  %arrayidx20.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv27, i64 0
  %8 = load double, double* %arrayidx20.us.prol, align 8
  %arrayidx24.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %6, i64 0
  %9 = load double, double* %arrayidx24.us.prol, align 8
  %sub25.us.prol = fsub double %8, %9
  %mul.us.prol = fmul double %sub25.us.prol, 5.000000e-01
  %sub26.us.prol = fsub double %7, %mul.us.prol
  store double %sub26.us.prol, double* %arrayidx16.us.prol, align 8
  br label %for.body12.us.prol.loopexit

for.body12.us.prol.loopexit:                      ; preds = %for.cond10.preheader.us, %for.body12.us.prol
  %indvars.iv21.unr.ph = phi i64 [ 1, %for.body12.us.prol ], [ 0, %for.cond10.preheader.us ]
  %10 = icmp eq i32 %sub74, 0
  br i1 %10, label %for.cond10.for.inc34_crit_edge.us, label %for.body12.us.preheader

for.body12.us.preheader:                          ; preds = %for.body12.us.prol.loopexit
  br label %for.body12.us

for.body12.us:                                    ; preds = %for.body12.us, %for.body12.us.preheader
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr.ph, %for.body12.us.preheader ], [ %indvars.iv.next22.1, %for.body12.us ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv27, i64 %indvars.iv21
  %11 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv27, i64 %indvars.iv21
  %12 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %6, i64 %indvars.iv21
  %13 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %12, %13
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %11, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv27, i64 %indvars.iv.next22
  %14 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv27, i64 %indvars.iv.next22
  %15 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %6, i64 %indvars.iv.next22
  %16 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %15, %16
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %14, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next22.1, %wide.trip.count.7
  br i1 %exitcond.1, label %for.cond10.for.inc34_crit_edge.us.loopexit, label %for.body12.us

for.cond10.for.inc34_crit_edge.us.loopexit:       ; preds = %for.body12.us
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us:                ; preds = %for.cond10.for.inc34_crit_edge.us.loopexit, %for.body12.us.prol.loopexit
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next28, %wide.trip.count30
  br i1 %exitcond, label %for.cond37.preheader.loopexit, label %for.cond10.preheader.us

for.body3:                                        ; preds = %for.body3, %for.body3.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body3.preheader ], [ %indvars.iv.next.7, %for.body3 ]
  %sunkaddr61 = ptrtoint double* %_fict_ to i64
  %sunkaddr62 = mul i64 %indvars.iv52, 8
  %sunkaddr63 = add i64 %sunkaddr61, %sunkaddr62
  %sunkaddr64 = inttoptr i64 %sunkaddr63 to i64*
  %17 = load i64, i64* %sunkaddr64, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv
  %18 = bitcast double* %arrayidx6 to i64*
  store i64 %17, i64* %18, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %19 = load i64, i64* %sunkaddr64, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %20 = bitcast double* %arrayidx6.1 to i64*
  store i64 %19, i64* %20, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %21 = load i64, i64* %sunkaddr64, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %22 = bitcast double* %arrayidx6.2 to i64*
  store i64 %21, i64* %22, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %23 = load i64, i64* %sunkaddr64, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %24 = bitcast double* %arrayidx6.3 to i64*
  store i64 %23, i64* %24, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %25 = load i64, i64* %sunkaddr64, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %26 = bitcast double* %arrayidx6.4 to i64*
  store i64 %25, i64* %26, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %27 = load i64, i64* %sunkaddr64, align 8
  %arrayidx6.5 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.4
  %28 = bitcast double* %arrayidx6.5 to i64*
  store i64 %27, i64* %28, align 8
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %29 = load i64, i64* %sunkaddr64, align 8
  %arrayidx6.6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.5
  %30 = bitcast double* %arrayidx6.6 to i64*
  store i64 %29, i64* %30, align 8
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %31 = load i64, i64* %sunkaddr64, align 8
  %arrayidx6.7 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.6
  %32 = bitcast double* %arrayidx6.7 to i64*
  store i64 %31, i64* %32, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, %wide.trip.count.7
  br i1 %exitcond.7, label %for.cond7.preheader.loopexit, label %for.body3

for.cond37.preheader.loopexit:                    ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond37.preheader

for.cond37.preheader:                             ; preds = %for.cond37.preheader.loopexit, %for.cond7.preheader
  br i1 %brmerge56, label %for.cond69.preheader, label %for.cond40.preheader.us.preheader

for.cond40.preheader.us.preheader:                ; preds = %for.cond37.preheader
  br label %for.cond40.preheader.us

for.cond40.preheader.us:                          ; preds = %for.cond40.for.inc66_crit_edge.us, %for.cond40.preheader.us.preheader
  %indvars.iv39 = phi i64 [ 0, %for.cond40.preheader.us.preheader ], [ %indvars.iv.next40, %for.cond40.for.inc66_crit_edge.us ]
  %33 = icmp eq i32 %xtraiter37, 0
  br i1 %33, label %for.body42.us.prol.loopexit, label %for.body42.us.prol

for.body42.us.prol:                               ; preds = %for.cond40.preheader.us
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv39, i64 1
  %34 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv39, i64 1
  %35 = load double, double* %arrayidx50.us.prol, align 8
  %arrayidx55.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv39, i64 0
  %36 = load double, double* %arrayidx55.us.prol, align 8
  %sub56.us.prol = fsub double %35, %36
  %mul57.us.prol = fmul double %sub56.us.prol, 5.000000e-01
  %sub58.us.prol = fsub double %34, %mul57.us.prol
  store double %sub58.us.prol, double* %arrayidx46.us.prol, align 8
  br label %for.body42.us.prol.loopexit

for.body42.us.prol.loopexit:                      ; preds = %for.cond40.preheader.us, %for.body42.us.prol
  %indvars.iv32.unr.ph = phi i64 [ 2, %for.body42.us.prol ], [ 1, %for.cond40.preheader.us ]
  %37 = icmp eq i32 %ny, 2
  br i1 %37, label %for.cond40.for.inc66_crit_edge.us, label %for.body42.us.preheader

for.body42.us.preheader:                          ; preds = %for.body42.us.prol.loopexit
  br label %for.body42.us

for.body42.us:                                    ; preds = %for.body42.us, %for.body42.us.preheader
  %indvars.iv32 = phi i64 [ %indvars.iv32.unr.ph, %for.body42.us.preheader ], [ %indvars.iv.next33.1, %for.body42.us ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv39, i64 %indvars.iv32
  %38 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv39, i64 %indvars.iv32
  %39 = load double, double* %arrayidx50.us, align 8
  %40 = add nsw i64 %indvars.iv32, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv39, i64 %40
  %41 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %39, %41
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %38, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv39, i64 %indvars.iv.next33
  %42 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv39, i64 %indvars.iv.next33
  %43 = load double, double* %arrayidx50.us.1, align 8
  %44 = load double, double* %arrayidx50.us, align 8
  %sub56.us.1 = fsub double %43, %44
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %42, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %indvars.iv.next33.1 = add nsw i64 %indvars.iv32, 2
  %exitcond36.1 = icmp eq i64 %indvars.iv.next33.1, %wide.trip.count.7
  br i1 %exitcond36.1, label %for.cond40.for.inc66_crit_edge.us.loopexit, label %for.body42.us

for.cond40.for.inc66_crit_edge.us.loopexit:       ; preds = %for.body42.us
  br label %for.cond40.for.inc66_crit_edge.us

for.cond40.for.inc66_crit_edge.us:                ; preds = %for.cond40.for.inc66_crit_edge.us.loopexit, %for.body42.us.prol.loopexit
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count30
  br i1 %exitcond42, label %for.cond69.preheader.loopexit, label %for.cond40.preheader.us

for.cond69.preheader.loopexit:                    ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond69.preheader

for.cond69.preheader:                             ; preds = %for.cond69.preheader.loopexit, %for.cond37.preheader
  br i1 %brmerge57, label %for.inc113, label %for.cond73.preheader.us.preheader

for.cond73.preheader.us.preheader:                ; preds = %for.cond69.preheader
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.for.inc110_crit_edge.us, %for.cond73.preheader.us.preheader
  %indvars.iv48 = phi i64 [ 0, %for.cond73.preheader.us.preheader ], [ %indvars.iv.next49, %for.cond73.for.inc110_crit_edge.us ]
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  br label %for.body76.us

for.body76.us:                                    ; preds = %for.body76.us, %for.cond73.preheader.us
  %indvars.iv44 = phi i64 [ 0, %for.cond73.preheader.us ], [ %indvars.iv.next45, %for.body76.us ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv48, i64 %indvars.iv44
  %45 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv48, i64 %indvars.iv.next45
  %46 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv48, i64 %indvars.iv44
  %47 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %46, %47
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv.next49, i64 %indvars.iv44
  %48 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %48
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv48, i64 %indvars.iv44
  %49 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %49
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %45, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %exitcond47 = icmp eq i64 %indvars.iv.next45, %wide.trip.count46
  br i1 %exitcond47, label %for.cond73.for.inc110_crit_edge.us, label %for.body76.us

for.cond73.for.inc110_crit_edge.us:               ; preds = %for.body76.us
  %exitcond51 = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond51, label %for.inc113.loopexit, label %for.cond73.preheader.us

for.inc113.loopexit:                              ; preds = %for.cond73.for.inc110_crit_edge.us
  br label %for.inc113

for.inc113:                                       ; preds = %for.inc113.loopexit, %for.cond69.preheader
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %for.end115.loopexit, label %for.cond1.preheader

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp19 = icmp sgt i32 %nx, 0
  %cmp317 = icmp sgt i32 %ny, 0
  %or.cond = and i1 %cmp19, %cmp317
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12.for.end39_crit_edge.critedge

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %nx to i64
  %wide.trip.count46 = zext i32 %ny to i64
  %wide.trip.count51 = zext i32 %nx to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv48 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next49, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv48, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv43 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next44, %if.end.us ]
  %5 = add nsw i64 %indvars.iv43, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv48, i64 %indvars.iv43
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next44, %wide.trip.count46
  br i1 %exitcond47, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next49, %wide.trip.count51
  br i1 %exitcond52, label %for.cond19.preheader.us.preheader, label %for.cond2.preheader.us

for.end12.for.end39_crit_edge.critedge:           ; preds = %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13.c = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15.c = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %for.end39

for.cond19.preheader.us.preheader:                ; preds = %for.cond2.for.inc10_crit_edge.us
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %15) #5
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.cond19.for.inc37_crit_edge.us, %for.cond19.preheader.us.preheader
  %indvars.iv37 = phi i64 [ 0, %for.cond19.preheader.us.preheader ], [ %indvars.iv.next38, %for.cond19.for.inc37_crit_edge.us ]
  %18 = mul nsw i64 %indvars.iv37, %3
  br label %for.body21.us

for.body21.us:                                    ; preds = %if.end28.us, %for.cond19.preheader.us
  %indvars.iv32 = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next33, %if.end28.us ]
  %19 = add nsw i64 %indvars.iv32, %18
  %20 = trunc i64 %19 to i32
  %rem24.us = srem i32 %20, 20
  %cmp25.us = icmp eq i32 %rem24.us, 0
  br i1 %cmp25.us, label %if.then26.us, label %if.end28.us

if.then26.us:                                     ; preds = %for.body21.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %21) #5
  br label %if.end28.us

if.end28.us:                                      ; preds = %for.body21.us, %if.then26.us
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv37, i64 %indvars.iv32
  %23 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #5
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next33, %wide.trip.count46
  br i1 %exitcond36, label %for.cond19.for.inc37_crit_edge.us, label %for.body21.us

for.cond19.for.inc37_crit_edge.us:                ; preds = %if.end28.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next38, %wide.trip.count51
  br i1 %exitcond41, label %for.end39.loopexit, label %for.cond19.preheader.us

for.end39.loopexit:                               ; preds = %for.cond19.for.inc37_crit_edge.us
  br label %for.end39

for.end39:                                        ; preds = %for.end39.loopexit, %for.end12.for.end39_crit_edge.critedge
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br i1 %or.cond, label %for.cond45.preheader.us.preheader, label %for.end65

for.cond45.preheader.us.preheader:                ; preds = %for.end39
  %26 = sext i32 %nx to i64
  %wide.trip.count = zext i32 %ny to i64
  %wide.trip.count29 = zext i32 %nx to i64
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.cond45.for.inc63_crit_edge.us, %for.cond45.preheader.us.preheader
  %indvars.iv26 = phi i64 [ 0, %for.cond45.preheader.us.preheader ], [ %indvars.iv.next27, %for.cond45.for.inc63_crit_edge.us ]
  %27 = mul nsw i64 %indvars.iv26, %26
  br label %for.body47.us

for.body47.us:                                    ; preds = %if.end54.us, %for.cond45.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond45.preheader.us ], [ %indvars.iv.next, %if.end54.us ]
  %28 = add nsw i64 %indvars.iv, %27
  %29 = trunc i64 %28 to i32
  %rem50.us = srem i32 %29, 20
  %cmp51.us = icmp eq i32 %rem50.us, 0
  br i1 %cmp51.us, label %if.then52.us, label %if.end54.us

if.then52.us:                                     ; preds = %for.body47.us
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #5
  br label %if.end54.us

if.end54.us:                                      ; preds = %for.body47.us, %if.then52.us
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx58.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv26, i64 %indvars.iv
  %32 = load double, double* %arrayidx58.us, align 8
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %32) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond45.for.inc63_crit_edge.us, label %for.body47.us

for.cond45.for.inc63_crit_edge.us:                ; preds = %if.end54.us
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next27, %wide.trip.count29
  br i1 %exitcond30, label %for.end65.loopexit, label %for.cond45.preheader.us

for.end65.loopexit:                               ; preds = %for.cond45.for.inc63_crit_edge.us
  br label %for.end65

for.end65:                                        ; preds = %for.end65.loopexit, %for.end39
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
