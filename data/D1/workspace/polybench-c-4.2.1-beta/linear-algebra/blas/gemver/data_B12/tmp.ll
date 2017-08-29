; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %10 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %11 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %12 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %13 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %14 = bitcast i8* %5 to [2000 x double]*
  %15 = bitcast i8* %6 to double*
  %16 = bitcast i8* %7 to double*
  %17 = bitcast i8* %8 to double*
  %18 = bitcast i8* %9 to double*
  %19 = bitcast i8* %10 to double*
  %20 = bitcast i8* %11 to double*
  %21 = bitcast i8* %12 to double*
  %22 = bitcast i8* %13 to double*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  tail call void (...) @polybench_timer_start() #4
  %23 = load double, double* %3, align 8
  %24 = load double, double* %4, align 8
  tail call fastcc void @kernel_gemver(double %23, double %24, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %25 = icmp sgt i32 %0, 42
  br i1 %25, label %26, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %.._crit_edge_crit_edge33

.._crit_edge_crit_edge33:                         ; preds = %26
  br label %._crit_edge

; <label>:29:                                     ; preds = %26
  tail call fastcc void @print_array(double* %19)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge33, %.._crit_edge_crit_edge, %29
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  tail call void @free(i8* %10) #4
  tail call void @free(i8* %11) #4
  tail call void @free(i8* %12) #4
  tail call void @free(i8* %13) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph35.split.us.preheader:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.lr.ph35.split.us

.lr.ph35.split.us:                                ; preds = %..loopexit_crit_edge.us..lr.ph35.split.us_crit_edge, %.lr.ph35.split.us.preheader
  %indvars.iv1 = phi i64 [ 0, %.lr.ph35.split.us.preheader ], [ %indvars.iv.next2, %..loopexit_crit_edge.us..lr.ph35.split.us_crit_edge ]
  %11 = trunc i64 %indvars.iv1 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %3, i64 %indvars.iv1
  store double %12, double* %13, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %14 = trunc i64 %indvars.iv.next2 to i32
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 2.000000e+03
  %17 = fmul double %16, 5.000000e-01
  %18 = getelementptr inbounds double, double* %5, i64 %indvars.iv1
  store double %17, double* %18, align 8
  %19 = fmul double %16, 2.500000e-01
  %20 = getelementptr inbounds double, double* %4, i64 %indvars.iv1
  store double %19, double* %20, align 8
  %21 = fdiv double %16, 6.000000e+00
  %22 = getelementptr inbounds double, double* %6, i64 %indvars.iv1
  store double %21, double* %22, align 8
  %23 = fmul double %16, 1.250000e-01
  %24 = getelementptr inbounds double, double* %9, i64 %indvars.iv1
  store double %23, double* %24, align 8
  %25 = fdiv double %16, 9.000000e+00
  %26 = getelementptr inbounds double, double* %10, i64 %indvars.iv1
  store double %25, double* %26, align 8
  %27 = getelementptr inbounds double, double* %8, i64 %indvars.iv1
  store double 0.000000e+00, double* %27, align 8
  %28 = getelementptr inbounds double, double* %7, i64 %indvars.iv1
  store double 0.000000e+00, double* %28, align 8
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.._crit_edge4_crit_edge, %.lr.ph35.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph35.split.us ], [ %indvars.iv.next.1, %._crit_edge4.._crit_edge4_crit_edge ]
  %29 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2000
  %32 = sitofp i32 %31 to double
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %34 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 2000
  %37 = sitofp i32 %36 to double
  %38 = insertelement <2 x double> undef, double %32, i32 0
  %39 = insertelement <2 x double> %38, double %37, i32 1
  %40 = fdiv <2 x double> %39, <double 2.000000e+03, double 2.000000e+03>
  %41 = bitcast double* %33 to <2 x double>*
  store <2 x double> %40, <2 x double>* %41, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %..loopexit_crit_edge.us, label %._crit_edge4.._crit_edge4_crit_edge

._crit_edge4.._crit_edge4_crit_edge:              ; preds = %._crit_edge4
  br label %._crit_edge4

