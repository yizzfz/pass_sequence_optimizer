; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky([2000 x double]* %arraydecay)
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
  tail call fastcc void @print_array([2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture %A) unnamed_addr #0 {
entry:
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.body3.lr.ph.backedge, %entry
  %indvars.iv48 = phi i64 [ 0, %entry ], [ %indvars.iv.next49, %for.body3.lr.ph.backedge ]
  %indvars.iv46 = phi i64 [ 1, %entry ], [ %indvars.iv46.be, %for.body3.lr.ph.backedge ]
  %0 = mul nuw nsw i64 %indvars.iv48, 2001
  %1 = add nuw nsw i64 %0, 1
  %scevgep44 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %1
  %2 = sub i64 1998, %indvars.iv48
  %3 = shl i64 %2, 3
  %4 = and i64 %3, 34359738360
  br label %for.body3

for.cond8.preheader:                              ; preds = %for.body3
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %cmp911 = icmp slt i64 %indvars.iv.next49, 2000
  br i1 %cmp911, label %for.end18.thread, label %for.end18

for.end18.thread:                                 ; preds = %for.cond8.preheader
  %5 = add nuw nsw i64 %4, 8
  %scevgep4445 = bitcast double* %scevgep44 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep4445, i8 0, i64 %5, i32 8, i1 false)
  %arrayidx2251 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv48
  store double 1.000000e+00, double* %arrayidx2251, align 8
  br label %for.body3.lr.ph.backedge

for.body3.lr.ph.backedge:                         ; preds = %for.end18, %for.end18.thread
  %indvars.iv46.be = add nuw nsw i64 %indvars.iv46, 1
  br label %for.body3.lr.ph

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv33 = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next34, %for.body3 ]
  %6 = sub nsw i64 0, %indvars.iv33
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv33
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next34, %indvars.iv46
  br i1 %exitcond38, label %for.cond8.preheader, label %for.body3

for.end18:                                        ; preds = %for.cond8.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv48
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond50 = icmp eq i64 %indvars.iv.next49, 2000
  br i1 %exitcond50, label %for.end25, label %for.body3.lr.ph.backedge

for.end25:                                        ; preds = %for.end18
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %8 = bitcast i8* %call to [2000 x [2000 x double]]*
  call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 32000000, i32 8, i1 false)
  br label %for.cond48.preheader

for.cond48.preheader:                             ; preds = %for.end74, %for.end25
  %indvars.iv24 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next25, %for.end74 ]
  br label %for.cond52.preheader

for.cond52.preheader:                             ; preds = %for.end71, %for.cond48.preheader
  %indvars.iv21 = phi i64 [ 0, %for.cond48.preheader ], [ %indvars.iv.next22, %for.end71 ]
  %arrayidx59 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv24
  br label %for.body55

for.body55:                                       ; preds = %for.body55, %for.cond52.preheader
  %indvars.iv18 = phi i64 [ 0, %for.cond52.preheader ], [ %indvars.iv.next19.1, %for.body55 ]
  %9 = load double, double* %arrayidx59, align 8
  %arrayidx63 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv24
  %10 = load double, double* %arrayidx63, align 8
  %mul = fmul double %9, %10
  %arrayidx67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv21, i64 %indvars.iv18
  %11 = load double, double* %arrayidx67, align 8
  %add68 = fadd double %11, %mul
  store double %add68, double* %arrayidx67, align 8
  %indvars.iv.next19 = or i64 %indvars.iv18, 1
  %12 = load double, double* %arrayidx59, align 8
  %arrayidx63.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next19, i64 %indvars.iv24
  %13 = load double, double* %arrayidx63.1, align 8
  %mul.1 = fmul double %12, %13
  %arrayidx67.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv21, i64 %indvars.iv.next19
  %14 = load double, double* %arrayidx67.1, align 8
  %add68.1 = fadd double %14, %mul.1
  store double %add68.1, double* %arrayidx67.1, align 8
  %indvars.iv.next19.1 = add nuw nsw i64 %indvars.iv18, 2
  %exitcond20.1 = icmp eq i64 %indvars.iv.next19.1, 2000
  br i1 %exitcond20.1, label %for.end71, label %for.body55

