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
define void @jpeg_idct_4x4(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info*, i16*, i8**, i32) #0 {
  %6 = alloca [32 x i32], align 16
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 20
  %10 = bitcast i8** %9 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [32 x i32], [32 x i32]* %6, i64 0, i64 0
  br label %15

.preheader:                                       ; preds = %110
  %13 = getelementptr inbounds [32 x i32], [32 x i32]* %6, i64 0, i64 0
  %14 = zext i32 %4 to i64
  %sunkaddr = ptrtoint i8* %8 to i64
  %sunkaddr107 = ptrtoint i8* %8 to i64
  %sunkaddr111 = ptrtoint i8* %8 to i64
  %sunkaddr115 = ptrtoint i8* %8 to i64
  %sunkaddr119 = ptrtoint i8* %8 to i64
  br label %118

; <label>:15:                                     ; preds = %5, %110
  %storemerge129 = phi i32 [ 8, %5 ], [ %116, %110 ]
  %.0127 = phi i32* [ %12, %5 ], [ %115, %110 ]
  %.sroa.0.0126 = phi i64 [ %11, %5 ], [ %114, %110 ]
  %.sroa.043.0.in125 = phi i16* [ %2, %5 ], [ %111, %110 ]
  %16 = icmp eq i32 %storemerge129, 4
  br i1 %16, label %110, label %17

; <label>:17:                                     ; preds = %15
  %18 = getelementptr inbounds i16, i16* %.sroa.043.0.in125, i64 8
  %19 = load i16, i16* %18, align 2
  %20 = getelementptr inbounds i16, i16* %.sroa.043.0.in125, i64 16
  %21 = load i16, i16* %20, align 2
  %22 = or i16 %21, %19
  %23 = getelementptr inbounds i16, i16* %.sroa.043.0.in125, i64 24
  %24 = load i16, i16* %23, align 2
  %25 = or i16 %22, %24
  %26 = getelementptr inbounds i16, i16* %.sroa.043.0.in125, i64 40
  %27 = load i16, i16* %26, align 2
  %28 = or i16 %25, %27
  %29 = getelementptr inbounds i16, i16* %.sroa.043.0.in125, i64 48
  %30 = load i16, i16* %29, align 2
  %31 = or i16 %28, %30
  %32 = getelementptr inbounds i16, i16* %.sroa.043.0.in125, i64 56
  %33 = load i16, i16* %32, align 2
  %34 = or i16 %31, %33
  %35 = icmp eq i16 %34, 0
  %36 = load i16, i16* %.sroa.043.0.in125, align 2
  %37 = sext i16 %36 to i64
  %38 = inttoptr i64 %.sroa.0.0126 to i32*
  %39 = load i32, i32* %38, align 4
  %promoted97 = sext i32 %39 to i64
  %40 = mul nsw i64 %37, %promoted97
  br i1 %35, label %41, label %45

; <label>:41:                                     ; preds = %17
  %promoted = trunc i64 %40 to i32
  %42 = shl i32 %promoted, 2
  store i32 %42, i32* %.0127, align 4
  %43 = getelementptr inbounds i32, i32* %.0127, i64 8
  store i32 %42, i32* %43, align 4
  %44 = getelementptr inbounds i32, i32* %.0127, i64 16
  store i32 %42, i32* %44, align 4
  br label %.sink.split

