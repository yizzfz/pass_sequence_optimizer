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
define void @jpeg_idct_float(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i16* nocapture readonly, i8** nocapture readonly, i32) local_unnamed_addr #0 {
  %6 = alloca [64 x float], align 16
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 20
  %10 = bitcast i8** %9 to float**
  %11 = load float*, float** %10, align 8
  %12 = getelementptr inbounds [64 x float], [64 x float]* %6, i64 0, i64 0
  br label %23

.preheader:                                       ; preds = %125
  %13 = getelementptr inbounds [64 x float], [64 x float]* %6, i64 0, i64 0
  %14 = zext i32 %4 to i64
  %15 = ptrtoint i8* %8 to i64
  %16 = ptrtoint i8* %8 to i64
  %17 = ptrtoint i8* %8 to i64
  %18 = ptrtoint i8* %8 to i64
  %19 = ptrtoint i8* %8 to i64
  %20 = ptrtoint i8* %8 to i64
  %21 = ptrtoint i8* %8 to i64
  %22 = ptrtoint i8* %8 to i64
  br label %129

; <label>:23:                                     ; preds = %125, %5
  %.014 = phi i32 [ 8, %5 ], [ %127, %125 ]
  %.0113 = phi float* [ %12, %5 ], [ %.12, %125 ]
  %.0312 = phi float* [ %11, %5 ], [ %.14, %125 ]
  %.0511 = phi i16* [ %2, %5 ], [ %.16, %125 ]
  %24 = getelementptr inbounds i16, i16* %.0511, i64 8
  %25 = load i16, i16* %24, align 2
  %26 = getelementptr inbounds i16, i16* %.0511, i64 16
  %27 = load i16, i16* %26, align 2
  %28 = or i16 %27, %25
  %29 = getelementptr inbounds i16, i16* %.0511, i64 24
  %30 = load i16, i16* %29, align 2
  %31 = or i16 %28, %30
  %32 = getelementptr inbounds i16, i16* %.0511, i64 32
  %33 = load i16, i16* %32, align 2
  %34 = or i16 %31, %33
  %35 = getelementptr inbounds i16, i16* %.0511, i64 40
  %36 = load i16, i16* %35, align 2
  %37 = or i16 %34, %36
  %38 = getelementptr inbounds i16, i16* %.0511, i64 48
  %39 = load i16, i16* %38, align 2
  %40 = or i16 %37, %39
  %41 = getelementptr inbounds i16, i16* %.0511, i64 56
  %42 = load i16, i16* %41, align 2
  %43 = or i16 %40, %42
  %44 = icmp eq i16 %43, 0
  %45 = load i16, i16* %.0511, align 2
  %46 = sitofp i16 %45 to float
  %47 = load float, float* %.0312, align 4
  %48 = fmul float %46, %47
  br i1 %44, label %49, label %56

; <label>:49:                                     ; preds = %23
  store float %48, float* %.0113, align 4
  %50 = getelementptr inbounds float, float* %.0113, i64 8
  store float %48, float* %50, align 4
  %51 = getelementptr inbounds float, float* %.0113, i64 16
  store float %48, float* %51, align 4
  %52 = getelementptr inbounds float, float* %.0113, i64 24
  store float %48, float* %52, align 4
  %53 = getelementptr inbounds float, float* %.0113, i64 32
  store float %48, float* %53, align 4
  %54 = getelementptr inbounds float, float* %.0113, i64 40
  store float %48, float* %54, align 4
  %55 = getelementptr inbounds float, float* %.0113, i64 48
  store float %48, float* %55, align 4
  br label %125

