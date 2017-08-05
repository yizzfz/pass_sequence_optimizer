; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = bitcast i8* %3 to [1000 x double]*
  %6 = bitcast i8* %4 to [1200 x double]*
  br label %7

; <label>:7:                                      ; preds = %64, %2
  %8 = phi i64 [ 0, %2 ], [ %65, %64 ]
  %9 = icmp sgt i64 %8, 0
  br i1 %9, label %10, label %44

; <label>:10:                                     ; preds = %7
  %11 = and i64 %8, 1
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %20, label %13

; <label>:13:                                     ; preds = %10
  br label %14

; <label>:14:                                     ; preds = %13
  %15 = trunc i64 %8 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %8, i64 0
  store double %18, double* %19, align 8, !tbaa !1
  br label %20

; <label>:20:                                     ; preds = %14, %10
  %21 = phi i64 [ 1, %14 ], [ 0, %10 ]
  br label %22

; <label>:22:                                     ; preds = %20
  %23 = icmp eq i64 %8, 1
  br i1 %23, label %43, label %24

; <label>:24:                                     ; preds = %22
  br label %25

; <label>:25:                                     ; preds = %25, %24
  %26 = phi i64 [ %21, %24 ], [ %40, %25 ]
  %27 = add nuw nsw i64 %26, %8
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 1.000000e+03
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %8, i64 %26
  store double %31, double* %32, align 8, !tbaa !1
  %33 = add nuw nsw i64 %26, 1
  %34 = add nuw nsw i64 %33, %8
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 1000
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 1.000000e+03
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %8, i64 %33
  store double %38, double* %39, align 8, !tbaa !1
  %40 = add nsw i64 %26, 2
  %41 = icmp eq i64 %40, %8
  br i1 %41, label %42, label %25

; <label>:42:                                     ; preds = %25
  br label %43

; <label>:43:                                     ; preds = %42, %22
  br label %44

; <label>:44:                                     ; preds = %43, %7
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %8, i64 %8
  store double 1.000000e+00, double* %45, align 8, !tbaa !1
  %46 = add nuw nsw i64 %8, 1200
  br label %47

; <label>:47:                                     ; preds = %47, %44
  %48 = phi i64 [ 0, %44 ], [ %62, %47 ]
  %49 = sub nuw nsw i64 %46, %48
  %50 = trunc i64 %49 to i32
  %51 = srem i32 %50, 1200
  %52 = sitofp i32 %51 to double
  %53 = fdiv double %52, 1.200000e+03
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %8, i64 %48
  store double %53, double* %54, align 8, !tbaa !1
  %55 = or i64 %48, 1
  %56 = sub nuw nsw i64 %46, %55
  %57 = trunc i64 %56 to i32
  %58 = srem i32 %57, 1200
  %59 = sitofp i32 %58 to double
  %60 = fdiv double %59, 1.200000e+03
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %8, i64 %55
  store double %60, double* %61, align 8, !tbaa !1
  %62 = add nsw i64 %48, 2
  %63 = icmp eq i64 %62, 1200
  br i1 %63, label %64, label %47

; <label>:64:                                     ; preds = %47
  %65 = add nuw nsw i64 %8, 1
  %66 = icmp eq i64 %65, 1000
  br i1 %66, label %67, label %7

; <label>:67:                                     ; preds = %64
  tail call void (...) @polybench_timer_start() #3
  br label %73

; <label>:68:                                     ; preds = %158
  br label %70

; <label>:69:                                     ; preds = %86
  br label %70

; <label>:70:                                     ; preds = %69, %68
  %71 = add nuw nsw i64 %75, 1
  %72 = icmp eq i64 %77, 1000
  br i1 %72, label %163, label %73

; <label>:73:                                     ; preds = %70, %67
  %74 = phi i64 [ 0, %67 ], [ %77, %70 ]
  %75 = phi i64 [ 1, %67 ], [ %71, %70 ]
  %76 = sub i64 999, %74
  %77 = add nuw nsw i64 %74, 1
  %78 = icmp slt i64 %77, 1000
  br i1 %78, label %80, label %79

