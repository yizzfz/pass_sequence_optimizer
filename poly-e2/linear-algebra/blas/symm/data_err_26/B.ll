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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  %arraydecay7 = bitcast i8* %call2 to [1200 x double]*
  call fastcc void @kernel_symm(i32 1000, i32 1200, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay7)
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
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc16_crit_edge.us
  %indvars.iv40 = phi i64 [ 0, %entry ], [ %indvars.iv.next41, %for.cond1.for.inc16_crit_edge.us ]
  %0 = add nsw i64 %indvars.iv40, 1200
  %1 = trunc i64 %0 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.cond1.preheader.us, %for.body3.us
  %indvars.iv37 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next38, %for.body3.us ]
  %2 = add nsw i64 %indvars.iv40, %indvars.iv37
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv40, i64 %indvars.iv37
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = trunc i64 %indvars.iv37 to i32
  %sub.us = sub i32 %1, %4
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv40, i64 %indvars.iv37
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next38, 1200
  br i1 %cmp2.us, label %for.body3.us, label %for.cond1.for.inc16_crit_edge.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next41 = add nsw i64 %indvars.iv40, 1
  %cmp.us = icmp slt i64 %indvars.iv.next41, 1000
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond23.preheader.preheader

for.cond23.preheader.preheader:                   ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.cond23.preheader

for.cond23.preheader:                             ; preds = %for.cond23.preheader.preheader, %for.inc51
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %for.inc51 ], [ 0, %for.cond23.preheader.preheader ]
  %indvar = phi i32 [ %indvar.next, %for.inc51 ], [ 0, %for.cond23.preheader.preheader ]
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %for.inc51 ], [ 1, %for.cond23.preheader.preheader ]
  %indvars.iv28 = phi i32 [ %indvars.iv.next29, %for.inc51 ], [ 1, %for.cond23.preheader.preheader ]
  %5 = sub i32 1007, %indvar
  %6 = sub i32 998, %indvar
  %cmp246 = icmp slt i64 %indvars.iv35, 0
  br i1 %cmp246, label %for.cond40.preheader, label %for.body26.preheader

for.body26.preheader:                             ; preds = %for.cond23.preheader
  %wide.trip.count = zext i32 %indvars.iv28 to i64
  %7 = and i64 %indvars.iv35, 1
  %lcmp.mod48 = icmp eq i64 %7, 0
  br i1 %lcmp.mod48, label %for.body26.prol, label %for.body26.prol.loopexit

for.body26.prol:                                  ; preds = %for.body26.preheader
  %8 = trunc i64 %indvars.iv35 to i32
  %rem28.prol = srem i32 %8, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit

for.body26.prol.loopexit:                         ; preds = %for.body26.prol, %for.body26.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body26.prol ], [ 0, %for.body26.preheader ]
  %9 = icmp eq i64 %indvars.iv35, 0
  br i1 %9, label %for.cond40.preheader, label %for.body26.preheader.new

for.body26.preheader.new:                         ; preds = %for.body26.prol.loopexit
  br label %for.body26

for.cond40.preheader.loopexit:                    ; preds = %for.body26
  br label %for.cond40.preheader

for.cond40.preheader:                             ; preds = %for.cond40.preheader.loopexit, %for.body26.prol.loopexit, %for.cond23.preheader
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %cmp4110 = icmp slt i64 %indvars.iv.next36, 1000
  br i1 %cmp4110, label %for.body43.lr.ph, label %for.end53

for.body43.lr.ph:                                 ; preds = %for.cond40.preheader
  %xtraiter = and i32 %5, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body43.prol.loopexit, label %for.body43.prol.preheader

for.body43.prol.preheader:                        ; preds = %for.body43.lr.ph
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol.preheader, %for.body43.prol
  %indvars.iv32.prol = phi i64 [ %indvars.iv.next33.prol, %for.body43.prol ], [ %indvars.iv30, %for.body43.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body43.prol ], [ %xtraiter, %for.body43.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv32.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next33.prol = add nsw i64 %indvars.iv32.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol, !llvm.loop !1

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol.loopexit.loopexit, %for.body43.lr.ph
  %indvars.iv32.unr = phi i64 [ %indvars.iv30, %for.body43.lr.ph ], [ %indvars.iv.next33.prol, %for.body43.prol.loopexit.loopexit ]
  %10 = icmp ult i32 %6, 7
  br i1 %10, label %for.inc51, label %for.body43.preheader

for.body43.preheader:                             ; preds = %for.body43.prol.loopexit
  br label %for.body43

for.body26:                                       ; preds = %for.body26, %for.body26.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body26.preheader.new ], [ %indvars.iv.next.1, %for.body26 ]
  %11 = add nsw i64 %indvars.iv35, %indvars.iv
  %12 = trunc i64 %11 to i32
  %rem28 = srem i32 %12, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = add nsw i64 %indvars.iv35, %indvars.iv.next
  %14 = trunc i64 %13 to i32
  %rem28.1 = srem i32 %14, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, 1.000000e+03
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %for.cond40.preheader.loopexit, label %for.body26

