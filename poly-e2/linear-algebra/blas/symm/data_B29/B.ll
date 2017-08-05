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
  %2 = bitcast i8* %call2 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %0, [1000 x double]* %1, [1200 x double]* %2)
  call void (...) @polybench_timer_start() #4
  %3 = load double, double* %alpha, align 8
  %4 = load double, double* %beta, align 8
  call fastcc void @kernel_symm(i32 1000, i32 1200, double %3, double %4, [1200 x double]* %0, [1000 x double]* %1, [1200 x double]* %2)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %5 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %5, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %0)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp19 = icmp sgt i32 %m, 0
  br i1 %cmp19, label %for.body.lr.ph, label %for.end53

for.body.lr.ph:                                   ; preds = %entry
  %0 = zext i32 %n to i64
  %cmp215 = icmp sgt i32 %n, 0
  %1 = sext i32 %m to i64
  %conv4 = sitofp i32 %m to double
  br i1 %cmp215, label %for.body.us.preheader, label %for.body22.lr.ph

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %2 = sext i32 %n to i64
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond1.for.inc16_crit_edge.us
  %indvars.iv39 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next40, %for.cond1.for.inc16_crit_edge.us ]
  %3 = add i64 %0, %indvars.iv39
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body.us, %for.inc.us
  %indvars.iv35 = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next36, %for.inc.us ]
  %4 = add nsw i64 %indvars.iv39, %indvars.iv35
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv39, i64 %indvars.iv35
  store double %div.us, double* %arrayidx6.us, align 8
  %6 = sub nsw i64 %3, %indvars.iv35
  %7 = trunc i64 %6 to i32
  %rem8.us = srem i32 %7, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, %conv4
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv39, i64 %indvars.iv35
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next36, %2
  br i1 %cmp2.us, label %for.inc.us, label %for.cond1.for.inc16_crit_edge.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next40 = add nsw i64 %indvars.iv39, 1
  %cmp.us = icmp slt i64 %indvars.iv.next40, %1
  br i1 %cmp.us, label %for.body.us, label %for.body22.lr.ph.loopexit

for.body22.lr.ph.loopexit:                        ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.body22.lr.ph

for.body22.lr.ph:                                 ; preds = %for.body22.lr.ph.loopexit, %for.body.lr.ph
  %8 = add i32 %m, 7
  %9 = add i32 %m, -2
  %10 = trunc i32 %8 to i3
  br label %for.body22

for.body22:                                       ; preds = %for.body22.lr.ph, %for.inc51
  %indvars.iv47 = phi i3 [ %10, %for.body22.lr.ph ], [ %indvars.iv.next48, %for.inc51 ]
  %indvars.iv45.in = phi i64 [ 1, %for.body22.lr.ph ], [ %indvars.iv45, %for.inc51 ]
  %indvar = phi i32 [ 0, %for.body22.lr.ph ], [ %indvar.next, %for.inc51 ]
  %indvars.iv33 = phi i64 [ 0, %for.body22.lr.ph ], [ %indvars.iv.next34, %for.inc51 ]
  %indvars.iv26 = phi i32 [ 1, %for.body22.lr.ph ], [ %indvars.iv.next27, %for.inc51 ]
  %indvars.iv45 = add nsw i64 %indvars.iv45.in, 1
  %11 = zext i3 %indvars.iv47 to i64
  %12 = add nuw nsw i64 %11, 4294967295
  %13 = and i64 %12, 4294967295
  %14 = add i64 %indvars.iv45, %13
  %15 = sub i32 %8, %indvar
  %16 = sub i32 %9, %indvar
  %cmp246 = icmp slt i64 %indvars.iv33, 0
  br i1 %cmp246, label %for.end38, label %for.inc36.lr.ph

for.inc36.lr.ph:                                  ; preds = %for.body22
  %17 = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %17, 0
  br i1 %lcmp.mod, label %for.inc36.prol, label %for.inc36.prol.loopexit

for.inc36.prol:                                   ; preds = %for.inc36.lr.ph
  %18 = trunc i64 %indvars.iv33 to i32
  %rem28.prol = srem i32 %18, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, %conv4
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.inc36.prol.loopexit

for.inc36.prol.loopexit:                          ; preds = %for.inc36.lr.ph, %for.inc36.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc36.prol ], [ 0, %for.inc36.lr.ph ]
  %19 = icmp eq i32 %indvar, 0
  br i1 %19, label %for.end38, label %for.inc36.preheader

for.inc36.preheader:                              ; preds = %for.inc36.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv26 to i64
  br label %for.inc36

