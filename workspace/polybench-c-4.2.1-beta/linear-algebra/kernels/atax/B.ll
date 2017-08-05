; ModuleID = 'A.ll'
source_filename = "atax.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #3
  %7 = bitcast i8* %4 to double*
  br label %8

; <label>:8:                                      ; preds = %8, %2
  %9 = phi i64 [ 0, %2 ], [ %27, %8 ]
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.100000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds double, double* %7, i64 %9
  store double %13, double* %14, align 8, !tbaa !1
  %15 = add nuw nsw i64 %9, 1
  %16 = trunc i64 %15 to i32
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 2.100000e+03
  %19 = fadd double %18, 1.000000e+00
  %20 = getelementptr inbounds double, double* %7, i64 %15
  store double %19, double* %20, align 8, !tbaa !1
  %21 = add nsw i64 %9, 2
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 2.100000e+03
  %25 = fadd double %24, 1.000000e+00
  %26 = getelementptr inbounds double, double* %7, i64 %21
  store double %25, double* %26, align 8, !tbaa !1
  %27 = add nsw i64 %9, 3
  %28 = icmp eq i64 %27, 2100
  br i1 %28, label %29, label %8

; <label>:29:                                     ; preds = %8
  %30 = bitcast i8* %3 to [2100 x double]*
  br label %31

; <label>:31:                                     ; preds = %50, %29
  %32 = phi i64 [ %51, %50 ], [ 0, %29 ]
  br label %33

; <label>:33:                                     ; preds = %33, %31
  %34 = phi i64 [ 0, %31 ], [ %48, %33 ]
  %35 = add nuw nsw i64 %34, %32
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 2100
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, 9.500000e+03
  %40 = getelementptr inbounds [2100 x double], [2100 x double]* %30, i64 %32, i64 %34
  store double %39, double* %40, align 8, !tbaa !1
  %41 = or i64 %34, 1
  %42 = add nuw nsw i64 %41, %32
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, 2100
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, 9.500000e+03
  %47 = getelementptr inbounds [2100 x double], [2100 x double]* %30, i64 %32, i64 %41
  store double %46, double* %47, align 8, !tbaa !1
  %48 = add nsw i64 %34, 2
  %49 = icmp eq i64 %48, 2100
  br i1 %49, label %50, label %33

; <label>:50:                                     ; preds = %33
  %51 = add nuw nsw i64 %32, 1
  %52 = icmp eq i64 %51, 1900
  br i1 %52, label %53, label %31

; <label>:53:                                     ; preds = %50
  tail call void (...) @polybench_timer_start() #3
  %54 = bitcast i8* %5 to double*
  %55 = bitcast i8* %6 to double*
  tail call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 16800, i32 8, i1 false) #3
  %56 = getelementptr i8, i8* %5, i64 8
  %57 = getelementptr i8, i8* %5, i64 16800
  br label %58

; <label>:58:                                     ; preds = %172, %53
  %59 = phi i64 [ 0, %53 ], [ %173, %172 ]
  %60 = mul i64 %59, 16800
  %61 = or i64 %60, 8
  %62 = getelementptr i8, i8* %3, i64 %61
  %63 = add i64 %60, 16800
  %64 = getelementptr i8, i8* %3, i64 %63
  %65 = getelementptr inbounds double, double* %55, i64 %59
  store double 0.000000e+00, double* %65, align 8, !tbaa !1
  br label %66

