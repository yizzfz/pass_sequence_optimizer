; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %A = alloca [2000 x [2000 x double]]*, align 8
  %b = alloca [2000 x double]*, align 8
  %x = alloca [2000 x double]*, align 8
  %y = alloca [2000 x double]*, align 8
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 2000, i32* %n, align 4
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %0 = bitcast [2000 x [2000 x double]]** %A to i8**
  store i8* %call, i8** %0, align 8
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %1 = bitcast [2000 x double]** %b to i8**
  store i8* %call1, i8** %1, align 8
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %2 = bitcast [2000 x double]** %x to i8**
  store i8* %call2, i8** %2, align 8
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %3 = bitcast [2000 x double]** %y to i8**
  store i8* %call3, i8** %3, align 8
  %4 = load i32, i32* %n, align 4
  %5 = bitcast [2000 x [2000 x double]]** %A to [2000 x double]**
  %6 = load [2000 x double]*, [2000 x double]** %5, align 8
  %7 = bitcast [2000 x double]** %b to double**
  %8 = load double*, double** %7, align 8
  %9 = bitcast [2000 x double]** %x to double**
  %10 = load double*, double** %9, align 8
  %11 = bitcast [2000 x double]** %y to double**
  %12 = load double*, double** %11, align 8
  tail call fastcc void @init_array(i32 %4, [2000 x double]* %6, double* %8, double* %10, double* %12)
  tail call void (...) @polybench_timer_start() #5
  %13 = load i32, i32* %n, align 4
  %14 = bitcast [2000 x [2000 x double]]** %A to [2000 x double]**
  %15 = load [2000 x double]*, [2000 x double]** %14, align 8
  %16 = bitcast [2000 x double]** %b to double**
  %17 = load double*, double** %16, align 8
  %18 = bitcast [2000 x double]** %x to double**
  %19 = load double*, double** %18, align 8
  %20 = bitcast [2000 x double]** %y to double**
  %21 = load double*, double** %20, align 8
  tail call fastcc void @kernel_ludcmp(i32 %13, [2000 x double]* %15, double* %17, double* %19, double* %21)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %22 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %22, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %23 = load i8**, i8*** %argv.addr, align 8
  %24 = load i8*, i8** %23, align 8
  %strcmpload = load i8, i8* %24, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %25 = load i32, i32* %n, align 4
  %26 = bitcast [2000 x double]** %x to double**
  %27 = load double*, double** %26, align 8
  tail call fastcc void @print_array(i32 %25, double* %27)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  %28 = bitcast [2000 x [2000 x double]]** %A to i8**
  %29 = load i8*, i8** %28, align 8
  tail call void @free(i8* %29) #5
  %30 = bitcast [2000 x double]** %b to i8**
  %31 = load i8*, i8** %30, align 8
  tail call void @free(i8* %31) #5
  %32 = bitcast [2000 x double]** %x to i8**
  %33 = load i8*, i8** %32, align 8
  tail call void @free(i8* %33) #5
  %34 = bitcast [2000 x double]** %y to i8**
  %35 = load i8*, i8** %34, align 8
  tail call void @free(i8* %35) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A, double* %b, double* %x, double* %y) unnamed_addr #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [2000 x double]*, align 8
  %b.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %fn = alloca double, align 8
  %r = alloca i32, align 4
  %s = alloca i32, align 4
  %t = alloca i32, align 4
  %B = alloca [2000 x [2000 x double]]*, align 8
  store i32 %n, i32* %n.addr, align 4
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  store double* %b, double** %b.addr, align 8
  store double* %x, double** %x.addr, align 8
  store double* %y, double** %y.addr, align 8
  %conv = sitofp i32 %n to double
  store double %conv, double* %fn, align 8
  store i32 0, i32* %i, align 4
  %0 = load i32, i32* %n.addr, align 4
  %cmp11 = icmp sgt i32 %0, 0
  br i1 %cmp11, label %for.inc.lr.ph, label %for.end.thread

for.end.thread:                                   ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.end46

for.inc.lr.ph:                                    ; preds = %entry
  %1 = load double*, double** %x.addr, align 8
  %2 = load double*, double** %y.addr, align 8
  %3 = load double, double* %fn, align 8
  %4 = load double*, double** %b.addr, align 8
  %5 = load i32, i32* %n.addr, align 4
  %i.promoted66 = load i32, i32* %i, align 4
  %6 = sext i32 %i.promoted66 to i64
  %7 = sext i32 %5 to i64
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv112 = phi i64 [ %6, %for.inc.lr.ph ], [ %indvars.iv.next113, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %1, i64 %indvars.iv112
  store double 0.000000e+00, double* %arrayidx, align 8
  %arrayidx3 = getelementptr inbounds double, double* %2, i64 %indvars.iv112
  store double 0.000000e+00, double* %arrayidx3, align 8
  %indvars.iv.next113 = add nsw i64 %indvars.iv112, 1
  %8 = trunc i64 %indvars.iv.next113 to i32
  %conv4 = sitofp i32 %8 to double
  %div = fdiv double %conv4, %3
  %div5 = fmul double %div, 5.000000e-01
  %add6 = fadd double %div5, 4.000000e+00
  %arrayidx8 = getelementptr inbounds double, double* %4, i64 %indvars.iv112
  store double %add6, double* %arrayidx8, align 8
  %cmp = icmp slt i64 %indvars.iv.next113, %7
  br i1 %cmp, label %for.inc, label %for.end

for.end:                                          ; preds = %for.inc
  %.pr = load i32, i32* %n.addr, align 4
  store i32 0, i32* %i, align 4
  %cmp1010 = icmp sgt i32 %.pr, 0
  br i1 %cmp1010, label %for.body12.lr.ph, label %for.end46

for.body12.lr.ph:                                 ; preds = %for.end
  %9 = load i32, i32* %n.addr, align 4
  %conv18 = sitofp i32 %9 to double
  %10 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  %11 = add i32 %i.promoted, 1
  %12 = sext i32 %i.promoted to i64
  %13 = zext i32 %11 to i64
  %14 = add i32 %9, -2
  %15 = sub i32 %14, %i.promoted
  %16 = zext i32 %15 to i64
  %17 = sext i32 %9 to i64
  %18 = sext i32 %9 to i64
  br label %for.body12

for.body12:                                       ; preds = %for.inc44.for.body12_crit_edge, %for.body12.lr.ph
  %indvars.iv130 = phi i32 [ %indvars.iv.next131, %for.inc44.for.body12_crit_edge ], [ %i.promoted, %for.body12.lr.ph ]
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %for.inc44.for.body12_crit_edge ], [ %12, %for.body12.lr.ph ]
  %indvar105 = phi i64 [ %indvar.next106, %for.inc44.for.body12_crit_edge ], [ 0, %for.body12.lr.ph ]
  %19 = zext i32 %indvars.iv130 to i64
  %20 = add i64 %12, %indvar105
  %21 = add i64 %13, %indvar105
  %sext = shl i64 %21, 32
  %22 = ashr exact i64 %sext, 32
  %scevgep108 = getelementptr [2000 x double], [2000 x double]* %10, i64 %20, i64 %22
  %23 = sub i64 %16, %indvar105
  %24 = shl i64 %23, 3
  %25 = and i64 %24, 34359738360
  %26 = add nuw nsw i64 %25, 8
  %cmp148 = icmp sgt i64 %indvars.iv110, -1
  br i1 %cmp148, label %for.inc25.preheader, label %for.end27

