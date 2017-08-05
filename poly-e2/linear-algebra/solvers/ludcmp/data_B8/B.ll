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
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
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
  tail call fastcc void @print_array(i32 2000, double* %arraydecay5)
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
  br i1 true, label %for.body.preheader, label %for.end46.thread

for.body.preheader:                               ; preds = %entry
  br i1 true, label %for.body.prol.loopexit, label %for.body.prol

for.body.prol:                                    ; preds = %for.body.preheader
  store double 0.000000e+00, double* %x, align 8
  store double 0.000000e+00, double* %y, align 8
  %div.prol = fdiv double 1.000000e+00, 2.000000e+03
  %div5.prol = fmul double %div.prol, 5.000000e-01
  %add6.prol = fadd double %div5.prol, 4.000000e+00
  store double %add6.prol, double* %b, align 8
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.preheader, %for.body.prol
  %indvars.iv95.unr = phi i64 [ 0, %for.body.preheader ], [ 1, %for.body.prol ]
  br i1 false, label %for.cond13.preheader.preheader, label %for.body.preheader117

for.body.preheader117:                            ; preds = %for.body.prol.loopexit
  br label %for.body

for.cond9.preheader:                              ; preds = %for.body
  br i1 true, label %for.cond13.preheader.preheader, label %for.end46.thread

for.cond13.preheader.preheader:                   ; preds = %for.body.prol.loopexit, %for.cond9.preheader
  br label %for.body16.lr.ph

for.body:                                         ; preds = %for.body.preheader117, %for.body
  %indvars.iv95 = phi i64 [ %indvars.iv.next96.1, %for.body ], [ %indvars.iv95.unr, %for.body.preheader117 ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv95
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv95
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %2 = trunc i64 %indvars.iv.next96 to i32
  %conv4 = sitofp i32 %2 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv95
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next96.1 = add nsw i64 %indvars.iv95, 2
  %3 = trunc i64 %indvars.iv.next96.1 to i32
  %conv4.1 = sitofp i32 %3 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %4 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %4, align 8
  %exitcond98.1 = icmp eq i64 %indvars.iv.next96.1, 2000
  br i1 %exitcond98.1, label %for.cond9.preheader, label %for.body

for.body16.lr.ph:                                 ; preds = %for.cond13.preheader.preheader, %for.end39
  %indvars.iv91 = phi i64 [ 0, %for.cond13.preheader.preheader ], [ %indvars.iv.next92, %for.end39 ]
  %indvars.iv89 = phi i64 [ 1, %for.cond13.preheader.preheader ], [ %indvars.iv.next90, %for.end39 ]
  %5 = mul nuw nsw i64 %indvars.iv91, 2001
  %6 = add nuw nsw i64 %5, 1
  %scevgep87 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %6
  %scevgep8788 = bitcast double* %scevgep87 to i8*
  %7 = sub i64 1998, %indvars.iv91
  %8 = shl i64 %7, 3
  %9 = and i64 %8, 34359738360
  %10 = add nuw nsw i64 %9, 8
  br label %for.body16

for.cond29.preheader:                             ; preds = %for.body16
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %cmp3038 = icmp slt i64 %indvars.iv.next92, 2000
  br i1 %cmp3038, label %for.end39.loopexit, label %for.end39

for.body16:                                       ; preds = %for.body16, %for.body16.lr.ph
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %for.body16 ], [ 0, %for.body16.lr.ph ]
  %11 = sub nsw i64 0, %indvars.iv74
  %12 = trunc i64 %11 to i32
  %rem = srem i32 %12, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv74
  store double %add20, double* %arrayidx24, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next75, %indvars.iv89
  br i1 %exitcond80, label %for.cond29.preheader, label %for.body16

for.end39.loopexit:                               ; preds = %for.cond29.preheader
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep8788, i8 0, i64 %10, i32 8, i1 false)
  br label %for.end39

for.end39:                                        ; preds = %for.end39.loopexit, %for.cond29.preheader
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv91
  store double 1.000000e+00, double* %arrayidx43, align 8
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next92, 2000
  br i1 %exitcond94, label %for.end46, label %for.body16.lr.ph

for.end46.thread:                                 ; preds = %for.cond9.preheader, %entry
  %call106 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.end120

for.end46:                                        ; preds = %for.end39
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %13 = bitcast i8* %call to [2000 x [2000 x double]]*
  br i1 true, label %for.cond51.preheader.us.preheader, label %for.end120

