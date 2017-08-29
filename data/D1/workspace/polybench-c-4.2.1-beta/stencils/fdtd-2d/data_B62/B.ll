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
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  call void @print_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #3
  call void @free(i8* %4) #3
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.lr.ph5.preheader:
  br label %.lr.ph5

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %4 = trunc i64 %indvars.iv7 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv
  %11 = add nuw nsw i64 %indvars.iv, 2
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %7, %15
  %17 = fdiv <2 x double> %16, <double 1.000000e+03, double 1.200000e+03>
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  store double %18, double* %10, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %indvars.iv, 3
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = fmul double %5, %23
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv
  store double %25, double* %26, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond1, label %._crit_edge3, label %.preheader.us

.lr.ph5:                                          ; preds = %.lr.ph5, %.lr.ph5.preheader
  %indvars.iv10 = phi i64 [ 0, %.lr.ph5.preheader ], [ %indvars.iv.next11.4, %.lr.ph5 ]
  %27 = trunc i64 %indvars.iv10 to i32
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %3, i64 %indvars.iv10
  store double %28, double* %29, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %30 = trunc i64 %indvars.iv.next11 to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next11
  store double %31, double* %32, align 8
  %indvars.iv.next11.1 = add nsw i64 %indvars.iv10, 2
  %33 = trunc i64 %indvars.iv.next11.1 to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next11.1
  store double %34, double* %35, align 8
  %indvars.iv.next11.2 = add nsw i64 %indvars.iv10, 3
  %36 = trunc i64 %indvars.iv.next11.2 to i32
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next11.2
  store double %37, double* %38, align 8
  %indvars.iv.next11.3 = add nsw i64 %indvars.iv10, 4
  %39 = trunc i64 %indvars.iv.next11.3 to i32
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next11.3
  store double %40, double* %41, align 8
  %exitcond13.4 = icmp eq i64 %indvars.iv.next11.3, 499
  %indvars.iv.next11.4 = add nsw i64 %indvars.iv10, 5
  br i1 %exitcond13.4, label %.preheader.us.preheader, label %.lr.ph5

.preheader.us.preheader:                          ; preds = %.lr.ph5
  br label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.preheader6.lr.ph:
  %scevgep179 = getelementptr [1200 x double], [1200 x double]* %1, i64 1, i64 0
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge45, %.preheader6.lr.ph
  %indvars.iv75 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next76, %._crit_edge45 ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv75
  %5 = bitcast double* %4 to [1200 x double]*
  %bound0182 = icmp ugt [1200 x double]* %5, %1
  %bound1183 = icmp ult double* %4, %scevgep179
  %memcheck.conflict185 = and i1 %bound0182, %bound1183
  br i1 %memcheck.conflict185, label %scalar.ph176.preheader, label %vector.body174.preheader

vector.body174.preheader:                         ; preds = %.preheader6
  %6 = bitcast double* %4 to i64*
  %7 = bitcast double* %4 to i64*
  %8 = bitcast double* %4 to i64*
  %9 = bitcast double* %4 to i64*
  br label %vector.body174

scalar.ph176.preheader:                           ; preds = %.preheader6
  %10 = bitcast double* %4 to i64*
  %11 = bitcast double* %4 to i64*
  %12 = bitcast double* %4 to i64*
  %13 = bitcast double* %4 to i64*
  %14 = bitcast double* %4 to i64*
  %15 = bitcast double* %4 to i64*
  %16 = bitcast double* %4 to i64*
  %17 = bitcast double* %4 to i64*
  br label %scalar.ph176

