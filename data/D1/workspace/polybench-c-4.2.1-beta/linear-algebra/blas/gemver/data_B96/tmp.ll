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
  %25 = bitcast i8* %5 to [2000 x double]*
  %26 = bitcast i8* %6 to double*
  %27 = bitcast i8* %7 to double*
  %28 = bitcast i8* %8 to double*
  %29 = bitcast i8* %9 to double*
  %30 = bitcast i8* %10 to double*
  %31 = bitcast i8* %11 to double*
  %32 = bitcast i8* %12 to double*
  %33 = bitcast i8* %13 to double*
  call fastcc void @kernel_gemver(double %23, double %24, [2000 x double]* %25, double* %26, double* %27, double* %28, double* %29, double* %30, double* %31, double* %32, double* %33)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %34 = icmp sgt i32 %0, 42
  br i1 %34, label %35, label %._crit_edge

; <label>:35:                                     ; preds = %2
  %36 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %36, align 1
  %37 = icmp eq i8 %strcmpload, 0
  br i1 %37, label %38, label %._crit_edge

; <label>:38:                                     ; preds = %35
  %39 = bitcast i8* %10 to double*
  call fastcc void @print_array(double* %39)
  br label %._crit_edge

._crit_edge:                                      ; preds = %35, %2, %38
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

._crit_edge4:                                     ; preds = %58, %11
  %indvars.iv1 = phi i64 [ 0, %11 ], [ %indvars.iv.next2, %58 ]
  %12 = trunc i64 %indvars.iv1 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv1
  store double %13, double* %14, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %15 = trunc i64 %indvars.iv.next2 to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %5, i64 %indvars.iv1
  %18 = trunc i64 %indvars.iv.next2 to i32
  %19 = sitofp i32 %18 to double
  %20 = insertelement <2 x double> undef, double %16, i32 0
  %21 = insertelement <2 x double> %20, double %19, i32 1
  %22 = fdiv <2 x double> %21, <double 2.000000e+03, double 2.000000e+03>
  %23 = fmul <2 x double> %22, <double 5.000000e-01, double 2.500000e-01>
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  store double %24, double* %17, align 8
  %26 = getelementptr inbounds double, double* %4, i64 %indvars.iv1
  store double %25, double* %26, align 8
  %27 = trunc i64 %indvars.iv.next2 to i32
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %6, i64 %indvars.iv1
  %30 = trunc i64 %indvars.iv.next2 to i32
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 2.000000e+03
  %33 = fmul double %32, 1.250000e-01
  %34 = getelementptr inbounds double, double* %9, i64 %indvars.iv1
  store double %33, double* %34, align 8
  %35 = trunc i64 %indvars.iv.next2 to i32
  %36 = sitofp i32 %35 to double
  %37 = insertelement <2 x double> undef, double %28, i32 0
  %38 = insertelement <2 x double> %37, double %36, i32 1
  %39 = fdiv <2 x double> %38, <double 2.000000e+03, double 2.000000e+03>
  %40 = fdiv <2 x double> %39, <double 6.000000e+00, double 9.000000e+00>
  %41 = extractelement <2 x double> %40, i32 0
  %42 = extractelement <2 x double> %40, i32 1
  store double %41, double* %29, align 8
  %43 = getelementptr inbounds double, double* %10, i64 %indvars.iv1
  store double %42, double* %43, align 8
  %44 = getelementptr inbounds double, double* %8, i64 %indvars.iv1
  store double 0.000000e+00, double* %44, align 8
  %45 = getelementptr inbounds double, double* %7, i64 %indvars.iv1
  store double 0.000000e+00, double* %45, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge4
  %indvars.iv = phi i64 [ 0, %._crit_edge4 ], [ %indvars.iv.next.1, %._crit_edge ]
  %46 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, 2000
  %49 = sitofp i32 %48 to double
  %50 = fdiv double %49, 2.000000e+03
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  store double %50, double* %51, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %52 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %53 = trunc i64 %52 to i32
  %54 = srem i32 %53, 2000
  %55 = sitofp i32 %54 to double
  %56 = fdiv double %55, 2.000000e+03
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv.next
  store double %56, double* %57, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %58, label %._crit_edge

; <label>:58:                                     ; preds = %._crit_edge
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %59, label %._crit_edge4

; <label>:59:                                     ; preds = %58
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]* nocapture, double*, double* nocapture readonly, double*, double* nocapture readonly, double*, double*, double* nocapture readonly, double* readonly) unnamed_addr #2 {
  br label %.preheader67

