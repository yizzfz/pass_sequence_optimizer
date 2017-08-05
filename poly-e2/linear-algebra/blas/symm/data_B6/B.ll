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
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv31 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next32, %for.inc.us ]
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
  br i1 %exitcond34, label %for.cond1.for.inc16_crit_edge.us, label %for.inc.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next36, %wide.trip.count38
  br i1 %exitcond39, label %for.cond19.preheader, label %for.cond1.preheader.us

for.cond19.preheader:                             ; preds = %for.cond1.for.inc16_crit_edge.us
  %cmp205 = icmp sgt i32 %m, 0
  br i1 %cmp205, label %for.cond23.preheader.lr.ph, label %for.end53

for.cond23.preheader.lr.ph:                       ; preds = %for.cond1.preheader.lr.ph, %for.cond19.preheader
  %conv30 = sitofp i32 %m to double
  %6 = add i32 %m, 7
  %7 = add i32 %m, -2
  %8 = sext i32 %m to i64
  %wide.trip.count21.7 = zext i32 %m to i64
  %wide.trip.count30 = zext i32 %m to i64
  %9 = add nsw i64 %wide.trip.count21.7, -8
  br label %for.inc36.lr.ph

for.cond19.loopexit.loopexit:                     ; preds = %for.inc48
  br label %for.cond19.loopexit

for.cond19.loopexit:                              ; preds = %for.cond19.loopexit.loopexit, %middle.block, %for.inc48.prol.loopexit, %for.end38
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next29, %wide.trip.count30
  br i1 %exitcond, label %for.end53.loopexit, label %for.inc36.lr.ph

for.inc36.lr.ph:                                  ; preds = %for.cond23.preheader.lr.ph, %for.cond19.loopexit
  %indvars.iv28 = phi i64 [ 0, %for.cond23.preheader.lr.ph ], [ %indvars.iv.next29, %for.cond19.loopexit ]
  %indvars.iv26 = phi i64 [ 1, %for.cond23.preheader.lr.ph ], [ %indvars.iv.next27, %for.cond19.loopexit ]
  %10 = sub nsw i64 0, %indvars.iv28
  %11 = trunc i64 %10 to i32
  %12 = add i32 %6, %11
  %13 = trunc i64 %10 to i32
  %14 = add i32 %7, %13
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %xtraiter41 = and i64 %indvars.iv.next29, 1
  %lcmp.mod = icmp eq i64 %xtraiter41, 0
  br i1 %lcmp.mod, label %for.inc36.prol.loopexit, label %for.inc36.prol

for.inc36.prol:                                   ; preds = %for.inc36.lr.ph
  %15 = trunc i64 %indvars.iv28 to i32
  %rem28.prol = srem i32 %15, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, %conv30
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.inc36.prol.loopexit

for.inc36.prol.loopexit:                          ; preds = %for.inc36.prol, %for.inc36.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc36.prol ], [ 0, %for.inc36.lr.ph ]
  %16 = icmp eq i64 %indvars.iv28, 0
  br i1 %16, label %for.end38, label %for.inc36.preheader

for.inc36.preheader:                              ; preds = %for.inc36.prol.loopexit
  br label %for.inc36

for.inc36:                                        ; preds = %for.inc36.preheader, %for.inc36
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc36 ], [ %indvars.iv.unr.ph, %for.inc36.preheader ]
  %17 = add nuw nsw i64 %indvars.iv, %indvars.iv28
  %18 = trunc i64 %17 to i32
  %rem28 = srem i32 %18, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, %conv30
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %19 = add nuw nsw i64 %indvars.iv.next, %indvars.iv28
  %20 = trunc i64 %19 to i32
  %rem28.1 = srem i32 %20, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, %conv30
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv26
  br i1 %exitcond.1, label %for.end38.loopexit, label %for.inc36

for.end38.loopexit:                               ; preds = %for.inc36
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.inc36.prol.loopexit
  %cmp413 = icmp slt i64 %indvars.iv.next29, %8
  br i1 %cmp413, label %for.inc48.lr.ph, label %for.cond19.loopexit

for.inc48.lr.ph:                                  ; preds = %for.end38
  %xtraiter22 = and i32 %12, 7
  %lcmp.mod23 = icmp eq i32 %xtraiter22, 0
  br i1 %lcmp.mod23, label %for.inc48.prol.loopexit, label %for.inc48.prol.preheader

for.inc48.prol.preheader:                         ; preds = %for.inc48.lr.ph
  br label %for.inc48.prol

