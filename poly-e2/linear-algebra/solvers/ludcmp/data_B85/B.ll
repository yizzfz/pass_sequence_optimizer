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
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call2 to double*
  tail call fastcc void @print_array(double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry.for.body_crit_edge:
  br label %for.body

for.body:                                         ; preds = %for.body.for.body_crit_edge, %entry.for.body_crit_edge
  %indvars.iv61 = phi i64 [ 0, %entry.for.body_crit_edge ], [ %indvars.iv.next62.1, %for.body.for.body_crit_edge ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv61
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv61
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next62 = or i64 %indvars.iv61, 1
  %2 = trunc i64 %indvars.iv.next62 to i32
  %conv4 = sitofp i32 %2 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv61
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next62.1 = add nsw i64 %indvars.iv61, 2
  %3 = trunc i64 %indvars.iv.next62.1 to i32
  %conv4.1 = sitofp i32 %3 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %4 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %4, align 8
  %exitcond63.1 = icmp eq i64 %indvars.iv.next62, 1999
  br i1 %exitcond63.1, label %for.body16.lr.ph.preheader, label %for.body.for.body_crit_edge

for.body.for.body_crit_edge:                      ; preds = %for.body
  br label %for.body

for.body16.lr.ph.preheader:                       ; preds = %for.body
  br label %for.body16.lr.ph

for.body16.lr.ph:                                 ; preds = %for.body16.lr.ph.preheader, %for.end39.for.cond13.preheader_crit_edge
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %for.end39.for.cond13.preheader_crit_edge ], [ 0, %for.body16.lr.ph.preheader ]
  %5 = shl i64 %indvars.iv59, 32
  %sext = add i64 %5, 4294967296
  %6 = ashr exact i64 %sext, 32
  %7 = sub i64 1998, %indvars.iv59
  %8 = shl i64 %7, 3
  br label %for.body16

for.body16:                                       ; preds = %for.body16.for.body16_crit_edge, %for.body16.lr.ph
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.body16.for.body16_crit_edge ], [ 0, %for.body16.lr.ph ]
  %9 = sub nsw i64 0, %indvars.iv45
  %10 = trunc i64 %9 to i32
  %rem = srem i32 %10, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv45
  store double %add20, double* %arrayidx24, align 8
  %exitcond50 = icmp eq i64 %indvars.iv45, %indvars.iv59
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  br i1 %exitcond50, label %for.end27, label %for.body16.for.body16_crit_edge

for.body16.for.body16_crit_edge:                  ; preds = %for.body16
  br label %for.body16

for.end27:                                        ; preds = %for.body16
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %cmp309 = icmp slt i64 %indvars.iv.next60, 2000
  br i1 %cmp309, label %for.end39.for.cond13.preheader_crit_edge, label %for.end46.for.cond51.preheader.us_crit_edge

for.end39.for.cond13.preheader_crit_edge:         ; preds = %for.end27
  %11 = and i64 %8, 34359738360
  %scevgep57 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv59, i64 %6
  %12 = add nuw nsw i64 %11, 8
  %scevgep5758 = bitcast double* %scevgep57 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep5758, i8 0, i64 %12, i32 8, i1 false)
  %arrayidx4366 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv59
  store double 1.000000e+00, double* %arrayidx4366, align 8
  br label %for.body16.lr.ph

for.end46.for.cond51.preheader.us_crit_edge:      ; preds = %for.end27
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv59
  store double 1.000000e+00, double* %arrayidx43, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.end61.us

for.end61.us:                                     ; preds = %for.end61.us.for.end61.us_crit_edge, %for.end46.for.cond51.preheader.us_crit_edge
  %indvars.iv43 = phi i64 [ 0, %for.end46.for.cond51.preheader.us_crit_edge ], [ %indvars.iv.next44.7, %for.end61.us.for.end61.us_crit_edge ]
  %13 = mul nuw nsw i64 %indvars.iv43, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next44 = or i64 %indvars.iv43, 1
  %14 = mul nuw nsw i64 %indvars.iv.next44, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next44.1 = or i64 %indvars.iv43, 2
  %15 = mul nuw nsw i64 %indvars.iv.next44.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next44.2 = or i64 %indvars.iv43, 3
  %16 = mul nuw nsw i64 %indvars.iv.next44.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next44.3 = or i64 %indvars.iv43, 4
  %17 = mul nuw nsw i64 %indvars.iv.next44.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next44.4 = or i64 %indvars.iv43, 5
  %18 = mul nuw nsw i64 %indvars.iv.next44.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next44.5 = or i64 %indvars.iv43, 6
  %19 = mul nuw nsw i64 %indvars.iv.next44.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next44.6 = or i64 %indvars.iv43, 7
  %20 = mul nuw nsw i64 %indvars.iv.next44.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next44.7 = add nsw i64 %indvars.iv43, 8
  %exitcond4.7 = icmp eq i64 %indvars.iv.next44.7, 2000
  br i1 %exitcond4.7, label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader, label %for.end61.us.for.end61.us_crit_edge

