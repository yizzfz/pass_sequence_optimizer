; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %call5 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %call6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %0 = bitcast i8* %call1 to [1000 x double]*
  %1 = bitcast i8* %call2 to [900 x double]*
  %2 = bitcast i8* %call4 to [1200 x double]*
  %3 = bitcast i8* %call5 to [1100 x double]*
  tail call fastcc void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %0, [900 x double]* %1, [1200 x double]* %2, [1100 x double]* %3)
  tail call void (...) @polybench_timer_start() #4
  %4 = bitcast i8* %call to [900 x double]*
  %5 = bitcast i8* %call3 to [1100 x double]*
  %6 = bitcast i8* %call6 to [1100 x double]*
  tail call fastcc void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %4, [1000 x double]* %0, [900 x double]* %1, [1100 x double]* %5, [1200 x double]* %2, [1100 x double]* %3, [1100 x double]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %7 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %7, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %6)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  tail call void @free(i8* %call5) #4
  tail call void @free(i8* %call6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [1000 x double]* %A, [900 x double]* %B, [1200 x double]* %C, [1100 x double]* %D) unnamed_addr #2 {
entry:
  %cmp34 = icmp sgt i32 %ni, 0
  br i1 %cmp34, label %for.body.lr.ph, label %for.end10

for.body.lr.ph:                                   ; preds = %entry
  %0 = zext i32 %nk to i64
  %cmp230 = icmp sgt i32 %nk, 0
  %1 = sext i32 %ni to i64
  %mul4 = mul nsw i32 %ni, 5
  %conv5 = sitofp i32 %mul4 to double
  br i1 %cmp230, label %for.body.us.preheader, label %for.end10

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond1.for.inc8_crit_edge.us
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %for.cond1.for.inc8_crit_edge.us ], [ 0, %for.body.us.preheader ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.body.us
  %indvars.iv67 = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next68, %for.inc.us ]
  %2 = mul nsw i64 %indvars.iv73, %indvars.iv67
  %3 = add nsw i64 %2, 1
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, %ni
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv5
  %arrayidx7.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv73, i64 %indvars.iv67
  store double %div.us, double* %arrayidx7.us, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond = icmp eq i64 %indvars.iv.next68, %0
  br i1 %exitcond, label %for.cond1.for.inc8_crit_edge.us, label %for.inc.us

for.cond1.for.inc8_crit_edge.us:                  ; preds = %for.inc.us
  %indvars.iv.next74 = add nsw i64 %indvars.iv73, 1
  %cmp.us = icmp slt i64 %indvars.iv.next74, %1
  br i1 %cmp.us, label %for.body.us, label %for.end10.loopexit

for.end10.loopexit:                               ; preds = %for.cond1.for.inc8_crit_edge.us
  br label %for.end10

for.end10:                                        ; preds = %for.end10.loopexit, %for.body.lr.ph, %entry
  %cmp1226 = icmp sgt i32 %nk, 0
  br i1 %cmp1226, label %for.body14.lr.ph, label %for.end36

for.body14.lr.ph:                                 ; preds = %for.end10
  %5 = zext i32 %nj to i64
  %cmp1623 = icmp sgt i32 %nj, 0
  %6 = sext i32 %nk to i64
  %mul24 = mul nsw i32 %nj, 5
  %conv25 = sitofp i32 %mul24 to double
  br i1 %cmp1623, label %for.body14.us.preheader, label %for.end36

