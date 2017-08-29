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
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
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
  %18 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %18)
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
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %20, %4
  %indvars.iv14 = phi i64 [ 0, %4 ], [ %indvars.iv.next12, %20 ]
  %5 = trunc i64 %indvars.iv14 to i32
  %6 = sitofp i32 %5 to double
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv11 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv11, %indvars.iv14
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = fadd double %6, %11
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv14, i64 %indvars.iv11
  store double %12, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv11, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv14
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.200000e+03
  %18 = fadd double %6, %17
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv14, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv11, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 1400
  br i1 %exitcond13, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph159.split.us.preheader:
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr185 = ptrtoint double* %5 to i64
  br label %.lr.ph159.split.us

.lr.ph159.split.us:                               ; preds = %.lr.ph159.split.us.preheader, %._crit_edge154.us
  %indvars.iv156.us = phi i64 [ %indvars.iv.next155.us, %._crit_edge154.us ], [ 0, %.lr.ph159.split.us.preheader ]
  %7 = getelementptr inbounds double, double* %5, i64 %indvars.iv156.us
  store double 0.000000e+00, double* %7, align 8
  %sunkaddr182 = shl i64 %indvars.iv156.us, 3
  %sunkaddr183 = add i64 %sunkaddr, %sunkaddr182
  %sunkaddr184 = inttoptr i64 %sunkaddr183 to double*
  br label %8

