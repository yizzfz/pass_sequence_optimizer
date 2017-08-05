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
define internal fastcc void @init_array([2000 x double]* %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %entry
  %indvars.iv81 = phi i64 [ 0, %entry ], [ %indvars.iv.next82.1, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv81
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv81
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next82 = or i64 %indvars.iv81, 1
  %2 = trunc i64 %indvars.iv.next82 to i32
  %conv4 = sitofp i32 %2 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv81
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next82.1 = add nsw i64 %indvars.iv81, 2
  %3 = trunc i64 %indvars.iv.next82.1 to i32
  %conv4.1 = sitofp i32 %3 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %4 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %4, align 8
  %exitcond104.1 = icmp eq i64 %indvars.iv.next82.1, 2000
  br i1 %exitcond104.1, label %for.inc25.lr.ph.preheader, label %for.inc

for.inc25.lr.ph.preheader:                        ; preds = %for.inc
  br label %for.inc25.lr.ph

for.inc25.lr.ph:                                  ; preds = %for.inc25.lr.ph.preheader, %for.inc44
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %for.inc44 ], [ 0, %for.inc25.lr.ph.preheader ]
  %5 = shl i64 %indvars.iv79, 32
  %sext = add nuw nsw i64 %5, 4294967296
  %6 = ashr exact i64 %sext, 32
  %scevgep77 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv79, i64 %6
  %7 = sub nsw i64 1998, %indvars.iv79
  %8 = shl i64 %7, 3
  %9 = and i64 %8, 34359738360
  br label %for.inc25

for.cond29.preheader:                             ; preds = %for.inc25
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %cmp3018 = icmp slt i64 %indvars.iv.next80, 2000
  br i1 %cmp3018, label %for.inc37.for.inc44_crit_edge, label %for.inc44

for.inc25:                                        ; preds = %for.inc25.for.inc25_crit_edge, %for.inc25.lr.ph
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc25.for.inc25_crit_edge ], [ 0, %for.inc25.lr.ph ]
  %10 = sub nsw i64 0, %indvars.iv63
  %11 = trunc i64 %10 to i32
  %rem = srem i32 %11, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv79, i64 %indvars.iv63
  store double %add20, double* %arrayidx24, align 8
  %exitcond69 = icmp eq i64 %indvars.iv63, %indvars.iv79
  br i1 %exitcond69, label %for.cond29.preheader, label %for.inc25.for.inc25_crit_edge

for.inc25.for.inc25_crit_edge:                    ; preds = %for.inc25
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  br label %for.inc25

for.inc37.for.inc44_crit_edge:                    ; preds = %for.cond29.preheader
  %12 = add nuw nsw i64 %9, 8
  %scevgep7778 = bitcast double* %scevgep77 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep7778, i8 0, i64 %12, i32 8, i1 false)
  br label %for.inc44

for.inc44:                                        ; preds = %for.cond29.preheader, %for.inc37.for.inc44_crit_edge
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv79, i64 %indvars.iv79
  store double 1.000000e+00, double* %arrayidx43, align 8
  %exitcond103 = icmp eq i64 %indvars.iv.next80, 2000
  br i1 %exitcond103, label %for.end46, label %for.inc25.lr.ph

for.end46:                                        ; preds = %for.inc44
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.inc62.loopexit.us

for.inc62.loopexit.us:                            ; preds = %for.inc62.loopexit.us, %for.end46
  %indvars.iv61 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next62.7, %for.inc62.loopexit.us ]
  %13 = mul nuw nsw i64 %indvars.iv61, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next62 = or i64 %indvars.iv61, 1
  %14 = mul nuw nsw i64 %indvars.iv.next62, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next62.1 = or i64 %indvars.iv61, 2
  %15 = mul nuw nsw i64 %indvars.iv.next62.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next62.2 = or i64 %indvars.iv61, 3
  %16 = mul nuw nsw i64 %indvars.iv.next62.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next62.3 = or i64 %indvars.iv61, 4
  %17 = mul nuw nsw i64 %indvars.iv.next62.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next62.4 = or i64 %indvars.iv61, 5
  %18 = mul nuw nsw i64 %indvars.iv.next62.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next62.5 = or i64 %indvars.iv61, 6
  %19 = mul nuw nsw i64 %indvars.iv.next62.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next62.6 = or i64 %indvars.iv61, 7
  %20 = mul nuw nsw i64 %indvars.iv.next62.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next62.7 = add nsw i64 %indvars.iv61, 8
  %exitcond102.7 = icmp eq i64 %indvars.iv.next62.7, 2000
  br i1 %exitcond102.7, label %for.cond69.preheader.lr.ph, label %for.inc62.loopexit.us

