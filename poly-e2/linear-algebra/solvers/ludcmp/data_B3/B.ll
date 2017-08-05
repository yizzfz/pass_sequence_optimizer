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
  tail call fastcc void @print_array(double* %arraydecay5)
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
define internal fastcc void @init_array([2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv87 = phi i64 [ %indvars.iv.next88.1, %for.body ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv87
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv87
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %2 = trunc i64 %indvars.iv87 to i32
  %3 = or i32 %2, 1
  %conv4 = sitofp i32 %3 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv87
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next88.1 = add nuw nsw i64 %indvars.iv87, 2
  %4 = trunc i64 %indvars.iv.next88.1 to i32
  %conv4.1 = sitofp i32 %4 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %5 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %5, align 8
  %exitcond90.1 = icmp eq i64 %indvars.iv.next88.1, 2000
  br i1 %exitcond90.1, label %for.body16.lr.ph.preheader, label %for.body

for.body16.lr.ph.preheader:                       ; preds = %for.body
  br label %for.body16.lr.ph

for.body16.lr.ph:                                 ; preds = %for.body16.lr.ph.preheader, %for.end39
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %for.end39 ], [ 0, %for.body16.lr.ph.preheader ]
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %for.end39 ], [ 1, %for.body16.lr.ph.preheader ]
  %6 = mul nuw nsw i64 %indvars.iv83, 2001
  %7 = add nuw nsw i64 %6, 1
  %scevgep97 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %7
  %8 = sub nsw i64 1998, %indvars.iv83
  %9 = shl i64 %8, 3
  %10 = and i64 %9, 34359738360
  br label %for.body16

for.cond29.preheader:                             ; preds = %for.body16
  %scevgep9798 = bitcast double* %scevgep97 to i8*
  %11 = add nuw nsw i64 %10, 8
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %cmp3038 = icmp slt i64 %indvars.iv.next84, 2000
  br i1 %cmp3038, label %for.end39.loopexit, label %for.end39

for.body16:                                       ; preds = %for.body16, %for.body16.lr.ph
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.body16 ], [ 0, %for.body16.lr.ph ]
  %12 = sub nsw i64 0, %indvars.iv68
  %13 = trunc i64 %12 to i32
  %rem = srem i32 %13, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv83, i64 %indvars.iv68
  store double %add20, double* %arrayidx24, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next69, %indvars.iv81
  br i1 %exitcond74, label %for.cond29.preheader, label %for.body16

for.end39.loopexit:                               ; preds = %for.cond29.preheader
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep9798, i8 0, i64 %11, i32 8, i1 false)
  br label %for.end39

for.end39:                                        ; preds = %for.end39.loopexit, %for.cond29.preheader
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv83, i64 %indvars.iv83
  store double 1.000000e+00, double* %arrayidx43, align 8
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next84, 2000
  br i1 %exitcond86, label %for.end46, label %for.body16.lr.ph

for.end46:                                        ; preds = %for.end39
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.cond51.for.inc62_crit_edge.us.3

for.cond73.preheader.us.us.preheader:             ; preds = %for.cond73.preheader.us.us.preheader.preheader, %for.cond69.for.inc96_crit_edge.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %for.cond69.for.inc96_crit_edge.us ], [ 0, %for.cond73.preheader.us.us.preheader.preheader ]
  br label %for.cond73.preheader.us.us

for.cond69.for.inc96_crit_edge.us:                ; preds = %for.cond73.for.inc93_crit_edge.us.us
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next57, 2000
  br i1 %exitcond59, label %for.cond103.preheader.us.preheader, label %for.cond73.preheader.us.us.preheader

for.cond103.preheader.us.preheader:               ; preds = %for.cond69.for.inc96_crit_edge.us
  br label %for.cond103.preheader.us

for.cond73.preheader.us.us:                       ; preds = %for.cond73.for.inc93_crit_edge.us.us, %for.cond73.preheader.us.us.preheader
  %indvars.iv52 = phi i64 [ 0, %for.cond73.preheader.us.us.preheader ], [ %indvars.iv.next53, %for.cond73.for.inc93_crit_edge.us.us ]
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv56
  br label %for.body76.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.body76.us.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 2000
  br i1 %exitcond55, label %for.cond69.for.inc96_crit_edge.us, label %for.cond73.preheader.us.us

for.body76.us.us:                                 ; preds = %for.cond73.preheader.us.us, %for.body76.us.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.1, %for.body76.us.us ], [ 0, %for.cond73.preheader.us.us ]
  %14 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv56
  %15 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %14, %15
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv52, i64 %indvars.iv48
  %16 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %16, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next49 = or i64 %indvars.iv48, 1
  %17 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next49, i64 %indvars.iv56
  %18 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %17, %18
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv52, i64 %indvars.iv.next49
  %19 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %19, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %indvars.iv.next49.1 = add nuw nsw i64 %indvars.iv48, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49.1, 2000
  br i1 %exitcond51.1, label %for.cond73.for.inc93_crit_edge.us.us, label %for.body76.us.us

