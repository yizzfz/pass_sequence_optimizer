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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %.cast = bitcast i8* %3 to double*
  %.cast1 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %.cast, double* %.cast1)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %.cast, double* %.cast1)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(i32 2000, double* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double*, double*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = sext i32 %0 to i64
  %min.iters.check = icmp eq i32 %0, 1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  %n.vec = and i64 %6, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %1, i64 %6
  %scevgep5 = getelementptr double, double* %2, i64 %6
  %bound0 = icmp ugt double* %scevgep5, %1
  %bound1 = icmp ugt double* %scevgep, %2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x double> undef, double %5, i32 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind7 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next8, %vector.body ]
  %7 = sitofp <2 x i32> %vec.ind7 to <2 x double>
  %8 = fadd <2 x double> %7, <double 2.000000e+00, double 2.000000e+00>
  %9 = fdiv <2 x double> %8, %broadcast.splat
  %10 = getelementptr inbounds double, double* %1, i64 %index
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> %9, <2 x double>* %11, align 8, !alias.scope !1, !noalias !4
  %12 = fadd <2 x double> %7, <double 3.000000e+00, double 3.000000e+00>
  %13 = fdiv <2 x double> %12, %broadcast.splat
  %14 = getelementptr inbounds double, double* %2, i64 %index
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> %13, <2 x double>* %15, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next8 = add <2 x i32> %vec.ind7, <i32 2, i32 2>
  %16 = icmp eq i64 %index.next, %n.vec
  br i1 %16, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %6, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph
  %indvars.iv2.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ %n.vec, %middle.block ]
  %17 = insertelement <2 x double> undef, double %5, i32 0
  %18 = insertelement <2 x double> %17, double %5, i32 1
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %scalar.ph ], [ %indvars.iv2.ph, %scalar.ph.preheader ]
  %19 = trunc i64 %indvars.iv2 to i32
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv2
  %22 = insertelement <2 x double> undef, double %20, i32 0
  %23 = insertelement <2 x double> %22, double %20, i32 1
  %24 = fadd <2 x double> %23, <double 2.000000e+00, double 3.000000e+00>
  %25 = fdiv <2 x double> %24, %18
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  store double %26, double* %21, align 8
  %28 = getelementptr inbounds double, double* %2, i64 %indvars.iv2
  store double %27, double* %28, align 8
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, %6
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double*, double*) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %..preheader3_crit_edge.lr.ph, label %._crit_edge

..preheader3_crit_edge.lr.ph:                     ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  %8 = sext i32 %1 to i64
  %9 = add nsw i64 %8, -1
  br i1 %7, label %..preheader3_crit_edge.us.preheader, label %._crit_edge

..preheader3_crit_edge.us.preheader:              ; preds = %..preheader3_crit_edge.lr.ph
  %10 = icmp sgt i64 %9, 2
  %smax = select i1 %10, i64 %9, i64 2
  %11 = add nsw i64 %smax, -1
  %scevgep = getelementptr double, double* %2, i64 1
  %12 = icmp sgt i64 %9, 2
  %smax27 = select i1 %12, i64 %9, i64 2
  %scevgep28 = getelementptr double, double* %2, i64 %smax27
  %13 = add nuw nsw i64 %smax27, 1
  %scevgep30 = getelementptr double, double* %3, i64 %13
  %14 = icmp sgt i64 %9, 2
  %smax41 = select i1 %14, i64 %9, i64 2
  %15 = add nsw i64 %smax41, -1
  %scevgep48 = getelementptr double, double* %3, i64 1
  %16 = icmp sgt i64 %9, 2
  %smax50 = select i1 %16, i64 %9, i64 2
  %scevgep51 = getelementptr double, double* %3, i64 %smax50
  %17 = add nuw nsw i64 %smax50, 1
  %scevgep53 = getelementptr double, double* %2, i64 %17
  %min.iters.check42 = icmp ult i64 %15, 4
  %min.iters.check = icmp ult i64 %11, 4
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %bound0 = icmp ult double* %scevgep, %scevgep30
  %bound1 = icmp ugt double* %scevgep28, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %11, %n.vec
  %n.vec45 = and i64 %15, -4
  %cmp.zero46 = icmp eq i64 %n.vec45, 0
  %bound055 = icmp ult double* %scevgep48, %scevgep53
  %bound156 = icmp ugt double* %scevgep51, %2
  %memcheck.conflict58 = and i1 %bound055, %bound156
  %ind.end64 = or i64 %n.vec45, 1
  %cmp.n65 = icmp eq i64 %15, %n.vec45
  br label %..preheader3_crit_edge.us

