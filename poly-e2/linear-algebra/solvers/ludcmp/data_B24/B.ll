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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %0 = bitcast i8* %call to [2000 x double]*
  %1 = bitcast i8* %call1 to double*
  %2 = bitcast i8* %call2 to double*
  %3 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %0, double* %1, double* %2, double* %3)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %0, double* %1, double* %2, double* %3)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %4 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %4, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = bitcast i8* %call2 to double*
  tail call fastcc void @print_array(i32 2000, double* %5)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store i32 2000, i32* %n.addr, align 4
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br i1 true, label %for.inc.lr.ph, label %for.end46

for.inc.lr.ph:                                    ; preds = %entry
  br i1 true, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  store double 0.000000e+00, double* %x, align 8
  store double 0.000000e+00, double* %y, align 8
  %div.prol = fdiv double 1.000000e+00, 2.000000e+03
  %div5.prol = fmul double %div.prol, 5.000000e-01
  %add6.prol = fadd double %div5.prol, 4.000000e+00
  store double %add6.prol, double* %b, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.lr.ph, %for.inc.prol
  %indvars.iv116.unr = phi i64 [ 0, %for.inc.lr.ph ], [ 1, %for.inc.prol ]
  br i1 false, label %for.cond13.preheader.lr.ph, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.cond13.preheader.lr.ph.loopexit:              ; preds = %for.inc
  br label %for.cond13.preheader.lr.ph

for.cond13.preheader.lr.ph:                       ; preds = %for.cond13.preheader.lr.ph.loopexit, %for.inc.prol.loopexit
  br label %for.cond13.preheader

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %indvars.iv116 = phi i64 [ %indvars.iv116.unr, %for.inc.lr.ph.new ], [ %indvars.iv.next117.1, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv116
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv116
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %2 = trunc i64 %indvars.iv.next117 to i32
  %conv4 = sitofp i32 %2 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv116
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next117.1 = add nsw i64 %indvars.iv116, 2
  %3 = trunc i64 %indvars.iv.next117.1 to i32
  %conv4.1 = sitofp i32 %3 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %4 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %4, align 8
  %cmp.1 = icmp slt i64 %indvars.iv.next117.1, 2000
  br i1 %cmp.1, label %for.inc, label %for.cond13.preheader.lr.ph.loopexit

for.cond13.preheader:                             ; preds = %for.inc44, %for.cond13.preheader.lr.ph
  %indvar228 = phi i64 [ %indvar.next229, %for.inc44 ], [ 0, %for.cond13.preheader.lr.ph ]
  %indvar142 = phi i32 [ %9, %for.inc44 ], [ 0, %for.cond13.preheader.lr.ph ]
  %indvars.iv133 = phi i32 [ %indvars.iv.next134, %for.inc44 ], [ 0, %for.cond13.preheader.lr.ph ]
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %for.inc44 ], [ 0, %for.cond13.preheader.lr.ph ]
  %5 = sub i64 1999, %indvar228
  %6 = add i64 %5, -4
  %7 = lshr i64 %6, 2
  %8 = add nuw nsw i64 %7, 1
  %9 = add i32 %indvar142, 1
  %10 = sext i32 %9 to i64
  %11 = sub nsw i64 2000, %10
  %12 = zext i32 %indvars.iv133 to i64
  %indvars.iv.next134 = add i32 %indvars.iv133, 1
  %13 = sext i32 %indvars.iv.next134 to i64
  %cmp1416 = icmp slt i64 %indvars.iv114, 0
  br i1 %cmp1416, label %for.end27, label %for.inc25.preheader

for.inc25.preheader:                              ; preds = %for.cond13.preheader
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.preheader, %for.inc25
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %for.inc25 ], [ 0, %for.inc25.preheader ]
  %14 = sub nsw i64 0, %indvars.iv101
  %15 = trunc i64 %14 to i32
  %rem = srem i32 %15, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv114, i64 %indvars.iv101
  store double %add20, double* %arrayidx24, align 8
  %exitcond135 = icmp eq i64 %indvars.iv101, %12
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  br i1 %exitcond135, label %for.end27.loopexit, label %for.inc25

for.end27.loopexit:                               ; preds = %for.inc25
  br label %for.end27

for.end27:                                        ; preds = %for.end27.loopexit, %for.cond13.preheader
  %indvars.iv.next115 = add nsw i64 %indvars.iv114, 1
  %cmp3018 = icmp slt i64 %indvars.iv.next115, 2000
  br i1 %cmp3018, label %for.inc37.preheader, label %for.inc44

for.inc37.preheader:                              ; preds = %for.end27
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %for.inc37.preheader215, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc37.preheader
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %13, %n.vec
  br i1 %cmp.zero, label %for.inc37.preheader215, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter230 = and i64 %8, 3
  %lcmp.mod231 = icmp eq i64 %xtraiter230, 0
  br i1 %lcmp.mod231, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter232 = phi i64 [ %prol.iter232.sub, %vector.body.prol ], [ %xtraiter230, %vector.body.prol.preheader ]
  %16 = add i64 %13, %index.prol
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv114, i64 %16
  %18 = bitcast double* %17 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %18, align 8
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %20, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter232.sub = add i64 %prol.iter232, -1
  %prol.iter232.cmp = icmp eq i64 %prol.iter232.sub, 0
  br i1 %prol.iter232.cmp, label %vector.body.prol.loopexit.loopexit, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.loopexit:               ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.loopexit ]
  %21 = icmp ult i64 %6, 12
  br i1 %21, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %22 = add i64 %13, %index
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv114, i64 %22
  %24 = bitcast double* %23 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %24, align 8
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %26, align 8
  %index.next = add i64 %index, 4
  %27 = add i64 %13, %index.next
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv114, i64 %27
  %29 = bitcast double* %28 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %29, align 8
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %31, align 8
  %index.next.1 = add i64 %index, 8
  %32 = add i64 %13, %index.next.1
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv114, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %34, align 8
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %36, align 8
  %index.next.2 = add i64 %index, 12
  %37 = add i64 %13, %index.next.2
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv114, i64 %37
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %39, align 8
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %41, align 8
  %index.next.3 = add i64 %index, 16
  %42 = icmp eq i64 %index.next.3, %n.vec
  br i1 %42, label %middle.block.loopexit, label %vector.body, !llvm.loop !3

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %11, %n.vec
  br i1 %cmp.n, label %for.inc44, label %for.inc37.preheader215

