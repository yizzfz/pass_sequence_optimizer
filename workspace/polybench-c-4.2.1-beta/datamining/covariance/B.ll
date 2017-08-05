; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %6 = bitcast i8* %3 to [1200 x double]*
  br label %7

; <label>:7:                                      ; preds = %26, %2
  %8 = phi i64 [ 0, %2 ], [ %27, %26 ]
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  br label %11

; <label>:11:                                     ; preds = %11, %7
  %12 = phi i64 [ 0, %7 ], [ %24, %11 ]
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fmul double %10, %14
  %16 = fdiv double %15, 1.200000e+03
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %8, i64 %12
  store double %16, double* %17, align 8, !tbaa !1
  %18 = or i64 %12, 1
  %19 = trunc i64 %18 to i32
  %20 = sitofp i32 %19 to double
  %21 = fmul double %10, %20
  %22 = fdiv double %21, 1.200000e+03
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %8, i64 %18
  store double %22, double* %23, align 8, !tbaa !1
  %24 = add nsw i64 %12, 2
  %25 = icmp eq i64 %24, 1200
  br i1 %25, label %26, label %11

; <label>:26:                                     ; preds = %11
  %27 = add nuw nsw i64 %8, 1
  %28 = icmp eq i64 %27, 1400
  br i1 %28, label %29, label %7

; <label>:29:                                     ; preds = %26
  tail call void (...) @polybench_timer_start() #3
  %30 = bitcast i8* %5 to double*
  br label %31

; <label>:31:                                     ; preds = %58, %29
  %32 = phi i64 [ 0, %29 ], [ %60, %58 ]
  %33 = getelementptr inbounds double, double* %30, i64 %32
  store double 0.000000e+00, double* %33, align 8, !tbaa !1
  br label %34

