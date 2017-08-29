; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [1000 x [1000 x double]]*, align 8
  %8 = alloca [1000 x [1000 x double]]*, align 8
  %9 = alloca [1000 x [1000 x double]]*, align 8
  %10 = alloca [1000 x [1000 x double]]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 1000, i32* %5, align 4
  store i32 500, i32* %6, align 4
  %11 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %12 = bitcast [1000 x [1000 x double]]** %7 to i8**
  store i8* %11, i8** %12, align 8
  %13 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %14 = bitcast [1000 x [1000 x double]]** %8 to i8**
  store i8* %13, i8** %14, align 8
  %15 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %16 = bitcast [1000 x [1000 x double]]** %9 to i8**
  store i8* %15, i8** %16, align 8
  %17 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %18 = bitcast [1000 x [1000 x double]]** %10 to i8**
  store i8* %17, i8** %18, align 8
  %19 = load i32, i32* %5, align 4
  %20 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %7, align 8
  %21 = bitcast [1000 x [1000 x double]]* %20 to [1000 x double]*
  tail call fastcc void @init_array(i32 %19, [1000 x double]* %21)
  tail call void (...) @polybench_timer_start() #3
  %22 = load i32, i32* %6, align 4
  %23 = bitcast [1000 x [1000 x double]]* %20 to [1000 x double]*
  %24 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %8, align 8
  %25 = bitcast [1000 x [1000 x double]]* %24 to [1000 x double]*
  %26 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %9, align 8
  %27 = bitcast [1000 x [1000 x double]]* %26 to [1000 x double]*
  %28 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %10, align 8
  %29 = bitcast [1000 x [1000 x double]]* %28 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 %22, i32 %19, [1000 x double]* %23, [1000 x double]* %25, [1000 x double]* %27, [1000 x double]* %29)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %30 = load i32, i32* %3, align 4
  %31 = icmp sgt i32 %30, 42
  br i1 %31, label %32, label %._crit_edge

; <label>:32:                                     ; preds = %2
  %33 = load i8**, i8*** %4, align 8
  %34 = load i8*, i8** %33, align 8
  %strcmpload = load i8, i8* %34, align 1
  %35 = icmp eq i8 %strcmpload, 0
  br i1 %35, label %36, label %._crit_edge

; <label>:36:                                     ; preds = %32
  %37 = load i32, i32* %5, align 4
  %38 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %7, align 8
  %39 = bitcast [1000 x [1000 x double]]* %38 to [1000 x double]*
  tail call fastcc void @print_array(i32 %37, [1000 x double]* %39)
  br label %._crit_edge

._crit_edge:                                      ; preds = %32, %2, %36
  %40 = bitcast [1000 x [1000 x double]]** %7 to i8**
  %41 = load i8*, i8** %40, align 8
  tail call void @free(i8* %41) #3
  %42 = bitcast [1000 x [1000 x double]]** %8 to i8**
  %43 = load i8*, i8** %42, align 8
  tail call void @free(i8* %43) #3
  %44 = bitcast [1000 x [1000 x double]]** %9 to i8**
  %45 = load i8*, i8** %44, align 8
  tail call void @free(i8* %45) #3
  %46 = bitcast [1000 x [1000 x double]]** %10 to i8**
  %47 = load i8*, i8** %46, align 8
  tail call void @free(i8* %47) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]*) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca [1000 x double]*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [1000 x double]* %1, [1000 x double]** %4, align 8
  store i32 0, i32* %5, align 4
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph2, label %._crit_edge

.lr.ph2:                                          ; preds = %2
  %7 = load i32, i32* %3, align 4
  %wide.trip.count.1 = zext i32 %7 to i64
  %8 = sext i32 %7 to i64
  %9 = zext i32 %7 to i64
  %10 = load [1000 x double]*, [1000 x double]** %4, align 8
  %.promoted = load i32, i32* %5, align 4
  %11 = sext i32 %.promoted to i64
  %12 = icmp sgt i32 %7, 0
  br i1 %12, label %.lr.ph2.split.us.preheader, label %._crit_edge3.loopexit8

