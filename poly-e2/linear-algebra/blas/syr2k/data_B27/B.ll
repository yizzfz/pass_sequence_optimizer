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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
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
  call fastcc void @print_array(i32 1200, [1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1000 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc17_crit_edge.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.cond1.for.inc17_crit_edge.us ], [ 0, %entry ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv39 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next40, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv39, %indvars.iv46
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.200000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv39
  store double %div.us, double* %arrayidx6.us, align 8
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, 1000
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, 1.000000e+03
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv46, i64 %indvars.iv39
  store double %div12.us, double* %arrayidx16.us, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next40, 1000
  br i1 %exitcond45, label %for.cond1.for.inc17_crit_edge.us, label %for.inc.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, 1200
  br i1 %exitcond49, label %for.cond24.preheader.us.preheader, label %for.cond1.preheader.us

for.cond24.preheader.us.preheader:                ; preds = %for.cond1.for.inc17_crit_edge.us
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.cond24.preheader.us.preheader, %for.cond24.for.inc41_crit_edge.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %for.cond24.for.inc41_crit_edge.us ], [ 0, %for.cond24.preheader.us.preheader ]
  br label %for.inc38.us

for.inc38.us:                                     ; preds = %for.inc38.us, %for.cond24.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader.us ], [ %indvars.iv.next, %for.inc38.us ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv35
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30.us = srem i32 %7, 1200
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, 1.000000e+03
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv35, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond24.for.inc41_crit_edge.us, label %for.inc38.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.inc38.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 1200
  br i1 %exitcond38, label %for.end43, label %for.cond24.preheader.us

for.end43:                                        ; preds = %for.cond24.for.inc41_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %broadcast.splatinsert142 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat143 = shufflevector <2 x double> %broadcast.splatinsert142, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert167 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat168 = shufflevector <2 x double> %broadcast.splatinsert167, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc.lr.ph.us

for.inc.us:                                       ; preds = %for.inc.us.preheader170, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader170 ]
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
  br i1 %exitcond.3, label %for.cond9.preheader.us33.preheader.loopexit, label %for.inc.us, !llvm.loop !1

for.cond9.preheader.us33.preheader.loopexit:      ; preds = %for.inc.us
  br label %for.cond9.preheader.us33.preheader

for.cond9.preheader.us33.preheader:               ; preds = %for.cond9.preheader.us33.preheader.loopexit, %middle.block145, %for.inc.us.prol.loopexit
  %min.iters.check103 = icmp ult i64 %46, 2
  %n.vec106 = and i64 %46, -2
  %cmp.zero107 = icmp eq i64 %n.vec106, 0
  %cmp.n138 = icmp eq i64 %46, %n.vec106
  br label %for.cond9.preheader.us33

for.cond9.preheader.us33:                         ; preds = %for.cond9.preheader.us33.preheader, %for.cond9.for.inc40_crit_edge.us56
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.cond9.for.inc40_crit_edge.us56 ], [ 0, %for.cond9.preheader.us33.preheader ]
  %scevgep112 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv68
  %4 = add nuw nsw i64 %indvars.iv68, 1
  %scevgep114 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv75, i64 %4
  %scevgep116 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv68
  %scevgep118 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv75, i64 %4
  %arrayidx20.us54 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv75, i64 %indvars.iv68
  %arrayidx30.us55 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv75, i64 %indvars.iv68
  br i1 %min.iters.check103, label %for.inc37.us35.preheader, label %min.iters.checked104

min.iters.checked104:                             ; preds = %for.cond9.preheader.us33
  br i1 %cmp.zero107, label %for.inc37.us35.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked104
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us55
  %bound1 = icmp ult double* %arrayidx30.us55, %scevgep110
  %found.conflict = and i1 %bound0, %bound1
  %bound0121 = icmp ult double* %scevgep, %scevgep114
  %bound1122 = icmp ult double* %scevgep112, %scevgep110
  %found.conflict123 = and i1 %bound0121, %bound1122
  %conflict.rdx = or i1 %found.conflict, %found.conflict123
  %bound0124 = icmp ult double* %scevgep, %scevgep118
  %bound1125 = icmp ult double* %scevgep116, %scevgep110
  %found.conflict126 = and i1 %bound0124, %bound1125
  %conflict.rdx127 = or i1 %conflict.rdx, %found.conflict126
  %bound0130 = icmp ult double* %scevgep, %arrayidx20.us54
  %bound1131 = icmp ult double* %arrayidx20.us54, %scevgep110
  %found.conflict132 = and i1 %bound0130, %bound1131
  %conflict.rdx133 = or i1 %conflict.rdx127, %found.conflict132
  br i1 %conflict.rdx133, label %for.inc37.us35.preheader, label %vector.ph134

