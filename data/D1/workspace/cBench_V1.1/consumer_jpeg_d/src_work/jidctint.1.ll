; ModuleID = 'jidctint.ll'
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

; Function Attrs: noinline norecurse nounwind uwtable
define void @jpeg_idct_islow(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i16* nocapture readonly, i8** nocapture readonly, i32) #0 {
  %6 = alloca [64 x i32], align 16
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 20
  %10 = bitcast i8** %9 to i32**
  %11 = load i32*, i32** %10, align 8
  %12 = getelementptr inbounds [64 x i32], [64 x i32]* %6, i64 0, i64 0
  br label %13

; <label>:13:                                     ; preds = %5, %164
  %.024 = phi i32 [ 8, %5 ], [ %169, %164 ]
  %.0123 = phi i32* [ %12, %5 ], [ %168, %164 ]
  %.0322 = phi i32* [ %11, %5 ], [ %167, %164 ]
  %.0521 = phi i16* [ %2, %5 ], [ %166, %164 ]
  %14 = getelementptr inbounds i16, i16* %.0521, i64 8
  %15 = load i16, i16* %14, align 2
  %16 = getelementptr inbounds i16, i16* %.0521, i64 16
  %17 = load i16, i16* %16, align 2
  %18 = or i16 %17, %15
  %19 = getelementptr inbounds i16, i16* %.0521, i64 24
  %20 = load i16, i16* %19, align 2
  %21 = or i16 %18, %20
  %22 = getelementptr inbounds i16, i16* %.0521, i64 32
  %23 = load i16, i16* %22, align 2
  %24 = or i16 %21, %23
  %25 = getelementptr inbounds i16, i16* %.0521, i64 40
  %26 = load i16, i16* %25, align 2
  %27 = or i16 %24, %26
  %28 = getelementptr inbounds i16, i16* %.0521, i64 48
  %29 = load i16, i16* %28, align 2
  %30 = or i16 %27, %29
  %31 = getelementptr inbounds i16, i16* %.0521, i64 56
  %32 = load i16, i16* %31, align 2
  %33 = or i16 %30, %32
  %34 = icmp eq i16 %33, 0
  br i1 %34, label %35, label %47

; <label>:35:                                     ; preds = %13
  %36 = load i16, i16* %.0521, align 2
  %37 = sext i16 %36 to i32
  %38 = load i32, i32* %.0322, align 4
  %39 = shl i32 %38, 2
  %40 = mul i32 %39, %37
  store i32 %40, i32* %.0123, align 4
  %41 = getelementptr inbounds i32, i32* %.0123, i64 8
  store i32 %40, i32* %41, align 4
  %42 = getelementptr inbounds i32, i32* %.0123, i64 16
  store i32 %40, i32* %42, align 4
  %43 = getelementptr inbounds i32, i32* %.0123, i64 24
  store i32 %40, i32* %43, align 4
  %44 = getelementptr inbounds i32, i32* %.0123, i64 32
  store i32 %40, i32* %44, align 4
  %45 = getelementptr inbounds i32, i32* %.0123, i64 40
  store i32 %40, i32* %45, align 4
  %46 = getelementptr inbounds i32, i32* %.0123, i64 48
  store i32 %40, i32* %46, align 4
  br label %164

