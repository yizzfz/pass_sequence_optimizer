; ModuleID = 'tmp1.ll'
source_filename = "fft.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@rv_tbl = internal constant [128 x i16] [i16 0, i16 128, i16 64, i16 192, i16 32, i16 160, i16 96, i16 224, i16 16, i16 144, i16 80, i16 208, i16 48, i16 176, i16 112, i16 240, i16 8, i16 136, i16 72, i16 200, i16 40, i16 168, i16 104, i16 232, i16 24, i16 152, i16 88, i16 216, i16 56, i16 184, i16 120, i16 248, i16 4, i16 132, i16 68, i16 196, i16 36, i16 164, i16 100, i16 228, i16 20, i16 148, i16 84, i16 212, i16 52, i16 180, i16 116, i16 244, i16 12, i16 140, i16 76, i16 204, i16 44, i16 172, i16 108, i16 236, i16 28, i16 156, i16 92, i16 220, i16 60, i16 188, i16 124, i16 252, i16 2, i16 130, i16 66, i16 194, i16 34, i16 162, i16 98, i16 226, i16 18, i16 146, i16 82, i16 210, i16 50, i16 178, i16 114, i16 242, i16 10, i16 138, i16 74, i16 202, i16 42, i16 170, i16 106, i16 234, i16 26, i16 154, i16 90, i16 218, i16 58, i16 186, i16 122, i16 250, i16 6, i16 134, i16 70, i16 198, i16 38, i16 166, i16 102, i16 230, i16 22, i16 150, i16 86, i16 214, i16 54, i16 182, i16 118, i16 246, i16 14, i16 142, i16 78, i16 206, i16 46, i16 174, i16 110, i16 238, i16 30, i16 158, i16 94, i16 222, i16 62, i16 190, i16 126, i16 254], align 16
@window_s = internal global [128 x float] zeroinitializer, align 16
@window = internal global [512 x float] zeroinitializer, align 16
@costab = internal global [8 x float] zeroinitializer, align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_fft_short = private constant [9 x i8] c"fft_short"
@__profn_tmp1.ll_fht = private constant [11 x i8] c"tmp1.ll:fht"
@__profn_fft_long = private constant [8 x i8] c"fft_long"
@__profn_init_fft = private constant [8 x i8] c"init_fft"
@__profc_fft_short = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_fft_short = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1570861613664246357, i64 119814210513, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_fft_short, i32 0, i32 0), i8* bitcast (void ([256 x float]*, i32, i16**)* @fft_short to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_fht = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_fht = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4527037001353046957, i64 85430985336, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_fht, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_fft_long = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_fft_long = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2038530851415114326, i64 96587894564, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_fft_long, i32 0, i32 0), i8* bitcast (void (float*, i32, i16**)* @fft_long to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_init_fft = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_init_fft = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7632346992593228443, i64 76678595315, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_init_fft, i32 0, i32 0), i8* bitcast (void ()* @init_fft to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [41 x i8] c"'\00fft_short\01tmp1.ll:fht\01fft_long\01init_fft", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_fft_short to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_fht to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_fft_long to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_init_fft to i8*), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @fft_short([256 x float]*, i32, i16**) #0 {
  %4 = alloca [256 x float]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i16**, align 8
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  %10 = alloca float*, align 8
  %11 = alloca i16, align 2
  %12 = alloca float, align 4
  %13 = alloca float, align 4
  %14 = alloca float, align 4
  %15 = alloca float, align 4
  %16 = alloca float, align 4
  %17 = alloca float, align 4
  %18 = alloca float, align 4
  %19 = alloca float, align 4
  %20 = alloca float, align 4
  %21 = alloca float, align 4
  %22 = alloca float, align 4
  %23 = alloca float, align 4
  %24 = alloca float, align 4
  %25 = alloca float, align 4
  %26 = alloca float, align 4
  store [256 x float]* %0, [256 x float]** %4, align 8
  store i32 %1, i32* %5, align 4
  store i16** %2, i16*** %6, align 8
  store i16 0, i16* %9, align 2
  br label %27

; <label>:27:                                     ; preds = %1045, %3
  %28 = load i16, i16* %9, align 2
  %29 = sext i16 %28 to i32
  %30 = icmp slt i32 %29, 3
  br i1 %30, label %31, label %1048

; <label>:31:                                     ; preds = %27
  %32 = load [256 x float]*, [256 x float]** %4, align 8
  %33 = load i16, i16* %9, align 2
  %34 = sext i16 %33 to i64
  %35 = getelementptr inbounds [256 x float], [256 x float]* %32, i64 %34
  %36 = getelementptr inbounds [256 x float], [256 x float]* %35, i64 0, i64 128
  store float* %36, float** %10, align 8
  %37 = load i16, i16* %9, align 2
  %38 = sext i16 %37 to i32
  %39 = add nsw i32 %38, 1
  %40 = mul nsw i32 192, %39
  %41 = trunc i32 %40 to i16
  store i16 %41, i16* %11, align 2
  store i16 31, i16* %8, align 2
  %42 = load i32, i32* %5, align 4
  %43 = icmp slt i32 %42, 2
  br i1 %43, label %44, label %307

; <label>:44:                                     ; preds = %31
  br label %45

; <label>:45:                                     ; preds = %300, %44
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_fft_short, i64 0, i64 0)
  %46 = add i64 %pgocount, 1
  store i64 %46, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_fft_short, i64 0, i64 0)
  %47 = load i16, i16* %8, align 2
  %48 = sext i16 %47 to i32
  %49 = shl i32 %48, 2
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [128 x i16], [128 x i16]* @rv_tbl, i64 0, i64 %50
  %52 = load i16, i16* %51, align 2
  store i16 %52, i16* %7, align 2
  %53 = load i16, i16* %7, align 2
  %54 = sext i16 %53 to i64
  %55 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %54
  %56 = load float, float* %55, align 4
  %57 = load i16**, i16*** %6, align 8
  %58 = load i32, i32* %5, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i16*, i16** %57, i64 %59
  %61 = load i16*, i16** %60, align 8
  %62 = load i16, i16* %7, align 2
  %63 = sext i16 %62 to i32
  %64 = load i16, i16* %11, align 2
  %65 = sext i16 %64 to i32
  %66 = add nsw i32 %63, %65
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i16, i16* %61, i64 %67
  %69 = load i16, i16* %68, align 2
  %70 = sext i16 %69 to i32
  %71 = sitofp i32 %70 to float
  %72 = fmul float %56, %71
  store float %72, float* %12, align 4
  %73 = load i16, i16* %7, align 2
  %74 = sext i16 %73 to i32
  %75 = sub nsw i32 127, %74
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %76
  %78 = load float, float* %77, align 4
  %79 = load i16**, i16*** %6, align 8
  %80 = load i32, i32* %5, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i16*, i16** %79, i64 %81
  %83 = load i16*, i16** %82, align 8
  %84 = load i16, i16* %7, align 2
  %85 = sext i16 %84 to i32
  %86 = load i16, i16* %11, align 2
  %87 = sext i16 %86 to i32
  %88 = add nsw i32 %85, %87
  %89 = add nsw i32 %88, 128
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i16, i16* %83, i64 %90
  %92 = load i16, i16* %91, align 2
  %93 = sext i16 %92 to i32
  %94 = sitofp i32 %93 to float
  %95 = fmul float %78, %94
  store float %95, float* %16, align 4
  %96 = load float, float* %12, align 4
  %97 = load float, float* %16, align 4
  %98 = fsub float %96, %97
  store float %98, float* %13, align 4
  %99 = load float, float* %12, align 4
  %100 = load float, float* %16, align 4
  %101 = fadd float %99, %100
  store float %101, float* %12, align 4
  %102 = load i16, i16* %7, align 2
  %103 = sext i16 %102 to i32
  %104 = add nsw i32 %103, 64
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %105
  %107 = load float, float* %106, align 4
  %108 = load i16**, i16*** %6, align 8
  %109 = load i32, i32* %5, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i16*, i16** %108, i64 %110
  %112 = load i16*, i16** %111, align 8
  %113 = load i16, i16* %7, align 2
  %114 = sext i16 %113 to i32
  %115 = load i16, i16* %11, align 2
  %116 = sext i16 %115 to i32
  %117 = add nsw i32 %114, %116
  %118 = add nsw i32 %117, 64
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i16, i16* %112, i64 %119
  %121 = load i16, i16* %120, align 2
  %122 = sext i16 %121 to i32
  %123 = sitofp i32 %122 to float
  %124 = fmul float %107, %123
  store float %124, float* %14, align 4
  %125 = load i16, i16* %7, align 2
  %126 = sext i16 %125 to i32
  %127 = sub nsw i32 63, %126
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %128
  %130 = load float, float* %129, align 4
  %131 = load i16**, i16*** %6, align 8
  %132 = load i32, i32* %5, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i16*, i16** %131, i64 %133
  %135 = load i16*, i16** %134, align 8
  %136 = load i16, i16* %7, align 2
  %137 = sext i16 %136 to i32
  %138 = load i16, i16* %11, align 2
  %139 = sext i16 %138 to i32
  %140 = add nsw i32 %137, %139
  %141 = add nsw i32 %140, 192
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i16, i16* %135, i64 %142
  %144 = load i16, i16* %143, align 2
  %145 = sext i16 %144 to i32
  %146 = sitofp i32 %145 to float
  %147 = fmul float %130, %146
  store float %147, float* %16, align 4
  %148 = load float, float* %14, align 4
  %149 = load float, float* %16, align 4
  %150 = fsub float %148, %149
  store float %150, float* %15, align 4
  %151 = load float, float* %14, align 4
  %152 = load float, float* %16, align 4
  %153 = fadd float %151, %152
  store float %153, float* %14, align 4
  %154 = load float*, float** %10, align 8
  %155 = getelementptr inbounds float, float* %154, i64 -4
  store float* %155, float** %10, align 8
  %156 = load float, float* %12, align 4
  %157 = load float, float* %14, align 4
  %158 = fadd float %156, %157
  %159 = load float*, float** %10, align 8
  %160 = getelementptr inbounds float, float* %159, i64 0
  store float %158, float* %160, align 4
  %161 = load float, float* %12, align 4
  %162 = load float, float* %14, align 4
  %163 = fsub float %161, %162
  %164 = load float*, float** %10, align 8
  %165 = getelementptr inbounds float, float* %164, i64 2
  store float %163, float* %165, align 4
  %166 = load float, float* %13, align 4
  %167 = load float, float* %15, align 4
  %168 = fadd float %166, %167
  %169 = load float*, float** %10, align 8
  %170 = getelementptr inbounds float, float* %169, i64 1
  store float %168, float* %170, align 4
  %171 = load float, float* %13, align 4
  %172 = load float, float* %15, align 4
  %173 = fsub float %171, %172
  %174 = load float*, float** %10, align 8
  %175 = getelementptr inbounds float, float* %174, i64 3
  store float %173, float* %175, align 4
  %176 = load i16, i16* %7, align 2
  %177 = sext i16 %176 to i32
  %178 = add nsw i32 %177, 1
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %179
  %181 = load float, float* %180, align 4
  %182 = load i16**, i16*** %6, align 8
  %183 = load i32, i32* %5, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds i16*, i16** %182, i64 %184
  %186 = load i16*, i16** %185, align 8
  %187 = load i16, i16* %7, align 2
  %188 = sext i16 %187 to i32
  %189 = load i16, i16* %11, align 2
  %190 = sext i16 %189 to i32
  %191 = add nsw i32 %188, %190
  %192 = add nsw i32 %191, 1
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds i16, i16* %186, i64 %193
  %195 = load i16, i16* %194, align 2
  %196 = sext i16 %195 to i32
  %197 = sitofp i32 %196 to float
  %198 = fmul float %181, %197
  store float %198, float* %12, align 4
  %199 = load i16, i16* %7, align 2
  %200 = sext i16 %199 to i32
  %201 = sub nsw i32 126, %200
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %202
  %204 = load float, float* %203, align 4
  %205 = load i16**, i16*** %6, align 8
  %206 = load i32, i32* %5, align 4
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds i16*, i16** %205, i64 %207
  %209 = load i16*, i16** %208, align 8
  %210 = load i16, i16* %7, align 2
  %211 = sext i16 %210 to i32
  %212 = load i16, i16* %11, align 2
  %213 = sext i16 %212 to i32
  %214 = add nsw i32 %211, %213
  %215 = add nsw i32 %214, 129
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds i16, i16* %209, i64 %216
  %218 = load i16, i16* %217, align 2
  %219 = sext i16 %218 to i32
  %220 = sitofp i32 %219 to float
  %221 = fmul float %204, %220
  store float %221, float* %16, align 4
  %222 = load float, float* %12, align 4
  %223 = load float, float* %16, align 4
  %224 = fsub float %222, %223
  store float %224, float* %13, align 4
  %225 = load float, float* %12, align 4
  %226 = load float, float* %16, align 4
  %227 = fadd float %225, %226
  store float %227, float* %12, align 4
  %228 = load i16, i16* %7, align 2
  %229 = sext i16 %228 to i32
  %230 = add nsw i32 %229, 65
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %231
  %233 = load float, float* %232, align 4
  %234 = load i16**, i16*** %6, align 8
  %235 = load i32, i32* %5, align 4
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds i16*, i16** %234, i64 %236
  %238 = load i16*, i16** %237, align 8
  %239 = load i16, i16* %7, align 2
  %240 = sext i16 %239 to i32
  %241 = load i16, i16* %11, align 2
  %242 = sext i16 %241 to i32
  %243 = add nsw i32 %240, %242
  %244 = add nsw i32 %243, 65
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds i16, i16* %238, i64 %245
  %247 = load i16, i16* %246, align 2
  %248 = sext i16 %247 to i32
  %249 = sitofp i32 %248 to float
  %250 = fmul float %233, %249
  store float %250, float* %14, align 4
  %251 = load i16, i16* %7, align 2
  %252 = sext i16 %251 to i32
  %253 = sub nsw i32 62, %252
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %254
  %256 = load float, float* %255, align 4
  %257 = load i16**, i16*** %6, align 8
  %258 = load i32, i32* %5, align 4
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds i16*, i16** %257, i64 %259
  %261 = load i16*, i16** %260, align 8
  %262 = load i16, i16* %7, align 2
  %263 = sext i16 %262 to i32
  %264 = load i16, i16* %11, align 2
  %265 = sext i16 %264 to i32
  %266 = add nsw i32 %263, %265
  %267 = add nsw i32 %266, 193
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds i16, i16* %261, i64 %268
  %270 = load i16, i16* %269, align 2
  %271 = sext i16 %270 to i32
  %272 = sitofp i32 %271 to float
  %273 = fmul float %256, %272
  store float %273, float* %16, align 4
  %274 = load float, float* %14, align 4
  %275 = load float, float* %16, align 4
  %276 = fsub float %274, %275
  store float %276, float* %15, align 4
  %277 = load float, float* %14, align 4
  %278 = load float, float* %16, align 4
  %279 = fadd float %277, %278
  store float %279, float* %14, align 4
  %280 = load float, float* %12, align 4
  %281 = load float, float* %14, align 4
  %282 = fadd float %280, %281
  %283 = load float*, float** %10, align 8
  %284 = getelementptr inbounds float, float* %283, i64 128
  store float %282, float* %284, align 4
  %285 = load float, float* %12, align 4
  %286 = load float, float* %14, align 4
  %287 = fsub float %285, %286
  %288 = load float*, float** %10, align 8
  %289 = getelementptr inbounds float, float* %288, i64 130
  store float %287, float* %289, align 4
  %290 = load float, float* %13, align 4
  %291 = load float, float* %15, align 4
  %292 = fadd float %290, %291
  %293 = load float*, float** %10, align 8
  %294 = getelementptr inbounds float, float* %293, i64 129
  store float %292, float* %294, align 4
  %295 = load float, float* %13, align 4
  %296 = load float, float* %15, align 4
  %297 = fsub float %295, %296
  %298 = load float*, float** %10, align 8
  %299 = getelementptr inbounds float, float* %298, i64 131
  store float %297, float* %299, align 4
  br label %300