.lr.ph2.split.us.preheader:                       ; preds = %.lr.ph2
  %13 = and i32 %7, 1
  %14 = sitofp i32 %7 to double
  %15 = sitofp i32 %7 to double
  %16 = sitofp i32 %7 to double
  %17 = insertelement <2 x double> undef, double %14, i32 0
  %18 = insertelement <2 x double> %17, double %15, i32 1
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv10 = phi i64 [ %11, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next11, %._crit_edge.us ]
  %19 = icmp eq i32 %13, 0
  br i1 %19, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph2.split.us
  %20 = add i64 %indvars.iv10, %9
  %21 = trunc i64 %20 to i32
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, %16
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %10, i64 %indvars.iv10, i64 0
  store double %23, double* %24, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph2.split.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph2.split.us ]
  %25 = icmp eq i32 %7, 1
  br i1 %25, label %._crit_edge.us, label %.lr.ph2.split.us.new.preheader

.lr.ph2.split.us.new.preheader:                   ; preds = %.prol.loopexit
  %26 = add i64 %indvars.iv10, %9
  %27 = add i64 %indvars.iv10, %9
  br label %.lr.ph2.split.us.new

.lr.ph2.split.us.new:                             ; preds = %.lr.ph2.split.us.new, %.lr.ph2.split.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph2.split.us.new.preheader ], [ %indvars.iv.next.1, %.lr.ph2.split.us.new ]
  %28 = sub i64 %26, %indvars.iv
  %29 = trunc i64 %28 to i32
  %30 = sitofp i32 %29 to double
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %10, i64 %indvars.iv10, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %32 = sub i64 %27, %indvars.iv.next
  %33 = trunc i64 %32 to i32
  %34 = sitofp i32 %33 to double
  %35 = insertelement <2 x double> undef, double %30, i32 0
  %36 = insertelement <2 x double> %35, double %34, i32 1
  %37 = fdiv <2 x double> %36, %18
  %38 = bitcast double* %31 to <2 x double>*
  store <2 x double> %37, <2 x double>* %38, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph2.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph2.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %39 = icmp slt i64 %indvars.iv.next11, %8
  br i1 %39, label %.lr.ph2.split.us, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  %40 = trunc i64 %indvars.iv.next11 to i32
  br label %._crit_edge3

._crit_edge3.loopexit8:                           ; preds = %.lr.ph2
  %41 = add i32 %.promoted, 1
  %42 = icmp sgt i32 %7, %41
  %smax = select i1 %42, i32 %7, i32 %41
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit8, %._crit_edge3.loopexit
  %.lcssa7 = phi i32 [ %40, %._crit_edge3.loopexit ], [ %smax, %._crit_edge3.loopexit8 ]
  store i32 %.lcssa7, i32* %5, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %2, %._crit_edge3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [1000 x double]*, align 8
  %10 = alloca [1000 x double]*, align 8
  %11 = alloca [1000 x double]*, align 8
  %12 = alloca [1000 x double]*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca double, align 8
  %16 = alloca double, align 8
  %17 = alloca double, align 8
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  %20 = alloca double, align 8
  %21 = alloca double, align 8
  %22 = alloca double, align 8
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store [1000 x double]* %2, [1000 x double]** %9, align 8
  store [1000 x double]* %3, [1000 x double]** %10, align 8
  store [1000 x double]* %4, [1000 x double]** %11, align 8
  store [1000 x double]* %5, [1000 x double]** %12, align 8
  %23 = sitofp i32 %1 to double
  %24 = sitofp i32 %1 to double
  %25 = insertelement <2 x double> undef, double %23, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %26
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  store double %29, double* %15, align 8
  %30 = load i32, i32* %7, align 4
  %31 = sitofp i32 %30 to double
  %32 = fdiv double 1.000000e+00, %31
  %33 = insertelement <2 x double> undef, double %32, i32 0
  %34 = shufflevector <2 x double> %33, <2 x double> undef, <2 x i32> zeroinitializer
  %35 = fmul <2 x double> %34, <double 2.000000e+00, double 1.000000e+00>
  %36 = load double, double* %15, align 8
  %37 = insertelement <2 x double> undef, double %28, i32 0
  %38 = insertelement <2 x double> %37, double %36, i32 1
  %39 = insertelement <2 x double> undef, double %28, i32 0
  %40 = insertelement <2 x double> %39, double %36, i32 1
  %41 = fmul <2 x double> %40, %38
  %42 = fdiv <2 x double> %35, %41
  %43 = extractelement <2 x double> %42, i32 0
  %44 = extractelement <2 x double> %42, i32 1
  store double %44, double* %16, align 8
  %45 = fadd double %43, 1.000000e+00
  store double %45, double* %18, align 8
  %46 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %42
  %47 = fdiv <2 x double> %46, <double 2.000000e+00, double 2.000000e+00>
  %48 = extractelement <2 x double> %47, i32 0
  %49 = extractelement <2 x double> %47, i32 1
  store double %48, double* %17, align 8
  store double %48, double* %19, align 8
  store double %49, double* %20, align 8
  %50 = load double, double* %16, align 8
  %51 = fadd double %50, 1.000000e+00
  store double %51, double* %21, align 8
  store double %49, double* %22, align 8
  store i32 1, i32* %13, align 4
  %52 = load i32, i32* %7, align 4
  %53 = icmp sgt i32 %52, 0
  br i1 %53, label %.lr.ph19, label %._crit_edge

