; ModuleID = 'jidctred.2.ll'
source_filename = "jidctred.c"
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
@__profn_jpeg_idct_4x4 = private constant [13 x i8] c"jpeg_idct_4x4"
@__profn_jpeg_idct_2x2 = private constant [13 x i8] c"jpeg_idct_2x2"
@__profn_jpeg_idct_1x1 = private constant [13 x i8] c"jpeg_idct_1x1"
@__profc_jpeg_idct_4x4 = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_idct_4x4 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1071596227169703284, i64 94236907004, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_idct_4x4, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* @jpeg_idct_4x4 to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_idct_2x2 = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_idct_2x2 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7844874711071011427, i64 108173655670, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_idct_2x2, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* @jpeg_idct_2x2 to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_idct_1x1 = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_idct_1x1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1602955623648990351, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_idct_1x1, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* @jpeg_idct_1x1 to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [43 x i8] c")\00jpeg_idct_4x4\01jpeg_idct_2x2\01jpeg_idct_1x1", section "__llvm_prf_names"
@llvm.used = appending global [4 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_idct_4x4 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_idct_2x2 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_idct_1x1 to i8*), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jpeg_idct_4x4(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32) #0 {
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
  %19 = alloca i16*, align 8
  %20 = alloca i32*, align 8
  %21 = alloca i32*, align 8
  %22 = alloca i8*, align 8
  %23 = alloca i8*, align 8
  %24 = alloca i32, align 4
  %25 = alloca [32 x i32], align 16
  %26 = alloca i32, align 4
  %27 = alloca i8, align 1
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %6, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %7, align 8
  store i16* %2, i16** %8, align 8
  store i8** %3, i8*** %9, align 8
  store i32 %4, i32* %10, align 4
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %28, i32 0, i32 61
  %30 = load i8*, i8** %29, align 8
  %31 = getelementptr inbounds i8, i8* %30, i64 128
  store i8* %31, i8** %23, align 8
  %32 = load i16*, i16** %8, align 8
  store i16* %32, i16** %19, align 8
  %33 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %34 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %33, i32 0, i32 20
  %35 = load i8*, i8** %34, align 8
  %36 = bitcast i8* %35 to i32*
  store i32* %36, i32** %20, align 8
  %37 = getelementptr inbounds [32 x i32], [32 x i32]* %25, i32 0, i32 0
  store i32* %37, i32** %21, align 8
  store i32 8, i32* %24, align 4
  br label %38

; <label>:38:                                     ; preds = %232, %5
  %39 = load i32, i32* %24, align 4
  %40 = icmp sgt i32 %39, 0
  br i1 %40, label %41, label %241

; <label>:41:                                     ; preds = %38
  %42 = load i32, i32* %24, align 4
  %43 = icmp eq i32 %42, 4
  br i1 %43, label %44, label %46

; <label>:44:                                     ; preds = %41
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_idct_4x4, i64 0, i64 1)
  %45 = add i64 %pgocount, 1
  store i64 %45, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_idct_4x4, i64 0, i64 1)
  br label %232

; <label>:46:                                     ; preds = %41
  %47 = load i16*, i16** %19, align 8
  %48 = getelementptr inbounds i16, i16* %47, i64 8
  %49 = load i16, i16* %48, align 2
  %50 = sext i16 %49 to i32
  %51 = load i16*, i16** %19, align 8
  %52 = getelementptr inbounds i16, i16* %51, i64 16
  %53 = load i16, i16* %52, align 2
  %54 = sext i16 %53 to i32
  %55 = or i32 %50, %54
  %56 = load i16*, i16** %19, align 8
  %57 = getelementptr inbounds i16, i16* %56, i64 24
  %58 = load i16, i16* %57, align 2
  %59 = sext i16 %58 to i32
  %60 = or i32 %55, %59
  %61 = load i16*, i16** %19, align 8
  %62 = getelementptr inbounds i16, i16* %61, i64 40
  %63 = load i16, i16* %62, align 2
  %64 = sext i16 %63 to i32
  %65 = or i32 %60, %64
  %66 = load i16*, i16** %19, align 8
  %67 = getelementptr inbounds i16, i16* %66, i64 48
  %68 = load i16, i16* %67, align 2
  %69 = sext i16 %68 to i32
  %70 = or i32 %65, %69
  %71 = load i16*, i16** %19, align 8
  %72 = getelementptr inbounds i16, i16* %71, i64 56
  %73 = load i16, i16* %72, align 2
  %74 = sext i16 %73 to i32
  %75 = or i32 %70, %74
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %100

; <label>:77:                                     ; preds = %46
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_idct_4x4, i64 0, i64 4)
  %78 = add i64 %pgocount1, 1
  store i64 %78, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_idct_4x4, i64 0, i64 4)
  %79 = load i16*, i16** %19, align 8
  %80 = getelementptr inbounds i16, i16* %79, i64 0
  %81 = load i16, i16* %80, align 2
  %82 = sext i16 %81 to i32
  %83 = load i32*, i32** %20, align 8
  %84 = getelementptr inbounds i32, i32* %83, i64 0
  %85 = load i32, i32* %84, align 4
  %86 = mul nsw i32 %82, %85
  %87 = shl i32 %86, 2
  store i32 %87, i32* %26, align 4
  %88 = load i32, i32* %26, align 4
  %89 = load i32*, i32** %21, align 8
  %90 = getelementptr inbounds i32, i32* %89, i64 0
  store i32 %88, i32* %90, align 4
  %91 = load i32, i32* %26, align 4
  %92 = load i32*, i32** %21, align 8
  %93 = getelementptr inbounds i32, i32* %92, i64 8
  store i32 %91, i32* %93, align 4
  %94 = load i32, i32* %26, align 4
  %95 = load i32*, i32** %21, align 8
  %96 = getelementptr inbounds i32, i32* %95, i64 16
  store i32 %94, i32* %96, align 4
  %97 = load i32, i32* %26, align 4
  %98 = load i32*, i32** %21, align 8
  %99 = getelementptr inbounds i32, i32* %98, i64 24
  store i32 %97, i32* %99, align 4
  br label %232

