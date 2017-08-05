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
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %A = alloca [2000 x double]*, align 8
  %B = alloca i8*, align 8
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 2000, i32* %n, align 4
  %call = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %0 = bitcast [2000 x double]** %A to i8**
  store i8* %call, i8** %0, align 8
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  store i8* %call1, i8** %B, align 8
  %arraydecay = bitcast i8* %call to double*
  %arraydecay2 = bitcast i8* %call1 to double*
  call fastcc void @init_array(i32 2000, double* %arraydecay, double* %arraydecay2)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %arraydecay, double* %arraydecay2)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  %1 = ptrtoint i8* %call to i64
  %2 = inttoptr i64 %1 to double*
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %3 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %3, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(i32 2000, double* %2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  %conv1 = sitofp i32 %n to double
  %0 = sext i32 %n to i64
  %1 = insertelement <2 x double> undef, double %conv1, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp2 = icmp sgt i32 %n, 0
  br i1 %cmp2, label %for.body.preheader, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.preheader:                               ; preds = %entry
  %xtraiter = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body.preheader.for.body.prol.loopexit_crit_edge, label %for.body.prol.preheader

for.body.preheader.for.body.prol.loopexit_crit_edge: ; preds = %for.body.preheader
  br label %for.body.prol.loopexit

for.body.prol.preheader:                          ; preds = %for.body.preheader
  %div.prol = fdiv <2 x double> <double 2.000000e+00, double 3.000000e+00>, %div.v.i1.2
  %div.v.r1.prol = extractelement <2 x double> %div.prol, i32 0
  %div.v.r2.prol = extractelement <2 x double> %div.prol, i32 1
  store double %div.v.r1.prol, double* %A, align 8
  store double %div.v.r2.prol, double* %B, align 8
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.preheader.for.body.prol.loopexit_crit_edge, %for.body.prol.preheader
  %indvars.iv3.unr = phi i64 [ 0, %for.body.preheader.for.body.prol.loopexit_crit_edge ], [ 1, %for.body.prol.preheader ]
  %2 = icmp eq i32 %n, 1
  br i1 %2, label %for.body.prol.loopexit.for.end.loopexit_crit_edge, label %for.body.preheader.new

for.body.prol.loopexit.for.end.loopexit_crit_edge: ; preds = %for.body.prol.loopexit
  br label %for.end.loopexit

for.body.preheader.new:                           ; preds = %for.body.prol.loopexit
  br label %for.body

for.body:                                         ; preds = %for.body.for.body_crit_edge, %for.body.preheader.new
  %indvars.iv3 = phi i64 [ %indvars.iv3.unr, %for.body.preheader.new ], [ %indvars.iv.next.1, %for.body.for.body_crit_edge ]
  %3 = trunc i64 %indvars.iv3 to i32
  %conv = sitofp i32 %3 to double
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv3
  %4 = insertelement <2 x double> undef, double %conv, i32 0
  %add.v.i0.2 = shufflevector <2 x double> %4, <2 x double> undef, <2 x i32> zeroinitializer
  %add = fadd <2 x double> %add.v.i0.2, <double 2.000000e+00, double 3.000000e+00>
  %div = fdiv <2 x double> %add, %div.v.i1.2
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv3
  store double %div.v.r2, double* %arrayidx7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv3, 1
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
  %indvars.iv.next.1 = add nsw i64 %indvars.iv3, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %0
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.body.for.body_crit_edge

for.body.for.body_crit_edge:                      ; preds = %for.body
  br label %for.body

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body.prol.loopexit.for.end.loopexit_crit_edge, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %entry.for.end_crit_edge, %for.end.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  %sub = add nsw i32 %n, -1
  %0 = sext i32 %sub to i64
  %cmp16 = icmp sgt i32 %tsteps, 0
  br i1 %cmp16, label %for.cond1.preheader.lr.ph, label %entry.for.end35_crit_edge

entry.for.end35_crit_edge:                        ; preds = %entry
  br label %for.end35

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %1 = add nsw i64 %0, -1
  %scevgep = getelementptr double, double* %A, i64 1
  %scevgep21 = getelementptr double, double* %A, i64 %0
  %2 = add nsw i64 %0, 1
  %scevgep24 = getelementptr double, double* %B, i64 %2
  %scevgep41 = getelementptr double, double* %B, i64 1
  %scevgep43 = getelementptr double, double* %B, i64 %0
  %scevgep46 = getelementptr double, double* %A, i64 %2
  %cmp211 = icmp sgt i32 %sub, 1
  %min.iters.check35 = icmp ult i64 %1, 4
  %n.vec = and i64 %1, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %bound0 = icmp ult double* %scevgep, %scevgep24
  %bound1 = icmp ugt double* %scevgep21, %B
  %found.conflict = and i1 %bound0, %bound1
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %1, %n.vec
  %bound048 = icmp ult double* %scevgep41, %scevgep46
  %bound149 = icmp ugt double* %scevgep43, %A
  %found.conflict50 = and i1 %bound048, %bound149
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc33.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %inc34617 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc34, %for.inc33.for.cond1.preheader_crit_edge ]
  br i1 %cmp211, label %for.body3.lr.ph, label %for.cond1.preheader.for.inc33_crit_edge