for.end71:                                        ; preds = %for.body55
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 2000
  br i1 %exitcond23, label %for.end74, label %for.cond52.preheader

for.end74:                                        ; preds = %for.end71
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 2000
  br i1 %exitcond26, label %for.cond82.preheader.preheader, label %for.cond48.preheader

for.cond82.preheader.preheader:                   ; preds = %for.end74
  br label %for.cond82.preheader

for.cond82.preheader:                             ; preds = %for.cond82.preheader.preheader, %for.end96
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.end96 ], [ 0, %for.cond82.preheader.preheader ]
  br label %for.body85

for.body85:                                       ; preds = %for.body85, %for.cond82.preheader
  %indvars.iv = phi i64 [ 0, %for.cond82.preheader ], [ %indvars.iv.next.4, %for.body85 ]
  %arrayidx89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv15, i64 %indvars.iv
  %15 = bitcast double* %arrayidx89 to i64*
  %16 = load i64, i64* %15, align 8
  %arrayidx93 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv
  %17 = bitcast double* %arrayidx93 to i64*
  store i64 %16, i64* %17, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv15, i64 %indvars.iv.next
  %18 = bitcast double* %arrayidx89.1 to i64*
  %19 = load i64, i64* %18, align 8
  %arrayidx93.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv.next
  %20 = bitcast double* %arrayidx93.1 to i64*
  store i64 %19, i64* %20, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx89.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv15, i64 %indvars.iv.next.1
  %21 = bitcast double* %arrayidx89.2 to i64*
  %22 = load i64, i64* %21, align 8
  %arrayidx93.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv.next.1
  %23 = bitcast double* %arrayidx93.2 to i64*
  store i64 %22, i64* %23, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx89.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv15, i64 %indvars.iv.next.2
  %24 = bitcast double* %arrayidx89.3 to i64*
  %25 = load i64, i64* %24, align 8
  %arrayidx93.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv.next.2
  %26 = bitcast double* %arrayidx93.3 to i64*
  store i64 %25, i64* %26, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx89.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv15, i64 %indvars.iv.next.3
  %27 = bitcast double* %arrayidx89.4 to i64*
  %28 = load i64, i64* %27, align 8
  %arrayidx93.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv.next.3
  %29 = bitcast double* %arrayidx93.4 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.end96, label %for.body85

for.end96:                                        ; preds = %for.body85
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond17, label %for.end99, label %for.cond82.preheader

for.end99:                                        ; preds = %for.end96
  tail call void @free(i8* nonnull %call) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* nocapture %A) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end47, %entry
  %indvars.iv27 = phi i64 [ 0, %entry ], [ %indvars.iv.next28, %for.end47 ]
  %0 = add i64 %indvars.iv27, -2
  %cmp26 = icmp sgt i64 %indvars.iv27, 0
  br i1 %cmp26, label %for.cond4.preheader.preheader, label %for.cond28.preheader.for.end47_crit_edge

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 0
  br label %for.cond4.preheader

for.cond28.preheader.for.end47_crit_edge:         ; preds = %for.cond1.preheader
  %.pre35 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv27
  br label %for.end47

for.body30.lr.ph:                                 ; preds = %for.end
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv27
  %xtraiter31 = and i64 %indvars.iv27, 1
  %lcmp.mod32 = icmp eq i64 %xtraiter31, 0
  br i1 %lcmp.mod32, label %for.body30.prol.loopexit.unr-lcssa, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.lr.ph
  %1 = load double, double* %arrayidx8.prol, align 8
  %mul39.prol = fmul double %1, %1
  %2 = load double, double* %arrayidx43, align 8
  %sub44.prol = fsub double %2, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  br label %for.body30.prol.loopexit.unr-lcssa

