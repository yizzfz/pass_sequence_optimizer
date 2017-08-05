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
entry.for.inc_crit_edge:
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %entry.for.inc_crit_edge
  %indvars.iv117 = phi i64 [ 0, %entry.for.inc_crit_edge ], [ %indvars.iv.next118.1, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv117
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv117
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next118 = or i64 %indvars.iv117, 1
  %2 = trunc i64 %indvars.iv.next118 to i32
  %conv4 = sitofp i32 %2 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv117
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next118.1 = add nsw i64 %indvars.iv117, 2
  %3 = trunc i64 %indvars.iv.next118.1 to i32
  %conv4.1 = sitofp i32 %3 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %4 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %4, align 8
  %exitcond141.1 = icmp eq i64 %indvars.iv.next118, 1999
  br i1 %exitcond141.1, label %for.inc25.lr.ph.preheader, label %for.inc

for.inc25.lr.ph.preheader:                        ; preds = %for.inc
  br label %for.inc25.lr.ph

for.inc25.lr.ph:                                  ; preds = %for.inc25.lr.ph.preheader, %for.inc44
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %for.inc44 ], [ 0, %for.inc25.lr.ph.preheader ]
  %5 = shl i64 %indvars.iv115, 32
  %sext = add nuw nsw i64 %5, 4294967296
  br label %for.inc25

for.cond29.preheader:                             ; preds = %for.inc25
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %cmp3076 = icmp slt i64 %indvars.iv.next116, 2000
  br i1 %cmp3076, label %for.inc37.for.inc44_crit_edge, label %for.inc44

for.inc25:                                        ; preds = %for.inc25.for.inc25_crit_edge, %for.inc25.lr.ph
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %for.inc25.for.inc25_crit_edge ], [ 0, %for.inc25.lr.ph ]
  %6 = sub nsw i64 0, %indvars.iv99
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv115, i64 %indvars.iv99
  store double %add20, double* %arrayidx24, align 8
  %exitcond105 = icmp eq i64 %indvars.iv99, %indvars.iv115
  br i1 %exitcond105, label %for.cond29.preheader, label %for.inc25.for.inc25_crit_edge

for.inc25.for.inc25_crit_edge:                    ; preds = %for.inc25
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  br label %for.inc25

for.inc37.for.inc44_crit_edge:                    ; preds = %for.cond29.preheader
  %8 = sub nsw i64 1998, %indvars.iv115
  %9 = shl i64 %8, 3
  %10 = and i64 %9, 34359738360
  %11 = add nuw nsw i64 %10, 8
  %12 = ashr exact i64 %sext, 32
  %scevgep113 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv115, i64 %12
  %scevgep113114 = bitcast double* %scevgep113 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep113114, i8 0, i64 %11, i32 8, i1 false)
  br label %for.inc44

for.inc44:                                        ; preds = %for.cond29.preheader, %for.inc37.for.inc44_crit_edge
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv115, i64 %indvars.iv115
  store double 1.000000e+00, double* %arrayidx43, align 8
  %exitcond140 = icmp eq i64 %indvars.iv.next116, 2000
  br i1 %exitcond140, label %for.end46.for.cond51.preheader.us_crit_edge, label %for.inc25.lr.ph

for.end46.for.cond51.preheader.us_crit_edge:      ; preds = %for.inc44
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us, %for.end46.for.cond51.preheader.us_crit_edge
  %indvars.iv97 = phi i64 [ 0, %for.end46.for.cond51.preheader.us_crit_edge ], [ %indvars.iv.next98.7, %for.inc62.us ]
  %13 = mul nuw nsw i64 %indvars.iv97, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98 = or i64 %indvars.iv97, 1
  %14 = mul nuw nsw i64 %indvars.iv.next98, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.1 = or i64 %indvars.iv97, 2
  %15 = mul nuw nsw i64 %indvars.iv.next98.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.2 = or i64 %indvars.iv97, 3
  %16 = mul nuw nsw i64 %indvars.iv.next98.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.3 = or i64 %indvars.iv97, 4
  %17 = mul nuw nsw i64 %indvars.iv.next98.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.4 = or i64 %indvars.iv97, 5
  %18 = mul nuw nsw i64 %indvars.iv.next98.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.5 = or i64 %indvars.iv97, 6
  %19 = mul nuw nsw i64 %indvars.iv.next98.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.6 = or i64 %indvars.iv97, 7
  %20 = mul nuw nsw i64 %indvars.iv.next98.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.7 = add nsw i64 %indvars.iv97, 8
  %exitcond139.7 = icmp eq i64 %indvars.iv.next98.7, 2000
  br i1 %exitcond139.7, label %for.cond73.preheader.lr.ph.preheader, label %for.inc62.us

