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

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #5
  tail call void @free(i8* %call1) #5
  tail call void @free(i8* %call2) #5
  tail call void @free(i8* %call3) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  %conv = sitofp i32 %n to double
  %cmp42 = icmp sgt i32 %n, 0
  br i1 %cmp42, label %for.body.preheader, label %for.end46.thread

for.body.preheader:                               ; preds = %entry
  %0 = and i32 %n, 1
  %lcmp.mod103 = icmp eq i32 %0, 0
  br i1 %lcmp.mod103, label %for.body.prol.loopexit, label %for.body.prol

for.body.prol:                                    ; preds = %for.body.preheader
  store double 0.000000e+00, double* %x, align 8
  store double 0.000000e+00, double* %y, align 8
  %div.prol = fdiv double 1.000000e+00, %conv
  %div5.prol = fmul double %div.prol, 5.000000e-01
  %add6.prol = fadd double %div5.prol, 4.000000e+00
  store double %add6.prol, double* %b, align 8
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.preheader, %for.body.prol
  %indvars.iv91.unr = phi i64 [ 0, %for.body.preheader ], [ 1, %for.body.prol ]
  %1 = icmp eq i32 %n, 1
  br i1 %1, label %for.cond9.preheader, label %for.body.preheader110

for.body.preheader110:                            ; preds = %for.body.prol.loopexit
  %wide.trip.count93.1 = zext i32 %n to i64
  %2 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body

for.cond9.preheader.loopexit:                     ; preds = %for.body
  br label %for.cond9.preheader

for.cond9.preheader:                              ; preds = %for.cond9.preheader.loopexit, %for.body.prol.loopexit
  br i1 %cmp42, label %for.cond13.preheader.preheader, label %for.end46.thread

for.cond13.preheader.preheader:                   ; preds = %for.cond9.preheader
  %3 = add i32 %n, -2
  %4 = zext i32 %3 to i64
  %5 = sext i32 %n to i64
  %6 = zext i32 %n to i64
  br label %for.body16.lr.ph

for.body:                                         ; preds = %for.body.preheader110, %for.body
  %indvars.iv91 = phi i64 [ %indvars.iv.next92.1, %for.body ], [ %indvars.iv91.unr, %for.body.preheader110 ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv91
  %7 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv91
  %8 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %9 = trunc i64 %indvars.iv.next92 to i32
  %conv4 = sitofp i32 %9 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv91
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  %indvars.iv.next92.1 = add nsw i64 %indvars.iv91, 2
  %10 = trunc i64 %indvars.iv.next92.1 to i32
  %conv4.1 = sitofp i32 %10 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, %div.v.i1.2
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %11 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %11, align 8
  %exitcond94.1 = icmp eq i64 %indvars.iv.next92.1, %wide.trip.count93.1
  br i1 %exitcond94.1, label %for.cond9.preheader.loopexit, label %for.body

for.body16.lr.ph:                                 ; preds = %for.cond13.preheader.preheader, %for.end39
  %indvars.iv87 = phi i64 [ 0, %for.cond13.preheader.preheader ], [ %indvars.iv.next88, %for.end39 ]
  %indvars.iv85 = phi i64 [ 1, %for.cond13.preheader.preheader ], [ %indvars.iv.next86, %for.end39 ]
  %12 = mul nuw nsw i64 %indvars.iv87, 2001
  %13 = add nuw nsw i64 %12, 1
  %scevgep83 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %13
  %scevgep8384 = bitcast double* %scevgep83 to i8*
  %14 = sub i64 %4, %indvars.iv87
  %15 = shl i64 %14, 3
  %16 = and i64 %15, 34359738360
  %17 = add nuw nsw i64 %16, 8
  br label %for.body16

for.cond29.preheader:                             ; preds = %for.body16
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %cmp3038 = icmp slt i64 %indvars.iv.next88, %5
  br i1 %cmp3038, label %for.body32.preheader, label %for.end39

for.body32.preheader:                             ; preds = %for.cond29.preheader
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep8384, i8 0, i64 %17, i32 8, i1 false)
  br label %for.end39

