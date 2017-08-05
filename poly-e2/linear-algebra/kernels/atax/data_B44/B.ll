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
  %call = call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %call1 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call2 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call3 = call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %arraydecay1 = bitcast i8* %call to [2100 x double]*
  %arraydecay42 = bitcast i8* %call1 to double*
  call fastcc void @init_array([2100 x double]* %arraydecay1, double* %arraydecay42)
  call void (...) @polybench_timer_start() #4
  %arraydecay73 = bitcast i8* %call2 to double*
  %arraydecay84 = bitcast i8* %call3 to double*
  call fastcc void @kernel_atax([2100 x double]* %arraydecay1, double* %arraydecay42, double* %arraydecay73, double* %arraydecay84)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call2 to double*
  call fastcc void @print_array(double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2100 x double]* nocapture %A, double* nocapture %x) unnamed_addr #2 {
for.body.lr.ph.new:
  br label %for.body

for.cond7.preheader.us.new:                       ; preds = %for.cond7.preheader.us.new.preheader, %for.cond7.for.inc22_crit_edge.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.cond7.for.inc22_crit_edge.us ], [ 0, %for.cond7.preheader.us.new.preheader ]
  br label %for.body10.us

for.body10.us:                                    ; preds = %for.body10.us, %for.cond7.preheader.us.new
  %indvars.iv = phi i64 [ 0, %for.cond7.preheader.us.new ], [ %indvars.iv.next.1, %for.body10.us ]
  %0 = add nuw nsw i64 %indvars.iv16, %indvars.iv
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 2100
  %conv12.us = sitofp i32 %rem.us to double
  %arrayidx18.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %2 = add nuw nsw i64 %indvars.iv16, %indvars.iv.next
  %3 = trunc i64 %2 to i32
  %rem.us.1 = srem i32 %3, 2100
  %conv12.us.1 = sitofp i32 %rem.us.1 to double
  %div14.us.v.i0.1 = insertelement <2 x double> undef, double %conv12.us, i32 0
  %div14.us.v.i0.2 = insertelement <2 x double> %div14.us.v.i0.1, double %conv12.us.1, i32 1
  %div14.us = fdiv <2 x double> %div14.us.v.i0.2, <double 9.500000e+03, double 9.500000e+03>
  %4 = bitcast double* %arrayidx18.us to <2 x double>*
  store <2 x double> %div14.us, <2 x double>* %4, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 2099
  br i1 %exitcond.1, label %for.cond7.for.inc22_crit_edge.us, label %for.body10.us

for.cond7.for.inc22_crit_edge.us:                 ; preds = %for.body10.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, 1900
  br i1 %exitcond, label %for.end24, label %for.cond7.preheader.us.new

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %indvars.iv19 = phi i64 [ 0, %for.body.lr.ph.new ], [ %indvars.iv.next20.1, %for.body ]
  %5 = trunc i64 %indvars.iv19 to i32
  %conv2 = sitofp i32 %5 to double
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv19
  %indvars.iv.next20 = or i64 %indvars.iv19, 1
  %6 = trunc i64 %indvars.iv.next20 to i32
  %conv2.1 = sitofp i32 %6 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv2, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv2.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.100000e+03, double 2.100000e+03>
  %add = fadd <2 x double> %div, <double 1.000000e+00, double 1.000000e+00>
  %7 = bitcast double* %arrayidx to <2 x double>*
  store <2 x double> %add, <2 x double>* %7, align 8
  %indvars.iv.next20.1 = add nuw nsw i64 %indvars.iv19, 2
  %exitcond22.1 = icmp eq i64 %indvars.iv.next20, 2099
  br i1 %exitcond22.1, label %for.cond7.preheader.us.new.preheader, label %for.body

for.cond7.preheader.us.new.preheader:             ; preds = %for.body
  br label %for.cond7.preheader.us.new

