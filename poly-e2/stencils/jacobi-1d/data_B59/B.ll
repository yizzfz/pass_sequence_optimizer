; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to double*
  %arraydecay2 = bitcast i8* %call1 to double*
  call fastcc void @init_array(i32 2000, double* %arraydecay, double* %arraydecay2)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %arraydecay, double* %arraydecay2)
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
  call fastcc void @print_array(i32 2000, double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %entry
  %indvars.iv1 = phi i64 [ 0, %entry ], [ %indvars.iv.next.1, %for.inc ]
  %0 = trunc i64 %indvars.iv1 to i32
  %conv = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv1
  %1 = insertelement <2 x double> undef, double %conv, i32 0
  %add.v.i0.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %add = fadd <2 x double> %add.v.i0.2, <double 2.000000e+00, double 3.000000e+00>
  %div = fdiv <2 x double> %add, <double 2.000000e+03, double 2.000000e+03>
  %2 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv1
  %3 = bitcast double* %arrayidx7 to <2 x double>*
  %indvars.iv.next = or i64 %indvars.iv1, 1
  %4 = trunc i64 %indvars.iv.next to i32
  %conv.1 = sitofp i32 %4 to double
  %5 = insertelement <2 x double> undef, double %conv.1, i32 0
  %add.v.i0.2.1 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  %add.1 = fadd <2 x double> %add.v.i0.2.1, <double 2.000000e+00, double 3.000000e+00>
  %div.1 = fdiv <2 x double> %add.1, <double 2.000000e+03, double 2.000000e+03>
  %6 = shufflevector <2 x double> %div, <2 x double> %div.1, <2 x i32> <i32 0, i32 2>
  store <2 x double> %6, <2 x double>* %2, align 8
  %7 = shufflevector <2 x double> %div, <2 x double> %div.1, <2 x i32> <i32 1, i32 3>
  store <2 x double> %7, <2 x double>* %3, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv1, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  %scevgep = getelementptr double, double* %A, i64 1
  %scevgep10 = getelementptr double, double* %A, i64 1999
  %scevgep13 = getelementptr double, double* %B, i64 2000
  %scevgep26 = getelementptr double, double* %B, i64 1
  %scevgep28 = getelementptr double, double* %B, i64 1999
  %scevgep31 = getelementptr double, double* %A, i64 2000
  %bound033 = icmp ult double* %scevgep26, %scevgep31
  %bound134 = icmp ugt double* %scevgep28, %A
  %found.conflict35 = and i1 %bound033, %bound134
  %bound0 = icmp ult double* %scevgep, %scevgep13
  %bound1 = icmp ugt double* %scevgep10, %B
  %found.conflict = and i1 %bound0, %bound1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc33
  %0 = phi i32 [ 0, %entry ], [ %inc34, %for.inc33 ]
  br i1 %found.conflict35, label %for.inc.preheader, label %vector.body21.preheader

vector.body21.preheader:                          ; preds = %for.cond1.preheader
  br label %vector.body21

for.inc.preheader.loopexit:                       ; preds = %vector.body21
  br label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.preheader.loopexit, %for.cond1.preheader
  %indvars.iv7.ph = phi i64 [ 1, %for.cond1.preheader ], [ 1997, %for.inc.preheader.loopexit ]
  br i1 false, label %for.inc.prol.preheader, label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.preheader, %for.inc.prol.preheader
  br i1 false, label %for.inc.prol.loopexit.unr-lcssa.vector.memcheck_crit_edge, label %for.inc.preheader.new

for.inc.prol.loopexit.unr-lcssa.vector.memcheck_crit_edge: ; preds = %for.inc.prol.loopexit.unr-lcssa
  br label %vector.memcheck

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  br label %for.inc

vector.body21:                                    ; preds = %vector.body21.preheader, %vector.body21
  %index39 = phi i64 [ %index.next40, %vector.body21 ], [ 0, %vector.body21.preheader ]
  %offset.idx43 = or i64 %index39, 1
  %1 = getelementptr inbounds double, double* %A, i64 %index39
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !1
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !1
  %5 = getelementptr inbounds double, double* %A, i64 %offset.idx43
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = getelementptr double, double* %5, i64 2
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = fadd <2 x double> %wide.load48, %wide.load50
  %10 = fadd <2 x double> %wide.load49, %wide.load51
  %11 = add nuw nsw i64 %offset.idx43, 1
  %12 = getelementptr inbounds double, double* %A, i64 %11
  %13 = getelementptr double, double* %12, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = fadd <2 x double> %9, %wide.load49
  %16 = fadd <2 x double> %10, %wide.load53
  %17 = fmul <2 x double> %15, <double 3.333300e-01, double 3.333300e-01>
  %18 = fmul <2 x double> %16, <double 3.333300e-01, double 3.333300e-01>
  %19 = getelementptr inbounds double, double* %B, i64 %offset.idx43
  %20 = bitcast double* %19 to <2 x double>*
  store <2 x double> %17, <2 x double>* %20, align 8, !alias.scope !4, !noalias !1
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  store <2 x double> %18, <2 x double>* %22, align 8, !alias.scope !4, !noalias !1
  %index.next40 = add i64 %index39, 4
  %23 = icmp eq i64 %index.next40, 1996
  br i1 %23, label %for.inc.preheader.loopexit, label %vector.body21, !llvm.loop !6

vector.memcheck.unr-lcssa:                        ; preds = %for.inc
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.inc.prol.loopexit.unr-lcssa.vector.memcheck_crit_edge, %vector.memcheck.unr-lcssa
  br i1 %found.conflict, label %for.inc30.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.inc30.preheader.loopexit:                     ; preds = %vector.body
  br label %for.inc30.preheader

for.inc30.preheader:                              ; preds = %for.inc30.preheader.loopexit, %vector.memcheck
  %indvars.iv28.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %for.inc30.preheader.loopexit ]
  br i1 false, label %for.inc30.prol.preheader, label %for.inc30.prol.loopexit.unr-lcssa