vector.body174:                                   ; preds = %vector.body174, %vector.body174.preheader
  %index188 = phi i64 [ 0, %vector.body174.preheader ], [ %index.next189.3, %vector.body174 ]
  %18 = load i64, i64* %6, align 8, !alias.scope !1
  %19 = insertelement <2 x i64> undef, i64 %18, i32 0
  %20 = shufflevector <2 x i64> %19, <2 x i64> undef, <2 x i32> zeroinitializer
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index188
  %22 = bitcast double* %21 to <2 x i64>*
  store <2 x i64> %20, <2 x i64>* %22, align 8, !alias.scope !4, !noalias !1
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x i64>*
  store <2 x i64> %20, <2 x i64>* %24, align 8, !alias.scope !4, !noalias !1
  %index.next189 = or i64 %index188, 4
  %25 = load i64, i64* %7, align 8, !alias.scope !1
  %26 = insertelement <2 x i64> undef, i64 %25, i32 0
  %27 = shufflevector <2 x i64> %26, <2 x i64> undef, <2 x i32> zeroinitializer
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next189
  %29 = bitcast double* %28 to <2 x i64>*
  store <2 x i64> %27, <2 x i64>* %29, align 8, !alias.scope !4, !noalias !1
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x i64>*
  store <2 x i64> %27, <2 x i64>* %31, align 8, !alias.scope !4, !noalias !1
  %index.next189.1 = or i64 %index188, 8
  %32 = load i64, i64* %8, align 8, !alias.scope !1
  %33 = insertelement <2 x i64> undef, i64 %32, i32 0
  %34 = shufflevector <2 x i64> %33, <2 x i64> undef, <2 x i32> zeroinitializer
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next189.1
  %36 = bitcast double* %35 to <2 x i64>*
  store <2 x i64> %34, <2 x i64>* %36, align 8, !alias.scope !4, !noalias !1
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x i64>*
  store <2 x i64> %34, <2 x i64>* %38, align 8, !alias.scope !4, !noalias !1
  %index.next189.2 = or i64 %index188, 12
  %39 = load i64, i64* %9, align 8, !alias.scope !1
  %40 = insertelement <2 x i64> undef, i64 %39, i32 0
  %41 = shufflevector <2 x i64> %40, <2 x i64> undef, <2 x i32> zeroinitializer
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next189.2
  %43 = bitcast double* %42 to <2 x i64>*
  store <2 x i64> %41, <2 x i64>* %43, align 8, !alias.scope !4, !noalias !1
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x i64>*
  store <2 x i64> %41, <2 x i64>* %45, align 8, !alias.scope !4, !noalias !1
  %index.next189.3 = add nsw i64 %index188, 16
  %46 = icmp eq i64 %index.next189.3, 1200
  br i1 %46, label %.preheader2.us.preheader.loopexit2, label %vector.body174, !llvm.loop !6

.preheader2.us.preheader.loopexit:                ; preds = %scalar.ph176
  br label %.preheader2.us.preheader

.preheader2.us.preheader.loopexit2:               ; preds = %vector.body174
  br label %.preheader2.us.preheader

.preheader2.us.preheader:                         ; preds = %.preheader2.us.preheader.loopexit2, %.preheader2.us.preheader.loopexit
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge.us, %.preheader2.us.preheader
  %indvar = phi i64 [ %47, %._crit_edge.us ], [ 0, %.preheader2.us.preheader ]
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge.us ], [ 1, %.preheader2.us.preheader ]
  %47 = add nuw nsw i64 %indvar, 1
  %scevgep146 = getelementptr [1200 x double], [1200 x double]* %1, i64 %47, i64 0
  %48 = add nuw nsw i64 %indvar, 2
  %scevgep148 = getelementptr [1200 x double], [1200 x double]* %1, i64 %48, i64 0
  %scevgep150 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep152 = getelementptr [1200 x double], [1200 x double]* %2, i64 %48, i64 0
  %49 = add nsw i64 %indvars.iv59, -1
  %bound0154 = icmp ult double* %scevgep146, %scevgep152
  %bound1155 = icmp ult double* %scevgep150, %scevgep148
  %memcheck.conflict157 = and i1 %bound0154, %bound1155
  br i1 %memcheck.conflict157, label %scalar.ph143.preheader, label %vector.body141.preheader

vector.body141.preheader:                         ; preds = %.preheader2.us
  br label %vector.body141

scalar.ph143.preheader:                           ; preds = %.preheader2.us
  br label %scalar.ph143

vector.body141:                                   ; preds = %vector.body141.preheader, %vector.body141
  %index160 = phi i64 [ %index.next161, %vector.body141 ], [ 0, %vector.body141.preheader ]
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv59, i64 %index160
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load168 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !9, !noalias !12
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load169 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !9, !noalias !12
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv59, i64 %index160
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load170 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !12
  %56 = getelementptr double, double* %54, i64 2
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load171 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !12
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %49, i64 %index160
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load172 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !12
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load173 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !12
  %62 = fsub <2 x double> %wide.load170, %wide.load172
  %63 = fsub <2 x double> %wide.load171, %wide.load173
  %64 = fmul <2 x double> %62, <double 5.000000e-01, double 5.000000e-01>
  %65 = fmul <2 x double> %63, <double 5.000000e-01, double 5.000000e-01>
  %66 = fsub <2 x double> %wide.load168, %64
  %67 = fsub <2 x double> %wide.load169, %65
  store <2 x double> %66, <2 x double>* %51, align 8, !alias.scope !9, !noalias !12
  store <2 x double> %67, <2 x double>* %53, align 8, !alias.scope !9, !noalias !12
  %index.next161 = add nuw nsw i64 %index160, 4
  %68 = icmp eq i64 %index.next161, 1200
  br i1 %68, label %._crit_edge.us.loopexit1, label %vector.body141, !llvm.loop !14

