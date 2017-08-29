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
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge15

.._crit_edge_crit_edge15:                         ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge15, %.._crit_edge_crit_edge, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %4
  %indvars.iv8 = phi i64 [ 0, %4 ], [ %indvars.iv.next9, %.._crit_edge_crit_edge ]
  %5 = trunc i64 %indvars.iv8 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.._crit_edge10_crit_edge, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %._crit_edge10.._crit_edge10_crit_edge ]
  %9 = mul nuw nsw i64 %indvars.iv, %indvars.iv8
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv8, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv8
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %11, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.200000e+03, double 1.200000e+03>
  %19 = fadd <2 x double> %8, %18
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %21, label %._crit_edge10.._crit_edge10_crit_edge

._crit_edge10.._crit_edge10_crit_edge:            ; preds = %._crit_edge10
  br label %._crit_edge10

; <label>:21:                                     ; preds = %._crit_edge10
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 1400
  br i1 %exitcond, label %22, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %21
  br label %._crit_edge

; <label>:22:                                     ; preds = %21
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph126:
  br label %.lr.ph126.split.us

.lr.ph126.split.us:                               ; preds = %._crit_edge123.us..lr.ph126.split.us_crit_edge, %.lr.ph126
  %indvars.iv190 = phi i64 [ 0, %.lr.ph126 ], [ %indvars.iv.next191, %._crit_edge123.us..lr.ph126.split.us_crit_edge ]
  %7 = getelementptr inbounds double, double* %5, i64 %indvars.iv190
  store double 0.000000e+00, double* %7, align 8
  br label %.lr.ph126.split.us.new

