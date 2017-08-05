; ModuleID = 'A.ll'
source_filename = "trisolv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %6 = bitcast i8* %3 to [2000 x double]*
  %7 = bitcast i8* %4 to double*
  %8 = bitcast i8* %5 to double*
  br label %9

; <label>:9:                                      ; preds = %49, %2
  %10 = phi i64 [ 0, %2 ], [ %50, %49 ]
  %11 = phi i64 [ 1, %2 ], [ %51, %49 ]
  %12 = getelementptr inbounds double, double* %7, i64 %10
  store double -9.990000e+02, double* %12, align 8, !tbaa !1
  %13 = trunc i64 %10 to i32
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %8, i64 %10
  store double %14, double* %15, align 8, !tbaa !1
  %16 = add nuw nsw i64 %10, 2001
  %17 = and i64 %10, 1
  %18 = icmp eq i64 %17, 0
  br i1 %18, label %19, label %26

; <label>:19:                                     ; preds = %9
  br label %20

; <label>:20:                                     ; preds = %19
  %21 = trunc i64 %16 to i32
  %22 = sitofp i32 %21 to double
  %23 = fmul double %22, 2.000000e+00
  %24 = fdiv double %23, 2.000000e+03
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %10, i64 0
  store double %24, double* %25, align 8, !tbaa !1
  br label %26

; <label>:26:                                     ; preds = %20, %9
  %27 = phi i64 [ 1, %20 ], [ 0, %9 ]
  br label %28

; <label>:28:                                     ; preds = %26
  %29 = icmp eq i64 %10, 0
  br i1 %29, label %49, label %30

; <label>:30:                                     ; preds = %28
  br label %31

; <label>:31:                                     ; preds = %31, %30
  %32 = phi i64 [ %27, %30 ], [ %46, %31 ]
  %33 = sub i64 %16, %32
  %34 = trunc i64 %33 to i32
  %35 = sitofp i32 %34 to double
  %36 = fmul double %35, 2.000000e+00
  %37 = fdiv double %36, 2.000000e+03
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %10, i64 %32
  store double %37, double* %38, align 8, !tbaa !1
  %39 = add nuw nsw i64 %32, 1
  %40 = sub i64 %16, %39
  %41 = trunc i64 %40 to i32
  %42 = sitofp i32 %41 to double
  %43 = fmul double %42, 2.000000e+00
  %44 = fdiv double %43, 2.000000e+03
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %10, i64 %39
  store double %44, double* %45, align 8, !tbaa !1
  %46 = add nsw i64 %32, 2
  %47 = icmp eq i64 %46, %11
  br i1 %47, label %48, label %31

; <label>:48:                                     ; preds = %31
  br label %49

; <label>:49:                                     ; preds = %48, %28
  %50 = add nuw nsw i64 %10, 1
  %51 = add nuw nsw i64 %11, 1
  %52 = icmp eq i64 %50, 2000
  br i1 %52, label %53, label %9

; <label>:53:                                     ; preds = %49
  tail call void (...) @polybench_timer_start() #3
  br label %54

; <label>:54:                                     ; preds = %101, %53
  %55 = phi i64 [ 0, %53 ], [ %106, %101 ]
  %56 = getelementptr inbounds double, double* %8, i64 %55
  %57 = bitcast double* %56 to i64*
  %58 = load i64, i64* %57, align 8, !tbaa !1
  %59 = getelementptr inbounds double, double* %7, i64 %55
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8, !tbaa !1
  %61 = icmp sgt i64 %55, 0
  %62 = bitcast i64 %58 to double
  br i1 %61, label %63, label %101

; <label>:63:                                     ; preds = %54
  %64 = and i64 %55, 1
  %65 = icmp eq i64 %64, 0
  br i1 %65, label %73, label %66

; <label>:66:                                     ; preds = %63
  br label %67

; <label>:67:                                     ; preds = %66
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %55, i64 0
  %69 = load double, double* %68, align 8, !tbaa !1
  %70 = load double, double* %7, align 8, !tbaa !1
  %71 = fmul double %69, %70
  %72 = fsub double %62, %71
  store double %72, double* %59, align 8, !tbaa !1
  br label %73

