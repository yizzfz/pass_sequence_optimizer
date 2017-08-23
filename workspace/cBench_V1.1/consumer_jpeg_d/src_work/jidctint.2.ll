; ModuleID = 'tmp1.ll'
source_filename = "jidctint.c"
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
@__profn_jpeg_idct_islow = private constant [15 x i8] c"jpeg_idct_islow"
@__profc_jpeg_idct_islow = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_idct_islow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2181634803620860147, i64 78535273468, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_islow, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* @jpeg_idct_islow to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [25 x i8] c"\0F\17x\DA\CB*HM\8F\CFLI.\89\CF,\CE\C9/\07\000\FD\067", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_idct_islow to i8*), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jpeg_idct_islow(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32) #0 {
  %6 = alloca %struct.jpeg_decompress_struct*, align 8
  %7 = alloca %struct.jpeg_component_info*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i8**, align 8
  %10 = alloca i32, align 4
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  %20 = alloca i64, align 8
  %21 = alloca i64, align 8
  %22 = alloca i64, align 8
  %23 = alloca i64, align 8
  %24 = alloca i16*, align 8
  %25 = alloca i32*, align 8
  %26 = alloca i32*, align 8
  %27 = alloca i8*, align 8
  %28 = alloca i8*, align 8
  %29 = alloca i32, align 4
  %30 = alloca [64 x i32], align 16
  %31 = alloca i32, align 4
  %32 = alloca i8, align 1
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %6, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %7, align 8
  store i16* %2, i16** %8, align 8
  store i8** %3, i8*** %9, align 8
  store i32 %4, i32* %10, align 4
  %33 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %33, i32 0, i32 61
  %35 = load i8*, i8** %34, align 8
  %36 = getelementptr inbounds i8, i8* %35, i64 128
  store i8* %36, i8** %28, align 8
  %37 = load i16*, i16** %8, align 8
  store i16* %37, i16** %24, align 8
  %38 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %39 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %38, i32 0, i32 20
  %40 = load i8*, i8** %39, align 8
  %41 = bitcast i8* %40 to i32*
  store i32* %41, i32** %25, align 8
  %42 = getelementptr inbounds [64 x i32], [64 x i32]* %30, i32 0, i32 0
  store i32* %42, i32** %26, align 8
  store i32 8, i32* %29, align 4
  br label %43

; <label>:43:                                     ; preds = %357, %5
  %44 = load i32, i32* %29, align 4
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %46, label %360

; <label>:46:                                     ; preds = %43
  %47 = load i16*, i16** %24, align 8
  %48 = getelementptr inbounds i16, i16* %47, i64 8
  %49 = load i16, i16* %48, align 2
  %50 = sext i16 %49 to i32
  %51 = load i16*, i16** %24, align 8
  %52 = getelementptr inbounds i16, i16* %51, i64 16
  %53 = load i16, i16* %52, align 2
  %54 = sext i16 %53 to i32
  %55 = or i32 %50, %54
  %56 = load i16*, i16** %24, align 8
  %57 = getelementptr inbounds i16, i16* %56, i64 24
  %58 = load i16, i16* %57, align 2
  %59 = sext i16 %58 to i32
  %60 = or i32 %55, %59
  %61 = load i16*, i16** %24, align 8
  %62 = getelementptr inbounds i16, i16* %61, i64 32
  %63 = load i16, i16* %62, align 2
  %64 = sext i16 %63 to i32
  %65 = or i32 %60, %64
  %66 = load i16*, i16** %24, align 8
  %67 = getelementptr inbounds i16, i16* %66, i64 40
  %68 = load i16, i16* %67, align 2
  %69 = sext i16 %68 to i32
  %70 = or i32 %65, %69
  %71 = load i16*, i16** %24, align 8
  %72 = getelementptr inbounds i16, i16* %71, i64 48
  %73 = load i16, i16* %72, align 2
  %74 = sext i16 %73 to i32
  %75 = or i32 %70, %74
  %76 = load i16*, i16** %24, align 8
  %77 = getelementptr inbounds i16, i16* %76, i64 56
  %78 = load i16, i16* %77, align 2
  %79 = sext i16 %78 to i32
  %80 = or i32 %75, %79
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %82, label %123

