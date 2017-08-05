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
  %14 = add nsw i64 %wide.trip.count112, 1
  %15 = add i32 %i.promoted, 1
  %16 = add nsw i64 %wide.trip.count112, 1
  br label %for.cond13.preheader

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv116 = phi i64 [ %6, %for.body.lr.ph ], [ %indvars.iv.next117, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %1, i64 %indvars.iv116
  store double 0.000000e+00, double* %arrayidx, align 8
  %arrayidx3 = getelementptr inbounds double, double* %2, i64 %indvars.iv116
  store double 0.000000e+00, double* %arrayidx3, align 8
  %indvars.iv.next117 = add nsw i64 %indvars.iv116, 1
  %17 = trunc i64 %indvars.iv.next117 to i32
  %conv4 = sitofp i32 %17 to double
  %div = fdiv double %conv4, %3
  %div5 = fmul double %div, 5.000000e-01
  %add6 = fadd double %div5, 4.000000e+00
  %arrayidx8 = getelementptr inbounds double, double* %4, i64 %indvars.iv116
  store double %add6, double* %arrayidx8, align 8
  %cmp = icmp slt i64 %indvars.iv.next117, %7
  br i1 %cmp, label %for.body, label %for.cond9.preheader

for.cond13.preheader:                             ; preds = %for.end39, %for.cond13.preheader.lr.ph
  %indvar142 = phi i32 [ %indvar.next143, %for.end39 ], [ 0, %for.cond13.preheader.lr.ph ]
  %indvars.iv133 = phi i32 [ %indvars.iv.next134, %for.end39 ], [ %i.promoted, %for.cond13.preheader.lr.ph ]
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %for.end39 ], [ %10, %for.cond13.preheader.lr.ph ]
  %18 = add i32 %15, %indvar142
  %19 = sext i32 %18 to i64
  %20 = sub nsw i64 %16, %19
  %21 = add nsw i64 %20, -4
  %22 = lshr i64 %21, 2
  %23 = add nuw nsw i64 %22, 1
  %24 = add i32 %15, %indvar142
  %25 = sext i32 %24 to i64
  %26 = sub nsw i64 %14, %25
  %27 = zext i32 %indvars.iv133 to i64
  %indvars.iv.next134 = add i32 %indvars.iv133, 1
  %28 = sext i32 %indvars.iv.next134 to i64
  %cmp1416 = icmp slt i64 %indvars.iv114, 0
  br i1 %cmp1416, label %for.end27, label %for.body16.preheader

for.body16.preheader:                             ; preds = %for.cond13.preheader
  br label %for.body16

for.body16:                                       ; preds = %for.body16.preheader, %for.body16
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %for.body16 ], [ 0, %for.body16.preheader ]
  %29 = sub nsw i64 0, %indvars.iv101
  %30 = trunc i64 %29 to i32
  %rem = srem i32 %30, %8
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, %conv18
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv114, i64 %indvars.iv101
  store double %add20, double* %arrayidx24, align 8
  %exitcond135 = icmp eq i64 %indvars.iv101, %27
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  br i1 %exitcond135, label %for.end27.loopexit, label %for.body16

for.end27.loopexit:                               ; preds = %for.body16
  br label %for.end27

for.end27:                                        ; preds = %for.end27.loopexit, %for.cond13.preheader
  %indvars.iv.next115 = add nsw i64 %indvars.iv114, 1
  %cmp3018 = icmp slt i64 %indvars.iv.next115, %11
  br i1 %cmp3018, label %for.body32.preheader, label %for.end39

for.body32.preheader:                             ; preds = %for.end27
  %min.iters.check = icmp ult i64 %26, 4
  br i1 %min.iters.check, label %for.body32.preheader215, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body32.preheader
  %n.vec = and i64 %26, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %28, %n.vec
  br i1 %cmp.zero, label %for.body32.preheader215, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter221 = and i64 %23, 3
  %lcmp.mod222 = icmp eq i64 %xtraiter221, 0
  br i1 %lcmp.mod222, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter223 = phi i64 [ %prol.iter223.sub, %vector.body.prol ], [ %xtraiter221, %vector.body.prol.preheader ]
  %31 = add i64 %28, %index.prol
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv114, i64 %31
  %33 = bitcast double* %32 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %33, align 8
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %35, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter223.sub = add i64 %prol.iter223, -1
  %prol.iter223.cmp = icmp eq i64 %prol.iter223.sub, 0
  br i1 %prol.iter223.cmp, label %vector.body.prol.loopexit.loopexit, label %vector.body.prol, !llvm.loop !1

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
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv114, i64 %37
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %39, align 8
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %41, align 8
  %index.next = add i64 %index, 4
  %42 = add i64 %28, %index.next
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv114, i64 %42
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %44, align 8
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %46, align 8
  %index.next.1 = add i64 %index, 8
  %47 = add i64 %28, %index.next.1
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv114, i64 %47
  %49 = bitcast double* %48 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %49, align 8
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %51, align 8
  %index.next.2 = add i64 %index, 12
  %52 = add i64 %28, %index.next.2
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv114, i64 %52
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
  br i1 %cmp.n, label %for.end39, label %for.body32.preheader215

for.body32.preheader215:                          ; preds = %middle.block, %min.iters.checked, %for.body32.preheader
  %indvars.iv110.ph = phi i64 [ %28, %min.iters.checked ], [ %28, %for.body32.preheader ], [ %ind.end, %middle.block ]
  br label %for.body32

for.body32:                                       ; preds = %for.body32.preheader215, %for.body32
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %for.body32 ], [ %indvars.iv110.ph, %for.body32.preheader215 ]
  %arrayidx36 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv114, i64 %indvars.iv110
  store double 0.000000e+00, double* %arrayidx36, align 8
  %exitcond113 = icmp eq i64 %indvars.iv110, %wide.trip.count112
  %indvars.iv.next111 = add nsw i64 %indvars.iv110, 1
  br i1 %exitcond113, label %for.end39.loopexit, label %for.body32, !llvm.loop !6

for.end39.loopexit:                               ; preds = %for.body32
  br label %for.end39

for.end39:                                        ; preds = %for.end39.loopexit, %middle.block, %for.end27
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv114, i64 %indvars.iv114
  store double 1.000000e+00, double* %arrayidx43, align 8
  %cmp10 = icmp slt i64 %indvars.iv.next115, %12
  %indvar.next143 = add i32 %indvar142, 1
  br i1 %cmp10, label %for.cond13.preheader, label %for.cond9.for.end46_crit_edge

for.cond9.for.end46_crit_edge:                    ; preds = %for.end39
  %58 = trunc i64 %indvars.iv.next115 to i32
  store i32 %58, i32* %i, align 4
  br label %for.end46

for.end46:                                        ; preds = %for.cond9.preheader, %for.cond9.preheader.thread, %for.cond9.for.end46_crit_edge
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %59 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %59, align 8
  store i32 0, i32* %r, align 4
  %60 = load i32, i32* %n.addr, align 4
  %cmp4815 = icmp sgt i32 %60, 0
  br i1 %cmp4815, label %for.cond51.preheader.lr.ph, label %for.cond65.preheader.thread

for.cond65.preheader.thread:                      ; preds = %for.end46
  store i32 0, i32* %t, align 4
  store i32 0, i32* %r, align 4
  br label %for.cond99.preheader

for.cond51.preheader.lr.ph:                       ; preds = %for.end46
  %61 = load i32, i32* %n.addr, align 4
  %62 = sext i32 %61 to i64
  %cmp5214 = icmp sgt i32 %61, 0
  %63 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  br i1 %cmp5214, label %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge, label %for.cond65.preheader