for.cond51.preheader.us.preheader:                ; preds = %for.end46
  br i1 true, label %for.cond51.preheader.us.prol.loopexit, label %for.cond51.for.inc62_crit_edge.us.prol.preheader

for.cond51.for.inc62_crit_edge.us.prol.preheader: ; preds = %for.cond51.preheader.us.preheader
  br label %for.cond51.for.inc62_crit_edge.us.prol

for.cond51.for.inc62_crit_edge.us.prol:           ; preds = %for.cond51.for.inc62_crit_edge.us.prol.preheader, %for.cond51.for.inc62_crit_edge.us.prol
  %indvars.iv67.prol = phi i64 [ %indvars.iv.next68.prol, %for.cond51.for.inc62_crit_edge.us.prol ], [ 0, %for.cond51.for.inc62_crit_edge.us.prol.preheader ]
  %prol.iter73 = phi i32 [ %prol.iter73.sub, %for.cond51.for.inc62_crit_edge.us.prol ], [ 0, %for.cond51.for.inc62_crit_edge.us.prol.preheader ]
  %14 = mul nuw nsw i64 %indvars.iv67.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.prol = add nuw nsw i64 %indvars.iv67.prol, 1
  %prol.iter73.sub = add i32 %prol.iter73, -1
  %prol.iter73.cmp = icmp eq i32 %prol.iter73.sub, 0
  br i1 %prol.iter73.cmp, label %for.cond51.preheader.us.prol.loopexit.loopexit, label %for.cond51.for.inc62_crit_edge.us.prol, !llvm.loop !1

for.cond51.preheader.us.prol.loopexit.loopexit:   ; preds = %for.cond51.for.inc62_crit_edge.us.prol
  br label %for.cond51.preheader.us.prol.loopexit

for.cond51.preheader.us.prol.loopexit:            ; preds = %for.cond51.preheader.us.prol.loopexit.loopexit, %for.cond51.preheader.us.preheader
  %indvars.iv67.unr = phi i64 [ 0, %for.cond51.preheader.us.preheader ], [ %indvars.iv.next68.prol, %for.cond51.preheader.us.prol.loopexit.loopexit ]
  br i1 false, label %for.cond69.preheader.lr.ph, label %for.cond51.for.inc62_crit_edge.us.3.preheader

for.cond51.for.inc62_crit_edge.us.3.preheader:    ; preds = %for.cond51.preheader.us.prol.loopexit
  %15 = sub i64 1996, %indvars.iv67.unr
  %16 = lshr i64 %15, 2
  %17 = and i64 %16, 1
  %lcmp.mod119 = icmp eq i64 %17, 0
  br i1 %lcmp.mod119, label %for.cond51.for.inc62_crit_edge.us.3.prol.preheader, label %for.cond51.for.inc62_crit_edge.us.3.prol.loopexit

for.cond51.for.inc62_crit_edge.us.3.prol.preheader: ; preds = %for.cond51.for.inc62_crit_edge.us.3.preheader
  br label %for.cond51.for.inc62_crit_edge.us.3.prol

for.cond51.for.inc62_crit_edge.us.3.prol:         ; preds = %for.cond51.for.inc62_crit_edge.us.3.prol.preheader
  %18 = mul nuw nsw i64 %indvars.iv67.unr, 16000
  %scevgep.prol121 = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol121, i8 0, i64 16000, i32 8, i1 false)
  %19 = mul i64 %indvars.iv67.unr, 16000
  %20 = add i64 %19, 16000
  %scevgep.1.prol = getelementptr i8, i8* %call, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 16000, i32 8, i1 false)
  %21 = mul i64 %indvars.iv67.unr, 16000
  %22 = add i64 %21, 32000
  %scevgep.2.prol = getelementptr i8, i8* %call, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 16000, i32 8, i1 false)
  %23 = mul i64 %indvars.iv67.unr, 16000
  %24 = add i64 %23, 48000
  %scevgep.3.prol = getelementptr i8, i8* %call, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.3.prol = add nsw i64 %indvars.iv67.unr, 4
  br label %for.cond51.for.inc62_crit_edge.us.3.prol.loopexit