for.inc36:                                        ; preds = %for.inc36.preheader, %for.inc36
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc36 ], [ %indvars.iv.unr.ph, %for.inc36.preheader ]
  %20 = add nsw i64 %indvars.iv33, %indvars.iv
  %21 = trunc i64 %20 to i32
  %rem28 = srem i32 %21, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, %conv4
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %22 = add nsw i64 %indvars.iv33, %indvars.iv.next
  %23 = trunc i64 %22 to i32
  %rem28.1 = srem i32 %23, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, %conv4
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.end38.loopexit, label %for.inc36

for.end38.loopexit:                               ; preds = %for.inc36
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.inc36.prol.loopexit, %for.body22
  %indvars.iv.next34 = add nsw i64 %indvars.iv33, 1
  %cmp419 = icmp slt i64 %indvars.iv.next34, %1
  br i1 %cmp419, label %for.inc48.lr.ph, label %for.inc51

for.inc48.lr.ph:                                  ; preds = %for.end38
  %xtraiter42 = and i32 %15, 7
  %lcmp.mod43 = icmp eq i32 %xtraiter42, 0
  br i1 %lcmp.mod43, label %for.inc48.prol.loopexit, label %for.inc48.prol.preheader

for.inc48.prol.preheader:                         ; preds = %for.inc48.lr.ph
  br label %for.inc48.prol

for.inc48.prol:                                   ; preds = %for.inc48.prol.preheader, %for.inc48.prol
  %indvars.iv30.prol = phi i64 [ %indvars.iv.next31.prol, %for.inc48.prol ], [ %indvars.iv45.in, %for.inc48.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc48.prol ], [ %xtraiter42, %for.inc48.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv30.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next31.prol = add nsw i64 %indvars.iv30.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc48.prol.loopexit.loopexit, label %for.inc48.prol, !llvm.loop !1

for.inc48.prol.loopexit.loopexit:                 ; preds = %for.inc48.prol
  br label %for.inc48.prol.loopexit

for.inc48.prol.loopexit:                          ; preds = %for.inc48.prol.loopexit.loopexit, %for.inc48.lr.ph
  %indvars.iv30.unr = phi i64 [ %indvars.iv45.in, %for.inc48.lr.ph ], [ %14, %for.inc48.prol.loopexit.loopexit ]
  %24 = icmp ult i32 %16, 7
  br i1 %24, label %for.inc51, label %for.inc48.preheader

for.inc48.preheader:                              ; preds = %for.inc48.prol.loopexit
  br label %for.inc48

for.inc48:                                        ; preds = %for.inc48.preheader, %for.inc48
  %indvars.iv30 = phi i64 [ %indvars.iv.next31.7, %for.inc48 ], [ %indvars.iv30.unr, %for.inc48.preheader ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv30
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next31 = add nsw i64 %indvars.iv30, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next31
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next31.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next31.2 = add nsw i64 %indvars.iv30, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next31.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next31.3 = add nsw i64 %indvars.iv30, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next31.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next31.4 = add nsw i64 %indvars.iv30, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next31.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next31.5 = add nsw i64 %indvars.iv30, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next31.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next31.6 = add nsw i64 %indvars.iv30, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next31.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next31.7 = add nsw i64 %indvars.iv30, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next31.7 to i32
  %exitcond32.7 = icmp eq i32 %lftr.wideiv.7, %m
  br i1 %exitcond32.7, label %for.inc51.loopexit, label %for.inc48

for.inc51.loopexit:                               ; preds = %for.inc48
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %for.inc48.prol.loopexit, %for.end38
  %indvars.iv.next27 = add i32 %indvars.iv26, 1
  %indvar.next = add nuw i32 %indvar, 1
  %indvars.iv.next48 = add i3 %indvars.iv47, -1
  br i1 %cmp419, label %for.body22, label %for.end53.loopexit

for.end53.loopexit:                               ; preds = %for.inc51
  br label %for.end53

for.end53:                                        ; preds = %for.end53.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #2 {
entry:
  %cmp12 = icmp sgt i32 %m, 0
  br i1 %cmp12, label %for.body.lr.ph, label %for.end55

for.body.lr.ph:                                   ; preds = %entry
  %0 = sext i32 %n to i64
  %1 = sext i32 %m to i64
  %2 = icmp sgt i32 %n, 0
  %mul44 = fmul double %alpha, 0.000000e+00
  %3 = add nsw i64 %0, -1
  %min.iters.check = icmp ult i32 %n, 4
  %n.vec = and i64 %0, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert52 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat53 = shufflevector <2 x double> %broadcast.splatinsert52, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert56 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat57 = shufflevector <2 x double> %broadcast.splatinsert56, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert58 = insertelement <2 x double> undef, double %mul44, i32 0
  %broadcast.splat59 = shufflevector <2 x double> %broadcast.splatinsert58, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %0, %n.vec
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc53
  %indvar = phi i64 [ 0, %for.body.lr.ph ], [ %indvar.next, %for.inc53 ]
  %indvars.iv33 = phi i32 [ 0, %for.body.lr.ph ], [ %indvars.iv.next34, %for.inc53 ]
  %indvars.iv30 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next31, %for.inc53 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvar, i64 0
  %scevgep40 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvar, i64 %0
  %scevgep42 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvar, i64 0
  %scevgep44 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvar, i64 %0
  %4 = zext i32 %indvars.iv33 to i64
  br i1 %2, label %for.body3.lr.ph, label %for.inc53

for.body3.lr.ph:                                  ; preds = %for.body
  %cmp53 = icmp sgt i64 %indvars.iv30, 0
  %arrayidx41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv30
  br i1 %cmp53, label %for.body3.us.preheader, label %for.body3.preheader

for.body3.us.preheader:                           ; preds = %for.body3.lr.ph
  br label %for.body3.us

for.body3.preheader:                              ; preds = %for.body3.lr.ph
  br i1 %min.iters.check, label %for.body3.preheader60, label %min.iters.checked

for.body3.preheader60:                            ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body3.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.body3.preheader ], [ %n.vec, %middle.block ]
  %5 = sub nsw i64 %0, %indvars.iv.ph
  %xtraiter = and i64 %5, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.prol.loopexit.unr-lcssa, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.preheader60
  %arrayidx31.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv30, i64 %indvars.iv.ph
  %6 = load double, double* %arrayidx31.prol, align 8
  %mul32.prol = fmul double %6, %beta
  %arrayidx36.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv30, i64 %indvars.iv.ph
  %7 = load double, double* %arrayidx36.prol, align 8
  %mul37.prol = fmul double %7, %alpha
  %8 = load double, double* %arrayidx41, align 8
  %mul42.prol = fmul double %mul37.prol, %8
  %add43.prol = fadd double %mul32.prol, %mul42.prol
  %add45.prol = fadd double %add43.prol, %mul44
  store double %add45.prol, double* %arrayidx31.prol, align 8
  %indvars.iv.next.prol = or i64 %indvars.iv.ph, 1
  br label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.loopexit.unr-lcssa:                ; preds = %for.body3.preheader60, %for.body3.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body3.prol.preheader ], [ %indvars.iv.ph, %for.body3.preheader60 ]
  %9 = icmp eq i64 %3, %indvars.iv.ph
  br i1 %9, label %for.inc53.loopexit61, label %for.body3.preheader60.new

