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
  %indvars.iv121 = phi i64 [ 0, %entry.for.inc_crit_edge ], [ %indvars.iv.next122.1, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv121
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv121
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next122 = or i64 %indvars.iv121, 1
  %2 = trunc i64 %indvars.iv.next122 to i32
  %conv4 = sitofp i32 %2 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv121
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next122.1 = add nsw i64 %indvars.iv121, 2
  %3 = trunc i64 %indvars.iv.next122.1 to i32
  %conv4.1 = sitofp i32 %3 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %4 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %4, align 8
  %exitcond145.1 = icmp eq i64 %indvars.iv.next122, 1999
  br i1 %exitcond145.1, label %for.inc25.lr.ph.preheader, label %for.inc

for.inc25.lr.ph.preheader:                        ; preds = %for.inc
  br label %for.inc25.lr.ph

for.inc25.lr.ph:                                  ; preds = %for.inc25.lr.ph.preheader, %for.inc44
  %indvars.iv119 = phi i64 [ %indvars.iv.next120, %for.inc44 ], [ 0, %for.inc25.lr.ph.preheader ]
  %5 = shl i64 %indvars.iv119, 32
  %sext = add nuw nsw i64 %5, 4294967296
  %6 = sub nsw i64 1998, %indvars.iv119
  br label %for.inc25

for.cond29.preheader:                             ; preds = %for.inc25
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %cmp3080 = icmp slt i64 %indvars.iv.next120, 2000
  br i1 %cmp3080, label %for.inc37.for.inc44_crit_edge, label %for.inc44

for.inc25:                                        ; preds = %for.inc25, %for.inc25.lr.ph
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %for.inc25 ], [ 0, %for.inc25.lr.ph ]
  %7 = sub nsw i64 0, %indvars.iv103
  %8 = trunc i64 %7 to i32
  %rem = srem i32 %8, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv119, i64 %indvars.iv103
  store double %add20, double* %arrayidx24, align 8
  %exitcond109 = icmp eq i64 %indvars.iv103, %indvars.iv119
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  br i1 %exitcond109, label %for.cond29.preheader, label %for.inc25

for.inc37.for.inc44_crit_edge:                    ; preds = %for.cond29.preheader
  %9 = shl i64 %6, 3
  %10 = ashr exact i64 %sext, 32
  %11 = and i64 %9, 34359738360
  %scevgep117 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv119, i64 %10
  %12 = add nuw nsw i64 %11, 8
  %scevgep117118 = bitcast double* %scevgep117 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep117118, i8 0, i64 %12, i32 8, i1 false)
  br label %for.inc44

for.inc44:                                        ; preds = %for.cond29.preheader, %for.inc37.for.inc44_crit_edge
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv119, i64 %indvars.iv119
  store double 1.000000e+00, double* %arrayidx43, align 8
  %exitcond144 = icmp eq i64 %indvars.iv.next120, 2000
  br i1 %exitcond144, label %for.end46.for.cond51.preheader.us_crit_edge, label %for.inc25.lr.ph

for.end46.for.cond51.preheader.us_crit_edge:      ; preds = %for.inc44
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us, %for.end46.for.cond51.preheader.us_crit_edge
  %indvars.iv101 = phi i64 [ 0, %for.end46.for.cond51.preheader.us_crit_edge ], [ %indvars.iv.next102.7, %for.inc62.us ]
  %13 = mul nuw nsw i64 %indvars.iv101, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next102 = or i64 %indvars.iv101, 1
  %14 = mul nuw nsw i64 %indvars.iv.next102, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next102.1 = or i64 %indvars.iv101, 2
  %15 = mul nuw nsw i64 %indvars.iv.next102.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next102.2 = or i64 %indvars.iv101, 3
  %16 = mul nuw nsw i64 %indvars.iv.next102.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next102.3 = or i64 %indvars.iv101, 4
  %17 = mul nuw nsw i64 %indvars.iv.next102.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next102.4 = or i64 %indvars.iv101, 5
  %18 = mul nuw nsw i64 %indvars.iv.next102.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next102.5 = or i64 %indvars.iv101, 6
  %19 = mul nuw nsw i64 %indvars.iv.next102.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next102.6 = or i64 %indvars.iv101, 7
  %20 = mul nuw nsw i64 %indvars.iv.next102.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next102.7 = add nsw i64 %indvars.iv101, 8
  %exitcond143.7 = icmp eq i64 %indvars.iv.next102.7, 2000
  br i1 %exitcond143.7, label %for.cond73.preheader.lr.ph.preheader, label %for.inc62.us

