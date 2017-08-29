; ModuleID = 'A.ll'
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
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
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
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %4
  %indvars.iv5 = phi i64 [ 0, %4 ], [ %indvars.iv.next6, %14 ]
  %5 = trunc i64 %indvars.iv5 to i32
  %6 = sitofp i32 %5 to double
  br label %7

; <label>:7:                                      ; preds = %._crit_edge7, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge7 ], [ 0, %._crit_edge ]
  %8 = mul nsw i64 %indvars.iv5, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = fadd double %6, %11
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv5, i64 %indvars.iv
  store double %12, double* %13, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %14, label %._crit_edge7

._crit_edge7:                                     ; preds = %7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %7

; <label>:14:                                     ; preds = %7
  %indvars.iv.next6 = add nuw i64 %indvars.iv5, 1
  %15 = icmp slt i64 %indvars.iv.next6, 1400
  br i1 %15, label %._crit_edge, label %16

; <label>:16:                                     ; preds = %14
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) #0 {
  br i1 true, label %.lr.ph78, label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge:                          ; preds = %7
  br label %._crit_edge9

.lr.ph78:                                         ; preds = %7
  br i1 true, label %.lr.ph78..lr.ph78.split.us_crit_edge, label %.lr.ph78..lr.ph78.split_crit_edge

.lr.ph78..lr.ph78.split_crit_edge:                ; preds = %.lr.ph78
  br label %.lr.ph78.split

.lr.ph78..lr.ph78.split.us_crit_edge:             ; preds = %.lr.ph78
  br label %.lr.ph78.split.us

.lr.ph78.split.us:                                ; preds = %._crit_edge73.us, %.lr.ph78..lr.ph78.split.us_crit_edge
  %indvars.iv130 = phi i64 [ 0, %.lr.ph78..lr.ph78.split.us_crit_edge ], [ %indvars.iv.next131, %._crit_edge73.us ]
  %sext137 = shl i64 %indvars.iv130, 32
  %8 = ashr exact i64 %sext137, 32
  %9 = getelementptr inbounds double, double* %5, i64 %8
  store double 0.000000e+00, double* %9, align 8
  %10 = getelementptr inbounds double, double* %5, i64 %indvars.iv130
  %.pre = load double, double* %10, align 8
  br label %11

