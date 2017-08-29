; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #4
  %10 = bitcast i8* %6 to [1100 x double]*
  %11 = bitcast i8* %7 to [900 x double]*
  %12 = bitcast i8* %8 to [1200 x double]*
  %13 = bitcast i8* %9 to [1200 x double]*
  call void @init_array(i32 800, i32 900, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  %17 = bitcast i8* %9 to [1200 x double]*
  call void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %17)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %18 = icmp sgt i32 %0, 42
  br i1 %18, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %2
  %20 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %20, align 1
  %21 = icmp eq i8 %strcmpload, 0
  br i1 %21, label %22, label %._crit_edge

; <label>:22:                                     ; preds = %19
  %23 = bitcast i8* %9 to [1200 x double]*
  call void @print_array(i32 800, i32 1200, [1200 x double]* %23)
  br label %._crit_edge

._crit_edge:                                      ; preds = %19, %2, %22
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, i32, double*, double*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) #2 {
.preheader13.lr.ph:
  store double 1.500000e+00, double* %4, align 8
  store double 1.200000e+00, double* %5, align 8
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %.loopexit34.us, %.preheader13.lr.ph
  %indvars.iv91 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next92, %.loopexit34.us ]
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader13.us
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %10 ], [ 0, %.preheader13.us ]
  %11 = mul nuw nsw i64 %indvars.iv91, %indvars.iv87
  %12 = add nuw nsw i64 %11, 1
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 800
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 8.000000e+02
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv91, i64 %indvars.iv87
  store double %16, double* %17, align 8
  %exitcond90 = icmp eq i64 %indvars.iv87, 1099
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  br i1 %exitcond90, label %.loopexit34.us, label %10

.loopexit34.us:                                   ; preds = %10
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond97 = icmp eq i64 %indvars.iv.next92, 800
  br i1 %exitcond97, label %.preheader11.us.preheader, label %.preheader13.us

.preheader11.us.preheader:                        ; preds = %.loopexit34.us
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %.preheader11.us.preheader, %.loopexit33.us
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %.loopexit33.us ], [ 0, %.preheader11.us.preheader ]
  br label %._crit_edge61

._crit_edge61:                                    ; preds = %._crit_edge61, %.preheader11.us
  %indvars.iv80 = phi i64 [ 0, %.preheader11.us ], [ %indvars.iv.next81.1, %._crit_edge61 ]
  %indvars.iv.next81 = or i64 %indvars.iv80, 1
  %18 = mul nuw nsw i64 %indvars.iv84, %indvars.iv.next81
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 900
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv84, i64 %indvars.iv80
  %indvars.iv.next81.1 = add nsw i64 %indvars.iv80, 2
  %23 = mul nuw nsw i64 %indvars.iv84, %indvars.iv.next81.1
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 900
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, <double 9.000000e+02, double 9.000000e+02>
  %30 = bitcast double* %22 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  %exitcond83.1 = icmp eq i64 %indvars.iv.next81, 899
  br i1 %exitcond83.1, label %.loopexit33.us, label %._crit_edge61

.loopexit33.us:                                   ; preds = %._crit_edge61
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next85, 1100
  br i1 %exitcond96, label %.preheader9.us.preheader, label %.preheader11.us

.preheader9.us.preheader:                         ; preds = %.loopexit33.us
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %.preheader9.us.preheader, %.loopexit32.us
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %.loopexit32.us ], [ 0, %.preheader9.us.preheader ]
  br label %31

; <label>:31:                                     ; preds = %31, %.preheader9.us
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %31 ], [ 0, %.preheader9.us ]
  %32 = add nuw nsw i64 %indvars.iv73, 3
  %33 = mul nuw nsw i64 %indvars.iv77, %32
  %34 = add nuw nsw i64 %33, 1
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 1200
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 1.200000e+03
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv77, i64 %indvars.iv73
  store double %38, double* %39, align 8
  %exitcond76 = icmp eq i64 %indvars.iv73, 1199
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  br i1 %exitcond76, label %.loopexit32.us, label %31

.loopexit32.us:                                   ; preds = %31
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next78, 900
  br i1 %exitcond95, label %.preheader.us.preheader, label %.preheader9.us

.preheader.us.preheader:                          ; preds = %.loopexit32.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.loopexit.us
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %.loopexit.us ], [ 0, %.preheader.us.preheader ]
  br label %40