for.inc25.preheader:                              ; preds = %for.body12
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.preheader, %for.inc25
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %for.inc25 ], [ 0, %for.inc25.preheader ]
  %27 = sub nsw i64 0, %indvars.iv92
  %28 = trunc i64 %27 to i32
  %rem = srem i32 %28, %9
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, %conv18
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv110, i64 %indvars.iv92
  store double %add20, double* %arrayidx24, align 8
  %exitcond132 = icmp eq i64 %indvars.iv92, %19
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  br i1 %exitcond132, label %for.end27.loopexit, label %for.inc25

for.end27.loopexit:                               ; preds = %for.inc25
  br label %for.end27

for.end27:                                        ; preds = %for.end27.loopexit, %for.body12
  %indvars.iv.next111 = add i64 %indvars.iv110, 1
  %cmp309 = icmp slt i64 %indvars.iv.next111, %18
  br i1 %cmp309, label %for.inc37.for.inc44_crit_edge, label %for.inc44

for.inc37.for.inc44_crit_edge:                    ; preds = %for.end27
  %29 = bitcast double* %scevgep108 to i8*
  call void @llvm.memset.p0i8.i64(i8* %29, i8 0, i64 %26, i32 8, i1 false)
  br label %for.inc44

for.inc44:                                        ; preds = %for.end27, %for.inc37.for.inc44_crit_edge
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv110, i64 %indvars.iv110
  store double 1.000000e+00, double* %arrayidx43, align 8
  %cmp10 = icmp slt i64 %indvars.iv.next111, %17
  br i1 %cmp10, label %for.inc44.for.body12_crit_edge, label %for.cond9.for.end46_crit_edge

for.inc44.for.body12_crit_edge:                   ; preds = %for.inc44
  %indvars.iv.next131 = add i32 %indvars.iv130, 1
  %indvar.next106 = add i64 %indvar105, 1
  br label %for.body12

for.cond9.for.end46_crit_edge:                    ; preds = %for.inc44
  %30 = trunc i64 %indvars.iv.next111 to i32
  store i32 %30, i32* %i, align 4
  br label %for.end46

for.end46:                                        ; preds = %for.end, %for.end.thread, %for.cond9.for.end46_crit_edge
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %31 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %31, align 8
  store i32 0, i32* %r, align 4
  %32 = load i32, i32* %n.addr, align 4
  %cmp487 = icmp sgt i32 %32, 0
  br i1 %cmp487, label %for.body50.lr.ph, label %for.end64.thread

for.end64.thread:                                 ; preds = %for.end46
  store i32 0, i32* %t, align 4
  br label %for.end98

for.body50.lr.ph:                                 ; preds = %for.end46
  %33 = load i32, i32* %n.addr, align 4
  %34 = sext i32 %33 to i64
  %35 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %r.promoted57 = load i32, i32* %r, align 4
  %36 = sext i32 %r.promoted57 to i64
  %cmp526 = icmp sgt i32 %33, 0
  br i1 %cmp526, label %for.body50.lr.ph.for.body50.us_crit_edge, label %for.body50.for.cond47.for.end64_crit_edge_crit_edge

for.body50.lr.ph.for.body50.us_crit_edge:         ; preds = %for.body50.lr.ph
  %37 = add i32 %33, -1
  %38 = zext i32 %37 to i64
  %39 = shl nuw nsw i64 %38, 3
  %40 = add nuw nsw i64 %39, 8
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us, %for.body50.lr.ph.for.body50.us_crit_edge
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %for.inc62.us ], [ %36, %for.body50.lr.ph.for.body50.us_crit_edge ]
  %indvar = phi i64 [ %indvar.next, %for.inc62.us ], [ 0, %for.body50.lr.ph.for.body50.us_crit_edge ]
  %41 = add nsw i64 %36, %indvar
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %41, i64 0
  %scevgep88 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88, i8 0, i64 %40, i32 8, i1 false)
  %indvars.iv.next90 = add nsw i64 %indvars.iv89, 1
  %cmp48.us = icmp slt i64 %indvars.iv.next90, %34
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %cmp48.us, label %for.inc62.us, label %for.inc62.us.for.cond47.for.end64_crit_edge_crit_edge

for.inc62.us.for.cond47.for.end64_crit_edge_crit_edge: ; preds = %for.inc62.us
  %42 = trunc i64 %indvars.iv.next90 to i32
  br label %for.end64

for.body50.for.cond47.for.end64_crit_edge_crit_edge: ; preds = %for.body50.lr.ph
  %43 = add i32 %r.promoted57, 1
  %44 = icmp sgt i32 %33, %43
  %smax91 = select i1 %44, i32 %33, i32 %43
  br label %for.end64

for.end64:                                        ; preds = %for.inc62.us.for.cond47.for.end64_crit_edge_crit_edge, %for.body50.for.cond47.for.end64_crit_edge_crit_edge
  %inc60.lcssa60.lcssa = phi i32 [ %33, %for.inc62.us.for.cond47.for.end64_crit_edge_crit_edge ], [ 0, %for.body50.for.cond47.for.end64_crit_edge_crit_edge ]
  %inc63.lcssa = phi i32 [ %42, %for.inc62.us.for.cond47.for.end64_crit_edge_crit_edge ], [ %smax91, %for.body50.for.cond47.for.end64_crit_edge_crit_edge ]
  store i32 %inc63.lcssa, i32* %r, align 4
  store i32 %inc60.lcssa60.lcssa, i32* %s, align 4
  %.pr120 = load i32, i32* %n.addr, align 4
  store i32 0, i32* %t, align 4
  %cmp665 = icmp sgt i32 %.pr120, 0
  br i1 %cmp665, label %for.body68.lr.ph, label %for.end98.thread

for.end98.thread:                                 ; preds = %for.end64
  store i32 0, i32* %r, align 4
  br label %for.end120

for.body68.lr.ph:                                 ; preds = %for.end64
  %45 = load i32, i32* %n.addr, align 4
  %46 = sext i32 %45 to i64
  %47 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %48 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %t.promoted = load i32, i32* %t, align 4
  %49 = sext i32 %t.promoted to i64
  %cmp704 = icmp sgt i32 %45, 0
  br i1 %cmp704, label %for.body68.lr.ph.for.body68.us_crit_edge, label %for.body68.for.cond65.for.end98_crit_edge_crit_edge

for.body68.lr.ph.for.body68.us_crit_edge:         ; preds = %for.body68.lr.ph
  %50 = add i32 %45, -1
  %51 = zext i32 %50 to i64
  %52 = add nuw nsw i64 %51, 1
  %53 = add nsw i64 %49, 1
  %54 = add nuw nsw i64 %51, 1
  %55 = icmp sgt i32 %45, 0
  %min.iters.check = icmp ult i64 %52, 4
  %n.vec = and i64 %52, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %52, %n.vec
  br label %for.body68.us

for.body68.us:                                    ; preds = %for.inc96.us, %for.body68.lr.ph.for.body68.us_crit_edge
  %indvar141 = phi i64 [ %indvar.next142, %for.inc96.us ], [ 0, %for.body68.lr.ph.for.body68.us_crit_edge ]
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %for.inc96.us ], [ %49, %for.body68.lr.ph.for.body68.us_crit_edge ]
  %56 = add i64 %49, %indvar141
  %scevgep143 = getelementptr [2000 x double], [2000 x double]* %47, i64 0, i64 %56
  %57 = add i64 %53, %indvar141
  %scevgep145 = getelementptr [2000 x double], [2000 x double]* %47, i64 %51, i64 %57
  br i1 %55, label %for.body72.us.us.preheader, label %for.inc96.us