; <label>:45:                                     ; preds = %17
  %promoted100 = sext i16 %33 to i64
  %promoted99 = sext i16 %30 to i64
  %promoted101 = sext i16 %27 to i64
  %promoted102 = sext i16 %24 to i64
  %promoted98 = sext i16 %21 to i64
  %promoted103 = sext i16 %19 to i64
  %46 = inttoptr i64 %.sroa.0.0126 to i32*
  %47 = shl nsw i64 %40, 14
  %48 = getelementptr inbounds i32, i32* %46, i64 16
  %49 = load i32, i32* %48, align 4
  %50 = sext i32 %49 to i64
  %51 = mul nsw i64 %50, %promoted98
  %52 = getelementptr inbounds i32, i32* %46, i64 48
  %53 = load i32, i32* %52, align 4
  %54 = sext i32 %53 to i64
  %55 = mul nsw i64 %54, %promoted99
  %56 = mul nsw i64 %51, 15137
  %57 = mul nsw i64 %55, -6270
  %58 = add nsw i64 %57, %56
  %59 = add nsw i64 %58, %47
  %60 = sub nsw i64 %47, %58
  %61 = getelementptr inbounds i32, i32* %46, i64 56
  %62 = load i32, i32* %61, align 4
  %63 = sext i32 %62 to i64
  %64 = mul nsw i64 %63, %promoted100
  %65 = getelementptr inbounds i32, i32* %46, i64 40
  %66 = load i32, i32* %65, align 4
  %67 = sext i32 %66 to i64
  %68 = mul nsw i64 %67, %promoted101
  %69 = getelementptr inbounds i32, i32* %46, i64 24
  %70 = load i32, i32* %69, align 4
  %71 = sext i32 %70 to i64
  %72 = mul nsw i64 %71, %promoted102
  %73 = getelementptr inbounds i32, i32* %46, i64 8
  %74 = load i32, i32* %73, align 4
  %75 = sext i32 %74 to i64
  %76 = mul nsw i64 %75, %promoted103
  %77 = mul nsw i64 %64, -1730
  %78 = mul nsw i64 %68, 11893
  %79 = add nsw i64 %78, %77
  %80 = mul nsw i64 %72, -17799
  %81 = add nsw i64 %79, %80
  %82 = mul nsw i64 %76, 8697
  %83 = add nsw i64 %81, %82
  %84 = mul nsw i64 %64, -4176
  %85 = mul nsw i64 %68, -4926
  %86 = add nsw i64 %85, %84
  %87 = mul nsw i64 %72, 7373
  %88 = add nsw i64 %86, %87
  %89 = mul nsw i64 %76, 20995
  %90 = add nsw i64 %88, %89
  %91 = add i64 %59, 2048
  %92 = add i64 %91, %90
  %93 = lshr i64 %92, 12
  %94 = trunc i64 %93 to i32
  store i32 %94, i32* %.0127, align 4
  %95 = add i64 %59, 2048
  %96 = sub i64 %95, %90
  %97 = lshr i64 %96, 12
  %98 = trunc i64 %97 to i32
  %99 = getelementptr inbounds i32, i32* %.0127, i64 24
  store i32 %98, i32* %99, align 4
  %100 = add i64 %60, 2048
  %101 = add i64 %100, %83
  %102 = lshr i64 %101, 12
  %103 = trunc i64 %102 to i32
  %104 = getelementptr inbounds i32, i32* %.0127, i64 8
  store i32 %103, i32* %104, align 4
  %105 = add i64 %60, 2048
  %106 = sub i64 %105, %83
  %107 = lshr i64 %106, 12
  %108 = trunc i64 %107 to i32
  br label %.sink.split

.sink.split:                                      ; preds = %41, %45
  %.sink90 = phi i64 [ 24, %41 ], [ 16, %45 ]
  %.sink = phi i32 [ %42, %41 ], [ %108, %45 ]
  %109 = getelementptr inbounds i32, i32* %.0127, i64 %.sink90
  store i32 %.sink, i32* %109, align 4
  br label %110

; <label>:110:                                    ; preds = %.sink.split, %15
  %111 = getelementptr inbounds i16, i16* %.sroa.043.0.in125, i64 1
  %112 = inttoptr i64 %.sroa.0.0126 to i32*
  %113 = getelementptr inbounds i32, i32* %112, i64 1
  %114 = ptrtoint i32* %113 to i64
  %115 = getelementptr inbounds i32, i32* %.0127, i64 1
  %116 = add nsw i32 %storemerge129, -1
  %117 = icmp sgt i32 %storemerge129, 1
  br i1 %117, label %15, label %.preheader

; <label>:118:                                    ; preds = %199, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %199 ]
  %.1123 = phi i32* [ %13, %.preheader ], [ %storemerge2, %199 ]
  %119 = getelementptr inbounds i8*, i8** %3, i64 %indvars.iv
  %120 = load i8*, i8** %119, align 8
  %121 = getelementptr inbounds i8, i8* %120, i64 %14
  %122 = getelementptr inbounds i32, i32* %.1123, i64 1
  %123 = load i32, i32* %122, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i32, i32* %.1123, i64 2
  %126 = load i32, i32* %125, align 4
  %127 = or i32 %126, %123
  %128 = getelementptr inbounds i32, i32* %.1123, i64 3
  %129 = load i32, i32* %128, align 4
  %130 = sext i32 %129 to i64
  %131 = or i32 %127, %129
  %132 = getelementptr inbounds i32, i32* %.1123, i64 5
  %133 = load i32, i32* %132, align 4
  %134 = sext i32 %133 to i64
  %135 = or i32 %131, %133
  %136 = getelementptr inbounds i32, i32* %.1123, i64 6
  %137 = load i32, i32* %136, align 4
  %138 = or i32 %135, %137
  %139 = getelementptr inbounds i32, i32* %.1123, i64 7
  %140 = load i32, i32* %139, align 4
  %141 = sext i32 %140 to i64
  %142 = or i32 %138, %140
  %143 = icmp eq i32 %142, 0
  %144 = load i32, i32* %.1123, align 4
  br i1 %143, label %145, label %153

