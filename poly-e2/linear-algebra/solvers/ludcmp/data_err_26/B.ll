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
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call2 to double*
  tail call fastcc void @print_array(double* %1)
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
define internal fastcc void @init_array([2000 x double]* %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store i32 2000, i32* %n.addr, align 4
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %entry
  %indvars.iv116 = phi i64 [ 0, %entry ], [ %indvars.iv.next117.1, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv116
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv116
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next117 = or i64 %indvars.iv116, 1
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
  %exitcond142.1 = icmp eq i64 %indvars.iv.next117.1, 2000
  br i1 %exitcond142.1, label %for.cond13.preheader.preheader, label %for.inc

for.cond13.preheader.preheader:                   ; preds = %for.inc
  br label %for.cond13.preheader

for.cond13.preheader:                             ; preds = %for.cond13.preheader.preheader, %for.inc44.for.cond13.preheader_crit_edge
  %indvars.iv138 = phi i64 [ %indvars.iv.next139, %for.inc44.for.cond13.preheader_crit_edge ], [ 0, %for.cond13.preheader.preheader ]
  %5 = phi [2000 x double]* [ %11, %for.inc44.for.cond13.preheader_crit_edge ], [ %A, %for.cond13.preheader.preheader ]
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %for.inc44.for.cond13.preheader_crit_edge ], [ 0, %for.cond13.preheader.preheader ]
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %for.inc44.for.cond13.preheader_crit_edge ], [ 1, %for.cond13.preheader.preheader ]
  %6 = and i64 %indvars.iv138, 4294967295
  %sext = shl i64 %indvars.iv108, 32
  %7 = ashr exact i64 %sext, 32
  %cmp1416 = icmp slt i64 %indvars.iv114, 0
  br i1 %cmp1416, label %for.end27, label %for.inc25.preheader

for.inc25.preheader:                              ; preds = %for.cond13.preheader
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.preheader, %for.inc25
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %for.inc25 ], [ 0, %for.inc25.preheader ]
  %8 = sub nsw i64 0, %indvars.iv101
  %9 = trunc i64 %8 to i32
  %rem = srem i32 %9, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv114, i64 %indvars.iv101
  store double %add20, double* %arrayidx24, align 8
  %exitcond140 = icmp eq i64 %indvars.iv101, %6
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  br i1 %exitcond140, label %for.inc25.for.end27_crit_edge, label %for.inc25

for.inc25.for.end27_crit_edge:                    ; preds = %for.inc25
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.end27

for.end27:                                        ; preds = %for.cond13.preheader, %for.inc25.for.end27_crit_edge
  %10 = phi [2000 x double]* [ %.pre, %for.inc25.for.end27_crit_edge ], [ %5, %for.cond13.preheader ]
  %indvars.iv.next115 = add i64 %indvars.iv114, 1
  %cmp3018 = icmp slt i64 %indvars.iv.next115, 2000
  br i1 %cmp3018, label %for.inc37.lr.ph, label %for.inc44.thread

for.inc44.thread:                                 ; preds = %for.end27
  %arrayidx43127 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv114, i64 %indvars.iv114
  store double 1.000000e+00, double* %arrayidx43127, align 8
  br label %for.end46

for.inc37.lr.ph:                                  ; preds = %for.end27
  %11 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %12 = sub nsw i64 1999, %7
  %13 = sub nsw i64 0, %7
  %xtraiter56 = and i64 %13, 7
  %lcmp.mod57 = icmp eq i64 %xtraiter56, 0
  br i1 %lcmp.mod57, label %for.inc37.prol.loopexit, label %for.inc37.prol.preheader

for.inc37.prol.preheader:                         ; preds = %for.inc37.lr.ph
  br label %for.inc37.prol

for.inc37.prol:                                   ; preds = %for.inc37.prol, %for.inc37.prol.preheader
  %indvars.iv110.prol = phi i64 [ %indvars.iv.next111.prol, %for.inc37.prol ], [ %7, %for.inc37.prol.preheader ]
  %14 = phi [2000 x double]* [ %11, %for.inc37.prol ], [ %10, %for.inc37.prol.preheader ]
  %prol.iter58 = phi i64 [ %prol.iter58.sub, %for.inc37.prol ], [ %xtraiter56, %for.inc37.prol.preheader ]
  %arrayidx36.prol = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv114, i64 %indvars.iv110.prol
  store double 0.000000e+00, double* %arrayidx36.prol, align 8
  %indvars.iv.next111.prol = add nsw i64 %indvars.iv110.prol, 1
  %prol.iter58.sub = add i64 %prol.iter58, -1
  %prol.iter58.cmp = icmp eq i64 %prol.iter58.sub, 0
  br i1 %prol.iter58.cmp, label %for.inc37.prol.loopexit.loopexit, label %for.inc37.prol, !llvm.loop !1

for.inc37.prol.loopexit.loopexit:                 ; preds = %for.inc37.prol
  br label %for.inc37.prol.loopexit

