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
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.inc.lr.ph, label %for.end

for.inc.lr.ph:                                    ; preds = %entry
  %conv1 = sitofp i32 %n to double
  %0 = sext i32 %n to i64
  %1 = insertelement <2 x double> undef, double %conv1, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %xtraiter = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %div.prol = fdiv <2 x double> <double 2.000000e+00, double 3.000000e+00>, %div.v.i1.2
  %div.v.r1.prol = extractelement <2 x double> %div.prol, i32 0
  %div.v.r2.prol = extractelement <2 x double> %div.prol, i32 1
  store double %div.v.r1.prol, double* %A, align 8
  store double %div.v.r2.prol, double* %B, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph ], [ 1, %for.inc.prol.preheader ]
  %2 = icmp eq i32 %n, 1
  br i1 %2, label %for.end.loopexit, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %3 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %3 to double
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %4 = insertelement <2 x double> undef, double %conv, i32 0
  %add.v.i0.2 = shufflevector <2 x double> %4, <2 x double> undef, <2 x i32> zeroinitializer
  %add = fadd <2 x double> %add.v.i0.2, <double 2.000000e+00, double 3.000000e+00>
  %div = fdiv <2 x double> %add, %div.v.i1.2
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %div.v.r2, double* %arrayidx7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = trunc i64 %indvars.iv.next to i32
  %conv.1 = sitofp i32 %5 to double
  %arrayidx.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %6 = insertelement <2 x double> undef, double %conv.1, i32 0
  %add.v.i0.2.1 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %add.1 = fadd <2 x double> %add.v.i0.2.1, <double 2.000000e+00, double 3.000000e+00>
  %div.1 = fdiv <2 x double> %add.1, %div.v.i1.2
  %div.v.r1.1 = extractelement <2 x double> %div.1, i32 0
  %div.v.r2.1 = extractelement <2 x double> %div.1, i32 1
  store double %div.v.r1.1, double* %arrayidx.1, align 8
  %arrayidx7.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %div.v.r2.1, double* %arrayidx7.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %cmp.1 = icmp slt i64 %indvars.iv.next.1, %0
  br i1 %cmp.1, label %for.inc, label %for.end.loopexit.unr-lcssa

for.end.loopexit.unr-lcssa:                       ; preds = %for.inc
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc.prol.loopexit, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  %cmp10 = icmp sgt i32 %tsteps, 0
  br i1 %cmp10, label %for.cond1.preheader.lr.ph, label %for.end35

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub3 = add nsw i32 %n, -1
  %cmp24 = icmp sgt i32 %sub3, 1
  %0 = sext i32 %n to i64
  %sub14 = add nsw i64 %0, -1
  br i1 %cmp24, label %for.cond1.preheader.us.preheader, label %for.end35

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %1 = icmp sgt i64 %sub14, 2
  %smax95 = select i1 %1, i64 %sub14, i64 2
  %2 = add nsw i64 %smax95, -1
  %scevgep102 = getelementptr double, double* %A, i64 1
  %scevgep105 = getelementptr double, double* %A, i64 %smax95
  %3 = add nuw nsw i64 %smax95, 1
  %scevgep107 = getelementptr double, double* %B, i64 %3
  %scevgep141 = getelementptr double, double* %B, i64 1
  %scevgep144 = getelementptr double, double* %B, i64 %smax95
  %scevgep146 = getelementptr double, double* %A, i64 %3
  %min.iters.check135 = icmp ult i64 %2, 4
  %n.vec99 = and i64 %2, -4
  %cmp.zero100 = icmp eq i64 %n.vec99, 0
  %bound0109 = icmp ult double* %scevgep102, %scevgep107
  %bound1110 = icmp ugt double* %scevgep105, %B
  %found.conflict111 = and i1 %bound0109, %bound1110
  %ind.end118 = or i64 %n.vec99, 1
  %cmp.n119 = icmp eq i64 %2, %n.vec99
  %bound0148 = icmp ult double* %scevgep141, %scevgep146
  %bound1149 = icmp ugt double* %scevgep144, %A
  %found.conflict150 = and i1 %bound0148, %bound1149
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.inc33.us
  %inc3413.us = phi i32 [ %inc34.us, %for.inc33.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br i1 %min.iters.check135, label %for.inc.us.preheader, label %min.iters.checked136

for.inc.us.preheader:                             ; preds = %middle.block132, %vector.memcheck152, %min.iters.checked136, %for.cond1.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck152 ], [ 1, %min.iters.checked136 ], [ 1, %for.cond1.preheader.us ], [ %ind.end118, %middle.block132 ]
  br label %for.inc.us

