; ModuleID = 'fft.ll'
source_filename = "fft.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@rv_tbl = internal unnamed_addr constant [128 x i16] [i16 0, i16 128, i16 64, i16 192, i16 32, i16 160, i16 96, i16 224, i16 16, i16 144, i16 80, i16 208, i16 48, i16 176, i16 112, i16 240, i16 8, i16 136, i16 72, i16 200, i16 40, i16 168, i16 104, i16 232, i16 24, i16 152, i16 88, i16 216, i16 56, i16 184, i16 120, i16 248, i16 4, i16 132, i16 68, i16 196, i16 36, i16 164, i16 100, i16 228, i16 20, i16 148, i16 84, i16 212, i16 52, i16 180, i16 116, i16 244, i16 12, i16 140, i16 76, i16 204, i16 44, i16 172, i16 108, i16 236, i16 28, i16 156, i16 92, i16 220, i16 60, i16 188, i16 124, i16 252, i16 2, i16 130, i16 66, i16 194, i16 34, i16 162, i16 98, i16 226, i16 18, i16 146, i16 82, i16 210, i16 50, i16 178, i16 114, i16 242, i16 10, i16 138, i16 74, i16 202, i16 42, i16 170, i16 106, i16 234, i16 26, i16 154, i16 90, i16 218, i16 58, i16 186, i16 122, i16 250, i16 6, i16 134, i16 70, i16 198, i16 38, i16 166, i16 102, i16 230, i16 22, i16 150, i16 86, i16 214, i16 54, i16 182, i16 118, i16 246, i16 14, i16 142, i16 78, i16 206, i16 46, i16 174, i16 110, i16 238, i16 30, i16 158, i16 94, i16 222, i16 62, i16 190, i16 126, i16 254], align 16
@window_s = internal unnamed_addr global [128 x float] zeroinitializer, align 16
@window = internal unnamed_addr global [512 x float] zeroinitializer, align 16
@costab = internal global [8 x float] zeroinitializer, align 16

; Function Attrs: noinline norecurse nounwind uwtable
define void @fft_short([256 x float]*, i32, i16** readonly) local_unnamed_addr #0 {
  %4 = icmp slt i32 %1, 2
  %5 = icmp eq i32 %1, 2
  %6 = getelementptr inbounds i16*, i16** %2, i64 1
  %7 = getelementptr inbounds i16*, i16** %2, i64 1
  %8 = sext i32 %1 to i64
  %9 = getelementptr inbounds i16*, i16** %2, i64 %8
  br label %10

; <label>:10:                                     ; preds = %.loopexit, %3
  %indvars.iv = phi i64 [ 0, %3 ], [ %indvars.iv.next, %.loopexit ]
  %indvars.iv18 = phi [256 x float]* [ %0, %3 ], [ %397, %.loopexit ]
  %indvars.iv1819 = getelementptr inbounds [256 x float], [256 x float]* %indvars.iv18, i64 0, i64 0
  %11 = getelementptr inbounds [256 x float], [256 x float]* %0, i64 %indvars.iv, i64 128
  %12 = mul nuw nsw i64 %indvars.iv, 192
  %13 = add nuw nsw i64 %12, 192
  br i1 %4, label %.preheader.preheader, label %108

.preheader.preheader:                             ; preds = %10
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %.preheader ], [ 31, %.preheader.preheader ]
  %.0 = phi float* [ %54, %.preheader ], [ %11, %.preheader.preheader ]
  %14 = shl nsw i64 %indvars.iv22, 2
  %15 = getelementptr inbounds [128 x i16], [128 x i16]* @rv_tbl, i64 0, i64 %14
  %16 = load i16, i16* %15, align 8
  %17 = sext i16 %16 to i64
  %18 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %17
  %19 = load float, float* %18, align 4
  %20 = load i16*, i16** %9, align 8
  %21 = add nsw i64 %17, %13
  %22 = getelementptr inbounds i16, i16* %20, i64 %21
  %23 = load i16, i16* %22, align 2
  %24 = sitofp i16 %23 to float
  %25 = fmul float %19, %24
  %26 = sub nsw i64 127, %17
  %27 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %26
  %28 = load float, float* %27, align 4
  %29 = add nsw i64 %21, 128
  %30 = getelementptr inbounds i16, i16* %20, i64 %29
  %31 = load i16, i16* %30, align 2
  %32 = sitofp i16 %31 to float
  %33 = fmul float %28, %32
  %34 = fsub float %25, %33
  %35 = fadd float %25, %33
  %36 = add nsw i64 %17, 64
  %37 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %36
  %38 = load float, float* %37, align 4
  %39 = add nsw i64 %21, 64
  %40 = getelementptr inbounds i16, i16* %20, i64 %39
  %41 = load i16, i16* %40, align 2
  %42 = sitofp i16 %41 to float
  %43 = fmul float %38, %42
  %44 = sub nsw i64 63, %17
  %45 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %44
  %46 = load float, float* %45, align 4
  %47 = add nsw i64 %21, 192
  %48 = getelementptr inbounds i16, i16* %20, i64 %47
  %49 = load i16, i16* %48, align 2
  %50 = sitofp i16 %49 to float
  %51 = fmul float %46, %50
  %52 = fsub float %43, %51
  %53 = fadd float %43, %51
  %54 = getelementptr inbounds float, float* %.0, i64 -4
  %55 = fadd float %35, %53
  store float %55, float* %54, align 4
  %56 = fsub float %35, %53
  %57 = getelementptr inbounds float, float* %.0, i64 -2
  store float %56, float* %57, align 4
  %58 = fadd float %34, %52
  %59 = getelementptr inbounds float, float* %.0, i64 -3
  store float %58, float* %59, align 4
  %60 = fsub float %34, %52
  %61 = getelementptr inbounds float, float* %.0, i64 -1
  store float %60, float* %61, align 4
  %62 = add nsw i64 %17, 1
  %63 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %62
  %64 = load float, float* %63, align 4
  %65 = load i16*, i16** %9, align 8
  %66 = add nsw i64 %21, 1
  %67 = getelementptr inbounds i16, i16* %65, i64 %66
  %68 = load i16, i16* %67, align 2
  %69 = sitofp i16 %68 to float
  %70 = fmul float %64, %69
  %71 = sub nsw i64 126, %17
  %72 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %71
  %73 = load float, float* %72, align 4
  %74 = add nsw i64 %21, 129
  %75 = getelementptr inbounds i16, i16* %65, i64 %74
  %76 = load i16, i16* %75, align 2
  %77 = sitofp i16 %76 to float
  %78 = fmul float %73, %77
  %79 = fsub float %70, %78
  %80 = fadd float %70, %78
  %81 = add nsw i64 %17, 65
  %82 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %81
  %83 = load float, float* %82, align 4
  %84 = add nsw i64 %21, 65
  %85 = getelementptr inbounds i16, i16* %65, i64 %84
  %86 = load i16, i16* %85, align 2
  %87 = sitofp i16 %86 to float
  %88 = fmul float %83, %87
  %89 = sub nsw i64 62, %17
  %90 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %89
  %91 = load float, float* %90, align 4
  %92 = add nsw i64 %21, 193
  %93 = getelementptr inbounds i16, i16* %65, i64 %92
  %94 = load i16, i16* %93, align 2
  %95 = sitofp i16 %94 to float
  %96 = fmul float %91, %95
  %97 = fsub float %88, %96
  %98 = fadd float %88, %96
  %99 = fadd float %80, %98
  %100 = getelementptr inbounds float, float* %.0, i64 124
  store float %99, float* %100, align 4
  %101 = fsub float %80, %98
  %102 = getelementptr inbounds float, float* %.0, i64 126
  store float %101, float* %102, align 4
  %103 = fadd float %79, %97
  %104 = getelementptr inbounds float, float* %.0, i64 125
  store float %103, float* %104, align 4
  %105 = fsub float %79, %97
  %106 = getelementptr inbounds float, float* %.0, i64 127
  store float %105, float* %106, align 4
  %indvars.iv.next23 = add nsw i64 %indvars.iv22, -1
  %107 = icmp sgt i64 %indvars.iv22, 0
  br i1 %107, label %.preheader, label %.loopexit.loopexit

