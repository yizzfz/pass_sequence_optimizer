; ModuleID = 'jidctred.ll'
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

; Function Attrs: noinline norecurse nounwind uwtable
define void @jpeg_idct_4x4(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i16* nocapture readonly, i8** nocapture readonly, i32) local_unnamed_addr #0 {
  %6 = alloca [32 x i32], align 16
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 20
  %10 = bitcast i8** %9 to i32**
  %11 = load i32*, i32** %10, align 8
  %12 = getelementptr inbounds [32 x i32], [32 x i32]* %6, i64 0, i64 0
  br label %20

.preheader:                                       ; preds = %112
  %13 = getelementptr inbounds [32 x i32], [32 x i32]* %6, i64 0, i64 0
  %14 = zext i32 %4 to i64
  %15 = ptrtoint i8* %8 to i64
  %16 = ptrtoint i8* %8 to i64
  %17 = ptrtoint i8* %8 to i64
  %18 = ptrtoint i8* %8 to i64
  %19 = ptrtoint i8* %8 to i64
  br label %116

; <label>:20:                                     ; preds = %.backedge, %5
  %.045 = phi i32 [ 8, %5 ], [ %.045.be, %.backedge ]
  %.0143 = phi i32* [ %12, %5 ], [ %.0143.be, %.backedge ]
  %.0342 = phi i32* [ %11, %5 ], [ %.0342.be, %.backedge ]
  %.0441 = phi i16* [ %2, %5 ], [ %.0441.be, %.backedge ]
  %21 = icmp eq i32 %.045, 4
  br i1 %21, label %.backedge, label %22

; <label>:22:                                     ; preds = %20
  %23 = getelementptr inbounds i16, i16* %.0441, i64 8
  %24 = load i16, i16* %23, align 2
  %25 = getelementptr inbounds i16, i16* %.0441, i64 16
  %26 = load i16, i16* %25, align 2
  %27 = or i16 %26, %24
  %28 = getelementptr inbounds i16, i16* %.0441, i64 24
  %29 = load i16, i16* %28, align 2
  %30 = or i16 %27, %29
  %31 = getelementptr inbounds i16, i16* %.0441, i64 40
  %32 = load i16, i16* %31, align 2
  %33 = or i16 %30, %32
  %34 = getelementptr inbounds i16, i16* %.0441, i64 48
  %35 = load i16, i16* %34, align 2
  %36 = or i16 %33, %35
  %37 = getelementptr inbounds i16, i16* %.0441, i64 56
  %38 = load i16, i16* %37, align 2
  %39 = or i16 %36, %38
  %40 = icmp eq i16 %39, 0
  %41 = load i16, i16* %.0441, align 2
  %42 = sext i16 %41 to i64
  %43 = load i32, i32* %.0342, align 4
  %promoted13 = sext i32 %43 to i64
  %44 = mul nsw i64 %42, %promoted13
  br i1 %40, label %45, label %49

; <label>:45:                                     ; preds = %22
  %promoted = trunc i64 %44 to i32
  %46 = shl i32 %promoted, 2
  store i32 %46, i32* %.0143, align 4
  %47 = getelementptr inbounds i32, i32* %.0143, i64 8
  store i32 %46, i32* %47, align 4
  %48 = getelementptr inbounds i32, i32* %.0143, i64 16
  store i32 %46, i32* %48, align 4
  br label %112

