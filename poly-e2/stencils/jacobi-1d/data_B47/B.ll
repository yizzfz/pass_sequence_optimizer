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
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  %scevgep = getelementptr double, double* %A, i64 1
  %scevgep76 = getelementptr double, double* %A, i64 1999
  %scevgep79 = getelementptr double, double* %B, i64 2000
  %scevgep92 = getelementptr double, double* %B, i64 1
  %scevgep94 = getelementptr double, double* %B, i64 1999
  %scevgep97 = getelementptr double, double* %A, i64 2000
  %bound099 = icmp ult double* %scevgep92, %scevgep97
  %bound1100 = icmp ugt double* %scevgep94, %A
  %found.conflict101 = and i1 %bound099, %bound1100
  %bound0 = icmp ult double* %scevgep, %scevgep79
  %bound1 = icmp ugt double* %scevgep76, %B
  %found.conflict = and i1 %bound0, %bound1
  br label %for.body.us

for.body.us:                                      ; preds = %for.inc33.us, %entry
  %inc3413.us = phi i32 [ %inc34.us, %for.inc33.us ], [ 0, %entry ]
  br i1 %found.conflict101, label %for.inc.us.preheader, label %vector.body87.preheader

vector.body87.preheader:                          ; preds = %for.body.us
  br label %vector.body87

for.inc.us.preheader.loopexit:                    ; preds = %vector.body87
  br label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.preheader.loopexit, %for.body.us
  %indvars.iv.ph = phi i64 [ 1, %for.body.us ], [ 1997, %for.inc.us.preheader.loopexit ]
  br i1 false, label %for.inc.us.prol.preheader, label %for.inc.us.prol.loopexit.unr-lcssa

for.inc.us.prol.preheader:                        ; preds = %for.inc.us.preheader
  br label %for.inc.us.prol.loopexit.unr-lcssa

for.inc.us.prol.loopexit.unr-lcssa:               ; preds = %for.inc.us.preheader, %for.inc.us.prol.preheader
  br i1 false, label %for.inc.us.prol.loopexit.unr-lcssa.vector.memcheck_crit_edge, label %for.inc.us.preheader.new

for.inc.us.prol.loopexit.unr-lcssa.vector.memcheck_crit_edge: ; preds = %for.inc.us.prol.loopexit.unr-lcssa
  br label %vector.memcheck

for.inc.us.preheader.new:                         ; preds = %for.inc.us.prol.loopexit.unr-lcssa
  br label %for.inc.us

vector.body87:                                    ; preds = %vector.body87.preheader, %vector.body87
  %index105 = phi i64 [ %index.next106, %vector.body87 ], [ 0, %vector.body87.preheader ]
  %offset.idx109 = or i64 %index105, 1
  %0 = getelementptr inbounds double, double* %A, i64 %index105
  %1 = bitcast double* %0 to <2 x double>*
  %wide.load114 = load <2 x double>, <2 x double>* %1, align 8, !alias.scope !1
  %2 = getelementptr double, double* %0, i64 2
  %3 = bitcast double* %2 to <2 x double>*
  %wide.load115 = load <2 x double>, <2 x double>* %3, align 8, !alias.scope !1
  %4 = getelementptr inbounds double, double* %A, i64 %offset.idx109
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load116 = load <2 x double>, <2 x double>* %5, align 8, !alias.scope !1
  %6 = getelementptr double, double* %4, i64 2
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load117 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = fadd <2 x double> %wide.load114, %wide.load116
  %9 = fadd <2 x double> %wide.load115, %wide.load117
  %10 = add nuw nsw i64 %offset.idx109, 1
  %11 = getelementptr inbounds double, double* %A, i64 %10
  %12 = getelementptr double, double* %11, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load119 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %8, %wide.load115
  %15 = fadd <2 x double> %9, %wide.load119
  %16 = fmul <2 x double> %14, <double 3.333300e-01, double 3.333300e-01>
  %17 = fmul <2 x double> %15, <double 3.333300e-01, double 3.333300e-01>
  %18 = getelementptr inbounds double, double* %B, i64 %offset.idx109
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> %16, <2 x double>* %19, align 8, !alias.scope !4, !noalias !1
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> %17, <2 x double>* %21, align 8, !alias.scope !4, !noalias !1
  %index.next106 = add i64 %index105, 4
  %22 = icmp eq i64 %index.next106, 1996
  br i1 %22, label %for.inc.us.preheader.loopexit, label %vector.body87, !llvm.loop !6

for.inc33.us.unr-lcssa:                           ; preds = %for.inc30.us
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.inc30.us.prol.loopexit.unr-lcssa.for.inc33.us_crit_edge, %for.inc33.us.unr-lcssa
  %inc34.us = add nuw nsw i32 %inc3413.us, 1
  %exitcond = icmp eq i32 %inc34.us, 500
  br i1 %exitcond, label %for.end35, label %for.body.us

