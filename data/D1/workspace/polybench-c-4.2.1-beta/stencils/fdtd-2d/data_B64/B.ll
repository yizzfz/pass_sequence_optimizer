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
  %16 = bitcast i8* %5 to [1200 x double]*
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %3 to [1200 x double]*
  tail call void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
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
.lr.ph9:
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16, %.lr.ph9
  %indvars.iv21 = phi i64 [ 0, %.lr.ph9 ], [ %indvars.iv.next22.4, %._crit_edge16 ]
  %4 = trunc i64 %indvars.iv21 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv21
  store double %5, double* %6, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %7 = trunc i64 %indvars.iv.next22 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next22
  store double %8, double* %9, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %10 = trunc i64 %indvars.iv.next22.1 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next22.1
  store double %11, double* %12, align 8
  %indvars.iv.next22.2 = add nsw i64 %indvars.iv21, 3
  %13 = trunc i64 %indvars.iv.next22.2 to i32
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next22.2
  store double %14, double* %15, align 8
  %indvars.iv.next22.3 = add nsw i64 %indvars.iv21, 4
  %16 = trunc i64 %indvars.iv.next22.3 to i32
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next22.3
  store double %17, double* %18, align 8
  %indvars.iv.next22.4 = add nsw i64 %indvars.iv21, 5
  %exitcond2.4 = icmp eq i64 %indvars.iv.next22.4, 500
  br i1 %exitcond2.4, label %.lr.ph3.split.us.preheader, label %._crit_edge16

