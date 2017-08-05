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
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %0 = bitcast i8* %call to [1200 x double]*
  %1 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay43 = bitcast i8* %call2 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %0, [1000 x double]* %1, [1200 x double]* %arraydecay43)
  call void (...) @polybench_timer_start() #4
  %2 = load double, double* %alpha, align 8
  %3 = load double, double* %beta, align 8
  call fastcc void @kernel_symm(double %2, double %3, [1200 x double]* %0, [1000 x double]* %1, [1200 x double]* %arraydecay43)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %4 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %4, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = bitcast i8* %call to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %5)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc16.us, %entry
  %indvars.iv44 = phi i64 [ 0, %entry ], [ %indvars.iv.next45, %for.inc16.us ]
  %0 = add i64 %indvars.iv44, 1200
  %1 = trunc i64 %0 to i32
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %for.inc.us ], [ 0, %for.cond1.preheader.us ]
  %2 = add nuw nsw i64 %indvars.iv44, %indvars.iv40
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv44, i64 %indvars.iv40
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = trunc i64 %indvars.iv40 to i32
  %sub.us = sub i32 %1, %4
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv40
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next41, 1200
  br i1 %exitcond55, label %for.inc16.us, label %for.inc.us

for.inc16.us:                                     ; preds = %for.inc.us
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next45, 1000
  br i1 %exitcond56, label %for.inc36.preheader.preheader, label %for.cond1.preheader.us

for.inc36.preheader.preheader:                    ; preds = %for.inc16.us
  br label %for.inc36.preheader

for.inc36.preheader:                              ; preds = %for.inc36.preheader.preheader, %for.inc51.for.inc36.preheader_crit_edge
  %indvars.iv52 = phi i3 [ %indvars.iv.next53, %for.inc51.for.inc36.preheader_crit_edge ], [ -1, %for.inc36.preheader.preheader ]
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.inc51.for.inc36.preheader_crit_edge ], [ 2, %for.inc36.preheader.preheader ]
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.inc51.for.inc36.preheader_crit_edge ], [ 0, %for.inc36.preheader.preheader ]
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.inc51.for.inc36.preheader_crit_edge ], [ 1, %for.inc36.preheader.preheader ]
  %5 = zext i3 %indvars.iv52 to i64
  %6 = add nuw nsw i64 %5, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = add i64 %indvars.iv50, %7
  %9 = sub nsw i64 0, %indvars.iv36
  %10 = trunc i64 %9 to i32
  %11 = add i32 %10, 7
  %12 = add i32 %10, 998
  %13 = and i64 %indvars.iv36, 1
  %lcmp.mod2 = icmp eq i64 %13, 0
  br i1 %lcmp.mod2, label %for.inc36.prol, label %for.inc36.prol.loopexit

for.inc36.prol:                                   ; preds = %for.inc36.preheader
  %14 = trunc i64 %indvars.iv36 to i32
  %rem28.prol = srem i32 %14, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.inc36.prol.loopexit

for.inc36.prol.loopexit:                          ; preds = %for.inc36.prol, %for.inc36.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc36.prol ], [ 0, %for.inc36.preheader ]
  %15 = icmp eq i64 %indvars.iv36, 0
  br i1 %15, label %for.cond40.preheader, label %for.inc36.preheader.new

for.inc36.preheader.new:                          ; preds = %for.inc36.prol.loopexit
  br label %for.inc36

for.cond40.preheader.loopexit:                    ; preds = %for.inc36
  br label %for.cond40.preheader

for.cond40.preheader:                             ; preds = %for.cond40.preheader.loopexit, %for.inc36.prol.loopexit
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %cmp419 = icmp slt i64 %indvars.iv.next37, 1000
  br i1 %cmp419, label %for.inc48.lr.ph, label %for.inc51

for.inc48.lr.ph:                                  ; preds = %for.cond40.preheader
  %xtraiter = and i32 %11, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc48.prol.loopexit, label %for.inc48.prol.preheader

for.inc48.prol.preheader:                         ; preds = %for.inc48.lr.ph
  br label %for.inc48.prol