; <label>:34:                                     ; preds = %34, %31
  %35 = phi i64 [ 0, %31 ], [ %56, %34 ]
  %36 = phi double [ 0.000000e+00, %31 ], [ %55, %34 ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %35, i64 %32
  %38 = load double, double* %37, align 8, !tbaa !1
  %39 = fadd double %36, %38
  store double %39, double* %33, align 8, !tbaa !1
  %40 = add nuw nsw i64 %35, 1
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %40, i64 %32
  %42 = load double, double* %41, align 8, !tbaa !1
  %43 = fadd double %39, %42
  store double %43, double* %33, align 8, !tbaa !1
  %44 = add nsw i64 %35, 2
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %44, i64 %32
  %46 = load double, double* %45, align 8, !tbaa !1
  %47 = fadd double %43, %46
  store double %47, double* %33, align 8, !tbaa !1
  %48 = add nsw i64 %35, 3
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %48, i64 %32
  %50 = load double, double* %49, align 8, !tbaa !1
  %51 = fadd double %47, %50
  store double %51, double* %33, align 8, !tbaa !1
  %52 = add nsw i64 %35, 4
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %52, i64 %32
  %54 = load double, double* %53, align 8, !tbaa !1
  %55 = fadd double %51, %54
  store double %55, double* %33, align 8, !tbaa !1
  %56 = add nsw i64 %35, 5
  %57 = icmp eq i64 %56, 1400
  br i1 %57, label %58, label %34

; <label>:58:                                     ; preds = %34
  %59 = fdiv double %55, 1.400000e+03
  store double %59, double* %33, align 8, !tbaa !1
  %60 = add nuw nsw i64 %32, 1
  %61 = icmp eq i64 %60, 1200
  br i1 %61, label %62, label %31

; <label>:62:                                     ; preds = %58
  %63 = bitcast i8* %4 to [1200 x double]*
  %64 = getelementptr i8, i8* %5, i64 9600
  br label %65

; <label>:65:                                     ; preds = %142, %62
  %66 = phi i64 [ %143, %142 ], [ 0, %62 ]
  %67 = mul i64 %66, 9600
  %68 = getelementptr i8, i8* %3, i64 %67
  %69 = add i64 %67, 9600
  %70 = getelementptr i8, i8* %3, i64 %69
  %71 = icmp ult i8* %68, %64
  %72 = icmp ult i8* %5, %70
  %73 = and i1 %71, %72
  br i1 %73, label %75, label %74

; <label>:74:                                     ; preds = %65
  br label %76

; <label>:75:                                     ; preds = %65
  br label %113

; <label>:76:                                     ; preds = %76, %74
  %77 = phi i64 [ 0, %74 ], [ %111, %76 ]
  %78 = getelementptr inbounds double, double* %30, i64 %77
  %79 = bitcast double* %78 to <2 x double>*
  %80 = load <2 x double>, <2 x double>* %79, align 8, !tbaa !1, !alias.scope !5
  %81 = getelementptr double, double* %78, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  %83 = load <2 x double>, <2 x double>* %82, align 8, !tbaa !1, !alias.scope !5
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %66, i64 %77
  %85 = bitcast double* %84 to <2 x double>*
  %86 = load <2 x double>, <2 x double>* %85, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %87 = getelementptr double, double* %84, i64 2
  %88 = bitcast double* %87 to <2 x double>*
  %89 = load <2 x double>, <2 x double>* %88, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %90 = fsub <2 x double> %86, %80
  %91 = fsub <2 x double> %89, %83
  %92 = bitcast double* %84 to <2 x double>*
  store <2 x double> %90, <2 x double>* %92, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %93 = bitcast double* %87 to <2 x double>*
  store <2 x double> %91, <2 x double>* %93, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %94 = or i64 %77, 4
  %95 = getelementptr inbounds double, double* %30, i64 %94
  %96 = bitcast double* %95 to <2 x double>*
  %97 = load <2 x double>, <2 x double>* %96, align 8, !tbaa !1, !alias.scope !5
  %98 = getelementptr double, double* %95, i64 2
  %99 = bitcast double* %98 to <2 x double>*
  %100 = load <2 x double>, <2 x double>* %99, align 8, !tbaa !1, !alias.scope !5
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %66, i64 %94
  %102 = bitcast double* %101 to <2 x double>*
  %103 = load <2 x double>, <2 x double>* %102, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %104 = getelementptr double, double* %101, i64 2
  %105 = bitcast double* %104 to <2 x double>*
  %106 = load <2 x double>, <2 x double>* %105, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %107 = fsub <2 x double> %103, %97
  %108 = fsub <2 x double> %106, %100
  %109 = bitcast double* %101 to <2 x double>*
  store <2 x double> %107, <2 x double>* %109, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %110 = bitcast double* %104 to <2 x double>*
  store <2 x double> %108, <2 x double>* %110, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %111 = add nsw i64 %77, 8
  %112 = icmp eq i64 %111, 1200
  br i1 %112, label %141, label %76, !llvm.loop !10

; <label>:113:                                    ; preds = %113, %75
  %114 = phi i64 [ 0, %75 ], [ %138, %113 ]
  %115 = getelementptr inbounds double, double* %30, i64 %114
  %116 = load double, double* %115, align 8, !tbaa !1
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %66, i64 %114
  %118 = load double, double* %117, align 8, !tbaa !1
  %119 = fsub double %118, %116
  store double %119, double* %117, align 8, !tbaa !1
  %120 = or i64 %114, 1
  %121 = getelementptr inbounds double, double* %30, i64 %120
  %122 = load double, double* %121, align 8, !tbaa !1
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %66, i64 %120
  %124 = load double, double* %123, align 8, !tbaa !1
  %125 = fsub double %124, %122
  store double %125, double* %123, align 8, !tbaa !1
  %126 = or i64 %114, 2
  %127 = getelementptr inbounds double, double* %30, i64 %126
  %128 = load double, double* %127, align 8, !tbaa !1
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %66, i64 %126
  %130 = load double, double* %129, align 8, !tbaa !1
  %131 = fsub double %130, %128
  store double %131, double* %129, align 8, !tbaa !1
  %132 = or i64 %114, 3
  %133 = getelementptr inbounds double, double* %30, i64 %132
  %134 = load double, double* %133, align 8, !tbaa !1
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %66, i64 %132
  %136 = load double, double* %135, align 8, !tbaa !1
  %137 = fsub double %136, %134
  store double %137, double* %135, align 8, !tbaa !1
  %138 = add nsw i64 %114, 4
  %139 = icmp eq i64 %138, 1200
  br i1 %139, label %140, label %113, !llvm.loop !13

; <label>:140:                                    ; preds = %113
  br label %142

; <label>:141:                                    ; preds = %76
  br label %142

; <label>:142:                                    ; preds = %141, %140
  %143 = add nuw nsw i64 %66, 1
  %144 = icmp eq i64 %143, 1400
  br i1 %144, label %145, label %65

; <label>:145:                                    ; preds = %142
  br label %146

; <label>:146:                                    ; preds = %174, %145
  %147 = phi i64 [ %175, %174 ], [ 0, %145 ]
  br label %148

; <label>:148:                                    ; preds = %169, %146
  %149 = phi i64 [ %147, %146 ], [ %172, %169 ]
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %63, i64 %147, i64 %149
  store double 0.000000e+00, double* %150, align 8, !tbaa !1
  br label %151

; <label>:151:                                    ; preds = %151, %148
  %152 = phi i64 [ 0, %148 ], [ %167, %151 ]
  %153 = phi double [ 0.000000e+00, %148 ], [ %166, %151 ]
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %152, i64 %147
  %155 = load double, double* %154, align 8, !tbaa !1
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %152, i64 %149
  %157 = load double, double* %156, align 8, !tbaa !1
  %158 = fmul double %155, %157
  %159 = fadd double %153, %158
  store double %159, double* %150, align 8, !tbaa !1
  %160 = or i64 %152, 1
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %160, i64 %147
  %162 = load double, double* %161, align 8, !tbaa !1
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %160, i64 %149
  %164 = load double, double* %163, align 8, !tbaa !1
  %165 = fmul double %162, %164
  %166 = fadd double %159, %165
  store double %166, double* %150, align 8, !tbaa !1
  %167 = add nsw i64 %152, 2
  %168 = icmp eq i64 %167, 1400
  br i1 %168, label %169, label %151

; <label>:169:                                    ; preds = %151
  %170 = fdiv double %166, 1.399000e+03
  store double %170, double* %150, align 8, !tbaa !1
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %63, i64 %149, i64 %147
  store double %170, double* %171, align 8, !tbaa !1
  %172 = add nuw nsw i64 %149, 1
  %173 = icmp eq i64 %172, 1200
  br i1 %173, label %174, label %148

; <label>:174:                                    ; preds = %169
  %175 = add nuw nsw i64 %147, 1
  %176 = icmp eq i64 %175, 1200
  br i1 %176, label %177, label %146

; <label>:177:                                    ; preds = %174
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %178 = icmp sgt i32 %0, 42
  br i1 %178, label %179, label %215

; <label>:179:                                    ; preds = %177
  %180 = load i8*, i8** %1, align 8, !tbaa !14
  %181 = load i8, i8* %180, align 1, !tbaa !16
  %182 = icmp eq i8 %181, 0
  br i1 %182, label %183, label %215

; <label>:183:                                    ; preds = %179
  %184 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %185 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %184) #4
  %186 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %187 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %186, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %188

