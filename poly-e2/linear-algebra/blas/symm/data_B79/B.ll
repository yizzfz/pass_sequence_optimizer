; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_symm(i32 1000, i32 1200, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp10 = icmp sgt i32 %m, 0
  br i1 %cmp10, label %for.cond1.preheader.lr.ph, label %for.end53

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp28 = icmp sgt i32 %n, 0
  %conv4 = sitofp i32 %m to double
  br i1 %cmp28, label %for.cond1.preheader.us.preheader, label %for.cond23.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = zext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count38 = zext i32 %m to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc16_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv35 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next36, %for.cond1.for.inc16_crit_edge.us ]
  %1 = add i64 %indvars.iv35, %0
  %2 = trunc i64 %1 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv31 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next32, %for.body3.us ]
  %3 = add nuw nsw i64 %indvars.iv31, %indvars.iv35
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv35, i64 %indvars.iv31
  store double %div.us, double* %arrayidx6.us, align 8
  %5 = trunc i64 %indvars.iv31 to i32
  %sub.us = sub i32 %2, %5
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, %conv4
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv35, i64 %indvars.iv31
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count
  br i1 %exitcond34, label %for.cond1.for.inc16_crit_edge.us, label %for.body3.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next36, %wide.trip.count38
  br i1 %exitcond39, label %for.cond19.preheader, label %for.cond1.preheader.us

for.cond19.preheader:                             ; preds = %for.cond1.for.inc16_crit_edge.us
  %cmp206 = icmp sgt i32 %m, 0
  br i1 %cmp206, label %for.cond23.preheader.lr.ph, label %for.end53

for.cond23.preheader.lr.ph:                       ; preds = %for.cond1.preheader.lr.ph, %for.cond19.preheader
  %conv30 = sitofp i32 %m to double
  %6 = add i32 %m, 7
  %7 = add i32 %m, -2
  %8 = sext i32 %m to i64
  %wide.trip.count21.7 = zext i32 %m to i64
  %wide.trip.count30 = zext i32 %m to i64
  %9 = add nsw i64 %wide.trip.count21.7, -8
  br label %for.body26.lr.ph

for.body26.lr.ph:                                 ; preds = %for.cond23.preheader.lr.ph, %for.inc51
  %indvars.iv28 = phi i64 [ 0, %for.cond23.preheader.lr.ph ], [ %indvars.iv.next29, %for.inc51 ]
  %indvars.iv26 = phi i64 [ 1, %for.cond23.preheader.lr.ph ], [ %indvars.iv.next27, %for.inc51 ]
  %10 = sub nsw i64 0, %indvars.iv28
  %11 = trunc i64 %10 to i32
  %12 = add i32 %6, %11
  %13 = trunc i64 %10 to i32
  %14 = add i32 %7, %13
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %xtraiter41 = and i64 %indvars.iv.next29, 1
  %lcmp.mod = icmp eq i64 %xtraiter41, 0
  br i1 %lcmp.mod, label %for.body26.prol.loopexit, label %for.body26.prol

for.body26.prol:                                  ; preds = %for.body26.lr.ph
  %15 = trunc i64 %indvars.iv28 to i32
  %rem28.prol = srem i32 %15, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, %conv30
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit

for.body26.prol.loopexit:                         ; preds = %for.body26.prol, %for.body26.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body26.prol ], [ 0, %for.body26.lr.ph ]
  %16 = icmp eq i64 %indvars.iv28, 0
  br i1 %16, label %for.cond40.preheader, label %for.body26.preheader

for.body26.preheader:                             ; preds = %for.body26.prol.loopexit
  br label %for.body26

for.cond40.preheader.loopexit:                    ; preds = %for.body26
  br label %for.cond40.preheader

for.cond40.preheader:                             ; preds = %for.cond40.preheader.loopexit, %for.body26.prol.loopexit
  %cmp414 = icmp slt i64 %indvars.iv.next29, %8
  br i1 %cmp414, label %for.body43.lr.ph, label %for.inc51

