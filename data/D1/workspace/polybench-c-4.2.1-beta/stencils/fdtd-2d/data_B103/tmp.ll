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
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_start() #4
  call void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %3 to [1200 x double]*
  call void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %4
  %indvars.iv7 = phi i64 [ 0, %4 ], [ %indvars.iv.next8.4, %._crit_edge ]
  %5 = trunc i64 %indvars.iv7 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv7
  store double %6, double* %7, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %8 = trunc i64 %indvars.iv.next8 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next8
  store double %9, double* %10, align 8
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv7, 2
  %11 = trunc i64 %indvars.iv.next8.1 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next8.1
  store double %12, double* %13, align 8
  %indvars.iv.next8.2 = add nsw i64 %indvars.iv7, 3
  %14 = trunc i64 %indvars.iv.next8.2 to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next8.2
  store double %15, double* %16, align 8
  %indvars.iv.next8.3 = add nsw i64 %indvars.iv7, 4
  %17 = trunc i64 %indvars.iv.next8.3 to i32
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next8.3
  store double %18, double* %19, align 8
  %indvars.iv.next8.4 = add nsw i64 %indvars.iv7, 5
  %exitcond9.4 = icmp eq i64 %indvars.iv.next8.4, 500
  br i1 %exitcond9.4, label %.preheader.preheader, label %._crit_edge

.preheader.preheader:                             ; preds = %._crit_edge
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %43
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %43 ], [ 0, %.preheader.preheader ]
  %20 = trunc i64 %indvars.iv4 to i32
  %21 = sitofp i32 %20 to double
  %22 = insertelement <2 x double> undef, double %21, i32 0
  %23 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge10 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %24 = trunc i64 %indvars.iv.next to i32
  %25 = sitofp i32 %24 to double
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %27 = add nuw nsw i64 %indvars.iv, 2
  %28 = trunc i64 %27 to i32
  %29 = sitofp i32 %28 to double
  %30 = insertelement <2 x double> undef, double %25, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fmul <2 x double> %23, %31
  %33 = fdiv <2 x double> %32, <double 1.000000e+03, double 1.200000e+03>
  %34 = extractelement <2 x double> %33, i32 0
  %35 = extractelement <2 x double> %33, i32 1
  store double %34, double* %26, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  store double %35, double* %36, align 8
  %37 = add nuw nsw i64 %indvars.iv, 3
  %38 = trunc i64 %37 to i32
  %39 = sitofp i32 %38 to double
  %40 = fmul double %21, %39
  %41 = fdiv double %40, 1.000000e+03
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv
  store double %41, double* %42, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %43, label %._crit_edge10

; <label>:43:                                     ; preds = %._crit_edge10
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond6, label %44, label %.preheader

; <label>:44:                                     ; preds = %43
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture readonly) #2 {
  %scevgep128 = getelementptr [1200 x double], [1200 x double]* %1, i64 1, i64 0
  br label %.preheader78

