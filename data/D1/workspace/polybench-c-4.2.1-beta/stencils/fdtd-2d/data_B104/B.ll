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
  %3 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = call i8* @polybench_alloc_data(i64 500, i32 8) #3
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_start() #3
  call void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  call void @print_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %2, %15
  call void @free(i8* %3) #3
  call void @free(i8* %4) #3
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
  br label %5

; <label>:5:                                      ; preds = %5, %4
  %indvars.iv7 = phi i64 [ 0, %4 ], [ %indvars.iv.next8.4, %5 ]
  %6 = trunc i64 %indvars.iv7 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv7
  store double %7, double* %8, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %9 = trunc i64 %indvars.iv.next8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next8
  store double %10, double* %11, align 8
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv7, 2
  %12 = trunc i64 %indvars.iv.next8.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next8.1
  store double %13, double* %14, align 8
  %indvars.iv.next8.2 = add nsw i64 %indvars.iv7, 3
  %15 = trunc i64 %indvars.iv.next8.2 to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next8.2
  store double %16, double* %17, align 8
  %indvars.iv.next8.3 = add nsw i64 %indvars.iv7, 4
  %18 = trunc i64 %indvars.iv.next8.3 to i32
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next8.3
  store double %19, double* %20, align 8
  %indvars.iv.next8.4 = add nsw i64 %indvars.iv7, 5
  %exitcond9.4 = icmp eq i64 %indvars.iv.next8.3, 499
  br i1 %exitcond9.4, label %.preheader.preheader, label %5

.preheader.preheader:                             ; preds = %5
  br label %.preheader

.preheader:                                       ; preds = %45, %.preheader.preheader
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %45 ], [ 0, %.preheader.preheader ]
  %21 = trunc i64 %indvars.iv5 to i32
  %22 = sitofp i32 %21 to double
  %23 = insertelement <2 x double> undef, double %22, i32 0
  %24 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> zeroinitializer
  br label %25

; <label>:25:                                     ; preds = %25, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %25 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %26 = trunc i64 %indvars.iv.next to i32
  %27 = sitofp i32 %26 to double
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %29 = add nuw nsw i64 %indvars.iv, 2
  %30 = trunc i64 %29 to i32
  %31 = sitofp i32 %30 to double
  %32 = insertelement <2 x double> undef, double %27, i32 0
  %33 = insertelement <2 x double> %32, double %31, i32 1
  %34 = fmul <2 x double> %24, %33
  %35 = fdiv <2 x double> %34, <double 1.000000e+03, double 1.200000e+03>
  %36 = extractelement <2 x double> %35, i32 0
  %37 = extractelement <2 x double> %35, i32 1
  store double %36, double* %28, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  store double %37, double* %38, align 8
  %39 = add nuw nsw i64 %indvars.iv, 3
  %40 = trunc i64 %39 to i32
  %41 = sitofp i32 %40 to double
  %42 = fmul double %22, %41
  %43 = fdiv double %42, 1.000000e+03
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv
  store double %43, double* %44, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %45, label %25

; <label>:45:                                     ; preds = %25
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond10, label %46, label %.preheader

; <label>:46:                                     ; preds = %45
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.preheader78

.preheader78:                                     ; preds = %158, %4
  %indvars.iv27 = phi i64 [ 0, %4 ], [ %indvars.iv.next28, %158 ]
  %sunkaddr32 = shl i64 %indvars.iv27, 3
  %sunkaddr33 = add i64 %sunkaddr, %sunkaddr32
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i64*
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader78
  %indvars.iv = phi i64 [ 0, %.preheader78 ], [ %indvars.iv.next.4, %5 ]
  %6 = load i64, i64* %sunkaddr34, align 8
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %8 = bitcast double* %7 to i64*
  store i64 %6, i64* %8, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %9 = load i64, i64* %sunkaddr34, align 8
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %11 = bitcast double* %10 to i64*
  store i64 %9, i64* %11, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %12 = load i64, i64* %sunkaddr34, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %14 = bitcast double* %13 to i64*
  store i64 %12, i64* %14, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %15 = load i64, i64* %sunkaddr34, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %17 = bitcast double* %16 to i64*
  store i64 %15, i64* %17, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %18 = load i64, i64* %sunkaddr34, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %20 = bitcast double* %19 to i64*
  store i64 %18, i64* %20, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1199
  br i1 %exitcond.4, label %.preheader74.preheader, label %5

.preheader74.preheader:                           ; preds = %5
  br label %.preheader74

