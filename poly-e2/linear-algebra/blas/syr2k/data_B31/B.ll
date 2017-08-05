; ModuleID = 'A.ll'
source_filename = "syr2k.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %0 = bitcast i8* %call to [1200 x double]*
  %1 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay43 = bitcast i8* %call2 to [1000 x double]*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %0, [1000 x double]* %1, [1000 x double]* %arraydecay43)
  call void (...) @polybench_timer_start() #4
  %2 = load double, double* %alpha, align 8
  %3 = load double, double* %beta, align 8
  call fastcc void @kernel_syr2k(double %2, double %3, [1200 x double]* %0, [1000 x double]* %1, [1000 x double]* %arraydecay43)
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
define internal fastcc void @init_array(double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc17.us, %entry
  %indvars.iv34 = phi i64 [ 0, %entry ], [ %indvars.iv.next35, %for.inc17.us ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.inc.us ], [ 0, %for.cond1.preheader.us ]
  %0 = mul nuw nsw i64 %indvars.iv34, %indvars.iv26
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv26
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, 1000
  %conv10.us = sitofp i32 %rem9.us to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv10.us, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 1.200000e+03, double 1.000000e+03>
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx6.us, align 8
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv34, i64 %indvars.iv26
  store double %div.us.v.r2, double* %arrayidx16.us, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next27, 1000
  br i1 %exitcond40, label %for.inc17.us, label %for.inc.us

for.inc17.us:                                     ; preds = %for.inc.us
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next35, 1200
  br i1 %exitcond41, label %for.cond24.preheader.preheader, label %for.cond1.preheader.us

for.cond24.preheader.preheader:                   ; preds = %for.inc17.us
  br label %for.cond24.preheader

for.cond24.preheader:                             ; preds = %for.cond24.preheader.preheader, %for.inc41
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %for.inc41 ], [ 0, %for.cond24.preheader.preheader ]
  br label %for.inc38

for.inc38:                                        ; preds = %for.inc38, %for.cond24.preheader
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader ], [ %indvars.iv.next, %for.inc38 ]
  %5 = mul nuw nsw i64 %indvars.iv22, %indvars.iv
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30 = srem i32 %7, 1200
  %conv31 = sitofp i32 %rem30 to double
  %div33 = fdiv double %conv31, 1.000000e+03
  %arrayidx37 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv22, i64 %indvars.iv
  store double %div33, double* %arrayidx37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond39, label %for.inc41, label %for.inc38

for.inc41:                                        ; preds = %for.inc38
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond, label %for.end43, label %for.cond24.preheader

for.end43:                                        ; preds = %for.inc41
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) unnamed_addr #2 {
entry:
  %broadcast.splatinsert26 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat27 = shufflevector <2 x double> %broadcast.splatinsert26, <2 x double> undef, <2 x i32> zeroinitializer
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.2.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc43.us.for.inc.us.preheader_crit_edge, %entry
  %indvars.iv89 = phi i2 [ 1, %entry ], [ %indvars.iv.next90, %for.inc43.us.for.inc.us.preheader_crit_edge ]
  %indvars.iv70 = phi i64 [ 0, %entry ], [ %indvars.iv.next71, %for.inc43.us.for.inc.us.preheader_crit_edge ]
  %indvars.iv68 = phi i64 [ 1, %entry ], [ %indvars.iv.next69, %for.inc43.us.for.inc.us.preheader_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 0
  %2 = mul i64 %indvars.iv70, 1201
  %3 = add i64 %2, 1
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %3
  %4 = add i64 %indvars.iv70, 1
  %5 = zext i2 %indvars.iv89 to i64
  %6 = add nuw nsw i64 %5, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = add nuw nsw i64 %7, 1
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %9 = trunc i64 %indvars.iv.next71 to i32
  %xtraiter = and i32 %9, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.inc.us.preheader
  br label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.prol.preheader, %for.inc.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.us.prol ], [ 0, %for.inc.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.us.prol ], [ %xtraiter, %for.inc.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %indvars.iv.prol
  %10 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %10, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br i1 %prol.iter.cmp, label %for.inc.us.prol.loopexit.loopexit, label %for.inc.us.prol, !llvm.loop !1

for.inc.us.prol.loopexit.loopexit:                ; preds = %for.inc.us.prol
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol.loopexit.loopexit, %for.inc.us.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.inc.us.preheader ], [ %8, %for.inc.us.prol.loopexit.loopexit ]
  %11 = icmp ult i64 %indvars.iv70, 3
  br i1 %11, label %for.cond9.preheader.us23.preheader, label %for.inc.us.preheader28

