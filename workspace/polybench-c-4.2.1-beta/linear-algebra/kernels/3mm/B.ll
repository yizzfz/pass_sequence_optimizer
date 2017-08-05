; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #3
  %8 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #3
  %9 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #3
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %7 to [1200 x double]*
  br label %12

; <label>:12:                                     ; preds = %25, %2
  %13 = phi i64 [ 0, %2 ], [ %26, %25 ]
  br label %14

; <label>:14:                                     ; preds = %14, %12
  %15 = phi i64 [ 0, %12 ], [ %23, %14 ]
  %16 = mul nuw nsw i64 %15, %13
  %17 = add nuw nsw i64 %16, 1
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 800
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 4.000000e+03
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %10, i64 %13, i64 %15
  store double %21, double* %22, align 8, !tbaa !1
  %23 = add nuw nsw i64 %15, 1
  %24 = icmp eq i64 %23, 1000
  br i1 %24, label %25, label %14

; <label>:25:                                     ; preds = %14
  %26 = add nuw nsw i64 %13, 1
  %27 = icmp eq i64 %26, 800
  br i1 %27, label %28, label %12

; <label>:28:                                     ; preds = %25
  %29 = bitcast i8* %5 to [900 x double]*
  %30 = bitcast i8* %8 to [1100 x double]*
  br label %31

; <label>:31:                                     ; preds = %44, %28
  %32 = phi i64 [ %45, %44 ], [ 0, %28 ]
  br label %33

; <label>:33:                                     ; preds = %33, %31
  %34 = phi i64 [ 0, %31 ], [ %35, %33 ]
  %35 = add nuw nsw i64 %34, 1
  %36 = mul nuw nsw i64 %35, %32
  %37 = add nuw nsw i64 %36, 2
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 900
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, 4.500000e+03
  %42 = getelementptr inbounds [900 x double], [900 x double]* %29, i64 %32, i64 %34
  store double %41, double* %42, align 8, !tbaa !1
  %43 = icmp eq i64 %35, 900
  br i1 %43, label %44, label %33

; <label>:44:                                     ; preds = %33
  %45 = add nuw nsw i64 %32, 1
  %46 = icmp eq i64 %45, 1000
  br i1 %46, label %47, label %31

; <label>:47:                                     ; preds = %44
  br label %48

; <label>:48:                                     ; preds = %61, %47
  %49 = phi i64 [ %62, %61 ], [ 0, %47 ]
  br label %50

; <label>:50:                                     ; preds = %50, %48
  %51 = phi i64 [ 0, %48 ], [ %59, %50 ]
  %52 = add nuw nsw i64 %51, 3
  %53 = mul nuw nsw i64 %52, %49
  %54 = trunc i64 %53 to i32
  %55 = srem i32 %54, 1100
  %56 = sitofp i32 %55 to double
  %57 = fdiv double %56, 5.500000e+03
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %49, i64 %51
  store double %57, double* %58, align 8, !tbaa !1
  %59 = add nuw nsw i64 %51, 1
  %60 = icmp eq i64 %59, 1200
  br i1 %60, label %61, label %50

; <label>:61:                                     ; preds = %50
  %62 = add nuw nsw i64 %49, 1
  %63 = icmp eq i64 %62, 900
  br i1 %63, label %64, label %48

; <label>:64:                                     ; preds = %61
  br label %65

; <label>:65:                                     ; preds = %79, %64
  %66 = phi i64 [ %80, %79 ], [ 0, %64 ]
  br label %67

; <label>:67:                                     ; preds = %67, %65
  %68 = phi i64 [ 0, %65 ], [ %77, %67 ]
  %69 = add nuw nsw i64 %68, 2
  %70 = mul nuw nsw i64 %69, %66
  %71 = add nuw nsw i64 %70, 2
  %72 = trunc i64 %71 to i32
  %73 = srem i32 %72, 1000
  %74 = sitofp i32 %73 to double
  %75 = fdiv double %74, 5.000000e+03
  %76 = getelementptr inbounds [1100 x double], [1100 x double]* %30, i64 %66, i64 %68
  store double %75, double* %76, align 8, !tbaa !1
  %77 = add nuw nsw i64 %68, 1
  %78 = icmp eq i64 %77, 1100
  br i1 %78, label %79, label %67

; <label>:79:                                     ; preds = %67
  %80 = add nuw nsw i64 %66, 1
  %81 = icmp eq i64 %80, 1200
  br i1 %81, label %82, label %65

; <label>:82:                                     ; preds = %79
  tail call void (...) @polybench_timer_start() #3
  %83 = bitcast i8* %3 to [900 x double]*
  %84 = bitcast i8* %6 to [1100 x double]*
  br label %85