.preheader78:                                     ; preds = %214, %4
  %indvars.iv27 = phi i64 [ 0, %4 ], [ %indvars.iv.next28, %214 ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv27
  %6 = bitcast double* %5 to [1200 x double]*
  %bound0131 = icmp ugt [1200 x double]* %6, %1
  %bound1132 = icmp ult double* %5, %scevgep128
  %memcheck.conflict134 = and i1 %bound0131, %bound1132
  br i1 %memcheck.conflict134, label %._crit_edge.preheader, label %vector.body123.preheader

vector.body123.preheader:                         ; preds = %.preheader78
  %7 = bitcast double* %5 to i64*
  %8 = bitcast double* %5 to i64*
  %9 = bitcast double* %5 to i64*
  br label %vector.body123

._crit_edge.preheader:                            ; preds = %.preheader78
  %10 = bitcast double* %5 to i64*
  %11 = bitcast double* %5 to i64*
  %12 = bitcast double* %5 to i64*
  %13 = bitcast double* %5 to i64*
  %14 = bitcast double* %5 to i64*
  %15 = bitcast double* %5 to i64*
  %16 = bitcast double* %5 to i64*
  %17 = bitcast double* %5 to i64*
  br label %._crit_edge

vector.body123:                                   ; preds = %vector.body123, %vector.body123.preheader
  %index137 = phi i64 [ 0, %vector.body123.preheader ], [ %index.next138.2, %vector.body123 ]
  %18 = load i64, i64* %7, align 8, !alias.scope !1
  %19 = insertelement <2 x i64> undef, i64 %18, i32 0
  %20 = shufflevector <2 x i64> %19, <2 x i64> undef, <2 x i32> zeroinitializer
  %21 = insertelement <2 x i64> undef, i64 %18, i32 0
  %22 = shufflevector <2 x i64> %21, <2 x i64> undef, <2 x i32> zeroinitializer
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index137
  %24 = bitcast double* %23 to <2 x i64>*
  store <2 x i64> %20, <2 x i64>* %24, align 8, !alias.scope !4, !noalias !1
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x i64>*
  store <2 x i64> %22, <2 x i64>* %26, align 8, !alias.scope !4, !noalias !1
  %index.next138 = add nuw nsw i64 %index137, 4
  %27 = load i64, i64* %8, align 8, !alias.scope !1
  %28 = insertelement <2 x i64> undef, i64 %27, i32 0
  %29 = shufflevector <2 x i64> %28, <2 x i64> undef, <2 x i32> zeroinitializer
  %30 = insertelement <2 x i64> undef, i64 %27, i32 0
  %31 = shufflevector <2 x i64> %30, <2 x i64> undef, <2 x i32> zeroinitializer
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next138
  %33 = bitcast double* %32 to <2 x i64>*
  store <2 x i64> %29, <2 x i64>* %33, align 8, !alias.scope !4, !noalias !1
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x i64>*
  store <2 x i64> %31, <2 x i64>* %35, align 8, !alias.scope !4, !noalias !1
  %index.next138.1 = add nsw i64 %index137, 8
  %36 = load i64, i64* %9, align 8, !alias.scope !1
  %37 = insertelement <2 x i64> undef, i64 %36, i32 0
  %38 = shufflevector <2 x i64> %37, <2 x i64> undef, <2 x i32> zeroinitializer
  %39 = insertelement <2 x i64> undef, i64 %36, i32 0
  %40 = shufflevector <2 x i64> %39, <2 x i64> undef, <2 x i32> zeroinitializer
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next138.1
  %42 = bitcast double* %41 to <2 x i64>*
  store <2 x i64> %38, <2 x i64>* %42, align 8, !alias.scope !4, !noalias !1
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x i64>*
  store <2 x i64> %40, <2 x i64>* %44, align 8, !alias.scope !4, !noalias !1
  %index.next138.2 = add nsw i64 %index137, 12
  %45 = icmp eq i64 %index.next138.2, 1200
  br i1 %45, label %.preheader74.preheader.loopexit148, label %vector.body123, !llvm.loop !6

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next.7, %._crit_edge ]
  %46 = load i64, i64* %10, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %48 = bitcast double* %47 to i64*
  store i64 %46, i64* %48, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %49 = load i64, i64* %11, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %52 = load i64, i64* %12, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %55 = load i64, i64* %13, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %57 = bitcast double* %56 to i64*
  store i64 %55, i64* %57, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %58 = load i64, i64* %14, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %61 = load i64, i64* %15, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %64 = load i64, i64* %16, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %66 = bitcast double* %65 to i64*
  store i64 %64, i64* %66, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %67 = load i64, i64* %17, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.preheader74.preheader.loopexit, label %._crit_edge, !llvm.loop !9

.preheader74.preheader.loopexit:                  ; preds = %._crit_edge
  br label %.preheader74.preheader

.preheader74.preheader.loopexit148:               ; preds = %vector.body123
  br label %.preheader74.preheader

.preheader74.preheader:                           ; preds = %.preheader74.preheader.loopexit148, %.preheader74.preheader.loopexit
  br label %.preheader74

.preheader74:                                     ; preds = %.preheader74.preheader, %middle.block91
  %indvar = phi i64 [ %indvar.next, %middle.block91 ], [ 0, %.preheader74.preheader ]
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %middle.block91 ], [ 1, %.preheader74.preheader ]
  %70 = add nuw nsw i64 %indvar, 1
  %scevgep95 = getelementptr [1200 x double], [1200 x double]* %1, i64 %70, i64 0
  %71 = add nuw nsw i64 %indvar, 2
  %scevgep97 = getelementptr [1200 x double], [1200 x double]* %1, i64 %71, i64 0
  %scevgep99 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep101 = getelementptr [1200 x double], [1200 x double]* %2, i64 %71, i64 0
  %72 = add nsw i64 %indvars.iv12, -1
  %bound0103 = icmp ult double* %scevgep95, %scevgep101
  %bound1104 = icmp ult double* %scevgep99, %scevgep97
  %memcheck.conflict106 = and i1 %bound0103, %bound1104
  br i1 %memcheck.conflict106, label %._crit_edge30.preheader, label %vector.body90.preheader

