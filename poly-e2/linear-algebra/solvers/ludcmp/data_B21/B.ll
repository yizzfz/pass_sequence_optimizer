; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call void @init_array(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_ludcmp(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
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
  tail call void @print_array(i32 2000, double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %n, [2000 x double]* %A, double* %b, double* %x, double* %y) #0 {
entry:
  br label %for.inc

for.inc:                                          ; preds = %entry, %for.inc
  %indvars.iv162 = phi i64 [ %indvars.iv.next163.1, %for.inc ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv162
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv162
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %2 = trunc i64 %indvars.iv162 to i32
  %3 = or i32 %2, 1
  %conv4 = sitofp i32 %3 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv162
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next163.1 = add nsw i64 %indvars.iv162, 2
  %4 = trunc i64 %indvars.iv.next163.1 to i32
  %conv4.1 = sitofp i32 %4 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %5 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %5, align 8
  %exitcond165.1 = icmp eq i64 %indvars.iv.next163.1, 2000
  br i1 %exitcond165.1, label %for.inc25.lr.ph.preheader, label %for.inc

for.inc25.lr.ph.preheader:                        ; preds = %for.inc
  br label %for.inc25.lr.ph

for.inc25.lr.ph:                                  ; preds = %for.inc25.lr.ph.preheader, %for.inc44
  %indvars.iv158 = phi i64 [ %indvars.iv.next159, %for.inc44 ], [ 0, %for.inc25.lr.ph.preheader ]
  %indvars.iv156 = phi i64 [ %indvars.iv.next157, %for.inc44 ], [ 1, %for.inc25.lr.ph.preheader ]
  %6 = mul nuw nsw i64 %indvars.iv158, 2001
  %7 = add nuw nsw i64 %6, 1
  %scevgep154 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %7
  %8 = sub i64 1998, %indvars.iv158
  %9 = shl i64 %8, 3
  %10 = and i64 %9, 34359738360
  %11 = add nuw nsw i64 %10, 8
  br label %for.inc25

for.cond29.preheader:                             ; preds = %for.inc25
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %cmp30105 = icmp slt i64 %indvars.iv.next159, 2000
  br i1 %cmp30105, label %for.inc37.preheader, label %for.inc44

for.inc37.preheader:                              ; preds = %for.cond29.preheader
  %12 = bitcast double* %scevgep154 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %12, i8 0, i64 %11, i32 8, i1 false)
  br label %for.inc44

for.inc25:                                        ; preds = %for.inc25, %for.inc25.lr.ph
  %indvars.iv141 = phi i64 [ 0, %for.inc25.lr.ph ], [ %indvars.iv.next142, %for.inc25 ]
  %13 = sub nsw i64 0, %indvars.iv141
  %14 = trunc i64 %13 to i32
  %rem = srem i32 %14, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv158, i64 %indvars.iv141
  store double %add20, double* %arrayidx24, align 8
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %exitcond147 = icmp eq i64 %indvars.iv.next142, %indvars.iv156
  br i1 %exitcond147, label %for.cond29.preheader, label %for.inc25

for.inc44:                                        ; preds = %for.inc37.preheader, %for.cond29.preheader
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv158, i64 %indvars.iv158
  store double 1.000000e+00, double* %arrayidx43, align 8
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  %exitcond161 = icmp eq i64 %indvars.iv.next159, 2000
  br i1 %exitcond161, label %for.end46, label %for.inc25.lr.ph

for.end46:                                        ; preds = %for.inc44
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.cond51.preheader.us

for.cond51.preheader.us:                          ; preds = %for.cond51.preheader.us, %for.end46
  %indvars.iv134 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next135.3.1, %for.cond51.preheader.us ]
  %15 = mul nuw nsw i64 %indvars.iv134, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %16 = mul nuw nsw i64 %indvars.iv134, 16000
  %17 = add nuw nsw i64 %16, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %18 = mul nuw nsw i64 %indvars.iv134, 16000
  %19 = add nuw nsw i64 %18, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %20 = mul nuw nsw i64 %indvars.iv134, 16000
  %21 = add nuw nsw i64 %20, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next135.3 = or i64 %indvars.iv134, 4
  %22 = mul nuw nsw i64 %indvars.iv.next135.3, 16000
  %scevgep.1195 = getelementptr i8, i8* %call, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1195, i8 0, i64 16000, i32 8, i1 false)
  %23 = mul nuw nsw i64 %indvars.iv.next135.3, 16000
  %24 = add nuw nsw i64 %23, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %25 = mul nuw nsw i64 %indvars.iv.next135.3, 16000
  %26 = add nuw nsw i64 %25, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %27 = mul nuw nsw i64 %indvars.iv.next135.3, 16000
  %28 = add nuw nsw i64 %27, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next135.3.1 = add nsw i64 %indvars.iv134, 8
  %exitcond137.3.1 = icmp eq i64 %indvars.iv.next135.3.1, 2000
  br i1 %exitcond137.3.1, label %for.cond73.preheader.us.us.preheader.preheader, label %for.cond51.preheader.us