scalar.ph143:                                     ; preds = %scalar.ph143, %scalar.ph143.preheader
  %indvars.iv55 = phi i64 [ 0, %scalar.ph143.preheader ], [ %indvars.iv.next56.1, %scalar.ph143 ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv59, i64 %indvars.iv55
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv59, i64 %indvars.iv55
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %49, i64 %indvars.iv55
  %74 = load double, double* %73, align 8
  %75 = fsub double %72, %74
  %76 = fmul double %75, 5.000000e-01
  %77 = fsub double %70, %76
  store double %77, double* %69, align 8
  %indvars.iv.next56 = or i64 %indvars.iv55, 1
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv59, i64 %indvars.iv.next56
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv59, i64 %indvars.iv.next56
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %49, i64 %indvars.iv.next56
  %83 = load double, double* %82, align 8
  %84 = fsub double %81, %83
  %85 = fmul double %84, 5.000000e-01
  %86 = fsub double %79, %85
  store double %86, double* %78, align 8
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56, 1199
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  br i1 %exitcond58.1, label %._crit_edge.us.loopexit, label %scalar.ph143, !llvm.loop !15

._crit_edge.us.loopexit:                          ; preds = %scalar.ph143
  br label %._crit_edge.us

._crit_edge.us.loopexit1:                         ; preds = %vector.body141
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit1, %._crit_edge.us.loopexit
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond3 = icmp eq i64 %47, 999
  br i1 %exitcond3, label %.preheader1.us.preheader, label %.preheader2.us

.preheader1.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader1.us

scalar.ph176:                                     ; preds = %scalar.ph176, %scalar.ph176.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph176.preheader ], [ %indvars.iv.next.7, %scalar.ph176 ]
  %87 = load i64, i64* %10, align 8
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %89 = bitcast double* %88 to i64*
  store i64 %87, i64* %89, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %90 = load i64, i64* %11, align 8
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %92 = bitcast double* %91 to i64*
  store i64 %90, i64* %92, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %93 = load i64, i64* %12, align 8
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %95 = bitcast double* %94 to i64*
  store i64 %93, i64* %95, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %96 = load i64, i64* %13, align 8
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %98 = bitcast double* %97 to i64*
  store i64 %96, i64* %98, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %99 = load i64, i64* %14, align 8
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %101 = bitcast double* %100 to i64*
  store i64 %99, i64* %101, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %102 = load i64, i64* %15, align 8
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %104 = bitcast double* %103 to i64*
  store i64 %102, i64* %104, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %105 = load i64, i64* %16, align 8
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %107 = bitcast double* %106 to i64*
  store i64 %105, i64* %107, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %108 = load i64, i64* %17, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.6, 1199
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  br i1 %exitcond.7, label %.preheader2.us.preheader.loopexit, label %scalar.ph176, !llvm.loop !16

.preheader1.us:                                   ; preds = %._crit_edge36.us, %.preheader1.us.preheader
  %indvars.iv66 = phi i64 [ %111, %._crit_edge36.us ], [ 0, %.preheader1.us.preheader ]
  %scevgep113 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv66, i64 1
  %111 = add nuw nsw i64 %indvars.iv66, 1
  %scevgep115 = getelementptr [1200 x double], [1200 x double]* %0, i64 %111, i64 0
  %scevgep117 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 0
  %scevgep119 = getelementptr [1200 x double], [1200 x double]* %2, i64 %111, i64 0
  %bound0121 = icmp ult double* %scevgep113, %scevgep119
  %bound1122 = icmp ult double* %scevgep117, %scevgep115
  %memcheck.conflict124 = and i1 %bound0121, %bound1122
  br i1 %memcheck.conflict124, label %scalar.ph110.preheader, label %vector.body108.preheader