vector.body90.preheader:                          ; preds = %.preheader74
  br label %vector.body90

._crit_edge30.preheader:                          ; preds = %.preheader74
  br label %._crit_edge30

vector.body90:                                    ; preds = %vector.body90.preheader, %vector.body90
  %index109 = phi i64 [ %index.next110, %vector.body90 ], [ 0, %vector.body90.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv12, i64 %index109
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load117 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !10, !noalias !13
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load118 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !10, !noalias !13
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv12, i64 %index109
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load119 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !13
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load120 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !13
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %72, i64 %index109
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load121 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !13
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load122 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !13
  %85 = fsub <2 x double> %wide.load119, %wide.load121
  %86 = fsub <2 x double> %wide.load120, %wide.load122
  %87 = fmul <2 x double> %85, <double 5.000000e-01, double 5.000000e-01>
  %88 = fmul <2 x double> %86, <double 5.000000e-01, double 5.000000e-01>
  %89 = fsub <2 x double> %wide.load117, %87
  %90 = fsub <2 x double> %wide.load118, %88
  %91 = bitcast double* %73 to <2 x double>*
  store <2 x double> %89, <2 x double>* %91, align 8, !alias.scope !10, !noalias !13
  %92 = bitcast double* %75 to <2 x double>*
  store <2 x double> %90, <2 x double>* %92, align 8, !alias.scope !10, !noalias !13
  %index.next110 = add nuw nsw i64 %index109, 4
  %93 = icmp eq i64 %index.next110, 1200
  br i1 %93, label %middle.block91.loopexit147, label %vector.body90, !llvm.loop !15

._crit_edge30:                                    ; preds = %._crit_edge30, %._crit_edge30.preheader
  %indvars.iv9 = phi i64 [ 0, %._crit_edge30.preheader ], [ %indvars.iv.next10.1, %._crit_edge30 ]
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv9
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv12, i64 %indvars.iv9
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %72, i64 %indvars.iv9
  %99 = load double, double* %98, align 8
  %100 = fsub double %97, %99
  %101 = fmul double %100, 5.000000e-01
  %102 = fsub double %95, %101
  store double %102, double* %94, align 8
  %indvars.iv.next10 = or i64 %indvars.iv9, 1
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv.next10
  %104 = load double, double* %103, align 8
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv12, i64 %indvars.iv.next10
  %106 = load double, double* %105, align 8
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %72, i64 %indvars.iv.next10
  %108 = load double, double* %107, align 8
  %109 = fsub double %106, %108
  %110 = fmul double %109, 5.000000e-01
  %111 = fsub double %104, %110
  store double %111, double* %103, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %exitcond11.1 = icmp eq i64 %indvars.iv.next10.1, 1200
  br i1 %exitcond11.1, label %middle.block91.loopexit, label %._crit_edge30, !llvm.loop !16

middle.block91.loopexit:                          ; preds = %._crit_edge30
  br label %middle.block91

middle.block91.loopexit147:                       ; preds = %vector.body90
  br label %middle.block91

middle.block91:                                   ; preds = %middle.block91.loopexit147, %middle.block91.loopexit
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1000
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond14, label %.preheader73.preheader, label %.preheader74

.preheader73.preheader:                           ; preds = %middle.block91
  br label %.preheader73

.preheader73:                                     ; preds = %.preheader73.preheader, %.loopexit145
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %.loopexit145 ], [ 0, %.preheader73.preheader ]
  %scevgep62 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv18, i64 1
  %112 = add nuw nsw i64 %indvars.iv18, 1
  %scevgep64 = getelementptr [1200 x double], [1200 x double]* %0, i64 %112, i64 0
  %scevgep66 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv18, i64 0
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %2, i64 %112, i64 0
  %bound070 = icmp ult double* %scevgep62, %scevgep68
  %bound171 = icmp ult double* %scevgep66, %scevgep64
  %memcheck.conflict73 = and i1 %bound070, %bound171
  br i1 %memcheck.conflict73, label %._crit_edge31.preheader, label %vector.body57.preheader

