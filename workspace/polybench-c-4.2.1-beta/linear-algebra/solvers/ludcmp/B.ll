; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %7 = bitcast i8* %4 to double*
  %8 = bitcast i8* %5 to double*
  %9 = bitcast i8* %6 to double*
  br label %10

; <label>:10:                                     ; preds = %10, %2
  %11 = phi i64 [ 0, %2 ], [ %23, %10 ]
  %12 = getelementptr inbounds double, double* %8, i64 %11
  store double 0.000000e+00, double* %12, align 8, !tbaa !1
  %13 = getelementptr inbounds double, double* %9, i64 %11
  store double 0.000000e+00, double* %13, align 8, !tbaa !1
  %14 = or i64 %11, 1
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+03
  %18 = fmul double %17, 5.000000e-01
  %19 = fadd double %18, 4.000000e+00
  %20 = getelementptr inbounds double, double* %7, i64 %11
  store double %19, double* %20, align 8, !tbaa !1
  %21 = getelementptr inbounds double, double* %8, i64 %14
  store double 0.000000e+00, double* %21, align 8, !tbaa !1
  %22 = getelementptr inbounds double, double* %9, i64 %14
  store double 0.000000e+00, double* %22, align 8, !tbaa !1
  %23 = add nsw i64 %11, 2
  %24 = trunc i64 %23 to i32
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 2.000000e+03
  %27 = fmul double %26, 5.000000e-01
  %28 = fadd double %27, 4.000000e+00
  %29 = getelementptr inbounds double, double* %7, i64 %14
  store double %28, double* %29, align 8, !tbaa !1
  %30 = icmp eq i64 %23, 2000
  br i1 %30, label %31, label %10

; <label>:31:                                     ; preds = %10
  %32 = bitcast i8* %3 to [2000 x double]*
  br label %33

; <label>:33:                                     ; preds = %60, %31
  %34 = phi i64 [ 0, %31 ], [ %54, %60 ]
  %35 = phi i64 [ 1, %31 ], [ %61, %60 ]
  %36 = mul nuw nsw i64 %34, 2001
  %37 = add nuw nsw i64 %36, 1
  %38 = getelementptr [2000 x double], [2000 x double]* %32, i64 0, i64 %37
  %39 = sub i64 1998, %34
  %40 = shl i64 %39, 3
  %41 = and i64 %40, 34359738360
  br label %42

; <label>:42:                                     ; preds = %42, %33
  %43 = phi i64 [ 0, %33 ], [ %51, %42 ]
  %44 = sub nsw i64 0, %43
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, 2000
  %47 = sitofp i32 %46 to double
  %48 = fdiv double %47, 2.000000e+03
  %49 = fadd double %48, 1.000000e+00
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %34, i64 %43
  store double %49, double* %50, align 8, !tbaa !1
  %51 = add nuw nsw i64 %43, 1
  %52 = icmp eq i64 %51, %35
  br i1 %52, label %53, label %42

; <label>:53:                                     ; preds = %42
  %54 = add nuw nsw i64 %34, 1
  %55 = icmp slt i64 %54, 2000
  br i1 %55, label %56, label %62

; <label>:56:                                     ; preds = %53
  %57 = add nuw nsw i64 %41, 8
  %58 = bitcast double* %38 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull %58, i8 0, i64 %57, i32 8, i1 false) #3
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %34, i64 %34
  store double 1.000000e+00, double* %59, align 8, !tbaa !1
  br label %60

; <label>:60:                                     ; preds = %62, %56
  %61 = add nuw nsw i64 %35, 1
  br label %33

; <label>:62:                                     ; preds = %53
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %34, i64 %34
  store double 1.000000e+00, double* %63, align 8, !tbaa !1
  %64 = icmp eq i64 %54, 2000
  br i1 %64, label %65, label %60

; <label>:65:                                     ; preds = %62
  %66 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  tail call void @llvm.memset.p0i8.i64(i8* %66, i8 0, i64 32000000, i32 8, i1 false) #3
  %67 = bitcast i8* %66 to [2000 x [2000 x double]]*
  br label %68