; <label>:108:                                    ; preds = %10
  br i1 %5, label %.preheader5.preheader, label %.preheader7.preheader

.preheader7.preheader:                            ; preds = %108
  br label %.preheader7

.preheader5.preheader:                            ; preds = %108
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.preheader, %.preheader5
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %.preheader5 ], [ 31, %.preheader5.preheader ]
  %.1 = phi float* [ %174, %.preheader5 ], [ %11, %.preheader5.preheader ]
  %109 = shl nsw i64 %indvars.iv20, 2
  %110 = getelementptr inbounds [128 x i16], [128 x i16]* @rv_tbl, i64 0, i64 %109
  %111 = load i16, i16* %110, align 8
  %112 = sext i16 %111 to i64
  %113 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %112
  %114 = load float, float* %113, align 4
  %115 = load i16*, i16** %2, align 8
  %116 = add nsw i64 %112, %13
  %117 = getelementptr inbounds i16, i16* %115, i64 %116
  %118 = load i16, i16* %117, align 2
  %119 = sext i16 %118 to i32
  %120 = load i16*, i16** %6, align 8
  %121 = getelementptr inbounds i16, i16* %120, i64 %116
  %122 = load i16, i16* %121, align 2
  %123 = sext i16 %122 to i32
  %124 = add nsw i32 %123, %119
  %125 = sitofp i32 %124 to float
  %126 = fmul float %125, 0x3FE6A09E60000000
  %127 = fmul float %114, %126
  %128 = sub nsw i64 127, %112
  %129 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %128
  %130 = load float, float* %129, align 4
  %131 = add nsw i64 %116, 128
  %132 = getelementptr inbounds i16, i16* %115, i64 %131
  %133 = load i16, i16* %132, align 2
  %134 = sext i16 %133 to i32
  %135 = getelementptr inbounds i16, i16* %120, i64 %131
  %136 = load i16, i16* %135, align 2
  %137 = sext i16 %136 to i32
  %138 = add nsw i32 %137, %134
  %139 = sitofp i32 %138 to float
  %140 = fmul float %139, 0x3FE6A09E60000000
  %141 = fmul float %130, %140
  %142 = fsub float %127, %141
  %143 = fadd float %127, %141
  %144 = add nsw i64 %112, 64
  %145 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %144
  %146 = load float, float* %145, align 4
  %147 = add nsw i64 %116, 64
  %148 = getelementptr inbounds i16, i16* %115, i64 %147
  %149 = load i16, i16* %148, align 2
  %150 = sext i16 %149 to i32
  %151 = getelementptr inbounds i16, i16* %120, i64 %147
  %152 = load i16, i16* %151, align 2
  %153 = sext i16 %152 to i32
  %154 = add nsw i32 %153, %150
  %155 = sitofp i32 %154 to float
  %156 = fmul float %155, 0x3FE6A09E60000000
  %157 = fmul float %146, %156
  %158 = sub nsw i64 63, %112
  %159 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %158
  %160 = load float, float* %159, align 4
  %161 = add nsw i64 %116, 192
  %162 = getelementptr inbounds i16, i16* %115, i64 %161
  %163 = load i16, i16* %162, align 2
  %164 = sext i16 %163 to i32
  %165 = getelementptr inbounds i16, i16* %120, i64 %161
  %166 = load i16, i16* %165, align 2
  %167 = sext i16 %166 to i32
  %168 = add nsw i32 %167, %164
  %169 = sitofp i32 %168 to float
  %170 = fmul float %169, 0x3FE6A09E60000000
  %171 = fmul float %160, %170
  %172 = fsub float %157, %171
  %173 = fadd float %157, %171
  %174 = getelementptr inbounds float, float* %.1, i64 -4
  %175 = fadd float %143, %173
  store float %175, float* %174, align 4
  %176 = fsub float %143, %173
  %177 = getelementptr inbounds float, float* %.1, i64 -2
  store float %176, float* %177, align 4
  %178 = fadd float %142, %172
  %179 = getelementptr inbounds float, float* %.1, i64 -3
  store float %178, float* %179, align 4
  %180 = fsub float %142, %172
  %181 = getelementptr inbounds float, float* %.1, i64 -1
  store float %180, float* %181, align 4
  %182 = add nsw i64 %112, 1
  %183 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %182
  %184 = load float, float* %183, align 4
  %185 = load i16*, i16** %2, align 8
  %186 = add nsw i64 %116, 1
  %187 = getelementptr inbounds i16, i16* %185, i64 %186
  %188 = load i16, i16* %187, align 2
  %189 = sext i16 %188 to i32
  %190 = load i16*, i16** %6, align 8
  %191 = getelementptr inbounds i16, i16* %190, i64 %186
  %192 = load i16, i16* %191, align 2
  %193 = sext i16 %192 to i32
  %194 = add nsw i32 %193, %189
  %195 = sitofp i32 %194 to float
  %196 = fmul float %195, 0x3FE6A09E60000000
  %197 = fmul float %184, %196
  %198 = sub nsw i64 126, %112
  %199 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %198
  %200 = load float, float* %199, align 4
  %201 = add nsw i64 %116, 129
  %202 = getelementptr inbounds i16, i16* %185, i64 %201
  %203 = load i16, i16* %202, align 2
  %204 = sext i16 %203 to i32
  %205 = getelementptr inbounds i16, i16* %190, i64 %201
  %206 = load i16, i16* %205, align 2
  %207 = sext i16 %206 to i32
  %208 = add nsw i32 %207, %204
  %209 = sitofp i32 %208 to float
  %210 = fmul float %209, 0x3FE6A09E60000000
  %211 = fmul float %200, %210
  %212 = fsub float %197, %211
  %213 = fadd float %197, %211
  %214 = add nsw i64 %112, 65
  %215 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %214
  %216 = load float, float* %215, align 4
  %217 = add nsw i64 %116, 65
  %218 = getelementptr inbounds i16, i16* %185, i64 %217
  %219 = load i16, i16* %218, align 2
  %220 = sext i16 %219 to i32
  %221 = getelementptr inbounds i16, i16* %190, i64 %217
  %222 = load i16, i16* %221, align 2
  %223 = sext i16 %222 to i32
  %224 = add nsw i32 %223, %220
  %225 = sitofp i32 %224 to float
  %226 = fmul float %225, 0x3FE6A09E60000000
  %227 = fmul float %216, %226
  %228 = sub nsw i64 62, %112
  %229 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %228
  %230 = load float, float* %229, align 4
  %231 = add nsw i64 %116, 193
  %232 = getelementptr inbounds i16, i16* %185, i64 %231
  %233 = load i16, i16* %232, align 2
  %234 = sext i16 %233 to i32
  %235 = getelementptr inbounds i16, i16* %190, i64 %231
  %236 = load i16, i16* %235, align 2
  %237 = sext i16 %236 to i32
  %238 = add nsw i32 %237, %234
  %239 = sitofp i32 %238 to float
  %240 = fmul float %239, 0x3FE6A09E60000000
  %241 = fmul float %230, %240
  %242 = fsub float %227, %241
  %243 = fadd float %227, %241
  %244 = fadd float %213, %243
  %245 = getelementptr inbounds float, float* %.1, i64 124
  store float %244, float* %245, align 4
  %246 = fsub float %213, %243
  %247 = getelementptr inbounds float, float* %.1, i64 126
  store float %246, float* %247, align 4
  %248 = fadd float %212, %242
  %249 = getelementptr inbounds float, float* %.1, i64 125
  store float %248, float* %249, align 4
  %250 = fsub float %212, %242
  %251 = getelementptr inbounds float, float* %.1, i64 127
  store float %250, float* %251, align 4
  %indvars.iv.next21 = add nsw i64 %indvars.iv20, -1
  %252 = icmp sgt i64 %indvars.iv20, 0
  br i1 %252, label %.preheader5, label %.loopexit.loopexit28

