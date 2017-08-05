; ModuleID = 'B.ll'
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
  call fastcc void @print_array([1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
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
  %indvars.iv53 = phi i64 [ 0, %entry ], [ %indvars.iv.next54, %for.inc16 ]
  %0 = add nuw nsw i64 %indvars.iv53, 1200
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.body3 ], [ 0, %for.cond1.preheader ]
  %1 = add nuw nsw i64 %indvars.iv48, %indvars.iv53
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 100
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.000000e+03
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv53, i64 %indvars.iv48
  store double %div, double* %arrayidx6, align 8
  %3 = sub nuw nsw i64 %0, %indvars.iv48
  %4 = trunc i64 %3 to i32
  %rem8 = srem i32 %4, 100
  %conv9 = sitofp i32 %rem8 to double
  %div11 = fdiv double %conv9, 1.000000e+03
  %arrayidx15 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv53, i64 %indvars.iv48
  store double %div11, double* %arrayidx15, align 8
  %exitcond52 = icmp eq i64 %indvars.iv48, 1199
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  br i1 %exitcond52, label %for.inc16, label %for.body3

for.inc16:                                        ; preds = %for.body3
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next54, 1000
  br i1 %exitcond2, label %for.body26.lr.ph.preheader, label %for.cond1.preheader

for.body26.lr.ph.preheader:                       ; preds = %for.inc16
  br label %for.body26.lr.ph

for.cond19.loopexit.loopexit:                     ; preds = %for.body43
  br label %for.cond19.loopexit

for.cond19.loopexit:                              ; preds = %middle.block, %for.cond19.loopexit.loopexit
  %indvars.iv.next42 = add nuw i32 %indvars.iv41, 1
  br label %for.body26.lr.ph

for.body26.lr.ph:                                 ; preds = %for.cond19.loopexit, %for.body26.lr.ph.preheader
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.cond19.loopexit ], [ 0, %for.body26.lr.ph.preheader ]
  %indvars.iv41 = phi i32 [ %indvars.iv.next42, %for.cond19.loopexit ], [ 1, %for.body26.lr.ph.preheader ]
  %5 = shl i64 %indvars.iv46, 32
  %sext = add i64 %5, 4294967296
  %6 = ashr exact i64 %sext, 32
  %7 = and i64 %indvars.iv46, 1
  %lcmp.mod = icmp eq i64 %7, 0
  br i1 %lcmp.mod, label %for.body26.prol.preheader, label %for.body26.prol.loopexit.unr-lcssa

for.body26.prol.preheader:                        ; preds = %for.body26.lr.ph
  br label %for.body26.prol

for.body26.prol:                                  ; preds = %for.body26.prol.preheader
  %8 = trunc i64 %indvars.iv46 to i32
  %rem28.prol = srem i32 %8, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit.unr-lcssa

for.body26.prol.loopexit.unr-lcssa:               ; preds = %for.body26.prol, %for.body26.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body26.prol ], [ 0, %for.body26.lr.ph ]
  br label %for.body26.prol.loopexit

for.body26.prol.loopexit:                         ; preds = %for.body26.prol.loopexit.unr-lcssa
  %9 = icmp eq i64 %indvars.iv46, 0
  br i1 %9, label %for.end38, label %for.body26.lr.ph.new

for.body26.lr.ph.new:                             ; preds = %for.body26.prol.loopexit
  br label %for.body26

for.body26:                                       ; preds = %for.body26, %for.body26.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body26.lr.ph.new ], [ %indvars.iv.next.1, %for.body26 ]
  %10 = add nuw nsw i64 %indvars.iv, %indvars.iv46
  %11 = trunc i64 %10 to i32
  %rem28 = srem i32 %11, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = add nuw nsw i64 %indvars.iv.next, %indvars.iv46
  %13 = trunc i64 %12 to i32
  %rem28.1 = srem i32 %13, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, 1.000000e+03
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %indvars.iv46
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.end38.unr-lcssa, label %for.body26

for.end38.unr-lcssa:                              ; preds = %for.body26
  br label %for.end38

for.end38:                                        ; preds = %for.end38.unr-lcssa, %for.body26.prol.loopexit
  %14 = sub nsw i64 1000, %6
  %15 = sext i32 %indvars.iv41 to i64
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %cmp4132 = icmp slt i64 %indvars.iv.next47, 1000
  br i1 %cmp4132, label %for.body43.preheader, label %for.end53