for.cond69.preheader.lr.ph:                       ; preds = %for.inc62.loopexit.us
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge: ; preds = %for.inc96.loopexit.us, %for.cond69.preheader.lr.ph
  %indvars.iv55 = phi i64 [ 0, %for.cond69.preheader.lr.ph ], [ %indvars.iv.next56, %for.inc96.loopexit.us ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv55
  %23 = add i64 %indvars.iv55, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %23
  %24 = bitcast double* %scevgep5 to i8*
  %25 = bitcast double* %scevgep3 to i8*
  br label %for.cond73.preheader.us.us

for.inc96.loopexit.us:                            ; preds = %for.inc93.loopexit.us.us
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next56, 2000
  br i1 %exitcond101, label %for.cond103.preheader.lr.ph, label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond73.preheader.us.us:                       ; preds = %for.inc93.loopexit.us.us, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge
  %indvars.iv53 = phi i64 [ 0, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge ], [ %indvars.iv.next54, %for.inc93.loopexit.us.us ]
  %26 = mul i64 %indvars.iv53, 16000
  %scevgep1 = getelementptr i8, i8* %call, i64 %26
  %27 = add i64 %26, 16000
  %scevgep2 = getelementptr i8, i8* %call, i64 %27
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv55
  %bound0 = icmp ult i8* %scevgep1, %24
  %bound1 = icmp ult i8* %25, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx80.us.us to i8*
  %bc7 = bitcast double* %arrayidx80.us.us to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc7
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %for.inc90.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us.us
  %28 = load double, double* %arrayidx80.us.us, align 8, !alias.scope !1
  %29 = insertelement <2 x double> undef, double %28, i32 0
  %30 = shufflevector <2 x double> %29, <2 x double> undef, <2 x i32> zeroinitializer
  %31 = insertelement <2 x double> undef, double %28, i32 0
  %32 = shufflevector <2 x double> %31, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

for.inc90.us.us.preheader:                        ; preds = %for.cond73.preheader.us.us
  br label %for.inc90.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %33 = or i64 %index, 1
  %34 = or i64 %index, 2
  %35 = or i64 %index, 3
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv55
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %33, i64 %indvars.iv55
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %34, i64 %indvars.iv55
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %35, i64 %indvars.iv55
  %40 = load double, double* %36, align 8, !alias.scope !4
  %41 = load double, double* %37, align 8, !alias.scope !4
  %42 = load double, double* %38, align 8, !alias.scope !4
  %43 = load double, double* %39, align 8, !alias.scope !4
  %44 = insertelement <2 x double> undef, double %40, i32 0
  %45 = insertelement <2 x double> %44, double %41, i32 1
  %46 = insertelement <2 x double> undef, double %42, i32 0
  %47 = insertelement <2 x double> %46, double %43, i32 1
  %48 = fmul <2 x double> %30, %45
  %49 = fmul <2 x double> %32, %47
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv53, i64 %index
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !6, !noalias !8
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !6, !noalias !8
  %54 = fadd <2 x double> %wide.load, %48
  %55 = fadd <2 x double> %wide.load12, %49
  %56 = bitcast double* %50 to <2 x double>*
  store <2 x double> %54, <2 x double>* %56, align 8, !alias.scope !6, !noalias !8
  %57 = bitcast double* %52 to <2 x double>*
  store <2 x double> %55, <2 x double>* %57, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %58 = icmp eq i64 %index.next, 2000
  br i1 %58, label %for.inc93.loopexit.us.us.loopexit43, label %vector.body, !llvm.loop !9

for.inc93.loopexit.us.us.loopexit:                ; preds = %for.inc90.us.us
  br label %for.inc93.loopexit.us.us

for.inc93.loopexit.us.us.loopexit43:              ; preds = %vector.body
  br label %for.inc93.loopexit.us.us

for.inc93.loopexit.us.us:                         ; preds = %for.inc93.loopexit.us.us.loopexit43, %for.inc93.loopexit.us.us.loopexit
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next54, 2000
  br i1 %exitcond100, label %for.inc96.loopexit.us, label %for.cond73.preheader.us.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us.preheader, %for.inc90.us.us.for.inc90.us.us_crit_edge
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.inc90.us.us.for.inc90.us.us_crit_edge ], [ 0, %for.inc90.us.us.preheader ]
  %59 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv55
  %60 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %59, %60
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv53, i64 %indvars.iv49
  %61 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %61, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %exitcond99 = icmp eq i64 %indvars.iv49, 1999
  br i1 %exitcond99, label %for.inc93.loopexit.us.us.loopexit, label %for.inc90.us.us.for.inc90.us.us_crit_edge, !llvm.loop !12

