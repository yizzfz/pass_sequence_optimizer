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
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %0 = bitcast [2000 x [2000 x double]]** %A to i8**
  store i8* %call, i8** %0, align 8
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %1 = bitcast [2000 x double]** %b to i8**
  store i8* %call1, i8** %1, align 8
  %call2 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %2 = bitcast [2000 x double]** %x to i8**
  store i8* %call2, i8** %2, align 8
  %call3 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
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
  call void (...) @polybench_timer_start() #5
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
  call void (...) @polybench_timer_stop() #5
  call void (...) @polybench_timer_print() #5
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
  call void @free(i8* %29) #5
  %30 = bitcast [2000 x double]** %b to i8**
  %31 = load i8*, i8** %30, align 8
  call void @free(i8* %31) #5
  %32 = bitcast [2000 x double]** %x to i8**
  %33 = load i8*, i8** %32, align 8
  call void @free(i8* %33) #5
  %34 = bitcast [2000 x double]** %y to i8**
  %35 = load i8*, i8** %34, align 8
  call void @free(i8* %35) #5
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
  %cmp15 = icmp sgt i32 %0, 0
  br i1 %cmp15, label %for.body.lr.ph, label %for.end.thread

for.end.thread:                                   ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.end46

for.body.lr.ph:                                   ; preds = %entry
  %1 = load double*, double** %x.addr, align 8
  %2 = load double*, double** %y.addr, align 8
  %3 = load double, double* %fn, align 8
  %4 = load double*, double** %b.addr, align 8
  %5 = load i32, i32* %n.addr, align 4
  %i.promoted70 = load i32, i32* %i, align 4
  %6 = sext i32 %i.promoted70 to i64
  %7 = sext i32 %5 to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv111 = phi i64 [ %6, %for.body.lr.ph ], [ %indvars.iv.next112, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %1, i64 %indvars.iv111
  store double 0.000000e+00, double* %arrayidx, align 8
  %arrayidx3 = getelementptr inbounds double, double* %2, i64 %indvars.iv111
  store double 0.000000e+00, double* %arrayidx3, align 8
  %indvars.iv.next112 = add nsw i64 %indvars.iv111, 1
  %8 = trunc i64 %indvars.iv.next112 to i32
  %conv4 = sitofp i32 %8 to double
  %div = fdiv double %conv4, %3
  %div5 = fmul double %div, 5.000000e-01
  %add6 = fadd double %div5, 4.000000e+00
  %arrayidx8 = getelementptr inbounds double, double* %4, i64 %indvars.iv111
  store double %add6, double* %arrayidx8, align 8
  %cmp = icmp slt i64 %indvars.iv.next112, %7
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  %.pr = load i32, i32* %n.addr, align 4
  store i32 0, i32* %i, align 4
  %cmp1013 = icmp sgt i32 %.pr, 0
  br i1 %cmp1013, label %for.body12.lr.ph, label %for.end46

for.body12.lr.ph:                                 ; preds = %for.end
  %9 = load i32, i32* %n.addr, align 4
  %conv18 = sitofp i32 %9 to double
  %i.promoted = load i32, i32* %i, align 4
  %10 = add i32 %9, -1
  %11 = sext i32 %i.promoted to i64
  %12 = sext i32 %9 to i64
  %13 = sext i32 %9 to i64
  %14 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %wide.trip.count107 = sext i32 %10 to i64
  %15 = add nsw i64 %wide.trip.count107, 1
  %16 = add i32 %i.promoted, 1
  %17 = add nsw i64 %wide.trip.count107, 1
  br label %for.body12

for.body12:                                       ; preds = %for.end39, %for.body12.lr.ph
  %indvar139 = phi i32 [ %indvar.next140, %for.end39 ], [ 0, %for.body12.lr.ph ]
  %indvars.iv120 = phi i32 [ %indvars.iv.next121, %for.end39 ], [ %i.promoted, %for.body12.lr.ph ]
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %for.end39 ], [ %11, %for.body12.lr.ph ]
  %18 = add i32 %16, %indvar139
  %19 = sext i32 %18 to i64
  %20 = sub nsw i64 %17, %19
  %21 = add nsw i64 %20, -4
  %22 = lshr i64 %21, 2
  %23 = add nuw nsw i64 %22, 1
  %24 = add i32 %16, %indvar139
  %25 = sext i32 %24 to i64
  %26 = sub nsw i64 %15, %25
  %indvars.iv.next121 = add i32 %indvars.iv120, 1
  %27 = zext i32 %indvars.iv120 to i64
  %28 = sext i32 %indvars.iv.next121 to i64
  %cmp148 = icmp sgt i64 %indvars.iv109, -1
  br i1 %cmp148, label %for.body16.preheader, label %for.end27

for.body16.preheader:                             ; preds = %for.body12
  br label %for.body16

for.body16:                                       ; preds = %for.body16.preheader, %for.body16
  %indvars.iv96 = phi i64 [ %indvars.iv.next97, %for.body16 ], [ 0, %for.body16.preheader ]
  %29 = sub nsw i64 0, %indvars.iv96
  %30 = trunc i64 %29 to i32
  %rem = srem i32 %30, %9
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, %conv18
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv109, i64 %indvars.iv96
  store double %add20, double* %arrayidx24, align 8
  %exitcond122 = icmp eq i64 %indvars.iv96, %27
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  br i1 %exitcond122, label %for.end27.loopexit, label %for.body16

for.end27.loopexit:                               ; preds = %for.body16
  br label %for.end27

for.end27:                                        ; preds = %for.end27.loopexit, %for.body12
  %indvars.iv.next110 = add nsw i64 %indvars.iv109, 1
  %cmp309 = icmp slt i64 %indvars.iv.next110, %12
  br i1 %cmp309, label %for.body32.preheader, label %for.end39