min.iters.checked136:                             ; preds = %for.cond1.preheader.us
  br i1 %cmp.zero100, label %for.inc.us.preheader, label %vector.memcheck152

vector.memcheck152:                               ; preds = %min.iters.checked136
  br i1 %found.conflict150, label %for.inc.us.preheader, label %vector.body131.preheader

vector.body131.preheader:                         ; preds = %vector.memcheck152
  br label %vector.body131

vector.body131:                                   ; preds = %vector.body131.preheader, %vector.body131
  %index154 = phi i64 [ %index.next155, %vector.body131 ], [ 0, %vector.body131.preheader ]
  %offset.idx159 = or i64 %index154, 1
  %4 = getelementptr inbounds double, double* %A, i64 %index154
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load164 = load <2 x double>, <2 x double>* %5, align 8, !alias.scope !1
  %6 = getelementptr double, double* %4, i64 2
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load165 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = getelementptr inbounds double, double* %A, i64 %offset.idx159
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load166 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load167 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = fadd <2 x double> %wide.load164, %wide.load166
  %13 = fadd <2 x double> %wide.load165, %wide.load167
  %14 = add nuw nsw i64 %offset.idx159, 1
  %15 = getelementptr inbounds double, double* %A, i64 %14
  %16 = getelementptr double, double* %15, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load169 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fadd <2 x double> %12, %wide.load165
  %19 = fadd <2 x double> %13, %wide.load169
  %20 = fmul <2 x double> %18, <double 3.333300e-01, double 3.333300e-01>
  %21 = fmul <2 x double> %19, <double 3.333300e-01, double 3.333300e-01>
  %22 = getelementptr inbounds double, double* %B, i64 %offset.idx159
  %23 = bitcast double* %22 to <2 x double>*
  store <2 x double> %20, <2 x double>* %23, align 8, !alias.scope !4, !noalias !1
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> %21, <2 x double>* %25, align 8, !alias.scope !4, !noalias !1
  %index.next155 = add i64 %index154, 4
  %26 = icmp eq i64 %index.next155, %n.vec99
  br i1 %26, label %middle.block132, label %vector.body131, !llvm.loop !6

middle.block132:                                  ; preds = %vector.body131
  br i1 %cmp.n119, label %for.inc30.us.preheader, label %for.inc.us.preheader

for.inc33.us.loopexit:                            ; preds = %for.inc30.us
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.inc33.us.loopexit, %middle.block93
  %inc34.us = add nsw i32 %inc3413.us, 1
  %cmp.us = icmp slt i32 %inc34.us, %tsteps
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.end35.loopexit

for.inc30.us:                                     ; preds = %for.inc30.us.preheader170, %for.inc30.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.inc30.us ], [ %indvars.iv66.ph, %for.inc30.us.preheader170 ]
  %27 = add nsw i64 %indvars.iv66, -1
  %arrayidx19.us = getelementptr inbounds double, double* %B, i64 %27
  %28 = load double, double* %arrayidx19.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %B, i64 %indvars.iv66
  %29 = load double, double* %arrayidx21.us, align 8
  %add22.us = fadd double %28, %29
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %arrayidx25.us = getelementptr inbounds double, double* %B, i64 %indvars.iv.next67
  %30 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add22.us, %30
  %mul27.us = fmul double %add26.us, 3.333300e-01
  %arrayidx29.us = getelementptr inbounds double, double* %A, i64 %indvars.iv66
  store double %mul27.us, double* %arrayidx29.us, align 8
  %cmp15.us = icmp slt i64 %indvars.iv.next67, %sub14
  br i1 %cmp15.us, label %for.inc30.us, label %for.inc33.us.loopexit, !llvm.loop !9

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader ]
  %31 = add nsw i64 %indvars.iv, -1
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %31
  %32 = load double, double* %arrayidx.us, align 8
  %arrayidx6.us = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %33 = load double, double* %arrayidx6.us, align 8
  %add.us = fadd double %32, %33
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.us = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %34 = load double, double* %arrayidx9.us, align 8
  %add10.us = fadd double %add.us, %34
  %mul.us = fmul double %add10.us, 3.333300e-01
  %arrayidx12.us = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul.us, double* %arrayidx12.us, align 8
  %cmp2.us = icmp slt i64 %indvars.iv.next, %sub14
  br i1 %cmp2.us, label %for.inc.us, label %for.inc30.us.preheader.loopexit, !llvm.loop !10

