; ModuleID = 'A.ll'
source_filename = "symm.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  br label %8

; <label>:8:                                      ; preds = %27, %2
  %9 = phi i64 [ 0, %2 ], [ %28, %27 ]
  %10 = add nuw nsw i64 %9, 1200
  br label %11

; <label>:11:                                     ; preds = %11, %8
  %12 = phi i64 [ 0, %8 ], [ %25, %11 ]
  %13 = add nuw nsw i64 %12, %9
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 100
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.000000e+03
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %9, i64 %12
  store double %17, double* %18, align 8, !tbaa !1
  %19 = sub nuw nsw i64 %10, %12
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 100
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 1.000000e+03
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %9, i64 %12
  store double %23, double* %24, align 8, !tbaa !1
  %25 = add nuw nsw i64 %12, 1
  %26 = icmp eq i64 %25, 1200
  br i1 %26, label %27, label %11

; <label>:27:                                     ; preds = %11
  %28 = add nuw nsw i64 %9, 1
  %29 = icmp eq i64 %28, 1000
  br i1 %29, label %30, label %8

; <label>:30:                                     ; preds = %27
  %31 = bitcast i8* %4 to [1000 x double]*
  br label %36

; <label>:32:                                     ; preds = %137
  br label %33

; <label>:33:                                     ; preds = %133, %76, %32
  %34 = add nuw nsw i64 %38, 1
  %35 = icmp eq i64 %77, 1000
  br i1 %35, label %142, label %36

; <label>:36:                                     ; preds = %33, %30
  %37 = phi i64 [ %77, %33 ], [ 0, %30 ]
  %38 = phi i64 [ %34, %33 ], [ 1, %30 ]
  %39 = sub i64 999, %37
  %40 = add i64 %39, -4
  %41 = lshr i64 %40, 2
  %42 = add nuw nsw i64 %41, 1
  %43 = sub i64 999, %37
  %44 = and i64 %37, 1
  %45 = icmp eq i64 %44, 0
  br i1 %45, label %46, label %53

; <label>:46:                                     ; preds = %36
  br label %47

; <label>:47:                                     ; preds = %46
  %48 = trunc i64 %37 to i32
  %49 = srem i32 %48, 100
  %50 = sitofp i32 %49 to double
  %51 = fdiv double %50, 1.000000e+03
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %31, i64 %37, i64 0
  store double %51, double* %52, align 8, !tbaa !1
  br label %53

; <label>:53:                                     ; preds = %47, %36
  %54 = phi i64 [ 1, %47 ], [ 0, %36 ]
  br label %55

; <label>:55:                                     ; preds = %53
  %56 = icmp eq i64 %37, 0
  br i1 %56, label %76, label %57

; <label>:57:                                     ; preds = %55
  br label %58

; <label>:58:                                     ; preds = %58, %57
  %59 = phi i64 [ %54, %57 ], [ %73, %58 ]
  %60 = add nuw nsw i64 %59, %37
  %61 = trunc i64 %60 to i32
  %62 = srem i32 %61, 100
  %63 = sitofp i32 %62 to double
  %64 = fdiv double %63, 1.000000e+03
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %31, i64 %37, i64 %59
  store double %64, double* %65, align 8, !tbaa !1
  %66 = add nuw nsw i64 %59, 1
  %67 = add nuw nsw i64 %66, %37
  %68 = trunc i64 %67 to i32
  %69 = srem i32 %68, 100
  %70 = sitofp i32 %69 to double
  %71 = fdiv double %70, 1.000000e+03
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %31, i64 %37, i64 %66
  store double %71, double* %72, align 8, !tbaa !1
  %73 = add nsw i64 %59, 2
  %74 = icmp eq i64 %73, %38
  br i1 %74, label %75, label %58

; <label>:75:                                     ; preds = %58
  br label %76

; <label>:76:                                     ; preds = %75, %55
  %77 = add nuw nsw i64 %37, 1
  %78 = icmp slt i64 %77, 1000
  br i1 %78, label %79, label %33

; <label>:79:                                     ; preds = %76
  %80 = icmp ult i64 %43, 4
  br i1 %80, label %135, label %81

; <label>:81:                                     ; preds = %79
  %82 = and i64 %43, -4
  %83 = icmp eq i64 %82, 0
  %84 = add i64 %38, %82
  br i1 %83, label %135, label %85

; <label>:85:                                     ; preds = %81
  %86 = and i64 %42, 3
  %87 = icmp eq i64 %86, 0
  br i1 %87, label %101, label %88

; <label>:88:                                     ; preds = %85
  br label %89

