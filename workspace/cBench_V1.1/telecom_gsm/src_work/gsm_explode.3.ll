; ModuleID = 'gsm_explode.2.ll'
source_filename = "gsm_explode.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_gsm_explode = private constant [11 x i8] c"gsm_explode"
@__profc_gsm_explode = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_explode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2705716943783639745, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_explode, i32 0, i32 0), i8* bitcast (i32 (%struct.gsm_state*, i8*, i16*)* @gsm_explode to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [21 x i8] c"\0B\13x\DAK/\CE\8DO\AD(\C8\C9OI\05\00\1B\B0\04\98", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_explode to i8*), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @gsm_explode(%struct.gsm_state*, i8*, i16*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.gsm_state*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i16*, align 8
  store %struct.gsm_state* %0, %struct.gsm_state** %5, align 8
  store i8* %1, i8** %6, align 8
  store i16* %2, i16** %7, align 8
  %8 = load i8*, i8** %6, align 8
  %9 = load i8, i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = ashr i32 %10, 4
  %12 = and i32 %11, 15
  %13 = icmp ne i32 %12, 13
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_explode, i64 0, i64 0)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_explode, i64 0, i64 0)
  store i32 -1, i32* %4, align 4
  br label %1055

; <label>:16:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_explode, i64 0, i64 1)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_explode, i64 0, i64 1)
  %18 = load i8*, i8** %6, align 8
  %19 = getelementptr inbounds i8, i8* %18, i32 1
  store i8* %19, i8** %6, align 8
  %20 = load i8, i8* %18, align 1
  %21 = zext i8 %20 to i32
  %22 = and i32 %21, 15
  %23 = shl i32 %22, 2
  %24 = trunc i32 %23 to i16
  %25 = load i16*, i16** %7, align 8
  %26 = getelementptr inbounds i16, i16* %25, i64 0
  store i16 %24, i16* %26, align 2
  %27 = load i8*, i8** %6, align 8
  %28 = load i8, i8* %27, align 1
  %29 = zext i8 %28 to i32
  %30 = ashr i32 %29, 6
  %31 = and i32 %30, 3
  %32 = load i16*, i16** %7, align 8
  %33 = getelementptr inbounds i16, i16* %32, i64 0
  %34 = load i16, i16* %33, align 2
  %35 = sext i16 %34 to i32
  %36 = or i32 %35, %31
  %37 = trunc i32 %36 to i16
  store i16 %37, i16* %33, align 2
  %38 = load i8*, i8** %6, align 8
  %39 = getelementptr inbounds i8, i8* %38, i32 1
  store i8* %39, i8** %6, align 8
  %40 = load i8, i8* %38, align 1
  %41 = zext i8 %40 to i32
  %42 = and i32 %41, 63
  %43 = trunc i32 %42 to i16
  %44 = load i16*, i16** %7, align 8
  %45 = getelementptr inbounds i16, i16* %44, i64 1
  store i16 %43, i16* %45, align 2
  %46 = load i8*, i8** %6, align 8
  %47 = load i8, i8* %46, align 1
  %48 = zext i8 %47 to i32
  %49 = ashr i32 %48, 3
  %50 = and i32 %49, 31
  %51 = trunc i32 %50 to i16
  %52 = load i16*, i16** %7, align 8
  %53 = getelementptr inbounds i16, i16* %52, i64 2
  store i16 %51, i16* %53, align 2
  %54 = load i8*, i8** %6, align 8
  %55 = getelementptr inbounds i8, i8* %54, i32 1
  store i8* %55, i8** %6, align 8
  %56 = load i8, i8* %54, align 1
  %57 = zext i8 %56 to i32
  %58 = and i32 %57, 7
  %59 = shl i32 %58, 2
  %60 = trunc i32 %59 to i16
  %61 = load i16*, i16** %7, align 8
  %62 = getelementptr inbounds i16, i16* %61, i64 3
  store i16 %60, i16* %62, align 2
  %63 = load i8*, i8** %6, align 8
  %64 = load i8, i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = ashr i32 %65, 6
  %67 = and i32 %66, 3
  %68 = load i16*, i16** %7, align 8
  %69 = getelementptr inbounds i16, i16* %68, i64 3
  %70 = load i16, i16* %69, align 2
  %71 = sext i16 %70 to i32
  %72 = or i32 %71, %67
  %73 = trunc i32 %72 to i16
  store i16 %73, i16* %69, align 2
  %74 = load i8*, i8** %6, align 8
  %75 = load i8, i8* %74, align 1
  %76 = zext i8 %75 to i32
  %77 = ashr i32 %76, 2
  %78 = and i32 %77, 15
  %79 = trunc i32 %78 to i16
  %80 = load i16*, i16** %7, align 8
  %81 = getelementptr inbounds i16, i16* %80, i64 4
  store i16 %79, i16* %81, align 2
  %82 = load i8*, i8** %6, align 8
  %83 = getelementptr inbounds i8, i8* %82, i32 1
  store i8* %83, i8** %6, align 8
  %84 = load i8, i8* %82, align 1
  %85 = zext i8 %84 to i32
  %86 = and i32 %85, 3
  %87 = shl i32 %86, 2
  %88 = trunc i32 %87 to i16
  %89 = load i16*, i16** %7, align 8
  %90 = getelementptr inbounds i16, i16* %89, i64 5
  store i16 %88, i16* %90, align 2
  %91 = load i8*, i8** %6, align 8
  %92 = load i8, i8* %91, align 1
  %93 = zext i8 %92 to i32
  %94 = ashr i32 %93, 6
  %95 = and i32 %94, 3
  %96 = load i16*, i16** %7, align 8
  %97 = getelementptr inbounds i16, i16* %96, i64 5
  %98 = load i16, i16* %97, align 2
  %99 = sext i16 %98 to i32
  %100 = or i32 %99, %95
  %101 = trunc i32 %100 to i16
  store i16 %101, i16* %97, align 2
  %102 = load i8*, i8** %6, align 8
  %103 = load i8, i8* %102, align 1
  %104 = zext i8 %103 to i32
  %105 = ashr i32 %104, 3
  %106 = and i32 %105, 7
  %107 = trunc i32 %106 to i16
  %108 = load i16*, i16** %7, align 8
  %109 = getelementptr inbounds i16, i16* %108, i64 6
  store i16 %107, i16* %109, align 2
  %110 = load i8*, i8** %6, align 8
  %111 = getelementptr inbounds i8, i8* %110, i32 1
  store i8* %111, i8** %6, align 8
  %112 = load i8, i8* %110, align 1
  %113 = zext i8 %112 to i32
  %114 = and i32 %113, 7
  %115 = trunc i32 %114 to i16
  %116 = load i16*, i16** %7, align 8
  %117 = getelementptr inbounds i16, i16* %116, i64 7
  store i16 %115, i16* %117, align 2
  %118 = load i8*, i8** %6, align 8
  %119 = load i8, i8* %118, align 1
  %120 = zext i8 %119 to i32
  %121 = ashr i32 %120, 1
  %122 = and i32 %121, 127
  %123 = trunc i32 %122 to i16
  %124 = load i16*, i16** %7, align 8
  %125 = getelementptr inbounds i16, i16* %124, i64 8
  %126 = getelementptr inbounds i16, i16* %125, i64 0
  store i16 %123, i16* %126, align 2
  %127 = load i8*, i8** %6, align 8
  %128 = getelementptr inbounds i8, i8* %127, i32 1
  store i8* %128, i8** %6, align 8
  %129 = load i8, i8* %127, align 1
  %130 = zext i8 %129 to i32
  %131 = and i32 %130, 1
  %132 = shl i32 %131, 1
  %133 = trunc i32 %132 to i16
  %134 = load i16*, i16** %7, align 8
  %135 = getelementptr inbounds i16, i16* %134, i64 9
  %136 = getelementptr inbounds i16, i16* %135, i64 0
  store i16 %133, i16* %136, align 2
  %137 = load i8*, i8** %6, align 8
  %138 = load i8, i8* %137, align 1
  %139 = zext i8 %138 to i32
  %140 = ashr i32 %139, 7
  %141 = and i32 %140, 1
  %142 = load i16*, i16** %7, align 8
  %143 = getelementptr inbounds i16, i16* %142, i64 9
  %144 = getelementptr inbounds i16, i16* %143, i64 0
  %145 = load i16, i16* %144, align 2
  %146 = sext i16 %145 to i32
  %147 = or i32 %146, %141
  %148 = trunc i32 %147 to i16
  store i16 %148, i16* %144, align 2
  %149 = load i8*, i8** %6, align 8
  %150 = load i8, i8* %149, align 1
  %151 = zext i8 %150 to i32
  %152 = ashr i32 %151, 5
  %153 = and i32 %152, 3
  %154 = trunc i32 %153 to i16
  %155 = load i16*, i16** %7, align 8
  %156 = getelementptr inbounds i16, i16* %155, i64 10
  %157 = getelementptr inbounds i16, i16* %156, i64 0
  store i16 %154, i16* %157, align 2
  %158 = load i8*, i8** %6, align 8
  %159 = getelementptr inbounds i8, i8* %158, i32 1
  store i8* %159, i8** %6, align 8
  %160 = load i8, i8* %158, align 1
  %161 = zext i8 %160 to i32
  %162 = and i32 %161, 31
  %163 = shl i32 %162, 1
  %164 = trunc i32 %163 to i16
  %165 = load i16*, i16** %7, align 8
  %166 = getelementptr inbounds i16, i16* %165, i64 11
  %167 = getelementptr inbounds i16, i16* %166, i64 0
  store i16 %164, i16* %167, align 2
  %168 = load i8*, i8** %6, align 8
  %169 = load i8, i8* %168, align 1
  %170 = zext i8 %169 to i32
  %171 = ashr i32 %170, 7
  %172 = and i32 %171, 1
  %173 = load i16*, i16** %7, align 8
  %174 = getelementptr inbounds i16, i16* %173, i64 11
  %175 = getelementptr inbounds i16, i16* %174, i64 0
  %176 = load i16, i16* %175, align 2
  %177 = sext i16 %176 to i32
  %178 = or i32 %177, %172
  %179 = trunc i32 %178 to i16
  store i16 %179, i16* %175, align 2
  %180 = load i8*, i8** %6, align 8
  %181 = load i8, i8* %180, align 1
  %182 = zext i8 %181 to i32
  %183 = ashr i32 %182, 4
  %184 = and i32 %183, 7
  %185 = trunc i32 %184 to i16
  %186 = load i16*, i16** %7, align 8
  %187 = getelementptr inbounds i16, i16* %186, i64 12
  %188 = getelementptr inbounds i16, i16* %187, i64 0
  store i16 %185, i16* %188, align 2
  %189 = load i8*, i8** %6, align 8
  %190 = load i8, i8* %189, align 1
  %191 = zext i8 %190 to i32
  %192 = ashr i32 %191, 1
  %193 = and i32 %192, 7
  %194 = trunc i32 %193 to i16
  %195 = load i16*, i16** %7, align 8
  %196 = getelementptr inbounds i16, i16* %195, i64 12
  %197 = getelementptr inbounds i16, i16* %196, i64 1
  store i16 %194, i16* %197, align 2
  %198 = load i8*, i8** %6, align 8
  %199 = getelementptr inbounds i8, i8* %198, i32 1
  store i8* %199, i8** %6, align 8
  %200 = load i8, i8* %198, align 1
  %201 = zext i8 %200 to i32
  %202 = and i32 %201, 1
  %203 = shl i32 %202, 2
  %204 = trunc i32 %203 to i16
  %205 = load i16*, i16** %7, align 8
  %206 = getelementptr inbounds i16, i16* %205, i64 12
  %207 = getelementptr inbounds i16, i16* %206, i64 2
  store i16 %204, i16* %207, align 2
  %208 = load i8*, i8** %6, align 8
  %209 = load i8, i8* %208, align 1
  %210 = zext i8 %209 to i32
  %211 = ashr i32 %210, 6
  %212 = and i32 %211, 3
  %213 = load i16*, i16** %7, align 8
  %214 = getelementptr inbounds i16, i16* %213, i64 12
  %215 = getelementptr inbounds i16, i16* %214, i64 2
  %216 = load i16, i16* %215, align 2
  %217 = sext i16 %216 to i32
  %218 = or i32 %217, %212
  %219 = trunc i32 %218 to i16
  store i16 %219, i16* %215, align 2
  %220 = load i8*, i8** %6, align 8
  %221 = load i8, i8* %220, align 1
  %222 = zext i8 %221 to i32
  %223 = ashr i32 %222, 3
  %224 = and i32 %223, 7
  %225 = trunc i32 %224 to i16
  %226 = load i16*, i16** %7, align 8
  %227 = getelementptr inbounds i16, i16* %226, i64 12
  %228 = getelementptr inbounds i16, i16* %227, i64 3
  store i16 %225, i16* %228, align 2
  %229 = load i8*, i8** %6, align 8
  %230 = getelementptr inbounds i8, i8* %229, i32 1
  store i8* %230, i8** %6, align 8
  %231 = load i8, i8* %229, align 1
  %232 = zext i8 %231 to i32
  %233 = and i32 %232, 7
  %234 = trunc i32 %233 to i16
  %235 = load i16*, i16** %7, align 8
  %236 = getelementptr inbounds i16, i16* %235, i64 12
  %237 = getelementptr inbounds i16, i16* %236, i64 4
  store i16 %234, i16* %237, align 2
  %238 = load i8*, i8** %6, align 8
  %239 = load i8, i8* %238, align 1
  %240 = zext i8 %239 to i32
  %241 = ashr i32 %240, 5
  %242 = and i32 %241, 7
  %243 = trunc i32 %242 to i16
  %244 = load i16*, i16** %7, align 8
  %245 = getelementptr inbounds i16, i16* %244, i64 12
  %246 = getelementptr inbounds i16, i16* %245, i64 5
  store i16 %243, i16* %246, align 2
  %247 = load i8*, i8** %6, align 8
  %248 = load i8, i8* %247, align 1
  %249 = zext i8 %248 to i32
  %250 = ashr i32 %249, 2
  %251 = and i32 %250, 7
  %252 = trunc i32 %251 to i16
  %253 = load i16*, i16** %7, align 8
  %254 = getelementptr inbounds i16, i16* %253, i64 12
  %255 = getelementptr inbounds i16, i16* %254, i64 6
  store i16 %252, i16* %255, align 2
  %256 = load i8*, i8** %6, align 8
  %257 = getelementptr inbounds i8, i8* %256, i32 1
  store i8* %257, i8** %6, align 8
  %258 = load i8, i8* %256, align 1
  %259 = zext i8 %258 to i32
  %260 = and i32 %259, 3
  %261 = shl i32 %260, 1
  %262 = trunc i32 %261 to i16
  %263 = load i16*, i16** %7, align 8
  %264 = getelementptr inbounds i16, i16* %263, i64 12
  %265 = getelementptr inbounds i16, i16* %264, i64 7
  store i16 %262, i16* %265, align 2
  %266 = load i8*, i8** %6, align 8
  %267 = load i8, i8* %266, align 1
  %268 = zext i8 %267 to i32
  %269 = ashr i32 %268, 7
  %270 = and i32 %269, 1
  %271 = load i16*, i16** %7, align 8
  %272 = getelementptr inbounds i16, i16* %271, i64 12
  %273 = getelementptr inbounds i16, i16* %272, i64 7
  %274 = load i16, i16* %273, align 2
  %275 = sext i16 %274 to i32
  %276 = or i32 %275, %270
  %277 = trunc i32 %276 to i16
  store i16 %277, i16* %273, align 2
  %278 = load i8*, i8** %6, align 8
  %279 = load i8, i8* %278, align 1
  %280 = zext i8 %279 to i32
  %281 = ashr i32 %280, 4
  %282 = and i32 %281, 7
  %283 = trunc i32 %282 to i16
  %284 = load i16*, i16** %7, align 8
  %285 = getelementptr inbounds i16, i16* %284, i64 12
  %286 = getelementptr inbounds i16, i16* %285, i64 8
  store i16 %283, i16* %286, align 2
  %287 = load i8*, i8** %6, align 8
  %288 = load i8, i8* %287, align 1
  %289 = zext i8 %288 to i32
  %290 = ashr i32 %289, 1
  %291 = and i32 %290, 7
  %292 = trunc i32 %291 to i16
  %293 = load i16*, i16** %7, align 8
  %294 = getelementptr inbounds i16, i16* %293, i64 12
  %295 = getelementptr inbounds i16, i16* %294, i64 9
  store i16 %292, i16* %295, align 2
  %296 = load i8*, i8** %6, align 8
  %297 = getelementptr inbounds i8, i8* %296, i32 1
  store i8* %297, i8** %6, align 8
  %298 = load i8, i8* %296, align 1
  %299 = zext i8 %298 to i32
  %300 = and i32 %299, 1
  %301 = shl i32 %300, 2
  %302 = trunc i32 %301 to i16
  %303 = load i16*, i16** %7, align 8
  %304 = getelementptr inbounds i16, i16* %303, i64 12
  %305 = getelementptr inbounds i16, i16* %304, i64 10
  store i16 %302, i16* %305, align 2
  %306 = load i8*, i8** %6, align 8
  %307 = load i8, i8* %306, align 1
  %308 = zext i8 %307 to i32
  %309 = ashr i32 %308, 6
  %310 = and i32 %309, 3
  %311 = load i16*, i16** %7, align 8
  %312 = getelementptr inbounds i16, i16* %311, i64 12
  %313 = getelementptr inbounds i16, i16* %312, i64 10
  %314 = load i16, i16* %313, align 2
  %315 = sext i16 %314 to i32
  %316 = or i32 %315, %310
  %317 = trunc i32 %316 to i16
  store i16 %317, i16* %313, align 2
  %318 = load i8*, i8** %6, align 8
  %319 = load i8, i8* %318, align 1
  %320 = zext i8 %319 to i32
  %321 = ashr i32 %320, 3
  %322 = and i32 %321, 7
  %323 = trunc i32 %322 to i16
  %324 = load i16*, i16** %7, align 8
  %325 = getelementptr inbounds i16, i16* %324, i64 12
  %326 = getelementptr inbounds i16, i16* %325, i64 11
  store i16 %323, i16* %326, align 2
  %327 = load i8*, i8** %6, align 8
  %328 = getelementptr inbounds i8, i8* %327, i32 1
  store i8* %328, i8** %6, align 8
  %329 = load i8, i8* %327, align 1
  %330 = zext i8 %329 to i32
  %331 = and i32 %330, 7
  %332 = trunc i32 %331 to i16
  %333 = load i16*, i16** %7, align 8
  %334 = getelementptr inbounds i16, i16* %333, i64 12
  %335 = getelementptr inbounds i16, i16* %334, i64 12
  store i16 %332, i16* %335, align 2
  %336 = load i8*, i8** %6, align 8
  %337 = load i8, i8* %336, align 1
  %338 = zext i8 %337 to i32
  %339 = ashr i32 %338, 1
  %340 = and i32 %339, 127
  %341 = trunc i32 %340 to i16
  %342 = load i16*, i16** %7, align 8
  %343 = getelementptr inbounds i16, i16* %342, i64 25
  %344 = getelementptr inbounds i16, i16* %343, i64 -1
  %345 = getelementptr inbounds i16, i16* %344, i64 1
  store i16 %341, i16* %345, align 2
  %346 = load i8*, i8** %6, align 8
  %347 = getelementptr inbounds i8, i8* %346, i32 1
  store i8* %347, i8** %6, align 8
  %348 = load i8, i8* %346, align 1
  %349 = zext i8 %348 to i32
  %350 = and i32 %349, 1
  %351 = shl i32 %350, 1
  %352 = trunc i32 %351 to i16
  %353 = load i16*, i16** %7, align 8
  %354 = getelementptr inbounds i16, i16* %353, i64 26
  %355 = getelementptr inbounds i16, i16* %354, i64 -1
  %356 = getelementptr inbounds i16, i16* %355, i64 1
  store i16 %352, i16* %356, align 2
  %357 = load i8*, i8** %6, align 8
  %358 = load i8, i8* %357, align 1
  %359 = zext i8 %358 to i32
  %360 = ashr i32 %359, 7
  %361 = and i32 %360, 1
  %362 = load i16*, i16** %7, align 8
  %363 = getelementptr inbounds i16, i16* %362, i64 26
  %364 = getelementptr inbounds i16, i16* %363, i64 -1
  %365 = getelementptr inbounds i16, i16* %364, i64 1
  %366 = load i16, i16* %365, align 2
  %367 = sext i16 %366 to i32
  %368 = or i32 %367, %361
  %369 = trunc i32 %368 to i16
  store i16 %369, i16* %365, align 2
  %370 = load i8*, i8** %6, align 8
  %371 = load i8, i8* %370, align 1
  %372 = zext i8 %371 to i32
  %373 = ashr i32 %372, 5
  %374 = and i32 %373, 3
  %375 = trunc i32 %374 to i16
  %376 = load i16*, i16** %7, align 8
  %377 = getelementptr inbounds i16, i16* %376, i64 27
  %378 = getelementptr inbounds i16, i16* %377, i64 -1
  %379 = getelementptr inbounds i16, i16* %378, i64 1
  store i16 %375, i16* %379, align 2
  %380 = load i8*, i8** %6, align 8
  %381 = getelementptr inbounds i8, i8* %380, i32 1
  store i8* %381, i8** %6, align 8
  %382 = load i8, i8* %380, align 1
  %383 = zext i8 %382 to i32
  %384 = and i32 %383, 31
  %385 = shl i32 %384, 1
  %386 = trunc i32 %385 to i16
  %387 = load i16*, i16** %7, align 8
  %388 = getelementptr inbounds i16, i16* %387, i64 28
  %389 = getelementptr inbounds i16, i16* %388, i64 -1
  %390 = getelementptr inbounds i16, i16* %389, i64 1
  store i16 %386, i16* %390, align 2
  %391 = load i8*, i8** %6, align 8
  %392 = load i8, i8* %391, align 1
  %393 = zext i8 %392 to i32
  %394 = ashr i32 %393, 7
  %395 = and i32 %394, 1
  %396 = load i16*, i16** %7, align 8
  %397 = getelementptr inbounds i16, i16* %396, i64 28
  %398 = getelementptr inbounds i16, i16* %397, i64 -1
  %399 = getelementptr inbounds i16, i16* %398, i64 1
  %400 = load i16, i16* %399, align 2
  %401 = sext i16 %400 to i32
  %402 = or i32 %401, %395
  %403 = trunc i32 %402 to i16
  store i16 %403, i16* %399, align 2
  %404 = load i8*, i8** %6, align 8
  %405 = load i8, i8* %404, align 1
  %406 = zext i8 %405 to i32
  %407 = ashr i32 %406, 4
  %408 = and i32 %407, 7
  %409 = trunc i32 %408 to i16
  %410 = load i16*, i16** %7, align 8
  %411 = getelementptr inbounds i16, i16* %410, i64 29
  %412 = getelementptr inbounds i16, i16* %411, i64 -13
  %413 = getelementptr inbounds i16, i16* %412, i64 13
  store i16 %409, i16* %413, align 2
  %414 = load i8*, i8** %6, align 8
  %415 = load i8, i8* %414, align 1
  %416 = zext i8 %415 to i32
  %417 = ashr i32 %416, 1
  %418 = and i32 %417, 7
  %419 = trunc i32 %418 to i16
  %420 = load i16*, i16** %7, align 8
  %421 = getelementptr inbounds i16, i16* %420, i64 29
  %422 = getelementptr inbounds i16, i16* %421, i64 -13
  %423 = getelementptr inbounds i16, i16* %422, i64 14
  store i16 %419, i16* %423, align 2
  %424 = load i8*, i8** %6, align 8
  %425 = getelementptr inbounds i8, i8* %424, i32 1
  store i8* %425, i8** %6, align 8
  %426 = load i8, i8* %424, align 1
  %427 = zext i8 %426 to i32
  %428 = and i32 %427, 1
  %429 = shl i32 %428, 2
  %430 = trunc i32 %429 to i16
  %431 = load i16*, i16** %7, align 8
  %432 = getelementptr inbounds i16, i16* %431, i64 29
  %433 = getelementptr inbounds i16, i16* %432, i64 -13
  %434 = getelementptr inbounds i16, i16* %433, i64 15
  store i16 %430, i16* %434, align 2
  %435 = load i8*, i8** %6, align 8
  %436 = load i8, i8* %435, align 1
  %437 = zext i8 %436 to i32
  %438 = ashr i32 %437, 6
  %439 = and i32 %438, 3
  %440 = load i16*, i16** %7, align 8
  %441 = getelementptr inbounds i16, i16* %440, i64 29
  %442 = getelementptr inbounds i16, i16* %441, i64 -13
  %443 = getelementptr inbounds i16, i16* %442, i64 15
  %444 = load i16, i16* %443, align 2
  %445 = sext i16 %444 to i32
  %446 = or i32 %445, %439
  %447 = trunc i32 %446 to i16
  store i16 %447, i16* %443, align 2
  %448 = load i8*, i8** %6, align 8
  %449 = load i8, i8* %448, align 1
  %450 = zext i8 %449 to i32
  %451 = ashr i32 %450, 3
  %452 = and i32 %451, 7
  %453 = trunc i32 %452 to i16
  %454 = load i16*, i16** %7, align 8
  %455 = getelementptr inbounds i16, i16* %454, i64 29
  %456 = getelementptr inbounds i16, i16* %455, i64 -13
  %457 = getelementptr inbounds i16, i16* %456, i64 16
  store i16 %453, i16* %457, align 2
  %458 = load i8*, i8** %6, align 8
  %459 = getelementptr inbounds i8, i8* %458, i32 1
  store i8* %459, i8** %6, align 8
  %460 = load i8, i8* %458, align 1
  %461 = zext i8 %460 to i32
  %462 = and i32 %461, 7
  %463 = trunc i32 %462 to i16
  %464 = load i16*, i16** %7, align 8
  %465 = getelementptr inbounds i16, i16* %464, i64 29
  %466 = getelementptr inbounds i16, i16* %465, i64 -13
  %467 = getelementptr inbounds i16, i16* %466, i64 17
  store i16 %463, i16* %467, align 2
  %468 = load i8*, i8** %6, align 8
  %469 = load i8, i8* %468, align 1
  %470 = zext i8 %469 to i32
  %471 = ashr i32 %470, 5
  %472 = and i32 %471, 7
  %473 = trunc i32 %472 to i16
  %474 = load i16*, i16** %7, align 8
  %475 = getelementptr inbounds i16, i16* %474, i64 29
  %476 = getelementptr inbounds i16, i16* %475, i64 -13
  %477 = getelementptr inbounds i16, i16* %476, i64 18
  store i16 %473, i16* %477, align 2
  %478 = load i8*, i8** %6, align 8
  %479 = load i8, i8* %478, align 1
  %480 = zext i8 %479 to i32
  %481 = ashr i32 %480, 2
  %482 = and i32 %481, 7
  %483 = trunc i32 %482 to i16
  %484 = load i16*, i16** %7, align 8
  %485 = getelementptr inbounds i16, i16* %484, i64 29
  %486 = getelementptr inbounds i16, i16* %485, i64 -13
  %487 = getelementptr inbounds i16, i16* %486, i64 19
  store i16 %483, i16* %487, align 2
  %488 = load i8*, i8** %6, align 8
  %489 = getelementptr inbounds i8, i8* %488, i32 1
  store i8* %489, i8** %6, align 8
  %490 = load i8, i8* %488, align 1
  %491 = zext i8 %490 to i32
  %492 = and i32 %491, 3
  %493 = shl i32 %492, 1
  %494 = trunc i32 %493 to i16
  %495 = load i16*, i16** %7, align 8
  %496 = getelementptr inbounds i16, i16* %495, i64 29
  %497 = getelementptr inbounds i16, i16* %496, i64 -13
  %498 = getelementptr inbounds i16, i16* %497, i64 20
  store i16 %494, i16* %498, align 2
  %499 = load i8*, i8** %6, align 8
  %500 = load i8, i8* %499, align 1
  %501 = zext i8 %500 to i32
  %502 = ashr i32 %501, 7
  %503 = and i32 %502, 1
  %504 = load i16*, i16** %7, align 8
  %505 = getelementptr inbounds i16, i16* %504, i64 29
  %506 = getelementptr inbounds i16, i16* %505, i64 -13
  %507 = getelementptr inbounds i16, i16* %506, i64 20
  %508 = load i16, i16* %507, align 2
  %509 = sext i16 %508 to i32
  %510 = or i32 %509, %503
  %511 = trunc i32 %510 to i16
  store i16 %511, i16* %507, align 2
  %512 = load i8*, i8** %6, align 8
  %513 = load i8, i8* %512, align 1
  %514 = zext i8 %513 to i32
  %515 = ashr i32 %514, 4
  %516 = and i32 %515, 7
  %517 = trunc i32 %516 to i16
  %518 = load i16*, i16** %7, align 8
  %519 = getelementptr inbounds i16, i16* %518, i64 29
  %520 = getelementptr inbounds i16, i16* %519, i64 -13
  %521 = getelementptr inbounds i16, i16* %520, i64 21
  store i16 %517, i16* %521, align 2
  %522 = load i8*, i8** %6, align 8
  %523 = load i8, i8* %522, align 1
  %524 = zext i8 %523 to i32
  %525 = ashr i32 %524, 1
  %526 = and i32 %525, 7
  %527 = trunc i32 %526 to i16
  %528 = load i16*, i16** %7, align 8
  %529 = getelementptr inbounds i16, i16* %528, i64 29
  %530 = getelementptr inbounds i16, i16* %529, i64 -13
  %531 = getelementptr inbounds i16, i16* %530, i64 22
  store i16 %527, i16* %531, align 2
  %532 = load i8*, i8** %6, align 8
  %533 = getelementptr inbounds i8, i8* %532, i32 1
  store i8* %533, i8** %6, align 8
  %534 = load i8, i8* %532, align 1
  %535 = zext i8 %534 to i32
  %536 = and i32 %535, 1
  %537 = shl i32 %536, 2
  %538 = trunc i32 %537 to i16
  %539 = load i16*, i16** %7, align 8
  %540 = getelementptr inbounds i16, i16* %539, i64 29
  %541 = getelementptr inbounds i16, i16* %540, i64 -13
  %542 = getelementptr inbounds i16, i16* %541, i64 23
  store i16 %538, i16* %542, align 2
  %543 = load i8*, i8** %6, align 8
  %544 = load i8, i8* %543, align 1
  %545 = zext i8 %544 to i32
  %546 = ashr i32 %545, 6
  %547 = and i32 %546, 3
  %548 = load i16*, i16** %7, align 8
  %549 = getelementptr inbounds i16, i16* %548, i64 29
  %550 = getelementptr inbounds i16, i16* %549, i64 -13
  %551 = getelementptr inbounds i16, i16* %550, i64 23
  %552 = load i16, i16* %551, align 2
  %553 = sext i16 %552 to i32
  %554 = or i32 %553, %547
  %555 = trunc i32 %554 to i16
  store i16 %555, i16* %551, align 2
  %556 = load i8*, i8** %6, align 8
  %557 = load i8, i8* %556, align 1
  %558 = zext i8 %557 to i32
  %559 = ashr i32 %558, 3
  %560 = and i32 %559, 7
  %561 = trunc i32 %560 to i16
  %562 = load i16*, i16** %7, align 8
  %563 = getelementptr inbounds i16, i16* %562, i64 29
  %564 = getelementptr inbounds i16, i16* %563, i64 -13
  %565 = getelementptr inbounds i16, i16* %564, i64 24
  store i16 %561, i16* %565, align 2
  %566 = load i8*, i8** %6, align 8
  %567 = getelementptr inbounds i8, i8* %566, i32 1
  store i8* %567, i8** %6, align 8
  %568 = load i8, i8* %566, align 1
  %569 = zext i8 %568 to i32
  %570 = and i32 %569, 7
  %571 = trunc i32 %570 to i16
  %572 = load i16*, i16** %7, align 8
  %573 = getelementptr inbounds i16, i16* %572, i64 29
  %574 = getelementptr inbounds i16, i16* %573, i64 -13
  %575 = getelementptr inbounds i16, i16* %574, i64 25
  store i16 %571, i16* %575, align 2
  %576 = load i8*, i8** %6, align 8
  %577 = load i8, i8* %576, align 1
  %578 = zext i8 %577 to i32
  %579 = ashr i32 %578, 1
  %580 = and i32 %579, 127
  %581 = trunc i32 %580 to i16
  %582 = load i16*, i16** %7, align 8
  %583 = getelementptr inbounds i16, i16* %582, i64 42
  %584 = getelementptr inbounds i16, i16* %583, i64 -2
  %585 = getelementptr inbounds i16, i16* %584, i64 2
  store i16 %581, i16* %585, align 2
  %586 = load i8*, i8** %6, align 8
  %587 = getelementptr inbounds i8, i8* %586, i32 1
  store i8* %587, i8** %6, align 8
  %588 = load i8, i8* %586, align 1
  %589 = zext i8 %588 to i32
  %590 = and i32 %589, 1
  %591 = shl i32 %590, 1
  %592 = trunc i32 %591 to i16
  %593 = load i16*, i16** %7, align 8
  %594 = getelementptr inbounds i16, i16* %593, i64 43
  %595 = getelementptr inbounds i16, i16* %594, i64 -2
  %596 = getelementptr inbounds i16, i16* %595, i64 2
  store i16 %592, i16* %596, align 2
  %597 = load i8*, i8** %6, align 8
  %598 = load i8, i8* %597, align 1
  %599 = zext i8 %598 to i32
  %600 = ashr i32 %599, 7
  %601 = and i32 %600, 1
  %602 = load i16*, i16** %7, align 8
  %603 = getelementptr inbounds i16, i16* %602, i64 43
  %604 = getelementptr inbounds i16, i16* %603, i64 -2
  %605 = getelementptr inbounds i16, i16* %604, i64 2
  %606 = load i16, i16* %605, align 2
  %607 = sext i16 %606 to i32
  %608 = or i32 %607, %601
  %609 = trunc i32 %608 to i16
  store i16 %609, i16* %605, align 2
  %610 = load i8*, i8** %6, align 8
  %611 = load i8, i8* %610, align 1
  %612 = zext i8 %611 to i32
  %613 = ashr i32 %612, 5
  %614 = and i32 %613, 3
  %615 = trunc i32 %614 to i16
  %616 = load i16*, i16** %7, align 8
  %617 = getelementptr inbounds i16, i16* %616, i64 44
  %618 = getelementptr inbounds i16, i16* %617, i64 -2
  %619 = getelementptr inbounds i16, i16* %618, i64 2
  store i16 %615, i16* %619, align 2
  %620 = load i8*, i8** %6, align 8
  %621 = getelementptr inbounds i8, i8* %620, i32 1
  store i8* %621, i8** %6, align 8
  %622 = load i8, i8* %620, align 1
  %623 = zext i8 %622 to i32
  %624 = and i32 %623, 31
  %625 = shl i32 %624, 1
  %626 = trunc i32 %625 to i16
  %627 = load i16*, i16** %7, align 8
  %628 = getelementptr inbounds i16, i16* %627, i64 45
  %629 = getelementptr inbounds i16, i16* %628, i64 -2
  %630 = getelementptr inbounds i16, i16* %629, i64 2
  store i16 %626, i16* %630, align 2
  %631 = load i8*, i8** %6, align 8
  %632 = load i8, i8* %631, align 1
  %633 = zext i8 %632 to i32
  %634 = ashr i32 %633, 7
  %635 = and i32 %634, 1
  %636 = load i16*, i16** %7, align 8
  %637 = getelementptr inbounds i16, i16* %636, i64 45
  %638 = getelementptr inbounds i16, i16* %637, i64 -2
  %639 = getelementptr inbounds i16, i16* %638, i64 2
  %640 = load i16, i16* %639, align 2
  %641 = sext i16 %640 to i32
  %642 = or i32 %641, %635
  %643 = trunc i32 %642 to i16
  store i16 %643, i16* %639, align 2
  %644 = load i8*, i8** %6, align 8
  %645 = load i8, i8* %644, align 1
  %646 = zext i8 %645 to i32
  %647 = ashr i32 %646, 4
  %648 = and i32 %647, 7
  %649 = trunc i32 %648 to i16
  %650 = load i16*, i16** %7, align 8
  %651 = getelementptr inbounds i16, i16* %650, i64 46
  %652 = getelementptr inbounds i16, i16* %651, i64 -26
  %653 = getelementptr inbounds i16, i16* %652, i64 26
  store i16 %649, i16* %653, align 2
  %654 = load i8*, i8** %6, align 8
  %655 = load i8, i8* %654, align 1
  %656 = zext i8 %655 to i32
  %657 = ashr i32 %656, 1
  %658 = and i32 %657, 7
  %659 = trunc i32 %658 to i16
  %660 = load i16*, i16** %7, align 8
  %661 = getelementptr inbounds i16, i16* %660, i64 46
  %662 = getelementptr inbounds i16, i16* %661, i64 -26
  %663 = getelementptr inbounds i16, i16* %662, i64 27
  store i16 %659, i16* %663, align 2
  %664 = load i8*, i8** %6, align 8
  %665 = getelementptr inbounds i8, i8* %664, i32 1
  store i8* %665, i8** %6, align 8
  %666 = load i8, i8* %664, align 1
  %667 = zext i8 %666 to i32
  %668 = and i32 %667, 1
  %669 = shl i32 %668, 2
  %670 = trunc i32 %669 to i16
  %671 = load i16*, i16** %7, align 8
  %672 = getelementptr inbounds i16, i16* %671, i64 46
  %673 = getelementptr inbounds i16, i16* %672, i64 -26
  %674 = getelementptr inbounds i16, i16* %673, i64 28
  store i16 %670, i16* %674, align 2
  %675 = load i8*, i8** %6, align 8
  %676 = load i8, i8* %675, align 1
  %677 = zext i8 %676 to i32
  %678 = ashr i32 %677, 6
  %679 = and i32 %678, 3
  %680 = load i16*, i16** %7, align 8
  %681 = getelementptr inbounds i16, i16* %680, i64 46
  %682 = getelementptr inbounds i16, i16* %681, i64 -26
  %683 = getelementptr inbounds i16, i16* %682, i64 28
  %684 = load i16, i16* %683, align 2
  %685 = sext i16 %684 to i32
  %686 = or i32 %685, %679
  %687 = trunc i32 %686 to i16
  store i16 %687, i16* %683, align 2
  %688 = load i8*, i8** %6, align 8
  %689 = load i8, i8* %688, align 1
  %690 = zext i8 %689 to i32
  %691 = ashr i32 %690, 3
  %692 = and i32 %691, 7
  %693 = trunc i32 %692 to i16
  %694 = load i16*, i16** %7, align 8
  %695 = getelementptr inbounds i16, i16* %694, i64 46
  %696 = getelementptr inbounds i16, i16* %695, i64 -26
  %697 = getelementptr inbounds i16, i16* %696, i64 29
  store i16 %693, i16* %697, align 2
  %698 = load i8*, i8** %6, align 8
  %699 = getelementptr inbounds i8, i8* %698, i32 1
  store i8* %699, i8** %6, align 8
  %700 = load i8, i8* %698, align 1
  %701 = zext i8 %700 to i32
  %702 = and i32 %701, 7
  %703 = trunc i32 %702 to i16
  %704 = load i16*, i16** %7, align 8
  %705 = getelementptr inbounds i16, i16* %704, i64 46
  %706 = getelementptr inbounds i16, i16* %705, i64 -26
  %707 = getelementptr inbounds i16, i16* %706, i64 30
  store i16 %703, i16* %707, align 2
  %708 = load i8*, i8** %6, align 8
  %709 = load i8, i8* %708, align 1
  %710 = zext i8 %709 to i32
  %711 = ashr i32 %710, 5
  %712 = and i32 %711, 7
  %713 = trunc i32 %712 to i16
  %714 = load i16*, i16** %7, align 8
  %715 = getelementptr inbounds i16, i16* %714, i64 46
  %716 = getelementptr inbounds i16, i16* %715, i64 -26
  %717 = getelementptr inbounds i16, i16* %716, i64 31
  store i16 %713, i16* %717, align 2
  %718 = load i8*, i8** %6, align 8
  %719 = load i8, i8* %718, align 1
  %720 = zext i8 %719 to i32
  %721 = ashr i32 %720, 2
  %722 = and i32 %721, 7
  %723 = trunc i32 %722 to i16
  %724 = load i16*, i16** %7, align 8
  %725 = getelementptr inbounds i16, i16* %724, i64 46
  %726 = getelementptr inbounds i16, i16* %725, i64 -26
  %727 = getelementptr inbounds i16, i16* %726, i64 32
  store i16 %723, i16* %727, align 2
  %728 = load i8*, i8** %6, align 8
  %729 = getelementptr inbounds i8, i8* %728, i32 1
  store i8* %729, i8** %6, align 8
  %730 = load i8, i8* %728, align 1
  %731 = zext i8 %730 to i32
  %732 = and i32 %731, 3
  %733 = shl i32 %732, 1
  %734 = trunc i32 %733 to i16
  %735 = load i16*, i16** %7, align 8
  %736 = getelementptr inbounds i16, i16* %735, i64 46
  %737 = getelementptr inbounds i16, i16* %736, i64 -26
  %738 = getelementptr inbounds i16, i16* %737, i64 33
  store i16 %734, i16* %738, align 2
  %739 = load i8*, i8** %6, align 8
  %740 = load i8, i8* %739, align 1
  %741 = zext i8 %740 to i32
  %742 = ashr i32 %741, 7
  %743 = and i32 %742, 1
  %744 = load i16*, i16** %7, align 8
  %745 = getelementptr inbounds i16, i16* %744, i64 46
  %746 = getelementptr inbounds i16, i16* %745, i64 -26
  %747 = getelementptr inbounds i16, i16* %746, i64 33
  %748 = load i16, i16* %747, align 2
  %749 = sext i16 %748 to i32
  %750 = or i32 %749, %743
  %751 = trunc i32 %750 to i16
  store i16 %751, i16* %747, align 2
  %752 = load i8*, i8** %6, align 8
  %753 = load i8, i8* %752, align 1
  %754 = zext i8 %753 to i32
  %755 = ashr i32 %754, 4
  %756 = and i32 %755, 7
  %757 = trunc i32 %756 to i16
  %758 = load i16*, i16** %7, align 8
  %759 = getelementptr inbounds i16, i16* %758, i64 46
  %760 = getelementptr inbounds i16, i16* %759, i64 -26
  %761 = getelementptr inbounds i16, i16* %760, i64 34
  store i16 %757, i16* %761, align 2
  %762 = load i8*, i8** %6, align 8
  %763 = load i8, i8* %762, align 1
  %764 = zext i8 %763 to i32
  %765 = ashr i32 %764, 1
  %766 = and i32 %765, 7
  %767 = trunc i32 %766 to i16
  %768 = load i16*, i16** %7, align 8
  %769 = getelementptr inbounds i16, i16* %768, i64 46
  %770 = getelementptr inbounds i16, i16* %769, i64 -26
  %771 = getelementptr inbounds i16, i16* %770, i64 35
  store i16 %767, i16* %771, align 2
  %772 = load i8*, i8** %6, align 8
  %773 = getelementptr inbounds i8, i8* %772, i32 1
  store i8* %773, i8** %6, align 8
  %774 = load i8, i8* %772, align 1
  %775 = zext i8 %774 to i32
  %776 = and i32 %775, 1
  %777 = shl i32 %776, 2
  %778 = trunc i32 %777 to i16
  %779 = load i16*, i16** %7, align 8
  %780 = getelementptr inbounds i16, i16* %779, i64 46
  %781 = getelementptr inbounds i16, i16* %780, i64 -26
  %782 = getelementptr inbounds i16, i16* %781, i64 36
  store i16 %778, i16* %782, align 2
  %783 = load i8*, i8** %6, align 8
  %784 = load i8, i8* %783, align 1
  %785 = zext i8 %784 to i32
  %786 = ashr i32 %785, 6
  %787 = and i32 %786, 3
  %788 = load i16*, i16** %7, align 8
  %789 = getelementptr inbounds i16, i16* %788, i64 46
  %790 = getelementptr inbounds i16, i16* %789, i64 -26
  %791 = getelementptr inbounds i16, i16* %790, i64 36
  %792 = load i16, i16* %791, align 2
  %793 = sext i16 %792 to i32
  %794 = or i32 %793, %787
  %795 = trunc i32 %794 to i16
  store i16 %795, i16* %791, align 2
  %796 = load i8*, i8** %6, align 8
  %797 = load i8, i8* %796, align 1
  %798 = zext i8 %797 to i32
  %799 = ashr i32 %798, 3
  %800 = and i32 %799, 7
  %801 = trunc i32 %800 to i16
  %802 = load i16*, i16** %7, align 8
  %803 = getelementptr inbounds i16, i16* %802, i64 46
  %804 = getelementptr inbounds i16, i16* %803, i64 -26
  %805 = getelementptr inbounds i16, i16* %804, i64 37
  store i16 %801, i16* %805, align 2
  %806 = load i8*, i8** %6, align 8
  %807 = getelementptr inbounds i8, i8* %806, i32 1
  store i8* %807, i8** %6, align 8
  %808 = load i8, i8* %806, align 1
  %809 = zext i8 %808 to i32
  %810 = and i32 %809, 7
  %811 = trunc i32 %810 to i16
  %812 = load i16*, i16** %7, align 8
  %813 = getelementptr inbounds i16, i16* %812, i64 46
  %814 = getelementptr inbounds i16, i16* %813, i64 -26
  %815 = getelementptr inbounds i16, i16* %814, i64 38
  store i16 %811, i16* %815, align 2
  %816 = load i8*, i8** %6, align 8
  %817 = load i8, i8* %816, align 1
  %818 = zext i8 %817 to i32
  %819 = ashr i32 %818, 1
  %820 = and i32 %819, 127
  %821 = trunc i32 %820 to i16
  %822 = load i16*, i16** %7, align 8
  %823 = getelementptr inbounds i16, i16* %822, i64 59
  %824 = getelementptr inbounds i16, i16* %823, i64 -3
  %825 = getelementptr inbounds i16, i16* %824, i64 3
  store i16 %821, i16* %825, align 2
  %826 = load i8*, i8** %6, align 8
  %827 = getelementptr inbounds i8, i8* %826, i32 1
  store i8* %827, i8** %6, align 8
  %828 = load i8, i8* %826, align 1
  %829 = zext i8 %828 to i32
  %830 = and i32 %829, 1
  %831 = shl i32 %830, 1
  %832 = trunc i32 %831 to i16
  %833 = load i16*, i16** %7, align 8
  %834 = getelementptr inbounds i16, i16* %833, i64 60
  %835 = getelementptr inbounds i16, i16* %834, i64 -3
  %836 = getelementptr inbounds i16, i16* %835, i64 3
  store i16 %832, i16* %836, align 2
  %837 = load i8*, i8** %6, align 8
  %838 = load i8, i8* %837, align 1
  %839 = zext i8 %838 to i32
  %840 = ashr i32 %839, 7
  %841 = and i32 %840, 1
  %842 = load i16*, i16** %7, align 8
  %843 = getelementptr inbounds i16, i16* %842, i64 60
  %844 = getelementptr inbounds i16, i16* %843, i64 -3
  %845 = getelementptr inbounds i16, i16* %844, i64 3
  %846 = load i16, i16* %845, align 2
  %847 = sext i16 %846 to i32
  %848 = or i32 %847, %841
  %849 = trunc i32 %848 to i16
  store i16 %849, i16* %845, align 2
  %850 = load i8*, i8** %6, align 8
  %851 = load i8, i8* %850, align 1
  %852 = zext i8 %851 to i32
  %853 = ashr i32 %852, 5
  %854 = and i32 %853, 3
  %855 = trunc i32 %854 to i16
  %856 = load i16*, i16** %7, align 8
  %857 = getelementptr inbounds i16, i16* %856, i64 61
  %858 = getelementptr inbounds i16, i16* %857, i64 -3
  %859 = getelementptr inbounds i16, i16* %858, i64 3
  store i16 %855, i16* %859, align 2
  %860 = load i8*, i8** %6, align 8
  %861 = getelementptr inbounds i8, i8* %860, i32 1
  store i8* %861, i8** %6, align 8
  %862 = load i8, i8* %860, align 1
  %863 = zext i8 %862 to i32
  %864 = and i32 %863, 31
  %865 = shl i32 %864, 1
  %866 = trunc i32 %865 to i16
  %867 = load i16*, i16** %7, align 8
  %868 = getelementptr inbounds i16, i16* %867, i64 62
  %869 = getelementptr inbounds i16, i16* %868, i64 -3
  %870 = getelementptr inbounds i16, i16* %869, i64 3
  store i16 %866, i16* %870, align 2
  %871 = load i8*, i8** %6, align 8
  %872 = load i8, i8* %871, align 1
  %873 = zext i8 %872 to i32
  %874 = ashr i32 %873, 7
  %875 = and i32 %874, 1
  %876 = load i16*, i16** %7, align 8
  %877 = getelementptr inbounds i16, i16* %876, i64 62
  %878 = getelementptr inbounds i16, i16* %877, i64 -3
  %879 = getelementptr inbounds i16, i16* %878, i64 3
  %880 = load i16, i16* %879, align 2
  %881 = sext i16 %880 to i32
  %882 = or i32 %881, %875
  %883 = trunc i32 %882 to i16
  store i16 %883, i16* %879, align 2
  %884 = load i8*, i8** %6, align 8
  %885 = load i8, i8* %884, align 1
  %886 = zext i8 %885 to i32
  %887 = ashr i32 %886, 4
  %888 = and i32 %887, 7
  %889 = trunc i32 %888 to i16
  %890 = load i16*, i16** %7, align 8
  %891 = getelementptr inbounds i16, i16* %890, i64 63
  %892 = getelementptr inbounds i16, i16* %891, i64 -39
  %893 = getelementptr inbounds i16, i16* %892, i64 39
  store i16 %889, i16* %893, align 2
  %894 = load i8*, i8** %6, align 8
  %895 = load i8, i8* %894, align 1
  %896 = zext i8 %895 to i32
  %897 = ashr i32 %896, 1
  %898 = and i32 %897, 7
  %899 = trunc i32 %898 to i16
  %900 = load i16*, i16** %7, align 8
  %901 = getelementptr inbounds i16, i16* %900, i64 63
  %902 = getelementptr inbounds i16, i16* %901, i64 -39
  %903 = getelementptr inbounds i16, i16* %902, i64 40
  store i16 %899, i16* %903, align 2
  %904 = load i8*, i8** %6, align 8
  %905 = getelementptr inbounds i8, i8* %904, i32 1
  store i8* %905, i8** %6, align 8
  %906 = load i8, i8* %904, align 1
  %907 = zext i8 %906 to i32
  %908 = and i32 %907, 1
  %909 = shl i32 %908, 2
  %910 = trunc i32 %909 to i16
  %911 = load i16*, i16** %7, align 8
  %912 = getelementptr inbounds i16, i16* %911, i64 63
  %913 = getelementptr inbounds i16, i16* %912, i64 -39
  %914 = getelementptr inbounds i16, i16* %913, i64 41
  store i16 %910, i16* %914, align 2
  %915 = load i8*, i8** %6, align 8
  %916 = load i8, i8* %915, align 1
  %917 = zext i8 %916 to i32
  %918 = ashr i32 %917, 6
  %919 = and i32 %918, 3
  %920 = load i16*, i16** %7, align 8
  %921 = getelementptr inbounds i16, i16* %920, i64 63
  %922 = getelementptr inbounds i16, i16* %921, i64 -39
  %923 = getelementptr inbounds i16, i16* %922, i64 41
  %924 = load i16, i16* %923, align 2
  %925 = sext i16 %924 to i32
  %926 = or i32 %925, %919
  %927 = trunc i32 %926 to i16
  store i16 %927, i16* %923, align 2
  %928 = load i8*, i8** %6, align 8
  %929 = load i8, i8* %928, align 1
  %930 = zext i8 %929 to i32
  %931 = ashr i32 %930, 3
  %932 = and i32 %931, 7
  %933 = trunc i32 %932 to i16
  %934 = load i16*, i16** %7, align 8
  %935 = getelementptr inbounds i16, i16* %934, i64 63
  %936 = getelementptr inbounds i16, i16* %935, i64 -39
  %937 = getelementptr inbounds i16, i16* %936, i64 42
  store i16 %933, i16* %937, align 2
  %938 = load i8*, i8** %6, align 8
  %939 = getelementptr inbounds i8, i8* %938, i32 1
  store i8* %939, i8** %6, align 8
  %940 = load i8, i8* %938, align 1
  %941 = zext i8 %940 to i32
  %942 = and i32 %941, 7
  %943 = trunc i32 %942 to i16
  %944 = load i16*, i16** %7, align 8
  %945 = getelementptr inbounds i16, i16* %944, i64 63
  %946 = getelementptr inbounds i16, i16* %945, i64 -39
  %947 = getelementptr inbounds i16, i16* %946, i64 43
  store i16 %943, i16* %947, align 2
  %948 = load i8*, i8** %6, align 8
  %949 = load i8, i8* %948, align 1
  %950 = zext i8 %949 to i32
  %951 = ashr i32 %950, 5
  %952 = and i32 %951, 7
  %953 = trunc i32 %952 to i16
  %954 = load i16*, i16** %7, align 8
  %955 = getelementptr inbounds i16, i16* %954, i64 63
  %956 = getelementptr inbounds i16, i16* %955, i64 -39
  %957 = getelementptr inbounds i16, i16* %956, i64 44
  store i16 %953, i16* %957, align 2
  %958 = load i8*, i8** %6, align 8
  %959 = load i8, i8* %958, align 1
  %960 = zext i8 %959 to i32
  %961 = ashr i32 %960, 2
  %962 = and i32 %961, 7
  %963 = trunc i32 %962 to i16
  %964 = load i16*, i16** %7, align 8
  %965 = getelementptr inbounds i16, i16* %964, i64 63
  %966 = getelementptr inbounds i16, i16* %965, i64 -39
  %967 = getelementptr inbounds i16, i16* %966, i64 45
  store i16 %963, i16* %967, align 2
  %968 = load i8*, i8** %6, align 8
  %969 = getelementptr inbounds i8, i8* %968, i32 1
  store i8* %969, i8** %6, align 8
  %970 = load i8, i8* %968, align 1
  %971 = zext i8 %970 to i32
  %972 = and i32 %971, 3
  %973 = shl i32 %972, 1
  %974 = trunc i32 %973 to i16
  %975 = load i16*, i16** %7, align 8
  %976 = getelementptr inbounds i16, i16* %975, i64 63
  %977 = getelementptr inbounds i16, i16* %976, i64 -39
  %978 = getelementptr inbounds i16, i16* %977, i64 46
  store i16 %974, i16* %978, align 2
  %979 = load i8*, i8** %6, align 8
  %980 = load i8, i8* %979, align 1
  %981 = zext i8 %980 to i32
  %982 = ashr i32 %981, 7
  %983 = and i32 %982, 1
  %984 = load i16*, i16** %7, align 8
  %985 = getelementptr inbounds i16, i16* %984, i64 63
  %986 = getelementptr inbounds i16, i16* %985, i64 -39
  %987 = getelementptr inbounds i16, i16* %986, i64 46
  %988 = load i16, i16* %987, align 2
  %989 = sext i16 %988 to i32
  %990 = or i32 %989, %983
  %991 = trunc i32 %990 to i16
  store i16 %991, i16* %987, align 2
  %992 = load i8*, i8** %6, align 8
  %993 = load i8, i8* %992, align 1
  %994 = zext i8 %993 to i32
  %995 = ashr i32 %994, 4
  %996 = and i32 %995, 7
  %997 = trunc i32 %996 to i16
  %998 = load i16*, i16** %7, align 8
  %999 = getelementptr inbounds i16, i16* %998, i64 63
  %1000 = getelementptr inbounds i16, i16* %999, i64 -39
  %1001 = getelementptr inbounds i16, i16* %1000, i64 47
  store i16 %997, i16* %1001, align 2
  %1002 = load i8*, i8** %6, align 8
  %1003 = load i8, i8* %1002, align 1
  %1004 = zext i8 %1003 to i32
  %1005 = ashr i32 %1004, 1
  %1006 = and i32 %1005, 7
  %1007 = trunc i32 %1006 to i16
  %1008 = load i16*, i16** %7, align 8
  %1009 = getelementptr inbounds i16, i16* %1008, i64 63
  %1010 = getelementptr inbounds i16, i16* %1009, i64 -39
  %1011 = getelementptr inbounds i16, i16* %1010, i64 48
  store i16 %1007, i16* %1011, align 2
  %1012 = load i8*, i8** %6, align 8
  %1013 = getelementptr inbounds i8, i8* %1012, i32 1
  store i8* %1013, i8** %6, align 8
  %1014 = load i8, i8* %1012, align 1
  %1015 = zext i8 %1014 to i32
  %1016 = and i32 %1015, 1
  %1017 = shl i32 %1016, 2
  %1018 = trunc i32 %1017 to i16
  %1019 = load i16*, i16** %7, align 8
  %1020 = getelementptr inbounds i16, i16* %1019, i64 63
  %1021 = getelementptr inbounds i16, i16* %1020, i64 -39
  %1022 = getelementptr inbounds i16, i16* %1021, i64 49
  store i16 %1018, i16* %1022, align 2
  %1023 = load i8*, i8** %6, align 8
  %1024 = load i8, i8* %1023, align 1
  %1025 = zext i8 %1024 to i32
  %1026 = ashr i32 %1025, 6
  %1027 = and i32 %1026, 3
  %1028 = load i16*, i16** %7, align 8
  %1029 = getelementptr inbounds i16, i16* %1028, i64 63
  %1030 = getelementptr inbounds i16, i16* %1029, i64 -39
  %1031 = getelementptr inbounds i16, i16* %1030, i64 49
  %1032 = load i16, i16* %1031, align 2
  %1033 = sext i16 %1032 to i32
  %1034 = or i32 %1033, %1027
  %1035 = trunc i32 %1034 to i16
  store i16 %1035, i16* %1031, align 2
  %1036 = load i8*, i8** %6, align 8
  %1037 = load i8, i8* %1036, align 1
  %1038 = zext i8 %1037 to i32
  %1039 = ashr i32 %1038, 3
  %1040 = and i32 %1039, 7
  %1041 = trunc i32 %1040 to i16
  %1042 = load i16*, i16** %7, align 8
  %1043 = getelementptr inbounds i16, i16* %1042, i64 63
  %1044 = getelementptr inbounds i16, i16* %1043, i64 -39
  %1045 = getelementptr inbounds i16, i16* %1044, i64 50
  store i16 %1041, i16* %1045, align 2
  %1046 = load i8*, i8** %6, align 8
  %1047 = load i8, i8* %1046, align 1
  %1048 = zext i8 %1047 to i32
  %1049 = and i32 %1048, 7
  %1050 = trunc i32 %1049 to i16
  %1051 = load i16*, i16** %7, align 8
  %1052 = getelementptr inbounds i16, i16* %1051, i64 63
  %1053 = getelementptr inbounds i16, i16* %1052, i64 -39
  %1054 = getelementptr inbounds i16, i16* %1053, i64 51
  store i16 %1050, i16* %1054, align 2
  store i32 0, i32* %4, align 4
  br label %1055

; <label>:1055:                                   ; preds = %16, %14
  %1056 = load i32, i32* %4, align 4
  ret i32 %1056
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
