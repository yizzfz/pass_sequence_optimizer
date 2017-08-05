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
  %call = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to double*
  %arraydecay2 = bitcast i8* %call1 to double*
  tail call fastcc void @init_array(i32 2000, double* %arraydecay, double* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %arraydecay, double* %arraydecay2)
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
  tail call fastcc void @print_array(i32 2000, double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next.1, %for.body ]
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
  br i1 %exitcond.1, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  %scevgep109 = getelementptr double, double* %B, i64 1
  %scevgep111 = getelementptr double, double* %B, i64 1999
  %scevgep114 = getelementptr double, double* %A, i64 2000
  %bound0116 = icmp ult double* %scevgep109, %scevgep114
  %bound1117 = icmp ugt double* %scevgep111, %A
  %found.conflict118 = and i1 %bound0116, %bound1117
  %scevgep = getelementptr double, double* %A, i64 1
  %scevgep89 = getelementptr double, double* %A, i64 1999
  %scevgep95 = getelementptr double, double* %B, i64 2000
  %bound0 = icmp ult double* %scevgep, %scevgep95
  %bound1 = icmp ugt double* %scevgep89, %B
  %found.conflict = and i1 %bound0, %bound1
  br label %for.body3.lr.ph.us

for.inc33.us:                                     ; preds = %for.body16.us
  %inc34.us = add nuw nsw i32 %inc3411.us, 1
  %exitcond86 = icmp eq i32 %inc34.us, 500
  br i1 %exitcond86, label %for.end35, label %for.body3.lr.ph.us

for.body16.us:                                    ; preds = %for.body16.us.preheader, %for.body16.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62.1, %for.body16.us ], [ %indvars.iv61.ph, %for.body16.us.preheader ]
  %0 = add nsw i64 %indvars.iv61, -1
  %arrayidx19.us = getelementptr inbounds double, double* %B, i64 %0
  %1 = load double, double* %arrayidx19.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %B, i64 %indvars.iv61
  %2 = load double, double* %arrayidx21.us, align 8
  %add22.us = fadd double %1, %2
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %arrayidx25.us = getelementptr inbounds double, double* %B, i64 %indvars.iv.next62
  %3 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add22.us, %3
  %mul27.us = fmul double %add26.us, 3.333300e-01
  %arrayidx29.us = getelementptr inbounds double, double* %A, i64 %indvars.iv61
  store double %mul27.us, double* %arrayidx29.us, align 8
  %4 = load double, double* %arrayidx21.us, align 8
  %5 = load double, double* %arrayidx25.us, align 8
  %add22.us.1 = fadd double %4, %5
  %indvars.iv.next62.1 = add nuw nsw i64 %indvars.iv61, 2
  %arrayidx25.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next62.1
  %6 = load double, double* %arrayidx25.us.1, align 8
  %add26.us.1 = fadd double %add22.us.1, %6
  %mul27.us.1 = fmul double %add26.us.1, 3.333300e-01
  %arrayidx29.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next62
  store double %mul27.us.1, double* %arrayidx29.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next62.1, 1999
  br i1 %exitcond.1, label %for.inc33.us, label %for.body16.us, !llvm.loop !1

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %for.body3.us.preheader.new ], [ %indvars.iv.next.1, %for.body3.us ]
  %7 = add nsw i64 %indvars.iv, -1
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %7
  %8 = load double, double* %arrayidx.us, align 8
  %arrayidx6.us = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %9 = load double, double* %arrayidx6.us, align 8
  %add.us = fadd double %8, %9
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.us = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %10 = load double, double* %arrayidx9.us, align 8
  %add10.us = fadd double %add.us, %10
  %mul.us = fmul double %add10.us, 3.333300e-01
  %arrayidx12.us = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul.us, double* %arrayidx12.us, align 8
  %11 = load double, double* %arrayidx6.us, align 8
  %12 = load double, double* %arrayidx9.us, align 8
  %add.us.1 = fadd double %11, %12
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx9.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %13 = load double, double* %arrayidx9.us.1, align 8
  %add10.us.1 = fadd double %add.us.1, %13
  %mul.us.1 = fmul double %add10.us.1, 3.333300e-01
  %arrayidx12.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.us.1, double* %arrayidx12.us.1, align 8
  %exitcond.1136 = icmp eq i64 %indvars.iv.next.1, 1999
  br i1 %exitcond.1136, label %vector.memcheck.unr-lcssa, label %for.body3.us, !llvm.loop !4

for.body3.lr.ph.us:                               ; preds = %for.inc33.us, %entry
  %inc3411.us = phi i32 [ 0, %entry ], [ %inc34.us, %for.inc33.us ]
  br i1 %found.conflict118, label %for.body3.us.preheader, label %vector.body104.preheader

vector.body104.preheader:                         ; preds = %for.body3.lr.ph.us
  br label %vector.body104

for.body3.us.preheader.loopexit:                  ; preds = %vector.body104
  br label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.preheader.loopexit, %for.body3.lr.ph.us
  %indvars.iv.ph = phi i64 [ 1, %for.body3.lr.ph.us ], [ 1997, %for.body3.us.preheader.loopexit ]
  br i1 false, label %for.body3.us.prol.preheader, label %for.body3.us.prol.loopexit.unr-lcssa

