; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %8 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %9 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %10 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %11 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %12 = bitcast i8* %3 to [2000 x double]*
  %13 = bitcast i8* %4 to double*
  %14 = bitcast i8* %5 to double*
  %15 = bitcast i8* %6 to double*
  %16 = bitcast i8* %7 to double*
  %17 = bitcast i8* %8 to double*
  %18 = bitcast i8* %9 to double*
  %19 = bitcast i8* %10 to double*
  %20 = bitcast i8* %11 to double*
  br label %23

; <label>:21:                                     ; preds = %44
  %22 = icmp eq i64 %28, 2000
  br i1 %22, label %61, label %23

; <label>:23:                                     ; preds = %21, %2
  %24 = phi i64 [ 0, %2 ], [ %28, %21 ]
  %25 = trunc i64 %24 to i32
  %26 = sitofp i32 %25 to double
  %27 = getelementptr inbounds double, double* %13, i64 %24
  store double %26, double* %27, align 8, !tbaa !1
  %28 = add nuw nsw i64 %24, 1
  %29 = trunc i64 %28 to i32
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 2.000000e+03
  %32 = fmul double %31, 5.000000e-01
  %33 = getelementptr inbounds double, double* %15, i64 %24
  store double %32, double* %33, align 8, !tbaa !1
  %34 = fmul double %31, 2.500000e-01
  %35 = getelementptr inbounds double, double* %14, i64 %24
  store double %34, double* %35, align 8, !tbaa !1
  %36 = fdiv double %31, 6.000000e+00
  %37 = getelementptr inbounds double, double* %16, i64 %24
  store double %36, double* %37, align 8, !tbaa !1
  %38 = fmul double %31, 1.250000e-01
  %39 = getelementptr inbounds double, double* %19, i64 %24
  store double %38, double* %39, align 8, !tbaa !1
  %40 = fdiv double %31, 9.000000e+00
  %41 = getelementptr inbounds double, double* %20, i64 %24
  store double %40, double* %41, align 8, !tbaa !1
  %42 = getelementptr inbounds double, double* %18, i64 %24
  store double 0.000000e+00, double* %42, align 8, !tbaa !1
  %43 = getelementptr inbounds double, double* %17, i64 %24
  store double 0.000000e+00, double* %43, align 8, !tbaa !1
  br label %44

; <label>:44:                                     ; preds = %44, %23
  %45 = phi i64 [ 0, %23 ], [ %59, %44 ]
  %46 = mul nuw nsw i64 %45, %24
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, 2000
  %49 = sitofp i32 %48 to double
  %50 = fdiv double %49, 2.000000e+03
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %24, i64 %45
  store double %50, double* %51, align 8, !tbaa !1
  %52 = or i64 %45, 1
  %53 = mul nuw nsw i64 %52, %24
  %54 = trunc i64 %53 to i32
  %55 = srem i32 %54, 2000
  %56 = sitofp i32 %55 to double
  %57 = fdiv double %56, 2.000000e+03
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %24, i64 %52
  store double %57, double* %58, align 8, !tbaa !1
  %59 = add nsw i64 %45, 2
  %60 = icmp eq i64 %59, 2000
  br i1 %60, label %21, label %44

; <label>:61:                                     ; preds = %21
  tail call void (...) @polybench_timer_start() #3
  %62 = getelementptr i8, i8* %5, i64 16000
  %63 = getelementptr i8, i8* %7, i64 16000
  br label %64

; <label>:64:                                     ; preds = %166, %61
  %65 = phi i64 [ 0, %61 ], [ %167, %166 ]
  %66 = mul i64 %65, 16000
  %67 = getelementptr i8, i8* %3, i64 %66
  %68 = add i64 %66, 16000
  %69 = getelementptr i8, i8* %3, i64 %68
  %70 = getelementptr inbounds double, double* %13, i64 %65
  %71 = getelementptr inbounds double, double* %15, i64 %65
  %72 = bitcast double* %70 to i8*
  %73 = bitcast double* %70 to i8*
  %74 = icmp ult i8* %67, %73
  %75 = icmp ult i8* %72, %69
  %76 = and i1 %74, %75
  %77 = icmp ult i8* %67, %62
  %78 = icmp ult i8* %5, %69
  %79 = and i1 %77, %78
  %80 = or i1 %76, %79
  %81 = bitcast double* %71 to i8*
  %82 = bitcast double* %71 to i8*
  %83 = icmp ult i8* %67, %82
  %84 = icmp ult i8* %81, %69
  %85 = and i1 %83, %84
  %86 = or i1 %80, %85
  %87 = icmp ult i8* %67, %63
  %88 = icmp ult i8* %7, %69
  %89 = and i1 %87, %88
  %90 = or i1 %86, %89
  br i1 %90, label %102, label %91

