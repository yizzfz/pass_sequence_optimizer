; ModuleID = 'gsm_explode.ll'
source_filename = "gsm_explode.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @gsm_explode(%struct.gsm_state* nocapture readnone, i8* readonly, i16*) local_unnamed_addr #0 {
  %4 = load i8, i8* %1, align 1
  %5 = and i8 %4, -16
  %6 = icmp eq i8 %5, -48
  br i1 %6, label %7, label %491

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds i8, i8* %1, i64 1
  %9 = shl i8 %4, 2
  %10 = and i8 %9, 60
  %11 = zext i8 %10 to i16
  store i16 %11, i16* %2, align 2
  %12 = load i8, i8* %8, align 1
  %13 = zext i8 %12 to i16
  %14 = lshr i16 %13, 6
  %15 = or i16 %14, %11
  store i16 %15, i16* %2, align 2
  %16 = getelementptr inbounds i8, i8* %1, i64 2
  %17 = load i8, i8* %8, align 1
  %18 = and i8 %17, 63
  %19 = zext i8 %18 to i16
  %20 = getelementptr inbounds i16, i16* %2, i64 1
  store i16 %19, i16* %20, align 2
  %21 = load i8, i8* %16, align 1
  %22 = zext i8 %21 to i16
  %23 = lshr i16 %22, 3
  %24 = getelementptr inbounds i16, i16* %2, i64 2
  store i16 %23, i16* %24, align 2
  %25 = getelementptr inbounds i8, i8* %1, i64 3
  %26 = load i8, i8* %16, align 1
  %27 = shl i8 %26, 2
  %28 = and i8 %27, 28
  %29 = zext i8 %28 to i16
  %30 = getelementptr inbounds i16, i16* %2, i64 3
  store i16 %29, i16* %30, align 2
  %31 = load i8, i8* %25, align 1
  %32 = zext i8 %31 to i16
  %33 = lshr i16 %32, 6
  %34 = or i16 %33, %29
  store i16 %34, i16* %30, align 2
  %35 = load i8, i8* %25, align 1
  %36 = zext i8 %35 to i16
  %37 = lshr i16 %36, 2
  %38 = and i16 %37, 15
  %39 = getelementptr inbounds i16, i16* %2, i64 4
  store i16 %38, i16* %39, align 2
  %40 = getelementptr inbounds i8, i8* %1, i64 4
  %41 = load i8, i8* %25, align 1
  %42 = shl i8 %41, 2
  %43 = and i8 %42, 12
  %44 = zext i8 %43 to i16
  %45 = getelementptr inbounds i16, i16* %2, i64 5
  store i16 %44, i16* %45, align 2
  %46 = load i8, i8* %40, align 1
  %47 = zext i8 %46 to i16
  %48 = lshr i16 %47, 6
  %49 = or i16 %48, %44
  store i16 %49, i16* %45, align 2
  %50 = load i8, i8* %40, align 1
  %51 = zext i8 %50 to i16
  %52 = lshr i16 %51, 3
  %53 = and i16 %52, 7
  %54 = getelementptr inbounds i16, i16* %2, i64 6
  store i16 %53, i16* %54, align 2
  %55 = getelementptr inbounds i8, i8* %1, i64 5
  %56 = load i8, i8* %40, align 1
  %57 = and i8 %56, 7
  %58 = zext i8 %57 to i16
  %59 = getelementptr inbounds i16, i16* %2, i64 7
  store i16 %58, i16* %59, align 2
  %60 = load i8, i8* %55, align 1
  %61 = zext i8 %60 to i16
  %62 = lshr i16 %61, 1
  %63 = getelementptr inbounds i16, i16* %2, i64 8
  store i16 %62, i16* %63, align 2
  %64 = getelementptr inbounds i8, i8* %1, i64 6
  %65 = load i8, i8* %55, align 1
  %66 = shl i8 %65, 1
  %67 = and i8 %66, 2
  %68 = zext i8 %67 to i16
  %69 = getelementptr inbounds i16, i16* %2, i64 9
  store i16 %68, i16* %69, align 2
  %70 = load i8, i8* %64, align 1
  %71 = zext i8 %70 to i16
  %72 = lshr i16 %71, 7
  %73 = or i16 %72, %68
  store i16 %73, i16* %69, align 2
  %74 = load i8, i8* %64, align 1
  %75 = zext i8 %74 to i16
  %76 = lshr i16 %75, 5
  %77 = and i16 %76, 3
  %78 = getelementptr inbounds i16, i16* %2, i64 10
  store i16 %77, i16* %78, align 2
  %79 = getelementptr inbounds i8, i8* %1, i64 7
  %80 = load i8, i8* %64, align 1
  %81 = shl i8 %80, 1
  %82 = and i8 %81, 62
  %83 = zext i8 %82 to i16
  %84 = getelementptr inbounds i16, i16* %2, i64 11
  store i16 %83, i16* %84, align 2
  %85 = load i8, i8* %79, align 1
  %86 = zext i8 %85 to i16
  %87 = lshr i16 %86, 7
  %88 = or i16 %87, %83
  store i16 %88, i16* %84, align 2
  %89 = load i8, i8* %79, align 1
  %90 = zext i8 %89 to i16
  %91 = lshr i16 %90, 4
  %92 = and i16 %91, 7
  %93 = getelementptr inbounds i16, i16* %2, i64 12
  store i16 %92, i16* %93, align 2
  %94 = load i8, i8* %79, align 1
  %95 = zext i8 %94 to i16
  %96 = lshr i16 %95, 1
  %97 = and i16 %96, 7
  %98 = getelementptr inbounds i16, i16* %2, i64 13
  store i16 %97, i16* %98, align 2
  %99 = getelementptr inbounds i8, i8* %1, i64 8
  %100 = load i8, i8* %79, align 1
  %101 = shl i8 %100, 2
  %102 = and i8 %101, 4
  %103 = zext i8 %102 to i16
  %104 = getelementptr inbounds i16, i16* %2, i64 14
  store i16 %103, i16* %104, align 2
  %105 = load i8, i8* %99, align 1
  %106 = zext i8 %105 to i16
  %107 = lshr i16 %106, 6
  %108 = or i16 %107, %103
  store i16 %108, i16* %104, align 2
  %109 = load i8, i8* %99, align 1
  %110 = zext i8 %109 to i16
  %111 = lshr i16 %110, 3
  %112 = and i16 %111, 7
  %113 = getelementptr inbounds i16, i16* %2, i64 15
  store i16 %112, i16* %113, align 2
  %114 = getelementptr inbounds i8, i8* %1, i64 9
  %115 = load i8, i8* %99, align 1
  %116 = and i8 %115, 7
  %117 = zext i8 %116 to i16
  %118 = getelementptr inbounds i16, i16* %2, i64 16
  store i16 %117, i16* %118, align 2
  %119 = load i8, i8* %114, align 1
  %120 = zext i8 %119 to i16
  %121 = lshr i16 %120, 5
  %122 = getelementptr inbounds i16, i16* %2, i64 17
  store i16 %121, i16* %122, align 2
  %123 = load i8, i8* %114, align 1
  %124 = zext i8 %123 to i16
  %125 = lshr i16 %124, 2
  %126 = and i16 %125, 7
  %127 = getelementptr inbounds i16, i16* %2, i64 18
  store i16 %126, i16* %127, align 2
  %128 = getelementptr inbounds i8, i8* %1, i64 10
  %129 = load i8, i8* %114, align 1
  %130 = shl i8 %129, 1
  %131 = and i8 %130, 6
  %132 = zext i8 %131 to i16
  %133 = getelementptr inbounds i16, i16* %2, i64 19
  store i16 %132, i16* %133, align 2
  %134 = load i8, i8* %128, align 1
  %135 = zext i8 %134 to i16
  %136 = lshr i16 %135, 7
  %137 = or i16 %136, %132
  store i16 %137, i16* %133, align 2
  %138 = load i8, i8* %128, align 1
  %139 = zext i8 %138 to i16
  %140 = lshr i16 %139, 4
  %141 = and i16 %140, 7
  %142 = getelementptr inbounds i16, i16* %2, i64 20
  store i16 %141, i16* %142, align 2
  %143 = load i8, i8* %128, align 1
  %144 = zext i8 %143 to i16
  %145 = lshr i16 %144, 1
  %146 = and i16 %145, 7
  %147 = getelementptr inbounds i16, i16* %2, i64 21
  store i16 %146, i16* %147, align 2
  %148 = getelementptr inbounds i8, i8* %1, i64 11
  %149 = load i8, i8* %128, align 1
  %150 = shl i8 %149, 2
  %151 = and i8 %150, 4
  %152 = zext i8 %151 to i16
  %153 = getelementptr inbounds i16, i16* %2, i64 22
  store i16 %152, i16* %153, align 2
  %154 = load i8, i8* %148, align 1
  %155 = zext i8 %154 to i16
  %156 = lshr i16 %155, 6
  %157 = or i16 %156, %152
  store i16 %157, i16* %153, align 2
  %158 = load i8, i8* %148, align 1
  %159 = zext i8 %158 to i16
  %160 = lshr i16 %159, 3
  %161 = and i16 %160, 7
  %162 = getelementptr inbounds i16, i16* %2, i64 23
  store i16 %161, i16* %162, align 2
  %163 = getelementptr inbounds i8, i8* %1, i64 12
  %164 = load i8, i8* %148, align 1
  %165 = and i8 %164, 7
  %166 = zext i8 %165 to i16
  %167 = getelementptr inbounds i16, i16* %2, i64 24
  store i16 %166, i16* %167, align 2
  %168 = load i8, i8* %163, align 1
  %169 = zext i8 %168 to i16
  %170 = lshr i16 %169, 1
  %171 = getelementptr inbounds i16, i16* %2, i64 25
  store i16 %170, i16* %171, align 2
  %172 = getelementptr inbounds i8, i8* %1, i64 13
  %173 = load i8, i8* %163, align 1
  %174 = shl i8 %173, 1
  %175 = and i8 %174, 2
  %176 = zext i8 %175 to i16
  %177 = getelementptr inbounds i16, i16* %2, i64 26
  store i16 %176, i16* %177, align 2
  %178 = load i8, i8* %172, align 1
  %179 = zext i8 %178 to i16
  %180 = lshr i16 %179, 7
  %181 = or i16 %180, %176
  store i16 %181, i16* %177, align 2
  %182 = load i8, i8* %172, align 1
  %183 = zext i8 %182 to i16
  %184 = lshr i16 %183, 5
  %185 = and i16 %184, 3
  %186 = getelementptr inbounds i16, i16* %2, i64 27
  store i16 %185, i16* %186, align 2
  %187 = getelementptr inbounds i8, i8* %1, i64 14
  %188 = load i8, i8* %172, align 1
  %189 = shl i8 %188, 1
  %190 = and i8 %189, 62
  %191 = zext i8 %190 to i16
  %192 = getelementptr inbounds i16, i16* %2, i64 28
  store i16 %191, i16* %192, align 2
  %193 = load i8, i8* %187, align 1
  %194 = zext i8 %193 to i16
  %195 = lshr i16 %194, 7
  %196 = or i16 %195, %191
  store i16 %196, i16* %192, align 2
  %197 = load i8, i8* %187, align 1
  %198 = zext i8 %197 to i16
  %199 = lshr i16 %198, 4
  %200 = and i16 %199, 7
  %201 = getelementptr inbounds i16, i16* %2, i64 29
  store i16 %200, i16* %201, align 2
  %202 = load i8, i8* %187, align 1
  %203 = zext i8 %202 to i16
  %204 = lshr i16 %203, 1
  %205 = and i16 %204, 7
  %206 = getelementptr inbounds i16, i16* %2, i64 30
  store i16 %205, i16* %206, align 2
  %207 = getelementptr inbounds i8, i8* %1, i64 15
  %208 = load i8, i8* %187, align 1
  %209 = shl i8 %208, 2
  %210 = and i8 %209, 4
  %211 = zext i8 %210 to i16
  %212 = getelementptr inbounds i16, i16* %2, i64 31
  store i16 %211, i16* %212, align 2
  %213 = load i8, i8* %207, align 1
  %214 = zext i8 %213 to i16
  %215 = lshr i16 %214, 6
  %216 = or i16 %215, %211
  store i16 %216, i16* %212, align 2
  %217 = load i8, i8* %207, align 1
  %218 = zext i8 %217 to i16
  %219 = lshr i16 %218, 3
  %220 = and i16 %219, 7
  %221 = getelementptr inbounds i16, i16* %2, i64 32
  store i16 %220, i16* %221, align 2
  %222 = getelementptr inbounds i8, i8* %1, i64 16
  %223 = load i8, i8* %207, align 1
  %224 = and i8 %223, 7
  %225 = zext i8 %224 to i16
  %226 = getelementptr inbounds i16, i16* %2, i64 33
  store i16 %225, i16* %226, align 2
  %227 = load i8, i8* %222, align 1
  %228 = zext i8 %227 to i16
  %229 = lshr i16 %228, 5
  %230 = getelementptr inbounds i16, i16* %2, i64 34
  store i16 %229, i16* %230, align 2
  %231 = load i8, i8* %222, align 1
  %232 = zext i8 %231 to i16
  %233 = lshr i16 %232, 2
  %234 = and i16 %233, 7
  %235 = getelementptr inbounds i16, i16* %2, i64 35
  store i16 %234, i16* %235, align 2
  %236 = getelementptr inbounds i8, i8* %1, i64 17
  %237 = load i8, i8* %222, align 1
  %238 = shl i8 %237, 1
  %239 = and i8 %238, 6
  %240 = zext i8 %239 to i16
  %241 = getelementptr inbounds i16, i16* %2, i64 36
  store i16 %240, i16* %241, align 2
  %242 = load i8, i8* %236, align 1
  %243 = zext i8 %242 to i16
  %244 = lshr i16 %243, 7
  %245 = or i16 %244, %240
  store i16 %245, i16* %241, align 2
  %246 = load i8, i8* %236, align 1
  %247 = zext i8 %246 to i16
  %248 = lshr i16 %247, 4
  %249 = and i16 %248, 7
  %250 = getelementptr inbounds i16, i16* %2, i64 37
  store i16 %249, i16* %250, align 2
  %251 = load i8, i8* %236, align 1
  %252 = zext i8 %251 to i16
  %253 = lshr i16 %252, 1
  %254 = and i16 %253, 7
  %255 = getelementptr inbounds i16, i16* %2, i64 38
  store i16 %254, i16* %255, align 2
  %256 = getelementptr inbounds i8, i8* %1, i64 18
  %257 = load i8, i8* %236, align 1
  %258 = shl i8 %257, 2
  %259 = and i8 %258, 4
  %260 = zext i8 %259 to i16
  %261 = getelementptr inbounds i16, i16* %2, i64 39
  store i16 %260, i16* %261, align 2
  %262 = load i8, i8* %256, align 1
  %263 = zext i8 %262 to i16
  %264 = lshr i16 %263, 6
  %265 = or i16 %264, %260
  store i16 %265, i16* %261, align 2
  %266 = load i8, i8* %256, align 1
  %267 = zext i8 %266 to i16
  %268 = lshr i16 %267, 3
  %269 = and i16 %268, 7
  %270 = getelementptr inbounds i16, i16* %2, i64 40
  store i16 %269, i16* %270, align 2
  %271 = getelementptr inbounds i8, i8* %1, i64 19
  %272 = load i8, i8* %256, align 1
  %273 = and i8 %272, 7
  %274 = zext i8 %273 to i16
  %275 = getelementptr inbounds i16, i16* %2, i64 41
  store i16 %274, i16* %275, align 2
  %276 = load i8, i8* %271, align 1
  %277 = zext i8 %276 to i16
  %278 = lshr i16 %277, 1
  %279 = getelementptr inbounds i16, i16* %2, i64 42
  store i16 %278, i16* %279, align 2
  %280 = getelementptr inbounds i8, i8* %1, i64 20
  %281 = load i8, i8* %271, align 1
  %282 = shl i8 %281, 1
  %283 = and i8 %282, 2
  %284 = zext i8 %283 to i16
  %285 = getelementptr inbounds i16, i16* %2, i64 43
  store i16 %284, i16* %285, align 2
  %286 = load i8, i8* %280, align 1
  %287 = zext i8 %286 to i16
  %288 = lshr i16 %287, 7
  %289 = or i16 %288, %284
  store i16 %289, i16* %285, align 2
  %290 = load i8, i8* %280, align 1
  %291 = zext i8 %290 to i16
  %292 = lshr i16 %291, 5
  %293 = and i16 %292, 3
  %294 = getelementptr inbounds i16, i16* %2, i64 44
  store i16 %293, i16* %294, align 2
  %295 = getelementptr inbounds i8, i8* %1, i64 21
  %296 = load i8, i8* %280, align 1
  %297 = shl i8 %296, 1
  %298 = and i8 %297, 62
  %299 = zext i8 %298 to i16
  %300 = getelementptr inbounds i16, i16* %2, i64 45
  store i16 %299, i16* %300, align 2
  %301 = load i8, i8* %295, align 1
  %302 = zext i8 %301 to i16
  %303 = lshr i16 %302, 7
  %304 = or i16 %303, %299
  store i16 %304, i16* %300, align 2
  %305 = load i8, i8* %295, align 1
  %306 = zext i8 %305 to i16
  %307 = lshr i16 %306, 4
  %308 = and i16 %307, 7
  %309 = getelementptr inbounds i16, i16* %2, i64 46
  store i16 %308, i16* %309, align 2
  %310 = load i8, i8* %295, align 1
  %311 = zext i8 %310 to i16
  %312 = lshr i16 %311, 1
  %313 = and i16 %312, 7
  %314 = getelementptr inbounds i16, i16* %2, i64 47
  store i16 %313, i16* %314, align 2
  %315 = getelementptr inbounds i8, i8* %1, i64 22
  %316 = load i8, i8* %295, align 1
  %317 = shl i8 %316, 2
  %318 = and i8 %317, 4
  %319 = zext i8 %318 to i16
  %320 = getelementptr inbounds i16, i16* %2, i64 48
  store i16 %319, i16* %320, align 2
  %321 = load i8, i8* %315, align 1
  %322 = zext i8 %321 to i16
  %323 = lshr i16 %322, 6
  %324 = or i16 %323, %319
  store i16 %324, i16* %320, align 2
  %325 = load i8, i8* %315, align 1
  %326 = zext i8 %325 to i16
  %327 = lshr i16 %326, 3
  %328 = and i16 %327, 7
  %329 = getelementptr inbounds i16, i16* %2, i64 49
  store i16 %328, i16* %329, align 2
  %330 = getelementptr inbounds i8, i8* %1, i64 23
  %331 = load i8, i8* %315, align 1
  %332 = and i8 %331, 7
  %333 = zext i8 %332 to i16
  %334 = getelementptr inbounds i16, i16* %2, i64 50
  store i16 %333, i16* %334, align 2
  %335 = load i8, i8* %330, align 1
  %336 = zext i8 %335 to i16
  %337 = lshr i16 %336, 5
  %338 = getelementptr inbounds i16, i16* %2, i64 51
  store i16 %337, i16* %338, align 2
  %339 = load i8, i8* %330, align 1
  %340 = zext i8 %339 to i16
  %341 = lshr i16 %340, 2
  %342 = and i16 %341, 7
  %343 = getelementptr inbounds i16, i16* %2, i64 52
  store i16 %342, i16* %343, align 2
  %344 = getelementptr inbounds i8, i8* %1, i64 24
  %345 = load i8, i8* %330, align 1
  %346 = shl i8 %345, 1
  %347 = and i8 %346, 6
  %348 = zext i8 %347 to i16
  %349 = getelementptr inbounds i16, i16* %2, i64 53
  store i16 %348, i16* %349, align 2
  %350 = load i8, i8* %344, align 1
  %351 = zext i8 %350 to i16
  %352 = lshr i16 %351, 7
  %353 = or i16 %352, %348
  store i16 %353, i16* %349, align 2
  %354 = load i8, i8* %344, align 1
  %355 = zext i8 %354 to i16
  %356 = lshr i16 %355, 4
  %357 = and i16 %356, 7
  %358 = getelementptr inbounds i16, i16* %2, i64 54
  store i16 %357, i16* %358, align 2
  %359 = load i8, i8* %344, align 1
  %360 = zext i8 %359 to i16
  %361 = lshr i16 %360, 1
  %362 = and i16 %361, 7
  %363 = getelementptr inbounds i16, i16* %2, i64 55
  store i16 %362, i16* %363, align 2
  %364 = getelementptr inbounds i8, i8* %1, i64 25
  %365 = load i8, i8* %344, align 1
  %366 = shl i8 %365, 2
  %367 = and i8 %366, 4
  %368 = zext i8 %367 to i16
  %369 = getelementptr inbounds i16, i16* %2, i64 56
  store i16 %368, i16* %369, align 2
  %370 = load i8, i8* %364, align 1
  %371 = zext i8 %370 to i16
  %372 = lshr i16 %371, 6
  %373 = or i16 %372, %368
  store i16 %373, i16* %369, align 2
  %374 = load i8, i8* %364, align 1
  %375 = zext i8 %374 to i16
  %376 = lshr i16 %375, 3
  %377 = and i16 %376, 7
  %378 = getelementptr inbounds i16, i16* %2, i64 57
  store i16 %377, i16* %378, align 2
  %379 = getelementptr inbounds i8, i8* %1, i64 26
  %380 = load i8, i8* %364, align 1
  %381 = and i8 %380, 7
  %382 = zext i8 %381 to i16
  %383 = getelementptr inbounds i16, i16* %2, i64 58
  store i16 %382, i16* %383, align 2
  %384 = load i8, i8* %379, align 1
  %385 = zext i8 %384 to i16
  %386 = lshr i16 %385, 1
  %387 = getelementptr inbounds i16, i16* %2, i64 59
  store i16 %386, i16* %387, align 2
  %388 = getelementptr inbounds i8, i8* %1, i64 27
  %389 = load i8, i8* %379, align 1
  %390 = shl i8 %389, 1
  %391 = and i8 %390, 2
  %392 = zext i8 %391 to i16
  %393 = getelementptr inbounds i16, i16* %2, i64 60
  store i16 %392, i16* %393, align 2
  %394 = load i8, i8* %388, align 1
  %395 = zext i8 %394 to i16
  %396 = lshr i16 %395, 7
  %397 = or i16 %396, %392
  store i16 %397, i16* %393, align 2
  %398 = load i8, i8* %388, align 1
  %399 = zext i8 %398 to i16
  %400 = lshr i16 %399, 5
  %401 = and i16 %400, 3
  %402 = getelementptr inbounds i16, i16* %2, i64 61
  store i16 %401, i16* %402, align 2
  %403 = getelementptr inbounds i8, i8* %1, i64 28
  %404 = load i8, i8* %388, align 1
  %405 = shl i8 %404, 1
  %406 = and i8 %405, 62
  %407 = zext i8 %406 to i16
  %408 = getelementptr inbounds i16, i16* %2, i64 62
  store i16 %407, i16* %408, align 2
  %409 = load i8, i8* %403, align 1
  %410 = zext i8 %409 to i16
  %411 = lshr i16 %410, 7
  %412 = or i16 %411, %407
  store i16 %412, i16* %408, align 2
  %413 = load i8, i8* %403, align 1
  %414 = zext i8 %413 to i16
  %415 = lshr i16 %414, 4
  %416 = and i16 %415, 7
  %417 = getelementptr inbounds i16, i16* %2, i64 63
  store i16 %416, i16* %417, align 2
  %418 = load i8, i8* %403, align 1
  %419 = zext i8 %418 to i16
  %420 = lshr i16 %419, 1
  %421 = and i16 %420, 7
  %422 = getelementptr inbounds i16, i16* %2, i64 64
  store i16 %421, i16* %422, align 2
  %423 = getelementptr inbounds i8, i8* %1, i64 29
  %424 = load i8, i8* %403, align 1
  %425 = shl i8 %424, 2
  %426 = and i8 %425, 4
  %427 = zext i8 %426 to i16
  %428 = getelementptr inbounds i16, i16* %2, i64 65
  store i16 %427, i16* %428, align 2
  %429 = load i8, i8* %423, align 1
  %430 = zext i8 %429 to i16
  %431 = lshr i16 %430, 6
  %432 = or i16 %431, %427
  store i16 %432, i16* %428, align 2
  %433 = load i8, i8* %423, align 1
  %434 = zext i8 %433 to i16
  %435 = lshr i16 %434, 3
  %436 = and i16 %435, 7
  %437 = getelementptr inbounds i16, i16* %2, i64 66
  store i16 %436, i16* %437, align 2
  %438 = getelementptr inbounds i8, i8* %1, i64 30
  %439 = load i8, i8* %423, align 1
  %440 = and i8 %439, 7
  %441 = zext i8 %440 to i16
  %442 = getelementptr inbounds i16, i16* %2, i64 67
  store i16 %441, i16* %442, align 2
  %443 = load i8, i8* %438, align 1
  %444 = zext i8 %443 to i16
  %445 = lshr i16 %444, 5
  %446 = getelementptr inbounds i16, i16* %2, i64 68
  store i16 %445, i16* %446, align 2
  %447 = load i8, i8* %438, align 1
  %448 = zext i8 %447 to i16
  %449 = lshr i16 %448, 2
  %450 = and i16 %449, 7
  %451 = getelementptr inbounds i16, i16* %2, i64 69
  store i16 %450, i16* %451, align 2
  %452 = getelementptr inbounds i8, i8* %1, i64 31
  %453 = load i8, i8* %438, align 1
  %454 = shl i8 %453, 1
  %455 = and i8 %454, 6
  %456 = zext i8 %455 to i16
  %457 = getelementptr inbounds i16, i16* %2, i64 70
  store i16 %456, i16* %457, align 2
  %458 = load i8, i8* %452, align 1
  %459 = zext i8 %458 to i16
  %460 = lshr i16 %459, 7
  %461 = or i16 %460, %456
  store i16 %461, i16* %457, align 2
  %462 = load i8, i8* %452, align 1
  %463 = zext i8 %462 to i16
  %464 = lshr i16 %463, 4
  %465 = and i16 %464, 7
  %466 = getelementptr inbounds i16, i16* %2, i64 71
  store i16 %465, i16* %466, align 2
  %467 = load i8, i8* %452, align 1
  %468 = zext i8 %467 to i16
  %469 = lshr i16 %468, 1
  %470 = and i16 %469, 7
  %471 = getelementptr inbounds i16, i16* %2, i64 72
  store i16 %470, i16* %471, align 2
  %472 = getelementptr inbounds i8, i8* %1, i64 32
  %473 = load i8, i8* %452, align 1
  %474 = shl i8 %473, 2
  %475 = and i8 %474, 4
  %476 = zext i8 %475 to i16
  %477 = getelementptr inbounds i16, i16* %2, i64 73
  store i16 %476, i16* %477, align 2
  %478 = load i8, i8* %472, align 1
  %479 = zext i8 %478 to i16
  %480 = lshr i16 %479, 6
  %481 = or i16 %480, %476
  store i16 %481, i16* %477, align 2
  %482 = load i8, i8* %472, align 1
  %483 = zext i8 %482 to i16
  %484 = lshr i16 %483, 3
  %485 = and i16 %484, 7
  %486 = getelementptr inbounds i16, i16* %2, i64 74
  store i16 %485, i16* %486, align 2
  %487 = load i8, i8* %472, align 1
  %488 = and i8 %487, 7
  %489 = zext i8 %488 to i16
  %490 = getelementptr inbounds i16, i16* %2, i64 75
  store i16 %489, i16* %490, align 2
  br label %491

; <label>:491:                                    ; preds = %3, %7
  %.0 = phi i32 [ 0, %7 ], [ -1, %3 ]
  ret i32 %.0
}

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