for.cond73.preheader.lr.ph.preheader:             ; preds = %for.inc62.us
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond73.preheader.lr.ph

for.cond73.preheader.lr.ph:                       ; preds = %for.cond73.preheader.lr.ph.preheader, %for.inc96
  %indvars.iv91 = phi i64 [ %indvars.iv.next92, %for.inc96 ], [ 0, %for.cond73.preheader.lr.ph.preheader ]
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.inc93.us, %for.cond73.preheader.lr.ph
  %indvars.iv89 = phi i64 [ 0, %for.cond73.preheader.lr.ph ], [ %indvars.iv.next90, %for.inc93.us ]
  %arrayidx80.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv91
  br label %for.inc90.us

for.inc90.us:                                     ; preds = %for.inc90.us.for.inc90.us_crit_edge, %for.cond73.preheader.us
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %for.inc90.us.for.inc90.us_crit_edge ], [ 0, %for.cond73.preheader.us ]
  %22 = load double, double* %arrayidx80.us, align 8
  %arrayidx84.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv91
  %23 = load double, double* %arrayidx84.us, align 8
  %mul.us = fmul double %22, %23
  %arrayidx88.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv89, i64 %indvars.iv85
  %24 = load double, double* %arrayidx88.us, align 8
  %add89.us = fadd double %24, %mul.us
  store double %add89.us, double* %arrayidx88.us, align 8
  %exitcond136 = icmp eq i64 %indvars.iv85, 1999
  br i1 %exitcond136, label %for.inc93.us, label %for.inc90.us.for.inc90.us_crit_edge

for.inc90.us.for.inc90.us_crit_edge:              ; preds = %for.inc90.us
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  br label %for.inc90.us

for.inc93.us:                                     ; preds = %for.inc90.us
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond137 = icmp eq i64 %indvars.iv.next90, 2000
  br i1 %exitcond137, label %for.inc96, label %for.cond73.preheader.us

for.cond103.preheader.us:                         ; preds = %for.inc118.us.1, %for.cond103.preheader.us.preheader
  %indvars.iv83 = phi i64 [ 0, %for.cond103.preheader.us.preheader ], [ %indvars.iv.next84.1, %for.inc118.us.1 ]
  br label %for.inc115.us