for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge: ; preds = %for.cond51.preheader.lr.ph
  %r.promoted66 = load i32, i32* %r, align 4
  %64 = add i32 %61, -1
  %65 = sext i32 %r.promoted66 to i64
  %66 = zext i32 %64 to i64
  %67 = shl nuw nsw i64 %66, 3
  %68 = add nuw nsw i64 %67, 8
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us, %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %for.inc62.us ], [ %65, %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge ]
  %indvar = phi i64 [ %indvar.next, %for.inc62.us ], [ 0, %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge ]
  %69 = add nsw i64 %65, %indvar
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %63, i64 0, i64 %69, i64 0
  %scevgep97 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97, i8 0, i64 %68, i32 8, i1 false)
  %indvars.iv.next99 = add nsw i64 %indvars.iv98, 1
  %cmp48.us = icmp slt i64 %indvars.iv.next99, %62
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %cmp48.us, label %for.inc62.us, label %for.cond65.preheader.loopexit

for.cond65.preheader.loopexit:                    ; preds = %for.inc62.us
  br label %for.cond65.preheader

for.cond65.preheader:                             ; preds = %for.cond65.preheader.loopexit, %for.cond51.preheader.lr.ph
  %inc60.lcssa69.lcssa = phi i32 [ 0, %for.cond51.preheader.lr.ph ], [ %61, %for.cond65.preheader.loopexit ]
  store i32 %inc60.lcssa69.lcssa, i32* %s, align 4
  %.pr124 = load i32, i32* %n.addr, align 4
  store i32 0, i32* %t, align 4
  %cmp6613 = icmp sgt i32 %.pr124, 0
  store i32 0, i32* %r, align 4
  br i1 %cmp6613, label %for.cond69.preheader.lr.ph, label %for.cond99.preheader

for.cond69.preheader.lr.ph:                       ; preds = %for.cond65.preheader
  %70 = load i32, i32* %n.addr, align 4
  %71 = sext i32 %70 to i64
  %cmp7411 = icmp sgt i32 %70, 0
  %72 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %73 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %r.promoted33 = load i32, i32* %r, align 4
  %t.promoted = load i32, i32* %t, align 4
  %74 = sext i32 %t.promoted to i64
  %s.promoted = load i32, i32* %s, align 4
  br i1 %cmp7411, label %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge, label %for.cond69.preheader.preheader

for.cond69.preheader.preheader:                   ; preds = %for.cond69.preheader.lr.ph
  br label %for.cond69.preheader

for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge: ; preds = %for.cond69.preheader.lr.ph
  %75 = add i32 %70, -1
  %76 = zext i32 %75 to i64
  %77 = add nuw nsw i64 %76, 1
  %78 = add nsw i64 %74, 1
  %79 = add nuw nsw i64 %76, 1
  %min.iters.check148 = icmp ult i64 %77, 4
  %n.vec151 = and i64 %77, 8589934588
  %cmp.zero152 = icmp eq i64 %n.vec151, 0
  %cmp.n174 = icmp eq i64 %77, %n.vec151
  br label %for.cond69.preheader.us

