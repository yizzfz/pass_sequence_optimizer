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
  %1 = bitcast i8* %call2 to double*
  tail call fastcc void @print_array(double* %1)
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
  %indvars.iv123 = phi i64 [ 0, %entry ], [ %indvars.iv.next124.1, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv123
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv123
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next124 = or i64 %indvars.iv123, 1
  %2 = trunc i64 %indvars.iv.next124 to i32
  %conv4 = sitofp i32 %2 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv123
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  %3 = trunc i64 %indvars.iv.next124.1 to i32
  %conv4.1 = sitofp i32 %3 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %4 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %4, align 8
  %exitcond147.1 = icmp eq i64 %indvars.iv.next124, 1999
  br i1 %exitcond147.1, label %for.inc25.lr.ph.preheader, label %for.inc

for.inc25.lr.ph.preheader:                        ; preds = %for.inc
  br label %for.inc25.lr.ph

for.inc25.lr.ph:                                  ; preds = %for.inc25.lr.ph.preheader, %for.inc44
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %for.inc44 ], [ 0, %for.inc25.lr.ph.preheader ]
  %5 = shl i64 %indvars.iv121, 32
  %sext = add nuw nsw i64 %5, 4294967296
  %6 = ashr exact i64 %sext, 32
  %7 = sub nsw i64 1998, %indvars.iv121
  %8 = shl i64 %7, 3
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25, %for.inc25.lr.ph
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %for.inc25 ], [ 0, %for.inc25.lr.ph ]
  %9 = sub nsw i64 0, %indvars.iv105
  %10 = trunc i64 %9 to i32
  %rem = srem i32 %10, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %indvars.iv105
  store double %add20, double* %arrayidx24, align 8
  %exitcond111 = icmp eq i64 %indvars.iv105, %indvars.iv121
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  br i1 %exitcond111, label %for.end27, label %for.inc25

for.end27:                                        ; preds = %for.inc25
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %cmp3046 = icmp slt i64 %indvars.iv.next122, 2000
  br i1 %cmp3046, label %for.inc37.for.inc44_crit_edge, label %for.inc44

for.inc37.for.inc44_crit_edge:                    ; preds = %for.end27
  %11 = and i64 %8, 34359738360
  %scevgep119 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %6
  %12 = add nuw nsw i64 %11, 8
  %scevgep119120 = bitcast double* %scevgep119 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep119120, i8 0, i64 %12, i32 8, i1 false)
  br label %for.inc44

for.inc44:                                        ; preds = %for.end27, %for.inc37.for.inc44_crit_edge
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %indvars.iv121
  store double 1.000000e+00, double* %arrayidx43, align 8
  %exitcond146 = icmp eq i64 %indvars.iv.next122, 2000
  br i1 %exitcond146, label %for.end46, label %for.inc25.lr.ph

for.end46:                                        ; preds = %for.inc44
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us, %for.end46
  %indvars.iv103 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next104.7, %for.inc62.us ]
  %13 = mul nuw nsw i64 %indvars.iv103, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next104 = or i64 %indvars.iv103, 1
  %14 = mul nuw nsw i64 %indvars.iv.next104, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next104.1 = or i64 %indvars.iv103, 2
  %15 = mul nuw nsw i64 %indvars.iv.next104.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next104.2 = or i64 %indvars.iv103, 3
  %16 = mul nuw nsw i64 %indvars.iv.next104.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next104.3 = or i64 %indvars.iv103, 4
  %17 = mul nuw nsw i64 %indvars.iv.next104.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next104.4 = or i64 %indvars.iv103, 5
  %18 = mul nuw nsw i64 %indvars.iv.next104.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next104.5 = or i64 %indvars.iv103, 6
  %19 = mul nuw nsw i64 %indvars.iv.next104.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next104.6 = or i64 %indvars.iv103, 7
  %20 = mul nuw nsw i64 %indvars.iv.next104.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next104.7 = add nsw i64 %indvars.iv103, 8
  %exitcond145.7 = icmp eq i64 %indvars.iv.next104.7, 2000
  br i1 %exitcond145.7, label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader, label %for.inc62.us