for.inc37.prol.loopexit:                          ; preds = %for.inc37.prol.loopexit.loopexit, %for.inc37.lr.ph
  %indvars.iv110.unr = phi i64 [ %7, %for.inc37.lr.ph ], [ %indvars.iv.next111.prol, %for.inc37.prol.loopexit.loopexit ]
  %.unr = phi [2000 x double]* [ %10, %for.inc37.lr.ph ], [ %11, %for.inc37.prol.loopexit.loopexit ]
  %15 = icmp ult i64 %12, 7
  br i1 %15, label %for.inc44, label %for.inc37.lr.ph.new

for.inc37.lr.ph.new:                              ; preds = %for.inc37.prol.loopexit
  br label %for.inc37

for.inc37:                                        ; preds = %for.inc37, %for.inc37.lr.ph.new
  %indvars.iv110 = phi i64 [ %indvars.iv110.unr, %for.inc37.lr.ph.new ], [ %indvars.iv.next111.7, %for.inc37 ]
  %16 = phi [2000 x double]* [ %.unr, %for.inc37.lr.ph.new ], [ %11, %for.inc37 ]
  %arrayidx36 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv114, i64 %indvars.iv110
  store double 0.000000e+00, double* %arrayidx36, align 8
  %indvars.iv.next111 = add nsw i64 %indvars.iv110, 1
  %arrayidx36.1 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv114, i64 %indvars.iv.next111
  store double 0.000000e+00, double* %arrayidx36.1, align 8
  %indvars.iv.next111.1 = add nsw i64 %indvars.iv110, 2
  %arrayidx36.2 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv114, i64 %indvars.iv.next111.1
  store double 0.000000e+00, double* %arrayidx36.2, align 8
  %indvars.iv.next111.2 = add nsw i64 %indvars.iv110, 3
  %arrayidx36.3 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv114, i64 %indvars.iv.next111.2
  store double 0.000000e+00, double* %arrayidx36.3, align 8
  %indvars.iv.next111.3 = add nsw i64 %indvars.iv110, 4
  %arrayidx36.4 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv114, i64 %indvars.iv.next111.3
  store double 0.000000e+00, double* %arrayidx36.4, align 8
  %indvars.iv.next111.4 = add nsw i64 %indvars.iv110, 5
  %arrayidx36.5 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv114, i64 %indvars.iv.next111.4
  store double 0.000000e+00, double* %arrayidx36.5, align 8
  %indvars.iv.next111.5 = add nsw i64 %indvars.iv110, 6
  %arrayidx36.6 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv114, i64 %indvars.iv.next111.5
  store double 0.000000e+00, double* %arrayidx36.6, align 8
  %indvars.iv.next111.6 = add nsw i64 %indvars.iv110, 7
  %arrayidx36.7 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv114, i64 %indvars.iv.next111.6
  store double 0.000000e+00, double* %arrayidx36.7, align 8
  %exitcond141.7 = icmp eq i64 %indvars.iv.next111.6, 1999
  %indvars.iv.next111.7 = add nsw i64 %indvars.iv110, 8
  br i1 %exitcond141.7, label %for.inc44.loopexit, label %for.inc37

for.inc44.loopexit:                               ; preds = %for.inc37
  br label %for.inc44

for.inc44:                                        ; preds = %for.inc44.loopexit, %for.inc37.prol.loopexit
  %17 = icmp slt i64 %indvars.iv.next115, 2000
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv114, i64 %indvars.iv114
  store double 1.000000e+00, double* %arrayidx43, align 8
  br i1 %17, label %for.inc44.for.cond13.preheader_crit_edge, label %for.end46.loopexit

for.inc44.for.cond13.preheader_crit_edge:         ; preds = %for.inc44
  %indvars.iv.next139 = add nuw nsw i64 %6, 1
  %indvars.iv.next109 = add nsw i64 %7, 1
  br label %for.cond13.preheader

for.end46.loopexit:                               ; preds = %for.inc44
  br label %for.end46

for.end46:                                        ; preds = %for.end46.loopexit, %for.inc44.thread
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
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
  br label %for.cond51.preheader.us

for.cond51.preheader.us:                          ; preds = %for.cond51.preheader.us, %for.end46
  %indvars.iv98 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next99.7, %for.cond51.preheader.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv98, i64 0
  %scevgep97 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next99 = or i64 %indvars.iv98, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv.next99, i64 0
  %scevgep97.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next99.1 = or i64 %indvars.iv98, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv.next99.1, i64 0
  %scevgep97.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next99.2 = or i64 %indvars.iv98, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv.next99.2, i64 0
  %scevgep97.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next99.3 = or i64 %indvars.iv98, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv.next99.3, i64 0
  %scevgep97.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next99.4 = or i64 %indvars.iv98, 5
  %scevgep.5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv.next99.4, i64 0
  %scevgep97.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next99.5 = or i64 %indvars.iv98, 6
  %scevgep.6 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv.next99.5, i64 0
  %scevgep97.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next99.6 = or i64 %indvars.iv98, 7
  %scevgep.7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv.next99.6, i64 0
  %scevgep97.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next99.7 = add nsw i64 %indvars.iv98, 8
  %exitcond137.7 = icmp eq i64 %indvars.iv.next99.6, 1999
  br i1 %exitcond137.7, label %for.cond65.preheader, label %for.cond51.preheader.us

