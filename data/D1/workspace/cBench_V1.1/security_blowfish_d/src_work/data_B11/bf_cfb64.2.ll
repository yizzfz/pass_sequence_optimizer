; ModuleID = 'tmp1.ll'
source_filename = "bf_cfb64.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bf_key_st = type { [18 x i64], [1024 x i64] }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_BF_cfb64_encrypt = private constant [16 x i8] c"BF_cfb64_encrypt"
@__profc_BF_cfb64_encrypt = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BF_cfb64_encrypt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2105021569229249656, i64 86441677877, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BF_cfb64_encrypt, i32 0, i32 0), i8* bitcast (void (i8*, i8*, i64, %struct.bf_key_st*, i8*, i32*, i32)* @BF_cfb64_encrypt to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [18 x i8] c"\10\00BF_cfb64_encrypt", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BF_cfb64_encrypt to i8*), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @BF_cfb64_encrypt(i8*, i8*, i64, %struct.bf_key_st*, i8*, i32*, i32) #0 {
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i64, align 8
  %11 = alloca %struct.bf_key_st*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i32*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i32, align 4
  %19 = alloca i64, align 8
  %20 = alloca [2 x i64], align 16
  %21 = alloca i8*, align 8
  %22 = alloca i8, align 1
  %23 = alloca i8, align 1
  store i8* %0, i8** %8, align 8
  store i8* %1, i8** %9, align 8
  store i64 %2, i64* %10, align 8
  store %struct.bf_key_st* %3, %struct.bf_key_st** %11, align 8
  store i8* %4, i8** %12, align 8
  store i32* %5, i32** %13, align 8
  store i32 %6, i32* %14, align 4
  %24 = load i32*, i32** %13, align 8
  %25 = load i32, i32* %24, align 4
  store i32 %25, i32* %18, align 4
  %26 = load i64, i64* %10, align 8
  store i64 %26, i64* %19, align 8
  %27 = load i8*, i8** %12, align 8
  store i8* %27, i8** %21, align 8
  %28 = load i32, i32* %14, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %175

; <label>:30:                                     ; preds = %7
  br label %31

; <label>:31:                                     ; preds = %149, %30
  %32 = load i64, i64* %19, align 8
  %33 = add nsw i64 %32, -1
  store i64 %33, i64* %19, align 8
  %34 = icmp ne i64 %32, 0
  br i1 %34, label %35, label %173

; <label>:35:                                     ; preds = %31
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BF_cfb64_encrypt, i64 0, i64 0)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BF_cfb64_encrypt, i64 0, i64 0)
  %37 = load i32, i32* %18, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %149