; <label>:145:                                    ; preds = %118
  %146 = zext i32 %144 to i64
  %147 = add nuw nsw i64 %146, 16
  %148 = lshr i64 %147, 5
  %149 = and i64 %148, 1023
  %sunkaddr104 = add i64 %sunkaddr, %149
  %sunkaddr105 = add i64 %sunkaddr104, 128
  %sunkaddr106 = inttoptr i64 %sunkaddr105 to i8*
  %150 = load i8, i8* %sunkaddr106, align 1
  store i8 %150, i8* %121, align 1
  %151 = getelementptr inbounds i8, i8* %121, i64 1
  store i8 %150, i8* %151, align 1
  %152 = getelementptr inbounds i8, i8* %121, i64 2
  store i8 %150, i8* %152, align 1
  br label %199

; <label>:153:                                    ; preds = %118
  %154 = sext i32 %137 to i64
  %155 = sext i32 %126 to i64
  %156 = sext i32 %144 to i64
  %157 = shl nsw i64 %156, 14
  %158 = mul nsw i64 %155, 15137
  %159 = mul nsw i64 %154, -6270
  %160 = add nsw i64 %159, %158
  %161 = add nsw i64 %157, %160
  %162 = sub nsw i64 %157, %160
  %163 = mul nsw i64 %141, -1730
  %164 = mul nsw i64 %134, 11893
  %165 = mul nsw i64 %130, -17799
  %166 = mul nsw i64 %124, 8697
  %167 = add i64 %165, %166
  %168 = add i64 %167, %164
  %169 = add i64 %168, %163
  %170 = mul nsw i64 %141, -4176
  %171 = mul nsw i64 %134, -4926
  %172 = mul nsw i64 %130, 7373
  %173 = mul nsw i64 %124, 20995
  %174 = add i64 %172, %173
  %175 = add i64 %174, %171
  %176 = add i64 %175, %170
  %177 = add i64 %161, 262144
  %178 = add i64 %177, %176
  %179 = lshr i64 %178, 19
  %180 = and i64 %179, 1023
  %sunkaddr108 = add i64 %sunkaddr107, %180
  %sunkaddr109 = add i64 %sunkaddr108, 128
  %sunkaddr110 = inttoptr i64 %sunkaddr109 to i8*
  %181 = load i8, i8* %sunkaddr110, align 1
  store i8 %181, i8* %121, align 1
  %182 = add i64 %161, 262144
  %183 = sub i64 %182, %176
  %184 = lshr i64 %183, 19
  %185 = and i64 %184, 1023
  %sunkaddr112 = add i64 %sunkaddr111, %185
  %sunkaddr113 = add i64 %sunkaddr112, 128
  %sunkaddr114 = inttoptr i64 %sunkaddr113 to i8*
  %186 = load i8, i8* %sunkaddr114, align 1
  %187 = getelementptr inbounds i8, i8* %121, i64 3
  store i8 %186, i8* %187, align 1
  %188 = add i64 %162, 262144
  %189 = add i64 %188, %169
  %190 = lshr i64 %189, 19
  %191 = and i64 %190, 1023
  %sunkaddr116 = add i64 %sunkaddr115, %191
  %sunkaddr117 = add i64 %sunkaddr116, 128
  %sunkaddr118 = inttoptr i64 %sunkaddr117 to i8*
  %192 = load i8, i8* %sunkaddr118, align 1
  %193 = getelementptr inbounds i8, i8* %121, i64 1
  store i8 %192, i8* %193, align 1
  %194 = add i64 %162, 262144
  %195 = sub i64 %194, %169
  %196 = lshr i64 %195, 19
  %197 = and i64 %196, 1023
  %sunkaddr120 = add i64 %sunkaddr119, %197
  %sunkaddr121 = add i64 %sunkaddr120, 128
  %sunkaddr122 = inttoptr i64 %sunkaddr121 to i8*
  %198 = load i8, i8* %sunkaddr122, align 1
  br label %199