for.cond73.preheader.us.us.preheader.preheader:   ; preds = %for.cond51.preheader.us
  br label %for.cond73.preheader.us.us.preheader

for.cond73.preheader.us.us.preheader:             ; preds = %for.cond73.preheader.us.us.preheader.preheader, %for.cond69.for.inc96_crit_edge.us
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %for.cond69.for.inc96_crit_edge.us ], [ 0, %for.cond73.preheader.us.us.preheader.preheader ]
  br label %for.cond73.preheader.us.us

for.cond69.for.inc96_crit_edge.us:                ; preds = %for.cond73.for.inc93_crit_edge.us.us
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond129 = icmp eq i64 %indvars.iv.next127, 2000
  br i1 %exitcond129, label %for.cond103.preheader.us.preheader, label %for.cond73.preheader.us.us.preheader

for.cond103.preheader.us.preheader:               ; preds = %for.cond69.for.inc96_crit_edge.us
  br label %for.cond103.preheader.us

for.cond73.preheader.us.us:                       ; preds = %for.cond73.for.inc93_crit_edge.us.us, %for.cond73.preheader.us.us.preheader
  %indvars.iv122 = phi i64 [ 0, %for.cond73.preheader.us.us.preheader ], [ %indvars.iv.next123, %for.cond73.for.inc93_crit_edge.us.us ]
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv122, i64 %indvars.iv126
  br label %for.inc90.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.inc90.us.us
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %exitcond125 = icmp eq i64 %indvars.iv.next123, 2000
  br i1 %exitcond125, label %for.cond69.for.inc96_crit_edge.us, label %for.cond73.preheader.us.us

for.inc90.us.us:                                  ; preds = %for.cond73.preheader.us.us, %for.inc90.us.us
  %indvars.iv116 = phi i64 [ %indvars.iv.next117.1, %for.inc90.us.us ], [ 0, %for.cond73.preheader.us.us ]
  %29 = bitcast i8* %call to [2000 x [2000 x double]]*
  %30 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv126
  %31 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %30, %31
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i64 0, i64 %indvars.iv122, i64 %indvars.iv116
  %32 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %32, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next117 = or i64 %indvars.iv116, 1
  %33 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next117, i64 %indvars.iv126
  %34 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %33, %34
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i64 0, i64 %indvars.iv122, i64 %indvars.iv.next117
  %35 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %35, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %indvars.iv.next117.1 = add nsw i64 %indvars.iv116, 2
  %exitcond119.1 = icmp eq i64 %indvars.iv.next117.1, 2000
  br i1 %exitcond119.1, label %for.cond73.for.inc93_crit_edge.us.us, label %for.inc90.us.us

for.cond103.preheader.us:                         ; preds = %for.cond103.preheader.us.preheader, %for.cond103.for.inc118_crit_edge.us
  %indvars.iv113 = phi i64 [ %indvars.iv.next114, %for.cond103.for.inc118_crit_edge.us ], [ 0, %for.cond103.preheader.us.preheader ]
  br label %for.inc115.us

for.inc115.us:                                    ; preds = %for.cond103.preheader.us, %for.inc115.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc115.us ], [ 0, %for.cond103.preheader.us ]
  %36 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv113, i64 %indvars.iv
  %37 = bitcast double* %arrayidx110.us to i64*
  %38 = load i64, i64* %37, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv
  %39 = bitcast double* %arrayidx114.us to i64*
  store i64 %38, i64* %39, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv113, i64 %indvars.iv.next
  %40 = bitcast double* %arrayidx110.us.1 to i64*
  %41 = load i64, i64* %40, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv.next
  %42 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %41, i64* %42, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv113, i64 %indvars.iv.next.1
  %43 = bitcast double* %arrayidx110.us.2 to i64*
  %44 = load i64, i64* %43, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv.next.1
  %45 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %44, i64* %45, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv113, i64 %indvars.iv.next.2
  %46 = bitcast double* %arrayidx110.us.3 to i64*
  %47 = load i64, i64* %46, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv.next.2
  %48 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %47, i64* %48, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %for.cond103.for.inc118_crit_edge.us, label %for.inc115.us