; <label>:82:                                     ; preds = %46
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_islow, i64 0, i64 2)
  %83 = add i64 %pgocount, 1
  store i64 %83, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_islow, i64 0, i64 2)
  %84 = load i16*, i16** %24, align 8
  %85 = getelementptr inbounds i16, i16* %84, i64 0
  %86 = load i16, i16* %85, align 2
  %87 = sext i16 %86 to i32
  %88 = load i32*, i32** %25, align 8
  %89 = getelementptr inbounds i32, i32* %88, i64 0
  %90 = load i32, i32* %89, align 4
  %91 = mul nsw i32 %87, %90
  %92 = shl i32 %91, 2
  store i32 %92, i32* %31, align 4
  %93 = load i32, i32* %31, align 4
  %94 = load i32*, i32** %26, align 8
  %95 = getelementptr inbounds i32, i32* %94, i64 0
  store i32 %93, i32* %95, align 4
  %96 = load i32, i32* %31, align 4
  %97 = load i32*, i32** %26, align 8
  %98 = getelementptr inbounds i32, i32* %97, i64 8
  store i32 %96, i32* %98, align 4
  %99 = load i32, i32* %31, align 4
  %100 = load i32*, i32** %26, align 8
  %101 = getelementptr inbounds i32, i32* %100, i64 16
  store i32 %99, i32* %101, align 4
  %102 = load i32, i32* %31, align 4
  %103 = load i32*, i32** %26, align 8
  %104 = getelementptr inbounds i32, i32* %103, i64 24
  store i32 %102, i32* %104, align 4
  %105 = load i32, i32* %31, align 4
  %106 = load i32*, i32** %26, align 8
  %107 = getelementptr inbounds i32, i32* %106, i64 32
  store i32 %105, i32* %107, align 4
  %108 = load i32, i32* %31, align 4
  %109 = load i32*, i32** %26, align 8
  %110 = getelementptr inbounds i32, i32* %109, i64 40
  store i32 %108, i32* %110, align 4
  %111 = load i32, i32* %31, align 4
  %112 = load i32*, i32** %26, align 8
  %113 = getelementptr inbounds i32, i32* %112, i64 48
  store i32 %111, i32* %113, align 4
  %114 = load i32, i32* %31, align 4
  %115 = load i32*, i32** %26, align 8
  %116 = getelementptr inbounds i32, i32* %115, i64 56
  store i32 %114, i32* %116, align 4
  %117 = load i16*, i16** %24, align 8
  %118 = getelementptr inbounds i16, i16* %117, i32 1
  store i16* %118, i16** %24, align 8
  %119 = load i32*, i32** %25, align 8
  %120 = getelementptr inbounds i32, i32* %119, i32 1
  store i32* %120, i32** %25, align 8
  %121 = load i32*, i32** %26, align 8
  %122 = getelementptr inbounds i32, i32* %121, i32 1
  store i32* %122, i32** %26, align 8
  br label %357

