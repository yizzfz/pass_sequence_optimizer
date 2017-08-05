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

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) #2 {
for.cond1.preheader.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc16_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv67 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next68, %for.cond1.for.inc16_crit_edge.us ]
  %0 = add i64 %indvars.iv67, 1200
  %1 = trunc i64 %0 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv63 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next64, %for.body3.us ]
  %2 = add nuw nsw i64 %indvars.iv63, %indvars.iv67
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv67, i64 %indvars.iv63
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = trunc i64 %indvars.iv63 to i32
  %sub.us = sub i32 %1, %4
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv67, i64 %indvars.iv63
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, 1200
  br i1 %exitcond66, label %for.cond1.for.inc16_crit_edge.us, label %for.body3.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next68, 1000
  br i1 %exitcond71, label %for.body26.lr.ph.preheader, label %for.cond1.preheader.us

for.body26.lr.ph.preheader:                       ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.body26.lr.ph

for.body26.lr.ph:                                 ; preds = %for.body26.lr.ph.preheader, %for.inc51
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.inc51 ], [ 0, %for.body26.lr.ph.preheader ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.inc51 ], [ 1, %for.body26.lr.ph.preheader ]
  %5 = sub nsw i64 0, %indvars.iv60
  %6 = trunc i64 %5 to i32
  %7 = add i32 %6, 7
  %8 = add i32 %6, 998
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %xtraiter73 = and i64 %indvars.iv.next61, 1
  %lcmp.mod = icmp eq i64 %xtraiter73, 0
  br i1 %lcmp.mod, label %for.body26.prol.loopexit.unr-lcssa, label %for.body26.prol.preheader

for.body26.prol.preheader:                        ; preds = %for.body26.lr.ph
  %9 = trunc i64 %indvars.iv60 to i32
  %rem28.prol = srem i32 %9, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv60, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit.unr-lcssa

for.body26.prol.loopexit.unr-lcssa:               ; preds = %for.body26.lr.ph, %for.body26.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body26.prol.preheader ], [ 0, %for.body26.lr.ph ]
  %10 = icmp eq i64 %indvars.iv60, 0
  br i1 %10, label %for.cond40.preheader, label %for.body26.preheader

for.body26.preheader:                             ; preds = %for.body26.prol.loopexit.unr-lcssa
  br label %for.body26

for.cond40.preheader.loopexit:                    ; preds = %for.body26
  br label %for.cond40.preheader

for.cond40.preheader:                             ; preds = %for.cond40.preheader.loopexit, %for.body26.prol.loopexit.unr-lcssa
  %cmp4135 = icmp slt i64 %indvars.iv.next61, 1000
  br i1 %cmp4135, label %for.body43.lr.ph, label %for.inc51

for.body43.lr.ph:                                 ; preds = %for.cond40.preheader
  %xtraiter54 = and i32 %7, 7
  %lcmp.mod55 = icmp eq i32 %xtraiter54, 0
  br i1 %lcmp.mod55, label %for.body43.prol.loopexit, label %for.body43.prol.preheader

for.body43.prol.preheader:                        ; preds = %for.body43.lr.ph
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol.preheader, %for.body43.prol
  %indvars.iv51.prol = phi i64 [ %indvars.iv.next52.prol, %for.body43.prol ], [ %indvars.iv58, %for.body43.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body43.prol ], [ %xtraiter54, %for.body43.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv51.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol, !llvm.loop !1

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol.loopexit.loopexit, %for.body43.lr.ph
  %indvars.iv51.unr = phi i64 [ %indvars.iv58, %for.body43.lr.ph ], [ %indvars.iv.next52.prol, %for.body43.prol.loopexit.loopexit ]
  %11 = icmp ult i32 %8, 7
  br i1 %11, label %for.inc51, label %for.body43.preheader

for.body43.preheader:                             ; preds = %for.body43.prol.loopexit
  %12 = sub i64 992, %indvars.iv51.unr
  %13 = lshr i64 %12, 3
  %14 = add nuw nsw i64 %13, 1
  %min.iters.check = icmp ult i64 %14, 2
  br i1 %min.iters.check, label %for.body43.preheader75, label %min.iters.checked

for.body43.preheader75:                           ; preds = %middle.block, %min.iters.checked, %for.body43.preheader
  %indvars.iv51.ph = phi i64 [ %indvars.iv51.unr, %min.iters.checked ], [ %indvars.iv51.unr, %for.body43.preheader ], [ %ind.end, %middle.block ]
  br label %for.body43

min.iters.checked:                                ; preds = %for.body43.preheader
  %n.mod.vf = and i64 %14, 1
  %n.vec = sub nsw i64 %14, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %15 = add i64 %indvars.iv51.unr, 8
  %16 = shl nuw i64 %13, 3
  %17 = add i64 %15, %16
  %18 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %17, %18
  br i1 %cmp.zero, label %for.body43.preheader75, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %19 = shl i64 %index, 3
  %20 = add i64 %indvars.iv51.unr, %19
  %21 = add nsw i64 %20, 7
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv60, i64 %21
  %23 = getelementptr double, double* %22, i64 -7
  %24 = bitcast double* %23 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %24, align 8
  %index.next = add i64 %index, 2
  %25 = icmp eq i64 %index.next, %n.vec
  br i1 %25, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc51, label %for.body43.preheader75

for.body26:                                       ; preds = %for.body26.preheader, %for.body26
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body26 ], [ %indvars.iv.unr.ph, %for.body26.preheader ]
  %26 = add nuw nsw i64 %indvars.iv, %indvars.iv60
  %27 = trunc i64 %26 to i32
  %rem28 = srem i32 %27, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = add nuw nsw i64 %indvars.iv.next, %indvars.iv60
  %29 = trunc i64 %28 to i32
  %rem28.1 = srem i32 %29, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, 1.000000e+03
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv58
  br i1 %exitcond.1, label %for.cond40.preheader.loopexit, label %for.body26

