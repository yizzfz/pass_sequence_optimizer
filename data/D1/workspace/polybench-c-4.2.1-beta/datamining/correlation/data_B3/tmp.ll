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
define i32 @main(i32, i8** nocapture readonly) #0 {
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
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  tail call void @print_array(i32 1200, [1200 x double]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %.preheader

.preheader:                                       ; preds = %22, %4
  %indvars.iv9 = phi i64 [ 0, %4 ], [ %indvars.iv.next10, %22 ]
  %5 = trunc i64 %indvars.iv9 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %9 ]
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
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %22, label %9

; <label>:22:                                     ; preds = %9
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, 1400
  br i1 %exitcond, label %23, label %.preheader

; <label>:23:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) #0 {
  %sunkaddr142 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  br label %8

; <label>:8:                                      ; preds = %24, %7
  %indvars.iv126 = phi i64 [ 0, %7 ], [ %indvars.iv.next127, %24 ]
  %9 = getelementptr inbounds double, double* %5, i64 %indvars.iv126
  store double 0.000000e+00, double* %9, align 8
  %sunkaddr139 = shl i64 %indvars.iv126, 3
  %sunkaddr140 = add i64 %sunkaddr, %sunkaddr139
  %sunkaddr141 = inttoptr i64 %sunkaddr140 to double*
  br label %10