for.body43.lr.ph:                                 ; preds = %for.cond40.preheader
  %xtraiter22 = and i32 %12, 7
  %lcmp.mod23 = icmp eq i32 %xtraiter22, 0
  br i1 %lcmp.mod23, label %for.body43.prol.loopexit, label %for.body43.prol.preheader

for.body43.prol.preheader:                        ; preds = %for.body43.lr.ph
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol.preheader, %for.body43.prol
  %indvars.iv19.prol = phi i64 [ %indvars.iv.next20.prol, %for.body43.prol ], [ %indvars.iv26, %for.body43.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body43.prol ], [ %xtraiter22, %for.body43.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv19.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next20.prol = add nuw nsw i64 %indvars.iv19.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol, !llvm.loop !1

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol.loopexit.loopexit, %for.body43.lr.ph
  %indvars.iv19.unr = phi i64 [ %indvars.iv26, %for.body43.lr.ph ], [ %indvars.iv.next20.prol, %for.body43.prol.loopexit.loopexit ]
  %17 = icmp ult i32 %14, 7
  br i1 %17, label %for.inc51, label %for.body43.preheader

for.body43.preheader:                             ; preds = %for.body43.prol.loopexit
  %18 = sub i64 %9, %indvars.iv19.unr
  %19 = lshr i64 %18, 3
  %20 = add nuw nsw i64 %19, 1
  %min.iters.check = icmp ult i64 %20, 2
  br i1 %min.iters.check, label %for.body43.preheader45, label %min.iters.checked

for.body43.preheader45:                           ; preds = %middle.block, %min.iters.checked, %for.body43.preheader
  %indvars.iv19.ph = phi i64 [ %indvars.iv19.unr, %min.iters.checked ], [ %indvars.iv19.unr, %for.body43.preheader ], [ %ind.end, %middle.block ]
  br label %for.body43

min.iters.checked:                                ; preds = %for.body43.preheader
  %n.mod.vf = and i64 %20, 1
  %n.vec = sub nsw i64 %20, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %21 = add i64 %indvars.iv19.unr, 8
  %22 = shl nuw i64 %19, 3
  %23 = add i64 %21, %22
  %24 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %23, %24
  br i1 %cmp.zero, label %for.body43.preheader45, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %25 = shl i64 %index, 3
  %26 = add i64 %indvars.iv19.unr, %25
  %27 = add nsw i64 %26, 7
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %27
  %29 = getelementptr double, double* %28, i64 -7
  %30 = bitcast double* %29 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %30, align 8
  %index.next = add i64 %index, 2
  %31 = icmp eq i64 %index.next, %n.vec
  br i1 %31, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc51, label %for.body43.preheader45

for.body26:                                       ; preds = %for.body26.preheader, %for.body26
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body26 ], [ %indvars.iv.unr.ph, %for.body26.preheader ]
  %32 = add nuw nsw i64 %indvars.iv, %indvars.iv28
  %33 = trunc i64 %32 to i32
  %rem28 = srem i32 %33, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, %conv30
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = add nuw nsw i64 %indvars.iv.next, %indvars.iv28
  %35 = trunc i64 %34 to i32
  %rem28.1 = srem i32 %35, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, %conv30
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv26
  br i1 %exitcond.1, label %for.cond40.preheader.loopexit, label %for.body26

