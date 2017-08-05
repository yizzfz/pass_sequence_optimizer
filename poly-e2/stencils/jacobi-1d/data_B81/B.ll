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
for.body.lr.ph:
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv3 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next.1, %for.body ]
  %0 = trunc i64 %indvars.iv3 to i32
  %conv = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv3
  %1 = insertelement <2 x double> undef, double %conv, i32 0
  %add.v.i0.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %add = fadd <2 x double> %add.v.i0.2, <double 2.000000e+00, double 3.000000e+00>
  %div = fdiv <2 x double> %add, <double 2.000000e+03, double 2.000000e+03>
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv3
  store double %div.v.r2, double* %arrayidx7, align 8
  %indvars.iv.next = or i64 %indvars.iv3, 1
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
  %indvars.iv.next.1 = add nsw i64 %indvars.iv3, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
for.cond1.preheader.lr.ph:
  %scevgep = getelementptr double, double* %A, i64 1
  %scevgep21 = getelementptr double, double* %A, i64 1999
  %scevgep24 = getelementptr double, double* %B, i64 2000
  %scevgep37 = getelementptr double, double* %B, i64 1
  %scevgep39 = getelementptr double, double* %B, i64 1999
  %scevgep42 = getelementptr double, double* %A, i64 2000
  %bound044 = icmp ult double* %scevgep37, %scevgep42
  %bound145 = icmp ugt double* %scevgep39, %A
  %memcheck.conflict47 = and i1 %bound044, %bound145
  %bound0 = icmp ult double* %scevgep, %scevgep24
  %bound1 = icmp ugt double* %scevgep21, %B
  %memcheck.conflict = and i1 %bound0, %bound1
  br label %vector.memcheck48

vector.memcheck48:                                ; preds = %for.cond1.preheader.lr.ph, %for.inc33
  %inc34617 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc34, %for.inc33 ]
  br i1 %memcheck.conflict47, label %for.body3.preheader, label %vector.body32.preheader

vector.body32.preheader:                          ; preds = %vector.memcheck48
  br label %vector.body32

for.body3.preheader.loopexit:                     ; preds = %vector.body32
  br label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.preheader.loopexit, %vector.memcheck48
  %indvars.iv12.ph = phi i64 [ 1, %vector.memcheck48 ], [ 1997, %for.body3.preheader.loopexit ]
  br i1 false, label %for.body3.prol.preheader, label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.preheader:                         ; preds = %for.body3.preheader
  br label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.loopexit.unr-lcssa:                ; preds = %for.body3.preheader, %for.body3.prol.preheader
  br i1 false, label %for.body3.prol.loopexit.unr-lcssa.vector.memcheck_crit_edge, label %for.body3.preheader.new

for.body3.prol.loopexit.unr-lcssa.vector.memcheck_crit_edge: ; preds = %for.body3.prol.loopexit.unr-lcssa
  br label %vector.memcheck

for.body3.preheader.new:                          ; preds = %for.body3.prol.loopexit.unr-lcssa
  br label %for.body3

vector.body32:                                    ; preds = %vector.body32.preheader, %vector.body32
  %index50 = phi i64 [ %index.next51, %vector.body32 ], [ 0, %vector.body32.preheader ]
  %offset.idx54 = or i64 %index50, 1
  %0 = add nsw i64 %offset.idx54, -1
  %1 = getelementptr inbounds double, double* %A, i64 %0
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !1
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !1
  %5 = getelementptr inbounds double, double* %A, i64 %offset.idx54
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load61 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = getelementptr double, double* %5, i64 2
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load62 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = fadd <2 x double> %wide.load59, %wide.load61
  %10 = fadd <2 x double> %wide.load60, %wide.load62
  %11 = add nuw nsw i64 %offset.idx54, 1
  %12 = getelementptr inbounds double, double* %A, i64 %11
  %13 = getelementptr double, double* %12, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load64 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = fadd <2 x double> %9, %wide.load60
  %16 = fadd <2 x double> %10, %wide.load64
  %17 = fmul <2 x double> %15, <double 3.333300e-01, double 3.333300e-01>
  %18 = fmul <2 x double> %16, <double 3.333300e-01, double 3.333300e-01>
  %19 = getelementptr inbounds double, double* %B, i64 %offset.idx54
  %20 = bitcast double* %19 to <2 x double>*
  store <2 x double> %17, <2 x double>* %20, align 8, !alias.scope !4, !noalias !1
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  store <2 x double> %18, <2 x double>* %22, align 8, !alias.scope !4, !noalias !1
  %index.next51 = add i64 %index50, 4
  %23 = icmp eq i64 %index.next51, 1996
  br i1 %23, label %for.body3.preheader.loopexit, label %vector.body32, !llvm.loop !6

vector.memcheck.unr-lcssa:                        ; preds = %for.body3
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body3.prol.loopexit.unr-lcssa.vector.memcheck_crit_edge, %vector.memcheck.unr-lcssa
  br i1 %memcheck.conflict, label %for.body16.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.body16.preheader.loopexit:                    ; preds = %vector.body
  br label %for.body16.preheader

for.body16.preheader:                             ; preds = %for.body16.preheader.loopexit, %vector.memcheck
  %indvars.iv814.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %for.body16.preheader.loopexit ]
  br i1 false, label %for.body16.prol.preheader, label %for.body16.prol.loopexit.unr-lcssa

for.body16.prol.preheader:                        ; preds = %for.body16.preheader
  br label %for.body16.prol.loopexit.unr-lcssa

