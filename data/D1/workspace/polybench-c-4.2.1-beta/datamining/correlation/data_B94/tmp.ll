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
  %indvars.iv22 = phi i64 [ 0, %2 ], [ %indvars.iv.next3, %19 ]
  %3 = trunc i64 %indvars.iv22 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv1 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv1, %indvars.iv22
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv1
  %indvars.iv.next = or i64 %indvars.iv1, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv22
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv1, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next3, 1400
  br i1 %exitcond4, label %20, label %.._crit_edge_crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph81:
  %5 = alloca double, align 8
  %6 = alloca [1200 x double]*, align 8
  %7 = alloca [1200 x double]*, align 8
  %8 = alloca double*, align 8
  %9 = alloca double, align 8
  store double %0, double* %5, align 8
  store [1200 x double]* %1, [1200 x double]** %6, align 8
  store [1200 x double]* %2, [1200 x double]** %7, align 8
  store double* %4, double** %8, align 8
  store double 1.000000e-01, double* %9, align 8
  %10 = ptrtoint double* %3 to i64
  br label %.lr.ph81.split.us

.lr.ph81.split.us:                                ; preds = %.lr.ph81, %._crit_edge.us
  %indvars.iv3978.us = phi i64 [ %indvars.iv.next40.us, %._crit_edge.us ], [ 0, %.lr.ph81 ]
  %11 = getelementptr inbounds double, double* %3, i64 %indvars.iv3978.us
  store double 0.000000e+00, double* %11, align 8
  %.pre148 = shl nuw nsw i64 %indvars.iv3978.us, 3
  %sunkaddr83 = add i64 %10, %.pre148
  %12 = inttoptr i64 %sunkaddr83 to double*
  %13 = inttoptr i64 %sunkaddr83 to double*
  br label %.lr.ph81.split.us.new

.lr.ph81.split.us.new:                            ; preds = %.lr.ph81.split.us.new, %.lr.ph81.split.us
  %14 = phi double [ 0.000000e+00, %.lr.ph81.split.us ], [ %26, %.lr.ph81.split.us.new ]
  %indvars.iv3775.us = phi i64 [ 0, %.lr.ph81.split.us ], [ %indvars.iv.next38.us.1.1, %.lr.ph81.split.us.new ]
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3775.us, i64 %indvars.iv3978.us
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %12, align 8
  %indvars.iv.next38.us = or i64 %indvars.iv3775.us, 1
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next38.us, i64 %indvars.iv3978.us
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %12, align 8
  %indvars.iv.next38.us.1 = or i64 %indvars.iv3775.us, 2
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next38.us.1, i64 %indvars.iv3978.us
  %22 = load double, double* %21, align 8
  %23 = fadd double %22, %20
  store double %23, double* %13, align 8
  %indvars.iv.next38.us.139 = or i64 %indvars.iv3775.us, 3
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next38.us.139, i64 %indvars.iv3978.us
  %25 = load double, double* %24, align 8
  %26 = fadd double %25, %23
  store double %26, double* %13, align 8
  %indvars.iv.next38.us.1.1 = add nsw i64 %indvars.iv3775.us, 4
  %exitcond136.1.1 = icmp eq i64 %indvars.iv.next38.us.1.1, 1400
  br i1 %exitcond136.1.1, label %._crit_edge.us, label %.lr.ph81.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph81.split.us.new
  %27 = fdiv double %26, %0
  store double %27, double* %13, align 8
  %indvars.iv.next40.us = add nuw nsw i64 %indvars.iv3978.us, 1
  %exitcond142 = icmp eq i64 %indvars.iv.next40.us, 1200
  br i1 %exitcond142, label %.lr.ph74, label %.lr.ph81.split.us

.lr.ph74:                                         ; preds = %._crit_edge.us
  %28 = load double*, double** %8, align 8
  %29 = load double, double* %9, align 8
  br label %.lr.ph74.split.us

.lr.ph74.split.us:                                ; preds = %.lr.ph74, %._crit_edge71.us
  %30 = phi double* [ %28, %._crit_edge71.us ], [ %4, %.lr.ph74 ]
  %indvars.iv3573.us = phi i64 [ %indvars.iv.next36.us, %._crit_edge71.us ], [ 0, %.lr.ph74 ]
  %31 = getelementptr inbounds double, double* %30, i64 %indvars.iv3573.us
  store double 0.000000e+00, double* %31, align 8
  %sunkaddr90 = shl nuw nsw i64 %indvars.iv3573.us, 3
  %sunkaddr93 = ptrtoint double* %30 to i64
  %sunkaddr95 = add i64 %sunkaddr93, %sunkaddr90
  %32 = inttoptr i64 %sunkaddr95 to double*
  %sunkaddr186 = add i64 %10, %sunkaddr90
  %sunkaddr187 = inttoptr i64 %sunkaddr186 to double*
  br label %.lr.ph74.split.us.new