; <label>:68:                                     ; preds = %95, %65
  %69 = phi i64 [ 0, %65 ], [ %96, %95 ]
  br label %70

; <label>:70:                                     ; preds = %92, %68
  %71 = phi i64 [ 0, %68 ], [ %93, %92 ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %71, i64 %69
  br label %73

; <label>:73:                                     ; preds = %73, %70
  %74 = phi i64 [ 0, %70 ], [ %90, %73 ]
  %75 = load double, double* %72, align 8, !tbaa !1
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %74, i64 %69
  %77 = load double, double* %76, align 8, !tbaa !1
  %78 = fmul double %75, %77
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %71, i64 %74
  %80 = load double, double* %79, align 8, !tbaa !1
  %81 = fadd double %80, %78
  store double %81, double* %79, align 8, !tbaa !1
  %82 = or i64 %74, 1
  %83 = load double, double* %72, align 8, !tbaa !1
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %82, i64 %69
  %85 = load double, double* %84, align 8, !tbaa !1
  %86 = fmul double %83, %85
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %71, i64 %82
  %88 = load double, double* %87, align 8, !tbaa !1
  %89 = fadd double %88, %86
  store double %89, double* %87, align 8, !tbaa !1
  %90 = add nsw i64 %74, 2
  %91 = icmp eq i64 %90, 2000
  br i1 %91, label %92, label %73

; <label>:92:                                     ; preds = %73
  %93 = add nuw nsw i64 %71, 1
  %94 = icmp eq i64 %93, 2000
  br i1 %94, label %95, label %70

; <label>:95:                                     ; preds = %92
  %96 = add nuw nsw i64 %69, 1
  %97 = icmp eq i64 %96, 2000
  br i1 %97, label %98, label %68

; <label>:98:                                     ; preds = %95
  br label %99

; <label>:99:                                     ; preds = %172, %98
  %100 = phi i64 [ %173, %172 ], [ 0, %98 ]
  %101 = mul i64 %100, 16000
  %102 = getelementptr i8, i8* %3, i64 %101
  %103 = add i64 %101, 16000
  %104 = getelementptr i8, i8* %3, i64 %103
  %105 = getelementptr i8, i8* %66, i64 %101
  %106 = getelementptr i8, i8* %66, i64 %103
  %107 = icmp ult i8* %102, %106
  %108 = icmp ult i8* %105, %104
  %109 = and i1 %107, %108
  br i1 %109, label %111, label %110

; <label>:110:                                    ; preds = %99
  br label %112

; <label>:111:                                    ; preds = %99
  br label %137

; <label>:112:                                    ; preds = %112, %110
  %113 = phi i64 [ 0, %110 ], [ %135, %112 ]
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %100, i64 %113
  %115 = bitcast double* %114 to <2 x i64>*
  %116 = load <2 x i64>, <2 x i64>* %115, align 8, !tbaa !1, !alias.scope !5
  %117 = getelementptr double, double* %114, i64 2
  %118 = bitcast double* %117 to <2 x i64>*
  %119 = load <2 x i64>, <2 x i64>* %118, align 8, !tbaa !1, !alias.scope !5
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %100, i64 %113
  %121 = bitcast double* %120 to <2 x i64>*
  store <2 x i64> %116, <2 x i64>* %121, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x i64>*
  store <2 x i64> %119, <2 x i64>* %123, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %124 = or i64 %113, 4
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %100, i64 %124
  %126 = bitcast double* %125 to <2 x i64>*
  %127 = load <2 x i64>, <2 x i64>* %126, align 8, !tbaa !1, !alias.scope !5
  %128 = getelementptr double, double* %125, i64 2
  %129 = bitcast double* %128 to <2 x i64>*
  %130 = load <2 x i64>, <2 x i64>* %129, align 8, !tbaa !1, !alias.scope !5
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %100, i64 %124
  %132 = bitcast double* %131 to <2 x i64>*
  store <2 x i64> %127, <2 x i64>* %132, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %133 = getelementptr double, double* %131, i64 2
  %134 = bitcast double* %133 to <2 x i64>*
  store <2 x i64> %130, <2 x i64>* %134, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %135 = add nsw i64 %113, 8
  %136 = icmp eq i64 %135, 2000
  br i1 %136, label %171, label %112, !llvm.loop !10

; <label>:137:                                    ; preds = %137, %111
  %138 = phi i64 [ 0, %111 ], [ %168, %137 ]
  %139 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %100, i64 %138
  %140 = bitcast double* %139 to i64*
  %141 = load i64, i64* %140, align 8, !tbaa !1
  %142 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %100, i64 %138
  %143 = bitcast double* %142 to i64*
  store i64 %141, i64* %143, align 8, !tbaa !1
  %144 = add nuw nsw i64 %138, 1
  %145 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %100, i64 %144
  %146 = bitcast double* %145 to i64*
  %147 = load i64, i64* %146, align 8, !tbaa !1
  %148 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %100, i64 %144
  %149 = bitcast double* %148 to i64*
  store i64 %147, i64* %149, align 8, !tbaa !1
  %150 = add nsw i64 %138, 2
  %151 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %100, i64 %150
  %152 = bitcast double* %151 to i64*
  %153 = load i64, i64* %152, align 8, !tbaa !1
  %154 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %100, i64 %150
  %155 = bitcast double* %154 to i64*
  store i64 %153, i64* %155, align 8, !tbaa !1
  %156 = add nsw i64 %138, 3
  %157 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %100, i64 %156
  %158 = bitcast double* %157 to i64*
  %159 = load i64, i64* %158, align 8, !tbaa !1
  %160 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %100, i64 %156
  %161 = bitcast double* %160 to i64*
  store i64 %159, i64* %161, align 8, !tbaa !1
  %162 = add nsw i64 %138, 4
  %163 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %100, i64 %162
  %164 = bitcast double* %163 to i64*
  %165 = load i64, i64* %164, align 8, !tbaa !1
  %166 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %100, i64 %162
  %167 = bitcast double* %166 to i64*
  store i64 %165, i64* %167, align 8, !tbaa !1
  %168 = add nsw i64 %138, 5
  %169 = icmp eq i64 %168, 2000
  br i1 %169, label %170, label %137, !llvm.loop !13

; <label>:170:                                    ; preds = %137
  br label %172

; <label>:171:                                    ; preds = %112
  br label %172

; <label>:172:                                    ; preds = %171, %170
  %173 = add nuw nsw i64 %100, 1
  %174 = icmp eq i64 %173, 2000
  br i1 %174, label %175, label %99

; <label>:175:                                    ; preds = %172
  tail call void @free(i8* nonnull %66) #3
  tail call void (...) @polybench_timer_start() #3
  br label %176

; <label>:176:                                    ; preds = %277, %175
  %177 = phi i64 [ 0, %175 ], [ %278, %277 ]
  %178 = icmp sgt i64 %177, 0
  br i1 %178, label %179, label %277

; <label>:179:                                    ; preds = %176
  %180 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %177, i64 0
  br label %221

; <label>:181:                                    ; preds = %271, %217
  %182 = phi i64 [ %219, %217 ], [ %177, %271 ]
  %183 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %177, i64 %182
  %184 = load double, double* %183, align 8, !tbaa !1
  br i1 %273, label %192, label %185

; <label>:185:                                    ; preds = %181
  br label %186

; <label>:186:                                    ; preds = %185
  %187 = load double, double* %274, align 8, !tbaa !1
  %188 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 0, i64 %182
  %189 = load double, double* %188, align 8, !tbaa !1
  %190 = fmul double %187, %189
  %191 = fsub double %184, %190
  br label %192

; <label>:192:                                    ; preds = %186, %181
  %193 = phi double [ %191, %186 ], [ undef, %181 ]
  %194 = phi i64 [ 1, %186 ], [ 0, %181 ]
  %195 = phi double [ %191, %186 ], [ %184, %181 ]
  br label %196

; <label>:196:                                    ; preds = %192
  br i1 %275, label %217, label %197

; <label>:197:                                    ; preds = %196
  br label %198

; <label>:198:                                    ; preds = %198, %197
  %199 = phi i64 [ %194, %197 ], [ %214, %198 ]
  %200 = phi double [ %195, %197 ], [ %213, %198 ]
  %201 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %177, i64 %199
  %202 = load double, double* %201, align 8, !tbaa !1
  %203 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %199, i64 %182
  %204 = load double, double* %203, align 8, !tbaa !1
  %205 = fmul double %202, %204
  %206 = fsub double %200, %205
  %207 = add nuw nsw i64 %199, 1
  %208 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %177, i64 %207
  %209 = load double, double* %208, align 8, !tbaa !1
  %210 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %207, i64 %182
  %211 = load double, double* %210, align 8, !tbaa !1
  %212 = fmul double %209, %211
  %213 = fsub double %206, %212
  %214 = add nsw i64 %199, 2
  %215 = icmp eq i64 %214, %177
  br i1 %215, label %216, label %198

; <label>:216:                                    ; preds = %198
  br label %217

; <label>:217:                                    ; preds = %216, %196
  %218 = phi double [ %193, %196 ], [ %213, %216 ]
  store double %218, double* %183, align 8, !tbaa !1
  %219 = add nuw nsw i64 %182, 1
  %220 = icmp eq i64 %219, 2000
  br i1 %220, label %276, label %181

; <label>:221:                                    ; preds = %264, %179
  %222 = phi i64 [ %269, %264 ], [ 0, %179 ]
  %223 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %177, i64 %222
  %224 = load double, double* %223, align 8, !tbaa !1
  %225 = icmp sgt i64 %222, 0
  br i1 %225, label %226, label %264

; <label>:226:                                    ; preds = %221
  %227 = and i64 %222, 1
  %228 = icmp eq i64 %227, 0
  br i1 %228, label %236, label %229

; <label>:229:                                    ; preds = %226
  br label %230

; <label>:230:                                    ; preds = %229
  %231 = load double, double* %180, align 8, !tbaa !1
  %232 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 0, i64 %222
  %233 = load double, double* %232, align 8, !tbaa !1
  %234 = fmul double %231, %233
  %235 = fsub double %224, %234
  br label %236

; <label>:236:                                    ; preds = %230, %226
  %237 = phi double [ %235, %230 ], [ undef, %226 ]
  %238 = phi i64 [ 1, %230 ], [ 0, %226 ]
  %239 = phi double [ %235, %230 ], [ %224, %226 ]
  br label %240

; <label>:240:                                    ; preds = %236
  %241 = icmp eq i64 %222, 1
  br i1 %241, label %262, label %242

; <label>:242:                                    ; preds = %240
  br label %243

; <label>:243:                                    ; preds = %243, %242
  %244 = phi i64 [ %238, %242 ], [ %259, %243 ]
  %245 = phi double [ %239, %242 ], [ %258, %243 ]
  %246 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %177, i64 %244
  %247 = load double, double* %246, align 8, !tbaa !1
  %248 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %244, i64 %222
  %249 = load double, double* %248, align 8, !tbaa !1
  %250 = fmul double %247, %249
  %251 = fsub double %245, %250
  %252 = add nuw nsw i64 %244, 1
  %253 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %177, i64 %252
  %254 = load double, double* %253, align 8, !tbaa !1
  %255 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %252, i64 %222
  %256 = load double, double* %255, align 8, !tbaa !1
  %257 = fmul double %254, %256
  %258 = fsub double %251, %257
  %259 = add nsw i64 %244, 2
  %260 = icmp eq i64 %259, %222
  br i1 %260, label %261, label %243

; <label>:261:                                    ; preds = %243
  br label %262

; <label>:262:                                    ; preds = %261, %240
  %263 = phi double [ %237, %240 ], [ %258, %261 ]
  br label %264

; <label>:264:                                    ; preds = %262, %221
  %265 = phi double [ %224, %221 ], [ %263, %262 ]
  %266 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %222, i64 %222
  %267 = load double, double* %266, align 8, !tbaa !1
  %268 = fdiv double %265, %267
  store double %268, double* %223, align 8, !tbaa !1
  %269 = add nuw nsw i64 %222, 1
  %270 = icmp eq i64 %269, %177
  br i1 %270, label %271, label %221

; <label>:271:                                    ; preds = %264
  %272 = and i64 %177, 1
  %273 = icmp eq i64 %272, 0
  %274 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %177, i64 0
  %275 = icmp eq i64 %177, 1
  br label %181

; <label>:276:                                    ; preds = %217
  br label %277

; <label>:277:                                    ; preds = %276, %176
  %278 = add nuw nsw i64 %177, 1
  %279 = icmp eq i64 %278, 2000
  br i1 %279, label %280, label %176

; <label>:280:                                    ; preds = %277
  br label %281

; <label>:281:                                    ; preds = %346, %280
  %282 = phi i64 [ %349, %346 ], [ 0, %280 ]
  %283 = add i64 %282, -1
  %284 = getelementptr inbounds double, double* %7, i64 %282
  %285 = load double, double* %284, align 8, !tbaa !1
  %286 = icmp sgt i64 %282, 0
  br i1 %286, label %287, label %346

; <label>:287:                                    ; preds = %281
  %288 = and i64 %282, 3
  %289 = icmp eq i64 %288, 0
  br i1 %289, label %305, label %290

; <label>:290:                                    ; preds = %287
  br label %291

; <label>:291:                                    ; preds = %291, %290
  %292 = phi i64 [ %301, %291 ], [ 0, %290 ]
  %293 = phi double [ %300, %291 ], [ %285, %290 ]
  %294 = phi i64 [ %302, %291 ], [ %288, %290 ]
  %295 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %282, i64 %292
  %296 = load double, double* %295, align 8, !tbaa !1
  %297 = getelementptr inbounds double, double* %9, i64 %292
  %298 = load double, double* %297, align 8, !tbaa !1
  %299 = fmul double %296, %298
  %300 = fsub double %293, %299
  %301 = add nuw nsw i64 %292, 1
  %302 = add i64 %294, -1
  %303 = icmp eq i64 %302, 0
  br i1 %303, label %304, label %291, !llvm.loop !14

; <label>:304:                                    ; preds = %291
  br label %305

; <label>:305:                                    ; preds = %304, %287
  %306 = phi double [ undef, %287 ], [ %300, %304 ]
  %307 = phi i64 [ 0, %287 ], [ %301, %304 ]
  %308 = phi double [ %285, %287 ], [ %300, %304 ]
  %309 = icmp ult i64 %283, 3
  br i1 %309, label %344, label %310

; <label>:310:                                    ; preds = %305
  br label %311

; <label>:311:                                    ; preds = %311, %310
  %312 = phi i64 [ %307, %310 ], [ %341, %311 ]
  %313 = phi double [ %308, %310 ], [ %340, %311 ]
  %314 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %282, i64 %312
  %315 = load double, double* %314, align 8, !tbaa !1
  %316 = getelementptr inbounds double, double* %9, i64 %312
  %317 = load double, double* %316, align 8, !tbaa !1
  %318 = fmul double %315, %317
  %319 = fsub double %313, %318
  %320 = add nuw nsw i64 %312, 1
  %321 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %282, i64 %320
  %322 = load double, double* %321, align 8, !tbaa !1
  %323 = getelementptr inbounds double, double* %9, i64 %320
  %324 = load double, double* %323, align 8, !tbaa !1
  %325 = fmul double %322, %324
  %326 = fsub double %319, %325
  %327 = add nsw i64 %312, 2
  %328 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %282, i64 %327
  %329 = load double, double* %328, align 8, !tbaa !1
  %330 = getelementptr inbounds double, double* %9, i64 %327
  %331 = load double, double* %330, align 8, !tbaa !1
  %332 = fmul double %329, %331
  %333 = fsub double %326, %332
  %334 = add nsw i64 %312, 3
  %335 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %282, i64 %334
  %336 = load double, double* %335, align 8, !tbaa !1
  %337 = getelementptr inbounds double, double* %9, i64 %334
  %338 = load double, double* %337, align 8, !tbaa !1
  %339 = fmul double %336, %338
  %340 = fsub double %333, %339
  %341 = add nsw i64 %312, 4
  %342 = icmp eq i64 %341, %282
  br i1 %342, label %343, label %311

; <label>:343:                                    ; preds = %311
  br label %344

; <label>:344:                                    ; preds = %343, %305
  %345 = phi double [ %306, %305 ], [ %340, %343 ]
  br label %346

; <label>:346:                                    ; preds = %344, %281
  %347 = phi double [ %285, %281 ], [ %345, %344 ]
  %348 = getelementptr inbounds double, double* %9, i64 %282
  store double %347, double* %348, align 8, !tbaa !1
  %349 = add nuw nsw i64 %282, 1
  %350 = icmp eq i64 %349, 2000
  br i1 %350, label %351, label %281

; <label>:351:                                    ; preds = %346
  br label %352

; <label>:352:                                    ; preds = %420, %351
  %353 = phi i64 [ 0, %351 ], [ %429, %420 ]
  %354 = phi i64 [ 1999, %351 ], [ %426, %420 ]
  %355 = phi i64 [ 2000, %351 ], [ %428, %420 ]
  %356 = add i64 %353, -1
  %357 = getelementptr inbounds double, double* %9, i64 %354
  %358 = load double, double* %357, align 8, !tbaa !1
  %359 = add nuw nsw i64 %354, 1
  %360 = icmp slt i64 %359, 2000
  br i1 %360, label %361, label %420

; <label>:361:                                    ; preds = %352
  %362 = and i64 %353, 3
  %363 = icmp eq i64 %362, 0
  br i1 %363, label %379, label %364

; <label>:364:                                    ; preds = %361
  br label %365

; <label>:365:                                    ; preds = %365, %364
  %366 = phi i64 [ %375, %365 ], [ %355, %364 ]
  %367 = phi double [ %374, %365 ], [ %358, %364 ]
  %368 = phi i64 [ %376, %365 ], [ %362, %364 ]
  %369 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %354, i64 %366
  %370 = load double, double* %369, align 8, !tbaa !1
  %371 = getelementptr inbounds double, double* %8, i64 %366
  %372 = load double, double* %371, align 8, !tbaa !1
  %373 = fmul double %370, %372
  %374 = fsub double %367, %373
  %375 = add nuw nsw i64 %366, 1
  %376 = add i64 %368, -1
  %377 = icmp eq i64 %376, 0
  br i1 %377, label %378, label %365, !llvm.loop !16

; <label>:378:                                    ; preds = %365
  br label %379

; <label>:379:                                    ; preds = %378, %361
  %380 = phi double [ undef, %361 ], [ %374, %378 ]
  %381 = phi i64 [ %355, %361 ], [ %375, %378 ]
  %382 = phi double [ %358, %361 ], [ %374, %378 ]
  %383 = icmp ult i64 %356, 3
  br i1 %383, label %418, label %384

; <label>:384:                                    ; preds = %379
  br label %385

; <label>:385:                                    ; preds = %385, %384
  %386 = phi i64 [ %381, %384 ], [ %415, %385 ]
  %387 = phi double [ %382, %384 ], [ %414, %385 ]
  %388 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %354, i64 %386
  %389 = load double, double* %388, align 8, !tbaa !1
  %390 = getelementptr inbounds double, double* %8, i64 %386
  %391 = load double, double* %390, align 8, !tbaa !1
  %392 = fmul double %389, %391
  %393 = fsub double %387, %392
  %394 = add nuw nsw i64 %386, 1
  %395 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %354, i64 %394
  %396 = load double, double* %395, align 8, !tbaa !1
  %397 = getelementptr inbounds double, double* %8, i64 %394
  %398 = load double, double* %397, align 8, !tbaa !1
  %399 = fmul double %396, %398
  %400 = fsub double %393, %399
  %401 = add nsw i64 %386, 2
  %402 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %354, i64 %401
  %403 = load double, double* %402, align 8, !tbaa !1
  %404 = getelementptr inbounds double, double* %8, i64 %401
  %405 = load double, double* %404, align 8, !tbaa !1
  %406 = fmul double %403, %405
  %407 = fsub double %400, %406
  %408 = add nsw i64 %386, 3
  %409 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %354, i64 %408
  %410 = load double, double* %409, align 8, !tbaa !1
  %411 = getelementptr inbounds double, double* %8, i64 %408
  %412 = load double, double* %411, align 8, !tbaa !1
  %413 = fmul double %410, %412
  %414 = fsub double %407, %413
  %415 = add nsw i64 %386, 4
  %416 = icmp eq i64 %415, 2000
  br i1 %416, label %417, label %385

; <label>:417:                                    ; preds = %385
  br label %418

; <label>:418:                                    ; preds = %417, %379
  %419 = phi double [ %380, %379 ], [ %414, %417 ]
  br label %420

; <label>:420:                                    ; preds = %418, %352
  %421 = phi double [ %358, %352 ], [ %419, %418 ]
  %422 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %354, i64 %354
  %423 = load double, double* %422, align 8, !tbaa !1
  %424 = fdiv double %421, %423
  %425 = getelementptr inbounds double, double* %8, i64 %354
  store double %424, double* %425, align 8, !tbaa !1
  %426 = add nsw i64 %354, -1
  %427 = icmp sgt i64 %354, 0
  %428 = add nsw i64 %355, -1
  %429 = add i64 %353, 1
  br i1 %427, label %352, label %430

; <label>:430:                                    ; preds = %420
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %431 = icmp sgt i32 %0, 42
  br i1 %431, label %432, label %461

; <label>:432:                                    ; preds = %430
  %433 = load i8*, i8** %1, align 8, !tbaa !17
  %434 = load i8, i8* %433, align 1, !tbaa !19
  %435 = icmp eq i8 %434, 0
  br i1 %435, label %436, label %461

; <label>:436:                                    ; preds = %432
  %437 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %438 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %437) #5
  %439 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %440 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %439, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %441

