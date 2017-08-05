; ModuleID = 'A.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %arraydecay = bitcast i8* %call to [2100 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  tail call fastcc void @init_array([2100 x double]* %arraydecay, double* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay7 = bitcast i8* %call2 to double*
  %arraydecay8 = bitcast i8* %call3 to double*
  tail call fastcc void @kernel_atax([2100 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay7, double* %arraydecay8)
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

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2100 x double]* nocapture %A, double* nocapture %x) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv16 = phi i64 [ 0, %entry ], [ %indvars.iv.next17.2, %for.body ]
  %0 = trunc i64 %indvars.iv16 to i32
  %conv2 = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv16
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %1 = trunc i64 %indvars.iv.next17 to i32
  %conv2.1 = sitofp i32 %1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv2, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv2.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.100000e+03, double 2.100000e+03>
  %add = fadd <2 x double> %div, <double 1.000000e+00, double 1.000000e+00>
  %2 = bitcast double* %arrayidx to <2 x double>*
  store <2 x double> %add, <2 x double>* %2, align 8
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv16, 2
  %3 = trunc i64 %indvars.iv.next17.1 to i32
  %conv2.2 = sitofp i32 %3 to double
  %div.2 = fdiv double %conv2.2, 2.100000e+03
  %add.2 = fadd double %div.2, 1.000000e+00
  %arrayidx.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next17.1
  store double %add.2, double* %arrayidx.2, align 8
  %indvars.iv.next17.2 = add nsw i64 %indvars.iv16, 3
  %exitcond19.2 = icmp eq i64 %indvars.iv.next17.1, 2099
  br i1 %exitcond19.2, label %for.body6.us.preheader, label %for.body

for.body6.us.preheader:                           ; preds = %for.body
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.body6.us.preheader, %for.cond7.for.inc22_crit_edge.us
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.cond7.for.inc22_crit_edge.us ], [ 0, %for.body6.us.preheader ]
  br label %for.body10.us

for.body10.us:                                    ; preds = %for.body10.us, %for.body6.us
  %indvars.iv = phi i64 [ 0, %for.body6.us ], [ %indvars.iv.next.1, %for.body10.us ]
  %4 = add nuw nsw i64 %indvars.iv, %indvars.iv14
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 2100
  %conv12.us = sitofp i32 %rem.us to double
  %arrayidx18.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %6 = add nuw nsw i64 %indvars.iv.next, %indvars.iv14
  %7 = trunc i64 %6 to i32
  %rem.us.1 = srem i32 %7, 2100
  %conv12.us.1 = sitofp i32 %rem.us.1 to double
  %div14.us.v.i0.1 = insertelement <2 x double> undef, double %conv12.us, i32 0
  %div14.us.v.i0.2 = insertelement <2 x double> %div14.us.v.i0.1, double %conv12.us.1, i32 1
  %div14.us = fdiv <2 x double> %div14.us.v.i0.2, <double 9.500000e+03, double 9.500000e+03>
  %8 = bitcast double* %arrayidx18.us to <2 x double>*
  store <2 x double> %div14.us, <2 x double>* %8, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 2099
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.cond7.for.inc22_crit_edge.us, label %for.body10.us

for.cond7.for.inc22_crit_edge.us:                 ; preds = %for.body10.us
  %indvars.iv.next15 = add i64 %indvars.iv14, 1
  %cmp4.us = icmp slt i64 %indvars.iv.next15, 1900
  br i1 %cmp4.us, label %for.body6.us, label %for.end24

for.end24:                                        ; preds = %for.cond7.for.inc22_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_atax([2100 x double]* readonly %A, double* nocapture readonly %x, double* %y, double* %tmp) unnamed_addr #0 {
entry:
  %scevgep7576 = bitcast double* %y to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7576, i8 0, i64 16800, i32 8, i1 false)
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv72 = phi i64 [ 0, %entry ], [ %indvars.iv.next73.24, %for.body ]
  %indvars.iv.next73.24 = add nsw i64 %indvars.iv72, 25
  %exitcond86.24 = icmp eq i64 %indvars.iv72, 2075
  br i1 %exitcond86.24, label %for.body5.lr.ph.for.body5.us_crit_edge, label %for.body

