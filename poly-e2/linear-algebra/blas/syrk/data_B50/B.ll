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
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay2)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  %arraydecay3 = bitcast i8* %call to [1200 x double]*
  %arraydecay4 = bitcast i8* %call1 to [1000 x double]*
  call fastcc void @kernel_syrk(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
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
  call fastcc void @print_array(i32 1200, [1200 x double]* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A) unnamed_addr #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp10 = icmp sgt i32 %n, 0
  br i1 %cmp10, label %for.cond1.preheader.lr.ph, label %for.end33

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp29 = icmp sgt i32 %m, 0
  %conv4 = sitofp i32 %n to double
  br i1 %cmp29, label %for.cond1.preheader.us.preheader, label %for.cond14.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %m, -1
  %1 = sext i32 %n to i64
  %wide.trip.count23 = zext i32 %0 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv25 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next26, %for.cond1.for.inc7_crit_edge.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  %2 = mul nuw nsw i64 %indvars.iv19, %indvars.iv25
  %3 = add nuw nsw i64 %2, 1
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, %n
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv19
  store double %div.us, double* %arrayidx6.us, align 8
  %exitcond24 = icmp eq i64 %indvars.iv19, %wide.trip.count23
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  br i1 %exitcond24, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond31 = icmp ne i64 %indvars.iv.next26, %1
  br i1 %exitcond31, label %for.cond1.preheader.us, label %for.cond10.preheader

for.cond10.preheader:                             ; preds = %for.cond1.for.inc7_crit_edge.us
  %cmp115 = icmp sgt i32 %n, 0
  br i1 %cmp115, label %for.cond14.preheader.lr.ph, label %for.end33

for.cond14.preheader.lr.ph:                       ; preds = %for.cond10.preheader, %for.cond1.preheader.lr.ph
  %conv22 = sitofp i32 %m to double
  %5 = add i32 %n, -1
  %6 = sext i32 %n to i64
  %wide.trip.count = zext i32 %5 to i64
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.for.inc31_crit_edge.us, %for.cond14.preheader.lr.ph
  %indvars.iv17 = phi i64 [ 0, %for.cond14.preheader.lr.ph ], [ %indvars.iv.next18, %for.cond14.for.inc31_crit_edge.us ]
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us, %for.cond14.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body17.us ], [ 0, %for.cond14.preheader.us ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv17
  %8 = add nuw nsw i64 %7, 2
  %9 = trunc i64 %8 to i32
  %rem20.us = srem i32 %9, %m
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, %conv22
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv17, i64 %indvars.iv
  store double %div23.us, double* %arrayidx27.us, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond14.for.inc31_crit_edge.us, label %for.body17.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.body17.us
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %cmp11.us = icmp slt i64 %indvars.iv.next18, %6
  br i1 %cmp11.us, label %for.cond14.preheader.us, label %for.end33.loopexit

for.end33.loopexit:                               ; preds = %for.cond14.for.inc31_crit_edge.us
  br label %for.end33

for.end33:                                        ; preds = %for.end33.loopexit, %for.cond10.preheader, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_syrk(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A) unnamed_addr #0 {
entry:
  %alpha.addr = alloca double, align 8
  %A.addr = alloca [1000 x double]*, align 8
  store double %alpha, double* %alpha.addr, align 8
  store [1000 x double]* %A, [1000 x double]** %A.addr, align 8
  %cmp11 = icmp sgt i32 %n, 0
  br i1 %cmp11, label %for.cond1.preheader.lr.ph, label %for.end34

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp77 = icmp sgt i32 %m, 0
  br i1 %cmp77, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %0 = sext i32 %n to i64
  %broadcast.splatinsert69 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat70 = shufflevector <2 x double> %broadcast.splatinsert69, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %1 = sext i32 %m to i64
  %2 = sext i32 %n to i64
  %3 = load double, double* %alpha.addr, align 8
  %4 = load [1000 x double]*, [1000 x double]** %A.addr, align 8
  %broadcast.splatinsert100 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splatinsert123 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat124 = shufflevector <2 x double> %broadcast.splatinsert123, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv
  %5 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %5, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %exitcond = icmp eq i64 %indvars.iv, %indvars.iv57
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond9.preheader.us18.preheader.loopexit, label %for.body3.us, !llvm.loop !1

for.cond9.preheader.us18.preheader.loopexit:      ; preds = %for.body3.us
  br label %for.cond9.preheader.us18.preheader

for.cond9.preheader.us18.preheader:               ; preds = %for.cond9.preheader.us18.preheader.loopexit, %middle.block105
  %min.iters.check74 = icmp ult i64 %57, 4
  %n.vec77 = and i64 %57, -4
  %cmp.zero78 = icmp eq i64 %n.vec77, 0
  %cmp.n95 = icmp eq i64 %57, %n.vec77
  br label %for.cond9.preheader.us18

for.cond9.preheader.us18:                         ; preds = %for.cond9.preheader.us18.preheader, %for.cond9.for.inc29_crit_edge.us36
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.cond9.for.inc29_crit_edge.us36 ], [ 0, %for.cond9.preheader.us18.preheader ]
  %scevgep83 = getelementptr [1000 x double], [1000 x double]* %4, i64 0, i64 %indvars.iv54
  %6 = add nuw nsw i64 %indvars.iv54, 1
  %scevgep85 = getelementptr [1000 x double], [1000 x double]* %4, i64 %indvars.iv57, i64 %6
  %arrayidx15.us35 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv54
  br i1 %min.iters.check74, label %for.body11.us19.preheader, label %min.iters.checked75