; <label>:40:                                     ; preds = %40, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %40 ], [ 0, %.preheader.us ]
  %41 = add nuw nsw i64 %indvars.iv, 2
  %42 = mul nuw nsw i64 %indvars.iv71, %41
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, 1100
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, 1.100000e+03
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv71, i64 %indvars.iv
  store double %46, double* %47, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %.loopexit.us, label %40

.loopexit.us:                                     ; preds = %40
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next72, 800
  br i1 %exitcond94, label %.preheader8._crit_edge, label %.preheader.us

.preheader8._crit_edge:                           ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) #2 {
.preheader7.lr.ph:
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.loopexit23.us, %.preheader7.lr.ph
  %indvars.iv87 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next88, %.loopexit23.us ]
  br label %.lr.ph15.us.us

.loopexit23.us:                                   ; preds = %.loopexit22.us.us
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next88, 800
  br i1 %exitcond98, label %.preheader.us.preheader, label %.preheader7.us

.preheader.us.preheader:                          ; preds = %.loopexit23.us
  br label %.preheader.us

.lr.ph15.us.us:                                   ; preds = %.loopexit22.us.us, %.preheader7.us
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %.loopexit22.us.us ], [ 0, %.preheader7.us ]
  %11 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv87, i64 %indvars.iv85
  store double 0.000000e+00, double* %11, align 8
  br label %12

.loopexit22.us.us:                                ; preds = %12
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond97 = icmp eq i64 %indvars.iv.next86, 900
  br i1 %exitcond97, label %.loopexit23.us, label %.lr.ph15.us.us

; <label>:12:                                     ; preds = %12, %.lr.ph15.us.us
  %13 = phi double [ 0.000000e+00, %.lr.ph15.us.us ], [ %27, %12 ]
  %indvars.iv81 = phi i64 [ 0, %.lr.ph15.us.us ], [ %indvars.iv.next82.1, %12 ]
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv87, i64 %indvars.iv81
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %4
  %17 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv81, i64 %indvars.iv85
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %19, %13
  store double %20, double* %11, align 8
  %indvars.iv.next82 = or i64 %indvars.iv81, 1
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv87, i64 %indvars.iv.next82
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %4
  %24 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next82, i64 %indvars.iv85
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %26, %20
  store double %27, double* %11, align 8
  %exitcond84.1 = icmp eq i64 %indvars.iv.next82, 1099
  %indvars.iv.next82.1 = add nsw i64 %indvars.iv81, 2
  br i1 %exitcond84.1, label %.loopexit22.us.us, label %12

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.loopexit20.us
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %.loopexit20.us ], [ 0, %.preheader.us.preheader ]
  br label %.lr.ph.us.us

.loopexit20.us:                                   ; preds = %.loopexit.us.us
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next78, 800
  br i1 %exitcond105, label %.preheader6._crit_edge, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.loopexit.us.us, %.preheader.us
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %.loopexit.us.us ], [ 0, %.preheader.us ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv77, i64 %indvars.iv75
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, %5
  store double %30, double* %28, align 8
  br label %31

.loopexit.us.us:                                  ; preds = %31
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next76, 1200
  br i1 %exitcond96, label %.loopexit20.us, label %.lr.ph.us.us

; <label>:31:                                     ; preds = %31, %.lr.ph.us.us
  %32 = phi double [ %30, %.lr.ph.us.us ], [ %50, %31 ]
  %indvars.iv73 = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next74.2, %31 ]
  %33 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv77, i64 %indvars.iv73
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv73, i64 %indvars.iv75
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %37, %32
  store double %38, double* %28, align 8
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %39 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv77, i64 %indvars.iv.next74
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next74, i64 %indvars.iv75
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %43, %38
  store double %44, double* %28, align 8
  %indvars.iv.next74.1 = add nsw i64 %indvars.iv73, 2
  %45 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv77, i64 %indvars.iv.next74.1
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next74.1, i64 %indvars.iv75
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fadd double %49, %44
  store double %50, double* %28, align 8
  %exitcond.2 = icmp eq i64 %indvars.iv.next74.1, 899
  %indvars.iv.next74.2 = add nsw i64 %indvars.iv73, 3
  br i1 %exitcond.2, label %.loopexit.us.us, label %31

.preheader6._crit_edge:                           ; preds = %.loopexit20.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*) #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv14 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next15, %.loopexit.us ]
  %7 = mul nuw nsw i64 %indvars.iv14, 800
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge11 ]
  %8 = add nuw nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge11

; <label>:12:                                     ; preds = %._crit_edge12
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge12, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge12

.loopexit.us:                                     ; preds = %._crit_edge11
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 800
  br i1 %exitcond16, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