for.body14.us.preheader:                          ; preds = %for.body14.lr.ph
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.body14.us.preheader, %for.cond15.for.inc34_crit_edge.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.cond15.for.inc34_crit_edge.us ], [ 0, %for.body14.us.preheader ]
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us, %for.body14.us
  %indvars.iv59 = phi i64 [ 0, %for.body14.us ], [ %indvars.iv.next60, %for.inc31.us ]
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %7 = mul nsw i64 %indvars.iv63, %indvars.iv.next60
  %8 = add nsw i64 %7, 2
  %9 = trunc i64 %8 to i32
  %rem22.us = srem i32 %9, %nj
  %conv23.us = sitofp i32 %rem22.us to double
  %div26.us = fdiv double %conv23.us, %conv25
  %arrayidx30.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv63, i64 %indvars.iv59
  store double %div26.us, double* %arrayidx30.us, align 8
  %exitcond79 = icmp eq i64 %indvars.iv.next60, %5
  br i1 %exitcond79, label %for.cond15.for.inc34_crit_edge.us, label %for.inc31.us

for.cond15.for.inc34_crit_edge.us:                ; preds = %for.inc31.us
  %indvars.iv.next64 = add nsw i64 %indvars.iv63, 1
  %cmp12.us = icmp slt i64 %indvars.iv.next64, %6
  br i1 %cmp12.us, label %for.body14.us, label %for.end36.loopexit

for.end36.loopexit:                               ; preds = %for.cond15.for.inc34_crit_edge.us
  br label %for.end36

for.end36:                                        ; preds = %for.end36.loopexit, %for.body14.lr.ph, %for.end10
  %cmp3819 = icmp sgt i32 %nj, 0
  br i1 %cmp3819, label %for.body40.lr.ph, label %for.end61

for.body40.lr.ph:                                 ; preds = %for.end36
  %cmp4216 = icmp sgt i32 %nm, 0
  %10 = sext i32 %nj to i64
  %mul49 = mul nsw i32 %nl, 5
  %conv50 = sitofp i32 %mul49 to double
  br i1 %cmp4216, label %for.body40.us.preheader, label %for.end61

for.body40.us.preheader:                          ; preds = %for.body40.lr.ph
  %11 = sext i32 %nm to i64
  br label %for.body40.us

for.body40.us:                                    ; preds = %for.body40.us.preheader, %for.cond41.for.inc59_crit_edge.us
  %indvars.iv55 = phi i64 [ 0, %for.body40.us.preheader ], [ %indvars.iv.next56, %for.cond41.for.inc59_crit_edge.us ]
  br label %for.inc56.us

for.inc56.us:                                     ; preds = %for.body40.us, %for.inc56.us
  %indvars.iv51 = phi i64 [ 0, %for.body40.us ], [ %indvars.iv.next52, %for.inc56.us ]
  %12 = add nuw nsw i64 %indvars.iv51, 3
  %13 = mul nsw i64 %indvars.iv55, %12
  %14 = trunc i64 %13 to i32
  %rem47.us = srem i32 %14, %nl
  %conv48.us = sitofp i32 %rem47.us to double
  %div51.us = fdiv double %conv48.us, %conv50
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv51
  store double %div51.us, double* %arrayidx55.us, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %cmp42.us = icmp slt i64 %indvars.iv.next52, %11
  br i1 %cmp42.us, label %for.inc56.us, label %for.cond41.for.inc59_crit_edge.us

for.cond41.for.inc59_crit_edge.us:                ; preds = %for.inc56.us
  %indvars.iv.next56 = add nsw i64 %indvars.iv55, 1
  %cmp38.us = icmp slt i64 %indvars.iv.next56, %10
  br i1 %cmp38.us, label %for.body40.us, label %for.end61.loopexit

for.end61.loopexit:                               ; preds = %for.cond41.for.inc59_crit_edge.us
  br label %for.end61

for.end61:                                        ; preds = %for.end61.loopexit, %for.body40.lr.ph, %for.end36
  %cmp6313 = icmp sgt i32 %nm, 0
  br i1 %cmp6313, label %for.body65.lr.ph, label %for.end87

for.body65.lr.ph:                                 ; preds = %for.end61
  %cmp6711 = icmp sgt i32 %nl, 0
  %15 = sext i32 %nm to i64
  %mul75 = mul nsw i32 %nk, 5
  %conv76 = sitofp i32 %mul75 to double
  br i1 %cmp6711, label %for.body65.us.preheader, label %for.end87

