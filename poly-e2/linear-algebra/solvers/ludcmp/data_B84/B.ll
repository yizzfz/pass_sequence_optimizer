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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %0 = bitcast [2000 x [2000 x double]]** %A to i8**
  store i8* %call, i8** %0, align 8
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %1 = bitcast [2000 x double]** %b to i8**
  store i8* %call1, i8** %1, align 8
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %2 = bitcast [2000 x double]** %x to i8**
  store i8* %call2, i8** %2, align 8
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
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
  tail call void (...) @polybench_timer_start() #4
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
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
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
  tail call void @free(i8* %29) #4
  %30 = bitcast [2000 x double]** %b to i8**
  %31 = load i8*, i8** %30, align 8
  tail call void @free(i8* %31) #4
  %32 = bitcast [2000 x double]** %x to i8**
  %33 = load i8*, i8** %32, align 8
  tail call void @free(i8* %33) #4
  %34 = bitcast [2000 x double]** %y to i8**
  %35 = load i8*, i8** %34, align 8
  tail call void @free(i8* %35) #4
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
  %cmp23 = icmp sgt i32 %0, 0
  br i1 %cmp23, label %for.inc.lr.ph, label %for.end.thread

for.end.thread:                                   ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.end46

for.inc.lr.ph:                                    ; preds = %entry
  %1 = load double*, double** %x.addr, align 8
  %2 = load double*, double** %y.addr, align 8
  %3 = load double, double* %fn, align 8
  %4 = load double*, double** %b.addr, align 8
  %5 = load i32, i32* %n.addr, align 4
  %i.promoted75 = load i32, i32* %i, align 4
  %6 = sext i32 %i.promoted75 to i64
  %7 = sext i32 %5 to i64
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv116 = phi i64 [ %6, %for.inc.lr.ph ], [ %indvars.iv.next117, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %1, i64 %indvars.iv116
  store double 0.000000e+00, double* %arrayidx, align 8
  %arrayidx3 = getelementptr inbounds double, double* %2, i64 %indvars.iv116
  store double 0.000000e+00, double* %arrayidx3, align 8
  %indvars.iv.next117 = add nsw i64 %indvars.iv116, 1
  %8 = trunc i64 %indvars.iv.next117 to i32
  %conv4 = sitofp i32 %8 to double
  %div = fdiv double %conv4, %3
  %div5 = fmul double %div, 5.000000e-01
  %add6 = fadd double %div5, 4.000000e+00
  %arrayidx8 = getelementptr inbounds double, double* %4, i64 %indvars.iv116
  store double %add6, double* %arrayidx8, align 8
  %cmp = icmp slt i64 %indvars.iv.next117, %7
  br i1 %cmp, label %for.inc, label %for.end

for.end:                                          ; preds = %for.inc
  %.pr = load i32, i32* %n.addr, align 4
  store i32 0, i32* %i, align 4
  %cmp1022 = icmp sgt i32 %.pr, 0
  br i1 %cmp1022, label %for.body12.lr.ph, label %for.end46

for.body12.lr.ph:                                 ; preds = %for.end
  %9 = load i32, i32* %n.addr, align 4
  %conv18 = sitofp i32 %9 to double
  %i.promoted = load i32, i32* %i, align 4
  %10 = add i32 %9, -1
  %11 = sext i32 %i.promoted to i64
  %12 = sext i32 %9 to i64
  %13 = sext i32 %9 to i64
  %14 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %wide.trip.count112 = sext i32 %10 to i64
  %15 = add nsw i64 %wide.trip.count112, 1
  %16 = add i32 %i.promoted, 1
  br label %for.body12

for.body12:                                       ; preds = %for.inc44.for.body12_crit_edge, %for.body12.lr.ph
  %indvar142 = phi i32 [ %indvar.next143, %for.inc44.for.body12_crit_edge ], [ 0, %for.body12.lr.ph ]
  %indvars.iv133 = phi i32 [ %indvars.iv.next134, %for.inc44.for.body12_crit_edge ], [ %i.promoted, %for.body12.lr.ph ]
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %for.inc44.for.body12_crit_edge ], [ %11, %for.body12.lr.ph ]
  %17 = add i32 %16, %indvar142
  %18 = sext i32 %17 to i64
  %19 = sub nsw i64 %15, %18
  %20 = zext i32 %indvars.iv133 to i64
  %indvars.iv.next134 = add i32 %indvars.iv133, 1
  %21 = sext i32 %indvars.iv.next134 to i64
  %cmp1416 = icmp slt i64 %indvars.iv114, 0
  br i1 %cmp1416, label %for.end27, label %for.inc25.preheader

for.inc25.preheader:                              ; preds = %for.body12
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.for.inc25_crit_edge, %for.inc25.preheader
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %for.inc25.for.inc25_crit_edge ], [ 0, %for.inc25.preheader ]
  %22 = sub nsw i64 0, %indvars.iv101
  %23 = trunc i64 %22 to i32
  %rem = srem i32 %23, %9
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, %conv18
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv114, i64 %indvars.iv101
  store double %add20, double* %arrayidx24, align 8
  %exitcond135 = icmp eq i64 %indvars.iv101, %20
  br i1 %exitcond135, label %for.end27.loopexit, label %for.inc25.for.inc25_crit_edge

for.inc25.for.inc25_crit_edge:                    ; preds = %for.inc25
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  br label %for.inc25

for.end27.loopexit:                               ; preds = %for.inc25
  br label %for.end27

for.end27:                                        ; preds = %for.end27.loopexit, %for.body12
  %indvars.iv.next115 = add nsw i64 %indvars.iv114, 1
  %cmp3018 = icmp slt i64 %indvars.iv.next115, %12
  br i1 %cmp3018, label %for.inc37.preheader, label %for.inc44

