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
  %.cast = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %.cast)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu([2000 x double]* %.cast)
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
for.cond.for.cond1_crit_edge.lr.ph:
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc.lr.ph.backedge, %for.cond.for.cond1_crit_edge.lr.ph
  %indvars.iv88 = phi i64 [ 0, %for.cond.for.cond1_crit_edge.lr.ph ], [ %0, %for.inc.lr.ph.backedge ]
  %indvars.iv86 = phi i64 [ 1, %for.cond.for.cond1_crit_edge.lr.ph ], [ %indvars.iv86.be, %for.inc.lr.ph.backedge ]
  %0 = add nuw nsw i64 %indvars.iv88, 1
  %1 = sub i64 1998, %indvars.iv88
  %2 = shl i64 %1, 3
  %3 = and i64 %2, 34359738360
  br label %for.inc

for.cond1.for.cond8_crit_edge:                    ; preds = %for.inc
  %cmp942 = icmp slt i64 %0, 2000
  br i1 %cmp942, label %for.inc23.thread, label %for.inc23

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv70 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next71, %for.inc ]
  %4 = sub nsw i64 0, %indvars.iv70
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv88, i64 %indvars.iv70
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next71, %indvars.iv86
  br i1 %exitcond76, label %for.cond1.for.cond8_crit_edge, label %for.inc

for.inc23.thread:                                 ; preds = %for.cond1.for.cond8_crit_edge
  %6 = add nuw nsw i64 %3, 8
  %scevgep83 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %0
  %7 = mul nuw nsw i64 %indvars.iv88, 2000
  %scevgep84 = getelementptr double, double* %scevgep83, i64 %7
  %scevgep8485 = bitcast double* %scevgep84 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8485, i8 0, i64 %6, i32 8, i1 false)
  %arrayidx221 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv88, i64 %indvars.iv88
  store double 1.000000e+00, double* %arrayidx221, align 8
  br label %for.inc.lr.ph.backedge

for.inc23:                                        ; preds = %for.cond1.for.cond8_crit_edge
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv88, i64 %indvars.iv88
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond91 = icmp eq i64 %0, 2000
  br i1 %exitcond91, label %for.cond26.for.cond30_crit_edge.us.preheader.new, label %for.inc.lr.ph.backedge

for.inc.lr.ph.backedge:                           ; preds = %for.inc23, %for.inc23.thread
  %indvars.iv86.be = add nuw nsw i64 %indvars.iv86, 1
  br label %for.inc.lr.ph

for.cond26.for.cond30_crit_edge.us.preheader.new: ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.cond30.for.inc41_crit_edge.us.3

for.cond48.for.cond52_crit_edge.us.us.preheader:  ; preds = %for.cond48.for.cond52_crit_edge.us.us.preheader.preheader, %for.cond48.for.inc75_crit_edge.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.cond48.for.inc75_crit_edge.us ], [ 0, %for.cond48.for.cond52_crit_edge.us.us.preheader.preheader ]
  br label %for.cond48.for.cond52_crit_edge.us.us.new

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, 2000
  br i1 %exitcond61, label %for.cond78.for.cond82_crit_edge.us.new.preheader, label %for.cond48.for.cond52_crit_edge.us.us.preheader

for.cond78.for.cond82_crit_edge.us.new.preheader: ; preds = %for.cond48.for.inc75_crit_edge.us
  %8 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond78.for.cond82_crit_edge.us.new

for.cond48.for.cond52_crit_edge.us.us.new:        ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond48.for.cond52_crit_edge.us.us.preheader
  %indvars.iv54 = phi i64 [ 0, %for.cond48.for.cond52_crit_edge.us.us.preheader ], [ %indvars.iv.next55, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv58
  br label %for.inc69.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.inc69.us.us
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, 2000
  br i1 %exitcond57, label %for.cond48.for.inc75_crit_edge.us, label %for.cond48.for.cond52_crit_edge.us.us.new

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.cond48.for.cond52_crit_edge.us.us.new
  %indvars.iv50 = phi i64 [ 0, %for.cond48.for.cond52_crit_edge.us.us.new ], [ %indvars.iv.next51.1, %for.inc69.us.us ]
  %9 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv58
  %10 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %9, %10
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv54, i64 %indvars.iv50
  %11 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %11, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next51 = or i64 %indvars.iv50, 1
  %12 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next51, i64 %indvars.iv58
  %13 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %12, %13
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv54, i64 %indvars.iv.next51
  %14 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %14, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next51.1 = add nuw nsw i64 %indvars.iv50, 2
  %exitcond53.1 = icmp eq i64 %indvars.iv.next51.1, 2000
  br i1 %exitcond53.1, label %for.cond52.for.inc72_crit_edge.us.us, label %for.inc69.us.us

for.cond78.for.cond82_crit_edge.us.new:           ; preds = %for.cond78.for.cond82_crit_edge.us.new.preheader, %for.cond82.for.inc97_crit_edge.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.cond82.for.inc97_crit_edge.us ], [ 0, %for.cond78.for.cond82_crit_edge.us.new.preheader ]
  br label %for.inc94.us

