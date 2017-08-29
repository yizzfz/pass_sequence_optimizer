; ModuleID = 'A.ll'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %8 = bitcast i8* %5 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  %10 = bitcast i8* %7 to [1100 x double]*
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1100 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
._crit_edge.preheader.us.preheader:
  store double 1.500000e+00, double* %3, align 8
  store double 1.200000e+00, double* %4, align 8
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv40 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next41, %._crit_edge._crit_edge.us ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv36 = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next37, %._crit_edge.us ]
  %8 = mul nuw nsw i64 %indvars.iv36, %indvars.iv40
  %9 = add nuw nsw i64 %8, 1
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 1000
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 1.000000e+03
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv36
  store double %13, double* %14, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next37, 1100
  br i1 %exitcond52, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next41, 1000
  br i1 %exitcond54, label %._crit_edge5.preheader.us.preheader, label %._crit_edge.preheader.us

._crit_edge5.preheader.us.preheader:              ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge5.us.preheader

._crit_edge5.us.preheader:                        ; preds = %._crit_edge5._crit_edge.us, %._crit_edge5.preheader.us.preheader
  %indvars.iv31 = phi i64 [ 0, %._crit_edge5.preheader.us.preheader ], [ %indvars.iv.next32, %._crit_edge5._crit_edge.us ]
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.preheader, %._crit_edge5.us
  %indvars.iv27 = phi i64 [ %indvars.iv.next28.1, %._crit_edge5.us ], [ 0, %._crit_edge5.us.preheader ]
  %indvars.iv.next28 = or i64 %indvars.iv27, 1
  %15 = mul nuw nsw i64 %indvars.iv.next28, %indvars.iv31
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 1200
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv31, i64 %indvars.iv27
  %indvars.iv.next28.1 = add nuw nsw i64 %indvars.iv27, 2
  %20 = mul nuw nsw i64 %indvars.iv.next28.1, %indvars.iv31
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 1200
  %23 = sitofp i32 %22 to double
  %24 = insertelement <2 x double> undef, double %18, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fdiv <2 x double> %25, <double 1.200000e+03, double 1.200000e+03>
  %27 = bitcast double* %19 to <2 x double>*
  store <2 x double> %26, <2 x double>* %27, align 8
  %exitcond48.1 = icmp eq i64 %indvars.iv.next28.1, 1200
  br i1 %exitcond48.1, label %._crit_edge5._crit_edge.us, label %._crit_edge5.us

._crit_edge5._crit_edge.us:                       ; preds = %._crit_edge5.us
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond50, label %._crit_edge7.preheader.us.preheader, label %._crit_edge5.us.preheader

._crit_edge7.preheader.us.preheader:              ; preds = %._crit_edge5._crit_edge.us
  br label %._crit_edge7.preheader.us

._crit_edge7.preheader.us:                        ; preds = %._crit_edge7._crit_edge.us, %._crit_edge7.preheader.us.preheader
  %indvars.iv22 = phi i64 [ 0, %._crit_edge7.preheader.us.preheader ], [ %indvars.iv.next23, %._crit_edge7._crit_edge.us ]
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us, %._crit_edge7.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge7.preheader.us ], [ %indvars.iv.next, %._crit_edge7.us ]
  %28 = add nuw nsw i64 %indvars.iv, 2
  %29 = mul nuw nsw i64 %28, %indvars.iv22
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 1100
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 1.100000e+03
  %34 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv22, i64 %indvars.iv
  store double %33, double* %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond46, label %._crit_edge7._crit_edge.us, label %._crit_edge7.us

._crit_edge7._crit_edge.us:                       ; preds = %._crit_edge7.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond, label %._crit_edge6._crit_edge, label %._crit_edge7.preheader.us

._crit_edge6._crit_edge:                          ; preds = %._crit_edge7._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly) unnamed_addr #2 {
._crit_edge.preheader.us.preheader:
  %8 = insertelement <2 x double> undef, double %4, i32 0
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  %10 = insertelement <2 x double> undef, double %4, i32 0
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert134 = insertelement <2 x double> undef, double %3, i32 0
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge3._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv32 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next33, %._crit_edge3._crit_edge.us ]
  br label %._crit_edge.us.preheader

._crit_edge.us.prol:                              ; No predecessors!
  unreachable

._crit_edge.us.preheader:                         ; preds = %._crit_edge.preheader.us
  br label %._crit_edge.us

