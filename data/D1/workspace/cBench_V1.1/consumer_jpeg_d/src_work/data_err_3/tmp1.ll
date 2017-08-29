; ModuleID = 'jidctflt.ll'
source_filename = "jidctflt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_decompress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_source_mgr*, i32, i32, i32, i32, i32, i32, i32, double, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8**, i32, i32, i32, i32, i32, [64 x i32]*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], i32, %struct.jpeg_component_info*, i32, i32, [16 x i8], [16 x i8], [16 x i8], i32, i32, i8, i16, i16, i32, i8, i32, i32, i32, i32, i32, i8*, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, i32, %struct.jpeg_decomp_master*, %struct.jpeg_d_main_controller*, %struct.jpeg_d_coef_controller*, %struct.jpeg_d_post_controller*, %struct.jpeg_input_controller*, %struct.jpeg_marker_reader*, %struct.jpeg_entropy_decoder*, %struct.jpeg_inverse_dct*, %struct.jpeg_upsampler*, %struct.jpeg_color_deconverter*, %struct.jpeg_color_quantizer* }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.jpeg_source_mgr = type { i8*, i64, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*)* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_decomp_master = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32 }
%struct.jpeg_d_main_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* }
%struct.jpeg_d_coef_controller = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, i8***)*, %struct.jvirt_barray_control** }
%struct.jpeg_d_post_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* }
%struct.jpeg_input_controller = type { i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32, i32 }
%struct.jpeg_marker_reader = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, [16 x i32 (%struct.jpeg_decompress_struct*)*], i32, i32, i32, i32 }
%struct.jpeg_entropy_decoder = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* }
%struct.jpeg_inverse_dct = type { void (%struct.jpeg_decompress_struct*)*, [10 x {}*] }
%struct.jpeg_upsampler = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, i32 }
%struct.jpeg_color_deconverter = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* }
%struct.jpeg_color_quantizer = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)* }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }

; Function Attrs: noinline nounwind uwtable
define void @jpeg_idct_float(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32) #0 {
  %6 = alloca %struct.jpeg_decompress_struct*, align 8
  %7 = alloca %struct.jpeg_component_info*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i8**, align 8
  %10 = alloca i32, align 4
  %11 = alloca float, align 4
  %12 = alloca float, align 4
  %13 = alloca float, align 4
  %14 = alloca float, align 4
  %15 = alloca float, align 4
  %16 = alloca float, align 4
  %17 = alloca float, align 4
  %18 = alloca float, align 4
  %19 = alloca float, align 4
  %20 = alloca float, align 4
  %21 = alloca float, align 4
  %22 = alloca float, align 4
  %23 = alloca float, align 4
  %24 = alloca float, align 4
  %25 = alloca float, align 4
  %26 = alloca float, align 4
  %27 = alloca float, align 4
  %28 = alloca i16*, align 8
  %29 = alloca float*, align 8
  %30 = alloca float*, align 8
  %31 = alloca i8*, align 8
  %32 = alloca i8*, align 8
  %33 = alloca i32, align 4
  %34 = alloca [64 x float], align 16
  %35 = alloca float, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %6, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %7, align 8
  store i16* %2, i16** %8, align 8
  store i8** %3, i8*** %9, align 8
  store i32 %4, i32* %10, align 4
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 61
  %38 = load i8*, i8** %37, align 8
  %39 = getelementptr inbounds i8, i8* %38, i64 128
  store i8* %39, i8** %32, align 8
  %40 = load i16*, i16** %8, align 8
  store i16* %40, i16** %28, align 8
  %41 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %42 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %41, i32 0, i32 20
  %43 = load i8*, i8** %42, align 8
  %44 = bitcast i8* %43 to float*
  store float* %44, float** %29, align 8
  %45 = getelementptr inbounds [64 x float], [64 x float]* %34, i32 0, i32 0
  store float* %45, float** %30, align 8
  store i32 8, i32* %33, align 4
  br label %46