vector.body57.preheader:                          ; preds = %.preheader73
  br label %vector.body57

vector.body57:                                    ; preds = %vector.body57.preheader, %vector.body57
  %index76 = phi i64 [ %index.next77, %vector.body57 ], [ 0, %vector.body57.preheader ]
  %offset.idx = or i64 %index76, 1
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv18, i64 %offset.idx
  %114 = bitcast double* %113 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %114, align 8, !alias.scope !17, !noalias !20
  %115 = getelementptr double, double* %113, i64 2
  %116 = bitcast double* %115 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %116, align 8, !alias.scope !17, !noalias !20
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv18, i64 %offset.idx
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !20
  %119 = getelementptr double, double* %117, i64 2
  %120 = bitcast double* %119 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !20
  %121 = add nsw i64 %offset.idx, -1
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv18, i64 %121
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !20
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %125, align 8, !alias.scope !20
  %126 = fsub <2 x double> %wide.load86, %wide.load88
  %127 = fsub <2 x double> %wide.load87, %wide.load89
  %128 = fmul <2 x double> %126, <double 5.000000e-01, double 5.000000e-01>
  %129 = fmul <2 x double> %127, <double 5.000000e-01, double 5.000000e-01>
  %130 = fsub <2 x double> %wide.load84, %128
  %131 = fsub <2 x double> %wide.load85, %129
  %132 = bitcast double* %113 to <2 x double>*
  store <2 x double> %130, <2 x double>* %132, align 8, !alias.scope !17, !noalias !20
  %133 = bitcast double* %115 to <2 x double>*
  store <2 x double> %131, <2 x double>* %133, align 8, !alias.scope !17, !noalias !20
  %index.next77 = add nuw nsw i64 %index76, 4
  %134 = icmp eq i64 %index.next77, 1196
  br i1 %134, label %._crit_edge31.preheader.loopexit, label %vector.body57, !llvm.loop !22

._crit_edge31.preheader.loopexit:                 ; preds = %vector.body57
  br label %._crit_edge31.preheader

._crit_edge31.preheader:                          ; preds = %._crit_edge31.preheader.loopexit, %.preheader73
  %indvars.iv15.ph = phi i64 [ 1, %.preheader73 ], [ 1197, %._crit_edge31.preheader.loopexit ]
  br i1 true, label %._crit_edge31.prol.preheader, label %._crit_edge31.prol.loopexit.unr-lcssa

._crit_edge31.prol.preheader:                     ; preds = %._crit_edge31.preheader
  br label %._crit_edge31.prol

._crit_edge31.prol:                               ; preds = %._crit_edge31.prol.preheader
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv15.ph
  %136 = load double, double* %135, align 8
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv15.ph
  %138 = load double, double* %137, align 8
  %139 = add nsw i64 %indvars.iv15.ph, -1
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv18, i64 %139
  %141 = load double, double* %140, align 8
  %142 = fsub double %138, %141
  %143 = fmul double %142, 5.000000e-01
  %144 = fsub double %136, %143
  store double %144, double* %135, align 8
  %indvars.iv.next16.prol = add nuw nsw i64 %indvars.iv15.ph, 1
  br label %._crit_edge31.prol.loopexit.unr-lcssa

._crit_edge31.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge31.preheader, %._crit_edge31.prol
  %indvars.iv15.unr.ph = phi i64 [ %indvars.iv.next16.prol, %._crit_edge31.prol ], [ %indvars.iv15.ph, %._crit_edge31.preheader ]
  br label %._crit_edge31.prol.loopexit

._crit_edge31.prol.loopexit:                      ; preds = %._crit_edge31.prol.loopexit.unr-lcssa
  br i1 false, label %.loopexit145, label %._crit_edge31.preheader.new