for.inc37.preheader215:                           ; preds = %middle.block, %min.iters.checked, %for.inc37.preheader
  %indvars.iv110.ph = phi i64 [ %13, %min.iters.checked ], [ %13, %for.inc37.preheader ], [ %ind.end, %middle.block ]
  br label %for.inc37

for.inc37:                                        ; preds = %for.inc37.preheader215, %for.inc37
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %for.inc37 ], [ %indvars.iv110.ph, %for.inc37.preheader215 ]
  %arrayidx36 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv114, i64 %indvars.iv110
  store double 0.000000e+00, double* %arrayidx36, align 8
  %exitcond113 = icmp eq i64 %indvars.iv110, 1999
  %indvars.iv.next111 = add nsw i64 %indvars.iv110, 1
  br i1 %exitcond113, label %for.inc44.loopexit, label %for.inc37, !llvm.loop !6

for.inc44.loopexit:                               ; preds = %for.inc37
  br label %for.inc44

for.inc44:                                        ; preds = %for.inc44.loopexit, %middle.block, %for.end27
  %43 = icmp slt i64 %indvars.iv.next115, 2000
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv114, i64 %indvars.iv114
  store double 1.000000e+00, double* %arrayidx43, align 8
  %indvar.next229 = add i64 %indvar228, 1
  br i1 %43, label %for.cond13.preheader, label %for.end46.loopexit

for.end46.loopexit:                               ; preds = %for.inc44
  br label %for.end46

for.end46:                                        ; preds = %for.end46.loopexit, %entry
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %44 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %44, align 8
  br i1 true, label %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge, label %for.cond99.preheader

for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge: ; preds = %for.end46
  br i1 true, label %for.inc62.us.prol.loopexit, label %for.inc62.us.prol.preheader

for.inc62.us.prol.preheader:                      ; preds = %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge
  %45 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.inc62.us.prol

for.inc62.us.prol:                                ; preds = %for.inc62.us.prol, %for.inc62.us.prol.preheader
  %indvars.iv98.prol = phi i64 [ %indvars.iv.next99.prol, %for.inc62.us.prol ], [ 0, %for.inc62.us.prol.preheader ]
  %indvar.prol = phi i64 [ %indvar.next.prol, %for.inc62.us.prol ], [ 0, %for.inc62.us.prol.preheader ]
  %prol.iter227 = phi i64 [ %prol.iter227.sub, %for.inc62.us.prol ], [ 0, %for.inc62.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvar.prol, i64 0
  %scevgep97.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next99.prol = add nsw i64 %indvars.iv98.prol, 1
  %indvar.next.prol = add nuw nsw i64 %indvar.prol, 1
  %prol.iter227.sub = add i64 %prol.iter227, -1
  %prol.iter227.cmp = icmp eq i64 %prol.iter227.sub, 0
  br i1 %prol.iter227.cmp, label %for.inc62.us.prol.loopexit.loopexit, label %for.inc62.us.prol, !llvm.loop !8

for.inc62.us.prol.loopexit.loopexit:              ; preds = %for.inc62.us.prol
  br label %for.inc62.us.prol.loopexit

for.inc62.us.prol.loopexit:                       ; preds = %for.inc62.us.prol.loopexit.loopexit, %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge
  %indvars.iv98.unr = phi i64 [ 0, %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge ], [ %indvars.iv.next99.prol, %for.inc62.us.prol.loopexit.loopexit ]
  %indvar.unr = phi i64 [ 0, %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge ], [ %indvar.next.prol, %for.inc62.us.prol.loopexit.loopexit ]
  br i1 false, label %for.cond65.preheader, label %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge.new

for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge.new: ; preds = %for.inc62.us.prol.loopexit
  %46 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us, %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge.new
  %indvars.iv98 = phi i64 [ %indvars.iv98.unr, %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge.new ], [ %indvars.iv.next99.3, %for.inc62.us ]
  %indvar = phi i64 [ %indvar.unr, %for.cond51.preheader.lr.ph.for.cond51.preheader.us_crit_edge.new ], [ %indvar.next.3, %for.inc62.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvar, i64 0
  %scevgep97 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next = add nuw nsw i64 %indvar, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvar.next, i64 0
  %scevgep97.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.1 = add nsw i64 %indvar, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvar.next.1, i64 0
  %scevgep97.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97.2, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.2 = add nsw i64 %indvar, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvar.next.2, i64 0
  %scevgep97.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next99.3 = add nsw i64 %indvars.iv98, 4
  %cmp48.us.3 = icmp slt i64 %indvars.iv.next99.3, 2000
  %indvar.next.3 = add nsw i64 %indvar, 4
  br i1 %cmp48.us.3, label %for.inc62.us, label %for.cond65.preheader.loopexit

for.cond65.preheader.loopexit:                    ; preds = %for.inc62.us
  br label %for.cond65.preheader

for.cond65.preheader:                             ; preds = %for.cond65.preheader.loopexit, %for.inc62.us.prol.loopexit
  %.pr124.pre = load i32, i32* %n.addr, align 4
  %47 = sext i32 %.pr124.pre to i64
  %cmp6613 = icmp sgt i32 %.pr124.pre, 0
  br i1 %cmp6613, label %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge, label %for.cond99.preheader

for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge: ; preds = %for.cond65.preheader
  %48 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %49 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %50 = add i32 %.pr124.pre, -1
  %51 = zext i32 %50 to i64
  %52 = add nuw nsw i64 %51, 1
  %53 = add nuw nsw i64 %51, 1
  %min.iters.check148 = icmp ult i64 %52, 4
  %n.vec151 = and i64 %52, 8589934588
  %cmp.zero152 = icmp eq i64 %n.vec151, 0
  %cmp.n174 = icmp eq i64 %52, %n.vec151
  br label %for.cond73.preheader.lr.ph.us

for.cond73.preheader.lr.ph.us:                    ; preds = %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge, %for.inc96.us
  %indvar160 = phi i64 [ %54, %for.inc96.us ], [ 0, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %for.inc96.us ], [ 0, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ]
  %scevgep162 = getelementptr [2000 x double], [2000 x double]* %48, i64 0, i64 %indvar160
  %54 = add i64 %indvar160, 1
  %scevgep164 = getelementptr [2000 x double], [2000 x double]* %48, i64 %51, i64 %54
  br label %for.cond73.preheader.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %indvars.iv.next91 = add nsw i64 %indvars.iv90, 1
  %cmp66.us = icmp slt i64 %indvars.iv.next91, %47
  br i1 %cmp66.us, label %for.cond73.preheader.lr.ph.us, label %for.cond99.preheader.loopexit

for.cond73.preheader.us.us:                       ; preds = %for.inc93.us.us, %for.cond73.preheader.lr.ph.us
  %indvar154 = phi i64 [ %indvar.next155, %for.inc93.us.us ], [ 0, %for.cond73.preheader.lr.ph.us ]
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %for.inc93.us.us ], [ 0, %for.cond73.preheader.lr.ph.us ]
  %scevgep156 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvar154, i64 0
  %scevgep158 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvar154, i64 %52
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %48, i64 %indvars.iv88, i64 %indvars.iv90
  br i1 %min.iters.check148, label %for.inc90.us.us.preheader, label %min.iters.checked149

for.inc90.us.us.preheader:                        ; preds = %middle.block146, %vector.memcheck, %min.iters.checked149, %for.cond73.preheader.us.us
  %indvars.iv84.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked149 ], [ 0, %for.cond73.preheader.us.us ], [ %n.vec151, %middle.block146 ]
  %55 = sub nsw i64 %53, %indvars.iv84.ph
  %xtraiter220 = and i64 %55, 1
  %lcmp.mod221 = icmp eq i64 %xtraiter220, 0
  br i1 %lcmp.mod221, label %for.inc90.us.us.prol.loopexit, label %for.inc90.us.us.prol