for.body43.preheader:                             ; preds = %for.end38
  %min.iters.check = icmp ult i64 %14, 4
  br i1 %min.iters.check, label %for.body43.preheader3, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body43.preheader
  %n.vec = and i64 %14, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %15, %n.vec
  br i1 %cmp.zero, label %for.body43.preheader3, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %16 = add nsw i64 %n.vec, -4
  %17 = lshr exact i64 %16, 2
  %18 = add nuw nsw i64 %17, 1
  %xtraiter4 = and i64 %18, 3
  %lcmp.mod5 = icmp eq i64 %xtraiter4, 0
  br i1 %lcmp.mod5, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter4, %vector.body.prol.preheader ]
  %offset.idx.prol = add nsw i64 %15, %index.prol
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %offset.idx.prol
  %20 = bitcast double* %19 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %20, align 8
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %22, align 8
  %index.next.prol = add nuw nsw i64 %index.prol, 4
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  %23 = shl i64 %xtraiter4, 2
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %23, %vector.body.prol.loopexit.unr-lcssa ]
  %24 = icmp ult i64 %16, 12
  br i1 %24, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %offset.idx = add i64 %15, %index
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %offset.idx
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %26, align 8
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %28, align 8
  %index.next = add i64 %index, 4
  %offset.idx.1 = add i64 %15, %index.next
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %offset.idx.1
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %30, align 8
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %32, align 8
  %index.next.1 = add i64 %index, 8
  %offset.idx.2 = add i64 %15, %index.next.1
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %offset.idx.2
  %34 = bitcast double* %33 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %34, align 8
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %36, align 8
  %index.next.2 = add i64 %index, 12
  %offset.idx.3 = add i64 %15, %index.next.2
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %offset.idx.3
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %38, align 8
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %40, align 8
  %index.next.3 = add i64 %index, 16
  %41 = icmp eq i64 %index.next.3, %n.vec
  br i1 %41, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.unr-lcssa, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %14, %n.vec
  br i1 %cmp.n, label %for.cond19.loopexit, label %for.body43.preheader3

for.body43.preheader3:                            ; preds = %middle.block, %min.iters.checked, %for.body43.preheader
  %indvars.iv43.ph = phi i64 [ %15, %min.iters.checked ], [ %15, %for.body43.preheader ], [ %ind.end, %middle.block ]
  br label %for.body43

for.body43:                                       ; preds = %for.body43, %for.body43.preheader3
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %for.body43 ], [ %indvars.iv43.ph, %for.body43.preheader3 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv43
  store double -9.990000e+02, double* %arrayidx47, align 8
  %exitcond45 = icmp eq i64 %indvars.iv43, 999
  %indvars.iv.next44 = add nsw i64 %indvars.iv43, 1
  br i1 %exitcond45, label %for.cond19.loopexit.loopexit, label %for.body43, !llvm.loop !6

for.end53:                                        ; preds = %for.end38
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %mul44 = fmul double %alpha, 0.000000e+00
  %broadcast.splatinsert15 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat16 = shufflevector <2 x double> %broadcast.splatinsert15, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert19 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat20 = shufflevector <2 x double> %broadcast.splatinsert19, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert21 = insertelement <2 x double> undef, double %mul44, i32 0
  %broadcast.splat22 = shufflevector <2 x double> %broadcast.splatinsert21, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc53, %entry
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.inc53 ], [ 0, %entry ]
  %indvars.iv41 = phi i32 [ %indvars.iv.next42, %for.inc53 ], [ -1, %entry ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv46, i64 0
  %0 = add nuw nsw i64 %indvars.iv46, 1
  %scevgep3 = getelementptr [1200 x double], [1200 x double]* %C, i64 %0, i64 0
  %cmp532 = icmp sgt i64 %indvars.iv46, 0
  br i1 %cmp532, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %scevgep7 = getelementptr [1200 x double], [1200 x double]* %B, i64 %0, i64 0
  %scevgep5 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv46, i64 0
  %arrayidx41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv46
  %bound0 = icmp ult double* %scevgep, %scevgep7
  %bound1 = icmp ult double* %scevgep5, %scevgep3
  %found.conflict = and i1 %bound0, %bound1
  %bound010 = icmp ult double* %scevgep, %arrayidx41
  %bound111 = icmp ult double* %arrayidx41, %scevgep3
  %found.conflict12 = and i1 %bound010, %bound111
  %conflict.rdx = or i1 %found.conflict, %found.conflict12
  br i1 %conflict.rdx, label %for.cond4.preheader.preheader25, label %vector.ph

for.cond4.preheader.preheader25:                  ; preds = %for.cond4.preheader.preheader
  br label %for.cond4.preheader

vector.ph:                                        ; preds = %for.cond4.preheader.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv46, i64 %index
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !8, !noalias !11
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !8, !noalias !11
  %5 = fmul <2 x double> %wide.load, %broadcast.splat16
  %6 = fmul <2 x double> %wide.load14, %broadcast.splat16
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv46, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !14
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !14
  %11 = fmul <2 x double> %wide.load17, %broadcast.splat20
  %12 = fmul <2 x double> %wide.load18, %broadcast.splat20
  %13 = load double, double* %arrayidx41, align 8, !alias.scope !15
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %13, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fmul <2 x double> %11, %15
  %19 = fmul <2 x double> %12, %17
  %20 = fadd <2 x double> %5, %18
  %21 = fadd <2 x double> %6, %19
  %22 = fadd <2 x double> %broadcast.splat22, %20
  %23 = fadd <2 x double> %broadcast.splat22, %21
  %24 = bitcast double* %1 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8, !alias.scope !8, !noalias !11
  %25 = bitcast double* %3 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !8, !noalias !11
  %index.next = add nuw nsw i64 %index, 4
  %26 = icmp eq i64 %index.next, 1200
  br i1 %26, label %for.inc53.loopexit27, label %vector.body, !llvm.loop !16

for.cond4.preheader.us.preheader:                 ; preds = %for.cond1.preheader
  %wide.trip.count = zext i32 %indvars.iv41 to i64
  %arrayidx41.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv46
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.end.us, %for.cond4.preheader.us.preheader
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %for.end.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv46, i64 %indvars.iv44
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.body6.us, %for.cond4.preheader.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %for.body6.us ], [ 0, %for.cond4.preheader.us ]
  %temp2.034.us = phi double [ %add27.us, %for.body6.us ], [ 0.000000e+00, %for.cond4.preheader.us ]
  %27 = load double, double* %arrayidx8.us, align 8
  %mul.us = fmul double %27, %alpha
  %arrayidx12.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv39
  %28 = load double, double* %arrayidx12.us, align 8
  %mul13.us = fmul double %mul.us, %28
  %arrayidx17.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv39, i64 %indvars.iv44
  %29 = load double, double* %arrayidx17.us, align 8
  %add.us = fadd double %29, %mul13.us
  store double %add.us, double* %arrayidx17.us, align 8
  %arrayidx21.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv39, i64 %indvars.iv44
  %30 = load double, double* %arrayidx21.us, align 8
  %31 = load double, double* %arrayidx12.us, align 8
  %mul26.us = fmul double %30, %31
  %add27.us = fadd double %temp2.034.us, %mul26.us
  %exitcond43 = icmp eq i64 %indvars.iv39, %wide.trip.count
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  br i1 %exitcond43, label %for.end.us, label %for.body6.us

