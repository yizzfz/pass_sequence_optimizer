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
  %cmp11 = icmp sgt i32 %0, 0
  br i1 %cmp11, label %for.body.lr.ph, label %for.end.thread

for.end.thread:                                   ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.end46

for.body.lr.ph:                                   ; preds = %entry
  %1 = load double*, double** %x.addr, align 8
  %2 = load double*, double** %y.addr, align 8
  %3 = load double, double* %fn, align 8
  %4 = load double*, double** %b.addr, align 8
  %5 = load i32, i32* %n.addr, align 4
  %i.promoted37 = load i32, i32* %i, align 4
  %6 = sext i32 %i.promoted37 to i64
  %7 = sext i32 %5 to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv82 = phi i64 [ %6, %for.body.lr.ph ], [ %indvars.iv.next83, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %1, i64 %indvars.iv82
  store double 0.000000e+00, double* %arrayidx, align 8
  %arrayidx3 = getelementptr inbounds double, double* %2, i64 %indvars.iv82
  store double 0.000000e+00, double* %arrayidx3, align 8
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, 1
  %8 = trunc i64 %indvars.iv.next83 to i32
  %conv4 = sitofp i32 %8 to double
  %div = fdiv double %conv4, %3
  %div5 = fmul double %div, 5.000000e-01
  %add6 = fadd double %div5, 4.000000e+00
  %arrayidx8 = getelementptr inbounds double, double* %4, i64 %indvars.iv82
  store double %add6, double* %arrayidx8, align 8
  %cmp = icmp slt i64 %indvars.iv.next83, %7
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
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

for.body12:                                       ; preds = %for.end39.for.body12_crit_edge, %for.body12.lr.ph
  %indvars.iv100 = phi i32 [ %indvars.iv.next101, %for.end39.for.body12_crit_edge ], [ %i.promoted, %for.body12.lr.ph ]
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %for.end39.for.body12_crit_edge ], [ %12, %for.body12.lr.ph ]
  %indvar75 = phi i64 [ %indvar.next76, %for.end39.for.body12_crit_edge ], [ 0, %for.body12.lr.ph ]
  %19 = zext i32 %indvars.iv100 to i64
  %20 = add i64 %12, %indvar75
  %21 = add i64 %13, %indvar75
  %sext = shl i64 %21, 32
  %22 = ashr exact i64 %sext, 32
  %scevgep78 = getelementptr [2000 x double], [2000 x double]* %10, i64 %20, i64 %22
  %23 = sub i64 %16, %indvar75
  %24 = shl i64 %23, 3
  %25 = and i64 %24, 34359738360
  %26 = add nuw nsw i64 %25, 8
  %cmp148 = icmp sgt i64 %indvars.iv80, -1
  br i1 %cmp148, label %for.body16.preheader, label %for.end27

for.body16.preheader:                             ; preds = %for.body12
  br label %for.body16

for.body16:                                       ; preds = %for.body16.preheader, %for.body16
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.body16 ], [ 0, %for.body16.preheader ]
  %27 = sub nsw i64 0, %indvars.iv62
  %28 = trunc i64 %27 to i32
  %rem = srem i32 %28, %9
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, %conv18
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv80, i64 %indvars.iv62
  store double %add20, double* %arrayidx24, align 8
  %exitcond102 = icmp eq i64 %indvars.iv62, %19
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  br i1 %exitcond102, label %for.end27.loopexit, label %for.body16

for.end27.loopexit:                               ; preds = %for.body16
  br label %for.end27

for.end27:                                        ; preds = %for.end27.loopexit, %for.body12
  %indvars.iv.next81 = add i64 %indvars.iv80, 1
  %cmp309 = icmp slt i64 %indvars.iv.next81, %18
  br i1 %cmp309, label %for.body32.for.end39_crit_edge, label %for.end39

for.body32.for.end39_crit_edge:                   ; preds = %for.end27
  %29 = bitcast double* %scevgep78 to i8*
  call void @llvm.memset.p0i8.i64(i8* %29, i8 0, i64 %26, i32 8, i1 false)
  br label %for.end39