min.iters.checked75:                              ; preds = %for.cond9.preheader.us18
  br i1 %cmp.zero78, label %for.body11.us19.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked75
  %bound0 = icmp ult double* %scevgep, %scevgep85
  %bound1 = icmp ult double* %scevgep83, %scevgep81
  %found.conflict = and i1 %bound0, %bound1
  %bound088 = icmp ult double* %scevgep, %arrayidx15.us35
  %bound189 = icmp ult double* %arrayidx15.us35, %scevgep81
  %found.conflict90 = and i1 %bound088, %bound189
  %conflict.rdx = or i1 %found.conflict, %found.conflict90
  br i1 %conflict.rdx, label %for.body11.us19.preheader, label %vector.ph91

vector.ph91:                                      ; preds = %vector.memcheck
  br label %vector.body71

vector.body71:                                    ; preds = %vector.body71, %vector.ph91
  %index92 = phi i64 [ 0, %vector.ph91 ], [ %index.next93, %vector.body71 ]
  %7 = or i64 %index92, 1
  %8 = or i64 %index92, 2
  %9 = or i64 %index92, 3
  %10 = load double, double* %arrayidx15.us35, align 8, !alias.scope !5
  %11 = insertelement <2 x double> undef, double %10, i32 0
  %12 = insertelement <2 x double> undef, double %10, i32 0
  %13 = fmul <2 x double> %broadcast.splatinsert100, %11
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  %15 = fmul <2 x double> %broadcast.splatinsert100, %12
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %index92, i64 %indvars.iv54
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %7, i64 %indvars.iv54
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %8, i64 %indvars.iv54
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %9, i64 %indvars.iv54
  %21 = load double, double* %17, align 8, !alias.scope !8
  %22 = load double, double* %18, align 8, !alias.scope !8
  %23 = load double, double* %19, align 8, !alias.scope !8
  %24 = load double, double* %20, align 8, !alias.scope !8
  %25 = insertelement <2 x double> undef, double %21, i32 0
  %26 = insertelement <2 x double> %25, double %22, i32 1
  %27 = insertelement <2 x double> undef, double %23, i32 0
  %28 = insertelement <2 x double> %27, double %24, i32 1
  %29 = fmul <2 x double> %14, %26
  %30 = fmul <2 x double> %16, %28
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv57, i64 %index92
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load102 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !10, !noalias !12
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !10, !noalias !12
  %35 = fadd <2 x double> %29, %wide.load102
  %36 = fadd <2 x double> %30, %wide.load103
  %37 = bitcast double* %31 to <2 x double>*
  store <2 x double> %35, <2 x double>* %37, align 8, !alias.scope !10, !noalias !12
  %38 = bitcast double* %33 to <2 x double>*
  store <2 x double> %36, <2 x double>* %38, align 8, !alias.scope !10, !noalias !12
  %index.next93 = add i64 %index92, 4
  %39 = icmp eq i64 %index.next93, %n.vec77
  br i1 %39, label %middle.block72, label %vector.body71, !llvm.loop !13