for.cond103.preheader.us:                         ; preds = %for.cond103.preheader.us.preheader, %for.cond103.for.inc118_crit_edge.us
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %for.cond103.for.inc118_crit_edge.us ], [ 0, %for.cond103.preheader.us.preheader ]
  br label %for.body106.us

for.body106.us:                                   ; preds = %for.cond103.preheader.us, %for.body106.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body106.us ], [ 0, %for.cond103.preheader.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv44, i64 %indvars.iv
  %20 = bitcast double* %arrayidx110.us to i64*
  %21 = load i64, i64* %20, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv
  %22 = bitcast double* %arrayidx114.us to i64*
  store i64 %21, i64* %22, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next
  %23 = bitcast double* %arrayidx110.us.1 to i64*
  %24 = load i64, i64* %23, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.next
  %25 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %24, i64* %25, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %26 = bitcast double* %arrayidx110.us.2 to i64*
  %27 = load i64, i64* %26, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %28 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %27, i64* %28, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next.2
  %29 = bitcast double* %arrayidx110.us.3 to i64*
  %30 = load i64, i64* %29, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.next.2
  %31 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %for.cond103.for.inc118_crit_edge.us, label %for.body106.us

for.cond103.for.inc118_crit_edge.us:              ; preds = %for.body106.us
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next45, 2000
  br i1 %exitcond47, label %for.end120, label %for.cond103.preheader.us

for.end120:                                       ; preds = %for.cond103.for.inc118_crit_edge.us
  tail call void @free(i8* %call) #4
  ret void

for.cond51.for.inc62_crit_edge.us.3:              ; preds = %for.cond51.for.inc62_crit_edge.us.3, %for.end46
  %indvars.iv64 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next65.3.1, %for.cond51.for.inc62_crit_edge.us.3 ]
  %32 = mul nuw nsw i64 %indvars.iv64, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %33 = add nuw nsw i64 %32, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %34 = add nuw nsw i64 %32, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %35 = add nuw nsw i64 %32, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next65.3 = or i64 %indvars.iv64, 4
  %36 = mul nuw nsw i64 %indvars.iv.next65.3, 16000
  %scevgep.114 = getelementptr i8, i8* %call, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.114, i8 0, i64 16000, i32 8, i1 false)
  %37 = add nuw nsw i64 %36, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %38 = add nuw nsw i64 %36, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %39 = add nuw nsw i64 %36, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next65.3.1 = add nuw nsw i64 %indvars.iv64, 8
  %exitcond67.3.1 = icmp eq i64 %indvars.iv.next65.3.1, 2000
  br i1 %exitcond67.3.1, label %for.cond73.preheader.us.us.preheader.preheader, label %for.cond51.for.inc62_crit_edge.us.3

for.cond73.preheader.us.us.preheader.preheader:   ; preds = %for.cond51.for.inc62_crit_edge.us.3
  %40 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond73.preheader.us.us.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc58
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.inc58 ], [ 0, %entry ]
  %0 = add nuw nsw i64 %indvars.iv65, 4294967295
  %1 = trunc i64 %0 to i32
  %cmp218 = icmp sgt i64 %indvars.iv65, 0
  br i1 %cmp218, label %for.body3.preheader, label %for.inc58

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 0
  br label %for.body3

for.body30.us.preheader:                          ; preds = %for.end
  %xtraiter7476 = and i64 %indvars.iv65, 1
  %lcmp.mod75 = icmp eq i64 %xtraiter7476, 0
  %2 = icmp eq i32 %1, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond35.for.end50_crit_edge.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %for.cond35.for.end50_crit_edge.us ], [ %indvars.iv65, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv61
  %3 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod75, label %for.inc48.us.prol.loopexit, label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.body30.us
  %4 = load double, double* %arrayidx12.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv61
  %5 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %4, %5
  %sub47.us.prol = fsub double %3, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %indvars.iv54.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %w.122.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %3, %for.body30.us ]
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  br i1 %2, label %for.cond35.for.end50_crit_edge.us, label %for.inc48.us.preheader

