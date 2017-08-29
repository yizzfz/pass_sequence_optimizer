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
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call void @init_array(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to [1200 x double]*
  tail call void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %9)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %11
  %15 = bitcast i8* %5 to [1200 x double]*
  %16 = bitcast i8* %4 to [1200 x double]*
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %16, [1200 x double]* %15)
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %2, %14
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #2 {
.preheader5.lr.ph:
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.loopexit12.us, %.preheader5.lr.ph
  %indvars.iv34 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next35, %.loopexit12.us ]
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader5.us
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %5 ], [ 0, %.preheader5.us ]
  %6 = mul nuw nsw i64 %indvars.iv34, %indvars.iv30
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 1000
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.000000e+03
  %11 = fmul double %10, 1.000000e+02
  %12 = fadd double %11, 1.000000e+01
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv34, i64 %indvars.iv30
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 %indvars.iv30
  store double 0.000000e+00, double* %14, align 8
  %exitcond33 = icmp eq i64 %indvars.iv30, 1199
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  br i1 %exitcond33, label %.loopexit12.us, label %5

.loopexit12.us:                                   ; preds = %5
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next35, 1000
  br i1 %exitcond40, label %.loopexit.us.preheader, label %.preheader5.us

.loopexit.us.preheader:                           ; preds = %.loopexit12.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us, %.loopexit.us.preheader
  %indvars.iv28 = phi i64 [ 0, %.loopexit.us.preheader ], [ %indvars.iv.next29.7, %.loopexit.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv28, i64 0
  %scevgep37 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next29 = or i64 %indvars.iv28, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next29, i64 0
  %scevgep37.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next29.1 = or i64 %indvars.iv28, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next29.1, i64 0
  %scevgep37.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next29.2 = or i64 %indvars.iv28, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next29.2, i64 0
  %scevgep37.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next29.3 = or i64 %indvars.iv28, 4
  %scevgep.4 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next29.3, i64 0
  %scevgep37.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.4, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next29.4 = or i64 %indvars.iv28, 5
  %scevgep.5 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next29.4, i64 0
  %scevgep37.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.5, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next29.5 = or i64 %indvars.iv28, 6
  %scevgep.6 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next29.5, i64 0
  %scevgep37.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.6, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next29.6 = or i64 %indvars.iv28, 7
  %scevgep.7 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next29.6, i64 0
  %scevgep37.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep37.7, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next29.7 = add nsw i64 %indvars.iv28, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next29.7, 1200
  br i1 %exitcond.7, label %.preheader4._crit_edge, label %.loopexit.us

.preheader4._crit_edge:                           ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_gramschmidt(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.lr.ph23:
  br label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.loopexit25._crit_edge, %.lr.ph23
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %.loopexit25._crit_edge ], [ 0, %.lr.ph23 ]
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %.loopexit25._crit_edge ], [ 1, %.lr.ph23 ]
  %sext = shl i64 %indvars.iv83, 32
  %5 = ashr exact i64 %sext, 32
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next.4, %.lr.ph ]
  %6 = phi double [ 0.000000e+00, %.lr.ph.preheader ], [ %26, %.lr.ph ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv87
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %8
  %10 = fadd double %6, %9
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv87
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %12
  %14 = fadd double %10, %13
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv87
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %16
  %18 = fadd double %14, %17
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv87
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %20
  %22 = fadd double %18, %21
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.3, i64 %indvars.iv87
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %24
  %26 = fadd double %22, %25
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %.loopexit27, label %.lr.ph

.loopexit27:                                      ; preds = %.lr.ph
  %27 = tail call double @sqrt(double %26) #4
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv87, i64 %indvars.iv87
  store double %27, double* %28, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv87
  %30 = load double, double* %29, align 8
  %31 = fdiv double %30, %27
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv87
  store double %31, double* %32, align 8
  br label %._crit_edge63

._crit_edge63:                                    ; preds = %._crit_edge63.1, %.loopexit27
  %indvars.iv6798 = phi i64 [ 0, %.loopexit27 ], [ %indvars.iv.next68.1, %._crit_edge63.1 ]
  %indvars.iv.next68 = or i64 %indvars.iv6798, 1
  %.pre = load double, double* %28, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next68, i64 %indvars.iv87
  %34 = load double, double* %33, align 8
  %35 = fdiv double %34, %.pre
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next68, i64 %indvars.iv87
  store double %35, double* %36, align 8
  %exitcond70 = icmp eq i64 %indvars.iv.next68, 999
  br i1 %exitcond70, label %.loopexit26, label %._crit_edge63.1

.loopexit26:                                      ; preds = %._crit_edge63
  %indvars.iv.next88 = add i64 %indvars.iv87, 1
  %37 = icmp slt i64 %indvars.iv.next88, 1200
  br i1 %37, label %.lr.ph20.split.us.preheader, label %._crit_edge

.lr.ph20.split.us.preheader:                      ; preds = %.loopexit26
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv87
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %.lr.ph20.split.us.preheader, %.loopexit.us
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %.loopexit.us ], [ %5, %.lr.ph20.split.us.preheader ]
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv87, i64 %indvars.iv85
  store double 0.000000e+00, double* %39, align 8
  br label %40