; <label>:46:                                     ; preds = %302, %5
  %47 = load i32, i32* %33, align 4
  %48 = icmp sgt i32 %47, 0
  br i1 %48, label %49, label %305

; <label>:49:                                     ; preds = %46
  %50 = load i16*, i16** %28, align 8
  %51 = getelementptr inbounds i16, i16* %50, i64 8
  %52 = load i16, i16* %51, align 2
  %53 = sext i16 %52 to i32
  %54 = load i16*, i16** %28, align 8
  %55 = getelementptr inbounds i16, i16* %54, i64 16
  %56 = load i16, i16* %55, align 2
  %57 = sext i16 %56 to i32
  %58 = or i32 %53, %57
  %59 = load i16*, i16** %28, align 8
  %60 = getelementptr inbounds i16, i16* %59, i64 24
  %61 = load i16, i16* %60, align 2
  %62 = sext i16 %61 to i32
  %63 = or i32 %58, %62
  %64 = load i16*, i16** %28, align 8
  %65 = getelementptr inbounds i16, i16* %64, i64 32
  %66 = load i16, i16* %65, align 2
  %67 = sext i16 %66 to i32
  %68 = or i32 %63, %67
  %69 = load i16*, i16** %28, align 8
  %70 = getelementptr inbounds i16, i16* %69, i64 40
  %71 = load i16, i16* %70, align 2
  %72 = sext i16 %71 to i32
  %73 = or i32 %68, %72
  %74 = load i16*, i16** %28, align 8
  %75 = getelementptr inbounds i16, i16* %74, i64 48
  %76 = load i16, i16* %75, align 2
  %77 = sext i16 %76 to i32
  %78 = or i32 %73, %77
  %79 = load i16*, i16** %28, align 8
  %80 = getelementptr inbounds i16, i16* %79, i64 56
  %81 = load i16, i16* %80, align 2
  %82 = sext i16 %81 to i32
  %83 = or i32 %78, %82
  %84 = icmp eq i32 %83, 0
  br i1 %84, label %85, label %124

; <label>:85:                                     ; preds = %49
  %86 = load i16*, i16** %28, align 8
  %87 = getelementptr inbounds i16, i16* %86, i64 0
  %88 = load i16, i16* %87, align 2
  %89 = sitofp i16 %88 to float
  %90 = load float*, float** %29, align 8
  %91 = getelementptr inbounds float, float* %90, i64 0
  %92 = load float, float* %91, align 4
  %93 = fmul float %89, %92
  store float %93, float* %35, align 4
  %94 = load float, float* %35, align 4
  %95 = load float*, float** %30, align 8
  %96 = getelementptr inbounds float, float* %95, i64 0
  store float %94, float* %96, align 4
  %97 = load float, float* %35, align 4
  %98 = load float*, float** %30, align 8
  %99 = getelementptr inbounds float, float* %98, i64 8
  store float %97, float* %99, align 4
  %100 = load float, float* %35, align 4
  %101 = load float*, float** %30, align 8
  %102 = getelementptr inbounds float, float* %101, i64 16
  store float %100, float* %102, align 4
  %103 = load float, float* %35, align 4
  %104 = load float*, float** %30, align 8
  %105 = getelementptr inbounds float, float* %104, i64 24
  store float %103, float* %105, align 4
  %106 = load float, float* %35, align 4
  %107 = load float*, float** %30, align 8
  %108 = getelementptr inbounds float, float* %107, i64 32
  store float %106, float* %108, align 4
  %109 = load float, float* %35, align 4
  %110 = load float*, float** %30, align 8
  %111 = getelementptr inbounds float, float* %110, i64 40
  store float %109, float* %111, align 4
  %112 = load float, float* %35, align 4
  %113 = load float*, float** %30, align 8
  %114 = getelementptr inbounds float, float* %113, i64 48
  store float %112, float* %114, align 4
  %115 = load float, float* %35, align 4
  %116 = load float*, float** %30, align 8
  %117 = getelementptr inbounds float, float* %116, i64 56
  store float %115, float* %117, align 4
  %118 = load i16*, i16** %28, align 8
  %119 = getelementptr inbounds i16, i16* %118, i32 1
  store i16* %119, i16** %28, align 8
  %120 = load float*, float** %29, align 8
  %121 = getelementptr inbounds float, float* %120, i32 1
  store float* %121, float** %29, align 8
  %122 = load float*, float** %30, align 8
  %123 = getelementptr inbounds float, float* %122, i32 1
  store float* %123, float** %30, align 8
  br label %302