vector.body108.preheader:                         ; preds = %.preheader1.us
  br label %vector.body108

vector.body108:                                   ; preds = %vector.body108.preheader, %vector.body108
  %index127 = phi i64 [ %index.next128, %vector.body108 ], [ 0, %vector.body108.preheader ]
  %offset.idx = or i64 %index127, 1
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv66, i64 %offset.idx
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !17, !noalias !20
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !17, !noalias !20
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 %offset.idx
  %117 = bitcast double* %116 to <2 x double>*
  %wide.load137 = load <2 x double>, <2 x double>* %117, align 8, !alias.scope !20
  %118 = getelementptr double, double* %116, i64 2
  %119 = bitcast double* %118 to <2 x double>*
  %wide.load138 = load <2 x double>, <2 x double>* %119, align 8, !alias.scope !20
  %120 = add nsw i64 %offset.idx, -1
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 %120
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load139 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !20
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load140 = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !20
  %125 = fsub <2 x double> %wide.load137, %wide.load139
  %126 = fsub <2 x double> %wide.load138, %wide.load140
  %127 = fmul <2 x double> %125, <double 5.000000e-01, double 5.000000e-01>
  %128 = fmul <2 x double> %126, <double 5.000000e-01, double 5.000000e-01>
  %129 = fsub <2 x double> %wide.load135, %127
  %130 = fsub <2 x double> %wide.load136, %128
  store <2 x double> %129, <2 x double>* %113, align 8, !alias.scope !17, !noalias !20
  store <2 x double> %130, <2 x double>* %115, align 8, !alias.scope !17, !noalias !20
  %index.next128 = add nuw nsw i64 %index127, 4
  %131 = icmp eq i64 %index.next128, 1196
  br i1 %131, label %scalar.ph110.preheader.loopexit, label %vector.body108, !llvm.loop !22

scalar.ph110.preheader.loopexit:                  ; preds = %vector.body108
  br label %scalar.ph110.preheader

scalar.ph110.preheader:                           ; preds = %scalar.ph110.preheader.loopexit, %.preheader1.us
  %indvars.iv62.ph = phi i64 [ 1, %.preheader1.us ], [ 1197, %scalar.ph110.preheader.loopexit ]
  br i1 true, label %scalar.ph110.prol.preheader, label %scalar.ph110.prol.loopexit.unr-lcssa

scalar.ph110.prol.preheader:                      ; preds = %scalar.ph110.preheader
  br label %scalar.ph110.prol

scalar.ph110.prol:                                ; preds = %scalar.ph110.prol.preheader
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv62.ph
  %133 = load double, double* %132, align 8
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 %indvars.iv62.ph
  %135 = load double, double* %134, align 8
  %136 = add nsw i64 %indvars.iv62.ph, -1
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 %136
  %138 = load double, double* %137, align 8
  %139 = fsub double %135, %138
  %140 = fmul double %139, 5.000000e-01
  %141 = fsub double %133, %140
  store double %141, double* %132, align 8
  %indvars.iv.next63.prol = add nuw nsw i64 %indvars.iv62.ph, 1
  br label %scalar.ph110.prol.loopexit.unr-lcssa

scalar.ph110.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph110.preheader, %scalar.ph110.prol
  %indvars.iv62.unr.ph = phi i64 [ %indvars.iv.next63.prol, %scalar.ph110.prol ], [ %indvars.iv62.ph, %scalar.ph110.preheader ]
  br label %scalar.ph110.prol.loopexit

scalar.ph110.prol.loopexit:                       ; preds = %scalar.ph110.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge36.us, label %scalar.ph110.preheader.new

scalar.ph110.preheader.new:                       ; preds = %scalar.ph110.prol.loopexit
  br label %scalar.ph110

scalar.ph110:                                     ; preds = %scalar.ph110, %scalar.ph110.preheader.new
  %indvars.iv62 = phi i64 [ %indvars.iv62.unr.ph, %scalar.ph110.preheader.new ], [ %indvars.iv.next63.1, %scalar.ph110 ]
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv62
  %143 = load double, double* %142, align 8
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 %indvars.iv62
  %145 = load double, double* %144, align 8
  %146 = add nsw i64 %indvars.iv62, -1
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 %146
  %148 = load double, double* %147, align 8
  %149 = fsub double %145, %148
  %150 = fmul double %149, 5.000000e-01
  %151 = fsub double %143, %150
  store double %151, double* %142, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv.next63
  %153 = load double, double* %152, align 8
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 %indvars.iv.next63
  %155 = load double, double* %154, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 %indvars.iv62
  %157 = load double, double* %156, align 8
  %158 = fsub double %155, %157
  %159 = fmul double %158, 5.000000e-01
  %160 = fsub double %153, %159
  store double %160, double* %152, align 8
  %exitcond65.1 = icmp eq i64 %indvars.iv.next63, 1199
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  br i1 %exitcond65.1, label %._crit_edge36.us.unr-lcssa, label %scalar.ph110, !llvm.loop !23

