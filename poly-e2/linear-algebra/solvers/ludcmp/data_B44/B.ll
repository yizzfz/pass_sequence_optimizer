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
  %cmp27 = icmp sgt i32 %0, 0
  br i1 %cmp27, label %for.body.lr.ph, label %for.cond9.preheader.thread

for.cond9.preheader.thread:                       ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.end46

for.body.lr.ph:                                   ; preds = %entry
  %1 = load double*, double** %x.addr, align 8
  %2 = load double*, double** %y.addr, align 8
  %3 = load double, double* %fn, align 8
  %4 = load double*, double** %b.addr, align 8
  %5 = load i32, i32* %n.addr, align 4
  %i.promoted79 = load i32, i32* %i, align 4
  %6 = sext i32 %i.promoted79 to i64
  %7 = sext i32 %5 to i64
  br label %for.body

for.cond9.preheader:                              ; preds = %for.body
  %.pr = load i32, i32* %n.addr, align 4
  store i32 0, i32* %i, align 4
  %cmp1026 = icmp sgt i32 %.pr, 0
  br i1 %cmp1026, label %for.cond13.preheader.lr.ph, label %for.end46

for.cond13.preheader.lr.ph:                       ; preds = %for.cond9.preheader
  %8 = load i32, i32* %n.addr, align 4
  %conv18 = sitofp i32 %8 to double
  %i.promoted = load i32, i32* %i, align 4
  %9 = add i32 %8, -1
  %10 = sext i32 %i.promoted to i64
  %11 = sext i32 %8 to i64
  %12 = sext i32 %8 to i64
  %13 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %wide.trip.count116 = sext i32 %9 to i64
  %14 = add nsw i64 %wide.trip.count116, 1
  %15 = add i32 %i.promoted, 1
  %16 = add nsw i64 %wide.trip.count116, 1
  %17 = add i64 %wide.trip.count116, -3
  br label %for.cond13.preheader

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv120 = phi i64 [ %6, %for.body.lr.ph ], [ %indvars.iv.next121, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %1, i64 %indvars.iv120
  store double 0.000000e+00, double* %arrayidx, align 8
  %arrayidx3 = getelementptr inbounds double, double* %2, i64 %indvars.iv120
  store double 0.000000e+00, double* %arrayidx3, align 8
  %indvars.iv.next121 = add nsw i64 %indvars.iv120, 1
  %18 = trunc i64 %indvars.iv.next121 to i32
  %conv4 = sitofp i32 %18 to double
  %div = fdiv double %conv4, %3
  %div5 = fmul double %div, 5.000000e-01
  %add6 = fadd double %div5, 4.000000e+00
  %arrayidx8 = getelementptr inbounds double, double* %4, i64 %indvars.iv120
  store double %add6, double* %arrayidx8, align 8
  %cmp = icmp slt i64 %indvars.iv.next121, %7
  br i1 %cmp, label %for.body, label %for.cond9.preheader

for.cond13.preheader:                             ; preds = %for.end39, %for.cond13.preheader.lr.ph
  %indvars.iv234 = phi i32 [ %indvars.iv.next235, %for.end39 ], [ %15, %for.cond13.preheader.lr.ph ]
  %indvar146 = phi i32 [ %indvar.next147, %for.end39 ], [ 0, %for.cond13.preheader.lr.ph ]
  %indvars.iv138 = phi i32 [ %indvars.iv.next139, %for.end39 ], [ %i.promoted, %for.cond13.preheader.lr.ph ]
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %for.end39 ], [ %10, %for.cond13.preheader.lr.ph ]
  %19 = sext i32 %indvars.iv234 to i64
  %20 = sub i64 %17, %19
  %21 = lshr i64 %20, 2
  %22 = add i64 %21, 1
  %23 = trunc i64 %22 to i2
  %24 = zext i2 %23 to i64
  %25 = shl i64 %24, 2
  %26 = add i32 %15, %indvar146
  %27 = sext i32 %26 to i64
  %28 = sub nsw i64 %16, %27
  %29 = add nsw i64 %28, -4
  %30 = lshr i64 %29, 2
  %31 = add nuw nsw i64 %30, 1
  %32 = add i32 %15, %indvar146
  %33 = sext i32 %32 to i64
  %34 = sub nsw i64 %14, %33
  %35 = zext i32 %indvars.iv138 to i64
  %indvars.iv.next139 = add i32 %indvars.iv138, 1
  %36 = sext i32 %indvars.iv.next139 to i64
  %cmp1419 = icmp slt i64 %indvars.iv118, 0
  br i1 %cmp1419, label %for.end27, label %for.body16.preheader

for.body16.preheader:                             ; preds = %for.cond13.preheader
  br label %for.body16

for.body16:                                       ; preds = %for.body16.preheader, %for.body16
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %for.body16 ], [ 0, %for.body16.preheader ]
  %37 = sub nsw i64 0, %indvars.iv105
  %38 = trunc i64 %37 to i32
  %rem = srem i32 %38, %8
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, %conv18
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv118, i64 %indvars.iv105
  store double %add20, double* %arrayidx24, align 8
  %exitcond140 = icmp eq i64 %indvars.iv105, %35
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  br i1 %exitcond140, label %for.end27.loopexit, label %for.body16

for.end27.loopexit:                               ; preds = %for.body16
  br label %for.end27

for.end27:                                        ; preds = %for.end27.loopexit, %for.cond13.preheader
  %indvars.iv.next119 = add nsw i64 %indvars.iv118, 1
  %cmp3021 = icmp slt i64 %indvars.iv.next119, %11
  br i1 %cmp3021, label %for.body32.preheader, label %for.end39

for.body32.preheader:                             ; preds = %for.end27
  %min.iters.check = icmp ult i64 %34, 4
  br i1 %min.iters.check, label %for.body32.preheader217, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body32.preheader
  %n.vec = and i64 %34, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %36, %n.vec
  br i1 %cmp.zero, label %for.body32.preheader217, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter227 = and i64 %31, 3
  %lcmp.mod228 = icmp eq i64 %xtraiter227, 0
  br i1 %lcmp.mod228, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter229 = phi i64 [ %prol.iter229.sub, %vector.body.prol ], [ %xtraiter227, %vector.body.prol.preheader ]
  %39 = add nsw i64 %36, %index.prol
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv118, i64 %39
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %41, align 8
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %43, align 8
  %index.next.prol = add nuw nsw i64 %index.prol, 4
  %prol.iter229.sub = add nsw i64 %prol.iter229, -1
  %prol.iter229.cmp = icmp eq i64 %prol.iter229.sub, 0
  br i1 %prol.iter229.cmp, label %vector.body.prol.loopexit.loopexit, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.loopexit:               ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %25, %vector.body.prol.loopexit.loopexit ]
  %44 = icmp ult i64 %29, 12
  br i1 %44, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %45 = add i64 %36, %index
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv118, i64 %45
  %47 = bitcast double* %46 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %47, align 8
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %49, align 8
  %index.next = add i64 %index, 4
  %50 = add i64 %36, %index.next
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv118, i64 %50
  %52 = bitcast double* %51 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %52, align 8
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %54, align 8
  %index.next.1 = add i64 %index, 8
  %55 = add i64 %36, %index.next.1
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv118, i64 %55
  %57 = bitcast double* %56 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %57, align 8
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %59, align 8
  %index.next.2 = add i64 %index, 12
  %60 = add i64 %36, %index.next.2
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv118, i64 %60
  %62 = bitcast double* %61 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %62, align 8
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %64, align 8
  %index.next.3 = add i64 %index, 16
  %65 = icmp eq i64 %index.next.3, %n.vec
  br i1 %65, label %middle.block.loopexit, label %vector.body, !llvm.loop !3

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %34, %n.vec
  br i1 %cmp.n, label %for.end39, label %for.body32.preheader217

for.body32.preheader217:                          ; preds = %middle.block, %min.iters.checked, %for.body32.preheader
  %indvars.iv114.ph = phi i64 [ %36, %min.iters.checked ], [ %36, %for.body32.preheader ], [ %ind.end, %middle.block ]
  br label %for.body32

for.body32:                                       ; preds = %for.body32.preheader217, %for.body32
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %for.body32 ], [ %indvars.iv114.ph, %for.body32.preheader217 ]
  %arrayidx36 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv118, i64 %indvars.iv114
  store double 0.000000e+00, double* %arrayidx36, align 8
  %exitcond117 = icmp eq i64 %indvars.iv114, %wide.trip.count116
  %indvars.iv.next115 = add nsw i64 %indvars.iv114, 1
  br i1 %exitcond117, label %for.end39.loopexit, label %for.body32, !llvm.loop !6