; <label>:300:                                    ; preds = %45
  %301 = load i16, i16* %8, align 2
  %302 = add i16 %301, -1
  store i16 %302, i16* %8, align 2
  %303 = sext i16 %302 to i32
  %304 = icmp sge i32 %303, 0
  br i1 %304, label %45, label %305

; <label>:305:                                    ; preds = %300
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_fft_short, i64 0, i64 3)
  %306 = add i64 %pgocount1, 1
  store i64 %306, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_fft_short, i64 0, i64 3)
  br label %1043

; <label>:307:                                    ; preds = %31
  %308 = load i32, i32* %5, align 4
  %309 = icmp eq i32 %308, 2
  br i1 %309, label %310, label %676

; <label>:310:                                    ; preds = %307
  br label %311

; <label>:311:                                    ; preds = %669, %310
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_fft_short, i64 0, i64 1)
  %312 = add i64 %pgocount2, 1
  store i64 %312, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_fft_short, i64 0, i64 1)
  %313 = load i16, i16* %8, align 2
  %314 = sext i16 %313 to i32
  %315 = shl i32 %314, 2
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds [128 x i16], [128 x i16]* @rv_tbl, i64 0, i64 %316
  %318 = load i16, i16* %317, align 2
  store i16 %318, i16* %7, align 2
  %319 = load i16, i16* %7, align 2
  %320 = sext i16 %319 to i64
  %321 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %320
  %322 = load float, float* %321, align 4
  %323 = load i16**, i16*** %6, align 8
  %324 = getelementptr inbounds i16*, i16** %323, i64 0
  %325 = load i16*, i16** %324, align 8
  %326 = load i16, i16* %7, align 2
  %327 = sext i16 %326 to i32
  %328 = load i16, i16* %11, align 2
  %329 = sext i16 %328 to i32
  %330 = add nsw i32 %327, %329
  %331 = sext i32 %330 to i64
  %332 = getelementptr inbounds i16, i16* %325, i64 %331
  %333 = load i16, i16* %332, align 2
  %334 = sext i16 %333 to i32
  %335 = load i16**, i16*** %6, align 8
  %336 = getelementptr inbounds i16*, i16** %335, i64 1
  %337 = load i16*, i16** %336, align 8
  %338 = load i16, i16* %7, align 2
  %339 = sext i16 %338 to i32
  %340 = load i16, i16* %11, align 2
  %341 = sext i16 %340 to i32
  %342 = add nsw i32 %339, %341
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds i16, i16* %337, i64 %343
  %345 = load i16, i16* %344, align 2
  %346 = sext i16 %345 to i32
  %347 = add nsw i32 %334, %346
  %348 = sitofp i32 %347 to float
  %349 = fmul float 0x3FE6A09E60000000, %348
  %350 = fmul float %322, %349
  store float %350, float* %17, align 4
  %351 = load i16, i16* %7, align 2
  %352 = sext i16 %351 to i32
  %353 = sub nsw i32 127, %352
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %354
  %356 = load float, float* %355, align 4
  %357 = load i16**, i16*** %6, align 8
  %358 = getelementptr inbounds i16*, i16** %357, i64 0
  %359 = load i16*, i16** %358, align 8
  %360 = load i16, i16* %7, align 2
  %361 = sext i16 %360 to i32
  %362 = load i16, i16* %11, align 2
  %363 = sext i16 %362 to i32
  %364 = add nsw i32 %361, %363
  %365 = add nsw i32 %364, 128
  %366 = sext i32 %365 to i64
  %367 = getelementptr inbounds i16, i16* %359, i64 %366
  %368 = load i16, i16* %367, align 2
  %369 = sext i16 %368 to i32
  %370 = load i16**, i16*** %6, align 8
  %371 = getelementptr inbounds i16*, i16** %370, i64 1
  %372 = load i16*, i16** %371, align 8
  %373 = load i16, i16* %7, align 2
  %374 = sext i16 %373 to i32
  %375 = load i16, i16* %11, align 2
  %376 = sext i16 %375 to i32
  %377 = add nsw i32 %374, %376
  %378 = add nsw i32 %377, 128
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds i16, i16* %372, i64 %379
  %381 = load i16, i16* %380, align 2
  %382 = sext i16 %381 to i32
  %383 = add nsw i32 %369, %382
  %384 = sitofp i32 %383 to float
  %385 = fmul float 0x3FE6A09E60000000, %384
  %386 = fmul float %356, %385
  store float %386, float* %21, align 4
  %387 = load float, float* %17, align 4
  %388 = load float, float* %21, align 4
  %389 = fsub float %387, %388
  store float %389, float* %18, align 4
  %390 = load float, float* %17, align 4
  %391 = load float, float* %21, align 4
  %392 = fadd float %390, %391
  store float %392, float* %17, align 4
  %393 = load i16, i16* %7, align 2
  %394 = sext i16 %393 to i32
  %395 = add nsw i32 %394, 64
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %396
  %398 = load float, float* %397, align 4
  %399 = load i16**, i16*** %6, align 8
  %400 = getelementptr inbounds i16*, i16** %399, i64 0
  %401 = load i16*, i16** %400, align 8
  %402 = load i16, i16* %7, align 2
  %403 = sext i16 %402 to i32
  %404 = load i16, i16* %11, align 2
  %405 = sext i16 %404 to i32
  %406 = add nsw i32 %403, %405
  %407 = add nsw i32 %406, 64
  %408 = sext i32 %407 to i64
  %409 = getelementptr inbounds i16, i16* %401, i64 %408
  %410 = load i16, i16* %409, align 2
  %411 = sext i16 %410 to i32
  %412 = load i16**, i16*** %6, align 8
  %413 = getelementptr inbounds i16*, i16** %412, i64 1
  %414 = load i16*, i16** %413, align 8
  %415 = load i16, i16* %7, align 2
  %416 = sext i16 %415 to i32
  %417 = load i16, i16* %11, align 2
  %418 = sext i16 %417 to i32
  %419 = add nsw i32 %416, %418
  %420 = add nsw i32 %419, 64
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds i16, i16* %414, i64 %421
  %423 = load i16, i16* %422, align 2
  %424 = sext i16 %423 to i32
  %425 = add nsw i32 %411, %424
  %426 = sitofp i32 %425 to float
  %427 = fmul float 0x3FE6A09E60000000, %426
  %428 = fmul float %398, %427
  store float %428, float* %19, align 4
  %429 = load i16, i16* %7, align 2
  %430 = sext i16 %429 to i32
  %431 = sub nsw i32 63, %430
  %432 = sext i32 %431 to i64
  %433 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %432
  %434 = load float, float* %433, align 4
  %435 = load i16**, i16*** %6, align 8
  %436 = getelementptr inbounds i16*, i16** %435, i64 0
  %437 = load i16*, i16** %436, align 8
  %438 = load i16, i16* %7, align 2
  %439 = sext i16 %438 to i32
  %440 = load i16, i16* %11, align 2
  %441 = sext i16 %440 to i32
  %442 = add nsw i32 %439, %441
  %443 = add nsw i32 %442, 192
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds i16, i16* %437, i64 %444
  %446 = load i16, i16* %445, align 2
  %447 = sext i16 %446 to i32
  %448 = load i16**, i16*** %6, align 8
  %449 = getelementptr inbounds i16*, i16** %448, i64 1
  %450 = load i16*, i16** %449, align 8
  %451 = load i16, i16* %7, align 2
  %452 = sext i16 %451 to i32
  %453 = load i16, i16* %11, align 2
  %454 = sext i16 %453 to i32
  %455 = add nsw i32 %452, %454
  %456 = add nsw i32 %455, 192
  %457 = sext i32 %456 to i64
  %458 = getelementptr inbounds i16, i16* %450, i64 %457
  %459 = load i16, i16* %458, align 2
  %460 = sext i16 %459 to i32
  %461 = add nsw i32 %447, %460
  %462 = sitofp i32 %461 to float
  %463 = fmul float 0x3FE6A09E60000000, %462
  %464 = fmul float %434, %463
  store float %464, float* %21, align 4
  %465 = load float, float* %19, align 4
  %466 = load float, float* %21, align 4
  %467 = fsub float %465, %466
  store float %467, float* %20, align 4
  %468 = load float, float* %19, align 4
  %469 = load float, float* %21, align 4
  %470 = fadd float %468, %469
  store float %470, float* %19, align 4
  %471 = load float*, float** %10, align 8
  %472 = getelementptr inbounds float, float* %471, i64 -4
  store float* %472, float** %10, align 8
  %473 = load float, float* %17, align 4
  %474 = load float, float* %19, align 4
  %475 = fadd float %473, %474
  %476 = load float*, float** %10, align 8
  %477 = getelementptr inbounds float, float* %476, i64 0
  store float %475, float* %477, align 4
  %478 = load float, float* %17, align 4
  %479 = load float, float* %19, align 4
  %480 = fsub float %478, %479
  %481 = load float*, float** %10, align 8
  %482 = getelementptr inbounds float, float* %481, i64 2
  store float %480, float* %482, align 4
  %483 = load float, float* %18, align 4
  %484 = load float, float* %20, align 4
  %485 = fadd float %483, %484
  %486 = load float*, float** %10, align 8
  %487 = getelementptr inbounds float, float* %486, i64 1
  store float %485, float* %487, align 4
  %488 = load float, float* %18, align 4
  %489 = load float, float* %20, align 4
  %490 = fsub float %488, %489
  %491 = load float*, float** %10, align 8
  %492 = getelementptr inbounds float, float* %491, i64 3
  store float %490, float* %492, align 4
  %493 = load i16, i16* %7, align 2
  %494 = sext i16 %493 to i32
  %495 = add nsw i32 %494, 1
  %496 = sext i32 %495 to i64
  %497 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %496
  %498 = load float, float* %497, align 4
  %499 = load i16**, i16*** %6, align 8
  %500 = getelementptr inbounds i16*, i16** %499, i64 0
  %501 = load i16*, i16** %500, align 8
  %502 = load i16, i16* %7, align 2
  %503 = sext i16 %502 to i32
  %504 = load i16, i16* %11, align 2
  %505 = sext i16 %504 to i32
  %506 = add nsw i32 %503, %505
  %507 = add nsw i32 %506, 1
  %508 = sext i32 %507 to i64
  %509 = getelementptr inbounds i16, i16* %501, i64 %508
  %510 = load i16, i16* %509, align 2
  %511 = sext i16 %510 to i32
  %512 = load i16**, i16*** %6, align 8
  %513 = getelementptr inbounds i16*, i16** %512, i64 1
  %514 = load i16*, i16** %513, align 8
  %515 = load i16, i16* %7, align 2
  %516 = sext i16 %515 to i32
  %517 = load i16, i16* %11, align 2
  %518 = sext i16 %517 to i32
  %519 = add nsw i32 %516, %518
  %520 = add nsw i32 %519, 1
  %521 = sext i32 %520 to i64
  %522 = getelementptr inbounds i16, i16* %514, i64 %521
  %523 = load i16, i16* %522, align 2
  %524 = sext i16 %523 to i32
  %525 = add nsw i32 %511, %524
  %526 = sitofp i32 %525 to float
  %527 = fmul float 0x3FE6A09E60000000, %526
  %528 = fmul float %498, %527
  store float %528, float* %17, align 4
  %529 = load i16, i16* %7, align 2
  %530 = sext i16 %529 to i32
  %531 = sub nsw i32 126, %530
  %532 = sext i32 %531 to i64
  %533 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %532
  %534 = load float, float* %533, align 4
  %535 = load i16**, i16*** %6, align 8
  %536 = getelementptr inbounds i16*, i16** %535, i64 0
  %537 = load i16*, i16** %536, align 8
  %538 = load i16, i16* %7, align 2
  %539 = sext i16 %538 to i32
  %540 = load i16, i16* %11, align 2
  %541 = sext i16 %540 to i32
  %542 = add nsw i32 %539, %541
  %543 = add nsw i32 %542, 129
  %544 = sext i32 %543 to i64
  %545 = getelementptr inbounds i16, i16* %537, i64 %544
  %546 = load i16, i16* %545, align 2
  %547 = sext i16 %546 to i32
  %548 = load i16**, i16*** %6, align 8
  %549 = getelementptr inbounds i16*, i16** %548, i64 1
  %550 = load i16*, i16** %549, align 8
  %551 = load i16, i16* %7, align 2
  %552 = sext i16 %551 to i32
  %553 = load i16, i16* %11, align 2
  %554 = sext i16 %553 to i32
  %555 = add nsw i32 %552, %554
  %556 = add nsw i32 %555, 129
  %557 = sext i32 %556 to i64
  %558 = getelementptr inbounds i16, i16* %550, i64 %557
  %559 = load i16, i16* %558, align 2
  %560 = sext i16 %559 to i32
  %561 = add nsw i32 %547, %560
  %562 = sitofp i32 %561 to float
  %563 = fmul float 0x3FE6A09E60000000, %562
  %564 = fmul float %534, %563
  store float %564, float* %21, align 4
  %565 = load float, float* %17, align 4
  %566 = load float, float* %21, align 4
  %567 = fsub float %565, %566
  store float %567, float* %18, align 4
  %568 = load float, float* %17, align 4
  %569 = load float, float* %21, align 4
  %570 = fadd float %568, %569
  store float %570, float* %17, align 4
  %571 = load i16, i16* %7, align 2
  %572 = sext i16 %571 to i32
  %573 = add nsw i32 %572, 65
  %574 = sext i32 %573 to i64
  %575 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %574
  %576 = load float, float* %575, align 4
  %577 = load i16**, i16*** %6, align 8
  %578 = getelementptr inbounds i16*, i16** %577, i64 0
  %579 = load i16*, i16** %578, align 8
  %580 = load i16, i16* %7, align 2
  %581 = sext i16 %580 to i32
  %582 = load i16, i16* %11, align 2
  %583 = sext i16 %582 to i32
  %584 = add nsw i32 %581, %583
  %585 = add nsw i32 %584, 65
  %586 = sext i32 %585 to i64
  %587 = getelementptr inbounds i16, i16* %579, i64 %586
  %588 = load i16, i16* %587, align 2
  %589 = sext i16 %588 to i32
  %590 = load i16**, i16*** %6, align 8
  %591 = getelementptr inbounds i16*, i16** %590, i64 1
  %592 = load i16*, i16** %591, align 8
  %593 = load i16, i16* %7, align 2
  %594 = sext i16 %593 to i32
  %595 = load i16, i16* %11, align 2
  %596 = sext i16 %595 to i32
  %597 = add nsw i32 %594, %596
  %598 = add nsw i32 %597, 65
  %599 = sext i32 %598 to i64
  %600 = getelementptr inbounds i16, i16* %592, i64 %599
  %601 = load i16, i16* %600, align 2
  %602 = sext i16 %601 to i32
  %603 = add nsw i32 %589, %602
  %604 = sitofp i32 %603 to float
  %605 = fmul float 0x3FE6A09E60000000, %604
  %606 = fmul float %576, %605
  store float %606, float* %19, align 4
  %607 = load i16, i16* %7, align 2
  %608 = sext i16 %607 to i32
  %609 = sub nsw i32 62, %608
  %610 = sext i32 %609 to i64
  %611 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %610
  %612 = load float, float* %611, align 4
  %613 = load i16**, i16*** %6, align 8
  %614 = getelementptr inbounds i16*, i16** %613, i64 0
  %615 = load i16*, i16** %614, align 8
  %616 = load i16, i16* %7, align 2
  %617 = sext i16 %616 to i32
  %618 = load i16, i16* %11, align 2
  %619 = sext i16 %618 to i32
  %620 = add nsw i32 %617, %619
  %621 = add nsw i32 %620, 193
  %622 = sext i32 %621 to i64
  %623 = getelementptr inbounds i16, i16* %615, i64 %622
  %624 = load i16, i16* %623, align 2
  %625 = sext i16 %624 to i32
  %626 = load i16**, i16*** %6, align 8
  %627 = getelementptr inbounds i16*, i16** %626, i64 1
  %628 = load i16*, i16** %627, align 8
  %629 = load i16, i16* %7, align 2
  %630 = sext i16 %629 to i32
  %631 = load i16, i16* %11, align 2
  %632 = sext i16 %631 to i32
  %633 = add nsw i32 %630, %632
  %634 = add nsw i32 %633, 193
  %635 = sext i32 %634 to i64
  %636 = getelementptr inbounds i16, i16* %628, i64 %635
  %637 = load i16, i16* %636, align 2
  %638 = sext i16 %637 to i32
  %639 = add nsw i32 %625, %638
  %640 = sitofp i32 %639 to float
  %641 = fmul float 0x3FE6A09E60000000, %640
  %642 = fmul float %612, %641
  store float %642, float* %21, align 4
  %643 = load float, float* %19, align 4
  %644 = load float, float* %21, align 4
  %645 = fsub float %643, %644
  store float %645, float* %20, align 4
  %646 = load float, float* %19, align 4
  %647 = load float, float* %21, align 4
  %648 = fadd float %646, %647
  store float %648, float* %19, align 4
  %649 = load float, float* %17, align 4
  %650 = load float, float* %19, align 4
  %651 = fadd float %649, %650
  %652 = load float*, float** %10, align 8
  %653 = getelementptr inbounds float, float* %652, i64 128
  store float %651, float* %653, align 4
  %654 = load float, float* %17, align 4
  %655 = load float, float* %19, align 4
  %656 = fsub float %654, %655
  %657 = load float*, float** %10, align 8
  %658 = getelementptr inbounds float, float* %657, i64 130
  store float %656, float* %658, align 4
  %659 = load float, float* %18, align 4
  %660 = load float, float* %20, align 4
  %661 = fadd float %659, %660
  %662 = load float*, float** %10, align 8
  %663 = getelementptr inbounds float, float* %662, i64 129
  store float %661, float* %663, align 4
  %664 = load float, float* %18, align 4
  %665 = load float, float* %20, align 4
  %666 = fsub float %664, %665
  %667 = load float*, float** %10, align 8
  %668 = getelementptr inbounds float, float* %667, i64 131
  store float %666, float* %668, align 4
  br label %669

