; ModuleID = 'B.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call void @init_array(double* nonnull %3, [1200 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  call void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
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
  %18 = bitcast i8* %5 to [1200 x double]*
  call void @print_array(i32 1200, [1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %17, %14, %2
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double*, [1200 x double]*) #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %.preheader

.preheader:                                       ; preds = %20, %2
  %indvars.iv6 = phi i64 [ 0, %2 ], [ %indvars.iv.next7, %20 ]
  %3 = trunc i64 %indvars.iv6 to i32
  %4 = sitofp i32 %3 to double
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv6, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = mul nuw nsw i64 %indvars.iv6, %indvars.iv.next
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %8, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.200000e+03, double 1.200000e+03>
  %16 = insertelement <2 x double> undef, double %4, i32 0
  %17 = insertelement <2 x double> %16, double %4, i32 1
  %18 = fadd <2 x double> %17, %15
  %19 = bitcast double* %9 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1199
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %20, label %5

; <label>:20:                                     ; preds = %5
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1400
  br i1 %exitcond8, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) #0 {
.lr.ph38:
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr.1 = ptrtoint double* %5 to i64
  %sunkaddr175 = ptrtoint double* %5 to i64
  br label %.lr.ph38.split.us

.lr.ph38.split.us:                                ; preds = %.loopexit43.us, %.lr.ph38
  %indvars.iv140 = phi i64 [ 0, %.lr.ph38 ], [ %indvars.iv.next141, %.loopexit43.us ]
  %sext156 = shl i64 %indvars.iv140, 32
  %7 = ashr exact i64 %sext156, 32
  %8 = getelementptr inbounds double, double* %5, i64 %7
  store double 0.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds double, double* %5, i64 %indvars.iv140
  %.pre = load double, double* %9, align 8
  %sunkaddr172 = shl nuw nsw i64 %indvars.iv140, 3
  %sunkaddr173 = add i64 %sunkaddr, %sunkaddr172
  %sunkaddr174 = inttoptr i64 %sunkaddr173 to double*
  %sunkaddr172.1 = shl nuw nsw i64 %indvars.iv140, 3
  %sunkaddr173.1 = add i64 %sunkaddr.1, %sunkaddr172.1
  %sunkaddr174.1 = inttoptr i64 %sunkaddr173.1 to double*
  br label %10

; <label>:10:                                     ; preds = %10, %.lr.ph38.split.us
  %11 = phi double [ %.pre, %.lr.ph38.split.us ], [ %17, %10 ]
  %indvars.iv136 = phi i64 [ 0, %.lr.ph38.split.us ], [ %indvars.iv.next137.1, %10 ]
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv136, i64 %indvars.iv140
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %sunkaddr174, align 8
  %indvars.iv.next137 = or i64 %indvars.iv136, 1
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next137, i64 %indvars.iv140
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %sunkaddr174.1, align 8
  %exitcond139.1 = icmp eq i64 %indvars.iv.next137, 1399
  %indvars.iv.next137.1 = add nsw i64 %indvars.iv136, 2
  br i1 %exitcond139.1, label %.loopexit43.us, label %10

.loopexit43.us:                                   ; preds = %10
  %18 = fdiv double %17, %2
  %sunkaddr176 = shl nuw nsw i64 %indvars.iv140, 3
  %sunkaddr177 = add i64 %sunkaddr175, %sunkaddr176
  %sunkaddr178 = inttoptr i64 %sunkaddr177 to double*
  store double %18, double* %sunkaddr178, align 8
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %exitcond170 = icmp eq i64 %indvars.iv.next141, 1200
  br i1 %exitcond170, label %.lr.ph31.split.us.preheader, label %.lr.ph38.split.us

.lr.ph31.split.us.preheader:                      ; preds = %.loopexit43.us
  %sunkaddr179 = ptrtoint double* %5 to i64
  %sunkaddr183 = ptrtoint double* %6 to i64
  %sunkaddr179.1 = ptrtoint double* %5 to i64
  %sunkaddr183.1 = ptrtoint double* %6 to i64
  %sunkaddr187 = ptrtoint double* %6 to i64
  br label %.lr.ph31.split.us

.lr.ph31.split.us:                                ; preds = %.loopexit42.us, %.lr.ph31.split.us.preheader
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %.loopexit42.us ], [ 0, %.lr.ph31.split.us.preheader ]
  %sext154 = shl i64 %indvars.iv131, 32
  %19 = ashr exact i64 %sext154, 32
  %20 = getelementptr inbounds double, double* %6, i64 %19
  store double 0.000000e+00, double* %20, align 8
  %21 = getelementptr inbounds double, double* %6, i64 %indvars.iv131
  %.pre145 = load double, double* %21, align 8
  %sunkaddr180 = shl nuw nsw i64 %indvars.iv131, 3
  %sunkaddr181 = add i64 %sunkaddr179, %sunkaddr180
  %sunkaddr182 = inttoptr i64 %sunkaddr181 to double*
  %sunkaddr184 = shl nuw nsw i64 %indvars.iv131, 3
  %sunkaddr185 = add i64 %sunkaddr183, %sunkaddr184
  %sunkaddr186 = inttoptr i64 %sunkaddr185 to double*
  %sunkaddr180.1 = shl nuw nsw i64 %indvars.iv131, 3
  %sunkaddr181.1 = add i64 %sunkaddr179.1, %sunkaddr180.1
  %sunkaddr182.1 = inttoptr i64 %sunkaddr181.1 to double*
  %sunkaddr184.1 = shl nuw nsw i64 %indvars.iv131, 3
  %sunkaddr185.1 = add i64 %sunkaddr183.1, %sunkaddr184.1
  %sunkaddr186.1 = inttoptr i64 %sunkaddr185.1 to double*
  br label %22

