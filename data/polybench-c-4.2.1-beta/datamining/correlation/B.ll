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
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %18 ]
  %3 = trunc i64 %indvars.iv4 to i32
  %4 = sitofp i32 %3 to double
  br label %5

; <label>:5:                                      ; preds = %5, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv, %indvars.iv4
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.200000e+03
  %10 = fadd double %4, %9
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  store double %10, double* %11, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv4
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.200000e+03
  %16 = fadd double %4, %15
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv.next
  store double %16, double* %17, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %18, label %5

; <label>:18:                                     ; preds = %5
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond6, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph38:
  br label %.lr.ph38.split.us

.lr.ph38.split.us:                                ; preds = %._crit_edge35.us, %.lr.ph38
  %indvars.iv93 = phi i64 [ 0, %.lr.ph38 ], [ %indvars.iv.next94, %._crit_edge35.us ]
  %7 = getelementptr inbounds double, double* %5, i64 %indvars.iv93
  store double 0.000000e+00, double* %7, align 8
  br label %.lr.ph38.split.us.new

.lr.ph38.split.us.new:                            ; preds = %.lr.ph38.split.us, %.lr.ph38.split.us.new
  %indvars.iv89 = phi i64 [ %indvars.iv.next90.3, %.lr.ph38.split.us.new ], [ 0, %.lr.ph38.split.us ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %indvars.iv93
  %9 = load double, double* %8, align 8
  %10 = load double, double* %7, align 8
  %11 = fadd double %9, %10
  store double %11, double* %7, align 8
  %indvars.iv.next90 = or i64 %indvars.iv89, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next90, i64 %indvars.iv93
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %7, align 8
  %indvars.iv.next90.1 = or i64 %indvars.iv89, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next90.1, i64 %indvars.iv93
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %7, align 8
  %indvars.iv.next90.2 = or i64 %indvars.iv89, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next90.2, i64 %indvars.iv93
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %7, align 8
  %indvars.iv.next90.3 = add nsw i64 %indvars.iv89, 4
  %exitcond122.3 = icmp eq i64 %indvars.iv.next90.3, 1400
  br i1 %exitcond122.3, label %._crit_edge35.us, label %.lr.ph38.split.us.new

._crit_edge35.us:                                 ; preds = %.lr.ph38.split.us.new
  %21 = load double, double* %7, align 8
  %22 = fdiv double %21, %2
  store double %22, double* %7, align 8
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond124 = icmp eq i64 %indvars.iv.next94, 1200
  br i1 %exitcond124, label %.lr.ph31.split.us.preheader, label %.lr.ph38.split.us

.lr.ph31.split.us.preheader:                      ; preds = %._crit_edge35.us
  br label %.lr.ph31.split.us

.lr.ph31.split.us:                                ; preds = %.lr.ph31.split.us.preheader, %._crit_edge29.us
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %._crit_edge29.us ], [ 0, %.lr.ph31.split.us.preheader ]
  %23 = getelementptr inbounds double, double* %6, i64 %indvars.iv81
  store double 0.000000e+00, double* %23, align 8
  %24 = getelementptr inbounds double, double* %5, i64 %indvars.iv81
  br label %.lr.ph31.split.us.new

.lr.ph31.split.us.new:                            ; preds = %.lr.ph31.split.us, %.lr.ph31.split.us.new
  %indvars.iv77 = phi i64 [ %indvars.iv.next78.1, %.lr.ph31.split.us.new ], [ 0, %.lr.ph31.split.us ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv77, i64 %indvars.iv81
  %26 = load double, double* %25, align 8
  %27 = load double, double* %24, align 8
  %28 = fsub double %26, %27
  %29 = fmul double %28, %28
  %30 = load double, double* %23, align 8
  %31 = fadd double %30, %29
  store double %31, double* %23, align 8
  %indvars.iv.next78 = or i64 %indvars.iv77, 1
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next78, i64 %indvars.iv81
  %33 = load double, double* %32, align 8
  %34 = load double, double* %24, align 8
  %35 = fsub double %33, %34
  %36 = fmul double %35, %35
  %37 = load double, double* %23, align 8
  %38 = fadd double %37, %36
  store double %38, double* %23, align 8
  %indvars.iv.next78.1 = add nsw i64 %indvars.iv77, 2
  %exitcond116.1 = icmp eq i64 %indvars.iv.next78.1, 1400
  br i1 %exitcond116.1, label %._crit_edge29.us, label %.lr.ph31.split.us.new

._crit_edge29.us:                                 ; preds = %.lr.ph31.split.us.new
  %39 = load double, double* %23, align 8
  %40 = fdiv double %39, %2
  store double %40, double* %23, align 8
  %41 = tail call double @sqrt(double %40) #4
  %42 = fcmp ugt double %41, 1.000000e-01
  %43 = select i1 %42, double %41, double 1.000000e+00
  store double %43, double* %23, align 8
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next82, 1200
  br i1 %exitcond118, label %._crit_edge12.us.preheader, label %.lr.ph31.split.us

._crit_edge12.us.preheader:                       ; preds = %._crit_edge29.us
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.preheader, %._crit_edge24.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge24.us ], [ 0, %._crit_edge12.us.preheader ]
  br label %44