for.body32.preheader:                             ; preds = %for.end27
  %min.iters.check = icmp ult i64 %26, 4
  br i1 %min.iters.check, label %for.body32.preheader212, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body32.preheader
  %n.vec = and i64 %26, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %28, %n.vec
  br i1 %cmp.zero, label %for.body32.preheader212, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter218 = and i64 %23, 3
  %lcmp.mod219 = icmp eq i64 %xtraiter218, 0
  br i1 %lcmp.mod219, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter220 = phi i64 [ %prol.iter220.sub, %vector.body.prol ], [ %xtraiter218, %vector.body.prol.preheader ]
  %31 = add i64 %28, %index.prol
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv109, i64 %31
  %33 = bitcast double* %32 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %33, align 8
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %35, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter220.sub = add i64 %prol.iter220, -1
  %prol.iter220.cmp = icmp eq i64 %prol.iter220.sub, 0
  br i1 %prol.iter220.cmp, label %vector.body.prol.loopexit.loopexit, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.loopexit:               ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.loopexit ]
  %36 = icmp ult i64 %21, 12
  br i1 %36, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %37 = add i64 %28, %index
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv109, i64 %37
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %39, align 8
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %41, align 8
  %index.next = add i64 %index, 4
  %42 = add i64 %28, %index.next
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv109, i64 %42
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %44, align 8
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %46, align 8
  %index.next.1 = add i64 %index, 8
  %47 = add i64 %28, %index.next.1
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv109, i64 %47
  %49 = bitcast double* %48 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %49, align 8
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %51, align 8
  %index.next.2 = add i64 %index, 12
  %52 = add i64 %28, %index.next.2
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv109, i64 %52
  %54 = bitcast double* %53 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %54, align 8
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %56, align 8
  %index.next.3 = add i64 %index, 16
  %57 = icmp eq i64 %index.next.3, %n.vec
  br i1 %57, label %middle.block.loopexit, label %vector.body, !llvm.loop !3

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %26, %n.vec
  br i1 %cmp.n, label %for.end39, label %for.body32.preheader212

for.body32.preheader212:                          ; preds = %middle.block, %min.iters.checked, %for.body32.preheader
  %indvars.iv105.ph = phi i64 [ %28, %min.iters.checked ], [ %28, %for.body32.preheader ], [ %ind.end, %middle.block ]
  br label %for.body32

for.body32:                                       ; preds = %for.body32.preheader212, %for.body32
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %for.body32 ], [ %indvars.iv105.ph, %for.body32.preheader212 ]
  %arrayidx36 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv109, i64 %indvars.iv105
  store double 0.000000e+00, double* %arrayidx36, align 8
  %exitcond108 = icmp eq i64 %indvars.iv105, %wide.trip.count107
  %indvars.iv.next106 = add nsw i64 %indvars.iv105, 1
  br i1 %exitcond108, label %for.end39.loopexit, label %for.body32, !llvm.loop !6

for.end39.loopexit:                               ; preds = %for.body32
  br label %for.end39

for.end39:                                        ; preds = %for.end39.loopexit, %middle.block, %for.end27
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv109, i64 %indvars.iv109
  store double 1.000000e+00, double* %arrayidx43, align 8
  %cmp10 = icmp slt i64 %indvars.iv.next110, %13
  %indvar.next140 = add i32 %indvar139, 1
  br i1 %cmp10, label %for.body12, label %for.cond9.for.end46_crit_edge

for.cond9.for.end46_crit_edge:                    ; preds = %for.end39
  %58 = trunc i64 %indvars.iv.next110 to i32
  store i32 %58, i32* %i, align 4
  br label %for.end46

for.end46:                                        ; preds = %for.end, %for.end.thread, %for.cond9.for.end46_crit_edge
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %59 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %59, align 8
  store i32 0, i32* %r, align 4
  %60 = load i32, i32* %n.addr, align 4
  %cmp487 = icmp sgt i32 %60, 0
  br i1 %cmp487, label %for.body50.lr.ph, label %for.end64.thread

for.end64.thread:                                 ; preds = %for.end46
  store i32 0, i32* %t, align 4
  store i32 0, i32* %r, align 4
  br label %for.cond99.preheader

for.body50.lr.ph:                                 ; preds = %for.end46
  %61 = load i32, i32* %n.addr, align 4
  %62 = sext i32 %61 to i64
  %63 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %cmp526 = icmp sgt i32 %61, 0
  br i1 %cmp526, label %for.body50.lr.ph.for.body50.us_crit_edge, label %for.end64

for.body50.lr.ph.for.body50.us_crit_edge:         ; preds = %for.body50.lr.ph
  %r.promoted61 = load i32, i32* %r, align 4
  %64 = add i32 %61, -1
  %65 = sext i32 %r.promoted61 to i64
  %66 = zext i32 %64 to i64
  %67 = shl nuw nsw i64 %66, 3
  %68 = add nuw nsw i64 %67, 8
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us, %for.body50.lr.ph.for.body50.us_crit_edge
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %for.inc62.us ], [ %65, %for.body50.lr.ph.for.body50.us_crit_edge ]
  %indvar = phi i64 [ %indvar.next, %for.inc62.us ], [ 0, %for.body50.lr.ph.for.body50.us_crit_edge ]
  %69 = add nsw i64 %65, %indvar
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %63, i64 0, i64 %69, i64 0
  %scevgep92 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep92, i8 0, i64 %68, i32 8, i1 false)
  %indvars.iv.next94 = add nsw i64 %indvars.iv93, 1
  %cmp48.us = icmp slt i64 %indvars.iv.next94, %62
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %cmp48.us, label %for.inc62.us, label %for.end64.loopexit

for.end64.loopexit:                               ; preds = %for.inc62.us
  br label %for.end64

for.end64:                                        ; preds = %for.end64.loopexit, %for.body50.lr.ph
  %inc60.lcssa64.lcssa = phi i32 [ 0, %for.body50.lr.ph ], [ %61, %for.end64.loopexit ]
  store i32 %inc60.lcssa64.lcssa, i32* %s, align 4
  %.pr125 = load i32, i32* %n.addr, align 4
  store i32 0, i32* %t, align 4
  %cmp665 = icmp sgt i32 %.pr125, 0
  store i32 0, i32* %r, align 4
  br i1 %cmp665, label %for.cond69.preheader.lr.ph, label %for.cond99.preheader

for.cond69.preheader.lr.ph:                       ; preds = %for.end64
  %70 = load i32, i32* %n.addr, align 4
  %71 = sext i32 %70 to i64
  %72 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %73 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %cmp743 = icmp sgt i32 %70, 0
  %r.promoted25 = load i32, i32* %r, align 4
  %t.promoted = load i32, i32* %t, align 4
  %74 = sext i32 %t.promoted to i64
  %s.promoted = load i32, i32* %s, align 4
  br i1 %cmp743, label %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge, label %for.cond69.preheader.preheader

for.cond69.preheader.preheader:                   ; preds = %for.cond69.preheader.lr.ph
  br label %for.cond69.preheader

