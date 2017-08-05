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
  %arraydecay7 = bitcast i8* %call to [2000 x double]*
  %arraydecay8 = bitcast i8* %call1 to double*
  %arraydecay9 = bitcast i8* %call2 to double*
  %arraydecay10 = bitcast i8* %call3 to double*
  tail call fastcc void @kernel_ludcmp([2000 x double]* %arraydecay7, double* %arraydecay8, double* %arraydecay9, double* %arraydecay10)
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
  tail call fastcc void @print_array(double* %arraydecay12)
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
define internal fastcc void @init_array([2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
for.inc.preheader:
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv147 = phi i64 [ %indvars.iv.next148.1, %for.inc ], [ 0, %for.inc.preheader ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv147
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv147
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %2 = trunc i64 %indvars.iv147 to i32
  %3 = or i32 %2, 1
  %conv4 = sitofp i32 %3 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv147
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next148.1 = add nuw nsw i64 %indvars.iv147, 2
  %4 = trunc i64 %indvars.iv.next148.1 to i32
  %conv4.1 = sitofp i32 %4 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %5 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %5, align 8
  %exitcond150.1 = icmp eq i64 %indvars.iv.next148.1, 2000
  br i1 %exitcond150.1, label %for.inc25.lr.ph.preheader, label %for.inc

for.inc25.lr.ph.preheader:                        ; preds = %for.inc
  br label %for.inc25.lr.ph

for.inc25.lr.ph:                                  ; preds = %for.inc25.lr.ph.preheader, %for.inc44
  %indvars.iv143 = phi i64 [ %indvars.iv.next144, %for.inc44 ], [ 0, %for.inc25.lr.ph.preheader ]
  %6 = mul nuw nsw i64 %indvars.iv143, 2001
  %7 = sub nsw i64 1998, %indvars.iv143
  br label %for.inc25

for.cond29.preheader:                             ; preds = %for.inc25
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %cmp3080 = icmp slt i64 %indvars.iv.next144, 2000
  br i1 %cmp3080, label %for.inc44.loopexit, label %for.inc44

for.inc25:                                        ; preds = %for.inc25, %for.inc25.lr.ph
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %for.inc25 ], [ 0, %for.inc25.lr.ph ]
  %8 = sub nsw i64 0, %indvars.iv126
  %9 = trunc i64 %8 to i32
  %rem = srem i32 %9, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv143, i64 %indvars.iv126
  store double %add20, double* %arrayidx24, align 8
  %exitcond132 = icmp eq i64 %indvars.iv126, %indvars.iv143
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  br i1 %exitcond132, label %for.cond29.preheader, label %for.inc25

for.inc44.loopexit:                               ; preds = %for.cond29.preheader
  %10 = shl i64 %7, 3
  %11 = add nuw nsw i64 %6, 1
  %12 = and i64 %10, 34359738360
  %scevgep141 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %11
  %13 = add nuw nsw i64 %12, 8
  %scevgep141142 = bitcast double* %scevgep141 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep141142, i8 0, i64 %13, i32 8, i1 false)
  br label %for.inc44

for.inc44:                                        ; preds = %for.inc44.loopexit, %for.cond29.preheader
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv143, i64 %indvars.iv143
  store double 1.000000e+00, double* %arrayidx43, align 8
  %exitcond172 = icmp eq i64 %indvars.iv.next144, 2000
  br i1 %exitcond172, label %for.end46.for.cond51.preheader.us_crit_edge, label %for.inc25.lr.ph

for.end46.for.cond51.preheader.us_crit_edge:      ; preds = %for.inc44
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.inc62.us.3

for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge: ; preds = %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader, %for.inc96.us
  %indvars.iv170 = phi i64 [ %indvars.iv.next171, %for.inc96.us ], [ 0, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader ]
  br label %for.inc90.us.us.preheader

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %indvars.iv.next171 = add nuw nsw i64 %indvars.iv170, 1
  %exitcond176 = icmp eq i64 %indvars.iv.next171, 2000
  br i1 %exitcond176, label %for.cond103.preheader.us.preheader, label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond103.preheader.us.preheader:               ; preds = %for.inc96.us
  %14 = bitcast i8* %call to [2000 x [2000 x double]]*
  %15 = bitcast i8* %call to [2000 x [2000 x double]]*
  %16 = bitcast i8* %call to [2000 x [2000 x double]]*
  %17 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond103.preheader.us

for.inc90.us.us.preheader:                        ; preds = %for.inc93.us.us, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge
  %indvars.iv168 = phi i64 [ %indvars.iv.next169, %for.inc93.us.us ], [ 0, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge ]
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv168, i64 %indvars.iv170
  br label %for.inc90.us.us

for.inc93.us.us:                                  ; preds = %for.inc90.us.us
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %exitcond175 = icmp eq i64 %indvars.iv.next169, 2000
  br i1 %exitcond175, label %for.inc96.us, label %for.inc90.us.us.preheader

for.inc90.us.us:                                  ; preds = %for.inc90.us.us.preheader, %for.inc90.us.us
  %indvars.iv109 = phi i64 [ %indvars.iv.next110.1, %for.inc90.us.us ], [ 0, %for.inc90.us.us.preheader ]
  %18 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv109, i64 %indvars.iv170
  %19 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %18, %19
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv168, i64 %indvars.iv109
  %20 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %20, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next110 = or i64 %indvars.iv109, 1
  %21 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next110, i64 %indvars.iv170
  %22 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %21, %22
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv168, i64 %indvars.iv.next110
  %23 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %23, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %indvars.iv.next110.1 = add nuw nsw i64 %indvars.iv109, 2
  %exitcond112.1 = icmp eq i64 %indvars.iv.next110.1, 2000
  br i1 %exitcond112.1, label %for.inc93.us.us, label %for.inc90.us.us

for.cond103.preheader.us:                         ; preds = %for.cond103.preheader.us.preheader, %for.inc118.us
  %indvars.iv173 = phi i64 [ %indvars.iv.next174, %for.inc118.us ], [ 0, %for.cond103.preheader.us.preheader ]
  br label %for.inc115.us

for.inc115.us:                                    ; preds = %for.cond103.preheader.us, %for.inc115.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc115.us ], [ 0, %for.cond103.preheader.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv173, i64 %indvars.iv
  %24 = bitcast double* %arrayidx110.us to i64*
  %25 = load i64, i64* %24, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv173, i64 %indvars.iv
  %26 = bitcast double* %arrayidx114.us to i64*
  store i64 %25, i64* %26, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv173, i64 %indvars.iv.next
  %27 = bitcast double* %arrayidx110.us.1 to i64*
  %28 = load i64, i64* %27, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv173, i64 %indvars.iv.next
  %29 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv173, i64 %indvars.iv.next.1
  %30 = bitcast double* %arrayidx110.us.2 to i64*
  %31 = load i64, i64* %30, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv173, i64 %indvars.iv.next.1
  %32 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %31, i64* %32, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvars.iv173, i64 %indvars.iv.next.2
  %33 = bitcast double* %arrayidx110.us.3 to i64*
  %34 = load i64, i64* %33, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv173, i64 %indvars.iv.next.2
  %35 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %34, i64* %35, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %for.inc118.us, label %for.inc115.us

for.inc118.us:                                    ; preds = %for.inc115.us
  %indvars.iv.next174 = add nuw nsw i64 %indvars.iv173, 1
  %exitcond = icmp eq i64 %indvars.iv.next174, 2000
  br i1 %exitcond, label %for.end120, label %for.cond103.preheader.us

for.end120:                                       ; preds = %for.inc118.us
  tail call void @free(i8* %call) #4
  ret void

for.inc62.us.3:                                   ; preds = %for.inc62.us.3, %for.end46.for.cond51.preheader.us_crit_edge
  %indvar119 = phi i64 [ 0, %for.end46.for.cond51.preheader.us_crit_edge ], [ %indvar.next120.3.1, %for.inc62.us.3 ]
  %36 = mul nuw nsw i64 %indvar119, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %37 = mul nuw nsw i64 %indvar119, 16000
  %38 = add nuw nsw i64 %37, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %39 = mul nuw nsw i64 %indvar119, 16000
  %40 = add nuw nsw i64 %39, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %41 = mul nuw nsw i64 %indvar119, 16000
  %42 = add nuw nsw i64 %41, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next120.3 = or i64 %indvar119, 4
  %43 = mul nuw nsw i64 %indvar.next120.3, 16000
  %scevgep.11 = getelementptr i8, i8* %call, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.11, i8 0, i64 16000, i32 8, i1 false)
  %44 = mul nuw nsw i64 %indvar.next120.3, 16000
  %45 = add nuw nsw i64 %44, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %46 = mul nuw nsw i64 %indvar.next120.3, 16000
  %47 = add nuw nsw i64 %46, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %48 = mul nuw nsw i64 %indvar.next120.3, 16000
  %49 = add nuw nsw i64 %48, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %49
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next120.3.1 = add nsw i64 %indvar119, 8
  %exitcond122.3.1 = icmp eq i64 %indvar.next120.3.1, 2000
  br i1 %exitcond122.3.1, label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader, label %for.inc62.us.3