for.body3.us.prol.preheader:                      ; preds = %for.body3.us.preheader
  br label %for.body3.us.prol.loopexit.unr-lcssa

for.body3.us.prol.loopexit.unr-lcssa:             ; preds = %for.body3.us.preheader, %for.body3.us.prol.preheader
  br i1 false, label %for.body3.us.prol.loopexit.unr-lcssa.vector.memcheck_crit_edge, label %for.body3.us.preheader.new

for.body3.us.prol.loopexit.unr-lcssa.vector.memcheck_crit_edge: ; preds = %for.body3.us.prol.loopexit.unr-lcssa
  br label %vector.memcheck

for.body3.us.preheader.new:                       ; preds = %for.body3.us.prol.loopexit.unr-lcssa
  br label %for.body3.us

vector.body104:                                   ; preds = %vector.body104.preheader, %vector.body104
  %index122 = phi i64 [ %index.next123, %vector.body104 ], [ 0, %vector.body104.preheader ]
  %offset.idx126 = or i64 %index122, 1
  %14 = getelementptr inbounds double, double* %A, i64 %index122
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !5
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !5
  %18 = getelementptr inbounds double, double* %A, i64 %offset.idx126
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !5
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !5
  %22 = fadd <2 x double> %wide.load, %wide.load132
  %23 = fadd <2 x double> %wide.load131, %wide.load133
  %24 = add nuw nsw i64 %offset.idx126, 1
  %25 = getelementptr inbounds double, double* %A, i64 %24
  %26 = getelementptr double, double* %25, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !5
  %28 = fadd <2 x double> %22, %wide.load131
  %29 = fadd <2 x double> %23, %wide.load135
  %30 = fmul <2 x double> %28, <double 3.333300e-01, double 3.333300e-01>
  %31 = fmul <2 x double> %29, <double 3.333300e-01, double 3.333300e-01>
  %32 = getelementptr inbounds double, double* %B, i64 %offset.idx126
  %33 = bitcast double* %32 to <2 x double>*
  store <2 x double> %30, <2 x double>* %33, align 8, !alias.scope !8, !noalias !5
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> %31, <2 x double>* %35, align 8, !alias.scope !8, !noalias !5
  %index.next123 = add i64 %index122, 4
  %36 = icmp eq i64 %index.next123, 1996
  br i1 %36, label %for.body3.us.preheader.loopexit, label %vector.body104, !llvm.loop !10

vector.memcheck.unr-lcssa:                        ; preds = %for.body3.us
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body3.us.prol.loopexit.unr-lcssa.vector.memcheck_crit_edge, %vector.memcheck.unr-lcssa
  br i1 %found.conflict, label %for.body16.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.body16.us.preheader.loopexit:                 ; preds = %vector.body
  br label %for.body16.us.preheader

for.body16.us.preheader:                          ; preds = %for.body16.us.preheader.loopexit, %vector.memcheck
  %indvars.iv61.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %for.body16.us.preheader.loopexit ]
  br label %for.body16.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %37 = shl i64 %index, 1
  %offset.idx = or i64 %37, 1
  %38 = getelementptr inbounds double, double* %B, i64 %37
  %39 = bitcast double* %38 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %39, align 8, !alias.scope !11
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec97 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %40 = fadd <2 x double> %strided.vec, %strided.vec97
  %41 = add nuw nsw i64 %offset.idx, 1
  %42 = getelementptr inbounds double, double* %B, i64 %41
  %43 = getelementptr double, double* %42, i64 -1
  %44 = bitcast double* %43 to <4 x double>*
  %wide.vec98 = load <4 x double>, <4 x double>* %44, align 8, !alias.scope !11
  %strided.vec100 = shufflevector <4 x double> %wide.vec98, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %45 = fadd <2 x double> %40, %strided.vec100
  %46 = fmul <2 x double> %45, <double 3.333300e-01, double 3.333300e-01>
  %47 = bitcast double* %42 to <4 x double>*
  %wide.vec101 = load <4 x double>, <4 x double>* %47, align 8, !alias.scope !11
  %strided.vec103 = shufflevector <4 x double> %wide.vec101, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %48 = fadd <4 x double> %wide.vec98, %wide.vec101
  %49 = shufflevector <4 x double> %48, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %50 = fadd <2 x double> %49, %strided.vec103
  %51 = fmul <2 x double> %50, <double 3.333300e-01, double 3.333300e-01>
  %52 = getelementptr inbounds double, double* %A, i64 %41
  %53 = getelementptr double, double* %52, i64 -1
  %54 = bitcast double* %53 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %46, <2 x double> %51, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %54, align 8, !alias.scope !14, !noalias !11
  %index.next = add i64 %index, 2
  %55 = icmp eq i64 %index.next, 998
  br i1 %55, label %for.body16.us.preheader.loopexit, label %vector.body, !llvm.loop !16

for.end35:                                        ; preds = %for.inc33.us
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !2, !3}
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !2, !3}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !2, !3}