for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge: ; preds = %for.cond69.preheader.lr.ph
  %75 = add i32 %70, -1
  %76 = zext i32 %75 to i64
  %77 = add nuw nsw i64 %76, 1
  %78 = add nsw i64 %74, 1
  %79 = add nuw nsw i64 %76, 1
  %min.iters.check145 = icmp ult i64 %77, 4
  %n.vec148 = and i64 %77, 8589934588
  %cmp.zero149 = icmp eq i64 %n.vec148, 0
  %cmp.n171 = icmp eq i64 %77, %n.vec148
  br label %for.cond69.preheader.us

for.cond69.preheader.us:                          ; preds = %for.inc96.us, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge
  %indvar157 = phi i64 [ %indvar.next158, %for.inc96.us ], [ 0, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %for.inc96.us ], [ %74, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %inc91.lcssa24.lcssa28.us = phi i32 [ %inc91.lcssa24.lcssa29.us, %for.inc96.us ], [ %s.promoted, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %inc94.lcssa26.us = phi i32 [ 0, %for.inc96.us ], [ %r.promoted25, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %80 = add i64 %74, %indvar157
  %scevgep159 = getelementptr [2000 x double], [2000 x double]* %72, i64 0, i64 %80
  %81 = add i64 %78, %indvar157
  %scevgep161 = getelementptr [2000 x double], [2000 x double]* %72, i64 %76, i64 %81
  %cmp704.us = icmp slt i32 %inc94.lcssa26.us, %70
  br i1 %cmp704.us, label %for.body72.lr.ph.us, label %for.inc96.us

for.body72.lr.ph.us:                              ; preds = %for.cond69.preheader.us
  %82 = sext i32 %inc94.lcssa26.us to i64
  br label %for.body72.us.us

for.inc96.us.loopexit:                            ; preds = %for.inc93.us.us
  br label %for.inc96.us

for.inc96.us:                                     ; preds = %for.inc96.us.loopexit, %for.cond69.preheader.us
  %inc91.lcssa24.lcssa29.us = phi i32 [ %inc91.lcssa24.lcssa28.us, %for.cond69.preheader.us ], [ %70, %for.inc96.us.loopexit ]
  %indvars.iv.next86 = add nsw i64 %indvars.iv85, 1
  %cmp66.us = icmp slt i64 %indvars.iv.next86, %71
  %indvar.next158 = add i64 %indvar157, 1
  br i1 %cmp66.us, label %for.cond69.preheader.us, label %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge

for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge: ; preds = %for.inc96.us
  %83 = trunc i64 %indvars.iv.next86 to i32
  br label %for.cond65.for.cond99.preheader_crit_edge

for.body72.us.us:                                 ; preds = %for.inc93.us.us, %for.body72.lr.ph.us
  %indvar151 = phi i64 [ %indvar.next152, %for.inc93.us.us ], [ 0, %for.body72.lr.ph.us ]
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %for.inc93.us.us ], [ %82, %for.body72.lr.ph.us ]
  %84 = add i64 %82, %indvar151
  %scevgep153 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %84, i64 0
  %scevgep155 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %84, i64 %77
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 %indvars.iv83, i64 %indvars.iv85
  br i1 %min.iters.check145, label %for.body76.us.us.preheader, label %min.iters.checked146

for.body76.us.us.preheader:                       ; preds = %middle.block143, %vector.memcheck, %min.iters.checked146, %for.body72.us.us
  %indvars.iv79.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked146 ], [ 0, %for.body72.us.us ], [ %n.vec148, %middle.block143 ]
  %85 = sub nsw i64 %79, %indvars.iv79.ph
  %xtraiter216 = and i64 %85, 1
  %lcmp.mod217 = icmp eq i64 %xtraiter216, 0
  br i1 %lcmp.mod217, label %for.body76.us.us.prol.loopexit, label %for.body76.us.us.prol

for.body76.us.us.prol:                            ; preds = %for.body76.us.us.preheader
  %86 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 %indvars.iv79.ph, i64 %indvars.iv85
  %87 = load double, double* %arrayidx84.us.us.prol, align 8
  %mul.us.us.prol = fmul double %86, %87
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv83, i64 %indvars.iv79.ph
  %88 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %mul.us.us.prol, %88
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  %indvars.iv.next80.prol = or i64 %indvars.iv79.ph, 1
  br label %for.body76.us.us.prol.loopexit

for.body76.us.us.prol.loopexit:                   ; preds = %for.body76.us.us.prol, %for.body76.us.us.preheader
  %indvars.iv79.unr.ph = phi i64 [ %indvars.iv.next80.prol, %for.body76.us.us.prol ], [ %indvars.iv79.ph, %for.body76.us.us.preheader ]
  %89 = icmp eq i64 %76, %indvars.iv79.ph
  br i1 %89, label %for.inc93.us.us, label %for.body76.us.us.preheader.new

for.body76.us.us.preheader.new:                   ; preds = %for.body76.us.us.prol.loopexit
  br label %for.body76.us.us

min.iters.checked146:                             ; preds = %for.body72.us.us
  br i1 %cmp.zero149, label %for.body76.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked146
  %bound0 = icmp ult double* %scevgep153, %scevgep161
  %bound1 = icmp ult double* %scevgep159, %scevgep155
  %found.conflict = and i1 %bound0, %bound1
  %bound0164 = icmp ult double* %scevgep153, %arrayidx80.us.us
  %bound1165 = icmp ult double* %arrayidx80.us.us, %scevgep155
  %found.conflict166 = and i1 %bound0164, %bound1165
  %conflict.rdx = or i1 %found.conflict, %found.conflict166
  br i1 %conflict.rdx, label %for.body76.us.us.preheader, label %vector.body142.preheader

vector.body142.preheader:                         ; preds = %vector.memcheck
  br label %vector.body142

vector.body142:                                   ; preds = %vector.body142.preheader, %vector.body142
  %index168 = phi i64 [ %index.next169, %vector.body142 ], [ 0, %vector.body142.preheader ]
  %90 = or i64 %index168, 1
  %91 = or i64 %index168, 2
  %92 = or i64 %index168, 3
  %93 = load double, double* %arrayidx80.us.us, align 8, !alias.scope !8
  %94 = insertelement <2 x double> undef, double %93, i32 0
  %95 = shufflevector <2 x double> %94, <2 x double> undef, <2 x i32> zeroinitializer
  %96 = insertelement <2 x double> undef, double %93, i32 0
  %97 = shufflevector <2 x double> %96, <2 x double> undef, <2 x i32> zeroinitializer
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 %index168, i64 %indvars.iv85
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 %90, i64 %indvars.iv85
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 %91, i64 %indvars.iv85
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 %92, i64 %indvars.iv85
  %102 = load double, double* %98, align 8, !alias.scope !11
  %103 = load double, double* %99, align 8, !alias.scope !11
  %104 = load double, double* %100, align 8, !alias.scope !11
  %105 = load double, double* %101, align 8, !alias.scope !11
  %106 = insertelement <2 x double> undef, double %102, i32 0
  %107 = insertelement <2 x double> %106, double %103, i32 1
  %108 = insertelement <2 x double> undef, double %104, i32 0
  %109 = insertelement <2 x double> %108, double %105, i32 1
  %110 = fmul <2 x double> %95, %107
  %111 = fmul <2 x double> %97, %109
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv83, i64 %index168
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !13, !noalias !15
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load176 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !13, !noalias !15
  %116 = fadd <2 x double> %110, %wide.load
  %117 = fadd <2 x double> %111, %wide.load176
  %118 = bitcast double* %112 to <2 x double>*
  store <2 x double> %116, <2 x double>* %118, align 8, !alias.scope !13, !noalias !15
  %119 = bitcast double* %114 to <2 x double>*
  store <2 x double> %117, <2 x double>* %119, align 8, !alias.scope !13, !noalias !15
  %index.next169 = add i64 %index168, 4
  %120 = icmp eq i64 %index.next169, %n.vec148
  br i1 %120, label %middle.block143, label %vector.body142, !llvm.loop !16

middle.block143:                                  ; preds = %vector.body142
  br i1 %cmp.n171, label %for.inc93.us.us, label %for.body76.us.us.preheader

for.inc93.us.us.loopexit:                         ; preds = %for.body76.us.us
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit, %for.body76.us.us.prol.loopexit, %middle.block143
  %indvars.iv.next84 = add nsw i64 %indvars.iv83, 1
  %exitcond130 = icmp eq i64 %indvars.iv.next84, %71
  %indvar.next152 = add i64 %indvar151, 1
  br i1 %exitcond130, label %for.inc96.us.loopexit, label %for.body72.us.us

for.body76.us.us:                                 ; preds = %for.body76.us.us, %for.body76.us.us.preheader.new
  %indvars.iv79 = phi i64 [ %indvars.iv79.unr.ph, %for.body76.us.us.preheader.new ], [ %indvars.iv.next80.1, %for.body76.us.us ]
  %121 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 %indvars.iv79, i64 %indvars.iv85
  %122 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %121, %122
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv83, i64 %indvars.iv79
  %123 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %mul.us.us, %123
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %124 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 %indvars.iv.next80, i64 %indvars.iv85
  %125 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %124, %125
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next80
  %126 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %mul.us.us.1, %126
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next80, %76
  %indvars.iv.next80.1 = add nsw i64 %indvars.iv79, 2
  br i1 %exitcond.1, label %for.inc93.us.us.loopexit, label %for.body76.us.us, !llvm.loop !17

for.cond69.preheader:                             ; preds = %for.cond69.preheader.preheader, %for.cond69.preheader
  %inc91.lcssa24.lcssa28 = phi i32 [ %.inc91.lcssa24.lcssa28, %for.cond69.preheader ], [ %s.promoted, %for.cond69.preheader.preheader ]
  %inc9727 = phi i32 [ %inc97, %for.cond69.preheader ], [ %t.promoted, %for.cond69.preheader.preheader ]
  %inc94.lcssa26 = phi i32 [ 0, %for.cond69.preheader ], [ %r.promoted25, %for.cond69.preheader.preheader ]
  %cmp704 = icmp slt i32 %inc94.lcssa26, %70
  %.inc91.lcssa24.lcssa28 = select i1 %cmp704, i32 0, i32 %inc91.lcssa24.lcssa28
  %inc97 = add nsw i32 %inc9727, 1
  %cmp66 = icmp slt i32 %inc97, %70
  br i1 %cmp66, label %for.cond69.preheader, label %for.cond65.for.cond99.preheader_crit_edge.loopexit

for.cond65.for.cond99.preheader_crit_edge.loopexit: ; preds = %for.cond69.preheader
  br label %for.cond65.for.cond99.preheader_crit_edge

for.cond65.for.cond99.preheader_crit_edge:        ; preds = %for.cond65.for.cond99.preheader_crit_edge.loopexit, %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge
  %inc91.lcssa24.lcssa29.lcssa = phi i32 [ %inc91.lcssa24.lcssa29.us, %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge ], [ %.inc91.lcssa24.lcssa28, %for.cond65.for.cond99.preheader_crit_edge.loopexit ]
  %inc97.lcssa = phi i32 [ %83, %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge ], [ %inc97, %for.cond65.for.cond99.preheader_crit_edge.loopexit ]
  store i32 0, i32* %r, align 4
  store i32 %inc97.lcssa, i32* %t, align 4
  store i32 %inc91.lcssa24.lcssa29.lcssa, i32* %s, align 4
  br label %for.cond99.preheader

for.cond99.preheader:                             ; preds = %for.end64, %for.end64.thread, %for.cond65.for.cond99.preheader_crit_edge
  %127 = load i32, i32* %r, align 4
  %128 = load i32, i32* %n.addr, align 4
  %cmp1002 = icmp slt i32 %127, %128
  br i1 %cmp1002, label %for.body102.lr.ph, label %for.end120

for.body102.lr.ph:                                ; preds = %for.cond99.preheader
  %129 = load i32, i32* %n.addr, align 4
  %130 = sext i32 %129 to i64
  %131 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %132 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %r.promoted = load i32, i32* %r, align 4
  %133 = sext i32 %r.promoted to i64
  %cmp1041 = icmp sgt i32 %129, 0
  br i1 %cmp1041, label %for.body102.lr.ph.for.body102.us_crit_edge, label %for.body102.for.cond99.for.end120_crit_edge_crit_edge

for.body102.lr.ph.for.body102.us_crit_edge:       ; preds = %for.body102.lr.ph
  %134 = add i32 %129, -1
  %135 = zext i32 %134 to i64
  %136 = add nuw nsw i64 %135, 1
  %137 = and i64 %136, 8589934588
  %138 = add nsw i64 %137, -4
  %139 = lshr exact i64 %138, 2
  %140 = add nuw nsw i64 %135, 1
  %min.iters.check180 = icmp ult i64 %136, 4
  %n.vec183 = and i64 %136, 8589934588
  %cmp.zero184 = icmp eq i64 %n.vec183, 0
  %141 = and i64 %139, 1
  %lcmp.mod = icmp eq i64 %141, 0
  %142 = icmp eq i64 %139, 0
  %cmp.n205 = icmp eq i64 %136, %n.vec183
  br label %for.body102.us

for.body102.us:                                   ; preds = %for.inc118.us, %for.body102.lr.ph.for.body102.us_crit_edge
  %indvar186 = phi i64 [ %indvar.next187, %for.inc118.us ], [ 0, %for.body102.lr.ph.for.body102.us_crit_edge ]
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %for.inc118.us ], [ %133, %for.body102.lr.ph.for.body102.us_crit_edge ]
  %143 = add i64 %133, %indvar186
  %scevgep188 = getelementptr [2000 x double], [2000 x double]* %132, i64 %143, i64 0
  %scevgep190 = getelementptr [2000 x double], [2000 x double]* %132, i64 %143, i64 %136
  %scevgep192 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %143, i64 0
  %scevgep194 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %143, i64 %136
  br i1 %min.iters.check180, label %for.body106.us.preheader, label %min.iters.checked181