for.body65.us.preheader:                          ; preds = %for.body65.lr.ph
  %16 = sext i32 %nl to i64
  br label %for.body65.us

for.body65.us:                                    ; preds = %for.body65.us.preheader, %for.cond66.for.inc85_crit_edge.us
  %indvars.iv49 = phi i64 [ 0, %for.body65.us.preheader ], [ %indvars.iv.next50, %for.cond66.for.inc85_crit_edge.us ]
  br label %for.inc82.us

for.inc82.us:                                     ; preds = %for.body65.us, %for.inc82.us
  %indvars.iv = phi i64 [ 0, %for.body65.us ], [ %indvars.iv.next, %for.inc82.us ]
  %17 = add nuw nsw i64 %indvars.iv, 2
  %18 = mul nsw i64 %indvars.iv49, %17
  %19 = add nsw i64 %18, 2
  %20 = trunc i64 %19 to i32
  %rem73.us = srem i32 %20, %nk
  %conv74.us = sitofp i32 %rem73.us to double
  %div77.us = fdiv double %conv74.us, %conv76
  %arrayidx81.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv49, i64 %indvars.iv
  store double %div77.us, double* %arrayidx81.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp67.us = icmp slt i64 %indvars.iv.next, %16
  br i1 %cmp67.us, label %for.inc82.us, label %for.cond66.for.inc85_crit_edge.us

for.cond66.for.inc85_crit_edge.us:                ; preds = %for.inc82.us
  %indvars.iv.next50 = add nsw i64 %indvars.iv49, 1
  %cmp63.us = icmp slt i64 %indvars.iv.next50, %15
  br i1 %cmp63.us, label %for.body65.us, label %for.end87.loopexit

for.end87.loopexit:                               ; preds = %for.cond66.for.inc85_crit_edge.us
  br label %for.end87

for.end87:                                        ; preds = %for.end87.loopexit, %for.body65.lr.ph, %for.end61
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [900 x double]* %E, [1000 x double]* %A, [900 x double]* %B, [1100 x double]* %F, [1200 x double]* %C, [1100 x double]* %D, [1100 x double]* %G) unnamed_addr #2 {
entry:
  %cmp100 = icmp sgt i32 %ni, 0
  br i1 %cmp100, label %for.body.lr.ph, label %for.end26

for.body.lr.ph:                                   ; preds = %entry
  %0 = zext i32 %nj to i64
  %cmp296 = icmp sgt i32 %nj, 0
  %wide.trip.count179.1 = zext i32 %nk to i64
  %1 = sext i32 %ni to i64
  br i1 %cmp296, label %for.body.us.preheader, label %for.end26

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %2 = add i32 %nj, -1
  %3 = zext i32 %2 to i64
  %4 = shl nuw nsw i64 %3, 3
  %5 = add nuw nsw i64 %4, 8
  %6 = icmp sgt i32 %nk, 0
  %xtraiter205 = and i32 %nk, 1
  %lcmp.mod206 = icmp eq i32 %xtraiter205, 0
  %7 = icmp eq i32 %nk, 1
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond1.for.inc24_crit_edge.us
  %indvar201 = phi i64 [ 0, %for.body.us.preheader ], [ %indvar.next202, %for.cond1.for.inc24_crit_edge.us ]
  %indvars.iv185 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next186, %for.cond1.for.inc24_crit_edge.us ]
  br i1 %6, label %for.body3.us.us.preheader, label %for.cond1.for.inc24_crit_edge.us.loopexit140

for.body3.us.us.preheader:                        ; preds = %for.body.us
  %arrayidx12.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv185, i64 0
  br label %for.body3.us.us