for.body16:                                       ; preds = %for.body16, %for.body16.lr.ph
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %for.body16 ], [ 0, %for.body16.lr.ph ]
  %18 = sub nsw i64 0, %indvars.iv70
  %19 = trunc i64 %18 to i32
  %rem = srem i32 %19, %n
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, %conv
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv87, i64 %indvars.iv70
  store double %add20, double* %arrayidx24, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next71, %indvars.iv85
  br i1 %exitcond76, label %for.cond29.preheader, label %for.body16

for.end39:                                        ; preds = %for.body32.preheader, %for.cond29.preheader
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv87, i64 %indvars.iv87
  store double 1.000000e+00, double* %arrayidx43, align 8
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond = icmp eq i64 %indvars.iv.next88, %6
  br i1 %exitcond, label %for.end46, label %for.body16.lr.ph

for.end46.thread:                                 ; preds = %for.cond9.preheader, %entry
  %call104 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  br label %for.end120

for.end46:                                        ; preds = %for.end39
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %20 = bitcast i8* %call to [2000 x [2000 x double]]*
  br i1 %cmp42, label %for.cond51.preheader.us.preheader, label %for.end120

for.cond51.preheader.us.preheader:                ; preds = %for.end46
  %21 = add i32 %n, -1
  %22 = zext i32 %21 to i64
  %23 = shl nuw nsw i64 %22, 3
  %24 = add nuw nsw i64 %23, 8
  %25 = zext i32 %n to i64
  %26 = add nsw i64 %25, -1
  %xtraiter99 = and i64 %25, 7
  %lcmp.mod100 = icmp eq i64 %xtraiter99, 0
  br i1 %lcmp.mod100, label %for.cond51.preheader.us.prol.loopexit, label %for.cond51.preheader.us.prol.preheader

for.cond51.preheader.us.prol.preheader:           ; preds = %for.cond51.preheader.us.preheader
  br label %for.cond51.preheader.us.prol

for.cond51.preheader.us.prol:                     ; preds = %for.cond51.preheader.us.prol.preheader, %for.cond51.preheader.us.prol
  %indvars.iv66.prol = phi i64 [ %indvars.iv.next67.prol, %for.cond51.preheader.us.prol ], [ 0, %for.cond51.preheader.us.prol.preheader ]
  %prol.iter101 = phi i64 [ %prol.iter101.sub, %for.cond51.preheader.us.prol ], [ %xtraiter99, %for.cond51.preheader.us.prol.preheader ]
  %27 = mul nuw nsw i64 %indvars.iv66.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next67.prol = add nuw nsw i64 %indvars.iv66.prol, 1
  %prol.iter101.sub = add nsw i64 %prol.iter101, -1
  %prol.iter101.cmp = icmp eq i64 %prol.iter101.sub, 0
  br i1 %prol.iter101.cmp, label %for.cond51.preheader.us.prol.loopexit.loopexit, label %for.cond51.preheader.us.prol, !llvm.loop !1

for.cond51.preheader.us.prol.loopexit.loopexit:   ; preds = %for.cond51.preheader.us.prol
  br label %for.cond51.preheader.us.prol.loopexit

for.cond51.preheader.us.prol.loopexit:            ; preds = %for.cond51.preheader.us.prol.loopexit.loopexit, %for.cond51.preheader.us.preheader
  %indvars.iv66.unr = phi i64 [ 0, %for.cond51.preheader.us.preheader ], [ %xtraiter99, %for.cond51.preheader.us.prol.loopexit.loopexit ]
  %28 = icmp ult i64 %26, 7
  br i1 %28, label %for.cond65.preheader, label %for.cond51.preheader.us.preheader109

for.cond51.preheader.us.preheader109:             ; preds = %for.cond51.preheader.us.prol.loopexit
  %wide.trip.count68.7 = zext i32 %n to i64
  br label %for.cond51.preheader.us

