; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #3
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call void @print_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
  br label %5

; <label>:5:                                      ; preds = %5, %4
  %indvars.iv53 = phi i64 [ 0, %4 ], [ %indvars.iv.next6.4, %5 ]
  %6 = trunc i64 %indvars.iv53 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv53
  %9 = bitcast double* %8 to <2 x double>*
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv53, 1
  %10 = trunc i64 %indvars.iv.next6 to i32
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %7, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  store <2 x double> %13, <2 x double>* %9, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv53, 2
  %14 = trunc i64 %indvars.iv.next6.1 to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next6.1
  %17 = bitcast double* %16 to <2 x double>*
  %indvars.iv.next6.2 = add nsw i64 %indvars.iv53, 3
  %18 = trunc i64 %indvars.iv.next6.2 to i32
  %19 = sitofp i32 %18 to double
  %20 = insertelement <2 x double> undef, double %15, i32 0
  %21 = insertelement <2 x double> %20, double %19, i32 1
  store <2 x double> %21, <2 x double>* %17, align 8
  %indvars.iv.next6.3 = add nsw i64 %indvars.iv53, 4
  %22 = trunc i64 %indvars.iv.next6.3 to i32
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next6.3
  store double %23, double* %24, align 8
  %exitcond4.4 = icmp eq i64 %indvars.iv.next6.3, 499
  %indvars.iv.next6.4 = add nsw i64 %indvars.iv53, 5
  br i1 %exitcond4.4, label %.preheader.preheader.preheader, label %5

.preheader.preheader.preheader:                   ; preds = %5
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %48, %.preheader.preheader.preheader
  %indvars.iv32 = phi i64 [ %indvars.iv.next4, %48 ], [ 0, %.preheader.preheader.preheader ]
  %25 = trunc i64 %indvars.iv32 to i32
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %26, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %29 = trunc i64 %indvars.iv.next to i32
  %30 = sitofp i32 %29 to double
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %indvars.iv1
  %32 = add nuw nsw i64 %indvars.iv1, 2
  %33 = trunc i64 %32 to i32
  %34 = sitofp i32 %33 to double
  %35 = insertelement <2 x double> undef, double %30, i32 0
  %36 = insertelement <2 x double> %35, double %34, i32 1
  %37 = fmul <2 x double> %28, %36
  %38 = fdiv <2 x double> %37, <double 1.000000e+03, double 1.200000e+03>
  %39 = extractelement <2 x double> %38, i32 0
  %40 = extractelement <2 x double> %38, i32 1
  store double %39, double* %31, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv1
  store double %40, double* %41, align 8
  %42 = add nuw nsw i64 %indvars.iv1, 3
  %43 = trunc i64 %42 to i32
  %44 = sitofp i32 %43 to double
  %45 = fmul double %26, %44
  %46 = fdiv double %45, 1.000000e+03
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %indvars.iv1
  store double %46, double* %47, align 8
  %exitcond = icmp eq i64 %indvars.iv1, 1199
  br i1 %exitcond, label %48, label %.preheader

; <label>:48:                                     ; preds = %.preheader
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1000
  br i1 %exitcond5, label %49, label %.preheader.preheader

; <label>:49:                                     ; preds = %48
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.preheader6.preheader

.preheader6.preheader:                            ; preds = %157, %4
  %indvars.iv198 = phi i64 [ 0, %4 ], [ %indvars.iv.next20, %157 ]
  %sunkaddr15 = shl i64 %indvars.iv198, 3
  %sunkaddr16 = add i64 %sunkaddr, %sunkaddr15
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i64*
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6, %.preheader6.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader6.preheader ], [ %indvars.iv.next.4, %.preheader6 ]
  %5 = load i64, i64* %sunkaddr17, align 8
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv1
  %7 = bitcast double* %6 to i64*
  store i64 %5, i64* %7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %8 = load i64, i64* %sunkaddr17, align 8
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %10 = bitcast double* %9 to i64*
  store i64 %8, i64* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv1, 2
  %11 = load i64, i64* %sunkaddr17, align 8
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %13 = bitcast double* %12 to i64*
  store i64 %11, i64* %13, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv1, 3
  %14 = load i64, i64* %sunkaddr17, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %16 = bitcast double* %15 to i64*
  store i64 %14, i64* %16, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv1, 4
  %17 = load i64, i64* %sunkaddr17, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %19 = bitcast double* %18 to i64*
  store i64 %17, i64* %19, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1199
  %indvars.iv.next.4 = add nsw i64 %indvars.iv1, 5
  br i1 %exitcond.4, label %.preheader2.preheader.preheader, label %.preheader6

