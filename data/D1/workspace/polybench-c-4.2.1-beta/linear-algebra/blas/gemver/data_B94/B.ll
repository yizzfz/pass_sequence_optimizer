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

.loopexit:                                        ; preds = %30
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
  br label %30

; <label>:30:                                     ; preds = %30, %.loopexit._crit_edge
  %indvars.iv = phi i64 [ 0, %.loopexit._crit_edge ], [ %indvars.iv.next.1, %30 ]
  %31 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 2000
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, 2.000000e+03
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  store double %35, double* %36, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %37 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 2000
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, 2.000000e+03
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv.next
  store double %41, double* %42, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.loopexit, label %30

; <label>:43:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  %scevgep24 = getelementptr double, double* %4, i64 2000
  %scevgep26 = getelementptr double, double* %6, i64 2000
  br label %.preheader5

.preheader5:                                      ; preds = %middle.block, %11
  %indvars.iv14 = phi i64 [ 0, %11 ], [ %indvars.iv.next15, %middle.block ]
  %scevgep = getelementptr [2000 x double], [2000 x double]* %2, i64 %indvars.iv14, i64 0
  %12 = add i64 %indvars.iv14, 1
  %scevgep22 = getelementptr [2000 x double], [2000 x double]* %2, i64 %12, i64 0
  %13 = getelementptr inbounds double, double* %3, i64 %indvars.iv14
  %14 = getelementptr inbounds double, double* %5, i64 %indvars.iv14
  %bound0 = icmp ult double* %scevgep, %13
  %bound1 = icmp ult double* %13, %scevgep22
  %found.conflict = and i1 %bound0, %bound1
  %bound029 = icmp ult double* %scevgep, %scevgep24
  %bound130 = icmp ugt double* %scevgep22, %4
  %found.conflict31 = and i1 %bound029, %bound130
  %conflict.rdx = or i1 %found.conflict, %found.conflict31
  %bound034 = icmp ult double* %scevgep, %14
  %bound135 = icmp ult double* %14, %scevgep22
  %found.conflict36 = and i1 %bound034, %bound135
  %conflict.rdx37 = or i1 %conflict.rdx, %found.conflict36
  %bound038 = icmp ult double* %scevgep, %scevgep26
  %bound139 = icmp ugt double* %scevgep22, %6
  %found.conflict40 = and i1 %bound038, %bound139
  %conflict.rdx41 = or i1 %conflict.rdx37, %found.conflict40
  br i1 %conflict.rdx41, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader5
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader5
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv14, i64 %index
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1, !noalias !4
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1, !noalias !4
  %19 = load double, double* %13, align 8, !alias.scope !9
  %20 = insertelement <2 x double> undef, double %19, i32 0
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  %22 = insertelement <2 x double> undef, double %19, i32 0
  %23 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> zeroinitializer
  %24 = getelementptr inbounds double, double* %4, i64 %index
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !10
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !10
  %28 = fmul <2 x double> %21, %wide.load44
  %29 = fmul <2 x double> %23, %wide.load45
  %30 = fadd <2 x double> %wide.load, %28
  %31 = fadd <2 x double> %wide.load43, %29
  %32 = load double, double* %14, align 8, !alias.scope !11
  %33 = insertelement <2 x double> undef, double %32, i32 0
  %34 = shufflevector <2 x double> %33, <2 x double> undef, <2 x i32> zeroinitializer
  %35 = insertelement <2 x double> undef, double %32, i32 0
  %36 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> zeroinitializer
  %37 = getelementptr inbounds double, double* %6, i64 %index
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !12
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !12
  %41 = fmul <2 x double> %34, %wide.load46
  %42 = fmul <2 x double> %36, %wide.load47
  %43 = fadd <2 x double> %30, %41
  %44 = fadd <2 x double> %31, %42
  %45 = bitcast double* %15 to <2 x double>*
  store <2 x double> %43, <2 x double>* %45, align 8, !alias.scope !1, !noalias !4
  %46 = bitcast double* %17 to <2 x double>*
  store <2 x double> %44, <2 x double>* %46, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 4
  %47 = icmp eq i64 %index.next, 2000
  br i1 %47, label %middle.block.loopexit101, label %vector.body, !llvm.loop !13

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv11 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next12.1, %scalar.ph ]
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv11
  %49 = load double, double* %48, align 8
  %50 = load double, double* %13, align 8
  %51 = getelementptr inbounds double, double* %4, i64 %indvars.iv11
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fadd double %49, %53
  %55 = load double, double* %14, align 8
  %56 = getelementptr inbounds double, double* %6, i64 %indvars.iv11
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fadd double %54, %58
  store double %59, double* %48, align 8
  %indvars.iv.next12 = or i64 %indvars.iv11, 1
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv.next12
  %61 = load double, double* %60, align 8
  %62 = load double, double* %13, align 8
  %63 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next12
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %61, %65
  %67 = load double, double* %14, align 8
  %68 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %66, %70
  store double %71, double* %60, align 8
  %exitcond13.1 = icmp eq i64 %indvars.iv.next12, 1999
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv11, 2
  br i1 %exitcond13.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !16

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit101:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit101, %middle.block.loopexit
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next15, 2000
  br i1 %exitcond19, label %.preheader3.preheader, label %.preheader5

