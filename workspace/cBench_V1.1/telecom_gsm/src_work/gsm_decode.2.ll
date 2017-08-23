; ModuleID = 'tmp1.ll'
source_filename = "gsm_decode.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_gsm_decode = private constant [10 x i8] c"gsm_decode"
@__profc_gsm_decode = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_decode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -168150544429510211, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_decode, i32 0, i32 0), i8* bitcast (i32 (%struct.gsm_state*, i8*, i16*)* @gsm_decode to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [20 x i8] c"\0A\12x\DAK/\CE\8DOIM\CEOI\05\00\16s\04\0B", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_decode to i8*), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @gsm_decode(%struct.gsm_state*, i8*, i16*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.gsm_state*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca [8 x i16], align 16
  %9 = alloca [4 x i16], align 2
  %10 = alloca [4 x i16], align 2
  %11 = alloca [4 x i16], align 2
  %12 = alloca [4 x i16], align 2
  %13 = alloca [52 x i16], align 16
  store %struct.gsm_state* %0, %struct.gsm_state** %5, align 8
  store i8* %1, i8** %6, align 8
  store i16* %2, i16** %7, align 8
  %14 = load i8*, i8** %6, align 8
  %15 = load i8, i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = ashr i32 %16, 4
  %18 = and i32 %17, 15
  %19 = icmp ne i32 %18, 13
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_decode, i64 0, i64 0)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_decode, i64 0, i64 0)
  store i32 -1, i32* %4, align 4
  br label %816

