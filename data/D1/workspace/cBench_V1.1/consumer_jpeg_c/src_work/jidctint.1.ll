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
define void @jpeg_idct_islow(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i16* nocapture readonly, i8** nocapture readonly, i32) local_unnamed_addr #0 {
  %6 = alloca [64 x i32], align 16
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 20
  %10 = bitcast i8** %9 to i32**
  %11 = load i32*, i32** %10, align 8
  %12 = getelementptr inbounds [64 x i32], [64 x i32]* %6, i64 0, i64 0
  br label %23

.preheader:                                       ; preds = %166
  %13 = getelementptr inbounds [64 x i32], [64 x i32]* %6, i64 0, i64 0
  %14 = zext i32 %4 to i64
  %15 = ptrtoint i8* %8 to i64
  %16 = ptrtoint i8* %8 to i64
  %17 = ptrtoint i8* %8 to i64
  %18 = ptrtoint i8* %8 to i64
  %19 = ptrtoint i8* %8 to i64
  %20 = ptrtoint i8* %8 to i64
  %21 = ptrtoint i8* %8 to i64
  %22 = ptrtoint i8* %8 to i64
  br label %170

; <label>:23:                                     ; preds = %166, %5
  %.024 = phi i32 [ 8, %5 ], [ %168, %166 ]
  %.0123 = phi i32* [ %12, %5 ], [ %.12, %166 ]
  %.0322 = phi i32* [ %11, %5 ], [ %.14, %166 ]
  %.0521 = phi i16* [ %2, %5 ], [ %.16, %166 ]
  %24 = getelementptr inbounds i16, i16* %.0521, i64 8
  %25 = load i16, i16* %24, align 2
  %26 = getelementptr inbounds i16, i16* %.0521, i64 16
  %27 = load i16, i16* %26, align 2
  %28 = or i16 %27, %25
  %29 = getelementptr inbounds i16, i16* %.0521, i64 24
  %30 = load i16, i16* %29, align 2
  %31 = or i16 %28, %30
  %32 = getelementptr inbounds i16, i16* %.0521, i64 32
  %33 = load i16, i16* %32, align 2
  %34 = or i16 %31, %33
  %35 = getelementptr inbounds i16, i16* %.0521, i64 40
  %36 = load i16, i16* %35, align 2
  %37 = or i16 %34, %36
  %38 = getelementptr inbounds i16, i16* %.0521, i64 48
  %39 = load i16, i16* %38, align 2
  %40 = or i16 %37, %39
  %41 = getelementptr inbounds i16, i16* %.0521, i64 56
  %42 = load i16, i16* %41, align 2
  %43 = or i16 %40, %42
  %44 = icmp eq i16 %43, 0
  br i1 %44, label %45, label %57

; <label>:45:                                     ; preds = %23
  %46 = load i16, i16* %.0521, align 2
  %47 = sext i16 %46 to i32
  %48 = load i32, i32* %.0322, align 4
  %49 = shl i32 %48, 2
  %50 = mul i32 %49, %47
  store i32 %50, i32* %.0123, align 4
  %51 = getelementptr inbounds i32, i32* %.0123, i64 8
  store i32 %50, i32* %51, align 4
  %52 = getelementptr inbounds i32, i32* %.0123, i64 16
  store i32 %50, i32* %52, align 4
  %53 = getelementptr inbounds i32, i32* %.0123, i64 24
  store i32 %50, i32* %53, align 4
  %54 = getelementptr inbounds i32, i32* %.0123, i64 32
  store i32 %50, i32* %54, align 4
  %55 = getelementptr inbounds i32, i32* %.0123, i64 40
  store i32 %50, i32* %55, align 4
  %56 = getelementptr inbounds i32, i32* %.0123, i64 48
  store i32 %50, i32* %56, align 4
  br label %166

