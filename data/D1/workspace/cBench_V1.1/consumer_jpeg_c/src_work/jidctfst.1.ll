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
define void @jpeg_idct_ifast(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i16* nocapture readonly, i8** nocapture readonly, i32) local_unnamed_addr #0 {
  %6 = alloca [64 x i32], align 16
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 20
  %10 = bitcast i8** %9 to i32**
  %11 = load i32*, i32** %10, align 8
  %12 = getelementptr inbounds [64 x i32], [64 x i32]* %6, i64 0, i64 0
  br label %23

.preheader:                                       ; preds = %140
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
  br label %144

; <label>:23:                                     ; preds = %140, %5
  %.018 = phi i32 [ 8, %5 ], [ %142, %140 ]
  %.0117 = phi i32* [ %12, %5 ], [ %.12, %140 ]
  %.0316 = phi i32* [ %11, %5 ], [ %.14, %140 ]
  %.0515 = phi i16* [ %2, %5 ], [ %.16, %140 ]
  %24 = getelementptr inbounds i16, i16* %.0515, i64 8
  %25 = load i16, i16* %24, align 2
  %26 = getelementptr inbounds i16, i16* %.0515, i64 16
  %27 = load i16, i16* %26, align 2
  %28 = or i16 %27, %25
  %29 = getelementptr inbounds i16, i16* %.0515, i64 24
  %30 = load i16, i16* %29, align 2
  %31 = or i16 %28, %30
  %32 = getelementptr inbounds i16, i16* %.0515, i64 32
  %33 = load i16, i16* %32, align 2
  %34 = or i16 %31, %33
  %35 = getelementptr inbounds i16, i16* %.0515, i64 40
  %36 = load i16, i16* %35, align 2
  %37 = or i16 %34, %36
  %38 = getelementptr inbounds i16, i16* %.0515, i64 48
  %39 = load i16, i16* %38, align 2
  %40 = or i16 %37, %39
  %41 = getelementptr inbounds i16, i16* %.0515, i64 56
  %42 = load i16, i16* %41, align 2
  %43 = or i16 %40, %42
  %44 = icmp eq i16 %43, 0
  %45 = load i16, i16* %.0515, align 2
  %46 = sext i16 %45 to i32
  %47 = load i32, i32* %.0316, align 4
  %48 = mul nsw i32 %46, %47
  br i1 %44, label %49, label %56

; <label>:49:                                     ; preds = %23
  store i32 %48, i32* %.0117, align 4
  %50 = getelementptr inbounds i32, i32* %.0117, i64 8
  store i32 %48, i32* %50, align 4
  %51 = getelementptr inbounds i32, i32* %.0117, i64 16
  store i32 %48, i32* %51, align 4
  %52 = getelementptr inbounds i32, i32* %.0117, i64 24
  store i32 %48, i32* %52, align 4
  %53 = getelementptr inbounds i32, i32* %.0117, i64 32
  store i32 %48, i32* %53, align 4
  %54 = getelementptr inbounds i32, i32* %.0117, i64 40
  store i32 %48, i32* %54, align 4
  %55 = getelementptr inbounds i32, i32* %.0117, i64 48
  store i32 %48, i32* %55, align 4
  br label %140

