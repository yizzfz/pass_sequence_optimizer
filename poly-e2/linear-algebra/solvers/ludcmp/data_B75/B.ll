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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #5
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 2000, double* %arraydecay5)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #5
  tail call void @free(i8* %call1) #5
  tail call void @free(i8* %call2) #5
  tail call void @free(i8* %call3) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store i32 %n, i32* %n.addr, align 4
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  %conv = sitofp i32 %n to double
  %cmp15 = icmp sgt i32 %n, 0
  br i1 %cmp15, label %for.inc.lr.ph, label %for.end46

for.inc.lr.ph:                                    ; preds = %entry
  %0 = sext i32 %n to i64
  %xtraiter216 = and i64 %0, 1
  %lcmp.mod217 = icmp eq i64 %xtraiter216, 0
  br i1 %lcmp.mod217, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  store double 0.000000e+00, double* %x, align 8
  store double 0.000000e+00, double* %y, align 8
  %div.prol = fdiv double 1.000000e+00, %conv
  %div5.prol = fmul double %div.prol, 5.000000e-01
  %add6.prol = fadd double %div5.prol, 4.000000e+00
  store double %add6.prol, double* %b, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.lr.ph, %for.inc.prol
  %indvars.iv111.unr = phi i64 [ 0, %for.inc.lr.ph ], [ 1, %for.inc.prol ]
  %1 = icmp eq i32 %n, 1
  br i1 %1, label %for.body12.lr.ph, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  %div.v.i1.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i1.2 = insertelement <2 x double> %div.v.i1.1, double %conv, i32 1
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %indvars.iv111 = phi i64 [ %indvars.iv111.unr, %for.inc.lr.ph.new ], [ %indvars.iv.next112.1, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv111
  %2 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv111
  %3 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %4 = trunc i64 %indvars.iv.next112 to i32
  %conv4 = sitofp i32 %4 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv111
  store <2 x double> zeroinitializer, <2 x double>* %2, align 8
  store <2 x double> zeroinitializer, <2 x double>* %3, align 8
  %indvars.iv.next112.1 = add nsw i64 %indvars.iv111, 2
  %5 = trunc i64 %indvars.iv.next112.1 to i32
  %conv4.1 = sitofp i32 %5 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, %div.v.i1.2
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %6 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %6, align 8
  %exitcond139.1 = icmp eq i64 %indvars.iv.next112.1, %0
  br i1 %exitcond139.1, label %for.body12.lr.ph.loopexit, label %for.inc

for.body12.lr.ph.loopexit:                        ; preds = %for.inc
  br label %for.body12.lr.ph

for.body12.lr.ph:                                 ; preds = %for.body12.lr.ph.loopexit, %for.inc.prol.loopexit
  %7 = add i32 %n, -1
  %wide.trip.count107 = sext i32 %7 to i64
  br label %for.body12

for.body12:                                       ; preds = %for.inc44, %for.body12.lr.ph
  %indvars.iv136 = phi i64 [ %indvars.iv.next137, %for.inc44 ], [ 0, %for.body12.lr.ph ]
  %8 = sub i64 %wide.trip.count107, %indvars.iv136
  %9 = add i64 %8, -4
  %10 = lshr i64 %9, 2
  %11 = add nuw nsw i64 %10, 1
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25, %for.body12
  %indvars.iv96 = phi i64 [ %indvars.iv.next97, %for.inc25 ], [ 0, %for.body12 ]
  %12 = sub nsw i64 0, %indvars.iv96
  %13 = trunc i64 %12 to i32
  %rem = srem i32 %13, %n
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, %conv
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv96
  store double %add20, double* %arrayidx24, align 8
  %exitcond130 = icmp eq i64 %indvars.iv96, %indvars.iv136
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  br i1 %exitcond130, label %for.end27, label %for.inc25

for.end27:                                        ; preds = %for.inc25
  %cmp309 = icmp slt i64 %indvars.iv.next137, %0
  br i1 %cmp309, label %for.inc37.preheader, label %for.inc44

for.inc37.preheader:                              ; preds = %for.end27
  %min.iters.check = icmp ult i64 %8, 4
  br i1 %min.iters.check, label %for.inc37.preheader205, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc37.preheader
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv.next137, %n.vec
  br i1 %cmp.zero, label %for.inc37.preheader205, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter213 = and i64 %11, 3
  %lcmp.mod214 = icmp eq i64 %xtraiter213, 0
  br i1 %lcmp.mod214, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter215 = phi i64 [ %prol.iter215.sub, %vector.body.prol ], [ %xtraiter213, %vector.body.prol.preheader ]
  %14 = add i64 %indvars.iv.next137, %index.prol
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %14
  %16 = bitcast double* %15 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %18, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter215.sub = add i64 %prol.iter215, -1
  %prol.iter215.cmp = icmp eq i64 %prol.iter215.sub, 0
  br i1 %prol.iter215.cmp, label %vector.body.prol.loopexit.loopexit, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.loopexit:               ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.loopexit ]
  %19 = icmp ult i64 %9, 12
  br i1 %19, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %20 = add i64 %indvars.iv.next137, %index
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %20
  %22 = bitcast double* %21 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %24, align 8
  %index.next = add i64 %index, 4
  %25 = add i64 %indvars.iv.next137, %index.next
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %25
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %27, align 8
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %29, align 8
  %index.next.1 = add i64 %index, 8
  %30 = add i64 %indvars.iv.next137, %index.next.1
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %30
  %32 = bitcast double* %31 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %32, align 8
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %34, align 8
  %index.next.2 = add i64 %index, 12
  %35 = add i64 %indvars.iv.next137, %index.next.2
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %35
  %37 = bitcast double* %36 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %37, align 8
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %39, align 8
  %index.next.3 = add i64 %index, 16
  %40 = icmp eq i64 %index.next.3, %n.vec
  br i1 %40, label %middle.block.loopexit, label %vector.body, !llvm.loop !3

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %8, %n.vec
  br i1 %cmp.n, label %for.inc44, label %for.inc37.preheader205

