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
  %cmp7 = icmp sgt i32 %tsteps, 0
  br i1 %cmp7, label %for.body.lr.ph, label %for.end35

for.body.lr.ph:                                   ; preds = %entry
  %sub3 = add nsw i32 %n, -1
  %cmp24 = icmp sgt i32 %sub3, 1
  %0 = sext i32 %n to i64
  %sub14 = add nsw i64 %0, -1
  br i1 %cmp24, label %for.body.us.preheader, label %for.end35

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %1 = and i32 %sub3, 1
  %lcmp.mod = icmp eq i32 %1, 0
  %arrayidx6.us.prol = getelementptr double, double* %A, i64 1
  %arrayidx9.us.prol = getelementptr inbounds double, double* %A, i64 2
  %arrayidx12.us.prol = getelementptr inbounds double, double* %B, i64 1
  %2 = icmp eq i32 %sub3, 2
  %wide.trip.count.1 = zext i32 %sub3 to i64
  %3 = icmp sgt i64 %sub14, 2
  %smax96 = select i1 %3, i64 %sub14, i64 2
  %4 = add nsw i64 %smax96, -1
  %scevgep106 = getelementptr double, double* %A, i64 %smax96
  %5 = add nuw nsw i64 %smax96, 1
  %scevgep108 = getelementptr double, double* %B, i64 %5
  %6 = add nsw i64 %wide.trip.count.1, -2
  %scevgep143 = getelementptr double, double* %B, i64 2
  %scevgep146 = getelementptr double, double* %A, i64 -1
  %scevgep149 = getelementptr double, double* %A, i64 3
  %min.iters.check97 = icmp ult i64 %4, 4
  %n.vec100 = and i64 %4, -4
  %cmp.zero101 = icmp eq i64 %n.vec100, 0
  %bound0110 = icmp ult double* %arrayidx6.us.prol, %scevgep108
  %bound1111 = icmp ugt double* %scevgep106, %B
  %found.conflict112 = and i1 %bound0110, %bound1111
  %ind.end119 = or i64 %n.vec100, 1
  %cmp.n120 = icmp eq i64 %4, %n.vec100
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.inc33.us
  %inc3413.us = phi i32 [ %inc34.us, %for.inc33.us ], [ 0, %for.body.us.preheader ]
  br i1 %lcmp.mod, label %for.inc.us.prol, label %for.inc.us.prol.loopexit

for.inc.us.prol:                                  ; preds = %for.body.us
  %7 = load double, double* %A, align 8
  %8 = load double, double* %arrayidx6.us.prol, align 8
  %add.us.prol = fadd double %7, %8
  %9 = load double, double* %arrayidx9.us.prol, align 8
  %add10.us.prol = fadd double %add.us.prol, %9
  %mul.us.prol = fmul double %add10.us.prol, 3.333300e-01
  store double %mul.us.prol, double* %arrayidx12.us.prol, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol, %for.body.us
  %indvars.iv.unr.ph = phi i64 [ 2, %for.inc.us.prol ], [ 1, %for.body.us ]
  br i1 %2, label %for.inc30.us.preheader, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %10 = sub nsw i64 %6, %indvars.iv.unr.ph
  %11 = lshr i64 %10, 1
  %12 = add nuw i64 %11, 1
  %min.iters.check135 = icmp ult i64 %12, 2
  br i1 %min.iters.check135, label %for.inc.us.preheader175, label %min.iters.checked136

min.iters.checked136:                             ; preds = %for.inc.us.preheader
  %n.mod.vf137 = and i64 %12, 1
  %n.vec138 = sub i64 %12, %n.mod.vf137
  %cmp.zero139 = icmp eq i64 %n.vec138, 0
  br i1 %cmp.zero139, label %for.inc.us.preheader175, label %vector.memcheck156

vector.memcheck156:                               ; preds = %min.iters.checked136
  %scevgep141 = getelementptr double, double* %B, i64 %indvars.iv.unr.ph
  %13 = shl nuw i64 %11, 1
  %14 = add i64 %indvars.iv.unr.ph, %13
  %scevgep144 = getelementptr double, double* %scevgep143, i64 %14
  %scevgep147 = getelementptr double, double* %scevgep146, i64 %indvars.iv.unr.ph
  %scevgep150 = getelementptr double, double* %scevgep149, i64 %14
  %bound0152 = icmp ult double* %scevgep141, %scevgep150
  %bound1153 = icmp ult double* %scevgep147, %scevgep144
  %found.conflict154 = and i1 %bound0152, %bound1153
  %15 = add nuw nsw i64 %indvars.iv.unr.ph, 2
  %16 = add i64 %15, %13
  %17 = shl nuw nsw i64 %n.mod.vf137, 1
  %ind.end161 = sub i64 %16, %17
  br i1 %found.conflict154, label %for.inc.us.preheader175, label %vector.body132.preheader