for.inc37.preheader:                              ; preds = %for.end27
  %min.iters.check = icmp ult i64 %19, 4
  br i1 %min.iters.check, label %for.inc37.preheader215, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc37.preheader
  %n.vec = and i64 %19, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %21, %n.vec
  br i1 %cmp.zero, label %for.inc37.preheader215, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %24 = add i64 %21, %index
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv114, i64 %24
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %26, align 8
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %28, align 8
  %index.next = add i64 %index, 4
  %29 = icmp eq i64 %index.next, %n.vec
  br i1 %29, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %19, %n.vec
  br i1 %cmp.n, label %for.inc44, label %for.inc37.preheader215

for.inc37.preheader215:                           ; preds = %middle.block, %min.iters.checked, %for.inc37.preheader
  %indvars.iv110.ph = phi i64 [ %21, %for.inc37.preheader ], [ %21, %min.iters.checked ], [ %ind.end, %middle.block ]
  br label %for.inc37

for.inc37:                                        ; preds = %for.inc37.for.inc37_crit_edge, %for.inc37.preheader215
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %for.inc37.for.inc37_crit_edge ], [ %indvars.iv110.ph, %for.inc37.preheader215 ]
  %arrayidx36 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv114, i64 %indvars.iv110
  store double 0.000000e+00, double* %arrayidx36, align 8
  %exitcond113 = icmp eq i64 %indvars.iv110, %wide.trip.count112
  br i1 %exitcond113, label %for.inc44.loopexit, label %for.inc37.for.inc37_crit_edge, !llvm.loop !4

for.inc37.for.inc37_crit_edge:                    ; preds = %for.inc37
  %indvars.iv.next111 = add nsw i64 %indvars.iv110, 1
  br label %for.inc37

for.inc44.loopexit:                               ; preds = %for.inc37
  br label %for.inc44

for.inc44:                                        ; preds = %for.inc44.loopexit, %middle.block, %for.end27
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv114, i64 %indvars.iv114
  store double 1.000000e+00, double* %arrayidx43, align 8
  %cmp10 = icmp slt i64 %indvars.iv.next115, %13
  br i1 %cmp10, label %for.inc44.for.body12_crit_edge, label %for.cond9.for.end46_crit_edge

for.inc44.for.body12_crit_edge:                   ; preds = %for.inc44
  %indvar.next143 = add i32 %indvar142, 1
  br label %for.body12

for.cond9.for.end46_crit_edge:                    ; preds = %for.inc44
  %30 = trunc i64 %indvars.iv.next115 to i32
  store i32 %30, i32* %i, align 4
  br label %for.end46

for.end46:                                        ; preds = %for.end, %for.end.thread, %for.cond9.for.end46_crit_edge
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %31 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %31, align 8
  store i32 0, i32* %r, align 4
  %32 = load i32, i32* %n.addr, align 4
  %cmp4815 = icmp sgt i32 %32, 0
  br i1 %cmp4815, label %for.body50.lr.ph, label %for.end64.thread

for.end64.thread:                                 ; preds = %for.end46
  store i32 0, i32* %t, align 4
  store i32 0, i32* %r, align 4
  br label %for.cond99.preheader

for.body50.lr.ph:                                 ; preds = %for.end46
  %33 = load i32, i32* %n.addr, align 4
  %34 = sext i32 %33 to i64
  %cmp5214 = icmp sgt i32 %33, 0
  %35 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  br i1 %cmp5214, label %for.body50.lr.ph.for.body50.us_crit_edge, label %for.end64

for.body50.lr.ph.for.body50.us_crit_edge:         ; preds = %for.body50.lr.ph
  %r.promoted66 = load i32, i32* %r, align 4
  %36 = add i32 %33, -1
  %37 = sext i32 %r.promoted66 to i64
  %38 = zext i32 %36 to i64
  %39 = shl nuw nsw i64 %38, 3
  %40 = add nuw nsw i64 %39, 8
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us.for.inc62.us_crit_edge, %for.body50.lr.ph.for.body50.us_crit_edge
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %for.inc62.us.for.inc62.us_crit_edge ], [ %37, %for.body50.lr.ph.for.body50.us_crit_edge ]
  %indvar = phi i64 [ %indvar.next, %for.inc62.us.for.inc62.us_crit_edge ], [ 0, %for.body50.lr.ph.for.body50.us_crit_edge ]
  %41 = add nsw i64 %37, %indvar
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %41, i64 0
  %scevgep97 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97, i8 0, i64 %40, i32 8, i1 false)
  %indvars.iv.next99 = add nsw i64 %indvars.iv98, 1
  %cmp48.us = icmp slt i64 %indvars.iv.next99, %34
  br i1 %cmp48.us, label %for.inc62.us.for.inc62.us_crit_edge, label %for.end64.loopexit

for.inc62.us.for.inc62.us_crit_edge:              ; preds = %for.inc62.us
  %indvar.next = add nuw nsw i64 %indvar, 1
  br label %for.inc62.us

for.end64.loopexit:                               ; preds = %for.inc62.us
  br label %for.end64

for.end64:                                        ; preds = %for.end64.loopexit, %for.body50.lr.ph
  %inc60.lcssa69.lcssa = phi i32 [ 0, %for.body50.lr.ph ], [ %33, %for.end64.loopexit ]
  store i32 %inc60.lcssa69.lcssa, i32* %s, align 4
  %.pr124 = load i32, i32* %n.addr, align 4
  store i32 0, i32* %t, align 4
  %cmp6613 = icmp sgt i32 %.pr124, 0
  store i32 0, i32* %r, align 4
  br i1 %cmp6613, label %for.cond69.preheader.lr.ph, label %for.cond99.preheader

for.cond69.preheader.lr.ph:                       ; preds = %for.end64
  %42 = load i32, i32* %n.addr, align 4
  %43 = sext i32 %42 to i64
  %cmp7411 = icmp sgt i32 %42, 0
  %44 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %45 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %r.promoted33 = load i32, i32* %r, align 4
  %t.promoted = load i32, i32* %t, align 4
  %46 = sext i32 %t.promoted to i64
  %s.promoted = load i32, i32* %s, align 4
  br i1 %cmp7411, label %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge, label %for.cond69.preheader.preheader

