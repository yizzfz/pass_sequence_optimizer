; ModuleID = 'A.ll'
source_filename = "cholesky.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_cholesky(i32 2000, [2000 x double]* %arraydecay)
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
  tail call void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %n, [2000 x double]* %A) #0 {
entry:
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %entry, %for.inc23
  %indvars.iv148 = phi i64 [ 0, %entry ], [ %indvars.iv.next149, %for.inc23 ]
  %indvars.iv146 = phi i64 [ 1, %entry ], [ %indvars.iv.next147, %for.inc23 ]
  %0 = mul nuw nsw i64 %indvars.iv148, 2001
  %1 = add nuw nsw i64 %0, 1
  %scevgep144 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %1
  %2 = sub i64 1998, %indvars.iv148
  %3 = shl i64 %2, 3
  %4 = and i64 %3, 34359738360
  %5 = add nuw nsw i64 %4, 8
  br label %for.inc

for.cond8.preheader:                              ; preds = %for.inc
  %indvars.iv.next149 = add nuw nsw i64 %indvars.iv148, 1
  %cmp997 = icmp slt i64 %indvars.iv.next149, 2000
  br i1 %cmp997, label %for.inc16.preheader, label %for.inc23

for.inc16.preheader:                              ; preds = %for.cond8.preheader
  %6 = bitcast double* %scevgep144 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %6, i8 0, i64 %5, i32 8, i1 false)
  br label %for.inc23

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv131 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next132, %for.inc ]
  %7 = sub nsw i64 0, %indvars.iv131
  %8 = trunc i64 %7 to i32
  %rem = srem i32 %8, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv148, i64 %indvars.iv131
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %exitcond137 = icmp eq i64 %indvars.iv.next132, %indvars.iv146
  br i1 %exitcond137, label %for.cond8.preheader, label %for.inc

for.inc23:                                        ; preds = %for.inc16.preheader, %for.cond8.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv148, i64 %indvars.iv148
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %exitcond151 = icmp eq i64 %indvars.iv.next149, 2000
  br i1 %exitcond151, label %for.end25, label %for.inc.lr.ph

for.end25:                                        ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.cond30.preheader.us

for.cond30.preheader.us:                          ; preds = %for.cond30.preheader.us, %for.end25
  %indvars.iv124 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next125.3.1, %for.cond30.preheader.us ]
  %9 = mul nuw nsw i64 %indvars.iv124, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %9
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %10 = mul nuw nsw i64 %indvars.iv124, 16000
  %11 = add nuw nsw i64 %10, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %12 = mul nuw nsw i64 %indvars.iv124, 16000
  %13 = add nuw nsw i64 %12, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %14 = mul nuw nsw i64 %indvars.iv124, 16000
  %15 = add nuw nsw i64 %14, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next125.3 = or i64 %indvars.iv124, 4
  %16 = mul nuw nsw i64 %indvars.iv.next125.3, 16000
  %scevgep.1176 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1176, i8 0, i64 16000, i32 8, i1 false)
  %17 = mul nuw nsw i64 %indvars.iv.next125.3, 16000
  %18 = add nuw nsw i64 %17, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %19 = mul nuw nsw i64 %indvars.iv.next125.3, 16000
  %20 = add nuw nsw i64 %19, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %21 = mul nuw nsw i64 %indvars.iv.next125.3, 16000
  %22 = add nuw nsw i64 %21, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next125.3.1 = add nsw i64 %indvars.iv124, 8
  %exitcond127.3.1 = icmp eq i64 %indvars.iv.next125.3.1, 2000
  br i1 %exitcond127.3.1, label %for.cond52.preheader.us.us.preheader.preheader, label %for.cond30.preheader.us