for.body72.us.us.preheader:                       ; preds = %for.body68.us
  br label %for.body72.us.us

for.inc96.us.loopexit:                            ; preds = %for.inc93.us.us
  br label %for.inc96.us

for.inc96.us:                                     ; preds = %for.inc96.us.loopexit, %for.body68.us
  %inc91.lcssa20.lcssa.us = phi i32 [ 0, %for.body68.us ], [ %45, %for.inc96.us.loopexit ]
  %indvars.iv.next82 = add nsw i64 %indvars.iv81, 1
  %cmp66.us = icmp slt i64 %indvars.iv.next82, %46
  %indvar.next142 = add i64 %indvar141, 1
  br i1 %cmp66.us, label %for.body68.us, label %for.inc96.us.for.cond65.for.end98_crit_edge_crit_edge

for.inc96.us.for.cond65.for.end98_crit_edge_crit_edge: ; preds = %for.inc96.us
  %58 = trunc i64 %indvars.iv.next82 to i32
  br label %for.cond65.for.end98_crit_edge

for.body72.us.us:                                 ; preds = %for.body72.us.us.preheader, %for.inc93.us.us
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %for.inc93.us.us ], [ 0, %for.body72.us.us.preheader ]
  %scevgep137 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv79, i64 0
  %scevgep139 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv79, i64 %52
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %47, i64 %indvars.iv79, i64 %indvars.iv81
  br i1 %min.iters.check, label %for.inc90.us.us.preheader, label %min.iters.checked

for.inc90.us.us.preheader:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body72.us.us
  %indvars.iv75.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.body72.us.us ], [ %n.vec, %middle.block ]
  %59 = sub nsw i64 %54, %indvars.iv75.ph
  %xtraiter190 = and i64 %59, 1
  %lcmp.mod191 = icmp eq i64 %xtraiter190, 0
  br i1 %lcmp.mod191, label %for.inc90.us.us.prol.loopexit, label %for.inc90.us.us.prol

for.inc90.us.us.prol:                             ; preds = %for.inc90.us.us.preheader
  %60 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %47, i64 %indvars.iv75.ph, i64 %indvars.iv81
  %61 = load double, double* %arrayidx84.us.us.prol, align 8
  %mul.us.us.prol = fmul double %60, %61
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv79, i64 %indvars.iv75.ph
  %62 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %mul.us.us.prol, %62
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  %indvars.iv.next76.prol = or i64 %indvars.iv75.ph, 1
  br label %for.inc90.us.us.prol.loopexit

for.inc90.us.us.prol.loopexit:                    ; preds = %for.inc90.us.us.prol, %for.inc90.us.us.preheader
  %indvars.iv75.unr.ph = phi i64 [ %indvars.iv.next76.prol, %for.inc90.us.us.prol ], [ %indvars.iv75.ph, %for.inc90.us.us.preheader ]
  %63 = icmp eq i64 %51, %indvars.iv75.ph
  br i1 %63, label %for.inc93.us.us, label %for.inc90.us.us.preheader.new

for.inc90.us.us.preheader.new:                    ; preds = %for.inc90.us.us.prol.loopexit
  br label %for.inc90.us.us

min.iters.checked:                                ; preds = %for.body72.us.us
  br i1 %cmp.zero, label %for.inc90.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep137, %scevgep145
  %bound1 = icmp ult double* %scevgep143, %scevgep139
  %found.conflict = and i1 %bound0, %bound1
  %bound0148 = icmp ult double* %scevgep137, %arrayidx80.us.us
  %bound1149 = icmp ult double* %arrayidx80.us.us, %scevgep139
  %found.conflict150 = and i1 %bound0148, %bound1149
  %conflict.rdx = or i1 %found.conflict, %found.conflict150
  br i1 %conflict.rdx, label %for.inc90.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %64 = or i64 %index, 1
  %65 = or i64 %index, 2
  %66 = or i64 %index, 3
  %67 = load double, double* %arrayidx80.us.us, align 8, !alias.scope !1
  %68 = insertelement <2 x double> undef, double %67, i32 0
  %69 = shufflevector <2 x double> %68, <2 x double> undef, <2 x i32> zeroinitializer
  %70 = insertelement <2 x double> undef, double %67, i32 0
  %71 = shufflevector <2 x double> %70, <2 x double> undef, <2 x i32> zeroinitializer
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %47, i64 %index, i64 %indvars.iv81
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %47, i64 %64, i64 %indvars.iv81
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %47, i64 %65, i64 %indvars.iv81
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %47, i64 %66, i64 %indvars.iv81
  %76 = load double, double* %72, align 8, !alias.scope !4
  %77 = load double, double* %73, align 8, !alias.scope !4
  %78 = load double, double* %74, align 8, !alias.scope !4
  %79 = load double, double* %75, align 8, !alias.scope !4
  %80 = insertelement <2 x double> undef, double %76, i32 0
  %81 = insertelement <2 x double> %80, double %77, i32 1
  %82 = insertelement <2 x double> undef, double %78, i32 0
  %83 = insertelement <2 x double> %82, double %79, i32 1
  %84 = fmul <2 x double> %69, %81
  %85 = fmul <2 x double> %71, %83
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv79, i64 %index
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !6, !noalias !8
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load152 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !6, !noalias !8
  %90 = fadd <2 x double> %84, %wide.load
  %91 = fadd <2 x double> %85, %wide.load152
  %92 = bitcast double* %86 to <2 x double>*
  store <2 x double> %90, <2 x double>* %92, align 8, !alias.scope !6, !noalias !8
  %93 = bitcast double* %88 to <2 x double>*
  store <2 x double> %91, <2 x double>* %93, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %94 = icmp eq i64 %index.next, %n.vec
  br i1 %94, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc93.us.us, label %for.inc90.us.us.preheader

for.inc93.us.us.loopexit:                         ; preds = %for.inc90.us.us
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit, %for.inc90.us.us.prol.loopexit, %middle.block
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next80, %46
  br i1 %exitcond126, label %for.inc96.us.loopexit, label %for.body72.us.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us, %for.inc90.us.us.preheader.new
  %indvars.iv75 = phi i64 [ %indvars.iv75.unr.ph, %for.inc90.us.us.preheader.new ], [ %indvars.iv.next76.1, %for.inc90.us.us ]
  %95 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %47, i64 %indvars.iv75, i64 %indvars.iv81
  %96 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %95, %96
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv79, i64 %indvars.iv75
  %97 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %mul.us.us, %97
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %98 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %47, i64 %indvars.iv.next76, i64 %indvars.iv81
  %99 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %98, %99
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv79, i64 %indvars.iv.next76
  %100 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %mul.us.us.1, %100
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next76, %51
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75, 2
  br i1 %exitcond.1, label %for.inc93.us.us.loopexit, label %for.inc90.us.us, !llvm.loop !12

for.body68.for.cond65.for.end98_crit_edge_crit_edge: ; preds = %for.body68.lr.ph
  %s.promoted = load i32, i32* %s, align 4
  %101 = add i32 %t.promoted, 1
  %102 = icmp sgt i32 %45, %101
  %smax83 = select i1 %102, i32 %45, i32 %101
  br label %for.cond65.for.end98_crit_edge