; <label>:669:                                    ; preds = %311
  %670 = load i16, i16* %8, align 2
  %671 = add i16 %670, -1
  store i16 %671, i16* %8, align 2
  %672 = sext i16 %671 to i32
  %673 = icmp sge i32 %672, 0
  br i1 %673, label %311, label %674

; <label>:674:                                    ; preds = %669
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_fft_short, i64 0, i64 4)
  %675 = add i64 %pgocount3, 1
  store i64 %675, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_fft_short, i64 0, i64 4)
  br label %1042

; <label>:676:                                    ; preds = %307
  br label %677

; <label>:677:                                    ; preds = %1035, %676
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_fft_short, i64 0, i64 2)
  %678 = add i64 %pgocount4, 1
  store i64 %678, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_fft_short, i64 0, i64 2)
  %679 = load i16, i16* %8, align 2
  %680 = sext i16 %679 to i32
  %681 = shl i32 %680, 2
  %682 = sext i32 %681 to i64
  %683 = getelementptr inbounds [128 x i16], [128 x i16]* @rv_tbl, i64 0, i64 %682
  %684 = load i16, i16* %683, align 2
  store i16 %684, i16* %7, align 2
  %685 = load i16, i16* %7, align 2
  %686 = sext i16 %685 to i64
  %687 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %686
  %688 = load float, float* %687, align 4
  %689 = load i16**, i16*** %6, align 8
  %690 = getelementptr inbounds i16*, i16** %689, i64 0
  %691 = load i16*, i16** %690, align 8
  %692 = load i16, i16* %7, align 2
  %693 = sext i16 %692 to i32
  %694 = load i16, i16* %11, align 2
  %695 = sext i16 %694 to i32
  %696 = add nsw i32 %693, %695
  %697 = sext i32 %696 to i64
  %698 = getelementptr inbounds i16, i16* %691, i64 %697
  %699 = load i16, i16* %698, align 2
  %700 = sext i16 %699 to i32
  %701 = load i16**, i16*** %6, align 8
  %702 = getelementptr inbounds i16*, i16** %701, i64 1
  %703 = load i16*, i16** %702, align 8
  %704 = load i16, i16* %7, align 2
  %705 = sext i16 %704 to i32
  %706 = load i16, i16* %11, align 2
  %707 = sext i16 %706 to i32
  %708 = add nsw i32 %705, %707
  %709 = sext i32 %708 to i64
  %710 = getelementptr inbounds i16, i16* %703, i64 %709
  %711 = load i16, i16* %710, align 2
  %712 = sext i16 %711 to i32
  %713 = sub nsw i32 %700, %712
  %714 = sitofp i32 %713 to float
  %715 = fmul float 0x3FE6A09E60000000, %714
  %716 = fmul float %688, %715
  store float %716, float* %22, align 4
  %717 = load i16, i16* %7, align 2
  %718 = sext i16 %717 to i32
  %719 = sub nsw i32 127, %718
  %720 = sext i32 %719 to i64
  %721 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %720
  %722 = load float, float* %721, align 4
  %723 = load i16**, i16*** %6, align 8
  %724 = getelementptr inbounds i16*, i16** %723, i64 0
  %725 = load i16*, i16** %724, align 8
  %726 = load i16, i16* %7, align 2
  %727 = sext i16 %726 to i32
  %728 = load i16, i16* %11, align 2
  %729 = sext i16 %728 to i32
  %730 = add nsw i32 %727, %729
  %731 = add nsw i32 %730, 128
  %732 = sext i32 %731 to i64
  %733 = getelementptr inbounds i16, i16* %725, i64 %732
  %734 = load i16, i16* %733, align 2
  %735 = sext i16 %734 to i32
  %736 = load i16**, i16*** %6, align 8
  %737 = getelementptr inbounds i16*, i16** %736, i64 1
  %738 = load i16*, i16** %737, align 8
  %739 = load i16, i16* %7, align 2
  %740 = sext i16 %739 to i32
  %741 = load i16, i16* %11, align 2
  %742 = sext i16 %741 to i32
  %743 = add nsw i32 %740, %742
  %744 = add nsw i32 %743, 128
  %745 = sext i32 %744 to i64
  %746 = getelementptr inbounds i16, i16* %738, i64 %745
  %747 = load i16, i16* %746, align 2
  %748 = sext i16 %747 to i32
  %749 = sub nsw i32 %735, %748
  %750 = sitofp i32 %749 to float
  %751 = fmul float 0x3FE6A09E60000000, %750
  %752 = fmul float %722, %751
  store float %752, float* %26, align 4
  %753 = load float, float* %22, align 4
  %754 = load float, float* %26, align 4
  %755 = fsub float %753, %754
  store float %755, float* %23, align 4
  %756 = load float, float* %22, align 4
  %757 = load float, float* %26, align 4
  %758 = fadd float %756, %757
  store float %758, float* %22, align 4
  %759 = load i16, i16* %7, align 2
  %760 = sext i16 %759 to i32
  %761 = add nsw i32 %760, 64
  %762 = sext i32 %761 to i64
  %763 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %762
  %764 = load float, float* %763, align 4
  %765 = load i16**, i16*** %6, align 8
  %766 = getelementptr inbounds i16*, i16** %765, i64 0
  %767 = load i16*, i16** %766, align 8
  %768 = load i16, i16* %7, align 2
  %769 = sext i16 %768 to i32
  %770 = load i16, i16* %11, align 2
  %771 = sext i16 %770 to i32
  %772 = add nsw i32 %769, %771
  %773 = add nsw i32 %772, 64
  %774 = sext i32 %773 to i64
  %775 = getelementptr inbounds i16, i16* %767, i64 %774
  %776 = load i16, i16* %775, align 2
  %777 = sext i16 %776 to i32
  %778 = load i16**, i16*** %6, align 8
  %779 = getelementptr inbounds i16*, i16** %778, i64 1
  %780 = load i16*, i16** %779, align 8
  %781 = load i16, i16* %7, align 2
  %782 = sext i16 %781 to i32
  %783 = load i16, i16* %11, align 2
  %784 = sext i16 %783 to i32
  %785 = add nsw i32 %782, %784
  %786 = add nsw i32 %785, 64
  %787 = sext i32 %786 to i64
  %788 = getelementptr inbounds i16, i16* %780, i64 %787
  %789 = load i16, i16* %788, align 2
  %790 = sext i16 %789 to i32
  %791 = sub nsw i32 %777, %790
  %792 = sitofp i32 %791 to float
  %793 = fmul float 0x3FE6A09E60000000, %792
  %794 = fmul float %764, %793
  store float %794, float* %24, align 4
  %795 = load i16, i16* %7, align 2
  %796 = sext i16 %795 to i32
  %797 = sub nsw i32 63, %796
  %798 = sext i32 %797 to i64
  %799 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %798
  %800 = load float, float* %799, align 4
  %801 = load i16**, i16*** %6, align 8
  %802 = getelementptr inbounds i16*, i16** %801, i64 0
  %803 = load i16*, i16** %802, align 8
  %804 = load i16, i16* %7, align 2
  %805 = sext i16 %804 to i32
  %806 = load i16, i16* %11, align 2
  %807 = sext i16 %806 to i32
  %808 = add nsw i32 %805, %807
  %809 = add nsw i32 %808, 192
  %810 = sext i32 %809 to i64
  %811 = getelementptr inbounds i16, i16* %803, i64 %810
  %812 = load i16, i16* %811, align 2
  %813 = sext i16 %812 to i32
  %814 = load i16**, i16*** %6, align 8
  %815 = getelementptr inbounds i16*, i16** %814, i64 1
  %816 = load i16*, i16** %815, align 8
  %817 = load i16, i16* %7, align 2
  %818 = sext i16 %817 to i32
  %819 = load i16, i16* %11, align 2
  %820 = sext i16 %819 to i32
  %821 = add nsw i32 %818, %820
  %822 = add nsw i32 %821, 192
  %823 = sext i32 %822 to i64
  %824 = getelementptr inbounds i16, i16* %816, i64 %823
  %825 = load i16, i16* %824, align 2
  %826 = sext i16 %825 to i32
  %827 = sub nsw i32 %813, %826
  %828 = sitofp i32 %827 to float
  %829 = fmul float 0x3FE6A09E60000000, %828
  %830 = fmul float %800, %829
  store float %830, float* %26, align 4
  %831 = load float, float* %24, align 4
  %832 = load float, float* %26, align 4
  %833 = fsub float %831, %832
  store float %833, float* %25, align 4
  %834 = load float, float* %24, align 4
  %835 = load float, float* %26, align 4
  %836 = fadd float %834, %835
  store float %836, float* %24, align 4
  %837 = load float*, float** %10, align 8
  %838 = getelementptr inbounds float, float* %837, i64 -4
  store float* %838, float** %10, align 8
  %839 = load float, float* %22, align 4
  %840 = load float, float* %24, align 4
  %841 = fadd float %839, %840
  %842 = load float*, float** %10, align 8
  %843 = getelementptr inbounds float, float* %842, i64 0
  store float %841, float* %843, align 4
  %844 = load float, float* %22, align 4
  %845 = load float, float* %24, align 4
  %846 = fsub float %844, %845
  %847 = load float*, float** %10, align 8
  %848 = getelementptr inbounds float, float* %847, i64 2
  store float %846, float* %848, align 4
  %849 = load float, float* %23, align 4
  %850 = load float, float* %25, align 4
  %851 = fadd float %849, %850
  %852 = load float*, float** %10, align 8
  %853 = getelementptr inbounds float, float* %852, i64 1
  store float %851, float* %853, align 4
  %854 = load float, float* %23, align 4
  %855 = load float, float* %25, align 4
  %856 = fsub float %854, %855
  %857 = load float*, float** %10, align 8
  %858 = getelementptr inbounds float, float* %857, i64 3
  store float %856, float* %858, align 4
  %859 = load i16, i16* %7, align 2
  %860 = sext i16 %859 to i32
  %861 = add nsw i32 %860, 1
  %862 = sext i32 %861 to i64
  %863 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %862
  %864 = load float, float* %863, align 4
  %865 = load i16**, i16*** %6, align 8
  %866 = getelementptr inbounds i16*, i16** %865, i64 0
  %867 = load i16*, i16** %866, align 8
  %868 = load i16, i16* %7, align 2
  %869 = sext i16 %868 to i32
  %870 = load i16, i16* %11, align 2
  %871 = sext i16 %870 to i32
  %872 = add nsw i32 %869, %871
  %873 = add nsw i32 %872, 1
  %874 = sext i32 %873 to i64
  %875 = getelementptr inbounds i16, i16* %867, i64 %874
  %876 = load i16, i16* %875, align 2
  %877 = sext i16 %876 to i32
  %878 = load i16**, i16*** %6, align 8
  %879 = getelementptr inbounds i16*, i16** %878, i64 1
  %880 = load i16*, i16** %879, align 8
  %881 = load i16, i16* %7, align 2
  %882 = sext i16 %881 to i32
  %883 = load i16, i16* %11, align 2
  %884 = sext i16 %883 to i32
  %885 = add nsw i32 %882, %884
  %886 = add nsw i32 %885, 1
  %887 = sext i32 %886 to i64
  %888 = getelementptr inbounds i16, i16* %880, i64 %887
  %889 = load i16, i16* %888, align 2
  %890 = sext i16 %889 to i32
  %891 = sub nsw i32 %877, %890
  %892 = sitofp i32 %891 to float
  %893 = fmul float 0x3FE6A09E60000000, %892
  %894 = fmul float %864, %893
  store float %894, float* %22, align 4
  %895 = load i16, i16* %7, align 2
  %896 = sext i16 %895 to i32
  %897 = sub nsw i32 126, %896
  %898 = sext i32 %897 to i64
  %899 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %898
  %900 = load float, float* %899, align 4
  %901 = load i16**, i16*** %6, align 8
  %902 = getelementptr inbounds i16*, i16** %901, i64 0
  %903 = load i16*, i16** %902, align 8
  %904 = load i16, i16* %7, align 2
  %905 = sext i16 %904 to i32
  %906 = load i16, i16* %11, align 2
  %907 = sext i16 %906 to i32
  %908 = add nsw i32 %905, %907
  %909 = add nsw i32 %908, 129
  %910 = sext i32 %909 to i64
  %911 = getelementptr inbounds i16, i16* %903, i64 %910
  %912 = load i16, i16* %911, align 2
  %913 = sext i16 %912 to i32
  %914 = load i16**, i16*** %6, align 8
  %915 = getelementptr inbounds i16*, i16** %914, i64 1
  %916 = load i16*, i16** %915, align 8
  %917 = load i16, i16* %7, align 2
  %918 = sext i16 %917 to i32
  %919 = load i16, i16* %11, align 2
  %920 = sext i16 %919 to i32
  %921 = add nsw i32 %918, %920
  %922 = add nsw i32 %921, 129
  %923 = sext i32 %922 to i64
  %924 = getelementptr inbounds i16, i16* %916, i64 %923
  %925 = load i16, i16* %924, align 2
  %926 = sext i16 %925 to i32
  %927 = sub nsw i32 %913, %926
  %928 = sitofp i32 %927 to float
  %929 = fmul float 0x3FE6A09E60000000, %928
  %930 = fmul float %900, %929
  store float %930, float* %26, align 4
  %931 = load float, float* %22, align 4
  %932 = load float, float* %26, align 4
  %933 = fsub float %931, %932
  store float %933, float* %23, align 4
  %934 = load float, float* %22, align 4
  %935 = load float, float* %26, align 4
  %936 = fadd float %934, %935
  store float %936, float* %22, align 4
  %937 = load i16, i16* %7, align 2
  %938 = sext i16 %937 to i32
  %939 = add nsw i32 %938, 65
  %940 = sext i32 %939 to i64
  %941 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %940
  %942 = load float, float* %941, align 4
  %943 = load i16**, i16*** %6, align 8
  %944 = getelementptr inbounds i16*, i16** %943, i64 0
  %945 = load i16*, i16** %944, align 8
  %946 = load i16, i16* %7, align 2
  %947 = sext i16 %946 to i32
  %948 = load i16, i16* %11, align 2
  %949 = sext i16 %948 to i32
  %950 = add nsw i32 %947, %949
  %951 = add nsw i32 %950, 65
  %952 = sext i32 %951 to i64
  %953 = getelementptr inbounds i16, i16* %945, i64 %952
  %954 = load i16, i16* %953, align 2
  %955 = sext i16 %954 to i32
  %956 = load i16**, i16*** %6, align 8
  %957 = getelementptr inbounds i16*, i16** %956, i64 1
  %958 = load i16*, i16** %957, align 8
  %959 = load i16, i16* %7, align 2
  %960 = sext i16 %959 to i32
  %961 = load i16, i16* %11, align 2
  %962 = sext i16 %961 to i32
  %963 = add nsw i32 %960, %962
  %964 = add nsw i32 %963, 65
  %965 = sext i32 %964 to i64
  %966 = getelementptr inbounds i16, i16* %958, i64 %965
  %967 = load i16, i16* %966, align 2
  %968 = sext i16 %967 to i32
  %969 = sub nsw i32 %955, %968
  %970 = sitofp i32 %969 to float
  %971 = fmul float 0x3FE6A09E60000000, %970
  %972 = fmul float %942, %971
  store float %972, float* %24, align 4
  %973 = load i16, i16* %7, align 2
  %974 = sext i16 %973 to i32
  %975 = sub nsw i32 62, %974
  %976 = sext i32 %975 to i64
  %977 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %976
  %978 = load float, float* %977, align 4
  %979 = load i16**, i16*** %6, align 8
  %980 = getelementptr inbounds i16*, i16** %979, i64 0
  %981 = load i16*, i16** %980, align 8
  %982 = load i16, i16* %7, align 2
  %983 = sext i16 %982 to i32
  %984 = load i16, i16* %11, align 2
  %985 = sext i16 %984 to i32
  %986 = add nsw i32 %983, %985
  %987 = add nsw i32 %986, 193
  %988 = sext i32 %987 to i64
  %989 = getelementptr inbounds i16, i16* %981, i64 %988
  %990 = load i16, i16* %989, align 2
  %991 = sext i16 %990 to i32
  %992 = load i16**, i16*** %6, align 8
  %993 = getelementptr inbounds i16*, i16** %992, i64 1
  %994 = load i16*, i16** %993, align 8
  %995 = load i16, i16* %7, align 2
  %996 = sext i16 %995 to i32
  %997 = load i16, i16* %11, align 2
  %998 = sext i16 %997 to i32
  %999 = add nsw i32 %996, %998
  %1000 = add nsw i32 %999, 193
  %1001 = sext i32 %1000 to i64
  %1002 = getelementptr inbounds i16, i16* %994, i64 %1001
  %1003 = load i16, i16* %1002, align 2
  %1004 = sext i16 %1003 to i32
  %1005 = sub nsw i32 %991, %1004
  %1006 = sitofp i32 %1005 to float
  %1007 = fmul float 0x3FE6A09E60000000, %1006
  %1008 = fmul float %978, %1007
  store float %1008, float* %26, align 4
  %1009 = load float, float* %24, align 4
  %1010 = load float, float* %26, align 4
  %1011 = fsub float %1009, %1010
  store float %1011, float* %25, align 4
  %1012 = load float, float* %24, align 4
  %1013 = load float, float* %26, align 4
  %1014 = fadd float %1012, %1013
  store float %1014, float* %24, align 4
  %1015 = load float, float* %22, align 4
  %1016 = load float, float* %24, align 4
  %1017 = fadd float %1015, %1016
  %1018 = load float*, float** %10, align 8
  %1019 = getelementptr inbounds float, float* %1018, i64 128
  store float %1017, float* %1019, align 4
  %1020 = load float, float* %22, align 4
  %1021 = load float, float* %24, align 4
  %1022 = fsub float %1020, %1021
  %1023 = load float*, float** %10, align 8
  %1024 = getelementptr inbounds float, float* %1023, i64 130
  store float %1022, float* %1024, align 4
  %1025 = load float, float* %23, align 4
  %1026 = load float, float* %25, align 4
  %1027 = fadd float %1025, %1026
  %1028 = load float*, float** %10, align 8
  %1029 = getelementptr inbounds float, float* %1028, i64 129
  store float %1027, float* %1029, align 4
  %1030 = load float, float* %23, align 4
  %1031 = load float, float* %25, align 4
  %1032 = fsub float %1030, %1031
  %1033 = load float*, float** %10, align 8
  %1034 = getelementptr inbounds float, float* %1033, i64 131
  store float %1032, float* %1034, align 4
  br label %1035

