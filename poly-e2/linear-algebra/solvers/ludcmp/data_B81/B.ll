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
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %0 = bitcast [2000 x [2000 x double]]** %A to i8**
  store i8* %call, i8** %0, align 8
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %1 = bitcast [2000 x double]** %b to i8**
  store i8* %call1, i8** %1, align 8
  %call2 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %2 = bitcast [2000 x double]** %x to i8**
  store i8* %call2, i8** %2, align 8
  %call3 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
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
  call fastcc void @init_array(i32 %4, [2000 x double]* %6, double* %8, double* %10, double* %12)
  call void (...) @polybench_timer_start() #4
  %13 = load i32, i32* %n, align 4
  %14 = bitcast [2000 x [2000 x double]]** %A to [2000 x double]**
  %15 = load [2000 x double]*, [2000 x double]** %14, align 8
  %16 = bitcast [2000 x double]** %b to double**
  %17 = load double*, double** %16, align 8
  %18 = bitcast [2000 x double]** %x to double**
  %19 = load double*, double** %18, align 8
  %20 = bitcast [2000 x double]** %y to double**
  %21 = load double*, double** %20, align 8
  call fastcc void @kernel_ludcmp(i32 %13, [2000 x double]* %15, double* %17, double* %19, double* %21)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
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
  call fastcc void @print_array(i32 %25, double* %27)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  %28 = bitcast [2000 x [2000 x double]]** %A to i8**
  %29 = load i8*, i8** %28, align 8
  call void @free(i8* %29) #4
  %30 = bitcast [2000 x double]** %b to i8**
  %31 = load i8*, i8** %30, align 8
  call void @free(i8* %31) #4
  %32 = bitcast [2000 x double]** %x to i8**
  %33 = load i8*, i8** %32, align 8
  call void @free(i8* %33) #4
  %34 = bitcast [2000 x double]** %y to i8**
  %35 = load i8*, i8** %34, align 8
  call void @free(i8* %35) #4
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
  br i1 %cmp23, label %for.body.lr.ph, label %for.cond9.preheader.thread

for.cond9.preheader.thread:                       ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.end46

for.body.lr.ph:                                   ; preds = %entry
  %1 = load double*, double** %x.addr, align 8
  %2 = load double*, double** %y.addr, align 8
  %3 = load double, double* %fn, align 8
  %4 = load double*, double** %b.addr, align 8
  %5 = load i32, i32* %n.addr, align 4
  %i.promoted75 = load i32, i32* %i, align 4
  %6 = sext i32 %i.promoted75 to i64
  %7 = sext i32 %5 to i64
  br label %for.body

for.cond9.preheader:                              ; preds = %for.body
  %.pr = load i32, i32* %n.addr, align 4
  store i32 0, i32* %i, align 4
  %cmp1022 = icmp sgt i32 %.pr, 0
  br i1 %cmp1022, label %for.cond13.preheader.lr.ph, label %for.end46

for.cond13.preheader.lr.ph:                       ; preds = %for.cond9.preheader
  %8 = load i32, i32* %n.addr, align 4
  %conv18 = sitofp i32 %8 to double
  %i.promoted = load i32, i32* %i, align 4
  %9 = add i32 %8, -1
  %10 = sext i32 %i.promoted to i64
  %11 = sext i32 %8 to i64
  %12 = sext i32 %8 to i64
  %13 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %wide.trip.count112 = sext i32 %9 to i64
  br label %for.cond13.preheader

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv116 = phi i64 [ %6, %for.body.lr.ph ], [ %indvars.iv.next117, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %1, i64 %indvars.iv116
  store double 0.000000e+00, double* %arrayidx, align 8
  %arrayidx3 = getelementptr inbounds double, double* %2, i64 %indvars.iv116
  store double 0.000000e+00, double* %arrayidx3, align 8
  %indvars.iv.next117 = add nsw i64 %indvars.iv116, 1
  %14 = trunc i64 %indvars.iv.next117 to i32
  %conv4 = sitofp i32 %14 to double
  %div = fdiv double %conv4, %3
  %div5 = fmul double %div, 5.000000e-01
  %add6 = fadd double %div5, 4.000000e+00
  %arrayidx8 = getelementptr inbounds double, double* %4, i64 %indvars.iv116
  store double %add6, double* %arrayidx8, align 8
  %cmp = icmp slt i64 %indvars.iv.next117, %7
  br i1 %cmp, label %for.body, label %for.cond9.preheader

for.cond13.preheader:                             ; preds = %for.end39, %for.cond13.preheader.lr.ph
  %indvars.iv133 = phi i32 [ %i.promoted, %for.cond13.preheader.lr.ph ], [ %indvars.iv.next134, %for.end39 ]
  %indvars.iv114 = phi i64 [ %10, %for.cond13.preheader.lr.ph ], [ %indvars.iv.next115, %for.end39 ]
  %15 = zext i32 %indvars.iv133 to i64
  %indvars.iv.next134 = add i32 %indvars.iv133, 1
  %16 = sext i32 %indvars.iv.next134 to i64
  %cmp1416 = icmp slt i64 %indvars.iv114, 0
  br i1 %cmp1416, label %for.end27, label %for.body16.preheader

for.body16.preheader:                             ; preds = %for.cond13.preheader
  br label %for.body16

for.body16:                                       ; preds = %for.body16.preheader, %for.body16.for.body16_crit_edge
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %for.body16.for.body16_crit_edge ], [ 0, %for.body16.preheader ]
  %17 = sub nsw i64 0, %indvars.iv101
  %18 = trunc i64 %17 to i32
  %rem = srem i32 %18, %8
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, %conv18
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv114, i64 %indvars.iv101
  store double %add20, double* %arrayidx24, align 8
  %exitcond135 = icmp eq i64 %indvars.iv101, %15
  br i1 %exitcond135, label %for.end27.loopexit, label %for.body16.for.body16_crit_edge