min.iters.checked181:                             ; preds = %for.body102.us
  br i1 %cmp.zero184, label %for.body106.us.preheader, label %vector.memcheck200

vector.memcheck200:                               ; preds = %min.iters.checked181
  %bound0196 = icmp ult double* %scevgep188, %scevgep194
  %bound1197 = icmp ult double* %scevgep192, %scevgep190
  %memcheck.conflict199 = and i1 %bound0196, %bound1197
  br i1 %memcheck.conflict199, label %for.body106.us.preheader, label %vector.body177.preheader

vector.body177.preheader:                         ; preds = %vector.memcheck200
  br i1 %lcmp.mod, label %vector.body177.prol, label %vector.body177.prol.loopexit

vector.body177.prol:                              ; preds = %vector.body177.preheader
  %144 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv77, i64 0
  %145 = bitcast double* %144 to <2 x i64>*
  %wide.load210.prol = load <2 x i64>, <2 x i64>* %145, align 8, !alias.scope !18
  %146 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv77, i64 2
  %147 = bitcast double* %146 to <2 x i64>*
  %wide.load211.prol = load <2 x i64>, <2 x i64>* %147, align 8, !alias.scope !18
  %148 = getelementptr inbounds [2000 x double], [2000 x double]* %132, i64 %indvars.iv77, i64 0
  %149 = bitcast double* %148 to <2 x i64>*
  store <2 x i64> %wide.load210.prol, <2 x i64>* %149, align 8, !alias.scope !21, !noalias !18
  %150 = getelementptr [2000 x double], [2000 x double]* %132, i64 %indvars.iv77, i64 2
  %151 = bitcast double* %150 to <2 x i64>*
  store <2 x i64> %wide.load211.prol, <2 x i64>* %151, align 8, !alias.scope !21, !noalias !18
  br label %vector.body177.prol.loopexit

