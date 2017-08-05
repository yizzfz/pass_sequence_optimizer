; ModuleID = 'correlation.c'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %7 = bitcast i8* %3 to [1200 x double]*
  br label %8

; <label>:8:                                      ; preds = %29, %2
  %9 = phi i64 [ 0, %2 ], [ %30, %29 ]
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  br label %12

; <label>:12:                                     ; preds = %12, %8
  %13 = phi i64 [ 0, %8 ], [ %27, %12 ]
  %14 = mul nuw nsw i64 %13, %9
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.200000e+03
  %18 = fadd double %11, %17
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %9, i64 %13
  store double %18, double* %19, align 8, !tbaa !1
  %20 = or i64 %13, 1
  %21 = mul nuw nsw i64 %20, %9
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 1.200000e+03
  %25 = fadd double %11, %24
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %9, i64 %20
  store double %25, double* %26, align 8, !tbaa !1
  %27 = add nsw i64 %13, 2
  %28 = icmp eq i64 %27, 1200
  br i1 %28, label %29, label %12

; <label>:29:                                     ; preds = %12
  %30 = add nuw nsw i64 %9, 1
  %31 = icmp eq i64 %30, 1400
  br i1 %31, label %32, label %8

; <label>:32:                                     ; preds = %29
  tail call void (...) @polybench_timer_start() #3
  %33 = bitcast i8* %5 to double*
  br label %34

; <label>:34:                                     ; preds = %61, %32
  %35 = phi i64 [ 0, %32 ], [ %63, %61 ]
  %36 = getelementptr inbounds double, double* %33, i64 %35
  store double 0.000000e+00, double* %36, align 8, !tbaa !1
  br label %37

; <label>:37:                                     ; preds = %37, %34
  %38 = phi i64 [ 0, %34 ], [ %59, %37 ]
  %39 = phi double [ 0.000000e+00, %34 ], [ %58, %37 ]
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %38, i64 %35
  %41 = load double, double* %40, align 8, !tbaa !1
  %42 = fadd double %39, %41
  store double %42, double* %36, align 8, !tbaa !1
  %43 = add nuw nsw i64 %38, 1
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %43, i64 %35
  %45 = load double, double* %44, align 8, !tbaa !1
  %46 = fadd double %42, %45
  store double %46, double* %36, align 8, !tbaa !1
  %47 = add nsw i64 %38, 2
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %47, i64 %35
  %49 = load double, double* %48, align 8, !tbaa !1
  %50 = fadd double %46, %49
  store double %50, double* %36, align 8, !tbaa !1
  %51 = add nsw i64 %38, 3
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %51, i64 %35
  %53 = load double, double* %52, align 8, !tbaa !1
  %54 = fadd double %50, %53
  store double %54, double* %36, align 8, !tbaa !1
  %55 = add nsw i64 %38, 4
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %55, i64 %35
  %57 = load double, double* %56, align 8, !tbaa !1
  %58 = fadd double %54, %57
  store double %58, double* %36, align 8, !tbaa !1
  %59 = add nsw i64 %38, 5
  %60 = icmp eq i64 %59, 1400
  br i1 %60, label %61, label %37

; <label>:61:                                     ; preds = %37
  %62 = fdiv double %58, 1.400000e+03
  store double %62, double* %36, align 8, !tbaa !1
  %63 = add nuw nsw i64 %35, 1
  %64 = icmp eq i64 %63, 1200
  br i1 %64, label %65, label %34

; <label>:65:                                     ; preds = %61
  %66 = bitcast i8* %4 to [1200 x double]*
  %67 = bitcast i8* %6 to double*
  br label %68

; <label>:68:                                     ; preds = %65, %90
  %69 = phi i64 [ %95, %90 ], [ 0, %65 ]
  %70 = getelementptr inbounds double, double* %67, i64 %69
  store double 0.000000e+00, double* %70, align 8, !tbaa !1
  %71 = getelementptr inbounds double, double* %33, i64 %69
  br label %72