for.cond65.for.end98_crit_edge:                   ; preds = %for.body68.for.cond65.for.end98_crit_edge_crit_edge, %for.inc96.us.for.cond65.for.end98_crit_edge_crit_edge
  %inc91.lcssa20.lcssa25.lcssa = phi i32 [ %inc91.lcssa20.lcssa.us, %for.inc96.us.for.cond65.for.end98_crit_edge_crit_edge ], [ %s.promoted, %for.body68.for.cond65.for.end98_crit_edge_crit_edge ]
  %inc97.lcssa = phi i32 [ %58, %for.inc96.us.for.cond65.for.end98_crit_edge_crit_edge ], [ %smax83, %for.body68.for.cond65.for.end98_crit_edge_crit_edge ]
  %inc94.lcssa22.lcssa = phi i32 [ %45, %for.inc96.us.for.cond65.for.end98_crit_edge_crit_edge ], [ 0, %for.body68.for.cond65.for.end98_crit_edge_crit_edge ]
  store i32 %inc94.lcssa22.lcssa, i32* %r, align 4
  store i32 %inc97.lcssa, i32* %t, align 4
  store i32 %inc91.lcssa20.lcssa25.lcssa, i32* %s, align 4
  br label %for.end98

for.end98:                                        ; preds = %for.end64.thread, %for.cond65.for.end98_crit_edge
  %.pr122 = load i32, i32* %n.addr, align 4
  store i32 0, i32* %r, align 4
  %cmp1002 = icmp sgt i32 %.pr122, 0
  br i1 %cmp1002, label %for.body102.lr.ph, label %for.end120

for.body102.lr.ph:                                ; preds = %for.end98
  %103 = load i32, i32* %n.addr, align 4
  %104 = sext i32 %103 to i64
  %105 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %106 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %r.promoted = load i32, i32* %r, align 4
  %107 = sext i32 %r.promoted to i64
  %cmp1041 = icmp sgt i32 %103, 0
  br i1 %cmp1041, label %for.body102.lr.ph.for.body102.us_crit_edge, label %for.body102.for.cond99.for.end120_crit_edge_crit_edge

for.body102.lr.ph.for.body102.us_crit_edge:       ; preds = %for.body102.lr.ph
  %108 = add i32 %103, -1
  %109 = zext i32 %108 to i64
  %110 = add nuw nsw i64 %109, 1
  %111 = and i64 %110, 8589934588
  %112 = add nsw i64 %111, -4
  %113 = lshr exact i64 %112, 2
  %114 = add nuw nsw i64 %109, 1
  %min.iters.check156 = icmp ult i64 %110, 4
  %n.vec159 = and i64 %110, 8589934588
  %cmp.zero160 = icmp eq i64 %n.vec159, 0
  %115 = and i64 %113, 1
  %lcmp.mod = icmp eq i64 %115, 0
  %116 = icmp eq i64 %113, 0
  %cmp.n181 = icmp eq i64 %110, %n.vec159
  br label %for.body102.us

for.body102.us:                                   ; preds = %for.inc118.us, %for.body102.lr.ph.for.body102.us_crit_edge
  %indvar162 = phi i64 [ %indvar.next163, %for.inc118.us ], [ 0, %for.body102.lr.ph.for.body102.us_crit_edge ]
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %for.inc118.us ], [ %107, %for.body102.lr.ph.for.body102.us_crit_edge ]
  %117 = add i64 %107, %indvar162
  %scevgep164 = getelementptr [2000 x double], [2000 x double]* %106, i64 %117, i64 0
  %scevgep166 = getelementptr [2000 x double], [2000 x double]* %106, i64 %117, i64 %110
  %scevgep168 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %117, i64 0
  %scevgep170 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %117, i64 %110
  br i1 %min.iters.check156, label %for.inc115.us.preheader, label %min.iters.checked157

min.iters.checked157:                             ; preds = %for.body102.us
  br i1 %cmp.zero160, label %for.inc115.us.preheader, label %vector.memcheck176

vector.memcheck176:                               ; preds = %min.iters.checked157
  %bound0172 = icmp ult double* %scevgep164, %scevgep170
  %bound1173 = icmp ult double* %scevgep168, %scevgep166
  %memcheck.conflict175 = and i1 %bound0172, %bound1173
  br i1 %memcheck.conflict175, label %for.inc115.us.preheader, label %vector.body153.preheader

vector.body153.preheader:                         ; preds = %vector.memcheck176
  br i1 %lcmp.mod, label %vector.body153.prol, label %vector.body153.prol.loopexit

vector.body153.prol:                              ; preds = %vector.body153.preheader
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv72, i64 0
  %119 = bitcast double* %118 to <2 x i64>*
  %wide.load186.prol = load <2 x i64>, <2 x i64>* %119, align 8, !alias.scope !13
  %120 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv72, i64 2
  %121 = bitcast double* %120 to <2 x i64>*
  %wide.load187.prol = load <2 x i64>, <2 x i64>* %121, align 8, !alias.scope !13
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %106, i64 %indvars.iv72, i64 0
  %123 = bitcast double* %122 to <2 x i64>*
  store <2 x i64> %wide.load186.prol, <2 x i64>* %123, align 8, !alias.scope !16, !noalias !13
  %124 = getelementptr [2000 x double], [2000 x double]* %106, i64 %indvars.iv72, i64 2
  %125 = bitcast double* %124 to <2 x i64>*
  store <2 x i64> %wide.load187.prol, <2 x i64>* %125, align 8, !alias.scope !16, !noalias !13
  br label %vector.body153.prol.loopexit

vector.body153.prol.loopexit:                     ; preds = %vector.body153.prol, %vector.body153.preheader
  %index178.unr.ph = phi i64 [ 4, %vector.body153.prol ], [ 0, %vector.body153.preheader ]
  br i1 %116, label %middle.block154, label %vector.body153.preheader.new

vector.body153.preheader.new:                     ; preds = %vector.body153.prol.loopexit
  br label %vector.body153

vector.body153:                                   ; preds = %vector.body153, %vector.body153.preheader.new
  %index178 = phi i64 [ %index178.unr.ph, %vector.body153.preheader.new ], [ %index.next179.1, %vector.body153 ]
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv72, i64 %index178
  %127 = bitcast double* %126 to <2 x i64>*
  %wide.load186 = load <2 x i64>, <2 x i64>* %127, align 8, !alias.scope !13
  %128 = getelementptr double, double* %126, i64 2
  %129 = bitcast double* %128 to <2 x i64>*
  %wide.load187 = load <2 x i64>, <2 x i64>* %129, align 8, !alias.scope !13
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %106, i64 %indvars.iv72, i64 %index178
  %131 = bitcast double* %130 to <2 x i64>*
  store <2 x i64> %wide.load186, <2 x i64>* %131, align 8, !alias.scope !16, !noalias !13
  %132 = getelementptr double, double* %130, i64 2
  %133 = bitcast double* %132 to <2 x i64>*
  store <2 x i64> %wide.load187, <2 x i64>* %133, align 8, !alias.scope !16, !noalias !13
  %index.next179 = add i64 %index178, 4
  %134 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv72, i64 %index.next179
  %135 = bitcast double* %134 to <2 x i64>*
  %wide.load186.1 = load <2 x i64>, <2 x i64>* %135, align 8, !alias.scope !13
  %136 = getelementptr double, double* %134, i64 2
  %137 = bitcast double* %136 to <2 x i64>*
  %wide.load187.1 = load <2 x i64>, <2 x i64>* %137, align 8, !alias.scope !13
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %106, i64 %indvars.iv72, i64 %index.next179
  %139 = bitcast double* %138 to <2 x i64>*
  store <2 x i64> %wide.load186.1, <2 x i64>* %139, align 8, !alias.scope !16, !noalias !13
  %140 = getelementptr double, double* %138, i64 2
  %141 = bitcast double* %140 to <2 x i64>*
  store <2 x i64> %wide.load187.1, <2 x i64>* %141, align 8, !alias.scope !16, !noalias !13
  %index.next179.1 = add i64 %index178, 8
  %142 = icmp eq i64 %index.next179.1, %n.vec159
  br i1 %142, label %middle.block154.loopexit, label %vector.body153, !llvm.loop !18