; <label>:124:                                    ; preds = %49
  %125 = load i16*, i16** %28, align 8
  %126 = getelementptr inbounds i16, i16* %125, i64 0
  %127 = load i16, i16* %126, align 2
  %128 = sitofp i16 %127 to float
  %129 = load float*, float** %29, align 8
  %130 = getelementptr inbounds float, float* %129, i64 0
  %131 = load float, float* %130, align 4
  %132 = fmul float %128, %131
  store float %132, float* %11, align 4
  %133 = load i16*, i16** %28, align 8
  %134 = getelementptr inbounds i16, i16* %133, i64 16
  %135 = load i16, i16* %134, align 2
  %136 = sitofp i16 %135 to float
  %137 = load float*, float** %29, align 8
  %138 = getelementptr inbounds float, float* %137, i64 16
  %139 = load float, float* %138, align 4
  %140 = fmul float %136, %139
  store float %140, float* %12, align 4
  %141 = load i16*, i16** %28, align 8
  %142 = getelementptr inbounds i16, i16* %141, i64 32
  %143 = load i16, i16* %142, align 2
  %144 = sitofp i16 %143 to float
  %145 = load float*, float** %29, align 8
  %146 = getelementptr inbounds float, float* %145, i64 32
  %147 = load float, float* %146, align 4
  %148 = fmul float %144, %147
  store float %148, float* %13, align 4
  %149 = load i16*, i16** %28, align 8
  %150 = getelementptr inbounds i16, i16* %149, i64 48
  %151 = load i16, i16* %150, align 2
  %152 = sitofp i16 %151 to float
  %153 = load float*, float** %29, align 8
  %154 = getelementptr inbounds float, float* %153, i64 48
  %155 = load float, float* %154, align 4
  %156 = fmul float %152, %155
  store float %156, float* %14, align 4
  %157 = load float, float* %11, align 4
  %158 = load float, float* %13, align 4
  %159 = fadd float %157, %158
  store float %159, float* %19, align 4
  %160 = load float, float* %11, align 4
  %161 = load float, float* %13, align 4
  %162 = fsub float %160, %161
  store float %162, float* %20, align 4
  %163 = load float, float* %12, align 4
  %164 = load float, float* %14, align 4
  %165 = fadd float %163, %164
  store float %165, float* %22, align 4
  %166 = load float, float* %12, align 4
  %167 = load float, float* %14, align 4
  %168 = fsub float %166, %167
  %169 = fmul float %168, 0x3FF6A09E60000000
  %170 = load float, float* %22, align 4
  %171 = fsub float %169, %170
  store float %171, float* %21, align 4
  %172 = load float, float* %19, align 4
  %173 = load float, float* %22, align 4
  %174 = fadd float %172, %173
  store float %174, float* %11, align 4
  %175 = load float, float* %19, align 4
  %176 = load float, float* %22, align 4
  %177 = fsub float %175, %176
  store float %177, float* %14, align 4
  %178 = load float, float* %20, align 4
  %179 = load float, float* %21, align 4
  %180 = fadd float %178, %179
  store float %180, float* %12, align 4
  %181 = load float, float* %20, align 4
  %182 = load float, float* %21, align 4
  %183 = fsub float %181, %182
  store float %183, float* %13, align 4
  %184 = load i16*, i16** %28, align 8
  %185 = getelementptr inbounds i16, i16* %184, i64 8
  %186 = load i16, i16* %185, align 2
  %187 = sitofp i16 %186 to float
  %188 = load float*, float** %29, align 8
  %189 = getelementptr inbounds float, float* %188, i64 8
  %190 = load float, float* %189, align 4
  %191 = fmul float %187, %190
  store float %191, float* %15, align 4
  %192 = load i16*, i16** %28, align 8
  %193 = getelementptr inbounds i16, i16* %192, i64 24
  %194 = load i16, i16* %193, align 2
  %195 = sitofp i16 %194 to float
  %196 = load float*, float** %29, align 8
  %197 = getelementptr inbounds float, float* %196, i64 24
  %198 = load float, float* %197, align 4
  %199 = fmul float %195, %198
  store float %199, float* %16, align 4
  %200 = load i16*, i16** %28, align 8
  %201 = getelementptr inbounds i16, i16* %200, i64 40
  %202 = load i16, i16* %201, align 2
  %203 = sitofp i16 %202 to float
  %204 = load float*, float** %29, align 8
  %205 = getelementptr inbounds float, float* %204, i64 40
  %206 = load float, float* %205, align 4
  %207 = fmul float %203, %206
  store float %207, float* %17, align 4
  %208 = load i16*, i16** %28, align 8
  %209 = getelementptr inbounds i16, i16* %208, i64 56
  %210 = load i16, i16* %209, align 2
  %211 = sitofp i16 %210 to float
  %212 = load float*, float** %29, align 8
  %213 = getelementptr inbounds float, float* %212, i64 56
  %214 = load float, float* %213, align 4
  %215 = fmul float %211, %214
  store float %215, float* %18, align 4
  %216 = load float, float* %17, align 4
  %217 = load float, float* %16, align 4
  %218 = fadd float %216, %217
  store float %218, float* %27, align 4
  %219 = load float, float* %17, align 4
  %220 = load float, float* %16, align 4
  %221 = fsub float %219, %220
  store float %221, float* %24, align 4
  %222 = load float, float* %15, align 4
  %223 = load float, float* %18, align 4
  %224 = fadd float %222, %223
  store float %224, float* %25, align 4
  %225 = load float, float* %15, align 4
  %226 = load float, float* %18, align 4
  %227 = fsub float %225, %226
  store float %227, float* %26, align 4
  %228 = load float, float* %25, align 4
  %229 = load float, float* %27, align 4
  %230 = fadd float %228, %229
  store float %230, float* %18, align 4
  %231 = load float, float* %25, align 4
  %232 = load float, float* %27, align 4
  %233 = fsub float %231, %232
  %234 = fmul float %233, 0x3FF6A09E60000000
  store float %234, float* %20, align 4
  %235 = load float, float* %24, align 4
  %236 = load float, float* %26, align 4
  %237 = fadd float %235, %236
  %238 = fmul float %237, 0x3FFD906BC0000000
  store float %238, float* %23, align 4
  %239 = load float, float* %26, align 4
  %240 = fmul float 0x3FF1517A80000000, %239
  %241 = load float, float* %23, align 4
  %242 = fsub float %240, %241
  store float %242, float* %19, align 4
  %243 = load float, float* %24, align 4
  %244 = fmul float 0xC004E7AEA0000000, %243
  %245 = load float, float* %23, align 4
  %246 = fadd float %244, %245
  store float %246, float* %21, align 4
  %247 = load float, float* %21, align 4
  %248 = load float, float* %18, align 4
  %249 = fsub float %247, %248
  store float %249, float* %17, align 4
  %250 = load float, float* %20, align 4
  %251 = load float, float* %17, align 4
  %252 = fsub float %250, %251
  store float %252, float* %16, align 4
  %253 = load float, float* %19, align 4
  %254 = load float, float* %16, align 4
  %255 = fadd float %253, %254
  store float %255, float* %15, align 4
  %256 = load float, float* %11, align 4
  %257 = load float, float* %18, align 4
  %258 = fadd float %256, %257
  %259 = load float*, float** %30, align 8
  %260 = getelementptr inbounds float, float* %259, i64 0
  store float %258, float* %260, align 4
  %261 = load float, float* %11, align 4
  %262 = load float, float* %18, align 4
  %263 = fsub float %261, %262
  %264 = load float*, float** %30, align 8
  %265 = getelementptr inbounds float, float* %264, i64 56
  store float %263, float* %265, align 4
  %266 = load float, float* %12, align 4
  %267 = load float, float* %17, align 4
  %268 = fadd float %266, %267
  %269 = load float*, float** %30, align 8
  %270 = getelementptr inbounds float, float* %269, i64 8
  store float %268, float* %270, align 4
  %271 = load float, float* %12, align 4
  %272 = load float, float* %17, align 4
  %273 = fsub float %271, %272
  %274 = load float*, float** %30, align 8
  %275 = getelementptr inbounds float, float* %274, i64 48
  store float %273, float* %275, align 4
  %276 = load float, float* %13, align 4
  %277 = load float, float* %16, align 4
  %278 = fadd float %276, %277
  %279 = load float*, float** %30, align 8
  %280 = getelementptr inbounds float, float* %279, i64 16
  store float %278, float* %280, align 4
  %281 = load float, float* %13, align 4
  %282 = load float, float* %16, align 4
  %283 = fsub float %281, %282
  %284 = load float*, float** %30, align 8
  %285 = getelementptr inbounds float, float* %284, i64 40
  store float %283, float* %285, align 4
  %286 = load float, float* %14, align 4
  %287 = load float, float* %15, align 4
  %288 = fadd float %286, %287
  %289 = load float*, float** %30, align 8
  %290 = getelementptr inbounds float, float* %289, i64 32
  store float %288, float* %290, align 4
  %291 = load float, float* %14, align 4
  %292 = load float, float* %15, align 4
  %293 = fsub float %291, %292
  %294 = load float*, float** %30, align 8
  %295 = getelementptr inbounds float, float* %294, i64 24
  store float %293, float* %295, align 4
  %296 = load i16*, i16** %28, align 8
  %297 = getelementptr inbounds i16, i16* %296, i32 1
  store i16* %297, i16** %28, align 8
  %298 = load float*, float** %29, align 8
  %299 = getelementptr inbounds float, float* %298, i32 1
  store float* %299, float** %29, align 8
  %300 = load float*, float** %30, align 8
  %301 = getelementptr inbounds float, float* %300, i32 1
  store float* %301, float** %30, align 8
  br label %302

