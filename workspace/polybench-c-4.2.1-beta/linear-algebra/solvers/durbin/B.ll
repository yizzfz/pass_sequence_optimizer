; ModuleID = 'A.ll'
source_filename = "durbin.c"
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
  %3 = alloca [2000 x double], align 16
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = bitcast i8* %4 to double*
  br label %7

; <label>:7:                                      ; preds = %7, %2
  %8 = phi i64 [ 0, %2 ], [ %33, %7 ]
  %9 = sub nuw nsw i64 2001, %8
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %6, i64 %8
  store double %11, double* %12, align 8, !tbaa !1
  %13 = add nuw nsw i64 %8, 1
  %14 = sub i64 2000, %8
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %6, i64 %13
  store double %16, double* %17, align 8, !tbaa !1
  %18 = add nsw i64 %8, 2
  %19 = sub i64 1999, %8
  %20 = trunc i64 %19 to i32
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds double, double* %6, i64 %18
  store double %21, double* %22, align 8, !tbaa !1
  %23 = add nsw i64 %8, 3
  %24 = sub i64 1998, %8
  %25 = trunc i64 %24 to i32
  %26 = sitofp i32 %25 to double
  %27 = getelementptr inbounds double, double* %6, i64 %23
  store double %26, double* %27, align 8, !tbaa !1
  %28 = add nsw i64 %8, 4
  %29 = sub i64 1997, %8
  %30 = trunc i64 %29 to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds double, double* %6, i64 %28
  store double %31, double* %32, align 8, !tbaa !1
  %33 = add nsw i64 %8, 5
  %34 = icmp eq i64 %33, 2000
  br i1 %34, label %35, label %7

; <label>:35:                                     ; preds = %7
  tail call void (...) @polybench_timer_start() #4
  %36 = bitcast i8* %5 to double*
  %37 = bitcast [2000 x double]* %3 to i8*
  call void @llvm.lifetime.start(i64 16000, i8* nonnull %37) #4
  %38 = load double, double* %6, align 8, !tbaa !1
  %39 = fsub double -0.000000e+00, %38
  store double %39, double* %36, align 8, !tbaa !1
  %40 = load double, double* %6, align 8, !tbaa !1
  %41 = fsub double -0.000000e+00, %40
  br label %42

; <label>:42:                                     ; preds = %175, %35
  %43 = phi i64 [ 1, %35 ], [ %178, %175 ]
  %44 = phi i64 [ 0, %35 ], [ %179, %175 ]
  %45 = phi double [ 1.000000e+00, %35 ], [ %116, %175 ]
  %46 = phi double [ %41, %35 ], [ %121, %175 ]
  %47 = add i64 %44, 1
  %48 = add i64 %44, 1
  %49 = shl i64 %44, 3
  %50 = fmul double %46, %46
  %51 = fsub double 1.000000e+00, %50
  %52 = add nsw i64 %43, -1
  %53 = and i64 %47, 3
  %54 = icmp eq i64 %53, 0
  br i1 %54, label %71, label %55

; <label>:55:                                     ; preds = %42
  br label %56

; <label>:56:                                     ; preds = %56, %55
  %57 = phi i64 [ 0, %55 ], [ %67, %56 ]
  %58 = phi double [ 0.000000e+00, %55 ], [ %66, %56 ]
  %59 = phi i64 [ %53, %55 ], [ %68, %56 ]
  %60 = sub nsw i64 %52, %57
  %61 = getelementptr inbounds double, double* %6, i64 %60
  %62 = load double, double* %61, align 8, !tbaa !1
  %63 = getelementptr inbounds double, double* %36, i64 %57
  %64 = load double, double* %63, align 8, !tbaa !1
  %65 = fmul double %62, %64
  %66 = fadd double %58, %65
  %67 = add nuw nsw i64 %57, 1
  %68 = add i64 %59, -1
  %69 = icmp eq i64 %68, 0
  br i1 %69, label %70, label %56, !llvm.loop !5

; <label>:70:                                     ; preds = %56
  br label %71

; <label>:71:                                     ; preds = %70, %42
  %72 = phi double [ undef, %42 ], [ %66, %70 ]
  %73 = phi i64 [ 0, %42 ], [ %67, %70 ]
  %74 = phi double [ 0.000000e+00, %42 ], [ %66, %70 ]
  %75 = icmp ult i64 %44, 3
  br i1 %75, label %114, label %76