for.inc37.preheader205:                           ; preds = %middle.block, %min.iters.checked, %for.inc37.preheader
  %indvars.iv105.ph = phi i64 [ %indvars.iv.next137, %min.iters.checked ], [ %indvars.iv.next137, %for.inc37.preheader ], [ %ind.end, %middle.block ]
  br label %for.inc37

for.inc37:                                        ; preds = %for.inc37.preheader205, %for.inc37
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %for.inc37 ], [ %indvars.iv105.ph, %for.inc37.preheader205 ]
  %arrayidx36 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv105
  store double 0.000000e+00, double* %arrayidx36, align 8
  %exitcond108 = icmp eq i64 %indvars.iv105, %wide.trip.count107
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  br i1 %exitcond108, label %for.inc44.loopexit, label %for.inc37, !llvm.loop !6

for.inc44.loopexit:                               ; preds = %for.inc37
  br label %for.inc44

for.inc44:                                        ; preds = %for.inc44.loopexit, %middle.block, %for.end27
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv136
  store double 1.000000e+00, double* %arrayidx43, align 8
  %exitcond138 = icmp eq i64 %indvars.iv.next137, %0
  br i1 %exitcond138, label %for.end46.loopexit, label %for.body12

for.end46.loopexit:                               ; preds = %for.inc44
  br label %for.end46

for.end46:                                        ; preds = %for.end46.loopexit, %entry
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %41 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %41, align 8
  %42 = ptrtoint i8* %call to i64
  %43 = inttoptr i64 %42 to [2000 x [2000 x double]]*
  br i1 %cmp15, label %for.body50.lr.ph.for.body50.us_crit_edge, label %for.cond99.preheader

for.body50.lr.ph.for.body50.us_crit_edge:         ; preds = %for.end46
  %44 = add i32 %n, -1
  %45 = zext i32 %44 to i64
  %46 = shl nuw nsw i64 %45, 3
  %47 = add nuw nsw i64 %46, 8
  %48 = sext i32 %n to i64
  %49 = add nsw i64 %48, -1
  %xtraiter210 = and i64 %48, 7
  %lcmp.mod211 = icmp eq i64 %xtraiter210, 0
  br i1 %lcmp.mod211, label %for.inc62.us.prol.loopexit, label %for.inc62.us.prol.preheader

for.inc62.us.prol.preheader:                      ; preds = %for.body50.lr.ph.for.body50.us_crit_edge
  %50 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.inc62.us.prol

for.inc62.us.prol:                                ; preds = %for.inc62.us.prol, %for.inc62.us.prol.preheader
  %indvars.iv93.prol = phi i64 [ %indvars.iv.next94.prol, %for.inc62.us.prol ], [ 0, %for.inc62.us.prol.preheader ]
  %prol.iter212 = phi i64 [ %prol.iter212.sub, %for.inc62.us.prol ], [ %xtraiter210, %for.inc62.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv93.prol, i64 0
  %scevgep92.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep92.prol, i8 0, i64 %47, i32 8, i1 false)
  %indvars.iv.next94.prol = add nuw nsw i64 %indvars.iv93.prol, 1
  %prol.iter212.sub = add i64 %prol.iter212, -1
  %prol.iter212.cmp = icmp eq i64 %prol.iter212.sub, 0
  br i1 %prol.iter212.cmp, label %for.inc62.us.prol.loopexit.loopexit, label %for.inc62.us.prol, !llvm.loop !8

for.inc62.us.prol.loopexit.loopexit:              ; preds = %for.inc62.us.prol
  br label %for.inc62.us.prol.loopexit

for.inc62.us.prol.loopexit:                       ; preds = %for.inc62.us.prol.loopexit.loopexit, %for.body50.lr.ph.for.body50.us_crit_edge
  %indvars.iv93.unr = phi i64 [ 0, %for.body50.lr.ph.for.body50.us_crit_edge ], [ %indvars.iv.next94.prol, %for.inc62.us.prol.loopexit.loopexit ]
  %51 = icmp ult i64 %49, 7
  br i1 %51, label %for.end64.loopexit, label %for.body50.lr.ph.for.body50.us_crit_edge.new

for.body50.lr.ph.for.body50.us_crit_edge.new:     ; preds = %for.inc62.us.prol.loopexit
  %52 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us, %for.body50.lr.ph.for.body50.us_crit_edge.new
  %indvars.iv93 = phi i64 [ %indvars.iv93.unr, %for.body50.lr.ph.for.body50.us_crit_edge.new ], [ %indvars.iv.next94.7, %for.inc62.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv93, i64 0
  %scevgep92 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep92, i8 0, i64 %47, i32 8, i1 false)
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv.next94, i64 0
  %scevgep92.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep92.1, i8 0, i64 %47, i32 8, i1 false)
  %indvars.iv.next94.1 = add nsw i64 %indvars.iv93, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv.next94.1, i64 0
  %scevgep92.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep92.2, i8 0, i64 %47, i32 8, i1 false)
  %indvars.iv.next94.2 = add nsw i64 %indvars.iv93, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv.next94.2, i64 0
  %scevgep92.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep92.3, i8 0, i64 %47, i32 8, i1 false)
  %indvars.iv.next94.3 = add nsw i64 %indvars.iv93, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv.next94.3, i64 0
  %scevgep92.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep92.4, i8 0, i64 %47, i32 8, i1 false)
  %indvars.iv.next94.4 = add nsw i64 %indvars.iv93, 5
  %scevgep.5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv.next94.4, i64 0
  %scevgep92.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep92.5, i8 0, i64 %47, i32 8, i1 false)
  %indvars.iv.next94.5 = add nsw i64 %indvars.iv93, 6
  %scevgep.6 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv.next94.5, i64 0
  %scevgep92.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep92.6, i8 0, i64 %47, i32 8, i1 false)
  %indvars.iv.next94.6 = add nsw i64 %indvars.iv93, 7
  %scevgep.7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv.next94.6, i64 0
  %scevgep92.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep92.7, i8 0, i64 %47, i32 8, i1 false)
  %indvars.iv.next94.7 = add nsw i64 %indvars.iv93, 8
  %exitcond135.7 = icmp eq i64 %indvars.iv.next94.7, %48
  br i1 %exitcond135.7, label %for.end64.loopexit.loopexit, label %for.inc62.us

