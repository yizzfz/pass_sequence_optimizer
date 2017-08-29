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

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  %15 = bitcast i8* %4 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %15, [1200 x double]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %13, %3
  %indvars.iv38 = phi i64 [ 0, %3 ], [ %indvars.iv.next39, %13 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv35 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next36, %._crit_edge ]
  %4 = mul nuw nsw i64 %indvars.iv35, %indvars.iv38
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 1000
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.000000e+03
  %9 = fmul double %8, 1.000000e+02
  %10 = fadd double %9, 1.000000e+01
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv35
  store double %10, double* %11, align 8
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv35
  store double 0.000000e+00, double* %12, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next36, 1200
  br i1 %exitcond37, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next39, 1000
  br i1 %exitcond40, label %14, label %._crit_edge.preheader

; <label>:14:                                     ; preds = %13
  %15 = bitcast [1200 x double]* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %15, i8 0, i64 11520000, i32 8, i1 false)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* nocapture, [1200 x double]*, [1200 x double]* nocapture) unnamed_addr #0 {
  br label %._crit_edge.preheader

.loopexit.loopexit:                               ; preds = %71
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %39
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next100, 1200
  br i1 %exitcond101, label %72, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %.loopexit, %3
  %indvars.iv99 = phi i64 [ 0, %3 ], [ %indvars.iv.next100, %.loopexit ]
  %indvars.iv94 = phi i64 [ 1, %3 ], [ %indvars.iv.next95, %.loopexit ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next.4, %._crit_edge ]
  %.078 = phi double [ 0.000000e+00, %._crit_edge.preheader ], [ %23, %._crit_edge ]
  %4 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv, i64 %indvars.iv99
  %5 = load double, double* %4, align 8
  %6 = fmul double %5, %5
  %7 = fadd double %.078, %6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv99
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = fadd double %7, %10
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.1, i64 %indvars.iv99
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %13
  %15 = fadd double %11, %14
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.2, i64 %indvars.iv99
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %17
  %19 = fadd double %15, %18
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.3, i64 %indvars.iv99
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %21
  %23 = fadd double %19, %22
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1000
  br i1 %exitcond.4, label %24, label %._crit_edge

; <label>:24:                                     ; preds = %._crit_edge
  %25 = tail call double @sqrt(double %23) #4
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv99
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv99
  store double %25, double* %27, align 8
  br label %28

