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
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv143 = phi i64 [ 0, %entry ], [ %indvars.iv.next144.1, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv143
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv143
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next144 = or i64 %indvars.iv143, 1
  %2 = trunc i64 %indvars.iv.next144 to i32
  %conv4 = sitofp i32 %2 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv143
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next144.1 = add nsw i64 %indvars.iv143, 2
  %3 = trunc i64 %indvars.iv.next144.1 to i32
  %conv4.1 = sitofp i32 %3 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %4 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %4, align 8
  %exitcond167.1 = icmp eq i64 %indvars.iv.next144, 1999
  br i1 %exitcond167.1, label %for.body16.lr.ph.preheader, label %for.body

for.body16.lr.ph.preheader:                       ; preds = %for.body
  br label %for.body16.lr.ph

for.body16.lr.ph:                                 ; preds = %for.body16.lr.ph.preheader, %for.end39
  %indvars.iv141 = phi i64 [ %indvars.iv.next142, %for.end39 ], [ 0, %for.body16.lr.ph.preheader ]
  %5 = shl i64 %indvars.iv141, 32
  %sext = add nuw nsw i64 %5, 4294967296
  %6 = ashr exact i64 %sext, 32
  %7 = sub nsw i64 1998, %indvars.iv141
  %8 = shl i64 %7, 3
  br label %for.body16

for.cond29.preheader:                             ; preds = %for.body16
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %cmp3080 = icmp slt i64 %indvars.iv.next142, 2000
  br i1 %cmp3080, label %for.body32.for.end39_crit_edge, label %for.end39

for.body16:                                       ; preds = %for.body16, %for.body16.lr.ph
  %indvars.iv125 = phi i64 [ %indvars.iv.next126, %for.body16 ], [ 0, %for.body16.lr.ph ]
  %9 = sub nsw i64 0, %indvars.iv125
  %10 = trunc i64 %9 to i32
  %rem = srem i32 %10, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv141, i64 %indvars.iv125
  store double %add20, double* %arrayidx24, align 8
  %exitcond131 = icmp eq i64 %indvars.iv125, %indvars.iv141
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  br i1 %exitcond131, label %for.cond29.preheader, label %for.body16

for.body32.for.end39_crit_edge:                   ; preds = %for.cond29.preheader
  %11 = and i64 %8, 34359738360
  %scevgep139 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv141, i64 %6
  %12 = add nuw nsw i64 %11, 8
  %scevgep139140 = bitcast double* %scevgep139 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep139140, i8 0, i64 %12, i32 8, i1 false)
  br label %for.end39

for.end39:                                        ; preds = %for.cond29.preheader, %for.body32.for.end39_crit_edge
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv141, i64 %indvars.iv141
  store double 1.000000e+00, double* %arrayidx43, align 8
  %exitcond166 = icmp eq i64 %indvars.iv.next142, 2000
  br i1 %exitcond166, label %for.end46, label %for.body16.lr.ph

for.end46:                                        ; preds = %for.end39
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us, %for.end46
  %indvars.iv123 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next124.7, %for.inc62.us ]
  %13 = mul nuw nsw i64 %indvars.iv123, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next124 = or i64 %indvars.iv123, 1
  %14 = mul nuw nsw i64 %indvars.iv.next124, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next124.1 = or i64 %indvars.iv123, 2
  %15 = mul nuw nsw i64 %indvars.iv.next124.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next124.2 = or i64 %indvars.iv123, 3
  %16 = mul nuw nsw i64 %indvars.iv.next124.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next124.3 = or i64 %indvars.iv123, 4
  %17 = mul nuw nsw i64 %indvars.iv.next124.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next124.4 = or i64 %indvars.iv123, 5
  %18 = mul nuw nsw i64 %indvars.iv.next124.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next124.5 = or i64 %indvars.iv123, 6
  %19 = mul nuw nsw i64 %indvars.iv.next124.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next124.6 = or i64 %indvars.iv123, 7
  %20 = mul nuw nsw i64 %indvars.iv.next124.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next124.7 = add nsw i64 %indvars.iv123, 8
  %exitcond165.7 = icmp eq i64 %indvars.iv.next124.7, 2000
  br i1 %exitcond165.7, label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader, label %for.inc62.us