; <label>:91:                                     ; preds = %64
  %92 = load double, double* %70, align 8, !tbaa !1, !alias.scope !5
  %93 = insertelement <2 x double> undef, double %92, i32 0
  %94 = insertelement <2 x double> %93, double %92, i32 1
  %95 = insertelement <2 x double> undef, double %92, i32 0
  %96 = insertelement <2 x double> %95, double %92, i32 1
  %97 = load double, double* %71, align 8, !tbaa !1, !alias.scope !8
  %98 = insertelement <2 x double> undef, double %97, i32 0
  %99 = insertelement <2 x double> %98, double %97, i32 1
  %100 = insertelement <2 x double> undef, double %97, i32 0
  %101 = insertelement <2 x double> %100, double %97, i32 1
  br label %103

; <label>:102:                                    ; preds = %64
  br label %135

; <label>:103:                                    ; preds = %103, %91
  %104 = phi i64 [ %133, %103 ], [ 0, %91 ]
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %65, i64 %104
  %106 = bitcast double* %105 to <2 x double>*
  %107 = load <2 x double>, <2 x double>* %106, align 8, !tbaa !1, !alias.scope !10, !noalias !12
  %108 = getelementptr double, double* %105, i64 2
  %109 = bitcast double* %108 to <2 x double>*
  %110 = load <2 x double>, <2 x double>* %109, align 8, !tbaa !1, !alias.scope !10, !noalias !12
  %111 = getelementptr inbounds double, double* %14, i64 %104
  %112 = bitcast double* %111 to <2 x double>*
  %113 = load <2 x double>, <2 x double>* %112, align 8, !tbaa !1, !alias.scope !15
  %114 = getelementptr double, double* %111, i64 2
  %115 = bitcast double* %114 to <2 x double>*
  %116 = load <2 x double>, <2 x double>* %115, align 8, !tbaa !1, !alias.scope !15
  %117 = fmul <2 x double> %94, %113
  %118 = fmul <2 x double> %96, %116
  %119 = fadd <2 x double> %107, %117
  %120 = fadd <2 x double> %110, %118
  %121 = getelementptr inbounds double, double* %16, i64 %104
  %122 = bitcast double* %121 to <2 x double>*
  %123 = load <2 x double>, <2 x double>* %122, align 8, !tbaa !1, !alias.scope !16
  %124 = getelementptr double, double* %121, i64 2
  %125 = bitcast double* %124 to <2 x double>*
  %126 = load <2 x double>, <2 x double>* %125, align 8, !tbaa !1, !alias.scope !16
  %127 = fmul <2 x double> %99, %123
  %128 = fmul <2 x double> %101, %126
  %129 = fadd <2 x double> %119, %127
  %130 = fadd <2 x double> %120, %128
  %131 = bitcast double* %105 to <2 x double>*
  store <2 x double> %129, <2 x double>* %131, align 8, !tbaa !1, !alias.scope !10, !noalias !12
  %132 = bitcast double* %108 to <2 x double>*
  store <2 x double> %130, <2 x double>* %132, align 8, !tbaa !1, !alias.scope !10, !noalias !12
  %133 = add i64 %104, 4
  %134 = icmp eq i64 %133, 2000
  br i1 %134, label %165, label %103, !llvm.loop !17