for.cond51.preheader.us:                          ; preds = %for.cond51.preheader.us.preheader109, %for.cond51.preheader.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67.7, %for.cond51.preheader.us ], [ %indvars.iv66.unr, %for.cond51.preheader.us.preheader109 ]
  %29 = mul nuw nsw i64 %indvars.iv66, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %24, i32 8, i1 false)
  %30 = mul i64 %indvars.iv66, 16000
  %31 = add i64 %30, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %24, i32 8, i1 false)
  %32 = mul i64 %indvars.iv66, 16000
  %33 = add i64 %32, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %24, i32 8, i1 false)
  %34 = mul i64 %indvars.iv66, 16000
  %35 = add i64 %34, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %24, i32 8, i1 false)
  %36 = mul i64 %indvars.iv66, 16000
  %37 = add i64 %36, 64000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 %24, i32 8, i1 false)
  %38 = mul i64 %indvars.iv66, 16000
  %39 = add i64 %38, 80000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 %24, i32 8, i1 false)
  %40 = mul i64 %indvars.iv66, 16000
  %41 = add i64 %40, 96000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 %24, i32 8, i1 false)
  %42 = mul i64 %indvars.iv66, 16000
  %43 = add i64 %42, 112000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next67.7 = add nsw i64 %indvars.iv66, 8
  %exitcond69.7 = icmp eq i64 %indvars.iv.next67.7, %wide.trip.count68.7
  br i1 %exitcond69.7, label %for.cond65.preheader.loopexit, label %for.cond51.preheader.us

for.cond65.preheader.loopexit:                    ; preds = %for.cond51.preheader.us
  br label %for.cond65.preheader

for.cond65.preheader:                             ; preds = %for.cond65.preheader.loopexit, %for.cond51.preheader.us.prol.loopexit
  br i1 %cmp42, label %for.cond73.preheader.us.us.preheader.preheader, label %for.end120

for.cond73.preheader.us.us.preheader.preheader:   ; preds = %for.cond65.preheader
  %44 = and i32 %n, 1
  %lcmp.mod98 = icmp eq i32 %44, 0
  %45 = icmp eq i32 %n, 1
  %wide.trip.count52.1 = zext i32 %n to i64
  %wide.trip.count52.prol = zext i32 %n to i64
  br label %for.cond73.preheader.us.us.preheader

for.cond73.preheader.us.us.preheader:             ; preds = %for.cond73.preheader.us.us.preheader.preheader, %for.cond69.for.inc96_crit_edge.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.cond69.for.inc96_crit_edge.us ], [ 0, %for.cond73.preheader.us.us.preheader.preheader ]
  %arrayidx84.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv58
  br label %for.cond73.preheader.us.us

for.cond69.for.inc96_crit_edge.us:                ; preds = %for.cond73.for.inc93_crit_edge.us.us
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, %wide.trip.count52.lcssa
  br i1 %exitcond61, label %for.cond99.preheader, label %for.cond73.preheader.us.us.preheader

for.cond73.preheader.us.us:                       ; preds = %for.cond73.for.inc93_crit_edge.us.us, %for.cond73.preheader.us.us.preheader
  %indvars.iv54 = phi i64 [ 0, %for.cond73.preheader.us.us.preheader ], [ %indvars.iv.next55, %for.cond73.for.inc93_crit_edge.us.us ]
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv58
  br i1 %lcmp.mod98, label %for.body76.us.us.prol.loopexit, label %for.body76.us.us.prol

for.body76.us.us.prol:                            ; preds = %for.cond73.preheader.us.us
  %46 = load double, double* %arrayidx80.us.us, align 8
  %47 = load double, double* %arrayidx84.us.us.prol, align 8
  %mul.us.us.prol = fmul double %46, %47
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv54, i64 0
  %48 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %48, %mul.us.us.prol
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  br label %for.body76.us.us.prol.loopexit

for.body76.us.us.prol.loopexit:                   ; preds = %for.body76.us.us.prol, %for.cond73.preheader.us.us
  %indvars.iv50.unr.ph = phi i64 [ 1, %for.body76.us.us.prol ], [ 0, %for.cond73.preheader.us.us ]
  br i1 %45, label %for.cond73.for.inc93_crit_edge.us.us, label %for.body76.us.us.preheader

for.body76.us.us.preheader:                       ; preds = %for.body76.us.us.prol.loopexit
  br label %for.body76.us.us

