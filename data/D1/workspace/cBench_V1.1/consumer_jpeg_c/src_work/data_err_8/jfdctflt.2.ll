; ModuleID = 'tmp1.ll'
source_filename = "jfdctflt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_fdct_float = private constant [15 x i8] c"jpeg_fdct_float"
@__profc_jpeg_fdct_float = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_fdct_float = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4097069448440758658, i64 52028904346, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_float, i32 0, i32 0), i8* bitcast (void (float*)* @jpeg_fdct_float to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [17 x i8] c"\0F\00jpeg_fdct_float", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_fdct_float to i8*), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jpeg_fdct_float(float*) #0 {
  %2 = alloca float*, align 8
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca float, align 4
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
  %22 = alloca float*, align 8
  %23 = alloca i32, align 4
  store float* %0, float** %2, align 8
  %24 = load float*, float** %2, align 8
  store float* %24, float** %22, align 8
  store i32 7, i32* %23, align 4
  br label %25

; <label>:25:                                     ; preds = %172, %1
  %26 = load i32, i32* %23, align 4
  %27 = icmp sge i32 %26, 0
  br i1 %27, label %28, label %176

; <label>:28:                                     ; preds = %25
  %29 = load float*, float** %22, align 8
  %30 = getelementptr inbounds float, float* %29, i64 0
  %31 = load float, float* %30, align 4
  %32 = load float*, float** %22, align 8
  %33 = getelementptr inbounds float, float* %32, i64 7
  %34 = load float, float* %33, align 4
  %35 = fadd float %31, %34
  store float %35, float* %3, align 4
  %36 = load float*, float** %22, align 8
  %37 = getelementptr inbounds float, float* %36, i64 0
  %38 = load float, float* %37, align 4
  %39 = load float*, float** %22, align 8
  %40 = getelementptr inbounds float, float* %39, i64 7
  %41 = load float, float* %40, align 4
  %42 = fsub float %38, %41
  store float %42, float* %10, align 4
  %43 = load float*, float** %22, align 8
  %44 = getelementptr inbounds float, float* %43, i64 1
  %45 = load float, float* %44, align 4
  %46 = load float*, float** %22, align 8
  %47 = getelementptr inbounds float, float* %46, i64 6
  %48 = load float, float* %47, align 4
  %49 = fadd float %45, %48
  store float %49, float* %4, align 4
  %50 = load float*, float** %22, align 8
  %51 = getelementptr inbounds float, float* %50, i64 1
  %52 = load float, float* %51, align 4
  %53 = load float*, float** %22, align 8
  %54 = getelementptr inbounds float, float* %53, i64 6
  %55 = load float, float* %54, align 4
  %56 = fsub float %52, %55
  store float %56, float* %9, align 4
  %57 = load float*, float** %22, align 8
  %58 = getelementptr inbounds float, float* %57, i64 2
  %59 = load float, float* %58, align 4
  %60 = load float*, float** %22, align 8
  %61 = getelementptr inbounds float, float* %60, i64 5
  %62 = load float, float* %61, align 4
  %63 = fadd float %59, %62
  store float %63, float* %5, align 4
  %64 = load float*, float** %22, align 8
  %65 = getelementptr inbounds float, float* %64, i64 2
  %66 = load float, float* %65, align 4
  %67 = load float*, float** %22, align 8
  %68 = getelementptr inbounds float, float* %67, i64 5
  %69 = load float, float* %68, align 4
  %70 = fsub float %66, %69
  store float %70, float* %8, align 4
  %71 = load float*, float** %22, align 8
  %72 = getelementptr inbounds float, float* %71, i64 3
  %73 = load float, float* %72, align 4
  %74 = load float*, float** %22, align 8
  %75 = getelementptr inbounds float, float* %74, i64 4
  %76 = load float, float* %75, align 4
  %77 = fadd float %73, %76
  store float %77, float* %6, align 4
  %78 = load float*, float** %22, align 8
  %79 = getelementptr inbounds float, float* %78, i64 3
  %80 = load float, float* %79, align 4
  %81 = load float*, float** %22, align 8
  %82 = getelementptr inbounds float, float* %81, i64 4
  %83 = load float, float* %82, align 4
  %84 = fsub float %80, %83
  store float %84, float* %7, align 4
  %85 = load float, float* %3, align 4
  %86 = load float, float* %6, align 4
  %87 = fadd float %85, %86
  store float %87, float* %11, align 4
  %88 = load float, float* %3, align 4
  %89 = load float, float* %6, align 4
  %90 = fsub float %88, %89
  store float %90, float* %14, align 4
  %91 = load float, float* %4, align 4
  %92 = load float, float* %5, align 4
  %93 = fadd float %91, %92
  store float %93, float* %12, align 4
  %94 = load float, float* %4, align 4
  %95 = load float, float* %5, align 4
  %96 = fsub float %94, %95
  store float %96, float* %13, align 4
  %97 = load float, float* %11, align 4
  %98 = load float, float* %12, align 4
  %99 = fadd float %97, %98
  %100 = load float*, float** %22, align 8
  %101 = getelementptr inbounds float, float* %100, i64 0
  store float %99, float* %101, align 4
  %102 = load float, float* %11, align 4
  %103 = load float, float* %12, align 4
  %104 = fsub float %102, %103
  %105 = load float*, float** %22, align 8
  %106 = getelementptr inbounds float, float* %105, i64 4
  store float %104, float* %106, align 4
  %107 = load float, float* %13, align 4
  %108 = load float, float* %14, align 4
  %109 = fadd float %107, %108
  %110 = fmul float %109, 0x3FE6A09E60000000
  store float %110, float* %15, align 4
  %111 = load float, float* %14, align 4
  %112 = load float, float* %15, align 4
  %113 = fadd float %111, %112
  %114 = load float*, float** %22, align 8
  %115 = getelementptr inbounds float, float* %114, i64 2
  store float %113, float* %115, align 4
  %116 = load float, float* %14, align 4
  %117 = load float, float* %15, align 4
  %118 = fsub float %116, %117
  %119 = load float*, float** %22, align 8
  %120 = getelementptr inbounds float, float* %119, i64 6
  store float %118, float* %120, align 4
  %121 = load float, float* %7, align 4
  %122 = load float, float* %8, align 4
  %123 = fadd float %121, %122
  store float %123, float* %11, align 4
  %124 = load float, float* %8, align 4
  %125 = load float, float* %9, align 4
  %126 = fadd float %124, %125
  store float %126, float* %12, align 4
  %127 = load float, float* %9, align 4
  %128 = load float, float* %10, align 4
  %129 = fadd float %127, %128
  store float %129, float* %13, align 4
  %130 = load float, float* %11, align 4
  %131 = load float, float* %13, align 4
  %132 = fsub float %130, %131
  %133 = fmul float %132, 0x3FD87DE2A0000000
  store float %133, float* %19, align 4
  %134 = load float, float* %11, align 4
  %135 = fmul float 0x3FE1517A80000000, %134
  %136 = load float, float* %19, align 4
  %137 = fadd float %135, %136
  store float %137, float* %16, align 4
  %138 = load float, float* %13, align 4
  %139 = fmul float 0x3FF4E7AEA0000000, %138
  %140 = load float, float* %19, align 4
  %141 = fadd float %139, %140
  store float %141, float* %18, align 4
  %142 = load float, float* %12, align 4
  %143 = fmul float %142, 0x3FE6A09E60000000
  store float %143, float* %17, align 4
  %144 = load float, float* %10, align 4
  %145 = load float, float* %17, align 4
  %146 = fadd float %144, %145
  store float %146, float* %20, align 4
  %147 = load float, float* %10, align 4
  %148 = load float, float* %17, align 4
  %149 = fsub float %147, %148
  store float %149, float* %21, align 4
  %150 = load float, float* %21, align 4
  %151 = load float, float* %16, align 4
  %152 = fadd float %150, %151
  %153 = load float*, float** %22, align 8
  %154 = getelementptr inbounds float, float* %153, i64 5
  store float %152, float* %154, align 4
  %155 = load float, float* %21, align 4
  %156 = load float, float* %16, align 4
  %157 = fsub float %155, %156
  %158 = load float*, float** %22, align 8
  %159 = getelementptr inbounds float, float* %158, i64 3
  store float %157, float* %159, align 4
  %160 = load float, float* %20, align 4
  %161 = load float, float* %18, align 4
  %162 = fadd float %160, %161
  %163 = load float*, float** %22, align 8
  %164 = getelementptr inbounds float, float* %163, i64 1
  store float %162, float* %164, align 4
  %165 = load float, float* %20, align 4
  %166 = load float, float* %18, align 4
  %167 = fsub float %165, %166
  %168 = load float*, float** %22, align 8
  %169 = getelementptr inbounds float, float* %168, i64 7
  store float %167, float* %169, align 4
  %170 = load float*, float** %22, align 8
  %171 = getelementptr inbounds float, float* %170, i64 8
  store float* %171, float** %22, align 8
  br label %172