for.body16.for.body16_crit_edge:                  ; preds = %for.body16
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  br label %for.body16

for.end27.loopexit:                               ; preds = %for.body16
  br label %for.end27

for.end27:                                        ; preds = %for.end27.loopexit, %for.cond13.preheader
  %indvars.iv.next115 = add i64 %indvars.iv114, 1
  %cmp3018 = icmp slt i64 %indvars.iv.next115, %11
  br i1 %cmp3018, label %for.body32.preheader, label %for.end39

for.body32.preheader:                             ; preds = %for.end27
  br label %for.body32

for.body32:                                       ; preds = %for.body32.preheader, %for.body32.for.body32_crit_edge
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %for.body32.for.body32_crit_edge ], [ %16, %for.body32.preheader ]
  %arrayidx36 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv114, i64 %indvars.iv110
  store double 0.000000e+00, double* %arrayidx36, align 8
  %exitcond113 = icmp eq i64 %indvars.iv110, %wide.trip.count112
  br i1 %exitcond113, label %for.end39.loopexit, label %for.body32.for.body32_crit_edge

for.body32.for.body32_crit_edge:                  ; preds = %for.body32
  %indvars.iv.next111 = add nsw i64 %indvars.iv110, 1
  br label %for.body32

for.end39.loopexit:                               ; preds = %for.body32
  br label %for.end39

for.end39:                                        ; preds = %for.end39.loopexit, %for.end27
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv114, i64 %indvars.iv114
  store double 1.000000e+00, double* %arrayidx43, align 8
  %cmp10 = icmp slt i64 %indvars.iv.next115, %12
  br i1 %cmp10, label %for.cond13.preheader, label %for.cond9.for.end46_crit_edge

for.cond9.for.end46_crit_edge:                    ; preds = %for.end39
  %19 = trunc i64 %indvars.iv.next115 to i32
  store i32 %19, i32* %i, align 4
  br label %for.end46

for.end46:                                        ; preds = %for.cond9.preheader, %for.cond9.preheader.thread, %for.cond9.for.end46_crit_edge
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %20 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %20, align 8
  store i32 0, i32* %r, align 4
  %21 = load i32, i32* %n.addr, align 4
  %cmp4815 = icmp sgt i32 %21, 0
  br i1 %cmp4815, label %for.cond51.preheader.lr.ph, label %for.cond65.preheader.thread

for.cond65.preheader.thread:                      ; preds = %for.end46
  store i32 0, i32* %t, align 4
  store i32 0, i32* %r, align 4
  br label %for.cond99.preheader

for.cond51.preheader.lr.ph:                       ; preds = %for.end46
  %22 = load i32, i32* %n.addr, align 4
  %23 = sext i32 %22 to i64
  %cmp5214 = icmp sgt i32 %22, 0
  %24 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  br i1 %cmp5214, label %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge, label %for.cond65.preheader

for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge: ; preds = %for.cond51.preheader.lr.ph
  %r.promoted66 = load i32, i32* %r, align 4
  %25 = add i32 %22, -1
  %26 = sext i32 %r.promoted66 to i64
  %27 = zext i32 %25 to i64
  %28 = shl nuw nsw i64 %27, 3
  %29 = add nuw nsw i64 %28, 8
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us.for.inc62.us_crit_edge, %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %for.inc62.us.for.inc62.us_crit_edge ], [ %26, %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge ]
  %indvar = phi i64 [ %indvar.next, %for.inc62.us.for.inc62.us_crit_edge ], [ 0, %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge ]
  %30 = add nsw i64 %26, %indvar
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %30, i64 0
  %scevgep97 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next99 = add nsw i64 %indvars.iv98, 1
  %cmp48.us = icmp slt i64 %indvars.iv.next99, %23
  br i1 %cmp48.us, label %for.inc62.us.for.inc62.us_crit_edge, label %for.cond65.preheader.loopexit

