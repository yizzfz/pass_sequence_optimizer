; ModuleID = 'A.ll'
source_filename = "gesummv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #3
  %8 = bitcast i8* %3 to [1300 x double]*
  %9 = bitcast i8* %4 to [1300 x double]*
  %10 = bitcast i8* %6 to double*
  br label %11

; <label>:11:                                     ; preds = %34, %2
  %12 = phi i64 [ 0, %2 ], [ %35, %34 ]
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.300000e+03
  %16 = getelementptr inbounds double, double* %10, i64 %12
  store double %15, double* %16, align 8, !tbaa !1
  br label %17

; <label>:17:                                     ; preds = %17, %11
  %18 = phi i64 [ 0, %11 ], [ %32, %17 ]
  %19 = mul nuw nsw i64 %18, %12
  %20 = add nuw nsw i64 %19, 1
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 1300
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 1.300000e+03
  %25 = getelementptr inbounds [1300 x double], [1300 x double]* %8, i64 %12, i64 %18
  store double %24, double* %25, align 8, !tbaa !1
  %26 = add nuw nsw i64 %19, 2
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 1300
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 1.300000e+03
  %31 = getelementptr inbounds [1300 x double], [1300 x double]* %9, i64 %12, i64 %18
  store double %30, double* %31, align 8, !tbaa !1
  %32 = add nuw nsw i64 %18, 1
  %33 = icmp eq i64 %32, 1300
  br i1 %33, label %34, label %17

; <label>:34:                                     ; preds = %17
  %35 = add nuw nsw i64 %12, 1
  %36 = icmp eq i64 %35, 1300
  br i1 %36, label %37, label %11

; <label>:37:                                     ; preds = %34
  tail call void (...) @polybench_timer_start() #3
  %38 = bitcast i8* %5 to double*
  %39 = bitcast i8* %7 to double*
  br label %40

; <label>:40:                                     ; preds = %63, %37
  %41 = phi i64 [ 0, %37 ], [ %67, %63 ]
  %42 = getelementptr inbounds double, double* %38, i64 %41
  store double 0.000000e+00, double* %42, align 8, !tbaa !1
  %43 = getelementptr inbounds double, double* %39, i64 %41
  store double 0.000000e+00, double* %43, align 8, !tbaa !1
  %44 = load double, double* %42, align 8, !tbaa !1
  br label %45

; <label>:45:                                     ; preds = %45, %40
  %46 = phi i64 [ 0, %40 ], [ %60, %45 ]
  %47 = phi double [ %44, %40 ], [ %61, %45 ]
  %48 = getelementptr inbounds [1300 x double], [1300 x double]* %8, i64 %41, i64 %46
  %49 = load double, double* %48, align 8, !tbaa !1
  %50 = getelementptr inbounds double, double* %10, i64 %46
  %51 = load double, double* %50, align 8, !tbaa !1
  %52 = fmul double %49, %51
  %53 = fadd double %47, %52
  store double %53, double* %42, align 8, !tbaa !1
  %54 = getelementptr inbounds [1300 x double], [1300 x double]* %9, i64 %41, i64 %46
  %55 = load double, double* %54, align 8, !tbaa !1
  %56 = load double, double* %50, align 8, !tbaa !1
  %57 = fmul double %55, %56
  %58 = load double, double* %43, align 8, !tbaa !1
  %59 = fadd double %57, %58
  store double %59, double* %43, align 8, !tbaa !1
  %60 = add nuw nsw i64 %46, 1
  %61 = load double, double* %42, align 8, !tbaa !1
  %62 = icmp eq i64 %60, 1300
  br i1 %62, label %63, label %45

; <label>:63:                                     ; preds = %45
  %64 = fmul double %61, 1.500000e+00
  %65 = fmul double %59, 1.200000e+00
  %66 = fadd double %65, %64
  store double %66, double* %43, align 8, !tbaa !1
  %67 = add nuw nsw i64 %41, 1
  %68 = icmp eq i64 %67, 1300
  br i1 %68, label %69, label %40

; <label>:69:                                     ; preds = %63
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %70 = icmp sgt i32 %0, 42
  br i1 %70, label %71, label %100

; <label>:71:                                     ; preds = %69
  %72 = load i8*, i8** %1, align 8, !tbaa !5
  %73 = load i8, i8* %72, align 1, !tbaa !7
  %74 = icmp eq i8 %73, 0
  br i1 %74, label %75, label %100

; <label>:75:                                     ; preds = %71
  %76 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %77 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %76) #4
  %78 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %79 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %78, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %80

; <label>:80:                                     ; preds = %88, %75
  %81 = phi i64 [ 0, %75 ], [ %93, %88 ]
  %82 = trunc i64 %81 to i32
  %83 = srem i32 %82, 20
  %84 = icmp eq i32 %83, 0
  br i1 %84, label %85, label %88

; <label>:85:                                     ; preds = %80
  %86 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %87 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %86) #4
  br label %88

; <label>:88:                                     ; preds = %85, %80
  %89 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %90 = getelementptr inbounds double, double* %39, i64 %81
  %91 = load double, double* %90, align 8, !tbaa !1
  %92 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %89, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %91) #4
  %93 = add nuw nsw i64 %81, 1
  %94 = icmp eq i64 %93, 1300
  br i1 %94, label %95, label %80

; <label>:95:                                     ; preds = %88
  %96 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %97 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %96, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %98 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %99 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %98) #4
  br label %100

; <label>:100:                                    ; preds = %95, %71, %69
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  tail call void @free(i8* nonnull %7) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"double", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !3, i64 0}
!7 = !{!3, !3, i64 0}