for.inc94.us:                                     ; preds = %for.inc94.us, %for.cond78.for.cond82_crit_edge.us.new
  %indvars.iv = phi i64 [ 0, %for.cond78.for.cond82_crit_edge.us.new ], [ %indvars.iv.next.3, %for.inc94.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv46, i64 %indvars.iv
  %15 = bitcast double* %arrayidx89.us to i64*
  %16 = load i64, i64* %15, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv
  %17 = bitcast double* %arrayidx93.us to i64*
  store i64 %16, i64* %17, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next
  %18 = bitcast double* %arrayidx89.us.1 to i64*
  %19 = load i64, i64* %18, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next
  %20 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %19, i64* %20, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %21 = bitcast double* %arrayidx89.us.2 to i64*
  %22 = load i64, i64* %21, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %23 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %22, i64* %23, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %24 = bitcast double* %arrayidx89.us.3 to i64*
  %25 = load i64, i64* %24, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %26 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %25, i64* %26, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %for.cond82.for.inc97_crit_edge.us, label %for.inc94.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.inc94.us
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, 2000
  br i1 %exitcond49, label %for.end99, label %for.cond78.for.cond82_crit_edge.us.new

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  tail call void @free(i8* nonnull %call) #4
  ret void

for.cond30.for.inc41_crit_edge.us.3:              ; preds = %for.cond30.for.inc41_crit_edge.us.3, %for.cond26.for.cond30_crit_edge.us.preheader.new
  %indvars.iv66 = phi i64 [ 0, %for.cond26.for.cond30_crit_edge.us.preheader.new ], [ %indvars.iv.next67.3.1, %for.cond30.for.inc41_crit_edge.us.3 ]
  %27 = mul nuw nsw i64 %indvars.iv66, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next67 = or i64 %indvars.iv66, 1
  %28 = mul nuw nsw i64 %indvars.iv.next67, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next67.1 = or i64 %indvars.iv66, 2
  %29 = mul nuw nsw i64 %indvars.iv.next67.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next67.2 = or i64 %indvars.iv66, 3
  %30 = mul nuw nsw i64 %indvars.iv.next67.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next67.3 = or i64 %indvars.iv66, 4
  %31 = mul nuw nsw i64 %indvars.iv.next67.3, 16000
  %scevgep.14 = getelementptr i8, i8* %call, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.14, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next67.15 = or i64 %indvars.iv66, 5
  %32 = mul nuw nsw i64 %indvars.iv.next67.15, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next67.1.1 = or i64 %indvars.iv66, 6
  %33 = mul nuw nsw i64 %indvars.iv.next67.1.1, 16000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next67.2.1 = or i64 %indvars.iv66, 7
  %34 = mul nuw nsw i64 %indvars.iv.next67.2.1, 16000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next67.3.1 = add nsw i64 %indvars.iv66, 8
  %exitcond69.3.1 = icmp eq i64 %indvars.iv.next67.3.1, 2000
  br i1 %exitcond69.3.1, label %for.cond48.for.cond52_crit_edge.us.us.preheader.preheader, label %for.cond30.for.inc41_crit_edge.us.3

for.cond48.for.cond52_crit_edge.us.us.preheader.preheader: ; preds = %for.cond30.for.inc41_crit_edge.us.3
  %35 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond48.for.cond52_crit_edge.us.us.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture %A) unnamed_addr #2 {
for.cond.for.cond1_crit_edge.preheader:
  br label %for.cond.for.cond1_crit_edge

for.cond.for.cond1_crit_edge:                     ; preds = %for.inc54, %for.cond.for.cond1_crit_edge.preheader
  %indvars.iv39 = phi i64 [ 0, %for.cond.for.cond1_crit_edge.preheader ], [ %indvars.iv.next40, %for.inc54 ]
  %cmp26 = icmp sgt i64 %indvars.iv39, 0
  br i1 %cmp26, label %for.cond1.for.cond4_crit_edge.preheader, label %for.inc54

for.cond1.for.cond4_crit_edge.preheader:          ; preds = %for.cond.for.cond1_crit_edge
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 0
  br label %for.cond1.for.cond4_crit_edge

