; ModuleID = 'jidctfst.2.ll'
source_filename = "jidctfst.c"
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
@__profn_jpeg_idct_ifast = private constant [15 x i8] c"jpeg_idct_ifast"
@__profc_jpeg_idct_ifast = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_idct_ifast = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4382171438121426023, i64 78535273468, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_ifast, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* @jpeg_idct_ifast to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [25 x i8] c"\0F\17x\DA\CB*HM\8F\CFLI.\89\CFLK,.\01\000\AD\06 ", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_idct_ifast to i8*), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jpeg_idct_ifast(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32) #0 {
  %6 = alloca %struct.jpeg_decompress_struct*, align 8
  %7 = alloca %struct.jpeg_component_info*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i8**, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i16*, align 8
  %29 = alloca i32*, align 8
  %30 = alloca i32*, align 8
  %31 = alloca i8*, align 8
  %32 = alloca i8*, align 8
  %33 = alloca i32, align 4
  %34 = alloca [64 x i32], align 16
  %35 = alloca i32, align 4
  %36 = alloca i8, align 1
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %6, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %7, align 8
  store i16* %2, i16** %8, align 8
  store i8** %3, i8*** %9, align 8
  store i32 %4, i32* %10, align 4
  %37 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %37, i32 0, i32 61
  %39 = load i8*, i8** %38, align 8
  %40 = getelementptr inbounds i8, i8* %39, i64 128
  store i8* %40, i8** %32, align 8
  %41 = load i16*, i16** %8, align 8
  store i16* %41, i16** %28, align 8
  %42 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %43 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %42, i32 0, i32 20
  %44 = load i8*, i8** %43, align 8
  %45 = bitcast i8* %44 to i32*
  store i32* %45, i32** %29, align 8
  %46 = getelementptr inbounds [64 x i32], [64 x i32]* %34, i32 0, i32 0
  store i32* %46, i32** %30, align 8
  store i32 8, i32* %33, align 4
  br label %47

; <label>:47:                                     ; preds = %320, %5
  %48 = load i32, i32* %33, align 4
  %49 = icmp sgt i32 %48, 0
  br i1 %49, label %50, label %323

; <label>:50:                                     ; preds = %47
  %51 = load i16*, i16** %28, align 8
  %52 = getelementptr inbounds i16, i16* %51, i64 8
  %53 = load i16, i16* %52, align 2
  %54 = sext i16 %53 to i32
  %55 = load i16*, i16** %28, align 8
  %56 = getelementptr inbounds i16, i16* %55, i64 16
  %57 = load i16, i16* %56, align 2
  %58 = sext i16 %57 to i32
  %59 = or i32 %54, %58
  %60 = load i16*, i16** %28, align 8
  %61 = getelementptr inbounds i16, i16* %60, i64 24
  %62 = load i16, i16* %61, align 2
  %63 = sext i16 %62 to i32
  %64 = or i32 %59, %63
  %65 = load i16*, i16** %28, align 8
  %66 = getelementptr inbounds i16, i16* %65, i64 32
  %67 = load i16, i16* %66, align 2
  %68 = sext i16 %67 to i32
  %69 = or i32 %64, %68
  %70 = load i16*, i16** %28, align 8
  %71 = getelementptr inbounds i16, i16* %70, i64 40
  %72 = load i16, i16* %71, align 2
  %73 = sext i16 %72 to i32
  %74 = or i32 %69, %73
  %75 = load i16*, i16** %28, align 8
  %76 = getelementptr inbounds i16, i16* %75, i64 48
  %77 = load i16, i16* %76, align 2
  %78 = sext i16 %77 to i32
  %79 = or i32 %74, %78
  %80 = load i16*, i16** %28, align 8
  %81 = getelementptr inbounds i16, i16* %80, i64 56
  %82 = load i16, i16* %81, align 2
  %83 = sext i16 %82 to i32
  %84 = or i32 %79, %83
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %86, label %126

