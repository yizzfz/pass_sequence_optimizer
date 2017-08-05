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

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
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
  br i1 %cmp22, label %for.inc.preheader, label %for.end46.thread

for.inc.preheader:                                ; preds = %entry
  %xtraiter103 = and i32 %n, 1
  %lcmp.mod104 = icmp eq i32 %xtraiter103, 0
  br i1 %lcmp.mod104, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.preheader
  store double 0.000000e+00, double* %x, align 8
  store double 0.000000e+00, double* %y, align 8
  %div.prol = fdiv double 1.000000e+00, %conv
  %div5.prol = fmul double %div.prol, 5.000000e-01
  %add6.prol = fadd double %div5.prol, 4.000000e+00
  store double %add6.prol, double* %b, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.preheader, %for.inc.prol
  %indvars.iv97.unr = phi i64 [ 0, %for.inc.preheader ], [ 1, %for.inc.prol ]
  %0 = icmp eq i32 %n, 1
  br i1 %0, label %for.cond13.preheader.lr.ph, label %for.inc.preheader119

for.inc.preheader119:                             ; preds = %for.inc.prol.loopexit
  %wide.trip.count99.1 = zext i32 %n to i64
  %1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc

for.cond9.preheader:                              ; preds = %for.inc
  %cmp1020 = icmp sgt i32 %n, 0
  br i1 %cmp1020, label %for.cond13.preheader.lr.ph, label %for.end46.thread

for.cond13.preheader.lr.ph:                       ; preds = %for.inc.prol.loopexit, %for.cond9.preheader
  %conv18 = sitofp i32 %n to double
  %2 = add i32 %n, -2
  %3 = zext i32 %2 to i64
  %4 = sext i32 %n to i64
  %wide.trip.count95 = zext i32 %n to i64
  br label %for.inc25.lr.ph

for.inc:                                          ; preds = %for.inc.preheader119, %for.inc
  %indvars.iv97 = phi i64 [ %indvars.iv.next98.1, %for.inc ], [ %indvars.iv97.unr, %for.inc.preheader119 ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv97
  %5 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv97
  %6 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %7 = trunc i64 %indvars.iv.next98 to i32
  %conv4 = sitofp i32 %7 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv97
  store <2 x double> zeroinitializer, <2 x double>* %5, align 8
  store <2 x double> zeroinitializer, <2 x double>* %6, align 8
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv97, 2
  %8 = trunc i64 %indvars.iv.next98.1 to i32
  %conv4.1 = sitofp i32 %8 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, %div.v.i1.2
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %9 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %9, align 8
  %exitcond100.1 = icmp eq i64 %indvars.iv.next98.1, %wide.trip.count99.1
  br i1 %exitcond100.1, label %for.cond9.preheader, label %for.inc

for.inc25.lr.ph:                                  ; preds = %for.cond13.preheader.lr.ph, %for.inc44
  %indvars.iv93 = phi i64 [ 0, %for.cond13.preheader.lr.ph ], [ %indvars.iv.next94, %for.inc44 ]
  %indvars.iv91 = phi i64 [ 1, %for.cond13.preheader.lr.ph ], [ %indvars.iv.next92, %for.inc44 ]
  %10 = mul nuw nsw i64 %indvars.iv93, 2001
  %11 = add nuw nsw i64 %10, 1
  %scevgep89 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %11
  %scevgep8990 = bitcast double* %scevgep89 to i8*
  %12 = sub i64 %3, %indvars.iv93
  %13 = shl i64 %12, 3
  %14 = and i64 %13, 34359738360
  %15 = add nuw nsw i64 %14, 8
  br label %for.inc25

for.cond29.preheader:                             ; preds = %for.inc25
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %cmp3018 = icmp slt i64 %indvars.iv.next94, %4
  br i1 %cmp3018, label %for.inc44.loopexit, label %for.inc44

for.inc25:                                        ; preds = %for.inc25, %for.inc25.lr.ph
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %for.inc25 ], [ 0, %for.inc25.lr.ph ]
  %16 = sub nsw i64 0, %indvars.iv76
  %17 = trunc i64 %16 to i32
  %rem = srem i32 %17, %n
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, %conv18
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv93, i64 %indvars.iv76
  store double %add20, double* %arrayidx24, align 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next77, %indvars.iv91
  br i1 %exitcond82, label %for.cond29.preheader, label %for.inc25

for.inc44.loopexit:                               ; preds = %for.cond29.preheader
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep8990, i8 0, i64 %15, i32 8, i1 false)
  br label %for.inc44

for.inc44:                                        ; preds = %for.inc44.loopexit, %for.cond29.preheader
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv93, i64 %indvars.iv93
  store double 1.000000e+00, double* %arrayidx43, align 8
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next94, %wide.trip.count95
  br i1 %exitcond96, label %for.end46, label %for.inc25.lr.ph