; <label>:66:                                     ; preds = %66, %58
  %67 = phi double [ 0.000000e+00, %58 ], [ %88, %66 ]
  %68 = phi i64 [ 0, %58 ], [ %89, %66 ]
  %69 = getelementptr inbounds [2100 x double], [2100 x double]* %30, i64 %59, i64 %68
  %70 = load double, double* %69, align 8, !tbaa !1
  %71 = getelementptr inbounds double, double* %7, i64 %68
  %72 = load double, double* %71, align 8, !tbaa !1
  %73 = fmul double %70, %72
  %74 = fadd double %67, %73
  store double %74, double* %65, align 8, !tbaa !1
  %75 = add nuw nsw i64 %68, 1
  %76 = getelementptr inbounds [2100 x double], [2100 x double]* %30, i64 %59, i64 %75
  %77 = load double, double* %76, align 8, !tbaa !1
  %78 = getelementptr inbounds double, double* %7, i64 %75
  %79 = load double, double* %78, align 8, !tbaa !1
  %80 = fmul double %77, %79
  %81 = fadd double %74, %80
  store double %81, double* %65, align 8, !tbaa !1
  %82 = add nsw i64 %68, 2
  %83 = getelementptr inbounds [2100 x double], [2100 x double]* %30, i64 %59, i64 %82
  %84 = load double, double* %83, align 8, !tbaa !1
  %85 = getelementptr inbounds double, double* %7, i64 %82
  %86 = load double, double* %85, align 8, !tbaa !1
  %87 = fmul double %84, %86
  %88 = fadd double %81, %87
  store double %88, double* %65, align 8, !tbaa !1
  %89 = add nsw i64 %68, 3
  %90 = icmp eq i64 %89, 2100
  br i1 %90, label %91, label %66

; <label>:91:                                     ; preds = %66
  %92 = load double, double* %54, align 8, !tbaa !1
  %93 = getelementptr inbounds [2100 x double], [2100 x double]* %30, i64 %59, i64 0
  %94 = load double, double* %93, align 8, !tbaa !1
  %95 = fmul double %88, %94
  %96 = fadd double %92, %95
  store double %96, double* %54, align 8, !tbaa !1
  %97 = bitcast double* %65 to i8*
  %98 = bitcast double* %65 to i8*
  %99 = icmp ult i8* %56, %98
  %100 = icmp ult i8* %97, %57
  %101 = and i1 %99, %100
  %102 = icmp ult i8* %56, %64
  %103 = icmp ult i8* %62, %57
  %104 = and i1 %102, %103
  %105 = or i1 %101, %104
  br i1 %105, label %136, label %106

; <label>:106:                                    ; preds = %91
  %107 = load double, double* %65, align 8, !tbaa !1, !alias.scope !5
  %108 = insertelement <2 x double> undef, double %107, i32 0
  %109 = insertelement <2 x double> %108, double %107, i32 1
  %110 = insertelement <2 x double> undef, double %107, i32 0
  %111 = insertelement <2 x double> %110, double %107, i32 1
  br label %112

; <label>:112:                                    ; preds = %112, %106
  %113 = phi i64 [ %133, %112 ], [ 0, %106 ]
  %114 = or i64 %113, 1
  %115 = getelementptr inbounds double, double* %54, i64 %114
  %116 = bitcast double* %115 to <2 x double>*
  %117 = load <2 x double>, <2 x double>* %116, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %118 = getelementptr double, double* %115, i64 2
  %119 = bitcast double* %118 to <2 x double>*
  %120 = load <2 x double>, <2 x double>* %119, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %121 = getelementptr inbounds [2100 x double], [2100 x double]* %30, i64 %59, i64 %114
  %122 = bitcast double* %121 to <2 x double>*
  %123 = load <2 x double>, <2 x double>* %122, align 8, !tbaa !1, !alias.scope !12
  %124 = getelementptr double, double* %121, i64 2
  %125 = bitcast double* %124 to <2 x double>*
  %126 = load <2 x double>, <2 x double>* %125, align 8, !tbaa !1, !alias.scope !12
  %127 = fmul <2 x double> %109, %123
  %128 = fmul <2 x double> %111, %126
  %129 = fadd <2 x double> %117, %127
  %130 = fadd <2 x double> %120, %128
  %131 = bitcast double* %115 to <2 x double>*
  store <2 x double> %129, <2 x double>* %131, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %132 = bitcast double* %118 to <2 x double>*
  store <2 x double> %130, <2 x double>* %132, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %133 = add i64 %113, 4
  %134 = icmp eq i64 %133, 2096
  br i1 %134, label %135, label %112, !llvm.loop !13

; <label>:135:                                    ; preds = %112
  br label %136

; <label>:136:                                    ; preds = %135, %91
  %137 = phi i64 [ 1, %91 ], [ 2097, %135 ]
  br i1 true, label %138, label %148

; <label>:138:                                    ; preds = %136
  br label %139

