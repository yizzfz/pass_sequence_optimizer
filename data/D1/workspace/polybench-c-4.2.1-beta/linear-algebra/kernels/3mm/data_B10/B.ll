; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %7 = call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %8 = call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %9 = call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %5 to [900 x double]*
  %12 = bitcast i8* %7 to [1200 x double]*
  %13 = bitcast i8* %8 to [1100 x double]*
  call void @init_array([1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  call void @kernel_3mm([900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
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
  %22 = bitcast i8* %9 to [1100 x double]*
  call void @print_array([1100 x double]* %22)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) #2 {
.lr.ph20.preheader:
  br label %.lr.ph20

.lr.ph20:                                         ; preds = %._crit_edge18, %.lr.ph20.preheader
  %indvars.iv40 = phi i64 [ 0, %.lr.ph20.preheader ], [ %indvars.iv.next41, %._crit_edge18 ]
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.lr.ph20
  %indvars.iv37 = phi i64 [ 0, %.lr.ph20 ], [ %indvars.iv.next38, %._crit_edge1 ]
  %4 = mul nuw nsw i64 %indvars.iv40, %indvars.iv37
  %5 = add nuw nsw i64 %4, 1
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 800
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 4.000000e+03
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv40, i64 %indvars.iv37
  store double %9, double* %10, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond39, label %._crit_edge18, label %._crit_edge1

._crit_edge18:                                    ; preds = %._crit_edge1
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next41, 800
  br i1 %exitcond42, label %.lr.ph14.preheader, label %.lr.ph20

.lr.ph14.preheader:                               ; preds = %._crit_edge18
  br label %.lr.ph14

.lr.ph14:                                         ; preds = %.lr.ph14.preheader, %._crit_edge12
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge12 ], [ 0, %.lr.ph14.preheader ]
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph14
  %indvars.iv31 = phi i64 [ 0, %.lr.ph14 ], [ %indvars.iv.next32, %._crit_edge2 ]
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %11 = mul nuw nsw i64 %indvars.iv34, %indvars.iv.next32
  %12 = add nuw nsw i64 %11, 2
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 900
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 4.500000e+03
  %17 = getelementptr inbounds [900 x double], [900 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv31
  store double %16, double* %17, align 8
  %exitcond33 = icmp eq i64 %indvars.iv.next32, 900
  br i1 %exitcond33, label %._crit_edge12, label %._crit_edge2

._crit_edge12:                                    ; preds = %._crit_edge2
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next35, 1000
  br i1 %exitcond36, label %.lr.ph8.preheader, label %.lr.ph14

.lr.ph8.preheader:                                ; preds = %._crit_edge12
  br label %.lr.ph8

.lr.ph8:                                          ; preds = %.lr.ph8.preheader, %._crit_edge6
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge6 ], [ 0, %.lr.ph8.preheader ]
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4, %.lr.ph8
  %indvars.iv25 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next26, %._crit_edge4 ]
  %18 = add nuw nsw i64 %indvars.iv25, 3
  %19 = mul nuw nsw i64 %indvars.iv28, %18
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 1100
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 5.500000e+03
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv25
  store double %23, double* %24, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next26, 1200
  br i1 %exitcond27, label %._crit_edge6, label %._crit_edge4

._crit_edge6:                                     ; preds = %._crit_edge4
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 900
  br i1 %exitcond30, label %.lr.ph2.preheader, label %.lr.ph8

.lr.ph2.preheader:                                ; preds = %._crit_edge6
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %.lr.ph2.preheader, %._crit_edge
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge ], [ 0, %.lr.ph2.preheader ]
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5, %.lr.ph2
  %indvars.iv = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next, %._crit_edge5 ]
  %25 = add nuw nsw i64 %indvars.iv, 2
  %26 = mul nuw nsw i64 %indvars.iv22, %25
  %27 = add nuw nsw i64 %26, 2
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 5.000000e+03
  %32 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv
  store double %31, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge, label %._crit_edge5

._crit_edge:                                      ; preds = %._crit_edge5
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond24, label %._crit_edge3, label %.lr.ph2

._crit_edge3:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_3mm([900 x double]*, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]*, [1200 x double]*, [1100 x double]*, [1100 x double]* nocapture) #2 {
.lr.ph23:
  %7 = alloca [900 x double]*, align 8
  %8 = alloca [1100 x double]*, align 8
  %9 = alloca [1200 x double]*, align 8
  %10 = alloca [1100 x double]*, align 8
  store [900 x double]* %0, [900 x double]** %7, align 8
  store [1100 x double]* %3, [1100 x double]** %8, align 8
  store [1200 x double]* %4, [1200 x double]** %9, align 8
  store [1100 x double]* %5, [1100 x double]** %10, align 8
  br label %.lr.ph20

.lr.ph20:                                         ; preds = %._crit_edge21, %.lr.ph23
  %indvars.iv48 = phi i64 [ 0, %.lr.ph23 ], [ %indvars.iv.next49, %._crit_edge21 ]
  br label %.lr.ph17

.lr.ph17:                                         ; preds = %._crit_edge18, %.lr.ph20
  %indvars.iv44 = phi i64 [ 0, %.lr.ph20 ], [ %indvars.iv.next45, %._crit_edge18 ]
  %11 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv44
  store double 0.000000e+00, double* %11, align 8
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.lr.ph17
  %indvars.iv41 = phi i64 [ 0, %.lr.ph17 ], [ %indvars.iv.next42.1, %._crit_edge1 ]
  %12 = phi double [ 0.000000e+00, %.lr.ph17 ], [ %24, %._crit_edge1 ]
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv41
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv41, i64 %indvars.iv44
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %12, %17
  store double %18, double* %11, align 8
  %indvars.iv.next42 = or i64 %indvars.iv41, 1
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv.next42
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv.next42, i64 %indvars.iv44
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fadd double %18, %23
  store double %24, double* %11, align 8
  %indvars.iv.next42.1 = add nuw nsw i64 %indvars.iv41, 2
  %exitcond43.1 = icmp eq i64 %indvars.iv.next42.1, 1000
  br i1 %exitcond43.1, label %._crit_edge18, label %._crit_edge1