; <label>:100:                                    ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_idct_4x4, i64 0, i64 3)
  %101 = add i64 %pgocount2, 1
  store i64 %101, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_idct_4x4, i64 0, i64 3)
  %102 = load i16*, i16** %19, align 8
  %103 = getelementptr inbounds i16, i16* %102, i64 0
  %104 = load i16, i16* %103, align 2
  %105 = sext i16 %104 to i32
  %106 = load i32*, i32** %20, align 8
  %107 = getelementptr inbounds i32, i32* %106, i64 0
  %108 = load i32, i32* %107, align 4
  %109 = mul nsw i32 %105, %108
  %110 = sext i32 %109 to i64
  store i64 %110, i64* %11, align 8
  %111 = load i64, i64* %11, align 8
  %112 = shl i64 %111, 14
  store i64 %112, i64* %11, align 8
  %113 = load i16*, i16** %19, align 8
  %114 = getelementptr inbounds i16, i16* %113, i64 16
  %115 = load i16, i16* %114, align 2
  %116 = sext i16 %115 to i32
  %117 = load i32*, i32** %20, align 8
  %118 = getelementptr inbounds i32, i32* %117, i64 16
  %119 = load i32, i32* %118, align 4
  %120 = mul nsw i32 %116, %119
  %121 = sext i32 %120 to i64
  store i64 %121, i64* %16, align 8
  %122 = load i16*, i16** %19, align 8
  %123 = getelementptr inbounds i16, i16* %122, i64 48
  %124 = load i16, i16* %123, align 2
  %125 = sext i16 %124 to i32
  %126 = load i32*, i32** %20, align 8
  %127 = getelementptr inbounds i32, i32* %126, i64 48
  %128 = load i32, i32* %127, align 4
  %129 = mul nsw i32 %125, %128
  %130 = sext i32 %129 to i64
  store i64 %130, i64* %17, align 8
  %131 = load i64, i64* %16, align 8
  %132 = mul nsw i64 %131, 15137
  %133 = load i64, i64* %17, align 8
  %134 = mul nsw i64 %133, -6270
  %135 = add nsw i64 %132, %134
  store i64 %135, i64* %12, align 8
  %136 = load i64, i64* %11, align 8
  %137 = load i64, i64* %12, align 8
  %138 = add nsw i64 %136, %137
  store i64 %138, i64* %13, align 8
  %139 = load i64, i64* %11, align 8
  %140 = load i64, i64* %12, align 8
  %141 = sub nsw i64 %139, %140
  store i64 %141, i64* %14, align 8
  %142 = load i16*, i16** %19, align 8
  %143 = getelementptr inbounds i16, i16* %142, i64 56
  %144 = load i16, i16* %143, align 2
  %145 = sext i16 %144 to i32
  %146 = load i32*, i32** %20, align 8
  %147 = getelementptr inbounds i32, i32* %146, i64 56
  %148 = load i32, i32* %147, align 4
  %149 = mul nsw i32 %145, %148
  %150 = sext i32 %149 to i64
  store i64 %150, i64* %15, align 8
  %151 = load i16*, i16** %19, align 8
  %152 = getelementptr inbounds i16, i16* %151, i64 40
  %153 = load i16, i16* %152, align 2
  %154 = sext i16 %153 to i32
  %155 = load i32*, i32** %20, align 8
  %156 = getelementptr inbounds i32, i32* %155, i64 40
  %157 = load i32, i32* %156, align 4
  %158 = mul nsw i32 %154, %157
  %159 = sext i32 %158 to i64
  store i64 %159, i64* %16, align 8
  %160 = load i16*, i16** %19, align 8
  %161 = getelementptr inbounds i16, i16* %160, i64 24
  %162 = load i16, i16* %161, align 2
  %163 = sext i16 %162 to i32
  %164 = load i32*, i32** %20, align 8
  %165 = getelementptr inbounds i32, i32* %164, i64 24
  %166 = load i32, i32* %165, align 4
  %167 = mul nsw i32 %163, %166
  %168 = sext i32 %167 to i64
  store i64 %168, i64* %17, align 8
  %169 = load i16*, i16** %19, align 8
  %170 = getelementptr inbounds i16, i16* %169, i64 8
  %171 = load i16, i16* %170, align 2
  %172 = sext i16 %171 to i32
  %173 = load i32*, i32** %20, align 8
  %174 = getelementptr inbounds i32, i32* %173, i64 8
  %175 = load i32, i32* %174, align 4
  %176 = mul nsw i32 %172, %175
  %177 = sext i32 %176 to i64
  store i64 %177, i64* %18, align 8
  %178 = load i64, i64* %15, align 8
  %179 = mul nsw i64 %178, -1730
  %180 = load i64, i64* %16, align 8
  %181 = mul nsw i64 %180, 11893
  %182 = add nsw i64 %179, %181
  %183 = load i64, i64* %17, align 8
  %184 = mul nsw i64 %183, -17799
  %185 = add nsw i64 %182, %184
  %186 = load i64, i64* %18, align 8
  %187 = mul nsw i64 %186, 8697
  %188 = add nsw i64 %185, %187
  store i64 %188, i64* %11, align 8
  %189 = load i64, i64* %15, align 8
  %190 = mul nsw i64 %189, -4176
  %191 = load i64, i64* %16, align 8
  %192 = mul nsw i64 %191, -4926
  %193 = add nsw i64 %190, %192
  %194 = load i64, i64* %17, align 8
  %195 = mul nsw i64 %194, 7373
  %196 = add nsw i64 %193, %195
  %197 = load i64, i64* %18, align 8
  %198 = mul nsw i64 %197, 20995
  %199 = add nsw i64 %196, %198
  store i64 %199, i64* %12, align 8
  %200 = load i64, i64* %13, align 8
  %201 = load i64, i64* %12, align 8
  %202 = add nsw i64 %200, %201
  %203 = add nsw i64 %202, 2048
  %204 = ashr i64 %203, 12
  %205 = trunc i64 %204 to i32
  %206 = load i32*, i32** %21, align 8
  %207 = getelementptr inbounds i32, i32* %206, i64 0
  store i32 %205, i32* %207, align 4
  %208 = load i64, i64* %13, align 8
  %209 = load i64, i64* %12, align 8
  %210 = sub nsw i64 %208, %209
  %211 = add nsw i64 %210, 2048
  %212 = ashr i64 %211, 12
  %213 = trunc i64 %212 to i32
  %214 = load i32*, i32** %21, align 8
  %215 = getelementptr inbounds i32, i32* %214, i64 24
  store i32 %213, i32* %215, align 4
  %216 = load i64, i64* %14, align 8
  %217 = load i64, i64* %11, align 8
  %218 = add nsw i64 %216, %217
  %219 = add nsw i64 %218, 2048
  %220 = ashr i64 %219, 12
  %221 = trunc i64 %220 to i32
  %222 = load i32*, i32** %21, align 8
  %223 = getelementptr inbounds i32, i32* %222, i64 8
  store i32 %221, i32* %223, align 4
  %224 = load i64, i64* %14, align 8
  %225 = load i64, i64* %11, align 8
  %226 = sub nsw i64 %224, %225
  %227 = add nsw i64 %226, 2048
  %228 = ashr i64 %227, 12
  %229 = trunc i64 %228 to i32
  %230 = load i32*, i32** %21, align 8
  %231 = getelementptr inbounds i32, i32* %230, i64 16
  store i32 %229, i32* %231, align 4
  br label %232