for.end39:                                        ; preds = %for.end27, %for.body32.for.end39_crit_edge
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv80, i64 %indvars.iv80
  store double 1.000000e+00, double* %arrayidx43, align 8
  %cmp10 = icmp slt i64 %indvars.iv.next81, %17
  br i1 %cmp10, label %for.end39.for.body12_crit_edge, label %for.cond9.for.end46_crit_edge

for.end39.for.body12_crit_edge:                   ; preds = %for.end39
  %indvars.iv.next101 = add i32 %indvars.iv100, 1
  %indvar.next76 = add i64 %indvar75, 1
  br label %for.body12

for.cond9.for.end46_crit_edge:                    ; preds = %for.end39
  %30 = trunc i64 %indvars.iv.next81 to i32
  store i32 %30, i32* %i, align 4
  br label %for.end46

for.end46:                                        ; preds = %for.end, %for.end.thread, %for.cond9.for.end46_crit_edge
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
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
  %r.promoted28 = load i32, i32* %r, align 4
  %36 = sext i32 %r.promoted28 to i64
  %cmp526 = icmp sgt i32 %33, 0
  br i1 %cmp526, label %for.body50.lr.ph.for.body50.us_crit_edge, label %for.body50.for.cond47.for.end64_crit_edge_crit_edge

for.body50.lr.ph.for.body50.us_crit_edge:         ; preds = %for.body50.lr.ph
  %37 = add i32 %33, -1
  %38 = zext i32 %37 to i64
  %39 = shl nuw nsw i64 %38, 3
  %40 = add nuw nsw i64 %39, 8
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us, %for.body50.lr.ph.for.body50.us_crit_edge
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %for.inc62.us ], [ %36, %for.body50.lr.ph.for.body50.us_crit_edge ]
  %indvar = phi i64 [ %indvar.next, %for.inc62.us ], [ 0, %for.body50.lr.ph.for.body50.us_crit_edge ]
  %41 = add nsw i64 %36, %indvar
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %41, i64 0
  %scevgep58 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep58, i8 0, i64 %40, i32 8, i1 false)
  %indvars.iv.next60 = add nsw i64 %indvars.iv59, 1
  %cmp48.us = icmp slt i64 %indvars.iv.next60, %34
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %cmp48.us, label %for.inc62.us, label %for.inc62.us.for.cond47.for.end64_crit_edge_crit_edge

for.inc62.us.for.cond47.for.end64_crit_edge_crit_edge: ; preds = %for.inc62.us
  %42 = trunc i64 %indvars.iv.next60 to i32
  br label %for.end64

for.body50.for.cond47.for.end64_crit_edge_crit_edge: ; preds = %for.body50.lr.ph
  %43 = add i32 %r.promoted28, 1
  %44 = icmp sgt i32 %33, %43
  %smax61 = select i1 %44, i32 %33, i32 %43
  br label %for.end64

for.end64:                                        ; preds = %for.inc62.us.for.cond47.for.end64_crit_edge_crit_edge, %for.body50.for.cond47.for.end64_crit_edge_crit_edge
  %inc60.lcssa31.lcssa = phi i32 [ %33, %for.inc62.us.for.cond47.for.end64_crit_edge_crit_edge ], [ 0, %for.body50.for.cond47.for.end64_crit_edge_crit_edge ]
  %inc63.lcssa = phi i32 [ %42, %for.inc62.us.for.cond47.for.end64_crit_edge_crit_edge ], [ %smax61, %for.body50.for.cond47.for.end64_crit_edge_crit_edge ]
  store i32 %inc63.lcssa, i32* %r, align 4
  store i32 %inc60.lcssa31.lcssa, i32* %s, align 4
  %.pr90 = load i32, i32* %n.addr, align 4
  store i32 0, i32* %t, align 4
  %cmp665 = icmp sgt i32 %.pr90, 0
  br i1 %cmp665, label %for.body68.lr.ph, label %for.end98.thread

for.end98.thread:                                 ; preds = %for.end64
  store i32 0, i32* %r, align 4
  br label %for.end120