._crit_edge3._crit_edge.us:                       ; preds = %._crit_edge4._crit_edge.us.us
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next33, 1000
  br i1 %exitcond54, label %._crit_edge10.loopexit, label %._crit_edge.preheader.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.1, %._crit_edge.us.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next.3.1, %._crit_edge.us.1 ]
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv
  %13 = bitcast double* %12 to <2 x double>*
  %14 = load <2 x double>, <2 x double>* %13, align 8
  %15 = fmul <2 x double> %14, %9
  store <2 x double> %15, <2 x double>* %13, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv.next.1
  %17 = bitcast double* %16 to <2 x double>*
  %18 = load <2 x double>, <2 x double>* %17, align 8
  %19 = fmul <2 x double> %18, %9
  store <2 x double> %19, <2 x double>* %17, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %exitcond50.3 = icmp eq i64 %indvars.iv.next.3, 1100
  br i1 %exitcond50.3, label %._crit_edge4.preheader.us.us.preheader, label %._crit_edge.us.1

._crit_edge4.preheader.us.us.preheader:           ; preds = %._crit_edge.us
  %20 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 0
  %scevgep105 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 1100
  br label %vector.memcheck123

._crit_edge4.us.us.preheader143:                  ; preds = %vector.memcheck123
  br label %._crit_edge4.us.us

vector.memcheck123:                               ; preds = %._crit_edge4._crit_edge.us.us, %._crit_edge4.preheader.us.us.preheader
  %indvars.iv28 = phi i64 [ 0, %._crit_edge4.preheader.us.us.preheader ], [ %indvars.iv.next29, %._crit_edge4._crit_edge.us.us ]
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv32, i64 %indvars.iv28
  %scevgep108 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv28, i64 0
  %scevgep111 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv28, i64 1100
  %bound0115 = icmp ult double* %20, %21
  %bound1116 = icmp ult double* %21, %scevgep105
  %found.conflict117 = and i1 %bound0115, %bound1116
  %bound0118 = icmp ult double* %20, %scevgep111
  %bound1119 = icmp ult double* %scevgep108, %scevgep105
  %found.conflict120 = and i1 %bound0118, %bound1119
  %conflict.rdx121 = or i1 %found.conflict117, %found.conflict120
  br i1 %conflict.rdx121, label %._crit_edge4.us.us.preheader143, label %vector.ph124

vector.ph124:                                     ; preds = %vector.memcheck123
  %.pre = load double, double* %21, align 8, !alias.scope !1
  %22 = insertelement <2 x double> undef, double %.pre, i32 0
  %23 = fmul <2 x double> %22, %broadcast.splatinsert134
  %24 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body92

vector.body92:                                    ; preds = %vector.body92, %vector.ph124
  %index125 = phi i64 [ 0, %vector.ph124 ], [ %index.next126, %vector.body92 ]
  %25 = shl i64 %index125, 1
  %26 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv28, i64 %25
  %27 = bitcast double* %26 to <4 x double>*
  %wide.vec136 = load <4 x double>, <4 x double>* %27, align 8, !alias.scope !4
  %strided.vec137 = shufflevector <4 x double> %wide.vec136, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec138 = shufflevector <4 x double> %wide.vec136, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %28 = fmul <2 x double> %24, %strided.vec137
  %29 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %25
  %30 = bitcast double* %29 to <4 x double>*
  %wide.vec139 = load <4 x double>, <4 x double>* %30, align 8, !alias.scope !6, !noalias !8
  %strided.vec140 = shufflevector <4 x double> %wide.vec139, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec141 = shufflevector <4 x double> %wide.vec139, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %31 = fadd <2 x double> %strided.vec140, %28
  %32 = or i64 %25, 1
  %33 = fmul <2 x double> %24, %strided.vec138
  %34 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %32
  %35 = fadd <2 x double> %strided.vec141, %33
  %36 = getelementptr double, double* %34, i64 -1
  %37 = bitcast double* %36 to <4 x double>*
  %interleaved.vec142 = shufflevector <2 x double> %31, <2 x double> %35, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec142, <4 x double>* %37, align 8, !alias.scope !6, !noalias !8
  %index.next126 = add i64 %index125, 2
  %38 = icmp eq i64 %index.next126, 550
  br i1 %38, label %middle.block93, label %vector.body92, !llvm.loop !9

middle.block93:                                   ; preds = %vector.body92
  br label %._crit_edge4._crit_edge.us.us

._crit_edge4._crit_edge.us.us.loopexit:           ; preds = %._crit_edge4.us.us
  br label %._crit_edge4._crit_edge.us.us

._crit_edge4._crit_edge.us.us:                    ; preds = %._crit_edge4._crit_edge.us.us.loopexit, %middle.block93
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next29, 1200
  br i1 %exitcond52, label %._crit_edge3._crit_edge.us, label %vector.memcheck123

