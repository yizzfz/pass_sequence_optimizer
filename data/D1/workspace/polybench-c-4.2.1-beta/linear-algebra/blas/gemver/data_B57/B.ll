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
  call void (...) @polybench_timer_start() #4
  %23 = load double, double* %3, align 8
  %24 = load double, double* %4, align 8
  call fastcc void @kernel_gemver(double %23, double %24, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %25 = icmp sgt i32 %0, 42
  br i1 %25, label %26, label %._crit_edge

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %._crit_edge

; <label>:29:                                     ; preds = %26
  %30 = bitcast i8* %10 to double*
  call fastcc void @print_array(double* %30)
  br label %._crit_edge

._crit_edge:                                      ; preds = %26, %2, %29
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  call void @free(i8* %10) #4
  call void @free(i8* %11) #4
  call void @free(i8* %12) #4
  call void @free(i8* %13) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.loopexit._crit_edge

.loopexit:                                        ; preds = %._crit_edge
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %43, label %.loopexit._crit_edge

.loopexit._crit_edge:                             ; preds = %.loopexit, %11
  %indvars.iv1 = phi i64 [ 0, %11 ], [ %indvars.iv.next2, %.loopexit ]
  %12 = trunc i64 %indvars.iv1 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv1
  store double %13, double* %14, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %15 = trunc i64 %indvars.iv.next2 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+03
  %18 = fmul double %17, 5.000000e-01
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv1
  store double %18, double* %19, align 8
  %20 = fmul double %17, 2.500000e-01
  %21 = getelementptr inbounds double, double* %4, i64 %indvars.iv1
  store double %20, double* %21, align 8
  %22 = fdiv double %17, 6.000000e+00
  %23 = getelementptr inbounds double, double* %6, i64 %indvars.iv1
  store double %22, double* %23, align 8
  %24 = fmul double %17, 1.250000e-01
  %25 = getelementptr inbounds double, double* %9, i64 %indvars.iv1
  store double %24, double* %25, align 8
  %26 = fdiv double %17, 9.000000e+00
  %27 = getelementptr inbounds double, double* %10, i64 %indvars.iv1
  store double %26, double* %27, align 8
  %28 = getelementptr inbounds double, double* %8, i64 %indvars.iv1
  store double 0.000000e+00, double* %28, align 8
  %29 = getelementptr inbounds double, double* %7, i64 %indvars.iv1
  store double 0.000000e+00, double* %29, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.loopexit._crit_edge
  %indvars.iv = phi i64 [ 0, %.loopexit._crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %30 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 2000
  %33 = sitofp i32 %32 to double
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %35 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 2000
  %38 = sitofp i32 %37 to double
  %39 = insertelement <2 x double> undef, double %33, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  %41 = fdiv <2 x double> %40, <double 2.000000e+03, double 2.000000e+03>
  %42 = bitcast double* %34 to <2 x double>*
  store <2 x double> %41, <2 x double>* %42, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %.loopexit, label %._crit_edge

; <label>:43:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]*, double*, double* readonly, double*, double* readonly, double*, double*, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  %scevgep40 = getelementptr double, double* %4, i64 2000
  %scevgep42 = getelementptr double, double* %6, i64 2000
  br label %.preheader5

.preheader5:                                      ; preds = %middle.block, %11
  %indvars.iv16 = phi i64 [ 0, %11 ], [ %14, %middle.block ]
  %12 = ptrtoint double* %3 to i64
  %13 = ptrtoint double* %5 to i64
  %scevgep = getelementptr [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 0
  %scevgep37 = bitcast double* %scevgep to i8*
  %14 = add i64 %indvars.iv16, 1
  %scevgep38 = getelementptr [2000 x double], [2000 x double]* %2, i64 %14, i64 0
  %scevgep3839 = bitcast double* %scevgep38 to i8*
  %sunkaddr19 = shl i64 %indvars.iv16, 3
  %sunkaddr20 = add i64 %12, %sunkaddr19
  %sunkaddr24 = add i64 %13, %sunkaddr19
  %bc = inttoptr i64 %sunkaddr20 to i8*
  %bound0 = icmp ult i8* %scevgep37, %bc
  %bound1 = icmp ult i8* %bc, %scevgep3839
  %found.conflict = and i1 %bound0, %bound1
  %bound045 = icmp ult double* %scevgep, %scevgep40
  %bound146 = icmp ugt double* %scevgep38, %4
  %found.conflict47 = and i1 %bound045, %bound146
  %conflict.rdx = or i1 %found.conflict, %found.conflict47
  %bc48 = inttoptr i64 %sunkaddr24 to i8*
  %bound050 = icmp ult i8* %scevgep37, %bc48
  %bound151 = icmp ult i8* %bc48, %scevgep3839
  %found.conflict52 = and i1 %bound050, %bound151
  %conflict.rdx53 = or i1 %conflict.rdx, %found.conflict52
  %bound054 = icmp ult double* %scevgep, %scevgep42
  %bound155 = icmp ugt double* %scevgep38, %6
  %found.conflict56 = and i1 %bound054, %bound155
  %conflict.rdx57 = or i1 %conflict.rdx53, %found.conflict56
  br i1 %conflict.rdx57, label %._crit_edge.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader5
  br label %vector.body

._crit_edge.preheader:                            ; preds = %.preheader5
  br label %._crit_edge

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %15 = inttoptr i64 %sunkaddr20 to double*
  %16 = inttoptr i64 %sunkaddr24 to double*
  %offset.idx = shl i64 %index, 1
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %offset.idx
  %18 = bitcast double* %17 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %18, align 8, !alias.scope !1, !noalias !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec58 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %19 = load double, double* %15, align 8, !alias.scope !9
  %20 = insertelement <2 x double> undef, double %19, i32 0
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  %22 = getelementptr inbounds double, double* %4, i64 %offset.idx
  %23 = bitcast double* %22 to <4 x double>*
  %wide.vec59 = load <4 x double>, <4 x double>* %23, align 8, !alias.scope !10
  %strided.vec60 = shufflevector <4 x double> %wide.vec59, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec61 = shufflevector <4 x double> %wide.vec59, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %24 = fmul <2 x double> %21, %strided.vec60
  %25 = fadd <2 x double> %strided.vec, %24
  %26 = load double, double* %16, align 8, !alias.scope !11
  %27 = insertelement <2 x double> undef, double %26, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  %29 = getelementptr inbounds double, double* %6, i64 %offset.idx
  %30 = bitcast double* %29 to <4 x double>*
  %wide.vec62 = load <4 x double>, <4 x double>* %30, align 8, !alias.scope !12
  %strided.vec63 = shufflevector <4 x double> %wide.vec62, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec64 = shufflevector <4 x double> %wide.vec62, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %31 = fmul <2 x double> %28, %strided.vec63
  %32 = fadd <2 x double> %25, %31
  %33 = or i64 %offset.idx, 1
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %33
  %35 = fmul <2 x double> %21, %strided.vec61
  %36 = fadd <2 x double> %strided.vec58, %35
  %37 = fmul <2 x double> %28, %strided.vec64
  %38 = fadd <2 x double> %36, %37
  %39 = getelementptr double, double* %34, i64 -1
  %40 = bitcast double* %39 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %32, <2 x double> %38, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %40, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 2
  %41 = icmp eq i64 %index.next, 1000
  br i1 %41, label %middle.block.loopexit81, label %vector.body, !llvm.loop !13

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv13 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next14.1, %._crit_edge ]
  %42 = inttoptr i64 %sunkaddr20 to double*
  %43 = inttoptr i64 %sunkaddr24 to double*
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  %45 = load double, double* %44, align 8
  %46 = load double, double* %42, align 8
  %47 = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fadd double %45, %49
  %51 = load double, double* %43, align 8
  %52 = getelementptr inbounds double, double* %6, i64 %indvars.iv13
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fadd double %50, %54
  store double %55, double* %44, align 8
  %indvars.iv.next14 = or i64 %indvars.iv13, 1
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.next14
  %57 = load double, double* %56, align 8
  %58 = load double, double* %42, align 8
  %59 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next14
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fadd double %57, %61
  %63 = load double, double* %43, align 8
  %64 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next14
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fadd double %62, %66
  store double %67, double* %56, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next14.1, 2000
  br i1 %exitcond15.1, label %middle.block.loopexit, label %._crit_edge, !llvm.loop !16

middle.block.loopexit:                            ; preds = %._crit_edge
  br label %middle.block

middle.block.loopexit81:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit81, %middle.block.loopexit
  %exitcond18 = icmp eq i64 %14, 2000
  br i1 %exitcond18, label %..preheader3_crit_edge, label %.preheader5

..preheader3_crit_edge:                           ; preds = %middle.block
  br label %.preheader3

.preheader3:                                      ; preds = %83, %..preheader3_crit_edge
  %indvars.iv10 = phi i64 [ 0, %..preheader3_crit_edge ], [ %indvars.iv.next11, %83 ]
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34, %.preheader3
  %indvars.iv7 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next8.1, %._crit_edge34 ]
  %sunkaddr = ptrtoint double* %8 to i64
  %sunkaddr74 = mul i64 %indvars.iv10, 8
  %sunkaddr75 = add i64 %sunkaddr, %sunkaddr74
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to double*
  %68 = load double, double* %sunkaddr76, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv10
  %70 = load double, double* %69, align 8
  %71 = fmul double %70, %1
  %72 = getelementptr inbounds double, double* %9, i64 %indvars.iv7
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %68, %74
  store double %75, double* %sunkaddr76, align 8
  %indvars.iv.next8 = or i64 %indvars.iv7, 1
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next8, i64 %indvars.iv10
  %77 = load double, double* %76, align 8
  %78 = fmul double %77, %1
  %79 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next8
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %75, %81
  store double %82, double* %sunkaddr76, align 8
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv7, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8.1, 2000
  br i1 %exitcond9.1, label %83, label %._crit_edge34