for.body68.lr.ph:                                 ; preds = %for.end64
  %45 = load i32, i32* %n.addr, align 4
  %46 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %47 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %t.promoted = load i32, i32* %t, align 4
  %s.promoted = load i32, i32* %s, align 4
  %48 = add i32 %45, -1
  %49 = sext i32 %t.promoted to i64
  %50 = sext i32 %45 to i64
  %51 = zext i32 %48 to i64
  %52 = add nuw nsw i64 %51, 1
  %53 = add nsw i64 %49, 1
  %54 = add nuw nsw i64 %51, 1
  %55 = icmp sgt i32 %45, 0
  %min.iters.check = icmp ult i64 %52, 4
  %n.vec = and i64 %52, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %52, %n.vec
  br label %for.body68

for.body68:                                       ; preds = %for.inc96, %for.body68.lr.ph
  %indvar111 = phi i64 [ %indvar.next112, %for.inc96 ], [ 0, %for.body68.lr.ph ]
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.inc96 ], [ %49, %for.body68.lr.ph ]
  %inc91.lcssa20.lcssa24 = phi i32 [ %inc91.lcssa20.lcssa25, %for.inc96 ], [ %s.promoted, %for.body68.lr.ph ]
  %56 = add i64 %49, %indvar111
  %scevgep113 = getelementptr [2000 x double], [2000 x double]* %46, i64 0, i64 %56
  %57 = add i64 %53, %indvar111
  %scevgep115 = getelementptr [2000 x double], [2000 x double]* %46, i64 %51, i64 %57
  br i1 %55, label %for.body72.us.preheader, label %for.inc96

for.body72.us.preheader:                          ; preds = %for.body68
  br label %for.body72.us

for.body72.us:                                    ; preds = %for.body72.us.preheader, %for.inc93.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.inc93.us ], [ 0, %for.body72.us.preheader ]
  %scevgep107 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv50, i64 0
  %scevgep109 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv50, i64 %52
  %arrayidx80.us = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %indvars.iv50, i64 %indvars.iv52
  br i1 %min.iters.check, label %for.body76.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body72.us
  br i1 %cmp.zero, label %for.body76.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep107, %scevgep115
  %bound1 = icmp ult double* %scevgep113, %scevgep109
  %found.conflict = and i1 %bound0, %bound1
  %bound0118 = icmp ult double* %scevgep107, %arrayidx80.us
  %bound1119 = icmp ult double* %arrayidx80.us, %scevgep109
  %found.conflict120 = and i1 %bound0118, %bound1119
  %conflict.rdx = or i1 %found.conflict, %found.conflict120
  br i1 %conflict.rdx, label %for.body76.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %58 = or i64 %index, 1
  %59 = or i64 %index, 2
  %60 = or i64 %index, 3
  %61 = load double, double* %arrayidx80.us, align 8, !alias.scope !1
  %62 = insertelement <2 x double> undef, double %61, i32 0
  %63 = shufflevector <2 x double> %62, <2 x double> undef, <2 x i32> zeroinitializer
  %64 = insertelement <2 x double> undef, double %61, i32 0
  %65 = shufflevector <2 x double> %64, <2 x double> undef, <2 x i32> zeroinitializer
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %index, i64 %indvars.iv52
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %58, i64 %indvars.iv52
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %59, i64 %indvars.iv52
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %60, i64 %indvars.iv52
  %70 = load double, double* %66, align 8, !alias.scope !4
  %71 = load double, double* %67, align 8, !alias.scope !4
  %72 = load double, double* %68, align 8, !alias.scope !4
  %73 = load double, double* %69, align 8, !alias.scope !4
  %74 = insertelement <2 x double> undef, double %70, i32 0
  %75 = insertelement <2 x double> %74, double %71, i32 1
  %76 = insertelement <2 x double> undef, double %72, i32 0
  %77 = insertelement <2 x double> %76, double %73, i32 1
  %78 = fmul <2 x double> %63, %75
  %79 = fmul <2 x double> %65, %77
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv50, i64 %index
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !6, !noalias !8
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load122 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !6, !noalias !8
  %84 = fadd <2 x double> %wide.load, %78
  %85 = fadd <2 x double> %wide.load122, %79
  %86 = bitcast double* %80 to <2 x double>*
  store <2 x double> %84, <2 x double>* %86, align 8, !alias.scope !6, !noalias !8
  %87 = bitcast double* %82 to <2 x double>*
  store <2 x double> %85, <2 x double>* %87, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %88 = icmp eq i64 %index.next, %n.vec
  br i1 %88, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc93.us, label %for.body76.us.preheader