for.end46.thread:                                 ; preds = %for.cond9.preheader, %entry
  %call108 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.end120

for.end46:                                        ; preds = %for.inc44
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %18 = bitcast i8* %call to [2000 x [2000 x double]]*
  %cmp4813 = icmp sgt i32 %n, 0
  br i1 %cmp4813, label %for.cond51.preheader.us.preheader, label %for.end120

for.cond51.preheader.us.preheader:                ; preds = %for.end46
  %19 = add i32 %n, -1
  %20 = zext i32 %19 to i64
  %21 = shl nuw nsw i64 %20, 3
  %22 = add nuw nsw i64 %21, 8
  %xtraiter73 = and i32 %n, 3
  %lcmp.mod74 = icmp eq i32 %xtraiter73, 0
  br i1 %lcmp.mod74, label %for.cond51.preheader.us.prol.loopexit, label %for.inc62.us.prol.preheader

for.inc62.us.prol.preheader:                      ; preds = %for.cond51.preheader.us.preheader
  br label %for.inc62.us.prol

for.inc62.us.prol:                                ; preds = %for.inc62.us.prol.preheader, %for.inc62.us.prol
  %indvars.iv69.prol = phi i64 [ %indvars.iv.next70.prol, %for.inc62.us.prol ], [ 0, %for.inc62.us.prol.preheader ]
  %prol.iter75 = phi i32 [ %prol.iter75.sub, %for.inc62.us.prol ], [ %xtraiter73, %for.inc62.us.prol.preheader ]
  %23 = mul nuw nsw i64 %indvars.iv69.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next70.prol = add nuw nsw i64 %indvars.iv69.prol, 1
  %prol.iter75.sub = add i32 %prol.iter75, -1
  %prol.iter75.cmp = icmp eq i32 %prol.iter75.sub, 0
  br i1 %prol.iter75.cmp, label %for.cond51.preheader.us.prol.loopexit.loopexit, label %for.inc62.us.prol, !llvm.loop !1

for.cond51.preheader.us.prol.loopexit.loopexit:   ; preds = %for.inc62.us.prol
  br label %for.cond51.preheader.us.prol.loopexit

for.cond51.preheader.us.prol.loopexit:            ; preds = %for.cond51.preheader.us.prol.loopexit.loopexit, %for.cond51.preheader.us.preheader
  %indvars.iv69.unr = phi i64 [ 0, %for.cond51.preheader.us.preheader ], [ %indvars.iv.next70.prol, %for.cond51.preheader.us.prol.loopexit.loopexit ]
  %24 = icmp ult i32 %19, 3
  br i1 %24, label %for.cond69.preheader.lr.ph, label %for.inc62.us.3.preheader

for.inc62.us.3.preheader:                         ; preds = %for.cond51.preheader.us.prol.loopexit
  %wide.trip.count71.3 = zext i32 %n to i64
  %25 = add nsw i64 %wide.trip.count71.3, -4
  %26 = sub i64 %25, %indvars.iv69.unr
  %27 = lshr i64 %26, 2
  %28 = and i64 %27, 1
  %lcmp.mod121 = icmp eq i64 %28, 0
  br i1 %lcmp.mod121, label %for.inc62.us.3.prol.preheader, label %for.inc62.us.3.prol.loopexit

for.inc62.us.3.prol.preheader:                    ; preds = %for.inc62.us.3.preheader
  br label %for.inc62.us.3.prol

for.inc62.us.3.prol:                              ; preds = %for.inc62.us.3.prol.preheader
  %29 = mul nuw nsw i64 %indvars.iv69.unr, 16000
  %scevgep.prol123 = getelementptr i8, i8* %call, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol123, i8 0, i64 %22, i32 8, i1 false)
  %30 = mul i64 %indvars.iv69.unr, 16000
  %31 = add i64 %30, 16000
  %scevgep.1.prol = getelementptr i8, i8* %call, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %22, i32 8, i1 false)
  %32 = mul i64 %indvars.iv69.unr, 16000
  %33 = add i64 %32, 32000
  %scevgep.2.prol = getelementptr i8, i8* %call, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %22, i32 8, i1 false)
  %34 = mul i64 %indvars.iv69.unr, 16000
  %35 = add i64 %34, 48000
  %scevgep.3.prol = getelementptr i8, i8* %call, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next70.3.prol = add nsw i64 %indvars.iv69.unr, 4
  br label %for.inc62.us.3.prol.loopexit