for.cond69.preheader.preheader:                   ; preds = %for.cond69.preheader.lr.ph
  br label %for.cond69.preheader

for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge: ; preds = %for.cond69.preheader.lr.ph
  %47 = add i32 %42, -1
  %48 = zext i32 %47 to i64
  %49 = add nuw nsw i64 %48, 1
  %50 = add nsw i64 %46, 1
  %min.iters.check148 = icmp ult i64 %49, 4
  %n.vec151 = and i64 %49, 8589934588
  %cmp.zero152 = icmp eq i64 %n.vec151, 0
  %cmp.n174 = icmp eq i64 %49, %n.vec151
  br label %for.cond69.preheader.us

for.cond69.preheader.us:                          ; preds = %for.inc96.us.for.cond69.preheader.us_crit_edge, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge
  %indvar160 = phi i64 [ %indvar.next161, %for.inc96.us.for.cond69.preheader.us_crit_edge ], [ 0, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %for.inc96.us.for.cond69.preheader.us_crit_edge ], [ %46, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %inc91.lcssa32.lcssa36.us = phi i32 [ %inc91.lcssa32.lcssa37.us, %for.inc96.us.for.cond69.preheader.us_crit_edge ], [ %s.promoted, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %inc94.lcssa34.us = phi i32 [ 0, %for.inc96.us.for.cond69.preheader.us_crit_edge ], [ %r.promoted33, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %51 = add i64 %46, %indvar160
  %scevgep162 = getelementptr [2000 x double], [2000 x double]* %44, i64 0, i64 %51
  %52 = add i64 %50, %indvar160
  %scevgep164 = getelementptr [2000 x double], [2000 x double]* %44, i64 %48, i64 %52
  %cmp7012.us = icmp slt i32 %inc94.lcssa34.us, %42
  br i1 %cmp7012.us, label %for.body72.lr.ph.us, label %for.inc96.us

for.body72.lr.ph.us:                              ; preds = %for.cond69.preheader.us
  %53 = sext i32 %inc94.lcssa34.us to i64
  br label %for.body72.us.us

for.inc96.us.loopexit:                            ; preds = %for.inc93.us.us
  br label %for.inc96.us

for.inc96.us:                                     ; preds = %for.inc96.us.loopexit, %for.cond69.preheader.us
  %inc91.lcssa32.lcssa37.us = phi i32 [ %inc91.lcssa32.lcssa36.us, %for.cond69.preheader.us ], [ %42, %for.inc96.us.loopexit ]
  %indvars.iv.next91 = add nsw i64 %indvars.iv90, 1
  %cmp66.us = icmp slt i64 %indvars.iv.next91, %43
  br i1 %cmp66.us, label %for.inc96.us.for.cond69.preheader.us_crit_edge, label %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge

for.inc96.us.for.cond69.preheader.us_crit_edge:   ; preds = %for.inc96.us
  %indvar.next161 = add i64 %indvar160, 1
  br label %for.cond69.preheader.us

for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge: ; preds = %for.inc96.us
  %54 = trunc i64 %indvars.iv.next91 to i32
  br label %for.cond65.for.cond99.preheader_crit_edge

for.body72.us.us:                                 ; preds = %for.inc93.us.us.for.body72.us.us_crit_edge, %for.body72.lr.ph.us
  %indvar154 = phi i64 [ %indvar.next155, %for.inc93.us.us.for.body72.us.us_crit_edge ], [ 0, %for.body72.lr.ph.us ]
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %for.inc93.us.us.for.body72.us.us_crit_edge ], [ %53, %for.body72.lr.ph.us ]
  %55 = add i64 %53, %indvar154
  %scevgep156 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %55, i64 0
  %scevgep158 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %55, i64 %49
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %44, i64 %indvars.iv88, i64 %indvars.iv90
  br i1 %min.iters.check148, label %for.inc90.us.us.preheader, label %min.iters.checked149

for.inc90.us.us.preheader:                        ; preds = %middle.block146, %vector.memcheck, %min.iters.checked149, %for.body72.us.us
  %indvars.iv84.ph = phi i64 [ 0, %for.body72.us.us ], [ 0, %min.iters.checked149 ], [ 0, %vector.memcheck ], [ %n.vec151, %middle.block146 ]
  br label %for.inc90.us.us

min.iters.checked149:                             ; preds = %for.body72.us.us
  br i1 %cmp.zero152, label %for.inc90.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked149
  %bound0 = icmp ult double* %scevgep156, %scevgep164
  %bound1 = icmp ult double* %scevgep162, %scevgep158
  %found.conflict = and i1 %bound0, %bound1
  %bound0167 = icmp ult double* %scevgep156, %arrayidx80.us.us
  %bound1168 = icmp ult double* %arrayidx80.us.us, %scevgep158
  %found.conflict169 = and i1 %bound0167, %bound1168
  %conflict.rdx = or i1 %found.conflict, %found.conflict169
  br i1 %conflict.rdx, label %for.inc90.us.us.preheader, label %vector.body145.preheader

vector.body145.preheader:                         ; preds = %vector.memcheck
  br label %vector.body145

vector.body145:                                   ; preds = %vector.body145, %vector.body145.preheader
  %index171 = phi i64 [ 0, %vector.body145.preheader ], [ %index.next172, %vector.body145 ]
  %56 = or i64 %index171, 1
  %57 = or i64 %index171, 2
  %58 = or i64 %index171, 3
  %59 = load double, double* %arrayidx80.us.us, align 8, !alias.scope !6
  %60 = insertelement <2 x double> undef, double %59, i32 0
  %61 = shufflevector <2 x double> %60, <2 x double> undef, <2 x i32> zeroinitializer
  %62 = insertelement <2 x double> undef, double %59, i32 0
  %63 = shufflevector <2 x double> %62, <2 x double> undef, <2 x i32> zeroinitializer
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %44, i64 %index171, i64 %indvars.iv90
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %44, i64 %56, i64 %indvars.iv90
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %44, i64 %57, i64 %indvars.iv90
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %44, i64 %58, i64 %indvars.iv90
  %68 = load double, double* %64, align 8, !alias.scope !9
  %69 = load double, double* %65, align 8, !alias.scope !9
  %70 = load double, double* %66, align 8, !alias.scope !9
  %71 = load double, double* %67, align 8, !alias.scope !9
  %72 = insertelement <2 x double> undef, double %68, i32 0
  %73 = insertelement <2 x double> %72, double %69, i32 1
  %74 = insertelement <2 x double> undef, double %70, i32 0
  %75 = insertelement <2 x double> %74, double %71, i32 1
  %76 = fmul <2 x double> %61, %73
  %77 = fmul <2 x double> %63, %75
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv88, i64 %index171
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !11, !noalias !13
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load179 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !11, !noalias !13
  %82 = fadd <2 x double> %76, %wide.load
  %83 = fadd <2 x double> %77, %wide.load179
  %84 = bitcast double* %78 to <2 x double>*
  store <2 x double> %82, <2 x double>* %84, align 8, !alias.scope !11, !noalias !13
  %85 = bitcast double* %80 to <2 x double>*
  store <2 x double> %83, <2 x double>* %85, align 8, !alias.scope !11, !noalias !13
  %index.next172 = add i64 %index171, 4
  %86 = icmp eq i64 %index.next172, %n.vec151
  br i1 %86, label %middle.block146, label %vector.body145, !llvm.loop !14

middle.block146:                                  ; preds = %vector.body145
  br i1 %cmp.n174, label %for.inc93.us.us, label %for.inc90.us.us.preheader

for.inc93.us.us.loopexit:                         ; preds = %for.inc90.us.us
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit, %middle.block146
  %indvars.iv.next89 = add nsw i64 %indvars.iv88, 1
  %exitcond130 = icmp eq i64 %indvars.iv.next89, %43
  br i1 %exitcond130, label %for.inc96.us.loopexit, label %for.inc93.us.us.for.body72.us.us_crit_edge

for.inc93.us.us.for.body72.us.us_crit_edge:       ; preds = %for.inc93.us.us
  %indvar.next155 = add i64 %indvar154, 1
  br label %for.body72.us.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us.for.inc90.us.us_crit_edge, %for.inc90.us.us.preheader
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %for.inc90.us.us.for.inc90.us.us_crit_edge ], [ %indvars.iv84.ph, %for.inc90.us.us.preheader ]
  %87 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %44, i64 %indvars.iv84, i64 %indvars.iv90
  %88 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %87, %88
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv88, i64 %indvars.iv84
  %89 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %mul.us.us, %89
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %exitcond = icmp eq i64 %indvars.iv84, %48
  br i1 %exitcond, label %for.inc93.us.us.loopexit, label %for.inc90.us.us.for.inc90.us.us_crit_edge, !llvm.loop !15

for.inc90.us.us.for.inc90.us.us_crit_edge:        ; preds = %for.inc90.us.us
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  br label %for.inc90.us.us

for.cond69.preheader:                             ; preds = %for.cond69.preheader, %for.cond69.preheader.preheader
  %inc91.lcssa32.lcssa36 = phi i32 [ %s.promoted, %for.cond69.preheader.preheader ], [ %.inc91.lcssa32.lcssa36, %for.cond69.preheader ]
  %inc9735 = phi i32 [ %t.promoted, %for.cond69.preheader.preheader ], [ %inc97, %for.cond69.preheader ]
  %inc94.lcssa34 = phi i32 [ %r.promoted33, %for.cond69.preheader.preheader ], [ 0, %for.cond69.preheader ]
  %cmp7012 = icmp slt i32 %inc94.lcssa34, %42
  %.inc91.lcssa32.lcssa36 = select i1 %cmp7012, i32 0, i32 %inc91.lcssa32.lcssa36
  %inc97 = add nsw i32 %inc9735, 1
  %cmp66 = icmp slt i32 %inc97, %42
  br i1 %cmp66, label %for.cond69.preheader, label %for.cond65.for.cond99.preheader_crit_edge.loopexit

for.cond65.for.cond99.preheader_crit_edge.loopexit: ; preds = %for.cond69.preheader
  br label %for.cond65.for.cond99.preheader_crit_edge

for.cond65.for.cond99.preheader_crit_edge:        ; preds = %for.cond65.for.cond99.preheader_crit_edge.loopexit, %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge
  %inc91.lcssa32.lcssa37.lcssa = phi i32 [ %inc91.lcssa32.lcssa37.us, %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge ], [ %.inc91.lcssa32.lcssa36, %for.cond65.for.cond99.preheader_crit_edge.loopexit ]
  %inc97.lcssa = phi i32 [ %54, %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge ], [ %inc97, %for.cond65.for.cond99.preheader_crit_edge.loopexit ]
  store i32 0, i32* %r, align 4
  store i32 %inc97.lcssa, i32* %t, align 4
  store i32 %inc91.lcssa32.lcssa37.lcssa, i32* %s, align 4
  br label %for.cond99.preheader

for.cond99.preheader:                             ; preds = %for.end64, %for.end64.thread, %for.cond65.for.cond99.preheader_crit_edge
  %90 = load i32, i32* %r, align 4
  %91 = load i32, i32* %n.addr, align 4
  %cmp10010 = icmp slt i32 %90, %91
  br i1 %cmp10010, label %for.body102.lr.ph, label %for.end120

for.body102.lr.ph:                                ; preds = %for.cond99.preheader
  %92 = load i32, i32* %n.addr, align 4
  %93 = sext i32 %92 to i64
  %cmp1049 = icmp sgt i32 %92, 0
  %94 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %95 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %r.promoted = load i32, i32* %r, align 4
  %96 = sext i32 %r.promoted to i64
  br i1 %cmp1049, label %for.body102.lr.ph.for.body102.us_crit_edge, label %for.body102.for.cond99.for.end120_crit_edge_crit_edge

for.body102.lr.ph.for.body102.us_crit_edge:       ; preds = %for.body102.lr.ph
  %97 = add i32 %92, -1
  %98 = zext i32 %97 to i64
  %99 = add nuw nsw i64 %98, 1
  %min.iters.check183 = icmp ult i64 %99, 4
  %n.vec186 = and i64 %99, 8589934588
  %cmp.zero187 = icmp eq i64 %n.vec186, 0
  %cmp.n208 = icmp eq i64 %99, %n.vec186
  br label %for.body102.us

for.body102.us:                                   ; preds = %for.inc118.us.for.body102.us_crit_edge, %for.body102.lr.ph.for.body102.us_crit_edge
  %indvar189 = phi i64 [ %indvar.next190, %for.inc118.us.for.body102.us_crit_edge ], [ 0, %for.body102.lr.ph.for.body102.us_crit_edge ]
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %for.inc118.us.for.body102.us_crit_edge ], [ %96, %for.body102.lr.ph.for.body102.us_crit_edge ]
  %100 = add i64 %96, %indvar189
  %scevgep191 = getelementptr [2000 x double], [2000 x double]* %95, i64 %100, i64 0
  %scevgep193 = getelementptr [2000 x double], [2000 x double]* %95, i64 %100, i64 %99
  %scevgep195 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %94, i64 0, i64 %100, i64 0
  %scevgep197 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %94, i64 0, i64 %100, i64 %99
  br i1 %min.iters.check183, label %for.inc115.us.preheader, label %min.iters.checked184

