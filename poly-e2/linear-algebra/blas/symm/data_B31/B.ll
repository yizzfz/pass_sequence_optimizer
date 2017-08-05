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
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body

for.body:                                         ; preds = %for.end, %entry
  %indvars.iv1732 = phi i64 [ 0, %entry ], [ %indvars.iv.next18, %for.end ]
  %0 = add nuw nsw i64 %indvars.iv1732, 1200
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body
  %indvars.iv1330 = phi i64 [ 0, %for.body ], [ %indvars.iv.next14, %for.body3 ]
  %1 = add nuw nsw i64 %indvars.iv1330, %indvars.iv1732
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 100
  %conv = sitofp i32 %rem to double
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1732, i64 %indvars.iv1330
  %3 = sub nuw nsw i64 %0, %indvars.iv1330
  %4 = trunc i64 %3 to i32
  %rem8 = srem i32 %4, 100
  %conv9 = sitofp i32 %rem8 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv9, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx6, align 8
  %arrayidx15 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv1732, i64 %indvars.iv1330
  store double %div.v.r2, double* %arrayidx15, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1330, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond37, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv1732, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next18, 1000
  br i1 %exitcond38, label %for.body22.preheader, label %for.body

for.body22.preheader:                             ; preds = %for.end
  br label %for.body22

for.body22:                                       ; preds = %for.body22.preheader, %for.end50
  %indvars.iv = phi i64 [ %indvars.iv.next35, %for.end50 ], [ 1, %for.body22.preheader ]
  %indvars.iv1126 = phi i64 [ %indvars.iv.next12, %for.end50 ], [ 0, %for.body22.preheader ]
  %5 = sub i64 999, %indvars.iv1126
  %6 = sub i64 998, %indvars.iv1126
  %7 = and i64 %indvars.iv1126, 1
  %lcmp.mod = icmp eq i64 %7, 0
  br i1 %lcmp.mod, label %for.body26.prol, label %for.body26.prol.loopexit

for.body26.prol:                                  ; preds = %for.body22
  %8 = trunc i64 %indvars.iv1126 to i32
  %rem28.prol = srem i32 %8, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1126, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit

for.body26.prol.loopexit:                         ; preds = %for.body22, %for.body26.prol
  %indvars.iv21.unr.ph = phi i64 [ 1, %for.body26.prol ], [ 0, %for.body22 ]
  %9 = icmp eq i64 %indvars.iv1126, 0
  br i1 %9, label %for.end38, label %for.body26.preheader

for.body26.preheader:                             ; preds = %for.body26.prol.loopexit
  br label %for.body26

for.body26:                                       ; preds = %for.body26.preheader, %for.body26
  %indvars.iv21 = phi i64 [ %indvars.iv.next.1, %for.body26 ], [ %indvars.iv21.unr.ph, %for.body26.preheader ]
  %10 = add nuw nsw i64 %indvars.iv21, %indvars.iv1126
  %11 = trunc i64 %10 to i32
  %rem28 = srem i32 %11, 100
  %conv29 = sitofp i32 %rem28 to double
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1126, i64 %indvars.iv21
  %indvars.iv.next = add nuw nsw i64 %indvars.iv21, 1
  %12 = add nuw nsw i64 %indvars.iv.next, %indvars.iv1126
  %13 = trunc i64 %12 to i32
  %rem28.1 = srem i32 %13, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.v.i0.1 = insertelement <2 x double> undef, double %conv29, i32 0
  %div31.v.i0.2 = insertelement <2 x double> %div31.v.i0.1, double %conv29.1, i32 1
  %div31 = fdiv <2 x double> %div31.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %arrayidx35 to <2 x double>*
  store <2 x double> %div31, <2 x double>* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv21, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv
  br i1 %exitcond.1, label %for.end38.loopexit, label %for.body26

for.end38.loopexit:                               ; preds = %for.body26
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.body26.prol.loopexit
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1126, 1
  %cmp4123 = icmp slt i64 %indvars.iv, 1000
  br i1 %cmp4123, label %for.body43.lr.ph, label %for.end50

for.body43.lr.ph:                                 ; preds = %for.end38
  %xtraiter39 = and i64 %5, 7
  %lcmp.mod40 = icmp eq i64 %xtraiter39, 0
  br i1 %lcmp.mod40, label %for.body43.prol.loopexit, label %for.body43.prol.preheader