vector.body132.preheader:                         ; preds = %vector.memcheck156
  br label %vector.body132

vector.body132:                                   ; preds = %vector.body132.preheader, %vector.body132
  %index158 = phi i64 [ %index.next159, %vector.body132 ], [ 0, %vector.body132.preheader ]
  %18 = shl i64 %index158, 1
  %offset.idx163 = or i64 %indvars.iv.unr.ph, %18
  %19 = add nsw i64 %offset.idx163, -1
  %20 = getelementptr inbounds double, double* %A, i64 %19
  %21 = bitcast double* %20 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %21, align 8, !alias.scope !1
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec167 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %22 = fadd <2 x double> %strided.vec, %strided.vec167
  %23 = add nuw nsw i64 %offset.idx163, 1
  %24 = getelementptr inbounds double, double* %A, i64 %23
  %25 = getelementptr double, double* %24, i64 -1
  %26 = bitcast double* %25 to <4 x double>*
  %wide.vec168 = load <4 x double>, <4 x double>* %26, align 8, !alias.scope !1
  %strided.vec170 = shufflevector <4 x double> %wide.vec168, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %27 = fadd <2 x double> %22, %strided.vec170
  %28 = fmul <2 x double> %27, <double 3.333300e-01, double 3.333300e-01>
  %29 = bitcast double* %24 to <4 x double>*
  %wide.vec171 = load <4 x double>, <4 x double>* %29, align 8, !alias.scope !1
  %strided.vec173 = shufflevector <4 x double> %wide.vec171, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %30 = fadd <4 x double> %wide.vec168, %wide.vec171
  %31 = shufflevector <4 x double> %30, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %32 = fadd <2 x double> %31, %strided.vec173
  %33 = fmul <2 x double> %32, <double 3.333300e-01, double 3.333300e-01>
  %34 = getelementptr inbounds double, double* %B, i64 %23
  %35 = getelementptr double, double* %34, i64 -1
  %36 = bitcast double* %35 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %28, <2 x double> %33, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %36, align 8, !alias.scope !4, !noalias !1
  %index.next159 = add i64 %index158, 2
  %37 = icmp eq i64 %index.next159, %n.vec138
  br i1 %37, label %middle.block133, label %vector.body132, !llvm.loop !6

middle.block133:                                  ; preds = %vector.body132
  %cmp.n162 = icmp eq i64 %n.mod.vf137, 0
  br i1 %cmp.n162, label %for.inc30.us.preheader, label %for.inc.us.preheader175

for.inc.us.preheader175:                          ; preds = %middle.block133, %vector.memcheck156, %min.iters.checked136, %for.inc.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck156 ], [ %indvars.iv.unr.ph, %min.iters.checked136 ], [ %indvars.iv.unr.ph, %for.inc.us.preheader ], [ %ind.end161, %middle.block133 ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader175, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader175 ]
  %38 = add nsw i64 %indvars.iv, -1
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %38
  %39 = load double, double* %arrayidx.us, align 8
  %arrayidx6.us = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %40 = load double, double* %arrayidx6.us, align 8
  %add.us = fadd double %39, %40
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.us = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %41 = load double, double* %arrayidx9.us, align 8
  %add10.us = fadd double %add.us, %41
  %mul.us = fmul double %add10.us, 3.333300e-01
  %arrayidx12.us = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul.us, double* %arrayidx12.us, align 8
  %42 = load double, double* %arrayidx6.us, align 8
  %43 = load double, double* %arrayidx9.us, align 8
  %add.us.1 = fadd double %42, %43
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx9.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %44 = load double, double* %arrayidx9.us.1, align 8
  %add10.us.1 = fadd double %add.us.1, %44
  %mul.us.1 = fmul double %add10.us.1, 3.333300e-01
  %arrayidx12.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.us.1, double* %arrayidx12.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.inc30.us.preheader.loopexit, label %for.inc.us, !llvm.loop !9

for.inc30.us.preheader.loopexit:                  ; preds = %for.inc.us
  br label %for.inc30.us.preheader

