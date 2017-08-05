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
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_symm(i32 1000, i32 1200, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc16_crit_edge.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv60 = phi i64 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %indvars.iv.next61, %for.cond1.for.inc16_crit_edge.us ]
  %0 = add nuw nsw i64 %indvars.iv60, 1200
  %1 = trunc i64 %0 to i32
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %for.inc.us ], [ 0, %for.cond1.preheader.us ]
  %2 = add nuw nsw i64 %indvars.iv56, %indvars.iv60
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv60, i64 %indvars.iv56
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = trunc i64 %indvars.iv56 to i32
  %sub.us = sub i32 %1, %4
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv60, i64 %indvars.iv56
  store double %div11.us, double* %arrayidx15.us, align 8
  %exitcond59 = icmp eq i64 %indvars.iv56, 1199
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  br i1 %exitcond59, label %for.cond1.for.inc16_crit_edge.us, label %for.inc.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond = icmp ne i64 %indvars.iv.next61, 1000
  br i1 %exitcond, label %for.cond1.preheader.us, label %for.inc36.lr.ph.preheader

for.inc36.lr.ph.preheader:                        ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.inc36.lr.ph

for.cond19.loopexit.loopexit:                     ; preds = %for.inc48
  br label %for.cond19.loopexit

for.cond19.loopexit:                              ; preds = %for.cond19.loopexit.loopexit, %middle.block
  %indvars.iv.next49 = add nsw i64 %8, 1
  br label %for.inc36.lr.ph

for.inc36.lr.ph:                                  ; preds = %for.inc36.lr.ph.preheader, %for.cond19.loopexit
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.cond19.loopexit ], [ 0, %for.inc36.lr.ph.preheader ]
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond19.loopexit ], [ 1, %for.inc36.lr.ph.preheader ]
  %5 = shl i64 %indvars.iv54, 32
  %sext = add i64 %5, 4294967296
  %6 = ashr exact i64 %sext, 32
  %7 = sub nsw i64 1000, %6
  %sext66 = shl i64 %indvars.iv48, 32
  %8 = ashr exact i64 %sext66, 32
  %9 = and i64 %indvars.iv54, 1
  %lcmp.mod = icmp eq i64 %9, 0
  br i1 %lcmp.mod, label %for.inc36.prol, label %for.inc36.prol.loopexit

for.inc36.prol:                                   ; preds = %for.inc36.lr.ph
  %10 = trunc i64 %indvars.iv54 to i32
  %rem28.prol = srem i32 %10, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.inc36.prol.loopexit

for.inc36.prol.loopexit:                          ; preds = %for.inc36.prol, %for.inc36.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc36.prol ], [ 0, %for.inc36.lr.ph ]
  %11 = icmp eq i64 %indvars.iv54, 0
  br i1 %11, label %for.end38, label %for.inc36.lr.ph.new

for.inc36.lr.ph.new:                              ; preds = %for.inc36.prol.loopexit
  br label %for.inc36

for.inc36:                                        ; preds = %for.inc36, %for.inc36.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc36.lr.ph.new ], [ %indvars.iv.next.1, %for.inc36 ]
  %12 = add nuw nsw i64 %indvars.iv, %indvars.iv54
  %13 = trunc i64 %12 to i32
  %rem28 = srem i32 %13, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %14 = add nuw nsw i64 %indvars.iv.next, %indvars.iv54
  %15 = trunc i64 %14 to i32
  %rem28.1 = srem i32 %15, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, 1.000000e+03
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %indvars.iv54
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.end38.loopexit, label %for.inc36

for.end38.loopexit:                               ; preds = %for.inc36
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.inc36.prol.loopexit
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %cmp4134 = icmp slt i64 %indvars.iv.next55, 1000
  br i1 %cmp4134, label %for.inc48.preheader, label %for.end53

