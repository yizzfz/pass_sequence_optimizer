; ModuleID = 'A.ll'
source_filename = "symm.c"
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
  %3 = bitcast i8* %call to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
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
  br i1 %cmp28, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.lr.ph.for.cond23.preheader.lr.ph_crit_edge

for.cond1.preheader.lr.ph.for.cond23.preheader.lr.ph_crit_edge: ; preds = %for.cond1.preheader.lr.ph
  %.pre = sext i32 %m to i64
  br label %for.cond23.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %n, -1
  %1 = zext i32 %n to i64
  %2 = sext i32 %m to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc16_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv29 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next30, %for.cond1.for.inc16_crit_edge.us ]
  %3 = add i64 %indvars.iv29, %1
  %4 = trunc i64 %3 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  %5 = add nuw nsw i64 %indvars.iv25, %indvars.iv29
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv29, i64 %indvars.iv25
  store double %div.us, double* %arrayidx6.us, align 8
  %7 = trunc i64 %indvars.iv25 to i32
  %sub.us = sub i32 %4, %7
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, %conv4
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv29, i64 %indvars.iv25
  store double %div11.us, double* %arrayidx15.us, align 8
  %exitcond28 = icmp eq i64 %indvars.iv25, %wide.trip.count
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  br i1 %exitcond28, label %for.cond1.for.inc16_crit_edge.us, label %for.body3.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next30 = add nuw i64 %indvars.iv29, 1
  %cmp.us = icmp slt i64 %indvars.iv.next30, %2
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond23.preheader.lr.ph.loopexit

for.cond23.preheader.lr.ph.loopexit:              ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.cond23.preheader.lr.ph

for.cond23.preheader.lr.ph:                       ; preds = %for.cond23.preheader.lr.ph.loopexit, %for.cond1.preheader.lr.ph.for.cond23.preheader.lr.ph_crit_edge
  %.pre-phi = phi i64 [ %.pre, %for.cond1.preheader.lr.ph.for.cond23.preheader.lr.ph_crit_edge ], [ %2, %for.cond23.preheader.lr.ph.loopexit ]
  %8 = add i32 %m, -1
  %wide.trip.count21 = sext i32 %8 to i64
  %9 = add nsw i64 %wide.trip.count21, 1
  br label %for.body26.lr.ph

for.body26.lr.ph:                                 ; preds = %for.inc51, %for.cond23.preheader.lr.ph
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %for.inc51 ], [ 0, %for.cond23.preheader.lr.ph ]
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.inc51 ], [ 1, %for.cond23.preheader.lr.ph ]
  %sext = shl i64 %indvars.iv17, 32
  %10 = ashr exact i64 %sext, 32
  %11 = and i64 %indvars.iv23, 1
  %lcmp.mod = icmp eq i64 %11, 0
  br i1 %lcmp.mod, label %for.body26.prol, label %for.body26.prol.loopexit

for.body26.prol:                                  ; preds = %for.body26.lr.ph
  %12 = trunc i64 %indvars.iv23 to i32
  %rem28.prol = srem i32 %12, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, %conv4
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit

for.body26.prol.loopexit:                         ; preds = %for.body26.prol, %for.body26.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body26.prol ], [ 0, %for.body26.lr.ph ]
  %13 = icmp eq i64 %indvars.iv23, 0
  br i1 %13, label %for.cond40.preheader, label %for.body26.lr.ph.new

for.body26.lr.ph.new:                             ; preds = %for.body26.prol.loopexit
  br label %for.body26

for.cond40.preheader.loopexit:                    ; preds = %for.body26
  br label %for.cond40.preheader

for.cond40.preheader:                             ; preds = %for.cond40.preheader.loopexit, %for.body26.prol.loopexit
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %cmp414 = icmp slt i64 %indvars.iv.next24, %.pre-phi
  br i1 %cmp414, label %for.body43.preheader, label %for.inc51

for.body43.preheader:                             ; preds = %for.cond40.preheader
  %14 = sub nsw i64 %9, %10
  %min.iters.check = icmp ult i64 %14, 4
  br i1 %min.iters.check, label %for.body43.preheader37, label %min.iters.checked

for.body43.preheader37:                           ; preds = %middle.block, %min.iters.checked, %for.body43.preheader
  %indvars.iv19.ph = phi i64 [ %10, %min.iters.checked ], [ %10, %for.body43.preheader ], [ %ind.end, %middle.block ]
  br label %for.body43