for.cond65.preheader:                             ; preds = %for.cond51.preheader.us
  %.pre123.pre = load i32, i32* %n.addr, align 4
  %27 = sext i32 %.pre123.pre to i64
  %28 = sext i32 %.pre123.pre to i64
  %cmp6613 = icmp sgt i32 %.pre123.pre, 0
  br i1 %cmp6613, label %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge, label %for.cond99.preheader.for.end120_crit_edge

for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge: ; preds = %for.cond65.preheader
  %29 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %30 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %31 = add i32 %.pre123.pre, -1
  %32 = zext i32 %31 to i64
  %33 = add nuw nsw i64 %32, 1
  %34 = add nuw nsw i64 %32, 1
  %min.iters.check = icmp ult i64 %33, 4
  %n.vec = and i64 %33, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %33, %n.vec
  br label %for.cond73.preheader.lr.ph.us

for.cond73.preheader.lr.ph.us:                    ; preds = %for.inc96.us, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge
  %indvars.iv90 = phi i64 [ 0, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ], [ %indvars.iv.next91, %for.inc96.us ]
  %scevgep7 = getelementptr [2000 x double], [2000 x double]* %29, i64 0, i64 %indvars.iv90
  %35 = add i64 %indvars.iv90, 1
  %scevgep9 = getelementptr [2000 x double], [2000 x double]* %29, i64 %32, i64 %35
  br label %for.cond73.preheader.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next91, %28
  br i1 %exitcond136, label %for.cond99.preheader, label %for.cond73.preheader.lr.ph.us

for.cond73.preheader.us.us:                       ; preds = %for.inc93.us.us, %for.cond73.preheader.lr.ph.us
  %indvars.iv88 = phi i64 [ 0, %for.cond73.preheader.lr.ph.us ], [ %indvars.iv.next89, %for.inc93.us.us ]
  %scevgep3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv88, i64 0
  %scevgep5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv88, i64 %33
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv88, i64 %indvars.iv90
  br i1 %min.iters.check, label %for.inc90.us.us.preheader, label %min.iters.checked

for.inc90.us.us.preheader:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond73.preheader.us.us
  %indvars.iv84.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond73.preheader.us.us ], [ %n.vec, %middle.block ]
  %36 = sub nsw i64 %34, %indvars.iv84.ph
  %xtraiter54 = and i64 %36, 1
  %lcmp.mod55 = icmp eq i64 %xtraiter54, 0
  br i1 %lcmp.mod55, label %for.inc90.us.us.prol.loopexit, label %for.inc90.us.us.prol

for.inc90.us.us.prol:                             ; preds = %for.inc90.us.us.preheader
  %37 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv84.ph, i64 %indvars.iv90
  %38 = load double, double* %arrayidx84.us.us.prol, align 8
  %mul.us.us.prol = fmul double %37, %38
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv88, i64 %indvars.iv84.ph
  %39 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %mul.us.us.prol, %39
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  %indvars.iv.next85.prol = or i64 %indvars.iv84.ph, 1
  br label %for.inc90.us.us.prol.loopexit

for.inc90.us.us.prol.loopexit:                    ; preds = %for.inc90.us.us.prol, %for.inc90.us.us.preheader
  %indvars.iv84.unr.ph = phi i64 [ %indvars.iv.next85.prol, %for.inc90.us.us.prol ], [ %indvars.iv84.ph, %for.inc90.us.us.preheader ]
  %40 = icmp eq i64 %32, %indvars.iv84.ph
  br i1 %40, label %for.inc93.us.us, label %for.inc90.us.us.preheader.new

for.inc90.us.us.preheader.new:                    ; preds = %for.inc90.us.us.prol.loopexit
  br label %for.inc90.us.us

min.iters.checked:                                ; preds = %for.cond73.preheader.us.us
  br i1 %cmp.zero, label %for.inc90.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep3, %scevgep9
  %bound1 = icmp ult double* %scevgep7, %scevgep5
  %found.conflict = and i1 %bound0, %bound1
  %bound012 = icmp ult double* %scevgep3, %arrayidx80.us.us
  %bound113 = icmp ult double* %arrayidx80.us.us, %scevgep5
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
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
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %index, i64 %indvars.iv90
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %41, i64 %indvars.iv90
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %42, i64 %indvars.iv90
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %43, i64 %indvars.iv90
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
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv88, i64 %index
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !8, !noalias !10
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !8, !noalias !10
  %67 = fadd <2 x double> %61, %wide.load
  %68 = fadd <2 x double> %62, %wide.load16
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
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next89, %28
  br i1 %exitcond135, label %for.inc96.us, label %for.cond73.preheader.us.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us, %for.inc90.us.us.preheader.new
  %indvars.iv84 = phi i64 [ %indvars.iv84.unr.ph, %for.inc90.us.us.preheader.new ], [ %indvars.iv.next85.1, %for.inc90.us.us ]
  %72 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv84, i64 %indvars.iv90
  %73 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %72, %73
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv88, i64 %indvars.iv84
  %74 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %mul.us.us, %74
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %75 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv.next85, i64 %indvars.iv90
  %76 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %75, %76
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv88, i64 %indvars.iv.next85
  %77 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %mul.us.us.1, %77
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %exitcond87.1 = icmp eq i64 %indvars.iv.next85, %32
  %indvars.iv.next85.1 = add nsw i64 %indvars.iv84, 2
  br i1 %exitcond87.1, label %for.inc93.us.us.loopexit, label %for.inc90.us.us, !llvm.loop !14

