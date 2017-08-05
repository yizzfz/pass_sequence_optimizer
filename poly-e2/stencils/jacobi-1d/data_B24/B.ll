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

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
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
  %cmp7 = icmp sgt i32 %tsteps, 0
  br i1 %cmp7, label %for.body.lr.ph, label %for.end35

for.body.lr.ph:                                   ; preds = %entry
  %sub3 = add nsw i32 %n, -1
  %cmp24 = icmp sgt i32 %sub3, 1
  %0 = sext i32 %n to i64
  %sub14 = add nsw i64 %0, -1
  br i1 %cmp24, label %for.body.us.preheader, label %for.end35

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %1 = zext i32 %sub3 to i64
  %2 = icmp sgt i64 %sub14, 2
  %smax93 = select i1 %2, i64 %sub14, i64 2
  %3 = add nsw i64 %smax93, -1
  %scevgep100 = getelementptr double, double* %A, i64 1
  %scevgep103 = getelementptr double, double* %A, i64 %smax93
  %4 = add nuw nsw i64 %smax93, 1
  %scevgep105 = getelementptr double, double* %B, i64 %4
  %5 = add nsw i64 %1, -1
  %scevgep138 = getelementptr double, double* %B, i64 1
  %scevgep140 = getelementptr double, double* %B, i64 %1
  %6 = add nuw nsw i64 %1, 1
  %scevgep142 = getelementptr double, double* %A, i64 %6
  %min.iters.check132 = icmp ult i64 %5, 4
  %min.iters.check94 = icmp ult i64 %3, 4
  %n.vec97 = and i64 %3, -4
  %cmp.zero98 = icmp eq i64 %n.vec97, 0
  %bound0107 = icmp ult double* %scevgep100, %scevgep105
  %bound1108 = icmp ugt double* %scevgep103, %B
  %found.conflict109 = and i1 %bound0107, %bound1108
  %ind.end116 = or i64 %n.vec97, 1
  %cmp.n117 = icmp eq i64 %3, %n.vec97
  %n.vec135 = and i64 %5, -4
  %cmp.zero136 = icmp eq i64 %n.vec135, 0
  %bound0144 = icmp ult double* %scevgep138, %scevgep142
  %bound1145 = icmp ugt double* %scevgep140, %A
  %found.conflict146 = and i1 %bound0144, %bound1145
  %ind.end153 = or i64 %n.vec135, 1
  %cmp.n154 = icmp eq i64 %5, %n.vec135
  br label %for.body.us

for.body.us:                                      ; preds = %for.inc33.us, %for.body.us.preheader
  %inc3413.us = phi i32 [ 0, %for.body.us.preheader ], [ %inc34.us, %for.inc33.us ]
  br i1 %min.iters.check132, label %for.inc.us.preheader, label %min.iters.checked133

min.iters.checked133:                             ; preds = %for.body.us
  br i1 %cmp.zero136, label %for.inc.us.preheader, label %vector.memcheck148

vector.memcheck148:                               ; preds = %min.iters.checked133
  br i1 %found.conflict146, label %for.inc.us.preheader, label %vector.body129.preheader

vector.body129.preheader:                         ; preds = %vector.memcheck148
  br label %vector.body129

vector.body129:                                   ; preds = %vector.body129.preheader, %vector.body129
  %index150 = phi i64 [ %index.next151, %vector.body129 ], [ 0, %vector.body129.preheader ]
  %offset.idx155 = or i64 %index150, 1
  %7 = getelementptr inbounds double, double* %A, i64 %index150
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load160 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load161 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = getelementptr inbounds double, double* %A, i64 %offset.idx155
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load162 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load163 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = fadd <2 x double> %wide.load160, %wide.load162
  %16 = fadd <2 x double> %wide.load161, %wide.load163
  %17 = add nuw nsw i64 %offset.idx155, 1
  %18 = getelementptr inbounds double, double* %A, i64 %17
  %19 = getelementptr double, double* %18, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load165 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = fadd <2 x double> %15, %wide.load161
  %22 = fadd <2 x double> %16, %wide.load165
  %23 = fmul <2 x double> %21, <double 3.333300e-01, double 3.333300e-01>
  %24 = fmul <2 x double> %22, <double 3.333300e-01, double 3.333300e-01>
  %25 = getelementptr inbounds double, double* %B, i64 %offset.idx155
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> %23, <2 x double>* %26, align 8, !alias.scope !4, !noalias !1
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> %24, <2 x double>* %28, align 8, !alias.scope !4, !noalias !1
  %index.next151 = add i64 %index150, 4
  %29 = icmp eq i64 %index.next151, %n.vec135
  br i1 %29, label %middle.block130, label %vector.body129, !llvm.loop !6