; <label>:135:                                    ; preds = %135, %102
  %136 = phi i64 [ 0, %102 ], [ %162, %135 ]
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %65, i64 %136
  %138 = load double, double* %137, align 8, !tbaa !1
  %139 = load double, double* %70, align 8, !tbaa !1
  %140 = getelementptr inbounds double, double* %14, i64 %136
  %141 = load double, double* %140, align 8, !tbaa !1
  %142 = fmul double %139, %141
  %143 = fadd double %138, %142
  %144 = load double, double* %71, align 8, !tbaa !1
  %145 = getelementptr inbounds double, double* %16, i64 %136
  %146 = load double, double* %145, align 8, !tbaa !1
  %147 = fmul double %144, %146
  %148 = fadd double %143, %147
  store double %148, double* %137, align 8, !tbaa !1
  %149 = or i64 %136, 1
  %150 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %65, i64 %149
  %151 = load double, double* %150, align 8, !tbaa !1
  %152 = load double, double* %70, align 8, !tbaa !1
  %153 = getelementptr inbounds double, double* %14, i64 %149
  %154 = load double, double* %153, align 8, !tbaa !1
  %155 = fmul double %152, %154
  %156 = fadd double %151, %155
  %157 = load double, double* %71, align 8, !tbaa !1
  %158 = getelementptr inbounds double, double* %16, i64 %149
  %159 = load double, double* %158, align 8, !tbaa !1
  %160 = fmul double %157, %159
  %161 = fadd double %156, %160
  store double %161, double* %150, align 8, !tbaa !1
  %162 = add nsw i64 %136, 2
  %163 = icmp eq i64 %162, 2000
  br i1 %163, label %164, label %135, !llvm.loop !20

; <label>:164:                                    ; preds = %135
  br label %166

; <label>:165:                                    ; preds = %103
  br label %166

; <label>:166:                                    ; preds = %165, %164
  %167 = add nuw nsw i64 %65, 1
  %168 = icmp eq i64 %167, 2000
  br i1 %168, label %169, label %64

; <label>:169:                                    ; preds = %166
  br label %170

; <label>:170:                                    ; preds = %194, %169
  %171 = phi i64 [ %195, %194 ], [ 0, %169 ]
  %172 = getelementptr inbounds double, double* %18, i64 %171
  %173 = load double, double* %172, align 8, !tbaa !1
  br label %174

; <label>:174:                                    ; preds = %174, %170
  %175 = phi double [ %173, %170 ], [ %191, %174 ]
  %176 = phi i64 [ 0, %170 ], [ %192, %174 ]
  %177 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %176, i64 %171
  %178 = load double, double* %177, align 8, !tbaa !1
  %179 = fmul double %178, 1.200000e+00
  %180 = getelementptr inbounds double, double* %19, i64 %176
  %181 = load double, double* %180, align 8, !tbaa !1
  %182 = fmul double %179, %181
  %183 = fadd double %175, %182
  store double %183, double* %172, align 8, !tbaa !1
  %184 = or i64 %176, 1
  %185 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %184, i64 %171
  %186 = load double, double* %185, align 8, !tbaa !1
  %187 = fmul double %186, 1.200000e+00
  %188 = getelementptr inbounds double, double* %19, i64 %184
  %189 = load double, double* %188, align 8, !tbaa !1
  %190 = fmul double %187, %189
  %191 = fadd double %183, %190
  store double %191, double* %172, align 8, !tbaa !1
  %192 = add nsw i64 %176, 2
  %193 = icmp eq i64 %192, 2000
  br i1 %193, label %194, label %174

; <label>:194:                                    ; preds = %174
  %195 = add nuw nsw i64 %171, 1
  %196 = icmp eq i64 %195, 2000
  br i1 %196, label %197, label %170

; <label>:197:                                    ; preds = %194
  %198 = getelementptr i8, i8* %9, i64 16000
  %199 = getelementptr i8, i8* %11, i64 16000
  %200 = icmp ult i8* %9, %199
  %201 = icmp ult i8* %11, %198
  %202 = and i1 %200, %201
  br i1 %202, label %204, label %203

; <label>:203:                                    ; preds = %197
  br label %205

; <label>:204:                                    ; preds = %197
  br label %242

