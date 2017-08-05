; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  br label %5

; <label>:5:                                      ; preds = %32, %2
  %6 = phi i64 [ 0, %2 ], [ %26, %32 ]
  %7 = phi i64 [ 1, %2 ], [ %33, %32 ]
  %8 = mul nuw nsw i64 %6, 2001
  %9 = add nuw nsw i64 %8, 1
  %10 = getelementptr [2000 x double], [2000 x double]* %4, i64 0, i64 %9
  %11 = sub i64 1998, %6
  %12 = shl i64 %11, 3
  %13 = and i64 %12, 34359738360
  br label %14

; <label>:14:                                     ; preds = %14, %5
  %15 = phi i64 [ 0, %5 ], [ %23, %14 ]
  %16 = sub nsw i64 0, %15
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 2000
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 2.000000e+03
  %21 = fadd double %20, 1.000000e+00
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %6, i64 %15
  store double %21, double* %22, align 8, !tbaa !1
  %23 = add nuw nsw i64 %15, 1
  %24 = icmp eq i64 %23, %7
  br i1 %24, label %25, label %14

; <label>:25:                                     ; preds = %14
  %26 = add nuw nsw i64 %6, 1
  %27 = icmp slt i64 %26, 2000
  br i1 %27, label %28, label %34

; <label>:28:                                     ; preds = %25
  %29 = add nuw nsw i64 %13, 8
  %30 = bitcast double* %10 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull %30, i8 0, i64 %29, i32 8, i1 false) #3
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %6, i64 %6
  store double 1.000000e+00, double* %31, align 8, !tbaa !1
  br label %32

; <label>:32:                                     ; preds = %34, %28
  %33 = add nuw nsw i64 %7, 1
  br label %5

; <label>:34:                                     ; preds = %25
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %6, i64 %6
  store double 1.000000e+00, double* %35, align 8, !tbaa !1
  %36 = icmp eq i64 %26, 2000
  br i1 %36, label %37, label %32

; <label>:37:                                     ; preds = %34
  %38 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  tail call void @llvm.memset.p0i8.i64(i8* %38, i8 0, i64 32000000, i32 8, i1 false) #3
  %39 = bitcast i8* %38 to [2000 x [2000 x double]]*
  br label %40

; <label>:40:                                     ; preds = %67, %37
  %41 = phi i64 [ 0, %37 ], [ %68, %67 ]
  br label %42