middle.block130:                                  ; preds = %vector.body129
  br i1 %cmp.n154, label %for.inc30.us.preheader, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %middle.block130, %vector.memcheck148, %min.iters.checked133, %for.body.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck148 ], [ 1, %min.iters.checked133 ], [ 1, %for.body.us ], [ %ind.end153, %middle.block130 ]
  %30 = sub nsw i64 %1, %indvars.iv.ph
  %xtraiter = and i64 %30, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit.unr-lcssa, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.inc.us.preheader
  %31 = add nsw i64 %indvars.iv.ph, -1
  %arrayidx.us.prol = getelementptr inbounds double, double* %A, i64 %31
  %32 = load double, double* %arrayidx.us.prol, align 8
  %arrayidx6.us.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv.ph
  %33 = load double, double* %arrayidx6.us.prol, align 8
  %add.us.prol = fadd double %32, %33
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  %arrayidx9.us.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.prol
  %34 = load double, double* %arrayidx9.us.prol, align 8
  %add10.us.prol = fadd double %add.us.prol, %34
  %mul.us.prol = fmul double %add10.us.prol, 3.333300e-01
  %arrayidx12.us.prol = getelementptr inbounds double, double* %B, i64 %indvars.iv.ph
  store double %mul.us.prol, double* %arrayidx12.us.prol, align 8
  br label %for.inc.us.prol.loopexit.unr-lcssa

for.inc.us.prol.loopexit.unr-lcssa:               ; preds = %for.inc.us.preheader, %for.inc.us.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.inc.us.prol.preheader ], [ %indvars.iv.ph, %for.inc.us.preheader ]
  %35 = icmp eq i64 %5, %indvars.iv.ph
  br i1 %35, label %for.inc30.us.preheader.loopexit, label %for.inc.us.preheader.new

for.inc.us.preheader.new:                         ; preds = %for.inc.us.prol.loopexit.unr-lcssa
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.inc.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.us.preheader.new ], [ %indvars.iv.next.1, %for.inc.us ]
  %36 = add nsw i64 %indvars.iv, -1
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %36
  %37 = load double, double* %arrayidx.us, align 8
  %arrayidx6.us = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %38 = load double, double* %arrayidx6.us, align 8
  %add.us = fadd double %37, %38
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.us = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %39 = load double, double* %arrayidx9.us, align 8
  %add10.us = fadd double %add.us, %39
  %mul.us = fmul double %add10.us, 3.333300e-01
  %arrayidx12.us = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul.us, double* %arrayidx12.us, align 8
  %40 = load double, double* %arrayidx6.us, align 8
  %41 = load double, double* %arrayidx9.us, align 8
  %add.us.1 = fadd double %40, %41
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx9.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %42 = load double, double* %arrayidx9.us.1, align 8
  %add10.us.1 = fadd double %add.us.1, %42
  %mul.us.1 = fmul double %add10.us.1, 3.333300e-01
  %arrayidx12.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.us.1, double* %arrayidx12.us.1, align 8
  %exitcond72.1 = icmp eq i64 %indvars.iv.next.1, %1
  br i1 %exitcond72.1, label %for.inc30.us.preheader.loopexit.unr-lcssa, label %for.inc.us, !llvm.loop !9

for.inc30.us.preheader.loopexit.unr-lcssa:        ; preds = %for.inc.us
  br label %for.inc30.us.preheader.loopexit

for.inc30.us.preheader.loopexit:                  ; preds = %for.inc.us.prol.loopexit.unr-lcssa, %for.inc30.us.preheader.loopexit.unr-lcssa
  br label %for.inc30.us.preheader

