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
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(i32 2000, double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.inc.lr.ph, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.inc.lr.ph:                                    ; preds = %entry
  %conv1 = sitofp i32 %n to double
  %0 = sext i32 %n to i64
  %1 = insertelement <2 x double> undef, double %conv1, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %xtraiter = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.lr.ph.for.inc.prol.loopexit_crit_edge, label %for.inc.prol.preheader

for.inc.lr.ph.for.inc.prol.loopexit_crit_edge:    ; preds = %for.inc.lr.ph
  br label %for.inc.prol.loopexit

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %div.prol = fdiv <2 x double> <double 2.000000e+00, double 3.000000e+00>, %div.v.i1.2
  %div.v.r1.prol = extractelement <2 x double> %div.prol, i32 0
  %div.v.r2.prol = extractelement <2 x double> %div.prol, i32 1
  store double %div.v.r1.prol, double* %A, align 8
  store double %div.v.r2.prol, double* %B, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.lr.ph.for.inc.prol.loopexit_crit_edge, %for.inc.prol.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph.for.inc.prol.loopexit_crit_edge ], [ 1, %for.inc.prol.preheader ]
  %2 = icmp eq i32 %n, 1
  br i1 %2, label %for.inc.prol.loopexit.for.end.loopexit_crit_edge, label %for.inc.lr.ph.new

for.inc.prol.loopexit.for.end.loopexit_crit_edge: ; preds = %for.inc.prol.loopexit
  br label %for.end.loopexit

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %for.inc.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc.for.inc_crit_edge ]
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
  br i1 %cmp.1, label %for.inc.for.inc_crit_edge, label %for.end.loopexit.unr-lcssa

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  br label %for.inc

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
  %cmp7 = icmp sgt i32 %tsteps, 0
  br i1 %cmp7, label %for.body.lr.ph, label %entry.for.end35_crit_edge

entry.for.end35_crit_edge:                        ; preds = %entry
  br label %for.end35

for.body.lr.ph:                                   ; preds = %entry
  %sub3 = add nsw i32 %n, -1
  %cmp24 = icmp sgt i32 %sub3, 1
  %0 = sext i32 %n to i64
  %sub14 = add nsw i64 %0, -1
  br i1 %cmp24, label %for.body.us.preheader, label %for.body.lr.ph.for.end35_crit_edge

for.body.lr.ph.for.end35_crit_edge:               ; preds = %for.body.lr.ph
  br label %for.end35

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %xtraiter = and i32 %n, 1
  %wide.trip.count.1 = zext i32 %sub3 to i64
  %arrayidx6.us.prol = getelementptr inbounds double, double* %A, i64 1
  %1 = icmp sgt i64 %sub14, 2
  %smax95 = select i1 %1, i64 %sub14, i64 2
  %2 = add nsw i64 %smax95, -1
  %scevgep104 = getelementptr double, double* %A, i64 %smax95
  %3 = add nuw nsw i64 %smax95, 1
  %scevgep106 = getelementptr double, double* %B, i64 %3
  %4 = add nsw i64 %wide.trip.count.1, -2
  %scevgep141 = getelementptr double, double* %B, i64 2
  %scevgep144 = getelementptr double, double* %A, i64 -1
  %scevgep147 = getelementptr double, double* %A, i64 3
  %5 = icmp eq i32 %xtraiter, 0
  %6 = icmp eq i32 %n, 3
  %min.iters.check96 = icmp ult i64 %2, 4
  %n.vec99 = and i64 %2, -4
  %cmp.zero100 = icmp eq i64 %n.vec99, 0
  %bound0108 = icmp ult double* %arrayidx6.us.prol, %scevgep106
  %bound1109 = icmp ugt double* %scevgep104, %B
  %found.conflict110 = and i1 %bound0108, %bound1109
  %ind.end117 = or i64 %n.vec99, 1
  %cmp.n118 = icmp eq i64 %2, %n.vec99
  %sunkaddr = ptrtoint double* %A to i64
  %sunkaddr172 = add i64 %sunkaddr, 8
  %sunkaddr173 = inttoptr i64 %sunkaddr172 to double*
  %sunkaddr175 = add i64 %sunkaddr, 16
  %sunkaddr176 = inttoptr i64 %sunkaddr175 to double*
  %sunkaddr177 = ptrtoint double* %B to i64
  %sunkaddr178 = add i64 %sunkaddr177, 8
  %sunkaddr179 = inttoptr i64 %sunkaddr178 to double*
  br label %for.body.us