for.body76.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body72.us
  %indvars.iv46.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.body72.us ], [ %n.vec, %middle.block ]
  %89 = sub nsw i64 %54, %indvars.iv46.ph
  %xtraiter160 = and i64 %89, 1
  %lcmp.mod161 = icmp eq i64 %xtraiter160, 0
  br i1 %lcmp.mod161, label %for.body76.us.prol.loopexit, label %for.body76.us.prol

for.body76.us.prol:                               ; preds = %for.body76.us.preheader
  %90 = load double, double* %arrayidx80.us, align 8
  %arrayidx84.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %indvars.iv46.ph, i64 %indvars.iv52
  %91 = load double, double* %arrayidx84.us.prol, align 8
  %mul.us.prol = fmul double %90, %91
  %arrayidx88.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv50, i64 %indvars.iv46.ph
  %92 = load double, double* %arrayidx88.us.prol, align 8
  %add89.us.prol = fadd double %92, %mul.us.prol
  store double %add89.us.prol, double* %arrayidx88.us.prol, align 8
  %indvars.iv.next47.prol = or i64 %indvars.iv46.ph, 1
  br label %for.body76.us.prol.loopexit

for.body76.us.prol.loopexit:                      ; preds = %for.body76.us.prol, %for.body76.us.preheader
  %indvars.iv46.unr.ph = phi i64 [ %indvars.iv.next47.prol, %for.body76.us.prol ], [ %indvars.iv46.ph, %for.body76.us.preheader ]
  %93 = icmp eq i64 %51, %indvars.iv46.ph
  br i1 %93, label %for.inc93.us, label %for.body76.us.preheader.new

for.body76.us.preheader.new:                      ; preds = %for.body76.us.prol.loopexit
  br label %for.body76.us

for.body76.us:                                    ; preds = %for.body76.us, %for.body76.us.preheader.new
  %indvars.iv46 = phi i64 [ %indvars.iv46.unr.ph, %for.body76.us.preheader.new ], [ %indvars.iv.next47.1, %for.body76.us ]
  %94 = load double, double* %arrayidx80.us, align 8
  %arrayidx84.us = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %indvars.iv46, i64 %indvars.iv52
  %95 = load double, double* %arrayidx84.us, align 8
  %mul.us = fmul double %94, %95
  %arrayidx88.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv50, i64 %indvars.iv46
  %96 = load double, double* %arrayidx88.us, align 8
  %add89.us = fadd double %96, %mul.us
  store double %add89.us, double* %arrayidx88.us, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %97 = load double, double* %arrayidx80.us, align 8
  %arrayidx84.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %indvars.iv.next47, i64 %indvars.iv52
  %98 = load double, double* %arrayidx84.us.1, align 8
  %mul.us.1 = fmul double %97, %98
  %arrayidx88.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv50, i64 %indvars.iv.next47
  %99 = load double, double* %arrayidx88.us.1, align 8
  %add89.us.1 = fadd double %99, %mul.us.1
  store double %add89.us.1, double* %arrayidx88.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next47, %51
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  br i1 %exitcond.1, label %for.inc93.us.loopexit, label %for.body76.us, !llvm.loop !12

for.inc93.us.loopexit:                            ; preds = %for.body76.us
  br label %for.inc93.us

for.inc93.us:                                     ; preds = %for.inc93.us.loopexit, %for.body76.us.prol.loopexit, %middle.block
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next51, %50
  br i1 %exitcond96, label %for.inc96.loopexit, label %for.body72.us

for.inc96.loopexit:                               ; preds = %for.inc93.us
  br label %for.inc96

