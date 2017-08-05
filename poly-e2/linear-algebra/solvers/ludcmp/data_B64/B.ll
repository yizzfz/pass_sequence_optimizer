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
  %cmp15 = icmp sgt i32 %0, 0
  br i1 %cmp15, label %for.inc.lr.ph, label %for.end.thread

for.end.thread:                                   ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.end46

for.inc.lr.ph:                                    ; preds = %entry
  %1 = load double*, double** %x.addr, align 8
  %2 = load double*, double** %y.addr, align 8
  %3 = load double, double* %fn, align 8
  %4 = load double*, double** %b.addr, align 8
  %5 = load i32, i32* %n.addr, align 4
  %i.promoted70 = load i32, i32* %i, align 4
  %6 = sext i32 %i.promoted70 to i64
  %7 = sext i32 %5 to i64
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %for.inc ], [ %6, %for.inc.lr.ph ]
  %arrayidx = getelementptr inbounds double, double* %1, i64 %indvars.iv117
  store double 0.000000e+00, double* %arrayidx, align 8
  %arrayidx3 = getelementptr inbounds double, double* %2, i64 %indvars.iv117
  store double 0.000000e+00, double* %arrayidx3, align 8
  %indvars.iv.next118 = add nsw i64 %indvars.iv117, 1
  %8 = trunc i64 %indvars.iv.next118 to i32
  %conv4 = sitofp i32 %8 to double
  %div = fdiv double %conv4, %3
  %div5 = fmul double %div, 5.000000e-01
  %add6 = fadd double %div5, 4.000000e+00
  %arrayidx8 = getelementptr inbounds double, double* %4, i64 %indvars.iv117
  store double %add6, double* %arrayidx8, align 8
  %cmp = icmp slt i64 %indvars.iv.next118, %7
  br i1 %cmp, label %for.inc, label %for.end

for.end:                                          ; preds = %for.inc
  %.pr = load i32, i32* %n.addr, align 4
  store i32 0, i32* %i, align 4
  %cmp1013 = icmp sgt i32 %.pr, 0
  br i1 %cmp1013, label %for.body12.lr.ph, label %for.end46

for.body12.lr.ph:                                 ; preds = %for.end
  %9 = load i32, i32* %n.addr, align 4
  %conv18 = sitofp i32 %9 to double
  %i.promoted = load i32, i32* %i, align 4
  %10 = add i32 %i.promoted, 1
  %11 = sext i32 %10 to i64
  %12 = add i32 %9, 7
  %13 = sub i32 %12, %i.promoted
  %14 = add i32 %9, -2
  %15 = sub i32 %14, %i.promoted
  %16 = sext i32 %i.promoted to i64
  %17 = sext i32 %9 to i64
  %18 = sext i32 %9 to i64
  %19 = trunc i32 %13 to i3
  br label %for.body12

for.body12:                                       ; preds = %for.inc44, %for.body12.lr.ph
  %indvars.iv143 = phi i3 [ %indvars.iv.next144, %for.inc44 ], [ %19, %for.body12.lr.ph ]
  %indvars.iv141.in = phi i64 [ %indvars.iv141, %for.inc44 ], [ %11, %for.body12.lr.ph ]
  %indvars.iv138 = phi i32 [ %indvars.iv.next139, %for.inc44 ], [ %10, %for.body12.lr.ph ]
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %for.inc44 ], [ %16, %for.body12.lr.ph ]
  %indvar109 = phi i32 [ %indvar.next110, %for.inc44 ], [ 0, %for.body12.lr.ph ]
  %indvars.iv141 = add nsw i64 %indvars.iv141.in, 1
  %20 = zext i3 %indvars.iv143 to i64
  %21 = add nuw nsw i64 %20, 4294967295
  %22 = and i64 %21, 4294967295
  %23 = add i64 %indvars.iv141, %22
  %24 = zext i32 %indvars.iv138 to i64
  %25 = sub i32 %13, %indvar109
  %26 = sub i32 %15, %indvar109
  %cmp148 = icmp sgt i64 %indvars.iv114, -1
  br i1 %cmp148, label %for.inc25.lr.ph, label %for.end27

for.inc25.lr.ph:                                  ; preds = %for.body12
  %27 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25, %for.inc25.lr.ph
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %for.inc25 ], [ 0, %for.inc25.lr.ph ]
  %28 = sub nsw i64 0, %indvars.iv98
  %29 = trunc i64 %28 to i32
  %rem = srem i32 %29, %9
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, %conv18
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %27, i64 %indvars.iv114, i64 %indvars.iv98
  store double %add20, double* %arrayidx24, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond140 = icmp eq i64 %indvars.iv.next99, %24
  br i1 %exitcond140, label %for.end27.loopexit, label %for.inc25

for.end27.loopexit:                               ; preds = %for.inc25
  br label %for.end27

for.end27:                                        ; preds = %for.end27.loopexit, %for.body12
  %indvars.iv.next115 = add nsw i64 %indvars.iv114, 1
  %cmp309 = icmp slt i64 %indvars.iv.next115, %17
  %30 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br i1 %cmp309, label %for.inc37.lr.ph, label %for.inc44

for.inc37.lr.ph:                                  ; preds = %for.end27
  %arrayidx3411 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i64 %indvars.iv114
  %31 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i64 %indvars.iv114
  %xtraiter111 = and i32 %25, 7
  %lcmp.mod112 = icmp eq i32 %xtraiter111, 0
  br i1 %lcmp.mod112, label %for.inc37.prol.loopexit, label %for.inc37.prol.preheader

for.inc37.prol.preheader:                         ; preds = %for.inc37.lr.ph
  br label %for.inc37.prol

for.inc37.prol:                                   ; preds = %for.inc37.prol.preheader, %for.inc37.prol
  %indvars.iv106.prol = phi i64 [ %indvars.iv.next107.prol, %for.inc37.prol ], [ %indvars.iv141.in, %for.inc37.prol.preheader ]
  %32 = phi [2000 x double]* [ %31, %for.inc37.prol ], [ %30, %for.inc37.prol.preheader ]
  %prol.iter113 = phi i32 [ %prol.iter113.sub, %for.inc37.prol ], [ %xtraiter111, %for.inc37.prol.preheader ]
  %arrayidx36.prol = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %indvars.iv114, i64 %indvars.iv106.prol
  store double 0.000000e+00, double* %arrayidx36.prol, align 8
  %indvars.iv.next107.prol = add nsw i64 %indvars.iv106.prol, 1
  %prol.iter113.sub = add nsw i32 %prol.iter113, -1
  %prol.iter113.cmp = icmp eq i32 %prol.iter113.sub, 0
  br i1 %prol.iter113.cmp, label %for.inc37.prol.loopexit.loopexit, label %for.inc37.prol, !llvm.loop !1

