; ModuleID = 'jidctfst.ll'
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

; Function Attrs: noinline norecurse nounwind uwtable
define void @jpeg_idct_ifast(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i16* nocapture readonly, i8** nocapture readonly, i32) #0 {
  %6 = alloca [64 x i32], align 16
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 20
  %10 = bitcast i8** %9 to i32**
  %11 = load i32*, i32** %10, align 8
  %12 = getelementptr inbounds [64 x i32], [64 x i32]* %6, i64 0, i64 0
  br label %13

; <label>:13:                                     ; preds = %5, %130
  %.018 = phi i32 [ 8, %5 ], [ %135, %130 ]
  %.0117 = phi i32* [ %12, %5 ], [ %134, %130 ]
  %.0316 = phi i32* [ %11, %5 ], [ %133, %130 ]
  %.0515 = phi i16* [ %2, %5 ], [ %132, %130 ]
  %14 = getelementptr inbounds i16, i16* %.0515, i64 8
  %15 = load i16, i16* %14, align 2
  %16 = getelementptr inbounds i16, i16* %.0515, i64 16
  %17 = load i16, i16* %16, align 2
  %18 = or i16 %17, %15
  %19 = getelementptr inbounds i16, i16* %.0515, i64 24
  %20 = load i16, i16* %19, align 2
  %21 = or i16 %18, %20
  %22 = getelementptr inbounds i16, i16* %.0515, i64 32
  %23 = load i16, i16* %22, align 2
  %24 = or i16 %21, %23
  %25 = getelementptr inbounds i16, i16* %.0515, i64 40
  %26 = load i16, i16* %25, align 2
  %27 = or i16 %24, %26
  %28 = getelementptr inbounds i16, i16* %.0515, i64 48
  %29 = load i16, i16* %28, align 2
  %30 = or i16 %27, %29
  %31 = getelementptr inbounds i16, i16* %.0515, i64 56
  %32 = load i16, i16* %31, align 2
  %33 = or i16 %30, %32
  %34 = icmp eq i16 %33, 0
  %35 = load i16, i16* %.0515, align 2
  %36 = sext i16 %35 to i32
  %37 = load i32, i32* %.0316, align 4
  %38 = mul nsw i32 %36, %37
  br i1 %34, label %39, label %46

; <label>:39:                                     ; preds = %13
  store i32 %38, i32* %.0117, align 4
  %40 = getelementptr inbounds i32, i32* %.0117, i64 8
  store i32 %38, i32* %40, align 4
  %41 = getelementptr inbounds i32, i32* %.0117, i64 16
  store i32 %38, i32* %41, align 4
  %42 = getelementptr inbounds i32, i32* %.0117, i64 24
  store i32 %38, i32* %42, align 4
  %43 = getelementptr inbounds i32, i32* %.0117, i64 32
  store i32 %38, i32* %43, align 4
  %44 = getelementptr inbounds i32, i32* %.0117, i64 40
  store i32 %38, i32* %44, align 4
  %45 = getelementptr inbounds i32, i32* %.0117, i64 48
  store i32 %38, i32* %45, align 4
  br label %130