for.body3.preheader60.new:                        ; preds = %for.body3.prol.loopexit.unr-lcssa
  br label %for.body3

min.iters.checked:                                ; preds = %for.body3.preheader
  br i1 %cmp.zero, label %for.body3.preheader60, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep44
  %bound1 = icmp ult double* %scevgep42, %scevgep40
  %found.conflict = and i1 %bound0, %bound1
  %bound047 = icmp ult double* %scevgep, %arrayidx41
  %bound148 = icmp ult double* %arrayidx41, %scevgep40
  %found.conflict49 = and i1 %bound047, %bound148
  %conflict.rdx = or i1 %found.conflict, %found.conflict49
  br i1 %conflict.rdx, label %for.body3.preheader60, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv30, i64 %index
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !3, !noalias !6
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !3, !noalias !6
  %14 = fmul <2 x double> %broadcast.splat53, %wide.load
  %15 = fmul <2 x double> %broadcast.splat53, %wide.load51
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv30, i64 %index
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !9
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !9
  %20 = fmul <2 x double> %broadcast.splat57, %wide.load54
  %21 = fmul <2 x double> %broadcast.splat57, %wide.load55
  %22 = load double, double* %arrayidx41, align 8, !alias.scope !10
  %23 = insertelement <2 x double> undef, double %22, i32 0
  %24 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> zeroinitializer
  %25 = fmul <2 x double> %20, %24
  %26 = fmul <2 x double> %21, %24
  %27 = fadd <2 x double> %14, %25
  %28 = fadd <2 x double> %15, %26
  %29 = fadd <2 x double> %27, %broadcast.splat59
  %30 = fadd <2 x double> %28, %broadcast.splat59
  store <2 x double> %29, <2 x double>* %11, align 8, !alias.scope !3, !noalias !6
  store <2 x double> %30, <2 x double>* %13, align 8, !alias.scope !3, !noalias !6
  %index.next = add i64 %index, 4
  %31 = icmp eq i64 %index.next, %n.vec
  br i1 %31, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc53, label %for.body3.preheader60

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.cond4.for.inc50_crit_edge.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.cond4.for.inc50_crit_edge.us ], [ 0, %for.body3.us.preheader ]
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv30, i64 %indvars.iv26
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.body3.us
  %indvars.iv20 = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next21, %for.inc.us ]
  %add275.us = phi double [ 0.000000e+00, %for.body3.us ], [ %add27.us, %for.inc.us ]
  %32 = load double, double* %arrayidx8.us, align 8
  %mul.us = fmul double %32, %alpha
  %arrayidx12.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv20
  %33 = load double, double* %arrayidx12.us, align 8
  %mul13.us = fmul double %mul.us, %33
  %arrayidx17.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 %indvars.iv26
  %34 = load double, double* %arrayidx17.us, align 8
  %add.us = fadd double %34, %mul13.us
  store double %add.us, double* %arrayidx17.us, align 8
  %arrayidx21.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv20, i64 %indvars.iv26
  %35 = load double, double* %arrayidx21.us, align 8
  %36 = load double, double* %arrayidx12.us, align 8
  %mul26.us = fmul double %35, %36
  %add27.us = fadd double %add275.us, %mul26.us
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next21, %4
  br i1 %exitcond35, label %for.cond4.for.inc50_crit_edge.us, label %for.inc.us