for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader: ; preds = %for.inc62.us
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge: ; preds = %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader, %for.inc96.us
  %indvars.iv117 = phi i64 [ %22, %for.inc96.us ], [ 0, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv117
  %22 = add i64 %indvars.iv117, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %22
  %23 = bitcast double* %scevgep5 to i8*
  %24 = bitcast double* %scevgep3 to i8*
  br label %for.cond73.preheader.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %exitcond164 = icmp eq i64 %22, 2000
  br i1 %exitcond164, label %for.cond103.preheader.us.preheader, label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond103.preheader.us.preheader:               ; preds = %for.inc96.us
  br label %for.cond103.preheader.us

for.cond73.preheader.us.us:                       ; preds = %for.inc93.us.us, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge
  %indvars.iv115 = phi i64 [ 0, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge ], [ %indvars.iv.next116, %for.inc93.us.us ]
  %25 = mul i64 %indvars.iv115, 16000
  %scevgep1 = getelementptr i8, i8* %call, i64 %25
  %26 = add i64 %25, 16000
  %scevgep2 = getelementptr i8, i8* %call, i64 %26
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv115, i64 %indvars.iv117
  %bound0 = icmp ult i8* %scevgep1, %23
  %bound1 = icmp ult i8* %24, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx80.us.us to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %for.body76.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us.us
  br label %vector.body

for.body76.us.us.preheader:                       ; preds = %for.cond73.preheader.us.us
  br label %for.body76.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %27 = or i64 %index, 1
  %28 = or i64 %index, 2
  %29 = or i64 %index, 3
  %30 = load double, double* %arrayidx80.us.us, align 8, !alias.scope !1
  %31 = insertelement <2 x double> undef, double %30, i32 0
  %32 = shufflevector <2 x double> %31, <2 x double> undef, <2 x i32> zeroinitializer
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv117
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %27, i64 %indvars.iv117
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %28, i64 %indvars.iv117
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %29, i64 %indvars.iv117
  %37 = load double, double* %33, align 8, !alias.scope !4
  %38 = load double, double* %34, align 8, !alias.scope !4
  %39 = load double, double* %35, align 8, !alias.scope !4
  %40 = load double, double* %36, align 8, !alias.scope !4
  %41 = insertelement <2 x double> undef, double %37, i32 0
  %42 = insertelement <2 x double> %41, double %38, i32 1
  %43 = insertelement <2 x double> undef, double %39, i32 0
  %44 = insertelement <2 x double> %43, double %40, i32 1
  %45 = fmul <2 x double> %32, %42
  %46 = fmul <2 x double> %32, %44
  %47 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv115, i64 %index
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !6, !noalias !8
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !6, !noalias !8
  %51 = fadd <2 x double> %wide.load, %45
  %52 = fadd <2 x double> %wide.load12, %46
  store <2 x double> %51, <2 x double>* %48, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %52, <2 x double>* %50, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %53 = icmp eq i64 %index.next, 2000
  br i1 %53, label %for.inc93.us.us.loopexit43, label %vector.body, !llvm.loop !9

for.inc93.us.us.loopexit:                         ; preds = %for.body76.us.us
  br label %for.inc93.us.us

for.inc93.us.us.loopexit43:                       ; preds = %vector.body
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit43, %for.inc93.us.us.loopexit
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond163 = icmp eq i64 %indvars.iv.next116, 2000
  br i1 %exitcond163, label %for.inc96.us, label %for.cond73.preheader.us.us

for.body76.us.us:                                 ; preds = %for.body76.us.us, %for.body76.us.us.preheader
  %indvars.iv111 = phi i64 [ 0, %for.body76.us.us.preheader ], [ %indvars.iv.next112.1, %for.body76.us.us ]
  %54 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv111, i64 %indvars.iv117
  %55 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %54, %55
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv115, i64 %indvars.iv111
  %56 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %56, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next112 = or i64 %indvars.iv111, 1
  %57 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next112, i64 %indvars.iv117
  %58 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %57, %58
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv115, i64 %indvars.iv.next112
  %59 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %59, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %exitcond162.1 = icmp eq i64 %indvars.iv.next112, 1999
  %indvars.iv.next112.1 = add nsw i64 %indvars.iv111, 2
  br i1 %exitcond162.1, label %for.inc93.us.us.loopexit, label %for.body76.us.us, !llvm.loop !12

for.cond103.preheader.us:                         ; preds = %for.cond103.preheader.us.preheader, %for.inc118.us
  %indvars.iv109 = phi i64 [ %60, %for.inc118.us ], [ 0, %for.cond103.preheader.us.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv109, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %60 = add i64 %indvars.iv109, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %A, i64 %60, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %61 = mul i64 %indvars.iv109, 16000
  %scevgep22 = getelementptr i8, i8* %call, i64 %61
  %62 = add i64 %61, 16000
  %scevgep23 = getelementptr i8, i8* %call, i64 %62
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %for.body106.us.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %for.cond103.preheader.us
  br label %vector.body13

for.body106.us.preheader:                         ; preds = %for.cond103.preheader.us
  br label %for.body106.us

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv109, i64 %index30
  %64 = bitcast double* %63 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %64, align 8, !alias.scope !13
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %66, align 8, !alias.scope !13
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv109, i64 %index30
  %68 = bitcast double* %67 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %68, align 8, !alias.scope !16, !noalias !13
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %70, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv109, i64 %index.next31
  %72 = bitcast double* %71 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %72, align 8, !alias.scope !13
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %74, align 8, !alias.scope !13
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv109, i64 %index.next31
  %76 = bitcast double* %75 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %76, align 8, !alias.scope !16, !noalias !13
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %78, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %79 = icmp eq i64 %index.next31.1, 2000
  br i1 %79, label %for.inc118.us.loopexit42, label %vector.body13, !llvm.loop !18

for.body106.us:                                   ; preds = %for.body106.us, %for.body106.us.preheader
  %indvars.iv = phi i64 [ 0, %for.body106.us.preheader ], [ %indvars.iv.next.4, %for.body106.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv109, i64 %indvars.iv
  %80 = bitcast double* %arrayidx110.us to i64*
  %81 = load i64, i64* %80, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv109, i64 %indvars.iv
  %82 = bitcast double* %arrayidx114.us to i64*
  store i64 %81, i64* %82, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next
  %83 = bitcast double* %arrayidx110.us.1 to i64*
  %84 = load i64, i64* %83, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv109, i64 %indvars.iv.next
  %85 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %84, i64* %85, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next.1
  %86 = bitcast double* %arrayidx110.us.2 to i64*
  %87 = load i64, i64* %86, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv109, i64 %indvars.iv.next.1
  %88 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %87, i64* %88, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next.2
  %89 = bitcast double* %arrayidx110.us.3 to i64*
  %90 = load i64, i64* %89, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv109, i64 %indvars.iv.next.2
  %91 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %90, i64* %91, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx110.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next.3
  %92 = bitcast double* %arrayidx110.us.4 to i64*
  %93 = load i64, i64* %92, align 8
  %arrayidx114.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv109, i64 %indvars.iv.next.3
  %94 = bitcast double* %arrayidx114.us.4 to i64*
  store i64 %93, i64* %94, align 8
  %exitcond161.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond161.4, label %for.inc118.us.loopexit, label %for.body106.us, !llvm.loop !19

for.inc118.us.loopexit:                           ; preds = %for.body106.us
  br label %for.inc118.us

for.inc118.us.loopexit42:                         ; preds = %vector.body13
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit42, %for.inc118.us.loopexit
  %exitcond = icmp eq i64 %60, 2000
  br i1 %exitcond, label %for.end120, label %for.cond103.preheader.us

for.end120:                                       ; preds = %for.inc118.us
  tail call void @free(i8* %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %entry
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc58 ], [ 0, %entry ]
  %indvars.iv156 = phi i64 [ %indvars.iv.next157, %for.inc58 ], [ 4294967295, %entry ]
  %0 = sub i64 2000, %indvars.iv2
  %1 = add i64 %0, -4
  %2 = lshr i64 %1, 2
  %3 = and i64 %indvars.iv156, 4294967295
  %cmp296 = icmp sgt i64 %indvars.iv2, 0
  br i1 %cmp296, label %for.body3.preheader, label %for.body30.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 0
  br label %for.body3

for.body30.preheader:                             ; preds = %for.body30.lr.ph.for.body30.preheader_crit_edge, %for.cond1.preheader
  %min.iters.check = icmp ult i64 %0, 4
  br i1 %min.iters.check, label %for.body30.preheader13, label %min.iters.checked

for.body30.preheader13:                           ; preds = %middle.block, %min.iters.checked, %for.body30.preheader
  %indvars.iv128.ph = phi i64 [ %indvars.iv2, %min.iters.checked ], [ %indvars.iv2, %for.body30.preheader ], [ %ind.end, %middle.block ]
  br label %for.body30

min.iters.checked:                                ; preds = %for.body30.preheader
  %n.vec = and i64 %0, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv2, %n.vec
  br i1 %cmp.zero, label %for.body30.preheader13, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %4 = and i64 %2, 1
  %lcmp.mod21 = icmp eq i64 %4, 0
  br i1 %lcmp.mod21, label %vector.body.prol, label %vector.body.prol.loopexit

vector.body.prol:                                 ; preds = %vector.body.preheader
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv2
  %6 = bitcast double* %5 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %6, align 8
  %7 = getelementptr double, double* %5, i64 2
  %8 = bitcast double* %7 to <2 x i64>*
  %wide.load8.prol = load <2 x i64>, <2 x i64>* %8, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %6, align 8
  store <2 x i64> %wide.load8.prol, <2 x i64>* %8, align 8
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  %9 = icmp eq i64 %2, 0
  br i1 %9, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %10 = add i64 %indvars.iv2, %index
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %10
  %12 = bitcast double* %11 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %12, align 8
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x i64>*
  %wide.load8 = load <2 x i64>, <2 x i64>* %14, align 8
  store <2 x i64> %wide.load, <2 x i64>* %12, align 8
  store <2 x i64> %wide.load8, <2 x i64>* %14, align 8
  %index.next = add i64 %index, 4
  %15 = add i64 %indvars.iv2, %index.next
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %15
  %17 = bitcast double* %16 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %17, align 8
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x i64>*
  %wide.load8.1 = load <2 x i64>, <2 x i64>* %19, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %17, align 8
  store <2 x i64> %wide.load8.1, <2 x i64>* %19, align 8
  %index.next.1 = add i64 %index, 8
  %20 = icmp eq i64 %index.next.1, %n.vec
  br i1 %20, label %middle.block.loopexit, label %vector.body, !llvm.loop !20

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %0, %n.vec
  br i1 %cmp.n, label %for.inc58, label %for.body30.preheader13

for.body30.lr.ph:                                 ; preds = %for.end
  br i1 true, label %for.body30.us.preheader, label %for.body30.lr.ph.for.body30.preheader_crit_edge

for.body30.lr.ph.for.body30.preheader_crit_edge:  ; preds = %for.body30.lr.ph
  br label %for.body30.preheader

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %21 = and i64 %indvars.iv156, 1
  %lcmp.mod23 = icmp eq i64 %21, 0
  %22 = icmp eq i64 %3, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.end50.us
  %indvars.iv141 = phi i64 [ %indvars.iv.next142, %for.end50.us ], [ %indvars.iv2, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv141
  %23 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod23, label %for.body37.us.prol, label %for.body37.us.prol.loopexit

for.body37.us.prol:                               ; preds = %for.body30.us
  %24 = load double, double* %arrayidx12.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv141
  %25 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %24, %25
  %sub47.us.prol = fsub double %23, %mul46.us.prol
  br label %for.body37.us.prol.loopexit

for.body37.us.prol.loopexit:                      ; preds = %for.body37.us.prol, %for.body30.us
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ undef, %for.body30.us ]
  %indvars.iv133.unr.ph = phi i64 [ 1, %for.body37.us.prol ], [ 0, %for.body30.us ]
  %w.1100.us.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ %23, %for.body30.us ]
  br i1 %22, label %for.end50.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.body37.us.prol.loopexit
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us, %for.body30.us.new
  %indvars.iv133 = phi i64 [ %indvars.iv133.unr.ph, %for.body30.us.new ], [ %indvars.iv.next134.1, %for.body37.us ]
  %w.1100.us = phi double [ %w.1100.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.body37.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv133
  %26 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv133, i64 %indvars.iv141
  %27 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %28 = load <2 x double>, <2 x double>* %26, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next134, i64 %indvars.iv141
  %29 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %27, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %29, i32 1
  %mul46.us = fmul <2 x double> %28, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %w.1100.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %exitcond158.1 = icmp eq i64 %indvars.iv.next134, %3
  %indvars.iv.next134.1 = add nsw i64 %indvars.iv133, 2
  br i1 %exitcond158.1, label %for.end50.us.loopexit, label %for.body37.us

for.end50.us.loopexit:                            ; preds = %for.body37.us
  br label %for.end50.us

for.end50.us:                                     ; preds = %for.end50.us.loopexit, %for.body37.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.body37.us.prol.loopexit ], [ %sub47.us.1, %for.end50.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next142, 2000
  br i1 %exitcond5, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.body3.preheader, %for.end
  %indvars.iv152 = phi i64 [ %indvars.iv.next153, %for.end ], [ 4294967295, %for.body3.preheader ]
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %for.end ], [ 0, %for.body3.preheader ]
  %30 = and i64 %indvars.iv152, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv124
  %31 = load double, double* %arrayidx5, align 8
  %cmp792 = icmp sgt i64 %indvars.iv124, 0
  br i1 %cmp792, label %for.body8.preheader, label %for.end

for.body8.preheader:                              ; preds = %for.body3
  %32 = and i64 %indvars.iv152, 1
  %lcmp.mod19 = icmp eq i64 %32, 0
  br i1 %lcmp.mod19, label %for.body8.prol, label %for.body8.prol.loopexit

for.body8.prol:                                   ; preds = %for.body8.preheader
  %33 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv124
  %34 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %33, %34
  %sub.prol = fsub double %31, %mul.prol
  br label %for.body8.prol.loopexit

for.body8.prol.loopexit:                          ; preds = %for.body8.prol, %for.body8.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ undef, %for.body8.preheader ]
  %indvars.iv118.unr.ph = phi i64 [ 1, %for.body8.prol ], [ 0, %for.body8.preheader ]
  %w.094.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ %31, %for.body8.preheader ]
  %35 = icmp eq i64 %30, 0
  br i1 %35, label %for.end, label %for.body8.preheader.new