.preheader3.preheader:                            ; preds = %middle.block
  br label %.preheader3

.preheader3:                                      ; preds = %89, %.preheader3.preheader
  %indvars.iv9 = phi i64 [ 0, %.preheader3.preheader ], [ %indvars.iv.next10, %89 ]
  %72 = getelementptr inbounds double, double* %8, i64 %indvars.iv9
  %.pre = load double, double* %72, align 8
  br label %73

; <label>:73:                                     ; preds = %73, %.preheader3
  %74 = phi double [ %.pre, %.preheader3 ], [ %88, %73 ]
  %indvars.iv6 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next7.1, %73 ]
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv9
  %76 = load double, double* %75, align 8
  %77 = fmul double %76, %1
  %78 = getelementptr inbounds double, double* %9, i64 %indvars.iv6
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fadd double %74, %80
  %sunkaddr = ptrtoint double* %8 to i64
  %sunkaddr85 = mul i64 %indvars.iv9, 8
  %sunkaddr86 = add i64 %sunkaddr, %sunkaddr85
  %sunkaddr87 = inttoptr i64 %sunkaddr86 to double*
  store double %81, double* %sunkaddr87, align 8
  %indvars.iv.next7 = or i64 %indvars.iv6, 1
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next7, i64 %indvars.iv9
  %83 = load double, double* %82, align 8
  %84 = fmul double %83, %1
  %85 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next7
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %81, %87
  %sunkaddr88 = ptrtoint double* %8 to i64
  %sunkaddr89 = mul i64 %indvars.iv9, 8
  %sunkaddr90 = add i64 %sunkaddr88, %sunkaddr89
  %sunkaddr91 = inttoptr i64 %sunkaddr90 to double*
  store double %88, double* %sunkaddr91, align 8
  %exitcond8.1 = icmp eq i64 %indvars.iv.next7, 1999
  %indvars.iv.next7.1 = add nsw i64 %indvars.iv6, 2
  br i1 %exitcond8.1, label %89, label %73

; <label>:89:                                     ; preds = %73
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond18, label %vector.memcheck61, label %.preheader3

vector.memcheck61:                                ; preds = %89
  %scevgep53 = getelementptr double, double* %8, i64 2000
  %scevgep55 = getelementptr double, double* %10, i64 2000
  %bound057 = icmp ugt double* %scevgep55, %8
  %bound158 = icmp ugt double* %scevgep53, %10
  %memcheck.conflict60 = and i1 %bound057, %bound158
  br i1 %memcheck.conflict60, label %.preheader2.preheader, label %vector.body48.preheader

vector.body48.preheader:                          ; preds = %vector.memcheck61
  br label %vector.body48

.preheader2.preheader:                            ; preds = %vector.memcheck61
  br label %.preheader2

vector.body48:                                    ; preds = %vector.body48, %vector.body48.preheader
  %index63 = phi i64 [ 0, %vector.body48.preheader ], [ %index.next64.1, %vector.body48 ]
  %90 = getelementptr inbounds double, double* %8, i64 %index63
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !17, !noalias !20
  %92 = getelementptr double, double* %90, i64 2
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !17, !noalias !20
  %94 = getelementptr inbounds double, double* %10, i64 %index63
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %95, align 8, !alias.scope !20
  %96 = getelementptr double, double* %94, i64 2
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !20
  %98 = fadd <2 x double> %wide.load71, %wide.load73
  %99 = fadd <2 x double> %wide.load72, %wide.load74
  %100 = bitcast double* %90 to <2 x double>*
  store <2 x double> %98, <2 x double>* %100, align 8, !alias.scope !17, !noalias !20
  %101 = bitcast double* %92 to <2 x double>*
  store <2 x double> %99, <2 x double>* %101, align 8, !alias.scope !17, !noalias !20
  %index.next64 = or i64 %index63, 4
  %102 = getelementptr inbounds double, double* %8, i64 %index.next64
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load71.1 = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !17, !noalias !20
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load72.1 = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !17, !noalias !20
  %106 = getelementptr inbounds double, double* %10, i64 %index.next64
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load73.1 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !20
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load74.1 = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !20
  %110 = fadd <2 x double> %wide.load71.1, %wide.load73.1
  %111 = fadd <2 x double> %wide.load72.1, %wide.load74.1
  %112 = bitcast double* %102 to <2 x double>*
  store <2 x double> %110, <2 x double>* %112, align 8, !alias.scope !17, !noalias !20
  %113 = bitcast double* %104 to <2 x double>*
  store <2 x double> %111, <2 x double>* %113, align 8, !alias.scope !17, !noalias !20
  %index.next64.1 = add nsw i64 %index63, 8
  %114 = icmp eq i64 %index.next64.1, 2000
  br i1 %114, label %.preheader.preheader.loopexit100, label %vector.body48, !llvm.loop !22

