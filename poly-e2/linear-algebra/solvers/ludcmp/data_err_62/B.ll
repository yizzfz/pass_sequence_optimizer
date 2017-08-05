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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %call2 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %call3 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  call fastcc void @init_array([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  call void (...) @polybench_timer_start() #5
  call fastcc void @kernel_ludcmp([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  call void (...) @polybench_timer_stop() #5
  call void (...) @polybench_timer_print() #5
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call2 to double*
  call fastcc void @print_array(double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #5
  call void @free(i8* %call1) #5
  call void @free(i8* %call2) #5
  call void @free(i8* %call3) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store i32 2000, i32* %n.addr, align 4
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %entry
  %indvars.iv111 = phi i64 [ 0, %entry ], [ %indvars.iv.next112.1, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv111
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv111
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next112 = or i64 %indvars.iv111, 1
  %2 = trunc i64 %indvars.iv.next112 to i32
  %conv4 = sitofp i32 %2 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv111
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next112.1 = add nsw i64 %indvars.iv111, 2
  %3 = trunc i64 %indvars.iv.next112.1 to i32
  %conv4.1 = sitofp i32 %3 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %4 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %4, align 8
  %exitcond137.1 = icmp eq i64 %indvars.iv.next112.1, 2000
  br i1 %exitcond137.1, label %for.body12.preheader, label %for.inc

for.body12.preheader:                             ; preds = %for.inc
  br label %for.body12

for.body12:                                       ; preds = %for.body12.preheader, %for.inc44.for.body12_crit_edge
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %for.inc44.for.body12_crit_edge ], [ 0, %for.body12.preheader ]
  %5 = phi [2000 x double]* [ %11, %for.inc44.for.body12_crit_edge ], [ %A, %for.body12.preheader ]
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %for.inc44.for.body12_crit_edge ], [ 0, %for.body12.preheader ]
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %for.inc44.for.body12_crit_edge ], [ 1, %for.body12.preheader ]
  %6 = and i64 %indvars.iv133, 4294967295
  %sext = shl i64 %indvars.iv103, 32
  %7 = ashr exact i64 %sext, 32
  %cmp148 = icmp sgt i64 %indvars.iv109, -1
  br i1 %cmp148, label %for.inc25.preheader, label %for.end27

for.inc25.preheader:                              ; preds = %for.body12
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.preheader, %for.inc25
  %indvars.iv96 = phi i64 [ %indvars.iv.next97, %for.inc25 ], [ 0, %for.inc25.preheader ]
  %8 = sub nsw i64 0, %indvars.iv96
  %9 = trunc i64 %8 to i32
  %rem = srem i32 %9, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv109, i64 %indvars.iv96
  store double %add20, double* %arrayidx24, align 8
  %exitcond135 = icmp eq i64 %indvars.iv96, %6
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  br i1 %exitcond135, label %for.inc25.for.end27_crit_edge, label %for.inc25

for.inc25.for.end27_crit_edge:                    ; preds = %for.inc25
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.end27

for.end27:                                        ; preds = %for.body12, %for.inc25.for.end27_crit_edge
  %10 = phi [2000 x double]* [ %.pre, %for.inc25.for.end27_crit_edge ], [ %5, %for.body12 ]
  %indvars.iv.next110 = add i64 %indvars.iv109, 1
  %cmp309 = icmp slt i64 %indvars.iv.next110, 2000
  br i1 %cmp309, label %for.inc37.lr.ph, label %for.inc44.thread

for.inc44.thread:                                 ; preds = %for.end27
  %arrayidx43122 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv109, i64 %indvars.iv109
  store double 1.000000e+00, double* %arrayidx43122, align 8
  br label %for.end46

for.inc37.lr.ph:                                  ; preds = %for.end27
  %11 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %12 = sub nsw i64 1999, %7
  %13 = sub nsw i64 0, %7
  %xtraiter58 = and i64 %13, 7
  %lcmp.mod59 = icmp eq i64 %xtraiter58, 0
  br i1 %lcmp.mod59, label %for.inc37.prol.loopexit, label %for.inc37.prol.preheader

for.inc37.prol.preheader:                         ; preds = %for.inc37.lr.ph
  br label %for.inc37.prol

for.inc37.prol:                                   ; preds = %for.inc37.prol, %for.inc37.prol.preheader
  %indvars.iv105.prol = phi i64 [ %indvars.iv.next106.prol, %for.inc37.prol ], [ %7, %for.inc37.prol.preheader ]
  %14 = phi [2000 x double]* [ %11, %for.inc37.prol ], [ %10, %for.inc37.prol.preheader ]
  %prol.iter60 = phi i64 [ %prol.iter60.sub, %for.inc37.prol ], [ %xtraiter58, %for.inc37.prol.preheader ]
  %arrayidx36.prol = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv109, i64 %indvars.iv105.prol
  store double 0.000000e+00, double* %arrayidx36.prol, align 8
  %indvars.iv.next106.prol = add nsw i64 %indvars.iv105.prol, 1
  %prol.iter60.sub = add i64 %prol.iter60, -1
  %prol.iter60.cmp = icmp eq i64 %prol.iter60.sub, 0
  br i1 %prol.iter60.cmp, label %for.inc37.prol.loopexit.loopexit, label %for.inc37.prol, !llvm.loop !1

for.inc37.prol.loopexit.loopexit:                 ; preds = %for.inc37.prol
  br label %for.inc37.prol.loopexit

for.inc37.prol.loopexit:                          ; preds = %for.inc37.prol.loopexit.loopexit, %for.inc37.lr.ph
  %indvars.iv105.unr = phi i64 [ %7, %for.inc37.lr.ph ], [ %indvars.iv.next106.prol, %for.inc37.prol.loopexit.loopexit ]
  %.unr = phi [2000 x double]* [ %10, %for.inc37.lr.ph ], [ %11, %for.inc37.prol.loopexit.loopexit ]
  %15 = icmp ult i64 %12, 7
  br i1 %15, label %for.inc44, label %for.inc37.lr.ph.new

for.inc37.lr.ph.new:                              ; preds = %for.inc37.prol.loopexit
  br label %for.inc37

for.inc37:                                        ; preds = %for.inc37, %for.inc37.lr.ph.new
  %indvars.iv105 = phi i64 [ %indvars.iv105.unr, %for.inc37.lr.ph.new ], [ %indvars.iv.next106.7, %for.inc37 ]
  %16 = phi [2000 x double]* [ %.unr, %for.inc37.lr.ph.new ], [ %11, %for.inc37 ]
  %arrayidx36 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv109, i64 %indvars.iv105
  store double 0.000000e+00, double* %arrayidx36, align 8
  %indvars.iv.next106 = add nsw i64 %indvars.iv105, 1
  %arrayidx36.1 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv109, i64 %indvars.iv.next106
  store double 0.000000e+00, double* %arrayidx36.1, align 8
  %indvars.iv.next106.1 = add nsw i64 %indvars.iv105, 2
  %arrayidx36.2 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv109, i64 %indvars.iv.next106.1
  store double 0.000000e+00, double* %arrayidx36.2, align 8
  %indvars.iv.next106.2 = add nsw i64 %indvars.iv105, 3
  %arrayidx36.3 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv109, i64 %indvars.iv.next106.2
  store double 0.000000e+00, double* %arrayidx36.3, align 8
  %indvars.iv.next106.3 = add nsw i64 %indvars.iv105, 4
  %arrayidx36.4 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv109, i64 %indvars.iv.next106.3
  store double 0.000000e+00, double* %arrayidx36.4, align 8
  %indvars.iv.next106.4 = add nsw i64 %indvars.iv105, 5
  %arrayidx36.5 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv109, i64 %indvars.iv.next106.4
  store double 0.000000e+00, double* %arrayidx36.5, align 8
  %indvars.iv.next106.5 = add nsw i64 %indvars.iv105, 6
  %arrayidx36.6 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv109, i64 %indvars.iv.next106.5
  store double 0.000000e+00, double* %arrayidx36.6, align 8
  %indvars.iv.next106.6 = add nsw i64 %indvars.iv105, 7
  %arrayidx36.7 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv109, i64 %indvars.iv.next106.6
  store double 0.000000e+00, double* %arrayidx36.7, align 8
  %exitcond136.7 = icmp eq i64 %indvars.iv.next106.6, 1999
  %indvars.iv.next106.7 = add nsw i64 %indvars.iv105, 8
  br i1 %exitcond136.7, label %for.inc44.loopexit, label %for.inc37

for.inc44.loopexit:                               ; preds = %for.inc37
  br label %for.inc44

for.inc44:                                        ; preds = %for.inc44.loopexit, %for.inc37.prol.loopexit
  %17 = icmp slt i64 %indvars.iv.next110, 2000
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv109, i64 %indvars.iv109
  store double 1.000000e+00, double* %arrayidx43, align 8
  br i1 %17, label %for.inc44.for.body12_crit_edge, label %for.end46.loopexit

for.inc44.for.body12_crit_edge:                   ; preds = %for.inc44
  %indvars.iv.next134 = add nuw nsw i64 %6, 1
  %indvars.iv.next104 = add nsw i64 %7, 1
  br label %for.body12

for.end46.loopexit:                               ; preds = %for.inc44
  br label %for.end46

for.end46:                                        ; preds = %for.end46.loopexit, %for.inc44.thread
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %18 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %18, align 8
  %19 = bitcast i8* %call to [2000 x [2000 x double]]*
  %20 = bitcast i8* %call to [2000 x [2000 x double]]*
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  %23 = bitcast i8* %call to [2000 x [2000 x double]]*
  %24 = bitcast i8* %call to [2000 x [2000 x double]]*
  %25 = bitcast i8* %call to [2000 x [2000 x double]]*
  %26 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.body50.us

for.body50.us:                                    ; preds = %for.body50.us, %for.end46
  %indvars.iv93 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next94.7, %for.body50.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv93, i64 0
  %scevgep92 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep92, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next94 = or i64 %indvars.iv93, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv.next94, i64 0
  %scevgep92.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep92.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next94.1 = or i64 %indvars.iv93, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv.next94.1, i64 0
  %scevgep92.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep92.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next94.2 = or i64 %indvars.iv93, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv.next94.2, i64 0
  %scevgep92.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep92.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next94.3 = or i64 %indvars.iv93, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv.next94.3, i64 0
  %scevgep92.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep92.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next94.4 = or i64 %indvars.iv93, 5
  %scevgep.5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv.next94.4, i64 0
  %scevgep92.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep92.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next94.5 = or i64 %indvars.iv93, 6
  %scevgep.6 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv.next94.5, i64 0
  %scevgep92.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep92.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next94.6 = or i64 %indvars.iv93, 7
  %scevgep.7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv.next94.6, i64 0
  %scevgep92.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep92.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next94.7 = add nsw i64 %indvars.iv93, 8
  %exitcond132.7 = icmp eq i64 %indvars.iv.next94.6, 1999
  br i1 %exitcond132.7, label %for.end64, label %for.body50.us

for.end64:                                        ; preds = %for.body50.us
  %.pre118.pre = load i32, i32* %n.addr, align 4
  %27 = sext i32 %.pre118.pre to i64
  %28 = sext i32 %.pre118.pre to i64
  %cmp665 = icmp sgt i32 %.pre118.pre, 0
  br i1 %cmp665, label %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge, label %for.cond99.preheader.for.end120_crit_edge

for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge: ; preds = %for.end64
  %29 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %30 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %31 = add i32 %.pre118.pre, -1
  %32 = zext i32 %31 to i64
  %33 = add nuw nsw i64 %32, 1
  %34 = add nuw nsw i64 %32, 1
  %min.iters.check = icmp ult i64 %33, 4
  %n.vec = and i64 %33, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %33, %n.vec
  br label %for.body72.lr.ph.us

for.body72.lr.ph.us:                              ; preds = %for.inc96.us, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge
  %indvars.iv85 = phi i64 [ 0, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ], [ %indvars.iv.next86, %for.inc96.us ]
  %scevgep9 = getelementptr [2000 x double], [2000 x double]* %29, i64 0, i64 %indvars.iv85
  %35 = add i64 %indvars.iv85, 1
  %scevgep11 = getelementptr [2000 x double], [2000 x double]* %29, i64 %32, i64 %35
  br label %for.body72.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond131 = icmp eq i64 %indvars.iv.next86, %28
  br i1 %exitcond131, label %for.cond99.preheader, label %for.body72.lr.ph.us

for.body72.us.us:                                 ; preds = %for.inc93.us.us, %for.body72.lr.ph.us
  %indvars.iv83 = phi i64 [ 0, %for.body72.lr.ph.us ], [ %indvars.iv.next84, %for.inc93.us.us ]
  %scevgep5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv83, i64 0
  %scevgep7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv83, i64 %33
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv83, i64 %indvars.iv85
  br i1 %min.iters.check, label %for.inc90.us.us.preheader, label %min.iters.checked

for.inc90.us.us.preheader:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body72.us.us
  %indvars.iv79.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.body72.us.us ], [ %n.vec, %middle.block ]
  %36 = sub nsw i64 %34, %indvars.iv79.ph
  %xtraiter56 = and i64 %36, 1
  %lcmp.mod57 = icmp eq i64 %xtraiter56, 0
  br i1 %lcmp.mod57, label %for.inc90.us.us.prol.loopexit, label %for.inc90.us.us.prol

for.inc90.us.us.prol:                             ; preds = %for.inc90.us.us.preheader
  %37 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv79.ph, i64 %indvars.iv85
  %38 = load double, double* %arrayidx84.us.us.prol, align 8
  %mul.us.us.prol = fmul double %37, %38
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv83, i64 %indvars.iv79.ph
  %39 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %mul.us.us.prol, %39
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  %indvars.iv.next80.prol = or i64 %indvars.iv79.ph, 1
  br label %for.inc90.us.us.prol.loopexit

for.inc90.us.us.prol.loopexit:                    ; preds = %for.inc90.us.us.prol, %for.inc90.us.us.preheader
  %indvars.iv79.unr.ph = phi i64 [ %indvars.iv.next80.prol, %for.inc90.us.us.prol ], [ %indvars.iv79.ph, %for.inc90.us.us.preheader ]
  %40 = icmp eq i64 %32, %indvars.iv79.ph
  br i1 %40, label %for.inc93.us.us, label %for.inc90.us.us.preheader.new

for.inc90.us.us.preheader.new:                    ; preds = %for.inc90.us.us.prol.loopexit
  br label %for.inc90.us.us

min.iters.checked:                                ; preds = %for.body72.us.us
  br i1 %cmp.zero, label %for.inc90.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep5, %scevgep11
  %bound1 = icmp ult double* %scevgep9, %scevgep7
  %found.conflict = and i1 %bound0, %bound1
  %bound014 = icmp ult double* %scevgep5, %arrayidx80.us.us
  %bound115 = icmp ult double* %arrayidx80.us.us, %scevgep7
  %found.conflict16 = and i1 %bound014, %bound115
  %conflict.rdx = or i1 %found.conflict, %found.conflict16
  br i1 %conflict.rdx, label %for.inc90.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %41 = or i64 %index, 1
  %42 = or i64 %index, 2
  %43 = or i64 %index, 3
  %44 = load double, double* %arrayidx80.us.us, align 8, !alias.scope !3
  %45 = insertelement <2 x double> undef, double %44, i32 0
  %46 = shufflevector <2 x double> %45, <2 x double> undef, <2 x i32> zeroinitializer
  %47 = insertelement <2 x double> undef, double %44, i32 0
  %48 = shufflevector <2 x double> %47, <2 x double> undef, <2 x i32> zeroinitializer
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %index, i64 %indvars.iv85
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %41, i64 %indvars.iv85
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %42, i64 %indvars.iv85
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %43, i64 %indvars.iv85
  %53 = load double, double* %49, align 8, !alias.scope !6
  %54 = load double, double* %50, align 8, !alias.scope !6
  %55 = load double, double* %51, align 8, !alias.scope !6
  %56 = load double, double* %52, align 8, !alias.scope !6
  %57 = insertelement <2 x double> undef, double %53, i32 0
  %58 = insertelement <2 x double> %57, double %54, i32 1
  %59 = insertelement <2 x double> undef, double %55, i32 0
  %60 = insertelement <2 x double> %59, double %56, i32 1
  %61 = fmul <2 x double> %46, %58
  %62 = fmul <2 x double> %48, %60
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv83, i64 %index
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !8, !noalias !10
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !8, !noalias !10
  %67 = fadd <2 x double> %61, %wide.load
  %68 = fadd <2 x double> %62, %wide.load18
  %69 = bitcast double* %63 to <2 x double>*
  store <2 x double> %67, <2 x double>* %69, align 8, !alias.scope !8, !noalias !10
  %70 = bitcast double* %65 to <2 x double>*
  store <2 x double> %68, <2 x double>* %70, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %71 = icmp eq i64 %index.next, %n.vec
  br i1 %71, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc93.us.us, label %for.inc90.us.us.preheader

for.inc93.us.us.loopexit:                         ; preds = %for.inc90.us.us
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit, %for.inc90.us.us.prol.loopexit, %middle.block
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond130 = icmp eq i64 %indvars.iv.next84, %28
  br i1 %exitcond130, label %for.inc96.us, label %for.body72.us.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us, %for.inc90.us.us.preheader.new
  %indvars.iv79 = phi i64 [ %indvars.iv79.unr.ph, %for.inc90.us.us.preheader.new ], [ %indvars.iv.next80.1, %for.inc90.us.us ]
  %72 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv79, i64 %indvars.iv85
  %73 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %72, %73
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv83, i64 %indvars.iv79
  %74 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %mul.us.us, %74
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %75 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv.next80, i64 %indvars.iv85
  %76 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %75, %76
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next80
  %77 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %mul.us.us.1, %77
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %exitcond82.1 = icmp eq i64 %indvars.iv.next80, %32
  %indvars.iv.next80.1 = add nsw i64 %indvars.iv79, 2
  br i1 %exitcond82.1, label %for.inc93.us.us.loopexit, label %for.inc90.us.us, !llvm.loop !14

for.cond99.preheader:                             ; preds = %for.inc96.us
  %78 = icmp sgt i32 %.pre118.pre, 0
  br i1 %78, label %for.body102.lr.ph.for.body102.us_crit_edge, label %for.cond99.preheader.for.end120_crit_edge

for.cond99.preheader.for.end120_crit_edge:        ; preds = %for.end64, %for.cond99.preheader
  %79 = bitcast [2000 x [2000 x double]]** %B to i8**
  %.pre120 = load i8*, i8** %79, align 8
  br label %for.end120

for.body102.lr.ph.for.body102.us_crit_edge:       ; preds = %for.cond99.preheader
  %80 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %81 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %82 = add i32 %.pre118.pre, -1
  %83 = zext i32 %82 to i64
  %84 = add nuw nsw i64 %83, 1
  %85 = and i64 %33, 8589934588
  %86 = add nsw i64 %85, -4
  %87 = lshr exact i64 %86, 2
  %88 = add nuw nsw i64 %32, 1
  %min.iters.check22 = icmp ult i64 %84, 4
  %n.vec25 = and i64 %84, 8589934588
  %cmp.zero26 = icmp eq i64 %n.vec25, 0
  %89 = and i64 %87, 1
  %lcmp.mod = icmp eq i64 %89, 0
  %90 = icmp eq i64 %87, 0
  %cmp.n45 = icmp eq i64 %84, %n.vec25
  br label %for.body102.us

for.body102.us:                                   ; preds = %for.inc118.us, %for.body102.lr.ph.for.body102.us_crit_edge
  %indvars.iv77 = phi i64 [ 0, %for.body102.lr.ph.for.body102.us_crit_edge ], [ %indvars.iv.next78, %for.inc118.us ]
  %scevgep28 = getelementptr [2000 x double], [2000 x double]* %81, i64 %indvars.iv77, i64 0
  %scevgep30 = getelementptr [2000 x double], [2000 x double]* %81, i64 %indvars.iv77, i64 %84
  %scevgep32 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv77, i64 0
  %scevgep34 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv77, i64 %84
  br i1 %min.iters.check22, label %for.inc115.us.preheader, label %min.iters.checked23

min.iters.checked23:                              ; preds = %for.body102.us
  br i1 %cmp.zero26, label %for.inc115.us.preheader, label %vector.memcheck40

vector.memcheck40:                                ; preds = %min.iters.checked23
  %bound036 = icmp ult double* %scevgep28, %scevgep34
  %bound137 = icmp ult double* %scevgep32, %scevgep30
  %memcheck.conflict39 = and i1 %bound036, %bound137
  br i1 %memcheck.conflict39, label %for.inc115.us.preheader, label %vector.body19.preheader

vector.body19.preheader:                          ; preds = %vector.memcheck40
  br i1 %lcmp.mod, label %vector.body19.prol, label %vector.body19.prol.loopexit

vector.body19.prol:                               ; preds = %vector.body19.preheader
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv77, i64 0
  %92 = bitcast double* %91 to <2 x i64>*
  %wide.load50.prol = load <2 x i64>, <2 x i64>* %92, align 8, !alias.scope !15
  %93 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv77, i64 2
  %94 = bitcast double* %93 to <2 x i64>*
  %wide.load51.prol = load <2 x i64>, <2 x i64>* %94, align 8, !alias.scope !15
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %81, i64 %indvars.iv77, i64 0
  %96 = bitcast double* %95 to <2 x i64>*
  store <2 x i64> %wide.load50.prol, <2 x i64>* %96, align 8, !alias.scope !18, !noalias !15
  %97 = getelementptr [2000 x double], [2000 x double]* %81, i64 %indvars.iv77, i64 2
  %98 = bitcast double* %97 to <2 x i64>*
  store <2 x i64> %wide.load51.prol, <2 x i64>* %98, align 8, !alias.scope !18, !noalias !15
  br label %vector.body19.prol.loopexit

vector.body19.prol.loopexit:                      ; preds = %vector.body19.prol, %vector.body19.preheader
  %index42.unr.ph = phi i64 [ 4, %vector.body19.prol ], [ 0, %vector.body19.preheader ]
  br i1 %90, label %middle.block20, label %vector.body19.preheader.new

vector.body19.preheader.new:                      ; preds = %vector.body19.prol.loopexit
  br label %vector.body19

vector.body19:                                    ; preds = %vector.body19, %vector.body19.preheader.new
  %index42 = phi i64 [ %index42.unr.ph, %vector.body19.preheader.new ], [ %index.next43.1, %vector.body19 ]
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv77, i64 %index42
  %100 = bitcast double* %99 to <2 x i64>*
  %wide.load50 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !15
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x i64>*
  %wide.load51 = load <2 x i64>, <2 x i64>* %102, align 8, !alias.scope !15
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %81, i64 %indvars.iv77, i64 %index42
  %104 = bitcast double* %103 to <2 x i64>*
  store <2 x i64> %wide.load50, <2 x i64>* %104, align 8, !alias.scope !18, !noalias !15
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  store <2 x i64> %wide.load51, <2 x i64>* %106, align 8, !alias.scope !18, !noalias !15
  %index.next43 = add i64 %index42, 4
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv77, i64 %index.next43
  %108 = bitcast double* %107 to <2 x i64>*
  %wide.load50.1 = load <2 x i64>, <2 x i64>* %108, align 8, !alias.scope !15
  %109 = getelementptr double, double* %107, i64 2
  %110 = bitcast double* %109 to <2 x i64>*
  %wide.load51.1 = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !15
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %81, i64 %indvars.iv77, i64 %index.next43
  %112 = bitcast double* %111 to <2 x i64>*
  store <2 x i64> %wide.load50.1, <2 x i64>* %112, align 8, !alias.scope !18, !noalias !15
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x i64>*
  store <2 x i64> %wide.load51.1, <2 x i64>* %114, align 8, !alias.scope !18, !noalias !15
  %index.next43.1 = add i64 %index42, 8
  %115 = icmp eq i64 %index.next43.1, %n.vec25
  br i1 %115, label %middle.block20.loopexit, label %vector.body19, !llvm.loop !20

middle.block20.loopexit:                          ; preds = %vector.body19
  br label %middle.block20

middle.block20:                                   ; preds = %middle.block20.loopexit, %vector.body19.prol.loopexit
  br i1 %cmp.n45, label %for.inc118.us, label %for.inc115.us.preheader

for.inc115.us.preheader:                          ; preds = %middle.block20, %vector.memcheck40, %min.iters.checked23, %for.body102.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck40 ], [ 0, %min.iters.checked23 ], [ 0, %for.body102.us ], [ %n.vec25, %middle.block20 ]
  %116 = sub nsw i64 %88, %indvars.iv.ph
  %117 = sub nsw i64 %32, %indvars.iv.ph
  %xtraiter54 = and i64 %116, 3
  %lcmp.mod55 = icmp eq i64 %xtraiter54, 0
  br i1 %lcmp.mod55, label %for.inc115.us.prol.loopexit, label %for.inc115.us.prol.preheader

for.inc115.us.prol.preheader:                     ; preds = %for.inc115.us.preheader
  br label %for.inc115.us.prol

for.inc115.us.prol:                               ; preds = %for.inc115.us.prol, %for.inc115.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc115.us.prol ], [ %indvars.iv.ph, %for.inc115.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc115.us.prol ], [ %xtraiter54, %for.inc115.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv77, i64 %indvars.iv.prol
  %118 = bitcast double* %arrayidx110.us.prol to i64*
  %119 = load i64, i64* %118, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %81, i64 %indvars.iv77, i64 %indvars.iv.prol
  %120 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %119, i64* %120, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc115.us.prol.loopexit.loopexit, label %for.inc115.us.prol, !llvm.loop !21

for.inc115.us.prol.loopexit.loopexit:             ; preds = %for.inc115.us.prol
  br label %for.inc115.us.prol.loopexit

for.inc115.us.prol.loopexit:                      ; preds = %for.inc115.us.prol.loopexit.loopexit, %for.inc115.us.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.inc115.us.preheader ], [ %indvars.iv.next.prol, %for.inc115.us.prol.loopexit.loopexit ]
  %121 = icmp ult i64 %117, 3
  br i1 %121, label %for.inc118.us, label %for.inc115.us.preheader.new