for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader: ; preds = %for.inc62.us
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  %23 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge: ; preds = %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader, %for.inc96.us
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %for.inc96.us ], [ 0, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv97
  %24 = add i64 %indvars.iv97, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %24
  %25 = bitcast double* %scevgep5 to i8*
  %26 = bitcast double* %scevgep3 to i8*
  br label %for.cond73.preheader.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond144 = icmp eq i64 %indvars.iv.next98, 2000
  br i1 %exitcond144, label %for.cond103.preheader.us.preheader, label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond103.preheader.us.preheader:               ; preds = %for.inc96.us
  %27 = bitcast i8* %call to [2000 x [2000 x double]]*
  %28 = bitcast i8* %call to [2000 x [2000 x double]]*
  %29 = bitcast i8* %call to [2000 x [2000 x double]]*
  %30 = bitcast i8* %call to [2000 x [2000 x double]]*
  %31 = bitcast i8* %call to [2000 x [2000 x double]]*
  %32 = bitcast i8* %call to [2000 x [2000 x double]]*
  %33 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond103.preheader.us

for.cond73.preheader.us.us:                       ; preds = %for.inc93.us.us, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge
  %indvars.iv95 = phi i64 [ 0, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge ], [ %indvars.iv.next96, %for.inc93.us.us ]
  %34 = mul i64 %indvars.iv95, 16000
  %scevgep1 = getelementptr i8, i8* %call, i64 %34
  %35 = add i64 %34, 16000
  %scevgep2 = getelementptr i8, i8* %call, i64 %35
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv97
  %bound0 = icmp ult i8* %scevgep1, %25
  %bound1 = icmp ult i8* %26, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx80.us.us to i8*
  %bc7 = bitcast double* %arrayidx80.us.us to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc7
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %for.inc90.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us.us
  br label %vector.body

for.inc90.us.us.preheader:                        ; preds = %for.cond73.preheader.us.us
  br label %for.inc90.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %36 = or i64 %index, 1
  %37 = or i64 %index, 2
  %38 = or i64 %index, 3
  %39 = load double, double* %arrayidx80.us.us, align 8, !alias.scope !1
  %40 = insertelement <2 x double> undef, double %39, i32 0
  %41 = shufflevector <2 x double> %40, <2 x double> undef, <2 x i32> zeroinitializer
  %42 = insertelement <2 x double> undef, double %39, i32 0
  %43 = shufflevector <2 x double> %42, <2 x double> undef, <2 x i32> zeroinitializer
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv97
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %36, i64 %indvars.iv97
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %37, i64 %indvars.iv97
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %38, i64 %indvars.iv97
  %48 = load double, double* %44, align 8, !alias.scope !4
  %49 = load double, double* %45, align 8, !alias.scope !4
  %50 = load double, double* %46, align 8, !alias.scope !4
  %51 = load double, double* %47, align 8, !alias.scope !4
  %52 = insertelement <2 x double> undef, double %48, i32 0
  %53 = insertelement <2 x double> %52, double %49, i32 1
  %54 = insertelement <2 x double> undef, double %50, i32 0
  %55 = insertelement <2 x double> %54, double %51, i32 1
  %56 = fmul <2 x double> %41, %53
  %57 = fmul <2 x double> %43, %55
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv95, i64 %index
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !6, !noalias !8
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !6, !noalias !8
  %62 = fadd <2 x double> %56, %wide.load
  %63 = fadd <2 x double> %57, %wide.load12
  %64 = bitcast double* %58 to <2 x double>*
  store <2 x double> %62, <2 x double>* %64, align 8, !alias.scope !6, !noalias !8
  %65 = bitcast double* %60 to <2 x double>*
  store <2 x double> %63, <2 x double>* %65, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %66 = icmp eq i64 %index.next, 2000
  br i1 %66, label %for.inc93.us.us.loopexit43, label %vector.body, !llvm.loop !9

for.inc93.us.us.loopexit:                         ; preds = %for.inc90.us.us
  br label %for.inc93.us.us

for.inc93.us.us.loopexit43:                       ; preds = %vector.body
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit43, %for.inc93.us.us.loopexit
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond143 = icmp eq i64 %indvars.iv.next96, 2000
  br i1 %exitcond143, label %for.inc96.us, label %for.cond73.preheader.us.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us, %for.inc90.us.us.preheader
  %indvars.iv91 = phi i64 [ 0, %for.inc90.us.us.preheader ], [ %indvars.iv.next92.1, %for.inc90.us.us ]
  %67 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv97
  %68 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %67, %68
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv95, i64 %indvars.iv91
  %69 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %mul.us.us, %69
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next92 = or i64 %indvars.iv91, 1
  %70 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next92, i64 %indvars.iv97
  %71 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %70, %71
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next92
  %72 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %mul.us.us.1, %72
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %exitcond142.1 = icmp eq i64 %indvars.iv.next92, 1999
  %indvars.iv.next92.1 = add nsw i64 %indvars.iv91, 2
  br i1 %exitcond142.1, label %for.inc93.us.us.loopexit, label %for.inc90.us.us, !llvm.loop !12

for.cond103.preheader.us:                         ; preds = %for.cond103.preheader.us.preheader, %for.inc118.us
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %for.inc118.us ], [ 0, %for.cond103.preheader.us.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %73 = add i64 %indvars.iv89, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %A, i64 %73, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %74 = mul i64 %indvars.iv89, 16000
  %scevgep22 = getelementptr i8, i8* %call, i64 %74
  %75 = add i64 %74, 16000
  %scevgep23 = getelementptr i8, i8* %call, i64 %75
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
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv89, i64 %index30
  %77 = bitcast double* %76 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !13
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !13
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %index30
  %81 = bitcast double* %80 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %81, align 8, !alias.scope !16, !noalias !13
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %83, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv89, i64 %index.next31
  %85 = bitcast double* %84 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %85, align 8, !alias.scope !13
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %87, align 8, !alias.scope !13
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %index.next31
  %89 = bitcast double* %88 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %89, align 8, !alias.scope !16, !noalias !13
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %91, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %92 = icmp eq i64 %index.next31.1, 2000
  br i1 %92, label %for.inc118.us.loopexit42, label %vector.body13, !llvm.loop !18

for.inc115.us:                                    ; preds = %for.inc115.us, %for.inc115.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc115.us.preheader ], [ %indvars.iv.next.4, %for.inc115.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv89, i64 %indvars.iv
  %93 = bitcast double* %arrayidx110.us to i64*
  %94 = load i64, i64* %93, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv
  %95 = bitcast double* %arrayidx114.us to i64*
  store i64 %94, i64* %95, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next
  %96 = bitcast double* %arrayidx110.us.1 to i64*
  %97 = load i64, i64* %96, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv.next
  %98 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %97, i64* %98, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next.1
  %99 = bitcast double* %arrayidx110.us.2 to i64*
  %100 = load i64, i64* %99, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv.next.1
  %101 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %100, i64* %101, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next.2
  %102 = bitcast double* %arrayidx110.us.3 to i64*
  %103 = load i64, i64* %102, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv.next.2
  %104 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %103, i64* %104, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx110.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next.3
  %105 = bitcast double* %arrayidx110.us.4 to i64*
  %106 = load i64, i64* %105, align 8
  %arrayidx114.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv.next.3
  %107 = bitcast double* %arrayidx114.us.4 to i64*
  store i64 %106, i64* %107, align 8
  %exitcond141.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond141.4, label %for.inc118.us.loopexit, label %for.inc115.us, !llvm.loop !19

for.inc118.us.loopexit:                           ; preds = %for.inc115.us
  br label %for.inc118.us

for.inc118.us.loopexit42:                         ; preds = %vector.body13
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit42, %for.inc118.us.loopexit
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond = icmp eq i64 %indvars.iv.next90, 2000
  br i1 %exitcond, label %for.end120, label %for.cond103.preheader.us

for.end120:                                       ; preds = %for.inc118.us
  tail call void @free(i8* %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %entry
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc58 ], [ 0, %entry ]
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %for.inc58 ], [ 4294967295, %entry ]
  %0 = and i64 %indvars.iv82, 4294967295
  %cmp225 = icmp sgt i64 %indvars.iv2, 0
  br i1 %cmp225, label %for.body3.preheader, label %for.inc58

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 0
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %for.inc25 ], [ 4294967295, %for.body3.preheader ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.inc25 ], [ 0, %for.body3.preheader ]
  %1 = and i64 %indvars.iv79, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv58
  %2 = load double, double* %arrayidx5, align 8
  %cmp723 = icmp sgt i64 %indvars.iv58, 0
  br i1 %cmp723, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  %3 = and i64 %indvars.iv79, 1
  %lcmp.mod12 = icmp eq i64 %3, 0
  br i1 %lcmp.mod12, label %for.inc.prol, label %for.inc.prol.loopexit