for.end24:                                        ; preds = %for.cond7.for.inc22_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_atax([2100 x double]* readonly %A, double* nocapture readonly %x, double* %y, double* %tmp) unnamed_addr #0 {
for.body5.us.preheader:
  %y94 = bitcast double* %y to i8*
  call void @llvm.memset.p0i8.i64(i8* %y94, i8 0, i64 16800, i32 8, i1 false)
  %scevgep = getelementptr double, double* %y, i64 1
  %scevgep6 = getelementptr double, double* %y, i64 2100
  %0 = ptrtoint double* %tmp to i64
  %1 = bitcast double* %scevgep6 to i8*
  %2 = bitcast double* %scevgep to i8*
  br label %for.body5.us.new

for.body5.us.new:                                 ; preds = %for.inc42.us, %for.body5.us.preheader
  %indvars.iv67 = phi i64 [ 0, %for.body5.us.preheader ], [ %3, %for.inc42.us ]
  %scevgep8 = getelementptr [2100 x double], [2100 x double]* %A, i64 %indvars.iv67, i64 1
  %3 = add i64 %indvars.iv67, 1
  %scevgep10 = getelementptr [2100 x double], [2100 x double]* %A, i64 %3, i64 0
  %arrayidx7.us = getelementptr inbounds double, double* %tmp, i64 %indvars.iv67
  store double 0.000000e+00, double* %arrayidx7.us, align 8
  %sunkaddr85 = shl i64 %indvars.iv67, 3
  %sunkaddr86 = add i64 %0, %sunkaddr85
  %4 = inttoptr i64 %sunkaddr86 to double*
  br label %for.body10.us

for.inc42.us:                                     ; preds = %for.body26.us.for.body26.us_crit_edge
  %exitcond = icmp eq i64 %3, 1900
  br i1 %exitcond, label %for.end44, label %for.body5.us.new

for.body26.us.for.body26.us_crit_edge:            ; preds = %for.body26.us.for.body26.us_crit_edge, %for.body26.us.for.body26.us_crit_edge.preheader.new
  %indvars.iv634 = phi i64 [ %indvars.iv634.ph, %for.body26.us.for.body26.us_crit_edge.preheader.new ], [ %indvars.iv.next64.1, %for.body26.us.for.body26.us_crit_edge ]
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv634, 1
  %.pre60 = load double, double* %20, align 8
  %arrayidx28.us = getelementptr inbounds double, double* %y, i64 %indvars.iv.next64
  %5 = load double, double* %arrayidx28.us, align 8
  %arrayidx32.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv67, i64 %indvars.iv.next64
  %6 = load double, double* %arrayidx32.us, align 8
  %mul35.us = fmul double %6, %.pre60
  %add36.us = fadd double %5, %mul35.us
  store double %add36.us, double* %arrayidx28.us, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv634, 2
  %.pre60.1 = load double, double* %20, align 8
  %arrayidx28.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next64.1
  %7 = load double, double* %arrayidx28.us.1, align 8
  %arrayidx32.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv67, i64 %indvars.iv.next64.1
  %8 = load double, double* %arrayidx32.us.1, align 8
  %mul35.us.1 = fmul double %8, %.pre60.1
  %add36.us.1 = fadd double %7, %mul35.us.1
  store double %add36.us.1, double* %arrayidx28.us.1, align 8
  %exitcond66.1 = icmp eq i64 %indvars.iv.next64.1, 2099
  br i1 %exitcond66.1, label %for.inc42.us, label %for.body26.us.for.body26.us_crit_edge, !llvm.loop !1

for.body10.us:                                    ; preds = %for.body10.us, %for.body5.us.new
  %indvars.iv = phi i64 [ 0, %for.body5.us.new ], [ %indvars.iv.next.1, %for.body10.us ]
  %9 = phi double [ 0.000000e+00, %for.body5.us.new ], [ %add.us.1, %for.body10.us ]
  %arrayidx16.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv67, i64 %indvars.iv
  %10 = load double, double* %arrayidx16.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %11 = load double, double* %arrayidx18.us, align 8
  %mul.us = fmul double %10, %11
  %add.us = fadd double %9, %mul.us
  store double %add.us, double* %4, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx16.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv67, i64 %indvars.iv.next
  %12 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx18.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %13 = load double, double* %arrayidx18.us.1, align 8
  %mul.us.1 = fmul double %12, %13
  %add.us.1 = fadd double %add.us, %mul.us.1
  store double %add.us.1, double* %4, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 2099
  br i1 %exitcond.1, label %for.body10.us.for.body26.us_crit_edge, label %for.body10.us

