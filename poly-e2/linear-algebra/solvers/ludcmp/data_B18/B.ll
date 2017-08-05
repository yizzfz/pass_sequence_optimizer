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
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay7 = bitcast i8* %call to [2000 x double]*
  %arraydecay8 = bitcast i8* %call1 to double*
  %arraydecay9 = bitcast i8* %call2 to double*
  %arraydecay10 = bitcast i8* %call3 to double*
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %arraydecay7, double* %arraydecay8, double* %arraydecay9, double* %arraydecay10)
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
  %arraydecay12 = bitcast i8* %call2 to double*
  tail call fastcc void @print_array(i32 2000, double* %arraydecay12)
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
define internal fastcc void @init_array(i32 %n, [2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  %conv = sitofp i32 %n to double
  %cmp22 = icmp sgt i32 %n, 0
  br i1 %cmp22, label %entry.for.inc_crit_edge, label %for.end46.thread

entry.for.inc_crit_edge:                          ; preds = %entry
  %0 = add i32 %n, -1
  %1 = zext i32 %0 to i64
  %2 = and i64 %1, 1
  %lcmp.mod109 = icmp eq i64 %2, 0
  br i1 %lcmp.mod109, label %for.inc.prol, label %for.inc.prol.loopexit

for.inc.prol:                                     ; preds = %entry.for.inc_crit_edge
  store double 0.000000e+00, double* %x, align 8
  store double 0.000000e+00, double* %y, align 8
  %div.prol = fdiv double 1.000000e+00, %conv
  %div5.prol = fmul double %div.prol, 5.000000e-01
  %add6.prol = fadd double %div5.prol, 4.000000e+00
  store double %add6.prol, double* %b, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %entry.for.inc_crit_edge
  %indvars.iv81.unr = phi i64 [ 0, %entry.for.inc_crit_edge ], [ 1, %for.inc.prol ]
  %3 = icmp eq i32 %0, 0
  br i1 %3, label %for.cond9.preheader, label %entry.for.inc_crit_edge.new

entry.for.inc_crit_edge.new:                      ; preds = %for.inc.prol.loopexit
  %div.v.i1.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i1.2 = insertelement <2 x double> %div.v.i1.1, double %conv, i32 1
  br label %for.inc

for.cond9.preheader.loopexit:                     ; preds = %for.inc
  br label %for.cond9.preheader

for.cond9.preheader:                              ; preds = %for.cond9.preheader.loopexit, %for.inc.prol.loopexit
  %cmp1020 = icmp sgt i32 %n, 0
  br i1 %cmp1020, label %for.cond13.preheader.lr.ph, label %for.end46.thread

for.cond13.preheader.lr.ph:                       ; preds = %for.cond9.preheader
  %conv18 = sitofp i32 %n to double
  %4 = add i32 %n, -2
  %5 = zext i32 %4 to i64
  %6 = sext i32 %n to i64
  %7 = sext i32 %n to i64
  br label %for.inc25.lr.ph

for.inc:                                          ; preds = %for.inc, %entry.for.inc_crit_edge.new
  %indvars.iv81 = phi i64 [ %indvars.iv81.unr, %entry.for.inc_crit_edge.new ], [ %indvars.iv.next82.1, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv81
  %8 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv81
  %9 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %10 = trunc i64 %indvars.iv.next82 to i32
  %conv4 = sitofp i32 %10 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv81
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next82.1 = add nsw i64 %indvars.iv81, 2
  %11 = trunc i64 %indvars.iv.next82.1 to i32
  %conv4.1 = sitofp i32 %11 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, %div.v.i1.2
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %12 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %12, align 8
  %exitcond105.1 = icmp eq i64 %indvars.iv.next82, %1
  br i1 %exitcond105.1, label %for.cond9.preheader.loopexit, label %for.inc

for.inc25.lr.ph:                                  ; preds = %for.inc44, %for.cond13.preheader.lr.ph
  %indvars.iv79 = phi i64 [ 0, %for.cond13.preheader.lr.ph ], [ %indvars.iv.next80, %for.inc44 ]
  %13 = shl i64 %indvars.iv79, 32
  %sext = add nuw nsw i64 %13, 4294967296
  %14 = ashr exact i64 %sext, 32
  %scevgep77 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv79, i64 %14
  %15 = sub nsw i64 %5, %indvars.iv79
  %16 = shl i64 %15, 3
  %17 = and i64 %16, 34359738360
  br label %for.inc25

for.cond29.preheader:                             ; preds = %for.inc25
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %cmp3018 = icmp slt i64 %indvars.iv.next80, %6
  br i1 %cmp3018, label %for.inc37.for.inc44_crit_edge, label %for.inc44

for.inc25:                                        ; preds = %for.inc25.for.inc25_crit_edge, %for.inc25.lr.ph
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc25.for.inc25_crit_edge ], [ 0, %for.inc25.lr.ph ]
  %18 = sub nsw i64 0, %indvars.iv63
  %19 = trunc i64 %18 to i32
  %rem = srem i32 %19, %n
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, %conv18
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv79, i64 %indvars.iv63
  store double %add20, double* %arrayidx24, align 8
  %exitcond69 = icmp eq i64 %indvars.iv63, %indvars.iv79
  br i1 %exitcond69, label %for.cond29.preheader, label %for.inc25.for.inc25_crit_edge

for.inc25.for.inc25_crit_edge:                    ; preds = %for.inc25
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  br label %for.inc25

for.inc37.for.inc44_crit_edge:                    ; preds = %for.cond29.preheader
  %20 = add nuw nsw i64 %17, 8
  %scevgep7778 = bitcast double* %scevgep77 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep7778, i8 0, i64 %20, i32 8, i1 false)
  br label %for.inc44

for.inc44:                                        ; preds = %for.cond29.preheader, %for.inc37.for.inc44_crit_edge
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv79, i64 %indvars.iv79
  store double 1.000000e+00, double* %arrayidx43, align 8
  %exitcond104 = icmp eq i64 %indvars.iv.next80, %7
  br i1 %exitcond104, label %for.end46, label %for.inc25.lr.ph

for.end46.thread:                                 ; preds = %for.cond9.preheader, %entry
  %call88 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.end120

for.end46:                                        ; preds = %for.inc44
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %cmp4813 = icmp sgt i32 %n, 0
  br i1 %cmp4813, label %for.end46.for.cond51.preheader.us_crit_edge, label %for.end120

for.end46.for.cond51.preheader.us_crit_edge:      ; preds = %for.end46
  %21 = add i32 %n, -1
  %22 = zext i32 %21 to i64
  %23 = shl nuw nsw i64 %22, 3
  %24 = add nuw nsw i64 %23, 8
  %25 = sext i32 %n to i64
  %26 = add nsw i64 %25, -1
  %xtraiter106 = and i64 %25, 7
  %lcmp.mod107 = icmp eq i64 %xtraiter106, 0
  br i1 %lcmp.mod107, label %for.inc62.us.prol.loopexit, label %for.inc62.us.prol.preheader

for.inc62.us.prol.preheader:                      ; preds = %for.end46.for.cond51.preheader.us_crit_edge
  br label %for.inc62.us.prol

for.inc62.us.prol:                                ; preds = %for.inc62.us.prol, %for.inc62.us.prol.preheader
  %indvars.iv61.prol = phi i64 [ 0, %for.inc62.us.prol.preheader ], [ %indvars.iv.next62.prol, %for.inc62.us.prol ]
  %prol.iter = phi i64 [ %xtraiter106, %for.inc62.us.prol.preheader ], [ %prol.iter.sub, %for.inc62.us.prol ]
  %27 = mul nuw nsw i64 %indvars.iv61.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next62.prol = add nuw nsw i64 %indvars.iv61.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc62.us.prol.loopexit.loopexit, label %for.inc62.us.prol, !llvm.loop !1

for.inc62.us.prol.loopexit.loopexit:              ; preds = %for.inc62.us.prol
  br label %for.inc62.us.prol.loopexit

for.inc62.us.prol.loopexit:                       ; preds = %for.inc62.us.prol.loopexit.loopexit, %for.end46.for.cond51.preheader.us_crit_edge
  %indvars.iv61.unr = phi i64 [ 0, %for.end46.for.cond51.preheader.us_crit_edge ], [ %indvars.iv.next62.prol, %for.inc62.us.prol.loopexit.loopexit ]
  %28 = icmp ult i64 %26, 7
  br i1 %28, label %for.cond65.preheader, label %for.end46.for.cond51.preheader.us_crit_edge.new

for.end46.for.cond51.preheader.us_crit_edge.new:  ; preds = %for.inc62.us.prol.loopexit
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us, %for.end46.for.cond51.preheader.us_crit_edge.new
  %indvars.iv61 = phi i64 [ %indvars.iv61.unr, %for.end46.for.cond51.preheader.us_crit_edge.new ], [ %indvars.iv.next62.7, %for.inc62.us ]
  %29 = mul nuw nsw i64 %indvars.iv61, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %24, i32 8, i1 false)
  %30 = mul i64 %indvars.iv61, 16000
  %31 = add i64 %30, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %24, i32 8, i1 false)
  %32 = mul i64 %indvars.iv61, 16000
  %33 = add i64 %32, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %24, i32 8, i1 false)
  %34 = mul i64 %indvars.iv61, 16000
  %35 = add i64 %34, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %24, i32 8, i1 false)
  %36 = mul i64 %indvars.iv61, 16000
  %37 = add i64 %36, 64000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 %24, i32 8, i1 false)
  %38 = mul i64 %indvars.iv61, 16000
  %39 = add i64 %38, 80000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 %24, i32 8, i1 false)
  %40 = mul i64 %indvars.iv61, 16000
  %41 = add i64 %40, 96000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 %24, i32 8, i1 false)
  %42 = mul i64 %indvars.iv61, 16000
  %43 = add i64 %42, 112000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next62.7 = add nsw i64 %indvars.iv61, 8
  %exitcond103.7 = icmp eq i64 %indvars.iv.next62.7, %25
  br i1 %exitcond103.7, label %for.cond65.preheader.loopexit, label %for.inc62.us

