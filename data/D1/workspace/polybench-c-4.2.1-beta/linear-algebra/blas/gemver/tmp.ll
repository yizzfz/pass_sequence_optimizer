; ModuleID = 'B.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
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
  call void @init_array(i32 2000, double* nonnull %3, double* nonnull %4, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  call void (...) @polybench_timer_start() #4
  %23 = load double, double* %3, align 8
  %24 = load double, double* %4, align 8
  %25 = bitcast i8* %13 to double*
  call void @kernel_gemver(i32 2000, double %23, double %24, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %25)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %26 = icmp sgt i32 %0, 42
  br i1 %26, label %27, label %._crit_edge

; <label>:27:                                     ; preds = %2
  %28 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %28, align 1
  %29 = icmp eq i8 %strcmpload, 0
  br i1 %29, label %30, label %._crit_edge

; <label>:30:                                     ; preds = %27
  %31 = bitcast i8* %10 to double*
  call void @print_array(i32 2000, double* %31)
  br label %._crit_edge

._crit_edge:                                      ; preds = %30, %27, %2
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

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, double*, double*, [2000 x double]*, double*, double*, double*, double*, double*, double*, double*, double*) #2 {
.lr.ph5..lr.ph5.split.us_crit_edge:
  store double 1.500000e+00, double* %1, align 8
  store double 1.200000e+00, double* %2, align 8
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %.loopexit.us, %.lr.ph5..lr.ph5.split.us_crit_edge
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %.loopexit.us ], [ 0, %.lr.ph5..lr.ph5.split.us_crit_edge ]
  %12 = trunc i64 %indvars.iv19 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %4, i64 %indvars.iv19
  store double %13, double* %14, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %15 = trunc i64 %indvars.iv.next20 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+03
  %18 = fmul double %17, 5.000000e-01
  %19 = getelementptr inbounds double, double* %6, i64 %indvars.iv19
  store double %18, double* %19, align 8
  %20 = fmul double %17, 2.500000e-01
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv19
  store double %20, double* %21, align 8
  %22 = fdiv double %17, 6.000000e+00
  %23 = getelementptr inbounds double, double* %7, i64 %indvars.iv19
  store double %22, double* %23, align 8
  %24 = fmul double %17, 1.250000e-01
  %25 = getelementptr inbounds double, double* %10, i64 %indvars.iv19
  store double %24, double* %25, align 8
  %26 = fdiv double %17, 9.000000e+00
  %27 = getelementptr inbounds double, double* %11, i64 %indvars.iv19
  store double %26, double* %27, align 8
  %28 = getelementptr inbounds double, double* %9, i64 %indvars.iv19
  store double 0.000000e+00, double* %28, align 8
  %29 = getelementptr inbounds double, double* %8, i64 %indvars.iv19
  store double 0.000000e+00, double* %29, align 8
  br label %30

; <label>:30:                                     ; preds = %30, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next.1, %30 ]
  %31 = mul nuw nsw i64 %indvars.iv19, %indvars.iv
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 2000
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv19, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %36 = mul nuw nsw i64 %indvars.iv19, %indvars.iv.next
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 2000
  %39 = sitofp i32 %38 to double
  %40 = insertelement <2 x double> undef, double %34, i32 0
  %41 = insertelement <2 x double> %40, double %39, i32 1
  %42 = fdiv <2 x double> %41, <double 2.000000e+03, double 2.000000e+03>
  %43 = bitcast double* %35 to <2 x double>*
  store <2 x double> %42, <2 x double>* %43, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.loopexit.us, label %30

.loopexit.us:                                     ; preds = %30
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 2000
  br i1 %exitcond21, label %._crit_edge, label %.lr.ph5.split.us

