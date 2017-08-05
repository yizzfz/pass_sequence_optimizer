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
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
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
  call fastcc void @print_array(i32 1200, [1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) unnamed_addr #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc17_crit_edge.us, %entry
  %indvars.iv44 = phi i64 [ 0, %entry ], [ %indvars.iv.next45, %for.cond1.for.inc17_crit_edge.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv37 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next38, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv37, %indvars.iv44
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.200000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv37
  store double %div.us, double* %arrayidx6.us, align 8
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, 1000
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, 1.000000e+03
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv37
  store double %div12.us, double* %arrayidx16.us, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond50, label %for.cond1.for.inc17_crit_edge.us, label %for.body3.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next45, 1200
  br i1 %exitcond51, label %for.cond24.preheader.us.preheader, label %for.cond1.preheader.us

for.cond24.preheader.us.preheader:                ; preds = %for.cond1.for.inc17_crit_edge.us
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.cond24.preheader.us.preheader, %for.cond24.for.inc41_crit_edge.us
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.cond24.for.inc41_crit_edge.us ], [ 0, %for.cond24.preheader.us.preheader ]
  br label %for.body27.us

for.body27.us:                                    ; preds = %for.body27.us, %for.cond24.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader.us ], [ %indvars.iv.next, %for.body27.us ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv33
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30.us = srem i32 %7, 1200
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, 1.000000e+03
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv33, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond49, label %for.cond24.for.inc41_crit_edge.us, label %for.body27.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.body27.us
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond = icmp eq i64 %indvars.iv.next34, 1200
  br i1 %exitcond, label %for.end43, label %for.cond24.preheader.us

for.end43:                                        ; preds = %for.cond24.for.inc41_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) unnamed_addr #0 {
entry:
  %broadcast.splatinsert149 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat150 = shufflevector <2 x double> %broadcast.splatinsert149, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert174 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat175 = shufflevector <2 x double> %broadcast.splatinsert174, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us.preheader177, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader177 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %indvars.iv
  %0 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %0, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %indvars.iv.next
  %1 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %1, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %indvars.iv.next.1
  %2 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %2, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %indvars.iv.next.2
  %3 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %3, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv73
  br i1 %exitcond.3, label %for.cond9.preheader.us33.preheader.loopexit, label %for.body3.us, !llvm.loop !1

for.cond9.preheader.us33.preheader.loopexit:      ; preds = %for.body3.us
  br label %for.cond9.preheader.us33.preheader

for.cond9.preheader.us33.preheader:               ; preds = %for.cond9.preheader.us33.preheader.loopexit, %middle.block152, %for.body3.us.prol.loopexit
  %min.iters.check110 = icmp ult i64 %42, 2
  %n.vec113 = and i64 %42, -2
  %cmp.zero114 = icmp eq i64 %n.vec113, 0
  %cmp.n145 = icmp eq i64 %42, %n.vec113
  br label %for.cond9.preheader.us33

for.cond9.preheader.us33:                         ; preds = %for.cond9.preheader.us33.preheader, %for.cond9.for.inc40_crit_edge.us56
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.cond9.for.inc40_crit_edge.us56 ], [ 0, %for.cond9.preheader.us33.preheader ]
  %scevgep119 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv68
  %4 = add i64 %indvars.iv68, 1
  %scevgep121 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv75, i64 %4
  %scevgep123 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv68
  %scevgep125 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv75, i64 %4
  %arrayidx20.us54 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv75, i64 %indvars.iv68
  %arrayidx30.us55 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv75, i64 %indvars.iv68
  br i1 %min.iters.check110, label %for.body11.us35.preheader, label %min.iters.checked111

min.iters.checked111:                             ; preds = %for.cond9.preheader.us33
  br i1 %cmp.zero114, label %for.body11.us35.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked111
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us55
  %bound1 = icmp ult double* %arrayidx30.us55, %scevgep117
  %found.conflict = and i1 %bound0, %bound1
  %bound0128 = icmp ult double* %scevgep, %scevgep121
  %bound1129 = icmp ult double* %scevgep119, %scevgep117
  %found.conflict130 = and i1 %bound0128, %bound1129
  %conflict.rdx = or i1 %found.conflict, %found.conflict130
  %bound0131 = icmp ult double* %scevgep, %scevgep125
  %bound1132 = icmp ult double* %scevgep123, %scevgep117
  %found.conflict133 = and i1 %bound0131, %bound1132
  %conflict.rdx134 = or i1 %conflict.rdx, %found.conflict133
  %bound0137 = icmp ult double* %scevgep, %arrayidx20.us54
  %bound1138 = icmp ult double* %arrayidx20.us54, %scevgep117
  %found.conflict139 = and i1 %bound0137, %bound1138
  %conflict.rdx140 = or i1 %conflict.rdx134, %found.conflict139
  br i1 %conflict.rdx140, label %for.body11.us35.preheader, label %vector.ph141

