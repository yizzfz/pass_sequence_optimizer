; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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

; <label>:148:                                    ; preds = %258, %147
  %149 = phi i64 [ 0, %147 ], [ %262, %258 ]
  %150 = add i64 %149, -1
  %151 = icmp sgt i64 %149, 0
  br i1 %151, label %152, label %154

; <label>:152:                                    ; preds = %148
  %153 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 0
  br label %181

; <label>:154:                                    ; preds = %148
  %155 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 %149
  %156 = load double, double* %155, align 8, !tbaa !1
  br label %258

; <label>:157:                                    ; preds = %224
  %158 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 %149
  %159 = load double, double* %158, align 8, !tbaa !1
  %160 = and i64 %149, 3
  %161 = icmp eq i64 %160, 0
  br i1 %161, label %175, label %162

; <label>:162:                                    ; preds = %157
  br label %163

; <label>:163:                                    ; preds = %163, %162
  %164 = phi i64 [ %171, %163 ], [ 0, %162 ]
  %165 = phi double [ %170, %163 ], [ %159, %162 ]
  %166 = phi i64 [ %172, %163 ], [ %160, %162 ]
  %167 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 %164
  %168 = load double, double* %167, align 8, !tbaa !1
  %169 = fmul double %168, %168
  %170 = fsub double %165, %169
  store double %170, double* %158, align 8, !tbaa !1
  %171 = add nuw nsw i64 %164, 1
  %172 = add i64 %166, -1
  %173 = icmp eq i64 %172, 0
  br i1 %173, label %174, label %163, !llvm.loop !14

; <label>:174:                                    ; preds = %163
  br label %175

; <label>:175:                                    ; preds = %174, %157
  %176 = phi double [ undef, %157 ], [ %170, %174 ]
  %177 = phi i64 [ 0, %157 ], [ %171, %174 ]
  %178 = phi double [ %159, %157 ], [ %170, %174 ]
  %179 = icmp ult i64 %150, 3
  br i1 %179, label %256, label %180

; <label>:180:                                    ; preds = %175
  br label %231

; <label>:181:                                    ; preds = %224, %152
  %182 = phi i64 [ %229, %224 ], [ 0, %152 ]
  %183 = icmp sgt i64 %182, 0
  %184 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 %182
  %185 = load double, double* %184, align 8, !tbaa !1
  br i1 %183, label %186, label %224

; <label>:186:                                    ; preds = %181
  %187 = and i64 %182, 1
  %188 = icmp eq i64 %187, 0
  br i1 %188, label %196, label %189

; <label>:189:                                    ; preds = %186
  br label %190

; <label>:190:                                    ; preds = %189
  %191 = load double, double* %153, align 8, !tbaa !1
  %192 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %182, i64 0
  %193 = load double, double* %192, align 8, !tbaa !1
  %194 = fmul double %191, %193
  %195 = fsub double %185, %194
  store double %195, double* %184, align 8, !tbaa !1
  br label %196

; <label>:196:                                    ; preds = %190, %186
  %197 = phi double [ %195, %190 ], [ undef, %186 ]
  %198 = phi i64 [ 1, %190 ], [ 0, %186 ]
  %199 = phi double [ %195, %190 ], [ %185, %186 ]
  br label %200

; <label>:200:                                    ; preds = %196
  %201 = icmp eq i64 %182, 1
  br i1 %201, label %222, label %202

; <label>:202:                                    ; preds = %200
  br label %203

; <label>:203:                                    ; preds = %203, %202
  %204 = phi i64 [ %198, %202 ], [ %219, %203 ]
  %205 = phi double [ %199, %202 ], [ %218, %203 ]
  %206 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 %204
  %207 = load double, double* %206, align 8, !tbaa !1
  %208 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %182, i64 %204
  %209 = load double, double* %208, align 8, !tbaa !1
  %210 = fmul double %207, %209
  %211 = fsub double %205, %210
  store double %211, double* %184, align 8, !tbaa !1
  %212 = add nuw nsw i64 %204, 1
  %213 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 %212
  %214 = load double, double* %213, align 8, !tbaa !1
  %215 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %182, i64 %212
  %216 = load double, double* %215, align 8, !tbaa !1
  %217 = fmul double %214, %216
  %218 = fsub double %211, %217
  store double %218, double* %184, align 8, !tbaa !1
  %219 = add nsw i64 %204, 2
  %220 = icmp eq i64 %219, %182
  br i1 %220, label %221, label %203

; <label>:221:                                    ; preds = %203
  br label %222

; <label>:222:                                    ; preds = %221, %200
  %223 = phi double [ %197, %200 ], [ %218, %221 ]
  br label %224

