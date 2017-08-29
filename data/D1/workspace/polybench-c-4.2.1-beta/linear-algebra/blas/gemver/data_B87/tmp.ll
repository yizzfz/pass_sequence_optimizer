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
  %5 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %8 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %9 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %10 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %11 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %12 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %13 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
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
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %43, %11
  %indvars.iv1 = phi i64 [ 0, %11 ], [ %indvars.iv.next2, %43 ]
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

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge4
  %indvars.iv = phi i64 [ 0, %._crit_edge4 ], [ %indvars.iv.next.1, %._crit_edge ]
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
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %43, label %._crit_edge

; <label>:43:                                     ; preds = %._crit_edge
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %44, label %._crit_edge4

; <label>:44:                                     ; preds = %43
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]*, double* readonly, double* readonly, double* readonly, double* readonly, double*, double*, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  %scevgep27 = getelementptr double, double* %4, i64 2000
  %scevgep29 = getelementptr double, double* %6, i64 2000
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %middle.block, %11
  %indvars.iv16 = phi i64 [ 0, %11 ], [ %indvars.iv.next17, %middle.block ]
  %scevgep = getelementptr [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 0
  %12 = add i64 %indvars.iv16, 1
  %scevgep25 = getelementptr [2000 x double], [2000 x double]* %2, i64 %12, i64 0
  %13 = getelementptr inbounds double, double* %3, i64 %indvars.iv16
  %14 = getelementptr inbounds double, double* %5, i64 %indvars.iv16
  %bound0 = icmp ult double* %scevgep, %13
  %bound1 = icmp ult double* %13, %scevgep25
  %found.conflict = and i1 %bound0, %bound1
  %bound032 = icmp ult double* %scevgep, %scevgep27
  %bound133 = icmp ugt double* %scevgep25, %4
  %found.conflict34 = and i1 %bound032, %bound133
  %conflict.rdx = or i1 %found.conflict, %found.conflict34
  %bound037 = icmp ult double* %scevgep, %14
  %bound138 = icmp ult double* %14, %scevgep25
  %found.conflict39 = and i1 %bound037, %bound138
  %conflict.rdx40 = or i1 %conflict.rdx, %found.conflict39
  %bound041 = icmp ult double* %scevgep, %scevgep29
  %bound142 = icmp ugt double* %scevgep25, %6
  %found.conflict43 = and i1 %bound041, %bound142
  %conflict.rdx44 = or i1 %conflict.rdx40, %found.conflict43
  br i1 %conflict.rdx44, label %._crit_edge.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge19
  br label %vector.body

._crit_edge.preheader:                            ; preds = %._crit_edge19
  br label %._crit_edge

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 1
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %offset.idx
  %16 = bitcast double* %15 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %16, align 8, !alias.scope !1, !noalias !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec45 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %17 = load double, double* %13, align 8, !alias.scope !9
  %18 = insertelement <2 x double> undef, double %17, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = getelementptr inbounds double, double* %4, i64 %offset.idx
  %21 = bitcast double* %20 to <4 x double>*
  %wide.vec46 = load <4 x double>, <4 x double>* %21, align 8, !alias.scope !10
  %strided.vec47 = shufflevector <4 x double> %wide.vec46, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec48 = shufflevector <4 x double> %wide.vec46, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %22 = fmul <2 x double> %19, %strided.vec47
  %23 = fadd <2 x double> %strided.vec, %22
  %24 = load double, double* %14, align 8, !alias.scope !11
  %25 = insertelement <2 x double> undef, double %24, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  %27 = getelementptr inbounds double, double* %6, i64 %offset.idx
  %28 = bitcast double* %27 to <4 x double>*
  %wide.vec49 = load <4 x double>, <4 x double>* %28, align 8, !alias.scope !12
  %strided.vec50 = shufflevector <4 x double> %wide.vec49, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec51 = shufflevector <4 x double> %wide.vec49, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %29 = fmul <2 x double> %26, %strided.vec50
  %30 = fadd <2 x double> %23, %29
  %31 = or i64 %offset.idx, 1
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %31
  %33 = load double, double* %13, align 8, !alias.scope !9
  %34 = insertelement <2 x double> undef, double %33, i32 0
  %35 = shufflevector <2 x double> %34, <2 x double> undef, <2 x i32> zeroinitializer
  %36 = fmul <2 x double> %35, %strided.vec48
  %37 = fadd <2 x double> %strided.vec45, %36
  %38 = load double, double* %14, align 8, !alias.scope !11
  %39 = insertelement <2 x double> undef, double %38, i32 0
  %40 = shufflevector <2 x double> %39, <2 x double> undef, <2 x i32> zeroinitializer
  %41 = fmul <2 x double> %40, %strided.vec51
  %42 = fadd <2 x double> %37, %41
  %43 = getelementptr double, double* %32, i64 -1
  %44 = bitcast double* %43 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %30, <2 x double> %42, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %44, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 2
  %45 = icmp eq i64 %index.next, 1000
  br i1 %45, label %middle.block.loopexit67, label %vector.body, !llvm.loop !13

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv13 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next14.1, %._crit_edge ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  %47 = load double, double* %46, align 8
  %48 = load double, double* %13, align 8
  %49 = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fadd double %47, %51
  %53 = load double, double* %14, align 8
  %54 = getelementptr inbounds double, double* %6, i64 %indvars.iv13
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %52, %56
  store double %57, double* %46, align 8
  %indvars.iv.next14 = or i64 %indvars.iv13, 1
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.next14
  %59 = load double, double* %58, align 8
  %60 = load double, double* %13, align 8
  %61 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next14
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %59, %63
  %65 = load double, double* %14, align 8
  %66 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next14
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %64, %68
  store double %69, double* %58, align 8
  %indvars.iv.next14.1 = add nuw nsw i64 %indvars.iv13, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next14.1, 2000
  br i1 %exitcond15.1, label %middle.block.loopexit, label %._crit_edge, !llvm.loop !16

middle.block.loopexit:                            ; preds = %._crit_edge
  br label %middle.block

middle.block.loopexit67:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit67, %middle.block.loopexit
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond18, label %.preheader2.preheader, label %._crit_edge19

.preheader2.preheader:                            ; preds = %middle.block
  br label %.preheader2

.preheader2:                                      ; preds = %86, %.preheader2.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader2.preheader ], [ %indvars.iv.next11, %86 ]
  %70 = getelementptr inbounds double, double* %8, i64 %indvars.iv10
  %.pre = load double, double* %70, align 8
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20, %.preheader2
  %71 = phi double [ %.pre, %.preheader2 ], [ %85, %._crit_edge20 ]
  %indvars.iv7 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next8.1, %._crit_edge20 ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv10
  %73 = load double, double* %72, align 8
  %74 = fmul double %73, %1
  %75 = getelementptr inbounds double, double* %9, i64 %indvars.iv7
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = fadd double %71, %77
  %sunkaddr = ptrtoint double* %8 to i64
  %sunkaddr60 = mul i64 %indvars.iv10, 8
  %sunkaddr61 = add i64 %sunkaddr, %sunkaddr60
  %sunkaddr62 = inttoptr i64 %sunkaddr61 to double*
  store double %78, double* %sunkaddr62, align 8
  %indvars.iv.next8 = or i64 %indvars.iv7, 1
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next8, i64 %indvars.iv10
  %80 = load double, double* %79, align 8
  %81 = fmul double %80, %1
  %82 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next8
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = fadd double %78, %84
  store double %85, double* %sunkaddr62, align 8
  %indvars.iv.next8.1 = add nuw nsw i64 %indvars.iv7, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8.1, 2000
  br i1 %exitcond9.1, label %86, label %._crit_edge20