; <label>:47:                                     ; preds = %13
  %48 = sext i16 %32 to i32
  %49 = sext i16 %29 to i32
  %50 = sext i16 %26 to i32
  %51 = sext i16 %23 to i32
  %52 = sext i16 %20 to i32
  %53 = sext i16 %15 to i32
  %54 = sext i16 %17 to i32
  %55 = getelementptr inbounds i32, i32* %.0322, i64 16
  %56 = load i32, i32* %55, align 4
  %57 = mul nsw i32 %56, %54
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32* %.0322, i64 48
  %60 = load i32, i32* %59, align 4
  %61 = mul nsw i32 %60, %49
  %62 = sext i32 %61 to i64
  %63 = add nsw i64 %62, %58
  %64 = mul nsw i64 %63, 4433
  %65 = mul nsw i64 %62, -15137
  %66 = add nsw i64 %64, %65
  %67 = mul nsw i64 %58, 6270
  %68 = add nsw i64 %64, %67
  %69 = load i16, i16* %.0521, align 2
  %70 = sext i16 %69 to i32
  %71 = load i32, i32* %.0322, align 4
  %72 = mul nsw i32 %70, %71
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32* %.0322, i64 32
  %75 = load i32, i32* %74, align 4
  %76 = mul nsw i32 %75, %51
  %77 = sext i32 %76 to i64
  %78 = add nsw i64 %77, %73
  %79 = shl nsw i64 %78, 13
  %80 = sub nsw i64 %73, %77
  %81 = shl nsw i64 %80, 13
  %82 = add nsw i64 %79, %68
  %83 = sub nsw i64 %79, %68
  %84 = add nsw i64 %81, %66
  %85 = sub nsw i64 %81, %66
  %86 = getelementptr inbounds i32, i32* %.0322, i64 56
  %87 = load i32, i32* %86, align 4
  %88 = mul nsw i32 %87, %48
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32* %.0322, i64 40
  %91 = load i32, i32* %90, align 4
  %92 = mul nsw i32 %91, %50
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32* %.0322, i64 24
  %95 = load i32, i32* %94, align 4
  %96 = mul nsw i32 %95, %52
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32* %.0322, i64 8
  %99 = load i32, i32* %98, align 4
  %100 = mul nsw i32 %99, %53
  %101 = sext i32 %100 to i64
  %102 = add nsw i64 %101, %89
  %103 = add nsw i64 %97, %93
  %104 = add nsw i64 %97, %89
  %105 = add nsw i64 %101, %93
  %106 = add nsw i64 %105, %104
  %107 = mul nsw i64 %106, 9633
  %108 = mul nsw i64 %89, 2446
  %109 = mul nsw i64 %93, 16819
  %110 = mul nsw i64 %97, 25172
  %111 = mul nsw i64 %101, 12299
  %112 = mul nsw i64 %102, -7373
  %113 = mul nsw i64 %103, -20995
  %114 = mul nsw i64 %104, -16069
  %115 = mul nsw i64 %105, -3196
  %116 = add nsw i64 %107, %114
  %117 = add nsw i64 %107, %115
  %118 = add i64 %112, %108
  %119 = add i64 %118, %116
  %120 = add i64 %113, %109
  %121 = add i64 %120, %117
  %122 = add i64 %113, %110
  %123 = add i64 %122, %116
  %124 = add i64 %112, %111
  %125 = add i64 %124, %117
  %126 = add i64 %82, 1024
  %127 = add i64 %126, %125
  %128 = lshr i64 %127, 11
  %129 = trunc i64 %128 to i32
  store i32 %129, i32* %.0123, align 4
  %130 = add i64 %82, 1024
  %131 = sub i64 %130, %125
  %132 = lshr i64 %131, 11
  %133 = trunc i64 %132 to i32
  %134 = getelementptr inbounds i32, i32* %.0123, i64 56
  store i32 %133, i32* %134, align 4
  %135 = add i64 %84, 1024
  %136 = add i64 %135, %123
  %137 = lshr i64 %136, 11
  %138 = trunc i64 %137 to i32
  %139 = getelementptr inbounds i32, i32* %.0123, i64 8
  store i32 %138, i32* %139, align 4
  %140 = add i64 %84, 1024
  %141 = sub i64 %140, %123
  %142 = lshr i64 %141, 11
  %143 = trunc i64 %142 to i32
  %144 = getelementptr inbounds i32, i32* %.0123, i64 48
  store i32 %143, i32* %144, align 4
  %145 = add i64 %85, 1024
  %146 = add i64 %145, %121
  %147 = lshr i64 %146, 11
  %148 = trunc i64 %147 to i32
  %149 = getelementptr inbounds i32, i32* %.0123, i64 16
  store i32 %148, i32* %149, align 4
  %150 = add i64 %85, 1024
  %151 = sub i64 %150, %121
  %152 = lshr i64 %151, 11
  %153 = trunc i64 %152 to i32
  %154 = getelementptr inbounds i32, i32* %.0123, i64 40
  store i32 %153, i32* %154, align 4
  %155 = add i64 %83, 1024
  %156 = add i64 %155, %119
  %157 = lshr i64 %156, 11
  %158 = trunc i64 %157 to i32
  %159 = getelementptr inbounds i32, i32* %.0123, i64 24
  store i32 %158, i32* %159, align 4
  %160 = add i64 %83, 1024
  %161 = sub i64 %160, %119
  %162 = lshr i64 %161, 11
  %163 = trunc i64 %162 to i32
  br label %164