for.cond99.preheader:                             ; preds = %for.inc96.us
  %78 = icmp sgt i32 %.pre123.pre, 0
  br i1 %78, label %for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge, label %for.cond99.preheader.for.end120_crit_edge

for.cond99.preheader.for.end120_crit_edge:        ; preds = %for.cond65.preheader, %for.cond99.preheader
  %79 = bitcast [2000 x [2000 x double]]** %B to i8**
  %.pre125 = load i8*, i8** %79, align 8
  br label %for.end120

for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge: ; preds = %for.cond99.preheader
  %80 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %81 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %82 = add i32 %.pre123.pre, -1
  %83 = zext i32 %82 to i64
  %84 = add nuw nsw i64 %32, 1
  %85 = and i64 %84, 8589934588
  %86 = add nsw i64 %85, -4
  %87 = lshr exact i64 %86, 2
  %88 = add nuw nsw i64 %32, 1
  %min.iters.check20 = icmp ult i64 %84, 4
  %n.vec23 = and i64 %84, 8589934588
  %cmp.zero24 = icmp eq i64 %n.vec23, 0
  %89 = and i64 %87, 1
  %lcmp.mod = icmp eq i64 %89, 0
  %90 = icmp eq i64 %87, 0
  %cmp.n43 = icmp eq i64 %84, %n.vec23
  br label %for.cond103.preheader.us

for.cond103.preheader.us:                         ; preds = %for.inc118.us, %for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge
  %indvars.iv82 = phi i64 [ 0, %for.cond103.preheader.lr.ph.for.cond103.preheader.us_crit_edge ], [ %indvars.iv.next83, %for.inc118.us ]
  %scevgep26 = getelementptr [2000 x double], [2000 x double]* %81, i64 %indvars.iv82, i64 0
  %scevgep28 = getelementptr [2000 x double], [2000 x double]* %81, i64 %indvars.iv82, i64 %84
  %scevgep30 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv82, i64 0
  %scevgep32 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv82, i64 %84
  br i1 %min.iters.check20, label %for.inc115.us.preheader, label %min.iters.checked21

min.iters.checked21:                              ; preds = %for.cond103.preheader.us
  br i1 %cmp.zero24, label %for.inc115.us.preheader, label %vector.memcheck38

vector.memcheck38:                                ; preds = %min.iters.checked21
  %bound034 = icmp ult double* %scevgep26, %scevgep32
  %bound135 = icmp ult double* %scevgep30, %scevgep28
  %memcheck.conflict37 = and i1 %bound034, %bound135
  br i1 %memcheck.conflict37, label %for.inc115.us.preheader, label %vector.body17.preheader

vector.body17.preheader:                          ; preds = %vector.memcheck38
  br i1 %lcmp.mod, label %vector.body17.prol, label %vector.body17.prol.loopexit

vector.body17.prol:                               ; preds = %vector.body17.preheader
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv82, i64 0
  %92 = bitcast double* %91 to <2 x i64>*
  %wide.load48.prol = load <2 x i64>, <2 x i64>* %92, align 8, !alias.scope !15
  %93 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv82, i64 2
  %94 = bitcast double* %93 to <2 x i64>*
  %wide.load49.prol = load <2 x i64>, <2 x i64>* %94, align 8, !alias.scope !15
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %81, i64 %indvars.iv82, i64 0
  %96 = bitcast double* %95 to <2 x i64>*
  store <2 x i64> %wide.load48.prol, <2 x i64>* %96, align 8, !alias.scope !18, !noalias !15
  %97 = getelementptr [2000 x double], [2000 x double]* %81, i64 %indvars.iv82, i64 2
  %98 = bitcast double* %97 to <2 x i64>*
  store <2 x i64> %wide.load49.prol, <2 x i64>* %98, align 8, !alias.scope !18, !noalias !15
  br label %vector.body17.prol.loopexit

vector.body17.prol.loopexit:                      ; preds = %vector.body17.prol, %vector.body17.preheader
  %index40.unr.ph = phi i64 [ 4, %vector.body17.prol ], [ 0, %vector.body17.preheader ]
  br i1 %90, label %middle.block18, label %vector.body17.preheader.new

