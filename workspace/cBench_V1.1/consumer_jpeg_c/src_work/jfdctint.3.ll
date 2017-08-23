; ModuleID = 'jfdctint.2.ll'
source_filename = "jfdctint.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_fdct_islow = private constant [15 x i8] c"jpeg_fdct_islow"
@__profc_jpeg_fdct_islow = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_fdct_islow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7072751890348412942, i64 52028904346, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_islow, i32 0, i32 0), i8* bitcast (void (i32*)* @jpeg_fdct_islow to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [25 x i8] c"\0F\17x\DA\CB*HM\8FOKI.\89\CF,\CE\C9/\07\000\DF\064", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_fdct_islow to i8*), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jpeg_fdct_islow(i32*) #0 {
  %2 = alloca i32*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  %20 = alloca i32*, align 8
  %21 = alloca i32, align 4
  store i32* %0, i32** %2, align 8
  %22 = load i32*, i32** %2, align 8
  store i32* %22, i32** %20, align 8
  store i32 7, i32* %21, align 4
  br label %23

; <label>:23:                                     ; preds = %219, %1
  %24 = load i32, i32* %21, align 4
  %25 = icmp sge i32 %24, 0
  br i1 %25, label %26, label %223

; <label>:26:                                     ; preds = %23
  %27 = load i32*, i32** %20, align 8
  %28 = getelementptr inbounds i32, i32* %27, i64 0
  %29 = load i32, i32* %28, align 4
  %30 = load i32*, i32** %20, align 8
  %31 = getelementptr inbounds i32, i32* %30, i64 7
  %32 = load i32, i32* %31, align 4
  %33 = add nsw i32 %29, %32
  %34 = sext i32 %33 to i64
  store i64 %34, i64* %3, align 8
  %35 = load i32*, i32** %20, align 8
  %36 = getelementptr inbounds i32, i32* %35, i64 0
  %37 = load i32, i32* %36, align 4
  %38 = load i32*, i32** %20, align 8
  %39 = getelementptr inbounds i32, i32* %38, i64 7
  %40 = load i32, i32* %39, align 4
  %41 = sub nsw i32 %37, %40
  %42 = sext i32 %41 to i64
  store i64 %42, i64* %10, align 8
  %43 = load i32*, i32** %20, align 8
  %44 = getelementptr inbounds i32, i32* %43, i64 1
  %45 = load i32, i32* %44, align 4
  %46 = load i32*, i32** %20, align 8
  %47 = getelementptr inbounds i32, i32* %46, i64 6
  %48 = load i32, i32* %47, align 4
  %49 = add nsw i32 %45, %48
  %50 = sext i32 %49 to i64
  store i64 %50, i64* %4, align 8
  %51 = load i32*, i32** %20, align 8
  %52 = getelementptr inbounds i32, i32* %51, i64 1
  %53 = load i32, i32* %52, align 4
  %54 = load i32*, i32** %20, align 8
  %55 = getelementptr inbounds i32, i32* %54, i64 6
  %56 = load i32, i32* %55, align 4
  %57 = sub nsw i32 %53, %56
  %58 = sext i32 %57 to i64
  store i64 %58, i64* %9, align 8
  %59 = load i32*, i32** %20, align 8
  %60 = getelementptr inbounds i32, i32* %59, i64 2
  %61 = load i32, i32* %60, align 4
  %62 = load i32*, i32** %20, align 8
  %63 = getelementptr inbounds i32, i32* %62, i64 5
  %64 = load i32, i32* %63, align 4
  %65 = add nsw i32 %61, %64
  %66 = sext i32 %65 to i64
  store i64 %66, i64* %5, align 8
  %67 = load i32*, i32** %20, align 8
  %68 = getelementptr inbounds i32, i32* %67, i64 2
  %69 = load i32, i32* %68, align 4
  %70 = load i32*, i32** %20, align 8
  %71 = getelementptr inbounds i32, i32* %70, i64 5
  %72 = load i32, i32* %71, align 4
  %73 = sub nsw i32 %69, %72
  %74 = sext i32 %73 to i64
  store i64 %74, i64* %8, align 8
  %75 = load i32*, i32** %20, align 8
  %76 = getelementptr inbounds i32, i32* %75, i64 3
  %77 = load i32, i32* %76, align 4
  %78 = load i32*, i32** %20, align 8
  %79 = getelementptr inbounds i32, i32* %78, i64 4
  %80 = load i32, i32* %79, align 4
  %81 = add nsw i32 %77, %80
  %82 = sext i32 %81 to i64
  store i64 %82, i64* %6, align 8
  %83 = load i32*, i32** %20, align 8
  %84 = getelementptr inbounds i32, i32* %83, i64 3
  %85 = load i32, i32* %84, align 4
  %86 = load i32*, i32** %20, align 8
  %87 = getelementptr inbounds i32, i32* %86, i64 4
  %88 = load i32, i32* %87, align 4
  %89 = sub nsw i32 %85, %88
  %90 = sext i32 %89 to i64
  store i64 %90, i64* %7, align 8
  %91 = load i64, i64* %3, align 8
  %92 = load i64, i64* %6, align 8
  %93 = add nsw i64 %91, %92
  store i64 %93, i64* %11, align 8
  %94 = load i64, i64* %3, align 8
  %95 = load i64, i64* %6, align 8
  %96 = sub nsw i64 %94, %95
  store i64 %96, i64* %14, align 8
  %97 = load i64, i64* %4, align 8
  %98 = load i64, i64* %5, align 8
  %99 = add nsw i64 %97, %98
  store i64 %99, i64* %12, align 8
  %100 = load i64, i64* %4, align 8
  %101 = load i64, i64* %5, align 8
  %102 = sub nsw i64 %100, %101
  store i64 %102, i64* %13, align 8
  %103 = load i64, i64* %11, align 8
  %104 = load i64, i64* %12, align 8
  %105 = add nsw i64 %103, %104
  %106 = shl i64 %105, 2
  %107 = trunc i64 %106 to i32
  %108 = load i32*, i32** %20, align 8
  %109 = getelementptr inbounds i32, i32* %108, i64 0
  store i32 %107, i32* %109, align 4
  %110 = load i64, i64* %11, align 8
  %111 = load i64, i64* %12, align 8
  %112 = sub nsw i64 %110, %111
  %113 = shl i64 %112, 2
  %114 = trunc i64 %113 to i32
  %115 = load i32*, i32** %20, align 8
  %116 = getelementptr inbounds i32, i32* %115, i64 4
  store i32 %114, i32* %116, align 4
  %117 = load i64, i64* %13, align 8
  %118 = load i64, i64* %14, align 8
  %119 = add nsw i64 %117, %118
  %120 = mul nsw i64 %119, 4433
  store i64 %120, i64* %15, align 8
  %121 = load i64, i64* %15, align 8
  %122 = load i64, i64* %14, align 8
  %123 = mul nsw i64 %122, 6270
  %124 = add nsw i64 %121, %123
  %125 = add nsw i64 %124, 1024
  %126 = ashr i64 %125, 11
  %127 = trunc i64 %126 to i32
  %128 = load i32*, i32** %20, align 8
  %129 = getelementptr inbounds i32, i32* %128, i64 2
  store i32 %127, i32* %129, align 4
  %130 = load i64, i64* %15, align 8
  %131 = load i64, i64* %13, align 8
  %132 = mul nsw i64 %131, -15137
  %133 = add nsw i64 %130, %132
  %134 = add nsw i64 %133, 1024
  %135 = ashr i64 %134, 11
  %136 = trunc i64 %135 to i32
  %137 = load i32*, i32** %20, align 8
  %138 = getelementptr inbounds i32, i32* %137, i64 6
  store i32 %136, i32* %138, align 4
  %139 = load i64, i64* %7, align 8
  %140 = load i64, i64* %10, align 8
  %141 = add nsw i64 %139, %140
  store i64 %141, i64* %15, align 8
  %142 = load i64, i64* %8, align 8
  %143 = load i64, i64* %9, align 8
  %144 = add nsw i64 %142, %143
  store i64 %144, i64* %16, align 8
  %145 = load i64, i64* %7, align 8
  %146 = load i64, i64* %9, align 8
  %147 = add nsw i64 %145, %146
  store i64 %147, i64* %17, align 8
  %148 = load i64, i64* %8, align 8
  %149 = load i64, i64* %10, align 8
  %150 = add nsw i64 %148, %149
  store i64 %150, i64* %18, align 8
  %151 = load i64, i64* %17, align 8
  %152 = load i64, i64* %18, align 8
  %153 = add nsw i64 %151, %152
  %154 = mul nsw i64 %153, 9633
  store i64 %154, i64* %19, align 8
  %155 = load i64, i64* %7, align 8
  %156 = mul nsw i64 %155, 2446
  store i64 %156, i64* %7, align 8
  %157 = load i64, i64* %8, align 8
  %158 = mul nsw i64 %157, 16819
  store i64 %158, i64* %8, align 8
  %159 = load i64, i64* %9, align 8
  %160 = mul nsw i64 %159, 25172
  store i64 %160, i64* %9, align 8
  %161 = load i64, i64* %10, align 8
  %162 = mul nsw i64 %161, 12299
  store i64 %162, i64* %10, align 8
  %163 = load i64, i64* %15, align 8
  %164 = mul nsw i64 %163, -7373
  store i64 %164, i64* %15, align 8
  %165 = load i64, i64* %16, align 8
  %166 = mul nsw i64 %165, -20995
  store i64 %166, i64* %16, align 8
  %167 = load i64, i64* %17, align 8
  %168 = mul nsw i64 %167, -16069
  store i64 %168, i64* %17, align 8
  %169 = load i64, i64* %18, align 8
  %170 = mul nsw i64 %169, -3196
  store i64 %170, i64* %18, align 8
  %171 = load i64, i64* %19, align 8
  %172 = load i64, i64* %17, align 8
  %173 = add nsw i64 %172, %171
  store i64 %173, i64* %17, align 8
  %174 = load i64, i64* %19, align 8
  %175 = load i64, i64* %18, align 8
  %176 = add nsw i64 %175, %174
  store i64 %176, i64* %18, align 8
  %177 = load i64, i64* %7, align 8
  %178 = load i64, i64* %15, align 8
  %179 = add nsw i64 %177, %178
  %180 = load i64, i64* %17, align 8
  %181 = add nsw i64 %179, %180
  %182 = add nsw i64 %181, 1024
  %183 = ashr i64 %182, 11
  %184 = trunc i64 %183 to i32
  %185 = load i32*, i32** %20, align 8
  %186 = getelementptr inbounds i32, i32* %185, i64 7
  store i32 %184, i32* %186, align 4
  %187 = load i64, i64* %8, align 8
  %188 = load i64, i64* %16, align 8
  %189 = add nsw i64 %187, %188
  %190 = load i64, i64* %18, align 8
  %191 = add nsw i64 %189, %190
  %192 = add nsw i64 %191, 1024
  %193 = ashr i64 %192, 11
  %194 = trunc i64 %193 to i32
  %195 = load i32*, i32** %20, align 8
  %196 = getelementptr inbounds i32, i32* %195, i64 5
  store i32 %194, i32* %196, align 4
  %197 = load i64, i64* %9, align 8
  %198 = load i64, i64* %16, align 8
  %199 = add nsw i64 %197, %198
  %200 = load i64, i64* %17, align 8
  %201 = add nsw i64 %199, %200
  %202 = add nsw i64 %201, 1024
  %203 = ashr i64 %202, 11
  %204 = trunc i64 %203 to i32
  %205 = load i32*, i32** %20, align 8
  %206 = getelementptr inbounds i32, i32* %205, i64 3
  store i32 %204, i32* %206, align 4
  %207 = load i64, i64* %10, align 8
  %208 = load i64, i64* %15, align 8
  %209 = add nsw i64 %207, %208
  %210 = load i64, i64* %18, align 8
  %211 = add nsw i64 %209, %210
  %212 = add nsw i64 %211, 1024
  %213 = ashr i64 %212, 11
  %214 = trunc i64 %213 to i32
  %215 = load i32*, i32** %20, align 8
  %216 = getelementptr inbounds i32, i32* %215, i64 1
  store i32 %214, i32* %216, align 4
  %217 = load i32*, i32** %20, align 8
  %218 = getelementptr inbounds i32, i32* %217, i64 8
  store i32* %218, i32** %20, align 8
  br label %219