; <label>:85:                                     ; preds = %111, %82
  %86 = phi i64 [ 0, %82 ], [ %112, %111 ]
  br label %87

; <label>:87:                                     ; preds = %108, %85
  %88 = phi i64 [ 0, %85 ], [ %109, %108 ]
  %89 = getelementptr inbounds [900 x double], [900 x double]* %83, i64 %86, i64 %88
  store double 0.000000e+00, double* %89, align 8, !tbaa !1
  br label %90

; <label>:90:                                     ; preds = %90, %87
  %91 = phi double [ 0.000000e+00, %87 ], [ %105, %90 ]
  %92 = phi i64 [ 0, %87 ], [ %106, %90 ]
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %10, i64 %86, i64 %92
  %94 = load double, double* %93, align 8, !tbaa !1
  %95 = getelementptr inbounds [900 x double], [900 x double]* %29, i64 %92, i64 %88
  %96 = load double, double* %95, align 8, !tbaa !1
  %97 = fmul double %94, %96
  %98 = fadd double %91, %97
  store double %98, double* %89, align 8, !tbaa !1
  %99 = or i64 %92, 1
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %10, i64 %86, i64 %99
  %101 = load double, double* %100, align 8, !tbaa !1
  %102 = getelementptr inbounds [900 x double], [900 x double]* %29, i64 %99, i64 %88
  %103 = load double, double* %102, align 8, !tbaa !1
  %104 = fmul double %101, %103
  %105 = fadd double %98, %104
  store double %105, double* %89, align 8, !tbaa !1
  %106 = add nsw i64 %92, 2
  %107 = icmp eq i64 %106, 1000
  br i1 %107, label %108, label %90

; <label>:108:                                    ; preds = %90
  %109 = add nuw nsw i64 %88, 1
  %110 = icmp eq i64 %109, 900
  br i1 %110, label %111, label %87

; <label>:111:                                    ; preds = %108
  %112 = add nuw nsw i64 %86, 1
  %113 = icmp eq i64 %112, 800
  br i1 %113, label %114, label %85

; <label>:114:                                    ; preds = %111
  %115 = bitcast i8* %9 to [1100 x double]*
  br label %116

; <label>:116:                                    ; preds = %149, %114
  %117 = phi i64 [ %150, %149 ], [ 0, %114 ]
  br label %118

; <label>:118:                                    ; preds = %146, %116
  %119 = phi i64 [ 0, %116 ], [ %147, %146 ]
  %120 = getelementptr inbounds [1100 x double], [1100 x double]* %84, i64 %117, i64 %119
  store double 0.000000e+00, double* %120, align 8, !tbaa !1
  br label %121

; <label>:121:                                    ; preds = %121, %118
  %122 = phi double [ 0.000000e+00, %118 ], [ %143, %121 ]
  %123 = phi i64 [ 0, %118 ], [ %144, %121 ]
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %117, i64 %123
  %125 = load double, double* %124, align 8, !tbaa !1
  %126 = getelementptr inbounds [1100 x double], [1100 x double]* %30, i64 %123, i64 %119
  %127 = load double, double* %126, align 8, !tbaa !1
  %128 = fmul double %125, %127
  %129 = fadd double %122, %128
  store double %129, double* %120, align 8, !tbaa !1
  %130 = add nuw nsw i64 %123, 1
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %117, i64 %130
  %132 = load double, double* %131, align 8, !tbaa !1
  %133 = getelementptr inbounds [1100 x double], [1100 x double]* %30, i64 %130, i64 %119
  %134 = load double, double* %133, align 8, !tbaa !1
  %135 = fmul double %132, %134
  %136 = fadd double %129, %135
  store double %136, double* %120, align 8, !tbaa !1
  %137 = add nsw i64 %123, 2
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %117, i64 %137
  %139 = load double, double* %138, align 8, !tbaa !1
  %140 = getelementptr inbounds [1100 x double], [1100 x double]* %30, i64 %137, i64 %119
  %141 = load double, double* %140, align 8, !tbaa !1
  %142 = fmul double %139, %141
  %143 = fadd double %136, %142
  store double %143, double* %120, align 8, !tbaa !1
  %144 = add nsw i64 %123, 3
  %145 = icmp eq i64 %144, 1200
  br i1 %145, label %146, label %121

; <label>:146:                                    ; preds = %121
  %147 = add nuw nsw i64 %119, 1
  %148 = icmp eq i64 %147, 1100
  br i1 %148, label %149, label %118

; <label>:149:                                    ; preds = %146
  %150 = add nuw nsw i64 %117, 1
  %151 = icmp eq i64 %150, 900
  br i1 %151, label %152, label %116

; <label>:152:                                    ; preds = %149
  br label %153

; <label>:153:                                    ; preds = %186, %152
  %154 = phi i64 [ %187, %186 ], [ 0, %152 ]
  br label %155

