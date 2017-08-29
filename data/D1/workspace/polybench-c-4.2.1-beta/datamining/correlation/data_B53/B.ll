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
define internal fastcc void @init_array(double*, [1200 x double]*) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %2, %20
  %indvars.iv13 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %20 ]
  %3 = trunc i64 %indvars.iv13 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv2 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv2, %indvars.iv13
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv2
  %indvars.iv.next = or i64 %indvars.iv2, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv13
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = fadd <2 x double> %6, %17
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv2, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond3, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph98.split.us.preheader:
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
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph98.split.us.new

.lr.ph98.split.us.new:                            ; preds = %._crit_edge94.us, %.lr.ph98.split.us.preheader
  %indvars.iv3796.us = phi i64 [ %indvars.iv.next38.us, %._crit_edge94.us ], [ 0, %.lr.ph98.split.us.preheader ]
  %10 = getelementptr inbounds double, double* %3, i64 %indvars.iv3796.us
  store double 0.000000e+00, double* %10, align 8
  %sunkaddr153 = shl i64 %indvars.iv3796.us, 3
  %sunkaddr154 = add i64 %sunkaddr, %sunkaddr153
  %sunkaddr155 = inttoptr i64 %sunkaddr154 to double*
  br label %11

; <label>:11:                                     ; preds = %11, %.lr.ph98.split.us.new
  %12 = phi double [ 0.000000e+00, %.lr.ph98.split.us.new ], [ %24, %11 ]
  %indvars.iv3591.us = phi i64 [ 0, %.lr.ph98.split.us.new ], [ %indvars.iv.next36.us.3, %11 ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3591.us, i64 %indvars.iv3796.us
  %14 = load double, double* %13, align 8
  %15 = fadd double %12, %14
  store double %15, double* %sunkaddr155, align 8
  %indvars.iv.next36.us = or i64 %indvars.iv3591.us, 1
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next36.us, i64 %indvars.iv3796.us
  %17 = load double, double* %16, align 8
  %18 = fadd double %15, %17
  store double %18, double* %sunkaddr155, align 8
  %indvars.iv.next36.us.1 = or i64 %indvars.iv3591.us, 2
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next36.us.1, i64 %indvars.iv3796.us
  %20 = load double, double* %19, align 8
  %21 = fadd double %18, %20
  store double %21, double* %sunkaddr155, align 8
  %indvars.iv.next36.us.2 = or i64 %indvars.iv3591.us, 3
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next36.us.2, i64 %indvars.iv3796.us
  %23 = load double, double* %22, align 8
  %24 = fadd double %21, %23
  store double %24, double* %sunkaddr155, align 8
  %indvars.iv.next36.us.3 = add nsw i64 %indvars.iv3591.us, 4
  %exitcond130.3 = icmp eq i64 %indvars.iv.next36.us.3, 1400
  br i1 %exitcond130.3, label %._crit_edge94.us, label %11

._crit_edge94.us:                                 ; preds = %11
  %25 = fdiv double %24, %0
  %sunkaddr5.us = shl nuw nsw i64 %indvars.iv3796.us, 3
  %sunkaddr6.us = add i64 %sunkaddr5.us, %sunkaddr
  %sunkaddr7.us = inttoptr i64 %sunkaddr6.us to double*
  store double %25, double* %sunkaddr7.us, align 8
  %indvars.iv.next38.us = add nuw nsw i64 %indvars.iv3796.us, 1
  %exitcond131 = icmp eq i64 %indvars.iv.next38.us, 1200
  br i1 %exitcond131, label %.lr.ph88.split.us.new.preheader, label %.lr.ph98.split.us.new

.lr.ph88.split.us.new.preheader:                  ; preds = %._crit_edge94.us
  br label %.lr.ph88.split.us.new

.lr.ph88.split.us.new:                            ; preds = %.lr.ph88.split.us.new.preheader, %._crit_edge85.us
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %._crit_edge85.us ], [ 0, %.lr.ph88.split.us.new.preheader ]
  %26 = phi double* [ %44, %._crit_edge85.us ], [ %4, %.lr.ph88.split.us.new.preheader ]
  %sext = shl i64 %indvars.iv126, 32
  %27 = ashr exact i64 %sext, 32
  %28 = getelementptr inbounds double, double* %26, i64 %27
  store double 0.000000e+00, double* %28, align 8
  %sunkaddr9.us = ashr exact i64 %sext, 29
  %sunkaddr157 = ashr exact i64 %sext, 29
  %sunkaddr158 = add i64 %sunkaddr, %sunkaddr157
  %sunkaddr159 = inttoptr i64 %sunkaddr158 to double*
  %sunkaddr160 = ptrtoint double* %26 to i64
  %sunkaddr161 = add i64 %sunkaddr160, %sunkaddr9.us
  %sunkaddr162 = inttoptr i64 %sunkaddr161 to double*
  br label %29