._crit_edge36.us.unr-lcssa:                       ; preds = %scalar.ph110
  br label %._crit_edge36.us

._crit_edge36.us:                                 ; preds = %scalar.ph110.prol.loopexit, %._crit_edge36.us.unr-lcssa
  %exitcond4 = icmp eq i64 %111, 1000
  br i1 %exitcond4, label %.preheader.us.preheader, label %.preheader1.us

.preheader.us.preheader:                          ; preds = %._crit_edge36.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge44.us, %.preheader.us.preheader
  %indvars.iv73 = phi i64 [ %161, %._crit_edge44.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv73, i64 0
  %scevgep85 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv73, i64 1199
  %scevgep87 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv73, i64 0
  %161 = add nuw nsw i64 %indvars.iv73, 1
  %scevgep89 = getelementptr [1200 x double], [1200 x double]* %0, i64 %161, i64 0
  %scevgep91 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv73, i64 0
  %scevgep93 = getelementptr [1200 x double], [1200 x double]* %1, i64 %161, i64 1199
  %bound0 = icmp ult double* %scevgep, %scevgep89
  %bound1 = icmp ult double* %scevgep87, %scevgep85
  %found.conflict = and i1 %bound0, %bound1
  %bound095 = icmp ult double* %scevgep, %scevgep93
  %bound196 = icmp ult double* %scevgep91, %scevgep85
  %found.conflict97 = and i1 %bound095, %bound196
  %conflict.rdx = or i1 %found.conflict, %found.conflict97
  br i1 %conflict.rdx, label %._crit_edge53.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv73, i64 %index
  %163 = bitcast double* %162 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %163, align 8, !alias.scope !24, !noalias !27
  %164 = getelementptr double, double* %162, i64 2
  %165 = bitcast double* %164 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %165, align 8, !alias.scope !24, !noalias !27
  %166 = or i64 %index, 1
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv73, i64 %166
  %168 = bitcast double* %167 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %168, align 8, !alias.scope !30
  %169 = getelementptr double, double* %167, i64 2
  %170 = bitcast double* %169 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %170, align 8, !alias.scope !30
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv73, i64 %index
  %172 = bitcast double* %171 to <2 x double>*
  %wide.load102 = load <2 x double>, <2 x double>* %172, align 8, !alias.scope !30
  %173 = getelementptr double, double* %171, i64 2
  %174 = bitcast double* %173 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %174, align 8, !alias.scope !30
  %175 = fsub <2 x double> %wide.load100, %wide.load102
  %176 = fsub <2 x double> %wide.load101, %wide.load103
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %161, i64 %index
  %178 = bitcast double* %177 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %178, align 8, !alias.scope !31
  %179 = getelementptr double, double* %177, i64 2
  %180 = bitcast double* %179 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %180, align 8, !alias.scope !31
  %181 = fadd <2 x double> %175, %wide.load104
  %182 = fadd <2 x double> %176, %wide.load105
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv73, i64 %index
  %184 = bitcast double* %183 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %184, align 8, !alias.scope !31
  %185 = getelementptr double, double* %183, i64 2
  %186 = bitcast double* %185 to <2 x double>*
  %wide.load107 = load <2 x double>, <2 x double>* %186, align 8, !alias.scope !31
  %187 = fsub <2 x double> %181, %wide.load106
  %188 = fsub <2 x double> %182, %wide.load107
  %189 = fmul <2 x double> %187, <double 7.000000e-01, double 7.000000e-01>
  %190 = fmul <2 x double> %188, <double 7.000000e-01, double 7.000000e-01>
  %191 = fsub <2 x double> %wide.load, %189
  %192 = fsub <2 x double> %wide.load99, %190
  store <2 x double> %191, <2 x double>* %163, align 8, !alias.scope !24, !noalias !27
  store <2 x double> %192, <2 x double>* %165, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %193 = icmp eq i64 %index.next, 1196
  br i1 %193, label %._crit_edge53.preheader.loopexit, label %vector.body, !llvm.loop !32

._crit_edge53.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge53.preheader

._crit_edge53.preheader:                          ; preds = %._crit_edge53.preheader.loopexit, %.preheader.us
  %indvars.iv69.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %._crit_edge53.preheader.loopexit ]
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge53.preheader, %._crit_edge53
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %._crit_edge53 ], [ %indvars.iv69.ph, %._crit_edge53.preheader ]
  %194 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv73, i64 %indvars.iv69
  %195 = load double, double* %194, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %196 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv73, i64 %indvars.iv.next70
  %197 = load double, double* %196, align 8
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv73, i64 %indvars.iv69
  %199 = load double, double* %198, align 8
  %200 = fsub double %197, %199
  %201 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %161, i64 %indvars.iv69
  %202 = load double, double* %201, align 8
  %203 = fadd double %200, %202
  %204 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv73, i64 %indvars.iv69
  %205 = load double, double* %204, align 8
  %206 = fsub double %203, %205
  %207 = fmul double %206, 7.000000e-01
  %208 = fsub double %195, %207
  store double %208, double* %194, align 8
  %exitcond72 = icmp eq i64 %indvars.iv69, 1198
  br i1 %exitcond72, label %._crit_edge44.us, label %._crit_edge53, !llvm.loop !33