for.body16.prol.loopexit.unr-lcssa:               ; preds = %for.body16.preheader, %for.body16.prol.preheader
  br i1 false, label %for.body16.prol.loopexit.unr-lcssa.for.inc33_crit_edge, label %for.body16.preheader.new

for.body16.prol.loopexit.unr-lcssa.for.inc33_crit_edge: ; preds = %for.body16.prol.loopexit.unr-lcssa
  br label %for.inc33

for.body16.preheader.new:                         ; preds = %for.body16.prol.loopexit.unr-lcssa
  br label %for.body16

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %24 = add nsw i64 %offset.idx, -1
  %25 = getelementptr inbounds double, double* %B, i64 %24
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !9
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load27 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !9
  %29 = getelementptr inbounds double, double* %B, i64 %offset.idx
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load28 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !9
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load29 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !9
  %33 = fadd <2 x double> %wide.load, %wide.load28
  %34 = fadd <2 x double> %wide.load27, %wide.load29
  %35 = add nuw nsw i64 %offset.idx, 1
  %36 = getelementptr inbounds double, double* %B, i64 %35
  %37 = getelementptr double, double* %36, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load31 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !9
  %39 = fadd <2 x double> %33, %wide.load27
  %40 = fadd <2 x double> %34, %wide.load31
  %41 = fmul <2 x double> %39, <double 3.333300e-01, double 3.333300e-01>
  %42 = fmul <2 x double> %40, <double 3.333300e-01, double 3.333300e-01>
  %43 = getelementptr inbounds double, double* %A, i64 %offset.idx
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> %41, <2 x double>* %44, align 8, !alias.scope !12, !noalias !9
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> %42, <2 x double>* %46, align 8, !alias.scope !12, !noalias !9
  %index.next = add i64 %index, 4
  %47 = icmp eq i64 %index.next, 1996
  br i1 %47, label %for.body16.preheader.loopexit, label %vector.body, !llvm.loop !14

for.body3:                                        ; preds = %for.body3, %for.body3.preheader.new
  %indvars.iv12 = phi i64 [ %indvars.iv12.ph, %for.body3.preheader.new ], [ %indvars.iv.next.1, %for.body3 ]
  %48 = add nsw i64 %indvars.iv12, -1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %48
  %49 = load double, double* %arrayidx, align 8
  %arrayidx6 = getelementptr inbounds double, double* %A, i64 %indvars.iv12
  %50 = load double, double* %arrayidx6, align 8
  %add = fadd double %49, %50
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %arrayidx9 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %51 = load double, double* %arrayidx9, align 8
  %add10 = fadd double %add, %51
  %mul = fmul double %add10, 3.333300e-01
  %arrayidx12 = getelementptr inbounds double, double* %B, i64 %indvars.iv12
  store double %mul, double* %arrayidx12, align 8
  %52 = load double, double* %arrayidx6, align 8
  %53 = load double, double* %arrayidx9, align 8
  %add.1 = fadd double %52, %53
  %indvars.iv.next.1 = add nsw i64 %indvars.iv12, 2
  %arrayidx9.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %54 = load double, double* %arrayidx9.1, align 8
  %add10.1 = fadd double %add.1, %54
  %mul.1 = fmul double %add10.1, 3.333300e-01
  %arrayidx12.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.1, double* %arrayidx12.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1999
  br i1 %exitcond.1, label %vector.memcheck.unr-lcssa, label %for.body3, !llvm.loop !15

for.body16:                                       ; preds = %for.body16, %for.body16.preheader.new
  %indvars.iv814 = phi i64 [ %indvars.iv814.ph, %for.body16.preheader.new ], [ %indvars.iv.next9.1, %for.body16 ]
  %55 = add nsw i64 %indvars.iv814, -1
  %arrayidx19 = getelementptr inbounds double, double* %B, i64 %55
  %56 = load double, double* %arrayidx19, align 8
  %arrayidx21 = getelementptr inbounds double, double* %B, i64 %indvars.iv814
  %57 = load double, double* %arrayidx21, align 8
  %add22 = fadd double %56, %57
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv814, 1
  %arrayidx25 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next9
  %58 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add22, %58
  %mul27 = fmul double %add26, 3.333300e-01
  %arrayidx29 = getelementptr inbounds double, double* %A, i64 %indvars.iv814
  store double %mul27, double* %arrayidx29, align 8
  %59 = load double, double* %arrayidx21, align 8
  %60 = load double, double* %arrayidx25, align 8
  %add22.1 = fadd double %59, %60
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv814, 2
  %arrayidx25.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next9.1
  %61 = load double, double* %arrayidx25.1, align 8
  %add26.1 = fadd double %add22.1, %61
  %mul27.1 = fmul double %add26.1, 3.333300e-01
  %arrayidx29.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next9
  store double %mul27.1, double* %arrayidx29.1, align 8
  %exitcond18.1 = icmp eq i64 %indvars.iv.next9.1, 1999
  br i1 %exitcond18.1, label %for.inc33.unr-lcssa, label %for.body16, !llvm.loop !16

for.inc33.unr-lcssa:                              ; preds = %for.body16
  br label %for.inc33

for.inc33:                                        ; preds = %for.body16.prol.loopexit.unr-lcssa.for.inc33_crit_edge, %for.inc33.unr-lcssa
  %inc34 = add nuw nsw i32 %inc34617, 1
  %exitcond19 = icmp eq i32 %inc34, 500
  br i1 %exitcond19, label %for.end35, label %vector.memcheck48

for.end35:                                        ; preds = %for.inc33
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %A) unnamed_addr #0 {
for.body.lr.ph:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %if.end, %for.body.lr.ph
  %indvars.iv4 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv4 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv4
  %6 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
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