; <label>:76:                                     ; preds = %71
  br label %77

; <label>:77:                                     ; preds = %77, %76
  %78 = phi i64 [ %73, %76 ], [ %111, %77 ]
  %79 = phi double [ %74, %76 ], [ %110, %77 ]
  %80 = sub nsw i64 %52, %78
  %81 = getelementptr inbounds double, double* %6, i64 %80
  %82 = load double, double* %81, align 8, !tbaa !1
  %83 = getelementptr inbounds double, double* %36, i64 %78
  %84 = load double, double* %83, align 8, !tbaa !1
  %85 = fmul double %82, %84
  %86 = fadd double %79, %85
  %87 = add nuw nsw i64 %78, 1
  %88 = sub nsw i64 %52, %87
  %89 = getelementptr inbounds double, double* %6, i64 %88
  %90 = load double, double* %89, align 8, !tbaa !1
  %91 = getelementptr inbounds double, double* %36, i64 %87
  %92 = load double, double* %91, align 8, !tbaa !1
  %93 = fmul double %90, %92
  %94 = fadd double %86, %93
  %95 = add nsw i64 %78, 2
  %96 = sub nsw i64 %52, %95
  %97 = getelementptr inbounds double, double* %6, i64 %96
  %98 = load double, double* %97, align 8, !tbaa !1
  %99 = getelementptr inbounds double, double* %36, i64 %95
  %100 = load double, double* %99, align 8, !tbaa !1
  %101 = fmul double %98, %100
  %102 = fadd double %94, %101
  %103 = add nsw i64 %78, 3
  %104 = sub nsw i64 %52, %103
  %105 = getelementptr inbounds double, double* %6, i64 %104
  %106 = load double, double* %105, align 8, !tbaa !1
  %107 = getelementptr inbounds double, double* %36, i64 %103
  %108 = load double, double* %107, align 8, !tbaa !1
  %109 = fmul double %106, %108
  %110 = fadd double %102, %109
  %111 = add nsw i64 %78, 4
  %112 = icmp eq i64 %111, %43
  br i1 %112, label %113, label %77

; <label>:113:                                    ; preds = %77
  br label %114

; <label>:114:                                    ; preds = %113, %71
  %115 = phi double [ %72, %71 ], [ %110, %113 ]
  %116 = fmul double %45, %51
  %117 = getelementptr inbounds double, double* %6, i64 %43
  %118 = load double, double* %117, align 8, !tbaa !1
  %119 = fadd double %115, %118
  %120 = fsub double -0.000000e+00, %119
  %121 = fdiv double %120, %116
  %122 = icmp ult i64 %48, 4
  br i1 %122, label %160, label %123

; <label>:123:                                    ; preds = %114
  %124 = and i64 %48, -4
  %125 = icmp eq i64 %124, 0
  br i1 %125, label %160, label %126

; <label>:126:                                    ; preds = %123
  %127 = insertelement <2 x double> undef, double %121, i32 0
  %128 = shufflevector <2 x double> %127, <2 x double> undef, <2 x i32> zeroinitializer
  br label %129

; <label>:129:                                    ; preds = %129, %126
  %130 = phi i64 [ 0, %126 ], [ %156, %129 ]
  %131 = getelementptr inbounds double, double* %36, i64 %130
  %132 = bitcast double* %131 to <2 x double>*
  %133 = load <2 x double>, <2 x double>* %132, align 8, !tbaa !1
  %134 = getelementptr double, double* %131, i64 2
  %135 = bitcast double* %134 to <2 x double>*
  %136 = load <2 x double>, <2 x double>* %135, align 8, !tbaa !1
  %137 = sub nsw i64 %52, %130
  %138 = getelementptr inbounds double, double* %36, i64 %137
  %139 = getelementptr double, double* %138, i64 -1
  %140 = bitcast double* %139 to <2 x double>*
  %141 = load <2 x double>, <2 x double>* %140, align 8, !tbaa !1
  %142 = shufflevector <2 x double> %141, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %143 = getelementptr double, double* %138, i64 -2
  %144 = getelementptr double, double* %143, i64 -1
  %145 = bitcast double* %144 to <2 x double>*
  %146 = load <2 x double>, <2 x double>* %145, align 8, !tbaa !1
  %147 = shufflevector <2 x double> %146, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %148 = fmul <2 x double> %128, %142
  %149 = fmul <2 x double> %128, %147
  %150 = fadd <2 x double> %133, %148
  %151 = fadd <2 x double> %136, %149
  %152 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %130
  %153 = bitcast double* %152 to <2 x double>*
  store <2 x double> %150, <2 x double>* %153, align 16, !tbaa !1
  %154 = getelementptr double, double* %152, i64 2
  %155 = bitcast double* %154 to <2 x double>*
  store <2 x double> %151, <2 x double>* %155, align 16, !tbaa !1
  %156 = add i64 %130, 4
  %157 = icmp eq i64 %156, %124
  br i1 %157, label %158, label %129, !llvm.loop !7