._crit_edge18:                                    ; preds = %._crit_edge1
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next45, 900
  br i1 %exitcond46, label %._crit_edge21, label %.lr.ph17

._crit_edge21:                                    ; preds = %._crit_edge18
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next49, 800
  br i1 %exitcond50, label %.lr.ph14, label %.lr.ph20

.lr.ph14:                                         ; preds = %._crit_edge21
  %25 = load [1200 x double]*, [1200 x double]** %9, align 8
  %26 = load [1100 x double]*, [1100 x double]** %10, align 8
  br label %.lr.ph11

.lr.ph11:                                         ; preds = %._crit_edge12, %.lr.ph14
  %indvars.iv38 = phi i64 [ 0, %.lr.ph14 ], [ %indvars.iv.next39, %._crit_edge12 ]
  br label %.lr.ph8

.lr.ph8:                                          ; preds = %._crit_edge9, %.lr.ph11
  %indvars.iv34 = phi i64 [ 0, %.lr.ph11 ], [ %indvars.iv.next35, %._crit_edge9 ]
  %27 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv34
  store double 0.000000e+00, double* %27, align 8
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph8
  %indvars.iv31 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next32.2, %._crit_edge2 ]
  %28 = phi double [ 0.000000e+00, %.lr.ph8 ], [ %46, %._crit_edge2 ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %indvars.iv38, i64 %indvars.iv31
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [1100 x double], [1100 x double]* %26, i64 %indvars.iv31, i64 %indvars.iv34
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %28, %33
  store double %34, double* %27, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %indvars.iv38, i64 %indvars.iv.next32
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %26, i64 %indvars.iv.next32, i64 %indvars.iv34
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %34, %39
  store double %40, double* %27, align 8
  %indvars.iv.next32.1 = add nuw nsw i64 %indvars.iv31, 2
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %indvars.iv38, i64 %indvars.iv.next32.1
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1100 x double], [1100 x double]* %26, i64 %indvars.iv.next32.1, i64 %indvars.iv34
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %40, %45
  store double %46, double* %27, align 8
  %indvars.iv.next32.2 = add nuw nsw i64 %indvars.iv31, 3
  %exitcond33.2 = icmp eq i64 %indvars.iv.next32.2, 1200
  br i1 %exitcond33.2, label %._crit_edge9, label %._crit_edge2

._crit_edge9:                                     ; preds = %._crit_edge2
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next35, 1100
  br i1 %exitcond36, label %._crit_edge12, label %.lr.ph8

._crit_edge12:                                    ; preds = %._crit_edge9
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next39, 900
  br i1 %exitcond40, label %.lr.ph5, label %.lr.ph11

.lr.ph5:                                          ; preds = %._crit_edge12
  %47 = load [900 x double]*, [900 x double]** %7, align 8
  %48 = load [1100 x double]*, [1100 x double]** %8, align 8
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %._crit_edge3, %.lr.ph5
  %indvars.iv28 = phi i64 [ 0, %.lr.ph5 ], [ %indvars.iv.next29, %._crit_edge3 ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph2
  %indvars.iv25 = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next26, %._crit_edge ]
  %49 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv28, i64 %indvars.iv25
  store double 0.000000e+00, double* %49, align 8
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.2, %._crit_edge4 ]
  %50 = phi double [ 0.000000e+00, %.lr.ph ], [ %68, %._crit_edge4 ]
  %51 = getelementptr inbounds [900 x double], [900 x double]* %47, i64 %indvars.iv28, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1100 x double], [1100 x double]* %48, i64 %indvars.iv, i64 %indvars.iv25
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %50, %55
  store double %56, double* %49, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %57 = getelementptr inbounds [900 x double], [900 x double]* %47, i64 %indvars.iv28, i64 %indvars.iv.next
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1100 x double], [1100 x double]* %48, i64 %indvars.iv.next, i64 %indvars.iv25
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fadd double %56, %61
  store double %62, double* %49, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %63 = getelementptr inbounds [900 x double], [900 x double]* %47, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1100 x double], [1100 x double]* %48, i64 %indvars.iv.next.1, i64 %indvars.iv25
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fadd double %62, %67
  store double %68, double* %49, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 900
  br i1 %exitcond.2, label %._crit_edge, label %._crit_edge4

._crit_edge:                                      ; preds = %._crit_edge4
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, 1100
  br i1 %exitcond, label %._crit_edge3, label %.lr.ph

._crit_edge3:                                     ; preds = %._crit_edge
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 800
  br i1 %exitcond30, label %._crit_edge6, label %.lr.ph2

._crit_edge6:                                     ; preds = %._crit_edge3
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1100 x double]* nocapture readonly) #0 {
.lr.ph2.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %._crit_edge, %.lr.ph2.preheader
  %indvars.iv4 = phi i64 [ 0, %.lr.ph2.preheader ], [ %indvars.iv.next5, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv4, 800
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge1, %.lr.ph2
  %indvars.iv = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next, %._crit_edge1 ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge1

; <label>:10:                                     ; preds = %._crit_edge2
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge2, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge, label %._crit_edge2

._crit_edge:                                      ; preds = %._crit_edge1
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 800
  br i1 %exitcond6, label %._crit_edge3, label %.lr.ph2

._crit_edge3:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