..preheader3_crit_edge.us:                        ; preds = %..preheader3_crit_edge.us.preheader, %.preheader._crit_edge.us
  %18 = phi i32 [ %44, %.preheader._crit_edge.us ], [ 0, %..preheader3_crit_edge.us.preheader ]
  br i1 %min.iters.check42, label %.preheader3.us.preheader, label %min.iters.checked43

.preheader3.us.preheader:                         ; preds = %middle.block39, %vector.memcheck59, %min.iters.checked43, %..preheader3_crit_edge.us
  %indvars.iv6.us.ph = phi i64 [ 1, %vector.memcheck59 ], [ 1, %min.iters.checked43 ], [ 1, %..preheader3_crit_edge.us ], [ %ind.end64, %middle.block39 ]
  br label %.preheader3.us

min.iters.checked43:                              ; preds = %..preheader3_crit_edge.us
  br i1 %cmp.zero46, label %.preheader3.us.preheader, label %vector.memcheck59

vector.memcheck59:                                ; preds = %min.iters.checked43
  br i1 %memcheck.conflict58, label %.preheader3.us.preheader, label %vector.body38.preheader

vector.body38.preheader:                          ; preds = %vector.memcheck59
  br label %vector.body38

vector.body38:                                    ; preds = %vector.body38.preheader, %vector.body38
  %index61 = phi i64 [ %index.next62, %vector.body38 ], [ 0, %vector.body38.preheader ]
  %offset.idx66 = or i64 %index61, 1
  %19 = add nsw i64 %offset.idx66, -1
  %20 = getelementptr inbounds double, double* %2, i64 %19
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !10
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !10
  %24 = getelementptr inbounds double, double* %2, i64 %offset.idx66
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !10
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !10
  %28 = fadd <2 x double> %wide.load71, %wide.load73
  %29 = fadd <2 x double> %wide.load72, %wide.load74
  %30 = add nuw nsw i64 %offset.idx66, 1
  %31 = getelementptr inbounds double, double* %2, i64 %30
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !10
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !10
  %35 = fadd <2 x double> %28, %wide.load75
  %36 = fadd <2 x double> %29, %wide.load76
  %37 = fmul <2 x double> %35, <double 3.333300e-01, double 3.333300e-01>
  %38 = fmul <2 x double> %36, <double 3.333300e-01, double 3.333300e-01>
  %39 = getelementptr inbounds double, double* %3, i64 %offset.idx66
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %37, <2 x double>* %40, align 8, !alias.scope !13, !noalias !10
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %38, <2 x double>* %42, align 8, !alias.scope !13, !noalias !10
  %index.next62 = add i64 %index61, 4
  %43 = icmp eq i64 %index.next62, %n.vec45
  br i1 %43, label %middle.block39, label %vector.body38, !llvm.loop !15

middle.block39:                                   ; preds = %vector.body38
  br i1 %cmp.n65, label %.preheader.us.preheader, label %.preheader3.us.preheader

.preheader._crit_edge.us.loopexit:                ; preds = %.preheader.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit, %middle.block
  %44 = add nuw nsw i32 %18, 1
  %exitcond = icmp eq i32 %44, %0
  br i1 %exitcond, label %._crit_edge.loopexit, label %..preheader3_crit_edge.us

