; ModuleID = 'A.ll'
source_filename = "mvt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  %11 = bitcast i8* %7 to double*
  %12 = bitcast i8* %3 to [2000 x double]*
  br label %14

; <label>:13:                                     ; preds = %39
  br i1 %21, label %56, label %14

; <label>:14:                                     ; preds = %13, %2
  %15 = phi i64 [ 0, %2 ], [ %20, %13 ]
  %16 = trunc i64 %15 to i32
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 2.000000e+03
  %19 = getelementptr inbounds double, double* %8, i64 %15
  store double %18, double* %19, align 8, !tbaa !1
  %20 = add nuw nsw i64 %15, 1
  %21 = icmp eq i64 %20, 2000
  %22 = trunc i64 %20 to i32
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 2.000000e+03
  %25 = select i1 %21, double 0.000000e+00, double %24
  %26 = getelementptr inbounds double, double* %9, i64 %15
  store double %25, double* %26, align 8, !tbaa !1
  %27 = add nuw nsw i64 %15, 3
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 2000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 2.000000e+03
  %32 = getelementptr inbounds double, double* %10, i64 %15
  store double %31, double* %32, align 8, !tbaa !1
  %33 = add nuw nsw i64 %15, 4
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, 2000
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, 2.000000e+03
  %38 = getelementptr inbounds double, double* %11, i64 %15
  store double %37, double* %38, align 8, !tbaa !1
  br label %39

; <label>:39:                                     ; preds = %39, %14
  %40 = phi i64 [ 0, %14 ], [ %54, %39 ]
  %41 = mul nuw nsw i64 %40, %15
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, 2000
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %44, 2.000000e+03
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %15, i64 %40
  store double %45, double* %46, align 8, !tbaa !1
  %47 = or i64 %40, 1
  %48 = mul nuw nsw i64 %47, %15
  %49 = trunc i64 %48 to i32
  %50 = srem i32 %49, 2000
  %51 = sitofp i32 %50 to double
  %52 = fdiv double %51, 2.000000e+03
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %15, i64 %47
  store double %52, double* %53, align 8, !tbaa !1
  %54 = add nsw i64 %40, 2
  %55 = icmp eq i64 %54, 2000
  br i1 %55, label %13, label %39

; <label>:56:                                     ; preds = %13
  tail call void (...) @polybench_timer_start() #3
  br label %57

; <label>:57:                                     ; preds = %79, %56
  %58 = phi i64 [ 0, %56 ], [ %80, %79 ]
  %59 = getelementptr inbounds double, double* %8, i64 %58
  %60 = load double, double* %59, align 8, !tbaa !1
  br label %61

; <label>:61:                                     ; preds = %61, %57
  %62 = phi double [ %60, %57 ], [ %76, %61 ]
  %63 = phi i64 [ 0, %57 ], [ %77, %61 ]
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %58, i64 %63
  %65 = load double, double* %64, align 8, !tbaa !1
  %66 = getelementptr inbounds double, double* %10, i64 %63
  %67 = load double, double* %66, align 8, !tbaa !1
  %68 = fmul double %65, %67
  %69 = fadd double %62, %68
  store double %69, double* %59, align 8, !tbaa !1
  %70 = or i64 %63, 1
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %58, i64 %70
  %72 = load double, double* %71, align 8, !tbaa !1
  %73 = getelementptr inbounds double, double* %10, i64 %70
  %74 = load double, double* %73, align 8, !tbaa !1
  %75 = fmul double %72, %74
  %76 = fadd double %69, %75
  store double %76, double* %59, align 8, !tbaa !1
  %77 = add nsw i64 %63, 2
  %78 = icmp eq i64 %77, 2000
  br i1 %78, label %79, label %61

; <label>:79:                                     ; preds = %61
  %80 = add nuw nsw i64 %58, 1
  %81 = icmp eq i64 %80, 2000
  br i1 %81, label %82, label %57

; <label>:82:                                     ; preds = %79
  br label %83