; <label>:39:                                     ; preds = %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BF_cfb64_encrypt, i64 0, i64 2)
  %40 = add i64 %pgocount1, 1
  store i64 %40, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BF_cfb64_encrypt, i64 0, i64 2)
  %41 = load i8*, i8** %21, align 8
  %42 = getelementptr inbounds i8, i8* %41, i32 1
  store i8* %42, i8** %21, align 8
  %43 = load i8, i8* %41, align 1
  %44 = zext i8 %43 to i64
  %45 = shl i64 %44, 24
  store i64 %45, i64* %15, align 8
  %46 = load i8*, i8** %21, align 8
  %47 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %47, i8** %21, align 8
  %48 = load i8, i8* %46, align 1
  %49 = zext i8 %48 to i64
  %50 = shl i64 %49, 16
  %51 = load i64, i64* %15, align 8
  %52 = or i64 %51, %50
  store i64 %52, i64* %15, align 8
  %53 = load i8*, i8** %21, align 8
  %54 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %54, i8** %21, align 8
  %55 = load i8, i8* %53, align 1
  %56 = zext i8 %55 to i64
  %57 = shl i64 %56, 8
  %58 = load i64, i64* %15, align 8
  %59 = or i64 %58, %57
  store i64 %59, i64* %15, align 8
  %60 = load i8*, i8** %21, align 8
  %61 = getelementptr inbounds i8, i8* %60, i32 1
  store i8* %61, i8** %21, align 8
  %62 = load i8, i8* %60, align 1
  %63 = zext i8 %62 to i64
  %64 = load i64, i64* %15, align 8
  %65 = or i64 %64, %63
  store i64 %65, i64* %15, align 8
  %66 = load i64, i64* %15, align 8
  %67 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 0
  store i64 %66, i64* %67, align 16
  %68 = load i8*, i8** %21, align 8
  %69 = getelementptr inbounds i8, i8* %68, i32 1
  store i8* %69, i8** %21, align 8
  %70 = load i8, i8* %68, align 1
  %71 = zext i8 %70 to i64
  %72 = shl i64 %71, 24
  store i64 %72, i64* %16, align 8
  %73 = load i8*, i8** %21, align 8
  %74 = getelementptr inbounds i8, i8* %73, i32 1
  store i8* %74, i8** %21, align 8
  %75 = load i8, i8* %73, align 1
  %76 = zext i8 %75 to i64
  %77 = shl i64 %76, 16
  %78 = load i64, i64* %16, align 8
  %79 = or i64 %78, %77
  store i64 %79, i64* %16, align 8
  %80 = load i8*, i8** %21, align 8
  %81 = getelementptr inbounds i8, i8* %80, i32 1
  store i8* %81, i8** %21, align 8
  %82 = load i8, i8* %80, align 1
  %83 = zext i8 %82 to i64
  %84 = shl i64 %83, 8
  %85 = load i64, i64* %16, align 8
  %86 = or i64 %85, %84
  store i64 %86, i64* %16, align 8
  %87 = load i8*, i8** %21, align 8
  %88 = getelementptr inbounds i8, i8* %87, i32 1
  store i8* %88, i8** %21, align 8
  %89 = load i8, i8* %87, align 1
  %90 = zext i8 %89 to i64
  %91 = load i64, i64* %16, align 8
  %92 = or i64 %91, %90
  store i64 %92, i64* %16, align 8
  %93 = load i64, i64* %16, align 8
  %94 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 1
  store i64 %93, i64* %94, align 8
  %95 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i32 0, i32 0
  %96 = load %struct.bf_key_st*, %struct.bf_key_st** %11, align 8
  call void @BF_encrypt(i64* %95, %struct.bf_key_st* %96, i32 1)
  %97 = load i8*, i8** %12, align 8
  store i8* %97, i8** %21, align 8
  %98 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 0
  %99 = load i64, i64* %98, align 16
  store i64 %99, i64* %17, align 8
  %100 = load i64, i64* %17, align 8
  %101 = lshr i64 %100, 24
  %102 = and i64 %101, 255
  %103 = trunc i64 %102 to i8
  %104 = load i8*, i8** %21, align 8
  %105 = getelementptr inbounds i8, i8* %104, i32 1
  store i8* %105, i8** %21, align 8
  store i8 %103, i8* %104, align 1
  %106 = load i64, i64* %17, align 8
  %107 = lshr i64 %106, 16
  %108 = and i64 %107, 255
  %109 = trunc i64 %108 to i8
  %110 = load i8*, i8** %21, align 8
  %111 = getelementptr inbounds i8, i8* %110, i32 1
  store i8* %111, i8** %21, align 8
  store i8 %109, i8* %110, align 1
  %112 = load i64, i64* %17, align 8
  %113 = lshr i64 %112, 8
  %114 = and i64 %113, 255
  %115 = trunc i64 %114 to i8
  %116 = load i8*, i8** %21, align 8
  %117 = getelementptr inbounds i8, i8* %116, i32 1
  store i8* %117, i8** %21, align 8
  store i8 %115, i8* %116, align 1
  %118 = load i64, i64* %17, align 8
  %119 = and i64 %118, 255
  %120 = trunc i64 %119 to i8
  %121 = load i8*, i8** %21, align 8
  %122 = getelementptr inbounds i8, i8* %121, i32 1
  store i8* %122, i8** %21, align 8
  store i8 %120, i8* %121, align 1
  %123 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 1
  %124 = load i64, i64* %123, align 8
  store i64 %124, i64* %17, align 8
  %125 = load i64, i64* %17, align 8
  %126 = lshr i64 %125, 24
  %127 = and i64 %126, 255
  %128 = trunc i64 %127 to i8
  %129 = load i8*, i8** %21, align 8
  %130 = getelementptr inbounds i8, i8* %129, i32 1
  store i8* %130, i8** %21, align 8
  store i8 %128, i8* %129, align 1
  %131 = load i64, i64* %17, align 8
  %132 = lshr i64 %131, 16
  %133 = and i64 %132, 255
  %134 = trunc i64 %133 to i8
  %135 = load i8*, i8** %21, align 8
  %136 = getelementptr inbounds i8, i8* %135, i32 1
  store i8* %136, i8** %21, align 8
  store i8 %134, i8* %135, align 1
  %137 = load i64, i64* %17, align 8
  %138 = lshr i64 %137, 8
  %139 = and i64 %138, 255
  %140 = trunc i64 %139 to i8
  %141 = load i8*, i8** %21, align 8
  %142 = getelementptr inbounds i8, i8* %141, i32 1
  store i8* %142, i8** %21, align 8
  store i8 %140, i8* %141, align 1
  %143 = load i64, i64* %17, align 8
  %144 = and i64 %143, 255
  %145 = trunc i64 %144 to i8
  %146 = load i8*, i8** %21, align 8
  %147 = getelementptr inbounds i8, i8* %146, i32 1
  store i8* %147, i8** %21, align 8
  store i8 %145, i8* %146, align 1
  %148 = load i8*, i8** %12, align 8
  store i8* %148, i8** %21, align 8
  br label %149