for.end64.loopexit.loopexit:                      ; preds = %for.inc62.us
  br label %for.end64.loopexit

for.end64.loopexit:                               ; preds = %for.end64.loopexit.loopexit, %for.inc62.us.prol.loopexit
  br i1 true, label %for.cond69.preheader.lr.ph, label %for.end64.loopexit.for.cond99.preheader_crit_edge

for.end64.loopexit.for.cond99.preheader_crit_edge: ; preds = %for.end64.loopexit
  br label %for.cond99.preheader

for.cond69.preheader.lr.ph:                       ; preds = %for.end64.loopexit
  %53 = add nuw nsw i64 %45, 1
  %min.iters.check144 = icmp ult i64 %53, 4
  %n.vec147 = and i64 %53, 8589934588
  %cmp.zero148 = icmp eq i64 %n.vec147, 0
  %cmp.n166 = icmp eq i64 %53, %n.vec147
  br label %for.cond69.preheader.us

for.cond69.preheader.us:                          ; preds = %for.inc96.us, %for.cond69.preheader.lr.ph
  %indvars.iv85 = phi i64 [ 0, %for.cond69.preheader.lr.ph ], [ %54, %for.inc96.us ]
  %scevgep154 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv85
  %54 = add i64 %indvars.iv85, 1
  %scevgep156 = getelementptr [2000 x double], [2000 x double]* %A, i64 %45, i64 %54
  br label %for.body72.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %exitcond134 = icmp eq i64 %54, %48
  br i1 %exitcond134, label %for.cond99.preheader.loopexit, label %for.cond69.preheader.us

for.body72.us.us:                                 ; preds = %for.inc93.us.us, %for.cond69.preheader.us
  %indvars.iv83 = phi i64 [ 0, %for.cond69.preheader.us ], [ %indvars.iv.next84, %for.inc93.us.us ]
  %scevgep150 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv83, i64 0
  %scevgep152 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv83, i64 %53
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv83, i64 %indvars.iv85
  br i1 %min.iters.check144, label %for.inc90.us.us.preheader, label %min.iters.checked145

for.inc90.us.us.preheader:                        ; preds = %middle.block142, %vector.memcheck, %min.iters.checked145, %for.body72.us.us
  %indvars.iv79.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked145 ], [ 0, %for.body72.us.us ], [ %n.vec147, %middle.block142 ]
  %55 = sub nsw i64 %53, %indvars.iv79.ph
  %xtraiter208 = and i64 %55, 1
  %lcmp.mod209 = icmp eq i64 %xtraiter208, 0
  br i1 %lcmp.mod209, label %for.inc90.us.us.prol.loopexit, label %for.inc90.us.us.prol

for.inc90.us.us.prol:                             ; preds = %for.inc90.us.us.preheader
  %56 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv79.ph, i64 %indvars.iv85
  %57 = load double, double* %arrayidx84.us.us.prol, align 8
  %mul.us.us.prol = fmul double %56, %57
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv83, i64 %indvars.iv79.ph
  %58 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %58, %mul.us.us.prol
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  %indvars.iv.next80.prol = or i64 %indvars.iv79.ph, 1
  br label %for.inc90.us.us.prol.loopexit

for.inc90.us.us.prol.loopexit:                    ; preds = %for.inc90.us.us.prol, %for.inc90.us.us.preheader
  %indvars.iv79.unr.ph = phi i64 [ %indvars.iv.next80.prol, %for.inc90.us.us.prol ], [ %indvars.iv79.ph, %for.inc90.us.us.preheader ]
  %59 = icmp eq i64 %45, %indvars.iv79.ph
  br i1 %59, label %for.inc93.us.us, label %for.inc90.us.us.preheader.new

for.inc90.us.us.preheader.new:                    ; preds = %for.inc90.us.us.prol.loopexit
  br label %for.inc90.us.us

min.iters.checked145:                             ; preds = %for.body72.us.us
  br i1 %cmp.zero148, label %for.inc90.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked145
  %bound0 = icmp ult double* %scevgep150, %scevgep156
  %bound1 = icmp ult double* %scevgep154, %scevgep152
  %found.conflict = and i1 %bound0, %bound1
  %bound0159 = icmp ult double* %scevgep150, %arrayidx80.us.us
  %bound1160 = icmp ult double* %arrayidx80.us.us, %scevgep152
  %found.conflict161 = and i1 %bound0159, %bound1160
  %conflict.rdx = or i1 %found.conflict, %found.conflict161
  br i1 %conflict.rdx, label %for.inc90.us.us.preheader, label %vector.body141.preheader

vector.body141.preheader:                         ; preds = %vector.memcheck
  br label %vector.body141