for.inc30.prol.preheader:                         ; preds = %for.inc30.preheader
  br label %for.inc30.prol.loopexit.unr-lcssa

for.inc30.prol.loopexit.unr-lcssa:                ; preds = %for.inc30.preheader, %for.inc30.prol.preheader
  br i1 false, label %for.inc30.prol.loopexit.unr-lcssa.for.inc33_crit_edge, label %for.inc30.preheader.new

for.inc30.prol.loopexit.unr-lcssa.for.inc33_crit_edge: ; preds = %for.inc30.prol.loopexit.unr-lcssa
  br label %for.inc33

for.inc30.preheader.new:                          ; preds = %for.inc30.prol.loopexit.unr-lcssa
  br label %for.inc30

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %24 = getelementptr inbounds double, double* %B, i64 %index
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !9
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !9
  %28 = getelementptr inbounds double, double* %B, i64 %offset.idx
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !9
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !9
  %32 = fadd <2 x double> %wide.load, %wide.load17
  %33 = fadd <2 x double> %wide.load16, %wide.load18
  %34 = add nuw nsw i64 %offset.idx, 1
  %35 = getelementptr inbounds double, double* %B, i64 %34
  %36 = getelementptr double, double* %35, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load20 = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !9
  %38 = fadd <2 x double> %32, %wide.load16
  %39 = fadd <2 x double> %33, %wide.load20
  %40 = fmul <2 x double> %38, <double 3.333300e-01, double 3.333300e-01>
  %41 = fmul <2 x double> %39, <double 3.333300e-01, double 3.333300e-01>
  %42 = getelementptr inbounds double, double* %A, i64 %offset.idx
  %43 = bitcast double* %42 to <2 x double>*
  store <2 x double> %40, <2 x double>* %43, align 8, !alias.scope !12, !noalias !9
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x double>*
  store <2 x double> %41, <2 x double>* %45, align 8, !alias.scope !12, !noalias !9
  %index.next = add i64 %index, 4
  %46 = icmp eq i64 %index.next, 1996
  br i1 %46, label %for.inc30.preheader.loopexit, label %vector.body, !llvm.loop !14

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv7 = phi i64 [ %indvars.iv7.ph, %for.inc.preheader.new ], [ %indvars.iv.next.1, %for.inc ]
  %47 = add nsw i64 %indvars.iv7, -1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %47
  %48 = load double, double* %arrayidx, align 8
  %arrayidx6 = getelementptr inbounds double, double* %A, i64 %indvars.iv7
  %49 = load double, double* %arrayidx6, align 8
  %add = fadd double %48, %49
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %arrayidx9 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %50 = load double, double* %arrayidx9, align 8
  %add10 = fadd double %add, %50
  %mul = fmul double %add10, 3.333300e-01
  %arrayidx12 = getelementptr inbounds double, double* %B, i64 %indvars.iv7
  store double %mul, double* %arrayidx12, align 8
  %51 = load double, double* %arrayidx6, align 8
  %52 = load double, double* %arrayidx9, align 8
  %add.1 = fadd double %51, %52
  %indvars.iv.next.1 = add nsw i64 %indvars.iv7, 2
  %arrayidx9.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %53 = load double, double* %arrayidx9.1, align 8
  %add10.1 = fadd double %add.1, %53
  %mul.1 = fmul double %add10.1, 3.333300e-01
  %arrayidx12.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.1, double* %arrayidx12.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1999
  br i1 %exitcond.1, label %vector.memcheck.unr-lcssa, label %for.inc, !llvm.loop !15