for.inc62.us.for.inc62.us_crit_edge:              ; preds = %for.inc62.us
  %indvar.next = add nuw nsw i64 %indvar, 1
  br label %for.inc62.us

for.cond65.preheader.loopexit:                    ; preds = %for.inc62.us
  br label %for.cond65.preheader

for.cond65.preheader:                             ; preds = %for.cond65.preheader.loopexit, %for.cond51.preheader.lr.ph
  %inc60.lcssa69.lcssa = phi i32 [ 0, %for.cond51.preheader.lr.ph ], [ %22, %for.cond65.preheader.loopexit ]
  store i32 %inc60.lcssa69.lcssa, i32* %s, align 4
  %.pr124 = load i32, i32* %n.addr, align 4
  store i32 0, i32* %t, align 4
  %cmp6613 = icmp sgt i32 %.pr124, 0
  store i32 0, i32* %r, align 4
  br i1 %cmp6613, label %for.cond69.preheader.lr.ph, label %for.cond99.preheader

for.cond69.preheader.lr.ph:                       ; preds = %for.cond65.preheader
  %31 = load i32, i32* %n.addr, align 4
  %32 = sext i32 %31 to i64
  %cmp7411 = icmp sgt i32 %31, 0
  %33 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %34 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %r.promoted33 = load i32, i32* %r, align 4
  %t.promoted = load i32, i32* %t, align 4
  %35 = sext i32 %t.promoted to i64
  %s.promoted = load i32, i32* %s, align 4
  br i1 %cmp7411, label %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge, label %for.cond69.preheader.preheader

for.cond69.preheader.preheader:                   ; preds = %for.cond69.preheader.lr.ph
  br label %for.cond69.preheader

for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge: ; preds = %for.cond69.preheader.lr.ph
  %36 = add i32 %31, -1
  %37 = zext i32 %36 to i64
  br label %for.cond69.preheader.us

for.cond69.preheader.us:                          ; preds = %for.inc96.us, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge
  %indvars.iv90 = phi i64 [ %35, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ], [ %indvars.iv.next91, %for.inc96.us ]
  %inc91.lcssa32.lcssa36.us = phi i32 [ %s.promoted, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ], [ %inc91.lcssa32.lcssa37.us, %for.inc96.us ]
  %inc94.lcssa34.us = phi i32 [ %r.promoted33, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ], [ 0, %for.inc96.us ]
  %cmp7012.us = icmp slt i32 %inc94.lcssa34.us, %31
  br i1 %cmp7012.us, label %for.cond73.preheader.lr.ph.us, label %for.inc96.us

for.cond73.preheader.lr.ph.us:                    ; preds = %for.cond69.preheader.us
  %38 = sext i32 %inc94.lcssa34.us to i64
  br label %for.cond73.preheader.us.us

for.inc96.us.loopexit:                            ; preds = %for.inc93.us.us
  br label %for.inc96.us

for.inc96.us:                                     ; preds = %for.inc96.us.loopexit, %for.cond69.preheader.us
  %inc91.lcssa32.lcssa37.us = phi i32 [ %inc91.lcssa32.lcssa36.us, %for.cond69.preheader.us ], [ %31, %for.inc96.us.loopexit ]
  %indvars.iv.next91 = add nsw i64 %indvars.iv90, 1
  %cmp66.us = icmp slt i64 %indvars.iv.next91, %32
  br i1 %cmp66.us, label %for.cond69.preheader.us, label %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge

for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge: ; preds = %for.inc96.us
  %39 = trunc i64 %indvars.iv.next91 to i32
  br label %for.cond65.for.cond99.preheader_crit_edge

for.cond73.preheader.us.us:                       ; preds = %for.inc93.us.us, %for.cond73.preheader.lr.ph.us
  %indvars.iv88 = phi i64 [ %38, %for.cond73.preheader.lr.ph.us ], [ %indvars.iv.next89, %for.inc93.us.us ]
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %indvars.iv88, i64 %indvars.iv90
  br label %for.body76.us.us

for.inc93.us.us:                                  ; preds = %for.body76.us.us
  %indvars.iv.next89 = add nsw i64 %indvars.iv88, 1
  %exitcond130 = icmp eq i64 %indvars.iv.next89, %32
  br i1 %exitcond130, label %for.inc96.us.loopexit, label %for.cond73.preheader.us.us

