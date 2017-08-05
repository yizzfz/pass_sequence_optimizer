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
  br i1 true, label %for.inc.lr.ph, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.inc.lr.ph:                                    ; preds = %entry
  br i1 true, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %div.prol = fdiv <2 x double> <double 2.000000e+00, double 3.000000e+00>, <double 2.000000e+03, double 2.000000e+03>
  %div.v.r1.prol = extractelement <2 x double> %div.prol, i32 0
  %div.v.r2.prol = extractelement <2 x double> %div.prol, i32 1
  store double %div.v.r1.prol, double* %A, align 8
  store double %div.v.r2.prol, double* %B, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  br i1 false, label %for.inc.prol.loopexit.for.end.loopexit_crit_edge, label %for.inc.lr.ph.new

for.inc.prol.loopexit.for.end.loopexit_crit_edge: ; preds = %for.inc.prol.loopexit
  br label %for.end.loopexit

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %indvars.iv = phi i64 [ 0, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
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
  br i1 %cmp.1, label %for.inc, label %for.end.loopexit.unr-lcssa

for.end.loopexit.unr-lcssa:                       ; preds = %for.inc
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc.prol.loopexit.for.end.loopexit_crit_edge, %for.end.loopexit.unr-lcssa
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
  br i1 true, label %for.body.us.preheader, label %for.body.lr.ph.for.end35_crit_edge

for.body.lr.ph.for.end35_crit_edge:               ; preds = %for.body.lr.ph
  br label %for.end35

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %arrayidx21.us.prol = getelementptr double, double* %B, i64 1
  %arrayidx25.us.prol = getelementptr inbounds double, double* %B, i64 2
  %arrayidx29.us.prol = getelementptr double, double* %A, i64 1
  %scevgep110 = getelementptr double, double* %A, i64 2
  %scevgep113 = getelementptr double, double* %B, i64 -1
  %scevgep116 = getelementptr double, double* %B, i64 3
  %scevgep157 = getelementptr double, double* %B, i64 1999
  %scevgep159 = getelementptr double, double* %A, i64 2000
  %bound0161 = icmp ult double* %arrayidx21.us.prol, %scevgep159
  %bound1162 = icmp ugt double* %scevgep157, %A
  %found.conflict163 = and i1 %bound0161, %bound1162
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.inc33.us
  %inc3411.us = phi i32 [ %inc34.us, %for.inc33.us ], [ 0, %for.body.us.preheader ]
  br i1 false, label %for.body.us.for.inc.us.preheader_crit_edge, label %min.iters.checked149

for.body.us.for.inc.us.preheader_crit_edge:       ; preds = %for.body.us
  br label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %min.iters.checked149.for.inc.us.preheader_crit_edge, %for.body.us.for.inc.us.preheader_crit_edge, %middle.block145, %vector.memcheck165
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck165 ], [ undef, %min.iters.checked149.for.inc.us.preheader_crit_edge ], [ undef, %for.body.us.for.inc.us.preheader_crit_edge ], [ 1997, %middle.block145 ]
  br label %for.inc.us

min.iters.checked149:                             ; preds = %for.body.us
  br i1 false, label %min.iters.checked149.for.inc.us.preheader_crit_edge, label %vector.memcheck165

min.iters.checked149.for.inc.us.preheader_crit_edge: ; preds = %min.iters.checked149
  br label %for.inc.us.preheader

vector.memcheck165:                               ; preds = %min.iters.checked149
  br i1 %found.conflict163, label %for.inc.us.preheader, label %vector.body144.preheader

vector.body144.preheader:                         ; preds = %vector.memcheck165
  br label %vector.body144