for.cond103.for.inc118_crit_edge.us:              ; preds = %for.inc115.us
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond = icmp eq i64 %indvars.iv.next114, 2000
  br i1 %exitcond, label %for.end120, label %for.cond103.preheader.us

for.end120:                                       ; preds = %for.cond103.for.inc118_crit_edge.us
  tail call void @free(i8* %call) #4
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_ludcmp(i32 %n, [2000 x double]* %A, double* %b, double* %x, double* %y) #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %entry
  %indvars.iv165 = phi i64 [ 0, %entry ], [ %indvars.iv.next166, %for.inc58 ]
  %0 = add i64 %indvars.iv165, 4294967295
  %1 = sub i64 2000, %indvars.iv165
  %2 = trunc i64 %1 to i32
  %3 = sub i64 4294969295, %indvars.iv165
  %4 = trunc i64 %3 to i32
  %cmp295 = icmp sgt i64 %indvars.iv165, 0
  br i1 %cmp295, label %for.body3.preheader, label %for.body30.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv165, i64 0
  br label %for.body3

for.body30.lr.ph:                                 ; preds = %for.inc25
  %5 = icmp sgt i64 %indvars.iv165, 0
  br i1 %5, label %for.body30.us.preheader, label %for.body30.preheader

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %xtraiter155169 = and i64 %indvars.iv165, 1
  %6 = trunc i64 %0 to i32
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv165, i64 0
  br label %for.body30.us

for.body30.preheader:                             ; preds = %for.cond1.preheader, %for.body30.lr.ph
  %xtraiter146 = and i32 %2, 3
  %lcmp.mod147 = icmp eq i32 %xtraiter146, 0
  br i1 %lcmp.mod147, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.preheader
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol.preheader, %for.body30.prol
  %indvars.iv142.prol = phi i64 [ %indvars.iv.next143.prol, %for.body30.prol ], [ %indvars.iv165, %for.body30.prol.preheader ]
  %prol.iter148 = phi i32 [ %prol.iter148.sub, %for.body30.prol ], [ %xtraiter146, %for.body30.prol.preheader ]
  %indvars.iv.next143.prol = add nuw nsw i64 %indvars.iv142.prol, 1
  %prol.iter148.sub = add i32 %prol.iter148, -1
  %prol.iter148.cmp = icmp eq i32 %prol.iter148.sub, 0
  br i1 %prol.iter148.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !1

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.preheader
  %indvars.iv142.unr = phi i64 [ %indvars.iv165, %for.body30.preheader ], [ %indvars.iv.next143.prol, %for.body30.prol.loopexit.loopexit ]
  %7 = icmp ult i32 %4, 3
  br i1 %7, label %for.inc58, label %for.body30.preheader183

for.body30.preheader183:                          ; preds = %for.body30.prol.loopexit
  %8 = sub i64 1996, %indvars.iv142.unr
  %9 = lshr i64 %8, 2
  %10 = add nuw nsw i64 %9, 1
  %xtraiter187 = and i64 %10, 7
  %lcmp.mod188 = icmp eq i64 %xtraiter187, 0
  br i1 %lcmp.mod188, label %for.body30.prol.loopexit186, label %for.body30.prol.preheader185

for.body30.prol.preheader185:                     ; preds = %for.body30.preheader183
  br label %for.body30.prol189

for.body30.prol189:                               ; preds = %for.body30.prol189, %for.body30.prol.preheader185
  %indvars.iv142.prol190 = phi i64 [ %indvars.iv.next143.3.prol, %for.body30.prol189 ], [ %indvars.iv142.unr, %for.body30.prol.preheader185 ]
  %prol.iter191 = phi i64 [ %prol.iter191.sub, %for.body30.prol189 ], [ %xtraiter187, %for.body30.prol.preheader185 ]
  %indvars.iv.next143.3.prol = add nsw i64 %indvars.iv142.prol190, 4
  %prol.iter191.sub = add i64 %prol.iter191, -1
  %prol.iter191.cmp = icmp eq i64 %prol.iter191.sub, 0
  br i1 %prol.iter191.cmp, label %for.body30.prol.loopexit186.loopexit, label %for.body30.prol189, !llvm.loop !3