for.inc30.us:                                     ; preds = %for.inc30.us, %for.inc30.us.preheader.new
  %indvars.iv63 = phi i64 [ %indvars.iv63.ph, %for.inc30.us.preheader.new ], [ %indvars.iv.next64.1, %for.inc30.us ]
  %23 = add nsw i64 %indvars.iv63, -1
  %arrayidx19.us = getelementptr inbounds double, double* %B, i64 %23
  %24 = load double, double* %arrayidx19.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %B, i64 %indvars.iv63
  %25 = load double, double* %arrayidx21.us, align 8
  %add22.us = fadd double %24, %25
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %arrayidx25.us = getelementptr inbounds double, double* %B, i64 %indvars.iv.next64
  %26 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add22.us, %26
  %mul27.us = fmul double %add26.us, 3.333300e-01
  %arrayidx29.us = getelementptr inbounds double, double* %A, i64 %indvars.iv63
  store double %mul27.us, double* %arrayidx29.us, align 8
  %27 = load double, double* %arrayidx21.us, align 8
  %28 = load double, double* %arrayidx25.us, align 8
  %add22.us.1 = fadd double %27, %28
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %arrayidx25.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next64.1
  %29 = load double, double* %arrayidx25.us.1, align 8
  %add26.us.1 = fadd double %add22.us.1, %29
  %mul27.us.1 = fmul double %add26.us.1, 3.333300e-01
  %arrayidx29.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next64
  store double %mul27.us.1, double* %arrayidx29.us.1, align 8
  %exitcond74.1 = icmp eq i64 %indvars.iv.next64.1, 1999
  br i1 %exitcond74.1, label %for.inc33.us.unr-lcssa, label %for.inc30.us, !llvm.loop !9

for.inc.us:                                       ; preds = %for.inc.us, %for.inc.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %for.inc.us.preheader.new ], [ %indvars.iv.next.1, %for.inc.us ]
  %30 = add nsw i64 %indvars.iv, -1
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %30
  %31 = load double, double* %arrayidx.us, align 8
  %arrayidx6.us = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %32 = load double, double* %arrayidx6.us, align 8
  %add.us = fadd double %31, %32
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.us = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %33 = load double, double* %arrayidx9.us, align 8
  %add10.us = fadd double %add.us, %33
  %mul.us = fmul double %add10.us, 3.333300e-01
  %arrayidx12.us = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul.us, double* %arrayidx12.us, align 8
  %34 = load double, double* %arrayidx6.us, align 8
  %35 = load double, double* %arrayidx9.us, align 8
  %add.us.1 = fadd double %34, %35
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx9.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %36 = load double, double* %arrayidx9.us.1, align 8
  %add10.us.1 = fadd double %add.us.1, %36
  %mul.us.1 = fmul double %add10.us.1, 3.333300e-01
  %arrayidx12.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.us.1, double* %arrayidx12.us.1, align 8
  %exitcond73.1 = icmp eq i64 %indvars.iv.next.1, 1999
  br i1 %exitcond73.1, label %vector.memcheck.unr-lcssa, label %for.inc.us, !llvm.loop !10

vector.memcheck.unr-lcssa:                        ; preds = %for.inc.us
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.inc.us.prol.loopexit.unr-lcssa.vector.memcheck_crit_edge, %vector.memcheck.unr-lcssa
  br i1 %found.conflict, label %for.inc30.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.inc30.us.preheader.loopexit:                  ; preds = %vector.body
  br label %for.inc30.us.preheader

for.inc30.us.preheader:                           ; preds = %for.inc30.us.preheader.loopexit, %vector.memcheck
  %indvars.iv63.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %for.inc30.us.preheader.loopexit ]
  br i1 false, label %for.inc30.us.prol.preheader, label %for.inc30.us.prol.loopexit.unr-lcssa

for.inc30.us.prol.preheader:                      ; preds = %for.inc30.us.preheader
  br label %for.inc30.us.prol.loopexit.unr-lcssa

for.inc30.us.prol.loopexit.unr-lcssa:             ; preds = %for.inc30.us.preheader, %for.inc30.us.prol.preheader
  br i1 false, label %for.inc30.us.prol.loopexit.unr-lcssa.for.inc33.us_crit_edge, label %for.inc30.us.preheader.new

for.inc30.us.prol.loopexit.unr-lcssa.for.inc33.us_crit_edge: ; preds = %for.inc30.us.prol.loopexit.unr-lcssa
  br label %for.inc33.us

for.inc30.us.preheader.new:                       ; preds = %for.inc30.us.prol.loopexit.unr-lcssa
  br label %for.inc30.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %37 = getelementptr inbounds double, double* %B, i64 %index
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !11
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !11
  %41 = getelementptr inbounds double, double* %B, i64 %offset.idx
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !11
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !11
  %45 = fadd <2 x double> %wide.load, %wide.load83
  %46 = fadd <2 x double> %wide.load82, %wide.load84
  %47 = add nuw nsw i64 %offset.idx, 1
  %48 = getelementptr inbounds double, double* %B, i64 %47
  %49 = getelementptr double, double* %48, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !11
  %51 = fadd <2 x double> %45, %wide.load82
  %52 = fadd <2 x double> %46, %wide.load86
  %53 = fmul <2 x double> %51, <double 3.333300e-01, double 3.333300e-01>
  %54 = fmul <2 x double> %52, <double 3.333300e-01, double 3.333300e-01>
  %55 = getelementptr inbounds double, double* %A, i64 %offset.idx
  %56 = bitcast double* %55 to <2 x double>*
  store <2 x double> %53, <2 x double>* %56, align 8, !alias.scope !14, !noalias !11
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  store <2 x double> %54, <2 x double>* %58, align 8, !alias.scope !14, !noalias !11
  %index.next = add i64 %index, 4
  %59 = icmp eq i64 %index.next, 1996
  br i1 %59, label %for.inc30.us.preheader.loopexit, label %vector.body, !llvm.loop !16

for.end35:                                        ; preds = %for.inc33.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
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
!10 = distinct !{!10, !7, !8}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !7, !8}