for.inc30.us.preheader:                           ; preds = %for.inc30.us.preheader.loopexit, %for.inc.us.prol.loopexit, %middle.block133
  br i1 %min.iters.check97, label %for.inc30.us.preheader174, label %min.iters.checked98

min.iters.checked98:                              ; preds = %for.inc30.us.preheader
  br i1 %cmp.zero101, label %for.inc30.us.preheader174, label %vector.memcheck114

vector.memcheck114:                               ; preds = %min.iters.checked98
  br i1 %found.conflict112, label %for.inc30.us.preheader174, label %vector.body93.preheader

vector.body93.preheader:                          ; preds = %vector.memcheck114
  br label %vector.body93

vector.body93:                                    ; preds = %vector.body93.preheader, %vector.body93
  %index116 = phi i64 [ %index.next117, %vector.body93 ], [ 0, %vector.body93.preheader ]
  %offset.idx121 = or i64 %index116, 1
  %45 = getelementptr inbounds double, double* %B, i64 %index116
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load126 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !10
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load127 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !10
  %49 = getelementptr inbounds double, double* %B, i64 %offset.idx121
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load128 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !10
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load129 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !10
  %53 = fadd <2 x double> %wide.load126, %wide.load128
  %54 = fadd <2 x double> %wide.load127, %wide.load129
  %55 = add nuw nsw i64 %offset.idx121, 1
  %56 = getelementptr inbounds double, double* %B, i64 %55
  %57 = getelementptr double, double* %56, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !10
  %59 = fadd <2 x double> %53, %wide.load127
  %60 = fadd <2 x double> %54, %wide.load131
  %61 = fmul <2 x double> %59, <double 3.333300e-01, double 3.333300e-01>
  %62 = fmul <2 x double> %60, <double 3.333300e-01, double 3.333300e-01>
  %63 = getelementptr inbounds double, double* %A, i64 %offset.idx121
  %64 = bitcast double* %63 to <2 x double>*
  store <2 x double> %61, <2 x double>* %64, align 8, !alias.scope !13, !noalias !10
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  store <2 x double> %62, <2 x double>* %66, align 8, !alias.scope !13, !noalias !10
  %index.next117 = add i64 %index116, 4
  %67 = icmp eq i64 %index.next117, %n.vec100
  br i1 %67, label %middle.block94, label %vector.body93, !llvm.loop !15

middle.block94:                                   ; preds = %vector.body93
  br i1 %cmp.n120, label %for.inc33.us, label %for.inc30.us.preheader174

for.inc30.us.preheader174:                        ; preds = %middle.block94, %vector.memcheck114, %min.iters.checked98, %for.inc30.us.preheader
  %indvars.iv65.ph = phi i64 [ 1, %vector.memcheck114 ], [ 1, %min.iters.checked98 ], [ 1, %for.inc30.us.preheader ], [ %ind.end119, %middle.block94 ]
  br label %for.inc30.us

for.inc30.us:                                     ; preds = %for.inc30.us.preheader174, %for.inc30.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.inc30.us ], [ %indvars.iv65.ph, %for.inc30.us.preheader174 ]
  %68 = add nsw i64 %indvars.iv65, -1
  %arrayidx19.us = getelementptr inbounds double, double* %B, i64 %68
  %69 = load double, double* %arrayidx19.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %B, i64 %indvars.iv65
  %70 = load double, double* %arrayidx21.us, align 8
  %add22.us = fadd double %69, %70
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %arrayidx25.us = getelementptr inbounds double, double* %B, i64 %indvars.iv.next66
  %71 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add22.us, %71
  %mul27.us = fmul double %add26.us, 3.333300e-01
  %arrayidx29.us = getelementptr inbounds double, double* %A, i64 %indvars.iv65
  store double %mul27.us, double* %arrayidx29.us, align 8
  %cmp15.us = icmp slt i64 %indvars.iv.next66, %sub14
  br i1 %cmp15.us, label %for.inc30.us, label %for.inc33.us.loopexit, !llvm.loop !16

for.inc33.us.loopexit:                            ; preds = %for.inc30.us
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.inc33.us.loopexit, %middle.block94
  %inc34.us = add nsw i32 %inc3413.us, 1
  %cmp.us = icmp slt i32 %inc34.us, %tsteps
  br i1 %cmp.us, label %for.body.us, label %for.end35.loopexit

for.end35.loopexit:                               ; preds = %for.inc33.us
  br label %for.end35

for.end35:                                        ; preds = %for.end35.loopexit, %for.body.lr.ph, %entry
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
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
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
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
