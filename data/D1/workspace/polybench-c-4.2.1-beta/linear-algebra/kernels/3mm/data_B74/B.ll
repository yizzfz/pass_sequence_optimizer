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
  %3 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %5 to [900 x double]*
  %12 = bitcast i8* %7 to [1200 x double]*
  %13 = bitcast i8* %8 to [1100 x double]*
  tail call void @init_array([1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call void @kernel_3mm([900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
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
  tail call void @print_array([1100 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) #2 {
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %12, %4
  %indvars.iv19 = phi i64 [ 0, %4 ], [ %indvars.iv.next20, %12 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge22
  %indvars.iv16 = phi i64 [ 0, %._crit_edge22 ], [ %indvars.iv.next17, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv16, %indvars.iv19
  %6 = add nuw nsw i64 %5, 1
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 800
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 4.000000e+03
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv19, i64 %indvars.iv16
  store double %10, double* %11, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond18, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 800
  br i1 %exitcond21, label %.preheader2.preheader, label %._crit_edge22

.preheader2.preheader:                            ; preds = %12
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.preheader, %20
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %20 ], [ 0, %.preheader2.preheader ]
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23, %.preheader2
  %indvars.iv10 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next11, %._crit_edge23 ]
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %13 = mul nuw nsw i64 %indvars.iv.next11, %indvars.iv13
  %14 = add nuw nsw i64 %13, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 900
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 4.500000e+03
  %19 = getelementptr inbounds [900 x double], [900 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv10
  store double %18, double* %19, align 8
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 900
  br i1 %exitcond12, label %20, label %._crit_edge23

; <label>:20:                                     ; preds = %._crit_edge23
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond15, label %.preheader1.preheader, label %.preheader2

.preheader1.preheader:                            ; preds = %20
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.preheader, %28
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %28 ], [ 0, %.preheader1.preheader ]
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24, %.preheader1
  %indvars.iv4 = phi i64 [ 0, %.preheader1 ], [ %indvars.iv.next5, %._crit_edge24 ]
  %21 = add nuw nsw i64 %indvars.iv4, 3
  %22 = mul nuw nsw i64 %21, %indvars.iv7
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 1100
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 5.500000e+03
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv4
  store double %26, double* %27, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %28, label %._crit_edge24

; <label>:28:                                     ; preds = %._crit_edge24
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 900
  br i1 %exitcond9, label %.preheader.preheader, label %.preheader1

.preheader.preheader:                             ; preds = %28
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %37
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %37 ], [ 0, %.preheader.preheader ]
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge25 ]
  %29 = add nuw nsw i64 %indvars.iv, 2
  %30 = mul nuw nsw i64 %29, %indvars.iv1
  %31 = add nuw nsw i64 %30, 2
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 1000
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, 5.000000e+03
  %36 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv1, i64 %indvars.iv
  store double %35, double* %36, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %37, label %._crit_edge25

; <label>:37:                                     ; preds = %._crit_edge25
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %38, label %.preheader

; <label>:38:                                     ; preds = %37
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_3mm([900 x double]*, [1000 x double]*, [900 x double]*, [1100 x double]*, [1200 x double]*, [1100 x double]*, [1100 x double]*) #2 {
  %8 = alloca [900 x double]*, align 8
  %9 = alloca [1000 x double]*, align 8
  %10 = alloca [900 x double]*, align 8
  %11 = alloca [1100 x double]*, align 8
  %12 = alloca [1200 x double]*, align 8
  %13 = alloca [1100 x double]*, align 8
  store [900 x double]* %0, [900 x double]** %8, align 8
  store [1000 x double]* %1, [1000 x double]** %9, align 8
  store [900 x double]* %2, [900 x double]** %10, align 8
  store [1100 x double]* %3, [1100 x double]** %11, align 8
  store [1200 x double]* %4, [1200 x double]** %12, align 8
  store [1100 x double]* %5, [1100 x double]** %13, align 8
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %34, %7
  %indvars.iv24 = phi i64 [ 0, %7 ], [ %indvars.iv.next25, %34 ]
  %14 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv24
  %sunkaddr = ptrtoint [900 x double]* %14 to i64
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %33, %._crit_edge28
  %indvars.iv20 = phi i64 [ 0, %._crit_edge28 ], [ %indvars.iv.next21, %33 ]
  %15 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv24, i64 %indvars.iv20
  store double 0.000000e+00, double* %15, align 8
  %sunkaddr1 = shl nsw i64 %indvars.iv20, 3
  %sunkaddr2 = add i64 %sunkaddr1, %sunkaddr
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge27
  %indvars.iv17 = phi i64 [ 0, %._crit_edge27 ], [ %indvars.iv.next18.1, %._crit_edge ]
  %16 = phi double [ 0.000000e+00, %._crit_edge27 ], [ %32, %._crit_edge ]
  %17 = load [1000 x double]*, [1000 x double]** %9, align 8
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %17, i64 %indvars.iv24, i64 %indvars.iv17
  %19 = load double, double* %18, align 8
  %20 = load [900 x double]*, [900 x double]** %10, align 8
  %21 = getelementptr inbounds [900 x double], [900 x double]* %20, i64 %indvars.iv17, i64 %indvars.iv20
  %22 = load double, double* %21, align 8
  %23 = fmul double %19, %22
  %24 = fadd double %16, %23
  store double %24, double* %sunkaddr3, align 8
  %indvars.iv.next18 = or i64 %indvars.iv17, 1
  %25 = load [1000 x double]*, [1000 x double]** %9, align 8
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 %indvars.iv24, i64 %indvars.iv.next18
  %27 = load double, double* %26, align 8
  %28 = load [900 x double]*, [900 x double]** %10, align 8
  %29 = getelementptr inbounds [900 x double], [900 x double]* %28, i64 %indvars.iv.next18, i64 %indvars.iv20
  %30 = load double, double* %29, align 8
  %31 = fmul double %27, %30
  %32 = fadd double %24, %31
  store double %32, double* %sunkaddr3, align 8
  %indvars.iv.next18.1 = add nuw nsw i64 %indvars.iv17, 2
  %exitcond19.1 = icmp eq i64 %indvars.iv.next18.1, 1000
  br i1 %exitcond19.1, label %33, label %._crit_edge

; <label>:33:                                     ; preds = %._crit_edge
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 900
  br i1 %exitcond22, label %34, label %._crit_edge27

; <label>:34:                                     ; preds = %33
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 800
  br i1 %exitcond26, label %.preheader12.preheader, label %._crit_edge28

.preheader12.preheader:                           ; preds = %34
  br label %.preheader12

.preheader12:                                     ; preds = %.preheader12.preheader, %55
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %55 ], [ 0, %.preheader12.preheader ]
  %35 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv14
  %sunkaddr4 = ptrtoint [1100 x double]* %35 to i64
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %54, %.preheader12
  %indvars.iv10 = phi i64 [ 0, %.preheader12 ], [ %indvars.iv.next11, %54 ]
  %36 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv14, i64 %indvars.iv10
  store double 0.000000e+00, double* %36, align 8
  %sunkaddr5 = shl nsw i64 %indvars.iv10, 3
  %sunkaddr6 = add i64 %sunkaddr5, %sunkaddr4
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to double*
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29, %._crit_edge30
  %indvars.iv7 = phi i64 [ 0, %._crit_edge30 ], [ %indvars.iv.next8.1, %._crit_edge29 ]
  %37 = phi double [ 0.000000e+00, %._crit_edge30 ], [ %53, %._crit_edge29 ]
  %38 = load [1200 x double]*, [1200 x double]** %12, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %38, i64 %indvars.iv14, i64 %indvars.iv7
  %40 = load double, double* %39, align 8
  %41 = load [1100 x double]*, [1100 x double]** %13, align 8
  %42 = getelementptr inbounds [1100 x double], [1100 x double]* %41, i64 %indvars.iv7, i64 %indvars.iv10
  %43 = load double, double* %42, align 8
  %44 = fmul double %40, %43
  %45 = fadd double %37, %44
  store double %45, double* %sunkaddr7, align 8
  %indvars.iv.next8 = or i64 %indvars.iv7, 1
  %46 = load [1200 x double]*, [1200 x double]** %12, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %46, i64 %indvars.iv14, i64 %indvars.iv.next8
  %48 = load double, double* %47, align 8
  %49 = load [1100 x double]*, [1100 x double]** %13, align 8
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %49, i64 %indvars.iv.next8, i64 %indvars.iv10
  %51 = load double, double* %50, align 8
  %52 = fmul double %48, %51
  %53 = fadd double %45, %52
  store double %53, double* %sunkaddr7, align 8
  %indvars.iv.next8.1 = add nuw nsw i64 %indvars.iv7, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8.1, 1200
  br i1 %exitcond9.1, label %54, label %._crit_edge29

; <label>:54:                                     ; preds = %._crit_edge29
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1100
  br i1 %exitcond12, label %55, label %._crit_edge30

; <label>:55:                                     ; preds = %54
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 900
  br i1 %exitcond16, label %.preheader.preheader, label %.preheader12

.preheader.preheader:                             ; preds = %55
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %76
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %76 ], [ 0, %.preheader.preheader ]
  %56 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv4
  %sunkaddr8 = ptrtoint [1100 x double]* %56 to i64
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %75, %.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next2, %75 ]
  %57 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv4, i64 %indvars.iv1
  store double 0.000000e+00, double* %57, align 8
  %sunkaddr9 = shl nsw i64 %indvars.iv1, 3
  %sunkaddr10 = add i64 %sunkaddr9, %sunkaddr8
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to double*
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31, %._crit_edge32
  %indvars.iv = phi i64 [ 0, %._crit_edge32 ], [ %indvars.iv.next.1, %._crit_edge31 ]
  %58 = phi double [ 0.000000e+00, %._crit_edge32 ], [ %74, %._crit_edge31 ]
  %59 = load [900 x double]*, [900 x double]** %8, align 8
  %60 = getelementptr inbounds [900 x double], [900 x double]* %59, i64 %indvars.iv4, i64 %indvars.iv
  %61 = load double, double* %60, align 8
  %62 = load [1100 x double]*, [1100 x double]** %11, align 8
  %63 = getelementptr inbounds [1100 x double], [1100 x double]* %62, i64 %indvars.iv, i64 %indvars.iv1
  %64 = load double, double* %63, align 8
  %65 = fmul double %61, %64
  %66 = fadd double %58, %65
  store double %66, double* %sunkaddr11, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %67 = load [900 x double]*, [900 x double]** %8, align 8
  %68 = getelementptr inbounds [900 x double], [900 x double]* %67, i64 %indvars.iv4, i64 %indvars.iv.next
  %69 = load double, double* %68, align 8
  %70 = load [1100 x double]*, [1100 x double]** %11, align 8
  %71 = getelementptr inbounds [1100 x double], [1100 x double]* %70, i64 %indvars.iv.next, i64 %indvars.iv1
  %72 = load double, double* %71, align 8
  %73 = fmul double %69, %72
  %74 = fadd double %66, %73
  store double %74, double* %sunkaddr11, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 900
  br i1 %exitcond.1, label %75, label %._crit_edge31

; <label>:75:                                     ; preds = %._crit_edge31
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 1100
  br i1 %exitcond, label %76, label %._crit_edge32

; <label>:76:                                     ; preds = %75
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 800
  br i1 %exitcond6, label %77, label %.preheader

; <label>:77:                                     ; preds = %76
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1100 x double]* nocapture readonly) #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %17, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 800
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge, %._crit_edge5
  %indvars.iv = phi i64 [ 0, %._crit_edge5 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge4, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %17, label %._crit_edge4

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 800
  br i1 %exitcond3, label %18, label %._crit_edge5

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