for.inc115.us:                                    ; preds = %for.inc115.us.for.inc115.us_crit_edge, %for.cond103.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc115.us.for.inc115.us_crit_edge ], [ 0, %for.cond103.preheader.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv83, i64 %indvars.iv
  %25 = bitcast double* %arrayidx110.us to i64*
  %26 = load i64, i64* %25, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv83, i64 %indvars.iv
  %27 = bitcast double* %arrayidx114.us to i64*
  store i64 %26, i64* %27, align 8
  %exitcond135 = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond135, label %for.inc118.us, label %for.inc115.us.for.inc115.us_crit_edge

for.inc115.us.for.inc115.us_crit_edge:            ; preds = %for.inc115.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc115.us

for.inc118.us:                                    ; preds = %for.inc115.us
  %indvars.iv.next84 = or i64 %indvars.iv83, 1
  br label %for.inc115.us.1

for.inc96:                                        ; preds = %for.inc93.us
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond138 = icmp eq i64 %indvars.iv.next92, 2000
  br i1 %exitcond138, label %for.cond103.preheader.us.preheader, label %for.cond73.preheader.lr.ph

for.cond103.preheader.us.preheader:               ; preds = %for.inc96
  %28 = bitcast i8* %call to [2000 x [2000 x double]]*
  %29 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond103.preheader.us

for.end120:                                       ; preds = %for.inc118.us.1
  tail call void @free(i8* %call) #4
  ret void

for.inc115.us.1:                                  ; preds = %for.inc115.us.for.inc115.us_crit_edge.1, %for.inc118.us
  %indvars.iv.1 = phi i64 [ %indvars.iv.next.1, %for.inc115.us.for.inc115.us_crit_edge.1 ], [ 0, %for.inc118.us ]
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i64 0, i64 %indvars.iv.next84, i64 %indvars.iv.1
  %30 = bitcast double* %arrayidx110.us.1 to i64*
  %31 = load i64, i64* %30, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next84, i64 %indvars.iv.1
  %32 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %31, i64* %32, align 8
  %exitcond135.1 = icmp eq i64 %indvars.iv.1, 1999
  br i1 %exitcond135.1, label %for.inc118.us.1, label %for.inc115.us.for.inc115.us_crit_edge.1

for.inc115.us.for.inc115.us_crit_edge.1:          ; preds = %for.inc115.us.1
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.1, 1
  br label %for.inc115.us.1

for.inc118.us.1:                                  ; preds = %for.inc115.us.1
  %indvars.iv.next84.1 = add nsw i64 %indvars.iv83, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next84.1, 2000
  br i1 %exitcond.1, label %for.end120, label %for.cond103.preheader.us
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry.for.cond1.preheader_crit_edge:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58.for.cond1.preheader_crit_edge, %entry.for.cond1.preheader_crit_edge
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %for.inc58.for.cond1.preheader_crit_edge ], [ 4294967295, %entry.for.cond1.preheader_crit_edge ]
  %indvars.iv136 = phi i64 [ %indvars.iv.next137, %for.inc58.for.cond1.preheader_crit_edge ], [ 0, %entry.for.cond1.preheader_crit_edge ]
  %0 = and i64 %indvars.iv149, 4294967295
  %cmp290 = icmp sgt i64 %indvars.iv136, 0
  br i1 %cmp290, label %for.body3.preheader, label %for.body30.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12160 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 0
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 1
  br label %for.body3

for.body30.lr.ph:                                 ; preds = %for.inc25
  %cmp3692 = icmp sgt i64 %indvars.iv136, 0
  br i1 %cmp3692, label %for.body30.us.preheader, label %for.body30.preheader

for.body30.preheader:                             ; preds = %for.cond1.preheader, %for.body30.lr.ph
  br label %for.body30

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.inc55.us
  %indvars.iv134 = phi i64 [ %indvars.iv.next135, %for.inc55.us ], [ %indvars.iv136, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv134
  %1 = load double, double* %arrayidx34.us, align 8
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.for.inc48.us_crit_edge, %for.body30.us
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %for.inc48.us.for.inc48.us_crit_edge ], [ 0, %for.body30.us ]
  %2 = phi double [ %sub47.us, %for.inc48.us.for.inc48.us_crit_edge ], [ %1, %for.body30.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv126
  %3 = load double, double* %arrayidx41.us, align 8
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv126, i64 %indvars.iv134
  %4 = load double, double* %arrayidx45.us, align 8
  %mul46.us = fmul double %3, %4
  %sub47.us = fsub double %2, %mul46.us
  %exitcond151 = icmp eq i64 %indvars.iv126, %0
  br i1 %exitcond151, label %for.inc55.us, label %for.inc48.us.for.inc48.us_crit_edge

for.inc48.us.for.inc48.us_crit_edge:              ; preds = %for.inc48.us
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  br label %for.inc48.us

for.inc55.us:                                     ; preds = %for.inc48.us
  %arrayidx54.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv134
  store double %sub47.us, double* %arrayidx54.us, align 8
  %indvars.iv.next135 = add nuw i64 %indvars.iv134, 1
  %cmp29.us = icmp slt i64 %indvars.iv.next135, 2000
  br i1 %cmp29.us, label %for.body30.us, label %for.inc58.loopexit

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25.for.body3_crit_edge
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %for.inc25.for.body3_crit_edge ], [ 4294967295, %for.body3.preheader ]
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %for.inc25.for.body3_crit_edge ], [ 0, %for.body3.preheader ]
  %5 = and i64 %indvars.iv145, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv117
  %6 = bitcast double* %arrayidx5 to i64*
  %7 = load i64, i64* %6, align 8
  %cmp786 = icmp sgt i64 %indvars.iv117, 0
  br i1 %cmp786, label %for.inc.preheader, label %for.body3.for.inc25_crit_edge