for.cond69.preheader.us:                          ; preds = %for.inc96.us, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge
  %indvar160 = phi i64 [ %indvar.next161, %for.inc96.us ], [ 0, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %for.inc96.us ], [ %74, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %inc91.lcssa32.lcssa36.us = phi i32 [ %inc91.lcssa32.lcssa37.us, %for.inc96.us ], [ %s.promoted, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %inc94.lcssa34.us = phi i32 [ 0, %for.inc96.us ], [ %r.promoted33, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %80 = add i64 %74, %indvar160
  %scevgep162 = getelementptr [2000 x double], [2000 x double]* %72, i64 0, i64 %80
  %81 = add i64 %78, %indvar160
  %scevgep164 = getelementptr [2000 x double], [2000 x double]* %72, i64 %76, i64 %81
  %cmp7012.us = icmp slt i32 %inc94.lcssa34.us, %70
  br i1 %cmp7012.us, label %for.cond73.preheader.lr.ph.us, label %for.inc96.us

for.cond73.preheader.lr.ph.us:                    ; preds = %for.cond69.preheader.us
  %82 = sext i32 %inc94.lcssa34.us to i64
  br label %for.cond73.preheader.us.us

for.inc96.us.loopexit:                            ; preds = %for.inc93.us.us
  br label %for.inc96.us

for.inc96.us:                                     ; preds = %for.inc96.us.loopexit, %for.cond69.preheader.us
  %inc91.lcssa32.lcssa37.us = phi i32 [ %inc91.lcssa32.lcssa36.us, %for.cond69.preheader.us ], [ %70, %for.inc96.us.loopexit ]
  %indvars.iv.next91 = add nsw i64 %indvars.iv90, 1
  %cmp66.us = icmp slt i64 %indvars.iv.next91, %71
  %indvar.next161 = add i64 %indvar160, 1
  br i1 %cmp66.us, label %for.cond69.preheader.us, label %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge

for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge: ; preds = %for.inc96.us
  %83 = trunc i64 %indvars.iv.next91 to i32
  br label %for.cond65.for.cond99.preheader_crit_edge

for.cond73.preheader.us.us:                       ; preds = %for.inc93.us.us, %for.cond73.preheader.lr.ph.us
  %indvar154 = phi i64 [ %indvar.next155, %for.inc93.us.us ], [ 0, %for.cond73.preheader.lr.ph.us ]
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %for.inc93.us.us ], [ %82, %for.cond73.preheader.lr.ph.us ]
  %84 = add i64 %82, %indvar154
  %scevgep156 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %84, i64 0
  %scevgep158 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %84, i64 %77
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 %indvars.iv88, i64 %indvars.iv90
  br i1 %min.iters.check148, label %for.body76.us.us.preheader, label %min.iters.checked149

for.body76.us.us.preheader:                       ; preds = %middle.block146, %vector.memcheck, %min.iters.checked149, %for.cond73.preheader.us.us
  %indvars.iv84.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked149 ], [ 0, %for.cond73.preheader.us.us ], [ %n.vec151, %middle.block146 ]
  %85 = sub nsw i64 %79, %indvars.iv84.ph
  %xtraiter219 = and i64 %85, 1
  %lcmp.mod220 = icmp eq i64 %xtraiter219, 0
  br i1 %lcmp.mod220, label %for.body76.us.us.prol.loopexit, label %for.body76.us.us.prol

for.body76.us.us.prol:                            ; preds = %for.body76.us.us.preheader
  %86 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 %indvars.iv84.ph, i64 %indvars.iv90
  %87 = load double, double* %arrayidx84.us.us.prol, align 8
  %mul.us.us.prol = fmul double %86, %87
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv88, i64 %indvars.iv84.ph
  %88 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %mul.us.us.prol, %88
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  %indvars.iv.next85.prol = or i64 %indvars.iv84.ph, 1
  br label %for.body76.us.us.prol.loopexit

for.body76.us.us.prol.loopexit:                   ; preds = %for.body76.us.us.prol, %for.body76.us.us.preheader
  %indvars.iv84.unr.ph = phi i64 [ %indvars.iv.next85.prol, %for.body76.us.us.prol ], [ %indvars.iv84.ph, %for.body76.us.us.preheader ]
  %89 = icmp eq i64 %76, %indvars.iv84.ph
  br i1 %89, label %for.inc93.us.us, label %for.body76.us.us.preheader.new

for.body76.us.us.preheader.new:                   ; preds = %for.body76.us.us.prol.loopexit
  br label %for.body76.us.us

min.iters.checked149:                             ; preds = %for.cond73.preheader.us.us
  br i1 %cmp.zero152, label %for.body76.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked149
  %bound0 = icmp ult double* %scevgep156, %scevgep164
  %bound1 = icmp ult double* %scevgep162, %scevgep158
  %found.conflict = and i1 %bound0, %bound1
  %bound0167 = icmp ult double* %scevgep156, %arrayidx80.us.us
  %bound1168 = icmp ult double* %arrayidx80.us.us, %scevgep158
  %found.conflict169 = and i1 %bound0167, %bound1168
  %conflict.rdx = or i1 %found.conflict, %found.conflict169
  br i1 %conflict.rdx, label %for.body76.us.us.preheader, label %vector.body145.preheader

vector.body145.preheader:                         ; preds = %vector.memcheck
  %90 = load double, double* %arrayidx80.us.us, align 8, !alias.scope !8
  %91 = insertelement <2 x double> undef, double %90, i32 0
  %92 = shufflevector <2 x double> %91, <2 x double> undef, <2 x i32> zeroinitializer
  %93 = insertelement <2 x double> undef, double %90, i32 0
  %94 = shufflevector <2 x double> %93, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body145

vector.body145:                                   ; preds = %vector.body145.preheader, %vector.body145
  %index171 = phi i64 [ %index.next172, %vector.body145 ], [ 0, %vector.body145.preheader ]
  %95 = or i64 %index171, 1
  %96 = or i64 %index171, 2
  %97 = or i64 %index171, 3
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 %index171, i64 %indvars.iv90
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 %95, i64 %indvars.iv90
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 %96, i64 %indvars.iv90
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 %97, i64 %indvars.iv90
  %102 = load double, double* %98, align 8, !alias.scope !11
  %103 = load double, double* %99, align 8, !alias.scope !11
  %104 = load double, double* %100, align 8, !alias.scope !11
  %105 = load double, double* %101, align 8, !alias.scope !11
  %106 = insertelement <2 x double> undef, double %102, i32 0
  %107 = insertelement <2 x double> %106, double %103, i32 1
  %108 = insertelement <2 x double> undef, double %104, i32 0
  %109 = insertelement <2 x double> %108, double %105, i32 1
  %110 = fmul <2 x double> %92, %107
  %111 = fmul <2 x double> %94, %109
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv88, i64 %index171
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !13, !noalias !15
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load179 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !13, !noalias !15
  %116 = fadd <2 x double> %110, %wide.load
  %117 = fadd <2 x double> %111, %wide.load179
  %118 = bitcast double* %112 to <2 x double>*
  store <2 x double> %116, <2 x double>* %118, align 8, !alias.scope !13, !noalias !15
  %119 = bitcast double* %114 to <2 x double>*
  store <2 x double> %117, <2 x double>* %119, align 8, !alias.scope !13, !noalias !15
  %index.next172 = add i64 %index171, 4
  %120 = icmp eq i64 %index.next172, %n.vec151
  br i1 %120, label %middle.block146, label %vector.body145, !llvm.loop !16

middle.block146:                                  ; preds = %vector.body145
  br i1 %cmp.n174, label %for.inc93.us.us, label %for.body76.us.us.preheader

for.inc93.us.us.loopexit:                         ; preds = %for.body76.us.us
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit, %for.body76.us.us.prol.loopexit, %middle.block146
  %indvars.iv.next89 = add nsw i64 %indvars.iv88, 1
  %exitcond130 = icmp eq i64 %indvars.iv.next89, %71
  %indvar.next155 = add i64 %indvar154, 1
  br i1 %exitcond130, label %for.inc96.us.loopexit, label %for.cond73.preheader.us.us

for.body76.us.us:                                 ; preds = %for.body76.us.us, %for.body76.us.us.preheader.new
  %indvars.iv84 = phi i64 [ %indvars.iv84.unr.ph, %for.body76.us.us.preheader.new ], [ %indvars.iv.next85.1, %for.body76.us.us ]
  %121 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 %indvars.iv84, i64 %indvars.iv90
  %122 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %121, %122
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv88, i64 %indvars.iv84
  %123 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %mul.us.us, %123
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %124 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 %indvars.iv.next85, i64 %indvars.iv90
  %125 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %124, %125
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv88, i64 %indvars.iv.next85
  %126 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %mul.us.us.1, %126
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next85, %76
  %indvars.iv.next85.1 = add nsw i64 %indvars.iv84, 2
  br i1 %exitcond.1, label %for.inc93.us.us.loopexit, label %for.body76.us.us, !llvm.loop !17

for.cond69.preheader:                             ; preds = %for.cond69.preheader.preheader, %for.cond69.preheader
  %inc91.lcssa32.lcssa36 = phi i32 [ %.inc91.lcssa32.lcssa36, %for.cond69.preheader ], [ %s.promoted, %for.cond69.preheader.preheader ]
  %inc9735 = phi i32 [ %inc97, %for.cond69.preheader ], [ %t.promoted, %for.cond69.preheader.preheader ]
  %inc94.lcssa34 = phi i32 [ 0, %for.cond69.preheader ], [ %r.promoted33, %for.cond69.preheader.preheader ]
  %cmp7012 = icmp slt i32 %inc94.lcssa34, %70
  %.inc91.lcssa32.lcssa36 = select i1 %cmp7012, i32 0, i32 %inc91.lcssa32.lcssa36
  %inc97 = add nsw i32 %inc9735, 1
  %cmp66 = icmp slt i32 %inc97, %70
  br i1 %cmp66, label %for.cond69.preheader, label %for.cond65.for.cond99.preheader_crit_edge.loopexit

for.cond65.for.cond99.preheader_crit_edge.loopexit: ; preds = %for.cond69.preheader
  br label %for.cond65.for.cond99.preheader_crit_edge

for.cond65.for.cond99.preheader_crit_edge:        ; preds = %for.cond65.for.cond99.preheader_crit_edge.loopexit, %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge
  %inc91.lcssa32.lcssa37.lcssa = phi i32 [ %inc91.lcssa32.lcssa37.us, %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge ], [ %.inc91.lcssa32.lcssa36, %for.cond65.for.cond99.preheader_crit_edge.loopexit ]
  %inc97.lcssa = phi i32 [ %83, %for.inc96.us.for.cond65.for.cond99.preheader_crit_edge_crit_edge ], [ %inc97, %for.cond65.for.cond99.preheader_crit_edge.loopexit ]
  store i32 0, i32* %r, align 4
  store i32 %inc97.lcssa, i32* %t, align 4
  store i32 %inc91.lcssa32.lcssa37.lcssa, i32* %s, align 4
  br label %for.cond99.preheader

for.cond99.preheader:                             ; preds = %for.cond65.preheader, %for.cond65.preheader.thread, %for.cond65.for.cond99.preheader_crit_edge
  %127 = load i32, i32* %r, align 4
  %128 = load i32, i32* %n.addr, align 4
  %cmp10010 = icmp slt i32 %127, %128
  br i1 %cmp10010, label %for.cond103.preheader.lr.ph, label %for.end120

for.cond103.preheader.lr.ph:                      ; preds = %for.cond99.preheader
  %129 = load i32, i32* %n.addr, align 4
  %130 = sext i32 %129 to i64
  %cmp1049 = icmp sgt i32 %129, 0
  %131 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %132 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %r.promoted = load i32, i32* %r, align 4
  %133 = sext i32 %r.promoted to i64
  br i1 %cmp1049, label %for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge, label %for.cond103.preheader.for.cond99.for.end120_crit_edge_crit_edge

for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge: ; preds = %for.cond103.preheader.lr.ph
  %134 = add i32 %129, -1
  %135 = zext i32 %134 to i64
  %136 = add nuw nsw i64 %135, 1
  %137 = and i64 %136, 8589934588
  %138 = add nsw i64 %137, -4
  %139 = lshr exact i64 %138, 2
  %140 = add nuw nsw i64 %135, 1
  %min.iters.check183 = icmp ult i64 %136, 4
  %n.vec186 = and i64 %136, 8589934588
  %cmp.zero187 = icmp eq i64 %n.vec186, 0
  %141 = and i64 %139, 1
  %lcmp.mod = icmp eq i64 %141, 0
  %142 = icmp eq i64 %139, 0
  %cmp.n208 = icmp eq i64 %136, %n.vec186
  br label %for.cond103.preheader.us

for.cond103.preheader.us:                         ; preds = %for.inc118.us, %for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge
  %indvar189 = phi i64 [ %indvar.next190, %for.inc118.us ], [ 0, %for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge ]
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %for.inc118.us ], [ %133, %for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge ]
  %143 = add i64 %133, %indvar189
  %scevgep191 = getelementptr [2000 x double], [2000 x double]* %132, i64 %143, i64 0
  %scevgep193 = getelementptr [2000 x double], [2000 x double]* %132, i64 %143, i64 %136
  %scevgep195 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %143, i64 0
  %scevgep197 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %143, i64 %136
  br i1 %min.iters.check183, label %for.body106.us.preheader, label %min.iters.checked184