; <label>:56:                                     ; preds = %23
  %57 = sitofp i16 %27 to float
  %58 = getelementptr inbounds float, float* %.0312, i64 16
  %59 = load float, float* %58, align 4
  %60 = fmul float %57, %59
  %61 = sitofp i16 %33 to float
  %62 = getelementptr inbounds float, float* %.0312, i64 32
  %63 = load float, float* %62, align 4
  %64 = fmul float %61, %63
  %65 = sitofp i16 %39 to float
  %66 = getelementptr inbounds float, float* %.0312, i64 48
  %67 = load float, float* %66, align 4
  %68 = fmul float %65, %67
  %69 = fadd float %48, %64
  %70 = fsub float %48, %64
  %71 = fadd float %60, %68
  %72 = fsub float %60, %68
  %73 = fmul float %72, 0x3FF6A09E60000000
  %74 = fsub float %73, %71
  %75 = fadd float %69, %71
  %76 = fsub float %69, %71
  %77 = fadd float %70, %74
  %78 = fsub float %70, %74
  %79 = sitofp i16 %25 to float
  %80 = getelementptr inbounds float, float* %.0312, i64 8
  %81 = load float, float* %80, align 4
  %82 = fmul float %79, %81
  %83 = sitofp i16 %30 to float
  %84 = getelementptr inbounds float, float* %.0312, i64 24
  %85 = load float, float* %84, align 4
  %86 = fmul float %83, %85
  %87 = sitofp i16 %36 to float
  %88 = getelementptr inbounds float, float* %.0312, i64 40
  %89 = load float, float* %88, align 4
  %90 = fmul float %87, %89
  %91 = sitofp i16 %42 to float
  %92 = getelementptr inbounds float, float* %.0312, i64 56
  %93 = load float, float* %92, align 4
  %94 = fmul float %91, %93
  %95 = fadd float %86, %90
  %96 = fsub float %90, %86
  %97 = fadd float %82, %94
  %98 = fsub float %82, %94
  %99 = fadd float %95, %97
  %100 = fsub float %97, %95
  %101 = fmul float %100, 0x3FF6A09E60000000
  %102 = fadd float %96, %98
  %103 = fmul float %102, 0x3FFD906BC0000000
  %104 = fmul float %98, 0x3FF1517A80000000
  %105 = fsub float %104, %103
  %106 = fmul float %96, 0x4004E7AEA0000000
  %107 = fsub float %103, %106
  %108 = fsub float %107, %99
  %109 = fsub float %101, %108
  %110 = fadd float %105, %109
  %111 = fadd float %75, %99
  store float %111, float* %.0113, align 4
  %112 = fsub float %75, %99
  %113 = getelementptr inbounds float, float* %.0113, i64 56
  store float %112, float* %113, align 4
  %114 = fadd float %77, %108
  %115 = getelementptr inbounds float, float* %.0113, i64 8
  store float %114, float* %115, align 4
  %116 = fsub float %77, %108
  %117 = getelementptr inbounds float, float* %.0113, i64 48
  store float %116, float* %117, align 4
  %118 = fadd float %78, %109
  %119 = getelementptr inbounds float, float* %.0113, i64 16
  store float %118, float* %119, align 4
  %120 = fsub float %78, %109
  %121 = getelementptr inbounds float, float* %.0113, i64 40
  store float %120, float* %121, align 4
  %122 = fadd float %76, %110
  %123 = getelementptr inbounds float, float* %.0113, i64 32
  store float %122, float* %123, align 4
  %124 = fsub float %76, %110
  br label %125

; <label>:125:                                    ; preds = %56, %49
  %.sink8 = phi i64 [ 24, %56 ], [ 56, %49 ]
  %.sink = phi float [ %124, %56 ], [ %48, %49 ]
  %126 = getelementptr inbounds float, float* %.0113, i64 %.sink8
  store float %.sink, float* %126, align 4
  %.12 = getelementptr inbounds float, float* %.0113, i64 1
  %.14 = getelementptr inbounds float, float* %.0312, i64 1
  %.16 = getelementptr inbounds i16, i16* %.0511, i64 1
  %127 = add nsw i32 %.014, -1
  %128 = icmp sgt i32 %.014, 1
  br i1 %128, label %23, label %.preheader

