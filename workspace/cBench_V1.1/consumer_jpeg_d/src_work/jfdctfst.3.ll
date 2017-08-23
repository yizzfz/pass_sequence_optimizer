; ModuleID = 'jfdctfst.2.ll'
source_filename = "jfdctfst.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_fdct_ifast = private constant [15 x i8] c"jpeg_fdct_ifast"
@__profc_jpeg_fdct_ifast = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_fdct_ifast = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2839998773475618727, i64 52028904346, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_ifast, i32 0, i32 0), i8* bitcast (void (i32*)* @jpeg_fdct_ifast to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [25 x i8] c"\0F\17x\DA\CB*HM\8FOKI.\89\CFLK,.\01\000\8F\06\1D", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_fdct_ifast to i8*), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jpeg_fdct_ifast(i32*) #0 {
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32*, align 8
  %23 = alloca i32, align 4
  store i32* %0, i32** %2, align 8
  %24 = load i32*, i32** %2, align 8
  store i32* %24, i32** %22, align 8
  store i32 7, i32* %23, align 4
  br label %25

; <label>:25:                                     ; preds = %187, %1
  %26 = load i32, i32* %23, align 4
  %27 = icmp sge i32 %26, 0
  br i1 %27, label %28, label %191

; <label>:28:                                     ; preds = %25
  %29 = load i32*, i32** %22, align 8
  %30 = getelementptr inbounds i32, i32* %29, i64 0
  %31 = load i32, i32* %30, align 4
  %32 = load i32*, i32** %22, align 8
  %33 = getelementptr inbounds i32, i32* %32, i64 7
  %34 = load i32, i32* %33, align 4
  %35 = add nsw i32 %31, %34
  store i32 %35, i32* %3, align 4
  %36 = load i32*, i32** %22, align 8
  %37 = getelementptr inbounds i32, i32* %36, i64 0
  %38 = load i32, i32* %37, align 4
  %39 = load i32*, i32** %22, align 8
  %40 = getelementptr inbounds i32, i32* %39, i64 7
  %41 = load i32, i32* %40, align 4
  %42 = sub nsw i32 %38, %41
  store i32 %42, i32* %10, align 4
  %43 = load i32*, i32** %22, align 8
  %44 = getelementptr inbounds i32, i32* %43, i64 1
  %45 = load i32, i32* %44, align 4
  %46 = load i32*, i32** %22, align 8
  %47 = getelementptr inbounds i32, i32* %46, i64 6
  %48 = load i32, i32* %47, align 4
  %49 = add nsw i32 %45, %48
  store i32 %49, i32* %4, align 4
  %50 = load i32*, i32** %22, align 8
  %51 = getelementptr inbounds i32, i32* %50, i64 1
  %52 = load i32, i32* %51, align 4
  %53 = load i32*, i32** %22, align 8
  %54 = getelementptr inbounds i32, i32* %53, i64 6
  %55 = load i32, i32* %54, align 4
  %56 = sub nsw i32 %52, %55
  store i32 %56, i32* %9, align 4
  %57 = load i32*, i32** %22, align 8
  %58 = getelementptr inbounds i32, i32* %57, i64 2
  %59 = load i32, i32* %58, align 4
  %60 = load i32*, i32** %22, align 8
  %61 = getelementptr inbounds i32, i32* %60, i64 5
  %62 = load i32, i32* %61, align 4
  %63 = add nsw i32 %59, %62
  store i32 %63, i32* %5, align 4
  %64 = load i32*, i32** %22, align 8
  %65 = getelementptr inbounds i32, i32* %64, i64 2
  %66 = load i32, i32* %65, align 4
  %67 = load i32*, i32** %22, align 8
  %68 = getelementptr inbounds i32, i32* %67, i64 5
  %69 = load i32, i32* %68, align 4
  %70 = sub nsw i32 %66, %69
  store i32 %70, i32* %8, align 4
  %71 = load i32*, i32** %22, align 8
  %72 = getelementptr inbounds i32, i32* %71, i64 3
  %73 = load i32, i32* %72, align 4
  %74 = load i32*, i32** %22, align 8
  %75 = getelementptr inbounds i32, i32* %74, i64 4
  %76 = load i32, i32* %75, align 4
  %77 = add nsw i32 %73, %76
  store i32 %77, i32* %6, align 4
  %78 = load i32*, i32** %22, align 8
  %79 = getelementptr inbounds i32, i32* %78, i64 3
  %80 = load i32, i32* %79, align 4
  %81 = load i32*, i32** %22, align 8
  %82 = getelementptr inbounds i32, i32* %81, i64 4
  %83 = load i32, i32* %82, align 4
  %84 = sub nsw i32 %80, %83
  store i32 %84, i32* %7, align 4
  %85 = load i32, i32* %3, align 4
  %86 = load i32, i32* %6, align 4
  %87 = add nsw i32 %85, %86
  store i32 %87, i32* %11, align 4
  %88 = load i32, i32* %3, align 4
  %89 = load i32, i32* %6, align 4
  %90 = sub nsw i32 %88, %89
  store i32 %90, i32* %14, align 4
  %91 = load i32, i32* %4, align 4
  %92 = load i32, i32* %5, align 4
  %93 = add nsw i32 %91, %92
  store i32 %93, i32* %12, align 4
  %94 = load i32, i32* %4, align 4
  %95 = load i32, i32* %5, align 4
  %96 = sub nsw i32 %94, %95
  store i32 %96, i32* %13, align 4
  %97 = load i32, i32* %11, align 4
  %98 = load i32, i32* %12, align 4
  %99 = add nsw i32 %97, %98
  %100 = load i32*, i32** %22, align 8
  %101 = getelementptr inbounds i32, i32* %100, i64 0
  store i32 %99, i32* %101, align 4
  %102 = load i32, i32* %11, align 4
  %103 = load i32, i32* %12, align 4
  %104 = sub nsw i32 %102, %103
  %105 = load i32*, i32** %22, align 8
  %106 = getelementptr inbounds i32, i32* %105, i64 4
  store i32 %104, i32* %106, align 4
  %107 = load i32, i32* %13, align 4
  %108 = load i32, i32* %14, align 4
  %109 = add nsw i32 %107, %108
  %110 = sext i32 %109 to i64
  %111 = mul nsw i64 %110, 181
  %112 = ashr i64 %111, 8
  %113 = trunc i64 %112 to i32
  store i32 %113, i32* %15, align 4
  %114 = load i32, i32* %14, align 4
  %115 = load i32, i32* %15, align 4
  %116 = add nsw i32 %114, %115
  %117 = load i32*, i32** %22, align 8
  %118 = getelementptr inbounds i32, i32* %117, i64 2
  store i32 %116, i32* %118, align 4
  %119 = load i32, i32* %14, align 4
  %120 = load i32, i32* %15, align 4
  %121 = sub nsw i32 %119, %120
  %122 = load i32*, i32** %22, align 8
  %123 = getelementptr inbounds i32, i32* %122, i64 6
  store i32 %121, i32* %123, align 4
  %124 = load i32, i32* %7, align 4
  %125 = load i32, i32* %8, align 4
  %126 = add nsw i32 %124, %125
  store i32 %126, i32* %11, align 4
  %127 = load i32, i32* %8, align 4
  %128 = load i32, i32* %9, align 4
  %129 = add nsw i32 %127, %128
  store i32 %129, i32* %12, align 4
  %130 = load i32, i32* %9, align 4
  %131 = load i32, i32* %10, align 4
  %132 = add nsw i32 %130, %131
  store i32 %132, i32* %13, align 4
  %133 = load i32, i32* %11, align 4
  %134 = load i32, i32* %13, align 4
  %135 = sub nsw i32 %133, %134
  %136 = sext i32 %135 to i64
  %137 = mul nsw i64 %136, 98
  %138 = ashr i64 %137, 8
  %139 = trunc i64 %138 to i32
  store i32 %139, i32* %19, align 4
  %140 = load i32, i32* %11, align 4
  %141 = sext i32 %140 to i64
  %142 = mul nsw i64 %141, 139
  %143 = ashr i64 %142, 8
  %144 = trunc i64 %143 to i32
  %145 = load i32, i32* %19, align 4
  %146 = add nsw i32 %144, %145
  store i32 %146, i32* %16, align 4
  %147 = load i32, i32* %13, align 4
  %148 = sext i32 %147 to i64
  %149 = mul nsw i64 %148, 334
  %150 = ashr i64 %149, 8
  %151 = trunc i64 %150 to i32
  %152 = load i32, i32* %19, align 4
  %153 = add nsw i32 %151, %152
  store i32 %153, i32* %18, align 4
  %154 = load i32, i32* %12, align 4
  %155 = sext i32 %154 to i64
  %156 = mul nsw i64 %155, 181
  %157 = ashr i64 %156, 8
  %158 = trunc i64 %157 to i32
  store i32 %158, i32* %17, align 4
  %159 = load i32, i32* %10, align 4
  %160 = load i32, i32* %17, align 4
  %161 = add nsw i32 %159, %160
  store i32 %161, i32* %20, align 4
  %162 = load i32, i32* %10, align 4
  %163 = load i32, i32* %17, align 4
  %164 = sub nsw i32 %162, %163
  store i32 %164, i32* %21, align 4
  %165 = load i32, i32* %21, align 4
  %166 = load i32, i32* %16, align 4
  %167 = add nsw i32 %165, %166
  %168 = load i32*, i32** %22, align 8
  %169 = getelementptr inbounds i32, i32* %168, i64 5
  store i32 %167, i32* %169, align 4
  %170 = load i32, i32* %21, align 4
  %171 = load i32, i32* %16, align 4
  %172 = sub nsw i32 %170, %171
  %173 = load i32*, i32** %22, align 8
  %174 = getelementptr inbounds i32, i32* %173, i64 3
  store i32 %172, i32* %174, align 4
  %175 = load i32, i32* %20, align 4
  %176 = load i32, i32* %18, align 4
  %177 = add nsw i32 %175, %176
  %178 = load i32*, i32** %22, align 8
  %179 = getelementptr inbounds i32, i32* %178, i64 1
  store i32 %177, i32* %179, align 4
  %180 = load i32, i32* %20, align 4
  %181 = load i32, i32* %18, align 4
  %182 = sub nsw i32 %180, %181
  %183 = load i32*, i32** %22, align 8
  %184 = getelementptr inbounds i32, i32* %183, i64 7
  store i32 %182, i32* %184, align 4
  %185 = load i32*, i32** %22, align 8
  %186 = getelementptr inbounds i32, i32* %185, i64 8
  store i32* %186, i32** %22, align 8
  br label %187