middle.block72:                                   ; preds = %vector.body71
  br i1 %cmp.n95, label %for.cond9.for.inc29_crit_edge.us36, label %for.body11.us19.preheader

for.body11.us19.preheader:                        ; preds = %middle.block72, %vector.memcheck, %min.iters.checked75, %for.cond9.preheader.us18
  %indvars.iv48.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked75 ], [ 0, %for.cond9.preheader.us18 ], [ %n.vec77, %middle.block72 ]
  %40 = sub i64 %51, %indvars.iv48.ph
  %xtraiter126 = and i64 %40, 1
  %lcmp.mod127 = icmp eq i64 %xtraiter126, 0
  br i1 %lcmp.mod127, label %for.body11.us19.prol.loopexit.unr-lcssa, label %for.body11.us19.prol.preheader

for.body11.us19.prol.preheader:                   ; preds = %for.body11.us19.preheader
  br label %for.body11.us19.prol

for.body11.us19.prol:                             ; preds = %for.body11.us19.prol.preheader
  %41 = load double, double* %arrayidx15.us35, align 8
  %mul16.us20.prol = fmul double %3, %41
  %arrayidx20.us22.prol = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv48.ph, i64 %indvars.iv54
  %42 = load double, double* %arrayidx20.us22.prol, align 8
  %mul21.us23.prol = fmul double %mul16.us20.prol, %42
  %arrayidx25.us24.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv48.ph
  %43 = load double, double* %arrayidx25.us24.prol, align 8
  %add.us25.prol = fadd double %mul21.us23.prol, %43
  store double %add.us25.prol, double* %arrayidx25.us24.prol, align 8
  %indvars.iv.next49.prol = or i64 %indvars.iv48.ph, 1
  br label %for.body11.us19.prol.loopexit.unr-lcssa

for.body11.us19.prol.loopexit.unr-lcssa:          ; preds = %for.body11.us19.preheader, %for.body11.us19.prol
  %indvars.iv48.unr.ph = phi i64 [ %indvars.iv.next49.prol, %for.body11.us19.prol ], [ %indvars.iv48.ph, %for.body11.us19.preheader ]
  br label %for.body11.us19.prol.loopexit

for.body11.us19.prol.loopexit:                    ; preds = %for.body11.us19.prol.loopexit.unr-lcssa
  %44 = icmp eq i64 %indvars.iv57, %indvars.iv48.ph
  br i1 %44, label %for.cond9.for.inc29_crit_edge.us36.loopexit, label %for.body11.us19.preheader.new

for.body11.us19.preheader.new:                    ; preds = %for.body11.us19.prol.loopexit
  br label %for.body11.us19

