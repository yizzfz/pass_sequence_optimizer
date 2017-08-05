; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1000 x double]*
  br label %8

; <label>:8:                                      ; preds = %27, %2
  %9 = phi i64 [ 0, %2 ], [ %28, %27 ]
  br label %10

; <label>:10:                                     ; preds = %10, %8
  %11 = phi i64 [ 0, %8 ], [ %25, %10 ]
  %12 = mul nuw nsw i64 %11, %9
  %13 = add nuw nsw i64 %12, 1
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 1200
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.200000e+03
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %9, i64 %11
  store double %17, double* %18, align 8, !tbaa !1
  %19 = add nuw nsw i64 %12, 2
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 1000
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 1.000000e+03
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %7, i64 %9, i64 %11
  store double %23, double* %24, align 8, !tbaa !1
  %25 = add nuw nsw i64 %11, 1
  %26 = icmp eq i64 %25, 1000
  br i1 %26, label %27, label %10

; <label>:27:                                     ; preds = %10
  %28 = add nuw nsw i64 %9, 1
  %29 = icmp eq i64 %28, 1200
  br i1 %29, label %30, label %8

; <label>:30:                                     ; preds = %27
  %31 = bitcast i8* %3 to [1200 x double]*
  br label %32

; <label>:32:                                     ; preds = %45, %30
  %33 = phi i64 [ %46, %45 ], [ 0, %30 ]
  br label %34

; <label>:34:                                     ; preds = %34, %32
  %35 = phi i64 [ 0, %32 ], [ %43, %34 ]
  %36 = mul nuw nsw i64 %35, %33
  %37 = add nuw nsw i64 %36, 3
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 1200
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, 1.000000e+03
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %31, i64 %33, i64 %35
  store double %41, double* %42, align 8, !tbaa !1
  %43 = add nuw nsw i64 %35, 1
  %44 = icmp eq i64 %43, 1200
  br i1 %44, label %45, label %34

; <label>:45:                                     ; preds = %34
  %46 = add nuw nsw i64 %33, 1
  %47 = icmp eq i64 %46, 1200
  br i1 %47, label %48, label %32

; <label>:48:                                     ; preds = %45
  tail call void (...) @polybench_timer_start() #3
  br label %49

; <label>:49:                                     ; preds = %143, %48
  %50 = phi i64 [ 0, %48 ], [ %144, %143 ]
  %51 = phi i64 [ 1, %48 ], [ %145, %143 ]
  %52 = add i64 %50, -3
  %53 = lshr i64 %52, 2
  %54 = add i64 %50, 1
  %55 = icmp ult i64 %54, 4
  br i1 %55, label %107, label %56

; <label>:56:                                     ; preds = %49
  %57 = and i64 %54, -4
  %58 = icmp eq i64 %57, 0
  br i1 %58, label %107, label %59

; <label>:59:                                     ; preds = %56
  %60 = and i64 %53, 1
  %61 = icmp eq i64 %60, 0
  br i1 %61, label %62, label %74

; <label>:62:                                     ; preds = %59
  br label %63

; <label>:63:                                     ; preds = %62
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %31, i64 %50, i64 0
  %65 = bitcast double* %64 to <2 x double>*
  %66 = load <2 x double>, <2 x double>* %65, align 8, !tbaa !1
  %67 = getelementptr [1200 x double], [1200 x double]* %31, i64 %50, i64 2
  %68 = bitcast double* %67 to <2 x double>*
  %69 = load <2 x double>, <2 x double>* %68, align 8, !tbaa !1
  %70 = fmul <2 x double> %66, <double 1.200000e+00, double 1.200000e+00>
  %71 = fmul <2 x double> %69, <double 1.200000e+00, double 1.200000e+00>
  %72 = bitcast double* %64 to <2 x double>*
  store <2 x double> %70, <2 x double>* %72, align 8, !tbaa !1
  %73 = bitcast double* %67 to <2 x double>*
  store <2 x double> %71, <2 x double>* %73, align 8, !tbaa !1
  br label %74

; <label>:74:                                     ; preds = %63, %59
  %75 = phi i64 [ 4, %63 ], [ 0, %59 ]
  br label %76

; <label>:76:                                     ; preds = %74
  %77 = icmp eq i64 %53, 0
  br i1 %77, label %105, label %78

; <label>:78:                                     ; preds = %76
  br label %79

; <label>:79:                                     ; preds = %79, %78
  %80 = phi i64 [ %75, %78 ], [ %102, %79 ]
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %31, i64 %50, i64 %80
  %82 = bitcast double* %81 to <2 x double>*
  %83 = load <2 x double>, <2 x double>* %82, align 8, !tbaa !1
  %84 = getelementptr double, double* %81, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  %86 = load <2 x double>, <2 x double>* %85, align 8, !tbaa !1
  %87 = fmul <2 x double> %83, <double 1.200000e+00, double 1.200000e+00>
  %88 = fmul <2 x double> %86, <double 1.200000e+00, double 1.200000e+00>
  %89 = bitcast double* %81 to <2 x double>*
  store <2 x double> %87, <2 x double>* %89, align 8, !tbaa !1
  %90 = bitcast double* %84 to <2 x double>*
  store <2 x double> %88, <2 x double>* %90, align 8, !tbaa !1
  %91 = add i64 %80, 4
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %31, i64 %50, i64 %91
  %93 = bitcast double* %92 to <2 x double>*
  %94 = load <2 x double>, <2 x double>* %93, align 8, !tbaa !1
  %95 = getelementptr double, double* %92, i64 2
  %96 = bitcast double* %95 to <2 x double>*
  %97 = load <2 x double>, <2 x double>* %96, align 8, !tbaa !1
  %98 = fmul <2 x double> %94, <double 1.200000e+00, double 1.200000e+00>
  %99 = fmul <2 x double> %97, <double 1.200000e+00, double 1.200000e+00>
  %100 = bitcast double* %92 to <2 x double>*
  store <2 x double> %98, <2 x double>* %100, align 8, !tbaa !1
  %101 = bitcast double* %95 to <2 x double>*
  store <2 x double> %99, <2 x double>* %101, align 8, !tbaa !1
  %102 = add i64 %80, 8
  %103 = icmp eq i64 %102, %57
  br i1 %103, label %104, label %79, !llvm.loop !5

