; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  call void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call void @print_array(i32 1200, [1200 x double]* %10)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, [1200 x double]*) #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %.preheader

.preheader:                                       ; preds = %20, %4
  %indvars.iv9 = phi i64 [ 0, %4 ], [ %indvars.iv.next10, %20 ]
  %5 = trunc i64 %indvars.iv9 to i32
  %6 = sitofp i32 %5 to double
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv9
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = fadd double %6, %11
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv9, i64 %indvars.iv
  store double %12, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv9
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.200000e+03
  %18 = fadd double %6, %17
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv9, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, 1400
  br i1 %exitcond, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) #0 {
.lr.ph125:
  br label %.lr.ph125.split.us

.lr.ph125.split.us:                               ; preds = %._crit_edge122.us, %.lr.ph125
  %indvars.iv189 = phi i64 [ 0, %.lr.ph125 ], [ %indvars.iv.next190, %._crit_edge122.us ]
  %7 = getelementptr inbounds double, double* %5, i64 %indvars.iv189
  store double 0.000000e+00, double* %7, align 8
  br label %.lr.ph125.split.us.new

.lr.ph125.split.us.new:                           ; preds = %.lr.ph125.split.us, %.lr.ph125.split.us.new
  %indvars.iv180 = phi i64 [ %indvars.iv.next181.3, %.lr.ph125.split.us.new ], [ 0, %.lr.ph125.split.us ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv180, i64 %indvars.iv189
  %9 = load double, double* %8, align 8
  %10 = load double, double* %7, align 8
  %11 = fadd double %9, %10
  store double %11, double* %7, align 8
  %indvars.iv.next181 = or i64 %indvars.iv180, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next181, i64 %indvars.iv189
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %7, align 8
  %indvars.iv.next181.1 = or i64 %indvars.iv180, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next181.1, i64 %indvars.iv189
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %7, align 8
  %indvars.iv.next181.2 = or i64 %indvars.iv180, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next181.2, i64 %indvars.iv189
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %7, align 8
  %indvars.iv.next181.3 = add nsw i64 %indvars.iv180, 4
  %exitcond183.3 = icmp eq i64 %indvars.iv.next181.3, 1400
  br i1 %exitcond183.3, label %._crit_edge122.us, label %.lr.ph125.split.us.new

._crit_edge122.us:                                ; preds = %.lr.ph125.split.us.new
  %21 = load double, double* %7, align 8
  %22 = fdiv double %21, %2
  store double %22, double* %7, align 8
  %indvars.iv.next190 = add nuw nsw i64 %indvars.iv189, 1
  %exitcond192 = icmp eq i64 %indvars.iv.next190, 1200
  br i1 %exitcond192, label %.lr.ph118.split.us.preheader, label %.lr.ph125.split.us

.lr.ph118.split.us.preheader:                     ; preds = %._crit_edge122.us
  br label %.lr.ph118.split.us

.lr.ph118.split.us:                               ; preds = %.lr.ph118.split.us.preheader, %._crit_edge116.us
  %indvars.iv170 = phi i64 [ %indvars.iv.next171, %._crit_edge116.us ], [ 0, %.lr.ph118.split.us.preheader ]
  %23 = getelementptr inbounds double, double* %6, i64 %indvars.iv170
  store double 0.000000e+00, double* %23, align 8
  %24 = getelementptr inbounds double, double* %5, i64 %indvars.iv170
  br label %.lr.ph118.split.us.new

.lr.ph118.split.us.new:                           ; preds = %.lr.ph118.split.us, %.lr.ph118.split.us.new
  %indvars.iv162 = phi i64 [ %indvars.iv.next163.1, %.lr.ph118.split.us.new ], [ 0, %.lr.ph118.split.us ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv162, i64 %indvars.iv170
  %26 = load double, double* %25, align 8
  %27 = load double, double* %24, align 8
  %28 = fsub double %26, %27
  %29 = fmul double %28, %28
  %30 = load double, double* %23, align 8
  %31 = fadd double %30, %29
  store double %31, double* %23, align 8
  %indvars.iv.next163 = or i64 %indvars.iv162, 1
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next163, i64 %indvars.iv170
  %33 = load double, double* %32, align 8
  %34 = load double, double* %24, align 8
  %35 = fsub double %33, %34
  %36 = fmul double %35, %35
  %37 = load double, double* %23, align 8
  %38 = fadd double %37, %36
  store double %38, double* %23, align 8
  %indvars.iv.next163.1 = add nsw i64 %indvars.iv162, 2
  %exitcond165.1 = icmp eq i64 %indvars.iv.next163.1, 1400
  br i1 %exitcond165.1, label %._crit_edge116.us, label %.lr.ph118.split.us.new

._crit_edge116.us:                                ; preds = %.lr.ph118.split.us.new
  %39 = load double, double* %23, align 8
  %40 = fdiv double %39, %2
  store double %40, double* %23, align 8
  %41 = tail call double @sqrt(double %40) #4
  %42 = fcmp ugt double %41, 1.000000e-01
  %43 = select i1 %42, double %41, double 1.000000e+00
  store double %43, double* %23, align 8
  %indvars.iv.next171 = add nuw nsw i64 %indvars.iv170, 1
  %exitcond173 = icmp eq i64 %indvars.iv.next171, 1200
  br i1 %exitcond173, label %.preheader90.us.preheader, label %.lr.ph118.split.us

.preheader90.us.preheader:                        ; preds = %._crit_edge116.us
  br label %.preheader90.us

.preheader90.us:                                  ; preds = %.preheader90.us.preheader, %._crit_edge111.us
  %indvars.iv157 = phi i64 [ %indvars.iv.next158, %._crit_edge111.us ], [ 0, %.preheader90.us.preheader ]
  br label %44

; <label>:44:                                     ; preds = %44, %.preheader90.us
  %indvars.iv153 = phi i64 [ 0, %.preheader90.us ], [ %indvars.iv.next154, %44 ]
  %45 = getelementptr inbounds double, double* %5, i64 %indvars.iv153
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv157, i64 %indvars.iv153
  %48 = load double, double* %47, align 8
  %49 = fsub double %48, %46
  store double %49, double* %47, align 8
  %50 = tail call double @sqrt(double %2) #4
  %51 = getelementptr inbounds double, double* %6, i64 %indvars.iv153
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = load double, double* %47, align 8
  %55 = fdiv double %54, %53
  store double %55, double* %47, align 8
  %indvars.iv.next154 = add nuw nsw i64 %indvars.iv153, 1
  %exitcond156 = icmp eq i64 %indvars.iv.next154, 1200
  br i1 %exitcond156, label %._crit_edge111.us, label %44

._crit_edge111.us:                                ; preds = %44
  %indvars.iv.next158 = add nuw nsw i64 %indvars.iv157, 1
  %exitcond160 = icmp eq i64 %indvars.iv.next158, 1400
  br i1 %exitcond160, label %.lr.ph100.split.us.preheader, label %.preheader90.us

.lr.ph100.split.us.preheader:                     ; preds = %._crit_edge111.us
  br label %.lr.ph100.split.us

.lr.ph100.split.us:                               ; preds = %.lr.ph100.split.us.preheader, %._crit_edge98.us-lcssa.us.us
  %indvars.iv136 = phi i64 [ %indvars.iv.next137, %._crit_edge98.us-lcssa.us.us ], [ 0, %.lr.ph100.split.us.preheader ]
  %indvars.iv130 = phi i64 [ %indvars.iv.next131, %._crit_edge98.us-lcssa.us.us ], [ 1, %.lr.ph100.split.us.preheader ]
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv136, i64 %indvars.iv136
  store double 1.000000e+00, double* %56, align 8
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %57 = icmp slt i64 %indvars.iv.next137, 1200
  br i1 %57, label %.lr.ph.us.us.preheader, label %._crit_edge98.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph100.split.us
  br label %.lr.ph.us.us

._crit_edge98.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge.us.us
  br label %._crit_edge98.us-lcssa.us.us

._crit_edge98.us-lcssa.us.us:                     ; preds = %._crit_edge98.us-lcssa.us.us.loopexit, %.lr.ph100.split.us
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %exitcond139 = icmp eq i64 %indvars.iv.next137, 1199
  br i1 %exitcond139, label %._crit_edge101, label %.lr.ph100.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %._crit_edge.us.us ], [ %indvars.iv130, %.lr.ph.us.us.preheader ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv136, i64 %indvars.iv132
  store double 0.000000e+00, double* %58, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %59 = bitcast double* %58 to i64*
  %60 = load i64, i64* %59, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv132, i64 %indvars.iv136
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %exitcond = icmp eq i64 %indvars.iv.next133, 1200
  br i1 %exitcond, label %._crit_edge98.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv136
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv132
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = load double, double* %58, align 8
  %69 = fadd double %68, %67
  store double %69, double* %58, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv136
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv132
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = load double, double* %58, align 8
  %76 = fadd double %75, %74
  store double %76, double* %58, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

._crit_edge101:                                   ; preds = %._crit_edge98.us-lcssa.us.us
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %77, align 8
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv13, 1200
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %14 ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond16, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
