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
  call fastcc void @init_array(double* %arraydecay, double* %arraydecay2)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_jacobi_1d(double* %arraydecay, double* %arraydecay2)
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
  call fastcc void @print_array(double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next.1, %for.inc ]
  %0 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %1 = insertelement <2 x double> undef, double %conv, i32 0
  %add.v.i0.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %add = fadd <2 x double> %add.v.i0.2, <double 2.000000e+00, double 3.000000e+00>
  %div = fdiv <2 x double> %add, <double 2.000000e+03, double 2.000000e+03>
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %div.v.r2, double* %arrayidx7, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %2 = trunc i64 %indvars.iv.next to i32
  %conv.1 = sitofp i32 %2 to double
  %arrayidx.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %3 = insertelement <2 x double> undef, double %conv.1, i32 0
  %add.v.i0.2.1 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  %add.1 = fadd <2 x double> %add.v.i0.2.1, <double 2.000000e+00, double 3.000000e+00>
  %div.1 = fdiv <2 x double> %add.1, <double 2.000000e+03, double 2.000000e+03>
  %div.v.r1.1 = extractelement <2 x double> %div.1, i32 0
  %div.v.r2.1 = extractelement <2 x double> %div.1, i32 1
  store double %div.v.r1.1, double* %arrayidx.1, align 8
  %arrayidx7.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %div.v.r2.1, double* %arrayidx7.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  %scevgep = getelementptr double, double* %A, i64 1
  %scevgep4 = getelementptr double, double* %A, i64 1999
  %scevgep7 = getelementptr double, double* %B, i64 2000
  %scevgep20 = getelementptr double, double* %B, i64 1
  %scevgep22 = getelementptr double, double* %B, i64 1999
  %scevgep25 = getelementptr double, double* %A, i64 2000
  %bound027 = icmp ult double* %scevgep20, %scevgep25
  %bound128 = icmp ugt double* %scevgep22, %A
  %found.conflict29 = and i1 %bound027, %bound128
  %bound0 = icmp ult double* %scevgep, %scevgep7
  %bound1 = icmp ugt double* %scevgep4, %B
  %found.conflict = and i1 %bound0, %bound1
  br label %for.body

for.body:                                         ; preds = %for.inc33, %entry
  %inc3413 = phi i32 [ 0, %entry ], [ %inc34, %for.inc33 ]
  br i1 %found.conflict29, label %for.inc.preheader, label %vector.body15.preheader

vector.body15.preheader:                          ; preds = %for.body
  br label %vector.body15

vector.body15:                                    ; preds = %vector.body15.preheader, %vector.body15
  %index33 = phi i64 [ %index.next34, %vector.body15 ], [ 0, %vector.body15.preheader ]
  %offset.idx37 = or i64 %index33, 1
  %0 = getelementptr inbounds double, double* %A, i64 %index33
  %1 = bitcast double* %0 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %1, align 8, !alias.scope !1
  %2 = getelementptr double, double* %0, i64 2
  %3 = bitcast double* %2 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %3, align 8, !alias.scope !1
  %4 = getelementptr inbounds double, double* %A, i64 %offset.idx37
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %5, align 8, !alias.scope !1
  %6 = getelementptr double, double* %4, i64 2
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = fadd <2 x double> %wide.load42, %wide.load44
  %9 = fadd <2 x double> %wide.load43, %wide.load45
  %10 = add nuw nsw i64 %offset.idx37, 1
  %11 = getelementptr inbounds double, double* %A, i64 %10
  %12 = getelementptr double, double* %11, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %8, %wide.load43
  %15 = fadd <2 x double> %9, %wide.load47
  %16 = fmul <2 x double> %14, <double 3.333300e-01, double 3.333300e-01>
  %17 = fmul <2 x double> %15, <double 3.333300e-01, double 3.333300e-01>
  %18 = getelementptr inbounds double, double* %B, i64 %offset.idx37
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> %16, <2 x double>* %19, align 8, !alias.scope !4, !noalias !1
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> %17, <2 x double>* %21, align 8, !alias.scope !4, !noalias !1
  %index.next34 = add i64 %index33, 4
  %22 = icmp eq i64 %index.next34, 1996
  br i1 %22, label %for.inc.preheader.loopexit, label %vector.body15, !llvm.loop !6

for.inc.preheader.loopexit:                       ; preds = %vector.body15
  br label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.preheader.loopexit, %for.body
  %indvars.iv.ph = phi i64 [ 1, %for.body ], [ 1997, %for.inc.preheader.loopexit ]
  br i1 false, label %for.inc.prol.preheader, label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.preheader, %for.inc.prol.preheader
  br i1 false, label %for.inc.prol.loopexit.unr-lcssa.vector.memcheck_crit_edge, label %for.inc.preheader.new

for.inc.prol.loopexit.unr-lcssa.vector.memcheck_crit_edge: ; preds = %for.inc.prol.loopexit.unr-lcssa
  br label %vector.memcheck

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %for.inc.preheader.new ], [ %add7.1, %for.inc ]
  %sub4 = add nsw i64 %indvars.iv, -1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %sub4
  %23 = load double, double* %arrayidx, align 8
  %arrayidx6 = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %24 = load double, double* %arrayidx6, align 8
  %add = fadd double %23, %24
  %add7 = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9 = getelementptr inbounds double, double* %A, i64 %add7
  %25 = load double, double* %arrayidx9, align 8
  %add10 = fadd double %add, %25
  %mul = fmul double %add10, 3.333300e-01
  %arrayidx12 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul, double* %arrayidx12, align 8
  %26 = load double, double* %arrayidx6, align 8
  %27 = load double, double* %arrayidx9, align 8
  %add.1 = fadd double %26, %27
  %add7.1 = add nsw i64 %indvars.iv, 2
  %arrayidx9.1 = getelementptr inbounds double, double* %A, i64 %add7.1
  %28 = load double, double* %arrayidx9.1, align 8
  %add10.1 = fadd double %add.1, %28
  %mul.1 = fmul double %add10.1, 3.333300e-01
  %arrayidx12.1 = getelementptr inbounds double, double* %B, i64 %add7
  store double %mul.1, double* %arrayidx12.1, align 8
  %exitcond.1 = icmp eq i64 %add7.1, 1999
  br i1 %exitcond.1, label %vector.memcheck.unr-lcssa, label %for.inc, !llvm.loop !9

