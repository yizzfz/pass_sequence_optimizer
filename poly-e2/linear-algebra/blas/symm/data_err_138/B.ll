; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call1 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %call2 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call void @kernel_symm(i32 1000, i32 1200, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
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
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body.us

for.body.us:                                      ; preds = %entry, %for.cond1.for.inc16_crit_edge.us
  %indvars.iv36 = phi i64 [ 0, %entry ], [ %indvars.iv.next37, %for.cond1.for.inc16_crit_edge.us ]
  %0 = add i64 %indvars.iv36, 1200
  %1 = trunc i64 %0 to i32
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.body.us
  %indvars.iv32 = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next33, %for.inc.us ]
  %2 = add nsw i64 %indvars.iv32, %indvars.iv36
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv36, i64 %indvars.iv32
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = trunc i64 %indvars.iv32 to i32
  %sub.us = sub i32 %1, %4
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv36, i64 %indvars.iv32
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond = icmp eq i64 %indvars.iv.next33, 1200
  br i1 %exitcond, label %for.cond1.for.inc16_crit_edge.us, label %for.inc.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %cmp.us = icmp slt i64 %indvars.iv.next37, 1000
  br i1 %cmp.us, label %for.body.us, label %for.body22.preheader

for.body22.preheader:                             ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.body22

for.body22:                                       ; preds = %for.body22.preheader, %for.inc51
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %for.inc51 ], [ 0, %for.body22.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %for.inc51 ], [ 1, %for.body22.preheader ]
  %indvar = phi i32 [ %7, %for.inc51 ], [ 0, %for.body22.preheader ]
  %indvars.iv20 = phi i32 [ %indvars.iv.next21, %for.inc51 ], [ 1, %for.body22.preheader ]
  %5 = sub i32 1007, %indvar
  %6 = sub i32 998, %indvar
  %7 = add i32 %indvar, 1
  %cmp242 = icmp sgt i64 %indvars.iv30, -1
  br i1 %cmp242, label %for.inc36.lr.ph, label %for.end38

for.inc36.lr.ph:                                  ; preds = %for.body22
  %xtraiter = and i32 %7, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc36.prol.loopexit.unr-lcssa, label %for.inc36.prol.preheader

for.inc36.prol.preheader:                         ; preds = %for.inc36.lr.ph
  %8 = trunc i64 %indvars.iv30 to i32
  %rem28.prol = srem i32 %8, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv30, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.inc36.prol.loopexit.unr-lcssa

for.inc36.prol.loopexit.unr-lcssa:                ; preds = %for.inc36.lr.ph, %for.inc36.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc36.prol.preheader ], [ 0, %for.inc36.lr.ph ]
  %9 = icmp eq i32 %indvar, 0
  br i1 %9, label %for.end38, label %for.inc36.preheader

for.inc36.preheader:                              ; preds = %for.inc36.prol.loopexit.unr-lcssa
  %wide.trip.count = zext i32 %indvars.iv20 to i64
  br label %for.inc36

for.inc36:                                        ; preds = %for.inc36.preheader, %for.inc36
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc36 ], [ %indvars.iv.unr.ph, %for.inc36.preheader ]
  %10 = add nsw i64 %indvars.iv, %indvars.iv30
  %11 = trunc i64 %10 to i32
  %rem28 = srem i32 %11, 100
  %conv29 = sitofp i32 %rem28 to double
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = add nsw i64 %indvars.iv.next, %indvars.iv30
  %13 = trunc i64 %12 to i32
  %rem28.1 = srem i32 %13, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.v.i0.1 = insertelement <2 x double> undef, double %conv29, i32 0
  %div31.v.i0.2 = insertelement <2 x double> %div31.v.i0.1, double %conv29.1, i32 1
  %div31 = fdiv <2 x double> %div31.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %arrayidx35 to <2 x double>*
  store <2 x double> %div31, <2 x double>* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %for.end38.loopexit, label %for.inc36

for.end38.loopexit:                               ; preds = %for.inc36
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.inc36.prol.loopexit.unr-lcssa, %for.body22
  %indvars.iv.next31 = add nsw i64 %indvars.iv30, 1
  %cmp414 = icmp slt i64 %indvars.iv.next31, 1000
  br i1 %cmp414, label %for.inc48.lr.ph, label %for.end53

for.inc48.lr.ph:                                  ; preds = %for.end38
  %xtraiter26 = and i32 %5, 7
  %lcmp.mod27 = icmp eq i32 %xtraiter26, 0
  br i1 %lcmp.mod27, label %for.inc48.prol.loopexit, label %for.inc48.prol.preheader

for.inc48.prol.preheader:                         ; preds = %for.inc48.lr.ph
  br label %for.inc48.prol