for.cond1.preheader.for.inc33_crit_edge:          ; preds = %for.cond1.preheader
  br label %for.inc33

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br i1 %min.iters.check35, label %for.body3.lr.ph.for.body3.preheader_crit_edge, label %min.iters.checked36

for.body3.lr.ph.for.body3.preheader_crit_edge:    ; preds = %for.body3.lr.ph
  br label %for.body3.preheader

for.body3.preheader:                              ; preds = %middle.block33.for.body3.preheader_crit_edge, %vector.memcheck52.for.body3.preheader_crit_edge, %min.iters.checked36.for.body3.preheader_crit_edge, %for.body3.lr.ph.for.body3.preheader_crit_edge
  %indvars.iv12.ph = phi i64 [ 1, %vector.memcheck52.for.body3.preheader_crit_edge ], [ 1, %min.iters.checked36.for.body3.preheader_crit_edge ], [ 1, %for.body3.lr.ph.for.body3.preheader_crit_edge ], [ %ind.end, %middle.block33.for.body3.preheader_crit_edge ]
  %3 = sub nsw i64 %0, %indvars.iv12.ph
  %xtraiter = and i64 %3, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.preheader.for.body3.prol.loopexit.unr-lcssa_crit_edge, label %for.body3.prol.preheader

for.body3.preheader.for.body3.prol.loopexit.unr-lcssa_crit_edge: ; preds = %for.body3.preheader
  br label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.preheader:                         ; preds = %for.body3.preheader
  %4 = add nsw i64 %indvars.iv12.ph, -1
  %arrayidx.prol = getelementptr inbounds double, double* %A, i64 %4
  %5 = load double, double* %arrayidx.prol, align 8
  %arrayidx6.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv12.ph
  %6 = load double, double* %arrayidx6.prol, align 8
  %add.prol = fadd double %5, %6
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv12.ph, 1
  %arrayidx9.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.prol
  %7 = load double, double* %arrayidx9.prol, align 8
  %add10.prol = fadd double %add.prol, %7
  %mul.prol = fmul double %add10.prol, 3.333300e-01
  %arrayidx12.prol = getelementptr inbounds double, double* %B, i64 %indvars.iv12.ph
  store double %mul.prol, double* %arrayidx12.prol, align 8
  br label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.loopexit.unr-lcssa:                ; preds = %for.body3.preheader.for.body3.prol.loopexit.unr-lcssa_crit_edge, %for.body3.prol.preheader
  %indvars.iv12.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body3.prol.preheader ], [ %indvars.iv12.ph, %for.body3.preheader.for.body3.prol.loopexit.unr-lcssa_crit_edge ]
  %8 = icmp eq i64 %1, %indvars.iv12.ph
  br i1 %8, label %for.body3.prol.loopexit.for.cond13.preheader.loopexit_crit_edge, label %for.body3.preheader.new