for.body43:                                       ; preds = %for.body43.preheader45, %for.body43
  %indvars.iv19 = phi i64 [ %indvars.iv.next20.7, %for.body43 ], [ %indvars.iv19.ph, %for.body43.preheader45 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv19
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv.next20
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next20.1 = add nsw i64 %indvars.iv19, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv.next20.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next20.2 = add nsw i64 %indvars.iv19, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv.next20.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next20.3 = add nsw i64 %indvars.iv19, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv.next20.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next20.4 = add nsw i64 %indvars.iv19, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv.next20.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next20.5 = add nsw i64 %indvars.iv19, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv.next20.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next20.6 = add nsw i64 %indvars.iv19, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv.next20.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next20.7 = add nsw i64 %indvars.iv19, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next20.7, %wide.trip.count21.7
  br i1 %exitcond.7, label %for.inc51.loopexit, label %for.body43, !llvm.loop !6

for.inc51.loopexit:                               ; preds = %for.body43
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %middle.block, %for.body43.prol.loopexit, %for.cond40.preheader
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next29, %wide.trip.count30
  br i1 %exitcond, label %for.end53.loopexit, label %for.body26.lr.ph

for.end53.loopexit:                               ; preds = %for.inc51
  br label %for.end53

for.end53:                                        ; preds = %for.end53.loopexit, %entry, %for.cond19.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %cmp8 = icmp sgt i32 %m, 0
  %cmp26 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp8, %cmp26
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %for.end55

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %wide.trip.count66 = zext i32 %m to i64
  %wide.trip.count62 = zext i32 %n to i64
  %mul44.us26 = fmul double %alpha, 0.000000e+00
  %wide.trip.count = zext i32 %n to i64
  %0 = add nsw i64 %wide.trip.count62, -1
  %min.iters.check = icmp ult i32 %n, 4
  %1 = and i32 %n, 3
  %n.mod.vf = zext i32 %1 to i64
  %n.vec = sub nsw i64 %wide.trip.count62, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert84 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat85 = shufflevector <2 x double> %broadcast.splatinsert84, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert88 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat89 = shufflevector <2 x double> %broadcast.splatinsert88, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert90 = insertelement <2 x double> undef, double %mul44.us26, i32 0
  %broadcast.splat91 = shufflevector <2 x double> %broadcast.splatinsert90, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i32 %1, 0
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc53_crit_edge.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.cond1.for.inc53_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 0
  %scevgep72 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %wide.trip.count62
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 0
  %scevgep76 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %wide.trip.count62
  %cmp51.us = icmp sgt i64 %indvars.iv64, 0
  %arrayidx41.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv64
  br i1 %cmp51.us, label %for.cond4.preheader.us.us.preheader, label %for.cond4.preheader.us12.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us12.preheader:               ; preds = %for.cond1.preheader.us
  br i1 %min.iters.check, label %for.cond4.preheader.us12.preheader92, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond4.preheader.us12.preheader
  br i1 %cmp.zero, label %for.cond4.preheader.us12.preheader92, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep76
  %bound1 = icmp ult double* %scevgep74, %scevgep72
  %found.conflict = and i1 %bound0, %bound1
  %bound079 = icmp ult double* %scevgep, %arrayidx41.us.us
  %bound180 = icmp ult double* %arrayidx41.us.us, %scevgep72
  %found.conflict81 = and i1 %bound079, %bound180
  %conflict.rdx = or i1 %found.conflict, %found.conflict81
  br i1 %conflict.rdx, label %for.cond4.preheader.us12.preheader92, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %2 = load double, double* %arrayidx41.us.us, align 8, !alias.scope !8
  %3 = insertelement <2 x double> undef, double %2, i32 0
  %4 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  %5 = insertelement <2 x double> undef, double %2, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !11, !noalias !13
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !11, !noalias !13
  %11 = fmul <2 x double> %wide.load, %broadcast.splat85
  %12 = fmul <2 x double> %wide.load83, %broadcast.splat85
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %index
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !15
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !15
  %17 = fmul <2 x double> %wide.load86, %broadcast.splat89
  %18 = fmul <2 x double> %wide.load87, %broadcast.splat89
  %19 = fmul <2 x double> %17, %4
  %20 = fmul <2 x double> %18, %6
  %21 = fadd <2 x double> %11, %19
  %22 = fadd <2 x double> %12, %20
  %23 = fadd <2 x double> %broadcast.splat91, %21
  %24 = fadd <2 x double> %broadcast.splat91, %22
  %25 = bitcast double* %7 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !11, !noalias !13
  %26 = bitcast double* %9 to <2 x double>*
  store <2 x double> %24, <2 x double>* %26, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %27 = icmp eq i64 %index.next, %n.vec
  br i1 %27, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc53_crit_edge.us, label %for.cond4.preheader.us12.preheader92

for.cond4.preheader.us12.preheader92:             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond4.preheader.us12.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond4.preheader.us12.preheader ], [ %n.vec, %middle.block ]
  %28 = sub nsw i64 %wide.trip.count62, %indvars.iv.ph
  %xtraiter = and i64 %28, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.cond4.preheader.us12.prol.loopexit.unr-lcssa, label %for.cond4.preheader.us12.prol.preheader