; <label>:123:                                    ; preds = %46
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_islow, i64 0, i64 0)
  %124 = add i64 %pgocount1, 1
  store i64 %124, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_islow, i64 0, i64 0)
  %125 = load i16*, i16** %24, align 8
  %126 = getelementptr inbounds i16, i16* %125, i64 16
  %127 = load i16, i16* %126, align 2
  %128 = sext i16 %127 to i32
  %129 = load i32*, i32** %25, align 8
  %130 = getelementptr inbounds i32, i32* %129, i64 16
  %131 = load i32, i32* %130, align 4
  %132 = mul nsw i32 %128, %131
  %133 = sext i32 %132 to i64
  store i64 %133, i64* %20, align 8
  %134 = load i16*, i16** %24, align 8
  %135 = getelementptr inbounds i16, i16* %134, i64 48
  %136 = load i16, i16* %135, align 2
  %137 = sext i16 %136 to i32
  %138 = load i32*, i32** %25, align 8
  %139 = getelementptr inbounds i32, i32* %138, i64 48
  %140 = load i32, i32* %139, align 4
  %141 = mul nsw i32 %137, %140
  %142 = sext i32 %141 to i64
  store i64 %142, i64* %21, align 8
  %143 = load i64, i64* %20, align 8
  %144 = load i64, i64* %21, align 8
  %145 = add nsw i64 %143, %144
  %146 = mul nsw i64 %145, 4433
  store i64 %146, i64* %19, align 8
  %147 = load i64, i64* %19, align 8
  %148 = load i64, i64* %21, align 8
  %149 = mul nsw i64 %148, -15137
  %150 = add nsw i64 %147, %149
  store i64 %150, i64* %13, align 8
  %151 = load i64, i64* %19, align 8
  %152 = load i64, i64* %20, align 8
  %153 = mul nsw i64 %152, 6270
  %154 = add nsw i64 %151, %153
  store i64 %154, i64* %14, align 8
  %155 = load i16*, i16** %24, align 8
  %156 = getelementptr inbounds i16, i16* %155, i64 0
  %157 = load i16, i16* %156, align 2
  %158 = sext i16 %157 to i32
  %159 = load i32*, i32** %25, align 8
  %160 = getelementptr inbounds i32, i32* %159, i64 0
  %161 = load i32, i32* %160, align 4
  %162 = mul nsw i32 %158, %161
  %163 = sext i32 %162 to i64
  store i64 %163, i64* %20, align 8
  %164 = load i16*, i16** %24, align 8
  %165 = getelementptr inbounds i16, i16* %164, i64 32
  %166 = load i16, i16* %165, align 2
  %167 = sext i16 %166 to i32
  %168 = load i32*, i32** %25, align 8
  %169 = getelementptr inbounds i32, i32* %168, i64 32
  %170 = load i32, i32* %169, align 4
  %171 = mul nsw i32 %167, %170
  %172 = sext i32 %171 to i64
  store i64 %172, i64* %21, align 8
  %173 = load i64, i64* %20, align 8
  %174 = load i64, i64* %21, align 8
  %175 = add nsw i64 %173, %174
  %176 = shl i64 %175, 13
  store i64 %176, i64* %11, align 8
  %177 = load i64, i64* %20, align 8
  %178 = load i64, i64* %21, align 8
  %179 = sub nsw i64 %177, %178
  %180 = shl i64 %179, 13
  store i64 %180, i64* %12, align 8
  %181 = load i64, i64* %11, align 8
  %182 = load i64, i64* %14, align 8
  %183 = add nsw i64 %181, %182
  store i64 %183, i64* %15, align 8
  %184 = load i64, i64* %11, align 8
  %185 = load i64, i64* %14, align 8
  %186 = sub nsw i64 %184, %185
  store i64 %186, i64* %18, align 8
  %187 = load i64, i64* %12, align 8
  %188 = load i64, i64* %13, align 8
  %189 = add nsw i64 %187, %188
  store i64 %189, i64* %16, align 8
  %190 = load i64, i64* %12, align 8
  %191 = load i64, i64* %13, align 8
  %192 = sub nsw i64 %190, %191
  store i64 %192, i64* %17, align 8
  %193 = load i16*, i16** %24, align 8
  %194 = getelementptr inbounds i16, i16* %193, i64 56
  %195 = load i16, i16* %194, align 2
  %196 = sext i16 %195 to i32
  %197 = load i32*, i32** %25, align 8
  %198 = getelementptr inbounds i32, i32* %197, i64 56
  %199 = load i32, i32* %198, align 4
  %200 = mul nsw i32 %196, %199
  %201 = sext i32 %200 to i64
  store i64 %201, i64* %11, align 8
  %202 = load i16*, i16** %24, align 8
  %203 = getelementptr inbounds i16, i16* %202, i64 40
  %204 = load i16, i16* %203, align 2
  %205 = sext i16 %204 to i32
  %206 = load i32*, i32** %25, align 8
  %207 = getelementptr inbounds i32, i32* %206, i64 40
  %208 = load i32, i32* %207, align 4
  %209 = mul nsw i32 %205, %208
  %210 = sext i32 %209 to i64
  store i64 %210, i64* %12, align 8
  %211 = load i16*, i16** %24, align 8
  %212 = getelementptr inbounds i16, i16* %211, i64 24
  %213 = load i16, i16* %212, align 2
  %214 = sext i16 %213 to i32
  %215 = load i32*, i32** %25, align 8
  %216 = getelementptr inbounds i32, i32* %215, i64 24
  %217 = load i32, i32* %216, align 4
  %218 = mul nsw i32 %214, %217
  %219 = sext i32 %218 to i64
  store i64 %219, i64* %13, align 8
  %220 = load i16*, i16** %24, align 8
  %221 = getelementptr inbounds i16, i16* %220, i64 8
  %222 = load i16, i16* %221, align 2
  %223 = sext i16 %222 to i32
  %224 = load i32*, i32** %25, align 8
  %225 = getelementptr inbounds i32, i32* %224, i64 8
  %226 = load i32, i32* %225, align 4
  %227 = mul nsw i32 %223, %226
  %228 = sext i32 %227 to i64
  store i64 %228, i64* %14, align 8
  %229 = load i64, i64* %11, align 8
  %230 = load i64, i64* %14, align 8
  %231 = add nsw i64 %229, %230
  store i64 %231, i64* %19, align 8
  %232 = load i64, i64* %12, align 8
  %233 = load i64, i64* %13, align 8
  %234 = add nsw i64 %232, %233
  store i64 %234, i64* %20, align 8
  %235 = load i64, i64* %11, align 8
  %236 = load i64, i64* %13, align 8
  %237 = add nsw i64 %235, %236
  store i64 %237, i64* %21, align 8
  %238 = load i64, i64* %12, align 8
  %239 = load i64, i64* %14, align 8
  %240 = add nsw i64 %238, %239
  store i64 %240, i64* %22, align 8
  %241 = load i64, i64* %21, align 8
  %242 = load i64, i64* %22, align 8
  %243 = add nsw i64 %241, %242
  %244 = mul nsw i64 %243, 9633
  store i64 %244, i64* %23, align 8
  %245 = load i64, i64* %11, align 8
  %246 = mul nsw i64 %245, 2446
  store i64 %246, i64* %11, align 8
  %247 = load i64, i64* %12, align 8
  %248 = mul nsw i64 %247, 16819
  store i64 %248, i64* %12, align 8
  %249 = load i64, i64* %13, align 8
  %250 = mul nsw i64 %249, 25172
  store i64 %250, i64* %13, align 8
  %251 = load i64, i64* %14, align 8
  %252 = mul nsw i64 %251, 12299
  store i64 %252, i64* %14, align 8
  %253 = load i64, i64* %19, align 8
  %254 = mul nsw i64 %253, -7373
  store i64 %254, i64* %19, align 8
  %255 = load i64, i64* %20, align 8
  %256 = mul nsw i64 %255, -20995
  store i64 %256, i64* %20, align 8
  %257 = load i64, i64* %21, align 8
  %258 = mul nsw i64 %257, -16069
  store i64 %258, i64* %21, align 8
  %259 = load i64, i64* %22, align 8
  %260 = mul nsw i64 %259, -3196
  store i64 %260, i64* %22, align 8
  %261 = load i64, i64* %23, align 8
  %262 = load i64, i64* %21, align 8
  %263 = add nsw i64 %262, %261
  store i64 %263, i64* %21, align 8
  %264 = load i64, i64* %23, align 8
  %265 = load i64, i64* %22, align 8
  %266 = add nsw i64 %265, %264
  store i64 %266, i64* %22, align 8
  %267 = load i64, i64* %19, align 8
  %268 = load i64, i64* %21, align 8
  %269 = add nsw i64 %267, %268
  %270 = load i64, i64* %11, align 8
  %271 = add nsw i64 %270, %269
  store i64 %271, i64* %11, align 8
  %272 = load i64, i64* %20, align 8
  %273 = load i64, i64* %22, align 8
  %274 = add nsw i64 %272, %273
  %275 = load i64, i64* %12, align 8
  %276 = add nsw i64 %275, %274
  store i64 %276, i64* %12, align 8
  %277 = load i64, i64* %20, align 8
  %278 = load i64, i64* %21, align 8
  %279 = add nsw i64 %277, %278
  %280 = load i64, i64* %13, align 8
  %281 = add nsw i64 %280, %279
  store i64 %281, i64* %13, align 8
  %282 = load i64, i64* %19, align 8
  %283 = load i64, i64* %22, align 8
  %284 = add nsw i64 %282, %283
  %285 = load i64, i64* %14, align 8
  %286 = add nsw i64 %285, %284
  store i64 %286, i64* %14, align 8
  %287 = load i64, i64* %15, align 8
  %288 = load i64, i64* %14, align 8
  %289 = add nsw i64 %287, %288
  %290 = add nsw i64 %289, 1024
  %291 = ashr i64 %290, 11
  %292 = trunc i64 %291 to i32
  %293 = load i32*, i32** %26, align 8
  %294 = getelementptr inbounds i32, i32* %293, i64 0
  store i32 %292, i32* %294, align 4
  %295 = load i64, i64* %15, align 8
  %296 = load i64, i64* %14, align 8
  %297 = sub nsw i64 %295, %296
  %298 = add nsw i64 %297, 1024
  %299 = ashr i64 %298, 11
  %300 = trunc i64 %299 to i32
  %301 = load i32*, i32** %26, align 8
  %302 = getelementptr inbounds i32, i32* %301, i64 56
  store i32 %300, i32* %302, align 4
  %303 = load i64, i64* %16, align 8
  %304 = load i64, i64* %13, align 8
  %305 = add nsw i64 %303, %304
  %306 = add nsw i64 %305, 1024
  %307 = ashr i64 %306, 11
  %308 = trunc i64 %307 to i32
  %309 = load i32*, i32** %26, align 8
  %310 = getelementptr inbounds i32, i32* %309, i64 8
  store i32 %308, i32* %310, align 4
  %311 = load i64, i64* %16, align 8
  %312 = load i64, i64* %13, align 8
  %313 = sub nsw i64 %311, %312
  %314 = add nsw i64 %313, 1024
  %315 = ashr i64 %314, 11
  %316 = trunc i64 %315 to i32
  %317 = load i32*, i32** %26, align 8
  %318 = getelementptr inbounds i32, i32* %317, i64 48
  store i32 %316, i32* %318, align 4
  %319 = load i64, i64* %17, align 8
  %320 = load i64, i64* %12, align 8
  %321 = add nsw i64 %319, %320
  %322 = add nsw i64 %321, 1024
  %323 = ashr i64 %322, 11
  %324 = trunc i64 %323 to i32
  %325 = load i32*, i32** %26, align 8
  %326 = getelementptr inbounds i32, i32* %325, i64 16
  store i32 %324, i32* %326, align 4
  %327 = load i64, i64* %17, align 8
  %328 = load i64, i64* %12, align 8
  %329 = sub nsw i64 %327, %328
  %330 = add nsw i64 %329, 1024
  %331 = ashr i64 %330, 11
  %332 = trunc i64 %331 to i32
  %333 = load i32*, i32** %26, align 8
  %334 = getelementptr inbounds i32, i32* %333, i64 40
  store i32 %332, i32* %334, align 4
  %335 = load i64, i64* %18, align 8
  %336 = load i64, i64* %11, align 8
  %337 = add nsw i64 %335, %336
  %338 = add nsw i64 %337, 1024
  %339 = ashr i64 %338, 11
  %340 = trunc i64 %339 to i32
  %341 = load i32*, i32** %26, align 8
  %342 = getelementptr inbounds i32, i32* %341, i64 24
  store i32 %340, i32* %342, align 4
  %343 = load i64, i64* %18, align 8
  %344 = load i64, i64* %11, align 8
  %345 = sub nsw i64 %343, %344
  %346 = add nsw i64 %345, 1024
  %347 = ashr i64 %346, 11
  %348 = trunc i64 %347 to i32
  %349 = load i32*, i32** %26, align 8
  %350 = getelementptr inbounds i32, i32* %349, i64 32
  store i32 %348, i32* %350, align 4
  %351 = load i16*, i16** %24, align 8
  %352 = getelementptr inbounds i16, i16* %351, i32 1
  store i16* %352, i16** %24, align 8
  %353 = load i32*, i32** %25, align 8
  %354 = getelementptr inbounds i32, i32* %353, i32 1
  store i32* %354, i32** %25, align 8
  %355 = load i32*, i32** %26, align 8
  %356 = getelementptr inbounds i32, i32* %355, i32 1
  store i32* %356, i32** %26, align 8
  br label %357