vector.body17.preheader.new:                      ; preds = %vector.body17.prol.loopexit
  br label %vector.body17

vector.body17:                                    ; preds = %vector.body17, %vector.body17.preheader.new
  %index40 = phi i64 [ %index40.unr.ph, %vector.body17.preheader.new ], [ %index.next41.1, %vector.body17 ]
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv82, i64 %index40
  %100 = bitcast double* %99 to <2 x i64>*
  %wide.load48 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !15
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x i64>*
  %wide.load49 = load <2 x i64>, <2 x i64>* %102, align 8, !alias.scope !15
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %81, i64 %indvars.iv82, i64 %index40
  %104 = bitcast double* %103 to <2 x i64>*
  store <2 x i64> %wide.load48, <2 x i64>* %104, align 8, !alias.scope !18, !noalias !15
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  store <2 x i64> %wide.load49, <2 x i64>* %106, align 8, !alias.scope !18, !noalias !15
  %index.next41 = add i64 %index40, 4
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv82, i64 %index.next41
  %108 = bitcast double* %107 to <2 x i64>*
  %wide.load48.1 = load <2 x i64>, <2 x i64>* %108, align 8, !alias.scope !15
  %109 = getelementptr double, double* %107, i64 2
  %110 = bitcast double* %109 to <2 x i64>*
  %wide.load49.1 = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !15
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %81, i64 %indvars.iv82, i64 %index.next41
  %112 = bitcast double* %111 to <2 x i64>*
  store <2 x i64> %wide.load48.1, <2 x i64>* %112, align 8, !alias.scope !18, !noalias !15
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x i64>*
  store <2 x i64> %wide.load49.1, <2 x i64>* %114, align 8, !alias.scope !18, !noalias !15
  %index.next41.1 = add i64 %index40, 8
  %115 = icmp eq i64 %index.next41.1, %n.vec23
  br i1 %115, label %middle.block18.loopexit, label %vector.body17, !llvm.loop !20

middle.block18.loopexit:                          ; preds = %vector.body17
  br label %middle.block18

middle.block18:                                   ; preds = %middle.block18.loopexit, %vector.body17.prol.loopexit
  br i1 %cmp.n43, label %for.inc118.us, label %for.inc115.us.preheader

for.inc115.us.preheader:                          ; preds = %middle.block18, %vector.memcheck38, %min.iters.checked21, %for.cond103.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck38 ], [ 0, %min.iters.checked21 ], [ 0, %for.cond103.preheader.us ], [ %n.vec23, %middle.block18 ]
  %116 = sub nsw i64 %88, %indvars.iv.ph
  %117 = sub nsw i64 %32, %indvars.iv.ph
  %xtraiter52 = and i64 %116, 3
  %lcmp.mod53 = icmp eq i64 %xtraiter52, 0
  br i1 %lcmp.mod53, label %for.inc115.us.prol.loopexit, label %for.inc115.us.prol.preheader

for.inc115.us.prol.preheader:                     ; preds = %for.inc115.us.preheader
  br label %for.inc115.us.prol

for.inc115.us.prol:                               ; preds = %for.inc115.us.prol, %for.inc115.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc115.us.prol ], [ %indvars.iv.ph, %for.inc115.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc115.us.prol ], [ %xtraiter52, %for.inc115.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv82, i64 %indvars.iv.prol
  %118 = bitcast double* %arrayidx110.us.prol to i64*
  %119 = load i64, i64* %118, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %81, i64 %indvars.iv82, i64 %indvars.iv.prol
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
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv82, i64 %indvars.iv
  %122 = bitcast double* %arrayidx110.us to i64*
  %123 = load i64, i64* %122, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %81, i64 %indvars.iv82, i64 %indvars.iv
  %124 = bitcast double* %arrayidx114.us to i64*
  store i64 %123, i64* %124, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next
  %125 = bitcast double* %arrayidx110.us.1 to i64*
  %126 = load i64, i64* %125, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %81, i64 %indvars.iv82, i64 %indvars.iv.next
  %127 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %126, i64* %127, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next.1
  %128 = bitcast double* %arrayidx110.us.2 to i64*
  %129 = load i64, i64* %128, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %81, i64 %indvars.iv82, i64 %indvars.iv.next.1
  %130 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %129, i64* %130, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next.2
  %131 = bitcast double* %arrayidx110.us.3 to i64*
  %132 = load i64, i64* %131, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %81, i64 %indvars.iv82, i64 %indvars.iv.next.2
  %133 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %132, i64* %133, align 8
  %exitcond.3 = icmp eq i64 %indvars.iv.next.2, %83
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond.3, label %for.inc118.us.loopexit, label %for.inc115.us, !llvm.loop !22

for.inc118.us.loopexit:                           ; preds = %for.inc115.us
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit, %for.inc115.us.prol.loopexit, %middle.block18
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next83, %27
  br i1 %exitcond134, label %for.end120.loopexit, label %for.cond103.preheader.us

for.end120.loopexit:                              ; preds = %for.inc118.us
  %134 = bitcast [2000 x [2000 x double]]* %80 to i8*
  br label %for.end120

for.end120:                                       ; preds = %for.end120.loopexit, %for.cond99.preheader.for.end120_crit_edge
  %135 = phi i8* [ %.pre125, %for.cond99.preheader.for.end120_crit_edge ], [ %134, %for.end120.loopexit ]
  tail call void @free(i8* %135) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %entry
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc58 ], [ 0, %entry ]
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %for.inc58 ], [ 4294967295, %entry ]
  %0 = sub i64 1999, %indvars.iv2
  %1 = and i64 %indvars.iv79, 4294967295
  %cmp216 = icmp sgt i64 %indvars.iv2, 0
  br i1 %cmp216, label %for.body3.preheader, label %for.body30.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 0
  br label %for.body3