; <label>:172:                                    ; preds = %28
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_float, i64 0, i64 0)
  %173 = add i64 %pgocount, 1
  store i64 %173, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_float, i64 0, i64 0)
  %174 = load i32, i32* %23, align 4
  %175 = add nsw i32 %174, -1
  store i32 %175, i32* %23, align 4
  br label %25

; <label>:176:                                    ; preds = %25
  %177 = load float*, float** %2, align 8
  store float* %177, float** %22, align 8
  store i32 7, i32* %23, align 4
  br label %178

; <label>:178:                                    ; preds = %325, %176
  %179 = load i32, i32* %23, align 4
  %180 = icmp sge i32 %179, 0
  br i1 %180, label %181, label %329

; <label>:181:                                    ; preds = %178
  %182 = load float*, float** %22, align 8
  %183 = getelementptr inbounds float, float* %182, i64 0
  %184 = load float, float* %183, align 4
  %185 = load float*, float** %22, align 8
  %186 = getelementptr inbounds float, float* %185, i64 56
  %187 = load float, float* %186, align 4
  %188 = fadd float %184, %187
  store float %188, float* %3, align 4
  %189 = load float*, float** %22, align 8
  %190 = getelementptr inbounds float, float* %189, i64 0
  %191 = load float, float* %190, align 4
  %192 = load float*, float** %22, align 8
  %193 = getelementptr inbounds float, float* %192, i64 56
  %194 = load float, float* %193, align 4
  %195 = fsub float %191, %194
  store float %195, float* %10, align 4
  %196 = load float*, float** %22, align 8
  %197 = getelementptr inbounds float, float* %196, i64 8
  %198 = load float, float* %197, align 4
  %199 = load float*, float** %22, align 8
  %200 = getelementptr inbounds float, float* %199, i64 48
  %201 = load float, float* %200, align 4
  %202 = fadd float %198, %201
  store float %202, float* %4, align 4
  %203 = load float*, float** %22, align 8
  %204 = getelementptr inbounds float, float* %203, i64 8
  %205 = load float, float* %204, align 4
  %206 = load float*, float** %22, align 8
  %207 = getelementptr inbounds float, float* %206, i64 48
  %208 = load float, float* %207, align 4
  %209 = fsub float %205, %208
  store float %209, float* %9, align 4
  %210 = load float*, float** %22, align 8
  %211 = getelementptr inbounds float, float* %210, i64 16
  %212 = load float, float* %211, align 4
  %213 = load float*, float** %22, align 8
  %214 = getelementptr inbounds float, float* %213, i64 40
  %215 = load float, float* %214, align 4
  %216 = fadd float %212, %215
  store float %216, float* %5, align 4
  %217 = load float*, float** %22, align 8
  %218 = getelementptr inbounds float, float* %217, i64 16
  %219 = load float, float* %218, align 4
  %220 = load float*, float** %22, align 8
  %221 = getelementptr inbounds float, float* %220, i64 40
  %222 = load float, float* %221, align 4
  %223 = fsub float %219, %222
  store float %223, float* %8, align 4
  %224 = load float*, float** %22, align 8
  %225 = getelementptr inbounds float, float* %224, i64 24
  %226 = load float, float* %225, align 4
  %227 = load float*, float** %22, align 8
  %228 = getelementptr inbounds float, float* %227, i64 32
  %229 = load float, float* %228, align 4
  %230 = fadd float %226, %229
  store float %230, float* %6, align 4
  %231 = load float*, float** %22, align 8
  %232 = getelementptr inbounds float, float* %231, i64 24
  %233 = load float, float* %232, align 4
  %234 = load float*, float** %22, align 8
  %235 = getelementptr inbounds float, float* %234, i64 32
  %236 = load float, float* %235, align 4
  %237 = fsub float %233, %236
  store float %237, float* %7, align 4
  %238 = load float, float* %3, align 4
  %239 = load float, float* %6, align 4
  %240 = fadd float %238, %239
  store float %240, float* %11, align 4
  %241 = load float, float* %3, align 4
  %242 = load float, float* %6, align 4
  %243 = fsub float %241, %242
  store float %243, float* %14, align 4
  %244 = load float, float* %4, align 4
  %245 = load float, float* %5, align 4
  %246 = fadd float %244, %245
  store float %246, float* %12, align 4
  %247 = load float, float* %4, align 4
  %248 = load float, float* %5, align 4
  %249 = fsub float %247, %248
  store float %249, float* %13, align 4
  %250 = load float, float* %11, align 4
  %251 = load float, float* %12, align 4
  %252 = fadd float %250, %251
  %253 = load float*, float** %22, align 8
  %254 = getelementptr inbounds float, float* %253, i64 0
  store float %252, float* %254, align 4
  %255 = load float, float* %11, align 4
  %256 = load float, float* %12, align 4
  %257 = fsub float %255, %256
  %258 = load float*, float** %22, align 8
  %259 = getelementptr inbounds float, float* %258, i64 32
  store float %257, float* %259, align 4
  %260 = load float, float* %13, align 4
  %261 = load float, float* %14, align 4
  %262 = fadd float %260, %261
  %263 = fmul float %262, 0x3FE6A09E60000000
  store float %263, float* %15, align 4
  %264 = load float, float* %14, align 4
  %265 = load float, float* %15, align 4
  %266 = fadd float %264, %265
  %267 = load float*, float** %22, align 8
  %268 = getelementptr inbounds float, float* %267, i64 16
  store float %266, float* %268, align 4
  %269 = load float, float* %14, align 4
  %270 = load float, float* %15, align 4
  %271 = fsub float %269, %270
  %272 = load float*, float** %22, align 8
  %273 = getelementptr inbounds float, float* %272, i64 48
  store float %271, float* %273, align 4
  %274 = load float, float* %7, align 4
  %275 = load float, float* %8, align 4
  %276 = fadd float %274, %275
  store float %276, float* %11, align 4
  %277 = load float, float* %8, align 4
  %278 = load float, float* %9, align 4
  %279 = fadd float %277, %278
  store float %279, float* %12, align 4
  %280 = load float, float* %9, align 4
  %281 = load float, float* %10, align 4
  %282 = fadd float %280, %281
  store float %282, float* %13, align 4
  %283 = load float, float* %11, align 4
  %284 = load float, float* %13, align 4
  %285 = fsub float %283, %284
  %286 = fmul float %285, 0x3FD87DE2A0000000
  store float %286, float* %19, align 4
  %287 = load float, float* %11, align 4
  %288 = fmul float 0x3FE1517A80000000, %287
  %289 = load float, float* %19, align 4
  %290 = fadd float %288, %289
  store float %290, float* %16, align 4
  %291 = load float, float* %13, align 4
  %292 = fmul float 0x3FF4E7AEA0000000, %291
  %293 = load float, float* %19, align 4
  %294 = fadd float %292, %293
  store float %294, float* %18, align 4
  %295 = load float, float* %12, align 4
  %296 = fmul float %295, 0x3FE6A09E60000000
  store float %296, float* %17, align 4
  %297 = load float, float* %10, align 4
  %298 = load float, float* %17, align 4
  %299 = fadd float %297, %298
  store float %299, float* %20, align 4
  %300 = load float, float* %10, align 4
  %301 = load float, float* %17, align 4
  %302 = fsub float %300, %301
  store float %302, float* %21, align 4
  %303 = load float, float* %21, align 4
  %304 = load float, float* %16, align 4
  %305 = fadd float %303, %304
  %306 = load float*, float** %22, align 8
  %307 = getelementptr inbounds float, float* %306, i64 40
  store float %305, float* %307, align 4
  %308 = load float, float* %21, align 4
  %309 = load float, float* %16, align 4
  %310 = fsub float %308, %309
  %311 = load float*, float** %22, align 8
  %312 = getelementptr inbounds float, float* %311, i64 24
  store float %310, float* %312, align 4
  %313 = load float, float* %20, align 4
  %314 = load float, float* %18, align 4
  %315 = fadd float %313, %314
  %316 = load float*, float** %22, align 8
  %317 = getelementptr inbounds float, float* %316, i64 8
  store float %315, float* %317, align 4
  %318 = load float, float* %20, align 4
  %319 = load float, float* %18, align 4
  %320 = fsub float %318, %319
  %321 = load float*, float** %22, align 8
  %322 = getelementptr inbounds float, float* %321, i64 56
  store float %320, float* %322, align 4
  %323 = load float*, float** %22, align 8
  %324 = getelementptr inbounds float, float* %323, i32 1
  store float* %324, float** %22, align 8
  br label %325

; <label>:325:                                    ; preds = %181
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_float, i64 0, i64 1)
  %326 = add i64 %pgocount1, 1
  store i64 %326, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_float, i64 0, i64 1)
  %327 = load i32, i32* %23, align 4
  %328 = add nsw i32 %327, -1
  store i32 %328, i32* %23, align 4
  br label %178

; <label>:329:                                    ; preds = %178
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_float, i64 0, i64 2)
  %330 = add i64 %pgocount2, 1
  store i64 %330, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_fdct_float, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