.lr.ph3.split.us.preheader:                       ; preds = %._crit_edge16
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3.split.us.preheader
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge.us ], [ 0, %.lr.ph3.split.us.preheader ]
  %19 = trunc i64 %indvars.iv19 to i32
  %20 = sitofp i32 %19 to double
  %21 = insertelement <2 x double> undef, double %20, i32 0
  %22 = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph3.split.us ], [ %indvars.iv.next, %._crit_edge18 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %23 = trunc i64 %indvars.iv.next to i32
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv19, i64 %indvars.iv
  %26 = add nuw nsw i64 %indvars.iv, 2
  %27 = trunc i64 %26 to i32
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %24, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fmul <2 x double> %22, %30
  %32 = fdiv <2 x double> %31, <double 1.000000e+03, double 1.200000e+03>
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  store double %33, double* %25, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv19, i64 %indvars.iv
  store double %34, double* %35, align 8
  %36 = add nuw nsw i64 %indvars.iv, 3
  %37 = trunc i64 %36 to i32
  %38 = sitofp i32 %37 to double
  %39 = fmul double %20, %38
  %40 = fdiv double %39, 1.000000e+03
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv
  store double %40, double* %41, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge18

._crit_edge.us:                                   ; preds = %._crit_edge18
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond1, label %._crit_edge17, label %.lr.ph3.split.us

._crit_edge17:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.lr.ph38:
  %scevgep179 = getelementptr [1200 x double], [1200 x double]* %1, i64 1, i64 0
  br label %._crit_edge32._crit_edge

._crit_edge32._crit_edge:                         ; preds = %._crit_edge32, %.lr.ph38
  %indvars.iv75 = phi i64 [ 0, %.lr.ph38 ], [ %indvars.iv.next76, %._crit_edge32 ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv75
  %5 = bitcast double* %4 to [1200 x double]*
  %bound0182 = icmp ugt [1200 x double]* %5, %1
  %bound1183 = icmp ult double* %4, %scevgep179
  %memcheck.conflict185 = and i1 %bound0182, %bound1183
  br i1 %memcheck.conflict185, label %scalar.ph176.preheader, label %vector.body174.preheader

vector.body174.preheader:                         ; preds = %._crit_edge32._crit_edge
  %6 = bitcast double* %4 to i64*
  %7 = bitcast double* %4 to i64*
  %8 = bitcast double* %4 to i64*
  br label %vector.body174

scalar.ph176.preheader:                           ; preds = %._crit_edge32._crit_edge
  %9 = bitcast double* %4 to i64*
  %10 = bitcast double* %4 to i64*
  %11 = bitcast double* %4 to i64*
  %12 = bitcast double* %4 to i64*
  %13 = bitcast double* %4 to i64*
  %14 = bitcast double* %4 to i64*
  %15 = bitcast double* %4 to i64*
  %16 = bitcast double* %4 to i64*
  br label %scalar.ph176

vector.body174:                                   ; preds = %vector.body174, %vector.body174.preheader
  %index188 = phi i64 [ 0, %vector.body174.preheader ], [ %index.next189.2, %vector.body174 ]
  %17 = load i64, i64* %6, align 8, !alias.scope !1
  %18 = insertelement <2 x i64> undef, i64 %17, i32 0
  %19 = shufflevector <2 x i64> %18, <2 x i64> undef, <2 x i32> zeroinitializer
  %20 = insertelement <2 x i64> undef, i64 %17, i32 0
  %21 = shufflevector <2 x i64> %20, <2 x i64> undef, <2 x i32> zeroinitializer
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index188
  %23 = bitcast double* %22 to <2 x i64>*
  store <2 x i64> %19, <2 x i64>* %23, align 8, !alias.scope !4, !noalias !1
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x i64>*
  store <2 x i64> %21, <2 x i64>* %25, align 8, !alias.scope !4, !noalias !1
  %index.next189 = add nuw nsw i64 %index188, 4
  %26 = load i64, i64* %7, align 8, !alias.scope !1
  %27 = insertelement <2 x i64> undef, i64 %26, i32 0
  %28 = shufflevector <2 x i64> %27, <2 x i64> undef, <2 x i32> zeroinitializer
  %29 = insertelement <2 x i64> undef, i64 %26, i32 0
  %30 = shufflevector <2 x i64> %29, <2 x i64> undef, <2 x i32> zeroinitializer
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next189
  %32 = bitcast double* %31 to <2 x i64>*
  store <2 x i64> %28, <2 x i64>* %32, align 8, !alias.scope !4, !noalias !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x i64>*
  store <2 x i64> %30, <2 x i64>* %34, align 8, !alias.scope !4, !noalias !1
  %index.next189.1 = add nsw i64 %index188, 8
  %35 = load i64, i64* %8, align 8, !alias.scope !1
  %36 = insertelement <2 x i64> undef, i64 %35, i32 0
  %37 = shufflevector <2 x i64> %36, <2 x i64> undef, <2 x i32> zeroinitializer
  %38 = insertelement <2 x i64> undef, i64 %35, i32 0
  %39 = shufflevector <2 x i64> %38, <2 x i64> undef, <2 x i32> zeroinitializer
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next189.1
  %41 = bitcast double* %40 to <2 x i64>*
  store <2 x i64> %37, <2 x i64>* %41, align 8, !alias.scope !4, !noalias !1
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x i64>*
  store <2 x i64> %39, <2 x i64>* %43, align 8, !alias.scope !4, !noalias !1
  %index.next189.2 = add nsw i64 %index188, 12
  %44 = icmp eq i64 %index.next189.2, 1200
  br i1 %44, label %.lr.ph7.split.us.preheader.loopexit2, label %vector.body174, !llvm.loop !6

scalar.ph176:                                     ; preds = %scalar.ph176, %scalar.ph176.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph176.preheader ], [ %indvars.iv.next.7, %scalar.ph176 ]
  %45 = load i64, i64* %9, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %47 = bitcast double* %46 to i64*
  store i64 %45, i64* %47, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %48 = load i64, i64* %10, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %50 = bitcast double* %49 to i64*
  store i64 %48, i64* %50, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %51 = load i64, i64* %11, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %53 = bitcast double* %52 to i64*
  store i64 %51, i64* %53, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %54 = load i64, i64* %12, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %56 = bitcast double* %55 to i64*
  store i64 %54, i64* %56, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %57 = load i64, i64* %13, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %59 = bitcast double* %58 to i64*
  store i64 %57, i64* %59, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %60 = load i64, i64* %14, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %63 = load i64, i64* %15, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %65 = bitcast double* %64 to i64*
  store i64 %63, i64* %65, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %66 = load i64, i64* %16, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %68 = bitcast double* %67 to i64*
  store i64 %66, i64* %68, align 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.6, 1199
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  br i1 %exitcond.7, label %.lr.ph7.split.us.preheader.loopexit, label %scalar.ph176, !llvm.loop !9

.lr.ph7.split.us.preheader.loopexit:              ; preds = %scalar.ph176
  br label %.lr.ph7.split.us.preheader

.lr.ph7.split.us.preheader.loopexit2:             ; preds = %vector.body174
  br label %.lr.ph7.split.us.preheader

.lr.ph7.split.us.preheader:                       ; preds = %.lr.ph7.split.us.preheader.loopexit2, %.lr.ph7.split.us.preheader.loopexit
  br label %.lr.ph7.split.us

.lr.ph7.split.us:                                 ; preds = %._crit_edge3.us, %.lr.ph7.split.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge3.us ], [ 0, %.lr.ph7.split.us.preheader ]
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge3.us ], [ 1, %.lr.ph7.split.us.preheader ]
  %69 = add nuw nsw i64 %indvar, 1
  %scevgep146 = getelementptr [1200 x double], [1200 x double]* %1, i64 %69, i64 0
  %70 = add nuw nsw i64 %indvar, 2
  %scevgep148 = getelementptr [1200 x double], [1200 x double]* %1, i64 %70, i64 0
  %scevgep150 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep152 = getelementptr [1200 x double], [1200 x double]* %2, i64 %70, i64 0
  %71 = add nsw i64 %indvars.iv61, -1
  %bound0154 = icmp ult double* %scevgep146, %scevgep152
  %bound1155 = icmp ult double* %scevgep150, %scevgep148
  %memcheck.conflict157 = and i1 %bound0154, %bound1155
  br i1 %memcheck.conflict157, label %scalar.ph143.preheader, label %vector.body141.preheader