for.body30.preheader:                             ; preds = %for.body30.lr.ph, %for.cond1.preheader
  %2 = sub i64 0, %indvars.iv2
  %xtraiter12 = and i64 %2, 7
  %lcmp.mod13 = icmp eq i64 %xtraiter12, 0
  br i1 %lcmp.mod13, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.preheader
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol, %for.body30.prol.preheader
  %indvars.iv72.prol = phi i64 [ %indvars.iv.next73.prol, %for.body30.prol ], [ %indvars.iv2, %for.body30.prol.preheader ]
  %prol.iter14 = phi i64 [ %prol.iter14.sub, %for.body30.prol ], [ %xtraiter12, %for.body30.prol.preheader ]
  %indvars.iv.next73.prol = add nuw nsw i64 %indvars.iv72.prol, 1
  %prol.iter14.sub = add i64 %prol.iter14, -1
  %prol.iter14.cmp = icmp eq i64 %prol.iter14.sub, 0
  br i1 %prol.iter14.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !23

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.preheader
  %indvars.iv72.unr = phi i64 [ %indvars.iv2, %for.body30.preheader ], [ %indvars.iv.next73.prol, %for.body30.prol.loopexit.loopexit ]
  %3 = icmp ult i64 %0, 7
  br i1 %3, label %for.inc58, label %for.body30.preheader.new

for.body30.preheader.new:                         ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.inc25 ], [ 0, %for.body3.preheader ]
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.inc25 ], [ 4294967295, %for.body3.preheader ]
  %4 = and i64 %indvars.iv64, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv68
  %5 = load double, double* %arrayidx5, align 8
  %cmp715 = icmp sgt i64 %indvars.iv68, 0
  br i1 %cmp715, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  %6 = and i64 %indvars.iv64, 1
  %lcmp.mod11 = icmp eq i64 %6, 0
  br i1 %lcmp.mod11, label %for.inc.prol, label %for.inc.prol.loopexit

