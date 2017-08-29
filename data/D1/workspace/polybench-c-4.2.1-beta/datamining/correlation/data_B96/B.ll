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
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  call fastcc void @kernel_correlation(double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array([1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %18 ], [ 0, %2 ]
  %3 = trunc i64 %indvars.iv3 to i32
  %4 = sitofp i32 %3 to double
  br label %5

; <label>:5:                                      ; preds = %5, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv, %indvars.iv3
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.200000e+03
  %10 = fadd double %4, %9
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv
  store double %10, double* %11, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv3
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.200000e+03
  %16 = fadd double %4, %15
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv.next
  store double %16, double* %17, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1199
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %18, label %5

; <label>:18:                                     ; preds = %5
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1400
  br i1 %exitcond5, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph55:
  %5 = alloca double, align 8
  %6 = alloca [1200 x double]*, align 8
  %7 = alloca [1200 x double]*, align 8
  %8 = alloca double*, align 8
  store double %0, double* %5, align 8
  store [1200 x double]* %1, [1200 x double]** %6, align 8
  store [1200 x double]* %2, [1200 x double]** %7, align 8
  store double* %4, double** %8, align 8
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr.1 = ptrtoint double* %3 to i64
  br label %.lr.ph55.split.us

.lr.ph55.split.us:                                ; preds = %._crit_edge52.us, %.lr.ph55
  %indvars.iv156 = phi i64 [ %indvars.iv.next157, %._crit_edge52.us ], [ 0, %.lr.ph55 ]
  %9 = getelementptr inbounds double, double* %3, i64 %indvars.iv156
  store double 0.000000e+00, double* %9, align 8
  %sunkaddr160 = shl i64 %indvars.iv156, 3
  %sunkaddr161 = add i64 %sunkaddr, %sunkaddr160
  %sunkaddr162 = inttoptr i64 %sunkaddr161 to double*
  %sunkaddr160.1 = shl i64 %indvars.iv156, 3
  %sunkaddr161.1 = add i64 %sunkaddr.1, %sunkaddr160.1
  %sunkaddr162.1 = inttoptr i64 %sunkaddr161.1 to double*
  br label %10

; <label>:10:                                     ; preds = %10, %.lr.ph55.split.us
  %indvars.iv118 = phi i64 [ 0, %.lr.ph55.split.us ], [ %indvars.iv.next119.1, %10 ]
  %11 = phi double [ 0.000000e+00, %.lr.ph55.split.us ], [ %17, %10 ]
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv118, i64 %indvars.iv156
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %sunkaddr162, align 8
  %indvars.iv.next119 = or i64 %indvars.iv118, 1
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next119, i64 %indvars.iv156
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %sunkaddr162.1, align 8
  %exitcond121.1 = icmp eq i64 %indvars.iv.next119, 1399
  %indvars.iv.next119.1 = add nsw i64 %indvars.iv118, 2
  br i1 %exitcond121.1, label %._crit_edge52.us, label %10

._crit_edge52.us:                                 ; preds = %10
  %18 = fdiv double %17, %0
  store double %18, double* %sunkaddr162.1, align 8
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  %exitcond159 = icmp eq i64 %indvars.iv.next157, 1200
  br i1 %exitcond159, label %.lr.ph49.split.us.preheader, label %.lr.ph55.split.us

.lr.ph49.split.us.preheader:                      ; preds = %._crit_edge52.us
  %sunkaddr171 = ptrtoint double* %4 to i64
  %sunkaddr171.1 = ptrtoint double* %4 to i64
  br label %.lr.ph49.split.us

.lr.ph49.split.us:                                ; preds = %.lr.ph49.split.us.preheader, %._crit_edge47.us
  %indvars.iv154 = phi i64 [ %indvars.iv.next155, %._crit_edge47.us ], [ 0, %.lr.ph49.split.us.preheader ]
  %19 = getelementptr inbounds double, double* %4, i64 %indvars.iv154
  store double 0.000000e+00, double* %19, align 8
  %sunkaddr168 = shl i64 %indvars.iv154, 3
  %sunkaddr169 = add i64 %sunkaddr.1, %sunkaddr168
  %sunkaddr170 = inttoptr i64 %sunkaddr169 to double*
  %sunkaddr173 = add i64 %sunkaddr171, %sunkaddr168
  %sunkaddr174 = inttoptr i64 %sunkaddr173 to double*
  %sunkaddr168.1 = shl i64 %indvars.iv154, 3
  %sunkaddr169.1 = add i64 %sunkaddr.1, %sunkaddr168.1
  %sunkaddr170.1 = inttoptr i64 %sunkaddr169.1 to double*
  %sunkaddr173.1 = add i64 %sunkaddr171.1, %sunkaddr168.1
  %sunkaddr174.1 = inttoptr i64 %sunkaddr173.1 to double*
  br label %20

; <label>:20:                                     ; preds = %20, %.lr.ph49.split.us
  %indvars.iv110 = phi i64 [ 0, %.lr.ph49.split.us ], [ %indvars.iv.next111.1, %20 ]
  %21 = phi double [ 0.000000e+00, %.lr.ph49.split.us ], [ %33, %20 ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv154
  %23 = load double, double* %22, align 8
  %24 = load double, double* %sunkaddr170, align 8
  %25 = fsub double %23, %24
  %26 = fmul double %25, %25
  %27 = fadd double %26, %21
  store double %27, double* %sunkaddr174, align 8
  %indvars.iv.next111 = or i64 %indvars.iv110, 1
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next111, i64 %indvars.iv154
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr170.1, align 8
  %31 = fsub double %29, %30
  %32 = fmul double %31, %31
  %33 = fadd double %32, %27
  store double %33, double* %sunkaddr174.1, align 8
  %exitcond113.1 = icmp eq i64 %indvars.iv.next111, 1399
  %indvars.iv.next111.1 = add nsw i64 %indvars.iv110, 2
  br i1 %exitcond113.1, label %._crit_edge47.us, label %20

._crit_edge47.us:                                 ; preds = %20
  %34 = fdiv double %33, %0
  store double %34, double* %sunkaddr174.1, align 8
  %35 = tail call double @sqrt(double %34) #4
  %36 = fcmp ugt double %35, 1.000000e-01
  %37 = select i1 %36, double %35, double 1.000000e+00
  store double %37, double* %sunkaddr174.1, align 8
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next155, 1200
  br i1 %exitcond11, label %._crit_edge11.us.preheader, label %.lr.ph49.split.us

._crit_edge11.us.preheader:                       ; preds = %._crit_edge47.us
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.preheader, %._crit_edge42.us
  %indvars.iv150 = phi i64 [ %indvars.iv.next151, %._crit_edge42.us ], [ 0, %._crit_edge11.us.preheader ]
  %38 = phi [1200 x double]* [ %52, %._crit_edge42.us ], [ %1, %._crit_edge11.us.preheader ]
  br label %39

; <label>:39:                                     ; preds = %39, %._crit_edge11.us
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %39 ], [ 0, %._crit_edge11.us ]
  %40 = phi [1200 x double]* [ %52, %39 ], [ %38, %._crit_edge11.us ]
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv105
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %40, i64 %indvars.iv150, i64 %indvars.iv105
  %44 = load double, double* %43, align 8
  %45 = fsub double %44, %42
  store double %45, double* %43, align 8
  %46 = load double, double* %5, align 8
  %47 = tail call double @sqrt(double %46) #4
  %48 = load double*, double** %8, align 8
  %49 = getelementptr inbounds double, double* %48, i64 %indvars.iv105
  %50 = load double, double* %49, align 8
  %51 = fmul double %47, %50
  %52 = load [1200 x double]*, [1200 x double]** %6, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %52, i64 %indvars.iv150, i64 %indvars.iv105
  %54 = load double, double* %53, align 8
  %55 = fdiv double %54, %51
  store double %55, double* %53, align 8
  %exitcond108 = icmp eq i64 %indvars.iv105, 1199
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  br i1 %exitcond108, label %._crit_edge42.us, label %39

._crit_edge42.us:                                 ; preds = %39
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %exitcond153 = icmp eq i64 %indvars.iv.next151, 1400
  br i1 %exitcond153, label %.lr.ph30.split.us.preheader, label %._crit_edge11.us

.lr.ph30.split.us.preheader:                      ; preds = %._crit_edge42.us
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %.lr.ph30.split.us.preheader, %._crit_edge29.us-lcssa.us.us
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %._crit_edge29.us-lcssa.us.us ], [ 1, %.lr.ph30.split.us.preheader ]
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %._crit_edge29.us-lcssa.us.us ], [ 0, %.lr.ph30.split.us.preheader ]
  %56 = phi [1200 x double]* [ %61, %._crit_edge29.us-lcssa.us.us ], [ %2, %.lr.ph30.split.us.preheader ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %56, i64 %indvars.iv95, i64 %indvars.iv95
  store double 1.000000e+00, double* %57, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  br label %.lr.ph.us.us

._crit_edge29.us-lcssa.us.us:                     ; preds = %._crit_edge24.us.us
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next96, 1199
  br i1 %exitcond10, label %._crit_edge31, label %.lr.ph30.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge24.us.us, %.lr.ph30.split.us
  %indvars.iv147 = phi i64 [ %indvars.iv.next148, %._crit_edge24.us.us ], [ %indvars.iv145, %.lr.ph30.split.us ]
  %58 = phi [1200 x double]* [ %61, %._crit_edge24.us.us ], [ %56, %.lr.ph30.split.us ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %58, i64 %indvars.iv95, i64 %indvars.iv147
  store double 0.000000e+00, double* %59, align 8
  %60 = load [1200 x double]*, [1200 x double]** %6, align 8
  %61 = load [1200 x double]*, [1200 x double]** %7, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %61, i64 %indvars.iv95, i64 %indvars.iv147
  %.pre = load double, double* %62, align 8
  br label %64

._crit_edge24.us.us:                              ; preds = %64
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %61, i64 %indvars.iv147, i64 %indvars.iv95
  store double %77, double* %63, align 8
  %indvars.iv.next148 = add nuw nsw i64 %indvars.iv147, 1
  %lftr.wideiv8 = trunc i64 %indvars.iv.next148 to i32
  %exitcond9 = icmp eq i32 %lftr.wideiv8, 1200
  br i1 %exitcond9, label %._crit_edge29.us-lcssa.us.us, label %.lr.ph.us.us

; <label>:64:                                     ; preds = %64, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %64 ]
  %65 = phi double [ %.pre, %.lr.ph.us.us ], [ %77, %64 ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %60, i64 %indvars.iv, i64 %indvars.iv95
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %60, i64 %indvars.iv, i64 %indvars.iv147
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %70, %65
  store double %71, double* %62, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %60, i64 %indvars.iv.next, i64 %indvars.iv95
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %60, i64 %indvars.iv.next, i64 %indvars.iv147
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fadd double %76, %71
  store double %77, double* %62, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1399
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge24.us.us, label %64

._crit_edge31:                                    ; preds = %._crit_edge29.us-lcssa.us.us
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %61, i64 1199, i64 1199
  store double 1.000000e+00, double* %78, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge3.us, %._crit_edge.us.preheader
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge3.us ], [ 0, %._crit_edge.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv6, 1200
  br label %._crit_edge2.us._crit_edge

._crit_edge2.us._crit_edge:                       ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge2.us

; <label>:10:                                     ; preds = %._crit_edge2.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge2.us._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge3.us, label %._crit_edge2.us._crit_edge

._crit_edge3.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1200
  br i1 %exitcond8, label %._crit_edge5, label %._crit_edge.us

._crit_edge5:                                     ; preds = %._crit_edge3.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