.lr.ph126.split.us.new:                           ; preds = %.lr.ph126.split.us.new..lr.ph126.split.us.new_crit_edge, %.lr.ph126.split.us
  %8 = phi double [ %20, %.lr.ph126.split.us.new..lr.ph126.split.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph126.split.us ]
  %indvars.iv181 = phi i64 [ %indvars.iv.next182.3, %.lr.ph126.split.us.new..lr.ph126.split.us.new_crit_edge ], [ 0, %.lr.ph126.split.us ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv181, i64 %indvars.iv190
  %10 = load double, double* %9, align 8
  %11 = fadd double %10, %8
  store double %11, double* %7, align 8
  %indvars.iv.next182 = or i64 %indvars.iv181, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next182, i64 %indvars.iv190
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %7, align 8
  %indvars.iv.next182.1 = or i64 %indvars.iv181, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next182.1, i64 %indvars.iv190
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %7, align 8
  %indvars.iv.next182.2 = or i64 %indvars.iv181, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next182.2, i64 %indvars.iv190
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %7, align 8
  %indvars.iv.next182.3 = add nsw i64 %indvars.iv181, 4
  %exitcond184.3 = icmp eq i64 %indvars.iv.next182.3, 1400
  br i1 %exitcond184.3, label %._crit_edge123.us, label %.lr.ph126.split.us.new..lr.ph126.split.us.new_crit_edge

.lr.ph126.split.us.new..lr.ph126.split.us.new_crit_edge: ; preds = %.lr.ph126.split.us.new
  br label %.lr.ph126.split.us.new

._crit_edge123.us:                                ; preds = %.lr.ph126.split.us.new
  %21 = fdiv double %20, %2
  store double %21, double* %7, align 8
  %indvars.iv.next191 = add nuw nsw i64 %indvars.iv190, 1
  %exitcond193 = icmp eq i64 %indvars.iv.next191, 1200
  br i1 %exitcond193, label %._crit_edge123.us..lr.ph119.split.us_crit_edge, label %._crit_edge123.us..lr.ph126.split.us_crit_edge

._crit_edge123.us..lr.ph126.split.us_crit_edge:   ; preds = %._crit_edge123.us
  br label %.lr.ph126.split.us

._crit_edge123.us..lr.ph119.split.us_crit_edge:   ; preds = %._crit_edge123.us
  br label %.lr.ph119.split.us

.lr.ph119.split.us:                               ; preds = %._crit_edge117.us..lr.ph119.split.us_crit_edge, %._crit_edge123.us..lr.ph119.split.us_crit_edge
  %indvars.iv171 = phi i64 [ %indvars.iv.next172, %._crit_edge117.us..lr.ph119.split.us_crit_edge ], [ 0, %._crit_edge123.us..lr.ph119.split.us_crit_edge ]
  %22 = getelementptr inbounds double, double* %6, i64 %indvars.iv171
  store double 0.000000e+00, double* %22, align 8
  %23 = getelementptr inbounds double, double* %5, i64 %indvars.iv171
  br label %.lr.ph119.split.us.new

.lr.ph119.split.us.new:                           ; preds = %.lr.ph119.split.us.new..lr.ph119.split.us.new_crit_edge, %.lr.ph119.split.us
  %24 = phi double [ %36, %.lr.ph119.split.us.new..lr.ph119.split.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph119.split.us ]
  %indvars.iv163 = phi i64 [ %indvars.iv.next164.1, %.lr.ph119.split.us.new..lr.ph119.split.us.new_crit_edge ], [ 0, %.lr.ph119.split.us ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv163, i64 %indvars.iv171
  %26 = load double, double* %25, align 8
  %27 = load double, double* %23, align 8
  %28 = fsub double %26, %27
  %29 = fmul double %28, %28
  %30 = fadd double %24, %29
  store double %30, double* %22, align 8
  %indvars.iv.next164 = or i64 %indvars.iv163, 1
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next164, i64 %indvars.iv171
  %32 = load double, double* %31, align 8
  %33 = load double, double* %23, align 8
  %34 = fsub double %32, %33
  %35 = fmul double %34, %34
  %36 = fadd double %30, %35
  store double %36, double* %22, align 8
  %indvars.iv.next164.1 = add nsw i64 %indvars.iv163, 2
  %exitcond166.1 = icmp eq i64 %indvars.iv.next164.1, 1400
  br i1 %exitcond166.1, label %._crit_edge117.us, label %.lr.ph119.split.us.new..lr.ph119.split.us.new_crit_edge

.lr.ph119.split.us.new..lr.ph119.split.us.new_crit_edge: ; preds = %.lr.ph119.split.us.new
  br label %.lr.ph119.split.us.new

._crit_edge117.us:                                ; preds = %.lr.ph119.split.us.new
  %37 = fdiv double %36, %2
  store double %37, double* %22, align 8
  %38 = tail call double @sqrt(double %37) #4
  %39 = fcmp ugt double %38, 1.000000e-01
  %40 = select i1 %39, double %38, double 1.000000e+00
  store double %40, double* %22, align 8
  %indvars.iv.next172 = add nuw nsw i64 %indvars.iv171, 1
  %exitcond174 = icmp eq i64 %indvars.iv.next172, 1200
  br i1 %exitcond174, label %._crit_edge117.us.._crit_edge90.us_crit_edge, label %._crit_edge117.us..lr.ph119.split.us_crit_edge

._crit_edge117.us..lr.ph119.split.us_crit_edge:   ; preds = %._crit_edge117.us
  br label %.lr.ph119.split.us

._crit_edge117.us.._crit_edge90.us_crit_edge:     ; preds = %._crit_edge117.us
  br label %._crit_edge90.us

._crit_edge90.us:                                 ; preds = %._crit_edge112.us.._crit_edge90.us_crit_edge, %._crit_edge117.us.._crit_edge90.us_crit_edge
  %indvars.iv158 = phi i64 [ %indvars.iv.next159, %._crit_edge112.us.._crit_edge90.us_crit_edge ], [ 0, %._crit_edge117.us.._crit_edge90.us_crit_edge ]
  br label %._crit_edge202

._crit_edge202:                                   ; preds = %._crit_edge202.._crit_edge202_crit_edge, %._crit_edge90.us
  %indvars.iv154 = phi i64 [ 0, %._crit_edge90.us ], [ %indvars.iv.next155, %._crit_edge202.._crit_edge202_crit_edge ]
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv154
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv158, i64 %indvars.iv154
  %44 = load double, double* %43, align 8
  %45 = fsub double %44, %42
  store double %45, double* %43, align 8
  %46 = tail call double @sqrt(double %2) #4
  %47 = getelementptr inbounds double, double* %6, i64 %indvars.iv154
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = load double, double* %43, align 8
  %51 = fdiv double %50, %49
  store double %51, double* %43, align 8
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1
  %exitcond157 = icmp eq i64 %indvars.iv.next155, 1200
  br i1 %exitcond157, label %._crit_edge112.us, label %._crit_edge202.._crit_edge202_crit_edge

._crit_edge202.._crit_edge202_crit_edge:          ; preds = %._crit_edge202
  br label %._crit_edge202

._crit_edge112.us:                                ; preds = %._crit_edge202
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %exitcond161 = icmp eq i64 %indvars.iv.next159, 1400
  br i1 %exitcond161, label %._crit_edge112.us..lr.ph101.split.us_crit_edge, label %._crit_edge112.us.._crit_edge90.us_crit_edge

._crit_edge112.us.._crit_edge90.us_crit_edge:     ; preds = %._crit_edge112.us
  br label %._crit_edge90.us

._crit_edge112.us..lr.ph101.split.us_crit_edge:   ; preds = %._crit_edge112.us
  br label %.lr.ph101.split.us

.lr.ph101.split.us:                               ; preds = %._crit_edge99.us-lcssa.us.us..lr.ph101.split.us_crit_edge, %._crit_edge112.us..lr.ph101.split.us_crit_edge
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge99.us-lcssa.us.us..lr.ph101.split.us_crit_edge ], [ 0, %._crit_edge112.us..lr.ph101.split.us_crit_edge ]
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %._crit_edge99.us-lcssa.us.us..lr.ph101.split.us_crit_edge ], [ 1, %._crit_edge112.us..lr.ph101.split.us_crit_edge ]
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %52, align 8
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %53 = icmp slt i64 %indvars.iv.next138, 1200
  br i1 %53, label %.lr.ph101.split.us..lr.ph.us.us_crit_edge, label %.lr.ph101.split.us.._crit_edge99.us-lcssa.us.us_crit_edge