.lr.ph74.split.us.new:                            ; preds = %.lr.ph74.split.us, %.lr.ph74.split.us.new
  %33 = phi double [ %45, %.lr.ph74.split.us.new ], [ 0.000000e+00, %.lr.ph74.split.us ]
  %indvars.iv3368.us = phi i64 [ %indvars.iv.next34.us.1, %.lr.ph74.split.us.new ], [ 0, %.lr.ph74.split.us ]
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3368.us, i64 %indvars.iv3573.us
  %35 = load double, double* %34, align 8
  %36 = load double, double* %sunkaddr187, align 8
  %37 = fsub double %35, %36
  %38 = fmul double %37, %37
  %39 = fadd double %38, %33
  store double %39, double* %32, align 8
  %indvars.iv.next34.us = or i64 %indvars.iv3368.us, 1
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next34.us, i64 %indvars.iv3573.us
  %41 = load double, double* %40, align 8
  %42 = load double, double* %sunkaddr187, align 8
  %43 = fsub double %41, %42
  %44 = fmul double %43, %43
  %45 = fadd double %44, %39
  store double %45, double* %32, align 8
  %indvars.iv.next34.us.1 = add nuw nsw i64 %indvars.iv3368.us, 2
  %exitcond125.1 = icmp eq i64 %indvars.iv.next34.us.1, 1400
  br i1 %exitcond125.1, label %._crit_edge71.us, label %.lr.ph74.split.us.new

._crit_edge71.us:                                 ; preds = %.lr.ph74.split.us.new
  %46 = fdiv double %45, %0
  store double %46, double* %32, align 8
  %47 = getelementptr inbounds double, double* %28, i64 %indvars.iv3573.us
  %48 = load double, double* %47, align 8
  %49 = tail call double @sqrt(double %48) #4
  %50 = fcmp ugt double %49, %29
  %51 = select i1 %50, double %49, double 1.000000e+00
  store double %51, double* %47, align 8
  %indvars.iv.next36.us = add nuw nsw i64 %indvars.iv3573.us, 1
  %exitcond131 = icmp eq i64 %indvars.iv.next36.us, 1200
  br i1 %exitcond131, label %._crit_edge9.._crit_edge11_crit_edge.us.preheader, label %.lr.ph74.split.us

._crit_edge9.._crit_edge11_crit_edge.us.preheader: ; preds = %._crit_edge71.us
  br label %._crit_edge9.._crit_edge11_crit_edge.us