; <label>:46:                                     ; preds = %13
  %47 = sext i16 %32 to i32
  %48 = sext i16 %29 to i32
  %49 = sext i16 %26 to i32
  %50 = sext i16 %23 to i32
  %51 = sext i16 %20 to i32
  %52 = sext i16 %15 to i32
  %53 = sext i16 %17 to i32
  %54 = getelementptr inbounds i32, i32* %.0316, i64 16
  %55 = load i32, i32* %54, align 4
  %56 = mul nsw i32 %55, %53
  %57 = getelementptr inbounds i32, i32* %.0316, i64 32
  %58 = load i32, i32* %57, align 4
  %59 = mul nsw i32 %58, %50
  %60 = getelementptr inbounds i32, i32* %.0316, i64 48
  %61 = load i32, i32* %60, align 4
  %62 = mul nsw i32 %61, %48
  %63 = add nsw i32 %59, %38
  %64 = sub nsw i32 %38, %59
  %65 = add nsw i32 %62, %56
  %66 = sub nsw i32 %56, %62
  %67 = sext i32 %66 to i64
  %68 = mul nsw i64 %67, 362
  %69 = lshr i64 %68, 8
  %70 = trunc i64 %69 to i32
  %71 = sub nsw i32 %70, %65
  %72 = add nsw i32 %65, %63
  %73 = sub nsw i32 %63, %65
  %74 = add nsw i32 %71, %64
  %75 = sub nsw i32 %64, %71
  %76 = getelementptr inbounds i32, i32* %.0316, i64 8
  %77 = load i32, i32* %76, align 4
  %78 = mul nsw i32 %77, %52
  %79 = getelementptr inbounds i32, i32* %.0316, i64 24
  %80 = load i32, i32* %79, align 4
  %81 = mul nsw i32 %80, %51
  %82 = getelementptr inbounds i32, i32* %.0316, i64 40
  %83 = load i32, i32* %82, align 4
  %84 = mul nsw i32 %83, %49
  %85 = getelementptr inbounds i32, i32* %.0316, i64 56
  %86 = load i32, i32* %85, align 4
  %87 = mul nsw i32 %86, %47
  %88 = add nsw i32 %84, %81
  %89 = sub nsw i32 %84, %81
  %90 = add nsw i32 %87, %78
  %91 = sub nsw i32 %78, %87
  %92 = add nsw i32 %90, %88
  %93 = sub nsw i32 %90, %88
  %94 = sext i32 %93 to i64
  %95 = mul nsw i64 %94, 362
  %96 = lshr i64 %95, 8
  %97 = trunc i64 %96 to i32
  %98 = add nsw i32 %91, %89
  %99 = sext i32 %98 to i64
  %100 = mul nsw i64 %99, 473
  %101 = lshr i64 %100, 8
  %102 = trunc i64 %101 to i32
  %103 = sext i32 %91 to i64
  %104 = mul nsw i64 %103, 277
  %105 = lshr i64 %104, 8
  %106 = trunc i64 %105 to i32
  %107 = sub nsw i32 %106, %102
  %108 = sext i32 %89 to i64
  %109 = mul nsw i64 %108, -669
  %110 = lshr i64 %109, 8
  %111 = trunc i64 %110 to i32
  %112 = sub i32 %111, %92
  %113 = add i32 %112, %102
  %114 = sub nsw i32 %97, %113
  %115 = add nsw i32 %114, %107
  %116 = add nsw i32 %92, %72
  store i32 %116, i32* %.0117, align 4
  %117 = sub nsw i32 %72, %92
  %118 = getelementptr inbounds i32, i32* %.0117, i64 56
  store i32 %117, i32* %118, align 4
  %119 = add nsw i32 %113, %74
  %120 = getelementptr inbounds i32, i32* %.0117, i64 8
  store i32 %119, i32* %120, align 4
  %121 = sub nsw i32 %74, %113
  %122 = getelementptr inbounds i32, i32* %.0117, i64 48
  store i32 %121, i32* %122, align 4
  %123 = add nsw i32 %114, %75
  %124 = getelementptr inbounds i32, i32* %.0117, i64 16
  store i32 %123, i32* %124, align 4
  %125 = sub nsw i32 %75, %114
  %126 = getelementptr inbounds i32, i32* %.0117, i64 40
  store i32 %125, i32* %126, align 4
  %127 = add nsw i32 %115, %73
  %128 = getelementptr inbounds i32, i32* %.0117, i64 32
  store i32 %127, i32* %128, align 4
  %129 = sub nsw i32 %73, %115
  br label %130

; <label>:130:                                    ; preds = %46, %39
  %.sink8 = phi i64 [ 24, %46 ], [ 56, %39 ]
  %.sink = phi i32 [ %129, %46 ], [ %38, %39 ]
  %131 = getelementptr inbounds i32, i32* %.0117, i64 %.sink8
  store i32 %.sink, i32* %131, align 4
  %132 = getelementptr inbounds i16, i16* %.0515, i64 1
  %133 = getelementptr inbounds i32, i32* %.0316, i64 1
  %134 = getelementptr inbounds i32, i32* %.0117, i64 1
  %135 = add nsw i32 %.018, -1
  %136 = icmp sgt i32 %.018, 1
  br i1 %136, label %13, label %137