for.end61.us.for.end61.us_crit_edge:              ; preds = %for.end61.us
  br label %for.end61.us

for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader: ; preds = %for.end61.us
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  %23 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge: ; preds = %for.end95.us.for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge_crit_edge, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader
  %indvars.iv38 = phi i64 [ 0, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader ], [ %indvars.iv.next39, %for.end95.us.for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge_crit_edge ]
  %scevgep7 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv38
  %24 = add i64 %indvars.iv38, 1
  %scevgep9 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %24
  %25 = bitcast double* %scevgep9 to i8*
  %26 = bitcast double* %scevgep7 to i8*
  br label %for.cond73.preheader.us.us

for.end95.us:                                     ; preds = %for.end92.us.us
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next39, 2000
  br i1 %exitcond3, label %for.cond103.preheader.us.preheader, label %for.end95.us.for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge_crit_edge

for.end95.us.for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge_crit_edge: ; preds = %for.end95.us
  br label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond103.preheader.us.preheader:               ; preds = %for.end95.us
  %27 = bitcast i8* %call to [2000 x [2000 x double]]*
  %28 = bitcast i8* %call to [2000 x [2000 x double]]*
  %29 = bitcast i8* %call to [2000 x [2000 x double]]*
  %30 = bitcast i8* %call to [2000 x [2000 x double]]*
  %31 = bitcast i8* %call to [2000 x [2000 x double]]*
  %32 = bitcast i8* %call to [2000 x [2000 x double]]*
  %33 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond103.preheader.us

for.cond73.preheader.us.us:                       ; preds = %for.end92.us.us.for.cond73.preheader.us.us_crit_edge, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge
  %indvars.iv36 = phi i64 [ 0, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge ], [ %indvars.iv.next37, %for.end92.us.us.for.cond73.preheader.us.us_crit_edge ]
  %34 = mul i64 %indvars.iv36, 16000
  %scevgep5 = getelementptr i8, i8* %call, i64 %34
  %35 = add i64 %34, 16000
  %scevgep6 = getelementptr i8, i8* %call, i64 %35
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv38
  %bound0 = icmp ult i8* %scevgep5, %25
  %bound1 = icmp ult i8* %26, %scevgep6
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx80.us.us to i8*
  %bc11 = bitcast double* %arrayidx80.us.us to i8*
  %bound012 = icmp ult i8* %scevgep5, %bc11
  %bound113 = icmp ult i8* %bc, %scevgep6
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
  br i1 %conflict.rdx, label %for.body76.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us.us
  br label %vector.body

for.body76.us.us.preheader:                       ; preds = %for.cond73.preheader.us.us
  br label %for.body76.us.us

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %36 = or i64 %index, 1
  %37 = or i64 %index, 2
  %38 = or i64 %index, 3
  %39 = load double, double* %arrayidx80.us.us, align 8, !alias.scope !1
  %40 = insertelement <2 x double> undef, double %39, i32 0
  %41 = shufflevector <2 x double> %40, <2 x double> undef, <2 x i32> zeroinitializer
  %42 = insertelement <2 x double> undef, double %39, i32 0
  %43 = shufflevector <2 x double> %42, <2 x double> undef, <2 x i32> zeroinitializer
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv38
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %36, i64 %indvars.iv38
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %37, i64 %indvars.iv38
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %38, i64 %indvars.iv38
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
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv36, i64 %index
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !6, !noalias !8
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !6, !noalias !8
  %62 = fadd <2 x double> %wide.load, %56
  %63 = fadd <2 x double> %wide.load16, %57
  %64 = bitcast double* %58 to <2 x double>*
  store <2 x double> %62, <2 x double>* %64, align 8, !alias.scope !6, !noalias !8
  %65 = bitcast double* %60 to <2 x double>*
  store <2 x double> %63, <2 x double>* %65, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %66 = icmp eq i64 %index.next, 2000
  br i1 %66, label %for.end92.us.us.loopexit47, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

for.end92.us.us.loopexit:                         ; preds = %for.body76.us.us
  br label %for.end92.us.us

for.end92.us.us.loopexit47:                       ; preds = %vector.body
  br label %for.end92.us.us

for.end92.us.us:                                  ; preds = %for.end92.us.us.loopexit47, %for.end92.us.us.loopexit
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next37, 2000
  br i1 %exitcond2, label %for.end95.us, label %for.end92.us.us.for.cond73.preheader.us.us_crit_edge

for.end92.us.us.for.cond73.preheader.us.us_crit_edge: ; preds = %for.end92.us.us
  br label %for.cond73.preheader.us.us

