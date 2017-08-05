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
  %1 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %1)
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

for.cond1.preheader:                              ; preds = %for.end18.for.cond1.preheader_crit_edge, %entry
  %indvars.iv3047 = phi i64 [ 1, %entry ], [ %indvars.iv.next31, %for.end18.for.cond1.preheader_crit_edge ]
  %indvars.iv3246 = phi i64 [ 0, %entry ], [ %indvars.iv.next33, %for.end18.for.cond1.preheader_crit_edge ]
  %0 = mul nuw nsw i64 %indvars.iv3246, 2001
  %1 = add nuw nsw i64 %0, 1
  %2 = mul nsw i64 %indvars.iv3246, -8
  br label %for.body3

for.cond8.preheader:                              ; preds = %for.body3
  %scevgep = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %1
  %3 = add nsw i64 %2, 15992
  %exitcond2944 = icmp eq i64 %indvars.iv3246, 1999
  br i1 %exitcond2944, label %for.end18.thread, label %for.end18

for.end18.thread:                                 ; preds = %for.cond8.preheader
  %arrayidx2250 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 1999, i64 1999
  store double 1.000000e+00, double* %arrayidx2250, align 8
  br label %for.end25

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv1942 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next20, %for.body3 ]
  %4 = sub nsw i64 0, %indvars.iv1942
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3246, i64 %indvars.iv1942
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1942, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next20, %indvars.iv3047
  br i1 %exitcond24, label %for.cond8.preheader, label %for.body3

for.end18:                                        ; preds = %for.cond8.preheader
  %6 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 %3, i32 8, i1 false)
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3246, i64 %indvars.iv3246
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv3246, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next33, 2000
  br i1 %exitcond34, label %for.end25.loopexit, label %for.end18.for.cond1.preheader_crit_edge

for.end18.for.cond1.preheader_crit_edge:          ; preds = %for.end18
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv3047, 1
  br label %for.cond1.preheader

for.end25.loopexit:                               ; preds = %for.end18
  br label %for.end25

for.end25:                                        ; preds = %for.end25.loopexit, %for.end18.thread
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 32000000, i32 8, i1 false)
  %7 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond48.preheader

for.cond48.preheader:                             ; preds = %for.end74, %for.end25
  %indvars.iv1039 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next11, %for.end74 ]
  br label %for.cond52.preheader

for.cond52.preheader:                             ; preds = %for.end71, %for.cond48.preheader
  %indvars.iv738 = phi i64 [ 0, %for.cond48.preheader ], [ %indvars.iv.next8, %for.end71 ]
  %arrayidx59 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv738, i64 %indvars.iv1039
  br label %for.body55

for.body55:                                       ; preds = %for.body55, %for.cond52.preheader
  %indvars.iv437 = phi i64 [ 0, %for.cond52.preheader ], [ %indvars.iv.next5.1, %for.body55 ]
  %8 = load double, double* %arrayidx59, align 8
  %arrayidx63 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv437, i64 %indvars.iv1039
  %9 = load double, double* %arrayidx63, align 8
  %mul = fmul double %8, %9
  %arrayidx67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv738, i64 %indvars.iv437
  %10 = load double, double* %arrayidx67, align 8
  %add68 = fadd double %10, %mul
  store double %add68, double* %arrayidx67, align 8
  %indvars.iv.next5 = or i64 %indvars.iv437, 1
  %11 = load double, double* %arrayidx59, align 8
  %arrayidx63.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next5, i64 %indvars.iv1039
  %12 = load double, double* %arrayidx63.1, align 8
  %mul.1 = fmul double %11, %12
  %arrayidx67.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv738, i64 %indvars.iv.next5
  %13 = load double, double* %arrayidx67.1, align 8
  %add68.1 = fadd double %13, %mul.1
  store double %add68.1, double* %arrayidx67.1, align 8
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv437, 2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next5.1, 2000
  br i1 %exitcond6.1, label %for.end71, label %for.body55

for.end71:                                        ; preds = %for.body55
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv738, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond9, label %for.end74, label %for.cond52.preheader

for.end74:                                        ; preds = %for.end71
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1039, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %for.cond82.preheader.preheader, label %for.cond48.preheader

for.cond82.preheader.preheader:                   ; preds = %for.end74
  %14 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond82.preheader

