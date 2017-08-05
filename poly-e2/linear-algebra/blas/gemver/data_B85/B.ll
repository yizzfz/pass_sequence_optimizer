; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call8 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay1 = bitcast i8* %call to [2000 x double]*
  %arraydecay92 = bitcast i8* %call1 to double*
  %arraydecay103 = bitcast i8* %call2 to double*
  %arraydecay114 = bitcast i8* %call3 to double*
  %arraydecay125 = bitcast i8* %call4 to double*
  %arraydecay136 = bitcast i8* %call5 to double*
  %arraydecay147 = bitcast i8* %call6 to double*
  %arraydecay158 = bitcast i8* %call7 to double*
  %arraydecay169 = bitcast i8* %call8 to double*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [2000 x double]* %arraydecay1, double* %arraydecay92, double* %arraydecay103, double* %arraydecay114, double* %arraydecay125, double* %arraydecay136, double* %arraydecay147, double* %arraydecay158, double* %arraydecay169)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_gemver(double %0, double %1, [2000 x double]* %arraydecay1, double* %arraydecay92, double* %arraydecay103, double* %arraydecay114, double* %arraydecay125, double* %arraydecay136, double* %arraydecay147, double* %arraydecay158, double* %arraydecay169)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(double* %arraydecay136)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  call void @free(i8* %call3) #4
  call void @free(i8* %call4) #4
  call void @free(i8* %call5) #4
  call void @free(i8* %call6) #4
  call void @free(i8* %call7) #4
  call void @free(i8* %call8) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [2000 x double]* nocapture %A, double* nocapture %u1, double* nocapture %v1, double* nocapture %u2, double* nocapture %v2, double* nocapture %w, double* nocapture %x, double* nocapture %y, double* nocapture %z) unnamed_addr #2 {
for.body.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body38.us.preheader

for.body38.us.preheader:                          ; preds = %for.cond35.for.end_crit_edge.us.for.body38.us.preheader_crit_edge, %for.body.us.preheader
  %indvars.iv11 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next12, %for.cond35.for.end_crit_edge.us.for.body38.us.preheader_crit_edge ]
  %0 = trunc i64 %indvars.iv11 to i32
  %conv2.us = sitofp i32 %0 to double
  %arrayidx.us = getelementptr inbounds double, double* %u1, i64 %indvars.iv11
  store double %conv2.us, double* %arrayidx.us, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %1 = trunc i64 %indvars.iv.next12 to i32
  %conv3.us = sitofp i32 %1 to double
  %arrayidx6.us = getelementptr inbounds double, double* %u2, i64 %indvars.iv11
  %2 = insertelement <2 x double> undef, double %conv3.us, i32 0
  %3 = fdiv <2 x double> %2, <double 2.000000e+03, double undef>
  %4 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  %div4.us = fdiv <2 x double> %4, <double 2.000000e+00, double 4.000000e+00>
  %div4.v.r1.us = extractelement <2 x double> %div4.us, i32 0
  %div4.v.r2.us = extractelement <2 x double> %div4.us, i32 1
  store double %div4.v.r1.us, double* %arrayidx6.us, align 8
  %arrayidx12.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv11
  store double %div4.v.r2.us, double* %arrayidx12.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv11
  %div16.us = fdiv <2 x double> %4, <double 6.000000e+00, double 8.000000e+00>
  %div16.v.r1.us = extractelement <2 x double> %div16.us, i32 0
  %div16.v.r2.us = extractelement <2 x double> %div16.us, i32 1
  store double %div16.v.r1.us, double* %arrayidx18.us, align 8
  %arrayidx24.us = getelementptr inbounds double, double* %y, i64 %indvars.iv11
  store double %div16.v.r2.us, double* %arrayidx24.us, align 8
  %div27.us = fdiv double %conv3.us, 2.000000e+03
  %div28.us = fdiv double %div27.us, 9.000000e+00
  %arrayidx30.us = getelementptr inbounds double, double* %z, i64 %indvars.iv11
  store double %div28.us, double* %arrayidx30.us, align 8
  %arrayidx32.us = getelementptr inbounds double, double* %x, i64 %indvars.iv11
  store double 0.000000e+00, double* %arrayidx32.us, align 8
  %arrayidx34.us = getelementptr inbounds double, double* %w, i64 %indvars.iv11
  store double 0.000000e+00, double* %arrayidx34.us, align 8
  br label %for.body38.us