; <label>:149:                                    ; preds = %39, %35
  %150 = load i8*, i8** %8, align 8
  %151 = getelementptr inbounds i8, i8* %150, i32 1
  store i8* %151, i8** %8, align 8
  %152 = load i8, i8* %150, align 1
  %153 = zext i8 %152 to i32
  %154 = load i8*, i8** %21, align 8
  %155 = load i32, i32* %18, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i8, i8* %154, i64 %156
  %158 = load i8, i8* %157, align 1
  %159 = zext i8 %158 to i32
  %160 = xor i32 %153, %159
  %161 = trunc i32 %160 to i8
  store i8 %161, i8* %22, align 1
  %162 = load i8, i8* %22, align 1
  %163 = load i8*, i8** %9, align 8
  %164 = getelementptr inbounds i8, i8* %163, i32 1
  store i8* %164, i8** %9, align 8
  store i8 %162, i8* %163, align 1
  %165 = load i8, i8* %22, align 1
  %166 = load i8*, i8** %21, align 8
  %167 = load i32, i32* %18, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i8, i8* %166, i64 %168
  store i8 %165, i8* %169, align 1
  %170 = load i32, i32* %18, align 4
  %171 = add nsw i32 %170, 1
  %172 = and i32 %171, 7
  store i32 %172, i32* %18, align 4
  br label %31

; <label>:173:                                    ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BF_cfb64_encrypt, i64 0, i64 4)
  %174 = add i64 %pgocount2, 1
  store i64 %174, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BF_cfb64_encrypt, i64 0, i64 4)
  br label %321

; <label>:175:                                    ; preds = %7
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BF_cfb64_encrypt, i64 0, i64 5)
  %176 = add i64 %pgocount3, 1
  store i64 %176, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BF_cfb64_encrypt, i64 0, i64 5)
  br label %177

; <label>:177:                                    ; preds = %294, %175
  %178 = load i64, i64* %19, align 8
  %179 = add nsw i64 %178, -1
  store i64 %179, i64* %19, align 8
  %180 = icmp ne i64 %178, 0
  br i1 %180, label %181, label %320

; <label>:181:                                    ; preds = %177
  %182 = load i32, i32* %18, align 4
  %183 = icmp eq i32 %182, 0
  br i1 %183, label %184, label %294

