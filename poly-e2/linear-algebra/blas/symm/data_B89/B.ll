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
  call void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call void @kernel_symm(double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  call void @print_array([1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc16, %entry
  %indvars.iv57 = phi i64 [ 0, %entry ], [ %indvars.iv.next58, %for.inc16 ]
  %0 = add nuw nsw i64 %indvars.iv57, 1200
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv50 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next51, %for.body3 ]
  %1 = add nuw nsw i64 %indvars.iv50, %indvars.iv57
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 100
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.000000e+03
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv50
  store double %div, double* %arrayidx6, align 8
  %3 = sub nuw nsw i64 %0, %indvars.iv50
  %4 = trunc i64 %3 to i32
  %rem8 = srem i32 %4, 100
  %conv9 = sitofp i32 %rem8 to double
  %div11 = fdiv double %conv9, 1.000000e+03
  %arrayidx15 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv57, i64 %indvars.iv50
  store double %div11, double* %arrayidx15, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next51, 1200
  br i1 %exitcond55, label %for.inc16, label %for.body3

for.inc16:                                        ; preds = %for.body3
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 1000
  br i1 %exitcond60, label %for.cond23.preheader.preheader, label %for.cond1.preheader

for.cond23.preheader.preheader:                   ; preds = %for.inc16
  br label %for.cond23.preheader

for.cond23.preheader:                             ; preds = %for.cond23.preheader.preheader, %for.inc51
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %for.inc51 ], [ 1, %for.cond23.preheader.preheader ]
  %indvars.iv46 = phi i64 [ %7, %for.inc51 ], [ 0, %for.cond23.preheader.preheader ]
  %5 = sub i64 999, %indvars.iv46
  %6 = sub i64 998, %indvars.iv46
  %7 = add nuw nsw i64 %indvars.iv46, 1
  %xtraiter = and i64 %7, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body26.prol.loopexit.unr-lcssa, label %for.body26.prol.preheader

for.body26.prol.preheader:                        ; preds = %for.cond23.preheader
  %8 = trunc i64 %indvars.iv46 to i32
  %rem28.prol = srem i32 %8, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit.unr-lcssa

for.body26.prol.loopexit.unr-lcssa:               ; preds = %for.cond23.preheader, %for.body26.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body26.prol.preheader ], [ 0, %for.cond23.preheader ]
  %9 = icmp eq i64 %indvars.iv46, 0
  br i1 %9, label %for.end38, label %for.body26.preheader

for.body26.preheader:                             ; preds = %for.body26.prol.loopexit.unr-lcssa
  br label %for.body26

for.body26:                                       ; preds = %for.body26.preheader, %for.body26
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body26 ], [ %indvars.iv.unr.ph, %for.body26.preheader ]
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
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond63.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv61
  br i1 %exitcond63.1, label %for.end38.loopexit, label %for.body26

for.end38.loopexit:                               ; preds = %for.body26
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.body26.prol.loopexit.unr-lcssa
  %cmp4135 = icmp slt i64 %7, 1000
  br i1 %cmp4135, label %for.body43.lr.ph, label %for.inc51

for.body43.lr.ph:                                 ; preds = %for.end38
  %xtraiter64 = and i64 %5, 7
  %lcmp.mod65 = icmp eq i64 %xtraiter64, 0
  br i1 %lcmp.mod65, label %for.body43.prol.loopexit, label %for.body43.prol.preheader