; <label>:42:                                     ; preds = %64, %40
  %43 = phi i64 [ 0, %40 ], [ %65, %64 ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %43, i64 %41
  br label %45

; <label>:45:                                     ; preds = %45, %42
  %46 = phi i64 [ 0, %42 ], [ %62, %45 ]
  %47 = load double, double* %44, align 8, !tbaa !1
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %46, i64 %41
  %49 = load double, double* %48, align 8, !tbaa !1
  %50 = fmul double %47, %49
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %43, i64 %46
  %52 = load double, double* %51, align 8, !tbaa !1
  %53 = fadd double %52, %50
  store double %53, double* %51, align 8, !tbaa !1
  %54 = or i64 %46, 1
  %55 = load double, double* %44, align 8, !tbaa !1
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %54, i64 %41
  %57 = load double, double* %56, align 8, !tbaa !1
  %58 = fmul double %55, %57
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %43, i64 %54
  %60 = load double, double* %59, align 8, !tbaa !1
  %61 = fadd double %60, %58
  store double %61, double* %59, align 8, !tbaa !1
  %62 = add nsw i64 %46, 2
  %63 = icmp eq i64 %62, 2000
  br i1 %63, label %64, label %45

; <label>:64:                                     ; preds = %45
  %65 = add nuw nsw i64 %43, 1
  %66 = icmp eq i64 %65, 2000
  br i1 %66, label %67, label %42

; <label>:67:                                     ; preds = %64
  %68 = add nuw nsw i64 %41, 1
  %69 = icmp eq i64 %68, 2000
  br i1 %69, label %70, label %40

; <label>:70:                                     ; preds = %67
  br label %71

; <label>:71:                                     ; preds = %144, %70
  %72 = phi i64 [ %145, %144 ], [ 0, %70 ]
  %73 = mul i64 %72, 16000
  %74 = getelementptr i8, i8* %3, i64 %73
  %75 = add i64 %73, 16000
  %76 = getelementptr i8, i8* %3, i64 %75
  %77 = getelementptr i8, i8* %38, i64 %73
  %78 = getelementptr i8, i8* %38, i64 %75
  %79 = icmp ult i8* %74, %78
  %80 = icmp ult i8* %77, %76
  %81 = and i1 %79, %80
  br i1 %81, label %83, label %82

; <label>:82:                                     ; preds = %71
  br label %84

; <label>:83:                                     ; preds = %71
  br label %109

; <label>:84:                                     ; preds = %84, %82
  %85 = phi i64 [ 0, %82 ], [ %107, %84 ]
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %72, i64 %85
  %87 = bitcast double* %86 to <2 x i64>*
  %88 = load <2 x i64>, <2 x i64>* %87, align 8, !tbaa !1, !alias.scope !5
  %89 = getelementptr double, double* %86, i64 2
  %90 = bitcast double* %89 to <2 x i64>*
  %91 = load <2 x i64>, <2 x i64>* %90, align 8, !tbaa !1, !alias.scope !5
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %72, i64 %85
  %93 = bitcast double* %92 to <2 x i64>*
  store <2 x i64> %88, <2 x i64>* %93, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x i64>*
  store <2 x i64> %91, <2 x i64>* %95, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %96 = or i64 %85, 4
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %72, i64 %96
  %98 = bitcast double* %97 to <2 x i64>*
  %99 = load <2 x i64>, <2 x i64>* %98, align 8, !tbaa !1, !alias.scope !5
  %100 = getelementptr double, double* %97, i64 2
  %101 = bitcast double* %100 to <2 x i64>*
  %102 = load <2 x i64>, <2 x i64>* %101, align 8, !tbaa !1, !alias.scope !5
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %72, i64 %96
  %104 = bitcast double* %103 to <2 x i64>*
  store <2 x i64> %99, <2 x i64>* %104, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  store <2 x i64> %102, <2 x i64>* %106, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %107 = add nsw i64 %85, 8
  %108 = icmp eq i64 %107, 2000
  br i1 %108, label %143, label %84, !llvm.loop !10

; <label>:109:                                    ; preds = %109, %83
  %110 = phi i64 [ 0, %83 ], [ %140, %109 ]
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %72, i64 %110
  %112 = bitcast double* %111 to i64*
  %113 = load i64, i64* %112, align 8, !tbaa !1
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %72, i64 %110
  %115 = bitcast double* %114 to i64*
  store i64 %113, i64* %115, align 8, !tbaa !1
  %116 = add nuw nsw i64 %110, 1
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %72, i64 %116
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8, !tbaa !1
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %72, i64 %116
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8, !tbaa !1
  %122 = add nsw i64 %110, 2
  %123 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %72, i64 %122
  %124 = bitcast double* %123 to i64*
  %125 = load i64, i64* %124, align 8, !tbaa !1
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %72, i64 %122
  %127 = bitcast double* %126 to i64*
  store i64 %125, i64* %127, align 8, !tbaa !1
  %128 = add nsw i64 %110, 3
  %129 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %72, i64 %128
  %130 = bitcast double* %129 to i64*
  %131 = load i64, i64* %130, align 8, !tbaa !1
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %72, i64 %128
  %133 = bitcast double* %132 to i64*
  store i64 %131, i64* %133, align 8, !tbaa !1
  %134 = add nsw i64 %110, 4
  %135 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %72, i64 %134
  %136 = bitcast double* %135 to i64*
  %137 = load i64, i64* %136, align 8, !tbaa !1
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %72, i64 %134
  %139 = bitcast double* %138 to i64*
  store i64 %137, i64* %139, align 8, !tbaa !1
  %140 = add nsw i64 %110, 5
  %141 = icmp eq i64 %140, 2000
  br i1 %141, label %142, label %109, !llvm.loop !13

; <label>:142:                                    ; preds = %109
  br label %144

; <label>:143:                                    ; preds = %84
  br label %144

; <label>:144:                                    ; preds = %143, %142
  %145 = add nuw nsw i64 %72, 1
  %146 = icmp eq i64 %145, 2000
  br i1 %146, label %147, label %71

; <label>:147:                                    ; preds = %144
  tail call void @free(i8* nonnull %38) #3
  tail call void (...) @polybench_timer_start() #3
  br label %148

; <label>:148:                                    ; preds = %247, %147
  %149 = phi i64 [ 0, %147 ], [ %248, %247 ]
  %150 = icmp sgt i64 %149, 0
  br i1 %150, label %151, label %247

; <label>:151:                                    ; preds = %148
  %152 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 0
  br label %191

; <label>:153:                                    ; preds = %241, %188
  %154 = phi i64 [ %189, %188 ], [ %149, %241 ]
  %155 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 %154
  %156 = load double, double* %155, align 8, !tbaa !1
  br i1 %243, label %164, label %157

; <label>:157:                                    ; preds = %153
  br label %158

; <label>:158:                                    ; preds = %157
  %159 = load double, double* %244, align 8, !tbaa !1
  %160 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %154
  %161 = load double, double* %160, align 8, !tbaa !1
  %162 = fmul double %159, %161
  %163 = fsub double %156, %162
  store double %163, double* %155, align 8, !tbaa !1
  br label %164

; <label>:164:                                    ; preds = %158, %153
  %165 = phi double [ %163, %158 ], [ %156, %153 ]
  %166 = phi i64 [ 1, %158 ], [ 0, %153 ]
  br label %167

; <label>:167:                                    ; preds = %164
  br i1 %245, label %188, label %168

; <label>:168:                                    ; preds = %167
  br label %169

; <label>:169:                                    ; preds = %169, %168
  %170 = phi double [ %165, %168 ], [ %184, %169 ]
  %171 = phi i64 [ %166, %168 ], [ %185, %169 ]
  %172 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 %171
  %173 = load double, double* %172, align 8, !tbaa !1
  %174 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %171, i64 %154
  %175 = load double, double* %174, align 8, !tbaa !1
  %176 = fmul double %173, %175
  %177 = fsub double %170, %176
  store double %177, double* %155, align 8, !tbaa !1
  %178 = add nuw nsw i64 %171, 1
  %179 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 %178
  %180 = load double, double* %179, align 8, !tbaa !1
  %181 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %178, i64 %154
  %182 = load double, double* %181, align 8, !tbaa !1
  %183 = fmul double %180, %182
  %184 = fsub double %177, %183
  store double %184, double* %155, align 8, !tbaa !1
  %185 = add nsw i64 %171, 2
  %186 = icmp eq i64 %185, %149
  br i1 %186, label %187, label %169

; <label>:187:                                    ; preds = %169
  br label %188

; <label>:188:                                    ; preds = %187, %167
  %189 = add nuw nsw i64 %154, 1
  %190 = icmp eq i64 %189, 2000
  br i1 %190, label %246, label %153

; <label>:191:                                    ; preds = %234, %151
  %192 = phi i64 [ %239, %234 ], [ 0, %151 ]
  %193 = icmp sgt i64 %192, 0
  %194 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 %192
  %195 = load double, double* %194, align 8, !tbaa !1
  br i1 %193, label %196, label %234

; <label>:196:                                    ; preds = %191
  %197 = and i64 %192, 1
  %198 = icmp eq i64 %197, 0
  br i1 %198, label %206, label %199

; <label>:199:                                    ; preds = %196
  br label %200

; <label>:200:                                    ; preds = %199
  %201 = load double, double* %152, align 8, !tbaa !1
  %202 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %192
  %203 = load double, double* %202, align 8, !tbaa !1
  %204 = fmul double %201, %203
  %205 = fsub double %195, %204
  store double %205, double* %194, align 8, !tbaa !1
  br label %206

; <label>:206:                                    ; preds = %200, %196
  %207 = phi double [ %205, %200 ], [ undef, %196 ]
  %208 = phi i64 [ 1, %200 ], [ 0, %196 ]
  %209 = phi double [ %205, %200 ], [ %195, %196 ]
  br label %210

; <label>:210:                                    ; preds = %206
  %211 = icmp eq i64 %192, 1
  br i1 %211, label %232, label %212

; <label>:212:                                    ; preds = %210
  br label %213

; <label>:213:                                    ; preds = %213, %212
  %214 = phi i64 [ %208, %212 ], [ %229, %213 ]
  %215 = phi double [ %209, %212 ], [ %228, %213 ]
  %216 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 %214
  %217 = load double, double* %216, align 8, !tbaa !1
  %218 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %214, i64 %192
  %219 = load double, double* %218, align 8, !tbaa !1
  %220 = fmul double %217, %219
  %221 = fsub double %215, %220
  store double %221, double* %194, align 8, !tbaa !1
  %222 = add nuw nsw i64 %214, 1
  %223 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 %222
  %224 = load double, double* %223, align 8, !tbaa !1
  %225 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %222, i64 %192
  %226 = load double, double* %225, align 8, !tbaa !1
  %227 = fmul double %224, %226
  %228 = fsub double %221, %227
  store double %228, double* %194, align 8, !tbaa !1
  %229 = add nsw i64 %214, 2
  %230 = icmp eq i64 %229, %192
  br i1 %230, label %231, label %213

; <label>:231:                                    ; preds = %213
  br label %232

; <label>:232:                                    ; preds = %231, %210
  %233 = phi double [ %207, %210 ], [ %228, %231 ]
  br label %234

; <label>:234:                                    ; preds = %232, %191
  %235 = phi double [ %195, %191 ], [ %233, %232 ]
  %236 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %192, i64 %192
  %237 = load double, double* %236, align 8, !tbaa !1
  %238 = fdiv double %235, %237
  store double %238, double* %194, align 8, !tbaa !1
  %239 = add nuw nsw i64 %192, 1
  %240 = icmp eq i64 %239, %149
  br i1 %240, label %241, label %191

; <label>:241:                                    ; preds = %234
  %242 = and i64 %149, 1
  %243 = icmp eq i64 %242, 0
  %244 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 0
  %245 = icmp eq i64 %149, 1
  br label %153

; <label>:246:                                    ; preds = %188
  br label %247

; <label>:247:                                    ; preds = %246, %148
  %248 = add nuw nsw i64 %149, 1
  %249 = icmp eq i64 %248, 2000
  br i1 %249, label %250, label %148

; <label>:250:                                    ; preds = %247
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %251 = icmp sgt i32 %0, 42
  br i1 %251, label %252, label %288

; <label>:252:                                    ; preds = %250
  %253 = load i8*, i8** %1, align 8, !tbaa !14
  %254 = load i8, i8* %253, align 1, !tbaa !16
  %255 = icmp eq i8 %254, 0
  br i1 %255, label %256, label %288

; <label>:256:                                    ; preds = %252
  %257 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %258 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %257) #5
  %259 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %260 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %259, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %261