vector.body144:                                   ; preds = %vector.body144.preheader, %vector.body144
  %index167 = phi i64 [ %index.next168, %vector.body144 ], [ 0, %vector.body144.preheader ]
  %offset.idx172 = or i64 %index167, 1
  %0 = getelementptr inbounds double, double* %A, i64 %index167
  %1 = bitcast double* %0 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %1, align 8, !alias.scope !1
  %2 = getelementptr double, double* %0, i64 2
  %3 = bitcast double* %2 to <2 x double>*
  %wide.load177 = load <2 x double>, <2 x double>* %3, align 8, !alias.scope !1
  %4 = getelementptr inbounds double, double* %A, i64 %offset.idx172
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load178 = load <2 x double>, <2 x double>* %5, align 8, !alias.scope !1
  %6 = getelementptr double, double* %4, i64 2
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load179 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = fadd <2 x double> %wide.load, %wide.load178
  %9 = fadd <2 x double> %wide.load177, %wide.load179
  %10 = add nuw nsw i64 %offset.idx172, 1
  %11 = getelementptr inbounds double, double* %A, i64 %10
  %12 = getelementptr double, double* %11, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load181 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %8, %wide.load177
  %15 = fadd <2 x double> %9, %wide.load181
  %16 = fmul <2 x double> %14, <double 3.333300e-01, double 3.333300e-01>
  %17 = fmul <2 x double> %15, <double 3.333300e-01, double 3.333300e-01>
  %18 = getelementptr inbounds double, double* %B, i64 %offset.idx172
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> %16, <2 x double>* %19, align 8, !alias.scope !4, !noalias !1
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> %17, <2 x double>* %21, align 8, !alias.scope !4, !noalias !1
  %index.next168 = add i64 %index167, 4
  %22 = icmp eq i64 %index.next168, 1996
  br i1 %22, label %middle.block145, label %vector.body144, !llvm.loop !6

middle.block145:                                  ; preds = %vector.body144
  br i1 false, label %middle.block145.for.inc30.us.preheader_crit_edge, label %for.inc.us.preheader

middle.block145.for.inc30.us.preheader_crit_edge: ; preds = %middle.block145
  br label %for.inc30.us.preheader

for.inc33.us.loopexit:                            ; preds = %for.inc30.us
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %middle.block100.for.inc33.us_crit_edge, %for.inc30.us.prol.loopexit.for.inc33.us_crit_edge, %for.inc33.us.loopexit
  %inc34.us = add nsw i32 %inc3411.us, 1
  %cmp.us = icmp slt i32 %inc34.us, 500
  br i1 %cmp.us, label %for.body.us, label %for.end35.loopexit

for.inc30.us:                                     ; preds = %for.inc30.us.preheader183, %for.inc30.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.1, %for.inc30.us ], [ %indvars.iv63.ph, %for.inc30.us.preheader183 ]
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
  %exitcond.1 = icmp eq i64 %indvars.iv.next64.1, 1999
  br i1 %exitcond.1, label %for.inc33.us.loopexit, label %for.inc30.us, !llvm.loop !9

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader ]
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
  %cmp2.us = icmp slt i64 %indvars.iv.next, 1999
  br i1 %cmp2.us, label %for.inc.us, label %for.inc30.us.preheader.loopexit, !llvm.loop !10

for.inc30.us.preheader.loopexit:                  ; preds = %for.inc.us
  br label %for.inc30.us.preheader

for.inc30.us.preheader:                           ; preds = %middle.block145.for.inc30.us.preheader_crit_edge, %for.inc30.us.preheader.loopexit
  br i1 true, label %for.inc30.us.prol.loopexit, label %for.inc30.us.prol

for.inc30.us.prol:                                ; preds = %for.inc30.us.preheader
  %34 = load double, double* %B, align 8
  %35 = load double, double* %arrayidx21.us.prol, align 8
  %add22.us.prol = fadd double %34, %35
  %36 = load double, double* %arrayidx25.us.prol, align 8
  %add26.us.prol = fadd double %add22.us.prol, %36
  %mul27.us.prol = fmul double %add26.us.prol, 3.333300e-01
  store double %mul27.us.prol, double* %arrayidx29.us.prol, align 8
  br label %for.inc30.us.prol.loopexit

for.inc30.us.prol.loopexit:                       ; preds = %for.inc30.us.prol, %for.inc30.us.preheader
  br i1 false, label %for.inc30.us.prol.loopexit.for.inc33.us_crit_edge, label %for.inc30.us.preheader78

for.inc30.us.prol.loopexit.for.inc33.us_crit_edge: ; preds = %for.inc30.us.prol.loopexit
  br label %for.inc33.us

for.inc30.us.preheader78:                         ; preds = %for.inc30.us.prol.loopexit
  br i1 false, label %for.inc30.us.preheader78.for.inc30.us.preheader183_crit_edge, label %min.iters.checked103

for.inc30.us.preheader78.for.inc30.us.preheader183_crit_edge: ; preds = %for.inc30.us.preheader78
  br label %for.inc30.us.preheader183