for.body11.us19:                                  ; preds = %for.body11.us19, %for.body11.us19.preheader.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr.ph, %for.body11.us19.preheader.new ], [ %indvars.iv.next49.1, %for.body11.us19 ]
  %45 = load double, double* %arrayidx15.us35, align 8
  %mul16.us20 = fmul double %3, %45
  %arrayidx20.us22 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv48, i64 %indvars.iv54
  %46 = load double, double* %arrayidx20.us22, align 8
  %mul21.us23 = fmul double %mul16.us20, %46
  %arrayidx25.us24 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv48
  %47 = load double, double* %arrayidx25.us24, align 8
  %add.us25 = fadd double %mul21.us23, %47
  store double %add.us25, double* %arrayidx25.us24, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %48 = load double, double* %arrayidx15.us35, align 8
  %mul16.us20.1 = fmul double %3, %48
  %arrayidx20.us22.1 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv.next49, i64 %indvars.iv54
  %49 = load double, double* %arrayidx20.us22.1, align 8
  %mul21.us23.1 = fmul double %mul16.us20.1, %49
  %arrayidx25.us24.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv.next49
  %50 = load double, double* %arrayidx25.us24.1, align 8
  %add.us25.1 = fadd double %mul21.us23.1, %50
  store double %add.us25.1, double* %arrayidx25.us24.1, align 8
  %exitcond53.1 = icmp eq i64 %indvars.iv.next49, %indvars.iv57
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  br i1 %exitcond53.1, label %for.cond9.for.inc29_crit_edge.us36.loopexit.unr-lcssa, label %for.body11.us19, !llvm.loop !14

for.body3.lr.ph.us:                               ; preds = %for.cond6.for.inc32_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv57 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next58, %for.cond6.for.inc32_crit_edge.us ]
  %51 = add nuw nsw i64 %indvars.iv57, 1
  %52 = add nsw i64 %indvars.iv57, -3
  %53 = lshr i64 %52, 2
  %54 = add nuw nsw i64 %indvars.iv57, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv57, i64 0
  %55 = mul nuw nsw i64 %indvars.iv57, 1201
  %56 = add nuw nsw i64 %55, 1
  %scevgep81 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %56
  %57 = add nuw nsw i64 %indvars.iv57, 1
  %min.iters.check107 = icmp ult i64 %54, 4
  br i1 %min.iters.check107, label %for.body3.us.preheader, label %min.iters.checked108

for.body3.us.preheader:                           ; preds = %middle.block105, %min.iters.checked108, %for.body3.lr.ph.us
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked108 ], [ 0, %for.body3.lr.ph.us ], [ %n.vec110, %middle.block105 ]
  br label %for.body3.us

min.iters.checked108:                             ; preds = %for.body3.lr.ph.us
  %n.vec110 = and i64 %54, -4
  %cmp.zero111 = icmp eq i64 %n.vec110, 0
  br i1 %cmp.zero111, label %for.body3.us.preheader, label %vector.ph112

vector.ph112:                                     ; preds = %min.iters.checked108
  %58 = and i64 %53, 1
  %lcmp.mod = icmp eq i64 %58, 0
  br i1 %lcmp.mod, label %vector.body104.prol.preheader, label %vector.body104.prol.loopexit.unr-lcssa

vector.body104.prol.preheader:                    ; preds = %vector.ph112
  br label %vector.body104.prol

vector.body104.prol:                              ; preds = %vector.body104.prol.preheader
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv57, i64 0
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load121.prol = load <2 x double>, <2 x double>* %60, align 8
  %61 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv57, i64 2
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load122.prol = load <2 x double>, <2 x double>* %62, align 8
  %63 = fmul <2 x double> %wide.load121.prol, %broadcast.splat124
  %64 = fmul <2 x double> %wide.load122.prol, %broadcast.splat124
  %65 = bitcast double* %59 to <2 x double>*
  store <2 x double> %63, <2 x double>* %65, align 8
  %66 = bitcast double* %61 to <2 x double>*
  store <2 x double> %64, <2 x double>* %66, align 8
  br label %vector.body104.prol.loopexit.unr-lcssa

vector.body104.prol.loopexit.unr-lcssa:           ; preds = %vector.ph112, %vector.body104.prol
  %index113.unr.ph = phi i64 [ 4, %vector.body104.prol ], [ 0, %vector.ph112 ]
  br label %vector.body104.prol.loopexit

