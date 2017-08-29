; ModuleID = 'jidctflt.1.ll'
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

; Function Attrs: noinline norecurse nounwind uwtable
define void @jpeg_idct_float(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i16* nocapture readonly, i8** nocapture readonly, i32) #0 {
  %6 = alloca [64 x float], align 16
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 20
  %10 = bitcast i8** %9 to float**
  %11 = load float*, float** %10, align 8
  %12 = getelementptr inbounds [64 x float], [64 x float]* %6, i64 0, i64 0
  br label %13

; <label>:13:                                     ; preds = %115, %5
  %.014 = phi i32 [ 8, %5 ], [ %120, %115 ]
  %.0113 = phi float* [ %12, %5 ], [ %119, %115 ]
  %.0312 = phi float* [ %11, %5 ], [ %118, %115 ]
  %.0511 = phi i16* [ %2, %5 ], [ %117, %115 ]
  %14 = getelementptr inbounds i16, i16* %.0511, i64 8
  %15 = load i16, i16* %14, align 2
  %16 = getelementptr inbounds i16, i16* %.0511, i64 16
  %17 = load i16, i16* %16, align 2
  %18 = or i16 %17, %15
  %19 = getelementptr inbounds i16, i16* %.0511, i64 24
  %20 = load i16, i16* %19, align 2
  %21 = or i16 %18, %20
  %22 = getelementptr inbounds i16, i16* %.0511, i64 32
  %23 = load i16, i16* %22, align 2
  %24 = or i16 %21, %23
  %25 = getelementptr inbounds i16, i16* %.0511, i64 40
  %26 = load i16, i16* %25, align 2
  %27 = or i16 %24, %26
  %28 = getelementptr inbounds i16, i16* %.0511, i64 48
  %29 = load i16, i16* %28, align 2
  %30 = or i16 %27, %29
  %31 = getelementptr inbounds i16, i16* %.0511, i64 56
  %32 = load i16, i16* %31, align 2
  %33 = or i16 %30, %32
  %34 = icmp eq i16 %33, 0
  %35 = load i16, i16* %.0511, align 2
  %36 = sitofp i16 %35 to float
  %37 = load float, float* %.0312, align 4
  %38 = fmul float %36, %37
  br i1 %34, label %39, label %46

; <label>:39:                                     ; preds = %13
  store float %38, float* %.0113, align 4
  %40 = getelementptr inbounds float, float* %.0113, i64 8
  store float %38, float* %40, align 4
  %41 = getelementptr inbounds float, float* %.0113, i64 16
  store float %38, float* %41, align 4
  %42 = getelementptr inbounds float, float* %.0113, i64 24
  store float %38, float* %42, align 4
  %43 = getelementptr inbounds float, float* %.0113, i64 32
  store float %38, float* %43, align 4
  %44 = getelementptr inbounds float, float* %.0113, i64 40
  store float %38, float* %44, align 4
  %45 = getelementptr inbounds float, float* %.0113, i64 48
  store float %38, float* %45, align 4
  br label %115

