; ModuleID = 'A.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #3
  %8 = bitcast i8* %3 to [1900 x double]*
  %9 = bitcast i8* %6 to double*
  br label %10

; <label>:10:                                     ; preds = %10, %2
  %11 = phi i64 [ 0, %2 ], [ %21, %10 ]
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.900000e+03
  %15 = getelementptr inbounds double, double* %9, i64 %11
  store double %14, double* %15, align 8, !tbaa !1
  %16 = or i64 %11, 1
  %17 = trunc i64 %16 to i32
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.900000e+03
  %20 = getelementptr inbounds double, double* %9, i64 %16
  store double %19, double* %20, align 8, !tbaa !1
  %21 = add nsw i64 %11, 2
  %22 = icmp eq i64 %21, 1900
  br i1 %22, label %23, label %10

; <label>:23:                                     ; preds = %10
  %24 = bitcast i8* %7 to double*
  br label %25

; <label>:25:                                     ; preds = %48, %23
  %26 = phi i64 [ %49, %48 ], [ 0, %23 ]
  %27 = trunc i64 %26 to i32
  %28 = sitofp i32 %27 to double
  %29 = fdiv double %28, 2.100000e+03
  %30 = getelementptr inbounds double, double* %24, i64 %26
  store double %29, double* %30, align 8, !tbaa !1
  br label %31

; <label>:31:                                     ; preds = %31, %25
  %32 = phi i64 [ 0, %25 ], [ %40, %31 ]
  %33 = or i64 %32, 1
  %34 = mul nuw nsw i64 %33, %26
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 2100
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 2.100000e+03
  %39 = getelementptr inbounds [1900 x double], [1900 x double]* %8, i64 %26, i64 %32
  store double %38, double* %39, align 8, !tbaa !1
  %40 = add nsw i64 %32, 2
  %41 = mul nuw nsw i64 %40, %26
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, 2100
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %44, 2.100000e+03
  %46 = getelementptr inbounds [1900 x double], [1900 x double]* %8, i64 %26, i64 %33
  store double %45, double* %46, align 8, !tbaa !1
  %47 = icmp eq i64 %40, 1900
  br i1 %47, label %48, label %31

; <label>:48:                                     ; preds = %31
  %49 = add nuw nsw i64 %26, 1
  %50 = icmp eq i64 %49, 2100
  br i1 %50, label %51, label %25

; <label>:51:                                     ; preds = %48
  tail call void (...) @polybench_timer_start() #3
  %52 = bitcast i8* %4 to double*
  %53 = bitcast i8* %5 to double*
  tail call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 15200, i32 8, i1 false) #3
  br label %54

; <label>:54:                                     ; preds = %75, %51
  %55 = phi i64 [ 0, %51 ], [ %76, %75 ]
  %56 = getelementptr inbounds double, double* %53, i64 %55
  store double 0.000000e+00, double* %56, align 8, !tbaa !1
  %57 = getelementptr inbounds double, double* %24, i64 %55
  br label %58

; <label>:58:                                     ; preds = %58, %54
  %59 = phi i64 [ 0, %54 ], [ %73, %58 ]
  %60 = getelementptr inbounds double, double* %52, i64 %59
  %61 = load double, double* %60, align 8, !tbaa !1
  %62 = load double, double* %57, align 8, !tbaa !1
  %63 = getelementptr inbounds [1900 x double], [1900 x double]* %8, i64 %55, i64 %59
  %64 = load double, double* %63, align 8, !tbaa !1
  %65 = fmul double %62, %64
  %66 = fadd double %61, %65
  store double %66, double* %60, align 8, !tbaa !1
  %67 = load double, double* %56, align 8, !tbaa !1
  %68 = load double, double* %63, align 8, !tbaa !1
  %69 = getelementptr inbounds double, double* %9, i64 %59
  %70 = load double, double* %69, align 8, !tbaa !1
  %71 = fmul double %68, %70
  %72 = fadd double %67, %71
  store double %72, double* %56, align 8, !tbaa !1
  %73 = add nuw nsw i64 %59, 1
  %74 = icmp eq i64 %73, 1900
  br i1 %74, label %75, label %58

; <label>:75:                                     ; preds = %58
  %76 = add nuw nsw i64 %55, 1
  %77 = icmp eq i64 %76, 2100
  br i1 %77, label %78, label %54

; <label>:78:                                     ; preds = %75
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %79 = icmp sgt i32 %0, 42
  br i1 %79, label %80, label %129

; <label>:80:                                     ; preds = %78
  %81 = load i8*, i8** %1, align 8, !tbaa !5
  %82 = load i8, i8* %81, align 1, !tbaa !7
  %83 = icmp eq i8 %82, 0
  br i1 %83, label %84, label %129

; <label>:84:                                     ; preds = %80
  %85 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %86 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %85) #5
  %87 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %88 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %87, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %89

; <label>:89:                                     ; preds = %97, %84
  %90 = phi i64 [ 0, %84 ], [ %102, %97 ]
  %91 = trunc i64 %90 to i32
  %92 = srem i32 %91, 20
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %94, label %97

; <label>:94:                                     ; preds = %89
  %95 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %96 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %95) #5
  br label %97

; <label>:97:                                     ; preds = %94, %89
  %98 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %99 = getelementptr inbounds double, double* %52, i64 %90
  %100 = load double, double* %99, align 8, !tbaa !1
  %101 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %98, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %100) #5
  %102 = add nuw nsw i64 %90, 1
  %103 = icmp eq i64 %102, 1900
  br i1 %103, label %104, label %89

; <label>:104:                                    ; preds = %97
  %105 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %106 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %105, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %107 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %108 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %107, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #5
  br label %109

; <label>:109:                                    ; preds = %117, %104
  %110 = phi i64 [ 0, %104 ], [ %122, %117 ]
  %111 = trunc i64 %110 to i32
  %112 = srem i32 %111, 20
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %114, label %117

; <label>:114:                                    ; preds = %109
  %115 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %116 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %115) #5
  br label %117

; <label>:117:                                    ; preds = %114, %109
  %118 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %119 = getelementptr inbounds double, double* %53, i64 %110
  %120 = load double, double* %119, align 8, !tbaa !1
  %121 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %118, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %120) #5
  %122 = add nuw nsw i64 %110, 1
  %123 = icmp eq i64 %122, 2100
  br i1 %123, label %124, label %109

; <label>:124:                                    ; preds = %117
  %125 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %126 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %125, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #5
  %127 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %128 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %127) #5
  br label %129

; <label>:129:                                    ; preds = %124, %80, %78
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* nonnull %5) #3
  tail call void @free(i8* %6) #3
  tail call void @free(i8* %7) #3
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"double", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !3, i64 0}
!7 = !{!3, !3, i64 0}
