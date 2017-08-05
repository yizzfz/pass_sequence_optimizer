; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay12 = bitcast i8* %call to [1200 x double]*
  %arraydecay313 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay414 = bitcast i8* %call2 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay12, [1000 x double]* %arraydecay313, [1200 x double]* %arraydecay414)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call void @kernel_symm(i32 1000, i32 1200, double %0, double %1, [1200 x double]* %arraydecay12, [1000 x double]* %arraydecay313, [1200 x double]* %arraydecay414)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = bitcast i8* %call to [1200 x double]*
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc16_crit_edge.us, %entry
  %i.040.us = phi i32 [ 0, %entry ], [ %inc17.us, %for.cond1.for.inc16_crit_edge.us ]
  %idxprom.us = sext i32 %i.040.us to i64
  %add7.us = add nsw i32 %i.040.us, 1200
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv61 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next62, %for.body3.us ]
  %0 = add nuw nsw i64 %indvars.iv61, %idxprom.us
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %idxprom.us, i64 %indvars.iv61
  store double %div.us, double* %arrayidx6.us, align 8
  %2 = trunc i64 %indvars.iv61 to i32
  %sub.us = sub i32 %add7.us, %2
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %idxprom.us, i64 %indvars.iv61
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, 1200
  br i1 %exitcond64, label %for.cond1.for.inc16_crit_edge.us, label %for.body3.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.body3.us
  %inc17.us = add nsw i32 %i.040.us, 1
  %cmp.us = icmp slt i32 %inc17.us, 1000
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond1.for.inc16_crit_edge.us.for.body26.lr.ph_crit_edge

for.cond1.for.inc16_crit_edge.us.for.body26.lr.ph_crit_edge: ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.body26.lr.ph

for.cond19.loopexit.loopexit:                     ; preds = %for.body43
  br label %for.cond19.loopexit

for.cond19.loopexit:                              ; preds = %for.cond19.loopexit.loopexit, %for.body43.prol.loopexit, %for.end38
  %exitcond = icmp eq i64 %indvars.iv.next59, 1000
  br i1 %exitcond, label %for.end53, label %for.cond19.loopexit.for.body26.lr.ph_crit_edge

for.cond19.loopexit.for.body26.lr.ph_crit_edge:   ; preds = %for.cond19.loopexit
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  br label %for.body26.lr.ph

for.body26.lr.ph:                                 ; preds = %for.cond1.for.inc16_crit_edge.us.for.body26.lr.ph_crit_edge, %for.cond19.loopexit.for.body26.lr.ph_crit_edge
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.cond19.loopexit.for.body26.lr.ph_crit_edge ], [ 0, %for.cond1.for.inc16_crit_edge.us.for.body26.lr.ph_crit_edge ]
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %for.cond19.loopexit.for.body26.lr.ph_crit_edge ], [ 1, %for.cond1.for.inc16_crit_edge.us.for.body26.lr.ph_crit_edge ]
  %3 = sub nsw i64 0, %indvars.iv58
  %4 = trunc i64 %3 to i32
  %5 = add i32 %4, 7
  %6 = add i32 %4, 998
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %xtraiter66 = and i64 %indvars.iv.next59, 1
  %lcmp.mod = icmp eq i64 %xtraiter66, 0
  br i1 %lcmp.mod, label %for.body26.prol.loopexit.unr-lcssa, label %for.body26.prol.preheader

for.body26.prol.preheader:                        ; preds = %for.body26.lr.ph
  %7 = trunc i64 %indvars.iv58 to i32
  %rem28.prol = srem i32 %7, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit.unr-lcssa

for.body26.prol.loopexit.unr-lcssa:               ; preds = %for.body26.lr.ph, %for.body26.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body26.prol.preheader ], [ 0, %for.body26.lr.ph ]
  %8 = icmp eq i64 %indvars.iv58, 0
  br i1 %8, label %for.end38, label %for.body26.prol.loopexit.unr-lcssa.for.body26_crit_edge

for.body26.prol.loopexit.unr-lcssa.for.body26_crit_edge: ; preds = %for.body26.prol.loopexit.unr-lcssa
  br label %for.body26