for.inc48.us.preheader:                           ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.preheader, %for.inc48.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.1, %for.inc48.us ], [ %indvars.iv54.unr.ph, %for.inc48.us.preheader ]
  %w.122.us = phi double [ %sub47.us.1, %for.inc48.us ], [ %w.122.us.unr.ph, %for.inc48.us.preheader ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv54
  %6 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv61
  %7 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %8 = load <2 x double>, <2 x double>* %6, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next55, i64 %indvars.iv61
  %9 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %7, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %9, i32 1
  %mul46.us = fmul <2 x double> %8, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %w.122.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %indvars.iv.next55.1 = add nuw nsw i64 %indvars.iv54, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next55.1, %indvars.iv65
  br i1 %exitcond58.1, label %for.cond35.for.end50_crit_edge.us.loopexit, label %for.inc48.us

for.cond35.for.end50_crit_edge.us.loopexit:       ; preds = %for.inc48.us
  br label %for.cond35.for.end50_crit_edge.us

for.cond35.for.end50_crit_edge.us:                ; preds = %for.cond35.for.end50_crit_edge.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.cond35.for.end50_crit_edge.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, 2000
  br i1 %exitcond64, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.body3.preheader, %for.end
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.end ], [ 0, %for.body3.preheader ]
  %10 = add nuw nsw i64 %indvars.iv47, 4294967295
  %11 = trunc i64 %10 to i32
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv47
  %12 = load double, double* %arrayidx5, align 8
  %cmp714 = icmp sgt i64 %indvars.iv47, 0
  br i1 %cmp714, label %for.inc.preheader, label %for.end

for.inc.preheader:                                ; preds = %for.body3
  %xtraiter7277 = and i64 %indvars.iv47, 1
  %lcmp.mod73 = icmp eq i64 %xtraiter7277, 0
  br i1 %lcmp.mod73, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.preheader
  %13 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv47
  %14 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %13, %14
  %sub.prol = fsub double %12, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.preheader
  %indvars.iv42.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %w.016.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %12, %for.inc.preheader ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %15 = icmp eq i32 %11, 0
  br i1 %15, label %for.end, label %for.inc.preheader3