.preheader7:                                      ; preds = %.preheader7.preheader, %.preheader7
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %.preheader7 ], [ 31, %.preheader7.preheader ]
  %.2 = phi float* [ %318, %.preheader7 ], [ %11, %.preheader7.preheader ]
  %253 = shl nsw i64 %indvars.iv16, 2
  %254 = getelementptr inbounds [128 x i16], [128 x i16]* @rv_tbl, i64 0, i64 %253
  %255 = load i16, i16* %254, align 8
  %256 = sext i16 %255 to i64
  %257 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %256
  %258 = load float, float* %257, align 4
  %259 = load i16*, i16** %2, align 8
  %260 = add nsw i64 %256, %13
  %261 = getelementptr inbounds i16, i16* %259, i64 %260
  %262 = load i16, i16* %261, align 2
  %263 = sext i16 %262 to i32
  %264 = load i16*, i16** %7, align 8
  %265 = getelementptr inbounds i16, i16* %264, i64 %260
  %266 = load i16, i16* %265, align 2
  %267 = sext i16 %266 to i32
  %268 = sub nsw i32 %263, %267
  %269 = sitofp i32 %268 to float
  %270 = fmul float %269, 0x3FE6A09E60000000
  %271 = fmul float %258, %270
  %272 = sub nsw i64 127, %256
  %273 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %272
  %274 = load float, float* %273, align 4
  %275 = add nsw i64 %260, 128
  %276 = getelementptr inbounds i16, i16* %259, i64 %275
  %277 = load i16, i16* %276, align 2
  %278 = sext i16 %277 to i32
  %279 = getelementptr inbounds i16, i16* %264, i64 %275
  %280 = load i16, i16* %279, align 2
  %281 = sext i16 %280 to i32
  %282 = sub nsw i32 %278, %281
  %283 = sitofp i32 %282 to float
  %284 = fmul float %283, 0x3FE6A09E60000000
  %285 = fmul float %274, %284
  %286 = fsub float %271, %285
  %287 = fadd float %271, %285
  %288 = add nsw i64 %256, 64
  %289 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %288
  %290 = load float, float* %289, align 4
  %291 = add nsw i64 %260, 64
  %292 = getelementptr inbounds i16, i16* %259, i64 %291
  %293 = load i16, i16* %292, align 2
  %294 = sext i16 %293 to i32
  %295 = getelementptr inbounds i16, i16* %264, i64 %291
  %296 = load i16, i16* %295, align 2
  %297 = sext i16 %296 to i32
  %298 = sub nsw i32 %294, %297
  %299 = sitofp i32 %298 to float
  %300 = fmul float %299, 0x3FE6A09E60000000
  %301 = fmul float %290, %300
  %302 = sub nsw i64 63, %256
  %303 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %302
  %304 = load float, float* %303, align 4
  %305 = add nsw i64 %260, 192
  %306 = getelementptr inbounds i16, i16* %259, i64 %305
  %307 = load i16, i16* %306, align 2
  %308 = sext i16 %307 to i32
  %309 = getelementptr inbounds i16, i16* %264, i64 %305
  %310 = load i16, i16* %309, align 2
  %311 = sext i16 %310 to i32
  %312 = sub nsw i32 %308, %311
  %313 = sitofp i32 %312 to float
  %314 = fmul float %313, 0x3FE6A09E60000000
  %315 = fmul float %304, %314
  %316 = fsub float %301, %315
  %317 = fadd float %301, %315
  %318 = getelementptr inbounds float, float* %.2, i64 -4
  %319 = fadd float %287, %317
  store float %319, float* %318, align 4
  %320 = fsub float %287, %317
  %321 = getelementptr inbounds float, float* %.2, i64 -2
  store float %320, float* %321, align 4
  %322 = fadd float %286, %316
  %323 = getelementptr inbounds float, float* %.2, i64 -3
  store float %322, float* %323, align 4
  %324 = fsub float %286, %316
  %325 = getelementptr inbounds float, float* %.2, i64 -1
  store float %324, float* %325, align 4
  %326 = add nsw i64 %256, 1
  %327 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %326
  %328 = load float, float* %327, align 4
  %329 = load i16*, i16** %2, align 8
  %330 = add nsw i64 %260, 1
  %331 = getelementptr inbounds i16, i16* %329, i64 %330
  %332 = load i16, i16* %331, align 2
  %333 = sext i16 %332 to i32
  %334 = load i16*, i16** %7, align 8
  %335 = getelementptr inbounds i16, i16* %334, i64 %330
  %336 = load i16, i16* %335, align 2
  %337 = sext i16 %336 to i32
  %338 = sub nsw i32 %333, %337
  %339 = sitofp i32 %338 to float
  %340 = fmul float %339, 0x3FE6A09E60000000
  %341 = fmul float %328, %340
  %342 = sub nsw i64 126, %256
  %343 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %342
  %344 = load float, float* %343, align 4
  %345 = add nsw i64 %260, 129
  %346 = getelementptr inbounds i16, i16* %329, i64 %345
  %347 = load i16, i16* %346, align 2
  %348 = sext i16 %347 to i32
  %349 = getelementptr inbounds i16, i16* %334, i64 %345
  %350 = load i16, i16* %349, align 2
  %351 = sext i16 %350 to i32
  %352 = sub nsw i32 %348, %351
  %353 = sitofp i32 %352 to float
  %354 = fmul float %353, 0x3FE6A09E60000000
  %355 = fmul float %344, %354
  %356 = fsub float %341, %355
  %357 = fadd float %341, %355
  %358 = add nsw i64 %256, 65
  %359 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %358
  %360 = load float, float* %359, align 4
  %361 = add nsw i64 %260, 65
  %362 = getelementptr inbounds i16, i16* %329, i64 %361
  %363 = load i16, i16* %362, align 2
  %364 = sext i16 %363 to i32
  %365 = getelementptr inbounds i16, i16* %334, i64 %361
  %366 = load i16, i16* %365, align 2
  %367 = sext i16 %366 to i32
  %368 = sub nsw i32 %364, %367
  %369 = sitofp i32 %368 to float
  %370 = fmul float %369, 0x3FE6A09E60000000
  %371 = fmul float %360, %370
  %372 = sub nsw i64 62, %256
  %373 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %372
  %374 = load float, float* %373, align 4
  %375 = add nsw i64 %260, 193
  %376 = getelementptr inbounds i16, i16* %329, i64 %375
  %377 = load i16, i16* %376, align 2
  %378 = sext i16 %377 to i32
  %379 = getelementptr inbounds i16, i16* %334, i64 %375
  %380 = load i16, i16* %379, align 2
  %381 = sext i16 %380 to i32
  %382 = sub nsw i32 %378, %381
  %383 = sitofp i32 %382 to float
  %384 = fmul float %383, 0x3FE6A09E60000000
  %385 = fmul float %374, %384
  %386 = fsub float %371, %385
  %387 = fadd float %371, %385
  %388 = fadd float %357, %387
  %389 = getelementptr inbounds float, float* %.2, i64 124
  store float %388, float* %389, align 4
  %390 = fsub float %357, %387
  %391 = getelementptr inbounds float, float* %.2, i64 126
  store float %390, float* %391, align 4
  %392 = fadd float %356, %386
  %393 = getelementptr inbounds float, float* %.2, i64 125
  store float %392, float* %393, align 4
  %394 = fsub float %356, %386
  %395 = getelementptr inbounds float, float* %.2, i64 127
  store float %394, float* %395, align 4
  %indvars.iv.next17 = add nsw i64 %indvars.iv16, -1
  %396 = icmp sgt i64 %indvars.iv16, 0
  br i1 %396, label %.preheader7, label %.loopexit.loopexit29

