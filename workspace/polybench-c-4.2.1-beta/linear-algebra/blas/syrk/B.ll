; ModuleID = 'A.ll'
source_filename = "syrk.c"
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
  %5 = bitcast i8* %4 to [1000 x double]*
  br label %6

; <label>:6:                                      ; preds = %19, %2
  %7 = phi i64 [ 0, %2 ], [ %20, %19 ]
  br label %8

; <label>:8:                                      ; preds = %8, %6
  %9 = phi i64 [ 0, %6 ], [ %17, %8 ]
  %10 = mul nuw nsw i64 %9, %7
  %11 = add nuw nsw i64 %10, 1
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 1200
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.200000e+03
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %7, i64 %9
  store double %15, double* %16, align 8, !tbaa !1
  %17 = add nuw nsw i64 %9, 1
  %18 = icmp eq i64 %17, 1000
  br i1 %18, label %19, label %8

; <label>:19:                                     ; preds = %8
  %20 = add nuw nsw i64 %7, 1
  %21 = icmp eq i64 %20, 1200
  br i1 %21, label %22, label %6

; <label>:22:                                     ; preds = %19
  %23 = bitcast i8* %3 to [1200 x double]*
  br label %24

; <label>:24:                                     ; preds = %37, %22
  %25 = phi i64 [ %38, %37 ], [ 0, %22 ]
  br label %26

; <label>:26:                                     ; preds = %26, %24
  %27 = phi i64 [ 0, %24 ], [ %35, %26 ]
  %28 = mul nuw nsw i64 %27, %25
  %29 = add nuw nsw i64 %28, 2
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 1000
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 1.000000e+03
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %25, i64 %27
  store double %33, double* %34, align 8, !tbaa !1
  %35 = add nuw nsw i64 %27, 1
  %36 = icmp eq i64 %35, 1200
  br i1 %36, label %37, label %26

; <label>:37:                                     ; preds = %26
  %38 = add nuw nsw i64 %25, 1
  %39 = icmp eq i64 %38, 1200
  br i1 %39, label %40, label %24

; <label>:40:                                     ; preds = %37
  tail call void (...) @polybench_timer_start() #3
  br label %41

; <label>:41:                                     ; preds = %155, %40
  %42 = phi i64 [ 0, %40 ], [ %156, %155 ]
  %43 = phi i64 [ 1, %40 ], [ %157, %155 ]
  %44 = add i64 %42, -3
  %45 = lshr i64 %44, 2
  %46 = add i64 %42, 1
  %47 = icmp ult i64 %46, 4
  br i1 %47, label %99, label %48

; <label>:48:                                     ; preds = %41
  %49 = and i64 %46, -4
  %50 = icmp eq i64 %49, 0
  br i1 %50, label %99, label %51

; <label>:51:                                     ; preds = %48
  %52 = and i64 %45, 1
  %53 = icmp eq i64 %52, 0
  br i1 %53, label %54, label %66

; <label>:54:                                     ; preds = %51
  br label %55

; <label>:55:                                     ; preds = %54
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %42, i64 0
  %57 = bitcast double* %56 to <2 x double>*
  %58 = load <2 x double>, <2 x double>* %57, align 8, !tbaa !1
  %59 = getelementptr [1200 x double], [1200 x double]* %23, i64 %42, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  %61 = load <2 x double>, <2 x double>* %60, align 8, !tbaa !1
  %62 = fmul <2 x double> %58, <double 1.200000e+00, double 1.200000e+00>
  %63 = fmul <2 x double> %61, <double 1.200000e+00, double 1.200000e+00>
  %64 = bitcast double* %56 to <2 x double>*
  store <2 x double> %62, <2 x double>* %64, align 8, !tbaa !1
  %65 = bitcast double* %59 to <2 x double>*
  store <2 x double> %63, <2 x double>* %65, align 8, !tbaa !1
  br label %66

; <label>:66:                                     ; preds = %55, %51
  %67 = phi i64 [ 4, %55 ], [ 0, %51 ]
  br label %68