for.inc90.us.us.prol:                             ; preds = %for.inc90.us.us.preheader
  %56 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %48, i64 %indvars.iv84.ph, i64 %indvars.iv90
  %57 = load double, double* %arrayidx84.us.us.prol, align 8
  %mul.us.us.prol = fmul double %56, %57
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv88, i64 %indvars.iv84.ph
  %58 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %mul.us.us.prol, %58
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  %indvars.iv.next85.prol = or i64 %indvars.iv84.ph, 1
  br label %for.inc90.us.us.prol.loopexit

for.inc90.us.us.prol.loopexit:                    ; preds = %for.inc90.us.us.prol, %for.inc90.us.us.preheader
  %indvars.iv84.unr.ph = phi i64 [ %indvars.iv.next85.prol, %for.inc90.us.us.prol ], [ %indvars.iv84.ph, %for.inc90.us.us.preheader ]
  %59 = icmp eq i64 %51, %indvars.iv84.ph
  br i1 %59, label %for.inc93.us.us, label %for.inc90.us.us.preheader.new

for.inc90.us.us.preheader.new:                    ; preds = %for.inc90.us.us.prol.loopexit
  br label %for.inc90.us.us

min.iters.checked149:                             ; preds = %for.cond73.preheader.us.us
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

vector.body145:                                   ; preds = %vector.body145.preheader, %vector.body145
  %index171 = phi i64 [ %index.next172, %vector.body145 ], [ 0, %vector.body145.preheader ]
  %60 = or i64 %index171, 1
  %61 = or i64 %index171, 2
  %62 = or i64 %index171, 3
  %63 = load double, double* %arrayidx80.us.us, align 8, !alias.scope !9
  %64 = insertelement <2 x double> undef, double %63, i32 0
  %65 = shufflevector <2 x double> %64, <2 x double> undef, <2 x i32> zeroinitializer
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %48, i64 %index171, i64 %indvars.iv90
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %48, i64 %60, i64 %indvars.iv90
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %48, i64 %61, i64 %indvars.iv90
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %48, i64 %62, i64 %indvars.iv90
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
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv88, i64 %index171
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !14, !noalias !16
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load179 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !14, !noalias !16
  %84 = fadd <2 x double> %78, %wide.load
  %85 = fadd <2 x double> %79, %wide.load179
  store <2 x double> %84, <2 x double>* %81, align 8, !alias.scope !14, !noalias !16
  store <2 x double> %85, <2 x double>* %83, align 8, !alias.scope !14, !noalias !16
  %index.next172 = add i64 %index171, 4
  %86 = icmp eq i64 %index.next172, %n.vec151
  br i1 %86, label %middle.block146, label %vector.body145, !llvm.loop !17

middle.block146:                                  ; preds = %vector.body145
  br i1 %cmp.n174, label %for.inc93.us.us, label %for.inc90.us.us.preheader