; <label>:187:                                    ; preds = %28
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_ifast, i64 0, i64 0)
  %188 = add i64 %pgocount, 1
  store i64 %188, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_ifast, i64 0, i64 0)
  %189 = load i32, i32* %23, align 4
  %190 = add nsw i32 %189, -1
  store i32 %190, i32* %23, align 4
  br label %25

; <label>:191:                                    ; preds = %25
  %192 = load i32*, i32** %2, align 8
  store i32* %192, i32** %22, align 8
  store i32 7, i32* %23, align 4
  br label %193

; <label>:193:                                    ; preds = %355, %191
  %194 = load i32, i32* %23, align 4
  %195 = icmp sge i32 %194, 0
  br i1 %195, label %196, label %359

; <label>:196:                                    ; preds = %193
  %197 = load i32*, i32** %22, align 8
  %198 = getelementptr inbounds i32, i32* %197, i64 0
  %199 = load i32, i32* %198, align 4
  %200 = load i32*, i32** %22, align 8
  %201 = getelementptr inbounds i32, i32* %200, i64 56
  %202 = load i32, i32* %201, align 4
  %203 = add nsw i32 %199, %202
  store i32 %203, i32* %3, align 4
  %204 = load i32*, i32** %22, align 8
  %205 = getelementptr inbounds i32, i32* %204, i64 0
  %206 = load i32, i32* %205, align 4
  %207 = load i32*, i32** %22, align 8
  %208 = getelementptr inbounds i32, i32* %207, i64 56
  %209 = load i32, i32* %208, align 4
  %210 = sub nsw i32 %206, %209
  store i32 %210, i32* %10, align 4
  %211 = load i32*, i32** %22, align 8
  %212 = getelementptr inbounds i32, i32* %211, i64 8
  %213 = load i32, i32* %212, align 4
  %214 = load i32*, i32** %22, align 8
  %215 = getelementptr inbounds i32, i32* %214, i64 48
  %216 = load i32, i32* %215, align 4
  %217 = add nsw i32 %213, %216
  store i32 %217, i32* %4, align 4
  %218 = load i32*, i32** %22, align 8
  %219 = getelementptr inbounds i32, i32* %218, i64 8
  %220 = load i32, i32* %219, align 4
  %221 = load i32*, i32** %22, align 8
  %222 = getelementptr inbounds i32, i32* %221, i64 48
  %223 = load i32, i32* %222, align 4
  %224 = sub nsw i32 %220, %223
  store i32 %224, i32* %9, align 4
  %225 = load i32*, i32** %22, align 8
  %226 = getelementptr inbounds i32, i32* %225, i64 16
  %227 = load i32, i32* %226, align 4
  %228 = load i32*, i32** %22, align 8
  %229 = getelementptr inbounds i32, i32* %228, i64 40
  %230 = load i32, i32* %229, align 4
  %231 = add nsw i32 %227, %230
  store i32 %231, i32* %5, align 4
  %232 = load i32*, i32** %22, align 8
  %233 = getelementptr inbounds i32, i32* %232, i64 16
  %234 = load i32, i32* %233, align 4
  %235 = load i32*, i32** %22, align 8
  %236 = getelementptr inbounds i32, i32* %235, i64 40
  %237 = load i32, i32* %236, align 4
  %238 = sub nsw i32 %234, %237
  store i32 %238, i32* %8, align 4
  %239 = load i32*, i32** %22, align 8
  %240 = getelementptr inbounds i32, i32* %239, i64 24
  %241 = load i32, i32* %240, align 4
  %242 = load i32*, i32** %22, align 8
  %243 = getelementptr inbounds i32, i32* %242, i64 32
  %244 = load i32, i32* %243, align 4
  %245 = add nsw i32 %241, %244
  store i32 %245, i32* %6, align 4
  %246 = load i32*, i32** %22, align 8
  %247 = getelementptr inbounds i32, i32* %246, i64 24
  %248 = load i32, i32* %247, align 4
  %249 = load i32*, i32** %22, align 8
  %250 = getelementptr inbounds i32, i32* %249, i64 32
  %251 = load i32, i32* %250, align 4
  %252 = sub nsw i32 %248, %251
  store i32 %252, i32* %7, align 4
  %253 = load i32, i32* %3, align 4
  %254 = load i32, i32* %6, align 4
  %255 = add nsw i32 %253, %254
  store i32 %255, i32* %11, align 4
  %256 = load i32, i32* %3, align 4
  %257 = load i32, i32* %6, align 4
  %258 = sub nsw i32 %256, %257
  store i32 %258, i32* %14, align 4
  %259 = load i32, i32* %4, align 4
  %260 = load i32, i32* %5, align 4
  %261 = add nsw i32 %259, %260
  store i32 %261, i32* %12, align 4
  %262 = load i32, i32* %4, align 4
  %263 = load i32, i32* %5, align 4
  %264 = sub nsw i32 %262, %263
  store i32 %264, i32* %13, align 4
  %265 = load i32, i32* %11, align 4
  %266 = load i32, i32* %12, align 4
  %267 = add nsw i32 %265, %266
  %268 = load i32*, i32** %22, align 8
  %269 = getelementptr inbounds i32, i32* %268, i64 0
  store i32 %267, i32* %269, align 4
  %270 = load i32, i32* %11, align 4
  %271 = load i32, i32* %12, align 4
  %272 = sub nsw i32 %270, %271
  %273 = load i32*, i32** %22, align 8
  %274 = getelementptr inbounds i32, i32* %273, i64 32
  store i32 %272, i32* %274, align 4
  %275 = load i32, i32* %13, align 4
  %276 = load i32, i32* %14, align 4
  %277 = add nsw i32 %275, %276
  %278 = sext i32 %277 to i64
  %279 = mul nsw i64 %278, 181
  %280 = ashr i64 %279, 8
  %281 = trunc i64 %280 to i32
  store i32 %281, i32* %15, align 4
  %282 = load i32, i32* %14, align 4
  %283 = load i32, i32* %15, align 4
  %284 = add nsw i32 %282, %283
  %285 = load i32*, i32** %22, align 8
  %286 = getelementptr inbounds i32, i32* %285, i64 16
  store i32 %284, i32* %286, align 4
  %287 = load i32, i32* %14, align 4
  %288 = load i32, i32* %15, align 4
  %289 = sub nsw i32 %287, %288
  %290 = load i32*, i32** %22, align 8
  %291 = getelementptr inbounds i32, i32* %290, i64 48
  store i32 %289, i32* %291, align 4
  %292 = load i32, i32* %7, align 4
  %293 = load i32, i32* %8, align 4
  %294 = add nsw i32 %292, %293
  store i32 %294, i32* %11, align 4
  %295 = load i32, i32* %8, align 4
  %296 = load i32, i32* %9, align 4
  %297 = add nsw i32 %295, %296
  store i32 %297, i32* %12, align 4
  %298 = load i32, i32* %9, align 4
  %299 = load i32, i32* %10, align 4
  %300 = add nsw i32 %298, %299
  store i32 %300, i32* %13, align 4
  %301 = load i32, i32* %11, align 4
  %302 = load i32, i32* %13, align 4
  %303 = sub nsw i32 %301, %302
  %304 = sext i32 %303 to i64
  %305 = mul nsw i64 %304, 98
  %306 = ashr i64 %305, 8
  %307 = trunc i64 %306 to i32
  store i32 %307, i32* %19, align 4
  %308 = load i32, i32* %11, align 4
  %309 = sext i32 %308 to i64
  %310 = mul nsw i64 %309, 139
  %311 = ashr i64 %310, 8
  %312 = trunc i64 %311 to i32
  %313 = load i32, i32* %19, align 4
  %314 = add nsw i32 %312, %313
  store i32 %314, i32* %16, align 4
  %315 = load i32, i32* %13, align 4
  %316 = sext i32 %315 to i64
  %317 = mul nsw i64 %316, 334
  %318 = ashr i64 %317, 8
  %319 = trunc i64 %318 to i32
  %320 = load i32, i32* %19, align 4
  %321 = add nsw i32 %319, %320
  store i32 %321, i32* %18, align 4
  %322 = load i32, i32* %12, align 4
  %323 = sext i32 %322 to i64
  %324 = mul nsw i64 %323, 181
  %325 = ashr i64 %324, 8
  %326 = trunc i64 %325 to i32
  store i32 %326, i32* %17, align 4
  %327 = load i32, i32* %10, align 4
  %328 = load i32, i32* %17, align 4
  %329 = add nsw i32 %327, %328
  store i32 %329, i32* %20, align 4
  %330 = load i32, i32* %10, align 4
  %331 = load i32, i32* %17, align 4
  %332 = sub nsw i32 %330, %331
  store i32 %332, i32* %21, align 4
  %333 = load i32, i32* %21, align 4
  %334 = load i32, i32* %16, align 4
  %335 = add nsw i32 %333, %334
  %336 = load i32*, i32** %22, align 8
  %337 = getelementptr inbounds i32, i32* %336, i64 40
  store i32 %335, i32* %337, align 4
  %338 = load i32, i32* %21, align 4
  %339 = load i32, i32* %16, align 4
  %340 = sub nsw i32 %338, %339
  %341 = load i32*, i32** %22, align 8
  %342 = getelementptr inbounds i32, i32* %341, i64 24
  store i32 %340, i32* %342, align 4
  %343 = load i32, i32* %20, align 4
  %344 = load i32, i32* %18, align 4
  %345 = add nsw i32 %343, %344
  %346 = load i32*, i32** %22, align 8
  %347 = getelementptr inbounds i32, i32* %346, i64 8
  store i32 %345, i32* %347, align 4
  %348 = load i32, i32* %20, align 4
  %349 = load i32, i32* %18, align 4
  %350 = sub nsw i32 %348, %349
  %351 = load i32*, i32** %22, align 8
  %352 = getelementptr inbounds i32, i32* %351, i64 56
  store i32 %350, i32* %352, align 4
  %353 = load i32*, i32** %22, align 8
  %354 = getelementptr inbounds i32, i32* %353, i32 1
  store i32* %354, i32** %22, align 8
  br label %355

; <label>:355:                                    ; preds = %196
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_ifast, i64 0, i64 1)
  %356 = add i64 %pgocount1, 1
  store i64 %356, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_ifast, i64 0, i64 1)
  %357 = load i32, i32* %23, align 4
  %358 = add nsw i32 %357, -1
  store i32 %358, i32* %23, align 4
  br label %193

; <label>:359:                                    ; preds = %193
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_ifast, i64 0, i64 2)
  %360 = add i64 %pgocount2, 1
  store i64 %360, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_ifast, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