; <label>:139:                                    ; preds = %138
  %140 = load double, double* %65, align 8, !tbaa !1
  %141 = getelementptr inbounds double, double* %54, i64 %137
  %142 = load double, double* %141, align 8, !tbaa !1
  %143 = getelementptr inbounds [2100 x double], [2100 x double]* %30, i64 %59, i64 %137
  %144 = load double, double* %143, align 8, !tbaa !1
  %145 = fmul double %140, %144
  %146 = fadd double %142, %145
  store double %146, double* %141, align 8, !tbaa !1
  %147 = add nuw nsw i64 %137, 1
  br label %148

; <label>:148:                                    ; preds = %139, %136
  %149 = phi i64 [ %147, %139 ], [ %137, %136 ]
  br label %150

; <label>:150:                                    ; preds = %148
  br i1 false, label %172, label %151

; <label>:151:                                    ; preds = %150
  br label %152

; <label>:152:                                    ; preds = %152, %151
  %153 = phi i64 [ %149, %151 ], [ %169, %152 ]
  %154 = load double, double* %65, align 8, !tbaa !1
  %155 = getelementptr inbounds double, double* %54, i64 %153
  %156 = load double, double* %155, align 8, !tbaa !1
  %157 = getelementptr inbounds [2100 x double], [2100 x double]* %30, i64 %59, i64 %153
  %158 = load double, double* %157, align 8, !tbaa !1
  %159 = fmul double %154, %158
  %160 = fadd double %156, %159
  store double %160, double* %155, align 8, !tbaa !1
  %161 = add nuw nsw i64 %153, 1
  %162 = load double, double* %65, align 8, !tbaa !1
  %163 = getelementptr inbounds double, double* %54, i64 %161
  %164 = load double, double* %163, align 8, !tbaa !1
  %165 = getelementptr inbounds [2100 x double], [2100 x double]* %30, i64 %59, i64 %161
  %166 = load double, double* %165, align 8, !tbaa !1
  %167 = fmul double %162, %166
  %168 = fadd double %164, %167
  store double %168, double* %163, align 8, !tbaa !1
  %169 = add nsw i64 %153, 2
  %170 = icmp eq i64 %169, 2100
  br i1 %170, label %171, label %152, !llvm.loop !16

; <label>:171:                                    ; preds = %152
  br label %172

; <label>:172:                                    ; preds = %171, %150
  %173 = add nuw nsw i64 %59, 1
  %174 = icmp eq i64 %173, 1900
  br i1 %174, label %175, label %58

; <label>:175:                                    ; preds = %172
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %176 = icmp sgt i32 %0, 42
  br i1 %176, label %177, label %206

; <label>:177:                                    ; preds = %175
  %178 = load i8*, i8** %1, align 8, !tbaa !17
  %179 = load i8, i8* %178, align 1, !tbaa !19
  %180 = icmp eq i8 %179, 0
  br i1 %180, label %181, label %206

; <label>:181:                                    ; preds = %177
  %182 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %183 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %182) #5
  %184 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %185 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %184, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %186

; <label>:186:                                    ; preds = %194, %181
  %187 = phi i64 [ 0, %181 ], [ %199, %194 ]
  %188 = trunc i64 %187 to i32
  %189 = srem i32 %188, 20
  %190 = icmp eq i32 %189, 0
  br i1 %190, label %191, label %194

; <label>:191:                                    ; preds = %186
  %192 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %193 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %192) #5
  br label %194

; <label>:194:                                    ; preds = %191, %186
  %195 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %196 = getelementptr inbounds double, double* %54, i64 %187
  %197 = load double, double* %196, align 8, !tbaa !1
  %198 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %195, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %197) #5
  %199 = add nuw nsw i64 %187, 1
  %200 = icmp eq i64 %199, 2100
  br i1 %200, label %201, label %186

; <label>:201:                                    ; preds = %194
  %202 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %203 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %202, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %204 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %205 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %204) #5
  br label %206

; <label>:206:                                    ; preds = %201, %177, %175
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* nonnull %5) #3
  tail call void @free(i8* %6) #3
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
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = !{!6, !11}
!11 = distinct !{!11, !7}
!12 = !{!11}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}
!17 = !{!18, !18, i64 0}
!18 = !{!"any pointer", !3, i64 0}
!19 = !{!3, !3, i64 0}