; <label>:57:                                     ; preds = %23
  %promoted28 = sext i16 %42 to i64
  %promoted25 = sext i16 %39 to i64
  %promoted29 = sext i16 %36 to i64
  %promoted27 = sext i16 %33 to i64
  %promoted30 = sext i16 %30 to i64
  %promoted = sext i16 %27 to i64
  %promoted31 = sext i16 %25 to i64
  %58 = getelementptr inbounds i32, i32* %.0322, i64 16
  %59 = load i32, i32* %58, align 4
  %60 = sext i32 %59 to i64
  %61 = mul nsw i64 %60, %promoted
  %62 = getelementptr inbounds i32, i32* %.0322, i64 48
  %63 = load i32, i32* %62, align 4
  %64 = sext i32 %63 to i64
  %65 = mul nsw i64 %64, %promoted25
  %66 = add nsw i64 %65, %61
  %67 = mul nsw i64 %66, 4433
  %68 = mul nsw i64 %65, -15137
  %69 = add nsw i64 %67, %68
  %70 = mul nsw i64 %61, 6270
  %71 = add nsw i64 %67, %70
  %72 = load i16, i16* %.0521, align 2
  %73 = sext i16 %72 to i64
  %74 = load i32, i32* %.0322, align 4
  %promoted26 = sext i32 %74 to i64
  %75 = mul nsw i64 %73, %promoted26
  %76 = getelementptr inbounds i32, i32* %.0322, i64 32
  %77 = load i32, i32* %76, align 4
  %78 = sext i32 %77 to i64
  %79 = mul nsw i64 %78, %promoted27
  %80 = add nsw i64 %79, %75
  %81 = shl nsw i64 %80, 13
  %82 = sub nsw i64 %75, %79
  %83 = shl nsw i64 %82, 13
  %84 = add nsw i64 %81, %71
  %85 = sub nsw i64 %81, %71
  %86 = add nsw i64 %83, %69
  %87 = sub nsw i64 %83, %69
  %88 = getelementptr inbounds i32, i32* %.0322, i64 56
  %89 = load i32, i32* %88, align 4
  %90 = sext i32 %89 to i64
  %91 = mul nsw i64 %90, %promoted28
  %92 = getelementptr inbounds i32, i32* %.0322, i64 40
  %93 = load i32, i32* %92, align 4
  %94 = sext i32 %93 to i64
  %95 = mul nsw i64 %94, %promoted29
  %96 = getelementptr inbounds i32, i32* %.0322, i64 24
  %97 = load i32, i32* %96, align 4
  %98 = sext i32 %97 to i64
  %99 = mul nsw i64 %98, %promoted30
  %100 = getelementptr inbounds i32, i32* %.0322, i64 8
  %101 = load i32, i32* %100, align 4
  %102 = sext i32 %101 to i64
  %103 = mul nsw i64 %102, %promoted31
  %104 = add nsw i64 %103, %91
  %105 = add nsw i64 %99, %95
  %106 = add nsw i64 %99, %91
  %107 = add nsw i64 %103, %95
  %108 = add nsw i64 %107, %106
  %109 = mul nsw i64 %108, 9633
  %110 = mul nsw i64 %91, 2446
  %111 = mul nsw i64 %95, 16819
  %112 = mul nsw i64 %99, 25172
  %113 = mul nsw i64 %103, 12299
  %114 = mul nsw i64 %104, -7373
  %115 = mul nsw i64 %105, -20995
  %116 = mul nsw i64 %106, -16069
  %117 = mul nsw i64 %107, -3196
  %118 = add nsw i64 %109, %116
  %119 = add nsw i64 %109, %117
  %120 = add i64 %114, %110
  %121 = add i64 %120, %118
  %122 = add i64 %115, %111
  %123 = add i64 %122, %119
  %124 = add i64 %115, %112
  %125 = add i64 %124, %118
  %126 = add i64 %114, %113
  %127 = add i64 %126, %119
  %128 = add i64 %84, 1024
  %129 = add i64 %128, %127
  %130 = lshr i64 %129, 11
  %131 = trunc i64 %130 to i32
  store i32 %131, i32* %.0123, align 4
  %132 = add i64 %84, 1024
  %133 = sub i64 %132, %127
  %134 = lshr i64 %133, 11
  %135 = trunc i64 %134 to i32
  %136 = getelementptr inbounds i32, i32* %.0123, i64 56
  store i32 %135, i32* %136, align 4
  %137 = add i64 %86, 1024
  %138 = add i64 %137, %125
  %139 = lshr i64 %138, 11
  %140 = trunc i64 %139 to i32
  %141 = getelementptr inbounds i32, i32* %.0123, i64 8
  store i32 %140, i32* %141, align 4
  %142 = add i64 %86, 1024
  %143 = sub i64 %142, %125
  %144 = lshr i64 %143, 11
  %145 = trunc i64 %144 to i32
  %146 = getelementptr inbounds i32, i32* %.0123, i64 48
  store i32 %145, i32* %146, align 4
  %147 = add i64 %87, 1024
  %148 = add i64 %147, %123
  %149 = lshr i64 %148, 11
  %150 = trunc i64 %149 to i32
  %151 = getelementptr inbounds i32, i32* %.0123, i64 16
  store i32 %150, i32* %151, align 4
  %152 = add i64 %87, 1024
  %153 = sub i64 %152, %123
  %154 = lshr i64 %153, 11
  %155 = trunc i64 %154 to i32
  %156 = getelementptr inbounds i32, i32* %.0123, i64 40
  store i32 %155, i32* %156, align 4
  %157 = add i64 %85, 1024
  %158 = add i64 %157, %121
  %159 = lshr i64 %158, 11
  %160 = trunc i64 %159 to i32
  %161 = getelementptr inbounds i32, i32* %.0123, i64 24
  store i32 %160, i32* %161, align 4
  %162 = add i64 %85, 1024
  %163 = sub i64 %162, %121
  %164 = lshr i64 %163, 11
  %165 = trunc i64 %164 to i32
  br label %166