; <label>:158:                                    ; preds = %129
  %159 = icmp eq i64 %48, %124
  br i1 %159, label %175, label %160

; <label>:160:                                    ; preds = %158, %123, %114
  %161 = phi i64 [ 0, %123 ], [ 0, %114 ], [ %124, %158 ]
  br label %162

; <label>:162:                                    ; preds = %162, %160
  %163 = phi i64 [ %172, %162 ], [ %161, %160 ]
  %164 = getelementptr inbounds double, double* %36, i64 %163
  %165 = load double, double* %164, align 8, !tbaa !1
  %166 = sub nsw i64 %52, %163
  %167 = getelementptr inbounds double, double* %36, i64 %166
  %168 = load double, double* %167, align 8, !tbaa !1
  %169 = fmul double %121, %168
  %170 = fadd double %165, %169
  %171 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %163
  store double %170, double* %171, align 8, !tbaa !1
  %172 = add nuw nsw i64 %163, 1
  %173 = icmp eq i64 %172, %43
  br i1 %173, label %174, label %162, !llvm.loop !10

; <label>:174:                                    ; preds = %162
  br label %175

; <label>:175:                                    ; preds = %174, %158
  %176 = add nuw nsw i64 %49, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %5, i8* nonnull %37, i64 %176, i32 8, i1 false) #4
  %177 = getelementptr inbounds double, double* %36, i64 %43
  store double %121, double* %177, align 8, !tbaa !1
  %178 = add nuw nsw i64 %43, 1
  %179 = add nuw nsw i64 %44, 1
  %180 = icmp eq i64 %179, 1999
  br i1 %180, label %181, label %42

; <label>:181:                                    ; preds = %175
  call void @llvm.lifetime.end(i64 16000, i8* nonnull %37) #4
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %182 = icmp sgt i32 %0, 42
  br i1 %182, label %183, label %212

; <label>:183:                                    ; preds = %181
  %184 = load i8*, i8** %1, align 8, !tbaa !12
  %185 = load i8, i8* %184, align 1, !tbaa !14
  %186 = icmp eq i8 %185, 0
  br i1 %186, label %187, label %212

; <label>:187:                                    ; preds = %183
  %188 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %189 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %188) #5
  %190 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %191 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %190, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %192

; <label>:192:                                    ; preds = %200, %187
  %193 = phi i64 [ 0, %187 ], [ %205, %200 ]
  %194 = trunc i64 %193 to i32
  %195 = srem i32 %194, 20
  %196 = icmp eq i32 %195, 0
  br i1 %196, label %197, label %200

; <label>:197:                                    ; preds = %192
  %198 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %199 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %198) #5
  br label %200

; <label>:200:                                    ; preds = %197, %192
  %201 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %202 = getelementptr inbounds double, double* %36, i64 %193
  %203 = load double, double* %202, align 8, !tbaa !1
  %204 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %201, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %203) #5
  %205 = add nuw nsw i64 %193, 1
  %206 = icmp eq i64 %205, 2000
  br i1 %206, label %207, label %192

; <label>:207:                                    ; preds = %200
  %208 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %209 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %208, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %210 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %211 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %210) #5
  br label %212

; <label>:212:                                    ; preds = %207, %183, %181
  tail call void @free(i8* %4) #4
  tail call void @free(i8* nonnull %5) #4
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"double", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.vectorize.width", i32 1}
!9 = !{!"llvm.loop.interleave.count", i32 1}
!10 = distinct !{!10, !11, !8, !9}
!11 = !{!"llvm.loop.unroll.runtime.disable"}
!12 = !{!13, !13, i64 0}
!13 = !{!"any pointer", !3, i64 0}
!14 = !{!3, !3, i64 0}