.loopexit.loopexit:                               ; preds = %.preheader
  br label %.loopexit

.loopexit.loopexit28:                             ; preds = %.preheader5
  br label %.loopexit

.loopexit.loopexit29:                             ; preds = %.preheader7
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit29, %.loopexit.loopexit28, %.loopexit.loopexit
  tail call fastcc void @fht(float* %indvars.iv1819, i16 signext 256)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %scevgep = getelementptr [256 x float], [256 x float]* %indvars.iv18, i64 1, i64 0
  %397 = bitcast float* %scevgep to [256 x float]*
  %exitcond = icmp eq i64 %indvars.iv.next, 3
  br i1 %exitcond, label %398, label %10

; <label>:398:                                    ; preds = %.loopexit
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @fht(float*, i16 signext) unnamed_addr #0 {
  %3 = sext i16 %1 to i64
  %4 = getelementptr inbounds float, float* %0, i64 %3
  br label %5

; <label>:5:                                      ; preds = %._crit_edge, %2
  %.06 = phi float* [ getelementptr inbounds ([8 x float], [8 x float]* @costab, i64 0, i64 0), %2 ], [ %140, %._crit_edge ]
  %.01 = phi i16 [ 4, %2 ], [ %9, %._crit_edge ]
  %6 = sext i16 %.01 to i32
  %7 = shl i16 %.01, 1
  %8 = mul i16 %.01, 3
  %9 = shl i16 %.01, 2
  %10 = ashr exact i32 %6, 1
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds float, float* %0, i64 %11
  %13 = sext i16 %.01 to i64
  %14 = sext i16 %7 to i64
  %15 = sext i16 %8 to i64
  %16 = sext i16 %9 to i64
  br label %17

; <label>:17:                                     ; preds = %17, %5
  %.04 = phi float* [ %12, %5 ], [ %53, %17 ]
  %.02 = phi float* [ %0, %5 ], [ %52, %17 ]
  %18 = load float, float* %.02, align 4
  %19 = getelementptr inbounds float, float* %.02, i64 %13
  %20 = load float, float* %19, align 4
  %21 = fsub float %18, %20
  %22 = fadd float %18, %20
  %23 = getelementptr inbounds float, float* %.02, i64 %14
  %24 = load float, float* %23, align 4
  %25 = getelementptr inbounds float, float* %.02, i64 %15
  %26 = load float, float* %25, align 4
  %27 = fsub float %24, %26
  %28 = fadd float %24, %26
  %29 = fsub float %22, %28
  store float %29, float* %23, align 4
  %30 = fadd float %22, %28
  store float %30, float* %.02, align 4
  %31 = fsub float %21, %27
  store float %31, float* %25, align 4
  %32 = fadd float %21, %27
  store float %32, float* %19, align 4
  %33 = load float, float* %.04, align 4
  %34 = getelementptr inbounds float, float* %.04, i64 %13
  %35 = load float, float* %34, align 4
  %36 = fsub float %33, %35
  %37 = fadd float %33, %35
  %38 = getelementptr inbounds float, float* %.04, i64 %15
  %39 = load float, float* %38, align 4
  %40 = fpext float %39 to double
  %41 = fmul double %40, 0x3FF6A09E667F3BCD
  %42 = fptrunc double %41 to float
  %43 = getelementptr inbounds float, float* %.04, i64 %14
  %44 = load float, float* %43, align 4
  %45 = fpext float %44 to double
  %46 = fmul double %45, 0x3FF6A09E667F3BCD
  %47 = fptrunc double %46 to float
  %48 = fsub float %37, %47
  store float %48, float* %43, align 4
  %49 = fadd float %37, %47
  store float %49, float* %.04, align 4
  %50 = fsub float %36, %42
  store float %50, float* %38, align 4
  %51 = fadd float %36, %42
  store float %51, float* %34, align 4
  %52 = getelementptr inbounds float, float* %.02, i64 %16
  %53 = getelementptr inbounds float, float* %.04, i64 %16
  %54 = icmp ult float* %52, %4
  br i1 %54, label %17, label %55

; <label>:55:                                     ; preds = %17
  %56 = getelementptr inbounds float, float* %.06, i64 1
  %57 = icmp sgt i16 %.01, 2
  br i1 %57, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %55
  %58 = load float, float* %56, align 4
  %59 = load float, float* %.06, align 4
  %60 = getelementptr inbounds float, float* %0, i64 %13
  br label %61

; <label>:61:                                     ; preds = %.lr.ph, %128
  %.014 = phi i16 [ 1, %.lr.ph ], [ %137, %128 ]
  %.0313 = phi float [ %59, %.lr.ph ], [ %136, %128 ]
  %.0712 = phi float [ %58, %.lr.ph ], [ %133, %128 ]
  %62 = fmul float %.0712, 2.000000e+00
  %63 = fmul float %.0712, %62
  %64 = fsub float 1.000000e+00, %63
  %65 = fmul float %62, %.0313
  %66 = sext i16 %.014 to i64
  %67 = getelementptr inbounds float, float* %0, i64 %66
  %68 = sub nsw i64 0, %66
  %69 = getelementptr inbounds float, float* %60, i64 %68
  br label %70