for.inc96:                                        ; preds = %for.inc96.loopexit, %for.body68
  %inc91.lcssa20.lcssa25 = phi i32 [ %inc91.lcssa20.lcssa24, %for.body68 ], [ %45, %for.inc96.loopexit ]
  %inc94.lcssa22 = phi i32 [ 0, %for.body68 ], [ %45, %for.inc96.loopexit ]
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, 1
  %cmp66 = icmp slt i64 %indvars.iv.next53, %50
  %indvar.next112 = add i64 %indvar111, 1
  br i1 %cmp66, label %for.body68, label %for.cond65.for.end98_crit_edge

for.cond65.for.end98_crit_edge:                   ; preds = %for.inc96
  %100 = trunc i64 %indvars.iv.next53 to i32
  store i32 %inc94.lcssa22, i32* %r, align 4
  store i32 %100, i32* %t, align 4
  store i32 %inc91.lcssa20.lcssa25, i32* %s, align 4
  br label %for.end98

for.end98:                                        ; preds = %for.end64.thread, %for.cond65.for.end98_crit_edge
  %.pr92 = load i32, i32* %n.addr, align 4
  store i32 0, i32* %r, align 4
  %cmp1002 = icmp sgt i32 %.pr92, 0
  br i1 %cmp1002, label %for.body102.lr.ph, label %for.end120

for.body102.lr.ph:                                ; preds = %for.end98
  %101 = load i32, i32* %n.addr, align 4
  %102 = sext i32 %101 to i64
  %103 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %104 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %r.promoted = load i32, i32* %r, align 4
  %105 = sext i32 %r.promoted to i64
  %cmp1041 = icmp sgt i32 %101, 0
  br i1 %cmp1041, label %for.body102.lr.ph.for.body102.us_crit_edge, label %for.body102.for.cond99.for.end120_crit_edge_crit_edge

for.body102.lr.ph.for.body102.us_crit_edge:       ; preds = %for.body102.lr.ph
  %106 = add i32 %101, -1
  %107 = zext i32 %106 to i64
  %108 = add nuw nsw i64 %107, 1
  %109 = and i64 %108, 8589934588
  %110 = add nsw i64 %109, -4
  %111 = lshr exact i64 %110, 2
  %112 = add nuw nsw i64 %107, 1
  %min.iters.check126 = icmp ult i64 %108, 4
  %n.vec129 = and i64 %108, 8589934588
  %cmp.zero130 = icmp eq i64 %n.vec129, 0
  %113 = and i64 %111, 1
  %lcmp.mod = icmp eq i64 %113, 0
  %114 = icmp eq i64 %111, 0
  %cmp.n151 = icmp eq i64 %108, %n.vec129
  br label %for.body102.us

for.body102.us:                                   ; preds = %for.inc118.us, %for.body102.lr.ph.for.body102.us_crit_edge
  %indvar132 = phi i64 [ %indvar.next133, %for.inc118.us ], [ 0, %for.body102.lr.ph.for.body102.us_crit_edge ]
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %for.inc118.us ], [ %105, %for.body102.lr.ph.for.body102.us_crit_edge ]
  %115 = add i64 %105, %indvar132
  %scevgep134 = getelementptr [2000 x double], [2000 x double]* %104, i64 %115, i64 0
  %scevgep136 = getelementptr [2000 x double], [2000 x double]* %104, i64 %115, i64 %108
  %scevgep138 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %115, i64 0
  %scevgep140 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %115, i64 %108
  br i1 %min.iters.check126, label %for.body106.us.preheader, label %min.iters.checked127

min.iters.checked127:                             ; preds = %for.body102.us
  br i1 %cmp.zero130, label %for.body106.us.preheader, label %vector.memcheck146

vector.memcheck146:                               ; preds = %min.iters.checked127
  %bound0142 = icmp ult double* %scevgep134, %scevgep140
  %bound1143 = icmp ult double* %scevgep138, %scevgep136
  %memcheck.conflict145 = and i1 %bound0142, %bound1143
  br i1 %memcheck.conflict145, label %for.body106.us.preheader, label %vector.body123.preheader