for.body43:                                       ; preds = %for.body43.preheader, %for.body43
  %indvars.iv32 = phi i64 [ %indvars.iv.next33.7, %for.body43 ], [ %indvars.iv32.unr, %for.body43.preheader ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv32
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next33 = add nsw i64 %indvars.iv32, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv.next33
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next33.1 = add nsw i64 %indvars.iv32, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv.next33.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next33.2 = add nsw i64 %indvars.iv32, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv.next33.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next33.3 = add nsw i64 %indvars.iv32, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv.next33.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next33.4 = add nsw i64 %indvars.iv32, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv.next33.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next33.5 = add nsw i64 %indvars.iv32, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv.next33.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next33.6 = add nsw i64 %indvars.iv32, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv.next33.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next33.7 = add nsw i64 %indvars.iv32, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next33.7 to i32
  %exitcond34.7 = icmp eq i32 %lftr.wideiv.7, 1000
  br i1 %exitcond34.7, label %for.inc51.loopexit, label %for.body43

for.inc51.loopexit:                               ; preds = %for.body43
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %for.body43.prol.loopexit
  %15 = icmp slt i64 %indvars.iv.next36, 1000
  %indvars.iv.next29 = add i32 %indvars.iv28, 1
  %indvars.iv.next31 = add nsw i64 %indvars.iv30, 1
  %indvar.next = add i32 %indvar, 1
  br i1 %15, label %for.cond23.preheader, label %for.end53

for.end53:                                        ; preds = %for.cond40.preheader, %for.inc51
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  %mul44 = fmul double %alpha, 0.000000e+00
  %broadcast.splatinsert49 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat50 = shufflevector <2 x double> %broadcast.splatinsert49, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert53 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat54 = shufflevector <2 x double> %broadcast.splatinsert53, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert55 = insertelement <2 x double> undef, double %mul44, i32 0
  %broadcast.splat56 = shufflevector <2 x double> %broadcast.splatinsert55, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc53
  %indvars.iv31 = phi i64 [ 0, %entry ], [ %indvars.iv.next32, %for.inc53 ]
  %indvars.iv29 = phi i32 [ 0, %entry ], [ %indvars.iv.next30, %for.inc53 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv31, i64 0
  %0 = add i64 %indvars.iv31, 1
  %scevgep37 = getelementptr [1200 x double], [1200 x double]* %C, i64 %0, i64 0
  %cmp53 = icmp sgt i64 %indvars.iv31, 0
  br i1 %cmp53, label %for.body3.us.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %scevgep41 = getelementptr [1200 x double], [1200 x double]* %B, i64 %0, i64 0
  %scevgep39 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv31, i64 0
  %arrayidx41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv31
  %bound0 = icmp ult double* %scevgep, %scevgep41
  %bound1 = icmp ult double* %scevgep39, %scevgep37
  %found.conflict = and i1 %bound0, %bound1
  %bound044 = icmp ult double* %scevgep, %arrayidx41
  %bound145 = icmp ult double* %arrayidx41, %scevgep37
  %found.conflict46 = and i1 %bound044, %bound145
  %conflict.rdx = or i1 %found.conflict, %found.conflict46
  br i1 %conflict.rdx, label %for.body3.preheader57, label %vector.ph

for.body3.preheader57:                            ; preds = %for.body3.preheader
  br label %for.body3

vector.ph:                                        ; preds = %for.body3.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv31, i64 %index
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !3, !noalias !6
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !3, !noalias !6
  %5 = fmul <2 x double> %wide.load, %broadcast.splat50
  %6 = fmul <2 x double> %wide.load48, %broadcast.splat50
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv31, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !9
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !9
  %11 = fmul <2 x double> %wide.load51, %broadcast.splat54
  %12 = fmul <2 x double> %wide.load52, %broadcast.splat54
  %13 = load double, double* %arrayidx41, align 8, !alias.scope !10
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %13, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fmul <2 x double> %11, %15
  %19 = fmul <2 x double> %12, %17
  %20 = fadd <2 x double> %5, %18
  %21 = fadd <2 x double> %6, %19
  %22 = fadd <2 x double> %20, %broadcast.splat56
  %23 = fadd <2 x double> %21, %broadcast.splat56
  %24 = bitcast double* %1 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8, !alias.scope !3, !noalias !6
  %25 = bitcast double* %3 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !3, !noalias !6
  %index.next = add i64 %index, 4
  %26 = icmp eq i64 %index.next, 1200
  br i1 %26, label %for.inc53.loopexit61, label %vector.body, !llvm.loop !11

for.body3.us.preheader:                           ; preds = %for.cond1.preheader
  %wide.trip.count = zext i32 %indvars.iv29 to i64
  %arrayidx41.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv31
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.cond4.for.end_crit_edge.us
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for.cond4.for.end_crit_edge.us ], [ 0, %for.body3.us.preheader ]
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv31, i64 %indvars.iv27
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.body6.us, %for.body3.us
  %indvars.iv21 = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next22, %for.body6.us ]
  %add276.us = phi double [ 0.000000e+00, %for.body3.us ], [ %add27.us, %for.body6.us ]
  %27 = load double, double* %arrayidx8.us, align 8
  %mul.us = fmul double %27, %alpha
  %arrayidx12.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv21
  %28 = load double, double* %arrayidx12.us, align 8
  %mul13.us = fmul double %mul.us, %28
  %arrayidx17.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv21, i64 %indvars.iv27
  %29 = load double, double* %arrayidx17.us, align 8
  %add.us = fadd double %mul13.us, %29
  store double %add.us, double* %arrayidx17.us, align 8
  %arrayidx21.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv21, i64 %indvars.iv27
  %30 = load double, double* %arrayidx21.us, align 8
  %31 = load double, double* %arrayidx12.us, align 8
  %mul26.us = fmul double %30, %31
  %add27.us = fadd double %add276.us, %mul26.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond = icmp eq i64 %indvars.iv.next22, %wide.trip.count
  br i1 %exitcond, label %for.cond4.for.end_crit_edge.us, label %for.body6.us