for.inc62.us.3.prol.loopexit:                     ; preds = %for.inc62.us.3.prol, %for.inc62.us.3.preheader
  %indvars.iv69.unr124 = phi i64 [ %indvars.iv69.unr, %for.inc62.us.3.preheader ], [ %indvars.iv.next70.3.prol, %for.inc62.us.3.prol ]
  %36 = icmp eq i64 %27, 0
  br i1 %36, label %for.cond65.preheader, label %for.inc62.us.3.preheader.new

for.inc62.us.3.preheader.new:                     ; preds = %for.inc62.us.3.prol.loopexit
  br label %for.inc62.us.3

for.cond65.preheader.unr-lcssa:                   ; preds = %for.inc62.us.3
  br label %for.cond65.preheader

for.cond65.preheader:                             ; preds = %for.inc62.us.3.prol.loopexit, %for.cond65.preheader.unr-lcssa
  %cmp669 = icmp sgt i32 %n, 0
  br i1 %cmp669, label %for.cond69.preheader.lr.ph, label %for.end120

for.cond69.preheader.lr.ph:                       ; preds = %for.cond51.preheader.us.prol.loopexit, %for.cond65.preheader
  %xtraiter55 = and i32 %n, 1
  %lcmp.mod56 = icmp eq i32 %xtraiter55, 0
  %37 = icmp eq i32 %n, 1
  %wide.trip.count59 = zext i32 %n to i64
  %wide.trip.count53.1 = zext i32 %n to i64
  %wide.trip.count63 = zext i32 %n to i64
  br label %for.cond73.preheader.us.us.preheader

for.cond73.preheader.us.us.preheader:             ; preds = %for.cond69.preheader.lr.ph, %for.inc96.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %for.inc96.us ], [ 0, %for.cond69.preheader.lr.ph ]
  %arrayidx84.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv61
  br label %for.cond73.preheader.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %for.cond99.preheader, label %for.cond73.preheader.us.us.preheader

for.cond73.preheader.us.us:                       ; preds = %for.inc93.us.us, %for.cond73.preheader.us.us.preheader
  %indvars.iv57 = phi i64 [ 0, %for.cond73.preheader.us.us.preheader ], [ %indvars.iv.next58, %for.inc93.us.us ]
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv61
  br i1 %lcmp.mod56, label %for.inc90.us.us.prol.loopexit, label %for.inc90.us.us.prol

for.inc90.us.us.prol:                             ; preds = %for.cond73.preheader.us.us
  %38 = load double, double* %arrayidx80.us.us, align 8
  %39 = load double, double* %arrayidx84.us.us.prol, align 8
  %mul.us.us.prol = fmul double %38, %39
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv57, i64 0
  %40 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %40, %mul.us.us.prol
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  br label %for.inc90.us.us.prol.loopexit

for.inc90.us.us.prol.loopexit:                    ; preds = %for.inc90.us.us.prol, %for.cond73.preheader.us.us
  %indvars.iv51.unr.ph = phi i64 [ 1, %for.inc90.us.us.prol ], [ 0, %for.cond73.preheader.us.us ]
  br i1 %37, label %for.inc93.us.us, label %for.inc90.us.us.preheader

for.inc90.us.us.preheader:                        ; preds = %for.inc90.us.us.prol.loopexit
  br label %for.inc90.us.us

for.inc93.us.us.loopexit:                         ; preds = %for.inc90.us.us
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit, %for.inc90.us.us.prol.loopexit
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %for.inc96.us, label %for.cond73.preheader.us.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us.preheader, %for.inc90.us.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52.1, %for.inc90.us.us ], [ %indvars.iv51.unr.ph, %for.inc90.us.us.preheader ]
  %41 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv61
  %42 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %41, %42
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv57, i64 %indvars.iv51
  %43 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %43, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %44 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next52, i64 %indvars.iv61
  %45 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %44, %45
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv57, i64 %indvars.iv.next52
  %46 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %46, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, %wide.trip.count53.1
  br i1 %exitcond54.1, label %for.inc93.us.us.loopexit, label %for.inc90.us.us

for.cond99.preheader:                             ; preds = %for.inc96.us
  %cmp1003 = icmp sgt i32 %n, 0
  br i1 %cmp1003, label %for.cond103.preheader.us.preheader, label %for.end120

for.cond103.preheader.us.preheader:               ; preds = %for.cond99.preheader
  %47 = add i32 %n, -1
  %xtraiter = and i32 %n, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %48 = icmp ult i32 %47, 3
  %wide.trip.count50 = zext i32 %n to i64
  %wide.trip.count.3 = zext i32 %n to i64
  br label %for.cond103.preheader.us

for.cond103.preheader.us:                         ; preds = %for.inc118.us, %for.cond103.preheader.us.preheader
  %indvars.iv48 = phi i64 [ 0, %for.cond103.preheader.us.preheader ], [ %indvars.iv.next49, %for.inc118.us ]
  br i1 %lcmp.mod, label %for.inc115.us.prol.loopexit, label %for.inc115.us.prol.preheader