vector.body123.preheader:                         ; preds = %vector.memcheck146
  br i1 %lcmp.mod, label %vector.body123.prol, label %vector.body123.prol.loopexit

vector.body123.prol:                              ; preds = %vector.body123.preheader
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv43, i64 0
  %117 = bitcast double* %116 to <2 x i64>*
  %wide.load156.prol = load <2 x i64>, <2 x i64>* %117, align 8, !alias.scope !13
  %118 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv43, i64 2
  %119 = bitcast double* %118 to <2 x i64>*
  %wide.load157.prol = load <2 x i64>, <2 x i64>* %119, align 8, !alias.scope !13
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %104, i64 %indvars.iv43, i64 0
  %121 = bitcast double* %120 to <2 x i64>*
  store <2 x i64> %wide.load156.prol, <2 x i64>* %121, align 8, !alias.scope !16, !noalias !13
  %122 = getelementptr [2000 x double], [2000 x double]* %104, i64 %indvars.iv43, i64 2
  %123 = bitcast double* %122 to <2 x i64>*
  store <2 x i64> %wide.load157.prol, <2 x i64>* %123, align 8, !alias.scope !16, !noalias !13
  br label %vector.body123.prol.loopexit

vector.body123.prol.loopexit:                     ; preds = %vector.body123.prol, %vector.body123.preheader
  %index148.unr.ph = phi i64 [ 4, %vector.body123.prol ], [ 0, %vector.body123.preheader ]
  br i1 %114, label %middle.block124, label %vector.body123.preheader.new

vector.body123.preheader.new:                     ; preds = %vector.body123.prol.loopexit
  br label %vector.body123

vector.body123:                                   ; preds = %vector.body123, %vector.body123.preheader.new
  %index148 = phi i64 [ %index148.unr.ph, %vector.body123.preheader.new ], [ %index.next149.1, %vector.body123 ]
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv43, i64 %index148
  %125 = bitcast double* %124 to <2 x i64>*
  %wide.load156 = load <2 x i64>, <2 x i64>* %125, align 8, !alias.scope !13
  %126 = getelementptr double, double* %124, i64 2
  %127 = bitcast double* %126 to <2 x i64>*
  %wide.load157 = load <2 x i64>, <2 x i64>* %127, align 8, !alias.scope !13
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %104, i64 %indvars.iv43, i64 %index148
  %129 = bitcast double* %128 to <2 x i64>*
  store <2 x i64> %wide.load156, <2 x i64>* %129, align 8, !alias.scope !16, !noalias !13
  %130 = getelementptr double, double* %128, i64 2
  %131 = bitcast double* %130 to <2 x i64>*
  store <2 x i64> %wide.load157, <2 x i64>* %131, align 8, !alias.scope !16, !noalias !13
  %index.next149 = add i64 %index148, 4
  %132 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv43, i64 %index.next149
  %133 = bitcast double* %132 to <2 x i64>*
  %wide.load156.1 = load <2 x i64>, <2 x i64>* %133, align 8, !alias.scope !13
  %134 = getelementptr double, double* %132, i64 2
  %135 = bitcast double* %134 to <2 x i64>*
  %wide.load157.1 = load <2 x i64>, <2 x i64>* %135, align 8, !alias.scope !13
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %104, i64 %indvars.iv43, i64 %index.next149
  %137 = bitcast double* %136 to <2 x i64>*
  store <2 x i64> %wide.load156.1, <2 x i64>* %137, align 8, !alias.scope !16, !noalias !13
  %138 = getelementptr double, double* %136, i64 2
  %139 = bitcast double* %138 to <2 x i64>*
  store <2 x i64> %wide.load157.1, <2 x i64>* %139, align 8, !alias.scope !16, !noalias !13
  %index.next149.1 = add i64 %index148, 8
  %140 = icmp eq i64 %index.next149.1, %n.vec129
  br i1 %140, label %middle.block124.loopexit, label %vector.body123, !llvm.loop !18

middle.block124.loopexit:                         ; preds = %vector.body123
  br label %middle.block124