; <label>:1035:                                   ; preds = %677
  %1036 = load i16, i16* %8, align 2
  %1037 = add i16 %1036, -1
  store i16 %1037, i16* %8, align 2
  %1038 = sext i16 %1037 to i32
  %1039 = icmp sge i32 %1038, 0
  br i1 %1039, label %677, label %1040

; <label>:1040:                                   ; preds = %1035
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_fft_short, i64 0, i64 5)
  %1041 = add i64 %pgocount5, 1
  store i64 %1041, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_fft_short, i64 0, i64 5)
  br label %1042

; <label>:1042:                                   ; preds = %1040, %674
  br label %1043

; <label>:1043:                                   ; preds = %1042, %305
  %1044 = load float*, float** %10, align 8
  call void @fht(float* %1044, i16 signext 256)
  br label %1045

; <label>:1045:                                   ; preds = %1043
  %1046 = load i16, i16* %9, align 2
  %1047 = add i16 %1046, 1
  store i16 %1047, i16* %9, align 2
  br label %27

; <label>:1048:                                   ; preds = %27
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_fft_short, i64 0, i64 6)
  %1049 = add i64 %pgocount6, 1
  store i64 %1049, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_fft_short, i64 0, i64 6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @fht(float*, i16 signext) #0 {
  %3 = alloca float*, align 8
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  %6 = alloca float*, align 8
  %7 = alloca float*, align 8
  %8 = alloca float*, align 8
  %9 = alloca float*, align 8
  %10 = alloca float, align 4
  %11 = alloca float, align 4
  %12 = alloca i16, align 2
  %13 = alloca i16, align 2
  %14 = alloca i16, align 2
  %15 = alloca i16, align 2
  %16 = alloca i16, align 2
  %17 = alloca float, align 4
  %18 = alloca float, align 4
  %19 = alloca float, align 4
  %20 = alloca float, align 4
  %21 = alloca float, align 4
  %22 = alloca float, align 4
  %23 = alloca float, align 4
  %24 = alloca float, align 4
  %25 = alloca float, align 4
  %26 = alloca float, align 4
  %27 = alloca float, align 4
  %28 = alloca float, align 4
  %29 = alloca float, align 4
  %30 = alloca float, align 4
  %31 = alloca float, align 4
  %32 = alloca float, align 4
  store float* %0, float** %3, align 8
  store i16 %1, i16* %4, align 2
  %33 = load float*, float** %3, align 8
  %34 = load i16, i16* %4, align 2
  %35 = sext i16 %34 to i32
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float* %33, i64 %36
  store float* %37, float** %7, align 8
  store float* getelementptr inbounds ([8 x float], [8 x float]* @costab, i64 0, i64 0), float** %9, align 8
  store i16 4, i16* %5, align 2
  br label %38

; <label>:38:                                     ; preds = %480, %2
  %39 = load i16, i16* %5, align 2
  %40 = sext i16 %39 to i32
  %41 = ashr i32 %40, 1
  %42 = trunc i32 %41 to i16
  store i16 %42, i16* %16, align 2
  %43 = load i16, i16* %5, align 2
  store i16 %43, i16* %13, align 2
  %44 = load i16, i16* %5, align 2
  %45 = sext i16 %44 to i32
  %46 = shl i32 %45, 1
  %47 = trunc i32 %46 to i16
  store i16 %47, i16* %14, align 2
  %48 = load i16, i16* %14, align 2
  %49 = sext i16 %48 to i32
  %50 = load i16, i16* %13, align 2
  %51 = sext i16 %50 to i32
  %52 = add nsw i32 %49, %51
  %53 = trunc i32 %52 to i16
  store i16 %53, i16* %15, align 2
  %54 = load i16, i16* %14, align 2
  %55 = sext i16 %54 to i32
  %56 = shl i32 %55, 1
  %57 = trunc i32 %56 to i16
  store i16 %57, i16* %5, align 2
  %58 = load float*, float** %3, align 8
  store float* %58, float** %6, align 8
  %59 = load float*, float** %6, align 8
  %60 = load i16, i16* %16, align 2
  %61 = sext i16 %60 to i32
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float* %59, i64 %62
  store float* %63, float** %8, align 8
  br label %64

; <label>:64:                                     ; preds = %202, %38
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_fht, i64 0, i64 1)
  %65 = add i64 %pgocount, 1
  store i64 %65, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_fht, i64 0, i64 1)
  %66 = load float*, float** %6, align 8
  %67 = getelementptr inbounds float, float* %66, i64 0
  %68 = load float, float* %67, align 4
  %69 = load float*, float** %6, align 8
  %70 = load i16, i16* %13, align 2
  %71 = sext i16 %70 to i64
  %72 = getelementptr inbounds float, float* %69, i64 %71
  %73 = load float, float* %72, align 4
  %74 = fsub float %68, %73
  store float %74, float* %18, align 4
  %75 = load float*, float** %6, align 8
  %76 = getelementptr inbounds float, float* %75, i64 0
  %77 = load float, float* %76, align 4
  %78 = load float*, float** %6, align 8
  %79 = load i16, i16* %13, align 2
  %80 = sext i16 %79 to i64
  %81 = getelementptr inbounds float, float* %78, i64 %80
  %82 = load float, float* %81, align 4
  %83 = fadd float %77, %82
  store float %83, float* %17, align 4
  %84 = load float*, float** %6, align 8
  %85 = load i16, i16* %14, align 2
  %86 = sext i16 %85 to i64
  %87 = getelementptr inbounds float, float* %84, i64 %86
  %88 = load float, float* %87, align 4
  %89 = load float*, float** %6, align 8
  %90 = load i16, i16* %15, align 2
  %91 = sext i16 %90 to i64
  %92 = getelementptr inbounds float, float* %89, i64 %91
  %93 = load float, float* %92, align 4
  %94 = fsub float %88, %93
  store float %94, float* %20, align 4
  %95 = load float*, float** %6, align 8
  %96 = load i16, i16* %14, align 2
  %97 = sext i16 %96 to i64
  %98 = getelementptr inbounds float, float* %95, i64 %97
  %99 = load float, float* %98, align 4
  %100 = load float*, float** %6, align 8
  %101 = load i16, i16* %15, align 2
  %102 = sext i16 %101 to i64
  %103 = getelementptr inbounds float, float* %100, i64 %102
  %104 = load float, float* %103, align 4
  %105 = fadd float %99, %104
  store float %105, float* %19, align 4
  %106 = load float, float* %17, align 4
  %107 = load float, float* %19, align 4
  %108 = fsub float %106, %107
  %109 = load float*, float** %6, align 8
  %110 = load i16, i16* %14, align 2
  %111 = sext i16 %110 to i64
  %112 = getelementptr inbounds float, float* %109, i64 %111
  store float %108, float* %112, align 4
  %113 = load float, float* %17, align 4
  %114 = load float, float* %19, align 4
  %115 = fadd float %113, %114
  %116 = load float*, float** %6, align 8
  %117 = getelementptr inbounds float, float* %116, i64 0
  store float %115, float* %117, align 4
  %118 = load float, float* %18, align 4
  %119 = load float, float* %20, align 4
  %120 = fsub float %118, %119
  %121 = load float*, float** %6, align 8
  %122 = load i16, i16* %15, align 2
  %123 = sext i16 %122 to i64
  %124 = getelementptr inbounds float, float* %121, i64 %123
  store float %120, float* %124, align 4
  %125 = load float, float* %18, align 4
  %126 = load float, float* %20, align 4
  %127 = fadd float %125, %126
  %128 = load float*, float** %6, align 8
  %129 = load i16, i16* %13, align 2
  %130 = sext i16 %129 to i64
  %131 = getelementptr inbounds float, float* %128, i64 %130
  store float %127, float* %131, align 4
  %132 = load float*, float** %8, align 8
  %133 = getelementptr inbounds float, float* %132, i64 0
  %134 = load float, float* %133, align 4
  %135 = load float*, float** %8, align 8
  %136 = load i16, i16* %13, align 2
  %137 = sext i16 %136 to i64
  %138 = getelementptr inbounds float, float* %135, i64 %137
  %139 = load float, float* %138, align 4
  %140 = fsub float %134, %139
  store float %140, float* %18, align 4
  %141 = load float*, float** %8, align 8
  %142 = getelementptr inbounds float, float* %141, i64 0
  %143 = load float, float* %142, align 4
  %144 = load float*, float** %8, align 8
  %145 = load i16, i16* %13, align 2
  %146 = sext i16 %145 to i64
  %147 = getelementptr inbounds float, float* %144, i64 %146
  %148 = load float, float* %147, align 4
  %149 = fadd float %143, %148
  store float %149, float* %17, align 4
  %150 = load float*, float** %8, align 8
  %151 = load i16, i16* %15, align 2
  %152 = sext i16 %151 to i64
  %153 = getelementptr inbounds float, float* %150, i64 %152
  %154 = load float, float* %153, align 4
  %155 = fpext float %154 to double
  %156 = fmul double 0x3FF6A09E667F3BCD, %155
  %157 = fptrunc double %156 to float
  store float %157, float* %20, align 4
  %158 = load float*, float** %8, align 8
  %159 = load i16, i16* %14, align 2
  %160 = sext i16 %159 to i64
  %161 = getelementptr inbounds float, float* %158, i64 %160
  %162 = load float, float* %161, align 4
  %163 = fpext float %162 to double
  %164 = fmul double 0x3FF6A09E667F3BCD, %163
  %165 = fptrunc double %164 to float
  store float %165, float* %19, align 4
  %166 = load float, float* %17, align 4
  %167 = load float, float* %19, align 4
  %168 = fsub float %166, %167
  %169 = load float*, float** %8, align 8
  %170 = load i16, i16* %14, align 2
  %171 = sext i16 %170 to i64
  %172 = getelementptr inbounds float, float* %169, i64 %171
  store float %168, float* %172, align 4
  %173 = load float, float* %17, align 4
  %174 = load float, float* %19, align 4
  %175 = fadd float %173, %174
  %176 = load float*, float** %8, align 8
  %177 = getelementptr inbounds float, float* %176, i64 0
  store float %175, float* %177, align 4
  %178 = load float, float* %18, align 4
  %179 = load float, float* %20, align 4
  %180 = fsub float %178, %179
  %181 = load float*, float** %8, align 8
  %182 = load i16, i16* %15, align 2
  %183 = sext i16 %182 to i64
  %184 = getelementptr inbounds float, float* %181, i64 %183
  store float %180, float* %184, align 4
  %185 = load float, float* %18, align 4
  %186 = load float, float* %20, align 4
  %187 = fadd float %185, %186
  %188 = load float*, float** %8, align 8
  %189 = load i16, i16* %13, align 2
  %190 = sext i16 %189 to i64
  %191 = getelementptr inbounds float, float* %188, i64 %190
  store float %187, float* %191, align 4
  %192 = load i16, i16* %5, align 2
  %193 = sext i16 %192 to i32
  %194 = load float*, float** %8, align 8
  %195 = sext i32 %193 to i64
  %196 = getelementptr inbounds float, float* %194, i64 %195
  store float* %196, float** %8, align 8
  %197 = load i16, i16* %5, align 2
  %198 = sext i16 %197 to i32
  %199 = load float*, float** %6, align 8
  %200 = sext i32 %198 to i64
  %201 = getelementptr inbounds float, float* %199, i64 %200
  store float* %201, float** %6, align 8
  br label %202