min.iters.checked184:                             ; preds = %for.cond103.preheader.us
  br i1 %cmp.zero187, label %for.body106.us.preheader, label %vector.memcheck203

vector.memcheck203:                               ; preds = %min.iters.checked184
  %bound0199 = icmp ult double* %scevgep191, %scevgep197
  %bound1200 = icmp ult double* %scevgep195, %scevgep193
  %memcheck.conflict202 = and i1 %bound0199, %bound1200
  br i1 %memcheck.conflict202, label %for.body106.us.preheader, label %vector.body180.preheader

vector.body180.preheader:                         ; preds = %vector.memcheck203
  br i1 %lcmp.mod, label %vector.body180.prol, label %vector.body180.prol.loopexit

vector.body180.prol:                              ; preds = %vector.body180.preheader
  %144 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv82, i64 0
  %145 = bitcast double* %144 to <2 x i64>*
  %wide.load213.prol = load <2 x i64>, <2 x i64>* %145, align 8, !alias.scope !18
  %146 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv82, i64 2
  %147 = bitcast double* %146 to <2 x i64>*
  %wide.load214.prol = load <2 x i64>, <2 x i64>* %147, align 8, !alias.scope !18
  %148 = getelementptr inbounds [2000 x double], [2000 x double]* %132, i64 %indvars.iv82, i64 0
  %149 = bitcast double* %148 to <2 x i64>*
  store <2 x i64> %wide.load213.prol, <2 x i64>* %149, align 8, !alias.scope !21, !noalias !18
  %150 = getelementptr [2000 x double], [2000 x double]* %132, i64 %indvars.iv82, i64 2
  %151 = bitcast double* %150 to <2 x i64>*
  store <2 x i64> %wide.load214.prol, <2 x i64>* %151, align 8, !alias.scope !21, !noalias !18
  br label %vector.body180.prol.loopexit

vector.body180.prol.loopexit:                     ; preds = %vector.body180.prol, %vector.body180.preheader
  %index205.unr.ph = phi i64 [ 4, %vector.body180.prol ], [ 0, %vector.body180.preheader ]
  br i1 %142, label %middle.block181, label %vector.body180.preheader.new

vector.body180.preheader.new:                     ; preds = %vector.body180.prol.loopexit
  br label %vector.body180

vector.body180:                                   ; preds = %vector.body180, %vector.body180.preheader.new
  %index205 = phi i64 [ %index205.unr.ph, %vector.body180.preheader.new ], [ %index.next206.1, %vector.body180 ]
  %152 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv82, i64 %index205
  %153 = bitcast double* %152 to <2 x i64>*
  %wide.load213 = load <2 x i64>, <2 x i64>* %153, align 8, !alias.scope !18
  %154 = getelementptr double, double* %152, i64 2
  %155 = bitcast double* %154 to <2 x i64>*
  %wide.load214 = load <2 x i64>, <2 x i64>* %155, align 8, !alias.scope !18
  %156 = getelementptr inbounds [2000 x double], [2000 x double]* %132, i64 %indvars.iv82, i64 %index205
  %157 = bitcast double* %156 to <2 x i64>*
  store <2 x i64> %wide.load213, <2 x i64>* %157, align 8, !alias.scope !21, !noalias !18
  %158 = getelementptr double, double* %156, i64 2
  %159 = bitcast double* %158 to <2 x i64>*
  store <2 x i64> %wide.load214, <2 x i64>* %159, align 8, !alias.scope !21, !noalias !18
  %index.next206 = add i64 %index205, 4
  %160 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv82, i64 %index.next206
  %161 = bitcast double* %160 to <2 x i64>*
  %wide.load213.1 = load <2 x i64>, <2 x i64>* %161, align 8, !alias.scope !18
  %162 = getelementptr double, double* %160, i64 2
  %163 = bitcast double* %162 to <2 x i64>*
  %wide.load214.1 = load <2 x i64>, <2 x i64>* %163, align 8, !alias.scope !18
  %164 = getelementptr inbounds [2000 x double], [2000 x double]* %132, i64 %indvars.iv82, i64 %index.next206
  %165 = bitcast double* %164 to <2 x i64>*
  store <2 x i64> %wide.load213.1, <2 x i64>* %165, align 8, !alias.scope !21, !noalias !18
  %166 = getelementptr double, double* %164, i64 2
  %167 = bitcast double* %166 to <2 x i64>*
  store <2 x i64> %wide.load214.1, <2 x i64>* %167, align 8, !alias.scope !21, !noalias !18
  %index.next206.1 = add i64 %index205, 8
  %168 = icmp eq i64 %index.next206.1, %n.vec186
  br i1 %168, label %middle.block181.loopexit, label %vector.body180, !llvm.loop !23

middle.block181.loopexit:                         ; preds = %vector.body180
  br label %middle.block181

middle.block181:                                  ; preds = %middle.block181.loopexit, %vector.body180.prol.loopexit
  br i1 %cmp.n208, label %for.inc118.us, label %for.body106.us.preheader

for.body106.us.preheader:                         ; preds = %middle.block181, %vector.memcheck203, %min.iters.checked184, %for.cond103.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck203 ], [ 0, %min.iters.checked184 ], [ 0, %for.cond103.preheader.us ], [ %n.vec186, %middle.block181 ]
  %169 = sub nsw i64 %140, %indvars.iv.ph
  %170 = sub nsw i64 %135, %indvars.iv.ph
  %xtraiter217 = and i64 %169, 3
  %lcmp.mod218 = icmp eq i64 %xtraiter217, 0
  br i1 %lcmp.mod218, label %for.body106.us.prol.loopexit, label %for.body106.us.prol.preheader

for.body106.us.prol.preheader:                    ; preds = %for.body106.us.preheader
  br label %for.body106.us.prol