for.cond73.for.inc93_crit_edge.us.us.loopexit:    ; preds = %for.body76.us.us
  br label %for.cond73.for.inc93_crit_edge.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.cond73.for.inc93_crit_edge.us.us.loopexit, %for.body76.us.us.prol.loopexit
  %wide.trip.count52.lcssa = phi i64 [ %wide.trip.count52.prol, %for.body76.us.us.prol.loopexit ], [ %wide.trip.count52.1, %for.cond73.for.inc93_crit_edge.us.us.loopexit ]
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count52.lcssa
  br i1 %exitcond57, label %for.cond69.for.inc96_crit_edge.us, label %for.cond73.preheader.us.us

for.body76.us.us:                                 ; preds = %for.body76.us.us.preheader, %for.body76.us.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.1, %for.body76.us.us ], [ %indvars.iv50.unr.ph, %for.body76.us.us.preheader ]
  %49 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv58
  %50 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %49, %50
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv54, i64 %indvars.iv50
  %51 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %51, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %52 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next51, i64 %indvars.iv58
  %53 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %52, %53
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv54, i64 %indvars.iv.next51
  %54 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %54, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv50, 2
  %exitcond53.1 = icmp eq i64 %indvars.iv.next51.1, %wide.trip.count52.1
  br i1 %exitcond53.1, label %for.cond73.for.inc93_crit_edge.us.us.loopexit, label %for.body76.us.us

for.cond99.preheader:                             ; preds = %for.cond69.for.inc96_crit_edge.us
  br i1 %cmp42, label %for.cond103.preheader.us.preheader, label %for.end120

for.cond103.preheader.us.preheader:               ; preds = %for.cond99.preheader
  %55 = zext i32 %n to i64
  %56 = add nsw i64 %55, -1
  %xtraiter = and i64 %55, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %57 = icmp ult i64 %56, 3
  %wide.trip.count.3 = zext i32 %n to i64
  br label %for.cond103.preheader.us

for.cond103.preheader.us:                         ; preds = %for.cond103.for.inc118_crit_edge.us, %for.cond103.preheader.us.preheader
  %indvars.iv46 = phi i64 [ 0, %for.cond103.preheader.us.preheader ], [ %indvars.iv.next47, %for.cond103.for.inc118_crit_edge.us ]
  br i1 %lcmp.mod, label %for.body106.us.prol.loopexit, label %for.body106.us.prol.preheader

for.body106.us.prol.preheader:                    ; preds = %for.cond103.preheader.us
  br label %for.body106.us.prol

for.body106.us.prol:                              ; preds = %for.body106.us.prol.preheader, %for.body106.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body106.us.prol ], [ 0, %for.body106.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body106.us.prol ], [ %xtraiter, %for.body106.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv46, i64 %indvars.iv.prol
  %58 = bitcast double* %arrayidx110.us.prol to i64*
  %59 = load i64, i64* %58, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.prol
  %60 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %59, i64* %60, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body106.us.prol.loopexit.loopexit, label %for.body106.us.prol, !llvm.loop !3

for.body106.us.prol.loopexit.loopexit:            ; preds = %for.body106.us.prol
  br label %for.body106.us.prol.loopexit

for.body106.us.prol.loopexit:                     ; preds = %for.body106.us.prol.loopexit.loopexit, %for.cond103.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %for.cond103.preheader.us ], [ %xtraiter, %for.body106.us.prol.loopexit.loopexit ]
  br i1 %57, label %for.cond103.for.inc118_crit_edge.us, label %for.body106.us.preheader

for.body106.us.preheader:                         ; preds = %for.body106.us.prol.loopexit
  br label %for.body106.us