for.inc115.us.prol.preheader:                     ; preds = %for.cond103.preheader.us
  br label %for.inc115.us.prol

for.inc115.us.prol:                               ; preds = %for.inc115.us.prol.preheader, %for.inc115.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc115.us.prol ], [ 0, %for.inc115.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc115.us.prol ], [ %xtraiter, %for.inc115.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv48, i64 %indvars.iv.prol
  %49 = bitcast double* %arrayidx110.us.prol to i64*
  %50 = load i64, i64* %49, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv.prol
  %51 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %50, i64* %51, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc115.us.prol.loopexit.loopexit, label %for.inc115.us.prol, !llvm.loop !3

for.inc115.us.prol.loopexit.loopexit:             ; preds = %for.inc115.us.prol
  br label %for.inc115.us.prol.loopexit

for.inc115.us.prol.loopexit:                      ; preds = %for.inc115.us.prol.loopexit.loopexit, %for.cond103.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %for.cond103.preheader.us ], [ %indvars.iv.next.prol, %for.inc115.us.prol.loopexit.loopexit ]
  br i1 %48, label %for.inc118.us, label %for.inc115.us.preheader

for.inc115.us.preheader:                          ; preds = %for.inc115.us.prol.loopexit
  br label %for.inc115.us

for.inc115.us:                                    ; preds = %for.inc115.us.preheader, %for.inc115.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc115.us ], [ %indvars.iv.unr, %for.inc115.us.preheader ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv48, i64 %indvars.iv
  %52 = bitcast double* %arrayidx110.us to i64*
  %53 = load i64, i64* %52, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv
  %54 = bitcast double* %arrayidx114.us to i64*
  store i64 %53, i64* %54, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv48, i64 %indvars.iv.next
  %55 = bitcast double* %arrayidx110.us.1 to i64*
  %56 = load i64, i64* %55, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv.next
  %57 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %56, i64* %57, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv48, i64 %indvars.iv.next.1
  %58 = bitcast double* %arrayidx110.us.2 to i64*
  %59 = load i64, i64* %58, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv.next.1
  %60 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %59, i64* %60, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv48, i64 %indvars.iv.next.2
  %61 = bitcast double* %arrayidx110.us.3 to i64*
  %62 = load i64, i64* %61, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv.next.2
  %63 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %62, i64* %63, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.inc118.us.loopexit, label %for.inc115.us

for.inc118.us.loopexit:                           ; preds = %for.inc115.us
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit, %for.inc115.us.prol.loopexit
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond, label %for.end120.loopexit, label %for.cond103.preheader.us

for.end120.loopexit:                              ; preds = %for.inc118.us
  br label %for.end120

for.end120:                                       ; preds = %for.end120.loopexit, %for.end46, %for.end46.thread, %for.cond65.preheader, %for.cond99.preheader
  %call110112118 = phi i8* [ %call, %for.cond99.preheader ], [ %call, %for.cond65.preheader ], [ %call, %for.end46 ], [ %call108, %for.end46.thread ], [ %call, %for.end120.loopexit ]
  tail call void @free(i8* %call110112118) #4
  ret void

for.inc62.us.3:                                   ; preds = %for.inc62.us.3, %for.inc62.us.3.preheader.new
  %indvars.iv69 = phi i64 [ %indvars.iv69.unr124, %for.inc62.us.3.preheader.new ], [ %indvars.iv.next70.3.1, %for.inc62.us.3 ]
  %64 = mul nuw nsw i64 %indvars.iv69, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %64
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %22, i32 8, i1 false)
  %65 = mul i64 %indvars.iv69, 16000
  %66 = add i64 %65, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %66
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %22, i32 8, i1 false)
  %67 = mul i64 %indvars.iv69, 16000
  %68 = add i64 %67, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %68
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %22, i32 8, i1 false)
  %69 = mul i64 %indvars.iv69, 16000
  %70 = add i64 %69, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %70
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next70.3 = add nsw i64 %indvars.iv69, 4
  %71 = mul nuw nsw i64 %indvars.iv.next70.3, 16000
  %scevgep.1125 = getelementptr i8, i8* %call, i64 %71
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1125, i8 0, i64 %22, i32 8, i1 false)
  %72 = mul i64 %indvars.iv.next70.3, 16000
  %73 = add i64 %72, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %73
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %22, i32 8, i1 false)
  %74 = mul i64 %indvars.iv.next70.3, 16000
  %75 = add i64 %74, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %75
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %22, i32 8, i1 false)
  %76 = mul i64 %indvars.iv.next70.3, 16000
  %77 = add i64 %76, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %77
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next70.3.1 = add nsw i64 %indvars.iv69, 8
  %exitcond72.3.1 = icmp eq i64 %indvars.iv.next70.3.1, %wide.trip.count71.3
  br i1 %exitcond72.3.1, label %for.cond65.preheader.unr-lcssa, label %for.inc62.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32 %n, [2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  %cmp30 = icmp sgt i32 %n, 0
  br i1 %cmp30, label %for.cond1.preheader.preheader, label %for.end113

for.cond1.preheader.preheader:                    ; preds = %entry
  %0 = zext i32 %n to i64
  %1 = zext i32 %n to i64
  %2 = add nuw nsw i64 %1, 4294967295
  %wide.trip.count92 = zext i32 %n to i64
  %wide.trip.count.3 = zext i32 %n to i64
  %wide.trip.count86 = zext i32 %n to i64
  %3 = add nsw i64 %wide.trip.count92, -4
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %for.cond1.preheader.preheader
  %indvars.iv90 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next91, %for.inc58 ]
  %4 = add i64 %indvars.iv90, 4294967295
  %5 = sub i64 %0, %indvars.iv90
  %6 = trunc i64 %5 to i32
  %7 = sub i64 %2, %indvars.iv90
  %8 = trunc i64 %7 to i32
  %cmp220 = icmp sgt i64 %indvars.iv90, 0
  br i1 %cmp220, label %for.body3.preheader, label %for.body30.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 0
  br label %for.body3