for.cond82.preheader:                             ; preds = %for.end96, %for.cond82.preheader.preheader
  %indvars.iv136 = phi i64 [ 0, %for.cond82.preheader.preheader ], [ %indvars.iv.next2, %for.end96 ]
  br label %for.body85

for.body85:                                       ; preds = %for.body85, %for.cond82.preheader
  %indvars.iv35 = phi i64 [ 0, %for.cond82.preheader ], [ %indvars.iv.next.4, %for.body85 ]
  %arrayidx89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvars.iv136, i64 %indvars.iv35
  %15 = bitcast double* %arrayidx89 to i64*
  %16 = load i64, i64* %15, align 8
  %arrayidx93 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv35
  %17 = bitcast double* %arrayidx93 to i64*
  store i64 %16, i64* %17, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv35, 1
  %arrayidx89.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvars.iv136, i64 %indvars.iv.next
  %18 = bitcast double* %arrayidx89.1 to i64*
  %19 = load i64, i64* %18, align 8
  %arrayidx93.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv.next
  %20 = bitcast double* %arrayidx93.1 to i64*
  store i64 %19, i64* %20, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv35, 2
  %arrayidx89.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvars.iv136, i64 %indvars.iv.next.1
  %21 = bitcast double* %arrayidx89.2 to i64*
  %22 = load i64, i64* %21, align 8
  %arrayidx93.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv.next.1
  %23 = bitcast double* %arrayidx93.2 to i64*
  store i64 %22, i64* %23, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv35, 3
  %arrayidx89.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvars.iv136, i64 %indvars.iv.next.2
  %24 = bitcast double* %arrayidx89.3 to i64*
  %25 = load i64, i64* %24, align 8
  %arrayidx93.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv.next.2
  %26 = bitcast double* %arrayidx93.3 to i64*
  store i64 %25, i64* %26, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv35, 4
  %arrayidx89.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvars.iv136, i64 %indvars.iv.next.3
  %27 = bitcast double* %arrayidx89.4 to i64*
  %28 = load i64, i64* %27, align 8
  %arrayidx93.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv.next.3
  %29 = bitcast double* %arrayidx93.4 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv35, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.end96, label %for.body85

for.end96:                                        ; preds = %for.body85
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv136, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %for.end99, label %for.cond82.preheader

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
  %indvars.iv1931 = phi i64 [ 0, %entry ], [ %indvars.iv1931.be, %for.cond1.preheader.backedge ]
  %exitcond824 = icmp eq i64 %indvars.iv1931, 0
  br i1 %exitcond824, label %for.cond1.preheader.backedge, label %for.cond4.preheader.preheader