for.body106.us.prol:                              ; preds = %for.body106.us.prol, %for.body106.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body106.us.prol ], [ %indvars.iv.ph, %for.body106.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body106.us.prol ], [ %xtraiter217, %for.body106.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv82, i64 %indvars.iv.prol
  %171 = bitcast double* %arrayidx110.us.prol to i64*
  %172 = load i64, i64* %171, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %132, i64 %indvars.iv82, i64 %indvars.iv.prol
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
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv82, i64 %indvars.iv
  %175 = bitcast double* %arrayidx110.us to i64*
  %176 = load i64, i64* %175, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %132, i64 %indvars.iv82, i64 %indvars.iv
  %177 = bitcast double* %arrayidx114.us to i64*
  store i64 %176, i64* %177, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next
  %178 = bitcast double* %arrayidx110.us.1 to i64*
  %179 = load i64, i64* %178, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %132, i64 %indvars.iv82, i64 %indvars.iv.next
  %180 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %179, i64* %180, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next.1
  %181 = bitcast double* %arrayidx110.us.2 to i64*
  %182 = load i64, i64* %181, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %132, i64 %indvars.iv82, i64 %indvars.iv.next.1
  %183 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %182, i64* %183, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %131, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next.2
  %184 = bitcast double* %arrayidx110.us.3 to i64*
  %185 = load i64, i64* %184, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %132, i64 %indvars.iv82, i64 %indvars.iv.next.2
  %186 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %185, i64* %186, align 8
  %exitcond128.3 = icmp eq i64 %indvars.iv.next.2, %135
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond128.3, label %for.inc118.us.loopexit, label %for.body106.us, !llvm.loop !25

for.inc118.us.loopexit:                           ; preds = %for.body106.us
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit, %for.body106.us.prol.loopexit, %middle.block181
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, 1
  %cmp100.us = icmp slt i64 %indvars.iv.next83, %130
  %indvar.next190 = add i64 %indvar189, 1
  br i1 %cmp100.us, label %for.cond103.preheader.us, label %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge

for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge: ; preds = %for.inc118.us
  %187 = trunc i64 %indvars.iv.next83 to i32
  br label %for.cond99.for.end120_crit_edge

for.cond103.preheader.for.cond99.for.end120_crit_edge_crit_edge: ; preds = %for.cond103.preheader.lr.ph
  %188 = add i32 %r.promoted, 1
  %189 = icmp sgt i32 %129, %188
  %smax = select i1 %189, i32 %129, i32 %188
  br label %for.cond99.for.end120_crit_edge

for.cond99.for.end120_crit_edge:                  ; preds = %for.cond103.preheader.for.cond99.for.end120_crit_edge_crit_edge, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge
  %inc116.lcssa27.lcssa = phi i32 [ %129, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge ], [ 0, %for.cond103.preheader.for.cond99.for.end120_crit_edge_crit_edge ]
  %inc119.lcssa = phi i32 [ %187, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge ], [ %smax, %for.cond103.preheader.for.cond99.for.end120_crit_edge_crit_edge ]
  store i32 %inc119.lcssa, i32* %r, align 4
  store i32 %inc116.lcssa27.lcssa, i32* %s, align 4
  br label %for.end120

for.end120:                                       ; preds = %for.cond99.preheader, %for.cond99.for.end120_crit_edge
  %190 = bitcast [2000 x [2000 x double]]** %B to i8**
  %191 = load i8*, i8** %190, align 8
  tail call void @free(i8* %191) #4
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
  %11 = bitcast double* %w to i64*
  %12 = bitcast double* %w to i64*
  %13 = bitcast double* %w to i64*
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %for.cond1.preheader.lr.ph
  %indvar112 = phi i64 [ %indvar.next113, %for.inc58 ], [ 0, %for.cond1.preheader.lr.ph ]
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %for.inc58 ], [ %2, %for.cond1.preheader.lr.ph ]
  %indvars.iv98 = phi i32 [ %indvars.iv.next99, %for.inc58 ], [ %4, %for.cond1.preheader.lr.ph ]
  %inc49.lcssa40.lcssa45 = phi i32 [ %inc49.lcssa40.lcssa46, %for.inc58 ], [ %k.promoted, %for.cond1.preheader.lr.ph ]
  %14 = add i64 %10, %indvar112
  %15 = and i64 %14, 4294967295
  %16 = sub i64 %8, %indvar112
  %17 = sub i64 %9, %indvar112
  %18 = zext i32 %indvars.iv98 to i64
  %19 = add i32 %indvars.iv98, 1
  %cmp216 = icmp sgt i64 %indvars.iv102, 0
  br i1 %cmp216, label %for.body3.preheader, label %for.end27

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 0
  br label %for.body3

for.cond.for.cond61.preheader_crit_edge:          ; preds = %for.inc58
  %20 = trunc i64 %indvars.iv.next103 to i32
  store i32 %20, i32* %i, align 4
  store i32 %inc49.lcssa40.lcssa46, i32* %k, align 4
  br label %for.cond61.preheader

for.cond61.preheader:                             ; preds = %entry, %for.cond.for.cond61.preheader_crit_edge
  store i32 0, i32* %i, align 4
  %21 = load i32, i32* %n.addr, align 4
  %cmp6214 = icmp sgt i32 %21, 0
  br i1 %cmp6214, label %for.body63.lr.ph, label %for.end84.thread

for.end84.thread:                                 ; preds = %for.cond61.preheader
  %storemerge21189 = add nsw i32 %21, -1
  store i32 %storemerge21189, i32* %i, align 4
  br label %for.end113

for.body63.lr.ph:                                 ; preds = %for.cond61.preheader
  %22 = load double*, double** %b.addr, align 8
  %23 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %24 = load double*, double** %y.addr, align 8
  %25 = load i32, i32* %n.addr, align 4
  %i.promoted28 = load i32, i32* %i, align 4
  %26 = add i32 %i.promoted28, -1
  %27 = sext i32 %i.promoted28 to i64
  %28 = sext i32 %25 to i64
  %29 = bitcast double* %w to i64*
  %30 = bitcast double* %w to i64*
  br label %for.body63

for.body3:                                        ; preds = %for.body3.preheader, %for.end
  %indvars.iv95 = phi i32 [ %indvars.iv.next96, %for.end ], [ -1, %for.body3.preheader ]
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.end ], [ 0, %for.body3.preheader ]
  %31 = add i64 %indvars.iv68, 4294967295
  %32 = and i64 %31, 4294967295
  %33 = zext i32 %indvars.iv95 to i64
  %34 = add i32 %indvars.iv95, 1
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv68
  %35 = bitcast double* %arrayidx5 to i64*
  %36 = load i64, i64* %35, align 8
  store i64 %36, i64* %11, align 8
  %cmp715 = icmp sgt i64 %indvars.iv68, 0
  br i1 %cmp715, label %for.body8.lr.ph, label %for.end

for.body8.lr.ph:                                  ; preds = %for.body3
  %w.promoted32 = load double, double* %w, align 8
  %37 = and i64 %31, 1
  %lcmp.mod111 = icmp eq i64 %37, 0
  br i1 %lcmp.mod111, label %for.body8.prol, label %for.body8.prol.loopexit

for.body8.prol:                                   ; preds = %for.body8.lr.ph
  %38 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv68
  %39 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %38, %39
  %sub.prol = fsub double %w.promoted32, %mul.prol
  br label %for.body8.prol.loopexit

