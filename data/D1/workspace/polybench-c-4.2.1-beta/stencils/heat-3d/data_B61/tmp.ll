; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [120 x [120 x [120 x double]]]*, align 8
  %8 = alloca [120 x [120 x [120 x double]]]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 120, i32* %5, align 4
  store i32 500, i32* %6, align 4
  %9 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %10 = bitcast [120 x [120 x [120 x double]]]** %7 to i8**
  store i8* %9, i8** %10, align 8
  %11 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %12 = bitcast [120 x [120 x [120 x double]]]** %8 to i8**
  store i8* %11, i8** %12, align 8
  %13 = load i32, i32* %5, align 4
  %14 = bitcast i8* %9 to [120 x [120 x double]]*
  %15 = bitcast i8* %11 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 %13, [120 x [120 x double]]* %14, [120 x [120 x double]]* %15)
  tail call void (...) @polybench_timer_start() #4
  %16 = load i32, i32* %6, align 4
  %17 = bitcast [120 x [120 x [120 x double]]]** %7 to [120 x [120 x double]]**
  %18 = load [120 x [120 x double]]*, [120 x [120 x double]]** %17, align 8
  %19 = bitcast [120 x [120 x [120 x double]]]** %8 to [120 x [120 x double]]**
  %20 = load [120 x [120 x double]]*, [120 x [120 x double]]** %19, align 8
  tail call fastcc void @kernel_heat_3d(i32 %16, i32 %13, [120 x [120 x double]]* %18, [120 x [120 x double]]* %20)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %21 = load i32, i32* %3, align 4
  %22 = icmp sgt i32 %21, 42
  br i1 %22, label %23, label %31

; <label>:23:                                     ; preds = %2
  %24 = load i8**, i8*** %4, align 8
  %25 = load i8*, i8** %24, align 8
  %strcmpload = load i8, i8* %25, align 1
  %26 = icmp eq i8 %strcmpload, 0
  br i1 %26, label %27, label %31

; <label>:27:                                     ; preds = %23
  %28 = load i32, i32* %5, align 4
  %29 = bitcast [120 x [120 x [120 x double]]]** %7 to [120 x [120 x double]]**
  %30 = load [120 x [120 x double]]*, [120 x [120 x double]]** %29, align 8
  tail call fastcc void @print_array(i32 %28, [120 x [120 x double]]* %30)
  br label %31

; <label>:31:                                     ; preds = %23, %27, %2
  %32 = bitcast [120 x [120 x [120 x double]]]** %7 to i8**
  %33 = load i8*, i8** %32, align 8
  tail call void @free(i8* %33) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %4 = alloca i32, align 4
  %5 = alloca [120 x [120 x double]]*, align 8
  %6 = alloca [120 x [120 x double]]*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store [120 x [120 x double]]* %1, [120 x [120 x double]]** %5, align 8
  store [120 x [120 x double]]* %2, [120 x [120 x double]]** %6, align 8
  store i32 0, i32* %7, align 4
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader3.lr.ph, label %34

.preheader3.lr.ph:                                ; preds = %3
  %10 = load i32, i32* %4, align 4
  %wide.trip.count34 = zext i32 %10 to i64
  %wide.trip.count = zext i32 %10 to i64
  %11 = sext i32 %10 to i64
  %12 = icmp sgt i32 %10, 0
  %13 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %14 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  %.promoted = load i32, i32* %7, align 4
  br i1 %12, label %.preheader3.us.preheader, label %._crit_edge10.loopexit29

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %15 = sext i32 %.promoted to i64
  %16 = sitofp i32 %10 to double
  %17 = icmp sgt i32 %10, 0
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %indvars.iv36 = phi i64 [ %15, %.preheader3.us.preheader ], [ %indvars.iv.next37, %._crit_edge5.us ]
  br i1 %17, label %.preheader.us.us.preheader, label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %18 = trunc i64 %indvars.iv36 to i32
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.preheader3.us
  %.lcssa9.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %10, %._crit_edge5.us.loopexit ]
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %19 = icmp slt i64 %indvars.iv.next37, %11
  br i1 %19, label %.preheader3.us, label %._crit_edge10.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %20 = trunc i64 %indvars.iv32 to i32
  br label %21

._crit_edge.us.us:                                ; preds = %21
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond35, label %._crit_edge5.us.loopexit, label %.preheader.us.us