vector.body141:                                   ; preds = %vector.body141.preheader, %vector.body141
  %index163 = phi i64 [ %index.next164, %vector.body141 ], [ 0, %vector.body141.preheader ]
  %60 = or i64 %index163, 1
  %61 = or i64 %index163, 2
  %62 = or i64 %index163, 3
  %63 = load double, double* %arrayidx80.us.us, align 8, !alias.scope !9
  %64 = insertelement <2 x double> undef, double %63, i32 0
  %65 = shufflevector <2 x double> %64, <2 x double> undef, <2 x i32> zeroinitializer
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index163, i64 %indvars.iv85
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %60, i64 %indvars.iv85
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %61, i64 %indvars.iv85
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %62, i64 %indvars.iv85
  %70 = load double, double* %66, align 8, !alias.scope !12
  %71 = load double, double* %67, align 8, !alias.scope !12
  %72 = load double, double* %68, align 8, !alias.scope !12
  %73 = load double, double* %69, align 8, !alias.scope !12
  %74 = insertelement <2 x double> undef, double %70, i32 0
  %75 = insertelement <2 x double> %74, double %71, i32 1
  %76 = insertelement <2 x double> undef, double %72, i32 0
  %77 = insertelement <2 x double> %76, double %73, i32 1
  %78 = fmul <2 x double> %65, %75
  %79 = fmul <2 x double> %65, %77
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv83, i64 %index163
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !14, !noalias !16
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load171 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !14, !noalias !16
  %84 = fadd <2 x double> %wide.load, %78
  %85 = fadd <2 x double> %wide.load171, %79
  store <2 x double> %84, <2 x double>* %81, align 8, !alias.scope !14, !noalias !16
  store <2 x double> %85, <2 x double>* %83, align 8, !alias.scope !14, !noalias !16
  %index.next164 = add i64 %index163, 4
  %86 = icmp eq i64 %index.next164, %n.vec147
  br i1 %86, label %middle.block142, label %vector.body141, !llvm.loop !17

middle.block142:                                  ; preds = %vector.body141
  br i1 %cmp.n166, label %for.inc93.us.us, label %for.inc90.us.us.preheader

for.inc93.us.us.loopexit:                         ; preds = %for.inc90.us.us
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit, %for.inc90.us.us.prol.loopexit, %middle.block142
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond125 = icmp eq i64 %indvars.iv.next84, %48
  br i1 %exitcond125, label %for.inc96.us, label %for.body72.us.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us, %for.inc90.us.us.preheader.new
  %indvars.iv79 = phi i64 [ %indvars.iv79.unr.ph, %for.inc90.us.us.preheader.new ], [ %indvars.iv.next80.1, %for.inc90.us.us ]
  %87 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv79, i64 %indvars.iv85
  %88 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %87, %88
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv83, i64 %indvars.iv79
  %89 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %89, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %90 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next80, i64 %indvars.iv85
  %91 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %90, %91
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next80
  %92 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %92, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next80, %45
  %indvars.iv.next80.1 = add nsw i64 %indvars.iv79, 2
  br i1 %exitcond.1, label %for.inc93.us.us.loopexit, label %for.inc90.us.us, !llvm.loop !18

for.cond99.preheader.loopexit:                    ; preds = %for.inc96.us
  br label %for.cond99.preheader

for.cond99.preheader:                             ; preds = %for.end64.loopexit.for.cond99.preheader_crit_edge, %for.cond99.preheader.loopexit, %for.end46
  br i1 %cmp15, label %for.body102.lr.ph, label %for.cond99.preheader.for.end120_crit_edge

for.cond99.preheader.for.end120_crit_edge:        ; preds = %for.cond99.preheader
  %.pre = load i8*, i8** %41, align 8
  br label %for.end120

for.body102.lr.ph:                                ; preds = %for.cond99.preheader
  %93 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %94 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %95 = add i32 %n, -1
  %96 = sext i32 %n to i64
  %97 = zext i32 %95 to i64
  %98 = add nuw nsw i64 %97, 1
  %99 = and i64 %98, 8589934588
  %100 = add nsw i64 %99, -4
  %101 = lshr exact i64 %100, 2
  %min.iters.check175 = icmp ult i64 %98, 4
  %cmp.zero179 = icmp eq i64 %99, 0
  %102 = and i64 %101, 1
  %lcmp.mod = icmp eq i64 %102, 0
  %103 = icmp eq i64 %101, 0
  %cmp.n198 = icmp eq i64 %98, %99
  br label %for.body102.us

for.body102.us:                                   ; preds = %for.inc118.us, %for.body102.lr.ph
  %indvars.iv77 = phi i64 [ 0, %for.body102.lr.ph ], [ %indvars.iv.next78, %for.inc118.us ]
  %scevgep181 = getelementptr [2000 x double], [2000 x double]* %94, i64 %indvars.iv77, i64 0
  %scevgep183 = getelementptr [2000 x double], [2000 x double]* %94, i64 %indvars.iv77, i64 %98
  %scevgep185 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %93, i64 0, i64 %indvars.iv77, i64 0
  %scevgep187 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %93, i64 0, i64 %indvars.iv77, i64 %98
  br i1 %min.iters.check175, label %for.inc115.us.preheader, label %min.iters.checked176

min.iters.checked176:                             ; preds = %for.body102.us
  br i1 %cmp.zero179, label %for.inc115.us.preheader, label %vector.memcheck193

vector.memcheck193:                               ; preds = %min.iters.checked176
  %bound0189 = icmp ult double* %scevgep181, %scevgep187
  %bound1190 = icmp ult double* %scevgep185, %scevgep183
  %memcheck.conflict192 = and i1 %bound0189, %bound1190
  br i1 %memcheck.conflict192, label %for.inc115.us.preheader, label %vector.body172.preheader

vector.body172.preheader:                         ; preds = %vector.memcheck193
  br i1 %lcmp.mod, label %vector.body172.prol, label %vector.body172.prol.loopexit