for.body106.us:                                   ; preds = %for.body106.us.preheader, %for.body106.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body106.us ], [ %indvars.iv.unr, %for.body106.us.preheader ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv46, i64 %indvars.iv
  %61 = bitcast double* %arrayidx110.us to i64*
  %62 = load i64, i64* %61, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv
  %63 = bitcast double* %arrayidx114.us to i64*
  store i64 %62, i64* %63, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next
  %64 = bitcast double* %arrayidx110.us.1 to i64*
  %65 = load i64, i64* %64, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next
  %66 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %65, i64* %66, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %67 = bitcast double* %arrayidx110.us.2 to i64*
  %68 = load i64, i64* %67, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %69 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %68, i64* %69, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %70 = bitcast double* %arrayidx110.us.3 to i64*
  %71 = load i64, i64* %70, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %72 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %71, i64* %72, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.cond103.for.inc118_crit_edge.us.loopexit, label %for.body106.us

for.cond103.for.inc118_crit_edge.us.loopexit:     ; preds = %for.body106.us
  br label %for.cond103.for.inc118_crit_edge.us

for.cond103.for.inc118_crit_edge.us:              ; preds = %for.cond103.for.inc118_crit_edge.us.loopexit, %for.body106.us.prol.loopexit
  %wide.trip.count.lcssa = phi i64 [ %55, %for.body106.us.prol.loopexit ], [ %wide.trip.count.3, %for.cond103.for.inc118_crit_edge.us.loopexit ]
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count.lcssa
  br i1 %exitcond49, label %for.end120.loopexit, label %for.cond103.preheader.us

for.end120.loopexit:                              ; preds = %for.cond103.for.inc118_crit_edge.us
  br label %for.end120

for.end120:                                       ; preds = %for.end120.loopexit, %for.end46, %for.end46.thread, %for.cond65.preheader, %for.cond99.preheader
  %call105106108 = phi i8* [ %call, %for.cond99.preheader ], [ %call, %for.cond65.preheader ], [ %call, %for.end46 ], [ %call104, %for.end46.thread ], [ %call, %for.end120.loopexit ]
  tail call void @free(i8* %call105106108) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32 %n, [2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  %cmp26 = icmp sgt i32 %n, 0
  br i1 %cmp26, label %for.cond1.preheader.preheader, label %for.end113

for.cond1.preheader.preheader:                    ; preds = %entry
  %0 = zext i32 %n to i64
  %1 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %for.cond1.preheader.preheader
  %indvars.iv65 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next66, %for.inc58 ]
  %cmp218 = icmp sgt i64 %indvars.iv65, 0
  br i1 %cmp218, label %for.body3.preheader, label %for.inc58

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 0
  br label %for.body3

for.cond61.preheader:                             ; preds = %for.inc58
  br i1 %cmp26, label %for.body63.preheader, label %for.end113

for.body63.preheader:                             ; preds = %for.cond61.preheader
  %2 = zext i32 %n to i64
  br label %for.body63

for.body30.lr.ph:                                 ; preds = %for.end
  br i1 %cmp218, label %for.body30.us.preheader, label %for.inc58

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %xtraiter74 = and i64 %indvars.iv65, 1
  %lcmp.mod75 = icmp eq i64 %xtraiter74, 0
  %3 = icmp eq i64 %indvars.iv65, 1
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond35.for.end50_crit_edge.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %for.cond35.for.end50_crit_edge.us ], [ %indvars.iv65, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv61
  %4 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod75, label %for.body37.us.prol.loopexit, label %for.body37.us.prol

for.body37.us.prol:                               ; preds = %for.body30.us
  %5 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv61
  %6 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %5, %6
  %sub47.us.prol = fsub double %4, %mul46.us.prol
  br label %for.body37.us.prol.loopexit

for.body37.us.prol.loopexit:                      ; preds = %for.body37.us.prol, %for.body30.us
  %indvars.iv54.unr.ph = phi i64 [ 1, %for.body37.us.prol ], [ 0, %for.body30.us ]
  %w.122.us.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ %4, %for.body30.us ]
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ undef, %for.body30.us ]
  br i1 %3, label %for.cond35.for.end50_crit_edge.us, label %for.body37.us.preheader