.preheader2:                                      ; preds = %.preheader2, %.preheader2.preheader
  %indvars.iv3 = phi i64 [ 0, %.preheader2.preheader ], [ %indvars.iv.next4.4, %.preheader2 ]
  %115 = getelementptr inbounds double, double* %8, i64 %indvars.iv3
  %116 = load double, double* %115, align 8
  %117 = getelementptr inbounds double, double* %10, i64 %indvars.iv3
  %118 = load double, double* %117, align 8
  %119 = fadd double %116, %118
  store double %119, double* %115, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %120 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next4
  %121 = load double, double* %120, align 8
  %122 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next4
  %123 = load double, double* %122, align 8
  %124 = fadd double %121, %123
  store double %124, double* %120, align 8
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv3, 2
  %125 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next4.1
  %126 = load double, double* %125, align 8
  %127 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next4.1
  %128 = load double, double* %127, align 8
  %129 = fadd double %126, %128
  store double %129, double* %125, align 8
  %indvars.iv.next4.2 = add nsw i64 %indvars.iv3, 3
  %130 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next4.2
  %131 = load double, double* %130, align 8
  %132 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next4.2
  %133 = load double, double* %132, align 8
  %134 = fadd double %131, %133
  store double %134, double* %130, align 8
  %indvars.iv.next4.3 = add nsw i64 %indvars.iv3, 4
  %135 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next4.3
  %136 = load double, double* %135, align 8
  %137 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next4.3
  %138 = load double, double* %137, align 8
  %139 = fadd double %136, %138
  store double %139, double* %135, align 8
  %exitcond5.4 = icmp eq i64 %indvars.iv.next4.3, 1999
  %indvars.iv.next4.4 = add nsw i64 %indvars.iv3, 5
  br i1 %exitcond5.4, label %.preheader.preheader.loopexit, label %.preheader2, !llvm.loop !23

.preheader.preheader.loopexit:                    ; preds = %.preheader2
  br label %.preheader.preheader

.preheader.preheader.loopexit100:                 ; preds = %vector.body48
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit100, %.preheader.preheader.loopexit
  br label %.preheader

.preheader:                                       ; preds = %157, %.preheader.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next2, %157 ]
  %140 = getelementptr inbounds double, double* %7, i64 %indvars.iv1
  %.pre20 = load double, double* %140, align 8
  br label %141

; <label>:141:                                    ; preds = %141, %.preheader
  %142 = phi double [ %.pre20, %.preheader ], [ %156, %141 ]
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %141 ]
  %143 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %144 = load double, double* %143, align 8
  %145 = fmul double %144, %0
  %146 = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %147 = load double, double* %146, align 8
  %148 = fmul double %145, %147
  %149 = fadd double %142, %148
  %sunkaddr92 = ptrtoint double* %7 to i64
  %sunkaddr93 = mul i64 %indvars.iv1, 8
  %sunkaddr94 = add i64 %sunkaddr92, %sunkaddr93
  %sunkaddr95 = inttoptr i64 %sunkaddr94 to double*
  store double %149, double* %sunkaddr95, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %150 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv.next
  %151 = load double, double* %150, align 8
  %152 = fmul double %151, %0
  %153 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %154 = load double, double* %153, align 8
  %155 = fmul double %152, %154
  %156 = fadd double %149, %155
  %sunkaddr96 = ptrtoint double* %7 to i64
  %sunkaddr97 = mul i64 %indvars.iv1, 8
  %sunkaddr98 = add i64 %sunkaddr96, %sunkaddr97
  %sunkaddr99 = inttoptr i64 %sunkaddr98 to double*
  store double %156, double* %sunkaddr99, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %157, label %141

; <label>:157:                                    ; preds = %141
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond17, label %158, label %.preheader

; <label>:158:                                    ; preds = %157
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
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge._crit_edge
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge._crit_edge

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
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !14, !15}
!23 = distinct !{!23, !14, !15}