for.body38.us:                                    ; preds = %for.body38.us.for.body38.us_crit_edge, %for.body38.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body38.us.for.body38.us_crit_edge ], [ 0, %for.body38.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv11, %indvars.iv
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 2000
  %conv39.us = sitofp i32 %rem.us to double
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = mul nuw nsw i64 %indvars.iv11, %indvars.iv.next
  %8 = trunc i64 %7 to i32
  %rem.us.1 = srem i32 %8, 2000
  %conv39.us.1 = sitofp i32 %rem.us.1 to double
  %div41.us.v.i0.1 = insertelement <2 x double> undef, double %conv39.us, i32 0
  %div41.us.v.i0.2 = insertelement <2 x double> %div41.us.v.i0.1, double %conv39.us.1, i32 1
  %div41.us = fdiv <2 x double> %div41.us.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %9 = bitcast double* %arrayidx45.us to <2 x double>*
  store <2 x double> %div41.us, <2 x double>* %9, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.cond35.for.end_crit_edge.us, label %for.body38.us.for.body38.us_crit_edge

for.body38.us.for.body38.us_crit_edge:            ; preds = %for.body38.us
  br label %for.body38.us

for.cond35.for.end_crit_edge.us:                  ; preds = %for.body38.us
  %exitcond = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond, label %for.end48, label %for.cond35.for.end_crit_edge.us.for.body38.us.preheader_crit_edge

for.cond35.for.end_crit_edge.us.for.body38.us.preheader_crit_edge: ; preds = %for.cond35.for.end_crit_edge.us
  br label %for.body38.us.preheader

for.end48:                                        ; preds = %for.cond35.for.end_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double %alpha, double %beta, [2000 x double]* %A, double* %u1, double* nocapture readonly %v1, double* %u2, double* nocapture readonly %v2, double* %w, double* %x, double* nocapture readonly %y, double* %z) unnamed_addr #2 {
for.body.us.preheader:
  %alpha.addr = alloca double, align 8
  %A.addr = alloca [2000 x double]*, align 8
  %w.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %z.addr = alloca double*, align 8
  store double %alpha, double* %alpha.addr, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  store double* %w, double** %w.addr, align 8
  store double* %x, double** %x.addr, align 8
  store double* %z, double** %z.addr, align 8
  %sunkaddr = ptrtoint double* %u1 to i64
  %sunkaddr4 = ptrtoint double* %u2 to i64
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond1.for.end_crit_edge.us.for.body.us_crit_edge, %for.body.us.preheader
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %for.cond1.for.end_crit_edge.us.for.body.us_crit_edge ], [ 0, %for.body.us.preheader ]
  %sunkaddr1 = shl nuw nsw i64 %indvars.iv81, 3
  %sunkaddr2 = add i64 %sunkaddr, %sunkaddr1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to double*
  %sunkaddr6 = add i64 %sunkaddr4, %sunkaddr1
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to double*
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.body.us
  %indvars.iv77 = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next78, %for.body3.us.for.body3.us_crit_edge ]
  %arrayidx5.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv81, i64 %indvars.iv77
  %0 = load double, double* %arrayidx5.us, align 8
  %1 = load double, double* %sunkaddr3, align 8
  %arrayidx9.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv77
  %2 = load double, double* %arrayidx9.us, align 8
  %mul.us = fmul double %1, %2
  %add.us = fadd double %0, %mul.us
  %3 = load double, double* %sunkaddr7, align 8
  %arrayidx13.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv77
  %4 = load double, double* %arrayidx13.us, align 8
  %mul14.us = fmul double %3, %4
  %add15.us = fadd double %add.us, %mul14.us
  store double %add15.us, double* %arrayidx5.us, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next78, 2000
  br i1 %exitcond92, label %for.cond1.for.end_crit_edge.us, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  br label %for.body3.us