middle.block154.loopexit:                         ; preds = %vector.body153
  br label %middle.block154

middle.block154:                                  ; preds = %middle.block154.loopexit, %vector.body153.prol.loopexit
  br i1 %cmp.n181, label %for.inc118.us, label %for.inc115.us.preheader

for.inc115.us.preheader:                          ; preds = %middle.block154, %vector.memcheck176, %min.iters.checked157, %for.body102.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck176 ], [ 0, %min.iters.checked157 ], [ 0, %for.body102.us ], [ %n.vec159, %middle.block154 ]
  %143 = sub nsw i64 %114, %indvars.iv.ph
  %144 = sub nsw i64 %109, %indvars.iv.ph
  %xtraiter188 = and i64 %143, 3
  %lcmp.mod189 = icmp eq i64 %xtraiter188, 0
  br i1 %lcmp.mod189, label %for.inc115.us.prol.loopexit, label %for.inc115.us.prol.preheader

for.inc115.us.prol.preheader:                     ; preds = %for.inc115.us.preheader
  br label %for.inc115.us.prol

for.inc115.us.prol:                               ; preds = %for.inc115.us.prol, %for.inc115.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc115.us.prol ], [ %indvars.iv.ph, %for.inc115.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc115.us.prol ], [ %xtraiter188, %for.inc115.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv72, i64 %indvars.iv.prol
  %145 = bitcast double* %arrayidx110.us.prol to i64*
  %146 = load i64, i64* %145, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %106, i64 %indvars.iv72, i64 %indvars.iv.prol
  %147 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %146, i64* %147, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc115.us.prol.loopexit.loopexit, label %for.inc115.us.prol, !llvm.loop !19

for.inc115.us.prol.loopexit.loopexit:             ; preds = %for.inc115.us.prol
  br label %for.inc115.us.prol.loopexit

for.inc115.us.prol.loopexit:                      ; preds = %for.inc115.us.prol.loopexit.loopexit, %for.inc115.us.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.inc115.us.preheader ], [ %indvars.iv.next.prol, %for.inc115.us.prol.loopexit.loopexit ]
  %148 = icmp ult i64 %144, 3
  br i1 %148, label %for.inc118.us, label %for.inc115.us.preheader.new

for.inc115.us.preheader.new:                      ; preds = %for.inc115.us.prol.loopexit
  br label %for.inc115.us

for.inc115.us:                                    ; preds = %for.inc115.us, %for.inc115.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc115.us.preheader.new ], [ %indvars.iv.next.3, %for.inc115.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv72, i64 %indvars.iv
  %149 = bitcast double* %arrayidx110.us to i64*
  %150 = load i64, i64* %149, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %106, i64 %indvars.iv72, i64 %indvars.iv
  %151 = bitcast double* %arrayidx114.us to i64*
  store i64 %150, i64* %151, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv72, i64 %indvars.iv.next
  %152 = bitcast double* %arrayidx110.us.1 to i64*
  %153 = load i64, i64* %152, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %106, i64 %indvars.iv72, i64 %indvars.iv.next
  %154 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %153, i64* %154, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv72, i64 %indvars.iv.next.1
  %155 = bitcast double* %arrayidx110.us.2 to i64*
  %156 = load i64, i64* %155, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %106, i64 %indvars.iv72, i64 %indvars.iv.next.1
  %157 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %156, i64* %157, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv72, i64 %indvars.iv.next.2
  %158 = bitcast double* %arrayidx110.us.3 to i64*
  %159 = load i64, i64* %158, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %106, i64 %indvars.iv72, i64 %indvars.iv.next.2
  %160 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %159, i64* %160, align 8
  %exitcond124.3 = icmp eq i64 %indvars.iv.next.2, %109
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond124.3, label %for.inc118.us.loopexit, label %for.inc115.us, !llvm.loop !21

for.inc118.us.loopexit:                           ; preds = %for.inc115.us
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit, %for.inc115.us.prol.loopexit, %middle.block154
  %indvars.iv.next73 = add nsw i64 %indvars.iv72, 1
  %cmp100.us = icmp slt i64 %indvars.iv.next73, %104
  %indvar.next163 = add i64 %indvar162, 1
  br i1 %cmp100.us, label %for.body102.us, label %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge

for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge: ; preds = %for.inc118.us
  %161 = trunc i64 %indvars.iv.next73 to i32
  br label %for.cond99.for.end120_crit_edge

for.body102.for.cond99.for.end120_crit_edge_crit_edge: ; preds = %for.body102.lr.ph
  %162 = add i32 %r.promoted, 1
  %163 = icmp sgt i32 %103, %162
  %smax = select i1 %163, i32 %103, i32 %162
  br label %for.cond99.for.end120_crit_edge

for.cond99.for.end120_crit_edge:                  ; preds = %for.body102.for.cond99.for.end120_crit_edge_crit_edge, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge
  %inc116.lcssa15.lcssa = phi i32 [ %103, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge ], [ 0, %for.body102.for.cond99.for.end120_crit_edge_crit_edge ]
  %inc119.lcssa = phi i32 [ %161, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge ], [ %smax, %for.body102.for.cond99.for.end120_crit_edge_crit_edge ]
  store i32 %inc119.lcssa, i32* %r, align 4
  store i32 %inc116.lcssa15.lcssa, i32* %s, align 4
  br label %for.end120

for.end120:                                       ; preds = %for.end98, %for.end98.thread, %for.cond99.for.end120_crit_edge
  %164 = bitcast [2000 x [2000 x double]]** %B to i8**
  %165 = load i8*, i8** %164, align 8
  tail call void @free(i8* %165) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32 %n, [2000 x double]* %A, double* %b, double* %x, double* %y) unnamed_addr #2 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [2000 x double]*, align 8
  %b.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %w = alloca double, align 8
  store i32 %n, i32* %n.addr, align 4
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  store double* %b, double** %b.addr, align 8
  store double* %x, double** %x.addr, align 8
  store double* %y, double** %y.addr, align 8
  store i32 0, i32* %i, align 4
  %cmp9 = icmp sgt i32 %n, 0
  br i1 %cmp9, label %for.body.lr.ph, label %for.end60

