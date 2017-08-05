; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu([2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array([2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture %A) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end18, %entry
  %indvars.iv3420 = phi i64 [ 0, %entry ], [ %indvars.iv.next35, %for.end18 ]
  %indvars.iv419 = phi i64 [ 1, %entry ], [ %indvars.iv.next5, %for.end18 ]
  %0 = mul nuw nsw i64 %indvars.iv3420, 2001
  %1 = add nuw nsw i64 %0, 1
  %scevgep23 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %1
  %2 = mul nsw i64 %indvars.iv3420, -8
  %3 = add nsw i64 %2, 15992
  br label %for.body3

for.cond8.preheader:                              ; preds = %for.body3
  %exitcond3117 = icmp eq i64 %indvars.iv419, 2000
  br i1 %exitcond3117, label %for.end18, label %for.body11.preheader

for.body11.preheader:                             ; preds = %for.cond8.preheader
  %4 = bitcast double* %scevgep23 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %4, i8 0, i64 %3, i32 8, i1 false)
  br label %for.end18

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv1916 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next20, %for.body3 ]
  %5 = sub nsw i64 0, %indvars.iv1916
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3420, i64 %indvars.iv1916
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1916, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next20, %indvars.iv419
  br i1 %exitcond25, label %for.cond8.preheader, label %for.body3

for.end18:                                        ; preds = %for.cond8.preheader, %for.body11.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3420, i64 %indvars.iv3420
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv3420, 1
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv419, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next35, 2000
  br i1 %exitcond7, label %for.end25, label %for.cond1.preheader

for.end25:                                        ; preds = %for.end18
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 32000000, i32 8, i1 false)
  %7 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond48.preheader

for.cond48.preheader:                             ; preds = %for.end74, %for.end25
  %indvars.iv1113 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next12, %for.end74 ]
  br label %for.cond52.preheader

for.cond52.preheader:                             ; preds = %for.end71, %for.cond48.preheader
  %indvars.iv712 = phi i64 [ 0, %for.cond48.preheader ], [ %indvars.iv.next8, %for.end71 ]
  %arrayidx59 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv712, i64 %indvars.iv1113
  br label %for.body55

for.body55:                                       ; preds = %for.body55, %for.cond52.preheader
  %indvars.iv311 = phi i64 [ 0, %for.cond52.preheader ], [ %indvars.iv.next4.1, %for.body55 ]
  %8 = load double, double* %arrayidx59, align 8
  %arrayidx63 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv311, i64 %indvars.iv1113
  %9 = load double, double* %arrayidx63, align 8
  %mul = fmul double %8, %9
  %arrayidx67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv712, i64 %indvars.iv311
  %10 = load double, double* %arrayidx67, align 8
  %add68 = fadd double %10, %mul
  store double %add68, double* %arrayidx67, align 8
  %indvars.iv.next4 = or i64 %indvars.iv311, 1
  %11 = load double, double* %arrayidx59, align 8
  %arrayidx63.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next4, i64 %indvars.iv1113
  %12 = load double, double* %arrayidx63.1, align 8
  %mul.1 = fmul double %11, %12
  %arrayidx67.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv712, i64 %indvars.iv.next4
  %13 = load double, double* %arrayidx67.1, align 8
  %add68.1 = fadd double %13, %mul.1
  store double %add68.1, double* %arrayidx67.1, align 8
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv311, 2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next4.1, 2000
  br i1 %exitcond6.1, label %for.end71, label %for.body55

for.end71:                                        ; preds = %for.body55
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv712, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond10, label %for.end74, label %for.cond52.preheader

for.end74:                                        ; preds = %for.end71
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1113, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond2, label %for.cond82.preheader.preheader, label %for.cond48.preheader

for.cond82.preheader.preheader:                   ; preds = %for.end74
  br label %for.cond82.preheader

for.cond82.preheader:                             ; preds = %for.cond82.preheader.preheader, %for.end96
  %indvars.iv110 = phi i64 [ %indvars.iv.next2, %for.end96 ], [ 0, %for.cond82.preheader.preheader ]
  br label %for.body85