for.cond51.for.inc62_crit_edge.us.3.prol.loopexit: ; preds = %for.cond51.for.inc62_crit_edge.us.3.prol, %for.cond51.for.inc62_crit_edge.us.3.preheader
  %indvars.iv67.unr122 = phi i64 [ %indvars.iv67.unr, %for.cond51.for.inc62_crit_edge.us.3.preheader ], [ %indvars.iv.next68.3.prol, %for.cond51.for.inc62_crit_edge.us.3.prol ]
  %25 = icmp eq i64 %16, 0
  br i1 %25, label %for.cond65.preheader, label %for.cond51.for.inc62_crit_edge.us.3.preheader.new

for.cond51.for.inc62_crit_edge.us.3.preheader.new: ; preds = %for.cond51.for.inc62_crit_edge.us.3.prol.loopexit
  br label %for.cond51.for.inc62_crit_edge.us.3

for.cond65.preheader.unr-lcssa:                   ; preds = %for.cond51.for.inc62_crit_edge.us.3
  br label %for.cond65.preheader

for.cond65.preheader:                             ; preds = %for.cond51.for.inc62_crit_edge.us.3.prol.loopexit, %for.cond65.preheader.unr-lcssa
  br i1 true, label %for.cond69.preheader.lr.ph, label %for.end120

for.cond69.preheader.lr.ph:                       ; preds = %for.cond51.preheader.us.prol.loopexit, %for.cond65.preheader
  br label %for.cond73.preheader.us.us.preheader

for.cond73.preheader.us.us.preheader:             ; preds = %for.cond69.preheader.lr.ph, %for.cond69.for.inc96_crit_edge.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %for.cond69.for.inc96_crit_edge.us ], [ 0, %for.cond69.preheader.lr.ph ]
  %arrayidx84.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv59
  br label %for.cond73.preheader.us.us

for.cond69.for.inc96_crit_edge.us:                ; preds = %for.cond73.for.inc93_crit_edge.us.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, 2000
  br i1 %exitcond62, label %for.cond99.preheader, label %for.cond73.preheader.us.us.preheader

for.cond73.preheader.us.us:                       ; preds = %for.cond73.for.inc93_crit_edge.us.us, %for.cond73.preheader.us.us.preheader
  %indvars.iv55 = phi i64 [ 0, %for.cond73.preheader.us.us.preheader ], [ %indvars.iv.next56, %for.cond73.for.inc93_crit_edge.us.us ]
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv59
  br i1 true, label %for.body76.us.us.prol.loopexit, label %for.body76.us.us.prol

for.body76.us.us.prol:                            ; preds = %for.cond73.preheader.us.us
  %26 = load double, double* %arrayidx80.us.us, align 8
  %27 = load double, double* %arrayidx84.us.us.prol, align 8
  %mul.us.us.prol = fmul double %26, %27
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv55, i64 0
  %28 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %28, %mul.us.us.prol
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  br label %for.body76.us.us.prol.loopexit

for.body76.us.us.prol.loopexit:                   ; preds = %for.body76.us.us.prol, %for.cond73.preheader.us.us
  %indvars.iv49.unr.ph = phi i64 [ 1, %for.body76.us.us.prol ], [ 0, %for.cond73.preheader.us.us ]
  br i1 false, label %for.cond73.for.inc93_crit_edge.us.us, label %for.body76.us.us.preheader

for.body76.us.us.preheader:                       ; preds = %for.body76.us.us.prol.loopexit
  br label %for.body76.us.us

for.cond73.for.inc93_crit_edge.us.us.loopexit:    ; preds = %for.body76.us.us
  br label %for.cond73.for.inc93_crit_edge.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.cond73.for.inc93_crit_edge.us.us.loopexit, %for.body76.us.us.prol.loopexit
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 2000
  br i1 %exitcond58, label %for.cond69.for.inc96_crit_edge.us, label %for.cond73.preheader.us.us

for.body76.us.us:                                 ; preds = %for.body76.us.us.preheader, %for.body76.us.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %for.body76.us.us ], [ %indvars.iv49.unr.ph, %for.body76.us.us.preheader ]
  %29 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv59
  %30 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %29, %30
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv55, i64 %indvars.iv49
  %31 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %31, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %32 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next50, i64 %indvars.iv59
  %33 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %32, %33
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv55, i64 %indvars.iv.next50
  %34 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %34, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50.1, 2000
  br i1 %exitcond52.1, label %for.cond73.for.inc93_crit_edge.us.us.loopexit, label %for.body76.us.us