for.inc37.prol.loopexit.loopexit:                 ; preds = %for.inc37.prol
  br label %for.inc37.prol.loopexit

for.inc37.prol.loopexit:                          ; preds = %for.inc37.prol.loopexit.loopexit, %for.inc37.lr.ph
  %indvars.iv106.unr = phi i64 [ %indvars.iv141.in, %for.inc37.lr.ph ], [ %23, %for.inc37.prol.loopexit.loopexit ]
  %arrayidx3412.unr = phi [2000 x double]* [ %arrayidx3411, %for.inc37.lr.ph ], [ %arrayidx34, %for.inc37.prol.loopexit.loopexit ]
  %33 = icmp ult i32 %26, 7
  br i1 %33, label %for.inc44, label %for.inc37.preheader

for.inc37.preheader:                              ; preds = %for.inc37.prol.loopexit
  br label %for.inc37

for.inc37:                                        ; preds = %for.inc37.preheader, %for.inc37
  %indvars.iv106 = phi i64 [ %indvars.iv.next107.7, %for.inc37 ], [ %indvars.iv106.unr, %for.inc37.preheader ]
  %arrayidx3412 = phi [2000 x double]* [ %arrayidx34, %for.inc37 ], [ %arrayidx3412.unr, %for.inc37.preheader ]
  %arrayidx36 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx3412, i64 0, i64 %indvars.iv106
  store double 0.000000e+00, double* %arrayidx36, align 8
  %indvars.iv.next107 = add nsw i64 %indvars.iv106, 1
  %arrayidx36.1 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i64 %indvars.iv114, i64 %indvars.iv.next107
  store double 0.000000e+00, double* %arrayidx36.1, align 8
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106, 2
  %arrayidx36.2 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i64 %indvars.iv114, i64 %indvars.iv.next107.1
  store double 0.000000e+00, double* %arrayidx36.2, align 8
  %indvars.iv.next107.2 = add nsw i64 %indvars.iv106, 3
  %arrayidx36.3 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i64 %indvars.iv114, i64 %indvars.iv.next107.2
  store double 0.000000e+00, double* %arrayidx36.3, align 8
  %indvars.iv.next107.3 = add nsw i64 %indvars.iv106, 4
  %arrayidx36.4 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i64 %indvars.iv114, i64 %indvars.iv.next107.3
  store double 0.000000e+00, double* %arrayidx36.4, align 8
  %indvars.iv.next107.4 = add nsw i64 %indvars.iv106, 5
  %arrayidx36.5 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i64 %indvars.iv114, i64 %indvars.iv.next107.4
  store double 0.000000e+00, double* %arrayidx36.5, align 8
  %indvars.iv.next107.5 = add nsw i64 %indvars.iv106, 6
  %arrayidx36.6 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i64 %indvars.iv114, i64 %indvars.iv.next107.5
  store double 0.000000e+00, double* %arrayidx36.6, align 8
  %indvars.iv.next107.6 = add nsw i64 %indvars.iv106, 7
  %arrayidx36.7 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i64 %indvars.iv114, i64 %indvars.iv.next107.6
  store double 0.000000e+00, double* %arrayidx36.7, align 8
  %indvars.iv.next107.7 = add nsw i64 %indvars.iv106, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next107.7 to i32
  %exitcond108.7 = icmp eq i32 %lftr.wideiv.7, %9
  br i1 %exitcond108.7, label %for.inc44.loopexit, label %for.inc37

for.inc44.loopexit:                               ; preds = %for.inc37
  br label %for.inc44

for.inc44:                                        ; preds = %for.inc44.loopexit, %for.inc37.prol.loopexit, %for.end27
  %34 = phi [2000 x double]* [ %30, %for.end27 ], [ %31, %for.inc37.prol.loopexit ], [ %31, %for.inc44.loopexit ]
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %34, i64 %indvars.iv114, i64 %indvars.iv114
  store double 1.000000e+00, double* %arrayidx43, align 8
  %cmp10 = icmp slt i64 %indvars.iv.next115, %18
  %indvars.iv.next139 = add i32 %indvars.iv138, 1
  %indvar.next110 = add nuw i32 %indvar109, 1
  %indvars.iv.next144 = add i3 %indvars.iv143, -1
  br i1 %cmp10, label %for.body12, label %for.cond9.for.end46_crit_edge

for.cond9.for.end46_crit_edge:                    ; preds = %for.inc44
  %35 = trunc i64 %indvars.iv.next115 to i32
  store i32 %35, i32* %i, align 4
  br label %for.end46

for.end46:                                        ; preds = %for.end.thread, %for.end, %for.cond9.for.end46_crit_edge
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %36 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %36, align 8
  store i32 0, i32* %r, align 4
  %37 = load i32, i32* %n.addr, align 4
  %cmp487 = icmp sgt i32 %37, 0
  br i1 %cmp487, label %for.body50.lr.ph, label %for.end64.thread

for.end64.thread:                                 ; preds = %for.end46
  store i32 0, i32* %t, align 4
  store i32 0, i32* %r, align 4
  br label %for.cond99.preheader

for.body50.lr.ph:                                 ; preds = %for.end46
  %38 = load i32, i32* %n.addr, align 4
  %39 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %r.promoted61 = load i32, i32* %r, align 4
  %cmp526 = icmp sgt i32 %38, 0
  br i1 %cmp526, label %for.body50.lr.ph.for.body50.us_crit_edge, label %for.end64

for.body50.lr.ph.for.body50.us_crit_edge:         ; preds = %for.body50.lr.ph
  %40 = add i32 %38, -1
  %41 = zext i32 %40 to i64
  %42 = shl nuw nsw i64 %41, 3
  %43 = add nuw nsw i64 %42, 8
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.body50.lr.ph.for.body50.us_crit_edge, %for.inc62.us
  %indvar = phi i32 [ %indvar.next, %for.inc62.us ], [ 0, %for.body50.lr.ph.for.body50.us_crit_edge ]
  %inc6362.us = phi i32 [ %inc63.us, %for.inc62.us ], [ %r.promoted61, %for.body50.lr.ph.for.body50.us_crit_edge ]
  %44 = add i32 %r.promoted61, %indvar
  %45 = sext i32 %44 to i64
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %45, i64 0
  %scevgep95 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep95, i8 0, i64 %43, i32 8, i1 false)
  %inc63.us = add nsw i32 %inc6362.us, 1
  %cmp48.us = icmp slt i32 %inc63.us, %38
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp48.us, label %for.inc62.us, label %for.end64.loopexit

for.end64.loopexit:                               ; preds = %for.inc62.us
  br label %for.end64