._crit_edge4.us.us:                               ; preds = %._crit_edge4.us.us.preheader143, %._crit_edge4.us.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25.1, %._crit_edge4.us.us ], [ 0, %._crit_edge4.us.us.preheader143 ]
  %39 = load double, double* %21, align 8
  %40 = fmul double %39, %3
  %41 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv28, i64 %indvars.iv24
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv24
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %44, align 8
  %indvars.iv.next25 = or i64 %indvars.iv24, 1
  %47 = load double, double* %21, align 8
  %48 = fmul double %47, %3
  %49 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv28, i64 %indvars.iv.next25
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv.next25
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  store double %54, double* %52, align 8
  %indvars.iv.next25.1 = add nuw nsw i64 %indvars.iv24, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next25.1, 1100
  br i1 %exitcond.1, label %._crit_edge4._crit_edge.us.us.loopexit, label %._crit_edge4.us.us, !llvm.loop !12

._crit_edge.preheader:                            ; preds = %._crit_edge3._crit_edge
  br i1 undef, label %._crit_edge4.preheader.us.preheader, label %._crit_edge3._crit_edge

._crit_edge4.preheader.us.preheader:              ; preds = %._crit_edge.preheader
  br label %._crit_edge4.preheader.us

._crit_edge4.preheader.us:                        ; preds = %._crit_edge4._crit_edge.us, %._crit_edge4.preheader.us.preheader
  br i1 undef, label %._crit_edge4.us.preheader, label %._crit_edge4.us.prol

._crit_edge4.us.prol:                             ; preds = %._crit_edge4.preheader.us
  br label %._crit_edge4.us.preheader

._crit_edge4.us.preheader:                        ; preds = %._crit_edge4.us.prol, %._crit_edge4.preheader.us
  br i1 undef, label %._crit_edge4.us.preheader144, label %min.iters.checked

min.iters.checked:                                ; preds = %._crit_edge4.us.preheader
  br i1 undef, label %._crit_edge4.us.preheader144, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 undef, label %._crit_edge4.us.preheader144, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  br i1 undef, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  br i1 undef, label %._crit_edge4._crit_edge.us, label %._crit_edge4.us.preheader144

._crit_edge4.us.preheader144:                     ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge4.us.preheader
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us.preheader144, %._crit_edge4.us
  br i1 undef, label %._crit_edge4._crit_edge.us, label %._crit_edge4.us, !llvm.loop !14

._crit_edge4._crit_edge.us:                       ; preds = %._crit_edge4.us, %middle.block
  br i1 undef, label %._crit_edge3._crit_edge, label %._crit_edge4.preheader.us

._crit_edge3._crit_edge:                          ; preds = %._crit_edge4._crit_edge.us, %._crit_edge.preheader
  br i1 undef, label %._crit_edge10, label %._crit_edge.preheader

._crit_edge10.loopexit:                           ; preds = %._crit_edge3._crit_edge.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %._crit_edge3._crit_edge
  ret void

._crit_edge.us.1:                                 ; preds = %._crit_edge.us
  %55 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv.next.3
  %56 = bitcast double* %55 to <2 x double>*
  %57 = load <2 x double>, <2 x double>* %56, align 8
  %58 = fmul <2 x double> %57, %11
  store <2 x double> %58, <2 x double>* %56, align 8
  %indvars.iv.next.1.1 = or i64 %indvars.iv, 6
  %59 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv.next.1.1
  %60 = bitcast double* %59 to <2 x double>*
  %61 = load <2 x double>, <2 x double>* %60, align 8
  %62 = fmul <2 x double> %61, %11
  store <2 x double> %62, <2 x double>* %60, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  br label %._crit_edge.us
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge2.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge2.preheader.us

._crit_edge2.preheader.us:                        ; preds = %._crit_edge2._crit_edge.us, %._crit_edge2.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %._crit_edge2.preheader.us.preheader ], [ %indvars.iv.next8, %._crit_edge2._crit_edge.us ]
  %7 = mul nuw nsw i64 %indvars.iv7, 1000
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %._crit_edge2.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge2.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge.us

; <label>:12:                                     ; preds = %._crit_edge.us._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond13, label %._crit_edge2._crit_edge.us, label %._crit_edge.us._crit_edge

._crit_edge2._crit_edge.us:                       ; preds = %._crit_edge.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond, label %._crit_edge5, label %._crit_edge2.preheader.us

._crit_edge5:                                     ; preds = %._crit_edge2._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!2, !5}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = distinct !{!13, !10, !11}
!14 = distinct !{!14, !10, !11}
