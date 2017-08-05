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
  br i1 %cmp1, label %for.body.lr.ph, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %conv1 = sitofp i32 %n to double
  %0 = sext i32 %n to i64
  %1 = insertelement <2 x double> undef, double %conv1, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body

for.body:                                         ; preds = %for.body.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body.for.body_crit_edge ]
  %2 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %2 to double
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %3 = insertelement <2 x double> undef, double %conv, i32 0
  %add.v.i0.2 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  %add = fadd <2 x double> %add.v.i0.2, <double 2.000000e+00, double 3.000000e+00>
  %div = fdiv <2 x double> %add, %div.v.i1.2
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %div.v.r2, double* %arrayidx7, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %0
  br i1 %cmp, label %for.body.for.body_crit_edge, label %for.end.loopexit

for.body.for.body_crit_edge:                      ; preds = %for.body
  br label %for.body

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %entry.for.end_crit_edge, %for.end.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  %cmp10 = icmp sgt i32 %tsteps, 0
  br i1 %cmp10, label %for.body.lr.ph, label %entry.for.end35_crit_edge

entry.for.end35_crit_edge:                        ; preds = %entry
  br label %for.end35

for.body.lr.ph:                                   ; preds = %entry
  %sub3 = add nsw i32 %n, -1
  %0 = sext i32 %n to i64
  %sub14 = add nsw i64 %0, -1
  %1 = icmp sgt i32 %sub3, 1
  %2 = icmp sgt i64 %sub14, 2
  %smax = select i1 %2, i64 %sub14, i64 2
  %3 = add nsw i64 %smax, -1
  %scevgep = getelementptr double, double* %A, i64 1
  %scevgep20 = getelementptr double, double* %A, i64 %smax
  %4 = add nuw nsw i64 %smax, 1
  %scevgep22 = getelementptr double, double* %B, i64 %4
  %scevgep40 = getelementptr double, double* %B, i64 1
  %scevgep43 = getelementptr double, double* %B, i64 %smax
  %scevgep45 = getelementptr double, double* %A, i64 %4
  %min.iters.check34 = icmp ult i64 %3, 4
  %n.vec = and i64 %3, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %bound0 = icmp ult double* %scevgep, %scevgep22
  %bound1 = icmp ugt double* %scevgep20, %B
  %found.conflict = and i1 %bound0, %bound1
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %3, %n.vec
  %bound047 = icmp ult double* %scevgep40, %scevgep45
  %bound148 = icmp ugt double* %scevgep43, %A
  %found.conflict49 = and i1 %bound047, %bound148
  br label %for.body

for.body:                                         ; preds = %for.inc33.for.body_crit_edge, %for.body.lr.ph
  %inc3413 = phi i32 [ 0, %for.body.lr.ph ], [ %inc34, %for.inc33.for.body_crit_edge ]
  br i1 %1, label %for.body3.preheader, label %for.body.for.inc33_crit_edge

for.body.for.inc33_crit_edge:                     ; preds = %for.body
  br label %for.inc33

for.body3.preheader:                              ; preds = %for.body
  br i1 %min.iters.check34, label %for.body3.preheader.for.body3.preheader70_crit_edge, label %min.iters.checked35

for.body3.preheader.for.body3.preheader70_crit_edge: ; preds = %for.body3.preheader
  br label %for.body3.preheader70

min.iters.checked35:                              ; preds = %for.body3.preheader
  br i1 %cmp.zero, label %min.iters.checked35.for.body3.preheader70_crit_edge, label %vector.memcheck51

min.iters.checked35.for.body3.preheader70_crit_edge: ; preds = %min.iters.checked35
  br label %for.body3.preheader70

vector.memcheck51:                                ; preds = %min.iters.checked35
  br i1 %found.conflict49, label %vector.memcheck51.for.body3.preheader70_crit_edge, label %vector.body30.preheader

vector.memcheck51.for.body3.preheader70_crit_edge: ; preds = %vector.memcheck51
  br label %for.body3.preheader70

vector.body30.preheader:                          ; preds = %vector.memcheck51
  br label %vector.body30