for.body30.prol.loopexit186.loopexit:             ; preds = %for.body30.prol189
  br label %for.body30.prol.loopexit186

for.body30.prol.loopexit186:                      ; preds = %for.body30.prol.loopexit186.loopexit, %for.body30.preheader183
  %indvars.iv142.unr192 = phi i64 [ %indvars.iv142.unr, %for.body30.preheader183 ], [ %indvars.iv.next143.3.prol, %for.body30.prol.loopexit186.loopexit ]
  %11 = icmp ult i64 %8, 28
  br i1 %11, label %for.inc58, label %for.body30.preheader183.new

for.body30.preheader183.new:                      ; preds = %for.body30.prol.loopexit186
  br label %for.body30

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond35.for.inc55_crit_edge.us
  %indvars.iv159 = phi i64 [ %indvars.iv.next160, %for.cond35.for.inc55_crit_edge.us ], [ %indvars.iv165, %for.body30.us.preheader ]
  %12 = icmp eq i64 %xtraiter155169, 0
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv165, i64 %indvars.iv159
  %13 = load double, double* %arrayidx34.us, align 8
  br i1 %12, label %for.inc48.us.prol.loopexit.unr-lcssa, label %for.inc48.us.prol.preheader

for.inc48.us.prol.preheader:                      ; preds = %for.body30.us
  %14 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv159
  %15 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %14, %15
  %sub47.us.prol = fsub double %13, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.body30.us, %for.inc48.us.prol.preheader
  %indvars.iv149.unr.ph = phi i64 [ 1, %for.inc48.us.prol.preheader ], [ 0, %for.body30.us ]
  %w.199.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol.preheader ], [ %13, %for.body30.us ]
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol.preheader ], [ undef, %for.body30.us ]
  %16 = icmp eq i32 %6, 0
  br i1 %16, label %for.cond35.for.inc55_crit_edge.us, label %for.inc48.us.preheader