for.inc.us.preheader28:                           ; preds = %for.inc.us.prol.loopexit
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader28, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc.us ], [ %indvars.iv.unr, %for.inc.us.preheader28 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %indvars.iv
  %12 = bitcast double* %arrayidx5.us to <2 x double>*
  %13 = load <2 x double>, <2 x double>* %12, align 8
  %mul.us = fmul <2 x double> %13, %mul.us.v.i1.2
  %14 = bitcast double* %arrayidx5.us to <2 x double>*
  store <2 x double> %mul.us, <2 x double>* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %indvars.iv.next.1
  %15 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  %16 = load <2 x double>, <2 x double>* %15, align 8
  %mul.us.2 = fmul <2 x double> %16, %mul.us.2.v.i1.2
  %17 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  store <2 x double> %mul.us.2, <2 x double>* %17, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv68
  br i1 %exitcond.3, label %for.cond9.preheader.us23.preheader.loopexit, label %for.inc.us

for.cond9.preheader.us23.preheader.loopexit:      ; preds = %for.inc.us
  br label %for.cond9.preheader.us23.preheader

for.cond9.preheader.us23.preheader:               ; preds = %for.cond9.preheader.us23.preheader.loopexit, %for.inc.us.prol.loopexit
  %min.iters.check = icmp ult i64 %4, 2
  %n.vec = and i64 %4, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %4, %n.vec
  br label %for.cond9.preheader.us23

for.cond9.preheader.us23:                         ; preds = %for.cond9.preheader.us23.preheader, %for.inc40.us46
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc40.us46 ], [ 0, %for.cond9.preheader.us23.preheader ]
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv63
  %18 = add i64 %indvars.iv63, 1
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv70, i64 %18
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv63
  %scevgep10 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv70, i64 %18
  %arrayidx20.us32 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv70, i64 %indvars.iv63
  %arrayidx30.us36 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv70, i64 %indvars.iv63
  br i1 %min.iters.check, label %for.inc37.us27.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond9.preheader.us23
  br i1 %cmp.zero, label %for.inc37.us27.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us36
  %bound1 = icmp ult double* %arrayidx30.us36, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound013 = icmp ult double* %scevgep, %scevgep6
  %bound114 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict15 = and i1 %bound013, %bound114
  %conflict.rdx = or i1 %found.conflict, %found.conflict15
  %bound016 = icmp ult double* %scevgep, %scevgep10
  %bound117 = icmp ult double* %scevgep8, %scevgep2
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx19 = or i1 %conflict.rdx, %found.conflict18
  %bound022 = icmp ult double* %scevgep, %arrayidx20.us32
  %bound123 = icmp ult double* %arrayidx20.us32, %scevgep2
  %found.conflict24 = and i1 %bound022, %bound123
  %conflict.rdx25 = or i1 %conflict.rdx19, %found.conflict24
  br i1 %conflict.rdx25, label %for.inc37.us27.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %19 = or i64 %index, 1
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv63
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %19, i64 %indvars.iv63
  %22 = load double, double* %20, align 8, !alias.scope !3
  %23 = load double, double* %21, align 8, !alias.scope !3
  %24 = insertelement <2 x double> undef, double %22, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fmul <2 x double> %25, %broadcast.splat27
  %27 = load double, double* %arrayidx20.us32, align 8, !alias.scope !6
  %28 = insertelement <2 x double> undef, double %27, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  %30 = fmul <2 x double> %26, %29
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index, i64 %indvars.iv63
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %19, i64 %indvars.iv63
  %33 = load double, double* %31, align 8, !alias.scope !8
  %34 = load double, double* %32, align 8, !alias.scope !8
  %35 = insertelement <2 x double> undef, double %33, i32 0
  %36 = insertelement <2 x double> %35, double %34, i32 1
  %37 = fmul <2 x double> %36, %broadcast.splat27
  %38 = load double, double* %arrayidx30.us36, align 8, !alias.scope !10
  %39 = insertelement <2 x double> undef, double %38, i32 0
  %40 = shufflevector <2 x double> %39, <2 x double> undef, <2 x i32> zeroinitializer
  %41 = fmul <2 x double> %37, %40
  %42 = fadd <2 x double> %30, %41
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %index
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !12, !noalias !14
  %45 = fadd <2 x double> %wide.load, %42
  %46 = bitcast double* %43 to <2 x double>*
  store <2 x double> %45, <2 x double>* %46, align 8, !alias.scope !12, !noalias !14
  %index.next = add i64 %index, 2
  %47 = icmp eq i64 %index.next, %n.vec
  br i1 %47, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc40.us46, label %for.inc37.us27.preheader

