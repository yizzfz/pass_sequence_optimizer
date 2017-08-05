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
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
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
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
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
  br i1 true, label %for.body.lr.ph, label %for.end53

for.body.lr.ph:                                   ; preds = %entry
  br i1 true, label %for.body.us.preheader, label %for.body.lr.ph.for.body22.lr.ph_crit_edge

for.body.lr.ph.for.body22.lr.ph_crit_edge:        ; preds = %for.body.lr.ph
  br label %for.body22.lr.ph

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond1.for.inc16_crit_edge.us, %for.body.us.preheader
  %indvars.iv40 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next41, %for.cond1.for.inc16_crit_edge.us ]
  %0 = add i64 %indvars.iv40, 1200
  %1 = trunc i64 %0 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body.us
  %indvars.iv36 = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next37, %for.body3.us ]
  %2 = add nuw nsw i64 %indvars.iv36, %indvars.iv40
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv40, i64 %indvars.iv36
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = trunc i64 %indvars.iv36 to i32
  %sub.us = sub i32 %1, %4
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv40, i64 %indvars.iv36
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 1200
  br i1 %exitcond39, label %for.cond1.for.inc16_crit_edge.us, label %for.body3.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next41, 1000
  br i1 %exitcond44, label %for.end18, label %for.body.us

for.end18:                                        ; preds = %for.cond1.for.inc16_crit_edge.us
  br i1 true, label %for.body22.lr.ph, label %for.end18.for.end53_crit_edge

for.end18.for.end53_crit_edge:                    ; preds = %for.end18
  br label %for.end53

for.body22.lr.ph:                                 ; preds = %for.body.lr.ph.for.body22.lr.ph_crit_edge, %for.end18
  br label %for.body26.lr.ph

for.body26.lr.ph:                                 ; preds = %for.body22.lr.ph, %for.inc51
  %indvars.iv50 = phi i3 [ -1, %for.body22.lr.ph ], [ %indvars.iv.next51, %for.inc51 ]
  %indvars.iv48 = phi i64 [ 2, %for.body22.lr.ph ], [ %indvars.iv.next49, %for.inc51 ]
  %indvars.iv33 = phi i64 [ 0, %for.body22.lr.ph ], [ %indvars.iv.next34, %for.inc51 ]
  %indvars.iv31 = phi i64 [ 1, %for.body22.lr.ph ], [ %indvars.iv.next32, %for.inc51 ]
  %5 = zext i3 %indvars.iv50 to i64
  %6 = add nuw nsw i64 %5, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = add i64 %indvars.iv48, %7
  %9 = sub nsw i64 0, %indvars.iv33
  %10 = trunc i64 %9 to i32
  %11 = add i32 1007, %10
  %12 = add i32 998, %10
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %xtraiter46 = and i64 %indvars.iv.next34, 1
  %lcmp.mod = icmp eq i64 %xtraiter46, 0
  br i1 %lcmp.mod, label %for.body26.prol.loopexit.unr-lcssa, label %for.body26.prol.preheader

for.body26.prol.preheader:                        ; preds = %for.body26.lr.ph
  %13 = trunc i64 %indvars.iv33 to i32
  %rem28.prol = srem i32 %13, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit.unr-lcssa

for.body26.prol.loopexit.unr-lcssa:               ; preds = %for.body26.lr.ph, %for.body26.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body26.prol.preheader ], [ 0, %for.body26.lr.ph ]
  %14 = icmp eq i64 %indvars.iv33, 0
  br i1 %14, label %for.end38, label %for.body26.preheader

for.body26.preheader:                             ; preds = %for.body26.prol.loopexit.unr-lcssa
  br label %for.body26

for.body26:                                       ; preds = %for.body26.preheader, %for.body26
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body26 ], [ %indvars.iv.unr.ph, %for.body26.preheader ]
  %15 = add nuw nsw i64 %indvars.iv, %indvars.iv33
  %16 = trunc i64 %15 to i32
  %rem28 = srem i32 %16, 100
  %conv29 = sitofp i32 %rem28 to double
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %17 = add nuw nsw i64 %indvars.iv.next, %indvars.iv33
  %18 = trunc i64 %17 to i32
  %rem28.1 = srem i32 %18, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.v.i0.1 = insertelement <2 x double> undef, double %conv29, i32 0
  %div31.v.i0.2 = insertelement <2 x double> %div31.v.i0.1, double %conv29.1, i32 1
  %div31 = fdiv <2 x double> %div31.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %19 = bitcast double* %arrayidx35 to <2 x double>*
  store <2 x double> %div31, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv31
  br i1 %exitcond.1, label %for.end38.loopexit, label %for.body26

for.end38.loopexit:                               ; preds = %for.body26
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.body26.prol.loopexit.unr-lcssa
  %cmp414 = icmp slt i64 %indvars.iv.next34, 1000
  br i1 %cmp414, label %for.body43.lr.ph, label %for.inc51

for.body43.lr.ph:                                 ; preds = %for.end38
  %xtraiter27 = and i32 %11, 7
  %lcmp.mod28 = icmp eq i32 %xtraiter27, 0
  br i1 %lcmp.mod28, label %for.body43.prol.loopexit, label %for.body43.prol.preheader