for.end39.loopexit:                               ; preds = %for.body32
  br label %for.end39

for.end39:                                        ; preds = %for.end39.loopexit, %middle.block, %for.end27
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv118, i64 %indvars.iv118
  store double 1.000000e+00, double* %arrayidx43, align 8
  %cmp10 = icmp slt i64 %indvars.iv.next119, %12
  %indvar.next147 = add nuw i32 %indvar146, 1
  %indvars.iv.next235 = add i32 %indvars.iv234, 1
  br i1 %cmp10, label %for.cond13.preheader, label %for.cond9.for.end46_crit_edge

for.cond9.for.end46_crit_edge:                    ; preds = %for.end39
  %66 = trunc i64 %indvars.iv.next119 to i32
  store i32 %66, i32* %i, align 4
  br label %for.end46

for.end46:                                        ; preds = %for.cond9.preheader, %for.cond9.preheader.thread, %for.cond9.for.end46_crit_edge
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %67 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %67, align 8
  store i32 0, i32* %r, align 4
  %68 = load i32, i32* %n.addr, align 4
  %cmp4818 = icmp sgt i32 %68, 0
  br i1 %cmp4818, label %for.cond51.preheader.lr.ph, label %for.cond65.preheader.thread

for.cond65.preheader.thread:                      ; preds = %for.end46
  store i32 0, i32* %t, align 4
  br label %for.cond99.preheader

for.cond51.preheader.lr.ph:                       ; preds = %for.end46
  %69 = load i32, i32* %n.addr, align 4
  %70 = sext i32 %69 to i64
  %cmp5217 = icmp sgt i32 %69, 0
  %71 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %r.promoted70 = load i32, i32* %r, align 4
  %72 = sext i32 %r.promoted70 to i64
  br i1 %cmp5217, label %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge, label %for.cond51.preheader.for.cond47.for.cond65.preheader_crit_edge_crit_edge

for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge: ; preds = %for.cond51.preheader.lr.ph
  %73 = add i32 %69, -1
  %74 = zext i32 %73 to i64
  %75 = shl nuw nsw i64 %74, 3
  %76 = add nuw nsw i64 %75, 8
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us, %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %for.inc62.us ], [ %72, %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge ]
  %indvar = phi i64 [ %indvar.next, %for.inc62.us ], [ 0, %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge ]
  %77 = add nsw i64 %72, %indvar
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %77, i64 0
  %scevgep101 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep101, i8 0, i64 %76, i32 8, i1 false)
  %indvars.iv.next103 = add nsw i64 %indvars.iv102, 1
  %cmp48.us = icmp slt i64 %indvars.iv.next103, %70
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %cmp48.us, label %for.inc62.us, label %for.inc62.us.for.cond47.for.cond65.preheader_crit_edge_crit_edge

for.inc62.us.for.cond47.for.cond65.preheader_crit_edge_crit_edge: ; preds = %for.inc62.us
  %78 = trunc i64 %indvars.iv.next103 to i32
  br label %for.cond65.preheader

for.cond51.preheader.for.cond47.for.cond65.preheader_crit_edge_crit_edge: ; preds = %for.cond51.preheader.lr.ph
  %79 = add i32 %r.promoted70, 1
  %80 = icmp sgt i32 %69, %79
  %smax104 = select i1 %80, i32 %69, i32 %79
  br label %for.cond65.preheader

for.cond65.preheader:                             ; preds = %for.inc62.us.for.cond47.for.cond65.preheader_crit_edge_crit_edge, %for.cond51.preheader.for.cond47.for.cond65.preheader_crit_edge_crit_edge
  %inc60.lcssa73.lcssa = phi i32 [ %69, %for.inc62.us.for.cond47.for.cond65.preheader_crit_edge_crit_edge ], [ 0, %for.cond51.preheader.for.cond47.for.cond65.preheader_crit_edge_crit_edge ]
  %inc63.lcssa = phi i32 [ %78, %for.inc62.us.for.cond47.for.cond65.preheader_crit_edge_crit_edge ], [ %smax104, %for.cond51.preheader.for.cond47.for.cond65.preheader_crit_edge_crit_edge ]
  store i32 %inc63.lcssa, i32* %r, align 4
  store i32 %inc60.lcssa73.lcssa, i32* %s, align 4
  %.pr128 = load i32, i32* %n.addr, align 4
  store i32 0, i32* %t, align 4
  %cmp6616 = icmp sgt i32 %.pr128, 0
  br i1 %cmp6616, label %for.cond69.preheader.lr.ph, label %for.cond99.preheader.thread

for.cond99.preheader.thread:                      ; preds = %for.cond65.preheader
  store i32 0, i32* %r, align 4
  br label %for.end120

for.cond69.preheader.lr.ph:                       ; preds = %for.cond65.preheader
  %81 = load i32, i32* %n.addr, align 4
  %82 = sext i32 %81 to i64
  %cmp7015 = icmp sgt i32 %81, 0
  %83 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %84 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %t.promoted = load i32, i32* %t, align 4
  %85 = sext i32 %t.promoted to i64
  br i1 %cmp7015, label %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge, label %for.cond69.preheader.for.cond65.for.cond99.preheader_crit_edge_crit_edge

for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge: ; preds = %for.cond69.preheader.lr.ph
  %86 = add i32 %81, -1
  %87 = zext i32 %86 to i64
  %88 = add nuw nsw i64 %87, 1
  %89 = add nsw i64 %85, 1
  %90 = add nuw nsw i64 %87, 1
  %91 = icmp sgt i32 %81, 0
  %min.iters.check152 = icmp ult i64 %88, 4
  %n.vec155 = and i64 %88, 8589934588
  %cmp.zero156 = icmp eq i64 %n.vec155, 0
  %cmp.n176 = icmp eq i64 %88, %n.vec155
  br label %for.cond69.preheader.us

for.cond69.preheader.us:                          ; preds = %for.inc96.us, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge
  %indvar162 = phi i64 [ %indvar.next163, %for.inc96.us ], [ 0, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %indvars.iv94 = phi i64 [ %indvars.iv.next95, %for.inc96.us ], [ %85, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %92 = add nsw i64 %85, %indvar162
  %scevgep164 = getelementptr [2000 x double], [2000 x double]* %83, i64 0, i64 %92
  %93 = add nsw i64 %89, %indvar162
  %scevgep166 = getelementptr [2000 x double], [2000 x double]* %83, i64 %87, i64 %93
  br i1 %91, label %for.cond73.preheader.us.us.preheader, label %for.inc96.us

for.cond73.preheader.us.us.preheader:             ; preds = %for.cond69.preheader.us
  br label %for.cond73.preheader.us.us

for.inc96.us.loopexit:                            ; preds = %for.inc93.us.us
  br label %for.inc96.us

for.inc96.us:                                     ; preds = %for.inc96.us.loopexit, %for.cond69.preheader.us
  %inc91.lcssa36.lcssa.us = phi i32 [ 0, %for.cond69.preheader.us ], [ %81, %for.inc96.us.loopexit ]
  %indvars.iv.next95 = add nsw i64 %indvars.iv94, 1
  %cmp66.us = icmp slt i64 %indvars.iv.next95, %82
  %indvar.next163 = add nuw nsw i64 %indvar162, 1
  br i1 %cmp66.us, label %for.cond69.preheader.us, label %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge

for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge: ; preds = %for.inc96.us
  %94 = trunc i64 %indvars.iv.next95 to i32
  br label %for.cond65.for.cond99.preheader_crit_edge

for.cond73.preheader.us.us:                       ; preds = %for.cond73.preheader.us.us.preheader, %for.inc93.us.us
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %for.inc93.us.us ], [ 0, %for.cond73.preheader.us.us.preheader ]
  %scevgep158 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %84, i64 0, i64 %indvars.iv92, i64 0
  %scevgep160 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %84, i64 0, i64 %indvars.iv92, i64 %88
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %83, i64 %indvars.iv92, i64 %indvars.iv94
  br i1 %min.iters.check152, label %for.body76.us.us.preheader, label %min.iters.checked153

for.body76.us.us.preheader:                       ; preds = %middle.block150, %vector.memcheck, %min.iters.checked153, %for.cond73.preheader.us.us
  %indvars.iv88.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked153 ], [ 0, %for.cond73.preheader.us.us ], [ %n.vec155, %middle.block150 ]
  %95 = sub nsw i64 %90, %indvars.iv88.ph
  %xtraiter225 = and i64 %95, 1
  %lcmp.mod226 = icmp eq i64 %xtraiter225, 0
  br i1 %lcmp.mod226, label %for.body76.us.us.prol.loopexit, label %for.body76.us.us.prol