.lr.ph19:                                         ; preds = %6
  %54 = load i32, i32* %8, align 4
  %55 = sext i32 %54 to i64
  %56 = add nsw i32 %54, -1
  %57 = load [1000 x double]*, [1000 x double]** %10, align 8
  %58 = load [1000 x double]*, [1000 x double]** %11, align 8
  %59 = load [1000 x double]*, [1000 x double]** %12, align 8
  %60 = add nsw i64 %55, -1
  %promoted78 = trunc i64 %60 to i32
  %61 = load double, double* %19, align 8
  %62 = fsub double -0.000000e+00, %61
  %63 = load double, double* %17, align 8
  %64 = load double, double* %18, align 8
  %65 = load double, double* %20, align 8
  %66 = load [1000 x double]*, [1000 x double]** %9, align 8
  %67 = load double, double* %22, align 8
  %68 = load [1000 x double]*, [1000 x double]** %12, align 8
  %69 = load [1000 x double]*, [1000 x double]** %11, align 8
  %70 = load i32, i32* %8, align 4
  %71 = sext i32 %70 to i64
  %72 = sext i32 %70 to i64
  %73 = sext i32 %70 to i64
  %74 = add nsw i64 %71, -1
  %promoted74 = trunc i64 %74 to i32
  %75 = load [1000 x double]*, [1000 x double]** %10, align 8
  %76 = add nsw i64 %73, -2
  %promoted = trunc i64 %76 to i32
  %77 = add nsw i64 %72, -1
  %promoted73 = trunc i64 %77 to i32
  %78 = load i32, i32* %8, align 4
  %79 = sext i32 %78 to i64
  %80 = add nsw i32 %78, -1
  %81 = load [1000 x double]*, [1000 x double]** %9, align 8
  %82 = load [1000 x double]*, [1000 x double]** %11, align 8
  %83 = load [1000 x double]*, [1000 x double]** %12, align 8
  %84 = add nsw i64 %79, -1
  %promoted79 = trunc i64 %84 to i32
  %85 = load double, double* %22, align 8
  %86 = fsub double -0.000000e+00, %85
  %87 = load double, double* %20, align 8
  %88 = load double, double* %21, align 8
  %89 = load double, double* %17, align 8
  %90 = load [1000 x double]*, [1000 x double]** %10, align 8
  %91 = insertelement <2 x double> undef, double %65, i32 0
  %92 = insertelement <2 x double> %91, double %89, i32 1
  %93 = fmul <2 x double> %92, <double 2.000000e+00, double 2.000000e+00>
  %94 = fadd <2 x double> %93, <double 1.000000e+00, double 1.000000e+00>
  %95 = extractelement <2 x double> %94, i32 1
  %96 = load double, double* %19, align 8
  %97 = load double, double* %20, align 8
  %98 = load [1000 x double]*, [1000 x double]** %12, align 8
  %99 = load [1000 x double]*, [1000 x double]** %11, align 8
  %100 = load double, double* %21, align 8
  %101 = load i32, i32* %8, align 4
  %102 = sext i32 %101 to i64
  %103 = sext i32 %101 to i64
  %104 = sext i32 %101 to i64
  %105 = add nsw i64 %102, -1
  %promoted77 = trunc i64 %105 to i32
  %106 = load [1000 x double]*, [1000 x double]** %9, align 8
  %107 = add nsw i64 %104, -2
  %promoted75 = trunc i64 %107 to i32
  %108 = load [1000 x double]*, [1000 x double]** %12, align 8
  %109 = add nsw i64 %103, -1
  %promoted76 = trunc i64 %109 to i32
  %110 = load i32, i32* %7, align 4
  %.promoted = load i32, i32* %14, align 4
  %.promoted39 = load i32, i32* %13, align 4
  %111 = add nsw i64 %76, -1
  %112 = add i32 %70, -3
  %113 = zext i32 %112 to i64
  %114 = sub nsw i64 %111, %113
  %115 = sext i32 %promoted73 to i64
  %116 = add nsw i64 %107, -1
  %117 = add i32 %101, -3
  %118 = zext i32 %117 to i64
  %119 = sub nsw i64 %116, %118
  %120 = sext i32 %promoted76 to i64
  %121 = sext i32 %promoted74 to i64
  %122 = trunc i64 %114 to i32
  %123 = trunc i64 %114 to i32
  %124 = sext i32 %promoted77 to i64
  %125 = trunc i64 %119 to i32
  %126 = trunc i64 %119 to i32
  %127 = insertelement <2 x double> undef, double %65, i32 0
  %128 = shufflevector <2 x double> %127, <2 x double> %94, <2 x i32> <i32 0, i32 2>
  br label %._crit_edge17._crit_edge