for.inc48.prol:                                   ; preds = %for.inc48.prol.preheader, %for.inc48.prol
  %indvars.iv30.prol = phi i64 [ %indvars.iv.next31.prol, %for.inc48.prol ], [ %indvars.iv34, %for.inc48.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc48.prol ], [ %xtraiter, %for.inc48.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv30.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  %indvars.iv.next31.prol = add nuw nsw i64 %indvars.iv30.prol, 1
  br i1 %prol.iter.cmp, label %for.inc48.prol.loopexit.loopexit, label %for.inc48.prol, !llvm.loop !1

for.inc48.prol.loopexit.loopexit:                 ; preds = %for.inc48.prol
  br label %for.inc48.prol.loopexit

for.inc48.prol.loopexit:                          ; preds = %for.inc48.prol.loopexit.loopexit, %for.inc48.lr.ph
  %indvars.iv30.unr = phi i64 [ %indvars.iv34, %for.inc48.lr.ph ], [ %8, %for.inc48.prol.loopexit.loopexit ]
  %16 = icmp ult i32 %12, 7
  br i1 %16, label %for.inc51, label %for.inc48.prol.loopexit.for.inc48_crit_edge

for.inc48.prol.loopexit.for.inc48_crit_edge:      ; preds = %for.inc48.prol.loopexit
  %17 = sub i64 992, %indvars.iv30.unr
  %18 = lshr i64 %17, 3
  %19 = add nuw nsw i64 %18, 1
  %min.iters.check = icmp ult i64 %19, 2
  br i1 %min.iters.check, label %for.inc48.preheader, label %min.iters.checked

for.inc48.preheader:                              ; preds = %middle.block, %min.iters.checked, %for.inc48.prol.loopexit.for.inc48_crit_edge
  %indvars.iv30.ph = phi i64 [ %indvars.iv30.unr, %min.iters.checked ], [ %indvars.iv30.unr, %for.inc48.prol.loopexit.for.inc48_crit_edge ], [ %ind.end, %middle.block ]
  br label %for.inc48

min.iters.checked:                                ; preds = %for.inc48.prol.loopexit.for.inc48_crit_edge
  %n.mod.vf = and i64 %19, 1
  %n.vec = sub nsw i64 %19, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %20 = add i64 %indvars.iv30.unr, 8
  %21 = shl nuw i64 %18, 3
  %22 = add i64 %20, %21
  %23 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %22, %23
  br i1 %cmp.zero, label %for.inc48.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %24 = shl i64 %index, 3
  %25 = add i64 %indvars.iv30.unr, %24
  %26 = add nsw i64 %25, 7
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %26
  %28 = getelementptr double, double* %27, i64 -7
  %29 = bitcast double* %28 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %29, align 8
  %index.next = add i64 %index, 2
  %30 = icmp eq i64 %index.next, %n.vec
  br i1 %30, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc51, label %for.inc48.preheader

for.inc36:                                        ; preds = %for.inc36, %for.inc36.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc36.preheader.new ], [ %indvars.iv.next.1, %for.inc36 ]
  %31 = add nuw nsw i64 %indvars.iv36, %indvars.iv
  %32 = trunc i64 %31 to i32
  %rem28 = srem i32 %32, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %33 = add nuw nsw i64 %indvars.iv36, %indvars.iv.next
  %34 = trunc i64 %33 to i32
  %rem28.1 = srem i32 %34, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, 1.000000e+03
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv34
  br i1 %exitcond.1, label %for.cond40.preheader.loopexit, label %for.inc36