vector.ph141:                                     ; preds = %vector.memcheck
  %5 = load double, double* %arrayidx20.us54, align 8, !alias.scope !5
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %8 = load double, double* %arrayidx30.us55, align 8, !alias.scope !8
  %9 = insertelement <2 x double> undef, double %8, i32 0
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body107

vector.body107:                                   ; preds = %vector.body107, %vector.ph141
  %index142 = phi i64 [ 0, %vector.ph141 ], [ %index.next143, %vector.body107 ]
  %11 = or i64 %index142, 1
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index142, i64 %indvars.iv68
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %11, i64 %indvars.iv68
  %14 = load double, double* %12, align 8, !alias.scope !10
  %15 = load double, double* %13, align 8, !alias.scope !10
  %16 = insertelement <2 x double> undef, double %14, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fmul <2 x double> %17, %broadcast.splat150
  %19 = fmul <2 x double> %18, %7
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index142, i64 %indvars.iv68
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %11, i64 %indvars.iv68
  %22 = load double, double* %20, align 8, !alias.scope !12
  %23 = load double, double* %21, align 8, !alias.scope !12
  %24 = insertelement <2 x double> undef, double %22, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fmul <2 x double> %25, %broadcast.splat150
  %27 = fmul <2 x double> %26, %10
  %28 = fadd <2 x double> %19, %27
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %index142
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !14, !noalias !16
  %31 = fadd <2 x double> %wide.load, %28
  %32 = bitcast double* %29 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8, !alias.scope !14, !noalias !16
  %index.next143 = add i64 %index142, 2
  %33 = icmp eq i64 %index.next143, %n.vec113
  br i1 %33, label %middle.block108, label %vector.body107, !llvm.loop !17

middle.block108:                                  ; preds = %vector.body107
  br i1 %cmp.n145, label %for.cond9.for.inc40_crit_edge.us56, label %for.body11.us35.preheader

for.body11.us35.preheader:                        ; preds = %middle.block108, %vector.memcheck, %min.iters.checked111, %for.cond9.preheader.us33
  %indvars.iv63.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked111 ], [ 0, %for.cond9.preheader.us33 ], [ %n.vec113, %middle.block108 ]
  br label %for.body11.us35

for.body11.us35:                                  ; preds = %for.body11.us35.preheader, %for.body11.us35
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.body11.us35 ], [ %indvars.iv63.ph, %for.body11.us35.preheader ]
  %arrayidx15.us38 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv63, i64 %indvars.iv68
  %34 = load double, double* %arrayidx15.us38, align 8
  %mul16.us39 = fmul double %34, %alpha
  %35 = load double, double* %arrayidx20.us54, align 8
  %mul21.us40 = fmul double %mul16.us39, %35
  %arrayidx25.us41 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv63, i64 %indvars.iv68
  %36 = load double, double* %arrayidx25.us41, align 8
  %mul26.us42 = fmul double %36, %alpha
  %37 = load double, double* %arrayidx30.us55, align 8
  %mul31.us43 = fmul double %mul26.us42, %37
  %add.us44 = fadd double %mul21.us40, %mul31.us43
  %arrayidx35.us45 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %indvars.iv63
  %38 = load double, double* %arrayidx35.us45, align 8
  %add36.us46 = fadd double %38, %add.us44
  store double %add36.us46, double* %arrayidx35.us45, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond = icmp eq i64 %indvars.iv.next64, %indvars.iv73
  br i1 %exitcond, label %for.cond9.for.inc40_crit_edge.us56.loopexit, label %for.body11.us35, !llvm.loop !18

for.body3.lr.ph.us:                               ; preds = %entry, %for.cond6.for.inc43_crit_edge.us
  %indvars.iv93 = phi i2 [ 1, %entry ], [ %indvars.iv.next94, %for.cond6.for.inc43_crit_edge.us ]
  %indvars.iv75 = phi i64 [ 0, %entry ], [ %indvars.iv.next76, %for.cond6.for.inc43_crit_edge.us ]
  %indvars.iv73 = phi i64 [ 1, %entry ], [ %indvars.iv.next74, %for.cond6.for.inc43_crit_edge.us ]
  %39 = add i64 %indvars.iv75, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 0
  %40 = mul i64 %indvars.iv75, 1201
  %41 = add i64 %40, 1
  %scevgep117 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %41
  %42 = add i64 %indvars.iv75, 1
  %43 = zext i2 %indvars.iv93 to i64
  %44 = add nuw nsw i64 %43, 4294967295
  %45 = and i64 %44, 4294967295
  %46 = add nuw nsw i64 %45, 1
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %47 = trunc i64 %indvars.iv.next76 to i32
  %xtraiter = and i32 %47, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader, %for.body3.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us.prol ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %indvars.iv.prol
  %48 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %48, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit.loopexit, label %for.body3.us.prol, !llvm.loop !19

