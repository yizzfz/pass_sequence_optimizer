; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  tail call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  tail call void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %22

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %22

; <label>:21:                                     ; preds = %18
  tail call void @print_array(i32 800, i32 1200, [1200 x double]* %13)
  br label %22

; <label>:22:                                     ; preds = %18, %21, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) #2 {
.preheader51.lr.ph:
  store double 1.500000e+00, double* %4, align 8
  store double 1.200000e+00, double* %5, align 8
  br label %.preheader51.us

.preheader51.us:                                  ; preds = %.preheader51.lr.ph, %._crit_edge68.us
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge68.us ], [ 0, %.preheader51.lr.ph ]
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader51.us
  %indvars.iv98 = phi i64 [ 0, %.preheader51.us ], [ %indvars.iv.next99, %10 ]
  %11 = mul nuw nsw i64 %indvars.iv98, %indvars.iv102
  %12 = add nuw nsw i64 %11, 1
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 800
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 8.000000e+02
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv102, i64 %indvars.iv98
  store double %16, double* %17, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next99, 1100
  br i1 %exitcond101, label %._crit_edge68.us, label %10

._crit_edge68.us:                                 ; preds = %10
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next103, 800
  br i1 %exitcond105, label %.preheader49.us.preheader, label %.preheader51.us

.preheader49.us.preheader:                        ; preds = %._crit_edge68.us
  br label %.preheader49.us

.preheader49.us:                                  ; preds = %.preheader49.us.preheader, %._crit_edge63.us
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %._crit_edge63.us ], [ 0, %.preheader49.us.preheader ]
  br label %.preheader49.us.new

.preheader49.us.new:                              ; preds = %.preheader49.us, %.preheader49.us.new
  %indvars.iv89 = phi i64 [ %indvars.iv.next90.1, %.preheader49.us.new ], [ 0, %.preheader49.us ]
  %indvars.iv.next90 = or i64 %indvars.iv89, 1
  %18 = mul nuw nsw i64 %indvars.iv.next90, %indvars.iv93
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 900
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, 9.000000e+02
  %23 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv93, i64 %indvars.iv89
  store double %22, double* %23, align 8
  %indvars.iv.next90.1 = add nsw i64 %indvars.iv89, 2
  %24 = mul nuw nsw i64 %indvars.iv.next90.1, %indvars.iv93
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 900
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 9.000000e+02
  %29 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv93, i64 %indvars.iv.next90
  store double %28, double* %29, align 8
  %exitcond92.1 = icmp eq i64 %indvars.iv.next90.1, 900
  br i1 %exitcond92.1, label %._crit_edge63.us, label %.preheader49.us.new

._crit_edge63.us:                                 ; preds = %.preheader49.us.new
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next94, 1100
  br i1 %exitcond96, label %.preheader47.us.preheader, label %.preheader49.us

.preheader47.us.preheader:                        ; preds = %._crit_edge63.us
  br label %.preheader47.us

.preheader47.us:                                  ; preds = %.preheader47.us.preheader, %._crit_edge58.us
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %._crit_edge58.us ], [ 0, %.preheader47.us.preheader ]
  br label %30

; <label>:30:                                     ; preds = %30, %.preheader47.us
  %indvars.iv80 = phi i64 [ 0, %.preheader47.us ], [ %indvars.iv.next81, %30 ]
  %31 = add nuw nsw i64 %indvars.iv80, 3
  %32 = mul nuw nsw i64 %31, %indvars.iv84
  %33 = add nuw nsw i64 %32, 1
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, 1200
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, 1.200000e+03
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv84, i64 %indvars.iv80
  store double %37, double* %38, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next81, 1200
  br i1 %exitcond83, label %._crit_edge58.us, label %30

._crit_edge58.us:                                 ; preds = %30
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next85, 900
  br i1 %exitcond87, label %.preheader.us.preheader, label %.preheader47.us

.preheader.us.preheader:                          ; preds = %._crit_edge58.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %39

