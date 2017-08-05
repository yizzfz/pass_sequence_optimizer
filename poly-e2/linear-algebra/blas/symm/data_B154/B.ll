; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  %3 = bitcast i8* %call to [1200 x double]*
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %3)
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
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc16_crit_edge.us, %entry
  %indvars.iv66 = phi i64 [ 0, %entry ], [ %indvars.iv.next67, %for.cond1.for.inc16_crit_edge.us ]
  %0 = add nuw nsw i64 %indvars.iv66, 1200
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv61 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next62, %for.inc.us ]
  %1 = add nuw nsw i64 %indvars.iv66, %indvars.iv61
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv66, i64 %indvars.iv61
  store double %div.us, double* %arrayidx6.us, align 8
  %3 = sub nuw nsw i64 %0, %indvars.iv61
  %4 = trunc i64 %3 to i32
  %rem8.us = srem i32 %4, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv66, i64 %indvars.iv61
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next62, 1200
  br i1 %exitcond65, label %for.cond1.for.inc16_crit_edge.us, label %for.inc.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next67, 1000
  br i1 %exitcond70, label %for.inc36.lr.ph.preheader, label %for.cond1.preheader.us

for.inc36.lr.ph.preheader:                        ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.inc36.lr.ph

for.inc36.lr.ph:                                  ; preds = %for.inc36.lr.ph.preheader, %for.inc51
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %for.inc51 ], [ 0, %for.inc36.lr.ph.preheader ]
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.inc51 ], [ 1, %for.inc36.lr.ph.preheader ]
  %5 = sub i64 999, %indvars.iv57
  %6 = add i64 %5, -4
  %7 = lshr i64 %6, 2
  %8 = add nuw nsw i64 %7, 1
  %9 = and i64 %indvars.iv57, 1
  %lcmp.mod = icmp eq i64 %9, 0
  br i1 %lcmp.mod, label %for.inc36.prol, label %for.inc36.prol.loopexit

for.inc36.prol:                                   ; preds = %for.inc36.lr.ph
  %10 = trunc i64 %indvars.iv57 to i32
  %rem28.prol = srem i32 %10, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.inc36.prol.loopexit

for.inc36.prol.loopexit:                          ; preds = %for.inc36.prol, %for.inc36.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc36.prol ], [ 0, %for.inc36.lr.ph ]
  %11 = icmp eq i64 %indvars.iv57, 0
  br i1 %11, label %for.cond40.preheader, label %for.inc36.lr.ph.new

for.inc36.lr.ph.new:                              ; preds = %for.inc36.prol.loopexit
  br label %for.inc36

for.cond40.preheader.loopexit:                    ; preds = %for.inc36
  br label %for.cond40.preheader

for.cond40.preheader:                             ; preds = %for.cond40.preheader.loopexit, %for.inc36.prol.loopexit
  %12 = sub nuw nsw i64 999, %indvars.iv57
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %cmp4135 = icmp slt i64 %indvars.iv.next58, 1000
  br i1 %cmp4135, label %for.inc48.preheader, label %for.inc51

for.inc48.preheader:                              ; preds = %for.cond40.preheader
  %min.iters.check = icmp ult i64 %12, 4
  br i1 %min.iters.check, label %for.inc48.preheader74, label %min.iters.checked

for.inc48.preheader74:                            ; preds = %middle.block, %min.iters.checked, %for.inc48.preheader
  %indvars.iv51.ph = phi i64 [ %indvars.iv55, %min.iters.checked ], [ %indvars.iv55, %for.inc48.preheader ], [ %ind.end, %middle.block ]
  br label %for.inc48

min.iters.checked:                                ; preds = %for.inc48.preheader
  %n.vec = and i64 %12, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv55, %n.vec
  br i1 %cmp.zero, label %for.inc48.preheader74, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter75 = and i64 %8, 3
  %lcmp.mod76 = icmp eq i64 %xtraiter75, 0
  br i1 %lcmp.mod76, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter75, %vector.body.prol.preheader ]
  %13 = add i64 %indvars.iv55, %index.prol
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %13
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %15, align 8
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %17, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.loopexit, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.loopexit:               ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.loopexit ]
  %18 = icmp ult i64 %6, 12
  br i1 %18, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %19 = add i64 %indvars.iv55, %index
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %19
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %21, align 8
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %23, align 8
  %index.next = add i64 %index, 4
  %24 = add i64 %indvars.iv55, %index.next
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %24
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %26, align 8
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %28, align 8
  %index.next.1 = add i64 %index, 8
  %29 = add i64 %indvars.iv55, %index.next.1
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %29
  %31 = bitcast double* %30 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %31, align 8
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %33, align 8
  %index.next.2 = add i64 %index, 12
  %34 = add i64 %indvars.iv55, %index.next.2
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %34
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %36, align 8
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %38, align 8
  %index.next.3 = add i64 %index, 16
  %39 = icmp eq i64 %index.next.3, %n.vec
  br i1 %39, label %middle.block.loopexit, label %vector.body, !llvm.loop !3

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %12, %n.vec
  br i1 %cmp.n, label %for.inc51, label %for.inc48.preheader74