; <label>:232:                                    ; preds = %100, %77, %44
  %233 = load i16*, i16** %19, align 8
  %234 = getelementptr inbounds i16, i16* %233, i32 1
  store i16* %234, i16** %19, align 8
  %235 = load i32*, i32** %20, align 8
  %236 = getelementptr inbounds i32, i32* %235, i32 1
  store i32* %236, i32** %20, align 8
  %237 = load i32*, i32** %21, align 8
  %238 = getelementptr inbounds i32, i32* %237, i32 1
  store i32* %238, i32** %21, align 8
  %239 = load i32, i32* %24, align 4
  %240 = add nsw i32 %239, -1
  store i32 %240, i32* %24, align 4
  br label %38

; <label>:241:                                    ; preds = %38
  %242 = getelementptr inbounds [32 x i32], [32 x i32]* %25, i32 0, i32 0
  store i32* %242, i32** %21, align 8
  store i32 0, i32* %24, align 4
  br label %243

; <label>:243:                                    ; preds = %423, %241
  %244 = load i32, i32* %24, align 4
  %245 = icmp slt i32 %244, 4
  br i1 %245, label %246, label %426

; <label>:246:                                    ; preds = %243
  %247 = load i8**, i8*** %9, align 8
  %248 = load i32, i32* %24, align 4
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds i8*, i8** %247, i64 %249
  %251 = load i8*, i8** %250, align 8
  %252 = load i32, i32* %10, align 4
  %253 = zext i32 %252 to i64
  %254 = getelementptr inbounds i8, i8* %251, i64 %253
  store i8* %254, i8** %22, align 8
  %255 = load i32*, i32** %21, align 8
  %256 = getelementptr inbounds i32, i32* %255, i64 1
  %257 = load i32, i32* %256, align 4
  %258 = load i32*, i32** %21, align 8
  %259 = getelementptr inbounds i32, i32* %258, i64 2
  %260 = load i32, i32* %259, align 4
  %261 = or i32 %257, %260
  %262 = load i32*, i32** %21, align 8
  %263 = getelementptr inbounds i32, i32* %262, i64 3
  %264 = load i32, i32* %263, align 4
  %265 = or i32 %261, %264
  %266 = load i32*, i32** %21, align 8
  %267 = getelementptr inbounds i32, i32* %266, i64 5
  %268 = load i32, i32* %267, align 4
  %269 = or i32 %265, %268
  %270 = load i32*, i32** %21, align 8
  %271 = getelementptr inbounds i32, i32* %270, i64 6
  %272 = load i32, i32* %271, align 4
  %273 = or i32 %269, %272
  %274 = load i32*, i32** %21, align 8
  %275 = getelementptr inbounds i32, i32* %274, i64 7
  %276 = load i32, i32* %275, align 4
  %277 = or i32 %273, %276
  %278 = icmp eq i32 %277, 0
  br i1 %278, label %279, label %307