; <label>:137:                                    ; preds = %130
  %138 = getelementptr inbounds i8, i8* %8, i64 128
  %139 = zext i32 %4 to i64
  br label %140

; <label>:140:                                    ; preds = %137, %269
  %.214 = phi i32* [ %12, %137 ], [ %271, %269 ]
  %indvars.iv13 = phi i64 [ 0, %137 ], [ %indvars.iv.next, %269 ]
  %141 = getelementptr inbounds i8*, i8** %3, i64 %indvars.iv13
  %142 = load i8*, i8** %141, align 8
  %143 = getelementptr inbounds i8, i8* %142, i64 %139
  %144 = getelementptr inbounds i32, i32* %.214, i64 1
  %145 = load i32, i32* %144, align 4
  %146 = getelementptr inbounds i32, i32* %.214, i64 2
  %147 = load i32, i32* %146, align 4
  %148 = or i32 %147, %145
  %149 = getelementptr inbounds i32, i32* %.214, i64 3
  %150 = load i32, i32* %149, align 4
  %151 = or i32 %148, %150
  %152 = getelementptr inbounds i32, i32* %.214, i64 4
  %153 = load i32, i32* %152, align 4
  %154 = or i32 %151, %153
  %155 = getelementptr inbounds i32, i32* %.214, i64 5
  %156 = load i32, i32* %155, align 4
  %157 = or i32 %154, %156
  %158 = getelementptr inbounds i32, i32* %.214, i64 6
  %159 = load i32, i32* %158, align 4
  %160 = or i32 %157, %159
  %161 = getelementptr inbounds i32, i32* %.214, i64 7
  %162 = load i32, i32* %161, align 4
  %163 = or i32 %160, %162
  %164 = icmp eq i32 %163, 0
  %165 = load i32, i32* %.214, align 4
  br i1 %164, label %166, label %173

; <label>:166:                                    ; preds = %140
  %167 = lshr i32 %165, 5
  %168 = and i32 %167, 1023
  %169 = zext i32 %168 to i64
  %170 = getelementptr inbounds i8, i8* %138, i64 %169
  %171 = load i8, i8* %170, align 1
  store i8 %171, i8* %143, align 1
  %172 = getelementptr inbounds i8, i8* %143, i64 1
  call void @llvm.memset.p0i8.i64(i8* %172, i8 %171, i64 6, i32 1, i1 false)
  br label %269