; <label>:46:                                     ; preds = %13
  %47 = sitofp i16 %17 to float
  %48 = getelementptr inbounds float, float* %.0312, i64 16
  %49 = load float, float* %48, align 4
  %50 = fmul float %47, %49
  %51 = sitofp i16 %23 to float
  %52 = getelementptr inbounds float, float* %.0312, i64 32
  %53 = load float, float* %52, align 4
  %54 = fmul float %51, %53
  %55 = sitofp i16 %29 to float
  %56 = getelementptr inbounds float, float* %.0312, i64 48
  %57 = load float, float* %56, align 4
  %58 = fmul float %55, %57
  %59 = fadd float %38, %54
  %60 = fsub float %38, %54
  %61 = fadd float %50, %58
  %62 = fsub float %50, %58
  %63 = fmul float %62, 0x3FF6A09E60000000
  %64 = fsub float %63, %61
  %65 = fadd float %59, %61
  %66 = fsub float %59, %61
  %67 = fadd float %60, %64
  %68 = fsub float %60, %64
  %69 = sitofp i16 %15 to float
  %70 = getelementptr inbounds float, float* %.0312, i64 8
  %71 = load float, float* %70, align 4
  %72 = fmul float %69, %71
  %73 = sitofp i16 %20 to float
  %74 = getelementptr inbounds float, float* %.0312, i64 24
  %75 = load float, float* %74, align 4
  %76 = fmul float %73, %75
  %77 = sitofp i16 %26 to float
  %78 = getelementptr inbounds float, float* %.0312, i64 40
  %79 = load float, float* %78, align 4
  %80 = fmul float %77, %79
  %81 = sitofp i16 %32 to float
  %82 = getelementptr inbounds float, float* %.0312, i64 56
  %83 = load float, float* %82, align 4
  %84 = fmul float %81, %83
  %85 = fadd float %76, %80
  %86 = fsub float %80, %76
  %87 = fadd float %72, %84
  %88 = fsub float %72, %84
  %89 = fadd float %85, %87
  %90 = fsub float %87, %85
  %91 = fmul float %90, 0x3FF6A09E60000000
  %92 = fadd float %86, %88
  %93 = fmul float %92, 0x3FFD906BC0000000
  %94 = fmul float %88, 0x3FF1517A80000000
  %95 = fsub float %94, %93
  %96 = fmul float %86, 0x4004E7AEA0000000
  %97 = fsub float %93, %96
  %98 = fsub float %97, %89
  %99 = fsub float %91, %98
  %100 = fadd float %95, %99
  %101 = fadd float %65, %89
  store float %101, float* %.0113, align 4
  %102 = fsub float %65, %89
  %103 = getelementptr inbounds float, float* %.0113, i64 56
  store float %102, float* %103, align 4
  %104 = fadd float %67, %98
  %105 = getelementptr inbounds float, float* %.0113, i64 8
  store float %104, float* %105, align 4
  %106 = fsub float %67, %98
  %107 = getelementptr inbounds float, float* %.0113, i64 48
  store float %106, float* %107, align 4
  %108 = fadd float %68, %99
  %109 = getelementptr inbounds float, float* %.0113, i64 16
  store float %108, float* %109, align 4
  %110 = fsub float %68, %99
  %111 = getelementptr inbounds float, float* %.0113, i64 40
  store float %110, float* %111, align 4
  %112 = fadd float %66, %100
  %113 = getelementptr inbounds float, float* %.0113, i64 32
  store float %112, float* %113, align 4
  %114 = fsub float %66, %100
  br label %115

; <label>:115:                                    ; preds = %46, %39
  %.sink8 = phi i64 [ 24, %46 ], [ 56, %39 ]
  %.sink = phi float [ %114, %46 ], [ %38, %39 ]
  %116 = getelementptr inbounds float, float* %.0113, i64 %.sink8
  store float %.sink, float* %116, align 4
  %117 = getelementptr inbounds i16, i16* %.0511, i64 1
  %118 = getelementptr inbounds float, float* %.0312, i64 1
  %119 = getelementptr inbounds float, float* %.0113, i64 1
  %120 = add nsw i32 %.014, -1
  %121 = icmp sgt i32 %.014, 1
  br i1 %121, label %13, label %122

; <label>:122:                                    ; preds = %115
  %123 = getelementptr inbounds i8, i8* %8, i64 128
  %124 = zext i32 %4 to i64
  br label %125