; <label>:199:                                    ; preds = %153, %145
  %.sink93 = phi i64 [ 2, %153 ], [ 3, %145 ]
  %.sink91 = phi i8 [ %198, %153 ], [ %150, %145 ]
  %200 = getelementptr inbounds i8, i8* %121, i64 %.sink93
  store i8 %.sink91, i8* %200, align 1
  %storemerge2 = getelementptr inbounds i32, i32* %.1123, i64 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4
  br i1 %exitcond, label %201, label %118

; <label>:201:                                    ; preds = %199
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @jpeg_idct_2x2(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info*, i16*, i8**, i32) #0 {
  %6 = alloca [16 x i32], align 16
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 20
  %10 = bitcast i8** %9 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 0
  br label %13

; <label>:13:                                     ; preds = %5, %69
  %storemerge90 = phi i32 [ 8, %5 ], [ %75, %69 ]
  %.088 = phi i32* [ %12, %5 ], [ %74, %69 ]
  %.sroa.0.087 = phi i64 [ %11, %5 ], [ %73, %69 ]
  %.sroa.035.0.in86 = phi i16* [ %2, %5 ], [ %70, %69 ]
  switch i32 %storemerge90, label %14 [
    i32 6, label %69
    i32 4, label %69
    i32 2, label %69
  ]

; <label>:14:                                     ; preds = %13
  %15 = getelementptr inbounds i16, i16* %.sroa.035.0.in86, i64 8
  %16 = load i16, i16* %15, align 2
  %17 = getelementptr inbounds i16, i16* %.sroa.035.0.in86, i64 24
  %18 = load i16, i16* %17, align 2
  %19 = or i16 %18, %16
  %20 = getelementptr inbounds i16, i16* %.sroa.035.0.in86, i64 40
  %21 = load i16, i16* %20, align 2
  %22 = or i16 %19, %21
  %23 = getelementptr inbounds i16, i16* %.sroa.035.0.in86, i64 56
  %24 = load i16, i16* %23, align 2
  %25 = or i16 %22, %24
  %26 = icmp eq i16 %25, 0
  %27 = load i16, i16* %.sroa.035.0.in86, align 2
  %28 = sext i16 %27 to i64
  %29 = inttoptr i64 %.sroa.0.087 to i32*
  %30 = load i32, i32* %29, align 4
  %promoted58 = sext i32 %30 to i64
  %31 = mul nsw i64 %28, %promoted58
  br i1 %26, label %32, label %34

; <label>:32:                                     ; preds = %14
  %promoted = trunc i64 %31 to i32
  %33 = shl i32 %promoted, 2
  store i32 %33, i32* %.088, align 4
  br label %.sink.split

; <label>:34:                                     ; preds = %14
  %promoted59 = sext i16 %24 to i64
  %promoted60 = sext i16 %21 to i64
  %promoted61 = sext i16 %18 to i64
  %promoted62 = sext i16 %16 to i64
  %35 = inttoptr i64 %.sroa.0.087 to i32*
  %36 = shl nsw i64 %31, 15
  %37 = getelementptr inbounds i32, i32* %35, i64 56
  %38 = load i32, i32* %37, align 4
  %39 = sext i32 %38 to i64
  %40 = mul nsw i64 %39, %promoted59
  %41 = mul nsw i64 %40, -5906
  %42 = getelementptr inbounds i32, i32* %35, i64 40
  %43 = load i32, i32* %42, align 4
  %44 = sext i32 %43 to i64
  %45 = mul nsw i64 %44, %promoted60
  %46 = mul nsw i64 %45, 6967
  %47 = add nsw i64 %46, %41
  %48 = getelementptr inbounds i32, i32* %35, i64 24
  %49 = load i32, i32* %48, align 4
  %50 = sext i32 %49 to i64
  %51 = mul nsw i64 %50, %promoted61
  %52 = mul nsw i64 %51, -10426
  %53 = add nsw i64 %47, %52
  %54 = getelementptr inbounds i32, i32* %35, i64 8
  %55 = load i32, i32* %54, align 4
  %56 = sext i32 %55 to i64
  %57 = mul nsw i64 %56, %promoted62
  %58 = mul nsw i64 %57, 29692
  %59 = add nsw i64 %53, %58
  %60 = or i64 %36, 4096
  %61 = add i64 %60, %59
  %62 = lshr i64 %61, 13
  %63 = trunc i64 %62 to i32
  store i32 %63, i32* %.088, align 4
  %64 = or i64 %36, 4096
  %65 = sub i64 %64, %59
  %66 = lshr i64 %65, 13
  %67 = trunc i64 %66 to i32
  br label %.sink.split