for.body5.lr.ph.for.body5.us_crit_edge:           ; preds = %for.body
  %scevgep = getelementptr double, double* %y, i64 1
  %scevgep92 = getelementptr double, double* %y, i64 2100
  %0 = ptrtoint double* %tmp to i64
  %1 = bitcast double* %scevgep92 to i8*
  %2 = bitcast double* %scevgep to i8*
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.inc42.us, %for.body5.lr.ph.for.body5.us_crit_edge
  %indvars.iv64 = phi i64 [ 0, %for.body5.lr.ph.for.body5.us_crit_edge ], [ %3, %for.inc42.us ]
  %scevgep94 = getelementptr [2100 x double], [2100 x double]* %A, i64 %indvars.iv64, i64 1
  %3 = add i64 %indvars.iv64, 1
  %scevgep96 = getelementptr [2100 x double], [2100 x double]* %A, i64 %3, i64 0
  %arrayidx7.us = getelementptr inbounds double, double* %tmp, i64 %indvars.iv64
  store double 0.000000e+00, double* %arrayidx7.us, align 8
  %sunkaddr82 = shl i64 %indvars.iv64, 3
  %sunkaddr83 = add i64 %0, %sunkaddr82
  %4 = inttoptr i64 %sunkaddr83 to double*
  br label %for.body10.us

for.inc42.us:                                     ; preds = %for.body26.us.for.body26.us_crit_edge
  %cmp4.us = icmp slt i64 %3, 1900
  br i1 %cmp4.us, label %for.body5.us, label %for.end44

for.body26.us.for.body26.us_crit_edge:            ; preds = %for.body26.us.for.body26.us_crit_edge, %for.body26.us.for.body26.us_crit_edge.preheader.new
  %indvars.iv.next6390 = phi i64 [ %indvars.iv.next63.prol, %for.body26.us.for.body26.us_crit_edge.preheader.new ], [ %indvars.iv.next63.1, %for.body26.us.for.body26.us_crit_edge ]
  %.pre = load double, double* %22, align 8
  %arrayidx28.us = getelementptr inbounds double, double* %y, i64 %indvars.iv.next6390
  %5 = load double, double* %arrayidx28.us, align 8
  %arrayidx32.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv.next6390
  %6 = load double, double* %arrayidx32.us, align 8
  %mul35.us = fmul double %6, %.pre
  %add36.us = fadd double %5, %mul35.us
  store double %add36.us, double* %arrayidx28.us, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv.next6390, 1
  %.pre.1 = load double, double* %22, align 8
  %arrayidx28.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next63
  %7 = load double, double* %arrayidx28.us.1, align 8
  %arrayidx32.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv.next63
  %8 = load double, double* %arrayidx32.us.1, align 8
  %mul35.us.1 = fmul double %8, %.pre.1
  %add36.us.1 = fadd double %7, %mul35.us.1
  store double %add36.us.1, double* %arrayidx28.us.1, align 8
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv.next6390, 2
  %exitcond85.1 = icmp eq i64 %indvars.iv.next63, 2099
  br i1 %exitcond85.1, label %for.inc42.us, label %for.body26.us.for.body26.us_crit_edge, !llvm.loop !1

for.body10.us:                                    ; preds = %for.body10.us, %for.body5.us
  %9 = phi double [ 0.000000e+00, %for.body5.us ], [ %add.us.2, %for.body10.us ]
  %indvars.iv = phi i64 [ 0, %for.body5.us ], [ %indvars.iv.next.2, %for.body10.us ]
  %arrayidx16.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv
  %10 = load double, double* %arrayidx16.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %11 = load double, double* %arrayidx18.us, align 8
  %mul.us = fmul double %10, %11
  %add.us = fadd double %9, %mul.us
  store double %add.us, double* %4, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx16.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv.next
  %12 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx18.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %13 = load double, double* %arrayidx18.us.1, align 8
  %mul.us.1 = fmul double %12, %13
  %add.us.1 = fadd double %add.us, %mul.us.1
  store double %add.us.1, double* %4, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx16.us.2 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv.next.1
  %14 = load double, double* %arrayidx16.us.2, align 8
  %arrayidx18.us.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next.1
  %15 = load double, double* %arrayidx18.us.2, align 8
  %mul.us.2 = fmul double %14, %15
  %add.us.2 = fadd double %add.us.1, %mul.us.2
  store double %add.us.2, double* %4, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.1, 2099
  br i1 %exitcond.2, label %for.body10.us.for.body26.us_crit_edge, label %for.body10.us