vector.body141.preheader:                         ; preds = %.lr.ph7.split.us
  br label %vector.body141

scalar.ph143.preheader:                           ; preds = %.lr.ph7.split.us
  br label %scalar.ph143

vector.body141:                                   ; preds = %vector.body141.preheader, %vector.body141
  %index160 = phi i64 [ %index.next161, %vector.body141 ], [ 0, %vector.body141.preheader ]
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv61, i64 %index160
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load168 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !10, !noalias !13
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load169 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10, !noalias !13
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv61, i64 %index160
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load170 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !13
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load171 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !13
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %71, i64 %index160
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load172 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !13
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load173 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !13
  %84 = fsub <2 x double> %wide.load170, %wide.load172
  %85 = fsub <2 x double> %wide.load171, %wide.load173
  %86 = fmul <2 x double> %84, <double 5.000000e-01, double 5.000000e-01>
  %87 = fmul <2 x double> %85, <double 5.000000e-01, double 5.000000e-01>
  %88 = fsub <2 x double> %wide.load168, %86
  %89 = fsub <2 x double> %wide.load169, %87
  %90 = bitcast double* %72 to <2 x double>*
  store <2 x double> %88, <2 x double>* %90, align 8, !alias.scope !10, !noalias !13
  %91 = bitcast double* %74 to <2 x double>*
  store <2 x double> %89, <2 x double>* %91, align 8, !alias.scope !10, !noalias !13
  %index.next161 = add nuw nsw i64 %index160, 4
  %92 = icmp eq i64 %index.next161, 1200
  br i1 %92, label %._crit_edge3.us.loopexit1, label %vector.body141, !llvm.loop !15

scalar.ph143:                                     ; preds = %scalar.ph143, %scalar.ph143.preheader
  %indvars.iv57 = phi i64 [ 0, %scalar.ph143.preheader ], [ %indvars.iv.next58.1, %scalar.ph143 ]
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv61, i64 %indvars.iv57
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv61, i64 %indvars.iv57
  %96 = load double, double* %95, align 8
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %71, i64 %indvars.iv57
  %98 = load double, double* %97, align 8
  %99 = fsub double %96, %98
  %100 = fmul double %99, 5.000000e-01
  %101 = fsub double %94, %100
  store double %101, double* %93, align 8
  %indvars.iv.next58 = or i64 %indvars.iv57, 1
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv61, i64 %indvars.iv.next58
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv61, i64 %indvars.iv.next58
  %105 = load double, double* %104, align 8
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %71, i64 %indvars.iv.next58
  %107 = load double, double* %106, align 8
  %108 = fsub double %105, %107
  %109 = fmul double %108, 5.000000e-01
  %110 = fsub double %103, %109
  store double %110, double* %102, align 8
  %exitcond60.1 = icmp eq i64 %indvars.iv.next58, 1199
  %indvars.iv.next58.1 = add nsw i64 %indvars.iv57, 2
  br i1 %exitcond60.1, label %._crit_edge3.us.loopexit, label %scalar.ph143, !llvm.loop !16