; <label>:39:                                     ; preds = %39, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %39 ]
  %40 = add nuw nsw i64 %indvars.iv, 2
  %41 = mul nuw nsw i64 %40, %indvars.iv75
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, 1100
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %44, 1.100000e+03
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv75, i64 %indvars.iv
  store double %45, double* %46, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %39

._crit_edge.us:                                   ; preds = %39
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next76, 800
  br i1 %exitcond78, label %._crit_edge55, label %.preheader.us

._crit_edge55:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) #2 {
.preheader41.lr.ph:
  br label %.preheader41.us

.preheader41.us:                                  ; preds = %._crit_edge60.us, %.preheader41.lr.ph
  %indvars.iv105 = phi i64 [ 0, %.preheader41.lr.ph ], [ %indvars.iv.next106, %._crit_edge60.us ]
  br label %.lr.ph56.us.us

._crit_edge60.us:                                 ; preds = %._crit_edge57.us.us
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next106, 800
  br i1 %exitcond108, label %.preheader.us.preheader, label %.preheader41.us

.preheader.us.preheader:                          ; preds = %._crit_edge60.us
  br label %.preheader.us

.lr.ph56.us.us:                                   ; preds = %.preheader41.us, %._crit_edge57.us.us
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %._crit_edge57.us.us ], [ 0, %.preheader41.us ]
  %11 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv105, i64 %indvars.iv99
  store double 0.000000e+00, double* %11, align 8
  br label %.lr.ph56.us.us.new

._crit_edge57.us.us:                              ; preds = %.lr.ph56.us.us.new
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next100, 900
  br i1 %exitcond102, label %._crit_edge60.us, label %.lr.ph56.us.us

.lr.ph56.us.us.new:                               ; preds = %.lr.ph56.us.us, %.lr.ph56.us.us.new
  %indvars.iv91 = phi i64 [ %indvars.iv.next92.1, %.lr.ph56.us.us.new ], [ 0, %.lr.ph56.us.us ]
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv105, i64 %indvars.iv91
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %4
  %15 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv91, i64 %indvars.iv99
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = load double, double* %11, align 8
  %19 = fadd double %18, %17
  store double %19, double* %11, align 8
  %indvars.iv.next92 = or i64 %indvars.iv91, 1
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv105, i64 %indvars.iv.next92
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %4
  %23 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next92, i64 %indvars.iv99
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = load double, double* %11, align 8
  %27 = fadd double %26, %25
  store double %27, double* %11, align 8
  %indvars.iv.next92.1 = add nsw i64 %indvars.iv91, 2
  %exitcond94.1 = icmp eq i64 %indvars.iv.next92.1, 1100
  br i1 %exitcond94.1, label %._crit_edge57.us.us, label %.lr.ph56.us.us.new

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge45.us
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %._crit_edge45.us ], [ 0, %.preheader.us.preheader ]
  br label %.lr.ph.us.us

._crit_edge45.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next82, 800
  br i1 %exitcond84, label %._crit_edge47, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.preheader.us, %._crit_edge.us.us
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %._crit_edge.us.us ], [ 0, %.preheader.us ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv81, i64 %indvars.iv78
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, %5
  store double %30, double* %28, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond = icmp eq i64 %indvars.iv.next79, 1200
  br i1 %exitcond, label %._crit_edge45.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %indvars.iv72 = phi i64 [ %indvars.iv.next73.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %31 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv81, i64 %indvars.iv72
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv72, i64 %indvars.iv78
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = load double, double* %28, align 8
  %37 = fadd double %36, %35
  store double %37, double* %28, align 8
  %indvars.iv.next73 = or i64 %indvars.iv72, 1
  %38 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv81, i64 %indvars.iv.next73
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next73, i64 %indvars.iv78
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = load double, double* %28, align 8
  %44 = fadd double %43, %42
  store double %44, double* %28, align 8
  %indvars.iv.next73.1 = add nsw i64 %indvars.iv72, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next73.1, 900
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

._crit_edge47:                                    ; preds = %._crit_edge45.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*) #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %7 = mul nsw i64 %indvars.iv14, 800
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %15 ]
  %9 = add nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 800
  br i1 %exitcond17, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