for.cond28.for.cond31_crit_edge.us.preheader:     ; preds = %for.inc25
  %xtraiter43 = and i64 %indvars.iv39, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 0
  %0 = icmp eq i64 %xtraiter43, 0
  %1 = icmp eq i64 %indvars.iv39, 1
  br label %for.cond28.for.cond31_crit_edge.us

for.cond28.for.cond31_crit_edge.us:               ; preds = %for.cond31.for.inc51_crit_edge.us, %for.cond28.for.cond31_crit_edge.us.preheader
  %indvars.iv35 = phi i64 [ %indvars.iv39, %for.cond28.for.cond31_crit_edge.us.preheader ], [ %indvars.iv.next36, %for.cond31.for.inc51_crit_edge.us ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv35
  %.pre17 = load double, double* %arrayidx46.us, align 8
  br i1 %0, label %for.inc48.us.prol.loopexit, label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.cond28.for.cond31_crit_edge.us
  %2 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv35
  %3 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %2, %3
  %sub47.us.prol = fsub double %.pre17, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.cond28.for.cond31_crit_edge.us, %for.inc48.us.prol
  %indvars.iv28.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.cond28.for.cond31_crit_edge.us ]
  %.unr45.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre17, %for.cond28.for.cond31_crit_edge.us ]
  br i1 %1, label %for.cond31.for.inc51_crit_edge.us, label %for.inc48.us.preheader

for.inc48.us.preheader:                           ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.preheader, %for.inc48.us
  %indvars.iv28 = phi i64 [ %indvars.iv.next29.1, %for.inc48.us ], [ %indvars.iv28.unr.ph, %for.inc48.us.preheader ]
  %4 = phi double [ %sub47.us.1, %for.inc48.us ], [ %.unr45.ph, %for.inc48.us.preheader ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv28
  %5 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv35
  %6 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %5, %6
  %sub47.us = fsub double %4, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv.next29
  %7 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next29, i64 %indvars.iv35
  %8 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %7, %8
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next29.1 = add nuw nsw i64 %indvars.iv28, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next29.1, %indvars.iv39
  br i1 %exitcond32.1, label %for.cond31.for.inc51_crit_edge.us.loopexit, label %for.inc48.us

for.cond31.for.inc51_crit_edge.us.loopexit:       ; preds = %for.inc48.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.cond31.for.inc51_crit_edge.us.loopexit, %for.inc48.us.prol.loopexit
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 2000
  br i1 %exitcond38, label %for.inc54.loopexit, label %for.cond28.for.cond31_crit_edge.us

for.cond1.for.cond4_crit_edge:                    ; preds = %for.inc25, %for.cond1.for.cond4_crit_edge.preheader
  %indvars.iv21 = phi i64 [ 0, %for.cond1.for.cond4_crit_edge.preheader ], [ %indvars.iv.next22, %for.inc25 ]
  %cmp55 = icmp sgt i64 %indvars.iv21, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv21
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp55, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond1.for.cond4_crit_edge
  %xtraiter = and i64 %indvars.iv21, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %9 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv21
  %10 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %9, %10
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.lr.ph, %for.inc.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.lr.ph ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.lr.ph ]
  %11 = icmp eq i64 %indvars.iv21, 1
  br i1 %11, label %for.inc25, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc ], [ %indvars.iv.unr.ph, %for.inc.preheader ]
  %12 = phi double [ %sub.1, %for.inc ], [ %.unr.ph, %for.inc.preheader ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv
  %13 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv21
  %14 = load double, double* %arrayidx12, align 8
  %mul = fmul double %13, %14
  %sub = fsub double %12, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv21
  %16 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %15, %16
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv21
  br i1 %exitcond.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.cond1.for.cond4_crit_edge
  %17 = phi double [ %.pre, %for.cond1.for.cond4_crit_edge ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv21
  %18 = load double, double* %arrayidx20, align 8
  %div = fdiv double %17, %18
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next22, %indvars.iv39
  br i1 %exitcond26, label %for.cond28.for.cond31_crit_edge.us.preheader, label %for.cond1.for.cond4_crit_edge

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond.for.cond1_crit_edge
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 2000
  br i1 %exitcond42, label %for.end56, label %for.cond.for.cond1_crit_edge

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly %A) unnamed_addr #0 {
for.cond.for.cond2_crit_edge.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond.for.cond2_crit_edge.us

for.cond.for.cond2_crit_edge.us:                  ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond.for.cond2_crit_edge.us.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond.for.cond2_crit_edge.us.preheader ], [ %indvars.iv.next8, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv7, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond.for.cond2_crit_edge.us
  %indvars.iv = phi i64 [ 0, %for.cond.for.cond2_crit_edge.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond11, label %for.end12, label %for.cond.for.cond2_crit_edge.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
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