for.cond99.preheader:                             ; preds = %for.cond69.for.inc96_crit_edge.us
  br i1 true, label %for.cond103.preheader.us.preheader, label %for.end120

for.cond103.preheader.us.preheader:               ; preds = %for.cond99.preheader
  br label %for.cond103.preheader.us

for.cond103.preheader.us:                         ; preds = %for.cond103.for.inc118_crit_edge.us, %for.cond103.preheader.us.preheader
  %indvars.iv46 = phi i64 [ 0, %for.cond103.preheader.us.preheader ], [ %indvars.iv.next47, %for.cond103.for.inc118_crit_edge.us ]
  br i1 true, label %for.body106.us.prol.loopexit, label %for.body106.us.prol.preheader

for.body106.us.prol.preheader:                    ; preds = %for.cond103.preheader.us
  br label %for.body106.us.prol

for.body106.us.prol:                              ; preds = %for.body106.us.prol.preheader, %for.body106.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body106.us.prol ], [ 0, %for.body106.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body106.us.prol ], [ 0, %for.body106.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv46, i64 %indvars.iv.prol
  %35 = bitcast double* %arrayidx110.us.prol to i64*
  %36 = load i64, i64* %35, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.prol
  %37 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %36, i64* %37, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body106.us.prol.loopexit.loopexit, label %for.body106.us.prol, !llvm.loop !3

for.body106.us.prol.loopexit.loopexit:            ; preds = %for.body106.us.prol
  br label %for.body106.us.prol.loopexit

for.body106.us.prol.loopexit:                     ; preds = %for.body106.us.prol.loopexit.loopexit, %for.cond103.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %for.cond103.preheader.us ], [ %indvars.iv.next.prol, %for.body106.us.prol.loopexit.loopexit ]
  br i1 false, label %for.cond103.for.inc118_crit_edge.us, label %for.body106.us.preheader

for.body106.us.preheader:                         ; preds = %for.body106.us.prol.loopexit
  br label %for.body106.us

for.body106.us:                                   ; preds = %for.body106.us.preheader, %for.body106.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body106.us ], [ %indvars.iv.unr, %for.body106.us.preheader ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv46, i64 %indvars.iv
  %38 = bitcast double* %arrayidx110.us to i64*
  %39 = load i64, i64* %38, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv
  %40 = bitcast double* %arrayidx114.us to i64*
  store i64 %39, i64* %40, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next
  %41 = bitcast double* %arrayidx110.us.1 to i64*
  %42 = load i64, i64* %41, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next
  %43 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %42, i64* %43, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %44 = bitcast double* %arrayidx110.us.2 to i64*
  %45 = load i64, i64* %44, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %46 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %45, i64* %46, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %47 = bitcast double* %arrayidx110.us.3 to i64*
  %48 = load i64, i64* %47, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %49 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %48, i64* %49, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %for.cond103.for.inc118_crit_edge.us.loopexit, label %for.body106.us

for.cond103.for.inc118_crit_edge.us.loopexit:     ; preds = %for.body106.us
  br label %for.cond103.for.inc118_crit_edge.us

for.cond103.for.inc118_crit_edge.us:              ; preds = %for.cond103.for.inc118_crit_edge.us.loopexit, %for.body106.us.prol.loopexit
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond = icmp eq i64 %indvars.iv.next47, 2000
  br i1 %exitcond, label %for.end120.loopexit, label %for.cond103.preheader.us

for.end120.loopexit:                              ; preds = %for.cond103.for.inc118_crit_edge.us
  br label %for.end120

for.end120:                                       ; preds = %for.end120.loopexit, %for.end46, %for.end46.thread, %for.cond65.preheader, %for.cond99.preheader
  %call108110116 = phi i8* [ %call, %for.cond99.preheader ], [ %call, %for.cond65.preheader ], [ %call, %for.end46 ], [ %call106, %for.end46.thread ], [ %call, %for.end120.loopexit ]
  tail call void @free(i8* %call108110116) #4
  ret void

for.cond51.for.inc62_crit_edge.us.3:              ; preds = %for.cond51.for.inc62_crit_edge.us.3, %for.cond51.for.inc62_crit_edge.us.3.preheader.new
  %indvars.iv67 = phi i64 [ %indvars.iv67.unr122, %for.cond51.for.inc62_crit_edge.us.3.preheader.new ], [ %indvars.iv.next68.3.1, %for.cond51.for.inc62_crit_edge.us.3 ]
  %50 = mul nuw nsw i64 %indvars.iv67, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %50
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %51 = mul i64 %indvars.iv67, 16000
  %52 = add i64 %51, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %52
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %53 = mul i64 %indvars.iv67, 16000
  %54 = add i64 %53, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %54
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %55 = mul i64 %indvars.iv67, 16000
  %56 = add i64 %55, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %56
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.3 = add nsw i64 %indvars.iv67, 4
  %57 = mul nuw nsw i64 %indvars.iv.next68.3, 16000
  %scevgep.1123 = getelementptr i8, i8* %call, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1123, i8 0, i64 16000, i32 8, i1 false)
  %58 = mul i64 %indvars.iv.next68.3, 16000
  %59 = add i64 %58, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %60 = mul i64 %indvars.iv.next68.3, 16000
  %61 = add i64 %60, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %61
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %62 = mul i64 %indvars.iv.next68.3, 16000
  %63 = add i64 %62, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %63
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.3.1 = add nsw i64 %indvars.iv67, 8
  %exitcond70.3.1 = icmp eq i64 %indvars.iv.next68.3.1, 2000
  br i1 %exitcond70.3.1, label %for.cond65.preheader.unr-lcssa, label %for.cond51.for.inc62_crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32 %n, [2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br i1 true, label %for.cond1.preheader.preheader, label %for.end113

for.cond1.preheader.preheader:                    ; preds = %entry
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.inc58
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %for.inc58 ], [ 0, %for.cond1.preheader.preheader ]
  %0 = add i64 %indvars.iv78, 4294967295
  %cmp218 = icmp sgt i64 %indvars.iv78, 0
  br i1 %cmp218, label %for.body3.preheader, label %for.inc58

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 0
  br label %for.body3