for.body76.us.us:                                 ; preds = %for.body76.us.us.for.body76.us.us_crit_edge, %for.body76.us.us.preheader
  %indvars.iv33 = phi i64 [ 0, %for.body76.us.us.preheader ], [ %indvars.iv.next34.1, %for.body76.us.us.for.body76.us.us_crit_edge ]
  %67 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv38
  %68 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %67, %68
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv36, i64 %indvars.iv33
  %69 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %69, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next34 = or i64 %indvars.iv33, 1
  %70 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv38
  %71 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %70, %71
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv36, i64 %indvars.iv.next34
  %72 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %72, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %exitcond35.1 = icmp eq i64 %indvars.iv.next34, 1999
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv33, 2
  br i1 %exitcond35.1, label %for.end92.us.us.loopexit, label %for.body76.us.us.for.body76.us.us_crit_edge, !llvm.loop !12

for.body76.us.us.for.body76.us.us_crit_edge:      ; preds = %for.body76.us.us
  br label %for.body76.us.us

for.cond103.preheader.us:                         ; preds = %for.end117.us.for.cond103.preheader.us_crit_edge, %for.cond103.preheader.us.preheader
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.end117.us.for.cond103.preheader.us_crit_edge ], [ 0, %for.cond103.preheader.us.preheader ]
  %scevgep22 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv31, i64 0
  %scevgep2223 = bitcast double* %scevgep22 to i8*
  %73 = add i64 %indvars.iv31, 1
  %scevgep24 = getelementptr [2000 x double], [2000 x double]* %A, i64 %73, i64 0
  %scevgep2425 = bitcast double* %scevgep24 to i8*
  %74 = mul i64 %indvars.iv31, 16000
  %scevgep26 = getelementptr i8, i8* %call, i64 %74
  %75 = add i64 %74, 16000
  %scevgep27 = getelementptr i8, i8* %call, i64 %75
  %bound028 = icmp ult i8* %scevgep2223, %scevgep27
  %bound129 = icmp ult i8* %scevgep26, %scevgep2425
  %memcheck.conflict31 = and i1 %bound028, %bound129
  br i1 %memcheck.conflict31, label %for.body106.us.preheader, label %vector.body17.preheader

vector.body17.preheader:                          ; preds = %for.cond103.preheader.us
  br label %vector.body17

for.body106.us.preheader:                         ; preds = %for.cond103.preheader.us
  br label %for.body106.us

vector.body17:                                    ; preds = %vector.body17.vector.body17_crit_edge, %vector.body17.preheader
  %index34 = phi i64 [ 0, %vector.body17.preheader ], [ %index.next35.1, %vector.body17.vector.body17_crit_edge ]
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv31, i64 %index34
  %77 = bitcast double* %76 to <2 x i64>*
  %wide.load42 = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !13
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x i64>*
  %wide.load43 = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !13
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv31, i64 %index34
  %81 = bitcast double* %80 to <2 x i64>*
  store <2 x i64> %wide.load42, <2 x i64>* %81, align 8, !alias.scope !16, !noalias !13
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  store <2 x i64> %wide.load43, <2 x i64>* %83, align 8, !alias.scope !16, !noalias !13
  %index.next35 = or i64 %index34, 4
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv31, i64 %index.next35
  %85 = bitcast double* %84 to <2 x i64>*
  %wide.load42.1 = load <2 x i64>, <2 x i64>* %85, align 8, !alias.scope !13
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x i64>*
  %wide.load43.1 = load <2 x i64>, <2 x i64>* %87, align 8, !alias.scope !13
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv31, i64 %index.next35
  %89 = bitcast double* %88 to <2 x i64>*
  store <2 x i64> %wide.load42.1, <2 x i64>* %89, align 8, !alias.scope !16, !noalias !13
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x i64>*
  store <2 x i64> %wide.load43.1, <2 x i64>* %91, align 8, !alias.scope !16, !noalias !13
  %index.next35.1 = add nsw i64 %index34, 8
  %92 = icmp eq i64 %index.next35.1, 2000
  br i1 %92, label %for.end117.us.loopexit46, label %vector.body17.vector.body17_crit_edge, !llvm.loop !18

vector.body17.vector.body17_crit_edge:            ; preds = %vector.body17
  br label %vector.body17