for.body30.prol.loopexit.unr-lcssa:               ; preds = %for.body30.lr.ph, %for.body30.prol.preheader
  %indvars.iv22.unr.ph = phi i64 [ 1, %for.body30.prol.preheader ], [ 0, %for.body30.lr.ph ]
  %3 = icmp eq i64 %indvars.iv27, 1
  br i1 %3, label %for.end47, label %for.body30.lr.ph.new

for.body30.lr.ph.new:                             ; preds = %for.body30.prol.loopexit.unr-lcssa
  %.pre33 = load double, double* %arrayidx43, align 8
  %4 = sub i64 %0, %indvars.iv22.unr.ph
  %5 = lshr i64 %4, 1
  %6 = and i64 %5, 1
  %lcmp.mod3 = icmp eq i64 %6, 0
  br i1 %lcmp.mod3, label %for.body30.prol.preheader1, label %for.body30.prol.loopexit.unr-lcssa6

for.body30.prol.preheader1:                       ; preds = %for.body30.lr.ph.new
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol.preheader1
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv22.unr.ph
  %7 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol4 = fmul double %7, %7
  %sub44.prol5 = fsub double %.pre33, %mul39.prol4
  store double %sub44.prol5, double* %arrayidx43, align 8
  %indvars.iv.next23.prol = add nuw nsw i64 %indvars.iv22.unr.ph, 1
  %arrayidx34.1.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv.next23.prol
  %8 = load double, double* %arrayidx34.1.prol, align 8
  %mul39.1.prol = fmul double %8, %8
  %sub44.1.prol = fsub double %sub44.prol5, %mul39.1.prol
  store double %sub44.1.prol, double* %arrayidx43, align 8
  %indvars.iv.next23.1.prol = or i64 %indvars.iv22.unr.ph, 2
  br label %for.body30.prol.loopexit.unr-lcssa6

for.body30.prol.loopexit.unr-lcssa6:              ; preds = %for.body30.lr.ph.new, %for.body30.prol
  %.unr.ph = phi double [ %sub44.1.prol, %for.body30.prol ], [ %.pre33, %for.body30.lr.ph.new ]
  %indvars.iv22.unr.ph7 = phi i64 [ %indvars.iv.next23.1.prol, %for.body30.prol ], [ %indvars.iv22.unr.ph, %for.body30.lr.ph.new ]
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.unr-lcssa6
  %9 = icmp eq i64 %5, 0
  br i1 %9, label %for.end47.loopexit, label %for.body30.lr.ph.new.new

for.body30.lr.ph.new.new:                         ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.cond4.preheader:                              ; preds = %for.end, %for.cond4.preheader.preheader
  %indvars.iv16 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next17, %for.end ]
  %cmp54 = icmp sgt i64 %indvars.iv16, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv16
  br i1 %cmp54, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv16, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit.unr-lcssa, label %for.body6.prol.preheader

for.body6.prol.preheader:                         ; preds = %for.body6.lr.ph
  %10 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv16, i64 0
  %11 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %10, %11
  %12 = load double, double* %arrayidx16, align 8
  %sub.prol = fsub double %12, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.lr.ph, %for.body6.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol.preheader ], [ 0, %for.body6.lr.ph ]
  %13 = icmp eq i64 %indvars.iv16, 1
  br i1 %13, label %for.end, label %for.body6.lr.ph.new

