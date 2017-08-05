; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #3
  %8 = bitcast i8* %4 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  br label %10

; <label>:10:                                     ; preds = %23, %2
  %11 = phi i64 [ 0, %2 ], [ %24, %23 ]
  br label %12

; <label>:12:                                     ; preds = %12, %10
  %13 = phi i64 [ 0, %10 ], [ %21, %12 ]
  %14 = mul nuw nsw i64 %13, %11
  %15 = add nuw nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 800
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 8.000000e+02
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %11, i64 %13
  store double %19, double* %20, align 8, !tbaa !1
  %21 = add nuw nsw i64 %13, 1
  %22 = icmp eq i64 %21, 1100
  br i1 %22, label %23, label %12

; <label>:23:                                     ; preds = %12
  %24 = add nuw nsw i64 %11, 1
  %25 = icmp eq i64 %24, 800
  br i1 %25, label %26, label %10

; <label>:26:                                     ; preds = %23
  %27 = bitcast i8* %5 to [900 x double]*
  %28 = bitcast i8* %7 to [1200 x double]*
  br label %29

; <label>:29:                                     ; preds = %48, %26
  %30 = phi i64 [ %49, %48 ], [ 0, %26 ]
  br label %31

; <label>:31:                                     ; preds = %31, %29
  %32 = phi i64 [ 0, %29 ], [ %40, %31 ]
  %33 = or i64 %32, 1
  %34 = mul nuw nsw i64 %33, %30
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 900
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 9.000000e+02
  %39 = getelementptr inbounds [900 x double], [900 x double]* %27, i64 %30, i64 %32
  store double %38, double* %39, align 8, !tbaa !1
  %40 = add nsw i64 %32, 2
  %41 = mul nuw nsw i64 %40, %30
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, 900
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %44, 9.000000e+02
  %46 = getelementptr inbounds [900 x double], [900 x double]* %27, i64 %30, i64 %33
  store double %45, double* %46, align 8, !tbaa !1
  %47 = icmp eq i64 %40, 900
  br i1 %47, label %48, label %31

; <label>:48:                                     ; preds = %31
  %49 = add nuw nsw i64 %30, 1
  %50 = icmp eq i64 %49, 1100
  br i1 %50, label %51, label %29

; <label>:51:                                     ; preds = %48
  br label %52

; <label>:52:                                     ; preds = %66, %51
  %53 = phi i64 [ %67, %66 ], [ 0, %51 ]
  br label %54

; <label>:54:                                     ; preds = %54, %52
  %55 = phi i64 [ 0, %52 ], [ %64, %54 ]
  %56 = add nuw nsw i64 %55, 3
  %57 = mul nuw nsw i64 %56, %53
  %58 = add nuw nsw i64 %57, 1
  %59 = trunc i64 %58 to i32
  %60 = srem i32 %59, 1200
  %61 = sitofp i32 %60 to double
  %62 = fdiv double %61, 1.200000e+03
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %53, i64 %55
  store double %62, double* %63, align 8, !tbaa !1
  %64 = add nuw nsw i64 %55, 1
  %65 = icmp eq i64 %64, 1200
  br i1 %65, label %66, label %54

; <label>:66:                                     ; preds = %54
  %67 = add nuw nsw i64 %53, 1
  %68 = icmp eq i64 %67, 900
  br i1 %68, label %69, label %52

; <label>:69:                                     ; preds = %66
  br label %70

; <label>:70:                                     ; preds = %83, %69
  %71 = phi i64 [ %84, %83 ], [ 0, %69 ]
  br label %72

; <label>:72:                                     ; preds = %72, %70
  %73 = phi i64 [ 0, %70 ], [ %81, %72 ]
  %74 = add nuw nsw i64 %73, 2
  %75 = mul nuw nsw i64 %74, %71
  %76 = trunc i64 %75 to i32
  %77 = srem i32 %76, 1100
  %78 = sitofp i32 %77 to double
  %79 = fdiv double %78, 1.100000e+03
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %28, i64 %71, i64 %73
  store double %79, double* %80, align 8, !tbaa !1
  %81 = add nuw nsw i64 %73, 1
  %82 = icmp eq i64 %81, 1200
  br i1 %82, label %83, label %72

; <label>:83:                                     ; preds = %72
  %84 = add nuw nsw i64 %71, 1
  %85 = icmp eq i64 %84, 800
  br i1 %85, label %86, label %70

; <label>:86:                                     ; preds = %83
  tail call void (...) @polybench_timer_start() #3
  %87 = bitcast i8* %3 to [900 x double]*
  br label %88

; <label>:88:                                     ; preds = %116, %86
  %89 = phi i64 [ 0, %86 ], [ %117, %116 ]
  br label %90

; <label>:90:                                     ; preds = %113, %88
  %91 = phi i64 [ 0, %88 ], [ %114, %113 ]
  %92 = getelementptr inbounds [900 x double], [900 x double]* %87, i64 %89, i64 %91
  store double 0.000000e+00, double* %92, align 8, !tbaa !1
  br label %93

