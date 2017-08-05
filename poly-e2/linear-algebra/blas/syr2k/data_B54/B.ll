; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1000 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond1.preheader.lr.ph, label %for.end43

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp26 = icmp sgt i32 %m, 0
  %conv4 = sitofp i32 %n to double
  %conv11 = sitofp i32 %m to double
  br i1 %cmp26, label %for.cond1.preheader.us.preheader, label %for.cond24.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count23 = zext i32 %m to i64
  %wide.trip.count27 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc17_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv25 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next26, %for.cond1.for.inc17_crit_edge.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv18 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next19, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv18, %indvars.iv25
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, %n
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv18
  store double %div.us, double* %arrayidx6.us, align 8
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, %m
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, %conv11
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv25, i64 %indvars.iv18
  store double %div12.us, double* %arrayidx16.us, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next19, %wide.trip.count23
  br i1 %exitcond24, label %for.cond1.for.inc17_crit_edge.us, label %for.body3.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, %wide.trip.count27
  br i1 %exitcond28, label %for.cond20.preheader, label %for.cond1.preheader.us

for.cond20.preheader:                             ; preds = %for.cond1.for.inc17_crit_edge.us
  %cmp213 = icmp sgt i32 %n, 0
  br i1 %cmp213, label %for.cond24.preheader.lr.ph, label %for.end43

for.cond24.preheader.lr.ph:                       ; preds = %for.cond20.preheader, %for.cond1.preheader.lr.ph
  %conv32 = sitofp i32 %m to double
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count16 = zext i32 %n to i64
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.cond24.for.inc41_crit_edge.us, %for.cond24.preheader.lr.ph
  %indvars.iv14 = phi i64 [ 0, %for.cond24.preheader.lr.ph ], [ %indvars.iv.next15, %for.cond24.for.inc41_crit_edge.us ]
  br label %for.body27.us

for.body27.us:                                    ; preds = %for.body27.us, %for.cond24.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader.us ], [ %indvars.iv.next, %for.body27.us ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv14
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30.us = srem i32 %7, %n
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, %conv32
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond24.for.inc41_crit_edge.us, label %for.body27.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.body27.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %for.end43.loopexit, label %for.cond24.preheader.us

for.end43.loopexit:                               ; preds = %for.cond24.for.inc41_crit_edge.us
  br label %for.end43

for.end43:                                        ; preds = %for.end43.loopexit, %for.cond20.preheader, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond1.preheader.lr.ph, label %for.end45

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp75 = icmp sgt i32 %m, 0
  br i1 %cmp75, label %for.body3.lr.ph.us.preheader, label %for.body3.lr.ph.preheader

for.body3.lr.ph.preheader:                        ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count70 = zext i32 %n to i64
  br label %for.body3.lr.ph

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count49 = zext i32 %m to i64
  %wide.trip.count56 = zext i32 %n to i64
  br label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3.us ], [ %indvars.iv.unr, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv
  %0 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %0, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.next
  %1 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %1, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.next.1
  %2 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %2, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.next.2
  %3 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %3, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv52
  br i1 %exitcond.3, label %for.cond9.preheader.us12.preheader.loopexit, label %for.body3.us

for.cond9.preheader.us12.preheader.loopexit:      ; preds = %for.body3.us
  br label %for.cond9.preheader.us12.preheader

for.cond9.preheader.us12.preheader:               ; preds = %for.cond9.preheader.us12.preheader.loopexit, %for.body3.us.prol.loopexit
  br label %for.cond9.preheader.us12

for.cond9.preheader.us12:                         ; preds = %for.cond9.preheader.us12.preheader, %for.cond9.for.inc40_crit_edge.us35
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.cond9.for.inc40_crit_edge.us35 ], [ 0, %for.cond9.preheader.us12.preheader ]
  %arrayidx20.us33 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv47
  %arrayidx30.us34 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv47
  br label %for.body11.us14

for.body11.us14:                                  ; preds = %for.body11.us14, %for.cond9.preheader.us12
  %indvars.iv42 = phi i64 [ 0, %for.cond9.preheader.us12 ], [ %indvars.iv.next43, %for.body11.us14 ]
  %arrayidx15.us17 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv42, i64 %indvars.iv47
  %4 = load double, double* %arrayidx15.us17, align 8
  %mul16.us18 = fmul double %4, %alpha
  %5 = load double, double* %arrayidx20.us33, align 8
  %mul21.us19 = fmul double %mul16.us18, %5
  %arrayidx25.us20 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv42, i64 %indvars.iv47
  %6 = load double, double* %arrayidx25.us20, align 8
  %mul26.us21 = fmul double %6, %alpha
  %7 = load double, double* %arrayidx30.us34, align 8
  %mul31.us22 = fmul double %mul26.us21, %7
  %add.us23 = fadd double %mul21.us19, %mul31.us22
  %arrayidx35.us24 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv42
  %8 = load double, double* %arrayidx35.us24, align 8
  %add36.us25 = fadd double %8, %add.us23
  store double %add36.us25, double* %arrayidx35.us24, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond = icmp eq i64 %indvars.iv.next43, %indvars.iv52
  br i1 %exitcond, label %for.cond9.for.inc40_crit_edge.us35, label %for.body11.us14

