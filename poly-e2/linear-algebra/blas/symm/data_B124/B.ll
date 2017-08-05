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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call void @kernel_symm(i32 1000, i32 1200, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
define internal void @init_array(i32 %m, i32 %n, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) #2 {
for.body.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond1.for.inc16_crit_edge.us, %for.body.us.preheader
  %indvars.iv45 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next46, %for.cond1.for.inc16_crit_edge.us ]
  %0 = add i64 %indvars.iv45, 1200
  %1 = trunc i64 %0 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body.us
  %indvars.iv41 = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next42, %for.body3.us ]
  %2 = add nuw nsw i64 %indvars.iv41, %indvars.iv45
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv45, i64 %indvars.iv41
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = trunc i64 %indvars.iv41 to i32
  %sub.us = sub i32 %1, %4
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv45, i64 %indvars.iv41
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond44, label %for.cond1.for.inc16_crit_edge.us, label %for.body3.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next46, 1000
  br i1 %exitcond49, label %for.body26.lr.ph.preheader, label %for.body.us

for.body26.lr.ph.preheader:                       ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.body26.lr.ph

for.body26.lr.ph:                                 ; preds = %for.body26.lr.ph.preheader, %for.inc51
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %for.inc51 ], [ 0, %for.body26.lr.ph.preheader ]
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.inc51 ], [ 1, %for.body26.lr.ph.preheader ]
  %5 = sub nsw i64 0, %indvars.iv38
  %6 = trunc i64 %5 to i32
  %7 = add i32 %6, 7
  %8 = add i32 %6, 998
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %xtraiter51 = and i64 %indvars.iv.next39, 1
  %lcmp.mod = icmp eq i64 %xtraiter51, 0
  br i1 %lcmp.mod, label %for.body26.prol.loopexit.unr-lcssa, label %for.body26.prol.preheader

for.body26.prol.preheader:                        ; preds = %for.body26.lr.ph
  %9 = trunc i64 %indvars.iv38 to i32
  %rem28.prol = srem i32 %9, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv38, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit.unr-lcssa

for.body26.prol.loopexit.unr-lcssa:               ; preds = %for.body26.lr.ph, %for.body26.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body26.prol.preheader ], [ 0, %for.body26.lr.ph ]
  %10 = icmp eq i64 %indvars.iv38, 0
  br i1 %10, label %for.end38, label %for.body26.preheader

for.body26.preheader:                             ; preds = %for.body26.prol.loopexit.unr-lcssa
  br label %for.body26

for.body26:                                       ; preds = %for.body26.preheader, %for.body26
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body26 ], [ %indvars.iv.unr.ph, %for.body26.preheader ]
  %11 = add nuw nsw i64 %indvars.iv, %indvars.iv38
  %12 = trunc i64 %11 to i32
  %rem28 = srem i32 %12, 100
  %conv29 = sitofp i32 %rem28 to double
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = add nuw nsw i64 %indvars.iv.next, %indvars.iv38
  %14 = trunc i64 %13 to i32
  %rem28.1 = srem i32 %14, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.v.i0.1 = insertelement <2 x double> undef, double %conv29, i32 0
  %div31.v.i0.2 = insertelement <2 x double> %div31.v.i0.1, double %conv29.1, i32 1
  %div31 = fdiv <2 x double> %div31.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %15 = bitcast double* %arrayidx35 to <2 x double>*
  store <2 x double> %div31, <2 x double>* %15, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv36
  br i1 %exitcond.1, label %for.end38.loopexit, label %for.body26

for.end38.loopexit:                               ; preds = %for.body26
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.body26.prol.loopexit.unr-lcssa
  %cmp419 = icmp slt i64 %indvars.iv.next39, 1000
  br i1 %cmp419, label %for.body43.lr.ph, label %for.inc51

for.body43.lr.ph:                                 ; preds = %for.end38
  %xtraiter32 = and i32 %7, 7
  %lcmp.mod33 = icmp eq i32 %xtraiter32, 0
  br i1 %lcmp.mod33, label %for.body43.prol.loopexit, label %for.body43.prol.preheader