for.cond65.preheader.loopexit:                    ; preds = %for.inc62.us
  br label %for.cond65.preheader

for.cond65.preheader:                             ; preds = %for.cond65.preheader.loopexit, %for.inc62.us.prol.loopexit
  %cmp669 = icmp sgt i32 %n, 0
  br i1 %cmp669, label %for.cond69.preheader.lr.ph, label %for.end120

for.cond69.preheader.lr.ph:                       ; preds = %for.cond65.preheader
  %44 = add i32 %n, -1
  %45 = sext i32 %n to i64
  %46 = zext i32 %44 to i64
  %47 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge: ; preds = %for.inc96.us, %for.cond69.preheader.lr.ph
  %indvars.iv55 = phi i64 [ 0, %for.cond69.preheader.lr.ph ], [ %indvars.iv.next56, %for.inc96.us ]
  br label %for.cond73.preheader.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next56, %45
  br i1 %exitcond102, label %for.cond99.preheader, label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond73.preheader.us.us:                       ; preds = %for.inc93.us.us, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge
  %indvars.iv53 = phi i64 [ 0, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge ], [ %indvars.iv.next54, %for.inc93.us.us ]
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv55
  br label %for.inc90.us.us

for.inc93.us.us:                                  ; preds = %for.inc90.us.us
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next54, %45
  br i1 %exitcond101, label %for.inc96.us, label %for.cond73.preheader.us.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us.for.inc90.us.us_crit_edge, %for.cond73.preheader.us.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.inc90.us.us.for.inc90.us.us_crit_edge ], [ 0, %for.cond73.preheader.us.us ]
  %48 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv55
  %49 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %48, %49
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv53, i64 %indvars.iv49
  %50 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %50, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %exitcond100 = icmp eq i64 %indvars.iv49, %46
  br i1 %exitcond100, label %for.inc93.us.us, label %for.inc90.us.us.for.inc90.us.us_crit_edge

