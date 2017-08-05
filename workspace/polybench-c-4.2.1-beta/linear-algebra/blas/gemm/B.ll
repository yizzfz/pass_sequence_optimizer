; ModuleID = 'A.ll'
source_filename = "gemm.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #3
  %6 = bitcast i8* %3 to [1100 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  br label %8

; <label>:8:                                      ; preds = %21, %2
  %9 = phi i64 [ 0, %2 ], [ %22, %21 ]
  br label %10

; <label>:10:                                     ; preds = %10, %8
  %11 = phi i64 [ 0, %8 ], [ %19, %10 ]
  %12 = mul nuw nsw i64 %11, %9
  %13 = add nuw nsw i64 %12, 1
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 1000
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.000000e+03
  %18 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %9, i64 %11
  store double %17, double* %18, align 8, !tbaa !1
  %19 = add nuw nsw i64 %11, 1
  %20 = icmp eq i64 %19, 1100
  br i1 %20, label %21, label %10

; <label>:21:                                     ; preds = %10
  %22 = add nuw nsw i64 %9, 1
  %23 = icmp eq i64 %22, 1000
  br i1 %23, label %24, label %8

; <label>:24:                                     ; preds = %21
  %25 = bitcast i8* %5 to [1100 x double]*
  br label %26

; <label>:26:                                     ; preds = %45, %24
  %27 = phi i64 [ %46, %45 ], [ 0, %24 ]
  br label %28

; <label>:28:                                     ; preds = %28, %26
  %29 = phi i64 [ 0, %26 ], [ %37, %28 ]
  %30 = or i64 %29, 1
  %31 = mul nuw nsw i64 %30, %27
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 1200
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, 1.200000e+03
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %27, i64 %29
  store double %35, double* %36, align 8, !tbaa !1
  %37 = add nsw i64 %29, 2
  %38 = mul nuw nsw i64 %37, %27
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, 1200
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, 1.200000e+03
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %27, i64 %30
  store double %42, double* %43, align 8, !tbaa !1
  %44 = icmp eq i64 %37, 1200
  br i1 %44, label %45, label %28

; <label>:45:                                     ; preds = %28
  %46 = add nuw nsw i64 %27, 1
  %47 = icmp eq i64 %46, 1000
  br i1 %47, label %48, label %26

; <label>:48:                                     ; preds = %45
  br label %49

; <label>:49:                                     ; preds = %62, %48
  %50 = phi i64 [ %63, %62 ], [ 0, %48 ]
  br label %51

; <label>:51:                                     ; preds = %51, %49
  %52 = phi i64 [ 0, %49 ], [ %60, %51 ]
  %53 = add nuw nsw i64 %52, 2
  %54 = mul nuw nsw i64 %53, %50
  %55 = trunc i64 %54 to i32
  %56 = srem i32 %55, 1100
  %57 = sitofp i32 %56 to double
  %58 = fdiv double %57, 1.100000e+03
  %59 = getelementptr inbounds [1100 x double], [1100 x double]* %25, i64 %50, i64 %52
  store double %58, double* %59, align 8, !tbaa !1
  %60 = add nuw nsw i64 %52, 1
  %61 = icmp eq i64 %60, 1100
  br i1 %61, label %62, label %51

; <label>:62:                                     ; preds = %51
  %63 = add nuw nsw i64 %50, 1
  %64 = icmp eq i64 %63, 1200
  br i1 %64, label %65, label %49

; <label>:65:                                     ; preds = %62
  tail call void (...) @polybench_timer_start() #3
  br label %66

; <label>:66:                                     ; preds = %160, %65
  %67 = phi i64 [ 0, %65 ], [ %161, %160 ]
  %68 = mul i64 %67, 8800
  %69 = getelementptr i8, i8* %3, i64 %68
  %70 = add i64 %68, 8800
  %71 = getelementptr i8, i8* %3, i64 %70
  br label %72

; <label>:72:                                     ; preds = %202, %66
  %73 = phi i64 [ 0, %66 ], [ %213, %202 ]
  %74 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %67, i64 %73
  %75 = bitcast double* %74 to <2 x double>*
  %76 = load <2 x double>, <2 x double>* %75, align 8, !tbaa !1
  %77 = getelementptr double, double* %74, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %79 = load <2 x double>, <2 x double>* %78, align 8, !tbaa !1
  %80 = fmul <2 x double> %76, <double 1.200000e+00, double 1.200000e+00>
  %81 = fmul <2 x double> %79, <double 1.200000e+00, double 1.200000e+00>
  %82 = bitcast double* %74 to <2 x double>*
  store <2 x double> %80, <2 x double>* %82, align 8, !tbaa !1
  %83 = bitcast double* %77 to <2 x double>*
  store <2 x double> %81, <2 x double>* %83, align 8, !tbaa !1
  %84 = or i64 %73, 4
  %85 = icmp eq i64 %84, 1100
  br i1 %85, label %86, label %202, !llvm.loop !5

; <label>:86:                                     ; preds = %72
  br label %87

; <label>:87:                                     ; preds = %157, %86
  %88 = phi i64 [ %158, %157 ], [ 0, %86 ]
  %89 = mul i64 %88, 8800
  %90 = getelementptr i8, i8* %5, i64 %89
  %91 = add i64 %89, 8800
  %92 = getelementptr i8, i8* %5, i64 %91
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %67, i64 %88
  %94 = bitcast double* %93 to i8*
  %95 = bitcast double* %93 to i8*
  %96 = icmp ult i8* %69, %95
  %97 = icmp ult i8* %94, %71
  %98 = and i1 %96, %97
  %99 = icmp ult i8* %69, %92
  %100 = icmp ult i8* %90, %71
  %101 = and i1 %99, %100
  %102 = or i1 %98, %101
  br i1 %102, label %111, label %103

; <label>:103:                                    ; preds = %87
  %104 = load double, double* %93, align 8, !tbaa !1, !alias.scope !8
  %105 = insertelement <2 x double> undef, double %104, i32 0
  %106 = insertelement <2 x double> %105, double %104, i32 1
  %107 = insertelement <2 x double> undef, double %104, i32 0
  %108 = insertelement <2 x double> %107, double %104, i32 1
  %109 = fmul <2 x double> %106, <double 1.500000e+00, double 1.500000e+00>
  %110 = fmul <2 x double> %108, <double 1.500000e+00, double 1.500000e+00>
  br label %112

; <label>:111:                                    ; preds = %87
  br label %134

; <label>:112:                                    ; preds = %112, %103
  %113 = phi i64 [ %132, %112 ], [ 0, %103 ]
  %114 = getelementptr inbounds [1100 x double], [1100 x double]* %25, i64 %88, i64 %113
  %115 = bitcast double* %114 to <2 x double>*
  %116 = load <2 x double>, <2 x double>* %115, align 8, !tbaa !1, !alias.scope !11
  %117 = getelementptr double, double* %114, i64 2
  %118 = bitcast double* %117 to <2 x double>*
  %119 = load <2 x double>, <2 x double>* %118, align 8, !tbaa !1, !alias.scope !11
  %120 = fmul <2 x double> %109, %116
  %121 = fmul <2 x double> %110, %119
  %122 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %67, i64 %113
  %123 = bitcast double* %122 to <2 x double>*
  %124 = load <2 x double>, <2 x double>* %123, align 8, !tbaa !1, !alias.scope !13, !noalias !15
  %125 = getelementptr double, double* %122, i64 2
  %126 = bitcast double* %125 to <2 x double>*
  %127 = load <2 x double>, <2 x double>* %126, align 8, !tbaa !1, !alias.scope !13, !noalias !15
  %128 = fadd <2 x double> %124, %120
  %129 = fadd <2 x double> %127, %121
  %130 = bitcast double* %122 to <2 x double>*
  store <2 x double> %128, <2 x double>* %130, align 8, !tbaa !1, !alias.scope !13, !noalias !15
  %131 = bitcast double* %125 to <2 x double>*
  store <2 x double> %129, <2 x double>* %131, align 8, !tbaa !1, !alias.scope !13, !noalias !15
  %132 = add i64 %113, 4
  %133 = icmp eq i64 %132, 1100
  br i1 %133, label %156, label %112, !llvm.loop !16

; <label>:134:                                    ; preds = %134, %111
  %135 = phi i64 [ 0, %111 ], [ %153, %134 ]
  %136 = load double, double* %93, align 8, !tbaa !1
  %137 = fmul double %136, 1.500000e+00
  %138 = getelementptr inbounds [1100 x double], [1100 x double]* %25, i64 %88, i64 %135
  %139 = load double, double* %138, align 8, !tbaa !1
  %140 = fmul double %137, %139
  %141 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %67, i64 %135
  %142 = load double, double* %141, align 8, !tbaa !1
  %143 = fadd double %142, %140
  store double %143, double* %141, align 8, !tbaa !1
  %144 = or i64 %135, 1
  %145 = load double, double* %93, align 8, !tbaa !1
  %146 = fmul double %145, 1.500000e+00
  %147 = getelementptr inbounds [1100 x double], [1100 x double]* %25, i64 %88, i64 %144
  %148 = load double, double* %147, align 8, !tbaa !1
  %149 = fmul double %146, %148
  %150 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %67, i64 %144
  %151 = load double, double* %150, align 8, !tbaa !1
  %152 = fadd double %151, %149
  store double %152, double* %150, align 8, !tbaa !1
  %153 = add nsw i64 %135, 2
  %154 = icmp eq i64 %153, 1100
  br i1 %154, label %155, label %134, !llvm.loop !17

; <label>:155:                                    ; preds = %134
  br label %157

; <label>:156:                                    ; preds = %112
  br label %157

; <label>:157:                                    ; preds = %156, %155
  %158 = add nuw nsw i64 %88, 1
  %159 = icmp eq i64 %158, 1200
  br i1 %159, label %160, label %87

; <label>:160:                                    ; preds = %157
  %161 = add nuw nsw i64 %67, 1
  %162 = icmp eq i64 %161, 1000
  br i1 %162, label %163, label %66

; <label>:163:                                    ; preds = %160
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %164 = icmp sgt i32 %0, 42
  br i1 %164, label %165, label %201

; <label>:165:                                    ; preds = %163
  %166 = load i8*, i8** %1, align 8, !tbaa !18
  %167 = load i8, i8* %166, align 1, !tbaa !20
  %168 = icmp eq i8 %167, 0
  br i1 %168, label %169, label %201

; <label>:169:                                    ; preds = %165
  %170 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !18
  %171 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %170) #4
  %172 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !18
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
  %184 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !18
  %185 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %184) #4
  br label %186

