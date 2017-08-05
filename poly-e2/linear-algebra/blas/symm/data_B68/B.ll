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
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  call void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call void @kernel_symm(double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  call void @print_array([1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #2 {
for.cond1.preheader.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc16_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv41 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next42, %for.cond1.for.inc16_crit_edge.us ]
  %0 = add nsw i64 %indvars.iv41, 1200
  %1 = trunc i64 %0 to i32
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv38 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next39, %for.inc.us ]
  %2 = add nuw nsw i64 %indvars.iv38, %indvars.iv41
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv41, i64 %indvars.iv38
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = trunc i64 %indvars.iv38 to i32
  %sub.us = sub i32 %1, %4
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv41, i64 %indvars.iv38
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond = icmp eq i64 %indvars.iv.next39, 1200
  br i1 %exitcond, label %for.cond1.for.inc16_crit_edge.us, label %for.inc.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next42, 1000
  br i1 %exitcond53, label %for.inc36.lr.ph.preheader, label %for.cond1.preheader.us

for.inc36.lr.ph.preheader:                        ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.inc36.lr.ph

for.inc36.lr.ph:                                  ; preds = %for.inc36.lr.ph.preheader, %for.inc51
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.inc51 ], [ 1, %for.inc36.lr.ph.preheader ]
  %indvars.iv49 = phi i3 [ %indvars.iv.next50, %for.inc51 ], [ -1, %for.inc36.lr.ph.preheader ]
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.inc51 ], [ 2, %for.inc36.lr.ph.preheader ]
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.inc51 ], [ 0, %for.inc36.lr.ph.preheader ]
  %indvar = phi i32 [ %11, %for.inc51 ], [ 0, %for.inc36.lr.ph.preheader ]
  %5 = zext i3 %indvars.iv49 to i64
  %6 = add nuw nsw i64 %5, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = add i64 %indvars.iv47, %7
  %9 = sub i32 1007, %indvar
  %10 = sub i32 998, %indvar
  %11 = add nuw nsw i32 %indvar, 1
  %xtraiter = and i32 %11, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc36.prol.loopexit.unr-lcssa, label %for.inc36.prol.preheader

for.inc36.prol.preheader:                         ; preds = %for.inc36.lr.ph
  %12 = trunc i64 %indvars.iv36 to i32
  %rem28.prol = srem i32 %12, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.inc36.prol.loopexit.unr-lcssa

for.inc36.prol.loopexit.unr-lcssa:                ; preds = %for.inc36.lr.ph, %for.inc36.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc36.prol.preheader ], [ 0, %for.inc36.lr.ph ]
  %13 = icmp eq i32 %indvar, 0
  br i1 %13, label %for.cond40.preheader, label %for.inc36.preheader

for.inc36.preheader:                              ; preds = %for.inc36.prol.loopexit.unr-lcssa
  br label %for.inc36

for.cond40.preheader.loopexit:                    ; preds = %for.inc36
  br label %for.cond40.preheader

for.cond40.preheader:                             ; preds = %for.cond40.preheader.loopexit, %for.inc36.prol.loopexit.unr-lcssa
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %cmp419 = icmp slt i64 %indvars.iv.next37, 1000
  br i1 %cmp419, label %for.inc48.lr.ph, label %for.end53

for.inc48.lr.ph:                                  ; preds = %for.cond40.preheader
  %xtraiter32 = and i32 %9, 7
  %lcmp.mod33 = icmp eq i32 %xtraiter32, 0
  br i1 %lcmp.mod33, label %for.inc48.prol.loopexit, label %for.inc48.prol.preheader

for.inc48.prol.preheader:                         ; preds = %for.inc48.lr.ph
  br label %for.inc48.prol

for.inc48.prol:                                   ; preds = %for.inc48.prol.preheader, %for.inc48.prol
  %indvars.iv30.prol = phi i64 [ %indvars.iv.next31.prol, %for.inc48.prol ], [ %indvars.iv51, %for.inc48.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc48.prol ], [ %xtraiter32, %for.inc48.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv30.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next31.prol = add nuw nsw i64 %indvars.iv30.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc48.prol.loopexit.loopexit, label %for.inc48.prol, !llvm.loop !1

for.inc48.prol.loopexit.loopexit:                 ; preds = %for.inc48.prol
  br label %for.inc48.prol.loopexit

for.inc48.prol.loopexit:                          ; preds = %for.inc48.prol.loopexit.loopexit, %for.inc48.lr.ph
  %indvars.iv30.unr = phi i64 [ %indvars.iv51, %for.inc48.lr.ph ], [ %8, %for.inc48.prol.loopexit.loopexit ]
  %14 = icmp ult i32 %10, 7
  br i1 %14, label %for.inc51, label %for.inc48.preheader

for.inc48.preheader:                              ; preds = %for.inc48.prol.loopexit
  br label %for.inc48

for.inc36:                                        ; preds = %for.inc36.preheader, %for.inc36
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc36 ], [ %indvars.iv.unr.ph, %for.inc36.preheader ]
  %15 = add nsw i64 %indvars.iv, %indvars.iv36
  %16 = trunc i64 %15 to i32
  %rem28 = srem i32 %16, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %17 = add nsw i64 %indvars.iv.next, %indvars.iv36
  %18 = trunc i64 %17 to i32
  %rem28.1 = srem i32 %18, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, 1.000000e+03
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv51
  br i1 %exitcond.1, label %for.cond40.preheader.loopexit, label %for.inc36