for.end64:                                        ; preds = %for.end64.loopexit, %for.body50.lr.ph
  %inc60.lcssa64.lcssa = phi i32 [ 0, %for.body50.lr.ph ], [ %38, %for.end64.loopexit ]
  store i32 %inc60.lcssa64.lcssa, i32* %s, align 4
  %.pr125 = load i32, i32* %n.addr, align 4
  store i32 0, i32* %t, align 4
  %cmp665 = icmp sgt i32 %.pr125, 0
  store i32 0, i32* %r, align 4
  br i1 %cmp665, label %for.cond69.preheader.lr.ph, label %for.cond99.preheader

for.cond69.preheader.lr.ph:                       ; preds = %for.end64
  %46 = load i32, i32* %n.addr, align 4
  %wide.trip.count84.1 = zext i32 %46 to i64
  %wide.trip.count = sext i32 %46 to i64
  %47 = sext i32 %46 to i64
  %48 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %49 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %cmp743 = icmp sgt i32 %46, 0
  %r.promoted25 = load i32, i32* %r, align 4
  %t.promoted = load i32, i32* %t, align 4
  %50 = sext i32 %t.promoted to i64
  %s.promoted = load i32, i32* %s, align 4
  br i1 %cmp743, label %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge, label %for.cond69.preheader.preheader

for.cond69.preheader.preheader:                   ; preds = %for.cond69.preheader.lr.ph
  br label %for.cond69.preheader

for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge: ; preds = %for.cond69.preheader.lr.ph
  %xtraiter85 = and i32 %46, 1
  %51 = icmp eq i32 %xtraiter85, 0
  %52 = icmp eq i32 %46, 1
  %sunkaddr = ptrtoint [2000 x double]* %48 to i64
  br label %for.cond69.preheader.us