; <label>:22:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_decode, i64 0, i64 1)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_decode, i64 0, i64 1)
  %24 = load i8*, i8** %6, align 8
  %25 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %25, i8** %6, align 8
  %26 = load i8, i8* %24, align 1
  %27 = zext i8 %26 to i32
  %28 = and i32 %27, 15
  %29 = shl i32 %28, 2
  %30 = trunc i32 %29 to i16
  %31 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 0
  store i16 %30, i16* %31, align 16
  %32 = load i8*, i8** %6, align 8
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i32
  %35 = ashr i32 %34, 6
  %36 = and i32 %35, 3
  %37 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 0
  %38 = load i16, i16* %37, align 16
  %39 = sext i16 %38 to i32
  %40 = or i32 %39, %36
  %41 = trunc i32 %40 to i16
  store i16 %41, i16* %37, align 16
  %42 = load i8*, i8** %6, align 8
  %43 = getelementptr inbounds i8, i8* %42, i32 1
  store i8* %43, i8** %6, align 8
  %44 = load i8, i8* %42, align 1
  %45 = zext i8 %44 to i32
  %46 = and i32 %45, 63
  %47 = trunc i32 %46 to i16
  %48 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 1
  store i16 %47, i16* %48, align 2
  %49 = load i8*, i8** %6, align 8
  %50 = load i8, i8* %49, align 1
  %51 = zext i8 %50 to i32
  %52 = ashr i32 %51, 3
  %53 = and i32 %52, 31
  %54 = trunc i32 %53 to i16
  %55 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 2
  store i16 %54, i16* %55, align 4
  %56 = load i8*, i8** %6, align 8
  %57 = getelementptr inbounds i8, i8* %56, i32 1
  store i8* %57, i8** %6, align 8
  %58 = load i8, i8* %56, align 1
  %59 = zext i8 %58 to i32
  %60 = and i32 %59, 7
  %61 = shl i32 %60, 2
  %62 = trunc i32 %61 to i16
  %63 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 3
  store i16 %62, i16* %63, align 2
  %64 = load i8*, i8** %6, align 8
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = ashr i32 %66, 6
  %68 = and i32 %67, 3
  %69 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 3
  %70 = load i16, i16* %69, align 2
  %71 = sext i16 %70 to i32
  %72 = or i32 %71, %68
  %73 = trunc i32 %72 to i16
  store i16 %73, i16* %69, align 2
  %74 = load i8*, i8** %6, align 8
  %75 = load i8, i8* %74, align 1
  %76 = zext i8 %75 to i32
  %77 = ashr i32 %76, 2
  %78 = and i32 %77, 15
  %79 = trunc i32 %78 to i16
  %80 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 4
  store i16 %79, i16* %80, align 8
  %81 = load i8*, i8** %6, align 8
  %82 = getelementptr inbounds i8, i8* %81, i32 1
  store i8* %82, i8** %6, align 8
  %83 = load i8, i8* %81, align 1
  %84 = zext i8 %83 to i32
  %85 = and i32 %84, 3
  %86 = shl i32 %85, 2
  %87 = trunc i32 %86 to i16
  %88 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 5
  store i16 %87, i16* %88, align 2
  %89 = load i8*, i8** %6, align 8
  %90 = load i8, i8* %89, align 1
  %91 = zext i8 %90 to i32
  %92 = ashr i32 %91, 6
  %93 = and i32 %92, 3
  %94 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 5
  %95 = load i16, i16* %94, align 2
  %96 = sext i16 %95 to i32
  %97 = or i32 %96, %93
  %98 = trunc i32 %97 to i16
  store i16 %98, i16* %94, align 2
  %99 = load i8*, i8** %6, align 8
  %100 = load i8, i8* %99, align 1
  %101 = zext i8 %100 to i32
  %102 = ashr i32 %101, 3
  %103 = and i32 %102, 7
  %104 = trunc i32 %103 to i16
  %105 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 6
  store i16 %104, i16* %105, align 4
  %106 = load i8*, i8** %6, align 8
  %107 = getelementptr inbounds i8, i8* %106, i32 1
  store i8* %107, i8** %6, align 8
  %108 = load i8, i8* %106, align 1
  %109 = zext i8 %108 to i32
  %110 = and i32 %109, 7
  %111 = trunc i32 %110 to i16
  %112 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i64 0, i64 7
  store i16 %111, i16* %112, align 2
  %113 = load i8*, i8** %6, align 8
  %114 = load i8, i8* %113, align 1
  %115 = zext i8 %114 to i32
  %116 = ashr i32 %115, 1
  %117 = and i32 %116, 127
  %118 = trunc i32 %117 to i16
  %119 = getelementptr inbounds [4 x i16], [4 x i16]* %9, i64 0, i64 0
  store i16 %118, i16* %119, align 2
  %120 = load i8*, i8** %6, align 8
  %121 = getelementptr inbounds i8, i8* %120, i32 1
  store i8* %121, i8** %6, align 8
  %122 = load i8, i8* %120, align 1
  %123 = zext i8 %122 to i32
  %124 = and i32 %123, 1
  %125 = shl i32 %124, 1
  %126 = trunc i32 %125 to i16
  %127 = getelementptr inbounds [4 x i16], [4 x i16]* %11, i64 0, i64 0
  store i16 %126, i16* %127, align 2
  %128 = load i8*, i8** %6, align 8
  %129 = load i8, i8* %128, align 1
  %130 = zext i8 %129 to i32
  %131 = ashr i32 %130, 7
  %132 = and i32 %131, 1
  %133 = getelementptr inbounds [4 x i16], [4 x i16]* %11, i64 0, i64 0
  %134 = load i16, i16* %133, align 2
  %135 = sext i16 %134 to i32
  %136 = or i32 %135, %132
  %137 = trunc i32 %136 to i16
  store i16 %137, i16* %133, align 2
  %138 = load i8*, i8** %6, align 8
  %139 = load i8, i8* %138, align 1
  %140 = zext i8 %139 to i32
  %141 = ashr i32 %140, 5
  %142 = and i32 %141, 3
  %143 = trunc i32 %142 to i16
  %144 = getelementptr inbounds [4 x i16], [4 x i16]* %10, i64 0, i64 0
  store i16 %143, i16* %144, align 2
  %145 = load i8*, i8** %6, align 8
  %146 = getelementptr inbounds i8, i8* %145, i32 1
  store i8* %146, i8** %6, align 8
  %147 = load i8, i8* %145, align 1
  %148 = zext i8 %147 to i32
  %149 = and i32 %148, 31
  %150 = shl i32 %149, 1
  %151 = trunc i32 %150 to i16
  %152 = getelementptr inbounds [4 x i16], [4 x i16]* %12, i64 0, i64 0
  store i16 %151, i16* %152, align 2
  %153 = load i8*, i8** %6, align 8
  %154 = load i8, i8* %153, align 1
  %155 = zext i8 %154 to i32
  %156 = ashr i32 %155, 7
  %157 = and i32 %156, 1
  %158 = getelementptr inbounds [4 x i16], [4 x i16]* %12, i64 0, i64 0
  %159 = load i16, i16* %158, align 2
  %160 = sext i16 %159 to i32
  %161 = or i32 %160, %157
  %162 = trunc i32 %161 to i16
  store i16 %162, i16* %158, align 2
  %163 = load i8*, i8** %6, align 8
  %164 = load i8, i8* %163, align 1
  %165 = zext i8 %164 to i32
  %166 = ashr i32 %165, 4
  %167 = and i32 %166, 7
  %168 = trunc i32 %167 to i16
  %169 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 0
  store i16 %168, i16* %169, align 16
  %170 = load i8*, i8** %6, align 8
  %171 = load i8, i8* %170, align 1
  %172 = zext i8 %171 to i32
  %173 = ashr i32 %172, 1
  %174 = and i32 %173, 7
  %175 = trunc i32 %174 to i16
  %176 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 1
  store i16 %175, i16* %176, align 2
  %177 = load i8*, i8** %6, align 8
  %178 = getelementptr inbounds i8, i8* %177, i32 1
  store i8* %178, i8** %6, align 8
  %179 = load i8, i8* %177, align 1
  %180 = zext i8 %179 to i32
  %181 = and i32 %180, 1
  %182 = shl i32 %181, 2
  %183 = trunc i32 %182 to i16
  %184 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 2
  store i16 %183, i16* %184, align 4
  %185 = load i8*, i8** %6, align 8
  %186 = load i8, i8* %185, align 1
  %187 = zext i8 %186 to i32
  %188 = ashr i32 %187, 6
  %189 = and i32 %188, 3
  %190 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 2
  %191 = load i16, i16* %190, align 4
  %192 = sext i16 %191 to i32
  %193 = or i32 %192, %189
  %194 = trunc i32 %193 to i16
  store i16 %194, i16* %190, align 4
  %195 = load i8*, i8** %6, align 8
  %196 = load i8, i8* %195, align 1
  %197 = zext i8 %196 to i32
  %198 = ashr i32 %197, 3
  %199 = and i32 %198, 7
  %200 = trunc i32 %199 to i16
  %201 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 3
  store i16 %200, i16* %201, align 2
  %202 = load i8*, i8** %6, align 8
  %203 = getelementptr inbounds i8, i8* %202, i32 1
  store i8* %203, i8** %6, align 8
  %204 = load i8, i8* %202, align 1
  %205 = zext i8 %204 to i32
  %206 = and i32 %205, 7
  %207 = trunc i32 %206 to i16
  %208 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 4
  store i16 %207, i16* %208, align 8
  %209 = load i8*, i8** %6, align 8
  %210 = load i8, i8* %209, align 1
  %211 = zext i8 %210 to i32
  %212 = ashr i32 %211, 5
  %213 = and i32 %212, 7
  %214 = trunc i32 %213 to i16
  %215 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 5
  store i16 %214, i16* %215, align 2
  %216 = load i8*, i8** %6, align 8
  %217 = load i8, i8* %216, align 1
  %218 = zext i8 %217 to i32
  %219 = ashr i32 %218, 2
  %220 = and i32 %219, 7
  %221 = trunc i32 %220 to i16
  %222 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 6
  store i16 %221, i16* %222, align 4
  %223 = load i8*, i8** %6, align 8
  %224 = getelementptr inbounds i8, i8* %223, i32 1
  store i8* %224, i8** %6, align 8
  %225 = load i8, i8* %223, align 1
  %226 = zext i8 %225 to i32
  %227 = and i32 %226, 3
  %228 = shl i32 %227, 1
  %229 = trunc i32 %228 to i16
  %230 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 7
  store i16 %229, i16* %230, align 2
  %231 = load i8*, i8** %6, align 8
  %232 = load i8, i8* %231, align 1
  %233 = zext i8 %232 to i32
  %234 = ashr i32 %233, 7
  %235 = and i32 %234, 1
  %236 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 7
  %237 = load i16, i16* %236, align 2
  %238 = sext i16 %237 to i32
  %239 = or i32 %238, %235
  %240 = trunc i32 %239 to i16
  store i16 %240, i16* %236, align 2
  %241 = load i8*, i8** %6, align 8
  %242 = load i8, i8* %241, align 1
  %243 = zext i8 %242 to i32
  %244 = ashr i32 %243, 4
  %245 = and i32 %244, 7
  %246 = trunc i32 %245 to i16
  %247 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 8
  store i16 %246, i16* %247, align 16
  %248 = load i8*, i8** %6, align 8
  %249 = load i8, i8* %248, align 1
  %250 = zext i8 %249 to i32
  %251 = ashr i32 %250, 1
  %252 = and i32 %251, 7
  %253 = trunc i32 %252 to i16
  %254 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 9
  store i16 %253, i16* %254, align 2
  %255 = load i8*, i8** %6, align 8
  %256 = getelementptr inbounds i8, i8* %255, i32 1
  store i8* %256, i8** %6, align 8
  %257 = load i8, i8* %255, align 1
  %258 = zext i8 %257 to i32
  %259 = and i32 %258, 1
  %260 = shl i32 %259, 2
  %261 = trunc i32 %260 to i16
  %262 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 10
  store i16 %261, i16* %262, align 4
  %263 = load i8*, i8** %6, align 8
  %264 = load i8, i8* %263, align 1
  %265 = zext i8 %264 to i32
  %266 = ashr i32 %265, 6
  %267 = and i32 %266, 3
  %268 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 10
  %269 = load i16, i16* %268, align 4
  %270 = sext i16 %269 to i32
  %271 = or i32 %270, %267
  %272 = trunc i32 %271 to i16
  store i16 %272, i16* %268, align 4
  %273 = load i8*, i8** %6, align 8
  %274 = load i8, i8* %273, align 1
  %275 = zext i8 %274 to i32
  %276 = ashr i32 %275, 3
  %277 = and i32 %276, 7
  %278 = trunc i32 %277 to i16
  %279 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 11
  store i16 %278, i16* %279, align 2
  %280 = load i8*, i8** %6, align 8
  %281 = getelementptr inbounds i8, i8* %280, i32 1
  store i8* %281, i8** %6, align 8
  %282 = load i8, i8* %280, align 1
  %283 = zext i8 %282 to i32
  %284 = and i32 %283, 7
  %285 = trunc i32 %284 to i16
  %286 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 12
  store i16 %285, i16* %286, align 8
  %287 = load i8*, i8** %6, align 8
  %288 = load i8, i8* %287, align 1
  %289 = zext i8 %288 to i32
  %290 = ashr i32 %289, 1
  %291 = and i32 %290, 127
  %292 = trunc i32 %291 to i16
  %293 = getelementptr inbounds [4 x i16], [4 x i16]* %9, i64 0, i64 1
  store i16 %292, i16* %293, align 2
  %294 = load i8*, i8** %6, align 8
  %295 = getelementptr inbounds i8, i8* %294, i32 1
  store i8* %295, i8** %6, align 8
  %296 = load i8, i8* %294, align 1
  %297 = zext i8 %296 to i32
  %298 = and i32 %297, 1
  %299 = shl i32 %298, 1
  %300 = trunc i32 %299 to i16
  %301 = getelementptr inbounds [4 x i16], [4 x i16]* %11, i64 0, i64 1
  store i16 %300, i16* %301, align 2
  %302 = load i8*, i8** %6, align 8
  %303 = load i8, i8* %302, align 1
  %304 = zext i8 %303 to i32
  %305 = ashr i32 %304, 7
  %306 = and i32 %305, 1
  %307 = getelementptr inbounds [4 x i16], [4 x i16]* %11, i64 0, i64 1
  %308 = load i16, i16* %307, align 2
  %309 = sext i16 %308 to i32
  %310 = or i32 %309, %306
  %311 = trunc i32 %310 to i16
  store i16 %311, i16* %307, align 2
  %312 = load i8*, i8** %6, align 8
  %313 = load i8, i8* %312, align 1
  %314 = zext i8 %313 to i32
  %315 = ashr i32 %314, 5
  %316 = and i32 %315, 3
  %317 = trunc i32 %316 to i16
  %318 = getelementptr inbounds [4 x i16], [4 x i16]* %10, i64 0, i64 1
  store i16 %317, i16* %318, align 2
  %319 = load i8*, i8** %6, align 8
  %320 = getelementptr inbounds i8, i8* %319, i32 1
  store i8* %320, i8** %6, align 8
  %321 = load i8, i8* %319, align 1
  %322 = zext i8 %321 to i32
  %323 = and i32 %322, 31
  %324 = shl i32 %323, 1
  %325 = trunc i32 %324 to i16
  %326 = getelementptr inbounds [4 x i16], [4 x i16]* %12, i64 0, i64 1
  store i16 %325, i16* %326, align 2
  %327 = load i8*, i8** %6, align 8
  %328 = load i8, i8* %327, align 1
  %329 = zext i8 %328 to i32
  %330 = ashr i32 %329, 7
  %331 = and i32 %330, 1
  %332 = getelementptr inbounds [4 x i16], [4 x i16]* %12, i64 0, i64 1
  %333 = load i16, i16* %332, align 2
  %334 = sext i16 %333 to i32
  %335 = or i32 %334, %331
  %336 = trunc i32 %335 to i16
  store i16 %336, i16* %332, align 2
  %337 = load i8*, i8** %6, align 8
  %338 = load i8, i8* %337, align 1
  %339 = zext i8 %338 to i32
  %340 = ashr i32 %339, 4
  %341 = and i32 %340, 7
  %342 = trunc i32 %341 to i16
  %343 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 13
  store i16 %342, i16* %343, align 2
  %344 = load i8*, i8** %6, align 8
  %345 = load i8, i8* %344, align 1
  %346 = zext i8 %345 to i32
  %347 = ashr i32 %346, 1
  %348 = and i32 %347, 7
  %349 = trunc i32 %348 to i16
  %350 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 14
  store i16 %349, i16* %350, align 4
  %351 = load i8*, i8** %6, align 8
  %352 = getelementptr inbounds i8, i8* %351, i32 1
  store i8* %352, i8** %6, align 8
  %353 = load i8, i8* %351, align 1
  %354 = zext i8 %353 to i32
  %355 = and i32 %354, 1
  %356 = shl i32 %355, 2
  %357 = trunc i32 %356 to i16
  %358 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 15
  store i16 %357, i16* %358, align 2
  %359 = load i8*, i8** %6, align 8
  %360 = load i8, i8* %359, align 1
  %361 = zext i8 %360 to i32
  %362 = ashr i32 %361, 6
  %363 = and i32 %362, 3
  %364 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 15
  %365 = load i16, i16* %364, align 2
  %366 = sext i16 %365 to i32
  %367 = or i32 %366, %363
  %368 = trunc i32 %367 to i16
  store i16 %368, i16* %364, align 2
  %369 = load i8*, i8** %6, align 8
  %370 = load i8, i8* %369, align 1
  %371 = zext i8 %370 to i32
  %372 = ashr i32 %371, 3
  %373 = and i32 %372, 7
  %374 = trunc i32 %373 to i16
  %375 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 16
  store i16 %374, i16* %375, align 16
  %376 = load i8*, i8** %6, align 8
  %377 = getelementptr inbounds i8, i8* %376, i32 1
  store i8* %377, i8** %6, align 8
  %378 = load i8, i8* %376, align 1
  %379 = zext i8 %378 to i32
  %380 = and i32 %379, 7
  %381 = trunc i32 %380 to i16
  %382 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 17
  store i16 %381, i16* %382, align 2
  %383 = load i8*, i8** %6, align 8
  %384 = load i8, i8* %383, align 1
  %385 = zext i8 %384 to i32
  %386 = ashr i32 %385, 5
  %387 = and i32 %386, 7
  %388 = trunc i32 %387 to i16
  %389 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 18
  store i16 %388, i16* %389, align 4
  %390 = load i8*, i8** %6, align 8
  %391 = load i8, i8* %390, align 1
  %392 = zext i8 %391 to i32
  %393 = ashr i32 %392, 2
  %394 = and i32 %393, 7
  %395 = trunc i32 %394 to i16
  %396 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 19
  store i16 %395, i16* %396, align 2
  %397 = load i8*, i8** %6, align 8
  %398 = getelementptr inbounds i8, i8* %397, i32 1
  store i8* %398, i8** %6, align 8
  %399 = load i8, i8* %397, align 1
  %400 = zext i8 %399 to i32
  %401 = and i32 %400, 3
  %402 = shl i32 %401, 1
  %403 = trunc i32 %402 to i16
  %404 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 20
  store i16 %403, i16* %404, align 8
  %405 = load i8*, i8** %6, align 8
  %406 = load i8, i8* %405, align 1
  %407 = zext i8 %406 to i32
  %408 = ashr i32 %407, 7
  %409 = and i32 %408, 1
  %410 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 20
  %411 = load i16, i16* %410, align 8
  %412 = sext i16 %411 to i32
  %413 = or i32 %412, %409
  %414 = trunc i32 %413 to i16
  store i16 %414, i16* %410, align 8
  %415 = load i8*, i8** %6, align 8
  %416 = load i8, i8* %415, align 1
  %417 = zext i8 %416 to i32
  %418 = ashr i32 %417, 4
  %419 = and i32 %418, 7
  %420 = trunc i32 %419 to i16
  %421 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 21
  store i16 %420, i16* %421, align 2
  %422 = load i8*, i8** %6, align 8
  %423 = load i8, i8* %422, align 1
  %424 = zext i8 %423 to i32
  %425 = ashr i32 %424, 1
  %426 = and i32 %425, 7
  %427 = trunc i32 %426 to i16
  %428 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 22
  store i16 %427, i16* %428, align 4
  %429 = load i8*, i8** %6, align 8
  %430 = getelementptr inbounds i8, i8* %429, i32 1
  store i8* %430, i8** %6, align 8
  %431 = load i8, i8* %429, align 1
  %432 = zext i8 %431 to i32
  %433 = and i32 %432, 1
  %434 = shl i32 %433, 2
  %435 = trunc i32 %434 to i16
  %436 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 23
  store i16 %435, i16* %436, align 2
  %437 = load i8*, i8** %6, align 8
  %438 = load i8, i8* %437, align 1
  %439 = zext i8 %438 to i32
  %440 = ashr i32 %439, 6
  %441 = and i32 %440, 3
  %442 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 23
  %443 = load i16, i16* %442, align 2
  %444 = sext i16 %443 to i32
  %445 = or i32 %444, %441
  %446 = trunc i32 %445 to i16
  store i16 %446, i16* %442, align 2
  %447 = load i8*, i8** %6, align 8
  %448 = load i8, i8* %447, align 1
  %449 = zext i8 %448 to i32
  %450 = ashr i32 %449, 3
  %451 = and i32 %450, 7
  %452 = trunc i32 %451 to i16
  %453 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 24
  store i16 %452, i16* %453, align 16
  %454 = load i8*, i8** %6, align 8
  %455 = getelementptr inbounds i8, i8* %454, i32 1
  store i8* %455, i8** %6, align 8
  %456 = load i8, i8* %454, align 1
  %457 = zext i8 %456 to i32
  %458 = and i32 %457, 7
  %459 = trunc i32 %458 to i16
  %460 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 25
  store i16 %459, i16* %460, align 2
  %461 = load i8*, i8** %6, align 8
  %462 = load i8, i8* %461, align 1
  %463 = zext i8 %462 to i32
  %464 = ashr i32 %463, 1
  %465 = and i32 %464, 127
  %466 = trunc i32 %465 to i16
  %467 = getelementptr inbounds [4 x i16], [4 x i16]* %9, i64 0, i64 2
  store i16 %466, i16* %467, align 2
  %468 = load i8*, i8** %6, align 8
  %469 = getelementptr inbounds i8, i8* %468, i32 1
  store i8* %469, i8** %6, align 8
  %470 = load i8, i8* %468, align 1
  %471 = zext i8 %470 to i32
  %472 = and i32 %471, 1
  %473 = shl i32 %472, 1
  %474 = trunc i32 %473 to i16
  %475 = getelementptr inbounds [4 x i16], [4 x i16]* %11, i64 0, i64 2
  store i16 %474, i16* %475, align 2
  %476 = load i8*, i8** %6, align 8
  %477 = load i8, i8* %476, align 1
  %478 = zext i8 %477 to i32
  %479 = ashr i32 %478, 7
  %480 = and i32 %479, 1
  %481 = getelementptr inbounds [4 x i16], [4 x i16]* %11, i64 0, i64 2
  %482 = load i16, i16* %481, align 2
  %483 = sext i16 %482 to i32
  %484 = or i32 %483, %480
  %485 = trunc i32 %484 to i16
  store i16 %485, i16* %481, align 2
  %486 = load i8*, i8** %6, align 8
  %487 = load i8, i8* %486, align 1
  %488 = zext i8 %487 to i32
  %489 = ashr i32 %488, 5
  %490 = and i32 %489, 3
  %491 = trunc i32 %490 to i16
  %492 = getelementptr inbounds [4 x i16], [4 x i16]* %10, i64 0, i64 2
  store i16 %491, i16* %492, align 2
  %493 = load i8*, i8** %6, align 8
  %494 = getelementptr inbounds i8, i8* %493, i32 1
  store i8* %494, i8** %6, align 8
  %495 = load i8, i8* %493, align 1
  %496 = zext i8 %495 to i32
  %497 = and i32 %496, 31
  %498 = shl i32 %497, 1
  %499 = trunc i32 %498 to i16
  %500 = getelementptr inbounds [4 x i16], [4 x i16]* %12, i64 0, i64 2
  store i16 %499, i16* %500, align 2
  %501 = load i8*, i8** %6, align 8
  %502 = load i8, i8* %501, align 1
  %503 = zext i8 %502 to i32
  %504 = ashr i32 %503, 7
  %505 = and i32 %504, 1
  %506 = getelementptr inbounds [4 x i16], [4 x i16]* %12, i64 0, i64 2
  %507 = load i16, i16* %506, align 2
  %508 = sext i16 %507 to i32
  %509 = or i32 %508, %505
  %510 = trunc i32 %509 to i16
  store i16 %510, i16* %506, align 2
  %511 = load i8*, i8** %6, align 8
  %512 = load i8, i8* %511, align 1
  %513 = zext i8 %512 to i32
  %514 = ashr i32 %513, 4
  %515 = and i32 %514, 7
  %516 = trunc i32 %515 to i16
  %517 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 26
  store i16 %516, i16* %517, align 4
  %518 = load i8*, i8** %6, align 8
  %519 = load i8, i8* %518, align 1
  %520 = zext i8 %519 to i32
  %521 = ashr i32 %520, 1
  %522 = and i32 %521, 7
  %523 = trunc i32 %522 to i16
  %524 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 27
  store i16 %523, i16* %524, align 2
  %525 = load i8*, i8** %6, align 8
  %526 = getelementptr inbounds i8, i8* %525, i32 1
  store i8* %526, i8** %6, align 8
  %527 = load i8, i8* %525, align 1
  %528 = zext i8 %527 to i32
  %529 = and i32 %528, 1
  %530 = shl i32 %529, 2
  %531 = trunc i32 %530 to i16
  %532 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 28
  store i16 %531, i16* %532, align 8
  %533 = load i8*, i8** %6, align 8
  %534 = load i8, i8* %533, align 1
  %535 = zext i8 %534 to i32
  %536 = ashr i32 %535, 6
  %537 = and i32 %536, 3
  %538 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 28
  %539 = load i16, i16* %538, align 8
  %540 = sext i16 %539 to i32
  %541 = or i32 %540, %537
  %542 = trunc i32 %541 to i16
  store i16 %542, i16* %538, align 8
  %543 = load i8*, i8** %6, align 8
  %544 = load i8, i8* %543, align 1
  %545 = zext i8 %544 to i32
  %546 = ashr i32 %545, 3
  %547 = and i32 %546, 7
  %548 = trunc i32 %547 to i16
  %549 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 29
  store i16 %548, i16* %549, align 2
  %550 = load i8*, i8** %6, align 8
  %551 = getelementptr inbounds i8, i8* %550, i32 1
  store i8* %551, i8** %6, align 8
  %552 = load i8, i8* %550, align 1
  %553 = zext i8 %552 to i32
  %554 = and i32 %553, 7
  %555 = trunc i32 %554 to i16
  %556 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 30
  store i16 %555, i16* %556, align 4
  %557 = load i8*, i8** %6, align 8
  %558 = load i8, i8* %557, align 1
  %559 = zext i8 %558 to i32
  %560 = ashr i32 %559, 5
  %561 = and i32 %560, 7
  %562 = trunc i32 %561 to i16
  %563 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 31
  store i16 %562, i16* %563, align 2
  %564 = load i8*, i8** %6, align 8
  %565 = load i8, i8* %564, align 1
  %566 = zext i8 %565 to i32
  %567 = ashr i32 %566, 2
  %568 = and i32 %567, 7
  %569 = trunc i32 %568 to i16
  %570 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 32
  store i16 %569, i16* %570, align 16
  %571 = load i8*, i8** %6, align 8
  %572 = getelementptr inbounds i8, i8* %571, i32 1
  store i8* %572, i8** %6, align 8
  %573 = load i8, i8* %571, align 1
  %574 = zext i8 %573 to i32
  %575 = and i32 %574, 3
  %576 = shl i32 %575, 1
  %577 = trunc i32 %576 to i16
  %578 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 33
  store i16 %577, i16* %578, align 2
  %579 = load i8*, i8** %6, align 8
  %580 = load i8, i8* %579, align 1
  %581 = zext i8 %580 to i32
  %582 = ashr i32 %581, 7
  %583 = and i32 %582, 1
  %584 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 33
  %585 = load i16, i16* %584, align 2
  %586 = sext i16 %585 to i32
  %587 = or i32 %586, %583
  %588 = trunc i32 %587 to i16
  store i16 %588, i16* %584, align 2
  %589 = load i8*, i8** %6, align 8
  %590 = load i8, i8* %589, align 1
  %591 = zext i8 %590 to i32
  %592 = ashr i32 %591, 4
  %593 = and i32 %592, 7
  %594 = trunc i32 %593 to i16
  %595 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 34
  store i16 %594, i16* %595, align 4
  %596 = load i8*, i8** %6, align 8
  %597 = load i8, i8* %596, align 1
  %598 = zext i8 %597 to i32
  %599 = ashr i32 %598, 1
  %600 = and i32 %599, 7
  %601 = trunc i32 %600 to i16
  %602 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 35
  store i16 %601, i16* %602, align 2
  %603 = load i8*, i8** %6, align 8
  %604 = getelementptr inbounds i8, i8* %603, i32 1
  store i8* %604, i8** %6, align 8
  %605 = load i8, i8* %603, align 1
  %606 = zext i8 %605 to i32
  %607 = and i32 %606, 1
  %608 = shl i32 %607, 2
  %609 = trunc i32 %608 to i16
  %610 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 36
  store i16 %609, i16* %610, align 8
  %611 = load i8*, i8** %6, align 8
  %612 = load i8, i8* %611, align 1
  %613 = zext i8 %612 to i32
  %614 = ashr i32 %613, 6
  %615 = and i32 %614, 3
  %616 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 36
  %617 = load i16, i16* %616, align 8
  %618 = sext i16 %617 to i32
  %619 = or i32 %618, %615
  %620 = trunc i32 %619 to i16
  store i16 %620, i16* %616, align 8
  %621 = load i8*, i8** %6, align 8
  %622 = load i8, i8* %621, align 1
  %623 = zext i8 %622 to i32
  %624 = ashr i32 %623, 3
  %625 = and i32 %624, 7
  %626 = trunc i32 %625 to i16
  %627 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 37
  store i16 %626, i16* %627, align 2
  %628 = load i8*, i8** %6, align 8
  %629 = getelementptr inbounds i8, i8* %628, i32 1
  store i8* %629, i8** %6, align 8
  %630 = load i8, i8* %628, align 1
  %631 = zext i8 %630 to i32
  %632 = and i32 %631, 7
  %633 = trunc i32 %632 to i16
  %634 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 38
  store i16 %633, i16* %634, align 4
  %635 = load i8*, i8** %6, align 8
  %636 = load i8, i8* %635, align 1
  %637 = zext i8 %636 to i32
  %638 = ashr i32 %637, 1
  %639 = and i32 %638, 127
  %640 = trunc i32 %639 to i16
  %641 = getelementptr inbounds [4 x i16], [4 x i16]* %9, i64 0, i64 3
  store i16 %640, i16* %641, align 2
  %642 = load i8*, i8** %6, align 8
  %643 = getelementptr inbounds i8, i8* %642, i32 1
  store i8* %643, i8** %6, align 8
  %644 = load i8, i8* %642, align 1
  %645 = zext i8 %644 to i32
  %646 = and i32 %645, 1
  %647 = shl i32 %646, 1
  %648 = trunc i32 %647 to i16
  %649 = getelementptr inbounds [4 x i16], [4 x i16]* %11, i64 0, i64 3
  store i16 %648, i16* %649, align 2
  %650 = load i8*, i8** %6, align 8
  %651 = load i8, i8* %650, align 1
  %652 = zext i8 %651 to i32
  %653 = ashr i32 %652, 7
  %654 = and i32 %653, 1
  %655 = getelementptr inbounds [4 x i16], [4 x i16]* %11, i64 0, i64 3
  %656 = load i16, i16* %655, align 2
  %657 = sext i16 %656 to i32
  %658 = or i32 %657, %654
  %659 = trunc i32 %658 to i16
  store i16 %659, i16* %655, align 2
  %660 = load i8*, i8** %6, align 8
  %661 = load i8, i8* %660, align 1
  %662 = zext i8 %661 to i32
  %663 = ashr i32 %662, 5
  %664 = and i32 %663, 3
  %665 = trunc i32 %664 to i16
  %666 = getelementptr inbounds [4 x i16], [4 x i16]* %10, i64 0, i64 3
  store i16 %665, i16* %666, align 2
  %667 = load i8*, i8** %6, align 8
  %668 = getelementptr inbounds i8, i8* %667, i32 1
  store i8* %668, i8** %6, align 8
  %669 = load i8, i8* %667, align 1
  %670 = zext i8 %669 to i32
  %671 = and i32 %670, 31
  %672 = shl i32 %671, 1
  %673 = trunc i32 %672 to i16
  %674 = getelementptr inbounds [4 x i16], [4 x i16]* %12, i64 0, i64 3
  store i16 %673, i16* %674, align 2
  %675 = load i8*, i8** %6, align 8
  %676 = load i8, i8* %675, align 1
  %677 = zext i8 %676 to i32
  %678 = ashr i32 %677, 7
  %679 = and i32 %678, 1
  %680 = getelementptr inbounds [4 x i16], [4 x i16]* %12, i64 0, i64 3
  %681 = load i16, i16* %680, align 2
  %682 = sext i16 %681 to i32
  %683 = or i32 %682, %679
  %684 = trunc i32 %683 to i16
  store i16 %684, i16* %680, align 2
  %685 = load i8*, i8** %6, align 8
  %686 = load i8, i8* %685, align 1
  %687 = zext i8 %686 to i32
  %688 = ashr i32 %687, 4
  %689 = and i32 %688, 7
  %690 = trunc i32 %689 to i16
  %691 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 39
  store i16 %690, i16* %691, align 2
  %692 = load i8*, i8** %6, align 8
  %693 = load i8, i8* %692, align 1
  %694 = zext i8 %693 to i32
  %695 = ashr i32 %694, 1
  %696 = and i32 %695, 7
  %697 = trunc i32 %696 to i16
  %698 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 40
  store i16 %697, i16* %698, align 16
  %699 = load i8*, i8** %6, align 8
  %700 = getelementptr inbounds i8, i8* %699, i32 1
  store i8* %700, i8** %6, align 8
  %701 = load i8, i8* %699, align 1
  %702 = zext i8 %701 to i32
  %703 = and i32 %702, 1
  %704 = shl i32 %703, 2
  %705 = trunc i32 %704 to i16
  %706 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 41
  store i16 %705, i16* %706, align 2
  %707 = load i8*, i8** %6, align 8
  %708 = load i8, i8* %707, align 1
  %709 = zext i8 %708 to i32
  %710 = ashr i32 %709, 6
  %711 = and i32 %710, 3
  %712 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 41
  %713 = load i16, i16* %712, align 2
  %714 = sext i16 %713 to i32
  %715 = or i32 %714, %711
  %716 = trunc i32 %715 to i16
  store i16 %716, i16* %712, align 2
  %717 = load i8*, i8** %6, align 8
  %718 = load i8, i8* %717, align 1
  %719 = zext i8 %718 to i32
  %720 = ashr i32 %719, 3
  %721 = and i32 %720, 7
  %722 = trunc i32 %721 to i16
  %723 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 42
  store i16 %722, i16* %723, align 4
  %724 = load i8*, i8** %6, align 8
  %725 = getelementptr inbounds i8, i8* %724, i32 1
  store i8* %725, i8** %6, align 8
  %726 = load i8, i8* %724, align 1
  %727 = zext i8 %726 to i32
  %728 = and i32 %727, 7
  %729 = trunc i32 %728 to i16
  %730 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 43
  store i16 %729, i16* %730, align 2
  %731 = load i8*, i8** %6, align 8
  %732 = load i8, i8* %731, align 1
  %733 = zext i8 %732 to i32
  %734 = ashr i32 %733, 5
  %735 = and i32 %734, 7
  %736 = trunc i32 %735 to i16
  %737 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 44
  store i16 %736, i16* %737, align 8
  %738 = load i8*, i8** %6, align 8
  %739 = load i8, i8* %738, align 1
  %740 = zext i8 %739 to i32
  %741 = ashr i32 %740, 2
  %742 = and i32 %741, 7
  %743 = trunc i32 %742 to i16
  %744 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 45
  store i16 %743, i16* %744, align 2
  %745 = load i8*, i8** %6, align 8
  %746 = getelementptr inbounds i8, i8* %745, i32 1
  store i8* %746, i8** %6, align 8
  %747 = load i8, i8* %745, align 1
  %748 = zext i8 %747 to i32
  %749 = and i32 %748, 3
  %750 = shl i32 %749, 1
  %751 = trunc i32 %750 to i16
  %752 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 46
  store i16 %751, i16* %752, align 4
  %753 = load i8*, i8** %6, align 8
  %754 = load i8, i8* %753, align 1
  %755 = zext i8 %754 to i32
  %756 = ashr i32 %755, 7
  %757 = and i32 %756, 1
  %758 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 46
  %759 = load i16, i16* %758, align 4
  %760 = sext i16 %759 to i32
  %761 = or i32 %760, %757
  %762 = trunc i32 %761 to i16
  store i16 %762, i16* %758, align 4
  %763 = load i8*, i8** %6, align 8
  %764 = load i8, i8* %763, align 1
  %765 = zext i8 %764 to i32
  %766 = ashr i32 %765, 4
  %767 = and i32 %766, 7
  %768 = trunc i32 %767 to i16
  %769 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 47
  store i16 %768, i16* %769, align 2
  %770 = load i8*, i8** %6, align 8
  %771 = load i8, i8* %770, align 1
  %772 = zext i8 %771 to i32
  %773 = ashr i32 %772, 1
  %774 = and i32 %773, 7
  %775 = trunc i32 %774 to i16
  %776 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 48
  store i16 %775, i16* %776, align 16
  %777 = load i8*, i8** %6, align 8
  %778 = getelementptr inbounds i8, i8* %777, i32 1
  store i8* %778, i8** %6, align 8
  %779 = load i8, i8* %777, align 1
  %780 = zext i8 %779 to i32
  %781 = and i32 %780, 1
  %782 = shl i32 %781, 2
  %783 = trunc i32 %782 to i16
  %784 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 49
  store i16 %783, i16* %784, align 2
  %785 = load i8*, i8** %6, align 8
  %786 = load i8, i8* %785, align 1
  %787 = zext i8 %786 to i32
  %788 = ashr i32 %787, 6
  %789 = and i32 %788, 3
  %790 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 49
  %791 = load i16, i16* %790, align 2
  %792 = sext i16 %791 to i32
  %793 = or i32 %792, %789
  %794 = trunc i32 %793 to i16
  store i16 %794, i16* %790, align 2
  %795 = load i8*, i8** %6, align 8
  %796 = load i8, i8* %795, align 1
  %797 = zext i8 %796 to i32
  %798 = ashr i32 %797, 3
  %799 = and i32 %798, 7
  %800 = trunc i32 %799 to i16
  %801 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 50
  store i16 %800, i16* %801, align 4
  %802 = load i8*, i8** %6, align 8
  %803 = load i8, i8* %802, align 1
  %804 = zext i8 %803 to i32
  %805 = and i32 %804, 7
  %806 = trunc i32 %805 to i16
  %807 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i64 0, i64 51
  store i16 %806, i16* %807, align 2
  %808 = load %struct.gsm_state*, %struct.gsm_state** %5, align 8
  %809 = getelementptr inbounds [8 x i16], [8 x i16]* %8, i32 0, i32 0
  %810 = getelementptr inbounds [4 x i16], [4 x i16]* %9, i32 0, i32 0
  %811 = getelementptr inbounds [4 x i16], [4 x i16]* %11, i32 0, i32 0
  %812 = getelementptr inbounds [4 x i16], [4 x i16]* %10, i32 0, i32 0
  %813 = getelementptr inbounds [4 x i16], [4 x i16]* %12, i32 0, i32 0
  %814 = getelementptr inbounds [52 x i16], [52 x i16]* %13, i32 0, i32 0
  %815 = load i16*, i16** %7, align 8
  call void @Gsm_Decoder(%struct.gsm_state* %808, i16* %809, i16* %810, i16* %811, i16* %812, i16* %813, i16* %814, i16* %815)
  store i32 0, i32* %4, align 4
  br label %816

; <label>:816:                                    ; preds = %22, %20
  %817 = load i32, i32* %4, align 4
  ret i32 %817
}

declare void @Gsm_Decoder(%struct.gsm_state*, i16*, i16*, i16*, i16*, i16*, i16*, i16*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
