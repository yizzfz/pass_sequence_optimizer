; ModuleID = 'A.ll'
source_filename = "cholesky.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_cholesky(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [2000 x double]*
  tail call void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %n, [2000 x double]* nocapture %A) #0 {
entry:
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %entry, %for.inc23
  %indvars.iv140 = phi i64 [ 0, %entry ], [ %indvars.iv.next141, %for.inc23 ]
  %indvars.iv138 = phi i64 [ 1, %entry ], [ %indvars.iv.next139, %for.inc23 ]
  %0 = mul nuw nsw i64 %indvars.iv140, 2001
  %1 = add nuw nsw i64 %0, 1
  %scevgep136 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %1
  %2 = sub i64 1998, %indvars.iv140
  %3 = shl i64 %2, 3
  %4 = and i64 %3, 34359738360
  %5 = add nuw nsw i64 %4, 8
  br label %for.inc

for.cond8.preheader:                              ; preds = %for.inc
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %cmp989 = icmp slt i64 %indvars.iv.next141, 2000
  br i1 %cmp989, label %for.inc16.preheader, label %for.inc23

for.inc16.preheader:                              ; preds = %for.cond8.preheader
  %6 = bitcast double* %scevgep136 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %6, i8 0, i64 %5, i32 8, i1 false)
  br label %for.inc23

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %for.inc ], [ 0, %for.inc.lr.ph ]
  %7 = sub nsw i64 0, %indvars.iv123
  %8 = trunc i64 %7 to i32
  %rem = srem i32 %8, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv140, i64 %indvars.iv123
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond129 = icmp eq i64 %indvars.iv.next124, %indvars.iv138
  br i1 %exitcond129, label %for.cond8.preheader, label %for.inc

for.inc23:                                        ; preds = %for.inc16.preheader, %for.cond8.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv140, i64 %indvars.iv140
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %exitcond143 = icmp eq i64 %indvars.iv.next141, 2000
  br i1 %exitcond143, label %for.end25, label %for.inc.lr.ph

for.end25:                                        ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.cond30.preheader.us

for.cond30.preheader.us:                          ; preds = %for.cond30.preheader.us, %for.end25
  %indvars.iv116 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next117.3.1, %for.cond30.preheader.us ]
  %9 = mul nuw nsw i64 %indvars.iv116, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %9
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %10 = add nuw nsw i64 %9, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %10
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %11 = add nuw nsw i64 %9, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %12 = add nuw nsw i64 %9, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3 = or i64 %indvars.iv116, 4
  %13 = mul nuw nsw i64 %indvars.iv.next117.3, 16000
  %scevgep.1165 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1165, i8 0, i64 16000, i32 8, i1 false)
  %14 = add nuw nsw i64 %13, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %15 = add nuw nsw i64 %13, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %16 = add nuw nsw i64 %13, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3.1 = add nsw i64 %indvars.iv116, 8
  %exitcond119.3.1 = icmp eq i64 %indvars.iv.next117.3.1, 2000
  br i1 %exitcond119.3.1, label %for.cond52.preheader.us.us.preheader.preheader, label %for.cond30.preheader.us

for.cond52.preheader.us.us.preheader.preheader:   ; preds = %for.cond30.preheader.us
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond52.preheader.us.us.preheader.preheader, %for.cond48.for.inc75_crit_edge.us
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %for.cond48.for.inc75_crit_edge.us ], [ 0, %for.cond52.preheader.us.us.preheader.preheader ]
  br label %for.cond52.preheader.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next109, 2000
  br i1 %exitcond111, label %for.cond82.preheader.us.preheader, label %for.cond52.preheader.us.us.preheader

for.cond82.preheader.us.preheader:                ; preds = %for.cond48.for.inc75_crit_edge.us
  br label %for.cond82.preheader.us

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv104 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next105, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv104, i64 %indvars.iv108
  br label %for.inc69.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.inc69.us.us
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, 2000
  br i1 %exitcond107, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.cond52.preheader.us.us, %for.inc69.us.us
  %indvars.iv98 = phi i64 [ %indvars.iv.next99.1, %for.inc69.us.us ], [ 0, %for.cond52.preheader.us.us ]
  %17 = bitcast i8* %call to [2000 x [2000 x double]]*
  %18 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv98, i64 %indvars.iv108
  %19 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %18, %19
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv104, i64 %indvars.iv98
  %20 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %20, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next99 = or i64 %indvars.iv98, 1
  %21 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next99, i64 %indvars.iv108
  %22 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %21, %22
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next99
  %23 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %23, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next99.1 = add nsw i64 %indvars.iv98, 2
  %exitcond101.1 = icmp eq i64 %indvars.iv.next99.1, 2000
  br i1 %exitcond101.1, label %for.cond52.for.inc72_crit_edge.us.us, label %for.inc69.us.us