; <label>:89:                                     ; preds = %89, %88
  %90 = phi i64 [ %97, %89 ], [ 0, %88 ]
  %91 = phi i64 [ %98, %89 ], [ %86, %88 ]
  %92 = add i64 %38, %90
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %31, i64 %37, i64 %92
  %94 = bitcast double* %93 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %94, align 8, !tbaa !1
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %96, align 8, !tbaa !1
  %97 = add i64 %90, 4
  %98 = add i64 %91, -1
  %99 = icmp eq i64 %98, 0
  br i1 %99, label %100, label %89, !llvm.loop !5

; <label>:100:                                    ; preds = %89
  br label %101

; <label>:101:                                    ; preds = %100, %85
  %102 = phi i64 [ 0, %85 ], [ %97, %100 ]
  %103 = icmp ult i64 %40, 12
  br i1 %103, label %133, label %104

; <label>:104:                                    ; preds = %101
  br label %105

; <label>:105:                                    ; preds = %105, %104
  %106 = phi i64 [ %102, %104 ], [ %130, %105 ]
  %107 = add i64 %38, %106
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %31, i64 %37, i64 %107
  %109 = bitcast double* %108 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %109, align 8, !tbaa !1
  %110 = getelementptr double, double* %108, i64 2
  %111 = bitcast double* %110 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %111, align 8, !tbaa !1
  %112 = add i64 %106, 4
  %113 = add i64 %38, %112
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %31, i64 %37, i64 %113
  %115 = bitcast double* %114 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %115, align 8, !tbaa !1
  %116 = getelementptr double, double* %114, i64 2
  %117 = bitcast double* %116 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %117, align 8, !tbaa !1
  %118 = add i64 %106, 8
  %119 = add i64 %38, %118
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %31, i64 %37, i64 %119
  %121 = bitcast double* %120 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %121, align 8, !tbaa !1
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %123, align 8, !tbaa !1
  %124 = add i64 %106, 12
  %125 = add i64 %38, %124
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %31, i64 %37, i64 %125
  %127 = bitcast double* %126 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %127, align 8, !tbaa !1
  %128 = getelementptr double, double* %126, i64 2
  %129 = bitcast double* %128 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %129, align 8, !tbaa !1
  %130 = add i64 %106, 16
  %131 = icmp eq i64 %130, %82
  br i1 %131, label %132, label %105, !llvm.loop !7

; <label>:132:                                    ; preds = %105
  br label %133

; <label>:133:                                    ; preds = %132, %101
  %134 = icmp eq i64 %43, %82
  br i1 %134, label %33, label %135

; <label>:135:                                    ; preds = %133, %81, %79
  %136 = phi i64 [ %38, %81 ], [ %38, %79 ], [ %84, %133 ]
  br label %137

; <label>:137:                                    ; preds = %137, %135
  %138 = phi i64 [ %140, %137 ], [ %136, %135 ]
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %31, i64 %37, i64 %138
  store double -9.990000e+02, double* %139, align 8, !tbaa !1
  %140 = add nuw nsw i64 %138, 1
  %141 = icmp eq i64 %140, 1000
  br i1 %141, label %32, label %137, !llvm.loop !10

; <label>:142:                                    ; preds = %33
  tail call void (...) @polybench_timer_start() #3
  br label %143

; <label>:143:                                    ; preds = %262, %142
  %144 = phi i64 [ 0, %142 ], [ %263, %262 ]
  %145 = mul i64 %144, 9600
  %146 = getelementptr i8, i8* %3, i64 %145
  %147 = add i64 %145, 9600
  %148 = getelementptr i8, i8* %3, i64 %147
  %149 = icmp sgt i64 %144, 0
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %31, i64 %144, i64 %144
  br i1 %149, label %151, label %152

; <label>:151:                                    ; preds = %143
  br label %199

; <label>:152:                                    ; preds = %143
  %153 = getelementptr i8, i8* %5, i64 %147
  %154 = getelementptr i8, i8* %5, i64 %145
  %155 = icmp ult i8* %146, %153
  %156 = icmp ult i8* %154, %148
  %157 = and i1 %155, %156
  %158 = bitcast double* %150 to i8*
  %159 = bitcast double* %150 to i8*
  %160 = icmp ult i8* %146, %159
  %161 = icmp ult i8* %158, %148
  %162 = and i1 %160, %161
  %163 = or i1 %157, %162
  br i1 %163, label %170, label %164