.preheader.us:                                    ; preds = %.preheader.us.preheader77, %.preheader.us
  %indvars.iv47.us = phi i64 [ %51, %.preheader.us ], [ %indvars.iv47.us.ph, %.preheader.us.preheader77 ]
  %45 = add nsw i64 %indvars.iv47.us, -1
  %46 = getelementptr inbounds double, double* %3, i64 %45
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds double, double* %3, i64 %indvars.iv47.us
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %51 = add nuw nsw i64 %indvars.iv47.us, 1
  %52 = getelementptr inbounds double, double* %3, i64 %51
  %53 = load double, double* %52, align 8
  %54 = fadd double %50, %53
  %55 = fmul double %54, 3.333300e-01
  %56 = getelementptr inbounds double, double* %2, i64 %indvars.iv47.us
  store double %55, double* %56, align 8
  %57 = icmp slt i64 %51, %9
  br i1 %57, label %.preheader.us, label %.preheader._crit_edge.us.loopexit, !llvm.loop !16

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %.preheader3.us
  %indvars.iv6.us = phi i64 [ %64, %.preheader3.us ], [ %indvars.iv6.us.ph, %.preheader3.us.preheader ]
  %58 = add nsw i64 %indvars.iv6.us, -1
  %59 = getelementptr inbounds double, double* %2, i64 %58
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds double, double* %2, i64 %indvars.iv6.us
  %62 = load double, double* %61, align 8
  %63 = fadd double %60, %62
  %64 = add nuw nsw i64 %indvars.iv6.us, 1
  %65 = getelementptr inbounds double, double* %2, i64 %64
  %66 = load double, double* %65, align 8
  %67 = fadd double %63, %66
  %68 = fmul double %67, 3.333300e-01
  %69 = getelementptr inbounds double, double* %3, i64 %indvars.iv6.us
  store double %68, double* %69, align 8
  %70 = icmp slt i64 %64, %9
  br i1 %70, label %.preheader3.us, label %.preheader.us.preheader.loopexit, !llvm.loop !17

.preheader.us.preheader.loopexit:                 ; preds = %.preheader3.us
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit, %middle.block39
  br i1 %min.iters.check, label %.preheader.us.preheader77, label %min.iters.checked

.preheader.us.preheader77:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us.preheader
  %indvars.iv47.us.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader.us

min.iters.checked:                                ; preds = %.preheader.us.preheader
  br i1 %cmp.zero, label %.preheader.us.preheader77, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %memcheck.conflict, label %.preheader.us.preheader77, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %71 = add nsw i64 %offset.idx, -1
  %72 = getelementptr inbounds double, double* %3, i64 %71
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !18
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load33 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !18
  %76 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !18
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load35 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !18
  %80 = fadd <2 x double> %wide.load, %wide.load34
  %81 = fadd <2 x double> %wide.load33, %wide.load35
  %82 = add nuw nsw i64 %offset.idx, 1
  %83 = getelementptr inbounds double, double* %3, i64 %82
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load36 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !18
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !18
  %87 = fadd <2 x double> %80, %wide.load36
  %88 = fadd <2 x double> %81, %wide.load37
  %89 = fmul <2 x double> %87, <double 3.333300e-01, double 3.333300e-01>
  %90 = fmul <2 x double> %88, <double 3.333300e-01, double 3.333300e-01>
  %91 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %92 = bitcast double* %91 to <2 x double>*
  store <2 x double> %89, <2 x double>* %92, align 8, !alias.scope !21, !noalias !18
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x double>*
  store <2 x double> %90, <2 x double>* %94, align 8, !alias.scope !21, !noalias !18
  %index.next = add i64 %index, 4
  %95 = icmp eq i64 %index.next, %n.vec
  br i1 %95, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %.preheader._crit_edge.us, label %.preheader.us.preheader77

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %..preheader3_crit_edge.lr.ph, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %._crit_edge3

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %18, %._crit_edge ]
  %10 = srem i32 %storemerge1, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %9
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i64 %indvars.iv.next, %8
  br i1 %exitcond, label %._crit_edge3.loopexit, label %9

._crit_edge3.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
!17 = distinct !{!17, !7, !8}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !7, !8}