; <label>:56:                                     ; preds = %23
  %57 = sext i16 %42 to i32
  %58 = sext i16 %39 to i32
  %59 = sext i16 %36 to i32
  %60 = sext i16 %33 to i32
  %61 = sext i16 %30 to i32
  %62 = sext i16 %27 to i32
  %63 = sext i16 %25 to i32
  %64 = getelementptr inbounds i32, i32* %.0316, i64 16
  %65 = load i32, i32* %64, align 4
  %66 = mul nsw i32 %65, %62
  %67 = getelementptr inbounds i32, i32* %.0316, i64 32
  %68 = load i32, i32* %67, align 4
  %69 = mul nsw i32 %68, %60
  %70 = getelementptr inbounds i32, i32* %.0316, i64 48
  %71 = load i32, i32* %70, align 4
  %72 = mul nsw i32 %71, %58
  %73 = add nsw i32 %69, %48
  %74 = sub nsw i32 %48, %69
  %75 = add nsw i32 %72, %66
  %76 = sub nsw i32 %66, %72
  %77 = sext i32 %76 to i64
  %78 = mul nsw i64 %77, 362
  %79 = lshr i64 %78, 8
  %80 = trunc i64 %79 to i32
  %81 = sub nsw i32 %80, %75
  %82 = add nsw i32 %75, %73
  %83 = sub nsw i32 %73, %75
  %84 = add nsw i32 %81, %74
  %85 = sub nsw i32 %74, %81
  %86 = getelementptr inbounds i32, i32* %.0316, i64 8
  %87 = load i32, i32* %86, align 4
  %88 = mul nsw i32 %87, %63
  %89 = getelementptr inbounds i32, i32* %.0316, i64 24
  %90 = load i32, i32* %89, align 4
  %91 = mul nsw i32 %90, %61
  %92 = getelementptr inbounds i32, i32* %.0316, i64 40
  %93 = load i32, i32* %92, align 4
  %94 = mul nsw i32 %93, %59
  %95 = getelementptr inbounds i32, i32* %.0316, i64 56
  %96 = load i32, i32* %95, align 4
  %97 = mul nsw i32 %96, %57
  %98 = add nsw i32 %94, %91
  %99 = sub nsw i32 %94, %91
  %100 = add nsw i32 %97, %88
  %101 = sub nsw i32 %88, %97
  %102 = add nsw i32 %100, %98
  %103 = sub nsw i32 %100, %98
  %104 = sext i32 %103 to i64
  %105 = mul nsw i64 %104, 362
  %106 = lshr i64 %105, 8
  %107 = trunc i64 %106 to i32
  %108 = add nsw i32 %101, %99
  %109 = sext i32 %108 to i64
  %110 = mul nsw i64 %109, 473
  %111 = lshr i64 %110, 8
  %112 = trunc i64 %111 to i32
  %113 = sext i32 %101 to i64
  %114 = mul nsw i64 %113, 277
  %115 = lshr i64 %114, 8
  %116 = trunc i64 %115 to i32
  %117 = sub nsw i32 %116, %112
  %118 = sext i32 %99 to i64
  %119 = mul nsw i64 %118, -669
  %120 = lshr i64 %119, 8
  %121 = trunc i64 %120 to i32
  %122 = sub i32 %121, %102
  %123 = add i32 %122, %112
  %124 = sub nsw i32 %107, %123
  %125 = add nsw i32 %124, %117
  %126 = add nsw i32 %102, %82
  store i32 %126, i32* %.0117, align 4
  %127 = sub nsw i32 %82, %102
  %128 = getelementptr inbounds i32, i32* %.0117, i64 56
  store i32 %127, i32* %128, align 4
  %129 = add nsw i32 %123, %84
  %130 = getelementptr inbounds i32, i32* %.0117, i64 8
  store i32 %129, i32* %130, align 4
  %131 = sub nsw i32 %84, %123
  %132 = getelementptr inbounds i32, i32* %.0117, i64 48
  store i32 %131, i32* %132, align 4
  %133 = add nsw i32 %124, %85
  %134 = getelementptr inbounds i32, i32* %.0117, i64 16
  store i32 %133, i32* %134, align 4
  %135 = sub nsw i32 %85, %124
  %136 = getelementptr inbounds i32, i32* %.0117, i64 40
  store i32 %135, i32* %136, align 4
  %137 = add nsw i32 %125, %83
  %138 = getelementptr inbounds i32, i32* %.0117, i64 32
  store i32 %137, i32* %138, align 4
  %139 = sub nsw i32 %83, %125
  br label %140

; <label>:140:                                    ; preds = %56, %49
  %.sink8 = phi i64 [ 24, %56 ], [ 56, %49 ]
  %.sink = phi i32 [ %139, %56 ], [ %48, %49 ]
  %141 = getelementptr inbounds i32, i32* %.0117, i64 %.sink8
  store i32 %.sink, i32* %141, align 4
  %.12 = getelementptr inbounds i32, i32* %.0117, i64 1
  %.14 = getelementptr inbounds i32, i32* %.0316, i64 1
  %.16 = getelementptr inbounds i16, i16* %.0515, i64 1
  %142 = add nsw i32 %.018, -1
  %143 = icmp sgt i32 %.018, 1
  br i1 %143, label %23, label %.preheader