for.body.us:                                      ; preds = %for.inc33.us.for.body.us_crit_edge, %for.body.us.preheader
  %inc3413.us = phi i32 [ 0, %for.body.us.preheader ], [ %inc34.us, %for.inc33.us.for.body.us_crit_edge ]
  br i1 %5, label %for.body.us.for.inc.us.prol.loopexit_crit_edge, label %for.inc.us.prol

for.body.us.for.inc.us.prol.loopexit_crit_edge:   ; preds = %for.body.us
  br label %for.inc.us.prol.loopexit

for.inc.us.prol:                                  ; preds = %for.body.us
  %7 = load double, double* %A, align 8
  %8 = load double, double* %sunkaddr173, align 8
  %add.us.prol = fadd double %7, %8
  %9 = load double, double* %sunkaddr176, align 8
  %add10.us.prol = fadd double %add.us.prol, %9
  %mul.us.prol = fmul double %add10.us.prol, 3.333300e-01
  store double %mul.us.prol, double* %sunkaddr179, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.body.us.for.inc.us.prol.loopexit_crit_edge, %for.inc.us.prol
  %indvars.iv.unr.ph = phi i64 [ 2, %for.inc.us.prol ], [ 1, %for.body.us.for.inc.us.prol.loopexit_crit_edge ]
  br i1 %6, label %for.inc.us.prol.loopexit.for.inc30.us.preheader_crit_edge, label %for.inc.us.preheader

for.inc.us.prol.loopexit.for.inc30.us.preheader_crit_edge: ; preds = %for.inc.us.prol.loopexit
  br label %for.inc30.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %10 = sub nsw i64 %4, %indvars.iv.unr.ph
  %11 = lshr i64 %10, 1
  %12 = add nuw i64 %11, 1
  %min.iters.check133 = icmp ult i64 %12, 2
  br i1 %min.iters.check133, label %for.inc.us.preheader.for.inc.us.preheader181_crit_edge, label %min.iters.checked134

for.inc.us.preheader.for.inc.us.preheader181_crit_edge: ; preds = %for.inc.us.preheader
  br label %for.inc.us.preheader181

min.iters.checked134:                             ; preds = %for.inc.us.preheader
  %n.mod.vf135 = and i64 %12, 1
  %n.vec136 = sub i64 %12, %n.mod.vf135
  %cmp.zero137 = icmp eq i64 %n.vec136, 0
  br i1 %cmp.zero137, label %min.iters.checked134.for.inc.us.preheader181_crit_edge, label %vector.memcheck154

min.iters.checked134.for.inc.us.preheader181_crit_edge: ; preds = %min.iters.checked134
  br label %for.inc.us.preheader181

vector.memcheck154:                               ; preds = %min.iters.checked134
  %scevgep139 = getelementptr double, double* %B, i64 %indvars.iv.unr.ph
  %13 = shl nuw i64 %11, 1
  %14 = add i64 %indvars.iv.unr.ph, %13
  %scevgep142 = getelementptr double, double* %scevgep141, i64 %14
  %scevgep145 = getelementptr double, double* %scevgep144, i64 %indvars.iv.unr.ph
  %scevgep148 = getelementptr double, double* %scevgep147, i64 %14
  %bound0150 = icmp ult double* %scevgep139, %scevgep148
  %bound1151 = icmp ult double* %scevgep145, %scevgep142
  %found.conflict152 = and i1 %bound0150, %bound1151
  %15 = add nuw nsw i64 %indvars.iv.unr.ph, 2
  %16 = add i64 %15, %13
  %17 = shl nuw nsw i64 %n.mod.vf135, 1
  %ind.end159 = sub i64 %16, %17
  br i1 %found.conflict152, label %vector.memcheck154.for.inc.us.preheader181_crit_edge, label %vector.body130.preheader

vector.memcheck154.for.inc.us.preheader181_crit_edge: ; preds = %vector.memcheck154
  br label %for.inc.us.preheader181