; <label>:261:                                    ; preds = %280, %256
  %262 = phi i64 [ 0, %256 ], [ %281, %280 ]
  %263 = mul nuw nsw i64 %262, 2000
  br label %264

; <label>:264:                                    ; preds = %273, %261
  %265 = phi i64 [ 0, %261 ], [ %278, %273 ]
  %266 = add nuw nsw i64 %265, %263
  %267 = trunc i64 %266 to i32
  %268 = srem i32 %267, 20
  %269 = icmp eq i32 %268, 0
  br i1 %269, label %270, label %273

; <label>:270:                                    ; preds = %264
  %271 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %272 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %271) #5
  br label %273

; <label>:273:                                    ; preds = %270, %264
  %274 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %275 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %262, i64 %265
  %276 = load double, double* %275, align 8, !tbaa !1
  %277 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %274, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %276) #5
  %278 = add nuw nsw i64 %265, 1
  %279 = icmp eq i64 %278, 2000
  br i1 %279, label %280, label %264

; <label>:280:                                    ; preds = %273
  %281 = add nuw nsw i64 %262, 1
  %282 = icmp eq i64 %281, 2000
  br i1 %282, label %283, label %261

; <label>:283:                                    ; preds = %280
  %284 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %285 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %284, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %286 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %287 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %286) #5
  br label %288

; <label>:288:                                    ; preds = %283, %252, %250
  tail call void @free(i8* %3) #3
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
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.vectorize.width", i32 1}
!12 = !{!"llvm.loop.interleave.count", i32 1}
!13 = distinct !{!13, !11, !12}
!14 = !{!15, !15, i64 0}
!15 = !{!"any pointer", !3, i64 0}
!16 = !{!3, !3, i64 0}
