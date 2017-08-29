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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array([1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %19, %2
  %indvars.iv15 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %19 ]
  %3 = trunc i64 %indvars.iv15 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv4 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv4, %indvars.iv15
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv4
  %indvars.iv.next = or i64 %indvars.iv4, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv15
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv4, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond3, label %20, label %.._crit_edge_crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph103.split.us.preheader:
  %5 = alloca double, align 8
  %6 = alloca [1200 x double]*, align 8
  %7 = alloca [1200 x double]*, align 8
  %8 = alloca double*, align 8
  store double %0, double* %5, align 8
  store [1200 x double]* %1, [1200 x double]** %6, align 8
  store [1200 x double]* %2, [1200 x double]** %7, align 8
  store double* %4, double** %8, align 8
  %9 = ptrtoint double* %3 to i64
  br label %.lr.ph103.split.us

.lr.ph103.split.us:                               ; preds = %._crit_edge.us, %.lr.ph103.split.us.preheader
  %indvars.iv39101.us = phi i64 [ 0, %.lr.ph103.split.us.preheader ], [ %indvars.iv.next40.us, %._crit_edge.us ]
  %10 = getelementptr inbounds double, double* %3, i64 %indvars.iv39101.us
  store double 0.000000e+00, double* %10, align 8
  %sunkaddr172 = shl i64 %indvars.iv39101.us, 3
  %sunkaddr173 = add i64 %9, %sunkaddr172
  %sunkaddr174 = inttoptr i64 %sunkaddr173 to double*
  br label %11

; <label>:11:                                     ; preds = %11, %.lr.ph103.split.us
  %12 = phi double [ 0.000000e+00, %.lr.ph103.split.us ], [ %24, %11 ]
  %indvars.iv3798.us = phi i64 [ 0, %.lr.ph103.split.us ], [ %indvars.iv.next38.us.1.1, %11 ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3798.us, i64 %indvars.iv39101.us
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %sunkaddr174, align 8
  %indvars.iv.next38.us = or i64 %indvars.iv3798.us, 1
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next38.us, i64 %indvars.iv39101.us
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %sunkaddr174, align 8
  %indvars.iv.next38.us.1 = or i64 %indvars.iv3798.us, 2
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next38.us.1, i64 %indvars.iv39101.us
  %20 = load double, double* %19, align 8
  %21 = fadd double %20, %18
  store double %21, double* %sunkaddr174, align 8
  %indvars.iv.next38.us.113 = or i64 %indvars.iv3798.us, 3
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next38.us.113, i64 %indvars.iv39101.us
  %23 = load double, double* %22, align 8
  %24 = fadd double %23, %21
  store double %24, double* %sunkaddr174, align 8
  %indvars.iv.next38.us.1.1 = add nsw i64 %indvars.iv3798.us, 4
  %exitcond118.1.1 = icmp eq i64 %indvars.iv.next38.us.1.1, 1400
  br i1 %exitcond118.1.1, label %._crit_edge.us, label %11

._crit_edge.us:                                   ; preds = %11
  %25 = fdiv double %24, %0
  store double %25, double* %sunkaddr174, align 8
  %indvars.iv.next40.us = add nuw nsw i64 %indvars.iv39101.us, 1
  %exitcond119 = icmp eq i64 %indvars.iv.next40.us, 1200
  br i1 %exitcond119, label %.lr.ph97.split.us.preheader, label %.lr.ph103.split.us

.lr.ph97.split.us.preheader:                      ; preds = %._crit_edge.us
  %26 = ptrtoint double* %4 to i64
  br label %.lr.ph97.split.us

.lr.ph97.split.us:                                ; preds = %._crit_edge94.us, %.lr.ph97.split.us.preheader
  %indvars.iv3596.us = phi i64 [ 0, %.lr.ph97.split.us.preheader ], [ %indvars.iv.next36.us, %._crit_edge94.us ]
  %27 = getelementptr inbounds double, double* %4, i64 %indvars.iv3596.us
  store double 0.000000e+00, double* %27, align 8
  %sunkaddr176 = shl i64 %indvars.iv3596.us, 3
  %sunkaddr177 = add i64 %9, %sunkaddr176
  %sunkaddr178 = inttoptr i64 %sunkaddr177 to double*
  %sunkaddr181 = add i64 %26, %sunkaddr176
  %sunkaddr182 = inttoptr i64 %sunkaddr181 to double*
  br label %28

; <label>:28:                                     ; preds = %28, %.lr.ph97.split.us
  %29 = phi double [ 0.000000e+00, %.lr.ph97.split.us ], [ %41, %28 ]
  %indvars.iv3391.us = phi i64 [ 0, %.lr.ph97.split.us ], [ %indvars.iv.next34.us.1, %28 ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3391.us, i64 %indvars.iv3596.us
  %31 = load double, double* %30, align 8
  %32 = load double, double* %sunkaddr178, align 8
  %33 = fsub double %31, %32
  %34 = fmul double %33, %33
  %35 = fadd double %34, %29
  store double %35, double* %sunkaddr182, align 8
  %indvars.iv.next34.us = or i64 %indvars.iv3391.us, 1
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next34.us, i64 %indvars.iv3596.us
  %37 = load double, double* %36, align 8
  %38 = load double, double* %sunkaddr178, align 8
  %39 = fsub double %37, %38
  %40 = fmul double %39, %39
  %41 = fadd double %40, %35
  store double %41, double* %sunkaddr182, align 8
  %indvars.iv.next34.us.1 = add nuw nsw i64 %indvars.iv3391.us, 2
  %exitcond115.1 = icmp eq i64 %indvars.iv.next34.us.1, 1400
  br i1 %exitcond115.1, label %._crit_edge94.us, label %28

._crit_edge94.us:                                 ; preds = %28
  %42 = fdiv double %41, %0
  store double %42, double* %sunkaddr182, align 8
  %43 = tail call double @sqrt(double %42) #4
  %44 = fcmp ugt double %43, 1.000000e-01
  %45 = select i1 %44, double %43, double 1.000000e+00
  store double %45, double* %sunkaddr182, align 8
  %indvars.iv.next36.us = add nuw nsw i64 %indvars.iv3596.us, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next36.us, 1200
  br i1 %exitcond116, label %._crit_edge9.._crit_edge11_crit_edge.us.preheader, label %.lr.ph97.split.us

._crit_edge9.._crit_edge11_crit_edge.us.preheader: ; preds = %._crit_edge94.us
  br label %._crit_edge9.._crit_edge11_crit_edge.us

._crit_edge9.._crit_edge11_crit_edge.us:          ; preds = %._crit_edge9.._crit_edge11_crit_edge.us.preheader, %._crit_edge11._crit_edge.us
  %46 = phi [1200 x double]* [ %59, %._crit_edge11._crit_edge.us ], [ %1, %._crit_edge9.._crit_edge11_crit_edge.us.preheader ]
  %indvars.iv3189.us = phi i64 [ %indvars.iv.next32.us, %._crit_edge11._crit_edge.us ], [ 0, %._crit_edge9.._crit_edge11_crit_edge.us.preheader ]
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us, %._crit_edge9.._crit_edge11_crit_edge.us
  %47 = phi [1200 x double]* [ %46, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %59, %._crit_edge11.us ]
  %indvars.iv2986.us = phi i64 [ 0, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %indvars.iv.next30.us, %._crit_edge11.us ]
  %48 = getelementptr inbounds double, double* %3, i64 %indvars.iv2986.us
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %47, i64 %indvars.iv3189.us, i64 %indvars.iv2986.us
  %51 = load double, double* %50, align 8
  %52 = fsub double %51, %49
  store double %52, double* %50, align 8
  %53 = load double, double* %5, align 8
  %54 = tail call double @sqrt(double %53) #4
  %55 = load double*, double** %8, align 8
  %56 = getelementptr inbounds double, double* %55, i64 %indvars.iv2986.us
  %57 = load double, double* %56, align 8
  %58 = fmul double %54, %57
  %59 = load [1200 x double]*, [1200 x double]** %6, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %59, i64 %indvars.iv3189.us, i64 %indvars.iv2986.us
  %61 = load double, double* %60, align 8
  %62 = fdiv double %61, %58
  store double %62, double* %60, align 8
  %indvars.iv.next30.us = add nuw nsw i64 %indvars.iv2986.us, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next30.us, 1200
  br i1 %exitcond112, label %._crit_edge11._crit_edge.us, label %._crit_edge11.us

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge11.us
  %indvars.iv.next32.us = add nuw nsw i64 %indvars.iv3189.us, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next32.us, 1400
  br i1 %exitcond113, label %.lr.ph.us.us.preheader.preheader, label %._crit_edge9.._crit_edge11_crit_edge.us

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge11._crit_edge.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge12.us
  %63 = phi [1200 x double]* [ %68, %._crit_edge12.us ], [ %2, %.lr.ph.us.us.preheader.preheader ]
  %indvars.iv2772.us = phi i64 [ %indvars.iv.next2667.us, %._crit_edge12.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %63, i64 %indvars.iv2772.us, i64 %indvars.iv2772.us
  store double 1.000000e+00, double* %64, align 8
  %indvars.iv.next2667.us = add nuw nsw i64 %indvars.iv2772.us, 1
  br label %.lr.ph.us.us

._crit_edge12.us:                                 ; preds = %._crit_edge66.us.us
  %exitcond152 = icmp eq i64 %indvars.iv.next2667.us, 1199
  br i1 %exitcond152, label %._crit_edge12._crit_edge, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge66.us.us, %.lr.ph.us.us.preheader
  %indvars.iv.next2668.us.us = phi i64 [ %indvars.iv.next2667.us, %.lr.ph.us.us.preheader ], [ %indvars.iv.next26.us.us, %._crit_edge66.us.us ]
  %65 = phi [1200 x double]* [ %63, %.lr.ph.us.us.preheader ], [ %68, %._crit_edge66.us.us ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %65, i64 %indvars.iv2772.us, i64 %indvars.iv.next2668.us.us
  store double 0.000000e+00, double* %66, align 8
  %67 = load [1200 x double]*, [1200 x double]** %6, align 8
  %68 = load [1200 x double]*, [1200 x double]** %7, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv2772.us, i64 %indvars.iv.next2668.us.us
  %.pre = load double, double* %69, align 8
  br label %71

._crit_edge66.us.us:                              ; preds = %71
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv.next2668.us.us, i64 %indvars.iv2772.us
  store double %84, double* %70, align 8
  %indvars.iv.next26.us.us = add nuw nsw i64 %indvars.iv.next2668.us.us, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next26.us.us, 1200
  br i1 %exitcond110, label %._crit_edge12.us, label %.lr.ph.us.us

; <label>:71:                                     ; preds = %71, %.lr.ph.us.us
  %72 = phi double [ %.pre, %.lr.ph.us.us ], [ %84, %71 ]
  %indvars.iv64.us.us = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.us.us.1, %71 ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %indvars.iv64.us.us, i64 %indvars.iv2772.us
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %indvars.iv64.us.us, i64 %indvars.iv.next2668.us.us
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = fadd double %77, %72
  store double %78, double* %69, align 8
  %indvars.iv.next.us.us = or i64 %indvars.iv64.us.us, 1
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %indvars.iv.next.us.us, i64 %indvars.iv2772.us
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %indvars.iv.next.us.us, i64 %indvars.iv.next2668.us.us
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = fadd double %83, %78
  store double %84, double* %69, align 8
  %indvars.iv.next.us.us.1 = add nuw nsw i64 %indvars.iv64.us.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.us.1, 1400
  br i1 %exitcond.1, label %._crit_edge66.us.us, label %71

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12.us
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 1199, i64 1199
  store double 1.000000e+00, double* %85, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.._crit_edge2_crit_edge.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.._crit_edge2_crit_edge.us

.._crit_edge2_crit_edge.us:                       ; preds = %._crit_edge2._crit_edge.us, %.._crit_edge2_crit_edge.us.preheader
  %indvars.iv37.us = phi i64 [ 0, %.._crit_edge2_crit_edge.us.preheader ], [ %indvars.iv.next4.us, %._crit_edge2._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv37.us, 1200
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us, %.._crit_edge2_crit_edge.us
  %indvars.iv6.us = phi i64 [ 0, %.._crit_edge2_crit_edge.us ], [ %indvars.iv.next.us, %._crit_edge.us ]
  %7 = add nuw nsw i64 %5, %indvars.iv6.us
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37.us, i64 %indvars.iv6.us
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %._crit_edge2._crit_edge.us, label %6

._crit_edge2._crit_edge.us:                       ; preds = %._crit_edge.us
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv37.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next4.us, 1200
  br i1 %exitcond, label %._crit_edge9, label %.._crit_edge2_crit_edge.us

._crit_edge9:                                     ; preds = %._crit_edge2._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