for.body8.prol.loopexit:                          ; preds = %for.body8.prol, %for.body8.lr.ph
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ undef, %for.body8.lr.ph ]
  %indvars.iv62.unr.ph = phi i64 [ 1, %for.body8.prol ], [ 0, %for.body8.lr.ph ]
  %sub33.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ %w.promoted32, %for.body8.lr.ph ]
  %40 = icmp eq i64 %32, 0
  br i1 %40, label %for.cond6.for.end_crit_edge, label %for.body8.lr.ph.new

for.body8.lr.ph.new:                              ; preds = %for.body8.prol.loopexit
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.body8.lr.ph.new
  %indvars.iv62 = phi i64 [ %indvars.iv62.unr.ph, %for.body8.lr.ph.new ], [ %indvars.iv.next63.1, %for.body8 ]
  %sub33 = phi double [ %sub33.unr.ph, %for.body8.lr.ph.new ], [ %sub.1, %for.body8 ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv62
  %41 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv62, i64 %indvars.iv68
  %42 = load double, double* %arrayidx16, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %43 = load <2 x double>, <2 x double>* %41, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next63, i64 %indvars.iv68
  %44 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %42, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %44, i32 1
  %mul = fmul <2 x double> %43, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %sub33, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %exitcond97.1 = icmp eq i64 %indvars.iv.next63, %33
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  br i1 %exitcond97.1, label %for.cond6.for.end_crit_edge.loopexit, label %for.body8

for.cond6.for.end_crit_edge.loopexit:             ; preds = %for.body8
  br label %for.cond6.for.end_crit_edge

for.cond6.for.end_crit_edge:                      ; preds = %for.cond6.for.end_crit_edge.loopexit, %for.body8.prol.loopexit
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.body8.prol.loopexit ], [ %sub.1, %for.cond6.for.end_crit_edge.loopexit ]
  store double %sub.lcssa, double* %w, align 8
  br label %for.end

for.end:                                          ; preds = %for.body3, %for.cond6.for.end_crit_edge
  %inc.lcssa35 = phi i32 [ %34, %for.cond6.for.end_crit_edge ], [ 0, %for.body3 ]
  %45 = load double, double* %w, align 8
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv68
  %46 = load double, double* %arrayidx20, align 8
  %div = fdiv double %45, %46
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv68
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %indvars.iv.next96 = add i32 %indvars.iv95, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next69, %indvars.iv102
  br i1 %exitcond104, label %for.end27.loopexit, label %for.body3

for.end27.loopexit:                               ; preds = %for.end
  br label %for.end27

for.end27:                                        ; preds = %for.end27.loopexit, %for.cond1.preheader
  %inc49.lcssa40.lcssa44 = phi i32 [ %inc49.lcssa40.lcssa45, %for.cond1.preheader ], [ %inc.lcssa35, %for.end27.loopexit ]
  %cmp2918 = icmp slt i64 %indvars.iv102, %6
  br i1 %cmp2918, label %for.body30.lr.ph, label %for.inc58

for.body30.lr.ph:                                 ; preds = %for.end27
  %cmp3617 = icmp sgt i64 %indvars.iv102, 0
  br i1 %cmp3617, label %for.body30.us.preheader, label %for.body30.preheader

for.body30.preheader:                             ; preds = %for.body30.lr.ph
  %xtraiter114 = and i64 %16, 3
  %lcmp.mod115 = icmp eq i64 %xtraiter114, 0
  br i1 %lcmp.mod115, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.preheader
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol, %for.body30.prol.preheader
  %indvars.iv72.prol = phi i64 [ %indvars.iv.next73.prol, %for.body30.prol ], [ %indvars.iv102, %for.body30.prol.preheader ]
  %prol.iter116 = phi i64 [ %prol.iter116.sub, %for.body30.prol ], [ %xtraiter114, %for.body30.prol.preheader ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv72.prol
  %47 = bitcast double* %arrayidx34.prol to i64*
  %48 = load i64, i64* %47, align 8
  %arrayidx54.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv72.prol
  %49 = bitcast double* %arrayidx54.prol to i64*
  store i64 %48, i64* %49, align 8
  %indvars.iv.next73.prol = add i64 %indvars.iv72.prol, 1
  %prol.iter116.sub = add i64 %prol.iter116, -1
  %prol.iter116.cmp = icmp eq i64 %prol.iter116.sub, 0
  br i1 %prol.iter116.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !26

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.preheader
  %.lcssa.unr = phi i64 [ undef, %for.body30.preheader ], [ %48, %for.body30.prol.loopexit.loopexit ]
  %indvars.iv72.unr = phi i64 [ %indvars.iv102, %for.body30.preheader ], [ %indvars.iv.next73.prol, %for.body30.prol.loopexit.loopexit ]
  %50 = icmp ult i64 %17, 3
  br i1 %50, label %for.inc58.loopexit91, label %for.body30.preheader.new

for.body30.preheader.new:                         ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %51 = and i64 %14, 1
  %lcmp.mod118 = icmp eq i64 %51, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 0
  %52 = icmp eq i64 %15, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond35.for.end50_crit_edge.us
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %for.cond35.for.end50_crit_edge.us ], [ %indvars.iv102, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv85
  %53 = bitcast double* %arrayidx34.us to i64*
  %54 = load i64, i64* %53, align 8
  store i64 %54, i64* %12, align 8
  %w.promoted37.us.cast = bitcast i64 %54 to double
  br i1 %lcmp.mod118, label %for.body37.us.prol, label %for.body37.us.prol.loopexit

for.body37.us.prol:                               ; preds = %for.body30.us
  %55 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv85
  %56 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %55, %56
  %sub47.us.prol = fsub double %w.promoted37.us.cast, %mul46.us.prol
  br label %for.body37.us.prol.loopexit

for.body37.us.prol.loopexit:                      ; preds = %for.body37.us.prol, %for.body30.us
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ undef, %for.body30.us ]
  %indvars.iv77.unr.ph = phi i64 [ 1, %for.body37.us.prol ], [ 0, %for.body30.us ]
  %sub4738.us.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ %w.promoted37.us.cast, %for.body30.us ]
  br i1 %52, label %for.cond35.for.end50_crit_edge.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.body37.us.prol.loopexit
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us, %for.body30.us.new
  %indvars.iv77 = phi i64 [ %indvars.iv77.unr.ph, %for.body30.us.new ], [ %indvars.iv.next78.1, %for.body37.us ]
  %sub4738.us = phi double [ %sub4738.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.body37.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv77
  %57 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv77, i64 %indvars.iv85
  %58 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %59 = load <2 x double>, <2 x double>* %57, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next78, i64 %indvars.iv85
  %60 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %58, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %60, i32 1
  %mul46.us = fmul <2 x double> %59, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %sub4738.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %exitcond100.1 = icmp eq i64 %indvars.iv.next78, %18
  %indvars.iv.next78.1 = add nsw i64 %indvars.iv77, 2
  br i1 %exitcond100.1, label %for.cond35.for.end50_crit_edge.us.loopexit, label %for.body37.us

for.cond35.for.end50_crit_edge.us.loopexit:       ; preds = %for.body37.us
  br label %for.cond35.for.end50_crit_edge.us

for.cond35.for.end50_crit_edge.us:                ; preds = %for.cond35.for.end50_crit_edge.us.loopexit, %for.body37.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.body37.us.prol.loopexit ], [ %sub47.us.1, %for.cond35.for.end50_crit_edge.us.loopexit ]
  store double %sub47.us.lcssa, double* %w, align 8
  %arrayidx54.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv85
  store double %sub47.us.lcssa, double* %arrayidx54.us, align 8
  %indvars.iv.next86 = add i64 %indvars.iv85, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next86, %6
  br i1 %exitcond101, label %for.inc58.loopexit, label %for.body30.us