; <label>:29:                                     ; preds = %29, %.lr.ph88.split.us.new
  %30 = phi double [ 0.000000e+00, %.lr.ph88.split.us.new ], [ %42, %29 ]
  %indvars.iv3382.us = phi i64 [ 0, %.lr.ph88.split.us.new ], [ %indvars.iv.next34.us.1, %29 ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3382.us, i64 %27
  %32 = load double, double* %31, align 8
  %33 = load double, double* %sunkaddr159, align 8
  %34 = fsub double %32, %33
  %35 = fmul double %34, %34
  %36 = fadd double %30, %35
  store double %36, double* %sunkaddr162, align 8
  %indvars.iv.next34.us = or i64 %indvars.iv3382.us, 1
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next34.us, i64 %27
  %38 = load double, double* %37, align 8
  %39 = load double, double* %sunkaddr159, align 8
  %40 = fsub double %38, %39
  %41 = fmul double %40, %40
  %42 = fadd double %36, %41
  store double %42, double* %sunkaddr162, align 8
  %indvars.iv.next34.us.1 = add nsw i64 %indvars.iv3382.us, 2
  %exitcond125.1 = icmp eq i64 %indvars.iv.next34.us.1, 1400
  br i1 %exitcond125.1, label %._crit_edge85.us, label %29

._crit_edge85.us:                                 ; preds = %29
  %43 = fdiv double %42, %0
  store double %43, double* %sunkaddr162, align 8
  %44 = load double*, double** %8, align 8
  %45 = getelementptr inbounds double, double* %44, i64 %27
  %46 = load double, double* %45, align 8
  %47 = tail call double @sqrt(double %46) #4
  %48 = getelementptr inbounds double, double* %44, i64 %indvars.iv126
  store double %47, double* %48, align 8
  %49 = load double, double* %9, align 8
  %50 = fcmp ole double %47, %49
  %51 = select i1 %50, double 1.000000e+00, double %47
  %sunkaddr16.us = ptrtoint double* %44 to i64
  %sunkaddr17.us = shl nsw i64 %indvars.iv126, 3
  %sunkaddr18.us = add i64 %sunkaddr17.us, %sunkaddr16.us
  %sunkaddr19.us = inttoptr i64 %sunkaddr18.us to double*
  store double %51, double* %sunkaddr19.us, align 8
  %indvars.iv.next127 = add nsw i64 %indvars.iv126, 1
  %52 = icmp slt i64 %indvars.iv.next127, 1200
  br i1 %52, label %.lr.ph88.split.us.new, label %._crit_edge.us.preheader

._crit_edge.us.preheader:                         ; preds = %._crit_edge85.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge74.us
  %53 = phi [1200 x double]* [ %67, %._crit_edge74.us ], [ %1, %._crit_edge.us.preheader ]
  %indvars.iv3177.us = phi i64 [ %indvars.iv.next32.us, %._crit_edge74.us ], [ 0, %._crit_edge.us.preheader ]
  br label %54

; <label>:54:                                     ; preds = %54, %._crit_edge.us
  %indvars.iv120 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next121, %54 ]
  %55 = phi [1200 x double]* [ %53, %._crit_edge.us ], [ %67, %54 ]
  %56 = getelementptr inbounds double, double* %3, i64 %indvars.iv120
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %55, i64 %indvars.iv3177.us, i64 %indvars.iv120
  %59 = load double, double* %58, align 8
  %60 = fsub double %59, %57
  store double %60, double* %58, align 8
  %61 = load double, double* %5, align 8
  %62 = tail call double @sqrt(double %61) #4
  %63 = load double*, double** %8, align 8
  %64 = getelementptr inbounds double, double* %63, i64 %indvars.iv120
  %65 = load double, double* %64, align 8
  %66 = fmul double %62, %65
  %67 = load [1200 x double]*, [1200 x double]** %6, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %indvars.iv3177.us, i64 %indvars.iv120
  %69 = load double, double* %68, align 8
  %70 = fdiv double %69, %66
  store double %70, double* %68, align 8
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next121, 1200
  br i1 %exitcond122, label %._crit_edge74.us, label %54

._crit_edge74.us:                                 ; preds = %54
  %indvars.iv.next32.us = add nuw nsw i64 %indvars.iv3177.us, 1
  %exitcond123 = icmp eq i64 %indvars.iv.next32.us, 1400
  br i1 %exitcond123, label %.lr.ph59.split.us.preheader, label %._crit_edge.us

.lr.ph59.split.us.preheader:                      ; preds = %._crit_edge74.us
  br label %.lr.ph59.split.us