for.body106.us:                                   ; preds = %for.body106.us.for.body106.us_crit_edge, %for.body106.us.preheader
  %indvars.iv = phi i64 [ 0, %for.body106.us.preheader ], [ %indvars.iv.next.4, %for.body106.us.for.body106.us_crit_edge ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv31, i64 %indvars.iv
  %93 = bitcast double* %arrayidx110.us to i64*
  %94 = load i64, i64* %93, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv
  %95 = bitcast double* %arrayidx114.us to i64*
  store i64 %94, i64* %95, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv31, i64 %indvars.iv.next
  %96 = bitcast double* %arrayidx110.us.1 to i64*
  %97 = load i64, i64* %96, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv.next
  %98 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %97, i64* %98, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i64 0, i64 %indvars.iv31, i64 %indvars.iv.next.1
  %99 = bitcast double* %arrayidx110.us.2 to i64*
  %100 = load i64, i64* %99, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv.next.1
  %101 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %100, i64* %101, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv31, i64 %indvars.iv.next.2
  %102 = bitcast double* %arrayidx110.us.3 to i64*
  %103 = load i64, i64* %102, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv.next.2
  %104 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %103, i64* %104, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx110.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv31, i64 %indvars.iv.next.3
  %105 = bitcast double* %arrayidx110.us.4 to i64*
  %106 = load i64, i64* %105, align 8
  %arrayidx114.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv.next.3
  %107 = bitcast double* %arrayidx114.us.4 to i64*
  store i64 %106, i64* %107, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %for.end117.us.loopexit, label %for.body106.us.for.body106.us_crit_edge, !llvm.loop !19

for.body106.us.for.body106.us_crit_edge:          ; preds = %for.body106.us
  br label %for.body106.us

for.end117.us.loopexit:                           ; preds = %for.body106.us
  br label %for.end117.us

for.end117.us.loopexit46:                         ; preds = %vector.body17
  br label %for.end117.us

for.end117.us:                                    ; preds = %for.end117.us.loopexit46, %for.end117.us.loopexit
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next32, 2000
  br i1 %exitcond1, label %for.end120, label %for.end117.us.for.cond103.preheader.us_crit_edge

for.end117.us.for.cond103.preheader.us_crit_edge: ; preds = %for.end117.us
  br label %for.cond103.preheader.us

for.end120:                                       ; preds = %for.end117.us
  tail call void @free(i8* nonnull %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry.for.cond1.preheader_crit_edge:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end57.for.cond1.preheader_crit_edge, %entry.for.cond1.preheader_crit_edge
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.end57.for.cond1.preheader_crit_edge ], [ 0, %entry.for.cond1.preheader_crit_edge ]
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.end57.for.cond1.preheader_crit_edge ], [ 4294967295, %entry.for.cond1.preheader_crit_edge ]
  %0 = and i64 %indvars.iv7, 4294967295
  %cmp212 = icmp sgt i64 %indvars.iv12, 0
  br i1 %cmp212, label %for.body3.preheader, label %for.cond1.preheader.for.end57_crit_edge

for.cond1.preheader.for.end57_crit_edge:          ; preds = %for.cond1.preheader
  br label %for.end57

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 0
  br label %for.body3

for.body30.lr.ph:                                 ; preds = %for.end
  %cmp3613 = icmp sgt i64 %indvars.iv12, 0
  br i1 %cmp3613, label %for.body30.us.preheader, label %for.body30.lr.ph.for.end57_crit_edge

for.body30.lr.ph.for.end57_crit_edge:             ; preds = %for.body30.lr.ph
  br label %for.end57

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %1 = and i64 %indvars.iv7, 1
  %lcmp.mod24 = icmp eq i64 %1, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 0
  %2 = icmp eq i64 %0, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.end50.us.for.body30.us_crit_edge, %for.body30.us.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.end50.us.for.body30.us_crit_edge ], [ %indvars.iv12, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv45
  %3 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod24, label %for.body37.us.prol, label %for.body30.us.for.body37.us.prol.loopexit_crit_edge

for.body30.us.for.body37.us.prol.loopexit_crit_edge: ; preds = %for.body30.us
  br label %for.body37.us.prol.loopexit

for.body37.us.prol:                               ; preds = %for.body30.us
  %4 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv45
  %5 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %4, %5
  %sub47.us.prol = fsub double %3, %mul46.us.prol
  br label %for.body37.us.prol.loopexit

for.body37.us.prol.loopexit:                      ; preds = %for.body30.us.for.body37.us.prol.loopexit_crit_edge, %for.body37.us.prol
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ undef, %for.body30.us.for.body37.us.prol.loopexit_crit_edge ]
  %indvars.iv37.unr.ph = phi i64 [ 1, %for.body37.us.prol ], [ 0, %for.body30.us.for.body37.us.prol.loopexit_crit_edge ]
  %.unr25.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ %3, %for.body30.us.for.body37.us.prol.loopexit_crit_edge ]
  br i1 %2, label %for.body37.us.prol.loopexit.for.end50.us_crit_edge, label %for.body30.us.new

for.body37.us.prol.loopexit.for.end50.us_crit_edge: ; preds = %for.body37.us.prol.loopexit
  br label %for.end50.us