; <label>:40:                                     ; preds = %40, %.lr.ph20.split.us
  %41 = phi double [ 0.000000e+00, %.lr.ph20.split.us ], [ %53, %40 ]
  %indvars.iv75 = phi i64 [ 0, %.lr.ph20.split.us ], [ %indvars.iv.next76.1, %40 ]
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv75, i64 %indvars.iv87
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv75, i64 %indvars.iv85
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %46, %41
  store double %47, double* %39, align 8
  %indvars.iv.next76 = or i64 %indvars.iv75, 1
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next76, i64 %indvars.iv87
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next76, i64 %indvars.iv85
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %52, %47
  store double %53, double* %39, align 8
  %exitcond78.1 = icmp eq i64 %indvars.iv.next76, 999
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75, 2
  br i1 %exitcond78.1, label %.lr.ph15.us.preheader, label %40

.lr.ph15.us.preheader:                            ; preds = %40
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv85
  %55 = load double, double* %54, align 8
  %56 = load double, double* %38, align 8
  %57 = fmul double %56, %53
  %58 = fsub double %55, %57
  store double %58, double* %54, align 8
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %._crit_edge65.1, %.lr.ph15.us.preheader
  %indvars.iv79100 = phi i64 [ 0, %.lr.ph15.us.preheader ], [ %indvars.iv.next80.1, %._crit_edge65.1 ]
  %indvars.iv.next80 = or i64 %indvars.iv79100, 1
  %.pre89 = load double, double* %39, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next80, i64 %indvars.iv85
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next80, i64 %indvars.iv87
  %62 = load double, double* %61, align 8
  %63 = fmul double %62, %.pre89
  %64 = fsub double %60, %63
  store double %64, double* %59, align 8
  %exitcond82 = icmp eq i64 %indvars.iv.next80, 999
  br i1 %exitcond82, label %.loopexit.us, label %._crit_edge65.1

.loopexit.us:                                     ; preds = %._crit_edge65
  %indvars.iv.next86 = add nsw i64 %indvars.iv85, 1
  %65 = icmp slt i64 %indvars.iv.next86, 1200
  br i1 %65, label %.lr.ph20.split.us, label %.loopexit25

.loopexit25:                                      ; preds = %.loopexit.us
  %66 = icmp slt i64 %indvars.iv.next88, 1200
  br i1 %66, label %.loopexit25._crit_edge, label %._crit_edge

.loopexit25._crit_edge:                           ; preds = %.loopexit25
  %indvars.iv.next84 = add nsw i64 %5, 1
  br label %.lr.ph.preheader

._crit_edge:                                      ; preds = %.loopexit26, %.loopexit25
  ret void

._crit_edge63.1:                                  ; preds = %._crit_edge63
  %indvars.iv.next68.1 = add nsw i64 %indvars.iv6798, 2
  %.pre.1 = load double, double* %28, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next68.1, i64 %indvars.iv87
  %68 = load double, double* %67, align 8
  %69 = fdiv double %68, %.pre.1
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next68.1, i64 %indvars.iv87
  store double %69, double* %70, align 8
  br label %._crit_edge63

._crit_edge65.1:                                  ; preds = %._crit_edge65
  %indvars.iv.next80.1 = add nsw i64 %indvars.iv79100, 2
  %.pre89.1 = load double, double* %39, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next80.1, i64 %indvars.iv85
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next80.1, i64 %indvars.iv87
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, %.pre89.1
  %76 = fsub double %72, %75
  store double %76, double* %71, align 8
  br label %._crit_edge65
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*, [1200 x double]*) #0 {
.preheader7.lr.ph..preheader7.us_crit_edge:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.loopexit17.us, %.preheader7.lr.ph..preheader7.us_crit_edge
  %indvars.iv43 = phi i64 [ 0, %.preheader7.lr.ph..preheader7.us_crit_edge ], [ %indvars.iv.next44, %.loopexit17.us ]
  %8 = mul nuw nsw i64 %indvars.iv43, 1200
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge31, %.preheader7.us
  %indvars.iv41 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next42, %._crit_edge31 ]
  %9 = add nuw nsw i64 %8, %indvars.iv41
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge31

; <label>:13:                                     ; preds = %._crit_edge32
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge32, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv43, i64 %indvars.iv41
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #7
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond47, label %.loopexit17.us, label %._crit_edge32

.loopexit17.us:                                   ; preds = %._crit_edge31
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next44, 1200
  br i1 %exitcond48, label %._crit_edge, label %.preheader7.us

._crit_edge:                                      ; preds = %.loopexit17.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %._crit_edge
  %indvars.iv39 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next40, %.loopexit.us ]
  %23 = mul nuw nsw i64 %indvars.iv39, 1200
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge34, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge34 ]
  %24 = add nuw nsw i64 %23, %indvars.iv
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 20
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %._crit_edge34

; <label>:28:                                     ; preds = %._crit_edge35
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %29) #6
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge35, %28
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv
  %32 = load double, double* %31, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %32) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond1, label %.loopexit.us, label %._crit_edge35

.loopexit.us:                                     ; preds = %._crit_edge34
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 1000
  br i1 %exitcond, label %._crit_edge33, label %.preheader.us

._crit_edge33:                                    ; preds = %.loopexit.us
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %36) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