; <label>:155:                                    ; preds = %183, %153
  %156 = phi i64 [ 0, %153 ], [ %184, %183 ]
  %157 = getelementptr inbounds [1100 x double], [1100 x double]* %115, i64 %154, i64 %156
  store double 0.000000e+00, double* %157, align 8, !tbaa !1
  br label %158

; <label>:158:                                    ; preds = %158, %155
  %159 = phi double [ 0.000000e+00, %155 ], [ %180, %158 ]
  %160 = phi i64 [ 0, %155 ], [ %181, %158 ]
  %161 = getelementptr inbounds [900 x double], [900 x double]* %83, i64 %154, i64 %160
  %162 = load double, double* %161, align 8, !tbaa !1
  %163 = getelementptr inbounds [1100 x double], [1100 x double]* %84, i64 %160, i64 %156
  %164 = load double, double* %163, align 8, !tbaa !1
  %165 = fmul double %162, %164
  %166 = fadd double %159, %165
  store double %166, double* %157, align 8, !tbaa !1
  %167 = add nuw nsw i64 %160, 1
  %168 = getelementptr inbounds [900 x double], [900 x double]* %83, i64 %154, i64 %167
  %169 = load double, double* %168, align 8, !tbaa !1
  %170 = getelementptr inbounds [1100 x double], [1100 x double]* %84, i64 %167, i64 %156
  %171 = load double, double* %170, align 8, !tbaa !1
  %172 = fmul double %169, %171
  %173 = fadd double %166, %172
  store double %173, double* %157, align 8, !tbaa !1
  %174 = add nsw i64 %160, 2
  %175 = getelementptr inbounds [900 x double], [900 x double]* %83, i64 %154, i64 %174
  %176 = load double, double* %175, align 8, !tbaa !1
  %177 = getelementptr inbounds [1100 x double], [1100 x double]* %84, i64 %174, i64 %156
  %178 = load double, double* %177, align 8, !tbaa !1
  %179 = fmul double %176, %178
  %180 = fadd double %173, %179
  store double %180, double* %157, align 8, !tbaa !1
  %181 = add nsw i64 %160, 3
  %182 = icmp eq i64 %181, 900
  br i1 %182, label %183, label %158

; <label>:183:                                    ; preds = %158
  %184 = add nuw nsw i64 %156, 1
  %185 = icmp eq i64 %184, 1100
  br i1 %185, label %186, label %155

; <label>:186:                                    ; preds = %183
  %187 = add nuw nsw i64 %154, 1
  %188 = icmp eq i64 %187, 800
  br i1 %188, label %189, label %153

; <label>:189:                                    ; preds = %186
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %190 = icmp sgt i32 %0, 42
  br i1 %190, label %191, label %227

; <label>:191:                                    ; preds = %189
  %192 = load i8*, i8** %1, align 8, !tbaa !5
  %193 = load i8, i8* %192, align 1, !tbaa !7
  %194 = icmp eq i8 %193, 0
  br i1 %194, label %195, label %227

; <label>:195:                                    ; preds = %191
  %196 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %197 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %196) #4
  %198 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %199 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %198, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %200

; <label>:200:                                    ; preds = %219, %195
  %201 = phi i64 [ 0, %195 ], [ %220, %219 ]
  %202 = mul nuw nsw i64 %201, 800
  br label %203

; <label>:203:                                    ; preds = %212, %200
  %204 = phi i64 [ 0, %200 ], [ %217, %212 ]
  %205 = add nuw nsw i64 %204, %202
  %206 = trunc i64 %205 to i32
  %207 = srem i32 %206, 20
  %208 = icmp eq i32 %207, 0
  br i1 %208, label %209, label %212

; <label>:209:                                    ; preds = %203
  %210 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %211 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %210) #4
  br label %212

; <label>:212:                                    ; preds = %209, %203
  %213 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %214 = getelementptr inbounds [1100 x double], [1100 x double]* %115, i64 %201, i64 %204
  %215 = load double, double* %214, align 8, !tbaa !1
  %216 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %213, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %215) #4
  %217 = add nuw nsw i64 %204, 1
  %218 = icmp eq i64 %217, 1100
  br i1 %218, label %219, label %203

; <label>:219:                                    ; preds = %212
  %220 = add nuw nsw i64 %201, 1
  %221 = icmp eq i64 %220, 800
  br i1 %221, label %222, label %200

; <label>:222:                                    ; preds = %219
  %223 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %224 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %223, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %225 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %226 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %225) #4
  br label %227

; <label>:227:                                    ; preds = %222, %191, %189
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  tail call void @free(i8* %7) #3
  tail call void @free(i8* %8) #3
  tail call void @free(i8* nonnull %9) #3
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