for.body85:                                       ; preds = %for.body85, %for.cond82.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond82.preheader ], [ %indvars.iv.next.4, %for.body85 ]
  %arrayidx89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv110, i64 %indvars.iv8
  %14 = bitcast double* %arrayidx89 to i64*
  %15 = load i64, i64* %14, align 8
  %arrayidx93 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110, i64 %indvars.iv8
  %16 = bitcast double* %arrayidx93 to i64*
  store i64 %15, i64* %16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv8, 1
  %arrayidx89.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv110, i64 %indvars.iv.next
  %17 = bitcast double* %arrayidx89.1 to i64*
  %18 = load i64, i64* %17, align 8
  %arrayidx93.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110, i64 %indvars.iv.next
  %19 = bitcast double* %arrayidx93.1 to i64*
  store i64 %18, i64* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv8, 2
  %arrayidx89.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv110, i64 %indvars.iv.next.1
  %20 = bitcast double* %arrayidx89.2 to i64*
  %21 = load i64, i64* %20, align 8
  %arrayidx93.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110, i64 %indvars.iv.next.1
  %22 = bitcast double* %arrayidx93.2 to i64*
  store i64 %21, i64* %22, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv8, 3
  %arrayidx89.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv110, i64 %indvars.iv.next.2
  %23 = bitcast double* %arrayidx89.3 to i64*
  %24 = load i64, i64* %23, align 8
  %arrayidx93.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110, i64 %indvars.iv.next.2
  %25 = bitcast double* %arrayidx93.3 to i64*
  store i64 %24, i64* %25, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv8, 4
  %arrayidx89.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv110, i64 %indvars.iv.next.3
  %26 = bitcast double* %arrayidx89.4 to i64*
  %27 = load i64, i64* %26, align 8
  %arrayidx93.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110, i64 %indvars.iv.next.3
  %28 = bitcast double* %arrayidx93.4 to i64*
  store i64 %27, i64* %28, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv8, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.end96, label %for.body85

for.end96:                                        ; preds = %for.body85
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond1, label %for.end99, label %for.cond82.preheader

for.end99:                                        ; preds = %for.end96
  tail call void @free(i8* nonnull %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.backedge, %entry
  %indvars.iv2012 = phi i64 [ 0, %entry ], [ %indvars.iv2012.be, %for.cond1.preheader.backedge ]
  %exitcond85 = icmp eq i64 %indvars.iv2012, 0
  br i1 %exitcond85, label %for.cond1.preheader.backedge, label %for.cond4.preheader.preheader

for.cond1.preheader.backedge:                     ; preds = %for.cond1.preheader, %for.end53
  %indvars.iv2012.be = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next21, %for.end53 ]
  br label %for.cond1.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx24.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2012, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.preheader:                   ; preds = %for.end
  %xtraiter18 = and i64 %indvars.iv2012, 1
  %0 = icmp eq i64 %xtraiter18, 0
  %1 = icmp eq i64 %indvars.iv2012, 1
  br label %for.cond31.preheader

for.cond4.preheader:                              ; preds = %for.end, %for.cond4.preheader.preheader
  %indvars.iv36 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next4, %for.end ]
  %exitcond2 = icmp eq i64 %indvars.iv36, 0
  br i1 %exitcond2, label %for.cond4.preheader.for.end_crit_edge, label %for.body6.lr.ph

for.cond4.preheader.for.end_crit_edge:            ; preds = %for.cond4.preheader
  %.pre15 = load double, double* %arrayidx24.phi.trans.insert, align 8
  br label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2012, i64 %indvars.iv36
  %.pre = load double, double* %arrayidx16, align 8
  %xtraiter = and i64 %indvars.iv36, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit.unr-lcssa, label %for.body6.prol.preheader

for.body6.prol.preheader:                         ; preds = %for.body6.lr.ph
  %2 = load double, double* %arrayidx24.phi.trans.insert, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv36
  %3 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %2, %3
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.lr.ph, %for.body6.prol.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body6.prol.preheader ], [ undef, %for.body6.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol.preheader ], [ %.pre, %for.body6.lr.ph ]
  %indvars.iv4.unr.ph = phi i64 [ 1, %for.body6.prol.preheader ], [ 0, %for.body6.lr.ph ]
  %4 = icmp eq i64 %indvars.iv36, 1
  br i1 %4, label %for.end, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.body6.prol.loopexit.unr-lcssa
  br label %for.body6