; <label>:279:                                    ; preds = %246
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_idct_4x4, i64 0, i64 2)
  %280 = add i64 %pgocount3, 1
  store i64 %280, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_idct_4x4, i64 0, i64 2)
  %281 = load i8*, i8** %23, align 8
  %282 = load i32*, i32** %21, align 8
  %283 = getelementptr inbounds i32, i32* %282, i64 0
  %284 = load i32, i32* %283, align 4
  %285 = sext i32 %284 to i64
  %286 = add nsw i64 %285, 16
  %287 = ashr i64 %286, 5
  %288 = trunc i64 %287 to i32
  %289 = and i32 %288, 1023
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds i8, i8* %281, i64 %290
  %292 = load i8, i8* %291, align 1
  store i8 %292, i8* %27, align 1
  %293 = load i8, i8* %27, align 1
  %294 = load i8*, i8** %22, align 8
  %295 = getelementptr inbounds i8, i8* %294, i64 0
  store i8 %293, i8* %295, align 1
  %296 = load i8, i8* %27, align 1
  %297 = load i8*, i8** %22, align 8
  %298 = getelementptr inbounds i8, i8* %297, i64 1
  store i8 %296, i8* %298, align 1
  %299 = load i8, i8* %27, align 1
  %300 = load i8*, i8** %22, align 8
  %301 = getelementptr inbounds i8, i8* %300, i64 2
  store i8 %299, i8* %301, align 1
  %302 = load i8, i8* %27, align 1
  %303 = load i8*, i8** %22, align 8
  %304 = getelementptr inbounds i8, i8* %303, i64 3
  store i8 %302, i8* %304, align 1
  %305 = load i32*, i32** %21, align 8
  %306 = getelementptr inbounds i32, i32* %305, i64 8
  store i32* %306, i32** %21, align 8
  br label %423

; <label>:307:                                    ; preds = %246
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_idct_4x4, i64 0, i64 0)
  %308 = add i64 %pgocount4, 1
  store i64 %308, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_idct_4x4, i64 0, i64 0)
  %309 = load i32*, i32** %21, align 8
  %310 = getelementptr inbounds i32, i32* %309, i64 0
  %311 = load i32, i32* %310, align 4
  %312 = sext i32 %311 to i64
  %313 = shl i64 %312, 14
  store i64 %313, i64* %11, align 8
  %314 = load i32*, i32** %21, align 8
  %315 = getelementptr inbounds i32, i32* %314, i64 2
  %316 = load i32, i32* %315, align 4
  %317 = sext i32 %316 to i64
  %318 = mul nsw i64 %317, 15137
  %319 = load i32*, i32** %21, align 8
  %320 = getelementptr inbounds i32, i32* %319, i64 6
  %321 = load i32, i32* %320, align 4
  %322 = sext i32 %321 to i64
  %323 = mul nsw i64 %322, -6270
  %324 = add nsw i64 %318, %323
  store i64 %324, i64* %12, align 8
  %325 = load i64, i64* %11, align 8
  %326 = load i64, i64* %12, align 8
  %327 = add nsw i64 %325, %326
  store i64 %327, i64* %13, align 8
  %328 = load i64, i64* %11, align 8
  %329 = load i64, i64* %12, align 8
  %330 = sub nsw i64 %328, %329
  store i64 %330, i64* %14, align 8
  %331 = load i32*, i32** %21, align 8
  %332 = getelementptr inbounds i32, i32* %331, i64 7
  %333 = load i32, i32* %332, align 4
  %334 = sext i32 %333 to i64
  store i64 %334, i64* %15, align 8
  %335 = load i32*, i32** %21, align 8
  %336 = getelementptr inbounds i32, i32* %335, i64 5
  %337 = load i32, i32* %336, align 4
  %338 = sext i32 %337 to i64
  store i64 %338, i64* %16, align 8
  %339 = load i32*, i32** %21, align 8
  %340 = getelementptr inbounds i32, i32* %339, i64 3
  %341 = load i32, i32* %340, align 4
  %342 = sext i32 %341 to i64
  store i64 %342, i64* %17, align 8
  %343 = load i32*, i32** %21, align 8
  %344 = getelementptr inbounds i32, i32* %343, i64 1
  %345 = load i32, i32* %344, align 4
  %346 = sext i32 %345 to i64
  store i64 %346, i64* %18, align 8
  %347 = load i64, i64* %15, align 8
  %348 = mul nsw i64 %347, -1730
  %349 = load i64, i64* %16, align 8
  %350 = mul nsw i64 %349, 11893
  %351 = add nsw i64 %348, %350
  %352 = load i64, i64* %17, align 8
  %353 = mul nsw i64 %352, -17799
  %354 = add nsw i64 %351, %353
  %355 = load i64, i64* %18, align 8
  %356 = mul nsw i64 %355, 8697
  %357 = add nsw i64 %354, %356
  store i64 %357, i64* %11, align 8
  %358 = load i64, i64* %15, align 8
  %359 = mul nsw i64 %358, -4176
  %360 = load i64, i64* %16, align 8
  %361 = mul nsw i64 %360, -4926
  %362 = add nsw i64 %359, %361
  %363 = load i64, i64* %17, align 8
  %364 = mul nsw i64 %363, 7373
  %365 = add nsw i64 %362, %364
  %366 = load i64, i64* %18, align 8
  %367 = mul nsw i64 %366, 20995
  %368 = add nsw i64 %365, %367
  store i64 %368, i64* %12, align 8
  %369 = load i8*, i8** %23, align 8
  %370 = load i64, i64* %13, align 8
  %371 = load i64, i64* %12, align 8
  %372 = add nsw i64 %370, %371
  %373 = add nsw i64 %372, 262144
  %374 = ashr i64 %373, 19
  %375 = trunc i64 %374 to i32
  %376 = and i32 %375, 1023
  %377 = sext i32 %376 to i64
  %378 = getelementptr inbounds i8, i8* %369, i64 %377
  %379 = load i8, i8* %378, align 1
  %380 = load i8*, i8** %22, align 8
  %381 = getelementptr inbounds i8, i8* %380, i64 0
  store i8 %379, i8* %381, align 1
  %382 = load i8*, i8** %23, align 8
  %383 = load i64, i64* %13, align 8
  %384 = load i64, i64* %12, align 8
  %385 = sub nsw i64 %383, %384
  %386 = add nsw i64 %385, 262144
  %387 = ashr i64 %386, 19
  %388 = trunc i64 %387 to i32
  %389 = and i32 %388, 1023
  %390 = sext i32 %389 to i64
  %391 = getelementptr inbounds i8, i8* %382, i64 %390
  %392 = load i8, i8* %391, align 1
  %393 = load i8*, i8** %22, align 8
  %394 = getelementptr inbounds i8, i8* %393, i64 3
  store i8 %392, i8* %394, align 1
  %395 = load i8*, i8** %23, align 8
  %396 = load i64, i64* %14, align 8
  %397 = load i64, i64* %11, align 8
  %398 = add nsw i64 %396, %397
  %399 = add nsw i64 %398, 262144
  %400 = ashr i64 %399, 19
  %401 = trunc i64 %400 to i32
  %402 = and i32 %401, 1023
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds i8, i8* %395, i64 %403
  %405 = load i8, i8* %404, align 1
  %406 = load i8*, i8** %22, align 8
  %407 = getelementptr inbounds i8, i8* %406, i64 1
  store i8 %405, i8* %407, align 1
  %408 = load i8*, i8** %23, align 8
  %409 = load i64, i64* %14, align 8
  %410 = load i64, i64* %11, align 8
  %411 = sub nsw i64 %409, %410
  %412 = add nsw i64 %411, 262144
  %413 = ashr i64 %412, 19
  %414 = trunc i64 %413 to i32
  %415 = and i32 %414, 1023
  %416 = sext i32 %415 to i64
  %417 = getelementptr inbounds i8, i8* %408, i64 %416
  %418 = load i8, i8* %417, align 1
  %419 = load i8*, i8** %22, align 8
  %420 = getelementptr inbounds i8, i8* %419, i64 2
  store i8 %418, i8* %420, align 1
  %421 = load i32*, i32** %21, align 8
  %422 = getelementptr inbounds i32, i32* %421, i64 8
  store i32* %422, i32** %21, align 8
  br label %423