for.body30.us.new:                                ; preds = %for.body37.us.prol.loopexit
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us.for.body37.us_crit_edge, %for.body30.us.new
  %indvars.iv37 = phi i64 [ %indvars.iv37.unr.ph, %for.body30.us.new ], [ %indvars.iv.next38.1, %for.body37.us.for.body37.us_crit_edge ]
  %6 = phi double [ %.unr25.ph, %for.body30.us.new ], [ %sub47.us.1, %for.body37.us.for.body37.us_crit_edge ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv37
  %7 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv45
  %8 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %9 = load <2 x double>, <2 x double>* %7, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next38, i64 %indvars.iv45
  %10 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %8, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %10, i32 1
  %mul46.us = fmul <2 x double> %9, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %6, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next38, %0
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  br i1 %exitcond9.1, label %for.end50.us.loopexit, label %for.body37.us.for.body37.us_crit_edge

for.body37.us.for.body37.us_crit_edge:            ; preds = %for.body37.us
  br label %for.body37.us

for.end50.us.loopexit:                            ; preds = %for.body37.us
  br label %for.end50.us

for.end50.us:                                     ; preds = %for.body37.us.prol.loopexit.for.end50.us_crit_edge, %for.end50.us.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.body37.us.prol.loopexit.for.end50.us_crit_edge ], [ %sub47.us.1, %for.end50.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next46, 2000
  br i1 %exitcond10, label %for.end57.loopexit, label %for.end50.us.for.body30.us_crit_edge

for.end50.us.for.body30.us_crit_edge:             ; preds = %for.end50.us
  br label %for.body30.us

for.body3:                                        ; preds = %for.end.for.body3_crit_edge, %for.body3.preheader
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %for.end.for.body3_crit_edge ], [ 4294967295, %for.body3.preheader ]
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.end.for.body3_crit_edge ], [ 0, %for.body3.preheader ]
  %11 = and i64 %indvars.iv4, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv34
  %12 = load double, double* %arrayidx5, align 8
  %cmp710 = icmp sgt i64 %indvars.iv34, 0
  br i1 %cmp710, label %for.body8.preheader, label %for.body3.for.end_crit_edge

for.body3.for.end_crit_edge:                      ; preds = %for.body3
  br label %for.end

for.body8.preheader:                              ; preds = %for.body3
  %13 = and i64 %indvars.iv4, 1
  %lcmp.mod21 = icmp eq i64 %13, 0
  br i1 %lcmp.mod21, label %for.body8.prol, label %for.body8.preheader.for.body8.prol.loopexit_crit_edge

for.body8.preheader.for.body8.prol.loopexit_crit_edge: ; preds = %for.body8.preheader
  br label %for.body8.prol.loopexit

for.body8.prol:                                   ; preds = %for.body8.preheader
  %14 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv34
  %15 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %14, %15
  %sub.prol = fsub double %12, %mul.prol
  br label %for.body8.prol.loopexit

for.body8.prol.loopexit:                          ; preds = %for.body8.preheader.for.body8.prol.loopexit_crit_edge, %for.body8.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ undef, %for.body8.preheader.for.body8.prol.loopexit_crit_edge ]
  %indvars.iv28.unr.ph = phi i64 [ 1, %for.body8.prol ], [ 0, %for.body8.preheader.for.body8.prol.loopexit_crit_edge ]
  %.unr22.ph = phi double [ %sub.prol, %for.body8.prol ], [ %12, %for.body8.preheader.for.body8.prol.loopexit_crit_edge ]
  %16 = icmp eq i64 %11, 0
  br i1 %16, label %for.body8.prol.loopexit.for.end_crit_edge, label %for.body8.preheader.new

for.body8.prol.loopexit.for.end_crit_edge:        ; preds = %for.body8.prol.loopexit
  br label %for.end

for.body8.preheader.new:                          ; preds = %for.body8.prol.loopexit
  br label %for.body8