; <label>:49:                                     ; preds = %22
  %promoted16 = sext i16 %38 to i64
  %promoted15 = sext i16 %35 to i64
  %promoted17 = sext i16 %32 to i64
  %promoted18 = sext i16 %29 to i64
  %promoted14 = sext i16 %26 to i64
  %promoted19 = sext i16 %24 to i64
  %50 = shl nsw i64 %44, 14
  %51 = getelementptr inbounds i32, i32* %.0342, i64 16
  %52 = load i32, i32* %51, align 4
  %53 = sext i32 %52 to i64
  %54 = mul nsw i64 %53, %promoted14
  %55 = getelementptr inbounds i32, i32* %.0342, i64 48
  %56 = load i32, i32* %55, align 4
  %57 = sext i32 %56 to i64
  %58 = mul nsw i64 %57, %promoted15
  %59 = mul nsw i64 %54, 15137
  %60 = mul nsw i64 %58, -6270
  %61 = add nsw i64 %60, %59
  %62 = add nsw i64 %61, %50
  %63 = sub nsw i64 %50, %61
  %64 = getelementptr inbounds i32, i32* %.0342, i64 56
  %65 = load i32, i32* %64, align 4
  %66 = sext i32 %65 to i64
  %67 = mul nsw i64 %66, %promoted16
  %68 = getelementptr inbounds i32, i32* %.0342, i64 40
  %69 = load i32, i32* %68, align 4
  %70 = sext i32 %69 to i64
  %71 = mul nsw i64 %70, %promoted17
  %72 = getelementptr inbounds i32, i32* %.0342, i64 24
  %73 = load i32, i32* %72, align 4
  %74 = sext i32 %73 to i64
  %75 = mul nsw i64 %74, %promoted18
  %76 = getelementptr inbounds i32, i32* %.0342, i64 8
  %77 = load i32, i32* %76, align 4
  %78 = sext i32 %77 to i64
  %79 = mul nsw i64 %78, %promoted19
  %80 = mul nsw i64 %67, -1730
  %81 = mul nsw i64 %71, 11893
  %82 = add nsw i64 %81, %80
  %83 = mul nsw i64 %75, -17799
  %84 = add nsw i64 %82, %83
  %85 = mul nsw i64 %79, 8697
  %86 = add nsw i64 %84, %85
  %87 = mul nsw i64 %67, -4176
  %88 = mul nsw i64 %71, -4926
  %89 = add nsw i64 %88, %87
  %90 = mul nsw i64 %75, 7373
  %91 = add nsw i64 %89, %90
  %92 = mul nsw i64 %79, 20995
  %93 = add nsw i64 %91, %92
  %94 = add i64 %62, 2048
  %95 = add i64 %94, %93
  %96 = lshr i64 %95, 12
  %97 = trunc i64 %96 to i32
  store i32 %97, i32* %.0143, align 4
  %98 = add i64 %62, 2048
  %99 = sub i64 %98, %93
  %100 = lshr i64 %99, 12
  %101 = trunc i64 %100 to i32
  %102 = getelementptr inbounds i32, i32* %.0143, i64 24
  store i32 %101, i32* %102, align 4
  %103 = add i64 %63, 2048
  %104 = add i64 %103, %86
  %105 = lshr i64 %104, 12
  %106 = trunc i64 %105 to i32
  %107 = getelementptr inbounds i32, i32* %.0143, i64 8
  store i32 %106, i32* %107, align 4
  %108 = add i64 %63, 2048
  %109 = sub i64 %108, %86
  %110 = lshr i64 %109, 12
  %111 = trunc i64 %110 to i32
  br label %112

; <label>:112:                                    ; preds = %49, %45
  %.sink6 = phi i64 [ 16, %49 ], [ 24, %45 ]
  %.sink = phi i32 [ %111, %49 ], [ %46, %45 ]
  %113 = getelementptr inbounds i32, i32* %.0143, i64 %.sink6
  store i32 %.sink, i32* %113, align 4
  %114 = add nsw i32 %.045, -1
  %115 = icmp sgt i32 %.045, 1
  br i1 %115, label %.backedge, label %.preheader

.backedge:                                        ; preds = %20, %112
  %.045.be = phi i32 [ %114, %112 ], [ 3, %20 ]
  %.0441.be = getelementptr inbounds i16, i16* %.0441, i64 1
  %.0342.be = getelementptr inbounds i32, i32* %.0342, i64 1
  %.0143.be = getelementptr inbounds i32, i32* %.0143, i64 1
  br label %20

; <label>:116:                                    ; preds = %197, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %197 ]
  %.1239 = phi i32* [ %13, %.preheader ], [ %.2, %197 ]
  %117 = getelementptr inbounds i8*, i8** %3, i64 %indvars.iv
  %118 = load i8*, i8** %117, align 8
  %119 = getelementptr inbounds i8, i8* %118, i64 %14
  %120 = getelementptr inbounds i32, i32* %.1239, i64 1
  %121 = load i32, i32* %120, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32* %.1239, i64 2
  %124 = load i32, i32* %123, align 4
  %125 = or i32 %124, %121
  %126 = getelementptr inbounds i32, i32* %.1239, i64 3
  %127 = load i32, i32* %126, align 4
  %128 = sext i32 %127 to i64
  %129 = or i32 %125, %127
  %130 = getelementptr inbounds i32, i32* %.1239, i64 5
  %131 = load i32, i32* %130, align 4
  %132 = sext i32 %131 to i64
  %133 = or i32 %129, %131
  %134 = getelementptr inbounds i32, i32* %.1239, i64 6
  %135 = load i32, i32* %134, align 4
  %136 = or i32 %133, %135
  %137 = getelementptr inbounds i32, i32* %.1239, i64 7
  %138 = load i32, i32* %137, align 4
  %139 = sext i32 %138 to i64
  %140 = or i32 %136, %138
  %141 = icmp eq i32 %140, 0
  %142 = load i32, i32* %.1239, align 4
  br i1 %141, label %143, label %151