vector.body172.prol:                              ; preds = %vector.body172.preheader
  %104 = bitcast double* %scevgep185 to <2 x i64>*
  %wide.load203.prol = load <2 x i64>, <2 x i64>* %104, align 8, !alias.scope !19
  %105 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %93, i64 0, i64 %indvars.iv77, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  %wide.load204.prol = load <2 x i64>, <2 x i64>* %106, align 8, !alias.scope !19
  %107 = bitcast double* %scevgep181 to <2 x i64>*
  store <2 x i64> %wide.load203.prol, <2 x i64>* %107, align 8, !alias.scope !22, !noalias !19
  %108 = getelementptr [2000 x double], [2000 x double]* %94, i64 %indvars.iv77, i64 2
  %109 = bitcast double* %108 to <2 x i64>*
  store <2 x i64> %wide.load204.prol, <2 x i64>* %109, align 8, !alias.scope !22, !noalias !19
  br label %vector.body172.prol.loopexit

vector.body172.prol.loopexit:                     ; preds = %vector.body172.prol, %vector.body172.preheader
  %index195.unr.ph = phi i64 [ 4, %vector.body172.prol ], [ 0, %vector.body172.preheader ]
  br i1 %103, label %middle.block173, label %vector.body172.preheader.new

vector.body172.preheader.new:                     ; preds = %vector.body172.prol.loopexit
  br label %vector.body172

vector.body172:                                   ; preds = %vector.body172, %vector.body172.preheader.new
  %index195 = phi i64 [ %index195.unr.ph, %vector.body172.preheader.new ], [ %index.next196.1, %vector.body172 ]
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %93, i64 0, i64 %indvars.iv77, i64 %index195
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load203 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !19
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x i64>*
  %wide.load204 = load <2 x i64>, <2 x i64>* %113, align 8, !alias.scope !19
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %94, i64 %indvars.iv77, i64 %index195
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load203, <2 x i64>* %115, align 8, !alias.scope !22, !noalias !19
  %116 = getelementptr double, double* %114, i64 2
  %117 = bitcast double* %116 to <2 x i64>*
  store <2 x i64> %wide.load204, <2 x i64>* %117, align 8, !alias.scope !22, !noalias !19
  %index.next196 = add i64 %index195, 4
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %93, i64 0, i64 %indvars.iv77, i64 %index.next196
  %119 = bitcast double* %118 to <2 x i64>*
  %wide.load203.1 = load <2 x i64>, <2 x i64>* %119, align 8, !alias.scope !19
  %120 = getelementptr double, double* %118, i64 2
  %121 = bitcast double* %120 to <2 x i64>*
  %wide.load204.1 = load <2 x i64>, <2 x i64>* %121, align 8, !alias.scope !19
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %94, i64 %indvars.iv77, i64 %index.next196
  %123 = bitcast double* %122 to <2 x i64>*
  store <2 x i64> %wide.load203.1, <2 x i64>* %123, align 8, !alias.scope !22, !noalias !19
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x i64>*
  store <2 x i64> %wide.load204.1, <2 x i64>* %125, align 8, !alias.scope !22, !noalias !19
  %index.next196.1 = add i64 %index195, 8
  %126 = icmp eq i64 %index.next196.1, %99
  br i1 %126, label %middle.block173.loopexit, label %vector.body172, !llvm.loop !24

middle.block173.loopexit:                         ; preds = %vector.body172
  br label %middle.block173

middle.block173:                                  ; preds = %middle.block173.loopexit, %vector.body172.prol.loopexit
  br i1 %cmp.n198, label %for.inc118.us, label %for.inc115.us.preheader

for.inc115.us.preheader:                          ; preds = %middle.block173, %vector.memcheck193, %min.iters.checked176, %for.body102.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck193 ], [ 0, %min.iters.checked176 ], [ 0, %for.body102.us ], [ %99, %middle.block173 ]
  %127 = sub nsw i64 %98, %indvars.iv.ph
  %128 = sub nsw i64 %97, %indvars.iv.ph
  %xtraiter206 = and i64 %127, 3
  %lcmp.mod207 = icmp eq i64 %xtraiter206, 0
  br i1 %lcmp.mod207, label %for.inc115.us.prol.loopexit, label %for.inc115.us.prol.preheader

for.inc115.us.prol.preheader:                     ; preds = %for.inc115.us.preheader
  br label %for.inc115.us.prol

for.inc115.us.prol:                               ; preds = %for.inc115.us.prol, %for.inc115.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc115.us.prol ], [ %indvars.iv.ph, %for.inc115.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc115.us.prol ], [ %xtraiter206, %for.inc115.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %93, i64 0, i64 %indvars.iv77, i64 %indvars.iv.prol
  %129 = bitcast double* %arrayidx110.us.prol to i64*
  %130 = load i64, i64* %129, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %94, i64 %indvars.iv77, i64 %indvars.iv.prol
  %131 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %130, i64* %131, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc115.us.prol.loopexit.loopexit, label %for.inc115.us.prol, !llvm.loop !25

for.inc115.us.prol.loopexit.loopexit:             ; preds = %for.inc115.us.prol
  br label %for.inc115.us.prol.loopexit

for.inc115.us.prol.loopexit:                      ; preds = %for.inc115.us.prol.loopexit.loopexit, %for.inc115.us.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.inc115.us.preheader ], [ %indvars.iv.next.prol, %for.inc115.us.prol.loopexit.loopexit ]
  %132 = icmp ult i64 %128, 3
  br i1 %132, label %for.inc118.us, label %for.inc115.us.preheader.new

for.inc115.us.preheader.new:                      ; preds = %for.inc115.us.prol.loopexit
  br label %for.inc115.us