; <label>:72:                                     ; preds = %72, %68
  %73 = phi i64 [ 0, %68 ], [ %88, %72 ]
  %74 = phi double [ 0.000000e+00, %68 ], [ %87, %72 ]
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %73, i64 %69
  %76 = load double, double* %75, align 8, !tbaa !1
  %77 = load double, double* %71, align 8, !tbaa !1
  %78 = fsub double %76, %77
  %79 = fmul double %78, %78
  %80 = fadd double %74, %79
  store double %80, double* %70, align 8, !tbaa !1
  %81 = or i64 %73, 1
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %81, i64 %69
  %83 = load double, double* %82, align 8, !tbaa !1
  %84 = load double, double* %71, align 8, !tbaa !1
  %85 = fsub double %83, %84
  %86 = fmul double %85, %85
  %87 = fadd double %80, %86
  store double %87, double* %70, align 8, !tbaa !1
  %88 = add nsw i64 %73, 2
  %89 = icmp eq i64 %88, 1400
  br i1 %89, label %90, label %72

; <label>:90:                                     ; preds = %72
  %91 = fdiv double %87, 1.400000e+03
  store double %91, double* %70, align 8, !tbaa !1
  %92 = tail call double @sqrt(double %91) #3
  %93 = fcmp ugt double %92, 1.000000e-01
  %94 = select i1 %93, double %92, double 1.000000e+00
  store double %94, double* %70, align 8, !tbaa !1
  %95 = add nuw nsw i64 %69, 1
  %96 = icmp eq i64 %95, 1200
  br i1 %96, label %97, label %68

; <label>:97:                                     ; preds = %90
  %98 = getelementptr i8, i8* %5, i64 9600
  %99 = getelementptr i8, i8* %6, i64 9600
  br label %100

; <label>:100:                                    ; preds = %97, %173
  %101 = phi i64 [ %174, %173 ], [ 0, %97 ]
  %102 = mul i64 %101, 9600
  %103 = getelementptr i8, i8* %3, i64 %102
  %104 = add i64 %102, 9600
  %105 = getelementptr i8, i8* %3, i64 %104
  %106 = icmp ult i8* %103, %98
  %107 = icmp ult i8* %5, %105
  %108 = and i1 %106, %107
  %109 = icmp ult i8* %103, %99
  %110 = icmp ult i8* %6, %105
  %111 = and i1 %109, %110
  %112 = or i1 %108, %111
  br i1 %112, label %114, label %113

; <label>:113:                                    ; preds = %100
  br label %115

; <label>:114:                                    ; preds = %100
  br label %148

