; ModuleID = 'gsm_implode.2.ll'
source_filename = "gsm_implode.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_gsm_implode = private constant [11 x i8] c"gsm_implode"
@__profc_gsm_implode = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_implode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3847471586543699978, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_gsm_implode, i32 0, i32 0), i8* bitcast (void (%struct.gsm_state*, i16*, i8*)* @gsm_implode to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [13 x i8] c"\0B\00gsm_implode", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_implode to i8*), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @gsm_implode(%struct.gsm_state*, i16*, i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_gsm_implode, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_gsm_implode, i64 0, i64 0)
  %5 = alloca %struct.gsm_state*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i8*, align 8
  store %struct.gsm_state* %0, %struct.gsm_state** %5, align 8
  store i16* %1, i16** %6, align 8
  store i8* %2, i8** %7, align 8
  %8 = load i16*, i16** %6, align 8
  %9 = getelementptr inbounds i16, i16* %8, i64 0
  %10 = load i16, i16* %9, align 2
  %11 = sext i16 %10 to i32
  %12 = ashr i32 %11, 2
  %13 = and i32 %12, 15
  %14 = or i32 208, %13
  %15 = trunc i32 %14 to i8
  %16 = load i8*, i8** %7, align 8
  %17 = getelementptr inbounds i8, i8* %16, i32 1
  store i8* %17, i8** %7, align 8
  store i8 %15, i8* %16, align 1
  %18 = load i16*, i16** %6, align 8
  %19 = getelementptr inbounds i16, i16* %18, i64 0
  %20 = load i16, i16* %19, align 2
  %21 = sext i16 %20 to i32
  %22 = and i32 %21, 3
  %23 = shl i32 %22, 6
  %24 = load i16*, i16** %6, align 8
  %25 = getelementptr inbounds i16, i16* %24, i64 1
  %26 = load i16, i16* %25, align 2
  %27 = sext i16 %26 to i32
  %28 = and i32 %27, 63
  %29 = or i32 %23, %28
  %30 = trunc i32 %29 to i8
  %31 = load i8*, i8** %7, align 8
  %32 = getelementptr inbounds i8, i8* %31, i32 1
  store i8* %32, i8** %7, align 8
  store i8 %30, i8* %31, align 1
  %33 = load i16*, i16** %6, align 8
  %34 = getelementptr inbounds i16, i16* %33, i64 2
  %35 = load i16, i16* %34, align 2
  %36 = sext i16 %35 to i32
  %37 = and i32 %36, 31
  %38 = shl i32 %37, 3
  %39 = load i16*, i16** %6, align 8
  %40 = getelementptr inbounds i16, i16* %39, i64 3
  %41 = load i16, i16* %40, align 2
  %42 = sext i16 %41 to i32
  %43 = ashr i32 %42, 2
  %44 = and i32 %43, 7
  %45 = or i32 %38, %44
  %46 = trunc i32 %45 to i8
  %47 = load i8*, i8** %7, align 8
  %48 = getelementptr inbounds i8, i8* %47, i32 1
  store i8* %48, i8** %7, align 8
  store i8 %46, i8* %47, align 1
  %49 = load i16*, i16** %6, align 8
  %50 = getelementptr inbounds i16, i16* %49, i64 3
  %51 = load i16, i16* %50, align 2
  %52 = sext i16 %51 to i32
  %53 = and i32 %52, 3
  %54 = shl i32 %53, 6
  %55 = load i16*, i16** %6, align 8
  %56 = getelementptr inbounds i16, i16* %55, i64 4
  %57 = load i16, i16* %56, align 2
  %58 = sext i16 %57 to i32
  %59 = and i32 %58, 15
  %60 = shl i32 %59, 2
  %61 = or i32 %54, %60
  %62 = load i16*, i16** %6, align 8
  %63 = getelementptr inbounds i16, i16* %62, i64 5
  %64 = load i16, i16* %63, align 2
  %65 = sext i16 %64 to i32
  %66 = ashr i32 %65, 2
  %67 = and i32 %66, 3
  %68 = or i32 %61, %67
  %69 = trunc i32 %68 to i8
  %70 = load i8*, i8** %7, align 8
  %71 = getelementptr inbounds i8, i8* %70, i32 1
  store i8* %71, i8** %7, align 8
  store i8 %69, i8* %70, align 1
  %72 = load i16*, i16** %6, align 8
  %73 = getelementptr inbounds i16, i16* %72, i64 5
  %74 = load i16, i16* %73, align 2
  %75 = sext i16 %74 to i32
  %76 = and i32 %75, 3
  %77 = shl i32 %76, 6
  %78 = load i16*, i16** %6, align 8
  %79 = getelementptr inbounds i16, i16* %78, i64 6
  %80 = load i16, i16* %79, align 2
  %81 = sext i16 %80 to i32
  %82 = and i32 %81, 7
  %83 = shl i32 %82, 3
  %84 = or i32 %77, %83
  %85 = load i16*, i16** %6, align 8
  %86 = getelementptr inbounds i16, i16* %85, i64 7
  %87 = load i16, i16* %86, align 2
  %88 = sext i16 %87 to i32
  %89 = and i32 %88, 7
  %90 = or i32 %84, %89
  %91 = trunc i32 %90 to i8
  %92 = load i8*, i8** %7, align 8
  %93 = getelementptr inbounds i8, i8* %92, i32 1
  store i8* %93, i8** %7, align 8
  store i8 %91, i8* %92, align 1
  %94 = load i16*, i16** %6, align 8
  %95 = getelementptr inbounds i16, i16* %94, i64 8
  %96 = getelementptr inbounds i16, i16* %95, i64 0
  %97 = load i16, i16* %96, align 2
  %98 = sext i16 %97 to i32
  %99 = and i32 %98, 127
  %100 = shl i32 %99, 1
  %101 = load i16*, i16** %6, align 8
  %102 = getelementptr inbounds i16, i16* %101, i64 9
  %103 = getelementptr inbounds i16, i16* %102, i64 0
  %104 = load i16, i16* %103, align 2
  %105 = sext i16 %104 to i32
  %106 = ashr i32 %105, 1
  %107 = and i32 %106, 1
  %108 = or i32 %100, %107
  %109 = trunc i32 %108 to i8
  %110 = load i8*, i8** %7, align 8
  %111 = getelementptr inbounds i8, i8* %110, i32 1
  store i8* %111, i8** %7, align 8
  store i8 %109, i8* %110, align 1
  %112 = load i16*, i16** %6, align 8
  %113 = getelementptr inbounds i16, i16* %112, i64 9
  %114 = getelementptr inbounds i16, i16* %113, i64 0
  %115 = load i16, i16* %114, align 2
  %116 = sext i16 %115 to i32
  %117 = and i32 %116, 1
  %118 = shl i32 %117, 7
  %119 = load i16*, i16** %6, align 8
  %120 = getelementptr inbounds i16, i16* %119, i64 10
  %121 = getelementptr inbounds i16, i16* %120, i64 0
  %122 = load i16, i16* %121, align 2
  %123 = sext i16 %122 to i32
  %124 = and i32 %123, 3
  %125 = shl i32 %124, 5
  %126 = or i32 %118, %125
  %127 = load i16*, i16** %6, align 8
  %128 = getelementptr inbounds i16, i16* %127, i64 11
  %129 = getelementptr inbounds i16, i16* %128, i64 0
  %130 = load i16, i16* %129, align 2
  %131 = sext i16 %130 to i32
  %132 = ashr i32 %131, 1
  %133 = and i32 %132, 31
  %134 = or i32 %126, %133
  %135 = trunc i32 %134 to i8
  %136 = load i8*, i8** %7, align 8
  %137 = getelementptr inbounds i8, i8* %136, i32 1
  store i8* %137, i8** %7, align 8
  store i8 %135, i8* %136, align 1
  %138 = load i16*, i16** %6, align 8
  %139 = getelementptr inbounds i16, i16* %138, i64 11
  %140 = getelementptr inbounds i16, i16* %139, i64 0
  %141 = load i16, i16* %140, align 2
  %142 = sext i16 %141 to i32
  %143 = and i32 %142, 1
  %144 = shl i32 %143, 7
  %145 = load i16*, i16** %6, align 8
  %146 = getelementptr inbounds i16, i16* %145, i64 12
  %147 = getelementptr inbounds i16, i16* %146, i64 0
  %148 = load i16, i16* %147, align 2
  %149 = sext i16 %148 to i32
  %150 = and i32 %149, 7
  %151 = shl i32 %150, 4
  %152 = or i32 %144, %151
  %153 = load i16*, i16** %6, align 8
  %154 = getelementptr inbounds i16, i16* %153, i64 12
  %155 = getelementptr inbounds i16, i16* %154, i64 1
  %156 = load i16, i16* %155, align 2
  %157 = sext i16 %156 to i32
  %158 = and i32 %157, 7
  %159 = shl i32 %158, 1
  %160 = or i32 %152, %159
  %161 = load i16*, i16** %6, align 8
  %162 = getelementptr inbounds i16, i16* %161, i64 12
  %163 = getelementptr inbounds i16, i16* %162, i64 2
  %164 = load i16, i16* %163, align 2
  %165 = sext i16 %164 to i32
  %166 = ashr i32 %165, 2
  %167 = and i32 %166, 1
  %168 = or i32 %160, %167
  %169 = trunc i32 %168 to i8
  %170 = load i8*, i8** %7, align 8
  %171 = getelementptr inbounds i8, i8* %170, i32 1
  store i8* %171, i8** %7, align 8
  store i8 %169, i8* %170, align 1
  %172 = load i16*, i16** %6, align 8
  %173 = getelementptr inbounds i16, i16* %172, i64 12
  %174 = getelementptr inbounds i16, i16* %173, i64 2
  %175 = load i16, i16* %174, align 2
  %176 = sext i16 %175 to i32
  %177 = and i32 %176, 3
  %178 = shl i32 %177, 6
  %179 = load i16*, i16** %6, align 8
  %180 = getelementptr inbounds i16, i16* %179, i64 12
  %181 = getelementptr inbounds i16, i16* %180, i64 3
  %182 = load i16, i16* %181, align 2
  %183 = sext i16 %182 to i32
  %184 = and i32 %183, 7
  %185 = shl i32 %184, 3
  %186 = or i32 %178, %185
  %187 = load i16*, i16** %6, align 8
  %188 = getelementptr inbounds i16, i16* %187, i64 12
  %189 = getelementptr inbounds i16, i16* %188, i64 4
  %190 = load i16, i16* %189, align 2
  %191 = sext i16 %190 to i32
  %192 = and i32 %191, 7
  %193 = or i32 %186, %192
  %194 = trunc i32 %193 to i8
  %195 = load i8*, i8** %7, align 8
  %196 = getelementptr inbounds i8, i8* %195, i32 1
  store i8* %196, i8** %7, align 8
  store i8 %194, i8* %195, align 1
  %197 = load i16*, i16** %6, align 8
  %198 = getelementptr inbounds i16, i16* %197, i64 12
  %199 = getelementptr inbounds i16, i16* %198, i64 5
  %200 = load i16, i16* %199, align 2
  %201 = sext i16 %200 to i32
  %202 = and i32 %201, 7
  %203 = shl i32 %202, 5
  %204 = load i16*, i16** %6, align 8
  %205 = getelementptr inbounds i16, i16* %204, i64 12
  %206 = getelementptr inbounds i16, i16* %205, i64 6
  %207 = load i16, i16* %206, align 2
  %208 = sext i16 %207 to i32
  %209 = and i32 %208, 7
  %210 = shl i32 %209, 2
  %211 = or i32 %203, %210
  %212 = load i16*, i16** %6, align 8
  %213 = getelementptr inbounds i16, i16* %212, i64 12
  %214 = getelementptr inbounds i16, i16* %213, i64 7
  %215 = load i16, i16* %214, align 2
  %216 = sext i16 %215 to i32
  %217 = ashr i32 %216, 1
  %218 = and i32 %217, 3
  %219 = or i32 %211, %218
  %220 = trunc i32 %219 to i8
  %221 = load i8*, i8** %7, align 8
  %222 = getelementptr inbounds i8, i8* %221, i32 1
  store i8* %222, i8** %7, align 8
  store i8 %220, i8* %221, align 1
  %223 = load i16*, i16** %6, align 8
  %224 = getelementptr inbounds i16, i16* %223, i64 12
  %225 = getelementptr inbounds i16, i16* %224, i64 7
  %226 = load i16, i16* %225, align 2
  %227 = sext i16 %226 to i32
  %228 = and i32 %227, 1
  %229 = shl i32 %228, 7
  %230 = load i16*, i16** %6, align 8
  %231 = getelementptr inbounds i16, i16* %230, i64 12
  %232 = getelementptr inbounds i16, i16* %231, i64 8
  %233 = load i16, i16* %232, align 2
  %234 = sext i16 %233 to i32
  %235 = and i32 %234, 7
  %236 = shl i32 %235, 4
  %237 = or i32 %229, %236
  %238 = load i16*, i16** %6, align 8
  %239 = getelementptr inbounds i16, i16* %238, i64 12
  %240 = getelementptr inbounds i16, i16* %239, i64 9
  %241 = load i16, i16* %240, align 2
  %242 = sext i16 %241 to i32
  %243 = and i32 %242, 7
  %244 = shl i32 %243, 1
  %245 = or i32 %237, %244
  %246 = load i16*, i16** %6, align 8
  %247 = getelementptr inbounds i16, i16* %246, i64 12
  %248 = getelementptr inbounds i16, i16* %247, i64 10
  %249 = load i16, i16* %248, align 2
  %250 = sext i16 %249 to i32
  %251 = ashr i32 %250, 2
  %252 = and i32 %251, 1
  %253 = or i32 %245, %252
  %254 = trunc i32 %253 to i8
  %255 = load i8*, i8** %7, align 8
  %256 = getelementptr inbounds i8, i8* %255, i32 1
  store i8* %256, i8** %7, align 8
  store i8 %254, i8* %255, align 1
  %257 = load i16*, i16** %6, align 8
  %258 = getelementptr inbounds i16, i16* %257, i64 12
  %259 = getelementptr inbounds i16, i16* %258, i64 10
  %260 = load i16, i16* %259, align 2
  %261 = sext i16 %260 to i32
  %262 = and i32 %261, 3
  %263 = shl i32 %262, 6
  %264 = load i16*, i16** %6, align 8
  %265 = getelementptr inbounds i16, i16* %264, i64 12
  %266 = getelementptr inbounds i16, i16* %265, i64 11
  %267 = load i16, i16* %266, align 2
  %268 = sext i16 %267 to i32
  %269 = and i32 %268, 7
  %270 = shl i32 %269, 3
  %271 = or i32 %263, %270
  %272 = load i16*, i16** %6, align 8
  %273 = getelementptr inbounds i16, i16* %272, i64 12
  %274 = getelementptr inbounds i16, i16* %273, i64 12
  %275 = load i16, i16* %274, align 2
  %276 = sext i16 %275 to i32
  %277 = and i32 %276, 7
  %278 = or i32 %271, %277
  %279 = trunc i32 %278 to i8
  %280 = load i8*, i8** %7, align 8
  %281 = getelementptr inbounds i8, i8* %280, i32 1
  store i8* %281, i8** %7, align 8
  store i8 %279, i8* %280, align 1
  %282 = load i16*, i16** %6, align 8
  %283 = getelementptr inbounds i16, i16* %282, i64 25
  %284 = getelementptr inbounds i16, i16* %283, i64 -1
  %285 = getelementptr inbounds i16, i16* %284, i64 1
  %286 = load i16, i16* %285, align 2
  %287 = sext i16 %286 to i32
  %288 = and i32 %287, 127
  %289 = shl i32 %288, 1
  %290 = load i16*, i16** %6, align 8
  %291 = getelementptr inbounds i16, i16* %290, i64 26
  %292 = getelementptr inbounds i16, i16* %291, i64 -1
  %293 = getelementptr inbounds i16, i16* %292, i64 1
  %294 = load i16, i16* %293, align 2
  %295 = sext i16 %294 to i32
  %296 = ashr i32 %295, 1
  %297 = and i32 %296, 1
  %298 = or i32 %289, %297
  %299 = trunc i32 %298 to i8
  %300 = load i8*, i8** %7, align 8
  %301 = getelementptr inbounds i8, i8* %300, i32 1
  store i8* %301, i8** %7, align 8
  store i8 %299, i8* %300, align 1
  %302 = load i16*, i16** %6, align 8
  %303 = getelementptr inbounds i16, i16* %302, i64 26
  %304 = getelementptr inbounds i16, i16* %303, i64 -1
  %305 = getelementptr inbounds i16, i16* %304, i64 1
  %306 = load i16, i16* %305, align 2
  %307 = sext i16 %306 to i32
  %308 = and i32 %307, 1
  %309 = shl i32 %308, 7
  %310 = load i16*, i16** %6, align 8
  %311 = getelementptr inbounds i16, i16* %310, i64 27
  %312 = getelementptr inbounds i16, i16* %311, i64 -1
  %313 = getelementptr inbounds i16, i16* %312, i64 1
  %314 = load i16, i16* %313, align 2
  %315 = sext i16 %314 to i32
  %316 = and i32 %315, 3
  %317 = shl i32 %316, 5
  %318 = or i32 %309, %317
  %319 = load i16*, i16** %6, align 8
  %320 = getelementptr inbounds i16, i16* %319, i64 28
  %321 = getelementptr inbounds i16, i16* %320, i64 -1
  %322 = getelementptr inbounds i16, i16* %321, i64 1
  %323 = load i16, i16* %322, align 2
  %324 = sext i16 %323 to i32
  %325 = ashr i32 %324, 1
  %326 = and i32 %325, 31
  %327 = or i32 %318, %326
  %328 = trunc i32 %327 to i8
  %329 = load i8*, i8** %7, align 8
  %330 = getelementptr inbounds i8, i8* %329, i32 1
  store i8* %330, i8** %7, align 8
  store i8 %328, i8* %329, align 1
  %331 = load i16*, i16** %6, align 8
  %332 = getelementptr inbounds i16, i16* %331, i64 28
  %333 = getelementptr inbounds i16, i16* %332, i64 -1
  %334 = getelementptr inbounds i16, i16* %333, i64 1
  %335 = load i16, i16* %334, align 2
  %336 = sext i16 %335 to i32
  %337 = and i32 %336, 1
  %338 = shl i32 %337, 7
  %339 = load i16*, i16** %6, align 8
  %340 = getelementptr inbounds i16, i16* %339, i64 29
  %341 = getelementptr inbounds i16, i16* %340, i64 -13
  %342 = getelementptr inbounds i16, i16* %341, i64 13
  %343 = load i16, i16* %342, align 2
  %344 = sext i16 %343 to i32
  %345 = and i32 %344, 7
  %346 = shl i32 %345, 4
  %347 = or i32 %338, %346
  %348 = load i16*, i16** %6, align 8
  %349 = getelementptr inbounds i16, i16* %348, i64 29
  %350 = getelementptr inbounds i16, i16* %349, i64 -13
  %351 = getelementptr inbounds i16, i16* %350, i64 14
  %352 = load i16, i16* %351, align 2
  %353 = sext i16 %352 to i32
  %354 = and i32 %353, 7
  %355 = shl i32 %354, 1
  %356 = or i32 %347, %355
  %357 = load i16*, i16** %6, align 8
  %358 = getelementptr inbounds i16, i16* %357, i64 29
  %359 = getelementptr inbounds i16, i16* %358, i64 -13
  %360 = getelementptr inbounds i16, i16* %359, i64 15
  %361 = load i16, i16* %360, align 2
  %362 = sext i16 %361 to i32
  %363 = ashr i32 %362, 2
  %364 = and i32 %363, 1
  %365 = or i32 %356, %364
  %366 = trunc i32 %365 to i8
  %367 = load i8*, i8** %7, align 8
  %368 = getelementptr inbounds i8, i8* %367, i32 1
  store i8* %368, i8** %7, align 8
  store i8 %366, i8* %367, align 1
  %369 = load i16*, i16** %6, align 8
  %370 = getelementptr inbounds i16, i16* %369, i64 29
  %371 = getelementptr inbounds i16, i16* %370, i64 -13
  %372 = getelementptr inbounds i16, i16* %371, i64 15
  %373 = load i16, i16* %372, align 2
  %374 = sext i16 %373 to i32
  %375 = and i32 %374, 3
  %376 = shl i32 %375, 6
  %377 = load i16*, i16** %6, align 8
  %378 = getelementptr inbounds i16, i16* %377, i64 29
  %379 = getelementptr inbounds i16, i16* %378, i64 -13
  %380 = getelementptr inbounds i16, i16* %379, i64 16
  %381 = load i16, i16* %380, align 2
  %382 = sext i16 %381 to i32
  %383 = and i32 %382, 7
  %384 = shl i32 %383, 3
  %385 = or i32 %376, %384
  %386 = load i16*, i16** %6, align 8
  %387 = getelementptr inbounds i16, i16* %386, i64 29
  %388 = getelementptr inbounds i16, i16* %387, i64 -13
  %389 = getelementptr inbounds i16, i16* %388, i64 17
  %390 = load i16, i16* %389, align 2
  %391 = sext i16 %390 to i32
  %392 = and i32 %391, 7
  %393 = or i32 %385, %392
  %394 = trunc i32 %393 to i8
  %395 = load i8*, i8** %7, align 8
  %396 = getelementptr inbounds i8, i8* %395, i32 1
  store i8* %396, i8** %7, align 8
  store i8 %394, i8* %395, align 1
  %397 = load i16*, i16** %6, align 8
  %398 = getelementptr inbounds i16, i16* %397, i64 29
  %399 = getelementptr inbounds i16, i16* %398, i64 -13
  %400 = getelementptr inbounds i16, i16* %399, i64 18
  %401 = load i16, i16* %400, align 2
  %402 = sext i16 %401 to i32
  %403 = and i32 %402, 7
  %404 = shl i32 %403, 5
  %405 = load i16*, i16** %6, align 8
  %406 = getelementptr inbounds i16, i16* %405, i64 29
  %407 = getelementptr inbounds i16, i16* %406, i64 -13
  %408 = getelementptr inbounds i16, i16* %407, i64 19
  %409 = load i16, i16* %408, align 2
  %410 = sext i16 %409 to i32
  %411 = and i32 %410, 7
  %412 = shl i32 %411, 2
  %413 = or i32 %404, %412
  %414 = load i16*, i16** %6, align 8
  %415 = getelementptr inbounds i16, i16* %414, i64 29
  %416 = getelementptr inbounds i16, i16* %415, i64 -13
  %417 = getelementptr inbounds i16, i16* %416, i64 20
  %418 = load i16, i16* %417, align 2
  %419 = sext i16 %418 to i32
  %420 = ashr i32 %419, 1
  %421 = and i32 %420, 3
  %422 = or i32 %413, %421
  %423 = trunc i32 %422 to i8
  %424 = load i8*, i8** %7, align 8
  %425 = getelementptr inbounds i8, i8* %424, i32 1
  store i8* %425, i8** %7, align 8
  store i8 %423, i8* %424, align 1
  %426 = load i16*, i16** %6, align 8
  %427 = getelementptr inbounds i16, i16* %426, i64 29
  %428 = getelementptr inbounds i16, i16* %427, i64 -13
  %429 = getelementptr inbounds i16, i16* %428, i64 20
  %430 = load i16, i16* %429, align 2
  %431 = sext i16 %430 to i32
  %432 = and i32 %431, 1
  %433 = shl i32 %432, 7
  %434 = load i16*, i16** %6, align 8
  %435 = getelementptr inbounds i16, i16* %434, i64 29
  %436 = getelementptr inbounds i16, i16* %435, i64 -13
  %437 = getelementptr inbounds i16, i16* %436, i64 21
  %438 = load i16, i16* %437, align 2
  %439 = sext i16 %438 to i32
  %440 = and i32 %439, 7
  %441 = shl i32 %440, 4
  %442 = or i32 %433, %441
  %443 = load i16*, i16** %6, align 8
  %444 = getelementptr inbounds i16, i16* %443, i64 29
  %445 = getelementptr inbounds i16, i16* %444, i64 -13
  %446 = getelementptr inbounds i16, i16* %445, i64 22
  %447 = load i16, i16* %446, align 2
  %448 = sext i16 %447 to i32
  %449 = and i32 %448, 7
  %450 = shl i32 %449, 1
  %451 = or i32 %442, %450
  %452 = load i16*, i16** %6, align 8
  %453 = getelementptr inbounds i16, i16* %452, i64 29
  %454 = getelementptr inbounds i16, i16* %453, i64 -13
  %455 = getelementptr inbounds i16, i16* %454, i64 23
  %456 = load i16, i16* %455, align 2
  %457 = sext i16 %456 to i32
  %458 = ashr i32 %457, 2
  %459 = and i32 %458, 1
  %460 = or i32 %451, %459
  %461 = trunc i32 %460 to i8
  %462 = load i8*, i8** %7, align 8
  %463 = getelementptr inbounds i8, i8* %462, i32 1
  store i8* %463, i8** %7, align 8
  store i8 %461, i8* %462, align 1
  %464 = load i16*, i16** %6, align 8
  %465 = getelementptr inbounds i16, i16* %464, i64 29
  %466 = getelementptr inbounds i16, i16* %465, i64 -13
  %467 = getelementptr inbounds i16, i16* %466, i64 23
  %468 = load i16, i16* %467, align 2
  %469 = sext i16 %468 to i32
  %470 = and i32 %469, 3
  %471 = shl i32 %470, 6
  %472 = load i16*, i16** %6, align 8
  %473 = getelementptr inbounds i16, i16* %472, i64 29
  %474 = getelementptr inbounds i16, i16* %473, i64 -13
  %475 = getelementptr inbounds i16, i16* %474, i64 24
  %476 = load i16, i16* %475, align 2
  %477 = sext i16 %476 to i32
  %478 = and i32 %477, 7
  %479 = shl i32 %478, 3
  %480 = or i32 %471, %479
  %481 = load i16*, i16** %6, align 8
  %482 = getelementptr inbounds i16, i16* %481, i64 29
  %483 = getelementptr inbounds i16, i16* %482, i64 -13
  %484 = getelementptr inbounds i16, i16* %483, i64 25
  %485 = load i16, i16* %484, align 2
  %486 = sext i16 %485 to i32
  %487 = and i32 %486, 7
  %488 = or i32 %480, %487
  %489 = trunc i32 %488 to i8
  %490 = load i8*, i8** %7, align 8
  %491 = getelementptr inbounds i8, i8* %490, i32 1
  store i8* %491, i8** %7, align 8
  store i8 %489, i8* %490, align 1
  %492 = load i16*, i16** %6, align 8
  %493 = getelementptr inbounds i16, i16* %492, i64 42
  %494 = getelementptr inbounds i16, i16* %493, i64 -2
  %495 = getelementptr inbounds i16, i16* %494, i64 2
  %496 = load i16, i16* %495, align 2
  %497 = sext i16 %496 to i32
  %498 = and i32 %497, 127
  %499 = shl i32 %498, 1
  %500 = load i16*, i16** %6, align 8
  %501 = getelementptr inbounds i16, i16* %500, i64 43
  %502 = getelementptr inbounds i16, i16* %501, i64 -2
  %503 = getelementptr inbounds i16, i16* %502, i64 2
  %504 = load i16, i16* %503, align 2
  %505 = sext i16 %504 to i32
  %506 = ashr i32 %505, 1
  %507 = and i32 %506, 1
  %508 = or i32 %499, %507
  %509 = trunc i32 %508 to i8
  %510 = load i8*, i8** %7, align 8
  %511 = getelementptr inbounds i8, i8* %510, i32 1
  store i8* %511, i8** %7, align 8
  store i8 %509, i8* %510, align 1
  %512 = load i16*, i16** %6, align 8
  %513 = getelementptr inbounds i16, i16* %512, i64 43
  %514 = getelementptr inbounds i16, i16* %513, i64 -2
  %515 = getelementptr inbounds i16, i16* %514, i64 2
  %516 = load i16, i16* %515, align 2
  %517 = sext i16 %516 to i32
  %518 = and i32 %517, 1
  %519 = shl i32 %518, 7
  %520 = load i16*, i16** %6, align 8
  %521 = getelementptr inbounds i16, i16* %520, i64 44
  %522 = getelementptr inbounds i16, i16* %521, i64 -2
  %523 = getelementptr inbounds i16, i16* %522, i64 2
  %524 = load i16, i16* %523, align 2
  %525 = sext i16 %524 to i32
  %526 = and i32 %525, 3
  %527 = shl i32 %526, 5
  %528 = or i32 %519, %527
  %529 = load i16*, i16** %6, align 8
  %530 = getelementptr inbounds i16, i16* %529, i64 45
  %531 = getelementptr inbounds i16, i16* %530, i64 -2
  %532 = getelementptr inbounds i16, i16* %531, i64 2
  %533 = load i16, i16* %532, align 2
  %534 = sext i16 %533 to i32
  %535 = ashr i32 %534, 1
  %536 = and i32 %535, 31
  %537 = or i32 %528, %536
  %538 = trunc i32 %537 to i8
  %539 = load i8*, i8** %7, align 8
  %540 = getelementptr inbounds i8, i8* %539, i32 1
  store i8* %540, i8** %7, align 8
  store i8 %538, i8* %539, align 1
  %541 = load i16*, i16** %6, align 8
  %542 = getelementptr inbounds i16, i16* %541, i64 45
  %543 = getelementptr inbounds i16, i16* %542, i64 -2
  %544 = getelementptr inbounds i16, i16* %543, i64 2
  %545 = load i16, i16* %544, align 2
  %546 = sext i16 %545 to i32
  %547 = and i32 %546, 1
  %548 = shl i32 %547, 7
  %549 = load i16*, i16** %6, align 8
  %550 = getelementptr inbounds i16, i16* %549, i64 46
  %551 = getelementptr inbounds i16, i16* %550, i64 -26
  %552 = getelementptr inbounds i16, i16* %551, i64 26
  %553 = load i16, i16* %552, align 2
  %554 = sext i16 %553 to i32
  %555 = and i32 %554, 7
  %556 = shl i32 %555, 4
  %557 = or i32 %548, %556
  %558 = load i16*, i16** %6, align 8
  %559 = getelementptr inbounds i16, i16* %558, i64 46
  %560 = getelementptr inbounds i16, i16* %559, i64 -26
  %561 = getelementptr inbounds i16, i16* %560, i64 27
  %562 = load i16, i16* %561, align 2
  %563 = sext i16 %562 to i32
  %564 = and i32 %563, 7
  %565 = shl i32 %564, 1
  %566 = or i32 %557, %565
  %567 = load i16*, i16** %6, align 8
  %568 = getelementptr inbounds i16, i16* %567, i64 46
  %569 = getelementptr inbounds i16, i16* %568, i64 -26
  %570 = getelementptr inbounds i16, i16* %569, i64 28
  %571 = load i16, i16* %570, align 2
  %572 = sext i16 %571 to i32
  %573 = ashr i32 %572, 2
  %574 = and i32 %573, 1
  %575 = or i32 %566, %574
  %576 = trunc i32 %575 to i8
  %577 = load i8*, i8** %7, align 8
  %578 = getelementptr inbounds i8, i8* %577, i32 1
  store i8* %578, i8** %7, align 8
  store i8 %576, i8* %577, align 1
  %579 = load i16*, i16** %6, align 8
  %580 = getelementptr inbounds i16, i16* %579, i64 46
  %581 = getelementptr inbounds i16, i16* %580, i64 -26
  %582 = getelementptr inbounds i16, i16* %581, i64 28
  %583 = load i16, i16* %582, align 2
  %584 = sext i16 %583 to i32
  %585 = and i32 %584, 3
  %586 = shl i32 %585, 6
  %587 = load i16*, i16** %6, align 8
  %588 = getelementptr inbounds i16, i16* %587, i64 46
  %589 = getelementptr inbounds i16, i16* %588, i64 -26
  %590 = getelementptr inbounds i16, i16* %589, i64 29
  %591 = load i16, i16* %590, align 2
  %592 = sext i16 %591 to i32
  %593 = and i32 %592, 7
  %594 = shl i32 %593, 3
  %595 = or i32 %586, %594
  %596 = load i16*, i16** %6, align 8
  %597 = getelementptr inbounds i16, i16* %596, i64 46
  %598 = getelementptr inbounds i16, i16* %597, i64 -26
  %599 = getelementptr inbounds i16, i16* %598, i64 30
  %600 = load i16, i16* %599, align 2
  %601 = sext i16 %600 to i32
  %602 = and i32 %601, 7
  %603 = or i32 %595, %602
  %604 = trunc i32 %603 to i8
  %605 = load i8*, i8** %7, align 8
  %606 = getelementptr inbounds i8, i8* %605, i32 1
  store i8* %606, i8** %7, align 8
  store i8 %604, i8* %605, align 1
  %607 = load i16*, i16** %6, align 8
  %608 = getelementptr inbounds i16, i16* %607, i64 46
  %609 = getelementptr inbounds i16, i16* %608, i64 -26
  %610 = getelementptr inbounds i16, i16* %609, i64 31
  %611 = load i16, i16* %610, align 2
  %612 = sext i16 %611 to i32
  %613 = and i32 %612, 7
  %614 = shl i32 %613, 5
  %615 = load i16*, i16** %6, align 8
  %616 = getelementptr inbounds i16, i16* %615, i64 46
  %617 = getelementptr inbounds i16, i16* %616, i64 -26
  %618 = getelementptr inbounds i16, i16* %617, i64 32
  %619 = load i16, i16* %618, align 2
  %620 = sext i16 %619 to i32
  %621 = and i32 %620, 7
  %622 = shl i32 %621, 2
  %623 = or i32 %614, %622
  %624 = load i16*, i16** %6, align 8
  %625 = getelementptr inbounds i16, i16* %624, i64 46
  %626 = getelementptr inbounds i16, i16* %625, i64 -26
  %627 = getelementptr inbounds i16, i16* %626, i64 33
  %628 = load i16, i16* %627, align 2
  %629 = sext i16 %628 to i32
  %630 = ashr i32 %629, 1
  %631 = and i32 %630, 3
  %632 = or i32 %623, %631
  %633 = trunc i32 %632 to i8
  %634 = load i8*, i8** %7, align 8
  %635 = getelementptr inbounds i8, i8* %634, i32 1
  store i8* %635, i8** %7, align 8
  store i8 %633, i8* %634, align 1
  %636 = load i16*, i16** %6, align 8
  %637 = getelementptr inbounds i16, i16* %636, i64 46
  %638 = getelementptr inbounds i16, i16* %637, i64 -26
  %639 = getelementptr inbounds i16, i16* %638, i64 33
  %640 = load i16, i16* %639, align 2
  %641 = sext i16 %640 to i32
  %642 = and i32 %641, 1
  %643 = shl i32 %642, 7
  %644 = load i16*, i16** %6, align 8
  %645 = getelementptr inbounds i16, i16* %644, i64 46
  %646 = getelementptr inbounds i16, i16* %645, i64 -26
  %647 = getelementptr inbounds i16, i16* %646, i64 34
  %648 = load i16, i16* %647, align 2
  %649 = sext i16 %648 to i32
  %650 = and i32 %649, 7
  %651 = shl i32 %650, 4
  %652 = or i32 %643, %651
  %653 = load i16*, i16** %6, align 8
  %654 = getelementptr inbounds i16, i16* %653, i64 46
  %655 = getelementptr inbounds i16, i16* %654, i64 -26
  %656 = getelementptr inbounds i16, i16* %655, i64 35
  %657 = load i16, i16* %656, align 2
  %658 = sext i16 %657 to i32
  %659 = and i32 %658, 7
  %660 = shl i32 %659, 1
  %661 = or i32 %652, %660
  %662 = load i16*, i16** %6, align 8
  %663 = getelementptr inbounds i16, i16* %662, i64 46
  %664 = getelementptr inbounds i16, i16* %663, i64 -26
  %665 = getelementptr inbounds i16, i16* %664, i64 36
  %666 = load i16, i16* %665, align 2
  %667 = sext i16 %666 to i32
  %668 = ashr i32 %667, 2
  %669 = and i32 %668, 1
  %670 = or i32 %661, %669
  %671 = trunc i32 %670 to i8
  %672 = load i8*, i8** %7, align 8
  %673 = getelementptr inbounds i8, i8* %672, i32 1
  store i8* %673, i8** %7, align 8
  store i8 %671, i8* %672, align 1
  %674 = load i16*, i16** %6, align 8
  %675 = getelementptr inbounds i16, i16* %674, i64 46
  %676 = getelementptr inbounds i16, i16* %675, i64 -26
  %677 = getelementptr inbounds i16, i16* %676, i64 36
  %678 = load i16, i16* %677, align 2
  %679 = sext i16 %678 to i32
  %680 = and i32 %679, 3
  %681 = shl i32 %680, 6
  %682 = load i16*, i16** %6, align 8
  %683 = getelementptr inbounds i16, i16* %682, i64 46
  %684 = getelementptr inbounds i16, i16* %683, i64 -26
  %685 = getelementptr inbounds i16, i16* %684, i64 37
  %686 = load i16, i16* %685, align 2
  %687 = sext i16 %686 to i32
  %688 = and i32 %687, 7
  %689 = shl i32 %688, 3
  %690 = or i32 %681, %689
  %691 = load i16*, i16** %6, align 8
  %692 = getelementptr inbounds i16, i16* %691, i64 46
  %693 = getelementptr inbounds i16, i16* %692, i64 -26
  %694 = getelementptr inbounds i16, i16* %693, i64 38
  %695 = load i16, i16* %694, align 2
  %696 = sext i16 %695 to i32
  %697 = and i32 %696, 7
  %698 = or i32 %690, %697
  %699 = trunc i32 %698 to i8
  %700 = load i8*, i8** %7, align 8
  %701 = getelementptr inbounds i8, i8* %700, i32 1
  store i8* %701, i8** %7, align 8
  store i8 %699, i8* %700, align 1
  %702 = load i16*, i16** %6, align 8
  %703 = getelementptr inbounds i16, i16* %702, i64 59
  %704 = getelementptr inbounds i16, i16* %703, i64 -3
  %705 = getelementptr inbounds i16, i16* %704, i64 3
  %706 = load i16, i16* %705, align 2
  %707 = sext i16 %706 to i32
  %708 = and i32 %707, 127
  %709 = shl i32 %708, 1
  %710 = load i16*, i16** %6, align 8
  %711 = getelementptr inbounds i16, i16* %710, i64 60
  %712 = getelementptr inbounds i16, i16* %711, i64 -3
  %713 = getelementptr inbounds i16, i16* %712, i64 3
  %714 = load i16, i16* %713, align 2
  %715 = sext i16 %714 to i32
  %716 = ashr i32 %715, 1
  %717 = and i32 %716, 1
  %718 = or i32 %709, %717
  %719 = trunc i32 %718 to i8
  %720 = load i8*, i8** %7, align 8
  %721 = getelementptr inbounds i8, i8* %720, i32 1
  store i8* %721, i8** %7, align 8
  store i8 %719, i8* %720, align 1
  %722 = load i16*, i16** %6, align 8
  %723 = getelementptr inbounds i16, i16* %722, i64 60
  %724 = getelementptr inbounds i16, i16* %723, i64 -3
  %725 = getelementptr inbounds i16, i16* %724, i64 3
  %726 = load i16, i16* %725, align 2
  %727 = sext i16 %726 to i32
  %728 = and i32 %727, 1
  %729 = shl i32 %728, 7
  %730 = load i16*, i16** %6, align 8
  %731 = getelementptr inbounds i16, i16* %730, i64 61
  %732 = getelementptr inbounds i16, i16* %731, i64 -3
  %733 = getelementptr inbounds i16, i16* %732, i64 3
  %734 = load i16, i16* %733, align 2
  %735 = sext i16 %734 to i32
  %736 = and i32 %735, 3
  %737 = shl i32 %736, 5
  %738 = or i32 %729, %737
  %739 = load i16*, i16** %6, align 8
  %740 = getelementptr inbounds i16, i16* %739, i64 62
  %741 = getelementptr inbounds i16, i16* %740, i64 -3
  %742 = getelementptr inbounds i16, i16* %741, i64 3
  %743 = load i16, i16* %742, align 2
  %744 = sext i16 %743 to i32
  %745 = ashr i32 %744, 1
  %746 = and i32 %745, 31
  %747 = or i32 %738, %746
  %748 = trunc i32 %747 to i8
  %749 = load i8*, i8** %7, align 8
  %750 = getelementptr inbounds i8, i8* %749, i32 1
  store i8* %750, i8** %7, align 8
  store i8 %748, i8* %749, align 1
  %751 = load i16*, i16** %6, align 8
  %752 = getelementptr inbounds i16, i16* %751, i64 62
  %753 = getelementptr inbounds i16, i16* %752, i64 -3
  %754 = getelementptr inbounds i16, i16* %753, i64 3
  %755 = load i16, i16* %754, align 2
  %756 = sext i16 %755 to i32
  %757 = and i32 %756, 1
  %758 = shl i32 %757, 7
  %759 = load i16*, i16** %6, align 8
  %760 = getelementptr inbounds i16, i16* %759, i64 63
  %761 = getelementptr inbounds i16, i16* %760, i64 -39
  %762 = getelementptr inbounds i16, i16* %761, i64 39
  %763 = load i16, i16* %762, align 2
  %764 = sext i16 %763 to i32
  %765 = and i32 %764, 7
  %766 = shl i32 %765, 4
  %767 = or i32 %758, %766
  %768 = load i16*, i16** %6, align 8
  %769 = getelementptr inbounds i16, i16* %768, i64 63
  %770 = getelementptr inbounds i16, i16* %769, i64 -39
  %771 = getelementptr inbounds i16, i16* %770, i64 40
  %772 = load i16, i16* %771, align 2
  %773 = sext i16 %772 to i32
  %774 = and i32 %773, 7
  %775 = shl i32 %774, 1
  %776 = or i32 %767, %775
  %777 = load i16*, i16** %6, align 8
  %778 = getelementptr inbounds i16, i16* %777, i64 63
  %779 = getelementptr inbounds i16, i16* %778, i64 -39
  %780 = getelementptr inbounds i16, i16* %779, i64 41
  %781 = load i16, i16* %780, align 2
  %782 = sext i16 %781 to i32
  %783 = ashr i32 %782, 2
  %784 = and i32 %783, 1
  %785 = or i32 %776, %784
  %786 = trunc i32 %785 to i8
  %787 = load i8*, i8** %7, align 8
  %788 = getelementptr inbounds i8, i8* %787, i32 1
  store i8* %788, i8** %7, align 8
  store i8 %786, i8* %787, align 1
  %789 = load i16*, i16** %6, align 8
  %790 = getelementptr inbounds i16, i16* %789, i64 63
  %791 = getelementptr inbounds i16, i16* %790, i64 -39
  %792 = getelementptr inbounds i16, i16* %791, i64 41
  %793 = load i16, i16* %792, align 2
  %794 = sext i16 %793 to i32
  %795 = and i32 %794, 3
  %796 = shl i32 %795, 6
  %797 = load i16*, i16** %6, align 8
  %798 = getelementptr inbounds i16, i16* %797, i64 63
  %799 = getelementptr inbounds i16, i16* %798, i64 -39
  %800 = getelementptr inbounds i16, i16* %799, i64 42
  %801 = load i16, i16* %800, align 2
  %802 = sext i16 %801 to i32
  %803 = and i32 %802, 7
  %804 = shl i32 %803, 3
  %805 = or i32 %796, %804
  %806 = load i16*, i16** %6, align 8
  %807 = getelementptr inbounds i16, i16* %806, i64 63
  %808 = getelementptr inbounds i16, i16* %807, i64 -39
  %809 = getelementptr inbounds i16, i16* %808, i64 43
  %810 = load i16, i16* %809, align 2
  %811 = sext i16 %810 to i32
  %812 = and i32 %811, 7
  %813 = or i32 %805, %812
  %814 = trunc i32 %813 to i8
  %815 = load i8*, i8** %7, align 8
  %816 = getelementptr inbounds i8, i8* %815, i32 1
  store i8* %816, i8** %7, align 8
  store i8 %814, i8* %815, align 1
  %817 = load i16*, i16** %6, align 8
  %818 = getelementptr inbounds i16, i16* %817, i64 63
  %819 = getelementptr inbounds i16, i16* %818, i64 -39
  %820 = getelementptr inbounds i16, i16* %819, i64 44
  %821 = load i16, i16* %820, align 2
  %822 = sext i16 %821 to i32
  %823 = and i32 %822, 7
  %824 = shl i32 %823, 5
  %825 = load i16*, i16** %6, align 8
  %826 = getelementptr inbounds i16, i16* %825, i64 63
  %827 = getelementptr inbounds i16, i16* %826, i64 -39
  %828 = getelementptr inbounds i16, i16* %827, i64 45
  %829 = load i16, i16* %828, align 2
  %830 = sext i16 %829 to i32
  %831 = and i32 %830, 7
  %832 = shl i32 %831, 2
  %833 = or i32 %824, %832
  %834 = load i16*, i16** %6, align 8
  %835 = getelementptr inbounds i16, i16* %834, i64 63
  %836 = getelementptr inbounds i16, i16* %835, i64 -39
  %837 = getelementptr inbounds i16, i16* %836, i64 46
  %838 = load i16, i16* %837, align 2
  %839 = sext i16 %838 to i32
  %840 = ashr i32 %839, 1
  %841 = and i32 %840, 3
  %842 = or i32 %833, %841
  %843 = trunc i32 %842 to i8
  %844 = load i8*, i8** %7, align 8
  %845 = getelementptr inbounds i8, i8* %844, i32 1
  store i8* %845, i8** %7, align 8
  store i8 %843, i8* %844, align 1
  %846 = load i16*, i16** %6, align 8
  %847 = getelementptr inbounds i16, i16* %846, i64 63
  %848 = getelementptr inbounds i16, i16* %847, i64 -39
  %849 = getelementptr inbounds i16, i16* %848, i64 46
  %850 = load i16, i16* %849, align 2
  %851 = sext i16 %850 to i32
  %852 = and i32 %851, 1
  %853 = shl i32 %852, 7
  %854 = load i16*, i16** %6, align 8
  %855 = getelementptr inbounds i16, i16* %854, i64 63
  %856 = getelementptr inbounds i16, i16* %855, i64 -39
  %857 = getelementptr inbounds i16, i16* %856, i64 47
  %858 = load i16, i16* %857, align 2
  %859 = sext i16 %858 to i32
  %860 = and i32 %859, 7
  %861 = shl i32 %860, 4
  %862 = or i32 %853, %861
  %863 = load i16*, i16** %6, align 8
  %864 = getelementptr inbounds i16, i16* %863, i64 63
  %865 = getelementptr inbounds i16, i16* %864, i64 -39
  %866 = getelementptr inbounds i16, i16* %865, i64 48
  %867 = load i16, i16* %866, align 2
  %868 = sext i16 %867 to i32
  %869 = and i32 %868, 7
  %870 = shl i32 %869, 1
  %871 = or i32 %862, %870
  %872 = load i16*, i16** %6, align 8
  %873 = getelementptr inbounds i16, i16* %872, i64 63
  %874 = getelementptr inbounds i16, i16* %873, i64 -39
  %875 = getelementptr inbounds i16, i16* %874, i64 49
  %876 = load i16, i16* %875, align 2
  %877 = sext i16 %876 to i32
  %878 = ashr i32 %877, 2
  %879 = and i32 %878, 1
  %880 = or i32 %871, %879
  %881 = trunc i32 %880 to i8
  %882 = load i8*, i8** %7, align 8
  %883 = getelementptr inbounds i8, i8* %882, i32 1
  store i8* %883, i8** %7, align 8
  store i8 %881, i8* %882, align 1
  %884 = load i16*, i16** %6, align 8
  %885 = getelementptr inbounds i16, i16* %884, i64 63
  %886 = getelementptr inbounds i16, i16* %885, i64 -39
  %887 = getelementptr inbounds i16, i16* %886, i64 49
  %888 = load i16, i16* %887, align 2
  %889 = sext i16 %888 to i32
  %890 = and i32 %889, 3
  %891 = shl i32 %890, 6
  %892 = load i16*, i16** %6, align 8
  %893 = getelementptr inbounds i16, i16* %892, i64 63
  %894 = getelementptr inbounds i16, i16* %893, i64 -39
  %895 = getelementptr inbounds i16, i16* %894, i64 50
  %896 = load i16, i16* %895, align 2
  %897 = sext i16 %896 to i32
  %898 = and i32 %897, 7
  %899 = shl i32 %898, 3
  %900 = or i32 %891, %899
  %901 = load i16*, i16** %6, align 8
  %902 = getelementptr inbounds i16, i16* %901, i64 63
  %903 = getelementptr inbounds i16, i16* %902, i64 -39
  %904 = getelementptr inbounds i16, i16* %903, i64 51
  %905 = load i16, i16* %904, align 2
  %906 = sext i16 %905 to i32
  %907 = and i32 %906, 7
  %908 = or i32 %900, %907
  %909 = trunc i32 %908 to i8
  %910 = load i8*, i8** %7, align 8
  %911 = getelementptr inbounds i8, i8* %910, i32 1
  store i8* %911, i8** %7, align 8
  store i8 %909, i8* %910, align 1
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
