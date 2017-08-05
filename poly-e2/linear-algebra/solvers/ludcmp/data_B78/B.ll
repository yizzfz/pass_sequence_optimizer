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
define internal fastcc void @init_array([2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %entry
  %indvars.iv141 = phi i64 [ 0, %entry ], [ %indvars.iv.next142.1, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv141
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv141
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next142 = or i64 %indvars.iv141, 1
  %2 = trunc i64 %indvars.iv.next142 to i32
  %conv4 = sitofp i32 %2 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv141
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next142.1 = add nsw i64 %indvars.iv141, 2
  %3 = trunc i64 %indvars.iv.next142.1 to i32
  %conv4.1 = sitofp i32 %3 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %4 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %4, align 8
  %exitcond165.1 = icmp eq i64 %indvars.iv.next142, 1999
  br i1 %exitcond165.1, label %for.inc25.lr.ph.preheader, label %for.inc

for.inc25.lr.ph.preheader:                        ; preds = %for.inc
  br label %for.inc25.lr.ph

for.inc25.lr.ph:                                  ; preds = %for.inc25.lr.ph.preheader, %for.inc44
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %for.inc44 ], [ 0, %for.inc25.lr.ph.preheader ]
  %5 = shl i64 %indvars.iv139, 32
  %sext = add nuw nsw i64 %5, 4294967296
  %6 = ashr exact i64 %sext, 32
  %7 = sub nsw i64 1998, %indvars.iv139
  %8 = shl i64 %7, 3
  br label %for.inc25

for.cond29.preheader:                             ; preds = %for.inc25
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %cmp3080 = icmp slt i64 %indvars.iv.next140, 2000
  br i1 %cmp3080, label %for.inc37.for.inc44_crit_edge, label %for.inc44

for.inc25:                                        ; preds = %for.inc25, %for.inc25.lr.ph
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %for.inc25 ], [ 0, %for.inc25.lr.ph ]
  %9 = sub nsw i64 0, %indvars.iv123
  %10 = trunc i64 %9 to i32
  %rem = srem i32 %10, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv139, i64 %indvars.iv123
  store double %add20, double* %arrayidx24, align 8
  %exitcond129 = icmp eq i64 %indvars.iv123, %indvars.iv139
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  br i1 %exitcond129, label %for.cond29.preheader, label %for.inc25

for.inc37.for.inc44_crit_edge:                    ; preds = %for.cond29.preheader
  %11 = and i64 %8, 34359738360
  %scevgep137 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv139, i64 %6
  %12 = add nuw nsw i64 %11, 8
  %scevgep137138 = bitcast double* %scevgep137 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep137138, i8 0, i64 %12, i32 8, i1 false)
  br label %for.inc44

for.inc44:                                        ; preds = %for.cond29.preheader, %for.inc37.for.inc44_crit_edge
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv139, i64 %indvars.iv139
  store double 1.000000e+00, double* %arrayidx43, align 8
  %exitcond164 = icmp eq i64 %indvars.iv.next140, 2000
  br i1 %exitcond164, label %for.end46, label %for.inc25.lr.ph

for.end46:                                        ; preds = %for.inc44
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us, %for.end46
  %indvars.iv121 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next122.7, %for.inc62.us ]
  %13 = mul nuw nsw i64 %indvars.iv121, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122 = or i64 %indvars.iv121, 1
  %14 = mul nuw nsw i64 %indvars.iv.next122, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.1 = or i64 %indvars.iv121, 2
  %15 = mul nuw nsw i64 %indvars.iv.next122.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.2 = or i64 %indvars.iv121, 3
  %16 = mul nuw nsw i64 %indvars.iv.next122.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.3 = or i64 %indvars.iv121, 4
  %17 = mul nuw nsw i64 %indvars.iv.next122.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.4 = or i64 %indvars.iv121, 5
  %18 = mul nuw nsw i64 %indvars.iv.next122.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.5 = or i64 %indvars.iv121, 6
  %19 = mul nuw nsw i64 %indvars.iv.next122.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.6 = or i64 %indvars.iv121, 7
  %20 = mul nuw nsw i64 %indvars.iv.next122.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.7 = add nsw i64 %indvars.iv121, 8
  %exitcond163.7 = icmp eq i64 %indvars.iv.next122.7, 2000
  br i1 %exitcond163.7, label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader, label %for.inc62.us