; <label>:115:                                    ; preds = %115, %113
  %116 = phi i64 [ 0, %113 ], [ %146, %115 ]
  %117 = getelementptr inbounds double, double* %33, i64 %116
  %118 = bitcast double* %117 to <2 x double>*
  %119 = load <2 x double>, <2 x double>* %118, align 8, !tbaa !1, !alias.scope !5
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %101, i64 %116
  %121 = bitcast double* %120 to <2 x double>*
  %122 = load <2 x double>, <2 x double>* %121, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %123 = fsub <2 x double> %122, %119
  %124 = bitcast double* %120 to <2 x double>*
  store <2 x double> %123, <2 x double>* %124, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %125 = getelementptr inbounds double, double* %67, i64 %116
  %126 = bitcast double* %125 to <2 x double>*
  %127 = load <2 x double>, <2 x double>* %126, align 8, !tbaa !1, !alias.scope !12
  %128 = fmul <2 x double> %127, <double 0x4042B5524AE1278E, double 0x4042B5524AE1278E>
  %129 = fdiv <2 x double> %123, %128
  %130 = bitcast double* %120 to <2 x double>*
  store <2 x double> %129, <2 x double>* %130, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %131 = or i64 %116, 2
  %132 = getelementptr inbounds double, double* %33, i64 %131
  %133 = bitcast double* %132 to <2 x double>*
  %134 = load <2 x double>, <2 x double>* %133, align 8, !tbaa !1, !alias.scope !5
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %101, i64 %131
  %136 = bitcast double* %135 to <2 x double>*
  %137 = load <2 x double>, <2 x double>* %136, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %138 = fsub <2 x double> %137, %134
  %139 = bitcast double* %135 to <2 x double>*
  store <2 x double> %138, <2 x double>* %139, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %140 = getelementptr inbounds double, double* %67, i64 %131
  %141 = bitcast double* %140 to <2 x double>*
  %142 = load <2 x double>, <2 x double>* %141, align 8, !tbaa !1, !alias.scope !12
  %143 = fmul <2 x double> %142, <double 0x4042B5524AE1278E, double 0x4042B5524AE1278E>
  %144 = fdiv <2 x double> %138, %143
  %145 = bitcast double* %135 to <2 x double>*
  store <2 x double> %144, <2 x double>* %145, align 8, !tbaa !1, !alias.scope !8, !noalias !10
  %146 = add nsw i64 %116, 4
  %147 = icmp eq i64 %146, 1200
  br i1 %147, label %172, label %115, !llvm.loop !13

; <label>:148:                                    ; preds = %148, %114
  %149 = phi i64 [ 0, %114 ], [ %169, %148 ]
  %150 = getelementptr inbounds double, double* %33, i64 %149
  %151 = load double, double* %150, align 8, !tbaa !1
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %101, i64 %149
  %153 = load double, double* %152, align 8, !tbaa !1
  %154 = fsub double %153, %151
  store double %154, double* %152, align 8, !tbaa !1
  %155 = getelementptr inbounds double, double* %67, i64 %149
  %156 = load double, double* %155, align 8, !tbaa !1
  %157 = fmul double %156, 0x4042B5524AE1278E
  %158 = fdiv double %154, %157
  store double %158, double* %152, align 8, !tbaa !1
  %159 = or i64 %149, 1
  %160 = getelementptr inbounds double, double* %33, i64 %159
  %161 = load double, double* %160, align 8, !tbaa !1
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %101, i64 %159
  %163 = load double, double* %162, align 8, !tbaa !1
  %164 = fsub double %163, %161
  store double %164, double* %162, align 8, !tbaa !1
  %165 = getelementptr inbounds double, double* %67, i64 %159
  %166 = load double, double* %165, align 8, !tbaa !1
  %167 = fmul double %166, 0x4042B5524AE1278E
  %168 = fdiv double %164, %167
  store double %168, double* %162, align 8, !tbaa !1
  %169 = add nsw i64 %149, 2
  %170 = icmp eq i64 %169, 1200
  br i1 %170, label %171, label %148, !llvm.loop !16

; <label>:171:                                    ; preds = %148
  br label %173

; <label>:172:                                    ; preds = %115
  br label %173

; <label>:173:                                    ; preds = %172, %171
  %174 = add nuw nsw i64 %101, 1
  %175 = icmp eq i64 %174, 1400
  br i1 %175, label %176, label %100

; <label>:176:                                    ; preds = %173
  br label %181

; <label>:177:                                    ; preds = %206
  %178 = add nuw nsw i64 %182, 1
  %179 = add nuw nsw i64 %183, 1
  %180 = icmp eq i64 %178, 1199
  br i1 %180, label %210, label %181

; <label>:181:                                    ; preds = %176, %177
  %182 = phi i64 [ %178, %177 ], [ 0, %176 ]
  %183 = phi i64 [ %179, %177 ], [ 1, %176 ]
  %184 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %182, i64 %182
  store double 1.000000e+00, double* %184, align 8, !tbaa !1
  br label %185

