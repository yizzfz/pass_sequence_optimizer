; ModuleID = 'gsm_encode.2.ll'
source_filename = "gsm_encode.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_gsm_encode = private constant [10 x i8] c"gsm_encode"
@__profc_gsm_encode = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_encode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2409489726339922017, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_gsm_encode, i32 0, i32 0), i8* bitcast (void (%struct.gsm_state*, i16*, i8*)* @gsm_encode to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [20 x i8] c"\0A\12x\DAK/\CE\8DO\CDK\CEOI\05\00\16\A6\04\15", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_encode to i8*), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @gsm_encode(%struct.gsm_state*, i16*, i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_gsm_encode, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_gsm_encode, i64 0, i64 0)
  %5 = alloca %struct.gsm_state*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca [8 x i16], align 16
  %9 = alloca [4 x i16], align 2
  %10 = alloca [4 x i16], align 2
  %11 = alloca [4 x i16], align 2
  %12 = alloca [4 x i16], align 2
  %13 = alloca [52 x i16], align 16
  store %struct.gsm_state* %0, %struct.gsm_state** %5, align 8
  store i16* %1, i16** %6, align 8
  store i8* %2, i8** %7, align 8
  %14 = load %struct.gsm_state*, %struct.gsm_state** %5, align 8
  %15 = load i16*, i16** %6, align 8
  %16 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i32 0, i32 0
  %17 = getelementptr inbounds [4 x i16], [4 x i16]* %9, i32 0, i32 0
  %18 = getelementptr inbounds [4 x i16], [4 x i16]* %11, i32 0, i32 0
  %19 = getelementptr inbounds [4 x i16], [4 x i16]* %10, i32 0, i32 0
  %20 = getelementptr inbounds [4 x i16], [4 x i16]* %12, i32 0, i32 0
  %21 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i32 0, i32 0
  call void @Gsm_Coder(%struct.gsm_state* %14, i16* %15, i16* %16, i16* %17, i16* %18, i16* %19, i16* %20, i16* %21)
  %22 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 0
  %23 = load i16, i16* %22, align 16
  %24 = sext i16 %23 to i32
  %25 = ashr i32 %24, 2
  %26 = and i32 %25, 15
  %27 = or i32 208, %26
  %28 = trunc i32 %27 to i8
  %29 = load i8*, i8** %7, align 8
  %30 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %30, i8** %7, align 8
  store i8 %28, i8* %29, align 1
  %31 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 0
  %32 = load i16, i16* %31, align 16
  %33 = sext i16 %32 to i32
  %34 = and i32 %33, 3
  %35 = shl i32 %34, 6
  %36 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 1
  %37 = load i16, i16* %36, align 2
  %38 = sext i16 %37 to i32
  %39 = and i32 %38, 63
  %40 = or i32 %35, %39
  %41 = trunc i32 %40 to i8
  %42 = load i8*, i8** %7, align 8
  %43 = getelementptr inbounds i8, i8* %42, i32 1
  store i8* %43, i8** %7, align 8
  store i8 %41, i8* %42, align 1
  %44 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 2
  %45 = load i16, i16* %44, align 4
  %46 = sext i16 %45 to i32
  %47 = and i32 %46, 31
  %48 = shl i32 %47, 3
  %49 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 3
  %50 = load i16, i16* %49, align 2
  %51 = sext i16 %50 to i32
  %52 = ashr i32 %51, 2
  %53 = and i32 %52, 7
  %54 = or i32 %48, %53
  %55 = trunc i32 %54 to i8
  %56 = load i8*, i8** %7, align 8
  %57 = getelementptr inbounds i8, i8* %56, i32 1
  store i8* %57, i8** %7, align 8
  store i8 %55, i8* %56, align 1
  %58 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 3
  %59 = load i16, i16* %58, align 2
  %60 = sext i16 %59 to i32
  %61 = and i32 %60, 3
  %62 = shl i32 %61, 6
  %63 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 4
  %64 = load i16, i16* %63, align 8
  %65 = sext i16 %64 to i32
  %66 = and i32 %65, 15
  %67 = shl i32 %66, 2
  %68 = or i32 %62, %67
  %69 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 5
  %70 = load i16, i16* %69, align 2
  %71 = sext i16 %70 to i32
  %72 = ashr i32 %71, 2
  %73 = and i32 %72, 3
  %74 = or i32 %68, %73
  %75 = trunc i32 %74 to i8
  %76 = load i8*, i8** %7, align 8
  %77 = getelementptr inbounds i8, i8* %76, i32 1
  store i8* %77, i8** %7, align 8
  store i8 %75, i8* %76, align 1
  %78 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 5
  %79 = load i16, i16* %78, align 2
  %80 = sext i16 %79 to i32
  %81 = and i32 %80, 3
  %82 = shl i32 %81, 6
  %83 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 6
  %84 = load i16, i16* %83, align 4
  %85 = sext i16 %84 to i32
  %86 = and i32 %85, 7
  %87 = shl i32 %86, 3
  %88 = or i32 %82, %87
  %89 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 7
  %90 = load i16, i16* %89, align 2
  %91 = sext i16 %90 to i32
  %92 = and i32 %91, 7
  %93 = or i32 %88, %92
  %94 = trunc i32 %93 to i8
  %95 = load i8*, i8** %7, align 8
  %96 = getelementptr inbounds i8, i8* %95, i32 1
  store i8* %96, i8** %7, align 8
  store i8 %94, i8* %95, align 1
  %97 = getelementptr inbounds [4 x i16], [4 x i16]* %9, i64 0, i64 0
  %98 = load i16, i16* %97, align 2
  %99 = sext i16 %98 to i32
  %100 = and i32 %99, 127
  %101 = shl i32 %100, 1
  %102 = getelementptr inbounds [4 x i16], [4 x i16]* %11, i64 0, i64 0
  %103 = load i16, i16* %102, align 2
  %104 = sext i16 %103 to i32
  %105 = ashr i32 %104, 1
  %106 = and i32 %105, 1
  %107 = or i32 %101, %106
  %108 = trunc i32 %107 to i8
  %109 = load i8*, i8** %7, align 8
  %110 = getelementptr inbounds i8, i8* %109, i32 1
  store i8* %110, i8** %7, align 8
  store i8 %108, i8* %109, align 1
  %111 = getelementptr inbounds [4 x i16], [4 x i16]* %11, i64 0, i64 0
  %112 = load i16, i16* %111, align 2
  %113 = sext i16 %112 to i32
  %114 = and i32 %113, 1
  %115 = shl i32 %114, 7
  %116 = getelementptr inbounds [4 x i16], [4 x i16]* %10, i64 0, i64 0
  %117 = load i16, i16* %116, align 2
  %118 = sext i16 %117 to i32
  %119 = and i32 %118, 3
  %120 = shl i32 %119, 5
  %121 = or i32 %115, %120
  %122 = getelementptr inbounds [4 x i16], [4 x i16]* %12, i64 0, i64 0
  %123 = load i16, i16* %122, align 2
  %124 = sext i16 %123 to i32
  %125 = ashr i32 %124, 1
  %126 = and i32 %125, 31
  %127 = or i32 %121, %126
  %128 = trunc i32 %127 to i8
  %129 = load i8*, i8** %7, align 8
  %130 = getelementptr inbounds i8, i8* %129, i32 1
  store i8* %130, i8** %7, align 8
  store i8 %128, i8* %129, align 1
  %131 = getelementptr inbounds [4 x i16], [4 x i16]* %12, i64 0, i64 0
  %132 = load i16, i16* %131, align 2
  %133 = sext i16 %132 to i32
  %134 = and i32 %133, 1
  %135 = shl i32 %134, 7
  %136 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 0
  %137 = load i16, i16* %136, align 16
  %138 = sext i16 %137 to i32
  %139 = and i32 %138, 7
  %140 = shl i32 %139, 4
  %141 = or i32 %135, %140
  %142 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 1
  %143 = load i16, i16* %142, align 2
  %144 = sext i16 %143 to i32
  %145 = and i32 %144, 7
  %146 = shl i32 %145, 1
  %147 = or i32 %141, %146
  %148 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 2
  %149 = load i16, i16* %148, align 4
  %150 = sext i16 %149 to i32
  %151 = ashr i32 %150, 2
  %152 = and i32 %151, 1
  %153 = or i32 %147, %152
  %154 = trunc i32 %153 to i8
  %155 = load i8*, i8** %7, align 8
  %156 = getelementptr inbounds i8, i8* %155, i32 1
  store i8* %156, i8** %7, align 8
  store i8 %154, i8* %155, align 1
  %157 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 2
  %158 = load i16, i16* %157, align 4
  %159 = sext i16 %158 to i32
  %160 = and i32 %159, 3
  %161 = shl i32 %160, 6
  %162 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 3
  %163 = load i16, i16* %162, align 2
  %164 = sext i16 %163 to i32
  %165 = and i32 %164, 7
  %166 = shl i32 %165, 3
  %167 = or i32 %161, %166
  %168 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 4
  %169 = load i16, i16* %168, align 8
  %170 = sext i16 %169 to i32
  %171 = and i32 %170, 7
  %172 = or i32 %167, %171
  %173 = trunc i32 %172 to i8
  %174 = load i8*, i8** %7, align 8
  %175 = getelementptr inbounds i8, i8* %174, i32 1
  store i8* %175, i8** %7, align 8
  store i8 %173, i8* %174, align 1
  %176 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 5
  %177 = load i16, i16* %176, align 2
  %178 = sext i16 %177 to i32
  %179 = and i32 %178, 7
  %180 = shl i32 %179, 5
  %181 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 6
  %182 = load i16, i16* %181, align 4
  %183 = sext i16 %182 to i32
  %184 = and i32 %183, 7
  %185 = shl i32 %184, 2
  %186 = or i32 %180, %185
  %187 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 7
  %188 = load i16, i16* %187, align 2
  %189 = sext i16 %188 to i32
  %190 = ashr i32 %189, 1
  %191 = and i32 %190, 3
  %192 = or i32 %186, %191
  %193 = trunc i32 %192 to i8
  %194 = load i8*, i8** %7, align 8
  %195 = getelementptr inbounds i8, i8* %194, i32 1
  store i8* %195, i8** %7, align 8
  store i8 %193, i8* %194, align 1
  %196 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 7
  %197 = load i16, i16* %196, align 2
  %198 = sext i16 %197 to i32
  %199 = and i32 %198, 1
  %200 = shl i32 %199, 7
  %201 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 8
  %202 = load i16, i16* %201, align 16
  %203 = sext i16 %202 to i32
  %204 = and i32 %203, 7
  %205 = shl i32 %204, 4
  %206 = or i32 %200, %205
  %207 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 9
  %208 = load i16, i16* %207, align 2
  %209 = sext i16 %208 to i32
  %210 = and i32 %209, 7
  %211 = shl i32 %210, 1
  %212 = or i32 %206, %211
  %213 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 10
  %214 = load i16, i16* %213, align 4
  %215 = sext i16 %214 to i32
  %216 = ashr i32 %215, 2
  %217 = and i32 %216, 1
  %218 = or i32 %212, %217
  %219 = trunc i32 %218 to i8
  %220 = load i8*, i8** %7, align 8
  %221 = getelementptr inbounds i8, i8* %220, i32 1
  store i8* %221, i8** %7, align 8
  store i8 %219, i8* %220, align 1
  %222 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 10
  %223 = load i16, i16* %222, align 4
  %224 = sext i16 %223 to i32
  %225 = and i32 %224, 3
  %226 = shl i32 %225, 6
  %227 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 11
  %228 = load i16, i16* %227, align 2
  %229 = sext i16 %228 to i32
  %230 = and i32 %229, 7
  %231 = shl i32 %230, 3
  %232 = or i32 %226, %231
  %233 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 12
  %234 = load i16, i16* %233, align 8
  %235 = sext i16 %234 to i32
  %236 = and i32 %235, 7
  %237 = or i32 %232, %236
  %238 = trunc i32 %237 to i8
  %239 = load i8*, i8** %7, align 8
  %240 = getelementptr inbounds i8, i8* %239, i32 1
  store i8* %240, i8** %7, align 8
  store i8 %238, i8* %239, align 1
  %241 = getelementptr inbounds [4 x i16], [4 x i16]* %9, i64 0, i64 1
  %242 = load i16, i16* %241, align 2
  %243 = sext i16 %242 to i32
  %244 = and i32 %243, 127
  %245 = shl i32 %244, 1
  %246 = getelementptr inbounds [4 x i16], [4 x i16]* %11, i64 0, i64 1
  %247 = load i16, i16* %246, align 2
  %248 = sext i16 %247 to i32
  %249 = ashr i32 %248, 1
  %250 = and i32 %249, 1
  %251 = or i32 %245, %250
  %252 = trunc i32 %251 to i8
  %253 = load i8*, i8** %7, align 8
  %254 = getelementptr inbounds i8, i8* %253, i32 1
  store i8* %254, i8** %7, align 8
  store i8 %252, i8* %253, align 1
  %255 = getelementptr inbounds [4 x i16], [4 x i16]* %11, i64 0, i64 1
  %256 = load i16, i16* %255, align 2
  %257 = sext i16 %256 to i32
  %258 = and i32 %257, 1
  %259 = shl i32 %258, 7
  %260 = getelementptr inbounds [4 x i16], [4 x i16]* %10, i64 0, i64 1
  %261 = load i16, i16* %260, align 2
  %262 = sext i16 %261 to i32
  %263 = and i32 %262, 3
  %264 = shl i32 %263, 5
  %265 = or i32 %259, %264
  %266 = getelementptr inbounds [4 x i16], [4 x i16]* %12, i64 0, i64 1
  %267 = load i16, i16* %266, align 2
  %268 = sext i16 %267 to i32
  %269 = ashr i32 %268, 1
  %270 = and i32 %269, 31
  %271 = or i32 %265, %270
  %272 = trunc i32 %271 to i8
  %273 = load i8*, i8** %7, align 8
  %274 = getelementptr inbounds i8, i8* %273, i32 1
  store i8* %274, i8** %7, align 8
  store i8 %272, i8* %273, align 1
  %275 = getelementptr inbounds [4 x i16], [4 x i16]* %12, i64 0, i64 1
  %276 = load i16, i16* %275, align 2
  %277 = sext i16 %276 to i32
  %278 = and i32 %277, 1
  %279 = shl i32 %278, 7
  %280 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 13
  %281 = load i16, i16* %280, align 2
  %282 = sext i16 %281 to i32
  %283 = and i32 %282, 7
  %284 = shl i32 %283, 4
  %285 = or i32 %279, %284
  %286 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 14
  %287 = load i16, i16* %286, align 4
  %288 = sext i16 %287 to i32
  %289 = and i32 %288, 7
  %290 = shl i32 %289, 1
  %291 = or i32 %285, %290
  %292 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 15
  %293 = load i16, i16* %292, align 2
  %294 = sext i16 %293 to i32
  %295 = ashr i32 %294, 2
  %296 = and i32 %295, 1
  %297 = or i32 %291, %296
  %298 = trunc i32 %297 to i8
  %299 = load i8*, i8** %7, align 8
  %300 = getelementptr inbounds i8, i8* %299, i32 1
  store i8* %300, i8** %7, align 8
  store i8 %298, i8* %299, align 1
  %301 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 15
  %302 = load i16, i16* %301, align 2
  %303 = sext i16 %302 to i32
  %304 = and i32 %303, 3
  %305 = shl i32 %304, 6
  %306 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 16
  %307 = load i16, i16* %306, align 16
  %308 = sext i16 %307 to i32
  %309 = and i32 %308, 7
  %310 = shl i32 %309, 3
  %311 = or i32 %305, %310
  %312 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 17
  %313 = load i16, i16* %312, align 2
  %314 = sext i16 %313 to i32
  %315 = and i32 %314, 7
  %316 = or i32 %311, %315
  %317 = trunc i32 %316 to i8
  %318 = load i8*, i8** %7, align 8
  %319 = getelementptr inbounds i8, i8* %318, i32 1
  store i8* %319, i8** %7, align 8
  store i8 %317, i8* %318, align 1
  %320 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 18
  %321 = load i16, i16* %320, align 4
  %322 = sext i16 %321 to i32
  %323 = and i32 %322, 7
  %324 = shl i32 %323, 5
  %325 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 19
  %326 = load i16, i16* %325, align 2
  %327 = sext i16 %326 to i32
  %328 = and i32 %327, 7
  %329 = shl i32 %328, 2
  %330 = or i32 %324, %329
  %331 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 20
  %332 = load i16, i16* %331, align 8
  %333 = sext i16 %332 to i32
  %334 = ashr i32 %333, 1
  %335 = and i32 %334, 3
  %336 = or i32 %330, %335
  %337 = trunc i32 %336 to i8
  %338 = load i8*, i8** %7, align 8
  %339 = getelementptr inbounds i8, i8* %338, i32 1
  store i8* %339, i8** %7, align 8
  store i8 %337, i8* %338, align 1
  %340 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 20
  %341 = load i16, i16* %340, align 8
  %342 = sext i16 %341 to i32
  %343 = and i32 %342, 1
  %344 = shl i32 %343, 7
  %345 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 21
  %346 = load i16, i16* %345, align 2
  %347 = sext i16 %346 to i32
  %348 = and i32 %347, 7
  %349 = shl i32 %348, 4
  %350 = or i32 %344, %349
  %351 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 22
  %352 = load i16, i16* %351, align 4
  %353 = sext i16 %352 to i32
  %354 = and i32 %353, 7
  %355 = shl i32 %354, 1
  %356 = or i32 %350, %355
  %357 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 23
  %358 = load i16, i16* %357, align 2
  %359 = sext i16 %358 to i32
  %360 = ashr i32 %359, 2
  %361 = and i32 %360, 1
  %362 = or i32 %356, %361
  %363 = trunc i32 %362 to i8
  %364 = load i8*, i8** %7, align 8
  %365 = getelementptr inbounds i8, i8* %364, i32 1
  store i8* %365, i8** %7, align 8
  store i8 %363, i8* %364, align 1
  %366 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 23
  %367 = load i16, i16* %366, align 2
  %368 = sext i16 %367 to i32
  %369 = and i32 %368, 3
  %370 = shl i32 %369, 6
  %371 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 24
  %372 = load i16, i16* %371, align 16
  %373 = sext i16 %372 to i32
  %374 = and i32 %373, 7
  %375 = shl i32 %374, 3
  %376 = or i32 %370, %375
  %377 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 25
  %378 = load i16, i16* %377, align 2
  %379 = sext i16 %378 to i32
  %380 = and i32 %379, 7
  %381 = or i32 %376, %380
  %382 = trunc i32 %381 to i8
  %383 = load i8*, i8** %7, align 8
  %384 = getelementptr inbounds i8, i8* %383, i32 1
  store i8* %384, i8** %7, align 8
  store i8 %382, i8* %383, align 1
  %385 = getelementptr inbounds [4 x i16], [4 x i16]* %9, i64 0, i64 2
  %386 = load i16, i16* %385, align 2
  %387 = sext i16 %386 to i32
  %388 = and i32 %387, 127
  %389 = shl i32 %388, 1
  %390 = getelementptr inbounds [4 x i16], [4 x i16]* %11, i64 0, i64 2
  %391 = load i16, i16* %390, align 2
  %392 = sext i16 %391 to i32
  %393 = ashr i32 %392, 1
  %394 = and i32 %393, 1
  %395 = or i32 %389, %394
  %396 = trunc i32 %395 to i8
  %397 = load i8*, i8** %7, align 8
  %398 = getelementptr inbounds i8, i8* %397, i32 1
  store i8* %398, i8** %7, align 8
  store i8 %396, i8* %397, align 1
  %399 = getelementptr inbounds [4 x i16], [4 x i16]* %11, i64 0, i64 2
  %400 = load i16, i16* %399, align 2
  %401 = sext i16 %400 to i32
  %402 = and i32 %401, 1
  %403 = shl i32 %402, 7
  %404 = getelementptr inbounds [4 x i16], [4 x i16]* %10, i64 0, i64 2
  %405 = load i16, i16* %404, align 2
  %406 = sext i16 %405 to i32
  %407 = and i32 %406, 3
  %408 = shl i32 %407, 5
  %409 = or i32 %403, %408
  %410 = getelementptr inbounds [4 x i16], [4 x i16]* %12, i64 0, i64 2
  %411 = load i16, i16* %410, align 2
  %412 = sext i16 %411 to i32
  %413 = ashr i32 %412, 1
  %414 = and i32 %413, 31
  %415 = or i32 %409, %414
  %416 = trunc i32 %415 to i8
  %417 = load i8*, i8** %7, align 8
  %418 = getelementptr inbounds i8, i8* %417, i32 1
  store i8* %418, i8** %7, align 8
  store i8 %416, i8* %417, align 1
  %419 = getelementptr inbounds [4 x i16], [4 x i16]* %12, i64 0, i64 2
  %420 = load i16, i16* %419, align 2
  %421 = sext i16 %420 to i32
  %422 = and i32 %421, 1
  %423 = shl i32 %422, 7
  %424 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 26
  %425 = load i16, i16* %424, align 4
  %426 = sext i16 %425 to i32
  %427 = and i32 %426, 7
  %428 = shl i32 %427, 4
  %429 = or i32 %423, %428
  %430 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 27
  %431 = load i16, i16* %430, align 2
  %432 = sext i16 %431 to i32
  %433 = and i32 %432, 7
  %434 = shl i32 %433, 1
  %435 = or i32 %429, %434
  %436 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 28
  %437 = load i16, i16* %436, align 8
  %438 = sext i16 %437 to i32
  %439 = ashr i32 %438, 2
  %440 = and i32 %439, 1
  %441 = or i32 %435, %440
  %442 = trunc i32 %441 to i8
  %443 = load i8*, i8** %7, align 8
  %444 = getelementptr inbounds i8, i8* %443, i32 1
  store i8* %444, i8** %7, align 8
  store i8 %442, i8* %443, align 1
  %445 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 28
  %446 = load i16, i16* %445, align 8
  %447 = sext i16 %446 to i32
  %448 = and i32 %447, 3
  %449 = shl i32 %448, 6
  %450 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 29
  %451 = load i16, i16* %450, align 2
  %452 = sext i16 %451 to i32
  %453 = and i32 %452, 7
  %454 = shl i32 %453, 3
  %455 = or i32 %449, %454
  %456 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 30
  %457 = load i16, i16* %456, align 4
  %458 = sext i16 %457 to i32
  %459 = and i32 %458, 7
  %460 = or i32 %455, %459
  %461 = trunc i32 %460 to i8
  %462 = load i8*, i8** %7, align 8
  %463 = getelementptr inbounds i8, i8* %462, i32 1
  store i8* %463, i8** %7, align 8
  store i8 %461, i8* %462, align 1
  %464 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 31
  %465 = load i16, i16* %464, align 2
  %466 = sext i16 %465 to i32
  %467 = and i32 %466, 7
  %468 = shl i32 %467, 5
  %469 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 32
  %470 = load i16, i16* %469, align 16
  %471 = sext i16 %470 to i32
  %472 = and i32 %471, 7
  %473 = shl i32 %472, 2
  %474 = or i32 %468, %473
  %475 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 33
  %476 = load i16, i16* %475, align 2
  %477 = sext i16 %476 to i32
  %478 = ashr i32 %477, 1
  %479 = and i32 %478, 3
  %480 = or i32 %474, %479
  %481 = trunc i32 %480 to i8
  %482 = load i8*, i8** %7, align 8
  %483 = getelementptr inbounds i8, i8* %482, i32 1
  store i8* %483, i8** %7, align 8
  store i8 %481, i8* %482, align 1
  %484 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 33
  %485 = load i16, i16* %484, align 2
  %486 = sext i16 %485 to i32
  %487 = and i32 %486, 1
  %488 = shl i32 %487, 7
  %489 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 34
  %490 = load i16, i16* %489, align 4
  %491 = sext i16 %490 to i32
  %492 = and i32 %491, 7
  %493 = shl i32 %492, 4
  %494 = or i32 %488, %493
  %495 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 35
  %496 = load i16, i16* %495, align 2
  %497 = sext i16 %496 to i32
  %498 = and i32 %497, 7
  %499 = shl i32 %498, 1
  %500 = or i32 %494, %499
  %501 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 36
  %502 = load i16, i16* %501, align 8
  %503 = sext i16 %502 to i32
  %504 = ashr i32 %503, 2
  %505 = and i32 %504, 1
  %506 = or i32 %500, %505
  %507 = trunc i32 %506 to i8
  %508 = load i8*, i8** %7, align 8
  %509 = getelementptr inbounds i8, i8* %508, i32 1
  store i8* %509, i8** %7, align 8
  store i8 %507, i8* %508, align 1
  %510 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 36
  %511 = load i16, i16* %510, align 8
  %512 = sext i16 %511 to i32
  %513 = and i32 %512, 3
  %514 = shl i32 %513, 6
  %515 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 37
  %516 = load i16, i16* %515, align 2
  %517 = sext i16 %516 to i32
  %518 = and i32 %517, 7
  %519 = shl i32 %518, 3
  %520 = or i32 %514, %519
  %521 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 38
  %522 = load i16, i16* %521, align 4
  %523 = sext i16 %522 to i32
  %524 = and i32 %523, 7
  %525 = or i32 %520, %524
  %526 = trunc i32 %525 to i8
  %527 = load i8*, i8** %7, align 8
  %528 = getelementptr inbounds i8, i8* %527, i32 1
  store i8* %528, i8** %7, align 8
  store i8 %526, i8* %527, align 1
  %529 = getelementptr inbounds [4 x i16], [4 x i16]* %9, i64 0, i64 3
  %530 = load i16, i16* %529, align 2
  %531 = sext i16 %530 to i32
  %532 = and i32 %531, 127
  %533 = shl i32 %532, 1
  %534 = getelementptr inbounds [4 x i16], [4 x i16]* %11, i64 0, i64 3
  %535 = load i16, i16* %534, align 2
  %536 = sext i16 %535 to i32
  %537 = ashr i32 %536, 1
  %538 = and i32 %537, 1
  %539 = or i32 %533, %538
  %540 = trunc i32 %539 to i8
  %541 = load i8*, i8** %7, align 8
  %542 = getelementptr inbounds i8, i8* %541, i32 1
  store i8* %542, i8** %7, align 8
  store i8 %540, i8* %541, align 1
  %543 = getelementptr inbounds [4 x i16], [4 x i16]* %11, i64 0, i64 3
  %544 = load i16, i16* %543, align 2
  %545 = sext i16 %544 to i32
  %546 = and i32 %545, 1
  %547 = shl i32 %546, 7
  %548 = getelementptr inbounds [4 x i16], [4 x i16]* %10, i64 0, i64 3
  %549 = load i16, i16* %548, align 2
  %550 = sext i16 %549 to i32
  %551 = and i32 %550, 3
  %552 = shl i32 %551, 5
  %553 = or i32 %547, %552
  %554 = getelementptr inbounds [4 x i16], [4 x i16]* %12, i64 0, i64 3
  %555 = load i16, i16* %554, align 2
  %556 = sext i16 %555 to i32
  %557 = ashr i32 %556, 1
  %558 = and i32 %557, 31
  %559 = or i32 %553, %558
  %560 = trunc i32 %559 to i8
  %561 = load i8*, i8** %7, align 8
  %562 = getelementptr inbounds i8, i8* %561, i32 1
  store i8* %562, i8** %7, align 8
  store i8 %560, i8* %561, align 1
  %563 = getelementptr inbounds [4 x i16], [4 x i16]* %12, i64 0, i64 3
  %564 = load i16, i16* %563, align 2
  %565 = sext i16 %564 to i32
  %566 = and i32 %565, 1
  %567 = shl i32 %566, 7
  %568 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 39
  %569 = load i16, i16* %568, align 2
  %570 = sext i16 %569 to i32
  %571 = and i32 %570, 7
  %572 = shl i32 %571, 4
  %573 = or i32 %567, %572
  %574 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 40
  %575 = load i16, i16* %574, align 16
  %576 = sext i16 %575 to i32
  %577 = and i32 %576, 7
  %578 = shl i32 %577, 1
  %579 = or i32 %573, %578
  %580 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 41
  %581 = load i16, i16* %580, align 2
  %582 = sext i16 %581 to i32
  %583 = ashr i32 %582, 2
  %584 = and i32 %583, 1
  %585 = or i32 %579, %584
  %586 = trunc i32 %585 to i8
  %587 = load i8*, i8** %7, align 8
  %588 = getelementptr inbounds i8, i8* %587, i32 1
  store i8* %588, i8** %7, align 8
  store i8 %586, i8* %587, align 1
  %589 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 41
  %590 = load i16, i16* %589, align 2
  %591 = sext i16 %590 to i32
  %592 = and i32 %591, 3
  %593 = shl i32 %592, 6
  %594 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 42
  %595 = load i16, i16* %594, align 4
  %596 = sext i16 %595 to i32
  %597 = and i32 %596, 7
  %598 = shl i32 %597, 3
  %599 = or i32 %593, %598
  %600 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 43
  %601 = load i16, i16* %600, align 2
  %602 = sext i16 %601 to i32
  %603 = and i32 %602, 7
  %604 = or i32 %599, %603
  %605 = trunc i32 %604 to i8
  %606 = load i8*, i8** %7, align 8
  %607 = getelementptr inbounds i8, i8* %606, i32 1
  store i8* %607, i8** %7, align 8
  store i8 %605, i8* %606, align 1
  %608 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 44
  %609 = load i16, i16* %608, align 8
  %610 = sext i16 %609 to i32
  %611 = and i32 %610, 7
  %612 = shl i32 %611, 5
  %613 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 45
  %614 = load i16, i16* %613, align 2
  %615 = sext i16 %614 to i32
  %616 = and i32 %615, 7
  %617 = shl i32 %616, 2
  %618 = or i32 %612, %617
  %619 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 46
  %620 = load i16, i16* %619, align 4
  %621 = sext i16 %620 to i32
  %622 = ashr i32 %621, 1
  %623 = and i32 %622, 3
  %624 = or i32 %618, %623
  %625 = trunc i32 %624 to i8
  %626 = load i8*, i8** %7, align 8
  %627 = getelementptr inbounds i8, i8* %626, i32 1
  store i8* %627, i8** %7, align 8
  store i8 %625, i8* %626, align 1
  %628 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 46
  %629 = load i16, i16* %628, align 4
  %630 = sext i16 %629 to i32
  %631 = and i32 %630, 1
  %632 = shl i32 %631, 7
  %633 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 47
  %634 = load i16, i16* %633, align 2
  %635 = sext i16 %634 to i32
  %636 = and i32 %635, 7
  %637 = shl i32 %636, 4
  %638 = or i32 %632, %637
  %639 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 48
  %640 = load i16, i16* %639, align 16
  %641 = sext i16 %640 to i32
  %642 = and i32 %641, 7
  %643 = shl i32 %642, 1
  %644 = or i32 %638, %643
  %645 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 49
  %646 = load i16, i16* %645, align 2
  %647 = sext i16 %646 to i32
  %648 = ashr i32 %647, 2
  %649 = and i32 %648, 1
  %650 = or i32 %644, %649
  %651 = trunc i32 %650 to i8
  %652 = load i8*, i8** %7, align 8
  %653 = getelementptr inbounds i8, i8* %652, i32 1
  store i8* %653, i8** %7, align 8
  store i8 %651, i8* %652, align 1
  %654 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 49
  %655 = load i16, i16* %654, align 2
  %656 = sext i16 %655 to i32
  %657 = and i32 %656, 3
  %658 = shl i32 %657, 6
  %659 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 50
  %660 = load i16, i16* %659, align 4
  %661 = sext i16 %660 to i32
  %662 = and i32 %661, 7
  %663 = shl i32 %662, 3
  %664 = or i32 %658, %663
  %665 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 51
  %666 = load i16, i16* %665, align 2
  %667 = sext i16 %666 to i32
  %668 = and i32 %667, 7
  %669 = or i32 %664, %668
  %670 = trunc i32 %669 to i8
  %671 = load i8*, i8** %7, align 8
  %672 = getelementptr inbounds i8, i8* %671, i32 1
  store i8* %672, i8** %7, align 8
  store i8 %670, i8* %671, align 1
  ret void
}

declare void @Gsm_Coder(%struct.gsm_state*, i16*, i16*, i16*, i16*, i16*, i16*, i16*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