for.inc115.us.preheader.new:                      ; preds = %for.inc115.us.prol.loopexit
  br label %for.inc115.us

for.inc115.us:                                    ; preds = %for.inc115.us, %for.inc115.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc115.us.preheader.new ], [ %indvars.iv.next.3, %for.inc115.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv77, i64 %indvars.iv
  %122 = bitcast double* %arrayidx110.us to i64*
  %123 = load i64, i64* %122, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %81, i64 %indvars.iv77, i64 %indvars.iv
  %124 = bitcast double* %arrayidx114.us to i64*
  store i64 %123, i64* %124, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next
  %125 = bitcast double* %arrayidx110.us.1 to i64*
  %126 = load i64, i64* %125, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %81, i64 %indvars.iv77, i64 %indvars.iv.next
  %127 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %126, i64* %127, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.1
  %128 = bitcast double* %arrayidx110.us.2 to i64*
  %129 = load i64, i64* %128, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %81, i64 %indvars.iv77, i64 %indvars.iv.next.1
  %130 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %129, i64* %130, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.2
  %131 = bitcast double* %arrayidx110.us.3 to i64*
  %132 = load i64, i64* %131, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %81, i64 %indvars.iv77, i64 %indvars.iv.next.2
  %133 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %132, i64* %133, align 8
  %exitcond.3 = icmp eq i64 %indvars.iv.next.2, %83
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond.3, label %for.inc118.us.loopexit, label %for.inc115.us, !llvm.loop !22

for.inc118.us.loopexit:                           ; preds = %for.inc115.us
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit, %for.inc115.us.prol.loopexit, %middle.block20
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond129 = icmp eq i64 %indvars.iv.next78, %27
  br i1 %exitcond129, label %for.end120.loopexit, label %for.body102.us

for.end120.loopexit:                              ; preds = %for.inc118.us
  %134 = bitcast [2000 x [2000 x double]]* %80 to i8*
  br label %for.end120

for.end120:                                       ; preds = %for.end120.loopexit, %for.cond99.preheader.for.end120_crit_edge
  %135 = phi i8* [ %.pre120, %for.cond99.preheader.for.end120_crit_edge ], [ %134, %for.end120.loopexit ]
  call void @free(i8* %135) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.inc58, %entry
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc58 ], [ 0, %entry ]
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %for.inc58 ], [ 4294967295, %entry ]
  %0 = sub i64 1999, %indvars.iv2
  %1 = and i64 %indvars.iv77, 4294967295
  %cmp26 = icmp sgt i64 %indvars.iv2, 0
  br i1 %cmp26, label %for.body3.preheader, label %for.body30.preheader