for.inc48.prol:                                   ; preds = %for.inc48.prol.preheader, %for.inc48.prol
  %indvars.iv19.prol = phi i64 [ %indvars.iv.next20.prol, %for.inc48.prol ], [ %indvars.iv26, %for.inc48.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc48.prol ], [ %xtraiter22, %for.inc48.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv19.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next20.prol = add nuw nsw i64 %indvars.iv19.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc48.prol.loopexit.loopexit, label %for.inc48.prol, !llvm.loop !1

for.inc48.prol.loopexit.loopexit:                 ; preds = %for.inc48.prol
  br label %for.inc48.prol.loopexit

for.inc48.prol.loopexit:                          ; preds = %for.inc48.prol.loopexit.loopexit, %for.inc48.lr.ph
  %indvars.iv19.unr = phi i64 [ %indvars.iv26, %for.inc48.lr.ph ], [ %indvars.iv.next20.prol, %for.inc48.prol.loopexit.loopexit ]
  %21 = icmp ult i32 %14, 7
  br i1 %21, label %for.cond19.loopexit, label %for.inc48.preheader

for.inc48.preheader:                              ; preds = %for.inc48.prol.loopexit
  %22 = sub i64 %9, %indvars.iv19.unr
  %23 = lshr i64 %22, 3
  %24 = add nuw nsw i64 %23, 1
  %min.iters.check = icmp ult i64 %24, 2
  br i1 %min.iters.check, label %for.inc48.preheader45, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc48.preheader
  %n.mod.vf = and i64 %24, 1
  %n.vec = sub nsw i64 %24, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %25 = add i64 %indvars.iv19.unr, 8
  %26 = shl nuw i64 %23, 3
  %27 = add i64 %25, %26
  %28 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %27, %28
  br i1 %cmp.zero, label %for.inc48.preheader45, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %29 = shl i64 %index, 3
  %30 = add i64 %indvars.iv19.unr, %29
  %31 = add nsw i64 %30, 7
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %31
  %33 = getelementptr double, double* %32, i64 -7
  %34 = bitcast double* %33 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %34, align 8
  %index.next = add i64 %index, 2
  %35 = icmp eq i64 %index.next, %n.vec
  br i1 %35, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond19.loopexit, label %for.inc48.preheader45

for.inc48.preheader45:                            ; preds = %middle.block, %min.iters.checked, %for.inc48.preheader
  %indvars.iv19.ph = phi i64 [ %indvars.iv19.unr, %min.iters.checked ], [ %indvars.iv19.unr, %for.inc48.preheader ], [ %ind.end, %middle.block ]
  br label %for.inc48

for.inc48:                                        ; preds = %for.inc48.preheader45, %for.inc48
  %indvars.iv19 = phi i64 [ %indvars.iv.next20.7, %for.inc48 ], [ %indvars.iv19.ph, %for.inc48.preheader45 ]
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
  br i1 %exitcond.7, label %for.cond19.loopexit.loopexit, label %for.inc48, !llvm.loop !6

for.end53.loopexit:                               ; preds = %for.cond19.loopexit
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
  %mul44.us23 = fmul double %alpha, 0.000000e+00
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
  %broadcast.splatinsert90 = insertelement <2 x double> undef, double %mul44.us23, i32 0
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
  br i1 %cmp51.us, label %for.cond4.preheader.us.us.preheader, label %for.cond4.preheader.us41.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us41.preheader:               ; preds = %for.cond1.preheader.us
  br i1 %min.iters.check, label %for.cond4.preheader.us41.preheader92, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond4.preheader.us41.preheader
  br i1 %cmp.zero, label %for.cond4.preheader.us41.preheader92, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep76
  %bound1 = icmp ult double* %scevgep74, %scevgep72
  %found.conflict = and i1 %bound0, %bound1
  %bound079 = icmp ult double* %scevgep, %arrayidx41.us.us
  %bound180 = icmp ult double* %arrayidx41.us.us, %scevgep72
  %found.conflict81 = and i1 %bound079, %bound180
  %conflict.rdx = or i1 %found.conflict, %found.conflict81
  br i1 %conflict.rdx, label %for.cond4.preheader.us41.preheader92, label %vector.ph

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
  br i1 %cmp.n, label %for.cond1.for.inc53_crit_edge.us, label %for.cond4.preheader.us41.preheader92

for.cond4.preheader.us41.preheader92:             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond4.preheader.us41.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond4.preheader.us41.preheader ], [ %n.vec, %middle.block ]
  %28 = sub nsw i64 %wide.trip.count62, %indvars.iv.ph
  %xtraiter = and i64 %28, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.cond4.preheader.us41.prol.loopexit.unr-lcssa, label %for.cond4.preheader.us41.prol.preheader

for.cond4.preheader.us41.prol.preheader:          ; preds = %for.cond4.preheader.us41.preheader92
  br label %for.cond4.preheader.us41.prol