; <label>:143:                                    ; preds = %116
  %144 = zext i32 %142 to i64
  %145 = add nuw nsw i64 %144, 16
  %146 = lshr i64 %145, 5
  %147 = and i64 %146, 1023
  %sunkaddr20 = add i64 %15, %147
  %sunkaddr21 = add i64 %sunkaddr20, 128
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i8*
  %148 = load i8, i8* %sunkaddr22, align 1
  store i8 %148, i8* %119, align 1
  %149 = getelementptr inbounds i8, i8* %119, i64 1
  store i8 %148, i8* %149, align 1
  %150 = getelementptr inbounds i8, i8* %119, i64 2
  store i8 %148, i8* %150, align 1
  br label %197

; <label>:151:                                    ; preds = %116
  %152 = sext i32 %135 to i64
  %153 = sext i32 %124 to i64
  %154 = sext i32 %142 to i64
  %155 = shl nsw i64 %154, 14
  %156 = mul nsw i64 %153, 15137
  %157 = mul nsw i64 %152, -6270
  %158 = add nsw i64 %157, %156
  %159 = add nsw i64 %155, %158
  %160 = sub nsw i64 %155, %158
  %161 = mul nsw i64 %139, -1730
  %162 = mul nsw i64 %132, 11893
  %163 = mul nsw i64 %128, -17799
  %164 = mul nsw i64 %122, 8697
  %165 = add i64 %163, %164
  %166 = add i64 %165, %162
  %167 = add i64 %166, %161
  %168 = mul nsw i64 %139, -4176
  %169 = mul nsw i64 %132, -4926
  %170 = mul nsw i64 %128, 7373
  %171 = mul nsw i64 %122, 20995
  %172 = add i64 %170, %171
  %173 = add i64 %172, %169
  %174 = add i64 %173, %168
  %175 = add i64 %159, 262144
  %176 = add i64 %175, %174
  %177 = lshr i64 %176, 19
  %178 = and i64 %177, 1023
  %sunkaddr24 = add i64 %19, %178
  %sunkaddr25 = add i64 %sunkaddr24, 128
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to i8*
  %179 = load i8, i8* %sunkaddr26, align 1
  store i8 %179, i8* %119, align 1
  %180 = add i64 %159, 262144
  %181 = sub i64 %180, %174
  %182 = lshr i64 %181, 19
  %183 = and i64 %182, 1023
  %sunkaddr28 = add i64 %18, %183
  %sunkaddr29 = add i64 %sunkaddr28, 128
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i8*
  %184 = load i8, i8* %sunkaddr30, align 1
  %185 = getelementptr inbounds i8, i8* %119, i64 3
  store i8 %184, i8* %185, align 1
  %186 = add i64 %160, 262144
  %187 = add i64 %186, %167
  %188 = lshr i64 %187, 19
  %189 = and i64 %188, 1023
  %sunkaddr32 = add i64 %17, %189
  %sunkaddr33 = add i64 %sunkaddr32, 128
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i8*
  %190 = load i8, i8* %sunkaddr34, align 1
  %191 = getelementptr inbounds i8, i8* %119, i64 1
  store i8 %190, i8* %191, align 1
  %192 = add i64 %160, 262144
  %193 = sub i64 %192, %167
  %194 = lshr i64 %193, 19
  %195 = and i64 %194, 1023
  %sunkaddr36 = add i64 %16, %195
  %sunkaddr37 = add i64 %sunkaddr36, 128
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to i8*
  %196 = load i8, i8* %sunkaddr38, align 1
  br label %197

; <label>:197:                                    ; preds = %151, %143
  %.sink9 = phi i64 [ 2, %151 ], [ 3, %143 ]
  %.sink7 = phi i8 [ %196, %151 ], [ %148, %143 ]
  %198 = getelementptr inbounds i8, i8* %119, i64 %.sink9
  store i8 %.sink7, i8* %198, align 1
  %.2 = getelementptr inbounds i32, i32* %.1239, i64 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4
  br i1 %exitcond, label %199, label %116