for.cond82.preheader.us:                          ; preds = %for.cond82.preheader.us.preheader, %for.cond82.for.inc97_crit_edge.us
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %for.cond82.for.inc97_crit_edge.us ], [ 0, %for.cond82.preheader.us.preheader ]
  br label %for.inc94.us

for.inc94.us:                                     ; preds = %for.cond82.preheader.us, %for.inc94.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc94.us ], [ 0, %for.cond82.preheader.us ]
  %24 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv95, i64 %indvars.iv
  %25 = bitcast double* %arrayidx89.us to i64*
  %26 = load i64, i64* %25, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv
  %27 = bitcast double* %arrayidx93.us to i64*
  store i64 %26, i64* %27, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next
  %28 = bitcast double* %arrayidx89.us.1 to i64*
  %29 = load i64, i64* %28, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv.next
  %30 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %29, i64* %30, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %31 = bitcast double* %arrayidx89.us.2 to i64*
  %32 = load i64, i64* %31, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %33 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %32, i64* %33, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %34 = bitcast double* %arrayidx89.us.3 to i64*
  %35 = load i64, i64* %34, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %36 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %35, i64* %36, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %for.cond82.for.inc97_crit_edge.us, label %for.inc94.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.inc94.us
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond = icmp eq i64 %indvars.iv.next96, 2000
  br i1 %exitcond, label %for.end99, label %for.cond82.preheader.us

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  tail call void @free(i8* %call) #3
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_cholesky(i32 %n, [2000 x double]* nocapture %A) #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc56
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.inc56 ], [ 0, %entry ]
  %0 = add i64 %indvars.iv60, -2
  %1 = add i64 %indvars.iv60, 4294967295
  %cmp234 = icmp sgt i64 %indvars.iv60, 0
  br i1 %cmp234, label %for.cond4.preheader.preheader, label %for.cond28.preheader.for.inc56_crit_edge

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 0
  br label %for.cond4.preheader

for.cond28.preheader.for.inc56_crit_edge:         ; preds = %for.cond1.preheader
  %.pre66 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv60
  br label %for.inc56

for.inc45.lr.ph:                                  ; preds = %for.inc25
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv60
  %xtraiter5667 = and i64 %indvars.iv60, 1
  %lcmp.mod57 = icmp eq i64 %xtraiter5667, 0
  br i1 %lcmp.mod57, label %for.inc45.prol.loopexit.unr-lcssa, label %for.inc45.prol.preheader

for.inc45.prol.preheader:                         ; preds = %for.inc45.lr.ph
  %2 = load double, double* %arrayidx8.prol, align 8
  %mul39.prol = fmul double %2, %2
  %3 = load double, double* %arrayidx43, align 8
  %sub44.prol = fsub double %3, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  br label %for.inc45.prol.loopexit.unr-lcssa

for.inc45.prol.loopexit.unr-lcssa:                ; preds = %for.inc45.lr.ph, %for.inc45.prol.preheader
  %indvars.iv51.unr.ph = phi i64 [ 1, %for.inc45.prol.preheader ], [ 0, %for.inc45.lr.ph ]
  %4 = trunc i64 %1 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %for.inc56, label %for.inc45.lr.ph.new

for.inc45.lr.ph.new:                              ; preds = %for.inc45.prol.loopexit.unr-lcssa
  %.pre64 = load double, double* %arrayidx43, align 8
  %6 = sub i64 %0, %indvars.iv51.unr.ph
  %7 = lshr i64 %6, 1
  %8 = and i64 %7, 1
  %lcmp.mod70 = icmp eq i64 %8, 0
  br i1 %lcmp.mod70, label %for.inc45.prol, label %for.inc45.prol.loopexit

for.inc45.prol:                                   ; preds = %for.inc45.lr.ph.new
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv51.unr.ph
  %9 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol71 = fmul double %9, %9
  %sub44.prol72 = fsub double %.pre64, %mul39.prol71
  store double %sub44.prol72, double* %arrayidx43, align 8
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.unr.ph, 1
  %arrayidx34.1.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52.prol
  %10 = load double, double* %arrayidx34.1.prol, align 8
  %mul39.1.prol = fmul double %10, %10
  %sub44.1.prol = fsub double %sub44.prol72, %mul39.1.prol
  store double %sub44.1.prol, double* %arrayidx43, align 8
  %indvars.iv.next52.1.prol = or i64 %indvars.iv51.unr.ph, 2
  br label %for.inc45.prol.loopexit