; <label>:202:                                    ; preds = %64
  %203 = load float*, float** %6, align 8
  %204 = load float*, float** %7, align 8
  %205 = icmp ult float* %203, %204
  br i1 %205, label %64, label %206

; <label>:206:                                    ; preds = %202
  %207 = load float*, float** %9, align 8
  %208 = getelementptr inbounds float, float* %207, i64 0
  %209 = load float, float* %208, align 4
  store float %209, float* %11, align 4
  %210 = load float*, float** %9, align 8
  %211 = getelementptr inbounds float, float* %210, i64 1
  %212 = load float, float* %211, align 4
  store float %212, float* %10, align 4
  store i16 1, i16* %12, align 2
  br label %213

; <label>:213:                                    ; preds = %472, %206
  %214 = load i16, i16* %12, align 2
  %215 = sext i16 %214 to i32
  %216 = load i16, i16* %16, align 2
  %217 = sext i16 %216 to i32
  %218 = icmp slt i32 %215, %217
  br i1 %218, label %219, label %476

; <label>:219:                                    ; preds = %213
  %220 = load float, float* %10, align 4
  %221 = fmul float 2.000000e+00, %220
  %222 = load float, float* %10, align 4
  %223 = fmul float %221, %222
  %224 = fsub float 1.000000e+00, %223
  store float %224, float* %21, align 4
  %225 = load float, float* %10, align 4
  %226 = fmul float 2.000000e+00, %225
  %227 = load float, float* %11, align 4
  %228 = fmul float %226, %227
  store float %228, float* %22, align 4
  %229 = load float*, float** %3, align 8
  %230 = load i16, i16* %12, align 2
  %231 = sext i16 %230 to i32
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds float, float* %229, i64 %232
  store float* %233, float** %6, align 8
  %234 = load float*, float** %3, align 8
  %235 = load i16, i16* %13, align 2
  %236 = sext i16 %235 to i32
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds float, float* %234, i64 %237
  %239 = load i16, i16* %12, align 2
  %240 = sext i16 %239 to i32
  %241 = sext i32 %240 to i64
  %242 = sub i64 0, %241
  %243 = getelementptr inbounds float, float* %238, i64 %242
  store float* %243, float** %8, align 8
  br label %244

; <label>:244:                                    ; preds = %444, %219
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_fht, i64 0, i64 0)
  %245 = add i64 %pgocount1, 1
  store i64 %245, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_fht, i64 0, i64 0)
  %246 = load float, float* %22, align 4
  %247 = load float*, float** %6, align 8
  %248 = load i16, i16* %13, align 2
  %249 = sext i16 %248 to i64
  %250 = getelementptr inbounds float, float* %247, i64 %249
  %251 = load float, float* %250, align 4
  %252 = fmul float %246, %251
  %253 = load float, float* %21, align 4
  %254 = load float*, float** %8, align 8
  %255 = load i16, i16* %13, align 2
  %256 = sext i16 %255 to i64
  %257 = getelementptr inbounds float, float* %254, i64 %256
  %258 = load float, float* %257, align 4
  %259 = fmul float %253, %258
  %260 = fsub float %252, %259
  store float %260, float* %24, align 4
  %261 = load float, float* %21, align 4
  %262 = load float*, float** %6, align 8
  %263 = load i16, i16* %13, align 2
  %264 = sext i16 %263 to i64
  %265 = getelementptr inbounds float, float* %262, i64 %264
  %266 = load float, float* %265, align 4
  %267 = fmul float %261, %266
  %268 = load float, float* %22, align 4
  %269 = load float*, float** %8, align 8
  %270 = load i16, i16* %13, align 2
  %271 = sext i16 %270 to i64
  %272 = getelementptr inbounds float, float* %269, i64 %271
  %273 = load float, float* %272, align 4
  %274 = fmul float %268, %273
  %275 = fadd float %267, %274
  store float %275, float* %23, align 4
  %276 = load float*, float** %6, align 8
  %277 = getelementptr inbounds float, float* %276, i64 0
  %278 = load float, float* %277, align 4
  %279 = load float, float* %23, align 4
  %280 = fsub float %278, %279
  store float %280, float* %27, align 4
  %281 = load float*, float** %6, align 8
  %282 = getelementptr inbounds float, float* %281, i64 0
  %283 = load float, float* %282, align 4
  %284 = load float, float* %23, align 4
  %285 = fadd float %283, %284
  store float %285, float* %26, align 4
  %286 = load float*, float** %8, align 8
  %287 = getelementptr inbounds float, float* %286, i64 0
  %288 = load float, float* %287, align 4
  %289 = load float, float* %24, align 4
  %290 = fsub float %288, %289
  store float %290, float* %28, align 4
  %291 = load float*, float** %8, align 8
  %292 = getelementptr inbounds float, float* %291, i64 0
  %293 = load float, float* %292, align 4
  %294 = load float, float* %24, align 4
  %295 = fadd float %293, %294
  store float %295, float* %25, align 4
  %296 = load float, float* %22, align 4
  %297 = load float*, float** %6, align 8
  %298 = load i16, i16* %15, align 2
  %299 = sext i16 %298 to i64
  %300 = getelementptr inbounds float, float* %297, i64 %299
  %301 = load float, float* %300, align 4
  %302 = fmul float %296, %301
  %303 = load float, float* %21, align 4
  %304 = load float*, float** %8, align 8
  %305 = load i16, i16* %15, align 2
  %306 = sext i16 %305 to i64
  %307 = getelementptr inbounds float, float* %304, i64 %306
  %308 = load float, float* %307, align 4
  %309 = fmul float %303, %308
  %310 = fsub float %302, %309
  store float %310, float* %24, align 4
  %311 = load float, float* %21, align 4
  %312 = load float*, float** %6, align 8
  %313 = load i16, i16* %15, align 2
  %314 = sext i16 %313 to i64
  %315 = getelementptr inbounds float, float* %312, i64 %314
  %316 = load float, float* %315, align 4
  %317 = fmul float %311, %316
  %318 = load float, float* %22, align 4
  %319 = load float*, float** %8, align 8
  %320 = load i16, i16* %15, align 2
  %321 = sext i16 %320 to i64
  %322 = getelementptr inbounds float, float* %319, i64 %321
  %323 = load float, float* %322, align 4
  %324 = fmul float %318, %323
  %325 = fadd float %317, %324
  store float %325, float* %23, align 4
  %326 = load float*, float** %6, align 8
  %327 = load i16, i16* %14, align 2
  %328 = sext i16 %327 to i64
  %329 = getelementptr inbounds float, float* %326, i64 %328
  %330 = load float, float* %329, align 4
  %331 = load float, float* %23, align 4
  %332 = fsub float %330, %331
  store float %332, float* %31, align 4
  %333 = load float*, float** %6, align 8
  %334 = load i16, i16* %14, align 2
  %335 = sext i16 %334 to i64
  %336 = getelementptr inbounds float, float* %333, i64 %335
  %337 = load float, float* %336, align 4
  %338 = load float, float* %23, align 4
  %339 = fadd float %337, %338
  store float %339, float* %29, align 4
  %340 = load float*, float** %8, align 8
  %341 = load i16, i16* %14, align 2
  %342 = sext i16 %341 to i64
  %343 = getelementptr inbounds float, float* %340, i64 %342
  %344 = load float, float* %343, align 4
  %345 = load float, float* %24, align 4
  %346 = fsub float %344, %345
  store float %346, float* %32, align 4
  %347 = load float*, float** %8, align 8
  %348 = load i16, i16* %14, align 2
  %349 = sext i16 %348 to i64
  %350 = getelementptr inbounds float, float* %347, i64 %349
  %351 = load float, float* %350, align 4
  %352 = load float, float* %24, align 4
  %353 = fadd float %351, %352
  store float %353, float* %30, align 4
  %354 = load float, float* %10, align 4
  %355 = load float, float* %29, align 4
  %356 = fmul float %354, %355
  %357 = load float, float* %11, align 4
  %358 = load float, float* %32, align 4
  %359 = fmul float %357, %358
  %360 = fsub float %356, %359
  store float %360, float* %24, align 4
  %361 = load float, float* %11, align 4
  %362 = load float, float* %29, align 4
  %363 = fmul float %361, %362
  %364 = load float, float* %10, align 4
  %365 = load float, float* %32, align 4
  %366 = fmul float %364, %365
  %367 = fadd float %363, %366
  store float %367, float* %23, align 4
  %368 = load float, float* %26, align 4
  %369 = load float, float* %23, align 4
  %370 = fsub float %368, %369
  %371 = load float*, float** %6, align 8
  %372 = load i16, i16* %14, align 2
  %373 = sext i16 %372 to i64
  %374 = getelementptr inbounds float, float* %371, i64 %373
  store float %370, float* %374, align 4
  %375 = load float, float* %26, align 4
  %376 = load float, float* %23, align 4
  %377 = fadd float %375, %376
  %378 = load float*, float** %6, align 8
  %379 = getelementptr inbounds float, float* %378, i64 0
  store float %377, float* %379, align 4
  %380 = load float, float* %28, align 4
  %381 = load float, float* %24, align 4
  %382 = fsub float %380, %381
  %383 = load float*, float** %8, align 8
  %384 = load i16, i16* %15, align 2
  %385 = sext i16 %384 to i64
  %386 = getelementptr inbounds float, float* %383, i64 %385
  store float %382, float* %386, align 4
  %387 = load float, float* %28, align 4
  %388 = load float, float* %24, align 4
  %389 = fadd float %387, %388
  %390 = load float*, float** %8, align 8
  %391 = load i16, i16* %13, align 2
  %392 = sext i16 %391 to i64
  %393 = getelementptr inbounds float, float* %390, i64 %392
  store float %389, float* %393, align 4
  %394 = load float, float* %11, align 4
  %395 = load float, float* %30, align 4
  %396 = fmul float %394, %395
  %397 = load float, float* %10, align 4
  %398 = load float, float* %31, align 4
  %399 = fmul float %397, %398
  %400 = fsub float %396, %399
  store float %400, float* %24, align 4
  %401 = load float, float* %10, align 4
  %402 = load float, float* %30, align 4
  %403 = fmul float %401, %402
  %404 = load float, float* %11, align 4
  %405 = load float, float* %31, align 4
  %406 = fmul float %404, %405
  %407 = fadd float %403, %406
  store float %407, float* %23, align 4
  %408 = load float, float* %25, align 4
  %409 = load float, float* %23, align 4
  %410 = fsub float %408, %409
  %411 = load float*, float** %8, align 8
  %412 = load i16, i16* %14, align 2
  %413 = sext i16 %412 to i64
  %414 = getelementptr inbounds float, float* %411, i64 %413
  store float %410, float* %414, align 4
  %415 = load float, float* %25, align 4
  %416 = load float, float* %23, align 4
  %417 = fadd float %415, %416
  %418 = load float*, float** %8, align 8
  %419 = getelementptr inbounds float, float* %418, i64 0
  store float %417, float* %419, align 4
  %420 = load float, float* %27, align 4
  %421 = load float, float* %24, align 4
  %422 = fsub float %420, %421
  %423 = load float*, float** %6, align 8
  %424 = load i16, i16* %15, align 2
  %425 = sext i16 %424 to i64
  %426 = getelementptr inbounds float, float* %423, i64 %425
  store float %422, float* %426, align 4
  %427 = load float, float* %27, align 4
  %428 = load float, float* %24, align 4
  %429 = fadd float %427, %428
  %430 = load float*, float** %6, align 8
  %431 = load i16, i16* %13, align 2
  %432 = sext i16 %431 to i64
  %433 = getelementptr inbounds float, float* %430, i64 %432
  store float %429, float* %433, align 4
  %434 = load i16, i16* %5, align 2
  %435 = sext i16 %434 to i32
  %436 = load float*, float** %8, align 8
  %437 = sext i32 %435 to i64
  %438 = getelementptr inbounds float, float* %436, i64 %437
  store float* %438, float** %8, align 8
  %439 = load i16, i16* %5, align 2
  %440 = sext i16 %439 to i32
  %441 = load float*, float** %6, align 8
  %442 = sext i32 %440 to i64
  %443 = getelementptr inbounds float, float* %441, i64 %442
  store float* %443, float** %6, align 8
  br label %444

; <label>:444:                                    ; preds = %244
  %445 = load float*, float** %6, align 8
  %446 = load float*, float** %7, align 8
  %447 = icmp ult float* %445, %446
  br i1 %447, label %244, label %448

; <label>:448:                                    ; preds = %444
  %449 = load float, float* %11, align 4
  store float %449, float* %21, align 4
  %450 = load float, float* %21, align 4
  %451 = load float*, float** %9, align 8
  %452 = getelementptr inbounds float, float* %451, i64 0
  %453 = load float, float* %452, align 4
  %454 = fmul float %450, %453
  %455 = load float, float* %10, align 4
  %456 = load float*, float** %9, align 8
  %457 = getelementptr inbounds float, float* %456, i64 1
  %458 = load float, float* %457, align 4
  %459 = fmul float %455, %458
  %460 = fsub float %454, %459
  store float %460, float* %11, align 4
  %461 = load float, float* %21, align 4
  %462 = load float*, float** %9, align 8
  %463 = getelementptr inbounds float, float* %462, i64 1
  %464 = load float, float* %463, align 4
  %465 = fmul float %461, %464
  %466 = load float, float* %10, align 4
  %467 = load float*, float** %9, align 8
  %468 = getelementptr inbounds float, float* %467, i64 0
  %469 = load float, float* %468, align 4
  %470 = fmul float %466, %469
  %471 = fadd float %465, %470
  store float %471, float* %10, align 4
  br label %472

; <label>:472:                                    ; preds = %448
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_fht, i64 0, i64 2)
  %473 = add i64 %pgocount2, 1
  store i64 %473, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_fht, i64 0, i64 2)
  %474 = load i16, i16* %12, align 2
  %475 = add i16 %474, 1
  store i16 %475, i16* %12, align 2
  br label %213

; <label>:476:                                    ; preds = %213
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_fht, i64 0, i64 3)
  %477 = add i64 %pgocount3, 1
  store i64 %477, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_fht, i64 0, i64 3)
  %478 = load float*, float** %9, align 8
  %479 = getelementptr inbounds float, float* %478, i64 2
  store float* %479, float** %9, align 8
  br label %480

; <label>:480:                                    ; preds = %476
  %481 = load i16, i16* %5, align 2
  %482 = sext i16 %481 to i32
  %483 = load i16, i16* %4, align 2
  %484 = sext i16 %483 to i32
  %485 = icmp slt i32 %482, %484
  br i1 %485, label %38, label %486

