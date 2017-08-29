; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = call i8* @polybench_alloc_data(i64 1680000, i32 8) #3
  %5 = call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %6 = call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %7 = call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  call void (...) @polybench_timer_start() #3
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  call fastcc void @kernel_correlation(double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %4) #3
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  call void @free(i8* %7) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(double*, [1200 x double]*) unnamed_addr #0 {
  store double 1.400000e+03, double* %0, align 8
  br label %.preheader

.preheader:                                       ; preds = %19, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %19 ]
  %3 = trunc i64 %indvars.iv4 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv4
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv4
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond6, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph58.split.us.preheader:
  %5 = ptrtoint double* %3 to i64
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph58.split.us

.lr.ph58.split.us:                                ; preds = %._crit_edge54.us, %.lr.ph58.split.us.preheader
  %indvars.iv117 = phi i64 [ 0, %.lr.ph58.split.us.preheader ], [ %indvars.iv.next118, %._crit_edge54.us ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv117
  store double 0.000000e+00, double* %6, align 8
  %sunkaddr167 = shl i64 %indvars.iv117, 3
  %sunkaddr168 = add i64 %5, %sunkaddr167
  %sunkaddr169 = inttoptr i64 %sunkaddr168 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph58.split.us
  %indvars.iv113 = phi i64 [ 0, %.lr.ph58.split.us ], [ %indvars.iv.next114.4, %._crit_edge ]
  %7 = phi double [ 0.000000e+00, %.lr.ph58.split.us ], [ %22, %._crit_edge ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv113, i64 %indvars.iv117
  %9 = load double, double* %8, align 8
  %10 = fadd double %7, %9
  store double %10, double* %sunkaddr169, align 8
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next114, i64 %indvars.iv117
  %12 = load double, double* %11, align 8
  %13 = fadd double %10, %12
  store double %13, double* %sunkaddr169, align 8
  %indvars.iv.next114.1 = add nuw nsw i64 %indvars.iv113, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next114.1, i64 %indvars.iv117
  %15 = load double, double* %14, align 8
  %16 = fadd double %13, %15
  store double %16, double* %sunkaddr169, align 8
  %indvars.iv.next114.2 = add nuw nsw i64 %indvars.iv113, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next114.2, i64 %indvars.iv117
  %18 = load double, double* %17, align 8
  %19 = fadd double %16, %18
  store double %19, double* %sunkaddr169, align 8
  %indvars.iv.next114.3 = add nuw nsw i64 %indvars.iv113, 4
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next114.3, i64 %indvars.iv117
  %21 = load double, double* %20, align 8
  %22 = fadd double %19, %21
  store double %22, double* %sunkaddr169, align 8
  %indvars.iv.next114.4 = add nuw nsw i64 %indvars.iv113, 5
  %exitcond136.4 = icmp eq i64 %indvars.iv.next114.4, 1400
  br i1 %exitcond136.4, label %._crit_edge54.us, label %._crit_edge

._crit_edge54.us:                                 ; preds = %._crit_edge
  %23 = fdiv double %22, %0
  %sunkaddr19 = shl i64 %indvars.iv117, 3
  %sunkaddr20 = add i64 %sunkaddr, %sunkaddr19
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to double*
  store double %23, double* %sunkaddr21, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond137 = icmp eq i64 %indvars.iv.next118, 1200
  br i1 %exitcond137, label %._crit_edge54.us..lr.ph50.split.us_crit_edge, label %.lr.ph58.split.us

._crit_edge54.us..lr.ph50.split.us_crit_edge:     ; preds = %._crit_edge54.us
  %24 = ptrtoint double* %4 to i64
  %25 = ptrtoint double* %3 to i64
  %sunkaddr22 = ptrtoint double* %4 to i64
  br label %.lr.ph50.split.us

.lr.ph50.split.us:                                ; preds = %._crit_edge47.us, %._crit_edge54.us..lr.ph50.split.us_crit_edge
  %indvars.iv105 = phi i64 [ 0, %._crit_edge54.us..lr.ph50.split.us_crit_edge ], [ %indvars.iv.next106, %._crit_edge47.us ]
  %26 = getelementptr inbounds double, double* %4, i64 %indvars.iv105
  store double 0.000000e+00, double* %26, align 8
  %sunkaddr175 = shl i64 %indvars.iv105, 3
  %sunkaddr176 = add i64 %25, %sunkaddr175
  %sunkaddr177 = inttoptr i64 %sunkaddr176 to double*
  %sunkaddr184 = add i64 %24, %sunkaddr175
  %sunkaddr185 = inttoptr i64 %sunkaddr184 to double*
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14, %.lr.ph50.split.us
  %indvars.iv101 = phi i64 [ 0, %.lr.ph50.split.us ], [ %indvars.iv.next102.1, %._crit_edge14 ]
  %27 = phi double [ 0.000000e+00, %.lr.ph50.split.us ], [ %39, %._crit_edge14 ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv101, i64 %indvars.iv105
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr177, align 8
  %31 = fsub double %29, %30
  %32 = fmul double %31, %31
  %33 = fadd double %27, %32
  store double %33, double* %sunkaddr185, align 8
  %indvars.iv.next102 = or i64 %indvars.iv101, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next102, i64 %indvars.iv105
  %35 = load double, double* %34, align 8
  %36 = load double, double* %sunkaddr177, align 8
  %37 = fsub double %35, %36
  %38 = fmul double %37, %37
  %39 = fadd double %33, %38
  store double %39, double* %sunkaddr185, align 8
  %indvars.iv.next102.1 = add nuw nsw i64 %indvars.iv101, 2
  %exitcond133.1 = icmp eq i64 %indvars.iv.next102.1, 1400
  br i1 %exitcond133.1, label %._crit_edge47.us, label %._crit_edge14

._crit_edge47.us:                                 ; preds = %._crit_edge14
  %40 = fdiv double %39, %0
  %sunkaddr23 = shl i64 %indvars.iv105, 3
  %sunkaddr24 = add i64 %sunkaddr22, %sunkaddr23
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to double*
  store double %40, double* %sunkaddr25, align 8
  %41 = call double @sqrt(double %40) #3
  %42 = fcmp ugt double %41, 1.000000e-01
  %..us = select i1 %42, double %41, double 1.000000e+00
  store double %..us, double* %sunkaddr25, align 8
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next106, 1200
  br i1 %exitcond134, label %.preheader6.us.preheader, label %.lr.ph50.split.us

.preheader6.us.preheader:                         ; preds = %._crit_edge47.us
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %.preheader6.us.preheader, %._crit_edge42.us
  %indvars.iv96 = phi i64 [ %indvars.iv.next97, %._crit_edge42.us ], [ 0, %.preheader6.us.preheader ]
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15, %.preheader6.us
  %indvars.iv92 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next93, %._crit_edge15 ]
  %43 = getelementptr inbounds double, double* %3, i64 %indvars.iv92
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv92
  %46 = load double, double* %45, align 8
  %47 = fsub double %46, %44
  store double %47, double* %45, align 8
  %48 = call double @sqrt(double %0) #3
  %49 = getelementptr inbounds double, double* %4, i64 %indvars.iv92
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = load double, double* %45, align 8
  %53 = fdiv double %52, %51
  store double %53, double* %45, align 8
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond131 = icmp eq i64 %indvars.iv.next93, 1200
  br i1 %exitcond131, label %._crit_edge42.us, label %._crit_edge15

._crit_edge42.us:                                 ; preds = %._crit_edge15
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %exitcond132 = icmp eq i64 %indvars.iv.next97, 1400
  br i1 %exitcond132, label %.lr.ph.us.us.preheader.preheader, label %.preheader6.us

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge42.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge36.us-lcssa.us.us
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %._crit_edge36.us-lcssa.us.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge36.us-lcssa.us.us ], [ 1, %.lr.ph.us.us.preheader.preheader ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv78, i64 %indvars.iv78
  store double 1.000000e+00, double* %54, align 8
  br label %.lr.ph.us.us

._crit_edge36.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next79, 1199
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  br i1 %exitcond128, label %._crit_edge39, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv74 = phi i64 [ %indvars.iv72, %.lr.ph.us.us.preheader ], [ %indvars.iv.next75, %._crit_edge.us.us ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv78, i64 %indvars.iv74
  store double 0.000000e+00, double* %55, align 8
  br label %._crit_edge16

._crit_edge.us.us:                                ; preds = %._crit_edge16
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv74, i64 %indvars.iv78
  store double %69, double* %56, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond = icmp eq i64 %indvars.iv.next75, 1200
  br i1 %exitcond, label %._crit_edge36.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge16:                                    ; preds = %._crit_edge16, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge16 ]
  %57 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %69, %._crit_edge16 ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv78
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv74
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %57, %62
  store double %63, double* %55, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv78
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv74
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %63, %68
  store double %69, double* %55, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond127.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond127.1, label %._crit_edge.us.us, label %._crit_edge16

._crit_edge39:                                    ; preds = %._crit_edge36.us-lcssa.us.us
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %70, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv5, 1200
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge2
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond9, label %._crit_edge.us, label %._crit_edge2

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

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