; <label>:205:                                    ; preds = %205, %203
  %206 = phi i64 [ 0, %203 ], [ %240, %205 ]
  %207 = getelementptr inbounds double, double* %18, i64 %206
  %208 = bitcast double* %207 to <2 x double>*
  %209 = load <2 x double>, <2 x double>* %208, align 8, !tbaa !1, !alias.scope !21, !noalias !24
  %210 = getelementptr double, double* %207, i64 2
  %211 = bitcast double* %210 to <2 x double>*
  %212 = load <2 x double>, <2 x double>* %211, align 8, !tbaa !1, !alias.scope !21, !noalias !24
  %213 = getelementptr inbounds double, double* %20, i64 %206
  %214 = bitcast double* %213 to <2 x double>*
  %215 = load <2 x double>, <2 x double>* %214, align 8, !tbaa !1, !alias.scope !24
  %216 = getelementptr double, double* %213, i64 2
  %217 = bitcast double* %216 to <2 x double>*
  %218 = load <2 x double>, <2 x double>* %217, align 8, !tbaa !1, !alias.scope !24
  %219 = fadd <2 x double> %209, %215
  %220 = fadd <2 x double> %212, %218
  %221 = bitcast double* %207 to <2 x double>*
  store <2 x double> %219, <2 x double>* %221, align 8, !tbaa !1, !alias.scope !21, !noalias !24
  %222 = bitcast double* %210 to <2 x double>*
  store <2 x double> %220, <2 x double>* %222, align 8, !tbaa !1, !alias.scope !21, !noalias !24
  %223 = or i64 %206, 4
  %224 = getelementptr inbounds double, double* %18, i64 %223
  %225 = bitcast double* %224 to <2 x double>*
  %226 = load <2 x double>, <2 x double>* %225, align 8, !tbaa !1, !alias.scope !21, !noalias !24
  %227 = getelementptr double, double* %224, i64 2
  %228 = bitcast double* %227 to <2 x double>*
  %229 = load <2 x double>, <2 x double>* %228, align 8, !tbaa !1, !alias.scope !21, !noalias !24
  %230 = getelementptr inbounds double, double* %20, i64 %223
  %231 = bitcast double* %230 to <2 x double>*
  %232 = load <2 x double>, <2 x double>* %231, align 8, !tbaa !1, !alias.scope !24
  %233 = getelementptr double, double* %230, i64 2
  %234 = bitcast double* %233 to <2 x double>*
  %235 = load <2 x double>, <2 x double>* %234, align 8, !tbaa !1, !alias.scope !24
  %236 = fadd <2 x double> %226, %232
  %237 = fadd <2 x double> %229, %235
  %238 = bitcast double* %224 to <2 x double>*
  store <2 x double> %236, <2 x double>* %238, align 8, !tbaa !1, !alias.scope !21, !noalias !24
  %239 = bitcast double* %227 to <2 x double>*
  store <2 x double> %237, <2 x double>* %239, align 8, !tbaa !1, !alias.scope !21, !noalias !24
  %240 = add nsw i64 %206, 8
  %241 = icmp eq i64 %240, 2000
  br i1 %241, label %276, label %205, !llvm.loop !26

; <label>:242:                                    ; preds = %242, %204
  %243 = phi i64 [ 0, %204 ], [ %273, %242 ]
  %244 = getelementptr inbounds double, double* %18, i64 %243
  %245 = load double, double* %244, align 8, !tbaa !1
  %246 = getelementptr inbounds double, double* %20, i64 %243
  %247 = load double, double* %246, align 8, !tbaa !1
  %248 = fadd double %245, %247
  store double %248, double* %244, align 8, !tbaa !1
  %249 = add nuw nsw i64 %243, 1
  %250 = getelementptr inbounds double, double* %18, i64 %249
  %251 = load double, double* %250, align 8, !tbaa !1
  %252 = getelementptr inbounds double, double* %20, i64 %249
  %253 = load double, double* %252, align 8, !tbaa !1
  %254 = fadd double %251, %253
  store double %254, double* %250, align 8, !tbaa !1
  %255 = add nsw i64 %243, 2
  %256 = getelementptr inbounds double, double* %18, i64 %255
  %257 = load double, double* %256, align 8, !tbaa !1
  %258 = getelementptr inbounds double, double* %20, i64 %255
  %259 = load double, double* %258, align 8, !tbaa !1
  %260 = fadd double %257, %259
  store double %260, double* %256, align 8, !tbaa !1
  %261 = add nsw i64 %243, 3
  %262 = getelementptr inbounds double, double* %18, i64 %261
  %263 = load double, double* %262, align 8, !tbaa !1
  %264 = getelementptr inbounds double, double* %20, i64 %261
  %265 = load double, double* %264, align 8, !tbaa !1
  %266 = fadd double %263, %265
  store double %266, double* %262, align 8, !tbaa !1
  %267 = add nsw i64 %243, 4
  %268 = getelementptr inbounds double, double* %18, i64 %267
  %269 = load double, double* %268, align 8, !tbaa !1
  %270 = getelementptr inbounds double, double* %20, i64 %267
  %271 = load double, double* %270, align 8, !tbaa !1
  %272 = fadd double %269, %271
  store double %272, double* %268, align 8, !tbaa !1
  %273 = add nsw i64 %243, 5
  %274 = icmp eq i64 %273, 2000
  br i1 %274, label %275, label %242, !llvm.loop !27

; <label>:275:                                    ; preds = %242
  br label %277