min.iters.checked:                                ; preds = %for.body43.preheader
  %n.vec = and i64 %14, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %10, %n.vec
  br i1 %cmp.zero, label %for.body43.preheader37, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %15 = add nsw i64 %n.vec, -4
  %16 = lshr exact i64 %15, 2
  %17 = add nuw nsw i64 %16, 1
  %xtraiter38 = and i64 %17, 3
  %lcmp.mod39 = icmp eq i64 %xtraiter38, 0
  br i1 %lcmp.mod39, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter38, %vector.body.prol.preheader ]
  %18 = add i64 %10, %index.prol
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 %18
  %20 = bitcast double* %19 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %20, align 8
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %22, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.loopexit, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.loopexit:               ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.loopexit ]
  %23 = icmp ult i64 %15, 12
  br i1 %23, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %24 = add i64 %10, %index
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 %24
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %26, align 8
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %28, align 8
  %index.next = add i64 %index, 4
  %29 = add i64 %10, %index.next
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 %29
  %31 = bitcast double* %30 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %31, align 8
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %33, align 8
  %index.next.1 = add i64 %index, 8
  %34 = add i64 %10, %index.next.1
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 %34
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %36, align 8
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %38, align 8
  %index.next.2 = add i64 %index, 12
  %39 = add i64 %10, %index.next.2
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 %39
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %41, align 8
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %43, align 8
  %index.next.3 = add i64 %index, 16
  %44 = icmp eq i64 %index.next.3, %n.vec
  br i1 %44, label %middle.block.loopexit, label %vector.body, !llvm.loop !3

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %14, %n.vec
  br i1 %cmp.n, label %for.inc51, label %for.body43.preheader37

for.body26:                                       ; preds = %for.body26, %for.body26.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body26.lr.ph.new ], [ %indvars.iv.next.1, %for.body26 ]
  %45 = add nuw nsw i64 %indvars.iv, %indvars.iv23
  %46 = trunc i64 %45 to i32
  %rem28 = srem i32 %46, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, %conv4
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %47 = add nuw nsw i64 %indvars.iv.next, %indvars.iv23
  %48 = trunc i64 %47 to i32
  %rem28.1 = srem i32 %48, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, %conv4
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %indvars.iv23
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.cond40.preheader.loopexit, label %for.body26

for.body43:                                       ; preds = %for.body43.preheader37, %for.body43
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %for.body43 ], [ %indvars.iv19.ph, %for.body43.preheader37 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv19
  store double -9.990000e+02, double* %arrayidx47, align 8
  %exitcond22 = icmp eq i64 %indvars.iv19, %wide.trip.count21
  %indvars.iv.next20 = add nsw i64 %indvars.iv19, 1
  br i1 %exitcond22, label %for.inc51.loopexit, label %for.body43, !llvm.loop !6

for.inc51.loopexit:                               ; preds = %for.body43
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %middle.block, %for.cond40.preheader
  %49 = icmp slt i64 %indvars.iv.next24, %.pre-phi
  %indvars.iv.next18 = add nsw i64 %10, 1
  br i1 %49, label %for.body26.lr.ph, label %for.end53.loopexit

for.end53.loopexit:                               ; preds = %for.inc51
  br label %for.end53

for.end53:                                        ; preds = %for.end53.loopexit, %entry
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
  %0 = add i32 %n, -1
  %1 = sext i32 %n to i64
  %2 = sext i32 %m to i64
  %mul44.us24 = fmul double %alpha, 0.000000e+00
  %wide.trip.count = zext i32 %0 to i64
  %3 = add nuw nsw i64 %wide.trip.count, 1
  %4 = add nuw nsw i64 %wide.trip.count, 1
  %min.iters.check = icmp ult i64 %3, 4
  %n.vec = and i64 %3, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert80 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat81 = shufflevector <2 x double> %broadcast.splatinsert80, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert84 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat85 = shufflevector <2 x double> %broadcast.splatinsert84, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert86 = insertelement <2 x double> undef, double %mul44.us24, i32 0
  %broadcast.splat87 = shufflevector <2 x double> %broadcast.splatinsert86, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %3, %n.vec
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc53_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.cond1.for.inc53_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %indvars.iv54 = phi i32 [ %indvars.iv.next55, %for.cond1.for.inc53_crit_edge.us ], [ -1, %for.cond1.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv60, i64 0
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv60, i64 %3
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv60, i64 0
  %scevgep72 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv60, i64 %3
  %cmp51.us = icmp sgt i64 %indvars.iv60, 0
  br i1 %cmp51.us, label %for.cond4.preheader.us.us.preheader, label %for.cond4.preheader.us10.preheader

for.cond4.preheader.us10.preheader:               ; preds = %for.cond1.preheader.us
  %arrayidx41.us21 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv60
  br i1 %min.iters.check, label %for.cond4.preheader.us10.preheader88, label %min.iters.checked

for.cond4.preheader.us10.preheader88:             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond4.preheader.us10.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond4.preheader.us10.preheader ], [ %n.vec, %middle.block ]
  %5 = sub nsw i64 %4, %indvars.iv.ph
  %xtraiter = and i64 %5, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.cond4.preheader.us10.prol.loopexit, label %for.cond4.preheader.us10.prol

for.cond4.preheader.us10.prol:                    ; preds = %for.cond4.preheader.us10.preheader88
  %arrayidx31.us17.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv60, i64 %indvars.iv.ph
  %6 = load double, double* %arrayidx31.us17.prol, align 8
  %mul32.us18.prol = fmul double %6, %beta
  %arrayidx36.us19.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv60, i64 %indvars.iv.ph
  %7 = load double, double* %arrayidx36.us19.prol, align 8
  %mul37.us20.prol = fmul double %7, %alpha
  %8 = load double, double* %arrayidx41.us21, align 8
  %mul42.us22.prol = fmul double %mul37.us20.prol, %8
  %add43.us23.prol = fadd double %mul32.us18.prol, %mul42.us22.prol
  %add45.us25.prol = fadd double %mul44.us24, %add43.us23.prol
  store double %add45.us25.prol, double* %arrayidx31.us17.prol, align 8
  %indvars.iv.next.prol = or i64 %indvars.iv.ph, 1
  br label %for.cond4.preheader.us10.prol.loopexit

for.cond4.preheader.us10.prol.loopexit:           ; preds = %for.cond4.preheader.us10.prol, %for.cond4.preheader.us10.preheader88
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.cond4.preheader.us10.prol ], [ %indvars.iv.ph, %for.cond4.preheader.us10.preheader88 ]
  %9 = icmp eq i64 %wide.trip.count, %indvars.iv.ph
  br i1 %9, label %for.cond1.for.inc53_crit_edge.us, label %for.cond4.preheader.us10.preheader88.new