; <label>:357:                                    ; preds = %123, %82
  %358 = load i32, i32* %29, align 4
  %359 = add nsw i32 %358, -1
  store i32 %359, i32* %29, align 4
  br label %43

; <label>:360:                                    ; preds = %43
  %361 = getelementptr inbounds [64 x i32], [64 x i32]* %30, i32 0, i32 0
  store i32* %361, i32** %26, align 8
  store i32 0, i32* %29, align 4
  br label %362

; <label>:362:                                    ; preds = %676, %360
  %363 = load i32, i32* %29, align 4
  %364 = icmp slt i32 %363, 8
  br i1 %364, label %365, label %679

; <label>:365:                                    ; preds = %362
  %366 = load i8**, i8*** %9, align 8
  %367 = load i32, i32* %29, align 4
  %368 = sext i32 %367 to i64
  %369 = getelementptr inbounds i8*, i8** %366, i64 %368
  %370 = load i8*, i8** %369, align 8
  %371 = load i32, i32* %10, align 4
  %372 = zext i32 %371 to i64
  %373 = getelementptr inbounds i8, i8* %370, i64 %372
  store i8* %373, i8** %27, align 8
  %374 = load i32*, i32** %26, align 8
  %375 = getelementptr inbounds i32, i32* %374, i64 1
  %376 = load i32, i32* %375, align 4
  %377 = load i32*, i32** %26, align 8
  %378 = getelementptr inbounds i32, i32* %377, i64 2
  %379 = load i32, i32* %378, align 4
  %380 = or i32 %376, %379
  %381 = load i32*, i32** %26, align 8
  %382 = getelementptr inbounds i32, i32* %381, i64 3
  %383 = load i32, i32* %382, align 4
  %384 = or i32 %380, %383
  %385 = load i32*, i32** %26, align 8
  %386 = getelementptr inbounds i32, i32* %385, i64 4
  %387 = load i32, i32* %386, align 4
  %388 = or i32 %384, %387
  %389 = load i32*, i32** %26, align 8
  %390 = getelementptr inbounds i32, i32* %389, i64 5
  %391 = load i32, i32* %390, align 4
  %392 = or i32 %388, %391
  %393 = load i32*, i32** %26, align 8
  %394 = getelementptr inbounds i32, i32* %393, i64 6
  %395 = load i32, i32* %394, align 4
  %396 = or i32 %392, %395
  %397 = load i32*, i32** %26, align 8
  %398 = getelementptr inbounds i32, i32* %397, i64 7
  %399 = load i32, i32* %398, align 4
  %400 = or i32 %396, %399
  %401 = icmp eq i32 %400, 0
  br i1 %401, label %402, label %442