for.body76.us.us:                                 ; preds = %for.body76.us.us.for.body76.us.us_crit_edge, %for.cond73.preheader.us.us
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %for.body76.us.us.for.body76.us.us_crit_edge ], [ 0, %for.cond73.preheader.us.us ]
  %40 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %indvars.iv84, i64 %indvars.iv90
  %41 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %40, %41
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv88, i64 %indvars.iv84
  %42 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %mul.us.us, %42
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %exitcond = icmp eq i64 %indvars.iv84, %37
  br i1 %exitcond, label %for.inc93.us.us, label %for.body76.us.us.for.body76.us.us_crit_edge

for.body76.us.us.for.body76.us.us_crit_edge:      ; preds = %for.body76.us.us
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  br label %for.body76.us.us

for.cond69.preheader:                             ; preds = %for.cond69.preheader.preheader, %for.cond69.preheader
  %inc91.lcssa32.lcssa36 = phi i32 [ %.inc91.lcssa32.lcssa36, %for.cond69.preheader ], [ %s.promoted, %for.cond69.preheader.preheader ]
  %inc9735 = phi i32 [ %inc97, %for.cond69.preheader ], [ %t.promoted, %for.cond69.preheader.preheader ]
  %inc94.lcssa34 = phi i32 [ 0, %for.cond69.preheader ], [ %r.promoted33, %for.cond69.preheader.preheader ]
  %cmp7012 = icmp slt i32 %inc94.lcssa34, %31
  %.inc91.lcssa32.lcssa36 = select i1 %cmp7012, i32 0, i32 %inc91.lcssa32.lcssa36
  %inc97 = add nsw i32 %inc9735, 1
  %cmp66 = icmp slt i32 %inc97, %31
  br i1 %cmp66, label %for.cond69.preheader, label %for.cond65.for.cond99.preheader_crit_edge.loopexit

for.cond65.for.cond99.preheader_crit_edge.loopexit: ; preds = %for.cond69.preheader
  br label %for.cond65.for.cond99.preheader_crit_edge

for.cond65.for.cond99.preheader_crit_edge:        ; preds = %for.cond65.for.cond99.preheader_crit_edge.loopexit, %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge
  %inc91.lcssa32.lcssa37.lcssa = phi i32 [ %inc91.lcssa32.lcssa37.us, %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge ], [ %.inc91.lcssa32.lcssa36, %for.cond65.for.cond99.preheader_crit_edge.loopexit ]
  %inc97.lcssa = phi i32 [ %39, %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge ], [ %inc97, %for.cond65.for.cond99.preheader_crit_edge.loopexit ]
  store i32 0, i32* %r, align 4
  store i32 %inc97.lcssa, i32* %t, align 4
  store i32 %inc91.lcssa32.lcssa37.lcssa, i32* %s, align 4
  br label %for.cond99.preheader

for.cond99.preheader:                             ; preds = %for.cond65.preheader, %for.cond65.preheader.thread, %for.cond65.for.cond99.preheader_crit_edge
  %43 = load i32, i32* %r, align 4
  %44 = load i32, i32* %n.addr, align 4
  %cmp10010 = icmp slt i32 %43, %44
  br i1 %cmp10010, label %for.cond103.preheader.lr.ph, label %for.end120

for.cond103.preheader.lr.ph:                      ; preds = %for.cond99.preheader
  %45 = load i32, i32* %n.addr, align 4
  %46 = sext i32 %45 to i64
  %cmp1049 = icmp sgt i32 %45, 0
  %47 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %48 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %r.promoted = load i32, i32* %r, align 4
  %49 = sext i32 %r.promoted to i64
  br i1 %cmp1049, label %for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge, label %for.cond103.preheader.for.cond99.for.end120_crit_edge_crit_edge

for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge: ; preds = %for.cond103.preheader.lr.ph
  %50 = add i32 %45, -1
  %51 = zext i32 %50 to i64
  br label %for.cond103.preheader.us

for.cond103.preheader.us:                         ; preds = %for.inc118.us, %for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge
  %indvars.iv82 = phi i64 [ %49, %for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge ], [ %indvars.iv.next83, %for.inc118.us ]
  br label %for.body106.us