for.inc48.us.preheader:                           ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.preheader, %for.inc48.us
  %indvars.iv149 = phi i64 [ %indvars.iv.next150.1, %for.inc48.us ], [ %indvars.iv149.unr.ph, %for.inc48.us.preheader ]
  %w.199.us = phi double [ %sub47.us.1, %for.inc48.us ], [ %w.199.us.unr.ph, %for.inc48.us.preheader ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv165, i64 %indvars.iv149
  %17 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv149, i64 %indvars.iv159
  %18 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %19 = load <2 x double>, <2 x double>* %17, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next150, i64 %indvars.iv159
  %20 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %18, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %20, i32 1
  %mul46.us = fmul <2 x double> %19, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %w.199.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %indvars.iv.next150.1 = add nsw i64 %indvars.iv149, 2
  %exitcond154.1 = icmp eq i64 %indvars.iv.next150.1, %indvars.iv165
  br i1 %exitcond154.1, label %for.cond35.for.inc55_crit_edge.us.loopexit, label %for.inc48.us

for.cond35.for.inc55_crit_edge.us.loopexit:       ; preds = %for.inc48.us
  br label %for.cond35.for.inc55_crit_edge.us

for.cond35.for.inc55_crit_edge.us:                ; preds = %for.cond35.for.inc55_crit_edge.us.loopexit, %for.inc48.us.prol.loopexit.unr-lcssa
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit.unr-lcssa ], [ %sub47.us.1, %for.cond35.for.inc55_crit_edge.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1
  %exitcond162 = icmp eq i64 %indvars.iv.next160, 2000
  br i1 %exitcond162, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv134 = phi i64 [ %indvars.iv.next135, %for.inc25 ], [ 0, %for.body3.preheader ]
  %21 = add i64 %indvars.iv134, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv165, i64 %indvars.iv134
  %22 = load double, double* %arrayidx5, align 8
  %cmp791 = icmp sgt i64 %indvars.iv134, 0
  br i1 %cmp791, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.body3
  %xtraiter130170 = and i64 %indvars.iv134, 1
  %lcmp.mod131 = icmp eq i64 %xtraiter130170, 0
  br i1 %lcmp.mod131, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %23 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv134
  %24 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %23, %24
  %sub.prol = fsub double %22, %mul.prol
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %indvars.iv125.unr.ph = phi i64 [ 1, %for.inc.prol.preheader ], [ 0, %for.inc.lr.ph ]
  %w.093.unr.ph = phi double [ %sub.prol, %for.inc.prol.preheader ], [ %22, %for.inc.lr.ph ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol.preheader ], [ undef, %for.inc.lr.ph ]
  %25 = trunc i64 %21 to i32
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %for.inc25, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit.unr-lcssa
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv125 = phi i64 [ %indvars.iv.next126.1, %for.inc ], [ %indvars.iv125.unr.ph, %for.inc.preheader ]
  %w.093 = phi double [ %sub.1, %for.inc ], [ %w.093.unr.ph, %for.inc.preheader ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv165, i64 %indvars.iv125
  %27 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv125, i64 %indvars.iv134
  %28 = load double, double* %arrayidx16, align 8
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %29 = load <2 x double>, <2 x double>* %27, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next126, i64 %indvars.iv134
  %30 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %28, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %30, i32 1
  %mul = fmul <2 x double> %29, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.093, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %indvars.iv.next126.1 = add nsw i64 %indvars.iv125, 2
  %exitcond129.1 = icmp eq i64 %indvars.iv.next126.1, %indvars.iv134
  br i1 %exitcond129.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit.unr-lcssa, %for.body3
  %w.0.lcssa = phi double [ %22, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit.unr-lcssa ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv134, i64 %indvars.iv134
  %31 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %31
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %exitcond139 = icmp eq i64 %indvars.iv.next135, %indvars.iv165
  br i1 %exitcond139, label %for.body30.lr.ph, label %for.body3

for.body30:                                       ; preds = %for.body30, %for.body30.preheader183.new
  %indvars.iv142 = phi i64 [ %indvars.iv142.unr192, %for.body30.preheader183.new ], [ %indvars.iv.next143.3.7, %for.body30 ]
  %indvars.iv.next143.3.7 = add nsw i64 %indvars.iv142, 32
  %exitcond144.3.7 = icmp eq i64 %indvars.iv.next143.3.7, 2000
  br i1 %exitcond144.3.7, label %for.inc58.loopexit193, label %for.body30

for.inc58.loopexit:                               ; preds = %for.cond35.for.inc55_crit_edge.us
  br label %for.inc58

for.inc58.loopexit193:                            ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit193, %for.inc58.loopexit, %for.body30.prol.loopexit186, %for.body30.prol.loopexit
  %indvars.iv.next166 = add nuw nsw i64 %indvars.iv165, 1
  %exitcond168 = icmp eq i64 %indvars.iv.next166, 2000
  br i1 %exitcond168, label %for.body63.preheader, label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.inc82
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %for.inc82 ], [ 0, %for.body63.preheader ]
  %32 = add i64 %indvars.iv122, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv122
  %33 = load double, double* %arrayidx65, align 8
  %cmp6784 = icmp sgt i64 %indvars.iv122, 0
  br i1 %cmp6784, label %for.inc77.lr.ph, label %for.inc82

for.inc77.lr.ph:                                  ; preds = %for.body63
  %34 = trunc i64 %indvars.iv122 to i32
  %xtraiter115 = and i32 %34, 3
  %lcmp.mod116 = icmp eq i32 %xtraiter115, 0
  br i1 %lcmp.mod116, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.lr.ph
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol.preheader, %for.inc77.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %w.286.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %33, %for.inc77.prol.preheader ]
  %prol.iter118 = phi i32 [ %prol.iter118.sub, %for.inc77.prol ], [ %xtraiter115, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv122, i64 %indvars.iv.prol
  %35 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %36 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %35, %36
  %sub76.prol = fsub double %w.286.prol, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter118.sub = add i32 %prol.iter118, -1
  %prol.iter118.cmp = icmp eq i32 %prol.iter118.sub, 0
  br i1 %prol.iter118.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !4

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.inc77.lr.ph ], [ %indvars.iv.next.prol, %for.inc77.prol.loopexit.loopexit ]
  %w.286.unr = phi double [ %33, %for.inc77.lr.ph ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.lr.ph ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %37 = trunc i64 %32 to i32
  %38 = icmp ult i32 %37, 3
  br i1 %38, label %for.inc82, label %for.inc77.preheader

for.inc77.preheader:                              ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77.preheader, %for.inc77
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc77 ], [ %indvars.iv.unr, %for.inc77.preheader ]
  %w.286 = phi double [ %sub76.3, %for.inc77 ], [ %w.286.unr, %for.inc77.preheader ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv122, i64 %indvars.iv
  %39 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %40 = bitcast double* %arrayidx74 to <2 x double>*
  %41 = load <2 x double>, <2 x double>* %39, align 8
  %42 = load <2 x double>, <2 x double>* %40, align 8
  %mul75 = fmul <2 x double> %41, %42
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %w.286, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv122, i64 %indvars.iv.next.1
  %43 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %44 = bitcast double* %arrayidx74.2 to <2 x double>*
  %45 = load <2 x double>, <2 x double>* %43, align 8
  %46 = load <2 x double>, <2 x double>* %44, align 8
  %mul75.2 = fmul <2 x double> %45, %46
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3119 = icmp eq i64 %indvars.iv.next.3, %indvars.iv122
  br i1 %exitcond.3119, label %for.inc82.loopexit, label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.inc77.prol.loopexit, %for.body63
  %w.2.lcssa = phi double [ %33, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv122
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %exitcond = icmp eq i64 %indvars.iv.next123, 2000
  br i1 %exitcond, label %for.body88.preheader, label %for.body63

for.body88.preheader:                             ; preds = %for.inc82
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.inc112
  %indvars.iv111 = phi i64 [ %indvars.iv.next112, %for.inc112 ], [ 2000, %for.body88.preheader ]
  %indvar = phi i32 [ %indvar.next, %for.inc112 ], [ 0, %for.body88.preheader ]
  %47 = add nsw i32 %indvar, -1
  %indvars.iv.next112 = add nsw i64 %indvars.iv111, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next112
  %48 = load double, double* %arrayidx90, align 8
  %cmp9278 = icmp slt i64 %indvars.iv111, 2000
  br i1 %cmp9278, label %for.inc102.preheader, label %for.inc112

for.inc102.preheader:                             ; preds = %for.body88
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.preheader
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol.preheader, %for.inc102.prol
  %indvars.iv109.prol = phi i64 [ %indvars.iv.next110.prol, %for.inc102.prol ], [ %indvars.iv111, %for.inc102.prol.preheader ]
  %w.379.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %48, %for.inc102.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next112, i64 %indvars.iv109.prol
  %49 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv109.prol
  %50 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %49, %50
  %sub101.prol = fsub double %w.379.prol, %mul100.prol
  %indvars.iv.next110.prol = add nsw i64 %indvars.iv109.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !5

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.preheader
  %indvars.iv109.unr = phi i64 [ %indvars.iv111, %for.inc102.preheader ], [ %indvars.iv.next110.prol, %for.inc102.prol.loopexit.loopexit ]
  %w.379.unr = phi double [ %48, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %51 = icmp ult i32 %47, 3
  br i1 %51, label %for.inc112, label %for.inc102.preheader182

for.inc102.preheader182:                          ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102.preheader182, %for.inc102
  %indvars.iv109 = phi i64 [ %indvars.iv.next110.3, %for.inc102 ], [ %indvars.iv109.unr, %for.inc102.preheader182 ]
  %w.379 = phi double [ %sub101.3, %for.inc102 ], [ %w.379.unr, %for.inc102.preheader182 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next112, i64 %indvars.iv109
  %52 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv109
  %53 = bitcast double* %arrayidx99 to <2 x double>*
  %54 = load <2 x double>, <2 x double>* %52, align 8
  %55 = load <2 x double>, <2 x double>* %53, align 8
  %mul100 = fmul <2 x double> %54, %55
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.379, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next110.1 = add nsw i64 %indvars.iv109, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next112, i64 %indvars.iv.next110.1
  %56 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next110.1
  %57 = bitcast double* %arrayidx99.2 to <2 x double>*
  %58 = load <2 x double>, <2 x double>* %56, align 8
  %59 = load <2 x double>, <2 x double>* %57, align 8
  %mul100.2 = fmul <2 x double> %58, %59
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
  %w.3.lcssa = phi double [ %48, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %60 = ptrtoint double* %x to i64
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next112, i64 %indvars.iv.next112
  %61 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %61
  %sunkaddr177 = shl i64 %indvars.iv111, 3
  %sunkaddr178 = add i64 %60, %sunkaddr177
  %sunkaddr179 = add i64 %sunkaddr178, -8
  %sunkaddr180 = inttoptr i64 %sunkaddr179 to double*
  store double %div109, double* %sunkaddr180, align 8
  %cmp87 = icmp sgt i64 %indvars.iv111, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  br i1 %cmp87, label %for.body88, label %for.end113

for.end113:                                       ; preds = %for.inc112
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, double* %x) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %entry ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