; <label>:184:                                    ; preds = %181
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BF_cfb64_encrypt, i64 0, i64 3)
  %185 = add i64 %pgocount4, 1
  store i64 %185, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BF_cfb64_encrypt, i64 0, i64 3)
  %186 = load i8*, i8** %21, align 8
  %187 = getelementptr inbounds i8, i8* %186, i32 1
  store i8* %187, i8** %21, align 8
  %188 = load i8, i8* %186, align 1
  %189 = zext i8 %188 to i64
  %190 = shl i64 %189, 24
  store i64 %190, i64* %15, align 8
  %191 = load i8*, i8** %21, align 8
  %192 = getelementptr inbounds i8, i8* %191, i32 1
  store i8* %192, i8** %21, align 8
  %193 = load i8, i8* %191, align 1
  %194 = zext i8 %193 to i64
  %195 = shl i64 %194, 16
  %196 = load i64, i64* %15, align 8
  %197 = or i64 %196, %195
  store i64 %197, i64* %15, align 8
  %198 = load i8*, i8** %21, align 8
  %199 = getelementptr inbounds i8, i8* %198, i32 1
  store i8* %199, i8** %21, align 8
  %200 = load i8, i8* %198, align 1
  %201 = zext i8 %200 to i64
  %202 = shl i64 %201, 8
  %203 = load i64, i64* %15, align 8
  %204 = or i64 %203, %202
  store i64 %204, i64* %15, align 8
  %205 = load i8*, i8** %21, align 8
  %206 = getelementptr inbounds i8, i8* %205, i32 1
  store i8* %206, i8** %21, align 8
  %207 = load i8, i8* %205, align 1
  %208 = zext i8 %207 to i64
  %209 = load i64, i64* %15, align 8
  %210 = or i64 %209, %208
  store i64 %210, i64* %15, align 8
  %211 = load i64, i64* %15, align 8
  %212 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 0
  store i64 %211, i64* %212, align 16
  %213 = load i8*, i8** %21, align 8
  %214 = getelementptr inbounds i8, i8* %213, i32 1
  store i8* %214, i8** %21, align 8
  %215 = load i8, i8* %213, align 1
  %216 = zext i8 %215 to i64
  %217 = shl i64 %216, 24
  store i64 %217, i64* %16, align 8
  %218 = load i8*, i8** %21, align 8
  %219 = getelementptr inbounds i8, i8* %218, i32 1
  store i8* %219, i8** %21, align 8
  %220 = load i8, i8* %218, align 1
  %221 = zext i8 %220 to i64
  %222 = shl i64 %221, 16
  %223 = load i64, i64* %16, align 8
  %224 = or i64 %223, %222
  store i64 %224, i64* %16, align 8
  %225 = load i8*, i8** %21, align 8
  %226 = getelementptr inbounds i8, i8* %225, i32 1
  store i8* %226, i8** %21, align 8
  %227 = load i8, i8* %225, align 1
  %228 = zext i8 %227 to i64
  %229 = shl i64 %228, 8
  %230 = load i64, i64* %16, align 8
  %231 = or i64 %230, %229
  store i64 %231, i64* %16, align 8
  %232 = load i8*, i8** %21, align 8
  %233 = getelementptr inbounds i8, i8* %232, i32 1
  store i8* %233, i8** %21, align 8
  %234 = load i8, i8* %232, align 1
  %235 = zext i8 %234 to i64
  %236 = load i64, i64* %16, align 8
  %237 = or i64 %236, %235
  store i64 %237, i64* %16, align 8
  %238 = load i64, i64* %16, align 8
  %239 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 1
  store i64 %238, i64* %239, align 8
  %240 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i32 0, i32 0
  %241 = load %struct.bf_key_st*, %struct.bf_key_st** %11, align 8
  call void @BF_encrypt(i64* %240, %struct.bf_key_st* %241, i32 1)
  %242 = load i8*, i8** %12, align 8
  store i8* %242, i8** %21, align 8
  %243 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 0
  %244 = load i64, i64* %243, align 16
  store i64 %244, i64* %17, align 8
  %245 = load i64, i64* %17, align 8
  %246 = lshr i64 %245, 24
  %247 = and i64 %246, 255
  %248 = trunc i64 %247 to i8
  %249 = load i8*, i8** %21, align 8
  %250 = getelementptr inbounds i8, i8* %249, i32 1
  store i8* %250, i8** %21, align 8
  store i8 %248, i8* %249, align 1
  %251 = load i64, i64* %17, align 8
  %252 = lshr i64 %251, 16
  %253 = and i64 %252, 255
  %254 = trunc i64 %253 to i8
  %255 = load i8*, i8** %21, align 8
  %256 = getelementptr inbounds i8, i8* %255, i32 1
  store i8* %256, i8** %21, align 8
  store i8 %254, i8* %255, align 1
  %257 = load i64, i64* %17, align 8
  %258 = lshr i64 %257, 8
  %259 = and i64 %258, 255
  %260 = trunc i64 %259 to i8
  %261 = load i8*, i8** %21, align 8
  %262 = getelementptr inbounds i8, i8* %261, i32 1
  store i8* %262, i8** %21, align 8
  store i8 %260, i8* %261, align 1
  %263 = load i64, i64* %17, align 8
  %264 = and i64 %263, 255
  %265 = trunc i64 %264 to i8
  %266 = load i8*, i8** %21, align 8
  %267 = getelementptr inbounds i8, i8* %266, i32 1
  store i8* %267, i8** %21, align 8
  store i8 %265, i8* %266, align 1
  %268 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 1
  %269 = load i64, i64* %268, align 8
  store i64 %269, i64* %17, align 8
  %270 = load i64, i64* %17, align 8
  %271 = lshr i64 %270, 24
  %272 = and i64 %271, 255
  %273 = trunc i64 %272 to i8
  %274 = load i8*, i8** %21, align 8
  %275 = getelementptr inbounds i8, i8* %274, i32 1
  store i8* %275, i8** %21, align 8
  store i8 %273, i8* %274, align 1
  %276 = load i64, i64* %17, align 8
  %277 = lshr i64 %276, 16
  %278 = and i64 %277, 255
  %279 = trunc i64 %278 to i8
  %280 = load i8*, i8** %21, align 8
  %281 = getelementptr inbounds i8, i8* %280, i32 1
  store i8* %281, i8** %21, align 8
  store i8 %279, i8* %280, align 1
  %282 = load i64, i64* %17, align 8
  %283 = lshr i64 %282, 8
  %284 = and i64 %283, 255
  %285 = trunc i64 %284 to i8
  %286 = load i8*, i8** %21, align 8
  %287 = getelementptr inbounds i8, i8* %286, i32 1
  store i8* %287, i8** %21, align 8
  store i8 %285, i8* %286, align 1
  %288 = load i64, i64* %17, align 8
  %289 = and i64 %288, 255
  %290 = trunc i64 %289 to i8
  %291 = load i8*, i8** %21, align 8
  %292 = getelementptr inbounds i8, i8* %291, i32 1
  store i8* %292, i8** %21, align 8
  store i8 %290, i8* %291, align 1
  %293 = load i8*, i8** %12, align 8
  store i8* %293, i8** %21, align 8
  br label %294