; <label>:70:                                     ; preds = %70, %61
  %.15 = phi float* [ %69, %61 ], [ %126, %70 ]
  %.1 = phi float* [ %67, %61 ], [ %125, %70 ]
  %71 = getelementptr inbounds float, float* %.1, i64 %13
  %72 = load float, float* %71, align 4
  %73 = fmul float %65, %72
  %74 = getelementptr inbounds float, float* %.15, i64 %13
  %75 = load float, float* %74, align 4
  %76 = fmul float %64, %75
  %77 = fsub float %73, %76
  %78 = fmul float %64, %72
  %79 = fmul float %65, %75
  %80 = fadd float %78, %79
  %81 = load float, float* %.1, align 4
  %82 = fsub float %81, %80
  %83 = fadd float %81, %80
  %84 = load float, float* %.15, align 4
  %85 = fsub float %84, %77
  %86 = fadd float %84, %77
  %87 = getelementptr inbounds float, float* %.1, i64 %15
  %88 = load float, float* %87, align 4
  %89 = fmul float %65, %88
  %90 = getelementptr inbounds float, float* %.15, i64 %15
  %91 = load float, float* %90, align 4
  %92 = fmul float %64, %91
  %93 = fsub float %89, %92
  %94 = fmul float %64, %88
  %95 = fmul float %65, %91
  %96 = fadd float %94, %95
  %97 = getelementptr inbounds float, float* %.1, i64 %14
  %98 = load float, float* %97, align 4
  %99 = fsub float %98, %96
  %100 = fadd float %98, %96
  %101 = getelementptr inbounds float, float* %.15, i64 %14
  %102 = load float, float* %101, align 4
  %103 = fsub float %102, %93
  %104 = fadd float %102, %93
  %105 = fmul float %.0712, %100
  %106 = fmul float %.0313, %103
  %107 = fsub float %105, %106
  %108 = fmul float %.0313, %100
  %109 = fmul float %.0712, %103
  %110 = fadd float %108, %109
  %111 = fsub float %83, %110
  store float %111, float* %97, align 4
  %112 = fadd float %83, %110
  store float %112, float* %.1, align 4
  %113 = fsub float %85, %107
  store float %113, float* %90, align 4
  %114 = fadd float %85, %107
  store float %114, float* %74, align 4
  %115 = fmul float %.0313, %104
  %116 = fmul float %.0712, %99
  %117 = fsub float %115, %116
  %118 = fmul float %.0712, %104
  %119 = fmul float %.0313, %99
  %120 = fadd float %118, %119
  %121 = fsub float %86, %120
  store float %121, float* %101, align 4
  %122 = fadd float %86, %120
  store float %122, float* %.15, align 4
  %123 = fsub float %82, %117
  store float %123, float* %87, align 4
  %124 = fadd float %82, %117
  store float %124, float* %71, align 4
  %125 = getelementptr inbounds float, float* %.1, i64 %16
  %126 = getelementptr inbounds float, float* %.15, i64 %16
  %127 = icmp ult float* %125, %4
  br i1 %127, label %70, label %128

; <label>:128:                                    ; preds = %70
  %129 = load float, float* %56, align 4
  %130 = fmul float %.0313, %129
  %131 = load float, float* %.06, align 4
  %132 = fmul float %.0712, %131
  %133 = fadd float %130, %132
  %134 = fmul float %.0313, %131
  %135 = fmul float %.0712, %129
  %136 = fsub float %134, %135
  %137 = add i16 %.014, 1
  %138 = sext i16 %137 to i32
  %139 = icmp slt i32 %138, %10
  br i1 %139, label %61, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %128
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %55
  %140 = getelementptr inbounds float, float* %.06, i64 2
  %141 = icmp slt i16 %9, %1
  br i1 %141, label %5, label %142

; <label>:142:                                    ; preds = %._crit_edge
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @fft_long(float*, i32, i16** readonly) local_unnamed_addr #0 {
  %4 = getelementptr inbounds float, float* %0, i64 512
  %5 = icmp slt i32 %1, 2
  br i1 %5, label %.preheader, label %98

.preheader:                                       ; preds = %3
  %6 = sext i32 %1 to i64
  %7 = getelementptr inbounds i16*, i16** %2, i64 %6
  br label %8

; <label>:8:                                      ; preds = %.preheader, %8
  %indvars.iv = phi i64 [ 127, %.preheader ], [ %indvars.iv.next, %8 ]
  %.0 = phi float* [ %4, %.preheader ], [ %46, %8 ]
  %9 = getelementptr inbounds [128 x i16], [128 x i16]* @rv_tbl, i64 0, i64 %indvars.iv
  %10 = load i16, i16* %9, align 2
  %11 = sext i16 %10 to i64
  %12 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %11
  %13 = load float, float* %12, align 4
  %14 = load i16*, i16** %7, align 8
  %15 = getelementptr inbounds i16, i16* %14, i64 %11
  %16 = load i16, i16* %15, align 2
  %17 = sitofp i16 %16 to float
  %18 = fmul float %13, %17
  %19 = sub nsw i64 511, %11
  %20 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %19
  %21 = load float, float* %20, align 4
  %22 = add nsw i64 %11, 512
  %23 = getelementptr inbounds i16, i16* %14, i64 %22
  %24 = load i16, i16* %23, align 2
  %25 = sitofp i16 %24 to float
  %26 = fmul float %21, %25
  %27 = fsub float %18, %26
  %28 = fadd float %18, %26
  %29 = add nsw i64 %11, 256
  %30 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %29
  %31 = load float, float* %30, align 4
  %32 = getelementptr inbounds i16, i16* %14, i64 %29
  %33 = load i16, i16* %32, align 2
  %34 = sitofp i16 %33 to float
  %35 = fmul float %31, %34
  %36 = sub nsw i64 255, %11
  %37 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %36
  %38 = load float, float* %37, align 4
  %39 = add nsw i64 %11, 768
  %40 = getelementptr inbounds i16, i16* %14, i64 %39
  %41 = load i16, i16* %40, align 2
  %42 = sitofp i16 %41 to float
  %43 = fmul float %38, %42
  %44 = fsub float %35, %43
  %45 = fadd float %35, %43
  %46 = getelementptr inbounds float, float* %.0, i64 -4
  %47 = fadd float %28, %45
  store float %47, float* %46, align 4
  %48 = fsub float %28, %45
  %49 = getelementptr inbounds float, float* %.0, i64 -2
  store float %48, float* %49, align 4
  %50 = fadd float %27, %44
  %51 = getelementptr inbounds float, float* %.0, i64 -3
  store float %50, float* %51, align 4
  %52 = fsub float %27, %44
  %53 = getelementptr inbounds float, float* %.0, i64 -1
  store float %52, float* %53, align 4
  %54 = add nsw i64 %11, 1
  %55 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %54
  %56 = load float, float* %55, align 4
  %57 = load i16*, i16** %7, align 8
  %58 = getelementptr inbounds i16, i16* %57, i64 %54
  %59 = load i16, i16* %58, align 2
  %60 = sitofp i16 %59 to float
  %61 = fmul float %56, %60
  %62 = sub nsw i64 510, %11
  %63 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %62
  %64 = load float, float* %63, align 4
  %65 = add nsw i64 %11, 513
  %66 = getelementptr inbounds i16, i16* %57, i64 %65
  %67 = load i16, i16* %66, align 2
  %68 = sitofp i16 %67 to float
  %69 = fmul float %64, %68
  %70 = fsub float %61, %69
  %71 = fadd float %61, %69
  %72 = add nsw i64 %11, 257
  %73 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %72
  %74 = load float, float* %73, align 4
  %75 = getelementptr inbounds i16, i16* %57, i64 %72
  %76 = load i16, i16* %75, align 2
  %77 = sitofp i16 %76 to float
  %78 = fmul float %74, %77
  %79 = sub nsw i64 254, %11
  %80 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %79
  %81 = load float, float* %80, align 4
  %82 = add nsw i64 %11, 769
  %83 = getelementptr inbounds i16, i16* %57, i64 %82
  %84 = load i16, i16* %83, align 2
  %85 = sitofp i16 %84 to float
  %86 = fmul float %81, %85
  %87 = fsub float %78, %86
  %88 = fadd float %78, %86
  %89 = fadd float %71, %88
  %90 = getelementptr inbounds float, float* %.0, i64 508
  store float %89, float* %90, align 4
  %91 = fsub float %71, %88
  %92 = getelementptr inbounds float, float* %.0, i64 510
  store float %91, float* %92, align 4
  %93 = fadd float %70, %87
  %94 = getelementptr inbounds float, float* %.0, i64 509
  store float %93, float* %94, align 4
  %95 = fsub float %70, %87
  %96 = getelementptr inbounds float, float* %.0, i64 511
  store float %95, float* %96, align 4
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %97 = icmp sgt i64 %indvars.iv, 0
  br i1 %97, label %8, label %.loopexit.loopexit