for.body76.us.us.prol:                            ; preds = %for.body76.us.us.preheader
  %96 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %83, i64 %indvars.iv88.ph, i64 %indvars.iv94
  %97 = load double, double* %arrayidx84.us.us.prol, align 8
  %mul.us.us.prol = fmul double %96, %97
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %84, i64 0, i64 %indvars.iv92, i64 %indvars.iv88.ph
  %98 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %mul.us.us.prol, %98
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  %indvars.iv.next89.prol = or i64 %indvars.iv88.ph, 1
  br label %for.body76.us.us.prol.loopexit

for.body76.us.us.prol.loopexit:                   ; preds = %for.body76.us.us.prol, %for.body76.us.us.preheader
  %indvars.iv88.unr.ph = phi i64 [ %indvars.iv.next89.prol, %for.body76.us.us.prol ], [ %indvars.iv88.ph, %for.body76.us.us.preheader ]
  %99 = icmp eq i64 %87, %indvars.iv88.ph
  br i1 %99, label %for.inc93.us.us, label %for.body76.us.us.preheader.new

for.body76.us.us.preheader.new:                   ; preds = %for.body76.us.us.prol.loopexit
  br label %for.body76.us.us

min.iters.checked153:                             ; preds = %for.cond73.preheader.us.us
  br i1 %cmp.zero156, label %for.body76.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked153
  %bound0 = icmp ult double* %scevgep158, %scevgep166
  %bound1 = icmp ult double* %scevgep164, %scevgep160
  %found.conflict = and i1 %bound0, %bound1
  %bound0169 = icmp ult double* %scevgep158, %arrayidx80.us.us
  %bound1170 = icmp ult double* %arrayidx80.us.us, %scevgep160
  %found.conflict171 = and i1 %bound0169, %bound1170
  %conflict.rdx = or i1 %found.conflict, %found.conflict171
  br i1 %conflict.rdx, label %for.body76.us.us.preheader, label %vector.body149.preheader

vector.body149.preheader:                         ; preds = %vector.memcheck
  br label %vector.body149

vector.body149:                                   ; preds = %vector.body149.preheader, %vector.body149
  %index173 = phi i64 [ %index.next174, %vector.body149 ], [ 0, %vector.body149.preheader ]
  %100 = or i64 %index173, 1
  %101 = or i64 %index173, 2
  %102 = or i64 %index173, 3
  %103 = load double, double* %arrayidx80.us.us, align 8, !alias.scope !8
  %104 = insertelement <2 x double> undef, double %103, i32 0
  %105 = shufflevector <2 x double> %104, <2 x double> undef, <2 x i32> zeroinitializer
  %106 = insertelement <2 x double> undef, double %103, i32 0
  %107 = shufflevector <2 x double> %106, <2 x double> undef, <2 x i32> zeroinitializer
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %83, i64 %index173, i64 %indvars.iv94
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %83, i64 %100, i64 %indvars.iv94
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %83, i64 %101, i64 %indvars.iv94
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %83, i64 %102, i64 %indvars.iv94
  %112 = load double, double* %108, align 8, !alias.scope !11
  %113 = load double, double* %109, align 8, !alias.scope !11
  %114 = load double, double* %110, align 8, !alias.scope !11
  %115 = load double, double* %111, align 8, !alias.scope !11
  %116 = insertelement <2 x double> undef, double %112, i32 0
  %117 = insertelement <2 x double> %116, double %113, i32 1
  %118 = insertelement <2 x double> undef, double %114, i32 0
  %119 = insertelement <2 x double> %118, double %115, i32 1
  %120 = fmul <2 x double> %105, %117
  %121 = fmul <2 x double> %107, %119
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %84, i64 0, i64 %indvars.iv92, i64 %index173
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !13, !noalias !15
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x double>*
  %wide.load181 = load <2 x double>, <2 x double>* %125, align 8, !alias.scope !13, !noalias !15
  %126 = fadd <2 x double> %120, %wide.load
  %127 = fadd <2 x double> %121, %wide.load181
  %128 = bitcast double* %122 to <2 x double>*
  store <2 x double> %126, <2 x double>* %128, align 8, !alias.scope !13, !noalias !15
  %129 = bitcast double* %124 to <2 x double>*
  store <2 x double> %127, <2 x double>* %129, align 8, !alias.scope !13, !noalias !15
  %index.next174 = add i64 %index173, 4
  %130 = icmp eq i64 %index.next174, %n.vec155
  br i1 %130, label %middle.block150, label %vector.body149, !llvm.loop !16

middle.block150:                                  ; preds = %vector.body149
  br i1 %cmp.n176, label %for.inc93.us.us, label %for.body76.us.us.preheader

for.inc93.us.us.loopexit:                         ; preds = %for.body76.us.us
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit, %for.body76.us.us.prol.loopexit, %middle.block150
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next93, %82
  br i1 %exitcond134, label %for.inc96.us.loopexit, label %for.cond73.preheader.us.us

for.body76.us.us:                                 ; preds = %for.body76.us.us, %for.body76.us.us.preheader.new
  %indvars.iv88 = phi i64 [ %indvars.iv88.unr.ph, %for.body76.us.us.preheader.new ], [ %indvars.iv.next89.1, %for.body76.us.us ]
  %131 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %83, i64 %indvars.iv88, i64 %indvars.iv94
  %132 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %131, %132
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %84, i64 0, i64 %indvars.iv92, i64 %indvars.iv88
  %133 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %mul.us.us, %133
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %134 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %83, i64 %indvars.iv.next89, i64 %indvars.iv94
  %135 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %134, %135
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %84, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next89
  %136 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %mul.us.us.1, %136
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next89, %87
  %indvars.iv.next89.1 = add nsw i64 %indvars.iv88, 2
  br i1 %exitcond.1, label %for.inc93.us.us.loopexit, label %for.body76.us.us, !llvm.loop !17

for.cond69.preheader.for.cond65.for.cond99.preheader_crit_edge_crit_edge: ; preds = %for.cond69.preheader.lr.ph
  %s.promoted = load i32, i32* %s, align 4
  %137 = add i32 %t.promoted, 1
  %138 = icmp sgt i32 %81, %137
  %smax96 = select i1 %138, i32 %81, i32 %137
  br label %for.cond65.for.cond99.preheader_crit_edge

for.cond65.for.cond99.preheader_crit_edge:        ; preds = %for.cond69.preheader.for.cond65.for.cond99.preheader_crit_edge_crit_edge, %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge
  %inc91.lcssa36.lcssa41.lcssa = phi i32 [ %inc91.lcssa36.lcssa.us, %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge ], [ %s.promoted, %for.cond69.preheader.for.cond65.for.cond99.preheader_crit_edge_crit_edge ]
  %inc97.lcssa = phi i32 [ %94, %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge ], [ %smax96, %for.cond69.preheader.for.cond65.for.cond99.preheader_crit_edge_crit_edge ]
  %inc94.lcssa38.lcssa = phi i32 [ %81, %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge ], [ 0, %for.cond69.preheader.for.cond65.for.cond99.preheader_crit_edge_crit_edge ]
  store i32 %inc94.lcssa38.lcssa, i32* %r, align 4
  store i32 %inc97.lcssa, i32* %t, align 4
  store i32 %inc91.lcssa36.lcssa41.lcssa, i32* %s, align 4
  br label %for.cond99.preheader

for.cond99.preheader:                             ; preds = %for.cond65.preheader.thread, %for.cond65.for.cond99.preheader_crit_edge
  %.pr130 = load i32, i32* %n.addr, align 4
  store i32 0, i32* %r, align 4
  %cmp10013 = icmp sgt i32 %.pr130, 0
  br i1 %cmp10013, label %for.cond103.preheader.lr.ph, label %for.end120