for.cond4.for.inc50_crit_edge.us:                 ; preds = %for.inc.us
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv30, i64 %indvars.iv26
  %37 = load double, double* %arrayidx31.us, align 8
  %mul32.us = fmul double %37, %beta
  %38 = load double, double* %arrayidx8.us, align 8
  %mul37.us = fmul double %38, %alpha
  %39 = load double, double* %arrayidx41, align 8
  %mul42.us = fmul double %mul37.us, %39
  %add43.us = fadd double %mul32.us, %mul42.us
  %mul44.us = fmul double %add27.us, %alpha
  %add45.us = fadd double %add43.us, %mul44.us
  store double %add45.us, double* %arrayidx31.us, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next27, %0
  br i1 %exitcond38, label %for.inc53.loopexit, label %for.body3.us

for.body3:                                        ; preds = %for.body3, %for.body3.preheader60.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body3.preheader60.new ], [ %indvars.iv.next.1, %for.body3 ]
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv30, i64 %indvars.iv
  %40 = load double, double* %arrayidx31, align 8
  %mul32 = fmul double %40, %beta
  %arrayidx36 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv30, i64 %indvars.iv
  %41 = load double, double* %arrayidx36, align 8
  %mul37 = fmul double %41, %alpha
  %42 = load double, double* %arrayidx41, align 8
  %mul42 = fmul double %mul37, %42
  %add43 = fadd double %mul32, %mul42
  %add45 = fadd double %add43, %mul44
  store double %add45, double* %arrayidx31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx31.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv30, i64 %indvars.iv.next
  %43 = load double, double* %arrayidx31.1, align 8
  %mul32.1 = fmul double %43, %beta
  %arrayidx36.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv30, i64 %indvars.iv.next
  %44 = load double, double* %arrayidx36.1, align 8
  %mul37.1 = fmul double %44, %alpha
  %45 = load double, double* %arrayidx41, align 8
  %mul42.1 = fmul double %mul37.1, %45
  %add43.1 = fadd double %mul32.1, %mul42.1
  %add45.1 = fadd double %add43.1, %mul44
  store double %add45.1, double* %arrayidx31.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %0
  br i1 %exitcond.1, label %for.inc53.loopexit61.unr-lcssa, label %for.body3, !llvm.loop !14

for.inc53.loopexit:                               ; preds = %for.cond4.for.inc50_crit_edge.us
  br label %for.inc53

for.inc53.loopexit61.unr-lcssa:                   ; preds = %for.body3
  br label %for.inc53.loopexit61

for.inc53.loopexit61:                             ; preds = %for.body3.prol.loopexit.unr-lcssa, %for.inc53.loopexit61.unr-lcssa
  br label %for.inc53

for.inc53:                                        ; preds = %for.inc53.loopexit61, %for.inc53.loopexit, %middle.block, %for.body
  %indvars.iv.next31 = add nsw i64 %indvars.iv30, 1
  %indvars.iv.next34 = add i32 %indvars.iv33, 1
  %cmp = icmp slt i64 %indvars.iv.next31, %1
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp, label %for.body, label %for.end55.loopexit

for.end55.loopexit:                               ; preds = %for.inc53
  br label %for.end55

for.end55:                                        ; preds = %for.end55.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp4 = icmp sgt i32 %m, 0
  br i1 %cmp4, label %for.body.lr.ph, label %for.end12

for.body.lr.ph:                                   ; preds = %entry
  %3 = zext i32 %n to i64
  %cmp32 = icmp sgt i32 %n, 0
  %4 = sext i32 %m to i64
  br i1 %cmp32, label %for.body.us.preheader, label %for.end12

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond2.for.inc10_crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ], [ 0, %for.body.us.preheader ]
  %5 = mul nsw i64 %indvars.iv10, %4
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.inc.us ]
  %6 = add nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv10, i64 %indvars.iv
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond13, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %cmp.us = icmp slt i64 %indvars.iv.next11, %4
  br i1 %cmp.us, label %for.body.us, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %for.body.lr.ph, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #5
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