._crit_edge17._crit_edge:                         ; preds = %._crit_edge17, %.lr.ph19
  %129 = phi i32 [ %.promoted39, %.lr.ph19 ], [ %280, %._crit_edge17 ]
  %.lcssa3034.lcssa37 = phi i32 [ %.promoted, %.lr.ph19 ], [ %.lcssa3034.lcssa38, %._crit_edge17 ]
  %130 = icmp sgt i32 %56, 1
  br i1 %130, label %.lr.ph6, label %._crit_edge7

.lr.ph6:                                          ; preds = %._crit_edge17._crit_edge
  %131 = icmp sgt i32 %promoted78, 1
  br i1 %131, label %.lr.ph6.split.us.preheader, label %.lr.ph6.split.preheader

.lr.ph6.split.preheader:                          ; preds = %.lr.ph6
  br label %.lr.ph6.split

.lr.ph6.split.us.preheader:                       ; preds = %.lr.ph6
  br label %.lr.ph6.split.us

.lr.ph6.split.us:                                 ; preds = %.lr.ph6.split.us.preheader, %._crit_edge4.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge4.us ], [ 1, %.lr.ph6.split.us.preheader ]
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %57, i64 0, i64 %indvars.iv53
  store double 1.000000e+00, double* %132, align 8
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %58, i64 %indvars.iv53, i64 0
  store double 0.000000e+00, double* %133, align 8
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %57, i64 0, i64 %indvars.iv53
  %135 = bitcast double* %134 to i64*
  %136 = load i64, i64* %135, align 8
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %59, i64 %indvars.iv53
  %138 = bitcast [1000 x double]* %137 to i64*
  store i64 %136, i64* %138, align 8
  %139 = add nsw i64 %indvars.iv53, -1
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %._crit_edge69, %.lr.ph6.split.us
  %indvars.iv49 = phi i64 [ 1, %.lr.ph6.split.us ], [ %indvars.iv.next50, %._crit_edge69 ]
  %140 = add nsw i64 %indvars.iv49, -1
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %58, i64 %indvars.iv53, i64 %140
  %142 = load double, double* %141, align 8
  %143 = fmul double %63, %142
  %144 = fadd double %143, %64
  %145 = fdiv double %62, %144
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %58, i64 %indvars.iv53, i64 %indvars.iv49
  store double %145, double* %146, align 8
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %66, i64 %indvars.iv49, i64 %139
  %148 = bitcast double* %147 to <2 x double>*
  %149 = load <2 x double>, <2 x double>* %148, align 8
  %150 = fmul <2 x double> %128, %149
  %151 = extractelement <2 x double> %150, i32 0
  %152 = extractelement <2 x double> %150, i32 1
  %153 = fsub double %152, %151
  %154 = getelementptr inbounds [1000 x double], [1000 x double]* %66, i64 %indvars.iv49, i64 %indvars.iv.next54
  %155 = load double, double* %154, align 8
  %156 = fmul double %67, %155
  %157 = fsub double %153, %156
  %158 = add nsw i64 %indvars.iv49, -1
  %159 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 %indvars.iv53, i64 %158
  %160 = load double, double* %159, align 8
  %161 = fmul double %63, %160
  %162 = fsub double %157, %161
  %163 = getelementptr inbounds [1000 x double], [1000 x double]* %69, i64 %indvars.iv53, i64 %158
  %164 = load double, double* %163, align 8
  %165 = fmul double %63, %164
  %166 = fadd double %165, %64
  %167 = fdiv double %162, %166
  %168 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 %indvars.iv53, i64 %indvars.iv49
  store double %167, double* %168, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %169 = icmp slt i64 %indvars.iv.next50, %74
  br i1 %169, label %._crit_edge69, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge69
  %170 = icmp sgt i32 %70, 2
  %171 = getelementptr inbounds [1000 x double], [1000 x double]* %75, i64 %121, i64 %indvars.iv53
  store double 1.000000e+00, double* %171, align 8
  br i1 %170, label %.lr.ph3.us.preheader, label %._crit_edge4.us