for.cond103.preheader.lr.ph:                      ; preds = %for.cond99.preheader
  %139 = load i32, i32* %n.addr, align 4
  %140 = sext i32 %139 to i64
  %cmp10412 = icmp sgt i32 %139, 0
  %141 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %142 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %r.promoted = load i32, i32* %r, align 4
  %143 = sext i32 %r.promoted to i64
  br i1 %cmp10412, label %for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge, label %for.cond103.preheader.for.cond99.for.end120_crit_edge_crit_edge

for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge: ; preds = %for.cond103.preheader.lr.ph
  %144 = add i32 %139, -1
  %145 = zext i32 %144 to i64
  %146 = add nuw nsw i64 %145, 1
  %147 = and i64 %146, 8589934588
  %148 = add nsw i64 %147, -4
  %149 = lshr exact i64 %148, 2
  %150 = add nuw nsw i64 %145, 1
  %min.iters.check185 = icmp ult i64 %146, 4
  %n.vec188 = and i64 %146, 8589934588
  %cmp.zero189 = icmp eq i64 %n.vec188, 0
  %151 = and i64 %149, 1
  %lcmp.mod = icmp eq i64 %151, 0
  %152 = icmp eq i64 %149, 0
  %cmp.n210 = icmp eq i64 %146, %n.vec188
  br label %for.cond103.preheader.us

for.cond103.preheader.us:                         ; preds = %for.inc118.us, %for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge
  %indvar191 = phi i64 [ %indvar.next192, %for.inc118.us ], [ 0, %for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge ]
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %for.inc118.us ], [ %143, %for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge ]
  %153 = add nsw i64 %143, %indvar191
  %scevgep193 = getelementptr [2000 x double], [2000 x double]* %142, i64 %153, i64 0
  %scevgep195 = getelementptr [2000 x double], [2000 x double]* %142, i64 %153, i64 %146
  %scevgep197 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %141, i64 0, i64 %153, i64 0
  %scevgep199 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %141, i64 0, i64 %153, i64 %146
  br i1 %min.iters.check185, label %for.body106.us.preheader, label %min.iters.checked186

min.iters.checked186:                             ; preds = %for.cond103.preheader.us
  br i1 %cmp.zero189, label %for.body106.us.preheader, label %vector.memcheck205

vector.memcheck205:                               ; preds = %min.iters.checked186
  %bound0201 = icmp ult double* %scevgep193, %scevgep199
  %bound1202 = icmp ult double* %scevgep197, %scevgep195
  %memcheck.conflict204 = and i1 %bound0201, %bound1202
  br i1 %memcheck.conflict204, label %for.body106.us.preheader, label %vector.body182.preheader

vector.body182.preheader:                         ; preds = %vector.memcheck205
  br i1 %lcmp.mod, label %vector.body182.prol, label %vector.body182.prol.loopexit

vector.body182.prol:                              ; preds = %vector.body182.preheader
  %154 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %141, i64 0, i64 %indvars.iv85, i64 0
  %155 = bitcast double* %154 to <2 x i64>*
  %wide.load215.prol = load <2 x i64>, <2 x i64>* %155, align 8, !alias.scope !18
  %156 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %141, i64 0, i64 %indvars.iv85, i64 2
  %157 = bitcast double* %156 to <2 x i64>*
  %wide.load216.prol = load <2 x i64>, <2 x i64>* %157, align 8, !alias.scope !18
  %158 = getelementptr inbounds [2000 x double], [2000 x double]* %142, i64 %indvars.iv85, i64 0
  %159 = bitcast double* %158 to <2 x i64>*
  store <2 x i64> %wide.load215.prol, <2 x i64>* %159, align 8, !alias.scope !21, !noalias !18
  %160 = getelementptr [2000 x double], [2000 x double]* %142, i64 %indvars.iv85, i64 2
  %161 = bitcast double* %160 to <2 x i64>*
  store <2 x i64> %wide.load216.prol, <2 x i64>* %161, align 8, !alias.scope !21, !noalias !18
  br label %vector.body182.prol.loopexit

vector.body182.prol.loopexit:                     ; preds = %vector.body182.prol, %vector.body182.preheader
  %index207.unr.ph = phi i64 [ 4, %vector.body182.prol ], [ 0, %vector.body182.preheader ]
  br i1 %152, label %middle.block183, label %vector.body182.preheader.new

vector.body182.preheader.new:                     ; preds = %vector.body182.prol.loopexit
  br label %vector.body182

vector.body182:                                   ; preds = %vector.body182, %vector.body182.preheader.new
  %index207 = phi i64 [ %index207.unr.ph, %vector.body182.preheader.new ], [ %index.next208.1, %vector.body182 ]
  %162 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %141, i64 0, i64 %indvars.iv85, i64 %index207
  %163 = bitcast double* %162 to <2 x i64>*
  %wide.load215 = load <2 x i64>, <2 x i64>* %163, align 8, !alias.scope !18
  %164 = getelementptr double, double* %162, i64 2
  %165 = bitcast double* %164 to <2 x i64>*
  %wide.load216 = load <2 x i64>, <2 x i64>* %165, align 8, !alias.scope !18
  %166 = getelementptr inbounds [2000 x double], [2000 x double]* %142, i64 %indvars.iv85, i64 %index207
  %167 = bitcast double* %166 to <2 x i64>*
  store <2 x i64> %wide.load215, <2 x i64>* %167, align 8, !alias.scope !21, !noalias !18
  %168 = getelementptr double, double* %166, i64 2
  %169 = bitcast double* %168 to <2 x i64>*
  store <2 x i64> %wide.load216, <2 x i64>* %169, align 8, !alias.scope !21, !noalias !18
  %index.next208 = add i64 %index207, 4
  %170 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %141, i64 0, i64 %indvars.iv85, i64 %index.next208
  %171 = bitcast double* %170 to <2 x i64>*
  %wide.load215.1 = load <2 x i64>, <2 x i64>* %171, align 8, !alias.scope !18
  %172 = getelementptr double, double* %170, i64 2
  %173 = bitcast double* %172 to <2 x i64>*
  %wide.load216.1 = load <2 x i64>, <2 x i64>* %173, align 8, !alias.scope !18
  %174 = getelementptr inbounds [2000 x double], [2000 x double]* %142, i64 %indvars.iv85, i64 %index.next208
  %175 = bitcast double* %174 to <2 x i64>*
  store <2 x i64> %wide.load215.1, <2 x i64>* %175, align 8, !alias.scope !21, !noalias !18
  %176 = getelementptr double, double* %174, i64 2
  %177 = bitcast double* %176 to <2 x i64>*
  store <2 x i64> %wide.load216.1, <2 x i64>* %177, align 8, !alias.scope !21, !noalias !18
  %index.next208.1 = add i64 %index207, 8
  %178 = icmp eq i64 %index.next208.1, %n.vec188
  br i1 %178, label %middle.block183.loopexit, label %vector.body182, !llvm.loop !23

middle.block183.loopexit:                         ; preds = %vector.body182
  br label %middle.block183

middle.block183:                                  ; preds = %middle.block183.loopexit, %vector.body182.prol.loopexit
  br i1 %cmp.n210, label %for.inc118.us, label %for.body106.us.preheader

for.body106.us.preheader:                         ; preds = %middle.block183, %vector.memcheck205, %min.iters.checked186, %for.cond103.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck205 ], [ 0, %min.iters.checked186 ], [ 0, %for.cond103.preheader.us ], [ %n.vec188, %middle.block183 ]
  %179 = sub nsw i64 %150, %indvars.iv.ph
  %180 = sub nsw i64 %145, %indvars.iv.ph
  %xtraiter223 = and i64 %179, 3
  %lcmp.mod224 = icmp eq i64 %xtraiter223, 0
  br i1 %lcmp.mod224, label %for.body106.us.prol.loopexit, label %for.body106.us.prol.preheader

for.body106.us.prol.preheader:                    ; preds = %for.body106.us.preheader
  br label %for.body106.us.prol

for.body106.us.prol:                              ; preds = %for.body106.us.prol, %for.body106.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body106.us.prol ], [ %indvars.iv.ph, %for.body106.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body106.us.prol ], [ %xtraiter223, %for.body106.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %141, i64 0, i64 %indvars.iv85, i64 %indvars.iv.prol
  %181 = bitcast double* %arrayidx110.us.prol to i64*
  %182 = load i64, i64* %181, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %142, i64 %indvars.iv85, i64 %indvars.iv.prol
  %183 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %182, i64* %183, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body106.us.prol.loopexit.loopexit, label %for.body106.us.prol, !llvm.loop !24

for.body106.us.prol.loopexit.loopexit:            ; preds = %for.body106.us.prol
  %184 = add i64 %indvars.iv.ph, %xtraiter223
  br label %for.body106.us.prol.loopexit

for.body106.us.prol.loopexit:                     ; preds = %for.body106.us.prol.loopexit.loopexit, %for.body106.us.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body106.us.preheader ], [ %184, %for.body106.us.prol.loopexit.loopexit ]
  %185 = icmp ult i64 %180, 3
  br i1 %185, label %for.inc118.us, label %for.body106.us.preheader.new