for.body3.us.prol.loopexit.loopexit:              ; preds = %for.body3.us.prol
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.loopexit, %for.body3.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph.us ], [ %46, %for.body3.us.prol.loopexit.loopexit ]
  %49 = icmp ult i64 %indvars.iv75, 3
  br i1 %49, label %for.cond9.preheader.us33.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %50 = sub i64 %39, %indvars.iv.unr
  %51 = lshr i64 %50, 2
  %52 = add nuw nsw i64 %51, 1
  %min.iters.check154 = icmp ult i64 %52, 2
  br i1 %min.iters.check154, label %for.body3.us.preheader177, label %min.iters.checked155

for.body3.us.preheader177:                        ; preds = %middle.block152, %min.iters.checked155, %for.body3.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked155 ], [ %indvars.iv.unr, %for.body3.us.preheader ], [ %ind.end163, %middle.block152 ]
  br label %for.body3.us

min.iters.checked155:                             ; preds = %for.body3.us.preheader
  %n.mod.vf156 = and i64 %52, 1
  %n.vec157 = sub nsw i64 %52, %n.mod.vf156
  %cmp.zero158 = icmp eq i64 %n.vec157, 0
  %53 = add nsw i64 %indvars.iv.unr, 4
  %54 = shl nuw i64 %51, 2
  %55 = add i64 %53, %54
  %56 = shl nuw nsw i64 %n.mod.vf156, 2
  %ind.end163 = sub i64 %55, %56
  br i1 %cmp.zero158, label %for.body3.us.preheader177, label %vector.ph159

vector.ph159:                                     ; preds = %min.iters.checked155
  br label %vector.body151

vector.body151:                                   ; preds = %vector.body151, %vector.ph159
  %index160 = phi i64 [ 0, %vector.ph159 ], [ %index.next161, %vector.body151 ]
  %57 = shl i64 %index160, 2
  %58 = add i64 %indvars.iv.unr, %57
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %58
  %60 = bitcast double* %59 to <8 x double>*
  %wide.vec169 = load <8 x double>, <8 x double>* %60, align 8
  %strided.vec170 = shufflevector <8 x double> %wide.vec169, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec171 = shufflevector <8 x double> %wide.vec169, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec172 = shufflevector <8 x double> %wide.vec169, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec173 = shufflevector <8 x double> %wide.vec169, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %61 = fmul <2 x double> %strided.vec170, %broadcast.splat175
  %62 = fmul <2 x double> %strided.vec171, %broadcast.splat175
  %63 = fmul <2 x double> %strided.vec172, %broadcast.splat175
  %64 = add nsw i64 %58, 3
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %64
  %66 = fmul <2 x double> %strided.vec173, %broadcast.splat175
  %67 = getelementptr double, double* %65, i64 -3
  %68 = bitcast double* %67 to <8 x double>*
  %69 = shufflevector <2 x double> %61, <2 x double> %62, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %70 = shufflevector <2 x double> %63, <2 x double> %66, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec176 = shufflevector <4 x double> %69, <4 x double> %70, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec176, <8 x double>* %68, align 8
  %index.next161 = add i64 %index160, 2
  %71 = icmp eq i64 %index.next161, %n.vec157
  br i1 %71, label %middle.block152, label %vector.body151, !llvm.loop !21

middle.block152:                                  ; preds = %vector.body151
  %cmp.n164 = icmp eq i64 %n.mod.vf156, 0
  br i1 %cmp.n164, label %for.cond9.preheader.us33.preheader, label %for.body3.us.preheader177

for.cond9.for.inc40_crit_edge.us56.loopexit:      ; preds = %for.body11.us35
  br label %for.cond9.for.inc40_crit_edge.us56

for.cond9.for.inc40_crit_edge.us56:               ; preds = %for.cond9.for.inc40_crit_edge.us56.loopexit, %middle.block108
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next69, 1000
  br i1 %exitcond95, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.preheader.us33

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond9.for.inc40_crit_edge.us56
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %indvars.iv.next94 = add i2 %indvars.iv93, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next76, 1200
  br i1 %exitcond96, label %for.end45, label %for.body3.lr.ph.us

for.end45:                                        ; preds = %for.cond6.for.inc43_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1200 x double]* %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv12 = phi i64 [ 0, %entry ], [ %indvars.iv.next13, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv12, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv12, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond17, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, 1200
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
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
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = !{!11}
!11 = distinct !{!11, !7}
!12 = !{!13}
!13 = distinct !{!13, !7}
!14 = !{!15}
!15 = distinct !{!15, !7}
!16 = !{!9, !11, !13, !6}
!17 = distinct !{!17, !3, !4}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