for.cond61.preheader:                             ; preds = %for.inc58
  %cmp6214 = icmp sgt i32 %n, 0
  br i1 %cmp6214, label %for.body63.preheader, label %for.end113

for.body63.preheader:                             ; preds = %for.cond61.preheader
  %wide.trip.count49 = zext i32 %n to i64
  br label %for.body63

for.body30.lr.ph:                                 ; preds = %for.inc25
  %cmp3622 = icmp sgt i64 %indvars.iv90, 0
  br i1 %cmp3622, label %for.body30.us.preheader, label %for.body30.preheader

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %xtraiter8094 = and i64 %indvars.iv90, 1
  %lcmp.mod81 = icmp eq i64 %xtraiter8094, 0
  %9 = trunc i64 %4 to i32
  %10 = icmp eq i32 %9, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 0
  br label %for.body30.us

for.body30.preheader:                             ; preds = %for.cond1.preheader, %for.body30.lr.ph
  %xtraiter71 = and i32 %6, 3
  %lcmp.mod72 = icmp eq i32 %xtraiter71, 0
  br i1 %lcmp.mod72, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.preheader
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol.preheader, %for.body30.prol
  %indvars.iv67.prol = phi i64 [ %indvars.iv.next68.prol, %for.body30.prol ], [ %indvars.iv90, %for.body30.prol.preheader ]
  %prol.iter73 = phi i32 [ %prol.iter73.sub, %for.body30.prol ], [ %xtraiter71, %for.body30.prol.preheader ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv67.prol
  %11 = bitcast double* %arrayidx34.prol to i64*
  %12 = load i64, i64* %11, align 8
  %arrayidx54.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv67.prol
  %13 = bitcast double* %arrayidx54.prol to i64*
  store i64 %12, i64* %13, align 8
  %indvars.iv.next68.prol = add nuw nsw i64 %indvars.iv67.prol, 1
  %prol.iter73.sub = add i32 %prol.iter73, -1
  %prol.iter73.cmp = icmp eq i32 %prol.iter73.sub, 0
  br i1 %prol.iter73.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !4

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.preheader
  %indvars.iv67.unr = phi i64 [ %indvars.iv90, %for.body30.preheader ], [ %indvars.iv.next68.prol, %for.body30.prol.loopexit.loopexit ]
  %14 = icmp ult i32 %8, 3
  br i1 %14, label %for.inc58, label %for.body30.preheader109

for.body30.preheader109:                          ; preds = %for.body30.prol.loopexit
  %15 = sub i64 %3, %indvars.iv67.unr
  %16 = lshr i64 %15, 2
  %17 = and i64 %16, 1
  %lcmp.mod114 = icmp eq i64 %17, 0
  br i1 %lcmp.mod114, label %for.body30.prol.preheader111, label %for.body30.prol.loopexit112.unr-lcssa

for.body30.prol.preheader111:                     ; preds = %for.body30.preheader109
  br label %for.body30.prol115

for.body30.prol115:                               ; preds = %for.body30.prol.preheader111
  %arrayidx34.prol117 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv67.unr
  %18 = bitcast double* %arrayidx34.prol117 to <2 x i64>*
  %arrayidx54.prol118 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv67.unr
  %19 = load <2 x i64>, <2 x i64>* %18, align 8
  %20 = bitcast double* %arrayidx54.prol118 to <2 x i64>*
  store <2 x i64> %19, <2 x i64>* %20, align 8
  %indvars.iv.next68.1.prol = add nsw i64 %indvars.iv67.unr, 2
  %arrayidx34.2.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv.next68.1.prol
  %21 = bitcast double* %arrayidx34.2.prol to <2 x i64>*
  %arrayidx54.2.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv.next68.1.prol
  %22 = load <2 x i64>, <2 x i64>* %21, align 8
  %23 = bitcast double* %arrayidx54.2.prol to <2 x i64>*
  store <2 x i64> %22, <2 x i64>* %23, align 8
  %indvars.iv.next68.3.prol = add nsw i64 %indvars.iv67.unr, 4
  br label %for.body30.prol.loopexit112.unr-lcssa

for.body30.prol.loopexit112.unr-lcssa:            ; preds = %for.body30.preheader109, %for.body30.prol115
  %indvars.iv67.unr119.ph = phi i64 [ %indvars.iv.next68.3.prol, %for.body30.prol115 ], [ %indvars.iv67.unr, %for.body30.preheader109 ]
  br label %for.body30.prol.loopexit112

for.body30.prol.loopexit112:                      ; preds = %for.body30.prol.loopexit112.unr-lcssa
  %24 = icmp eq i64 %16, 0
  br i1 %24, label %for.inc58.loopexit110, label %for.body30.preheader109.new

for.body30.preheader109.new:                      ; preds = %for.body30.prol.loopexit112
  br label %for.body30

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.inc55.us
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %for.inc55.us ], [ %indvars.iv90, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv84
  %25 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod81, label %for.inc48.us.prol.loopexit, label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.body30.us
  %26 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv84
  %27 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %26, %27
  %sub47.us.prol = fsub double %25, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %indvars.iv74.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %w.124.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %25, %for.body30.us ]
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  br i1 %10, label %for.inc55.us, label %for.inc48.us.preheader

