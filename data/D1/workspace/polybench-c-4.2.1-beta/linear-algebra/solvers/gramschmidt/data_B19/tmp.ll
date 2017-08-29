; ModuleID = 'A.ll'
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
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @init_array([1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt([1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge19

._crit_edge19:                                    ; preds = %10
  br label %14

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array([1200 x double]* %7, [1200 x double]* %8)
  br label %14

; <label>:14:                                     ; preds = %._crit_edge19, %._crit_edge, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader27

.preheader27:                                     ; preds = %..preheader27_crit_edge, %3
  %indvars.iv38 = phi i64 [ 0, %3 ], [ %indvars.iv.next39, %..preheader27_crit_edge ]
  br label %4

; <label>:4:                                      ; preds = %._crit_edge, %.preheader27
  %indvars.iv35 = phi i64 [ 0, %.preheader27 ], [ %indvars.iv.next36, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv35, %indvars.iv38
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 1000
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.000000e+03
  %10 = fmul double %9, 1.000000e+02
  %11 = fadd double %10, 1.000000e+01
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv35
  store double %11, double* %12, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv35
  store double 0.000000e+00, double* %13, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next36, 1200
  br i1 %exitcond37, label %14, label %._crit_edge

._crit_edge:                                      ; preds = %4
  br label %4

; <label>:14:                                     ; preds = %4
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next39, 1000
  br i1 %exitcond40, label %15, label %..preheader27_crit_edge

..preheader27_crit_edge:                          ; preds = %14
  br label %.preheader27

; <label>:15:                                     ; preds = %14
  %16 = bitcast [1200 x double]* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %16, i8 0, i64 11520000, i32 8, i1 false)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  br label %.preheader65

.loopexit.loopexit:                               ; preds = %70
  br label %.loopexit

.loopexit:                                        ; preds = %..loopexit_crit_edge, %.loopexit.loopexit
  %exitcond89 = icmp eq i64 %indvars.iv.next88, 1200
  br i1 %exitcond89, label %71, label %.loopexit..preheader65_crit_edge

.loopexit..preheader65_crit_edge:                 ; preds = %.loopexit
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  br label %.preheader65

.preheader65:                                     ; preds = %.loopexit..preheader65_crit_edge, %3
  %indvars.iv87 = phi i64 [ 0, %3 ], [ %indvars.iv.next88, %.loopexit..preheader65_crit_edge ]
  %indvars.iv82 = phi i64 [ 1, %3 ], [ %indvars.iv.next83, %.loopexit..preheader65_crit_edge ]
  br label %4

; <label>:4:                                      ; preds = %._crit_edge3, %.preheader65
  %indvars.iv = phi i64 [ 0, %.preheader65 ], [ %indvars.iv.next.4, %._crit_edge3 ]
  %.067 = phi double [ 0.000000e+00, %.preheader65 ], [ %24, %._crit_edge3 ]
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv, i64 %indvars.iv87
  %6 = load double, double* %5, align 8
  %7 = fmul double %6, %6
  %8 = fadd double %.067, %7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv87
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fadd double %8, %11
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.1, i64 %indvars.iv87
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %14
  %16 = fadd double %12, %15
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.2, i64 %indvars.iv87
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %18
  %20 = fadd double %16, %19
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.3, i64 %indvars.iv87
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %22
  %24 = fadd double %20, %23
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1000
  br i1 %exitcond.4, label %25, label %._crit_edge3

._crit_edge3:                                     ; preds = %4
  br label %4

; <label>:25:                                     ; preds = %4
  %26 = tail call double @sqrt(double %24) #4
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv87, i64 %indvars.iv87
  store double %26, double* %27, align 8
  br label %28

; <label>:28:                                     ; preds = %._crit_edge, %25
  %29 = phi double [ %26, %25 ], [ %.pre, %._crit_edge ]
  %indvars.iv73 = phi i64 [ 0, %25 ], [ %indvars.iv.next74.1, %._crit_edge ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv73, i64 %indvars.iv87
  %31 = load double, double* %30, align 8
  %32 = fdiv double %31, %29
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv73, i64 %indvars.iv87
  store double %32, double* %33, align 8
  %indvars.iv.next74 = or i64 %indvars.iv73, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next74, i64 %indvars.iv87
  %35 = load double, double* %34, align 8
  %36 = load double, double* %27, align 8
  %37 = fdiv double %35, %36
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next74, i64 %indvars.iv87
  store double %37, double* %38, align 8
  %indvars.iv.next74.1 = add nuw nsw i64 %indvars.iv73, 2
  %exitcond75.1 = icmp eq i64 %indvars.iv.next74.1, 1000
  br i1 %exitcond75.1, label %39, label %._crit_edge

._crit_edge:                                      ; preds = %28
  %.pre = load double, double* %27, align 8
  br label %28

; <label>:39:                                     ; preds = %28
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %40 = icmp slt i64 %indvars.iv.next88, 1200
  br i1 %40, label %.lr.ph.preheader, label %..loopexit_crit_edge

..loopexit_crit_edge:                             ; preds = %39
  br label %.loopexit

.lr.ph.preheader:                                 ; preds = %39
  br label %.lr.ph

.lr.ph:                                           ; preds = %..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %..lr.ph_crit_edge ], [ %indvars.iv82, %.lr.ph.preheader ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv87, i64 %indvars.iv84
  store double 0.000000e+00, double* %41, align 8
  br label %42

; <label>:42:                                     ; preds = %._crit_edge4, %.lr.ph
  %indvars.iv76 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next77.1, %._crit_edge4 ]
  %43 = phi double [ 0.000000e+00, %.lr.ph ], [ %55, %._crit_edge4 ]
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv76, i64 %indvars.iv87
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv76, i64 %indvars.iv84
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fadd double %43, %48
  store double %49, double* %41, align 8
  %indvars.iv.next77 = or i64 %indvars.iv76, 1
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next77, i64 %indvars.iv87
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next77, i64 %indvars.iv84
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fadd double %49, %54
  store double %55, double* %41, align 8
  %indvars.iv.next77.1 = add nuw nsw i64 %indvars.iv76, 2
  %exitcond78.1 = icmp eq i64 %indvars.iv.next77.1, 1000
  br i1 %exitcond78.1, label %.preheader.preheader, label %._crit_edge4

._crit_edge4:                                     ; preds = %42
  br label %42

.preheader.preheader:                             ; preds = %42
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader..preheader_crit_edge
  %56 = phi double [ %.pre91, %.preheader..preheader_crit_edge ], [ %55, %.preheader.preheader ]
  %indvars.iv79 = phi i64 [ %indvars.iv.next80.1, %.preheader..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv79, i64 %indvars.iv84
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv79, i64 %indvars.iv87
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, %56
  %62 = fsub double %58, %61
  store double %62, double* %57, align 8
  %indvars.iv.next80 = or i64 %indvars.iv79, 1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next80, i64 %indvars.iv84
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next80, i64 %indvars.iv87
  %66 = load double, double* %65, align 8
  %67 = load double, double* %41, align 8
  %68 = fmul double %66, %67
  %69 = fsub double %64, %68
  store double %69, double* %63, align 8
  %indvars.iv.next80.1 = add nuw nsw i64 %indvars.iv79, 2
  %exitcond81.1 = icmp eq i64 %indvars.iv.next80.1, 1000
  br i1 %exitcond81.1, label %70, label %.preheader..preheader_crit_edge

.preheader..preheader_crit_edge:                  ; preds = %.preheader
  %.pre91 = load double, double* %41, align 8
  br label %.preheader

; <label>:70:                                     ; preds = %.preheader
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next85, 1200
  br i1 %exitcond86, label %.loopexit.loopexit, label %..lr.ph_crit_edge

..lr.ph_crit_edge:                                ; preds = %70
  br label %.lr.ph

; <label>:71:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader4

.preheader4:                                      ; preds = %..preheader4_crit_edge, %2
  %indvars.iv15 = phi i64 [ 0, %2 ], [ %indvars.iv.next16, %..preheader4_crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv15, 1200
  br label %8

; <label>:8:                                      ; preds = %._crit_edge1, %.preheader4
  %indvars.iv12 = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next13, %._crit_edge1 ]
  %9 = add nuw nsw i64 %indvars.iv12, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

._crit_edge:                                      ; preds = %8
  br label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %15

; <label>:15:                                     ; preds = %._crit_edge, %13
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv12
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1200
  br i1 %exitcond14, label %20, label %._crit_edge1

._crit_edge1:                                     ; preds = %15
  br label %8

; <label>:20:                                     ; preds = %15
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond17, label %21, label %..preheader4_crit_edge

..preheader4_crit_edge:                           ; preds = %20
  br label %.preheader4

; <label>:21:                                     ; preds = %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %21
  %indvars.iv9 = phi i64 [ 0, %21 ], [ %indvars.iv.next10, %..preheader_crit_edge ]
  %26 = mul nuw nsw i64 %indvars.iv9, 1200
  br label %27

; <label>:27:                                     ; preds = %._crit_edge3, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge3 ]
  %28 = add nuw nsw i64 %indvars.iv, %26
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %._crit_edge2

._crit_edge2:                                     ; preds = %27
  br label %34

; <label>:32:                                     ; preds = %27
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #6
  br label %34

; <label>:34:                                     ; preds = %._crit_edge2, %32
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %39, label %._crit_edge3

._crit_edge3:                                     ; preds = %34
  br label %27

; <label>:39:                                     ; preds = %34
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond11, label %40, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %39
  br label %.preheader

; <label>:40:                                     ; preds = %39
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %43) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