for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader: ; preds = %for.inc62.us.3
  %50 = bitcast i8* %call to [2000 x [2000 x double]]*
  %51 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry.for.cond1.preheader_crit_edge:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %entry.for.cond1.preheader_crit_edge
  %indvars.iv188 = phi i64 [ %indvars.iv.next189, %for.inc58 ], [ 0, %entry.for.cond1.preheader_crit_edge ]
  %indvars.iv177 = phi i2 [ %indvars.iv.next178, %for.inc58 ], [ 0, %entry.for.cond1.preheader_crit_edge ]
  %indvars.iv175 = phi i64 [ %indvars.iv.next176, %for.inc58 ], [ 1, %entry.for.cond1.preheader_crit_edge ]
  %0 = zext i2 %indvars.iv177 to i64
  %1 = add nuw nsw i64 %0, 4294967295
  %2 = and i64 %1, 4294967295
  %3 = add i64 %indvars.iv175, %2
  %4 = add nuw nsw i64 %indvars.iv188, 4294967295
  %5 = sub nuw nsw i64 2000, %indvars.iv188
  %6 = trunc i64 %5 to i32
  %7 = sub nuw nsw i64 4294969295, %indvars.iv188
  %8 = trunc i64 %7 to i32
  %cmp296 = icmp sgt i64 %indvars.iv188, 0
  br i1 %cmp296, label %for.body3.preheader, label %for.body30.lr.ph.for.body30_crit_edge

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 0
  br label %for.body3