._crit_edge31.preheader.new:                      ; preds = %._crit_edge31.prol.loopexit
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31, %._crit_edge31.preheader.new
  %indvars.iv15 = phi i64 [ %indvars.iv15.unr.ph, %._crit_edge31.preheader.new ], [ %indvars.iv.next16.1, %._crit_edge31 ]
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv15
  %146 = load double, double* %145, align 8
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv15
  %148 = load double, double* %147, align 8
  %149 = add nsw i64 %indvars.iv15, -1
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv18, i64 %149
  %151 = load double, double* %150, align 8
  %152 = fsub double %148, %151
  %153 = fmul double %152, 5.000000e-01
  %154 = fsub double %146, %153
  store double %154, double* %145, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv.next16
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv.next16
  %158 = load double, double* %157, align 8
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv15
  %160 = load double, double* %159, align 8
  %161 = fsub double %158, %160
  %162 = fmul double %161, 5.000000e-01
  %163 = fsub double %156, %162
  store double %163, double* %155, align 8
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, 2
  %exitcond17.1 = icmp eq i64 %indvars.iv.next16.1, 1200
  br i1 %exitcond17.1, label %.loopexit145.unr-lcssa, label %._crit_edge31, !llvm.loop !23

.loopexit145.unr-lcssa:                           ; preds = %._crit_edge31
  br label %.loopexit145

.loopexit145:                                     ; preds = %._crit_edge31.prol.loopexit, %.loopexit145.unr-lcssa
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 1000
  br i1 %exitcond20, label %.preheader.preheader, label %.preheader73

.preheader.preheader:                             ; preds = %.loopexit145
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.loopexit
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %.loopexit ], [ 0, %.preheader.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv24, i64 0
  %scevgep34 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv24, i64 1199
  %scevgep36 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv24, i64 0
  %164 = add nuw nsw i64 %indvars.iv24, 1
  %scevgep38 = getelementptr [1200 x double], [1200 x double]* %0, i64 %164, i64 0
  %scevgep40 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv24, i64 0
  %scevgep42 = getelementptr [1200 x double], [1200 x double]* %1, i64 %164, i64 1199
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %bound0 = icmp ult double* %scevgep, %scevgep38
  %bound1 = icmp ult double* %scevgep36, %scevgep34
  %found.conflict = and i1 %bound0, %bound1
  %bound044 = icmp ult double* %scevgep, %scevgep42
  %bound145 = icmp ult double* %scevgep40, %scevgep34
  %found.conflict46 = and i1 %bound044, %bound145
  %conflict.rdx = or i1 %found.conflict, %found.conflict46
  br i1 %conflict.rdx, label %._crit_edge32.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv24, i64 %index
  %166 = bitcast double* %165 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %166, align 8, !alias.scope !24, !noalias !27
  %167 = getelementptr double, double* %165, i64 2
  %168 = bitcast double* %167 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %168, align 8, !alias.scope !24, !noalias !27
  %169 = or i64 %index, 1
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv24, i64 %169
  %171 = bitcast double* %170 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %171, align 8, !alias.scope !30
  %172 = getelementptr double, double* %170, i64 2
  %173 = bitcast double* %172 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %173, align 8, !alias.scope !30
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv24, i64 %index
  %175 = bitcast double* %174 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %175, align 8, !alias.scope !30
  %176 = getelementptr double, double* %174, i64 2
  %177 = bitcast double* %176 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %177, align 8, !alias.scope !30
  %178 = fsub <2 x double> %wide.load49, %wide.load51
  %179 = fsub <2 x double> %wide.load50, %wide.load52
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next25, i64 %index
  %181 = bitcast double* %180 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %181, align 8, !alias.scope !31
  %182 = getelementptr double, double* %180, i64 2
  %183 = bitcast double* %182 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %183, align 8, !alias.scope !31
  %184 = fadd <2 x double> %178, %wide.load53
  %185 = fadd <2 x double> %179, %wide.load54
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv24, i64 %index
  %187 = bitcast double* %186 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %187, align 8, !alias.scope !31
  %188 = getelementptr double, double* %186, i64 2
  %189 = bitcast double* %188 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %189, align 8, !alias.scope !31
  %190 = fsub <2 x double> %184, %wide.load55
  %191 = fsub <2 x double> %185, %wide.load56
  %192 = fmul <2 x double> %190, <double 7.000000e-01, double 7.000000e-01>
  %193 = fmul <2 x double> %191, <double 7.000000e-01, double 7.000000e-01>
  %194 = fsub <2 x double> %wide.load, %192
  %195 = fsub <2 x double> %wide.load48, %193
  %196 = bitcast double* %165 to <2 x double>*
  store <2 x double> %194, <2 x double>* %196, align 8, !alias.scope !24, !noalias !27
  %197 = bitcast double* %167 to <2 x double>*
  store <2 x double> %195, <2 x double>* %197, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %198 = icmp eq i64 %index.next, 1196
  br i1 %198, label %._crit_edge32.preheader.loopexit, label %vector.body, !llvm.loop !32

._crit_edge32.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge32.preheader

._crit_edge32.preheader:                          ; preds = %._crit_edge32.preheader.loopexit, %.preheader
  %indvars.iv21.ph = phi i64 [ 0, %.preheader ], [ 1196, %._crit_edge32.preheader.loopexit ]
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.preheader, %._crit_edge32
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge32 ], [ %indvars.iv21.ph, %._crit_edge32.preheader ]
  %199 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv24, i64 %indvars.iv21
  %200 = load double, double* %199, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %201 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv24, i64 %indvars.iv.next22
  %202 = load double, double* %201, align 8
  %203 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv24, i64 %indvars.iv21
  %204 = load double, double* %203, align 8
  %205 = fsub double %202, %204
  %206 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next25, i64 %indvars.iv21
  %207 = load double, double* %206, align 8
  %208 = fadd double %205, %207
  %209 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv24, i64 %indvars.iv21
  %210 = load double, double* %209, align 8
  %211 = fsub double %208, %210
  %212 = fmul double %211, 7.000000e-01
  %213 = fsub double %200, %212
  store double %213, double* %199, align 8
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 1199
  br i1 %exitcond23, label %.loopexit, label %._crit_edge32, !llvm.loop !33