for.body6.lr.ph.new:                              ; preds = %for.body6.prol.loopexit.unr-lcssa
  %.pre = load double, double* %arrayidx16, align 8
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.lr.ph.new
  %14 = phi double [ %.pre, %for.body6.lr.ph.new ], [ %sub.1, %for.body6 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.lr.ph.new ], [ %indvars.iv.next.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv
  %15 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv
  %16 = load double, double* %arrayidx12, align 8
  %mul = fmul double %15, %16
  %sub = fsub double %14, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv.next
  %17 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv.next
  %18 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %17, %18
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv16
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body6.prol.loopexit.unr-lcssa, %for.cond4.preheader
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv16
  %19 = load double, double* %arrayidx20, align 8
  %20 = load double, double* %arrayidx16, align 8
  %div = fdiv double %20, %19
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next17, %indvars.iv27
  br i1 %exitcond21, label %for.body30.lr.ph, label %for.cond4.preheader

for.body30:                                       ; preds = %for.body30, %for.body30.lr.ph.new.new
  %21 = phi double [ %.unr.ph, %for.body30.lr.ph.new.new ], [ %sub44.1.1, %for.body30 ]
  %indvars.iv22 = phi i64 [ %indvars.iv22.unr.ph7, %for.body30.lr.ph.new.new ], [ %indvars.iv.next23.1.1, %for.body30 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv22
  %22 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %22, %22
  %sub44 = fsub double %21, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv.next23
  %23 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %23, %23
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next23.1 = add nuw nsw i64 %indvars.iv22, 2
  %arrayidx34.18 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv.next23.1
  %24 = load double, double* %arrayidx34.18, align 8
  %mul39.19 = fmul double %24, %24
  %sub44.110 = fsub double %sub44.1, %mul39.19
  store double %sub44.110, double* %arrayidx43, align 8
  %indvars.iv.next23.111 = add nsw i64 %indvars.iv22, 3
  %arrayidx34.1.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv.next23.111
  %25 = load double, double* %arrayidx34.1.1, align 8
  %mul39.1.1 = fmul double %25, %25
  %sub44.1.1 = fsub double %sub44.110, %mul39.1.1
  store double %sub44.1.1, double* %arrayidx43, align 8
  %indvars.iv.next23.1.1 = add nsw i64 %indvars.iv22, 4
  %exitcond26.1.1 = icmp eq i64 %indvars.iv.next23.1.1, %indvars.iv27
  br i1 %exitcond26.1.1, label %for.end47.loopexit.unr-lcssa, label %for.body30

for.end47.loopexit.unr-lcssa:                     ; preds = %for.body30
  br label %for.end47.loopexit

for.end47.loopexit:                               ; preds = %for.body30.prol.loopexit, %for.end47.loopexit.unr-lcssa
  br label %for.end47

for.end47:                                        ; preds = %for.end47.loopexit, %for.body30.prol.loopexit.unr-lcssa, %for.cond28.preheader.for.end47_crit_edge
  %arrayidx51.pre-phi = phi double* [ %.pre35, %for.cond28.preheader.for.end47_crit_edge ], [ %arrayidx43, %for.body30.prol.loopexit.unr-lcssa ], [ %arrayidx43, %for.end47.loopexit ]
  %26 = load double, double* %arrayidx51.pre-phi, align 8
  %call = tail call double @sqrt(double %26) #3
  store double %call, double* %arrayidx51.pre-phi, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next28, 2000
  br i1 %exitcond, label %for.end58, label %for.cond1.preheader

for.end58:                                        ; preds = %for.end47
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body4.lr.ph

for.body4.lr.ph:                                  ; preds = %for.end.for.body4.lr.ph_crit_edge, %entry
  %indvars.iv12 = phi i64 [ 0, %entry ], [ %indvars.iv.next13, %for.end.for.body4.lr.ph_crit_edge ]
  %indvars.iv10 = phi i64 [ 1, %entry ], [ %indvars.iv.next11, %for.end.for.body4.lr.ph_crit_edge ]
  %3 = mul nsw i64 %indvars.iv12, 2000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.body4.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body4.lr.ph ], [ %indvars.iv.next, %if.end ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv10
  br i1 %exitcond, label %for.end, label %for.body4

for.end:                                          ; preds = %if.end
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next13, 2000
  br i1 %exitcond17, label %for.end12, label %for.end.for.body4.lr.ph_crit_edge

for.end.for.body4.lr.ph_crit_edge:                ; preds = %for.end
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  br label %for.body4.lr.ph

for.end12:                                        ; preds = %for.end
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

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