; <label>:302:                                    ; preds = %124, %85
  %303 = load i32, i32* %33, align 4
  %304 = add nsw i32 %303, -1
  store i32 %304, i32* %33, align 4
  br label %46

; <label>:305:                                    ; preds = %46
  %306 = getelementptr inbounds [64 x float], [64 x float]* %34, i32 0, i32 0
  store float* %306, float** %30, align 8
  store i32 0, i32* %33, align 4
  br label %307

; <label>:307:                                    ; preds = %532, %305
  %308 = load i32, i32* %33, align 4
  %309 = icmp slt i32 %308, 8
  br i1 %309, label %310, label %535

; <label>:310:                                    ; preds = %307
  %311 = load i8**, i8*** %9, align 8
  %312 = load i32, i32* %33, align 4
  %313 = sext i32 %312 to i64
  %314 = getelementptr inbounds i8*, i8** %311, i64 %313
  %315 = load i8*, i8** %314, align 8
  %316 = load i32, i32* %10, align 4
  %317 = zext i32 %316 to i64
  %318 = getelementptr inbounds i8, i8* %315, i64 %317
  store i8* %318, i8** %31, align 8
  %319 = load float*, float** %30, align 8
  %320 = getelementptr inbounds float, float* %319, i64 0
  %321 = load float, float* %320, align 4
  %322 = load float*, float** %30, align 8
  %323 = getelementptr inbounds float, float* %322, i64 4
  %324 = load float, float* %323, align 4
  %325 = fadd float %321, %324
  store float %325, float* %19, align 4
  %326 = load float*, float** %30, align 8
  %327 = getelementptr inbounds float, float* %326, i64 0
  %328 = load float, float* %327, align 4
  %329 = load float*, float** %30, align 8
  %330 = getelementptr inbounds float, float* %329, i64 4
  %331 = load float, float* %330, align 4
  %332 = fsub float %328, %331
  store float %332, float* %20, align 4
  %333 = load float*, float** %30, align 8
  %334 = getelementptr inbounds float, float* %333, i64 2
  %335 = load float, float* %334, align 4
  %336 = load float*, float** %30, align 8
  %337 = getelementptr inbounds float, float* %336, i64 6
  %338 = load float, float* %337, align 4
  %339 = fadd float %335, %338
  store float %339, float* %22, align 4
  %340 = load float*, float** %30, align 8
  %341 = getelementptr inbounds float, float* %340, i64 2
  %342 = load float, float* %341, align 4
  %343 = load float*, float** %30, align 8
  %344 = getelementptr inbounds float, float* %343, i64 6
  %345 = load float, float* %344, align 4
  %346 = fsub float %342, %345
  %347 = fmul float %346, 0x3FF6A09E60000000
  %348 = load float, float* %22, align 4
  %349 = fsub float %347, %348
  store float %349, float* %21, align 4
  %350 = load float, float* %19, align 4
  %351 = load float, float* %22, align 4
  %352 = fadd float %350, %351
  store float %352, float* %11, align 4
  %353 = load float, float* %19, align 4
  %354 = load float, float* %22, align 4
  %355 = fsub float %353, %354
  store float %355, float* %14, align 4
  %356 = load float, float* %20, align 4
  %357 = load float, float* %21, align 4
  %358 = fadd float %356, %357
  store float %358, float* %12, align 4
  %359 = load float, float* %20, align 4
  %360 = load float, float* %21, align 4
  %361 = fsub float %359, %360
  store float %361, float* %13, align 4
  %362 = load float*, float** %30, align 8
  %363 = getelementptr inbounds float, float* %362, i64 5
  %364 = load float, float* %363, align 4
  %365 = load float*, float** %30, align 8
  %366 = getelementptr inbounds float, float* %365, i64 3
  %367 = load float, float* %366, align 4
  %368 = fadd float %364, %367
  store float %368, float* %27, align 4
  %369 = load float*, float** %30, align 8
  %370 = getelementptr inbounds float, float* %369, i64 5
  %371 = load float, float* %370, align 4
  %372 = load float*, float** %30, align 8
  %373 = getelementptr inbounds float, float* %372, i64 3
  %374 = load float, float* %373, align 4
  %375 = fsub float %371, %374
  store float %375, float* %24, align 4
  %376 = load float*, float** %30, align 8
  %377 = getelementptr inbounds float, float* %376, i64 1
  %378 = load float, float* %377, align 4
  %379 = load float*, float** %30, align 8
  %380 = getelementptr inbounds float, float* %379, i64 7
  %381 = load float, float* %380, align 4
  %382 = fadd float %378, %381
  store float %382, float* %25, align 4
  %383 = load float*, float** %30, align 8
  %384 = getelementptr inbounds float, float* %383, i64 1
  %385 = load float, float* %384, align 4
  %386 = load float*, float** %30, align 8
  %387 = getelementptr inbounds float, float* %386, i64 7
  %388 = load float, float* %387, align 4
  %389 = fsub float %385, %388
  store float %389, float* %26, align 4
  %390 = load float, float* %25, align 4
  %391 = load float, float* %27, align 4
  %392 = fadd float %390, %391
  store float %392, float* %18, align 4
  %393 = load float, float* %25, align 4
  %394 = load float, float* %27, align 4
  %395 = fsub float %393, %394
  %396 = fmul float %395, 0x3FF6A09E60000000
  store float %396, float* %20, align 4
  %397 = load float, float* %24, align 4
  %398 = load float, float* %26, align 4
  %399 = fadd float %397, %398
  %400 = fmul float %399, 0x3FFD906BC0000000
  store float %400, float* %23, align 4
  %401 = load float, float* %26, align 4
  %402 = fmul float 0x3FF1517A80000000, %401
  %403 = load float, float* %23, align 4
  %404 = fsub float %402, %403
  store float %404, float* %19, align 4
  %405 = load float, float* %24, align 4
  %406 = fmul float 0xC004E7AEA0000000, %405
  %407 = load float, float* %23, align 4
  %408 = fadd float %406, %407
  store float %408, float* %21, align 4
  %409 = load float, float* %21, align 4
  %410 = load float, float* %18, align 4
  %411 = fsub float %409, %410
  store float %411, float* %17, align 4
  %412 = load float, float* %20, align 4
  %413 = load float, float* %17, align 4
  %414 = fsub float %412, %413
  store float %414, float* %16, align 4
  %415 = load float, float* %19, align 4
  %416 = load float, float* %16, align 4
  %417 = fadd float %415, %416
  store float %417, float* %15, align 4
  %418 = load i8*, i8** %32, align 8
  %419 = load float, float* %11, align 4
  %420 = load float, float* %18, align 4
  %421 = fadd float %419, %420
  %422 = fptosi float %421 to i64
  %423 = add nsw i64 %422, 4
  %424 = ashr i64 %423, 3
  %425 = trunc i64 %424 to i32
  %426 = and i32 %425, 1023
  %427 = sext i32 %426 to i64
  %428 = getelementptr inbounds i8, i8* %418, i64 %427
  %429 = load i8, i8* %428, align 1
  %430 = load i8*, i8** %31, align 8
  %431 = getelementptr inbounds i8, i8* %430, i64 0
  store i8 %429, i8* %431, align 1
  %432 = load i8*, i8** %32, align 8
  %433 = load float, float* %11, align 4
  %434 = load float, float* %18, align 4
  %435 = fsub float %433, %434
  %436 = fptosi float %435 to i64
  %437 = add nsw i64 %436, 4
  %438 = ashr i64 %437, 3
  %439 = trunc i64 %438 to i32
  %440 = and i32 %439, 1023
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds i8, i8* %432, i64 %441
  %443 = load i8, i8* %442, align 1
  %444 = load i8*, i8** %31, align 8
  %445 = getelementptr inbounds i8, i8* %444, i64 7
  store i8 %443, i8* %445, align 1
  %446 = load i8*, i8** %32, align 8
  %447 = load float, float* %12, align 4
  %448 = load float, float* %17, align 4
  %449 = fadd float %447, %448
  %450 = fptosi float %449 to i64
  %451 = add nsw i64 %450, 4
  %452 = ashr i64 %451, 3
  %453 = trunc i64 %452 to i32
  %454 = and i32 %453, 1023
  %455 = sext i32 %454 to i64
  %456 = getelementptr inbounds i8, i8* %446, i64 %455
  %457 = load i8, i8* %456, align 1
  %458 = load i8*, i8** %31, align 8
  %459 = getelementptr inbounds i8, i8* %458, i64 1
  store i8 %457, i8* %459, align 1
  %460 = load i8*, i8** %32, align 8
  %461 = load float, float* %12, align 4
  %462 = load float, float* %17, align 4
  %463 = fsub float %461, %462
  %464 = fptosi float %463 to i64
  %465 = add nsw i64 %464, 4
  %466 = ashr i64 %465, 3
  %467 = trunc i64 %466 to i32
  %468 = and i32 %467, 1023
  %469 = sext i32 %468 to i64
  %470 = getelementptr inbounds i8, i8* %460, i64 %469
  %471 = load i8, i8* %470, align 1
  %472 = load i8*, i8** %31, align 8
  %473 = getelementptr inbounds i8, i8* %472, i64 6
  store i8 %471, i8* %473, align 1
  %474 = load i8*, i8** %32, align 8
  %475 = load float, float* %13, align 4
  %476 = load float, float* %16, align 4
  %477 = fadd float %475, %476
  %478 = fptosi float %477 to i64
  %479 = add nsw i64 %478, 4
  %480 = ashr i64 %479, 3
  %481 = trunc i64 %480 to i32
  %482 = and i32 %481, 1023
  %483 = sext i32 %482 to i64
  %484 = getelementptr inbounds i8, i8* %474, i64 %483
  %485 = load i8, i8* %484, align 1
  %486 = load i8*, i8** %31, align 8
  %487 = getelementptr inbounds i8, i8* %486, i64 2
  store i8 %485, i8* %487, align 1
  %488 = load i8*, i8** %32, align 8
  %489 = load float, float* %13, align 4
  %490 = load float, float* %16, align 4
  %491 = fsub float %489, %490
  %492 = fptosi float %491 to i64
  %493 = add nsw i64 %492, 4
  %494 = ashr i64 %493, 3
  %495 = trunc i64 %494 to i32
  %496 = and i32 %495, 1023
  %497 = sext i32 %496 to i64
  %498 = getelementptr inbounds i8, i8* %488, i64 %497
  %499 = load i8, i8* %498, align 1
  %500 = load i8*, i8** %31, align 8
  %501 = getelementptr inbounds i8, i8* %500, i64 5
  store i8 %499, i8* %501, align 1
  %502 = load i8*, i8** %32, align 8
  %503 = load float, float* %14, align 4
  %504 = load float, float* %15, align 4
  %505 = fadd float %503, %504
  %506 = fptosi float %505 to i64
  %507 = add nsw i64 %506, 4
  %508 = ashr i64 %507, 3
  %509 = trunc i64 %508 to i32
  %510 = and i32 %509, 1023
  %511 = sext i32 %510 to i64
  %512 = getelementptr inbounds i8, i8* %502, i64 %511
  %513 = load i8, i8* %512, align 1
  %514 = load i8*, i8** %31, align 8
  %515 = getelementptr inbounds i8, i8* %514, i64 4
  store i8 %513, i8* %515, align 1
  %516 = load i8*, i8** %32, align 8
  %517 = load float, float* %14, align 4
  %518 = load float, float* %15, align 4
  %519 = fsub float %517, %518
  %520 = fptosi float %519 to i64
  %521 = add nsw i64 %520, 4
  %522 = ashr i64 %521, 3
  %523 = trunc i64 %522 to i32
  %524 = and i32 %523, 1023
  %525 = sext i32 %524 to i64
  %526 = getelementptr inbounds i8, i8* %516, i64 %525
  %527 = load i8, i8* %526, align 1
  %528 = load i8*, i8** %31, align 8
  %529 = getelementptr inbounds i8, i8* %528, i64 3
  store i8 %527, i8* %529, align 1
  %530 = load float*, float** %30, align 8
  %531 = getelementptr inbounds float, float* %530, i64 8
  store float* %531, float** %30, align 8
  br label %532

; <label>:532:                                    ; preds = %310
  %533 = load i32, i32* %33, align 4
  %534 = add nsw i32 %533, 1
  store i32 %534, i32* %33, align 4
  br label %307

; <label>:535:                                    ; preds = %307
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