; <label>:11:                                     ; preds = %._crit_edge149, %.lr.ph78.split.us
  %12 = phi double [ %15, %._crit_edge149 ], [ %.pre, %.lr.ph78.split.us ]
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %._crit_edge149 ], [ 0, %.lr.ph78.split.us ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv126, i64 %indvars.iv130
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %10, align 8
  %exitcond129 = icmp eq i64 %indvars.iv126, 1399
  br i1 %exitcond129, label %._crit_edge73.us, label %._crit_edge149

._crit_edge149:                                   ; preds = %11
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  br label %11

._crit_edge73.us:                                 ; preds = %11
  %16 = fdiv double %15, %2
  store double %16, double* %10, align 8
  %indvars.iv.next131 = add i64 %indvars.iv130, 1
  %17 = icmp slt i64 %indvars.iv.next131, 1200
  br i1 %17, label %.lr.ph78.split.us, label %.lr.ph65.loopexit

.lr.ph65.loopexit:                                ; preds = %._crit_edge73.us
  br label %.lr.ph65

.lr.ph65:                                         ; preds = %.lr.ph65.loopexit, %.lr.ph78.split
  br i1 true, label %.lr.ph65..lr.ph65.split.us_crit_edge, label %.lr.ph65..lr.ph65.split_crit_edge

.lr.ph65..lr.ph65.split_crit_edge:                ; preds = %.lr.ph65
  br label %.lr.ph65.split

.lr.ph65..lr.ph65.split.us_crit_edge:             ; preds = %.lr.ph65
  br label %.lr.ph65.split.us

.lr.ph65.split.us:                                ; preds = %._crit_edge61.us, %.lr.ph65..lr.ph65.split.us_crit_edge
  %indvars.iv122 = phi i64 [ 0, %.lr.ph65..lr.ph65.split.us_crit_edge ], [ %indvars.iv.next123, %._crit_edge61.us ]
  %sext135 = shl i64 %indvars.iv122, 32
  %18 = ashr exact i64 %sext135, 32
  %19 = getelementptr inbounds double, double* %6, i64 %18
  store double 0.000000e+00, double* %19, align 8
  %20 = getelementptr inbounds double, double* %5, i64 %indvars.iv122
  %21 = getelementptr inbounds double, double* %6, i64 %indvars.iv122
  %.pre152 = load double, double* %21, align 8
  br label %._crit_edge85

._crit_edge85:                                    ; preds = %._crit_edge85, %.lr.ph65.split.us
  %22 = phi double [ %.pre152, %.lr.ph65.split.us ], [ %34, %._crit_edge85 ]
  %indvars.iv119 = phi i64 [ 0, %.lr.ph65.split.us ], [ %indvars.iv.next120.1, %._crit_edge85 ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv119, i64 %indvars.iv122
  %24 = load double, double* %23, align 8
  %25 = load double, double* %20, align 8
  %26 = fsub double %24, %25
  %27 = fmul double %26, %26
  %28 = fadd double %22, %27
  store double %28, double* %21, align 8
  %indvars.iv.next120 = or i64 %indvars.iv119, 1
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next120, i64 %indvars.iv122
  %30 = load double, double* %29, align 8
  %31 = load double, double* %20, align 8
  %32 = fsub double %30, %31
  %33 = fmul double %32, %32
  %34 = fadd double %28, %33
  store double %34, double* %21, align 8
  %indvars.iv.next120.1 = add nsw i64 %indvars.iv119, 2
  %35 = icmp slt i64 %indvars.iv.next120.1, 1400
  br i1 %35, label %._crit_edge85, label %._crit_edge61.us

._crit_edge61.us:                                 ; preds = %._crit_edge85
  %36 = fdiv double %34, %2
  store double %36, double* %21, align 8
  %37 = tail call double @sqrt(double %36) #4
  %38 = fcmp ugt double %37, 1.000000e-01
  %39 = select i1 %38, double %37, double 1.000000e+00
  store double %39, double* %21, align 8
  %indvars.iv.next123 = add i64 %indvars.iv122, 1
  %40 = icmp slt i64 %indvars.iv.next123, 1200
  br i1 %40, label %.lr.ph65.split.us, label %._crit_edge9.loopexit

.lr.ph78.split:                                   ; preds = %.lr.ph78..lr.ph78.split_crit_edge
  br label %.lr.ph65

._crit_edge9.loopexit:                            ; preds = %._crit_edge61.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.lr.ph65.split, %.._crit_edge9_crit_edge
  br i1 false, label %._crit_edge9.._crit_edge12_crit_edge, label %._crit_edge11.lr.ph.._crit_edge11.us_crit_edge

._crit_edge9.._crit_edge12_crit_edge:             ; preds = %._crit_edge9
  br label %._crit_edge12

._crit_edge11.lr.ph.._crit_edge11.us_crit_edge:   ; preds = %._crit_edge9
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge51.us, %._crit_edge11.lr.ph.._crit_edge11.us_crit_edge
  %indvars.iv117 = phi i64 [ 0, %._crit_edge11.lr.ph.._crit_edge11.us_crit_edge ], [ %indvars.iv.next118, %._crit_edge51.us ]
  br label %._crit_edge86

._crit_edge86:                                    ; preds = %._crit_edge86, %._crit_edge11.us
  %indvars.iv115 = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next116, %._crit_edge86 ]
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv115
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv117, i64 %indvars.iv115
  %44 = load double, double* %43, align 8
  %45 = fsub double %44, %42
  store double %45, double* %43, align 8
  %46 = tail call double @sqrt(double %2) #4
  %47 = getelementptr inbounds double, double* %6, i64 %indvars.iv115
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = load double, double* %43, align 8
  %51 = fdiv double %50, %49
  store double %51, double* %43, align 8
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %52 = icmp slt i64 %indvars.iv.next116, 1200
  br i1 %52, label %._crit_edge86, label %._crit_edge51.us

._crit_edge51.us:                                 ; preds = %._crit_edge86
  %indvars.iv.next118 = add i64 %indvars.iv117, 1
  %53 = icmp slt i64 %indvars.iv.next118, 1400
  br i1 %53, label %._crit_edge11.us, label %._crit_edge12.loopexit

.lr.ph65.split:                                   ; preds = %.lr.ph65..lr.ph65.split_crit_edge
  br label %._crit_edge9

._crit_edge12.loopexit:                           ; preds = %._crit_edge51.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %._crit_edge9.._crit_edge12_crit_edge
  br i1 true, label %.lr.ph28, label %._crit_edge12.._crit_edge12._crit_edge_crit_edge

._crit_edge12.._crit_edge12._crit_edge_crit_edge: ; preds = %._crit_edge12
  br label %._crit_edge12._crit_edge

.lr.ph28:                                         ; preds = %._crit_edge12
  br i1 true, label %.lr.ph28..lr.ph28.split.us_crit_edge, label %.lr.ph28..lr.ph28.split_crit_edge

.lr.ph28..lr.ph28.split_crit_edge:                ; preds = %.lr.ph28
  br label %.lr.ph28.split

.lr.ph28..lr.ph28.split.us_crit_edge:             ; preds = %.lr.ph28
  br label %.lr.ph28.split.us

.lr.ph28.split.us:                                ; preds = %._crit_edge22.us-lcssa.us.us..lr.ph28.split.us_crit_edge, %.lr.ph28..lr.ph28.split.us_crit_edge
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %._crit_edge22.us-lcssa.us.us..lr.ph28.split.us_crit_edge ], [ 0, %.lr.ph28..lr.ph28.split.us_crit_edge ]
  %storemerge327.us = phi i32 [ %58, %._crit_edge22.us-lcssa.us.us..lr.ph28.split.us_crit_edge ], [ 0, %.lr.ph28..lr.ph28.split.us_crit_edge ]
  %54 = sext i32 %storemerge327.us to i64
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %54, i64 %54
  store double 1.000000e+00, double* %55, align 8
  %storemerge418.us = add nsw i32 %storemerge327.us, 1
  %56 = icmp slt i32 %storemerge418.us, 1200
  br i1 %56, label %.lr.ph21.us, label %._crit_edge22.us-lcssa.us.us