for.body37.us.preheader:                          ; preds = %for.body37.us.prol.loopexit
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us.preheader, %for.body37.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.1, %for.body37.us ], [ %indvars.iv54.unr.ph, %for.body37.us.preheader ]
  %w.122.us = phi double [ %sub47.us.1, %for.body37.us ], [ %w.122.us.unr.ph, %for.body37.us.preheader ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv54
  %7 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv61
  %8 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %9 = load <2 x double>, <2 x double>* %7, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next55, i64 %indvars.iv61
  %10 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %8, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %10, i32 1
  %mul46.us = fmul <2 x double> %9, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %w.122.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv54, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next55.1, %indvars.iv65
  br i1 %exitcond58.1, label %for.cond35.for.end50_crit_edge.us.loopexit, label %for.body37.us

for.cond35.for.end50_crit_edge.us.loopexit:       ; preds = %for.body37.us
  br label %for.cond35.for.end50_crit_edge.us

for.cond35.for.end50_crit_edge.us:                ; preds = %for.cond35.for.end50_crit_edge.us.loopexit, %for.body37.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.body37.us.prol.loopexit ], [ %sub47.us.1, %for.cond35.for.end50_crit_edge.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next62, %0
  br i1 %exitcond82, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.body3.preheader, %for.end
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.end ], [ 0, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv47
  %11 = load double, double* %arrayidx5, align 8
  %cmp714 = icmp sgt i64 %indvars.iv47, 0
  br i1 %cmp714, label %for.body8.preheader, label %for.end

for.body8.preheader:                              ; preds = %for.body3
  %xtraiter72 = and i64 %indvars.iv47, 1
  %lcmp.mod73 = icmp eq i64 %xtraiter72, 0
  br i1 %lcmp.mod73, label %for.body8.prol.loopexit, label %for.body8.prol

for.body8.prol:                                   ; preds = %for.body8.preheader
  %12 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv47
  %13 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %12, %13
  %sub.prol = fsub double %11, %mul.prol
  br label %for.body8.prol.loopexit

for.body8.prol.loopexit:                          ; preds = %for.body8.prol, %for.body8.preheader
  %indvars.iv42.unr.ph = phi i64 [ 1, %for.body8.prol ], [ 0, %for.body8.preheader ]
  %w.016.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ %11, %for.body8.preheader ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ undef, %for.body8.preheader ]
  %14 = icmp eq i64 %indvars.iv47, 1
  br i1 %14, label %for.end, label %for.body8.preheader92

for.body8.preheader92:                            ; preds = %for.body8.prol.loopexit
  br label %for.body8