; <label>:199:                                    ; preds = %197
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @jpeg_idct_2x2(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i16* nocapture readonly, i8** nocapture readonly, i32) local_unnamed_addr #0 {
  %6 = alloca [16 x i32], align 16
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 20
  %10 = bitcast i8** %9 to i32**
  %11 = load i32*, i32** %10, align 8
  %12 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 0
  br label %13

; <label>:13:                                     ; preds = %.backedge, %5
  %.038 = phi i32 [ 8, %5 ], [ %.038.be, %.backedge ]
  %.0137 = phi i32* [ %12, %5 ], [ %.0137.be, %.backedge ]
  %.0336 = phi i32* [ %11, %5 ], [ %.0336.be, %.backedge ]
  %.0435 = phi i16* [ %2, %5 ], [ %.0435.be, %.backedge ]
  switch i32 %.038, label %14 [
    i32 6, label %.backedge
    i32 4, label %.backedge
    i32 2, label %.backedge
  ]

; <label>:14:                                     ; preds = %13
  %15 = getelementptr inbounds i16, i16* %.0435, i64 8
  %16 = load i16, i16* %15, align 2
  %17 = getelementptr inbounds i16, i16* %.0435, i64 24
  %18 = load i16, i16* %17, align 2
  %19 = or i16 %18, %16
  %20 = getelementptr inbounds i16, i16* %.0435, i64 40
  %21 = load i16, i16* %20, align 2
  %22 = or i16 %19, %21
  %23 = getelementptr inbounds i16, i16* %.0435, i64 56
  %24 = load i16, i16* %23, align 2
  %25 = or i16 %22, %24
  %26 = icmp eq i16 %25, 0
  %27 = load i16, i16* %.0435, align 2
  %28 = sext i16 %27 to i64
  %29 = load i32, i32* %.0336, align 4
  %promoted7 = sext i32 %29 to i64
  %30 = mul nsw i64 %28, %promoted7
  br i1 %26, label %31, label %33

; <label>:31:                                     ; preds = %14
  %promoted = trunc i64 %30 to i32
  %32 = shl i32 %promoted, 2
  store i32 %32, i32* %.0137, align 4
  br label %66

; <label>:33:                                     ; preds = %14
  %promoted8 = sext i16 %24 to i64
  %promoted9 = sext i16 %21 to i64
  %promoted10 = sext i16 %18 to i64
  %promoted11 = sext i16 %16 to i64
  %34 = shl nsw i64 %30, 15
  %35 = getelementptr inbounds i32, i32* %.0336, i64 56
  %36 = load i32, i32* %35, align 4
  %37 = sext i32 %36 to i64
  %38 = mul nsw i64 %37, %promoted8
  %39 = mul nsw i64 %38, -5906
  %40 = getelementptr inbounds i32, i32* %.0336, i64 40
  %41 = load i32, i32* %40, align 4
  %42 = sext i32 %41 to i64
  %43 = mul nsw i64 %42, %promoted9
  %44 = mul nsw i64 %43, 6967
  %45 = add nsw i64 %44, %39
  %46 = getelementptr inbounds i32, i32* %.0336, i64 24
  %47 = load i32, i32* %46, align 4
  %48 = sext i32 %47 to i64
  %49 = mul nsw i64 %48, %promoted10
  %50 = mul nsw i64 %49, -10426
  %51 = add nsw i64 %45, %50
  %52 = getelementptr inbounds i32, i32* %.0336, i64 8
  %53 = load i32, i32* %52, align 4
  %54 = sext i32 %53 to i64
  %55 = mul nsw i64 %54, %promoted11
  %56 = mul nsw i64 %55, 29692
  %57 = add nsw i64 %51, %56
  %58 = or i64 %34, 4096
  %59 = add i64 %58, %57
  %60 = lshr i64 %59, 13
  %61 = trunc i64 %60 to i32
  store i32 %61, i32* %.0137, align 4
  %62 = or i64 %34, 4096
  %63 = sub i64 %62, %57
  %64 = lshr i64 %63, 13
  %65 = trunc i64 %64 to i32
  br label %66

; <label>:66:                                     ; preds = %33, %31
  %.sink39 = phi i32 [ %65, %33 ], [ %32, %31 ]
  %67 = getelementptr inbounds i32, i32* %.0137, i64 8
  store i32 %.sink39, i32* %67, align 4
  %68 = icmp sgt i32 %.038, 1
  br i1 %68, label %.backedge, label %69

