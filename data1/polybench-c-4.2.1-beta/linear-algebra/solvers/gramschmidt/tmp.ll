; ModuleID = 'B.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array([1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_gramschmidt([1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
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
  call fastcc void @print_array([1200 x double]* %15, [1200 x double]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %13, %10, %2
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %13, %3
  %indvars.iv57 = phi i64 [ 0, %3 ], [ %indvars.iv.next6, %13 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv36 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next4, %._crit_edge ]
  %4 = mul nuw nsw i64 %indvars.iv57, %indvars.iv36
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 1000
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.000000e+03
  %9 = fmul double %8, 1.000000e+02
  %10 = fadd double %9, 1.000000e+01
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv36
  store double %10, double* %11, align 8
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv57, i64 %indvars.iv36
  store double 0.000000e+00, double* %12, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond1, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond2, label %..._crit_edge8_crit_edge_crit_edge, label %.._crit_edge_crit_edge

..._crit_edge8_crit_edge_crit_edge:               ; preds = %13
  br label %.._crit_edge8_crit_edge

.._crit_edge8_crit_edge:                          ; preds = %middle.block, %..._crit_edge8_crit_edge_crit_edge
  %indvars.iv15 = phi i64 [ 0, %..._crit_edge8_crit_edge_crit_edge ], [ %indvars.iv.next2, %middle.block ]
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.._crit_edge8_crit_edge
  %index = phi i64 [ 0, %.._crit_edge8_crit_edge ], [ %index.next.5, %vector.body ]
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %index
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %15, align 8
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %17, align 8
  %index.next = or i64 %index, 4
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %index.next
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %21, align 8
  %index.next.1 = add nsw i64 %index, 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %index.next.1
  %23 = bitcast double* %22 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %23, align 8
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %25, align 8
  %index.next.2 = add nsw i64 %index, 12
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %index.next.2
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %27, align 8
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %29, align 8
  %index.next.3 = add nsw i64 %index, 16
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %index.next.3
  %31 = bitcast double* %30 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %31, align 8
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %33, align 8
  %index.next.4 = add nsw i64 %index, 20
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %index.next.4
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %35, align 8
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %37, align 8
  %index.next.5 = add nsw i64 %index, 24
  %38 = icmp eq i64 %index.next.5, 1200
  br i1 %38, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond, label %39, label %.._crit_edge8_crit_edge

; <label>:39:                                     ; preds = %middle.block
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %.loopexit._crit_edge, %3
  %indvars.iv = phi i64 [ 0, %3 ], [ %indvars.iv.next20, %.loopexit._crit_edge ]
  br label %4

; <label>:4:                                      ; preds = %4, %._crit_edge
  %5 = phi double [ 0.000000e+00, %._crit_edge ], [ %25, %4 ]
  %indvars.iv8 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.4, %4 ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %7 = load double, double* %6, align 8
  %8 = fmul double %7, %7
  %9 = fadd double %5, %8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv8, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %11
  %13 = fadd double %9, %12
  %indvars.iv.next.1 = add nsw i64 %indvars.iv8, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %15
  %17 = fadd double %13, %16
  %indvars.iv.next.2 = add nsw i64 %indvars.iv8, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.2, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %19
  %21 = fadd double %17, %20
  %indvars.iv.next.3 = add nsw i64 %indvars.iv8, 4
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.3, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %23
  %25 = fadd double %21, %24
  %indvars.iv.next.4 = add nsw i64 %indvars.iv8, 5
  %exitcond3.4 = icmp eq i64 %indvars.iv.next.4, 1000
  br i1 %exitcond3.4, label %26, label %4

; <label>:26:                                     ; preds = %4
  %27 = call double @sqrt(double %25) #4
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv
  store double %27, double* %28, align 8
  br label %29

; <label>:29:                                     ; preds = %29, %26
  %indvars.iv39 = phi i64 [ 0, %26 ], [ %indvars.iv.next4.1, %29 ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv
  %31 = load double, double* %30, align 8
  %32 = load double, double* %28, align 8
  %33 = fdiv double %31, %32
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv
  store double %33, double* %34, align 8
  %indvars.iv.next4 = or i64 %indvars.iv39, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next4, i64 %indvars.iv
  %36 = load double, double* %35, align 8
  %37 = load double, double* %28, align 8
  %38 = fdiv double %36, %37
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next4, i64 %indvars.iv
  store double %38, double* %39, align 8
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv39, 2
  %exitcond4.1 = icmp eq i64 %indvars.iv.next4.1, 1000
  br i1 %exitcond4.1, label %40, label %29

; <label>:40:                                     ; preds = %29
  %exitcond13 = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond13, label %.loopexit._crit_edge, label %..lr.ph_crit_edge

..lr.ph_crit_edge:                                ; preds = %40
  br label %.lr.ph

.lr.ph:                                           ; preds = %..loopexit_crit_edge, %..lr.ph_crit_edge
  %indvars.iv.next1014.in = phi i64 [ %indvars.iv, %..lr.ph_crit_edge ], [ %indvars.iv.next1014, %..loopexit_crit_edge ]
  %indvars.iv.next1014 = add nuw nsw i64 %indvars.iv.next1014.in, 1
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv.next1014
  store double 0.000000e+00, double* %41, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv.next1014
  br label %44

._crit_edge11:                                    ; preds = %44
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv.next1014
  br label %59

; <label>:44:                                     ; preds = %44, %.lr.ph
  %indvars.iv510 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next6.1, %44 ]
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv510, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv510, i64 %indvars.iv.next1014
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = load double, double* %42, align 8
  %51 = fadd double %50, %49
  store double %51, double* %42, align 8
  %indvars.iv.next6 = or i64 %indvars.iv510, 1
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next6, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next6, i64 %indvars.iv.next1014
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = load double, double* %42, align 8
  %58 = fadd double %57, %56
  store double %58, double* %42, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv510, 2
  %exitcond5.1 = icmp eq i64 %indvars.iv.next6.1, 1000
  br i1 %exitcond5.1, label %._crit_edge11, label %44

..loopexit_crit_edge:                             ; preds = %59
  %exitcond = icmp eq i64 %indvars.iv.next1014, 1199
  br i1 %exitcond, label %.loopexit._crit_edge.loopexit, label %.lr.ph

; <label>:59:                                     ; preds = %59, %._crit_edge11
  %indvars.iv711 = phi i64 [ 0, %._crit_edge11 ], [ %indvars.iv.next8.1, %59 ]
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv711, i64 %indvars.iv.next1014
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv711, i64 %indvars.iv
  %63 = load double, double* %62, align 8
  %64 = load double, double* %43, align 8
  %65 = fmul double %63, %64
  %66 = fsub double %61, %65
  store double %66, double* %60, align 8
  %indvars.iv.next8 = or i64 %indvars.iv711, 1
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next8, i64 %indvars.iv.next1014
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next8, i64 %indvars.iv
  %70 = load double, double* %69, align 8
  %71 = load double, double* %43, align 8
  %72 = fmul double %70, %71
  %73 = fsub double %68, %72
  store double %73, double* %67, align 8
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv711, 2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next8.1, 1000
  br i1 %exitcond6.1, label %..loopexit_crit_edge, label %59

.loopexit._crit_edge.loopexit:                    ; preds = %..loopexit_crit_edge
  br label %.loopexit._crit_edge

.loopexit._crit_edge:                             ; preds = %.loopexit._crit_edge.loopexit, %40
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv, 1
  %74 = icmp slt i64 %indvars.iv.next20, 1200
  br i1 %74, label %._crit_edge, label %75

; <label>:75:                                     ; preds = %.loopexit._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %19, %2
  %indvars.iv96 = phi i64 [ 0, %2 ], [ %indvars.iv.next10, %19 ]
  %7 = mul nuw nsw i64 %indvars.iv96, 1200
  br label %8

; <label>:8:                                      ; preds = %._crit_edge4, %._crit_edge
  %indvars.iv75 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next8, %._crit_edge4 ]
  %9 = add nuw nsw i64 %7, %indvars.iv75
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge4

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %13, %8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv96, i64 %indvars.iv75
  %17 = load double, double* %16, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond11, label %19, label %8

; <label>:19:                                     ; preds = %._crit_edge4
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv96, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next10, 1200
  br i1 %exitcond2, label %20, label %._crit_edge

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %37, %20
  %indvars.iv54 = phi i64 [ 0, %20 ], [ %indvars.iv.next6, %37 ]
  %25 = mul nuw nsw i64 %indvars.iv54, 1200
  br label %26

; <label>:26:                                     ; preds = %._crit_edge5, %._crit_edge2
  %indvars.iv3 = phi i64 [ 0, %._crit_edge2 ], [ %indvars.iv.next, %._crit_edge5 ]
  %27 = add nuw nsw i64 %25, %indvars.iv3
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 20
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %._crit_edge5

; <label>:31:                                     ; preds = %26
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %32) #5
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %31, %26
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv3
  %35 = load double, double* %34, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %35) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %37, label %26

; <label>:37:                                     ; preds = %._crit_edge5
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond1, label %38, label %._crit_edge2

; <label>:38:                                     ; preds = %37
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #5
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %41) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
