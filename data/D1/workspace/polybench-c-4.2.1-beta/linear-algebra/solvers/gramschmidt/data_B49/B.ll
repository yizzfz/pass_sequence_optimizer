; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call void @init_array([1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_gramschmidt([1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  %15 = bitcast i8* %4 to [1200 x double]*
  tail call void @print_array([1200 x double]* %15, [1200 x double]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader2.lr.ph:
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge5.us, %.preheader2.lr.ph
  %indvars.iv14 = phi i64 [ 0, %.preheader2.lr.ph ], [ %indvars.iv.next15, %._crit_edge5.us ]
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader2.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %3 ], [ 0, %.preheader2.us ]
  %4 = mul nuw nsw i64 %indvars.iv10, %indvars.iv14
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 1000
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.000000e+03
  %9 = fmul double %8, 1.000000e+02
  %10 = fadd double %9, 1.000000e+01
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv10
  store double %10, double* %11, align 8
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv10
  store double 0.000000e+00, double* %12, align 8
  %exitcond13 = icmp eq i64 %indvars.iv10, 1199
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  br i1 %exitcond13, label %._crit_edge5.us, label %3

._crit_edge5.us:                                  ; preds = %3
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond1, label %.preheader.us.preheader, label %.preheader2.us

.preheader.us.preheader:                          ; preds = %._crit_edge5.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us, %.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next9.7, %.preheader.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv8, i64 0
  %scevgep17 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next9 = or i64 %indvars.iv8, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next9, i64 0
  %scevgep17.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next9.1 = or i64 %indvars.iv8, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next9.1, i64 0
  %scevgep17.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next9.2 = or i64 %indvars.iv8, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next9.2, i64 0
  %scevgep17.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next9.3 = or i64 %indvars.iv8, 4
  %scevgep.4 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next9.3, i64 0
  %scevgep17.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.4, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next9.4 = or i64 %indvars.iv8, 5
  %scevgep.5 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next9.4, i64 0
  %scevgep17.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.5, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next9.5 = or i64 %indvars.iv8, 6
  %scevgep.6 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next9.5, i64 0
  %scevgep17.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.6, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next9.6 = or i64 %indvars.iv8, 7
  %scevgep.7 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next9.6, i64 0
  %scevgep17.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep17.7, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next9.7 = add nsw i64 %indvars.iv8, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next9.7, 1200
  br i1 %exitcond.7, label %._crit_edge3, label %.preheader.us

._crit_edge3:                                     ; preds = %.preheader.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_gramschmidt([1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader8.lr.ph:
  br label %.preheader8

.preheader8:                                      ; preds = %._crit_edge18..preheader8_crit_edge, %.preheader8.lr.ph
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge18..preheader8_crit_edge ], [ 0, %.preheader8.lr.ph ]
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge18..preheader8_crit_edge ], [ 1, %.preheader8.lr.ph ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.preheader8
  %indvars.iv = phi i64 [ 0, %.preheader8 ], [ %indvars.iv.next.4, %.lr.ph ]
  %3 = phi double [ 0.000000e+00, %.preheader8 ], [ %23, %.lr.ph ]
  %4 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv, i64 %indvars.iv57
  %5 = load double, double* %4, align 8
  %6 = fmul double %5, %5
  %7 = fadd double %3, %6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv57
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = fadd double %7, %10
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.1, i64 %indvars.iv57
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %13
  %15 = fadd double %11, %14
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.2, i64 %indvars.iv57
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %17
  %19 = fadd double %15, %18
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.3, i64 %indvars.iv57
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %21
  %23 = fadd double %19, %22
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph
  %24 = tail call double @sqrt(double %23) #3
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv57
  store double %24, double* %25, align 8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 0, i64 %indvars.iv57
  %27 = load double, double* %26, align 8
  %28 = fdiv double %27, %24
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv57
  store double %28, double* %29, align 8
  br label %._crit_edge34

.preheader7:                                      ; preds = %._crit_edge34
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %30 = icmp slt i64 %indvars.iv.next58, 1200
  br i1 %30, label %.lr.ph17.split.us.preheader, label %._crit_edge28

.lr.ph17.split.us.preheader:                      ; preds = %.preheader7
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv57
  br label %.lr.ph17.split.us

.lr.ph17.split.us:                                ; preds = %.loopexit.us, %.lr.ph17.split.us.preheader
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %.loopexit.us ], [ %indvars.iv53, %.lr.ph17.split.us.preheader ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv55
  store double 0.000000e+00, double* %32, align 8
  br label %39

.loopexit.us:                                     ; preds = %._crit_edge32
  %indvars.iv.next56 = add nsw i64 %indvars.iv55, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next56, 1200
  br i1 %exitcond2, label %._crit_edge18, label %.lr.ph17.split.us

._crit_edge32:                                    ; preds = %._crit_edge32.1, %.lr.ph16.us.preheader
  %indvars.iv4965 = phi i64 [ 0, %.lr.ph16.us.preheader ], [ %indvars.iv.next50.1, %._crit_edge32.1 ]
  %indvars.iv.next50 = or i64 %indvars.iv4965, 1
  %.pre60 = load double, double* %32, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next50, i64 %indvars.iv55
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next50, i64 %indvars.iv57
  %36 = load double, double* %35, align 8
  %37 = fmul double %36, %.pre60
  %38 = fsub double %34, %37
  store double %38, double* %33, align 8
  %exitcond52 = icmp eq i64 %indvars.iv.next50, 999
  br i1 %exitcond52, label %.loopexit.us, label %._crit_edge32.1

; <label>:39:                                     ; preds = %39, %.lr.ph17.split.us
  %40 = phi double [ 0.000000e+00, %.lr.ph17.split.us ], [ %52, %39 ]
  %indvars.iv45 = phi i64 [ 0, %.lr.ph17.split.us ], [ %indvars.iv.next46.1, %39 ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv57
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv55
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %40, %45
  store double %46, double* %32, align 8
  %indvars.iv.next46 = or i64 %indvars.iv45, 1
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next46, i64 %indvars.iv57
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next46, i64 %indvars.iv55
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fadd double %46, %51
  store double %52, double* %32, align 8
  %exitcond48.1 = icmp eq i64 %indvars.iv.next46, 999
  %indvars.iv.next46.1 = add nsw i64 %indvars.iv45, 2
  br i1 %exitcond48.1, label %.lr.ph16.us.preheader, label %39

.lr.ph16.us.preheader:                            ; preds = %39
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 0, i64 %indvars.iv55
  %54 = load double, double* %53, align 8
  %55 = load double, double* %31, align 8
  %56 = fmul double %55, %52
  %57 = fsub double %54, %56
  store double %57, double* %53, align 8
  br label %._crit_edge32

._crit_edge34:                                    ; preds = %._crit_edge34.1, %._crit_edge
  %indvars.iv3564 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next36.1, %._crit_edge34.1 ]
  %indvars.iv.next36 = or i64 %indvars.iv3564, 1
  %.pre = load double, double* %25, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next36, i64 %indvars.iv57
  %59 = load double, double* %58, align 8
  %60 = fdiv double %59, %.pre
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next36, i64 %indvars.iv57
  store double %60, double* %61, align 8
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 999
  br i1 %exitcond38, label %.preheader7, label %._crit_edge34.1

._crit_edge18:                                    ; preds = %.loopexit.us
  %62 = icmp slt i64 %indvars.iv.next58, 1200
  br i1 %62, label %._crit_edge18..preheader8_crit_edge, label %._crit_edge28

._crit_edge18..preheader8_crit_edge:              ; preds = %._crit_edge18
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  br label %.preheader8

._crit_edge28:                                    ; preds = %.preheader7, %._crit_edge18
  ret void

._crit_edge34.1:                                  ; preds = %._crit_edge34
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv3564, 2
  %.pre.1 = load double, double* %25, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next36.1, i64 %indvars.iv57
  %64 = load double, double* %63, align 8
  %65 = fdiv double %64, %.pre.1
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next36.1, i64 %indvars.iv57
  store double %65, double* %66, align 8
  br label %._crit_edge34

._crit_edge32.1:                                  ; preds = %._crit_edge32
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv4965, 2
  %.pre60.1 = load double, double* %32, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next50.1, i64 %indvars.iv55
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next50.1, i64 %indvars.iv57
  %70 = load double, double* %69, align 8
  %71 = fmul double %70, %.pre60.1
  %72 = fsub double %68, %71
  store double %72, double* %67, align 8
  br label %._crit_edge32
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*, [1200 x double]*) #0 {
.preheader4.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge3.us, %.preheader4.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next14, %._crit_edge3.us ]
  %6 = mul nuw nsw i64 %indvars.iv13, 1200
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge, %.preheader4.us
  %indvars.iv11 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next12, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv11, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv11
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond2, label %._crit_edge3.us, label %._crit_edge6

._crit_edge3.us:                                  ; preds = %._crit_edge
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond3, label %._crit_edge4, label %.preheader4.us

._crit_edge4:                                     ; preds = %._crit_edge3.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge4
  %indvars.iv9 = phi i64 [ 0, %._crit_edge4 ], [ %indvars.iv.next10, %._crit_edge.us ]
  %21 = mul nuw nsw i64 %indvars.iv9, 1200
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge7, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge7 ]
  %22 = add nuw nsw i64 %indvars.iv, %21
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 20
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %._crit_edge7

; <label>:26:                                     ; preds = %._crit_edge8
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %27) #5
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge8, %26
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %30 = load double, double* %29, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %30) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge8

._crit_edge.us:                                   ; preds = %._crit_edge7
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond1, label %._crit_edge1, label %.preheader.us

._crit_edge1:                                     ; preds = %._crit_edge.us
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %34) #5
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