for.cond4.preheader.us10.preheader88.new:         ; preds = %for.cond4.preheader.us10.prol.loopexit
  br label %for.cond4.preheader.us10

min.iters.checked:                                ; preds = %for.cond4.preheader.us10.preheader
  br i1 %cmp.zero, label %for.cond4.preheader.us10.preheader88, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep72
  %bound1 = icmp ult double* %scevgep70, %scevgep68
  %found.conflict = and i1 %bound0, %bound1
  %bound075 = icmp ult double* %scevgep, %arrayidx41.us21
  %bound176 = icmp ult double* %arrayidx41.us21, %scevgep68
  %found.conflict77 = and i1 %bound075, %bound176
  %conflict.rdx = or i1 %found.conflict, %found.conflict77
  br i1 %conflict.rdx, label %for.cond4.preheader.us10.preheader88, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %10 = load double, double* %arrayidx41.us21, align 8, !alias.scope !8
  %11 = insertelement <2 x double> undef, double %10, i32 0
  %12 = shufflevector <2 x double> %11, <2 x double> undef, <2 x i32> zeroinitializer
  %13 = insertelement <2 x double> undef, double %10, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv60, i64 %index
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !11, !noalias !13
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !11, !noalias !13
  %19 = fmul <2 x double> %wide.load, %broadcast.splat81
  %20 = fmul <2 x double> %wide.load79, %broadcast.splat81
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv60, i64 %index
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !15
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !15
  %25 = fmul <2 x double> %wide.load82, %broadcast.splat85
  %26 = fmul <2 x double> %wide.load83, %broadcast.splat85
  %27 = fmul <2 x double> %25, %12
  %28 = fmul <2 x double> %26, %14
  %29 = fadd <2 x double> %19, %27
  %30 = fadd <2 x double> %20, %28
  %31 = fadd <2 x double> %broadcast.splat87, %29
  %32 = fadd <2 x double> %broadcast.splat87, %30
  %33 = bitcast double* %15 to <2 x double>*
  store <2 x double> %31, <2 x double>* %33, align 8, !alias.scope !11, !noalias !13
  %34 = bitcast double* %17 to <2 x double>*
  store <2 x double> %32, <2 x double>* %34, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %35 = icmp eq i64 %index.next, %n.vec
  br i1 %35, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc53_crit_edge.us, label %for.cond4.preheader.us10.preheader88

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  %wide.trip.count56 = zext i32 %indvars.iv54 to i64
  %arrayidx41.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv60
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us10:                         ; preds = %for.cond4.preheader.us10, %for.cond4.preheader.us10.preheader88.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.cond4.preheader.us10.preheader88.new ], [ %indvars.iv.next.1, %for.cond4.preheader.us10 ]
  %arrayidx31.us17 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv60, i64 %indvars.iv
  %36 = load double, double* %arrayidx31.us17, align 8
  %mul32.us18 = fmul double %36, %beta
  %arrayidx36.us19 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv60, i64 %indvars.iv
  %37 = load double, double* %arrayidx36.us19, align 8
  %mul37.us20 = fmul double %37, %alpha
  %38 = load double, double* %arrayidx41.us21, align 8
  %mul42.us22 = fmul double %mul37.us20, %38
  %add43.us23 = fadd double %mul32.us18, %mul42.us22
  %add45.us25 = fadd double %mul44.us24, %add43.us23
  store double %add45.us25, double* %arrayidx31.us17, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx31.us17.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv60, i64 %indvars.iv.next
  %39 = load double, double* %arrayidx31.us17.1, align 8
  %mul32.us18.1 = fmul double %39, %beta
  %arrayidx36.us19.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv60, i64 %indvars.iv.next
  %40 = load double, double* %arrayidx36.us19.1, align 8
  %mul37.us20.1 = fmul double %40, %alpha
  %41 = load double, double* %arrayidx41.us21, align 8
  %mul42.us22.1 = fmul double %mul37.us20.1, %41
  %add43.us23.1 = fadd double %mul32.us18.1, %mul42.us22.1
  %add45.us25.1 = fadd double %mul44.us24, %add43.us23.1
  store double %add45.us25.1, double* %arrayidx31.us17.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.cond1.for.inc53_crit_edge.us.loopexit90, label %for.cond4.preheader.us10, !llvm.loop !17