for.cond4.preheader.us12.prol.preheader:          ; preds = %for.cond4.preheader.us12.preheader92
  br label %for.cond4.preheader.us12.prol

for.cond4.preheader.us12.prol:                    ; preds = %for.cond4.preheader.us12.prol.preheader
  %arrayidx31.us19.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %indvars.iv.ph
  %29 = load double, double* %arrayidx31.us19.prol, align 8
  %mul32.us20.prol = fmul double %29, %beta
  %arrayidx36.us21.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv.ph
  %30 = load double, double* %arrayidx36.us21.prol, align 8
  %mul37.us22.prol = fmul double %30, %alpha
  %31 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us24.prol = fmul double %mul37.us22.prol, %31
  %add43.us25.prol = fadd double %mul32.us20.prol, %mul42.us24.prol
  %add45.us27.prol = fadd double %mul44.us26, %add43.us25.prol
  store double %add45.us27.prol, double* %arrayidx31.us19.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  br label %for.cond4.preheader.us12.prol.loopexit.unr-lcssa

for.cond4.preheader.us12.prol.loopexit.unr-lcssa: ; preds = %for.cond4.preheader.us12.preheader92, %for.cond4.preheader.us12.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.cond4.preheader.us12.prol ], [ %indvars.iv.ph, %for.cond4.preheader.us12.preheader92 ]
  br label %for.cond4.preheader.us12.prol.loopexit

for.cond4.preheader.us12.prol.loopexit:           ; preds = %for.cond4.preheader.us12.prol.loopexit.unr-lcssa
  %32 = icmp eq i64 %0, %indvars.iv.ph
  br i1 %32, label %for.cond1.for.inc53_crit_edge.us.loopexit93, label %for.cond4.preheader.us12.preheader92.new

for.cond4.preheader.us12.preheader92.new:         ; preds = %for.cond4.preheader.us12.prol.loopexit
  br label %for.cond4.preheader.us12

for.cond4.preheader.us12:                         ; preds = %for.cond4.preheader.us12, %for.cond4.preheader.us12.preheader92.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.cond4.preheader.us12.preheader92.new ], [ %indvars.iv.next.1, %for.cond4.preheader.us12 ]
  %arrayidx31.us19 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %indvars.iv
  %33 = load double, double* %arrayidx31.us19, align 8
  %mul32.us20 = fmul double %33, %beta
  %arrayidx36.us21 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv
  %34 = load double, double* %arrayidx36.us21, align 8
  %mul37.us22 = fmul double %34, %alpha
  %35 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us24 = fmul double %mul37.us22, %35
  %add43.us25 = fadd double %mul32.us20, %mul42.us24
  %add45.us27 = fadd double %mul44.us26, %add43.us25
  store double %add45.us27, double* %arrayidx31.us19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx31.us19.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %indvars.iv.next
  %36 = load double, double* %arrayidx31.us19.1, align 8
  %mul32.us20.1 = fmul double %36, %beta
  %arrayidx36.us21.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv.next
  %37 = load double, double* %arrayidx36.us21.1, align 8
  %mul37.us22.1 = fmul double %37, %alpha
  %38 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us24.1 = fmul double %mul37.us22.1, %38
  %add43.us25.1 = fadd double %mul32.us20.1, %mul42.us24.1
  %add45.us27.1 = fadd double %mul44.us26, %add43.us25.1
  store double %add45.us27.1, double* %arrayidx31.us19.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %for.cond1.for.inc53_crit_edge.us.loopexit93.unr-lcssa, label %for.cond4.preheader.us12, !llvm.loop !17