for.cond1.preheader.backedge:                     ; preds = %for.cond1.preheader, %for.end53
  %indvars.iv1931.be = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next20, %for.end53 ]
  br label %for.cond1.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx24.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1931, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.us.preheader:                ; preds = %for.end
  %xtraiter39 = and i64 %indvars.iv1931, 1
  %0 = icmp eq i64 %xtraiter39, 0
  %1 = icmp eq i64 %indvars.iv1931, 1
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.end50_crit_edge.us, %for.cond31.preheader.us.preheader
  %indvars.iv1629.us = phi i64 [ %indvars.iv1931, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next17.us, %for.cond31.for.end50_crit_edge.us ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1931, i64 %indvars.iv1629.us
  %.pre35 = load double, double* %arrayidx46.us, align 8
  br i1 %0, label %for.body33.us.prol.loopexit, label %for.body33.us.prol

for.body33.us.prol:                               ; preds = %for.cond31.preheader.us
  %2 = load double, double* %arrayidx24.phi.trans.insert, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv1629.us
  %3 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %2, %3
  %sub47.us.prol = fsub double %.pre35, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.body33.us.prol.loopexit

for.body33.us.prol.loopexit:                      ; preds = %for.cond31.preheader.us, %for.body33.us.prol
  %.unr41.ph = phi double [ %sub47.us.prol, %for.body33.us.prol ], [ %.pre35, %for.cond31.preheader.us ]
  %indvars.iv927.us.unr.ph = phi i64 [ 1, %for.body33.us.prol ], [ 0, %for.cond31.preheader.us ]
  br i1 %1, label %for.cond31.for.end50_crit_edge.us, label %for.body33.us.preheader

for.body33.us.preheader:                          ; preds = %for.body33.us.prol.loopexit
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us, %for.body33.us.preheader
  %4 = phi double [ %.unr41.ph, %for.body33.us.preheader ], [ %sub47.us.1, %for.body33.us ]
  %indvars.iv927.us = phi i64 [ %indvars.iv927.us.unr.ph, %for.body33.us.preheader ], [ %indvars.iv.next10.us.1, %for.body33.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1931, i64 %indvars.iv927.us
  %5 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv927.us, i64 %indvars.iv1629.us
  %6 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %5, %6
  %sub47.us = fsub double %4, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv927.us, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1931, i64 %indvars.iv.next10.us
  %7 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next10.us, i64 %indvars.iv1629.us
  %8 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %7, %8
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next10.us.1 = add nsw i64 %indvars.iv927.us, 2
  %exitcond13.us.1 = icmp eq i64 %indvars.iv.next10.us.1, %indvars.iv1931
  br i1 %exitcond13.us.1, label %for.cond31.for.end50_crit_edge.us.loopexit, label %for.body33.us

for.cond31.for.end50_crit_edge.us.loopexit:       ; preds = %for.body33.us
  br label %for.cond31.for.end50_crit_edge.us

for.cond31.for.end50_crit_edge.us:                ; preds = %for.cond31.for.end50_crit_edge.us.loopexit, %for.body33.us.prol.loopexit
  %indvars.iv.next17.us = add nuw nsw i64 %indvars.iv1629.us, 1
  %exitcond18.us = icmp eq i64 %indvars.iv.next17.us, 2000
  br i1 %exitcond18.us, label %for.end53, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.end, %for.cond4.preheader.preheader
  %indvars.iv325 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next4, %for.end ]
  %exitcond22 = icmp eq i64 %indvars.iv325, 0
  br i1 %exitcond22, label %for.cond4.preheader.for.end_crit_edge, label %for.body6.lr.ph

for.cond4.preheader.for.end_crit_edge:            ; preds = %for.cond4.preheader
  %.pre34 = load double, double* %arrayidx24.phi.trans.insert, align 8
  br label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1931, i64 %indvars.iv325
  %.pre = load double, double* %arrayidx16, align 8
  %xtraiter = and i64 %indvars.iv325, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit, label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.lr.ph
  %9 = load double, double* %arrayidx24.phi.trans.insert, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv325
  %10 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %9, %10
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.lr.ph, %for.body6.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ undef, %for.body6.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ %.pre, %for.body6.lr.ph ]
  %indvars.iv23.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.lr.ph ]
  %11 = icmp eq i64 %indvars.iv325, 1
  br i1 %11, label %for.end, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.preheader
  %12 = phi double [ %.unr.ph, %for.body6.preheader ], [ %sub.1, %for.body6 ]
  %indvars.iv23 = phi i64 [ %indvars.iv23.unr.ph, %for.body6.preheader ], [ %indvars.iv.next.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1931, i64 %indvars.iv23
  %13 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv325
  %14 = load double, double* %arrayidx12, align 8
  %mul = fmul double %13, %14
  %sub = fsub double %12, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv23, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1931, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv325
  %16 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %15, %16
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv23, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv325
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body6.prol.loopexit, %for.cond4.preheader.for.end_crit_edge
  %arrayidx24.pre-phi = phi double* [ %arrayidx24.phi.trans.insert, %for.cond4.preheader.for.end_crit_edge ], [ %arrayidx16, %for.body6.prol.loopexit ], [ %arrayidx16, %for.end.loopexit ]
  %17 = phi double [ %.pre34, %for.cond4.preheader.for.end_crit_edge ], [ %sub.lcssa.unr.ph, %for.body6.prol.loopexit ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv325, i64 %indvars.iv325
  %18 = load double, double* %arrayidx20, align 8
  %div = fdiv double %17, %18
  store double %div, double* %arrayidx24.pre-phi, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv325, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next4, %indvars.iv1931
  br i1 %exitcond8, label %for.cond31.preheader.us.preheader, label %for.cond4.preheader

for.end53:                                        ; preds = %for.cond31.for.end50_crit_edge.us
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1931, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 2000
  br i1 %exitcond21, label %for.end56, label %for.cond1.preheader.backedge

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.end, %entry
  %indvars.iv27 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.end ]
  %3 = mul nuw nsw i64 %indvars.iv27, 2000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv6, %3
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
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv6
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body4

for.end:                                          ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond5, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.end
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
