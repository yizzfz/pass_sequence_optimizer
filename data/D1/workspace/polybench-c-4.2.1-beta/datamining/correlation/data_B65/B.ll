; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %8 = bitcast i8* %4 to [1200 x double]*
  call void @init_array(double* nonnull %3, [1200 x double]* %8)
  call void (...) @polybench_timer_start() #3
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  call void @kernel_correlation(double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
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
  call void @print_array([1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %4) #3
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  call void @free(i8* %7) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(double*, [1200 x double]*) #0 {
  store double 1.400000e+03, double* %0, align 8
  br label %.preheader

.preheader:                                       ; preds = %18, %2
  %indvars.iv1 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %18 ]
  %3 = trunc i64 %indvars.iv1 to i32
  %4 = sitofp i32 %3 to double
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.200000e+03
  %10 = fadd double %4, %9
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv
  store double %10, double* %11, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.200000e+03
  %16 = fadd double %4, %15
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv.next
  store double %16, double* %17, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1199
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %18, label %5

; <label>:18:                                     ; preds = %5
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond3, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double*, double*) #0 {
.lr.ph36:
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr.1 = ptrtoint double* %3 to i64
  %sunkaddr103 = ptrtoint double* %3 to i64
  br label %.lr.ph36.split.us

.lr.ph36.split.us:                                ; preds = %._crit_edge33.us, %.lr.ph36
  %indvars.iv80 = phi i64 [ 0, %.lr.ph36 ], [ %indvars.iv.next81, %._crit_edge33.us ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv80
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr100 = shl i64 %indvars.iv80, 3
  %sunkaddr101 = add i64 %sunkaddr, %sunkaddr100
  %sunkaddr102 = inttoptr i64 %sunkaddr101 to double*
  %sunkaddr100.1 = shl i64 %indvars.iv80, 3
  %sunkaddr101.1 = add i64 %sunkaddr.1, %sunkaddr100.1
  %sunkaddr102.1 = inttoptr i64 %sunkaddr101.1 to double*
  br label %6

; <label>:6:                                      ; preds = %6, %.lr.ph36.split.us
  %indvars.iv76 = phi i64 [ 0, %.lr.ph36.split.us ], [ %indvars.iv.next77.1, %6 ]
  %7 = phi double [ 0.000000e+00, %.lr.ph36.split.us ], [ %13, %6 ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv76, i64 %indvars.iv80
  %9 = load double, double* %8, align 8
  %10 = fadd double %7, %9
  store double %10, double* %sunkaddr102, align 8
  %indvars.iv.next77 = or i64 %indvars.iv76, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next77, i64 %indvars.iv80
  %12 = load double, double* %11, align 8
  %13 = fadd double %10, %12
  store double %13, double* %sunkaddr102.1, align 8
  %exitcond79.1 = icmp eq i64 %indvars.iv.next77, 1399
  %indvars.iv.next77.1 = add nsw i64 %indvars.iv76, 2
  br i1 %exitcond79.1, label %._crit_edge33.us, label %6

._crit_edge33.us:                                 ; preds = %6
  %14 = fdiv double %13, %0
  %sunkaddr104 = shl i64 %indvars.iv80, 3
  %sunkaddr105 = add i64 %sunkaddr103, %sunkaddr104
  %sunkaddr106 = inttoptr i64 %sunkaddr105 to double*
  store double %14, double* %sunkaddr106, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next81, 1200
  br i1 %exitcond7, label %.lr.ph30.split.us.preheader, label %.lr.ph36.split.us

.lr.ph30.split.us.preheader:                      ; preds = %._crit_edge33.us
  %sunkaddr107 = ptrtoint double* %3 to i64
  %sunkaddr111 = ptrtoint double* %4 to i64
  %sunkaddr107.1 = ptrtoint double* %3 to i64
  %sunkaddr111.1 = ptrtoint double* %4 to i64
  %sunkaddr115 = ptrtoint double* %4 to i64
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %._crit_edge27.us, %.lr.ph30.split.us.preheader
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge27.us ], [ 0, %.lr.ph30.split.us.preheader ]
  %15 = getelementptr inbounds double, double* %4, i64 %indvars.iv70
  store double 0.000000e+00, double* %15, align 8
  %sunkaddr108 = shl i64 %indvars.iv70, 3
  %sunkaddr109 = add i64 %sunkaddr107, %sunkaddr108
  %sunkaddr110 = inttoptr i64 %sunkaddr109 to double*
  %sunkaddr112 = shl i64 %indvars.iv70, 3
  %sunkaddr113 = add i64 %sunkaddr111, %sunkaddr112
  %sunkaddr114 = inttoptr i64 %sunkaddr113 to double*
  %sunkaddr108.1 = shl i64 %indvars.iv70, 3
  %sunkaddr109.1 = add i64 %sunkaddr107.1, %sunkaddr108.1
  %sunkaddr110.1 = inttoptr i64 %sunkaddr109.1 to double*
  %sunkaddr112.1 = shl i64 %indvars.iv70, 3
  %sunkaddr113.1 = add i64 %sunkaddr111.1, %sunkaddr112.1
  %sunkaddr114.1 = inttoptr i64 %sunkaddr113.1 to double*
  br label %16

; <label>:16:                                     ; preds = %16, %.lr.ph30.split.us
  %indvars.iv66 = phi i64 [ 0, %.lr.ph30.split.us ], [ %indvars.iv.next67.1, %16 ]
  %17 = phi double [ 0.000000e+00, %.lr.ph30.split.us ], [ %29, %16 ]
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv70
  %19 = load double, double* %18, align 8
  %20 = load double, double* %sunkaddr110, align 8
  %21 = fsub double %19, %20
  %22 = fmul double %21, %21
  %23 = fadd double %17, %22
  store double %23, double* %sunkaddr114, align 8
  %indvars.iv.next67 = or i64 %indvars.iv66, 1
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next67, i64 %indvars.iv70
  %25 = load double, double* %24, align 8
  %26 = load double, double* %sunkaddr110.1, align 8
  %27 = fsub double %25, %26
  %28 = fmul double %27, %27
  %29 = fadd double %23, %28
  store double %29, double* %sunkaddr114.1, align 8
  %exitcond69.1 = icmp eq i64 %indvars.iv.next67, 1399
  %indvars.iv.next67.1 = add nsw i64 %indvars.iv66, 2
  br i1 %exitcond69.1, label %._crit_edge27.us, label %16

._crit_edge27.us:                                 ; preds = %16
  %30 = fdiv double %29, %0
  %sunkaddr116 = shl i64 %indvars.iv70, 3
  %sunkaddr117 = add i64 %sunkaddr115, %sunkaddr116
  %sunkaddr118 = inttoptr i64 %sunkaddr117 to double*
  store double %30, double* %sunkaddr118, align 8
  %31 = tail call double @sqrt(double %30) #3
  %32 = fcmp ole double %31, 1.000000e-01
  %33 = select i1 %32, double 1.000000e+00, double %31
  store double %33, double* %sunkaddr118, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next71, 1200
  br i1 %exitcond6, label %.preheader9.us.preheader, label %.lr.ph30.split.us

.preheader9.us.preheader:                         ; preds = %._crit_edge27.us
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge24.us, %.preheader9.us.preheader
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge24.us ], [ 0, %.preheader9.us.preheader ]
  br label %34