for.cond4.preheader.us41.prol:                    ; preds = %for.cond4.preheader.us41.prol.preheader
  %arrayidx31.us16.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %indvars.iv.ph
  %29 = load double, double* %arrayidx31.us16.prol, align 8
  %mul32.us17.prol = fmul double %29, %beta
  %arrayidx36.us18.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv.ph
  %30 = load double, double* %arrayidx36.us18.prol, align 8
  %mul37.us19.prol = fmul double %30, %alpha
  %31 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us21.prol = fmul double %mul37.us19.prol, %31
  %add43.us22.prol = fadd double %mul32.us17.prol, %mul42.us21.prol
  %add45.us24.prol = fadd double %mul44.us23, %add43.us22.prol
  store double %add45.us24.prol, double* %arrayidx31.us16.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  br label %for.cond4.preheader.us41.prol.loopexit.unr-lcssa

for.cond4.preheader.us41.prol.loopexit.unr-lcssa: ; preds = %for.cond4.preheader.us41.preheader92, %for.cond4.preheader.us41.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.cond4.preheader.us41.prol ], [ %indvars.iv.ph, %for.cond4.preheader.us41.preheader92 ]
  br label %for.cond4.preheader.us41.prol.loopexit

for.cond4.preheader.us41.prol.loopexit:           ; preds = %for.cond4.preheader.us41.prol.loopexit.unr-lcssa
  %32 = icmp eq i64 %0, %indvars.iv.ph
  br i1 %32, label %for.cond1.for.inc53_crit_edge.us.loopexit93, label %for.cond4.preheader.us41.preheader92.new

for.cond4.preheader.us41.preheader92.new:         ; preds = %for.cond4.preheader.us41.prol.loopexit
  br label %for.cond4.preheader.us41

for.cond4.preheader.us41:                         ; preds = %for.cond4.preheader.us41, %for.cond4.preheader.us41.preheader92.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.cond4.preheader.us41.preheader92.new ], [ %indvars.iv.next.1, %for.cond4.preheader.us41 ]
  %arrayidx31.us16 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %indvars.iv
  %33 = load double, double* %arrayidx31.us16, align 8
  %mul32.us17 = fmul double %33, %beta
  %arrayidx36.us18 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv
  %34 = load double, double* %arrayidx36.us18, align 8
  %mul37.us19 = fmul double %34, %alpha
  %35 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us21 = fmul double %mul37.us19, %35
  %add43.us22 = fadd double %mul32.us17, %mul42.us21
  %add45.us24 = fadd double %mul44.us23, %add43.us22
  store double %add45.us24, double* %arrayidx31.us16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx31.us16.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %indvars.iv.next
  %36 = load double, double* %arrayidx31.us16.1, align 8
  %mul32.us17.1 = fmul double %36, %beta
  %arrayidx36.us18.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv.next
  %37 = load double, double* %arrayidx36.us18.1, align 8
  %mul37.us19.1 = fmul double %37, %alpha
  %38 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us21.1 = fmul double %mul37.us19.1, %38
  %add43.us22.1 = fadd double %mul32.us17.1, %mul42.us21.1
  %add45.us24.1 = fadd double %mul44.us23, %add43.us22.1
  store double %add45.us24.1, double* %arrayidx31.us16.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %for.cond1.for.inc53_crit_edge.us.loopexit93.unr-lcssa, label %for.cond4.preheader.us41, !llvm.loop !17

for.cond1.for.inc53_crit_edge.us.loopexit:        ; preds = %for.cond4.for.inc50_crit_edge.us.us
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit93.unr-lcssa: ; preds = %for.cond4.preheader.us41
  br label %for.cond1.for.inc53_crit_edge.us.loopexit93

for.cond1.for.inc53_crit_edge.us.loopexit93:      ; preds = %for.cond4.preheader.us41.prol.loopexit, %for.cond1.for.inc53_crit_edge.us.loopexit93.unr-lcssa
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us:                 ; preds = %for.cond1.for.inc53_crit_edge.us.loopexit93, %for.cond1.for.inc53_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, %wide.trip.count66
  br i1 %exitcond67, label %for.end55.loopexit, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.inc50_crit_edge.us.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.cond4.for.inc50_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv60
  br label %for.inc.us.us

for.cond4.for.inc50_crit_edge.us.us:              ; preds = %for.inc.us.us
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

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.cond4.preheader.us.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.inc.us.us ], [ 0, %for.cond4.preheader.us.us ]
  %temp2.03.us.us = phi double [ %add27.us.us, %for.inc.us.us ], [ 0.000000e+00, %for.cond4.preheader.us.us ]
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
  br i1 %exitcond59, label %for.cond4.for.inc50_crit_edge.us.us, label %for.inc.us.us

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
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

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv8, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, %wide.trip.count11
  br i1 %exitcond12, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
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