for.cond73.preheader.lr.ph.preheader:             ; preds = %for.inc62.us
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  %23 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond73.preheader.lr.ph

for.cond73.preheader.lr.ph:                       ; preds = %for.cond73.preheader.lr.ph.preheader, %for.inc96
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %for.inc96 ], [ 0, %for.cond73.preheader.lr.ph.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv95
  %24 = add i64 %indvars.iv95, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %24
  %25 = bitcast double* %scevgep5 to i8*
  %26 = bitcast double* %scevgep3 to i8*
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.inc93.us, %for.cond73.preheader.lr.ph
  %indvars.iv93 = phi i64 [ 0, %for.cond73.preheader.lr.ph ], [ %indvars.iv.next94, %for.inc93.us ]
  %27 = mul i64 %indvars.iv93, 16000
  %scevgep1 = getelementptr i8, i8* %call, i64 %27
  %28 = add i64 %27, 16000
  %scevgep2 = getelementptr i8, i8* %call, i64 %28
  %arrayidx80.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv93, i64 %indvars.iv95
  %bound0 = icmp ult i8* %scevgep1, %25
  %bound1 = icmp ult i8* %26, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx80.us to i8*
  %bc7 = bitcast double* %arrayidx80.us to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc7
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %for.inc90.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us
  br label %vector.body

for.inc90.us.preheader:                           ; preds = %for.cond73.preheader.us
  br label %for.inc90.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %29 = or i64 %index, 1
  %30 = or i64 %index, 2
  %31 = or i64 %index, 3
  %32 = load double, double* %arrayidx80.us, align 8, !alias.scope !1
  %33 = insertelement <2 x double> undef, double %32, i32 0
  %34 = shufflevector <2 x double> %33, <2 x double> undef, <2 x i32> zeroinitializer
  %35 = insertelement <2 x double> undef, double %32, i32 0
  %36 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> zeroinitializer
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv95
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %29, i64 %indvars.iv95
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %30, i64 %indvars.iv95
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %31, i64 %indvars.iv95
  %41 = load double, double* %37, align 8, !alias.scope !4
  %42 = load double, double* %38, align 8, !alias.scope !4
  %43 = load double, double* %39, align 8, !alias.scope !4
  %44 = load double, double* %40, align 8, !alias.scope !4
  %45 = insertelement <2 x double> undef, double %41, i32 0
  %46 = insertelement <2 x double> %45, double %42, i32 1
  %47 = insertelement <2 x double> undef, double %43, i32 0
  %48 = insertelement <2 x double> %47, double %44, i32 1
  %49 = fmul <2 x double> %34, %46
  %50 = fmul <2 x double> %36, %48
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv93, i64 %index
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !6, !noalias !8
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !6, !noalias !8
  %55 = fadd <2 x double> %wide.load, %49
  %56 = fadd <2 x double> %wide.load12, %50
  %57 = bitcast double* %51 to <2 x double>*
  store <2 x double> %55, <2 x double>* %57, align 8, !alias.scope !6, !noalias !8
  %58 = bitcast double* %53 to <2 x double>*
  store <2 x double> %56, <2 x double>* %58, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %59 = icmp eq i64 %index.next, 2000
  br i1 %59, label %for.inc93.us.loopexit43, label %vector.body, !llvm.loop !9

for.inc90.us:                                     ; preds = %for.inc90.us, %for.inc90.us.preheader
  %indvars.iv89 = phi i64 [ 0, %for.inc90.us.preheader ], [ %indvars.iv.next90.1, %for.inc90.us ]
  %60 = load double, double* %arrayidx80.us, align 8
  %arrayidx84.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv95
  %61 = load double, double* %arrayidx84.us, align 8
  %mul.us = fmul double %60, %61
  %arrayidx88.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv93, i64 %indvars.iv89
  %62 = load double, double* %arrayidx88.us, align 8
  %add89.us = fadd double %62, %mul.us
  store double %add89.us, double* %arrayidx88.us, align 8
  %indvars.iv.next90 = or i64 %indvars.iv89, 1
  %63 = load double, double* %arrayidx80.us, align 8
  %arrayidx84.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next90, i64 %indvars.iv95
  %64 = load double, double* %arrayidx84.us.1, align 8
  %mul.us.1 = fmul double %63, %64
  %arrayidx88.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next90
  %65 = load double, double* %arrayidx88.us.1, align 8
  %add89.us.1 = fadd double %65, %mul.us.1
  store double %add89.us.1, double* %arrayidx88.us.1, align 8
  %exitcond140.1 = icmp eq i64 %indvars.iv.next90, 1999
  %indvars.iv.next90.1 = add nsw i64 %indvars.iv89, 2
  br i1 %exitcond140.1, label %for.inc93.us.loopexit, label %for.inc90.us, !llvm.loop !12

for.inc93.us.loopexit:                            ; preds = %for.inc90.us
  br label %for.inc93.us

for.inc93.us.loopexit43:                          ; preds = %vector.body
  br label %for.inc93.us

for.inc93.us:                                     ; preds = %for.inc93.us.loopexit43, %for.inc93.us.loopexit
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond141 = icmp eq i64 %indvars.iv.next94, 2000
  br i1 %exitcond141, label %for.inc96, label %for.cond73.preheader.us

for.cond103.preheader.us:                         ; preds = %for.cond103.preheader.us.preheader, %for.inc118.us
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %for.inc118.us ], [ 0, %for.cond103.preheader.us.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv87, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %66 = add i64 %indvars.iv87, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %A, i64 %66, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %67 = mul i64 %indvars.iv87, 16000
  %scevgep22 = getelementptr i8, i8* %call, i64 %67
  %68 = add i64 %67, 16000
  %scevgep23 = getelementptr i8, i8* %call, i64 %68
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %for.inc115.us.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %for.cond103.preheader.us
  br label %vector.body13

for.inc115.us.preheader:                          ; preds = %for.cond103.preheader.us
  br label %for.inc115.us

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %69 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv87, i64 %index30
  %70 = bitcast double* %69 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %70, align 8, !alias.scope !13
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %72, align 8, !alias.scope !13
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv87, i64 %index30
  %74 = bitcast double* %73 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %74, align 8, !alias.scope !16, !noalias !13
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %76, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %107, i64 0, i64 %indvars.iv87, i64 %index.next31
  %78 = bitcast double* %77 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %78, align 8, !alias.scope !13
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %80, align 8, !alias.scope !13
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv87, i64 %index.next31
  %82 = bitcast double* %81 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %82, align 8, !alias.scope !16, !noalias !13
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %84, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %85 = icmp eq i64 %index.next31.1, 2000
  br i1 %85, label %for.inc118.us.loopexit42, label %vector.body13, !llvm.loop !18

for.inc115.us:                                    ; preds = %for.inc115.us, %for.inc115.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc115.us.preheader ], [ %indvars.iv.next.4, %for.inc115.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv87, i64 %indvars.iv
  %86 = bitcast double* %arrayidx110.us to i64*
  %87 = load i64, i64* %86, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv87, i64 %indvars.iv
  %88 = bitcast double* %arrayidx114.us to i64*
  store i64 %87, i64* %88, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv87, i64 %indvars.iv.next
  %89 = bitcast double* %arrayidx110.us.1 to i64*
  %90 = load i64, i64* %89, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv87, i64 %indvars.iv.next
  %91 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %90, i64* %91, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv87, i64 %indvars.iv.next.1
  %92 = bitcast double* %arrayidx110.us.2 to i64*
  %93 = load i64, i64* %92, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv87, i64 %indvars.iv.next.1
  %94 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %93, i64* %94, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv87, i64 %indvars.iv.next.2
  %95 = bitcast double* %arrayidx110.us.3 to i64*
  %96 = load i64, i64* %95, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv87, i64 %indvars.iv.next.2
  %97 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %96, i64* %97, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx110.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv87, i64 %indvars.iv.next.3
  %98 = bitcast double* %arrayidx110.us.4 to i64*
  %99 = load i64, i64* %98, align 8
  %arrayidx114.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv87, i64 %indvars.iv.next.3
  %100 = bitcast double* %arrayidx114.us.4 to i64*
  store i64 %99, i64* %100, align 8
  %exitcond139.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond139.4, label %for.inc118.us.loopexit, label %for.inc115.us, !llvm.loop !19

for.inc118.us.loopexit:                           ; preds = %for.inc115.us
  br label %for.inc118.us

for.inc118.us.loopexit42:                         ; preds = %vector.body13
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit42, %for.inc118.us.loopexit
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond = icmp eq i64 %indvars.iv.next88, 2000
  br i1 %exitcond, label %for.end120, label %for.cond103.preheader.us

for.inc96:                                        ; preds = %for.inc93.us
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond142 = icmp eq i64 %indvars.iv.next96, 2000
  br i1 %exitcond142, label %for.cond103.preheader.us.preheader, label %for.cond73.preheader.lr.ph

for.cond103.preheader.us.preheader:               ; preds = %for.inc96
  %101 = bitcast i8* %call to [2000 x [2000 x double]]*
  %102 = bitcast i8* %call to [2000 x [2000 x double]]*
  %103 = bitcast i8* %call to [2000 x [2000 x double]]*
  %104 = bitcast i8* %call to [2000 x [2000 x double]]*
  %105 = bitcast i8* %call to [2000 x [2000 x double]]*
  %106 = bitcast i8* %call to [2000 x [2000 x double]]*
  %107 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond103.preheader.us

for.end120:                                       ; preds = %for.inc118.us
  tail call void @free(i8* %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry.for.cond1.preheader_crit_edge:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %entry.for.cond1.preheader_crit_edge
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.inc58 ], [ 0, %entry.for.cond1.preheader_crit_edge ]
  %indvars.iv156 = phi i64 [ %indvars.iv.next157, %for.inc58 ], [ 4294967295, %entry.for.cond1.preheader_crit_edge ]
  %0 = sub i64 2000, %indvars.iv7
  %1 = add i64 %0, -4
  %2 = lshr i64 %1, 2
  %3 = sub i64 2000, %indvars.iv7
  %4 = and i64 %indvars.iv156, 4294967295
  %cmp296 = icmp sgt i64 %indvars.iv7, 0
  br i1 %cmp296, label %for.body3.preheader, label %for.body30.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 0
  br label %for.body3

for.body30.preheader:                             ; preds = %for.body30.lr.ph, %for.cond1.preheader
  %min.iters.check = icmp ult i64 %3, 4
  br i1 %min.iters.check, label %for.body30.preheader14, label %min.iters.checked

for.body30.preheader14:                           ; preds = %middle.block, %min.iters.checked, %for.body30.preheader
  %indvars.iv128.ph = phi i64 [ %indvars.iv7, %min.iters.checked ], [ %indvars.iv7, %for.body30.preheader ], [ %ind.end, %middle.block ]
  br label %for.body30

min.iters.checked:                                ; preds = %for.body30.preheader
  %n.vec = and i64 %3, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv7, %n.vec
  br i1 %cmp.zero, label %for.body30.preheader14, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %5 = and i64 %2, 1
  %lcmp.mod22 = icmp eq i64 %5, 0
  br i1 %lcmp.mod22, label %vector.body.prol, label %vector.body.prol.loopexit

vector.body.prol:                                 ; preds = %vector.body.preheader
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv7
  %7 = bitcast double* %6 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %7, align 8
  %8 = getelementptr double, double* %6, i64 2
  %9 = bitcast double* %8 to <2 x i64>*
  %wide.load13.prol = load <2 x i64>, <2 x i64>* %9, align 8
  %10 = bitcast double* %6 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %10, align 8
  %11 = bitcast double* %8 to <2 x i64>*
  store <2 x i64> %wide.load13.prol, <2 x i64>* %11, align 8
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  %12 = icmp eq i64 %2, 0
  br i1 %12, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %13 = add i64 %indvars.iv7, %index
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %13
  %15 = bitcast double* %14 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %15, align 8
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x i64>*
  %wide.load13 = load <2 x i64>, <2 x i64>* %17, align 8
  %18 = bitcast double* %14 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %18, align 8
  %19 = bitcast double* %16 to <2 x i64>*
  store <2 x i64> %wide.load13, <2 x i64>* %19, align 8
  %index.next = add i64 %index, 4
  %20 = add i64 %indvars.iv7, %index.next
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %20
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x i64>*
  %wide.load13.1 = load <2 x i64>, <2 x i64>* %24, align 8
  %25 = bitcast double* %21 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %25, align 8
  %26 = bitcast double* %23 to <2 x i64>*
  store <2 x i64> %wide.load13.1, <2 x i64>* %26, align 8
  %index.next.1 = add i64 %index, 8
  %27 = icmp eq i64 %index.next.1, %n.vec
  br i1 %27, label %middle.block.loopexit, label %vector.body, !llvm.loop !20

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %3, %n.vec
  br i1 %cmp.n, label %for.inc58, label %for.body30.preheader14

for.body30.lr.ph:                                 ; preds = %for.inc25
  %cmp3698 = icmp sgt i64 %indvars.iv7, 0
  br i1 %cmp3698, label %for.body30.us.preheader, label %for.body30.preheader

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %28 = and i64 %indvars.iv156, 1
  %lcmp.mod24 = icmp eq i64 %28, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 0
  %29 = icmp eq i64 %4, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.inc55.us
  %indvars.iv141 = phi i64 [ %indvars.iv.next142, %for.inc55.us ], [ %indvars.iv7, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv141
  %30 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod24, label %for.inc48.us.prol, label %for.inc48.us.prol.loopexit

for.inc48.us.prol:                                ; preds = %for.body30.us
  %31 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv141
  %32 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %31, %32
  %sub47.us.prol = fsub double %30, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  %indvars.iv133.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %w.1100.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %30, %for.body30.us ]
  br i1 %29, label %for.inc55.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %indvars.iv133 = phi i64 [ %indvars.iv133.unr.ph, %for.body30.us.new ], [ %indvars.iv.next134.1, %for.inc48.us ]
  %w.1100.us = phi double [ %w.1100.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv133
  %33 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv133, i64 %indvars.iv141
  %34 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %35 = load <2 x double>, <2 x double>* %33, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next134, i64 %indvars.iv141
  %36 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %34, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %36, i32 1
  %mul46.us = fmul <2 x double> %35, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %w.1100.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %exitcond158.1 = icmp eq i64 %indvars.iv.next134, %4
  %indvars.iv.next134.1 = add nsw i64 %indvars.iv133, 2
  br i1 %exitcond158.1, label %for.inc55.us.loopexit, label %for.inc48.us

for.inc55.us.loopexit:                            ; preds = %for.inc48.us
  br label %for.inc55.us

for.inc55.us:                                     ; preds = %for.inc55.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.inc55.us.loopexit ]
  %arrayidx54.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv141
  store double %sub47.us.lcssa, double* %arrayidx54.us, align 8
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next142, 2000
  br i1 %exitcond10, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv152 = phi i64 [ %indvars.iv.next153, %for.inc25 ], [ 4294967295, %for.body3.preheader ]
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %for.inc25 ], [ 0, %for.body3.preheader ]
  %37 = and i64 %indvars.iv152, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv124
  %38 = load double, double* %arrayidx5, align 8
  %cmp792 = icmp sgt i64 %indvars.iv124, 0
  br i1 %cmp792, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  %39 = and i64 %indvars.iv152, 1
  %lcmp.mod20 = icmp eq i64 %39, 0
  br i1 %lcmp.mod20, label %for.inc.prol, label %for.inc.prol.loopexit