; <label>:125:                                    ; preds = %125, %122
  %.210 = phi float* [ %12, %122 ], [ %233, %125 ]
  %indvars.iv9 = phi i64 [ 0, %122 ], [ %indvars.iv.next, %125 ]
  %126 = getelementptr inbounds i8*, i8** %3, i64 %indvars.iv9
  %127 = load i8*, i8** %126, align 8
  %128 = getelementptr inbounds i8, i8* %127, i64 %124
  %129 = load float, float* %.210, align 4
  %130 = getelementptr inbounds float, float* %.210, i64 4
  %131 = load float, float* %130, align 4
  %132 = fadd float %129, %131
  %133 = fsub float %129, %131
  %134 = getelementptr inbounds float, float* %.210, i64 2
  %135 = load float, float* %134, align 4
  %136 = getelementptr inbounds float, float* %.210, i64 6
  %137 = load float, float* %136, align 4
  %138 = fadd float %135, %137
  %139 = fsub float %135, %137
  %140 = fmul float %139, 0x3FF6A09E60000000
  %141 = fsub float %140, %138
  %142 = fadd float %132, %138
  %143 = fsub float %132, %138
  %144 = fadd float %133, %141
  %145 = fsub float %133, %141
  %146 = getelementptr inbounds float, float* %.210, i64 5
  %147 = load float, float* %146, align 4
  %148 = getelementptr inbounds float, float* %.210, i64 3
  %149 = load float, float* %148, align 4
  %150 = fadd float %147, %149
  %151 = fsub float %147, %149
  %152 = getelementptr inbounds float, float* %.210, i64 1
  %153 = load float, float* %152, align 4
  %154 = getelementptr inbounds float, float* %.210, i64 7
  %155 = load float, float* %154, align 4
  %156 = fadd float %153, %155
  %157 = fsub float %153, %155
  %158 = fadd float %150, %156
  %159 = fsub float %156, %150
  %160 = fmul float %159, 0x3FF6A09E60000000
  %161 = fadd float %151, %157
  %162 = fmul float %161, 0x3FFD906BC0000000
  %163 = fmul float %157, 0x3FF1517A80000000
  %164 = fsub float %163, %162
  %165 = fmul float %151, 0x4004E7AEA0000000
  %166 = fsub float %162, %165
  %167 = fsub float %166, %158
  %168 = fsub float %160, %167
  %169 = fadd float %164, %168
  %170 = fadd float %142, %158
  %171 = fptosi float %170 to i64
  %172 = add nsw i64 %171, 4
  %173 = lshr i64 %172, 3
  %174 = and i64 %173, 1023
  %175 = getelementptr inbounds i8, i8* %123, i64 %174
  %176 = load i8, i8* %175, align 1
  store i8 %176, i8* %128, align 1
  %177 = fsub float %142, %158
  %178 = fptosi float %177 to i64
  %179 = add nsw i64 %178, 4
  %180 = lshr i64 %179, 3
  %181 = and i64 %180, 1023
  %182 = getelementptr inbounds i8, i8* %123, i64 %181
  %183 = load i8, i8* %182, align 1
  %184 = getelementptr inbounds i8, i8* %128, i64 7
  store i8 %183, i8* %184, align 1
  %185 = fadd float %144, %167
  %186 = fptosi float %185 to i64
  %187 = add nsw i64 %186, 4
  %188 = lshr i64 %187, 3
  %189 = and i64 %188, 1023
  %190 = getelementptr inbounds i8, i8* %123, i64 %189
  %191 = load i8, i8* %190, align 1
  %192 = getelementptr inbounds i8, i8* %128, i64 1
  store i8 %191, i8* %192, align 1
  %193 = fsub float %144, %167
  %194 = fptosi float %193 to i64
  %195 = add nsw i64 %194, 4
  %196 = lshr i64 %195, 3
  %197 = and i64 %196, 1023
  %198 = getelementptr inbounds i8, i8* %123, i64 %197
  %199 = load i8, i8* %198, align 1
  %200 = getelementptr inbounds i8, i8* %128, i64 6
  store i8 %199, i8* %200, align 1
  %201 = fadd float %145, %168
  %202 = fptosi float %201 to i64
  %203 = add nsw i64 %202, 4
  %204 = lshr i64 %203, 3
  %205 = and i64 %204, 1023
  %206 = getelementptr inbounds i8, i8* %123, i64 %205
  %207 = load i8, i8* %206, align 1
  %208 = getelementptr inbounds i8, i8* %128, i64 2
  store i8 %207, i8* %208, align 1
  %209 = fsub float %145, %168
  %210 = fptosi float %209 to i64
  %211 = add nsw i64 %210, 4
  %212 = lshr i64 %211, 3
  %213 = and i64 %212, 1023
  %214 = getelementptr inbounds i8, i8* %123, i64 %213
  %215 = load i8, i8* %214, align 1
  %216 = getelementptr inbounds i8, i8* %128, i64 5
  store i8 %215, i8* %216, align 1
  %217 = fadd float %143, %169
  %218 = fptosi float %217 to i64
  %219 = add nsw i64 %218, 4
  %220 = lshr i64 %219, 3
  %221 = and i64 %220, 1023
  %222 = getelementptr inbounds i8, i8* %123, i64 %221
  %223 = load i8, i8* %222, align 1
  %224 = getelementptr inbounds i8, i8* %128, i64 4
  store i8 %223, i8* %224, align 1
  %225 = fsub float %143, %169
  %226 = fptosi float %225 to i64
  %227 = add nsw i64 %226, 4
  %228 = lshr i64 %227, 3
  %229 = and i64 %228, 1023
  %230 = getelementptr inbounds i8, i8* %123, i64 %229
  %231 = load i8, i8* %230, align 1
  %232 = getelementptr inbounds i8, i8* %128, i64 3
  store i8 %231, i8* %232, align 1
  %233 = getelementptr inbounds float, float* %.210, i64 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond, label %234, label %125

; <label>:234:                                    ; preds = %125
  ret void
}

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
