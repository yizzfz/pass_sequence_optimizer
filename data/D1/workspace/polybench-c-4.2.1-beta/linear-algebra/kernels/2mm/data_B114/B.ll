; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = call i8* @polybench_alloc_data(i64 720000, i32 8) #3
  %6 = call i8* @polybench_alloc_data(i64 880000, i32 8) #3
  %7 = call i8* @polybench_alloc_data(i64 990000, i32 8) #3
  %8 = call i8* @polybench_alloc_data(i64 1080000, i32 8) #3
  %9 = call i8* @polybench_alloc_data(i64 960000, i32 8) #3
  %10 = bitcast i8* %6 to [1100 x double]*
  %11 = bitcast i8* %7 to [900 x double]*
  %12 = bitcast i8* %8 to [1200 x double]*
  %13 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  call void (...) @polybench_timer_start() #3
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  call fastcc void @kernel_2mm(double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  %22 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %22)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  call void @free(i8* %7) #3
  call void @free(i8* %8) #3
  call void @free(i8* %9) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(double*, double*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #0 {
.preheader10.us.preheader:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge27.us, %.preheader10.us.preheader
  %indvars.iv61 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next62, %._crit_edge27.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader10.us
  %indvars.iv57 = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next58, %._crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv57, %indvars.iv61
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 800
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 8.000000e+02
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv61, i64 %indvars.iv57
  store double %11, double* %12, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next58, 1100
  br i1 %exitcond71, label %._crit_edge27.us, label %._crit_edge

._crit_edge27.us:                                 ; preds = %._crit_edge
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next62, 800
  br i1 %exitcond72, label %.preheader8.us.preheader, label %.preheader10.us

.preheader8.us.preheader:                         ; preds = %._crit_edge27.us
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %.preheader8.us.preheader, %._crit_edge22.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge22.us ], [ 0, %.preheader8.us.preheader ]
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4, %.preheader8.us
  %indvars.iv48 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next49.1, %._crit_edge4 ]
  %indvars.iv.next49 = or i64 %indvars.iv48, 1
  %13 = mul nuw nsw i64 %indvars.iv.next49, %indvars.iv52
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 900
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv52, i64 %indvars.iv48
  %indvars.iv.next49.1 = add nuw nsw i64 %indvars.iv48, 2
  %18 = mul nuw nsw i64 %indvars.iv.next49.1, %indvars.iv52
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 900
  %21 = sitofp i32 %20 to double
  %22 = insertelement <2 x double> undef, double %16, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  %24 = fdiv <2 x double> %23, <double 9.000000e+02, double 9.000000e+02>
  %25 = bitcast double* %17 to <2 x double>*
  store <2 x double> %24, <2 x double>* %25, align 8
  %exitcond69.1 = icmp eq i64 %indvars.iv.next49.1, 900
  br i1 %exitcond69.1, label %._crit_edge22.us, label %._crit_edge4

._crit_edge22.us:                                 ; preds = %._crit_edge4
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next53, 1100
  br i1 %exitcond70, label %.preheader6.us.preheader, label %.preheader8.us

.preheader6.us.preheader:                         ; preds = %._crit_edge22.us
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %.preheader6.us.preheader, %._crit_edge17.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge17.us ], [ 0, %.preheader6.us.preheader ]
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5, %.preheader6.us
  %indvars.iv39 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next40, %._crit_edge5 ]
  %26 = add nuw nsw i64 %indvars.iv39, 3
  %27 = mul nuw nsw i64 %26, %indvars.iv43
  %28 = add nuw nsw i64 %27, 1
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 1200
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 1.200000e+03
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv39
  store double %32, double* %33, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next40, 1200
  br i1 %exitcond67, label %._crit_edge17.us, label %._crit_edge5

._crit_edge17.us:                                 ; preds = %._crit_edge5
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next44, 900
  br i1 %exitcond68, label %.preheader.us.preheader, label %.preheader6.us