for.cond1.for.inc24_crit_edge.us.loopexit140:     ; preds = %for.body.us
  %scevgep203 = getelementptr [900 x double], [900 x double]* %E, i64 %indvar201, i64 0
  %scevgep203204 = bitcast double* %scevgep203 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep203204, i8 0, i64 %5, i32 8, i1 false)
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us.loopexit:        ; preds = %for.cond6.for.inc21_crit_edge.us.us
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us:                 ; preds = %for.cond1.for.inc24_crit_edge.us.loopexit, %for.cond1.for.inc24_crit_edge.us.loopexit140
  %indvars.iv.next186 = add nsw i64 %indvars.iv185, 1
  %cmp.us = icmp slt i64 %indvars.iv.next186, %1
  %indvar.next202 = add nuw nsw i64 %indvar201, 1
  br i1 %cmp.us, label %for.body.us, label %for.end26.loopexit

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.cond6.for.inc21_crit_edge.us.us
  %indvars.iv181 = phi i64 [ %indvars.iv.next182, %for.cond6.for.inc21_crit_edge.us.us ], [ 0, %for.body3.us.us.preheader ]
  %arrayidx5.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv185, i64 %indvars.iv181
  store double 0.000000e+00, double* %arrayidx5.us.us, align 8
  br i1 %lcmp.mod206, label %for.inc.us.us.prol.loopexit, label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %for.body3.us.us
  %8 = load double, double* %arrayidx12.us.us.prol, align 8
  %arrayidx16.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %B, i64 0, i64 %indvars.iv181
  %9 = load double, double* %arrayidx16.us.us.prol, align 8
  %mul.us.us.prol = fmul double %8, %9
  %add.us.us.prol = fadd double %mul.us.us.prol, 0.000000e+00
  store double %add.us.us.prol, double* %arrayidx5.us.us, align 8
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.inc.us.us.prol, %for.body3.us.us
  %10 = phi double [ %add.us.us.prol, %for.inc.us.us.prol ], [ 0.000000e+00, %for.body3.us.us ]
  %indvars.iv177.unr.ph = phi i64 [ 1, %for.inc.us.us.prol ], [ 0, %for.body3.us.us ]
  br i1 %7, label %for.cond6.for.inc21_crit_edge.us.us, label %for.inc.us.us.preheader

for.inc.us.us.preheader:                          ; preds = %for.inc.us.us.prol.loopexit
  br label %for.inc.us.us

for.cond6.for.inc21_crit_edge.us.us.loopexit:     ; preds = %for.inc.us.us
  br label %for.cond6.for.inc21_crit_edge.us.us

for.cond6.for.inc21_crit_edge.us.us:              ; preds = %for.cond6.for.inc21_crit_edge.us.us.loopexit, %for.inc.us.us.prol.loopexit
  %indvars.iv.next182 = add nuw nsw i64 %indvars.iv181, 1
  %exitcond214 = icmp eq i64 %indvars.iv.next182, %0
  br i1 %exitcond214, label %for.cond1.for.inc24_crit_edge.us.loopexit, label %for.body3.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us.preheader, %for.inc.us.us
  %11 = phi double [ %add.us.us.1, %for.inc.us.us ], [ %10, %for.inc.us.us.preheader ]
  %indvars.iv177 = phi i64 [ %indvars.iv.next178.1, %for.inc.us.us ], [ %indvars.iv177.unr.ph, %for.inc.us.us.preheader ]
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv185, i64 %indvars.iv177
  %12 = load double, double* %arrayidx12.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv177, i64 %indvars.iv181
  %13 = load double, double* %arrayidx16.us.us, align 8
  %mul.us.us = fmul double %12, %13
  %add.us.us = fadd double %11, %mul.us.us
  store double %add.us.us, double* %arrayidx5.us.us, align 8
  %indvars.iv.next178 = add nuw nsw i64 %indvars.iv177, 1
  %arrayidx12.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv185, i64 %indvars.iv.next178
  %14 = load double, double* %arrayidx12.us.us.1, align 8
  %arrayidx16.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next178, i64 %indvars.iv181
  %15 = load double, double* %arrayidx16.us.us.1, align 8
  %mul.us.us.1 = fmul double %14, %15
  %add.us.us.1 = fadd double %add.us.us, %mul.us.us.1
  store double %add.us.us.1, double* %arrayidx5.us.us, align 8
  %indvars.iv.next178.1 = add nuw nsw i64 %indvars.iv177, 2
  %exitcond180.1 = icmp eq i64 %indvars.iv.next178.1, %wide.trip.count179.1
  br i1 %exitcond180.1, label %for.cond6.for.inc21_crit_edge.us.us.loopexit, label %for.inc.us.us