for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader: ; preds = %for.inc62.us
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  %23 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge: ; preds = %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader, %for.inc96.us
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %for.inc96.us ], [ 0, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv115
  %24 = add i64 %indvars.iv115, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %24
  %25 = bitcast double* %scevgep5 to i8*
  %26 = bitcast double* %scevgep3 to i8*
  br label %for.cond73.preheader.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond162 = icmp eq i64 %indvars.iv.next116, 2000
  br i1 %exitcond162, label %for.cond103.preheader.us.preheader, label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

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
  %indvars.iv113 = phi i64 [ 0, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge ], [ %indvars.iv.next114, %for.inc93.us.us ]
  %34 = mul i64 %indvars.iv113, 16000
  %scevgep1 = getelementptr i8, i8* %call, i64 %34
  %35 = add i64 %34, 16000
  %scevgep2 = getelementptr i8, i8* %call, i64 %35
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv115
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
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv115
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %36, i64 %indvars.iv115
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %37, i64 %indvars.iv115
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %38, i64 %indvars.iv115
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
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv113, i64 %index
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !6, !noalias !8
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !6, !noalias !8
  %62 = fadd <2 x double> %wide.load, %56
  %63 = fadd <2 x double> %wide.load12, %57
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
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond161 = icmp eq i64 %indvars.iv.next114, 2000
  br i1 %exitcond161, label %for.inc96.us, label %for.cond73.preheader.us.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us, %for.inc90.us.us.preheader
  %indvars.iv109 = phi i64 [ 0, %for.inc90.us.us.preheader ], [ %indvars.iv.next110.1, %for.inc90.us.us ]
  %67 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv109, i64 %indvars.iv115
  %68 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %67, %68
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv113, i64 %indvars.iv109
  %69 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %69, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next110 = or i64 %indvars.iv109, 1
  %70 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next110, i64 %indvars.iv115
  %71 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %70, %71
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv113, i64 %indvars.iv.next110
  %72 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %72, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %exitcond160.1 = icmp eq i64 %indvars.iv.next110, 1999
  %indvars.iv.next110.1 = add nsw i64 %indvars.iv109, 2
  br i1 %exitcond160.1, label %for.inc93.us.us.loopexit, label %for.inc90.us.us, !llvm.loop !12

for.cond103.preheader.us:                         ; preds = %for.cond103.preheader.us.preheader, %for.inc118.us
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %for.inc118.us ], [ 0, %for.cond103.preheader.us.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv107, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %73 = add i64 %indvars.iv107, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %A, i64 %73, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %74 = mul i64 %indvars.iv107, 16000
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
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv107, i64 %index30
  %77 = bitcast double* %76 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !13
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !13
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv107, i64 %index30
  %81 = bitcast double* %80 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %81, align 8, !alias.scope !16, !noalias !13
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %83, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv107, i64 %index.next31
  %85 = bitcast double* %84 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %85, align 8, !alias.scope !13
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %87, align 8, !alias.scope !13
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv107, i64 %index.next31
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
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv107, i64 %indvars.iv
  %93 = bitcast double* %arrayidx110.us to i64*
  %94 = load i64, i64* %93, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv107, i64 %indvars.iv
  %95 = bitcast double* %arrayidx114.us to i64*
  store i64 %94, i64* %95, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next
  %96 = bitcast double* %arrayidx110.us.1 to i64*
  %97 = load i64, i64* %96, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv107, i64 %indvars.iv.next
  %98 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %97, i64* %98, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next.1
  %99 = bitcast double* %arrayidx110.us.2 to i64*
  %100 = load i64, i64* %99, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv107, i64 %indvars.iv.next.1
  %101 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %100, i64* %101, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next.2
  %102 = bitcast double* %arrayidx110.us.3 to i64*
  %103 = load i64, i64* %102, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv107, i64 %indvars.iv.next.2
  %104 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %103, i64* %104, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx110.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next.3
  %105 = bitcast double* %arrayidx110.us.4 to i64*
  %106 = load i64, i64* %105, align 8
  %arrayidx114.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv107, i64 %indvars.iv.next.3
  %107 = bitcast double* %arrayidx114.us.4 to i64*
  store i64 %106, i64* %107, align 8
  %exitcond159.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond159.4, label %for.inc118.us.loopexit, label %for.inc115.us, !llvm.loop !19

for.inc118.us.loopexit:                           ; preds = %for.inc115.us
  br label %for.inc118.us

for.inc118.us.loopexit42:                         ; preds = %vector.body13
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit42, %for.inc118.us.loopexit
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond = icmp eq i64 %indvars.iv.next108, 2000
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
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %for.inc58 ], [ 4294967295, %entry ]
  %0 = and i64 %indvars.iv145, 4294967295
  %cmp294 = icmp sgt i64 %indvars.iv2, 0
  br i1 %cmp294, label %for.body3.preheader, label %for.inc58

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 0
  br label %for.body3