vector.ph134:                                     ; preds = %vector.memcheck
  %5 = load double, double* %arrayidx20.us54, align 8, !alias.scope !5
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %8 = load double, double* %arrayidx30.us55, align 8, !alias.scope !8
  %9 = insertelement <2 x double> undef, double %8, i32 0
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body100

vector.body100:                                   ; preds = %vector.body100, %vector.ph134
  %index135 = phi i64 [ 0, %vector.ph134 ], [ %index.next136, %vector.body100 ]
  %11 = or i64 %index135, 1
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index135, i64 %indvars.iv68
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %11, i64 %indvars.iv68
  %14 = load double, double* %12, align 8, !alias.scope !10
  %15 = load double, double* %13, align 8, !alias.scope !10
  %16 = insertelement <2 x double> undef, double %14, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fmul <2 x double> %17, %broadcast.splat143
  %19 = fmul <2 x double> %18, %7
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index135, i64 %indvars.iv68
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %11, i64 %indvars.iv68
  %22 = load double, double* %20, align 8, !alias.scope !12
  %23 = load double, double* %21, align 8, !alias.scope !12
  %24 = insertelement <2 x double> undef, double %22, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fmul <2 x double> %25, %broadcast.splat143
  %27 = fmul <2 x double> %26, %10
  %28 = fadd <2 x double> %19, %27
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %index135
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !14, !noalias !16
  %31 = fadd <2 x double> %wide.load, %28
  %32 = bitcast double* %29 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8, !alias.scope !14, !noalias !16
  %index.next136 = add i64 %index135, 2
  %33 = icmp eq i64 %index.next136, %n.vec106
  br i1 %33, label %middle.block101, label %vector.body100, !llvm.loop !17

middle.block101:                                  ; preds = %vector.body100
  br i1 %cmp.n138, label %for.cond9.for.inc40_crit_edge.us56, label %for.inc37.us35.preheader

for.inc37.us35.preheader:                         ; preds = %middle.block101, %vector.memcheck, %min.iters.checked104, %for.cond9.preheader.us33
  %indvars.iv63.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked104 ], [ 0, %for.cond9.preheader.us33 ], [ %n.vec106, %middle.block101 ]
  br label %for.inc37.us35

for.inc37.us35:                                   ; preds = %for.inc37.us35.preheader, %for.inc37.us35
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc37.us35 ], [ %indvars.iv63.ph, %for.inc37.us35.preheader ]
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
  br i1 %exitcond, label %for.cond9.for.inc40_crit_edge.us56.loopexit, label %for.inc37.us35, !llvm.loop !18

for.inc.lr.ph.us:                                 ; preds = %entry, %for.cond6.for.inc43_crit_edge.us
  %indvars.iv171 = phi i2 [ 1, %entry ], [ %indvars.iv.next172, %for.cond6.for.inc43_crit_edge.us ]
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %for.cond6.for.inc43_crit_edge.us ], [ 0, %entry ]
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %for.cond6.for.inc43_crit_edge.us ], [ 1, %entry ]
  %39 = zext i2 %indvars.iv171 to i32
  %40 = add i32 %39, -1
  %41 = zext i32 %40 to i64
  %42 = add i64 %41, 1
  %43 = add nsw i64 %indvars.iv75, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 0
  %44 = mul nuw nsw i64 %indvars.iv75, 1201
  %45 = add nuw nsw i64 %44, 1
  %scevgep110 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %45
  %46 = add nuw nsw i64 %indvars.iv75, 1
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %47 = trunc i64 %indvars.iv.next76 to i32
  %xtraiter = and i32 %47, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.inc.lr.ph.us
  br label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.prol.preheader, %for.inc.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.us.prol ], [ 0, %for.inc.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.us.prol ], [ %xtraiter, %for.inc.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %indvars.iv.prol
  %48 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %48, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.us.prol.loopexit.loopexit, label %for.inc.us.prol, !llvm.loop !19

for.inc.us.prol.loopexit.loopexit:                ; preds = %for.inc.us.prol
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol.loopexit.loopexit, %for.inc.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph.us ], [ %42, %for.inc.us.prol.loopexit.loopexit ]
  %49 = icmp ult i64 %indvars.iv75, 3
  br i1 %49, label %for.cond9.preheader.us33.preheader, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %50 = sub i64 %43, %indvars.iv.unr
  %51 = lshr i64 %50, 2
  %52 = add nuw nsw i64 %51, 1
  %min.iters.check147 = icmp ult i64 %52, 2
  br i1 %min.iters.check147, label %for.inc.us.preheader170, label %min.iters.checked148

