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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
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

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  br i1 true, label %for.body.lr.ph, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.lr.ph:                                   ; preds = %entry
  br i1 true, label %for.body.prol.loopexit, label %for.body.prol.preheader

for.body.prol.preheader:                          ; preds = %for.body.lr.ph
  %div.prol = fdiv <2 x double> <double 2.000000e+00, double 3.000000e+00>, <double 2.000000e+03, double 2.000000e+03>
  %div.v.r1.prol = extractelement <2 x double> %div.prol, i32 0
  %div.v.r2.prol = extractelement <2 x double> %div.prol, i32 1
  store double %div.v.r1.prol, double* %A, align 8
  store double %div.v.r2.prol, double* %B, align 8
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.lr.ph, %for.body.prol.preheader
  br i1 false, label %for.body.prol.loopexit.for.end.loopexit_crit_edge, label %for.body.lr.ph.new

for.body.prol.loopexit.for.end.loopexit_crit_edge: ; preds = %for.body.prol.loopexit
  br label %for.end.loopexit

for.body.lr.ph.new:                               ; preds = %for.body.prol.loopexit
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph.new ], [ %indvars.iv.next.1, %for.body ]
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
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
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
  %cmp.1 = icmp slt i64 %indvars.iv.next.1, 2000
  br i1 %cmp.1, label %for.body, label %for.end.loopexit.unr-lcssa

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body.prol.loopexit.for.end.loopexit_crit_edge, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %entry.for.end_crit_edge, %for.end.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  br i1 true, label %for.body.lr.ph, label %entry.for.end35_crit_edge

entry.for.end35_crit_edge:                        ; preds = %entry
  br label %for.end35

for.body.lr.ph:                                   ; preds = %entry
  br i1 true, label %for.body.lr.ph.split.us, label %for.body.lr.ph.for.end35_crit_edge

for.body.lr.ph.for.end35_crit_edge:               ; preds = %for.body.lr.ph
  br label %for.end35

for.body.lr.ph.split.us:                          ; preds = %for.body.lr.ph
  %scevgep112 = getelementptr double, double* %A, i64 1
  %scevgep115 = getelementptr double, double* %A, i64 1999
  %scevgep117 = getelementptr double, double* %B, i64 2000
  %scevgep151 = getelementptr double, double* %B, i64 1
  %scevgep154 = getelementptr double, double* %B, i64 1999
  %scevgep157 = getelementptr double, double* %A, i64 2000
  %bound0119 = icmp ult double* %scevgep112, %scevgep117
  %bound1120 = icmp ugt double* %scevgep115, %B
  %found.conflict121 = and i1 %bound0119, %bound1120
  %bound0159 = icmp ult double* %scevgep151, %scevgep157
  %bound1160 = icmp ugt double* %scevgep154, %A
  %found.conflict161 = and i1 %bound0159, %bound1160
  br label %for.body.us

for.body.us:                                      ; preds = %for.inc33.us, %for.body.lr.ph.split.us
  %inc3413.us = phi i32 [ 0, %for.body.lr.ph.split.us ], [ %inc34.us, %for.inc33.us ]
  br i1 false, label %for.body.us.for.body3.us.preheader_crit_edge, label %min.iters.checked146

for.body.us.for.body3.us.preheader_crit_edge:     ; preds = %for.body.us
  br label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %min.iters.checked146.for.body3.us.preheader_crit_edge, %for.body.us.for.body3.us.preheader_crit_edge, %middle.block142, %vector.memcheck163
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck163 ], [ undef, %min.iters.checked146.for.body3.us.preheader_crit_edge ], [ undef, %for.body.us.for.body3.us.preheader_crit_edge ], [ 1997, %middle.block142 ]
  br label %for.body3.us

min.iters.checked146:                             ; preds = %for.body.us
  br i1 false, label %min.iters.checked146.for.body3.us.preheader_crit_edge, label %vector.memcheck163

min.iters.checked146.for.body3.us.preheader_crit_edge: ; preds = %min.iters.checked146
  br label %for.body3.us.preheader

vector.memcheck163:                               ; preds = %min.iters.checked146
  br i1 %found.conflict161, label %for.body3.us.preheader, label %vector.body141.preheader

