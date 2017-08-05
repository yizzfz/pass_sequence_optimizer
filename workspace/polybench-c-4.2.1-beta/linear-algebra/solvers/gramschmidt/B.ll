; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  br label %8

; <label>:8:                                      ; preds = %23, %2
  %9 = phi i64 [ 0, %2 ], [ %24, %23 ]
  br label %10

; <label>:10:                                     ; preds = %10, %8
  %11 = phi i64 [ 0, %8 ], [ %21, %10 ]
  %12 = mul nuw nsw i64 %11, %9
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 1000
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 1.000000e+03
  %17 = fmul double %16, 1.000000e+02
  %18 = fadd double %17, 1.000000e+01
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %9, i64 %11
  store double %18, double* %19, align 8, !tbaa !1
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %9, i64 %11
  store double 0.000000e+00, double* %20, align 8, !tbaa !1
  %21 = add nuw nsw i64 %11, 1
  %22 = icmp eq i64 %21, 1200
  br i1 %22, label %23, label %10

; <label>:23:                                     ; preds = %10
  %24 = add nuw nsw i64 %9, 1
  %25 = icmp eq i64 %24, 1000
  br i1 %25, label %26, label %8

; <label>:26:                                     ; preds = %23
  %27 = bitcast i8* %4 to [1200 x double]*
  tail call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 11520000, i32 8, i1 false) #3
  tail call void (...) @polybench_timer_start() #3
  br label %32

; <label>:28:                                     ; preds = %122
  br label %29

; <label>:29:                                     ; preds = %80, %28
  %30 = add nuw nsw i64 %34, 1
  %31 = icmp eq i64 %81, 1200
  br i1 %31, label %125, label %32

; <label>:32:                                     ; preds = %29, %26
  %33 = phi i64 [ 0, %26 ], [ %81, %29 ]
  %34 = phi i64 [ 1, %26 ], [ %30, %29 ]
  br label %35

; <label>:35:                                     ; preds = %35, %32
  %36 = phi i64 [ 0, %32 ], [ %62, %35 ]
  %37 = phi double [ 0.000000e+00, %32 ], [ %61, %35 ]
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %36, i64 %33
  %39 = load double, double* %38, align 8, !tbaa !1
  %40 = fmul double %39, %39
  %41 = fadd double %37, %40
  %42 = add nuw nsw i64 %36, 1
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %42, i64 %33
  %44 = load double, double* %43, align 8, !tbaa !1
  %45 = fmul double %44, %44
  %46 = fadd double %41, %45
  %47 = add nsw i64 %36, 2
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %47, i64 %33
  %49 = load double, double* %48, align 8, !tbaa !1
  %50 = fmul double %49, %49
  %51 = fadd double %46, %50
  %52 = add nsw i64 %36, 3
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %52, i64 %33
  %54 = load double, double* %53, align 8, !tbaa !1
  %55 = fmul double %54, %54
  %56 = fadd double %51, %55
  %57 = add nsw i64 %36, 4
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %57, i64 %33
  %59 = load double, double* %58, align 8, !tbaa !1
  %60 = fmul double %59, %59
  %61 = fadd double %56, %60
  %62 = add nsw i64 %36, 5
  %63 = icmp eq i64 %62, 1000
  br i1 %63, label %64, label %35

; <label>:64:                                     ; preds = %35
  %65 = tail call double @sqrt(double %61) #3
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %27, i64 %33, i64 %33
  store double %65, double* %66, align 8, !tbaa !1
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 0, i64 %33
  %68 = load double, double* %67, align 8, !tbaa !1
  %69 = fdiv double %68, %65
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 0, i64 %33
  store double %69, double* %70, align 8, !tbaa !1
  br label %71

; <label>:71:                                     ; preds = %191, %64
  %72 = phi i64 [ 1, %64 ], [ %197, %191 ]
  %73 = load double, double* %66, align 8, !tbaa !1
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %72, i64 %33
  %75 = load double, double* %74, align 8, !tbaa !1
  %76 = fdiv double %75, %73
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %72, i64 %33
  store double %76, double* %77, align 8, !tbaa !1
  %78 = add nuw nsw i64 %72, 1
  %79 = icmp eq i64 %78, 1000
  br i1 %79, label %80, label %191

; <label>:80:                                     ; preds = %71
  %81 = add nuw nsw i64 %33, 1
  %82 = icmp slt i64 %81, 1200
  br i1 %82, label %83, label %29

; <label>:83:                                     ; preds = %80
  br label %84

; <label>:84:                                     ; preds = %122, %83
  %85 = phi i64 [ %123, %122 ], [ %34, %83 ]
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %27, i64 %33, i64 %85
  store double 0.000000e+00, double* %86, align 8, !tbaa !1
  br label %87

; <label>:87:                                     ; preds = %87, %84
  %88 = phi double [ 0.000000e+00, %84 ], [ %102, %87 ]
  %89 = phi i64 [ 0, %84 ], [ %103, %87 ]
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %89, i64 %33
  %91 = load double, double* %90, align 8, !tbaa !1
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %89, i64 %85
  %93 = load double, double* %92, align 8, !tbaa !1
  %94 = fmul double %91, %93
  %95 = fadd double %88, %94
  store double %95, double* %86, align 8, !tbaa !1
  %96 = or i64 %89, 1
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %96, i64 %33
  %98 = load double, double* %97, align 8, !tbaa !1
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %96, i64 %85
  %100 = load double, double* %99, align 8, !tbaa !1
  %101 = fmul double %98, %100
  %102 = fadd double %95, %101
  store double %102, double* %86, align 8, !tbaa !1
  %103 = add nsw i64 %89, 2
  %104 = icmp eq i64 %103, 1000
  br i1 %104, label %105, label %87