for.inc.prol:                                     ; preds = %for.inc.preheader
  %4 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv58
  %5 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %4, %5
  %sub.prol = fsub double %2, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv52.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %.unr13.ph = phi double [ %sub.prol, %for.inc.prol ], [ %2, %for.inc.preheader ]
  %6 = icmp eq i64 %1, 0
  br i1 %6, label %for.inc25, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv52 = phi i64 [ %indvars.iv52.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next53.1, %for.inc ]
  %7 = phi double [ %.unr13.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv52
  %8 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv58
  %9 = load double, double* %arrayidx16, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %10 = load <2 x double>, <2 x double>* %8, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next53, i64 %indvars.iv58
  %11 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %9, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %11, i32 1
  %mul = fmul <2 x double> %10, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %7, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %exitcond81.1 = icmp eq i64 %indvars.iv.next53, %1
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  br i1 %exitcond81.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.body3
  %.lcssa10 = phi double [ %2, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv58
  %12 = load double, double* %arrayidx20, align 8
  %div = fdiv double %.lcssa10, %12
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %indvars.iv.next80 = add nuw nsw i64 %1, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next59, %indvars.iv2
  br i1 %exitcond4, label %for.body30.lr.ph, label %for.body3

for.body30.lr.ph:                                 ; preds = %for.inc25
  %cmp3627 = icmp sgt i64 %indvars.iv2, 0
  br i1 %cmp3627, label %for.body30.us.preheader, label %for.inc58

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %13 = and i64 %indvars.iv82, 1
  %lcmp.mod15 = icmp eq i64 %13, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 0
  %14 = icmp eq i64 %0, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond35.for.inc55_crit_edge.us
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %for.cond35.for.inc55_crit_edge.us ], [ %indvars.iv2, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv69
  %15 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod15, label %for.inc48.us.prol, label %for.inc48.us.prol.loopexit

for.inc48.us.prol:                                ; preds = %for.body30.us
  %16 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv69
  %17 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %16, %17
  %sub47.us.prol = fsub double %15, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  %indvars.iv61.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %.unr16.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %15, %for.body30.us ]
  br i1 %14, label %for.cond35.for.inc55_crit_edge.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %indvars.iv61 = phi i64 [ %indvars.iv61.unr.ph, %for.body30.us.new ], [ %indvars.iv.next62.1, %for.inc48.us ]
  %18 = phi double [ %.unr16.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv61
  %19 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv61, i64 %indvars.iv69
  %20 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %21 = load <2 x double>, <2 x double>* %19, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next62, i64 %indvars.iv69
  %22 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %20, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %22, i32 1
  %mul46.us = fmul <2 x double> %21, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %18, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %exitcond84.1 = icmp eq i64 %indvars.iv.next62, %0
  %indvars.iv.next62.1 = add nsw i64 %indvars.iv61, 2
  br i1 %exitcond84.1, label %for.cond35.for.inc55_crit_edge.us.loopexit, label %for.inc48.us

for.cond35.for.inc55_crit_edge.us.loopexit:       ; preds = %for.inc48.us
  br label %for.cond35.for.inc55_crit_edge.us

for.cond35.for.inc55_crit_edge.us:                ; preds = %for.cond35.for.inc55_crit_edge.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.cond35.for.inc55_crit_edge.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next70, 2000
  br i1 %exitcond5, label %for.inc58.loopexit, label %for.body30.us

for.inc58.loopexit:                               ; preds = %for.cond35.for.inc55_crit_edge.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.cond1.preheader, %for.body30.lr.ph
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %indvars.iv.next83 = add nuw nsw i64 %0, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond6, label %for.body63.preheader, label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.inc82
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %for.inc82 ], [ 4294967295, %for.body63.preheader ]
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.inc82 ], [ 0, %for.body63.preheader ]
  %23 = and i64 %indvars.iv76, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv50
  %24 = bitcast double* %arrayidx65 to i64*
  %25 = load i64, i64* %24, align 8
  %cmp6720 = icmp sgt i64 %indvars.iv50, 0
  br i1 %cmp6720, label %for.body63.for.inc77_crit_edge, label %for.inc82