vector.body141.preheader:                         ; preds = %vector.memcheck163
  br label %vector.body141

vector.body141:                                   ; preds = %vector.body141.preheader, %vector.body141
  %index165 = phi i64 [ %index.next166, %vector.body141 ], [ 0, %vector.body141.preheader ]
  %offset.idx170 = or i64 %index165, 1
  %0 = getelementptr inbounds double, double* %A, i64 %index165
  %1 = bitcast double* %0 to <2 x double>*
  %wide.load175 = load <2 x double>, <2 x double>* %1, align 8, !alias.scope !1
  %2 = getelementptr double, double* %0, i64 2
  %3 = bitcast double* %2 to <2 x double>*
  %wide.load176 = load <2 x double>, <2 x double>* %3, align 8, !alias.scope !1
  %4 = getelementptr inbounds double, double* %A, i64 %offset.idx170
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load177 = load <2 x double>, <2 x double>* %5, align 8, !alias.scope !1
  %6 = getelementptr double, double* %4, i64 2
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load178 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = fadd <2 x double> %wide.load175, %wide.load177
  %9 = fadd <2 x double> %wide.load176, %wide.load178
  %10 = add nuw nsw i64 %offset.idx170, 1
  %11 = getelementptr inbounds double, double* %A, i64 %10
  %12 = getelementptr double, double* %11, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load180 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %8, %wide.load176
  %15 = fadd <2 x double> %9, %wide.load180
  %16 = fmul <2 x double> %14, <double 3.333300e-01, double 3.333300e-01>
  %17 = fmul <2 x double> %15, <double 3.333300e-01, double 3.333300e-01>
  %18 = getelementptr inbounds double, double* %B, i64 %offset.idx170
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> %16, <2 x double>* %19, align 8, !alias.scope !4, !noalias !1
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> %17, <2 x double>* %21, align 8, !alias.scope !4, !noalias !1
  %index.next166 = add i64 %index165, 4
  %22 = icmp eq i64 %index.next166, 1996
  br i1 %22, label %middle.block142, label %vector.body141, !llvm.loop !6

middle.block142:                                  ; preds = %vector.body141
  br i1 false, label %middle.block142.for.body16.us.preheader_crit_edge, label %for.body3.us.preheader

middle.block142.for.body16.us.preheader_crit_edge: ; preds = %middle.block142
  br label %for.body16.us.preheader

for.inc33.us.loopexit:                            ; preds = %for.body16.us
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %middle.block103.for.inc33.us_crit_edge, %for.inc33.us.loopexit
  %inc34.us = add nsw i32 %inc3413.us, 1
  %cmp.us = icmp slt i32 %inc34.us, 500
  br i1 %cmp.us, label %for.body.us, label %for.end35.loopexit

for.body16.us:                                    ; preds = %for.body16.us.preheader181, %for.body16.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.body16.us ], [ %indvars.iv65.ph, %for.body16.us.preheader181 ]
  %23 = add nsw i64 %indvars.iv65, -1
  %arrayidx19.us = getelementptr inbounds double, double* %B, i64 %23
  %24 = load double, double* %arrayidx19.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %B, i64 %indvars.iv65
  %25 = load double, double* %arrayidx21.us, align 8
  %add22.us = fadd double %24, %25
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %arrayidx25.us = getelementptr inbounds double, double* %B, i64 %indvars.iv.next66
  %26 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add22.us, %26
  %mul27.us = fmul double %add26.us, 3.333300e-01
  %arrayidx29.us = getelementptr inbounds double, double* %A, i64 %indvars.iv65
  store double %mul27.us, double* %arrayidx29.us, align 8
  %cmp15.us = icmp slt i64 %indvars.iv.next66, 1999
  br i1 %cmp15.us, label %for.body16.us, label %for.inc33.us.loopexit, !llvm.loop !9

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %27 = add nsw i64 %indvars.iv, -1
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %27
  %28 = load double, double* %arrayidx.us, align 8
  %arrayidx6.us = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %29 = load double, double* %arrayidx6.us, align 8
  %add.us = fadd double %28, %29
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.us = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %30 = load double, double* %arrayidx9.us, align 8
  %add10.us = fadd double %add.us, %30
  %mul.us = fmul double %add10.us, 3.333300e-01
  %arrayidx12.us = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul.us, double* %arrayidx12.us, align 8
  %cmp2.us = icmp slt i64 %indvars.iv.next, 1999
  br i1 %cmp2.us, label %for.body3.us, label %for.body16.us.preheader.loopexit, !llvm.loop !10