; <label>:441:                                    ; preds = %449, %436
  %442 = phi i64 [ 0, %436 ], [ %454, %449 ]
  %443 = trunc i64 %442 to i32
  %444 = srem i32 %443, 20
  %445 = icmp eq i32 %444, 0
  br i1 %445, label %446, label %449

; <label>:446:                                    ; preds = %441
  %447 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %448 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %447) #5
  br label %449

; <label>:449:                                    ; preds = %446, %441
  %450 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %451 = getelementptr inbounds double, double* %8, i64 %442
  %452 = load double, double* %451, align 8, !tbaa !1
  %453 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %450, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %452) #5
  %454 = add nuw nsw i64 %442, 1
  %455 = icmp eq i64 %454, 2000
  br i1 %455, label %456, label %441

; <label>:456:                                    ; preds = %449
  %457 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %458 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %457, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %459 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !17
  %460 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %459) #5
  br label %461

; <label>:461:                                    ; preds = %456, %432, %430
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
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.vectorize.width", i32 1}
!12 = !{!"llvm.loop.interleave.count", i32 1}
!13 = distinct !{!13, !11, !12}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !15}
!17 = !{!18, !18, i64 0}
!18 = !{!"any pointer", !3, i64 0}
!19 = !{!3, !3, i64 0}