vector.body104.prol.loopexit:                     ; preds = %vector.body104.prol.loopexit.unr-lcssa
  %67 = icmp eq i64 %53, 0
  br i1 %67, label %middle.block105, label %vector.ph112.new

vector.ph112.new:                                 ; preds = %vector.body104.prol.loopexit
  br label %vector.body104

vector.body104:                                   ; preds = %vector.body104, %vector.ph112.new
  %index113 = phi i64 [ %index113.unr.ph, %vector.ph112.new ], [ %index.next114.1, %vector.body104 ]
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv57, i64 %index113
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load121 = load <2 x double>, <2 x double>* %69, align 8
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load122 = load <2 x double>, <2 x double>* %71, align 8
  %72 = fmul <2 x double> %wide.load121, %broadcast.splat124
  %73 = fmul <2 x double> %wide.load122, %broadcast.splat124
  %74 = bitcast double* %68 to <2 x double>*
  store <2 x double> %72, <2 x double>* %74, align 8
  %75 = bitcast double* %70 to <2 x double>*
  store <2 x double> %73, <2 x double>* %75, align 8
  %index.next114 = add i64 %index113, 4
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv57, i64 %index.next114
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load121.1 = load <2 x double>, <2 x double>* %77, align 8
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load122.1 = load <2 x double>, <2 x double>* %79, align 8
  %80 = fmul <2 x double> %wide.load121.1, %broadcast.splat124
  %81 = fmul <2 x double> %wide.load122.1, %broadcast.splat124
  %82 = bitcast double* %76 to <2 x double>*
  store <2 x double> %80, <2 x double>* %82, align 8
  %83 = bitcast double* %78 to <2 x double>*
  store <2 x double> %81, <2 x double>* %83, align 8
  %index.next114.1 = add i64 %index113, 8
  %84 = icmp eq i64 %index.next114.1, %n.vec110
  br i1 %84, label %middle.block105.unr-lcssa, label %vector.body104, !llvm.loop !15

middle.block105.unr-lcssa:                        ; preds = %vector.body104
  br label %middle.block105

middle.block105:                                  ; preds = %vector.body104.prol.loopexit, %middle.block105.unr-lcssa
  %cmp.n116 = icmp eq i64 %54, %n.vec110
  br i1 %cmp.n116, label %for.cond9.preheader.us18.preheader, label %for.body3.us.preheader

for.cond9.for.inc29_crit_edge.us36.loopexit.unr-lcssa: ; preds = %for.body11.us19
  br label %for.cond9.for.inc29_crit_edge.us36.loopexit

for.cond9.for.inc29_crit_edge.us36.loopexit:      ; preds = %for.body11.us19.prol.loopexit, %for.cond9.for.inc29_crit_edge.us36.loopexit.unr-lcssa
  br label %for.cond9.for.inc29_crit_edge.us36

for.cond9.for.inc29_crit_edge.us36:               ; preds = %for.cond9.for.inc29_crit_edge.us36.loopexit, %middle.block72
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond130 = icmp ne i64 %indvars.iv.next55, %1
  br i1 %exitcond130, label %for.cond9.preheader.us18, label %for.cond6.for.inc32_crit_edge.us

for.cond6.for.inc32_crit_edge.us:                 ; preds = %for.cond9.for.inc29_crit_edge.us36
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond131 = icmp ne i64 %indvars.iv.next58, %2
  br i1 %exitcond131, label %for.body3.lr.ph.us, label %for.end34.loopexit