for.inc48.preheader:                              ; preds = %for.end38
  %min.iters.check = icmp ult i64 %7, 4
  br i1 %min.iters.check, label %for.inc48.preheader67, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc48.preheader
  %n.vec = and i64 %7, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %8, %n.vec
  br i1 %cmp.zero, label %for.inc48.preheader67, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %16 = add nsw i64 %n.vec, -4
  %17 = lshr exact i64 %16, 2
  %18 = add nuw nsw i64 %17, 1
  %xtraiter68 = and i64 %18, 3
  %lcmp.mod69 = icmp eq i64 %xtraiter68, 0
  br i1 %lcmp.mod69, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter68, %vector.body.prol.preheader ]
  %19 = add nsw i64 %8, %index.prol
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %19
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %21, align 8
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %23, align 8
  %index.next.prol = add nuw nsw i64 %index.prol, 4
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  %24 = shl i64 %xtraiter68, 2
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %24, %vector.body.prol.loopexit.unr-lcssa ]
  %25 = icmp ult i64 %16, 12
  br i1 %25, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %26 = add i64 %8, %index
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %26
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %28, align 8
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %30, align 8
  %index.next = add i64 %index, 4
  %31 = add i64 %8, %index.next
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %31
  %33 = bitcast double* %32 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %33, align 8
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %35, align 8
  %index.next.1 = add i64 %index, 8
  %36 = add i64 %8, %index.next.1
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %36
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %38, align 8
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %40, align 8
  %index.next.2 = add i64 %index, 12
  %41 = add i64 %8, %index.next.2
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %41
  %43 = bitcast double* %42 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %43, align 8
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %45, align 8
  %index.next.3 = add i64 %index, 16
  %46 = icmp eq i64 %index.next.3, %n.vec
  br i1 %46, label %middle.block.loopexit, label %vector.body, !llvm.loop !3

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %7, %n.vec
  br i1 %cmp.n, label %for.cond19.loopexit, label %for.inc48.preheader67

for.inc48.preheader67:                            ; preds = %middle.block, %min.iters.checked, %for.inc48.preheader
  %indvars.iv50.ph = phi i64 [ %8, %min.iters.checked ], [ %8, %for.inc48.preheader ], [ %ind.end, %middle.block ]
  br label %for.inc48