for.inc93.us.us.loopexit:                         ; preds = %for.inc90.us.us
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit, %for.inc90.us.us.prol.loopexit, %middle.block146
  %indvars.iv.next89 = add nsw i64 %indvars.iv88, 1
  %exitcond130 = icmp eq i64 %indvars.iv.next89, %47
  %indvar.next155 = add i64 %indvar154, 1
  br i1 %exitcond130, label %for.inc96.us, label %for.cond73.preheader.us.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us, %for.inc90.us.us.preheader.new
  %indvars.iv84 = phi i64 [ %indvars.iv84.unr.ph, %for.inc90.us.us.preheader.new ], [ %indvars.iv.next85.1, %for.inc90.us.us ]
  %87 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %48, i64 %indvars.iv84, i64 %indvars.iv90
  %88 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %87, %88
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv88, i64 %indvars.iv84
  %89 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %mul.us.us, %89
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %90 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %48, i64 %indvars.iv.next85, i64 %indvars.iv90
  %91 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %90, %91
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv88, i64 %indvars.iv.next85
  %92 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %mul.us.us.1, %92
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next85, %51
  %indvars.iv.next85.1 = add nsw i64 %indvars.iv84, 2
  br i1 %exitcond.1, label %for.inc93.us.us.loopexit, label %for.inc90.us.us, !llvm.loop !18

for.cond99.preheader.loopexit:                    ; preds = %for.inc96.us
  br label %for.cond99.preheader

for.cond99.preheader:                             ; preds = %for.cond99.preheader.loopexit, %for.end46, %for.cond65.preheader
  %93 = phi i32 [ %.pr124.pre, %for.cond65.preheader ], [ 2000, %for.end46 ], [ %.pr124.pre, %for.cond99.preheader.loopexit ]
  %cmp10010 = icmp sgt i32 %93, 0
  br i1 %cmp10010, label %for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge, label %for.cond99.preheader.for.end120_crit_edge

for.cond99.preheader.for.end120_crit_edge:        ; preds = %for.cond99.preheader
  %94 = bitcast [2000 x [2000 x double]]** %B to i8**
  %.pre = load i8*, i8** %94, align 8
  br label %for.end120

for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge: ; preds = %for.cond99.preheader
  %95 = sext i32 %93 to i64
  %96 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %97 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %98 = add i32 %93, -1
  %99 = zext i32 %98 to i64
  %100 = add nuw nsw i64 %99, 1
  %101 = and i64 %100, 8589934588
  %102 = add nsw i64 %101, -4
  %103 = lshr exact i64 %102, 2
  %104 = add nuw nsw i64 %99, 1
  %min.iters.check183 = icmp ult i64 %100, 4
  %n.vec186 = and i64 %100, 8589934588
  %cmp.zero187 = icmp eq i64 %n.vec186, 0
  %105 = and i64 %103, 1
  %lcmp.mod = icmp eq i64 %105, 0
  %106 = icmp eq i64 %103, 0
  %cmp.n208 = icmp eq i64 %100, %n.vec186
  br label %for.cond103.preheader.us

for.cond103.preheader.us:                         ; preds = %for.inc118.us, %for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge
  %indvar189 = phi i64 [ %indvar.next190, %for.inc118.us ], [ 0, %for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge ]
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %for.inc118.us ], [ 0, %for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge ]
  %scevgep191 = getelementptr [2000 x double], [2000 x double]* %97, i64 %indvar189, i64 0
  %scevgep193 = getelementptr [2000 x double], [2000 x double]* %97, i64 %indvar189, i64 %100
  %scevgep195 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvar189, i64 0
  %scevgep197 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvar189, i64 %100
  br i1 %min.iters.check183, label %for.inc115.us.preheader, label %min.iters.checked184

min.iters.checked184:                             ; preds = %for.cond103.preheader.us
  br i1 %cmp.zero187, label %for.inc115.us.preheader, label %vector.memcheck203

vector.memcheck203:                               ; preds = %min.iters.checked184
  %bound0199 = icmp ult double* %scevgep191, %scevgep197
  %bound1200 = icmp ult double* %scevgep195, %scevgep193
  %memcheck.conflict202 = and i1 %bound0199, %bound1200
  br i1 %memcheck.conflict202, label %for.inc115.us.preheader, label %vector.body180.preheader

vector.body180.preheader:                         ; preds = %vector.memcheck203
  br i1 %lcmp.mod, label %vector.body180.prol, label %vector.body180.prol.loopexit

vector.body180.prol:                              ; preds = %vector.body180.preheader
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv82, i64 0
  %108 = bitcast double* %107 to <2 x i64>*
  %wide.load213.prol = load <2 x i64>, <2 x i64>* %108, align 8, !alias.scope !19
  %109 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv82, i64 2
  %110 = bitcast double* %109 to <2 x i64>*
  %wide.load214.prol = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !19
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv82, i64 0
  %112 = bitcast double* %111 to <2 x i64>*
  store <2 x i64> %wide.load213.prol, <2 x i64>* %112, align 8, !alias.scope !22, !noalias !19
  %113 = getelementptr [2000 x double], [2000 x double]* %97, i64 %indvars.iv82, i64 2
  %114 = bitcast double* %113 to <2 x i64>*
  store <2 x i64> %wide.load214.prol, <2 x i64>* %114, align 8, !alias.scope !22, !noalias !19
  br label %vector.body180.prol.loopexit

vector.body180.prol.loopexit:                     ; preds = %vector.body180.prol, %vector.body180.preheader
  %index205.unr.ph = phi i64 [ 4, %vector.body180.prol ], [ 0, %vector.body180.preheader ]
  br i1 %106, label %middle.block181, label %vector.body180.preheader.new

vector.body180.preheader.new:                     ; preds = %vector.body180.prol.loopexit
  br label %vector.body180