vector.body130.preheader:                         ; preds = %vector.memcheck154
  br label %vector.body130

vector.body130:                                   ; preds = %vector.body130.vector.body130_crit_edge, %vector.body130.preheader
  %index156 = phi i64 [ %index.next157, %vector.body130.vector.body130_crit_edge ], [ 0, %vector.body130.preheader ]
  %18 = shl i64 %index156, 1
  %offset.idx161 = or i64 %indvars.iv.unr.ph, %18
  %19 = add nsw i64 %offset.idx161, -1
  %20 = getelementptr inbounds double, double* %A, i64 %19
  %21 = bitcast double* %20 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %21, align 8, !alias.scope !1
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec165 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %22 = fadd <2 x double> %strided.vec, %strided.vec165
  %23 = add nuw nsw i64 %offset.idx161, 1
  %24 = getelementptr inbounds double, double* %A, i64 %23
  %25 = getelementptr double, double* %24, i64 -1
  %26 = bitcast double* %25 to <4 x double>*
  %wide.vec166 = load <4 x double>, <4 x double>* %26, align 8, !alias.scope !1
  %strided.vec168 = shufflevector <4 x double> %wide.vec166, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %27 = fadd <2 x double> %22, %strided.vec168
  %28 = fmul <2 x double> %27, <double 3.333300e-01, double 3.333300e-01>
  %29 = bitcast double* %24 to <4 x double>*
  %wide.vec169 = load <4 x double>, <4 x double>* %29, align 8, !alias.scope !1
  %strided.vec171 = shufflevector <4 x double> %wide.vec169, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %30 = fadd <4 x double> %wide.vec166, %wide.vec169
  %31 = shufflevector <4 x double> %30, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %32 = fadd <2 x double> %31, %strided.vec171
  %33 = fmul <2 x double> %32, <double 3.333300e-01, double 3.333300e-01>
  %34 = getelementptr inbounds double, double* %B, i64 %23
  %35 = getelementptr double, double* %34, i64 -1
  %36 = bitcast double* %35 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %28, <2 x double> %33, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %36, align 8, !alias.scope !4, !noalias !1
  %index.next157 = add i64 %index156, 2
  %37 = icmp eq i64 %index.next157, %n.vec136
  br i1 %37, label %middle.block131, label %vector.body130.vector.body130_crit_edge, !llvm.loop !6

vector.body130.vector.body130_crit_edge:          ; preds = %vector.body130
  br label %vector.body130

middle.block131:                                  ; preds = %vector.body130
  %cmp.n160 = icmp eq i64 %n.mod.vf135, 0
  br i1 %cmp.n160, label %middle.block131.for.inc30.us.preheader_crit_edge, label %middle.block131.for.inc.us.preheader181_crit_edge

middle.block131.for.inc.us.preheader181_crit_edge: ; preds = %middle.block131
  br label %for.inc.us.preheader181

middle.block131.for.inc30.us.preheader_crit_edge: ; preds = %middle.block131
  br label %for.inc30.us.preheader