vector.body177.prol.loopexit:                     ; preds = %vector.body177.prol, %vector.body177.preheader
  %index202.unr.ph = phi i64 [ 4, %vector.body177.prol ], [ 0, %vector.body177.preheader ]
  br i1 %142, label %middle.block178, label %vector.body177.preheader.new

vector.body177.preheader.new:                     ; preds = %vector.body177.prol.loopexit
  br label %vector.body177

vector.body177:                                   ; preds = %vector.body177, %vector.body177.preheader.new
  %index202 = phi i64 [ %index202.unr.ph, %vector.body177.preheader.new ], [ %index.next203.1, %vector.body177 ]
  %152 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv77, i64 %index202
  %153 = bitcast double* %152 to <2 x i64>*
  %wide.load210 = load <2 x i64>, <2 x i64>* %153, align 8, !alias.scope !18
  %154 = getelementptr double, double* %152, i64 2
  %155 = bitcast double* %154 to <2 x i64>*
  %wide.load211 = load <2 x i64>, <2 x i64>* %155, align 8, !alias.scope !18
  %156 = getelementptr inbounds [2000 x double], [2000 x double]* %132, i64 %indvars.iv77, i64 %index202
  %157 = bitcast double* %156 to <2 x i64>*
  store <2 x i64> %wide.load210, <2 x i64>* %157, align 8, !alias.scope !21, !noalias !18
  %158 = getelementptr double, double* %156, i64 2
  %159 = bitcast double* %158 to <2 x i64>*
  store <2 x i64> %wide.load211, <2 x i64>* %159, align 8, !alias.scope !21, !noalias !18
  %index.next203 = add i64 %index202, 4
  %160 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv77, i64 %index.next203
  %161 = bitcast double* %160 to <2 x i64>*
  %wide.load210.1 = load <2 x i64>, <2 x i64>* %161, align 8, !alias.scope !18
  %162 = getelementptr double, double* %160, i64 2
  %163 = bitcast double* %162 to <2 x i64>*
  %wide.load211.1 = load <2 x i64>, <2 x i64>* %163, align 8, !alias.scope !18
  %164 = getelementptr inbounds [2000 x double], [2000 x double]* %132, i64 %indvars.iv77, i64 %index.next203
  %165 = bitcast double* %164 to <2 x i64>*
  store <2 x i64> %wide.load210.1, <2 x i64>* %165, align 8, !alias.scope !21, !noalias !18
  %166 = getelementptr double, double* %164, i64 2
  %167 = bitcast double* %166 to <2 x i64>*
  store <2 x i64> %wide.load211.1, <2 x i64>* %167, align 8, !alias.scope !21, !noalias !18
  %index.next203.1 = add i64 %index202, 8
  %168 = icmp eq i64 %index.next203.1, %n.vec183
  br i1 %168, label %middle.block178.loopexit, label %vector.body177, !llvm.loop !23

middle.block178.loopexit:                         ; preds = %vector.body177
  br label %middle.block178

middle.block178:                                  ; preds = %middle.block178.loopexit, %vector.body177.prol.loopexit
  br i1 %cmp.n205, label %for.inc118.us, label %for.body106.us.preheader

for.body106.us.preheader:                         ; preds = %middle.block178, %vector.memcheck200, %min.iters.checked181, %for.body102.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck200 ], [ 0, %min.iters.checked181 ], [ 0, %for.body102.us ], [ %n.vec183, %middle.block178 ]
  %169 = sub nsw i64 %140, %indvars.iv.ph
  %170 = sub nsw i64 %135, %indvars.iv.ph
  %xtraiter214 = and i64 %169, 3
  %lcmp.mod215 = icmp eq i64 %xtraiter214, 0
  br i1 %lcmp.mod215, label %for.body106.us.prol.loopexit, label %for.body106.us.prol.preheader

for.body106.us.prol.preheader:                    ; preds = %for.body106.us.preheader
  br label %for.body106.us.prol

