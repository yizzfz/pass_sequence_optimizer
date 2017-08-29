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
  br i1 %25, label %26, label %31

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %26
  %30 = bitcast i8* %10 to double*
  call fastcc void @print_array(double* %30)
  br label %31

; <label>:31:                                     ; preds = %26, %2, %29
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
  br label %12

.loopexit:                                        ; preds = %36
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %50, label %12

; <label>:12:                                     ; preds = %.loopexit, %11
  %indvars.iv1 = phi i64 [ 0, %11 ], [ %indvars.iv.next2, %.loopexit ]
  %13 = trunc i64 %indvars.iv1 to i32
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %3, i64 %indvars.iv1
  store double %14, double* %15, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %16 = trunc i64 %indvars.iv.next2 to i32
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds double, double* %5, i64 %indvars.iv1
  %19 = insertelement <2 x double> undef, double %17, i32 0
  %20 = fdiv <2 x double> %19, <double 2.000000e+03, double undef>
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  %22 = fdiv <2 x double> %21, <double 2.000000e+00, double 4.000000e+00>
  %23 = extractelement <2 x double> %22, i32 0
  %24 = extractelement <2 x double> %22, i32 1
  store double %23, double* %18, align 8
  %25 = getelementptr inbounds double, double* %4, i64 %indvars.iv1
  store double %24, double* %25, align 8
  %26 = getelementptr inbounds double, double* %6, i64 %indvars.iv1
  %27 = fdiv <2 x double> %21, <double 6.000000e+00, double 8.000000e+00>
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  store double %28, double* %26, align 8
  %30 = getelementptr inbounds double, double* %9, i64 %indvars.iv1
  store double %29, double* %30, align 8
  %31 = fdiv double %17, 2.000000e+03
  %32 = fdiv double %31, 9.000000e+00
  %33 = getelementptr inbounds double, double* %10, i64 %indvars.iv1
  store double %32, double* %33, align 8
  %34 = getelementptr inbounds double, double* %8, i64 %indvars.iv1
  store double 0.000000e+00, double* %34, align 8
  %35 = getelementptr inbounds double, double* %7, i64 %indvars.iv1
  store double 0.000000e+00, double* %35, align 8
  br label %36

; <label>:36:                                     ; preds = %36, %12
  %indvars.iv = phi i64 [ 0, %12 ], [ %indvars.iv.next.1, %36 ]
  %37 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 2000
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %42 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, 2000
  %45 = sitofp i32 %44 to double
  %46 = insertelement <2 x double> undef, double %40, i32 0
  %47 = insertelement <2 x double> %46, double %45, i32 1
  %48 = fdiv <2 x double> %47, <double 2.000000e+03, double 2.000000e+03>
  %49 = bitcast double* %41 to <2 x double>*
  store <2 x double> %48, <2 x double>* %49, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %.loopexit, label %36