for.inc48:                                        ; preds = %for.inc48.preheader67, %for.inc48
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.inc48 ], [ %indvars.iv50.ph, %for.inc48.preheader67 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv50
  store double -9.990000e+02, double* %arrayidx47, align 8
  %exitcond53 = icmp eq i64 %indvars.iv50, 999
  %indvars.iv.next51 = add nsw i64 %indvars.iv50, 1
  br i1 %exitcond53, label %for.cond19.loopexit.loopexit, label %for.inc48, !llvm.loop !6

for.end53:                                        ; preds = %for.end38
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture readonly %B) unnamed_addr #2 {
for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge:
  %mul44.us54 = fmul double %alpha, 0.000000e+00
  %broadcast.splatinsert110 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat111 = shufflevector <2 x double> %broadcast.splatinsert110, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert114 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat115 = shufflevector <2 x double> %broadcast.splatinsert114, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert116 = insertelement <2 x double> undef, double %mul44.us54, i32 0
  %broadcast.splat117 = shufflevector <2 x double> %broadcast.splatinsert116, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc53_crit_edge.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv91 = phi i64 [ %indvars.iv.next92, %for.cond1.for.inc53_crit_edge.us ], [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ]
  %indvars.iv85 = phi i32 [ %indvars.iv.next86, %for.cond1.for.inc53_crit_edge.us ], [ -1, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv91, i64 0
  %0 = add nuw nsw i64 %indvars.iv91, 1
  %scevgep98 = getelementptr [1200 x double], [1200 x double]* %C, i64 %0, i64 0
  %cmp532.us = icmp sgt i64 %indvars.iv91, 0
  br i1 %cmp532.us, label %for.cond4.preheader.us.us.preheader, label %for.cond4.preheader.us72.preheader

for.cond4.preheader.us72.preheader:               ; preds = %for.cond1.preheader.us
  %scevgep102 = getelementptr [1200 x double], [1200 x double]* %B, i64 %0, i64 0
  %scevgep100 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv91, i64 0
  %arrayidx41.us51 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv91
  %bound0 = icmp ult double* %scevgep, %scevgep102
  %bound1 = icmp ult double* %scevgep100, %scevgep98
  %found.conflict = and i1 %bound0, %bound1
  %bound0105 = icmp ult double* %scevgep, %arrayidx41.us51
  %bound1106 = icmp ult double* %arrayidx41.us51, %scevgep98
  %found.conflict107 = and i1 %bound0105, %bound1106
  %conflict.rdx = or i1 %found.conflict, %found.conflict107
  br i1 %conflict.rdx, label %for.cond4.preheader.us72.preheader118, label %vector.ph

for.cond4.preheader.us72.preheader118:            ; preds = %for.cond4.preheader.us72.preheader
  br label %for.cond4.preheader.us72

vector.ph:                                        ; preds = %for.cond4.preheader.us72.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv91, i64 %index
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !8, !noalias !11
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load109 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !8, !noalias !11
  %5 = fmul <2 x double> %wide.load, %broadcast.splat111
  %6 = fmul <2 x double> %wide.load109, %broadcast.splat111
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv91, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load112 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !14
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load113 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !14
  %11 = fmul <2 x double> %wide.load112, %broadcast.splat115
  %12 = fmul <2 x double> %wide.load113, %broadcast.splat115
  %13 = load double, double* %arrayidx41.us51, align 8, !alias.scope !15
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %13, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fmul <2 x double> %11, %15
  %19 = fmul <2 x double> %12, %17
  %20 = fadd <2 x double> %5, %18
  %21 = fadd <2 x double> %6, %19
  %22 = fadd <2 x double> %broadcast.splat117, %20
  %23 = fadd <2 x double> %broadcast.splat117, %21
  %24 = bitcast double* %1 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8, !alias.scope !8, !noalias !11
  %25 = bitcast double* %3 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !8, !noalias !11
  %index.next = add nuw nsw i64 %index, 4
  %26 = icmp eq i64 %index.next, 1200
  br i1 %26, label %for.cond1.for.inc53_crit_edge.us.loopexit123, label %vector.body, !llvm.loop !16

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  %wide.trip.count87 = zext i32 %indvars.iv85 to i64
  %arrayidx41.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv91
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us72:                         ; preds = %for.cond4.preheader.us72, %for.cond4.preheader.us72.preheader118
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader.us72.preheader118 ], [ %indvars.iv.next.1, %for.cond4.preheader.us72 ]
  %arrayidx31.us47 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv91, i64 %indvars.iv
  %27 = load double, double* %arrayidx31.us47, align 8
  %mul32.us48 = fmul double %27, %beta
  %arrayidx36.us49 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv91, i64 %indvars.iv
  %28 = load double, double* %arrayidx36.us49, align 8
  %mul37.us50 = fmul double %28, %alpha
  %29 = load double, double* %arrayidx41.us51, align 8
  %mul42.us52 = fmul double %mul37.us50, %29
  %add43.us53 = fadd double %mul32.us48, %mul42.us52
  %add45.us55 = fadd double %mul44.us54, %add43.us53
  store double %add45.us55, double* %arrayidx31.us47, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx31.us47.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv91, i64 %indvars.iv.next
  %30 = load double, double* %arrayidx31.us47.1, align 8
  %mul32.us48.1 = fmul double %30, %beta
  %arrayidx36.us49.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv91, i64 %indvars.iv.next
  %31 = load double, double* %arrayidx36.us49.1, align 8
  %mul37.us50.1 = fmul double %31, %alpha
  %32 = load double, double* %arrayidx41.us51, align 8
  %mul42.us52.1 = fmul double %mul37.us50.1, %32
  %add43.us53.1 = fadd double %mul32.us48.1, %mul42.us52.1
  %add45.us55.1 = fadd double %mul44.us54, %add43.us53.1
  store double %add45.us55.1, double* %arrayidx31.us47.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1199
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.cond1.for.inc53_crit_edge.us.loopexit122, label %for.cond4.preheader.us72, !llvm.loop !17