for.inc.preheader:                                ; preds = %for.body3
  %8 = load double, double* %arrayidx12160, align 8
  %arrayidx16161 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv117
  %9 = load double, double* %arrayidx16161, align 8
  %mul162 = fmul double %8, %9
  %10 = bitcast i64 %7 to double
  %sub163 = fsub double %10, %mul162
  %exitcond147164 = icmp eq i64 %5, 0
  br i1 %exitcond147164, label %for.inc25, label %for.inc.for.inc_crit_edge.preheader

for.inc.for.inc_crit_edge.preheader:              ; preds = %for.inc.preheader
  %xtraiter2 = and i64 %indvars.iv145, 1
  %lcmp.mod3 = icmp eq i64 %xtraiter2, 0
  br i1 %lcmp.mod3, label %for.inc.for.inc_crit_edge.prol.loopexit, label %for.inc.for.inc_crit_edge.prol

for.inc.for.inc_crit_edge.prol:                   ; preds = %for.inc.for.inc_crit_edge.preheader
  %11 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 1, i64 %indvars.iv117
  %12 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %11, %12
  %sub.prol = fsub double %sub163, %mul.prol
  br label %for.inc.for.inc_crit_edge.prol.loopexit

for.inc.for.inc_crit_edge.prol.loopexit:          ; preds = %for.inc.for.inc_crit_edge.prol, %for.inc.for.inc_crit_edge.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.for.inc_crit_edge.prol ], [ undef, %for.inc.for.inc_crit_edge.preheader ]
  %sub166.unr.ph = phi double [ %sub.prol, %for.inc.for.inc_crit_edge.prol ], [ %sub163, %for.inc.for.inc_crit_edge.preheader ]
  %indvars.iv111165.unr.ph = phi i64 [ 1, %for.inc.for.inc_crit_edge.prol ], [ 0, %for.inc.for.inc_crit_edge.preheader ]
  %13 = icmp eq i64 %5, 1
  br i1 %13, label %for.inc25, label %for.inc.for.inc_crit_edge.preheader.new

for.inc.for.inc_crit_edge.preheader.new:          ; preds = %for.inc.for.inc_crit_edge.prol.loopexit
  br label %for.inc.for.inc_crit_edge

for.body3.for.inc25_crit_edge:                    ; preds = %for.body3
  %14 = bitcast i64 %7 to double
  br label %for.inc25

for.inc.for.inc_crit_edge:                        ; preds = %for.inc.for.inc_crit_edge, %for.inc.for.inc_crit_edge.preheader.new
  %sub166 = phi double [ %sub166.unr.ph, %for.inc.for.inc_crit_edge.preheader.new ], [ %sub.1, %for.inc.for.inc_crit_edge ]
  %indvars.iv111165 = phi i64 [ %indvars.iv111165.unr.ph, %for.inc.for.inc_crit_edge.preheader.new ], [ %indvars.iv.next112.1, %for.inc.for.inc_crit_edge ]
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111165, 1
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv.next112
  %15 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next112, i64 %indvars.iv117
  %16 = load double, double* %arrayidx16, align 8
  %indvars.iv.next112.1 = add nsw i64 %indvars.iv111165, 2
  %17 = load <2 x double>, <2 x double>* %15, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next112.1, i64 %indvars.iv117
  %18 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %16, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %18, i32 1
  %mul = fmul <2 x double> %17, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %sub166, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %exitcond147.1 = icmp eq i64 %indvars.iv.next112.1, %5
  br i1 %exitcond147.1, label %for.inc25.loopexit, label %for.inc.for.inc_crit_edge