for.body30:                                       ; preds = %for.body30, %for.body30.preheader.new
  %indvars.iv72 = phi i64 [ %indvars.iv72.unr, %for.body30.preheader.new ], [ %indvars.iv.next73.3, %for.body30 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv72
  %61 = bitcast double* %arrayidx34 to i64*
  %62 = bitcast i64* %61 to <2 x i64>*
  %arrayidx54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv72
  %63 = bitcast double* %arrayidx54 to i64*
  %64 = load <2 x i64>, <2 x i64>* %62, align 8
  %65 = bitcast i64* %63 to <2 x i64>*
  store <2 x i64> %64, <2 x i64>* %65, align 8
  %indvars.iv.next73.1 = add i64 %indvars.iv72, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv.next73.1
  %66 = bitcast double* %arrayidx34.2 to i64*
  %67 = bitcast i64* %66 to <2 x i64>*
  %arrayidx54.2 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv.next73.1
  %68 = bitcast double* %arrayidx54.2 to i64*
  %indvars.iv.next73.2 = add i64 %indvars.iv72, 3
  %69 = load <2 x i64>, <2 x i64>* %67, align 8
  %70 = bitcast i64* %68 to <2 x i64>*
  store <2 x i64> %69, <2 x i64>* %70, align 8
  %exitcond75.3 = icmp eq i64 %indvars.iv.next73.2, %wide.trip.count74
  %indvars.iv.next73.3 = add i64 %indvars.iv72, 4
  br i1 %exitcond75.3, label %for.inc58.loopexit91.loopexit, label %for.body30

for.inc58.loopexit91.loopexit:                    ; preds = %for.body30
  %71 = extractelement <2 x i64> %69, i32 1
  br label %for.inc58.loopexit91

for.inc58.loopexit91:                             ; preds = %for.inc58.loopexit91.loopexit, %for.body30.prol.loopexit
  %.lcssa = phi i64 [ %.lcssa.unr, %for.body30.prol.loopexit ], [ %71, %for.inc58.loopexit91.loopexit ]
  store i64 %.lcssa, i64* %13, align 8
  br label %for.inc58

for.inc58.loopexit:                               ; preds = %for.cond35.for.end50_crit_edge.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.inc58.loopexit91, %for.end27
  %inc49.lcssa40.lcssa46 = phi i32 [ %inc49.lcssa40.lcssa44, %for.end27 ], [ 0, %for.inc58.loopexit91 ], [ %19, %for.inc58.loopexit ]
  %indvars.iv.next103 = add nsw i64 %indvars.iv102, 1
  %cmp = icmp slt i64 %indvars.iv.next103, %5
  %indvars.iv.next99 = add i32 %indvars.iv98, 1
  %indvar.next113 = add i64 %indvar112, 1
  br i1 %cmp, label %for.cond1.preheader, label %for.cond.for.cond61.preheader_crit_edge

for.body63:                                       ; preds = %for.end79, %for.body63.lr.ph
  %indvar105 = phi i32 [ %indvar.next106, %for.end79 ], [ 0, %for.body63.lr.ph ]
  %indvars.iv92 = phi i32 [ %indvars.iv.next93, %for.end79 ], [ %26, %for.body63.lr.ph ]
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.end79 ], [ %27, %for.body63.lr.ph ]
  %72 = add i32 %26, %indvar105
  %73 = zext i32 %indvars.iv92 to i64
  %arrayidx65 = getelementptr inbounds double, double* %22, i64 %indvars.iv60
  %74 = bitcast double* %arrayidx65 to i64*
  %75 = load i64, i64* %74, align 8
  store i64 %75, i64* %29, align 8
  %cmp6713 = icmp sgt i64 %indvars.iv60, 0
  br i1 %cmp6713, label %for.body68.lr.ph, label %for.end79

for.body68.lr.ph:                                 ; preds = %for.body63
  %76 = zext i32 %72 to i64
  %77 = add nuw nsw i64 %76, 1
  %w.promoted26 = load double, double* %w, align 8
  %xtraiter107 = and i64 %77, 3
  %lcmp.mod108 = icmp eq i64 %xtraiter107, 0
  br i1 %lcmp.mod108, label %for.body68.prol.loopexit, label %for.body68.prol.preheader

for.body68.prol.preheader:                        ; preds = %for.body68.lr.ph
  br label %for.body68.prol