for.body8:                                        ; preds = %for.body8.for.body8_crit_edge, %for.body8.preheader.new
  %indvars.iv28 = phi i64 [ %indvars.iv28.unr.ph, %for.body8.preheader.new ], [ %indvars.iv.next29.1, %for.body8.for.body8_crit_edge ]
  %17 = phi double [ %.unr22.ph, %for.body8.preheader.new ], [ %sub.1, %for.body8.for.body8_crit_edge ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv28
  %18 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv34
  %19 = load double, double* %arrayidx16, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %20 = load <2 x double>, <2 x double>* %18, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next29, i64 %indvars.iv34
  %21 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %19, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %21, i32 1
  %mul = fmul <2 x double> %20, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %17, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next29, %11
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  br i1 %exitcond6.1, label %for.end.loopexit, label %for.body8.for.body8_crit_edge

for.body8.for.body8_crit_edge:                    ; preds = %for.body8
  br label %for.body8

for.end.loopexit:                                 ; preds = %for.body8
  br label %for.end

for.end:                                          ; preds = %for.body8.prol.loopexit.for.end_crit_edge, %for.body3.for.end_crit_edge, %for.end.loopexit
  %.lcssa2 = phi double [ %12, %for.body3.for.end_crit_edge ], [ %sub.lcssa.unr.ph, %for.body8.prol.loopexit.for.end_crit_edge ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv34
  %22 = load double, double* %arrayidx20, align 8
  %div = fdiv double %.lcssa2, %22
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %indvars.iv.next5 = add nuw nsw i64 %11, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next35, %indvars.iv12
  br i1 %exitcond14, label %for.body30.lr.ph, label %for.end.for.body3_crit_edge

for.end.for.body3_crit_edge:                      ; preds = %for.end
  br label %for.body3

for.end57.loopexit:                               ; preds = %for.end50.us
  br label %for.end57

for.end57:                                        ; preds = %for.body30.lr.ph.for.end57_crit_edge, %for.cond1.preheader.for.end57_crit_edge, %for.end57.loopexit
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %indvars.iv.next8 = add nuw nsw i64 %0, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 2000
  br i1 %exitcond15, label %for.body63.preheader, label %for.end57.for.cond1.preheader_crit_edge

for.end57.for.cond1.preheader_crit_edge:          ; preds = %for.end57
  br label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.end57
  br label %for.body63

for.body63:                                       ; preds = %for.end79.for.body63_crit_edge, %for.body63.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.end79.for.body63_crit_edge ], [ 4294967295, %for.body63.preheader ]
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.end79.for.body63_crit_edge ], [ 0, %for.body63.preheader ]
  %23 = and i64 %indvars.iv1, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv26
  %24 = load double, double* %arrayidx65, align 8
  %cmp677 = icmp sgt i64 %indvars.iv26, 0
  br i1 %cmp677, label %for.body68.preheader, label %for.body63.for.end79_crit_edge

for.body63.for.end79_crit_edge:                   ; preds = %for.body63
  br label %for.end79

for.body68.preheader:                             ; preds = %for.body63
  %25 = add nsw i64 %indvars.iv1, 1
  %xtraiter16 = and i64 %25, 3
  %lcmp.mod17 = icmp eq i64 %xtraiter16, 0
  br i1 %lcmp.mod17, label %for.body68.preheader.for.body68.prol.loopexit_crit_edge, label %for.body68.prol.preheader

for.body68.preheader.for.body68.prol.loopexit_crit_edge: ; preds = %for.body68.preheader
  br label %for.body68.prol.loopexit

for.body68.prol.preheader:                        ; preds = %for.body68.preheader
  br label %for.body68.prol