for.body3.lr.ph:                                  ; preds = %for.inc32, %for.cond1.preheader.preheader
  %indvars.iv64 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next65, %for.inc32 ]
  %85 = add nsw i64 %indvars.iv64, -3
  %86 = lshr i64 %85, 2
  %87 = add nuw nsw i64 %indvars.iv64, 1
  %min.iters.check = icmp ult i64 %87, 4
  br i1 %min.iters.check, label %for.body3.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body3.lr.ph
  %n.vec = and i64 %87, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body3.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %88 = and i64 %86, 1
  %lcmp.mod129 = icmp eq i64 %88, 0
  br i1 %lcmp.mod129, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 0
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load.prol = load <2 x double>, <2 x double>* %90, align 8
  %91 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 2
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load68.prol = load <2 x double>, <2 x double>* %92, align 8
  %93 = fmul <2 x double> %wide.load.prol, %broadcast.splat70
  %94 = fmul <2 x double> %wide.load68.prol, %broadcast.splat70
  %95 = bitcast double* %89 to <2 x double>*
  store <2 x double> %93, <2 x double>* %95, align 8
  %96 = bitcast double* %91 to <2 x double>*
  store <2 x double> %94, <2 x double>* %96, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.ph, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.ph ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %97 = icmp eq i64 %86, 0
  br i1 %97, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr.ph, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %index
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %99, align 8
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %101, align 8
  %102 = fmul <2 x double> %wide.load, %broadcast.splat70
  %103 = fmul <2 x double> %wide.load68, %broadcast.splat70
  %104 = bitcast double* %98 to <2 x double>*
  store <2 x double> %102, <2 x double>* %104, align 8
  %105 = bitcast double* %100 to <2 x double>*
  store <2 x double> %103, <2 x double>* %105, align 8
  %index.next = add i64 %index, 4
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %index.next
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %107, align 8
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load68.1 = load <2 x double>, <2 x double>* %109, align 8
  %110 = fmul <2 x double> %wide.load.1, %broadcast.splat70
  %111 = fmul <2 x double> %wide.load68.1, %broadcast.splat70
  %112 = bitcast double* %106 to <2 x double>*
  store <2 x double> %110, <2 x double>* %112, align 8
  %113 = bitcast double* %108 to <2 x double>*
  store <2 x double> %111, <2 x double>* %113, align 8
  %index.next.1 = add i64 %index, 8
  %114 = icmp eq i64 %index.next.1, %n.vec
  br i1 %114, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !16

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %87, %n.vec
  br i1 %cmp.n, label %for.inc32, label %for.body3.preheader

for.body3.preheader:                              ; preds = %middle.block, %min.iters.checked, %for.body3.lr.ph
  %indvars.iv59.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.body3.lr.ph ], [ %n.vec, %middle.block ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %for.body3 ], [ %indvars.iv59.ph, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %indvars.iv59
  %115 = load double, double* %arrayidx5, align 8
  %mul = fmul double %115, %beta
  store double %mul, double* %arrayidx5, align 8
  %exitcond63 = icmp eq i64 %indvars.iv59, %indvars.iv64
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  br i1 %exitcond63, label %for.inc32.loopexit, label %for.body3, !llvm.loop !17

for.inc32.loopexit:                               ; preds = %for.body3
  br label %for.inc32

for.inc32:                                        ; preds = %for.inc32.loopexit, %middle.block
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond132 = icmp ne i64 %indvars.iv.next65, %0
  br i1 %exitcond132, label %for.body3.lr.ph, label %for.end34.loopexit125

for.end34.loopexit:                               ; preds = %for.cond6.for.inc32_crit_edge.us
  br label %for.end34

for.end34.loopexit125:                            ; preds = %for.inc32
  br label %for.end34

for.end34:                                        ; preds = %for.end34.loopexit125, %for.end34.loopexit, %entry
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
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = sext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv8, %4
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %6 = add nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #4
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv8, i64 %indvars.iv
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp ne i64 %indvars.iv.next9, %3
  br i1 %exitcond11, label %for.cond2.preheader.us, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

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
!12 = !{!9, !6}
!13 = distinct !{!13, !3, !4}
!14 = distinct !{!14, !3, !4}
!15 = distinct !{!15, !3, !4}
!16 = distinct !{!16, !3, !4}
!17 = distinct !{!17, !2, !3, !4}