for.inc36:                                        ; preds = %for.inc36, %for.inc36.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc36.lr.ph.new ], [ %indvars.iv.next.1, %for.inc36 ]
  %40 = add nuw nsw i64 %indvars.iv57, %indvars.iv
  %41 = trunc i64 %40 to i32
  %rem28 = srem i32 %41, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = add nuw nsw i64 %indvars.iv57, %indvars.iv.next
  %43 = trunc i64 %42 to i32
  %rem28.1 = srem i32 %43, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, 1.000000e+03
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv55
  br i1 %exitcond.1, label %for.cond40.preheader.loopexit, label %for.inc36

for.inc48:                                        ; preds = %for.inc48.preheader74, %for.inc48
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.inc48 ], [ %indvars.iv51.ph, %for.inc48.preheader74 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv51
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next52, 1000
  br i1 %exitcond54, label %for.inc51.loopexit, label %for.inc48, !llvm.loop !6

for.inc51.loopexit:                               ; preds = %for.inc48
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %middle.block, %for.cond40.preheader
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 1000
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  br i1 %exitcond60, label %for.end53, label %for.inc36.lr.ph

for.end53:                                        ; preds = %for.inc51
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #0 {
entry:
  %mul44 = fmul double %alpha, 0.000000e+00
  %broadcast.splatinsert73 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat74 = shufflevector <2 x double> %broadcast.splatinsert73, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert77 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat78 = shufflevector <2 x double> %broadcast.splatinsert77, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert79 = insertelement <2 x double> undef, double %mul44, i32 0
  %broadcast.splat80 = shufflevector <2 x double> %broadcast.splatinsert79, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc53, %entry
  %indvars.iv53 = phi i64 [ 0, %entry ], [ %indvars.iv.next54, %for.inc53 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv53, i64 0
  %0 = add nuw nsw i64 %indvars.iv53, 1
  %scevgep61 = getelementptr [1200 x double], [1200 x double]* %C, i64 %0, i64 0
  %cmp532 = icmp sgt i64 %indvars.iv53, 0
  %arrayidx41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv53
  br i1 %cmp532, label %for.cond4.preheader.us.preheader, label %vector.memcheck

for.cond4.preheader.us.preheader:                 ; preds = %for.cond1.preheader
  br label %for.cond4.preheader.us

vector.memcheck:                                  ; preds = %for.cond1.preheader
  %scevgep65 = getelementptr [1200 x double], [1200 x double]* %B, i64 %0, i64 0
  %scevgep63 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv53, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep65
  %bound1 = icmp ult double* %scevgep63, %scevgep61
  %found.conflict = and i1 %bound0, %bound1
  %bound068 = icmp ult double* %scevgep, %arrayidx41
  %bound169 = icmp ult double* %arrayidx41, %scevgep61
  %found.conflict70 = and i1 %bound068, %bound169
  %conflict.rdx = or i1 %found.conflict, %found.conflict70
  br i1 %conflict.rdx, label %for.cond4.preheader.preheader, label %vector.ph

for.cond4.preheader.preheader:                    ; preds = %vector.memcheck
  br label %for.cond4.preheader

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv53, i64 %index
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !8, !noalias !11
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !8, !noalias !11
  %5 = fmul <2 x double> %wide.load, %broadcast.splat74
  %6 = fmul <2 x double> %wide.load72, %broadcast.splat74
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv53, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !14
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !14
  %11 = fmul <2 x double> %wide.load75, %broadcast.splat78
  %12 = fmul <2 x double> %wide.load76, %broadcast.splat78
  %13 = load double, double* %arrayidx41, align 8, !alias.scope !15
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %13, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fmul <2 x double> %11, %15
  %19 = fmul <2 x double> %12, %17
  %20 = fadd <2 x double> %5, %18
  %21 = fadd <2 x double> %6, %19
  %22 = fadd <2 x double> %20, %broadcast.splat80
  %23 = fadd <2 x double> %21, %broadcast.splat80
  %24 = bitcast double* %1 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8, !alias.scope !8, !noalias !11
  %25 = bitcast double* %3 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !8, !noalias !11
  %index.next = add nuw nsw i64 %index, 4
  %26 = icmp eq i64 %index.next, 1200
  br i1 %26, label %for.inc53.loopexit84, label %vector.body, !llvm.loop !16

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.cond4.for.inc50_crit_edge.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.cond4.for.inc50_crit_edge.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv53, i64 %indvars.iv49
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond4.preheader.us
  %indvars.iv43 = phi i64 [ 0, %for.cond4.preheader.us ], [ %indvars.iv.next44, %for.inc.us ]
  %temp2.034.us = phi double [ 0.000000e+00, %for.cond4.preheader.us ], [ %add27.us, %for.inc.us ]
  %27 = load double, double* %arrayidx8.us, align 8
  %mul.us = fmul double %27, %alpha
  %arrayidx12.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv43
  %28 = load double, double* %arrayidx12.us, align 8
  %mul13.us = fmul double %mul.us, %28
  %arrayidx17.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv49
  %29 = load double, double* %arrayidx17.us, align 8
  %add.us = fadd double %29, %mul13.us
  store double %add.us, double* %arrayidx17.us, align 8
  %arrayidx21.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv43, i64 %indvars.iv49
  %30 = load double, double* %arrayidx21.us, align 8
  %31 = load double, double* %arrayidx12.us, align 8
  %mul26.us = fmul double %30, %31
  %add27.us = fadd double %temp2.034.us, %mul26.us
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next44, %indvars.iv53
  br i1 %exitcond48, label %for.cond4.for.inc50_crit_edge.us, label %for.inc.us

for.cond4.for.inc50_crit_edge.us:                 ; preds = %for.inc.us
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv53, i64 %indvars.iv49
  %32 = load double, double* %arrayidx31.us, align 8
  %mul32.us = fmul double %32, %beta
  %33 = load double, double* %arrayidx8.us, align 8
  %mul37.us = fmul double %33, %alpha
  %34 = load double, double* %arrayidx41, align 8
  %mul42.us = fmul double %mul37.us, %34
  %add43.us = fadd double %mul32.us, %mul42.us
  %mul44.us = fmul double %add27.us, %alpha
  %add45.us = fadd double %add43.us, %mul44.us
  store double %add45.us, double* %arrayidx31.us, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, 1200
  br i1 %exitcond52, label %for.inc53.loopexit, label %for.cond4.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader, %for.cond4.preheader.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next.1, %for.cond4.preheader ]
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv53, i64 %indvars.iv
  %35 = load double, double* %arrayidx31, align 8
  %mul32 = fmul double %35, %beta
  %arrayidx36 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv53, i64 %indvars.iv
  %36 = load double, double* %arrayidx36, align 8
  %mul37 = fmul double %36, %alpha
  %37 = load double, double* %arrayidx41, align 8
  %mul42 = fmul double %mul37, %37
  %add43 = fadd double %mul32, %mul42
  %add45 = fadd double %add43, %mul44
  store double %add45, double* %arrayidx31, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx31.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv53, i64 %indvars.iv.next
  %38 = load double, double* %arrayidx31.1, align 8
  %mul32.1 = fmul double %38, %beta
  %arrayidx36.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv53, i64 %indvars.iv.next
  %39 = load double, double* %arrayidx36.1, align 8
  %mul37.1 = fmul double %39, %alpha
  %40 = load double, double* %arrayidx41, align 8
  %mul42.1 = fmul double %mul37.1, %40
  %add43.1 = fadd double %mul32.1, %mul42.1
  %add45.1 = fadd double %add43.1, %mul44
  store double %add45.1, double* %arrayidx31.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %for.inc53.loopexit83, label %for.cond4.preheader, !llvm.loop !17

for.inc53.loopexit:                               ; preds = %for.cond4.for.inc50_crit_edge.us
  br label %for.inc53

for.inc53.loopexit83:                             ; preds = %for.cond4.preheader
  br label %for.inc53

for.inc53.loopexit84:                             ; preds = %vector.body
  br label %for.inc53

for.inc53:                                        ; preds = %for.inc53.loopexit84, %for.inc53.loopexit83, %for.inc53.loopexit
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, 1000
  br i1 %exitcond56, label %for.end55, label %for.cond1.preheader

for.end55:                                        ; preds = %for.inc53
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
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv14 = phi i64 [ 0, %entry ], [ %indvars.iv.next15, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv14, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond18, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
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