for.body106.us:                                   ; preds = %for.body106.us.for.body106.us_crit_edge, %for.cond103.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body106.us.for.body106.us_crit_edge ], [ 0, %for.cond103.preheader.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv82, i64 %indvars.iv
  %52 = bitcast double* %arrayidx110.us to i64*
  %53 = load i64, i64* %52, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %48, i64 %indvars.iv82, i64 %indvars.iv
  %54 = bitcast double* %arrayidx114.us to i64*
  store i64 %53, i64* %54, align 8
  %exitcond128 = icmp eq i64 %indvars.iv, %51
  br i1 %exitcond128, label %for.inc118.us, label %for.body106.us.for.body106.us_crit_edge

for.body106.us.for.body106.us_crit_edge:          ; preds = %for.body106.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body106.us

for.inc118.us:                                    ; preds = %for.body106.us
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, 1
  %cmp100.us = icmp slt i64 %indvars.iv.next83, %46
  br i1 %cmp100.us, label %for.cond103.preheader.us, label %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge

for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge: ; preds = %for.inc118.us
  %55 = trunc i64 %indvars.iv.next83 to i32
  br label %for.cond99.for.end120_crit_edge

for.cond103.preheader.for.cond99.for.end120_crit_edge_crit_edge: ; preds = %for.cond103.preheader.lr.ph
  %56 = add i32 %r.promoted, 1
  %57 = icmp sgt i32 %45, %56
  %smax = select i1 %57, i32 %45, i32 %56
  br label %for.cond99.for.end120_crit_edge

for.cond99.for.end120_crit_edge:                  ; preds = %for.cond103.preheader.for.cond99.for.end120_crit_edge_crit_edge, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge
  %inc116.lcssa27.lcssa = phi i32 [ %45, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge ], [ 0, %for.cond103.preheader.for.cond99.for.end120_crit_edge_crit_edge ]
  %inc119.lcssa = phi i32 [ %55, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge ], [ %smax, %for.cond103.preheader.for.cond99.for.end120_crit_edge_crit_edge ]
  store i32 %inc119.lcssa, i32* %r, align 4
  store i32 %inc116.lcssa27.lcssa, i32* %s, align 4
  br label %for.end120

for.end120:                                       ; preds = %for.cond99.preheader, %for.cond99.for.end120_crit_edge
  %58 = bitcast [2000 x [2000 x double]]** %B to i8**
  %59 = load i8*, i8** %58, align 8
  call void @free(i8* %59) #4
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
  %cmp19 = icmp sgt i32 %n, 0
  br i1 %cmp19, label %for.cond1.preheader.lr.ph, label %for.cond61.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %1 = load i32, i32* %n.addr, align 4
  %i.promoted43 = load i32, i32* %i, align 4
  %k.promoted = load i32, i32* %k, align 4
  %2 = sext i32 %i.promoted43 to i64
  %3 = add i32 %1, -1
  %4 = add i32 %i.promoted43, -1
  %5 = sext i32 %1 to i64
  %6 = sext i32 %1 to i64
  %wide.trip.count74 = sext i32 %3 to i64
  %7 = bitcast double* %w to i64*
  %8 = bitcast double* %w to i64*
  %9 = bitcast double* %w to i64*
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv98 = phi i32 [ %indvars.iv.next99, %for.inc58.for.cond1.preheader_crit_edge ], [ %4, %for.cond1.preheader.lr.ph ]
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %for.inc58.for.cond1.preheader_crit_edge ], [ %2, %for.cond1.preheader.lr.ph ]
  %inc49.lcssa40.lcssa45 = phi i32 [ %inc49.lcssa40.lcssa46, %for.inc58.for.cond1.preheader_crit_edge ], [ %k.promoted, %for.cond1.preheader.lr.ph ]
  %10 = zext i32 %indvars.iv98 to i64
  %11 = add i32 %indvars.iv98, 1
  %cmp216 = icmp sgt i64 %indvars.iv87, 0
  br i1 %cmp216, label %for.body3.preheader, label %for.end27

for.body3.preheader:                              ; preds = %for.cond1.preheader
  br label %for.body3

for.cond.for.cond61.preheader_crit_edge:          ; preds = %for.inc58
  %12 = trunc i64 %indvars.iv.next88 to i32
  store i32 %12, i32* %i, align 4
  store i32 %inc49.lcssa40.lcssa46, i32* %k, align 4
  br label %for.cond61.preheader

for.cond61.preheader:                             ; preds = %entry, %for.cond.for.cond61.preheader_crit_edge
  store i32 0, i32* %i, align 4
  %13 = load i32, i32* %n.addr, align 4
  %cmp6214 = icmp sgt i32 %13, 0
  br i1 %cmp6214, label %for.body63.lr.ph, label %for.end84.thread

for.end84.thread:                                 ; preds = %for.cond61.preheader
  %storemerge21189 = add nsw i32 %13, -1
  store i32 %storemerge21189, i32* %i, align 4
  br label %for.end113