for.body26:                                       ; preds = %for.body26, %for.body26.prol.loopexit.unr-lcssa.for.body26_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body26.prol.loopexit.unr-lcssa.for.body26_crit_edge ], [ %indvars.iv.next.1, %for.body26 ]
  %9 = add nuw nsw i64 %indvars.iv, %indvars.iv58
  %10 = trunc i64 %9 to i32
  %rem28 = srem i32 %10, 100
  %conv29 = sitofp i32 %rem28 to double
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %11 = add nuw nsw i64 %indvars.iv.next, %indvars.iv58
  %12 = trunc i64 %11 to i32
  %rem28.1 = srem i32 %12, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.v.i0.1 = insertelement <2 x double> undef, double %conv29, i32 0
  %div31.v.i0.2 = insertelement <2 x double> %div31.v.i0.1, double %conv29.1, i32 1
  %div31 = fdiv <2 x double> %div31.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %13 = bitcast double* %arrayidx35 to <2 x double>*
  store <2 x double> %div31, <2 x double>* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv56
  br i1 %exitcond.1, label %for.end38.loopexit, label %for.body26

for.end38.loopexit:                               ; preds = %for.body26
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.body26.prol.loopexit.unr-lcssa
  %cmp4132 = icmp slt i64 %indvars.iv.next59, 1000
  br i1 %cmp4132, label %for.body43.lr.ph, label %for.cond19.loopexit

for.body43.lr.ph:                                 ; preds = %for.end38
  %xtraiter52 = and i32 %5, 7
  %lcmp.mod53 = icmp eq i32 %xtraiter52, 0
  br i1 %lcmp.mod53, label %for.body43.prol.loopexit, label %for.body43.lr.ph.for.body43.prol_crit_edge