; <label>:8:                                      ; preds = %8, %.lr.ph159.split.us
  %9 = phi double [ 0.000000e+00, %.lr.ph159.split.us ], [ %21, %8 ]
  %indvars.iv151.us = phi i64 [ 0, %.lr.ph159.split.us ], [ %indvars.iv.next150.us.3, %8 ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv151.us, i64 %indvars.iv156.us
  %11 = load double, double* %10, align 8
  %12 = fadd double %11, %9
  store double %12, double* %sunkaddr184, align 8
  %indvars.iv.next150.us = or i64 %indvars.iv151.us, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next150.us, i64 %indvars.iv156.us
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %sunkaddr184, align 8
  %indvars.iv.next150.us.1 = or i64 %indvars.iv151.us, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next150.us.1, i64 %indvars.iv156.us
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %sunkaddr184, align 8
  %indvars.iv.next150.us.2 = or i64 %indvars.iv151.us, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next150.us.2, i64 %indvars.iv156.us
  %20 = load double, double* %19, align 8
  %21 = fadd double %20, %18
  store double %21, double* %sunkaddr184, align 8
  %indvars.iv.next150.us.3 = add nsw i64 %indvars.iv151.us, 4
  %exitcond168.3 = icmp eq i64 %indvars.iv.next150.us.3, 1400
  br i1 %exitcond168.3, label %._crit_edge154.us, label %8

._crit_edge154.us:                                ; preds = %8
  %22 = fdiv double %21, %2
  %sunkaddr186 = shl i64 %indvars.iv156.us, 3
  %sunkaddr187 = add i64 %sunkaddr185, %sunkaddr186
  %sunkaddr188 = inttoptr i64 %sunkaddr187 to double*
  store double %22, double* %sunkaddr188, align 8
  %indvars.iv.next155.us = add nuw nsw i64 %indvars.iv156.us, 1
  %exitcond169 = icmp eq i64 %indvars.iv.next155.us, 1200
  br i1 %exitcond169, label %.lr.ph149.split.us.preheader, label %.lr.ph159.split.us

.lr.ph149.split.us.preheader:                     ; preds = %._crit_edge154.us
  %sunkaddr189 = ptrtoint double* %5 to i64
  %sunkaddr193 = ptrtoint double* %6 to i64
  %sunkaddr197 = ptrtoint double* %6 to i64
  br label %.lr.ph149.split.us

.lr.ph149.split.us:                               ; preds = %.lr.ph149.split.us.preheader, %._crit_edge145.us
  %indvars.iv147.us = phi i64 [ %indvars.iv.next146.us, %._crit_edge145.us ], [ 0, %.lr.ph149.split.us.preheader ]
  %23 = getelementptr inbounds double, double* %6, i64 %indvars.iv147.us
  store double 0.000000e+00, double* %23, align 8
  %sunkaddr190 = shl i64 %indvars.iv147.us, 3
  %sunkaddr191 = add i64 %sunkaddr189, %sunkaddr190
  %sunkaddr192 = inttoptr i64 %sunkaddr191 to double*
  %sunkaddr194 = shl i64 %indvars.iv147.us, 3
  %sunkaddr195 = add i64 %sunkaddr193, %sunkaddr194
  %sunkaddr196 = inttoptr i64 %sunkaddr195 to double*
  br label %24

; <label>:24:                                     ; preds = %24, %.lr.ph149.split.us
  %25 = phi double [ 0.000000e+00, %.lr.ph149.split.us ], [ %37, %24 ]
  %indvars.iv142.us = phi i64 [ 0, %.lr.ph149.split.us ], [ %indvars.iv.next141.us.1, %24 ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv142.us, i64 %indvars.iv147.us
  %27 = load double, double* %26, align 8
  %28 = load double, double* %sunkaddr192, align 8
  %29 = fsub double %27, %28
  %30 = fmul double %29, %29
  %31 = fadd double %25, %30
  store double %31, double* %sunkaddr196, align 8
  %indvars.iv.next141.us = or i64 %indvars.iv142.us, 1
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next141.us, i64 %indvars.iv147.us
  %33 = load double, double* %32, align 8
  %34 = load double, double* %sunkaddr192, align 8
  %35 = fsub double %33, %34
  %36 = fmul double %35, %35
  %37 = fadd double %31, %36
  store double %37, double* %sunkaddr196, align 8
  %indvars.iv.next141.us.1 = add nsw i64 %indvars.iv142.us, 2
  %exitcond166.1 = icmp eq i64 %indvars.iv.next141.us.1, 1400
  br i1 %exitcond166.1, label %._crit_edge145.us, label %24

._crit_edge145.us:                                ; preds = %24
  %38 = fdiv double %37, %2
  %sunkaddr198 = shl i64 %indvars.iv147.us, 3
  %sunkaddr199 = add i64 %sunkaddr197, %sunkaddr198
  %sunkaddr200 = inttoptr i64 %sunkaddr199 to double*
  store double %38, double* %sunkaddr200, align 8
  %39 = tail call double @sqrt(double %38) #4
  %40 = fcmp ole double %39, 1.000000e-01
  %41 = select i1 %40, double 1.000000e+00, double %39
  store double %41, double* %sunkaddr200, align 8
  %indvars.iv.next146.us = add nuw nsw i64 %indvars.iv147.us, 1
  %exitcond167 = icmp eq i64 %indvars.iv.next146.us, 1200
  br i1 %exitcond167, label %._crit_edge106.us.preheader, label %.lr.ph149.split.us

._crit_edge106.us.preheader:                      ; preds = %._crit_edge145.us
  br label %._crit_edge106.us

._crit_edge106.us:                                ; preds = %._crit_edge106.us.preheader, %._crit_edge137.us
  %indvars.iv139.us = phi i64 [ %indvars.iv.next138.us, %._crit_edge137.us ], [ 0, %._crit_edge106.us.preheader ]
  br label %42

; <label>:42:                                     ; preds = %42, %._crit_edge106.us
  %indvars.iv135.us = phi i64 [ 0, %._crit_edge106.us ], [ %indvars.iv.next134.us, %42 ]
  %43 = getelementptr inbounds double, double* %5, i64 %indvars.iv135.us
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv139.us, i64 %indvars.iv135.us
  %46 = load double, double* %45, align 8
  %47 = fsub double %46, %44
  store double %47, double* %45, align 8
  %48 = tail call double @sqrt(double %2) #4
  %49 = getelementptr inbounds double, double* %6, i64 %indvars.iv135.us
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = load double, double* %45, align 8
  %53 = fdiv double %52, %51
  store double %53, double* %45, align 8
  %indvars.iv.next134.us = add nuw nsw i64 %indvars.iv135.us, 1
  %exitcond164 = icmp eq i64 %indvars.iv.next134.us, 1200
  br i1 %exitcond164, label %._crit_edge137.us, label %42

._crit_edge137.us:                                ; preds = %42
  %indvars.iv.next138.us = add nuw nsw i64 %indvars.iv139.us, 1
  %exitcond165 = icmp eq i64 %indvars.iv.next138.us, 1400
  br i1 %exitcond165, label %.lr.ph124.split.us.preheader, label %._crit_edge106.us

.lr.ph124.split.us.preheader:                     ; preds = %._crit_edge137.us
  br label %.lr.ph124.split.us

.lr.ph124.split.us:                               ; preds = %.lr.ph124.split.us.preheader, %._crit_edge108.us
  %indvars.iv = phi i64 [ %indvars.iv.next162, %._crit_edge108.us ], [ 1, %.lr.ph124.split.us.preheader ]
  %indvars.iv120122.us = phi i64 [ %indvars.iv.next121.us, %._crit_edge108.us ], [ 0, %.lr.ph124.split.us.preheader ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv120122.us, i64 %indvars.iv120122.us
  store double 1.000000e+00, double* %54, align 8
  %indvars.iv.next121.us = add nuw nsw i64 %indvars.iv120122.us, 1
  %55 = icmp slt i64 %indvars.iv, 1200
  br i1 %55, label %.lr.ph.us.us.preheader, label %._crit_edge108.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph124.split.us
  br label %.lr.ph.us.us

._crit_edge108.us.loopexit:                       ; preds = %._crit_edge111.us.us
  br label %._crit_edge108.us

._crit_edge108.us:                                ; preds = %._crit_edge108.us.loopexit, %.lr.ph124.split.us
  %indvars.iv.next162 = add nuw nsw i64 %indvars.iv, 1
  %exitcond163 = icmp eq i64 %indvars.iv.next121.us, 1199
  br i1 %exitcond163, label %._crit_edge125, label %.lr.ph124.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge111.us.us
  %indvars.iv113115.us.us = phi i64 [ %indvars.iv.next114.us.us, %._crit_edge111.us.us ], [ %indvars.iv, %.lr.ph.us.us.preheader ]
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv120122.us, i64 %indvars.iv113115.us.us
  store double 0.000000e+00, double* %56, align 8
  br label %58

._crit_edge111.us.us:                             ; preds = %58
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv113115.us.us, i64 %indvars.iv120122.us
  store double %71, double* %57, align 8
  %indvars.iv.next114.us.us = add nuw nsw i64 %indvars.iv113115.us.us, 1
  %exitcond119.us = icmp eq i64 %indvars.iv.next114.us.us, 1200
  br i1 %exitcond119.us, label %._crit_edge108.us.loopexit, label %.lr.ph.us.us

; <label>:58:                                     ; preds = %58, %.lr.ph.us.us
  %59 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %71, %58 ]
  %indvars.iv109.us.us = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.us.us.1, %58 ]
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv109.us.us, i64 %indvars.iv120122.us
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv109.us.us, i64 %indvars.iv113115.us.us
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %59, %64
  store double %65, double* %56, align 8
  %indvars.iv.next.us.us = or i64 %indvars.iv109.us.us, 1
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.us.us, i64 %indvars.iv120122.us
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.us.us, i64 %indvars.iv113115.us.us
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %65, %70
  store double %71, double* %56, align 8
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv109.us.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.us.1, 1400
  br i1 %exitcond.us.1, label %._crit_edge111.us.us, label %58

._crit_edge125:                                   ; preds = %._crit_edge108.us
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %72, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge15.us
  %indvars.iv17.us = phi i64 [ %indvars.iv.next16.us, %._crit_edge15.us ], [ 0, %._crit_edge.us.preheader ]
  %6 = mul nsw i64 %indvars.iv17.us, 1200
  br label %7

; <label>:7:                                      ; preds = %._crit_edge12.us, %._crit_edge.us
  %indvars.iv14.us = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next.us, %._crit_edge12.us ]
  %8 = add nsw i64 %indvars.iv14.us, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge12.us

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv17.us, i64 %indvars.iv14.us
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv14.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %._crit_edge15.us, label %7

._crit_edge15.us:                                 ; preds = %._crit_edge12.us
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv17.us, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next16.us, 1200
  br i1 %exitcond20, label %._crit_edge19, label %._crit_edge.us

._crit_edge19:                                    ; preds = %._crit_edge15.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