for.body8.preheader.new:                          ; preds = %for.body8.prol.loopexit
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.body8.preheader.new
  %indvars.iv118 = phi i64 [ %indvars.iv118.unr.ph, %for.body8.preheader.new ], [ %indvars.iv.next119.1, %for.body8 ]
  %w.094 = phi double [ %w.094.unr.ph, %for.body8.preheader.new ], [ %sub.1, %for.body8 ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv118
  %36 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv118, i64 %indvars.iv124
  %37 = load double, double* %arrayidx16, align 8
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %38 = load <2 x double>, <2 x double>* %36, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next119, i64 %indvars.iv124
  %39 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %37, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %39, i32 1
  %mul = fmul <2 x double> %38, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.094, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %exitcond154.1 = icmp eq i64 %indvars.iv.next119, %30
  %indvars.iv.next119.1 = add nsw i64 %indvars.iv118, 2
  br i1 %exitcond154.1, label %for.end.loopexit, label %for.body8

for.end.loopexit:                                 ; preds = %for.body8
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body8.prol.loopexit, %for.body3
  %w.0.lcssa = phi double [ %31, %for.body3 ], [ %sub.lcssa.unr.ph, %for.body8.prol.loopexit ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %indvars.iv124
  %40 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %40
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %indvars.iv.next153 = add nuw nsw i64 %30, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next125, %indvars.iv2
  br i1 %exitcond4, label %for.body30.lr.ph, label %for.body3

for.body30:                                       ; preds = %for.body30.preheader13, %for.body30
  %indvars.iv128 = phi i64 [ %indvars.iv.next129, %for.body30 ], [ %indvars.iv128.ph, %for.body30.preheader13 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv128
  %41 = bitcast double* %arrayidx34 to i64*
  %42 = load i64, i64* %41, align 8
  store i64 %42, i64* %41, align 8
  %exitcond155 = icmp eq i64 %indvars.iv128, 1999
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  br i1 %exitcond155, label %for.inc58.loopexit24, label %for.body30, !llvm.loop !21

for.inc58.loopexit:                               ; preds = %for.end50.us
  br label %for.inc58

for.inc58.loopexit24:                             ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit24, %for.inc58.loopexit, %middle.block
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %indvars.iv.next157 = add nuw nsw i64 %3, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond6, label %for.body63.preheader, label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.end79
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %for.end79 ], [ 4294967295, %for.body63.preheader ]
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %for.end79 ], [ 0, %for.body63.preheader ]
  %43 = and i64 %indvars.iv149, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv116
  %44 = load double, double* %arrayidx65, align 8
  %cmp6785 = icmp sgt i64 %indvars.iv116, 0
  br i1 %cmp6785, label %for.body68.preheader, label %for.end79

for.body68.preheader:                             ; preds = %for.body63
  %45 = add nsw i64 %indvars.iv149, 1
  %xtraiter15 = and i64 %45, 3
  %lcmp.mod16 = icmp eq i64 %xtraiter15, 0
  br i1 %lcmp.mod16, label %for.body68.prol.loopexit, label %for.body68.prol.preheader

for.body68.prol.preheader:                        ; preds = %for.body68.preheader
  br label %for.body68.prol

for.body68.prol:                                  ; preds = %for.body68.prol, %for.body68.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body68.prol ], [ 0, %for.body68.prol.preheader ]
  %w.287.prol = phi double [ %sub76.prol, %for.body68.prol ], [ %44, %for.body68.prol.preheader ]
  %prol.iter17 = phi i64 [ %prol.iter17.sub, %for.body68.prol ], [ %xtraiter15, %for.body68.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv.prol
  %46 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %47 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %46, %47
  %sub76.prol = fsub double %w.287.prol, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter17.sub = add i64 %prol.iter17, -1
  %prol.iter17.cmp = icmp eq i64 %prol.iter17.sub, 0
  br i1 %prol.iter17.cmp, label %for.body68.prol.loopexit.loopexit, label %for.body68.prol, !llvm.loop !23

for.body68.prol.loopexit.loopexit:                ; preds = %for.body68.prol
  br label %for.body68.prol.loopexit

for.body68.prol.loopexit:                         ; preds = %for.body68.prol.loopexit.loopexit, %for.body68.preheader
  %sub76.lcssa.unr = phi double [ undef, %for.body68.preheader ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %for.body68.preheader ], [ %indvars.iv.next.prol, %for.body68.prol.loopexit.loopexit ]
  %w.287.unr = phi double [ %44, %for.body68.preheader ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %48 = icmp ult i64 %43, 3
  br i1 %48, label %for.end79, label %for.body68.preheader.new

for.body68.preheader.new:                         ; preds = %for.body68.prol.loopexit
  br label %for.body68

for.body68:                                       ; preds = %for.body68, %for.body68.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body68.preheader.new ], [ %indvars.iv.next.3, %for.body68 ]
  %w.287 = phi double [ %w.287.unr, %for.body68.preheader.new ], [ %sub76.3, %for.body68 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv
  %49 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %50 = bitcast double* %arrayidx74 to <2 x double>*
  %51 = load <2 x double>, <2 x double>* %49, align 8
  %52 = load <2 x double>, <2 x double>* %50, align 8
  %mul75 = fmul <2 x double> %51, %52
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %w.287, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv.next.1
  %53 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %54 = bitcast double* %arrayidx74.2 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %55 = load <2 x double>, <2 x double>* %53, align 8
  %56 = load <2 x double>, <2 x double>* %54, align 8
  %mul75.2 = fmul <2 x double> %55, %56
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %exitcond151.3 = icmp eq i64 %indvars.iv.next.2, %43
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond151.3, label %for.end79.loopexit, label %for.body68

for.end79.loopexit:                               ; preds = %for.body68
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.body68.prol.loopexit, %for.body63
  %w.2.lcssa = phi double [ %44, %for.body63 ], [ %sub76.lcssa.unr, %for.body68.prol.loopexit ], [ %sub76.3, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv116
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %indvars.iv.next150 = add nuw nsw i64 %43, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next117, 2000
  br i1 %exitcond1, label %for.body88.preheader, label %for.body63

for.body88.preheader:                             ; preds = %for.end79
  %sunkaddr = ptrtoint double* %x to i64
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.end104
  %indvar = phi i64 [ 0, %for.body88.preheader ], [ %indvar.next, %for.end104 ]
  %indvars.iv110 = phi i64 [ 2000, %for.body88.preheader ], [ %indvars.iv.next111, %for.end104 ]
  %57 = add i64 %indvar, -1
  %indvars.iv.next111 = add nsw i64 %indvars.iv110, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next111
  %58 = load double, double* %arrayidx90, align 8
  %cmp9278 = icmp slt i64 %indvars.iv110, 2000
  br i1 %cmp9278, label %for.body93.preheader, label %for.end104

for.body93.preheader:                             ; preds = %for.body88
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body93.prol.loopexit, label %for.body93.prol.preheader

for.body93.prol.preheader:                        ; preds = %for.body93.preheader
  br label %for.body93.prol

for.body93.prol:                                  ; preds = %for.body93.prol, %for.body93.prol.preheader
  %indvars.iv108.prol = phi i64 [ %indvars.iv.next109.prol, %for.body93.prol ], [ %indvars.iv110, %for.body93.prol.preheader ]
  %w.379.prol = phi double [ %sub101.prol, %for.body93.prol ], [ %58, %for.body93.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body93.prol ], [ %xtraiter, %for.body93.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next111, i64 %indvars.iv108.prol
  %59 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv108.prol
  %60 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %59, %60
  %sub101.prol = fsub double %w.379.prol, %mul100.prol
  %indvars.iv.next109.prol = add i64 %indvars.iv108.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body93.prol.loopexit.loopexit, label %for.body93.prol, !llvm.loop !25

for.body93.prol.loopexit.loopexit:                ; preds = %for.body93.prol
  br label %for.body93.prol.loopexit

for.body93.prol.loopexit:                         ; preds = %for.body93.prol.loopexit.loopexit, %for.body93.preheader
  %sub101.lcssa.unr = phi double [ undef, %for.body93.preheader ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %indvars.iv108.unr = phi i64 [ %indvars.iv110, %for.body93.preheader ], [ %indvars.iv.next109.prol, %for.body93.prol.loopexit.loopexit ]
  %w.379.unr = phi double [ %58, %for.body93.preheader ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %61 = icmp ult i64 %57, 3
  br i1 %61, label %for.end104, label %for.body93.preheader.new

for.body93.preheader.new:                         ; preds = %for.body93.prol.loopexit
  br label %for.body93

for.body93:                                       ; preds = %for.body93, %for.body93.preheader.new
  %indvars.iv108 = phi i64 [ %indvars.iv108.unr, %for.body93.preheader.new ], [ %indvars.iv.next109.3, %for.body93 ]
  %w.379 = phi double [ %w.379.unr, %for.body93.preheader.new ], [ %sub101.3, %for.body93 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next111, i64 %indvars.iv108
  %62 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv108
  %63 = bitcast double* %arrayidx99 to <2 x double>*
  %64 = load <2 x double>, <2 x double>* %62, align 8
  %65 = load <2 x double>, <2 x double>* %63, align 8
  %mul100 = fmul <2 x double> %64, %65
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.379, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next109.1 = add i64 %indvars.iv108, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next111, i64 %indvars.iv.next109.1
  %66 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next109.1
  %67 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next109.2 = add i64 %indvars.iv108, 3
  %68 = load <2 x double>, <2 x double>* %66, align 8
  %69 = load <2 x double>, <2 x double>* %67, align 8
  %mul100.2 = fmul <2 x double> %68, %69
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %exitcond.3 = icmp eq i64 %indvars.iv.next109.2, 1999
  %indvars.iv.next109.3 = add i64 %indvars.iv108, 4
  br i1 %exitcond.3, label %for.end104.loopexit, label %for.body93

for.end104.loopexit:                              ; preds = %for.body93
  br label %for.end104

for.end104:                                       ; preds = %for.end104.loopexit, %for.body93.prol.loopexit, %for.body88
  %w.3.lcssa = phi double [ %58, %for.body88 ], [ %sub101.lcssa.unr, %for.body93.prol.loopexit ], [ %sub101.3, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next111, i64 %indvars.iv.next111
  %70 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %70
  %sunkaddr9 = shl i64 %indvars.iv110, 3
  %sunkaddr10 = add i64 %sunkaddr, %sunkaddr9
  %sunkaddr11 = add i64 %sunkaddr10, -8
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to double*
  store double %div109, double* %sunkaddr12, align 8
  %cmp87 = icmp sgt i64 %indvars.iv110, 1
  %indvar.next = add i64 %indvar, 1
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!5, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = distinct !{!20, !10, !11}
!21 = distinct !{!21, !22, !10, !11}
!22 = !{!"llvm.loop.unroll.runtime.disable"}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
!25 = distinct !{!25, !24}