for.cond61.preheader:                             ; preds = %for.inc58
  br i1 true, label %for.body63.preheader, label %for.end113

for.body63.preheader:                             ; preds = %for.cond61.preheader
  br label %for.body63

for.body30.lr.ph:                                 ; preds = %for.end
  %cmp3620 = icmp sgt i64 %indvars.iv78, 0
  br i1 %cmp3620, label %for.body30.us.preheader, label %for.inc58

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %xtraiter6882 = and i64 %indvars.iv78, 1
  %lcmp.mod69 = icmp eq i64 %xtraiter6882, 0
  %1 = trunc i64 %0 to i32
  %2 = icmp eq i32 %1, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond35.for.end50_crit_edge.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %for.cond35.for.end50_crit_edge.us ], [ %indvars.iv78, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 %indvars.iv72
  %3 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod69, label %for.inc48.us.prol.loopexit, label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.body30.us
  %4 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv72
  %5 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %4, %5
  %sub47.us.prol = fsub double %3, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %indvars.iv63.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %w.122.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %3, %for.body30.us ]
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  br i1 %2, label %for.cond35.for.end50_crit_edge.us, label %for.inc48.us.preheader

for.inc48.us.preheader:                           ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.preheader, %for.inc48.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.1, %for.inc48.us ], [ %indvars.iv63.unr.ph, %for.inc48.us.preheader ]
  %w.122.us = phi double [ %sub47.us.1, %for.inc48.us ], [ %w.122.us.unr.ph, %for.inc48.us.preheader ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 %indvars.iv63
  %6 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv63, i64 %indvars.iv72
  %7 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %8 = load <2 x double>, <2 x double>* %6, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next64, i64 %indvars.iv72
  %9 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %7, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %9, i32 1
  %mul46.us = fmul <2 x double> %8, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %w.122.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %exitcond67.1 = icmp eq i64 %indvars.iv.next64.1, %indvars.iv78
  br i1 %exitcond67.1, label %for.cond35.for.end50_crit_edge.us.loopexit, label %for.inc48.us

for.cond35.for.end50_crit_edge.us.loopexit:       ; preds = %for.inc48.us
  br label %for.cond35.for.end50_crit_edge.us

for.cond35.for.end50_crit_edge.us:                ; preds = %for.cond35.for.end50_crit_edge.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.cond35.for.end50_crit_edge.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, 2000
  br i1 %exitcond75, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.body3.preheader, %for.end
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %for.end ], [ 0, %for.body3.preheader ]
  %10 = add i64 %indvars.iv56, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 %indvars.iv56
  %11 = load double, double* %arrayidx5, align 8
  %cmp714 = icmp sgt i64 %indvars.iv56, 0
  br i1 %cmp714, label %for.inc.preheader, label %for.end

