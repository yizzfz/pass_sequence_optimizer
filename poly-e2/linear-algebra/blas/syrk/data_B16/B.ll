; ModuleID = 'A.ll'
source_filename = "syrk.c"
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
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  %arraydecay31 = bitcast i8* %call to [1200 x double]*
  %arraydecay42 = bitcast i8* %call1 to [1000 x double]*
  tail call fastcc void @kernel_syrk(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay31, [1000 x double]* %arraydecay42)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %arraydecay31)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* %C, [1000 x double]* %A) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br i1 true, label %for.cond1.preheader.lr.ph, label %for.end33

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br i1 true, label %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge, label %for.cond14.preheader.lr.ph

for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge: ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv32 = phi i64 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %indvars.iv.next33, %for.cond1.for.inc7_crit_edge.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  %0 = mul nsw i64 %indvars.iv32, %indvars.iv26
  %1 = add nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.200000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv32, i64 %indvars.iv26
  store double %div.us, double* %arrayidx6.us, align 8
  %exitcond = icmp eq i64 %indvars.iv26, 999
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  br i1 %exitcond, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next33 = add nsw i64 %indvars.iv32, 1
  %cmp.us = icmp slt i64 %indvars.iv.next33, 1200
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond14.preheader.lr.ph.loopexit

for.cond14.preheader.lr.ph.loopexit:              ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.cond14.preheader.lr.ph

for.cond14.preheader.lr.ph:                       ; preds = %for.cond14.preheader.lr.ph.loopexit, %for.cond1.preheader.lr.ph
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.for.inc31_crit_edge.us, %for.cond14.preheader.lr.ph
  %indvars.iv24 = phi i64 [ 0, %for.cond14.preheader.lr.ph ], [ %indvars.iv.next25, %for.cond14.for.inc31_crit_edge.us ]
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us, %for.cond14.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body17.us ], [ 0, %for.cond14.preheader.us ]
  %3 = mul nsw i64 %indvars.iv24, %indvars.iv
  %4 = add nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem20.us = srem i32 %5, 1000
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, 1.000000e+03
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv24, i64 %indvars.iv
  store double %div23.us, double* %arrayidx27.us, align 8
  %exitcond36 = icmp eq i64 %indvars.iv, 1199
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond36, label %for.cond14.for.inc31_crit_edge.us, label %for.body17.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.body17.us
  %indvars.iv.next25 = add nsw i64 %indvars.iv24, 1
  %cmp11.us = icmp slt i64 %indvars.iv.next25, 1200
  br i1 %cmp11.us, label %for.cond14.preheader.us, label %for.end33.loopexit

for.end33.loopexit:                               ; preds = %for.cond14.for.inc31_crit_edge.us
  br label %for.end33