..loopexit_crit_edge.us:                          ; preds = %._crit_edge4
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %._crit_edge, label %..loopexit_crit_edge.us..lr.ph35.split.us_crit_edge

..loopexit_crit_edge.us..lr.ph35.split.us_crit_edge: ; preds = %..loopexit_crit_edge.us
  br label %.lr.ph35.split.us

._crit_edge:                                      ; preds = %..loopexit_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
.preheader60.us.preheader:
  %scevgep25 = getelementptr double, double* %4, i64 2000
  %scevgep27 = getelementptr double, double* %6, i64 2000
  br label %.preheader60.us

.preheader60.us:                                  ; preds = %._crit_edge72.us..preheader60.us_crit_edge, %.preheader60.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader60.us.preheader ], [ %indvars.iv.next17, %._crit_edge72.us..preheader60.us_crit_edge ]
  %scevgep = getelementptr [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 0
  %11 = add i64 %indvars.iv16, 1
  %scevgep23 = getelementptr [2000 x double], [2000 x double]* %2, i64 %11, i64 0
  %12 = getelementptr inbounds double, double* %3, i64 %indvars.iv16
  %13 = getelementptr inbounds double, double* %5, i64 %indvars.iv16
  %bound0 = icmp ult double* %scevgep, %12
  %bound1 = icmp ult double* %12, %scevgep23
  %found.conflict = and i1 %bound0, %bound1
  %bound030 = icmp ult double* %scevgep, %scevgep25
  %bound131 = icmp ugt double* %scevgep23, %4
  %found.conflict32 = and i1 %bound030, %bound131
  %conflict.rdx = or i1 %found.conflict, %found.conflict32
  %bound035 = icmp ult double* %scevgep, %13
  %bound136 = icmp ult double* %13, %scevgep23
  %found.conflict37 = and i1 %bound035, %bound136
  %conflict.rdx38 = or i1 %conflict.rdx, %found.conflict37
  %bound039 = icmp ult double* %scevgep, %scevgep27
  %bound140 = icmp ugt double* %scevgep23, %6
  %found.conflict41 = and i1 %bound039, %bound140
  %conflict.rdx42 = or i1 %conflict.rdx38, %found.conflict41
  br i1 %conflict.rdx42, label %._crit_edge.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader60.us
  %14 = load double, double* %12, align 8, !alias.scope !1
  %15 = insertelement <2 x double> undef, double %14, i32 0
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  %17 = load double, double* %13, align 8, !alias.scope !4
  %18 = insertelement <2 x double> undef, double %17, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = load double, double* %12, align 8, !alias.scope !1
  %21 = insertelement <2 x double> undef, double %20, i32 0
  %22 = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  %23 = load double, double* %13, align 8, !alias.scope !4
  %24 = insertelement <2 x double> undef, double %23, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

._crit_edge.preheader:                            ; preds = %.preheader60.us
  br label %._crit_edge

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 1
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %offset.idx
  %27 = bitcast double* %26 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %27, align 8, !alias.scope !6, !noalias !8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec43 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %28 = getelementptr inbounds double, double* %4, i64 %offset.idx
  %29 = bitcast double* %28 to <4 x double>*
  %wide.vec44 = load <4 x double>, <4 x double>* %29, align 8, !alias.scope !11
  %strided.vec45 = shufflevector <4 x double> %wide.vec44, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec46 = shufflevector <4 x double> %wide.vec44, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %30 = fmul <2 x double> %16, %strided.vec45
  %31 = fadd <2 x double> %strided.vec, %30
  %32 = getelementptr inbounds double, double* %6, i64 %offset.idx
  %33 = bitcast double* %32 to <4 x double>*
  %wide.vec47 = load <4 x double>, <4 x double>* %33, align 8, !alias.scope !12
  %strided.vec48 = shufflevector <4 x double> %wide.vec47, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec49 = shufflevector <4 x double> %wide.vec47, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %34 = fmul <2 x double> %19, %strided.vec48
  %35 = fadd <2 x double> %31, %34
  %36 = or i64 %offset.idx, 1
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %36
  %38 = fmul <2 x double> %22, %strided.vec46
  %39 = fadd <2 x double> %strided.vec43, %38
  %40 = fmul <2 x double> %25, %strided.vec49
  %41 = fadd <2 x double> %39, %40
  %42 = getelementptr double, double* %37, i64 -1
  %43 = bitcast double* %42 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %35, <2 x double> %41, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %43, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %44 = icmp eq i64 %index.next, 1000
  br i1 %44, label %._crit_edge72.us.loopexit50, label %vector.body.vector.body_crit_edge, !llvm.loop !13

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %._crit_edge.preheader
  %indvars.iv13 = phi i64 [ %indvars.iv.next14.1, %._crit_edge.._crit_edge_crit_edge ], [ 0, %._crit_edge.preheader ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  %46 = load double, double* %45, align 8
  %47 = load double, double* %12, align 8
  %48 = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %46, %50
  %52 = load double, double* %13, align 8
  %53 = getelementptr inbounds double, double* %6, i64 %indvars.iv13
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %51, %55
  store double %56, double* %45, align 8
  %indvars.iv.next14 = or i64 %indvars.iv13, 1
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.next14
  %58 = load double, double* %57, align 8
  %59 = load double, double* %12, align 8
  %60 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next14
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %58, %62
  %64 = load double, double* %13, align 8
  %65 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next14
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fadd double %63, %67
  store double %68, double* %57, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next14.1, 2000
  br i1 %exitcond15.1, label %._crit_edge72.us.loopexit, label %._crit_edge.._crit_edge_crit_edge, !llvm.loop !16

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge72.us.loopexit:                        ; preds = %._crit_edge
  br label %._crit_edge72.us

._crit_edge72.us.loopexit50:                      ; preds = %vector.body
  br label %._crit_edge72.us

._crit_edge72.us:                                 ; preds = %._crit_edge72.us.loopexit50, %._crit_edge72.us.loopexit
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond18, label %.preheader58.us.preheader, label %._crit_edge72.us..preheader60.us_crit_edge

._crit_edge72.us..preheader60.us_crit_edge:       ; preds = %._crit_edge72.us
  br label %.preheader60.us

.preheader58.us.preheader:                        ; preds = %._crit_edge72.us
  br label %.preheader58.us

.preheader58.us:                                  ; preds = %._crit_edge68.us..preheader58.us_crit_edge, %.preheader58.us.preheader
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge68.us..preheader58.us_crit_edge ], [ 0, %.preheader58.us.preheader ]
  %69 = getelementptr inbounds double, double* %8, i64 %indvars.iv10
  %.pre = load double, double* %69, align 8
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.._crit_edge19_crit_edge, %.preheader58.us
  %70 = phi double [ %.pre, %.preheader58.us ], [ %84, %._crit_edge19.._crit_edge19_crit_edge ]
  %indvars.iv7 = phi i64 [ 0, %.preheader58.us ], [ %indvars.iv.next8.1, %._crit_edge19.._crit_edge19_crit_edge ]
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv10
  %72 = load double, double* %71, align 8
  %73 = fmul double %72, %1
  %74 = getelementptr inbounds double, double* %9, i64 %indvars.iv7
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fadd double %70, %76
  store double %77, double* %69, align 8
  %indvars.iv.next8 = or i64 %indvars.iv7, 1
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next8, i64 %indvars.iv10
  %79 = load double, double* %78, align 8
  %80 = fmul double %79, %1
  %81 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next8
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = fadd double %77, %83
  store double %84, double* %69, align 8
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv7, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8.1, 2000
  br i1 %exitcond9.1, label %._crit_edge68.us, label %._crit_edge19.._crit_edge19_crit_edge

._crit_edge19.._crit_edge19_crit_edge:            ; preds = %._crit_edge19
  br label %._crit_edge19

._crit_edge68.us:                                 ; preds = %._crit_edge19
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %.lr.ph65.preheader, label %._crit_edge68.us..preheader58.us_crit_edge

._crit_edge68.us..preheader58.us_crit_edge:       ; preds = %._crit_edge68.us
  br label %.preheader58.us

.lr.ph65.preheader:                               ; preds = %._crit_edge68.us
  br label %.lr.ph65

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %85 = getelementptr inbounds double, double* %7, i64 %indvars.iv1
  %.pre21 = load double, double* %85, align 8
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.._crit_edge20_crit_edge, %.preheader.us
  %86 = phi double [ %.pre21, %.preheader.us ], [ %100, %._crit_edge20.._crit_edge20_crit_edge ]
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %._crit_edge20.._crit_edge20_crit_edge ]
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %88 = load double, double* %87, align 8
  %89 = fmul double %88, %0
  %90 = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %91 = load double, double* %90, align 8
  %92 = fmul double %89, %91
  %93 = fadd double %86, %92
  store double %93, double* %85, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv.next
  %95 = load double, double* %94, align 8
  %96 = fmul double %95, %0
  %97 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %98 = load double, double* %97, align 8
  %99 = fmul double %96, %98
  %100 = fadd double %93, %99
  store double %100, double* %85, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge20.._crit_edge20_crit_edge