for.inc90.us.us.for.inc90.us.us_crit_edge:        ; preds = %for.inc90.us.us
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  br label %for.inc90.us.us

for.cond103.preheader.lr.ph:                      ; preds = %for.inc96.loopexit.us
  %62 = bitcast i8* %call to [2000 x [2000 x double]]*
  %63 = bitcast i8* %call to [2000 x [2000 x double]]*
  %64 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond103.preheader.us

for.cond103.preheader.us:                         ; preds = %for.inc118.loopexit.us, %for.cond103.preheader.lr.ph
  %indvars.iv47 = phi i64 [ 0, %for.cond103.preheader.lr.ph ], [ %indvars.iv.next48, %for.inc118.loopexit.us ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %65 = add i64 %indvars.iv47, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %A, i64 %65, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %66 = mul i64 %indvars.iv47, 16000
  %scevgep22 = getelementptr i8, i8* %call, i64 %66
  %67 = add i64 %66, 16000
  %scevgep23 = getelementptr i8, i8* %call, i64 %67
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
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %63, i64 0, i64 %indvars.iv47, i64 %index30
  %69 = bitcast double* %68 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %69, align 8, !alias.scope !13
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %71, align 8, !alias.scope !13
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %index30
  %73 = bitcast double* %72 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %73, align 8, !alias.scope !16, !noalias !13
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %75, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %64, i64 0, i64 %indvars.iv47, i64 %index.next31
  %77 = bitcast double* %76 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !13
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !13
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %index.next31
  %81 = bitcast double* %80 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %81, align 8, !alias.scope !16, !noalias !13
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %83, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %84 = icmp eq i64 %index.next31.1, 2000
  br i1 %84, label %for.inc118.loopexit.us.loopexit42, label %vector.body13, !llvm.loop !18

for.inc115.us:                                    ; preds = %for.inc115.us.preheader, %for.inc115.us.for.inc115.us_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc115.us.for.inc115.us_crit_edge ], [ 0, %for.inc115.us.preheader ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %62, i64 0, i64 %indvars.iv47, i64 %indvars.iv
  %85 = bitcast double* %arrayidx110.us to i64*
  %86 = load i64, i64* %85, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv
  %87 = bitcast double* %arrayidx114.us to i64*
  store i64 %86, i64* %87, align 8
  %exitcond98 = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond98, label %for.inc118.loopexit.us.loopexit, label %for.inc115.us.for.inc115.us_crit_edge, !llvm.loop !19

for.inc115.us.for.inc115.us_crit_edge:            ; preds = %for.inc115.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc115.us

for.inc118.loopexit.us.loopexit:                  ; preds = %for.inc115.us
  br label %for.inc118.loopexit.us

for.inc118.loopexit.us.loopexit42:                ; preds = %vector.body13
  br label %for.inc118.loopexit.us

for.inc118.loopexit.us:                           ; preds = %for.inc118.loopexit.us.loopexit42, %for.inc118.loopexit.us.loopexit
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond = icmp eq i64 %indvars.iv.next48, 2000
  br i1 %exitcond, label %for.end120, label %for.cond103.preheader.us

for.end120:                                       ; preds = %for.inc118.loopexit.us
  tail call void @free(i8* %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58.for.cond1.preheader_crit_edge, %entry
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %for.inc58.for.cond1.preheader_crit_edge ], [ 4294967295, %entry ]
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.inc58.for.cond1.preheader_crit_edge ], [ 0, %entry ]
  %0 = sub i64 2000, %indvars.iv68
  %1 = add i64 %0, -4
  %2 = lshr i64 %1, 2
  %3 = sub i64 2000, %indvars.iv68
  %4 = and i64 %indvars.iv81, 4294967295
  %cmp220 = icmp sgt i64 %indvars.iv68, 0
  br i1 %cmp220, label %for.body3.preheader, label %for.body30.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader
  br label %for.body3