for.body.lr.ph:                                   ; preds = %entry
  %0 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %1 = load i32, i32* %n.addr, align 4
  %i.promoted38 = load i32, i32* %i, align 4
  %k.promoted = load i32, i32* %k, align 4
  %w.promoted = load double, double* %w, align 8
  %2 = sext i32 %i.promoted38 to i64
  %3 = add i32 %1, -1
  %4 = add i32 %i.promoted38, -1
  %5 = sext i32 %1 to i64
  %6 = sext i32 %1 to i64
  %7 = sext i32 %3 to i64
  %wide.trip.count72 = sext i32 %3 to i64
  %8 = add nsw i64 %wide.trip.count72, 1
  %9 = sub nsw i64 %8, %2
  %10 = sub nsw i64 %wide.trip.count72, %2
  %11 = zext i32 %4 to i64
  br label %for.body

for.body:                                         ; preds = %for.inc58, %for.body.lr.ph
  %indvar109 = phi i64 [ %indvar.next110, %for.inc58 ], [ 0, %for.body.lr.ph ]
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %for.inc58 ], [ %2, %for.body.lr.ph ]
  %indvars.iv95 = phi i32 [ %indvars.iv.next96, %for.inc58 ], [ %4, %for.body.lr.ph ]
  %sub47.lcssa37.lcssa45 = phi double [ %sub47.lcssa37.lcssa46, %for.inc58 ], [ %w.promoted, %for.body.lr.ph ]
  %inc49.lcssa33.lcssa40 = phi i32 [ %inc49.lcssa33.lcssa41, %for.inc58 ], [ %k.promoted, %for.body.lr.ph ]
  %12 = add i64 %11, %indvar109
  %13 = and i64 %12, 4294967295
  %14 = sub i64 %9, %indvar109
  %15 = sub i64 %10, %indvar109
  %16 = zext i32 %indvars.iv95 to i64
  %17 = add i32 %indvars.iv95, 1
  %cmp26 = icmp sgt i64 %indvars.iv99, 0
  br i1 %cmp26, label %for.body3.preheader, label %for.end27

for.body3.preheader:                              ; preds = %for.body
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99, i64 0
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv92 = phi i32 [ %indvars.iv.next93, %for.inc25 ], [ -1, %for.body3.preheader ]
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.inc25 ], [ 0, %for.body3.preheader ]
  %18 = add i64 %indvars.iv66, 4294967295
  %19 = and i64 %18, 4294967295
  %20 = zext i32 %indvars.iv92 to i64
  %21 = add i32 %indvars.iv92, 1
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99, i64 %indvars.iv66
  %22 = load double, double* %arrayidx5, align 8
  %cmp75 = icmp sgt i64 %indvars.iv66, 0
  br i1 %cmp75, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  %23 = and i64 %18, 1
  %lcmp.mod108 = icmp eq i64 %23, 0
  br i1 %lcmp.mod108, label %for.inc.prol, label %for.inc.prol.loopexit