; <label>:166:                                    ; preds = %57, %45
  %.sink8 = phi i64 [ 32, %57 ], [ 56, %45 ]
  %.sink = phi i32 [ %165, %57 ], [ %50, %45 ]
  %167 = getelementptr inbounds i32, i32* %.0123, i64 %.sink8
  store i32 %.sink, i32* %167, align 4
  %.12 = getelementptr inbounds i32, i32* %.0123, i64 1
  %.14 = getelementptr inbounds i32, i32* %.0322, i64 1
  %.16 = getelementptr inbounds i16, i16* %.0521, i64 1
  %168 = add nsw i32 %.024, -1
  %169 = icmp sgt i32 %.024, 1
  br i1 %169, label %23, label %.preheader

; <label>:170:                                    ; preds = %297, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %297 ]
  %.219 = phi i32* [ %13, %.preheader ], [ %.3, %297 ]
  %171 = getelementptr inbounds i8*, i8** %3, i64 %indvars.iv
  %172 = load i8*, i8** %171, align 8
  %173 = getelementptr inbounds i8, i8* %172, i64 %14
  %174 = getelementptr inbounds i32, i32* %.219, i64 1
  %175 = load i32, i32* %174, align 4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds i32, i32* %.219, i64 2
  %178 = load i32, i32* %177, align 4
  %179 = sext i32 %178 to i64
  %180 = or i32 %178, %175
  %181 = getelementptr inbounds i32, i32* %.219, i64 3
  %182 = load i32, i32* %181, align 4
  %183 = sext i32 %182 to i64
  %184 = or i32 %180, %182
  %185 = getelementptr inbounds i32, i32* %.219, i64 4
  %186 = load i32, i32* %185, align 4
  %187 = sext i32 %186 to i64
  %188 = or i32 %184, %186
  %189 = getelementptr inbounds i32, i32* %.219, i64 5
  %190 = load i32, i32* %189, align 4
  %191 = sext i32 %190 to i64
  %192 = or i32 %188, %190
  %193 = getelementptr inbounds i32, i32* %.219, i64 6
  %194 = load i32, i32* %193, align 4
  %195 = sext i32 %194 to i64
  %196 = or i32 %192, %194
  %197 = getelementptr inbounds i32, i32* %.219, i64 7
  %198 = load i32, i32* %197, align 4
  %199 = sext i32 %198 to i64
  %200 = or i32 %196, %198
  %201 = icmp eq i32 %200, 0
  br i1 %201, label %202, label %210

