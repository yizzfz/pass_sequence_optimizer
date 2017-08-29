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

._crit_edge:                                      ; preds = %18, %2
  %indvars.iv13 = phi i64 [ 0, %2 ], [ %indvars.iv.next14, %18 ]
  %3 = trunc i64 %indvars.iv13 to i32
  %4 = sitofp i32 %3 to double
  br label %5

; <label>:5:                                      ; preds = %5, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv, %indvars.iv13
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.200000e+03
  %10 = fadd double %4, %9
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  store double %10, double* %11, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv13
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.200000e+03
  %16 = fadd double %4, %15
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv.next
  store double %16, double* %17, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1199
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %18, label %5

; <label>:18:                                     ; preds = %5
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1400
  br i1 %exitcond15, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph142:
  br label %.lr.ph142.split.us

.lr.ph142.split.us:                               ; preds = %._crit_edge139.us, %.lr.ph142
  %indvars.iv182 = phi i64 [ 0, %.lr.ph142 ], [ %indvars.iv.next183, %._crit_edge139.us ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv182
  store double 0.000000e+00, double* %5, align 8
  br label %6

; <label>:6:                                      ; preds = %6, %.lr.ph142.split.us
  %7 = phi double [ 0.000000e+00, %.lr.ph142.split.us ], [ %22, %6 ]
  %indvars.iv178 = phi i64 [ 0, %.lr.ph142.split.us ], [ %indvars.iv.next179.4, %6 ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv178, i64 %indvars.iv182
  %9 = load double, double* %8, align 8
  %10 = fadd double %9, %7
  store double %10, double* %5, align 8
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next179, i64 %indvars.iv182
  %12 = load double, double* %11, align 8
  %13 = fadd double %12, %10
  store double %13, double* %5, align 8
  %indvars.iv.next179.1 = add nsw i64 %indvars.iv178, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next179.1, i64 %indvars.iv182
  %15 = load double, double* %14, align 8
  %16 = fadd double %15, %13
  store double %16, double* %5, align 8
  %indvars.iv.next179.2 = add nsw i64 %indvars.iv178, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next179.2, i64 %indvars.iv182
  %18 = load double, double* %17, align 8
  %19 = fadd double %18, %16
  store double %19, double* %5, align 8
  %indvars.iv.next179.3 = add nsw i64 %indvars.iv178, 4
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next179.3, i64 %indvars.iv182
  %21 = load double, double* %20, align 8
  %22 = fadd double %21, %19
  store double %22, double* %5, align 8
  %exitcond181.4 = icmp eq i64 %indvars.iv.next179.3, 1399
  %indvars.iv.next179.4 = add nsw i64 %indvars.iv178, 5
  br i1 %exitcond181.4, label %._crit_edge139.us, label %6

._crit_edge139.us:                                ; preds = %6
  %23 = fdiv double %22, %0
  store double %23, double* %5, align 8
  %indvars.iv.next183 = add nuw nsw i64 %indvars.iv182, 1
  %exitcond200 = icmp eq i64 %indvars.iv.next183, 1200
  br i1 %exitcond200, label %.lr.ph135.split.us.preheader, label %.lr.ph142.split.us

.lr.ph135.split.us.preheader:                     ; preds = %._crit_edge139.us
  br label %.lr.ph135.split.us

.lr.ph135.split.us:                               ; preds = %.lr.ph135.split.us.preheader, %._crit_edge.us
  %indvars.iv174 = phi i64 [ %indvars.iv.next175, %._crit_edge.us ], [ 0, %.lr.ph135.split.us.preheader ]
  %24 = getelementptr inbounds double, double* %4, i64 %indvars.iv174
  store double 0.000000e+00, double* %24, align 8
  %25 = getelementptr inbounds double, double* %3, i64 %indvars.iv174
  br label %28

; <label>:26:                                     ; preds = %._crit_edge133.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge133.us, %26
  %27 = phi double [ %43, %26 ], [ 1.000000e+00, %._crit_edge133.us ]
  store double %27, double* %24, align 8
  %indvars.iv.next175 = add nuw nsw i64 %indvars.iv174, 1
  %exitcond198 = icmp eq i64 %indvars.iv.next175, 1200
  br i1 %exitcond198, label %._crit_edge111.us.preheader, label %.lr.ph135.split.us

._crit_edge111.us.preheader:                      ; preds = %._crit_edge.us
  br label %._crit_edge111.us

; <label>:28:                                     ; preds = %28, %.lr.ph135.split.us
  %29 = phi double [ 0.000000e+00, %.lr.ph135.split.us ], [ %41, %28 ]
  %indvars.iv170 = phi i64 [ 0, %.lr.ph135.split.us ], [ %indvars.iv.next171.1, %28 ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv170, i64 %indvars.iv174
  %31 = load double, double* %30, align 8
  %32 = load double, double* %25, align 8
  %33 = fsub double %31, %32
  %34 = fmul double %33, %33
  %35 = fadd double %29, %34
  store double %35, double* %24, align 8
  %indvars.iv.next171 = or i64 %indvars.iv170, 1
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next171, i64 %indvars.iv174
  %37 = load double, double* %36, align 8
  %38 = load double, double* %25, align 8
  %39 = fsub double %37, %38
  %40 = fmul double %39, %39
  %41 = fadd double %35, %40
  store double %41, double* %24, align 8
  %exitcond173.1 = icmp eq i64 %indvars.iv.next171, 1399
  %indvars.iv.next171.1 = add nsw i64 %indvars.iv170, 2
  br i1 %exitcond173.1, label %._crit_edge133.us, label %28

._crit_edge133.us:                                ; preds = %28
  %42 = fdiv double %41, %0
  store double %42, double* %24, align 8
  %43 = tail call double @sqrt(double %42) #4
  store double %43, double* %24, align 8
  %44 = fcmp ugt double %43, 1.000000e-01
  br i1 %44, label %26, label %._crit_edge.us

._crit_edge111.us:                                ; preds = %._crit_edge111.us.preheader, %._crit_edge128.us
  %indvars.iv167 = phi i64 [ %indvars.iv.next168, %._crit_edge128.us ], [ 0, %._crit_edge111.us.preheader ]
  br label %45

; <label>:45:                                     ; preds = %45, %._crit_edge111.us
  %indvars.iv163 = phi i64 [ %indvars.iv.next164, %45 ], [ 0, %._crit_edge111.us ]
  %46 = getelementptr inbounds double, double* %3, i64 %indvars.iv163
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv167, i64 %indvars.iv163
  %49 = load double, double* %48, align 8
  %50 = fsub double %49, %47
  store double %50, double* %48, align 8
  %51 = tail call double @sqrt(double %0) #4
  %52 = getelementptr inbounds double, double* %4, i64 %indvars.iv163
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = load double, double* %48, align 8
  %56 = fdiv double %55, %54
  store double %56, double* %48, align 8
  %exitcond166 = icmp eq i64 %indvars.iv163, 1199
  %indvars.iv.next164 = add nuw nsw i64 %indvars.iv163, 1
  br i1 %exitcond166, label %._crit_edge128.us, label %45

._crit_edge128.us:                                ; preds = %45
  %indvars.iv.next168 = add nuw nsw i64 %indvars.iv167, 1
  %exitcond197 = icmp eq i64 %indvars.iv.next168, 1400
  br i1 %exitcond197, label %._crit_edge113.us.preheader, label %._crit_edge111.us

._crit_edge113.us.preheader:                      ; preds = %._crit_edge128.us
  br label %._crit_edge113.us

._crit_edge113.us:                                ; preds = %._crit_edge113.us.preheader, %._crit_edge118.us-lcssa.us.us
  %indvars.iv152 = phi i64 [ %indvars.iv.next153, %._crit_edge118.us-lcssa.us.us ], [ 0, %._crit_edge113.us.preheader ]
  %indvars.iv148 = phi i64 [ %indvars.iv.next149, %._crit_edge118.us-lcssa.us.us ], [ 1, %._crit_edge113.us.preheader ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv152, i64 %indvars.iv152
  store double 1.000000e+00, double* %57, align 8
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  br label %.lr.ph.us.us

._crit_edge118.us-lcssa.us.us:                    ; preds = %._crit_edge116.us.us
  %indvars.iv.next149 = add nuw nsw i64 %indvars.iv148, 1
  %exitcond195 = icmp eq i64 %indvars.iv.next153, 1199
  br i1 %exitcond195, label %._crit_edge120, label %._crit_edge113.us

.lr.ph.us.us:                                     ; preds = %._crit_edge116.us.us, %._crit_edge113.us
  %indvars.iv150 = phi i64 [ %indvars.iv.next151, %._crit_edge116.us.us ], [ %indvars.iv148, %._crit_edge113.us ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv152, i64 %indvars.iv150
  store double 0.000000e+00, double* %58, align 8
  br label %60

._crit_edge116.us.us:                             ; preds = %60
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv150, i64 %indvars.iv152
  store double %73, double* %59, align 8
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %exitcond194 = icmp eq i64 %indvars.iv.next151, 1200
  br i1 %exitcond194, label %._crit_edge118.us-lcssa.us.us, label %.lr.ph.us.us

; <label>:60:                                     ; preds = %60, %.lr.ph.us.us
  %61 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %73, %60 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %60 ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv152
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv150
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fadd double %61, %66
  store double %67, double* %58, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv152
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv150
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fadd double %67, %72
  store double %73, double* %58, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1399
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge116.us.us, label %60

._crit_edge120:                                   ; preds = %._crit_edge118.us-lcssa.us.us
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %74, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.._crit_edge11.us_crit_edge:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge13.us, %.._crit_edge11.us_crit_edge
  %indvars.iv16 = phi i64 [ 0, %.._crit_edge11.us_crit_edge ], [ %indvars.iv.next17, %._crit_edge13.us ]
  %5 = mul nuw nsw i64 %indvars.iv16, 1200
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %._crit_edge11.us
  %indvars.iv = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge.us

; <label>:10:                                     ; preds = %._crit_edge.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge13.us, label %._crit_edge.us._crit_edge

._crit_edge13.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond18, label %._crit_edge15, label %._crit_edge11.us

._crit_edge15:                                    ; preds = %._crit_edge13.us
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