; <label>:86:                                     ; preds = %50
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_ifast, i64 0, i64 2)
  %87 = add i64 %pgocount, 1
  store i64 %87, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_ifast, i64 0, i64 2)
  %88 = load i16*, i16** %28, align 8
  %89 = getelementptr inbounds i16, i16* %88, i64 0
  %90 = load i16, i16* %89, align 2
  %91 = sext i16 %90 to i32
  %92 = load i32*, i32** %29, align 8
  %93 = getelementptr inbounds i32, i32* %92, i64 0
  %94 = load i32, i32* %93, align 4
  %95 = mul nsw i32 %91, %94
  store i32 %95, i32* %35, align 4
  %96 = load i32, i32* %35, align 4
  %97 = load i32*, i32** %30, align 8
  %98 = getelementptr inbounds i32, i32* %97, i64 0
  store i32 %96, i32* %98, align 4
  %99 = load i32, i32* %35, align 4
  %100 = load i32*, i32** %30, align 8
  %101 = getelementptr inbounds i32, i32* %100, i64 8
  store i32 %99, i32* %101, align 4
  %102 = load i32, i32* %35, align 4
  %103 = load i32*, i32** %30, align 8
  %104 = getelementptr inbounds i32, i32* %103, i64 16
  store i32 %102, i32* %104, align 4
  %105 = load i32, i32* %35, align 4
  %106 = load i32*, i32** %30, align 8
  %107 = getelementptr inbounds i32, i32* %106, i64 24
  store i32 %105, i32* %107, align 4
  %108 = load i32, i32* %35, align 4
  %109 = load i32*, i32** %30, align 8
  %110 = getelementptr inbounds i32, i32* %109, i64 32
  store i32 %108, i32* %110, align 4
  %111 = load i32, i32* %35, align 4
  %112 = load i32*, i32** %30, align 8
  %113 = getelementptr inbounds i32, i32* %112, i64 40
  store i32 %111, i32* %113, align 4
  %114 = load i32, i32* %35, align 4
  %115 = load i32*, i32** %30, align 8
  %116 = getelementptr inbounds i32, i32* %115, i64 48
  store i32 %114, i32* %116, align 4
  %117 = load i32, i32* %35, align 4
  %118 = load i32*, i32** %30, align 8
  %119 = getelementptr inbounds i32, i32* %118, i64 56
  store i32 %117, i32* %119, align 4
  %120 = load i16*, i16** %28, align 8
  %121 = getelementptr inbounds i16, i16* %120, i32 1
  store i16* %121, i16** %28, align 8
  %122 = load i32*, i32** %29, align 8
  %123 = getelementptr inbounds i32, i32* %122, i32 1
  store i32* %123, i32** %29, align 8
  %124 = load i32*, i32** %30, align 8
  %125 = getelementptr inbounds i32, i32* %124, i32 1
  store i32* %125, i32** %30, align 8
  br label %320

