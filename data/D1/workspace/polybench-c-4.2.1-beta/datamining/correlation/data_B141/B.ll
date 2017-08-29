; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array([1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %20, %2
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %20 ], [ 0, %2 ]
  %3 = trunc i64 %indvars.iv3 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv3
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv3
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = fadd <2 x double> %6, %17
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 1400
  br i1 %exitcond, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph54.split.us.preheader:
  %5 = alloca double, align 8
  %6 = alloca [1200 x double]*, align 8
  %7 = alloca [1200 x double]*, align 8
  %8 = alloca double*, align 8
  store double %0, double* %5, align 8
  store [1200 x double]* %1, [1200 x double]** %6, align 8
  store [1200 x double]* %2, [1200 x double]** %7, align 8
  store double* %4, double** %8, align 8
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph54.split.us

.lr.ph54.split.us:                                ; preds = %._crit_edge51.us, %.lr.ph54.split.us.preheader
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge51.us ], [ 0, %.lr.ph54.split.us.preheader ]
  %9 = getelementptr inbounds double, double* %3, i64 %indvars.iv16
  store double 0.000000e+00, double* %9, align 8
  %sunkaddr125 = shl nsw i64 %indvars.iv16, 3
  %sunkaddr126 = add i64 %sunkaddr, %sunkaddr125
  %sunkaddr127 = inttoptr i64 %sunkaddr126 to double*
  br label %10

; <label>:10:                                     ; preds = %10, %.lr.ph54.split.us
  %indvars.iv107 = phi i64 [ 0, %.lr.ph54.split.us ], [ %indvars.iv.next108.1.1, %10 ]
  %11 = phi double [ 0.000000e+00, %.lr.ph54.split.us ], [ %23, %10 ]
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv16
  %13 = load double, double* %12, align 8
  %14 = fadd double %11, %13
  store double %14, double* %sunkaddr127, align 8
  %indvars.iv.next108 = or i64 %indvars.iv107, 1
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next108, i64 %indvars.iv16
  %16 = load double, double* %15, align 8
  %17 = fadd double %14, %16
  store double %17, double* %sunkaddr127, align 8
  %indvars.iv.next108.1 = or i64 %indvars.iv107, 2
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next108.1, i64 %indvars.iv16
  %19 = load double, double* %18, align 8
  %20 = fadd double %17, %19
  store double %20, double* %sunkaddr127, align 8
  %indvars.iv.next108.127 = or i64 %indvars.iv107, 3
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next108.127, i64 %indvars.iv16
  %22 = load double, double* %21, align 8
  %23 = fadd double %20, %22
  store double %23, double* %sunkaddr127, align 8
  %indvars.iv.next108.1.1 = add nsw i64 %indvars.iv107, 4
  %exitcond109.1.1 = icmp eq i64 %indvars.iv.next108.1.1, 1400
  br i1 %exitcond109.1.1, label %._crit_edge51.us, label %10

._crit_edge51.us:                                 ; preds = %10
  %24 = fdiv double %23, %0
  store double %24, double* %sunkaddr127, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond18, label %.lr.ph48.split.us.preheader, label %.lr.ph54.split.us

.lr.ph48.split.us.preheader:                      ; preds = %._crit_edge51.us
  %sunkaddr136 = ptrtoint double* %4 to i64
  br label %.lr.ph48.split.us

.lr.ph48.split.us:                                ; preds = %._crit_edge46.us, %.lr.ph48.split.us.preheader
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge46.us ], [ 0, %.lr.ph48.split.us.preheader ]
  %25 = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  store double 0.000000e+00, double* %25, align 8
  %sunkaddr133 = shl nsw i64 %indvars.iv13, 3
  %sunkaddr134 = add i64 %sunkaddr, %sunkaddr133
  %sunkaddr135 = inttoptr i64 %sunkaddr134 to double*
  %sunkaddr138 = add i64 %sunkaddr136, %sunkaddr133
  %sunkaddr139 = inttoptr i64 %sunkaddr138 to double*
  br label %26

; <label>:26:                                     ; preds = %26, %.lr.ph48.split.us
  %indvars.iv101 = phi i64 [ 0, %.lr.ph48.split.us ], [ %indvars.iv.next102.1, %26 ]
  %27 = phi double [ 0.000000e+00, %.lr.ph48.split.us ], [ %39, %26 ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv101, i64 %indvars.iv13
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr135, align 8
  %31 = fsub double %29, %30
  %32 = fmul double %31, %31
  %33 = fadd double %27, %32
  store double %33, double* %sunkaddr139, align 8
  %indvars.iv.next102 = or i64 %indvars.iv101, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next102, i64 %indvars.iv13
  %35 = load double, double* %34, align 8
  %36 = load double, double* %sunkaddr135, align 8
  %37 = fsub double %35, %36
  %38 = fmul double %37, %37
  %39 = fadd double %33, %38
  store double %39, double* %sunkaddr139, align 8
  %indvars.iv.next102.1 = add nuw nsw i64 %indvars.iv101, 2
  %exitcond103.1 = icmp eq i64 %indvars.iv.next102.1, 1400
  br i1 %exitcond103.1, label %._crit_edge46.us, label %26

._crit_edge46.us:                                 ; preds = %26
  %40 = fdiv double %39, %0
  store double %40, double* %sunkaddr139, align 8
  %41 = tail call double @sqrt(double %40) #4
  %42 = fcmp ugt double %41, 1.000000e-01
  %..us = select i1 %42, double %41, double 1.000000e+00
  store double %..us, double* %sunkaddr139, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond15, label %._crit_edge10.us.preheader, label %.lr.ph48.split.us

._crit_edge10.us.preheader:                       ; preds = %._crit_edge46.us
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge41.us, %._crit_edge10.us.preheader
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge41.us ], [ 0, %._crit_edge10.us.preheader ]
  %43 = phi [1200 x double]* [ %57, %._crit_edge41.us ], [ %1, %._crit_edge10.us.preheader ]
  br label %44

