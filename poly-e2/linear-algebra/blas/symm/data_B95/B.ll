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
  %call = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call2 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
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

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #2 {
for.body.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond1.for.inc16_crit_edge.us
  %indvars.iv25 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next26, %for.cond1.for.inc16_crit_edge.us ]
  %0 = add nsw i64 %indvars.iv25, 1200
  %1 = trunc i64 %indvars.iv25 to i32
  %2 = trunc i64 %0 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body.us
  %indvars.iv16.us = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next17.us, %for.body3.us ]
  %3 = trunc i64 %indvars.iv16.us to i32
  %add.us = add nsw i32 %3, %1
  %rem.us = srem i32 %add.us, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv25, i64 %indvars.iv16.us
  store double %div.us, double* %arrayidx6.us, align 8
  %sub.us = sub i32 %2, %3
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv25, i64 %indvars.iv16.us
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next17.us = add nuw nsw i64 %indvars.iv16.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next17.us, 1200
  br i1 %exitcond, label %for.cond1.for.inc16_crit_edge.us, label %for.body3.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, 1
  %cmp.us = icmp slt i64 %indvars.iv.next26, 1000
  br i1 %cmp.us, label %for.body.us, label %for.body22.preheader

for.body22.preheader:                             ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.body22

for.body22:                                       ; preds = %for.body22.preheader, %for.inc51
  %indvar2 = phi i64 [ 0, %for.body22.preheader ], [ %indvar.next, %for.inc51 ]
  %indvar = phi i32 [ 0, %for.body22.preheader ], [ %4, %for.inc51 ]
  %indvars.iv12 = phi i64 [ 0, %for.body22.preheader ], [ %indvars.iv.next13, %for.inc51 ]
  %4 = add i32 %indvar, 1
  %5 = sext i32 %4 to i64
  %6 = sub nsw i64 999, %5
  %cmp242 = icmp sgt i64 %indvars.iv12, -1
  %7 = trunc i64 %indvars.iv12 to i32
  br i1 %cmp242, label %for.body26.preheader, label %for.end38

for.body26.preheader:                             ; preds = %for.body22
  %8 = and i64 %indvar2, 1
  %lcmp.mod4 = icmp eq i64 %8, 0
  br i1 %lcmp.mod4, label %for.body26.prol, label %for.body26.prol.loopexit

for.body26.prol:                                  ; preds = %for.body26.preheader
  %rem28.prol = srem i32 %7, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv12, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit

for.body26.prol.loopexit:                         ; preds = %for.body26.prol, %for.body26.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body26.prol ], [ 0, %for.body26.preheader ]
  %9 = icmp eq i64 %indvar2, 0
  br i1 %9, label %for.end38, label %for.body26.preheader.new

for.body26.preheader.new:                         ; preds = %for.body26.prol.loopexit
  br label %for.body26

for.body26:                                       ; preds = %for.body26, %for.body26.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body26.preheader.new ], [ %indvars.iv.next.1, %for.body26 ]
  %10 = trunc i64 %indvars.iv to i32
  %add27 = add nsw i32 %10, %7
  %rem28 = srem i32 %add27, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %11 = trunc i64 %indvars.iv.next to i32
  %add27.1 = add nsw i32 %11, %7
  %rem28.1 = srem i32 %add27.1, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, 1.000000e+03
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %cmp24.1 = icmp slt i64 %indvars.iv.next, %indvars.iv12
  br i1 %cmp24.1, label %for.body26, label %for.end38.loopexit

for.end38.loopexit:                               ; preds = %for.body26
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.body26.prol.loopexit, %for.body22
  %add39 = add nsw i32 %7, 1
  %cmp414 = icmp slt i32 %add39, 1000
  br i1 %cmp414, label %for.body43.lr.ph, label %for.inc51

for.body43.lr.ph:                                 ; preds = %for.end38
  %12 = sext i32 %add39 to i64
  %13 = sub nsw i64 0, %5
  %xtraiter = and i64 %13, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body43.prol.loopexit, label %for.body43.prol.preheader