; <label>:188:                                    ; preds = %207, %183
  %189 = phi i64 [ 0, %183 ], [ %208, %207 ]
  %190 = mul nuw nsw i64 %189, 1200
  br label %191

; <label>:191:                                    ; preds = %200, %188
  %192 = phi i64 [ 0, %188 ], [ %205, %200 ]
  %193 = add nuw nsw i64 %192, %190
  %194 = trunc i64 %193 to i32
  %195 = srem i32 %194, 20
  %196 = icmp eq i32 %195, 0
  br i1 %196, label %197, label %200

; <label>:197:                                    ; preds = %191
  %198 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %199 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %198) #4
  br label %200

; <label>:200:                                    ; preds = %197, %191
  %201 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %202 = getelementptr inbounds [1200 x double], [1200 x double]* %63, i64 %189, i64 %192
  %203 = load double, double* %202, align 8, !tbaa !1
  %204 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %201, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %203) #4
  %205 = add nuw nsw i64 %192, 1
  %206 = icmp eq i64 %205, 1200
  br i1 %206, label %207, label %191

; <label>:207:                                    ; preds = %200
  %208 = add nuw nsw i64 %189, 1
  %209 = icmp eq i64 %208, 1200
  br i1 %209, label %210, label %188

; <label>:210:                                    ; preds = %207
  %211 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %212 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %211, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #4
  %213 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %214 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %213) #4
  br label %215

; <label>:215:                                    ; preds = %210, %179, %177
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
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.vectorize.width", i32 1}
!12 = !{!"llvm.loop.interleave.count", i32 1}
!13 = distinct !{!13, !11, !12}
!14 = !{!15, !15, i64 0}
!15 = !{!"any pointer", !3, i64 0}
!16 = !{!3, !3, i64 0}