for.body43:                                       ; preds = %for.body43.preheader75, %for.body43
  %indvars.iv51 = phi i64 [ %indvars.iv.next52.7, %for.body43 ], [ %indvars.iv51.ph, %for.body43.preheader75 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv51
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next52.2 = add nsw i64 %indvars.iv51, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next52.3 = add nsw i64 %indvars.iv51, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next52.4 = add nsw i64 %indvars.iv51, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next52.5 = add nsw i64 %indvars.iv51, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next52.6 = add nsw i64 %indvars.iv51, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next52.7 = add nsw i64 %indvars.iv51, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next52.7, 1000
  br i1 %exitcond.7, label %for.inc51.loopexit, label %for.body43, !llvm.loop !6

for.inc51.loopexit:                               ; preds = %for.body43
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %middle.block, %for.body43.prol.loopexit, %for.cond40.preheader
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond = icmp eq i64 %indvars.iv.next61, 1000
  br i1 %exitcond, label %for.end53, label %for.body26.lr.ph

for.end53:                                        ; preds = %for.inc51
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture readonly %B) #2 {
for.cond1.preheader.lr.ph:
  %mul44 = fmul double %alpha, 0.000000e+00
  %broadcast.splatinsert74 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat75 = shufflevector <2 x double> %broadcast.splatinsert74, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert78 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat79 = shufflevector <2 x double> %broadcast.splatinsert78, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert80 = insertelement <2 x double> undef, double %mul44, i32 0
  %broadcast.splat81 = shufflevector <2 x double> %broadcast.splatinsert80, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond4.preheader.lr.ph

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader.lr.ph, %for.inc53
  %indvars.iv54 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next55, %for.inc53 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 0
  %0 = add i64 %indvars.iv54, 1
  %scevgep62 = getelementptr [1200 x double], [1200 x double]* %C, i64 %0, i64 0
  %cmp532 = icmp sgt i64 %indvars.iv54, 0
  %arrayidx41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv54
  br i1 %cmp532, label %for.cond4.preheader.us.preheader, label %vector.memcheck

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

vector.memcheck:                                  ; preds = %for.cond4.preheader.lr.ph
  %scevgep66 = getelementptr [1200 x double], [1200 x double]* %B, i64 %0, i64 0
  %scevgep64 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv54, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep66
  %bound1 = icmp ult double* %scevgep64, %scevgep62
  %found.conflict = and i1 %bound0, %bound1
  %bound069 = icmp ult double* %scevgep, %arrayidx41
  %bound170 = icmp ult double* %arrayidx41, %scevgep62
  %found.conflict71 = and i1 %bound069, %bound170
  %conflict.rdx = or i1 %found.conflict, %found.conflict71
  br i1 %conflict.rdx, label %for.cond4.preheader.preheader, label %vector.ph