; <label>:21:                                     ; preds = %21, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %21 ], [ 0, %.preheader.us.us ]
  %22 = trunc i64 %indvars.iv to i32
  %23 = sub i32 %10, %22
  %24 = add i32 %23, %18
  %25 = add i32 %24, %20
  %26 = sitofp i32 %25 to double
  %27 = fmul double %26, 1.000000e+01
  %28 = fdiv double %27, %16
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  store double %28, double* %29, align 8
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  store double %28, double* %30, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %21

._crit_edge10.loopexit:                           ; preds = %._crit_edge5.us
  %31 = trunc i64 %indvars.iv.next37 to i32
  br label %._crit_edge10

._crit_edge10.loopexit29:                         ; preds = %.preheader3.lr.ph
  %.promoted14 = load i32, i32* %8, align 4
  %32 = add i32 %.promoted, 1
  %33 = icmp sgt i32 %10, %32
  %smax = select i1 %33, i32 %10, i32 %32
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit29, %._crit_edge10.loopexit
  %.lcssa9.lcssa16.lcssa = phi i32 [ %.lcssa9.lcssa.us, %._crit_edge10.loopexit ], [ %.promoted14, %._crit_edge10.loopexit29 ]
  %.lcssa11 = phi i32 [ %31, %._crit_edge10.loopexit ], [ %smax, %._crit_edge10.loopexit29 ]
  store i32 %.lcssa11, i32* %7, align 4
  store i32 %.lcssa9.lcssa16.lcssa, i32* %8, align 4
  br label %34

; <label>:34:                                     ; preds = %._crit_edge10, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %5 = alloca i32, align 4
  %6 = alloca [120 x [120 x double]]*, align 8
  %7 = alloca [120 x [120 x double]]*, align 8
  %8 = alloca i32, align 4
  store i32 %1, i32* %5, align 4
  store [120 x [120 x double]]* %2, [120 x [120 x double]]** %6, align 8
  store [120 x [120 x double]]* %3, [120 x [120 x double]]** %7, align 8
  store i32 1, i32* %8, align 4
  %9 = add nsw i32 %1, -1
  %10 = add nsw i32 %1, -1
  %11 = sext i32 %1 to i64
  %12 = add nsw i32 %1, -1
  %13 = add nsw i32 %1, -1
  %14 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %15 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %16 = add nsw i64 %11, -1
  %17 = add nsw i32 %1, -1
  %18 = add nsw i32 %1, -1
  %19 = add nsw i32 %1, -1
  %20 = load i32, i32* %5, align 4
  %21 = sext i32 %20 to i64
  %22 = sext i32 %20 to i64
  %23 = sext i32 %20 to i64
  %24 = add nsw i64 %22, -1
  %25 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %26 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %27 = add nsw i64 %23, -1
  %28 = add nsw i64 %21, -1
  %.promoted51 = load i32, i32* %8, align 4
  %wide.trip.count62 = zext i32 %13 to i64
  %wide.trip.count = zext i32 %13 to i64
  %29 = icmp sgt i32 %9, 1
  %30 = icmp sgt i32 %17, 1
  %31 = icmp sgt i32 %18, 1
  %32 = icmp sgt i32 %19, 1
  %33 = icmp sgt i32 %10, 1
  %34 = icmp sgt i32 %12, 1
  br label %.preheader11

.preheader11:                                     ; preds = %4, %._crit_edge34
  %35 = phi i32 [ %.promoted51, %4 ], [ %122, %._crit_edge34 ]
  br i1 %29, label %.preheader9.preheader, label %.preheader10

.preheader9.preheader:                            ; preds = %.preheader11
  br label %.preheader9

.preheader10.loopexit:                            ; preds = %._crit_edge13
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader11
  br i1 %30, label %.preheader8.preheader, label %._crit_edge34

.preheader8.preheader:                            ; preds = %.preheader10
  br label %.preheader8

.preheader9:                                      ; preds = %.preheader9.preheader, %._crit_edge13
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge13 ], [ 1, %.preheader9.preheader ]
  br i1 %33, label %.preheader7.lr.ph, label %._crit_edge13

.preheader7.lr.ph:                                ; preds = %.preheader9
  %36 = add nuw nsw i64 %indvars.iv64, 1
  %37 = add nsw i64 %indvars.iv64, -1
  br i1 %34, label %.preheader7.us.preheader, label %._crit_edge13

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge.us ], [ 1, %.preheader7.us.preheader ]
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %38 = add nsw i64 %indvars.iv60, -1
  br label %39