; <label>:144:                                    ; preds = %264, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %264 ]
  %.213 = phi i32* [ %13, %.preheader ], [ %.3, %264 ]
  %145 = getelementptr inbounds i8*, i8** %3, i64 %indvars.iv
  %146 = load i8*, i8** %145, align 8
  %147 = getelementptr inbounds i8, i8* %146, i64 %14
  %148 = getelementptr inbounds i32, i32* %.213, i64 1
  %149 = load i32, i32* %148, align 4
  %150 = getelementptr inbounds i32, i32* %.213, i64 2
  %151 = load i32, i32* %150, align 4
  %152 = or i32 %151, %149
  %153 = getelementptr inbounds i32, i32* %.213, i64 3
  %154 = load i32, i32* %153, align 4
  %155 = or i32 %152, %154
  %156 = getelementptr inbounds i32, i32* %.213, i64 4
  %157 = load i32, i32* %156, align 4
  %158 = or i32 %155, %157
  %159 = getelementptr inbounds i32, i32* %.213, i64 5
  %160 = load i32, i32* %159, align 4
  %161 = or i32 %158, %160
  %162 = getelementptr inbounds i32, i32* %.213, i64 6
  %163 = load i32, i32* %162, align 4
  %164 = or i32 %161, %163
  %165 = getelementptr inbounds i32, i32* %.213, i64 7
  %166 = load i32, i32* %165, align 4
  %167 = or i32 %164, %166
  %168 = icmp eq i32 %167, 0
  %169 = load i32, i32* %.213, align 4
  br i1 %168, label %170, label %176

; <label>:170:                                    ; preds = %144
  %171 = lshr i32 %169, 5
  %172 = and i32 %171, 1023
  %173 = zext i32 %172 to i64
  %sunkaddr41 = add i64 %15, %173
  %sunkaddr42 = add i64 %sunkaddr41, 128
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to i8*
  %174 = load i8, i8* %sunkaddr43, align 1
  store i8 %174, i8* %147, align 1
  %175 = getelementptr inbounds i8, i8* %147, i64 1
  call void @llvm.memset.p0i8.i64(i8* %175, i8 %174, i64 6, i32 1, i1 false)
  br label %264