; <label>:28:                                     ; preds = %28, %24
  %indvars.iv85 = phi i64 [ 0, %24 ], [ %indvars.iv.next86.1, %28 ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv85, i64 %indvars.iv99
  %30 = load double, double* %29, align 8
  %sunkaddr1 = ptrtoint [1200 x double]* %26 to i64
  %sunkaddr2 = mul i64 %indvars.iv99, 8
  %sunkaddr3 = add i64 %sunkaddr1, %sunkaddr2
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to double*
  %31 = load double, double* %sunkaddr4, align 8
  %32 = fdiv double %30, %31
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv85, i64 %indvars.iv99
  store double %32, double* %33, align 8
  %indvars.iv.next86 = or i64 %indvars.iv85, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next86, i64 %indvars.iv99
  %35 = load double, double* %34, align 8
  %36 = load double, double* %sunkaddr4, align 8
  %37 = fdiv double %35, %36
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next86, i64 %indvars.iv99
  store double %37, double* %38, align 8
  %indvars.iv.next86.1 = add nuw nsw i64 %indvars.iv85, 2
  %exitcond87.1 = icmp eq i64 %indvars.iv.next86.1, 1000
  br i1 %exitcond87.1, label %39, label %28

; <label>:39:                                     ; preds = %28
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %40 = icmp slt i64 %indvars.iv.next100, 1200
  br i1 %40, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %39
  br label %41

; <label>:41:                                     ; preds = %71, %.lr.ph
  %indvars.iv96 = phi i64 [ %indvars.iv94, %.lr.ph ], [ %indvars.iv.next97, %71 ]
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv96
  store double 0.000000e+00, double* %42, align 8
  br label %43

._crit_edge65.preheader:                          ; preds = %43
  br label %._crit_edge65

; <label>:43:                                     ; preds = %43, %41
  %indvars.iv88 = phi i64 [ 0, %41 ], [ %indvars.iv.next89.1, %43 ]
  %44 = phi double [ 0.000000e+00, %41 ], [ %56, %43 ]
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv88, i64 %indvars.iv99
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv88, i64 %indvars.iv96
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fadd double %44, %49
  %sunkaddr = ptrtoint [1200 x double]* %26 to i64
  %sunkaddr5 = mul i64 %indvars.iv96, 8
  %sunkaddr6 = add i64 %sunkaddr, %sunkaddr5
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to double*
  store double %50, double* %sunkaddr7, align 8
  %indvars.iv.next89 = or i64 %indvars.iv88, 1
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next89, i64 %indvars.iv99
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next89, i64 %indvars.iv96
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %50, %55
  store double %56, double* %sunkaddr7, align 8
  %indvars.iv.next89.1 = add nuw nsw i64 %indvars.iv88, 2
  %exitcond90.1 = icmp eq i64 %indvars.iv.next89.1, 1000
  br i1 %exitcond90.1, label %._crit_edge65.preheader, label %43

._crit_edge65:                                    ; preds = %._crit_edge65, %._crit_edge65.preheader
  %indvars.iv91 = phi i64 [ 0, %._crit_edge65.preheader ], [ %indvars.iv.next92.1, %._crit_edge65 ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv96
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv91, i64 %indvars.iv99
  %60 = load double, double* %59, align 8
  %sunkaddr8 = ptrtoint [1200 x double]* %26 to i64
  %sunkaddr9 = mul i64 %indvars.iv96, 8
  %sunkaddr10 = add i64 %sunkaddr8, %sunkaddr9
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to double*
  %61 = load double, double* %sunkaddr11, align 8
  %62 = fmul double %60, %61
  %63 = fsub double %58, %62
  store double %63, double* %57, align 8
  %indvars.iv.next92 = or i64 %indvars.iv91, 1
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next92, i64 %indvars.iv96
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next92, i64 %indvars.iv99
  %67 = load double, double* %66, align 8
  %68 = load double, double* %sunkaddr11, align 8
  %69 = fmul double %67, %68
  %70 = fsub double %65, %69
  store double %70, double* %64, align 8
  %indvars.iv.next92.1 = add nuw nsw i64 %indvars.iv91, 2
  %exitcond93.1 = icmp eq i64 %indvars.iv.next92.1, 1000
  br i1 %exitcond93.1, label %71, label %._crit_edge65

; <label>:71:                                     ; preds = %._crit_edge65
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next97, 1200
  br i1 %exitcond98, label %.loopexit.loopexit, label %41

; <label>:72:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %19, %2
  %indvars.iv17 = phi i64 [ 0, %2 ], [ %indvars.iv.next18, %19 ]
  %7 = mul nuw nsw i64 %indvars.iv17, 1200
  br label %8

; <label>:8:                                      ; preds = %._crit_edge1, %._crit_edge.preheader
  %indvars.iv14 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next15, %._crit_edge1 ]
  %9 = add nuw nsw i64 %indvars.iv14, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge1

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc10 = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv14
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #7
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond16, label %19, label %8

; <label>:19:                                     ; preds = %._crit_edge1
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 1200
  br i1 %exitcond19, label %20, label %._crit_edge.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %._crit_edge2.preheader

._crit_edge2.preheader:                           ; preds = %37, %20
  %indvars.iv11 = phi i64 [ 0, %20 ], [ %indvars.iv.next12, %37 ]
  %25 = mul nuw nsw i64 %indvars.iv11, 1200
  br label %26

; <label>:26:                                     ; preds = %._crit_edge3, %._crit_edge2.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge2.preheader ], [ %indvars.iv.next, %._crit_edge3 ]
  %27 = add nuw nsw i64 %indvars.iv, %25
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 20
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %._crit_edge3

; <label>:31:                                     ; preds = %26
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %32) #6
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %26, %31
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %35 = load double, double* %34, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %35) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %37, label %26

; <label>:37:                                     ; preds = %._crit_edge3
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond13, label %38, label %._crit_edge2.preheader

; <label>:38:                                     ; preds = %37
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %41) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
