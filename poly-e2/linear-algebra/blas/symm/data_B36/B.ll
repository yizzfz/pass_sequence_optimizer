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

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc16, %entry
  %indvars.iv2233 = phi i64 [ 0, %entry ], [ %indvars.iv.next23, %for.inc16 ]
  %0 = add nuw nsw i64 %indvars.iv2233, 1200
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv1832 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next19, %for.body3 ]
  %1 = add nuw nsw i64 %indvars.iv1832, %indvars.iv2233
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 100
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.000000e+03
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2233, i64 %indvars.iv1832
  store double %div, double* %arrayidx6, align 8
  %3 = sub nuw nsw i64 %0, %indvars.iv1832
  %4 = trunc i64 %3 to i32
  %rem8 = srem i32 %4, 100
  %conv9 = sitofp i32 %rem8 to double
  %div11 = fdiv double %conv9, 1.000000e+03
  %arrayidx15 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv2233, i64 %indvars.iv1832
  store double %div11, double* %arrayidx15, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1832, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next19, 1200
  br i1 %exitcond35, label %for.inc16, label %for.body3

for.inc16:                                        ; preds = %for.body3
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2233, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next23, 1000
  br i1 %exitcond36, label %for.cond23.preheader.preheader, label %for.cond1.preheader

for.cond23.preheader.preheader:                   ; preds = %for.inc16
  br label %for.cond23.preheader

for.cond23.preheader:                             ; preds = %for.cond23.preheader.preheader, %for.inc51
  %indvars.iv1431 = phi i64 [ %indvars.iv.next15, %for.inc51 ], [ 1, %for.cond23.preheader.preheader ]
  %indvars.iv1629 = phi i64 [ %indvars.iv.next17, %for.inc51 ], [ 0, %for.cond23.preheader.preheader ]
  %5 = sub i64 999, %indvars.iv1629
  %6 = sub i64 998, %indvars.iv1629
  %7 = and i64 %indvars.iv1629, 1
  %lcmp.mod = icmp eq i64 %7, 0
  br i1 %lcmp.mod, label %for.body26.prol, label %for.body26.prol.loopexit

for.body26.prol:                                  ; preds = %for.cond23.preheader
  %8 = trunc i64 %indvars.iv1629 to i32
  %rem28.prol = srem i32 %8, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1629, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit

for.body26.prol.loopexit:                         ; preds = %for.body26.prol, %for.cond23.preheader
  %indvars.iv25.unr.ph = phi i64 [ 1, %for.body26.prol ], [ 0, %for.cond23.preheader ]
  %9 = icmp eq i64 %indvars.iv1629, 0
  br i1 %9, label %for.body43.preheader, label %for.body26.preheader

for.body26.preheader:                             ; preds = %for.body26.prol.loopexit
  br label %for.body26

for.cond40.preheader:                             ; preds = %for.body26
  %exitcond1327 = icmp eq i64 %indvars.iv1629, 999
  br i1 %exitcond1327, label %for.end53, label %for.body43.preheader

for.body43.preheader:                             ; preds = %for.body26.prol.loopexit, %for.cond40.preheader
  %xtraiter1 = and i64 %5, 7
  %lcmp.mod2 = icmp eq i64 %xtraiter1, 0
  br i1 %lcmp.mod2, label %for.body43.prol.loopexit, label %for.body43.prol.preheader

for.body43.prol.preheader:                        ; preds = %for.body43.preheader
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol.preheader, %for.body43.prol
  %indvars.iv.next1128.in.prol = phi i64 [ %indvars.iv.next1128.prol, %for.body43.prol ], [ %indvars.iv1629, %for.body43.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body43.prol ], [ %xtraiter1, %for.body43.prol.preheader ]
  %indvars.iv.next1128.prol = add nuw nsw i64 %indvars.iv.next1128.in.prol, 1
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1629, i64 %indvars.iv.next1128.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol, !llvm.loop !1

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol.loopexit.loopexit, %for.body43.preheader
  %indvars.iv.next1128.in.unr = phi i64 [ %indvars.iv1629, %for.body43.preheader ], [ %indvars.iv.next1128.prol, %for.body43.prol.loopexit.loopexit ]
  %10 = icmp ult i64 %6, 7
  br i1 %10, label %for.inc51, label %for.body43.preheader8

for.body43.preheader8:                            ; preds = %for.body43.prol.loopexit
  %11 = sub i64 991, %indvars.iv.next1128.in.unr
  %12 = lshr i64 %11, 3
  %13 = add nuw nsw i64 %12, 1
  %min.iters.check = icmp ult i64 %13, 2
  br i1 %min.iters.check, label %for.body43.preheader9, label %min.iters.checked