for.cond69.preheader.us:                          ; preds = %for.inc96.us, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %for.inc96.us ], [ %50, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %inc91.lcssa24.lcssa28.us = phi i32 [ %inc91.lcssa24.lcssa29.us, %for.inc96.us ], [ %s.promoted, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %inc94.lcssa26.us = phi i32 [ 0, %for.inc96.us ], [ %r.promoted25, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %cmp704.us = icmp slt i32 %inc94.lcssa26.us, %46
  br i1 %cmp704.us, label %for.body72.us.us.preheader, label %for.inc96.us

for.body72.us.us.preheader:                       ; preds = %for.cond69.preheader.us
  %53 = sext i32 %inc94.lcssa26.us to i64
  %sunkaddr153 = shl i64 %indvars.iv88, 3
  %sunkaddr154 = add i64 %sunkaddr, %sunkaddr153
  %sunkaddr155 = inttoptr i64 %sunkaddr154 to double*
  br label %for.body72.us.us

for.inc96.us.loopexit:                            ; preds = %for.inc93.us.us
  br label %for.inc96.us

for.inc96.us:                                     ; preds = %for.inc96.us.loopexit, %for.cond69.preheader.us
  %inc91.lcssa24.lcssa29.us = phi i32 [ %inc91.lcssa24.lcssa28.us, %for.cond69.preheader.us ], [ %46, %for.inc96.us.loopexit ]
  %indvars.iv.next89 = add nsw i64 %indvars.iv88, 1
  %cmp66.us = icmp slt i64 %indvars.iv.next89, %47
  br i1 %cmp66.us, label %for.cond69.preheader.us, label %for.cond65.for.cond99.preheader_crit_edge.loopexit

for.body72.us.us:                                 ; preds = %for.inc93.us.us, %for.body72.us.us.preheader
  %indvars.iv133 = phi i64 [ %53, %for.body72.us.us.preheader ], [ %indvars.iv.next134, %for.inc93.us.us ]
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %48, i64 %indvars.iv133, i64 %indvars.iv88
  br i1 %51, label %for.inc90.us.us.prol.loopexit, label %for.inc90.us.us.prol

for.inc90.us.us.prol:                             ; preds = %for.body72.us.us
  %54 = load double, double* %arrayidx80.us.us, align 8
  %55 = load double, double* %sunkaddr155, align 8
  %mul.us.us.prol = fmul double %54, %55
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv133, i64 0
  %56 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %mul.us.us.prol, %56
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  br label %for.inc90.us.us.prol.loopexit

for.inc90.us.us.prol.loopexit:                    ; preds = %for.inc90.us.us.prol, %for.body72.us.us
  %indvars.iv82.unr.ph = phi i64 [ 1, %for.inc90.us.us.prol ], [ 0, %for.body72.us.us ]
  br i1 %52, label %for.inc93.us.us, label %for.inc90.us.us.preheader

for.inc90.us.us.preheader:                        ; preds = %for.inc90.us.us.prol.loopexit
  br label %for.inc90.us.us

for.inc93.us.us.loopexit:                         ; preds = %for.inc90.us.us
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit, %for.inc90.us.us.prol.loopexit
  %indvars.iv.next134 = add nsw i64 %indvars.iv133, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next134, %wide.trip.count
  br i1 %exitcond135, label %for.inc96.us.loopexit, label %for.body72.us.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us.preheader, %for.inc90.us.us
  %indvars.iv82 = phi i64 [ %indvars.iv.next83.1, %for.inc90.us.us ], [ %indvars.iv82.unr.ph, %for.inc90.us.us.preheader ]
  %57 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %48, i64 %indvars.iv82, i64 %indvars.iv88
  %58 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %57, %58
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv133, i64 %indvars.iv82
  %59 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %mul.us.us, %59
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %60 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %48, i64 %indvars.iv.next83, i64 %indvars.iv88
  %61 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %60, %61
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv133, i64 %indvars.iv.next83
  %62 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %mul.us.us.1, %62
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %indvars.iv.next83.1 = add nuw nsw i64 %indvars.iv82, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next83.1, %wide.trip.count84.1
  br i1 %exitcond.1, label %for.inc93.us.us.loopexit, label %for.inc90.us.us

for.cond69.preheader:                             ; preds = %for.cond69.preheader.preheader, %for.cond69.preheader
  %inc91.lcssa24.lcssa28 = phi i32 [ %.inc91.lcssa24.lcssa28, %for.cond69.preheader ], [ %s.promoted, %for.cond69.preheader.preheader ]
  %inc9727 = phi i32 [ %inc97, %for.cond69.preheader ], [ %t.promoted, %for.cond69.preheader.preheader ]
  %inc94.lcssa26 = phi i32 [ 0, %for.cond69.preheader ], [ %r.promoted25, %for.cond69.preheader.preheader ]
  %cmp704 = icmp slt i32 %inc94.lcssa26, %46
  %.inc91.lcssa24.lcssa28 = select i1 %cmp704, i32 0, i32 %inc91.lcssa24.lcssa28
  %inc97 = add nsw i32 %inc9727, 1
  %cmp66 = icmp slt i32 %inc97, %46
  br i1 %cmp66, label %for.cond69.preheader, label %for.cond65.for.cond99.preheader_crit_edge.loopexit158

for.cond65.for.cond99.preheader_crit_edge.loopexit: ; preds = %for.inc96.us
  %63 = trunc i64 %indvars.iv.next89 to i32
  br label %for.cond65.for.cond99.preheader_crit_edge

for.cond65.for.cond99.preheader_crit_edge.loopexit158: ; preds = %for.cond69.preheader
  br label %for.cond65.for.cond99.preheader_crit_edge

for.cond65.for.cond99.preheader_crit_edge:        ; preds = %for.cond65.for.cond99.preheader_crit_edge.loopexit158, %for.cond65.for.cond99.preheader_crit_edge.loopexit
  %inc91.lcssa24.lcssa29.lcssa = phi i32 [ %inc91.lcssa24.lcssa29.us, %for.cond65.for.cond99.preheader_crit_edge.loopexit ], [ %.inc91.lcssa24.lcssa28, %for.cond65.for.cond99.preheader_crit_edge.loopexit158 ]
  %inc97.lcssa = phi i32 [ %63, %for.cond65.for.cond99.preheader_crit_edge.loopexit ], [ %inc97, %for.cond65.for.cond99.preheader_crit_edge.loopexit158 ]
  store i32 0, i32* %r, align 4
  store i32 %inc97.lcssa, i32* %t, align 4
  store i32 %inc91.lcssa24.lcssa29.lcssa, i32* %s, align 4
  br label %for.cond99.preheader

for.cond99.preheader:                             ; preds = %for.end64.thread, %for.end64, %for.cond65.for.cond99.preheader_crit_edge
  %64 = load i32, i32* %r, align 4
  %65 = load i32, i32* %n.addr, align 4
  %cmp1002 = icmp slt i32 %64, %65
  br i1 %cmp1002, label %for.body102.lr.ph, label %for.end120

for.body102.lr.ph:                                ; preds = %for.cond99.preheader
  %66 = load i32, i32* %n.addr, align 4
  %wide.trip.count.3 = zext i32 %66 to i64
  %67 = sext i32 %66 to i64
  %68 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %69 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %r.promoted = load i32, i32* %r, align 4
  %70 = sext i32 %r.promoted to i64
  %cmp1041 = icmp sgt i32 %66, 0
  br i1 %cmp1041, label %for.body102.lr.ph.for.body102.us_crit_edge, label %for.cond99.for.end120_crit_edge.loopexit72

for.body102.lr.ph.for.body102.us_crit_edge:       ; preds = %for.body102.lr.ph
  %71 = add i32 %66, -1
  %72 = and i32 %66, 3
  %73 = add nsw i32 %72, -1
  %74 = zext i32 %73 to i64
  %75 = add nuw nsw i64 %74, 1
  %xtraiter = and i32 %66, 3
  %76 = icmp eq i32 %xtraiter, 0
  %77 = icmp ult i32 %71, 3
  br label %for.body102.us

for.body102.us:                                   ; preds = %for.inc118.us, %for.body102.lr.ph.for.body102.us_crit_edge
  %indvars.iv130 = phi i64 [ %indvars.iv.next131, %for.inc118.us ], [ %70, %for.body102.lr.ph.for.body102.us_crit_edge ]
  br i1 %76, label %for.inc115.us.prol.loopexit, label %for.inc115.us.prol.preheader

for.inc115.us.prol.preheader:                     ; preds = %for.body102.us
  br label %for.inc115.us.prol

for.inc115.us.prol:                               ; preds = %for.inc115.us.prol.preheader, %for.inc115.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc115.us.prol ], [ 0, %for.inc115.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc115.us.prol ], [ %xtraiter, %for.inc115.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv130, i64 %indvars.iv.prol
  %78 = bitcast double* %arrayidx110.us.prol to i64*
  %79 = load i64, i64* %78, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %69, i64 %indvars.iv130, i64 %indvars.iv.prol
  %80 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %79, i64* %80, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc115.us.prol.loopexit.loopexit, label %for.inc115.us.prol, !llvm.loop !3

for.inc115.us.prol.loopexit.loopexit:             ; preds = %for.inc115.us.prol
  br label %for.inc115.us.prol.loopexit

for.inc115.us.prol.loopexit:                      ; preds = %for.inc115.us.prol.loopexit.loopexit, %for.body102.us
  %indvars.iv.unr = phi i64 [ 0, %for.body102.us ], [ %75, %for.inc115.us.prol.loopexit.loopexit ]
  br i1 %77, label %for.inc118.us, label %for.inc115.us.preheader

for.inc115.us.preheader:                          ; preds = %for.inc115.us.prol.loopexit
  br label %for.inc115.us

for.inc115.us:                                    ; preds = %for.inc115.us.preheader, %for.inc115.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc115.us ], [ %indvars.iv.unr, %for.inc115.us.preheader ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv130, i64 %indvars.iv
  %81 = bitcast double* %arrayidx110.us to i64*
  %82 = load i64, i64* %81, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %69, i64 %indvars.iv130, i64 %indvars.iv
  %83 = bitcast double* %arrayidx114.us to i64*
  store i64 %82, i64* %83, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv130, i64 %indvars.iv.next
  %84 = bitcast double* %arrayidx110.us.1 to i64*
  %85 = load i64, i64* %84, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %69, i64 %indvars.iv130, i64 %indvars.iv.next
  %86 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %85, i64* %86, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv130, i64 %indvars.iv.next.1
  %87 = bitcast double* %arrayidx110.us.2 to i64*
  %88 = load i64, i64* %87, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %69, i64 %indvars.iv130, i64 %indvars.iv.next.1
  %89 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %88, i64* %89, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv130, i64 %indvars.iv.next.2
  %90 = bitcast double* %arrayidx110.us.3 to i64*
  %91 = load i64, i64* %90, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %69, i64 %indvars.iv130, i64 %indvars.iv.next.2
  %92 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %91, i64* %92, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.inc118.us.loopexit, label %for.inc115.us

for.inc118.us.loopexit:                           ; preds = %for.inc115.us
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit, %for.inc115.us.prol.loopexit
  %indvars.iv.next131 = add nsw i64 %indvars.iv130, 1
  %cmp100.us = icmp slt i64 %indvars.iv.next131, %67
  br i1 %cmp100.us, label %for.body102.us, label %for.cond99.for.end120_crit_edge.loopexit

for.cond99.for.end120_crit_edge.loopexit72:       ; preds = %for.body102.lr.ph
  %93 = add i32 %r.promoted, 1
  %94 = icmp sgt i32 %66, %93
  %smax = select i1 %94, i32 %66, i32 %93
  br label %for.cond99.for.end120_crit_edge

for.cond99.for.end120_crit_edge.loopexit:         ; preds = %for.inc118.us
  %95 = trunc i64 %indvars.iv.next131 to i32
  br label %for.cond99.for.end120_crit_edge

for.cond99.for.end120_crit_edge:                  ; preds = %for.cond99.for.end120_crit_edge.loopexit, %for.cond99.for.end120_crit_edge.loopexit72
  %inc116.lcssa19.lcssa = phi i32 [ 0, %for.cond99.for.end120_crit_edge.loopexit72 ], [ %66, %for.cond99.for.end120_crit_edge.loopexit ]
  %inc119.lcssa = phi i32 [ %smax, %for.cond99.for.end120_crit_edge.loopexit72 ], [ %95, %for.cond99.for.end120_crit_edge.loopexit ]
  store i32 %inc119.lcssa, i32* %r, align 4
  store i32 %inc116.lcssa19.lcssa, i32* %s, align 4
  br label %for.end120

for.end120:                                       ; preds = %for.cond99.preheader, %for.cond99.for.end120_crit_edge
  %96 = bitcast [2000 x [2000 x double]]** %B to i8**
  %97 = load i8*, i8** %96, align 8
  tail call void @free(i8* %97) #5
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
  %3 = sub i32 %1, %i.promoted38
  %4 = zext i32 %3 to i64
  %5 = add i32 %1, -1
  %6 = sub i32 %5, %i.promoted38
  %7 = zext i32 %6 to i64
  %8 = add i32 %i.promoted38, -1
  %9 = zext i32 %i.promoted38 to i64
  %10 = zext i32 %8 to i64
  %11 = sext i32 %1 to i64
  %12 = sext i32 %1 to i64
  %13 = trunc i32 %3 to i2
  %14 = sext i32 %1 to i64
  br label %for.body

for.body:                                         ; preds = %for.inc58, %for.body.lr.ph
  %indvars.iv128 = phi i32 [ %indvars.iv.next129, %for.inc58 ], [ %i.promoted38, %for.body.lr.ph ]
  %indvars.iv126.in = phi i64 [ %indvars.iv126, %for.inc58 ], [ %2, %for.body.lr.ph ]
  %indvars.iv124 = phi i2 [ %indvars.iv.next125, %for.inc58 ], [ %13, %for.body.lr.ph ]
  %indvar91 = phi i64 [ %indvar.next92, %for.inc58 ], [ 0, %for.body.lr.ph ]
  %sub47.lcssa37.lcssa45 = phi double [ %sub47.lcssa37.lcssa46, %for.inc58 ], [ %w.promoted, %for.body.lr.ph ]
  %inc49.lcssa33.lcssa40 = phi i32 [ %inc49.lcssa33.lcssa41, %for.inc58 ], [ %k.promoted, %for.body.lr.ph ]
  %indvars.iv126 = add nsw i64 %indvars.iv126.in, 1
  %15 = sext i32 %indvars.iv128 to i64
  %16 = zext i2 %indvars.iv124 to i64
  %17 = add nuw nsw i64 %16, 4294967295
  %18 = and i64 %17, 4294967295
  %19 = add i64 %indvars.iv126.in, %18
  %20 = add i64 %indvars.iv126, %18
  %21 = zext i32 %indvars.iv128 to i64
  %22 = add nuw nsw i64 %9, %indvar91
  %23 = add nuw nsw i64 %10, %indvar91
  %24 = trunc i64 %23 to i32
  %25 = sub nsw i64 %4, %indvar91
  %26 = trunc i64 %25 to i32
  %27 = sub nsw i64 %7, %indvar91
  %28 = trunc i64 %27 to i32
  %cmp26 = icmp sgt i64 %indvars.iv126.in, 0
  br i1 %cmp26, label %for.body3.preheader, label %for.end27

for.body3.preheader:                              ; preds = %for.body
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126.in, i64 0
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %for.inc25 ], [ 0, %for.body3.preheader ]
  %indvars.iv70 = phi i32 [ %indvars.iv.next71, %for.inc25 ], [ -1, %for.body3.preheader ]
  %29 = add nuw i64 %indvars.iv80, 4294967295
  %30 = add i32 %indvars.iv70, 1
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126.in, i64 %indvars.iv80
  %31 = load double, double* %arrayidx5, align 8
  %cmp75 = icmp sgt i64 %indvars.iv80, 0
  br i1 %cmp75, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.body3
  %xtraiter75112 = and i64 %indvars.iv80, 1
  %lcmp.mod76 = icmp eq i64 %xtraiter75112, 0
  br i1 %lcmp.mod76, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %32 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv80
  %33 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %32, %33
  %sub.prol = fsub double %31, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.lr.ph
  %indvars.iv68.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %sub25.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %31, %for.inc.lr.ph ]
  %sub.lcssa29.ph.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.lr.ph ]
  %34 = trunc i64 %29 to i32
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %for.inc25, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv68 = phi i64 [ %indvars.iv.next69.1, %for.inc ], [ %indvars.iv68.unr.ph, %for.inc.preheader ]
  %sub25 = phi double [ %sub.1, %for.inc ], [ %sub25.unr.ph, %for.inc.preheader ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126.in, i64 %indvars.iv68
  %36 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv80
  %37 = load double, double* %arrayidx16, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %38 = load <2 x double>, <2 x double>* %36, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next69, i64 %indvars.iv80
  %39 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %37, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %39, i32 1
  %mul = fmul <2 x double> %38, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %sub25, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %indvars.iv.next69.1 = add nuw nsw i64 %indvars.iv68, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next69.1, %indvars.iv80
  br i1 %exitcond.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.body3
  %sub.lcssa29 = phi double [ %31, %for.body3 ], [ %sub.lcssa29.ph.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %inc.lcssa27 = phi i32 [ 0, %for.body3 ], [ %30, %for.inc.prol.loopexit ], [ %30, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv80, i64 %indvars.iv80
  %40 = load double, double* %arrayidx20, align 8
  %div = fdiv double %sub.lcssa29, %40
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126.in, i64 %indvars.iv80
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %indvars.iv.next71 = add nsw i32 %indvars.iv70, 1
  %exitcond121 = icmp eq i64 %indvars.iv.next81, %21
  br i1 %exitcond121, label %for.end27.loopexit, label %for.body3

for.end27.loopexit:                               ; preds = %for.inc25
  br label %for.end27

for.end27:                                        ; preds = %for.end27.loopexit, %for.body
  %sub47.lcssa37.lcssa44 = phi double [ %sub47.lcssa37.lcssa45, %for.body ], [ %sub.lcssa29, %for.end27.loopexit ]
  %inc49.lcssa33.lcssa39 = phi i32 [ %inc49.lcssa33.lcssa40, %for.body ], [ %inc.lcssa27, %for.end27.loopexit ]
  %cmp298 = icmp slt i64 %indvars.iv126.in, %12
  br i1 %cmp298, label %for.body30.lr.ph, label %for.inc58

for.body30.lr.ph:                                 ; preds = %for.end27
  %cmp367 = icmp sgt i64 %indvars.iv126.in, 0
  br i1 %cmp367, label %for.body30.lr.ph.for.body30.us_crit_edge, label %for.body30.lr.ph.for.body30_crit_edge

for.body30.lr.ph.for.body30_crit_edge:            ; preds = %for.body30.lr.ph
  %xtraiter94 = and i32 %26, 3
  %lcmp.mod95 = icmp eq i32 %xtraiter94, 0
  br i1 %lcmp.mod95, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.lr.ph.for.body30_crit_edge
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol.preheader, %for.body30.prol
  %prol.iter96 = phi i32 [ %prol.iter96.sub, %for.body30.prol ], [ %xtraiter94, %for.body30.prol.preheader ]
  %prol.iter96.sub = add nsw i32 %prol.iter96, -1
  %prol.iter96.cmp = icmp eq i32 %prol.iter96.sub, 0
  br i1 %prol.iter96.cmp, label %for.body30.prol.loopexit.unr-lcssa, label %for.body30.prol, !llvm.loop !4

for.body30.prol.loopexit.unr-lcssa:               ; preds = %for.body30.prol
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126.in, i64 %19
  %41 = load double, double* %arrayidx34.prol, align 8
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.lr.ph.for.body30_crit_edge, %for.body30.prol.loopexit.unr-lcssa
  %indvars.iv87.unr = phi i64 [ %indvars.iv126.in, %for.body30.lr.ph.for.body30_crit_edge ], [ %20, %for.body30.prol.loopexit.unr-lcssa ]
  %sub47.lcssa37.lcssa46.ph48.unr = phi double [ undef, %for.body30.lr.ph.for.body30_crit_edge ], [ %41, %for.body30.prol.loopexit.unr-lcssa ]
  %42 = icmp ult i32 %28, 3
  br i1 %42, label %for.inc58, label %for.body30.preheader

for.body30.preheader:                             ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.body30.lr.ph.for.body30.us_crit_edge:         ; preds = %for.body30.lr.ph
  %xtraiter105111 = and i64 %22, 1
  %wide.trip.count103.1 = zext i32 %indvars.iv128 to i64
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126.in, i64 0
  %43 = icmp eq i64 %xtraiter105111, 0
  %44 = icmp eq i32 %24, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.inc55.us, %for.body30.lr.ph.for.body30.us_crit_edge
  %indvars.iv130 = phi i64 [ %indvars.iv.next131, %for.inc55.us ], [ %15, %for.body30.lr.ph.for.body30.us_crit_edge ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126.in, i64 %indvars.iv130
  %45 = load double, double* %arrayidx34.us, align 8
  br i1 %43, label %for.inc48.us.prol.loopexit, label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.body30.us
  %46 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv130
  %47 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %46, %47
  %sub47.us.prol = fsub double %45, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %indvars.iv97.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %sub4731.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %45, %for.body30.us ]
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  br i1 %44, label %for.inc55.us, label %for.inc48.us.preheader

for.inc48.us.preheader:                           ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.preheader, %for.inc48.us
  %indvars.iv97 = phi i64 [ %indvars.iv.next98.1, %for.inc48.us ], [ %indvars.iv97.unr.ph, %for.inc48.us.preheader ]
  %sub4731.us = phi double [ %sub47.us.1, %for.inc48.us ], [ %sub4731.us.unr.ph, %for.inc48.us.preheader ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126.in, i64 %indvars.iv97
  %48 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv130
  %49 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %50 = load <2 x double>, <2 x double>* %48, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next98, i64 %indvars.iv130
  %51 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %49, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %51, i32 1
  %mul46.us = fmul <2 x double> %50, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %sub4731.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %indvars.iv.next98.1 = add nuw nsw i64 %indvars.iv97, 2
  %exitcond104.1 = icmp eq i64 %indvars.iv.next98.1, %wide.trip.count103.1
  br i1 %exitcond104.1, label %for.inc55.us.loopexit, label %for.inc48.us

for.inc55.us.loopexit:                            ; preds = %for.inc48.us
  br label %for.inc55.us

for.inc55.us:                                     ; preds = %for.inc55.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.inc55.us.loopexit ]
  %arrayidx54.us = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126.in, i64 %indvars.iv130
  store double %sub47.us.lcssa, double* %arrayidx54.us, align 8
  %indvars.iv.next131 = add nsw i64 %indvars.iv130, 1
  %cmp29.us = icmp slt i64 %indvars.iv.next131, %14
  br i1 %cmp29.us, label %for.body30.us, label %for.inc58.loopexit

for.body30:                                       ; preds = %for.body30.preheader, %for.body30
  %indvars.iv87 = phi i64 [ %indvars.iv.next88.3, %for.body30 ], [ %indvars.iv87.unr, %for.body30.preheader ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126.in, i64 %indvars.iv87
  %52 = bitcast double* %arrayidx34 to <2 x i64>*
  %arrayidx54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126.in, i64 %indvars.iv87
  %53 = load <2 x i64>, <2 x i64>* %52, align 8
  %54 = bitcast double* %arrayidx54 to <2 x i64>*
  store <2 x i64> %53, <2 x i64>* %54, align 8
  %indvars.iv.next88.1 = add nsw i64 %indvars.iv87, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126.in, i64 %indvars.iv.next88.1
  %55 = bitcast double* %arrayidx34.2 to i64*
  %56 = load i64, i64* %55, align 8
  %arrayidx54.2 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126.in, i64 %indvars.iv.next88.1
  %57 = bitcast double* %arrayidx54.2 to i64*
  store i64 %56, i64* %57, align 8
  %indvars.iv.next88.3 = add nsw i64 %indvars.iv87, 4
  %lftr.wideiv89.3 = trunc i64 %indvars.iv.next88.3 to i32
  %exitcond90.3 = icmp eq i32 %lftr.wideiv89.3, %1
  br i1 %exitcond90.3, label %for.inc58.loopexit47.unr-lcssa, label %for.body30

for.inc58.loopexit47.unr-lcssa:                   ; preds = %for.body30
  %indvars.iv.next88.2 = add nsw i64 %indvars.iv87, 3
  %arrayidx34.3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126.in, i64 %indvars.iv.next88.2
  %58 = load double, double* %arrayidx34.3, align 8
  br label %for.inc58

for.inc58.loopexit:                               ; preds = %for.inc55.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.inc58.loopexit47.unr-lcssa, %for.body30.prol.loopexit, %for.end27
  %sub47.lcssa37.lcssa46 = phi double [ %sub47.lcssa37.lcssa44, %for.end27 ], [ %sub47.lcssa37.lcssa46.ph48.unr, %for.body30.prol.loopexit ], [ %58, %for.inc58.loopexit47.unr-lcssa ], [ %sub47.us.lcssa, %for.inc58.loopexit ]
  %inc49.lcssa33.lcssa41 = phi i32 [ %inc49.lcssa33.lcssa39, %for.end27 ], [ 0, %for.body30.prol.loopexit ], [ 0, %for.inc58.loopexit47.unr-lcssa ], [ %indvars.iv128, %for.inc58.loopexit ]
  %indvars.iv.next129 = add i32 %indvars.iv128, 1
  %cmp = icmp slt i64 %indvars.iv126, %11
  %indvar.next92 = add nuw nsw i64 %indvar91, 1
  %indvars.iv.next125 = add i2 %indvars.iv124, -1
  br i1 %cmp, label %for.body, label %for.cond.for.end60_crit_edge

for.cond.for.end60_crit_edge:                     ; preds = %for.inc58
  %59 = trunc i64 %indvars.iv126 to i32
  store i32 %59, i32* %i, align 4
  store i32 %inc49.lcssa33.lcssa41, i32* %k, align 4
  store double %sub47.lcssa37.lcssa46, double* %w, align 8
  br label %for.end60

for.end60:                                        ; preds = %entry, %for.cond.for.end60_crit_edge
  store i32 0, i32* %i, align 4
  %60 = load i32, i32* %n.addr, align 4
  %cmp624 = icmp sgt i32 %60, 0
  br i1 %cmp624, label %for.body63.lr.ph, label %for.end84.thread

for.end84.thread:                                 ; preds = %for.end60
  %sub85113 = add nsw i32 %60, -1
  store i32 %sub85113, i32* %i, align 4
  br label %for.end113

for.body63.lr.ph:                                 ; preds = %for.end60
  %61 = load double*, double** %b.addr, align 8
  %62 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %63 = load double*, double** %y.addr, align 8
  %64 = load i32, i32* %n.addr, align 4
  %i.promoted19 = load i32, i32* %i, align 4
  %65 = add i32 %i.promoted19, -1
  %66 = sext i32 %i.promoted19 to i64
  %67 = sext i32 %64 to i64
  %68 = trunc i32 %i.promoted19 to i2
  br label %for.body63

for.body63:                                       ; preds = %for.inc82, %for.body63.lr.ph
  %indvars.iv = phi i2 [ %indvars.iv.next, %for.inc82 ], [ %68, %for.body63.lr.ph ]
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.inc82 ], [ %66, %for.body63.lr.ph ]
  %indvar59 = phi i32 [ %indvar.next60, %for.inc82 ], [ 0, %for.body63.lr.ph ]
  %indvars.iv57 = phi i32 [ %indvars.iv.next58, %for.inc82 ], [ %i.promoted19, %for.body63.lr.ph ]
  %69 = zext i2 %indvars.iv to i64
  %70 = add nuw nsw i64 %69, 4294967295
  %71 = and i64 %70, 4294967295
  %72 = add nuw nsw i64 %71, 1
  %73 = add i32 %65, %indvar59
  %arrayidx65 = getelementptr inbounds double, double* %61, i64 %indvars.iv66
  %74 = load double, double* %arrayidx65, align 8
  %cmp673 = icmp sgt i64 %indvars.iv66, 0
  br i1 %cmp673, label %for.inc77.lr.ph, label %for.inc82

for.inc77.lr.ph:                                  ; preds = %for.body63
  %75 = add i32 %i.promoted19, %indvar59
  %xtraiter61 = and i32 %75, 3
  %lcmp.mod62 = icmp eq i32 %xtraiter61, 0
  br i1 %lcmp.mod62, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.lr.ph
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol.preheader, %for.inc77.prol
  %indvars.iv55.prol = phi i64 [ %indvars.iv.next56.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %sub7618.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %74, %for.inc77.prol.preheader ]
  %prol.iter64 = phi i32 [ %prol.iter64.sub, %for.inc77.prol ], [ %xtraiter61, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %62, i64 %indvars.iv66, i64 %indvars.iv55.prol
  %76 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %63, i64 %indvars.iv55.prol
  %77 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %76, %77
  %sub76.prol = fsub double %sub7618.prol, %mul75.prol
  %indvars.iv.next56.prol = add nuw nsw i64 %indvars.iv55.prol, 1
  %prol.iter64.sub = add nsw i32 %prol.iter64, -1
  %prol.iter64.cmp = icmp eq i32 %prol.iter64.sub, 0
  br i1 %prol.iter64.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !5

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.lr.ph
  %indvars.iv55.unr = phi i64 [ 0, %for.inc77.lr.ph ], [ %72, %for.inc77.prol.loopexit.loopexit ]
  %sub7618.unr = phi double [ %74, %for.inc77.lr.ph ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %sub76.lcssa23.ph.unr = phi double [ undef, %for.inc77.lr.ph ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %78 = icmp ult i32 %73, 3
  br i1 %78, label %for.inc82, label %for.inc77.preheader

for.inc77.preheader:                              ; preds = %for.inc77.prol.loopexit
  %wide.trip.count.3 = zext i32 %indvars.iv57 to i64
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77.preheader, %for.inc77
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.3, %for.inc77 ], [ %indvars.iv55.unr, %for.inc77.preheader ]
  %sub7618 = phi double [ %sub76.3, %for.inc77 ], [ %sub7618.unr, %for.inc77.preheader ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %62, i64 %indvars.iv66, i64 %indvars.iv55
  %79 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %63, i64 %indvars.iv55
  %80 = bitcast double* %arrayidx74 to <2 x double>*
  %81 = load <2 x double>, <2 x double>* %79, align 8
  %82 = load <2 x double>, <2 x double>* %80, align 8
  %mul75 = fmul <2 x double> %81, %82
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %sub7618, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %62, i64 %indvars.iv66, i64 %indvars.iv.next56.1
  %83 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %63, i64 %indvars.iv.next56.1
  %84 = bitcast double* %arrayidx74.2 to <2 x double>*
  %85 = load <2 x double>, <2 x double>* %83, align 8
  %86 = load <2 x double>, <2 x double>* %84, align 8
  %mul75.2 = fmul <2 x double> %85, %86
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %indvars.iv.next56.3 = add nsw i64 %indvars.iv55, 4
  %exitcond.365 = icmp eq i64 %indvars.iv.next56.3, %wide.trip.count.3
  br i1 %exitcond.365, label %for.inc82.loopexit, label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.inc77.prol.loopexit, %for.body63
  %sub76.lcssa23 = phi double [ %74, %for.body63 ], [ %sub76.lcssa23.ph.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %63, i64 %indvars.iv66
  store double %sub76.lcssa23, double* %arrayidx81, align 8
  %indvars.iv.next67 = add nsw i64 %indvars.iv66, 1
  %indvars.iv.next58 = add i32 %indvars.iv57, 1
  %cmp62 = icmp slt i64 %indvars.iv.next67, %67
  %indvar.next60 = add nuw i32 %indvar59, 1
  %indvars.iv.next = add i2 %indvars.iv, 1
  br i1 %cmp62, label %for.body63, label %for.end84

for.end84:                                        ; preds = %for.inc82
  store double %sub76.lcssa23, double* %w, align 8
  %.pr = load i32, i32* %n.addr, align 4
  %sub85 = add nsw i32 %.pr, -1
  store i32 %sub85, i32* %i, align 4
  %cmp872 = icmp sgt i32 %.pr, 0
  br i1 %cmp872, label %for.body88.lr.ph, label %for.end113

for.body88.lr.ph:                                 ; preds = %for.end84
  %87 = load double*, double** %y.addr, align 8
  %88 = load i32, i32* %n.addr, align 4
  %89 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %90 = load double*, double** %x.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  %91 = add i32 %i.promoted, 1
  %92 = add i32 %88, 3
  %93 = sub i32 %92, %i.promoted
  %94 = add i32 %88, -2
  %95 = sub i32 %94, %i.promoted
  %96 = sext i32 %i.promoted to i64
  %97 = sext i32 %88 to i64
  %98 = trunc i32 %93 to i2
  br label %for.body88

for.body88:                                       ; preds = %for.inc112, %for.body88.lr.ph
  %indvars.iv117 = phi i2 [ %indvars.iv.next118, %for.inc112 ], [ %98, %for.body88.lr.ph ]
  %indvars.iv115 = phi i32 [ %indvars.iv.next116, %for.inc112 ], [ %91, %for.body88.lr.ph ]
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.inc112 ], [ %96, %for.body88.lr.ph ]
  %indvar = phi i32 [ %indvar.next, %for.inc112 ], [ 0, %for.body88.lr.ph ]
  %99 = sext i32 %indvars.iv115 to i64
  %100 = add nsw i64 %99, 1
  %101 = zext i2 %indvars.iv117 to i64
  %102 = add nuw nsw i64 %101, 4294967295
  %103 = and i64 %102, 4294967295
  %104 = add nsw i64 %100, %103
  %105 = add i32 %95, %indvar
  %106 = sext i32 %indvars.iv115 to i64
  %arrayidx90 = getelementptr inbounds double, double* %87, i64 %indvars.iv52
  %107 = load double, double* %arrayidx90, align 8
  %108 = add nsw i64 %indvars.iv52, 1
  %cmp921 = icmp slt i64 %108, %97
  br i1 %cmp921, label %for.inc102.lr.ph, label %for.inc112

for.inc102.lr.ph:                                 ; preds = %for.body88
  %109 = add i32 %93, %indvar
  %xtraiter = and i32 %109, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.lr.ph
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol.preheader, %for.inc102.prol
  %indvars.iv50.prol = phi i64 [ %indvars.iv.next51.prol, %for.inc102.prol ], [ %106, %for.inc102.prol.preheader ]
  %sub10111.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %107, %for.inc102.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %89, i64 %indvars.iv52, i64 %indvars.iv50.prol
  %110 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %90, i64 %indvars.iv50.prol
  %111 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %110, %111
  %sub101.prol = fsub double %sub10111.prol, %mul100.prol
  %indvars.iv.next51.prol = add nsw i64 %indvars.iv50.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !6

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.lr.ph
  %indvars.iv50.unr = phi i64 [ %106, %for.inc102.lr.ph ], [ %104, %for.inc102.prol.loopexit.loopexit ]
  %sub10111.unr = phi double [ %107, %for.inc102.lr.ph ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %sub101.lcssa16.ph.unr = phi double [ undef, %for.inc102.lr.ph ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %112 = icmp ult i32 %105, 3
  br i1 %112, label %for.inc112, label %for.inc102.preheader

for.inc102.preheader:                             ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102.preheader, %for.inc102
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.3, %for.inc102 ], [ %indvars.iv50.unr, %for.inc102.preheader ]
  %sub10111 = phi double [ %sub101.3, %for.inc102 ], [ %sub10111.unr, %for.inc102.preheader ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %89, i64 %indvars.iv52, i64 %indvars.iv50
  %113 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %90, i64 %indvars.iv50
  %114 = bitcast double* %arrayidx99 to <2 x double>*
  %115 = load <2 x double>, <2 x double>* %113, align 8
  %116 = load <2 x double>, <2 x double>* %114, align 8
  %mul100 = fmul <2 x double> %115, %116
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %sub10111, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv50, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %89, i64 %indvars.iv52, i64 %indvars.iv.next51.1
  %117 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %90, i64 %indvars.iv.next51.1
  %118 = bitcast double* %arrayidx99.2 to <2 x double>*
  %119 = load <2 x double>, <2 x double>* %117, align 8
  %120 = load <2 x double>, <2 x double>* %118, align 8
  %mul100.2 = fmul <2 x double> %119, %120
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %indvars.iv.next51.3 = add nsw i64 %indvars.iv50, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next51.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %88
  br i1 %exitcond.3, label %for.inc112.loopexit, label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.inc102.prol.loopexit, %for.body88
  %sub101.lcssa16 = phi double [ %107, %for.body88 ], [ %sub101.lcssa16.ph.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %89, i64 %indvars.iv52, i64 %indvars.iv52
  %121 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %sub101.lcssa16, %121
  %arrayidx111 = getelementptr inbounds double, double* %90, i64 %indvars.iv52
  store double %div109, double* %arrayidx111, align 8
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, -1
  %cmp87 = icmp sgt i64 %indvars.iv52, 0
  %indvars.iv.next116 = add i32 %indvars.iv115, -1
  %indvar.next = add nuw i32 %indvar, 1
  %indvars.iv.next118 = add i2 %indvars.iv117, 1
  br i1 %cmp87, label %for.body88, label %for.cond86.for.end113_crit_edge

for.cond86.for.end113_crit_edge:                  ; preds = %for.inc112
  %122 = trunc i64 %indvars.iv.next53 to i32
  store i32 %122, i32* %i, align 4
  store double %sub101.lcssa16, double* %w, align 8
  br label %for.end113

for.end113:                                       ; preds = %for.end84.thread, %for.end84, %for.cond86.for.end113_crit_edge
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
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ %6, %for.body.lr.ph ]
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
!6 = distinct !{!6, !2}