._crit_edge3.us.loopexit:                         ; preds = %scalar.ph143
  br label %._crit_edge3.us

._crit_edge3.us.loopexit1:                        ; preds = %vector.body141
  br label %._crit_edge3.us

._crit_edge3.us:                                  ; preds = %._crit_edge3.us.loopexit1, %._crit_edge3.us.loopexit
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond3 = icmp eq i64 %indvar.next, 999
  br i1 %exitcond3, label %.lr.ph19.split.us.preheader, label %.lr.ph7.split.us

.lr.ph19.split.us.preheader:                      ; preds = %._crit_edge3.us
  br label %.lr.ph19.split.us

.lr.ph19.split.us:                                ; preds = %._crit_edge15.us, %.lr.ph19.split.us.preheader
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge15.us ], [ 0, %.lr.ph19.split.us.preheader ]
  %scevgep113 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv66, i64 1
  %111 = add nuw nsw i64 %indvars.iv66, 1
  %scevgep115 = getelementptr [1200 x double], [1200 x double]* %0, i64 %111, i64 0
  %scevgep117 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 0
  %scevgep119 = getelementptr [1200 x double], [1200 x double]* %2, i64 %111, i64 0
  %bound0121 = icmp ult double* %scevgep113, %scevgep119
  %bound1122 = icmp ult double* %scevgep117, %scevgep115
  %memcheck.conflict124 = and i1 %bound0121, %bound1122
  br i1 %memcheck.conflict124, label %._crit_edge54.preheader, label %vector.body108.preheader

vector.body108.preheader:                         ; preds = %.lr.ph19.split.us
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
  %131 = bitcast double* %112 to <2 x double>*
  store <2 x double> %129, <2 x double>* %131, align 8, !alias.scope !17, !noalias !20
  %132 = bitcast double* %114 to <2 x double>*
  store <2 x double> %130, <2 x double>* %132, align 8, !alias.scope !17, !noalias !20
  %index.next128 = add nuw nsw i64 %index127, 4
  %133 = icmp eq i64 %index.next128, 1196
  br i1 %133, label %._crit_edge54.preheader.loopexit, label %vector.body108, !llvm.loop !22

._crit_edge54.preheader.loopexit:                 ; preds = %vector.body108
  br label %._crit_edge54.preheader

._crit_edge54.preheader:                          ; preds = %._crit_edge54.preheader.loopexit, %.lr.ph19.split.us
  %indvars.iv64.ph = phi i64 [ 1, %.lr.ph19.split.us ], [ 1197, %._crit_edge54.preheader.loopexit ]
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.preheader, %._crit_edge54
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge54 ], [ %indvars.iv64.ph, %._crit_edge54.preheader ]
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv64
  %135 = load double, double* %134, align 8
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 %indvars.iv64
  %137 = load double, double* %136, align 8
  %138 = add nsw i64 %indvars.iv64, -1
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 %138
  %140 = load double, double* %139, align 8
  %141 = fsub double %137, %140
  %142 = fmul double %141, 5.000000e-01
  %143 = fsub double %135, %142
  store double %143, double* %134, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %144 = icmp slt i64 %indvars.iv.next65, 1200
  br i1 %144, label %._crit_edge54, label %._crit_edge15.us, !llvm.loop !23

._crit_edge15.us:                                 ; preds = %._crit_edge54
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next67, 1000
  br i1 %exitcond4, label %.lr.ph31.split.us.preheader, label %.lr.ph19.split.us

.lr.ph31.split.us.preheader:                      ; preds = %._crit_edge15.us
  br label %.lr.ph31.split.us