; <label>:83:                                     ; preds = %105, %82
  %84 = phi i64 [ %106, %105 ], [ 0, %82 ]
  %85 = getelementptr inbounds double, double* %9, i64 %84
  %86 = load double, double* %85, align 8, !tbaa !1
  br label %87

; <label>:87:                                     ; preds = %87, %83
  %88 = phi double [ %86, %83 ], [ %102, %87 ]
  %89 = phi i64 [ 0, %83 ], [ %103, %87 ]
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %89, i64 %84
  %91 = load double, double* %90, align 8, !tbaa !1
  %92 = getelementptr inbounds double, double* %11, i64 %89
  %93 = load double, double* %92, align 8, !tbaa !1
  %94 = fmul double %91, %93
  %95 = fadd double %88, %94
  store double %95, double* %85, align 8, !tbaa !1
  %96 = or i64 %89, 1
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %96, i64 %84
  %98 = load double, double* %97, align 8, !tbaa !1
  %99 = getelementptr inbounds double, double* %11, i64 %96
  %100 = load double, double* %99, align 8, !tbaa !1
  %101 = fmul double %98, %100
  %102 = fadd double %95, %101
  store double %102, double* %85, align 8, !tbaa !1
  %103 = add nsw i64 %89, 2
  %104 = icmp eq i64 %103, 2000
  br i1 %104, label %105, label %87

; <label>:105:                                    ; preds = %87
  %106 = add nuw nsw i64 %84, 1
  %107 = icmp eq i64 %106, 2000
  br i1 %107, label %108, label %83

; <label>:108:                                    ; preds = %105
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %109 = icmp sgt i32 %0, 42
  br i1 %109, label %110, label %159

; <label>:110:                                    ; preds = %108
  %111 = load i8*, i8** %1, align 8, !tbaa !5
  %112 = load i8, i8* %111, align 1, !tbaa !7
  %113 = icmp eq i8 %112, 0
  br i1 %113, label %114, label %159

; <label>:114:                                    ; preds = %110
  %115 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %116 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %115) #4
  %117 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %118 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %117, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %119

; <label>:119:                                    ; preds = %127, %114
  %120 = phi i64 [ 0, %114 ], [ %132, %127 ]
  %121 = trunc i64 %120 to i32
  %122 = srem i32 %121, 20
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %124, label %127

; <label>:124:                                    ; preds = %119
  %125 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %126 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %125) #4
  br label %127

; <label>:127:                                    ; preds = %124, %119
  %128 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %129 = getelementptr inbounds double, double* %8, i64 %120
  %130 = load double, double* %129, align 8, !tbaa !1
  %131 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %128, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %130) #4
  %132 = add nuw nsw i64 %120, 1
  %133 = icmp eq i64 %132, 2000
  br i1 %133, label %134, label %119

; <label>:134:                                    ; preds = %127
  %135 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %136 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %135, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #4
  %137 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %138 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %137, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #4
  br label %139

; <label>:139:                                    ; preds = %147, %134
  %140 = phi i64 [ 0, %134 ], [ %152, %147 ]
  %141 = trunc i64 %140 to i32
  %142 = srem i32 %141, 20
  %143 = icmp eq i32 %142, 0
  br i1 %143, label %144, label %147

; <label>:144:                                    ; preds = %139
  %145 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %146 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %145) #4
  br label %147

; <label>:147:                                    ; preds = %144, %139
  %148 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %149 = getelementptr inbounds double, double* %9, i64 %140
  %150 = load double, double* %149, align 8, !tbaa !1
  %151 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %148, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %150) #4
  %152 = add nuw nsw i64 %140, 1
  %153 = icmp eq i64 %152, 2000
  br i1 %153, label %154, label %139

; <label>:154:                                    ; preds = %147
  %155 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %156 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %155, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #4
  %157 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %158 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %157) #4
  br label %159

; <label>:159:                                    ; preds = %154, %110, %108
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