; <label>:50:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]*, double*, double* readonly, double*, double* readonly, double*, double*, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  %scevgep40 = getelementptr double, double* %4, i64 2000
  %scevgep42 = getelementptr double, double* %6, i64 2000
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %middle.block, %11
  %indvars.iv16 = phi i64 [ 0, %11 ], [ %indvars.iv.next17, %middle.block ]
  %12 = ptrtoint double* %3 to i64
  %13 = ptrtoint double* %5 to i64
  %scevgep = getelementptr [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 0
  %14 = add i64 %indvars.iv16, 1
  %scevgep38 = getelementptr [2000 x double], [2000 x double]* %2, i64 %14, i64 0
  %sunkaddr22 = shl i64 %indvars.iv16, 3
  %sunkaddr23 = add i64 %12, %sunkaddr22
  %sunkaddr26 = shl i64 %indvars.iv16, 3
  %sunkaddr27 = add i64 %13, %sunkaddr26
  %15 = bitcast double* %scevgep38 to i8*
  %16 = bitcast double* %scevgep to i8*
  %bc = inttoptr i64 %sunkaddr23 to i8*
  %bc44 = inttoptr i64 %sunkaddr23 to i8*
  %bound0 = icmp ult i8* %16, %bc44
  %bound1 = icmp ult i8* %bc, %15
  %found.conflict = and i1 %bound0, %bound1
  %bound045 = icmp ult double* %scevgep, %scevgep40
  %bound146 = icmp ugt double* %scevgep38, %4
  %found.conflict47 = and i1 %bound045, %bound146
  %conflict.rdx = or i1 %found.conflict, %found.conflict47
  %bc48 = inttoptr i64 %sunkaddr27 to i8*
  %bc49 = inttoptr i64 %sunkaddr27 to i8*
  %bound050 = icmp ult i8* %16, %bc49
  %bound151 = icmp ult i8* %bc48, %15
  %found.conflict52 = and i1 %bound050, %bound151
  %conflict.rdx53 = or i1 %conflict.rdx, %found.conflict52
  %bound054 = icmp ult double* %scevgep, %scevgep42
  %bound155 = icmp ugt double* %scevgep38, %6
  %found.conflict56 = and i1 %bound054, %bound155
  %conflict.rdx57 = or i1 %conflict.rdx53, %found.conflict56
  br i1 %conflict.rdx57, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

scalar.ph.preheader:                              ; preds = %vector.memcheck
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %17 = inttoptr i64 %sunkaddr23 to double*
  %18 = inttoptr i64 %sunkaddr27 to double*
  %offset.idx = shl i64 %index, 1
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %offset.idx
  %20 = bitcast double* %19 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %20, align 8, !alias.scope !1, !noalias !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec58 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %21 = load double, double* %17, align 8, !alias.scope !9
  %22 = insertelement <2 x double> undef, double %21, i32 0
  %23 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> zeroinitializer
  %24 = getelementptr inbounds double, double* %4, i64 %offset.idx
  %25 = bitcast double* %24 to <4 x double>*
  %wide.vec59 = load <4 x double>, <4 x double>* %25, align 8, !alias.scope !10
  %strided.vec60 = shufflevector <4 x double> %wide.vec59, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec61 = shufflevector <4 x double> %wide.vec59, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %26 = fmul <2 x double> %23, %strided.vec60
  %27 = fadd <2 x double> %strided.vec, %26
  %28 = load double, double* %18, align 8, !alias.scope !11
  %29 = insertelement <2 x double> undef, double %28, i32 0
  %30 = shufflevector <2 x double> %29, <2 x double> undef, <2 x i32> zeroinitializer
  %31 = getelementptr inbounds double, double* %6, i64 %offset.idx
  %32 = bitcast double* %31 to <4 x double>*
  %wide.vec62 = load <4 x double>, <4 x double>* %32, align 8, !alias.scope !12
  %strided.vec63 = shufflevector <4 x double> %wide.vec62, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec64 = shufflevector <4 x double> %wide.vec62, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %33 = fmul <2 x double> %30, %strided.vec63
  %34 = fadd <2 x double> %27, %33
  %35 = or i64 %offset.idx, 1
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %35
  %37 = load double, double* %17, align 8, !alias.scope !9
  %38 = insertelement <2 x double> undef, double %37, i32 0
  %39 = shufflevector <2 x double> %38, <2 x double> undef, <2 x i32> zeroinitializer
  %40 = fmul <2 x double> %39, %strided.vec61
  %41 = fadd <2 x double> %strided.vec58, %40
  %42 = load double, double* %18, align 8, !alias.scope !11
  %43 = insertelement <2 x double> undef, double %42, i32 0
  %44 = shufflevector <2 x double> %43, <2 x double> undef, <2 x i32> zeroinitializer
  %45 = fmul <2 x double> %44, %strided.vec64
  %46 = fadd <2 x double> %41, %45
  %47 = getelementptr double, double* %36, i64 -1
  %48 = bitcast double* %47 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %34, <2 x double> %46, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %48, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 2
  %49 = icmp eq i64 %index.next, 1000
  br i1 %49, label %middle.block.loopexit81, label %vector.body, !llvm.loop !13

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv13 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next14.1, %scalar.ph ]
  %50 = inttoptr i64 %sunkaddr23 to double*
  %51 = inttoptr i64 %sunkaddr27 to double*
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  %53 = load double, double* %52, align 8
  %54 = load double, double* %50, align 8
  %55 = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fadd double %53, %57
  %59 = load double, double* %51, align 8
  %60 = getelementptr inbounds double, double* %6, i64 %indvars.iv13
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %58, %62
  store double %63, double* %52, align 8
  %indvars.iv.next14 = or i64 %indvars.iv13, 1
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.next14
  %65 = load double, double* %64, align 8
  %66 = load double, double* %50, align 8
  %67 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next14
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fadd double %65, %69
  %71 = load double, double* %51, align 8
  %72 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next14
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %70, %74
  store double %75, double* %64, align 8
  %indvars.iv.next14.1 = add nuw nsw i64 %indvars.iv13, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next14.1, 2000
  br i1 %exitcond15.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !16

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit81:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit81, %middle.block.loopexit
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond18, label %.preheader3.preheader, label %vector.memcheck