; <label>:276:                                    ; preds = %205
  br label %277

; <label>:277:                                    ; preds = %276, %275
  br label %278

; <label>:278:                                    ; preds = %302, %277
  %279 = phi i64 [ %303, %302 ], [ 0, %277 ]
  %280 = getelementptr inbounds double, double* %17, i64 %279
  %281 = load double, double* %280, align 8, !tbaa !1
  br label %282

; <label>:282:                                    ; preds = %282, %278
  %283 = phi double [ %281, %278 ], [ %299, %282 ]
  %284 = phi i64 [ 0, %278 ], [ %300, %282 ]
  %285 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %279, i64 %284
  %286 = load double, double* %285, align 8, !tbaa !1
  %287 = fmul double %286, 1.500000e+00
  %288 = getelementptr inbounds double, double* %18, i64 %284
  %289 = load double, double* %288, align 8, !tbaa !1
  %290 = fmul double %287, %289
  %291 = fadd double %283, %290
  store double %291, double* %280, align 8, !tbaa !1
  %292 = or i64 %284, 1
  %293 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %279, i64 %292
  %294 = load double, double* %293, align 8, !tbaa !1
  %295 = fmul double %294, 1.500000e+00
  %296 = getelementptr inbounds double, double* %18, i64 %292
  %297 = load double, double* %296, align 8, !tbaa !1
  %298 = fmul double %295, %297
  %299 = fadd double %291, %298
  store double %299, double* %280, align 8, !tbaa !1
  %300 = add nsw i64 %284, 2
  %301 = icmp eq i64 %300, 2000
  br i1 %301, label %302, label %282

; <label>:302:                                    ; preds = %282
  %303 = add nuw nsw i64 %279, 1
  %304 = icmp eq i64 %303, 2000
  br i1 %304, label %305, label %278

; <label>:305:                                    ; preds = %302
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %306 = icmp sgt i32 %0, 42
  br i1 %306, label %307, label %336

; <label>:307:                                    ; preds = %305
  %308 = load i8*, i8** %1, align 8, !tbaa !28
  %309 = load i8, i8* %308, align 1, !tbaa !30
  %310 = icmp eq i8 %309, 0
  br i1 %310, label %311, label %336

; <label>:311:                                    ; preds = %307
  %312 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !28
  %313 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %312) #4
  %314 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !28
  %315 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %314, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %316

; <label>:316:                                    ; preds = %324, %311
  %317 = phi i64 [ 0, %311 ], [ %329, %324 ]
  %318 = trunc i64 %317 to i32
  %319 = srem i32 %318, 20
  %320 = icmp eq i32 %319, 0
  br i1 %320, label %321, label %324

; <label>:321:                                    ; preds = %316
  %322 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !28
  %323 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %322) #4
  br label %324

; <label>:324:                                    ; preds = %321, %316
  %325 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !28
  %326 = getelementptr inbounds double, double* %17, i64 %317
  %327 = load double, double* %326, align 8, !tbaa !1
  %328 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %325, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %327) #4
  %329 = add nuw nsw i64 %317, 1
  %330 = icmp eq i64 %329, 2000
  br i1 %330, label %331, label %316

; <label>:331:                                    ; preds = %324
  %332 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !28
  %333 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %332, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %334 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !28
  %335 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %334) #4
  br label %336

; <label>:336:                                    ; preds = %331, %307, %305
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  tail call void @free(i8* %7) #3
  tail call void @free(i8* nonnull %8) #3
  tail call void @free(i8* %9) #3
  tail call void @free(i8* %10) #3
  tail call void @free(i8* %11) #3
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
!10 = !{!11}
!11 = distinct !{!11, !7}
!12 = !{!6, !13, !9, !14}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = !{!13}
!16 = !{!14}
!17 = distinct !{!17, !18, !19}
!18 = !{!"llvm.loop.vectorize.width", i32 1}
!19 = !{!"llvm.loop.interleave.count", i32 1}
!20 = distinct !{!20, !18, !19}
!21 = !{!22}
!22 = distinct !{!22, !23}
!23 = distinct !{!23, !"LVerDomain"}
!24 = !{!25}
!25 = distinct !{!25, !23}
!26 = distinct !{!26, !18, !19}
!27 = distinct !{!27, !18, !19}
!28 = !{!29, !29, i64 0}
!29 = !{!"any pointer", !3, i64 0}
!30 = !{!3, !3, i64 0}