; <label>:164:                                    ; preds = %47, %35
  %.sink8 = phi i64 [ 32, %47 ], [ 56, %35 ]
  %.sink = phi i32 [ %163, %47 ], [ %40, %35 ]
  %165 = getelementptr inbounds i32, i32* %.0123, i64 %.sink8
  store i32 %.sink, i32* %165, align 4
  %166 = getelementptr inbounds i16, i16* %.0521, i64 1
  %167 = getelementptr inbounds i32, i32* %.0322, i64 1
  %168 = getelementptr inbounds i32, i32* %.0123, i64 1
  %169 = add nsw i32 %.024, -1
  %170 = icmp sgt i32 %.024, 1
  br i1 %170, label %13, label %171

; <label>:171:                                    ; preds = %164
  %172 = getelementptr inbounds i8, i8* %8, i64 128
  %173 = zext i32 %4 to i64
  br label %174

; <label>:174:                                    ; preds = %171, %310
  %.220 = phi i32* [ %12, %171 ], [ %312, %310 ]
  %indvars.iv19 = phi i64 [ 0, %171 ], [ %indvars.iv.next, %310 ]
  %175 = getelementptr inbounds i8*, i8** %3, i64 %indvars.iv19
  %176 = load i8*, i8** %175, align 8
  %177 = getelementptr inbounds i8, i8* %176, i64 %173
  %178 = getelementptr inbounds i32, i32* %.220, i64 1
  %179 = load i32, i32* %178, align 4
  %180 = getelementptr inbounds i32, i32* %.220, i64 2
  %181 = load i32, i32* %180, align 4
  %182 = or i32 %181, %179
  %183 = getelementptr inbounds i32, i32* %.220, i64 3
  %184 = load i32, i32* %183, align 4
  %185 = or i32 %182, %184
  %186 = getelementptr inbounds i32, i32* %.220, i64 4
  %187 = load i32, i32* %186, align 4
  %188 = or i32 %185, %187
  %189 = getelementptr inbounds i32, i32* %.220, i64 5
  %190 = load i32, i32* %189, align 4
  %191 = or i32 %188, %190
  %192 = getelementptr inbounds i32, i32* %.220, i64 6
  %193 = load i32, i32* %192, align 4
  %194 = or i32 %191, %193
  %195 = getelementptr inbounds i32, i32* %.220, i64 7
  %196 = load i32, i32* %195, align 4
  %197 = or i32 %194, %196
  %198 = icmp eq i32 %197, 0
  br i1 %198, label %199, label %208

; <label>:199:                                    ; preds = %174
  %200 = load i32, i32* %.220, align 4
  %201 = zext i32 %200 to i64
  %202 = add nuw nsw i64 %201, 16
  %203 = lshr i64 %202, 5
  %204 = and i64 %203, 1023
  %205 = getelementptr inbounds i8, i8* %172, i64 %204
  %206 = load i8, i8* %205, align 1
  store i8 %206, i8* %177, align 1
  %207 = getelementptr inbounds i8, i8* %177, i64 1
  call void @llvm.memset.p0i8.i64(i8* %207, i8 %206, i64 6, i32 1, i1 false)
  br label %310