.preheader67:                                     ; preds = %25, %11
  %indvars.iv16 = phi i64 [ 0, %11 ], [ %indvars.iv.next17, %25 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader67
  %indvars.iv13 = phi i64 [ 0, %.preheader67 ], [ %indvars.iv.next14, %._crit_edge ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  %13 = load double, double* %12, align 8
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr53 = mul i64 %indvars.iv16, 8
  %sunkaddr54 = add i64 %sunkaddr, %sunkaddr53
  %sunkaddr55 = inttoptr i64 %sunkaddr54 to double*
  %14 = load double, double* %sunkaddr55, align 8
  %15 = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %13, %17
  %sunkaddr56 = ptrtoint double* %5 to i64
  %sunkaddr57 = mul i64 %indvars.iv16, 8
  %sunkaddr58 = add i64 %sunkaddr56, %sunkaddr57
  %sunkaddr59 = inttoptr i64 %sunkaddr58 to double*
  %19 = load double, double* %sunkaddr59, align 8
  %20 = getelementptr inbounds double, double* %6, i64 %indvars.iv13
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %18, %22
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  store double %23, double* %24, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 2000
  br i1 %exitcond15, label %25, label %._crit_edge

; <label>:25:                                     ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond18, label %.preheader65.preheader, label %.preheader67

.preheader65.preheader:                           ; preds = %25
  br label %.preheader65

.preheader65:                                     ; preds = %42, %.preheader65.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader65.preheader ], [ %indvars.iv.next11, %42 ]
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19, %.preheader65
  %indvars.iv7 = phi i64 [ 0, %.preheader65 ], [ %indvars.iv.next8.1, %._crit_edge19 ]
  %sunkaddr60 = ptrtoint double* %8 to i64
  %sunkaddr61 = mul i64 %indvars.iv10, 8
  %sunkaddr62 = add i64 %sunkaddr60, %sunkaddr61
  %sunkaddr63 = inttoptr i64 %sunkaddr62 to double*
  %26 = load double, double* %sunkaddr63, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv10
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %1
  %30 = getelementptr inbounds double, double* %9, i64 %indvars.iv7
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fadd double %26, %32
  %sunkaddr64 = ptrtoint double* %8 to i64
  %sunkaddr65 = mul i64 %indvars.iv10, 8
  %sunkaddr66 = add i64 %sunkaddr64, %sunkaddr65
  %sunkaddr67 = inttoptr i64 %sunkaddr66 to double*
  store double %33, double* %sunkaddr67, align 8
  %indvars.iv.next8 = or i64 %indvars.iv7, 1
  %sunkaddr68 = ptrtoint double* %8 to i64
  %sunkaddr69 = mul i64 %indvars.iv10, 8
  %sunkaddr70 = add i64 %sunkaddr68, %sunkaddr69
  %sunkaddr71 = inttoptr i64 %sunkaddr70 to double*
  %34 = load double, double* %sunkaddr71, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next8, i64 %indvars.iv10
  %36 = load double, double* %35, align 8
  %37 = fmul double %36, %1
  %38 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next8
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fadd double %34, %40
  %sunkaddr72 = ptrtoint double* %8 to i64
  %sunkaddr73 = mul i64 %indvars.iv10, 8
  %sunkaddr74 = add i64 %sunkaddr72, %sunkaddr73
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to double*
  store double %41, double* %sunkaddr75, align 8
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv7, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8.1, 2000
  br i1 %exitcond9.1, label %42, label %._crit_edge19

; <label>:42:                                     ; preds = %._crit_edge19
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %vector.memcheck, label %.preheader65

vector.memcheck:                                  ; preds = %42
  %scevgep = getelementptr double, double* %8, i64 2000
  %scevgep46 = getelementptr double, double* %10, i64 2000
  %bound0 = icmp ugt double* %scevgep46, %8
  %bound1 = icmp ugt double* %scevgep, %10
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.preheader64.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

.preheader64.preheader:                           ; preds = %vector.memcheck
  br label %.preheader64

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %43 = getelementptr inbounds double, double* %8, i64 %index
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !1, !noalias !4
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !1, !noalias !4
  %47 = getelementptr inbounds double, double* %10, i64 %index
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !4
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !4
  %51 = fadd <2 x double> %wide.load, %wide.load50
  %52 = fadd <2 x double> %wide.load49, %wide.load51
  %53 = bitcast double* %43 to <2 x double>*
  store <2 x double> %51, <2 x double>* %53, align 8, !alias.scope !1, !noalias !4
  %54 = bitcast double* %45 to <2 x double>*
  store <2 x double> %52, <2 x double>* %54, align 8, !alias.scope !1, !noalias !4
  %index.next = or i64 %index, 4
  %55 = getelementptr inbounds double, double* %8, i64 %index.next
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !1, !noalias !4
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load49.1 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !1, !noalias !4
  %59 = getelementptr inbounds double, double* %10, i64 %index.next
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load50.1 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !4
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load51.1 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !4
  %63 = fadd <2 x double> %wide.load.1, %wide.load50.1
  %64 = fadd <2 x double> %wide.load49.1, %wide.load51.1
  %65 = bitcast double* %55 to <2 x double>*
  store <2 x double> %63, <2 x double>* %65, align 8, !alias.scope !1, !noalias !4
  %66 = bitcast double* %57 to <2 x double>*
  store <2 x double> %64, <2 x double>* %66, align 8, !alias.scope !1, !noalias !4
  %index.next.1 = add nsw i64 %index, 8
  %67 = icmp eq i64 %index.next.1, 2000
  br i1 %67, label %.preheader.preheader.loopexit92, label %vector.body, !llvm.loop !6

.preheader64:                                     ; preds = %.preheader64, %.preheader64.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader64.preheader ], [ %indvars.iv.next5.4, %.preheader64 ]
  %68 = getelementptr inbounds double, double* %8, i64 %indvars.iv4
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds double, double* %10, i64 %indvars.iv4
  %71 = load double, double* %70, align 8
  %72 = fadd double %69, %71
  %73 = getelementptr inbounds double, double* %8, i64 %indvars.iv4
  store double %72, double* %73, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %74 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5
  %77 = load double, double* %76, align 8
  %78 = fadd double %75, %77
  %79 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5
  store double %78, double* %79, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv4, 2
  %80 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.1
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.1
  %83 = load double, double* %82, align 8
  %84 = fadd double %81, %83
  %85 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.1
  store double %84, double* %85, align 8
  %indvars.iv.next5.2 = add nsw i64 %indvars.iv4, 3
  %86 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.2
  %87 = load double, double* %86, align 8
  %88 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.2
  %89 = load double, double* %88, align 8
  %90 = fadd double %87, %89
  %91 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.2
  store double %90, double* %91, align 8
  %indvars.iv.next5.3 = add nsw i64 %indvars.iv4, 4
  %92 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.3
  %93 = load double, double* %92, align 8
  %94 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.3
  %95 = load double, double* %94, align 8
  %96 = fadd double %93, %95
  %97 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.3
  store double %96, double* %97, align 8
  %indvars.iv.next5.4 = add nsw i64 %indvars.iv4, 5
  %exitcond6.4 = icmp eq i64 %indvars.iv.next5.4, 2000
  br i1 %exitcond6.4, label %.preheader.preheader.loopexit, label %.preheader64, !llvm.loop !9