for.body10.us.for.body26.us_crit_edge:            ; preds = %for.body10.us
  %16 = load double, double* %y, align 8
  %arrayidx32.us87 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv64, i64 0
  %17 = load double, double* %arrayidx32.us87, align 8
  %mul35.us88 = fmul double %17, %add.us.2
  %add36.us89 = fadd double %16, %mul35.us88
  store double %add36.us89, double* %y, align 8
  %bc = inttoptr i64 %sunkaddr83 to i8*
  %bound0 = icmp ult i8* %2, %bc
  %bound1 = icmp ult i8* %bc, %1
  %found.conflict = and i1 %bound0, %bound1
  %bound099 = icmp ult double* %scevgep, %scevgep96
  %bound1100 = icmp ult double* %scevgep94, %scevgep92
  %found.conflict101 = and i1 %bound099, %bound1100
  %conflict.rdx = or i1 %found.conflict, %found.conflict101
  br i1 %conflict.rdx, label %for.body26.us.for.body26.us_crit_edge.preheader.new, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body10.us.for.body26.us_crit_edge
  %18 = inttoptr i64 %sunkaddr83 to double*
  br label %vector.body

for.body26.us.for.body26.us_crit_edge.preheader.new.loopexit: ; preds = %vector.body
  br label %for.body26.us.for.body26.us_crit_edge.preheader.new

for.body26.us.for.body26.us_crit_edge.preheader.new: ; preds = %for.body26.us.for.body26.us_crit_edge.preheader.new.loopexit, %for.body10.us.for.body26.us_crit_edge
  %indvars.iv.next6390.ph = phi i64 [ 1, %for.body10.us.for.body26.us_crit_edge ], [ 2097, %for.body26.us.for.body26.us_crit_edge.preheader.new.loopexit ]
  %19 = inttoptr i64 %sunkaddr83 to double*
  %.pre.prol = load double, double* %19, align 8
  %arrayidx28.us.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.next6390.ph
  %20 = load double, double* %arrayidx28.us.prol, align 8
  %arrayidx32.us.prol = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv.next6390.ph
  %21 = load double, double* %arrayidx32.us.prol, align 8
  %mul35.us.prol = fmul double %21, %.pre.prol
  %add36.us.prol = fadd double %20, %mul35.us.prol
  store double %add36.us.prol, double* %arrayidx28.us.prol, align 8
  %indvars.iv.next63.prol = add nuw nsw i64 %indvars.iv.next6390.ph, 1
  %22 = inttoptr i64 %sunkaddr83 to double*
  br label %for.body26.us.for.body26.us_crit_edge

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %23 = load double, double* %18, align 8, !alias.scope !4
  %24 = insertelement <2 x double> undef, double %23, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = getelementptr inbounds double, double* %y, i64 %offset.idx
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !7, !noalias !9
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !7, !noalias !9
  %30 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv64, i64 %offset.idx
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !11
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !11
  %34 = fmul <2 x double> %wide.load104, %25
  %35 = fmul <2 x double> %wide.load105, %25
  %36 = fadd <2 x double> %wide.load, %34
  %37 = fadd <2 x double> %wide.load103, %35
  store <2 x double> %36, <2 x double>* %27, align 8, !alias.scope !7, !noalias !9
  store <2 x double> %37, <2 x double>* %29, align 8, !alias.scope !7, !noalias !9
  %index.next = add i64 %index, 4
  %38 = icmp eq i64 %index.next, 2096
  br i1 %38, label %for.body26.us.for.body26.us_crit_edge.preheader.new.loopexit, label %vector.body, !llvm.loop !12

for.end44:                                        ; preds = %for.inc42.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %y) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
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
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, 2100
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!5, !10}
!10 = distinct !{!10, !6}
!11 = !{!10}
!12 = distinct !{!12, !2, !3}