for.end26.loopexit:                               ; preds = %for.cond1.for.inc24_crit_edge.us
  br label %for.end26

for.end26:                                        ; preds = %for.end26.loopexit, %for.body.lr.ph, %entry
  %cmp2856 = icmp sgt i32 %nj, 0
  br i1 %cmp2856, label %for.body29.lr.ph, label %for.end62

for.body29.lr.ph:                                 ; preds = %for.end26
  %16 = zext i32 %nl to i64
  %cmp3152 = icmp sgt i32 %nl, 0
  %wide.trip.count162.1 = zext i32 %nm to i64
  %17 = sext i32 %nj to i64
  br i1 %cmp3152, label %for.body29.us.preheader, label %for.end62

for.body29.us.preheader:                          ; preds = %for.body29.lr.ph
  %18 = add i32 %nl, -1
  %19 = zext i32 %18 to i64
  %20 = shl nuw nsw i64 %19, 3
  %21 = add nuw nsw i64 %20, 8
  %22 = icmp sgt i32 %nm, 0
  %xtraiter197 = and i32 %nm, 1
  %lcmp.mod198 = icmp eq i32 %xtraiter197, 0
  %23 = icmp eq i32 %nm, 1
  br label %for.body29.us

for.body29.us:                                    ; preds = %for.body29.us.preheader, %for.cond30.for.inc60_crit_edge.us
  %indvar193 = phi i64 [ 0, %for.body29.us.preheader ], [ %indvar.next194, %for.cond30.for.inc60_crit_edge.us ]
  %indvars.iv168 = phi i64 [ 0, %for.body29.us.preheader ], [ %indvars.iv.next169, %for.cond30.for.inc60_crit_edge.us ]
  br i1 %22, label %for.body32.us.us.preheader, label %for.cond30.for.inc60_crit_edge.us.loopexit138

for.body32.us.us.preheader:                       ; preds = %for.body29.us
  %arrayidx43.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv168, i64 0
  br label %for.body32.us.us

for.cond30.for.inc60_crit_edge.us.loopexit138:    ; preds = %for.body29.us
  %scevgep195 = getelementptr [1100 x double], [1100 x double]* %F, i64 %indvar193, i64 0
  %scevgep195196 = bitcast double* %scevgep195 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep195196, i8 0, i64 %21, i32 8, i1 false)
  br label %for.cond30.for.inc60_crit_edge.us

for.cond30.for.inc60_crit_edge.us.loopexit:       ; preds = %for.cond37.for.inc57_crit_edge.us.us
  br label %for.cond30.for.inc60_crit_edge.us

for.cond30.for.inc60_crit_edge.us:                ; preds = %for.cond30.for.inc60_crit_edge.us.loopexit, %for.cond30.for.inc60_crit_edge.us.loopexit138
  %indvars.iv.next169 = add nsw i64 %indvars.iv168, 1
  %cmp28.us = icmp slt i64 %indvars.iv.next169, %17
  %indvar.next194 = add nuw nsw i64 %indvar193, 1
  br i1 %cmp28.us, label %for.body29.us, label %for.end62.loopexit