; <label>:68:                                     ; preds = %66
  %69 = icmp eq i64 %45, 0
  br i1 %69, label %97, label %70

; <label>:70:                                     ; preds = %68
  br label %71

; <label>:71:                                     ; preds = %71, %70
  %72 = phi i64 [ %67, %70 ], [ %94, %71 ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %42, i64 %72
  %74 = bitcast double* %73 to <2 x double>*
  %75 = load <2 x double>, <2 x double>* %74, align 8, !tbaa !1
  %76 = getelementptr double, double* %73, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %78 = load <2 x double>, <2 x double>* %77, align 8, !tbaa !1
  %79 = fmul <2 x double> %75, <double 1.200000e+00, double 1.200000e+00>
  %80 = fmul <2 x double> %78, <double 1.200000e+00, double 1.200000e+00>
  %81 = bitcast double* %73 to <2 x double>*
  store <2 x double> %79, <2 x double>* %81, align 8, !tbaa !1
  %82 = bitcast double* %76 to <2 x double>*
  store <2 x double> %80, <2 x double>* %82, align 8, !tbaa !1
  %83 = add i64 %72, 4
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %42, i64 %83
  %85 = bitcast double* %84 to <2 x double>*
  %86 = load <2 x double>, <2 x double>* %85, align 8, !tbaa !1
  %87 = getelementptr double, double* %84, i64 2
  %88 = bitcast double* %87 to <2 x double>*
  %89 = load <2 x double>, <2 x double>* %88, align 8, !tbaa !1
  %90 = fmul <2 x double> %86, <double 1.200000e+00, double 1.200000e+00>
  %91 = fmul <2 x double> %89, <double 1.200000e+00, double 1.200000e+00>
  %92 = bitcast double* %84 to <2 x double>*
  store <2 x double> %90, <2 x double>* %92, align 8, !tbaa !1
  %93 = bitcast double* %87 to <2 x double>*
  store <2 x double> %91, <2 x double>* %93, align 8, !tbaa !1
  %94 = add i64 %72, 8
  %95 = icmp eq i64 %94, %49
  br i1 %95, label %96, label %71, !llvm.loop !5

; <label>:96:                                     ; preds = %71
  br label %97

; <label>:97:                                     ; preds = %96, %68
  %98 = icmp eq i64 %46, %49
  br i1 %98, label %109, label %99

; <label>:99:                                     ; preds = %97, %48, %41
  %100 = phi i64 [ 0, %48 ], [ 0, %41 ], [ %49, %97 ]
  br label %101

; <label>:101:                                    ; preds = %101, %99
  %102 = phi i64 [ %106, %101 ], [ %100, %99 ]
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %42, i64 %102
  %104 = load double, double* %103, align 8, !tbaa !1
  %105 = fmul double %104, 1.200000e+00
  store double %105, double* %103, align 8, !tbaa !1
  %106 = add nuw nsw i64 %102, 1
  %107 = icmp eq i64 %106, %43
  br i1 %107, label %108, label %101, !llvm.loop !8

; <label>:108:                                    ; preds = %101
  br label %109

; <label>:109:                                    ; preds = %108, %97
  %110 = and i64 %42, 1
  %111 = icmp eq i64 %110, 0
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %42, i64 0
  %113 = icmp eq i64 %42, 0
  br label %114

; <label>:114:                                    ; preds = %152, %109
  %115 = phi i64 [ %153, %152 ], [ 0, %109 ]
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %42, i64 %115
  br i1 %111, label %117, label %126

; <label>:117:                                    ; preds = %114
  br label %118

; <label>:118:                                    ; preds = %117
  %119 = load double, double* %116, align 8, !tbaa !1
  %120 = fmul double %119, 1.500000e+00
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %115
  %122 = load double, double* %121, align 8, !tbaa !1
  %123 = fmul double %120, %122
  %124 = load double, double* %112, align 8, !tbaa !1
  %125 = fadd double %124, %123
  store double %125, double* %112, align 8, !tbaa !1
  br label %126

; <label>:126:                                    ; preds = %118, %114
  %127 = phi i64 [ 1, %118 ], [ 0, %114 ]
  br label %128

; <label>:128:                                    ; preds = %126
  br i1 %113, label %152, label %129

; <label>:129:                                    ; preds = %128
  br label %130

; <label>:130:                                    ; preds = %130, %129
  %131 = phi i64 [ %127, %129 ], [ %149, %130 ]
  %132 = load double, double* %116, align 8, !tbaa !1
  %133 = fmul double %132, 1.500000e+00
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %131, i64 %115
  %135 = load double, double* %134, align 8, !tbaa !1
  %136 = fmul double %133, %135
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %42, i64 %131
  %138 = load double, double* %137, align 8, !tbaa !1
  %139 = fadd double %138, %136
  store double %139, double* %137, align 8, !tbaa !1
  %140 = add nuw nsw i64 %131, 1
  %141 = load double, double* %116, align 8, !tbaa !1
  %142 = fmul double %141, 1.500000e+00
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %140, i64 %115
  %144 = load double, double* %143, align 8, !tbaa !1
  %145 = fmul double %142, %144
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %42, i64 %140
  %147 = load double, double* %146, align 8, !tbaa !1
  %148 = fadd double %147, %145
  store double %148, double* %146, align 8, !tbaa !1
  %149 = add nsw i64 %131, 2
  %150 = icmp eq i64 %149, %43
  br i1 %150, label %151, label %130

; <label>:151:                                    ; preds = %130
  br label %152

; <label>:152:                                    ; preds = %151, %128
  %153 = add nuw nsw i64 %115, 1
  %154 = icmp eq i64 %153, 1000
  br i1 %154, label %155, label %114

; <label>:155:                                    ; preds = %152
  %156 = add nuw nsw i64 %42, 1
  %157 = add nuw nsw i64 %43, 1
  %158 = icmp eq i64 %156, 1200
  br i1 %158, label %159, label %41

; <label>:159:                                    ; preds = %155
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %160 = icmp sgt i32 %0, 42
  br i1 %160, label %161, label %197

; <label>:161:                                    ; preds = %159
  %162 = load i8*, i8** %1, align 8, !tbaa !10
  %163 = load i8, i8* %162, align 1, !tbaa !12
  %164 = icmp eq i8 %163, 0
  br i1 %164, label %165, label %197

; <label>:165:                                    ; preds = %161
  %166 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %167 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %166) #4
  %168 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %169 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %168, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %170