for.inc115.us:                                    ; preds = %for.inc115.us, %for.inc115.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc115.us.preheader.new ], [ %indvars.iv.next.3, %for.inc115.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %93, i64 0, i64 %indvars.iv77, i64 %indvars.iv
  %133 = bitcast double* %arrayidx110.us to i64*
  %134 = load i64, i64* %133, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %94, i64 %indvars.iv77, i64 %indvars.iv
  %135 = bitcast double* %arrayidx114.us to i64*
  store i64 %134, i64* %135, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %93, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next
  %136 = bitcast double* %arrayidx110.us.1 to i64*
  %137 = load i64, i64* %136, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %94, i64 %indvars.iv77, i64 %indvars.iv.next
  %138 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %137, i64* %138, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %93, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.1
  %139 = bitcast double* %arrayidx110.us.2 to i64*
  %140 = load i64, i64* %139, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %94, i64 %indvars.iv77, i64 %indvars.iv.next.1
  %141 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %140, i64* %141, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %93, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.2
  %142 = bitcast double* %arrayidx110.us.3 to i64*
  %143 = load i64, i64* %142, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %94, i64 %indvars.iv77, i64 %indvars.iv.next.2
  %144 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %143, i64* %144, align 8
  %exitcond123.3 = icmp eq i64 %indvars.iv.next.2, %97
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond123.3, label %for.inc118.us.loopexit, label %for.inc115.us, !llvm.loop !26

for.inc118.us.loopexit:                           ; preds = %for.inc115.us
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit, %for.inc115.us.prol.loopexit, %middle.block173
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond133 = icmp eq i64 %indvars.iv.next78, %96
  br i1 %exitcond133, label %for.end120.loopexit, label %for.body102.us

for.end120.loopexit:                              ; preds = %for.inc118.us
  %145 = bitcast [2000 x [2000 x double]]* %93 to i8*
  br label %for.end120

for.end120:                                       ; preds = %for.end120.loopexit, %for.cond99.preheader.for.end120_crit_edge
  %146 = phi i8* [ %.pre, %for.cond99.preheader.for.end120_crit_edge ], [ %145, %for.end120.loopexit ]
  tail call void @free(i8* %146) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32 %n, [2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  %cmp9 = icmp sgt i32 %n, 0
  br i1 %cmp9, label %for.body.lr.ph, label %for.end113

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i32 %n, -1
  %1 = sext i32 %n to i64
  %2 = sext i32 %0 to i64
  %3 = add nsw i64 %2, 1
  br label %for.body

for.body:                                         ; preds = %for.inc58, %for.body.lr.ph
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %for.inc58 ], [ 0, %for.body.lr.ph ]
  %indvars.iv95 = phi i32 [ %9, %for.inc58 ], [ -1, %for.body.lr.ph ]
  %4 = add i64 %indvars.iv100, 4294967295
  %5 = and i64 %4, 4294967295
  %6 = sub i64 %3, %indvars.iv100
  %7 = sub i64 %2, %indvars.iv100
  %8 = zext i32 %indvars.iv95 to i64
  %9 = add nsw i32 %indvars.iv95, 1
  %cmp26 = icmp sgt i64 %indvars.iv100, 0
  br i1 %cmp26, label %for.body3.preheader, label %for.body30.preheader

for.body3.preheader:                              ; preds = %for.body
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv100, i64 0
  br label %for.body3

for.body30.preheader:                             ; preds = %for.body30.lr.ph.for.body30.preheader_crit_edge, %for.body
  %xtraiter110 = and i64 %6, 7
  %lcmp.mod111 = icmp eq i64 %xtraiter110, 0
  br i1 %lcmp.mod111, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.preheader
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol, %for.body30.prol.preheader
  %indvars.iv70.prol = phi i64 [ %indvars.iv.next71.prol, %for.body30.prol ], [ %indvars.iv100, %for.body30.prol.preheader ]
  %prol.iter112 = phi i64 [ %prol.iter112.sub, %for.body30.prol ], [ %xtraiter110, %for.body30.prol.preheader ]
  %indvars.iv.next71.prol = add i64 %indvars.iv70.prol, 1
  %prol.iter112.sub = add i64 %prol.iter112, -1
  %prol.iter112.cmp = icmp eq i64 %prol.iter112.sub, 0
  br i1 %prol.iter112.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !27

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.preheader
  %indvars.iv70.unr = phi i64 [ %indvars.iv100, %for.body30.preheader ], [ %indvars.iv.next71.prol, %for.body30.prol.loopexit.loopexit ]
  %10 = icmp ult i64 %7, 7
  br i1 %10, label %for.inc58, label %for.body30.preheader.new

for.body30.preheader.new:                         ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv92 = phi i32 [ %14, %for.inc25 ], [ -1, %for.body3.preheader ]
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.inc25 ], [ 0, %for.body3.preheader ]
  %11 = add i64 %indvars.iv66, 4294967295
  %12 = and i64 %11, 4294967295
  %13 = zext i32 %indvars.iv92 to i64
  %14 = add nsw i32 %indvars.iv92, 1
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv100, i64 %indvars.iv66
  %15 = load double, double* %arrayidx5, align 8
  %cmp75 = icmp sgt i64 %indvars.iv66, 0
  br i1 %cmp75, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  %16 = and i64 %11, 1
  %lcmp.mod109 = icmp eq i64 %16, 0
  br i1 %lcmp.mod109, label %for.inc.prol, label %for.inc.prol.loopexit