.lr.ph3.us.preheader:                             ; preds = %._crit_edge.us
  br label %.lr.ph3.us

.lr.ph3.us:                                       ; preds = %.lr.ph3.us.preheader, %.lr.ph3.us..lr.ph3.us_crit_edge
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %.lr.ph3.us..lr.ph3.us_crit_edge ], [ %76, %.lr.ph3.us.preheader ]
  %172 = getelementptr inbounds [1000 x double], [1000 x double]* %69, i64 %indvars.iv53, i64 %indvars.iv51
  %173 = load double, double* %172, align 8
  %174 = add nsw i64 %indvars.iv51, 1
  %175 = getelementptr inbounds [1000 x double], [1000 x double]* %75, i64 %174, i64 %indvars.iv53
  %176 = load double, double* %175, align 8
  %177 = fmul double %173, %176
  %178 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 %indvars.iv53, i64 %indvars.iv51
  %179 = load double, double* %178, align 8
  %180 = fadd double %177, %179
  %181 = getelementptr inbounds [1000 x double], [1000 x double]* %75, i64 %indvars.iv51, i64 %indvars.iv53
  store double %180, double* %181, align 8
  %182 = icmp sgt i64 %indvars.iv51, 1
  br i1 %182, label %.lr.ph3.us..lr.ph3.us_crit_edge, label %._crit_edge4.us.loopexit

.lr.ph3.us..lr.ph3.us_crit_edge:                  ; preds = %.lr.ph3.us
  %indvars.iv.next52 = add nsw i64 %indvars.iv51, -1
  br label %.lr.ph3.us

._crit_edge4.us.loopexit:                         ; preds = %.lr.ph3.us
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us.loopexit, %._crit_edge.us
  %.lcssa2327.us = phi i32 [ %promoted, %._crit_edge.us ], [ %122, %._crit_edge4.us.loopexit ]
  %183 = icmp slt i64 %indvars.iv.next54, %115
  br i1 %183, label %.lr.ph6.split.us, label %._crit_edge7.loopexit

.lr.ph6.split:                                    ; preds = %.lr.ph6.split.preheader, %._crit_edge4
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge4 ], [ 1, %.lr.ph6.split.preheader ]
  %184 = icmp sgt i32 %70, 2
  %185 = getelementptr inbounds [1000 x double], [1000 x double]* %57, i64 0, i64 %indvars.iv47
  store double 1.000000e+00, double* %185, align 8
  %186 = getelementptr inbounds [1000 x double], [1000 x double]* %58, i64 %indvars.iv47, i64 0
  store double 0.000000e+00, double* %186, align 8
  %187 = getelementptr inbounds [1000 x double], [1000 x double]* %57, i64 0, i64 %indvars.iv47
  %188 = bitcast double* %187 to i64*
  %189 = load i64, i64* %188, align 8
  %190 = getelementptr inbounds [1000 x double], [1000 x double]* %59, i64 %indvars.iv47
  %191 = bitcast [1000 x double]* %190 to i64*
  store i64 %189, i64* %191, align 8
  %192 = getelementptr inbounds [1000 x double], [1000 x double]* %75, i64 %60, i64 %indvars.iv47
  store double 1.000000e+00, double* %192, align 8
  br i1 %184, label %.lr.ph3.preheader, label %._crit_edge4

.lr.ph3.preheader:                                ; preds = %.lr.ph6.split
  br label %.lr.ph3

.lr.ph3:                                          ; preds = %.lr.ph3.preheader, %.lr.ph3..lr.ph3_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph3..lr.ph3_crit_edge ], [ %76, %.lr.ph3.preheader ]
  %193 = getelementptr inbounds [1000 x double], [1000 x double]* %69, i64 %indvars.iv47, i64 %indvars.iv
  %194 = load double, double* %193, align 8
  %195 = add nsw i64 %indvars.iv, 1
  %196 = getelementptr inbounds [1000 x double], [1000 x double]* %75, i64 %195, i64 %indvars.iv47
  %197 = load double, double* %196, align 8
  %198 = fmul double %194, %197
  %199 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 %indvars.iv47, i64 %indvars.iv
  %200 = load double, double* %199, align 8
  %201 = fadd double %198, %200
  %202 = getelementptr inbounds [1000 x double], [1000 x double]* %75, i64 %indvars.iv, i64 %indvars.iv47
  store double %201, double* %202, align 8
  %203 = icmp sgt i64 %indvars.iv, 1
  br i1 %203, label %.lr.ph3..lr.ph3_crit_edge, label %._crit_edge4.loopexit