; <label>:176:                                    ; preds = %144
  %177 = add nsw i32 %169, %157
  %178 = sub nsw i32 %169, %157
  %179 = add nsw i32 %163, %151
  %180 = sub nsw i32 %151, %163
  %181 = sext i32 %180 to i64
  %182 = mul nsw i64 %181, 362
  %183 = lshr i64 %182, 8
  %184 = trunc i64 %183 to i32
  %185 = sub nsw i32 %184, %179
  %186 = add nsw i32 %177, %179
  %187 = sub nsw i32 %177, %179
  %188 = add nsw i32 %185, %178
  %189 = sub nsw i32 %178, %185
  %190 = add nsw i32 %160, %154
  %191 = sub nsw i32 %160, %154
  %192 = add nsw i32 %166, %149
  %193 = sub nsw i32 %149, %166
  %194 = add nsw i32 %192, %190
  %195 = sub nsw i32 %192, %190
  %196 = sext i32 %195 to i64
  %197 = mul nsw i64 %196, 362
  %198 = lshr i64 %197, 8
  %199 = trunc i64 %198 to i32
  %200 = add nsw i32 %193, %191
  %201 = sext i32 %200 to i64
  %202 = mul nsw i64 %201, 473
  %203 = lshr i64 %202, 8
  %204 = trunc i64 %203 to i32
  %205 = sext i32 %193 to i64
  %206 = mul nsw i64 %205, 277
  %207 = lshr i64 %206, 8
  %208 = trunc i64 %207 to i32
  %209 = sub nsw i32 %208, %204
  %210 = sext i32 %191 to i64
  %211 = mul nsw i64 %210, -669
  %212 = lshr i64 %211, 8
  %213 = trunc i64 %212 to i32
  %214 = sub i32 %213, %194
  %215 = add i32 %214, %204
  %216 = sub nsw i32 %199, %215
  %217 = add nsw i32 %216, %209
  %218 = add nsw i32 %186, %194
  %219 = lshr i32 %218, 5
  %220 = and i32 %219, 1023
  %221 = zext i32 %220 to i64
  %sunkaddr55 = add i64 %22, %221
  %sunkaddr56 = add i64 %sunkaddr55, 128
  %sunkaddr57 = inttoptr i64 %sunkaddr56 to i8*
  %222 = load i8, i8* %sunkaddr57, align 1
  store i8 %222, i8* %147, align 1
  %223 = sub nsw i32 %186, %194
  %224 = lshr i32 %223, 5
  %225 = and i32 %224, 1023
  %226 = zext i32 %225 to i64
  %sunkaddr59 = add i64 %21, %226
  %sunkaddr60 = add i64 %sunkaddr59, 128
  %sunkaddr61 = inttoptr i64 %sunkaddr60 to i8*
  %227 = load i8, i8* %sunkaddr61, align 1
  %228 = getelementptr inbounds i8, i8* %147, i64 7
  store i8 %227, i8* %228, align 1
  %229 = add nsw i32 %215, %188
  %230 = lshr i32 %229, 5
  %231 = and i32 %230, 1023
  %232 = zext i32 %231 to i64
  %sunkaddr63 = add i64 %20, %232
  %sunkaddr64 = add i64 %sunkaddr63, 128
  %sunkaddr65 = inttoptr i64 %sunkaddr64 to i8*
  %233 = load i8, i8* %sunkaddr65, align 1
  %234 = getelementptr inbounds i8, i8* %147, i64 1
  store i8 %233, i8* %234, align 1
  %235 = sub nsw i32 %188, %215
  %236 = lshr i32 %235, 5
  %237 = and i32 %236, 1023
  %238 = zext i32 %237 to i64
  %sunkaddr67 = add i64 %19, %238
  %sunkaddr68 = add i64 %sunkaddr67, 128
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to i8*
  %239 = load i8, i8* %sunkaddr69, align 1
  %240 = getelementptr inbounds i8, i8* %147, i64 6
  store i8 %239, i8* %240, align 1
  %241 = add nsw i32 %216, %189
  %242 = lshr i32 %241, 5
  %243 = and i32 %242, 1023
  %244 = zext i32 %243 to i64
  %sunkaddr71 = add i64 %18, %244
  %sunkaddr72 = add i64 %sunkaddr71, 128
  %sunkaddr73 = inttoptr i64 %sunkaddr72 to i8*
  %245 = load i8, i8* %sunkaddr73, align 1
  %246 = getelementptr inbounds i8, i8* %147, i64 2
  store i8 %245, i8* %246, align 1
  %247 = sub nsw i32 %189, %216
  %248 = lshr i32 %247, 5
  %249 = and i32 %248, 1023
  %250 = zext i32 %249 to i64
  %sunkaddr75 = add i64 %17, %250
  %sunkaddr76 = add i64 %sunkaddr75, 128
  %sunkaddr77 = inttoptr i64 %sunkaddr76 to i8*
  %251 = load i8, i8* %sunkaddr77, align 1
  %252 = getelementptr inbounds i8, i8* %147, i64 5
  store i8 %251, i8* %252, align 1
  %253 = add nsw i32 %217, %187
  %254 = lshr i32 %253, 5
  %255 = and i32 %254, 1023
  %256 = zext i32 %255 to i64
  %sunkaddr79 = add i64 %16, %256
  %sunkaddr80 = add i64 %sunkaddr79, 128
  %sunkaddr81 = inttoptr i64 %sunkaddr80 to i8*
  %257 = load i8, i8* %sunkaddr81, align 1
  %258 = getelementptr inbounds i8, i8* %147, i64 4
  store i8 %257, i8* %258, align 1
  %259 = sub nsw i32 %187, %217
  %260 = lshr i32 %259, 5
  %261 = and i32 %260, 1023
  %262 = zext i32 %261 to i64
  %sunkaddr83 = add i64 %15, %262
  %sunkaddr84 = add i64 %sunkaddr83, 128
  %sunkaddr85 = inttoptr i64 %sunkaddr84 to i8*
  %263 = load i8, i8* %sunkaddr85, align 1
  br label %264

; <label>:264:                                    ; preds = %176, %170
  %.sink11 = phi i64 [ 3, %176 ], [ 7, %170 ]
  %.sink9 = phi i8 [ %263, %176 ], [ %174, %170 ]
  %265 = getelementptr inbounds i8, i8* %147, i64 %.sink11
  store i8 %.sink9, i8* %265, align 1
  %.3 = getelementptr inbounds i32, i32* %.213, i64 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond, label %266, label %144

; <label>:266:                                    ; preds = %264
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