for.body43.lr.ph.for.body43.prol_crit_edge:       ; preds = %for.body43.lr.ph
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol, %for.body43.lr.ph.for.body43.prol_crit_edge
  %indvars.iv49.prol = phi i64 [ %indvars.iv56, %for.body43.lr.ph.for.body43.prol_crit_edge ], [ %indvars.iv.next50.prol, %for.body43.prol ]
  %prol.iter = phi i32 [ %xtraiter52, %for.body43.lr.ph.for.body43.prol_crit_edge ], [ %prol.iter.sub, %for.body43.prol ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv49.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next50.prol = add nuw nsw i64 %indvars.iv49.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol, !llvm.loop !1

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol.loopexit.loopexit, %for.body43.lr.ph
  %indvars.iv49.unr = phi i64 [ %indvars.iv56, %for.body43.lr.ph ], [ %indvars.iv.next50.prol, %for.body43.prol.loopexit.loopexit ]
  %14 = icmp ult i32 %6, 7
  br i1 %14, label %for.cond19.loopexit, label %for.body43.prol.loopexit.for.body43_crit_edge

for.body43.prol.loopexit.for.body43_crit_edge:    ; preds = %for.body43.prol.loopexit
  br label %for.body43

for.body43:                                       ; preds = %for.body43, %for.body43.prol.loopexit.for.body43_crit_edge
  %indvars.iv49 = phi i64 [ %indvars.iv49.unr, %for.body43.prol.loopexit.for.body43_crit_edge ], [ %indvars.iv.next50.7, %for.body43 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv49
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next50
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next50.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next50.2 = add nsw i64 %indvars.iv49, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next50.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next50.3 = add nsw i64 %indvars.iv49, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next50.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next50.4 = add nsw i64 %indvars.iv49, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next50.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next50.5 = add nsw i64 %indvars.iv49, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next50.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next50.6 = add nsw i64 %indvars.iv49, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next50.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next50.7 = add nsw i64 %indvars.iv49, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next50.7, 1000
  br i1 %exitcond.7, label %for.cond19.loopexit.loopexit, label %for.body43

for.end53:                                        ; preds = %for.cond19.loopexit
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #2 {
entry:
  %mul44.us57 = fmul double %alpha, 0.000000e+00
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc53_crit_edge.us, %entry
  %i.040.us = phi i32 [ 0, %entry ], [ %inc54.us, %for.cond1.for.inc53_crit_edge.us ]
  %cmp532.us = icmp sgt i32 %i.040.us, 0
  %idxprom.us = sext i32 %i.040.us to i64
  br i1 %cmp532.us, label %for.cond4.preheader.us.us.preheader, label %for.cond4.preheader.us43.preheader

for.cond4.preheader.us43.preheader:               ; preds = %for.cond1.preheader.us
  %arrayidx41.us54 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %idxprom.us, i64 %idxprom.us
  br label %for.cond4.preheader.us43

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  %wide.trip.count89 = zext i32 %i.040.us to i64
  %arrayidx41.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %idxprom.us, i64 %idxprom.us
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us43:                         ; preds = %for.cond4.preheader.us43, %for.cond4.preheader.us43.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader.us43.preheader ], [ %indvars.iv.next, %for.cond4.preheader.us43 ]
  %arrayidx31.us50 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %idxprom.us, i64 %indvars.iv
  %0 = load double, double* %arrayidx31.us50, align 8
  %mul32.us51 = fmul double %0, %beta
  %arrayidx36.us52 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %idxprom.us, i64 %indvars.iv
  %1 = load double, double* %arrayidx36.us52, align 8
  %mul37.us53 = fmul double %1, %alpha
  %2 = load double, double* %arrayidx41.us54, align 8
  %mul42.us55 = fmul double %mul37.us53, %2
  %add43.us56 = fadd double %mul32.us51, %mul42.us55
  %add45.us58 = fadd double %mul44.us57, %add43.us56
  store double %add45.us58, double* %arrayidx31.us50, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond1.for.inc53_crit_edge.us.loopexit95, label %for.cond4.preheader.us43

for.cond1.for.inc53_crit_edge.us.loopexit:        ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit95:      ; preds = %for.cond4.preheader.us43
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us:                 ; preds = %for.cond1.for.inc53_crit_edge.us.loopexit95, %for.cond1.for.inc53_crit_edge.us.loopexit
  %inc54.us = add nsw i32 %i.040.us, 1
  %cmp.us = icmp slt i32 %inc54.us, 1000
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.end55

for.cond4.preheader.us.us:                        ; preds = %for.cond4.for.end_crit_edge.us.us, %for.cond4.preheader.us.us.preheader
  %j.038.us.us = phi i32 [ 0, %for.cond4.preheader.us.us.preheader ], [ %inc51.us.us, %for.cond4.for.end_crit_edge.us.us ]
  %idxprom7.us.us = sext i32 %j.038.us.us to i64
  %arrayidx8.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %idxprom.us, i64 %idxprom7.us.us
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.body6.us.us
  %arrayidx31.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %idxprom.us, i64 %idxprom7.us.us
  %3 = load double, double* %arrayidx31.us.us, align 8
  %mul32.us.us = fmul double %3, %beta
  %4 = load double, double* %arrayidx8.us.us, align 8
  %mul37.us.us = fmul double %4, %alpha
  %5 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us.us = fmul double %mul37.us.us, %5
  %add43.us.us = fadd double %mul32.us.us, %mul42.us.us
  %mul44.us.us = fmul double %add27.us.us, %alpha
  %add45.us.us = fadd double %mul44.us.us, %add43.us.us
  store double %add45.us.us, double* %arrayidx31.us.us, align 8
  %inc51.us.us = add nsw i32 %j.038.us.us, 1
  %cmp2.us.us = icmp slt i32 %inc51.us.us, 1200
  br i1 %cmp2.us.us, label %for.cond4.preheader.us.us, label %for.cond1.for.inc53_crit_edge.us.loopexit

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.cond4.preheader.us.us
  %indvars.iv87 = phi i64 [ 0, %for.cond4.preheader.us.us ], [ %indvars.iv.next88, %for.body6.us.us ]
  %temp2.034.us.us = phi double [ 0.000000e+00, %for.cond4.preheader.us.us ], [ %add27.us.us, %for.body6.us.us ]
  %6 = load double, double* %arrayidx8.us.us, align 8
  %mul.us.us = fmul double %6, %alpha
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %idxprom.us, i64 %indvars.iv87
  %7 = load double, double* %arrayidx12.us.us, align 8
  %mul13.us.us = fmul double %mul.us.us, %7
  %arrayidx17.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv87, i64 %idxprom7.us.us
  %8 = load double, double* %arrayidx17.us.us, align 8
  %add.us.us = fadd double %8, %mul13.us.us
  store double %add.us.us, double* %arrayidx17.us.us, align 8
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv87, i64 %idxprom7.us.us
  %9 = load double, double* %arrayidx21.us.us, align 8
  %10 = load double, double* %arrayidx12.us.us, align 8
  %mul26.us.us = fmul double %9, %10
  %add27.us.us = fadd double %temp2.034.us.us, %mul26.us.us
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond90 = icmp eq i64 %indvars.iv.next88, %wide.trip.count89
  br i1 %exitcond90, label %for.cond4.for.end_crit_edge.us.us, label %for.body6.us.us

for.end55:                                        ; preds = %for.cond1.for.inc53_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %m, i32 %n, [1200 x double]* %C) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %i.010.us = phi i32 [ 0, %entry ], [ %inc11.us, %for.cond2.for.inc10_crit_edge.us ]
  %mul.us = mul nsw i32 %i.010.us, 1000
  %idxprom.us = sext i32 %i.010.us to i64
  %3 = zext i32 %mul.us to i64
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %idxprom.us, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %inc11.us = add nsw i32 %i.010.us, 1
  %cmp.us = icmp slt i32 %inc11.us, 1000
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