.lr.ph101.split.us.._crit_edge99.us-lcssa.us.us_crit_edge: ; preds = %.lr.ph101.split.us
  br label %._crit_edge99.us-lcssa.us.us

.lr.ph101.split.us..lr.ph.us.us_crit_edge:        ; preds = %.lr.ph101.split.us
  br label %.lr.ph.us.us

._crit_edge99.us-lcssa.us.us:                     ; preds = %._crit_edge94.us.us.._crit_edge99.us-lcssa.us.us_crit_edge, %.lr.ph101.split.us.._crit_edge99.us-lcssa.us.us_crit_edge
  %exitcond140 = icmp eq i64 %indvars.iv.next138, 1199
  br i1 %exitcond140, label %._crit_edge102, label %._crit_edge99.us-lcssa.us.us..lr.ph101.split.us_crit_edge

._crit_edge99.us-lcssa.us.us..lr.ph101.split.us_crit_edge: ; preds = %._crit_edge99.us-lcssa.us.us
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  br label %.lr.ph101.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge94.us.us..lr.ph.us.us_crit_edge, %.lr.ph101.split.us..lr.ph.us.us_crit_edge
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %._crit_edge94.us.us..lr.ph.us.us_crit_edge ], [ %indvars.iv131, %.lr.ph101.split.us..lr.ph.us.us_crit_edge ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv137, i64 %indvars.iv133
  store double 0.000000e+00, double* %54, align 8
  br label %.lr.ph.us.us.new

._crit_edge94.us.us:                              ; preds = %.lr.ph.us.us.new
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv133, i64 %indvars.iv137
  store double %68, double* %55, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond = icmp eq i64 %indvars.iv.next134, 1200
  br i1 %exitcond, label %._crit_edge94.us.us.._crit_edge99.us-lcssa.us.us_crit_edge, label %._crit_edge94.us.us..lr.ph.us.us_crit_edge

._crit_edge94.us.us..lr.ph.us.us_crit_edge:       ; preds = %._crit_edge94.us.us
  br label %.lr.ph.us.us

._crit_edge94.us.us.._crit_edge99.us-lcssa.us.us_crit_edge: ; preds = %._crit_edge94.us.us
  br label %._crit_edge99.us-lcssa.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us
  %56 = phi double [ %68, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ 0, %.lr.ph.us.us ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv137
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv133
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fadd double %56, %61
  store double %62, double* %54, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv137
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv133
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fadd double %62, %67
  store double %68, double* %54, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge94.us.us, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

._crit_edge102:                                   ; preds = %._crit_edge99.us-lcssa.us.us
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %69, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge11.us.._crit_edge.us_crit_edge, %._crit_edge.us.preheader
  %indvars.iv14 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next15, %._crit_edge11.us.._crit_edge.us_crit_edge ]
  %6 = mul nsw i64 %indvars.iv14, 1200
  br label %._crit_edge9.us._crit_edge

._crit_edge9.us._crit_edge:                       ; preds = %._crit_edge9.us.._crit_edge9.us._crit_edge_crit_edge, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge9.us.._crit_edge9.us._crit_edge_crit_edge ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge9.us._crit_edge.._crit_edge9.us_crit_edge

._crit_edge9.us._crit_edge.._crit_edge9.us_crit_edge: ; preds = %._crit_edge9.us._crit_edge
  br label %._crit_edge9.us

; <label>:11:                                     ; preds = %._crit_edge9.us._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us._crit_edge.._crit_edge9.us_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge11.us, label %._crit_edge9.us.._crit_edge9.us._crit_edge_crit_edge

._crit_edge9.us.._crit_edge9.us._crit_edge_crit_edge: ; preds = %._crit_edge9.us
  br label %._crit_edge9.us._crit_edge

._crit_edge11.us:                                 ; preds = %._crit_edge9.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond17, label %._crit_edge13, label %._crit_edge11.us.._crit_edge.us_crit_edge

._crit_edge11.us.._crit_edge.us_crit_edge:        ; preds = %._crit_edge11.us
  br label %._crit_edge.us

._crit_edge13:                                    ; preds = %._crit_edge11.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
19, 1.000000e-01
  %121 = select i1 %120, double 1.000000e+00, double %119
  store double %121, double* %118, align 8
  %indvars.iv.next187.1 = add nsw i64 %indvars.iv186, 2
  %exitcond189.1 = icmp eq i64 %indvars.iv.next187.1, %wide.trip.count188.1
  br i1 %exitcond189.1, label %.preheader106.loopexit236, label %.lr.ph130.split

.preheader.loopexit:                              ; preds = %._crit_edge123.us
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader106
  %122 = add nsw i32 %0, -1
  %123 = icmp sgt i32 %0, 1
  br i1 %123, label %.lr.ph113, label %._crit_edge114

.lr.ph113:                                        ; preds = %.preheader
  br i1 %101, label %.lr.ph113.split.us.preheader, label %.lr.ph113.split.preheader

.lr.ph113.split.preheader:                        ; preds = %.lr.ph113
  %124 = zext i32 %122 to i64
  %125 = add i32 %0, -2
  %126 = zext i32 %125 to i64
  %127 = sext i32 %0 to i64
  %wide.trip.count156.3 = zext i32 %0 to i64
  %128 = trunc i32 %122 to i2
  br label %.lr.ph113.split

.lr.ph113.split.us.preheader:                     ; preds = %.lr.ph113
  %129 = sext i32 %0 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %130 = icmp eq i32 %1, 1
  %wide.trip.count146 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %wide.trip.count150 = zext i32 %122 to i64
  br label %.lr.ph113.split.us

.lr.ph113.split.us:                               ; preds = %.loopexit.us..lr.ph113.split.us_crit_edge, %.lr.ph113.split.us.preheader
  %indvars.iv148 = phi i64 [ 0, %.lr.ph113.split.us.preheader ], [ %indvars.iv.next149, %.loopexit.us..lr.ph113.split.us_crit_edge ]
  %indvars.iv142 = phi i64 [ 1, %.lr.ph113.split.us.preheader ], [ %indvars.iv.next143, %.loopexit.us..lr.ph113.split.us_crit_edge ]
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv148, i64 %indvars.iv148
  store double 1.000000e+00, double* %131, align 8
  %indvars.iv.next149 = add nuw nsw i64 %indvars.iv148, 1
  %132 = icmp slt i64 %indvars.iv.next149, %129
  br i1 %132, label %.lr.ph.us.us.preheader, label %.loopexit.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph113.split.us
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv148
  br label %.lr.ph.us.us

.loopexit.us.loopexit:                            ; preds = %._crit_edge.us.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.lr.ph113.split.us
  %exitcond151 = icmp eq i64 %indvars.iv.next149, %wide.trip.count150
  br i1 %exitcond151, label %._crit_edge114.loopexit, label %.loopexit.us..lr.ph113.split.us_crit_edge

.loopexit.us..lr.ph113.split.us_crit_edge:        ; preds = %.loopexit.us
  %indvars.iv.next143 = add nuw nsw i64 %indvars.iv142, 1
  br label %.lr.ph113.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv144 = phi i64 [ %indvars.iv142, %.lr.ph.us.us.preheader ], [ %indvars.iv.next145, %._crit_edge.us.us ]
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv148, i64 %indvars.iv144
  store double 0.000000e+00, double* %134, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %135 = load double, double* %133, align 8
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv144
  %137 = load double, double* %136, align 8
  %138 = fmul double %135, %137
  %139 = fadd double %138, 0.000000e+00
  store double %139, double* %134, align 8
  %140 = bitcast double %139 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %141 = phi i64 [ %140, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %142 = phi double [ %139, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %130, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  %143 = bitcast double %159 to i64
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %144 = phi i64 [ %143, %._crit_edge.us.us.loopexit ], [ %141, %.prol.loopexit ]
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv144, i64 %indvars.iv148
  %146 = bitcast double* %145 to i64*
  store i64 %144, i64* %146, align 8
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %exitcond = icmp eq i64 %indvars.iv.next145, %wide.trip.count146
  br i1 %exitcond, label %.loopexit.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us.new.preheader
  %147 = phi double [ %159, %.lr.ph.us.us.new ], [ %142, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv148
  %149 = load double, double* %148, align 8
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv144
  %151 = load double, double* %150, align 8
  %152 = fmul double %149, %151
  %153 = fadd double %147, %152
  store double %153, double* %134, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv148
  %155 = load double, double* %154, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv144
  %157 = load double, double* %156, align 8
  %158 = fmul double %155, %157
  %159 = fadd double %153, %158
  store double %159, double* %134, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.loopexit.loopexit:                               ; preds = %.lr.ph111.split
  br label %.loopexit

.loopexit:                                        ; preds = %.lr.ph111.split.prol.loopexit, %.lr.ph113.split, %.loopexit.loopexit
  %exitcond164 = icmp eq i64 %indvars.iv.next162, %124
  br i1 %exitcond164, label %._crit_edge114.loopexit235, label %.loopexit..lr.ph113.split_crit_edge

.loopexit..lr.ph113.split_crit_edge:              ; preds = %.loopexit
  %indvars.iv.next226 = add i2 %indvars.iv225, -1
  %indvars.iv.next224 = add nuw i64 %indvars.iv223, 1
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  br label %.lr.ph113.split

.lr.ph113.split:                                  ; preds = %.loopexit..lr.ph113.split_crit_edge, %.lr.ph113.split.preheader
  %indvars.iv225 = phi i2 [ %indvars.iv.next226, %.loopexit..lr.ph113.split_crit_edge ], [ %128, %.lr.ph113.split.preheader ]
  %indvars.iv223 = phi i64 [ %indvars.iv.next224, %.loopexit..lr.ph113.split_crit_edge ], [ 2, %.lr.ph113.split.preheader ]
  %indvars.iv161 = phi i64 [ %indvars.iv.next162, %.loopexit..lr.ph113.split_crit_edge ], [ 0, %.lr.ph113.split.preheader ]
  %indvars.iv152 = phi i64 [ %indvars.iv.next153, %.loopexit..lr.ph113.split_crit_edge ], [ 1, %.lr.ph113.split.preheader ]
  %160 = zext i2 %indvars.iv225 to i64
  %161 = add nuw nsw i64 %160, 4294967295
  %162 = and i64 %161, 4294967295
  %163 = add i64 %indvars.iv223, %162
  %164 = sub i64 %126, %indvars.iv161
  %165 = trunc i64 %164 to i32
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv161, i64 %indvars.iv161
  store double 1.000000e+00, double* %166, align 8
  %indvars.iv.next162 = add nuw nsw i64 %indvars.iv161, 1
  %167 = icmp slt i64 %indvars.iv.next162, %127
  br i1 %167, label %.lr.ph111.split.preheader, label %.loopexit

.lr.ph111.split.preheader:                        ; preds = %.lr.ph113.split
  %168 = sub i64 %124, %indvars.iv161
  %169 = trunc i64 %168 to i32
  %xtraiter159 = and i32 %169, 3
  %lcmp.mod160 = icmp eq i32 %xtraiter159, 0
  br i1 %lcmp.mod160, label %.lr.ph111.split.prol.loopexit, label %.lr.ph111.split.prol.preheader

.lr.ph111.split.prol.preheader:                   ; preds = %.lr.ph111.split.preheader
  br label %.lr.ph111.split.prol

.lr.ph111.split.prol:                             ; preds = %.lr.ph111.split.prol..lr.ph111.split.prol_crit_edge, %.lr.ph111.split.prol.preheader
  %indvars.iv154.prol = phi i64 [ %indvars.iv.next155.prol, %.lr.ph111.split.prol..lr.ph111.split.prol_crit_edge ], [ %indvars.iv152, %.lr.ph111.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph111.split.prol..lr.ph111.split.prol_crit_edge ], [ %xtraiter159, %.lr.ph111.split.prol.preheader ]
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv161, i64 %indvars.iv154.prol
  store double 0.000000e+00, double* %170, align 8
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv154.prol, i64 %indvars.iv161
  %172 = bitcast double* %171 to i64*
  store i64 0, i64* %172, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph111.split.prol.loopexit.loopexit, label %.lr.ph111.split.prol..lr.ph111.split.prol_crit_edge, !llvm.loop !9

.lr.ph111.split.prol..lr.ph111.split.prol_crit_edge: ; preds = %.lr.ph111.split.prol
  %indvars.iv.next155.prol = add nuw nsw i64 %indvars.iv154.prol, 1
  br label %.lr.ph111.split.prol

.lr.ph111.split.prol.loopexit.loopexit:           ; preds = %.lr.ph111.split.prol
  br label %.lr.ph111.split.prol.loopexit

.lr.ph111.split.prol.loopexit:                    ; preds = %.lr.ph111.split.prol.loopexit.loopexit, %.lr.ph111.split.preheader
  %indvars.iv154.unr = phi i64 [ %indvars.iv152, %.lr.ph111.split.preheader ], [ %163, %.lr.ph111.split.prol.loopexit.loopexit ]
  %173 = icmp ult i32 %165, 3
  br i1 %173, label %.loopexit, label %.lr.ph111.split.preheader234

.lr.ph111.split.preheader234:                     ; preds = %.lr.ph111.split.prol.loopexit
  br label %.lr.ph111.split

.lr.ph111.split:                                  ; preds = %.lr.ph111.split, %.lr.ph111.split.preheader234
  %indvars.iv154 = phi i64 [ %indvars.iv.next155.3, %.lr.ph111.split ], [ %indvars.iv154.unr, %.lr.ph111.split.preheader234 ]
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv161, i64 %indvars.iv154
  store double 0.000000e+00, double* %174, align 8
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv154, i64 %indvars.iv161
  %176 = bitcast double* %175 to i64*
  store i64 0, i64* %176, align 8
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv161, i64 %indvars.iv.next155
  store double 0.000000e+00, double* %177, align 8
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next155, i64 %indvars.iv161
  %179 = bitcast double* %178 to i64*
  store i64 0, i64* %179, align 8
  %indvars.iv.next155.1 = add nsw i64 %indvars.iv154, 2
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv161, i64 %indvars.iv.next155.1
  store double 0.000000e+00, double* %180, align 8
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next155.1, i64 %indvars.iv161
  %182 = bitcast double* %181 to i64*
  store i64 0, i64* %182, align 8
  %indvars.iv.next155.2 = add nsw i64 %indvars.iv154, 3
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv161, i64 %indvars.iv.next155.2
  store double 0.000000e+00, double* %183, align 8
  %184 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next155.2, i64 %indvars.iv161
  %185 = bitcast double* %184 to i64*
  store i64 0, i64* %185, align 8
  %indvars.iv.next155.3 = add nsw i64 %indvars.iv154, 4
  %exitcond157.3 = icmp eq i64 %indvars.iv.next155.3, %wide.trip.count156.3
  br i1 %exitcond157.3, label %.loopexit.loopexit, label %.lr.ph111.split

._crit_edge114.loopexit:                          ; preds = %.loopexit.us
  br label %._crit_edge114

._crit_edge114.loopexit235:                       ; preds = %.loopexit
  br label %._crit_edge114

._crit_edge114:                                   ; preds = %._crit_edge114.loopexit235, %._crit_edge114.loopexit, %.preheader, %.preheader.thread
  %186 = phi i32 [ %102, %.preheader.thread ], [ %122, %.preheader ], [ %122, %._crit_edge114.loopexit ], [ %122, %._crit_edge114.loopexit235 ]
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %187, i64 %187
  store double 1.000000e+00, double* %188, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv15, %8
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge19
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %._crit_edge19
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge19

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count
  br i1 %exitcond18, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !8, !4, !5}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = distinct !{!9, !2}