middle.block124:                                  ; preds = %middle.block124.loopexit, %vector.body123.prol.loopexit
  br i1 %cmp.n151, label %for.inc118.us, label %for.body106.us.preheader

for.body106.us.preheader:                         ; preds = %middle.block124, %vector.memcheck146, %min.iters.checked127, %for.body102.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck146 ], [ 0, %min.iters.checked127 ], [ 0, %for.body102.us ], [ %n.vec129, %middle.block124 ]
  %141 = sub nsw i64 %112, %indvars.iv.ph
  %142 = sub nsw i64 %107, %indvars.iv.ph
  %xtraiter158 = and i64 %141, 3
  %lcmp.mod159 = icmp eq i64 %xtraiter158, 0
  br i1 %lcmp.mod159, label %for.body106.us.prol.loopexit, label %for.body106.us.prol.preheader

for.body106.us.prol.preheader:                    ; preds = %for.body106.us.preheader
  br label %for.body106.us.prol

for.body106.us.prol:                              ; preds = %for.body106.us.prol, %for.body106.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body106.us.prol ], [ %indvars.iv.ph, %for.body106.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body106.us.prol ], [ %xtraiter158, %for.body106.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv43, i64 %indvars.iv.prol
  %143 = bitcast double* %arrayidx110.us.prol to i64*
  %144 = load i64, i64* %143, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %104, i64 %indvars.iv43, i64 %indvars.iv.prol
  %145 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %144, i64* %145, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body106.us.prol.loopexit.loopexit, label %for.body106.us.prol, !llvm.loop !19

for.body106.us.prol.loopexit.loopexit:            ; preds = %for.body106.us.prol
  br label %for.body106.us.prol.loopexit

for.body106.us.prol.loopexit:                     ; preds = %for.body106.us.prol.loopexit.loopexit, %for.body106.us.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body106.us.preheader ], [ %indvars.iv.next.prol, %for.body106.us.prol.loopexit.loopexit ]
  %146 = icmp ult i64 %142, 3
  br i1 %146, label %for.inc118.us, label %for.body106.us.preheader.new

for.body106.us.preheader.new:                     ; preds = %for.body106.us.prol.loopexit
  br label %for.body106.us