for.body30.lr.ph:                                 ; preds = %for.inc25
  %cmp3696 = icmp sgt i64 %indvars.iv2, 0
  br i1 %cmp3696, label %for.body30.us.preheader, label %for.inc58

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %1 = and i64 %indvars.iv145, 1
  %lcmp.mod17 = icmp eq i64 %1, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 0
  %2 = icmp eq i64 %0, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.inc55.us
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %for.inc55.us ], [ %indvars.iv2, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv132
  %3 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod17, label %for.inc48.us.prol, label %for.inc48.us.prol.loopexit

for.inc48.us.prol:                                ; preds = %for.body30.us
  %4 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv132
  %5 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %4, %5
  %sub47.us.prol = fsub double %3, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  %indvars.iv124.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %w.198.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %3, %for.body30.us ]
  br i1 %2, label %for.inc55.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %indvars.iv124 = phi i64 [ %indvars.iv124.unr.ph, %for.body30.us.new ], [ %indvars.iv.next125.1, %for.inc48.us ]
  %w.198.us = phi double [ %w.198.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv124
  %6 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %indvars.iv132
  %7 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %8 = load <2 x double>, <2 x double>* %6, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next125, i64 %indvars.iv132
  %9 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %7, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %9, i32 1
  %mul46.us = fmul <2 x double> %8, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %w.198.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %exitcond147.1 = icmp eq i64 %indvars.iv.next125, %0
  %indvars.iv.next125.1 = add nsw i64 %indvars.iv124, 2
  br i1 %exitcond147.1, label %for.inc55.us.loopexit, label %for.inc48.us

for.inc55.us.loopexit:                            ; preds = %for.inc48.us
  br label %for.inc55.us

for.inc55.us:                                     ; preds = %for.inc55.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.inc55.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next133, 2000
  br i1 %exitcond5, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv142 = phi i64 [ %indvars.iv.next143, %for.inc25 ], [ 4294967295, %for.body3.preheader ]
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %for.inc25 ], [ 0, %for.body3.preheader ]
  %10 = and i64 %indvars.iv142, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv121
  %11 = load double, double* %arrayidx5, align 8
  %cmp790 = icmp sgt i64 %indvars.iv121, 0
  br i1 %cmp790, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  %12 = and i64 %indvars.iv142, 1
  %lcmp.mod15 = icmp eq i64 %12, 0
  br i1 %lcmp.mod15, label %for.inc.prol, label %for.inc.prol.loopexit