; <label>:402:                                    ; preds = %365
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_islow, i64 0, i64 3)
  %403 = add i64 %pgocount2, 1
  store i64 %403, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_islow, i64 0, i64 3)
  %404 = load i8*, i8** %28, align 8
  %405 = load i32*, i32** %26, align 8
  %406 = getelementptr inbounds i32, i32* %405, i64 0
  %407 = load i32, i32* %406, align 4
  %408 = sext i32 %407 to i64
  %409 = add nsw i64 %408, 16
  %410 = ashr i64 %409, 5
  %411 = trunc i64 %410 to i32
  %412 = and i32 %411, 1023
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds i8, i8* %404, i64 %413
  %415 = load i8, i8* %414, align 1
  store i8 %415, i8* %32, align 1
  %416 = load i8, i8* %32, align 1
  %417 = load i8*, i8** %27, align 8
  %418 = getelementptr inbounds i8, i8* %417, i64 0
  store i8 %416, i8* %418, align 1
  %419 = load i8, i8* %32, align 1
  %420 = load i8*, i8** %27, align 8
  %421 = getelementptr inbounds i8, i8* %420, i64 1
  store i8 %419, i8* %421, align 1
  %422 = load i8, i8* %32, align 1
  %423 = load i8*, i8** %27, align 8
  %424 = getelementptr inbounds i8, i8* %423, i64 2
  store i8 %422, i8* %424, align 1
  %425 = load i8, i8* %32, align 1
  %426 = load i8*, i8** %27, align 8
  %427 = getelementptr inbounds i8, i8* %426, i64 3
  store i8 %425, i8* %427, align 1
  %428 = load i8, i8* %32, align 1
  %429 = load i8*, i8** %27, align 8
  %430 = getelementptr inbounds i8, i8* %429, i64 4
  store i8 %428, i8* %430, align 1
  %431 = load i8, i8* %32, align 1
  %432 = load i8*, i8** %27, align 8
  %433 = getelementptr inbounds i8, i8* %432, i64 5
  store i8 %431, i8* %433, align 1
  %434 = load i8, i8* %32, align 1
  %435 = load i8*, i8** %27, align 8
  %436 = getelementptr inbounds i8, i8* %435, i64 6
  store i8 %434, i8* %436, align 1
  %437 = load i8, i8* %32, align 1
  %438 = load i8*, i8** %27, align 8
  %439 = getelementptr inbounds i8, i8* %438, i64 7
  store i8 %437, i8* %439, align 1
  %440 = load i32*, i32** %26, align 8
  %441 = getelementptr inbounds i32, i32* %440, i64 8
  store i32* %441, i32** %26, align 8
  br label %676