for.inc45.prol.loopexit:                          ; preds = %for.inc45.prol, %for.inc45.lr.ph.new
  %.unr.ph = phi double [ %sub44.1.prol, %for.inc45.prol ], [ %.pre64, %for.inc45.lr.ph.new ]
  %indvars.iv51.unr.ph74 = phi i64 [ %indvars.iv.next52.1.prol, %for.inc45.prol ], [ %indvars.iv51.unr.ph, %for.inc45.lr.ph.new ]
  %11 = icmp eq i64 %7, 0
  br i1 %11, label %for.inc56, label %for.inc45.lr.ph.new.new

for.inc45.lr.ph.new.new:                          ; preds = %for.inc45.prol.loopexit
  br label %for.inc45

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %12 = add i64 %indvars.iv46, 4294967295
  %cmp532 = icmp sgt i64 %indvars.iv46, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv46
  br i1 %cmp532, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %xtraiter68 = and i64 %indvars.iv46, 1
  %lcmp.mod = icmp eq i64 %xtraiter68, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %13 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 0
  %14 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %13, %14
  %15 = load double, double* %arrayidx16, align 8
  %sub.prol = fsub double %15, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol.preheader ], [ 0, %for.inc.lr.ph ]
  %16 = trunc i64 %12 to i32
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %for.inc25, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit.unr-lcssa
  %.pre = load double, double* %arrayidx16, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %18 = phi double [ %.pre, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv
  %19 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv
  %20 = load double, double* %arrayidx12, align 8
  %mul = fmul double %19, %20
  %sub = fsub double %18, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next
  %21 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next
  %22 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %21, %22
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv46
  br i1 %exitcond.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.cond4.preheader, %for.inc.prol.loopexit.unr-lcssa
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv46
  %23 = load double, double* %arrayidx20, align 8
  %24 = load double, double* %arrayidx16, align 8
  %div = fdiv double %24, %23
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond = icmp eq i64 %indvars.iv.next47, %indvars.iv60
  br i1 %exitcond, label %for.inc45.lr.ph, label %for.cond4.preheader

for.inc45:                                        ; preds = %for.inc45, %for.inc45.lr.ph.new.new
  %25 = phi double [ %.unr.ph, %for.inc45.lr.ph.new.new ], [ %sub44.1.1, %for.inc45 ]
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr.ph74, %for.inc45.lr.ph.new.new ], [ %indvars.iv.next52.1.1, %for.inc45 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv51
  %26 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %26, %26
  %sub44 = fsub double %25, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52
  %27 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %27, %27
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %arrayidx34.175 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52.1
  %28 = load double, double* %arrayidx34.175, align 8
  %mul39.176 = fmul double %28, %28
  %sub44.177 = fsub double %sub44.1, %mul39.176
  store double %sub44.177, double* %arrayidx43, align 8
  %indvars.iv.next52.178 = add nsw i64 %indvars.iv51, 3
  %arrayidx34.1.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52.178
  %29 = load double, double* %arrayidx34.1.1, align 8
  %mul39.1.1 = fmul double %29, %29
  %sub44.1.1 = fsub double %sub44.177, %mul39.1.1
  store double %sub44.1.1, double* %arrayidx43, align 8
  %indvars.iv.next52.1.1 = add nsw i64 %indvars.iv51, 4
  %exitcond55.1.1 = icmp eq i64 %indvars.iv.next52.1.1, %indvars.iv60
  br i1 %exitcond55.1.1, label %for.inc56.loopexit, label %for.inc45

for.inc56.loopexit:                               ; preds = %for.inc45
  br label %for.inc56

for.inc56:                                        ; preds = %for.inc56.loopexit, %for.inc45.prol.loopexit, %for.inc45.prol.loopexit.unr-lcssa, %for.cond28.preheader.for.inc56_crit_edge
  %arrayidx51.pre-phi = phi double* [ %.pre66, %for.cond28.preheader.for.inc56_crit_edge ], [ %arrayidx43, %for.inc45.prol.loopexit.unr-lcssa ], [ %arrayidx43, %for.inc45.prol.loopexit ], [ %arrayidx43, %for.inc56.loopexit ]
  %30 = load double, double* %arrayidx51.pre-phi, align 8
  %call = tail call double @sqrt(double %30) #3
  store double %call, double* %arrayidx51.pre-phi, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next61, 2000
  br i1 %exitcond63, label %for.end58, label %for.cond1.preheader

for.end58:                                        ; preds = %for.inc56
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body4.lr.ph

for.body4.lr.ph:                                  ; preds = %entry, %for.inc10
  %indvars.iv18 = phi i64 [ 0, %entry ], [ %indvars.iv.next19, %for.inc10 ]
  %indvars.iv16 = phi i64 [ 1, %entry ], [ %indvars.iv.next17, %for.inc10 ]
  %3 = mul nsw i64 %indvars.iv18, 2000
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body4.lr.ph ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %if.then, %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv16
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next19, 2000
  br i1 %exitcond22, label %for.end12, label %for.body4.lr.ph

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