; <label>:86:                                     ; preds = %._crit_edge20
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %.preheader1.preheader, label %.preheader2

.preheader1.preheader:                            ; preds = %86
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1, %.preheader1.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader1.preheader ], [ %indvars.iv.next5.4, %.preheader1 ]
  %87 = getelementptr inbounds double, double* %8, i64 %indvars.iv4
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds double, double* %10, i64 %indvars.iv4
  %90 = load double, double* %89, align 8
  %91 = fadd double %88, %90
  store double %91, double* %87, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %92 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5
  %93 = load double, double* %92, align 8
  %94 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5
  %95 = load double, double* %94, align 8
  %96 = fadd double %93, %95
  store double %96, double* %92, align 8
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv4, 2
  %97 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.1
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.1
  %100 = load double, double* %99, align 8
  %101 = fadd double %98, %100
  store double %101, double* %97, align 8
  %indvars.iv.next5.2 = add nuw nsw i64 %indvars.iv4, 3
  %102 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.2
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.2
  %105 = load double, double* %104, align 8
  %106 = fadd double %103, %105
  store double %106, double* %102, align 8
  %indvars.iv.next5.3 = add nuw nsw i64 %indvars.iv4, 4
  %107 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.3
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.3
  %110 = load double, double* %109, align 8
  %111 = fadd double %108, %110
  store double %111, double* %107, align 8
  %indvars.iv.next5.4 = add nuw nsw i64 %indvars.iv4, 5
  %exitcond6.4 = icmp eq i64 %indvars.iv.next5.4, 2000
  br i1 %exitcond6.4, label %.preheader.preheader, label %.preheader1

.preheader.preheader:                             ; preds = %.preheader1
  br label %.preheader

.preheader:                                       ; preds = %128, %.preheader.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next2, %128 ]
  %112 = getelementptr inbounds double, double* %7, i64 %indvars.iv1
  %.pre23 = load double, double* %112, align 8
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22, %.preheader
  %113 = phi double [ %.pre23, %.preheader ], [ %127, %._crit_edge22 ]
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge22 ]
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %115 = load double, double* %114, align 8
  %116 = fmul double %115, %0
  %117 = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %118 = load double, double* %117, align 8
  %119 = fmul double %116, %118
  %120 = fadd double %113, %119
  %sunkaddr63 = ptrtoint double* %7 to i64
  %sunkaddr64 = mul i64 %indvars.iv1, 8
  %sunkaddr65 = add i64 %sunkaddr63, %sunkaddr64
  %sunkaddr66 = inttoptr i64 %sunkaddr65 to double*
  store double %120, double* %sunkaddr66, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv.next
  %122 = load double, double* %121, align 8
  %123 = fmul double %122, %0
  %124 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %125 = load double, double* %124, align 8
  %126 = fmul double %123, %125
  %127 = fadd double %120, %126
  store double %127, double* %sunkaddr66, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %128, label %._crit_edge22

; <label>:128:                                    ; preds = %._crit_edge22
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %129, label %.preheader

; <label>:129:                                    ; preds = %128
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge._crit_edge
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge._crit_edge

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