; <label>:44:                                     ; preds = %44, %._crit_edge12.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %44 ], [ 0, %._crit_edge12.us ]
  %45 = getelementptr inbounds double, double* %5, i64 %indvars.iv68
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv72, i64 %indvars.iv68
  %48 = load double, double* %47, align 8
  %49 = fsub double %48, %46
  store double %49, double* %47, align 8
  %50 = tail call double @sqrt(double %2) #4
  %51 = getelementptr inbounds double, double* %6, i64 %indvars.iv68
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = load double, double* %47, align 8
  %55 = fdiv double %54, %53
  store double %55, double* %47, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next69, 1200
  br i1 %exitcond112, label %._crit_edge24.us, label %44

._crit_edge24.us:                                 ; preds = %44
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next73, 1400
  br i1 %exitcond114, label %._crit_edge14.us.preheader, label %._crit_edge12.us

._crit_edge14.us.preheader:                       ; preds = %._crit_edge24.us
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.preheader, %._crit_edge19.us-lcssa.us.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge19.us-lcssa.us.us ], [ 0, %._crit_edge14.us.preheader ]
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge19.us-lcssa.us.us ], [ 1, %._crit_edge14.us.preheader ]
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv54
  store double 1.000000e+00, double* %56, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %57 = icmp slt i64 %indvars.iv.next55, 1200
  br i1 %57, label %.lr.ph.us.us.preheader, label %._crit_edge19.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge14.us
  br label %.lr.ph.us.us

._crit_edge19.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge17.us.us
  br label %._crit_edge19.us-lcssa.us.us

._crit_edge19.us-lcssa.us.us:                     ; preds = %._crit_edge19.us-lcssa.us.us.loopexit, %._crit_edge14.us
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next55, 1199
  br i1 %exitcond105, label %._crit_edge21, label %._crit_edge14.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge17.us.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge17.us.us ], [ %indvars.iv48, %.lr.ph.us.us.preheader ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv50
  store double 0.000000e+00, double* %58, align 8
  br label %.lr.ph.us.us.new

._crit_edge17.us.us:                              ; preds = %.lr.ph.us.us.new
  %59 = bitcast double* %58 to i64*
  %60 = load i64, i64* %59, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv54
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, 1200
  br i1 %exitcond, label %._crit_edge19.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv54
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv50
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = load double, double* %58, align 8
  %69 = fadd double %68, %67
  store double %69, double* %58, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv54
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv50
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = load double, double* %58, align 8
  %76 = fadd double %75, %74
  store double %76, double* %58, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond102.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond102.1, label %._crit_edge17.us.us, label %.lr.ph.us.us.new

._crit_edge21:                                    ; preds = %._crit_edge19.us-lcssa.us.us
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %77, align 8
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

._crit_edge.us:                                   ; preds = %._crit_edge4.us, %._crit_edge.us.preheader
  %indvars.iv7 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next8, %._crit_edge4.us ]
  %6 = mul nsw i64 %indvars.iv7, 1200
  br label %7

; <label>:7:                                      ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2.us ], [ 0, %._crit_edge.us ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge2.us

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond12, label %._crit_edge4.us, label %7

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond, label %._crit_edge6, label %._crit_edge.us

._crit_edge6:                                     ; preds = %._crit_edge4.us
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