for.body30.preheader:                             ; preds = %for.body30.lr.ph, %for.cond1.preheader
  %min.iters.check = icmp ult i64 %3, 4
  br i1 %min.iters.check, label %for.body30.preheader7, label %min.iters.checked

for.body30.preheader7:                            ; preds = %middle.block, %min.iters.checked, %for.body30.preheader
  %indvars.iv53.ph = phi i64 [ %ind.end, %middle.block ], [ %indvars.iv68, %min.iters.checked ], [ %indvars.iv68, %for.body30.preheader ]
  br label %for.body30

min.iters.checked:                                ; preds = %for.body30.preheader
  %n.vec = and i64 %3, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv68, %n.vec
  br i1 %cmp.zero, label %for.body30.preheader7, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %5 = and i64 %2, 1
  %lcmp.mod = icmp eq i64 %5, 0
  br i1 %lcmp.mod, label %vector.body.prol, label %vector.body.prol.loopexit

vector.body.prol:                                 ; preds = %vector.body.preheader
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 %indvars.iv68
  %7 = bitcast double* %6 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %7, align 8
  %8 = getelementptr double, double* %6, i64 2
  %9 = bitcast double* %8 to <2 x i64>*
  %wide.load2.prol = load <2 x i64>, <2 x i64>* %9, align 8
  %10 = bitcast double* %6 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %10, align 8
  %11 = bitcast double* %8 to <2 x i64>*
  store <2 x i64> %wide.load2.prol, <2 x i64>* %11, align 8
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  %12 = icmp eq i64 %2, 0
  br i1 %12, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %13 = add i64 %indvars.iv68, %index
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 %13
  %15 = bitcast double* %14 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %15, align 8
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x i64>*
  %wide.load2 = load <2 x i64>, <2 x i64>* %17, align 8
  %18 = bitcast double* %14 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %18, align 8
  %19 = bitcast double* %16 to <2 x i64>*
  store <2 x i64> %wide.load2, <2 x i64>* %19, align 8
  %index.next = add i64 %index, 4
  %20 = add i64 %indvars.iv68, %index.next
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 %20
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x i64>*
  %wide.load2.1 = load <2 x i64>, <2 x i64>* %24, align 8
  %25 = bitcast double* %21 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %25, align 8
  %26 = bitcast double* %23 to <2 x i64>*
  store <2 x i64> %wide.load2.1, <2 x i64>* %26, align 8
  %index.next.1 = add i64 %index, 8
  %27 = icmp eq i64 %index.next.1, %n.vec
  br i1 %27, label %middle.block.loopexit, label %vector.body, !llvm.loop !20

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %3, %n.vec
  br i1 %cmp.n, label %for.inc58, label %for.body30.preheader7

