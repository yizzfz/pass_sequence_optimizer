; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
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
  call void @init_array(double* nonnull %alpha, double* nonnull %beta, [2000 x double]* %arraydecay1, double* %arraydecay92, double* %arraydecay103, double* %arraydecay114, double* %arraydecay125, double* %arraydecay136, double* %arraydecay147, double* %arraydecay158, double* %arraydecay169)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call void @kernel_gemver(double %0, double %1, [2000 x double]* %arraydecay1, double* %arraydecay92, double* %arraydecay103, double* %arraydecay114, double* %arraydecay125, double* %arraydecay136, double* %arraydecay147, double* %arraydecay158, double* %arraydecay169)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @print_array(double* %arraydecay136)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
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

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture %alpha, double* nocapture %beta, [2000 x double]* nocapture %A, double* nocapture %u1, double* nocapture %v1, double* nocapture %u2, double* nocapture %v2, double* nocapture %w, double* nocapture %x, double* nocapture %y, double* nocapture %z) #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond35.for.end_crit_edge.us, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.cond35.for.end_crit_edge.us ]
  %0 = trunc i64 %indvars.iv11 to i32
  %conv2.us = sitofp i32 %0 to double
  %arrayidx.us = getelementptr inbounds double, double* %u1, i64 %indvars.iv11
  store double %conv2.us, double* %arrayidx.us, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %1 = trunc i64 %indvars.iv.next12 to i32
  %conv3.us = sitofp i32 %1 to double
  %arrayidx6.us = getelementptr inbounds double, double* %u2, i64 %indvars.iv11
  %2 = insertelement <2 x double> undef, double %conv3.us, i32 0
  %div.v.i0.2.us = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  %3 = fdiv <2 x double> %2, <double 2.000000e+03, double undef>
  %4 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  %div4.us = fmul <2 x double> %4, <double 5.000000e-01, double 2.500000e-01>
  %div4.v.r1.us = extractelement <2 x double> %div4.us, i32 0
  %div4.v.r2.us = extractelement <2 x double> %div4.us, i32 1
  store double %div4.v.r1.us, double* %arrayidx6.us, align 8
  %arrayidx12.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv11
  store double %div4.v.r2.us, double* %arrayidx12.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv11
  %div21.us = fdiv double %conv3.us, 2.000000e+03
  %div22.us = fmul double %div21.us, 1.250000e-01
  %arrayidx24.us = getelementptr inbounds double, double* %y, i64 %indvars.iv11
  store double %div22.us, double* %arrayidx24.us, align 8
  %div15.us = fdiv <2 x double> %div.v.i0.2.us, <double 2.000000e+03, double 2.000000e+03>
  %div16.us = fdiv <2 x double> %div15.us, <double 6.000000e+00, double 9.000000e+00>
  %div16.v.r1.us = extractelement <2 x double> %div16.us, i32 0
  %div16.v.r2.us = extractelement <2 x double> %div16.us, i32 1
  store double %div16.v.r1.us, double* %arrayidx18.us, align 8
  %arrayidx30.us = getelementptr inbounds double, double* %z, i64 %indvars.iv11
  store double %div16.v.r2.us, double* %arrayidx30.us, align 8
  %arrayidx32.us = getelementptr inbounds double, double* %x, i64 %indvars.iv11
  store double 0.000000e+00, double* %arrayidx32.us, align 8
  %arrayidx34.us = getelementptr inbounds double, double* %w, i64 %indvars.iv11
  store double 0.000000e+00, double* %arrayidx34.us, align 8
  br label %for.body38.us