; <label>:186:                                    ; preds = %183, %177
  %187 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !18
  %188 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %175, i64 %178
  %189 = load double, double* %188, align 8, !tbaa !1
  %190 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %187, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %189) #4
  %191 = add nuw nsw i64 %178, 1
  %192 = icmp eq i64 %191, 1100
  br i1 %192, label %193, label %177

; <label>:193:                                    ; preds = %186
  %194 = add nuw nsw i64 %175, 1
  %195 = icmp eq i64 %194, 1000
  br i1 %195, label %196, label %174

; <label>:196:                                    ; preds = %193
  %197 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !18
  %198 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %197, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %199 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !18
  %200 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %199) #4
  br label %201

; <label>:201:                                    ; preds = %196, %165, %163
  tail call void @free(i8* nonnull %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  ret i32 0

; <label>:202:                                    ; preds = %72
  %203 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %67, i64 %84
  %204 = bitcast double* %203 to <2 x double>*
  %205 = load <2 x double>, <2 x double>* %204, align 8, !tbaa !1
  %206 = getelementptr double, double* %203, i64 2
  %207 = bitcast double* %206 to <2 x double>*
  %208 = load <2 x double>, <2 x double>* %207, align 8, !tbaa !1
  %209 = fmul <2 x double> %205, <double 1.200000e+00, double 1.200000e+00>
  %210 = fmul <2 x double> %208, <double 1.200000e+00, double 1.200000e+00>
  %211 = bitcast double* %203 to <2 x double>*
  store <2 x double> %209, <2 x double>* %211, align 8, !tbaa !1
  %212 = bitcast double* %206 to <2 x double>*
  store <2 x double> %210, <2 x double>* %212, align 8, !tbaa !1
  %213 = add nsw i64 %73, 8
  br label %72
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
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!9, !12}
!16 = distinct !{!16, !6, !7}
!17 = distinct !{!17, !6, !7}
!18 = !{!19, !19, i64 0}
!19 = !{!"any pointer", !3, i64 0}
!20 = !{!3, !3, i64 0}