for.body30.lr.ph:                                 ; preds = %for.inc25
  %cmp3622 = icmp sgt i64 %indvars.iv68, 0
  br i1 %cmp3622, label %for.body30.us.preheader, label %for.body30.preheader

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.inc55.loopexit.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.inc55.loopexit.us ], [ %indvars.iv68, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 %indvars.iv66
  %28 = load double, double* %arrayidx34.us, align 8
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.for.inc48.us_crit_edge, %for.body30.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.inc48.us.for.inc48.us_crit_edge ], [ 0, %for.body30.us ]
  %w.124.us = phi double [ %sub47.us, %for.inc48.us.for.inc48.us_crit_edge ], [ %28, %for.body30.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 %indvars.iv58
  %29 = load double, double* %arrayidx41.us, align 8
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv66
  %30 = load double, double* %arrayidx45.us, align 8
  %mul46.us = fmul double %29, %30
  %sub47.us = fsub double %w.124.us, %mul46.us
  %exitcond83 = icmp eq i64 %indvars.iv58, %4
  br i1 %exitcond83, label %for.inc55.loopexit.us, label %for.inc48.us.for.inc48.us_crit_edge

for.inc48.us.for.inc48.us_crit_edge:              ; preds = %for.inc48.us
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  br label %for.inc48.us

for.inc55.loopexit.us:                            ; preds = %for.inc48.us
  %arrayidx54.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 %indvars.iv66
  store double %sub47.us, double* %arrayidx54.us, align 8
  %indvars.iv.next67 = add nuw i64 %indvars.iv66, 1
  %cmp29.us = icmp slt i64 %indvars.iv.next67, 2000
  br i1 %cmp29.us, label %for.body30.us, label %for.inc58.loopexit

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25.for.body3_crit_edge
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %for.inc25.for.body3_crit_edge ], [ 4294967295, %for.body3.preheader ]
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.inc25.for.body3_crit_edge ], [ 0, %for.body3.preheader ]
  %31 = and i64 %indvars.iv77, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 %indvars.iv49
  %32 = load double, double* %arrayidx5, align 8
  %cmp716 = icmp sgt i64 %indvars.iv49, 0
  br i1 %cmp716, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc.for.inc_crit_edge
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %for.inc.for.inc_crit_edge ], [ 0, %for.inc.preheader ]
  %w.018 = phi double [ %sub, %for.inc.for.inc_crit_edge ], [ %32, %for.inc.preheader ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 %indvars.iv43
  %33 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv43, i64 %indvars.iv49
  %34 = load double, double* %arrayidx16, align 8
  %mul = fmul double %33, %34
  %sub = fsub double %w.018, %mul
  %exitcond79 = icmp eq i64 %indvars.iv43, %31
  br i1 %exitcond79, label %for.inc25.loopexit, label %for.inc.for.inc_crit_edge

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  br label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.body3
  %w.0.lcssa = phi double [ %32, %for.body3 ], [ %sub, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv49
  %35 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %35
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 %indvars.iv49
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next50 = add nuw i64 %indvars.iv49, 1
  %cmp2 = icmp slt i64 %indvars.iv.next50, %indvars.iv68
  br i1 %cmp2, label %for.inc25.for.body3_crit_edge, label %for.body30.lr.ph

for.inc25.for.body3_crit_edge:                    ; preds = %for.inc25
  %indvars.iv.next78 = add nuw nsw i64 %31, 1
  br label %for.body3

for.body30:                                       ; preds = %for.body30.preheader7, %for.body30.for.body30_crit_edge
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %for.body30.for.body30_crit_edge ], [ %indvars.iv53.ph, %for.body30.preheader7 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 %indvars.iv53
  %36 = bitcast double* %arrayidx34 to i64*
  %37 = load i64, i64* %36, align 8
  %arrayidx54 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 %indvars.iv53
  %38 = bitcast double* %arrayidx54 to i64*
  store i64 %37, i64* %38, align 8
  %exitcond80 = icmp eq i64 %indvars.iv53, 1999
  br i1 %exitcond80, label %for.inc58.loopexit9, label %for.body30.for.body30_crit_edge, !llvm.loop !21

for.body30.for.body30_crit_edge:                  ; preds = %for.body30
  %indvars.iv.next54 = add nuw i64 %indvars.iv53, 1
  br label %for.body30

for.inc58.loopexit:                               ; preds = %for.inc55.loopexit.us
  br label %for.inc58

for.inc58.loopexit9:                              ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit9, %for.inc58.loopexit, %middle.block
  %indvars.iv.next69 = add nuw i64 %indvars.iv68, 1
  %cmp = icmp slt i64 %indvars.iv.next69, 2000
  br i1 %cmp, label %for.inc58.for.cond1.preheader_crit_edge, label %for.body63.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.inc58.for.cond1.preheader_crit_edge:          ; preds = %for.inc58
  %indvars.iv.next82 = add nuw nsw i64 %4, 1
  br label %for.cond1.preheader

for.body63:                                       ; preds = %for.body63.preheader, %for.inc82.for.body63_crit_edge
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %for.inc82.for.body63_crit_edge ], [ 4294967295, %for.body63.preheader ]
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %for.inc82.for.body63_crit_edge ], [ 0, %for.body63.preheader ]
  %39 = and i64 %indvars.iv74, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv41
  %40 = load double, double* %arrayidx65, align 8
  %cmp679 = icmp sgt i64 %indvars.iv41, 0
  br i1 %cmp679, label %for.inc77.preheader, label %for.inc82