for.inc48.us.preheader:                           ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.preheader, %for.inc48.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75.1, %for.inc48.us ], [ %indvars.iv74.unr.ph, %for.inc48.us.preheader ]
  %w.124.us = phi double [ %sub47.us.1, %for.inc48.us ], [ %w.124.us.unr.ph, %for.inc48.us.preheader ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv74
  %28 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv74, i64 %indvars.iv84
  %29 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %30 = load <2 x double>, <2 x double>* %28, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next75, i64 %indvars.iv84
  %31 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %29, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %31, i32 1
  %mul46.us = fmul <2 x double> %30, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %w.124.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %indvars.iv.next75.1 = add nsw i64 %indvars.iv74, 2
  %exitcond79.1 = icmp eq i64 %indvars.iv.next75.1, %indvars.iv90
  br i1 %exitcond79.1, label %for.inc55.us.loopexit, label %for.inc48.us

for.inc55.us.loopexit:                            ; preds = %for.inc48.us
  br label %for.inc55.us

for.inc55.us:                                     ; preds = %for.inc55.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.inc55.us.loopexit ]
  %arrayidx54.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv84
  store double %sub47.us.lcssa, double* %arrayidx54.us, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next85, %wide.trip.count86
  br i1 %exitcond87, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %for.inc25 ], [ 0, %for.body3.preheader ]
  %32 = add i64 %indvars.iv59, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv59
  %33 = load double, double* %arrayidx5, align 8
  %cmp716 = icmp sgt i64 %indvars.iv59, 0
  br i1 %cmp716, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.body3
  %xtraiter5595 = and i64 %indvars.iv59, 1
  %lcmp.mod56 = icmp eq i64 %xtraiter5595, 0
  br i1 %lcmp.mod56, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %34 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv59
  %35 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %34, %35
  %sub.prol = fsub double %33, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.lr.ph
  %indvars.iv50.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %w.018.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %33, %for.inc.lr.ph ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.lr.ph ]
  %36 = trunc i64 %32 to i32
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %for.inc25, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.1, %for.inc ], [ %indvars.iv50.unr.ph, %for.inc.preheader ]
  %w.018 = phi double [ %sub.1, %for.inc ], [ %w.018.unr.ph, %for.inc.preheader ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv50
  %38 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv59
  %39 = load double, double* %arrayidx16, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %40 = load <2 x double>, <2 x double>* %38, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next51, i64 %indvars.iv59
  %41 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %39, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %41, i32 1
  %mul = fmul <2 x double> %40, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.018, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv50, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next51.1, %indvars.iv59
  br i1 %exitcond54.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.body3
  %w.0.lcssa = phi double [ %33, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv59
  %42 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %42
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv59
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next60, %indvars.iv90
  br i1 %exitcond64, label %for.body30.lr.ph, label %for.body3

for.body30:                                       ; preds = %for.body30, %for.body30.preheader109.new
  %indvars.iv67 = phi i64 [ %indvars.iv67.unr119.ph, %for.body30.preheader109.new ], [ %indvars.iv.next68.3.1, %for.body30 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv67
  %43 = bitcast double* %arrayidx34 to <2 x i64>*
  %arrayidx54 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv67
  %44 = load <2 x i64>, <2 x i64>* %43, align 8
  %45 = bitcast double* %arrayidx54 to <2 x i64>*
  store <2 x i64> %44, <2 x i64>* %45, align 8
  %indvars.iv.next68.1 = add nsw i64 %indvars.iv67, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv.next68.1
  %46 = bitcast double* %arrayidx34.2 to <2 x i64>*
  %arrayidx54.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv.next68.1
  %47 = load <2 x i64>, <2 x i64>* %46, align 8
  %48 = bitcast double* %arrayidx54.2 to <2 x i64>*
  store <2 x i64> %47, <2 x i64>* %48, align 8
  %indvars.iv.next68.3 = add nsw i64 %indvars.iv67, 4
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv.next68.3
  %49 = bitcast double* %arrayidx34.1 to <2 x i64>*
  %arrayidx54.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv.next68.3
  %50 = load <2 x i64>, <2 x i64>* %49, align 8
  %51 = bitcast double* %arrayidx54.1 to <2 x i64>*
  store <2 x i64> %50, <2 x i64>* %51, align 8
  %indvars.iv.next68.1.1 = add nsw i64 %indvars.iv67, 6
  %arrayidx34.2.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv.next68.1.1
  %52 = bitcast double* %arrayidx34.2.1 to <2 x i64>*
  %arrayidx54.2.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv.next68.1.1
  %53 = load <2 x i64>, <2 x i64>* %52, align 8
  %54 = bitcast double* %arrayidx54.2.1 to <2 x i64>*
  store <2 x i64> %53, <2 x i64>* %54, align 8
  %indvars.iv.next68.3.1 = add nsw i64 %indvars.iv67, 8
  %exitcond69.3.1 = icmp eq i64 %indvars.iv.next68.3.1, %wide.trip.count.3
  br i1 %exitcond69.3.1, label %for.inc58.loopexit110.unr-lcssa, label %for.body30

for.inc58.loopexit:                               ; preds = %for.inc55.us
  br label %for.inc58

for.inc58.loopexit110.unr-lcssa:                  ; preds = %for.body30
  br label %for.inc58.loopexit110

for.inc58.loopexit110:                            ; preds = %for.body30.prol.loopexit112, %for.inc58.loopexit110.unr-lcssa
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit110, %for.inc58.loopexit, %for.body30.prol.loopexit
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next91, %wide.trip.count92
  br i1 %exitcond93, label %for.cond61.preheader, label %for.cond1.preheader

for.cond86.preheader:                             ; preds = %for.inc82
  %cmp877 = icmp sgt i32 %n, 0
  br i1 %cmp877, label %for.body88.preheader, label %for.end113

for.body88.preheader:                             ; preds = %for.cond86.preheader
  %55 = sext i32 %n to i64
  %56 = sext i32 %n to i64
  br label %for.body88

for.body63:                                       ; preds = %for.body63.preheader, %for.inc82
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.inc82 ], [ 0, %for.body63.preheader ]
  %57 = add i64 %indvars.iv47, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv47
  %58 = load double, double* %arrayidx65, align 8
  %cmp679 = icmp sgt i64 %indvars.iv47, 0
  br i1 %cmp679, label %for.inc77.preheader, label %for.inc82

for.inc77.preheader:                              ; preds = %for.body63
  %59 = trunc i64 %indvars.iv47 to i32
  %xtraiter40 = and i32 %59, 3
  %lcmp.mod41 = icmp eq i32 %xtraiter40, 0
  br i1 %lcmp.mod41, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.preheader
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol.preheader, %for.inc77.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %w.211.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %58, %for.inc77.prol.preheader ]
  %prol.iter43 = phi i32 [ %prol.iter43.sub, %for.inc77.prol ], [ %xtraiter40, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv.prol
  %60 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %61 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %60, %61
  %sub76.prol = fsub double %w.211.prol, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter43.sub = add i32 %prol.iter43, -1
  %prol.iter43.cmp = icmp eq i32 %prol.iter43.sub, 0
  br i1 %prol.iter43.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !5

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.inc77.preheader ], [ %indvars.iv.next.prol, %for.inc77.prol.loopexit.loopexit ]
  %w.211.unr = phi double [ %58, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %62 = trunc i64 %57 to i32
  %63 = icmp ult i32 %62, 3
  br i1 %63, label %for.inc82, label %for.inc77.preheader108

for.inc77.preheader108:                           ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77.preheader108, %for.inc77
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc77 ], [ %indvars.iv.unr, %for.inc77.preheader108 ]
  %w.211 = phi double [ %sub76.3, %for.inc77 ], [ %w.211.unr, %for.inc77.preheader108 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv
  %64 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %65 = bitcast double* %arrayidx74 to <2 x double>*
  %66 = load <2 x double>, <2 x double>* %64, align 8
  %67 = load <2 x double>, <2 x double>* %65, align 8
  %mul75 = fmul <2 x double> %66, %67
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %w.211, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv.next.1
  %68 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %69 = bitcast double* %arrayidx74.2 to <2 x double>*
  %70 = load <2 x double>, <2 x double>* %68, align 8
  %71 = load <2 x double>, <2 x double>* %69, align 8
  %mul75.2 = fmul <2 x double> %70, %71
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.344 = icmp eq i64 %indvars.iv.next.3, %indvars.iv47
  br i1 %exitcond.344, label %for.inc82.loopexit, label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.inc77.prol.loopexit, %for.body63
  %w.2.lcssa = phi double [ %58, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv47
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond = icmp eq i64 %indvars.iv.next48, %wide.trip.count49
  br i1 %exitcond, label %for.cond86.preheader, label %for.body63

for.body88:                                       ; preds = %for.body88.preheader, %for.inc112
  %indvars.iv36 = phi i64 [ %55, %for.body88.preheader ], [ %indvars.iv.next37, %for.inc112 ]
  %indvar = phi i32 [ 0, %for.body88.preheader ], [ %indvar.next, %for.inc112 ]
  %72 = add nsw i32 %indvar, -1
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next37
  %73 = load double, double* %arrayidx90, align 8
  %cmp922 = icmp slt i64 %indvars.iv36, %56
  br i1 %cmp922, label %for.inc102.preheader, label %for.inc112

for.inc102.preheader:                             ; preds = %for.body88
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.preheader
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol.preheader, %for.inc102.prol
  %indvars.iv34.prol = phi i64 [ %indvars.iv.next35.prol, %for.inc102.prol ], [ %indvars.iv36, %for.inc102.prol.preheader ]
  %w.33.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %73, %for.inc102.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next37, i64 %indvars.iv34.prol
  %74 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv34.prol
  %75 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %74, %75
  %sub101.prol = fsub double %w.33.prol, %mul100.prol
  %indvars.iv.next35.prol = add nsw i64 %indvars.iv34.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !6

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.preheader
  %indvars.iv34.unr = phi i64 [ %indvars.iv36, %for.inc102.preheader ], [ %indvars.iv.next35.prol, %for.inc102.prol.loopexit.loopexit ]
  %w.33.unr = phi double [ %73, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %76 = icmp ult i32 %72, 3
  br i1 %76, label %for.inc112, label %for.inc102.preheader107

for.inc102.preheader107:                          ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102.preheader107, %for.inc102
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.3, %for.inc102 ], [ %indvars.iv34.unr, %for.inc102.preheader107 ]
  %w.33 = phi double [ %sub101.3, %for.inc102 ], [ %w.33.unr, %for.inc102.preheader107 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next37, i64 %indvars.iv34
  %77 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv34
  %78 = bitcast double* %arrayidx99 to <2 x double>*
  %79 = load <2 x double>, <2 x double>* %77, align 8
  %80 = load <2 x double>, <2 x double>* %78, align 8
  %mul100 = fmul <2 x double> %79, %80
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.33, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next37, i64 %indvars.iv.next35.1
  %81 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next35.1
  %82 = bitcast double* %arrayidx99.2 to <2 x double>*
  %83 = load <2 x double>, <2 x double>* %81, align 8
  %84 = load <2 x double>, <2 x double>* %82, align 8
  %mul100.2 = fmul <2 x double> %83, %84
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %indvars.iv.next35.3 = add nsw i64 %indvars.iv34, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next35.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %n
  br i1 %exitcond.3, label %for.inc112.loopexit, label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.inc102.prol.loopexit, %for.body88
  %w.3.lcssa = phi double [ %73, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next37, i64 %indvars.iv.next37
  %85 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %85
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next37
  store double %div109, double* %arrayidx111, align 8
  %cmp87 = icmp sgt i64 %indvars.iv36, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  br i1 %cmp87, label %for.body88, label %for.end113.loopexit

for.end113.loopexit:                              ; preds = %for.inc112
  br label %for.end113

for.end113:                                       ; preds = %for.end113.loopexit, %entry, %for.cond61.preheader, %for.cond86.preheader
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body.preheader ]
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
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
!6 = distinct !{!6, !2}