; <label>:129:                                    ; preds = %129, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %129 ]
  %.29 = phi float* [ %13, %.preheader ], [ %229, %129 ]
  %130 = getelementptr inbounds i8*, i8** %3, i64 %indvars.iv
  %131 = load i8*, i8** %130, align 8
  %132 = getelementptr inbounds i8, i8* %131, i64 %14
  %133 = load float, float* %.29, align 4
  %134 = getelementptr inbounds float, float* %.29, i64 4
  %135 = load float, float* %134, align 4
  %136 = fadd float %133, %135
  %137 = fsub float %133, %135
  %138 = getelementptr inbounds float, float* %.29, i64 2
  %139 = load float, float* %138, align 4
  %140 = getelementptr inbounds float, float* %.29, i64 6
  %141 = load float, float* %140, align 4
  %142 = fadd float %139, %141
  %143 = fsub float %139, %141
  %144 = fmul float %143, 0x3FF6A09E60000000
  %145 = fsub float %144, %142
  %146 = fadd float %136, %142
  %147 = fsub float %136, %142
  %148 = fadd float %137, %145
  %149 = fsub float %137, %145
  %150 = getelementptr inbounds float, float* %.29, i64 5
  %151 = load float, float* %150, align 4
  %152 = getelementptr inbounds float, float* %.29, i64 3
  %153 = load float, float* %152, align 4
  %154 = fadd float %151, %153
  %155 = fsub float %151, %153
  %156 = getelementptr inbounds float, float* %.29, i64 1
  %157 = load float, float* %156, align 4
  %158 = getelementptr inbounds float, float* %.29, i64 7
  %159 = load float, float* %158, align 4
  %160 = fadd float %157, %159
  %161 = fsub float %157, %159
  %162 = fadd float %154, %160
  %163 = fsub float %160, %154
  %164 = fmul float %163, 0x3FF6A09E60000000
  %165 = fadd float %155, %161
  %166 = fmul float %165, 0x3FFD906BC0000000
  %167 = fmul float %161, 0x3FF1517A80000000
  %168 = fsub float %167, %166
  %169 = fmul float %155, 0x4004E7AEA0000000
  %170 = fsub float %166, %169
  %171 = fsub float %170, %162
  %172 = fsub float %164, %171
  %173 = fadd float %168, %172
  %174 = fadd float %146, %162
  %175 = fptosi float %174 to i64
  %176 = add nsw i64 %175, 4
  %177 = lshr i64 %176, 3
  %178 = and i64 %177, 1023
  %sunkaddr15 = add i64 %22, %178
  %sunkaddr16 = add i64 %sunkaddr15, 128
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i8*
  %179 = load i8, i8* %sunkaddr17, align 1
  store i8 %179, i8* %132, align 1
  %180 = fsub float %146, %162
  %181 = fptosi float %180 to i64
  %182 = add nsw i64 %181, 4
  %183 = lshr i64 %182, 3
  %184 = and i64 %183, 1023
  %sunkaddr19 = add i64 %21, %184
  %sunkaddr20 = add i64 %sunkaddr19, 128
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to i8*
  %185 = load i8, i8* %sunkaddr21, align 1
  %186 = getelementptr inbounds i8, i8* %132, i64 7
  store i8 %185, i8* %186, align 1
  %187 = fadd float %148, %171
  %188 = fptosi float %187 to i64
  %189 = add nsw i64 %188, 4
  %190 = lshr i64 %189, 3
  %191 = and i64 %190, 1023
  %sunkaddr23 = add i64 %20, %191
  %sunkaddr24 = add i64 %sunkaddr23, 128
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to i8*
  %192 = load i8, i8* %sunkaddr25, align 1
  %193 = getelementptr inbounds i8, i8* %132, i64 1
  store i8 %192, i8* %193, align 1
  %194 = fsub float %148, %171
  %195 = fptosi float %194 to i64
  %196 = add nsw i64 %195, 4
  %197 = lshr i64 %196, 3
  %198 = and i64 %197, 1023
  %sunkaddr27 = add i64 %19, %198
  %sunkaddr28 = add i64 %sunkaddr27, 128
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to i8*
  %199 = load i8, i8* %sunkaddr29, align 1
  %200 = getelementptr inbounds i8, i8* %132, i64 6
  store i8 %199, i8* %200, align 1
  %201 = fadd float %149, %172
  %202 = fptosi float %201 to i64
  %203 = add nsw i64 %202, 4
  %204 = lshr i64 %203, 3
  %205 = and i64 %204, 1023
  %sunkaddr31 = add i64 %18, %205
  %sunkaddr32 = add i64 %sunkaddr31, 128
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to i8*
  %206 = load i8, i8* %sunkaddr33, align 1
  %207 = getelementptr inbounds i8, i8* %132, i64 2
  store i8 %206, i8* %207, align 1
  %208 = fsub float %149, %172
  %209 = fptosi float %208 to i64
  %210 = add nsw i64 %209, 4
  %211 = lshr i64 %210, 3
  %212 = and i64 %211, 1023
  %sunkaddr35 = add i64 %17, %212
  %sunkaddr36 = add i64 %sunkaddr35, 128
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to i8*
  %213 = load i8, i8* %sunkaddr37, align 1
  %214 = getelementptr inbounds i8, i8* %132, i64 5
  store i8 %213, i8* %214, align 1
  %215 = fadd float %147, %173
  %216 = fptosi float %215 to i64
  %217 = add nsw i64 %216, 4
  %218 = lshr i64 %217, 3
  %219 = and i64 %218, 1023
  %sunkaddr39 = add i64 %16, %219
  %sunkaddr40 = add i64 %sunkaddr39, 128
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to i8*
  %220 = load i8, i8* %sunkaddr41, align 1
  %221 = getelementptr inbounds i8, i8* %132, i64 4
  store i8 %220, i8* %221, align 1
  %222 = fsub float %147, %173
  %223 = fptosi float %222 to i64
  %224 = add nsw i64 %223, 4
  %225 = lshr i64 %224, 3
  %226 = and i64 %225, 1023
  %sunkaddr43 = add i64 %15, %226
  %sunkaddr44 = add i64 %sunkaddr43, 128
  %sunkaddr45 = inttoptr i64 %sunkaddr44 to i8*
  %227 = load i8, i8* %sunkaddr45, align 1
  %228 = getelementptr inbounds i8, i8* %132, i64 3
  store i8 %227, i8* %228, align 1
  %229 = getelementptr inbounds float, float* %.29, i64 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond, label %230, label %129

; <label>:230:                                    ; preds = %129
  ret void
}

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