for.body106.us.prol:                              ; preds = %for.body106.us.prol, %for.body106.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body106.us.prol ], [ %indvars.iv.ph, %for.body106.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body106.us.prol ], [ %xtraiter214, %for.body106.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv77, i64 %indvars.iv.prol
  %171 = bitcast double* %arrayidx110.us.prol to i64*
  %172 = load i64, i64* %171, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %132, i64 %indvars.iv77, i64 %indvars.iv.prol
  %173 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %172, i64* %173, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body106.us.prol.loopexit.loopexit, label %for.body106.us.prol, !llvm.loop !24

for.body106.us.prol.loopexit.loopexit:            ; preds = %for.body106.us.prol
  br label %for.body106.us.prol.loopexit

for.body106.us.prol.loopexit:                     ; preds = %for.body106.us.prol.loopexit.loopexit, %for.body106.us.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body106.us.preheader ], [ %indvars.iv.next.prol, %for.body106.us.prol.loopexit.loopexit ]
  %174 = icmp ult i64 %170, 3
  br i1 %174, label %for.inc118.us, label %for.body106.us.preheader.new

for.body106.us.preheader.new:                     ; preds = %for.body106.us.prol.loopexit
  br label %for.body106.us

for.body106.us:                                   ; preds = %for.body106.us, %for.body106.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body106.us.preheader.new ], [ %indvars.iv.next.3, %for.body106.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv77, i64 %indvars.iv
  %175 = bitcast double* %arrayidx110.us to i64*
  %176 = load i64, i64* %175, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %132, i64 %indvars.iv77, i64 %indvars.iv
  %177 = bitcast double* %arrayidx114.us to i64*
  store i64 %176, i64* %177, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next
  %178 = bitcast double* %arrayidx110.us.1 to i64*
  %179 = load i64, i64* %178, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %132, i64 %indvars.iv77, i64 %indvars.iv.next
  %180 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %179, i64* %180, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.1
  %181 = bitcast double* %arrayidx110.us.2 to i64*
  %182 = load i64, i64* %181, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %132, i64 %indvars.iv77, i64 %indvars.iv.next.1
  %183 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %182, i64* %183, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.2
  %184 = bitcast double* %arrayidx110.us.3 to i64*
  %185 = load i64, i64* %184, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %132, i64 %indvars.iv77, i64 %indvars.iv.next.2
  %186 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %185, i64* %186, align 8
  %exitcond118.3 = icmp eq i64 %indvars.iv.next.2, %135
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond118.3, label %for.inc118.us.loopexit, label %for.body106.us, !llvm.loop !25

for.inc118.us.loopexit:                           ; preds = %for.body106.us
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit, %for.body106.us.prol.loopexit, %middle.block178
  %indvars.iv.next78 = add nsw i64 %indvars.iv77, 1
  %cmp100.us = icmp slt i64 %indvars.iv.next78, %130
  %indvar.next187 = add i64 %indvar186, 1
  br i1 %cmp100.us, label %for.body102.us, label %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge

for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge: ; preds = %for.inc118.us
  %187 = trunc i64 %indvars.iv.next78 to i32
  br label %for.cond99.for.end120_crit_edge

for.body102.for.cond99.for.end120_crit_edge_crit_edge: ; preds = %for.body102.lr.ph
  %188 = add i32 %r.promoted, 1
  %189 = icmp sgt i32 %129, %188
  %smax = select i1 %189, i32 %129, i32 %188
  br label %for.cond99.for.end120_crit_edge

for.cond99.for.end120_crit_edge:                  ; preds = %for.body102.for.cond99.for.end120_crit_edge_crit_edge, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge
  %inc116.lcssa19.lcssa = phi i32 [ %129, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge ], [ 0, %for.body102.for.cond99.for.end120_crit_edge_crit_edge ]
  %inc119.lcssa = phi i32 [ %187, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge ], [ %smax, %for.body102.for.cond99.for.end120_crit_edge_crit_edge ]
  store i32 %inc119.lcssa, i32* %r, align 4
  store i32 %inc116.lcssa19.lcssa, i32* %s, align 4
  br label %for.end120

for.end120:                                       ; preds = %for.cond99.preheader, %for.cond99.for.end120_crit_edge
  %190 = bitcast [2000 x [2000 x double]]** %B to i8**
  %191 = load i8*, i8** %190, align 8
  call void @free(i8* %191) #5
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
  %indvars.iv93 = phi i32 [ %indvars.iv.next94, %for.inc58 ], [ %4, %for.body.lr.ph ]
  %sub47.lcssa37.lcssa45 = phi double [ %sub47.lcssa37.lcssa46, %for.inc58 ], [ %w.promoted, %for.body.lr.ph ]
  %inc49.lcssa33.lcssa40 = phi i32 [ %inc49.lcssa33.lcssa41, %for.inc58 ], [ %k.promoted, %for.body.lr.ph ]
  %12 = add i64 %11, %indvar109
  %13 = and i64 %12, 4294967295
  %14 = sub i64 %9, %indvar109
  %15 = sub i64 %10, %indvar109
  %16 = zext i32 %indvars.iv93 to i64
  %17 = add i32 %indvars.iv93, 1
  %cmp26 = icmp sgt i64 %indvars.iv99, 0
  br i1 %cmp26, label %for.body3.preheader, label %for.end27

for.body3.preheader:                              ; preds = %for.body
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99, i64 0
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.end
  %indvars.iv90 = phi i32 [ %indvars.iv.next91, %for.end ], [ -1, %for.body3.preheader ]
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.end ], [ 0, %for.body3.preheader ]
  %18 = add i64 %indvars.iv66, 4294967295
  %19 = and i64 %18, 4294967295
  %20 = zext i32 %indvars.iv90 to i64
  %21 = add i32 %indvars.iv90, 1
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99, i64 %indvars.iv66
  %22 = load double, double* %arrayidx5, align 8
  %cmp75 = icmp sgt i64 %indvars.iv66, 0
  br i1 %cmp75, label %for.body8.preheader, label %for.end

for.body8.preheader:                              ; preds = %for.body3
  %23 = and i64 %18, 1
  %lcmp.mod108 = icmp eq i64 %23, 0
  br i1 %lcmp.mod108, label %for.body8.prol, label %for.body8.prol.loopexit

for.body8.prol:                                   ; preds = %for.body8.preheader
  %24 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv66
  %25 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %24, %25
  %sub.prol = fsub double %22, %mul.prol
  br label %for.body8.prol.loopexit