for.body3.prol.loopexit.for.cond13.preheader.loopexit_crit_edge: ; preds = %for.body3.prol.loopexit.unr-lcssa
  br label %for.cond13.preheader.loopexit

for.body3.preheader.new:                          ; preds = %for.body3.prol.loopexit.unr-lcssa
  br label %for.body3

min.iters.checked36:                              ; preds = %for.body3.lr.ph
  br i1 %cmp.zero, label %min.iters.checked36.for.body3.preheader_crit_edge, label %vector.memcheck52

min.iters.checked36.for.body3.preheader_crit_edge: ; preds = %min.iters.checked36
  br label %for.body3.preheader

vector.memcheck52:                                ; preds = %min.iters.checked36
  br i1 %found.conflict50, label %vector.memcheck52.for.body3.preheader_crit_edge, label %vector.body32.preheader

vector.memcheck52.for.body3.preheader_crit_edge:  ; preds = %vector.memcheck52
  br label %for.body3.preheader

vector.body32.preheader:                          ; preds = %vector.memcheck52
  br label %vector.body32

vector.body32:                                    ; preds = %vector.body32.vector.body32_crit_edge, %vector.body32.preheader
  %index54 = phi i64 [ %index.next55, %vector.body32.vector.body32_crit_edge ], [ 0, %vector.body32.preheader ]
  %offset.idx59 = or i64 %index54, 1
  %9 = getelementptr inbounds double, double* %A, i64 %index54
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load64 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = getelementptr double, double* %9, i64 2
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = getelementptr inbounds double, double* %A, i64 %offset.idx59
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load67 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = fadd <2 x double> %wide.load64, %wide.load66
  %18 = fadd <2 x double> %wide.load65, %wide.load67
  %19 = add nuw nsw i64 %offset.idx59, 1
  %20 = getelementptr inbounds double, double* %A, i64 %19
  %21 = getelementptr double, double* %20, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %17, %wide.load65
  %24 = fadd <2 x double> %18, %wide.load69
  %25 = fmul <2 x double> %23, <double 3.333300e-01, double 3.333300e-01>
  %26 = fmul <2 x double> %24, <double 3.333300e-01, double 3.333300e-01>
  %27 = getelementptr inbounds double, double* %B, i64 %offset.idx59
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> %25, <2 x double>* %28, align 8, !alias.scope !4, !noalias !1
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> %26, <2 x double>* %30, align 8, !alias.scope !4, !noalias !1
  %index.next55 = add i64 %index54, 4
  %31 = icmp eq i64 %index.next55, %n.vec
  br i1 %31, label %middle.block33, label %vector.body32.vector.body32_crit_edge, !llvm.loop !6

vector.body32.vector.body32_crit_edge:            ; preds = %vector.body32
  br label %vector.body32

middle.block33:                                   ; preds = %vector.body32
  br i1 %cmp.n, label %middle.block33.for.cond13.preheader_crit_edge, label %middle.block33.for.body3.preheader_crit_edge

middle.block33.for.body3.preheader_crit_edge:     ; preds = %middle.block33
  br label %for.body3.preheader

middle.block33.for.cond13.preheader_crit_edge:    ; preds = %middle.block33
  br label %for.cond13.preheader

for.cond13.preheader.loopexit.unr-lcssa:          ; preds = %for.body3
  br label %for.cond13.preheader.loopexit

for.cond13.preheader.loopexit:                    ; preds = %for.body3.prol.loopexit.for.cond13.preheader.loopexit_crit_edge, %for.cond13.preheader.loopexit.unr-lcssa
  br label %for.cond13.preheader

