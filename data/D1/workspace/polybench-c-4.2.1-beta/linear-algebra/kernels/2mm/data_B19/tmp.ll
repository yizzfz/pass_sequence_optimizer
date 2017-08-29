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
  call void @init_array(double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  call void @kernel_2mm(double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
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
  call void @print_array([1200 x double]* %13)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double*, double*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) #2 {
.lr.ph20.preheader:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.lr.ph20

.lr.ph20:                                         ; preds = %._crit_edge18, %.lr.ph20.preheader
  %indvars.iv19 = phi i64 [ 0, %.lr.ph20.preheader ], [ %indvars.iv.next20, %._crit_edge18 ]
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26, %.lr.ph20
  %indvars.iv16 = phi i64 [ 0, %.lr.ph20 ], [ %indvars.iv.next17, %._crit_edge26 ]
  %6 = mul nuw nsw i64 %indvars.iv16, %indvars.iv19
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 800
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 8.000000e+02
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv16
  store double %11, double* %12, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1100
  br i1 %exitcond18, label %._crit_edge18, label %._crit_edge26

._crit_edge18:                                    ; preds = %._crit_edge26
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 800
  br i1 %exitcond21, label %.lr.ph14.preheader, label %.lr.ph20

.lr.ph14.preheader:                               ; preds = %._crit_edge18
  br label %.lr.ph14

.lr.ph14:                                         ; preds = %.lr.ph14.preheader, %._crit_edge12
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge12 ], [ 0, %.lr.ph14.preheader ]
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27, %.lr.ph14
  %indvars.iv10 = phi i64 [ 0, %.lr.ph14 ], [ %indvars.iv.next11.1, %._crit_edge27 ]
  %indvars.iv.next11 = or i64 %indvars.iv10, 1
  %13 = mul nuw nsw i64 %indvars.iv.next11, %indvars.iv13
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 900
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv10
  %indvars.iv.next11.1 = add nuw nsw i64 %indvars.iv10, 2
  %18 = mul nuw nsw i64 %indvars.iv.next11.1, %indvars.iv13
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 900
  %21 = sitofp i32 %20 to double
  %22 = insertelement <2 x double> undef, double %16, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  %24 = fdiv <2 x double> %23, <double 9.000000e+02, double 9.000000e+02>
  %25 = bitcast double* %17 to <2 x double>*
  store <2 x double> %24, <2 x double>* %25, align 8
  %exitcond12.1 = icmp eq i64 %indvars.iv.next11.1, 900
  br i1 %exitcond12.1, label %._crit_edge12, label %._crit_edge27

._crit_edge12:                                    ; preds = %._crit_edge27
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1100
  br i1 %exitcond15, label %.lr.ph8.preheader, label %.lr.ph14

.lr.ph8.preheader:                                ; preds = %._crit_edge12
  br label %.lr.ph8

.lr.ph8:                                          ; preds = %.lr.ph8.preheader, %._crit_edge6
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge6 ], [ 0, %.lr.ph8.preheader ]
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28, %.lr.ph8
  %indvars.iv4 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next5, %._crit_edge28 ]
  %26 = add nuw nsw i64 %indvars.iv4, 3
  %27 = mul nuw nsw i64 %26, %indvars.iv7
  %28 = add nuw nsw i64 %27, 1
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 1200
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 1.200000e+03
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv7, i64 %indvars.iv4
  store double %32, double* %33, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %._crit_edge6, label %._crit_edge28

._crit_edge6:                                     ; preds = %._crit_edge28
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 900
  br i1 %exitcond9, label %.lr.ph2.preheader, label %.lr.ph8

.lr.ph2.preheader:                                ; preds = %._crit_edge6
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %.lr.ph2.preheader, %._crit_edge
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge ], [ 0, %.lr.ph2.preheader ]
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29, %.lr.ph2
  %indvars.iv = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next, %._crit_edge29 ]
  %34 = add nuw nsw i64 %indvars.iv, 2
  %35 = mul nuw nsw i64 %34, %indvars.iv1
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 1100
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, 1.100000e+03
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1, i64 %indvars.iv
  store double %39, double* %40, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge, label %._crit_edge29