.lr.ph31.split.us:                                ; preds = %._crit_edge27.us, %.lr.ph31.split.us.preheader
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %._crit_edge27.us ], [ 0, %.lr.ph31.split.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv73, i64 0
  %scevgep85 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv73, i64 1199
  %scevgep87 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv73, i64 0
  %145 = add nuw nsw i64 %indvars.iv73, 1
  %scevgep89 = getelementptr [1200 x double], [1200 x double]* %0, i64 %145, i64 0
  %scevgep91 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv73, i64 0
  %scevgep93 = getelementptr [1200 x double], [1200 x double]* %1, i64 %145, i64 1199
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %bound0 = icmp ult double* %scevgep, %scevgep89
  %bound1 = icmp ult double* %scevgep87, %scevgep85
  %found.conflict = and i1 %bound0, %bound1
  %bound095 = icmp ult double* %scevgep, %scevgep93
  %bound196 = icmp ult double* %scevgep91, %scevgep85
  %found.conflict97 = and i1 %bound095, %bound196
  %conflict.rdx = or i1 %found.conflict, %found.conflict97
  br i1 %conflict.rdx, label %._crit_edge55.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph31.split.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv73, i64 %index
  %147 = bitcast double* %146 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %147, align 8, !alias.scope !24, !noalias !27
  %148 = getelementptr double, double* %146, i64 2
  %149 = bitcast double* %148 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %149, align 8, !alias.scope !24, !noalias !27
  %150 = or i64 %index, 1
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv73, i64 %150
  %152 = bitcast double* %151 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %152, align 8, !alias.scope !30
  %153 = getelementptr double, double* %151, i64 2
  %154 = bitcast double* %153 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %154, align 8, !alias.scope !30
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv73, i64 %index
  %156 = bitcast double* %155 to <2 x double>*
  %wide.load102 = load <2 x double>, <2 x double>* %156, align 8, !alias.scope !30
  %157 = getelementptr double, double* %155, i64 2
  %158 = bitcast double* %157 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %158, align 8, !alias.scope !30
  %159 = fsub <2 x double> %wide.load100, %wide.load102
  %160 = fsub <2 x double> %wide.load101, %wide.load103
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next74, i64 %index
  %162 = bitcast double* %161 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %162, align 8, !alias.scope !31
  %163 = getelementptr double, double* %161, i64 2
  %164 = bitcast double* %163 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %164, align 8, !alias.scope !31
  %165 = fadd <2 x double> %159, %wide.load104
  %166 = fadd <2 x double> %160, %wide.load105
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv73, i64 %index
  %168 = bitcast double* %167 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %168, align 8, !alias.scope !31
  %169 = getelementptr double, double* %167, i64 2
  %170 = bitcast double* %169 to <2 x double>*
  %wide.load107 = load <2 x double>, <2 x double>* %170, align 8, !alias.scope !31
  %171 = fsub <2 x double> %165, %wide.load106
  %172 = fsub <2 x double> %166, %wide.load107
  %173 = fmul <2 x double> %171, <double 7.000000e-01, double 7.000000e-01>
  %174 = fmul <2 x double> %172, <double 7.000000e-01, double 7.000000e-01>
  %175 = fsub <2 x double> %wide.load, %173
  %176 = fsub <2 x double> %wide.load99, %174
  %177 = bitcast double* %146 to <2 x double>*
  store <2 x double> %175, <2 x double>* %177, align 8, !alias.scope !24, !noalias !27
  %178 = bitcast double* %148 to <2 x double>*
  store <2 x double> %176, <2 x double>* %178, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %179 = icmp eq i64 %index.next, 1196
  br i1 %179, label %._crit_edge55.preheader.loopexit, label %vector.body, !llvm.loop !32

._crit_edge55.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge55.preheader

._crit_edge55.preheader:                          ; preds = %._crit_edge55.preheader.loopexit, %.lr.ph31.split.us
  %indvars.iv69.ph = phi i64 [ 0, %.lr.ph31.split.us ], [ 1196, %._crit_edge55.preheader.loopexit ]
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.preheader, %._crit_edge55
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %._crit_edge55 ], [ %indvars.iv69.ph, %._crit_edge55.preheader ]
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv73, i64 %indvars.iv69
  %181 = load double, double* %180, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv73, i64 %indvars.iv.next70
  %183 = load double, double* %182, align 8
  %184 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv73, i64 %indvars.iv69
  %185 = load double, double* %184, align 8
  %186 = fsub double %183, %185
  %187 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next74, i64 %indvars.iv69
  %188 = load double, double* %187, align 8
  %189 = fadd double %186, %188
  %190 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv73, i64 %indvars.iv69
  %191 = load double, double* %190, align 8
  %192 = fsub double %189, %191
  %193 = fmul double %192, 7.000000e-01
  %194 = fsub double %181, %193
  store double %194, double* %180, align 8
  %exitcond72 = icmp eq i64 %indvars.iv69, 1198
  br i1 %exitcond72, label %._crit_edge27.us, label %._crit_edge55, !llvm.loop !33