for.body63.lr.ph:                                 ; preds = %for.cond61.preheader
  %14 = load double*, double** %b.addr, align 8
  %15 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %16 = load double*, double** %y.addr, align 8
  %17 = load i32, i32* %n.addr, align 4
  %i.promoted28 = load i32, i32* %i, align 4
  %18 = add i32 %i.promoted28, -1
  %19 = sext i32 %i.promoted28 to i64
  %20 = sext i32 %17 to i64
  %21 = bitcast double* %w to i64*
  %22 = bitcast double* %w to i64*
  br label %for.body63

for.body3:                                        ; preds = %for.body3.preheader, %for.end.for.body3_crit_edge
  %indvars.iv95 = phi i32 [ %indvars.iv.next96, %for.end.for.body3_crit_edge ], [ -1, %for.body3.preheader ]
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.end.for.body3_crit_edge ], [ 0, %for.body3.preheader ]
  %23 = zext i32 %indvars.iv95 to i64
  %24 = add i32 %indvars.iv95, 1
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 %indvars.iv68
  %25 = bitcast double* %arrayidx5 to i64*
  %26 = load i64, i64* %25, align 8
  store i64 %26, i64* %7, align 8
  %cmp715 = icmp sgt i64 %indvars.iv68, 0
  br i1 %cmp715, label %for.body8.lr.ph, label %for.end

for.body8.lr.ph:                                  ; preds = %for.body3
  %w.promoted32 = load double, double* %w, align 8
  br label %for.body8