for.inc90.us.us.for.inc90.us.us_crit_edge:        ; preds = %for.inc90.us.us
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  br label %for.inc90.us.us

for.cond99.preheader:                             ; preds = %for.inc96.us
  %cmp1003 = icmp sgt i32 %n, 0
  br i1 %cmp1003, label %for.cond99.preheader.for.cond103.preheader.us_crit_edge, label %for.end120

for.cond99.preheader.for.cond103.preheader.us_crit_edge: ; preds = %for.cond99.preheader
  %51 = add i32 %n, -1
  %52 = sext i32 %n to i64
  %53 = zext i32 %51 to i64
  %xtraiter = and i64 %45, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.cond103.preheader.us.prol.loopexit, label %for.cond103.preheader.us.prol

for.cond103.preheader.us.prol:                    ; preds = %for.cond99.preheader.for.cond103.preheader.us_crit_edge
  %54 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.inc115.us.prol

for.inc115.us.prol:                               ; preds = %for.inc115.us.for.inc115.us_crit_edge.prol, %for.cond103.preheader.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc115.us.for.inc115.us_crit_edge.prol ], [ 0, %for.cond103.preheader.us.prol ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 0, i64 %indvars.iv.prol
  %55 = bitcast double* %arrayidx110.us.prol to i64*
  %56 = load i64, i64* %55, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv.prol
  %57 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %56, i64* %57, align 8
  %exitcond99.prol = icmp eq i64 %indvars.iv.prol, %53
  br i1 %exitcond99.prol, label %for.cond103.preheader.us.prol.loopexit.loopexit, label %for.inc115.us.for.inc115.us_crit_edge.prol

for.inc115.us.for.inc115.us_crit_edge.prol:       ; preds = %for.inc115.us.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %for.inc115.us.prol

for.cond103.preheader.us.prol.loopexit.loopexit:  ; preds = %for.inc115.us.prol
  br label %for.cond103.preheader.us.prol.loopexit

for.cond103.preheader.us.prol.loopexit:           ; preds = %for.cond103.preheader.us.prol.loopexit.loopexit, %for.cond99.preheader.for.cond103.preheader.us_crit_edge
  %indvars.iv47.unr = phi i64 [ 0, %for.cond99.preheader.for.cond103.preheader.us_crit_edge ], [ 1, %for.cond103.preheader.us.prol.loopexit.loopexit ]
  %58 = icmp eq i32 %n, 1
  br i1 %58, label %for.end120, label %for.cond99.preheader.for.cond103.preheader.us_crit_edge.new

for.cond99.preheader.for.cond103.preheader.us_crit_edge.new: ; preds = %for.cond103.preheader.us.prol.loopexit
  %59 = bitcast i8* %call to [2000 x [2000 x double]]*
  %60 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond103.preheader.us

for.cond103.preheader.us:                         ; preds = %for.inc118.us.1, %for.cond99.preheader.for.cond103.preheader.us_crit_edge.new
  %indvars.iv47 = phi i64 [ %indvars.iv47.unr, %for.cond99.preheader.for.cond103.preheader.us_crit_edge.new ], [ %indvars.iv.next48.1, %for.inc118.us.1 ]
  br label %for.inc115.us

for.inc115.us:                                    ; preds = %for.inc115.us.for.inc115.us_crit_edge, %for.cond103.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc115.us.for.inc115.us_crit_edge ], [ 0, %for.cond103.preheader.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv47, i64 %indvars.iv
  %61 = bitcast double* %arrayidx110.us to i64*
  %62 = load i64, i64* %61, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv
  %63 = bitcast double* %arrayidx114.us to i64*
  store i64 %62, i64* %63, align 8
  %exitcond99 = icmp eq i64 %indvars.iv, %53
  br i1 %exitcond99, label %for.inc118.us, label %for.inc115.us.for.inc115.us_crit_edge

for.inc115.us.for.inc115.us_crit_edge:            ; preds = %for.inc115.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc115.us

for.inc118.us:                                    ; preds = %for.inc115.us
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  br label %for.inc115.us.1

for.end120.loopexit:                              ; preds = %for.inc118.us.1
  br label %for.end120

for.end120:                                       ; preds = %for.end120.loopexit, %for.cond103.preheader.us.prol.loopexit, %for.cond99.preheader, %for.cond65.preheader, %for.end46, %for.end46.thread
  %call909397 = phi i8* [ %call88, %for.end46.thread ], [ %call, %for.end46 ], [ %call, %for.cond65.preheader ], [ %call, %for.cond99.preheader ], [ %call, %for.cond103.preheader.us.prol.loopexit ], [ %call, %for.end120.loopexit ]
  tail call void @free(i8* %call909397) #4
  ret void

for.inc115.us.1:                                  ; preds = %for.inc115.us.for.inc115.us_crit_edge.1, %for.inc118.us
  %indvars.iv.1 = phi i64 [ %indvars.iv.next.1, %for.inc115.us.for.inc115.us_crit_edge.1 ], [ 0, %for.inc118.us ]
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %60, i64 0, i64 %indvars.iv.next48, i64 %indvars.iv.1
  %64 = bitcast double* %arrayidx110.us.1 to i64*
  %65 = load i64, i64* %64, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next48, i64 %indvars.iv.1
  %66 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %65, i64* %66, align 8
  %exitcond99.1 = icmp eq i64 %indvars.iv.1, %53
  br i1 %exitcond99.1, label %for.inc118.us.1, label %for.inc115.us.for.inc115.us_crit_edge.1

for.inc115.us.for.inc115.us_crit_edge.1:          ; preds = %for.inc115.us.1
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.1, 1
  br label %for.inc115.us.1

for.inc118.us.1:                                  ; preds = %for.inc115.us.1
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next48.1, %52
  br i1 %exitcond.1, label %for.end120.loopexit, label %for.cond103.preheader.us
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32 %n, [2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  %cmp28 = icmp sgt i32 %n, 0
  br i1 %cmp28, label %entry.for.cond1.preheader_crit_edge, label %for.end113

entry.for.cond1.preheader_crit_edge:              ; preds = %entry
  %0 = add i32 %n, -1
  %1 = sext i32 %n to i64
  %2 = sext i32 %n to i64
  %3 = zext i32 %0 to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58.for.cond1.preheader_crit_edge, %entry.for.cond1.preheader_crit_edge
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %for.inc58.for.cond1.preheader_crit_edge ], [ 4294967295, %entry.for.cond1.preheader_crit_edge ]
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.inc58.for.cond1.preheader_crit_edge ], [ 0, %entry.for.cond1.preheader_crit_edge ]
  %4 = and i64 %indvars.iv79, 4294967295
  %cmp220 = icmp sgt i64 %indvars.iv66, 0
  br i1 %cmp220, label %for.body3.preheader, label %for.body30.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader
  br label %for.body3