for.body8:                                        ; preds = %for.body8.preheader92, %for.body8
  %indvars.iv42 = phi i64 [ %indvars.iv.next43.1, %for.body8 ], [ %indvars.iv42.unr.ph, %for.body8.preheader92 ]
  %w.016 = phi double [ %sub.1, %for.body8 ], [ %w.016.unr.ph, %for.body8.preheader92 ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv42
  %15 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv42, i64 %indvars.iv47
  %16 = load double, double* %arrayidx16, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %17 = load <2 x double>, <2 x double>* %15, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next43, i64 %indvars.iv47
  %18 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %16, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %18, i32 1
  %mul = fmul <2 x double> %17, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.016, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %exitcond46.1 = icmp eq i64 %indvars.iv.next43.1, %indvars.iv47
  br i1 %exitcond46.1, label %for.end.loopexit, label %for.body8

for.end.loopexit:                                 ; preds = %for.body8
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body8.prol.loopexit, %for.body3
  %w.0.lcssa = phi double [ %11, %for.body3 ], [ %sub.lcssa.unr.ph, %for.body8.prol.loopexit ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv47
  %19 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %19
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next48, %indvars.iv65
  br i1 %exitcond52, label %for.body30.lr.ph, label %for.body3

for.inc58.loopexit:                               ; preds = %for.cond35.for.end50_crit_edge.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.cond1.preheader, %for.body30.lr.ph
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next66, %1
  br i1 %exitcond83, label %for.cond61.preheader, label %for.cond1.preheader

for.cond86.preheader:                             ; preds = %for.end79
  br i1 %cmp26, label %for.body88.preheader, label %for.end113

for.body88.preheader:                             ; preds = %for.cond86.preheader
  %20 = sext i32 %n to i64
  %21 = add nsw i64 %20, 1
  br label %for.body88

for.body63:                                       ; preds = %for.end79, %for.body63.preheader
  %indvars.iv80 = phi i2 [ 0, %for.body63.preheader ], [ %indvars.iv.next81, %for.end79 ]
  %indvars.iv38 = phi i64 [ 0, %for.body63.preheader ], [ %indvars.iv.next39, %for.end79 ]
  %22 = zext i2 %indvars.iv80 to i64
  %23 = add nsw i64 %indvars.iv38, -1
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv38
  %24 = load double, double* %arrayidx65, align 8
  %cmp678 = icmp sgt i64 %indvars.iv38, 0
  br i1 %cmp678, label %for.body68.preheader, label %for.end79

for.body68.preheader:                             ; preds = %for.body63
  %xtraiter69 = and i64 %indvars.iv38, 3
  %lcmp.mod70 = icmp eq i64 %xtraiter69, 0
  br i1 %lcmp.mod70, label %for.body68.prol.loopexit, label %for.body68.prol.preheader

for.body68.prol.preheader:                        ; preds = %for.body68.preheader
  br label %for.body68.prol

for.body68.prol:                                  ; preds = %for.body68.prol.preheader, %for.body68.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body68.prol ], [ 0, %for.body68.prol.preheader ]
  %w.210.prol = phi double [ %sub76.prol, %for.body68.prol ], [ %24, %for.body68.prol.preheader ]
  %prol.iter71 = phi i64 [ %prol.iter71.sub, %for.body68.prol ], [ %xtraiter69, %for.body68.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv.prol
  %25 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %26 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %25, %26
  %sub76.prol = fsub double %w.210.prol, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter71.sub = add nsw i64 %prol.iter71, -1
  %prol.iter71.cmp = icmp eq i64 %prol.iter71.sub, 0
  br i1 %prol.iter71.cmp, label %for.body68.prol.loopexit.loopexit, label %for.body68.prol, !llvm.loop !4

for.body68.prol.loopexit.loopexit:                ; preds = %for.body68.prol
  br label %for.body68.prol.loopexit

for.body68.prol.loopexit:                         ; preds = %for.body68.prol.loopexit.loopexit, %for.body68.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.body68.preheader ], [ %22, %for.body68.prol.loopexit.loopexit ]
  %w.210.unr = phi double [ %24, %for.body68.preheader ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %sub76.lcssa.unr = phi double [ undef, %for.body68.preheader ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %27 = icmp ult i64 %23, 3
  br i1 %27, label %for.end79, label %for.body68.preheader91

for.body68.preheader91:                           ; preds = %for.body68.prol.loopexit
  br label %for.body68

for.body68:                                       ; preds = %for.body68.preheader91, %for.body68
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body68 ], [ %indvars.iv.unr, %for.body68.preheader91 ]
  %w.210 = phi double [ %sub76.3, %for.body68 ], [ %w.210.unr, %for.body68.preheader91 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv
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
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv.next.1
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
  %exitcond37.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv38
  br i1 %exitcond37.3, label %for.end79.loopexit, label %for.body68

for.end79.loopexit:                               ; preds = %for.body68
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.body68.prol.loopexit, %for.body63
  %w.2.lcssa = phi double [ %24, %for.body63 ], [ %sub76.lcssa.unr, %for.body68.prol.loopexit ], [ %sub76.3, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv38
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %indvars.iv.next81 = add i2 %indvars.iv80, 1
  %exitcond = icmp eq i64 %indvars.iv.next39, %2
  br i1 %exitcond, label %for.cond86.preheader, label %for.body63

for.body88:                                       ; preds = %for.body88.preheader, %for.end104
  %indvars.iv78 = phi i2 [ 0, %for.body88.preheader ], [ %indvars.iv.next79, %for.end104 ]
  %indvars.iv76 = phi i64 [ %21, %for.body88.preheader ], [ %indvars.iv.next77, %for.end104 ]
  %indvar = phi i32 [ 0, %for.body88.preheader ], [ %indvar.next, %for.end104 ]
  %indvars.iv33 = phi i64 [ %20, %for.body88.preheader ], [ %indvars.iv.next34, %for.end104 ]
  %36 = zext i2 %indvars.iv78 to i64
  %37 = add nuw nsw i64 %36, 4294967295
  %38 = and i64 %37, 4294967295
  %39 = add i64 %indvars.iv76, %38
  %40 = add nsw i32 %indvar, -1
  %indvars.iv.next34 = add nsw i64 %indvars.iv33, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next34
  %41 = load double, double* %arrayidx90, align 8
  %cmp922 = icmp slt i64 %indvars.iv33, %20
  br i1 %cmp922, label %for.body93.preheader, label %for.end104

for.body93.preheader:                             ; preds = %for.body88
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body93.prol.loopexit, label %for.body93.prol.preheader

for.body93.prol.preheader:                        ; preds = %for.body93.preheader
  br label %for.body93.prol

for.body93.prol:                                  ; preds = %for.body93.prol.preheader, %for.body93.prol
  %indvars.iv31.prol = phi i64 [ %indvars.iv.next32.prol, %for.body93.prol ], [ %indvars.iv33, %for.body93.prol.preheader ]
  %w.33.prol = phi double [ %sub101.prol, %for.body93.prol ], [ %41, %for.body93.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body93.prol ], [ %xtraiter, %for.body93.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv31.prol
  %42 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv31.prol
  %43 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %42, %43
  %sub101.prol = fsub double %w.33.prol, %mul100.prol
  %indvars.iv.next32.prol = add nsw i64 %indvars.iv31.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body93.prol.loopexit.loopexit, label %for.body93.prol, !llvm.loop !5

for.body93.prol.loopexit.loopexit:                ; preds = %for.body93.prol
  br label %for.body93.prol.loopexit

for.body93.prol.loopexit:                         ; preds = %for.body93.prol.loopexit.loopexit, %for.body93.preheader
  %indvars.iv31.unr = phi i64 [ %indvars.iv33, %for.body93.preheader ], [ %39, %for.body93.prol.loopexit.loopexit ]
  %w.33.unr = phi double [ %41, %for.body93.preheader ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %sub101.lcssa.unr = phi double [ undef, %for.body93.preheader ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %44 = icmp ult i32 %40, 3
  br i1 %44, label %for.end104, label %for.body93.preheader90

for.body93.preheader90:                           ; preds = %for.body93.prol.loopexit
  br label %for.body93

for.body93:                                       ; preds = %for.body93.preheader90, %for.body93
  %indvars.iv31 = phi i64 [ %indvars.iv.next32.3, %for.body93 ], [ %indvars.iv31.unr, %for.body93.preheader90 ]
  %w.33 = phi double [ %sub101.3, %for.body93 ], [ %w.33.unr, %for.body93.preheader90 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv31
  %45 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv31
  %46 = bitcast double* %arrayidx99 to <2 x double>*
  %47 = load <2 x double>, <2 x double>* %45, align 8
  %48 = load <2 x double>, <2 x double>* %46, align 8
  %mul100 = fmul <2 x double> %47, %48
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.33, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next32.1 = add nsw i64 %indvars.iv31, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv.next32.1
  %49 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next32.1
  %50 = bitcast double* %arrayidx99.2 to <2 x double>*
  %51 = load <2 x double>, <2 x double>* %49, align 8
  %52 = load <2 x double>, <2 x double>* %50, align 8
  %mul100.2 = fmul <2 x double> %51, %52
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %indvars.iv.next32.3 = add nsw i64 %indvars.iv31, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next32.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %n
  br i1 %exitcond.3, label %for.end104.loopexit, label %for.body93

for.end104.loopexit:                              ; preds = %for.body93
  br label %for.end104

for.end104:                                       ; preds = %for.end104.loopexit, %for.body93.prol.loopexit, %for.body88
  %w.3.lcssa = phi double [ %41, %for.body88 ], [ %sub101.lcssa.unr, %for.body93.prol.loopexit ], [ %sub101.3, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv.next34
  %53 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %53
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next34
  store double %div109, double* %arrayidx111, align 8
  %cmp87 = icmp sgt i64 %indvars.iv33, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  %indvars.iv.next77 = add nsw i64 %indvars.iv76, -1
  %indvars.iv.next79 = add i2 %indvars.iv78, 1
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
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %3 = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %if.end, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond3, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