._crit_edge:                                      ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_gemver(i32, double, double, [2000 x double]*, double*, double*, double*, double*, double*, double*, double*, double*) #2 {
.preheader11.lr.ph..preheader11.us_crit_edge:
  %sunkaddr = ptrtoint double* %4 to i64
  %sunkaddr78 = ptrtoint double* %6 to i64
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %.loopexit24.us, %.preheader11.lr.ph..preheader11.us_crit_edge
  %indvars.iv63 = phi i64 [ 0, %.preheader11.lr.ph..preheader11.us_crit_edge ], [ %indvars.iv.next64, %.loopexit24.us ]
  %sunkaddr75 = shl nuw nsw i64 %indvars.iv63, 3
  %sunkaddr76 = add i64 %sunkaddr, %sunkaddr75
  %sunkaddr77 = inttoptr i64 %sunkaddr76 to double*
  %sunkaddr79 = shl nuw nsw i64 %indvars.iv63, 3
  %sunkaddr80 = add i64 %sunkaddr78, %sunkaddr79
  %sunkaddr81 = inttoptr i64 %sunkaddr80 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader11.us
  %indvars.iv61 = phi i64 [ 0, %.preheader11.us ], [ %indvars.iv.next62, %._crit_edge ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv63, i64 %indvars.iv61
  %13 = load double, double* %12, align 8
  %14 = load double, double* %sunkaddr77, align 8
  %15 = getelementptr inbounds double, double* %5, i64 %indvars.iv61
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %13, %17
  %19 = load double, double* %sunkaddr81, align 8
  %20 = getelementptr inbounds double, double* %7, i64 %indvars.iv61
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %18, %22
  store double %23, double* %12, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next62, 2000
  br i1 %exitcond73, label %.loopexit24.us, label %._crit_edge

.loopexit24.us:                                   ; preds = %._crit_edge
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next64, 2000
  br i1 %exitcond74, label %.preheader9.us.preheader, label %.preheader11.us

.preheader9.us.preheader:                         ; preds = %.loopexit24.us
  %sunkaddr82 = ptrtoint double* %9 to i64
  %sunkaddr82.1 = ptrtoint double* %9 to i64
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %.loopexit23.us, %.preheader9.us.preheader
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %.loopexit23.us ], [ 0, %.preheader9.us.preheader ]
  %24 = getelementptr inbounds double, double* %9, i64 %indvars.iv58
  %.pre = load double, double* %24, align 8
  %sunkaddr83 = shl nuw nsw i64 %indvars.iv58, 3
  %sunkaddr84 = add i64 %sunkaddr82, %sunkaddr83
  %sunkaddr85 = inttoptr i64 %sunkaddr84 to double*
  %sunkaddr83.1 = shl nuw nsw i64 %indvars.iv58, 3
  %sunkaddr84.1 = add i64 %sunkaddr82.1, %sunkaddr83.1
  %sunkaddr85.1 = inttoptr i64 %sunkaddr84.1 to double*
  br label %25

; <label>:25:                                     ; preds = %25, %.preheader9.us
  %26 = phi double [ %.pre, %.preheader9.us ], [ %40, %25 ]
  %indvars.iv54 = phi i64 [ 0, %.preheader9.us ], [ %indvars.iv.next55.1, %25 ]
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv54, i64 %indvars.iv58
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %2
  %30 = getelementptr inbounds double, double* %10, i64 %indvars.iv54
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fadd double %26, %32
  store double %33, double* %sunkaddr85, align 8
  %indvars.iv.next55 = or i64 %indvars.iv54, 1
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv.next55, i64 %indvars.iv58
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %2
  %37 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next55
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %33, %39
  store double %40, double* %sunkaddr85.1, align 8
  %exitcond57.1 = icmp eq i64 %indvars.iv.next55, 1999
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv54, 2
  br i1 %exitcond57.1, label %.loopexit23.us, label %25

.loopexit23.us:                                   ; preds = %25
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next59, 2000
  br i1 %exitcond72, label %vector.memcheck, label %.preheader9.us

vector.memcheck:                                  ; preds = %.loopexit23.us
  %scevgep = getelementptr double, double* %9, i64 2000
  %scevgep92 = getelementptr double, double* %11, i64 2000
  %bound0 = icmp ugt double* %scevgep92, %9
  %bound1 = icmp ugt double* %scevgep, %11
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lr.ph15.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

.lr.ph15.preheader:                               ; preds = %vector.memcheck
  br label %.lr.ph15

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %41 = getelementptr inbounds double, double* %9, i64 %index
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !1, !noalias !4
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !1, !noalias !4
  %45 = getelementptr inbounds double, double* %11, i64 %index
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !4
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !4
  %49 = fadd <2 x double> %wide.load, %wide.load96
  %50 = fadd <2 x double> %wide.load95, %wide.load97
  %51 = bitcast double* %41 to <2 x double>*
  store <2 x double> %49, <2 x double>* %51, align 8, !alias.scope !1, !noalias !4
  %52 = bitcast double* %43 to <2 x double>*
  store <2 x double> %50, <2 x double>* %52, align 8, !alias.scope !1, !noalias !4
  %index.next = or i64 %index, 4
  %53 = getelementptr inbounds double, double* %9, i64 %index.next
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !1, !noalias !4
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load95.1 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !1, !noalias !4
  %57 = getelementptr inbounds double, double* %11, i64 %index.next
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load96.1 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !4
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load97.1 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !4
  %61 = fadd <2 x double> %wide.load.1, %wide.load96.1
  %62 = fadd <2 x double> %wide.load95.1, %wide.load97.1
  %63 = bitcast double* %53 to <2 x double>*
  store <2 x double> %61, <2 x double>* %63, align 8, !alias.scope !1, !noalias !4
  %64 = bitcast double* %55 to <2 x double>*
  store <2 x double> %62, <2 x double>* %64, align 8, !alias.scope !1, !noalias !4
  %index.next.1 = add nsw i64 %index, 8
  %65 = icmp eq i64 %index.next.1, 2000
  br i1 %65, label %.preheader.us.preheader.loopexit98, label %vector.body, !llvm.loop !6