for.body3.preheader:                              ; preds = %for.body
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 0
  br label %for.body3

for.body30.preheader:                             ; preds = %for.body30.lr.ph, %for.body
  %2 = sub i64 0, %indvars.iv2
  %xtraiter12 = and i64 %2, 7
  %lcmp.mod13 = icmp eq i64 %xtraiter12, 0
  br i1 %lcmp.mod13, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.preheader
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol, %for.body30.prol.preheader
  %indvars.iv70.prol = phi i64 [ %indvars.iv.next71.prol, %for.body30.prol ], [ %indvars.iv2, %for.body30.prol.preheader ]
  %prol.iter14 = phi i64 [ %prol.iter14.sub, %for.body30.prol ], [ %xtraiter12, %for.body30.prol.preheader ]
  %indvars.iv.next71.prol = add nuw nsw i64 %indvars.iv70.prol, 1
  %prol.iter14.sub = add i64 %prol.iter14, -1
  %prol.iter14.cmp = icmp eq i64 %prol.iter14.sub, 0
  br i1 %prol.iter14.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !23

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.preheader
  %indvars.iv70.unr = phi i64 [ %indvars.iv2, %for.body30.preheader ], [ %indvars.iv.next71.prol, %for.body30.prol.loopexit.loopexit ]
  %3 = icmp ult i64 %0, 7
  br i1 %3, label %for.inc58, label %for.body30.preheader.new