; <label>:170:                                    ; preds = %189, %165
  %171 = phi i64 [ 0, %165 ], [ %190, %189 ]
  %172 = mul nuw nsw i64 %171, 1200
  br label %173

; <label>:173:                                    ; preds = %182, %170
  %174 = phi i64 [ 0, %170 ], [ %187, %182 ]
  %175 = add nuw nsw i64 %174, %172
  %176 = trunc i64 %175 to i32
  %177 = srem i32 %176, 20
  %178 = icmp eq i32 %177, 0
  br i1 %178, label %179, label %182

; <label>:179:                                    ; preds = %173
  %180 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %181 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %180) #4
  br label %182

; <label>:182:                                    ; preds = %179, %173
  %183 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %184 = getelementptr inbounds [1200 x double], [1200 x double]* %23, i64 %171, i64 %174
  %185 = load double, double* %184, align 8, !tbaa !1
  %186 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %183, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %185) #4
  %187 = add nuw nsw i64 %174, 1
  %188 = icmp eq i64 %187, 1200
  br i1 %188, label %189, label %173

; <label>:189:                                    ; preds = %182
  %190 = add nuw nsw i64 %171, 1
  %191 = icmp eq i64 %190, 1200
  br i1 %191, label %192, label %170

; <label>:192:                                    ; preds = %189
  %193 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %194 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %193, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %195 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !10
  %196 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %195) #4
  br label %197

; <label>:197:                                    ; preds = %192, %161, %159
  tail call void @free(i8* nonnull %3) #3
  tail call void @free(i8* %4) #3
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