.backedge:                                        ; preds = %13, %13, %13, %66
  %.0435.be = getelementptr inbounds i16, i16* %.0435, i64 1
  %.0336.be = getelementptr inbounds i32, i32* %.0336, i64 1
  %.0137.be = getelementptr inbounds i32, i32* %.0137, i64 1
  %.038.be = add nsw i32 %.038, -1
  br label %13

; <label>:69:                                     ; preds = %66
  %70 = zext i32 %4 to i64
  %71 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 0
  %72 = load i8*, i8** %3, align 8
  %73 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 1
  %74 = load i32, i32* %73, align 4
  %75 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 3
  %76 = load i32, i32* %75, align 4
  %77 = or i32 %76, %74
  %78 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 5
  %79 = load i32, i32* %78, align 4
  %80 = or i32 %77, %79
  %81 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 7
  %82 = load i32, i32* %81, align 4
  %83 = or i32 %80, %82
  %84 = icmp eq i32 %83, 0
  %85 = load i32, i32* %71, align 16
  br i1 %84, label %86, label %93

; <label>:86:                                     ; preds = %69
  %87 = zext i32 %85 to i64
  %88 = ptrtoint i8* %8 to i64
  %89 = add nuw nsw i64 %87, 16
  %90 = lshr i64 %89, 5
  %91 = and i64 %90, 1023
  %sunkaddr12 = add i64 %88, %91
  %sunkaddr13 = add i64 %sunkaddr12, 128
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to i8*
  %92 = load i8, i8* %sunkaddr14, align 1
  %sunkaddr15 = ptrtoint i8* %72 to i64
  %sunkaddr16 = add i64 %sunkaddr15, %70
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i8*
  store i8 %92, i8* %sunkaddr17, align 1
  br label %119

; <label>:93:                                     ; preds = %69
  %94 = sext i32 %82 to i64
  %95 = sext i32 %79 to i64
  %96 = sext i32 %76 to i64
  %97 = sext i32 %74 to i64
  %98 = ptrtoint i8* %8 to i64
  %99 = ptrtoint i8* %8 to i64
  %100 = sext i32 %85 to i64
  %101 = shl nsw i64 %100, 15
  %102 = mul nsw i64 %94, -5906
  %103 = mul nsw i64 %95, 6967
  %104 = mul nsw i64 %96, -10426
  %105 = mul nsw i64 %97, 29692
  %106 = add i64 %104, %105
  %107 = add i64 %106, %103
  %108 = add i64 %107, %102
  %109 = add nsw i64 %101, 524288
  %110 = add i64 %109, %108
  %111 = lshr i64 %110, 20
  %112 = and i64 %111, 1023
  %sunkaddr19 = add i64 %99, %112
  %sunkaddr20 = add i64 %sunkaddr19, 128
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to i8*
  %113 = load i8, i8* %sunkaddr21, align 1
  %sunkaddr22 = ptrtoint i8* %72 to i64
  %sunkaddr23 = add i64 %sunkaddr22, %70
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to i8*
  store i8 %113, i8* %sunkaddr24, align 1
  %114 = add nsw i64 %101, 524288
  %115 = sub i64 %114, %108
  %116 = lshr i64 %115, 20
  %117 = and i64 %116, 1023
  %sunkaddr26 = add i64 %98, %117
  %sunkaddr27 = add i64 %sunkaddr26, 128
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i8*
  %118 = load i8, i8* %sunkaddr28, align 1
  br label %119

; <label>:119:                                    ; preds = %93, %86
  %.sink = phi i8 [ %118, %93 ], [ %92, %86 ]
  %sunkaddr29 = ptrtoint i8* %72 to i64
  %sunkaddr30 = add i64 %sunkaddr29, %70
  %sunkaddr31 = add i64 %sunkaddr30, 1
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to i8*
  store i8 %.sink, i8* %sunkaddr32, align 1
  %.2 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 8
  %120 = getelementptr inbounds i8*, i8** %3, i64 1
  %121 = load i8*, i8** %120, align 8
  %122 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 9
  %123 = load i32, i32* %122, align 4
  %124 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 11
  %125 = load i32, i32* %124, align 4
  %126 = or i32 %125, %123
  %127 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 13
  %128 = load i32, i32* %127, align 4
  %129 = or i32 %126, %128
  %130 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 15
  %131 = load i32, i32* %130, align 4
  %132 = or i32 %129, %131
  %133 = icmp eq i32 %132, 0
  %134 = load i32, i32* %.2, align 16
  br i1 %133, label %161, label %135