; <label>:79:                                     ; preds = %73
  br label %86

; <label>:80:                                     ; preds = %73
  %81 = and i64 %76, 1
  %82 = icmp eq i64 %81, 0
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %75, i64 %74
  %84 = add nuw nsw i64 %75, 1
  %85 = icmp eq i64 %74, 998
  br label %122

; <label>:86:                                     ; preds = %86, %79
  %87 = phi i64 [ 0, %79 ], [ %120, %86 ]
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %74, i64 %87
  %89 = bitcast double* %88 to <2 x double>*
  %90 = load <2 x double>, <2 x double>* %89, align 8, !tbaa !1
  %91 = getelementptr double, double* %88, i64 2
  %92 = bitcast double* %91 to <2 x double>*
  %93 = load <2 x double>, <2 x double>* %92, align 8, !tbaa !1
  %94 = fmul <2 x double> %90, <double 1.500000e+00, double 1.500000e+00>
  %95 = fmul <2 x double> %93, <double 1.500000e+00, double 1.500000e+00>
  %96 = bitcast double* %88 to <2 x double>*
  store <2 x double> %94, <2 x double>* %96, align 8, !tbaa !1
  %97 = bitcast double* %91 to <2 x double>*
  store <2 x double> %95, <2 x double>* %97, align 8, !tbaa !1
  %98 = add nuw nsw i64 %87, 4
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %74, i64 %98
  %100 = bitcast double* %99 to <2 x double>*
  %101 = load <2 x double>, <2 x double>* %100, align 8, !tbaa !1
  %102 = getelementptr double, double* %99, i64 2
  %103 = bitcast double* %102 to <2 x double>*
  %104 = load <2 x double>, <2 x double>* %103, align 8, !tbaa !1
  %105 = fmul <2 x double> %101, <double 1.500000e+00, double 1.500000e+00>
  %106 = fmul <2 x double> %104, <double 1.500000e+00, double 1.500000e+00>
  %107 = bitcast double* %99 to <2 x double>*
  store <2 x double> %105, <2 x double>* %107, align 8, !tbaa !1
  %108 = bitcast double* %102 to <2 x double>*
  store <2 x double> %106, <2 x double>* %108, align 8, !tbaa !1
  %109 = add nsw i64 %87, 8
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %74, i64 %109
  %111 = bitcast double* %110 to <2 x double>*
  %112 = load <2 x double>, <2 x double>* %111, align 8, !tbaa !1
  %113 = getelementptr double, double* %110, i64 2
  %114 = bitcast double* %113 to <2 x double>*
  %115 = load <2 x double>, <2 x double>* %114, align 8, !tbaa !1
  %116 = fmul <2 x double> %112, <double 1.500000e+00, double 1.500000e+00>
  %117 = fmul <2 x double> %115, <double 1.500000e+00, double 1.500000e+00>
  %118 = bitcast double* %110 to <2 x double>*
  store <2 x double> %116, <2 x double>* %118, align 8, !tbaa !1
  %119 = bitcast double* %113 to <2 x double>*
  store <2 x double> %117, <2 x double>* %119, align 8, !tbaa !1
  %120 = add nsw i64 %87, 12
  %121 = icmp eq i64 %120, 1200
  br i1 %121, label %69, label %86, !llvm.loop !5

; <label>:122:                                    ; preds = %158, %80
  %123 = phi i64 [ %161, %158 ], [ 0, %80 ]
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %74, i64 %123
  %125 = load double, double* %124, align 8, !tbaa !1
  br i1 %82, label %133, label %126

; <label>:126:                                    ; preds = %122
  br label %127

; <label>:127:                                    ; preds = %126
  %128 = load double, double* %83, align 8, !tbaa !1
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %75, i64 %123
  %130 = load double, double* %129, align 8, !tbaa !1
  %131 = fmul double %128, %130
  %132 = fadd double %125, %131
  store double %132, double* %124, align 8, !tbaa !1
  br label %133