.preheader74:                                     ; preds = %middle.block93, %.preheader74.preheader
  %indvar = phi i64 [ %21, %middle.block93 ], [ 0, %.preheader74.preheader ]
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %middle.block93 ], [ 1, %.preheader74.preheader ]
  %21 = add nuw nsw i64 %indvar, 1
  %scevgep97 = getelementptr [1200 x double], [1200 x double]* %1, i64 %21, i64 0
  %22 = add nuw nsw i64 %indvar, 2
  %scevgep99 = getelementptr [1200 x double], [1200 x double]* %1, i64 %22, i64 0
  %scevgep101 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep103 = getelementptr [1200 x double], [1200 x double]* %2, i64 %22, i64 0
  %23 = add nsw i64 %indvars.iv15, -1
  %bound0105 = icmp ult double* %scevgep97, %scevgep103
  %bound1106 = icmp ult double* %scevgep101, %scevgep99
  %memcheck.conflict108 = and i1 %bound0105, %bound1106
  br i1 %memcheck.conflict108, label %scalar.ph94.preheader, label %vector.body92.preheader

vector.body92.preheader:                          ; preds = %.preheader74
  br label %vector.body92

scalar.ph94.preheader:                            ; preds = %.preheader74
  br label %scalar.ph94

vector.body92:                                    ; preds = %vector.body92.preheader, %vector.body92
  %index111 = phi i64 [ %index.next112, %vector.body92 ], [ 0, %vector.body92.preheader ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %index111
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load119 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1, !noalias !4
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load120 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1, !noalias !4
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %index111
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load121 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !4
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load122 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !4
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %23, i64 %index111
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load123 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !4
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load124 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !4
  %36 = fsub <2 x double> %wide.load121, %wide.load123
  %37 = fsub <2 x double> %wide.load122, %wide.load124
  %38 = fmul <2 x double> %36, <double 5.000000e-01, double 5.000000e-01>
  %39 = fmul <2 x double> %37, <double 5.000000e-01, double 5.000000e-01>
  %40 = fsub <2 x double> %wide.load119, %38
  %41 = fsub <2 x double> %wide.load120, %39
  store <2 x double> %40, <2 x double>* %25, align 8, !alias.scope !1, !noalias !4
  store <2 x double> %41, <2 x double>* %27, align 8, !alias.scope !1, !noalias !4
  %index.next112 = add nuw nsw i64 %index111, 4
  %42 = icmp eq i64 %index.next112, 1200
  br i1 %42, label %middle.block93.loopexit127, label %vector.body92, !llvm.loop !6

scalar.ph94:                                      ; preds = %scalar.ph94, %scalar.ph94.preheader
  %indvars.iv12 = phi i64 [ 0, %scalar.ph94.preheader ], [ %indvars.iv.next13.1, %scalar.ph94 ]
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv12
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv12
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %23, i64 %indvars.iv12
  %48 = load double, double* %47, align 8
  %49 = fsub double %46, %48
  %50 = fmul double %49, 5.000000e-01
  %51 = fsub double %44, %50
  store double %51, double* %43, align 8
  %indvars.iv.next13 = or i64 %indvars.iv12, 1
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv.next13
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv.next13
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %23, i64 %indvars.iv.next13
  %57 = load double, double* %56, align 8
  %58 = fsub double %55, %57
  %59 = fmul double %58, 5.000000e-01
  %60 = fsub double %53, %59
  store double %60, double* %52, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, 2
  %exitcond14.1 = icmp eq i64 %indvars.iv.next13, 1199
  br i1 %exitcond14.1, label %middle.block93.loopexit, label %scalar.ph94, !llvm.loop !9

middle.block93.loopexit:                          ; preds = %scalar.ph94
  br label %middle.block93

middle.block93.loopexit127:                       ; preds = %vector.body92
  br label %middle.block93

middle.block93:                                   ; preds = %middle.block93.loopexit127, %middle.block93.loopexit
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond128 = icmp eq i64 %21, 999
  br i1 %exitcond128, label %.preheader73.preheader, label %.preheader74

.preheader73.preheader:                           ; preds = %middle.block93
  br label %.preheader73

.preheader73:                                     ; preds = %.loopexit125, %.preheader73.preheader
  %indvars.iv20 = phi i64 [ %61, %.loopexit125 ], [ 0, %.preheader73.preheader ]
  %scevgep64 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv20, i64 1
  %61 = add nuw nsw i64 %indvars.iv20, 1
  %scevgep66 = getelementptr [1200 x double], [1200 x double]* %0, i64 %61, i64 0
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 0
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %2, i64 %61, i64 0
  %bound072 = icmp ult double* %scevgep64, %scevgep70
  %bound173 = icmp ult double* %scevgep68, %scevgep66
  %memcheck.conflict75 = and i1 %bound072, %bound173
  br i1 %memcheck.conflict75, label %scalar.ph61.preheader, label %vector.body59.preheader

vector.body59.preheader:                          ; preds = %.preheader73
  br label %vector.body59

vector.body59:                                    ; preds = %vector.body59.preheader, %vector.body59
  %index78 = phi i64 [ %index.next79, %vector.body59 ], [ 0, %vector.body59.preheader ]
  %offset.idx = or i64 %index78, 1
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv20, i64 %offset.idx
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !10, !noalias !13
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10, !noalias !13
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %offset.idx
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !13
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !13
  %70 = add nsw i64 %offset.idx, -1
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %70
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !13
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !13
  %75 = fsub <2 x double> %wide.load88, %wide.load90
  %76 = fsub <2 x double> %wide.load89, %wide.load91
  %77 = fmul <2 x double> %75, <double 5.000000e-01, double 5.000000e-01>
  %78 = fmul <2 x double> %76, <double 5.000000e-01, double 5.000000e-01>
  %79 = fsub <2 x double> %wide.load86, %77
  %80 = fsub <2 x double> %wide.load87, %78
  store <2 x double> %79, <2 x double>* %63, align 8, !alias.scope !10, !noalias !13
  store <2 x double> %80, <2 x double>* %65, align 8, !alias.scope !10, !noalias !13
  %index.next79 = add nuw nsw i64 %index78, 4
  %81 = icmp eq i64 %index.next79, 1196
  br i1 %81, label %scalar.ph61.preheader.loopexit, label %vector.body59, !llvm.loop !15

scalar.ph61.preheader.loopexit:                   ; preds = %vector.body59
  br label %scalar.ph61.preheader

scalar.ph61.preheader:                            ; preds = %scalar.ph61.preheader.loopexit, %.preheader73
  %indvars.iv17.ph = phi i64 [ 1, %.preheader73 ], [ 1197, %scalar.ph61.preheader.loopexit ]
  br i1 true, label %scalar.ph61.prol.preheader, label %scalar.ph61.preheader.scalar.ph61.prol.loopexit.unr-lcssa_crit_edge

scalar.ph61.preheader.scalar.ph61.prol.loopexit.unr-lcssa_crit_edge: ; preds = %scalar.ph61.preheader
  br label %scalar.ph61.prol.loopexit.unr-lcssa

scalar.ph61.prol.preheader:                       ; preds = %scalar.ph61.preheader
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv20, i64 %indvars.iv17.ph
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %indvars.iv17.ph
  %85 = load double, double* %84, align 8
  %86 = add nsw i64 %indvars.iv17.ph, -1
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %86
  %88 = load double, double* %87, align 8
  %89 = fsub double %85, %88
  %90 = fmul double %89, 5.000000e-01
  %91 = fsub double %83, %90
  store double %91, double* %82, align 8
  %indvars.iv.next18.prol = add nuw nsw i64 %indvars.iv17.ph, 1
  br label %scalar.ph61.prol.loopexit.unr-lcssa

scalar.ph61.prol.loopexit.unr-lcssa:              ; preds = %scalar.ph61.preheader.scalar.ph61.prol.loopexit.unr-lcssa_crit_edge, %scalar.ph61.prol.preheader
  %indvars.iv17.unr.ph = phi i64 [ %indvars.iv.next18.prol, %scalar.ph61.prol.preheader ], [ undef, %scalar.ph61.preheader.scalar.ph61.prol.loopexit.unr-lcssa_crit_edge ]
  br i1 false, label %scalar.ph61.prol.loopexit.unr-lcssa..loopexit125_crit_edge, label %scalar.ph61.preheader.new

scalar.ph61.prol.loopexit.unr-lcssa..loopexit125_crit_edge: ; preds = %scalar.ph61.prol.loopexit.unr-lcssa
  br label %.loopexit125

scalar.ph61.preheader.new:                        ; preds = %scalar.ph61.prol.loopexit.unr-lcssa
  br label %scalar.ph61

scalar.ph61:                                      ; preds = %scalar.ph61, %scalar.ph61.preheader.new
  %indvars.iv17 = phi i64 [ %indvars.iv17.unr.ph, %scalar.ph61.preheader.new ], [ %indvars.iv.next18.1, %scalar.ph61 ]
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv20, i64 %indvars.iv17
  %93 = load double, double* %92, align 8
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %indvars.iv17
  %95 = load double, double* %94, align 8
  %96 = add nsw i64 %indvars.iv17, -1
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %96
  %98 = load double, double* %97, align 8
  %99 = fsub double %95, %98
  %100 = fmul double %99, 5.000000e-01
  %101 = fsub double %93, %100
  store double %101, double* %92, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv20, i64 %indvars.iv.next18
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %indvars.iv.next18
  %105 = load double, double* %104, align 8
  %106 = load double, double* %94, align 8
  %107 = fsub double %105, %106
  %108 = fmul double %107, 5.000000e-01
  %109 = fsub double %103, %108
  store double %109, double* %102, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %exitcond19.1 = icmp eq i64 %indvars.iv.next18, 1199
  br i1 %exitcond19.1, label %.loopexit125.unr-lcssa, label %scalar.ph61, !llvm.loop !16

.loopexit125.unr-lcssa:                           ; preds = %scalar.ph61
  br label %.loopexit125

.loopexit125:                                     ; preds = %scalar.ph61.prol.loopexit.unr-lcssa..loopexit125_crit_edge, %.loopexit125.unr-lcssa
  %exitcond129 = icmp eq i64 %61, 1000
  br i1 %exitcond129, label %.preheader.preheader, label %.preheader73

.preheader.preheader:                             ; preds = %.loopexit125
  br label %.preheader

.preheader:                                       ; preds = %.loopexit, %.preheader.preheader
  %indvars.iv25 = phi i64 [ %110, %.loopexit ], [ 0, %.preheader.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 0
  %scevgep36 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 1199
  %scevgep38 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv25, i64 0
  %110 = add nuw nsw i64 %indvars.iv25, 1
  %scevgep40 = getelementptr [1200 x double], [1200 x double]* %0, i64 %110, i64 0
  %scevgep42 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 0
  %scevgep44 = getelementptr [1200 x double], [1200 x double]* %1, i64 %110, i64 1199
  %bound0 = icmp ult double* %scevgep, %scevgep40
  %bound1 = icmp ult double* %scevgep38, %scevgep36
  %found.conflict = and i1 %bound0, %bound1
  %bound046 = icmp ult double* %scevgep, %scevgep44
  %bound147 = icmp ult double* %scevgep42, %scevgep36
  %found.conflict48 = and i1 %bound046, %bound147
  %conflict.rdx = or i1 %found.conflict, %found.conflict48
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %index
  %112 = bitcast double* %111 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %112, align 8, !alias.scope !17, !noalias !20
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %114, align 8, !alias.scope !17, !noalias !20
  %115 = or i64 %index, 1
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv25, i64 %115
  %117 = bitcast double* %116 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %117, align 8, !alias.scope !23
  %118 = getelementptr double, double* %116, i64 2
  %119 = bitcast double* %118 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %119, align 8, !alias.scope !23
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv25, i64 %index
  %121 = bitcast double* %120 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %121, align 8, !alias.scope !23
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !23
  %124 = fsub <2 x double> %wide.load51, %wide.load53
  %125 = fsub <2 x double> %wide.load52, %wide.load54
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %110, i64 %index
  %127 = bitcast double* %126 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %127, align 8, !alias.scope !24
  %128 = getelementptr double, double* %126, i64 2
  %129 = bitcast double* %128 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %129, align 8, !alias.scope !24
  %130 = fadd <2 x double> %124, %wide.load55
  %131 = fadd <2 x double> %125, %wide.load56
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %index
  %133 = bitcast double* %132 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %133, align 8, !alias.scope !24
  %134 = getelementptr double, double* %132, i64 2
  %135 = bitcast double* %134 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %135, align 8, !alias.scope !24
  %136 = fsub <2 x double> %130, %wide.load57
  %137 = fsub <2 x double> %131, %wide.load58
  %138 = fmul <2 x double> %136, <double 7.000000e-01, double 7.000000e-01>
  %139 = fmul <2 x double> %137, <double 7.000000e-01, double 7.000000e-01>
  %140 = fsub <2 x double> %wide.load, %138
  %141 = fsub <2 x double> %wide.load50, %139
  store <2 x double> %140, <2 x double>* %112, align 8, !alias.scope !17, !noalias !20
  store <2 x double> %141, <2 x double>* %114, align 8, !alias.scope !17, !noalias !20
  %index.next = add nuw nsw i64 %index, 4
  %142 = icmp eq i64 %index.next, 1196
  br i1 %142, label %scalar.ph.preheader.loopexit, label %vector.body, !llvm.loop !25

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %scalar.ph.preheader.loopexit, %.preheader
  %indvars.iv22.ph = phi i64 [ 0, %.preheader ], [ 1196, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %scalar.ph ], [ %indvars.iv22.ph, %scalar.ph.preheader ]
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv22
  %144 = load double, double* %143, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv.next23
  %146 = load double, double* %145, align 8
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv22
  %148 = load double, double* %147, align 8
  %149 = fsub double %146, %148
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %110, i64 %indvars.iv22
  %151 = load double, double* %150, align 8
  %152 = fadd double %149, %151
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv22
  %154 = load double, double* %153, align 8
  %155 = fsub double %152, %154
  %156 = fmul double %155, 7.000000e-01
  %157 = fsub double %144, %156
  store double %157, double* %143, align 8
  %exitcond24 = icmp eq i64 %indvars.iv22, 1198
  br i1 %exitcond24, label %.loopexit, label %scalar.ph, !llvm.loop !26

.loopexit:                                        ; preds = %scalar.ph
  %exitcond130 = icmp eq i64 %110, 999
  br i1 %exitcond130, label %158, label %.preheader

; <label>:158:                                    ; preds = %.loopexit
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond131 = icmp eq i64 %indvars.iv.next28, 500
  br i1 %exitcond131, label %159, label %.preheader78

; <label>:159:                                    ; preds = %158
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader45

.preheader45:                                     ; preds = %21, %3
  %indvars.iv20 = phi i64 [ 0, %3 ], [ %indvars.iv.next21, %21 ]
  %8 = mul nuw nsw i64 %indvars.iv20, 1000
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader45
  %indvars.iv18 = phi i64 [ 0, %.preheader45 ], [ %indvars.iv.next19, %16 ]
  %10 = add nuw nsw i64 %indvars.iv18, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc43 = call i32 @fputc(i32 10, %struct._IO_FILE* %15) #4
  br label %16

; <label>:16:                                     ; preds = %9, %14
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv20, i64 %indvars.iv18
  %19 = load double, double* %18, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next19, 1200
  br i1 %exitcond25, label %21, label %9

; <label>:21:                                     ; preds = %16
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next21, 1000
  br i1 %exitcond26, label %22, label %.preheader45

; <label>:22:                                     ; preds = %21
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #4
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.preheader44

.preheader44:                                     ; preds = %42, %22
  %indvars.iv16 = phi i64 [ 0, %22 ], [ %indvars.iv.next17, %42 ]
  %29 = mul nuw nsw i64 %indvars.iv16, 1000
  br label %30

; <label>:30:                                     ; preds = %37, %.preheader44
  %indvars.iv14 = phi i64 [ 0, %.preheader44 ], [ %indvars.iv.next15, %37 ]
  %31 = add nuw nsw i64 %indvars.iv14, %29
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 20
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %30
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc40 = call i32 @fputc(i32 10, %struct._IO_FILE* %36) #4
  br label %37

; <label>:37:                                     ; preds = %30, %35
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv14
  %40 = load double, double* %39, align 8
  %41 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %40) #5
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond23, label %42, label %30

; <label>:42:                                     ; preds = %37
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond24, label %43, label %.preheader44

; <label>:43:                                     ; preds = %42
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %61, %43
  %indvars.iv12 = phi i64 [ 0, %43 ], [ %indvars.iv.next13, %61 ]
  %48 = mul nuw nsw i64 %indvars.iv12, 1000
  br label %49

; <label>:49:                                     ; preds = %56, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %56 ]
  %50 = add nuw nsw i64 %indvars.iv, %48
  %51 = trunc i64 %50 to i32
  %52 = srem i32 %51, 20
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %56

; <label>:54:                                     ; preds = %49
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %55) #4
  br label %56

; <label>:56:                                     ; preds = %49, %54
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv12, i64 %indvars.iv
  %59 = load double, double* %58, align 8
  %60 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %59) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %61, label %49

; <label>:61:                                     ; preds = %56
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next13, 1000
  br i1 %exitcond22, label %62, label %.preheader

; <label>:62:                                     ; preds = %61
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %64 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %63, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
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