for.cond13.preheader:                             ; preds = %middle.block33.for.cond13.preheader_crit_edge, %for.cond13.preheader.loopexit
  br i1 true, label %for.body16.lr.ph, label %for.cond13.preheader.for.inc33_crit_edge

for.cond13.preheader.for.inc33_crit_edge:         ; preds = %for.cond13.preheader
  br label %for.inc33

for.body16.lr.ph:                                 ; preds = %for.cond13.preheader
  br i1 %min.iters.check35, label %for.body16.lr.ph.for.body16.preheader_crit_edge, label %min.iters.checked

for.body16.lr.ph.for.body16.preheader_crit_edge:  ; preds = %for.body16.lr.ph
  br label %for.body16.preheader

for.body16.preheader:                             ; preds = %middle.block.for.body16.preheader_crit_edge, %vector.memcheck.for.body16.preheader_crit_edge, %min.iters.checked.for.body16.preheader_crit_edge, %for.body16.lr.ph.for.body16.preheader_crit_edge
  %indvars.iv814.ph = phi i64 [ 1, %vector.memcheck.for.body16.preheader_crit_edge ], [ 1, %min.iters.checked.for.body16.preheader_crit_edge ], [ 1, %for.body16.lr.ph.for.body16.preheader_crit_edge ], [ %ind.end, %middle.block.for.body16.preheader_crit_edge ]
  %32 = sub nsw i64 %0, %indvars.iv814.ph
  %xtraiter70 = and i64 %32, 1
  %lcmp.mod71 = icmp eq i64 %xtraiter70, 0
  br i1 %lcmp.mod71, label %for.body16.preheader.for.body16.prol.loopexit.unr-lcssa_crit_edge, label %for.body16.prol.preheader

for.body16.preheader.for.body16.prol.loopexit.unr-lcssa_crit_edge: ; preds = %for.body16.preheader
  br label %for.body16.prol.loopexit.unr-lcssa

for.body16.prol.preheader:                        ; preds = %for.body16.preheader
  %33 = add nsw i64 %indvars.iv814.ph, -1
  %arrayidx19.prol = getelementptr inbounds double, double* %B, i64 %33
  %34 = load double, double* %arrayidx19.prol, align 8
  %arrayidx21.prol = getelementptr inbounds double, double* %B, i64 %indvars.iv814.ph
  %35 = load double, double* %arrayidx21.prol, align 8
  %add22.prol = fadd double %34, %35
  %indvars.iv.next9.prol = add nuw nsw i64 %indvars.iv814.ph, 1
  %arrayidx25.prol = getelementptr inbounds double, double* %B, i64 %indvars.iv.next9.prol
  %36 = load double, double* %arrayidx25.prol, align 8
  %add26.prol = fadd double %add22.prol, %36
  %mul27.prol = fmul double %add26.prol, 3.333300e-01
  %arrayidx29.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv814.ph
  store double %mul27.prol, double* %arrayidx29.prol, align 8
  br label %for.body16.prol.loopexit.unr-lcssa

for.body16.prol.loopexit.unr-lcssa:               ; preds = %for.body16.preheader.for.body16.prol.loopexit.unr-lcssa_crit_edge, %for.body16.prol.preheader
  %indvars.iv814.unr.ph = phi i64 [ %indvars.iv.next9.prol, %for.body16.prol.preheader ], [ %indvars.iv814.ph, %for.body16.preheader.for.body16.prol.loopexit.unr-lcssa_crit_edge ]
  %37 = icmp eq i64 %1, %indvars.iv814.ph
  br i1 %37, label %for.body16.prol.loopexit.for.inc33.loopexit_crit_edge, label %for.body16.preheader.new

for.body16.prol.loopexit.for.inc33.loopexit_crit_edge: ; preds = %for.body16.prol.loopexit.unr-lcssa
  br label %for.inc33.loopexit