.preheader.us.preheader:                          ; preds = %._crit_edge17.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge6 ]
  %34 = add nuw nsw i64 %indvars.iv, 2
  %35 = mul nuw nsw i64 %34, %indvars.iv34
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 1100
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, 1.100000e+03
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv34, i64 %indvars.iv
  store double %39, double* %40, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond66, label %._crit_edge.us, label %._crit_edge6

._crit_edge.us:                                   ; preds = %._crit_edge6
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond = icmp eq i64 %indvars.iv.next35, 800
  br i1 %exitcond, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_2mm(double, double, [900 x double]*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #0 {
.preheader6.us.preheader:
  br label %.lr.ph15.us.us.preheader

.lr.ph15.us.us.preheader:                         ; preds = %._crit_edge19.us, %.preheader6.us.preheader
  %indvars.iv62 = phi i64 [ 0, %.preheader6.us.preheader ], [ %indvars.iv.next63, %._crit_edge19.us ]
  br label %.lr.ph15.us.us

._crit_edge19.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next63, 800
  br i1 %exitcond73, label %.lr.ph.us.us.preheader.preheader, label %.lr.ph15.us.us.preheader

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge19.us
  br label %.lr.ph.us.us.preheader

.lr.ph15.us.us:                                   ; preds = %._crit_edge16.us.us, %.lr.ph15.us.us.preheader
  %indvars.iv58 = phi i64 [ 0, %.lr.ph15.us.us.preheader ], [ %indvars.iv.next59, %._crit_edge16.us.us ]
  %7 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv62, i64 %indvars.iv58
  store double 0.000000e+00, double* %7, align 8
  br label %._crit_edge

._crit_edge16.us.us:                              ; preds = %._crit_edge
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next59, 900
  br i1 %exitcond72, label %._crit_edge19.us, label %.lr.ph15.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph15.us.us
  %indvars.iv54 = phi i64 [ 0, %.lr.ph15.us.us ], [ %indvars.iv.next55.1, %._crit_edge ]
  %8 = phi double [ 0.000000e+00, %.lr.ph15.us.us ], [ %22, %._crit_edge ]
  %9 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv62, i64 %indvars.iv54
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %0
  %12 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv58
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fadd double %8, %14
  store double %15, double* %7, align 8
  %indvars.iv.next55 = or i64 %indvars.iv54, 1
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv62, i64 %indvars.iv.next55
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %0
  %19 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv.next55, i64 %indvars.iv58
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %15, %21
  store double %22, double* %7, align 8
  %indvars.iv.next55.1 = add nuw nsw i64 %indvars.iv54, 2
  %exitcond71.1 = icmp eq i64 %indvars.iv.next55.1, 1100
  br i1 %exitcond71.1, label %._crit_edge16.us.us, label %._crit_edge

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge10.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge10.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  br label %.lr.ph.us.us

._crit_edge10.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next46, 800
  br i1 %exitcond69, label %._crit_edge12, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv41 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next42, %._crit_edge.us.us ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv45, i64 %indvars.iv41
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %1
  store double %25, double* %23, align 8
  br label %._crit_edge2

._crit_edge.us.us:                                ; preds = %._crit_edge2
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond68, label %._crit_edge10.us, label %.lr.ph.us.us

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph.us.us
  %indvars.iv37 = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next38.2, %._crit_edge2 ]
  %26 = phi double [ %25, %.lr.ph.us.us ], [ %44, %._crit_edge2 ]
  %27 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv37
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv41
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fadd double %26, %31
  store double %32, double* %23, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %33 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv.next38
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next38, i64 %indvars.iv41
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %32, %37
  store double %38, double* %23, align 8
  %indvars.iv.next38.1 = add nuw nsw i64 %indvars.iv37, 2
  %39 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv.next38.1
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next38.1, i64 %indvars.iv41
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %38, %43
  store double %44, double* %23, align 8
  %indvars.iv.next38.2 = add nuw nsw i64 %indvars.iv37, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next38.2, 900
  br i1 %exitcond.2, label %._crit_edge.us.us, label %._crit_edge2

._crit_edge12:                                    ; preds = %._crit_edge10.us
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
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv6, 800
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
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond11, label %._crit_edge.us, label %._crit_edge2

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, 800
  br i1 %exitcond, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
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