for.body43.prol.preheader:                        ; preds = %for.body43.lr.ph
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol.preheader, %for.body43.prol
  %indvars.iv724.prol = phi i64 [ %indvars.iv.next8.prol, %for.body43.prol ], [ %indvars.iv, %for.body43.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body43.prol ], [ %xtraiter39, %for.body43.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1126, i64 %indvars.iv724.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next8.prol = add nuw nsw i64 %indvars.iv724.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol, !llvm.loop !1

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol.loopexit.loopexit, %for.body43.lr.ph
  %indvars.iv724.unr = phi i64 [ %indvars.iv, %for.body43.lr.ph ], [ %indvars.iv.next8.prol, %for.body43.prol.loopexit.loopexit ]
  %15 = icmp ult i64 %6, 7
  br i1 %15, label %for.end50, label %for.body43.prol.loopexit.for.body43_crit_edge

for.body43.prol.loopexit.for.body43_crit_edge:    ; preds = %for.body43.prol.loopexit
  %16 = sub i64 992, %indvars.iv724.unr
  %17 = lshr i64 %16, 3
  %18 = add nuw nsw i64 %17, 1
  %min.iters.check = icmp ult i64 %18, 2
  br i1 %min.iters.check, label %for.body43.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body43.prol.loopexit.for.body43_crit_edge
  %n.mod.vf = and i64 %18, 1
  %n.vec = sub nsw i64 %18, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %19 = add i64 %indvars.iv724.unr, 8
  %20 = shl nuw i64 %17, 3
  %21 = add i64 %19, %20
  %22 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %21, %22
  br i1 %cmp.zero, label %for.body43.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %23 = shl i64 %index, 3
  %24 = add i64 %indvars.iv724.unr, %23
  %25 = add nsw i64 %24, 7
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1126, i64 %25
  %27 = getelementptr double, double* %26, i64 -7
  %28 = bitcast double* %27 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %28, align 8
  %index.next = add i64 %index, 2
  %29 = icmp eq i64 %index.next, %n.vec
  br i1 %29, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.end50, label %for.body43.preheader

for.body43.preheader:                             ; preds = %middle.block, %min.iters.checked, %for.body43.prol.loopexit.for.body43_crit_edge
  %indvars.iv724.ph = phi i64 [ %indvars.iv724.unr, %min.iters.checked ], [ %indvars.iv724.unr, %for.body43.prol.loopexit.for.body43_crit_edge ], [ %ind.end, %middle.block ]
  br label %for.body43

for.body43:                                       ; preds = %for.body43.preheader, %for.body43
  %indvars.iv724 = phi i64 [ %indvars.iv.next8.7, %for.body43 ], [ %indvars.iv724.ph, %for.body43.preheader ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1126, i64 %indvars.iv724
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv724, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1126, i64 %indvars.iv.next8
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv724, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1126, i64 %indvars.iv.next8.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next8.2 = add nsw i64 %indvars.iv724, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1126, i64 %indvars.iv.next8.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next8.3 = add nsw i64 %indvars.iv724, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1126, i64 %indvars.iv.next8.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next8.4 = add nsw i64 %indvars.iv724, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1126, i64 %indvars.iv.next8.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next8.5 = add nsw i64 %indvars.iv724, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1126, i64 %indvars.iv.next8.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next8.6 = add nsw i64 %indvars.iv724, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1126, i64 %indvars.iv.next8.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next8.7 = add nsw i64 %indvars.iv724, 8
  %exitcond34.7 = icmp eq i64 %indvars.iv.next8.7, 1000
  br i1 %exitcond34.7, label %for.end50.loopexit, label %for.body43, !llvm.loop !6

for.end50.loopexit:                               ; preds = %for.body43
  br label %for.end50

for.end50:                                        ; preds = %for.end50.loopexit, %middle.block, %for.body43.prol.loopexit, %for.end38
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond36, label %for.end53, label %for.body22

for.end53:                                        ; preds = %for.end50
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #2 {
entry:
  %A.addr = alloca [1000 x double]*, align 8
  %B.addr = alloca [1200 x double]*, align 8
  %temp2 = alloca double, align 8
  store [1000 x double]* %A, [1000 x double]** %A.addr, align 8
  store [1200 x double]* %B, [1200 x double]** %B.addr, align 8
  %mul44 = fmul double %alpha, 0.000000e+00
  br label %for.body

for.body:                                         ; preds = %for.end52, %entry
  %0 = phi [1200 x double]* [ %B, %entry ], [ %.lcssa13, %for.end52 ]
  %1 = phi [1000 x double]* [ %A, %entry ], [ %.lcssa14, %for.end52 ]
  %indvars.iv923 = phi i64 [ 0, %entry ], [ %indvars.iv.next10, %for.end52 ]
  %exitcond15 = icmp eq i64 %indvars.iv923, 0
  br i1 %exitcond15, label %for.body3.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body
  br label %for.body3.us

for.body3.preheader:                              ; preds = %for.body
  %arrayidx41 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv923, i64 %indvars.iv923
  br label %for.body3

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.cond4.for.end_crit_edge.us
  %2 = phi [1200 x double]* [ %9, %for.cond4.for.end_crit_edge.us ], [ %0, %for.body3.us.preheader ]
  %3 = phi [1000 x double]* [ %11, %for.cond4.for.end_crit_edge.us ], [ %1, %for.body3.us.preheader ]
  %indvars.iv720.us = phi i64 [ %indvars.iv.next8.us, %for.cond4.for.end_crit_edge.us ], [ 0, %for.body3.us.preheader ]
  store double 0.000000e+00, double* %temp2, align 8
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.body6.us, %for.body3.us
  %4 = phi [1200 x double]* [ %2, %for.body3.us ], [ %9, %for.body6.us ]
  %5 = phi [1000 x double]* [ %3, %for.body3.us ], [ %11, %for.body6.us ]
  %indvars.iv16.us = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next.us, %for.body6.us ]
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv923, i64 %indvars.iv720.us
  %6 = load double, double* %arrayidx8.us, align 8
  %mul.us = fmul double %6, %alpha
  %arrayidx12.us = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv923, i64 %indvars.iv16.us
  %7 = load double, double* %arrayidx12.us, align 8
  %mul13.us = fmul double %mul.us, %7
  %arrayidx17.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv16.us, i64 %indvars.iv720.us
  %8 = load double, double* %arrayidx17.us, align 8
  %add.us = fadd double %8, %mul13.us
  store double %add.us, double* %arrayidx17.us, align 8
  %9 = load [1200 x double]*, [1200 x double]** %B.addr, align 8
  %arrayidx21.us = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv16.us, i64 %indvars.iv720.us
  %10 = load double, double* %arrayidx21.us, align 8
  %11 = load [1000 x double]*, [1000 x double]** %A.addr, align 8
  %arrayidx25.us = getelementptr inbounds [1000 x double], [1000 x double]* %11, i64 %indvars.iv923, i64 %indvars.iv16.us
  %12 = load double, double* %arrayidx25.us, align 8
  %mul26.us = fmul double %10, %12
  %13 = load double, double* %temp2, align 8
  %add27.us = fadd double %13, %mul26.us
  store double %add27.us, double* %temp2, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv16.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %indvars.iv923
  br i1 %exitcond.us, label %for.cond4.for.end_crit_edge.us, label %for.body6.us

for.cond4.for.end_crit_edge.us:                   ; preds = %for.body6.us
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv923, i64 %indvars.iv720.us
  %14 = load double, double* %arrayidx31.us, align 8
  %mul32.us = fmul double %14, %beta
  %arrayidx36.us = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv923, i64 %indvars.iv720.us
  %15 = load double, double* %arrayidx36.us, align 8
  %mul37.us = fmul double %15, %alpha
  %arrayidx41.us = getelementptr inbounds [1000 x double], [1000 x double]* %11, i64 %indvars.iv923, i64 %indvars.iv923
  %16 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %mul37.us, %16
  %add43.us = fadd double %mul32.us, %mul42.us
  %mul44.us = fmul double %add27.us, %alpha
  %add45.us = fadd double %mul44.us, %add43.us
  store double %add45.us, double* %arrayidx31.us, align 8
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv720.us, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next8.us, 1200
  br i1 %exitcond27, label %for.end52.loopexit34, label %for.body3.us

for.body3:                                        ; preds = %for.body3, %for.body3.preheader
  %indvars.iv720 = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next8.1, %for.body3 ]
  store double 0.000000e+00, double* %temp2, align 8
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv923, i64 %indvars.iv720
  %17 = load double, double* %arrayidx31, align 8
  %mul32 = fmul double %17, %beta
  %arrayidx36 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv923, i64 %indvars.iv720
  %18 = load double, double* %arrayidx36, align 8
  %mul37 = fmul double %18, %alpha
  %19 = load double, double* %arrayidx41, align 8
  %mul42 = fmul double %mul37, %19
  %add43 = fadd double %mul32, %mul42
  %add45 = fadd double %mul44, %add43
  store double %add45, double* %arrayidx31, align 8
  %indvars.iv.next8 = or i64 %indvars.iv720, 1
  store double 0.000000e+00, double* %temp2, align 8
  %arrayidx31.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv923, i64 %indvars.iv.next8
  %20 = load double, double* %arrayidx31.1, align 8
  %mul32.1 = fmul double %20, %beta
  %arrayidx36.1 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv923, i64 %indvars.iv.next8
  %21 = load double, double* %arrayidx36.1, align 8
  %mul37.1 = fmul double %21, %alpha
  %22 = load double, double* %arrayidx41, align 8
  %mul42.1 = fmul double %mul37.1, %22
  %add43.1 = fadd double %mul32.1, %mul42.1
  %add45.1 = fadd double %mul44, %add43.1
  store double %add45.1, double* %arrayidx31.1, align 8
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv720, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next8.1, 1200
  br i1 %exitcond.1, label %for.end52.loopexit, label %for.body3

for.end52.loopexit:                               ; preds = %for.body3
  br label %for.end52

for.end52.loopexit34:                             ; preds = %for.cond4.for.end_crit_edge.us
  br label %for.end52

for.end52:                                        ; preds = %for.end52.loopexit34, %for.end52.loopexit
  %.lcssa14 = phi [1000 x double]* [ %1, %for.end52.loopexit ], [ %11, %for.end52.loopexit34 ]
  %.lcssa13 = phi [1200 x double]* [ %0, %for.end52.loopexit ], [ %9, %for.end52.loopexit34 ]
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv923, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond28, label %for.end55, label %for.body

for.end55:                                        ; preds = %for.end52
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.end, %entry
  %indvars.iv26 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.end ]
  %3 = mul nuw nsw i64 %indvars.iv26, 1000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.body
  %indvars.iv5 = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv5, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv26, i64 %indvars.iv5
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.end, label %for.body4

for.end:                                          ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond8, label %for.end12, label %for.body

for.end12:                                        ; preds = %for.end
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
