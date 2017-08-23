; ModuleID = 'tmp1.ll'
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

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_idct_float = private constant [15 x i8] c"jpeg_idct_float"
@__profc_jpeg_idct_float = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_idct_float = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9088178383785688827, i64 68448211872, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_idct_float, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* @jpeg_idct_float to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [25 x i8] c"\0F\17x\DA\CB*HM\8F\CFLI.\89O\CB\C9O,\01\000\BC\06\1F", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_idct_float to i8*), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
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

; <label>:46:                                     ; preds = %304, %5
  %47 = load i32, i32* %33, align 4
  %48 = icmp sgt i32 %47, 0
  br i1 %48, label %49, label %307

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
  br i1 %84, label %85, label %125

; <label>:85:                                     ; preds = %49
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_idct_float, i64 0, i64 2)
  %86 = add i64 %pgocount, 1
  store i64 %86, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_idct_float, i64 0, i64 2)
  %87 = load i16*, i16** %28, align 8
  %88 = getelementptr inbounds i16, i16* %87, i64 0
  %89 = load i16, i16* %88, align 2
  %90 = sitofp i16 %89 to float
  %91 = load float*, float** %29, align 8
  %92 = getelementptr inbounds float, float* %91, i64 0
  %93 = load float, float* %92, align 4
  %94 = fmul float %90, %93
  store float %94, float* %35, align 4
  %95 = load float, float* %35, align 4
  %96 = load float*, float** %30, align 8
  %97 = getelementptr inbounds float, float* %96, i64 0
  store float %95, float* %97, align 4
  %98 = load float, float* %35, align 4
  %99 = load float*, float** %30, align 8
  %100 = getelementptr inbounds float, float* %99, i64 8
  store float %98, float* %100, align 4
  %101 = load float, float* %35, align 4
  %102 = load float*, float** %30, align 8
  %103 = getelementptr inbounds float, float* %102, i64 16
  store float %101, float* %103, align 4
  %104 = load float, float* %35, align 4
  %105 = load float*, float** %30, align 8
  %106 = getelementptr inbounds float, float* %105, i64 24
  store float %104, float* %106, align 4
  %107 = load float, float* %35, align 4
  %108 = load float*, float** %30, align 8
  %109 = getelementptr inbounds float, float* %108, i64 32
  store float %107, float* %109, align 4
  %110 = load float, float* %35, align 4
  %111 = load float*, float** %30, align 8
  %112 = getelementptr inbounds float, float* %111, i64 40
  store float %110, float* %112, align 4
  %113 = load float, float* %35, align 4
  %114 = load float*, float** %30, align 8
  %115 = getelementptr inbounds float, float* %114, i64 48
  store float %113, float* %115, align 4
  %116 = load float, float* %35, align 4
  %117 = load float*, float** %30, align 8
  %118 = getelementptr inbounds float, float* %117, i64 56
  store float %116, float* %118, align 4
  %119 = load i16*, i16** %28, align 8
  %120 = getelementptr inbounds i16, i16* %119, i32 1
  store i16* %120, i16** %28, align 8
  %121 = load float*, float** %29, align 8
  %122 = getelementptr inbounds float, float* %121, i32 1
  store float* %122, float** %29, align 8
  %123 = load float*, float** %30, align 8
  %124 = getelementptr inbounds float, float* %123, i32 1
  store float* %124, float** %30, align 8
  br label %304