for.inc25.loopexit:                               ; preds = %for.inc.for.inc_crit_edge
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.for.inc_crit_edge.prol.loopexit, %for.inc.preheader, %for.body3.for.inc25_crit_edge
  %.lcssa70 = phi double [ %14, %for.body3.for.inc25_crit_edge ], [ %sub163, %for.inc.preheader ], [ %sub.lcssa.unr.ph, %for.inc.for.inc_crit_edge.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv117, i64 %indvars.iv117
  %19 = load double, double* %arrayidx20, align 8
  %div = fdiv double %.lcssa70, %19
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv117
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next118 = add nuw i64 %indvars.iv117, 1
  %cmp2 = icmp slt i64 %indvars.iv.next118, %indvars.iv136
  br i1 %cmp2, label %for.inc25.for.body3_crit_edge, label %for.body30.lr.ph

for.inc25.for.body3_crit_edge:                    ; preds = %for.inc25
  %indvars.iv.next146 = add nuw nsw i64 %5, 1
  br label %for.body3

for.body30:                                       ; preds = %for.body30.preheader, %for.body30.for.body30_crit_edge
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %for.body30.for.body30_crit_edge ], [ %indvars.iv136, %for.body30.preheader ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv121
  %20 = bitcast double* %arrayidx34 to i64*
  %21 = load i64, i64* %20, align 8
  %arrayidx54 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv121
  %22 = bitcast double* %arrayidx54 to i64*
  store i64 %21, i64* %22, align 8
  %exitcond148 = icmp eq i64 %indvars.iv121, 1999
  br i1 %exitcond148, label %for.inc58.loopexit4, label %for.body30.for.body30_crit_edge

for.body30.for.body30_crit_edge:                  ; preds = %for.body30
  %indvars.iv.next122 = add nuw i64 %indvars.iv121, 1
  br label %for.body30

for.inc58.loopexit:                               ; preds = %for.inc55.us
  br label %for.inc58

for.inc58.loopexit4:                              ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit4, %for.inc58.loopexit
  %indvars.iv.next137 = add nuw i64 %indvars.iv136, 1
  %cmp = icmp slt i64 %indvars.iv.next137, 2000
  br i1 %cmp, label %for.inc58.for.cond1.preheader_crit_edge, label %for.body63.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.inc58.for.cond1.preheader_crit_edge:          ; preds = %for.inc58
  %indvars.iv.next150 = add nuw nsw i64 %0, 1
  br label %for.cond1.preheader

for.body63:                                       ; preds = %for.body63.preheader, %for.inc82.for.body63_crit_edge
  %indvars.iv142 = phi i64 [ %indvars.iv.next143, %for.inc82.for.body63_crit_edge ], [ 4294967295, %for.body63.preheader ]
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %for.inc82.for.body63_crit_edge ], [ 0, %for.body63.preheader ]
  %23 = and i64 %indvars.iv142, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv109
  %24 = load double, double* %arrayidx65, align 8
  %cmp6780 = icmp sgt i64 %indvars.iv109, 0
  br i1 %cmp6780, label %for.inc77.preheader, label %for.inc82