.preheader2.preheader.preheader:                  ; preds = %.preheader6
  br label %.preheader2.preheader

.preheader2.preheader:                            ; preds = %.preheader5, %.preheader2.preheader.preheader
  %indvar = phi i64 [ %20, %.preheader5 ], [ 0, %.preheader2.preheader.preheader ]
  %indvars.iv93 = phi i64 [ %indvars.iv.next10, %.preheader5 ], [ 1, %.preheader2.preheader.preheader ]
  %20 = add nuw nsw i64 %indvar, 1
  %scevgep80 = getelementptr [1200 x double], [1200 x double]* %1, i64 %20, i64 0
  %21 = add nuw nsw i64 %indvar, 2
  %scevgep82 = getelementptr [1200 x double], [1200 x double]* %1, i64 %21, i64 0
  %scevgep84 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep86 = getelementptr [1200 x double], [1200 x double]* %2, i64 %21, i64 0
  %22 = add nsw i64 %indvars.iv93, -1
  %bound088 = icmp ult double* %scevgep80, %scevgep86
  %bound189 = icmp ult double* %scevgep84, %scevgep82
  %memcheck.conflict91 = and i1 %bound088, %bound189
  br i1 %memcheck.conflict91, label %.preheader2.preheader110, label %vector.body75.preheader

vector.body75.preheader:                          ; preds = %.preheader2.preheader
  br label %vector.body75

.preheader2.preheader110:                         ; preds = %.preheader2.preheader
  br label %.preheader2