for.body68.prol:                                  ; preds = %for.body68.prol.for.body68.prol_crit_edge, %for.body68.prol.preheader
  %indvars.iv21.prol = phi i64 [ %indvars.iv.next22.prol, %for.body68.prol.for.body68.prol_crit_edge ], [ 0, %for.body68.prol.preheader ]
  %26 = phi double [ %sub76.prol, %for.body68.prol.for.body68.prol_crit_edge ], [ %24, %for.body68.prol.preheader ]
  %prol.iter18 = phi i64 [ %prol.iter18.sub, %for.body68.prol.for.body68.prol_crit_edge ], [ %xtraiter16, %for.body68.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv26, i64 %indvars.iv21.prol
  %27 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv21.prol
  %28 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %27, %28
  %sub76.prol = fsub double %26, %mul75.prol
  %indvars.iv.next22.prol = add nuw nsw i64 %indvars.iv21.prol, 1
  %prol.iter18.sub = add i64 %prol.iter18, -1
  %prol.iter18.cmp = icmp eq i64 %prol.iter18.sub, 0
  br i1 %prol.iter18.cmp, label %for.body68.prol.loopexit.loopexit, label %for.body68.prol.for.body68.prol_crit_edge, !llvm.loop !20

for.body68.prol.for.body68.prol_crit_edge:        ; preds = %for.body68.prol
  br label %for.body68.prol

for.body68.prol.loopexit.loopexit:                ; preds = %for.body68.prol
  br label %for.body68.prol.loopexit

for.body68.prol.loopexit:                         ; preds = %for.body68.preheader.for.body68.prol.loopexit_crit_edge, %for.body68.prol.loopexit.loopexit
  %sub76.lcssa.unr = phi double [ undef, %for.body68.preheader.for.body68.prol.loopexit_crit_edge ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %indvars.iv21.unr = phi i64 [ 0, %for.body68.preheader.for.body68.prol.loopexit_crit_edge ], [ %indvars.iv.next22.prol, %for.body68.prol.loopexit.loopexit ]
  %.unr19 = phi double [ %24, %for.body68.preheader.for.body68.prol.loopexit_crit_edge ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %29 = icmp ult i64 %23, 3
  br i1 %29, label %for.body68.prol.loopexit.for.end79_crit_edge, label %for.body68.preheader.new

for.body68.prol.loopexit.for.end79_crit_edge:     ; preds = %for.body68.prol.loopexit
  br label %for.end79

for.body68.preheader.new:                         ; preds = %for.body68.prol.loopexit
  br label %for.body68

for.body68:                                       ; preds = %for.body68.for.body68_crit_edge, %for.body68.preheader.new
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr, %for.body68.preheader.new ], [ %indvars.iv.next22.3, %for.body68.for.body68_crit_edge ]
  %30 = phi double [ %.unr19, %for.body68.preheader.new ], [ %sub76.3, %for.body68.for.body68_crit_edge ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv26, i64 %indvars.iv21
  %31 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv21
  %32 = bitcast double* %arrayidx74 to <2 x double>*
  %33 = load <2 x double>, <2 x double>* %31, align 8
  %34 = load <2 x double>, <2 x double>* %32, align 8
  %mul75 = fmul <2 x double> %33, %34
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %30, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv26, i64 %indvars.iv.next22.1
  %35 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next22.1
  %36 = bitcast double* %arrayidx74.2 to <2 x double>*
  %indvars.iv.next22.2 = add nsw i64 %indvars.iv21, 3
  %37 = load <2 x double>, <2 x double>* %35, align 8
  %38 = load <2 x double>, <2 x double>* %36, align 8
  %mul75.2 = fmul <2 x double> %37, %38
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %exitcond3.3 = icmp eq i64 %indvars.iv.next22.2, %23
  %indvars.iv.next22.3 = add nsw i64 %indvars.iv21, 4
  br i1 %exitcond3.3, label %for.end79.loopexit, label %for.body68.for.body68_crit_edge

for.body68.for.body68_crit_edge:                  ; preds = %for.body68
  br label %for.body68

for.end79.loopexit:                               ; preds = %for.body68
  br label %for.end79

for.end79:                                        ; preds = %for.body68.prol.loopexit.for.end79_crit_edge, %for.body63.for.end79_crit_edge, %for.end79.loopexit
  %.lcssa1 = phi double [ %24, %for.body63.for.end79_crit_edge ], [ %sub76.lcssa.unr, %for.body68.prol.loopexit.for.end79_crit_edge ], [ %sub76.3, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv26
  store double %.lcssa1, double* %arrayidx81, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %indvars.iv.next2 = add nuw nsw i64 %23, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next27, 2000
  br i1 %exitcond11, label %for.body88.preheader, label %for.end79.for.body63_crit_edge

for.end79.for.body63_crit_edge:                   ; preds = %for.end79
  br label %for.body63

for.body88.preheader:                             ; preds = %for.end79
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.end104.for.body88_crit_edge
  %indvar = phi i32 [ 0, %for.body88.preheader ], [ %indvar.next, %for.end104.for.body88_crit_edge ]
  %indvars.iv19 = phi i64 [ 1999, %for.body88.preheader ], [ %indvars.iv.next20, %for.end104.for.body88_crit_edge ]
  %indvars.iv = phi i32 [ 2000, %for.body88.preheader ], [ %indvars.iv.next, %for.end104.for.body88_crit_edge ]
  %39 = sub i32 2000, %indvar
  %40 = sext i32 %39 to i64
  %41 = sub nsw i64 1999, %40
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv19
  %42 = load double, double* %arrayidx90, align 8
  %cmp924 = icmp slt i32 %indvars.iv, 2000
  br i1 %cmp924, label %for.body88.for.body93_crit_edge, label %for.body88.for.end104_crit_edge

for.body88.for.end104_crit_edge:                  ; preds = %for.body88
  br label %for.end104

for.body88.for.body93_crit_edge:                  ; preds = %for.body88
  %43 = sext i32 %indvars.iv to i64
  %44 = sub nsw i64 0, %40
  %xtraiter = and i64 %44, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body88.for.body93_crit_edge.for.body93.prol.loopexit_crit_edge, label %for.body93.prol.preheader

for.body88.for.body93_crit_edge.for.body93.prol.loopexit_crit_edge: ; preds = %for.body88.for.body93_crit_edge
  br label %for.body93.prol.loopexit

for.body93.prol.preheader:                        ; preds = %for.body88.for.body93_crit_edge
  br label %for.body93.prol

for.body93.prol:                                  ; preds = %for.body93.prol.for.body93.prol_crit_edge, %for.body93.prol.preheader
  %indvars.iv17.prol = phi i64 [ %indvars.iv.next18.prol, %for.body93.prol.for.body93.prol_crit_edge ], [ %43, %for.body93.prol.preheader ]
  %45 = phi double [ %sub101.prol, %for.body93.prol.for.body93.prol_crit_edge ], [ %42, %for.body93.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body93.prol.for.body93.prol_crit_edge ], [ %xtraiter, %for.body93.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv19, i64 %indvars.iv17.prol
  %46 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv17.prol
  %47 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %46, %47
  %sub101.prol = fsub double %45, %mul100.prol
  %indvars.iv.next18.prol = add nsw i64 %indvars.iv17.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body93.prol.loopexit.loopexit, label %for.body93.prol.for.body93.prol_crit_edge, !llvm.loop !22

for.body93.prol.for.body93.prol_crit_edge:        ; preds = %for.body93.prol
  br label %for.body93.prol

for.body93.prol.loopexit.loopexit:                ; preds = %for.body93.prol
  br label %for.body93.prol.loopexit

for.body93.prol.loopexit:                         ; preds = %for.body88.for.body93_crit_edge.for.body93.prol.loopexit_crit_edge, %for.body93.prol.loopexit.loopexit
  %sub101.lcssa.unr = phi double [ undef, %for.body88.for.body93_crit_edge.for.body93.prol.loopexit_crit_edge ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %indvars.iv17.unr = phi i64 [ %43, %for.body88.for.body93_crit_edge.for.body93.prol.loopexit_crit_edge ], [ %indvars.iv.next18.prol, %for.body93.prol.loopexit.loopexit ]
  %.unr = phi double [ %42, %for.body88.for.body93_crit_edge.for.body93.prol.loopexit_crit_edge ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %48 = icmp ult i64 %41, 3
  br i1 %48, label %for.body93.prol.loopexit.for.end104_crit_edge, label %for.body88.for.body93_crit_edge.new

for.body93.prol.loopexit.for.end104_crit_edge:    ; preds = %for.body93.prol.loopexit
  br label %for.end104

for.body88.for.body93_crit_edge.new:              ; preds = %for.body93.prol.loopexit
  br label %for.body93

for.body93:                                       ; preds = %for.body93.for.body93_crit_edge, %for.body88.for.body93_crit_edge.new
  %indvars.iv17 = phi i64 [ %indvars.iv17.unr, %for.body88.for.body93_crit_edge.new ], [ %indvars.iv.next18.3, %for.body93.for.body93_crit_edge ]
  %49 = phi double [ %.unr, %for.body88.for.body93_crit_edge.new ], [ %sub101.3, %for.body93.for.body93_crit_edge ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv19, i64 %indvars.iv17
  %50 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv17
  %51 = bitcast double* %arrayidx99 to <2 x double>*
  %52 = load <2 x double>, <2 x double>* %50, align 8
  %53 = load <2 x double>, <2 x double>* %51, align 8
  %mul100 = fmul <2 x double> %52, %53
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %49, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv19, i64 %indvars.iv.next18.1
  %54 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next18.1
  %55 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next18.2 = add nsw i64 %indvars.iv17, 3
  %56 = load <2 x double>, <2 x double>* %54, align 8
  %57 = load <2 x double>, <2 x double>* %55, align 8
  %mul100.2 = fmul <2 x double> %56, %57
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %exitcond.3 = icmp eq i64 %indvars.iv.next18.2, 1999
  %indvars.iv.next18.3 = add nsw i64 %indvars.iv17, 4
  br i1 %exitcond.3, label %for.end104.loopexit, label %for.body93.for.body93_crit_edge

for.body93.for.body93_crit_edge:                  ; preds = %for.body93
  br label %for.body93

for.end104.loopexit:                              ; preds = %for.body93
  br label %for.end104

for.end104:                                       ; preds = %for.body93.prol.loopexit.for.end104_crit_edge, %for.body88.for.end104_crit_edge, %for.end104.loopexit
  %.lcssa = phi double [ %42, %for.body88.for.end104_crit_edge ], [ %sub101.lcssa.unr, %for.body93.prol.loopexit.for.end104_crit_edge ], [ %sub101.3, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv19, i64 %indvars.iv19
  %58 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %.lcssa, %58
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv19
  store double %div109, double* %arrayidx111, align 8
  %cmp87 = icmp sgt i64 %indvars.iv19, 0
  br i1 %cmp87, label %for.end104.for.body88_crit_edge, label %for.end113

for.end104.for.body88_crit_edge:                  ; preds = %for.end104
  %indvars.iv.next20 = add i64 %indvars.iv19, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %for.body88

for.end113:                                       ; preds = %for.end104
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

for.body:                                         ; preds = %if.end.for.body_crit_edge, %entry.for.body_crit_edge
  %indvars.iv = phi i64 [ 0, %entry.for.body_crit_edge ], [ %indvars.iv.next, %if.end.for.body_crit_edge ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.body.if.end_crit_edge

for.body.if.end_crit_edge:                        ; preds = %for.body
  br label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %for.body.if.end_crit_edge, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %if.end.for.body_crit_edge

if.end.for.body_crit_edge:                        ; preds = %if.end
  br label %for.body

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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !21}