.loopexit:                                        ; preds = %._crit_edge32
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 999
  br i1 %exitcond26, label %214, label %.preheader

; <label>:214:                                    ; preds = %.loopexit
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next28, 500
  br i1 %exitcond29, label %215, label %.preheader78

; <label>:215:                                    ; preds = %214
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader39

.preheader39:                                     ; preds = %19, %3
  %indvars.iv19 = phi i64 [ 0, %3 ], [ %indvars.iv.next20, %19 ]
  %8 = mul nuw nsw i64 %indvars.iv19, 1000
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge, %.preheader39
  %indvars.iv16 = phi i64 [ 0, %.preheader39 ], [ %indvars.iv.next17, %._crit_edge ]
  %9 = add nuw nsw i64 %indvars.iv16, %8
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge28
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc27 = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge28, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv19, i64 %indvars.iv16
  %17 = load double, double* %16, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond18, label %19, label %._crit_edge28

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond21, label %20, label %.preheader39

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader38

.preheader38:                                     ; preds = %38, %20
  %indvars.iv13 = phi i64 [ 0, %20 ], [ %indvars.iv.next14, %38 ]
  %27 = mul nuw nsw i64 %indvars.iv13, 1000
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge29, %.preheader38
  %indvars.iv10 = phi i64 [ 0, %.preheader38 ], [ %indvars.iv.next11, %._crit_edge29 ]
  %28 = add nuw nsw i64 %indvars.iv10, %27
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %._crit_edge29

; <label>:32:                                     ; preds = %._crit_edge30
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc24 = call i32 @fputc(i32 10, %struct._IO_FILE* %33) #5
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge30, %32
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv10
  %36 = load double, double* %35, align 8
  %37 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %36) #6
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1200
  br i1 %exitcond12, label %38, label %._crit_edge30

; <label>:38:                                     ; preds = %._crit_edge29
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond15, label %39, label %.preheader38

; <label>:39:                                     ; preds = %38
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %55, %39
  %indvars.iv7 = phi i64 [ 0, %39 ], [ %indvars.iv.next8, %55 ]
  %44 = mul nuw nsw i64 %indvars.iv7, 1000
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge31, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge31 ]
  %45 = add nuw nsw i64 %indvars.iv, %44
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, 20
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %._crit_edge31

; <label>:49:                                     ; preds = %._crit_edge32
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %50) #5
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge32, %49
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %53) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %55, label %._crit_edge32

; <label>:55:                                     ; preds = %._crit_edge31
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond9, label %56, label %.preheader

; <label>:56:                                     ; preds = %55
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %58 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !7, !8}
!23 = distinct !{!23, !7, !8}
!24 = !{!25}
!25 = distinct !{!25, !26}
!26 = distinct !{!26, !"LVerDomain"}
!27 = !{!28, !29}
!28 = distinct !{!28, !26}
!29 = distinct !{!29, !26}
!30 = !{!28}
!31 = !{!29}
!32 = distinct !{!32, !7, !8}
!33 = distinct !{!33, !7, !8}