for.cond4.for.end_crit_edge.us:                   ; preds = %for.body6.us
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv31, i64 %indvars.iv27
  %32 = load double, double* %arrayidx31.us, align 8
  %mul32.us = fmul double %32, %beta
  %33 = load double, double* %arrayidx8.us, align 8
  %mul37.us = fmul double %33, %alpha
  %34 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %mul37.us, %34
  %add43.us = fadd double %mul32.us, %mul42.us
  %mul44.us = fmul double %add27.us, %alpha
  %add45.us = fadd double %add43.us, %mul44.us
  store double %add45.us, double* %arrayidx31.us, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next28, 1200
  br i1 %cmp2.us, label %for.body3.us, label %for.inc53.loopexit

for.body3:                                        ; preds = %for.body3, %for.body3.preheader57
  %indvars.iv = phi i64 [ 0, %for.body3.preheader57 ], [ %indvars.iv.next.1, %for.body3 ]
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv31, i64 %indvars.iv
  %35 = load double, double* %arrayidx31, align 8
  %mul32 = fmul double %35, %beta
  %arrayidx36 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv31, i64 %indvars.iv
  %36 = load double, double* %arrayidx36, align 8
  %mul37 = fmul double %36, %alpha
  %37 = load double, double* %arrayidx41, align 8
  %mul42 = fmul double %mul37, %37
  %add43 = fadd double %mul32, %mul42
  %add45 = fadd double %add43, %mul44
  store double %add45, double* %arrayidx31, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx31.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv31, i64 %indvars.iv.next
  %38 = load double, double* %arrayidx31.1, align 8
  %mul32.1 = fmul double %38, %beta
  %arrayidx36.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv31, i64 %indvars.iv.next
  %39 = load double, double* %arrayidx36.1, align 8
  %mul37.1 = fmul double %39, %alpha
  %40 = load double, double* %arrayidx41, align 8
  %mul42.1 = fmul double %mul37.1, %40
  %add43.1 = fadd double %mul32.1, %mul42.1
  %add45.1 = fadd double %add43.1, %mul44
  store double %add45.1, double* %arrayidx31.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %cmp2.1 = icmp slt i64 %indvars.iv.next.1, 1200
  br i1 %cmp2.1, label %for.body3, label %for.inc53.loopexit60, !llvm.loop !14

for.inc53.loopexit:                               ; preds = %for.cond4.for.end_crit_edge.us
  br label %for.inc53

for.inc53.loopexit60:                             ; preds = %for.body3
  br label %for.inc53

for.inc53.loopexit61:                             ; preds = %vector.body
  br label %for.inc53

for.inc53:                                        ; preds = %for.inc53.loopexit61, %for.inc53.loopexit60, %for.inc53.loopexit
  %indvars.iv.next32 = add nsw i64 %indvars.iv31, 1
  %indvars.iv.next30 = add i32 %indvars.iv29, 1
  %cmp = icmp slt i64 %indvars.iv.next32, 1000
  br i1 %cmp, label %for.cond1.preheader, label %for.end55

for.end55:                                        ; preds = %for.inc53
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %entry, %for.cond2.for.inc10_crit_edge.us
  %indvars.iv12 = phi i64 [ 0, %entry ], [ %indvars.iv.next13, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv12, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv12, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, 1
  %cmp.us = icmp slt i64 %indvars.iv.next13, 1000
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

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