.sink.split:                                      ; preds = %32, %34
  %.sink = phi i32 [ %67, %34 ], [ %33, %32 ]
  %68 = getelementptr inbounds i32, i32* %.088, i64 8
  store i32 %.sink, i32* %68, align 4
  br label %69

; <label>:69:                                     ; preds = %13, %13, %13, %.sink.split
  %70 = getelementptr inbounds i16, i16* %.sroa.035.0.in86, i64 1
  %71 = inttoptr i64 %.sroa.0.087 to i32*
  %72 = getelementptr inbounds i32, i32* %71, i64 1
  %73 = ptrtoint i32* %72 to i64
  %74 = getelementptr inbounds i32, i32* %.088, i64 1
  %75 = add nsw i32 %storemerge90, -1
  %76 = icmp sgt i32 %storemerge90, 1
  br i1 %76, label %13, label %77

; <label>:77:                                     ; preds = %69
  %78 = zext i32 %4 to i64
  %sunkaddr = ptrtoint i8* %8 to i64
  %sunkaddr69 = ptrtoint i8* %8 to i64
  %sunkaddr76 = ptrtoint i8* %8 to i64
  %79 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 0
  %80 = load i8*, i8** %3, align 8
  %81 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 1
  %82 = load i32, i32* %81, align 4
  %83 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 3
  %84 = load i32, i32* %83, align 4
  %85 = or i32 %84, %82
  %86 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 5
  %87 = load i32, i32* %86, align 4
  %88 = or i32 %85, %87
  %89 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 7
  %90 = load i32, i32* %89, align 4
  %91 = or i32 %88, %90
  %92 = icmp eq i32 %91, 0
  %93 = load i32, i32* %79, align 16
  br i1 %92, label %94, label %100

; <label>:94:                                     ; preds = %77
  %95 = zext i32 %93 to i64
  %96 = add nuw nsw i64 %95, 16
  %97 = lshr i64 %96, 5
  %98 = and i64 %97, 1023
  %sunkaddr63 = add i64 %sunkaddr, %98
  %sunkaddr64 = add i64 %sunkaddr63, 128
  %sunkaddr65 = inttoptr i64 %sunkaddr64 to i8*
  %99 = load i8, i8* %sunkaddr65, align 1
  %sunkaddr66 = ptrtoint i8* %80 to i64
  %sunkaddr67 = add i64 %sunkaddr66, %78
  %sunkaddr68 = inttoptr i64 %sunkaddr67 to i8*
  store i8 %99, i8* %sunkaddr68, align 1
  br label %124

; <label>:100:                                    ; preds = %77
  %101 = sext i32 %90 to i64
  %102 = sext i32 %87 to i64
  %103 = sext i32 %84 to i64
  %104 = sext i32 %82 to i64
  %105 = sext i32 %93 to i64
  %106 = shl nsw i64 %105, 15
  %107 = mul nsw i64 %101, -5906
  %108 = mul nsw i64 %102, 6967
  %109 = mul nsw i64 %103, -10426
  %110 = mul nsw i64 %104, 29692
  %111 = add i64 %109, %110
  %112 = add i64 %111, %108
  %113 = add i64 %112, %107
  %114 = add nsw i64 %106, 524288
  %115 = add i64 %114, %113
  %116 = lshr i64 %115, 20
  %117 = and i64 %116, 1023
  %sunkaddr70 = add i64 %sunkaddr69, %117
  %sunkaddr71 = add i64 %sunkaddr70, 128
  %sunkaddr72 = inttoptr i64 %sunkaddr71 to i8*
  %118 = load i8, i8* %sunkaddr72, align 1
  %sunkaddr73 = ptrtoint i8* %80 to i64
  %sunkaddr74 = add i64 %sunkaddr73, %78
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to i8*
  store i8 %118, i8* %sunkaddr75, align 1
  %119 = add nsw i64 %106, 524288
  %120 = sub i64 %119, %113
  %121 = lshr i64 %120, 20
  %122 = and i64 %121, 1023
  %sunkaddr77 = add i64 %sunkaddr76, %122
  %sunkaddr78 = add i64 %sunkaddr77, 128
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to i8*
  %123 = load i8, i8* %sunkaddr79, align 1
  br label %124