for.body30.lr.ph:                                 ; preds = %for.inc25
  %cmp3698 = icmp sgt i64 %indvars.iv188, 0
  br i1 %cmp3698, label %for.body30.lr.ph.for.body30.us_crit_edge, label %for.body30.lr.ph.for.body30_crit_edge

for.body30.lr.ph.for.body30_crit_edge:            ; preds = %for.cond1.preheader, %for.body30.lr.ph
  %xtraiter143 = and i32 %6, 3
  %lcmp.mod144 = icmp eq i32 %xtraiter143, 0
  br i1 %lcmp.mod144, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.lr.ph.for.body30_crit_edge
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol.preheader, %for.body30.prol
  %indvars.iv138.prol = phi i64 [ %indvars.iv.next139.prol, %for.body30.prol ], [ %indvars.iv188, %for.body30.prol.preheader ]
  %prol.iter145 = phi i32 [ %prol.iter145.sub, %for.body30.prol ], [ %xtraiter143, %for.body30.prol.preheader ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv138.prol
  %9 = bitcast double* %arrayidx34.prol to i64*
  %10 = load i64, i64* %9, align 8
  %arrayidx54.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv138.prol
  %11 = bitcast double* %arrayidx54.prol to i64*
  store i64 %10, i64* %11, align 8
  %indvars.iv.next139.prol = add nuw nsw i64 %indvars.iv138.prol, 1
  %prol.iter145.sub = add nsw i32 %prol.iter145, -1
  %prol.iter145.cmp = icmp eq i32 %prol.iter145.sub, 0
  br i1 %prol.iter145.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !1

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.lr.ph.for.body30_crit_edge
  %indvars.iv138.unr = phi i64 [ %indvars.iv188, %for.body30.lr.ph.for.body30_crit_edge ], [ %3, %for.body30.prol.loopexit.loopexit ]
  %12 = icmp ult i32 %8, 3
  br i1 %12, label %for.inc58, label %for.body30.preheader

for.body30.preheader:                             ; preds = %for.body30.prol.loopexit
  %13 = sub i64 1996, %indvars.iv138.unr
  %14 = lshr i64 %13, 2
  %15 = and i64 %14, 1
  %lcmp.mod5 = icmp eq i64 %15, 0
  br i1 %lcmp.mod5, label %for.body30.prol6, label %for.body30.prol.loopexit3

for.body30.prol6:                                 ; preds = %for.body30.preheader
  %arrayidx34.prol8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv138.unr
  %16 = bitcast double* %arrayidx34.prol8 to <2 x i64>*
  %arrayidx54.prol9 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv138.unr
  %17 = load <2 x i64>, <2 x i64>* %16, align 8
  %18 = bitcast double* %arrayidx54.prol9 to <2 x i64>*
  store <2 x i64> %17, <2 x i64>* %18, align 8
  %indvars.iv.next139.1.prol = add nsw i64 %indvars.iv138.unr, 2
  %arrayidx34.2.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv.next139.1.prol
  %19 = bitcast double* %arrayidx34.2.prol to <2 x i64>*
  %arrayidx54.2.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv.next139.1.prol
  %20 = load <2 x i64>, <2 x i64>* %19, align 8
  %21 = bitcast double* %arrayidx54.2.prol to <2 x i64>*
  store <2 x i64> %20, <2 x i64>* %21, align 8
  %indvars.iv.next139.3.prol = add nsw i64 %indvars.iv138.unr, 4
  br label %for.body30.prol.loopexit3

for.body30.prol.loopexit3:                        ; preds = %for.body30.prol6, %for.body30.preheader
  %indvars.iv138.unr10.ph = phi i64 [ %indvars.iv.next139.3.prol, %for.body30.prol6 ], [ %indvars.iv138.unr, %for.body30.preheader ]
  %22 = icmp eq i64 %14, 0
  br i1 %22, label %for.inc58, label %for.body30.preheader.new

for.body30.preheader.new:                         ; preds = %for.body30.prol.loopexit3
  br label %for.body30

for.body30.lr.ph.for.body30.us_crit_edge:         ; preds = %for.body30.lr.ph
  %xtraiter152161 = and i64 %indvars.iv188, 1
  %23 = trunc i64 %4 to i32
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 0
  %24 = icmp eq i64 %xtraiter152161, 0
  %25 = icmp eq i32 %23, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.inc55.us, %for.body30.lr.ph.for.body30.us_crit_edge
  %indvars.iv181 = phi i64 [ %indvars.iv.next182, %for.inc55.us ], [ %indvars.iv188, %for.body30.lr.ph.for.body30.us_crit_edge ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv181
  %26 = load double, double* %arrayidx34.us, align 8
  br i1 %24, label %for.inc48.us.prol.loopexit, label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.body30.us
  %27 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv181
  %28 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %27, %28
  %sub47.us.prol = fsub double %26, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %indvars.iv146.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %w.1100.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %26, %for.body30.us ]
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  br i1 %25, label %for.inc55.us, label %for.inc48.us.preheader

for.inc48.us.preheader:                           ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.preheader, %for.inc48.us
  %indvars.iv146 = phi i64 [ %indvars.iv.next147.1, %for.inc48.us ], [ %indvars.iv146.unr.ph, %for.inc48.us.preheader ]
  %w.1100.us = phi double [ %sub47.us.1, %for.inc48.us ], [ %w.1100.us.unr.ph, %for.inc48.us.preheader ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv146
  %29 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv146, i64 %indvars.iv181
  %30 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %31 = load <2 x double>, <2 x double>* %29, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next147, i64 %indvars.iv181
  %32 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %30, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %32, i32 1
  %mul46.us = fmul <2 x double> %31, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %w.1100.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %indvars.iv.next147.1 = add nuw nsw i64 %indvars.iv146, 2
  %exitcond151.1 = icmp eq i64 %indvars.iv.next147.1, %indvars.iv188
  br i1 %exitcond151.1, label %for.inc55.us.loopexit, label %for.inc48.us

for.inc55.us.loopexit:                            ; preds = %for.inc48.us
  br label %for.inc55.us

for.inc55.us:                                     ; preds = %for.inc55.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.inc55.us.loopexit ]
  %arrayidx54.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv181
  store double %sub47.us.lcssa, double* %arrayidx54.us, align 8
  %indvars.iv.next182 = add nuw nsw i64 %indvars.iv181, 1
  %exitcond187 = icmp eq i64 %indvars.iv.next182, 2000
  br i1 %exitcond187, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv130 = phi i64 [ %indvars.iv.next131, %for.inc25 ], [ 0, %for.body3.preheader ]
  %33 = add nuw nsw i64 %indvars.iv130, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv130
  %34 = load double, double* %arrayidx5, align 8
  %cmp792 = icmp sgt i64 %indvars.iv130, 0
  br i1 %cmp792, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.body3
  %xtraiter126162 = and i64 %indvars.iv130, 1
  %lcmp.mod127 = icmp eq i64 %xtraiter126162, 0
  br i1 %lcmp.mod127, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %35 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv130
  %36 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %35, %36
  %sub.prol = fsub double %34, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.lr.ph
  %indvars.iv120.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %w.094.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %34, %for.inc.lr.ph ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.lr.ph ]
  %37 = trunc i64 %33 to i32
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %for.inc25, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv120 = phi i64 [ %indvars.iv.next121.1, %for.inc ], [ %indvars.iv120.unr.ph, %for.inc.preheader ]
  %w.094 = phi double [ %sub.1, %for.inc ], [ %w.094.unr.ph, %for.inc.preheader ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv120
  %39 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv120, i64 %indvars.iv130
  %40 = load double, double* %arrayidx16, align 8
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %41 = load <2 x double>, <2 x double>* %39, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next121, i64 %indvars.iv130
  %42 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %40, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %42, i32 1
  %mul = fmul <2 x double> %41, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.094, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %indvars.iv.next121.1 = add nuw nsw i64 %indvars.iv120, 2
  %exitcond125.1 = icmp eq i64 %indvars.iv.next121.1, %indvars.iv130
  br i1 %exitcond125.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.body3
  %w.0.lcssa = phi double [ %34, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv130, i64 %indvars.iv130
  %43 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %43
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv130
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next131, %indvars.iv188
  br i1 %exitcond135, label %for.body30.lr.ph, label %for.body3

for.body30:                                       ; preds = %for.body30, %for.body30.preheader.new
  %indvars.iv138 = phi i64 [ %indvars.iv138.unr10.ph, %for.body30.preheader.new ], [ %indvars.iv.next139.3.1, %for.body30 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv138
  %44 = bitcast double* %arrayidx34 to <2 x i64>*
  %arrayidx54 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv138
  %45 = load <2 x i64>, <2 x i64>* %44, align 8
  %46 = bitcast double* %arrayidx54 to <2 x i64>*
  store <2 x i64> %45, <2 x i64>* %46, align 8
  %indvars.iv.next139.1 = add nsw i64 %indvars.iv138, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv.next139.1
  %47 = bitcast double* %arrayidx34.2 to <2 x i64>*
  %arrayidx54.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv.next139.1
  %48 = load <2 x i64>, <2 x i64>* %47, align 8
  %49 = bitcast double* %arrayidx54.2 to <2 x i64>*
  store <2 x i64> %48, <2 x i64>* %49, align 8
  %indvars.iv.next139.3 = add nsw i64 %indvars.iv138, 4
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv.next139.3
  %50 = bitcast double* %arrayidx34.1 to <2 x i64>*
  %arrayidx54.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv.next139.3
  %51 = load <2 x i64>, <2 x i64>* %50, align 8
  %52 = bitcast double* %arrayidx54.1 to <2 x i64>*
  store <2 x i64> %51, <2 x i64>* %52, align 8
  %indvars.iv.next139.1.1 = add nsw i64 %indvars.iv138, 6
  %arrayidx34.2.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv.next139.1.1
  %53 = bitcast double* %arrayidx34.2.1 to <2 x i64>*
  %arrayidx54.2.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv188, i64 %indvars.iv.next139.1.1
  %54 = load <2 x i64>, <2 x i64>* %53, align 8
  %55 = bitcast double* %arrayidx54.2.1 to <2 x i64>*
  store <2 x i64> %54, <2 x i64>* %55, align 8
  %indvars.iv.next139.3.1 = add nsw i64 %indvars.iv138, 8
  %exitcond141.3.1 = icmp eq i64 %indvars.iv.next139.3.1, 2000
  br i1 %exitcond141.3.1, label %for.inc58.loopexit11, label %for.body30

for.inc58.loopexit:                               ; preds = %for.inc55.us
  br label %for.inc58

for.inc58.loopexit11:                             ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit11, %for.inc58.loopexit, %for.body30.prol.loopexit3, %for.body30.prol.loopexit
  %indvars.iv.next189 = add nuw nsw i64 %indvars.iv188, 1
  %indvars.iv.next176 = add nuw nsw i64 %indvars.iv175, 1
  %indvars.iv.next178 = add i2 %indvars.iv177, -1
  %exitcond183 = icmp eq i64 %indvars.iv.next189, 2000
  br i1 %exitcond183, label %for.body63.preheader, label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.inc82
  %indvars.iv173 = phi i64 [ %indvars.iv.next174, %for.inc82 ], [ 0, %for.body63.preheader ]
  %indvars.iv171 = phi i2 [ %indvars.iv.next172, %for.inc82 ], [ 0, %for.body63.preheader ]
  %56 = zext i2 %indvars.iv171 to i64
  %57 = add nuw nsw i64 %56, 4294967295
  %58 = and i64 %57, 4294967295
  %59 = add nuw nsw i64 %58, 1
  %60 = trunc i64 %indvars.iv173 to i32
  %61 = add i32 %60, -1
  %sext184 = shl i64 %indvars.iv173, 32
  %idxprom64 = ashr exact i64 %sext184, 32
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %idxprom64
  %62 = load double, double* %arrayidx65, align 8
  %63 = trunc i64 %indvars.iv173 to i32
  %cmp6785 = icmp sgt i32 %63, 0
  %sext185 = shl i64 %indvars.iv173, 32
  %idxprom69 = ashr exact i64 %sext185, 32
  br i1 %cmp6785, label %for.body63.for.inc77_crit_edge, label %for.inc82

for.body63.for.inc77_crit_edge:                   ; preds = %for.body63
  %64 = trunc i64 %indvars.iv173 to i32
  %xtraiter115 = and i32 %64, 3
  %lcmp.mod116 = icmp eq i32 %xtraiter115, 0
  br i1 %lcmp.mod116, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.body63.for.inc77_crit_edge
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol.preheader, %for.inc77.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %w.287.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %62, %for.inc77.prol.preheader ]
  %prol.iter118 = phi i32 [ %prol.iter118.sub, %for.inc77.prol ], [ %xtraiter115, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %idxprom69, i64 %indvars.iv.prol
  %65 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %66 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %65, %66
  %sub76.prol = fsub double %w.287.prol, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter118.sub = add nsw i32 %prol.iter118, -1
  %prol.iter118.cmp = icmp eq i32 %prol.iter118.sub, 0
  br i1 %prol.iter118.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !3

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.body63.for.inc77_crit_edge
  %indvars.iv.unr = phi i64 [ 0, %for.body63.for.inc77_crit_edge ], [ %59, %for.inc77.prol.loopexit.loopexit ]
  %w.287.unr = phi double [ %62, %for.body63.for.inc77_crit_edge ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %sub76.lcssa.unr = phi double [ undef, %for.body63.for.inc77_crit_edge ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %67 = icmp ult i32 %61, 3
  br i1 %67, label %for.inc82, label %for.inc77.preheader

for.inc77.preheader:                              ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77.preheader, %for.inc77
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc77 ], [ %indvars.iv.unr, %for.inc77.preheader ]
  %w.287 = phi double [ %sub76.3, %for.inc77 ], [ %w.287.unr, %for.inc77.preheader ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %idxprom69, i64 %indvars.iv
  %68 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %69 = bitcast double* %arrayidx74 to <2 x double>*
  %70 = load <2 x double>, <2 x double>* %68, align 8
  %71 = load <2 x double>, <2 x double>* %69, align 8
  %mul75 = fmul <2 x double> %70, %71
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %w.287, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %idxprom69, i64 %indvars.iv.next.1
  %72 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %73 = bitcast double* %arrayidx74.2 to <2 x double>*
  %74 = load <2 x double>, <2 x double>* %72, align 8
  %75 = load <2 x double>, <2 x double>* %73, align 8
  %mul75.2 = fmul <2 x double> %74, %75
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3119 = icmp eq i64 %indvars.iv.next.3, %indvars.iv173
  br i1 %exitcond.3119, label %for.inc82.loopexit, label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.inc77.prol.loopexit, %for.body63
  %w.2.lcssa = phi double [ %62, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %idxprom69
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next174 = add nuw nsw i64 %indvars.iv173, 1
  %exitcond = icmp eq i64 %indvars.iv.next174, 2000
  %indvars.iv.next172 = add i2 %indvars.iv171, 1
  br i1 %exitcond, label %for.body88.preheader, label %for.body63

for.body88.preheader:                             ; preds = %for.inc82
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.inc112
  %indvars.iv169 = phi i2 [ %indvars.iv.next170, %for.inc112 ], [ 0, %for.body88.preheader ]
  %indvars.iv167 = phi i64 [ %indvars.iv.next168, %for.inc112 ], [ 2001, %for.body88.preheader ]
  %indvars.iv111 = phi i64 [ %indvars.iv.next112, %for.inc112 ], [ 2000, %for.body88.preheader ]
  %indvar = phi i32 [ %indvar.next, %for.inc112 ], [ 0, %for.body88.preheader ]
  %76 = zext i2 %indvars.iv169 to i64
  %77 = add nuw nsw i64 %76, 4294967295
  %78 = and i64 %77, 4294967295
  %79 = add i64 %indvars.iv167, %78
  %80 = add nsw i32 %indvar, -1
  %indvars.iv.next112 = add nsw i64 %indvars.iv111, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next112
  %81 = load double, double* %arrayidx90, align 8
  %cmp9278 = icmp slt i64 %indvars.iv111, 2000
  br i1 %cmp9278, label %for.body88.for.inc102_crit_edge, label %for.inc112

for.body88.for.inc102_crit_edge:                  ; preds = %for.body88
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.body88.for.inc102_crit_edge
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol.preheader, %for.inc102.prol
  %indvars.iv109.prol = phi i64 [ %indvars.iv.next110.prol, %for.inc102.prol ], [ %indvars.iv111, %for.inc102.prol.preheader ]
  %w.379.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %81, %for.inc102.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next112, i64 %indvars.iv109.prol
  %82 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv109.prol
  %83 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %82, %83
  %sub101.prol = fsub double %w.379.prol, %mul100.prol
  %indvars.iv.next110.prol = add nuw nsw i64 %indvars.iv109.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !4

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.body88.for.inc102_crit_edge
  %indvars.iv109.unr = phi i64 [ %indvars.iv111, %for.body88.for.inc102_crit_edge ], [ %79, %for.inc102.prol.loopexit.loopexit ]
  %w.379.unr = phi double [ %81, %for.body88.for.inc102_crit_edge ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %sub101.lcssa.unr = phi double [ undef, %for.body88.for.inc102_crit_edge ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %84 = icmp ult i32 %80, 3
  br i1 %84, label %for.inc112, label %for.inc102.preheader

for.inc102.preheader:                             ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102.preheader, %for.inc102
  %indvars.iv109 = phi i64 [ %indvars.iv.next110.3, %for.inc102 ], [ %indvars.iv109.unr, %for.inc102.preheader ]
  %w.379 = phi double [ %sub101.3, %for.inc102 ], [ %w.379.unr, %for.inc102.preheader ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next112, i64 %indvars.iv109
  %85 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv109
  %86 = bitcast double* %arrayidx99 to <2 x double>*
  %87 = load <2 x double>, <2 x double>* %85, align 8
  %88 = load <2 x double>, <2 x double>* %86, align 8
  %mul100 = fmul <2 x double> %87, %88
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.379, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next110.1 = add nsw i64 %indvars.iv109, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next112, i64 %indvars.iv.next110.1
  %89 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next110.1
  %90 = bitcast double* %arrayidx99.2 to <2 x double>*
  %91 = load <2 x double>, <2 x double>* %89, align 8
  %92 = load <2 x double>, <2 x double>* %90, align 8
  %mul100.2 = fmul <2 x double> %91, %92
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %indvars.iv.next110.3 = add nsw i64 %indvars.iv109, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next110.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, 2000
  br i1 %exitcond.3, label %for.inc112.loopexit, label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.inc102.prol.loopexit, %for.body88
  %w.3.lcssa = phi double [ %81, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %sext = shl i64 %indvars.iv.next112, 32
  %idxprom107 = ashr exact i64 %sext, 32
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next112, i64 %idxprom107
  %93 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %93
  %sext160 = shl i64 %indvars.iv.next112, 32
  %idxprom110 = ashr exact i64 %sext160, 32
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %idxprom110
  store double %div109, double* %arrayidx111, align 8
  %cmp87 = icmp sgt i64 %indvars.iv111, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  %indvars.iv.next168 = add nsw i64 %indvars.iv167, -1
  %indvars.iv.next170 = add i2 %indvars.iv169, 1
  br i1 %cmp87, label %for.body88, label %for.end113

for.end113:                                       ; preds = %for.inc112
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %x) unnamed_addr #0 {
for.body.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond6, label %for.end, label %for.body

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
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