for.inc.us.preheader170:                          ; preds = %middle.block145, %min.iters.checked148, %for.inc.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked148 ], [ %indvars.iv.unr, %for.inc.us.preheader ], [ %ind.end156, %middle.block145 ]
  br label %for.inc.us

min.iters.checked148:                             ; preds = %for.inc.us.preheader
  %n.mod.vf149 = and i64 %52, 1
  %n.vec150 = sub nsw i64 %52, %n.mod.vf149
  %cmp.zero151 = icmp eq i64 %n.vec150, 0
  %53 = add i64 %indvars.iv.unr, 4
  %54 = shl nuw i64 %51, 2
  %55 = add i64 %53, %54
  %56 = shl nuw nsw i64 %n.mod.vf149, 2
  %ind.end156 = sub i64 %55, %56
  br i1 %cmp.zero151, label %for.inc.us.preheader170, label %vector.ph152

vector.ph152:                                     ; preds = %min.iters.checked148
  br label %vector.body144

vector.body144:                                   ; preds = %vector.body144, %vector.ph152
  %index153 = phi i64 [ 0, %vector.ph152 ], [ %index.next154, %vector.body144 ]
  %57 = shl i64 %index153, 2
  %58 = add i64 %indvars.iv.unr, %57
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %58
  %60 = bitcast double* %59 to <8 x double>*
  %wide.vec162 = load <8 x double>, <8 x double>* %60, align 8
  %strided.vec163 = shufflevector <8 x double> %wide.vec162, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec164 = shufflevector <8 x double> %wide.vec162, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec165 = shufflevector <8 x double> %wide.vec162, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec166 = shufflevector <8 x double> %wide.vec162, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %61 = fmul <2 x double> %strided.vec163, %broadcast.splat168
  %62 = fmul <2 x double> %strided.vec164, %broadcast.splat168
  %63 = fmul <2 x double> %strided.vec165, %broadcast.splat168
  %64 = add nsw i64 %58, 3
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %64
  %66 = fmul <2 x double> %strided.vec166, %broadcast.splat168
  %67 = getelementptr double, double* %65, i64 -3
  %68 = bitcast double* %67 to <8 x double>*
  %69 = shufflevector <2 x double> %61, <2 x double> %62, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %70 = shufflevector <2 x double> %63, <2 x double> %66, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec169 = shufflevector <4 x double> %69, <4 x double> %70, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec169, <8 x double>* %68, align 8
  %index.next154 = add i64 %index153, 2
  %71 = icmp eq i64 %index.next154, %n.vec150
  br i1 %71, label %middle.block145, label %vector.body144, !llvm.loop !21

middle.block145:                                  ; preds = %vector.body144
  %cmp.n157 = icmp eq i64 %n.mod.vf149, 0
  br i1 %cmp.n157, label %for.cond9.preheader.us33.preheader, label %for.inc.us.preheader170

for.cond9.for.inc40_crit_edge.us56.loopexit:      ; preds = %for.inc37.us35
  br label %for.cond9.for.inc40_crit_edge.us56

for.cond9.for.inc40_crit_edge.us56:               ; preds = %for.cond9.for.inc40_crit_edge.us56.loopexit, %middle.block101
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, 1000
  br i1 %exitcond71, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.preheader.us33

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond9.for.inc40_crit_edge.us56
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next76, 1200
  %indvars.iv.next172 = add i2 %indvars.iv171, 1
  br i1 %exitcond78, label %for.end45, label %for.inc.lr.ph.us

for.end45:                                        ; preds = %for.cond6.for.inc43_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1200 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv13 = phi i64 [ 0, %entry ], [ %indvars.iv.next14, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv13, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv13, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond17, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
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
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

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
