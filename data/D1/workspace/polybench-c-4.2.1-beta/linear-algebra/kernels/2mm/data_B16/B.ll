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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
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
  call fastcc void @init_array(i32 800, i32 900, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  call fastcc void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %13)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader6.lr.ph:
  store double 1.500000e+00, double* %4, align 8
  store double 1.200000e+00, double* %5, align 8
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge13.us, %.preheader6.lr.ph
  %indvars.iv45 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next46, %._crit_edge13.us ]
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader6.us
  %indvars.iv41 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next42, %10 ]
  %11 = mul nuw nsw i64 %indvars.iv41, %indvars.iv45
  %12 = add nuw nsw i64 %11, 1
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 800
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 8.000000e+02
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv45, i64 %indvars.iv41
  store double %16, double* %17, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next42, 1100
  br i1 %exitcond54, label %._crit_edge13.us, label %10

._crit_edge13.us:                                 ; preds = %10
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next46, 800
  br i1 %exitcond55, label %.preheader4.us.preheader, label %.preheader6.us

.preheader4.us.preheader:                         ; preds = %._crit_edge13.us
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge11.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge11.us ], [ 0, %.preheader4.us.preheader ]
  br label %.preheader4.us.new

.preheader4.us.new:                               ; preds = %.preheader4.us, %.preheader4.us.new
  %indvars.iv32 = phi i64 [ %indvars.iv.next33.1, %.preheader4.us.new ], [ 0, %.preheader4.us ]
  %indvars.iv.next33 = or i64 %indvars.iv32, 1
  %18 = mul nuw nsw i64 %indvars.iv.next33, %indvars.iv36
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 900
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv36, i64 %indvars.iv32
  %indvars.iv.next33.1 = add nuw nsw i64 %indvars.iv32, 2
  %23 = mul nuw nsw i64 %indvars.iv.next33.1, %indvars.iv36
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 900
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, <double 9.000000e+02, double 9.000000e+02>
  %30 = bitcast double* %22 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  %exitcond35.1 = icmp eq i64 %indvars.iv.next33.1, 900
  br i1 %exitcond35.1, label %._crit_edge11.us, label %.preheader4.us.new

._crit_edge11.us:                                 ; preds = %.preheader4.us.new
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next37, 1100
  br i1 %exitcond53, label %.preheader2.us.preheader, label %.preheader4.us

.preheader2.us.preheader:                         ; preds = %._crit_edge11.us
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %.preheader2.us.preheader, %._crit_edge9.us
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge9.us ], [ 0, %.preheader2.us.preheader ]
  br label %31

; <label>:31:                                     ; preds = %31, %.preheader2.us
  %indvars.iv23 = phi i64 [ 0, %.preheader2.us ], [ %indvars.iv.next24, %31 ]
  %32 = add nuw nsw i64 %indvars.iv23, 3
  %33 = mul nuw nsw i64 %32, %indvars.iv27
  %34 = add nuw nsw i64 %33, 1
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 1200
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 1.200000e+03
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv27, i64 %indvars.iv23
  store double %38, double* %39, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond51, label %._crit_edge9.us, label %31

._crit_edge9.us:                                  ; preds = %31
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next28, 900
  br i1 %exitcond52, label %.preheader.us.preheader, label %.preheader2.us

.preheader.us.preheader:                          ; preds = %._crit_edge9.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %40

; <label>:40:                                     ; preds = %40, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %40 ]
  %41 = add nuw nsw i64 %indvars.iv, 2
  %42 = mul nuw nsw i64 %41, %indvars.iv18
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, 1100
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, 1.100000e+03
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv18, i64 %indvars.iv
  store double %46, double* %47, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond50, label %._crit_edge.us, label %40

._crit_edge.us:                                   ; preds = %40
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next19, 800
  br i1 %exitcond, label %._crit_edge7, label %.preheader.us