._crit_edge9.._crit_edge11_crit_edge.us:          ; preds = %._crit_edge9.._crit_edge11_crit_edge.us.preheader, %._crit_edge11._crit_edge.us
  %52 = phi [1200 x double]* [ %65, %._crit_edge11._crit_edge.us ], [ %1, %._crit_edge9.._crit_edge11_crit_edge.us.preheader ]
  %indvars.iv3166.us = phi i64 [ %indvars.iv.next32.us, %._crit_edge11._crit_edge.us ], [ 0, %._crit_edge9.._crit_edge11_crit_edge.us.preheader ]
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us, %._crit_edge9.._crit_edge11_crit_edge.us
  %53 = phi [1200 x double]* [ %52, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %65, %._crit_edge11.us ]
  %indvars.iv2963.us = phi i64 [ 0, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %indvars.iv.next30.us, %._crit_edge11.us ]
  %54 = getelementptr inbounds double, double* %3, i64 %indvars.iv2963.us
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %53, i64 %indvars.iv3166.us, i64 %indvars.iv2963.us
  %57 = load double, double* %56, align 8
  %58 = fsub double %57, %55
  store double %58, double* %56, align 8
  %59 = load double, double* %5, align 8
  %60 = tail call double @sqrt(double %59) #4
  %61 = load double*, double** %8, align 8
  %62 = getelementptr inbounds double, double* %61, i64 %indvars.iv2963.us
  %63 = load double, double* %62, align 8
  %64 = fmul double %60, %63
  %65 = load [1200 x double]*, [1200 x double]** %6, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %65, i64 %indvars.iv3166.us, i64 %indvars.iv2963.us
  %67 = load double, double* %66, align 8
  %68 = fdiv double %67, %64
  store double %68, double* %66, align 8
  %indvars.iv.next30.us = add nuw nsw i64 %indvars.iv2963.us, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next30.us, 1200
  br i1 %exitcond122, label %._crit_edge11._crit_edge.us, label %._crit_edge11.us

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge11.us
  %indvars.iv.next32.us = add nuw nsw i64 %indvars.iv3166.us, 1
  %exitcond123 = icmp eq i64 %indvars.iv.next32.us, 1400
  br i1 %exitcond123, label %.lr.ph.us.us.preheader.preheader, label %._crit_edge9.._crit_edge11_crit_edge.us

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge11._crit_edge.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge12.us
  %69 = phi [1200 x double]* [ %74, %._crit_edge12.us ], [ %2, %.lr.ph.us.us.preheader.preheader ]
  %indvars.iv2749.us = phi i64 [ %indvars.iv.next2644.us, %._crit_edge12.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %69, i64 %indvars.iv2749.us, i64 %indvars.iv2749.us
  store double 1.000000e+00, double* %70, align 8
  %indvars.iv.next2644.us = add nuw nsw i64 %indvars.iv2749.us, 1
  br label %.lr.ph.us.us

._crit_edge12.us:                                 ; preds = %.lr.ph.us.us.new.._crit_edge43.us.us_crit_edge
  %exitcond183 = icmp eq i64 %indvars.iv.next2644.us, 1199
  br i1 %exitcond183, label %._crit_edge12._crit_edge, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %.lr.ph.us.us.new.._crit_edge43.us.us_crit_edge
  %indvars.iv.next2645.us.us = phi i64 [ %indvars.iv.next26.us.us, %.lr.ph.us.us.new.._crit_edge43.us.us_crit_edge ], [ %indvars.iv.next2644.us, %.lr.ph.us.us.preheader ]
  %71 = phi [1200 x double]* [ %74, %.lr.ph.us.us.new.._crit_edge43.us.us_crit_edge ], [ %69, %.lr.ph.us.us.preheader ]
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %indvars.iv2749.us, i64 %indvars.iv.next2645.us.us
  store double 0.000000e+00, double* %72, align 8
  %73 = load [1200 x double]*, [1200 x double]** %6, align 8
  %74 = load [1200 x double]*, [1200 x double]** %7, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %74, i64 %indvars.iv2749.us, i64 %indvars.iv.next2645.us.us
  %.pre = load double, double* %75, align 8
  br label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %76 = phi double [ %88, %.lr.ph.us.us.new ], [ %.pre, %.lr.ph.us.us ]
  %indvars.iv41.us.us = phi i64 [ %indvars.iv.next.us.us.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %73, i64 %indvars.iv41.us.us, i64 %indvars.iv2749.us
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %73, i64 %indvars.iv41.us.us, i64 %indvars.iv.next2645.us.us
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %81, %76
  store double %82, double* %75, align 8
  %indvars.iv.next.us.us = or i64 %indvars.iv41.us.us, 1
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %73, i64 %indvars.iv.next.us.us, i64 %indvars.iv2749.us
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %73, i64 %indvars.iv.next.us.us, i64 %indvars.iv.next2645.us.us
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %87, %82
  store double %88, double* %75, align 8
  %indvars.iv.next.us.us.1 = add nuw nsw i64 %indvars.iv41.us.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.us.1, 1400
  br i1 %exitcond.1, label %.lr.ph.us.us.new.._crit_edge43.us.us_crit_edge, label %.lr.ph.us.us.new

.lr.ph.us.us.new.._crit_edge43.us.us_crit_edge:   ; preds = %.lr.ph.us.us.new
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %74, i64 %indvars.iv.next2645.us.us, i64 %indvars.iv2749.us
  store double %88, double* %89, align 8
  %indvars.iv.next26.us.us = add nuw nsw i64 %indvars.iv.next2645.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next26.us.us, 1200
  br i1 %exitcond, label %._crit_edge12.us, label %.lr.ph.us.us

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12.us
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %74, i64 1199, i64 1199
  store double 1.000000e+00, double* %90, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.._crit_edge_crit_edge.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %._crit_edge._crit_edge.us, %.._crit_edge_crit_edge.lr.ph
  %indvars.iv37.us = phi i64 [ %indvars.iv.next4.us, %._crit_edge._crit_edge.us ], [ 0, %.._crit_edge_crit_edge.lr.ph ]
  %5 = mul nuw nsw i64 %indvars.iv37.us, 1200
  br label %6

; <label>:6:                                      ; preds = %._crit_edge2.us, %.._crit_edge_crit_edge.us
  %indvars.iv6.us = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next.us, %._crit_edge2.us ]
  %7 = add nuw nsw i64 %5, %indvars.iv6.us
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge2.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37.us, i64 %indvars.iv6.us
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %._crit_edge._crit_edge.us, label %6

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv37.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next4.us, 1200
  br i1 %exitcond, label %._crit_edge, label %.._crit_edge_crit_edge.us

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
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