min.iters.checked184:                             ; preds = %for.body102.us
  br i1 %cmp.zero187, label %for.inc115.us.preheader, label %vector.memcheck203

vector.memcheck203:                               ; preds = %min.iters.checked184
  %bound0199 = icmp ult double* %scevgep191, %scevgep197
  %bound1200 = icmp ult double* %scevgep195, %scevgep193
  %memcheck.conflict202 = and i1 %bound0199, %bound1200
  br i1 %memcheck.conflict202, label %for.inc115.us.preheader, label %vector.body180.preheader

vector.body180.preheader:                         ; preds = %vector.memcheck203
  br label %vector.body180

vector.body180:                                   ; preds = %vector.body180, %vector.body180.preheader
  %index205 = phi i64 [ 0, %vector.body180.preheader ], [ %index.next206, %vector.body180 ]
  %101 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %94, i64 0, i64 %indvars.iv82, i64 %index205
  %102 = bitcast double* %101 to <2 x i64>*
  %wide.load213 = load <2 x i64>, <2 x i64>* %102, align 8, !alias.scope !16
  %103 = getelementptr double, double* %101, i64 2
  %104 = bitcast double* %103 to <2 x i64>*
  %wide.load214 = load <2 x i64>, <2 x i64>* %104, align 8, !alias.scope !16
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %95, i64 %indvars.iv82, i64 %index205
  %106 = bitcast double* %105 to <2 x i64>*
  store <2 x i64> %wide.load213, <2 x i64>* %106, align 8, !alias.scope !19, !noalias !16
  %107 = getelementptr double, double* %105, i64 2
  %108 = bitcast double* %107 to <2 x i64>*
  store <2 x i64> %wide.load214, <2 x i64>* %108, align 8, !alias.scope !19, !noalias !16
  %index.next206 = add i64 %index205, 4
  %109 = icmp eq i64 %index.next206, %n.vec186
  br i1 %109, label %middle.block181, label %vector.body180, !llvm.loop !21