._crit_edge:                                      ; preds = %._crit_edge29
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 800
  br i1 %exitcond3, label %._crit_edge3, label %.lr.ph2

._crit_edge3:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_2mm(double, double, [900 x double]*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) #2 {
.lr.ph14:
  br label %.lr.ph11

.lr.ph11:                                         ; preds = %._crit_edge12, %.lr.ph14
  %indvars.iv14 = phi i64 [ 0, %.lr.ph14 ], [ %indvars.iv.next15, %._crit_edge12 ]
  br label %.lr.ph8

.lr.ph8:                                          ; preds = %._crit_edge9, %.lr.ph11
  %indvars.iv10 = phi i64 [ 0, %.lr.ph11 ], [ %indvars.iv.next11, %._crit_edge9 ]
  %7 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv10
  store double 0.000000e+00, double* %7, align 8
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19, %.lr.ph8
  %indvars.iv7 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next8.1, %._crit_edge19 ]
  %8 = phi double [ 0.000000e+00, %.lr.ph8 ], [ %22, %._crit_edge19 ]
  %9 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv14, i64 %indvars.iv7
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %0
  %12 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv7, i64 %indvars.iv10
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fadd double %14, %8
  store double %15, double* %7, align 8
  %indvars.iv.next8 = or i64 %indvars.iv7, 1
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv14, i64 %indvars.iv.next8
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %0
  %19 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv.next8, i64 %indvars.iv10
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %21, %15
  store double %22, double* %7, align 8
  %indvars.iv.next8.1 = add nuw nsw i64 %indvars.iv7, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8.1, 1100
  br i1 %exitcond9.1, label %._crit_edge9, label %._crit_edge19

._crit_edge9:                                     ; preds = %._crit_edge19
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 900
  br i1 %exitcond12, label %._crit_edge12, label %.lr.ph8

._crit_edge12:                                    ; preds = %._crit_edge9
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 800
  br i1 %exitcond16, label %.lr.ph2.preheader, label %.lr.ph11

.lr.ph2.preheader:                                ; preds = %._crit_edge12
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %.lr.ph2.preheader, %._crit_edge3
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %._crit_edge3 ], [ 0, %.lr.ph2.preheader ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph2
  %indvars.iv1 = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next2, %._crit_edge ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv4, i64 %indvars.iv1
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %1
  store double %25, double* %23, align 8
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.2, %._crit_edge20 ]
  %26 = phi double [ %25, %.lr.ph ], [ %44, %._crit_edge20 ]
  %27 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv, i64 %indvars.iv1
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fadd double %31, %26
  store double %32, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %33 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv.next
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next, i64 %indvars.iv1
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %37, %32
  store double %38, double* %23, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %39 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv.next.1
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next.1, i64 %indvars.iv1
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %43, %38
  store double %44, double* %23, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 900
  br i1 %exitcond.2, label %._crit_edge, label %._crit_edge20

._crit_edge:                                      ; preds = %._crit_edge20
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %._crit_edge3, label %.lr.ph

._crit_edge3:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 800
  br i1 %exitcond6, label %._crit_edge6, label %.lr.ph2

._crit_edge6:                                     ; preds = %._crit_edge3
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*) #0 {
.lr.ph2.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %._crit_edge, %.lr.ph2.preheader
  %indvars.iv1 = phi i64 [ 0, %.lr.ph2.preheader ], [ %indvars.iv.next2, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv1, 800
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge5, %.lr.ph2
  %indvars.iv = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next, %._crit_edge5 ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge5

; <label>:10:                                     ; preds = %._crit_edge6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge6, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge, label %._crit_edge6

._crit_edge:                                      ; preds = %._crit_edge5
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 800
  br i1 %exitcond3, label %._crit_edge3, label %.lr.ph2

._crit_edge3:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