.lr.ph3..lr.ph3_crit_edge:                        ; preds = %.lr.ph3
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  br label %.lr.ph3

._crit_edge4.loopexit:                            ; preds = %.lr.ph3
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %.lr.ph6.split
  %.lcssa2327 = phi i32 [ %promoted, %.lr.ph6.split ], [ %123, %._crit_edge4.loopexit ]
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %204 = icmp slt i64 %indvars.iv.next48, %77
  br i1 %204, label %.lr.ph6.split, label %._crit_edge7.loopexit81

._crit_edge7.loopexit:                            ; preds = %._crit_edge4.us
  br label %._crit_edge7

._crit_edge7.loopexit81:                          ; preds = %._crit_edge4
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit81, %._crit_edge7.loopexit, %._crit_edge17._crit_edge
  %.lcssa3034.lcssa36 = phi i32 [ %.lcssa3034.lcssa37, %._crit_edge17._crit_edge ], [ %.lcssa2327.us, %._crit_edge7.loopexit ], [ %.lcssa2327, %._crit_edge7.loopexit81 ]
  %205 = icmp sgt i32 %80, 1
  br i1 %205, label %.lr.ph16, label %._crit_edge17

.lr.ph16:                                         ; preds = %._crit_edge7
  %206 = icmp sgt i32 %promoted79, 1
  br i1 %206, label %.lr.ph16.split.us.preheader, label %.lr.ph16.split.preheader

.lr.ph16.split.preheader:                         ; preds = %.lr.ph16
  br label %.lr.ph16.split

.lr.ph16.split.us.preheader:                      ; preds = %.lr.ph16
  br label %.lr.ph16.split.us

.lr.ph16.split.us:                                ; preds = %.lr.ph16.split.us.preheader, %._crit_edge14.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge14.us ], [ 1, %.lr.ph16.split.us.preheader ]
  %207 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv63, i64 0
  store double 1.000000e+00, double* %207, align 8
  %208 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 %indvars.iv63, i64 0
  store double 0.000000e+00, double* %208, align 8
  %209 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv63, i64 0
  %210 = bitcast double* %209 to i64*
  %211 = load i64, i64* %210, align 8
  %212 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv63
  %213 = bitcast [1000 x double]* %212 to i64*
  store i64 %211, i64* %213, align 8
  %214 = add nsw i64 %indvars.iv63, -1
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %._crit_edge70, %.lr.ph16.split.us
  %indvars.iv59 = phi i64 [ 1, %.lr.ph16.split.us ], [ %indvars.iv.next60, %._crit_edge70 ]
  %215 = add nsw i64 %indvars.iv59, -1
  %216 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 %indvars.iv63, i64 %215
  %217 = load double, double* %216, align 8
  %218 = fmul double %87, %217
  %219 = fadd double %218, %88
  %220 = fdiv double %86, %219
  %221 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 %indvars.iv63, i64 %indvars.iv59
  store double %220, double* %221, align 8
  %222 = getelementptr inbounds [1000 x double], [1000 x double]* %90, i64 %214, i64 %indvars.iv59
  %223 = load double, double* %222, align 8
  %224 = fmul double %89, %223
  %225 = getelementptr inbounds [1000 x double], [1000 x double]* %90, i64 %indvars.iv63, i64 %indvars.iv59
  %226 = load double, double* %225, align 8
  %227 = fmul double %95, %226
  %228 = fsub double %227, %224
  %229 = getelementptr inbounds [1000 x double], [1000 x double]* %90, i64 %indvars.iv.next64, i64 %indvars.iv59
  %230 = load double, double* %229, align 8
  %231 = fmul double %96, %230
  %232 = fsub double %228, %231
  %233 = add nsw i64 %indvars.iv59, -1
  %234 = getelementptr inbounds [1000 x double], [1000 x double]* %98, i64 %indvars.iv63, i64 %233
  %235 = load double, double* %234, align 8
  %236 = fmul double %97, %235
  %237 = fsub double %232, %236
  %238 = getelementptr inbounds [1000 x double], [1000 x double]* %99, i64 %indvars.iv63, i64 %233
  %239 = load double, double* %238, align 8
  %240 = fmul double %97, %239
  %241 = fadd double %240, %100
  %242 = fdiv double %237, %241
  %243 = getelementptr inbounds [1000 x double], [1000 x double]* %98, i64 %indvars.iv63, i64 %indvars.iv59
  store double %242, double* %243, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %244 = icmp slt i64 %indvars.iv.next60, %105
  br i1 %244, label %._crit_edge70, label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge70
  %245 = icmp sgt i32 %101, 2
  %246 = getelementptr inbounds [1000 x double], [1000 x double]* %106, i64 %indvars.iv63, i64 %124
  store double 1.000000e+00, double* %246, align 8
  br i1 %245, label %.lr.ph13.us.preheader, label %._crit_edge14.us