; <label>:423:                                    ; preds = %307, %279
  %424 = load i32, i32* %24, align 4
  %425 = add nsw i32 %424, 1
  store i32 %425, i32* %24, align 4
  br label %243

; <label>:426:                                    ; preds = %243
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_idct_4x4, i64 0, i64 5)
  %427 = add i64 %pgocount5, 1
  store i64 %427, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_idct_4x4, i64 0, i64 5)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_idct_2x2(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32) #0 {
  %6 = alloca %struct.jpeg_decompress_struct*, align 8
  %7 = alloca %struct.jpeg_component_info*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i8**, align 8
  %10 = alloca i32, align 4
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i16*, align 8
  %15 = alloca i32*, align 8
  %16 = alloca i32*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i8*, align 8
  %19 = alloca i32, align 4
  %20 = alloca [16 x i32], align 16
  %21 = alloca i32, align 4
  %22 = alloca i8, align 1
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %6, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %7, align 8
  store i16* %2, i16** %8, align 8
  store i8** %3, i8*** %9, align 8
  store i32 %4, i32* %10, align 4
  %23 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %23, i32 0, i32 61
  %25 = load i8*, i8** %24, align 8
  %26 = getelementptr inbounds i8, i8* %25, i64 128
  store i8* %26, i8** %18, align 8
  %27 = load i16*, i16** %8, align 8
  store i16* %27, i16** %14, align 8
  %28 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %29 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %28, i32 0, i32 20
  %30 = load i8*, i8** %29, align 8
  %31 = bitcast i8* %30 to i32*
  store i32* %31, i32** %15, align 8
  %32 = getelementptr inbounds [16 x i32], [16 x i32]* %20, i32 0, i32 0
  store i32* %32, i32** %16, align 8
  store i32 8, i32* %19, align 4
  br label %33

; <label>:33:                                     ; preds = %166, %5
  %34 = load i32, i32* %19, align 4
  %35 = icmp sgt i32 %34, 0
  br i1 %35, label %36, label %175

; <label>:36:                                     ; preds = %33
  %37 = load i32, i32* %19, align 4
  %38 = icmp eq i32 %37, 6
  br i1 %38, label %47, label %39

; <label>:39:                                     ; preds = %36
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_idct_2x2, i64 0, i64 2)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_idct_2x2, i64 0, i64 2)
  %41 = load i32, i32* %19, align 4
  %42 = icmp eq i32 %41, 4
  br i1 %42, label %47, label %43

; <label>:43:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_idct_2x2, i64 0, i64 4)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_idct_2x2, i64 0, i64 4)
  %45 = load i32, i32* %19, align 4
  %46 = icmp eq i32 %45, 2
  br i1 %46, label %47, label %49

