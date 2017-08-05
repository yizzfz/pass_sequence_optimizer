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
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  call fastcc void @init_array([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_ludcmp([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call2 to double*
  call fastcc void @print_array(double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv145 = phi i64 [ 0, %entry ], [ %indvars.iv.next146.1, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv145
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv145
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next146 = or i64 %indvars.iv145, 1
  %2 = trunc i64 %indvars.iv.next146 to i32
  %conv4 = sitofp i32 %2 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv145
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next146.1 = add nsw i64 %indvars.iv145, 2
  %3 = trunc i64 %indvars.iv.next146.1 to i32
  %conv4.1 = sitofp i32 %3 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %4 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %4, align 8
  %exitcond167.1 = icmp eq i64 %indvars.iv.next146, 1999
  br i1 %exitcond167.1, label %for.body16.lr.ph.preheader, label %for.body

for.body16.lr.ph.preheader:                       ; preds = %for.body
  br label %for.body16.lr.ph

for.body16.lr.ph:                                 ; preds = %for.body16.lr.ph.preheader, %for.end39.for.body12_crit_edge
  %indvars.iv143 = phi i64 [ %5, %for.end39.for.body12_crit_edge ], [ 0, %for.body16.lr.ph.preheader ]
  %5 = add nuw nsw i64 %indvars.iv143, 1
  %sext = shl i64 %5, 32
  %6 = sub i64 1998, %indvars.iv143
  br label %for.body16

for.body16:                                       ; preds = %for.body16.for.body16_crit_edge, %for.body16.lr.ph
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %for.body16.for.body16_crit_edge ], [ 0, %for.body16.lr.ph ]
  %7 = sub nsw i64 0, %indvars.iv127
  %8 = trunc i64 %7 to i32
  %rem = srem i32 %8, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv143, i64 %indvars.iv127
  store double %add20, double* %arrayidx24, align 8
  %exitcond133 = icmp eq i64 %indvars.iv127, %indvars.iv143
  br i1 %exitcond133, label %for.end27, label %for.body16.for.body16_crit_edge

for.body16.for.body16_crit_edge:                  ; preds = %for.body16
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  br label %for.body16

for.end27:                                        ; preds = %for.body16
  %cmp3080 = icmp slt i64 %5, 2000
  br i1 %cmp3080, label %for.end39.for.body12_crit_edge, label %for.end46

for.end39.for.body12_crit_edge:                   ; preds = %for.end27
  %9 = shl i64 %6, 3
  %10 = and i64 %9, 34359738360
  %11 = ashr exact i64 %sext, 32
  %scevgep141 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv143, i64 %11
  %12 = add nuw nsw i64 %10, 8
  %scevgep141142 = bitcast double* %scevgep141 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep141142, i8 0, i64 %12, i32 8, i1 false)
  %arrayidx43151 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv143, i64 %indvars.iv143
  store double 1.000000e+00, double* %arrayidx43151, align 8
  br label %for.body16.lr.ph

for.end46:                                        ; preds = %for.end27
  %arrayidx43153 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv143, i64 %indvars.iv143
  store double 1.000000e+00, double* %arrayidx43153, align 8
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.body50.us

for.body50.us:                                    ; preds = %for.body50.us, %for.end46
  %indvars.iv125 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next126.7, %for.body50.us ]
  %13 = mul nuw nsw i64 %indvars.iv125, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126 = or i64 %indvars.iv125, 1
  %14 = mul nuw nsw i64 %indvars.iv.next126, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126.1 = or i64 %indvars.iv125, 2
  %15 = mul nuw nsw i64 %indvars.iv.next126.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126.2 = or i64 %indvars.iv125, 3
  %16 = mul nuw nsw i64 %indvars.iv.next126.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126.3 = or i64 %indvars.iv125, 4
  %17 = mul nuw nsw i64 %indvars.iv.next126.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126.4 = or i64 %indvars.iv125, 5
  %18 = mul nuw nsw i64 %indvars.iv.next126.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126.5 = or i64 %indvars.iv125, 6
  %19 = mul nuw nsw i64 %indvars.iv.next126.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126.6 = or i64 %indvars.iv125, 7
  %20 = mul nuw nsw i64 %indvars.iv.next126.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126.7 = add nsw i64 %indvars.iv125, 8
  %exitcond166.7 = icmp eq i64 %indvars.iv.next126.7, 2000
  br i1 %exitcond166.7, label %for.body68.us.for.body72.us.us_crit_edge.preheader, label %for.body50.us

for.body68.us.for.body72.us.us_crit_edge.preheader: ; preds = %for.body50.us
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.body68.us.for.body72.us.us_crit_edge

for.body68.us.for.body72.us.us_crit_edge:         ; preds = %for.body68.us.for.body72.us.us_crit_edge.preheader, %for.inc96.us
  %indvars.iv119 = phi i64 [ %indvars.iv.next120, %for.inc96.us ], [ 0, %for.body68.us.for.body72.us.us_crit_edge.preheader ]
  br label %for.body72.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %exitcond165 = icmp eq i64 %indvars.iv.next120, 2000
  br i1 %exitcond165, label %for.body102.us.preheader, label %for.body68.us.for.body72.us.us_crit_edge

for.body102.us.preheader:                         ; preds = %for.inc96.us
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  %23 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.body102.us

for.body72.us.us:                                 ; preds = %for.inc93.us.us, %for.body68.us.for.body72.us.us_crit_edge
  %indvars.iv117 = phi i64 [ 0, %for.body68.us.for.body72.us.us_crit_edge ], [ %indvars.iv.next118, %for.inc93.us.us ]
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv117, i64 %indvars.iv119
  br label %for.body76.us.us

for.inc93.us.us:                                  ; preds = %for.body76.us.us
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond164 = icmp eq i64 %indvars.iv.next118, 2000
  br i1 %exitcond164, label %for.inc96.us, label %for.body72.us.us

for.body76.us.us:                                 ; preds = %for.body76.us.us.for.body76.us.us_crit_edge, %for.body72.us.us
  %indvars.iv113 = phi i64 [ %indvars.iv.next114, %for.body76.us.us.for.body76.us.us_crit_edge ], [ 0, %for.body72.us.us ]
  %24 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv119
  %25 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %24, %25
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv117, i64 %indvars.iv113
  %26 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %26, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %exitcond163 = icmp eq i64 %indvars.iv113, 1999
  br i1 %exitcond163, label %for.inc93.us.us, label %for.body76.us.us.for.body76.us.us_crit_edge

for.body76.us.us.for.body76.us.us_crit_edge:      ; preds = %for.body76.us.us
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  br label %for.body76.us.us

for.body102.us:                                   ; preds = %for.inc118.us.1, %for.body102.us.preheader
  %indvars.iv111 = phi i64 [ 0, %for.body102.us.preheader ], [ %indvars.iv.next112.1, %for.inc118.us.1 ]
  br label %for.body106.us

for.body106.us:                                   ; preds = %for.body106.us.for.body106.us_crit_edge, %for.body102.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body106.us.for.body106.us_crit_edge ], [ 0, %for.body102.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv111, i64 %indvars.iv
  %27 = bitcast double* %arrayidx110.us to i64*
  %28 = load i64, i64* %27, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv111, i64 %indvars.iv
  %29 = bitcast double* %arrayidx114.us to i64*
  store i64 %28, i64* %29, align 8
  %exitcond162 = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond162, label %for.inc118.us, label %for.body106.us.for.body106.us_crit_edge

for.body106.us.for.body106.us_crit_edge:          ; preds = %for.body106.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body106.us

for.inc118.us:                                    ; preds = %for.body106.us
  %indvars.iv.next112 = or i64 %indvars.iv111, 1
  br label %for.body106.us.1

for.end120:                                       ; preds = %for.inc118.us.1
  call void @free(i8* %call) #4
  ret void

for.body106.us.1:                                 ; preds = %for.body106.us.for.body106.us_crit_edge.1, %for.inc118.us
  %indvars.iv.1 = phi i64 [ %indvars.iv.next.1, %for.body106.us.for.body106.us_crit_edge.1 ], [ 0, %for.inc118.us ]
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv.next112, i64 %indvars.iv.1
  %30 = bitcast double* %arrayidx110.us.1 to i64*
  %31 = load i64, i64* %30, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next112, i64 %indvars.iv.1
  %32 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %31, i64* %32, align 8
  %exitcond162.1 = icmp eq i64 %indvars.iv.1, 1999
  br i1 %exitcond162.1, label %for.inc118.us.1, label %for.body106.us.for.body106.us_crit_edge.1

for.body106.us.for.body106.us_crit_edge.1:        ; preds = %for.body106.us.1
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.1, 1
  br label %for.body106.us.1

for.inc118.us.1:                                  ; preds = %for.body106.us.1
  %indvars.iv.next112.1 = add nsw i64 %indvars.iv111, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next112.1, 2000
  br i1 %exitcond.1, label %for.end120, label %for.body102.us
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.inc58.for.body_crit_edge, %entry
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc58.for.body_crit_edge ], [ 0, %entry ]
  %indvars.iv150 = phi i64 [ %indvars.iv.next151, %for.inc58.for.body_crit_edge ], [ 4294967295, %entry ]
  %0 = and i64 %indvars.iv150, 4294967295
  %cmp294 = icmp sgt i64 %indvars.iv2, 0
  br i1 %cmp294, label %for.body3.preheader, label %for.body30.preheader

for.body3.preheader:                              ; preds = %for.body
  br label %for.body3

for.body30.preheader:                             ; preds = %for.body30.lr.ph, %for.body
  br label %for.body30

for.body3:                                        ; preds = %for.body3.preheader, %for.end.for.body3_crit_edge
  %indvars.iv146 = phi i64 [ %indvars.iv.next147, %for.end.for.body3_crit_edge ], [ 4294967295, %for.body3.preheader ]
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %for.end.for.body3_crit_edge ], [ 0, %for.body3.preheader ]
  %1 = and i64 %indvars.iv146, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv121
  %2 = load double, double* %arrayidx5, align 8
  %cmp790 = icmp sgt i64 %indvars.iv121, 0
  br i1 %cmp790, label %for.body8.preheader, label %for.end

for.body8.preheader:                              ; preds = %for.body3
  br label %for.body8

for.body8:                                        ; preds = %for.body8.preheader, %for.body8.for.body8_crit_edge
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %for.body8.for.body8_crit_edge ], [ 0, %for.body8.preheader ]
  %w.092 = phi double [ %sub, %for.body8.for.body8_crit_edge ], [ %2, %for.body8.preheader ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv115
  %3 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv115, i64 %indvars.iv121
  %4 = load double, double* %arrayidx16, align 8
  %mul = fmul double %3, %4
  %sub = fsub double %w.092, %mul
  %exitcond148 = icmp eq i64 %indvars.iv115, %1
  br i1 %exitcond148, label %for.end.loopexit, label %for.body8.for.body8_crit_edge

for.body8.for.body8_crit_edge:                    ; preds = %for.body8
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  br label %for.body8

for.end.loopexit:                                 ; preds = %for.body8
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3
  %w.0.lcssa = phi double [ %2, %for.body3 ], [ %sub, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %indvars.iv121
  %5 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %5
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next122, %indvars.iv2
  br i1 %exitcond4, label %for.body30.lr.ph, label %for.end.for.body3_crit_edge

for.end.for.body3_crit_edge:                      ; preds = %for.end
  %indvars.iv.next147 = add nuw nsw i64 %1, 1
  br label %for.body3

for.body30.lr.ph:                                 ; preds = %for.end
  %6 = icmp sgt i64 %indvars.iv2, 0
  br i1 %6, label %for.body30.us.preheader, label %for.body30.preheader

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.end50.us
  %indvars.iv138 = phi i64 [ %indvars.iv.next139, %for.end50.us ], [ %indvars.iv2, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv138
  %7 = load double, double* %arrayidx34.us, align 8
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us.for.body37.us_crit_edge, %for.body30.us
  %indvars.iv130 = phi i64 [ %indvars.iv.next131, %for.body37.us.for.body37.us_crit_edge ], [ 0, %for.body30.us ]
  %w.198.us = phi double [ %sub47.us, %for.body37.us.for.body37.us_crit_edge ], [ %7, %for.body30.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv130
  %8 = load double, double* %arrayidx41.us, align 8
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv130, i64 %indvars.iv138
  %9 = load double, double* %arrayidx45.us, align 8
  %mul46.us = fmul double %8, %9
  %sub47.us = fsub double %w.198.us, %mul46.us
  %exitcond152 = icmp eq i64 %indvars.iv130, %0
  br i1 %exitcond152, label %for.end50.us, label %for.body37.us.for.body37.us_crit_edge

for.body37.us.for.body37.us_crit_edge:            ; preds = %for.body37.us
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  br label %for.body37.us

for.end50.us:                                     ; preds = %for.body37.us
  store double %sub47.us, double* %arrayidx34.us, align 8
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next139, 2000
  br i1 %exitcond5, label %for.inc58.loopexit, label %for.body30.us

for.body30:                                       ; preds = %for.body30.preheader, %for.body30.for.body30_crit_edge
  %indvars.iv125 = phi i64 [ %indvars.iv.next126, %for.body30.for.body30_crit_edge ], [ %indvars.iv2, %for.body30.preheader ]
  %exitcond149 = icmp eq i64 %indvars.iv125, 1999
  br i1 %exitcond149, label %for.inc58.loopexit8, label %for.body30.for.body30_crit_edge

for.body30.for.body30_crit_edge:                  ; preds = %for.body30
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  br label %for.body30

for.inc58.loopexit:                               ; preds = %for.end50.us
  br label %for.inc58

for.inc58.loopexit8:                              ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit8, %for.inc58.loopexit
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond6, label %for.body63.preheader, label %for.inc58.for.body_crit_edge

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.inc58.for.body_crit_edge:                     ; preds = %for.inc58
  %indvars.iv.next151 = add nuw nsw i64 %0, 1
  br label %for.body

for.body63:                                       ; preds = %for.body63.preheader, %for.end79.for.body63_crit_edge
  %indvars.iv143 = phi i64 [ %indvars.iv.next144, %for.end79.for.body63_crit_edge ], [ 4294967295, %for.body63.preheader ]
  %indvars.iv113 = phi i64 [ %indvars.iv.next114, %for.end79.for.body63_crit_edge ], [ 0, %for.body63.preheader ]
  %10 = and i64 %indvars.iv143, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv113
  %11 = load double, double* %arrayidx65, align 8
  %cmp6784 = icmp sgt i64 %indvars.iv113, 0
  br i1 %cmp6784, label %for.body68.preheader, label %for.end79

for.body68.preheader:                             ; preds = %for.body63
  br label %for.body68

for.body68:                                       ; preds = %for.body68.preheader, %for.body68.for.body68_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body68.for.body68_crit_edge ], [ 0, %for.body68.preheader ]
  %w.286 = phi double [ %sub76, %for.body68.for.body68_crit_edge ], [ %11, %for.body68.preheader ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv
  %12 = load double, double* %arrayidx72, align 8
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %13 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %12, %13
  %sub76 = fsub double %w.286, %mul75
  %exitcond145 = icmp eq i64 %indvars.iv, %10
  br i1 %exitcond145, label %for.end79.loopexit, label %for.body68.for.body68_crit_edge

for.body68.for.body68_crit_edge:                  ; preds = %for.body68
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body68

for.end79.loopexit:                               ; preds = %for.body68
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.body63
  %w.2.lcssa = phi double [ %11, %for.body63 ], [ %sub76, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv113
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next114, 2000
  br i1 %exitcond1, label %for.body88.preheader, label %for.end79.for.body63_crit_edge

for.body88.preheader:                             ; preds = %for.end79
  %sunkaddr = ptrtoint double* %x to i64
  br label %for.body88

for.end79.for.body63_crit_edge:                   ; preds = %for.end79
  %indvars.iv.next144 = add nuw nsw i64 %10, 1
  br label %for.body63

for.body88:                                       ; preds = %for.body88.preheader, %for.end104
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %for.end104 ], [ 2000, %for.body88.preheader ]
  %i.283.in = phi i32 [ %i.283, %for.end104 ], [ 2000, %for.body88.preheader ]
  %indvars.iv.next108 = add nsw i64 %indvars.iv107, -1
  %i.283 = add nsw i32 %i.283.in, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next108
  %14 = load double, double* %arrayidx90, align 8
  %cmp9277 = icmp slt i32 %i.283.in, 2000
  br i1 %cmp9277, label %for.body93.preheader, label %for.end104

for.body93.preheader:                             ; preds = %for.body88
  br label %for.body93

for.body93:                                       ; preds = %for.body93.preheader, %for.body93.for.body93_crit_edge
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %for.body93.for.body93_crit_edge ], [ %indvars.iv107, %for.body93.preheader ]
  %w.379 = phi double [ %sub101, %for.body93.for.body93_crit_edge ], [ %14, %for.body93.preheader ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next108, i64 %indvars.iv105
  %15 = load double, double* %arrayidx97, align 8
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv105
  %16 = load double, double* %arrayidx99, align 8
  %mul100 = fmul double %15, %16
  %sub101 = fsub double %w.379, %mul100
  %exitcond = icmp eq i64 %indvars.iv105, 1999
  br i1 %exitcond, label %for.end104.loopexit, label %for.body93.for.body93_crit_edge

for.body93.for.body93_crit_edge:                  ; preds = %for.body93
  %indvars.iv.next106 = add i64 %indvars.iv105, 1
  br label %for.body93

for.end104.loopexit:                              ; preds = %for.body93
  br label %for.end104

for.end104:                                       ; preds = %for.end104.loopexit, %for.body88
  %w.3.lcssa = phi double [ %14, %for.body88 ], [ %sub101, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next108, i64 %indvars.iv.next108
  %17 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %17
  %sunkaddr153 = shl i64 %indvars.iv107, 3
  %sunkaddr154 = add i64 %sunkaddr, %sunkaddr153
  %sunkaddr155 = add i64 %sunkaddr154, -8
  %sunkaddr156 = inttoptr i64 %sunkaddr155 to double*
  store double %div109, double* %sunkaddr156, align 8
  %cmp87 = icmp sgt i64 %indvars.iv107, 1
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
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
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