vector.body180:                                   ; preds = %vector.body180, %vector.body180.preheader.new
  %index205 = phi i64 [ %index205.unr.ph, %vector.body180.preheader.new ], [ %index.next206.1, %vector.body180 ]
  %115 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv82, i64 %index205
  %116 = bitcast double* %115 to <2 x i64>*
  %wide.load213 = load <2 x i64>, <2 x i64>* %116, align 8, !alias.scope !19
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x i64>*
  %wide.load214 = load <2 x i64>, <2 x i64>* %118, align 8, !alias.scope !19
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv82, i64 %index205
  %120 = bitcast double* %119 to <2 x i64>*
  store <2 x i64> %wide.load213, <2 x i64>* %120, align 8, !alias.scope !22, !noalias !19
  %121 = getelementptr double, double* %119, i64 2
  %122 = bitcast double* %121 to <2 x i64>*
  store <2 x i64> %wide.load214, <2 x i64>* %122, align 8, !alias.scope !22, !noalias !19
  %index.next206 = add i64 %index205, 4
  %123 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv82, i64 %index.next206
  %124 = bitcast double* %123 to <2 x i64>*
  %wide.load213.1 = load <2 x i64>, <2 x i64>* %124, align 8, !alias.scope !19
  %125 = getelementptr double, double* %123, i64 2
  %126 = bitcast double* %125 to <2 x i64>*
  %wide.load214.1 = load <2 x i64>, <2 x i64>* %126, align 8, !alias.scope !19
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv82, i64 %index.next206
  %128 = bitcast double* %127 to <2 x i64>*
  store <2 x i64> %wide.load213.1, <2 x i64>* %128, align 8, !alias.scope !22, !noalias !19
  %129 = getelementptr double, double* %127, i64 2
  %130 = bitcast double* %129 to <2 x i64>*
  store <2 x i64> %wide.load214.1, <2 x i64>* %130, align 8, !alias.scope !22, !noalias !19
  %index.next206.1 = add i64 %index205, 8
  %131 = icmp eq i64 %index.next206.1, %n.vec186
  br i1 %131, label %middle.block181.loopexit, label %vector.body180, !llvm.loop !24

middle.block181.loopexit:                         ; preds = %vector.body180
  br label %middle.block181

middle.block181:                                  ; preds = %middle.block181.loopexit, %vector.body180.prol.loopexit
  br i1 %cmp.n208, label %for.inc118.us, label %for.inc115.us.preheader

for.inc115.us.preheader:                          ; preds = %middle.block181, %vector.memcheck203, %min.iters.checked184, %for.cond103.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck203 ], [ 0, %min.iters.checked184 ], [ 0, %for.cond103.preheader.us ], [ %n.vec186, %middle.block181 ]
  %132 = sub nsw i64 %104, %indvars.iv.ph
  %133 = sub nsw i64 %99, %indvars.iv.ph
  %xtraiter218 = and i64 %132, 3
  %lcmp.mod219 = icmp eq i64 %xtraiter218, 0
  br i1 %lcmp.mod219, label %for.inc115.us.prol.loopexit, label %for.inc115.us.prol.preheader

for.inc115.us.prol.preheader:                     ; preds = %for.inc115.us.preheader
  br label %for.inc115.us.prol

for.inc115.us.prol:                               ; preds = %for.inc115.us.prol, %for.inc115.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc115.us.prol ], [ %indvars.iv.ph, %for.inc115.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc115.us.prol ], [ %xtraiter218, %for.inc115.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv82, i64 %indvars.iv.prol
  %134 = bitcast double* %arrayidx110.us.prol to i64*
  %135 = load i64, i64* %134, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv82, i64 %indvars.iv.prol
  %136 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %135, i64* %136, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc115.us.prol.loopexit.loopexit, label %for.inc115.us.prol, !llvm.loop !25

for.inc115.us.prol.loopexit.loopexit:             ; preds = %for.inc115.us.prol
  br label %for.inc115.us.prol.loopexit

for.inc115.us.prol.loopexit:                      ; preds = %for.inc115.us.prol.loopexit.loopexit, %for.inc115.us.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.inc115.us.preheader ], [ %indvars.iv.next.prol, %for.inc115.us.prol.loopexit.loopexit ]
  %137 = icmp ult i64 %133, 3
  br i1 %137, label %for.inc118.us, label %for.inc115.us.preheader.new

for.inc115.us.preheader.new:                      ; preds = %for.inc115.us.prol.loopexit
  br label %for.inc115.us