for.body43.prol.preheader:                        ; preds = %for.body43.lr.ph
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol.preheader, %for.body43.prol
  %indvars.iv29.prol = phi i64 [ %indvars.iv.next30.prol, %for.body43.prol ], [ %indvars.iv36, %for.body43.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body43.prol ], [ %xtraiter32, %for.body43.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv29.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next30.prol = add nuw nsw i64 %indvars.iv29.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol, !llvm.loop !1

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol.loopexit.loopexit, %for.body43.lr.ph
  %indvars.iv29.unr = phi i64 [ %indvars.iv36, %for.body43.lr.ph ], [ %indvars.iv.next30.prol, %for.body43.prol.loopexit.loopexit ]
  %16 = icmp ult i32 %8, 7
  br i1 %16, label %for.inc51, label %for.body43.prol.loopexit.for.body43_crit_edge

for.body43.prol.loopexit.for.body43_crit_edge:    ; preds = %for.body43.prol.loopexit
  %17 = sub i64 992, %indvars.iv29.unr
  %18 = lshr i64 %17, 3
  %19 = add nuw nsw i64 %18, 1
  %min.iters.check = icmp ult i64 %19, 2
  br i1 %min.iters.check, label %for.body43.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body43.prol.loopexit.for.body43_crit_edge
  %n.mod.vf = and i64 %19, 1
  %n.vec = sub nsw i64 %19, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %20 = add i64 %indvars.iv29.unr, 8
  %21 = shl nuw i64 %18, 3
  %22 = add i64 %20, %21
  %23 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %22, %23
  br i1 %cmp.zero, label %for.body43.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %24 = shl i64 %index, 3
  %25 = add i64 %indvars.iv29.unr, %24
  %26 = add nsw i64 %25, 7
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv38, i64 %26
  %28 = getelementptr double, double* %27, i64 -7
  %29 = bitcast double* %28 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %29, align 8
  %index.next = add i64 %index, 2
  %30 = icmp eq i64 %index.next, %n.vec
  br i1 %30, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc51, label %for.body43.preheader

for.body43.preheader:                             ; preds = %middle.block, %min.iters.checked, %for.body43.prol.loopexit.for.body43_crit_edge
  %indvars.iv29.ph = phi i64 [ %indvars.iv29.unr, %min.iters.checked ], [ %indvars.iv29.unr, %for.body43.prol.loopexit.for.body43_crit_edge ], [ %ind.end, %middle.block ]
  br label %for.body43

for.body43:                                       ; preds = %for.body43.preheader, %for.body43
  %indvars.iv29 = phi i64 [ %indvars.iv.next30.7, %for.body43 ], [ %indvars.iv29.ph, %for.body43.preheader ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv29
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv.next30
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv.next30.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next30.2 = add nsw i64 %indvars.iv29, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv.next30.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next30.3 = add nsw i64 %indvars.iv29, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv.next30.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next30.4 = add nsw i64 %indvars.iv29, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv.next30.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next30.5 = add nsw i64 %indvars.iv29, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv.next30.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next30.6 = add nsw i64 %indvars.iv29, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv.next30.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next30.7 = add nsw i64 %indvars.iv29, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next30.7, 1000
  br i1 %exitcond.7, label %for.inc51.loopexit, label %for.body43, !llvm.loop !6

for.inc51.loopexit:                               ; preds = %for.body43
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %middle.block, %for.body43.prol.loopexit, %for.end38
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next39, 1000
  br i1 %exitcond, label %for.end53, label %for.body26.lr.ph

for.end53:                                        ; preds = %for.inc51
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture readonly %B) #2 {
for.body.lr.ph:
  %mul44 = fmul double %alpha, 0.000000e+00
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul32.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.body.lr.ph, %for.inc53
  %indvars.iv29 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next30, %for.inc53 ]
  %cmp53 = icmp sgt i64 %indvars.iv29, 0
  %arrayidx41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv29, i64 %indvars.iv29
  br i1 %cmp53, label %for.body3.us.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.lr.ph
  br label %for.body3