; <label>:164:                                    ; preds = %152
  %165 = load double, double* %150, align 8, !tbaa !1, !alias.scope !12
  %166 = insertelement <2 x double> undef, double %165, i32 0
  %167 = insertelement <2 x double> %166, double %165, i32 1
  %168 = insertelement <2 x double> undef, double %165, i32 0
  %169 = insertelement <2 x double> %168, double %165, i32 1
  br label %171

; <label>:170:                                    ; preds = %152
  br label %234

; <label>:171:                                    ; preds = %171, %164
  %172 = phi i64 [ %197, %171 ], [ 0, %164 ]
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %144, i64 %172
  %174 = bitcast double* %173 to <2 x double>*
  %175 = load <2 x double>, <2 x double>* %174, align 8, !tbaa !1, !alias.scope !15
  %176 = getelementptr double, double* %173, i64 2
  %177 = bitcast double* %176 to <2 x double>*
  %178 = load <2 x double>, <2 x double>* %177, align 8, !tbaa !1, !alias.scope !15
  %179 = fmul <2 x double> %175, <double 1.500000e+00, double 1.500000e+00>
  %180 = fmul <2 x double> %178, <double 1.500000e+00, double 1.500000e+00>
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %144, i64 %172
  %182 = bitcast double* %181 to <2 x double>*
  %183 = load <2 x double>, <2 x double>* %182, align 8, !tbaa !1, !alias.scope !17, !noalias !19
  %184 = getelementptr double, double* %181, i64 2
  %185 = bitcast double* %184 to <2 x double>*
  %186 = load <2 x double>, <2 x double>* %185, align 8, !tbaa !1, !alias.scope !17, !noalias !19
  %187 = fmul <2 x double> %183, <double 1.200000e+00, double 1.200000e+00>
  %188 = fmul <2 x double> %186, <double 1.200000e+00, double 1.200000e+00>
  %189 = fmul <2 x double> %179, %167
  %190 = fmul <2 x double> %180, %169
  %191 = fadd <2 x double> %187, %189
  %192 = fadd <2 x double> %188, %190
  %193 = fadd <2 x double> %191, zeroinitializer
  %194 = fadd <2 x double> %192, zeroinitializer
  %195 = bitcast double* %181 to <2 x double>*
  store <2 x double> %193, <2 x double>* %195, align 8, !tbaa !1, !alias.scope !17, !noalias !19
  %196 = bitcast double* %184 to <2 x double>*
  store <2 x double> %194, <2 x double>* %196, align 8, !tbaa !1, !alias.scope !17, !noalias !19
  %197 = add i64 %172, 4
  %198 = icmp eq i64 %197, 1200
  br i1 %198, label %261, label %171, !llvm.loop !20

; <label>:199:                                    ; preds = %223, %151
  %200 = phi i64 [ %232, %223 ], [ 0, %151 ]
  %201 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %144, i64 %200
  %202 = load double, double* %201, align 8, !tbaa !1
  %203 = fmul double %202, 1.500000e+00
  br label %204

; <label>:204:                                    ; preds = %204, %199
  %205 = phi i64 [ 0, %199 ], [ %219, %204 ]
  %206 = phi double [ %203, %199 ], [ %221, %204 ]
  %207 = phi double [ 0.000000e+00, %199 ], [ %218, %204 ]
  %208 = getelementptr inbounds [1000 x double], [1000 x double]* %31, i64 %144, i64 %205
  %209 = load double, double* %208, align 8, !tbaa !1
  %210 = fmul double %206, %209
  %211 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %205, i64 %200
  %212 = load double, double* %211, align 8, !tbaa !1
  %213 = fadd double %212, %210
  store double %213, double* %211, align 8, !tbaa !1
  %214 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %205, i64 %200
  %215 = load double, double* %214, align 8, !tbaa !1
  %216 = load double, double* %208, align 8, !tbaa !1
  %217 = fmul double %215, %216
  %218 = fadd double %207, %217
  %219 = add nuw nsw i64 %205, 1
  %220 = load double, double* %201, align 8, !tbaa !1
  %221 = fmul double %220, 1.500000e+00
  %222 = icmp eq i64 %219, %144
  br i1 %222, label %223, label %204

; <label>:223:                                    ; preds = %204
  %224 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %144, i64 %200
  %225 = load double, double* %224, align 8, !tbaa !1
  %226 = fmul double %225, 1.200000e+00
  %227 = load double, double* %150, align 8, !tbaa !1
  %228 = fmul double %221, %227
  %229 = fadd double %226, %228
  %230 = fmul double %218, 1.500000e+00
  %231 = fadd double %230, %229
  store double %231, double* %224, align 8, !tbaa !1
  %232 = add nuw nsw i64 %200, 1
  %233 = icmp eq i64 %232, 1200
  br i1 %233, label %259, label %199