; <label>:185:                                    ; preds = %206, %181
  %186 = phi i64 [ %183, %181 ], [ %208, %206 ]
  %187 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %182, i64 %186
  store double 0.000000e+00, double* %187, align 8, !tbaa !1
  br label %188

; <label>:188:                                    ; preds = %188, %185
  %189 = phi i64 [ 0, %185 ], [ %204, %188 ]
  %190 = phi double [ 0.000000e+00, %185 ], [ %203, %188 ]
  %191 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %189, i64 %182
  %192 = load double, double* %191, align 8, !tbaa !1
  %193 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %189, i64 %186
  %194 = load double, double* %193, align 8, !tbaa !1
  %195 = fmul double %192, %194
  %196 = fadd double %190, %195
  store double %196, double* %187, align 8, !tbaa !1
  %197 = or i64 %189, 1
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %197, i64 %182
  %199 = load double, double* %198, align 8, !tbaa !1
  %200 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %197, i64 %186
  %201 = load double, double* %200, align 8, !tbaa !1
  %202 = fmul double %199, %201
  %203 = fadd double %196, %202
  store double %203, double* %187, align 8, !tbaa !1
  %204 = add nsw i64 %189, 2
  %205 = icmp eq i64 %204, 1400
  br i1 %205, label %206, label %188

; <label>:206:                                    ; preds = %188
  %207 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %186, i64 %182
  store double %203, double* %207, align 8, !tbaa !1
  %208 = add nuw nsw i64 %186, 1
  %209 = icmp eq i64 %208, 1200
  br i1 %209, label %177, label %185

; <label>:210:                                    ; preds = %177
  %211 = getelementptr inbounds i8, i8* %4, i64 11519992
  %212 = bitcast i8* %211 to double*
  store double 1.000000e+00, double* %212, align 8, !tbaa !1
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %213 = icmp sgt i32 %0, 42
  br i1 %213, label %214, label %250

; <label>:214:                                    ; preds = %210
  %215 = load i8*, i8** %1, align 8, !tbaa !17
  %216 = load i8, i8* %215, align 1, !tbaa !19
  %217 = icmp eq i8 %216, 0
  br i1 %217, label %218, label %250

; <label>:218:                                    ; preds = %214
  %219 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %220 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %219) #4
  %221 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %222 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %221, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %223

; <label>:223:                                    ; preds = %242, %218
  %224 = phi i64 [ 0, %218 ], [ %243, %242 ]
  %225 = mul nuw nsw i64 %224, 1200
  br label %226

; <label>:226:                                    ; preds = %235, %223
  %227 = phi i64 [ 0, %223 ], [ %240, %235 ]
  %228 = add nuw nsw i64 %227, %225
  %229 = trunc i64 %228 to i32
  %230 = srem i32 %229, 20
  %231 = icmp eq i32 %230, 0
  br i1 %231, label %232, label %235

; <label>:232:                                    ; preds = %226
  %233 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %234 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %233) #4
  br label %235

; <label>:235:                                    ; preds = %232, %226
  %236 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %237 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %224, i64 %227
  %238 = load double, double* %237, align 8, !tbaa !1
  %239 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %236, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %238) #4
  %240 = add nuw nsw i64 %227, 1
  %241 = icmp eq i64 %240, 1200
  br i1 %241, label %242, label %226

; <label>:242:                                    ; preds = %235
  %243 = add nuw nsw i64 %224, 1
  %244 = icmp eq i64 %243, 1200
  br i1 %244, label %245, label %223

; <label>:245:                                    ; preds = %242
  %246 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %247 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %246, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #4
  %248 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %249 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %248) #4
  br label %250

; <label>:250:                                    ; preds = %214, %245, %210
  tail call void @free(i8* %3) #3
  tail call void @free(i8* nonnull %4) #3
  tail call void @free(i8* %5) #3
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
declare double @sqrt(double) local_unnamed_addr #2

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