for.inc.preheader:                                ; preds = %for.body3
  %xtraiter5283 = and i64 %indvars.iv56, 1
  %lcmp.mod53 = icmp eq i64 %xtraiter5283, 0
  br i1 %lcmp.mod53, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.preheader
  %12 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv56
  %13 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %12, %13
  %sub.prol = fsub double %11, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.preheader
  %indvars.iv47.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %w.016.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %11, %for.inc.preheader ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %14 = trunc i64 %10 to i32
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %for.end, label %for.inc.preheader95

for.inc.preheader95:                              ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader95, %for.inc
  %indvars.iv47 = phi i64 [ %indvars.iv.next48.1, %for.inc ], [ %indvars.iv47.unr.ph, %for.inc.preheader95 ]
  %w.016 = phi double [ %sub.1, %for.inc ], [ %w.016.unr.ph, %for.inc.preheader95 ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 %indvars.iv47
  %16 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv56
  %17 = load double, double* %arrayidx16, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %18 = load <2 x double>, <2 x double>* %16, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next48, i64 %indvars.iv56
  %19 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %17, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %19, i32 1
  %mul = fmul <2 x double> %18, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.016, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next48.1, %indvars.iv56
  br i1 %exitcond51.1, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit, %for.body3
  %w.0.lcssa = phi double [ %11, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv56, i64 %indvars.iv56
  %20 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %20
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next57, %indvars.iv78
  br i1 %exitcond61, label %for.body30.lr.ph, label %for.body3

for.inc58.loopexit:                               ; preds = %for.cond35.for.end50_crit_edge.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.cond1.preheader, %for.body30.lr.ph
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next79, 2000
  br i1 %exitcond81, label %for.cond61.preheader, label %for.cond1.preheader

for.cond86.preheader:                             ; preds = %for.end79
  br i1 true, label %for.body88.preheader, label %for.end113

for.body88.preheader:                             ; preds = %for.cond86.preheader
  br label %for.body88

for.body63:                                       ; preds = %for.body63.preheader, %for.end79
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %for.end79 ], [ 0, %for.body63.preheader ]
  %21 = add i64 %indvars.iv44, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv44
  %22 = load double, double* %arrayidx65, align 8
  %cmp678 = icmp sgt i64 %indvars.iv44, 0
  br i1 %cmp678, label %for.inc77.preheader, label %for.end79

for.inc77.preheader:                              ; preds = %for.body63
  %23 = trunc i64 %indvars.iv44 to i32
  %xtraiter37 = and i32 %23, 3
  %lcmp.mod38 = icmp eq i32 %xtraiter37, 0
  br i1 %lcmp.mod38, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.preheader
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol.preheader, %for.inc77.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %w.210.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %22, %for.inc77.prol.preheader ]
  %prol.iter40 = phi i32 [ %prol.iter40.sub, %for.inc77.prol ], [ %xtraiter37, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.prol
  %24 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %25 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %24, %25
  %sub76.prol = fsub double %w.210.prol, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter40.sub = add i32 %prol.iter40, -1
  %prol.iter40.cmp = icmp eq i32 %prol.iter40.sub, 0
  br i1 %prol.iter40.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !4

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.inc77.preheader ], [ %indvars.iv.next.prol, %for.inc77.prol.loopexit.loopexit ]
  %w.210.unr = phi double [ %22, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %26 = trunc i64 %21 to i32
  %27 = icmp ult i32 %26, 3
  br i1 %27, label %for.end79, label %for.inc77.preheader94

for.inc77.preheader94:                            ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77.preheader94, %for.inc77
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc77 ], [ %indvars.iv.unr, %for.inc77.preheader94 ]
  %w.210 = phi double [ %sub76.3, %for.inc77 ], [ %w.210.unr, %for.inc77.preheader94 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv
  %28 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %29 = bitcast double* %arrayidx74 to <2 x double>*
  %30 = load <2 x double>, <2 x double>* %28, align 8
  %31 = load <2 x double>, <2 x double>* %29, align 8
  %mul75 = fmul <2 x double> %30, %31
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %w.210, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %32 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %33 = bitcast double* %arrayidx74.2 to <2 x double>*
  %34 = load <2 x double>, <2 x double>* %32, align 8
  %35 = load <2 x double>, <2 x double>* %33, align 8
  %mul75.2 = fmul <2 x double> %34, %35
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.341 = icmp eq i64 %indvars.iv.next.3, %indvars.iv44
  br i1 %exitcond.341, label %for.end79.loopexit, label %for.inc77

for.end79.loopexit:                               ; preds = %for.inc77
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.inc77.prol.loopexit, %for.body63
  %w.2.lcssa = phi double [ %22, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv44
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond = icmp eq i64 %indvars.iv.next45, 2000
  br i1 %exitcond, label %for.cond86.preheader, label %for.body63

for.body88:                                       ; preds = %for.body88.preheader, %for.end104
  %indvars.iv33 = phi i64 [ 2000, %for.body88.preheader ], [ %indvars.iv.next34, %for.end104 ]
  %indvar = phi i32 [ 0, %for.body88.preheader ], [ %indvar.next, %for.end104 ]
  %i.27.in = phi i32 [ 2000, %for.body88.preheader ], [ %i.27, %for.end104 ]
  %36 = add nsw i32 %indvar, -1
  %indvars.iv.next34 = add nsw i64 %indvars.iv33, -1
  %i.27 = add nsw i32 %i.27.in, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next34
  %37 = load double, double* %arrayidx90, align 8
  %cmp921 = icmp slt i32 %i.27.in, 2000
  br i1 %cmp921, label %for.inc102.preheader, label %for.end104

for.inc102.preheader:                             ; preds = %for.body88
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.preheader
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol.preheader, %for.inc102.prol
  %indvars.iv31.prol = phi i64 [ %indvars.iv.next32.prol, %for.inc102.prol ], [ %indvars.iv33, %for.inc102.prol.preheader ]
  %w.33.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %37, %for.inc102.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv31.prol
  %38 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv31.prol
  %39 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %38, %39
  %sub101.prol = fsub double %w.33.prol, %mul100.prol
  %indvars.iv.next32.prol = add nsw i64 %indvars.iv31.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !5

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.preheader
  %indvars.iv31.unr = phi i64 [ %indvars.iv33, %for.inc102.preheader ], [ %indvars.iv.next32.prol, %for.inc102.prol.loopexit.loopexit ]
  %w.33.unr = phi double [ %37, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %40 = icmp ult i32 %36, 3
  br i1 %40, label %for.end104, label %for.inc102.preheader93

for.inc102.preheader93:                           ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102.preheader93, %for.inc102
  %indvars.iv31 = phi i64 [ %indvars.iv.next32.3, %for.inc102 ], [ %indvars.iv31.unr, %for.inc102.preheader93 ]
  %w.33 = phi double [ %sub101.3, %for.inc102 ], [ %w.33.unr, %for.inc102.preheader93 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv31
  %41 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv31
  %42 = bitcast double* %arrayidx99 to <2 x double>*
  %43 = load <2 x double>, <2 x double>* %41, align 8
  %44 = load <2 x double>, <2 x double>* %42, align 8
  %mul100 = fmul <2 x double> %43, %44
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.33, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next32.1 = add nsw i64 %indvars.iv31, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv.next32.1
  %45 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next32.1
  %46 = bitcast double* %arrayidx99.2 to <2 x double>*
  %47 = load <2 x double>, <2 x double>* %45, align 8
  %48 = load <2 x double>, <2 x double>* %46, align 8
  %mul100.2 = fmul <2 x double> %47, %48
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %indvars.iv.next32.3 = add nsw i64 %indvars.iv31, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next32.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, 2000
  br i1 %exitcond.3, label %for.end104.loopexit, label %for.inc102

for.end104.loopexit:                              ; preds = %for.inc102
  br label %for.end104

for.end104:                                       ; preds = %for.end104.loopexit, %for.inc102.prol.loopexit, %for.body88
  %w.3.lcssa = phi double [ %37, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv.next34
  %49 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %49
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next34
  store double %div109, double* %arrayidx111, align 8
  %cmp87 = icmp sgt i64 %indvars.iv33, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  br i1 %cmp87, label %for.body88, label %for.end113.loopexit

for.end113.loopexit:                              ; preds = %for.end104
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
  br i1 true, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %if.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %for.body.preheader ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %if.end
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