; <label>:208:                                    ; preds = %174
  %209 = sext i32 %181 to i64
  %210 = sext i32 %193 to i64
  %211 = add nsw i64 %210, %209
  %212 = mul nsw i64 %211, 4433
  %213 = mul nsw i64 %210, -15137
  %214 = add nsw i64 %212, %213
  %215 = mul nsw i64 %209, 6270
  %216 = add nsw i64 %212, %215
  %217 = load i32, i32* %.220, align 4
  %218 = sext i32 %217 to i64
  %219 = sext i32 %187 to i64
  %220 = add nsw i64 %218, %219
  %221 = shl nsw i64 %220, 13
  %222 = sub nsw i64 %218, %219
  %223 = shl nsw i64 %222, 13
  %224 = add nsw i64 %221, %216
  %225 = sub nsw i64 %221, %216
  %226 = add nsw i64 %223, %214
  %227 = sub nsw i64 %223, %214
  %228 = sext i32 %196 to i64
  %229 = sext i32 %190 to i64
  %230 = sext i32 %184 to i64
  %231 = sext i32 %179 to i64
  %232 = add nsw i64 %228, %231
  %233 = add nsw i64 %229, %230
  %234 = add nsw i64 %228, %230
  %235 = add nsw i64 %229, %231
  %236 = add nsw i64 %234, %235
  %237 = mul nsw i64 %236, 9633
  %238 = mul nsw i64 %228, 2446
  %239 = mul nsw i64 %229, 16819
  %240 = mul nsw i64 %230, 25172
  %241 = mul nsw i64 %231, 12299
  %242 = mul nsw i64 %232, -7373
  %243 = mul nsw i64 %233, -20995
  %244 = mul nsw i64 %234, -16069
  %245 = mul nsw i64 %235, -3196
  %246 = add nsw i64 %237, %244
  %247 = add nsw i64 %237, %245
  %248 = add i64 %242, %238
  %249 = add i64 %248, %246
  %250 = add i64 %243, %239
  %251 = add i64 %250, %247
  %252 = add i64 %243, %240
  %253 = add i64 %252, %246
  %254 = add i64 %242, %241
  %255 = add i64 %254, %247
  %256 = add i64 %255, 131072
  %257 = add i64 %256, %224
  %258 = lshr i64 %257, 18
  %259 = and i64 %258, 1023
  %260 = getelementptr inbounds i8, i8* %172, i64 %259
  %261 = load i8, i8* %260, align 1
  store i8 %261, i8* %177, align 1
  %262 = sub i64 131072, %255
  %263 = add i64 %262, %224
  %264 = lshr i64 %263, 18
  %265 = and i64 %264, 1023
  %266 = getelementptr inbounds i8, i8* %172, i64 %265
  %267 = load i8, i8* %266, align 1
  %268 = getelementptr inbounds i8, i8* %177, i64 7
  store i8 %267, i8* %268, align 1
  %269 = add i64 %253, 131072
  %270 = add i64 %269, %226
  %271 = lshr i64 %270, 18
  %272 = and i64 %271, 1023
  %273 = getelementptr inbounds i8, i8* %172, i64 %272
  %274 = load i8, i8* %273, align 1
  %275 = getelementptr inbounds i8, i8* %177, i64 1
  store i8 %274, i8* %275, align 1
  %276 = sub i64 131072, %253
  %277 = add i64 %276, %226
  %278 = lshr i64 %277, 18
  %279 = and i64 %278, 1023
  %280 = getelementptr inbounds i8, i8* %172, i64 %279
  %281 = load i8, i8* %280, align 1
  %282 = getelementptr inbounds i8, i8* %177, i64 6
  store i8 %281, i8* %282, align 1
  %283 = add i64 %251, 131072
  %284 = add i64 %283, %227
  %285 = lshr i64 %284, 18
  %286 = and i64 %285, 1023
  %287 = getelementptr inbounds i8, i8* %172, i64 %286
  %288 = load i8, i8* %287, align 1
  %289 = getelementptr inbounds i8, i8* %177, i64 2
  store i8 %288, i8* %289, align 1
  %290 = sub i64 131072, %251
  %291 = add i64 %290, %227
  %292 = lshr i64 %291, 18
  %293 = and i64 %292, 1023
  %294 = getelementptr inbounds i8, i8* %172, i64 %293
  %295 = load i8, i8* %294, align 1
  %296 = getelementptr inbounds i8, i8* %177, i64 5
  store i8 %295, i8* %296, align 1
  %297 = add i64 %249, 131072
  %298 = add i64 %297, %225
  %299 = lshr i64 %298, 18
  %300 = and i64 %299, 1023
  %301 = getelementptr inbounds i8, i8* %172, i64 %300
  %302 = load i8, i8* %301, align 1
  %303 = getelementptr inbounds i8, i8* %177, i64 3
  store i8 %302, i8* %303, align 1
  %304 = sub i64 131072, %249
  %305 = add i64 %304, %225
  %306 = lshr i64 %305, 18
  %307 = and i64 %306, 1023
  %308 = getelementptr inbounds i8, i8* %172, i64 %307
  %309 = load i8, i8* %308, align 1
  br label %310

; <label>:310:                                    ; preds = %208, %199
  %.sink11 = phi i64 [ 4, %208 ], [ 7, %199 ]
  %.sink9 = phi i8 [ %309, %208 ], [ %206, %199 ]
  %311 = getelementptr inbounds i8, i8* %177, i64 %.sink11
  store i8 %.sink9, i8* %311, align 1
  %312 = getelementptr inbounds i32, i32* %.220, i64 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv19, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond, label %313, label %174

; <label>:313:                                    ; preds = %310
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