for.body10.us.for.body26.us_crit_edge:            ; preds = %for.body10.us
  %14 = load double, double* %y, align 8
  %arrayidx32.us1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv67, i64 0
  %15 = load double, double* %arrayidx32.us1, align 8
  %mul35.us2 = fmul double %15, %add.us.1
  %add36.us3 = fadd double %14, %mul35.us2
  store double %add36.us3, double* %y, align 8
  %bc = inttoptr i64 %sunkaddr86 to i8*
  %bound0 = icmp ult i8* %2, %bc
  %bound1 = icmp ult i8* %bc, %1
  %found.conflict = and i1 %bound0, %bound1
  %bound013 = icmp ult double* %scevgep, %scevgep10
  %bound114 = icmp ult double* %scevgep8, %scevgep6
  %found.conflict15 = and i1 %bound013, %bound114
  %conflict.rdx = or i1 %found.conflict, %found.conflict15
  br i1 %conflict.rdx, label %for.body26.us.for.body26.us_crit_edge.preheader.new, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body10.us.for.body26.us_crit_edge
  %16 = inttoptr i64 %sunkaddr86 to double*
  br label %vector.body

for.body26.us.for.body26.us_crit_edge.preheader.new.loopexit: ; preds = %vector.body
  br label %for.body26.us.for.body26.us_crit_edge.preheader.new

for.body26.us.for.body26.us_crit_edge.preheader.new: ; preds = %for.body26.us.for.body26.us_crit_edge.preheader.new.loopexit, %for.body10.us.for.body26.us_crit_edge
  %indvars.iv634.ph = phi i64 [ 1, %for.body10.us.for.body26.us_crit_edge ], [ 2097, %for.body26.us.for.body26.us_crit_edge.preheader.new.loopexit ]
  %17 = inttoptr i64 %sunkaddr86 to double*
  %.pre60.prol = load double, double* %17, align 8
  %arrayidx28.us.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv634.ph
  %18 = load double, double* %arrayidx28.us.prol, align 8
  %arrayidx32.us.prol = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv67, i64 %indvars.iv634.ph
  %19 = load double, double* %arrayidx32.us.prol, align 8
  %mul35.us.prol = fmul double %19, %.pre60.prol
  %add36.us.prol = fadd double %18, %mul35.us.prol
  store double %add36.us.prol, double* %arrayidx28.us.prol, align 8
  %20 = inttoptr i64 %sunkaddr86 to double*
  br label %for.body26.us.for.body26.us_crit_edge

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %21 = or i64 %index, 1
  %22 = load double, double* %16, align 8, !alias.scope !4
  %23 = insertelement <2 x double> undef, double %22, i32 0
  %24 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> zeroinitializer
  %25 = getelementptr inbounds double, double* %y, i64 %21
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !7, !noalias !9
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !7, !noalias !9
  %29 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv67, i64 %21
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !11
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !11
  %33 = fmul <2 x double> %wide.load18, %24
  %34 = fmul <2 x double> %wide.load19, %24
  %35 = fadd <2 x double> %wide.load, %33
  %36 = fadd <2 x double> %wide.load17, %34
  store <2 x double> %35, <2 x double>* %26, align 8, !alias.scope !7, !noalias !9
  store <2 x double> %36, <2 x double>* %28, align 8, !alias.scope !7, !noalias !9
  %index.next = add i64 %index, 4
  %37 = icmp eq i64 %index.next, 2096
  br i1 %37, label %for.body26.us.for.body26.us_crit_edge.preheader.new.loopexit, label %vector.body, !llvm.loop !12

for.end44:                                        ; preds = %for.inc42.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %y) unnamed_addr #0 {
for.body.lr.ph:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %if.end, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %if.end ]
  %inc3 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %if.end ]
  %rem = srem i32 %inc3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %3) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %5 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %5) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %inc = add nuw nsw i32 %inc3, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %7) #6
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