; <label>:135:                                    ; preds = %119
  %136 = sext i32 %134 to i64
  %137 = sext i32 %131 to i64
  %138 = sext i32 %128 to i64
  %139 = sext i32 %125 to i64
  %140 = sext i32 %123 to i64
  %141 = ptrtoint i8* %8 to i64
  %142 = ptrtoint i8* %8 to i64
  %143 = shl nsw i64 %136, 15
  %144 = mul nsw i64 %137, -5906
  %145 = mul nsw i64 %138, 6967
  %146 = mul nsw i64 %139, -10426
  %147 = mul nsw i64 %140, 29692
  %148 = add i64 %146, %147
  %149 = add i64 %148, %145
  %150 = add i64 %149, %144
  %151 = add nsw i64 %143, 524288
  %152 = add i64 %151, %150
  %153 = lshr i64 %152, 20
  %154 = and i64 %153, 1023
  %sunkaddr19.1 = add i64 %142, %154
  %sunkaddr20.1 = add i64 %sunkaddr19.1, 128
  %sunkaddr21.1 = inttoptr i64 %sunkaddr20.1 to i8*
  %155 = load i8, i8* %sunkaddr21.1, align 1
  %sunkaddr22.1 = ptrtoint i8* %121 to i64
  %sunkaddr23.1 = add i64 %sunkaddr22.1, %70
  %sunkaddr24.1 = inttoptr i64 %sunkaddr23.1 to i8*
  store i8 %155, i8* %sunkaddr24.1, align 1
  %156 = add nsw i64 %143, 524288
  %157 = sub i64 %156, %150
  %158 = lshr i64 %157, 20
  %159 = and i64 %158, 1023
  %sunkaddr26.1 = add i64 %141, %159
  %sunkaddr27.1 = add i64 %sunkaddr26.1, 128
  %sunkaddr28.1 = inttoptr i64 %sunkaddr27.1 to i8*
  %160 = load i8, i8* %sunkaddr28.1, align 1
  br label %168

; <label>:161:                                    ; preds = %119
  %162 = ptrtoint i8* %8 to i64
  %163 = zext i32 %134 to i64
  %164 = add nuw nsw i64 %163, 16
  %165 = lshr i64 %164, 5
  %166 = and i64 %165, 1023
  %sunkaddr12.1 = add i64 %162, %166
  %sunkaddr13.1 = add i64 %sunkaddr12.1, 128
  %sunkaddr14.1 = inttoptr i64 %sunkaddr13.1 to i8*
  %167 = load i8, i8* %sunkaddr14.1, align 1
  %sunkaddr15.1 = ptrtoint i8* %121 to i64
  %sunkaddr16.1 = add i64 %sunkaddr15.1, %70
  %sunkaddr17.1 = inttoptr i64 %sunkaddr16.1 to i8*
  store i8 %167, i8* %sunkaddr17.1, align 1
  br label %168

; <label>:168:                                    ; preds = %161, %135
  %.sink.1 = phi i8 [ %160, %135 ], [ %167, %161 ]
  %sunkaddr29.1 = ptrtoint i8* %121 to i64
  %sunkaddr30.1 = add i64 %sunkaddr29.1, %70
  %sunkaddr31.1 = add i64 %sunkaddr30.1, 1
  %sunkaddr32.1 = inttoptr i64 %sunkaddr31.1 to i8*
  store i8 %.sink.1, i8* %sunkaddr32.1, align 1
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @jpeg_idct_1x1(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i16* nocapture readonly, i8** nocapture readonly, i32) local_unnamed_addr #0 {
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %7 = load i8*, i8** %6, align 8
  %8 = getelementptr inbounds i8, i8* %7, i64 128
  %9 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 20
  %10 = bitcast i8** %9 to i32**
  %11 = load i32*, i32** %10, align 8
  %12 = load i16, i16* %2, align 2
  %13 = sext i16 %12 to i32
  %14 = load i32, i32* %11, align 4
  %15 = mul nsw i32 %13, %14
  %16 = zext i32 %15 to i64
  %17 = add nuw nsw i64 %16, 4
  %18 = lshr i64 %17, 3
  %19 = and i64 %18, 1023
  %20 = getelementptr inbounds i8, i8* %8, i64 %19
  %21 = load i8, i8* %20, align 1
  %22 = load i8*, i8** %3, align 8
  %23 = zext i32 %4 to i64
  %24 = getelementptr inbounds i8, i8* %22, i64 %23
  store i8 %21, i8* %24, align 1
  ret void
}

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