vector.memcheck.unr-lcssa:                        ; preds = %for.inc
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.inc.prol.loopexit.unr-lcssa.vector.memcheck_crit_edge, %vector.memcheck.unr-lcssa
  br i1 %found.conflict, label %for.inc30.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %29 = getelementptr inbounds double, double* %B, i64 %index
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !10
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !10
  %33 = getelementptr inbounds double, double* %B, i64 %offset.idx
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !10
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !10
  %37 = fadd <2 x double> %wide.load, %wide.load11
  %38 = fadd <2 x double> %wide.load10, %wide.load12
  %39 = add nuw nsw i64 %offset.idx, 1
  %40 = getelementptr inbounds double, double* %B, i64 %39
  %41 = getelementptr double, double* %40, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !10
  %43 = fadd <2 x double> %37, %wide.load10
  %44 = fadd <2 x double> %38, %wide.load14
  %45 = fmul <2 x double> %43, <double 3.333300e-01, double 3.333300e-01>
  %46 = fmul <2 x double> %44, <double 3.333300e-01, double 3.333300e-01>
  %47 = getelementptr inbounds double, double* %A, i64 %offset.idx
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> %45, <2 x double>* %48, align 8, !alias.scope !13, !noalias !10
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> %46, <2 x double>* %50, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %51 = icmp eq i64 %index.next, 1996
  br i1 %51, label %for.inc30.preheader.loopexit, label %vector.body, !llvm.loop !15

for.inc30.preheader.loopexit:                     ; preds = %vector.body
  br label %for.inc30.preheader

for.inc30.preheader:                              ; preds = %for.inc30.preheader.loopexit, %vector.memcheck
  %indvars.iv14.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %for.inc30.preheader.loopexit ]
  br i1 false, label %for.inc30.prol.preheader, label %for.inc30.prol.loopexit.unr-lcssa

for.inc30.prol.preheader:                         ; preds = %for.inc30.preheader
  br label %for.inc30.prol.loopexit.unr-lcssa

for.inc30.prol.loopexit.unr-lcssa:                ; preds = %for.inc30.preheader, %for.inc30.prol.preheader
  br i1 false, label %for.inc30.prol.loopexit.unr-lcssa.for.inc33_crit_edge, label %for.inc30.preheader.new

for.inc30.prol.loopexit.unr-lcssa.for.inc33_crit_edge: ; preds = %for.inc30.prol.loopexit.unr-lcssa
  br label %for.inc33

for.inc30.preheader.new:                          ; preds = %for.inc30.prol.loopexit.unr-lcssa
  br label %for.inc30

for.inc30:                                        ; preds = %for.inc30, %for.inc30.preheader.new
  %indvars.iv14 = phi i64 [ %indvars.iv14.ph, %for.inc30.preheader.new ], [ %add23.1, %for.inc30 ]
  %sub17 = add nsw i64 %indvars.iv14, -1
  %arrayidx19 = getelementptr inbounds double, double* %B, i64 %sub17
  %52 = load double, double* %arrayidx19, align 8
  %arrayidx21 = getelementptr inbounds double, double* %B, i64 %indvars.iv14
  %53 = load double, double* %arrayidx21, align 8
  %add22 = fadd double %52, %53
  %add23 = add nuw nsw i64 %indvars.iv14, 1
  %arrayidx25 = getelementptr inbounds double, double* %B, i64 %add23
  %54 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add22, %54
  %mul27 = fmul double %add26, 3.333300e-01
  %arrayidx29 = getelementptr inbounds double, double* %A, i64 %indvars.iv14
  store double %mul27, double* %arrayidx29, align 8
  %55 = load double, double* %arrayidx21, align 8
  %56 = load double, double* %arrayidx25, align 8
  %add22.1 = fadd double %55, %56
  %add23.1 = add nsw i64 %indvars.iv14, 2
  %arrayidx25.1 = getelementptr inbounds double, double* %B, i64 %add23.1
  %57 = load double, double* %arrayidx25.1, align 8
  %add26.1 = fadd double %add22.1, %57
  %mul27.1 = fmul double %add26.1, 3.333300e-01
  %arrayidx29.1 = getelementptr inbounds double, double* %A, i64 %add23
  store double %mul27.1, double* %arrayidx29.1, align 8
  %exitcond1.1 = icmp eq i64 %add23.1, 1999
  br i1 %exitcond1.1, label %for.inc33.unr-lcssa, label %for.inc30, !llvm.loop !16

for.inc33.unr-lcssa:                              ; preds = %for.inc30
  br label %for.inc33

for.inc33:                                        ; preds = %for.inc30.prol.loopexit.unr-lcssa.for.inc33_crit_edge, %for.inc33.unr-lcssa
  %inc34 = add nuw nsw i32 %inc3413, 1
  %exitcond2 = icmp eq i32 %inc34, 500
  br i1 %exitcond2, label %for.end35, label %for.body

for.end35:                                        ; preds = %for.inc33
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
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
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
