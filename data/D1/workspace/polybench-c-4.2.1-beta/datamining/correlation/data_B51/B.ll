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
  br i1 %16, label %17, label %.._crit_edge_crit_edge14

.._crit_edge_crit_edge14:                         ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge14, %.._crit_edge_crit_edge, %17
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
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %2
  %indvars.iv7 = phi i64 [ 0, %2 ], [ %indvars.iv.next8, %.._crit_edge_crit_edge ]
  %3 = trunc i64 %indvars.iv7 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %._crit_edge9, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %._crit_edge9 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv7
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv7
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = fadd <2 x double> %6, %17
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %._crit_edge9

._crit_edge9:                                     ; preds = %7
  br label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1400
  br i1 %exitcond, label %21, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %20
  br label %._crit_edge

; <label>:21:                                     ; preds = %20
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
  br i1 %exitcond193, label %.lr.ph119.split.us.preheader, label %._crit_edge123.us..lr.ph126.split.us_crit_edge

._crit_edge123.us..lr.ph126.split.us_crit_edge:   ; preds = %._crit_edge123.us
  br label %.lr.ph126.split.us

.lr.ph119.split.us.preheader:                     ; preds = %._crit_edge123.us
  br label %.lr.ph119.split.us

.lr.ph119.split.us:                               ; preds = %._crit_edge117.us..lr.ph119.split.us_crit_edge, %.lr.ph119.split.us.preheader
  %indvars.iv171 = phi i64 [ %indvars.iv.next172, %._crit_edge117.us..lr.ph119.split.us_crit_edge ], [ 0, %.lr.ph119.split.us.preheader ]
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
  %indvars.iv.next164.1 = add nuw nsw i64 %indvars.iv163, 2
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
  br i1 %exitcond174, label %._crit_edge90.us.preheader, label %._crit_edge117.us..lr.ph119.split.us_crit_edge

._crit_edge117.us..lr.ph119.split.us_crit_edge:   ; preds = %._crit_edge117.us
  br label %.lr.ph119.split.us

._crit_edge90.us.preheader:                       ; preds = %._crit_edge117.us
  br label %._crit_edge90.us

._crit_edge90.us:                                 ; preds = %._crit_edge112.us.._crit_edge90.us_crit_edge, %._crit_edge90.us.preheader
  %indvars.iv158 = phi i64 [ %indvars.iv.next159, %._crit_edge112.us.._crit_edge90.us_crit_edge ], [ 0, %._crit_edge90.us.preheader ]
  br label %41

; <label>:41:                                     ; preds = %._crit_edge, %._crit_edge90.us
  %indvars.iv154 = phi i64 [ 0, %._crit_edge90.us ], [ %indvars.iv.next155, %._crit_edge ]
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv154
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv158, i64 %indvars.iv154
  %45 = load double, double* %44, align 8
  %46 = fsub double %45, %43
  store double %46, double* %44, align 8
  %47 = tail call double @sqrt(double %2) #4
  %48 = getelementptr inbounds double, double* %6, i64 %indvars.iv154
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = load double, double* %44, align 8
  %52 = fdiv double %51, %50
  store double %52, double* %44, align 8
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1
  %exitcond157 = icmp eq i64 %indvars.iv.next155, 1200
  br i1 %exitcond157, label %._crit_edge112.us, label %._crit_edge

._crit_edge:                                      ; preds = %41
  br label %41

._crit_edge112.us:                                ; preds = %41
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %exitcond161 = icmp eq i64 %indvars.iv.next159, 1400
  br i1 %exitcond161, label %.lr.ph101.split.us.preheader, label %._crit_edge112.us.._crit_edge90.us_crit_edge

._crit_edge112.us.._crit_edge90.us_crit_edge:     ; preds = %._crit_edge112.us
  br label %._crit_edge90.us

.lr.ph101.split.us.preheader:                     ; preds = %._crit_edge112.us
  br label %.lr.ph101.split.us

.lr.ph101.split.us:                               ; preds = %._crit_edge99.us-lcssa.us.us..lr.ph101.split.us_crit_edge, %.lr.ph101.split.us.preheader
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge99.us-lcssa.us.us..lr.ph101.split.us_crit_edge ], [ 0, %.lr.ph101.split.us.preheader ]
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %._crit_edge99.us-lcssa.us.us..lr.ph101.split.us_crit_edge ], [ 1, %.lr.ph101.split.us.preheader ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %53, align 8
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %54 = icmp slt i64 %indvars.iv.next138, 1200
  br i1 %54, label %.lr.ph.us.us.preheader, label %.lr.ph101.split.us.._crit_edge99.us-lcssa.us.us_crit_edge

.lr.ph101.split.us.._crit_edge99.us-lcssa.us.us_crit_edge: ; preds = %.lr.ph101.split.us
  br label %._crit_edge99.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph101.split.us
  br label %.lr.ph.us.us

._crit_edge99.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge94.us.us
  br label %._crit_edge99.us-lcssa.us.us

._crit_edge99.us-lcssa.us.us:                     ; preds = %.lr.ph101.split.us.._crit_edge99.us-lcssa.us.us_crit_edge, %._crit_edge99.us-lcssa.us.us.loopexit
  %exitcond140 = icmp eq i64 %indvars.iv.next138, 1199
  br i1 %exitcond140, label %._crit_edge102, label %._crit_edge99.us-lcssa.us.us..lr.ph101.split.us_crit_edge

._crit_edge99.us-lcssa.us.us..lr.ph101.split.us_crit_edge: ; preds = %._crit_edge99.us-lcssa.us.us
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  br label %.lr.ph101.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge94.us.us..lr.ph.us.us_crit_edge, %.lr.ph.us.us.preheader
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %._crit_edge94.us.us..lr.ph.us.us_crit_edge ], [ %indvars.iv131, %.lr.ph.us.us.preheader ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv137, i64 %indvars.iv133
  store double 0.000000e+00, double* %55, align 8
  br label %.lr.ph.us.us.new

._crit_edge94.us.us:                              ; preds = %.lr.ph.us.us.new
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv133, i64 %indvars.iv137
  store double %69, double* %56, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond = icmp eq i64 %indvars.iv.next134, 1200
  br i1 %exitcond, label %._crit_edge99.us-lcssa.us.us.loopexit, label %._crit_edge94.us.us..lr.ph.us.us_crit_edge

._crit_edge94.us.us..lr.ph.us.us_crit_edge:       ; preds = %._crit_edge94.us.us
  br label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us
  %57 = phi double [ %69, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ 0, %.lr.ph.us.us ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv137
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv133
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %57, %62
  store double %63, double* %55, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv137
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv133
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %63, %68
  store double %69, double* %55, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge94.us.us, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

._crit_edge102:                                   ; preds = %._crit_edge99.us-lcssa.us.us
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %70, align 8
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
  br label %7

; <label>:7:                                      ; preds = %._crit_edge9.us._crit_edge, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge9.us._crit_edge ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.._crit_edge9.us_crit_edge

.._crit_edge9.us_crit_edge:                       ; preds = %7
  br label %._crit_edge9.us

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %.._crit_edge9.us_crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge11.us, label %._crit_edge9.us._crit_edge

._crit_edge9.us._crit_edge:                       ; preds = %._crit_edge9.us
  br label %7

._crit_edge11.us:                                 ; preds = %._crit_edge9.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond17, label %._crit_edge13, label %._crit_edge11.us.._crit_edge.us_crit_edge

._crit_edge11.us.._crit_edge.us_crit_edge:        ; preds = %._crit_edge11.us
  br label %._crit_edge.us

._crit_edge13:                                    ; preds = %._crit_edge11.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