for.cond52.preheader.us.us.preheader.preheader:   ; preds = %for.cond30.preheader.us
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond52.preheader.us.us.preheader.preheader, %for.cond48.for.inc75_crit_edge.us
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %for.cond48.for.inc75_crit_edge.us ], [ 0, %for.cond52.preheader.us.us.preheader.preheader ]
  br label %for.cond52.preheader.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %exitcond119 = icmp eq i64 %indvars.iv.next117, 2000
  br i1 %exitcond119, label %for.cond82.preheader.us.preheader, label %for.cond52.preheader.us.us.preheader

for.cond82.preheader.us.preheader:                ; preds = %for.cond48.for.inc75_crit_edge.us
  br label %for.cond82.preheader.us

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv112 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next113, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv112, i64 %indvars.iv116
  br label %for.inc69.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.inc69.us.us
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next113, 2000
  br i1 %exitcond115, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.cond52.preheader.us.us, %for.inc69.us.us
  %indvars.iv106 = phi i64 [ %indvars.iv.next107.1, %for.inc69.us.us ], [ 0, %for.cond52.preheader.us.us ]
  %23 = bitcast i8* %call to [2000 x [2000 x double]]*
  %24 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv106, i64 %indvars.iv116
  %25 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %24, %25
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv112, i64 %indvars.iv106
  %26 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %26, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next107 = or i64 %indvars.iv106, 1
  %27 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next107, i64 %indvars.iv116
  %28 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %27, %28
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv112, i64 %indvars.iv.next107
  %29 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %29, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106, 2
  %exitcond109.1 = icmp eq i64 %indvars.iv.next107.1, 2000
  br i1 %exitcond109.1, label %for.cond52.for.inc72_crit_edge.us.us, label %for.inc69.us.us

for.cond82.preheader.us:                          ; preds = %for.cond82.preheader.us.preheader, %for.cond82.for.inc97_crit_edge.us
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %for.cond82.for.inc97_crit_edge.us ], [ 0, %for.cond82.preheader.us.preheader ]
  br label %for.inc94.us

for.inc94.us:                                     ; preds = %for.cond82.preheader.us, %for.inc94.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc94.us ], [ 0, %for.cond82.preheader.us ]
  %30 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv103, i64 %indvars.iv
  %31 = bitcast double* %arrayidx89.us to i64*
  %32 = load i64, i64* %31, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv103, i64 %indvars.iv
  %33 = bitcast double* %arrayidx93.us to i64*
  store i64 %32, i64* %33, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next
  %34 = bitcast double* %arrayidx89.us.1 to i64*
  %35 = load i64, i64* %34, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv103, i64 %indvars.iv.next
  %36 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %35, i64* %36, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next.1
  %37 = bitcast double* %arrayidx89.us.2 to i64*
  %38 = load i64, i64* %37, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv103, i64 %indvars.iv.next.1
  %39 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %38, i64* %39, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next.2
  %40 = bitcast double* %arrayidx89.us.3 to i64*
  %41 = load i64, i64* %40, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv103, i64 %indvars.iv.next.2
  %42 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %41, i64* %42, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %for.cond82.for.inc97_crit_edge.us, label %for.inc94.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.inc94.us
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond = icmp eq i64 %indvars.iv.next104, 2000
  br i1 %exitcond, label %for.end99, label %for.cond82.preheader.us

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  tail call void @free(i8* %call) #4
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_cholesky(i32 %n, [2000 x double]* %A) #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc56
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.inc56 ], [ 0, %entry ]
  %0 = add i64 %indvars.iv64, -2
  %1 = add i64 %indvars.iv64, 4294967295
  %cmp240 = icmp sgt i64 %indvars.iv64, 0
  br i1 %cmp240, label %for.cond4.preheader.preheader, label %for.cond28.preheader.for.inc56_crit_edge

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv64, i64 0
  br label %for.cond4.preheader

for.cond28.preheader:                             ; preds = %for.inc25
  %2 = icmp sgt i64 %indvars.iv64, 0
  br i1 %2, label %for.inc45.lr.ph, label %for.cond28.preheader.for.inc56_crit_edge