for.inc77.preheader:                              ; preds = %for.body63
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77.preheader, %for.inc77.for.inc77_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc77.for.inc77_crit_edge ], [ 0, %for.inc77.preheader ]
  %w.211 = phi double [ %sub76, %for.inc77.for.inc77_crit_edge ], [ %40, %for.inc77.preheader ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv41, i64 %indvars.iv
  %41 = load double, double* %arrayidx72, align 8
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %42 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %41, %42
  %sub76 = fsub double %w.211, %mul75
  %exitcond76 = icmp eq i64 %indvars.iv, %39
  br i1 %exitcond76, label %for.inc82.loopexit, label %for.inc77.for.inc77_crit_edge

for.inc77.for.inc77_crit_edge:                    ; preds = %for.inc77
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.body63
  %w.2.lcssa = phi double [ %40, %for.body63 ], [ %sub76, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv41
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next42 = add nuw i64 %indvars.iv41, 1
  %cmp62 = icmp slt i64 %indvars.iv.next42, 2000
  br i1 %cmp62, label %for.inc82.for.body63_crit_edge, label %for.body88.preheader

for.body88.preheader:                             ; preds = %for.inc82
  %sunkaddr = ptrtoint double* %x to i64
  br label %for.body88

for.inc82.for.body63_crit_edge:                   ; preds = %for.inc82
  %indvars.iv.next75 = add nuw nsw i64 %39, 1
  br label %for.body63

for.body88:                                       ; preds = %for.body88.preheader, %for.inc112
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %for.inc112 ], [ 2000, %for.body88.preheader ]
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next36
  %43 = load double, double* %arrayidx90, align 8
  %cmp922 = icmp slt i64 %indvars.iv35, 2000
  br i1 %cmp922, label %for.inc102.preheader, label %for.inc112

for.inc102.preheader:                             ; preds = %for.body88
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102.preheader, %for.inc102.for.inc102_crit_edge
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.inc102.for.inc102_crit_edge ], [ %indvars.iv35, %for.inc102.preheader ]
  %w.33 = phi double [ %sub101, %for.inc102.for.inc102_crit_edge ], [ %43, %for.inc102.preheader ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next36, i64 %indvars.iv33
  %44 = load double, double* %arrayidx97, align 8
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv33
  %45 = load double, double* %arrayidx99, align 8
  %mul100 = fmul double %44, %45
  %sub101 = fsub double %w.33, %mul100
  %exitcond = icmp eq i64 %indvars.iv33, 1999
  br i1 %exitcond, label %for.inc112.loopexit, label %for.inc102.for.inc102_crit_edge

for.inc102.for.inc102_crit_edge:                  ; preds = %for.inc102
  %indvars.iv.next34 = add i64 %indvars.iv33, 1
  br label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.body88
  %w.3.lcssa = phi double [ %43, %for.body88 ], [ %sub101, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next36, i64 %indvars.iv.next36
  %46 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %46
  %sunkaddr3 = shl i64 %indvars.iv35, 3
  %sunkaddr4 = add i64 %sunkaddr, %sunkaddr3
  %sunkaddr5 = add i64 %sunkaddr4, -8
  %sunkaddr6 = inttoptr i64 %sunkaddr5 to double*
  store double %div109, double* %sunkaddr6, align 8
  %cmp87 = icmp sgt i64 %indvars.iv35, 1
  br i1 %cmp87, label %for.body88, label %for.end113

for.end113:                                       ; preds = %for.inc112
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

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
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
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
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
