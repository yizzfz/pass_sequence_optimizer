; ModuleID = 'gsm_decode.ll'
source_filename = "gsm_decode.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

; Function Attrs: noinline nounwind uwtable
define i32 @gsm_decode(%struct.gsm_state*, i8* readonly, i16*) local_unnamed_addr #0 {
  %4 = alloca [8 x i16], align 16
  %5 = alloca [4 x i16], align 2
  %6 = alloca [4 x i16], align 2
  %7 = alloca [4 x i16], align 2
  %8 = alloca [4 x i16], align 2
  %9 = alloca [52 x i16], align 16
  %10 = load i8, i8* %1, align 1
  %11 = and i8 %10, -16
  %12 = icmp eq i8 %11, -48
  br i1 %12, label %13, label %445

; <label>:13:                                     ; preds = %3
  %14 = getelementptr inbounds i8, i8* %1, i64 1
  %15 = shl i8 %10, 2
  %16 = and i8 %15, 60
  %17 = zext i8 %16 to i16
  %18 = getelementptr inbounds [8 x i16], [8 x i16]* %4, i64 0, i64 0
  %19 = load i8, i8* %14, align 1
  %20 = zext i8 %19 to i16
  %21 = lshr i16 %20, 6
  %22 = or i16 %21, %17
  store i16 %22, i16* %18, align 16
  %23 = getelementptr inbounds i8, i8* %1, i64 2
  %24 = and i8 %19, 63
  %25 = zext i8 %24 to i16
  %26 = getelementptr inbounds [8 x i16], [8 x i16]* %4, i64 0, i64 1
  store i16 %25, i16* %26, align 2
  %27 = load i8, i8* %23, align 1
  %28 = zext i8 %27 to i16
  %29 = lshr i16 %28, 3
  %30 = getelementptr inbounds [8 x i16], [8 x i16]* %4, i64 0, i64 2
  store i16 %29, i16* %30, align 4
  %31 = getelementptr inbounds i8, i8* %1, i64 3
  %32 = shl i8 %27, 2
  %33 = and i8 %32, 28
  %34 = zext i8 %33 to i16
  %35 = getelementptr inbounds [8 x i16], [8 x i16]* %4, i64 0, i64 3
  %36 = load i8, i8* %31, align 1
  %37 = zext i8 %36 to i16
  %38 = lshr i16 %37, 6
  %39 = or i16 %38, %34
  store i16 %39, i16* %35, align 2
  %40 = zext i8 %36 to i16
  %41 = lshr i16 %40, 2
  %42 = and i16 %41, 15
  %43 = getelementptr inbounds [8 x i16], [8 x i16]* %4, i64 0, i64 4
  store i16 %42, i16* %43, align 8
  %44 = getelementptr inbounds i8, i8* %1, i64 4
  %45 = load i8, i8* %31, align 1
  %46 = shl i8 %45, 2
  %47 = and i8 %46, 12
  %48 = zext i8 %47 to i16
  %49 = getelementptr inbounds [8 x i16], [8 x i16]* %4, i64 0, i64 5
  %50 = load i8, i8* %44, align 1
  %51 = zext i8 %50 to i16
  %52 = lshr i16 %51, 6
  %53 = or i16 %52, %48
  store i16 %53, i16* %49, align 2
  %54 = zext i8 %50 to i16
  %55 = lshr i16 %54, 3
  %56 = and i16 %55, 7
  %57 = getelementptr inbounds [8 x i16], [8 x i16]* %4, i64 0, i64 6
  store i16 %56, i16* %57, align 4
  %58 = getelementptr inbounds i8, i8* %1, i64 5
  %59 = load i8, i8* %44, align 1
  %60 = and i8 %59, 7
  %61 = zext i8 %60 to i16
  %62 = getelementptr inbounds [8 x i16], [8 x i16]* %4, i64 0, i64 7
  store i16 %61, i16* %62, align 2
  %63 = load i8, i8* %58, align 1
  %64 = zext i8 %63 to i16
  %65 = lshr i16 %64, 1
  %66 = getelementptr inbounds [4 x i16], [4 x i16]* %5, i64 0, i64 0
  store i16 %65, i16* %66, align 2
  %67 = getelementptr inbounds i8, i8* %1, i64 6
  %68 = shl i8 %63, 1
  %69 = and i8 %68, 2
  %70 = zext i8 %69 to i16
  %71 = getelementptr inbounds [4 x i16], [4 x i16]* %7, i64 0, i64 0
  %72 = load i8, i8* %67, align 1
  %73 = zext i8 %72 to i16
  %74 = lshr i16 %73, 7
  %75 = or i16 %74, %70
  store i16 %75, i16* %71, align 2
  %76 = zext i8 %72 to i16
  %77 = lshr i16 %76, 5
  %78 = and i16 %77, 3
  %79 = getelementptr inbounds [4 x i16], [4 x i16]* %6, i64 0, i64 0
  store i16 %78, i16* %79, align 2
  %80 = getelementptr inbounds i8, i8* %1, i64 7
  %81 = load i8, i8* %67, align 1
  %82 = shl i8 %81, 1
  %83 = and i8 %82, 62
  %84 = zext i8 %83 to i16
  %85 = getelementptr inbounds [4 x i16], [4 x i16]* %8, i64 0, i64 0
  %86 = load i8, i8* %80, align 1
  %87 = zext i8 %86 to i16
  %88 = lshr i16 %87, 7
  %89 = or i16 %88, %84
  store i16 %89, i16* %85, align 2
  %90 = zext i8 %86 to i16
  %91 = lshr i16 %90, 4
  %92 = and i16 %91, 7
  %93 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 0
  store i16 %92, i16* %93, align 16
  %94 = lshr i16 %90, 1
  %95 = and i16 %94, 7
  %96 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 1
  store i16 %95, i16* %96, align 2
  %97 = getelementptr inbounds i8, i8* %1, i64 8
  %98 = load i8, i8* %80, align 1
  %99 = shl i8 %98, 2
  %100 = and i8 %99, 4
  %101 = zext i8 %100 to i16
  %102 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 2
  %103 = load i8, i8* %97, align 1
  %104 = zext i8 %103 to i16
  %105 = lshr i16 %104, 6
  %106 = or i16 %105, %101
  store i16 %106, i16* %102, align 4
  %107 = zext i8 %103 to i16
  %108 = lshr i16 %107, 3
  %109 = and i16 %108, 7
  %110 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 3
  store i16 %109, i16* %110, align 2
  %111 = getelementptr inbounds i8, i8* %1, i64 9
  %112 = load i8, i8* %97, align 1
  %113 = and i8 %112, 7
  %114 = zext i8 %113 to i16
  %115 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 4
  store i16 %114, i16* %115, align 8
  %116 = load i8, i8* %111, align 1
  %117 = zext i8 %116 to i16
  %118 = lshr i16 %117, 5
  %119 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 5
  store i16 %118, i16* %119, align 2
  %120 = lshr i16 %117, 2
  %121 = and i16 %120, 7
  %122 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 6
  store i16 %121, i16* %122, align 4
  %123 = getelementptr inbounds i8, i8* %1, i64 10
  %124 = load i8, i8* %111, align 1
  %125 = shl i8 %124, 1
  %126 = and i8 %125, 6
  %127 = zext i8 %126 to i16
  %128 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 7
  %129 = load i8, i8* %123, align 1
  %130 = zext i8 %129 to i16
  %131 = lshr i16 %130, 7
  %132 = or i16 %131, %127
  store i16 %132, i16* %128, align 2
  %133 = zext i8 %129 to i16
  %134 = lshr i16 %133, 4
  %135 = and i16 %134, 7
  %136 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 8
  store i16 %135, i16* %136, align 16
  %137 = lshr i16 %133, 1
  %138 = and i16 %137, 7
  %139 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 9
  store i16 %138, i16* %139, align 2
  %140 = getelementptr inbounds i8, i8* %1, i64 11
  %141 = load i8, i8* %123, align 1
  %142 = shl i8 %141, 2
  %143 = and i8 %142, 4
  %144 = zext i8 %143 to i16
  %145 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 10
  %146 = load i8, i8* %140, align 1
  %147 = zext i8 %146 to i16
  %148 = lshr i16 %147, 6
  %149 = or i16 %148, %144
  store i16 %149, i16* %145, align 4
  %150 = zext i8 %146 to i16
  %151 = lshr i16 %150, 3
  %152 = and i16 %151, 7
  %153 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 11
  store i16 %152, i16* %153, align 2
  %154 = getelementptr inbounds i8, i8* %1, i64 12
  %155 = load i8, i8* %140, align 1
  %156 = and i8 %155, 7
  %157 = zext i8 %156 to i16
  %158 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 12
  store i16 %157, i16* %158, align 8
  %159 = load i8, i8* %154, align 1
  %160 = zext i8 %159 to i16
  %161 = lshr i16 %160, 1
  %162 = getelementptr inbounds [4 x i16], [4 x i16]* %5, i64 0, i64 1
  store i16 %161, i16* %162, align 2
  %163 = getelementptr inbounds i8, i8* %1, i64 13
  %164 = shl i8 %159, 1
  %165 = and i8 %164, 2
  %166 = zext i8 %165 to i16
  %167 = getelementptr inbounds [4 x i16], [4 x i16]* %7, i64 0, i64 1
  %168 = load i8, i8* %163, align 1
  %169 = zext i8 %168 to i16
  %170 = lshr i16 %169, 7
  %171 = or i16 %170, %166
  store i16 %171, i16* %167, align 2
  %172 = zext i8 %168 to i16
  %173 = lshr i16 %172, 5
  %174 = and i16 %173, 3
  %175 = getelementptr inbounds [4 x i16], [4 x i16]* %6, i64 0, i64 1
  store i16 %174, i16* %175, align 2
  %176 = getelementptr inbounds i8, i8* %1, i64 14
  %177 = load i8, i8* %163, align 1
  %178 = shl i8 %177, 1
  %179 = and i8 %178, 62
  %180 = zext i8 %179 to i16
  %181 = getelementptr inbounds [4 x i16], [4 x i16]* %8, i64 0, i64 1
  %182 = load i8, i8* %176, align 1
  %183 = zext i8 %182 to i16
  %184 = lshr i16 %183, 7
  %185 = or i16 %184, %180
  store i16 %185, i16* %181, align 2
  %186 = zext i8 %182 to i16
  %187 = lshr i16 %186, 4
  %188 = and i16 %187, 7
  %189 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 13
  store i16 %188, i16* %189, align 2
  %190 = lshr i16 %186, 1
  %191 = and i16 %190, 7
  %192 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 14
  store i16 %191, i16* %192, align 4
  %193 = getelementptr inbounds i8, i8* %1, i64 15
  %194 = load i8, i8* %176, align 1
  %195 = shl i8 %194, 2
  %196 = and i8 %195, 4
  %197 = zext i8 %196 to i16
  %198 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 15
  %199 = load i8, i8* %193, align 1
  %200 = zext i8 %199 to i16
  %201 = lshr i16 %200, 6
  %202 = or i16 %201, %197
  store i16 %202, i16* %198, align 2
  %203 = zext i8 %199 to i16
  %204 = lshr i16 %203, 3
  %205 = and i16 %204, 7
  %206 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 16
  store i16 %205, i16* %206, align 16
  %207 = getelementptr inbounds i8, i8* %1, i64 16
  %208 = load i8, i8* %193, align 1
  %209 = and i8 %208, 7
  %210 = zext i8 %209 to i16
  %211 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 17
  store i16 %210, i16* %211, align 2
  %212 = load i8, i8* %207, align 1
  %213 = zext i8 %212 to i16
  %214 = lshr i16 %213, 5
  %215 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 18
  store i16 %214, i16* %215, align 4
  %216 = lshr i16 %213, 2
  %217 = and i16 %216, 7
  %218 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 19
  store i16 %217, i16* %218, align 2
  %219 = getelementptr inbounds i8, i8* %1, i64 17
  %220 = load i8, i8* %207, align 1
  %221 = shl i8 %220, 1
  %222 = and i8 %221, 6
  %223 = zext i8 %222 to i16
  %224 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 20
  %225 = load i8, i8* %219, align 1
  %226 = zext i8 %225 to i16
  %227 = lshr i16 %226, 7
  %228 = or i16 %227, %223
  store i16 %228, i16* %224, align 8
  %229 = zext i8 %225 to i16
  %230 = lshr i16 %229, 4
  %231 = and i16 %230, 7
  %232 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 21
  store i16 %231, i16* %232, align 2
  %233 = lshr i16 %229, 1
  %234 = and i16 %233, 7
  %235 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 22
  store i16 %234, i16* %235, align 4
  %236 = getelementptr inbounds i8, i8* %1, i64 18
  %237 = load i8, i8* %219, align 1
  %238 = shl i8 %237, 2
  %239 = and i8 %238, 4
  %240 = zext i8 %239 to i16
  %241 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 23
  %242 = load i8, i8* %236, align 1
  %243 = zext i8 %242 to i16
  %244 = lshr i16 %243, 6
  %245 = or i16 %244, %240
  store i16 %245, i16* %241, align 2
  %246 = zext i8 %242 to i16
  %247 = lshr i16 %246, 3
  %248 = and i16 %247, 7
  %249 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 24
  store i16 %248, i16* %249, align 16
  %250 = getelementptr inbounds i8, i8* %1, i64 19
  %251 = load i8, i8* %236, align 1
  %252 = and i8 %251, 7
  %253 = zext i8 %252 to i16
  %254 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 25
  store i16 %253, i16* %254, align 2
  %255 = load i8, i8* %250, align 1
  %256 = zext i8 %255 to i16
  %257 = lshr i16 %256, 1
  %258 = getelementptr inbounds [4 x i16], [4 x i16]* %5, i64 0, i64 2
  store i16 %257, i16* %258, align 2
  %259 = getelementptr inbounds i8, i8* %1, i64 20
  %260 = shl i8 %255, 1
  %261 = and i8 %260, 2
  %262 = zext i8 %261 to i16
  %263 = getelementptr inbounds [4 x i16], [4 x i16]* %7, i64 0, i64 2
  %264 = load i8, i8* %259, align 1
  %265 = zext i8 %264 to i16
  %266 = lshr i16 %265, 7
  %267 = or i16 %266, %262
  store i16 %267, i16* %263, align 2
  %268 = zext i8 %264 to i16
  %269 = lshr i16 %268, 5
  %270 = and i16 %269, 3
  %271 = getelementptr inbounds [4 x i16], [4 x i16]* %6, i64 0, i64 2
  store i16 %270, i16* %271, align 2
  %272 = getelementptr inbounds i8, i8* %1, i64 21
  %273 = load i8, i8* %259, align 1
  %274 = shl i8 %273, 1
  %275 = and i8 %274, 62
  %276 = zext i8 %275 to i16
  %277 = getelementptr inbounds [4 x i16], [4 x i16]* %8, i64 0, i64 2
  %278 = load i8, i8* %272, align 1
  %279 = zext i8 %278 to i16
  %280 = lshr i16 %279, 7
  %281 = or i16 %280, %276
  store i16 %281, i16* %277, align 2
  %282 = zext i8 %278 to i16
  %283 = lshr i16 %282, 4
  %284 = and i16 %283, 7
  %285 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 26
  store i16 %284, i16* %285, align 4
  %286 = lshr i16 %282, 1
  %287 = and i16 %286, 7
  %288 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 27
  store i16 %287, i16* %288, align 2
  %289 = getelementptr inbounds i8, i8* %1, i64 22
  %290 = load i8, i8* %272, align 1
  %291 = shl i8 %290, 2
  %292 = and i8 %291, 4
  %293 = zext i8 %292 to i16
  %294 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 28
  %295 = load i8, i8* %289, align 1
  %296 = zext i8 %295 to i16
  %297 = lshr i16 %296, 6
  %298 = or i16 %297, %293
  store i16 %298, i16* %294, align 8
  %299 = zext i8 %295 to i16
  %300 = lshr i16 %299, 3
  %301 = and i16 %300, 7
  %302 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 29
  store i16 %301, i16* %302, align 2
  %303 = getelementptr inbounds i8, i8* %1, i64 23
  %304 = load i8, i8* %289, align 1
  %305 = and i8 %304, 7
  %306 = zext i8 %305 to i16
  %307 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 30
  store i16 %306, i16* %307, align 4
  %308 = load i8, i8* %303, align 1
  %309 = zext i8 %308 to i16
  %310 = lshr i16 %309, 5
  %311 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 31
  store i16 %310, i16* %311, align 2
  %312 = lshr i16 %309, 2
  %313 = and i16 %312, 7
  %314 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 32
  store i16 %313, i16* %314, align 16
  %315 = getelementptr inbounds i8, i8* %1, i64 24
  %316 = load i8, i8* %303, align 1
  %317 = shl i8 %316, 1
  %318 = and i8 %317, 6
  %319 = zext i8 %318 to i16
  %320 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 33
  %321 = load i8, i8* %315, align 1
  %322 = zext i8 %321 to i16
  %323 = lshr i16 %322, 7
  %324 = or i16 %323, %319
  store i16 %324, i16* %320, align 2
  %325 = zext i8 %321 to i16
  %326 = lshr i16 %325, 4
  %327 = and i16 %326, 7
  %328 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 34
  store i16 %327, i16* %328, align 4
  %329 = lshr i16 %325, 1
  %330 = and i16 %329, 7
  %331 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 35
  store i16 %330, i16* %331, align 2
  %332 = getelementptr inbounds i8, i8* %1, i64 25
  %333 = load i8, i8* %315, align 1
  %334 = shl i8 %333, 2
  %335 = and i8 %334, 4
  %336 = zext i8 %335 to i16
  %337 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 36
  %338 = load i8, i8* %332, align 1
  %339 = zext i8 %338 to i16
  %340 = lshr i16 %339, 6
  %341 = or i16 %340, %336
  store i16 %341, i16* %337, align 8
  %342 = zext i8 %338 to i16
  %343 = lshr i16 %342, 3
  %344 = and i16 %343, 7
  %345 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 37
  store i16 %344, i16* %345, align 2
  %346 = getelementptr inbounds i8, i8* %1, i64 26
  %347 = load i8, i8* %332, align 1
  %348 = and i8 %347, 7
  %349 = zext i8 %348 to i16
  %350 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 38
  store i16 %349, i16* %350, align 4
  %351 = load i8, i8* %346, align 1
  %352 = zext i8 %351 to i16
  %353 = lshr i16 %352, 1
  %354 = getelementptr inbounds [4 x i16], [4 x i16]* %5, i64 0, i64 3
  store i16 %353, i16* %354, align 2
  %355 = getelementptr inbounds i8, i8* %1, i64 27
  %356 = shl i8 %351, 1
  %357 = and i8 %356, 2
  %358 = zext i8 %357 to i16
  %359 = getelementptr inbounds [4 x i16], [4 x i16]* %7, i64 0, i64 3
  %360 = load i8, i8* %355, align 1
  %361 = zext i8 %360 to i16
  %362 = lshr i16 %361, 7
  %363 = or i16 %362, %358
  store i16 %363, i16* %359, align 2
  %364 = zext i8 %360 to i16
  %365 = lshr i16 %364, 5
  %366 = and i16 %365, 3
  %367 = getelementptr inbounds [4 x i16], [4 x i16]* %6, i64 0, i64 3
  store i16 %366, i16* %367, align 2
  %368 = getelementptr inbounds i8, i8* %1, i64 28
  %369 = load i8, i8* %355, align 1
  %370 = shl i8 %369, 1
  %371 = and i8 %370, 62
  %372 = zext i8 %371 to i16
  %373 = getelementptr inbounds [4 x i16], [4 x i16]* %8, i64 0, i64 3
  %374 = load i8, i8* %368, align 1
  %375 = zext i8 %374 to i16
  %376 = lshr i16 %375, 7
  %377 = or i16 %376, %372
  store i16 %377, i16* %373, align 2
  %378 = zext i8 %374 to i16
  %379 = lshr i16 %378, 4
  %380 = and i16 %379, 7
  %381 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 39
  store i16 %380, i16* %381, align 2
  %382 = lshr i16 %378, 1
  %383 = and i16 %382, 7
  %384 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 40
  store i16 %383, i16* %384, align 16
  %385 = getelementptr inbounds i8, i8* %1, i64 29
  %386 = load i8, i8* %368, align 1
  %387 = shl i8 %386, 2
  %388 = and i8 %387, 4
  %389 = zext i8 %388 to i16
  %390 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 41
  %391 = load i8, i8* %385, align 1
  %392 = zext i8 %391 to i16
  %393 = lshr i16 %392, 6
  %394 = or i16 %393, %389
  store i16 %394, i16* %390, align 2
  %395 = zext i8 %391 to i16
  %396 = lshr i16 %395, 3
  %397 = and i16 %396, 7
  %398 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 42
  store i16 %397, i16* %398, align 4
  %399 = getelementptr inbounds i8, i8* %1, i64 30
  %400 = load i8, i8* %385, align 1
  %401 = and i8 %400, 7
  %402 = zext i8 %401 to i16
  %403 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 43
  store i16 %402, i16* %403, align 2
  %404 = load i8, i8* %399, align 1
  %405 = zext i8 %404 to i16
  %406 = lshr i16 %405, 5
  %407 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 44
  store i16 %406, i16* %407, align 8
  %408 = lshr i16 %405, 2
  %409 = and i16 %408, 7
  %410 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 45
  store i16 %409, i16* %410, align 2
  %411 = getelementptr inbounds i8, i8* %1, i64 31
  %412 = load i8, i8* %399, align 1
  %413 = shl i8 %412, 1
  %414 = and i8 %413, 6
  %415 = zext i8 %414 to i16
  %416 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 46
  %417 = load i8, i8* %411, align 1
  %418 = zext i8 %417 to i16
  %419 = lshr i16 %418, 7
  %420 = or i16 %419, %415
  store i16 %420, i16* %416, align 4
  %421 = zext i8 %417 to i16
  %422 = lshr i16 %421, 4
  %423 = and i16 %422, 7
  %424 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 47
  store i16 %423, i16* %424, align 2
  %425 = lshr i16 %421, 1
  %426 = and i16 %425, 7
  %427 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 48
  store i16 %426, i16* %427, align 16
  %428 = getelementptr inbounds i8, i8* %1, i64 32
  %429 = load i8, i8* %411, align 1
  %430 = shl i8 %429, 2
  %431 = and i8 %430, 4
  %432 = zext i8 %431 to i16
  %433 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 49
  %434 = load i8, i8* %428, align 1
  %435 = zext i8 %434 to i16
  %436 = lshr i16 %435, 6
  %437 = or i16 %436, %432
  store i16 %437, i16* %433, align 2
  %438 = zext i8 %434 to i16
  %439 = lshr i16 %438, 3
  %440 = and i16 %439, 7
  %441 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 50
  store i16 %440, i16* %441, align 4
  %442 = and i8 %434, 7
  %443 = zext i8 %442 to i16
  %444 = getelementptr inbounds [52 x i16], [52 x i16]* %9, i64 0, i64 51
  store i16 %443, i16* %444, align 2
  call void @Gsm_Decoder(%struct.gsm_state* %0, i16* nonnull %18, i16* nonnull %66, i16* nonnull %71, i16* nonnull %79, i16* nonnull %85, i16* nonnull %93, i16* %2) #2
  br label %445

; <label>:445:                                    ; preds = %3, %13
  %.0 = phi i32 [ 0, %13 ], [ -1, %3 ]
  ret i32 %.0
}

declare void @Gsm_Decoder(%struct.gsm_state*, i16*, i16*, i16*, i16*, i16*, i16*, i16*) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