for.inc.us.preheader181:                          ; preds = %middle.block131.for.inc.us.preheader181_crit_edge, %vector.memcheck154.for.inc.us.preheader181_crit_edge, %min.iters.checked134.for.inc.us.preheader181_crit_edge, %for.inc.us.preheader.for.inc.us.preheader181_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck154.for.inc.us.preheader181_crit_edge ], [ %indvars.iv.unr.ph, %min.iters.checked134.for.inc.us.preheader181_crit_edge ], [ %indvars.iv.unr.ph, %for.inc.us.preheader.for.inc.us.preheader181_crit_edge ], [ %ind.end159, %middle.block131.for.inc.us.preheader181_crit_edge ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.for.inc.us_crit_edge, %for.inc.us.preheader181
  %indvars.iv = phi i64 [ %add7.us.1, %for.inc.us.for.inc.us_crit_edge ], [ %indvars.iv.ph, %for.inc.us.preheader181 ]
  %sub4.us = add nsw i64 %indvars.iv, -1
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %sub4.us
  %38 = load double, double* %arrayidx.us, align 8
  %arrayidx6.us = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %39 = load double, double* %arrayidx6.us, align 8
  %add.us = fadd double %38, %39
  %add7.us = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.us = getelementptr inbounds double, double* %A, i64 %add7.us
  %40 = load double, double* %arrayidx9.us, align 8
  %add10.us = fadd double %add.us, %40
  %mul.us = fmul double %add10.us, 3.333300e-01
  %arrayidx12.us = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul.us, double* %arrayidx12.us, align 8
  %41 = load double, double* %arrayidx6.us, align 8
  %42 = load double, double* %arrayidx9.us, align 8
  %add.us.1 = fadd double %41, %42
  %add7.us.1 = add nsw i64 %indvars.iv, 2
  %arrayidx9.us.1 = getelementptr inbounds double, double* %A, i64 %add7.us.1
  %43 = load double, double* %arrayidx9.us.1, align 8
  %add10.us.1 = fadd double %add.us.1, %43
  %mul.us.1 = fmul double %add10.us.1, 3.333300e-01
  %arrayidx12.us.1 = getelementptr inbounds double, double* %B, i64 %add7.us
  store double %mul.us.1, double* %arrayidx12.us.1, align 8
  %exitcond.1 = icmp eq i64 %add7.us.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.inc30.us.preheader.loopexit, label %for.inc.us.for.inc.us_crit_edge, !llvm.loop !9

for.inc.us.for.inc.us_crit_edge:                  ; preds = %for.inc.us
  br label %for.inc.us

for.inc30.us:                                     ; preds = %for.inc30.us.for.inc30.us_crit_edge, %for.inc30.us.preheader180
  %indvars.iv66 = phi i64 [ %add23.us, %for.inc30.us.for.inc30.us_crit_edge ], [ %indvars.iv66.ph, %for.inc30.us.preheader180 ]
  %sub17.us = add nsw i64 %indvars.iv66, -1
  %arrayidx19.us = getelementptr inbounds double, double* %B, i64 %sub17.us
  %44 = load double, double* %arrayidx19.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %B, i64 %indvars.iv66
  %45 = load double, double* %arrayidx21.us, align 8
  %add22.us = fadd double %44, %45
  %add23.us = add nuw nsw i64 %indvars.iv66, 1
  %arrayidx25.us = getelementptr inbounds double, double* %B, i64 %add23.us
  %46 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add22.us, %46
  %mul27.us = fmul double %add26.us, 3.333300e-01
  %arrayidx29.us = getelementptr inbounds double, double* %A, i64 %indvars.iv66
  store double %mul27.us, double* %arrayidx29.us, align 8
  %cmp15.us = icmp slt i64 %add23.us, %sub14
  br i1 %cmp15.us, label %for.inc30.us.for.inc30.us_crit_edge, label %for.inc33.us.loopexit, !llvm.loop !10

for.inc30.us.for.inc30.us_crit_edge:              ; preds = %for.inc30.us
  br label %for.inc30.us

for.inc33.us.loopexit:                            ; preds = %for.inc30.us
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %middle.block93.for.inc33.us_crit_edge, %for.inc33.us.loopexit
  %inc34.us = add nsw i32 %inc3413.us, 1
  %cmp.us = icmp slt i32 %inc34.us, %tsteps
  br i1 %cmp.us, label %for.inc33.us.for.body.us_crit_edge, label %for.end35.loopexit

for.inc33.us.for.body.us_crit_edge:               ; preds = %for.inc33.us
  br label %for.body.us

for.inc30.us.preheader.loopexit:                  ; preds = %for.inc.us
  br label %for.inc30.us.preheader

for.inc30.us.preheader:                           ; preds = %middle.block131.for.inc30.us.preheader_crit_edge, %for.inc.us.prol.loopexit.for.inc30.us.preheader_crit_edge, %for.inc30.us.preheader.loopexit
  br i1 %min.iters.check96, label %for.inc30.us.preheader.for.inc30.us.preheader180_crit_edge, label %min.iters.checked97

for.inc30.us.preheader.for.inc30.us.preheader180_crit_edge: ; preds = %for.inc30.us.preheader
  br label %for.inc30.us.preheader180

for.inc30.us.preheader180:                        ; preds = %middle.block93.for.inc30.us.preheader180_crit_edge, %vector.memcheck112.for.inc30.us.preheader180_crit_edge, %min.iters.checked97.for.inc30.us.preheader180_crit_edge, %for.inc30.us.preheader.for.inc30.us.preheader180_crit_edge
  %indvars.iv66.ph = phi i64 [ 1, %vector.memcheck112.for.inc30.us.preheader180_crit_edge ], [ 1, %min.iters.checked97.for.inc30.us.preheader180_crit_edge ], [ 1, %for.inc30.us.preheader.for.inc30.us.preheader180_crit_edge ], [ %ind.end117, %middle.block93.for.inc30.us.preheader180_crit_edge ]
  br label %for.inc30.us

min.iters.checked97:                              ; preds = %for.inc30.us.preheader
  br i1 %cmp.zero100, label %min.iters.checked97.for.inc30.us.preheader180_crit_edge, label %vector.memcheck112

min.iters.checked97.for.inc30.us.preheader180_crit_edge: ; preds = %min.iters.checked97
  br label %for.inc30.us.preheader180

vector.memcheck112:                               ; preds = %min.iters.checked97
  br i1 %found.conflict110, label %vector.memcheck112.for.inc30.us.preheader180_crit_edge, label %vector.body92.preheader

vector.memcheck112.for.inc30.us.preheader180_crit_edge: ; preds = %vector.memcheck112
  br label %for.inc30.us.preheader180

vector.body92.preheader:                          ; preds = %vector.memcheck112
  br label %vector.body92

vector.body92:                                    ; preds = %vector.body92.vector.body92_crit_edge, %vector.body92.preheader
  %index114 = phi i64 [ %index.next115, %vector.body92.vector.body92_crit_edge ], [ 0, %vector.body92.preheader ]
  %offset.idx119 = or i64 %index114, 1
  %47 = getelementptr inbounds double, double* %B, i64 %index114
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load124 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !11
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load125 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !11
  %51 = getelementptr inbounds double, double* %B, i64 %offset.idx119
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load126 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !11
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load127 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !11
  %55 = fadd <2 x double> %wide.load124, %wide.load126
  %56 = fadd <2 x double> %wide.load125, %wide.load127
  %57 = add nuw nsw i64 %offset.idx119, 1
  %58 = getelementptr inbounds double, double* %B, i64 %57
  %59 = getelementptr double, double* %58, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load129 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !11
  %61 = fadd <2 x double> %55, %wide.load125
  %62 = fadd <2 x double> %56, %wide.load129
  %63 = fmul <2 x double> %61, <double 3.333300e-01, double 3.333300e-01>
  %64 = fmul <2 x double> %62, <double 3.333300e-01, double 3.333300e-01>
  %65 = getelementptr inbounds double, double* %A, i64 %offset.idx119
  %66 = bitcast double* %65 to <2 x double>*
  store <2 x double> %63, <2 x double>* %66, align 8, !alias.scope !14, !noalias !11
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x double>*
  store <2 x double> %64, <2 x double>* %68, align 8, !alias.scope !14, !noalias !11
  %index.next115 = add i64 %index114, 4
  %69 = icmp eq i64 %index.next115, %n.vec99
  br i1 %69, label %middle.block93, label %vector.body92.vector.body92_crit_edge, !llvm.loop !16

vector.body92.vector.body92_crit_edge:            ; preds = %vector.body92
  br label %vector.body92

middle.block93:                                   ; preds = %vector.body92
  br i1 %cmp.n118, label %middle.block93.for.inc33.us_crit_edge, label %middle.block93.for.inc30.us.preheader180_crit_edge

middle.block93.for.inc30.us.preheader180_crit_edge: ; preds = %middle.block93
  br label %for.inc30.us.preheader180

middle.block93.for.inc33.us_crit_edge:            ; preds = %middle.block93
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
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.lr.ph, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.inc.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc.for.body_crit_edge ]
  %4 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.body.for.inc_crit_edge

for.body.for.inc_crit_edge:                       ; preds = %for.body
  br label %for.inc

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body.for.inc_crit_edge, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp, label %for.inc.for.body_crit_edge, label %for.end.loopexit

for.inc.for.body_crit_edge:                       ; preds = %for.inc
  br label %for.body

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %entry.for.end_crit_edge, %for.end.loopexit
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #5
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