; <label>:98:                                     ; preds = %3
  %99 = icmp eq i32 %1, 2
  %100 = getelementptr inbounds i16*, i16** %2, i64 1
  br i1 %99, label %.preheader4.preheader, label %.preheader6.preheader

.preheader6.preheader:                            ; preds = %98
  br label %.preheader6

.preheader4.preheader:                            ; preds = %98
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.preheader, %.preheader4
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %.preheader4 ], [ 127, %.preheader4.preheader ]
  %.1 = phi float* [ %163, %.preheader4 ], [ %4, %.preheader4.preheader ]
  %101 = getelementptr inbounds [128 x i16], [128 x i16]* @rv_tbl, i64 0, i64 %indvars.iv14
  %102 = load i16, i16* %101, align 2
  %103 = sext i16 %102 to i64
  %104 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %103
  %105 = load float, float* %104, align 4
  %106 = load i16*, i16** %2, align 8
  %107 = getelementptr inbounds i16, i16* %106, i64 %103
  %108 = load i16, i16* %107, align 2
  %109 = sext i16 %108 to i32
  %110 = load i16*, i16** %100, align 8
  %111 = getelementptr inbounds i16, i16* %110, i64 %103
  %112 = load i16, i16* %111, align 2
  %113 = sext i16 %112 to i32
  %114 = add nsw i32 %113, %109
  %115 = sitofp i32 %114 to float
  %116 = fmul float %115, 0x3FE6A09E60000000
  %117 = fmul float %105, %116
  %118 = sub nsw i64 511, %103
  %119 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %118
  %120 = load float, float* %119, align 4
  %121 = add nsw i64 %103, 512
  %122 = getelementptr inbounds i16, i16* %106, i64 %121
  %123 = load i16, i16* %122, align 2
  %124 = sext i16 %123 to i32
  %125 = getelementptr inbounds i16, i16* %110, i64 %121
  %126 = load i16, i16* %125, align 2
  %127 = sext i16 %126 to i32
  %128 = add nsw i32 %127, %124
  %129 = sitofp i32 %128 to float
  %130 = fmul float %129, 0x3FE6A09E60000000
  %131 = fmul float %120, %130
  %132 = fsub float %117, %131
  %133 = fadd float %117, %131
  %134 = add nsw i64 %103, 256
  %135 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %134
  %136 = load float, float* %135, align 4
  %137 = getelementptr inbounds i16, i16* %106, i64 %134
  %138 = load i16, i16* %137, align 2
  %139 = sext i16 %138 to i32
  %140 = getelementptr inbounds i16, i16* %110, i64 %134
  %141 = load i16, i16* %140, align 2
  %142 = sext i16 %141 to i32
  %143 = add nsw i32 %142, %139
  %144 = sitofp i32 %143 to float
  %145 = fmul float %144, 0x3FE6A09E60000000
  %146 = fmul float %136, %145
  %147 = sub nsw i64 255, %103
  %148 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %147
  %149 = load float, float* %148, align 4
  %150 = add nsw i64 %103, 768
  %151 = getelementptr inbounds i16, i16* %106, i64 %150
  %152 = load i16, i16* %151, align 2
  %153 = sext i16 %152 to i32
  %154 = getelementptr inbounds i16, i16* %110, i64 %150
  %155 = load i16, i16* %154, align 2
  %156 = sext i16 %155 to i32
  %157 = add nsw i32 %156, %153
  %158 = sitofp i32 %157 to float
  %159 = fmul float %158, 0x3FE6A09E60000000
  %160 = fmul float %149, %159
  %161 = fsub float %146, %160
  %162 = fadd float %146, %160
  %163 = getelementptr inbounds float, float* %.1, i64 -4
  %164 = fadd float %133, %162
  store float %164, float* %163, align 4
  %165 = fsub float %133, %162
  %166 = getelementptr inbounds float, float* %.1, i64 -2
  store float %165, float* %166, align 4
  %167 = fadd float %132, %161
  %168 = getelementptr inbounds float, float* %.1, i64 -3
  store float %167, float* %168, align 4
  %169 = fsub float %132, %161
  %170 = getelementptr inbounds float, float* %.1, i64 -1
  store float %169, float* %170, align 4
  %171 = add nsw i64 %103, 1
  %172 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %171
  %173 = load float, float* %172, align 4
  %174 = load i16*, i16** %2, align 8
  %175 = getelementptr inbounds i16, i16* %174, i64 %171
  %176 = load i16, i16* %175, align 2
  %177 = sext i16 %176 to i32
  %178 = load i16*, i16** %100, align 8
  %179 = getelementptr inbounds i16, i16* %178, i64 %171
  %180 = load i16, i16* %179, align 2
  %181 = sext i16 %180 to i32
  %182 = add nsw i32 %181, %177
  %183 = sitofp i32 %182 to float
  %184 = fmul float %183, 0x3FE6A09E60000000
  %185 = fmul float %173, %184
  %186 = sub nsw i64 510, %103
  %187 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %186
  %188 = load float, float* %187, align 4
  %189 = add nsw i64 %103, 513
  %190 = getelementptr inbounds i16, i16* %174, i64 %189
  %191 = load i16, i16* %190, align 2
  %192 = sext i16 %191 to i32
  %193 = getelementptr inbounds i16, i16* %178, i64 %189
  %194 = load i16, i16* %193, align 2
  %195 = sext i16 %194 to i32
  %196 = add nsw i32 %195, %192
  %197 = sitofp i32 %196 to float
  %198 = fmul float %197, 0x3FE6A09E60000000
  %199 = fmul float %188, %198
  %200 = fsub float %185, %199
  %201 = fadd float %185, %199
  %202 = add nsw i64 %103, 257
  %203 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %202
  %204 = load float, float* %203, align 4
  %205 = getelementptr inbounds i16, i16* %174, i64 %202
  %206 = load i16, i16* %205, align 2
  %207 = sext i16 %206 to i32
  %208 = getelementptr inbounds i16, i16* %178, i64 %202
  %209 = load i16, i16* %208, align 2
  %210 = sext i16 %209 to i32
  %211 = add nsw i32 %210, %207
  %212 = sitofp i32 %211 to float
  %213 = fmul float %212, 0x3FE6A09E60000000
  %214 = fmul float %204, %213
  %215 = sub nsw i64 254, %103
  %216 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %215
  %217 = load float, float* %216, align 4
  %218 = add nsw i64 %103, 769
  %219 = getelementptr inbounds i16, i16* %174, i64 %218
  %220 = load i16, i16* %219, align 2
  %221 = sext i16 %220 to i32
  %222 = getelementptr inbounds i16, i16* %178, i64 %218
  %223 = load i16, i16* %222, align 2
  %224 = sext i16 %223 to i32
  %225 = add nsw i32 %224, %221
  %226 = sitofp i32 %225 to float
  %227 = fmul float %226, 0x3FE6A09E60000000
  %228 = fmul float %217, %227
  %229 = fsub float %214, %228
  %230 = fadd float %214, %228
  %231 = fadd float %201, %230
  %232 = getelementptr inbounds float, float* %.1, i64 508
  store float %231, float* %232, align 4
  %233 = fsub float %201, %230
  %234 = getelementptr inbounds float, float* %.1, i64 510
  store float %233, float* %234, align 4
  %235 = fadd float %200, %229
  %236 = getelementptr inbounds float, float* %.1, i64 509
  store float %235, float* %236, align 4
  %237 = fsub float %200, %229
  %238 = getelementptr inbounds float, float* %.1, i64 511
  store float %237, float* %238, align 4
  %indvars.iv.next15 = add nsw i64 %indvars.iv14, -1
  %239 = icmp sgt i64 %indvars.iv14, 0
  br i1 %239, label %.preheader4, label %.loopexit.loopexit22