._crit_edge22.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge16.us.us
  br label %._crit_edge22.us-lcssa.us.us

._crit_edge22.us-lcssa.us.us:                     ; preds = %._crit_edge22.us-lcssa.us.us.loopexit, %.lr.ph28.split.us
  %indvars.iv.next106 = add i64 %indvars.iv105, 1
  %57 = icmp slt i64 %indvars.iv.next106, 1199
  br i1 %57, label %._crit_edge22.us-lcssa.us.us..lr.ph28.split.us_crit_edge, label %._crit_edge12._crit_edge.loopexit

._crit_edge22.us-lcssa.us.us..lr.ph28.split.us_crit_edge: ; preds = %._crit_edge22.us-lcssa.us.us
  %58 = trunc i64 %indvars.iv.next106 to i32
  br label %.lr.ph28.split.us

.lr.ph21.us:                                      ; preds = %.lr.ph28.split.us
  %59 = sext i32 %storemerge418.us to i64
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge16.us.us, %.lr.ph21.us
  %indvars.iv103 = phi i64 [ %59, %.lr.ph21.us ], [ %indvars.iv.next104, %._crit_edge16.us.us ]
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv105, i64 %indvars.iv103
  store double 0.000000e+00, double* %60, align 8
  br label %63

._crit_edge16.us.us:                              ; preds = %63
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv103, i64 %indvars.iv105
  store double %70, double* %61, align 8
  %indvars.iv.next104 = add i64 %indvars.iv103, 1
  %62 = icmp slt i64 %indvars.iv.next104, 1200
  br i1 %62, label %.lr.ph.us.us, label %._crit_edge22.us-lcssa.us.us.loopexit

; <label>:63:                                     ; preds = %._crit_edge150, %.lr.ph.us.us
  %64 = phi double [ %70, %._crit_edge150 ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge150 ], [ 0, %.lr.ph.us.us ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv105
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv103
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fadd double %69, %64
  store double %70, double* %60, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1399
  br i1 %exitcond, label %._crit_edge16.us.us, label %._crit_edge150

._crit_edge150:                                   ; preds = %63
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %63

.lr.ph28.split:                                   ; preds = %._crit_edge22..lr.ph28.split_crit_edge, %.lr.ph28..lr.ph28.split_crit_edge
  br i1 undef, label %.lr.ph21, label %._crit_edge22

.lr.ph21:                                         ; preds = %.lr.ph28.split
  br label %71

; <label>:71:                                     ; preds = %._crit_edge151, %.lr.ph21
  br i1 true, label %._crit_edge22.loopexit, label %._crit_edge151

._crit_edge151:                                   ; preds = %71
  br label %71

._crit_edge22.loopexit:                           ; preds = %71
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %.lr.ph28.split
  br i1 false, label %._crit_edge22..lr.ph28.split_crit_edge, label %._crit_edge22.._crit_edge12._crit_edge_crit_edge

._crit_edge22.._crit_edge12._crit_edge_crit_edge: ; preds = %._crit_edge22
  br label %._crit_edge12._crit_edge

._crit_edge22..lr.ph28.split_crit_edge:           ; preds = %._crit_edge22
  br label %.lr.ph28.split

._crit_edge12._crit_edge.loopexit:                ; preds = %._crit_edge22.us-lcssa.us.us
  br label %._crit_edge12._crit_edge

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12._crit_edge.loopexit, %._crit_edge22.._crit_edge12._crit_edge_crit_edge, %._crit_edge12.._crit_edge12._crit_edge_crit_edge
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %72, align 8
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %._crit_edge2.lr.ph.._crit_edge2.us_crit_edge, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

._crit_edge2.lr.ph.._crit_edge2.us_crit_edge:     ; preds = %2
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge4.us, %._crit_edge2.lr.ph.._crit_edge2.us_crit_edge
  %indvars.iv12 = phi i64 [ 0, %._crit_edge2.lr.ph.._crit_edge2.us_crit_edge ], [ %indvars.iv.next13, %._crit_edge4.us ]
  %7 = mul nsw i64 %indvars.iv12, 1200
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %._crit_edge2.us
  %indvars.iv = phi i64 [ 0, %._crit_edge2.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %8 = add nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge.us

; <label>:12:                                     ; preds = %._crit_edge.us._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %18 = icmp slt i64 %indvars.iv.next, 1200
  br i1 %18, label %._crit_edge.us._crit_edge, label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next13 = add i64 %indvars.iv12, 1
  %19 = icmp slt i64 %indvars.iv.next13, 1200
  br i1 %19, label %._crit_edge2.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge4.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.._crit_edge_crit_edge
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