for.inc30.us.preheader183:                        ; preds = %min.iters.checked103.for.inc30.us.preheader183_crit_edge, %for.inc30.us.preheader78.for.inc30.us.preheader183_crit_edge, %middle.block100, %vector.memcheck123
  %indvars.iv63.ph = phi i64 [ 1, %vector.memcheck123 ], [ undef, %min.iters.checked103.for.inc30.us.preheader183_crit_edge ], [ undef, %for.inc30.us.preheader78.for.inc30.us.preheader183_crit_edge ], [ 1997, %middle.block100 ]
  br label %for.inc30.us

min.iters.checked103:                             ; preds = %for.inc30.us.preheader78
  br i1 false, label %min.iters.checked103.for.inc30.us.preheader183_crit_edge, label %vector.memcheck123

min.iters.checked103.for.inc30.us.preheader183_crit_edge: ; preds = %min.iters.checked103
  br label %for.inc30.us.preheader183

vector.memcheck123:                               ; preds = %min.iters.checked103
  %scevgep111 = getelementptr double, double* %scevgep110, i64 1997
  %scevgep114 = getelementptr double, double* %scevgep113, i64 1
  %scevgep117 = getelementptr double, double* %scevgep116, i64 1997
  %bound0119 = icmp ult double* %arrayidx29.us.prol, %scevgep117
  %bound1120 = icmp ult double* %scevgep114, %scevgep111
  %found.conflict121 = and i1 %bound0119, %bound1120
  br i1 %found.conflict121, label %for.inc30.us.preheader183, label %vector.body99.preheader

vector.body99.preheader:                          ; preds = %vector.memcheck123
  br label %vector.body99

vector.body99:                                    ; preds = %vector.body99.preheader, %vector.body99
  %index125 = phi i64 [ %index.next126, %vector.body99 ], [ 0, %vector.body99.preheader ]
  %37 = shl i64 %index125, 1
  %offset.idx130 = or i64 1, %37
  %38 = add nsw i64 %offset.idx130, -1
  %39 = getelementptr inbounds double, double* %B, i64 %38
  %40 = bitcast double* %39 to <4 x double>*
  %wide.vec134 = load <4 x double>, <4 x double>* %40, align 8, !alias.scope !11
  %strided.vec135 = shufflevector <4 x double> %wide.vec134, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec136 = shufflevector <4 x double> %wide.vec134, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %41 = fadd <2 x double> %strided.vec135, %strided.vec136
  %42 = add nuw nsw i64 %offset.idx130, 1
  %43 = getelementptr inbounds double, double* %B, i64 %42
  %44 = getelementptr double, double* %43, i64 -1
  %45 = bitcast double* %44 to <4 x double>*
  %wide.vec137 = load <4 x double>, <4 x double>* %45, align 8, !alias.scope !11
  %strided.vec139 = shufflevector <4 x double> %wide.vec137, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %46 = fadd <2 x double> %41, %strided.vec139
  %47 = fmul <2 x double> %46, <double 3.333300e-01, double 3.333300e-01>
  %48 = bitcast double* %43 to <4 x double>*
  %wide.vec140 = load <4 x double>, <4 x double>* %48, align 8, !alias.scope !11
  %strided.vec142 = shufflevector <4 x double> %wide.vec140, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %49 = fadd <4 x double> %wide.vec137, %wide.vec140
  %50 = shufflevector <4 x double> %49, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %51 = fadd <2 x double> %50, %strided.vec142
  %52 = fmul <2 x double> %51, <double 3.333300e-01, double 3.333300e-01>
  %53 = getelementptr inbounds double, double* %A, i64 %42
  %54 = getelementptr double, double* %53, i64 -1
  %55 = bitcast double* %54 to <4 x double>*
  %interleaved.vec143 = shufflevector <2 x double> %47, <2 x double> %52, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec143, <4 x double>* %55, align 8, !alias.scope !14, !noalias !11
  %index.next126 = add i64 %index125, 2
  %56 = icmp eq i64 %index.next126, 998
  br i1 %56, label %middle.block100, label %vector.body99, !llvm.loop !16

middle.block100:                                  ; preds = %vector.body99
  br i1 false, label %middle.block100.for.inc33.us_crit_edge, label %for.inc30.us.preheader183

middle.block100.for.inc33.us_crit_edge:           ; preds = %middle.block100
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
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %for.body.lr.ph, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
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
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, 2000
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %entry.for.end_crit_edge, %for.end.loopexit
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