for.body63.for.inc77_crit_edge:                   ; preds = %for.body63
  %26 = bitcast i64 %25 to double
  %27 = add nsw i64 %indvars.iv76, 1
  %xtraiter7 = and i64 %27, 3
  %lcmp.mod8 = icmp eq i64 %xtraiter7, 0
  br i1 %lcmp.mod8, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.body63.for.inc77_crit_edge
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol, %for.inc77.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %28 = phi double [ %sub76.prol, %for.inc77.prol ], [ %26, %for.inc77.prol.preheader ]
  %prol.iter9 = phi i64 [ %prol.iter9.sub, %for.inc77.prol ], [ %xtraiter7, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv.prol
  %29 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %30 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %29, %30
  %sub76.prol = fsub double %28, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter9.sub = add i64 %prol.iter9, -1
  %prol.iter9.cmp = icmp eq i64 %prol.iter9.sub, 0
  br i1 %prol.iter9.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !20

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.body63.for.inc77_crit_edge
  %sub76.lcssa.unr = phi double [ undef, %for.body63.for.inc77_crit_edge ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %for.body63.for.inc77_crit_edge ], [ %indvars.iv.next.prol, %for.inc77.prol.loopexit.loopexit ]
  %.unr10 = phi double [ %26, %for.body63.for.inc77_crit_edge ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %31 = icmp ult i64 %23, 3
  br i1 %31, label %for.cond66.for.inc82_crit_edge, label %for.body63.for.inc77_crit_edge.new

for.body63.for.inc77_crit_edge.new:               ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77, %for.body63.for.inc77_crit_edge.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body63.for.inc77_crit_edge.new ], [ %indvars.iv.next.3, %for.inc77 ]
  %32 = phi double [ %.unr10, %for.body63.for.inc77_crit_edge.new ], [ %sub76.3, %for.inc77 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv
  %33 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %34 = bitcast double* %arrayidx74 to <2 x double>*
  %35 = load <2 x double>, <2 x double>* %33, align 8
  %36 = load <2 x double>, <2 x double>* %34, align 8
  %mul75 = fmul <2 x double> %35, %36
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %32, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv.next.1
  %37 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %38 = bitcast double* %arrayidx74.2 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %39 = load <2 x double>, <2 x double>* %37, align 8
  %40 = load <2 x double>, <2 x double>* %38, align 8
  %mul75.2 = fmul <2 x double> %39, %40
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %exitcond78.3 = icmp eq i64 %indvars.iv.next.2, %23
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond78.3, label %for.cond66.for.inc82_crit_edge.loopexit, label %for.inc77

for.cond66.for.inc82_crit_edge.loopexit:          ; preds = %for.inc77
  br label %for.cond66.for.inc82_crit_edge

for.cond66.for.inc82_crit_edge:                   ; preds = %for.cond66.for.inc82_crit_edge.loopexit, %for.inc77.prol.loopexit
  %sub76.lcssa = phi double [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.cond66.for.inc82_crit_edge.loopexit ]
  %41 = bitcast double %sub76.lcssa to i64
  br label %for.inc82

for.inc82:                                        ; preds = %for.body63, %for.cond66.for.inc82_crit_edge
  %.lcssa9 = phi i64 [ %41, %for.cond66.for.inc82_crit_edge ], [ %25, %for.body63 ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv50
  %42 = bitcast double* %arrayidx81 to i64*
  store i64 %.lcssa9, i64* %42, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %indvars.iv.next77 = add nuw nsw i64 %23, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next51, 2000
  br i1 %exitcond1, label %for.body88.preheader, label %for.body63

for.body88.preheader:                             ; preds = %for.inc82
  %sunkaddr = ptrtoint double* %x to i64
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.inc112
  %indvar = phi i64 [ 0, %for.body88.preheader ], [ %indvar.next, %for.inc112 ]
  %indvars.iv44 = phi i64 [ 2000, %for.body88.preheader ], [ %indvars.iv.next45, %for.inc112 ]
  %43 = add i64 %indvar, -1
  %indvars.iv.next45 = add nsw i64 %indvars.iv44, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next45
  %44 = load double, double* %arrayidx90, align 8
  %cmp9215 = icmp slt i64 %indvars.iv44, 2000
  br i1 %cmp9215, label %for.inc102.preheader, label %for.inc112

for.inc102.preheader:                             ; preds = %for.body88
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.preheader
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol, %for.inc102.prol.preheader
  %indvars.iv42.prol = phi i64 [ %indvars.iv.next43.prol, %for.inc102.prol ], [ %indvars.iv44, %for.inc102.prol.preheader ]
  %45 = phi double [ %sub101.prol, %for.inc102.prol ], [ %44, %for.inc102.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next45, i64 %indvars.iv42.prol
  %46 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv42.prol
  %47 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %46, %47
  %sub101.prol = fsub double %45, %mul100.prol
  %indvars.iv.next43.prol = add i64 %indvars.iv42.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !22

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.preheader
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %indvars.iv42.unr = phi i64 [ %indvars.iv44, %for.inc102.preheader ], [ %indvars.iv.next43.prol, %for.inc102.prol.loopexit.loopexit ]
  %.unr = phi double [ %44, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %48 = icmp ult i64 %43, 3
  br i1 %48, label %for.inc112, label %for.inc102.preheader.new

for.inc102.preheader.new:                         ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102, %for.inc102.preheader.new
  %indvars.iv42 = phi i64 [ %indvars.iv42.unr, %for.inc102.preheader.new ], [ %indvars.iv.next43.3, %for.inc102 ]
  %49 = phi double [ %.unr, %for.inc102.preheader.new ], [ %sub101.3, %for.inc102 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next45, i64 %indvars.iv42
  %50 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv42
  %51 = bitcast double* %arrayidx99 to <2 x double>*
  %52 = load <2 x double>, <2 x double>* %50, align 8
  %53 = load <2 x double>, <2 x double>* %51, align 8
  %mul100 = fmul <2 x double> %52, %53
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %49, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next43.1 = add i64 %indvars.iv42, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next45, i64 %indvars.iv.next43.1
  %54 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next43.1
  %55 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next43.2 = add i64 %indvars.iv42, 3
  %56 = load <2 x double>, <2 x double>* %54, align 8
  %57 = load <2 x double>, <2 x double>* %55, align 8
  %mul100.2 = fmul <2 x double> %56, %57
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %exitcond.3 = icmp eq i64 %indvars.iv.next43.2, 1999
  %indvars.iv.next43.3 = add i64 %indvars.iv42, 4
  br i1 %exitcond.3, label %for.inc112.loopexit, label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.inc102.prol.loopexit, %for.body88
  %.lcssa = phi double [ %44, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next45, i64 %indvars.iv.next45
  %58 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %.lcssa, %58
  %sunkaddr85 = shl i64 %indvars.iv44, 3
  %sunkaddr86 = add i64 %sunkaddr, %sunkaddr85
  %sunkaddr87 = add i64 %sunkaddr86, -8
  %sunkaddr88 = inttoptr i64 %sunkaddr87 to double*
  store double %div109, double* %sunkaddr88, align 8
  %cmp87 = icmp sgt i64 %indvars.iv44, 1
  %indvar.next = add i64 %indvar, 1
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !21}