; <label>:234:                                    ; preds = %234, %170
  %235 = phi i64 [ 0, %170 ], [ %257, %234 ]
  %236 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %144, i64 %235
  %237 = load double, double* %236, align 8, !tbaa !1
  %238 = fmul double %237, 1.500000e+00
  %239 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %144, i64 %235
  %240 = load double, double* %239, align 8, !tbaa !1
  %241 = fmul double %240, 1.200000e+00
  %242 = load double, double* %150, align 8, !tbaa !1
  %243 = fmul double %238, %242
  %244 = fadd double %241, %243
  %245 = fadd double %244, 0.000000e+00
  store double %245, double* %239, align 8, !tbaa !1
  %246 = or i64 %235, 1
  %247 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %144, i64 %246
  %248 = load double, double* %247, align 8, !tbaa !1
  %249 = fmul double %248, 1.500000e+00
  %250 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %144, i64 %246
  %251 = load double, double* %250, align 8, !tbaa !1
  %252 = fmul double %251, 1.200000e+00
  %253 = load double, double* %150, align 8, !tbaa !1
  %254 = fmul double %249, %253
  %255 = fadd double %252, %254
  %256 = fadd double %255, 0.000000e+00
  store double %256, double* %250, align 8, !tbaa !1
  %257 = add nsw i64 %235, 2
  %258 = icmp eq i64 %257, 1200
  br i1 %258, label %260, label %234, !llvm.loop !21

; <label>:259:                                    ; preds = %223
  br label %262

; <label>:260:                                    ; preds = %234
  br label %262

; <label>:261:                                    ; preds = %171
  br label %262

; <label>:262:                                    ; preds = %261, %260, %259
  %263 = add nuw nsw i64 %144, 1
  %264 = icmp eq i64 %263, 1000
  br i1 %264, label %265, label %143

; <label>:265:                                    ; preds = %262
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %266 = icmp sgt i32 %0, 42
  br i1 %266, label %267, label %303

; <label>:267:                                    ; preds = %265
  %268 = load i8*, i8** %1, align 8, !tbaa !22
  %269 = load i8, i8* %268, align 1, !tbaa !24
  %270 = icmp eq i8 %269, 0
  br i1 %270, label %271, label %303

; <label>:271:                                    ; preds = %267
  %272 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !22
  %273 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %272) #4
  %274 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !22
  %275 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %274, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %276

; <label>:276:                                    ; preds = %295, %271
  %277 = phi i64 [ 0, %271 ], [ %296, %295 ]
  %278 = mul nuw nsw i64 %277, 1000
  br label %279

; <label>:279:                                    ; preds = %288, %276
  %280 = phi i64 [ 0, %276 ], [ %293, %288 ]
  %281 = add nuw nsw i64 %280, %278
  %282 = trunc i64 %281 to i32
  %283 = srem i32 %282, 20
  %284 = icmp eq i32 %283, 0
  br i1 %284, label %285, label %288

; <label>:285:                                    ; preds = %279
  %286 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !22
  %287 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %286) #4
  br label %288

; <label>:288:                                    ; preds = %285, %279
  %289 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !22
  %290 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %277, i64 %280
  %291 = load double, double* %290, align 8, !tbaa !1
  %292 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %289, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %291) #4
  %293 = add nuw nsw i64 %280, 1
  %294 = icmp eq i64 %293, 1200
  br i1 %294, label %295, label %279

; <label>:295:                                    ; preds = %288
  %296 = add nuw nsw i64 %277, 1
  %297 = icmp eq i64 %296, 1000
  br i1 %297, label %298, label %276

; <label>:298:                                    ; preds = %295
  %299 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !22
  %300 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %299, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %301 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !22
  %302 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %301) #4
  br label %303

; <label>:303:                                    ; preds = %298, %267, %265
  tail call void @free(i8* nonnull %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.vectorize.width", i32 1}
!9 = !{!"llvm.loop.interleave.count", i32 1}
!10 = distinct !{!10, !11, !8, !9}
!11 = !{!"llvm.loop.unroll.runtime.disable"}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = !{!18}
!18 = distinct !{!18, !14}
!19 = !{!16, !13}
!20 = distinct !{!20, !8, !9}
!21 = distinct !{!21, !8, !9}
!22 = !{!23, !23, i64 0}
!23 = !{!"any pointer", !3, i64 0}
!24 = !{!3, !3, i64 0}