for.body8:                                        ; preds = %for.body8.for.body8_crit_edge, %for.body8.lr.ph
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.body8.for.body8_crit_edge ], [ 0, %for.body8.lr.ph ]
  %sub33 = phi double [ %sub, %for.body8.for.body8_crit_edge ], [ %w.promoted32, %for.body8.lr.ph ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 %indvars.iv62
  %27 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv62, i64 %indvars.iv68
  %28 = load double, double* %arrayidx16, align 8
  %mul = fmul double %27, %28
  %sub = fsub double %sub33, %mul
  %exitcond97 = icmp eq i64 %indvars.iv62, %23
  br i1 %exitcond97, label %for.cond6.for.end_crit_edge, label %for.body8.for.body8_crit_edge

for.body8.for.body8_crit_edge:                    ; preds = %for.body8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  br label %for.body8

for.cond6.for.end_crit_edge:                      ; preds = %for.body8
  store double %sub, double* %w, align 8
  br label %for.end

for.end:                                          ; preds = %for.body3, %for.cond6.for.end_crit_edge
  %inc.lcssa35 = phi i32 [ %24, %for.cond6.for.end_crit_edge ], [ 0, %for.body3 ]
  %29 = load double, double* %w, align 8
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv68
  %30 = load double, double* %arrayidx20, align 8
  %div = fdiv double %29, %30
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 %indvars.iv68
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next69 = add nuw i64 %indvars.iv68, 1
  %cmp2 = icmp slt i64 %indvars.iv.next69, %indvars.iv87
  br i1 %cmp2, label %for.end.for.body3_crit_edge, label %for.end27.loopexit

for.end.for.body3_crit_edge:                      ; preds = %for.end
  %indvars.iv.next96 = add i32 %indvars.iv95, 1
  br label %for.body3

for.end27.loopexit:                               ; preds = %for.end
  br label %for.end27

for.end27:                                        ; preds = %for.end27.loopexit, %for.cond1.preheader
  %inc49.lcssa40.lcssa44 = phi i32 [ %inc49.lcssa40.lcssa45, %for.cond1.preheader ], [ %inc.lcssa35, %for.end27.loopexit ]
  %cmp2918 = icmp slt i64 %indvars.iv87, %6
  br i1 %cmp2918, label %for.body30.lr.ph, label %for.inc58

for.body30.lr.ph:                                 ; preds = %for.end27
  %cmp3617 = icmp sgt i64 %indvars.iv87, 0
  br i1 %cmp3617, label %for.body30.us.preheader, label %for.body30.preheader

for.body30.preheader:                             ; preds = %for.body30.lr.ph
  br label %for.body30

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond35.for.end50_crit_edge.us
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %for.cond35.for.end50_crit_edge.us ], [ %indvars.iv87, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 %indvars.iv85
  %31 = bitcast double* %arrayidx34.us to i64*
  %32 = load i64, i64* %31, align 8
  store i64 %32, i64* %8, align 8
  %w.promoted37.us.cast = bitcast i64 %32 to double
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us.for.body37.us_crit_edge, %for.body30.us
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %for.body37.us.for.body37.us_crit_edge ], [ 0, %for.body30.us ]
  %sub4738.us = phi double [ %sub47.us, %for.body37.us.for.body37.us_crit_edge ], [ %w.promoted37.us.cast, %for.body30.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 %indvars.iv77
  %33 = load double, double* %arrayidx41.us, align 8
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv77, i64 %indvars.iv85
  %34 = load double, double* %arrayidx45.us, align 8
  %mul46.us = fmul double %33, %34
  %sub47.us = fsub double %sub4738.us, %mul46.us
  %exitcond100 = icmp eq i64 %indvars.iv77, %10
  br i1 %exitcond100, label %for.cond35.for.end50_crit_edge.us, label %for.body37.us.for.body37.us_crit_edge

for.body37.us.for.body37.us_crit_edge:            ; preds = %for.body37.us
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  br label %for.body37.us

for.cond35.for.end50_crit_edge.us:                ; preds = %for.body37.us
  store double %sub47.us, double* %w, align 8
  %arrayidx54.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 %indvars.iv85
  store double %sub47.us, double* %arrayidx54.us, align 8
  %indvars.iv.next86 = add i64 %indvars.iv85, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next86, %6
  br i1 %exitcond101, label %for.inc58.loopexit, label %for.body30.us

for.body30:                                       ; preds = %for.body30.preheader, %for.body30.for.body30_crit_edge
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %for.body30.for.body30_crit_edge ], [ %indvars.iv87, %for.body30.preheader ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 %indvars.iv72
  %35 = bitcast double* %arrayidx34 to i64*
  %36 = load i64, i64* %35, align 8
  %arrayidx54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 %indvars.iv72
  %37 = bitcast double* %arrayidx54 to i64*
  store i64 %36, i64* %37, align 8
  %exitcond75 = icmp eq i64 %indvars.iv72, %wide.trip.count74
  br i1 %exitcond75, label %for.inc58.loopexit91, label %for.body30.for.body30_crit_edge

for.body30.for.body30_crit_edge:                  ; preds = %for.body30
  %indvars.iv.next73 = add i64 %indvars.iv72, 1
  br label %for.body30

for.inc58.loopexit91:                             ; preds = %for.body30
  store i64 %36, i64* %9, align 8
  br label %for.inc58

for.inc58.loopexit:                               ; preds = %for.cond35.for.end50_crit_edge.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.end27, %for.inc58.loopexit91
  %inc49.lcssa40.lcssa46 = phi i32 [ 0, %for.inc58.loopexit91 ], [ %inc49.lcssa40.lcssa44, %for.end27 ], [ %11, %for.inc58.loopexit ]
  %indvars.iv.next88 = add i64 %indvars.iv87, 1
  %cmp = icmp slt i64 %indvars.iv.next88, %5
  br i1 %cmp, label %for.inc58.for.cond1.preheader_crit_edge, label %for.cond.for.cond61.preheader_crit_edge

for.inc58.for.cond1.preheader_crit_edge:          ; preds = %for.inc58
  %indvars.iv.next99 = add i32 %indvars.iv98, 1
  br label %for.cond1.preheader

for.body63:                                       ; preds = %for.end79.for.body63_crit_edge, %for.body63.lr.ph
  %indvars.iv92 = phi i32 [ %indvars.iv.next93, %for.end79.for.body63_crit_edge ], [ %18, %for.body63.lr.ph ]
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.end79.for.body63_crit_edge ], [ %19, %for.body63.lr.ph ]
  %38 = zext i32 %indvars.iv92 to i64
  %arrayidx65 = getelementptr inbounds double, double* %14, i64 %indvars.iv60
  %39 = bitcast double* %arrayidx65 to i64*
  %40 = load i64, i64* %39, align 8
  store i64 %40, i64* %21, align 8
  %cmp6713 = icmp sgt i64 %indvars.iv60, 0
  br i1 %cmp6713, label %for.body68.lr.ph, label %for.end79

for.body68.lr.ph:                                 ; preds = %for.body63
  %w.promoted26 = load double, double* %w, align 8
  br label %for.body68