for.body106.us.preheader.new:                     ; preds = %for.body106.us.prol.loopexit
  br label %for.body106.us

for.body106.us:                                   ; preds = %for.body106.us, %for.body106.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body106.us.preheader.new ], [ %indvars.iv.next.3, %for.body106.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %141, i64 0, i64 %indvars.iv85, i64 %indvars.iv
  %186 = bitcast double* %arrayidx110.us to i64*
  %187 = load i64, i64* %186, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %142, i64 %indvars.iv85, i64 %indvars.iv
  %188 = bitcast double* %arrayidx114.us to i64*
  store i64 %187, i64* %188, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %141, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next
  %189 = bitcast double* %arrayidx110.us.1 to i64*
  %190 = load i64, i64* %189, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %142, i64 %indvars.iv85, i64 %indvars.iv.next
  %191 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %190, i64* %191, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %141, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next.1
  %192 = bitcast double* %arrayidx110.us.2 to i64*
  %193 = load i64, i64* %192, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %142, i64 %indvars.iv85, i64 %indvars.iv.next.1
  %194 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %193, i64* %194, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %141, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next.2
  %195 = bitcast double* %arrayidx110.us.3 to i64*
  %196 = load i64, i64* %195, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %142, i64 %indvars.iv85, i64 %indvars.iv.next.2
  %197 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %196, i64* %197, align 8
  %exitcond132.3 = icmp eq i64 %indvars.iv.next.2, %145
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond132.3, label %for.inc118.us.loopexit, label %for.body106.us, !llvm.loop !25

for.inc118.us.loopexit:                           ; preds = %for.body106.us
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit, %for.body106.us.prol.loopexit, %middle.block183
  %indvars.iv.next86 = add nsw i64 %indvars.iv85, 1
  %cmp100.us = icmp slt i64 %indvars.iv.next86, %140
  %indvar.next192 = add nuw nsw i64 %indvar191, 1
  br i1 %cmp100.us, label %for.cond103.preheader.us, label %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge

for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge: ; preds = %for.inc118.us
  %198 = trunc i64 %indvars.iv.next86 to i32
  br label %for.cond99.for.end120_crit_edge

for.cond103.preheader.for.cond99.for.end120_crit_edge_crit_edge: ; preds = %for.cond103.preheader.lr.ph
  %199 = add i32 %r.promoted, 1
  %200 = icmp sgt i32 %139, %199
  %smax = select i1 %200, i32 %139, i32 %199
  br label %for.cond99.for.end120_crit_edge

for.cond99.for.end120_crit_edge:                  ; preds = %for.cond103.preheader.for.cond99.for.end120_crit_edge_crit_edge, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge
  %inc116.lcssa31.lcssa = phi i32 [ %139, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge ], [ 0, %for.cond103.preheader.for.cond99.for.end120_crit_edge_crit_edge ]
  %inc119.lcssa = phi i32 [ %198, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge ], [ %smax, %for.cond103.preheader.for.cond99.for.end120_crit_edge_crit_edge ]
  store i32 %inc119.lcssa, i32* %r, align 4
  store i32 %inc116.lcssa31.lcssa, i32* %s, align 4
  br label %for.end120

for.end120:                                       ; preds = %for.cond99.preheader, %for.cond99.preheader.thread, %for.cond99.for.end120_crit_edge
  %201 = bitcast [2000 x [2000 x double]]** %B to i8**
  %202 = load i8*, i8** %201, align 8
  tail call void @free(i8* %202) #4
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
  %7 = add nsw i64 %wide.trip.count74, 1
  %8 = sub nsw i64 %7, %2
  %9 = sub nsw i64 %wide.trip.count74, %2
  %10 = zext i32 %4 to i64
  %11 = trunc i32 %3 to i2
  %12 = add i2 %11, 1
  %13 = trunc i32 %i.promoted43 to i2
  %14 = sub i2 %12, %13
  %15 = bitcast double* %w to i64*
  %16 = bitcast double* %w to i64*
  %17 = bitcast double* %w to i64*
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %for.cond1.preheader.lr.ph
  %indvars.iv131 = phi i2 [ %indvars.iv.next132, %for.inc58 ], [ %14, %for.cond1.preheader.lr.ph ]
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %for.inc58 ], [ %2, %for.cond1.preheader.lr.ph ]
  %indvar112 = phi i64 [ %indvar.next113, %for.inc58 ], [ 0, %for.cond1.preheader.lr.ph ]
  %indvars.iv98 = phi i32 [ %indvars.iv.next99, %for.inc58 ], [ %4, %for.cond1.preheader.lr.ph ]
  %inc49.lcssa40.lcssa45 = phi i32 [ %inc49.lcssa40.lcssa46, %for.inc58 ], [ %k.promoted, %for.cond1.preheader.lr.ph ]
  %18 = zext i2 %indvars.iv131 to i64
  %19 = add i64 %indvars.iv129, %18
  %20 = add nuw nsw i64 %10, %indvar112
  %21 = and i64 %20, 4294967295
  %22 = sub nsw i64 %8, %indvar112
  %23 = sub nsw i64 %9, %indvar112
  %24 = zext i32 %indvars.iv98 to i64
  %25 = add i32 %indvars.iv98, 1
  %cmp216 = icmp sgt i64 %indvars.iv129, 0
  br i1 %cmp216, label %for.body3.preheader, label %for.end27

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 0
  br label %for.body3

for.cond.for.cond61.preheader_crit_edge:          ; preds = %for.inc58
  %26 = trunc i64 %indvars.iv.next130 to i32
  store i32 %26, i32* %i, align 4
  store i32 %inc49.lcssa40.lcssa46, i32* %k, align 4
  br label %for.cond61.preheader

for.cond61.preheader:                             ; preds = %entry, %for.cond.for.cond61.preheader_crit_edge
  store i32 0, i32* %i, align 4
  %27 = load i32, i32* %n.addr, align 4
  %cmp6214 = icmp sgt i32 %27, 0
  br i1 %cmp6214, label %for.body63.lr.ph, label %for.end84.thread

for.end84.thread:                                 ; preds = %for.cond61.preheader
  %storemerge21189 = add nsw i32 %27, -1
  store i32 %storemerge21189, i32* %i, align 4
  br label %for.end113

for.body63.lr.ph:                                 ; preds = %for.cond61.preheader
  %28 = load double*, double** %b.addr, align 8
  %29 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %30 = load double*, double** %y.addr, align 8
  %31 = load i32, i32* %n.addr, align 4
  %i.promoted28 = load i32, i32* %i, align 4
  %32 = add i32 %i.promoted28, -1
  %33 = sext i32 %i.promoted28 to i64
  %34 = sext i32 %31 to i64
  %35 = trunc i32 %i.promoted28 to i2
  %36 = bitcast double* %w to i64*
  %37 = bitcast double* %w to i64*
  br label %for.body63

for.body3:                                        ; preds = %for.body3.preheader, %for.end
  %indvars.iv95 = phi i32 [ %indvars.iv.next96, %for.end ], [ -1, %for.body3.preheader ]
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.end ], [ 0, %for.body3.preheader ]
  %38 = add nuw i64 %indvars.iv68, 4294967295
  %39 = and i64 %38, 4294967295
  %40 = zext i32 %indvars.iv95 to i64
  %41 = add i32 %indvars.iv95, 1
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %indvars.iv68
  %42 = bitcast double* %arrayidx5 to i64*
  %43 = load i64, i64* %42, align 8
  store i64 %43, i64* %15, align 8
  %cmp715 = icmp sgt i64 %indvars.iv68, 0
  br i1 %cmp715, label %for.body8.lr.ph, label %for.end

for.body8.lr.ph:                                  ; preds = %for.body3
  %w.promoted32 = load double, double* %w, align 8
  %44 = and i64 %38, 1
  %lcmp.mod111 = icmp eq i64 %44, 0
  br i1 %lcmp.mod111, label %for.body8.prol, label %for.body8.prol.loopexit