for.end33:                                        ; preds = %for.end33.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A) unnamed_addr #2 {
entry:
  br i1 true, label %for.cond1.preheader.lr.ph, label %for.end34

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br i1 true, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %broadcast.splatinsert120 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splatinsert143 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat144 = shufflevector <2 x double> %broadcast.splatinsert143, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond6.for.inc32_crit_edge.us
  %indvar97 = phi i64 [ %indvar.next98, %for.cond6.for.inc32_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %indvar89 = phi i32 [ %indvar.next90, %for.cond6.for.inc32_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %indvars.iv75 = phi i32 [ %indvars.iv.next76, %for.cond6.for.inc32_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.cond6.for.inc32_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %0 = add i64 %indvar97, 1
  %1 = and i64 %indvar97, 4294967295
  %2 = add nuw nsw i64 %1, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvar97, i64 0
  %scevgep100 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvar97, i64 1
  %scevgep101 = getelementptr double, double* %scevgep100, i64 %1
  %3 = zext i32 %indvar89 to i64
  %4 = add nuw nsw i64 %3, 1
  %5 = zext i32 %indvars.iv75 to i64
  %cmp24.us = icmp slt i64 %indvars.iv60, 0
  br i1 %cmp24.us, label %for.cond6.for.inc32_crit_edge.us, label %for.cond1.preheader.us.for.body3.us_crit_edge

for.cond1.preheader.us.for.body3.us_crit_edge:    ; preds = %for.cond1.preheader.us
  %min.iters.check127 = icmp ult i64 %2, 4
  br i1 %min.iters.check127, label %for.body3.us.preheader, label %min.iters.checked128

min.iters.checked128:                             ; preds = %for.cond1.preheader.us.for.body3.us_crit_edge
  %fold = add i64 %indvar97, 1
  %n.mod.vf129 = and i64 %fold, 3
  %n.vec130 = sub nsw i64 %2, %n.mod.vf129
  %cmp.zero131 = icmp eq i64 %n.vec130, 0
  br i1 %cmp.zero131, label %for.body3.us.preheader, label %vector.ph132

vector.ph132:                                     ; preds = %min.iters.checked128
  br label %vector.body124

vector.body124:                                   ; preds = %vector.body124, %vector.ph132
  %index133 = phi i64 [ 0, %vector.ph132 ], [ %index.next134, %vector.body124 ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv60, i64 %index133
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load141 = load <2 x double>, <2 x double>* %7, align 8
  %8 = getelementptr double, double* %6, i64 2
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load142 = load <2 x double>, <2 x double>* %9, align 8
  %10 = fmul <2 x double> %broadcast.splat144, %wide.load141
  %11 = fmul <2 x double> %broadcast.splat144, %wide.load142
  store <2 x double> %10, <2 x double>* %7, align 8
  store <2 x double> %11, <2 x double>* %9, align 8
  %index.next134 = add i64 %index133, 4
  %12 = icmp eq i64 %index.next134, %n.vec130
  br i1 %12, label %middle.block125, label %vector.body124, !llvm.loop !1

middle.block125:                                  ; preds = %vector.body124
  %cmp.n136 = icmp eq i64 %n.mod.vf129, 0
  br i1 %cmp.n136, label %for.cond9.preheader.us21.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %middle.block125, %min.iters.checked128, %for.cond1.preheader.us.for.body3.us_crit_edge
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked128 ], [ 0, %for.cond1.preheader.us.for.body3.us_crit_edge ], [ %n.vec130, %middle.block125 ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv60, i64 %indvars.iv
  %13 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %13, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %exitcond74 = icmp eq i64 %indvars.iv, %5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond74, label %for.cond9.preheader.us21.preheader.loopexit, label %for.body3.us, !llvm.loop !4

for.cond9.preheader.us21.preheader.loopexit:      ; preds = %for.body3.us
  br label %for.cond9.preheader.us21.preheader

for.cond9.preheader.us21.preheader:               ; preds = %for.cond9.preheader.us21.preheader.loopexit, %middle.block125
  %min.iters.check91 = icmp ult i64 %4, 4
  %n.vec94 = and i64 %4, 8589934588
  %cmp.zero95 = icmp eq i64 %n.vec94, 0
  %cmp.n115 = icmp eq i64 %4, %n.vec94
  br label %for.cond9.preheader.us21

for.cond9.preheader.us21:                         ; preds = %for.cond9.preheader.us21.preheader, %for.cond9.for.inc29_crit_edge.us42
  %indvars.iv57 = phi i64 [ %14, %for.cond9.for.inc29_crit_edge.us42 ], [ 0, %for.cond9.preheader.us21.preheader ]
  %scevgep103 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv57
  %14 = add i64 %indvars.iv57, 1
  %scevgep105 = getelementptr [1000 x double], [1000 x double]* %A, i64 %1, i64 %14
  %arrayidx15.us27 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv57
  br i1 %min.iters.check91, label %for.body11.us23.preheader, label %min.iters.checked92

min.iters.checked92:                              ; preds = %for.cond9.preheader.us21
  br i1 %cmp.zero95, label %for.body11.us23.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked92
  %bound0 = icmp ult double* %scevgep, %scevgep105
  %bound1 = icmp ult double* %scevgep103, %scevgep101
  %found.conflict = and i1 %bound0, %bound1
  %bound0108 = icmp ult double* %scevgep, %arrayidx15.us27
  %bound1109 = icmp ult double* %arrayidx15.us27, %scevgep101
  %found.conflict110 = and i1 %bound0108, %bound1109
  %conflict.rdx = or i1 %found.conflict, %found.conflict110
  br i1 %conflict.rdx, label %for.body11.us23.preheader, label %vector.ph111

vector.ph111:                                     ; preds = %vector.memcheck
  %.pre = load double, double* %arrayidx15.us27, align 8, !alias.scope !6
  %15 = insertelement <2 x double> undef, double %.pre, i32 0
  %16 = fmul <2 x double> %broadcast.splatinsert120, %15
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body86

vector.body86:                                    ; preds = %vector.body86, %vector.ph111
  %index112 = phi i64 [ 0, %vector.ph111 ], [ %index.next113, %vector.body86 ]
  %18 = or i64 %index112, 1
  %19 = or i64 %index112, 2
  %20 = or i64 %index112, 3
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index112, i64 %indvars.iv57
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %18, i64 %indvars.iv57
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %19, i64 %indvars.iv57
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %20, i64 %indvars.iv57
  %25 = load double, double* %21, align 8, !alias.scope !9
  %26 = load double, double* %22, align 8, !alias.scope !9
  %27 = load double, double* %23, align 8, !alias.scope !9
  %28 = load double, double* %24, align 8, !alias.scope !9
  %29 = insertelement <2 x double> undef, double %25, i32 0
  %30 = insertelement <2 x double> %29, double %26, i32 1
  %31 = insertelement <2 x double> undef, double %27, i32 0
  %32 = insertelement <2 x double> %31, double %28, i32 1
  %33 = fmul <2 x double> %17, %30
  %34 = fmul <2 x double> %17, %32
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv60, i64 %index112
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load122 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !11, !noalias !13
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load123 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !11, !noalias !13
  %39 = fadd <2 x double> %33, %wide.load122
  %40 = fadd <2 x double> %34, %wide.load123
  store <2 x double> %39, <2 x double>* %36, align 8, !alias.scope !11, !noalias !13
  store <2 x double> %40, <2 x double>* %38, align 8, !alias.scope !11, !noalias !13
  %index.next113 = add i64 %index112, 4
  %41 = icmp eq i64 %index.next113, %n.vec94
  br i1 %41, label %middle.block87, label %vector.body86, !llvm.loop !14

middle.block87:                                   ; preds = %vector.body86
  br i1 %cmp.n115, label %for.cond9.for.inc29_crit_edge.us42, label %for.body11.us23.preheader

for.body11.us23.preheader:                        ; preds = %middle.block87, %vector.memcheck, %min.iters.checked92, %for.cond9.preheader.us21
  %indvars.iv51.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked92 ], [ 0, %for.cond9.preheader.us21 ], [ %n.vec94, %middle.block87 ]
  %42 = sub i64 %0, %indvars.iv51.ph
  %xtraiter = and i64 %42, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body11.us23.prol.loopexit.unr-lcssa, label %for.body11.us23.prol.preheader

for.body11.us23.prol.preheader:                   ; preds = %for.body11.us23.preheader
  br label %for.body11.us23.prol

for.body11.us23.prol:                             ; preds = %for.body11.us23.prol.preheader
  %43 = load double, double* %arrayidx15.us27, align 8
  %mul16.us28.prol = fmul double %43, %alpha
  %arrayidx20.us30.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51.ph, i64 %indvars.iv57
  %44 = load double, double* %arrayidx20.us30.prol, align 8
  %mul21.us31.prol = fmul double %mul16.us28.prol, %44
  %arrayidx25.us32.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv60, i64 %indvars.iv51.ph
  %45 = load double, double* %arrayidx25.us32.prol, align 8
  %add.us33.prol = fadd double %mul21.us31.prol, %45
  store double %add.us33.prol, double* %arrayidx25.us32.prol, align 8
  %indvars.iv.next52.prol = or i64 %indvars.iv51.ph, 1
  br label %for.body11.us23.prol.loopexit.unr-lcssa

for.body11.us23.prol.loopexit.unr-lcssa:          ; preds = %for.body11.us23.preheader, %for.body11.us23.prol
  %indvars.iv51.unr.ph = phi i64 [ %indvars.iv.next52.prol, %for.body11.us23.prol ], [ %indvars.iv51.ph, %for.body11.us23.preheader ]
  br label %for.body11.us23.prol.loopexit

for.body11.us23.prol.loopexit:                    ; preds = %for.body11.us23.prol.loopexit.unr-lcssa
  %46 = icmp eq i64 %indvar97, %indvars.iv51.ph
  br i1 %46, label %for.cond9.for.inc29_crit_edge.us42.loopexit, label %for.body11.us23.preheader.new

for.body11.us23.preheader.new:                    ; preds = %for.body11.us23.prol.loopexit
  br label %for.body11.us23

for.body11.us23:                                  ; preds = %for.body11.us23, %for.body11.us23.preheader.new
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr.ph, %for.body11.us23.preheader.new ], [ %indvars.iv.next52.1, %for.body11.us23 ]
  %47 = load double, double* %arrayidx15.us27, align 8
  %mul16.us28 = fmul double %47, %alpha
  %arrayidx20.us30 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv57
  %48 = load double, double* %arrayidx20.us30, align 8
  %mul21.us31 = fmul double %mul16.us28, %48
  %arrayidx25.us32 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv60, i64 %indvars.iv51
  %49 = load double, double* %arrayidx25.us32, align 8
  %add.us33 = fadd double %mul21.us31, %49
  store double %add.us33, double* %arrayidx25.us32, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %50 = load double, double* %arrayidx15.us27, align 8
  %mul16.us28.1 = fmul double %50, %alpha
  %arrayidx20.us30.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next52, i64 %indvars.iv57
  %51 = load double, double* %arrayidx20.us30.1, align 8
  %mul21.us31.1 = fmul double %mul16.us28.1, %51
  %arrayidx25.us32.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv60, i64 %indvars.iv.next52
  %52 = load double, double* %arrayidx25.us32.1, align 8
  %add.us33.1 = fadd double %mul21.us31.1, %52
  store double %add.us33.1, double* %arrayidx25.us32.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next52, %5
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  br i1 %exitcond.1, label %for.cond9.for.inc29_crit_edge.us42.loopexit.unr-lcssa, label %for.body11.us23, !llvm.loop !15

for.cond9.for.inc29_crit_edge.us42.loopexit.unr-lcssa: ; preds = %for.body11.us23
  br label %for.cond9.for.inc29_crit_edge.us42.loopexit

for.cond9.for.inc29_crit_edge.us42.loopexit:      ; preds = %for.body11.us23.prol.loopexit, %for.cond9.for.inc29_crit_edge.us42.loopexit.unr-lcssa
  br label %for.cond9.for.inc29_crit_edge.us42

for.cond9.for.inc29_crit_edge.us42:               ; preds = %for.cond9.for.inc29_crit_edge.us42.loopexit, %middle.block87
  %exitcond77 = icmp eq i64 %14, 1000
  br i1 %exitcond77, label %for.cond6.for.inc32_crit_edge.us.loopexit, label %for.cond9.preheader.us21

for.cond6.for.inc32_crit_edge.us.loopexit:        ; preds = %for.cond9.for.inc29_crit_edge.us42
  br label %for.cond6.for.inc32_crit_edge.us

for.cond6.for.inc32_crit_edge.us:                 ; preds = %for.cond6.for.inc32_crit_edge.us.loopexit, %for.cond1.preheader.us
  %indvars.iv.next61 = add i64 %indvars.iv60, 1
  %cmp.us = icmp slt i64 %indvars.iv.next61, 1200
  %indvars.iv.next76 = add i32 %indvars.iv75, 1
  %indvar.next90 = add i32 %indvar89, 1
  %indvar.next98 = add i64 %indvar97, 1
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.end34.loopexit

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.inc32
  br i1 undef, label %for.inc32, label %for.cond1.preheader.for.body3_crit_edge

for.cond1.preheader.for.body3_crit_edge:          ; preds = %for.cond1.preheader
  br i1 undef, label %for.body3.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond1.preheader.for.body3_crit_edge
  br i1 undef, label %for.body3.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br i1 undef, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.ph, %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  br i1 undef, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  br i1 true, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !16

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 undef, label %for.inc32, label %for.body3.preheader

for.body3.preheader:                              ; preds = %middle.block, %min.iters.checked, %for.cond1.preheader.for.body3_crit_edge
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  br i1 true, label %for.inc32.loopexit, label %for.body3, !llvm.loop !17

for.inc32.loopexit:                               ; preds = %for.body3
  br label %for.inc32

for.inc32:                                        ; preds = %for.inc32.loopexit, %middle.block, %for.cond1.preheader
  br i1 false, label %for.cond1.preheader, label %for.end34.loopexit145

for.end34.loopexit:                               ; preds = %for.cond6.for.inc32_crit_edge.us
  br label %for.end34

for.end34.loopexit145:                            ; preds = %for.inc32
  br label %for.end34

for.end34:                                        ; preds = %for.end34.loopexit145, %for.end34.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1200 x double]* %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %for.cond2.preheader.lr.ph, label %for.end12

for.cond2.preheader.lr.ph:                        ; preds = %entry
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.lr.ph
  %indvars.iv11 = phi i64 [ 0, %for.cond2.preheader.lr.ph ], [ %indvars.iv.next12, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv11, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv11, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %cmp.us = icmp slt i64 %indvars.iv.next12, 1200
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!10, !7}
!14 = distinct !{!14, !2, !3}
!15 = distinct !{!15, !2, !3}
!16 = distinct !{!16, !2, !3}
!17 = distinct !{!17, !5, !2, !3}