.lr.ph59.split.us:                                ; preds = %.lr.ph59.split.us.preheader, %._crit_edge55.us-lcssa.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge55.us-lcssa.us.us ], [ 1, %.lr.ph59.split.us.preheader ]
  %71 = phi [1200 x double]* [ %.lcssa.us, %._crit_edge55.us-lcssa.us.us ], [ %2, %.lr.ph59.split.us.preheader ]
  %indvars.iv2956.us = phi i64 [ %indvars.iv.next30.us, %._crit_edge55.us-lcssa.us.us ], [ 0, %.lr.ph59.split.us.preheader ]
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %indvars.iv2956.us, i64 %indvars.iv2956.us
  store double 1.000000e+00, double* %72, align 8
  %indvars.iv.next30.us = add nuw nsw i64 %indvars.iv2956.us, 1
  %73 = icmp slt i64 %indvars.iv, 1200
  br i1 %73, label %.lr.ph.us.us.new.preheader, label %._crit_edge55.us-lcssa.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.lr.ph59.split.us
  br label %.lr.ph.us.us.new

._crit_edge55.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge50.us.us
  br label %._crit_edge55.us-lcssa.us.us

._crit_edge55.us-lcssa.us.us:                     ; preds = %._crit_edge55.us-lcssa.us.us.loopexit, %.lr.ph59.split.us
  %.lcssa.us = phi [1200 x double]* [ %71, %.lr.ph59.split.us ], [ %78, %._crit_edge55.us-lcssa.us.us.loopexit ]
  %74 = icmp slt i64 %indvars.iv.next30.us, 1199
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %74, label %.lr.ph59.split.us, label %95

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %._crit_edge50.us.us
  %75 = phi [1200 x double]* [ %78, %._crit_edge50.us.us ], [ %71, %.lr.ph.us.us.new.preheader ]
  %indvars.iv2752.us.us = phi i64 [ %indvars.iv.next28.us.us, %._crit_edge50.us.us ], [ %indvars.iv, %.lr.ph.us.us.new.preheader ]
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %75, i64 %indvars.iv2956.us, i64 %indvars.iv2752.us.us
  store double 0.000000e+00, double* %76, align 8
  %77 = load [1200 x double]*, [1200 x double]** %6, align 8
  %78 = load [1200 x double]*, [1200 x double]** %7, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %78, i64 %indvars.iv2956.us, i64 %indvars.iv2752.us.us
  %.pre = load double, double* %79, align 8
  br label %81

._crit_edge50.us.us:                              ; preds = %81
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %78, i64 %indvars.iv2752.us.us, i64 %indvars.iv2956.us
  store double %94, double* %80, align 8
  %indvars.iv.next28.us.us = add nuw nsw i64 %indvars.iv2752.us.us, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next28.us.us, 1200
  br i1 %exitcond114, label %._crit_edge55.us-lcssa.us.us.loopexit, label %.lr.ph.us.us.new

; <label>:81:                                     ; preds = %81, %.lr.ph.us.us.new
  %82 = phi double [ %.pre, %.lr.ph.us.us.new ], [ %94, %81 ]
  %indvars.iv48.us.us = phi i64 [ 0, %.lr.ph.us.us.new ], [ %indvars.iv.next.us.us.1, %81 ]
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %77, i64 %indvars.iv48.us.us, i64 %indvars.iv2956.us
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %77, i64 %indvars.iv48.us.us, i64 %indvars.iv2752.us.us
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %87, %82
  store double %88, double* %79, align 8
  %indvars.iv.next.us.us = or i64 %indvars.iv48.us.us, 1
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %77, i64 %indvars.iv.next.us.us, i64 %indvars.iv2956.us
  %90 = load double, double* %89, align 8
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %77, i64 %indvars.iv.next.us.us, i64 %indvars.iv2752.us.us
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = fadd double %93, %88
  store double %94, double* %79, align 8
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv48.us.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.us.1, 1400
  br i1 %exitcond.1, label %._crit_edge50.us.us, label %81

; <label>:95:                                     ; preds = %._crit_edge55.us-lcssa.us.us
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %.lcssa.us, i64 1199, i64 1199
  store double 1.000000e+00, double* %96, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]*) unnamed_addr #0 {
._crit_edge.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6, %._crit_edge.preheader
  %indvars.iv17 = phi i64 [ %indvars.iv.next2, %._crit_edge6 ], [ 0, %._crit_edge.preheader ]
  %5 = mul nsw i64 %indvars.iv17, 1200
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %._crit_edge3
  %indvars.iv5 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next, %._crit_edge3 ]
  %7 = add nsw i64 %indvars.iv5, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge3

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv5
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge6, label %6

._crit_edge6:                                     ; preds = %._crit_edge3
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond11, label %._crit_edge9, label %._crit_edge

._crit_edge9:                                     ; preds = %._crit_edge6
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