for.body8.prol:                                   ; preds = %for.body8.lr.ph
  %45 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv68
  %46 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %45, %46
  %sub.prol = fsub double %w.promoted32, %mul.prol
  br label %for.body8.prol.loopexit

for.body8.prol.loopexit:                          ; preds = %for.body8.prol, %for.body8.lr.ph
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ undef, %for.body8.lr.ph ]
  %indvars.iv62.unr.ph = phi i64 [ 1, %for.body8.prol ], [ 0, %for.body8.lr.ph ]
  %sub33.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ %w.promoted32, %for.body8.lr.ph ]
  %47 = icmp eq i64 %39, 0
  br i1 %47, label %for.cond6.for.end_crit_edge, label %for.body8.lr.ph.new

for.body8.lr.ph.new:                              ; preds = %for.body8.prol.loopexit
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.body8.lr.ph.new
  %indvars.iv62 = phi i64 [ %indvars.iv62.unr.ph, %for.body8.lr.ph.new ], [ %indvars.iv.next63.1, %for.body8 ]
  %sub33 = phi double [ %sub33.unr.ph, %for.body8.lr.ph.new ], [ %sub.1, %for.body8 ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %indvars.iv62
  %48 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv62, i64 %indvars.iv68
  %49 = load double, double* %arrayidx16, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %50 = load <2 x double>, <2 x double>* %48, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next63, i64 %indvars.iv68
  %51 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %49, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %51, i32 1
  %mul = fmul <2 x double> %50, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %sub33, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %exitcond97.1 = icmp eq i64 %indvars.iv.next63, %40
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  br i1 %exitcond97.1, label %for.cond6.for.end_crit_edge.loopexit, label %for.body8

for.cond6.for.end_crit_edge.loopexit:             ; preds = %for.body8
  br label %for.cond6.for.end_crit_edge

for.cond6.for.end_crit_edge:                      ; preds = %for.cond6.for.end_crit_edge.loopexit, %for.body8.prol.loopexit
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.body8.prol.loopexit ], [ %sub.1, %for.cond6.for.end_crit_edge.loopexit ]
  store double %sub.lcssa, double* %w, align 8
  br label %for.end

for.end:                                          ; preds = %for.body3, %for.cond6.for.end_crit_edge
  %inc.lcssa35 = phi i32 [ %41, %for.cond6.for.end_crit_edge ], [ 0, %for.body3 ]
  %52 = load double, double* %w, align 8
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv68
  %53 = load double, double* %arrayidx20, align 8
  %div = fdiv double %52, %53
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %indvars.iv68
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %indvars.iv.next96 = add i32 %indvars.iv95, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next69, %indvars.iv129
  br i1 %exitcond104, label %for.end27.loopexit, label %for.body3

for.end27.loopexit:                               ; preds = %for.end
  br label %for.end27

for.end27:                                        ; preds = %for.end27.loopexit, %for.cond1.preheader
  %inc49.lcssa40.lcssa44 = phi i32 [ %inc49.lcssa40.lcssa45, %for.cond1.preheader ], [ %inc.lcssa35, %for.end27.loopexit ]
  %cmp2918 = icmp slt i64 %indvars.iv129, %6
  br i1 %cmp2918, label %for.body30.lr.ph, label %for.inc58

for.body30.lr.ph:                                 ; preds = %for.end27
  %cmp3617 = icmp sgt i64 %indvars.iv129, 0
  br i1 %cmp3617, label %for.body30.us.preheader, label %for.body30.preheader

for.body30.preheader:                             ; preds = %for.body30.lr.ph
  %xtraiter114 = and i64 %22, 3
  %lcmp.mod115 = icmp eq i64 %xtraiter114, 0
  br i1 %lcmp.mod115, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.preheader
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol, %for.body30.prol.preheader
  %indvars.iv72.prol = phi i64 [ %indvars.iv.next73.prol, %for.body30.prol ], [ %indvars.iv129, %for.body30.prol.preheader ]
  %prol.iter116 = phi i64 [ %prol.iter116.sub, %for.body30.prol ], [ %xtraiter114, %for.body30.prol.preheader ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %indvars.iv72.prol
  %54 = bitcast double* %arrayidx34.prol to i64*
  %55 = load i64, i64* %54, align 8
  %arrayidx54.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %indvars.iv72.prol
  %56 = bitcast double* %arrayidx54.prol to i64*
  store i64 %55, i64* %56, align 8
  %indvars.iv.next73.prol = add nsw i64 %indvars.iv72.prol, 1
  %prol.iter116.sub = add nsw i64 %prol.iter116, -1
  %prol.iter116.cmp = icmp eq i64 %prol.iter116.sub, 0
  br i1 %prol.iter116.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !26

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.preheader
  %.lcssa.unr = phi i64 [ undef, %for.body30.preheader ], [ %55, %for.body30.prol.loopexit.loopexit ]
  %indvars.iv72.unr = phi i64 [ %indvars.iv129, %for.body30.preheader ], [ %19, %for.body30.prol.loopexit.loopexit ]
  %57 = icmp ult i64 %23, 3
  br i1 %57, label %for.inc58.loopexit91, label %for.body30.preheader.new

for.body30.preheader.new:                         ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %58 = and i64 %20, 1
  %lcmp.mod118 = icmp eq i64 %58, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 0
  %59 = icmp eq i64 %21, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond35.for.end50_crit_edge.us
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %for.cond35.for.end50_crit_edge.us ], [ %indvars.iv129, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %indvars.iv85
  %60 = bitcast double* %arrayidx34.us to i64*
  %61 = load i64, i64* %60, align 8
  store i64 %61, i64* %16, align 8
  %w.promoted37.us.cast = bitcast i64 %61 to double
  br i1 %lcmp.mod118, label %for.body37.us.prol, label %for.body37.us.prol.loopexit

for.body37.us.prol:                               ; preds = %for.body30.us
  %62 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv85
  %63 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %62, %63
  %sub47.us.prol = fsub double %w.promoted37.us.cast, %mul46.us.prol
  br label %for.body37.us.prol.loopexit

for.body37.us.prol.loopexit:                      ; preds = %for.body37.us.prol, %for.body30.us
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ undef, %for.body30.us ]
  %indvars.iv77.unr.ph = phi i64 [ 1, %for.body37.us.prol ], [ 0, %for.body30.us ]
  %sub4738.us.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ %w.promoted37.us.cast, %for.body30.us ]
  br i1 %59, label %for.cond35.for.end50_crit_edge.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.body37.us.prol.loopexit
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us, %for.body30.us.new
  %indvars.iv77 = phi i64 [ %indvars.iv77.unr.ph, %for.body30.us.new ], [ %indvars.iv.next78.1, %for.body37.us ]
  %sub4738.us = phi double [ %sub4738.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.body37.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %indvars.iv77
  %64 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv77, i64 %indvars.iv85
  %65 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %66 = load <2 x double>, <2 x double>* %64, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next78, i64 %indvars.iv85
  %67 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %65, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %67, i32 1
  %mul46.us = fmul <2 x double> %66, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %sub4738.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %exitcond100.1 = icmp eq i64 %indvars.iv.next78, %24
  %indvars.iv.next78.1 = add nsw i64 %indvars.iv77, 2
  br i1 %exitcond100.1, label %for.cond35.for.end50_crit_edge.us.loopexit, label %for.body37.us

for.cond35.for.end50_crit_edge.us.loopexit:       ; preds = %for.body37.us
  br label %for.cond35.for.end50_crit_edge.us

for.cond35.for.end50_crit_edge.us:                ; preds = %for.cond35.for.end50_crit_edge.us.loopexit, %for.body37.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.body37.us.prol.loopexit ], [ %sub47.us.1, %for.cond35.for.end50_crit_edge.us.loopexit ]
  store double %sub47.us.lcssa, double* %w, align 8
  %arrayidx54.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %indvars.iv85
  store double %sub47.us.lcssa, double* %arrayidx54.us, align 8
  %indvars.iv.next86 = add i64 %indvars.iv85, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next86, %6
  br i1 %exitcond101, label %for.inc58.loopexit, label %for.body30.us