for.body43.prol.preheader:                        ; preds = %for.body43.lr.ph
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol.preheader, %for.body43.prol
  %indvars.iv7.prol = phi i64 [ %indvars.iv.next8.prol, %for.body43.prol ], [ %12, %for.body43.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body43.prol ], [ %xtraiter, %for.body43.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv7.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next8.prol = add nsw i64 %indvars.iv7.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol, !llvm.loop !1

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol.loopexit.loopexit, %for.body43.lr.ph
  %indvars.iv7.unr = phi i64 [ %12, %for.body43.lr.ph ], [ %indvars.iv.next8.prol, %for.body43.prol.loopexit.loopexit ]
  %14 = icmp ult i64 %6, 7
  br i1 %14, label %for.inc51, label %for.body43.preheader

for.body43.preheader:                             ; preds = %for.body43.prol.loopexit
  %15 = sub i64 992, %indvars.iv7.unr
  %16 = lshr i64 %15, 3
  %17 = add nuw nsw i64 %16, 1
  %min.iters.check = icmp ult i64 %17, 2
  br i1 %min.iters.check, label %for.body43.preheader1, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body43.preheader
  %n.mod.vf = and i64 %17, 1
  %n.vec = sub nsw i64 %17, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %18 = add i64 %indvars.iv7.unr, 8
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
  %23 = add i64 %indvars.iv7.unr, %22
  %24 = add nsw i64 %23, 7
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv12, i64 %24
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
  %indvars.iv7.ph = phi i64 [ %indvars.iv7.unr, %min.iters.checked ], [ %indvars.iv7.unr, %for.body43.preheader ], [ %ind.end, %middle.block ]
  br label %for.body43

for.body43:                                       ; preds = %for.body43.preheader1, %for.body43
  %indvars.iv7 = phi i64 [ %indvars.iv.next8.7, %for.body43 ], [ %indvars.iv7.ph, %for.body43.preheader1 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv7
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next8 = add nsw i64 %indvars.iv7, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv.next8
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv7, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv.next8.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next8.2 = add nsw i64 %indvars.iv7, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv.next8.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next8.3 = add nsw i64 %indvars.iv7, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv.next8.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next8.4 = add nsw i64 %indvars.iv7, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv.next8.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next8.5 = add nsw i64 %indvars.iv7, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv.next8.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next8.6 = add nsw i64 %indvars.iv7, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv.next8.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next8.7 = add nsw i64 %indvars.iv7, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next8.7, 1000
  br i1 %exitcond.7, label %for.inc51.loopexit, label %for.body43, !llvm.loop !6

for.inc51.loopexit:                               ; preds = %for.body43
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %middle.block, %for.body43.prol.loopexit, %for.end38
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, 1
  %cmp20 = icmp slt i64 %indvars.iv.next13, 1000
  %indvar.next = add i64 %indvar2, 1
  br i1 %cmp20, label %for.body22, label %for.end53

for.end53:                                        ; preds = %for.inc51
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #2 {
for.body.us.preheader:
  %mul44.us29 = fmul double %alpha, 0.000000e+00
  %broadcast.splatinsert15 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat16 = shufflevector <2 x double> %broadcast.splatinsert15, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert19 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat20 = shufflevector <2 x double> %broadcast.splatinsert19, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert21 = insertelement <2 x double> undef, double %mul44.us29, i32 0
  %broadcast.splat22 = shufflevector <2 x double> %broadcast.splatinsert21, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond1.for.inc53_crit_edge.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.cond1.for.inc53_crit_edge.us ], [ 0, %for.body.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv66, i64 0
  %0 = add i64 %indvars.iv66, 1
  %scevgep3 = getelementptr [1200 x double], [1200 x double]* %C, i64 %0, i64 0
  %arrayidx41.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv66
  %cmp51.us = icmp sgt i64 %indvars.iv66, 0
  br i1 %cmp51.us, label %for.body3.us.us.preheader, label %vector.memcheck

for.body3.us.us.preheader:                        ; preds = %for.body.us
  br label %for.body3.us.us

vector.memcheck:                                  ; preds = %for.body.us
  %scevgep7 = getelementptr [1200 x double], [1200 x double]* %B, i64 %0, i64 0
  %scevgep5 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv66, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep7
  %bound1 = icmp ult double* %scevgep5, %scevgep3
  %found.conflict = and i1 %bound0, %bound1
  %bound010 = icmp ult double* %scevgep, %arrayidx41.us
  %bound111 = icmp ult double* %arrayidx41.us, %scevgep3
  %found.conflict12 = and i1 %bound010, %bound111
  %conflict.rdx = or i1 %found.conflict, %found.conflict12
  br i1 %conflict.rdx, label %for.body3.us20.preheader, label %vector.ph

for.body3.us20.preheader:                         ; preds = %vector.memcheck
  br label %for.body3.us20

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv66, i64 %index
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !8, !noalias !11
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !8, !noalias !11
  %5 = fmul <2 x double> %wide.load, %broadcast.splat16
  %6 = fmul <2 x double> %wide.load14, %broadcast.splat16
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv66, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !14
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !14
  %11 = fmul <2 x double> %wide.load17, %broadcast.splat20
  %12 = fmul <2 x double> %wide.load18, %broadcast.splat20
  %13 = load double, double* %arrayidx41.us, align 8, !alias.scope !15
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %13, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fmul <2 x double> %11, %15
  %19 = fmul <2 x double> %12, %17
  %20 = fadd <2 x double> %5, %18
  %21 = fadd <2 x double> %6, %19
  %22 = fadd <2 x double> %20, %broadcast.splat22
  %23 = fadd <2 x double> %21, %broadcast.splat22
  %24 = bitcast double* %1 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8, !alias.scope !8, !noalias !11
  %25 = bitcast double* %3 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %26 = icmp eq i64 %index.next, 1200
  br i1 %26, label %for.cond1.for.inc53_crit_edge.us.loopexit26, label %vector.body, !llvm.loop !16

for.body3.us20:                                   ; preds = %for.body3.us20, %for.body3.us20.preheader
  %indvars.iv9.us = phi i64 [ 0, %for.body3.us20.preheader ], [ %indvars.iv.next10.us.1, %for.body3.us20 ]
  %arrayidx31.us23 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv66, i64 %indvars.iv9.us
  %27 = load double, double* %arrayidx31.us23, align 8
  %mul32.us24 = fmul double %27, %beta
  %arrayidx36.us25 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv66, i64 %indvars.iv9.us
  %28 = load double, double* %arrayidx36.us25, align 8
  %mul37.us26 = fmul double %28, %alpha
  %29 = load double, double* %arrayidx41.us, align 8
  %mul42.us27 = fmul double %mul37.us26, %29
  %add43.us28 = fadd double %mul32.us24, %mul42.us27
  %add45.us30 = fadd double %add43.us28, %mul44.us29
  store double %add45.us30, double* %arrayidx31.us23, align 8
  %indvars.iv.next10.us = or i64 %indvars.iv9.us, 1
  %arrayidx31.us23.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv66, i64 %indvars.iv.next10.us
  %30 = load double, double* %arrayidx31.us23.1, align 8
  %mul32.us24.1 = fmul double %30, %beta
  %arrayidx36.us25.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv66, i64 %indvars.iv.next10.us
  %31 = load double, double* %arrayidx36.us25.1, align 8
  %mul37.us26.1 = fmul double %31, %alpha
  %32 = load double, double* %arrayidx41.us, align 8
  %mul42.us27.1 = fmul double %mul37.us26.1, %32
  %add43.us28.1 = fadd double %mul32.us24.1, %mul42.us27.1
  %add45.us30.1 = fadd double %add43.us28.1, %mul44.us29
  store double %add45.us30.1, double* %arrayidx31.us23.1, align 8
  %indvars.iv.next10.us.1 = add nsw i64 %indvars.iv9.us, 2
  %exitcond70.1 = icmp eq i64 %indvars.iv.next10.us.1, 1200
  br i1 %exitcond70.1, label %for.cond1.for.inc53_crit_edge.us.loopexit25, label %for.body3.us20, !llvm.loop !17

for.cond1.for.inc53_crit_edge.us.loopexit:        ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit25:      ; preds = %for.body3.us20
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit26:      ; preds = %vector.body
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us:                 ; preds = %for.cond1.for.inc53_crit_edge.us.loopexit26, %for.cond1.for.inc53_crit_edge.us.loopexit25, %for.cond1.for.inc53_crit_edge.us.loopexit
  %indvars.iv.next67 = add nsw i64 %indvars.iv66, 1
  %cmp.us = icmp slt i64 %indvars.iv.next67, 1000
  br i1 %cmp.us, label %for.body.us, label %for.end55

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.cond4.for.end_crit_edge.us.us
  %indvars.iv11.us = phi i64 [ %indvars.iv.next12.us, %for.cond4.for.end_crit_edge.us.us ], [ 0, %for.body3.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv66, i64 %indvars.iv11.us
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.body6.us.us
  %arrayidx31.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv66, i64 %indvars.iv11.us
  %33 = load double, double* %arrayidx31.us.us, align 8
  %mul32.us.us = fmul double %33, %beta
  %34 = load double, double* %arrayidx8.us.us, align 8
  %mul37.us.us = fmul double %34, %alpha
  %35 = load double, double* %arrayidx41.us, align 8
  %mul42.us.us = fmul double %mul37.us.us, %35
  %add43.us.us = fadd double %mul32.us.us, %mul42.us.us
  %mul44.us.us = fmul double %add27.us.us, %alpha
  %add45.us.us = fadd double %add43.us.us, %mul44.us.us
  store double %add45.us.us, double* %arrayidx31.us.us, align 8
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv11.us, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next12.us, 1200
  br i1 %exitcond71, label %for.cond1.for.inc53_crit_edge.us.loopexit, label %for.body3.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.body3.us.us
  %indvars.iv.us.us = phi i64 [ 0, %for.body3.us.us ], [ %indvars.iv.next.us.us, %for.body6.us.us ]
  %add273.us.us = phi double [ 0.000000e+00, %for.body3.us.us ], [ %add27.us.us, %for.body6.us.us ]
  %36 = load double, double* %arrayidx8.us.us, align 8
  %mul.us.us = fmul double %36, %alpha
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv.us.us
  %37 = load double, double* %arrayidx12.us.us, align 8
  %mul13.us.us = fmul double %mul.us.us, %37
  %arrayidx17.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv.us.us, i64 %indvars.iv11.us
  %38 = load double, double* %arrayidx17.us.us, align 8
  %add.us.us = fadd double %mul13.us.us, %38
  store double %add.us.us, double* %arrayidx17.us.us, align 8
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.us.us, i64 %indvars.iv11.us
  %39 = load double, double* %arrayidx21.us.us, align 8
  %40 = load double, double* %arrayidx12.us.us, align 8
  %mul26.us.us = fmul double %39, %40
  %add27.us.us = fadd double %add273.us.us, %mul26.us.us
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us.us, %indvars.iv66
  br i1 %exitcond, label %for.cond4.for.end_crit_edge.us.us, label %for.body6.us.us

for.end55:                                        ; preds = %for.cond1.for.inc53_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* %C) unnamed_addr #0 {
for.body.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond2.for.inc10_crit_edge.us
  %indvars.iv = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv, 1000
  %4 = trunc i64 %3 to i32
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body.us
  %indvars.iv.us = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next.us, %if.end.us ]
  %5 = trunc i64 %indvars.iv.us to i32
  %add.us = add nsw i32 %4, %5
  %rem.us = srem i32 %add.us, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv, i64 %indvars.iv.us
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp.us = icmp slt i64 %indvars.iv.next, 1000
  br i1 %cmp.us, label %for.body.us, label %for.end12

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