for.inc115.us:                                    ; preds = %for.inc115.us, %for.inc115.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc115.us.preheader.new ], [ %indvars.iv.next.3, %for.inc115.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv82, i64 %indvars.iv
  %138 = bitcast double* %arrayidx110.us to i64*
  %139 = load i64, i64* %138, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv82, i64 %indvars.iv
  %140 = bitcast double* %arrayidx114.us to i64*
  store i64 %139, i64* %140, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next
  %141 = bitcast double* %arrayidx110.us.1 to i64*
  %142 = load i64, i64* %141, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv82, i64 %indvars.iv.next
  %143 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %142, i64* %143, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next.1
  %144 = bitcast double* %arrayidx110.us.2 to i64*
  %145 = load i64, i64* %144, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv82, i64 %indvars.iv.next.1
  %146 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %145, i64* %146, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next.2
  %147 = bitcast double* %arrayidx110.us.3 to i64*
  %148 = load i64, i64* %147, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv82, i64 %indvars.iv.next.2
  %149 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %148, i64* %149, align 8
  %exitcond128.3 = icmp eq i64 %indvars.iv.next.2, %99
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond128.3, label %for.inc118.us.loopexit, label %for.inc115.us, !llvm.loop !26

for.inc118.us.loopexit:                           ; preds = %for.inc115.us
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit, %for.inc115.us.prol.loopexit, %middle.block181
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, 1
  %cmp100.us = icmp slt i64 %indvars.iv.next83, %95
  %indvar.next190 = add i64 %indvar189, 1
  br i1 %cmp100.us, label %for.cond103.preheader.us, label %for.end120.loopexit

for.end120.loopexit:                              ; preds = %for.inc118.us
  %150 = bitcast [2000 x [2000 x double]]* %96 to i8*
  br label %for.end120

for.end120:                                       ; preds = %for.end120.loopexit, %for.cond99.preheader.for.end120_crit_edge
  %151 = phi i8* [ %.pre, %for.cond99.preheader.for.end120_crit_edge ], [ %150, %for.end120.loopexit ]
  tail call void @free(i8* %151) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32 %n, [2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br i1 true, label %for.cond1.preheader.lr.ph, label %for.cond61.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %for.cond1.preheader.lr.ph
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %for.inc58 ], [ 0, %for.cond1.preheader.lr.ph ]
  %indvars.iv98 = phi i32 [ %5, %for.inc58 ], [ -1, %for.cond1.preheader.lr.ph ]
  %0 = add i64 %indvars.iv102, 4294967295
  %1 = and i64 %0, 4294967295
  %2 = sub i64 2000, %indvars.iv102
  %3 = sub i64 1999, %indvars.iv102
  %4 = zext i32 %indvars.iv98 to i64
  %5 = add i32 %indvars.iv98, 1
  %cmp216 = icmp sgt i64 %indvars.iv102, 0
  br i1 %cmp216, label %for.body3.preheader, label %for.end27

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv102, i64 0
  br label %for.body3

for.cond61.preheader.loopexit:                    ; preds = %for.inc58
  br label %for.cond61.preheader

for.cond61.preheader:                             ; preds = %for.cond61.preheader.loopexit, %entry
  br i1 true, label %for.body63.lr.ph, label %for.end113

for.body63.lr.ph:                                 ; preds = %for.cond61.preheader
  br label %for.body63

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv95 = phi i32 [ %9, %for.inc25 ], [ -1, %for.body3.preheader ]
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.inc25 ], [ 0, %for.body3.preheader ]
  %6 = add i64 %indvars.iv68, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = zext i32 %indvars.iv95 to i64
  %9 = add i32 %indvars.iv95, 1
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv102, i64 %indvars.iv68
  %10 = load double, double* %arrayidx5, align 8
  %cmp715 = icmp sgt i64 %indvars.iv68, 0
  br i1 %cmp715, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.body3
  %11 = and i64 %6, 1
  %lcmp.mod110 = icmp eq i64 %11, 0
  br i1 %lcmp.mod110, label %for.inc.prol, label %for.inc.prol.loopexit

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %12 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv68
  %13 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %12, %13
  %sub.prol = fsub double %10, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.lr.ph
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.lr.ph ]
  %indvars.iv62.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %sub33.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %10, %for.inc.lr.ph ]
  %14 = icmp eq i64 %7, 0
  br i1 %14, label %for.inc25, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %indvars.iv62 = phi i64 [ %indvars.iv62.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next63.1, %for.inc ]
  %sub33 = phi double [ %sub33.unr.ph, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv102, i64 %indvars.iv62
  %15 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv62, i64 %indvars.iv68
  %16 = load double, double* %arrayidx16, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %17 = load <2 x double>, <2 x double>* %15, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next63, i64 %indvars.iv68
  %18 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %16, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %18, i32 1
  %mul = fmul <2 x double> %17, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %sub33, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %exitcond97.1 = icmp eq i64 %indvars.iv.next63, %8
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  br i1 %exitcond97.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.body3
  %19 = phi double [ %10, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 %indvars.iv68
  %20 = load double, double* %arrayidx20, align 8
  %div = fdiv double %19, %20
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next69, %indvars.iv102
  br i1 %exitcond104, label %for.end27.loopexit, label %for.body3

for.end27.loopexit:                               ; preds = %for.inc25
  br label %for.end27

for.end27:                                        ; preds = %for.end27.loopexit, %for.cond1.preheader
  %cmp2918 = icmp slt i64 %indvars.iv102, 2000
  br i1 %cmp2918, label %for.body30.lr.ph, label %for.inc58

for.body30.lr.ph:                                 ; preds = %for.end27
  %21 = icmp sgt i64 %indvars.iv102, 0
  br i1 %21, label %for.body30.us.preheader, label %for.body30.preheader

for.body30.preheader:                             ; preds = %for.body30.lr.ph
  %xtraiter111 = and i64 %2, 3
  %lcmp.mod112 = icmp eq i64 %xtraiter111, 0
  br i1 %lcmp.mod112, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.preheader
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol, %for.body30.prol.preheader
  %indvars.iv72.prol = phi i64 [ %indvars.iv.next73.prol, %for.body30.prol ], [ %indvars.iv102, %for.body30.prol.preheader ]
  %prol.iter113 = phi i64 [ %prol.iter113.sub, %for.body30.prol ], [ %xtraiter111, %for.body30.prol.preheader ]
  %indvars.iv.next73.prol = add i64 %indvars.iv72.prol, 1
  %prol.iter113.sub = add i64 %prol.iter113, -1
  %prol.iter113.cmp = icmp eq i64 %prol.iter113.sub, 0
  br i1 %prol.iter113.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !27

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.preheader
  %indvars.iv72.unr = phi i64 [ %indvars.iv102, %for.body30.preheader ], [ %indvars.iv.next73.prol, %for.body30.prol.loopexit.loopexit ]
  %22 = icmp ult i64 %3, 3
  br i1 %22, label %for.inc58, label %for.body30.preheader.new

for.body30.preheader.new:                         ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %23 = and i64 %0, 1
  %lcmp.mod115 = icmp eq i64 %23, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv102, i64 0
  %24 = icmp eq i64 %1, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond35.for.inc55_crit_edge.us
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %for.cond35.for.inc55_crit_edge.us ], [ %indvars.iv102, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv102, i64 %indvars.iv85
  %25 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod115, label %for.inc48.us.prol, label %for.inc48.us.prol.loopexit

for.inc48.us.prol:                                ; preds = %for.body30.us
  %26 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv85
  %27 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %26, %27
  %sub47.us.prol = fsub double %25, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  %indvars.iv77.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %sub4738.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %25, %for.body30.us ]
  br i1 %24, label %for.cond35.for.inc55_crit_edge.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %indvars.iv77 = phi i64 [ %indvars.iv77.unr.ph, %for.body30.us.new ], [ %indvars.iv.next78.1, %for.inc48.us ]
  %sub4738.us = phi double [ %sub4738.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv102, i64 %indvars.iv77
  %28 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv77, i64 %indvars.iv85
  %29 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %30 = load <2 x double>, <2 x double>* %28, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next78, i64 %indvars.iv85
  %31 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %29, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %31, i32 1
  %mul46.us = fmul <2 x double> %30, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %sub4738.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %exitcond100.1 = icmp eq i64 %indvars.iv.next78, %4
  %indvars.iv.next78.1 = add nsw i64 %indvars.iv77, 2
  br i1 %exitcond100.1, label %for.cond35.for.inc55_crit_edge.us.loopexit, label %for.inc48.us

for.cond35.for.inc55_crit_edge.us.loopexit:       ; preds = %for.inc48.us
  br label %for.cond35.for.inc55_crit_edge.us

for.cond35.for.inc55_crit_edge.us:                ; preds = %for.cond35.for.inc55_crit_edge.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.cond35.for.inc55_crit_edge.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next86 = add i64 %indvars.iv85, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next86, 2000
  br i1 %exitcond101, label %for.inc58.loopexit, label %for.body30.us

for.body30:                                       ; preds = %for.body30, %for.body30.preheader.new
  %indvars.iv72 = phi i64 [ %indvars.iv72.unr, %for.body30.preheader.new ], [ %indvars.iv.next73.3, %for.body30 ]
  %indvars.iv.next73.2 = add i64 %indvars.iv72, 3
  %exitcond75.3 = icmp eq i64 %indvars.iv.next73.2, 1999
  %indvars.iv.next73.3 = add i64 %indvars.iv72, 4
  br i1 %exitcond75.3, label %for.inc58.loopexit116, label %for.body30

for.inc58.loopexit:                               ; preds = %for.cond35.for.inc55_crit_edge.us
  br label %for.inc58

for.inc58.loopexit116:                            ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit116, %for.inc58.loopexit, %for.body30.prol.loopexit, %for.end27
  %indvars.iv.next103 = add nsw i64 %indvars.iv102, 1
  %cmp = icmp slt i64 %indvars.iv.next103, 2000
  br i1 %cmp, label %for.cond1.preheader, label %for.cond61.preheader.loopexit

for.body63:                                       ; preds = %for.inc82, %for.body63.lr.ph
  %indvars.iv92 = phi i32 [ %indvars.iv.next93, %for.inc82 ], [ -1, %for.body63.lr.ph ]
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.inc82 ], [ 0, %for.body63.lr.ph ]
  %32 = add i64 %indvars.iv60, 4294967295
  %33 = and i64 %32, 4294967295
  %34 = zext i32 %indvars.iv92 to i64
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv60
  %35 = bitcast double* %arrayidx65 to i64*
  %36 = load i64, i64* %35, align 8
  %cmp6713 = icmp sgt i64 %indvars.iv60, 0
  %37 = bitcast i64 %36 to double
  br i1 %cmp6713, label %for.inc77.lr.ph, label %for.inc82

for.inc77.lr.ph:                                  ; preds = %for.body63
  %xtraiter106 = and i64 %indvars.iv60, 3
  %lcmp.mod107 = icmp eq i64 %xtraiter106, 0
  br i1 %lcmp.mod107, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.lr.ph
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol, %for.inc77.prol.preheader
  %indvars.iv54.prol = phi i64 [ 0, %for.inc77.prol.preheader ], [ %indvars.iv.next55.prol, %for.inc77.prol ]
  %sub7627.prol = phi double [ %37, %for.inc77.prol.preheader ], [ %sub76.prol, %for.inc77.prol ]
  %prol.iter108 = phi i64 [ %xtraiter106, %for.inc77.prol.preheader ], [ %prol.iter108.sub, %for.inc77.prol ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv54.prol
  %38 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv54.prol
  %39 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %38, %39
  %sub76.prol = fsub double %sub7627.prol, %mul75.prol
  %indvars.iv.next55.prol = add nuw nsw i64 %indvars.iv54.prol, 1
  %prol.iter108.sub = add i64 %prol.iter108, -1
  %prol.iter108.cmp = icmp eq i64 %prol.iter108.sub, 0
  br i1 %prol.iter108.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !28

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.lr.ph
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.lr.ph ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %indvars.iv54.unr = phi i64 [ 0, %for.inc77.lr.ph ], [ %indvars.iv.next55.prol, %for.inc77.prol.loopexit.loopexit ]
  %sub7627.unr = phi double [ %37, %for.inc77.lr.ph ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %40 = icmp ult i64 %33, 3
  br i1 %40, label %for.cond66.for.inc82_crit_edge, label %for.inc77.lr.ph.new

for.inc77.lr.ph.new:                              ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77, %for.inc77.lr.ph.new
  %indvars.iv54 = phi i64 [ %indvars.iv54.unr, %for.inc77.lr.ph.new ], [ %indvars.iv.next55.3, %for.inc77 ]
  %sub7627 = phi double [ %sub7627.unr, %for.inc77.lr.ph.new ], [ %sub76.3, %for.inc77 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv54
  %41 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv54
  %42 = bitcast double* %arrayidx74 to <2 x double>*
  %43 = load <2 x double>, <2 x double>* %41, align 8
  %44 = load <2 x double>, <2 x double>* %42, align 8
  %mul75 = fmul <2 x double> %43, %44
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %sub7627, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv54, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next55.1
  %45 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next55.1
  %46 = bitcast double* %arrayidx74.2 to <2 x double>*
  %indvars.iv.next55.2 = add nsw i64 %indvars.iv54, 3
  %47 = load <2 x double>, <2 x double>* %45, align 8
  %48 = load <2 x double>, <2 x double>* %46, align 8
  %mul75.2 = fmul <2 x double> %47, %48
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %exitcond94.3 = icmp eq i64 %indvars.iv.next55.2, %34
  %indvars.iv.next55.3 = add nsw i64 %indvars.iv54, 4
  br i1 %exitcond94.3, label %for.cond66.for.inc82_crit_edge.loopexit, label %for.inc77

for.cond66.for.inc82_crit_edge.loopexit:          ; preds = %for.inc77
  br label %for.cond66.for.inc82_crit_edge

for.cond66.for.inc82_crit_edge:                   ; preds = %for.cond66.for.inc82_crit_edge.loopexit, %for.inc77.prol.loopexit
  %sub76.lcssa = phi double [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.cond66.for.inc82_crit_edge.loopexit ]
  %49 = bitcast double %sub76.lcssa to i64
  br label %for.inc82

for.inc82:                                        ; preds = %for.body63, %for.cond66.for.inc82_crit_edge
  %50 = phi i64 [ %36, %for.body63 ], [ %49, %for.cond66.for.inc82_crit_edge ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv60
  %51 = bitcast double* %arrayidx81 to i64*
  store i64 %50, i64* %51, align 8
  %indvars.iv.next61 = add nsw i64 %indvars.iv60, 1
  %cmp62 = icmp slt i64 %indvars.iv.next61, 2000
  %indvars.iv.next93 = add i32 %indvars.iv92, 1
  br i1 %cmp62, label %for.body63, label %for.body88.lr.ph

for.body88.lr.ph:                                 ; preds = %for.inc82
  br label %for.body88

for.body88:                                       ; preds = %for.inc112, %for.body88.lr.ph
  %indvar = phi i32 [ %indvar.next, %for.inc112 ], [ 0, %for.body88.lr.ph ]
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.inc112 ], [ 1999, %for.body88.lr.ph ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc112 ], [ 2000, %for.body88.lr.ph ]
  %52 = sub i32 2000, %indvar
  %53 = sext i32 %52 to i64
  %54 = sub nsw i64 1999, %53
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv51
  %55 = load double, double* %arrayidx90, align 8
  %56 = add nsw i64 %indvars.iv51, 1
  %cmp9210 = icmp slt i64 %56, 2000
  br i1 %cmp9210, label %for.inc102.lr.ph, label %for.inc112

for.inc102.lr.ph:                                 ; preds = %for.body88
  %57 = sub nsw i64 2000, %53
  %58 = sext i32 %indvars.iv to i64
  %xtraiter = and i64 %57, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.lr.ph
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol, %for.inc102.prol.preheader
  %indvars.iv49.prol = phi i64 [ %58, %for.inc102.prol.preheader ], [ %indvars.iv.next50.prol, %for.inc102.prol ]
  %sub10121.prol = phi double [ %55, %for.inc102.prol.preheader ], [ %sub101.prol, %for.inc102.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.inc102.prol.preheader ], [ %prol.iter.sub, %for.inc102.prol ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv49.prol
  %59 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv49.prol
  %60 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %59, %60
  %sub101.prol = fsub double %sub10121.prol, %mul100.prol
  %indvars.iv.next50.prol = add nsw i64 %indvars.iv49.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !29

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.lr.ph
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.lr.ph ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %indvars.iv49.unr = phi i64 [ %58, %for.inc102.lr.ph ], [ %indvars.iv.next50.prol, %for.inc102.prol.loopexit.loopexit ]
  %sub10121.unr = phi double [ %55, %for.inc102.lr.ph ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %61 = icmp ult i64 %54, 3
  br i1 %61, label %for.inc112, label %for.inc102.lr.ph.new

for.inc102.lr.ph.new:                             ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102, %for.inc102.lr.ph.new
  %indvars.iv49 = phi i64 [ %indvars.iv49.unr, %for.inc102.lr.ph.new ], [ %indvars.iv.next50.3, %for.inc102 ]
  %sub10121 = phi double [ %sub10121.unr, %for.inc102.lr.ph.new ], [ %sub101.3, %for.inc102 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv49
  %62 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv49
  %63 = bitcast double* %arrayidx99 to <2 x double>*
  %64 = load <2 x double>, <2 x double>* %62, align 8
  %65 = load <2 x double>, <2 x double>* %63, align 8
  %mul100 = fmul <2 x double> %64, %65
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %sub10121, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv.next50.1
  %66 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next50.1
  %67 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next50.2 = add nsw i64 %indvars.iv49, 3
  %68 = load <2 x double>, <2 x double>* %66, align 8
  %69 = load <2 x double>, <2 x double>* %67, align 8
  %mul100.2 = fmul <2 x double> %68, %69
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %exitcond.3 = icmp eq i64 %indvars.iv.next50.2, 1999
  %indvars.iv.next50.3 = add nsw i64 %indvars.iv49, 4
  br i1 %exitcond.3, label %for.inc112.loopexit, label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.inc102.prol.loopexit, %for.body88
  %70 = phi double [ %55, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv51
  %71 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %70, %71
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv51
  store double %div109, double* %arrayidx111, align 8
  %indvars.iv.next52 = add nsw i64 %indvars.iv51, -1
  %cmp87 = icmp sgt i64 %indvars.iv51, 0
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp87, label %for.body88, label %for.end113.loopexit

for.end113.loopexit:                              ; preds = %for.inc112
  br label %for.end113

for.end113:                                       ; preds = %for.end113.loopexit, %for.cond61.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, 2000
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
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
