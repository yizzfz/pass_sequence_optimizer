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
  tail call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  tail call fastcc void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  tail call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %13)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader10.lr.ph:
  store double 1.500000e+00, double* %4, align 8
  store double 1.200000e+00, double* %5, align 8
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %.preheader10.lr.ph, %._crit_edge27.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge27.us ], [ 0, %.preheader10.lr.ph ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader10.us
  %indvars.iv57 = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next58, %._crit_edge ]
  %10 = mul nuw nsw i64 %indvars.iv57, %indvars.iv61
  %11 = add nuw nsw i64 %10, 1
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 800
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 8.000000e+02
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv61, i64 %indvars.iv57
  store double %15, double* %16, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 1100
  br i1 %exitcond60, label %._crit_edge27.us, label %._crit_edge

._crit_edge27.us:                                 ; preds = %._crit_edge
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, 800
  br i1 %exitcond64, label %.preheader8.us.preheader, label %.preheader10.us

.preheader8.us.preheader:                         ; preds = %._crit_edge27.us
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %.preheader8.us.preheader, %._crit_edge22.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge22.us ], [ 0, %.preheader8.us.preheader ]
  br label %.preheader8.us.new

.preheader8.us.new:                               ; preds = %.preheader8.us, %.preheader8.us.new
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.1, %.preheader8.us.new ], [ 0, %.preheader8.us ]
  %indvars.iv.next49 = or i64 %indvars.iv48, 1
  %17 = mul nuw nsw i64 %indvars.iv.next49, %indvars.iv52
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 900
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv52, i64 %indvars.iv48
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %22 = mul nuw nsw i64 %indvars.iv.next49.1, %indvars.iv52
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 900
  %25 = sitofp i32 %24 to double
  %26 = insertelement <2 x double> undef, double %20, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fdiv <2 x double> %27, <double 9.000000e+02, double 9.000000e+02>
  %29 = bitcast double* %21 to <2 x double>*
  store <2 x double> %28, <2 x double>* %29, align 8
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49.1, 900
  br i1 %exitcond51.1, label %._crit_edge22.us, label %.preheader8.us.new

._crit_edge22.us:                                 ; preds = %.preheader8.us.new
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 1100
  br i1 %exitcond55, label %.preheader6.us.preheader, label %.preheader8.us

.preheader6.us.preheader:                         ; preds = %._crit_edge22.us
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %.preheader6.us.preheader, %._crit_edge17.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge17.us ], [ 0, %.preheader6.us.preheader ]
  br label %._crit_edge67

._crit_edge67:                                    ; preds = %._crit_edge67, %.preheader6.us
  %indvars.iv39 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next40, %._crit_edge67 ]
  %30 = add nuw nsw i64 %indvars.iv39, 3
  %31 = mul nuw nsw i64 %30, %indvars.iv43
  %32 = add nuw nsw i64 %31, 1
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, 1200
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, 1.200000e+03
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv43, i64 %indvars.iv39
  store double %36, double* %37, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 1200
  br i1 %exitcond42, label %._crit_edge17.us, label %._crit_edge67

._crit_edge17.us:                                 ; preds = %._crit_edge67
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, 900
  br i1 %exitcond46, label %.preheader.us.preheader, label %.preheader6.us

.preheader.us.preheader:                          ; preds = %._crit_edge17.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge68

._crit_edge68:                                    ; preds = %._crit_edge68, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge68 ]
  %38 = add nuw nsw i64 %indvars.iv, 2
  %39 = mul nuw nsw i64 %38, %indvars.iv34
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, 1100
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, 1.100000e+03
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv34, i64 %indvars.iv
  store double %43, double* %44, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge68

._crit_edge.us:                                   ; preds = %._crit_edge68
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, 800
  br i1 %exitcond37, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader6.lr.ph:
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge25.us, %.preheader6.lr.ph
  %indvars.iv73 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next74, %._crit_edge25.us ]
  br label %.lr.ph21.us.us

._crit_edge25.us:                                 ; preds = %._crit_edge22.us.us
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, 800
  br i1 %exitcond76, label %.preheader.us.preheader, label %.preheader6.us

.preheader.us.preheader:                          ; preds = %._crit_edge25.us
  br label %.preheader.us

.lr.ph21.us.us:                                   ; preds = %.preheader6.us, %._crit_edge22.us.us
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %._crit_edge22.us.us ], [ 0, %.preheader6.us ]
  %11 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv73, i64 %indvars.iv67
  store double 0.000000e+00, double* %11, align 8
  br label %.lr.ph21.us.us.new

._crit_edge22.us.us:                              ; preds = %.lr.ph21.us.us.new
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next68, 900
  br i1 %exitcond70, label %._crit_edge25.us, label %.lr.ph21.us.us

.lr.ph21.us.us.new:                               ; preds = %.lr.ph21.us.us, %.lr.ph21.us.us.new
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.1, %.lr.ph21.us.us.new ], [ 0, %.lr.ph21.us.us ]
  %12 = phi double [ %26, %.lr.ph21.us.us.new ], [ 0.000000e+00, %.lr.ph21.us.us ]
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv73, i64 %indvars.iv58
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %4
  %16 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv58, i64 %indvars.iv67
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %12, %18
  store double %19, double* %11, align 8
  %indvars.iv.next59 = or i64 %indvars.iv58, 1
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv73, i64 %indvars.iv.next59
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %4
  %23 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next59, i64 %indvars.iv67
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fadd double %19, %25
  store double %26, double* %11, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %exitcond61.1 = icmp eq i64 %indvars.iv.next59.1, 1100
  br i1 %exitcond61.1, label %._crit_edge22.us.us, label %.lr.ph21.us.us.new

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge10.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge10.us ], [ 0, %.preheader.us.preheader ]
  br label %.lr.ph.us.us

._crit_edge10.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, 800
  br i1 %exitcond51, label %._crit_edge12, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.preheader.us, %._crit_edge.us.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge.us.us ], [ 0, %.preheader.us ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv48, i64 %indvars.iv45
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %5
  store double %29, double* %27, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, 1200
  br i1 %exitcond, label %._crit_edge10.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %indvars.iv39 = phi i64 [ %indvars.iv.next40.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %30 = phi double [ %42, %.lr.ph.us.us.new ], [ %29, %.lr.ph.us.us ]
  %31 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv48, i64 %indvars.iv39
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv39, i64 %indvars.iv45
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %30, %35
  store double %36, double* %27, align 8
  %indvars.iv.next40 = or i64 %indvars.iv39, 1
  %37 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv48, i64 %indvars.iv.next40
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next40, i64 %indvars.iv45
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %36, %41
  store double %42, double* %27, align 8
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv39, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next40.1, 900
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

._crit_edge12:                                    ; preds = %._crit_edge10.us
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

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %7 = mul nsw i64 %indvars.iv6, 800
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge11, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge11

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 800
  br i1 %exitcond9, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