for.inc30.us.preheader:                           ; preds = %for.inc30.us.preheader.loopexit, %middle.block130
  br i1 %min.iters.check94, label %for.inc30.us.preheader166, label %min.iters.checked95

min.iters.checked95:                              ; preds = %for.inc30.us.preheader
  br i1 %cmp.zero98, label %for.inc30.us.preheader166, label %vector.memcheck111

vector.memcheck111:                               ; preds = %min.iters.checked95
  br i1 %found.conflict109, label %for.inc30.us.preheader166, label %vector.body90.preheader

vector.body90.preheader:                          ; preds = %vector.memcheck111
  br label %vector.body90

vector.body90:                                    ; preds = %vector.body90.preheader, %vector.body90
  %index113 = phi i64 [ %index.next114, %vector.body90 ], [ 0, %vector.body90.preheader ]
  %offset.idx118 = or i64 %index113, 1
  %43 = getelementptr inbounds double, double* %B, i64 %index113
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load123 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !10
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load124 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !10
  %47 = getelementptr inbounds double, double* %B, i64 %offset.idx118
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load125 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !10
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load126 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !10
  %51 = fadd <2 x double> %wide.load123, %wide.load125
  %52 = fadd <2 x double> %wide.load124, %wide.load126
  %53 = add nuw nsw i64 %offset.idx118, 1
  %54 = getelementptr inbounds double, double* %B, i64 %53
  %55 = getelementptr double, double* %54, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load128 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !10
  %57 = fadd <2 x double> %51, %wide.load124
  %58 = fadd <2 x double> %52, %wide.load128
  %59 = fmul <2 x double> %57, <double 3.333300e-01, double 3.333300e-01>
  %60 = fmul <2 x double> %58, <double 3.333300e-01, double 3.333300e-01>
  %61 = getelementptr inbounds double, double* %A, i64 %offset.idx118
  %62 = bitcast double* %61 to <2 x double>*
  store <2 x double> %59, <2 x double>* %62, align 8, !alias.scope !13, !noalias !10
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  store <2 x double> %60, <2 x double>* %64, align 8, !alias.scope !13, !noalias !10
  %index.next114 = add i64 %index113, 4
  %65 = icmp eq i64 %index.next114, %n.vec97
  br i1 %65, label %middle.block91, label %vector.body90, !llvm.loop !15

middle.block91:                                   ; preds = %vector.body90
  br i1 %cmp.n117, label %for.inc33.us, label %for.inc30.us.preheader166

for.inc30.us.preheader166:                        ; preds = %middle.block91, %vector.memcheck111, %min.iters.checked95, %for.inc30.us.preheader
  %indvars.iv65.ph = phi i64 [ 1, %vector.memcheck111 ], [ 1, %min.iters.checked95 ], [ 1, %for.inc30.us.preheader ], [ %ind.end116, %middle.block91 ]
  br label %for.inc30.us

for.inc30.us:                                     ; preds = %for.inc30.us.preheader166, %for.inc30.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.inc30.us ], [ %indvars.iv65.ph, %for.inc30.us.preheader166 ]
  %66 = add nsw i64 %indvars.iv65, -1
  %arrayidx19.us = getelementptr inbounds double, double* %B, i64 %66
  %67 = load double, double* %arrayidx19.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %B, i64 %indvars.iv65
  %68 = load double, double* %arrayidx21.us, align 8
  %add22.us = fadd double %67, %68
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %arrayidx25.us = getelementptr inbounds double, double* %B, i64 %indvars.iv.next66
  %69 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add22.us, %69
  %mul27.us = fmul double %add26.us, 3.333300e-01
  %arrayidx29.us = getelementptr inbounds double, double* %A, i64 %indvars.iv65
  store double %mul27.us, double* %arrayidx29.us, align 8
  %cmp15.us = icmp slt i64 %indvars.iv.next66, %sub14
  br i1 %cmp15.us, label %for.inc30.us, label %for.inc33.us.loopexit, !llvm.loop !16

for.inc33.us.loopexit:                            ; preds = %for.inc30.us
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.inc33.us.loopexit, %middle.block91
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
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
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
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
