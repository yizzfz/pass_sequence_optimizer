; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call void @print_array([1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1000 x double]* nocapture) #2 {
  br label %.preheader

.preheader:                                       ; preds = %13, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %13 ]
  %2 = add nuw nsw i64 %indvars.iv1, 1000
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %3 = sub nuw nsw i64 %2, %indvars.iv
  %4 = trunc i64 %3 to i32
  %5 = sitofp i32 %4 to double
  %6 = fdiv double %5, 1.000000e+03
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  store double %6, double* %7, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = sub nuw nsw i64 %2, %indvars.iv.next
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.000000e+03
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next
  store double %11, double* %12, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond, label %14, label %.preheader

; <label>:14:                                     ; preds = %13
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_adi([1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) #2 {
  br label %.preheader152

.preheader152:                                    ; preds = %95, %4
  %.0159 = phi i32 [ 1, %4 ], [ %96, %95 ]
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %49, %.preheader152
  %indvars.iv3 = phi i64 [ 1, %.preheader152 ], [ %12, %49 ]
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv3
  store double 1.000000e+00, double* %5, align 8
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 0
  store double 0.000000e+00, double* %6, align 8
  %7 = bitcast double* %5 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3
  %10 = bitcast [1000 x double]* %9 to i64*
  store i64 %8, i64* %10, align 8
  %11 = add nsw i64 %indvars.iv3, -1
  %12 = add nuw nsw i64 %indvars.iv3, 1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge16
  %indvars.iv = phi i64 [ 1, %._crit_edge16 ], [ %indvars.iv.next, %._crit_edge ]
  %13 = add nsw i64 %indvars.iv, -1
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %13
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, 0xC09F400000000001
  %17 = fadd double %16, 0x40AF420000000001
  %18 = fdiv double 0x409F400000000001, %17
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %11
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, 0xC08F400000000001
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv3
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, 0xC09F3C0000000001
  %26 = fsub double %25, %22
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %12
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, 0xC08F400000000001
  %30 = fsub double %26, %29
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %13
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, 0xC09F400000000001
  %34 = fsub double %30, %33
  %35 = fdiv double %34, %17
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv
  store double %35, double* %36, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %37, label %._crit_edge

; <label>:37:                                     ; preds = %._crit_edge
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv3
  store double 1.000000e+00, double* %38, align 8
  br label %39

; <label>:39:                                     ; preds = %._crit_edge15, %37
  %40 = phi double [ %46, %._crit_edge15 ], [ 1.000000e+00, %37 ]
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge15 ], [ 998, %37 ]
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv1
  %42 = load double, double* %41, align 8
  %43 = fmul double %42, %40
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv1
  %45 = load double, double* %44, align 8
  %46 = fadd double %43, %45
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv3
  store double %46, double* %47, align 8
  %48 = icmp sgt i64 %indvars.iv1, 1
  br i1 %48, label %._crit_edge15, label %49

._crit_edge15:                                    ; preds = %39
  %indvars.iv.next2 = add nsw i64 %indvars.iv1, -1
  br label %39

; <label>:49:                                     ; preds = %39
  %exitcond5 = icmp eq i64 %12, 999
  br i1 %exitcond5, label %.preheader.preheader, label %._crit_edge16

.preheader.preheader:                             ; preds = %49
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %94
  %indvars.iv11 = phi i64 [ %57, %94 ], [ 1, %.preheader.preheader ]
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv11, i64 0
  store double 1.000000e+00, double* %50, align 8
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv11, i64 0
  store double 0.000000e+00, double* %51, align 8
  %52 = bitcast double* %50 to i64*
  %53 = load i64, i64* %52, align 8
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv11
  %55 = bitcast [1000 x double]* %54 to i64*
  store i64 %53, i64* %55, align 8
  %56 = add nsw i64 %indvars.iv11, -1
  %57 = add nuw nsw i64 %indvars.iv11, 1
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17, %.preheader
  %indvars.iv6 = phi i64 [ 1, %.preheader ], [ %indvars.iv.next7, %._crit_edge17 ]
  %58 = add nsw i64 %indvars.iv6, -1
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv11, i64 %58
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, 0xC08F400000000001
  %62 = fadd double %61, 0x409F440000000001
  %63 = fdiv double 0x408F400000000001, %62
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv6
  store double %63, double* %64, align 8
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %56, i64 %indvars.iv6
  %66 = load double, double* %65, align 8
  %67 = fmul double %66, 0xC09F400000000001
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv6
  %69 = load double, double* %68, align 8
  %70 = fmul double %69, 0xC0AF3E0000000001
  %71 = fsub double %70, %67
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %57, i64 %indvars.iv6
  %73 = load double, double* %72, align 8
  %74 = fmul double %73, 0xC09F400000000001
  %75 = fsub double %71, %74
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv11, i64 %58
  %77 = load double, double* %76, align 8
  %78 = fmul double %77, 0xC08F400000000001
  %79 = fsub double %75, %78
  %80 = fdiv double %79, %62
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv11, i64 %indvars.iv6
  store double %80, double* %81, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 999
  br i1 %exitcond8, label %82, label %._crit_edge17

; <label>:82:                                     ; preds = %._crit_edge17
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv11, i64 999
  store double 1.000000e+00, double* %83, align 8
  br label %84

; <label>:84:                                     ; preds = %._crit_edge18, %82
  %85 = phi double [ %91, %._crit_edge18 ], [ 1.000000e+00, %82 ]
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge18 ], [ 998, %82 ]
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv9
  %87 = load double, double* %86, align 8
  %88 = fmul double %87, %85
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv11, i64 %indvars.iv9
  %90 = load double, double* %89, align 8
  %91 = fadd double %88, %90
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv11, i64 %indvars.iv9
  store double %91, double* %92, align 8
  %93 = icmp sgt i64 %indvars.iv9, 1
  br i1 %93, label %._crit_edge18, label %94

._crit_edge18:                                    ; preds = %84
  %indvars.iv.next10 = add nsw i64 %indvars.iv9, -1
  br label %84

; <label>:94:                                     ; preds = %84
  %exitcond13 = icmp eq i64 %57, 999
  br i1 %exitcond13, label %95, label %.preheader

; <label>:95:                                     ; preds = %94
  %96 = add nuw nsw i32 %.0159, 1
  %exitcond14 = icmp eq i32 %96, 501
  br i1 %exitcond14, label %97, label %.preheader152

; <label>:97:                                     ; preds = %95
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1000 x double]* nocapture readonly) #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %17, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge4, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %17, label %._crit_edge4

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %18, label %.preheader

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

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