._crit_edge20.._crit_edge20_crit_edge:            ; preds = %._crit_edge20
  br label %._crit_edge20

._crit_edge.us:                                   ; preds = %._crit_edge20
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %._crit_edge63, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

.lr.ph65:                                         ; preds = %.lr.ph65..lr.ph65_crit_edge, %.lr.ph65.preheader
  %indvars.iv4 = phi i64 [ %indvars.iv.next5.4, %.lr.ph65..lr.ph65_crit_edge ], [ 0, %.lr.ph65.preheader ]
  %101 = getelementptr inbounds double, double* %8, i64 %indvars.iv4
  %102 = load double, double* %101, align 8
  %103 = getelementptr inbounds double, double* %10, i64 %indvars.iv4
  %104 = load double, double* %103, align 8
  %105 = fadd double %102, %104
  store double %105, double* %101, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %106 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5
  %109 = load double, double* %108, align 8
  %110 = fadd double %107, %109
  store double %110, double* %106, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv4, 2
  %111 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.1
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.1
  %114 = load double, double* %113, align 8
  %115 = fadd double %112, %114
  store double %115, double* %111, align 8
  %indvars.iv.next5.2 = add nsw i64 %indvars.iv4, 3
  %116 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.2
  %117 = load double, double* %116, align 8
  %118 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.2
  %119 = load double, double* %118, align 8
  %120 = fadd double %117, %119
  store double %120, double* %116, align 8
  %indvars.iv.next5.3 = add nsw i64 %indvars.iv4, 4
  %121 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.3
  %122 = load double, double* %121, align 8
  %123 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.3
  %124 = load double, double* %123, align 8
  %125 = fadd double %122, %124
  store double %125, double* %121, align 8
  %indvars.iv.next5.4 = add nsw i64 %indvars.iv4, 5
  %exitcond6.4 = icmp eq i64 %indvars.iv.next5.4, 2000
  br i1 %exitcond6.4, label %.preheader.us.preheader, label %.lr.ph65..lr.ph65_crit_edge

.lr.ph65..lr.ph65_crit_edge:                      ; preds = %.lr.ph65
  br label %.lr.ph65

.preheader.us.preheader:                          ; preds = %.lr.ph65
  br label %.preheader.us

._crit_edge63:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge..lr.ph_crit_edge ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %.lr.ph..lr.ph._crit_edge_crit_edge

.lr.ph..lr.ph._crit_edge_crit_edge:               ; preds = %.lr.ph
  br label %.lr.ph._crit_edge

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph..lr.ph._crit_edge_crit_edge, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph._crit_edge..lr.ph_crit_edge

.lr.ph._crit_edge..lr.ph_crit_edge:               ; preds = %.lr.ph._crit_edge
  br label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!2, !9, !5, !10}
!9 = distinct !{!9, !3}
!10 = distinct !{!10, !3}
!11 = !{!9}
!12 = !{!10}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}