for.inc77.preheader:                              ; preds = %for.body63
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77.preheader, %for.inc77.for.inc77_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc77.for.inc77_crit_edge ], [ 0, %for.inc77.preheader ]
  %25 = phi double [ %sub76, %for.inc77.for.inc77_crit_edge ], [ %24, %for.inc77.preheader ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv109, i64 %indvars.iv
  %26 = load double, double* %arrayidx72, align 8
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %27 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %26, %27
  %sub76 = fsub double %25, %mul75
  %exitcond144 = icmp eq i64 %indvars.iv, %23
  br i1 %exitcond144, label %for.inc82.loopexit, label %for.inc77.for.inc77_crit_edge

for.inc77.for.inc77_crit_edge:                    ; preds = %for.inc77
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.body63
  %.lcssa69 = phi double [ %24, %for.body63 ], [ %sub76, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv109
  store double %.lcssa69, double* %arrayidx81, align 8
  %indvars.iv.next110 = add nuw i64 %indvars.iv109, 1
  %cmp62 = icmp slt i64 %indvars.iv.next110, 2000
  br i1 %cmp62, label %for.inc82.for.body63_crit_edge, label %for.body88.preheader

for.body88.preheader:                             ; preds = %for.inc82
  %sunkaddr = ptrtoint double* %x to i64
  br label %for.body88

for.inc82.for.body63_crit_edge:                   ; preds = %for.inc82
  %indvars.iv.next143 = add nuw nsw i64 %23, 1
  br label %for.body63

for.body88:                                       ; preds = %for.body88.preheader, %for.inc112
  %indvar = phi i64 [ 0, %for.body88.preheader ], [ %indvar.next, %for.inc112 ]
  %indvars.iv103 = phi i64 [ 2000, %for.body88.preheader ], [ %indvars.iv.next104, %for.inc112 ]
  %28 = add i64 %indvar, 3
  %29 = add i64 %indvar, -2
  %indvars.iv.next104 = add nsw i64 %indvars.iv103, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next104
  %30 = bitcast double* %arrayidx90 to i64*
  %31 = load i64, i64* %30, align 8
  %cmp9273 = icmp slt i64 %indvars.iv103, 2000
  br i1 %cmp9273, label %for.inc102.preheader, label %for.body88.for.inc112_crit_edge

for.inc102.preheader:                             ; preds = %for.body88
  %arrayidx97153 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next104, i64 %indvars.iv103
  %32 = load double, double* %arrayidx97153, align 8
  %arrayidx99154 = getelementptr inbounds double, double* %x, i64 %indvars.iv103
  %33 = load double, double* %arrayidx99154, align 8
  %mul100155 = fmul double %32, %33
  %34 = bitcast i64 %31 to double
  %sub101156 = fsub double %34, %mul100155
  %exitcond157 = icmp eq i64 %indvars.iv103, 1999
  br i1 %exitcond157, label %for.inc112, label %for.inc102.for.inc102_crit_edge.preheader

for.inc102.for.inc102_crit_edge.preheader:        ; preds = %for.inc102.preheader
  %xtraiter = and i64 %28, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.for.inc102_crit_edge.prol.loopexit, label %for.inc102.for.inc102_crit_edge.prol.preheader

for.inc102.for.inc102_crit_edge.prol.preheader:   ; preds = %for.inc102.for.inc102_crit_edge.preheader
  br label %for.inc102.for.inc102_crit_edge.prol

for.inc102.for.inc102_crit_edge.prol:             ; preds = %for.inc102.for.inc102_crit_edge.prol, %for.inc102.for.inc102_crit_edge.prol.preheader
  %sub101159.prol = phi double [ %sub101.prol, %for.inc102.for.inc102_crit_edge.prol ], [ %sub101156, %for.inc102.for.inc102_crit_edge.prol.preheader ]
  %indvars.iv101158.prol = phi i64 [ %indvars.iv.next102.prol, %for.inc102.for.inc102_crit_edge.prol ], [ %indvars.iv103, %for.inc102.for.inc102_crit_edge.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc102.for.inc102_crit_edge.prol ], [ %xtraiter, %for.inc102.for.inc102_crit_edge.prol.preheader ]
  %indvars.iv.next102.prol = add i64 %indvars.iv101158.prol, 1
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next104, i64 %indvars.iv.next102.prol
  %35 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv.next102.prol
  %36 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %35, %36
  %sub101.prol = fsub double %sub101159.prol, %mul100.prol
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.for.inc102_crit_edge.prol.loopexit.loopexit, label %for.inc102.for.inc102_crit_edge.prol, !llvm.loop !1

for.inc102.for.inc102_crit_edge.prol.loopexit.loopexit: ; preds = %for.inc102.for.inc102_crit_edge.prol
  br label %for.inc102.for.inc102_crit_edge.prol.loopexit

for.inc102.for.inc102_crit_edge.prol.loopexit:    ; preds = %for.inc102.for.inc102_crit_edge.prol.loopexit.loopexit, %for.inc102.for.inc102_crit_edge.preheader
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.for.inc102_crit_edge.preheader ], [ %sub101.prol, %for.inc102.for.inc102_crit_edge.prol.loopexit.loopexit ]
  %sub101159.unr = phi double [ %sub101156, %for.inc102.for.inc102_crit_edge.preheader ], [ %sub101.prol, %for.inc102.for.inc102_crit_edge.prol.loopexit.loopexit ]
  %indvars.iv101158.unr = phi i64 [ %indvars.iv103, %for.inc102.for.inc102_crit_edge.preheader ], [ %indvars.iv.next102.prol, %for.inc102.for.inc102_crit_edge.prol.loopexit.loopexit ]
  %37 = icmp ult i64 %29, 3
  br i1 %37, label %for.inc112, label %for.inc102.for.inc102_crit_edge.preheader.new

for.inc102.for.inc102_crit_edge.preheader.new:    ; preds = %for.inc102.for.inc102_crit_edge.prol.loopexit
  br label %for.inc102.for.inc102_crit_edge

for.body88.for.inc112_crit_edge:                  ; preds = %for.body88
  %38 = bitcast i64 %31 to double
  br label %for.inc112

for.inc102.for.inc102_crit_edge:                  ; preds = %for.inc102.for.inc102_crit_edge, %for.inc102.for.inc102_crit_edge.preheader.new
  %sub101159 = phi double [ %sub101159.unr, %for.inc102.for.inc102_crit_edge.preheader.new ], [ %sub101.3, %for.inc102.for.inc102_crit_edge ]
  %indvars.iv101158 = phi i64 [ %indvars.iv101158.unr, %for.inc102.for.inc102_crit_edge.preheader.new ], [ %indvars.iv.next102.3, %for.inc102.for.inc102_crit_edge ]
  %indvars.iv.next102 = add i64 %indvars.iv101158, 1
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next104, i64 %indvars.iv.next102
  %39 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next102
  %40 = bitcast double* %arrayidx99 to <2 x double>*
  %41 = load <2 x double>, <2 x double>* %39, align 8
  %42 = load <2 x double>, <2 x double>* %40, align 8
  %mul100 = fmul <2 x double> %41, %42
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %sub101159, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next102.2 = add i64 %indvars.iv101158, 3
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next104, i64 %indvars.iv.next102.2
  %43 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next102.2
  %44 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next102.3 = add i64 %indvars.iv101158, 4
  %45 = load <2 x double>, <2 x double>* %43, align 8
  %46 = load <2 x double>, <2 x double>* %44, align 8
  %mul100.2 = fmul <2 x double> %45, %46
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %exitcond.3 = icmp eq i64 %indvars.iv.next102.3, 1999
  br i1 %exitcond.3, label %for.inc112.loopexit, label %for.inc102.for.inc102_crit_edge

for.inc112.loopexit:                              ; preds = %for.inc102.for.inc102_crit_edge
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.inc102.for.inc102_crit_edge.prol.loopexit, %for.inc102.preheader, %for.body88.for.inc112_crit_edge
  %.lcssa = phi double [ %38, %for.body88.for.inc112_crit_edge ], [ %sub101156, %for.inc102.preheader ], [ %sub101.lcssa.unr, %for.inc102.for.inc102_crit_edge.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next104, i64 %indvars.iv.next104
  %47 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %.lcssa, %47
  %sunkaddr168 = shl i64 %indvars.iv103, 3
  %sunkaddr169 = add i64 %sunkaddr, %sunkaddr168
  %sunkaddr170 = add i64 %sunkaddr169, -8
  %sunkaddr171 = inttoptr i64 %sunkaddr170 to double*
  store double %div109, double* %sunkaddr171, align 8
  %cmp87 = icmp sgt i64 %indvars.iv103, 1
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp87, label %for.body88, label %for.end113

for.end113:                                       ; preds = %for.inc112
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %x) unnamed_addr #0 {
entry.for.body_crit_edge:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %for.inc, %entry.for.body_crit_edge
  %indvars.iv = phi i64 [ 0, %entry.for.body_crit_edge ], [ %indvars.iv.next, %for.inc ]
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