for.inc.prol:                                     ; preds = %for.inc.preheader
  %40 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv124
  %41 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %40, %41
  %sub.prol = fsub double %38, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv118.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %w.094.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %38, %for.inc.preheader ]
  %42 = icmp eq i64 %37, 0
  br i1 %42, label %for.inc25, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv118 = phi i64 [ %indvars.iv118.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next119.1, %for.inc ]
  %w.094 = phi double [ %w.094.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv118
  %43 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv118, i64 %indvars.iv124
  %44 = load double, double* %arrayidx16, align 8
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %45 = load <2 x double>, <2 x double>* %43, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next119, i64 %indvars.iv124
  %46 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %44, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %46, i32 1
  %mul = fmul <2 x double> %45, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.094, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %exitcond154.1 = icmp eq i64 %indvars.iv.next119, %37
  %indvars.iv.next119.1 = add nsw i64 %indvars.iv118, 2
  br i1 %exitcond154.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.body3
  %w.0.lcssa = phi double [ %38, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %indvars.iv124
  %47 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %47
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv124
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %indvars.iv.next153 = add nuw nsw i64 %37, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next125, %indvars.iv7
  br i1 %exitcond9, label %for.body30.lr.ph, label %for.body3

for.body30:                                       ; preds = %for.body30.preheader14, %for.body30
  %indvars.iv128 = phi i64 [ %indvars.iv.next129, %for.body30 ], [ %indvars.iv128.ph, %for.body30.preheader14 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv128
  %48 = bitcast double* %arrayidx34 to i64*
  %49 = load i64, i64* %48, align 8
  %arrayidx54 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv128
  %50 = bitcast double* %arrayidx54 to i64*
  store i64 %49, i64* %50, align 8
  %exitcond155 = icmp eq i64 %indvars.iv128, 1999
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  br i1 %exitcond155, label %for.inc58.loopexit25, label %for.body30, !llvm.loop !21

for.inc58.loopexit:                               ; preds = %for.inc55.us
  br label %for.inc58

for.inc58.loopexit25:                             ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit25, %for.inc58.loopexit, %middle.block
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %indvars.iv.next157 = add nuw nsw i64 %4, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond11, label %for.body63.preheader, label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.inc82
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %for.inc82 ], [ 4294967295, %for.body63.preheader ]
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %for.inc82 ], [ 0, %for.body63.preheader ]
  %51 = and i64 %indvars.iv149, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv116
  %52 = load double, double* %arrayidx65, align 8
  %cmp6785 = icmp sgt i64 %indvars.iv116, 0
  br i1 %cmp6785, label %for.inc77.preheader, label %for.inc82

for.inc77.preheader:                              ; preds = %for.body63
  %53 = add nsw i64 %indvars.iv149, 1
  %xtraiter16 = and i64 %53, 3
  %lcmp.mod17 = icmp eq i64 %xtraiter16, 0
  br i1 %lcmp.mod17, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.preheader
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol, %for.inc77.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %w.287.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %52, %for.inc77.prol.preheader ]
  %prol.iter18 = phi i64 [ %prol.iter18.sub, %for.inc77.prol ], [ %xtraiter16, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv.prol
  %54 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %55 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %54, %55
  %sub76.prol = fsub double %w.287.prol, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter18.sub = add i64 %prol.iter18, -1
  %prol.iter18.cmp = icmp eq i64 %prol.iter18.sub, 0
  br i1 %prol.iter18.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !23

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.preheader
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %for.inc77.preheader ], [ %indvars.iv.next.prol, %for.inc77.prol.loopexit.loopexit ]
  %w.287.unr = phi double [ %52, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %56 = icmp ult i64 %51, 3
  br i1 %56, label %for.inc82, label %for.inc77.preheader.new

for.inc77.preheader.new:                          ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77, %for.inc77.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc77.preheader.new ], [ %indvars.iv.next.3, %for.inc77 ]
  %w.287 = phi double [ %w.287.unr, %for.inc77.preheader.new ], [ %sub76.3, %for.inc77 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv
  %57 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %58 = bitcast double* %arrayidx74 to <2 x double>*
  %59 = load <2 x double>, <2 x double>* %57, align 8
  %60 = load <2 x double>, <2 x double>* %58, align 8
  %mul75 = fmul <2 x double> %59, %60
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %w.287, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv.next.1
  %61 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %62 = bitcast double* %arrayidx74.2 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %63 = load <2 x double>, <2 x double>* %61, align 8
  %64 = load <2 x double>, <2 x double>* %62, align 8
  %mul75.2 = fmul <2 x double> %63, %64
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %exitcond151.3 = icmp eq i64 %indvars.iv.next.2, %51
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond151.3, label %for.inc82.loopexit, label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.inc77.prol.loopexit, %for.body63
  %w.2.lcssa = phi double [ %52, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv116
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %indvars.iv.next150 = add nuw nsw i64 %51, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next117, 2000
  br i1 %exitcond6, label %for.body88.preheader, label %for.body63

for.body88.preheader:                             ; preds = %for.inc82
  %sunkaddr = ptrtoint double* %x to i64
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.inc112
  %indvar = phi i64 [ 0, %for.body88.preheader ], [ %indvar.next, %for.inc112 ]
  %indvars.iv110 = phi i64 [ 2000, %for.body88.preheader ], [ %indvars.iv.next111, %for.inc112 ]
  %65 = add i64 %indvar, -1
  %indvars.iv.next111 = add nsw i64 %indvars.iv110, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next111
  %66 = load double, double* %arrayidx90, align 8
  %cmp9278 = icmp slt i64 %indvars.iv110, 2000
  br i1 %cmp9278, label %for.inc102.preheader, label %for.inc112

for.inc102.preheader:                             ; preds = %for.body88
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.preheader
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol, %for.inc102.prol.preheader
  %indvars.iv108.prol = phi i64 [ %indvars.iv.next109.prol, %for.inc102.prol ], [ %indvars.iv110, %for.inc102.prol.preheader ]
  %w.379.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %66, %for.inc102.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next111, i64 %indvars.iv108.prol
  %67 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv108.prol
  %68 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %67, %68
  %sub101.prol = fsub double %w.379.prol, %mul100.prol
  %indvars.iv.next109.prol = add i64 %indvars.iv108.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !25

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.preheader
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %indvars.iv108.unr = phi i64 [ %indvars.iv110, %for.inc102.preheader ], [ %indvars.iv.next109.prol, %for.inc102.prol.loopexit.loopexit ]
  %w.379.unr = phi double [ %66, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %69 = icmp ult i64 %65, 3
  br i1 %69, label %for.inc112, label %for.inc102.preheader.new

for.inc102.preheader.new:                         ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102, %for.inc102.preheader.new
  %indvars.iv108 = phi i64 [ %indvars.iv108.unr, %for.inc102.preheader.new ], [ %indvars.iv.next109.3, %for.inc102 ]
  %w.379 = phi double [ %w.379.unr, %for.inc102.preheader.new ], [ %sub101.3, %for.inc102 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next111, i64 %indvars.iv108
  %70 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv108
  %71 = bitcast double* %arrayidx99 to <2 x double>*
  %72 = load <2 x double>, <2 x double>* %70, align 8
  %73 = load <2 x double>, <2 x double>* %71, align 8
  %mul100 = fmul <2 x double> %72, %73
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.379, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next109.1 = add i64 %indvars.iv108, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next111, i64 %indvars.iv.next109.1
  %74 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next109.1
  %75 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next109.2 = add i64 %indvars.iv108, 3
  %76 = load <2 x double>, <2 x double>* %74, align 8
  %77 = load <2 x double>, <2 x double>* %75, align 8
  %mul100.2 = fmul <2 x double> %76, %77
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %exitcond.3 = icmp eq i64 %indvars.iv.next109.2, 1999
  %indvars.iv.next109.3 = add i64 %indvars.iv108, 4
  br i1 %exitcond.3, label %for.inc112.loopexit, label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.inc102.prol.loopexit, %for.body88
  %w.3.lcssa = phi double [ %66, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next111, i64 %indvars.iv.next111
  %78 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %78
  %sunkaddr1 = shl i64 %indvars.iv110, 3
  %sunkaddr2 = add i64 %sunkaddr, %sunkaddr1
  %sunkaddr3 = add i64 %sunkaddr2, -8
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to double*
  store double %div109, double* %sunkaddr4, align 8
  %cmp87 = icmp sgt i64 %indvars.iv110, 1
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