.preheader6:                                      ; preds = %.preheader6.preheader, %.preheader6
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %.preheader6 ], [ 127, %.preheader6.preheader ]
  %.2 = phi float* [ %302, %.preheader6 ], [ %4, %.preheader6.preheader ]
  %240 = getelementptr inbounds [128 x i16], [128 x i16]* @rv_tbl, i64 0, i64 %indvars.iv16
  %241 = load i16, i16* %240, align 2
  %242 = sext i16 %241 to i64
  %243 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %242
  %244 = load float, float* %243, align 4
  %245 = load i16*, i16** %2, align 8
  %246 = getelementptr inbounds i16, i16* %245, i64 %242
  %247 = load i16, i16* %246, align 2
  %248 = sext i16 %247 to i32
  %249 = load i16*, i16** %100, align 8
  %250 = getelementptr inbounds i16, i16* %249, i64 %242
  %251 = load i16, i16* %250, align 2
  %252 = sext i16 %251 to i32
  %253 = sub nsw i32 %248, %252
  %254 = sitofp i32 %253 to float
  %255 = fmul float %254, 0x3FE6A09E60000000
  %256 = fmul float %244, %255
  %257 = sub nsw i64 511, %242
  %258 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %257
  %259 = load float, float* %258, align 4
  %260 = add nsw i64 %242, 512
  %261 = getelementptr inbounds i16, i16* %245, i64 %260
  %262 = load i16, i16* %261, align 2
  %263 = sext i16 %262 to i32
  %264 = getelementptr inbounds i16, i16* %249, i64 %260
  %265 = load i16, i16* %264, align 2
  %266 = sext i16 %265 to i32
  %267 = sub nsw i32 %263, %266
  %268 = sitofp i32 %267 to float
  %269 = fmul float %268, 0x3FE6A09E60000000
  %270 = fmul float %259, %269
  %271 = fsub float %256, %270
  %272 = fadd float %256, %270
  %273 = add nsw i64 %242, 256
  %274 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %273
  %275 = load float, float* %274, align 4
  %276 = getelementptr inbounds i16, i16* %245, i64 %273
  %277 = load i16, i16* %276, align 2
  %278 = sext i16 %277 to i32
  %279 = getelementptr inbounds i16, i16* %249, i64 %273
  %280 = load i16, i16* %279, align 2
  %281 = sext i16 %280 to i32
  %282 = sub nsw i32 %278, %281
  %283 = sitofp i32 %282 to float
  %284 = fmul float %283, 0x3FE6A09E60000000
  %285 = fmul float %275, %284
  %286 = sub nsw i64 255, %242
  %287 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %286
  %288 = load float, float* %287, align 4
  %289 = add nsw i64 %242, 768
  %290 = getelementptr inbounds i16, i16* %245, i64 %289
  %291 = load i16, i16* %290, align 2
  %292 = sext i16 %291 to i32
  %293 = getelementptr inbounds i16, i16* %249, i64 %289
  %294 = load i16, i16* %293, align 2
  %295 = sext i16 %294 to i32
  %296 = sub nsw i32 %292, %295
  %297 = sitofp i32 %296 to float
  %298 = fmul float %297, 0x3FE6A09E60000000
  %299 = fmul float %288, %298
  %300 = fsub float %285, %299
  %301 = fadd float %285, %299
  %302 = getelementptr inbounds float, float* %.2, i64 -4
  %303 = fadd float %272, %301
  store float %303, float* %302, align 4
  %304 = fsub float %272, %301
  %305 = getelementptr inbounds float, float* %.2, i64 -2
  store float %304, float* %305, align 4
  %306 = fadd float %271, %300
  %307 = getelementptr inbounds float, float* %.2, i64 -3
  store float %306, float* %307, align 4
  %308 = fsub float %271, %300
  %309 = getelementptr inbounds float, float* %.2, i64 -1
  store float %308, float* %309, align 4
  %310 = add nsw i64 %242, 1
  %311 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %310
  %312 = load float, float* %311, align 4
  %313 = load i16*, i16** %2, align 8
  %314 = getelementptr inbounds i16, i16* %313, i64 %310
  %315 = load i16, i16* %314, align 2
  %316 = sext i16 %315 to i32
  %317 = load i16*, i16** %100, align 8
  %318 = getelementptr inbounds i16, i16* %317, i64 %310
  %319 = load i16, i16* %318, align 2
  %320 = sext i16 %319 to i32
  %321 = sub nsw i32 %316, %320
  %322 = sitofp i32 %321 to float
  %323 = fmul float %322, 0x3FE6A09E60000000
  %324 = fmul float %312, %323
  %325 = sub nsw i64 510, %242
  %326 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %325
  %327 = load float, float* %326, align 4
  %328 = add nsw i64 %242, 513
  %329 = getelementptr inbounds i16, i16* %313, i64 %328
  %330 = load i16, i16* %329, align 2
  %331 = sext i16 %330 to i32
  %332 = getelementptr inbounds i16, i16* %317, i64 %328
  %333 = load i16, i16* %332, align 2
  %334 = sext i16 %333 to i32
  %335 = sub nsw i32 %331, %334
  %336 = sitofp i32 %335 to float
  %337 = fmul float %336, 0x3FE6A09E60000000
  %338 = fmul float %327, %337
  %339 = fsub float %324, %338
  %340 = fadd float %324, %338
  %341 = add nsw i64 %242, 257
  %342 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %341
  %343 = load float, float* %342, align 4
  %344 = getelementptr inbounds i16, i16* %313, i64 %341
  %345 = load i16, i16* %344, align 2
  %346 = sext i16 %345 to i32
  %347 = getelementptr inbounds i16, i16* %317, i64 %341
  %348 = load i16, i16* %347, align 2
  %349 = sext i16 %348 to i32
  %350 = sub nsw i32 %346, %349
  %351 = sitofp i32 %350 to float
  %352 = fmul float %351, 0x3FE6A09E60000000
  %353 = fmul float %343, %352
  %354 = sub nsw i64 254, %242
  %355 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %354
  %356 = load float, float* %355, align 4
  %357 = add nsw i64 %242, 769
  %358 = getelementptr inbounds i16, i16* %313, i64 %357
  %359 = load i16, i16* %358, align 2
  %360 = sext i16 %359 to i32
  %361 = getelementptr inbounds i16, i16* %317, i64 %357
  %362 = load i16, i16* %361, align 2
  %363 = sext i16 %362 to i32
  %364 = sub nsw i32 %360, %363
  %365 = sitofp i32 %364 to float
  %366 = fmul float %365, 0x3FE6A09E60000000
  %367 = fmul float %356, %366
  %368 = fsub float %353, %367
  %369 = fadd float %353, %367
  %370 = fadd float %340, %369
  %371 = getelementptr inbounds float, float* %.2, i64 508
  store float %370, float* %371, align 4
  %372 = fsub float %340, %369
  %373 = getelementptr inbounds float, float* %.2, i64 510
  store float %372, float* %373, align 4
  %374 = fadd float %339, %368
  %375 = getelementptr inbounds float, float* %.2, i64 509
  store float %374, float* %375, align 4
  %376 = fsub float %339, %368
  %377 = getelementptr inbounds float, float* %.2, i64 511
  store float %376, float* %377, align 4
  %indvars.iv.next17 = add nsw i64 %indvars.iv16, -1
  %378 = icmp sgt i64 %indvars.iv16, 0
  br i1 %378, label %.preheader6, label %.loopexit.loopexit23