; <label>:126:                                    ; preds = %50
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_ifast, i64 0, i64 0)
  %127 = add i64 %pgocount1, 1
  store i64 %127, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_ifast, i64 0, i64 0)
  %128 = load i16*, i16** %28, align 8
  %129 = getelementptr inbounds i16, i16* %128, i64 0
  %130 = load i16, i16* %129, align 2
  %131 = sext i16 %130 to i32
  %132 = load i32*, i32** %29, align 8
  %133 = getelementptr inbounds i32, i32* %132, i64 0
  %134 = load i32, i32* %133, align 4
  %135 = mul nsw i32 %131, %134
  store i32 %135, i32* %11, align 4
  %136 = load i16*, i16** %28, align 8
  %137 = getelementptr inbounds i16, i16* %136, i64 16
  %138 = load i16, i16* %137, align 2
  %139 = sext i16 %138 to i32
  %140 = load i32*, i32** %29, align 8
  %141 = getelementptr inbounds i32, i32* %140, i64 16
  %142 = load i32, i32* %141, align 4
  %143 = mul nsw i32 %139, %142
  store i32 %143, i32* %12, align 4
  %144 = load i16*, i16** %28, align 8
  %145 = getelementptr inbounds i16, i16* %144, i64 32
  %146 = load i16, i16* %145, align 2
  %147 = sext i16 %146 to i32
  %148 = load i32*, i32** %29, align 8
  %149 = getelementptr inbounds i32, i32* %148, i64 32
  %150 = load i32, i32* %149, align 4
  %151 = mul nsw i32 %147, %150
  store i32 %151, i32* %13, align 4
  %152 = load i16*, i16** %28, align 8
  %153 = getelementptr inbounds i16, i16* %152, i64 48
  %154 = load i16, i16* %153, align 2
  %155 = sext i16 %154 to i32
  %156 = load i32*, i32** %29, align 8
  %157 = getelementptr inbounds i32, i32* %156, i64 48
  %158 = load i32, i32* %157, align 4
  %159 = mul nsw i32 %155, %158
  store i32 %159, i32* %14, align 4
  %160 = load i32, i32* %11, align 4
  %161 = load i32, i32* %13, align 4
  %162 = add nsw i32 %160, %161
  store i32 %162, i32* %19, align 4
  %163 = load i32, i32* %11, align 4
  %164 = load i32, i32* %13, align 4
  %165 = sub nsw i32 %163, %164
  store i32 %165, i32* %20, align 4
  %166 = load i32, i32* %12, align 4
  %167 = load i32, i32* %14, align 4
  %168 = add nsw i32 %166, %167
  store i32 %168, i32* %22, align 4
  %169 = load i32, i32* %12, align 4
  %170 = load i32, i32* %14, align 4
  %171 = sub nsw i32 %169, %170
  %172 = sext i32 %171 to i64
  %173 = mul nsw i64 %172, 362
  %174 = ashr i64 %173, 8
  %175 = trunc i64 %174 to i32
  %176 = load i32, i32* %22, align 4
  %177 = sub nsw i32 %175, %176
  store i32 %177, i32* %21, align 4
  %178 = load i32, i32* %19, align 4
  %179 = load i32, i32* %22, align 4
  %180 = add nsw i32 %178, %179
  store i32 %180, i32* %11, align 4
  %181 = load i32, i32* %19, align 4
  %182 = load i32, i32* %22, align 4
  %183 = sub nsw i32 %181, %182
  store i32 %183, i32* %14, align 4
  %184 = load i32, i32* %20, align 4
  %185 = load i32, i32* %21, align 4
  %186 = add nsw i32 %184, %185
  store i32 %186, i32* %12, align 4
  %187 = load i32, i32* %20, align 4
  %188 = load i32, i32* %21, align 4
  %189 = sub nsw i32 %187, %188
  store i32 %189, i32* %13, align 4
  %190 = load i16*, i16** %28, align 8
  %191 = getelementptr inbounds i16, i16* %190, i64 8
  %192 = load i16, i16* %191, align 2
  %193 = sext i16 %192 to i32
  %194 = load i32*, i32** %29, align 8
  %195 = getelementptr inbounds i32, i32* %194, i64 8
  %196 = load i32, i32* %195, align 4
  %197 = mul nsw i32 %193, %196
  store i32 %197, i32* %15, align 4
  %198 = load i16*, i16** %28, align 8
  %199 = getelementptr inbounds i16, i16* %198, i64 24
  %200 = load i16, i16* %199, align 2
  %201 = sext i16 %200 to i32
  %202 = load i32*, i32** %29, align 8
  %203 = getelementptr inbounds i32, i32* %202, i64 24
  %204 = load i32, i32* %203, align 4
  %205 = mul nsw i32 %201, %204
  store i32 %205, i32* %16, align 4
  %206 = load i16*, i16** %28, align 8
  %207 = getelementptr inbounds i16, i16* %206, i64 40
  %208 = load i16, i16* %207, align 2
  %209 = sext i16 %208 to i32
  %210 = load i32*, i32** %29, align 8
  %211 = getelementptr inbounds i32, i32* %210, i64 40
  %212 = load i32, i32* %211, align 4
  %213 = mul nsw i32 %209, %212
  store i32 %213, i32* %17, align 4
  %214 = load i16*, i16** %28, align 8
  %215 = getelementptr inbounds i16, i16* %214, i64 56
  %216 = load i16, i16* %215, align 2
  %217 = sext i16 %216 to i32
  %218 = load i32*, i32** %29, align 8
  %219 = getelementptr inbounds i32, i32* %218, i64 56
  %220 = load i32, i32* %219, align 4
  %221 = mul nsw i32 %217, %220
  store i32 %221, i32* %18, align 4
  %222 = load i32, i32* %17, align 4
  %223 = load i32, i32* %16, align 4
  %224 = add nsw i32 %222, %223
  store i32 %224, i32* %27, align 4
  %225 = load i32, i32* %17, align 4
  %226 = load i32, i32* %16, align 4
  %227 = sub nsw i32 %225, %226
  store i32 %227, i32* %24, align 4
  %228 = load i32, i32* %15, align 4
  %229 = load i32, i32* %18, align 4
  %230 = add nsw i32 %228, %229
  store i32 %230, i32* %25, align 4
  %231 = load i32, i32* %15, align 4
  %232 = load i32, i32* %18, align 4
  %233 = sub nsw i32 %231, %232
  store i32 %233, i32* %26, align 4
  %234 = load i32, i32* %25, align 4
  %235 = load i32, i32* %27, align 4
  %236 = add nsw i32 %234, %235
  store i32 %236, i32* %18, align 4
  %237 = load i32, i32* %25, align 4
  %238 = load i32, i32* %27, align 4
  %239 = sub nsw i32 %237, %238
  %240 = sext i32 %239 to i64
  %241 = mul nsw i64 %240, 362
  %242 = ashr i64 %241, 8
  %243 = trunc i64 %242 to i32
  store i32 %243, i32* %20, align 4
  %244 = load i32, i32* %24, align 4
  %245 = load i32, i32* %26, align 4
  %246 = add nsw i32 %244, %245
  %247 = sext i32 %246 to i64
  %248 = mul nsw i64 %247, 473
  %249 = ashr i64 %248, 8
  %250 = trunc i64 %249 to i32
  store i32 %250, i32* %23, align 4
  %251 = load i32, i32* %26, align 4
  %252 = sext i32 %251 to i64
  %253 = mul nsw i64 %252, 277
  %254 = ashr i64 %253, 8
  %255 = trunc i64 %254 to i32
  %256 = load i32, i32* %23, align 4
  %257 = sub nsw i32 %255, %256
  store i32 %257, i32* %19, align 4
  %258 = load i32, i32* %24, align 4
  %259 = sext i32 %258 to i64
  %260 = mul nsw i64 %259, -669
  %261 = ashr i64 %260, 8
  %262 = trunc i64 %261 to i32
  %263 = load i32, i32* %23, align 4
  %264 = add nsw i32 %262, %263
  store i32 %264, i32* %21, align 4
  %265 = load i32, i32* %21, align 4
  %266 = load i32, i32* %18, align 4
  %267 = sub nsw i32 %265, %266
  store i32 %267, i32* %17, align 4
  %268 = load i32, i32* %20, align 4
  %269 = load i32, i32* %17, align 4
  %270 = sub nsw i32 %268, %269
  store i32 %270, i32* %16, align 4
  %271 = load i32, i32* %19, align 4
  %272 = load i32, i32* %16, align 4
  %273 = add nsw i32 %271, %272
  store i32 %273, i32* %15, align 4
  %274 = load i32, i32* %11, align 4
  %275 = load i32, i32* %18, align 4
  %276 = add nsw i32 %274, %275
  %277 = load i32*, i32** %30, align 8
  %278 = getelementptr inbounds i32, i32* %277, i64 0
  store i32 %276, i32* %278, align 4
  %279 = load i32, i32* %11, align 4
  %280 = load i32, i32* %18, align 4
  %281 = sub nsw i32 %279, %280
  %282 = load i32*, i32** %30, align 8
  %283 = getelementptr inbounds i32, i32* %282, i64 56
  store i32 %281, i32* %283, align 4
  %284 = load i32, i32* %12, align 4
  %285 = load i32, i32* %17, align 4
  %286 = add nsw i32 %284, %285
  %287 = load i32*, i32** %30, align 8
  %288 = getelementptr inbounds i32, i32* %287, i64 8
  store i32 %286, i32* %288, align 4
  %289 = load i32, i32* %12, align 4
  %290 = load i32, i32* %17, align 4
  %291 = sub nsw i32 %289, %290
  %292 = load i32*, i32** %30, align 8
  %293 = getelementptr inbounds i32, i32* %292, i64 48
  store i32 %291, i32* %293, align 4
  %294 = load i32, i32* %13, align 4
  %295 = load i32, i32* %16, align 4
  %296 = add nsw i32 %294, %295
  %297 = load i32*, i32** %30, align 8
  %298 = getelementptr inbounds i32, i32* %297, i64 16
  store i32 %296, i32* %298, align 4
  %299 = load i32, i32* %13, align 4
  %300 = load i32, i32* %16, align 4
  %301 = sub nsw i32 %299, %300
  %302 = load i32*, i32** %30, align 8
  %303 = getelementptr inbounds i32, i32* %302, i64 40
  store i32 %301, i32* %303, align 4
  %304 = load i32, i32* %14, align 4
  %305 = load i32, i32* %15, align 4
  %306 = add nsw i32 %304, %305
  %307 = load i32*, i32** %30, align 8
  %308 = getelementptr inbounds i32, i32* %307, i64 32
  store i32 %306, i32* %308, align 4
  %309 = load i32, i32* %14, align 4
  %310 = load i32, i32* %15, align 4
  %311 = sub nsw i32 %309, %310
  %312 = load i32*, i32** %30, align 8
  %313 = getelementptr inbounds i32, i32* %312, i64 24
  store i32 %311, i32* %313, align 4
  %314 = load i16*, i16** %28, align 8
  %315 = getelementptr inbounds i16, i16* %314, i32 1
  store i16* %315, i16** %28, align 8
  %316 = load i32*, i32** %29, align 8
  %317 = getelementptr inbounds i32, i32* %316, i32 1
  store i32* %317, i32** %29, align 8
  %318 = load i32*, i32** %30, align 8
  %319 = getelementptr inbounds i32, i32* %318, i32 1
  store i32* %319, i32** %30, align 8
  br label %320