for.inc.prol:                                     ; preds = %for.inc.preheader
  %7 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv68
  %8 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %7, %8
  %sub.prol = fsub double %5, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv62.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %sub33.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %5, %for.inc.preheader ]
  %9 = icmp eq i64 %4, 0
  br i1 %9, label %for.inc25, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv62 = phi i64 [ %indvars.iv62.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next63.1, %for.inc ]
  %sub33 = phi double [ %sub33.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv62
  %10 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv62, i64 %indvars.iv68
  %11 = load double, double* %arrayidx16, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %12 = load <2 x double>, <2 x double>* %10, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next63, i64 %indvars.iv68
  %13 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %11, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %13, i32 1
  %mul = fmul <2 x double> %12, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %sub33, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %exitcond67.1 = icmp eq i64 %indvars.iv.next63, %4
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  br i1 %exitcond67.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.body3
  %14 = phi double [ %5, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 %indvars.iv68
  %15 = load double, double* %arrayidx20, align 8
  %div = fdiv double %14, %15
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %indvars.iv.next65 = add nuw nsw i64 %4, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next69, %indvars.iv2
  br i1 %exitcond4, label %for.body30.lr.ph, label %for.body3

for.body30.lr.ph:                                 ; preds = %for.inc25
  %16 = icmp sgt i64 %indvars.iv2, 0
  br i1 %16, label %for.body30.us.preheader, label %for.body30.preheader

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %17 = and i64 %indvars.iv79, 1
  %lcmp.mod16 = icmp eq i64 %17, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 0
  %18 = icmp eq i64 %1, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond35.for.inc55_crit_edge.us
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %for.cond35.for.inc55_crit_edge.us ], [ %indvars.iv2, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv85
  %19 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod16, label %for.inc48.us.prol, label %for.inc48.us.prol.loopexit

for.inc48.us.prol:                                ; preds = %for.body30.us
  %20 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv85
  %21 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %20, %21
  %sub47.us.prol = fsub double %19, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  %indvars.iv77.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %sub4738.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %19, %for.body30.us ]
  br i1 %18, label %for.cond35.for.inc55_crit_edge.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %indvars.iv77 = phi i64 [ %indvars.iv77.unr.ph, %for.body30.us.new ], [ %indvars.iv.next78.1, %for.inc48.us ]
  %sub4738.us = phi double [ %sub4738.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv77
  %22 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv77, i64 %indvars.iv85
  %23 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %24 = load <2 x double>, <2 x double>* %22, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next78, i64 %indvars.iv85
  %25 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %23, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %25, i32 1
  %mul46.us = fmul <2 x double> %24, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %sub4738.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %exitcond82.1 = icmp eq i64 %indvars.iv.next78, %1
  %indvars.iv.next78.1 = add nsw i64 %indvars.iv77, 2
  br i1 %exitcond82.1, label %for.cond35.for.inc55_crit_edge.us.loopexit, label %for.inc48.us

for.cond35.for.inc55_crit_edge.us.loopexit:       ; preds = %for.inc48.us
  br label %for.cond35.for.inc55_crit_edge.us

for.cond35.for.inc55_crit_edge.us:                ; preds = %for.cond35.for.inc55_crit_edge.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.cond35.for.inc55_crit_edge.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next86, 2000
  br i1 %exitcond94, label %for.inc58.loopexit, label %for.body30.us

for.body30:                                       ; preds = %for.body30, %for.body30.preheader.new
  %indvars.iv72 = phi i64 [ %indvars.iv72.unr, %for.body30.preheader.new ], [ %indvars.iv.next73.7, %for.body30 ]
  %exitcond93.7 = icmp eq i64 %indvars.iv72, 1992
  %indvars.iv.next73.7 = add nsw i64 %indvars.iv72, 8
  br i1 %exitcond93.7, label %for.inc58.loopexit17, label %for.body30

for.inc58.loopexit:                               ; preds = %for.cond35.for.inc55_crit_edge.us
  br label %for.inc58

for.inc58.loopexit17:                             ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit17, %for.inc58.loopexit, %for.body30.prol.loopexit
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %indvars.iv.next80 = add nuw nsw i64 %1, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond5, label %for.body63.preheader, label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.inc82
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %for.inc82 ], [ 4294967295, %for.body63.preheader ]
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.inc82 ], [ 0, %for.body63.preheader ]
  %26 = and i64 %indvars.iv90, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv60
  %27 = bitcast double* %arrayidx65 to i64*
  %28 = load i64, i64* %27, align 8
  %cmp6713 = icmp sgt i64 %indvars.iv60, 0
  br i1 %cmp6713, label %for.inc77.lr.ph, label %for.inc82