for.body30:                                       ; preds = %for.body30, %for.body30.preheader.new
  %indvars.iv72 = phi i64 [ %indvars.iv72.unr, %for.body30.preheader.new ], [ %indvars.iv.next73.3, %for.body30 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %indvars.iv72
  %68 = bitcast double* %arrayidx34 to i64*
  %69 = bitcast i64* %68 to <2 x i64>*
  %arrayidx54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %indvars.iv72
  %70 = bitcast double* %arrayidx54 to i64*
  %71 = load <2 x i64>, <2 x i64>* %69, align 8
  %72 = bitcast i64* %70 to <2 x i64>*
  store <2 x i64> %71, <2 x i64>* %72, align 8
  %indvars.iv.next73.1 = add i64 %indvars.iv72, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %indvars.iv.next73.1
  %73 = bitcast double* %arrayidx34.2 to i64*
  %74 = bitcast i64* %73 to <2 x i64>*
  %arrayidx54.2 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %indvars.iv.next73.1
  %75 = bitcast double* %arrayidx54.2 to i64*
  %indvars.iv.next73.2 = add i64 %indvars.iv72, 3
  %76 = load <2 x i64>, <2 x i64>* %74, align 8
  %77 = bitcast i64* %75 to <2 x i64>*
  store <2 x i64> %76, <2 x i64>* %77, align 8
  %exitcond75.3 = icmp eq i64 %indvars.iv.next73.2, %wide.trip.count74
  %indvars.iv.next73.3 = add i64 %indvars.iv72, 4
  br i1 %exitcond75.3, label %for.inc58.loopexit91.loopexit, label %for.body30

for.inc58.loopexit91.loopexit:                    ; preds = %for.body30
  %78 = extractelement <2 x i64> %76, i32 1
  br label %for.inc58.loopexit91

for.inc58.loopexit91:                             ; preds = %for.inc58.loopexit91.loopexit, %for.body30.prol.loopexit
  %.lcssa = phi i64 [ %.lcssa.unr, %for.body30.prol.loopexit ], [ %78, %for.inc58.loopexit91.loopexit ]
  store i64 %.lcssa, i64* %17, align 8
  br label %for.inc58

for.inc58.loopexit:                               ; preds = %for.cond35.for.end50_crit_edge.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.inc58.loopexit91, %for.end27
  %inc49.lcssa40.lcssa46 = phi i32 [ %inc49.lcssa40.lcssa44, %for.end27 ], [ 0, %for.inc58.loopexit91 ], [ %25, %for.inc58.loopexit ]
  %indvars.iv.next130 = add nsw i64 %indvars.iv129, 1
  %cmp = icmp slt i64 %indvars.iv.next130, %5
  %indvars.iv.next99 = add i32 %indvars.iv98, 1
  %indvar.next113 = add nuw nsw i64 %indvar112, 1
  %indvars.iv.next132 = add i2 %indvars.iv131, -1
  br i1 %cmp, label %for.cond1.preheader, label %for.cond.for.cond61.preheader_crit_edge

for.body63:                                       ; preds = %for.end79, %for.body63.lr.ph
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %for.end79 ], [ 0, %for.body63.lr.ph ]
  %indvars.iv = phi i2 [ %indvars.iv.next, %for.end79 ], [ %35, %for.body63.lr.ph ]
  %indvars.iv92 = phi i32 [ %indvars.iv.next93, %for.end79 ], [ %32, %for.body63.lr.ph ]
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.end79 ], [ %33, %for.body63.lr.ph ]
  %79 = zext i2 %indvars.iv to i64
  %80 = trunc i64 %indvars.iv127 to i32
  %81 = add i32 %32, %80
  %82 = zext i32 %indvars.iv92 to i64
  %arrayidx65 = getelementptr inbounds double, double* %28, i64 %indvars.iv60
  %83 = bitcast double* %arrayidx65 to i64*
  %84 = load i64, i64* %83, align 8
  store i64 %84, i64* %36, align 8
  %cmp6713 = icmp sgt i64 %indvars.iv60, 0
  br i1 %cmp6713, label %for.body68.lr.ph, label %for.end79

for.body68.lr.ph:                                 ; preds = %for.body63
  %85 = zext i32 %81 to i64
  %86 = add nuw nsw i64 %85, 1
  %w.promoted26 = load double, double* %w, align 8
  %xtraiter107 = and i64 %86, 3
  %lcmp.mod108 = icmp eq i64 %xtraiter107, 0
  br i1 %lcmp.mod108, label %for.body68.prol.loopexit, label %for.body68.prol.preheader

for.body68.prol.preheader:                        ; preds = %for.body68.lr.ph
  br label %for.body68.prol

