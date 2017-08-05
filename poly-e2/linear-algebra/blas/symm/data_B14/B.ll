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
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_symm(double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  call fastcc void @print_array([1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc16, %entry
  %indvars.iv58 = phi i64 [ 0, %entry ], [ %indvars.iv.next59, %for.inc16 ]
  %0 = add nuw nsw i64 %indvars.iv58, 1200
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv53 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next54, %for.body3 ]
  %1 = add nuw nsw i64 %indvars.iv53, %indvars.iv58
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 100
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.000000e+03
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv58, i64 %indvars.iv53
  store double %div, double* %arrayidx6, align 8
  %3 = sub nuw nsw i64 %0, %indvars.iv53
  %4 = trunc i64 %3 to i32
  %rem8 = srem i32 %4, 100
  %conv9 = sitofp i32 %rem8 to double
  %div11 = fdiv double %conv9, 1.000000e+03
  %arrayidx15 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv58, i64 %indvars.iv53
  store double %div11, double* %arrayidx15, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next54, 1200
  br i1 %exitcond57, label %for.inc16, label %for.body3

for.inc16:                                        ; preds = %for.body3
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, 1000
  br i1 %exitcond61, label %for.body26.lr.ph.preheader, label %for.cond1.preheader

for.body26.lr.ph.preheader:                       ; preds = %for.inc16
  br label %for.body26.lr.ph

for.cond19.loopexit.loopexit:                     ; preds = %for.body43
  br label %for.cond19.loopexit

for.cond19.loopexit:                              ; preds = %for.cond19.loopexit.loopexit, %middle.block, %for.body43.prol.loopexit, %for.end38
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond = icmp eq i64 %indvars.iv.next52, 1000
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %indvars.iv.next66 = add i3 %indvars.iv65, -1
  br i1 %exitcond, label %for.end53, label %for.body26.lr.ph

for.body26.lr.ph:                                 ; preds = %for.body26.lr.ph.preheader, %for.cond19.loopexit
  %indvars.iv65 = phi i3 [ %indvars.iv.next66, %for.cond19.loopexit ], [ -1, %for.body26.lr.ph.preheader ]
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.cond19.loopexit ], [ 2, %for.body26.lr.ph.preheader ]
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.cond19.loopexit ], [ 0, %for.body26.lr.ph.preheader ]
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.cond19.loopexit ], [ 1, %for.body26.lr.ph.preheader ]
  %5 = zext i3 %indvars.iv65 to i64
  %6 = add nuw nsw i64 %5, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = add i64 %indvars.iv63, %7
  %9 = sub nuw nsw i64 999, %indvars.iv51
  %10 = sub nsw i64 998, %indvars.iv51
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %xtraiter62 = and i64 %indvars.iv.next52, 1
  %lcmp.mod = icmp eq i64 %xtraiter62, 0
  br i1 %lcmp.mod, label %for.body26.prol.loopexit.unr-lcssa, label %for.body26.prol.preheader

for.body26.prol.preheader:                        ; preds = %for.body26.lr.ph
  %11 = trunc i64 %indvars.iv51 to i32
  %rem28.prol = srem i32 %11, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit.unr-lcssa

for.body26.prol.loopexit.unr-lcssa:               ; preds = %for.body26.lr.ph, %for.body26.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body26.prol.preheader ], [ 0, %for.body26.lr.ph ]
  %12 = icmp eq i64 %indvars.iv51, 0
  br i1 %12, label %for.end38, label %for.body26.preheader

for.body26.preheader:                             ; preds = %for.body26.prol.loopexit.unr-lcssa
  br label %for.body26

for.body26:                                       ; preds = %for.body26.preheader, %for.body26
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body26 ], [ %indvars.iv.unr.ph, %for.body26.preheader ]
  %13 = add nuw nsw i64 %indvars.iv, %indvars.iv51
  %14 = trunc i64 %13 to i32
  %rem28 = srem i32 %14, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = add nuw nsw i64 %indvars.iv.next, %indvars.iv51
  %16 = trunc i64 %15 to i32
  %rem28.1 = srem i32 %16, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, 1.000000e+03
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv49
  br i1 %exitcond.1, label %for.end38.loopexit, label %for.body26

for.end38.loopexit:                               ; preds = %for.body26
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.body26.prol.loopexit.unr-lcssa
  %cmp4132 = icmp slt i64 %indvars.iv.next52, 1000
  br i1 %cmp4132, label %for.body43.lr.ph, label %for.cond19.loopexit

for.body43.lr.ph:                                 ; preds = %for.end38
  %17 = trunc i64 %9 to i32
  %xtraiter45 = and i32 %17, 7
  %lcmp.mod46 = icmp eq i32 %xtraiter45, 0
  br i1 %lcmp.mod46, label %for.body43.prol.loopexit, label %for.body43.prol.preheader