for.cond4.preheader.preheader:                    ; preds = %vector.memcheck
  br label %for.cond4.preheader

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %index
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !8, !noalias !11
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !8, !noalias !11
  %5 = fmul <2 x double> %wide.load, %broadcast.splat75
  %6 = fmul <2 x double> %wide.load73, %broadcast.splat75
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv54, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !14
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !14
  %11 = fmul <2 x double> %wide.load76, %broadcast.splat79
  %12 = fmul <2 x double> %wide.load77, %broadcast.splat79
  %13 = load double, double* %arrayidx41, align 8, !alias.scope !15
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %13, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fmul <2 x double> %11, %15
  %19 = fmul <2 x double> %12, %17
  %20 = fadd <2 x double> %5, %18
  %21 = fadd <2 x double> %6, %19
  %22 = fadd <2 x double> %broadcast.splat81, %20
  %23 = fadd <2 x double> %broadcast.splat81, %21
  %24 = bitcast double* %1 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8, !alias.scope !8, !noalias !11
  %25 = bitcast double* %3 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %26 = icmp eq i64 %index.next, 1200
  br i1 %26, label %for.inc53.loopexit85, label %vector.body, !llvm.loop !16

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.cond4.for.end_crit_edge.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.cond4.for.end_crit_edge.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv50
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.body6.us, %for.cond4.preheader.us
  %indvars.iv44 = phi i64 [ 0, %for.cond4.preheader.us ], [ %indvars.iv.next45, %for.body6.us ]
  %temp2.034.us = phi double [ 0.000000e+00, %for.cond4.preheader.us ], [ %add27.us, %for.body6.us ]
  %27 = load double, double* %arrayidx8.us, align 8
  %mul.us = fmul double %27, %alpha
  %arrayidx12.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv44
  %28 = load double, double* %arrayidx12.us, align 8
  %mul13.us = fmul double %mul.us, %28
  %arrayidx17.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv44, i64 %indvars.iv50
  %29 = load double, double* %arrayidx17.us, align 8
  %add.us = fadd double %29, %mul13.us
  store double %add.us, double* %arrayidx17.us, align 8
  %arrayidx21.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv50
  %30 = load double, double* %arrayidx21.us, align 8
  %31 = load double, double* %arrayidx12.us, align 8
  %mul26.us = fmul double %30, %31
  %add27.us = fadd double %temp2.034.us, %mul26.us
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next45, %indvars.iv54
  br i1 %exitcond49, label %for.cond4.for.end_crit_edge.us, label %for.body6.us

for.cond4.for.end_crit_edge.us:                   ; preds = %for.body6.us
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv50
  %32 = load double, double* %arrayidx31.us, align 8
  %mul32.us = fmul double %32, %beta
  %33 = load double, double* %arrayidx8.us, align 8
  %mul37.us = fmul double %33, %alpha
  %34 = load double, double* %arrayidx41, align 8
  %mul42.us = fmul double %mul37.us, %34
  %add43.us = fadd double %mul32.us, %mul42.us
  %mul44.us = fmul double %add27.us, %alpha
  %add45.us = fadd double %mul44.us, %add43.us
  store double %add45.us, double* %arrayidx31.us, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, 1200
  br i1 %exitcond53, label %for.inc53.loopexit, label %for.cond4.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader, %for.cond4.preheader.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next.1, %for.cond4.preheader ]
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv
  %35 = load double, double* %arrayidx31, align 8
  %mul32 = fmul double %35, %beta
  %arrayidx36 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv
  %36 = load double, double* %arrayidx36, align 8
  %mul37 = fmul double %36, %alpha
  %37 = load double, double* %arrayidx41, align 8
  %mul42 = fmul double %mul37, %37
  %add43 = fadd double %mul32, %mul42
  %add45 = fadd double %mul44, %add43
  store double %add45, double* %arrayidx31, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx31.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.next
  %38 = load double, double* %arrayidx31.1, align 8
  %mul32.1 = fmul double %38, %beta
  %arrayidx36.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv.next
  %39 = load double, double* %arrayidx36.1, align 8
  %mul37.1 = fmul double %39, %alpha
  %40 = load double, double* %arrayidx41, align 8
  %mul42.1 = fmul double %mul37.1, %40
  %add43.1 = fadd double %mul32.1, %mul42.1
  %add45.1 = fadd double %mul44, %add43.1
  store double %add45.1, double* %arrayidx31.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %for.inc53.loopexit84, label %for.cond4.preheader, !llvm.loop !17

for.inc53.loopexit:                               ; preds = %for.cond4.for.end_crit_edge.us
  br label %for.inc53

for.inc53.loopexit84:                             ; preds = %for.cond4.preheader
  br label %for.inc53

for.inc53.loopexit85:                             ; preds = %vector.body
  br label %for.inc53

for.inc53:                                        ; preds = %for.inc53.loopexit85, %for.inc53.loopexit84, %for.inc53.loopexit
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, 1000
  br i1 %exitcond57, label %for.end55, label %for.cond4.preheader.lr.ph

for.end55:                                        ; preds = %for.inc53
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %C) #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next15, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv14, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond18, label %for.end12, label %for.cond2.preheader.us

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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12, !13}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{!12}
!15 = !{!13}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