vector.body75:                                    ; preds = %vector.body75.preheader, %vector.body75
  %index94 = phi i64 [ %index.next95, %vector.body75 ], [ 0, %vector.body75.preheader ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv93, i64 %index94
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load102 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1, !noalias !4
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1, !noalias !4
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv93, i64 %index94
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !4
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !4
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %22, i64 %index94
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !4
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load107 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !4
  %35 = fsub <2 x double> %wide.load104, %wide.load106
  %36 = fsub <2 x double> %wide.load105, %wide.load107
  %37 = fmul <2 x double> %35, <double 5.000000e-01, double 5.000000e-01>
  %38 = fmul <2 x double> %36, <double 5.000000e-01, double 5.000000e-01>
  %39 = fsub <2 x double> %wide.load102, %37
  %40 = fsub <2 x double> %wide.load103, %38
  store <2 x double> %39, <2 x double>* %24, align 8, !alias.scope !1, !noalias !4
  store <2 x double> %40, <2 x double>* %26, align 8, !alias.scope !1, !noalias !4
  %index.next95 = add nuw nsw i64 %index94, 4
  %41 = icmp eq i64 %index.next95, 1200
  br i1 %41, label %.preheader5.loopexit111, label %vector.body75, !llvm.loop !6

.preheader2:                                      ; preds = %.preheader2, %.preheader2.preheader110
  %indvars.iv72 = phi i64 [ 0, %.preheader2.preheader110 ], [ %indvars.iv.next8.1, %.preheader2 ]
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv72
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv93, i64 %indvars.iv72
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %22, i64 %indvars.iv72
  %47 = load double, double* %46, align 8
  %48 = fsub double %45, %47
  %49 = fmul double %48, 5.000000e-01
  %50 = fsub double %43, %49
  store double %50, double* %42, align 8
  %indvars.iv.next8 = or i64 %indvars.iv72, 1
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next8
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv93, i64 %indvars.iv.next8
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %22, i64 %indvars.iv.next8
  %56 = load double, double* %55, align 8
  %57 = fsub double %54, %56
  %58 = fmul double %57, 5.000000e-01
  %59 = fsub double %52, %58
  store double %59, double* %51, align 8
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8, 1199
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv72, 2
  br i1 %exitcond9.1, label %.preheader5.loopexit, label %.preheader2, !llvm.loop !9

.preheader5.loopexit:                             ; preds = %.preheader2
  br label %.preheader5

.preheader5.loopexit111:                          ; preds = %vector.body75
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit111, %.preheader5.loopexit
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond112 = icmp eq i64 %20, 999
  br i1 %exitcond112, label %.preheader1.preheader.preheader, label %.preheader2.preheader

.preheader1.preheader.preheader:                  ; preds = %.preheader5
  br label %.preheader1.preheader

.preheader1.preheader:                            ; preds = %.preheader4, %.preheader1.preheader.preheader
  %indvars.iv135 = phi i64 [ %60, %.preheader4 ], [ 0, %.preheader1.preheader.preheader ]
  %scevgep47 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv135, i64 1
  %60 = add nuw nsw i64 %indvars.iv135, 1
  %scevgep49 = getelementptr [1200 x double], [1200 x double]* %0, i64 %60, i64 0
  %scevgep51 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv135, i64 0
  %scevgep53 = getelementptr [1200 x double], [1200 x double]* %2, i64 %60, i64 0
  %bound055 = icmp ult double* %scevgep47, %scevgep53
  %bound156 = icmp ult double* %scevgep51, %scevgep49
  %memcheck.conflict58 = and i1 %bound055, %bound156
  br i1 %memcheck.conflict58, label %.preheader1.preheader109, label %vector.body42.preheader

vector.body42.preheader:                          ; preds = %.preheader1.preheader
  br label %vector.body42

vector.body42:                                    ; preds = %vector.body42.preheader, %vector.body42
  %index61 = phi i64 [ %index.next62, %vector.body42 ], [ 0, %vector.body42.preheader ]
  %offset.idx = or i64 %index61, 1
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv135, i64 %offset.idx
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !10, !noalias !13
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10, !noalias !13
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv135, i64 %offset.idx
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !13
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !13
  %69 = add nsw i64 %offset.idx, -1
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv135, i64 %69
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !13
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !13
  %74 = fsub <2 x double> %wide.load71, %wide.load73
  %75 = fsub <2 x double> %wide.load72, %wide.load74
  %76 = fmul <2 x double> %74, <double 5.000000e-01, double 5.000000e-01>
  %77 = fmul <2 x double> %75, <double 5.000000e-01, double 5.000000e-01>
  %78 = fsub <2 x double> %wide.load69, %76
  %79 = fsub <2 x double> %wide.load70, %77
  store <2 x double> %78, <2 x double>* %62, align 8, !alias.scope !10, !noalias !13
  store <2 x double> %79, <2 x double>* %64, align 8, !alias.scope !10, !noalias !13
  %index.next62 = add nuw nsw i64 %index61, 4
  %80 = icmp eq i64 %index.next62, 1196
  br i1 %80, label %.preheader1.preheader109.loopexit, label %vector.body42, !llvm.loop !15

.preheader1.preheader109.loopexit:                ; preds = %vector.body42
  br label %.preheader1.preheader109

.preheader1.preheader109:                         ; preds = %.preheader1.preheader109.loopexit, %.preheader1.preheader
  %indvars.iv114.ph = phi i64 [ 1, %.preheader1.preheader ], [ 1197, %.preheader1.preheader109.loopexit ]
  br i1 true, label %.preheader1.prol.preheader, label %.preheader1.preheader109..preheader1.prol.loopexit.unr-lcssa_crit_edge

.preheader1.preheader109..preheader1.prol.loopexit.unr-lcssa_crit_edge: ; preds = %.preheader1.preheader109
  br label %.preheader1.prol.loopexit.unr-lcssa

.preheader1.prol.preheader:                       ; preds = %.preheader1.preheader109
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv135, i64 %indvars.iv114.ph
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv135, i64 %indvars.iv114.ph
  %84 = load double, double* %83, align 8
  %85 = add nsw i64 %indvars.iv114.ph, -1
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv135, i64 %85
  %87 = load double, double* %86, align 8
  %88 = fsub double %84, %87
  %89 = fmul double %88, 5.000000e-01
  %90 = fsub double %82, %89
  store double %90, double* %81, align 8
  %indvars.iv.next12.prol = add nuw nsw i64 %indvars.iv114.ph, 1
  br label %.preheader1.prol.loopexit.unr-lcssa

.preheader1.prol.loopexit.unr-lcssa:              ; preds = %.preheader1.preheader109..preheader1.prol.loopexit.unr-lcssa_crit_edge, %.preheader1.prol.preheader
  %indvars.iv114.unr.ph = phi i64 [ %indvars.iv.next12.prol, %.preheader1.prol.preheader ], [ undef, %.preheader1.preheader109..preheader1.prol.loopexit.unr-lcssa_crit_edge ]
  br i1 false, label %.preheader1.prol.loopexit.unr-lcssa..preheader4_crit_edge, label %.preheader1.preheader109.new

.preheader1.prol.loopexit.unr-lcssa..preheader4_crit_edge: ; preds = %.preheader1.prol.loopexit.unr-lcssa
  br label %.preheader4

.preheader1.preheader109.new:                     ; preds = %.preheader1.prol.loopexit.unr-lcssa
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1, %.preheader1.preheader109.new
  %indvars.iv114 = phi i64 [ %indvars.iv114.unr.ph, %.preheader1.preheader109.new ], [ %indvars.iv.next12.1, %.preheader1 ]
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv135, i64 %indvars.iv114
  %92 = load double, double* %91, align 8
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv135, i64 %indvars.iv114
  %94 = load double, double* %93, align 8
  %95 = add nsw i64 %indvars.iv114, -1
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv135, i64 %95
  %97 = load double, double* %96, align 8
  %98 = fsub double %94, %97
  %99 = fmul double %98, 5.000000e-01
  %100 = fsub double %92, %99
  store double %100, double* %91, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv114, 1
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv135, i64 %indvars.iv.next12
  %102 = load double, double* %101, align 8
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv135, i64 %indvars.iv.next12
  %104 = load double, double* %103, align 8
  %105 = load double, double* %93, align 8
  %106 = fsub double %104, %105
  %107 = fmul double %106, 5.000000e-01
  %108 = fsub double %102, %107
  store double %108, double* %101, align 8
  %exitcond10.1 = icmp eq i64 %indvars.iv.next12, 1199
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv114, 2
  br i1 %exitcond10.1, label %.preheader4.unr-lcssa, label %.preheader1, !llvm.loop !16

.preheader4.unr-lcssa:                            ; preds = %.preheader1
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader1.prol.loopexit.unr-lcssa..preheader4_crit_edge, %.preheader4.unr-lcssa
  %exitcond113 = icmp eq i64 %60, 1000
  br i1 %exitcond113, label %.preheader.preheader.preheader, label %.preheader1.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader4
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader3, %.preheader.preheader.preheader
  %indvars.iv177 = phi i64 [ %109, %.preheader3 ], [ 0, %.preheader.preheader.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv177, i64 0
  %scevgep19 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv177, i64 1199
  %scevgep21 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv177, i64 0
  %109 = add nuw nsw i64 %indvars.iv177, 1
  %scevgep23 = getelementptr [1200 x double], [1200 x double]* %0, i64 %109, i64 0
  %scevgep25 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv177, i64 0
  %scevgep27 = getelementptr [1200 x double], [1200 x double]* %1, i64 %109, i64 1199
  %bound0 = icmp ult double* %scevgep, %scevgep23
  %bound1 = icmp ult double* %scevgep21, %scevgep19
  %found.conflict = and i1 %bound0, %bound1
  %bound029 = icmp ult double* %scevgep, %scevgep27
  %bound130 = icmp ult double* %scevgep25, %scevgep19
  %found.conflict31 = and i1 %bound029, %bound130
  %conflict.rdx = or i1 %found.conflict, %found.conflict31
  br i1 %conflict.rdx, label %.preheader.preheader108, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv177, i64 %index
  %111 = bitcast double* %110 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %111, align 8, !alias.scope !17, !noalias !20
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load33 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !17, !noalias !20
  %114 = or i64 %index, 1
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv177, i64 %114
  %116 = bitcast double* %115 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %116, align 8, !alias.scope !23
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load35 = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !23
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv177, i64 %index
  %120 = bitcast double* %119 to <2 x double>*
  %wide.load36 = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !23
  %121 = getelementptr double, double* %119, i64 2
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !23
  %123 = fsub <2 x double> %wide.load34, %wide.load36
  %124 = fsub <2 x double> %wide.load35, %wide.load37
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %109, i64 %index
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !24
  %127 = getelementptr double, double* %125, i64 2
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !24
  %129 = fadd <2 x double> %123, %wide.load38
  %130 = fadd <2 x double> %124, %wide.load39
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv177, i64 %index
  %132 = bitcast double* %131 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %132, align 8, !alias.scope !24
  %133 = getelementptr double, double* %131, i64 2
  %134 = bitcast double* %133 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %134, align 8, !alias.scope !24
  %135 = fsub <2 x double> %129, %wide.load40
  %136 = fsub <2 x double> %130, %wide.load41
  %137 = fmul <2 x double> %135, <double 7.000000e-01, double 7.000000e-01>
  %138 = fmul <2 x double> %136, <double 7.000000e-01, double 7.000000e-01>
  %139 = fsub <2 x double> %wide.load, %137
  %140 = fsub <2 x double> %wide.load33, %138
  store <2 x double> %139, <2 x double>* %111, align 8, !alias.scope !17, !noalias !20
  store <2 x double> %140, <2 x double>* %113, align 8, !alias.scope !17, !noalias !20
  %index.next = add nuw nsw i64 %index, 4
  %141 = icmp eq i64 %index.next, 1196
  br i1 %141, label %.preheader.preheader108.loopexit, label %vector.body, !llvm.loop !25

.preheader.preheader108.loopexit:                 ; preds = %vector.body
  br label %.preheader.preheader108

.preheader.preheader108:                          ; preds = %.preheader.preheader108.loopexit, %.preheader.preheader
  %indvars.iv156.ph = phi i64 [ 0, %.preheader.preheader ], [ 1196, %.preheader.preheader108.loopexit ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader108, %.preheader
  %indvars.iv156 = phi i64 [ %indvars.iv.next16, %.preheader ], [ %indvars.iv156.ph, %.preheader.preheader108 ]
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv177, i64 %indvars.iv156
  %143 = load double, double* %142, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv156, 1
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv177, i64 %indvars.iv.next16
  %145 = load double, double* %144, align 8
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv177, i64 %indvars.iv156
  %147 = load double, double* %146, align 8
  %148 = fsub double %145, %147
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %109, i64 %indvars.iv156
  %150 = load double, double* %149, align 8
  %151 = fadd double %148, %150
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv177, i64 %indvars.iv156
  %153 = load double, double* %152, align 8
  %154 = fsub double %151, %153
  %155 = fmul double %154, 7.000000e-01
  %156 = fsub double %143, %155
  store double %156, double* %142, align 8
  %exitcond11 = icmp eq i64 %indvars.iv156, 1198
  br i1 %exitcond11, label %.preheader3, label %.preheader, !llvm.loop !26

.preheader3:                                      ; preds = %.preheader
  %exitcond114 = icmp eq i64 %109, 999
  br i1 %exitcond114, label %157, label %.preheader.preheader

; <label>:157:                                    ; preds = %.preheader3
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv198, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next20, 500
  br i1 %exitcond115, label %158, label %.preheader6.preheader

; <label>:158:                                    ; preds = %157
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader8.preheader

.preheader8.preheader:                            ; preds = %19, %3
  %indvars.iv176 = phi i64 [ 0, %3 ], [ %indvars.iv.next18, %19 ]
  %8 = mul nuw nsw i64 %indvars.iv176, 1000
  br label %.preheader8._crit_edge

.preheader8._crit_edge:                           ; preds = %.preheader8, %.preheader8.preheader
  %indvars.iv155 = phi i64 [ 0, %.preheader8.preheader ], [ %indvars.iv.next16, %.preheader8 ]
  %9 = add nuw nsw i64 %indvars.iv155, %8
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %.preheader8

; <label>:13:                                     ; preds = %.preheader8._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #4
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8._crit_edge, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv176, i64 %indvars.iv155
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv155, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond10, label %19, label %.preheader8._crit_edge

; <label>:19:                                     ; preds = %.preheader8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv176, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next18, 1000
  br i1 %exitcond11, label %20, label %.preheader8.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #4
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.preheader7.preheader

.preheader7.preheader:                            ; preds = %38, %20
  %indvars.iv134 = phi i64 [ 0, %20 ], [ %indvars.iv.next14, %38 ]
  %27 = mul nuw nsw i64 %indvars.iv134, 1000
  br label %.preheader7._crit_edge

.preheader7._crit_edge:                           ; preds = %.preheader7, %.preheader7.preheader
  %indvars.iv113 = phi i64 [ 0, %.preheader7.preheader ], [ %indvars.iv.next12, %.preheader7 ]
  %28 = add nuw nsw i64 %indvars.iv113, %27
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %.preheader7

; <label>:32:                                     ; preds = %.preheader7._crit_edge
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #4
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7._crit_edge, %32
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv134, i64 %indvars.iv113
  %36 = load double, double* %35, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %36) #5
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond8, label %38, label %.preheader7._crit_edge

; <label>:38:                                     ; preds = %.preheader7
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv134, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond9, label %39, label %.preheader7.preheader

; <label>:39:                                     ; preds = %38
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %55, %39
  %indvars.iv92 = phi i64 [ 0, %39 ], [ %indvars.iv.next10, %55 ]
  %44 = mul nuw nsw i64 %indvars.iv92, 1000
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader, %.preheader.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %45 = add nuw nsw i64 %indvars.iv1, %44
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, 20
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %.preheader

; <label>:49:                                     ; preds = %.preheader._crit_edge
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %50) #4
  br label %.preheader

.preheader:                                       ; preds = %.preheader._crit_edge, %49
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv92, i64 %indvars.iv1
  %53 = load double, double* %52, align 8
  %54 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %53) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %55, label %.preheader._crit_edge

; <label>:55:                                     ; preds = %.preheader
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond7, label %56, label %.preheader.preheader

; <label>:56:                                     ; preds = %55
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %58 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

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
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21, !22}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !19}
!23 = !{!21}
!24 = !{!22}
!25 = distinct !{!25, !7, !8}
!26 = distinct !{!26, !7, !8}