for.inc30.us.preheader.loopexit:                  ; preds = %for.inc.us
  br label %for.inc30.us.preheader

for.inc30.us.preheader:                           ; preds = %for.inc30.us.preheader.loopexit, %middle.block132
  br i1 %min.iters.check135, label %for.inc30.us.preheader170, label %min.iters.checked97

for.inc30.us.preheader170:                        ; preds = %middle.block93, %vector.memcheck113, %min.iters.checked97, %for.inc30.us.preheader
  %indvars.iv66.ph = phi i64 [ 1, %vector.memcheck113 ], [ 1, %min.iters.checked97 ], [ 1, %for.inc30.us.preheader ], [ %ind.end118, %middle.block93 ]
  br label %for.inc30.us

min.iters.checked97:                              ; preds = %for.inc30.us.preheader
  br i1 %cmp.zero100, label %for.inc30.us.preheader170, label %vector.memcheck113

vector.memcheck113:                               ; preds = %min.iters.checked97
  br i1 %found.conflict111, label %for.inc30.us.preheader170, label %vector.body92.preheader

vector.body92.preheader:                          ; preds = %vector.memcheck113
  br label %vector.body92

vector.body92:                                    ; preds = %vector.body92.preheader, %vector.body92
  %index115 = phi i64 [ %index.next116, %vector.body92 ], [ 0, %vector.body92.preheader ]
  %offset.idx120 = or i64 %index115, 1
  %35 = getelementptr inbounds double, double* %B, i64 %index115
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load125 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !11
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load126 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !11
  %39 = getelementptr inbounds double, double* %B, i64 %offset.idx120
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load127 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !11
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load128 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !11
  %43 = fadd <2 x double> %wide.load125, %wide.load127
  %44 = fadd <2 x double> %wide.load126, %wide.load128
  %45 = add nuw nsw i64 %offset.idx120, 1
  %46 = getelementptr inbounds double, double* %B, i64 %45
  %47 = getelementptr double, double* %46, i64 2
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load130 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !11
  %49 = fadd <2 x double> %43, %wide.load126
  %50 = fadd <2 x double> %44, %wide.load130
  %51 = fmul <2 x double> %49, <double 3.333300e-01, double 3.333300e-01>
  %52 = fmul <2 x double> %50, <double 3.333300e-01, double 3.333300e-01>
  %53 = getelementptr inbounds double, double* %A, i64 %offset.idx120
  %54 = bitcast double* %53 to <2 x double>*
  store <2 x double> %51, <2 x double>* %54, align 8, !alias.scope !14, !noalias !11
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  store <2 x double> %52, <2 x double>* %56, align 8, !alias.scope !14, !noalias !11
  %index.next116 = add i64 %index115, 4
  %57 = icmp eq i64 %index.next116, %n.vec99
  br i1 %57, label %middle.block93, label %vector.body92, !llvm.loop !16

middle.block93:                                   ; preds = %vector.body92
  br i1 %cmp.n119, label %for.inc33.us, label %for.inc30.us.preheader170

for.end35.loopexit:                               ; preds = %for.inc33.us
  br label %for.end35

for.end35:                                        ; preds = %for.end35.loopexit, %for.cond1.preheader.lr.ph, %entry
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
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %4 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #5
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