for.inc48:                                        ; preds = %for.inc48.preheader, %for.inc48
  %indvars.iv30 = phi i64 [ %indvars.iv.next31.7, %for.inc48 ], [ %indvars.iv30.unr, %for.inc48.preheader ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv30
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next31 = add nsw i64 %indvars.iv30, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next31
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next31.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next31.2 = add nsw i64 %indvars.iv30, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next31.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next31.3 = add nsw i64 %indvars.iv30, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next31.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next31.4 = add nsw i64 %indvars.iv30, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next31.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next31.5 = add nsw i64 %indvars.iv30, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next31.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next31.6 = add nsw i64 %indvars.iv30, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next31.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next31.7 = add nsw i64 %indvars.iv30, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next31.7 to i32
  %exitcond.7 = icmp eq i32 %lftr.wideiv.7, 1000
  br i1 %exitcond.7, label %for.inc51.loopexit, label %for.inc48

for.inc51.loopexit:                               ; preds = %for.inc48
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %for.inc48.prol.loopexit
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %indvars.iv.next50 = add i3 %indvars.iv49, -1
  br label %for.inc36.lr.ph

for.end53:                                        ; preds = %for.cond40.preheader
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #2 {
for.cond1.preheader.lr.ph:
  %mul44 = fmul double %alpha, 0.000000e+00
  %broadcast.splatinsert15 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat16 = shufflevector <2 x double> %broadcast.splatinsert15, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert19 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat20 = shufflevector <2 x double> %broadcast.splatinsert19, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert21 = insertelement <2 x double> undef, double %mul44, i32 0
  %broadcast.splat22 = shufflevector <2 x double> %broadcast.splatinsert21, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader.lr.ph, %for.inc53
  %indvars.iv36 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next37, %for.inc53 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv36, i64 0
  %0 = add i64 %indvars.iv36, 1
  %scevgep3 = getelementptr [1200 x double], [1200 x double]* %C, i64 %0, i64 0
  %cmp53 = icmp sgt i64 %indvars.iv36, 0
  %arrayidx41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv36
  br i1 %cmp53, label %for.body3.us.preheader, label %vector.memcheck

for.body3.us.preheader:                           ; preds = %for.body3.lr.ph
  br label %for.body3.us

vector.memcheck:                                  ; preds = %for.body3.lr.ph
  %scevgep7 = getelementptr [1200 x double], [1200 x double]* %B, i64 %0, i64 0
  %scevgep5 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv36, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep7
  %bound1 = icmp ult double* %scevgep5, %scevgep3
  %found.conflict = and i1 %bound0, %bound1
  %bound010 = icmp ult double* %scevgep, %arrayidx41
  %bound111 = icmp ult double* %arrayidx41, %scevgep3
  %found.conflict12 = and i1 %bound010, %bound111
  %conflict.rdx = or i1 %found.conflict, %found.conflict12
  br i1 %conflict.rdx, label %for.body3.preheader, label %vector.ph

for.body3.preheader:                              ; preds = %vector.memcheck
  br label %for.body3

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv36, i64 %index
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !3, !noalias !6
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !3, !noalias !6
  %5 = fmul <2 x double> %wide.load, %broadcast.splat16
  %6 = fmul <2 x double> %wide.load14, %broadcast.splat16
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv36, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !9
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !9
  %11 = fmul <2 x double> %wide.load17, %broadcast.splat20
  %12 = fmul <2 x double> %wide.load18, %broadcast.splat20
  %13 = load double, double* %arrayidx41, align 8, !alias.scope !10
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %13, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fmul <2 x double> %11, %15
  %19 = fmul <2 x double> %12, %17
  %20 = fadd <2 x double> %5, %18
  %21 = fadd <2 x double> %6, %19
  %22 = fadd <2 x double> %20, %broadcast.splat22
  %23 = fadd <2 x double> %21, %broadcast.splat22
  %24 = bitcast double* %1 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8, !alias.scope !3, !noalias !6
  %25 = bitcast double* %3 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !3, !noalias !6
  %index.next = add i64 %index, 4
  %26 = icmp eq i64 %index.next, 1200
  br i1 %26, label %for.inc53.loopexit26, label %vector.body, !llvm.loop !11

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.cond4.for.inc50_crit_edge.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.cond4.for.inc50_crit_edge.us ], [ 0, %for.body3.us.preheader ]
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv36, i64 %indvars.iv26
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.body3.us
  %indvars.iv20 = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next21, %for.inc.us ]
  %add275.us = phi double [ 0.000000e+00, %for.body3.us ], [ %add27.us, %for.inc.us ]
  %27 = load double, double* %arrayidx8.us, align 8
  %mul.us = fmul double %27, %alpha
  %arrayidx12.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv20
  %28 = load double, double* %arrayidx12.us, align 8
  %mul13.us = fmul double %mul.us, %28
  %arrayidx17.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 %indvars.iv26
  %29 = load double, double* %arrayidx17.us, align 8
  %add.us = fadd double %mul13.us, %29
  store double %add.us, double* %arrayidx17.us, align 8
  %arrayidx21.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv20, i64 %indvars.iv26
  %30 = load double, double* %arrayidx21.us, align 8
  %31 = load double, double* %arrayidx12.us, align 8
  %mul26.us = fmul double %30, %31
  %add27.us = fadd double %add275.us, %mul26.us
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond = icmp eq i64 %indvars.iv.next21, %indvars.iv36
  br i1 %exitcond, label %for.cond4.for.inc50_crit_edge.us, label %for.inc.us