for.body43.preheader9:                            ; preds = %middle.block, %min.iters.checked, %for.body43.preheader8
  %indvars.iv.next1128.in.ph = phi i64 [ %indvars.iv.next1128.in.unr, %min.iters.checked ], [ %indvars.iv.next1128.in.unr, %for.body43.preheader8 ], [ %ind.end, %middle.block ]
  br label %for.body43

min.iters.checked:                                ; preds = %for.body43.preheader8
  %n.mod.vf = and i64 %13, 1
  %n.vec = sub nsw i64 %13, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %14 = add i64 %indvars.iv.next1128.in.unr, 8
  %15 = shl nuw i64 %12, 3
  %16 = add i64 %14, %15
  %17 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %16, %17
  br i1 %cmp.zero, label %for.body43.preheader9, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %18 = shl i64 %index, 3
  %19 = add i64 %indvars.iv.next1128.in.unr, %18
  %20 = add nsw i64 %19, 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1629, i64 %20
  %22 = getelementptr double, double* %21, i64 -7
  %23 = bitcast double* %22 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %23, align 8
  %index.next = add i64 %index, 2
  %24 = icmp eq i64 %index.next, %n.vec
  br i1 %24, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc51, label %for.body43.preheader9

for.body26:                                       ; preds = %for.body26.preheader, %for.body26
  %indvars.iv25 = phi i64 [ %indvars.iv.next.1, %for.body26 ], [ %indvars.iv25.unr.ph, %for.body26.preheader ]
  %25 = add nuw nsw i64 %indvars.iv25, %indvars.iv1629
  %26 = trunc i64 %25 to i32
  %rem28 = srem i32 %26, 100
  %conv29 = sitofp i32 %rem28 to double
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1629, i64 %indvars.iv25
  %indvars.iv.next = add nuw nsw i64 %indvars.iv25, 1
  %27 = add nuw nsw i64 %indvars.iv.next, %indvars.iv1629
  %28 = trunc i64 %27 to i32
  %rem28.1 = srem i32 %28, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.v.i0.1 = insertelement <2 x double> undef, double %conv29, i32 0
  %div31.v.i0.2 = insertelement <2 x double> %div31.v.i0.1, double %conv29.1, i32 1
  %div31 = fdiv <2 x double> %div31.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %29 = bitcast double* %arrayidx35 to <2 x double>*
  store <2 x double> %div31, <2 x double>* %29, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv25, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv1431
  br i1 %exitcond.1, label %for.cond40.preheader, label %for.body26

for.body43:                                       ; preds = %for.body43.preheader9, %for.body43
  %indvars.iv.next1128.in = phi i64 [ %indvars.iv.next1128.7, %for.body43 ], [ %indvars.iv.next1128.in.ph, %for.body43.preheader9 ]
  %indvars.iv.next1128 = add nuw nsw i64 %indvars.iv.next1128.in, 1
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1629, i64 %indvars.iv.next1128
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next1128.1 = add nsw i64 %indvars.iv.next1128.in, 2
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1629, i64 %indvars.iv.next1128.1
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next1128.2 = add nsw i64 %indvars.iv.next1128.in, 3
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1629, i64 %indvars.iv.next1128.2
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next1128.3 = add nsw i64 %indvars.iv.next1128.in, 4
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1629, i64 %indvars.iv.next1128.3
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next1128.4 = add nsw i64 %indvars.iv.next1128.in, 5
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1629, i64 %indvars.iv.next1128.4
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next1128.5 = add nsw i64 %indvars.iv.next1128.in, 6
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1629, i64 %indvars.iv.next1128.5
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next1128.6 = add nsw i64 %indvars.iv.next1128.in, 7
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1629, i64 %indvars.iv.next1128.6
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next1128.7 = add nsw i64 %indvars.iv.next1128.in, 8
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1629, i64 %indvars.iv.next1128.7
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %exitcond13.7 = icmp eq i64 %indvars.iv.next1128.7, 999
  br i1 %exitcond13.7, label %for.inc51.loopexit, label %for.body43, !llvm.loop !6

for.inc51.loopexit:                               ; preds = %for.body43
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %middle.block, %for.body43.prol.loopexit
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1629, 1
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1431, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond34, label %for.end53, label %for.cond23.preheader