; <label>:34:                                     ; preds = %34, %.preheader9.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %34 ], [ 0, %.preheader9.us ]
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv59
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv59
  %38 = load double, double* %37, align 8
  %39 = fsub double %38, %36
  store double %39, double* %37, align 8
  %40 = tail call double @sqrt(double %0) #3
  %41 = getelementptr inbounds double, double* %4, i64 %indvars.iv59
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = load double, double* %37, align 8
  %45 = fdiv double %44, %43
  store double %45, double* %37, align 8
  %exitcond62 = icmp eq i64 %indvars.iv59, 1199
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  br i1 %exitcond62, label %._crit_edge24.us, label %34

._crit_edge24.us:                                 ; preds = %34
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next64, 1400
  br i1 %exitcond5, label %.lr.ph16.split.us.preheader, label %.preheader9.us

.lr.ph16.split.us.preheader:                      ; preds = %._crit_edge24.us
  br label %.lr.ph16.split.us

.lr.ph16.split.us:                                ; preds = %.loopexit.us, %.lr.ph16.split.us.preheader
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %.loopexit.us ], [ 0, %.lr.ph16.split.us.preheader ]
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %.loopexit.us ], [ 1, %.lr.ph16.split.us.preheader ]
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv49, i64 %indvars.iv49
  store double 1.000000e+00, double* %46, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  br i1 true, label %.lr.ph.us.us.preheader, label %.loopexit.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph16.split.us
  br label %.lr.ph.us.us

.loopexit.us.loopexit:                            ; preds = %._crit_edge.us.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.lr.ph16.split.us
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next50, 1199
  br i1 %exitcond4, label %._crit_edge17, label %.lr.ph16.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge.us.us ], [ %indvars.iv45, %.lr.ph.us.us.preheader ]
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv49, i64 %indvars.iv47
  store double 0.000000e+00, double* %47, align 8
  br label %49

._crit_edge.us.us:                                ; preds = %49
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv47, i64 %indvars.iv49
  store double %62, double* %48, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next48, 1200
  br i1 %exitcond3, label %.loopexit.us.loopexit, label %.lr.ph.us.us

; <label>:49:                                     ; preds = %49, %.lr.ph.us.us
  %50 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %62, %49 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %49 ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv49
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv47
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %50, %55
  store double %56, double* %47, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv49
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv47
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fadd double %56, %61
  store double %62, double* %47, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1399
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us.us, label %49

._crit_edge17:                                    ; preds = %.loopexit.us
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %63, align 8
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*) #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv3 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next4, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv3, 1200
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge2

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond1, label %._crit_edge1, label %.preheader.us

._crit_edge1:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

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