for.body68.prol:                                  ; preds = %for.body68.prol, %for.body68.prol.preheader
  %indvars.iv54.prol = phi i64 [ %indvars.iv.next55.prol, %for.body68.prol ], [ 0, %for.body68.prol.preheader ]
  %sub7627.prol = phi double [ %sub76.prol, %for.body68.prol ], [ %w.promoted26, %for.body68.prol.preheader ]
  %prol.iter109 = phi i64 [ %prol.iter109.sub, %for.body68.prol ], [ %xtraiter107, %for.body68.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv60, i64 %indvars.iv54.prol
  %87 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %30, i64 %indvars.iv54.prol
  %88 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %87, %88
  %sub76.prol = fsub double %sub7627.prol, %mul75.prol
  %indvars.iv.next55.prol = add nuw nsw i64 %indvars.iv54.prol, 1
  %prol.iter109.sub = add nsw i64 %prol.iter109, -1
  %prol.iter109.cmp = icmp eq i64 %prol.iter109.sub, 0
  br i1 %prol.iter109.cmp, label %for.body68.prol.loopexit.loopexit, label %for.body68.prol, !llvm.loop !27

for.body68.prol.loopexit.loopexit:                ; preds = %for.body68.prol
  br label %for.body68.prol.loopexit

for.body68.prol.loopexit:                         ; preds = %for.body68.prol.loopexit.loopexit, %for.body68.lr.ph
  %sub76.lcssa.unr = phi double [ undef, %for.body68.lr.ph ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %indvars.iv54.unr = phi i64 [ 0, %for.body68.lr.ph ], [ %79, %for.body68.prol.loopexit.loopexit ]
  %sub7627.unr = phi double [ %w.promoted26, %for.body68.lr.ph ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %89 = icmp ult i32 %81, 3
  br i1 %89, label %for.cond66.for.end79_crit_edge, label %for.body68.lr.ph.new

for.body68.lr.ph.new:                             ; preds = %for.body68.prol.loopexit
  br label %for.body68

for.body68:                                       ; preds = %for.body68, %for.body68.lr.ph.new
  %indvars.iv54 = phi i64 [ %indvars.iv54.unr, %for.body68.lr.ph.new ], [ %indvars.iv.next55.3, %for.body68 ]
  %sub7627 = phi double [ %sub7627.unr, %for.body68.lr.ph.new ], [ %sub76.3, %for.body68 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv60, i64 %indvars.iv54
  %90 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %30, i64 %indvars.iv54
  %91 = bitcast double* %arrayidx74 to <2 x double>*
  %92 = load <2 x double>, <2 x double>* %90, align 8
  %93 = load <2 x double>, <2 x double>* %91, align 8
  %mul75 = fmul <2 x double> %92, %93
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %sub7627, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv54, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv60, i64 %indvars.iv.next55.1
  %94 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %30, i64 %indvars.iv.next55.1
  %95 = bitcast double* %arrayidx74.2 to <2 x double>*
  %indvars.iv.next55.2 = add nsw i64 %indvars.iv54, 3
  %96 = load <2 x double>, <2 x double>* %94, align 8
  %97 = load <2 x double>, <2 x double>* %95, align 8
  %mul75.2 = fmul <2 x double> %96, %97
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %exitcond94.3 = icmp eq i64 %indvars.iv.next55.2, %82
  %indvars.iv.next55.3 = add nsw i64 %indvars.iv54, 4
  br i1 %exitcond94.3, label %for.cond66.for.end79_crit_edge.loopexit, label %for.body68

for.cond66.for.end79_crit_edge.loopexit:          ; preds = %for.body68
  br label %for.cond66.for.end79_crit_edge

for.cond66.for.end79_crit_edge:                   ; preds = %for.cond66.for.end79_crit_edge.loopexit, %for.body68.prol.loopexit
  %sub76.lcssa = phi double [ %sub76.lcssa.unr, %for.body68.prol.loopexit ], [ %sub76.3, %for.cond66.for.end79_crit_edge.loopexit ]
  store double %sub76.lcssa, double* %w, align 8
  br label %for.end79

for.end79:                                        ; preds = %for.body63, %for.cond66.for.end79_crit_edge
  %98 = load i64, i64* %37, align 8
  %arrayidx81 = getelementptr inbounds double, double* %30, i64 %indvars.iv60
  %99 = bitcast double* %arrayidx81 to i64*
  store i64 %98, i64* %99, align 8
  %indvars.iv.next61 = add nsw i64 %indvars.iv60, 1
  %cmp62 = icmp slt i64 %indvars.iv.next61, %34
  %indvars.iv.next93 = add i32 %indvars.iv92, 1
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %indvars.iv.next = add i2 %indvars.iv, 1
  br i1 %cmp62, label %for.body63, label %for.end84

for.end84:                                        ; preds = %for.end79
  %.pr = load i32, i32* %n.addr, align 4
  %storemerge211 = add nsw i32 %.pr, -1
  store i32 %storemerge211, i32* %i, align 4
  %cmp8712 = icmp sgt i32 %.pr, 0
  br i1 %cmp8712, label %for.body88.lr.ph, label %for.end113

for.body88.lr.ph:                                 ; preds = %for.end84
  %100 = load double*, double** %y.addr, align 8
  %101 = load i32, i32* %n.addr, align 4
  %102 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %103 = load double*, double** %x.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  %104 = add i32 %i.promoted, 1
  %105 = add i32 %101, -1
  %106 = sext i32 %i.promoted to i64
  %107 = sext i32 %101 to i64
  %wide.trip.count = sext i32 %105 to i64
  %108 = add nsw i64 %wide.trip.count, 1
  %109 = trunc i32 %105 to i2
  %110 = add i2 %109, 1
  %111 = trunc i32 %104 to i2
  %112 = sub i2 %110, %111
  %113 = bitcast double* %w to i64*
  br label %for.body88

for.body88:                                       ; preds = %for.end104, %for.body88.lr.ph
  %indvars.iv125 = phi i64 [ %indvars.iv.next126, %for.end104 ], [ 0, %for.body88.lr.ph ]
  %indvars.iv123 = phi i2 [ %indvars.iv.next124, %for.end104 ], [ %112, %for.body88.lr.ph ]
  %indvars.iv121 = phi i32 [ %indvars.iv.next122, %for.end104 ], [ %104, %for.body88.lr.ph ]
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.end104 ], [ %106, %for.body88.lr.ph ]
  %114 = sext i32 %indvars.iv121 to i64
  %115 = zext i2 %indvars.iv123 to i64
  %116 = add i64 %114, %115
  %117 = trunc i64 %indvars.iv125 to i32
  %118 = sub i32 %104, %117
  %119 = sext i32 %118 to i64
  %120 = sub nsw i64 %wide.trip.count, %119
  %arrayidx90 = getelementptr inbounds double, double* %100, i64 %indvars.iv51
  %121 = bitcast double* %arrayidx90 to i64*
  %122 = load i64, i64* %121, align 8
  store i64 %122, i64* %113, align 8
  %123 = add nsw i64 %indvars.iv51, 1
  %cmp9210 = icmp slt i64 %123, %107
  br i1 %cmp9210, label %for.body93.lr.ph, label %for.end104

for.body93.lr.ph:                                 ; preds = %for.body88
  %124 = sub nsw i64 %108, %119
  %125 = sext i32 %indvars.iv121 to i64
  %w.promoted = load double, double* %w, align 8
  %xtraiter = and i64 %124, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body93.prol.loopexit, label %for.body93.prol.preheader

for.body93.prol.preheader:                        ; preds = %for.body93.lr.ph
  br label %for.body93.prol

for.body93.prol:                                  ; preds = %for.body93.prol, %for.body93.prol.preheader
  %indvars.iv49.prol = phi i64 [ %indvars.iv.next50.prol, %for.body93.prol ], [ %125, %for.body93.prol.preheader ]
  %sub10121.prol = phi double [ %sub101.prol, %for.body93.prol ], [ %w.promoted, %for.body93.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body93.prol ], [ %xtraiter, %for.body93.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %102, i64 %indvars.iv51, i64 %indvars.iv49.prol
  %126 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %103, i64 %indvars.iv49.prol
  %127 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %126, %127
  %sub101.prol = fsub double %sub10121.prol, %mul100.prol
  %indvars.iv.next50.prol = add nsw i64 %indvars.iv49.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body93.prol.loopexit.loopexit, label %for.body93.prol, !llvm.loop !28

for.body93.prol.loopexit.loopexit:                ; preds = %for.body93.prol
  br label %for.body93.prol.loopexit

for.body93.prol.loopexit:                         ; preds = %for.body93.prol.loopexit.loopexit, %for.body93.lr.ph
  %sub101.lcssa.unr = phi double [ undef, %for.body93.lr.ph ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %indvars.iv49.unr = phi i64 [ %125, %for.body93.lr.ph ], [ %116, %for.body93.prol.loopexit.loopexit ]
  %sub10121.unr = phi double [ %w.promoted, %for.body93.lr.ph ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %128 = icmp ult i64 %120, 3
  br i1 %128, label %for.cond91.for.end104_crit_edge, label %for.body93.lr.ph.new

for.body93.lr.ph.new:                             ; preds = %for.body93.prol.loopexit
  br label %for.body93

for.body93:                                       ; preds = %for.body93, %for.body93.lr.ph.new
  %indvars.iv49 = phi i64 [ %indvars.iv49.unr, %for.body93.lr.ph.new ], [ %indvars.iv.next50.3, %for.body93 ]
  %sub10121 = phi double [ %sub10121.unr, %for.body93.lr.ph.new ], [ %sub101.3, %for.body93 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %102, i64 %indvars.iv51, i64 %indvars.iv49
  %129 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %103, i64 %indvars.iv49
  %130 = bitcast double* %arrayidx99 to <2 x double>*
  %131 = load <2 x double>, <2 x double>* %129, align 8
  %132 = load <2 x double>, <2 x double>* %130, align 8
  %mul100 = fmul <2 x double> %131, %132
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %sub10121, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %102, i64 %indvars.iv51, i64 %indvars.iv.next50.1
  %133 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %103, i64 %indvars.iv.next50.1
  %134 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next50.2 = add nsw i64 %indvars.iv49, 3
  %135 = load <2 x double>, <2 x double>* %133, align 8
  %136 = load <2 x double>, <2 x double>* %134, align 8
  %mul100.2 = fmul <2 x double> %135, %136
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %exitcond.3 = icmp eq i64 %indvars.iv.next50.2, %wide.trip.count
  %indvars.iv.next50.3 = add nsw i64 %indvars.iv49, 4
  br i1 %exitcond.3, label %for.cond91.for.end104_crit_edge.loopexit, label %for.body93

for.cond91.for.end104_crit_edge.loopexit:         ; preds = %for.body93
  br label %for.cond91.for.end104_crit_edge

for.cond91.for.end104_crit_edge:                  ; preds = %for.cond91.for.end104_crit_edge.loopexit, %for.body93.prol.loopexit
  %sub101.lcssa = phi double [ %sub101.lcssa.unr, %for.body93.prol.loopexit ], [ %sub101.3, %for.cond91.for.end104_crit_edge.loopexit ]
  store double %sub101.lcssa, double* %w, align 8
  br label %for.end104

for.end104:                                       ; preds = %for.body88, %for.cond91.for.end104_crit_edge
  %137 = load double, double* %w, align 8
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %102, i64 %indvars.iv51, i64 %indvars.iv51
  %138 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %137, %138
  %arrayidx111 = getelementptr inbounds double, double* %103, i64 %indvars.iv51
  store double %div109, double* %arrayidx111, align 8
  %indvars.iv.next52 = add nsw i64 %indvars.iv51, -1
  %cmp87 = icmp sgt i64 %indvars.iv51, 0
  %indvars.iv.next122 = add i32 %indvars.iv121, -1
  %indvars.iv.next124 = add i2 %indvars.iv123, 1
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  br i1 %cmp87, label %for.body88, label %for.cond86.for.end113_crit_edge

for.cond86.for.end113_crit_edge:                  ; preds = %for.end104
  %139 = trunc i64 %indvars.iv.next52 to i32
  store i32 %139, i32* %i, align 4
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

for.body:                                         ; preds = %if.end, %for.body.lr.ph
  %indvars.iv = phi i64 [ %6, %for.body.lr.ph ], [ %indvars.iv.next, %if.end ]
  %8 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %8, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %11 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #7
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %7
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %if.end
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