for.end53:                                        ; preds = %for.cond40.preheader, %for.inc51
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_symm(double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  %mul44.us = fmul double %alpha, 0.000000e+00
  %mul44.us.1 = fmul double %alpha, 0.000000e+00
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul32.us.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc53, %entry
  %indvars.iv712 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc53 ]
  %exitcond9 = icmp eq i64 %indvars.iv712, 0
  %arrayidx41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv712, i64 %indvars.iv712
  br i1 %exitcond9, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond4.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond1.preheader
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.cond4.preheader.us
  %indvars.iv511.us = phi i64 [ %indvars.iv.next6.us.1, %for.cond4.preheader.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv712, i64 %indvars.iv511.us
  %1 = bitcast double* %arrayidx31.us to <2 x double>*
  %arrayidx36.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv712, i64 %indvars.iv511.us
  %2 = load double, double* %arrayidx36.us, align 8
  %mul37.us = fmul double %2, %alpha
  %3 = load double, double* %arrayidx41, align 8
  %mul42.us = fmul double %mul37.us, %3
  %indvars.iv.next6.us = or i64 %indvars.iv511.us, 1
  %arrayidx31.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv712, i64 %indvars.iv.next6.us
  %4 = load <2 x double>, <2 x double>* %1, align 8
  %mul32.us = fmul <2 x double> %4, %mul32.us.v.i1.2
  %mul32.us.v.r1 = extractelement <2 x double> %mul32.us, i32 0
  %mul32.us.v.r2 = extractelement <2 x double> %mul32.us, i32 1
  %add43.us = fadd double %mul32.us.v.r1, %mul42.us
  %add45.us = fadd double %mul44.us, %add43.us
  store double %add45.us, double* %arrayidx31.us, align 8
  %arrayidx36.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv712, i64 %indvars.iv.next6.us
  %5 = load double, double* %arrayidx36.us.1, align 8
  %mul37.us.1 = fmul double %5, %alpha
  %6 = load double, double* %arrayidx41, align 8
  %mul42.us.1 = fmul double %mul37.us.1, %6
  %add43.us.1 = fadd double %mul32.us.v.r2, %mul42.us.1
  %add45.us.1 = fadd double %mul44.us.1, %add43.us.1
  store double %add45.us.1, double* %arrayidx31.us.1, align 8
  %indvars.iv.next6.us.1 = add nsw i64 %indvars.iv511.us, 2
  %exitcond16.1 = icmp eq i64 %indvars.iv.next6.us.1, 1200
  br i1 %exitcond16.1, label %for.inc53.loopexit, label %for.cond4.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.end
  %indvars.iv511 = phi i64 [ %indvars.iv.next6, %for.end ], [ 0, %for.cond4.preheader.preheader ]
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv712, i64 %indvars.iv511
  br label %for.body6

for.body6:                                        ; preds = %for.cond4.preheader, %for.body6
  %7 = phi double [ 0.000000e+00, %for.cond4.preheader ], [ %add27, %for.body6 ]
  %indvars.iv10 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next, %for.body6 ]
  %8 = load double, double* %arrayidx8, align 8
  %mul = fmul double %8, %alpha
  %arrayidx12 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv712, i64 %indvars.iv10
  %9 = load double, double* %arrayidx12, align 8
  %mul13 = fmul double %mul, %9
  %arrayidx17 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv10, i64 %indvars.iv511
  %10 = load double, double* %arrayidx17, align 8
  %add = fadd double %10, %mul13
  store double %add, double* %arrayidx17, align 8
  %arrayidx21 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv10, i64 %indvars.iv511
  %11 = load double, double* %arrayidx21, align 8
  %12 = load double, double* %arrayidx12, align 8
  %mul26 = fmul double %11, %12
  %add27 = fadd double %7, %mul26
  %indvars.iv.next = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv712
  br i1 %exitcond, label %for.end, label %for.body6

for.end:                                          ; preds = %for.body6
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv712, i64 %indvars.iv511
  %13 = load double, double* %arrayidx31, align 8
  %mul32 = fmul double %13, %beta
  %arrayidx36 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv712, i64 %indvars.iv511
  %14 = load double, double* %arrayidx36, align 8
  %mul37 = fmul double %14, %alpha
  %15 = load double, double* %arrayidx41, align 8
  %mul42 = fmul double %mul37, %15
  %add43 = fadd double %mul32, %mul42
  %mul44 = fmul double %add27, %alpha
  %add45 = fadd double %mul44, %add43
  store double %add45, double* %arrayidx31, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv511, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond15, label %for.inc53.loopexit3, label %for.cond4.preheader

for.inc53.loopexit:                               ; preds = %for.cond4.preheader.us
  br label %for.inc53

for.inc53.loopexit3:                              ; preds = %for.end
  br label %for.inc53

for.inc53:                                        ; preds = %for.inc53.loopexit3, %for.inc53.loopexit
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv712, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond17, label %for.end55, label %for.cond1.preheader

for.end55:                                        ; preds = %for.inc53
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv37 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv37, 1000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv6, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv37, i64 %indvars.iv6
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next4, 1000
  br i1 %exitcond8, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