for.end.us:                                       ; preds = %for.body6.us
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv46, i64 %indvars.iv44
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
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next45, 1200
  br i1 %exitcond23, label %for.inc53.loopexit, label %for.cond4.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader, %for.cond4.preheader.preheader25
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader.preheader25 ], [ %indvars.iv.next.1, %for.cond4.preheader ]
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv46, i64 %indvars.iv
  %35 = load double, double* %arrayidx31, align 8
  %mul32 = fmul double %35, %beta
  %arrayidx36 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv46, i64 %indvars.iv
  %36 = load double, double* %arrayidx36, align 8
  %mul37 = fmul double %36, %alpha
  %37 = load double, double* %arrayidx41, align 8
  %mul42 = fmul double %mul37, %37
  %add43 = fadd double %mul32, %mul42
  %add45 = fadd double %mul44, %add43
  store double %add45, double* %arrayidx31, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx31.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv46, i64 %indvars.iv.next
  %38 = load double, double* %arrayidx31.1, align 8
  %mul32.1 = fmul double %38, %beta
  %arrayidx36.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv46, i64 %indvars.iv.next
  %39 = load double, double* %arrayidx36.1, align 8
  %mul37.1 = fmul double %39, %alpha
  %40 = load double, double* %arrayidx41, align 8
  %mul42.1 = fmul double %mul37.1, %40
  %add43.1 = fadd double %mul32.1, %mul42.1
  %add45.1 = fadd double %mul44, %add43.1
  store double %add45.1, double* %arrayidx31.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1199
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc53.loopexit26, label %for.cond4.preheader, !llvm.loop !17

for.inc53.loopexit:                               ; preds = %for.end.us
  br label %for.inc53

for.inc53.loopexit26:                             ; preds = %for.cond4.preheader
  br label %for.inc53

for.inc53.loopexit27:                             ; preds = %vector.body
  br label %for.inc53

for.inc53:                                        ; preds = %for.inc53.loopexit27, %for.inc53.loopexit26, %for.inc53.loopexit
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %indvars.iv.next42 = add nsw i32 %indvars.iv41, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next47, 1000
  br i1 %exitcond24, label %for.end55, label %for.cond1.preheader

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
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
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond1, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

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