.preheader.us.preheader.loopexit:                 ; preds = %.lr.ph15
  br label %.preheader.us.preheader

.preheader.us.preheader.loopexit98:               ; preds = %vector.body
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit98, %.preheader.us.preheader.loopexit
  %sunkaddr86 = ptrtoint double* %8 to i64
  %sunkaddr86.1 = ptrtoint double* %8 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.us.preheader
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %.loopexit.us ], [ 0, %.preheader.us.preheader ]
  %66 = getelementptr inbounds double, double* %8, i64 %indvars.iv51
  %.pre66 = load double, double* %66, align 8
  %sunkaddr87 = shl nuw nsw i64 %indvars.iv51, 3
  %sunkaddr88 = add i64 %sunkaddr86, %sunkaddr87
  %sunkaddr89 = inttoptr i64 %sunkaddr88 to double*
  %sunkaddr87.1 = shl nuw nsw i64 %indvars.iv51, 3
  %sunkaddr88.1 = add i64 %sunkaddr86.1, %sunkaddr87.1
  %sunkaddr89.1 = inttoptr i64 %sunkaddr88.1 to double*
  br label %67

; <label>:67:                                     ; preds = %67, %.preheader.us
  %68 = phi double [ %.pre66, %.preheader.us ], [ %82, %67 ]
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %67 ]
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv
  %70 = load double, double* %69, align 8
  %71 = fmul double %70, %1
  %72 = getelementptr inbounds double, double* %9, i64 %indvars.iv
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %68, %74
  store double %75, double* %sunkaddr89, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv.next
  %77 = load double, double* %76, align 8
  %78 = fmul double %77, %1
  %79 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %75, %81
  store double %82, double* %sunkaddr89.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.loopexit.us, label %67

.loopexit.us:                                     ; preds = %67
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next52, 2000
  br i1 %exitcond67, label %.preheader7._crit_edge, label %.preheader.us

.lr.ph15:                                         ; preds = %.lr.ph15, %.lr.ph15.preheader
  %indvars.iv68 = phi i64 [ 0, %.lr.ph15.preheader ], [ %indvars.iv.next69.4, %.lr.ph15 ]
  %83 = getelementptr inbounds double, double* %9, i64 %indvars.iv68
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds double, double* %11, i64 %indvars.iv68
  %86 = load double, double* %85, align 8
  %87 = fadd double %84, %86
  store double %87, double* %83, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %88 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next69
  %89 = load double, double* %88, align 8
  %90 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next69
  %91 = load double, double* %90, align 8
  %92 = fadd double %89, %91
  store double %92, double* %88, align 8
  %indvars.iv.next69.1 = add nsw i64 %indvars.iv68, 2
  %93 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next69.1
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next69.1
  %96 = load double, double* %95, align 8
  %97 = fadd double %94, %96
  store double %97, double* %93, align 8
  %indvars.iv.next69.2 = add nsw i64 %indvars.iv68, 3
  %98 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next69.2
  %99 = load double, double* %98, align 8
  %100 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next69.2
  %101 = load double, double* %100, align 8
  %102 = fadd double %99, %101
  store double %102, double* %98, align 8
  %indvars.iv.next69.3 = add nsw i64 %indvars.iv68, 4
  %103 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next69.3
  %104 = load double, double* %103, align 8
  %105 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next69.3
  %106 = load double, double* %105, align 8
  %107 = fadd double %104, %106
  store double %107, double* %103, align 8
  %indvars.iv.next69.4 = add nsw i64 %indvars.iv68, 5
  %exitcond90.4 = icmp eq i64 %indvars.iv.next69.4, 2000
  br i1 %exitcond90.4, label %.preheader.us.preheader.loopexit, label %.lr.ph15, !llvm.loop !9

.preheader7._crit_edge:                           ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %6

; <label>:6:                                      ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2 ], [ 0, %.lr.ph ]
  %storemerge1 = phi i32 [ %15, %._crit_edge2 ], [ 0, %.lr.ph ]
  %7 = srem i32 %storemerge1, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge2

; <label>:9:                                      ; preds = %6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %9, %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %6

._crit_edge:                                      ; preds = %._crit_edge2
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