for.inc.preheader3:                               ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader3, %for.inc
  %indvars.iv42 = phi i64 [ %indvars.iv.next43.1, %for.inc ], [ %indvars.iv42.unr.ph, %for.inc.preheader3 ]
  %w.016 = phi double [ %sub.1, %for.inc ], [ %w.016.unr.ph, %for.inc.preheader3 ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv42
  %16 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv42, i64 %indvars.iv47
  %17 = load double, double* %arrayidx16, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %18 = load <2 x double>, <2 x double>* %16, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next43, i64 %indvars.iv47
  %19 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %17, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %19, i32 1
  %mul = fmul <2 x double> %18, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.016, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %indvars.iv.next43.1 = add nuw nsw i64 %indvars.iv42, 2
  %exitcond46.1 = icmp eq i64 %indvars.iv.next43.1, %indvars.iv47
  br i1 %exitcond46.1, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit, %for.body3
  %w.0.lcssa = phi double [ %12, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv47
  %20 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %20
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next48, %indvars.iv65
  br i1 %exitcond52, label %for.body30.us.preheader, label %for.body3

for.inc58.loopexit:                               ; preds = %for.cond35.for.end50_crit_edge.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.cond1.preheader
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, 2000
  br i1 %exitcond68, label %for.body63.preheader, label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.end79
  %indvars.iv7 = phi i2 [ 0, %for.body63.preheader ], [ %indvars.iv.next8, %for.end79 ]
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %for.end79 ], [ 0, %for.body63.preheader ]
  %21 = zext i2 %indvars.iv7 to i32
  %22 = add i32 %21, -1
  %23 = zext i32 %22 to i64
  %24 = add i64 %23, 1
  %25 = add nuw nsw i64 %indvars.iv38, 4294967295
  %26 = trunc i64 %25 to i32
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv38
  %27 = load double, double* %arrayidx65, align 8
  %cmp678 = icmp sgt i64 %indvars.iv38, 0
  br i1 %cmp678, label %for.inc77.preheader, label %for.end79

for.inc77.preheader:                              ; preds = %for.body63
  %28 = trunc i64 %indvars.iv38 to i32
  %xtraiter69 = and i32 %28, 3
  %lcmp.mod70 = icmp eq i32 %xtraiter69, 0
  br i1 %lcmp.mod70, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.preheader
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol.preheader, %for.inc77.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %w.210.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %27, %for.inc77.prol.preheader ]
  %prol.iter71 = phi i32 [ %prol.iter71.sub, %for.inc77.prol ], [ %xtraiter69, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv.prol
  %29 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %30 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %29, %30
  %sub76.prol = fsub double %w.210.prol, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter71.sub = add nsw i32 %prol.iter71, -1
  %prol.iter71.cmp = icmp eq i32 %prol.iter71.sub, 0
  br i1 %prol.iter71.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !1

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.inc77.preheader ], [ %24, %for.inc77.prol.loopexit.loopexit ]
  %w.210.unr = phi double [ %27, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %31 = icmp ult i32 %26, 3
  br i1 %31, label %for.end79, label %for.inc77.preheader2

for.inc77.preheader2:                             ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77.preheader2, %for.inc77
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc77 ], [ %indvars.iv.unr, %for.inc77.preheader2 ]
  %w.210 = phi double [ %sub76.3, %for.inc77 ], [ %w.210.unr, %for.inc77.preheader2 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv
  %32 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %33 = bitcast double* %arrayidx74 to <2 x double>*
  %34 = load <2 x double>, <2 x double>* %32, align 8
  %35 = load <2 x double>, <2 x double>* %33, align 8
  %mul75 = fmul <2 x double> %34, %35
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %w.210, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv.next.1
  %36 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %37 = bitcast double* %arrayidx74.2 to <2 x double>*
  %38 = load <2 x double>, <2 x double>* %36, align 8
  %39 = load <2 x double>, <2 x double>* %37, align 8
  %mul75.2 = fmul <2 x double> %38, %39
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond37.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv38
  br i1 %exitcond37.3, label %for.end79.loopexit, label %for.inc77

for.end79.loopexit:                               ; preds = %for.inc77
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.inc77.prol.loopexit, %for.body63
  %w.2.lcssa = phi double [ %27, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv38
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, 2000
  %indvars.iv.next8 = add i2 %indvars.iv7, 1
  br i1 %exitcond41, label %for.body88.preheader, label %for.body63

for.body88.preheader:                             ; preds = %for.end79
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.end104
  %indvars.iv5 = phi i2 [ 0, %for.body88.preheader ], [ %indvars.iv.next6, %for.end104 ]
  %indvars.iv4 = phi i64 [ 2001, %for.body88.preheader ], [ %indvars.iv.next, %for.end104 ]
  %indvar = phi i32 [ %indvar.next, %for.end104 ], [ 0, %for.body88.preheader ]
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.end104 ], [ 2000, %for.body88.preheader ]
  %i.27.in = phi i32 [ %i.27, %for.end104 ], [ 2000, %for.body88.preheader ]
  %40 = zext i2 %indvars.iv5 to i32
  %41 = add i32 %40, -1
  %42 = zext i32 %41 to i64
  %43 = add i64 %indvars.iv4, %42
  %44 = add nsw i32 %indvar, -1
  %indvars.iv.next34 = add nsw i64 %indvars.iv33, -1
  %i.27 = add nsw i32 %i.27.in, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next34
  %45 = load double, double* %arrayidx90, align 8
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
  %w.33.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %45, %for.inc102.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv31.prol
  %46 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv31.prol
  %47 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %46, %47
  %sub101.prol = fsub double %w.33.prol, %mul100.prol
  %indvars.iv.next32.prol = add nuw nsw i64 %indvars.iv31.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !3

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.preheader
  %indvars.iv31.unr = phi i64 [ %indvars.iv33, %for.inc102.preheader ], [ %43, %for.inc102.prol.loopexit.loopexit ]
  %w.33.unr = phi double [ %45, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %48 = icmp ult i32 %44, 3
  br i1 %48, label %for.end104, label %for.inc102.preheader1

for.inc102.preheader1:                            ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102.preheader1, %for.inc102
  %indvars.iv31 = phi i64 [ %indvars.iv.next32.3, %for.inc102 ], [ %indvars.iv31.unr, %for.inc102.preheader1 ]
  %w.33 = phi double [ %sub101.3, %for.inc102 ], [ %w.33.unr, %for.inc102.preheader1 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv31
  %49 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv31
  %50 = bitcast double* %arrayidx99 to <2 x double>*
  %51 = load <2 x double>, <2 x double>* %49, align 8
  %52 = load <2 x double>, <2 x double>* %50, align 8
  %mul100 = fmul <2 x double> %51, %52
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.33, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next32.1 = add nsw i64 %indvars.iv31, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv.next32.1
  %53 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next32.1
  %54 = bitcast double* %arrayidx99.2 to <2 x double>*
  %55 = load <2 x double>, <2 x double>* %53, align 8
  %56 = load <2 x double>, <2 x double>* %54, align 8
  %mul100.2 = fmul <2 x double> %55, %56
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
  %w.3.lcssa = phi double [ %45, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv.next34
  %57 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %57
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next34
  store double %div109, double* %arrayidx111, align 8
  %cmp87 = icmp sgt i64 %indvars.iv33, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  %indvars.iv.next = add nsw i64 %indvars.iv4, -1
  %indvars.iv.next6 = add i2 %indvars.iv5, 1
  br i1 %cmp87, label %for.body88, label %for.end113

for.end113:                                       ; preds = %for.end104
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %entry, %if.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %entry ]
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
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
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