for.inc.prol:                                     ; preds = %for.inc.preheader
  %13 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv121
  %14 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %13, %14
  %sub.prol = fsub double %11, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv115.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %w.092.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %11, %for.inc.preheader ]
  %15 = icmp eq i64 %10, 0
  br i1 %15, label %for.inc25, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv115 = phi i64 [ %indvars.iv115.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next116.1, %for.inc ]
  %w.092 = phi double [ %w.092.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv115
  %16 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv115, i64 %indvars.iv121
  %17 = load double, double* %arrayidx16, align 8
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %18 = load <2 x double>, <2 x double>* %16, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next116, i64 %indvars.iv121
  %19 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %17, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %19, i32 1
  %mul = fmul <2 x double> %18, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.092, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %exitcond144.1 = icmp eq i64 %indvars.iv.next116, %10
  %indvars.iv.next116.1 = add nsw i64 %indvars.iv115, 2
  br i1 %exitcond144.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.body3
  %w.0.lcssa = phi double [ %11, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %indvars.iv121
  %20 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %20
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %indvars.iv.next143 = add nuw nsw i64 %10, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next122, %indvars.iv2
  br i1 %exitcond4, label %for.body30.lr.ph, label %for.body3

for.inc58.loopexit:                               ; preds = %for.inc55.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.cond1.preheader, %for.body30.lr.ph
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %indvars.iv.next146 = add nuw nsw i64 %0, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond6, label %for.body63.preheader, label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.inc82
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %for.inc82 ], [ 4294967295, %for.body63.preheader ]
  %indvars.iv113 = phi i64 [ %indvars.iv.next114, %for.inc82 ], [ 0, %for.body63.preheader ]
  %21 = and i64 %indvars.iv139, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv113
  %22 = load double, double* %arrayidx65, align 8
  %cmp6784 = icmp sgt i64 %indvars.iv113, 0
  br i1 %cmp6784, label %for.inc77.preheader, label %for.inc82

for.inc77.preheader:                              ; preds = %for.body63
  %23 = add nsw i64 %indvars.iv139, 1
  %xtraiter11 = and i64 %23, 3
  %lcmp.mod12 = icmp eq i64 %xtraiter11, 0
  br i1 %lcmp.mod12, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.preheader
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol, %for.inc77.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %w.286.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %22, %for.inc77.prol.preheader ]
  %prol.iter13 = phi i64 [ %prol.iter13.sub, %for.inc77.prol ], [ %xtraiter11, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv.prol
  %24 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %25 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %24, %25
  %sub76.prol = fsub double %w.286.prol, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter13.sub = add i64 %prol.iter13, -1
  %prol.iter13.cmp = icmp eq i64 %prol.iter13.sub, 0
  br i1 %prol.iter13.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !20

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.preheader
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %for.inc77.preheader ], [ %indvars.iv.next.prol, %for.inc77.prol.loopexit.loopexit ]
  %w.286.unr = phi double [ %22, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %26 = icmp ult i64 %21, 3
  br i1 %26, label %for.inc82, label %for.inc77.preheader.new

for.inc77.preheader.new:                          ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77, %for.inc77.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc77.preheader.new ], [ %indvars.iv.next.3, %for.inc77 ]
  %w.286 = phi double [ %w.286.unr, %for.inc77.preheader.new ], [ %sub76.3, %for.inc77 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv
  %27 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %28 = bitcast double* %arrayidx74 to <2 x double>*
  %29 = load <2 x double>, <2 x double>* %27, align 8
  %30 = load <2 x double>, <2 x double>* %28, align 8
  %mul75 = fmul <2 x double> %29, %30
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %w.286, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv.next.1
  %31 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %32 = bitcast double* %arrayidx74.2 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %33 = load <2 x double>, <2 x double>* %31, align 8
  %34 = load <2 x double>, <2 x double>* %32, align 8
  %mul75.2 = fmul <2 x double> %33, %34
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %exitcond141.3 = icmp eq i64 %indvars.iv.next.2, %21
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond141.3, label %for.inc82.loopexit, label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.inc77.prol.loopexit, %for.body63
  %w.2.lcssa = phi double [ %22, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv113
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %indvars.iv.next140 = add nuw nsw i64 %21, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next114, 2000
  br i1 %exitcond1, label %for.body88.preheader, label %for.body63

for.body88.preheader:                             ; preds = %for.inc82
  %sunkaddr = ptrtoint double* %x to i64
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.inc112
  %indvar = phi i64 [ 0, %for.body88.preheader ], [ %indvar.next, %for.inc112 ]
  %indvars.iv107 = phi i64 [ 2000, %for.body88.preheader ], [ %indvars.iv.next108, %for.inc112 ]
  %35 = add i64 %indvar, -1
  %indvars.iv.next108 = add nsw i64 %indvars.iv107, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next108
  %36 = load double, double* %arrayidx90, align 8
  %cmp9278 = icmp slt i64 %indvars.iv107, 2000
  br i1 %cmp9278, label %for.inc102.preheader, label %for.inc112

for.inc102.preheader:                             ; preds = %for.body88
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.preheader
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol, %for.inc102.prol.preheader
  %indvars.iv105.prol = phi i64 [ %indvars.iv.next106.prol, %for.inc102.prol ], [ %indvars.iv107, %for.inc102.prol.preheader ]
  %w.379.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %36, %for.inc102.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next108, i64 %indvars.iv105.prol
  %37 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv105.prol
  %38 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %37, %38
  %sub101.prol = fsub double %w.379.prol, %mul100.prol
  %indvars.iv.next106.prol = add i64 %indvars.iv105.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !22

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.preheader
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %indvars.iv105.unr = phi i64 [ %indvars.iv107, %for.inc102.preheader ], [ %indvars.iv.next106.prol, %for.inc102.prol.loopexit.loopexit ]
  %w.379.unr = phi double [ %36, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %39 = icmp ult i64 %35, 3
  br i1 %39, label %for.inc112, label %for.inc102.preheader.new

for.inc102.preheader.new:                         ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102, %for.inc102.preheader.new
  %indvars.iv105 = phi i64 [ %indvars.iv105.unr, %for.inc102.preheader.new ], [ %indvars.iv.next106.3, %for.inc102 ]
  %w.379 = phi double [ %w.379.unr, %for.inc102.preheader.new ], [ %sub101.3, %for.inc102 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next108, i64 %indvars.iv105
  %40 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv105
  %41 = bitcast double* %arrayidx99 to <2 x double>*
  %42 = load <2 x double>, <2 x double>* %40, align 8
  %43 = load <2 x double>, <2 x double>* %41, align 8
  %mul100 = fmul <2 x double> %42, %43
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.379, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next106.1 = add i64 %indvars.iv105, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next108, i64 %indvars.iv.next106.1
  %44 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next106.1
  %45 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next106.2 = add i64 %indvars.iv105, 3
  %46 = load <2 x double>, <2 x double>* %44, align 8
  %47 = load <2 x double>, <2 x double>* %45, align 8
  %mul100.2 = fmul <2 x double> %46, %47
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %exitcond.3 = icmp eq i64 %indvars.iv.next106.2, 1999
  %indvars.iv.next106.3 = add i64 %indvars.iv105, 4
  br i1 %exitcond.3, label %for.inc112.loopexit, label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.inc102.prol.loopexit, %for.body88
  %w.3.lcssa = phi double [ %36, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next108, i64 %indvars.iv.next108
  %48 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %48
  %sunkaddr7 = shl i64 %indvars.iv107, 3
  %sunkaddr8 = add i64 %sunkaddr, %sunkaddr7
  %sunkaddr9 = add i64 %sunkaddr8, -8
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to double*
  store double %div109, double* %sunkaddr10, align 8
  %cmp87 = icmp sgt i64 %indvars.iv107, 1
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