; <label>:133:                                    ; preds = %127, %122
  %134 = phi double [ %132, %127 ], [ undef, %122 ]
  %135 = phi i64 [ %84, %127 ], [ %75, %122 ]
  %136 = phi double [ %132, %127 ], [ %125, %122 ]
  br label %137

; <label>:137:                                    ; preds = %133
  br i1 %85, label %158, label %138

; <label>:138:                                    ; preds = %137
  br label %139

; <label>:139:                                    ; preds = %139, %138
  %140 = phi i64 [ %135, %138 ], [ %155, %139 ]
  %141 = phi double [ %136, %138 ], [ %154, %139 ]
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %140, i64 %74
  %143 = load double, double* %142, align 8, !tbaa !1
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %140, i64 %123
  %145 = load double, double* %144, align 8, !tbaa !1
  %146 = fmul double %143, %145
  %147 = fadd double %141, %146
  store double %147, double* %124, align 8, !tbaa !1
  %148 = add nuw nsw i64 %140, 1
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %148, i64 %74
  %150 = load double, double* %149, align 8, !tbaa !1
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %148, i64 %123
  %152 = load double, double* %151, align 8, !tbaa !1
  %153 = fmul double %150, %152
  %154 = fadd double %147, %153
  store double %154, double* %124, align 8, !tbaa !1
  %155 = add nsw i64 %140, 2
  %156 = icmp eq i64 %155, 1000
  br i1 %156, label %157, label %139

; <label>:157:                                    ; preds = %139
  br label %158

; <label>:158:                                    ; preds = %157, %137
  %159 = phi double [ %134, %137 ], [ %154, %157 ]
  %160 = fmul double %159, 1.500000e+00
  store double %160, double* %124, align 8, !tbaa !1
  %161 = add nuw nsw i64 %123, 1
  %162 = icmp eq i64 %161, 1200
  br i1 %162, label %68, label %122

; <label>:163:                                    ; preds = %70
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %164 = icmp sgt i32 %0, 42
  br i1 %164, label %165, label %201

; <label>:165:                                    ; preds = %163
  %166 = load i8*, i8** %1, align 8, !tbaa !8
  %167 = load i8, i8* %166, align 1, !tbaa !10
  %168 = icmp eq i8 %167, 0
  br i1 %168, label %169, label %201

; <label>:169:                                    ; preds = %165
  %170 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %171 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %170) #4
  %172 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %173 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %172, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %174

; <label>:174:                                    ; preds = %193, %169
  %175 = phi i64 [ 0, %169 ], [ %194, %193 ]
  %176 = mul nuw nsw i64 %175, 1000
  br label %177

; <label>:177:                                    ; preds = %186, %174
  %178 = phi i64 [ 0, %174 ], [ %191, %186 ]
  %179 = add nuw nsw i64 %178, %176
  %180 = trunc i64 %179 to i32
  %181 = srem i32 %180, 20
  %182 = icmp eq i32 %181, 0
  br i1 %182, label %183, label %186

; <label>:183:                                    ; preds = %177
  %184 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %185 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %184) #4
  br label %186

; <label>:186:                                    ; preds = %183, %177
  %187 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %188 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %175, i64 %178
  %189 = load double, double* %188, align 8, !tbaa !1
  %190 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %187, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %189) #4
  %191 = add nuw nsw i64 %178, 1
  %192 = icmp eq i64 %191, 1200
  br i1 %192, label %193, label %177

; <label>:193:                                    ; preds = %186
  %194 = add nuw nsw i64 %175, 1
  %195 = icmp eq i64 %194, 1000
  br i1 %195, label %196, label %174

; <label>:196:                                    ; preds = %193
  %197 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %198 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %197, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %199 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !8
  %200 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %199) #4
  br label %201

; <label>:201:                                    ; preds = %196, %165, %163
  tail call void @free(i8* %3) #3
  tail call void @free(i8* nonnull %4) #3
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
!8 = !{!9, !9, i64 0}
!9 = !{!"any pointer", !3, i64 0}
!10 = !{!3, !3, i64 0}