; <label>:83:                                     ; preds = %._crit_edge34
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %.preheader2.preheader, label %.preheader3

.preheader2.preheader:                            ; preds = %83
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2, %.preheader2.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader2.preheader ], [ %indvars.iv.next5.4, %.preheader2 ]
  %84 = getelementptr inbounds double, double* %8, i64 %indvars.iv4
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds double, double* %10, i64 %indvars.iv4
  %87 = load double, double* %86, align 8
  %88 = fadd double %85, %87
  store double %88, double* %84, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %89 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5
  %90 = load double, double* %89, align 8
  %91 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5
  %92 = load double, double* %91, align 8
  %93 = fadd double %90, %92
  store double %93, double* %89, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv4, 2
  %94 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.1
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.1
  %97 = load double, double* %96, align 8
  %98 = fadd double %95, %97
  store double %98, double* %94, align 8
  %indvars.iv.next5.2 = add nsw i64 %indvars.iv4, 3
  %99 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.2
  %100 = load double, double* %99, align 8
  %101 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.2
  %102 = load double, double* %101, align 8
  %103 = fadd double %100, %102
  store double %103, double* %99, align 8
  %indvars.iv.next5.3 = add nsw i64 %indvars.iv4, 4
  %104 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.3
  %105 = load double, double* %104, align 8
  %106 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.3
  %107 = load double, double* %106, align 8
  %108 = fadd double %105, %107
  store double %108, double* %104, align 8
  %indvars.iv.next5.4 = add nsw i64 %indvars.iv4, 5
  %exitcond6.4 = icmp eq i64 %indvars.iv.next5.4, 2000
  br i1 %exitcond6.4, label %.preheader2..preheader_crit_edge, label %.preheader2