for.body16.preheader.new:                         ; preds = %for.body16.prol.loopexit.unr-lcssa
  br label %for.body16

min.iters.checked:                                ; preds = %for.body16.lr.ph
  br i1 %cmp.zero, label %min.iters.checked.for.body16.preheader_crit_edge, label %vector.memcheck

min.iters.checked.for.body16.preheader_crit_edge: ; preds = %min.iters.checked
  br label %for.body16.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %found.conflict, label %vector.memcheck.for.body16.preheader_crit_edge, label %vector.body.preheader

vector.memcheck.for.body16.preheader_crit_edge:   ; preds = %vector.memcheck
  br label %for.body16.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %38 = getelementptr inbounds double, double* %B, i64 %index
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !9
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load27 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !9
  %42 = getelementptr inbounds double, double* %B, i64 %offset.idx
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load28 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !9
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load29 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !9
  %46 = fadd <2 x double> %wide.load, %wide.load28
  %47 = fadd <2 x double> %wide.load27, %wide.load29
  %48 = add nuw nsw i64 %offset.idx, 1
  %49 = getelementptr inbounds double, double* %B, i64 %48
  %50 = getelementptr double, double* %49, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load31 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !9
  %52 = fadd <2 x double> %46, %wide.load27
  %53 = fadd <2 x double> %47, %wide.load31
  %54 = fmul <2 x double> %52, <double 3.333300e-01, double 3.333300e-01>
  %55 = fmul <2 x double> %53, <double 3.333300e-01, double 3.333300e-01>
  %56 = getelementptr inbounds double, double* %A, i64 %offset.idx
  %57 = bitcast double* %56 to <2 x double>*
  store <2 x double> %54, <2 x double>* %57, align 8, !alias.scope !12, !noalias !9
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x double>*
  store <2 x double> %55, <2 x double>* %59, align 8, !alias.scope !12, !noalias !9
  %index.next = add i64 %index, 4
  %60 = icmp eq i64 %index.next, %n.vec
  br i1 %60, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !14

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.for.inc33_crit_edge, label %middle.block.for.body16.preheader_crit_edge

middle.block.for.body16.preheader_crit_edge:      ; preds = %middle.block
  br label %for.body16.preheader

middle.block.for.inc33_crit_edge:                 ; preds = %middle.block
  br label %for.inc33

for.body3:                                        ; preds = %for.body3.for.body3_crit_edge, %for.body3.preheader.new
  %indvars.iv12 = phi i64 [ %indvars.iv12.unr.ph, %for.body3.preheader.new ], [ %indvars.iv.next.1, %for.body3.for.body3_crit_edge ]
  %61 = add nsw i64 %indvars.iv12, -1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %61
  %62 = load double, double* %arrayidx, align 8
  %arrayidx6 = getelementptr inbounds double, double* %A, i64 %indvars.iv12
  %63 = load double, double* %arrayidx6, align 8
  %add = fadd double %62, %63
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %arrayidx9 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %64 = load double, double* %arrayidx9, align 8
  %add10 = fadd double %add, %64
  %mul = fmul double %add10, 3.333300e-01
  %arrayidx12 = getelementptr inbounds double, double* %B, i64 %indvars.iv12
  store double %mul, double* %arrayidx12, align 8
  %65 = load double, double* %arrayidx6, align 8
  %66 = load double, double* %arrayidx9, align 8
  %add.1 = fadd double %65, %66
  %indvars.iv.next.1 = add nsw i64 %indvars.iv12, 2
  %arrayidx9.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %67 = load double, double* %arrayidx9.1, align 8
  %add10.1 = fadd double %add.1, %67
  %mul.1 = fmul double %add10.1, 3.333300e-01
  %arrayidx12.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.1, double* %arrayidx12.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %0
  br i1 %exitcond.1, label %for.cond13.preheader.loopexit.unr-lcssa, label %for.body3.for.body3_crit_edge, !llvm.loop !15