for.cond1.for.inc53_crit_edge.us.loopexit:        ; preds = %for.cond4.for.inc50_crit_edge.us.us
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit122:     ; preds = %for.cond4.preheader.us72
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit123:     ; preds = %vector.body
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us:                 ; preds = %for.cond1.for.inc53_crit_edge.us.loopexit123, %for.cond1.for.inc53_crit_edge.us.loopexit122, %for.cond1.for.inc53_crit_edge.us.loopexit
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %indvars.iv.next86 = add nsw i32 %indvars.iv85, 1
  %exitcond121 = icmp ne i64 %indvars.iv.next92, 1000
  br i1 %exitcond121, label %for.cond1.preheader.us, label %for.end55

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.inc50_crit_edge.us.us
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %for.cond4.for.inc50_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv91, i64 %indvars.iv89
  br label %for.inc.us.us

for.cond4.for.inc50_crit_edge.us.us:              ; preds = %for.inc.us.us
  %arrayidx31.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv91, i64 %indvars.iv89
  %33 = load double, double* %arrayidx31.us.us, align 8
  %mul32.us.us = fmul double %33, %beta
  %34 = load double, double* %arrayidx8.us.us, align 8
  %mul37.us.us = fmul double %34, %alpha
  %35 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us.us = fmul double %mul37.us.us, %35
  %add43.us.us = fadd double %mul32.us.us, %mul42.us.us
  %mul44.us.us = fmul double %add27.us.us, %alpha
  %add45.us.us = fadd double %mul44.us.us, %add43.us.us
  store double %add45.us.us, double* %arrayidx31.us.us, align 8
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond = icmp ne i64 %indvars.iv.next90, 1200
  br i1 %exitcond, label %for.cond4.preheader.us.us, label %for.cond1.for.inc53_crit_edge.us.loopexit

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.cond4.preheader.us.us
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %for.inc.us.us ], [ 0, %for.cond4.preheader.us.us ]
  %temp2.034.us.us = phi double [ %add27.us.us, %for.inc.us.us ], [ 0.000000e+00, %for.cond4.preheader.us.us ]
  %36 = load double, double* %arrayidx8.us.us, align 8
  %mul.us.us = fmul double %36, %alpha
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv83
  %37 = load double, double* %arrayidx12.us.us, align 8
  %mul13.us.us = fmul double %mul.us.us, %37
  %arrayidx17.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv83, i64 %indvars.iv89
  %38 = load double, double* %arrayidx17.us.us, align 8
  %add.us.us = fadd double %38, %mul13.us.us
  store double %add.us.us, double* %arrayidx17.us.us, align 8
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv83, i64 %indvars.iv89
  %39 = load double, double* %arrayidx21.us.us, align 8
  %40 = load double, double* %arrayidx12.us.us, align 8
  %mul26.us.us = fmul double %39, %40
  %add27.us.us = fadd double %temp2.034.us.us, %mul26.us.us
  %exitcond88 = icmp eq i64 %indvars.iv83, %wide.trip.count87
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  br i1 %exitcond88, label %for.cond4.for.inc50_crit_edge.us.us, label %for.inc.us.us

for.end55:                                        ; preds = %for.cond1.for.inc53_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %C) unnamed_addr #0 {
for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge ], [ %indvars.iv.next14, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv13, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv13, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp ne i64 %indvars.iv.next14, 1000
  br i1 %exitcond16, label %for.cond2.preheader.us, label %for.end12

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