.preheader3.preheader:                            ; preds = %middle.block
  br label %.preheader3

.preheader3:                                      ; preds = %92, %.preheader3.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader3.preheader ], [ %indvars.iv.next11, %92 ]
  br label %76

; <label>:76:                                     ; preds = %76, %.preheader3
  %indvars.iv7 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next8.1, %76 ]
  %sunkaddr = ptrtoint double* %8 to i64
  %sunkaddr74 = mul i64 %indvars.iv10, 8
  %sunkaddr75 = add i64 %sunkaddr, %sunkaddr74
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to double*
  %77 = load double, double* %sunkaddr76, align 8
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv10
  %79 = load double, double* %78, align 8
  %80 = fmul double %79, %1
  %81 = getelementptr inbounds double, double* %9, i64 %indvars.iv7
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = fadd double %77, %83
  store double %84, double* %sunkaddr76, align 8
  %indvars.iv.next8 = or i64 %indvars.iv7, 1
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next8, i64 %indvars.iv10
  %86 = load double, double* %85, align 8
  %87 = fmul double %86, %1
  %88 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next8
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = fadd double %84, %90
  store double %91, double* %sunkaddr76, align 8
  %indvars.iv.next8.1 = add nuw nsw i64 %indvars.iv7, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8.1, 2000
  br i1 %exitcond9.1, label %92, label %76

; <label>:92:                                     ; preds = %76
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %.preheader2.preheader, label %.preheader3

.preheader2.preheader:                            ; preds = %92
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2, %.preheader2.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader2.preheader ], [ %indvars.iv.next5.4, %.preheader2 ]
  %93 = getelementptr inbounds double, double* %8, i64 %indvars.iv4
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds double, double* %10, i64 %indvars.iv4
  %96 = load double, double* %95, align 8
  %97 = fadd double %94, %96
  store double %97, double* %93, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %98 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5
  %99 = load double, double* %98, align 8
  %100 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5
  %101 = load double, double* %100, align 8
  %102 = fadd double %99, %101
  store double %102, double* %98, align 8
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv4, 2
  %103 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.1
  %104 = load double, double* %103, align 8
  %105 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.1
  %106 = load double, double* %105, align 8
  %107 = fadd double %104, %106
  store double %107, double* %103, align 8
  %indvars.iv.next5.2 = add nuw nsw i64 %indvars.iv4, 3
  %108 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.2
  %109 = load double, double* %108, align 8
  %110 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.2
  %111 = load double, double* %110, align 8
  %112 = fadd double %109, %111
  store double %112, double* %108, align 8
  %indvars.iv.next5.3 = add nuw nsw i64 %indvars.iv4, 4
  %113 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.3
  %114 = load double, double* %113, align 8
  %115 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.3
  %116 = load double, double* %115, align 8
  %117 = fadd double %114, %116
  store double %117, double* %113, align 8
  %indvars.iv.next5.4 = add nuw nsw i64 %indvars.iv4, 5
  %exitcond6.4 = icmp eq i64 %indvars.iv.next5.4, 2000
  br i1 %exitcond6.4, label %.preheader.preheader, label %.preheader2

.preheader.preheader:                             ; preds = %.preheader2
  br label %.preheader

.preheader:                                       ; preds = %134, %.preheader.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next2, %134 ]
  br label %118

; <label>:118:                                    ; preds = %118, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %118 ]
  %sunkaddr77 = ptrtoint double* %7 to i64
  %sunkaddr78 = mul i64 %indvars.iv1, 8
  %sunkaddr79 = add i64 %sunkaddr77, %sunkaddr78
  %sunkaddr80 = inttoptr i64 %sunkaddr79 to double*
  %119 = load double, double* %sunkaddr80, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %121 = load double, double* %120, align 8
  %122 = fmul double %121, %0
  %123 = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %124 = load double, double* %123, align 8
  %125 = fmul double %122, %124
  %126 = fadd double %119, %125
  store double %126, double* %sunkaddr80, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv.next
  %128 = load double, double* %127, align 8
  %129 = fmul double %128, %0
  %130 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %131 = load double, double* %130, align 8
  %132 = fmul double %129, %131
  %133 = fadd double %126, %132
  store double %133, double* %sunkaddr80, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %134, label %118

; <label>:134:                                    ; preds = %118
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %135, label %.preheader

; <label>:135:                                    ; preds = %134
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
  br label %6

; <label>:6:                                      ; preds = %12, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %12 ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %12

; <label>:12:                                     ; preds = %6, %10
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %17, label %6

; <label>:17:                                     ; preds = %12
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