for.body38.us:                                    ; preds = %for.body.us, %for.body38.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body38.us ], [ 0, %for.body.us ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv11
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 2000
  %conv39.us = sitofp i32 %rem.us to double
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv11
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
  br i1 %exitcond.1, label %for.cond35.for.end_crit_edge.us, label %for.body38.us

for.cond35.for.end_crit_edge.us:                  ; preds = %for.body38.us
  %exitcond = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond, label %for.end48, label %for.body.us

for.end48:                                        ; preds = %for.cond35.for.end_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_gemver(double %alpha, double %beta, [2000 x double]* %A, double* %u1, double* nocapture readonly %v1, double* %u2, double* nocapture readonly %v2, double* %w, double* %x, double* nocapture readonly %y, double* %z) #2 {
entry:
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
  %sunkaddr39 = ptrtoint double* %u2 to i64
  %scevgep6 = getelementptr double, double* %v1, i64 2000
  %scevgep9 = getelementptr double, double* %v2, i64 2000
  br label %for.body.us

for.body.us:                                      ; preds = %entry, %for.cond1.for.end_crit_edge.us
  %indvars.iv81 = phi i64 [ %0, %for.cond1.for.end_crit_edge.us ], [ 0, %entry ]
  %scevgep = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv81, i64 0
  %scevgep2 = bitcast double* %scevgep to i8*
  %0 = add i64 %indvars.iv81, 1
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 %0, i64 0
  %scevgep34 = bitcast double* %scevgep3 to i8*
  %sunkaddr36 = shl nuw nsw i64 %indvars.iv81, 3
  %sunkaddr37 = add i64 %sunkaddr, %sunkaddr36
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to double*
  %sunkaddr41 = add i64 %sunkaddr39, %sunkaddr36
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to double*
  %bc = inttoptr i64 %sunkaddr37 to i8*
  %bound0 = icmp ult i8* %scevgep2, %bc
  %bound1 = icmp ult i8* %bc, %scevgep34
  %found.conflict = and i1 %bound0, %bound1
  %bound012 = icmp ult double* %scevgep, %scevgep6
  %bound113 = icmp ugt double* %scevgep3, %v1
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
  %bc15 = inttoptr i64 %sunkaddr41 to i8*
  %bound017 = icmp ult i8* %scevgep2, %bc15
  %bound118 = icmp ult i8* %bc15, %scevgep34
  %found.conflict19 = and i1 %bound017, %bound118
  %conflict.rdx20 = or i1 %conflict.rdx, %found.conflict19
  %bound021 = icmp ult double* %scevgep, %scevgep9
  %bound122 = icmp ugt double* %scevgep3, %v2
  %found.conflict23 = and i1 %bound021, %bound122
  %conflict.rdx24 = or i1 %conflict.rdx20, %found.conflict23
  br i1 %conflict.rdx24, label %for.body3.us.preheader, label %vector.ph

for.body3.us.preheader:                           ; preds = %for.body.us
  br label %for.body3.us

vector.ph:                                        ; preds = %for.body.us
  %.pre61 = load double, double* %sunkaddr38, align 8, !alias.scope !1
  %.pre62 = load double, double* %sunkaddr42, align 8, !alias.scope !4
  %1 = insertelement <2 x double> undef, double %.pre61, i32 0
  %2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %3 = insertelement <2 x double> undef, double %.pre62, i32 0
  %4 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv81, i64 %index
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !6, !noalias !8
  %7 = getelementptr double, double* %5, i64 2
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load26 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !6, !noalias !8
  %9 = getelementptr inbounds double, double* %v1, i64 %index
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load27 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !11
  %11 = getelementptr double, double* %9, i64 2
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load28 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !11
  %13 = fmul <2 x double> %2, %wide.load27
  %14 = fmul <2 x double> %2, %wide.load28
  %15 = fadd <2 x double> %wide.load, %13
  %16 = fadd <2 x double> %wide.load26, %14
  %17 = getelementptr inbounds double, double* %v2, i64 %index
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load29 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !12
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load30 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !12
  %21 = fmul <2 x double> %4, %wide.load29
  %22 = fmul <2 x double> %4, %wide.load30
  %23 = fadd <2 x double> %15, %21
  %24 = fadd <2 x double> %16, %22
  store <2 x double> %23, <2 x double>* %6, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %24, <2 x double>* %8, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %25 = icmp eq i64 %index.next, 2000
  br i1 %25, label %for.cond1.for.end_crit_edge.us.loopexit64, label %vector.body, !llvm.loop !13

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.us.preheader
  %indvars.iv77 = phi i64 [ 0, %for.body3.us.preheader ], [ %indvars.iv.next78.1, %for.body3.us ]
  %arrayidx5.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv81, i64 %indvars.iv77
  %26 = load double, double* %arrayidx5.us, align 8
  %27 = load double, double* %sunkaddr38, align 8
  %arrayidx9.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv77
  %28 = load double, double* %arrayidx9.us, align 8
  %mul.us = fmul double %27, %28
  %add.us = fadd double %26, %mul.us
  %29 = load double, double* %sunkaddr42, align 8
  %arrayidx13.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv77
  %30 = load double, double* %arrayidx13.us, align 8
  %mul14.us = fmul double %29, %30
  %add15.us = fadd double %add.us, %mul14.us
  store double %add15.us, double* %arrayidx5.us, align 8
  %indvars.iv.next78 = or i64 %indvars.iv77, 1
  %arrayidx5.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv81, i64 %indvars.iv.next78
  %31 = load double, double* %arrayidx5.us.1, align 8
  %32 = load double, double* %sunkaddr38, align 8
  %arrayidx9.us.1 = getelementptr inbounds double, double* %v1, i64 %indvars.iv.next78
  %33 = load double, double* %arrayidx9.us.1, align 8
  %mul.us.1 = fmul double %32, %33
  %add.us.1 = fadd double %31, %mul.us.1
  %34 = load double, double* %sunkaddr42, align 8
  %arrayidx13.us.1 = getelementptr inbounds double, double* %v2, i64 %indvars.iv.next78
  %35 = load double, double* %arrayidx13.us.1, align 8
  %mul14.us.1 = fmul double %34, %35
  %add15.us.1 = fadd double %add.us.1, %mul14.us.1
  store double %add15.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next78.1 = add nsw i64 %indvars.iv77, 2
  %exitcond92.1 = icmp eq i64 %indvars.iv.next78.1, 2000
  br i1 %exitcond92.1, label %for.cond1.for.end_crit_edge.us.loopexit, label %for.body3.us, !llvm.loop !16

for.cond1.for.end_crit_edge.us.loopexit:          ; preds = %for.body3.us
  br label %for.cond1.for.end_crit_edge.us

for.cond1.for.end_crit_edge.us.loopexit64:        ; preds = %vector.body
  br label %for.cond1.for.end_crit_edge.us

for.cond1.for.end_crit_edge.us:                   ; preds = %for.cond1.for.end_crit_edge.us.loopexit64, %for.cond1.for.end_crit_edge.us.loopexit
  %exitcond94 = icmp eq i64 %0, 2000
  br i1 %exitcond94, label %for.body25.us.preheader, label %for.body.us

for.body25.us.preheader:                          ; preds = %for.cond1.for.end_crit_edge.us
  %sunkaddr43 = ptrtoint double* %x to i64
  br label %for.body25.us

for.body25.us:                                    ; preds = %for.cond26.for.end44_crit_edge.us, %for.body25.us.preheader
  %indvars.iv72 = phi i64 [ 0, %for.body25.us.preheader ], [ %indvars.iv.next73, %for.cond26.for.end44_crit_edge.us ]
  %sunkaddr44 = shl nuw nsw i64 %indvars.iv72, 3
  %sunkaddr45 = add i64 %sunkaddr43, %sunkaddr44
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to double*
  %.pre = load double, double* %sunkaddr46, align 8
  br label %for.body28.us

for.body28.us:                                    ; preds = %for.body25.us, %for.body28.us
  %36 = phi double [ %add39.us.1, %for.body28.us ], [ %.pre, %for.body25.us ]
  %indvars.iv68 = phi i64 [ %indvars.iv.next69.1, %for.body28.us ], [ 0, %for.body25.us ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 %indvars.iv72
  %37 = load double, double* %arrayidx34.us, align 8
  %mul35.us = fmul double %37, %beta
  %arrayidx37.us = getelementptr inbounds double, double* %y, i64 %indvars.iv68
  %38 = load double, double* %arrayidx37.us, align 8
  %mul38.us = fmul double %mul35.us, %38
  %add39.us = fadd double %36, %mul38.us
  store double %add39.us, double* %sunkaddr46, align 8
  %indvars.iv.next69 = or i64 %indvars.iv68, 1
  %arrayidx34.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next69, i64 %indvars.iv72
  %39 = load double, double* %arrayidx34.us.1, align 8
  %mul35.us.1 = fmul double %39, %beta
  %arrayidx37.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next69
  %40 = load double, double* %arrayidx37.us.1, align 8
  %mul38.us.1 = fmul double %mul35.us.1, %40
  %add39.us.1 = fadd double %add39.us, %mul38.us.1
  store double %add39.us.1, double* %sunkaddr46, align 8
  %indvars.iv.next69.1 = add nuw nsw i64 %indvars.iv68, 2
  %exitcond71.1 = icmp eq i64 %indvars.iv.next69.1, 2000
  br i1 %exitcond71.1, label %for.cond26.for.end44_crit_edge.us, label %for.body28.us

for.cond26.for.end44_crit_edge.us:                ; preds = %for.body28.us
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond90 = icmp eq i64 %indvars.iv.next73, 2000
  br i1 %exitcond90, label %for.body50.lr.ph, label %for.body25.us

for.body50.lr.ph:                                 ; preds = %for.cond26.for.end44_crit_edge.us
  %41 = load double*, double** %x.addr, align 8
  %42 = load double*, double** %z.addr, align 8
  %scevgep36 = getelementptr double, double* %41, i64 2000
  %scevgep38 = getelementptr double, double* %42, i64 2000
  %bound040 = icmp ult double* %41, %scevgep38
  %bound141 = icmp ult double* %42, %scevgep36
  %found.conflict42 = and i1 %bound040, %bound141
  br i1 %found.conflict42, label %for.body50.preheader, label %vector.body31.preheader

vector.body31.preheader:                          ; preds = %for.body50.lr.ph
  br label %vector.body31

for.body50.preheader:                             ; preds = %for.body50.lr.ph
  br label %for.body50

vector.body31:                                    ; preds = %vector.body31.preheader, %vector.body31
  %index46 = phi i64 [ %index.next47, %vector.body31 ], [ 0, %vector.body31.preheader ]
  %offset.idx = shl i64 %index46, 2
  %43 = getelementptr inbounds double, double* %41, i64 %offset.idx
  %44 = bitcast double* %43 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %44, align 8, !alias.scope !17, !noalias !20
  %45 = getelementptr inbounds double, double* %42, i64 %offset.idx
  %46 = bitcast double* %45 to <8 x double>*
  %wide.vec56 = load <8 x double>, <8 x double>* %46, align 8, !alias.scope !20
  %47 = fadd <8 x double> %wide.vec, %wide.vec56
  %48 = shufflevector <8 x double> %47, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %49 = shufflevector <8 x double> %47, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %50 = shufflevector <8 x double> %47, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %51 = or i64 %offset.idx, 3
  %52 = getelementptr inbounds double, double* %41, i64 %51
  %53 = shufflevector <8 x double> %47, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %54 = getelementptr double, double* %52, i64 -3
  %55 = bitcast double* %54 to <8 x double>*
  %56 = shufflevector <2 x double> %48, <2 x double> %49, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %57 = shufflevector <2 x double> %50, <2 x double> %53, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %56, <4 x double> %57, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %55, align 8, !alias.scope !17, !noalias !20
  %index.next47 = add i64 %index46, 2
  %58 = icmp eq i64 %index.next47, 500
  br i1 %58, label %for.body63.us.preheader.loopexit63, label %vector.body31, !llvm.loop !22

for.body50:                                       ; preds = %for.body50.preheader, %for.body50
  %indvars.iv64 = phi i64 [ %indvars.iv.next65.3, %for.body50 ], [ 0, %for.body50.preheader ]
  %arrayidx52 = getelementptr inbounds double, double* %41, i64 %indvars.iv64
  %59 = load double, double* %arrayidx52, align 8
  %arrayidx54 = getelementptr inbounds double, double* %42, i64 %indvars.iv64
  %60 = load double, double* %arrayidx54, align 8
  %add55 = fadd double %59, %60
  store double %add55, double* %arrayidx52, align 8
  %indvars.iv.next65 = or i64 %indvars.iv64, 1
  %arrayidx52.1 = getelementptr inbounds double, double* %41, i64 %indvars.iv.next65
  %61 = load double, double* %arrayidx52.1, align 8
  %arrayidx54.1 = getelementptr inbounds double, double* %42, i64 %indvars.iv.next65
  %62 = load double, double* %arrayidx54.1, align 8
  %add55.1 = fadd double %61, %62
  store double %add55.1, double* %arrayidx52.1, align 8
  %indvars.iv.next65.1 = or i64 %indvars.iv64, 2
  %arrayidx52.2 = getelementptr inbounds double, double* %41, i64 %indvars.iv.next65.1
  %63 = load double, double* %arrayidx52.2, align 8
  %arrayidx54.2 = getelementptr inbounds double, double* %42, i64 %indvars.iv.next65.1
  %64 = load double, double* %arrayidx54.2, align 8
  %add55.2 = fadd double %63, %64
  store double %add55.2, double* %arrayidx52.2, align 8
  %indvars.iv.next65.2 = or i64 %indvars.iv64, 3
  %arrayidx52.3 = getelementptr inbounds double, double* %41, i64 %indvars.iv.next65.2
  %65 = load double, double* %arrayidx52.3, align 8
  %arrayidx54.3 = getelementptr inbounds double, double* %42, i64 %indvars.iv.next65.2
  %66 = load double, double* %arrayidx54.3, align 8
  %add55.3 = fadd double %65, %66
  store double %add55.3, double* %arrayidx52.3, align 8
  %indvars.iv.next65.3 = add nuw nsw i64 %indvars.iv64, 4
  %exitcond67.3 = icmp eq i64 %indvars.iv.next65.3, 2000
  br i1 %exitcond67.3, label %for.body63.us.preheader.loopexit, label %for.body50, !llvm.loop !23

for.body63.us.preheader.loopexit:                 ; preds = %for.body50
  br label %for.body63.us.preheader

for.body63.us.preheader.loopexit63:               ; preds = %vector.body31
  br label %for.body63.us.preheader

for.body63.us.preheader:                          ; preds = %for.body63.us.preheader.loopexit63, %for.body63.us.preheader.loopexit
  %67 = bitcast double** %w.addr to i64*
  %68 = load i64, i64* %67, align 8
  %69 = load double, double* %alpha.addr, align 8
  %70 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body63.us

for.body63.us:                                    ; preds = %for.cond64.for.end82_crit_edge.us, %for.body63.us.preheader
  %indvars.iv59 = phi i64 [ 0, %for.body63.us.preheader ], [ %indvars.iv.next60, %for.cond64.for.end82_crit_edge.us ]
  %sunkaddr52 = shl nuw nsw i64 %indvars.iv59, 3
  %sunkaddr53 = add i64 %68, %sunkaddr52
  %sunkaddr54 = inttoptr i64 %sunkaddr53 to double*
  %.pre1 = load double, double* %sunkaddr54, align 8
  br label %for.body66.us

for.body66.us:                                    ; preds = %for.body63.us, %for.body66.us
  %71 = phi double [ %add77.us.1, %for.body66.us ], [ %.pre1, %for.body63.us ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body66.us ], [ 0, %for.body63.us ]
  %arrayidx72.us = getelementptr inbounds [2000 x double], [2000 x double]* %70, i64 %indvars.iv59, i64 %indvars.iv
  %72 = load double, double* %arrayidx72.us, align 8
  %mul73.us = fmul double %69, %72
  %arrayidx75.us = getelementptr inbounds double, double* %41, i64 %indvars.iv
  %73 = load double, double* %arrayidx75.us, align 8
  %mul76.us = fmul double %mul73.us, %73
  %add77.us = fadd double %71, %mul76.us
  store double %add77.us, double* %sunkaddr54, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx72.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %70, i64 %indvars.iv59, i64 %indvars.iv.next
  %74 = load double, double* %arrayidx72.us.1, align 8
  %mul73.us.1 = fmul double %69, %74
  %arrayidx75.us.1 = getelementptr inbounds double, double* %41, i64 %indvars.iv.next
  %75 = load double, double* %arrayidx75.us.1, align 8
  %mul76.us.1 = fmul double %mul73.us.1, %75
  %add77.us.1 = fadd double %add77.us, %mul76.us.1
  store double %add77.us.1, double* %sunkaddr54, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.cond64.for.end82_crit_edge.us, label %for.body66.us

for.cond64.for.end82_crit_edge.us:                ; preds = %for.body66.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond = icmp eq i64 %indvars.iv.next60, 2000
  br i1 %exitcond, label %for.end85, label %for.body63.us

for.end85:                                        ; preds = %for.cond64.for.end82_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(double* nocapture readonly %w) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %entry, %if.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %entry ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %w, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond4, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!2, !9, !5, !10}
!9 = distinct !{!9, !3}
!10 = distinct !{!10, !3}
!11 = !{!9}
!12 = !{!10}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !14, !15}
!23 = distinct !{!23, !14, !15}