for.body3.us.preheader:                           ; preds = %for.body3.lr.ph
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.cond4.for.end_crit_edge.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.cond4.for.end_crit_edge.us ], [ 0, %for.body3.us.preheader ]
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv29, i64 %indvars.iv25
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.body6.us, %for.body3.us
  %indvars.iv20 = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next21, %for.body6.us ]
  %add275.us = phi double [ 0.000000e+00, %for.body3.us ], [ %add27.us, %for.body6.us ]
  %1 = load double, double* %arrayidx8.us, align 8
  %mul.us = fmul double %1, %alpha
  %arrayidx12.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv29, i64 %indvars.iv20
  %2 = load double, double* %arrayidx12.us, align 8
  %mul13.us = fmul double %mul.us, %2
  %arrayidx17.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 %indvars.iv25
  %3 = load double, double* %arrayidx17.us, align 8
  %add.us = fadd double %mul13.us, %3
  store double %add.us, double* %arrayidx17.us, align 8
  %arrayidx21.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv20, i64 %indvars.iv25
  %4 = load double, double* %arrayidx21.us, align 8
  %5 = load double, double* %arrayidx12.us, align 8
  %mul26.us = fmul double %4, %5
  %add27.us = fadd double %add275.us, %mul26.us
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond = icmp eq i64 %indvars.iv.next21, %indvars.iv29
  br i1 %exitcond, label %for.cond4.for.end_crit_edge.us, label %for.body6.us

for.cond4.for.end_crit_edge.us:                   ; preds = %for.body6.us
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv29, i64 %indvars.iv25
  %6 = load double, double* %arrayidx31.us, align 8
  %mul32.us = fmul double %6, %beta
  %7 = load double, double* %arrayidx8.us, align 8
  %mul37.us = fmul double %7, %alpha
  %8 = load double, double* %arrayidx41, align 8
  %mul42.us = fmul double %mul37.us, %8
  %add43.us = fadd double %mul32.us, %mul42.us
  %mul44.us = fmul double %add27.us, %alpha
  %add45.us = fadd double %add43.us, %mul44.us
  store double %add45.us, double* %arrayidx31.us, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, 1200
  br i1 %exitcond28, label %for.inc53.loopexit, label %for.body3.us

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3 ], [ 0, %for.body3.preheader ]
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv29, i64 %indvars.iv
  %9 = bitcast double* %arrayidx31 to <2 x double>*
  %arrayidx36 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv29, i64 %indvars.iv
  %10 = load double, double* %arrayidx36, align 8
  %mul37 = fmul double %10, %alpha
  %11 = load double, double* %arrayidx41, align 8
  %mul42 = fmul double %mul37, %11
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx31.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv29, i64 %indvars.iv.next
  %12 = load <2 x double>, <2 x double>* %9, align 8
  %mul32 = fmul <2 x double> %12, %mul32.v.i1.2
  %mul32.v.r1 = extractelement <2 x double> %mul32, i32 0
  %mul32.v.r2 = extractelement <2 x double> %mul32, i32 1
  %add43 = fadd double %mul32.v.r1, %mul42
  %add45 = fadd double %add43, %mul44
  store double %add45, double* %arrayidx31, align 8
  %arrayidx36.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv29, i64 %indvars.iv.next
  %13 = load double, double* %arrayidx36.1, align 8
  %mul37.1 = fmul double %13, %alpha
  %14 = load double, double* %arrayidx41, align 8
  %mul42.1 = fmul double %mul37.1, %14
  %add43.1 = fadd double %mul32.v.r2, %mul42.1
  %add45.1 = fadd double %add43.1, %mul44
  store double %add45.1, double* %arrayidx31.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %for.inc53.loopexit37, label %for.body3

for.inc53.loopexit:                               ; preds = %for.cond4.for.end_crit_edge.us
  br label %for.inc53

for.inc53.loopexit37:                             ; preds = %for.body3
  br label %for.inc53

for.inc53:                                        ; preds = %for.inc53.loopexit37, %for.inc53.loopexit
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next30, 1000
  br i1 %exitcond32, label %for.end55, label %for.body3.lr.ph

for.end55:                                        ; preds = %for.inc53
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %C) #0 {
for.body.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us, %for.body.us.preheader
  %indvars.iv9 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next10, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv9, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv9, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond13, label %for.end12, label %for.body.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