.lr.ph13.us.preheader:                            ; preds = %._crit_edge10.us
  br label %.lr.ph13.us

.lr.ph13.us:                                      ; preds = %.lr.ph13.us.preheader, %.lr.ph13.us..lr.ph13.us_crit_edge
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %.lr.ph13.us..lr.ph13.us_crit_edge ], [ %107, %.lr.ph13.us.preheader ]
  %247 = getelementptr inbounds [1000 x double], [1000 x double]* %99, i64 %indvars.iv63, i64 %indvars.iv61
  %248 = load double, double* %247, align 8
  %249 = add nsw i64 %indvars.iv61, 1
  %250 = getelementptr inbounds [1000 x double], [1000 x double]* %106, i64 %indvars.iv63, i64 %249
  %251 = load double, double* %250, align 8
  %252 = fmul double %248, %251
  %253 = getelementptr inbounds [1000 x double], [1000 x double]* %108, i64 %indvars.iv63, i64 %indvars.iv61
  %254 = load double, double* %253, align 8
  %255 = fadd double %252, %254
  %256 = getelementptr inbounds [1000 x double], [1000 x double]* %106, i64 %indvars.iv63, i64 %indvars.iv61
  store double %255, double* %256, align 8
  %257 = icmp sgt i64 %indvars.iv61, 1
  br i1 %257, label %.lr.ph13.us..lr.ph13.us_crit_edge, label %._crit_edge14.us.loopexit

.lr.ph13.us..lr.ph13.us_crit_edge:                ; preds = %.lr.ph13.us
  %indvars.iv.next62 = add nsw i64 %indvars.iv61, -1
  br label %.lr.ph13.us

._crit_edge14.us.loopexit:                        ; preds = %.lr.ph13.us
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.loopexit, %._crit_edge10.us
  %.lcssa3034.us = phi i32 [ %promoted75, %._crit_edge10.us ], [ %125, %._crit_edge14.us.loopexit ]
  %258 = icmp slt i64 %indvars.iv.next64, %120
  br i1 %258, label %.lr.ph16.split.us, label %._crit_edge17.loopexit

.lr.ph16.split:                                   ; preds = %.lr.ph16.split.preheader, %._crit_edge14
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge14 ], [ 1, %.lr.ph16.split.preheader ]
  %259 = icmp sgt i32 %101, 2
  %260 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv57, i64 0
  store double 1.000000e+00, double* %260, align 8
  %261 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 %indvars.iv57, i64 0
  store double 0.000000e+00, double* %261, align 8
  %262 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %indvars.iv57, i64 0
  %263 = bitcast double* %262 to i64*
  %264 = load i64, i64* %263, align 8
  %265 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 %indvars.iv57
  %266 = bitcast [1000 x double]* %265 to i64*
  store i64 %264, i64* %266, align 8
  %267 = getelementptr inbounds [1000 x double], [1000 x double]* %106, i64 %indvars.iv57, i64 %84
  store double 1.000000e+00, double* %267, align 8
  br i1 %259, label %.lr.ph13.preheader, label %._crit_edge14

.lr.ph13.preheader:                               ; preds = %.lr.ph16.split
  br label %.lr.ph13