; <label>:47:                                     ; preds = %43, %39, %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_idct_2x2, i64 0, i64 0)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_idct_2x2, i64 0, i64 0)
  br label %166

; <label>:49:                                     ; preds = %43
  %50 = load i16*, i16** %14, align 8
  %51 = getelementptr inbounds i16, i16* %50, i64 8
  %52 = load i16, i16* %51, align 2
  %53 = sext i16 %52 to i32
  %54 = load i16*, i16** %14, align 8
  %55 = getelementptr inbounds i16, i16* %54, i64 24
  %56 = load i16, i16* %55, align 2
  %57 = sext i16 %56 to i32
  %58 = or i32 %53, %57
  %59 = load i16*, i16** %14, align 8
  %60 = getelementptr inbounds i16, i16* %59, i64 40
  %61 = load i16, i16* %60, align 2
  %62 = sext i16 %61 to i32
  %63 = or i32 %58, %62
  %64 = load i16*, i16** %14, align 8
  %65 = getelementptr inbounds i16, i16* %64, i64 56
  %66 = load i16, i16* %65, align 2
  %67 = sext i16 %66 to i32
  %68 = or i32 %63, %67
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %70, label %87

; <label>:70:                                     ; preds = %49
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_idct_2x2, i64 0, i64 6)
  %71 = add i64 %pgocount3, 1
  store i64 %71, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_idct_2x2, i64 0, i64 6)
  %72 = load i16*, i16** %14, align 8
  %73 = getelementptr inbounds i16, i16* %72, i64 0
  %74 = load i16, i16* %73, align 2
  %75 = sext i16 %74 to i32
  %76 = load i32*, i32** %15, align 8
  %77 = getelementptr inbounds i32, i32* %76, i64 0
  %78 = load i32, i32* %77, align 4
  %79 = mul nsw i32 %75, %78
  %80 = shl i32 %79, 2
  store i32 %80, i32* %21, align 4
  %81 = load i32, i32* %21, align 4
  %82 = load i32*, i32** %16, align 8
  %83 = getelementptr inbounds i32, i32* %82, i64 0
  store i32 %81, i32* %83, align 4
  %84 = load i32, i32* %21, align 4
  %85 = load i32*, i32** %16, align 8
  %86 = getelementptr inbounds i32, i32* %85, i64 8
  store i32 %84, i32* %86, align 4
  br label %166

; <label>:87:                                     ; preds = %49
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_idct_2x2, i64 0, i64 5)
  %88 = add i64 %pgocount4, 1
  store i64 %88, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_idct_2x2, i64 0, i64 5)
  %89 = load i16*, i16** %14, align 8
  %90 = getelementptr inbounds i16, i16* %89, i64 0
  %91 = load i16, i16* %90, align 2
  %92 = sext i16 %91 to i32
  %93 = load i32*, i32** %15, align 8
  %94 = getelementptr inbounds i32, i32* %93, i64 0
  %95 = load i32, i32* %94, align 4
  %96 = mul nsw i32 %92, %95
  %97 = sext i32 %96 to i64
  store i64 %97, i64* %13, align 8
  %98 = load i64, i64* %13, align 8
  %99 = shl i64 %98, 15
  store i64 %99, i64* %12, align 8
  %100 = load i16*, i16** %14, align 8
  %101 = getelementptr inbounds i16, i16* %100, i64 56
  %102 = load i16, i16* %101, align 2
  %103 = sext i16 %102 to i32
  %104 = load i32*, i32** %15, align 8
  %105 = getelementptr inbounds i32, i32* %104, i64 56
  %106 = load i32, i32* %105, align 4
  %107 = mul nsw i32 %103, %106
  %108 = sext i32 %107 to i64
  store i64 %108, i64* %13, align 8
  %109 = load i64, i64* %13, align 8
  %110 = mul nsw i64 %109, -5906
  store i64 %110, i64* %11, align 8
  %111 = load i16*, i16** %14, align 8
  %112 = getelementptr inbounds i16, i16* %111, i64 40
  %113 = load i16, i16* %112, align 2
  %114 = sext i16 %113 to i32
  %115 = load i32*, i32** %15, align 8
  %116 = getelementptr inbounds i32, i32* %115, i64 40
  %117 = load i32, i32* %116, align 4
  %118 = mul nsw i32 %114, %117
  %119 = sext i32 %118 to i64
  store i64 %119, i64* %13, align 8
  %120 = load i64, i64* %13, align 8
  %121 = mul nsw i64 %120, 6967
  %122 = load i64, i64* %11, align 8
  %123 = add nsw i64 %122, %121
  store i64 %123, i64* %11, align 8
  %124 = load i16*, i16** %14, align 8
  %125 = getelementptr inbounds i16, i16* %124, i64 24
  %126 = load i16, i16* %125, align 2
  %127 = sext i16 %126 to i32
  %128 = load i32*, i32** %15, align 8
  %129 = getelementptr inbounds i32, i32* %128, i64 24
  %130 = load i32, i32* %129, align 4
  %131 = mul nsw i32 %127, %130
  %132 = sext i32 %131 to i64
  store i64 %132, i64* %13, align 8
  %133 = load i64, i64* %13, align 8
  %134 = mul nsw i64 %133, -10426
  %135 = load i64, i64* %11, align 8
  %136 = add nsw i64 %135, %134
  store i64 %136, i64* %11, align 8
  %137 = load i16*, i16** %14, align 8
  %138 = getelementptr inbounds i16, i16* %137, i64 8
  %139 = load i16, i16* %138, align 2
  %140 = sext i16 %139 to i32
  %141 = load i32*, i32** %15, align 8
  %142 = getelementptr inbounds i32, i32* %141, i64 8
  %143 = load i32, i32* %142, align 4
  %144 = mul nsw i32 %140, %143
  %145 = sext i32 %144 to i64
  store i64 %145, i64* %13, align 8
  %146 = load i64, i64* %13, align 8
  %147 = mul nsw i64 %146, 29692
  %148 = load i64, i64* %11, align 8
  %149 = add nsw i64 %148, %147
  store i64 %149, i64* %11, align 8
  %150 = load i64, i64* %12, align 8
  %151 = load i64, i64* %11, align 8
  %152 = add nsw i64 %150, %151
  %153 = add nsw i64 %152, 4096
  %154 = ashr i64 %153, 13
  %155 = trunc i64 %154 to i32
  %156 = load i32*, i32** %16, align 8
  %157 = getelementptr inbounds i32, i32* %156, i64 0
  store i32 %155, i32* %157, align 4
  %158 = load i64, i64* %12, align 8
  %159 = load i64, i64* %11, align 8
  %160 = sub nsw i64 %158, %159
  %161 = add nsw i64 %160, 4096
  %162 = ashr i64 %161, 13
  %163 = trunc i64 %162 to i32
  %164 = load i32*, i32** %16, align 8
  %165 = getelementptr inbounds i32, i32* %164, i64 8
  store i32 %163, i32* %165, align 4
  br label %166