; <label>:105:                                    ; preds = %87
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 0, i64 %85
  %107 = load double, double* %106, align 8, !tbaa !1
  %108 = load double, double* %70, align 8, !tbaa !1
  %109 = fmul double %102, %108
  %110 = fsub double %107, %109
  store double %110, double* %106, align 8, !tbaa !1
  br label %111

; <label>:111:                                    ; preds = %198, %105
  %112 = phi i64 [ 1, %105 ], [ %206, %198 ]
  %113 = load double, double* %86, align 8, !tbaa !1
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %112, i64 %85
  %115 = load double, double* %114, align 8, !tbaa !1
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %112, i64 %33
  %117 = load double, double* %116, align 8, !tbaa !1
  %118 = fmul double %113, %117
  %119 = fsub double %115, %118
  store double %119, double* %114, align 8, !tbaa !1
  %120 = add nuw nsw i64 %112, 1
  %121 = icmp eq i64 %120, 1000
  br i1 %121, label %122, label %198

; <label>:122:                                    ; preds = %111
  %123 = add nuw nsw i64 %85, 1
  %124 = icmp eq i64 %123, 1200
  br i1 %124, label %28, label %84

; <label>:125:                                    ; preds = %29
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %126 = icmp sgt i32 %0, 42
  br i1 %126, label %127, label %190

; <label>:127:                                    ; preds = %125
  %128 = load i8*, i8** %1, align 8, !tbaa !5
  %129 = load i8, i8* %128, align 1, !tbaa !7
  %130 = icmp eq i8 %129, 0
  br i1 %130, label %131, label %190

; <label>:131:                                    ; preds = %127
  %132 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %133 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %132) #5
  %134 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %135 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %134, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %136

; <label>:136:                                    ; preds = %155, %131
  %137 = phi i64 [ 0, %131 ], [ %156, %155 ]
  %138 = mul nuw nsw i64 %137, 1200
  br label %139

; <label>:139:                                    ; preds = %148, %136
  %140 = phi i64 [ 0, %136 ], [ %153, %148 ]
  %141 = add nuw nsw i64 %140, %138
  %142 = trunc i64 %141 to i32
  %143 = srem i32 %142, 20
  %144 = icmp eq i32 %143, 0
  br i1 %144, label %145, label %148

; <label>:145:                                    ; preds = %139
  %146 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %147 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %146) #5
  br label %148

; <label>:148:                                    ; preds = %145, %139
  %149 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %27, i64 %137, i64 %140
  %151 = load double, double* %150, align 8, !tbaa !1
  %152 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %149, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %151) #5
  %153 = add nuw nsw i64 %140, 1
  %154 = icmp eq i64 %153, 1200
  br i1 %154, label %155, label %139

; <label>:155:                                    ; preds = %148
  %156 = add nuw nsw i64 %137, 1
  %157 = icmp eq i64 %156, 1200
  br i1 %157, label %158, label %136

; <label>:158:                                    ; preds = %155
  %159 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %160 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %159, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %161 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %162 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %161, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #5
  br label %163

; <label>:163:                                    ; preds = %182, %158
  %164 = phi i64 [ 0, %158 ], [ %183, %182 ]
  %165 = mul nuw nsw i64 %164, 1200
  br label %166

; <label>:166:                                    ; preds = %175, %163
  %167 = phi i64 [ 0, %163 ], [ %180, %175 ]
  %168 = add nuw nsw i64 %167, %165
  %169 = trunc i64 %168 to i32
  %170 = srem i32 %169, 20
  %171 = icmp eq i32 %170, 0
  br i1 %171, label %172, label %175

; <label>:172:                                    ; preds = %166
  %173 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %174 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %173) #5
  br label %175

; <label>:175:                                    ; preds = %172, %166
  %176 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %164, i64 %167
  %178 = load double, double* %177, align 8, !tbaa !1
  %179 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %176, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %178) #5
  %180 = add nuw nsw i64 %167, 1
  %181 = icmp eq i64 %180, 1200
  br i1 %181, label %182, label %166

; <label>:182:                                    ; preds = %175
  %183 = add nuw nsw i64 %164, 1
  %184 = icmp eq i64 %183, 1000
  br i1 %184, label %185, label %163

; <label>:185:                                    ; preds = %182
  %186 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %187 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %186, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #5
  %188 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %189 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %188) #5
  br label %190

; <label>:190:                                    ; preds = %185, %127, %125
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* nonnull %5) #3
  ret i32 0

; <label>:191:                                    ; preds = %71
  %192 = load double, double* %66, align 8, !tbaa !1
  %193 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %78, i64 %33
  %194 = load double, double* %193, align 8, !tbaa !1
  %195 = fdiv double %194, %192
  %196 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %78, i64 %33
  store double %195, double* %196, align 8, !tbaa !1
  %197 = add nsw i64 %72, 2
  br label %71

; <label>:198:                                    ; preds = %111
  %199 = load double, double* %86, align 8, !tbaa !1
  %200 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %120, i64 %85
  %201 = load double, double* %200, align 8, !tbaa !1
  %202 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %120, i64 %33
  %203 = load double, double* %202, align 8, !tbaa !1
  %204 = fmul double %199, %203
  %205 = fsub double %201, %204
  store double %205, double* %200, align 8, !tbaa !1
  %206 = add nsw i64 %112, 2
  br label %111
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

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