for.body3.lr.ph.us:                               ; preds = %for.cond6.for.inc43_crit_edge.us.for.body3.lr.ph.us_crit_edge, %for.body3.lr.ph.us.preheader
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.cond6.for.inc43_crit_edge.us.for.body3.lr.ph.us_crit_edge ], [ 0, %for.body3.lr.ph.us.preheader ]
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.cond6.for.inc43_crit_edge.us.for.body3.lr.ph.us_crit_edge ], [ 1, %for.body3.lr.ph.us.preheader ]
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %9 = trunc i64 %indvars.iv.next55 to i32
  %xtraiter = and i32 %9, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader, %for.body3.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us.prol ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.prol
  %10 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %10, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit.loopexit, label %for.body3.us.prol, !llvm.loop !1

for.body3.us.prol.loopexit.loopexit:              ; preds = %for.body3.us.prol
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.loopexit, %for.body3.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next.prol, %for.body3.us.prol.loopexit.loopexit ]
  %11 = icmp ult i64 %indvars.iv54, 3
  br i1 %11, label %for.cond9.preheader.us12.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  br label %for.body3.us

for.cond9.for.inc40_crit_edge.us35:               ; preds = %for.body11.us14
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, %wide.trip.count49
  br i1 %exitcond50, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.preheader.us12

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond9.for.inc40_crit_edge.us35
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond57, label %for.end45.loopexit, label %for.cond6.for.inc43_crit_edge.us.for.body3.lr.ph.us_crit_edge

for.cond6.for.inc43_crit_edge.us.for.body3.lr.ph.us_crit_edge: ; preds = %for.cond6.for.inc43_crit_edge.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  br label %for.body3.lr.ph.us

for.body3.lr.ph:                                  ; preds = %for.inc43.for.body3.lr.ph_crit_edge, %for.body3.lr.ph.preheader
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.inc43.for.body3.lr.ph_crit_edge ], [ 0, %for.body3.lr.ph.preheader ]
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.inc43.for.body3.lr.ph_crit_edge ], [ 1, %for.body3.lr.ph.preheader ]
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %12 = trunc i64 %indvars.iv.next69 to i32
  %xtraiter63 = and i32 %12, 3
  %lcmp.mod64 = icmp eq i32 %xtraiter63, 0
  br i1 %lcmp.mod64, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader, %for.body3.prol
  %indvars.iv58.prol = phi i64 [ %indvars.iv.next59.prol, %for.body3.prol ], [ 0, %for.body3.prol.preheader ]
  %prol.iter65 = phi i32 [ %prol.iter65.sub, %for.body3.prol ], [ %xtraiter63, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv58.prol
  %13 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %13, %beta
  store double %mul.prol, double* %arrayidx5.prol, align 8
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter65.sub = add i32 %prol.iter65, -1
  %prol.iter65.cmp = icmp eq i32 %prol.iter65.sub, 0
  br i1 %prol.iter65.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol, !llvm.loop !3

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.lr.ph
  %indvars.iv58.unr = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next59.prol, %for.body3.prol.loopexit.loopexit ]
  %14 = icmp ult i64 %indvars.iv68, 3
  br i1 %14, label %for.inc43, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.3, %for.body3 ], [ %indvars.iv58.unr, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv58
  %15 = load double, double* %arrayidx5, align 8
  %mul = fmul double %15, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv.next59
  %16 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %16, %beta
  store double %mul.1, double* %arrayidx5.1, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv.next59.1
  %17 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %17, %beta
  store double %mul.2, double* %arrayidx5.2, align 8
  %indvars.iv.next59.2 = add nsw i64 %indvars.iv58, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv.next59.2
  %18 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %18, %beta
  store double %mul.3, double* %arrayidx5.3, align 8
  %indvars.iv.next59.3 = add nsw i64 %indvars.iv58, 4
  %exitcond62.3 = icmp eq i64 %indvars.iv.next59.3, %indvars.iv66
  br i1 %exitcond62.3, label %for.inc43.loopexit, label %for.body3

for.inc43.loopexit:                               ; preds = %for.body3
  br label %for.inc43

for.inc43:                                        ; preds = %for.inc43.loopexit, %for.body3.prol.loopexit
  %exitcond71 = icmp eq i64 %indvars.iv.next69, %wide.trip.count70
  br i1 %exitcond71, label %for.end45.loopexit74, label %for.inc43.for.body3.lr.ph_crit_edge

for.inc43.for.body3.lr.ph_crit_edge:              ; preds = %for.inc43
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  br label %for.body3.lr.ph

for.end45.loopexit:                               ; preds = %for.cond6.for.inc43_crit_edge.us
  br label %for.end45

for.end45.loopexit74:                             ; preds = %for.inc43
  br label %for.end45

for.end45:                                        ; preds = %for.end45.loopexit74, %for.end45.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1200 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv7, i64 %indvars.iv
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
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
