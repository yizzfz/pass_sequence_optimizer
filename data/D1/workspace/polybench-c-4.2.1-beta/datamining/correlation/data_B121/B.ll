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
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %.preheader

.preheader:                                       ; preds = %19, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %19 ]
  %3 = trunc i64 %indvars.iv4 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv4
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv4
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph38:
  br label %.lr.ph38.split.us

.lr.ph38.split.us:                                ; preds = %._crit_edge35.us, %.lr.ph38
  %indvars.iv109 = phi i64 [ 0, %.lr.ph38 ], [ %indvars.iv.next110, %._crit_edge35.us ]
  %7 = getelementptr inbounds double, double* %5, i64 %indvars.iv109
  store double 0.000000e+00, double* %7, align 8
  br label %.lr.ph38.split.us.new

.lr.ph38.split.us.new:                            ; preds = %.lr.ph38.split.us, %.lr.ph38.split.us.new
  %indvars.iv99 = phi i64 [ %indvars.iv.next100.3, %.lr.ph38.split.us.new ], [ 0, %.lr.ph38.split.us ]
  %8 = phi double [ %20, %.lr.ph38.split.us.new ], [ 0.000000e+00, %.lr.ph38.split.us ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv99, i64 %indvars.iv109
  %10 = load double, double* %9, align 8
  %11 = fadd double %10, %8
  store double %11, double* %7, align 8
  %indvars.iv.next100 = or i64 %indvars.iv99, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next100, i64 %indvars.iv109
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %7, align 8
  %indvars.iv.next100.1 = or i64 %indvars.iv99, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next100.1, i64 %indvars.iv109
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %7, align 8
  %indvars.iv.next100.2 = or i64 %indvars.iv99, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next100.2, i64 %indvars.iv109
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %7, align 8
  %indvars.iv.next100.3 = add nsw i64 %indvars.iv99, 4
  %exitcond102.3 = icmp eq i64 %indvars.iv.next100.3, 1400
  br i1 %exitcond102.3, label %._crit_edge35.us, label %.lr.ph38.split.us.new

._crit_edge35.us:                                 ; preds = %.lr.ph38.split.us.new
  %21 = fdiv double %20, %2
  store double %21, double* %7, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next110, 1200
  br i1 %exitcond112, label %.lr.ph31.split.us.preheader, label %.lr.ph38.split.us

.lr.ph31.split.us.preheader:                      ; preds = %._crit_edge35.us
  br label %.lr.ph31.split.us

.lr.ph31.split.us:                                ; preds = %.lr.ph31.split.us.preheader, %._crit_edge29.us
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %._crit_edge29.us ], [ 0, %.lr.ph31.split.us.preheader ]
  %22 = getelementptr inbounds double, double* %6, i64 %indvars.iv89
  store double 0.000000e+00, double* %22, align 8
  %23 = getelementptr inbounds double, double* %5, i64 %indvars.iv89
  br label %.lr.ph31.split.us.new

.lr.ph31.split.us.new:                            ; preds = %.lr.ph31.split.us, %.lr.ph31.split.us.new
  %indvars.iv80 = phi i64 [ %indvars.iv.next81.1, %.lr.ph31.split.us.new ], [ 0, %.lr.ph31.split.us ]
  %24 = phi double [ %36, %.lr.ph31.split.us.new ], [ 0.000000e+00, %.lr.ph31.split.us ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv80, i64 %indvars.iv89
  %26 = load double, double* %25, align 8
  %27 = load double, double* %23, align 8
  %28 = fsub double %26, %27
  %29 = fmul double %28, %28
  %30 = fadd double %24, %29
  store double %30, double* %22, align 8
  %indvars.iv.next81 = or i64 %indvars.iv80, 1
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next81, i64 %indvars.iv89
  %32 = load double, double* %31, align 8
  %33 = load double, double* %23, align 8
  %34 = fsub double %32, %33
  %35 = fmul double %34, %34
  %36 = fadd double %30, %35
  store double %36, double* %22, align 8
  %indvars.iv.next81.1 = add nsw i64 %indvars.iv80, 2
  %exitcond83.1 = icmp eq i64 %indvars.iv.next81.1, 1400
  br i1 %exitcond83.1, label %._crit_edge29.us, label %.lr.ph31.split.us.new

._crit_edge29.us:                                 ; preds = %.lr.ph31.split.us.new
  %37 = fdiv double %36, %2
  store double %37, double* %22, align 8
  %38 = tail call double @sqrt(double %37) #4
  %39 = fcmp ole double %38, 1.000000e-01
  %40 = select i1 %39, double 1.000000e+00, double %38
  store double %40, double* %22, align 8
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next90, 1200
  br i1 %exitcond92, label %.preheader6.us.preheader, label %.lr.ph31.split.us

.preheader6.us.preheader:                         ; preds = %._crit_edge29.us
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %.preheader6.us.preheader, %._crit_edge24.us
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %._crit_edge24.us ], [ 0, %.preheader6.us.preheader ]
  br label %._crit_edge122

._crit_edge122:                                   ; preds = %._crit_edge122, %.preheader6.us
  %indvars.iv71 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next72, %._crit_edge122 ]
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv71
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv75, i64 %indvars.iv71
  %44 = load double, double* %43, align 8
  %45 = fsub double %44, %42
  store double %45, double* %43, align 8
  %46 = tail call double @sqrt(double %2) #4
  %47 = getelementptr inbounds double, double* %6, i64 %indvars.iv71
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = load double, double* %43, align 8
  %51 = fdiv double %50, %49
  store double %51, double* %43, align 8
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next72, 1200
  br i1 %exitcond74, label %._crit_edge24.us, label %._crit_edge122

._crit_edge24.us:                                 ; preds = %._crit_edge122
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next76, 1400
  br i1 %exitcond78, label %.lr.ph14.split.us.preheader, label %.preheader6.us

.lr.ph14.split.us.preheader:                      ; preds = %._crit_edge24.us
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %.lr.ph14.split.us.preheader, %.loopexit.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %.loopexit.us ], [ 0, %.lr.ph14.split.us.preheader ]
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %.loopexit.us ], [ 1, %.lr.ph14.split.us.preheader ]
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv54
  store double 1.000000e+00, double* %52, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %53 = icmp slt i64 %indvars.iv.next55, 1200
  br i1 %53, label %.lr.ph.us.us.preheader, label %.loopexit.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph14.split.us
  br label %.lr.ph.us.us

.loopexit.us.loopexit:                            ; preds = %._crit_edge.us.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.lr.ph14.split.us
  %exitcond57 = icmp eq i64 %indvars.iv.next55, 1199
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  br i1 %exitcond57, label %._crit_edge15, label %.lr.ph14.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge.us.us ], [ %indvars.iv48, %.lr.ph.us.us.preheader ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv50
  store double 0.000000e+00, double* %54, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv54
  store double %68, double* %55, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, 1200
  br i1 %exitcond, label %.loopexit.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %56 = phi double [ %68, %.lr.ph.us.us.new ], [ 0.000000e+00, %.lr.ph.us.us ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv54
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv50
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fadd double %56, %61
  store double %62, double* %54, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv54
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv50
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fadd double %62, %67
  store double %68, double* %54, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

._crit_edge15:                                    ; preds = %.loopexit.us
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %69, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv5, 1200
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge9, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge9

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
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