; <label>:125:                                    ; preds = %49
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_idct_float, i64 0, i64 1)
  %126 = add i64 %pgocount1, 1
  store i64 %126, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_idct_float, i64 0, i64 1)
  %127 = load i16*, i16** %28, align 8
  %128 = getelementptr inbounds i16, i16* %127, i64 0
  %129 = load i16, i16* %128, align 2
  %130 = sitofp i16 %129 to float
  %131 = load float*, float** %29, align 8
  %132 = getelementptr inbounds float, float* %131, i64 0
  %133 = load float, float* %132, align 4
  %134 = fmul float %130, %133
  store float %134, float* %11, align 4
  %135 = load i16*, i16** %28, align 8
  %136 = getelementptr inbounds i16, i16* %135, i64 16
  %137 = load i16, i16* %136, align 2
  %138 = sitofp i16 %137 to float
  %139 = load float*, float** %29, align 8
  %140 = getelementptr inbounds float, float* %139, i64 16
  %141 = load float, float* %140, align 4
  %142 = fmul float %138, %141
  store float %142, float* %12, align 4
  %143 = load i16*, i16** %28, align 8
  %144 = getelementptr inbounds i16, i16* %143, i64 32
  %145 = load i16, i16* %144, align 2
  %146 = sitofp i16 %145 to float
  %147 = load float*, float** %29, align 8
  %148 = getelementptr inbounds float, float* %147, i64 32
  %149 = load float, float* %148, align 4
  %150 = fmul float %146, %149
  store float %150, float* %13, align 4
  %151 = load i16*, i16** %28, align 8
  %152 = getelementptr inbounds i16, i16* %151, i64 48
  %153 = load i16, i16* %152, align 2
  %154 = sitofp i16 %153 to float
  %155 = load float*, float** %29, align 8
  %156 = getelementptr inbounds float, float* %155, i64 48
  %157 = load float, float* %156, align 4
  %158 = fmul float %154, %157
  store float %158, float* %14, align 4
  %159 = load float, float* %11, align 4
  %160 = load float, float* %13, align 4
  %161 = fadd float %159, %160
  store float %161, float* %19, align 4
  %162 = load float, float* %11, align 4
  %163 = load float, float* %13, align 4
  %164 = fsub float %162, %163
  store float %164, float* %20, align 4
  %165 = load float, float* %12, align 4
  %166 = load float, float* %14, align 4
  %167 = fadd float %165, %166
  store float %167, float* %22, align 4
  %168 = load float, float* %12, align 4
  %169 = load float, float* %14, align 4
  %170 = fsub float %168, %169
  %171 = fmul float %170, 0x3FF6A09E60000000
  %172 = load float, float* %22, align 4
  %173 = fsub float %171, %172
  store float %173, float* %21, align 4
  %174 = load float, float* %19, align 4
  %175 = load float, float* %22, align 4
  %176 = fadd float %174, %175
  store float %176, float* %11, align 4
  %177 = load float, float* %19, align 4
  %178 = load float, float* %22, align 4
  %179 = fsub float %177, %178
  store float %179, float* %14, align 4
  %180 = load float, float* %20, align 4
  %181 = load float, float* %21, align 4
  %182 = fadd float %180, %181
  store float %182, float* %12, align 4
  %183 = load float, float* %20, align 4
  %184 = load float, float* %21, align 4
  %185 = fsub float %183, %184
  store float %185, float* %13, align 4
  %186 = load i16*, i16** %28, align 8
  %187 = getelementptr inbounds i16, i16* %186, i64 8
  %188 = load i16, i16* %187, align 2
  %189 = sitofp i16 %188 to float
  %190 = load float*, float** %29, align 8
  %191 = getelementptr inbounds float, float* %190, i64 8
  %192 = load float, float* %191, align 4
  %193 = fmul float %189, %192
  store float %193, float* %15, align 4
  %194 = load i16*, i16** %28, align 8
  %195 = getelementptr inbounds i16, i16* %194, i64 24
  %196 = load i16, i16* %195, align 2
  %197 = sitofp i16 %196 to float
  %198 = load float*, float** %29, align 8
  %199 = getelementptr inbounds float, float* %198, i64 24
  %200 = load float, float* %199, align 4
  %201 = fmul float %197, %200
  store float %201, float* %16, align 4
  %202 = load i16*, i16** %28, align 8
  %203 = getelementptr inbounds i16, i16* %202, i64 40
  %204 = load i16, i16* %203, align 2
  %205 = sitofp i16 %204 to float
  %206 = load float*, float** %29, align 8
  %207 = getelementptr inbounds float, float* %206, i64 40
  %208 = load float, float* %207, align 4
  %209 = fmul float %205, %208
  store float %209, float* %17, align 4
  %210 = load i16*, i16** %28, align 8
  %211 = getelementptr inbounds i16, i16* %210, i64 56
  %212 = load i16, i16* %211, align 2
  %213 = sitofp i16 %212 to float
  %214 = load float*, float** %29, align 8
  %215 = getelementptr inbounds float, float* %214, i64 56
  %216 = load float, float* %215, align 4
  %217 = fmul float %213, %216
  store float %217, float* %18, align 4
  %218 = load float, float* %17, align 4
  %219 = load float, float* %16, align 4
  %220 = fadd float %218, %219
  store float %220, float* %27, align 4
  %221 = load float, float* %17, align 4
  %222 = load float, float* %16, align 4
  %223 = fsub float %221, %222
  store float %223, float* %24, align 4
  %224 = load float, float* %15, align 4
  %225 = load float, float* %18, align 4
  %226 = fadd float %224, %225
  store float %226, float* %25, align 4
  %227 = load float, float* %15, align 4
  %228 = load float, float* %18, align 4
  %229 = fsub float %227, %228
  store float %229, float* %26, align 4
  %230 = load float, float* %25, align 4
  %231 = load float, float* %27, align 4
  %232 = fadd float %230, %231
  store float %232, float* %18, align 4
  %233 = load float, float* %25, align 4
  %234 = load float, float* %27, align 4
  %235 = fsub float %233, %234
  %236 = fmul float %235, 0x3FF6A09E60000000
  store float %236, float* %20, align 4
  %237 = load float, float* %24, align 4
  %238 = load float, float* %26, align 4
  %239 = fadd float %237, %238
  %240 = fmul float %239, 0x3FFD906BC0000000
  store float %240, float* %23, align 4
  %241 = load float, float* %26, align 4
  %242 = fmul float 0x3FF1517A80000000, %241
  %243 = load float, float* %23, align 4
  %244 = fsub float %242, %243
  store float %244, float* %19, align 4
  %245 = load float, float* %24, align 4
  %246 = fmul float 0xC004E7AEA0000000, %245
  %247 = load float, float* %23, align 4
  %248 = fadd float %246, %247
  store float %248, float* %21, align 4
  %249 = load float, float* %21, align 4
  %250 = load float, float* %18, align 4
  %251 = fsub float %249, %250
  store float %251, float* %17, align 4
  %252 = load float, float* %20, align 4
  %253 = load float, float* %17, align 4
  %254 = fsub float %252, %253
  store float %254, float* %16, align 4
  %255 = load float, float* %19, align 4
  %256 = load float, float* %16, align 4
  %257 = fadd float %255, %256
  store float %257, float* %15, align 4
  %258 = load float, float* %11, align 4
  %259 = load float, float* %18, align 4
  %260 = fadd float %258, %259
  %261 = load float*, float** %30, align 8
  %262 = getelementptr inbounds float, float* %261, i64 0
  store float %260, float* %262, align 4
  %263 = load float, float* %11, align 4
  %264 = load float, float* %18, align 4
  %265 = fsub float %263, %264
  %266 = load float*, float** %30, align 8
  %267 = getelementptr inbounds float, float* %266, i64 56
  store float %265, float* %267, align 4
  %268 = load float, float* %12, align 4
  %269 = load float, float* %17, align 4
  %270 = fadd float %268, %269
  %271 = load float*, float** %30, align 8
  %272 = getelementptr inbounds float, float* %271, i64 8
  store float %270, float* %272, align 4
  %273 = load float, float* %12, align 4
  %274 = load float, float* %17, align 4
  %275 = fsub float %273, %274
  %276 = load float*, float** %30, align 8
  %277 = getelementptr inbounds float, float* %276, i64 48
  store float %275, float* %277, align 4
  %278 = load float, float* %13, align 4
  %279 = load float, float* %16, align 4
  %280 = fadd float %278, %279
  %281 = load float*, float** %30, align 8
  %282 = getelementptr inbounds float, float* %281, i64 16
  store float %280, float* %282, align 4
  %283 = load float, float* %13, align 4
  %284 = load float, float* %16, align 4
  %285 = fsub float %283, %284
  %286 = load float*, float** %30, align 8
  %287 = getelementptr inbounds float, float* %286, i64 40
  store float %285, float* %287, align 4
  %288 = load float, float* %14, align 4
  %289 = load float, float* %15, align 4
  %290 = fadd float %288, %289
  %291 = load float*, float** %30, align 8
  %292 = getelementptr inbounds float, float* %291, i64 32
  store float %290, float* %292, align 4
  %293 = load float, float* %14, align 4
  %294 = load float, float* %15, align 4
  %295 = fsub float %293, %294
  %296 = load float*, float** %30, align 8
  %297 = getelementptr inbounds float, float* %296, i64 24
  store float %295, float* %297, align 4
  %298 = load i16*, i16** %28, align 8
  %299 = getelementptr inbounds i16, i16* %298, i32 1
  store i16* %299, i16** %28, align 8
  %300 = load float*, float** %29, align 8
  %301 = getelementptr inbounds float, float* %300, i32 1
  store float* %301, float** %29, align 8
  %302 = load float*, float** %30, align 8
  %303 = getelementptr inbounds float, float* %302, i32 1
  store float* %303, float** %30, align 8
  br label %304