for.cond1.for.inc53_crit_edge.us.loopexit:        ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit90:      ; preds = %for.cond4.preheader.us10
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us:                 ; preds = %for.cond1.for.inc53_crit_edge.us.loopexit90, %for.cond1.for.inc53_crit_edge.us.loopexit, %for.cond4.preheader.us10.prol.loopexit, %middle.block
  %indvars.iv.next61 = add nuw i64 %indvars.iv60, 1
  %cmp.us = icmp slt i64 %indvars.iv.next61, %2
  %indvars.iv.next55 = add nsw i32 %indvars.iv54, 1
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.end55.loopexit

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.end_crit_edge.us.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.cond4.for.end_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv60, i64 %indvars.iv58
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.body6.us.us
  %arrayidx31.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv60, i64 %indvars.iv58
  %42 = load double, double* %arrayidx31.us.us, align 8
  %mul32.us.us = fmul double %42, %beta
  %43 = load double, double* %arrayidx8.us.us, align 8
  %mul37.us.us = fmul double %43, %alpha
  %44 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us.us = fmul double %mul37.us.us, %44
  %add43.us.us = fadd double %mul32.us.us, %mul42.us.us
  %mul44.us.us = fmul double %add27.us.us, %alpha
  %add45.us.us = fadd double %mul44.us.us, %add43.us.us
  store double %add45.us.us, double* %arrayidx31.us.us, align 8
  %indvars.iv.next59 = add nuw i64 %indvars.iv58, 1
  %cmp2.us.us = icmp slt i64 %indvars.iv.next59, %1
  br i1 %cmp2.us.us, label %for.cond4.preheader.us.us, label %for.cond1.for.inc53_crit_edge.us.loopexit

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.cond4.preheader.us.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.body6.us.us ], [ 0, %for.cond4.preheader.us.us ]
  %temp2.03.us.us = phi double [ %add27.us.us, %for.body6.us.us ], [ 0.000000e+00, %for.cond4.preheader.us.us ]
  %45 = load double, double* %arrayidx8.us.us, align 8
  %mul.us.us = fmul double %45, %alpha
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv52
  %46 = load double, double* %arrayidx12.us.us, align 8
  %mul13.us.us = fmul double %mul.us.us, %46
  %arrayidx17.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv52, i64 %indvars.iv58
  %47 = load double, double* %arrayidx17.us.us, align 8
  %add.us.us = fadd double %47, %mul13.us.us
  store double %add.us.us, double* %arrayidx17.us.us, align 8
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv52, i64 %indvars.iv58
  %48 = load double, double* %arrayidx21.us.us, align 8
  %49 = load double, double* %arrayidx12.us.us, align 8
  %mul26.us.us = fmul double %48, %49
  %add27.us.us = fadd double %temp2.03.us.us, %mul26.us.us
  %exitcond57 = icmp eq i64 %indvars.iv52, %wide.trip.count56
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  br i1 %exitcond57, label %for.cond4.for.end_crit_edge.us.us, label %for.body6.us.us

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
  %3 = sext i32 %n to i64
  %4 = sext i32 %m to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv8, %4
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %6 = add nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv8, i64 %indvars.iv
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #5
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next9 = add nuw i64 %indvars.iv8, 1
  %cmp.us = icmp slt i64 %indvars.iv.next9, %4
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

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
