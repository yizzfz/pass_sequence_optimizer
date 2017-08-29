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
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
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

._crit_edge:                                      ; preds = %22, %4
  %indvars.iv9 = phi i64 [ 0, %4 ], [ %indvars.iv.next10, %22 ]
  %5 = trunc i64 %indvars.iv9 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %9

; <label>:9:                                      ; preds = %9, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv, %indvars.iv9
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv9, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv9
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 1.200000e+03, double 1.200000e+03>
  %20 = fadd <2 x double> %8, %19
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %22, label %9

; <label>:22:                                     ; preds = %9
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, 1400
  br i1 %exitcond, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph120:
  br label %.lr.ph120.split.us

.lr.ph120.split.us:                               ; preds = %._crit_edge117.us, %.lr.ph120
  %indvars.iv191 = phi i64 [ 0, %.lr.ph120 ], [ %indvars.iv.next192, %._crit_edge117.us ]
  %7 = getelementptr inbounds double, double* %5, i64 %indvars.iv191
  store double 0.000000e+00, double* %7, align 8
  br label %.lr.ph120.split.us.new

.lr.ph120.split.us.new:                           ; preds = %.lr.ph120.split.us, %.lr.ph120.split.us.new
  %8 = phi double [ %20, %.lr.ph120.split.us.new ], [ 0.000000e+00, %.lr.ph120.split.us ]
  %indvars.iv182 = phi i64 [ %indvars.iv.next183.3, %.lr.ph120.split.us.new ], [ 0, %.lr.ph120.split.us ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv182, i64 %indvars.iv191
  %10 = load double, double* %9, align 8
  %11 = fadd double %10, %8
  store double %11, double* %7, align 8
  %indvars.iv.next183 = or i64 %indvars.iv182, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next183, i64 %indvars.iv191
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %7, align 8
  %indvars.iv.next183.1 = or i64 %indvars.iv182, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next183.1, i64 %indvars.iv191
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %7, align 8
  %indvars.iv.next183.2 = or i64 %indvars.iv182, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next183.2, i64 %indvars.iv191
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %7, align 8
  %indvars.iv.next183.3 = add nsw i64 %indvars.iv182, 4
  %exitcond185.3 = icmp eq i64 %indvars.iv.next183.3, 1400
  br i1 %exitcond185.3, label %._crit_edge117.us, label %.lr.ph120.split.us.new

._crit_edge117.us:                                ; preds = %.lr.ph120.split.us.new
  %21 = fdiv double %20, %2
  store double %21, double* %7, align 8
  %indvars.iv.next192 = add nuw nsw i64 %indvars.iv191, 1
  %exitcond194 = icmp eq i64 %indvars.iv.next192, 1200
  br i1 %exitcond194, label %.lr.ph113.split.us.preheader, label %.lr.ph120.split.us

.lr.ph113.split.us.preheader:                     ; preds = %._crit_edge117.us
  br label %.lr.ph113.split.us

.lr.ph113.split.us:                               ; preds = %.lr.ph113.split.us.preheader, %._crit_edge111.us
  %indvars.iv172 = phi i64 [ %indvars.iv.next173, %._crit_edge111.us ], [ 0, %.lr.ph113.split.us.preheader ]
  %22 = getelementptr inbounds double, double* %6, i64 %indvars.iv172
  store double 0.000000e+00, double* %22, align 8
  %23 = getelementptr inbounds double, double* %5, i64 %indvars.iv172
  br label %.lr.ph113.split.us.new

.lr.ph113.split.us.new:                           ; preds = %.lr.ph113.split.us, %.lr.ph113.split.us.new
  %24 = phi double [ %36, %.lr.ph113.split.us.new ], [ 0.000000e+00, %.lr.ph113.split.us ]
  %indvars.iv164 = phi i64 [ %indvars.iv.next165.1, %.lr.ph113.split.us.new ], [ 0, %.lr.ph113.split.us ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv164, i64 %indvars.iv172
  %26 = load double, double* %25, align 8
  %27 = load double, double* %23, align 8
  %28 = fsub double %26, %27
  %29 = fmul double %28, %28
  %30 = fadd double %24, %29
  store double %30, double* %22, align 8
  %indvars.iv.next165 = or i64 %indvars.iv164, 1
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next165, i64 %indvars.iv172
  %32 = load double, double* %31, align 8
  %33 = load double, double* %23, align 8
  %34 = fsub double %32, %33
  %35 = fmul double %34, %34
  %36 = fadd double %30, %35
  store double %36, double* %22, align 8
  %indvars.iv.next165.1 = add nuw nsw i64 %indvars.iv164, 2
  %exitcond167.1 = icmp eq i64 %indvars.iv.next165.1, 1400
  br i1 %exitcond167.1, label %._crit_edge111.us, label %.lr.ph113.split.us.new

._crit_edge111.us:                                ; preds = %.lr.ph113.split.us.new
  %37 = fdiv double %36, %2
  store double %37, double* %22, align 8
  %38 = tail call double @sqrt(double %37) #4
  %39 = fcmp ugt double %38, 1.000000e-01
  %40 = select i1 %39, double %38, double 1.000000e+00
  store double %40, double* %22, align 8
  %indvars.iv.next173 = add nuw nsw i64 %indvars.iv172, 1
  %exitcond175 = icmp eq i64 %indvars.iv.next173, 1200
  br i1 %exitcond175, label %._crit_edge91.us.preheader, label %.lr.ph113.split.us

._crit_edge91.us.preheader:                       ; preds = %._crit_edge111.us
  br label %._crit_edge91.us

._crit_edge91.us:                                 ; preds = %._crit_edge91.us.preheader, %._crit_edge106.us
  %indvars.iv159 = phi i64 [ %indvars.iv.next160, %._crit_edge106.us ], [ 0, %._crit_edge91.us.preheader ]
  br label %41

; <label>:41:                                     ; preds = %41, %._crit_edge91.us
  %indvars.iv155 = phi i64 [ %indvars.iv.next156, %41 ], [ 0, %._crit_edge91.us ]
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv155
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv159, i64 %indvars.iv155
  %45 = load double, double* %44, align 8
  %46 = fsub double %45, %43
  store double %46, double* %44, align 8
  %47 = tail call double @sqrt(double %2) #4
  %48 = getelementptr inbounds double, double* %6, i64 %indvars.iv155
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = load double, double* %44, align 8
  %52 = fdiv double %51, %50
  store double %52, double* %44, align 8
  %indvars.iv.next156 = add nuw nsw i64 %indvars.iv155, 1
  %exitcond158 = icmp eq i64 %indvars.iv.next156, 1200
  br i1 %exitcond158, label %._crit_edge106.us, label %41

._crit_edge106.us:                                ; preds = %41
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1
  %exitcond162 = icmp eq i64 %indvars.iv.next160, 1400
  br i1 %exitcond162, label %.lr.ph102.split.us.preheader, label %._crit_edge91.us

.lr.ph102.split.us.preheader:                     ; preds = %._crit_edge106.us
  br label %.lr.ph102.split.us

.lr.ph102.split.us:                               ; preds = %.lr.ph102.split.us.preheader, %._crit_edge100.us-lcssa.us.us
  %indvars.iv138 = phi i64 [ %indvars.iv.next139, %._crit_edge100.us-lcssa.us.us ], [ 0, %.lr.ph102.split.us.preheader ]
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %._crit_edge100.us-lcssa.us.us ], [ 1, %.lr.ph102.split.us.preheader ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv138, i64 %indvars.iv138
  store double 1.000000e+00, double* %53, align 8
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  br label %.lr.ph.us.us

._crit_edge100.us-lcssa.us.us:                    ; preds = %._crit_edge95.us.us.loopexit
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %exitcond141 = icmp eq i64 %indvars.iv.next139, 1199
  br i1 %exitcond141, label %._crit_edge103, label %.lr.ph102.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph102.split.us, %._crit_edge95.us.us.loopexit
  %indvars.iv134 = phi i64 [ %indvars.iv.next135, %._crit_edge95.us.us.loopexit ], [ %indvars.iv132, %.lr.ph102.split.us ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv138, i64 %indvars.iv134
  store double 0.000000e+00, double* %54, align 8
  br label %.lr.ph.us.us.new

._crit_edge95.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv134, i64 %indvars.iv138
  store double %68, double* %55, align 8
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %exitcond = icmp eq i64 %indvars.iv.next135, 1200
  br i1 %exitcond, label %._crit_edge100.us-lcssa.us.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %56 = phi double [ %68, %.lr.ph.us.us.new ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv138
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv134
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fadd double %56, %61
  store double %62, double* %54, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv138
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv134
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fadd double %62, %67
  store double %68, double* %54, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge95.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge103:                                   ; preds = %._crit_edge100.us-lcssa.us.us
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %69, align 8
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
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge12.us, %._crit_edge.us.preheader
  %indvars.iv16 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next17, %._crit_edge12.us ]
  %6 = mul nuw nsw i64 %indvars.iv16, 1200
  br label %7

; <label>:7:                                      ; preds = %._crit_edge10.us, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge10.us ], [ 0, %._crit_edge.us ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge10.us

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge12.us, label %7

._crit_edge12.us:                                 ; preds = %._crit_edge10.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond19, label %._crit_edge15, label %._crit_edge.us

._crit_edge15:                                    ; preds = %._crit_edge12.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