for.inc.prol:                                     ; preds = %for.inc.preheader
  %24 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv66
  %25 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %24, %25
  %sub.prol = fsub double %22, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv60.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %sub25.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %22, %for.inc.preheader ]
  %26 = icmp eq i64 %19, 0
  br i1 %26, label %for.inc25, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv60 = phi i64 [ %indvars.iv60.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next61.1, %for.inc ]
  %sub25 = phi double [ %sub25.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99, i64 %indvars.iv60
  %27 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv60, i64 %indvars.iv66
  %28 = load double, double* %arrayidx16, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %29 = load <2 x double>, <2 x double>* %27, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next61, i64 %indvars.iv66
  %30 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %28, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %30, i32 1
  %mul = fmul <2 x double> %29, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %sub25, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %exitcond94.1 = icmp eq i64 %indvars.iv.next61, %20
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  br i1 %exitcond94.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.body3
  %sub.lcssa29 = phi double [ %22, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %inc.lcssa27 = phi i32 [ 0, %for.body3 ], [ %21, %for.inc.prol.loopexit ], [ %21, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv66
  %31 = load double, double* %arrayidx20, align 8
  %div = fdiv double %sub.lcssa29, %31
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99, i64 %indvars.iv66
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %indvars.iv.next93 = add i32 %indvars.iv92, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next67, %indvars.iv99
  br i1 %exitcond101, label %for.end27.loopexit, label %for.body3

for.end27.loopexit:                               ; preds = %for.inc25
  br label %for.end27

for.end27:                                        ; preds = %for.end27.loopexit, %for.body
  %sub47.lcssa37.lcssa44 = phi double [ %sub47.lcssa37.lcssa45, %for.body ], [ %sub.lcssa29, %for.end27.loopexit ]
  %inc49.lcssa33.lcssa39 = phi i32 [ %inc49.lcssa33.lcssa40, %for.body ], [ %inc.lcssa27, %for.end27.loopexit ]
  %cmp298 = icmp slt i64 %indvars.iv99, %6
  br i1 %cmp298, label %for.body30.lr.ph, label %for.inc58

for.body30.lr.ph:                                 ; preds = %for.end27
  %cmp367 = icmp sgt i64 %indvars.iv99, 0
  br i1 %cmp367, label %for.body30.us.preheader, label %for.body30.preheader

for.body30.preheader:                             ; preds = %for.body30.lr.ph
  %xtraiter111 = and i64 %14, 7
  %lcmp.mod112 = icmp eq i64 %xtraiter111, 0
  br i1 %lcmp.mod112, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.preheader
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol, %for.body30.prol.preheader
  %indvars.iv70.prol = phi i64 [ %indvars.iv.next71.prol, %for.body30.prol ], [ %indvars.iv99, %for.body30.prol.preheader ]
  %prol.iter113 = phi i64 [ %prol.iter113.sub, %for.body30.prol ], [ %xtraiter111, %for.body30.prol.preheader ]
  %indvars.iv.next71.prol = add i64 %indvars.iv70.prol, 1
  %prol.iter113.sub = add i64 %prol.iter113, -1
  %prol.iter113.cmp = icmp eq i64 %prol.iter113.sub, 0
  br i1 %prol.iter113.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !22

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.preheader
  %indvars.iv70.unr = phi i64 [ %indvars.iv99, %for.body30.preheader ], [ %indvars.iv.next71.prol, %for.body30.prol.loopexit.loopexit ]
  %32 = icmp ult i64 %15, 7
  br i1 %32, label %for.body30.for.inc58_crit_edge, label %for.body30.preheader.new

for.body30.preheader.new:                         ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %33 = and i64 %12, 1
  %lcmp.mod115 = icmp eq i64 %33, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99, i64 0
  %34 = icmp eq i64 %13, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.inc55.us
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %for.inc55.us ], [ %indvars.iv99, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99, i64 %indvars.iv83
  %35 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod115, label %for.inc48.us.prol, label %for.inc48.us.prol.loopexit

for.inc48.us.prol:                                ; preds = %for.body30.us
  %36 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv83
  %37 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %36, %37
  %sub47.us.prol = fsub double %35, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  %indvars.iv75.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %sub4731.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %35, %for.body30.us ]
  br i1 %34, label %for.inc55.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %indvars.iv75 = phi i64 [ %indvars.iv75.unr.ph, %for.body30.us.new ], [ %indvars.iv.next76.1, %for.inc48.us ]
  %sub4731.us = phi double [ %sub4731.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99, i64 %indvars.iv75
  %38 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv75, i64 %indvars.iv83
  %39 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %40 = load <2 x double>, <2 x double>* %38, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next76, i64 %indvars.iv83
  %41 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %39, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %41, i32 1
  %mul46.us = fmul <2 x double> %40, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %sub4731.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %exitcond97.1 = icmp eq i64 %indvars.iv.next76, %16
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75, 2
  br i1 %exitcond97.1, label %for.inc55.us.loopexit, label %for.inc48.us

for.inc55.us.loopexit:                            ; preds = %for.inc48.us
  br label %for.inc55.us

for.inc55.us:                                     ; preds = %for.inc55.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.inc55.us.loopexit ]
  %arrayidx54.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99, i64 %indvars.iv83
  store double %sub47.us.lcssa, double* %arrayidx54.us, align 8
  %indvars.iv.next84 = add i64 %indvars.iv83, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next84, %6
  br i1 %exitcond98, label %for.inc58.loopexit, label %for.body30.us

for.body30:                                       ; preds = %for.body30, %for.body30.preheader.new
  %indvars.iv70 = phi i64 [ %indvars.iv70.unr, %for.body30.preheader.new ], [ %indvars.iv.next71.7, %for.body30 ]
  %indvars.iv.next71.6 = add i64 %indvars.iv70, 7
  %exitcond73.7 = icmp eq i64 %indvars.iv.next71.6, %wide.trip.count72
  %indvars.iv.next71.7 = add i64 %indvars.iv70, 8
  br i1 %exitcond73.7, label %for.body30.for.inc58_crit_edge.loopexit, label %for.body30

for.body30.for.inc58_crit_edge.loopexit:          ; preds = %for.body30
  br label %for.body30.for.inc58_crit_edge

for.body30.for.inc58_crit_edge:                   ; preds = %for.body30.for.inc58_crit_edge.loopexit, %for.body30.prol.loopexit
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99, i64 %7
  %42 = load double, double* %arrayidx34, align 8
  br label %for.inc58

for.inc58.loopexit:                               ; preds = %for.inc55.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.end27, %for.body30.for.inc58_crit_edge
  %sub47.lcssa37.lcssa46 = phi double [ %42, %for.body30.for.inc58_crit_edge ], [ %sub47.lcssa37.lcssa44, %for.end27 ], [ %sub47.us.lcssa, %for.inc58.loopexit ]
  %inc49.lcssa33.lcssa41 = phi i32 [ 0, %for.body30.for.inc58_crit_edge ], [ %inc49.lcssa33.lcssa39, %for.end27 ], [ %17, %for.inc58.loopexit ]
  %indvars.iv.next100 = add nsw i64 %indvars.iv99, 1
  %cmp = icmp slt i64 %indvars.iv.next100, %5
  %indvars.iv.next96 = add i32 %indvars.iv95, 1
  %indvar.next110 = add i64 %indvar109, 1
  br i1 %cmp, label %for.body, label %for.cond.for.end60_crit_edge

for.cond.for.end60_crit_edge:                     ; preds = %for.inc58
  %43 = trunc i64 %indvars.iv.next100 to i32
  store i32 %43, i32* %i, align 4
  store i32 %inc49.lcssa33.lcssa41, i32* %k, align 4
  store double %sub47.lcssa37.lcssa46, double* %w, align 8
  br label %for.end60

for.end60:                                        ; preds = %entry, %for.cond.for.end60_crit_edge
  store i32 0, i32* %i, align 4
  %44 = load i32, i32* %n.addr, align 4
  %cmp624 = icmp sgt i32 %44, 0
  br i1 %cmp624, label %for.body63.lr.ph, label %for.end84.thread

for.end84.thread:                                 ; preds = %for.end60
  %sub8587 = add nsw i32 %44, -1
  store i32 %sub8587, i32* %i, align 4
  br label %for.end113

for.body63.lr.ph:                                 ; preds = %for.end60
  %45 = load double*, double** %b.addr, align 8
  %46 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %47 = load double*, double** %y.addr, align 8
  %48 = load i32, i32* %n.addr, align 4
  %i.promoted19 = load i32, i32* %i, align 4
  %49 = add i32 %i.promoted19, -1
  %50 = sext i32 %i.promoted19 to i64
  %51 = sext i32 %48 to i64
  br label %for.body63

for.body63:                                       ; preds = %for.inc82, %for.body63.lr.ph
  %indvar102 = phi i32 [ %indvar.next103, %for.inc82 ], [ 0, %for.body63.lr.ph ]
  %indvars.iv89 = phi i32 [ %indvars.iv.next90, %for.inc82 ], [ %49, %for.body63.lr.ph ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.inc82 ], [ %50, %for.body63.lr.ph ]
  %52 = add i32 %49, %indvar102
  %53 = zext i32 %indvars.iv89 to i64
  %arrayidx65 = getelementptr inbounds double, double* %45, i64 %indvars.iv58
  %54 = load double, double* %arrayidx65, align 8
  %cmp673 = icmp sgt i64 %indvars.iv58, 0
  br i1 %cmp673, label %for.inc77.preheader, label %for.inc82

for.inc77.preheader:                              ; preds = %for.body63
  %55 = zext i32 %52 to i64
  %56 = add nuw nsw i64 %55, 1
  %xtraiter104 = and i64 %56, 3
  %lcmp.mod105 = icmp eq i64 %xtraiter104, 0
  br i1 %lcmp.mod105, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.preheader
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol, %for.inc77.prol.preheader
  %indvars.iv52.prol = phi i64 [ %indvars.iv.next53.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %sub7618.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %54, %for.inc77.prol.preheader ]
  %prol.iter106 = phi i64 [ %prol.iter106.sub, %for.inc77.prol ], [ %xtraiter104, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %indvars.iv58, i64 %indvars.iv52.prol
  %57 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %47, i64 %indvars.iv52.prol
  %58 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %57, %58
  %sub76.prol = fsub double %sub7618.prol, %mul75.prol
  %indvars.iv.next53.prol = add nuw nsw i64 %indvars.iv52.prol, 1
  %prol.iter106.sub = add i64 %prol.iter106, -1
  %prol.iter106.cmp = icmp eq i64 %prol.iter106.sub, 0
  br i1 %prol.iter106.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !23

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.preheader
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %indvars.iv52.unr = phi i64 [ 0, %for.inc77.preheader ], [ %indvars.iv.next53.prol, %for.inc77.prol.loopexit.loopexit ]
  %sub7618.unr = phi double [ %54, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %59 = icmp ult i32 %52, 3
  br i1 %59, label %for.inc82, label %for.inc77.preheader.new

for.inc77.preheader.new:                          ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77, %for.inc77.preheader.new
  %indvars.iv52 = phi i64 [ %indvars.iv52.unr, %for.inc77.preheader.new ], [ %indvars.iv.next53.3, %for.inc77 ]
  %sub7618 = phi double [ %sub7618.unr, %for.inc77.preheader.new ], [ %sub76.3, %for.inc77 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %indvars.iv58, i64 %indvars.iv52
  %60 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %47, i64 %indvars.iv52
  %61 = bitcast double* %arrayidx74 to <2 x double>*
  %62 = load <2 x double>, <2 x double>* %60, align 8
  %63 = load <2 x double>, <2 x double>* %61, align 8
  %mul75 = fmul <2 x double> %62, %63
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %sub7618, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %indvars.iv58, i64 %indvars.iv.next53.1
  %64 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %47, i64 %indvars.iv.next53.1
  %65 = bitcast double* %arrayidx74.2 to <2 x double>*
  %indvars.iv.next53.2 = add nsw i64 %indvars.iv52, 3
  %66 = load <2 x double>, <2 x double>* %64, align 8
  %67 = load <2 x double>, <2 x double>* %65, align 8
  %mul75.2 = fmul <2 x double> %66, %67
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %exitcond91.3 = icmp eq i64 %indvars.iv.next53.2, %53
  %indvars.iv.next53.3 = add nsw i64 %indvars.iv52, 4
  br i1 %exitcond91.3, label %for.inc82.loopexit, label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.inc77.prol.loopexit, %for.body63
  %sub76.lcssa23 = phi double [ %54, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %47, i64 %indvars.iv58
  store double %sub76.lcssa23, double* %arrayidx81, align 8
  %indvars.iv.next59 = add nsw i64 %indvars.iv58, 1
  %cmp62 = icmp slt i64 %indvars.iv.next59, %51
  %indvars.iv.next90 = add i32 %indvars.iv89, 1
  %indvar.next103 = add i32 %indvar102, 1
  br i1 %cmp62, label %for.body63, label %for.end84

for.end84:                                        ; preds = %for.inc82
  store double %sub76.lcssa23, double* %w, align 8
  %.pr = load i32, i32* %n.addr, align 4
  %sub85 = add nsw i32 %.pr, -1
  store i32 %sub85, i32* %i, align 4
  %cmp872 = icmp sgt i32 %.pr, 0
  br i1 %cmp872, label %for.body88.lr.ph, label %for.end113

for.body88.lr.ph:                                 ; preds = %for.end84
  %68 = load double*, double** %y.addr, align 8
  %69 = load i32, i32* %n.addr, align 4
  %70 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %71 = load double*, double** %x.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  %72 = add i32 %i.promoted, 1
  %73 = add i32 %69, -1
  %74 = sext i32 %i.promoted to i64
  %75 = sext i32 %69 to i64
  %wide.trip.count = sext i32 %73 to i64
  %76 = add nsw i64 %wide.trip.count, 1
  br label %for.body88

for.body88:                                       ; preds = %for.inc112, %for.body88.lr.ph
  %indvar = phi i32 [ %indvar.next, %for.inc112 ], [ 0, %for.body88.lr.ph ]
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.inc112 ], [ %74, %for.body88.lr.ph ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc112 ], [ %72, %for.body88.lr.ph ]
  %77 = sub i32 %72, %indvar
  %78 = sext i32 %77 to i64
  %79 = sub nsw i64 %wide.trip.count, %78
  %arrayidx90 = getelementptr inbounds double, double* %68, i64 %indvars.iv49
  %80 = load double, double* %arrayidx90, align 8
  %81 = add nsw i64 %indvars.iv49, 1
  %cmp921 = icmp slt i64 %81, %75
  br i1 %cmp921, label %for.inc102.lr.ph, label %for.inc112

for.inc102.lr.ph:                                 ; preds = %for.body88
  %82 = sub nsw i64 %76, %78
  %83 = sext i32 %indvars.iv to i64
  %xtraiter = and i64 %82, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.lr.ph
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol, %for.inc102.prol.preheader
  %indvars.iv47.prol = phi i64 [ %indvars.iv.next48.prol, %for.inc102.prol ], [ %83, %for.inc102.prol.preheader ]
  %sub10111.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %80, %for.inc102.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %70, i64 %indvars.iv49, i64 %indvars.iv47.prol
  %84 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %71, i64 %indvars.iv47.prol
  %85 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %84, %85
  %sub101.prol = fsub double %sub10111.prol, %mul100.prol
  %indvars.iv.next48.prol = add nsw i64 %indvars.iv47.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !24

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.lr.ph
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.lr.ph ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %indvars.iv47.unr = phi i64 [ %83, %for.inc102.lr.ph ], [ %indvars.iv.next48.prol, %for.inc102.prol.loopexit.loopexit ]
  %sub10111.unr = phi double [ %80, %for.inc102.lr.ph ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %86 = icmp ult i64 %79, 3
  br i1 %86, label %for.inc112, label %for.inc102.lr.ph.new

for.inc102.lr.ph.new:                             ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102, %for.inc102.lr.ph.new
  %indvars.iv47 = phi i64 [ %indvars.iv47.unr, %for.inc102.lr.ph.new ], [ %indvars.iv.next48.3, %for.inc102 ]
  %sub10111 = phi double [ %sub10111.unr, %for.inc102.lr.ph.new ], [ %sub101.3, %for.inc102 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %70, i64 %indvars.iv49, i64 %indvars.iv47
  %87 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %71, i64 %indvars.iv47
  %88 = bitcast double* %arrayidx99 to <2 x double>*
  %89 = load <2 x double>, <2 x double>* %87, align 8
  %90 = load <2 x double>, <2 x double>* %88, align 8
  %mul100 = fmul <2 x double> %89, %90
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %sub10111, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %70, i64 %indvars.iv49, i64 %indvars.iv.next48.1
  %91 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %71, i64 %indvars.iv.next48.1
  %92 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next48.2 = add nsw i64 %indvars.iv47, 3
  %93 = load <2 x double>, <2 x double>* %91, align 8
  %94 = load <2 x double>, <2 x double>* %92, align 8
  %mul100.2 = fmul <2 x double> %93, %94
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %exitcond.3 = icmp eq i64 %indvars.iv.next48.2, %wide.trip.count
  %indvars.iv.next48.3 = add nsw i64 %indvars.iv47, 4
  br i1 %exitcond.3, label %for.inc112.loopexit, label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.inc102.prol.loopexit, %for.body88
  %sub101.lcssa16 = phi double [ %80, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %70, i64 %indvars.iv49, i64 %indvars.iv49
  %95 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %sub101.lcssa16, %95
  %arrayidx111 = getelementptr inbounds double, double* %71, i64 %indvars.iv49
  store double %div109, double* %arrayidx111, align 8
  %indvars.iv.next50 = add nsw i64 %indvars.iv49, -1
  %cmp87 = icmp sgt i64 %indvars.iv49, 0
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp87, label %for.body88, label %for.cond86.for.end113_crit_edge

for.cond86.for.end113_crit_edge:                  ; preds = %for.inc112
  %96 = trunc i64 %indvars.iv.next50 to i32
  store i32 %96, i32* %i, align 4
  store double %sub101.lcssa16, double* %w, align 8
  br label %for.end113

for.end113:                                       ; preds = %for.end84, %for.end84.thread, %for.cond86.for.end113_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* %x) unnamed_addr #0 {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store double* %x, double** %x.addr, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  store i32 0, i32* %i, align 4
  %3 = load i32, i32* %n.addr, align 4
  %cmp1 = icmp sgt i32 %3, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %4 = load double*, double** %x.addr, align 8
  %5 = load i32, i32* %n.addr, align 4
  %i.promoted = load i32, i32* %i, align 4
  %6 = sext i32 %i.promoted to i64
  %7 = sext i32 %5 to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ %6, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %8 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %8, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %11 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #7
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %7
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.inc
  %12 = trunc i64 %indvars.iv.next to i32
  store i32 %12, i32* %i, align 4
  br label %for.end

for.end:                                          ; preds = %entry, %for.cond.for.end_crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!5, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !10, !11}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !20}
!24 = distinct !{!24, !20}