for.body32.us.us:                                 ; preds = %for.body32.us.us.preheader, %for.cond37.for.inc57_crit_edge.us.us
  %indvars.iv164 = phi i64 [ %indvars.iv.next165, %for.cond37.for.inc57_crit_edge.us.us ], [ 0, %for.body32.us.us.preheader ]
  %arrayidx36.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv168, i64 %indvars.iv164
  store double 0.000000e+00, double* %arrayidx36.us.us, align 8
  br i1 %lcmp.mod198, label %for.inc54.us.us.prol.loopexit, label %for.inc54.us.us.prol

for.inc54.us.us.prol:                             ; preds = %for.body32.us.us
  %24 = load double, double* %arrayidx43.us.us.prol, align 8
  %arrayidx47.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 0, i64 %indvars.iv164
  %25 = load double, double* %arrayidx47.us.us.prol, align 8
  %mul48.us.us.prol = fmul double %24, %25
  %add53.us.us.prol = fadd double %mul48.us.us.prol, 0.000000e+00
  store double %add53.us.us.prol, double* %arrayidx36.us.us, align 8
  br label %for.inc54.us.us.prol.loopexit

for.inc54.us.us.prol.loopexit:                    ; preds = %for.inc54.us.us.prol, %for.body32.us.us
  %26 = phi double [ %add53.us.us.prol, %for.inc54.us.us.prol ], [ 0.000000e+00, %for.body32.us.us ]
  %indvars.iv160.unr.ph = phi i64 [ 1, %for.inc54.us.us.prol ], [ 0, %for.body32.us.us ]
  br i1 %23, label %for.cond37.for.inc57_crit_edge.us.us, label %for.inc54.us.us.preheader

for.inc54.us.us.preheader:                        ; preds = %for.inc54.us.us.prol.loopexit
  br label %for.inc54.us.us

for.cond37.for.inc57_crit_edge.us.us.loopexit:    ; preds = %for.inc54.us.us
  br label %for.cond37.for.inc57_crit_edge.us.us

for.cond37.for.inc57_crit_edge.us.us:             ; preds = %for.cond37.for.inc57_crit_edge.us.us.loopexit, %for.inc54.us.us.prol.loopexit
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %exitcond211 = icmp eq i64 %indvars.iv.next165, %16
  br i1 %exitcond211, label %for.cond30.for.inc60_crit_edge.us.loopexit, label %for.body32.us.us

for.inc54.us.us:                                  ; preds = %for.inc54.us.us.preheader, %for.inc54.us.us
  %27 = phi double [ %add53.us.us.1, %for.inc54.us.us ], [ %26, %for.inc54.us.us.preheader ]
  %indvars.iv160 = phi i64 [ %indvars.iv.next161.1, %for.inc54.us.us ], [ %indvars.iv160.unr.ph, %for.inc54.us.us.preheader ]
  %arrayidx43.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv168, i64 %indvars.iv160
  %28 = load double, double* %arrayidx43.us.us, align 8
  %arrayidx47.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv160, i64 %indvars.iv164
  %29 = load double, double* %arrayidx47.us.us, align 8
  %mul48.us.us = fmul double %28, %29
  %add53.us.us = fadd double %27, %mul48.us.us
  store double %add53.us.us, double* %arrayidx36.us.us, align 8
  %indvars.iv.next161 = add nuw nsw i64 %indvars.iv160, 1
  %arrayidx43.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv168, i64 %indvars.iv.next161
  %30 = load double, double* %arrayidx43.us.us.1, align 8
  %arrayidx47.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next161, i64 %indvars.iv164
  %31 = load double, double* %arrayidx47.us.us.1, align 8
  %mul48.us.us.1 = fmul double %30, %31
  %add53.us.us.1 = fadd double %add53.us.us, %mul48.us.us.1
  store double %add53.us.us.1, double* %arrayidx36.us.us, align 8
  %indvars.iv.next161.1 = add nuw nsw i64 %indvars.iv160, 2
  %exitcond163.1 = icmp eq i64 %indvars.iv.next161.1, %wide.trip.count162.1
  br i1 %exitcond163.1, label %for.cond37.for.inc57_crit_edge.us.us.loopexit, label %for.inc54.us.us