for.inc48:                                        ; preds = %for.inc48.preheader, %for.inc48
  %indvars.iv30 = phi i64 [ %indvars.iv.next31.7, %for.inc48 ], [ %indvars.iv30.ph, %for.inc48.preheader ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv30
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
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
  %exitcond33.7 = icmp eq i64 %indvars.iv.next31.7, 1000
  br i1 %exitcond33.7, label %for.inc51.loopexit, label %for.inc48, !llvm.loop !6

for.inc51.loopexit:                               ; preds = %for.inc48
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %middle.block, %for.inc48.prol.loopexit, %for.cond40.preheader
  %exitcond54 = icmp eq i64 %indvars.iv.next37, 1000
  br i1 %exitcond54, label %for.end53, label %for.inc51.for.inc36.preheader_crit_edge

for.inc51.for.inc36.preheader_crit_edge:          ; preds = %for.inc51
  %indvars.iv.next53 = add i3 %indvars.iv52, -1
  %indvars.iv.next51 = add nuw i64 %indvars.iv50, 1
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  br label %for.inc36.preheader

for.end53:                                        ; preds = %for.inc51
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #2 {
entry:
  %mul44.us63 = fmul double %alpha, 0.000000e+00
  %broadcast.splatinsert16 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat17 = shufflevector <2 x double> %broadcast.splatinsert16, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert20 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat21 = shufflevector <2 x double> %broadcast.splatinsert20, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert22 = insertelement <2 x double> undef, double %mul44.us63, i32 0
  %broadcast.splat23 = shufflevector <2 x double> %broadcast.splatinsert22, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc53.us.for.cond1.preheader.us_crit_edge, %entry
  %indvars.iv88 = phi i64 [ 0, %entry ], [ %indvars.iv.next89, %for.inc53.us.for.cond1.preheader.us_crit_edge ]
  %indvars.iv76 = phi [1200 x double]* [ %B, %entry ], [ %33, %for.inc53.us.for.cond1.preheader.us_crit_edge ]
  %scevgep1 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv88, i64 0
  %0 = add i64 %indvars.iv88, 1
  %scevgep3 = getelementptr [1200 x double], [1200 x double]* %C, i64 %0, i64 0
  %cmp54.us = icmp sgt i64 %indvars.iv88, 0
  %arrayidx41.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv88, i64 %indvars.iv88
  br i1 %cmp54.us, label %for.body3.us.us.preheader, label %vector.memcheck

for.body3.us.us.preheader:                        ; preds = %for.cond1.preheader.us
  br label %for.body3.us.us

vector.memcheck:                                  ; preds = %for.cond1.preheader.us
  %scevgep7 = getelementptr [1200 x double], [1200 x double]* %B, i64 %0, i64 0
  %scevgep5 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv88, i64 0
  %bound0 = icmp ult double* %scevgep1, %scevgep7
  %bound1 = icmp ult double* %scevgep5, %scevgep3
  %found.conflict = and i1 %bound0, %bound1
  %bound011 = icmp ult double* %scevgep1, %arrayidx41.us.us
  %bound112 = icmp ult double* %arrayidx41.us.us, %scevgep3
  %found.conflict13 = and i1 %bound011, %bound112
  %conflict.rdx = or i1 %found.conflict, %found.conflict13
  br i1 %conflict.rdx, label %for.body3.us23.preheader, label %vector.ph

for.body3.us23.preheader:                         ; preds = %vector.memcheck
  br label %for.body3.us23

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv88, i64 %index
  %2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv88, i64 %index
  %3 = bitcast double* %2 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %3, align 8, !alias.scope !8, !noalias !11
  %4 = getelementptr double, double* %2, i64 2
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %5, align 8, !alias.scope !8, !noalias !11
  %6 = fmul <2 x double> %wide.load, %broadcast.splat17
  %7 = fmul <2 x double> %wide.load15, %broadcast.splat17
  %8 = bitcast double* %1 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !14
  %9 = getelementptr double, double* %1, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !14
  %11 = fmul <2 x double> %wide.load18, %broadcast.splat21
  %12 = fmul <2 x double> %wide.load19, %broadcast.splat21
  %13 = load double, double* %arrayidx41.us.us, align 8, !alias.scope !15
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %13, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fmul <2 x double> %11, %15
  %19 = fmul <2 x double> %12, %17
  %20 = fadd <2 x double> %6, %18
  %21 = fadd <2 x double> %7, %19
  %22 = fadd <2 x double> %20, %broadcast.splat23
  %23 = fadd <2 x double> %21, %broadcast.splat23
  %24 = bitcast double* %2 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8, !alias.scope !8, !noalias !11
  %25 = bitcast double* %4 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %26 = icmp eq i64 %index.next, 1200
  br i1 %26, label %for.inc53.us.loopexit28, label %vector.body, !llvm.loop !16

for.body3.us23:                                   ; preds = %for.body3.us23, %for.body3.us23.preheader
  %indvars.iv = phi i64 [ 0, %for.body3.us23.preheader ], [ %indvars.iv.next.1, %for.body3.us23 ]
  %.pre22.us27 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv88, i64 %indvars.iv
  %arrayidx31.us57 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv88, i64 %indvars.iv
  %27 = load double, double* %arrayidx31.us57, align 8
  %mul32.us58 = fmul double %27, %beta
  %28 = load double, double* %.pre22.us27, align 8
  %mul37.us59 = fmul double %28, %alpha
  %29 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us61 = fmul double %mul37.us59, %29
  %add43.us62 = fadd double %mul32.us58, %mul42.us61
  %add45.us64 = fadd double %add43.us62, %mul44.us63
  store double %add45.us64, double* %arrayidx31.us57, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %.pre22.us27.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv88, i64 %indvars.iv.next
  %arrayidx31.us57.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv88, i64 %indvars.iv.next
  %30 = load double, double* %arrayidx31.us57.1, align 8
  %mul32.us58.1 = fmul double %30, %beta
  %31 = load double, double* %.pre22.us27.1, align 8
  %mul37.us59.1 = fmul double %31, %alpha
  %32 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us61.1 = fmul double %mul37.us59.1, %32
  %add43.us62.1 = fadd double %mul32.us58.1, %mul42.us61.1
  %add45.us64.1 = fadd double %add43.us62.1, %mul44.us63
  store double %add45.us64.1, double* %arrayidx31.us57.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond93.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond93.1, label %for.inc53.us.loopexit27, label %for.body3.us23, !llvm.loop !17

for.inc53.us.loopexit:                            ; preds = %for.inc50.us.us
  br label %for.inc53.us

for.inc53.us.loopexit27:                          ; preds = %for.body3.us23
  br label %for.inc53.us

for.inc53.us.loopexit28:                          ; preds = %vector.body
  br label %for.inc53.us

for.inc53.us:                                     ; preds = %for.inc53.us.loopexit28, %for.inc53.us.loopexit27, %for.inc53.us.loopexit
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next89, 1000
  br i1 %exitcond94, label %for.end55, label %for.inc53.us.for.cond1.preheader.us_crit_edge

for.inc53.us.for.cond1.preheader.us_crit_edge:    ; preds = %for.inc53.us
  %scevgep = getelementptr [1200 x double], [1200 x double]* %indvars.iv76, i64 1, i64 0
  %33 = bitcast double* %scevgep to [1200 x double]*
  br label %for.cond1.preheader.us

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.inc50.us.us.for.body3.us.us_crit_edge
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %for.inc50.us.us.for.body3.us.us_crit_edge ], [ 0, %for.body3.us.us.preheader ]
  %indvars.iv77 = phi [1200 x double]* [ %37, %for.inc50.us.us.for.body3.us.us_crit_edge ], [ %indvars.iv76, %for.body3.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv88, i64 %indvars.iv84
  br label %for.inc.us.us

for.inc50.us.us:                                  ; preds = %for.inc.us.us
  %indvars.iv777926 = bitcast [1200 x double]* %indvars.iv77 to double*
  %arrayidx31.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv88, i64 %indvars.iv84
  %34 = load double, double* %arrayidx31.us.us, align 8
  %mul32.us.us = fmul double %34, %beta
  %35 = load double, double* %indvars.iv777926, align 8
  %mul37.us.us = fmul double %35, %alpha
  %36 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us.us = fmul double %mul37.us.us, %36
  %add43.us.us = fadd double %mul32.us.us, %mul42.us.us
  %mul44.us.us = fmul double %add27.us.us, %alpha
  %add45.us.us = fadd double %add43.us.us, %mul44.us.us
  store double %add45.us.us, double* %arrayidx31.us.us, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond = icmp eq i64 %indvars.iv.next85, 1200
  br i1 %exitcond, label %for.inc53.us.loopexit, label %for.inc50.us.us.for.body3.us.us_crit_edge

for.inc50.us.us.for.body3.us.us_crit_edge:        ; preds = %for.inc50.us.us
  %scevgep78 = getelementptr [1200 x double], [1200 x double]* %indvars.iv77, i64 0, i64 1
  %37 = bitcast double* %scevgep78 to [1200 x double]*
  br label %for.body3.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.body3.us.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %for.inc.us.us ], [ 0, %for.body3.us.us ]
  %add278.us.us = phi double [ %add27.us.us, %for.inc.us.us ], [ 0.000000e+00, %for.body3.us.us ]
  %38 = load double, double* %arrayidx8.us.us, align 8
  %mul.us.us = fmul double %38, %alpha
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv88, i64 %indvars.iv74
  %39 = load double, double* %arrayidx12.us.us, align 8
  %mul13.us.us = fmul double %mul.us.us, %39
  %arrayidx17.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv74, i64 %indvars.iv84
  %40 = load double, double* %arrayidx17.us.us, align 8
  %add.us.us = fadd double %mul13.us.us, %40
  store double %add.us.us, double* %arrayidx17.us.us, align 8
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv74, i64 %indvars.iv84
  %41 = load double, double* %arrayidx21.us.us, align 8
  %42 = load double, double* %arrayidx12.us.us, align 8
  %mul26.us.us = fmul double %41, %42
  %add27.us.us = fadd double %add278.us.us, %mul26.us.us
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next75, %indvars.iv88
  br i1 %exitcond83, label %for.inc50.us.us, label %for.inc.us.us

for.end55:                                        ; preds = %for.inc53.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.inc10.us ]
  %3 = mul nsw i64 %indvars.iv11, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ 0, %for.cond2.preheader.us ]
  %4 = add nsw i64 %3, %indvars.iv
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv11, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond17, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %for.inc.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.inc10.us
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
