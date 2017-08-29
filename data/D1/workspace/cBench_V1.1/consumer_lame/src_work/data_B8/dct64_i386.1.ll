; ModuleID = 'dct64_i386.ll'
source_filename = "dct64_i386.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@pnts = external local_unnamed_addr global [5 x double*], align 16

; Function Attrs: noinline norecurse nounwind uwtable
define void @dct64(double* nocapture, double* nocapture, double* readonly) local_unnamed_addr #0 {
  %4 = alloca [64 x double], align 16
  %5 = getelementptr inbounds [64 x double], [64 x double]* %4, i64 0, i64 0
  %6 = getelementptr inbounds [64 x double], [64 x double]* %4, i64 0, i64 32
  call fastcc void @dct64_1(double* %0, double* %1, double* nonnull %5, double* %6, double* %2)
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @dct64_1(double* nocapture, double* nocapture, double*, double*, double* readonly) unnamed_addr #0 {
  %6 = load double*, double** getelementptr inbounds ([5 x double*], [5 x double*]* @pnts, i64 0, i64 0), align 16
  %7 = load double, double* %4, align 8
  %8 = getelementptr inbounds double, double* %4, i64 31
  %9 = load double, double* %8, align 8
  %10 = fadd double %7, %9
  store double %10, double* %2, align 8
  %11 = load double, double* %4, align 8
  %12 = load double, double* %8, align 8
  %13 = fsub double %11, %12
  %14 = load double, double* %6, align 8
  %15 = fmul double %13, %14
  %16 = getelementptr inbounds double, double* %2, i64 31
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds double, double* %4, i64 1
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds double, double* %4, i64 30
  %20 = load double, double* %19, align 8
  %21 = fadd double %18, %20
  %22 = getelementptr inbounds double, double* %2, i64 1
  store double %21, double* %22, align 8
  %23 = load double, double* %17, align 8
  %24 = load double, double* %19, align 8
  %25 = fsub double %23, %24
  %26 = getelementptr inbounds double, double* %6, i64 1
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = getelementptr inbounds double, double* %2, i64 30
  store double %28, double* %29, align 8
  %30 = getelementptr inbounds double, double* %4, i64 2
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds double, double* %4, i64 29
  %33 = load double, double* %32, align 8
  %34 = fadd double %31, %33
  %35 = getelementptr inbounds double, double* %2, i64 2
  store double %34, double* %35, align 8
  %36 = load double, double* %30, align 8
  %37 = load double, double* %32, align 8
  %38 = fsub double %36, %37
  %39 = getelementptr inbounds double, double* %6, i64 2
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = getelementptr inbounds double, double* %2, i64 29
  store double %41, double* %42, align 8
  %43 = getelementptr inbounds double, double* %4, i64 3
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds double, double* %4, i64 28
  %46 = load double, double* %45, align 8
  %47 = fadd double %44, %46
  %48 = getelementptr inbounds double, double* %2, i64 3
  store double %47, double* %48, align 8
  %49 = load double, double* %43, align 8
  %50 = load double, double* %45, align 8
  %51 = fsub double %49, %50
  %52 = getelementptr inbounds double, double* %6, i64 3
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = getelementptr inbounds double, double* %2, i64 28
  store double %54, double* %55, align 8
  %56 = getelementptr inbounds double, double* %4, i64 4
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds double, double* %4, i64 27
  %59 = load double, double* %58, align 8
  %60 = fadd double %57, %59
  %61 = getelementptr inbounds double, double* %2, i64 4
  store double %60, double* %61, align 8
  %62 = load double, double* %56, align 8
  %63 = load double, double* %58, align 8
  %64 = fsub double %62, %63
  %65 = getelementptr inbounds double, double* %6, i64 4
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = getelementptr inbounds double, double* %2, i64 27
  store double %67, double* %68, align 8
  %69 = getelementptr inbounds double, double* %4, i64 5
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds double, double* %4, i64 26
  %72 = load double, double* %71, align 8
  %73 = fadd double %70, %72
  %74 = getelementptr inbounds double, double* %2, i64 5
  store double %73, double* %74, align 8
  %75 = load double, double* %69, align 8
  %76 = load double, double* %71, align 8
  %77 = fsub double %75, %76
  %78 = getelementptr inbounds double, double* %6, i64 5
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = getelementptr inbounds double, double* %2, i64 26
  store double %80, double* %81, align 8
  %82 = getelementptr inbounds double, double* %4, i64 6
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds double, double* %4, i64 25
  %85 = load double, double* %84, align 8
  %86 = fadd double %83, %85
  %87 = getelementptr inbounds double, double* %2, i64 6
  store double %86, double* %87, align 8
  %88 = load double, double* %82, align 8
  %89 = load double, double* %84, align 8
  %90 = fsub double %88, %89
  %91 = getelementptr inbounds double, double* %6, i64 6
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = getelementptr inbounds double, double* %2, i64 25
  store double %93, double* %94, align 8
  %95 = getelementptr inbounds double, double* %4, i64 7
  %96 = load double, double* %95, align 8
  %97 = getelementptr inbounds double, double* %4, i64 24
  %98 = load double, double* %97, align 8
  %99 = fadd double %96, %98
  %100 = getelementptr inbounds double, double* %2, i64 7
  store double %99, double* %100, align 8
  %101 = load double, double* %95, align 8
  %102 = load double, double* %97, align 8
  %103 = fsub double %101, %102
  %104 = getelementptr inbounds double, double* %6, i64 7
  %105 = load double, double* %104, align 8
  %106 = fmul double %103, %105
  %107 = getelementptr inbounds double, double* %2, i64 24
  store double %106, double* %107, align 8
  %108 = getelementptr inbounds double, double* %4, i64 8
  %109 = load double, double* %108, align 8
  %110 = getelementptr inbounds double, double* %4, i64 23
  %111 = load double, double* %110, align 8
  %112 = fadd double %109, %111
  %113 = getelementptr inbounds double, double* %2, i64 8
  store double %112, double* %113, align 8
  %114 = load double, double* %108, align 8
  %115 = load double, double* %110, align 8
  %116 = fsub double %114, %115
  %117 = getelementptr inbounds double, double* %6, i64 8
  %118 = load double, double* %117, align 8
  %119 = fmul double %116, %118
  %120 = getelementptr inbounds double, double* %2, i64 23
  store double %119, double* %120, align 8
  %121 = getelementptr inbounds double, double* %4, i64 9
  %122 = load double, double* %121, align 8
  %123 = getelementptr inbounds double, double* %4, i64 22
  %124 = load double, double* %123, align 8
  %125 = fadd double %122, %124
  %126 = getelementptr inbounds double, double* %2, i64 9
  store double %125, double* %126, align 8
  %127 = load double, double* %121, align 8
  %128 = load double, double* %123, align 8
  %129 = fsub double %127, %128
  %130 = getelementptr inbounds double, double* %6, i64 9
  %131 = load double, double* %130, align 8
  %132 = fmul double %129, %131
  %133 = getelementptr inbounds double, double* %2, i64 22
  store double %132, double* %133, align 8
  %134 = getelementptr inbounds double, double* %4, i64 10
  %135 = load double, double* %134, align 8
  %136 = getelementptr inbounds double, double* %4, i64 21
  %137 = load double, double* %136, align 8
  %138 = fadd double %135, %137
  %139 = getelementptr inbounds double, double* %2, i64 10
  store double %138, double* %139, align 8
  %140 = load double, double* %134, align 8
  %141 = load double, double* %136, align 8
  %142 = fsub double %140, %141
  %143 = getelementptr inbounds double, double* %6, i64 10
  %144 = load double, double* %143, align 8
  %145 = fmul double %142, %144
  %146 = getelementptr inbounds double, double* %2, i64 21
  store double %145, double* %146, align 8
  %147 = getelementptr inbounds double, double* %4, i64 11
  %148 = load double, double* %147, align 8
  %149 = getelementptr inbounds double, double* %4, i64 20
  %150 = load double, double* %149, align 8
  %151 = fadd double %148, %150
  %152 = getelementptr inbounds double, double* %2, i64 11
  store double %151, double* %152, align 8
  %153 = load double, double* %147, align 8
  %154 = load double, double* %149, align 8
  %155 = fsub double %153, %154
  %156 = getelementptr inbounds double, double* %6, i64 11
  %157 = load double, double* %156, align 8
  %158 = fmul double %155, %157
  %159 = getelementptr inbounds double, double* %2, i64 20
  store double %158, double* %159, align 8
  %160 = getelementptr inbounds double, double* %4, i64 12
  %161 = load double, double* %160, align 8
  %162 = getelementptr inbounds double, double* %4, i64 19
  %163 = load double, double* %162, align 8
  %164 = fadd double %161, %163
  %165 = getelementptr inbounds double, double* %2, i64 12
  store double %164, double* %165, align 8
  %166 = load double, double* %160, align 8
  %167 = load double, double* %162, align 8
  %168 = fsub double %166, %167
  %169 = getelementptr inbounds double, double* %6, i64 12
  %170 = load double, double* %169, align 8
  %171 = fmul double %168, %170
  %172 = getelementptr inbounds double, double* %2, i64 19
  store double %171, double* %172, align 8
  %173 = getelementptr inbounds double, double* %4, i64 13
  %174 = load double, double* %173, align 8
  %175 = getelementptr inbounds double, double* %4, i64 18
  %176 = load double, double* %175, align 8
  %177 = fadd double %174, %176
  %178 = getelementptr inbounds double, double* %2, i64 13
  store double %177, double* %178, align 8
  %179 = load double, double* %173, align 8
  %180 = load double, double* %175, align 8
  %181 = fsub double %179, %180
  %182 = getelementptr inbounds double, double* %6, i64 13
  %183 = load double, double* %182, align 8
  %184 = fmul double %181, %183
  %185 = getelementptr inbounds double, double* %2, i64 18
  store double %184, double* %185, align 8
  %186 = getelementptr inbounds double, double* %4, i64 14
  %187 = load double, double* %186, align 8
  %188 = getelementptr inbounds double, double* %4, i64 17
  %189 = load double, double* %188, align 8
  %190 = fadd double %187, %189
  %191 = getelementptr inbounds double, double* %2, i64 14
  store double %190, double* %191, align 8
  %192 = load double, double* %186, align 8
  %193 = load double, double* %188, align 8
  %194 = fsub double %192, %193
  %195 = getelementptr inbounds double, double* %6, i64 14
  %196 = load double, double* %195, align 8
  %197 = fmul double %194, %196
  %198 = getelementptr inbounds double, double* %2, i64 17
  store double %197, double* %198, align 8
  %199 = getelementptr inbounds double, double* %4, i64 15
  %200 = load double, double* %199, align 8
  %201 = getelementptr inbounds double, double* %4, i64 16
  %202 = load double, double* %201, align 8
  %203 = fadd double %200, %202
  %204 = getelementptr inbounds double, double* %2, i64 15
  store double %203, double* %204, align 8
  %205 = load double, double* %199, align 8
  %206 = load double, double* %201, align 8
  %207 = fsub double %205, %206
  %208 = getelementptr inbounds double, double* %6, i64 15
  %209 = load double, double* %208, align 8
  %210 = fmul double %207, %209
  %211 = getelementptr inbounds double, double* %2, i64 16
  store double %210, double* %211, align 8
  %212 = load double*, double** getelementptr inbounds ([5 x double*], [5 x double*]* @pnts, i64 0, i64 1), align 8
  %213 = load double, double* %2, align 8
  %214 = load double, double* %204, align 8
  %215 = fadd double %213, %214
  store double %215, double* %3, align 8
  %216 = load double, double* %2, align 8
  %217 = load double, double* %204, align 8
  %218 = fsub double %216, %217
  %219 = load double, double* %212, align 8
  %220 = fmul double %218, %219
  %221 = getelementptr inbounds double, double* %3, i64 15
  store double %220, double* %221, align 8
  %222 = load double, double* %22, align 8
  %223 = load double, double* %191, align 8
  %224 = fadd double %222, %223
  %225 = getelementptr inbounds double, double* %3, i64 1
  store double %224, double* %225, align 8
  %226 = load double, double* %22, align 8
  %227 = load double, double* %191, align 8
  %228 = fsub double %226, %227
  %229 = getelementptr inbounds double, double* %212, i64 1
  %230 = load double, double* %229, align 8
  %231 = fmul double %228, %230
  %232 = getelementptr inbounds double, double* %3, i64 14
  store double %231, double* %232, align 8
  %233 = load double, double* %35, align 8
  %234 = load double, double* %178, align 8
  %235 = fadd double %233, %234
  %236 = getelementptr inbounds double, double* %3, i64 2
  store double %235, double* %236, align 8
  %237 = load double, double* %35, align 8
  %238 = load double, double* %178, align 8
  %239 = fsub double %237, %238
  %240 = getelementptr inbounds double, double* %212, i64 2
  %241 = load double, double* %240, align 8
  %242 = fmul double %239, %241
  %243 = getelementptr inbounds double, double* %3, i64 13
  store double %242, double* %243, align 8
  %244 = load double, double* %48, align 8
  %245 = load double, double* %165, align 8
  %246 = fadd double %244, %245
  %247 = getelementptr inbounds double, double* %3, i64 3
  store double %246, double* %247, align 8
  %248 = load double, double* %48, align 8
  %249 = load double, double* %165, align 8
  %250 = fsub double %248, %249
  %251 = getelementptr inbounds double, double* %212, i64 3
  %252 = load double, double* %251, align 8
  %253 = fmul double %250, %252
  %254 = getelementptr inbounds double, double* %3, i64 12
  store double %253, double* %254, align 8
  %255 = load double, double* %61, align 8
  %256 = load double, double* %152, align 8
  %257 = fadd double %255, %256
  %258 = getelementptr inbounds double, double* %3, i64 4
  store double %257, double* %258, align 8
  %259 = load double, double* %61, align 8
  %260 = load double, double* %152, align 8
  %261 = fsub double %259, %260
  %262 = getelementptr inbounds double, double* %212, i64 4
  %263 = load double, double* %262, align 8
  %264 = fmul double %261, %263
  %265 = getelementptr inbounds double, double* %3, i64 11
  store double %264, double* %265, align 8
  %266 = load double, double* %74, align 8
  %267 = load double, double* %139, align 8
  %268 = fadd double %266, %267
  %269 = getelementptr inbounds double, double* %3, i64 5
  store double %268, double* %269, align 8
  %270 = load double, double* %74, align 8
  %271 = load double, double* %139, align 8
  %272 = fsub double %270, %271
  %273 = getelementptr inbounds double, double* %212, i64 5
  %274 = load double, double* %273, align 8
  %275 = fmul double %272, %274
  %276 = getelementptr inbounds double, double* %3, i64 10
  store double %275, double* %276, align 8
  %277 = load double, double* %87, align 8
  %278 = load double, double* %126, align 8
  %279 = fadd double %277, %278
  %280 = getelementptr inbounds double, double* %3, i64 6
  store double %279, double* %280, align 8
  %281 = load double, double* %87, align 8
  %282 = load double, double* %126, align 8
  %283 = fsub double %281, %282
  %284 = getelementptr inbounds double, double* %212, i64 6
  %285 = load double, double* %284, align 8
  %286 = fmul double %283, %285
  %287 = getelementptr inbounds double, double* %3, i64 9
  store double %286, double* %287, align 8
  %288 = load double, double* %100, align 8
  %289 = load double, double* %113, align 8
  %290 = fadd double %288, %289
  %291 = getelementptr inbounds double, double* %3, i64 7
  store double %290, double* %291, align 8
  %292 = load double, double* %100, align 8
  %293 = load double, double* %113, align 8
  %294 = fsub double %292, %293
  %295 = getelementptr inbounds double, double* %212, i64 7
  %296 = load double, double* %295, align 8
  %297 = fmul double %294, %296
  %298 = getelementptr inbounds double, double* %3, i64 8
  store double %297, double* %298, align 8
  %299 = load double, double* %211, align 8
  %300 = load double, double* %16, align 8
  %301 = fadd double %299, %300
  %302 = getelementptr inbounds double, double* %3, i64 16
  store double %301, double* %302, align 8
  %303 = load double, double* %16, align 8
  %304 = load double, double* %211, align 8
  %305 = fsub double %303, %304
  %306 = load double, double* %212, align 8
  %307 = fmul double %305, %306
  %308 = getelementptr inbounds double, double* %3, i64 31
  store double %307, double* %308, align 8
  %309 = load double, double* %198, align 8
  %310 = load double, double* %29, align 8
  %311 = fadd double %309, %310
  %312 = getelementptr inbounds double, double* %3, i64 17
  store double %311, double* %312, align 8
  %313 = load double, double* %29, align 8
  %314 = load double, double* %198, align 8
  %315 = fsub double %313, %314
  %316 = load double, double* %229, align 8
  %317 = fmul double %315, %316
  %318 = getelementptr inbounds double, double* %3, i64 30
  store double %317, double* %318, align 8
  %319 = load double, double* %185, align 8
  %320 = load double, double* %42, align 8
  %321 = fadd double %319, %320
  %322 = getelementptr inbounds double, double* %3, i64 18
  store double %321, double* %322, align 8
  %323 = load double, double* %42, align 8
  %324 = load double, double* %185, align 8
  %325 = fsub double %323, %324
  %326 = load double, double* %240, align 8
  %327 = fmul double %325, %326
  %328 = getelementptr inbounds double, double* %3, i64 29
  store double %327, double* %328, align 8
  %329 = load double, double* %172, align 8
  %330 = load double, double* %55, align 8
  %331 = fadd double %329, %330
  %332 = getelementptr inbounds double, double* %3, i64 19
  store double %331, double* %332, align 8
  %333 = load double, double* %55, align 8
  %334 = load double, double* %172, align 8
  %335 = fsub double %333, %334
  %336 = load double, double* %251, align 8
  %337 = fmul double %335, %336
  %338 = getelementptr inbounds double, double* %3, i64 28
  store double %337, double* %338, align 8
  %339 = load double, double* %159, align 8
  %340 = load double, double* %68, align 8
  %341 = fadd double %339, %340
  %342 = getelementptr inbounds double, double* %3, i64 20
  store double %341, double* %342, align 8
  %343 = load double, double* %68, align 8
  %344 = load double, double* %159, align 8
  %345 = fsub double %343, %344
  %346 = load double, double* %262, align 8
  %347 = fmul double %345, %346
  %348 = getelementptr inbounds double, double* %3, i64 27
  store double %347, double* %348, align 8
  %349 = load double, double* %146, align 8
  %350 = load double, double* %81, align 8
  %351 = fadd double %349, %350
  %352 = getelementptr inbounds double, double* %3, i64 21
  store double %351, double* %352, align 8
  %353 = load double, double* %81, align 8
  %354 = load double, double* %146, align 8
  %355 = fsub double %353, %354
  %356 = load double, double* %273, align 8
  %357 = fmul double %355, %356
  %358 = getelementptr inbounds double, double* %3, i64 26
  store double %357, double* %358, align 8
  %359 = load double, double* %133, align 8
  %360 = load double, double* %94, align 8
  %361 = fadd double %359, %360
  %362 = getelementptr inbounds double, double* %3, i64 22
  store double %361, double* %362, align 8
  %363 = load double, double* %94, align 8
  %364 = load double, double* %133, align 8
  %365 = fsub double %363, %364
  %366 = load double, double* %284, align 8
  %367 = fmul double %365, %366
  %368 = getelementptr inbounds double, double* %3, i64 25
  store double %367, double* %368, align 8
  %369 = load double, double* %120, align 8
  %370 = load double, double* %107, align 8
  %371 = fadd double %369, %370
  %372 = getelementptr inbounds double, double* %3, i64 23
  store double %371, double* %372, align 8
  %373 = load double, double* %107, align 8
  %374 = load double, double* %120, align 8
  %375 = fsub double %373, %374
  %376 = load double, double* %295, align 8
  %377 = fmul double %375, %376
  %378 = getelementptr inbounds double, double* %3, i64 24
  store double %377, double* %378, align 8
  %379 = load double*, double** getelementptr inbounds ([5 x double*], [5 x double*]* @pnts, i64 0, i64 2), align 16
  %380 = load double, double* %3, align 8
  %381 = load double, double* %291, align 8
  %382 = fadd double %380, %381
  store double %382, double* %2, align 8
  %383 = load double, double* %3, align 8
  %384 = load double, double* %291, align 8
  %385 = fsub double %383, %384
  %386 = load double, double* %379, align 8
  %387 = fmul double %385, %386
  store double %387, double* %100, align 8
  %388 = load double, double* %225, align 8
  %389 = load double, double* %280, align 8
  %390 = fadd double %388, %389
  store double %390, double* %22, align 8
  %391 = load double, double* %225, align 8
  %392 = load double, double* %280, align 8
  %393 = fsub double %391, %392
  %394 = getelementptr inbounds double, double* %379, i64 1
  %395 = load double, double* %394, align 8
  %396 = fmul double %393, %395
  store double %396, double* %87, align 8
  %397 = load double, double* %236, align 8
  %398 = load double, double* %269, align 8
  %399 = fadd double %397, %398
  store double %399, double* %35, align 8
  %400 = load double, double* %236, align 8
  %401 = load double, double* %269, align 8
  %402 = fsub double %400, %401
  %403 = getelementptr inbounds double, double* %379, i64 2
  %404 = load double, double* %403, align 8
  %405 = fmul double %402, %404
  store double %405, double* %74, align 8
  %406 = load double, double* %247, align 8
  %407 = load double, double* %258, align 8
  %408 = fadd double %406, %407
  store double %408, double* %48, align 8
  %409 = load double, double* %247, align 8
  %410 = load double, double* %258, align 8
  %411 = fsub double %409, %410
  %412 = getelementptr inbounds double, double* %379, i64 3
  %413 = load double, double* %412, align 8
  %414 = fmul double %411, %413
  store double %414, double* %61, align 8
  %415 = load double, double* %298, align 8
  %416 = load double, double* %221, align 8
  %417 = fadd double %415, %416
  store double %417, double* %113, align 8
  %418 = load double, double* %221, align 8
  %419 = load double, double* %298, align 8
  %420 = fsub double %418, %419
  %421 = load double, double* %379, align 8
  %422 = fmul double %420, %421
  store double %422, double* %204, align 8
  %423 = load double, double* %287, align 8
  %424 = load double, double* %232, align 8
  %425 = fadd double %423, %424
  store double %425, double* %126, align 8
  %426 = load double, double* %232, align 8
  %427 = load double, double* %287, align 8
  %428 = fsub double %426, %427
  %429 = load double, double* %394, align 8
  %430 = fmul double %428, %429
  store double %430, double* %191, align 8
  %431 = load double, double* %276, align 8
  %432 = load double, double* %243, align 8
  %433 = fadd double %431, %432
  store double %433, double* %139, align 8
  %434 = load double, double* %243, align 8
  %435 = load double, double* %276, align 8
  %436 = fsub double %434, %435
  %437 = load double, double* %403, align 8
  %438 = fmul double %436, %437
  store double %438, double* %178, align 8
  %439 = load double, double* %265, align 8
  %440 = load double, double* %254, align 8
  %441 = fadd double %439, %440
  store double %441, double* %152, align 8
  %442 = load double, double* %254, align 8
  %443 = load double, double* %265, align 8
  %444 = fsub double %442, %443
  %445 = load double, double* %412, align 8
  %446 = fmul double %444, %445
  store double %446, double* %165, align 8
  %447 = load double, double* %302, align 8
  %448 = load double, double* %372, align 8
  %449 = fadd double %447, %448
  store double %449, double* %211, align 8
  %450 = load double, double* %302, align 8
  %451 = load double, double* %372, align 8
  %452 = fsub double %450, %451
  %453 = load double, double* %379, align 8
  %454 = fmul double %452, %453
  store double %454, double* %120, align 8
  %455 = load double, double* %312, align 8
  %456 = load double, double* %362, align 8
  %457 = fadd double %455, %456
  store double %457, double* %198, align 8
  %458 = load double, double* %312, align 8
  %459 = load double, double* %362, align 8
  %460 = fsub double %458, %459
  %461 = load double, double* %394, align 8
  %462 = fmul double %460, %461
  store double %462, double* %133, align 8
  %463 = load double, double* %322, align 8
  %464 = load double, double* %352, align 8
  %465 = fadd double %463, %464
  store double %465, double* %185, align 8
  %466 = load double, double* %322, align 8
  %467 = load double, double* %352, align 8
  %468 = fsub double %466, %467
  %469 = load double, double* %403, align 8
  %470 = fmul double %468, %469
  store double %470, double* %146, align 8
  %471 = load double, double* %332, align 8
  %472 = load double, double* %342, align 8
  %473 = fadd double %471, %472
  store double %473, double* %172, align 8
  %474 = load double, double* %332, align 8
  %475 = load double, double* %342, align 8
  %476 = fsub double %474, %475
  %477 = load double, double* %412, align 8
  %478 = fmul double %476, %477
  store double %478, double* %159, align 8
  %479 = load double, double* %378, align 8
  %480 = load double, double* %308, align 8
  %481 = fadd double %479, %480
  store double %481, double* %107, align 8
  %482 = load double, double* %308, align 8
  %483 = load double, double* %378, align 8
  %484 = fsub double %482, %483
  %485 = load double, double* %379, align 8
  %486 = fmul double %484, %485
  store double %486, double* %16, align 8
  %487 = load double, double* %368, align 8
  %488 = load double, double* %318, align 8
  %489 = fadd double %487, %488
  store double %489, double* %94, align 8
  %490 = load double, double* %318, align 8
  %491 = load double, double* %368, align 8
  %492 = fsub double %490, %491
  %493 = load double, double* %394, align 8
  %494 = fmul double %492, %493
  store double %494, double* %29, align 8
  %495 = load double, double* %358, align 8
  %496 = load double, double* %328, align 8
  %497 = fadd double %495, %496
  store double %497, double* %81, align 8
  %498 = load double, double* %328, align 8
  %499 = load double, double* %358, align 8
  %500 = fsub double %498, %499
  %501 = load double, double* %403, align 8
  %502 = fmul double %500, %501
  store double %502, double* %42, align 8
  %503 = load double, double* %348, align 8
  %504 = load double, double* %338, align 8
  %505 = fadd double %503, %504
  store double %505, double* %68, align 8
  %506 = load double, double* %338, align 8
  %507 = load double, double* %348, align 8
  %508 = fsub double %506, %507
  %509 = load double, double* %412, align 8
  %510 = fmul double %508, %509
  store double %510, double* %55, align 8
  %511 = load double*, double** getelementptr inbounds ([5 x double*], [5 x double*]* @pnts, i64 0, i64 3), align 8
  %512 = load double, double* %511, align 8
  %513 = getelementptr inbounds double, double* %511, i64 1
  %514 = load double, double* %513, align 8
  %515 = load double, double* %2, align 8
  %516 = load double, double* %48, align 8
  %517 = fadd double %515, %516
  store double %517, double* %3, align 8
  %518 = load double, double* %2, align 8
  %519 = load double, double* %48, align 8
  %520 = fsub double %518, %519
  %521 = fmul double %512, %520
  store double %521, double* %247, align 8
  %522 = load double, double* %22, align 8
  %523 = load double, double* %35, align 8
  %524 = fadd double %522, %523
  store double %524, double* %225, align 8
  %525 = load double, double* %22, align 8
  %526 = load double, double* %35, align 8
  %527 = fsub double %525, %526
  %528 = fmul double %514, %527
  store double %528, double* %236, align 8
  %529 = load double, double* %61, align 8
  %530 = load double, double* %100, align 8
  %531 = fadd double %529, %530
  store double %531, double* %258, align 8
  %532 = load double, double* %100, align 8
  %533 = load double, double* %61, align 8
  %534 = fsub double %532, %533
  %535 = fmul double %512, %534
  store double %535, double* %291, align 8
  %536 = load double, double* %74, align 8
  %537 = load double, double* %87, align 8
  %538 = fadd double %536, %537
  store double %538, double* %269, align 8
  %539 = load double, double* %87, align 8
  %540 = load double, double* %74, align 8
  %541 = fsub double %539, %540
  %542 = fmul double %514, %541
  store double %542, double* %280, align 8
  %543 = load double, double* %113, align 8
  %544 = load double, double* %152, align 8
  %545 = fadd double %543, %544
  store double %545, double* %298, align 8
  %546 = load double, double* %113, align 8
  %547 = load double, double* %152, align 8
  %548 = fsub double %546, %547
  %549 = fmul double %512, %548
  store double %549, double* %265, align 8
  %550 = load double, double* %126, align 8
  %551 = load double, double* %139, align 8
  %552 = fadd double %550, %551
  store double %552, double* %287, align 8
  %553 = load double, double* %126, align 8
  %554 = load double, double* %139, align 8
  %555 = fsub double %553, %554
  %556 = fmul double %514, %555
  store double %556, double* %276, align 8
  %557 = load double, double* %165, align 8
  %558 = load double, double* %204, align 8
  %559 = fadd double %557, %558
  store double %559, double* %254, align 8
  %560 = load double, double* %204, align 8
  %561 = load double, double* %165, align 8
  %562 = fsub double %560, %561
  %563 = fmul double %512, %562
  store double %563, double* %221, align 8
  %564 = load double, double* %178, align 8
  %565 = load double, double* %191, align 8
  %566 = fadd double %564, %565
  store double %566, double* %243, align 8
  %567 = load double, double* %191, align 8
  %568 = load double, double* %178, align 8
  %569 = fsub double %567, %568
  %570 = fmul double %514, %569
  store double %570, double* %232, align 8
  %571 = load double, double* %211, align 8
  %572 = load double, double* %172, align 8
  %573 = fadd double %571, %572
  store double %573, double* %302, align 8
  %574 = load double, double* %211, align 8
  %575 = load double, double* %172, align 8
  %576 = fsub double %574, %575
  %577 = fmul double %512, %576
  store double %577, double* %332, align 8
  %578 = load double, double* %198, align 8
  %579 = load double, double* %185, align 8
  %580 = fadd double %578, %579
  store double %580, double* %312, align 8
  %581 = load double, double* %198, align 8
  %582 = load double, double* %185, align 8
  %583 = fsub double %581, %582
  %584 = fmul double %514, %583
  store double %584, double* %322, align 8
  %585 = load double, double* %159, align 8
  %586 = load double, double* %120, align 8
  %587 = fadd double %585, %586
  store double %587, double* %342, align 8
  %588 = load double, double* %120, align 8
  %589 = load double, double* %159, align 8
  %590 = fsub double %588, %589
  %591 = fmul double %512, %590
  store double %591, double* %372, align 8
  %592 = load double, double* %146, align 8
  %593 = load double, double* %133, align 8
  %594 = fadd double %592, %593
  store double %594, double* %352, align 8
  %595 = load double, double* %133, align 8
  %596 = load double, double* %146, align 8
  %597 = fsub double %595, %596
  %598 = fmul double %514, %597
  store double %598, double* %362, align 8
  %599 = load double, double* %107, align 8
  %600 = load double, double* %68, align 8
  %601 = fadd double %599, %600
  store double %601, double* %378, align 8
  %602 = load double, double* %107, align 8
  %603 = load double, double* %68, align 8
  %604 = fsub double %602, %603
  %605 = fmul double %512, %604
  store double %605, double* %348, align 8
  %606 = load double, double* %94, align 8
  %607 = load double, double* %81, align 8
  %608 = fadd double %606, %607
  store double %608, double* %368, align 8
  %609 = load double, double* %94, align 8
  %610 = load double, double* %81, align 8
  %611 = fsub double %609, %610
  %612 = fmul double %514, %611
  store double %612, double* %358, align 8
  %613 = load double, double* %55, align 8
  %614 = load double, double* %16, align 8
  %615 = fadd double %613, %614
  store double %615, double* %338, align 8
  %616 = load double, double* %16, align 8
  %617 = load double, double* %55, align 8
  %618 = fsub double %616, %617
  %619 = fmul double %512, %618
  store double %619, double* %308, align 8
  %620 = load double, double* %42, align 8
  %621 = load double, double* %29, align 8
  %622 = fadd double %620, %621
  store double %622, double* %328, align 8
  %623 = load double, double* %29, align 8
  %624 = load double, double* %42, align 8
  %625 = fsub double %623, %624
  %626 = fmul double %514, %625
  store double %626, double* %318, align 8
  %627 = load double*, double** getelementptr inbounds ([5 x double*], [5 x double*]* @pnts, i64 0, i64 4), align 16
  %628 = load double, double* %627, align 8
  %629 = load double, double* %3, align 8
  %630 = load double, double* %225, align 8
  %631 = fadd double %629, %630
  store double %631, double* %2, align 8
  %632 = load double, double* %3, align 8
  %633 = load double, double* %225, align 8
  %634 = fsub double %632, %633
  %635 = fmul double %628, %634
  store double %635, double* %22, align 8
  %636 = load double, double* %236, align 8
  %637 = load double, double* %247, align 8
  %638 = fadd double %636, %637
  store double %638, double* %35, align 8
  %639 = load double, double* %247, align 8
  %640 = load double, double* %236, align 8
  %641 = fsub double %639, %640
  %642 = fmul double %628, %641
  store double %642, double* %48, align 8
  %643 = fadd double %638, %642
  store double %643, double* %35, align 8
  %644 = load double, double* %258, align 8
  %645 = load double, double* %269, align 8
  %646 = fadd double %644, %645
  store double %646, double* %61, align 8
  %647 = load double, double* %258, align 8
  %648 = load double, double* %269, align 8
  %649 = fsub double %647, %648
  %650 = fmul double %628, %649
  store double %650, double* %74, align 8
  %651 = load double, double* %280, align 8
  %652 = load double, double* %291, align 8
  %653 = fadd double %651, %652
  store double %653, double* %87, align 8
  %654 = load double, double* %291, align 8
  %655 = load double, double* %280, align 8
  %656 = fsub double %654, %655
  %657 = fmul double %628, %656
  store double %657, double* %100, align 8
  %658 = fadd double %653, %657
  %659 = load double, double* %61, align 8
  %660 = fadd double %659, %658
  store double %660, double* %61, align 8
  %661 = load double, double* %74, align 8
  %662 = fadd double %658, %661
  store double %662, double* %87, align 8
  %663 = load double, double* %100, align 8
  %664 = fadd double %661, %663
  store double %664, double* %74, align 8
  %665 = load double, double* %298, align 8
  %666 = load double, double* %287, align 8
  %667 = fadd double %665, %666
  store double %667, double* %113, align 8
  %668 = load double, double* %298, align 8
  %669 = load double, double* %287, align 8
  %670 = fsub double %668, %669
  %671 = fmul double %628, %670
  store double %671, double* %126, align 8
  %672 = load double, double* %276, align 8
  %673 = load double, double* %265, align 8
  %674 = fadd double %672, %673
  store double %674, double* %139, align 8
  %675 = load double, double* %265, align 8
  %676 = load double, double* %276, align 8
  %677 = fsub double %675, %676
  %678 = fmul double %628, %677
  store double %678, double* %152, align 8
  %679 = fadd double %674, %678
  store double %679, double* %139, align 8
  %680 = load double, double* %254, align 8
  %681 = load double, double* %243, align 8
  %682 = fadd double %680, %681
  store double %682, double* %165, align 8
  %683 = load double, double* %254, align 8
  %684 = load double, double* %243, align 8
  %685 = fsub double %683, %684
  %686 = fmul double %628, %685
  store double %686, double* %178, align 8
  %687 = load double, double* %232, align 8
  %688 = load double, double* %221, align 8
  %689 = fadd double %687, %688
  store double %689, double* %191, align 8
  %690 = load double, double* %221, align 8
  %691 = load double, double* %232, align 8
  %692 = fsub double %690, %691
  %693 = fmul double %628, %692
  store double %693, double* %204, align 8
  %694 = fadd double %689, %693
  %695 = load double, double* %165, align 8
  %696 = fadd double %695, %694
  store double %696, double* %165, align 8
  %697 = load double, double* %178, align 8
  %698 = fadd double %694, %697
  store double %698, double* %191, align 8
  %699 = load double, double* %204, align 8
  %700 = fadd double %697, %699
  store double %700, double* %178, align 8
  %701 = load double, double* %302, align 8
  %702 = load double, double* %312, align 8
  %703 = fadd double %701, %702
  store double %703, double* %211, align 8
  %704 = load double, double* %302, align 8
  %705 = load double, double* %312, align 8
  %706 = fsub double %704, %705
  %707 = fmul double %628, %706
  store double %707, double* %198, align 8
  %708 = load double, double* %322, align 8
  %709 = load double, double* %332, align 8
  %710 = fadd double %708, %709
  store double %710, double* %185, align 8
  %711 = load double, double* %332, align 8
  %712 = load double, double* %322, align 8
  %713 = fsub double %711, %712
  %714 = fmul double %628, %713
  store double %714, double* %172, align 8
  %715 = fadd double %710, %714
  store double %715, double* %185, align 8
  %716 = load double, double* %342, align 8
  %717 = load double, double* %352, align 8
  %718 = fadd double %716, %717
  store double %718, double* %159, align 8
  %719 = load double, double* %342, align 8
  %720 = load double, double* %352, align 8
  %721 = fsub double %719, %720
  %722 = fmul double %628, %721
  store double %722, double* %146, align 8
  %723 = load double, double* %362, align 8
  %724 = load double, double* %372, align 8
  %725 = fadd double %723, %724
  store double %725, double* %133, align 8
  %726 = load double, double* %372, align 8
  %727 = load double, double* %362, align 8
  %728 = fsub double %726, %727
  %729 = fmul double %628, %728
  store double %729, double* %120, align 8
  %730 = fadd double %725, %729
  %731 = load double, double* %159, align 8
  %732 = fadd double %731, %730
  store double %732, double* %159, align 8
  %733 = load double, double* %146, align 8
  %734 = fadd double %730, %733
  store double %734, double* %133, align 8
  %735 = load double, double* %120, align 8
  %736 = fadd double %733, %735
  store double %736, double* %146, align 8
  %737 = load double, double* %378, align 8
  %738 = load double, double* %368, align 8
  %739 = fadd double %737, %738
  store double %739, double* %107, align 8
  %740 = load double, double* %378, align 8
  %741 = load double, double* %368, align 8
  %742 = fsub double %740, %741
  %743 = fmul double %628, %742
  store double %743, double* %94, align 8
  %744 = load double, double* %358, align 8
  %745 = load double, double* %348, align 8
  %746 = fadd double %744, %745
  store double %746, double* %81, align 8
  %747 = load double, double* %348, align 8
  %748 = load double, double* %358, align 8
  %749 = fsub double %747, %748
  %750 = fmul double %628, %749
  store double %750, double* %68, align 8
  %751 = fadd double %746, %750
  store double %751, double* %81, align 8
  %752 = load double, double* %338, align 8
  %753 = load double, double* %328, align 8
  %754 = fadd double %752, %753
  store double %754, double* %55, align 8
  %755 = load double, double* %338, align 8
  %756 = load double, double* %328, align 8
  %757 = fsub double %755, %756
  %758 = fmul double %628, %757
  store double %758, double* %42, align 8
  %759 = load double, double* %318, align 8
  %760 = load double, double* %308, align 8
  %761 = fadd double %759, %760
  store double %761, double* %29, align 8
  %762 = load double, double* %308, align 8
  %763 = load double, double* %318, align 8
  %764 = fsub double %762, %763
  %765 = fmul double %628, %764
  store double %765, double* %16, align 8
  %766 = fadd double %761, %765
  %767 = load double, double* %55, align 8
  %768 = fadd double %767, %766
  store double %768, double* %55, align 8
  %769 = load double, double* %42, align 8
  %770 = fadd double %766, %769
  store double %770, double* %29, align 8
  %771 = load double, double* %16, align 8
  %772 = fadd double %769, %771
  store double %772, double* %42, align 8
  %773 = bitcast double* %2 to i64*
  %774 = load i64, i64* %773, align 8
  %775 = getelementptr inbounds double, double* %0, i64 256
  %776 = bitcast double* %775 to i64*
  store i64 %774, i64* %776, align 8
  %777 = bitcast double* %61 to i64*
  %778 = load i64, i64* %777, align 8
  %779 = getelementptr inbounds double, double* %0, i64 192
  %780 = bitcast double* %779 to i64*
  store i64 %778, i64* %780, align 8
  %781 = bitcast double* %35 to i64*
  %782 = load i64, i64* %781, align 8
  %783 = getelementptr inbounds double, double* %0, i64 128
  %784 = bitcast double* %783 to i64*
  store i64 %782, i64* %784, align 8
  %785 = bitcast double* %87 to i64*
  %786 = load i64, i64* %785, align 8
  %787 = getelementptr inbounds double, double* %0, i64 64
  %788 = bitcast double* %787 to i64*
  store i64 %786, i64* %788, align 8
  %789 = bitcast double* %22 to i64*
  %790 = load i64, i64* %789, align 8
  %791 = bitcast double* %0 to i64*
  store i64 %790, i64* %791, align 8
  %792 = load i64, i64* %789, align 8
  %793 = bitcast double* %1 to i64*
  store i64 %792, i64* %793, align 8
  %794 = bitcast double* %74 to i64*
  %795 = load i64, i64* %794, align 8
  %796 = getelementptr inbounds double, double* %1, i64 64
  %797 = bitcast double* %796 to i64*
  store i64 %795, i64* %797, align 8
  %798 = bitcast double* %48 to i64*
  %799 = load i64, i64* %798, align 8
  %800 = getelementptr inbounds double, double* %1, i64 128
  %801 = bitcast double* %800 to i64*
  store i64 %799, i64* %801, align 8
  %802 = bitcast double* %100 to i64*
  %803 = load i64, i64* %802, align 8
  %804 = getelementptr inbounds double, double* %1, i64 192
  %805 = bitcast double* %804 to i64*
  store i64 %803, i64* %805, align 8
  %806 = load double, double* %165, align 8
  %807 = load double, double* %113, align 8
  %808 = fadd double %806, %807
  store double %808, double* %113, align 8
  %809 = getelementptr inbounds double, double* %0, i64 224
  store double %808, double* %809, align 8
  %810 = load double, double* %139, align 8
  %811 = load double, double* %165, align 8
  %812 = fadd double %810, %811
  store double %812, double* %165, align 8
  %813 = getelementptr inbounds double, double* %0, i64 160
  store double %812, double* %813, align 8
  %814 = load double, double* %191, align 8
  %815 = load double, double* %139, align 8
  %816 = fadd double %814, %815
  store double %816, double* %139, align 8
  %817 = getelementptr inbounds double, double* %0, i64 96
  store double %816, double* %817, align 8
  %818 = load double, double* %126, align 8
  %819 = load double, double* %191, align 8
  %820 = fadd double %818, %819
  store double %820, double* %191, align 8
  %821 = getelementptr inbounds double, double* %0, i64 32
  store double %820, double* %821, align 8
  %822 = load double, double* %178, align 8
  %823 = load double, double* %126, align 8
  %824 = fadd double %822, %823
  store double %824, double* %126, align 8
  %825 = getelementptr inbounds double, double* %1, i64 32
  store double %824, double* %825, align 8
  %826 = load double, double* %152, align 8
  %827 = load double, double* %178, align 8
  %828 = fadd double %826, %827
  store double %828, double* %178, align 8
  %829 = getelementptr inbounds double, double* %1, i64 96
  store double %828, double* %829, align 8
  %830 = load double, double* %204, align 8
  %831 = load double, double* %152, align 8
  %832 = fadd double %830, %831
  store double %832, double* %152, align 8
  %833 = getelementptr inbounds double, double* %1, i64 160
  store double %832, double* %833, align 8
  %834 = bitcast double* %204 to i64*
  %835 = load i64, i64* %834, align 8
  %836 = getelementptr inbounds double, double* %1, i64 224
  %837 = bitcast double* %836 to i64*
  store i64 %835, i64* %837, align 8
  %838 = load double, double* %55, align 8
  %839 = load double, double* %107, align 8
  %840 = fadd double %838, %839
  store double %840, double* %107, align 8
  %841 = load double, double* %211, align 8
  %842 = fadd double %840, %841
  %843 = getelementptr inbounds double, double* %0, i64 240
  store double %842, double* %843, align 8
  %844 = load double, double* %107, align 8
  %845 = load double, double* %159, align 8
  %846 = fadd double %844, %845
  %847 = getelementptr inbounds double, double* %0, i64 208
  store double %846, double* %847, align 8
  %848 = load double, double* %81, align 8
  %849 = load double, double* %55, align 8
  %850 = fadd double %848, %849
  store double %850, double* %55, align 8
  %851 = load double, double* %159, align 8
  %852 = fadd double %850, %851
  %853 = getelementptr inbounds double, double* %0, i64 176
  store double %852, double* %853, align 8
  %854 = load double, double* %55, align 8
  %855 = load double, double* %185, align 8
  %856 = fadd double %854, %855
  %857 = getelementptr inbounds double, double* %0, i64 144
  store double %856, double* %857, align 8
  %858 = load double, double* %29, align 8
  %859 = load double, double* %81, align 8
  %860 = fadd double %858, %859
  store double %860, double* %81, align 8
  %861 = load double, double* %185, align 8
  %862 = fadd double %860, %861
  %863 = getelementptr inbounds double, double* %0, i64 112
  store double %862, double* %863, align 8
  %864 = load double, double* %81, align 8
  %865 = load double, double* %133, align 8
  %866 = fadd double %864, %865
  %867 = getelementptr inbounds double, double* %0, i64 80
  store double %866, double* %867, align 8
  %868 = load double, double* %94, align 8
  %869 = load double, double* %29, align 8
  %870 = fadd double %868, %869
  store double %870, double* %29, align 8
  %871 = load double, double* %133, align 8
  %872 = fadd double %870, %871
  %873 = getelementptr inbounds double, double* %0, i64 48
  store double %872, double* %873, align 8
  %874 = load double, double* %29, align 8
  %875 = load double, double* %198, align 8
  %876 = fadd double %874, %875
  %877 = getelementptr inbounds double, double* %0, i64 16
  store double %876, double* %877, align 8
  %878 = load double, double* %42, align 8
  %879 = load double, double* %94, align 8
  %880 = fadd double %878, %879
  store double %880, double* %94, align 8
  %881 = load double, double* %198, align 8
  %882 = fadd double %880, %881
  %883 = getelementptr inbounds double, double* %1, i64 16
  store double %882, double* %883, align 8
  %884 = load double, double* %94, align 8
  %885 = load double, double* %146, align 8
  %886 = fadd double %884, %885
  %887 = getelementptr inbounds double, double* %1, i64 48
  store double %886, double* %887, align 8
  %888 = load double, double* %68, align 8
  %889 = load double, double* %42, align 8
  %890 = fadd double %888, %889
  store double %890, double* %42, align 8
  %891 = load double, double* %146, align 8
  %892 = fadd double %890, %891
  %893 = getelementptr inbounds double, double* %1, i64 80
  store double %892, double* %893, align 8
  %894 = load double, double* %42, align 8
  %895 = load double, double* %172, align 8
  %896 = fadd double %894, %895
  %897 = getelementptr inbounds double, double* %1, i64 112
  store double %896, double* %897, align 8
  %898 = load double, double* %16, align 8
  %899 = load double, double* %68, align 8
  %900 = fadd double %898, %899
  store double %900, double* %68, align 8
  %901 = load double, double* %172, align 8
  %902 = fadd double %900, %901
  %903 = getelementptr inbounds double, double* %1, i64 144
  store double %902, double* %903, align 8
  %904 = load double, double* %68, align 8
  %905 = load double, double* %120, align 8
  %906 = fadd double %904, %905
  %907 = getelementptr inbounds double, double* %1, i64 176
  store double %906, double* %907, align 8
  %908 = load double, double* %120, align 8
  %909 = load double, double* %16, align 8
  %910 = fadd double %908, %909
  %911 = getelementptr inbounds double, double* %1, i64 208
  store double %910, double* %911, align 8
  %912 = bitcast double* %16 to i64*
  %913 = load i64, i64* %912, align 8
  %914 = getelementptr inbounds double, double* %1, i64 240
  %915 = bitcast double* %914 to i64*
  store i64 %913, i64* %915, align 8
  ret void
}

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