for.end62.loopexit:                               ; preds = %for.cond30.for.inc60_crit_edge.us
  br label %for.end62

for.end62:                                        ; preds = %for.end62.loopexit, %for.body29.lr.ph, %for.end26
  br i1 %cmp100, label %for.body65.lr.ph, label %for.end98

for.body65.lr.ph:                                 ; preds = %for.end62
  %32 = zext i32 %nl to i64
  %cmp6711 = icmp sgt i32 %nl, 0
  %wide.trip.count147.1 = zext i32 %nj to i64
  %33 = sext i32 %ni to i64
  br i1 %cmp6711, label %for.body65.us.preheader, label %for.end98

for.body65.us.preheader:                          ; preds = %for.body65.lr.ph
  %34 = add i32 %nl, -1
  %35 = zext i32 %34 to i64
  %36 = shl nuw nsw i64 %35, 3
  %37 = add nuw nsw i64 %36, 8
  %xtraiter = and i32 %nj, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %38 = icmp eq i32 %nj, 1
  br label %for.body65.us

for.body65.us:                                    ; preds = %for.body65.us.preheader, %for.cond66.for.inc96_crit_edge.us
  %indvar = phi i64 [ 0, %for.body65.us.preheader ], [ %indvar.next, %for.cond66.for.inc96_crit_edge.us ]
  %indvars.iv153 = phi i64 [ 0, %for.body65.us.preheader ], [ %indvars.iv.next154, %for.cond66.for.inc96_crit_edge.us ]
  br i1 %cmp2856, label %for.body68.us.us.preheader, label %for.cond66.for.inc96_crit_edge.us.loopexit136

for.body68.us.us.preheader:                       ; preds = %for.body65.us
  %arrayidx79.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv153, i64 0
  br label %for.body68.us.us

for.cond66.for.inc96_crit_edge.us.loopexit136:    ; preds = %for.body65.us
  %scevgep = getelementptr [1100 x double], [1100 x double]* %G, i64 %indvar, i64 0
  %scevgep190 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep190, i8 0, i64 %37, i32 8, i1 false)
  br label %for.cond66.for.inc96_crit_edge.us

for.cond66.for.inc96_crit_edge.us.loopexit:       ; preds = %for.cond73.for.inc93_crit_edge.us.us
  br label %for.cond66.for.inc96_crit_edge.us

for.cond66.for.inc96_crit_edge.us:                ; preds = %for.cond66.for.inc96_crit_edge.us.loopexit, %for.cond66.for.inc96_crit_edge.us.loopexit136
  %indvars.iv.next154 = add nsw i64 %indvars.iv153, 1
  %cmp64.us = icmp slt i64 %indvars.iv.next154, %33
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %cmp64.us, label %for.body65.us, label %for.end98.loopexit

for.body68.us.us:                                 ; preds = %for.body68.us.us.preheader, %for.cond73.for.inc93_crit_edge.us.us
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %for.cond73.for.inc93_crit_edge.us.us ], [ 0, %for.body68.us.us.preheader ]
  %arrayidx72.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv153, i64 %indvars.iv149
  store double 0.000000e+00, double* %arrayidx72.us.us, align 8
  br i1 %lcmp.mod, label %for.inc90.us.us.prol.loopexit, label %for.inc90.us.us.prol

for.inc90.us.us.prol:                             ; preds = %for.body68.us.us
  %39 = load double, double* %arrayidx79.us.us.prol, align 8
  %arrayidx83.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 0, i64 %indvars.iv149
  %40 = load double, double* %arrayidx83.us.us.prol, align 8
  %mul84.us.us.prol = fmul double %39, %40
  %add89.us.us.prol = fadd double %mul84.us.us.prol, 0.000000e+00
  store double %add89.us.us.prol, double* %arrayidx72.us.us, align 8
  br label %for.inc90.us.us.prol.loopexit

