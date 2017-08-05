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
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_symm(double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  call fastcc void @print_array([1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
for.cond1.preheader.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc16_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv59.us = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next56.us, %for.cond1.for.inc16_crit_edge.us ]
  %0 = add nsw i64 %indvars.iv59.us, 1200
  %1 = trunc i64 %0 to i32
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv55.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next51.us, %for.inc.us ]
  %2 = add nuw nsw i64 %indvars.iv55.us, %indvars.iv59.us
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv59.us, i64 %indvars.iv55.us
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = sub nsw i64 0, %indvars.iv55.us
  %5 = trunc i64 %4 to i32
  %sub.us = add i32 %1, %5
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv59.us, i64 %indvars.iv55.us
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next51.us = add nuw nsw i64 %indvars.iv55.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next51.us, 1200
  br i1 %exitcond, label %for.cond1.for.inc16_crit_edge.us, label %for.inc.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next56.us = add nuw nsw i64 %indvars.iv59.us, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next56.us, 1000
  br i1 %exitcond64, label %for.cond23.preheader.preheader, label %for.cond1.preheader.us

for.cond23.preheader.preheader:                   ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.cond23.preheader

for.cond23.preheader:                             ; preds = %for.cond23.preheader.preheader, %for.inc51
  %indvar = phi i64 [ %6, %for.inc51 ], [ 0, %for.cond23.preheader.preheader ]
  %indvars.iv4350 = phi i64 [ %indvars.iv.next44, %for.inc51 ], [ 1, %for.cond23.preheader.preheader ]
  %indvars.iv4548 = phi i64 [ %indvars.iv.next46, %for.inc51 ], [ 0, %for.cond23.preheader.preheader ]
  %6 = add nuw nsw i64 %indvar, 1
  %xtraiter = and i64 %6, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc36.prol.loopexit.unr-lcssa, label %for.inc36.prol.preheader

for.inc36.prol.preheader:                         ; preds = %for.cond23.preheader
  %7 = trunc i64 %indvars.iv4548 to i32
  %rem28.prol = srem i32 %7, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4548, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.inc36.prol.loopexit.unr-lcssa

for.inc36.prol.loopexit.unr-lcssa:                ; preds = %for.cond23.preheader, %for.inc36.prol.preheader
  %indvars.iv34.unr.ph = phi i64 [ 1, %for.inc36.prol.preheader ], [ 0, %for.cond23.preheader ]
  %8 = icmp eq i64 %indvar, 0
  br i1 %8, label %for.cond40.preheader, label %for.inc36.preheader

for.inc36.preheader:                              ; preds = %for.inc36.prol.loopexit.unr-lcssa
  br label %for.inc36

for.cond40.preheader.loopexit:                    ; preds = %for.inc36
  br label %for.cond40.preheader

for.cond40.preheader:                             ; preds = %for.cond40.preheader.loopexit, %for.inc36.prol.loopexit.unr-lcssa
  %exitcond3941 = icmp eq i64 %indvars.iv4548, 999
  br i1 %exitcond3941, label %for.inc51, label %for.inc48.preheader

for.inc48.preheader:                              ; preds = %for.cond40.preheader
  %9 = sub i64 999, %indvars.iv4548
  %10 = sub i64 998, %indvars.iv4548
  %xtraiter62 = and i64 %9, 7
  %lcmp.mod63 = icmp eq i64 %xtraiter62, 0
  br i1 %lcmp.mod63, label %for.inc48.prol.loopexit, label %for.inc48.prol.preheader

for.inc48.prol.preheader:                         ; preds = %for.inc48.preheader
  br label %for.inc48.prol

for.inc48.prol:                                   ; preds = %for.inc48.prol.preheader, %for.inc48.prol
  %indvars.iv.next3742.in.prol = phi i64 [ %indvars.iv.next3742.prol, %for.inc48.prol ], [ %indvars.iv4548, %for.inc48.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc48.prol ], [ %xtraiter62, %for.inc48.prol.preheader ]
  %indvars.iv.next3742.prol = add nuw nsw i64 %indvars.iv.next3742.in.prol, 1
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4548, i64 %indvars.iv.next3742.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc48.prol.loopexit.loopexit, label %for.inc48.prol, !llvm.loop !1

for.inc48.prol.loopexit.loopexit:                 ; preds = %for.inc48.prol
  br label %for.inc48.prol.loopexit

for.inc48.prol.loopexit:                          ; preds = %for.inc48.prol.loopexit.loopexit, %for.inc48.preheader
  %indvars.iv.next3742.in.unr = phi i64 [ %indvars.iv4548, %for.inc48.preheader ], [ %indvars.iv.next3742.prol, %for.inc48.prol.loopexit.loopexit ]
  %11 = icmp ult i64 %10, 7
  br i1 %11, label %for.inc51, label %for.inc48.preheader1

for.inc48.preheader1:                             ; preds = %for.inc48.prol.loopexit
  %12 = sub i64 991, %indvars.iv.next3742.in.unr
  %13 = lshr i64 %12, 3
  %14 = add nuw nsw i64 %13, 1
  %min.iters.check = icmp ult i64 %14, 2
  br i1 %min.iters.check, label %for.inc48.preheader2, label %min.iters.checked

for.inc48.preheader2:                             ; preds = %middle.block, %min.iters.checked, %for.inc48.preheader1
  %indvars.iv.next3742.in.ph = phi i64 [ %indvars.iv.next3742.in.unr, %min.iters.checked ], [ %indvars.iv.next3742.in.unr, %for.inc48.preheader1 ], [ %ind.end, %middle.block ]
  br label %for.inc48

min.iters.checked:                                ; preds = %for.inc48.preheader1
  %n.mod.vf = and i64 %14, 1
  %n.vec = sub nsw i64 %14, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %15 = add i64 %indvars.iv.next3742.in.unr, 8
  %16 = shl nuw i64 %13, 3
  %17 = add i64 %15, %16
  %18 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %17, %18
  br i1 %cmp.zero, label %for.inc48.preheader2, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %19 = shl i64 %index, 3
  %20 = add i64 %indvars.iv.next3742.in.unr, %19
  %21 = add nsw i64 %20, 8
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4548, i64 %21
  %23 = getelementptr double, double* %22, i64 -7
  %24 = bitcast double* %23 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %24, align 8
  %index.next = add i64 %index, 2
  %25 = icmp eq i64 %index.next, %n.vec
  br i1 %25, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc51, label %for.inc48.preheader2

for.inc36:                                        ; preds = %for.inc36.preheader, %for.inc36
  %indvars.iv34 = phi i64 [ %indvars.iv.next.1, %for.inc36 ], [ %indvars.iv34.unr.ph, %for.inc36.preheader ]
  %26 = add nuw nsw i64 %indvars.iv34, %indvars.iv4548
  %27 = trunc i64 %26 to i32
  %rem28 = srem i32 %27, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4548, i64 %indvars.iv34
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv34, 1
  %28 = add nuw nsw i64 %indvars.iv.next, %indvars.iv4548
  %29 = trunc i64 %28 to i32
  %rem28.1 = srem i32 %29, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, 1.000000e+03
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4548, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv34, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv4350
  br i1 %exitcond.1, label %for.cond40.preheader.loopexit, label %for.inc36

for.inc48:                                        ; preds = %for.inc48.preheader2, %for.inc48
  %indvars.iv.next3742.in = phi i64 [ %indvars.iv.next3742.7, %for.inc48 ], [ %indvars.iv.next3742.in.ph, %for.inc48.preheader2 ]
  %indvars.iv.next3742 = add nuw nsw i64 %indvars.iv.next3742.in, 1
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4548, i64 %indvars.iv.next3742
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next3742.1 = add nsw i64 %indvars.iv.next3742.in, 2
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4548, i64 %indvars.iv.next3742.1
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next3742.2 = add nsw i64 %indvars.iv.next3742.in, 3
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4548, i64 %indvars.iv.next3742.2
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next3742.3 = add nsw i64 %indvars.iv.next3742.in, 4
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4548, i64 %indvars.iv.next3742.3
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next3742.4 = add nsw i64 %indvars.iv.next3742.in, 5
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4548, i64 %indvars.iv.next3742.4
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next3742.5 = add nsw i64 %indvars.iv.next3742.in, 6
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4548, i64 %indvars.iv.next3742.5
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next3742.6 = add nsw i64 %indvars.iv.next3742.in, 7
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4548, i64 %indvars.iv.next3742.6
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next3742.7 = add nsw i64 %indvars.iv.next3742.in, 8
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4548, i64 %indvars.iv.next3742.7
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %exitcond39.7 = icmp eq i64 %indvars.iv.next3742.7, 999
  br i1 %exitcond39.7, label %for.inc51.loopexit, label %for.inc48, !llvm.loop !6

for.inc51.loopexit:                               ; preds = %for.inc48
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %middle.block, %for.inc48.prol.loopexit, %for.cond40.preheader
  %indvars.iv4549 = phi i64 [ 999, %for.cond40.preheader ], [ %indvars.iv4548, %for.inc48.prol.loopexit ], [ %indvars.iv4548, %middle.block ], [ %indvars.iv4548, %for.inc51.loopexit ]
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv4549, 1
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv4350, 1
  %cmp20 = icmp slt i64 %indvars.iv.next46, 1000
  br i1 %cmp20, label %for.cond23.preheader, label %for.end53

for.end53:                                        ; preds = %for.inc51
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_symm(double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
for.cond1.preheader.us.preheader:
  %mul44.us51 = fmul double %alpha, 0.000000e+00
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 1, i64 0
  %scevgep7 = getelementptr [1200 x double], [1200 x double]* %B, i64 1, i64 0
  %0 = bitcast double* %scevgep7 to [1200 x double]*
  %bound0 = icmp ugt [1200 x double]* %0, %C
  %1 = bitcast double* %scevgep to [1200 x double]*
  %bound1 = icmp ugt [1200 x double]* %1, %B
  %found.conflict = and i1 %bound0, %bound1
  %broadcast.splatinsert14 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat15 = shufflevector <2 x double> %broadcast.splatinsert14, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert19 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat20 = shufflevector <2 x double> %broadcast.splatinsert19, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert21 = insertelement <2 x double> undef, double %mul44.us51, i32 0
  %broadcast.splat22 = shufflevector <2 x double> %broadcast.splatinsert21, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc53_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv41.us = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next39.us, %for.cond1.for.inc53_crit_edge.us ]
  %exitcond33.us = icmp eq i64 %indvars.iv41.us, 0
  %arrayidx41.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv41.us, i64 %indvars.iv41.us
  br i1 %exitcond33.us, label %vector.memcheck, label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

vector.memcheck:                                  ; preds = %for.cond1.preheader.us
  %2 = bitcast double* %arrayidx41.us to [1200 x double]*
  %bound010 = icmp ugt [1200 x double]* %2, %C
  %bound111 = icmp ult double* %arrayidx41.us, %scevgep
  %found.conflict12 = and i1 %bound010, %bound111
  %conflict.rdx = or i1 %found.conflict, %found.conflict12
  br i1 %conflict.rdx, label %for.cond4.preheader.us70.preheader, label %vector.ph

for.cond4.preheader.us70.preheader:               ; preds = %vector.memcheck
  br label %for.cond4.preheader.us70

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 1
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %offset.idx
  %4 = bitcast double* %3 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %4, align 8, !alias.scope !8, !noalias !11
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec13 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %5 = fmul <2 x double> %strided.vec, %broadcast.splat15
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 0, i64 %offset.idx
  %7 = bitcast double* %6 to <4 x double>*
  %wide.vec16 = load <4 x double>, <4 x double>* %7, align 8, !alias.scope !14
  %strided.vec17 = shufflevector <4 x double> %wide.vec16, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec18 = shufflevector <4 x double> %wide.vec16, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %8 = fmul <2 x double> %strided.vec17, %broadcast.splat20
  %9 = load double, double* %arrayidx41.us, align 8, !alias.scope !15
  %10 = insertelement <2 x double> undef, double %9, i32 0
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  %12 = fmul <2 x double> %8, %11
  %13 = fadd <2 x double> %5, %12
  %14 = fadd <2 x double> %broadcast.splat22, %13
  %15 = or i64 %offset.idx, 1
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %15
  %17 = fmul <2 x double> %strided.vec13, %broadcast.splat15
  %18 = fmul <2 x double> %strided.vec18, %broadcast.splat20
  %19 = load double, double* %arrayidx41.us, align 8, !alias.scope !15
  %20 = insertelement <2 x double> undef, double %19, i32 0
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  %22 = fmul <2 x double> %18, %21
  %23 = fadd <2 x double> %17, %22
  %24 = fadd <2 x double> %broadcast.splat22, %23
  %25 = getelementptr double, double* %16, i64 -1
  %26 = bitcast double* %25 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %14, <2 x double> %24, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %26, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 2
  %27 = icmp eq i64 %index.next, 600
  br i1 %27, label %for.cond1.for.inc53_crit_edge.us.loopexit25, label %vector.body, !llvm.loop !16

for.cond4.preheader.us70:                         ; preds = %for.cond4.preheader.us70.preheader, %for.cond4.preheader.us70
  %indvars.iv38.us71 = phi i64 [ %indvars.iv.next36.us54.1, %for.cond4.preheader.us70 ], [ 0, %for.cond4.preheader.us70.preheader ]
  %arrayidx31.us45 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %indvars.iv38.us71
  %28 = load double, double* %arrayidx31.us45, align 8
  %mul32.us46 = fmul double %28, %beta
  %arrayidx36.us47 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 0, i64 %indvars.iv38.us71
  %29 = load double, double* %arrayidx36.us47, align 8
  %mul37.us48 = fmul double %29, %alpha
  %30 = load double, double* %arrayidx41.us, align 8
  %mul42.us49 = fmul double %mul37.us48, %30
  %add43.us50 = fadd double %mul32.us46, %mul42.us49
  %add45.us52 = fadd double %mul44.us51, %add43.us50
  store double %add45.us52, double* %arrayidx31.us45, align 8
  %indvars.iv.next36.us54 = or i64 %indvars.iv38.us71, 1
  %arrayidx31.us45.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %indvars.iv.next36.us54
  %31 = load double, double* %arrayidx31.us45.1, align 8
  %mul32.us46.1 = fmul double %31, %beta
  %arrayidx36.us47.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 0, i64 %indvars.iv.next36.us54
  %32 = load double, double* %arrayidx36.us47.1, align 8
  %mul37.us48.1 = fmul double %32, %alpha
  %33 = load double, double* %arrayidx41.us, align 8
  %mul42.us49.1 = fmul double %mul37.us48.1, %33
  %add43.us50.1 = fadd double %mul32.us46.1, %mul42.us49.1
  %add45.us52.1 = fadd double %mul44.us51, %add43.us50.1
  store double %add45.us52.1, double* %arrayidx31.us45.1, align 8
  %indvars.iv.next36.us54.1 = add nsw i64 %indvars.iv38.us71, 2
  %exitcond83.1 = icmp eq i64 %indvars.iv.next36.us54.1, 1200
  br i1 %exitcond83.1, label %for.cond1.for.inc53_crit_edge.us.loopexit, label %for.cond4.preheader.us70, !llvm.loop !17

for.cond1.for.inc53_crit_edge.us.loopexit:        ; preds = %for.cond4.preheader.us70
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit25:      ; preds = %vector.body
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit26:      ; preds = %for.cond4.for.inc50_crit_edge.us.us
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us:                 ; preds = %for.cond1.for.inc53_crit_edge.us.loopexit26, %for.cond1.for.inc53_crit_edge.us.loopexit25, %for.cond1.for.inc53_crit_edge.us.loopexit
  %indvars.iv.next39.us = add nuw nsw i64 %indvars.iv41.us, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next39.us, 1000
  br i1 %exitcond84, label %for.end55, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.inc50_crit_edge.us.us
  %indvars.iv38.us.us = phi i64 [ %indvars.iv.next36.us.us, %for.cond4.for.inc50_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv41.us, i64 %indvars.iv38.us.us
  br label %for.inc.us.us

for.cond4.for.inc50_crit_edge.us.us:              ; preds = %for.inc.us.us
  %arrayidx31.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv41.us, i64 %indvars.iv38.us.us
  %34 = load double, double* %arrayidx31.us.us, align 8
  %mul32.us.us = fmul double %34, %beta
  %35 = load double, double* %arrayidx8.us.us, align 8
  %mul37.us.us = fmul double %35, %alpha
  %36 = load double, double* %arrayidx41.us, align 8
  %mul42.us.us = fmul double %mul37.us.us, %36
  %add43.us.us = fadd double %mul32.us.us, %mul42.us.us
  %mul44.us.us = fmul double %add27.us.us, %alpha
  %add45.us.us = fadd double %mul44.us.us, %add43.us.us
  store double %add45.us.us, double* %arrayidx31.us.us, align 8
  %indvars.iv.next36.us.us = add nuw nsw i64 %indvars.iv38.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next36.us.us, 1200
  br i1 %exitcond, label %for.cond1.for.inc53_crit_edge.us.loopexit26, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.cond4.preheader.us.us
  %temp2.035.us.us = phi double [ 0.000000e+00, %for.cond4.preheader.us.us ], [ %add27.us.us, %for.inc.us.us ]
  %indvars.iv34.us.us = phi i64 [ 0, %for.cond4.preheader.us.us ], [ %indvars.iv.next.us.us, %for.inc.us.us ]
  %37 = load double, double* %arrayidx8.us.us, align 8
  %mul.us.us = fmul double %37, %alpha
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv41.us, i64 %indvars.iv34.us.us
  %38 = load double, double* %arrayidx12.us.us, align 8
  %mul13.us.us = fmul double %mul.us.us, %38
  %arrayidx17.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv34.us.us, i64 %indvars.iv38.us.us
  %39 = load double, double* %arrayidx17.us.us, align 8
  %add.us.us = fadd double %39, %mul13.us.us
  store double %add.us.us, double* %arrayidx17.us.us, align 8
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv34.us.us, i64 %indvars.iv38.us.us
  %40 = load double, double* %arrayidx21.us.us, align 8
  %41 = load double, double* %arrayidx12.us.us, align 8
  %mul26.us.us = fmul double %40, %41
  %add27.us.us = fadd double %temp2.035.us.us, %mul26.us.us
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv34.us.us, 1
  %exitcond.us.us = icmp eq i64 %indvars.iv.next.us.us, %indvars.iv41.us
  br i1 %exitcond.us.us, label %for.cond4.for.inc50_crit_edge.us.us, label %for.inc.us.us

for.end55:                                        ; preds = %for.cond1.for.inc53_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* %C) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv13.us = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next10.us, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv13.us, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv9.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %for.inc.us ]
  %4 = add nsw i64 %indvars.iv9.us, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv13.us, i64 %indvars.iv9.us
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv9.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv13.us, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next10.us, 1000
  br i1 %exitcond16, label %for.end12, label %for.cond2.preheader.us

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