for.cond4.for.inc50_crit_edge.us:                 ; preds = %for.inc.us
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv36, i64 %indvars.iv26
  %32 = load double, double* %arrayidx31.us, align 8
  %mul32.us = fmul double %32, %beta
  %33 = load double, double* %arrayidx8.us, align 8
  %mul37.us = fmul double %33, %alpha
  %34 = load double, double* %arrayidx41, align 8
  %mul42.us = fmul double %mul37.us, %34
  %add43.us = fadd double %mul32.us, %mul42.us
  %mul44.us = fmul double %add27.us, %alpha
  %add45.us = fadd double %add43.us, %mul44.us
  store double %add45.us, double* %arrayidx31.us, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next27, 1200
  br i1 %exitcond35, label %for.inc53.loopexit, label %for.body3.us

for.body3:                                        ; preds = %for.body3, %for.body3.preheader
  %indvars.iv = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next.1, %for.body3 ]
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv36, i64 %indvars.iv
  %35 = load double, double* %arrayidx31, align 8
  %mul32 = fmul double %35, %beta
  %arrayidx36 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv36, i64 %indvars.iv
  %36 = load double, double* %arrayidx36, align 8
  %mul37 = fmul double %36, %alpha
  %37 = load double, double* %arrayidx41, align 8
  %mul42 = fmul double %mul37, %37
  %add43 = fadd double %mul32, %mul42
  %add45 = fadd double %add43, %mul44
  store double %add45, double* %arrayidx31, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx31.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv36, i64 %indvars.iv.next
  %38 = load double, double* %arrayidx31.1, align 8
  %mul32.1 = fmul double %38, %beta
  %arrayidx36.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv36, i64 %indvars.iv.next
  %39 = load double, double* %arrayidx36.1, align 8
  %mul37.1 = fmul double %39, %alpha
  %40 = load double, double* %arrayidx41, align 8
  %mul42.1 = fmul double %mul37.1, %40
  %add43.1 = fadd double %mul32.1, %mul42.1
  %add45.1 = fadd double %add43.1, %mul44
  store double %add45.1, double* %arrayidx31.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond34.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond34.1, label %for.inc53.loopexit25, label %for.body3, !llvm.loop !14

for.inc53.loopexit:                               ; preds = %for.cond4.for.inc50_crit_edge.us
  br label %for.inc53

for.inc53.loopexit25:                             ; preds = %for.body3
  br label %for.inc53

for.inc53.loopexit26:                             ; preds = %vector.body
  br label %for.inc53

for.inc53:                                        ; preds = %for.inc53.loopexit26, %for.inc53.loopexit25, %for.inc53.loopexit
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next37, 1000
  br i1 %exitcond38, label %for.end55, label %for.body3.lr.ph

for.end55:                                        ; preds = %for.inc53
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* %C) #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv10 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv10, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond13, label %for.end12, label %for.cond2.preheader.us

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
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7, !8}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !5}
!9 = !{!7}
!10 = !{!8}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