for.inc37.us27.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond9.preheader.us23
  %indvars.iv58.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond9.preheader.us23 ], [ %n.vec, %middle.block ]
  br label %for.inc37.us27

for.inc37.us27:                                   ; preds = %for.inc37.us27.preheader, %for.inc37.us27
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.inc37.us27 ], [ %indvars.iv58.ph, %for.inc37.us27.preheader ]
  %arrayidx15.us30 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv63
  %48 = load double, double* %arrayidx15.us30, align 8
  %mul16.us31 = fmul double %48, %alpha
  %49 = load double, double* %arrayidx20.us32, align 8
  %mul21.us33 = fmul double %mul16.us31, %49
  %arrayidx25.us34 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv58, i64 %indvars.iv63
  %50 = load double, double* %arrayidx25.us34, align 8
  %mul26.us35 = fmul double %50, %alpha
  %51 = load double, double* %arrayidx30.us36, align 8
  %mul31.us37 = fmul double %mul26.us35, %51
  %add.us38 = fadd double %mul21.us33, %mul31.us37
  %arrayidx35.us39 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %indvars.iv58
  %52 = load double, double* %arrayidx35.us39, align 8
  %add36.us40 = fadd double %52, %add.us38
  store double %add36.us40, double* %arrayidx35.us39, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond = icmp eq i64 %indvars.iv.next59, %indvars.iv68
  br i1 %exitcond, label %for.inc40.us46.loopexit, label %for.inc37.us27, !llvm.loop !18

for.inc40.us46.loopexit:                          ; preds = %for.inc37.us27
  br label %for.inc40.us46

for.inc40.us46:                                   ; preds = %for.inc40.us46.loopexit, %middle.block
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next64, 1000
  br i1 %exitcond88, label %for.inc43.us, label %for.cond9.preheader.us23

for.inc43.us:                                     ; preds = %for.inc40.us46
  %exitcond91 = icmp eq i64 %indvars.iv.next71, 1200
  br i1 %exitcond91, label %for.end45, label %for.inc43.us.for.inc.us.preheader_crit_edge

for.inc43.us.for.inc.us.preheader_crit_edge:      ; preds = %for.inc43.us
  %indvars.iv.next90 = add i2 %indvars.iv89, 1
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  br label %for.inc.us.preheader

for.end45:                                        ; preds = %for.inc43.us
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
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.inc10 ]
  %3 = mul nsw i64 %indvars.iv10, 1200
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond15, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, 1200
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader

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
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!11}
!11 = distinct !{!11, !5}
!12 = !{!13}
!13 = distinct !{!13, !5}
!14 = !{!11, !4, !9, !7}
!15 = distinct !{!15, !16, !17}
!16 = !{!"llvm.loop.vectorize.width", i32 1}
!17 = !{!"llvm.loop.interleave.count", i32 1}
!18 = distinct !{!18, !16, !17}