; <label>:320:                                    ; preds = %126, %86
  %321 = load i32, i32* %33, align 4
  %322 = add nsw i32 %321, -1
  store i32 %322, i32* %33, align 4
  br label %47

; <label>:323:                                    ; preds = %47
  %324 = getelementptr inbounds [64 x i32], [64 x i32]* %34, i32 0, i32 0
  store i32* %324, i32** %30, align 8
  store i32 0, i32* %33, align 4
  br label %325

; <label>:325:                                    ; preds = %608, %323
  %326 = load i32, i32* %33, align 4
  %327 = icmp slt i32 %326, 8
  br i1 %327, label %328, label %611

; <label>:328:                                    ; preds = %325
  %329 = load i8**, i8*** %9, align 8
  %330 = load i32, i32* %33, align 4
  %331 = sext i32 %330 to i64
  %332 = getelementptr inbounds i8*, i8** %329, i64 %331
  %333 = load i8*, i8** %332, align 8
  %334 = load i32, i32* %10, align 4
  %335 = zext i32 %334 to i64
  %336 = getelementptr inbounds i8, i8* %333, i64 %335
  store i8* %336, i8** %31, align 8
  %337 = load i32*, i32** %30, align 8
  %338 = getelementptr inbounds i32, i32* %337, i64 1
  %339 = load i32, i32* %338, align 4
  %340 = load i32*, i32** %30, align 8
  %341 = getelementptr inbounds i32, i32* %340, i64 2
  %342 = load i32, i32* %341, align 4
  %343 = or i32 %339, %342
  %344 = load i32*, i32** %30, align 8
  %345 = getelementptr inbounds i32, i32* %344, i64 3
  %346 = load i32, i32* %345, align 4
  %347 = or i32 %343, %346
  %348 = load i32*, i32** %30, align 8
  %349 = getelementptr inbounds i32, i32* %348, i64 4
  %350 = load i32, i32* %349, align 4
  %351 = or i32 %347, %350
  %352 = load i32*, i32** %30, align 8
  %353 = getelementptr inbounds i32, i32* %352, i64 5
  %354 = load i32, i32* %353, align 4
  %355 = or i32 %351, %354
  %356 = load i32*, i32** %30, align 8
  %357 = getelementptr inbounds i32, i32* %356, i64 6
  %358 = load i32, i32* %357, align 4
  %359 = or i32 %355, %358
  %360 = load i32*, i32** %30, align 8
  %361 = getelementptr inbounds i32, i32* %360, i64 7
  %362 = load i32, i32* %361, align 4
  %363 = or i32 %359, %362
  %364 = icmp eq i32 %363, 0
  br i1 %364, label %365, label %402