; <label>:124:                                    ; preds = %100, %94
  %.sink55 = phi i8 [ %123, %100 ], [ %99, %94 ]
  %sunkaddr80 = ptrtoint i8* %80 to i64
  %sunkaddr81 = add i64 %sunkaddr80, %78
  %sunkaddr82 = add i64 %sunkaddr81, 1
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to i8*
  store i8 %.sink55, i8* %sunkaddr83, align 1
  %storemerge2 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 8
  %125 = getelementptr inbounds i8*, i8** %3, i64 1
  %126 = load i8*, i8** %125, align 8
  %127 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 9
  %128 = load i32, i32* %127, align 4
  %129 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 11
  %130 = load i32, i32* %129, align 4
  %131 = or i32 %130, %128
  %132 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 13
  %133 = load i32, i32* %132, align 4
  %134 = or i32 %131, %133
  %135 = getelementptr inbounds [16 x i32], [16 x i32]* %6, i64 0, i64 15
  %136 = load i32, i32* %135, align 4
  %137 = or i32 %134, %136
  %138 = icmp eq i32 %137, 0
  %139 = load i32, i32* %storemerge2, align 16
  br i1 %138, label %164, label %140

; <label>:140:                                    ; preds = %124
  %141 = sext i32 %136 to i64
  %142 = sext i32 %133 to i64
  %143 = sext i32 %130 to i64
  %144 = sext i32 %128 to i64
  %145 = sext i32 %139 to i64
  %146 = shl nsw i64 %145, 15
  %147 = mul nsw i64 %141, -5906
  %148 = mul nsw i64 %142, 6967
  %149 = mul nsw i64 %143, -10426
  %150 = mul nsw i64 %144, 29692
  %151 = add i64 %149, %150
  %152 = add i64 %151, %148
  %153 = add i64 %152, %147
  %154 = add nsw i64 %146, 524288
  %155 = add i64 %154, %153
  %156 = lshr i64 %155, 20
  %157 = and i64 %156, 1023
  %sunkaddr70.1 = add i64 %sunkaddr69, %157
  %sunkaddr71.1 = add i64 %sunkaddr70.1, 128
  %sunkaddr72.1 = inttoptr i64 %sunkaddr71.1 to i8*
  %158 = load i8, i8* %sunkaddr72.1, align 1
  %sunkaddr73.1 = ptrtoint i8* %126 to i64
  %sunkaddr74.1 = add i64 %sunkaddr73.1, %78
  %sunkaddr75.1 = inttoptr i64 %sunkaddr74.1 to i8*
  store i8 %158, i8* %sunkaddr75.1, align 1
  %159 = add nsw i64 %146, 524288
  %160 = sub i64 %159, %153
  %161 = lshr i64 %160, 20
  %162 = and i64 %161, 1023
  %sunkaddr77.1 = add i64 %sunkaddr76, %162
  %sunkaddr78.1 = add i64 %sunkaddr77.1, 128
  %sunkaddr79.1 = inttoptr i64 %sunkaddr78.1 to i8*
  %163 = load i8, i8* %sunkaddr79.1, align 1
  br label %170

; <label>:164:                                    ; preds = %124
  %165 = zext i32 %139 to i64
  %166 = add nuw nsw i64 %165, 16
  %167 = lshr i64 %166, 5
  %168 = and i64 %167, 1023
  %sunkaddr63.1 = add i64 %sunkaddr, %168
  %sunkaddr64.1 = add i64 %sunkaddr63.1, 128
  %sunkaddr65.1 = inttoptr i64 %sunkaddr64.1 to i8*
  %169 = load i8, i8* %sunkaddr65.1, align 1
  %sunkaddr66.1 = ptrtoint i8* %126 to i64
  %sunkaddr67.1 = add i64 %sunkaddr66.1, %78
  %sunkaddr68.1 = inttoptr i64 %sunkaddr67.1 to i8*
  store i8 %169, i8* %sunkaddr68.1, align 1
  br label %170

; <label>:170:                                    ; preds = %164, %140
  %.sink55.1 = phi i8 [ %163, %140 ], [ %169, %164 ]
  %sunkaddr80.1 = ptrtoint i8* %126 to i64
  %sunkaddr81.1 = add i64 %sunkaddr80.1, %78
  %sunkaddr82.1 = add i64 %sunkaddr81.1, 1
  %sunkaddr83.1 = inttoptr i64 %sunkaddr82.1 to i8*
  store i8 %.sink55.1, i8* %sunkaddr83.1, align 1
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @jpeg_idct_1x1(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info*, i16*, i8**, i32) #0 {
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