; <label>:39:                                     ; preds = %39, %.preheader7.us
  %indvars.iv = phi i64 [ 1, %.preheader7.us ], [ %indvars.iv.next, %39 ]
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %36, i64 %indvars.iv60, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv64, i64 %indvars.iv60, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, 2.000000e+00
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %37, i64 %indvars.iv60, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv64, i64 %indvars.iv.next61, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = insertelement <2 x double> undef, double %44, i32 0
  %50 = shufflevector <2 x double> %49, <2 x double> undef, <2 x i32> zeroinitializer
  %51 = insertelement <2 x double> undef, double %41, i32 0
  %52 = insertelement <2 x double> %51, double %48, i32 1
  %53 = fsub <2 x double> %52, %50
  %54 = extractelement <2 x double> %53, i32 0
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv64, i64 %38, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = insertelement <2 x double> undef, double %54, i32 0
  %58 = insertelement <2 x double> %57, double %56, i32 1
  %59 = insertelement <2 x double> undef, double %46, i32 0
  %60 = shufflevector <2 x double> %59, <2 x double> %53, <2 x i32> <i32 0, i32 3>
  %61 = fadd <2 x double> %60, %58
  %62 = fmul <2 x double> %61, <double 1.250000e-01, double 1.250000e-01>
  %63 = extractelement <2 x double> %62, i32 0
  %64 = extractelement <2 x double> %62, i32 1
  %65 = fadd double %63, %64
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv64, i64 %indvars.iv60, i64 %indvars.iv.next
  %67 = load double, double* %66, align 8
  %68 = fsub double %67, %44
  %69 = add nsw i64 %indvars.iv, -1
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv64, i64 %indvars.iv60, i64 %69
  %71 = load double, double* %70, align 8
  %72 = fadd double %68, %71
  %73 = fmul double %72, 1.250000e-01
  %74 = fadd double %65, %73
  %75 = fadd double %43, %74
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %15, i64 %indvars.iv64, i64 %indvars.iv60, i64 %indvars.iv
  store double %75, double* %76, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %39

._crit_edge.us:                                   ; preds = %39
  %exitcond63 = icmp eq i64 %indvars.iv.next61, %wide.trip.count62
  br i1 %exitcond63, label %._crit_edge13.loopexit, label %.preheader7.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.preheader7.lr.ph, %.preheader9
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %77 = icmp slt i64 %indvars.iv.next65, %16
  br i1 %77, label %.preheader9, label %.preheader10.loopexit

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge29
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %._crit_edge29 ], [ 1, %.preheader8.preheader ]
  br i1 %31, label %.preheader.lr.ph, label %._crit_edge29

.preheader.lr.ph:                                 ; preds = %.preheader8
  %78 = add nuw nsw i64 %indvars.iv73, 1
  %79 = add nsw i64 %indvars.iv73, -1
  br i1 %32, label %.preheader.us.preheader, label %._crit_edge29

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge26.us
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge26.us ], [ 1, %.preheader.us.preheader ]
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %80 = add nsw i64 %indvars.iv70, -1
  br label %81

; <label>:81:                                     ; preds = %.preheader.us, %81
  %indvars.iv67 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next68, %81 ]
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %78, i64 %indvars.iv70, i64 %indvars.iv67
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv73, i64 %indvars.iv70, i64 %indvars.iv67
  %85 = load double, double* %84, align 8
  %86 = fmul double %85, 2.000000e+00
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %79, i64 %indvars.iv70, i64 %indvars.iv67
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv73, i64 %indvars.iv.next71, i64 %indvars.iv67
  %90 = load double, double* %89, align 8
  %91 = insertelement <2 x double> undef, double %86, i32 0
  %92 = shufflevector <2 x double> %91, <2 x double> undef, <2 x i32> zeroinitializer
  %93 = insertelement <2 x double> undef, double %83, i32 0
  %94 = insertelement <2 x double> %93, double %90, i32 1
  %95 = fsub <2 x double> %94, %92
  %96 = extractelement <2 x double> %95, i32 0
  %97 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv73, i64 %80, i64 %indvars.iv67
  %98 = load double, double* %97, align 8
  %99 = insertelement <2 x double> undef, double %96, i32 0
  %100 = insertelement <2 x double> %99, double %98, i32 1
  %101 = insertelement <2 x double> undef, double %88, i32 0
  %102 = shufflevector <2 x double> %101, <2 x double> %95, <2 x i32> <i32 0, i32 3>
  %103 = fadd <2 x double> %102, %100
  %104 = fmul <2 x double> %103, <double 1.250000e-01, double 1.250000e-01>
  %105 = extractelement <2 x double> %104, i32 0
  %106 = extractelement <2 x double> %104, i32 1
  %107 = fadd double %105, %106
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv73, i64 %indvars.iv70, i64 %indvars.iv.next68
  %109 = load double, double* %108, align 8
  %110 = fsub double %109, %86
  %111 = add nsw i64 %indvars.iv67, -1
  %112 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv73, i64 %indvars.iv70, i64 %111
  %113 = load double, double* %112, align 8
  %114 = fadd double %110, %113
  %115 = fmul double %114, 1.250000e-01
  %116 = fadd double %107, %115
  %117 = fadd double %85, %116
  %118 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %26, i64 %indvars.iv73, i64 %indvars.iv70, i64 %indvars.iv67
  store double %117, double* %118, align 8
  %119 = icmp slt i64 %indvars.iv.next68, %27
  br i1 %119, label %81, label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %81
  %120 = icmp slt i64 %indvars.iv.next71, %24
  br i1 %120, label %.preheader.us, label %._crit_edge29.loopexit