vector.body30:                                    ; preds = %vector.body30.vector.body30_crit_edge, %vector.body30.preheader
  %index53 = phi i64 [ %index.next54, %vector.body30.vector.body30_crit_edge ], [ 0, %vector.body30.preheader ]
  %offset.idx58 = or i64 %index53, 1
  %5 = getelementptr inbounds double, double* %A, i64 %index53
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load63 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = getelementptr double, double* %5, i64 2
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load64 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = getelementptr inbounds double, double* %A, i64 %offset.idx58
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = getelementptr double, double* %9, i64 2
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = fadd <2 x double> %wide.load63, %wide.load65
  %14 = fadd <2 x double> %wide.load64, %wide.load66
  %15 = add nuw nsw i64 %offset.idx58, 1
  %16 = getelementptr inbounds double, double* %A, i64 %15
  %17 = getelementptr double, double* %16, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = fadd <2 x double> %13, %wide.load64
  %20 = fadd <2 x double> %14, %wide.load68
  %21 = fmul <2 x double> %19, <double 3.333300e-01, double 3.333300e-01>
  %22 = fmul <2 x double> %20, <double 3.333300e-01, double 3.333300e-01>
  %23 = getelementptr inbounds double, double* %B, i64 %offset.idx58
  %24 = bitcast double* %23 to <2 x double>*
  store <2 x double> %21, <2 x double>* %24, align 8, !alias.scope !4, !noalias !1
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> %22, <2 x double>* %26, align 8, !alias.scope !4, !noalias !1
  %index.next54 = add i64 %index53, 4
  %27 = icmp eq i64 %index.next54, %n.vec
  br i1 %27, label %middle.block31, label %vector.body30.vector.body30_crit_edge, !llvm.loop !6

vector.body30.vector.body30_crit_edge:            ; preds = %vector.body30
  br label %vector.body30

middle.block31:                                   ; preds = %vector.body30
  br i1 %cmp.n, label %middle.block31.for.end_crit_edge, label %middle.block31.for.body3.preheader70_crit_edge

middle.block31.for.body3.preheader70_crit_edge:   ; preds = %middle.block31
  br label %for.body3.preheader70

middle.block31.for.end_crit_edge:                 ; preds = %middle.block31
  br label %for.end

for.body3.preheader70:                            ; preds = %middle.block31.for.body3.preheader70_crit_edge, %vector.memcheck51.for.body3.preheader70_crit_edge, %min.iters.checked35.for.body3.preheader70_crit_edge, %for.body3.preheader.for.body3.preheader70_crit_edge
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck51.for.body3.preheader70_crit_edge ], [ 1, %min.iters.checked35.for.body3.preheader70_crit_edge ], [ 1, %for.body3.preheader.for.body3.preheader70_crit_edge ], [ %ind.end, %middle.block31.for.body3.preheader70_crit_edge ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.for.body3_crit_edge, %for.body3.preheader70
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.for.body3_crit_edge ], [ %indvars.iv.ph, %for.body3.preheader70 ]
  %28 = add nsw i64 %indvars.iv, -1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %28
  %29 = load double, double* %arrayidx, align 8
  %arrayidx6 = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %30 = load double, double* %arrayidx6, align 8
  %add = fadd double %29, %30
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %31 = load double, double* %arrayidx9, align 8
  %add10 = fadd double %add, %31
  %mul = fmul double %add10, 3.333300e-01
  %arrayidx12 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul, double* %arrayidx12, align 8
  %cmp2 = icmp slt i64 %indvars.iv.next, %sub14
  br i1 %cmp2, label %for.body3.for.body3_crit_edge, label %for.end.loopexit, !llvm.loop !9

for.body3.for.body3_crit_edge:                    ; preds = %for.body3
  br label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %middle.block31.for.end_crit_edge, %for.end.loopexit
  br i1 true, label %for.body16.preheader, label %for.end.for.inc33_crit_edge

for.end.for.inc33_crit_edge:                      ; preds = %for.end
  br label %for.inc33

for.body16.preheader:                             ; preds = %for.end
  br i1 %min.iters.check34, label %for.body16.preheader.for.body16.preheader69_crit_edge, label %min.iters.checked

for.body16.preheader.for.body16.preheader69_crit_edge: ; preds = %for.body16.preheader
  br label %for.body16.preheader69

min.iters.checked:                                ; preds = %for.body16.preheader
  br i1 %cmp.zero, label %min.iters.checked.for.body16.preheader69_crit_edge, label %vector.memcheck

min.iters.checked.for.body16.preheader69_crit_edge: ; preds = %min.iters.checked
  br label %for.body16.preheader69

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %found.conflict, label %vector.memcheck.for.body16.preheader69_crit_edge, label %vector.body.preheader