for.inc48.prol:                                   ; preds = %for.inc48.prol.preheader, %for.inc48.prol
  %indvars.iv24.prol = phi i64 [ %indvars.iv.next25.prol, %for.inc48.prol ], [ %indvars.iv22, %for.inc48.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc48.prol ], [ %xtraiter26, %for.inc48.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv24.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next25.prol = add nsw i64 %indvars.iv24.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc48.prol.loopexit.loopexit, label %for.inc48.prol, !llvm.loop !1

for.inc48.prol.loopexit.loopexit:                 ; preds = %for.inc48.prol
  br label %for.inc48.prol.loopexit

for.inc48.prol.loopexit:                          ; preds = %for.inc48.prol.loopexit.loopexit, %for.inc48.lr.ph
  %indvars.iv24.unr = phi i64 [ %indvars.iv22, %for.inc48.lr.ph ], [ %indvars.iv.next25.prol, %for.inc48.prol.loopexit.loopexit ]
  %15 = icmp ult i32 %6, 7
  br i1 %15, label %for.inc51, label %for.inc48.preheader

for.inc48.preheader:                              ; preds = %for.inc48.prol.loopexit
  br label %for.inc48

for.inc48:                                        ; preds = %for.inc48.preheader, %for.inc48
  %indvars.iv24 = phi i64 [ %indvars.iv.next25.7, %for.inc48 ], [ %indvars.iv24.unr, %for.inc48.preheader ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv24
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next25 = add nsw i64 %indvars.iv24, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv.next25
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv.next25.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next25.2 = add nsw i64 %indvars.iv24, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv.next25.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next25.3 = add nsw i64 %indvars.iv24, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv.next25.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next25.4 = add nsw i64 %indvars.iv24, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv.next25.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next25.5 = add nsw i64 %indvars.iv24, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv.next25.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next25.6 = add nsw i64 %indvars.iv24, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv.next25.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next25.7 = add nsw i64 %indvars.iv24, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next25.7 to i32
  %exitcond.7 = icmp eq i32 %lftr.wideiv.7, 1000
  br i1 %exitcond.7, label %for.inc51.loopexit, label %for.inc48

for.inc51.loopexit:                               ; preds = %for.inc48
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %for.inc48.prol.loopexit
  %16 = icmp slt i64 %indvars.iv.next31, 1000
  %indvars.iv.next21 = add i32 %indvars.iv20, 1
  %indvars.iv.next23 = add nsw i64 %indvars.iv22, 1
  br i1 %16, label %for.body22, label %for.end53

for.end53:                                        ; preds = %for.end38, %for.inc51
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #0 {
entry:
  %mul44 = fmul double %alpha, 0.000000e+00
  %broadcast.splatinsert50 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat51 = shufflevector <2 x double> %broadcast.splatinsert50, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert54 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat55 = shufflevector <2 x double> %broadcast.splatinsert54, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert56 = insertelement <2 x double> undef, double %mul44, i32 0
  %broadcast.splat57 = shufflevector <2 x double> %broadcast.splatinsert56, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc53
  %indvars.iv32 = phi i64 [ 0, %entry ], [ %indvars.iv.next33, %for.inc53 ]
  %indvars.iv28 = phi i32 [ 0, %entry ], [ %indvars.iv.next29, %for.inc53 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv32, i64 0
  %0 = add i64 %indvars.iv32, 1
  %scevgep38 = getelementptr [1200 x double], [1200 x double]* %C, i64 %0, i64 0
  %arrayidx41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv32, i64 %indvars.iv32
  %cmp51 = icmp sgt i64 %indvars.iv32, 0
  br i1 %cmp51, label %for.body3.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body
  %scevgep42 = getelementptr [1200 x double], [1200 x double]* %B, i64 %0, i64 0
  %scevgep40 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv32, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep42
  %bound1 = icmp ult double* %scevgep40, %scevgep38
  %found.conflict = and i1 %bound0, %bound1
  %bound045 = icmp ult double* %scevgep, %arrayidx41
  %bound146 = icmp ult double* %arrayidx41, %scevgep38
  %found.conflict47 = and i1 %bound045, %bound146
  %conflict.rdx = or i1 %found.conflict, %found.conflict47
  br i1 %conflict.rdx, label %for.body3.preheader, label %vector.ph

for.body3.preheader:                              ; preds = %vector.memcheck
  br label %for.body3

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv32, i64 %index
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !3, !noalias !6
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !3, !noalias !6
  %5 = fmul <2 x double> %wide.load, %broadcast.splat51
  %6 = fmul <2 x double> %wide.load49, %broadcast.splat51
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv32, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !9
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !9
  %11 = fmul <2 x double> %wide.load52, %broadcast.splat55
  %12 = fmul <2 x double> %wide.load53, %broadcast.splat55
  %13 = load double, double* %arrayidx41, align 8, !alias.scope !10
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %13, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fmul <2 x double> %11, %15
  %19 = fmul <2 x double> %12, %17
  %20 = fadd <2 x double> %5, %18
  %21 = fadd <2 x double> %6, %19
  %22 = fadd <2 x double> %20, %broadcast.splat57
  %23 = fadd <2 x double> %21, %broadcast.splat57
  %24 = bitcast double* %1 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8, !alias.scope !3, !noalias !6
  %25 = bitcast double* %3 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !3, !noalias !6
  %index.next = add i64 %index, 4
  %26 = icmp eq i64 %index.next, 1200
  br i1 %26, label %for.inc53.loopexit61, label %vector.body, !llvm.loop !11

for.body3.us.preheader:                           ; preds = %for.body
  %wide.trip.count24 = zext i32 %indvars.iv28 to i64
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.cond4.for.inc50_crit_edge.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.cond4.for.inc50_crit_edge.us ], [ 0, %for.body3.us.preheader ]
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv32, i64 %indvars.iv26
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.body3.us
  %indvars.iv18 = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next19, %for.inc.us ]
  %add273.us = phi double [ 0.000000e+00, %for.body3.us ], [ %add27.us, %for.inc.us ]
  %27 = load double, double* %arrayidx8.us, align 8
  %mul.us = fmul double %27, %alpha
  %arrayidx12.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv32, i64 %indvars.iv18
  %28 = load double, double* %arrayidx12.us, align 8
  %mul13.us = fmul double %mul.us, %28
  %arrayidx17.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv18, i64 %indvars.iv26
  %29 = load double, double* %arrayidx17.us, align 8
  %add.us = fadd double %mul13.us, %29
  store double %add.us, double* %arrayidx17.us, align 8
  %arrayidx21.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv18, i64 %indvars.iv26
  %30 = load double, double* %arrayidx21.us, align 8
  %31 = load double, double* %arrayidx12.us, align 8
  %mul26.us = fmul double %30, %31
  %add27.us = fadd double %add273.us, %mul26.us
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next19, %wide.trip.count24
  br i1 %exitcond25, label %for.cond4.for.inc50_crit_edge.us, label %for.inc.us

for.cond4.for.inc50_crit_edge.us:                 ; preds = %for.inc.us
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv32, i64 %indvars.iv26
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
  %exitcond31 = icmp eq i64 %indvars.iv.next27, 1200
  br i1 %exitcond31, label %for.inc53.loopexit, label %for.body3.us

for.body3:                                        ; preds = %for.body3, %for.body3.preheader
  %indvars.iv = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next.1, %for.body3 ]
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv32, i64 %indvars.iv
  %35 = load double, double* %arrayidx31, align 8
  %mul32 = fmul double %35, %beta
  %arrayidx36 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv32, i64 %indvars.iv
  %36 = load double, double* %arrayidx36, align 8
  %mul37 = fmul double %36, %alpha
  %37 = load double, double* %arrayidx41, align 8
  %mul42 = fmul double %mul37, %37
  %add43 = fadd double %mul32, %mul42
  %add45 = fadd double %add43, %mul44
  store double %add45, double* %arrayidx31, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx31.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv32, i64 %indvars.iv.next
  %38 = load double, double* %arrayidx31.1, align 8
  %mul32.1 = fmul double %38, %beta
  %arrayidx36.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv32, i64 %indvars.iv.next
  %39 = load double, double* %arrayidx36.1, align 8
  %mul37.1 = fmul double %39, %alpha
  %40 = load double, double* %arrayidx41, align 8
  %mul42.1 = fmul double %mul37.1, %40
  %add43.1 = fadd double %mul32.1, %mul42.1
  %add45.1 = fadd double %add43.1, %mul44
  store double %add45.1, double* %arrayidx31.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %for.inc53.loopexit60, label %for.body3, !llvm.loop !14

for.inc53.loopexit:                               ; preds = %for.cond4.for.inc50_crit_edge.us
  br label %for.inc53

for.inc53.loopexit60:                             ; preds = %for.body3
  br label %for.inc53

for.inc53.loopexit61:                             ; preds = %vector.body
  br label %for.inc53

for.inc53:                                        ; preds = %for.inc53.loopexit61, %for.inc53.loopexit60, %for.inc53.loopexit
  %indvars.iv.next33 = add nsw i64 %indvars.iv32, 1
  %indvars.iv.next29 = add i32 %indvars.iv28, 1
  %cmp = icmp slt i64 %indvars.iv.next33, 1000
  br i1 %cmp, label %for.body, label %for.end55

for.end55:                                        ; preds = %for.inc53
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %m, i32 %n, [1200 x double]* %C) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.body.us

for.body.us:                                      ; preds = %entry, %for.cond2.for.inc10_crit_edge.us
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv10, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %cmp.us = icmp slt i64 %indvars.iv.next11, 1000
  br i1 %cmp.us, label %for.body.us, label %for.end12

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

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