; <label>:486:                                    ; preds = %480
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_fht, i64 0, i64 4)
  %487 = add i64 %pgocount4, 1
  store i64 %487, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_fht, i64 0, i64 4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @fft_long(float*, i32, i16**) #0 {
  %4 = alloca float*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i16**, align 8
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %9 = alloca float, align 4
  %10 = alloca float, align 4
  %11 = alloca float, align 4
  %12 = alloca float, align 4
  %13 = alloca float, align 4
  %14 = alloca float, align 4
  %15 = alloca float, align 4
  %16 = alloca float, align 4
  %17 = alloca float, align 4
  %18 = alloca float, align 4
  %19 = alloca float, align 4
  %20 = alloca float, align 4
  %21 = alloca float, align 4
  %22 = alloca float, align 4
  %23 = alloca float, align 4
  store float* %0, float** %4, align 8
  store i32 %1, i32* %5, align 4
  store i16** %2, i16*** %6, align 8
  store i16 127, i16* %8, align 2
  %24 = load float*, float** %4, align 8
  %25 = getelementptr inbounds float, float* %24, i64 512
  store float* %25, float** %4, align 8
  %26 = load i32, i32* %5, align 4
  %27 = icmp slt i32 %26, 2
  br i1 %27, label %28, label %264

; <label>:28:                                     ; preds = %3
  br label %29

; <label>:29:                                     ; preds = %257, %28
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_fft_long, i64 0, i64 0)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_fft_long, i64 0, i64 0)
  %31 = load i16, i16* %8, align 2
  %32 = sext i16 %31 to i64
  %33 = getelementptr inbounds [128 x i16], [128 x i16]* @rv_tbl, i64 0, i64 %32
  %34 = load i16, i16* %33, align 2
  store i16 %34, i16* %7, align 2
  %35 = load i16, i16* %7, align 2
  %36 = sext i16 %35 to i64
  %37 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %36
  %38 = load float, float* %37, align 4
  %39 = load i16**, i16*** %6, align 8
  %40 = load i32, i32* %5, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i16*, i16** %39, i64 %41
  %43 = load i16*, i16** %42, align 8
  %44 = load i16, i16* %7, align 2
  %45 = sext i16 %44 to i64
  %46 = getelementptr inbounds i16, i16* %43, i64 %45
  %47 = load i16, i16* %46, align 2
  %48 = sext i16 %47 to i32
  %49 = sitofp i32 %48 to float
  %50 = fmul float %38, %49
  store float %50, float* %9, align 4
  %51 = load i16, i16* %7, align 2
  %52 = sext i16 %51 to i32
  %53 = sub nsw i32 511, %52
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %54
  %56 = load float, float* %55, align 4
  %57 = load i16**, i16*** %6, align 8
  %58 = load i32, i32* %5, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i16*, i16** %57, i64 %59
  %61 = load i16*, i16** %60, align 8
  %62 = load i16, i16* %7, align 2
  %63 = sext i16 %62 to i32
  %64 = add nsw i32 %63, 512
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i16, i16* %61, i64 %65
  %67 = load i16, i16* %66, align 2
  %68 = sext i16 %67 to i32
  %69 = sitofp i32 %68 to float
  %70 = fmul float %56, %69
  store float %70, float* %13, align 4
  %71 = load float, float* %9, align 4
  %72 = load float, float* %13, align 4
  %73 = fsub float %71, %72
  store float %73, float* %10, align 4
  %74 = load float, float* %9, align 4
  %75 = load float, float* %13, align 4
  %76 = fadd float %74, %75
  store float %76, float* %9, align 4
  %77 = load i16, i16* %7, align 2
  %78 = sext i16 %77 to i32
  %79 = add nsw i32 %78, 256
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %80
  %82 = load float, float* %81, align 4
  %83 = load i16**, i16*** %6, align 8
  %84 = load i32, i32* %5, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i16*, i16** %83, i64 %85
  %87 = load i16*, i16** %86, align 8
  %88 = load i16, i16* %7, align 2
  %89 = sext i16 %88 to i32
  %90 = add nsw i32 %89, 256
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i16, i16* %87, i64 %91
  %93 = load i16, i16* %92, align 2
  %94 = sext i16 %93 to i32
  %95 = sitofp i32 %94 to float
  %96 = fmul float %82, %95
  store float %96, float* %11, align 4
  %97 = load i16, i16* %7, align 2
  %98 = sext i16 %97 to i32
  %99 = sub nsw i32 255, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %100
  %102 = load float, float* %101, align 4
  %103 = load i16**, i16*** %6, align 8
  %104 = load i32, i32* %5, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i16*, i16** %103, i64 %105
  %107 = load i16*, i16** %106, align 8
  %108 = load i16, i16* %7, align 2
  %109 = sext i16 %108 to i32
  %110 = add nsw i32 %109, 768
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i16, i16* %107, i64 %111
  %113 = load i16, i16* %112, align 2
  %114 = sext i16 %113 to i32
  %115 = sitofp i32 %114 to float
  %116 = fmul float %102, %115
  store float %116, float* %13, align 4
  %117 = load float, float* %11, align 4
  %118 = load float, float* %13, align 4
  %119 = fsub float %117, %118
  store float %119, float* %12, align 4
  %120 = load float, float* %11, align 4
  %121 = load float, float* %13, align 4
  %122 = fadd float %120, %121
  store float %122, float* %11, align 4
  %123 = load float*, float** %4, align 8
  %124 = getelementptr inbounds float, float* %123, i64 -4
  store float* %124, float** %4, align 8
  %125 = load float, float* %9, align 4
  %126 = load float, float* %11, align 4
  %127 = fadd float %125, %126
  %128 = load float*, float** %4, align 8
  %129 = getelementptr inbounds float, float* %128, i64 0
  store float %127, float* %129, align 4
  %130 = load float, float* %9, align 4
  %131 = load float, float* %11, align 4
  %132 = fsub float %130, %131
  %133 = load float*, float** %4, align 8
  %134 = getelementptr inbounds float, float* %133, i64 2
  store float %132, float* %134, align 4
  %135 = load float, float* %10, align 4
  %136 = load float, float* %12, align 4
  %137 = fadd float %135, %136
  %138 = load float*, float** %4, align 8
  %139 = getelementptr inbounds float, float* %138, i64 1
  store float %137, float* %139, align 4
  %140 = load float, float* %10, align 4
  %141 = load float, float* %12, align 4
  %142 = fsub float %140, %141
  %143 = load float*, float** %4, align 8
  %144 = getelementptr inbounds float, float* %143, i64 3
  store float %142, float* %144, align 4
  %145 = load i16, i16* %7, align 2
  %146 = sext i16 %145 to i32
  %147 = add nsw i32 %146, 1
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %148
  %150 = load float, float* %149, align 4
  %151 = load i16**, i16*** %6, align 8
  %152 = load i32, i32* %5, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i16*, i16** %151, i64 %153
  %155 = load i16*, i16** %154, align 8
  %156 = load i16, i16* %7, align 2
  %157 = sext i16 %156 to i32
  %158 = add nsw i32 %157, 1
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i16, i16* %155, i64 %159
  %161 = load i16, i16* %160, align 2
  %162 = sext i16 %161 to i32
  %163 = sitofp i32 %162 to float
  %164 = fmul float %150, %163
  store float %164, float* %9, align 4
  %165 = load i16, i16* %7, align 2
  %166 = sext i16 %165 to i32
  %167 = sub nsw i32 510, %166
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %168
  %170 = load float, float* %169, align 4
  %171 = load i16**, i16*** %6, align 8
  %172 = load i32, i32* %5, align 4
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i16*, i16** %171, i64 %173
  %175 = load i16*, i16** %174, align 8
  %176 = load i16, i16* %7, align 2
  %177 = sext i16 %176 to i32
  %178 = add nsw i32 %177, 513
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds i16, i16* %175, i64 %179
  %181 = load i16, i16* %180, align 2
  %182 = sext i16 %181 to i32
  %183 = sitofp i32 %182 to float
  %184 = fmul float %170, %183
  store float %184, float* %13, align 4
  %185 = load float, float* %9, align 4
  %186 = load float, float* %13, align 4
  %187 = fsub float %185, %186
  store float %187, float* %10, align 4
  %188 = load float, float* %9, align 4
  %189 = load float, float* %13, align 4
  %190 = fadd float %188, %189
  store float %190, float* %9, align 4
  %191 = load i16, i16* %7, align 2
  %192 = sext i16 %191 to i32
  %193 = add nsw i32 %192, 257
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %194
  %196 = load float, float* %195, align 4
  %197 = load i16**, i16*** %6, align 8
  %198 = load i32, i32* %5, align 4
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds i16*, i16** %197, i64 %199
  %201 = load i16*, i16** %200, align 8
  %202 = load i16, i16* %7, align 2
  %203 = sext i16 %202 to i32
  %204 = add nsw i32 %203, 257
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds i16, i16* %201, i64 %205
  %207 = load i16, i16* %206, align 2
  %208 = sext i16 %207 to i32
  %209 = sitofp i32 %208 to float
  %210 = fmul float %196, %209
  store float %210, float* %11, align 4
  %211 = load i16, i16* %7, align 2
  %212 = sext i16 %211 to i32
  %213 = sub nsw i32 254, %212
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %214
  %216 = load float, float* %215, align 4
  %217 = load i16**, i16*** %6, align 8
  %218 = load i32, i32* %5, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds i16*, i16** %217, i64 %219
  %221 = load i16*, i16** %220, align 8
  %222 = load i16, i16* %7, align 2
  %223 = sext i16 %222 to i32
  %224 = add nsw i32 %223, 769
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds i16, i16* %221, i64 %225
  %227 = load i16, i16* %226, align 2
  %228 = sext i16 %227 to i32
  %229 = sitofp i32 %228 to float
  %230 = fmul float %216, %229
  store float %230, float* %13, align 4
  %231 = load float, float* %11, align 4
  %232 = load float, float* %13, align 4
  %233 = fsub float %231, %232
  store float %233, float* %12, align 4
  %234 = load float, float* %11, align 4
  %235 = load float, float* %13, align 4
  %236 = fadd float %234, %235
  store float %236, float* %11, align 4
  %237 = load float, float* %9, align 4
  %238 = load float, float* %11, align 4
  %239 = fadd float %237, %238
  %240 = load float*, float** %4, align 8
  %241 = getelementptr inbounds float, float* %240, i64 512
  store float %239, float* %241, align 4
  %242 = load float, float* %9, align 4
  %243 = load float, float* %11, align 4
  %244 = fsub float %242, %243
  %245 = load float*, float** %4, align 8
  %246 = getelementptr inbounds float, float* %245, i64 514
  store float %244, float* %246, align 4
  %247 = load float, float* %10, align 4
  %248 = load float, float* %12, align 4
  %249 = fadd float %247, %248
  %250 = load float*, float** %4, align 8
  %251 = getelementptr inbounds float, float* %250, i64 513
  store float %249, float* %251, align 4
  %252 = load float, float* %10, align 4
  %253 = load float, float* %12, align 4
  %254 = fsub float %252, %253
  %255 = load float*, float** %4, align 8
  %256 = getelementptr inbounds float, float* %255, i64 515
  store float %254, float* %256, align 4
  br label %257

; <label>:257:                                    ; preds = %29
  %258 = load i16, i16* %8, align 2
  %259 = add i16 %258, -1
  store i16 %259, i16* %8, align 2
  %260 = sext i16 %259 to i32
  %261 = icmp sge i32 %260, 0
  br i1 %261, label %29, label %262

; <label>:262:                                    ; preds = %257
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_fft_long, i64 0, i64 3)
  %263 = add i64 %pgocount1, 1
  store i64 %263, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_fft_long, i64 0, i64 3)
  br label %896

; <label>:264:                                    ; preds = %3
  %265 = load i32, i32* %5, align 4
  %266 = icmp eq i32 %265, 2
  br i1 %266, label %267, label %581

; <label>:267:                                    ; preds = %264
  br label %268