.preheader2..preheader_crit_edge:                 ; preds = %.preheader2
  br label %.preheader

.preheader:                                       ; preds = %124, %.preheader2..preheader_crit_edge
  %indvars.iv1 = phi i64 [ 0, %.preheader2..preheader_crit_edge ], [ %indvars.iv.next2, %124 ]
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge35 ]
  %sunkaddr77 = ptrtoint double* %7 to i64
  %sunkaddr78 = mul i64 %indvars.iv1, 8
  %sunkaddr79 = add i64 %sunkaddr77, %sunkaddr78
  %sunkaddr80 = inttoptr i64 %sunkaddr79 to double*
  %109 = load double, double* %sunkaddr80, align 8
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %111 = load double, double* %110, align 8
  %112 = fmul double %111, %0
  %113 = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %114 = load double, double* %113, align 8
  %115 = fmul double %112, %114
  %116 = fadd double %109, %115
  store double %116, double* %sunkaddr80, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv.next
  %118 = load double, double* %117, align 8
  %119 = fmul double %118, %0
  %120 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %121 = load double, double* %120, align 8
  %122 = fmul double %119, %121
  %123 = fadd double %116, %122
  store double %123, double* %sunkaddr80, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %124, label %._crit_edge35

; <label>:124:                                    ; preds = %._crit_edge35
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %125, label %.preheader

; <label>:125:                                    ; preds = %124
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge1
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge1

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
!4 = !{!5, !6, !7, !8}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !3}
!7 = distinct !{!7, !3}
!8 = distinct !{!8, !3}
!9 = !{!5}
!10 = !{!6}
!11 = !{!7}
!12 = !{!8}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}
