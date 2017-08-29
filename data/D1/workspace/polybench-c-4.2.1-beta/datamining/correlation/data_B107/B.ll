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
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  call fastcc void @kernel_correlation(double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array([1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %19, %2
  %indvars.iv22 = phi i64 [ 0, %2 ], [ %indvars.iv.next3, %19 ]
  %3 = trunc i64 %indvars.iv22 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3, %._crit_edge
  %indvars.iv1 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %._crit_edge3 ]
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
  br i1 %exitcond.1, label %19, label %._crit_edge3

; <label>:19:                                     ; preds = %._crit_edge3
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next3, 1400
  br i1 %exitcond4, label %20, label %._crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph92:
  %5 = alloca double, align 8
  %6 = alloca [1200 x double]*, align 8
  %7 = alloca [1200 x double]*, align 8
  %8 = alloca double*, align 8
  store double %0, double* %5, align 8
  store [1200 x double]* %1, [1200 x double]** %6, align 8
  store [1200 x double]* %2, [1200 x double]** %7, align 8
  store double* %4, double** %8, align 8
  %9 = ptrtoint double* %3 to i64
  br label %.lr.ph92.split.us

.lr.ph92.split.us:                                ; preds = %._crit_edge87.us, %.lr.ph92
  %indvars.iv3989.us = phi i64 [ 0, %.lr.ph92 ], [ %indvars.iv.next40.us, %._crit_edge87.us ]
  %10 = getelementptr inbounds double, double* %3, i64 %indvars.iv3989.us
  store double 0.000000e+00, double* %10, align 8
  %.pre160 = shl nuw nsw i64 %indvars.iv3989.us, 3
  %sunkaddr94 = add i64 %9, %.pre160
  %11 = inttoptr i64 %sunkaddr94 to double*
  %12 = inttoptr i64 %sunkaddr94 to double*
  br label %.lr.ph92.split.us.new

.lr.ph92.split.us.new:                            ; preds = %.lr.ph92.split.us.new, %.lr.ph92.split.us
  %13 = phi double [ 0.000000e+00, %.lr.ph92.split.us ], [ %25, %.lr.ph92.split.us.new ]
  %indvars.iv3784.us = phi i64 [ 0, %.lr.ph92.split.us ], [ %indvars.iv.next38.us.1.1, %.lr.ph92.split.us.new ]
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3784.us, i64 %indvars.iv3989.us
  %15 = load double, double* %14, align 8
  %16 = fadd double %15, %13
  store double %16, double* %11, align 8
  %indvars.iv.next38.us = or i64 %indvars.iv3784.us, 1
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next38.us, i64 %indvars.iv3989.us
  %18 = load double, double* %17, align 8
  %19 = fadd double %18, %16
  store double %19, double* %11, align 8
  %indvars.iv.next38.us.1 = or i64 %indvars.iv3784.us, 2
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next38.us.1, i64 %indvars.iv3989.us
  %21 = load double, double* %20, align 8
  %22 = fadd double %21, %19
  store double %22, double* %12, align 8
  %indvars.iv.next38.us.139 = or i64 %indvars.iv3784.us, 3
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next38.us.139, i64 %indvars.iv3989.us
  %24 = load double, double* %23, align 8
  %25 = fadd double %24, %22
  store double %25, double* %12, align 8
  %indvars.iv.next38.us.1.1 = add nsw i64 %indvars.iv3784.us, 4
  %exitcond148.1.1 = icmp eq i64 %indvars.iv.next38.us.1.1, 1400
  br i1 %exitcond148.1.1, label %._crit_edge87.us, label %.lr.ph92.split.us.new

._crit_edge87.us:                                 ; preds = %.lr.ph92.split.us.new
  %26 = fdiv double %25, %0
  store double %26, double* %12, align 8
  %indvars.iv.next40.us = add nuw nsw i64 %indvars.iv3989.us, 1
  %exitcond154 = icmp eq i64 %indvars.iv.next40.us, 1200
  br i1 %exitcond154, label %.lr.ph83.split.us.preheader, label %.lr.ph92.split.us

.lr.ph83.split.us.preheader:                      ; preds = %._crit_edge87.us
  %27 = ptrtoint double* %4 to i64
  br label %.lr.ph83.split.us

.lr.ph83.split.us:                                ; preds = %.lr.ph83.split.us.preheader, %._crit_edge79.us
  %indvars.iv3581.us = phi i64 [ %indvars.iv.next36.us, %._crit_edge79.us ], [ 0, %.lr.ph83.split.us.preheader ]
  %28 = getelementptr inbounds double, double* %4, i64 %indvars.iv3581.us
  store double 0.000000e+00, double* %28, align 8
  %.pre164 = shl nuw nsw i64 %indvars.iv3581.us, 3
  %sunkaddr106 = add i64 %27, %.pre164
  %29 = inttoptr i64 %sunkaddr106 to double*
  %sunkaddr187 = add i64 %9, %.pre164
  %sunkaddr188 = inttoptr i64 %sunkaddr187 to double*
  br label %.lr.ph83.split.us.new

.lr.ph83.split.us.new:                            ; preds = %.lr.ph83.split.us.new, %.lr.ph83.split.us
  %30 = phi double [ 0.000000e+00, %.lr.ph83.split.us ], [ %42, %.lr.ph83.split.us.new ]
  %indvars.iv3376.us = phi i64 [ 0, %.lr.ph83.split.us ], [ %indvars.iv.next34.us.1, %.lr.ph83.split.us.new ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3376.us, i64 %indvars.iv3581.us
  %32 = load double, double* %31, align 8
  %33 = load double, double* %sunkaddr188, align 8
  %34 = fsub double %32, %33
  %35 = fmul double %34, %34
  %36 = fadd double %35, %30
  store double %36, double* %29, align 8
  %indvars.iv.next34.us = or i64 %indvars.iv3376.us, 1
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next34.us, i64 %indvars.iv3581.us
  %38 = load double, double* %37, align 8
  %39 = load double, double* %sunkaddr188, align 8
  %40 = fsub double %38, %39
  %41 = fmul double %40, %40
  %42 = fadd double %41, %36
  store double %42, double* %29, align 8
  %indvars.iv.next34.us.1 = add nuw nsw i64 %indvars.iv3376.us, 2
  %exitcond138.1 = icmp eq i64 %indvars.iv.next34.us.1, 1400
  br i1 %exitcond138.1, label %._crit_edge79.us, label %.lr.ph83.split.us.new

._crit_edge79.us:                                 ; preds = %.lr.ph83.split.us.new
  %43 = fdiv double %42, %0
  store double %43, double* %29, align 8
  %44 = tail call double @sqrt(double %43) #4
  %45 = fcmp ugt double %44, 1.000000e-01
  %46 = select i1 %45, double %44, double 1.000000e+00
  store double %46, double* %29, align 8
  %indvars.iv.next36.us = add nuw nsw i64 %indvars.iv3581.us, 1
  %exitcond144 = icmp eq i64 %indvars.iv.next36.us, 1200
  br i1 %exitcond144, label %._crit_edge11.us.preheader, label %.lr.ph83.split.us

._crit_edge11.us.preheader:                       ; preds = %._crit_edge79.us
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.preheader, %._crit_edge72.us
  %47 = phi [1200 x double]* [ %60, %._crit_edge72.us ], [ %1, %._crit_edge11.us.preheader ]
  %indvars.iv3174.us = phi i64 [ %indvars.iv.next32.us, %._crit_edge72.us ], [ 0, %._crit_edge11.us.preheader ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge11.us
  %48 = phi [1200 x double]* [ %47, %._crit_edge11.us ], [ %60, %._crit_edge ]
  %indvars.iv2970.us = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next30.us, %._crit_edge ]
  %49 = getelementptr inbounds double, double* %3, i64 %indvars.iv2970.us
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %48, i64 %indvars.iv3174.us, i64 %indvars.iv2970.us
  %52 = load double, double* %51, align 8
  %53 = fsub double %52, %50
  store double %53, double* %51, align 8
  %54 = load double, double* %5, align 8
  %55 = tail call double @sqrt(double %54) #4
  %56 = load double*, double** %8, align 8
  %57 = getelementptr inbounds double, double* %56, i64 %indvars.iv2970.us
  %58 = load double, double* %57, align 8
  %59 = fmul double %55, %58
  %60 = load [1200 x double]*, [1200 x double]** %6, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %60, i64 %indvars.iv3174.us, i64 %indvars.iv2970.us
  %62 = load double, double* %61, align 8
  %63 = fdiv double %62, %59
  store double %63, double* %61, align 8
  %indvars.iv.next30.us = add nuw nsw i64 %indvars.iv2970.us, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next30.us, 1200
  br i1 %exitcond135, label %._crit_edge72.us, label %._crit_edge

._crit_edge72.us:                                 ; preds = %._crit_edge
  %indvars.iv.next32.us = add nuw nsw i64 %indvars.iv3174.us, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next32.us, 1400
  br i1 %exitcond136, label %.lr.ph57.split.us.preheader, label %._crit_edge11.us

.lr.ph57.split.us.preheader:                      ; preds = %._crit_edge72.us
  br label %.lr.ph57.split.us

.lr.ph57.split.us:                                ; preds = %.lr.ph57.split.us.preheader, %._crit_edge53.us-lcssa.us.us
  %64 = phi [1200 x double]* [ %69, %._crit_edge53.us-lcssa.us.us ], [ %2, %.lr.ph57.split.us.preheader ]
  %indvars.iv2754.us = phi i64 [ %indvars.iv.next2649.us, %._crit_edge53.us-lcssa.us.us ], [ 0, %.lr.ph57.split.us.preheader ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %64, i64 %indvars.iv2754.us, i64 %indvars.iv2754.us
  store double 1.000000e+00, double* %65, align 8
  %indvars.iv.next2649.us = add nuw nsw i64 %indvars.iv2754.us, 1
  br label %.lr.ph.us.us

._crit_edge53.us-lcssa.us.us:                     ; preds = %.lr.ph.us.us.new.._crit_edge48.us.us_crit_edge
  %exitcond130 = icmp eq i64 %indvars.iv.next2649.us, 1199
  br i1 %exitcond130, label %._crit_edge58, label %.lr.ph57.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph57.split.us, %.lr.ph.us.us.new.._crit_edge48.us.us_crit_edge
  %indvars.iv.next2650.us.us = phi i64 [ %indvars.iv.next26.us.us, %.lr.ph.us.us.new.._crit_edge48.us.us_crit_edge ], [ %indvars.iv.next2649.us, %.lr.ph57.split.us ]
  %66 = phi [1200 x double]* [ %69, %.lr.ph.us.us.new.._crit_edge48.us.us_crit_edge ], [ %64, %.lr.ph57.split.us ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %indvars.iv2754.us, i64 %indvars.iv.next2650.us.us
  store double 0.000000e+00, double* %67, align 8
  %68 = load [1200 x double]*, [1200 x double]** %6, align 8
  %69 = load [1200 x double]*, [1200 x double]** %7, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %69, i64 %indvars.iv2754.us, i64 %indvars.iv.next2650.us.us
  %.pre = load double, double* %70, align 8
  br label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us
  %71 = phi double [ %.pre, %.lr.ph.us.us ], [ %83, %.lr.ph.us.us.new ]
  %indvars.iv46.us.us = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.us.us.1, %.lr.ph.us.us.new ]
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv46.us.us, i64 %indvars.iv2754.us
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv46.us.us, i64 %indvars.iv.next2650.us.us
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fadd double %76, %71
  store double %77, double* %70, align 8
  %indvars.iv.next.us.us = or i64 %indvars.iv46.us.us, 1
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv.next.us.us, i64 %indvars.iv2754.us
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv.next.us.us, i64 %indvars.iv.next2650.us.us
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = fadd double %82, %77
  store double %83, double* %70, align 8
  %indvars.iv.next.us.us.1 = add nuw nsw i64 %indvars.iv46.us.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.us.1, 1400
  br i1 %exitcond.1, label %.lr.ph.us.us.new.._crit_edge48.us.us_crit_edge, label %.lr.ph.us.us.new

.lr.ph.us.us.new.._crit_edge48.us.us_crit_edge:   ; preds = %.lr.ph.us.us.new
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %69, i64 %indvars.iv.next2650.us.us, i64 %indvars.iv2754.us
  store double %83, double* %84, align 8
  %indvars.iv.next26.us.us = add nuw nsw i64 %indvars.iv.next2650.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next26.us.us, 1200
  br i1 %exitcond, label %._crit_edge53.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge58:                                    ; preds = %._crit_edge53.us-lcssa.us.us
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %69, i64 1199, i64 1199
  store double 1.000000e+00, double* %85, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge2.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge7.us, %._crit_edge2.lr.ph
  %indvars.iv38.us = phi i64 [ 0, %._crit_edge2.lr.ph ], [ %indvars.iv.next4.us, %._crit_edge7.us ]
  %5 = mul nuw nsw i64 %indvars.iv38.us, 1200
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %._crit_edge2.us
  %indvars.iv6.us = phi i64 [ 0, %._crit_edge2.us ], [ %indvars.iv.next.us, %._crit_edge.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv6.us
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge.us

; <label>:10:                                     ; preds = %._crit_edge.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv38.us, i64 %indvars.iv6.us
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %._crit_edge7.us, label %._crit_edge.us._crit_edge

._crit_edge7.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv38.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next4.us, 1200
  br i1 %exitcond, label %._crit_edge10, label %._crit_edge2.us

._crit_edge10:                                    ; preds = %._crit_edge7.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