for.body30.preheader.new:                         ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.inc25 ], [ 0, %for.body3.preheader ]
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.inc25 ], [ 4294967295, %for.body3.preheader ]
  %4 = and i64 %indvars.iv62, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv66
  %5 = load double, double* %arrayidx5, align 8
  %cmp75 = icmp sgt i64 %indvars.iv66, 0
  br i1 %cmp75, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  %6 = and i64 %indvars.iv62, 1
  %lcmp.mod11 = icmp eq i64 %6, 0
  br i1 %lcmp.mod11, label %for.inc.prol, label %for.inc.prol.loopexit

for.inc.prol:                                     ; preds = %for.inc.preheader
  %7 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv66
  %8 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %7, %8
  %sub.prol = fsub double %5, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv60.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %sub25.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %5, %for.inc.preheader ]
  %9 = icmp eq i64 %4, 0
  br i1 %9, label %for.inc25, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv60 = phi i64 [ %indvars.iv60.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next61.1, %for.inc ]
  %sub25 = phi double [ %sub25.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv60
  %10 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv66
  %11 = load double, double* %arrayidx16, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %12 = load <2 x double>, <2 x double>* %10, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next61, i64 %indvars.iv66
  %13 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %11, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %13, i32 1
  %mul = fmul <2 x double> %12, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %sub25, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %exitcond65.1 = icmp eq i64 %indvars.iv.next61, %4
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  br i1 %exitcond65.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.body3
  %sub.lcssa29 = phi double [ %5, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv66
  %14 = load double, double* %arrayidx20, align 8
  %div = fdiv double %sub.lcssa29, %14
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %indvars.iv.next63 = add nuw nsw i64 %4, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next67, %indvars.iv2
  br i1 %exitcond4, label %for.body30.lr.ph, label %for.body3

for.body30.lr.ph:                                 ; preds = %for.inc25
  %15 = icmp sgt i64 %indvars.iv2, 0
  br i1 %15, label %for.body30.us.preheader, label %for.body30.preheader

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %16 = and i64 %indvars.iv77, 1
  %lcmp.mod16 = icmp eq i64 %16, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 0
  %17 = icmp eq i64 %1, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.inc55.us
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %for.inc55.us ], [ %indvars.iv2, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv83
  %18 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod16, label %for.inc48.us.prol, label %for.inc48.us.prol.loopexit

for.inc48.us.prol:                                ; preds = %for.body30.us
  %19 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv83
  %20 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %19, %20
  %sub47.us.prol = fsub double %18, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  %indvars.iv75.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %sub4731.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %18, %for.body30.us ]
  br i1 %17, label %for.inc55.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %indvars.iv75 = phi i64 [ %indvars.iv75.unr.ph, %for.body30.us.new ], [ %indvars.iv.next76.1, %for.inc48.us ]
  %sub4731.us = phi double [ %sub4731.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv75
  %21 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 %indvars.iv83
  %22 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %23 = load <2 x double>, <2 x double>* %21, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next76, i64 %indvars.iv83
  %24 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %22, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %24, i32 1
  %mul46.us = fmul <2 x double> %23, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %sub4731.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %exitcond80.1 = icmp eq i64 %indvars.iv.next76, %1
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75, 2
  br i1 %exitcond80.1, label %for.inc55.us.loopexit, label %for.inc48.us

for.inc55.us.loopexit:                            ; preds = %for.inc48.us
  br label %for.inc55.us

for.inc55.us:                                     ; preds = %for.inc55.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.inc55.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next84, 2000
  br i1 %exitcond92, label %for.inc58.loopexit, label %for.body30.us

for.body30:                                       ; preds = %for.body30, %for.body30.preheader.new
  %indvars.iv70 = phi i64 [ %indvars.iv70.unr, %for.body30.preheader.new ], [ %indvars.iv.next71.7, %for.body30 ]
  %exitcond91.7 = icmp eq i64 %indvars.iv70, 1992
  %indvars.iv.next71.7 = add nsw i64 %indvars.iv70, 8
  br i1 %exitcond91.7, label %for.inc58.loopexit17, label %for.body30

for.inc58.loopexit:                               ; preds = %for.inc55.us
  br label %for.inc58

for.inc58.loopexit17:                             ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit17, %for.inc58.loopexit, %for.body30.prol.loopexit
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %indvars.iv.next78 = add nuw nsw i64 %1, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond5, label %for.body63.preheader, label %for.body

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.inc82
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %for.inc82 ], [ 4294967295, %for.body63.preheader ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.inc82 ], [ 0, %for.body63.preheader ]
  %25 = and i64 %indvars.iv88, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv58
  %26 = load double, double* %arrayidx65, align 8
  %cmp673 = icmp sgt i64 %indvars.iv58, 0
  br i1 %cmp673, label %for.inc77.preheader, label %for.inc82

for.inc77.preheader:                              ; preds = %for.body63
  %27 = add nsw i64 %indvars.iv88, 1
  %xtraiter7 = and i64 %27, 3
  %lcmp.mod8 = icmp eq i64 %xtraiter7, 0
  br i1 %lcmp.mod8, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.preheader
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol, %for.inc77.prol.preheader
  %indvars.iv52.prol = phi i64 [ %indvars.iv.next53.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %sub7618.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %26, %for.inc77.prol.preheader ]
  %prol.iter9 = phi i64 [ %prol.iter9.sub, %for.inc77.prol ], [ %xtraiter7, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv52.prol
  %28 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv52.prol
  %29 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %28, %29
  %sub76.prol = fsub double %sub7618.prol, %mul75.prol
  %indvars.iv.next53.prol = add nuw nsw i64 %indvars.iv52.prol, 1
  %prol.iter9.sub = add i64 %prol.iter9, -1
  %prol.iter9.cmp = icmp eq i64 %prol.iter9.sub, 0
  br i1 %prol.iter9.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !24

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.preheader
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %indvars.iv52.unr = phi i64 [ 0, %for.inc77.preheader ], [ %indvars.iv.next53.prol, %for.inc77.prol.loopexit.loopexit ]
  %sub7618.unr = phi double [ %26, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %30 = icmp ult i64 %25, 3
  br i1 %30, label %for.inc82, label %for.inc77.preheader.new

for.inc77.preheader.new:                          ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77, %for.inc77.preheader.new
  %indvars.iv52 = phi i64 [ %indvars.iv52.unr, %for.inc77.preheader.new ], [ %indvars.iv.next53.3, %for.inc77 ]
  %sub7618 = phi double [ %sub7618.unr, %for.inc77.preheader.new ], [ %sub76.3, %for.inc77 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv52
  %31 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv52
  %32 = bitcast double* %arrayidx74 to <2 x double>*
  %33 = load <2 x double>, <2 x double>* %31, align 8
  %34 = load <2 x double>, <2 x double>* %32, align 8
  %mul75 = fmul <2 x double> %33, %34
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %sub7618, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next53.1
  %35 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next53.1
  %36 = bitcast double* %arrayidx74.2 to <2 x double>*
  %indvars.iv.next53.2 = add nsw i64 %indvars.iv52, 3
  %37 = load <2 x double>, <2 x double>* %35, align 8
  %38 = load <2 x double>, <2 x double>* %36, align 8
  %mul75.2 = fmul <2 x double> %37, %38
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %exitcond90.3 = icmp eq i64 %indvars.iv.next53.2, %25
  %indvars.iv.next53.3 = add nsw i64 %indvars.iv52, 4
  br i1 %exitcond90.3, label %for.inc82.loopexit, label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.inc77.prol.loopexit, %for.body63
  %sub76.lcssa23 = phi double [ %26, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv58
  store double %sub76.lcssa23, double* %arrayidx81, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %indvars.iv.next89 = add nuw nsw i64 %25, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next59, 2000
  br i1 %exitcond1, label %for.body88.preheader, label %for.body63

for.body88.preheader:                             ; preds = %for.inc82
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.inc112.for.body88_crit_edge
  %indvar = phi i32 [ 0, %for.body88.preheader ], [ %indvar.next, %for.inc112.for.body88_crit_edge ]
  %indvars.iv49 = phi i64 [ 1999, %for.body88.preheader ], [ %indvars.iv.next50, %for.inc112.for.body88_crit_edge ]
  %indvars.iv = phi i32 [ 2000, %for.body88.preheader ], [ %indvars.iv.next, %for.inc112.for.body88_crit_edge ]
  %39 = sub i32 2000, %indvar
  %40 = sext i32 %39 to i64
  %41 = sub nsw i64 1999, %40
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv49
  %42 = load double, double* %arrayidx90, align 8
  %43 = add nsw i64 %indvars.iv49, 1
  %cmp921 = icmp slt i64 %43, 2000
  br i1 %cmp921, label %for.inc102.lr.ph, label %for.inc112

for.inc102.lr.ph:                                 ; preds = %for.body88
  %44 = sext i32 %indvars.iv to i64
  %45 = sub nsw i64 0, %40
  %xtraiter = and i64 %45, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.lr.ph
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol, %for.inc102.prol.preheader
  %indvars.iv47.prol = phi i64 [ %indvars.iv.next48.prol, %for.inc102.prol ], [ %44, %for.inc102.prol.preheader ]
  %sub10111.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %42, %for.inc102.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv47.prol
  %46 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv47.prol
  %47 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %46, %47
  %sub101.prol = fsub double %sub10111.prol, %mul100.prol
  %indvars.iv.next48.prol = add nsw i64 %indvars.iv47.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !25

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.lr.ph
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.lr.ph ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %indvars.iv47.unr = phi i64 [ %44, %for.inc102.lr.ph ], [ %indvars.iv.next48.prol, %for.inc102.prol.loopexit.loopexit ]
  %sub10111.unr = phi double [ %42, %for.inc102.lr.ph ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %48 = icmp ult i64 %41, 3
  br i1 %48, label %for.inc112, label %for.inc102.lr.ph.new

for.inc102.lr.ph.new:                             ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102, %for.inc102.lr.ph.new
  %indvars.iv47 = phi i64 [ %indvars.iv47.unr, %for.inc102.lr.ph.new ], [ %indvars.iv.next48.3, %for.inc102 ]
  %sub10111 = phi double [ %sub10111.unr, %for.inc102.lr.ph.new ], [ %sub101.3, %for.inc102 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv47
  %49 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv47
  %50 = bitcast double* %arrayidx99 to <2 x double>*
  %51 = load <2 x double>, <2 x double>* %49, align 8
  %52 = load <2 x double>, <2 x double>* %50, align 8
  %mul100 = fmul <2 x double> %51, %52
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %sub10111, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv.next48.1
  %53 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next48.1
  %54 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next48.2 = add nsw i64 %indvars.iv47, 3
  %55 = load <2 x double>, <2 x double>* %53, align 8
  %56 = load <2 x double>, <2 x double>* %54, align 8
  %mul100.2 = fmul <2 x double> %55, %56
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %exitcond.3 = icmp eq i64 %indvars.iv.next48.2, 1999
  %indvars.iv.next48.3 = add nsw i64 %indvars.iv47, 4
  br i1 %exitcond.3, label %for.inc112.loopexit, label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.inc102.prol.loopexit, %for.body88
  %sub101.lcssa16 = phi double [ %42, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv49
  %57 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %sub101.lcssa16, %57
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv49
  store double %div109, double* %arrayidx111, align 8
  %cmp87 = icmp sgt i64 %indvars.iv49, 0
  br i1 %cmp87, label %for.inc112.for.body88_crit_edge, label %for.end113

for.inc112.for.body88_crit_edge:                  ; preds = %for.inc112
  %indvars.iv.next50 = add i64 %indvars.iv49, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %for.body88

for.end113:                                       ; preds = %for.inc112
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
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
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !2}
!22 = distinct !{!22, !12, !13}
!23 = distinct !{!23, !2}
!24 = distinct !{!24, !2}
!25 = distinct !{!25, !2}