; <label>:166:                                    ; preds = %87, %70, %47
  %167 = load i16*, i16** %14, align 8
  %168 = getelementptr inbounds i16, i16* %167, i32 1
  store i16* %168, i16** %14, align 8
  %169 = load i32*, i32** %15, align 8
  %170 = getelementptr inbounds i32, i32* %169, i32 1
  store i32* %170, i32** %15, align 8
  %171 = load i32*, i32** %16, align 8
  %172 = getelementptr inbounds i32, i32* %171, i32 1
  store i32* %172, i32** %16, align 8
  %173 = load i32, i32* %19, align 4
  %174 = add nsw i32 %173, -1
  store i32 %174, i32* %19, align 4
  br label %33

; <label>:175:                                    ; preds = %33
  %176 = getelementptr inbounds [16 x i32], [16 x i32]* %20, i32 0, i32 0
  store i32* %176, i32** %16, align 8
  store i32 0, i32* %19, align 4
  br label %177

; <label>:177:                                    ; preds = %285, %175
  %178 = load i32, i32* %19, align 4
  %179 = icmp slt i32 %178, 2
  br i1 %179, label %180, label %288

; <label>:180:                                    ; preds = %177
  %181 = load i8**, i8*** %9, align 8
  %182 = load i32, i32* %19, align 4
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds i8*, i8** %181, i64 %183
  %185 = load i8*, i8** %184, align 8
  %186 = load i32, i32* %10, align 4
  %187 = zext i32 %186 to i64
  %188 = getelementptr inbounds i8, i8* %185, i64 %187
  store i8* %188, i8** %17, align 8
  %189 = load i32*, i32** %16, align 8
  %190 = getelementptr inbounds i32, i32* %189, i64 1
  %191 = load i32, i32* %190, align 4
  %192 = load i32*, i32** %16, align 8
  %193 = getelementptr inbounds i32, i32* %192, i64 3
  %194 = load i32, i32* %193, align 4
  %195 = or i32 %191, %194
  %196 = load i32*, i32** %16, align 8
  %197 = getelementptr inbounds i32, i32* %196, i64 5
  %198 = load i32, i32* %197, align 4
  %199 = or i32 %195, %198
  %200 = load i32*, i32** %16, align 8
  %201 = getelementptr inbounds i32, i32* %200, i64 7
  %202 = load i32, i32* %201, align 4
  %203 = or i32 %199, %202
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %205, label %227

; <label>:205:                                    ; preds = %180
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_idct_2x2, i64 0, i64 3)
  %206 = add i64 %pgocount5, 1
  store i64 %206, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_idct_2x2, i64 0, i64 3)
  %207 = load i8*, i8** %18, align 8
  %208 = load i32*, i32** %16, align 8
  %209 = getelementptr inbounds i32, i32* %208, i64 0
  %210 = load i32, i32* %209, align 4
  %211 = sext i32 %210 to i64
  %212 = add nsw i64 %211, 16
  %213 = ashr i64 %212, 5
  %214 = trunc i64 %213 to i32
  %215 = and i32 %214, 1023
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds i8, i8* %207, i64 %216
  %218 = load i8, i8* %217, align 1
  store i8 %218, i8* %22, align 1
  %219 = load i8, i8* %22, align 1
  %220 = load i8*, i8** %17, align 8
  %221 = getelementptr inbounds i8, i8* %220, i64 0
  store i8 %219, i8* %221, align 1
  %222 = load i8, i8* %22, align 1
  %223 = load i8*, i8** %17, align 8
  %224 = getelementptr inbounds i8, i8* %223, i64 1
  store i8 %222, i8* %224, align 1
  %225 = load i32*, i32** %16, align 8
  %226 = getelementptr inbounds i32, i32* %225, i64 8
  store i32* %226, i32** %16, align 8
  br label %285