for.cond1.for.inc53_crit_edge.us.loopexit:        ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit93.unr-lcssa: ; preds = %for.cond4.preheader.us12
  br label %for.cond1.for.inc53_crit_edge.us.loopexit93

for.cond1.for.inc53_crit_edge.us.loopexit93:      ; preds = %for.cond4.preheader.us12.prol.loopexit, %for.cond1.for.inc53_crit_edge.us.loopexit93.unr-lcssa
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us:                 ; preds = %for.cond1.for.inc53_crit_edge.us.loopexit93, %for.cond1.for.inc53_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, %wide.trip.count66
  br i1 %exitcond67, label %for.end55.loopexit, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.end_crit_edge.us.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.cond4.for.end_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv60
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.body6.us.us
  %arrayidx31.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %indvars.iv60
  %39 = load double, double* %arrayidx31.us.us, align 8
  %mul32.us.us = fmul double %39, %beta
  %arrayidx36.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv60
  %40 = load double, double* %arrayidx36.us.us, align 8
  %mul37.us.us = fmul double %40, %alpha
  %41 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us.us = fmul double %mul37.us.us, %41
  %add43.us.us = fadd double %mul32.us.us, %mul42.us.us
  %mul44.us.us = fmul double %add27.us.us, %alpha
  %add45.us.us = fadd double %mul44.us.us, %add43.us.us
  store double %add45.us.us, double* %arrayidx31.us.us, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next61, %wide.trip.count62
  br i1 %exitcond63, label %for.cond1.for.inc53_crit_edge.us.loopexit, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.cond4.preheader.us.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.body6.us.us ], [ 0, %for.cond4.preheader.us.us ]
  %temp2.03.us.us = phi double [ %add27.us.us, %for.body6.us.us ], [ 0.000000e+00, %for.cond4.preheader.us.us ]
  %42 = load double, double* %arrayidx8.us.us, align 8
  %mul.us.us = fmul double %42, %alpha
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv54
  %43 = load double, double* %arrayidx12.us.us, align 8
  %mul13.us.us = fmul double %mul.us.us, %43
  %arrayidx17.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv60
  %44 = load double, double* %arrayidx17.us.us, align 8
  %add.us.us = fadd double %44, %mul13.us.us
  store double %add.us.us, double* %arrayidx17.us.us, align 8
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv60
  %45 = load double, double* %arrayidx21.us.us, align 8
  %46 = load double, double* %arrayidx12.us.us, align 8
  %mul26.us.us = fmul double %45, %46
  %add27.us.us = fadd double %temp2.03.us.us, %mul26.us.us
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next55, %indvars.iv64
  br i1 %exitcond59, label %for.cond4.for.end_crit_edge.us.us, label %for.body6.us.us

for.end55.loopexit:                               ; preds = %for.cond1.for.inc53_crit_edge.us
  br label %for.end55

for.end55:                                        ; preds = %for.end55.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp4 = icmp sgt i32 %m, 0
  %cmp31 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp4, %cmp31
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %m to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count11 = zext i32 %m to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv8, %3
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

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv8, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, %wide.trip.count11
  br i1 %exitcond12, label %for.end12.loopexit, label %for.cond2.preheader.us

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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14, !9}
!14 = distinct !{!14, !10}
!15 = !{!14}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