; <label>:268:                                    ; preds = %574, %267
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_fft_long, i64 0, i64 1)
  %269 = add i64 %pgocount2, 1
  store i64 %269, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_fft_long, i64 0, i64 1)
  %270 = load i16, i16* %8, align 2
  %271 = sext i16 %270 to i64
  %272 = getelementptr inbounds [128 x i16], [128 x i16]* @rv_tbl, i64 0, i64 %271
  %273 = load i16, i16* %272, align 2
  store i16 %273, i16* %7, align 2
  %274 = load i16, i16* %7, align 2
  %275 = sext i16 %274 to i64
  %276 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %275
  %277 = load float, float* %276, align 4
  %278 = load i16**, i16*** %6, align 8
  %279 = getelementptr inbounds i16*, i16** %278, i64 0
  %280 = load i16*, i16** %279, align 8
  %281 = load i16, i16* %7, align 2
  %282 = sext i16 %281 to i64
  %283 = getelementptr inbounds i16, i16* %280, i64 %282
  %284 = load i16, i16* %283, align 2
  %285 = sext i16 %284 to i32
  %286 = load i16**, i16*** %6, align 8
  %287 = getelementptr inbounds i16*, i16** %286, i64 1
  %288 = load i16*, i16** %287, align 8
  %289 = load i16, i16* %7, align 2
  %290 = sext i16 %289 to i64
  %291 = getelementptr inbounds i16, i16* %288, i64 %290
  %292 = load i16, i16* %291, align 2
  %293 = sext i16 %292 to i32
  %294 = add nsw i32 %285, %293
  %295 = sitofp i32 %294 to float
  %296 = fmul float 0x3FE6A09E60000000, %295
  %297 = fmul float %277, %296
  store float %297, float* %14, align 4
  %298 = load i16, i16* %7, align 2
  %299 = sext i16 %298 to i32
  %300 = sub nsw i32 511, %299
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %301
  %303 = load float, float* %302, align 4
  %304 = load i16**, i16*** %6, align 8
  %305 = getelementptr inbounds i16*, i16** %304, i64 0
  %306 = load i16*, i16** %305, align 8
  %307 = load i16, i16* %7, align 2
  %308 = sext i16 %307 to i32
  %309 = add nsw i32 %308, 512
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds i16, i16* %306, i64 %310
  %312 = load i16, i16* %311, align 2
  %313 = sext i16 %312 to i32
  %314 = load i16**, i16*** %6, align 8
  %315 = getelementptr inbounds i16*, i16** %314, i64 1
  %316 = load i16*, i16** %315, align 8
  %317 = load i16, i16* %7, align 2
  %318 = sext i16 %317 to i32
  %319 = add nsw i32 %318, 512
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds i16, i16* %316, i64 %320
  %322 = load i16, i16* %321, align 2
  %323 = sext i16 %322 to i32
  %324 = add nsw i32 %313, %323
  %325 = sitofp i32 %324 to float
  %326 = fmul float 0x3FE6A09E60000000, %325
  %327 = fmul float %303, %326
  store float %327, float* %18, align 4
  %328 = load float, float* %14, align 4
  %329 = load float, float* %18, align 4
  %330 = fsub float %328, %329
  store float %330, float* %15, align 4
  %331 = load float, float* %14, align 4
  %332 = load float, float* %18, align 4
  %333 = fadd float %331, %332
  store float %333, float* %14, align 4
  %334 = load i16, i16* %7, align 2
  %335 = sext i16 %334 to i32
  %336 = add nsw i32 %335, 256
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %337
  %339 = load float, float* %338, align 4
  %340 = load i16**, i16*** %6, align 8
  %341 = getelementptr inbounds i16*, i16** %340, i64 0
  %342 = load i16*, i16** %341, align 8
  %343 = load i16, i16* %7, align 2
  %344 = sext i16 %343 to i32
  %345 = add nsw i32 %344, 256
  %346 = sext i32 %345 to i64
  %347 = getelementptr inbounds i16, i16* %342, i64 %346
  %348 = load i16, i16* %347, align 2
  %349 = sext i16 %348 to i32
  %350 = load i16**, i16*** %6, align 8
  %351 = getelementptr inbounds i16*, i16** %350, i64 1
  %352 = load i16*, i16** %351, align 8
  %353 = load i16, i16* %7, align 2
  %354 = sext i16 %353 to i32
  %355 = add nsw i32 %354, 256
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds i16, i16* %352, i64 %356
  %358 = load i16, i16* %357, align 2
  %359 = sext i16 %358 to i32
  %360 = add nsw i32 %349, %359
  %361 = sitofp i32 %360 to float
  %362 = fmul float 0x3FE6A09E60000000, %361
  %363 = fmul float %339, %362
  store float %363, float* %16, align 4
  %364 = load i16, i16* %7, align 2
  %365 = sext i16 %364 to i32
  %366 = sub nsw i32 255, %365
  %367 = sext i32 %366 to i64
  %368 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %367
  %369 = load float, float* %368, align 4
  %370 = load i16**, i16*** %6, align 8
  %371 = getelementptr inbounds i16*, i16** %370, i64 0
  %372 = load i16*, i16** %371, align 8
  %373 = load i16, i16* %7, align 2
  %374 = sext i16 %373 to i32
  %375 = add nsw i32 %374, 768
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds i16, i16* %372, i64 %376
  %378 = load i16, i16* %377, align 2
  %379 = sext i16 %378 to i32
  %380 = load i16**, i16*** %6, align 8
  %381 = getelementptr inbounds i16*, i16** %380, i64 1
  %382 = load i16*, i16** %381, align 8
  %383 = load i16, i16* %7, align 2
  %384 = sext i16 %383 to i32
  %385 = add nsw i32 %384, 768
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds i16, i16* %382, i64 %386
  %388 = load i16, i16* %387, align 2
  %389 = sext i16 %388 to i32
  %390 = add nsw i32 %379, %389
  %391 = sitofp i32 %390 to float
  %392 = fmul float 0x3FE6A09E60000000, %391
  %393 = fmul float %369, %392
  store float %393, float* %18, align 4
  %394 = load float, float* %16, align 4
  %395 = load float, float* %18, align 4
  %396 = fsub float %394, %395
  store float %396, float* %17, align 4
  %397 = load float, float* %16, align 4
  %398 = load float, float* %18, align 4
  %399 = fadd float %397, %398
  store float %399, float* %16, align 4
  %400 = load float*, float** %4, align 8
  %401 = getelementptr inbounds float, float* %400, i64 -4
  store float* %401, float** %4, align 8
  %402 = load float, float* %14, align 4
  %403 = load float, float* %16, align 4
  %404 = fadd float %402, %403
  %405 = load float*, float** %4, align 8
  %406 = getelementptr inbounds float, float* %405, i64 0
  store float %404, float* %406, align 4
  %407 = load float, float* %14, align 4
  %408 = load float, float* %16, align 4
  %409 = fsub float %407, %408
  %410 = load float*, float** %4, align 8
  %411 = getelementptr inbounds float, float* %410, i64 2
  store float %409, float* %411, align 4
  %412 = load float, float* %15, align 4
  %413 = load float, float* %17, align 4
  %414 = fadd float %412, %413
  %415 = load float*, float** %4, align 8
  %416 = getelementptr inbounds float, float* %415, i64 1
  store float %414, float* %416, align 4
  %417 = load float, float* %15, align 4
  %418 = load float, float* %17, align 4
  %419 = fsub float %417, %418
  %420 = load float*, float** %4, align 8
  %421 = getelementptr inbounds float, float* %420, i64 3
  store float %419, float* %421, align 4
  %422 = load i16, i16* %7, align 2
  %423 = sext i16 %422 to i32
  %424 = add nsw i32 %423, 1
  %425 = sext i32 %424 to i64
  %426 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %425
  %427 = load float, float* %426, align 4
  %428 = load i16**, i16*** %6, align 8
  %429 = getelementptr inbounds i16*, i16** %428, i64 0
  %430 = load i16*, i16** %429, align 8
  %431 = load i16, i16* %7, align 2
  %432 = sext i16 %431 to i32
  %433 = add nsw i32 %432, 1
  %434 = sext i32 %433 to i64
  %435 = getelementptr inbounds i16, i16* %430, i64 %434
  %436 = load i16, i16* %435, align 2
  %437 = sext i16 %436 to i32
  %438 = load i16**, i16*** %6, align 8
  %439 = getelementptr inbounds i16*, i16** %438, i64 1
  %440 = load i16*, i16** %439, align 8
  %441 = load i16, i16* %7, align 2
  %442 = sext i16 %441 to i32
  %443 = add nsw i32 %442, 1
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds i16, i16* %440, i64 %444
  %446 = load i16, i16* %445, align 2
  %447 = sext i16 %446 to i32
  %448 = add nsw i32 %437, %447
  %449 = sitofp i32 %448 to float
  %450 = fmul float 0x3FE6A09E60000000, %449
  %451 = fmul float %427, %450
  store float %451, float* %14, align 4
  %452 = load i16, i16* %7, align 2
  %453 = sext i16 %452 to i32
  %454 = sub nsw i32 510, %453
  %455 = sext i32 %454 to i64
  %456 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %455
  %457 = load float, float* %456, align 4
  %458 = load i16**, i16*** %6, align 8
  %459 = getelementptr inbounds i16*, i16** %458, i64 0
  %460 = load i16*, i16** %459, align 8
  %461 = load i16, i16* %7, align 2
  %462 = sext i16 %461 to i32
  %463 = add nsw i32 %462, 513
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds i16, i16* %460, i64 %464
  %466 = load i16, i16* %465, align 2
  %467 = sext i16 %466 to i32
  %468 = load i16**, i16*** %6, align 8
  %469 = getelementptr inbounds i16*, i16** %468, i64 1
  %470 = load i16*, i16** %469, align 8
  %471 = load i16, i16* %7, align 2
  %472 = sext i16 %471 to i32
  %473 = add nsw i32 %472, 513
  %474 = sext i32 %473 to i64
  %475 = getelementptr inbounds i16, i16* %470, i64 %474
  %476 = load i16, i16* %475, align 2
  %477 = sext i16 %476 to i32
  %478 = add nsw i32 %467, %477
  %479 = sitofp i32 %478 to float
  %480 = fmul float 0x3FE6A09E60000000, %479
  %481 = fmul float %457, %480
  store float %481, float* %18, align 4
  %482 = load float, float* %14, align 4
  %483 = load float, float* %18, align 4
  %484 = fsub float %482, %483
  store float %484, float* %15, align 4
  %485 = load float, float* %14, align 4
  %486 = load float, float* %18, align 4
  %487 = fadd float %485, %486
  store float %487, float* %14, align 4
  %488 = load i16, i16* %7, align 2
  %489 = sext i16 %488 to i32
  %490 = add nsw i32 %489, 257
  %491 = sext i32 %490 to i64
  %492 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %491
  %493 = load float, float* %492, align 4
  %494 = load i16**, i16*** %6, align 8
  %495 = getelementptr inbounds i16*, i16** %494, i64 0
  %496 = load i16*, i16** %495, align 8
  %497 = load i16, i16* %7, align 2
  %498 = sext i16 %497 to i32
  %499 = add nsw i32 %498, 257
  %500 = sext i32 %499 to i64
  %501 = getelementptr inbounds i16, i16* %496, i64 %500
  %502 = load i16, i16* %501, align 2
  %503 = sext i16 %502 to i32
  %504 = load i16**, i16*** %6, align 8
  %505 = getelementptr inbounds i16*, i16** %504, i64 1
  %506 = load i16*, i16** %505, align 8
  %507 = load i16, i16* %7, align 2
  %508 = sext i16 %507 to i32
  %509 = add nsw i32 %508, 257
  %510 = sext i32 %509 to i64
  %511 = getelementptr inbounds i16, i16* %506, i64 %510
  %512 = load i16, i16* %511, align 2
  %513 = sext i16 %512 to i32
  %514 = add nsw i32 %503, %513
  %515 = sitofp i32 %514 to float
  %516 = fmul float 0x3FE6A09E60000000, %515
  %517 = fmul float %493, %516
  store float %517, float* %16, align 4
  %518 = load i16, i16* %7, align 2
  %519 = sext i16 %518 to i32
  %520 = sub nsw i32 254, %519
  %521 = sext i32 %520 to i64
  %522 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %521
  %523 = load float, float* %522, align 4
  %524 = load i16**, i16*** %6, align 8
  %525 = getelementptr inbounds i16*, i16** %524, i64 0
  %526 = load i16*, i16** %525, align 8
  %527 = load i16, i16* %7, align 2
  %528 = sext i16 %527 to i32
  %529 = add nsw i32 %528, 769
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds i16, i16* %526, i64 %530
  %532 = load i16, i16* %531, align 2
  %533 = sext i16 %532 to i32
  %534 = load i16**, i16*** %6, align 8
  %535 = getelementptr inbounds i16*, i16** %534, i64 1
  %536 = load i16*, i16** %535, align 8
  %537 = load i16, i16* %7, align 2
  %538 = sext i16 %537 to i32
  %539 = add nsw i32 %538, 769
  %540 = sext i32 %539 to i64
  %541 = getelementptr inbounds i16, i16* %536, i64 %540
  %542 = load i16, i16* %541, align 2
  %543 = sext i16 %542 to i32
  %544 = add nsw i32 %533, %543
  %545 = sitofp i32 %544 to float
  %546 = fmul float 0x3FE6A09E60000000, %545
  %547 = fmul float %523, %546
  store float %547, float* %18, align 4
  %548 = load float, float* %16, align 4
  %549 = load float, float* %18, align 4
  %550 = fsub float %548, %549
  store float %550, float* %17, align 4
  %551 = load float, float* %16, align 4
  %552 = load float, float* %18, align 4
  %553 = fadd float %551, %552
  store float %553, float* %16, align 4
  %554 = load float, float* %14, align 4
  %555 = load float, float* %16, align 4
  %556 = fadd float %554, %555
  %557 = load float*, float** %4, align 8
  %558 = getelementptr inbounds float, float* %557, i64 512
  store float %556, float* %558, align 4
  %559 = load float, float* %14, align 4
  %560 = load float, float* %16, align 4
  %561 = fsub float %559, %560
  %562 = load float*, float** %4, align 8
  %563 = getelementptr inbounds float, float* %562, i64 514
  store float %561, float* %563, align 4
  %564 = load float, float* %15, align 4
  %565 = load float, float* %17, align 4
  %566 = fadd float %564, %565
  %567 = load float*, float** %4, align 8
  %568 = getelementptr inbounds float, float* %567, i64 513
  store float %566, float* %568, align 4
  %569 = load float, float* %15, align 4
  %570 = load float, float* %17, align 4
  %571 = fsub float %569, %570
  %572 = load float*, float** %4, align 8
  %573 = getelementptr inbounds float, float* %572, i64 515
  store float %571, float* %573, align 4
  br label %574

; <label>:574:                                    ; preds = %268
  %575 = load i16, i16* %8, align 2
  %576 = add i16 %575, -1
  store i16 %576, i16* %8, align 2
  %577 = sext i16 %576 to i32
  %578 = icmp sge i32 %577, 0
  br i1 %578, label %268, label %579

; <label>:579:                                    ; preds = %574
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_fft_long, i64 0, i64 4)
  %580 = add i64 %pgocount3, 1
  store i64 %580, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_fft_long, i64 0, i64 4)
  br label %895

; <label>:581:                                    ; preds = %264
  br label %582