; <label>:93:                                     ; preds = %93, %90
  %94 = phi double [ 0.000000e+00, %90 ], [ %110, %93 ]
  %95 = phi i64 [ 0, %90 ], [ %111, %93 ]
  %96 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %89, i64 %95
  %97 = load double, double* %96, align 8, !tbaa !1
  %98 = fmul double %97, 1.500000e+00
  %99 = getelementptr inbounds [900 x double], [900 x double]* %27, i64 %95, i64 %91
  %100 = load double, double* %99, align 8, !tbaa !1
  %101 = fmul double %98, %100
  %102 = fadd double %94, %101
  store double %102, double* %92, align 8, !tbaa !1
  %103 = or i64 %95, 1
  %104 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %89, i64 %103
  %105 = load double, double* %104, align 8, !tbaa !1
  %106 = fmul double %105, 1.500000e+00
  %107 = getelementptr inbounds [900 x double], [900 x double]* %27, i64 %103, i64 %91
  %108 = load double, double* %107, align 8, !tbaa !1
  %109 = fmul double %106, %108
  %110 = fadd double %102, %109
  store double %110, double* %92, align 8, !tbaa !1
  %111 = add nsw i64 %95, 2
  %112 = icmp eq i64 %111, 1100
  br i1 %112, label %113, label %93

; <label>:113:                                    ; preds = %93
  %114 = add nuw nsw i64 %91, 1
  %115 = icmp eq i64 %114, 900
  br i1 %115, label %116, label %90

; <label>:116:                                    ; preds = %113
  %117 = add nuw nsw i64 %89, 1
  %118 = icmp eq i64 %117, 800
  br i1 %118, label %119, label %88

; <label>:119:                                    ; preds = %116
  br label %120

; <label>:120:                                    ; preds = %155, %119
  %121 = phi i64 [ %156, %155 ], [ 0, %119 ]
  br label %122

; <label>:122:                                    ; preds = %152, %120
  %123 = phi i64 [ 0, %120 ], [ %153, %152 ]
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %28, i64 %121, i64 %123
  %125 = load double, double* %124, align 8, !tbaa !1
  %126 = fmul double %125, 1.200000e+00
  store double %126, double* %124, align 8, !tbaa !1
  br label %127

; <label>:127:                                    ; preds = %127, %122
  %128 = phi double [ %126, %122 ], [ %149, %127 ]
  %129 = phi i64 [ 0, %122 ], [ %150, %127 ]
  %130 = getelementptr inbounds [900 x double], [900 x double]* %87, i64 %121, i64 %129
  %131 = load double, double* %130, align 8, !tbaa !1
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %129, i64 %123
  %133 = load double, double* %132, align 8, !tbaa !1
  %134 = fmul double %131, %133
  %135 = fadd double %128, %134
  store double %135, double* %124, align 8, !tbaa !1
  %136 = add nuw nsw i64 %129, 1
  %137 = getelementptr inbounds [900 x double], [900 x double]* %87, i64 %121, i64 %136
  %138 = load double, double* %137, align 8, !tbaa !1
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %136, i64 %123
  %140 = load double, double* %139, align 8, !tbaa !1
  %141 = fmul double %138, %140
  %142 = fadd double %135, %141
  store double %142, double* %124, align 8, !tbaa !1
  %143 = add nsw i64 %129, 2
  %144 = getelementptr inbounds [900 x double], [900 x double]* %87, i64 %121, i64 %143
  %145 = load double, double* %144, align 8, !tbaa !1
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %143, i64 %123
  %147 = load double, double* %146, align 8, !tbaa !1
  %148 = fmul double %145, %147
  %149 = fadd double %142, %148
  store double %149, double* %124, align 8, !tbaa !1
  %150 = add nsw i64 %129, 3
  %151 = icmp eq i64 %150, 900
  br i1 %151, label %152, label %127

; <label>:152:                                    ; preds = %127
  %153 = add nuw nsw i64 %123, 1
  %154 = icmp eq i64 %153, 1200
  br i1 %154, label %155, label %122

; <label>:155:                                    ; preds = %152
  %156 = add nuw nsw i64 %121, 1
  %157 = icmp eq i64 %156, 800
  br i1 %157, label %158, label %120

; <label>:158:                                    ; preds = %155
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %159 = icmp sgt i32 %0, 42
  br i1 %159, label %160, label %196

; <label>:160:                                    ; preds = %158
  %161 = load i8*, i8** %1, align 8, !tbaa !5
  %162 = load i8, i8* %161, align 1, !tbaa !7
  %163 = icmp eq i8 %162, 0
  br i1 %163, label %164, label %196

; <label>:164:                                    ; preds = %160
  %165 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %166 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %165) #4
  %167 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %168 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %167, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %169

; <label>:169:                                    ; preds = %188, %164
  %170 = phi i64 [ 0, %164 ], [ %189, %188 ]
  %171 = mul nuw nsw i64 %170, 800
  br label %172

; <label>:172:                                    ; preds = %181, %169
  %173 = phi i64 [ 0, %169 ], [ %186, %181 ]
  %174 = add nuw nsw i64 %173, %171
  %175 = trunc i64 %174 to i32
  %176 = srem i32 %175, 20
  %177 = icmp eq i32 %176, 0
  br i1 %177, label %178, label %181

; <label>:178:                                    ; preds = %172
  %179 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %180 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %179) #4
  br label %181

; <label>:181:                                    ; preds = %178, %172
  %182 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %28, i64 %170, i64 %173
  %184 = load double, double* %183, align 8, !tbaa !1
  %185 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %182, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %184) #4
  %186 = add nuw nsw i64 %173, 1
  %187 = icmp eq i64 %186, 1200
  br i1 %187, label %188, label %172

; <label>:188:                                    ; preds = %181
  %189 = add nuw nsw i64 %170, 1
  %190 = icmp eq i64 %189, 800
  br i1 %190, label %191, label %169

; <label>:191:                                    ; preds = %188
  %192 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %193 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %192, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %194 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %195 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %194) #4
  br label %196

; <label>:196:                                    ; preds = %191, %160, %158
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  tail call void @free(i8* nonnull %7) #3
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