for.body106.us:                                   ; preds = %for.body106.us, %for.body106.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body106.us.preheader.new ], [ %indvars.iv.next.3, %for.body106.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv43, i64 %indvars.iv
  %147 = bitcast double* %arrayidx110.us to i64*
  %148 = load i64, i64* %147, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %104, i64 %indvars.iv43, i64 %indvars.iv
  %149 = bitcast double* %arrayidx114.us to i64*
  store i64 %148, i64* %149, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv43, i64 %indvars.iv.next
  %150 = bitcast double* %arrayidx110.us.1 to i64*
  %151 = load i64, i64* %150, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %104, i64 %indvars.iv43, i64 %indvars.iv.next
  %152 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %151, i64* %152, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv43, i64 %indvars.iv.next.1
  %153 = bitcast double* %arrayidx110.us.2 to i64*
  %154 = load i64, i64* %153, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %104, i64 %indvars.iv43, i64 %indvars.iv.next.1
  %155 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %154, i64* %155, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv43, i64 %indvars.iv.next.2
  %156 = bitcast double* %arrayidx110.us.3 to i64*
  %157 = load i64, i64* %156, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %104, i64 %indvars.iv43, i64 %indvars.iv.next.2
  %158 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %157, i64* %158, align 8
  %exitcond94.3 = icmp eq i64 %indvars.iv.next.2, %107
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond94.3, label %for.inc118.us.loopexit, label %for.body106.us, !llvm.loop !21

for.inc118.us.loopexit:                           ; preds = %for.body106.us
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit, %for.body106.us.prol.loopexit, %middle.block124
  %indvars.iv.next44 = add nsw i64 %indvars.iv43, 1
  %cmp100.us = icmp slt i64 %indvars.iv.next44, %102
  %indvar.next133 = add i64 %indvar132, 1
  br i1 %cmp100.us, label %for.body102.us, label %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge

for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge: ; preds = %for.inc118.us
  %159 = trunc i64 %indvars.iv.next44 to i32
  br label %for.cond99.for.end120_crit_edge

for.body102.for.cond99.for.end120_crit_edge_crit_edge: ; preds = %for.body102.lr.ph
  %160 = add i32 %r.promoted, 1
  %161 = icmp sgt i32 %101, %160
  %smax = select i1 %161, i32 %101, i32 %160
  br label %for.cond99.for.end120_crit_edge

for.cond99.for.end120_crit_edge:                  ; preds = %for.body102.for.cond99.for.end120_crit_edge_crit_edge, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge
  %inc116.lcssa15.lcssa = phi i32 [ %101, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge ], [ 0, %for.body102.for.cond99.for.end120_crit_edge_crit_edge ]
  %inc119.lcssa = phi i32 [ %159, %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge ], [ %smax, %for.body102.for.cond99.for.end120_crit_edge_crit_edge ]
  store i32 %inc119.lcssa, i32* %r, align 4
  store i32 %inc116.lcssa15.lcssa, i32* %s, align 4
  br label %for.end120

for.end120:                                       ; preds = %for.end98, %for.end98.thread, %for.cond99.for.end120_crit_edge
  %162 = bitcast [2000 x [2000 x double]]** %B to i8**
  %163 = load i8*, i8** %162, align 8
  call void @free(i8* %163) #5
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

for.body3:                                        ; preds = %for.body3.preheader, %for.end
  %indvars.iv92 = phi i32 [ %indvars.iv.next93, %for.end ], [ -1, %for.body3.preheader ]
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.end ], [ 0, %for.body3.preheader ]
  %18 = add i64 %indvars.iv66, 4294967295
  %19 = and i64 %18, 4294967295
  %20 = zext i32 %indvars.iv92 to i64
  %21 = add i32 %indvars.iv92, 1
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
  %exitcond94.1 = icmp eq i64 %indvars.iv.next61, %20
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  br i1 %exitcond94.1, label %for.end.loopexit, label %for.body8

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
  %indvars.iv.next93 = add i32 %indvars.iv92, 1
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
  %exitcond97.1 = icmp eq i64 %indvars.iv.next76, %16
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75, 2
  br i1 %exitcond97.1, label %for.end50.us.loopexit, label %for.body37.us

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

for.body63:                                       ; preds = %for.end79, %for.body63.lr.ph
  %indvar102 = phi i32 [ %indvar.next103, %for.end79 ], [ 0, %for.body63.lr.ph ]
  %indvars.iv89 = phi i32 [ %indvars.iv.next90, %for.end79 ], [ %49, %for.body63.lr.ph ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.end79 ], [ %50, %for.body63.lr.ph ]
  %52 = add i32 %49, %indvar102
  %53 = zext i32 %indvars.iv89 to i64
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
  br i1 %prol.iter106.cmp, label %for.body68.prol.loopexit.loopexit, label %for.body68.prol, !llvm.loop !23

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
  %exitcond91.3 = icmp eq i64 %indvars.iv.next53.2, %53
  %indvars.iv.next53.3 = add nsw i64 %indvars.iv52, 4
  br i1 %exitcond91.3, label %for.end79.loopexit, label %for.body68

for.end79.loopexit:                               ; preds = %for.body68
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.body68.prol.loopexit, %for.body63
  %sub76.lcssa23 = phi double [ %54, %for.body63 ], [ %sub76.lcssa.unr, %for.body68.prol.loopexit ], [ %sub76.3, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %47, i64 %indvars.iv58
  store double %sub76.lcssa23, double* %arrayidx81, align 8
  %indvars.iv.next59 = add nsw i64 %indvars.iv58, 1
  %cmp62 = icmp slt i64 %indvars.iv.next59, %51
  %indvars.iv.next90 = add i32 %indvars.iv89, 1
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
  br i1 %prol.iter.cmp, label %for.body93.prol.loopexit.loopexit, label %for.body93.prol, !llvm.loop !24

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