for.body68.prol:                                  ; preds = %for.body68.prol, %for.body68.prol.preheader
  %indvars.iv54.prol = phi i64 [ %indvars.iv.next55.prol, %for.body68.prol ], [ 0, %for.body68.prol.preheader ]
  %sub7627.prol = phi double [ %sub76.prol, %for.body68.prol ], [ %w.promoted26, %for.body68.prol.preheader ]
  %prol.iter109 = phi i64 [ %prol.iter109.sub, %for.body68.prol ], [ %xtraiter107, %for.body68.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %23, i64 %indvars.iv60, i64 %indvars.iv54.prol
  %78 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %24, i64 %indvars.iv54.prol
  %79 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %78, %79
  %sub76.prol = fsub double %sub7627.prol, %mul75.prol
  %indvars.iv.next55.prol = add nuw nsw i64 %indvars.iv54.prol, 1
  %prol.iter109.sub = add i64 %prol.iter109, -1
  %prol.iter109.cmp = icmp eq i64 %prol.iter109.sub, 0
  br i1 %prol.iter109.cmp, label %for.body68.prol.loopexit.loopexit, label %for.body68.prol, !llvm.loop !27

for.body68.prol.loopexit.loopexit:                ; preds = %for.body68.prol
  br label %for.body68.prol.loopexit

for.body68.prol.loopexit:                         ; preds = %for.body68.prol.loopexit.loopexit, %for.body68.lr.ph
  %sub76.lcssa.unr = phi double [ undef, %for.body68.lr.ph ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %indvars.iv54.unr = phi i64 [ 0, %for.body68.lr.ph ], [ %indvars.iv.next55.prol, %for.body68.prol.loopexit.loopexit ]
  %sub7627.unr = phi double [ %w.promoted26, %for.body68.lr.ph ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %80 = icmp ult i32 %72, 3
  br i1 %80, label %for.cond66.for.end79_crit_edge, label %for.body68.lr.ph.new

for.body68.lr.ph.new:                             ; preds = %for.body68.prol.loopexit
  br label %for.body68

for.body68:                                       ; preds = %for.body68, %for.body68.lr.ph.new
  %indvars.iv54 = phi i64 [ %indvars.iv54.unr, %for.body68.lr.ph.new ], [ %indvars.iv.next55.3, %for.body68 ]
  %sub7627 = phi double [ %sub7627.unr, %for.body68.lr.ph.new ], [ %sub76.3, %for.body68 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %23, i64 %indvars.iv60, i64 %indvars.iv54
  %81 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %24, i64 %indvars.iv54
  %82 = bitcast double* %arrayidx74 to <2 x double>*
  %83 = load <2 x double>, <2 x double>* %81, align 8
  %84 = load <2 x double>, <2 x double>* %82, align 8
  %mul75 = fmul <2 x double> %83, %84
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %sub7627, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv54, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %23, i64 %indvars.iv60, i64 %indvars.iv.next55.1
  %85 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %24, i64 %indvars.iv.next55.1
  %86 = bitcast double* %arrayidx74.2 to <2 x double>*
  %indvars.iv.next55.2 = add nsw i64 %indvars.iv54, 3
  %87 = load <2 x double>, <2 x double>* %85, align 8
  %88 = load <2 x double>, <2 x double>* %86, align 8
  %mul75.2 = fmul <2 x double> %87, %88
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %exitcond94.3 = icmp eq i64 %indvars.iv.next55.2, %73
  %indvars.iv.next55.3 = add nsw i64 %indvars.iv54, 4
  br i1 %exitcond94.3, label %for.cond66.for.end79_crit_edge.loopexit, label %for.body68

for.cond66.for.end79_crit_edge.loopexit:          ; preds = %for.body68
  br label %for.cond66.for.end79_crit_edge

for.cond66.for.end79_crit_edge:                   ; preds = %for.cond66.for.end79_crit_edge.loopexit, %for.body68.prol.loopexit
  %sub76.lcssa = phi double [ %sub76.lcssa.unr, %for.body68.prol.loopexit ], [ %sub76.3, %for.cond66.for.end79_crit_edge.loopexit ]
  store double %sub76.lcssa, double* %w, align 8
  br label %for.end79

for.end79:                                        ; preds = %for.body63, %for.cond66.for.end79_crit_edge
  %89 = load i64, i64* %30, align 8
  %arrayidx81 = getelementptr inbounds double, double* %24, i64 %indvars.iv60
  %90 = bitcast double* %arrayidx81 to i64*
  store i64 %89, i64* %90, align 8
  %indvars.iv.next61 = add nsw i64 %indvars.iv60, 1
  %cmp62 = icmp slt i64 %indvars.iv.next61, %28
  %indvars.iv.next93 = add i32 %indvars.iv92, 1
  %indvar.next106 = add i32 %indvar105, 1
  br i1 %cmp62, label %for.body63, label %for.end84

for.end84:                                        ; preds = %for.end79
  %.pr = load i32, i32* %n.addr, align 4
  %storemerge211 = add nsw i32 %.pr, -1
  store i32 %storemerge211, i32* %i, align 4
  %cmp8712 = icmp sgt i32 %.pr, 0
  br i1 %cmp8712, label %for.body88.lr.ph, label %for.end113

for.body88.lr.ph:                                 ; preds = %for.end84
  %91 = load double*, double** %y.addr, align 8
  %92 = load i32, i32* %n.addr, align 4
  %93 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %94 = load double*, double** %x.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  %95 = add i32 %i.promoted, 1
  %96 = add i32 %92, -1
  %97 = sext i32 %i.promoted to i64
  %98 = sext i32 %92 to i64
  %wide.trip.count = sext i32 %96 to i64
  %99 = add nsw i64 %wide.trip.count, 1
  %100 = bitcast double* %w to i64*
  br label %for.body88

for.body88:                                       ; preds = %for.end104, %for.body88.lr.ph
  %indvar = phi i32 [ %indvar.next, %for.end104 ], [ 0, %for.body88.lr.ph ]
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.end104 ], [ %97, %for.body88.lr.ph ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.end104 ], [ %95, %for.body88.lr.ph ]
  %101 = sub i32 %95, %indvar
  %102 = sext i32 %101 to i64
  %103 = sub nsw i64 %wide.trip.count, %102
  %arrayidx90 = getelementptr inbounds double, double* %91, i64 %indvars.iv51
  %104 = bitcast double* %arrayidx90 to i64*
  %105 = load i64, i64* %104, align 8
  store i64 %105, i64* %100, align 8
  %106 = add nsw i64 %indvars.iv51, 1
  %cmp9210 = icmp slt i64 %106, %98
  br i1 %cmp9210, label %for.body93.lr.ph, label %for.end104

for.body93.lr.ph:                                 ; preds = %for.body88
  %107 = sub nsw i64 %99, %102
  %108 = sext i32 %indvars.iv to i64
  %w.promoted = load double, double* %w, align 8
  %xtraiter = and i64 %107, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body93.prol.loopexit, label %for.body93.prol.preheader

for.body93.prol.preheader:                        ; preds = %for.body93.lr.ph
  br label %for.body93.prol

for.body93.prol:                                  ; preds = %for.body93.prol, %for.body93.prol.preheader
  %indvars.iv49.prol = phi i64 [ %indvars.iv.next50.prol, %for.body93.prol ], [ %108, %for.body93.prol.preheader ]
  %sub10121.prol = phi double [ %sub101.prol, %for.body93.prol ], [ %w.promoted, %for.body93.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body93.prol ], [ %xtraiter, %for.body93.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %93, i64 %indvars.iv51, i64 %indvars.iv49.prol
  %109 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %94, i64 %indvars.iv49.prol
  %110 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %109, %110
  %sub101.prol = fsub double %sub10121.prol, %mul100.prol
  %indvars.iv.next50.prol = add nsw i64 %indvars.iv49.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body93.prol.loopexit.loopexit, label %for.body93.prol, !llvm.loop !28

for.body93.prol.loopexit.loopexit:                ; preds = %for.body93.prol
  br label %for.body93.prol.loopexit

for.body93.prol.loopexit:                         ; preds = %for.body93.prol.loopexit.loopexit, %for.body93.lr.ph
  %sub101.lcssa.unr = phi double [ undef, %for.body93.lr.ph ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %indvars.iv49.unr = phi i64 [ %108, %for.body93.lr.ph ], [ %indvars.iv.next50.prol, %for.body93.prol.loopexit.loopexit ]
  %sub10121.unr = phi double [ %w.promoted, %for.body93.lr.ph ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %111 = icmp ult i64 %103, 3
  br i1 %111, label %for.cond91.for.end104_crit_edge, label %for.body93.lr.ph.new

for.body93.lr.ph.new:                             ; preds = %for.body93.prol.loopexit
  br label %for.body93

for.body93:                                       ; preds = %for.body93, %for.body93.lr.ph.new
  %indvars.iv49 = phi i64 [ %indvars.iv49.unr, %for.body93.lr.ph.new ], [ %indvars.iv.next50.3, %for.body93 ]
  %sub10121 = phi double [ %sub10121.unr, %for.body93.lr.ph.new ], [ %sub101.3, %for.body93 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %93, i64 %indvars.iv51, i64 %indvars.iv49
  %112 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %94, i64 %indvars.iv49
  %113 = bitcast double* %arrayidx99 to <2 x double>*
  %114 = load <2 x double>, <2 x double>* %112, align 8
  %115 = load <2 x double>, <2 x double>* %113, align 8
  %mul100 = fmul <2 x double> %114, %115
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %sub10121, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %93, i64 %indvars.iv51, i64 %indvars.iv.next50.1
  %116 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %94, i64 %indvars.iv.next50.1
  %117 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next50.2 = add nsw i64 %indvars.iv49, 3
  %118 = load <2 x double>, <2 x double>* %116, align 8
  %119 = load <2 x double>, <2 x double>* %117, align 8
  %mul100.2 = fmul <2 x double> %118, %119
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
  %120 = load double, double* %w, align 8
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %93, i64 %indvars.iv51, i64 %indvars.iv51
  %121 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %120, %121
  %arrayidx111 = getelementptr inbounds double, double* %94, i64 %indvars.iv51
  store double %div109, double* %arrayidx111, align 8
  %indvars.iv.next52 = add nsw i64 %indvars.iv51, -1
  %cmp87 = icmp sgt i64 %indvars.iv51, 0
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp87, label %for.body88, label %for.cond86.for.end113_crit_edge

for.cond86.for.end113_crit_edge:                  ; preds = %for.end104
  %122 = trunc i64 %indvars.iv.next52 to i32
  store i32 %122, i32* %i, align 4
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