for.cond28.preheader.for.inc56_crit_edge:         ; preds = %for.cond1.preheader, %for.cond28.preheader
  %.pre70 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv64
  br label %for.inc56

for.inc45.lr.ph:                                  ; preds = %for.cond28.preheader
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv64
  %xtraiter6071 = and i64 %indvars.iv64, 1
  %lcmp.mod61 = icmp eq i64 %xtraiter6071, 0
  br i1 %lcmp.mod61, label %for.inc45.prol.loopexit.unr-lcssa, label %for.inc45.prol.preheader

for.inc45.prol.preheader:                         ; preds = %for.inc45.lr.ph
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv64, i64 0
  %3 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %3, %3
  %4 = load double, double* %arrayidx43, align 8
  %sub44.prol = fsub double %4, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  br label %for.inc45.prol.loopexit.unr-lcssa

for.inc45.prol.loopexit.unr-lcssa:                ; preds = %for.inc45.lr.ph, %for.inc45.prol.preheader
  %indvars.iv55.unr.ph = phi i64 [ 1, %for.inc45.prol.preheader ], [ 0, %for.inc45.lr.ph ]
  %5 = trunc i64 %1 to i32
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %for.inc56, label %for.inc45.lr.ph.new

for.inc45.lr.ph.new:                              ; preds = %for.inc45.prol.loopexit.unr-lcssa
  %.pre68 = load double, double* %arrayidx43, align 8
  %7 = sub i64 %0, %indvars.iv55.unr.ph
  %8 = lshr i64 %7, 1
  %9 = and i64 %8, 1
  %lcmp.mod74 = icmp eq i64 %9, 0
  br i1 %lcmp.mod74, label %for.inc45.prol, label %for.inc45.prol.loopexit

for.inc45.prol:                                   ; preds = %for.inc45.lr.ph.new
  %arrayidx34.prol75 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv55.unr.ph
  %10 = load double, double* %arrayidx34.prol75, align 8
  %mul39.prol76 = fmul double %10, %10
  %sub44.prol77 = fsub double %.pre68, %mul39.prol76
  store double %sub44.prol77, double* %arrayidx43, align 8
  %indvars.iv.next56.prol = add nuw nsw i64 %indvars.iv55.unr.ph, 1
  %arrayidx34.1.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv.next56.prol
  %11 = load double, double* %arrayidx34.1.prol, align 8
  %mul39.1.prol = fmul double %11, %11
  %sub44.1.prol = fsub double %sub44.prol77, %mul39.1.prol
  store double %sub44.1.prol, double* %arrayidx43, align 8
  %indvars.iv.next56.1.prol = or i64 %indvars.iv55.unr.ph, 2
  br label %for.inc45.prol.loopexit

for.inc45.prol.loopexit:                          ; preds = %for.inc45.prol, %for.inc45.lr.ph.new
  %.unr.ph = phi double [ %sub44.1.prol, %for.inc45.prol ], [ %.pre68, %for.inc45.lr.ph.new ]
  %indvars.iv55.unr.ph79 = phi i64 [ %indvars.iv.next56.1.prol, %for.inc45.prol ], [ %indvars.iv55.unr.ph, %for.inc45.lr.ph.new ]
  %12 = icmp eq i64 %8, 0
  br i1 %12, label %for.inc56, label %for.inc45.lr.ph.new.new