middle.block181:                                  ; preds = %vector.body180
  br i1 %cmp.n208, label %for.inc118.us, label %for.inc115.us.preheader

for.inc115.us.preheader:                          ; preds = %middle.block181, %vector.memcheck203, %min.iters.checked184, %for.body102.us
  %indvars.iv.ph = phi i64 [ 0, %for.body102.us ], [ 0, %min.iters.checked184 ], [ 0, %vector.memcheck203 ], [ %n.vec186, %middle.block181 ]
  br label %for.inc115.us

for.inc115.us:                                    ; preds = %for.inc115.us.for.inc115.us_crit_edge, %for.inc115.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc115.us.for.inc115.us_crit_edge ], [ %indvars.iv.ph, %for.inc115.us.preheader ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %94, i64 0, i64 %indvars.iv82, i64 %indvars.iv
  %110 = bitcast double* %arrayidx110.us to i64*
  %111 = load i64, i64* %110, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %95, i64 %indvars.iv82, i64 %indvars.iv
  %112 = bitcast double* %arrayidx114.us to i64*
  store i64 %111, i64* %112, align 8
  %exitcond128 = icmp eq i64 %indvars.iv, %98
  br i1 %exitcond128, label %for.inc118.us.loopexit, label %for.inc115.us.for.inc115.us_crit_edge, !llvm.loop !22

for.inc115.us.for.inc115.us_crit_edge:            ; preds = %for.inc115.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc115.us

for.inc118.us.loopexit:                           ; preds = %for.inc115.us
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit, %middle.block181
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, 1
  %cmp100.us = icmp slt i64 %indvars.iv.next83, %93
  br i1 %cmp100.us, label %for.inc118.us.for.body102.us_crit_edge, label %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge

for.inc118.us.for.body102.us_crit_edge:           ; preds = %for.inc118.us
  %indvar.next190 = add i64 %indvar189, 1
  br label %for.body102.us

for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge: ; preds = %for.inc118.us
  %113 = trunc i64 %indvars.iv.next83 to i32
  br label %for.cond99.for.end120_crit_edge

for.body102.for.cond99.for.end120_crit_edge_crit_edge: ; preds = %for.body102.lr.ph
  %114 = add i32 %r.promoted, 1
  %115 = icmp sgt i32 %92, %114
  %smax = select i1 %115, i32 %92, i32 %114
  br label %for.cond99.for.end120_crit_edge

for.cond99.for.end120_crit_edge:                  ; preds = %for.body102.for.cond99.for.end120_crit_edge_crit_edge, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge
  %inc116.lcssa27.lcssa = phi i32 [ %92, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge ], [ 0, %for.body102.for.cond99.for.end120_crit_edge_crit_edge ]
  %inc119.lcssa = phi i32 [ %113, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge ], [ %smax, %for.body102.for.cond99.for.end120_crit_edge_crit_edge ]
  store i32 %inc119.lcssa, i32* %r, align 4
  store i32 %inc116.lcssa27.lcssa, i32* %s, align 4
  br label %for.end120

for.end120:                                       ; preds = %for.cond99.preheader, %for.cond99.for.end120_crit_edge
  %116 = bitcast [2000 x [2000 x double]]** %B to i8**
  %117 = load i8*, i8** %116, align 8
  tail call void @free(i8* %117) #4
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
  %cmp18 = icmp sgt i32 %n, 0
  br i1 %cmp18, label %for.body.lr.ph, label %for.end60

for.body.lr.ph:                                   ; preds = %entry
  %0 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %1 = load i32, i32* %n.addr, align 4
  %i.promoted42 = load i32, i32* %i, align 4
  %k.promoted = load i32, i32* %k, align 4
  %2 = sext i32 %i.promoted42 to i64
  %3 = add i32 %1, -1
  %4 = add i32 %i.promoted42, -1
  %5 = sext i32 %1 to i64
  %6 = sext i32 %1 to i64
  %wide.trip.count73 = sext i32 %3 to i64
  %7 = bitcast double* %w to i64*
  %8 = bitcast double* %w to i64*
  %9 = bitcast double* %w to i64*
  br label %for.body

for.body:                                         ; preds = %for.inc58.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %for.inc58.for.body_crit_edge ], [ %2, %for.body.lr.ph ]
  %indvars.iv97 = phi i32 [ %indvars.iv.next98, %for.inc58.for.body_crit_edge ], [ %4, %for.body.lr.ph ]
  %inc49.lcssa39.lcssa44 = phi i32 [ %inc49.lcssa39.lcssa45, %for.inc58.for.body_crit_edge ], [ %k.promoted, %for.body.lr.ph ]
  %10 = zext i32 %indvars.iv97 to i64
  %11 = add i32 %indvars.iv97, 1
  %cmp215 = icmp sgt i64 %indvars.iv101, 0
  br i1 %cmp215, label %for.body3.preheader, label %for.end27