for.cond61.preheader:                             ; preds = %for.inc58
  %cmp6214 = icmp sgt i32 %n, 0
  br i1 %cmp6214, label %for.cond61.preheader.for.body63_crit_edge, label %for.end113

for.cond61.preheader.for.body63_crit_edge:        ; preds = %for.cond61.preheader
  %5 = sext i32 %n to i64
  br label %for.body63

for.body30.lr.ph:                                 ; preds = %for.inc25
  %cmp3622 = icmp sgt i64 %indvars.iv66, 0
  br i1 %cmp3622, label %for.body30.us.preheader, label %for.body30.preheader

for.body30.preheader:                             ; preds = %for.cond1.preheader, %for.body30.lr.ph
  br label %for.body30

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.inc55.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.inc55.us ], [ %indvars.iv66, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv64
  %6 = load double, double* %arrayidx34.us, align 8
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.for.inc48.us_crit_edge, %for.body30.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %for.inc48.us.for.inc48.us_crit_edge ], [ 0, %for.body30.us ]
  %w.124.us = phi double [ %sub47.us, %for.inc48.us.for.inc48.us_crit_edge ], [ %6, %for.body30.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv56
  %7 = load double, double* %arrayidx41.us, align 8
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv56, i64 %indvars.iv64
  %8 = load double, double* %arrayidx45.us, align 8
  %mul46.us = fmul double %7, %8
  %sub47.us = fsub double %w.124.us, %mul46.us
  %exitcond81 = icmp eq i64 %indvars.iv56, %4
  br i1 %exitcond81, label %for.inc55.us, label %for.inc48.us.for.inc48.us_crit_edge

for.inc48.us.for.inc48.us_crit_edge:              ; preds = %for.inc48.us
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  br label %for.inc48.us

for.inc55.us:                                     ; preds = %for.inc48.us
  %arrayidx54.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv64
  store double %sub47.us, double* %arrayidx54.us, align 8
  %indvars.iv.next65 = add nuw i64 %indvars.iv64, 1
  %cmp29.us = icmp slt i64 %indvars.iv.next65, %1
  br i1 %cmp29.us, label %for.body30.us, label %for.inc58.loopexit

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25.for.body3_crit_edge
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %for.inc25.for.body3_crit_edge ], [ 4294967295, %for.body3.preheader ]
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.inc25.for.body3_crit_edge ], [ 0, %for.body3.preheader ]
  %9 = and i64 %indvars.iv75, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv47
  %10 = load double, double* %arrayidx5, align 8
  %cmp716 = icmp sgt i64 %indvars.iv47, 0
  br i1 %cmp716, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc.for.inc_crit_edge
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %for.inc.for.inc_crit_edge ], [ 0, %for.inc.preheader ]
  %w.018 = phi double [ %sub, %for.inc.for.inc_crit_edge ], [ %10, %for.inc.preheader ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv41
  %11 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv41, i64 %indvars.iv47
  %12 = load double, double* %arrayidx16, align 8
  %mul = fmul double %11, %12
  %sub = fsub double %w.018, %mul
  %exitcond77 = icmp eq i64 %indvars.iv41, %9
  br i1 %exitcond77, label %for.inc25.loopexit, label %for.inc.for.inc_crit_edge

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  br label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.body3
  %w.0.lcssa = phi double [ %10, %for.body3 ], [ %sub, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv47
  %13 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %13
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv47
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next48 = add nuw i64 %indvars.iv47, 1
  %cmp2 = icmp slt i64 %indvars.iv.next48, %indvars.iv66
  br i1 %cmp2, label %for.inc25.for.body3_crit_edge, label %for.body30.lr.ph

for.inc25.for.body3_crit_edge:                    ; preds = %for.inc25
  %indvars.iv.next76 = add nuw nsw i64 %9, 1
  br label %for.body3

for.body30:                                       ; preds = %for.body30.preheader, %for.body30.for.body30_crit_edge
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.body30.for.body30_crit_edge ], [ %indvars.iv66, %for.body30.preheader ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv51
  %14 = bitcast double* %arrayidx34 to i64*
  %15 = load i64, i64* %14, align 8
  %arrayidx54 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv51
  %16 = bitcast double* %arrayidx54 to i64*
  store i64 %15, i64* %16, align 8
  %exitcond78 = icmp eq i64 %indvars.iv51, %3
  br i1 %exitcond78, label %for.inc58.loopexit88, label %for.body30.for.body30_crit_edge

for.body30.for.body30_crit_edge:                  ; preds = %for.body30
  %indvars.iv.next52 = add nuw i64 %indvars.iv51, 1
  br label %for.body30

for.inc58.loopexit:                               ; preds = %for.inc55.us
  br label %for.inc58

for.inc58.loopexit88:                             ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit88, %for.inc58.loopexit
  %indvars.iv.next67 = add nuw i64 %indvars.iv66, 1
  %cmp = icmp slt i64 %indvars.iv.next67, %2
  br i1 %cmp, label %for.inc58.for.cond1.preheader_crit_edge, label %for.cond61.preheader

for.inc58.for.cond1.preheader_crit_edge:          ; preds = %for.inc58
  %indvars.iv.next80 = add nuw nsw i64 %4, 1
  br label %for.cond1.preheader

for.cond86.preheader:                             ; preds = %for.inc82
  %cmp876 = icmp sgt i32 %n, 0
  br i1 %cmp876, label %for.cond86.preheader.for.body88_crit_edge, label %for.end113

for.cond86.preheader.for.body88_crit_edge:        ; preds = %for.cond86.preheader
  %17 = sext i32 %n to i64
  %18 = add i32 %n, -1
  %wide.trip.count = sext i32 %18 to i64
  %sunkaddr = ptrtoint double* %x to i64
  br label %for.body88

for.body63:                                       ; preds = %for.inc82.for.body63_crit_edge, %for.cond61.preheader.for.body63_crit_edge
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %for.inc82.for.body63_crit_edge ], [ 4294967295, %for.cond61.preheader.for.body63_crit_edge ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %for.inc82.for.body63_crit_edge ], [ 0, %for.cond61.preheader.for.body63_crit_edge ]
  %19 = and i64 %indvars.iv72, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv39
  %20 = load double, double* %arrayidx65, align 8
  %cmp679 = icmp sgt i64 %indvars.iv39, 0
  br i1 %cmp679, label %for.inc77.preheader, label %for.inc82

for.inc77.preheader:                              ; preds = %for.body63
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77.preheader, %for.inc77.for.inc77_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc77.for.inc77_crit_edge ], [ 0, %for.inc77.preheader ]
  %w.211 = phi double [ %sub76, %for.inc77.for.inc77_crit_edge ], [ %20, %for.inc77.preheader ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv
  %21 = load double, double* %arrayidx72, align 8
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %22 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %21, %22
  %sub76 = fsub double %w.211, %mul75
  %exitcond74 = icmp eq i64 %indvars.iv, %19
  br i1 %exitcond74, label %for.inc82.loopexit, label %for.inc77.for.inc77_crit_edge

for.inc77.for.inc77_crit_edge:                    ; preds = %for.inc77
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.body63
  %w.2.lcssa = phi double [ %20, %for.body63 ], [ %sub76, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv39
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next40 = add nuw i64 %indvars.iv39, 1
  %cmp62 = icmp slt i64 %indvars.iv.next40, %5
  br i1 %cmp62, label %for.inc82.for.body63_crit_edge, label %for.cond86.preheader

for.inc82.for.body63_crit_edge:                   ; preds = %for.inc82
  %indvars.iv.next73 = add nuw nsw i64 %19, 1
  br label %for.body63

for.body88:                                       ; preds = %for.inc112, %for.cond86.preheader.for.body88_crit_edge
  %indvars.iv33 = phi i64 [ %17, %for.cond86.preheader.for.body88_crit_edge ], [ %indvars.iv.next34, %for.inc112 ]
  %i.28.in = phi i32 [ %n, %for.cond86.preheader.for.body88_crit_edge ], [ %i.28, %for.inc112 ]
  %indvars.iv.next34 = add nsw i64 %indvars.iv33, -1
  %i.28 = add nsw i32 %i.28.in, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next34
  %23 = load double, double* %arrayidx90, align 8
  %cmp921 = icmp slt i32 %i.28.in, %n
  br i1 %cmp921, label %for.inc102.preheader, label %for.inc112

for.inc102.preheader:                             ; preds = %for.body88
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102.preheader, %for.inc102.for.inc102_crit_edge
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.inc102.for.inc102_crit_edge ], [ %indvars.iv33, %for.inc102.preheader ]
  %w.33 = phi double [ %sub101, %for.inc102.for.inc102_crit_edge ], [ %23, %for.inc102.preheader ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv31
  %24 = load double, double* %arrayidx97, align 8
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv31
  %25 = load double, double* %arrayidx99, align 8
  %mul100 = fmul double %24, %25
  %sub101 = fsub double %w.33, %mul100
  %exitcond = icmp eq i64 %indvars.iv31, %wide.trip.count
  br i1 %exitcond, label %for.inc112.loopexit, label %for.inc102.for.inc102_crit_edge

for.inc102.for.inc102_crit_edge:                  ; preds = %for.inc102
  %indvars.iv.next32 = add i64 %indvars.iv31, 1
  br label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.body88
  %w.3.lcssa = phi double [ %23, %for.body88 ], [ %sub101, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv.next34
  %26 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %26
  %sunkaddr83 = shl i64 %indvars.iv33, 3
  %sunkaddr84 = add i64 %sunkaddr, %sunkaddr83
  %sunkaddr85 = add i64 %sunkaddr84, -8
  %sunkaddr86 = inttoptr i64 %sunkaddr85 to double*
  store double %div109, double* %sunkaddr86, align 8
  %cmp87 = icmp sgt i64 %indvars.iv33, 1
  br i1 %cmp87, label %for.body88, label %for.end113.loopexit

for.end113.loopexit:                              ; preds = %for.inc112
  br label %for.end113

for.end113:                                       ; preds = %for.end113.loopexit, %for.cond86.preheader, %for.cond61.preheader, %entry
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
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %entry.for.body_crit_edge, label %for.end

entry.for.body_crit_edge:                         ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %entry.for.body_crit_edge
  %indvars.iv = phi i64 [ 0, %entry.for.body_crit_edge ], [ %indvars.iv.next, %for.inc ]
  %4 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6
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
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #6
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