for.body43.prol.preheader:                        ; preds = %for.body43.lr.ph
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol.preheader, %for.body43.prol
  %indvars.iv24.prol = phi i64 [ %indvars.iv.next25.prol, %for.body43.prol ], [ %indvars.iv31, %for.body43.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body43.prol ], [ %xtraiter27, %for.body43.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv24.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next25.prol = add nuw nsw i64 %indvars.iv24.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol, !llvm.loop !1

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol.loopexit.loopexit, %for.body43.lr.ph
  %indvars.iv24.unr = phi i64 [ %indvars.iv31, %for.body43.lr.ph ], [ %8, %for.body43.prol.loopexit.loopexit ]
  %20 = icmp ult i32 %12, 7
  br i1 %20, label %for.inc51, label %for.body43.preheader

for.body43.preheader:                             ; preds = %for.body43.prol.loopexit
  %21 = sub i64 992, %indvars.iv24.unr
  %22 = lshr i64 %21, 3
  %23 = add nuw nsw i64 %22, 1
  %min.iters.check = icmp ult i64 %23, 2
  br i1 %min.iters.check, label %for.body43.preheader52, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body43.preheader
  %n.mod.vf = and i64 %23, 1
  %n.vec = sub nsw i64 %23, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %24 = add i64 %indvars.iv24.unr, 8
  %25 = shl nuw i64 %22, 3
  %26 = add i64 %24, %25
  %27 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %26, %27
  br i1 %cmp.zero, label %for.body43.preheader52, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %28 = shl i64 %index, 3
  %29 = add i64 %indvars.iv24.unr, %28
  %30 = add nsw i64 %29, 7
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %30
  %32 = getelementptr double, double* %31, i64 -7
  %33 = bitcast double* %32 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %33, align 8
  %index.next = add i64 %index, 2
  %34 = icmp eq i64 %index.next, %n.vec
  br i1 %34, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc51, label %for.body43.preheader52

for.body43.preheader52:                           ; preds = %middle.block, %min.iters.checked, %for.body43.preheader
  %indvars.iv24.ph = phi i64 [ %indvars.iv24.unr, %min.iters.checked ], [ %indvars.iv24.unr, %for.body43.preheader ], [ %ind.end, %middle.block ]
  br label %for.body43

for.body43:                                       ; preds = %for.body43.preheader52, %for.body43
  %indvars.iv24 = phi i64 [ %indvars.iv.next25.7, %for.body43 ], [ %indvars.iv24.ph, %for.body43.preheader52 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv24
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next25
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next25.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next25.2 = add nsw i64 %indvars.iv24, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next25.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next25.3 = add nsw i64 %indvars.iv24, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next25.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next25.4 = add nsw i64 %indvars.iv24, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next25.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next25.5 = add nsw i64 %indvars.iv24, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next25.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next25.6 = add nsw i64 %indvars.iv24, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next25.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next25.7 = add nsw i64 %indvars.iv24, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next25.7, 1000
  br i1 %exitcond.7, label %for.inc51.loopexit, label %for.body43, !llvm.loop !6

for.inc51.loopexit:                               ; preds = %for.body43
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %middle.block, %for.body43.prol.loopexit, %for.end38
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond = icmp eq i64 %indvars.iv.next34, 1000
  %indvars.iv.next49 = add nuw i64 %indvars.iv48, 1
  %indvars.iv.next51 = add i3 %indvars.iv50, -1
  br i1 %exitcond, label %for.end53.loopexit, label %for.body26.lr.ph

for.end53.loopexit:                               ; preds = %for.inc51
  br label %for.end53

for.end53:                                        ; preds = %for.end53.loopexit, %for.end18.for.end53_crit_edge, %entry
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #0 {
entry:
  br i1 true, label %for.body.lr.ph, label %for.end55

for.body.lr.ph:                                   ; preds = %entry
  %mul44 = fmul double %alpha, 0.000000e+00
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul32.v.i0.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body

for.body:                                         ; preds = %for.inc53, %for.body.lr.ph
  %indvars.iv31 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next32, %for.inc53 ]
  br i1 true, label %for.body3.lr.ph, label %for.inc53

for.body3.lr.ph:                                  ; preds = %for.body
  %arrayidx41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv31
  %cmp51 = icmp sgt i64 %indvars.iv31, 0
  br i1 %cmp51, label %for.body3.us.preheader, label %for.body3.preheader

for.body3.us.preheader:                           ; preds = %for.body3.lr.ph
  br label %for.body3.us

for.body3.preheader:                              ; preds = %for.body3.lr.ph
  br i1 true, label %for.body3.prol.loopexit.unr-lcssa, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.preheader
  %arrayidx31.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv31, i64 0
  %1 = load double, double* %arrayidx31.prol, align 8
  %mul32.prol = fmul double %1, %beta
  %arrayidx36.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv31, i64 0
  %2 = load double, double* %arrayidx36.prol, align 8
  %mul37.prol = fmul double %2, %alpha
  %3 = load double, double* %arrayidx41, align 8
  %mul42.prol = fmul double %mul37.prol, %3
  %add43.prol = fadd double %mul32.prol, %mul42.prol
  %add45.prol = fadd double %add43.prol, %mul44
  store double %add45.prol, double* %arrayidx31.prol, align 8
  br label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.loopexit.unr-lcssa:                ; preds = %for.body3.preheader, %for.body3.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.prol.preheader ], [ 0, %for.body3.preheader ]
  br i1 false, label %for.inc53, label %for.body3.preheader39