._crit_edge29.loopexit:                           ; preds = %._crit_edge26.us
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %.preheader.lr.ph, %.preheader8
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %121 = icmp slt i64 %indvars.iv.next74, %28
  br i1 %121, label %.preheader8, label %._crit_edge34.loopexit

._crit_edge34.loopexit:                           ; preds = %._crit_edge29
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34.loopexit, %.preheader10
  %122 = add nsw i32 %35, 1
  %123 = icmp slt i32 %122, 501
  br i1 %123, label %.preheader11, label %124

; <label>:124:                                    ; preds = %._crit_edge34
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca [120 x [120 x double]]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [120 x [120 x double]]* %1, [120 x [120 x double]]** %4, align 8
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %7) #5
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  store i32 0, i32* %5, align 4
  %11 = load i32, i32* %3, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %.preheader3.lr.ph, label %42

.preheader3.lr.ph:                                ; preds = %2
  %13 = load i32, i32* %3, align 4
  %wide.trip.count34 = zext i32 %13 to i64
  %wide.trip.count = zext i32 %13 to i64
  %14 = sext i32 %13 to i64
  %15 = sext i32 %13 to i64
  %16 = icmp sgt i32 %13, 0
  %17 = load [120 x [120 x double]]*, [120 x [120 x double]]** %4, align 8
  %.promoted = load i32, i32* %5, align 4
  br i1 %16, label %.preheader3.us.preheader, label %._crit_edge10.loopexit29

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %18 = sext i32 %.promoted to i64
  %19 = icmp sgt i32 %13, 0
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %indvars.iv36 = phi i64 [ %18, %.preheader3.us.preheader ], [ %indvars.iv.next37, %._crit_edge5.us ]
  br i1 %19, label %.preheader.us.us.preheader, label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %20 = mul nsw i64 %indvars.iv36, %14
  %21 = trunc i64 %20 to i32
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.preheader3.us
  %.lcssa9.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %13, %._crit_edge5.us.loopexit ]
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %22 = icmp slt i64 %indvars.iv.next37, %15
  br i1 %22, label %.preheader3.us, label %._crit_edge10.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %23 = trunc i64 %indvars.iv32 to i32
  %24 = add i32 %21, %23
  %25 = mul i32 %24, %13
  %26 = zext i32 %25 to i64
  br label %27

._crit_edge.us.us:                                ; preds = %34
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond35, label %._crit_edge5.us.loopexit, label %.preheader.us.us

; <label>:27:                                     ; preds = %34, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %34 ], [ 0, %.preheader.us.us ]
  %28 = add i64 %26, %indvars.iv
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %27
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #5
  br label %34

; <label>:34:                                     ; preds = %32, %27
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %17, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %27

._crit_edge10.loopexit:                           ; preds = %._crit_edge5.us
  %39 = trunc i64 %indvars.iv.next37 to i32
  br label %._crit_edge10

._crit_edge10.loopexit29:                         ; preds = %.preheader3.lr.ph
  %.promoted14 = load i32, i32* %6, align 4
  %40 = add i32 %.promoted, 1
  %41 = icmp sgt i32 %13, %40
  %smax = select i1 %41, i32 %13, i32 %40
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit29, %._crit_edge10.loopexit
  %.lcssa9.lcssa16.lcssa = phi i32 [ %.lcssa9.lcssa.us, %._crit_edge10.loopexit ], [ %.promoted14, %._crit_edge10.loopexit29 ]
  %.lcssa11 = phi i32 [ %39, %._crit_edge10.loopexit ], [ %smax, %._crit_edge10.loopexit29 ]
  store i32 %.lcssa11, i32* %5, align 4
  store i32 %.lcssa9.lcssa16.lcssa, i32* %6, align 4
  br label %42

; <label>:42:                                     ; preds = %._crit_edge10, %2
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %45) #5
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