; <label>:365:                                    ; preds = %328
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_ifast, i64 0, i64 3)
  %366 = add i64 %pgocount2, 1
  store i64 %366, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_ifast, i64 0, i64 3)
  %367 = load i8*, i8** %32, align 8
  %368 = load i32*, i32** %30, align 8
  %369 = getelementptr inbounds i32, i32* %368, i64 0
  %370 = load i32, i32* %369, align 4
  %371 = ashr i32 %370, 5
  %372 = and i32 %371, 1023
  %373 = sext i32 %372 to i64
  %374 = getelementptr inbounds i8, i8* %367, i64 %373
  %375 = load i8, i8* %374, align 1
  store i8 %375, i8* %36, align 1
  %376 = load i8, i8* %36, align 1
  %377 = load i8*, i8** %31, align 8
  %378 = getelementptr inbounds i8, i8* %377, i64 0
  store i8 %376, i8* %378, align 1
  %379 = load i8, i8* %36, align 1
  %380 = load i8*, i8** %31, align 8
  %381 = getelementptr inbounds i8, i8* %380, i64 1
  store i8 %379, i8* %381, align 1
  %382 = load i8, i8* %36, align 1
  %383 = load i8*, i8** %31, align 8
  %384 = getelementptr inbounds i8, i8* %383, i64 2
  store i8 %382, i8* %384, align 1
  %385 = load i8, i8* %36, align 1
  %386 = load i8*, i8** %31, align 8
  %387 = getelementptr inbounds i8, i8* %386, i64 3
  store i8 %385, i8* %387, align 1
  %388 = load i8, i8* %36, align 1
  %389 = load i8*, i8** %31, align 8
  %390 = getelementptr inbounds i8, i8* %389, i64 4
  store i8 %388, i8* %390, align 1
  %391 = load i8, i8* %36, align 1
  %392 = load i8*, i8** %31, align 8
  %393 = getelementptr inbounds i8, i8* %392, i64 5
  store i8 %391, i8* %393, align 1
  %394 = load i8, i8* %36, align 1
  %395 = load i8*, i8** %31, align 8
  %396 = getelementptr inbounds i8, i8* %395, i64 6
  store i8 %394, i8* %396, align 1
  %397 = load i8, i8* %36, align 1
  %398 = load i8*, i8** %31, align 8
  %399 = getelementptr inbounds i8, i8* %398, i64 7
  store i8 %397, i8* %399, align 1
  %400 = load i32*, i32** %30, align 8
  %401 = getelementptr inbounds i32, i32* %400, i64 8
  store i32* %401, i32** %30, align 8
  br label %608