for.body3.for.body3_crit_edge:                    ; preds = %for.body3
  br label %for.body3

for.body16:                                       ; preds = %for.body16.for.body16_crit_edge, %for.body16.preheader.new
  %indvars.iv814 = phi i64 [ %indvars.iv814.unr.ph, %for.body16.preheader.new ], [ %indvars.iv.next9.1, %for.body16.for.body16_crit_edge ]
  %68 = add nsw i64 %indvars.iv814, -1
  %arrayidx19 = getelementptr inbounds double, double* %B, i64 %68
  %69 = load double, double* %arrayidx19, align 8
  %arrayidx21 = getelementptr inbounds double, double* %B, i64 %indvars.iv814
  %70 = load double, double* %arrayidx21, align 8
  %add22 = fadd double %69, %70
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv814, 1
  %arrayidx25 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next9
  %71 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add22, %71
  %mul27 = fmul double %add26, 3.333300e-01
  %arrayidx29 = getelementptr inbounds double, double* %A, i64 %indvars.iv814
  store double %mul27, double* %arrayidx29, align 8
  %72 = load double, double* %arrayidx21, align 8
  %73 = load double, double* %arrayidx25, align 8
  %add22.1 = fadd double %72, %73
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv814, 2
  %arrayidx25.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next9.1
  %74 = load double, double* %arrayidx25.1, align 8
  %add26.1 = fadd double %add22.1, %74
  %mul27.1 = fmul double %add26.1, 3.333300e-01
  %arrayidx29.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next9
  store double %mul27.1, double* %arrayidx29.1, align 8
  %exitcond18.1 = icmp eq i64 %indvars.iv.next9.1, %0
  br i1 %exitcond18.1, label %for.inc33.loopexit.unr-lcssa, label %for.body16.for.body16_crit_edge, !llvm.loop !16

for.body16.for.body16_crit_edge:                  ; preds = %for.body16
  br label %for.body16

for.inc33.loopexit.unr-lcssa:                     ; preds = %for.body16
  br label %for.inc33.loopexit

for.inc33.loopexit:                               ; preds = %for.body16.prol.loopexit.for.inc33.loopexit_crit_edge, %for.inc33.loopexit.unr-lcssa
  br label %for.inc33

for.inc33:                                        ; preds = %middle.block.for.inc33_crit_edge, %for.cond13.preheader.for.inc33_crit_edge, %for.cond1.preheader.for.inc33_crit_edge, %for.inc33.loopexit
  %inc34 = add nuw nsw i32 %inc34617, 1
  %exitcond19 = icmp eq i32 %inc34, %tsteps
  br i1 %exitcond19, label %for.end35.loopexit, label %for.inc33.for.cond1.preheader_crit_edge

for.inc33.for.cond1.preheader_crit_edge:          ; preds = %for.inc33
  br label %for.cond1.preheader

for.end35.loopexit:                               ; preds = %for.inc33
  br label %for.end35

for.end35:                                        ; preds = %entry.for.end35_crit_edge, %for.end35.loopexit
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
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %3 = sext i32 %n to i64
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.body.preheader, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %if.end.for.body_crit_edge, %for.body.preheader
  %indvars.iv4 = phi i64 [ %indvars.iv.next, %if.end.for.body_crit_edge ], [ 0, %for.body.preheader ]
  %4 = trunc i64 %indvars.iv4 to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.body.if.end_crit_edge

for.body.if.end_crit_edge:                        ; preds = %for.body
  br label %if.end

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %if.end

if.end:                                           ; preds = %for.body.if.end_crit_edge, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv4
  %7 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.end.loopexit, label %if.end.for.body_crit_edge

if.end.for.body_crit_edge:                        ; preds = %if.end
  br label %for.body

for.end.loopexit:                                 ; preds = %if.end
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
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !7, !8}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