for.inc90.us.us.prol.loopexit:                    ; preds = %for.inc90.us.us.prol, %for.body68.us.us
  %41 = phi double [ %add89.us.us.prol, %for.inc90.us.us.prol ], [ 0.000000e+00, %for.body68.us.us ]
  %indvars.iv145.unr.ph = phi i64 [ 1, %for.inc90.us.us.prol ], [ 0, %for.body68.us.us ]
  br i1 %38, label %for.cond73.for.inc93_crit_edge.us.us, label %for.inc90.us.us.preheader

for.inc90.us.us.preheader:                        ; preds = %for.inc90.us.us.prol.loopexit
  br label %for.inc90.us.us

for.cond73.for.inc93_crit_edge.us.us.loopexit:    ; preds = %for.inc90.us.us
  br label %for.cond73.for.inc93_crit_edge.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.cond73.for.inc93_crit_edge.us.us.loopexit, %for.inc90.us.us.prol.loopexit
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %exitcond = icmp eq i64 %indvars.iv.next150, %32
  br i1 %exitcond, label %for.cond66.for.inc96_crit_edge.us.loopexit, label %for.body68.us.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us.preheader, %for.inc90.us.us
  %42 = phi double [ %add89.us.us.1, %for.inc90.us.us ], [ %41, %for.inc90.us.us.preheader ]
  %indvars.iv145 = phi i64 [ %indvars.iv.next146.1, %for.inc90.us.us ], [ %indvars.iv145.unr.ph, %for.inc90.us.us.preheader ]
  %arrayidx79.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv153, i64 %indvars.iv145
  %43 = load double, double* %arrayidx79.us.us, align 8
  %arrayidx83.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv145, i64 %indvars.iv149
  %44 = load double, double* %arrayidx83.us.us, align 8
  %mul84.us.us = fmul double %43, %44
  %add89.us.us = fadd double %42, %mul84.us.us
  store double %add89.us.us, double* %arrayidx72.us.us, align 8
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %arrayidx79.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv153, i64 %indvars.iv.next146
  %45 = load double, double* %arrayidx79.us.us.1, align 8
  %arrayidx83.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next146, i64 %indvars.iv149
  %46 = load double, double* %arrayidx83.us.us.1, align 8
  %mul84.us.us.1 = fmul double %45, %46
  %add89.us.us.1 = fadd double %add89.us.us, %mul84.us.us.1
  store double %add89.us.us.1, double* %arrayidx72.us.us, align 8
  %indvars.iv.next146.1 = add nuw nsw i64 %indvars.iv145, 2
  %exitcond148.1 = icmp eq i64 %indvars.iv.next146.1, %wide.trip.count147.1
  br i1 %exitcond148.1, label %for.cond73.for.inc93_crit_edge.us.us.loopexit, label %for.inc90.us.us

for.end98.loopexit:                               ; preds = %for.cond66.for.inc96_crit_edge.us
  br label %for.end98

for.end98:                                        ; preds = %for.end98.loopexit, %for.body65.lr.ph, %for.end62
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %ni, i32 %nl, [1100 x double]* %G) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp4 = icmp sgt i32 %ni, 0
  br i1 %cmp4, label %for.body.lr.ph, label %for.end12

for.body.lr.ph:                                   ; preds = %entry
  %3 = zext i32 %nl to i64
  %cmp32 = icmp sgt i32 %nl, 0
  %4 = sext i32 %ni to i64
  br i1 %cmp32, label %for.body.us.preheader, label %for.end12

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond2.for.inc10_crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ], [ 0, %for.body.us.preheader ]
  %5 = mul nsw i64 %indvars.iv10, %4
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.inc.us ]
  %6 = add nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv10, i64 %indvars.iv
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond13, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %cmp.us = icmp slt i64 %indvars.iv.next11, %4
  br i1 %cmp.us, label %for.body.us, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %for.body.lr.ph, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #6
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