; <label>:202:                                    ; preds = %170
  %203 = load i32, i32* %.219, align 4
  %204 = zext i32 %203 to i64
  %205 = add nuw nsw i64 %204, 16
  %206 = lshr i64 %205, 5
  %207 = and i64 %206, 1023
  %sunkaddr32 = add i64 %15, %207
  %sunkaddr33 = add i64 %sunkaddr32, 128
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i8*
  %208 = load i8, i8* %sunkaddr34, align 1
  store i8 %208, i8* %173, align 1
  %209 = getelementptr inbounds i8, i8* %173, i64 1
  call void @llvm.memset.p0i8.i64(i8* %209, i8 %208, i64 6, i32 1, i1 false)
  br label %297

; <label>:210:                                    ; preds = %170
  %211 = add nsw i64 %195, %179
  %212 = mul nsw i64 %211, 4433
  %213 = mul nsw i64 %195, -15137
  %214 = add nsw i64 %212, %213
  %215 = mul nsw i64 %179, 6270
  %216 = add nsw i64 %212, %215
  %217 = load i32, i32* %.219, align 4
  %218 = sext i32 %217 to i64
  %219 = add nsw i64 %218, %187
  %220 = shl nsw i64 %219, 13
  %221 = sub nsw i64 %218, %187
  %222 = shl nsw i64 %221, 13
  %223 = add nsw i64 %220, %216
  %224 = sub nsw i64 %220, %216
  %225 = add nsw i64 %222, %214
  %226 = sub nsw i64 %222, %214
  %227 = add nsw i64 %199, %176
  %228 = add nsw i64 %191, %183
  %229 = add nsw i64 %199, %183
  %230 = add nsw i64 %191, %176
  %231 = add nsw i64 %229, %230
  %232 = mul nsw i64 %231, 9633
  %233 = mul nsw i64 %199, 2446
  %234 = mul nsw i64 %191, 16819
  %235 = mul nsw i64 %183, 25172
  %236 = mul nsw i64 %176, 12299
  %237 = mul nsw i64 %227, -7373
  %238 = mul nsw i64 %228, -20995
  %239 = mul nsw i64 %229, -16069
  %240 = mul nsw i64 %230, -3196
  %241 = add nsw i64 %232, %239
  %242 = add nsw i64 %232, %240
  %243 = add i64 %237, %233
  %244 = add i64 %243, %241
  %245 = add i64 %238, %234
  %246 = add i64 %245, %242
  %247 = add i64 %238, %235
  %248 = add i64 %247, %241
  %249 = add i64 %237, %236
  %250 = add i64 %249, %242
  %251 = add i64 %250, 131072
  %252 = add i64 %251, %223
  %253 = lshr i64 %252, 18
  %254 = and i64 %253, 1023
  %sunkaddr36 = add i64 %22, %254
  %sunkaddr37 = add i64 %sunkaddr36, 128
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to i8*
  %255 = load i8, i8* %sunkaddr38, align 1
  store i8 %255, i8* %173, align 1
  %256 = sub i64 131072, %250
  %257 = add i64 %256, %223
  %258 = lshr i64 %257, 18
  %259 = and i64 %258, 1023
  %sunkaddr40 = add i64 %21, %259
  %sunkaddr41 = add i64 %sunkaddr40, 128
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to i8*
  %260 = load i8, i8* %sunkaddr42, align 1
  %261 = getelementptr inbounds i8, i8* %173, i64 7
  store i8 %260, i8* %261, align 1
  %262 = add i64 %248, 131072
  %263 = add i64 %262, %225
  %264 = lshr i64 %263, 18
  %265 = and i64 %264, 1023
  %sunkaddr44 = add i64 %20, %265
  %sunkaddr45 = add i64 %sunkaddr44, 128
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to i8*
  %266 = load i8, i8* %sunkaddr46, align 1
  %267 = getelementptr inbounds i8, i8* %173, i64 1
  store i8 %266, i8* %267, align 1
  %268 = sub i64 131072, %248
  %269 = add i64 %268, %225
  %270 = lshr i64 %269, 18
  %271 = and i64 %270, 1023
  %sunkaddr48 = add i64 %19, %271
  %sunkaddr49 = add i64 %sunkaddr48, 128
  %sunkaddr50 = inttoptr i64 %sunkaddr49 to i8*
  %272 = load i8, i8* %sunkaddr50, align 1
  %273 = getelementptr inbounds i8, i8* %173, i64 6
  store i8 %272, i8* %273, align 1
  %274 = add i64 %246, 131072
  %275 = add i64 %274, %226
  %276 = lshr i64 %275, 18
  %277 = and i64 %276, 1023
  %sunkaddr52 = add i64 %18, %277
  %sunkaddr53 = add i64 %sunkaddr52, 128
  %sunkaddr54 = inttoptr i64 %sunkaddr53 to i8*
  %278 = load i8, i8* %sunkaddr54, align 1
  %279 = getelementptr inbounds i8, i8* %173, i64 2
  store i8 %278, i8* %279, align 1
  %280 = sub i64 131072, %246
  %281 = add i64 %280, %226
  %282 = lshr i64 %281, 18
  %283 = and i64 %282, 1023
  %sunkaddr56 = add i64 %17, %283
  %sunkaddr57 = add i64 %sunkaddr56, 128
  %sunkaddr58 = inttoptr i64 %sunkaddr57 to i8*
  %284 = load i8, i8* %sunkaddr58, align 1
  %285 = getelementptr inbounds i8, i8* %173, i64 5
  store i8 %284, i8* %285, align 1
  %286 = add i64 %244, 131072
  %287 = add i64 %286, %224
  %288 = lshr i64 %287, 18
  %289 = and i64 %288, 1023
  %sunkaddr60 = add i64 %16, %289
  %sunkaddr61 = add i64 %sunkaddr60, 128
  %sunkaddr62 = inttoptr i64 %sunkaddr61 to i8*
  %290 = load i8, i8* %sunkaddr62, align 1
  %291 = getelementptr inbounds i8, i8* %173, i64 3
  store i8 %290, i8* %291, align 1
  %292 = sub i64 131072, %244
  %293 = add i64 %292, %224
  %294 = lshr i64 %293, 18
  %295 = and i64 %294, 1023
  %sunkaddr64 = add i64 %15, %295
  %sunkaddr65 = add i64 %sunkaddr64, 128
  %sunkaddr66 = inttoptr i64 %sunkaddr65 to i8*
  %296 = load i8, i8* %sunkaddr66, align 1
  br label %297

; <label>:297:                                    ; preds = %210, %202
  %.sink11 = phi i64 [ 4, %210 ], [ 7, %202 ]
  %.sink9 = phi i8 [ %296, %210 ], [ %208, %202 ]
  %298 = getelementptr inbounds i8, i8* %173, i64 %.sink11
  store i8 %.sink9, i8* %298, align 1
  %.3 = getelementptr inbounds i32, i32* %.219, i64 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond, label %299, label %170

; <label>:299:                                    ; preds = %297
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