; <label>:224:                                    ; preds = %222, %181
  %225 = phi double [ %185, %181 ], [ %223, %222 ]
  %226 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %182, i64 %182
  %227 = load double, double* %226, align 8, !tbaa !1
  %228 = fdiv double %225, %227
  store double %228, double* %184, align 8, !tbaa !1
  %229 = add nuw nsw i64 %182, 1
  %230 = icmp eq i64 %229, %149
  br i1 %230, label %157, label %181

; <label>:231:                                    ; preds = %231, %180
  %232 = phi i64 [ %177, %180 ], [ %253, %231 ]
  %233 = phi double [ %178, %180 ], [ %252, %231 ]
  %234 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 %232
  %235 = load double, double* %234, align 8, !tbaa !1
  %236 = fmul double %235, %235
  %237 = fsub double %233, %236
  store double %237, double* %158, align 8, !tbaa !1
  %238 = add nuw nsw i64 %232, 1
  %239 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 %238
  %240 = load double, double* %239, align 8, !tbaa !1
  %241 = fmul double %240, %240
  %242 = fsub double %237, %241
  store double %242, double* %158, align 8, !tbaa !1
  %243 = add nsw i64 %232, 2
  %244 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 %243
  %245 = load double, double* %244, align 8, !tbaa !1
  %246 = fmul double %245, %245
  %247 = fsub double %242, %246
  store double %247, double* %158, align 8, !tbaa !1
  %248 = add nsw i64 %232, 3
  %249 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %149, i64 %248
  %250 = load double, double* %249, align 8, !tbaa !1
  %251 = fmul double %250, %250
  %252 = fsub double %247, %251
  store double %252, double* %158, align 8, !tbaa !1
  %253 = add nsw i64 %232, 4
  %254 = icmp eq i64 %253, %149
  br i1 %254, label %255, label %231

; <label>:255:                                    ; preds = %231
  br label %256

; <label>:256:                                    ; preds = %255, %175
  %257 = phi double [ %176, %175 ], [ %252, %255 ]
  br label %258

; <label>:258:                                    ; preds = %256, %154
  %259 = phi double* [ %155, %154 ], [ %158, %256 ]
  %260 = phi double [ %156, %154 ], [ %257, %256 ]
  %261 = tail call double @sqrt(double %260) #3
  store double %261, double* %259, align 8, !tbaa !1
  %262 = add nuw nsw i64 %149, 1
  %263 = icmp eq i64 %262, 2000
  br i1 %263, label %264, label %148

; <label>:264:                                    ; preds = %258
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %265 = icmp sgt i32 %0, 42
  br i1 %265, label %266, label %304

; <label>:266:                                    ; preds = %264
  %267 = load i8*, i8** %1, align 8, !tbaa !16
  %268 = load i8, i8* %267, align 1, !tbaa !18
  %269 = icmp eq i8 %268, 0
  br i1 %269, label %270, label %304

; <label>:270:                                    ; preds = %266
  %271 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !16
  %272 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %271) #5
  %273 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !16
  %274 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %273, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %275

; <label>:275:                                    ; preds = %295, %270
  %276 = phi i64 [ 0, %270 ], [ %296, %295 ]
  %277 = phi i64 [ 1, %270 ], [ %297, %295 ]
  %278 = mul nuw nsw i64 %276, 2000
  br label %279

; <label>:279:                                    ; preds = %288, %275
  %280 = phi i64 [ %293, %288 ], [ 0, %275 ]
  %281 = add nuw nsw i64 %280, %278
  %282 = trunc i64 %281 to i32
  %283 = srem i32 %282, 20
  %284 = icmp eq i32 %283, 0
  br i1 %284, label %285, label %288

; <label>:285:                                    ; preds = %279
  %286 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !16
  %287 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %286) #5
  br label %288

; <label>:288:                                    ; preds = %285, %279
  %289 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !16
  %290 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %276, i64 %280
  %291 = load double, double* %290, align 8, !tbaa !1
  %292 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %289, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %291) #5
  %293 = add nuw nsw i64 %280, 1
  %294 = icmp eq i64 %293, %277
  br i1 %294, label %295, label %279

; <label>:295:                                    ; preds = %288
  %296 = add nuw nsw i64 %276, 1
  %297 = add nuw nsw i64 %277, 1
  %298 = icmp eq i64 %296, 2000
  br i1 %298, label %299, label %275

; <label>:299:                                    ; preds = %295
  %300 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !16
  %301 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %300, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %302 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !16
  %303 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %302) #5
  br label %304

; <label>:304:                                    ; preds = %299, %266, %264
  tail call void @free(i8* nonnull %3) #3
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
!16 = !{!17, !17, i64 0}
!17 = !{!"any pointer", !3, i64 0}
!18 = !{!3, !3, i64 0}