for.body68:                                       ; preds = %for.body68.for.body68_crit_edge, %for.body68.lr.ph
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.body68.for.body68_crit_edge ], [ 0, %for.body68.lr.ph ]
  %sub7627 = phi double [ %sub76, %for.body68.for.body68_crit_edge ], [ %w.promoted26, %for.body68.lr.ph ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv60, i64 %indvars.iv54
  %41 = load double, double* %arrayidx72, align 8
  %arrayidx74 = getelementptr inbounds double, double* %16, i64 %indvars.iv54
  %42 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %41, %42
  %sub76 = fsub double %sub7627, %mul75
  %exitcond94 = icmp eq i64 %indvars.iv54, %38
  br i1 %exitcond94, label %for.cond66.for.end79_crit_edge, label %for.body68.for.body68_crit_edge

for.body68.for.body68_crit_edge:                  ; preds = %for.body68
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  br label %for.body68

for.cond66.for.end79_crit_edge:                   ; preds = %for.body68
  store double %sub76, double* %w, align 8
  br label %for.end79

for.end79:                                        ; preds = %for.body63, %for.cond66.for.end79_crit_edge
  %43 = load i64, i64* %22, align 8
  %arrayidx81 = getelementptr inbounds double, double* %16, i64 %indvars.iv60
  %44 = bitcast double* %arrayidx81 to i64*
  store i64 %43, i64* %44, align 8
  %indvars.iv.next61 = add i64 %indvars.iv60, 1
  %cmp62 = icmp slt i64 %indvars.iv.next61, %20
  br i1 %cmp62, label %for.end79.for.body63_crit_edge, label %for.end84

for.end79.for.body63_crit_edge:                   ; preds = %for.end79
  %indvars.iv.next93 = add i32 %indvars.iv92, 1
  br label %for.body63

for.end84:                                        ; preds = %for.end79
  %.pr = load i32, i32* %n.addr, align 4
  %storemerge211 = add nsw i32 %.pr, -1
  store i32 %storemerge211, i32* %i, align 4
  %cmp8712 = icmp sgt i32 %.pr, 0
  br i1 %cmp8712, label %for.body88.lr.ph, label %for.end113

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

for.body88:                                       ; preds = %for.end104.for.body88_crit_edge, %for.body88.lr.ph
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.end104.for.body88_crit_edge ], [ %51, %for.body88.lr.ph ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.end104.for.body88_crit_edge ], [ %49, %for.body88.lr.ph ]
  %arrayidx90 = getelementptr inbounds double, double* %45, i64 %indvars.iv51
  %54 = bitcast double* %arrayidx90 to i64*
  %55 = load i64, i64* %54, align 8
  store i64 %55, i64* %53, align 8
  %56 = add nsw i64 %indvars.iv51, 1
  %cmp9210 = icmp slt i64 %56, %52
  br i1 %cmp9210, label %for.body93.lr.ph, label %for.end104

for.body93.lr.ph:                                 ; preds = %for.body88
  %57 = sext i32 %indvars.iv to i64
  %w.promoted = load double, double* %w, align 8
  br label %for.body93

for.body93:                                       ; preds = %for.body93.for.body93_crit_edge, %for.body93.lr.ph
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.body93.for.body93_crit_edge ], [ %57, %for.body93.lr.ph ]
  %sub10121 = phi double [ %sub101, %for.body93.for.body93_crit_edge ], [ %w.promoted, %for.body93.lr.ph ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %47, i64 %indvars.iv51, i64 %indvars.iv49
  %58 = load double, double* %arrayidx97, align 8
  %arrayidx99 = getelementptr inbounds double, double* %48, i64 %indvars.iv49
  %59 = load double, double* %arrayidx99, align 8
  %mul100 = fmul double %58, %59
  %sub101 = fsub double %sub10121, %mul100
  %exitcond = icmp eq i64 %indvars.iv49, %wide.trip.count
  br i1 %exitcond, label %for.cond91.for.end104_crit_edge, label %for.body93.for.body93_crit_edge

for.body93.for.body93_crit_edge:                  ; preds = %for.body93
  %indvars.iv.next50 = add nsw i64 %indvars.iv49, 1
  br label %for.body93

for.cond91.for.end104_crit_edge:                  ; preds = %for.body93
  store double %sub101, double* %w, align 8
  br label %for.end104

for.end104:                                       ; preds = %for.body88, %for.cond91.for.end104_crit_edge
  %60 = load double, double* %w, align 8
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %47, i64 %indvars.iv51, i64 %indvars.iv51
  %61 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %60, %61
  %arrayidx111 = getelementptr inbounds double, double* %48, i64 %indvars.iv51
  store double %div109, double* %arrayidx111, align 8
  %indvars.iv.next52 = add i64 %indvars.iv51, -1
  %cmp87 = icmp sgt i64 %indvars.iv51, 0
  br i1 %cmp87, label %for.end104.for.body88_crit_edge, label %for.cond86.for.end113_crit_edge

for.end104.for.body88_crit_edge:                  ; preds = %for.end104
  %indvars.iv.next = add i32 %indvars.iv, -1
  br label %for.body88

for.cond86.for.end113_crit_edge:                  ; preds = %for.end104
  %62 = trunc i64 %indvars.iv.next52 to i32
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
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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

for.body:                                         ; preds = %if.end, %for.body.lr.ph
  %indvars.iv = phi i64 [ %6, %for.body.lr.ph ], [ %indvars.iv.next, %if.end ]
  %8 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %8, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %11 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #7
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %7
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %if.end
  %12 = trunc i64 %indvars.iv.next to i32
  store i32 %12, i32* %i, align 4
  br label %for.end

for.end:                                          ; preds = %entry, %for.cond.for.end_crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #6
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