; <label>:304:                                    ; preds = %125, %85
  %305 = load i32, i32* %33, align 4
  %306 = add nsw i32 %305, -1
  store i32 %306, i32* %33, align 4
  br label %46

; <label>:307:                                    ; preds = %46
  %308 = getelementptr inbounds [64 x float], [64 x float]* %34, i32 0, i32 0
  store float* %308, float** %30, align 8
  store i32 0, i32* %33, align 4
  br label %309

; <label>:309:                                    ; preds = %534, %307
  %310 = load i32, i32* %33, align 4
  %311 = icmp slt i32 %310, 8
  br i1 %311, label %312, label %538

; <label>:312:                                    ; preds = %309
  %313 = load i8**, i8*** %9, align 8
  %314 = load i32, i32* %33, align 4
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds i8*, i8** %313, i64 %315
  %317 = load i8*, i8** %316, align 8
  %318 = load i32, i32* %10, align 4
  %319 = zext i32 %318 to i64
  %320 = getelementptr inbounds i8, i8* %317, i64 %319
  store i8* %320, i8** %31, align 8
  %321 = load float*, float** %30, align 8
  %322 = getelementptr inbounds float, float* %321, i64 0
  %323 = load float, float* %322, align 4
  %324 = load float*, float** %30, align 8
  %325 = getelementptr inbounds float, float* %324, i64 4
  %326 = load float, float* %325, align 4
  %327 = fadd float %323, %326
  store float %327, float* %19, align 4
  %328 = load float*, float** %30, align 8
  %329 = getelementptr inbounds float, float* %328, i64 0
  %330 = load float, float* %329, align 4
  %331 = load float*, float** %30, align 8
  %332 = getelementptr inbounds float, float* %331, i64 4
  %333 = load float, float* %332, align 4
  %334 = fsub float %330, %333
  store float %334, float* %20, align 4
  %335 = load float*, float** %30, align 8
  %336 = getelementptr inbounds float, float* %335, i64 2
  %337 = load float, float* %336, align 4
  %338 = load float*, float** %30, align 8
  %339 = getelementptr inbounds float, float* %338, i64 6
  %340 = load float, float* %339, align 4
  %341 = fadd float %337, %340
  store float %341, float* %22, align 4
  %342 = load float*, float** %30, align 8
  %343 = getelementptr inbounds float, float* %342, i64 2
  %344 = load float, float* %343, align 4
  %345 = load float*, float** %30, align 8
  %346 = getelementptr inbounds float, float* %345, i64 6
  %347 = load float, float* %346, align 4
  %348 = fsub float %344, %347
  %349 = fmul float %348, 0x3FF6A09E60000000
  %350 = load float, float* %22, align 4
  %351 = fsub float %349, %350
  store float %351, float* %21, align 4
  %352 = load float, float* %19, align 4
  %353 = load float, float* %22, align 4
  %354 = fadd float %352, %353
  store float %354, float* %11, align 4
  %355 = load float, float* %19, align 4
  %356 = load float, float* %22, align 4
  %357 = fsub float %355, %356
  store float %357, float* %14, align 4
  %358 = load float, float* %20, align 4
  %359 = load float, float* %21, align 4
  %360 = fadd float %358, %359
  store float %360, float* %12, align 4
  %361 = load float, float* %20, align 4
  %362 = load float, float* %21, align 4
  %363 = fsub float %361, %362
  store float %363, float* %13, align 4
  %364 = load float*, float** %30, align 8
  %365 = getelementptr inbounds float, float* %364, i64 5
  %366 = load float, float* %365, align 4
  %367 = load float*, float** %30, align 8
  %368 = getelementptr inbounds float, float* %367, i64 3
  %369 = load float, float* %368, align 4
  %370 = fadd float %366, %369
  store float %370, float* %27, align 4
  %371 = load float*, float** %30, align 8
  %372 = getelementptr inbounds float, float* %371, i64 5
  %373 = load float, float* %372, align 4
  %374 = load float*, float** %30, align 8
  %375 = getelementptr inbounds float, float* %374, i64 3
  %376 = load float, float* %375, align 4
  %377 = fsub float %373, %376
  store float %377, float* %24, align 4
  %378 = load float*, float** %30, align 8
  %379 = getelementptr inbounds float, float* %378, i64 1
  %380 = load float, float* %379, align 4
  %381 = load float*, float** %30, align 8
  %382 = getelementptr inbounds float, float* %381, i64 7
  %383 = load float, float* %382, align 4
  %384 = fadd float %380, %383
  store float %384, float* %25, align 4
  %385 = load float*, float** %30, align 8
  %386 = getelementptr inbounds float, float* %385, i64 1
  %387 = load float, float* %386, align 4
  %388 = load float*, float** %30, align 8
  %389 = getelementptr inbounds float, float* %388, i64 7
  %390 = load float, float* %389, align 4
  %391 = fsub float %387, %390
  store float %391, float* %26, align 4
  %392 = load float, float* %25, align 4
  %393 = load float, float* %27, align 4
  %394 = fadd float %392, %393
  store float %394, float* %18, align 4
  %395 = load float, float* %25, align 4
  %396 = load float, float* %27, align 4
  %397 = fsub float %395, %396
  %398 = fmul float %397, 0x3FF6A09E60000000
  store float %398, float* %20, align 4
  %399 = load float, float* %24, align 4
  %400 = load float, float* %26, align 4
  %401 = fadd float %399, %400
  %402 = fmul float %401, 0x3FFD906BC0000000
  store float %402, float* %23, align 4
  %403 = load float, float* %26, align 4
  %404 = fmul float 0x3FF1517A80000000, %403
  %405 = load float, float* %23, align 4
  %406 = fsub float %404, %405
  store float %406, float* %19, align 4
  %407 = load float, float* %24, align 4
  %408 = fmul float 0xC004E7AEA0000000, %407
  %409 = load float, float* %23, align 4
  %410 = fadd float %408, %409
  store float %410, float* %21, align 4
  %411 = load float, float* %21, align 4
  %412 = load float, float* %18, align 4
  %413 = fsub float %411, %412
  store float %413, float* %17, align 4
  %414 = load float, float* %20, align 4
  %415 = load float, float* %17, align 4
  %416 = fsub float %414, %415
  store float %416, float* %16, align 4
  %417 = load float, float* %19, align 4
  %418 = load float, float* %16, align 4
  %419 = fadd float %417, %418
  store float %419, float* %15, align 4
  %420 = load i8*, i8** %32, align 8
  %421 = load float, float* %11, align 4
  %422 = load float, float* %18, align 4
  %423 = fadd float %421, %422
  %424 = fptosi float %423 to i64
  %425 = add nsw i64 %424, 4
  %426 = ashr i64 %425, 3
  %427 = trunc i64 %426 to i32
  %428 = and i32 %427, 1023
  %429 = sext i32 %428 to i64
  %430 = getelementptr inbounds i8, i8* %420, i64 %429
  %431 = load i8, i8* %430, align 1
  %432 = load i8*, i8** %31, align 8
  %433 = getelementptr inbounds i8, i8* %432, i64 0
  store i8 %431, i8* %433, align 1
  %434 = load i8*, i8** %32, align 8
  %435 = load float, float* %11, align 4
  %436 = load float, float* %18, align 4
  %437 = fsub float %435, %436
  %438 = fptosi float %437 to i64
  %439 = add nsw i64 %438, 4
  %440 = ashr i64 %439, 3
  %441 = trunc i64 %440 to i32
  %442 = and i32 %441, 1023
  %443 = sext i32 %442 to i64
  %444 = getelementptr inbounds i8, i8* %434, i64 %443
  %445 = load i8, i8* %444, align 1
  %446 = load i8*, i8** %31, align 8
  %447 = getelementptr inbounds i8, i8* %446, i64 7
  store i8 %445, i8* %447, align 1
  %448 = load i8*, i8** %32, align 8
  %449 = load float, float* %12, align 4
  %450 = load float, float* %17, align 4
  %451 = fadd float %449, %450
  %452 = fptosi float %451 to i64
  %453 = add nsw i64 %452, 4
  %454 = ashr i64 %453, 3
  %455 = trunc i64 %454 to i32
  %456 = and i32 %455, 1023
  %457 = sext i32 %456 to i64
  %458 = getelementptr inbounds i8, i8* %448, i64 %457
  %459 = load i8, i8* %458, align 1
  %460 = load i8*, i8** %31, align 8
  %461 = getelementptr inbounds i8, i8* %460, i64 1
  store i8 %459, i8* %461, align 1
  %462 = load i8*, i8** %32, align 8
  %463 = load float, float* %12, align 4
  %464 = load float, float* %17, align 4
  %465 = fsub float %463, %464
  %466 = fptosi float %465 to i64
  %467 = add nsw i64 %466, 4
  %468 = ashr i64 %467, 3
  %469 = trunc i64 %468 to i32
  %470 = and i32 %469, 1023
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds i8, i8* %462, i64 %471
  %473 = load i8, i8* %472, align 1
  %474 = load i8*, i8** %31, align 8
  %475 = getelementptr inbounds i8, i8* %474, i64 6
  store i8 %473, i8* %475, align 1
  %476 = load i8*, i8** %32, align 8
  %477 = load float, float* %13, align 4
  %478 = load float, float* %16, align 4
  %479 = fadd float %477, %478
  %480 = fptosi float %479 to i64
  %481 = add nsw i64 %480, 4
  %482 = ashr i64 %481, 3
  %483 = trunc i64 %482 to i32
  %484 = and i32 %483, 1023
  %485 = sext i32 %484 to i64
  %486 = getelementptr inbounds i8, i8* %476, i64 %485
  %487 = load i8, i8* %486, align 1
  %488 = load i8*, i8** %31, align 8
  %489 = getelementptr inbounds i8, i8* %488, i64 2
  store i8 %487, i8* %489, align 1
  %490 = load i8*, i8** %32, align 8
  %491 = load float, float* %13, align 4
  %492 = load float, float* %16, align 4
  %493 = fsub float %491, %492
  %494 = fptosi float %493 to i64
  %495 = add nsw i64 %494, 4
  %496 = ashr i64 %495, 3
  %497 = trunc i64 %496 to i32
  %498 = and i32 %497, 1023
  %499 = sext i32 %498 to i64
  %500 = getelementptr inbounds i8, i8* %490, i64 %499
  %501 = load i8, i8* %500, align 1
  %502 = load i8*, i8** %31, align 8
  %503 = getelementptr inbounds i8, i8* %502, i64 5
  store i8 %501, i8* %503, align 1
  %504 = load i8*, i8** %32, align 8
  %505 = load float, float* %14, align 4
  %506 = load float, float* %15, align 4
  %507 = fadd float %505, %506
  %508 = fptosi float %507 to i64
  %509 = add nsw i64 %508, 4
  %510 = ashr i64 %509, 3
  %511 = trunc i64 %510 to i32
  %512 = and i32 %511, 1023
  %513 = sext i32 %512 to i64
  %514 = getelementptr inbounds i8, i8* %504, i64 %513
  %515 = load i8, i8* %514, align 1
  %516 = load i8*, i8** %31, align 8
  %517 = getelementptr inbounds i8, i8* %516, i64 4
  store i8 %515, i8* %517, align 1
  %518 = load i8*, i8** %32, align 8
  %519 = load float, float* %14, align 4
  %520 = load float, float* %15, align 4
  %521 = fsub float %519, %520
  %522 = fptosi float %521 to i64
  %523 = add nsw i64 %522, 4
  %524 = ashr i64 %523, 3
  %525 = trunc i64 %524 to i32
  %526 = and i32 %525, 1023
  %527 = sext i32 %526 to i64
  %528 = getelementptr inbounds i8, i8* %518, i64 %527
  %529 = load i8, i8* %528, align 1
  %530 = load i8*, i8** %31, align 8
  %531 = getelementptr inbounds i8, i8* %530, i64 3
  store i8 %529, i8* %531, align 1
  %532 = load float*, float** %30, align 8
  %533 = getelementptr inbounds float, float* %532, i64 8
  store float* %533, float** %30, align 8
  br label %534

; <label>:534:                                    ; preds = %312
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_idct_float, i64 0, i64 0)
  %535 = add i64 %pgocount2, 1
  store i64 %535, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_idct_float, i64 0, i64 0)
  %536 = load i32, i32* %33, align 4
  %537 = add nsw i32 %536, 1
  store i32 %537, i32* %33, align 4
  br label %309

; <label>:538:                                    ; preds = %309
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_idct_float, i64 0, i64 3)
  %539 = add i64 %pgocount3, 1
  store i64 %539, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_idct_float, i64 0, i64 3)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