for.body16.us.preheader.loopexit:                 ; preds = %for.body3.us
  br label %for.body16.us.preheader

for.body16.us.preheader:                          ; preds = %middle.block142.for.body16.us.preheader_crit_edge, %for.body16.us.preheader.loopexit
  br i1 false, label %for.body16.us.preheader.for.body16.us.preheader181_crit_edge, label %min.iters.checked107

for.body16.us.preheader.for.body16.us.preheader181_crit_edge: ; preds = %for.body16.us.preheader
  br label %for.body16.us.preheader181

for.body16.us.preheader181:                       ; preds = %min.iters.checked107.for.body16.us.preheader181_crit_edge, %for.body16.us.preheader.for.body16.us.preheader181_crit_edge, %middle.block103, %vector.memcheck123
  %indvars.iv65.ph = phi i64 [ 1, %vector.memcheck123 ], [ undef, %min.iters.checked107.for.body16.us.preheader181_crit_edge ], [ undef, %for.body16.us.preheader.for.body16.us.preheader181_crit_edge ], [ 1997, %middle.block103 ]
  br label %for.body16.us

min.iters.checked107:                             ; preds = %for.body16.us.preheader
  br i1 false, label %min.iters.checked107.for.body16.us.preheader181_crit_edge, label %vector.memcheck123

min.iters.checked107.for.body16.us.preheader181_crit_edge: ; preds = %min.iters.checked107
  br label %for.body16.us.preheader181

vector.memcheck123:                               ; preds = %min.iters.checked107
  br i1 %found.conflict121, label %for.body16.us.preheader181, label %vector.body102.preheader

vector.body102.preheader:                         ; preds = %vector.memcheck123
  br label %vector.body102

vector.body102:                                   ; preds = %vector.body102.preheader, %vector.body102
  %index125 = phi i64 [ %index.next126, %vector.body102 ], [ 0, %vector.body102.preheader ]
  %offset.idx130 = or i64 %index125, 1
  %31 = getelementptr inbounds double, double* %B, i64 %index125
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !11
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !11
  %35 = getelementptr inbounds double, double* %B, i64 %offset.idx130
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load137 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !11
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load138 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !11
  %39 = fadd <2 x double> %wide.load135, %wide.load137
  %40 = fadd <2 x double> %wide.load136, %wide.load138
  %41 = add nuw nsw i64 %offset.idx130, 1
  %42 = getelementptr inbounds double, double* %B, i64 %41
  %43 = getelementptr double, double* %42, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load140 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !11
  %45 = fadd <2 x double> %39, %wide.load136
  %46 = fadd <2 x double> %40, %wide.load140
  %47 = fmul <2 x double> %45, <double 3.333300e-01, double 3.333300e-01>
  %48 = fmul <2 x double> %46, <double 3.333300e-01, double 3.333300e-01>
  %49 = getelementptr inbounds double, double* %A, i64 %offset.idx130
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> %47, <2 x double>* %50, align 8, !alias.scope !14, !noalias !11
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  store <2 x double> %48, <2 x double>* %52, align 8, !alias.scope !14, !noalias !11
  %index.next126 = add i64 %index125, 4
  %53 = icmp eq i64 %index.next126, 1996
  br i1 %53, label %middle.block103, label %vector.body102, !llvm.loop !16

middle.block103:                                  ; preds = %vector.body102
  br i1 false, label %middle.block103.for.inc33.us_crit_edge, label %for.body16.us.preheader181

middle.block103.for.inc33.us_crit_edge:           ; preds = %middle.block103
  br label %for.inc33.us

for.end35.loopexit:                               ; preds = %for.inc33.us
  br label %for.end35

for.end35:                                        ; preds = %for.body.lr.ph.for.end35_crit_edge, %entry.for.end35_crit_edge, %for.end35.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %for.body.lr.ph, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %if.end
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, 2000
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %entry.for.end_crit_edge, %for.end.loopexit
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