for.body3.preheader39:                            ; preds = %for.body3.prol.loopexit.unr-lcssa
  br label %for.body3

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.cond4.for.end_crit_edge.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.cond4.for.end_crit_edge.us ], [ 0, %for.body3.us.preheader ]
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv31, i64 %indvars.iv25
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.body6.us, %for.body3.us
  %indvars.iv18 = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next19, %for.body6.us ]
  %add273.us = phi double [ 0.000000e+00, %for.body3.us ], [ %add27.us, %for.body6.us ]
  %4 = load double, double* %arrayidx8.us, align 8
  %mul.us = fmul double %4, %alpha
  %arrayidx12.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv18
  %5 = load double, double* %arrayidx12.us, align 8
  %mul13.us = fmul double %mul.us, %5
  %arrayidx17.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv18, i64 %indvars.iv25
  %6 = load double, double* %arrayidx17.us, align 8
  %add.us = fadd double %mul13.us, %6
  store double %add.us, double* %arrayidx17.us, align 8
  %arrayidx21.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv18, i64 %indvars.iv25
  %7 = load double, double* %arrayidx21.us, align 8
  %8 = load double, double* %arrayidx12.us, align 8
  %mul26.us = fmul double %7, %8
  %add27.us = fadd double %add273.us, %mul26.us
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next19, %indvars.iv31
  br i1 %exitcond, label %for.cond4.for.end_crit_edge.us, label %for.body6.us

for.cond4.for.end_crit_edge.us:                   ; preds = %for.body6.us
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv31, i64 %indvars.iv25
  %9 = load double, double* %arrayidx31.us, align 8
  %mul32.us = fmul double %9, %beta
  %10 = load double, double* %arrayidx8.us, align 8
  %mul37.us = fmul double %10, %alpha
  %11 = load double, double* %arrayidx41, align 8
  %mul42.us = fmul double %mul37.us, %11
  %add43.us = fadd double %mul32.us, %mul42.us
  %mul44.us = fmul double %add27.us, %alpha
  %add45.us = fadd double %add43.us, %mul44.us
  store double %add45.us, double* %arrayidx31.us, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next26, 1200
  br i1 %exitcond30, label %for.inc53.loopexit, label %for.body3.us

for.body3:                                        ; preds = %for.body3.preheader39, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3 ], [ %indvars.iv.unr.ph, %for.body3.preheader39 ]
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv31, i64 %indvars.iv
  %12 = bitcast double* %arrayidx31 to <2 x double>*
  %arrayidx36 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv31, i64 %indvars.iv
  %13 = load double, double* %arrayidx36, align 8
  %mul37 = fmul double %13, %alpha
  %14 = load double, double* %arrayidx41, align 8
  %mul42 = fmul double %mul37, %14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx31.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv31, i64 %indvars.iv.next
  %15 = load <2 x double>, <2 x double>* %12, align 8
  %mul32 = fmul <2 x double> %mul32.v.i0.2, %15
  %mul32.v.r1 = extractelement <2 x double> %mul32, i32 0
  %mul32.v.r2 = extractelement <2 x double> %mul32, i32 1
  %add43 = fadd double %mul32.v.r1, %mul42
  %add45 = fadd double %add43, %mul44
  store double %add45, double* %arrayidx31, align 8
  %arrayidx36.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv31, i64 %indvars.iv.next
  %16 = load double, double* %arrayidx36.1, align 8
  %mul37.1 = fmul double %16, %alpha
  %17 = load double, double* %arrayidx41, align 8
  %mul42.1 = fmul double %mul37.1, %17
  %add43.1 = fadd double %mul32.v.r2, %mul42.1
  %add45.1 = fadd double %add43.1, %mul44
  store double %add45.1, double* %arrayidx31.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %for.inc53.loopexit40, label %for.body3

for.inc53.loopexit:                               ; preds = %for.cond4.for.end_crit_edge.us
  br label %for.inc53

for.inc53.loopexit40:                             ; preds = %for.body3
  br label %for.inc53

for.inc53:                                        ; preds = %for.inc53.loopexit40, %for.inc53.loopexit, %for.body3.prol.loopexit.unr-lcssa, %for.body
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond34, label %for.end55.loopexit, label %for.body

for.end55.loopexit:                               ; preds = %for.inc53
  br label %for.end55

for.end55:                                        ; preds = %for.end55.loopexit, %entry
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %for.body.us.preheader, label %for.end12

for.body.us.preheader:                            ; preds = %entry
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us, %for.body.us.preheader
  %indvars.iv10 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 1000, %indvars.iv10
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
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond14, label %for.end12.loopexit, label %for.body.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