._crit_edge27.us:                                 ; preds = %._crit_edge55
  %exitcond5 = icmp eq i64 %indvars.iv.next74, 999
  br i1 %exitcond5, label %._crit_edge32, label %.lr.ph31.split.us

._crit_edge32:                                    ; preds = %._crit_edge27.us
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next76, 500
  br i1 %exitcond6, label %._crit_edge51, label %._crit_edge32._crit_edge

._crit_edge51:                                    ; preds = %._crit_edge32
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.lr.ph30.split.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %._crit_edge25.us, %.lr.ph30.split.us.preheader
  %indvars.iv67 = phi i64 [ 0, %.lr.ph30.split.us.preheader ], [ %indvars.iv.next68, %._crit_edge25.us ]
  %7 = mul nuw nsw i64 %indvars.iv67, 1000
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge50, %.lr.ph30.split.us
  %indvars.iv65 = phi i64 [ 0, %.lr.ph30.split.us ], [ %indvars.iv.next66, %._crit_edge50 ]
  %8 = add nuw nsw i64 %7, %indvars.iv65
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge50

; <label>:12:                                     ; preds = %._crit_edge51
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc41 = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge51, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv67, i64 %indvars.iv65
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next66, 1200
  br i1 %exitcond4, label %._crit_edge25.us, label %._crit_edge51

._crit_edge25.us:                                 ; preds = %._crit_edge50
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next68, 1000
  br i1 %exitcond5, label %._crit_edge, label %.lr.ph30.split.us

._crit_edge:                                      ; preds = %._crit_edge25.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.lr.ph17.split.us

.lr.ph17.split.us:                                ; preds = %._crit_edge12.us, %._crit_edge
  %indvars.iv62 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next63, %._crit_edge12.us ]
  %24 = mul nuw nsw i64 %indvars.iv62, 1000
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge53, %.lr.ph17.split.us
  %indvars.iv60 = phi i64 [ 0, %.lr.ph17.split.us ], [ %indvars.iv.next61, %._crit_edge53 ]
  %25 = add nuw nsw i64 %24, %indvars.iv60
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge53

; <label>:29:                                     ; preds = %._crit_edge54
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc38 = call i32 @fputc(i32 10, %struct._IO_FILE* %30) #4
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge54, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv60
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #5
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next61, 1200
  br i1 %exitcond2, label %._crit_edge12.us, label %._crit_edge54

._crit_edge12.us:                                 ; preds = %._crit_edge53
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next63, 1000
  br i1 %exitcond3, label %._crit_edge52, label %.lr.ph17.split.us

._crit_edge52:                                    ; preds = %._crit_edge12.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge.us, %._crit_edge52
  %indvars.iv58 = phi i64 [ 0, %._crit_edge52 ], [ %indvars.iv.next59, %._crit_edge.us ]
  %39 = mul nuw nsw i64 %indvars.iv58, 1000
  br label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge56, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %._crit_edge56 ]
  %40 = add nuw nsw i64 %39, %indvars.iv
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge56

; <label>:44:                                     ; preds = %._crit_edge57
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %45) #4
  br label %._crit_edge56

._crit_edge56:                                    ; preds = %._crit_edge57, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv58, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge57

._crit_edge.us:                                   ; preds = %._crit_edge56
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next59, 1000
  br i1 %exitcond1, label %._crit_edge55, label %.lr.ph5.split.us

._crit_edge55:                                    ; preds = %._crit_edge.us
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
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