; <label>:10:                                     ; preds = %10, %8
  %indvars.iv123 = phi i64 [ 0, %8 ], [ %indvars.iv.next124.3, %10 ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %indvars.iv126
  %12 = load double, double* %11, align 8
  %13 = load double, double* %sunkaddr141, align 8
  %14 = fadd double %12, %13
  store double %14, double* %sunkaddr141, align 8
  %indvars.iv.next124 = or i64 %indvars.iv123, 1
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next124, i64 %indvars.iv126
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %sunkaddr141, align 8
  %indvars.iv.next124.1 = or i64 %indvars.iv123, 2
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next124.1, i64 %indvars.iv126
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %sunkaddr141, align 8
  %indvars.iv.next124.2 = or i64 %indvars.iv123, 3
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next124.2, i64 %indvars.iv126
  %22 = load double, double* %21, align 8
  %23 = fadd double %22, %20
  store double %23, double* %sunkaddr141, align 8
  %indvars.iv.next124.3 = add nsw i64 %indvars.iv123, 4
  %exitcond125.3 = icmp eq i64 %indvars.iv.next124.3, 1400
  br i1 %exitcond125.3, label %24, label %10

; <label>:24:                                     ; preds = %10
  %sunkaddr143 = shl i64 %indvars.iv126, 3
  %sunkaddr144 = add i64 %sunkaddr142, %sunkaddr143
  %sunkaddr145 = inttoptr i64 %sunkaddr144 to double*
  %25 = load double, double* %sunkaddr145, align 8
  %26 = fdiv double %25, %2
  store double %26, double* %sunkaddr145, align 8
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next127, 1200
  br i1 %exitcond128, label %.preheader92.preheader, label %8

.preheader92.preheader:                           ; preds = %24
  %sunkaddr154 = ptrtoint double* %6 to i64
  %sunkaddr146 = ptrtoint double* %5 to i64
  %sunkaddr150 = ptrtoint double* %6 to i64
  br label %.preheader92

.preheader92:                                     ; preds = %43, %.preheader92.preheader
  %indvars.iv120 = phi i64 [ 0, %.preheader92.preheader ], [ %indvars.iv.next121, %43 ]
  %27 = getelementptr inbounds double, double* %6, i64 %indvars.iv120
  store double 0.000000e+00, double* %27, align 8
  %sunkaddr147 = shl i64 %indvars.iv120, 3
  %sunkaddr148 = add i64 %sunkaddr146, %sunkaddr147
  %sunkaddr149 = inttoptr i64 %sunkaddr148 to double*
  %sunkaddr151 = shl i64 %indvars.iv120, 3
  %sunkaddr152 = add i64 %sunkaddr150, %sunkaddr151
  %sunkaddr153 = inttoptr i64 %sunkaddr152 to double*
  br label %28

; <label>:28:                                     ; preds = %28, %.preheader92
  %indvars.iv117 = phi i64 [ 0, %.preheader92 ], [ %indvars.iv.next118.1, %28 ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv117, i64 %indvars.iv120
  %30 = load double, double* %29, align 8
  %31 = load double, double* %sunkaddr149, align 8
  %32 = fsub double %30, %31
  %33 = fmul double %32, %32
  %34 = load double, double* %sunkaddr153, align 8
  %35 = fadd double %34, %33
  store double %35, double* %sunkaddr153, align 8
  %indvars.iv.next118 = or i64 %indvars.iv117, 1
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next118, i64 %indvars.iv120
  %37 = load double, double* %36, align 8
  %38 = load double, double* %sunkaddr149, align 8
  %39 = fsub double %37, %38
  %40 = fmul double %39, %39
  %41 = load double, double* %sunkaddr153, align 8
  %42 = fadd double %41, %40
  store double %42, double* %sunkaddr153, align 8
  %indvars.iv.next118.1 = add nsw i64 %indvars.iv117, 2
  %exitcond119.1 = icmp eq i64 %indvars.iv.next118.1, 1400
  br i1 %exitcond119.1, label %43, label %28

; <label>:43:                                     ; preds = %28
  %sunkaddr155 = shl i64 %indvars.iv120, 3
  %sunkaddr156 = add i64 %sunkaddr154, %sunkaddr155
  %sunkaddr157 = inttoptr i64 %sunkaddr156 to double*
  %44 = load double, double* %sunkaddr157, align 8
  %45 = fdiv double %44, %2
  store double %45, double* %sunkaddr157, align 8
  %46 = tail call double @sqrt(double %45) #4
  %47 = fcmp ugt double %46, 1.000000e-01
  %48 = select i1 %47, double %46, double 1.000000e+00
  store double %48, double* %sunkaddr157, align 8
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next121, 1200
  br i1 %exitcond122, label %.preheader90.preheader, label %.preheader92

.preheader90.preheader:                           ; preds = %43
  br label %.preheader90

.preheader90:                                     ; preds = %.preheader90.preheader, %61
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %61 ], [ 0, %.preheader90.preheader ]
  br label %49

; <label>:49:                                     ; preds = %49, %.preheader90
  %indvars.iv111 = phi i64 [ 0, %.preheader90 ], [ %indvars.iv.next112, %49 ]
  %50 = getelementptr inbounds double, double* %5, i64 %indvars.iv111
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv114, i64 %indvars.iv111
  %53 = load double, double* %52, align 8
  %54 = fsub double %53, %51
  store double %54, double* %52, align 8
  %55 = tail call double @sqrt(double %2) #4
  %56 = getelementptr inbounds double, double* %6, i64 %indvars.iv111
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = load double, double* %52, align 8
  %60 = fdiv double %59, %58
  store double %60, double* %52, align 8
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next112, 1200
  br i1 %exitcond113, label %61, label %49

; <label>:61:                                     ; preds = %49
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next115, 1400
  br i1 %exitcond116, label %.lr.ph.preheader.preheader, label %.preheader90

.lr.ph.preheader.preheader:                       ; preds = %61
  br label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph.preheader.preheader, %._crit_edge
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %._crit_edge ], [ 0, %.lr.ph.preheader.preheader ]
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %._crit_edge ], [ 1, %.lr.ph.preheader.preheader ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv108, i64 %indvars.iv108
  store double 1.000000e+00, double* %62, align 8
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  br label %.lr.ph

.lr.ph:                                           ; preds = %79, %.lr.ph.preheader
  %indvars.iv105 = phi i64 [ %indvars.iv103, %.lr.ph.preheader ], [ %indvars.iv.next106, %79 ]
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv108, i64 %indvars.iv105
  store double 0.000000e+00, double* %63, align 8
  br label %64

; <label>:64:                                     ; preds = %64, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.1, %64 ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv108
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv105
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = load double, double* %63, align 8
  %71 = fadd double %70, %69
  store double %71, double* %63, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv108
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv105
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = load double, double* %63, align 8
  %78 = fadd double %77, %76
  store double %78, double* %63, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %79, label %64

; <label>:79:                                     ; preds = %64
  %80 = bitcast double* %63 to i64*
  %81 = load i64, i64* %80, align 8
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv105, i64 %indvars.iv108
  %83 = bitcast double* %82 to i64*
  store i64 %81, i64* %83, align 8
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond = icmp eq i64 %indvars.iv.next106, 1200
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %79
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next109, 1199
  br i1 %exitcond110, label %84, label %.lr.ph.preheader

; <label>:84:                                     ; preds = %._crit_edge
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %85, align 8
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %20, %2
  %indvars.iv12 = phi i64 [ 0, %2 ], [ %indvars.iv.next13, %20 ]
  %7 = mul nuw nsw i64 %indvars.iv12, 1200
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %15 ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %8, %13
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %20, label %8

; <label>:20:                                     ; preds = %15
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1200
  br i1 %exitcond14, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