; <label>:173:                                    ; preds = %140
  %174 = add nsw i32 %165, %153
  %175 = sub nsw i32 %165, %153
  %176 = add nsw i32 %159, %147
  %177 = sub nsw i32 %147, %159
  %178 = sext i32 %177 to i64
  %179 = mul nsw i64 %178, 362
  %180 = lshr i64 %179, 8
  %181 = trunc i64 %180 to i32
  %182 = sub nsw i32 %181, %176
  %183 = add nsw i32 %174, %176
  %184 = sub nsw i32 %174, %176
  %185 = add nsw i32 %182, %175
  %186 = sub nsw i32 %175, %182
  %187 = add nsw i32 %156, %150
  %188 = sub nsw i32 %156, %150
  %189 = add nsw i32 %162, %145
  %190 = sub nsw i32 %145, %162
  %191 = add nsw i32 %189, %187
  %192 = sub nsw i32 %189, %187
  %193 = sext i32 %192 to i64
  %194 = mul nsw i64 %193, 362
  %195 = lshr i64 %194, 8
  %196 = trunc i64 %195 to i32
  %197 = add nsw i32 %190, %188
  %198 = sext i32 %197 to i64
  %199 = mul nsw i64 %198, 473
  %200 = lshr i64 %199, 8
  %201 = trunc i64 %200 to i32
  %202 = sext i32 %190 to i64
  %203 = mul nsw i64 %202, 277
  %204 = lshr i64 %203, 8
  %205 = trunc i64 %204 to i32
  %206 = sub nsw i32 %205, %201
  %207 = sext i32 %188 to i64
  %208 = mul nsw i64 %207, -669
  %209 = lshr i64 %208, 8
  %210 = trunc i64 %209 to i32
  %211 = sub i32 %210, %191
  %212 = add i32 %211, %201
  %213 = sub nsw i32 %196, %212
  %214 = add nsw i32 %213, %206
  %215 = add nsw i32 %183, %191
  %216 = lshr i32 %215, 5
  %217 = and i32 %216, 1023
  %218 = zext i32 %217 to i64
  %219 = getelementptr inbounds i8, i8* %138, i64 %218
  %220 = load i8, i8* %219, align 1
  store i8 %220, i8* %143, align 1
  %221 = sub nsw i32 %183, %191
  %222 = lshr i32 %221, 5
  %223 = and i32 %222, 1023
  %224 = zext i32 %223 to i64
  %225 = getelementptr inbounds i8, i8* %138, i64 %224
  %226 = load i8, i8* %225, align 1
  %227 = getelementptr inbounds i8, i8* %143, i64 7
  store i8 %226, i8* %227, align 1
  %228 = add nsw i32 %212, %185
  %229 = lshr i32 %228, 5
  %230 = and i32 %229, 1023
  %231 = zext i32 %230 to i64
  %232 = getelementptr inbounds i8, i8* %138, i64 %231
  %233 = load i8, i8* %232, align 1
  %234 = getelementptr inbounds i8, i8* %143, i64 1
  store i8 %233, i8* %234, align 1
  %235 = sub nsw i32 %185, %212
  %236 = lshr i32 %235, 5
  %237 = and i32 %236, 1023
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds i8, i8* %138, i64 %238
  %240 = load i8, i8* %239, align 1
  %241 = getelementptr inbounds i8, i8* %143, i64 6
  store i8 %240, i8* %241, align 1
  %242 = add nsw i32 %213, %186
  %243 = lshr i32 %242, 5
  %244 = and i32 %243, 1023
  %245 = zext i32 %244 to i64
  %246 = getelementptr inbounds i8, i8* %138, i64 %245
  %247 = load i8, i8* %246, align 1
  %248 = getelementptr inbounds i8, i8* %143, i64 2
  store i8 %247, i8* %248, align 1
  %249 = sub nsw i32 %186, %213
  %250 = lshr i32 %249, 5
  %251 = and i32 %250, 1023
  %252 = zext i32 %251 to i64
  %253 = getelementptr inbounds i8, i8* %138, i64 %252
  %254 = load i8, i8* %253, align 1
  %255 = getelementptr inbounds i8, i8* %143, i64 5
  store i8 %254, i8* %255, align 1
  %256 = add nsw i32 %214, %184
  %257 = lshr i32 %256, 5
  %258 = and i32 %257, 1023
  %259 = zext i32 %258 to i64
  %260 = getelementptr inbounds i8, i8* %138, i64 %259
  %261 = load i8, i8* %260, align 1
  %262 = getelementptr inbounds i8, i8* %143, i64 4
  store i8 %261, i8* %262, align 1
  %263 = sub nsw i32 %184, %214
  %264 = lshr i32 %263, 5
  %265 = and i32 %264, 1023
  %266 = zext i32 %265 to i64
  %267 = getelementptr inbounds i8, i8* %138, i64 %266
  %268 = load i8, i8* %267, align 1
  br label %269

; <label>:269:                                    ; preds = %173, %166
  %.sink11 = phi i64 [ 3, %173 ], [ 7, %166 ]
  %.sink9 = phi i8 [ %268, %173 ], [ %171, %166 ]
  %270 = getelementptr inbounds i8, i8* %143, i64 %.sink11
  store i8 %.sink9, i8* %270, align 1
  %271 = getelementptr inbounds i32, i32* %.214, i64 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond, label %272, label %140

; <label>:272:                                    ; preds = %269
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