for.inc45.lr.ph.new.new:                          ; preds = %for.inc45.prol.loopexit
  br label %for.inc45

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %13 = add i64 %indvars.iv50, 4294967295
  %cmp538 = icmp sgt i64 %indvars.iv50, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv50
  br i1 %cmp538, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %xtraiter72 = and i64 %indvars.iv50, 1
  %lcmp.mod = icmp eq i64 %xtraiter72, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %14 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 0
  %15 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %14, %15
  %16 = load double, double* %arrayidx16, align 8
  %sub.prol = fsub double %16, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol.preheader ], [ 0, %for.inc.lr.ph ]
  %17 = trunc i64 %13 to i32
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %for.inc25, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit.unr-lcssa
  %.pre = load double, double* %arrayidx16, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %19 = phi double [ %.pre, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv
  %20 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv
  %21 = load double, double* %arrayidx12, align 8
  %mul = fmul double %20, %21
  %sub = fsub double %19, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv.next
  %22 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv.next
  %23 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %22, %23
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv50
  br i1 %exitcond.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.cond4.preheader, %for.inc.prol.loopexit.unr-lcssa
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv50
  %24 = load double, double* %arrayidx20, align 8
  %25 = load double, double* %arrayidx16, align 8
  %div = fdiv double %25, %24
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, %indvars.iv64
  br i1 %exitcond, label %for.cond28.preheader, label %for.cond4.preheader

for.inc45:                                        ; preds = %for.inc45, %for.inc45.lr.ph.new.new
  %26 = phi double [ %.unr.ph, %for.inc45.lr.ph.new.new ], [ %sub44.1.1, %for.inc45 ]
  %indvars.iv55 = phi i64 [ %indvars.iv55.unr.ph79, %for.inc45.lr.ph.new.new ], [ %indvars.iv.next56.1.1, %for.inc45 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv55
  %27 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %27, %27
  %sub44 = fsub double %26, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv.next56
  %28 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %28, %28
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %arrayidx34.180 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv.next56.1
  %29 = load double, double* %arrayidx34.180, align 8
  %mul39.181 = fmul double %29, %29
  %sub44.182 = fsub double %sub44.1, %mul39.181
  store double %sub44.182, double* %arrayidx43, align 8
  %indvars.iv.next56.183 = add nsw i64 %indvars.iv55, 3
  %arrayidx34.1.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv.next56.183
  %30 = load double, double* %arrayidx34.1.1, align 8
  %mul39.1.1 = fmul double %30, %30
  %sub44.1.1 = fsub double %sub44.182, %mul39.1.1
  store double %sub44.1.1, double* %arrayidx43, align 8
  %indvars.iv.next56.1.1 = add nsw i64 %indvars.iv55, 4
  %exitcond59.1.1 = icmp eq i64 %indvars.iv.next56.1.1, %indvars.iv64
  br i1 %exitcond59.1.1, label %for.inc56.loopexit, label %for.inc45

for.inc56.loopexit:                               ; preds = %for.inc45
  br label %for.inc56

for.inc56:                                        ; preds = %for.inc56.loopexit, %for.inc45.prol.loopexit, %for.inc45.prol.loopexit.unr-lcssa, %for.cond28.preheader.for.inc56_crit_edge
  %arrayidx51.pre-phi = phi double* [ %.pre70, %for.cond28.preheader.for.inc56_crit_edge ], [ %arrayidx43, %for.inc45.prol.loopexit.unr-lcssa ], [ %arrayidx43, %for.inc45.prol.loopexit ], [ %arrayidx43, %for.inc56.loopexit ]
  %31 = load double, double* %arrayidx51.pre-phi, align 8
  %call = tail call double @sqrt(double %31) #4
  store double %call, double* %arrayidx51.pre-phi, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, 2000
  br i1 %exitcond67, label %for.end58, label %for.cond1.preheader

for.end58:                                        ; preds = %for.inc56
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, [2000 x double]* %A) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body4.lr.ph

for.body4.lr.ph:                                  ; preds = %entry, %for.inc10
  %indvars.iv18 = phi i64 [ 0, %entry ], [ %indvars.iv.next19, %for.inc10 ]
  %indvars.iv16 = phi i64 [ 1, %entry ], [ %indvars.iv.next17, %for.inc10 ]
  %3 = mul nsw i64 %indvars.iv18, 2000
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body4.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
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
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