.lr.ph13:                                         ; preds = %.lr.ph13.preheader, %.lr.ph13..lr.ph13_crit_edge
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %.lr.ph13..lr.ph13_crit_edge ], [ %107, %.lr.ph13.preheader ]
  %268 = getelementptr inbounds [1000 x double], [1000 x double]* %99, i64 %indvars.iv57, i64 %indvars.iv55
  %269 = load double, double* %268, align 8
  %270 = add nsw i64 %indvars.iv55, 1
  %271 = getelementptr inbounds [1000 x double], [1000 x double]* %106, i64 %indvars.iv57, i64 %270
  %272 = load double, double* %271, align 8
  %273 = fmul double %269, %272
  %274 = getelementptr inbounds [1000 x double], [1000 x double]* %108, i64 %indvars.iv57, i64 %indvars.iv55
  %275 = load double, double* %274, align 8
  %276 = fadd double %273, %275
  %277 = getelementptr inbounds [1000 x double], [1000 x double]* %106, i64 %indvars.iv57, i64 %indvars.iv55
  store double %276, double* %277, align 8
  %278 = icmp sgt i64 %indvars.iv55, 1
  br i1 %278, label %.lr.ph13..lr.ph13_crit_edge, label %._crit_edge14.loopexit

.lr.ph13..lr.ph13_crit_edge:                      ; preds = %.lr.ph13
  %indvars.iv.next56 = add nsw i64 %indvars.iv55, -1
  br label %.lr.ph13

._crit_edge14.loopexit:                           ; preds = %.lr.ph13
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.lr.ph16.split
  %.lcssa3034 = phi i32 [ %promoted75, %.lr.ph16.split ], [ %126, %._crit_edge14.loopexit ]
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %279 = icmp slt i64 %indvars.iv.next58, %109
  br i1 %279, label %.lr.ph16.split, label %._crit_edge17.loopexit80

._crit_edge17.loopexit:                           ; preds = %._crit_edge14.us
  br label %._crit_edge17

._crit_edge17.loopexit80:                         ; preds = %._crit_edge14
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit80, %._crit_edge17.loopexit, %._crit_edge7
  %.lcssa3034.lcssa38 = phi i32 [ %.lcssa3034.lcssa36, %._crit_edge7 ], [ %.lcssa3034.us, %._crit_edge17.loopexit ], [ %.lcssa3034, %._crit_edge17.loopexit80 ]
  %280 = add nsw i32 %129, 1
  %281 = icmp slt i32 %129, %110
  br i1 %281, label %._crit_edge17._crit_edge, label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge17
  store i32 %.lcssa3034.lcssa38, i32* %14, align 4
  store i32 %280, i32* %13, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %._crit_edge20
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca [1000 x double]*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [1000 x double]* %1, [1000 x double]** %4, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  store i32 0, i32* %5, align 4
  %10 = load i32, i32* %3, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph2, label %._crit_edge

.lr.ph2:                                          ; preds = %2
  %12 = load i32, i32* %3, align 4
  %wide.trip.count = zext i32 %12 to i64
  %13 = sext i32 %12 to i64
  %14 = sext i32 %12 to i64
  %15 = load [1000 x double]*, [1000 x double]** %4, align 8
  %.promoted5 = load i32, i32* %5, align 4
  %16 = sext i32 %.promoted5 to i64
  %17 = icmp sgt i32 %12, 0
  br i1 %17, label %.lr.ph2.split.us.preheader, label %._crit_edge3.loopexit9

.lr.ph2.split.us.preheader:                       ; preds = %.lr.ph2
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv11 = phi i64 [ %16, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %18 = mul nsw i64 %indvars.iv11, %14
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge14, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph2.split.us ], [ %indvars.iv.next, %._crit_edge14 ]
  %19 = add nsw i64 %18, %indvars.iv
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %._crit_edge14

; <label>:23:                                     ; preds = %._crit_edge15
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %24) #4
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge15, %23
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %15, i64 %indvars.iv11, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %27) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge15

._crit_edge.us:                                   ; preds = %._crit_edge14
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %29 = icmp slt i64 %indvars.iv.next12, %13
  br i1 %29, label %.lr.ph2.split.us, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  %30 = trunc i64 %indvars.iv.next12 to i32
  br label %._crit_edge3

._crit_edge3.loopexit9:                           ; preds = %.lr.ph2
  %31 = add i32 %.promoted5, 1
  %32 = icmp sgt i32 %12, %31
  %smax = select i1 %32, i32 %12, i32 %31
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit9, %._crit_edge3.loopexit
  %.lcssa6 = phi i32 [ %30, %._crit_edge3.loopexit ], [ %smax, %._crit_edge3.loopexit9 ]
  store i32 %.lcssa6, i32* %5, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %2, %._crit_edge3
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %35) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