._crit_edge7:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader2.lr.ph:
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge14.us, %.preheader2.lr.ph
  %indvars.iv57 = phi i64 [ 0, %.preheader2.lr.ph ], [ %indvars.iv.next58, %._crit_edge14.us ]
  br label %.lr.ph11.us.us

._crit_edge14.us:                                 ; preds = %._crit_edge12.us.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next58, 800
  br i1 %exitcond64, label %.preheader.us.preheader, label %.preheader2.us

.preheader.us.preheader:                          ; preds = %._crit_edge14.us
  br label %.preheader.us

.lr.ph11.us.us:                                   ; preds = %.preheader2.us, %._crit_edge12.us.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %._crit_edge12.us.us ], [ 0, %.preheader2.us ]
  %11 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv57, i64 %indvars.iv51
  store double 0.000000e+00, double* %11, align 8
  br label %.lr.ph11.us.us.new

._crit_edge12.us.us:                              ; preds = %.lr.ph11.us.us.new
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next52, 900
  br i1 %exitcond63, label %._crit_edge14.us, label %.lr.ph11.us.us

.lr.ph11.us.us.new:                               ; preds = %.lr.ph11.us.us, %.lr.ph11.us.us.new
  %indvars.iv42 = phi i64 [ %indvars.iv.next43.1, %.lr.ph11.us.us.new ], [ 0, %.lr.ph11.us.us ]
  %12 = phi double [ %26, %.lr.ph11.us.us.new ], [ 0.000000e+00, %.lr.ph11.us.us ]
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv57, i64 %indvars.iv42
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %4
  %16 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv42, i64 %indvars.iv51
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %12, %18
  store double %19, double* %11, align 8
  %indvars.iv.next43 = or i64 %indvars.iv42, 1
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv57, i64 %indvars.iv.next43
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %4
  %23 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next43, i64 %indvars.iv51
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fadd double %19, %25
  store double %26, double* %11, align 8
  %indvars.iv.next43.1 = add nuw nsw i64 %indvars.iv42, 2
  %exitcond45.1 = icmp eq i64 %indvars.iv.next43.1, 1100
  br i1 %exitcond45.1, label %._crit_edge12.us.us, label %.lr.ph11.us.us.new

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge4.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge4.us ], [ 0, %.preheader.us.preheader ]
  br label %.lr.ph.us.us

._crit_edge4.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond = icmp eq i64 %indvars.iv.next33, 800
  br i1 %exitcond, label %._crit_edge5, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.preheader.us, %._crit_edge.us.us
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %._crit_edge.us.us ], [ 0, %.preheader.us ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv32, i64 %indvars.iv29
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %5
  store double %29, double* %27, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next30, 1200
  br i1 %exitcond62, label %._crit_edge4.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %indvars.iv23 = phi i64 [ %indvars.iv.next24.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %30 = phi double [ %42, %.lr.ph.us.us.new ], [ %29, %.lr.ph.us.us ]
  %31 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv32, i64 %indvars.iv23
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv23, i64 %indvars.iv29
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %30, %35
  store double %36, double* %27, align 8
  %indvars.iv.next24 = or i64 %indvars.iv23, 1
  %37 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv32, i64 %indvars.iv.next24
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next24, i64 %indvars.iv29
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %36, %41
  store double %42, double* %27, align 8
  %indvars.iv.next24.1 = add nuw nsw i64 %indvars.iv23, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next24.1, 900
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

._crit_edge5:                                     ; preds = %._crit_edge4.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge1.us, %.preheader.us.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next5, %._crit_edge1.us ]
  %7 = mul nsw i64 %indvars.iv4, 800
  br label %8

; <label>:8:                                      ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %9 = add nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %13, %8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond9, label %._crit_edge1.us, label %8

._crit_edge1.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 800
  br i1 %exitcond, label %._crit_edge2, label %.preheader.us

._crit_edge2:                                     ; preds = %._crit_edge1.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

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