; <label>:442:                                    ; preds = %365
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_islow, i64 0, i64 1)
  %443 = add i64 %pgocount3, 1
  store i64 %443, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_islow, i64 0, i64 1)
  %444 = load i32*, i32** %26, align 8
  %445 = getelementptr inbounds i32, i32* %444, i64 2
  %446 = load i32, i32* %445, align 4
  %447 = sext i32 %446 to i64
  store i64 %447, i64* %20, align 8
  %448 = load i32*, i32** %26, align 8
  %449 = getelementptr inbounds i32, i32* %448, i64 6
  %450 = load i32, i32* %449, align 4
  %451 = sext i32 %450 to i64
  store i64 %451, i64* %21, align 8
  %452 = load i64, i64* %20, align 8
  %453 = load i64, i64* %21, align 8
  %454 = add nsw i64 %452, %453
  %455 = mul nsw i64 %454, 4433
  store i64 %455, i64* %19, align 8
  %456 = load i64, i64* %19, align 8
  %457 = load i64, i64* %21, align 8
  %458 = mul nsw i64 %457, -15137
  %459 = add nsw i64 %456, %458
  store i64 %459, i64* %13, align 8
  %460 = load i64, i64* %19, align 8
  %461 = load i64, i64* %20, align 8
  %462 = mul nsw i64 %461, 6270
  %463 = add nsw i64 %460, %462
  store i64 %463, i64* %14, align 8
  %464 = load i32*, i32** %26, align 8
  %465 = getelementptr inbounds i32, i32* %464, i64 0
  %466 = load i32, i32* %465, align 4
  %467 = sext i32 %466 to i64
  %468 = load i32*, i32** %26, align 8
  %469 = getelementptr inbounds i32, i32* %468, i64 4
  %470 = load i32, i32* %469, align 4
  %471 = sext i32 %470 to i64
  %472 = add nsw i64 %467, %471
  %473 = shl i64 %472, 13
  store i64 %473, i64* %11, align 8
  %474 = load i32*, i32** %26, align 8
  %475 = getelementptr inbounds i32, i32* %474, i64 0
  %476 = load i32, i32* %475, align 4
  %477 = sext i32 %476 to i64
  %478 = load i32*, i32** %26, align 8
  %479 = getelementptr inbounds i32, i32* %478, i64 4
  %480 = load i32, i32* %479, align 4
  %481 = sext i32 %480 to i64
  %482 = sub nsw i64 %477, %481
  %483 = shl i64 %482, 13
  store i64 %483, i64* %12, align 8
  %484 = load i64, i64* %11, align 8
  %485 = load i64, i64* %14, align 8
  %486 = add nsw i64 %484, %485
  store i64 %486, i64* %15, align 8
  %487 = load i64, i64* %11, align 8
  %488 = load i64, i64* %14, align 8
  %489 = sub nsw i64 %487, %488
  store i64 %489, i64* %18, align 8
  %490 = load i64, i64* %12, align 8
  %491 = load i64, i64* %13, align 8
  %492 = add nsw i64 %490, %491
  store i64 %492, i64* %16, align 8
  %493 = load i64, i64* %12, align 8
  %494 = load i64, i64* %13, align 8
  %495 = sub nsw i64 %493, %494
  store i64 %495, i64* %17, align 8
  %496 = load i32*, i32** %26, align 8
  %497 = getelementptr inbounds i32, i32* %496, i64 7
  %498 = load i32, i32* %497, align 4
  %499 = sext i32 %498 to i64
  store i64 %499, i64* %11, align 8
  %500 = load i32*, i32** %26, align 8
  %501 = getelementptr inbounds i32, i32* %500, i64 5
  %502 = load i32, i32* %501, align 4
  %503 = sext i32 %502 to i64
  store i64 %503, i64* %12, align 8
  %504 = load i32*, i32** %26, align 8
  %505 = getelementptr inbounds i32, i32* %504, i64 3
  %506 = load i32, i32* %505, align 4
  %507 = sext i32 %506 to i64
  store i64 %507, i64* %13, align 8
  %508 = load i32*, i32** %26, align 8
  %509 = getelementptr inbounds i32, i32* %508, i64 1
  %510 = load i32, i32* %509, align 4
  %511 = sext i32 %510 to i64
  store i64 %511, i64* %14, align 8
  %512 = load i64, i64* %11, align 8
  %513 = load i64, i64* %14, align 8
  %514 = add nsw i64 %512, %513
  store i64 %514, i64* %19, align 8
  %515 = load i64, i64* %12, align 8
  %516 = load i64, i64* %13, align 8
  %517 = add nsw i64 %515, %516
  store i64 %517, i64* %20, align 8
  %518 = load i64, i64* %11, align 8
  %519 = load i64, i64* %13, align 8
  %520 = add nsw i64 %518, %519
  store i64 %520, i64* %21, align 8
  %521 = load i64, i64* %12, align 8
  %522 = load i64, i64* %14, align 8
  %523 = add nsw i64 %521, %522
  store i64 %523, i64* %22, align 8
  %524 = load i64, i64* %21, align 8
  %525 = load i64, i64* %22, align 8
  %526 = add nsw i64 %524, %525
  %527 = mul nsw i64 %526, 9633
  store i64 %527, i64* %23, align 8
  %528 = load i64, i64* %11, align 8
  %529 = mul nsw i64 %528, 2446
  store i64 %529, i64* %11, align 8
  %530 = load i64, i64* %12, align 8
  %531 = mul nsw i64 %530, 16819
  store i64 %531, i64* %12, align 8
  %532 = load i64, i64* %13, align 8
  %533 = mul nsw i64 %532, 25172
  store i64 %533, i64* %13, align 8
  %534 = load i64, i64* %14, align 8
  %535 = mul nsw i64 %534, 12299
  store i64 %535, i64* %14, align 8
  %536 = load i64, i64* %19, align 8
  %537 = mul nsw i64 %536, -7373
  store i64 %537, i64* %19, align 8
  %538 = load i64, i64* %20, align 8
  %539 = mul nsw i64 %538, -20995
  store i64 %539, i64* %20, align 8
  %540 = load i64, i64* %21, align 8
  %541 = mul nsw i64 %540, -16069
  store i64 %541, i64* %21, align 8
  %542 = load i64, i64* %22, align 8
  %543 = mul nsw i64 %542, -3196
  store i64 %543, i64* %22, align 8
  %544 = load i64, i64* %23, align 8
  %545 = load i64, i64* %21, align 8
  %546 = add nsw i64 %545, %544
  store i64 %546, i64* %21, align 8
  %547 = load i64, i64* %23, align 8
  %548 = load i64, i64* %22, align 8
  %549 = add nsw i64 %548, %547
  store i64 %549, i64* %22, align 8
  %550 = load i64, i64* %19, align 8
  %551 = load i64, i64* %21, align 8
  %552 = add nsw i64 %550, %551
  %553 = load i64, i64* %11, align 8
  %554 = add nsw i64 %553, %552
  store i64 %554, i64* %11, align 8
  %555 = load i64, i64* %20, align 8
  %556 = load i64, i64* %22, align 8
  %557 = add nsw i64 %555, %556
  %558 = load i64, i64* %12, align 8
  %559 = add nsw i64 %558, %557
  store i64 %559, i64* %12, align 8
  %560 = load i64, i64* %20, align 8
  %561 = load i64, i64* %21, align 8
  %562 = add nsw i64 %560, %561
  %563 = load i64, i64* %13, align 8
  %564 = add nsw i64 %563, %562
  store i64 %564, i64* %13, align 8
  %565 = load i64, i64* %19, align 8
  %566 = load i64, i64* %22, align 8
  %567 = add nsw i64 %565, %566
  %568 = load i64, i64* %14, align 8
  %569 = add nsw i64 %568, %567
  store i64 %569, i64* %14, align 8
  %570 = load i8*, i8** %28, align 8
  %571 = load i64, i64* %15, align 8
  %572 = load i64, i64* %14, align 8
  %573 = add nsw i64 %571, %572
  %574 = add nsw i64 %573, 131072
  %575 = ashr i64 %574, 18
  %576 = trunc i64 %575 to i32
  %577 = and i32 %576, 1023
  %578 = sext i32 %577 to i64
  %579 = getelementptr inbounds i8, i8* %570, i64 %578
  %580 = load i8, i8* %579, align 1
  %581 = load i8*, i8** %27, align 8
  %582 = getelementptr inbounds i8, i8* %581, i64 0
  store i8 %580, i8* %582, align 1
  %583 = load i8*, i8** %28, align 8
  %584 = load i64, i64* %15, align 8
  %585 = load i64, i64* %14, align 8
  %586 = sub nsw i64 %584, %585
  %587 = add nsw i64 %586, 131072
  %588 = ashr i64 %587, 18
  %589 = trunc i64 %588 to i32
  %590 = and i32 %589, 1023
  %591 = sext i32 %590 to i64
  %592 = getelementptr inbounds i8, i8* %583, i64 %591
  %593 = load i8, i8* %592, align 1
  %594 = load i8*, i8** %27, align 8
  %595 = getelementptr inbounds i8, i8* %594, i64 7
  store i8 %593, i8* %595, align 1
  %596 = load i8*, i8** %28, align 8
  %597 = load i64, i64* %16, align 8
  %598 = load i64, i64* %13, align 8
  %599 = add nsw i64 %597, %598
  %600 = add nsw i64 %599, 131072
  %601 = ashr i64 %600, 18
  %602 = trunc i64 %601 to i32
  %603 = and i32 %602, 1023
  %604 = sext i32 %603 to i64
  %605 = getelementptr inbounds i8, i8* %596, i64 %604
  %606 = load i8, i8* %605, align 1
  %607 = load i8*, i8** %27, align 8
  %608 = getelementptr inbounds i8, i8* %607, i64 1
  store i8 %606, i8* %608, align 1
  %609 = load i8*, i8** %28, align 8
  %610 = load i64, i64* %16, align 8
  %611 = load i64, i64* %13, align 8
  %612 = sub nsw i64 %610, %611
  %613 = add nsw i64 %612, 131072
  %614 = ashr i64 %613, 18
  %615 = trunc i64 %614 to i32
  %616 = and i32 %615, 1023
  %617 = sext i32 %616 to i64
  %618 = getelementptr inbounds i8, i8* %609, i64 %617
  %619 = load i8, i8* %618, align 1
  %620 = load i8*, i8** %27, align 8
  %621 = getelementptr inbounds i8, i8* %620, i64 6
  store i8 %619, i8* %621, align 1
  %622 = load i8*, i8** %28, align 8
  %623 = load i64, i64* %17, align 8
  %624 = load i64, i64* %12, align 8
  %625 = add nsw i64 %623, %624
  %626 = add nsw i64 %625, 131072
  %627 = ashr i64 %626, 18
  %628 = trunc i64 %627 to i32
  %629 = and i32 %628, 1023
  %630 = sext i32 %629 to i64
  %631 = getelementptr inbounds i8, i8* %622, i64 %630
  %632 = load i8, i8* %631, align 1
  %633 = load i8*, i8** %27, align 8
  %634 = getelementptr inbounds i8, i8* %633, i64 2
  store i8 %632, i8* %634, align 1
  %635 = load i8*, i8** %28, align 8
  %636 = load i64, i64* %17, align 8
  %637 = load i64, i64* %12, align 8
  %638 = sub nsw i64 %636, %637
  %639 = add nsw i64 %638, 131072
  %640 = ashr i64 %639, 18
  %641 = trunc i64 %640 to i32
  %642 = and i32 %641, 1023
  %643 = sext i32 %642 to i64
  %644 = getelementptr inbounds i8, i8* %635, i64 %643
  %645 = load i8, i8* %644, align 1
  %646 = load i8*, i8** %27, align 8
  %647 = getelementptr inbounds i8, i8* %646, i64 5
  store i8 %645, i8* %647, align 1
  %648 = load i8*, i8** %28, align 8
  %649 = load i64, i64* %18, align 8
  %650 = load i64, i64* %11, align 8
  %651 = add nsw i64 %649, %650
  %652 = add nsw i64 %651, 131072
  %653 = ashr i64 %652, 18
  %654 = trunc i64 %653 to i32
  %655 = and i32 %654, 1023
  %656 = sext i32 %655 to i64
  %657 = getelementptr inbounds i8, i8* %648, i64 %656
  %658 = load i8, i8* %657, align 1
  %659 = load i8*, i8** %27, align 8
  %660 = getelementptr inbounds i8, i8* %659, i64 3
  store i8 %658, i8* %660, align 1
  %661 = load i8*, i8** %28, align 8
  %662 = load i64, i64* %18, align 8
  %663 = load i64, i64* %11, align 8
  %664 = sub nsw i64 %662, %663
  %665 = add nsw i64 %664, 131072
  %666 = ashr i64 %665, 18
  %667 = trunc i64 %666 to i32
  %668 = and i32 %667, 1023
  %669 = sext i32 %668 to i64
  %670 = getelementptr inbounds i8, i8* %661, i64 %669
  %671 = load i8, i8* %670, align 1
  %672 = load i8*, i8** %27, align 8
  %673 = getelementptr inbounds i8, i8* %672, i64 4
  store i8 %671, i8* %673, align 1
  %674 = load i32*, i32** %26, align 8
  %675 = getelementptr inbounds i32, i32* %674, i64 8
  store i32* %675, i32** %26, align 8
  br label %676

; <label>:676:                                    ; preds = %442, %402
  %677 = load i32, i32* %29, align 4
  %678 = add nsw i32 %677, 1
  store i32 %678, i32* %29, align 4
  br label %362

; <label>:679:                                    ; preds = %362
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_islow, i64 0, i64 4)
  %680 = add i64 %pgocount4, 1
  store i64 %680, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_islow, i64 0, i64 4)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