; <label>:219:                                    ; preds = %26
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_islow, i64 0, i64 0)
  %220 = add i64 %pgocount, 1
  store i64 %220, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_islow, i64 0, i64 0)
  %221 = load i32, i32* %21, align 4
  %222 = add nsw i32 %221, -1
  store i32 %222, i32* %21, align 4
  br label %23

; <label>:223:                                    ; preds = %23
  %224 = load i32*, i32** %2, align 8
  store i32* %224, i32** %20, align 8
  store i32 7, i32* %21, align 4
  br label %225

; <label>:225:                                    ; preds = %423, %223
  %226 = load i32, i32* %21, align 4
  %227 = icmp sge i32 %226, 0
  br i1 %227, label %228, label %427

; <label>:228:                                    ; preds = %225
  %229 = load i32*, i32** %20, align 8
  %230 = getelementptr inbounds i32, i32* %229, i64 0
  %231 = load i32, i32* %230, align 4
  %232 = load i32*, i32** %20, align 8
  %233 = getelementptr inbounds i32, i32* %232, i64 56
  %234 = load i32, i32* %233, align 4
  %235 = add nsw i32 %231, %234
  %236 = sext i32 %235 to i64
  store i64 %236, i64* %3, align 8
  %237 = load i32*, i32** %20, align 8
  %238 = getelementptr inbounds i32, i32* %237, i64 0
  %239 = load i32, i32* %238, align 4
  %240 = load i32*, i32** %20, align 8
  %241 = getelementptr inbounds i32, i32* %240, i64 56
  %242 = load i32, i32* %241, align 4
  %243 = sub nsw i32 %239, %242
  %244 = sext i32 %243 to i64
  store i64 %244, i64* %10, align 8
  %245 = load i32*, i32** %20, align 8
  %246 = getelementptr inbounds i32, i32* %245, i64 8
  %247 = load i32, i32* %246, align 4
  %248 = load i32*, i32** %20, align 8
  %249 = getelementptr inbounds i32, i32* %248, i64 48
  %250 = load i32, i32* %249, align 4
  %251 = add nsw i32 %247, %250
  %252 = sext i32 %251 to i64
  store i64 %252, i64* %4, align 8
  %253 = load i32*, i32** %20, align 8
  %254 = getelementptr inbounds i32, i32* %253, i64 8
  %255 = load i32, i32* %254, align 4
  %256 = load i32*, i32** %20, align 8
  %257 = getelementptr inbounds i32, i32* %256, i64 48
  %258 = load i32, i32* %257, align 4
  %259 = sub nsw i32 %255, %258
  %260 = sext i32 %259 to i64
  store i64 %260, i64* %9, align 8
  %261 = load i32*, i32** %20, align 8
  %262 = getelementptr inbounds i32, i32* %261, i64 16
  %263 = load i32, i32* %262, align 4
  %264 = load i32*, i32** %20, align 8
  %265 = getelementptr inbounds i32, i32* %264, i64 40
  %266 = load i32, i32* %265, align 4
  %267 = add nsw i32 %263, %266
  %268 = sext i32 %267 to i64
  store i64 %268, i64* %5, align 8
  %269 = load i32*, i32** %20, align 8
  %270 = getelementptr inbounds i32, i32* %269, i64 16
  %271 = load i32, i32* %270, align 4
  %272 = load i32*, i32** %20, align 8
  %273 = getelementptr inbounds i32, i32* %272, i64 40
  %274 = load i32, i32* %273, align 4
  %275 = sub nsw i32 %271, %274
  %276 = sext i32 %275 to i64
  store i64 %276, i64* %8, align 8
  %277 = load i32*, i32** %20, align 8
  %278 = getelementptr inbounds i32, i32* %277, i64 24
  %279 = load i32, i32* %278, align 4
  %280 = load i32*, i32** %20, align 8
  %281 = getelementptr inbounds i32, i32* %280, i64 32
  %282 = load i32, i32* %281, align 4
  %283 = add nsw i32 %279, %282
  %284 = sext i32 %283 to i64
  store i64 %284, i64* %6, align 8
  %285 = load i32*, i32** %20, align 8
  %286 = getelementptr inbounds i32, i32* %285, i64 24
  %287 = load i32, i32* %286, align 4
  %288 = load i32*, i32** %20, align 8
  %289 = getelementptr inbounds i32, i32* %288, i64 32
  %290 = load i32, i32* %289, align 4
  %291 = sub nsw i32 %287, %290
  %292 = sext i32 %291 to i64
  store i64 %292, i64* %7, align 8
  %293 = load i64, i64* %3, align 8
  %294 = load i64, i64* %6, align 8
  %295 = add nsw i64 %293, %294
  store i64 %295, i64* %11, align 8
  %296 = load i64, i64* %3, align 8
  %297 = load i64, i64* %6, align 8
  %298 = sub nsw i64 %296, %297
  store i64 %298, i64* %14, align 8
  %299 = load i64, i64* %4, align 8
  %300 = load i64, i64* %5, align 8
  %301 = add nsw i64 %299, %300
  store i64 %301, i64* %12, align 8
  %302 = load i64, i64* %4, align 8
  %303 = load i64, i64* %5, align 8
  %304 = sub nsw i64 %302, %303
  store i64 %304, i64* %13, align 8
  %305 = load i64, i64* %11, align 8
  %306 = load i64, i64* %12, align 8
  %307 = add nsw i64 %305, %306
  %308 = add nsw i64 %307, 2
  %309 = ashr i64 %308, 2
  %310 = trunc i64 %309 to i32
  %311 = load i32*, i32** %20, align 8
  %312 = getelementptr inbounds i32, i32* %311, i64 0
  store i32 %310, i32* %312, align 4
  %313 = load i64, i64* %11, align 8
  %314 = load i64, i64* %12, align 8
  %315 = sub nsw i64 %313, %314
  %316 = add nsw i64 %315, 2
  %317 = ashr i64 %316, 2
  %318 = trunc i64 %317 to i32
  %319 = load i32*, i32** %20, align 8
  %320 = getelementptr inbounds i32, i32* %319, i64 32
  store i32 %318, i32* %320, align 4
  %321 = load i64, i64* %13, align 8
  %322 = load i64, i64* %14, align 8
  %323 = add nsw i64 %321, %322
  %324 = mul nsw i64 %323, 4433
  store i64 %324, i64* %15, align 8
  %325 = load i64, i64* %15, align 8
  %326 = load i64, i64* %14, align 8
  %327 = mul nsw i64 %326, 6270
  %328 = add nsw i64 %325, %327
  %329 = add nsw i64 %328, 16384
  %330 = ashr i64 %329, 15
  %331 = trunc i64 %330 to i32
  %332 = load i32*, i32** %20, align 8
  %333 = getelementptr inbounds i32, i32* %332, i64 16
  store i32 %331, i32* %333, align 4
  %334 = load i64, i64* %15, align 8
  %335 = load i64, i64* %13, align 8
  %336 = mul nsw i64 %335, -15137
  %337 = add nsw i64 %334, %336
  %338 = add nsw i64 %337, 16384
  %339 = ashr i64 %338, 15
  %340 = trunc i64 %339 to i32
  %341 = load i32*, i32** %20, align 8
  %342 = getelementptr inbounds i32, i32* %341, i64 48
  store i32 %340, i32* %342, align 4
  %343 = load i64, i64* %7, align 8
  %344 = load i64, i64* %10, align 8
  %345 = add nsw i64 %343, %344
  store i64 %345, i64* %15, align 8
  %346 = load i64, i64* %8, align 8
  %347 = load i64, i64* %9, align 8
  %348 = add nsw i64 %346, %347
  store i64 %348, i64* %16, align 8
  %349 = load i64, i64* %7, align 8
  %350 = load i64, i64* %9, align 8
  %351 = add nsw i64 %349, %350
  store i64 %351, i64* %17, align 8
  %352 = load i64, i64* %8, align 8
  %353 = load i64, i64* %10, align 8
  %354 = add nsw i64 %352, %353
  store i64 %354, i64* %18, align 8
  %355 = load i64, i64* %17, align 8
  %356 = load i64, i64* %18, align 8
  %357 = add nsw i64 %355, %356
  %358 = mul nsw i64 %357, 9633
  store i64 %358, i64* %19, align 8
  %359 = load i64, i64* %7, align 8
  %360 = mul nsw i64 %359, 2446
  store i64 %360, i64* %7, align 8
  %361 = load i64, i64* %8, align 8
  %362 = mul nsw i64 %361, 16819
  store i64 %362, i64* %8, align 8
  %363 = load i64, i64* %9, align 8
  %364 = mul nsw i64 %363, 25172
  store i64 %364, i64* %9, align 8
  %365 = load i64, i64* %10, align 8
  %366 = mul nsw i64 %365, 12299
  store i64 %366, i64* %10, align 8
  %367 = load i64, i64* %15, align 8
  %368 = mul nsw i64 %367, -7373
  store i64 %368, i64* %15, align 8
  %369 = load i64, i64* %16, align 8
  %370 = mul nsw i64 %369, -20995
  store i64 %370, i64* %16, align 8
  %371 = load i64, i64* %17, align 8
  %372 = mul nsw i64 %371, -16069
  store i64 %372, i64* %17, align 8
  %373 = load i64, i64* %18, align 8
  %374 = mul nsw i64 %373, -3196
  store i64 %374, i64* %18, align 8
  %375 = load i64, i64* %19, align 8
  %376 = load i64, i64* %17, align 8
  %377 = add nsw i64 %376, %375
  store i64 %377, i64* %17, align 8
  %378 = load i64, i64* %19, align 8
  %379 = load i64, i64* %18, align 8
  %380 = add nsw i64 %379, %378
  store i64 %380, i64* %18, align 8
  %381 = load i64, i64* %7, align 8
  %382 = load i64, i64* %15, align 8
  %383 = add nsw i64 %381, %382
  %384 = load i64, i64* %17, align 8
  %385 = add nsw i64 %383, %384
  %386 = add nsw i64 %385, 16384
  %387 = ashr i64 %386, 15
  %388 = trunc i64 %387 to i32
  %389 = load i32*, i32** %20, align 8
  %390 = getelementptr inbounds i32, i32* %389, i64 56
  store i32 %388, i32* %390, align 4
  %391 = load i64, i64* %8, align 8
  %392 = load i64, i64* %16, align 8
  %393 = add nsw i64 %391, %392
  %394 = load i64, i64* %18, align 8
  %395 = add nsw i64 %393, %394
  %396 = add nsw i64 %395, 16384
  %397 = ashr i64 %396, 15
  %398 = trunc i64 %397 to i32
  %399 = load i32*, i32** %20, align 8
  %400 = getelementptr inbounds i32, i32* %399, i64 40
  store i32 %398, i32* %400, align 4
  %401 = load i64, i64* %9, align 8
  %402 = load i64, i64* %16, align 8
  %403 = add nsw i64 %401, %402
  %404 = load i64, i64* %17, align 8
  %405 = add nsw i64 %403, %404
  %406 = add nsw i64 %405, 16384
  %407 = ashr i64 %406, 15
  %408 = trunc i64 %407 to i32
  %409 = load i32*, i32** %20, align 8
  %410 = getelementptr inbounds i32, i32* %409, i64 24
  store i32 %408, i32* %410, align 4
  %411 = load i64, i64* %10, align 8
  %412 = load i64, i64* %15, align 8
  %413 = add nsw i64 %411, %412
  %414 = load i64, i64* %18, align 8
  %415 = add nsw i64 %413, %414
  %416 = add nsw i64 %415, 16384
  %417 = ashr i64 %416, 15
  %418 = trunc i64 %417 to i32
  %419 = load i32*, i32** %20, align 8
  %420 = getelementptr inbounds i32, i32* %419, i64 8
  store i32 %418, i32* %420, align 4
  %421 = load i32*, i32** %20, align 8
  %422 = getelementptr inbounds i32, i32* %421, i32 1
  store i32* %422, i32** %20, align 8
  br label %423

; <label>:423:                                    ; preds = %228
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_islow, i64 0, i64 1)
  %424 = add i64 %pgocount1, 1
  store i64 %424, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_islow, i64 0, i64 1)
  %425 = load i32, i32* %21, align 4
  %426 = add nsw i32 %425, -1
  store i32 %426, i32* %21, align 4
  br label %225

; <label>:427:                                    ; preds = %225
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_islow, i64 0, i64 2)
  %428 = add i64 %pgocount2, 1
  store i64 %428, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_islow, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