; <label>:227:                                    ; preds = %180
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_idct_2x2, i64 0, i64 1)
  %228 = add i64 %pgocount6, 1
  store i64 %228, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_idct_2x2, i64 0, i64 1)
  %229 = load i32*, i32** %16, align 8
  %230 = getelementptr inbounds i32, i32* %229, i64 0
  %231 = load i32, i32* %230, align 4
  %232 = sext i32 %231 to i64
  %233 = shl i64 %232, 15
  store i64 %233, i64* %12, align 8
  %234 = load i32*, i32** %16, align 8
  %235 = getelementptr inbounds i32, i32* %234, i64 7
  %236 = load i32, i32* %235, align 4
  %237 = sext i32 %236 to i64
  %238 = mul nsw i64 %237, -5906
  %239 = load i32*, i32** %16, align 8
  %240 = getelementptr inbounds i32, i32* %239, i64 5
  %241 = load i32, i32* %240, align 4
  %242 = sext i32 %241 to i64
  %243 = mul nsw i64 %242, 6967
  %244 = add nsw i64 %238, %243
  %245 = load i32*, i32** %16, align 8
  %246 = getelementptr inbounds i32, i32* %245, i64 3
  %247 = load i32, i32* %246, align 4
  %248 = sext i32 %247 to i64
  %249 = mul nsw i64 %248, -10426
  %250 = add nsw i64 %244, %249
  %251 = load i32*, i32** %16, align 8
  %252 = getelementptr inbounds i32, i32* %251, i64 1
  %253 = load i32, i32* %252, align 4
  %254 = sext i32 %253 to i64
  %255 = mul nsw i64 %254, 29692
  %256 = add nsw i64 %250, %255
  store i64 %256, i64* %11, align 8
  %257 = load i8*, i8** %18, align 8
  %258 = load i64, i64* %12, align 8
  %259 = load i64, i64* %11, align 8
  %260 = add nsw i64 %258, %259
  %261 = add nsw i64 %260, 524288
  %262 = ashr i64 %261, 20
  %263 = trunc i64 %262 to i32
  %264 = and i32 %263, 1023
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds i8, i8* %257, i64 %265
  %267 = load i8, i8* %266, align 1
  %268 = load i8*, i8** %17, align 8
  %269 = getelementptr inbounds i8, i8* %268, i64 0
  store i8 %267, i8* %269, align 1
  %270 = load i8*, i8** %18, align 8
  %271 = load i64, i64* %12, align 8
  %272 = load i64, i64* %11, align 8
  %273 = sub nsw i64 %271, %272
  %274 = add nsw i64 %273, 524288
  %275 = ashr i64 %274, 20
  %276 = trunc i64 %275 to i32
  %277 = and i32 %276, 1023
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds i8, i8* %270, i64 %278
  %280 = load i8, i8* %279, align 1
  %281 = load i8*, i8** %17, align 8
  %282 = getelementptr inbounds i8, i8* %281, i64 1
  store i8 %280, i8* %282, align 1
  %283 = load i32*, i32** %16, align 8
  %284 = getelementptr inbounds i32, i32* %283, i64 8
  store i32* %284, i32** %16, align 8
  br label %285

; <label>:285:                                    ; preds = %227, %205
  %286 = load i32, i32* %19, align 4
  %287 = add nsw i32 %286, 1
  store i32 %287, i32* %19, align 4
  br label %177

; <label>:288:                                    ; preds = %177
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_idct_2x2, i64 0, i64 7)
  %289 = add i64 %pgocount7, 1
  store i64 %289, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_idct_2x2, i64 0, i64 7)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_idct_1x1(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_idct_1x1, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_idct_1x1, i64 0, i64 0)
  %7 = alloca %struct.jpeg_decompress_struct*, align 8
  %8 = alloca %struct.jpeg_component_info*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i8**, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32*, align 8
  %14 = alloca i8*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %7, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %8, align 8
  store i16* %2, i16** %9, align 8
  store i8** %3, i8*** %10, align 8
  store i32 %4, i32* %11, align 4
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 61
  %17 = load i8*, i8** %16, align 8
  %18 = getelementptr inbounds i8, i8* %17, i64 128
  store i8* %18, i8** %14, align 8
  %19 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %20 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %19, i32 0, i32 20
  %21 = load i8*, i8** %20, align 8
  %22 = bitcast i8* %21 to i32*
  store i32* %22, i32** %13, align 8
  %23 = load i16*, i16** %9, align 8
  %24 = getelementptr inbounds i16, i16* %23, i64 0
  %25 = load i16, i16* %24, align 2
  %26 = sext i16 %25 to i32
  %27 = load i32*, i32** %13, align 8
  %28 = getelementptr inbounds i32, i32* %27, i64 0
  %29 = load i32, i32* %28, align 4
  %30 = mul nsw i32 %26, %29
  store i32 %30, i32* %12, align 4
  %31 = load i32, i32* %12, align 4
  %32 = sext i32 %31 to i64
  %33 = add nsw i64 %32, 4
  %34 = ashr i64 %33, 3
  %35 = trunc i64 %34 to i32
  store i32 %35, i32* %12, align 4
  %36 = load i8*, i8** %14, align 8
  %37 = load i32, i32* %12, align 4
  %38 = and i32 %37, 1023
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8, i8* %36, i64 %39
  %41 = load i8, i8* %40, align 1
  %42 = load i8**, i8*** %10, align 8
  %43 = getelementptr inbounds i8*, i8** %42, i64 0
  %44 = load i8*, i8** %43, align 8
  %45 = load i32, i32* %11, align 4
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8* %44, i64 %46
  store i8 %41, i8* %47, align 1
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