; <label>:44:                                     ; preds = %44, %._crit_edge10.us
  %indvars.iv97 = phi i64 [ 0, %._crit_edge10.us ], [ %indvars.iv.next98, %44 ]
  %45 = phi [1200 x double]* [ %43, %._crit_edge10.us ], [ %57, %44 ]
  %46 = getelementptr inbounds double, double* %3, i64 %indvars.iv97
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %45, i64 %indvars.iv10, i64 %indvars.iv97
  %49 = load double, double* %48, align 8
  %50 = fsub double %49, %47
  store double %50, double* %48, align 8
  %51 = load double, double* %5, align 8
  %52 = tail call double @sqrt(double %51) #4
  %53 = load double*, double** %8, align 8
  %54 = getelementptr inbounds double, double* %53, i64 %indvars.iv97
  %55 = load double, double* %54, align 8
  %56 = fmul double %52, %55
  %57 = load [1200 x double]*, [1200 x double]** %6, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %57, i64 %indvars.iv10, i64 %indvars.iv97
  %59 = load double, double* %58, align 8
  %60 = fdiv double %59, %56
  store double %60, double* %58, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next98, 1200
  br i1 %exitcond99, label %._crit_edge41.us, label %44

._crit_edge41.us:                                 ; preds = %44
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1400
  br i1 %exitcond12, label %.lr.ph.us.us.preheader.preheader, label %._crit_edge10.us

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge41.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge28.us-lcssa.us.us
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge28.us-lcssa.us.us ], [ 1, %.lr.ph.us.us.preheader.preheader ]
  %indvars.iv148 = phi i64 [ %indvars.iv.next149, %._crit_edge28.us-lcssa.us.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %61 = phi [1200 x double]* [ %66, %._crit_edge28.us-lcssa.us.us ], [ %2, %.lr.ph.us.us.preheader.preheader ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %61, i64 %indvars.iv148, i64 %indvars.iv148
  store double 1.000000e+00, double* %62, align 8
  br label %.lr.ph.us.us

._crit_edge28.us-lcssa.us.us:                     ; preds = %._crit_edge23.us.us
  %indvars.iv.next149 = add nuw nsw i64 %indvars.iv148, 1
  %exitcond = icmp eq i64 %indvars.iv.next149, 1199
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  br i1 %exitcond, label %._crit_edge30, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge23.us.us, %.lr.ph.us.us.preheader
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge23.us.us ], [ %indvars.iv5, %.lr.ph.us.us.preheader ]
  %63 = phi [1200 x double]* [ %66, %._crit_edge23.us.us ], [ %61, %.lr.ph.us.us.preheader ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %63, i64 %indvars.iv148, i64 %indvars.iv7
  store double 0.000000e+00, double* %64, align 8
  %65 = load [1200 x double]*, [1200 x double]** %6, align 8
  %66 = load [1200 x double]*, [1200 x double]** %7, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %indvars.iv148, i64 %indvars.iv7
  %.pre = load double, double* %67, align 8
  br label %69

._crit_edge23.us.us:                              ; preds = %69
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %indvars.iv7, i64 %indvars.iv148
  store double %82, double* %68, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond9, label %._crit_edge28.us-lcssa.us.us, label %.lr.ph.us.us

; <label>:69:                                     ; preds = %69, %.lr.ph.us.us
  %70 = phi double [ %.pre, %.lr.ph.us.us ], [ %82, %69 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %69 ]
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %65, i64 %indvars.iv, i64 %indvars.iv148
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %65, i64 %indvars.iv, i64 %indvars.iv7
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = fadd double %75, %70
  store double %76, double* %67, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %65, i64 %indvars.iv.next, i64 %indvars.iv148
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %65, i64 %indvars.iv.next, i64 %indvars.iv7
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %81, %76
  store double %82, double* %67, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge23.us.us, label %69

._crit_edge30:                                    ; preds = %._crit_edge28.us-lcssa.us.us
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 1199, i64 1199
  store double 1.000000e+00, double* %83, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge2.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge3.us, %._crit_edge2.us.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge3.us ], [ 0, %._crit_edge2.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv1, 1200
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us, %._crit_edge2.us
  %indvars.iv = phi i64 [ 0, %._crit_edge2.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %7 = add nuw nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge3.us, label %6

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %._crit_edge5, label %._crit_edge2.us

._crit_edge5:                                     ; preds = %._crit_edge3.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