for.body6:                                        ; preds = %for.body6.preheader, %for.body6
  %5 = phi double [ %sub.1, %for.body6 ], [ %.unr.ph, %for.body6.preheader ]
  %indvars.iv4 = phi i64 [ %indvars.iv.next.1, %for.body6 ], [ %indvars.iv4.unr.ph, %for.body6.preheader ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2012, i64 %indvars.iv4
  %6 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv4, i64 %indvars.iv36
  %7 = load double, double* %arrayidx12, align 8
  %mul = fmul double %6, %7
  %sub = fsub double %5, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2012, i64 %indvars.iv.next
  %8 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv36
  %9 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %8, %9
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv4, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv36
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body6.prol.loopexit.unr-lcssa, %for.cond4.preheader.for.end_crit_edge
  %arrayidx24.pre-phi = phi double* [ %arrayidx24.phi.trans.insert, %for.cond4.preheader.for.end_crit_edge ], [ %arrayidx16, %for.body6.prol.loopexit.unr-lcssa ], [ %arrayidx16, %for.end.loopexit ]
  %10 = phi double [ %.pre15, %for.cond4.preheader.for.end_crit_edge ], [ %sub.lcssa.unr.ph, %for.body6.prol.loopexit.unr-lcssa ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv36
  %11 = load double, double* %arrayidx20, align 8
  %div = fdiv double %10, %11
  store double %div, double* %arrayidx24.pre-phi, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next4, %indvars.iv2012
  br i1 %exitcond8, label %for.cond31.preheader.preheader, label %for.cond4.preheader

for.cond31.preheader:                             ; preds = %for.end50, %for.cond31.preheader.preheader
  %indvars.iv1610 = phi i64 [ %indvars.iv2012, %for.cond31.preheader.preheader ], [ %indvars.iv.next17, %for.end50 ]
  %arrayidx46 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2012, i64 %indvars.iv1610
  %.pre16 = load double, double* %arrayidx46, align 8
  br i1 %0, label %for.body33.prol.loopexit.unr-lcssa, label %for.body33.prol.preheader

for.body33.prol.preheader:                        ; preds = %for.cond31.preheader
  %12 = load double, double* %arrayidx24.phi.trans.insert, align 8
  %arrayidx41.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv1610
  %13 = load double, double* %arrayidx41.prol, align 8
  %mul42.prol = fmul double %12, %13
  %sub47.prol = fsub double %.pre16, %mul42.prol
  store double %sub47.prol, double* %arrayidx46, align 8
  br label %for.body33.prol.loopexit.unr-lcssa

for.body33.prol.loopexit.unr-lcssa:               ; preds = %for.cond31.preheader, %for.body33.prol.preheader
  %.unr20.ph = phi double [ %sub47.prol, %for.body33.prol.preheader ], [ %.pre16, %for.cond31.preheader ]
  %indvars.iv98.unr.ph = phi i64 [ 1, %for.body33.prol.preheader ], [ 0, %for.cond31.preheader ]
  br i1 %1, label %for.end50, label %for.body33.preheader

for.body33.preheader:                             ; preds = %for.body33.prol.loopexit.unr-lcssa
  br label %for.body33

for.body33:                                       ; preds = %for.body33.preheader, %for.body33
  %14 = phi double [ %sub47.1, %for.body33 ], [ %.unr20.ph, %for.body33.preheader ]
  %indvars.iv98 = phi i64 [ %indvars.iv.next10.1, %for.body33 ], [ %indvars.iv98.unr.ph, %for.body33.preheader ]
  %arrayidx37 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2012, i64 %indvars.iv98
  %15 = load double, double* %arrayidx37, align 8
  %arrayidx41 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv98, i64 %indvars.iv1610
  %16 = load double, double* %arrayidx41, align 8
  %mul42 = fmul double %15, %16
  %sub47 = fsub double %14, %mul42
  store double %sub47, double* %arrayidx46, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv98, 1
  %arrayidx37.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2012, i64 %indvars.iv.next10
  %17 = load double, double* %arrayidx37.1, align 8
  %arrayidx41.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next10, i64 %indvars.iv1610
  %18 = load double, double* %arrayidx41.1, align 8
  %mul42.1 = fmul double %17, %18
  %sub47.1 = fsub double %sub47, %mul42.1
  store double %sub47.1, double* %arrayidx46, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv98, 2
  %exitcond13.1 = icmp eq i64 %indvars.iv.next10.1, %indvars.iv2012
  br i1 %exitcond13.1, label %for.end50.loopexit, label %for.body33

for.end50.loopexit:                               ; preds = %for.body33
  br label %for.end50

for.end50:                                        ; preds = %for.end50.loopexit, %for.body33.prol.loopexit.unr-lcssa
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1610, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond19, label %for.end53, label %for.cond31.preheader

for.end53:                                        ; preds = %for.end50
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv2012, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next21, 2000
  br i1 %exitcond1, label %for.end56, label %for.cond1.preheader.backedge

for.end56:                                        ; preds = %for.end53
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.end, %entry
  %indvars.iv24 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.end ]
  %3 = mul nuw nsw i64 %indvars.iv24, 2000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv3 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv3, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv3
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body4

for.end:                                          ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond1, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.end
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