for.body3.preheader:                              ; preds = %for.body
  br label %for.body3

for.body3:                                        ; preds = %for.inc25.for.body3_crit_edge, %for.body3.preheader
  %indvars.iv94 = phi i32 [ %indvars.iv.next95, %for.inc25.for.body3_crit_edge ], [ -1, %for.body3.preheader ]
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %for.inc25.for.body3_crit_edge ], [ 0, %for.body3.preheader ]
  %12 = zext i32 %indvars.iv94 to i64
  %13 = add i32 %indvars.iv94, 1
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv67
  %14 = bitcast double* %arrayidx5 to i64*
  %15 = load i64, i64* %14, align 8
  store i64 %15, i64* %7, align 8
  %cmp714 = icmp sgt i64 %indvars.iv67, 0
  br i1 %cmp714, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.body3
  %w.promoted31 = load double, double* %w, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %for.inc.lr.ph
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %for.inc.for.inc_crit_edge ], [ 0, %for.inc.lr.ph ]
  %sub32 = phi double [ %sub, %for.inc.for.inc_crit_edge ], [ %w.promoted31, %for.inc.lr.ph ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv61
  %16 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv61, i64 %indvars.iv67
  %17 = load double, double* %arrayidx16, align 8
  %mul = fmul double %16, %17
  %sub = fsub double %sub32, %mul
  %exitcond96 = icmp eq i64 %indvars.iv61, %12
  br i1 %exitcond96, label %for.cond6.for.inc25_crit_edge, label %for.inc.for.inc_crit_edge

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  br label %for.inc

for.cond6.for.inc25_crit_edge:                    ; preds = %for.inc
  store double %sub, double* %w, align 8
  br label %for.inc25

for.inc25:                                        ; preds = %for.body3, %for.cond6.for.inc25_crit_edge
  %inc.lcssa34 = phi i32 [ %13, %for.cond6.for.inc25_crit_edge ], [ 0, %for.body3 ]
  %18 = load double, double* %w, align 8
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv67, i64 %indvars.iv67
  %19 = load double, double* %arrayidx20, align 8
  %div = fdiv double %18, %19
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv67
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next68, %indvars.iv101
  br i1 %exitcond103, label %for.end27.loopexit, label %for.inc25.for.body3_crit_edge

for.inc25.for.body3_crit_edge:                    ; preds = %for.inc25
  %indvars.iv.next95 = add i32 %indvars.iv94, 1
  br label %for.body3

for.end27.loopexit:                               ; preds = %for.inc25
  br label %for.end27

for.end27:                                        ; preds = %for.end27.loopexit, %for.body
  %inc49.lcssa39.lcssa43 = phi i32 [ %inc49.lcssa39.lcssa44, %for.body ], [ %inc.lcssa34, %for.end27.loopexit ]
  %cmp2917 = icmp slt i64 %indvars.iv101, %6
  br i1 %cmp2917, label %for.body30.lr.ph, label %for.inc58

for.body30.lr.ph:                                 ; preds = %for.end27
  %cmp3616 = icmp sgt i64 %indvars.iv101, 0
  br i1 %cmp3616, label %for.body30.us.preheader, label %for.body30.preheader

for.body30.preheader:                             ; preds = %for.body30.lr.ph
  br label %for.body30

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.cond35.for.inc55_crit_edge.us, %for.body30.us.preheader
  %indvars.iv84 = phi i64 [ %indvars.iv101, %for.body30.us.preheader ], [ %indvars.iv.next85, %for.cond35.for.inc55_crit_edge.us ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv84
  %20 = bitcast double* %arrayidx34.us to i64*
  %21 = load i64, i64* %20, align 8
  store i64 %21, i64* %8, align 8
  %w.promoted36.us.cast = bitcast i64 %21 to double
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.for.inc48.us_crit_edge, %for.body30.us
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %for.inc48.us.for.inc48.us_crit_edge ], [ 0, %for.body30.us ]
  %sub4737.us = phi double [ %sub47.us, %for.inc48.us.for.inc48.us_crit_edge ], [ %w.promoted36.us.cast, %for.body30.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv76
  %22 = load double, double* %arrayidx41.us, align 8
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76, i64 %indvars.iv84
  %23 = load double, double* %arrayidx45.us, align 8
  %mul46.us = fmul double %22, %23
  %sub47.us = fsub double %sub4737.us, %mul46.us
  %exitcond99 = icmp eq i64 %indvars.iv76, %10
  br i1 %exitcond99, label %for.cond35.for.inc55_crit_edge.us, label %for.inc48.us.for.inc48.us_crit_edge

for.inc48.us.for.inc48.us_crit_edge:              ; preds = %for.inc48.us
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  br label %for.inc48.us

for.cond35.for.inc55_crit_edge.us:                ; preds = %for.inc48.us
  store double %sub47.us, double* %w, align 8
  %arrayidx54.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv84
  store double %sub47.us, double* %arrayidx54.us, align 8
  %indvars.iv.next85 = add i64 %indvars.iv84, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next85, %6
  br i1 %exitcond100, label %for.inc58.loopexit, label %for.body30.us

for.body30:                                       ; preds = %for.body30.for.body30_crit_edge, %for.body30.preheader
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %for.body30.for.body30_crit_edge ], [ %indvars.iv101, %for.body30.preheader ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv71
  %24 = bitcast double* %arrayidx34 to i64*
  %25 = load i64, i64* %24, align 8
  %arrayidx54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv71
  %26 = bitcast double* %arrayidx54 to i64*
  store i64 %25, i64* %26, align 8
  %exitcond74 = icmp eq i64 %indvars.iv71, %wide.trip.count73
  br i1 %exitcond74, label %for.inc58.loopexit90, label %for.body30.for.body30_crit_edge

for.body30.for.body30_crit_edge:                  ; preds = %for.body30
  %indvars.iv.next72 = add i64 %indvars.iv71, 1
  br label %for.body30

for.inc58.loopexit90:                             ; preds = %for.body30
  store i64 %25, i64* %9, align 8
  br label %for.inc58

for.inc58.loopexit:                               ; preds = %for.cond35.for.inc55_crit_edge.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.end27, %for.inc58.loopexit90
  %inc49.lcssa39.lcssa45 = phi i32 [ 0, %for.inc58.loopexit90 ], [ %inc49.lcssa39.lcssa43, %for.end27 ], [ %11, %for.inc58.loopexit ]
  %indvars.iv.next102 = add nsw i64 %indvars.iv101, 1
  %cmp = icmp slt i64 %indvars.iv.next102, %5
  br i1 %cmp, label %for.inc58.for.body_crit_edge, label %for.cond.for.end60_crit_edge

for.inc58.for.body_crit_edge:                     ; preds = %for.inc58
  %indvars.iv.next98 = add i32 %indvars.iv97, 1
  br label %for.body

for.cond.for.end60_crit_edge:                     ; preds = %for.inc58
  %27 = trunc i64 %indvars.iv.next102 to i32
  store i32 %27, i32* %i, align 4
  store i32 %inc49.lcssa39.lcssa45, i32* %k, align 4
  br label %for.end60

for.end60:                                        ; preds = %entry, %for.cond.for.end60_crit_edge
  store i32 0, i32* %i, align 4
  %28 = load i32, i32* %n.addr, align 4
  %cmp6213 = icmp sgt i32 %28, 0
  br i1 %cmp6213, label %for.body63.lr.ph, label %for.end84.thread

for.end84.thread:                                 ; preds = %for.end60
  %sub8588 = add nsw i32 %28, -1
  store i32 %sub8588, i32* %i, align 4
  br label %for.end113

for.body63.lr.ph:                                 ; preds = %for.end60
  %29 = load double*, double** %b.addr, align 8
  %30 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %31 = load double*, double** %y.addr, align 8
  %32 = load i32, i32* %n.addr, align 4
  %i.promoted27 = load i32, i32* %i, align 4
  %33 = add i32 %i.promoted27, -1
  %34 = sext i32 %i.promoted27 to i64
  %35 = sext i32 %32 to i64
  %36 = bitcast double* %w to i64*
  %37 = bitcast double* %w to i64*
  br label %for.body63

for.body63:                                       ; preds = %for.inc82.for.body63_crit_edge, %for.body63.lr.ph
  %indvars.iv91 = phi i32 [ %indvars.iv.next92, %for.inc82.for.body63_crit_edge ], [ %33, %for.body63.lr.ph ]
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %for.inc82.for.body63_crit_edge ], [ %34, %for.body63.lr.ph ]
  %38 = zext i32 %indvars.iv91 to i64
  %arrayidx65 = getelementptr inbounds double, double* %29, i64 %indvars.iv59
  %39 = bitcast double* %arrayidx65 to i64*
  %40 = load i64, i64* %39, align 8
  store i64 %40, i64* %36, align 8
  %cmp6712 = icmp sgt i64 %indvars.iv59, 0
  br i1 %cmp6712, label %for.inc77.lr.ph, label %for.inc82

for.inc77.lr.ph:                                  ; preds = %for.body63
  %w.promoted25 = load double, double* %w, align 8
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77.for.inc77_crit_edge, %for.inc77.lr.ph
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %for.inc77.for.inc77_crit_edge ], [ 0, %for.inc77.lr.ph ]
  %sub7626 = phi double [ %sub76, %for.inc77.for.inc77_crit_edge ], [ %w.promoted25, %for.inc77.lr.ph ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i64 %indvars.iv59, i64 %indvars.iv53
  %41 = load double, double* %arrayidx72, align 8
  %arrayidx74 = getelementptr inbounds double, double* %31, i64 %indvars.iv53
  %42 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %41, %42
  %sub76 = fsub double %sub7626, %mul75
  %exitcond93 = icmp eq i64 %indvars.iv53, %38
  br i1 %exitcond93, label %for.cond66.for.inc82_crit_edge, label %for.inc77.for.inc77_crit_edge

for.inc77.for.inc77_crit_edge:                    ; preds = %for.inc77
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  br label %for.inc77

for.cond66.for.inc82_crit_edge:                   ; preds = %for.inc77
  store double %sub76, double* %w, align 8
  br label %for.inc82

for.inc82:                                        ; preds = %for.body63, %for.cond66.for.inc82_crit_edge
  %43 = load i64, i64* %37, align 8
  %arrayidx81 = getelementptr inbounds double, double* %31, i64 %indvars.iv59
  %44 = bitcast double* %arrayidx81 to i64*
  store i64 %43, i64* %44, align 8
  %indvars.iv.next60 = add nsw i64 %indvars.iv59, 1
  %cmp62 = icmp slt i64 %indvars.iv.next60, %35
  br i1 %cmp62, label %for.inc82.for.body63_crit_edge, label %for.end84

for.inc82.for.body63_crit_edge:                   ; preds = %for.inc82
  %indvars.iv.next92 = add i32 %indvars.iv91, 1
  br label %for.body63

for.end84:                                        ; preds = %for.inc82
  %.pr = load i32, i32* %n.addr, align 4
  %sub85 = add nsw i32 %.pr, -1
  store i32 %sub85, i32* %i, align 4
  %cmp8711 = icmp sgt i32 %.pr, 0
  br i1 %cmp8711, label %for.body88.lr.ph, label %for.end113

for.body88.lr.ph:                                 ; preds = %for.end84
  %45 = load double*, double** %y.addr, align 8
  %46 = load i32, i32* %n.addr, align 4
  %47 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %48 = load double*, double** %x.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  %49 = add i32 %i.promoted, 1
  %50 = add i32 %46, -1
  %51 = sext i32 %i.promoted to i64
  %52 = sext i32 %46 to i64
  %wide.trip.count = sext i32 %50 to i64
  %53 = bitcast double* %w to i64*
  br label %for.body88

for.body88:                                       ; preds = %for.inc112.for.body88_crit_edge, %for.body88.lr.ph
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.inc112.for.body88_crit_edge ], [ %51, %for.body88.lr.ph ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc112.for.body88_crit_edge ], [ %49, %for.body88.lr.ph ]
  %arrayidx90 = getelementptr inbounds double, double* %45, i64 %indvars.iv50
  %54 = bitcast double* %arrayidx90 to i64*
  %55 = load i64, i64* %54, align 8
  store i64 %55, i64* %53, align 8
  %56 = add nsw i64 %indvars.iv50, 1
  %cmp9210 = icmp slt i64 %56, %52
  br i1 %cmp9210, label %for.inc102.lr.ph, label %for.inc112