for.body43.prol.preheader:                        ; preds = %for.body43.lr.ph
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol.preheader, %for.body43.prol
  %indvars.iv39.prol = phi i64 [ %indvars.iv.next40.prol, %for.body43.prol ], [ %indvars.iv61, %for.body43.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body43.prol ], [ %xtraiter64, %for.body43.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv39.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next40.prol = add nuw nsw i64 %indvars.iv39.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol, !llvm.loop !1

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol.loopexit.loopexit, %for.body43.lr.ph
  %indvars.iv39.unr = phi i64 [ %indvars.iv61, %for.body43.lr.ph ], [ %indvars.iv.next40.prol, %for.body43.prol.loopexit.loopexit ]
  %14 = icmp ult i64 %6, 7
  br i1 %14, label %for.inc51, label %for.body43.preheader

for.body43.preheader:                             ; preds = %for.body43.prol.loopexit
  %15 = sub i64 992, %indvars.iv39.unr
  %16 = lshr i64 %15, 3
  %17 = add nuw nsw i64 %16, 1
  %min.iters.check = icmp ult i64 %17, 2
  br i1 %min.iters.check, label %for.body43.preheader1, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body43.preheader
  %n.mod.vf = and i64 %17, 1
  %n.vec = sub nsw i64 %17, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %18 = add i64 %indvars.iv39.unr, 8
  %19 = shl nuw i64 %16, 3
  %20 = add i64 %18, %19
  %21 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %20, %21
  br i1 %cmp.zero, label %for.body43.preheader1, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %22 = shl i64 %index, 3
  %23 = add i64 %indvars.iv39.unr, %22
  %24 = add nsw i64 %23, 7
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %24
  %26 = getelementptr double, double* %25, i64 -7
  %27 = bitcast double* %26 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %27, align 8
  %index.next = add i64 %index, 2
  %28 = icmp eq i64 %index.next, %n.vec
  br i1 %28, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc51, label %for.body43.preheader1

for.body43.preheader1:                            ; preds = %middle.block, %min.iters.checked, %for.body43.preheader
  %indvars.iv39.ph = phi i64 [ %indvars.iv39.unr, %min.iters.checked ], [ %indvars.iv39.unr, %for.body43.preheader ], [ %ind.end, %middle.block ]
  br label %for.body43

for.body43:                                       ; preds = %for.body43.preheader1, %for.body43
  %indvars.iv39 = phi i64 [ %indvars.iv.next40.7, %for.body43 ], [ %indvars.iv39.ph, %for.body43.preheader1 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv39
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next40
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv39, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next40.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next40.2 = add nsw i64 %indvars.iv39, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next40.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next40.3 = add nsw i64 %indvars.iv39, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next40.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next40.4 = add nsw i64 %indvars.iv39, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next40.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next40.5 = add nsw i64 %indvars.iv39, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next40.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next40.6 = add nsw i64 %indvars.iv39, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next40.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next40.7 = add nsw i64 %indvars.iv39, 8
  %exitcond41.7 = icmp eq i64 %indvars.iv.next40.7, 1000
  br i1 %exitcond41.7, label %for.inc51.loopexit, label %for.body43, !llvm.loop !6

for.inc51.loopexit:                               ; preds = %for.body43
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %middle.block, %for.body43.prol.loopexit, %for.end38
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond48 = icmp eq i64 %7, 1000
  br i1 %exitcond48, label %for.end53, label %for.cond23.preheader

for.end53:                                        ; preds = %for.inc51
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_symm(double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #0 {
entry:
  %mul44 = fmul double %alpha, 0.000000e+00
  %broadcast.splatinsert17 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat18 = shufflevector <2 x double> %broadcast.splatinsert17, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert21 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat22 = shufflevector <2 x double> %broadcast.splatinsert21, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert23 = insertelement <2 x double> undef, double %mul44, i32 0
  %broadcast.splat24 = shufflevector <2 x double> %broadcast.splatinsert23, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc53, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc53 ], [ 0, %entry ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv, i64 0
  %0 = add i64 %indvars.iv, 1
  %scevgep5 = getelementptr [1200 x double], [1200 x double]* %C, i64 %0, i64 0
  %cmp532 = icmp sgt i64 %indvars.iv, 0
  %arrayidx41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv
  br i1 %cmp532, label %for.cond4.preheader.us.preheader, label %vector.memcheck

for.cond4.preheader.us.preheader:                 ; preds = %for.cond1.preheader
  br label %for.cond4.preheader.us

vector.memcheck:                                  ; preds = %for.cond1.preheader
  %scevgep9 = getelementptr [1200 x double], [1200 x double]* %B, i64 %0, i64 0
  %scevgep7 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep9
  %bound1 = icmp ult double* %scevgep7, %scevgep5
  %found.conflict = and i1 %bound0, %bound1
  %bound012 = icmp ult double* %scevgep, %arrayidx41
  %bound113 = icmp ult double* %arrayidx41, %scevgep5
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
  br i1 %conflict.rdx, label %for.cond4.preheader.preheader, label %vector.ph

for.cond4.preheader.preheader:                    ; preds = %vector.memcheck
  br label %for.cond4.preheader

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv, i64 %index
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !8, !noalias !11
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !8, !noalias !11
  %5 = fmul <2 x double> %wide.load, %broadcast.splat18
  %6 = fmul <2 x double> %wide.load16, %broadcast.splat18
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !14
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load20 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !14
  %11 = fmul <2 x double> %wide.load19, %broadcast.splat22
  %12 = fmul <2 x double> %wide.load20, %broadcast.splat22
  %13 = load double, double* %arrayidx41, align 8, !alias.scope !15
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %13, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fmul <2 x double> %11, %15
  %19 = fmul <2 x double> %12, %17
  %20 = fadd <2 x double> %5, %18
  %21 = fadd <2 x double> %6, %19
  %22 = fadd <2 x double> %broadcast.splat24, %20
  %23 = fadd <2 x double> %broadcast.splat24, %21
  %24 = bitcast double* %1 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8, !alias.scope !8, !noalias !11
  %25 = bitcast double* %3 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %26 = icmp eq i64 %index.next, 1200
  br i1 %26, label %for.inc53.loopexit28, label %vector.body, !llvm.loop !16

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.cond4.for.end_crit_edge.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %for.cond4.for.end_crit_edge.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv, i64 %indvars.iv41
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.body6.us, %for.cond4.preheader.us
  %indvars.iv.us = phi i64 [ 0, %for.cond4.preheader.us ], [ %indvars.iv.next.us, %for.body6.us ]
  %temp2.034.us = phi double [ 0.000000e+00, %for.cond4.preheader.us ], [ %add27.us, %for.body6.us ]
  %27 = load double, double* %arrayidx8.us, align 8
  %mul.us = fmul double %27, %alpha
  %arrayidx12.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv.us
  %28 = load double, double* %arrayidx12.us, align 8
  %mul13.us = fmul double %mul.us, %28
  %arrayidx17.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv.us, i64 %indvars.iv41
  %29 = load double, double* %arrayidx17.us, align 8
  %add.us = fadd double %29, %mul13.us
  store double %add.us, double* %arrayidx17.us, align 8
  %arrayidx21.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.us, i64 %indvars.iv41
  %30 = load double, double* %arrayidx21.us, align 8
  %31 = load double, double* %arrayidx12.us, align 8
  %mul26.us = fmul double %30, %31
  %add27.us = fadd double %temp2.034.us, %mul26.us
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %indvars.iv
  br i1 %exitcond.us, label %for.cond4.for.end_crit_edge.us, label %for.body6.us

for.cond4.for.end_crit_edge.us:                   ; preds = %for.body6.us
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv, i64 %indvars.iv41
  %32 = load double, double* %arrayidx31.us, align 8
  %mul32.us = fmul double %32, %beta
  %33 = load double, double* %arrayidx8.us, align 8
  %mul37.us = fmul double %33, %alpha
  %34 = load double, double* %arrayidx41, align 8
  %mul42.us = fmul double %mul37.us, %34
  %add43.us = fadd double %mul32.us, %mul42.us
  %mul44.us = fmul double %add27.us, %alpha
  %add45.us = fadd double %mul44.us, %add43.us
  store double %add45.us, double* %arrayidx31.us, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond43, label %for.inc53.loopexit, label %for.cond4.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader, %for.cond4.preheader.preheader
  %indvars.iv38 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next39.1, %for.cond4.preheader ]
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv, i64 %indvars.iv38
  %35 = load double, double* %arrayidx31, align 8
  %mul32 = fmul double %35, %beta
  %arrayidx36 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv, i64 %indvars.iv38
  %36 = load double, double* %arrayidx36, align 8
  %mul37 = fmul double %36, %alpha
  %37 = load double, double* %arrayidx41, align 8
  %mul42 = fmul double %mul37, %37
  %add43 = fadd double %mul32, %mul42
  %add45 = fadd double %mul44, %add43
  store double %add45, double* %arrayidx31, align 8
  %indvars.iv.next39 = or i64 %indvars.iv38, 1
  %arrayidx31.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv, i64 %indvars.iv.next39
  %38 = load double, double* %arrayidx31.1, align 8
  %mul32.1 = fmul double %38, %beta
  %arrayidx36.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv, i64 %indvars.iv.next39
  %39 = load double, double* %arrayidx36.1, align 8
  %mul37.1 = fmul double %39, %alpha
  %40 = load double, double* %arrayidx41, align 8
  %mul42.1 = fmul double %mul37.1, %40
  %add43.1 = fadd double %mul32.1, %mul42.1
  %add45.1 = fadd double %mul44, %add43.1
  store double %add45.1, double* %arrayidx31.1, align 8
  %indvars.iv.next39.1 = add nsw i64 %indvars.iv38, 2
  %exitcond40.1 = icmp eq i64 %indvars.iv.next39.1, 1200
  br i1 %exitcond40.1, label %for.inc53.loopexit27, label %for.cond4.preheader, !llvm.loop !17

for.inc53.loopexit:                               ; preds = %for.cond4.for.end_crit_edge.us
  br label %for.inc53

for.inc53.loopexit27:                             ; preds = %for.cond4.preheader
  br label %for.inc53

for.inc53.loopexit28:                             ; preds = %vector.body
  br label %for.inc53

for.inc53:                                        ; preds = %for.inc53.loopexit28, %for.inc53.loopexit27, %for.inc53.loopexit
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond49, label %for.end55, label %for.cond1.preheader

for.end55:                                        ; preds = %for.inc53
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* %C) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
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
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond13, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
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