; <label>:22:                                     ; preds = %22, %.lr.ph31.split.us
  %23 = phi double [ %.pre145, %.lr.ph31.split.us ], [ %35, %22 ]
  %indvars.iv127 = phi i64 [ 0, %.lr.ph31.split.us ], [ %indvars.iv.next128.1, %22 ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv127, i64 %indvars.iv131
  %25 = load double, double* %24, align 8
  %26 = load double, double* %sunkaddr182, align 8
  %27 = fsub double %25, %26
  %28 = fmul double %27, %27
  %29 = fadd double %23, %28
  store double %29, double* %sunkaddr186, align 8
  %indvars.iv.next128 = or i64 %indvars.iv127, 1
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next128, i64 %indvars.iv131
  %31 = load double, double* %30, align 8
  %32 = load double, double* %sunkaddr182.1, align 8
  %33 = fsub double %31, %32
  %34 = fmul double %33, %33
  %35 = fadd double %29, %34
  store double %35, double* %sunkaddr186.1, align 8
  %exitcond130.1 = icmp eq i64 %indvars.iv.next128, 1399
  %indvars.iv.next128.1 = add nsw i64 %indvars.iv127, 2
  br i1 %exitcond130.1, label %.loopexit42.us, label %22

.loopexit42.us:                                   ; preds = %22
  %36 = fdiv double %35, %2
  %sunkaddr188 = shl nuw nsw i64 %indvars.iv131, 3
  %sunkaddr189 = add i64 %sunkaddr187, %sunkaddr188
  %sunkaddr190 = inttoptr i64 %sunkaddr189 to double*
  store double %36, double* %sunkaddr190, align 8
  %37 = tail call double @sqrt(double %36) #4
  %38 = fcmp ole double %37, 1.000000e-01
  %39 = select i1 %38, double 1.000000e+00, double %37
  store double %39, double* %sunkaddr190, align 8
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %exitcond168 = icmp eq i64 %indvars.iv.next132, 1200
  br i1 %exitcond168, label %.preheader9.us.preheader, label %.lr.ph31.split.us

.preheader9.us.preheader:                         ; preds = %.loopexit42.us
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %.loopexit41.us, %.preheader9.us.preheader
  %indvars.iv125 = phi i64 [ %indvars.iv.next126, %.loopexit41.us ], [ 0, %.preheader9.us.preheader ]
  br label %40

; <label>:40:                                     ; preds = %40, %.preheader9.us
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %40 ], [ 0, %.preheader9.us ]
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv121
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv125, i64 %indvars.iv121
  %44 = load double, double* %43, align 8
  %45 = fsub double %44, %42
  store double %45, double* %43, align 8
  %46 = tail call double @sqrt(double %2) #4
  %47 = getelementptr inbounds double, double* %6, i64 %indvars.iv121
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = load double, double* %43, align 8
  %51 = fdiv double %50, %49
  store double %51, double* %43, align 8
  %exitcond124 = icmp eq i64 %indvars.iv121, 1199
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  br i1 %exitcond124, label %.loopexit41.us, label %40

.loopexit41.us:                                   ; preds = %40
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %exitcond167 = icmp eq i64 %indvars.iv.next126, 1400
  br i1 %exitcond167, label %.lr.ph20.split.us.preheader, label %.preheader9.us

.lr.ph20.split.us.preheader:                      ; preds = %.loopexit41.us
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %.loopexit39.us-lcssa.us.us, %.lr.ph20.split.us.preheader
  %indvars.iv197 = phi i64 [ %indvars.iv.next198, %.loopexit39.us-lcssa.us.us ], [ 1, %.lr.ph20.split.us.preheader ]
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %.loopexit39.us-lcssa.us.us ], [ 0, %.lr.ph20.split.us.preheader ]
  %sext152 = shl i64 %indvars.iv109, 32
  %52 = ashr exact i64 %sext152, 32
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %52, i64 %52
  store double 1.000000e+00, double* %53, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  br label %.lr.ph.us.us

.loopexit39.us-lcssa.us.us:                       ; preds = %.loopexit.us.us
  %indvars.iv.next198 = add nuw nsw i64 %indvars.iv197, 1
  %exitcond208 = icmp eq i64 %indvars.iv.next110, 1199
  br i1 %exitcond208, label %.loopexit40, label %.lr.ph20.split.us

.lr.ph.us.us:                                     ; preds = %.loopexit.us.us, %.lr.ph20.split.us
  %indvars.iv107 = phi i64 [ %indvars.iv197, %.lr.ph20.split.us ], [ %indvars.iv.next108, %.loopexit.us.us ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv109, i64 %indvars.iv107
  store double 0.000000e+00, double* %54, align 8
  br label %56

.loopexit.us.us:                                  ; preds = %56
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv107, i64 %indvars.iv109
  store double %69, double* %55, align 8
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond196 = icmp eq i64 %indvars.iv.next108, 1200
  br i1 %exitcond196, label %.loopexit39.us-lcssa.us.us, label %.lr.ph.us.us

; <label>:56:                                     ; preds = %56, %.lr.ph.us.us
  %57 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %69, %56 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %56 ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv109
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv107
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %62, %57
  store double %63, double* %54, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv109
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv107
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %68, %63
  store double %69, double* %54, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1399
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.loopexit.us.us, label %56

.loopexit40:                                      ; preds = %.loopexit39.us-lcssa.us.us
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %70, align 8
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv14 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next15, %.loopexit.us ]
  %6 = mul nuw nsw i64 %indvars.iv14, 1200
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge11 ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge11

; <label>:11:                                     ; preds = %._crit_edge12
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %11, %._crit_edge12
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge12

.loopexit.us:                                     ; preds = %._crit_edge11
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond16, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