; <label>:402:                                    ; preds = %328
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_ifast, i64 0, i64 1)
  %403 = add i64 %pgocount3, 1
  store i64 %403, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_ifast, i64 0, i64 1)
  %404 = load i32*, i32** %30, align 8
  %405 = getelementptr inbounds i32, i32* %404, i64 0
  %406 = load i32, i32* %405, align 4
  %407 = load i32*, i32** %30, align 8
  %408 = getelementptr inbounds i32, i32* %407, i64 4
  %409 = load i32, i32* %408, align 4
  %410 = add nsw i32 %406, %409
  store i32 %410, i32* %19, align 4
  %411 = load i32*, i32** %30, align 8
  %412 = getelementptr inbounds i32, i32* %411, i64 0
  %413 = load i32, i32* %412, align 4
  %414 = load i32*, i32** %30, align 8
  %415 = getelementptr inbounds i32, i32* %414, i64 4
  %416 = load i32, i32* %415, align 4
  %417 = sub nsw i32 %413, %416
  store i32 %417, i32* %20, align 4
  %418 = load i32*, i32** %30, align 8
  %419 = getelementptr inbounds i32, i32* %418, i64 2
  %420 = load i32, i32* %419, align 4
  %421 = load i32*, i32** %30, align 8
  %422 = getelementptr inbounds i32, i32* %421, i64 6
  %423 = load i32, i32* %422, align 4
  %424 = add nsw i32 %420, %423
  store i32 %424, i32* %22, align 4
  %425 = load i32*, i32** %30, align 8
  %426 = getelementptr inbounds i32, i32* %425, i64 2
  %427 = load i32, i32* %426, align 4
  %428 = load i32*, i32** %30, align 8
  %429 = getelementptr inbounds i32, i32* %428, i64 6
  %430 = load i32, i32* %429, align 4
  %431 = sub nsw i32 %427, %430
  %432 = sext i32 %431 to i64
  %433 = mul nsw i64 %432, 362
  %434 = ashr i64 %433, 8
  %435 = trunc i64 %434 to i32
  %436 = load i32, i32* %22, align 4
  %437 = sub nsw i32 %435, %436
  store i32 %437, i32* %21, align 4
  %438 = load i32, i32* %19, align 4
  %439 = load i32, i32* %22, align 4
  %440 = add nsw i32 %438, %439
  store i32 %440, i32* %11, align 4
  %441 = load i32, i32* %19, align 4
  %442 = load i32, i32* %22, align 4
  %443 = sub nsw i32 %441, %442
  store i32 %443, i32* %14, align 4
  %444 = load i32, i32* %20, align 4
  %445 = load i32, i32* %21, align 4
  %446 = add nsw i32 %444, %445
  store i32 %446, i32* %12, align 4
  %447 = load i32, i32* %20, align 4
  %448 = load i32, i32* %21, align 4
  %449 = sub nsw i32 %447, %448
  store i32 %449, i32* %13, align 4
  %450 = load i32*, i32** %30, align 8
  %451 = getelementptr inbounds i32, i32* %450, i64 5
  %452 = load i32, i32* %451, align 4
  %453 = load i32*, i32** %30, align 8
  %454 = getelementptr inbounds i32, i32* %453, i64 3
  %455 = load i32, i32* %454, align 4
  %456 = add nsw i32 %452, %455
  store i32 %456, i32* %27, align 4
  %457 = load i32*, i32** %30, align 8
  %458 = getelementptr inbounds i32, i32* %457, i64 5
  %459 = load i32, i32* %458, align 4
  %460 = load i32*, i32** %30, align 8
  %461 = getelementptr inbounds i32, i32* %460, i64 3
  %462 = load i32, i32* %461, align 4
  %463 = sub nsw i32 %459, %462
  store i32 %463, i32* %24, align 4
  %464 = load i32*, i32** %30, align 8
  %465 = getelementptr inbounds i32, i32* %464, i64 1
  %466 = load i32, i32* %465, align 4
  %467 = load i32*, i32** %30, align 8
  %468 = getelementptr inbounds i32, i32* %467, i64 7
  %469 = load i32, i32* %468, align 4
  %470 = add nsw i32 %466, %469
  store i32 %470, i32* %25, align 4
  %471 = load i32*, i32** %30, align 8
  %472 = getelementptr inbounds i32, i32* %471, i64 1
  %473 = load i32, i32* %472, align 4
  %474 = load i32*, i32** %30, align 8
  %475 = getelementptr inbounds i32, i32* %474, i64 7
  %476 = load i32, i32* %475, align 4
  %477 = sub nsw i32 %473, %476
  store i32 %477, i32* %26, align 4
  %478 = load i32, i32* %25, align 4
  %479 = load i32, i32* %27, align 4
  %480 = add nsw i32 %478, %479
  store i32 %480, i32* %18, align 4
  %481 = load i32, i32* %25, align 4
  %482 = load i32, i32* %27, align 4
  %483 = sub nsw i32 %481, %482
  %484 = sext i32 %483 to i64
  %485 = mul nsw i64 %484, 362
  %486 = ashr i64 %485, 8
  %487 = trunc i64 %486 to i32
  store i32 %487, i32* %20, align 4
  %488 = load i32, i32* %24, align 4
  %489 = load i32, i32* %26, align 4
  %490 = add nsw i32 %488, %489
  %491 = sext i32 %490 to i64
  %492 = mul nsw i64 %491, 473
  %493 = ashr i64 %492, 8
  %494 = trunc i64 %493 to i32
  store i32 %494, i32* %23, align 4
  %495 = load i32, i32* %26, align 4
  %496 = sext i32 %495 to i64
  %497 = mul nsw i64 %496, 277
  %498 = ashr i64 %497, 8
  %499 = trunc i64 %498 to i32
  %500 = load i32, i32* %23, align 4
  %501 = sub nsw i32 %499, %500
  store i32 %501, i32* %19, align 4
  %502 = load i32, i32* %24, align 4
  %503 = sext i32 %502 to i64
  %504 = mul nsw i64 %503, -669
  %505 = ashr i64 %504, 8
  %506 = trunc i64 %505 to i32
  %507 = load i32, i32* %23, align 4
  %508 = add nsw i32 %506, %507
  store i32 %508, i32* %21, align 4
  %509 = load i32, i32* %21, align 4
  %510 = load i32, i32* %18, align 4
  %511 = sub nsw i32 %509, %510
  store i32 %511, i32* %17, align 4
  %512 = load i32, i32* %20, align 4
  %513 = load i32, i32* %17, align 4
  %514 = sub nsw i32 %512, %513
  store i32 %514, i32* %16, align 4
  %515 = load i32, i32* %19, align 4
  %516 = load i32, i32* %16, align 4
  %517 = add nsw i32 %515, %516
  store i32 %517, i32* %15, align 4
  %518 = load i8*, i8** %32, align 8
  %519 = load i32, i32* %11, align 4
  %520 = load i32, i32* %18, align 4
  %521 = add nsw i32 %519, %520
  %522 = ashr i32 %521, 5
  %523 = and i32 %522, 1023
  %524 = sext i32 %523 to i64
  %525 = getelementptr inbounds i8, i8* %518, i64 %524
  %526 = load i8, i8* %525, align 1
  %527 = load i8*, i8** %31, align 8
  %528 = getelementptr inbounds i8, i8* %527, i64 0
  store i8 %526, i8* %528, align 1
  %529 = load i8*, i8** %32, align 8
  %530 = load i32, i32* %11, align 4
  %531 = load i32, i32* %18, align 4
  %532 = sub nsw i32 %530, %531
  %533 = ashr i32 %532, 5
  %534 = and i32 %533, 1023
  %535 = sext i32 %534 to i64
  %536 = getelementptr inbounds i8, i8* %529, i64 %535
  %537 = load i8, i8* %536, align 1
  %538 = load i8*, i8** %31, align 8
  %539 = getelementptr inbounds i8, i8* %538, i64 7
  store i8 %537, i8* %539, align 1
  %540 = load i8*, i8** %32, align 8
  %541 = load i32, i32* %12, align 4
  %542 = load i32, i32* %17, align 4
  %543 = add nsw i32 %541, %542
  %544 = ashr i32 %543, 5
  %545 = and i32 %544, 1023
  %546 = sext i32 %545 to i64
  %547 = getelementptr inbounds i8, i8* %540, i64 %546
  %548 = load i8, i8* %547, align 1
  %549 = load i8*, i8** %31, align 8
  %550 = getelementptr inbounds i8, i8* %549, i64 1
  store i8 %548, i8* %550, align 1
  %551 = load i8*, i8** %32, align 8
  %552 = load i32, i32* %12, align 4
  %553 = load i32, i32* %17, align 4
  %554 = sub nsw i32 %552, %553
  %555 = ashr i32 %554, 5
  %556 = and i32 %555, 1023
  %557 = sext i32 %556 to i64
  %558 = getelementptr inbounds i8, i8* %551, i64 %557
  %559 = load i8, i8* %558, align 1
  %560 = load i8*, i8** %31, align 8
  %561 = getelementptr inbounds i8, i8* %560, i64 6
  store i8 %559, i8* %561, align 1
  %562 = load i8*, i8** %32, align 8
  %563 = load i32, i32* %13, align 4
  %564 = load i32, i32* %16, align 4
  %565 = add nsw i32 %563, %564
  %566 = ashr i32 %565, 5
  %567 = and i32 %566, 1023
  %568 = sext i32 %567 to i64
  %569 = getelementptr inbounds i8, i8* %562, i64 %568
  %570 = load i8, i8* %569, align 1
  %571 = load i8*, i8** %31, align 8
  %572 = getelementptr inbounds i8, i8* %571, i64 2
  store i8 %570, i8* %572, align 1
  %573 = load i8*, i8** %32, align 8
  %574 = load i32, i32* %13, align 4
  %575 = load i32, i32* %16, align 4
  %576 = sub nsw i32 %574, %575
  %577 = ashr i32 %576, 5
  %578 = and i32 %577, 1023
  %579 = sext i32 %578 to i64
  %580 = getelementptr inbounds i8, i8* %573, i64 %579
  %581 = load i8, i8* %580, align 1
  %582 = load i8*, i8** %31, align 8
  %583 = getelementptr inbounds i8, i8* %582, i64 5
  store i8 %581, i8* %583, align 1
  %584 = load i8*, i8** %32, align 8
  %585 = load i32, i32* %14, align 4
  %586 = load i32, i32* %15, align 4
  %587 = add nsw i32 %585, %586
  %588 = ashr i32 %587, 5
  %589 = and i32 %588, 1023
  %590 = sext i32 %589 to i64
  %591 = getelementptr inbounds i8, i8* %584, i64 %590
  %592 = load i8, i8* %591, align 1
  %593 = load i8*, i8** %31, align 8
  %594 = getelementptr inbounds i8, i8* %593, i64 4
  store i8 %592, i8* %594, align 1
  %595 = load i8*, i8** %32, align 8
  %596 = load i32, i32* %14, align 4
  %597 = load i32, i32* %15, align 4
  %598 = sub nsw i32 %596, %597
  %599 = ashr i32 %598, 5
  %600 = and i32 %599, 1023
  %601 = sext i32 %600 to i64
  %602 = getelementptr inbounds i8, i8* %595, i64 %601
  %603 = load i8, i8* %602, align 1
  %604 = load i8*, i8** %31, align 8
  %605 = getelementptr inbounds i8, i8* %604, i64 3
  store i8 %603, i8* %605, align 1
  %606 = load i32*, i32** %30, align 8
  %607 = getelementptr inbounds i32, i32* %606, i64 8
  store i32* %607, i32** %30, align 8
  br label %608

; <label>:608:                                    ; preds = %402, %365
  %609 = load i32, i32* %33, align 4
  %610 = add nsw i32 %609, 1
  store i32 %610, i32* %33, align 4
  br label %325

; <label>:611:                                    ; preds = %325
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_ifast, i64 0, i64 4)
  %612 = add i64 %pgocount4, 1
  store i64 %612, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_idct_ifast, i64 0, i64 4)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