; <label>:294:                                    ; preds = %184, %181
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BF_cfb64_encrypt, i64 0, i64 1)
  %295 = add i64 %pgocount5, 1
  store i64 %295, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BF_cfb64_encrypt, i64 0, i64 1)
  %296 = load i8*, i8** %8, align 8
  %297 = getelementptr inbounds i8, i8* %296, i32 1
  store i8* %297, i8** %8, align 8
  %298 = load i8, i8* %296, align 1
  store i8 %298, i8* %23, align 1
  %299 = load i8*, i8** %21, align 8
  %300 = load i32, i32* %18, align 4
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds i8, i8* %299, i64 %301
  %303 = load i8, i8* %302, align 1
  store i8 %303, i8* %22, align 1
  %304 = load i8, i8* %23, align 1
  %305 = load i8*, i8** %21, align 8
  %306 = load i32, i32* %18, align 4
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds i8, i8* %305, i64 %307
  store i8 %304, i8* %308, align 1
  %309 = load i8, i8* %22, align 1
  %310 = zext i8 %309 to i32
  %311 = load i8, i8* %23, align 1
  %312 = zext i8 %311 to i32
  %313 = xor i32 %310, %312
  %314 = trunc i32 %313 to i8
  %315 = load i8*, i8** %9, align 8
  %316 = getelementptr inbounds i8, i8* %315, i32 1
  store i8* %316, i8** %9, align 8
  store i8 %314, i8* %315, align 1
  %317 = load i32, i32* %18, align 4
  %318 = add nsw i32 %317, 1
  %319 = and i32 %318, 7
  store i32 %319, i32* %18, align 4
  br label %177

; <label>:320:                                    ; preds = %177
  br label %321

; <label>:321:                                    ; preds = %320, %173
  store i8 0, i8* %23, align 1
  store i8 0, i8* %22, align 1
  store i64 0, i64* %17, align 8
  %322 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 1
  store i64 0, i64* %322, align 8
  %323 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 0
  store i64 0, i64* %323, align 16
  store i64 0, i64* %16, align 8
  store i64 0, i64* %15, align 8
  %324 = load i32, i32* %18, align 4
  %325 = load i32*, i32** %13, align 8
  store i32 %324, i32* %325, align 4
  ret void
}

declare void @BF_encrypt(i64*, %struct.bf_key_st*, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