.preheader.preheader.loopexit:                    ; preds = %.preheader64
  br label %.preheader.preheader

.preheader.preheader.loopexit92:                  ; preds = %vector.body
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit92, %.preheader.preheader.loopexit
  br label %.preheader

.preheader:                                       ; preds = %114, %.preheader.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next2, %114 ]
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge20 ]
  %sunkaddr76 = ptrtoint double* %7 to i64
  %sunkaddr77 = mul i64 %indvars.iv1, 8
  %sunkaddr78 = add i64 %sunkaddr76, %sunkaddr77
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to double*
  %98 = load double, double* %sunkaddr79, align 8
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %100 = load double, double* %99, align 8
  %101 = fmul double %100, %0
  %102 = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %103 = load double, double* %102, align 8
  %104 = fmul double %101, %103
  %105 = fadd double %98, %104
  %sunkaddr80 = ptrtoint double* %7 to i64
  %sunkaddr81 = mul i64 %indvars.iv1, 8
  %sunkaddr82 = add i64 %sunkaddr80, %sunkaddr81
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to double*
  store double %105, double* %sunkaddr83, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %sunkaddr84 = ptrtoint double* %7 to i64
  %sunkaddr85 = mul i64 %indvars.iv1, 8
  %sunkaddr86 = add i64 %sunkaddr84, %sunkaddr85
  %sunkaddr87 = inttoptr i64 %sunkaddr86 to double*
  %106 = load double, double* %sunkaddr87, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv.next
  %108 = load double, double* %107, align 8
  %109 = fmul double %108, %0
  %110 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %111 = load double, double* %110, align 8
  %112 = fmul double %109, %111
  %113 = fadd double %106, %112
  %sunkaddr88 = ptrtoint double* %7 to i64
  %sunkaddr89 = mul i64 %indvars.iv1, 8
  %sunkaddr90 = add i64 %sunkaddr88, %sunkaddr89
  %sunkaddr91 = inttoptr i64 %sunkaddr90 to double*
  store double %113, double* %sunkaddr91, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %114, label %._crit_edge20

; <label>:114:                                    ; preds = %._crit_edge20
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %115, label %.preheader

; <label>:115:                                    ; preds = %114
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
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge1
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge1

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
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