for.body8.prol.loopexit:                          ; preds = %for.body8.prol, %for.body8.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ undef, %for.body8.preheader ]
  %indvars.iv60.unr.ph = phi i64 [ 1, %for.body8.prol ], [ 0, %for.body8.preheader ]
  %sub25.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ %22, %for.body8.preheader ]
  %26 = icmp eq i64 %19, 0
  br i1 %26, label %for.end, label %for.body8.preheader.new

for.body8.preheader.new:                          ; preds = %for.body8.prol.loopexit
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.body8.preheader.new
  %indvars.iv60 = phi i64 [ %indvars.iv60.unr.ph, %for.body8.preheader.new ], [ %indvars.iv.next61.1, %for.body8 ]
  %sub25 = phi double [ %sub25.unr.ph, %for.body8.preheader.new ], [ %sub.1, %for.body8 ]
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
  %exitcond92.1 = icmp eq i64 %indvars.iv.next61, %20
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  br i1 %exitcond92.1, label %for.end.loopexit, label %for.body8

for.end.loopexit:                                 ; preds = %for.body8
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body8.prol.loopexit, %for.body3
  %sub.lcssa29 = phi double [ %22, %for.body3 ], [ %sub.lcssa.unr.ph, %for.body8.prol.loopexit ], [ %sub.1, %for.end.loopexit ]
  %inc.lcssa27 = phi i32 [ 0, %for.body3 ], [ %21, %for.body8.prol.loopexit ], [ %21, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv66
  %31 = load double, double* %arrayidx20, align 8
  %div = fdiv double %sub.lcssa29, %31
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99, i64 %indvars.iv66
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %indvars.iv.next91 = add i32 %indvars.iv90, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next67, %indvars.iv99
  br i1 %exitcond101, label %for.end27.loopexit, label %for.body3

for.end27.loopexit:                               ; preds = %for.end
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
  br i1 %prol.iter113.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !26

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

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.end50.us
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %for.end50.us ], [ %indvars.iv99, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99, i64 %indvars.iv83
  %35 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod115, label %for.body37.us.prol, label %for.body37.us.prol.loopexit

for.body37.us.prol:                               ; preds = %for.body30.us
  %36 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv83
  %37 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %36, %37
  %sub47.us.prol = fsub double %35, %mul46.us.prol
  br label %for.body37.us.prol.loopexit

for.body37.us.prol.loopexit:                      ; preds = %for.body37.us.prol, %for.body30.us
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ undef, %for.body30.us ]
  %indvars.iv75.unr.ph = phi i64 [ 1, %for.body37.us.prol ], [ 0, %for.body30.us ]
  %sub4731.us.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ %35, %for.body30.us ]
  br i1 %34, label %for.end50.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.body37.us.prol.loopexit
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us, %for.body30.us.new
  %indvars.iv75 = phi i64 [ %indvars.iv75.unr.ph, %for.body30.us.new ], [ %indvars.iv.next76.1, %for.body37.us ]
  %sub4731.us = phi double [ %sub4731.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.body37.us ]
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
  %exitcond95.1 = icmp eq i64 %indvars.iv.next76, %16
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75, 2
  br i1 %exitcond95.1, label %for.end50.us.loopexit, label %for.body37.us

for.end50.us.loopexit:                            ; preds = %for.body37.us
  br label %for.end50.us

for.end50.us:                                     ; preds = %for.end50.us.loopexit, %for.body37.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.body37.us.prol.loopexit ], [ %sub47.us.1, %for.end50.us.loopexit ]
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

for.inc58.loopexit:                               ; preds = %for.end50.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.end27, %for.body30.for.inc58_crit_edge
  %sub47.lcssa37.lcssa46 = phi double [ %42, %for.body30.for.inc58_crit_edge ], [ %sub47.lcssa37.lcssa44, %for.end27 ], [ %sub47.us.lcssa, %for.inc58.loopexit ]
  %inc49.lcssa33.lcssa41 = phi i32 [ 0, %for.body30.for.inc58_crit_edge ], [ %inc49.lcssa33.lcssa39, %for.end27 ], [ %17, %for.inc58.loopexit ]
  %indvars.iv.next100 = add nsw i64 %indvars.iv99, 1
  %cmp = icmp slt i64 %indvars.iv.next100, %5
  %indvars.iv.next94 = add i32 %indvars.iv93, 1
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
  %sub8596 = add nsw i32 %44, -1
  store i32 %sub8596, i32* %i, align 4
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

for.body63:                                       ; preds = %for.end79, %for.body63.lr.ph
  %indvar102 = phi i32 [ %indvar.next103, %for.end79 ], [ 0, %for.body63.lr.ph ]
  %indvars.iv87 = phi i32 [ %indvars.iv.next88, %for.end79 ], [ %49, %for.body63.lr.ph ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.end79 ], [ %50, %for.body63.lr.ph ]
  %52 = add i32 %49, %indvar102
  %53 = zext i32 %indvars.iv87 to i64
  %arrayidx65 = getelementptr inbounds double, double* %45, i64 %indvars.iv58
  %54 = load double, double* %arrayidx65, align 8
  %cmp673 = icmp sgt i64 %indvars.iv58, 0
  br i1 %cmp673, label %for.body68.preheader, label %for.end79

for.body68.preheader:                             ; preds = %for.body63
  %55 = zext i32 %52 to i64
  %56 = add nuw nsw i64 %55, 1
  %xtraiter104 = and i64 %56, 3
  %lcmp.mod105 = icmp eq i64 %xtraiter104, 0
  br i1 %lcmp.mod105, label %for.body68.prol.loopexit, label %for.body68.prol.preheader

for.body68.prol.preheader:                        ; preds = %for.body68.preheader
  br label %for.body68.prol