for.inc.prol:                                     ; preds = %for.inc.preheader
  %17 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv66
  %18 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %17, %18
  %sub.prol = fsub double %15, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv60.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %sub25.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %15, %for.inc.preheader ]
  %19 = icmp eq i64 %12, 0
  br i1 %19, label %for.inc25, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv60 = phi i64 [ %indvars.iv60.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next61.1, %for.inc ]
  %sub25 = phi double [ %sub25.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv100, i64 %indvars.iv60
  %20 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv66
  %21 = load double, double* %arrayidx16, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %22 = load <2 x double>, <2 x double>* %20, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next61, i64 %indvars.iv66
  %23 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %21, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %23, i32 1
  %mul = fmul <2 x double> %22, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %sub25, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %exitcond94.1 = icmp eq i64 %indvars.iv.next61, %13
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  br i1 %exitcond94.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.body3
  %sub.lcssa29 = phi double [ %15, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv66
  %24 = load double, double* %arrayidx20, align 8
  %div = fdiv double %sub.lcssa29, %24
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next67, %indvars.iv100
  br i1 %exitcond102, label %for.body30.lr.ph, label %for.body3

for.body30.lr.ph:                                 ; preds = %for.inc25
  br i1 true, label %for.body30.us.preheader, label %for.body30.lr.ph.for.body30.preheader_crit_edge

for.body30.lr.ph.for.body30.preheader_crit_edge:  ; preds = %for.body30.lr.ph
  br label %for.body30.preheader

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %25 = and i64 %4, 1
  %lcmp.mod114 = icmp eq i64 %25, 0
  %26 = icmp eq i64 %5, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.inc55.us
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %for.inc55.us ], [ %indvars.iv100, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv100, i64 %indvars.iv83
  %27 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod114, label %for.inc48.us.prol, label %for.inc48.us.prol.loopexit

for.inc48.us.prol:                                ; preds = %for.body30.us
  %28 = load double, double* %arrayidx12.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv83
  %29 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %28, %29
  %sub47.us.prol = fsub double %27, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  %indvars.iv75.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %sub4731.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %27, %for.body30.us ]
  br i1 %26, label %for.inc55.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %indvars.iv75 = phi i64 [ %indvars.iv75.unr.ph, %for.body30.us.new ], [ %indvars.iv.next76.1, %for.inc48.us ]
  %sub4731.us = phi double [ %sub4731.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv100, i64 %indvars.iv75
  %30 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 %indvars.iv83
  %31 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %32 = load <2 x double>, <2 x double>* %30, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next76, i64 %indvars.iv83
  %33 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %31, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %33, i32 1
  %mul46.us = fmul <2 x double> %32, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %sub4731.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %exitcond97.1 = icmp eq i64 %indvars.iv.next76, %8
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75, 2
  br i1 %exitcond97.1, label %for.inc55.us.loopexit, label %for.inc48.us

for.inc55.us.loopexit:                            ; preds = %for.inc48.us
  br label %for.inc55.us

for.inc55.us:                                     ; preds = %for.inc55.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.inc55.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next84 = add i64 %indvars.iv83, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next84, %1
  br i1 %exitcond98, label %for.inc58.loopexit, label %for.body30.us

for.body30:                                       ; preds = %for.body30, %for.body30.preheader.new
  %indvars.iv70 = phi i64 [ %indvars.iv70.unr, %for.body30.preheader.new ], [ %indvars.iv.next71.7, %for.body30 ]
  %indvars.iv.next71.6 = add i64 %indvars.iv70, 7
  %exitcond73.7 = icmp eq i64 %indvars.iv.next71.6, %2
  %indvars.iv.next71.7 = add i64 %indvars.iv70, 8
  br i1 %exitcond73.7, label %for.inc58.loopexit115, label %for.body30

for.inc58.loopexit:                               ; preds = %for.inc55.us
  br label %for.inc58

for.inc58.loopexit115:                            ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit115, %for.inc58.loopexit, %for.body30.prol.loopexit
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next101, %1
  br i1 %exitcond103, label %for.end60, label %for.body

for.end60:                                        ; preds = %for.inc58
  br i1 true, label %for.body63.lr.ph, label %for.end60.for.end113_crit_edge

for.end60.for.end113_crit_edge:                   ; preds = %for.end60
  br label %for.end113

for.body63.lr.ph:                                 ; preds = %for.end60
  br label %for.body63

for.body63:                                       ; preds = %for.inc82, %for.body63.lr.ph
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %for.inc82 ], [ 4294967295, %for.body63.lr.ph ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.inc82 ], [ 0, %for.body63.lr.ph ]
  %34 = and i64 %indvars.iv89, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv58
  %35 = load double, double* %arrayidx65, align 8
  %cmp673 = icmp sgt i64 %indvars.iv58, 0
  br i1 %cmp673, label %for.inc77.preheader, label %for.inc82

for.inc77.preheader:                              ; preds = %for.body63
  %36 = add nsw i64 %indvars.iv89, 1
  %xtraiter105 = and i64 %36, 3
  %lcmp.mod106 = icmp eq i64 %xtraiter105, 0
  br i1 %lcmp.mod106, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.preheader
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol, %for.inc77.prol.preheader
  %indvars.iv52.prol = phi i64 [ %indvars.iv.next53.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %sub7618.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %35, %for.inc77.prol.preheader ]
  %prol.iter107 = phi i64 [ %prol.iter107.sub, %for.inc77.prol ], [ %xtraiter105, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv52.prol
  %37 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv52.prol
  %38 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %37, %38
  %sub76.prol = fsub double %sub7618.prol, %mul75.prol
  %indvars.iv.next53.prol = add nuw nsw i64 %indvars.iv52.prol, 1
  %prol.iter107.sub = add i64 %prol.iter107, -1
  %prol.iter107.cmp = icmp eq i64 %prol.iter107.sub, 0
  br i1 %prol.iter107.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !28

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.preheader
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %indvars.iv52.unr = phi i64 [ 0, %for.inc77.preheader ], [ %indvars.iv.next53.prol, %for.inc77.prol.loopexit.loopexit ]
  %sub7618.unr = phi double [ %35, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %39 = icmp ult i64 %34, 3
  br i1 %39, label %for.inc82, label %for.inc77.preheader.new

for.inc77.preheader.new:                          ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77, %for.inc77.preheader.new
  %indvars.iv52 = phi i64 [ %indvars.iv52.unr, %for.inc77.preheader.new ], [ %indvars.iv.next53.3, %for.inc77 ]
  %sub7618 = phi double [ %sub7618.unr, %for.inc77.preheader.new ], [ %sub76.3, %for.inc77 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv52
  %40 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv52
  %41 = bitcast double* %arrayidx74 to <2 x double>*
  %42 = load <2 x double>, <2 x double>* %40, align 8
  %43 = load <2 x double>, <2 x double>* %41, align 8
  %mul75 = fmul <2 x double> %42, %43
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %sub7618, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next53.1
  %44 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next53.1
  %45 = bitcast double* %arrayidx74.2 to <2 x double>*
  %indvars.iv.next53.2 = add nsw i64 %indvars.iv52, 3
  %46 = load <2 x double>, <2 x double>* %44, align 8
  %47 = load <2 x double>, <2 x double>* %45, align 8
  %mul75.2 = fmul <2 x double> %46, %47
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %exitcond91.3 = icmp eq i64 %indvars.iv.next53.2, %34
  %indvars.iv.next53.3 = add nsw i64 %indvars.iv52, 4
  br i1 %exitcond91.3, label %for.inc82.loopexit, label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.inc77.prol.loopexit, %for.body63
  %sub76.lcssa23 = phi double [ %35, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv58
  store double %sub76.lcssa23, double* %arrayidx81, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %indvars.iv.next90 = add nuw nsw i64 %34, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next59, %1
  br i1 %exitcond99, label %for.body88.lr.ph, label %for.body63

for.body88.lr.ph:                                 ; preds = %for.inc82
  br label %for.body88

for.body88:                                       ; preds = %for.inc112, %for.body88.lr.ph
  %indvar = phi i32 [ %indvar.next, %for.inc112 ], [ 0, %for.body88.lr.ph ]
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.inc112 ], [ %2, %for.body88.lr.ph ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc112 ], [ %n, %for.body88.lr.ph ]
  %48 = sub i32 %n, %indvar
  %49 = sext i32 %48 to i64
  %50 = sub nsw i64 %2, %49
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv49
  %51 = load double, double* %arrayidx90, align 8
  %52 = add nsw i64 %indvars.iv49, 1
  %cmp921 = icmp slt i64 %52, %1
  br i1 %cmp921, label %for.inc102.lr.ph, label %for.inc112

for.inc102.lr.ph:                                 ; preds = %for.body88
  %53 = sub nsw i64 %3, %49
  %54 = sext i32 %indvars.iv to i64
  %xtraiter = and i64 %53, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.lr.ph
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol, %for.inc102.prol.preheader
  %indvars.iv47.prol = phi i64 [ %indvars.iv.next48.prol, %for.inc102.prol ], [ %54, %for.inc102.prol.preheader ]
  %sub10111.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %51, %for.inc102.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv47.prol
  %55 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv47.prol
  %56 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %55, %56
  %sub101.prol = fsub double %sub10111.prol, %mul100.prol
  %indvars.iv.next48.prol = add nsw i64 %indvars.iv47.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !29

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.lr.ph
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.lr.ph ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %indvars.iv47.unr = phi i64 [ %54, %for.inc102.lr.ph ], [ %indvars.iv.next48.prol, %for.inc102.prol.loopexit.loopexit ]
  %sub10111.unr = phi double [ %51, %for.inc102.lr.ph ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %57 = icmp ult i64 %50, 3
  br i1 %57, label %for.inc112, label %for.inc102.lr.ph.new

for.inc102.lr.ph.new:                             ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102, %for.inc102.lr.ph.new
  %indvars.iv47 = phi i64 [ %indvars.iv47.unr, %for.inc102.lr.ph.new ], [ %indvars.iv.next48.3, %for.inc102 ]
  %sub10111 = phi double [ %sub10111.unr, %for.inc102.lr.ph.new ], [ %sub101.3, %for.inc102 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv47
  %58 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv47
  %59 = bitcast double* %arrayidx99 to <2 x double>*
  %60 = load <2 x double>, <2 x double>* %58, align 8
  %61 = load <2 x double>, <2 x double>* %59, align 8
  %mul100 = fmul <2 x double> %60, %61
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %sub10111, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv.next48.1
  %62 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next48.1
  %63 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next48.2 = add nsw i64 %indvars.iv47, 3
  %64 = load <2 x double>, <2 x double>* %62, align 8
  %65 = load <2 x double>, <2 x double>* %63, align 8
  %mul100.2 = fmul <2 x double> %64, %65
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %exitcond.3 = icmp eq i64 %indvars.iv.next48.2, %2
  %indvars.iv.next48.3 = add nsw i64 %indvars.iv47, 4
  br i1 %exitcond.3, label %for.inc112.loopexit, label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.inc102.prol.loopexit, %for.body88
  %sub101.lcssa16 = phi double [ %51, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv49
  %66 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %sub101.lcssa16, %66
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv49
  store double %div109, double* %arrayidx111, align 8
  %indvars.iv.next50 = add nsw i64 %indvars.iv49, -1
  %cmp87 = icmp sgt i64 %indvars.iv49, 0
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp87, label %for.body88, label %for.end113.loopexit

for.end113.loopexit:                              ; preds = %for.inc112
  br label %for.end113

for.end113:                                       ; preds = %for.end60.for.end113_crit_edge, %for.end113.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %4 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #6
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
!8 = distinct !{!8, !2}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = !{!15}
!15 = distinct !{!15, !11}
!16 = !{!13, !10}
!17 = distinct !{!17, !4, !5}
!18 = distinct !{!18, !4, !5}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !4, !5}
!25 = distinct !{!25, !2}
!26 = distinct !{!26, !4, !5}
!27 = distinct !{!27, !2}
!28 = distinct !{!28, !2}
!29 = distinct !{!29, !2}