; <label>:73:                                     ; preds = %67, %63
  %74 = phi double [ %72, %67 ], [ undef, %63 ]
  %75 = phi i64 [ 1, %67 ], [ 0, %63 ]
  %76 = phi double [ %72, %67 ], [ %62, %63 ]
  br label %77

; <label>:77:                                     ; preds = %73
  %78 = icmp eq i64 %55, 1
  br i1 %78, label %99, label %79

; <label>:79:                                     ; preds = %77
  br label %80

; <label>:80:                                     ; preds = %80, %79
  %81 = phi i64 [ %75, %79 ], [ %96, %80 ]
  %82 = phi double [ %76, %79 ], [ %95, %80 ]
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %55, i64 %81
  %84 = load double, double* %83, align 8, !tbaa !1
  %85 = getelementptr inbounds double, double* %7, i64 %81
  %86 = load double, double* %85, align 8, !tbaa !1
  %87 = fmul double %84, %86
  %88 = fsub double %82, %87
  store double %88, double* %59, align 8, !tbaa !1
  %89 = add nuw nsw i64 %81, 1
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %55, i64 %89
  %91 = load double, double* %90, align 8, !tbaa !1
  %92 = getelementptr inbounds double, double* %7, i64 %89
  %93 = load double, double* %92, align 8, !tbaa !1
  %94 = fmul double %91, %93
  %95 = fsub double %88, %94
  store double %95, double* %59, align 8, !tbaa !1
  %96 = add nsw i64 %81, 2
  %97 = icmp eq i64 %96, %55
  br i1 %97, label %98, label %80

; <label>:98:                                     ; preds = %80
  br label %99

; <label>:99:                                     ; preds = %98, %77
  %100 = phi double [ %74, %77 ], [ %95, %98 ]
  br label %101

; <label>:101:                                    ; preds = %99, %54
  %102 = phi double [ %62, %54 ], [ %100, %99 ]
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %55, i64 %55
  %104 = load double, double* %103, align 8, !tbaa !1
  %105 = fdiv double %102, %104
  store double %105, double* %59, align 8, !tbaa !1
  %106 = add nuw nsw i64 %55, 1
  %107 = icmp eq i64 %106, 2000
  br i1 %107, label %108, label %54

; <label>:108:                                    ; preds = %101
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %109 = icmp sgt i32 %0, 42
  br i1 %109, label %110, label %140

; <label>:110:                                    ; preds = %108
  %111 = load i8*, i8** %1, align 8, !tbaa !5
  %112 = load i8, i8* %111, align 1, !tbaa !7
  %113 = icmp eq i8 %112, 0
  br i1 %113, label %114, label %140

; <label>:114:                                    ; preds = %110
  %115 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %116 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %115) #4
  %117 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %118 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %117, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %119 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  br label %120

; <label>:120:                                    ; preds = %132, %114
  %121 = phi i64 [ 0, %114 ], [ %133, %132 ]
  %122 = phi %struct._IO_FILE* [ %119, %114 ], [ %134, %132 ]
  %123 = getelementptr inbounds double, double* %7, i64 %121
  %124 = load double, double* %123, align 8, !tbaa !1
  %125 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %122, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %124) #4
  %126 = trunc i64 %121 to i32
  %127 = srem i32 %126, 20
  %128 = icmp eq i32 %127, 0
  br i1 %128, label %129, label %132

; <label>:129:                                    ; preds = %120
  %130 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %131 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %130) #4
  br label %132

; <label>:132:                                    ; preds = %129, %120
  %133 = add nuw nsw i64 %121, 1
  %134 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %135 = icmp eq i64 %133, 2000
  br i1 %135, label %136, label %120

; <label>:136:                                    ; preds = %132
  %137 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %134, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %138 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %139 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %138) #4
  br label %140

; <label>:140:                                    ; preds = %136, %110, %108
  tail call void @free(i8* %3) #3
  tail call void @free(i8* nonnull %4) #3
  tail call void @free(i8* %5) #3
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