.loopexit.loopexit:                               ; preds = %8
  br label %.loopexit

.loopexit.loopexit22:                             ; preds = %.preheader4
  br label %.loopexit

.loopexit.loopexit23:                             ; preds = %.preheader6
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit23, %.loopexit.loopexit22, %.loopexit.loopexit
  tail call fastcc void @fht(float* %0, i16 signext 1024)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @init_fft() local_unnamed_addr #1 {
.preheader2.preheader13:
  store float 0x3FED906BC0000000, float* getelementptr inbounds ([8 x float], [8 x float]* @costab, i64 0, i64 0), align 16
  store float 0x3FD87DE2C0000000, float* getelementptr inbounds ([8 x float], [8 x float]* @costab, i64 0, i64 1), align 4
  store float 0x3FEFD88DA0000000, float* getelementptr inbounds ([8 x float], [8 x float]* @costab, i64 0, i64 2), align 8
  store float 0x3FB917A6C0000000, float* getelementptr inbounds ([8 x float], [8 x float]* @costab, i64 0, i64 3), align 4
  store float 0x3FEFFD8860000000, float* getelementptr inbounds ([8 x float], [8 x float]* @costab, i64 0, i64 4), align 16
  store float 0x3F99215600000000, float* getelementptr inbounds ([8 x float], [8 x float]* @costab, i64 0, i64 5), align 4
  store float 0x3FEFFFD880000000, float* getelementptr inbounds ([8 x float], [8 x float]* @costab, i64 0, i64 6), align 8
  store float 0x3F7921F100000000, float* getelementptr inbounds ([8 x float], [8 x float]* @costab, i64 0, i64 7), align 4
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2, %.preheader2.preheader13
  %indvars.iv7 = phi i64 [ 0, %.preheader2.preheader13 ], [ %indvars.iv.next8.1, %.preheader2 ]
  %0 = trunc i64 %indvars.iv7 to i32
  %1 = sitofp i32 %0 to double
  %2 = fadd double %1, 5.000000e-01
  %3 = fmul double %2, 0x401921FB54442D18
  %4 = fmul double %3, 9.765625e-04
  %5 = tail call double @cos(double %4) #3
  %6 = fsub double 1.000000e+00, %5
  %7 = fmul double %6, 5.000000e-01
  %8 = fptrunc double %7 to float
  %9 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %indvars.iv7
  store float %8, float* %9, align 8
  %indvars.iv.next8 = or i64 %indvars.iv7, 1
  %10 = trunc i64 %indvars.iv.next8 to i32
  %11 = sitofp i32 %10 to double
  %12 = fadd double %11, 5.000000e-01
  %13 = fmul double %12, 0x401921FB54442D18
  %14 = fmul double %13, 9.765625e-04
  %15 = tail call double @cos(double %14) #3
  %16 = fsub double 1.000000e+00, %15
  %17 = fmul double %16, 5.000000e-01
  %18 = fptrunc double %17 to float
  %19 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %indvars.iv.next8
  store float %18, float* %19, align 4
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv7, 2
  %exitcond.19 = icmp eq i64 %indvars.iv.next8.1, 512
  br i1 %exitcond.19, label %.preheader.preheader, label %.preheader2

.preheader.preheader:                             ; preds = %.preheader2
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader ], [ 0, %.preheader.preheader ]
  %20 = trunc i64 %indvars.iv to i32
  %21 = sitofp i32 %20 to double
  %22 = fadd double %21, 5.000000e-01
  %23 = fmul double %22, 0x401921FB54442D18
  %24 = fmul double %23, 3.906250e-03
  %25 = tail call double @cos(double %24) #3
  %26 = fsub double 1.000000e+00, %25
  %27 = fmul double %26, 5.000000e-01
  %28 = fptrunc double %27 to float
  %29 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %indvars.iv
  store float %28, float* %29, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %30 = trunc i64 %indvars.iv.next to i32
  %31 = sitofp i32 %30 to double
  %32 = fadd double %31, 5.000000e-01
  %33 = fmul double %32, 0x401921FB54442D18
  %34 = fmul double %33, 3.906250e-03
  %35 = tail call double @cos(double %34) #3
  %36 = fsub double 1.000000e+00, %35
  %37 = fmul double %36, 5.000000e-01
  %38 = fptrunc double %37 to float
  %39 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %indvars.iv.next
  store float %38, float* %39, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 128
  br i1 %exitcond.1, label %40, label %.preheader

; <label>:40:                                     ; preds = %.preheader
  ret void
}

; Function Attrs: nounwind
declare double @cos(double) local_unnamed_addr #2

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