; <label>:104:                                    ; preds = %79
  br label %105

; <label>:105:                                    ; preds = %104, %76
  %106 = icmp eq i64 %54, %57
  br i1 %106, label %117, label %107

; <label>:107:                                    ; preds = %105, %56, %49
  %108 = phi i64 [ 0, %56 ], [ 0, %49 ], [ %57, %105 ]
  br label %109

; <label>:109:                                    ; preds = %109, %107
  %110 = phi i64 [ %114, %109 ], [ %108, %107 ]
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %31, i64 %50, i64 %110
  %112 = load double, double* %111, align 8, !tbaa !1
  %113 = fmul double %112, 1.200000e+00
  store double %113, double* %111, align 8, !tbaa !1
  %114 = add nuw nsw i64 %110, 1
  %115 = icmp eq i64 %114, %51
  br i1 %115, label %116, label %109, !llvm.loop !8

; <label>:116:                                    ; preds = %109
  br label %117

; <label>:117:                                    ; preds = %116, %105
  br label %118

; <label>:118:                                    ; preds = %140, %117
  %119 = phi i64 [ %141, %140 ], [ 0, %117 ]
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %7, i64 %50, i64 %119
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %50, i64 %119
  br label %122

; <label>:122:                                    ; preds = %122, %118
  %123 = phi i64 [ %138, %122 ], [ 0, %118 ]
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %123, i64 %119
  %125 = load double, double* %124, align 8, !tbaa !1
  %126 = fmul double %125, 1.500000e+00
  %127 = load double, double* %120, align 8, !tbaa !1
  %128 = fmul double %126, %127
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %7, i64 %123, i64 %119
  %130 = load double, double* %129, align 8, !tbaa !1
  %131 = fmul double %130, 1.500000e+00
  %132 = load double, double* %121, align 8, !tbaa !1
  %133 = fmul double %131, %132
  %134 = fadd double %128, %133
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %31, i64 %50, i64 %123
  %136 = load double, double* %135, align 8, !tbaa !1
  %137 = fadd double %136, %134
  store double %137, double* %135, align 8, !tbaa !1
  %138 = add nuw nsw i64 %123, 1
  %139 = icmp eq i64 %138, %51
  br i1 %139, label %140, label %122

; <label>:140:                                    ; preds = %122
  %141 = add nuw nsw i64 %119, 1
  %142 = icmp eq i64 %141, 1000
  br i1 %142, label %143, label %118

; <label>:143:                                    ; preds = %140
  %144 = add nuw nsw i64 %50, 1
  %145 = add nuw nsw i64 %51, 1
  %146 = icmp eq i64 %144, 1200
  br i1 %146, label %147, label %49

; <label>:147:                                    ; preds = %143
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %148 = icmp sgt i32 %0, 42
  br i1 %148, label %149, label %185

; <label>:149:                                    ; preds = %147
  %150 = load i8*, i8** %1, align 8, !tbaa !10
  %151 = load i8, i8* %150, align 1, !tbaa !12
  %152 = icmp eq i8 %151, 0
  br i1 %152, label %153, label %185

; <label>:153:                                    ; preds = %149
  %154 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %155 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %154) #4
  %156 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %157 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %156, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %158

; <label>:158:                                    ; preds = %177, %153
  %159 = phi i64 [ 0, %153 ], [ %178, %177 ]
  %160 = mul nuw nsw i64 %159, 1200
  br label %161

; <label>:161:                                    ; preds = %170, %158
  %162 = phi i64 [ 0, %158 ], [ %175, %170 ]
  %163 = add nuw nsw i64 %162, %160
  %164 = trunc i64 %163 to i32
  %165 = srem i32 %164, 20
  %166 = icmp eq i32 %165, 0
  br i1 %166, label %167, label %170

; <label>:167:                                    ; preds = %161
  %168 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %169 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %168) #4
  br label %170

; <label>:170:                                    ; preds = %167, %161
  %171 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %31, i64 %159, i64 %162
  %173 = load double, double* %172, align 8, !tbaa !1
  %174 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %171, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %173) #4
  %175 = add nuw nsw i64 %162, 1
  %176 = icmp eq i64 %175, 1200
  br i1 %176, label %177, label %161

; <label>:177:                                    ; preds = %170
  %178 = add nuw nsw i64 %159, 1
  %179 = icmp eq i64 %178, 1200
  br i1 %179, label %180, label %158

; <label>:180:                                    ; preds = %177
  %181 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %182 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %181, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %183 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %184 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %183) #4
  br label %185

; <label>:185:                                    ; preds = %180, %149, %147
  tail call void @free(i8* nonnull %3) #3
  tail call void @free(i8* %4) #3
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
!5 = distinct !{!5, !6, !7}
!6 = !{!"llvm.loop.vectorize.width", i32 1}
!7 = !{!"llvm.loop.interleave.count", i32 1}
!8 = distinct !{!8, !9, !6, !7}
!9 = !{!"llvm.loop.unroll.runtime.disable"}
!10 = !{!11, !11, i64 0}
!11 = !{!"any pointer", !3, i64 0}
!12 = !{!3, !3, i64 0}