for.inc30:                                        ; preds = %for.inc30, %for.inc30.preheader.new
  %indvars.iv28 = phi i64 [ %indvars.iv28.ph, %for.inc30.preheader.new ], [ %indvars.iv.next3.1, %for.inc30 ]
  %54 = add nsw i64 %indvars.iv28, -1
  %arrayidx19 = getelementptr inbounds double, double* %B, i64 %54
  %55 = load double, double* %arrayidx19, align 8
  %arrayidx21 = getelementptr inbounds double, double* %B, i64 %indvars.iv28
  %56 = load double, double* %arrayidx21, align 8
  %add22 = fadd double %55, %56
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv28, 1
  %arrayidx25 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next3
  %57 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add22, %57
  %mul27 = fmul double %add26, 3.333300e-01
  %arrayidx29 = getelementptr inbounds double, double* %A, i64 %indvars.iv28
  store double %mul27, double* %arrayidx29, align 8
  %58 = load double, double* %arrayidx21, align 8
  %59 = load double, double* %arrayidx25, align 8
  %add22.1 = fadd double %58, %59
  %indvars.iv.next3.1 = add nsw i64 %indvars.iv28, 2
  %arrayidx25.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next3.1
  %60 = load double, double* %arrayidx25.1, align 8
  %add26.1 = fadd double %add22.1, %60
  %mul27.1 = fmul double %add26.1, 3.333300e-01
  %arrayidx29.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next3
  store double %mul27.1, double* %arrayidx29.1, align 8
  %exitcond5.1 = icmp eq i64 %indvars.iv.next3.1, 1999
  br i1 %exitcond5.1, label %for.inc33.unr-lcssa, label %for.inc30, !llvm.loop !16

for.inc33.unr-lcssa:                              ; preds = %for.inc30
  br label %for.inc33

for.inc33:                                        ; preds = %for.inc30.prol.loopexit.unr-lcssa.for.inc33_crit_edge, %for.inc33.unr-lcssa
  %inc34 = add nuw nsw i32 %0, 1
  %exitcond6 = icmp eq i32 %inc34, 500
  br i1 %exitcond6, label %for.end35, label %for.cond1.preheader

for.end35:                                        ; preds = %for.inc33
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc
  %indvars.iv1 = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %3 = trunc i64 %indvars.iv1 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv1
  %6 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
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
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !7, !8}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