._crit_edge44.us:                                 ; preds = %._crit_edge53
  %exitcond5 = icmp eq i64 %161, 999
  br i1 %exitcond5, label %._crit_edge45, label %.preheader.us

._crit_edge45:                                    ; preds = %._crit_edge44.us
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next76, 500
  br i1 %exitcond6, label %._crit_edge47, label %.preheader6

._crit_edge47:                                    ; preds = %._crit_edge45
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader2.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge8.us, %.preheader2.us.preheader
  %indvars.iv33 = phi i64 [ 0, %.preheader2.us.preheader ], [ %indvars.iv.next34, %._crit_edge8.us ]
  %7 = mul nuw nsw i64 %indvars.iv33, 1000
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge, %.preheader2.us
  %indvars.iv31 = phi i64 [ 0, %.preheader2.us ], [ %indvars.iv.next32, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv31, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge19
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc15 = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge19, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv31
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next32, 1200
  br i1 %exitcond4, label %._crit_edge8.us, label %._crit_edge19

._crit_edge8.us:                                  ; preds = %._crit_edge
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next34, 1000
  br i1 %exitcond5, label %._crit_edge9, label %.preheader2.us

._crit_edge9:                                     ; preds = %._crit_edge8.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %._crit_edge5.us, %._crit_edge9
  %indvars.iv28 = phi i64 [ 0, %._crit_edge9 ], [ %indvars.iv.next29, %._crit_edge5.us ]
  %24 = mul nuw nsw i64 %indvars.iv28, 1000
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge20, %.preheader1.us
  %indvars.iv26 = phi i64 [ 0, %.preheader1.us ], [ %indvars.iv.next27, %._crit_edge20 ]
  %25 = add nuw nsw i64 %indvars.iv26, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge20

; <label>:29:                                     ; preds = %._crit_edge21
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc12 = call i32 @fputc(i32 10, %struct._IO_FILE* %30) #4
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge21, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv26
  %33 = load double, double* %32, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #5
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next27, 1200
  br i1 %exitcond2, label %._crit_edge5.us, label %._crit_edge21

._crit_edge5.us:                                  ; preds = %._crit_edge20
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next29, 1000
  br i1 %exitcond3, label %._crit_edge6, label %.preheader1.us

._crit_edge6:                                     ; preds = %._crit_edge5.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge6
  %indvars.iv24 = phi i64 [ 0, %._crit_edge6 ], [ %indvars.iv.next25, %._crit_edge.us ]
  %39 = mul nuw nsw i64 %indvars.iv24, 1000
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge22, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge22 ]
  %40 = add nuw nsw i64 %indvars.iv, %39
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge22

; <label>:44:                                     ; preds = %._crit_edge23
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %45) #4
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge23, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv24, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge23

._crit_edge.us:                                   ; preds = %._crit_edge22
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next25, 1000
  br i1 %exitcond1, label %._crit_edge3, label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
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
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !7, !8}
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