for.inc102.lr.ph:                                 ; preds = %for.body88
  %57 = sext i32 %indvars.iv to i64
  %w.promoted = load double, double* %w, align 8
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102.for.inc102_crit_edge, %for.inc102.lr.ph
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.inc102.for.inc102_crit_edge ], [ %57, %for.inc102.lr.ph ]
  %sub10120 = phi double [ %sub101, %for.inc102.for.inc102_crit_edge ], [ %w.promoted, %for.inc102.lr.ph ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %47, i64 %indvars.iv50, i64 %indvars.iv48
  %58 = load double, double* %arrayidx97, align 8
  %arrayidx99 = getelementptr inbounds double, double* %48, i64 %indvars.iv48
  %59 = load double, double* %arrayidx99, align 8
  %mul100 = fmul double %58, %59
  %sub101 = fsub double %sub10120, %mul100
  %exitcond = icmp eq i64 %indvars.iv48, %wide.trip.count
  br i1 %exitcond, label %for.cond91.for.inc112_crit_edge, label %for.inc102.for.inc102_crit_edge

for.inc102.for.inc102_crit_edge:                  ; preds = %for.inc102
  %indvars.iv.next49 = add nsw i64 %indvars.iv48, 1
  br label %for.inc102

for.cond91.for.inc112_crit_edge:                  ; preds = %for.inc102
  store double %sub101, double* %w, align 8
  br label %for.inc112

for.inc112:                                       ; preds = %for.body88, %for.cond91.for.inc112_crit_edge
  %60 = load double, double* %w, align 8
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %47, i64 %indvars.iv50, i64 %indvars.iv50
  %61 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %60, %61
  %arrayidx111 = getelementptr inbounds double, double* %48, i64 %indvars.iv50
  store double %div109, double* %arrayidx111, align 8
  %indvars.iv.next51 = add nsw i64 %indvars.iv50, -1
  %cmp87 = icmp sgt i64 %indvars.iv50, 0
  br i1 %cmp87, label %for.inc112.for.body88_crit_edge, label %for.cond86.for.end113_crit_edge

for.inc112.for.body88_crit_edge:                  ; preds = %for.inc112
  %indvars.iv.next = add i32 %indvars.iv, -1
  br label %for.body88

for.cond86.for.end113_crit_edge:                  ; preds = %for.inc112
  %62 = trunc i64 %indvars.iv.next51 to i32
  store i32 %62, i32* %i, align 4
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
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
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
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
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
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #6
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
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !2, !3}
!22 = distinct !{!22, !2, !3}