for.body68.prol:                                  ; preds = %for.body68.prol, %for.body68.prol.preheader
  %indvars.iv52.prol = phi i64 [ %indvars.iv.next53.prol, %for.body68.prol ], [ 0, %for.body68.prol.preheader ]
  %sub7618.prol = phi double [ %sub76.prol, %for.body68.prol ], [ %54, %for.body68.prol.preheader ]
  %prol.iter106 = phi i64 [ %prol.iter106.sub, %for.body68.prol ], [ %xtraiter104, %for.body68.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %indvars.iv58, i64 %indvars.iv52.prol
  %57 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %47, i64 %indvars.iv52.prol
  %58 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %57, %58
  %sub76.prol = fsub double %sub7618.prol, %mul75.prol
  %indvars.iv.next53.prol = add nuw nsw i64 %indvars.iv52.prol, 1
  %prol.iter106.sub = add i64 %prol.iter106, -1
  %prol.iter106.cmp = icmp eq i64 %prol.iter106.sub, 0
  br i1 %prol.iter106.cmp, label %for.body68.prol.loopexit.loopexit, label %for.body68.prol, !llvm.loop !27

for.body68.prol.loopexit.loopexit:                ; preds = %for.body68.prol
  br label %for.body68.prol.loopexit

for.body68.prol.loopexit:                         ; preds = %for.body68.prol.loopexit.loopexit, %for.body68.preheader
  %sub76.lcssa.unr = phi double [ undef, %for.body68.preheader ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %indvars.iv52.unr = phi i64 [ 0, %for.body68.preheader ], [ %indvars.iv.next53.prol, %for.body68.prol.loopexit.loopexit ]
  %sub7618.unr = phi double [ %54, %for.body68.preheader ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %59 = icmp ult i32 %52, 3
  br i1 %59, label %for.end79, label %for.body68.preheader.new

for.body68.preheader.new:                         ; preds = %for.body68.prol.loopexit
  br label %for.body68

for.body68:                                       ; preds = %for.body68, %for.body68.preheader.new
  %indvars.iv52 = phi i64 [ %indvars.iv52.unr, %for.body68.preheader.new ], [ %indvars.iv.next53.3, %for.body68 ]
  %sub7618 = phi double [ %sub7618.unr, %for.body68.preheader.new ], [ %sub76.3, %for.body68 ]
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
  %exitcond89.3 = icmp eq i64 %indvars.iv.next53.2, %53
  %indvars.iv.next53.3 = add nsw i64 %indvars.iv52, 4
  br i1 %exitcond89.3, label %for.end79.loopexit, label %for.body68

for.end79.loopexit:                               ; preds = %for.body68
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.body68.prol.loopexit, %for.body63
  %sub76.lcssa23 = phi double [ %54, %for.body63 ], [ %sub76.lcssa.unr, %for.body68.prol.loopexit ], [ %sub76.3, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %47, i64 %indvars.iv58
  store double %sub76.lcssa23, double* %arrayidx81, align 8
  %indvars.iv.next59 = add nsw i64 %indvars.iv58, 1
  %cmp62 = icmp slt i64 %indvars.iv.next59, %51
  %indvars.iv.next88 = add i32 %indvars.iv87, 1
  %indvar.next103 = add i32 %indvar102, 1
  br i1 %cmp62, label %for.body63, label %for.end84

for.end84:                                        ; preds = %for.end79
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

for.body88:                                       ; preds = %for.end104, %for.body88.lr.ph
  %indvar = phi i32 [ %indvar.next, %for.end104 ], [ 0, %for.body88.lr.ph ]
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.end104 ], [ %74, %for.body88.lr.ph ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.end104 ], [ %72, %for.body88.lr.ph ]
  %77 = sub i32 %72, %indvar
  %78 = sext i32 %77 to i64
  %79 = sub nsw i64 %wide.trip.count, %78
  %arrayidx90 = getelementptr inbounds double, double* %68, i64 %indvars.iv49
  %80 = load double, double* %arrayidx90, align 8
  %81 = add nsw i64 %indvars.iv49, 1
  %cmp921 = icmp slt i64 %81, %75
  br i1 %cmp921, label %for.body93.lr.ph, label %for.end104

for.body93.lr.ph:                                 ; preds = %for.body88
  %82 = sub nsw i64 %76, %78
  %83 = sext i32 %indvars.iv to i64
  %xtraiter = and i64 %82, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body93.prol.loopexit, label %for.body93.prol.preheader

for.body93.prol.preheader:                        ; preds = %for.body93.lr.ph
  br label %for.body93.prol

for.body93.prol:                                  ; preds = %for.body93.prol, %for.body93.prol.preheader
  %indvars.iv47.prol = phi i64 [ %indvars.iv.next48.prol, %for.body93.prol ], [ %83, %for.body93.prol.preheader ]
  %sub10111.prol = phi double [ %sub101.prol, %for.body93.prol ], [ %80, %for.body93.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body93.prol ], [ %xtraiter, %for.body93.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %70, i64 %indvars.iv49, i64 %indvars.iv47.prol
  %84 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %71, i64 %indvars.iv47.prol
  %85 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %84, %85
  %sub101.prol = fsub double %sub10111.prol, %mul100.prol
  %indvars.iv.next48.prol = add nsw i64 %indvars.iv47.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body93.prol.loopexit.loopexit, label %for.body93.prol, !llvm.loop !28

for.body93.prol.loopexit.loopexit:                ; preds = %for.body93.prol
  br label %for.body93.prol.loopexit

for.body93.prol.loopexit:                         ; preds = %for.body93.prol.loopexit.loopexit, %for.body93.lr.ph
  %sub101.lcssa.unr = phi double [ undef, %for.body93.lr.ph ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %indvars.iv47.unr = phi i64 [ %83, %for.body93.lr.ph ], [ %indvars.iv.next48.prol, %for.body93.prol.loopexit.loopexit ]
  %sub10111.unr = phi double [ %80, %for.body93.lr.ph ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %86 = icmp ult i64 %79, 3
  br i1 %86, label %for.end104, label %for.body93.lr.ph.new

for.body93.lr.ph.new:                             ; preds = %for.body93.prol.loopexit
  br label %for.body93

for.body93:                                       ; preds = %for.body93, %for.body93.lr.ph.new
  %indvars.iv47 = phi i64 [ %indvars.iv47.unr, %for.body93.lr.ph.new ], [ %indvars.iv.next48.3, %for.body93 ]
  %sub10111 = phi double [ %sub10111.unr, %for.body93.lr.ph.new ], [ %sub101.3, %for.body93 ]
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
  br i1 %exitcond.3, label %for.end104.loopexit, label %for.body93

for.end104.loopexit:                              ; preds = %for.body93
  br label %for.end104

for.end104:                                       ; preds = %for.end104.loopexit, %for.body93.prol.loopexit, %for.body88
  %sub101.lcssa16 = phi double [ %80, %for.body88 ], [ %sub101.lcssa.unr, %for.body93.prol.loopexit ], [ %sub101.3, %for.end104.loopexit ]
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

for.cond86.for.end113_crit_edge:                  ; preds = %for.end104
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!12, !9}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !4, !5}
!24 = distinct !{!24, !2}
!25 = distinct !{!25, !4, !5}
!26 = distinct !{!26, !2}
!27 = distinct !{!27, !2}
!28 = distinct !{!28, !2}