vector.memcheck.for.body16.preheader69_crit_edge: ; preds = %vector.memcheck
  br label %for.body16.preheader69

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %32 = getelementptr inbounds double, double* %B, i64 %index
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !10
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load25 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !10
  %36 = getelementptr inbounds double, double* %B, i64 %offset.idx
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load26 = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !10
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load27 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !10
  %40 = fadd <2 x double> %wide.load, %wide.load26
  %41 = fadd <2 x double> %wide.load25, %wide.load27
  %42 = add nuw nsw i64 %offset.idx, 1
  %43 = getelementptr inbounds double, double* %B, i64 %42
  %44 = getelementptr double, double* %43, i64 2
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load29 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !10
  %46 = fadd <2 x double> %40, %wide.load25
  %47 = fadd <2 x double> %41, %wide.load29
  %48 = fmul <2 x double> %46, <double 3.333300e-01, double 3.333300e-01>
  %49 = fmul <2 x double> %47, <double 3.333300e-01, double 3.333300e-01>
  %50 = getelementptr inbounds double, double* %A, i64 %offset.idx
  %51 = bitcast double* %50 to <2 x double>*
  store <2 x double> %48, <2 x double>* %51, align 8, !alias.scope !13, !noalias !10
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x double>*
  store <2 x double> %49, <2 x double>* %53, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %54 = icmp eq i64 %index.next, %n.vec
  br i1 %54, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !15

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.for.inc33_crit_edge, label %middle.block.for.body16.preheader69_crit_edge

middle.block.for.body16.preheader69_crit_edge:    ; preds = %middle.block
  br label %for.body16.preheader69

middle.block.for.inc33_crit_edge:                 ; preds = %middle.block
  br label %for.inc33

for.body16.preheader69:                           ; preds = %middle.block.for.body16.preheader69_crit_edge, %vector.memcheck.for.body16.preheader69_crit_edge, %min.iters.checked.for.body16.preheader69_crit_edge, %for.body16.preheader.for.body16.preheader69_crit_edge
  %indvars.iv15.ph = phi i64 [ 1, %vector.memcheck.for.body16.preheader69_crit_edge ], [ 1, %min.iters.checked.for.body16.preheader69_crit_edge ], [ 1, %for.body16.preheader.for.body16.preheader69_crit_edge ], [ %ind.end, %middle.block.for.body16.preheader69_crit_edge ]
  br label %for.body16

for.body16:                                       ; preds = %for.body16.for.body16_crit_edge, %for.body16.preheader69
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.body16.for.body16_crit_edge ], [ %indvars.iv15.ph, %for.body16.preheader69 ]
  %55 = add nsw i64 %indvars.iv15, -1
  %arrayidx19 = getelementptr inbounds double, double* %B, i64 %55
  %56 = load double, double* %arrayidx19, align 8
  %arrayidx21 = getelementptr inbounds double, double* %B, i64 %indvars.iv15
  %57 = load double, double* %arrayidx21, align 8
  %add22 = fadd double %56, %57
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %arrayidx25 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next16
  %58 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add22, %58
  %mul27 = fmul double %add26, 3.333300e-01
  %arrayidx29 = getelementptr inbounds double, double* %A, i64 %indvars.iv15
  store double %mul27, double* %arrayidx29, align 8
  %cmp15 = icmp slt i64 %indvars.iv.next16, %sub14
  br i1 %cmp15, label %for.body16.for.body16_crit_edge, label %for.inc33.loopexit, !llvm.loop !16

for.body16.for.body16_crit_edge:                  ; preds = %for.body16
  br label %for.body16

for.inc33.loopexit:                               ; preds = %for.body16
  br label %for.inc33

for.inc33:                                        ; preds = %middle.block.for.inc33_crit_edge, %for.end.for.inc33_crit_edge, %for.body.for.inc33_crit_edge, %for.inc33.loopexit
  %inc34 = add nsw i32 %inc3413, 1
  %cmp = icmp slt i32 %inc34, %tsteps
  br i1 %cmp, label %for.inc33.for.body_crit_edge, label %for.end35.loopexit

for.inc33.for.body_crit_edge:                     ; preds = %for.inc33
  br label %for.body

for.end35.loopexit:                               ; preds = %for.inc33
  br label %for.end35

for.end35:                                        ; preds = %entry.for.end35_crit_edge, %for.end35.loopexit
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

for.body:                                         ; preds = %if.end.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %if.end.for.body_crit_edge ]
  %4 = trunc i64 %indvars.iv to i32
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
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp, label %if.end.for.body_crit_edge, label %for.end.loopexit

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
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