for.cond1.for.end_crit_edge.us:                   ; preds = %for.body3.us
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next82, 2000
  br i1 %exitcond94, label %for.body28.us.preheader.preheader, label %for.cond1.for.end_crit_edge.us.for.body.us_crit_edge

for.cond1.for.end_crit_edge.us.for.body.us_crit_edge: ; preds = %for.cond1.for.end_crit_edge.us
  br label %for.body.us

for.body28.us.preheader.preheader:                ; preds = %for.cond1.for.end_crit_edge.us
  %sunkaddr8 = ptrtoint double* %x to i64
  br label %for.body28.us.preheader

for.body28.us.preheader:                          ; preds = %for.cond26.for.end44_crit_edge.us.for.body28.us.preheader_crit_edge, %for.body28.us.preheader.preheader
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %for.cond26.for.end44_crit_edge.us.for.body28.us.preheader_crit_edge ], [ 0, %for.body28.us.preheader.preheader ]
  %sunkaddr9 = shl nuw nsw i64 %indvars.iv72, 3
  %sunkaddr10 = add i64 %sunkaddr8, %sunkaddr9
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to double*
  %.pre = load double, double* %sunkaddr11, align 8
  br label %for.body28.us

for.body28.us:                                    ; preds = %for.body28.us.for.body28.us_crit_edge, %for.body28.us.preheader
  %5 = phi double [ %add39.us.1, %for.body28.us.for.body28.us_crit_edge ], [ %.pre, %for.body28.us.preheader ]
  %indvars.iv68 = phi i64 [ %indvars.iv.next69.1, %for.body28.us.for.body28.us_crit_edge ], [ 0, %for.body28.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 %indvars.iv72
  %6 = load double, double* %arrayidx34.us, align 8
  %mul35.us = fmul double %6, %beta
  %arrayidx37.us = getelementptr inbounds double, double* %y, i64 %indvars.iv68
  %7 = load double, double* %arrayidx37.us, align 8
  %mul38.us = fmul double %mul35.us, %7
  %add39.us = fadd double %5, %mul38.us
  store double %add39.us, double* %sunkaddr11, align 8
  %indvars.iv.next69 = or i64 %indvars.iv68, 1
  %arrayidx34.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next69, i64 %indvars.iv72
  %8 = load double, double* %arrayidx34.us.1, align 8
  %mul35.us.1 = fmul double %8, %beta
  %arrayidx37.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next69
  %9 = load double, double* %arrayidx37.us.1, align 8
  %mul38.us.1 = fmul double %mul35.us.1, %9
  %add39.us.1 = fadd double %add39.us, %mul38.us.1
  store double %add39.us.1, double* %sunkaddr11, align 8
  %indvars.iv.next69.1 = add nuw nsw i64 %indvars.iv68, 2
  %exitcond71.1 = icmp eq i64 %indvars.iv.next69.1, 2000
  br i1 %exitcond71.1, label %for.cond26.for.end44_crit_edge.us, label %for.body28.us.for.body28.us_crit_edge

for.body28.us.for.body28.us_crit_edge:            ; preds = %for.body28.us
  br label %for.body28.us

for.cond26.for.end44_crit_edge.us:                ; preds = %for.body28.us
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond90 = icmp eq i64 %indvars.iv.next73, 2000
  br i1 %exitcond90, label %for.body50.lr.ph, label %for.cond26.for.end44_crit_edge.us.for.body28.us.preheader_crit_edge

for.cond26.for.end44_crit_edge.us.for.body28.us.preheader_crit_edge: ; preds = %for.cond26.for.end44_crit_edge.us
  br label %for.body28.us.preheader

for.body50.lr.ph:                                 ; preds = %for.cond26.for.end44_crit_edge.us
  %10 = load double*, double** %x.addr, align 8
  %11 = load double*, double** %z.addr, align 8
  %scevgep = getelementptr double, double* %10, i64 2000
  %scevgep16 = getelementptr double, double* %11, i64 2000
  %bound0 = icmp ult double* %10, %scevgep16
  %bound1 = icmp ult double* %11, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.body50.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body50.lr.ph
  br label %vector.body

for.body50.preheader:                             ; preds = %for.body50.lr.ph
  br label %for.body50

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %12 = getelementptr inbounds double, double* %10, i64 %offset.idx
  %13 = bitcast double* %12 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %13, align 8, !alias.scope !1, !noalias !4
  %14 = getelementptr inbounds double, double* %11, i64 %offset.idx
  %15 = bitcast double* %14 to <8 x double>*
  %wide.vec21 = load <8 x double>, <8 x double>* %15, align 8, !alias.scope !4
  %16 = fadd <8 x double> %wide.vec, %wide.vec21
  %17 = shufflevector <8 x double> %16, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %18 = shufflevector <8 x double> %16, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %19 = shufflevector <8 x double> %16, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %20 = or i64 %offset.idx, 3
  %21 = getelementptr inbounds double, double* %10, i64 %20
  %22 = shufflevector <8 x double> %16, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %23 = getelementptr double, double* %21, i64 -3
  %24 = bitcast double* %23 to <8 x double>*
  %25 = shufflevector <2 x double> %17, <2 x double> %18, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %26 = shufflevector <2 x double> %19, <2 x double> %22, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %25, <4 x double> %26, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %24, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 2
  %27 = icmp eq i64 %index.next, 500
  br i1 %27, label %for.body63.us.preheader.loopexit26, label %vector.body.vector.body_crit_edge, !llvm.loop !6

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

for.body50:                                       ; preds = %for.body50.for.body50_crit_edge, %for.body50.preheader
  %indvars.iv64 = phi i64 [ %indvars.iv.next65.3, %for.body50.for.body50_crit_edge ], [ 0, %for.body50.preheader ]
  %arrayidx52 = getelementptr inbounds double, double* %10, i64 %indvars.iv64
  %28 = load double, double* %arrayidx52, align 8
  %arrayidx54 = getelementptr inbounds double, double* %11, i64 %indvars.iv64
  %29 = load double, double* %arrayidx54, align 8
  %add55 = fadd double %28, %29
  store double %add55, double* %arrayidx52, align 8
  %indvars.iv.next65 = or i64 %indvars.iv64, 1
  %arrayidx52.1 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next65
  %30 = load double, double* %arrayidx52.1, align 8
  %arrayidx54.1 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next65
  %31 = load double, double* %arrayidx54.1, align 8
  %add55.1 = fadd double %30, %31
  store double %add55.1, double* %arrayidx52.1, align 8
  %indvars.iv.next65.1 = or i64 %indvars.iv64, 2
  %arrayidx52.2 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next65.1
  %32 = load double, double* %arrayidx52.2, align 8
  %arrayidx54.2 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next65.1
  %33 = load double, double* %arrayidx54.2, align 8
  %add55.2 = fadd double %32, %33
  store double %add55.2, double* %arrayidx52.2, align 8
  %indvars.iv.next65.2 = or i64 %indvars.iv64, 3
  %arrayidx52.3 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next65.2
  %34 = load double, double* %arrayidx52.3, align 8
  %arrayidx54.3 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next65.2
  %35 = load double, double* %arrayidx54.3, align 8
  %add55.3 = fadd double %34, %35
  store double %add55.3, double* %arrayidx52.3, align 8
  %indvars.iv.next65.3 = add nuw nsw i64 %indvars.iv64, 4
  %exitcond67.3 = icmp eq i64 %indvars.iv.next65.3, 2000
  br i1 %exitcond67.3, label %for.body63.us.preheader.loopexit, label %for.body50.for.body50_crit_edge, !llvm.loop !9

for.body50.for.body50_crit_edge:                  ; preds = %for.body50
  br label %for.body50

for.body63.us.preheader.loopexit:                 ; preds = %for.body50
  br label %for.body63.us.preheader

for.body63.us.preheader.loopexit26:               ; preds = %vector.body
  br label %for.body63.us.preheader

for.body63.us.preheader:                          ; preds = %for.body63.us.preheader.loopexit26, %for.body63.us.preheader.loopexit
  %36 = bitcast double** %w.addr to i64*
  %37 = load i64, i64* %36, align 8
  %38 = load double, double* %alpha.addr, align 8
  %39 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body66.us.preheader

for.body66.us.preheader:                          ; preds = %for.cond64.for.end82_crit_edge.us.for.body66.us.preheader_crit_edge, %for.body63.us.preheader
  %indvars.iv59 = phi i64 [ 0, %for.body63.us.preheader ], [ %indvars.iv.next60, %for.cond64.for.end82_crit_edge.us.for.body66.us.preheader_crit_edge ]
  %sunkaddr12 = shl nuw nsw i64 %indvars.iv59, 3
  %sunkaddr13 = add i64 %37, %sunkaddr12
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to double*
  %.pre27 = load double, double* %sunkaddr14, align 8
  br label %for.body66.us

for.body66.us:                                    ; preds = %for.body66.us.for.body66.us_crit_edge, %for.body66.us.preheader
  %40 = phi double [ %add77.us.1, %for.body66.us.for.body66.us_crit_edge ], [ %.pre27, %for.body66.us.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body66.us.for.body66.us_crit_edge ], [ 0, %for.body66.us.preheader ]
  %arrayidx72.us = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv59, i64 %indvars.iv
  %41 = load double, double* %arrayidx72.us, align 8
  %mul73.us = fmul double %38, %41
  %arrayidx75.us = getelementptr inbounds double, double* %10, i64 %indvars.iv
  %42 = load double, double* %arrayidx75.us, align 8
  %mul76.us = fmul double %mul73.us, %42
  %add77.us = fadd double %40, %mul76.us
  store double %add77.us, double* %sunkaddr14, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx72.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i64 %indvars.iv59, i64 %indvars.iv.next
  %43 = load double, double* %arrayidx72.us.1, align 8
  %mul73.us.1 = fmul double %38, %43
  %arrayidx75.us.1 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next
  %44 = load double, double* %arrayidx75.us.1, align 8
  %mul76.us.1 = fmul double %mul73.us.1, %44
  %add77.us.1 = fadd double %add77.us, %mul76.us.1
  store double %add77.us.1, double* %sunkaddr14, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.cond64.for.end82_crit_edge.us, label %for.body66.us.for.body66.us_crit_edge

for.body66.us.for.body66.us_crit_edge:            ; preds = %for.body66.us
  br label %for.body66.us

for.cond64.for.end82_crit_edge.us:                ; preds = %for.body66.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond = icmp eq i64 %indvars.iv.next60, 2000
  br i1 %exitcond, label %for.end85, label %for.cond64.for.end82_crit_edge.us.for.body66.us.preheader_crit_edge

for.cond64.for.end82_crit_edge.us.for.body66.us.preheader_crit_edge: ; preds = %for.cond64.for.end82_crit_edge.us
  br label %for.body66.us.preheader

for.end85:                                        ; preds = %for.cond64.for.end82_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %w) unnamed_addr #0 {
for.body.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %if.end.for.body_crit_edge, %for.body.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.for.body_crit_edge ], [ 0, %for.body.preheader ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.body.if.end_crit_edge

for.body.if.end_crit_edge:                        ; preds = %for.body
  br label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %for.body.if.end_crit_edge, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %w, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond4, label %for.end, label %if.end.for.body_crit_edge

if.end.for.body_crit_edge:                        ; preds = %if.end
  br label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