; <label>:582:                                    ; preds = %888, %581
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_fft_long, i64 0, i64 2)
  %583 = add i64 %pgocount4, 1
  store i64 %583, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_fft_long, i64 0, i64 2)
  %584 = load i16, i16* %8, align 2
  %585 = sext i16 %584 to i64
  %586 = getelementptr inbounds [128 x i16], [128 x i16]* @rv_tbl, i64 0, i64 %585
  %587 = load i16, i16* %586, align 2
  store i16 %587, i16* %7, align 2
  %588 = load i16, i16* %7, align 2
  %589 = sext i16 %588 to i64
  %590 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %589
  %591 = load float, float* %590, align 4
  %592 = load i16**, i16*** %6, align 8
  %593 = getelementptr inbounds i16*, i16** %592, i64 0
  %594 = load i16*, i16** %593, align 8
  %595 = load i16, i16* %7, align 2
  %596 = sext i16 %595 to i64
  %597 = getelementptr inbounds i16, i16* %594, i64 %596
  %598 = load i16, i16* %597, align 2
  %599 = sext i16 %598 to i32
  %600 = load i16**, i16*** %6, align 8
  %601 = getelementptr inbounds i16*, i16** %600, i64 1
  %602 = load i16*, i16** %601, align 8
  %603 = load i16, i16* %7, align 2
  %604 = sext i16 %603 to i64
  %605 = getelementptr inbounds i16, i16* %602, i64 %604
  %606 = load i16, i16* %605, align 2
  %607 = sext i16 %606 to i32
  %608 = sub nsw i32 %599, %607
  %609 = sitofp i32 %608 to float
  %610 = fmul float 0x3FE6A09E60000000, %609
  %611 = fmul float %591, %610
  store float %611, float* %19, align 4
  %612 = load i16, i16* %7, align 2
  %613 = sext i16 %612 to i32
  %614 = sub nsw i32 511, %613
  %615 = sext i32 %614 to i64
  %616 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %615
  %617 = load float, float* %616, align 4
  %618 = load i16**, i16*** %6, align 8
  %619 = getelementptr inbounds i16*, i16** %618, i64 0
  %620 = load i16*, i16** %619, align 8
  %621 = load i16, i16* %7, align 2
  %622 = sext i16 %621 to i32
  %623 = add nsw i32 %622, 512
  %624 = sext i32 %623 to i64
  %625 = getelementptr inbounds i16, i16* %620, i64 %624
  %626 = load i16, i16* %625, align 2
  %627 = sext i16 %626 to i32
  %628 = load i16**, i16*** %6, align 8
  %629 = getelementptr inbounds i16*, i16** %628, i64 1
  %630 = load i16*, i16** %629, align 8
  %631 = load i16, i16* %7, align 2
  %632 = sext i16 %631 to i32
  %633 = add nsw i32 %632, 512
  %634 = sext i32 %633 to i64
  %635 = getelementptr inbounds i16, i16* %630, i64 %634
  %636 = load i16, i16* %635, align 2
  %637 = sext i16 %636 to i32
  %638 = sub nsw i32 %627, %637
  %639 = sitofp i32 %638 to float
  %640 = fmul float 0x3FE6A09E60000000, %639
  %641 = fmul float %617, %640
  store float %641, float* %23, align 4
  %642 = load float, float* %19, align 4
  %643 = load float, float* %23, align 4
  %644 = fsub float %642, %643
  store float %644, float* %20, align 4
  %645 = load float, float* %19, align 4
  %646 = load float, float* %23, align 4
  %647 = fadd float %645, %646
  store float %647, float* %19, align 4
  %648 = load i16, i16* %7, align 2
  %649 = sext i16 %648 to i32
  %650 = add nsw i32 %649, 256
  %651 = sext i32 %650 to i64
  %652 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %651
  %653 = load float, float* %652, align 4
  %654 = load i16**, i16*** %6, align 8
  %655 = getelementptr inbounds i16*, i16** %654, i64 0
  %656 = load i16*, i16** %655, align 8
  %657 = load i16, i16* %7, align 2
  %658 = sext i16 %657 to i32
  %659 = add nsw i32 %658, 256
  %660 = sext i32 %659 to i64
  %661 = getelementptr inbounds i16, i16* %656, i64 %660
  %662 = load i16, i16* %661, align 2
  %663 = sext i16 %662 to i32
  %664 = load i16**, i16*** %6, align 8
  %665 = getelementptr inbounds i16*, i16** %664, i64 1
  %666 = load i16*, i16** %665, align 8
  %667 = load i16, i16* %7, align 2
  %668 = sext i16 %667 to i32
  %669 = add nsw i32 %668, 256
  %670 = sext i32 %669 to i64
  %671 = getelementptr inbounds i16, i16* %666, i64 %670
  %672 = load i16, i16* %671, align 2
  %673 = sext i16 %672 to i32
  %674 = sub nsw i32 %663, %673
  %675 = sitofp i32 %674 to float
  %676 = fmul float 0x3FE6A09E60000000, %675
  %677 = fmul float %653, %676
  store float %677, float* %21, align 4
  %678 = load i16, i16* %7, align 2
  %679 = sext i16 %678 to i32
  %680 = sub nsw i32 255, %679
  %681 = sext i32 %680 to i64
  %682 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %681
  %683 = load float, float* %682, align 4
  %684 = load i16**, i16*** %6, align 8
  %685 = getelementptr inbounds i16*, i16** %684, i64 0
  %686 = load i16*, i16** %685, align 8
  %687 = load i16, i16* %7, align 2
  %688 = sext i16 %687 to i32
  %689 = add nsw i32 %688, 768
  %690 = sext i32 %689 to i64
  %691 = getelementptr inbounds i16, i16* %686, i64 %690
  %692 = load i16, i16* %691, align 2
  %693 = sext i16 %692 to i32
  %694 = load i16**, i16*** %6, align 8
  %695 = getelementptr inbounds i16*, i16** %694, i64 1
  %696 = load i16*, i16** %695, align 8
  %697 = load i16, i16* %7, align 2
  %698 = sext i16 %697 to i32
  %699 = add nsw i32 %698, 768
  %700 = sext i32 %699 to i64
  %701 = getelementptr inbounds i16, i16* %696, i64 %700
  %702 = load i16, i16* %701, align 2
  %703 = sext i16 %702 to i32
  %704 = sub nsw i32 %693, %703
  %705 = sitofp i32 %704 to float
  %706 = fmul float 0x3FE6A09E60000000, %705
  %707 = fmul float %683, %706
  store float %707, float* %23, align 4
  %708 = load float, float* %21, align 4
  %709 = load float, float* %23, align 4
  %710 = fsub float %708, %709
  store float %710, float* %22, align 4
  %711 = load float, float* %21, align 4
  %712 = load float, float* %23, align 4
  %713 = fadd float %711, %712
  store float %713, float* %21, align 4
  %714 = load float*, float** %4, align 8
  %715 = getelementptr inbounds float, float* %714, i64 -4
  store float* %715, float** %4, align 8
  %716 = load float, float* %19, align 4
  %717 = load float, float* %21, align 4
  %718 = fadd float %716, %717
  %719 = load float*, float** %4, align 8
  %720 = getelementptr inbounds float, float* %719, i64 0
  store float %718, float* %720, align 4
  %721 = load float, float* %19, align 4
  %722 = load float, float* %21, align 4
  %723 = fsub float %721, %722
  %724 = load float*, float** %4, align 8
  %725 = getelementptr inbounds float, float* %724, i64 2
  store float %723, float* %725, align 4
  %726 = load float, float* %20, align 4
  %727 = load float, float* %22, align 4
  %728 = fadd float %726, %727
  %729 = load float*, float** %4, align 8
  %730 = getelementptr inbounds float, float* %729, i64 1
  store float %728, float* %730, align 4
  %731 = load float, float* %20, align 4
  %732 = load float, float* %22, align 4
  %733 = fsub float %731, %732
  %734 = load float*, float** %4, align 8
  %735 = getelementptr inbounds float, float* %734, i64 3
  store float %733, float* %735, align 4
  %736 = load i16, i16* %7, align 2
  %737 = sext i16 %736 to i32
  %738 = add nsw i32 %737, 1
  %739 = sext i32 %738 to i64
  %740 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %739
  %741 = load float, float* %740, align 4
  %742 = load i16**, i16*** %6, align 8
  %743 = getelementptr inbounds i16*, i16** %742, i64 0
  %744 = load i16*, i16** %743, align 8
  %745 = load i16, i16* %7, align 2
  %746 = sext i16 %745 to i32
  %747 = add nsw i32 %746, 1
  %748 = sext i32 %747 to i64
  %749 = getelementptr inbounds i16, i16* %744, i64 %748
  %750 = load i16, i16* %749, align 2
  %751 = sext i16 %750 to i32
  %752 = load i16**, i16*** %6, align 8
  %753 = getelementptr inbounds i16*, i16** %752, i64 1
  %754 = load i16*, i16** %753, align 8
  %755 = load i16, i16* %7, align 2
  %756 = sext i16 %755 to i32
  %757 = add nsw i32 %756, 1
  %758 = sext i32 %757 to i64
  %759 = getelementptr inbounds i16, i16* %754, i64 %758
  %760 = load i16, i16* %759, align 2
  %761 = sext i16 %760 to i32
  %762 = sub nsw i32 %751, %761
  %763 = sitofp i32 %762 to float
  %764 = fmul float 0x3FE6A09E60000000, %763
  %765 = fmul float %741, %764
  store float %765, float* %19, align 4
  %766 = load i16, i16* %7, align 2
  %767 = sext i16 %766 to i32
  %768 = sub nsw i32 510, %767
  %769 = sext i32 %768 to i64
  %770 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %769
  %771 = load float, float* %770, align 4
  %772 = load i16**, i16*** %6, align 8
  %773 = getelementptr inbounds i16*, i16** %772, i64 0
  %774 = load i16*, i16** %773, align 8
  %775 = load i16, i16* %7, align 2
  %776 = sext i16 %775 to i32
  %777 = add nsw i32 %776, 513
  %778 = sext i32 %777 to i64
  %779 = getelementptr inbounds i16, i16* %774, i64 %778
  %780 = load i16, i16* %779, align 2
  %781 = sext i16 %780 to i32
  %782 = load i16**, i16*** %6, align 8
  %783 = getelementptr inbounds i16*, i16** %782, i64 1
  %784 = load i16*, i16** %783, align 8
  %785 = load i16, i16* %7, align 2
  %786 = sext i16 %785 to i32
  %787 = add nsw i32 %786, 513
  %788 = sext i32 %787 to i64
  %789 = getelementptr inbounds i16, i16* %784, i64 %788
  %790 = load i16, i16* %789, align 2
  %791 = sext i16 %790 to i32
  %792 = sub nsw i32 %781, %791
  %793 = sitofp i32 %792 to float
  %794 = fmul float 0x3FE6A09E60000000, %793
  %795 = fmul float %771, %794
  store float %795, float* %23, align 4
  %796 = load float, float* %19, align 4
  %797 = load float, float* %23, align 4
  %798 = fsub float %796, %797
  store float %798, float* %20, align 4
  %799 = load float, float* %19, align 4
  %800 = load float, float* %23, align 4
  %801 = fadd float %799, %800
  store float %801, float* %19, align 4
  %802 = load i16, i16* %7, align 2
  %803 = sext i16 %802 to i32
  %804 = add nsw i32 %803, 257
  %805 = sext i32 %804 to i64
  %806 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %805
  %807 = load float, float* %806, align 4
  %808 = load i16**, i16*** %6, align 8
  %809 = getelementptr inbounds i16*, i16** %808, i64 0
  %810 = load i16*, i16** %809, align 8
  %811 = load i16, i16* %7, align 2
  %812 = sext i16 %811 to i32
  %813 = add nsw i32 %812, 257
  %814 = sext i32 %813 to i64
  %815 = getelementptr inbounds i16, i16* %810, i64 %814
  %816 = load i16, i16* %815, align 2
  %817 = sext i16 %816 to i32
  %818 = load i16**, i16*** %6, align 8
  %819 = getelementptr inbounds i16*, i16** %818, i64 1
  %820 = load i16*, i16** %819, align 8
  %821 = load i16, i16* %7, align 2
  %822 = sext i16 %821 to i32
  %823 = add nsw i32 %822, 257
  %824 = sext i32 %823 to i64
  %825 = getelementptr inbounds i16, i16* %820, i64 %824
  %826 = load i16, i16* %825, align 2
  %827 = sext i16 %826 to i32
  %828 = sub nsw i32 %817, %827
  %829 = sitofp i32 %828 to float
  %830 = fmul float 0x3FE6A09E60000000, %829
  %831 = fmul float %807, %830
  store float %831, float* %21, align 4
  %832 = load i16, i16* %7, align 2
  %833 = sext i16 %832 to i32
  %834 = sub nsw i32 254, %833
  %835 = sext i32 %834 to i64
  %836 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %835
  %837 = load float, float* %836, align 4
  %838 = load i16**, i16*** %6, align 8
  %839 = getelementptr inbounds i16*, i16** %838, i64 0
  %840 = load i16*, i16** %839, align 8
  %841 = load i16, i16* %7, align 2
  %842 = sext i16 %841 to i32
  %843 = add nsw i32 %842, 769
  %844 = sext i32 %843 to i64
  %845 = getelementptr inbounds i16, i16* %840, i64 %844
  %846 = load i16, i16* %845, align 2
  %847 = sext i16 %846 to i32
  %848 = load i16**, i16*** %6, align 8
  %849 = getelementptr inbounds i16*, i16** %848, i64 1
  %850 = load i16*, i16** %849, align 8
  %851 = load i16, i16* %7, align 2
  %852 = sext i16 %851 to i32
  %853 = add nsw i32 %852, 769
  %854 = sext i32 %853 to i64
  %855 = getelementptr inbounds i16, i16* %850, i64 %854
  %856 = load i16, i16* %855, align 2
  %857 = sext i16 %856 to i32
  %858 = sub nsw i32 %847, %857
  %859 = sitofp i32 %858 to float
  %860 = fmul float 0x3FE6A09E60000000, %859
  %861 = fmul float %837, %860
  store float %861, float* %23, align 4
  %862 = load float, float* %21, align 4
  %863 = load float, float* %23, align 4
  %864 = fsub float %862, %863
  store float %864, float* %22, align 4
  %865 = load float, float* %21, align 4
  %866 = load float, float* %23, align 4
  %867 = fadd float %865, %866
  store float %867, float* %21, align 4
  %868 = load float, float* %19, align 4
  %869 = load float, float* %21, align 4
  %870 = fadd float %868, %869
  %871 = load float*, float** %4, align 8
  %872 = getelementptr inbounds float, float* %871, i64 512
  store float %870, float* %872, align 4
  %873 = load float, float* %19, align 4
  %874 = load float, float* %21, align 4
  %875 = fsub float %873, %874
  %876 = load float*, float** %4, align 8
  %877 = getelementptr inbounds float, float* %876, i64 514
  store float %875, float* %877, align 4
  %878 = load float, float* %20, align 4
  %879 = load float, float* %22, align 4
  %880 = fadd float %878, %879
  %881 = load float*, float** %4, align 8
  %882 = getelementptr inbounds float, float* %881, i64 513
  store float %880, float* %882, align 4
  %883 = load float, float* %20, align 4
  %884 = load float, float* %22, align 4
  %885 = fsub float %883, %884
  %886 = load float*, float** %4, align 8
  %887 = getelementptr inbounds float, float* %886, i64 515
  store float %885, float* %887, align 4
  br label %888

; <label>:888:                                    ; preds = %582
  %889 = load i16, i16* %8, align 2
  %890 = add i16 %889, -1
  store i16 %890, i16* %8, align 2
  %891 = sext i16 %890 to i32
  %892 = icmp sge i32 %891, 0
  br i1 %892, label %582, label %893

; <label>:893:                                    ; preds = %888
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_fft_long, i64 0, i64 5)
  %894 = add i64 %pgocount5, 1
  store i64 %894, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_fft_long, i64 0, i64 5)
  br label %895

; <label>:895:                                    ; preds = %893, %579
  br label %896

; <label>:896:                                    ; preds = %895, %262
  %897 = load float*, float** %4, align 8
  call void @fht(float* %897, i16 signext 1024)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @init_fft() #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  store float 0x3FD921FB60000000, float* %2, align 4
  store i32 0, i32* %1, align 4
  br label %3

; <label>:3:                                      ; preds = %28, %0
  %4 = load i32, i32* %1, align 4
  %5 = icmp slt i32 %4, 4
  br i1 %5, label %6, label %32

; <label>:6:                                      ; preds = %3
  %7 = load float, float* %2, align 4
  %8 = fpext float %7 to double
  %9 = call double @cos(double %8) #2
  %10 = fptrunc double %9 to float
  %11 = load i32, i32* %1, align 4
  %12 = mul nsw i32 %11, 2
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [8 x float], [8 x float]* @costab, i64 0, i64 %13
  store float %10, float* %14, align 4
  %15 = load float, float* %2, align 4
  %16 = fpext float %15 to double
  %17 = call double @sin(double %16) #2
  %18 = fptrunc double %17 to float
  %19 = load i32, i32* %1, align 4
  %20 = mul nsw i32 %19, 2
  %21 = add nsw i32 %20, 1
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [8 x float], [8 x float]* @costab, i64 0, i64 %22
  store float %18, float* %23, align 4
  %24 = load float, float* %2, align 4
  %25 = fpext float %24 to double
  %26 = fmul double %25, 2.500000e-01
  %27 = fptrunc double %26 to float
  store float %27, float* %2, align 4
  br label %28

; <label>:28:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_init_fft, i64 0, i64 0)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_init_fft, i64 0, i64 0)
  %30 = load i32, i32* %1, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %1, align 4
  br label %3

; <label>:32:                                     ; preds = %3
  store i32 0, i32* %1, align 4
  br label %33

; <label>:33:                                     ; preds = %49, %32
  %34 = load i32, i32* %1, align 4
  %35 = icmp slt i32 %34, 512
  br i1 %35, label %36, label %53

; <label>:36:                                     ; preds = %33
  %37 = load i32, i32* %1, align 4
  %38 = sitofp i32 %37 to double
  %39 = fadd double %38, 5.000000e-01
  %40 = fmul double 0x401921FB54442D18, %39
  %41 = fdiv double %40, 1.024000e+03
  %42 = call double @cos(double %41) #2
  %43 = fsub double 1.000000e+00, %42
  %44 = fmul double 5.000000e-01, %43
  %45 = fptrunc double %44 to float
  %46 = load i32, i32* %1, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [512 x float], [512 x float]* @window, i64 0, i64 %47
  store float %45, float* %48, align 4
  br label %49

; <label>:49:                                     ; preds = %36
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_init_fft, i64 0, i64 1)
  %50 = add i64 %pgocount1, 1
  store i64 %50, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_init_fft, i64 0, i64 1)
  %51 = load i32, i32* %1, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %1, align 4
  br label %33

; <label>:53:                                     ; preds = %33
  store i32 0, i32* %1, align 4
  br label %54

; <label>:54:                                     ; preds = %70, %53
  %55 = load i32, i32* %1, align 4
  %56 = icmp slt i32 %55, 128
  br i1 %56, label %57, label %74

; <label>:57:                                     ; preds = %54
  %58 = load i32, i32* %1, align 4
  %59 = sitofp i32 %58 to double
  %60 = fadd double %59, 5.000000e-01
  %61 = fmul double 0x401921FB54442D18, %60
  %62 = fdiv double %61, 2.560000e+02
  %63 = call double @cos(double %62) #2
  %64 = fsub double 1.000000e+00, %63
  %65 = fmul double 5.000000e-01, %64
  %66 = fptrunc double %65 to float
  %67 = load i32, i32* %1, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [128 x float], [128 x float]* @window_s, i64 0, i64 %68
  store float %66, float* %69, align 4
  br label %70

; <label>:70:                                     ; preds = %57
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_init_fft, i64 0, i64 2)
  %71 = add i64 %pgocount2, 1
  store i64 %71, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_init_fft, i64 0, i64 2)
  %72 = load i32, i32* %1, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* %1, align 4
  br label %54

; <label>:74:                                     ; preds = %54
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_init_fft, i64 0, i64 3)
  %75 = add i64 %pgocount3, 1
  store i64 %75, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_init_fft, i64 0, i64 3)
  ret void
}

; Function Attrs: nounwind
declare double @cos(double) #1

; Function Attrs: nounwind
declare double @sin(double) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