for.body43.prol.preheader:                        ; preds = %for.body43.lr.ph
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol.preheader, %for.body43.prol
  %indvars.iv43.prol = phi i64 [ %indvars.iv.next44.prol, %for.body43.prol ], [ %indvars.iv49, %for.body43.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body43.prol ], [ %xtraiter45, %for.body43.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv43.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next44.prol = add nuw nsw i64 %indvars.iv43.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol, !llvm.loop !1

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol.loopexit.loopexit, %for.body43.lr.ph
  %indvars.iv43.unr = phi i64 [ %indvars.iv49, %for.body43.lr.ph ], [ %8, %for.body43.prol.loopexit.loopexit ]
  %18 = trunc i64 %10 to i32
  %19 = icmp ult i32 %18, 7
  br i1 %19, label %for.cond19.loopexit, label %for.body43.preheader

for.body43.preheader:                             ; preds = %for.body43.prol.loopexit
  %20 = sub i64 992, %indvars.iv43.unr
  %21 = lshr i64 %20, 3
  %22 = add nuw nsw i64 %21, 1
  %min.iters.check = icmp ult i64 %22, 2
  br i1 %min.iters.check, label %for.body43.preheader1, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body43.preheader
  %n.mod.vf = and i64 %22, 1
  %n.vec = sub nsw i64 %22, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %23 = add i64 %indvars.iv43.unr, 8
  %24 = shl nuw i64 %21, 3
  %25 = add i64 %23, %24
  %26 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %25, %26
  br i1 %cmp.zero, label %for.body43.preheader1, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %27 = shl i64 %index, 3
  %28 = add i64 %indvars.iv43.unr, %27
  %29 = add nsw i64 %28, 7
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %29
  %31 = getelementptr double, double* %30, i64 -7
  %32 = bitcast double* %31 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %32, align 8
  %index.next = add i64 %index, 2
  %33 = icmp eq i64 %index.next, %n.vec
  br i1 %33, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond19.loopexit, label %for.body43.preheader1

for.body43.preheader1:                            ; preds = %middle.block, %min.iters.checked, %for.body43.preheader
  %indvars.iv43.ph = phi i64 [ %indvars.iv43.unr, %min.iters.checked ], [ %indvars.iv43.unr, %for.body43.preheader ], [ %ind.end, %middle.block ]
  br label %for.body43

for.body43:                                       ; preds = %for.body43.preheader1, %for.body43
  %indvars.iv43 = phi i64 [ %indvars.iv.next44.7, %for.body43 ], [ %indvars.iv43.ph, %for.body43.preheader1 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv43
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv.next44
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv.next44.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next44.2 = add nsw i64 %indvars.iv43, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv.next44.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next44.3 = add nsw i64 %indvars.iv43, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv.next44.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next44.4 = add nsw i64 %indvars.iv43, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv.next44.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next44.5 = add nsw i64 %indvars.iv43, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv.next44.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next44.6 = add nsw i64 %indvars.iv43, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv.next44.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next44.7 = add nsw i64 %indvars.iv43, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next44.7, 1000
  br i1 %exitcond.7, label %for.cond19.loopexit.loopexit, label %for.body43, !llvm.loop !6

for.end53:                                        ; preds = %for.cond19.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %mul44 = fmul double %alpha, 0.000000e+00
  %broadcast.splatinsert16 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat17 = shufflevector <2 x double> %broadcast.splatinsert16, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert20 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat21 = shufflevector <2 x double> %broadcast.splatinsert20, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert22 = insertelement <2 x double> undef, double %mul44, i32 0
  %broadcast.splat23 = shufflevector <2 x double> %broadcast.splatinsert22, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc53, %entry
  %indvars.iv49 = phi i64 [ 0, %entry ], [ %indvars.iv.next50, %for.inc53 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv49, i64 0
  %0 = add i64 %indvars.iv49, 1
  %scevgep4 = getelementptr [1200 x double], [1200 x double]* %C, i64 %0, i64 0
  %cmp532 = icmp sgt i64 %indvars.iv49, 0
  %arrayidx41.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv49
  br i1 %cmp532, label %for.cond4.preheader.us.preheader, label %vector.memcheck

for.cond4.preheader.us.preheader:                 ; preds = %for.cond1.preheader
  br label %for.cond4.preheader.us

vector.memcheck:                                  ; preds = %for.cond1.preheader
  %scevgep8 = getelementptr [1200 x double], [1200 x double]* %B, i64 %0, i64 0
  %scevgep6 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv49, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %found.conflict = and i1 %bound0, %bound1
  %bound011 = icmp ult double* %scevgep, %arrayidx41.us
  %bound112 = icmp ult double* %arrayidx41.us, %scevgep4
  %found.conflict13 = and i1 %bound011, %bound112
  %conflict.rdx = or i1 %found.conflict, %found.conflict13
  br i1 %conflict.rdx, label %for.cond4.preheader.preheader, label %vector.ph

for.cond4.preheader.preheader:                    ; preds = %vector.memcheck
  br label %for.cond4.preheader

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv49, i64 %index
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !8, !noalias !11
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !8, !noalias !11
  %5 = fmul <2 x double> %wide.load, %broadcast.splat17
  %6 = fmul <2 x double> %wide.load15, %broadcast.splat17
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv49, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !14
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !14
  %11 = fmul <2 x double> %wide.load18, %broadcast.splat21
  %12 = fmul <2 x double> %wide.load19, %broadcast.splat21
  %13 = load double, double* %arrayidx41.us, align 8, !alias.scope !15
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %13, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fmul <2 x double> %11, %15
  %19 = fmul <2 x double> %12, %17
  %20 = fadd <2 x double> %5, %18
  %21 = fadd <2 x double> %6, %19
  %22 = fadd <2 x double> %broadcast.splat23, %20
  %23 = fadd <2 x double> %broadcast.splat23, %21
  %24 = bitcast double* %1 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8, !alias.scope !8, !noalias !11
  %25 = bitcast double* %3 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %26 = icmp eq i64 %index.next, 1200
  br i1 %26, label %for.inc53.loopexit27, label %vector.body, !llvm.loop !16

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.cond4.for.end_crit_edge.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.cond4.for.end_crit_edge.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv49, i64 %indvars.iv46
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.body6.us, %for.cond4.preheader.us
  %indvars.iv41 = phi i64 [ 0, %for.cond4.preheader.us ], [ %indvars.iv.next42, %for.body6.us ]
  %temp2.034.us = phi double [ 0.000000e+00, %for.cond4.preheader.us ], [ %add27.us, %for.body6.us ]
  %27 = load double, double* %arrayidx8.us, align 8
  %mul.us = fmul double %27, %alpha
  %arrayidx12.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv41
  %28 = load double, double* %arrayidx12.us, align 8
  %mul13.us = fmul double %mul.us, %28
  %arrayidx17.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv41, i64 %indvars.iv46
  %29 = load double, double* %arrayidx17.us, align 8
  %add.us = fadd double %29, %mul13.us
  store double %add.us, double* %arrayidx17.us, align 8
  %arrayidx21.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv41, i64 %indvars.iv46
  %30 = load double, double* %arrayidx21.us, align 8
  %31 = load double, double* %arrayidx12.us, align 8
  %mul26.us = fmul double %30, %31
  %add27.us = fadd double %temp2.034.us, %mul26.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next42, %indvars.iv49
  br i1 %exitcond45, label %for.cond4.for.end_crit_edge.us, label %for.body6.us

for.cond4.for.end_crit_edge.us:                   ; preds = %for.body6.us
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv49, i64 %indvars.iv46
  %32 = load double, double* %arrayidx31.us, align 8
  %mul32.us = fmul double %32, %beta
  %33 = load double, double* %arrayidx8.us, align 8
  %mul37.us = fmul double %33, %alpha
  %34 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %mul37.us, %34
  %add43.us = fadd double %mul32.us, %mul42.us
  %mul44.us = fmul double %add27.us, %alpha
  %add45.us = fadd double %mul44.us, %add43.us
  store double %add45.us, double* %arrayidx31.us, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next47, 1200
  br i1 %exitcond48, label %for.inc53.loopexit, label %for.cond4.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader, %for.cond4.preheader.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next.1, %for.cond4.preheader ]
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv49, i64 %indvars.iv
  %35 = load double, double* %arrayidx31, align 8
  %mul32 = fmul double %35, %beta
  %arrayidx36 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv49, i64 %indvars.iv
  %36 = load double, double* %arrayidx36, align 8
  %mul37 = fmul double %36, %alpha
  %37 = load double, double* %arrayidx41.us, align 8
  %mul42 = fmul double %mul37, %37
  %add43 = fadd double %mul32, %mul42
  %add45 = fadd double %mul44, %add43
  store double %add45, double* %arrayidx31, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx31.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv49, i64 %indvars.iv.next
  %38 = load double, double* %arrayidx31.1, align 8
  %mul32.1 = fmul double %38, %beta
  %arrayidx36.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv49, i64 %indvars.iv.next
  %39 = load double, double* %arrayidx36.1, align 8
  %mul37.1 = fmul double %39, %alpha
  %40 = load double, double* %arrayidx41.us, align 8
  %mul42.1 = fmul double %mul37.1, %40
  %add43.1 = fadd double %mul32.1, %mul42.1
  %add45.1 = fadd double %mul44, %add43.1
  store double %add45.1, double* %arrayidx31.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %for.inc53.loopexit26, label %for.cond4.preheader, !llvm.loop !17

for.inc53.loopexit:                               ; preds = %for.cond4.for.end_crit_edge.us
  br label %for.inc53

for.inc53.loopexit26:                             ; preds = %for.cond4.preheader
  br label %for.inc53

for.inc53.loopexit27:                             ; preds = %vector.body
  br label %for.inc53

for.inc53:                                        ; preds = %for.inc53.loopexit27, %for.inc53.loopexit26, %for.inc53.loopexit
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next50, 1000
  br i1 %exitcond51, label %for.end55, label %for.cond1.preheader

for.end55:                                        ; preds = %for.inc53
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv10, 1000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond13, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
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