for.inc77.lr.ph:                                  ; preds = %for.body63
  %29 = bitcast i64 %28 to double
  %30 = add nsw i64 %indvars.iv90, 1
  %xtraiter7 = and i64 %30, 3
  %lcmp.mod8 = icmp eq i64 %xtraiter7, 0
  br i1 %lcmp.mod8, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.lr.ph
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol, %for.inc77.prol.preheader
  %indvars.iv54.prol = phi i64 [ %indvars.iv.next55.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %sub7627.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %29, %for.inc77.prol.preheader ]
  %prol.iter9 = phi i64 [ %prol.iter9.sub, %for.inc77.prol ], [ %xtraiter7, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv54.prol
  %31 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv54.prol
  %32 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %31, %32
  %sub76.prol = fsub double %sub7627.prol, %mul75.prol
  %indvars.iv.next55.prol = add nuw nsw i64 %indvars.iv54.prol, 1
  %prol.iter9.sub = add i64 %prol.iter9, -1
  %prol.iter9.cmp = icmp eq i64 %prol.iter9.sub, 0
  br i1 %prol.iter9.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !24

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.lr.ph
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.lr.ph ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %indvars.iv54.unr = phi i64 [ 0, %for.inc77.lr.ph ], [ %indvars.iv.next55.prol, %for.inc77.prol.loopexit.loopexit ]
  %sub7627.unr = phi double [ %29, %for.inc77.lr.ph ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %33 = icmp ult i64 %26, 3
  br i1 %33, label %for.cond66.for.inc82_crit_edge, label %for.inc77.lr.ph.new

for.inc77.lr.ph.new:                              ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77, %for.inc77.lr.ph.new
  %indvars.iv54 = phi i64 [ %indvars.iv54.unr, %for.inc77.lr.ph.new ], [ %indvars.iv.next55.3, %for.inc77 ]
  %sub7627 = phi double [ %sub7627.unr, %for.inc77.lr.ph.new ], [ %sub76.3, %for.inc77 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv54
  %34 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv54
  %35 = bitcast double* %arrayidx74 to <2 x double>*
  %36 = load <2 x double>, <2 x double>* %34, align 8
  %37 = load <2 x double>, <2 x double>* %35, align 8
  %mul75 = fmul <2 x double> %36, %37
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %sub7627, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv54, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next55.1
  %38 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next55.1
  %39 = bitcast double* %arrayidx74.2 to <2 x double>*
  %indvars.iv.next55.2 = add nsw i64 %indvars.iv54, 3
  %40 = load <2 x double>, <2 x double>* %38, align 8
  %41 = load <2 x double>, <2 x double>* %39, align 8
  %mul75.2 = fmul <2 x double> %40, %41
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %exitcond92.3 = icmp eq i64 %indvars.iv.next55.2, %26
  %indvars.iv.next55.3 = add nsw i64 %indvars.iv54, 4
  br i1 %exitcond92.3, label %for.cond66.for.inc82_crit_edge.loopexit, label %for.inc77

for.cond66.for.inc82_crit_edge.loopexit:          ; preds = %for.inc77
  br label %for.cond66.for.inc82_crit_edge

for.cond66.for.inc82_crit_edge:                   ; preds = %for.cond66.for.inc82_crit_edge.loopexit, %for.inc77.prol.loopexit
  %sub76.lcssa = phi double [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.cond66.for.inc82_crit_edge.loopexit ]
  %42 = bitcast double %sub76.lcssa to i64
  br label %for.inc82

for.inc82:                                        ; preds = %for.body63, %for.cond66.for.inc82_crit_edge
  %43 = phi i64 [ %42, %for.cond66.for.inc82_crit_edge ], [ %28, %for.body63 ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv60
  %44 = bitcast double* %arrayidx81 to i64*
  store i64 %43, i64* %44, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %indvars.iv.next91 = add nuw nsw i64 %26, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next61, 2000
  br i1 %exitcond1, label %for.body88.preheader, label %for.body63

for.body88.preheader:                             ; preds = %for.inc82
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.inc112.for.body88_crit_edge
  %indvar = phi i32 [ 0, %for.body88.preheader ], [ %indvar.next, %for.inc112.for.body88_crit_edge ]
  %indvars.iv51 = phi i64 [ 1999, %for.body88.preheader ], [ %indvars.iv.next52, %for.inc112.for.body88_crit_edge ]
  %indvars.iv = phi i32 [ 2000, %for.body88.preheader ], [ %indvars.iv.next, %for.inc112.for.body88_crit_edge ]
  %45 = sub i32 2000, %indvar
  %46 = sext i32 %45 to i64
  %47 = sub nsw i64 1999, %46
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv51
  %48 = load double, double* %arrayidx90, align 8
  %49 = add nsw i64 %indvars.iv51, 1
  %cmp9210 = icmp slt i64 %49, 2000
  br i1 %cmp9210, label %for.inc102.lr.ph, label %for.inc112

for.inc102.lr.ph:                                 ; preds = %for.body88
  %50 = sext i32 %indvars.iv to i64
  %51 = sub nsw i64 0, %46
  %xtraiter = and i64 %51, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.lr.ph
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol, %for.inc102.prol.preheader
  %indvars.iv49.prol = phi i64 [ %indvars.iv.next50.prol, %for.inc102.prol ], [ %50, %for.inc102.prol.preheader ]
  %sub10121.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %48, %for.inc102.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv49.prol
  %52 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv49.prol
  %53 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %52, %53
  %sub101.prol = fsub double %sub10121.prol, %mul100.prol
  %indvars.iv.next50.prol = add nsw i64 %indvars.iv49.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !25

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.lr.ph
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.lr.ph ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %indvars.iv49.unr = phi i64 [ %50, %for.inc102.lr.ph ], [ %indvars.iv.next50.prol, %for.inc102.prol.loopexit.loopexit ]
  %sub10121.unr = phi double [ %48, %for.inc102.lr.ph ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %54 = icmp ult i64 %47, 3
  br i1 %54, label %for.inc112, label %for.inc102.lr.ph.new

for.inc102.lr.ph.new:                             ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102, %for.inc102.lr.ph.new
  %indvars.iv49 = phi i64 [ %indvars.iv49.unr, %for.inc102.lr.ph.new ], [ %indvars.iv.next50.3, %for.inc102 ]
  %sub10121 = phi double [ %sub10121.unr, %for.inc102.lr.ph.new ], [ %sub101.3, %for.inc102 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv49
  %55 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv49
  %56 = bitcast double* %arrayidx99 to <2 x double>*
  %57 = load <2 x double>, <2 x double>* %55, align 8
  %58 = load <2 x double>, <2 x double>* %56, align 8
  %mul100 = fmul <2 x double> %57, %58
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %sub10121, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv.next50.1
  %59 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next50.1
  %60 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next50.2 = add nsw i64 %indvars.iv49, 3
  %61 = load <2 x double>, <2 x double>* %59, align 8
  %62 = load <2 x double>, <2 x double>* %60, align 8
  %mul100.2 = fmul <2 x double> %61, %62
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
  %63 = phi double [ %48, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv51
  %64 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %63, %64
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv51
  store double %div109, double* %arrayidx111, align 8
  %cmp87 = icmp sgt i64 %indvars.iv51, 0
  br i1 %cmp87, label %for.inc112.for.body88_crit_edge, label %for.end113

for.inc112.for.body88_crit_edge:                  ; preds = %for.inc112
  %indvars.iv.next52 = add i64 %indvars.iv51, -1
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
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
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
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
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
