; ModuleID = 'bf_ofb64.2.ll'
source_filename = "bf_ofb64.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bf_key_st = type { [18 x i64], [1024 x i64] }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_BF_ofb64_encrypt = private constant [16 x i8] c"BF_ofb64_encrypt"
@__profc_BF_ofb64_encrypt = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BF_ofb64_encrypt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6563476836429874829, i64 52891531279, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BF_ofb64_encrypt, i32 0, i32 0), i8* bitcast (void (i8*, i8*, i64, %struct.bf_key_st*, i8*, i32*)* @BF_ofb64_encrypt to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [26 x i8] c"\10\18x\DAsr\8B\CFOK23\89O\CDK.\AA,(\01\00.\D2\05\ED", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BF_ofb64_encrypt to i8*), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @BF_ofb64_encrypt(i8*, i8*, i64, %struct.bf_key_st*, i8*, i32*) #0 {
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64, align 8
  %10 = alloca %struct.bf_key_st*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32*, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i32, align 4
  %17 = alloca i64, align 8
  %18 = alloca [8 x i8], align 1
  %19 = alloca i8*, align 8
  %20 = alloca [2 x i64], align 16
  %21 = alloca i8*, align 8
  %22 = alloca i32, align 4
  store i8* %0, i8** %7, align 8
  store i8* %1, i8** %8, align 8
  store i64 %2, i64* %9, align 8
  store %struct.bf_key_st* %3, %struct.bf_key_st** %10, align 8
  store i8* %4, i8** %11, align 8
  store i32* %5, i32** %12, align 8
  %23 = load i32*, i32** %12, align 8
  %24 = load i32, i32* %23, align 4
  store i32 %24, i32* %16, align 4
  %25 = load i64, i64* %9, align 8
  store i64 %25, i64* %17, align 8
  store i32 0, i32* %22, align 4
  %26 = load i8*, i8** %11, align 8
  store i8* %26, i8** %21, align 8
  %27 = load i8*, i8** %21, align 8
  %28 = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %28, i8** %21, align 8
  %29 = load i8, i8* %27, align 1
  %30 = zext i8 %29 to i64
  %31 = shl i64 %30, 24
  store i64 %31, i64* %13, align 8
  %32 = load i8*, i8** %21, align 8
  %33 = getelementptr inbounds i8, i8* %32, i32 1
  store i8* %33, i8** %21, align 8
  %34 = load i8, i8* %32, align 1
  %35 = zext i8 %34 to i64
  %36 = shl i64 %35, 16
  %37 = load i64, i64* %13, align 8
  %38 = or i64 %37, %36
  store i64 %38, i64* %13, align 8
  %39 = load i8*, i8** %21, align 8
  %40 = getelementptr inbounds i8, i8* %39, i32 1
  store i8* %40, i8** %21, align 8
  %41 = load i8, i8* %39, align 1
  %42 = zext i8 %41 to i64
  %43 = shl i64 %42, 8
  %44 = load i64, i64* %13, align 8
  %45 = or i64 %44, %43
  store i64 %45, i64* %13, align 8
  %46 = load i8*, i8** %21, align 8
  %47 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %47, i8** %21, align 8
  %48 = load i8, i8* %46, align 1
  %49 = zext i8 %48 to i64
  %50 = load i64, i64* %13, align 8
  %51 = or i64 %50, %49
  store i64 %51, i64* %13, align 8
  %52 = load i8*, i8** %21, align 8
  %53 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %53, i8** %21, align 8
  %54 = load i8, i8* %52, align 1
  %55 = zext i8 %54 to i64
  %56 = shl i64 %55, 24
  store i64 %56, i64* %14, align 8
  %57 = load i8*, i8** %21, align 8
  %58 = getelementptr inbounds i8, i8* %57, i32 1
  store i8* %58, i8** %21, align 8
  %59 = load i8, i8* %57, align 1
  %60 = zext i8 %59 to i64
  %61 = shl i64 %60, 16
  %62 = load i64, i64* %14, align 8
  %63 = or i64 %62, %61
  store i64 %63, i64* %14, align 8
  %64 = load i8*, i8** %21, align 8
  %65 = getelementptr inbounds i8, i8* %64, i32 1
  store i8* %65, i8** %21, align 8
  %66 = load i8, i8* %64, align 1
  %67 = zext i8 %66 to i64
  %68 = shl i64 %67, 8
  %69 = load i64, i64* %14, align 8
  %70 = or i64 %69, %68
  store i64 %70, i64* %14, align 8
  %71 = load i8*, i8** %21, align 8
  %72 = getelementptr inbounds i8, i8* %71, i32 1
  store i8* %72, i8** %21, align 8
  %73 = load i8, i8* %71, align 1
  %74 = zext i8 %73 to i64
  %75 = load i64, i64* %14, align 8
  %76 = or i64 %75, %74
  store i64 %76, i64* %14, align 8
  %77 = load i64, i64* %13, align 8
  %78 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 0
  store i64 %77, i64* %78, align 16
  %79 = load i64, i64* %14, align 8
  %80 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 1
  store i64 %79, i64* %80, align 8
  %81 = getelementptr inbounds [8 x i8], [8 x i8]* %18, i32 0, i32 0
  store i8* %81, i8** %19, align 8
  %82 = load i64, i64* %13, align 8
  %83 = lshr i64 %82, 24
  %84 = and i64 %83, 255
  %85 = trunc i64 %84 to i8
  %86 = load i8*, i8** %19, align 8
  %87 = getelementptr inbounds i8, i8* %86, i32 1
  store i8* %87, i8** %19, align 8
  store i8 %85, i8* %86, align 1
  %88 = load i64, i64* %13, align 8
  %89 = lshr i64 %88, 16
  %90 = and i64 %89, 255
  %91 = trunc i64 %90 to i8
  %92 = load i8*, i8** %19, align 8
  %93 = getelementptr inbounds i8, i8* %92, i32 1
  store i8* %93, i8** %19, align 8
  store i8 %91, i8* %92, align 1
  %94 = load i64, i64* %13, align 8
  %95 = lshr i64 %94, 8
  %96 = and i64 %95, 255
  %97 = trunc i64 %96 to i8
  %98 = load i8*, i8** %19, align 8
  %99 = getelementptr inbounds i8, i8* %98, i32 1
  store i8* %99, i8** %19, align 8
  store i8 %97, i8* %98, align 1
  %100 = load i64, i64* %13, align 8
  %101 = and i64 %100, 255
  %102 = trunc i64 %101 to i8
  %103 = load i8*, i8** %19, align 8
  %104 = getelementptr inbounds i8, i8* %103, i32 1
  store i8* %104, i8** %19, align 8
  store i8 %102, i8* %103, align 1
  %105 = load i64, i64* %14, align 8
  %106 = lshr i64 %105, 24
  %107 = and i64 %106, 255
  %108 = trunc i64 %107 to i8
  %109 = load i8*, i8** %19, align 8
  %110 = getelementptr inbounds i8, i8* %109, i32 1
  store i8* %110, i8** %19, align 8
  store i8 %108, i8* %109, align 1
  %111 = load i64, i64* %14, align 8
  %112 = lshr i64 %111, 16
  %113 = and i64 %112, 255
  %114 = trunc i64 %113 to i8
  %115 = load i8*, i8** %19, align 8
  %116 = getelementptr inbounds i8, i8* %115, i32 1
  store i8* %116, i8** %19, align 8
  store i8 %114, i8* %115, align 1
  %117 = load i64, i64* %14, align 8
  %118 = lshr i64 %117, 8
  %119 = and i64 %118, 255
  %120 = trunc i64 %119 to i8
  %121 = load i8*, i8** %19, align 8
  %122 = getelementptr inbounds i8, i8* %121, i32 1
  store i8* %122, i8** %19, align 8
  store i8 %120, i8* %121, align 1
  %123 = load i64, i64* %14, align 8
  %124 = and i64 %123, 255
  %125 = trunc i64 %124 to i8
  %126 = load i8*, i8** %19, align 8
  %127 = getelementptr inbounds i8, i8* %126, i32 1
  store i8* %127, i8** %19, align 8
  store i8 %125, i8* %126, align 1
  br label %128

; <label>:128:                                    ; preds = %192, %6
  %129 = load i64, i64* %17, align 8
  %130 = add nsw i64 %129, -1
  store i64 %130, i64* %17, align 8
  %131 = icmp ne i64 %129, 0
  br i1 %131, label %132, label %210

; <label>:132:                                    ; preds = %128
  %133 = load i32, i32* %16, align 4
  %134 = icmp eq i32 %133, 0
  br i1 %134, label %135, label %192

; <label>:135:                                    ; preds = %132
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BF_ofb64_encrypt, i64 0, i64 1)
  %136 = add i64 %pgocount, 1
  store i64 %136, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BF_ofb64_encrypt, i64 0, i64 1)
  %137 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i32 0, i32 0
  %138 = load %struct.bf_key_st*, %struct.bf_key_st** %10, align 8
  call void @BF_encrypt(i64* %137, %struct.bf_key_st* %138, i32 1)
  %139 = getelementptr inbounds [8 x i8], [8 x i8]* %18, i32 0, i32 0
  store i8* %139, i8** %19, align 8
  %140 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 0
  %141 = load i64, i64* %140, align 16
  store i64 %141, i64* %15, align 8
  %142 = load i64, i64* %15, align 8
  %143 = lshr i64 %142, 24
  %144 = and i64 %143, 255
  %145 = trunc i64 %144 to i8
  %146 = load i8*, i8** %19, align 8
  %147 = getelementptr inbounds i8, i8* %146, i32 1
  store i8* %147, i8** %19, align 8
  store i8 %145, i8* %146, align 1
  %148 = load i64, i64* %15, align 8
  %149 = lshr i64 %148, 16
  %150 = and i64 %149, 255
  %151 = trunc i64 %150 to i8
  %152 = load i8*, i8** %19, align 8
  %153 = getelementptr inbounds i8, i8* %152, i32 1
  store i8* %153, i8** %19, align 8
  store i8 %151, i8* %152, align 1
  %154 = load i64, i64* %15, align 8
  %155 = lshr i64 %154, 8
  %156 = and i64 %155, 255
  %157 = trunc i64 %156 to i8
  %158 = load i8*, i8** %19, align 8
  %159 = getelementptr inbounds i8, i8* %158, i32 1
  store i8* %159, i8** %19, align 8
  store i8 %157, i8* %158, align 1
  %160 = load i64, i64* %15, align 8
  %161 = and i64 %160, 255
  %162 = trunc i64 %161 to i8
  %163 = load i8*, i8** %19, align 8
  %164 = getelementptr inbounds i8, i8* %163, i32 1
  store i8* %164, i8** %19, align 8
  store i8 %162, i8* %163, align 1
  %165 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 1
  %166 = load i64, i64* %165, align 8
  store i64 %166, i64* %15, align 8
  %167 = load i64, i64* %15, align 8
  %168 = lshr i64 %167, 24
  %169 = and i64 %168, 255
  %170 = trunc i64 %169 to i8
  %171 = load i8*, i8** %19, align 8
  %172 = getelementptr inbounds i8, i8* %171, i32 1
  store i8* %172, i8** %19, align 8
  store i8 %170, i8* %171, align 1
  %173 = load i64, i64* %15, align 8
  %174 = lshr i64 %173, 16
  %175 = and i64 %174, 255
  %176 = trunc i64 %175 to i8
  %177 = load i8*, i8** %19, align 8
  %178 = getelementptr inbounds i8, i8* %177, i32 1
  store i8* %178, i8** %19, align 8
  store i8 %176, i8* %177, align 1
  %179 = load i64, i64* %15, align 8
  %180 = lshr i64 %179, 8
  %181 = and i64 %180, 255
  %182 = trunc i64 %181 to i8
  %183 = load i8*, i8** %19, align 8
  %184 = getelementptr inbounds i8, i8* %183, i32 1
  store i8* %184, i8** %19, align 8
  store i8 %182, i8* %183, align 1
  %185 = load i64, i64* %15, align 8
  %186 = and i64 %185, 255
  %187 = trunc i64 %186 to i8
  %188 = load i8*, i8** %19, align 8
  %189 = getelementptr inbounds i8, i8* %188, i32 1
  store i8* %189, i8** %19, align 8
  store i8 %187, i8* %188, align 1
  %190 = load i32, i32* %22, align 4
  %191 = add nsw i32 %190, 1
  store i32 %191, i32* %22, align 4
  br label %192

; <label>:192:                                    ; preds = %135, %132
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BF_ofb64_encrypt, i64 0, i64 0)
  %193 = add i64 %pgocount1, 1
  store i64 %193, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BF_ofb64_encrypt, i64 0, i64 0)
  %194 = load i8*, i8** %7, align 8
  %195 = getelementptr inbounds i8, i8* %194, i32 1
  store i8* %195, i8** %7, align 8
  %196 = load i8, i8* %194, align 1
  %197 = zext i8 %196 to i32
  %198 = load i32, i32* %16, align 4
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds [8 x i8], [8 x i8]* %18, i64 0, i64 %199
  %201 = load i8, i8* %200, align 1
  %202 = zext i8 %201 to i32
  %203 = xor i32 %197, %202
  %204 = trunc i32 %203 to i8
  %205 = load i8*, i8** %8, align 8
  %206 = getelementptr inbounds i8, i8* %205, i32 1
  store i8* %206, i8** %8, align 8
  store i8 %204, i8* %205, align 1
  %207 = load i32, i32* %16, align 4
  %208 = add nsw i32 %207, 1
  %209 = and i32 %208, 7
  store i32 %209, i32* %16, align 4
  br label %128

; <label>:210:                                    ; preds = %128
  %211 = load i32, i32* %22, align 4
  %212 = icmp ne i32 %211, 0
  br i1 %212, label %213, label %266

; <label>:213:                                    ; preds = %210
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BF_ofb64_encrypt, i64 0, i64 3)
  %214 = add i64 %pgocount2, 1
  store i64 %214, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BF_ofb64_encrypt, i64 0, i64 3)
  %215 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 0
  %216 = load i64, i64* %215, align 16
  store i64 %216, i64* %13, align 8
  %217 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 1
  %218 = load i64, i64* %217, align 8
  store i64 %218, i64* %14, align 8
  %219 = load i8*, i8** %11, align 8
  store i8* %219, i8** %21, align 8
  %220 = load i64, i64* %13, align 8
  %221 = lshr i64 %220, 24
  %222 = and i64 %221, 255
  %223 = trunc i64 %222 to i8
  %224 = load i8*, i8** %21, align 8
  %225 = getelementptr inbounds i8, i8* %224, i32 1
  store i8* %225, i8** %21, align 8
  store i8 %223, i8* %224, align 1
  %226 = load i64, i64* %13, align 8
  %227 = lshr i64 %226, 16
  %228 = and i64 %227, 255
  %229 = trunc i64 %228 to i8
  %230 = load i8*, i8** %21, align 8
  %231 = getelementptr inbounds i8, i8* %230, i32 1
  store i8* %231, i8** %21, align 8
  store i8 %229, i8* %230, align 1
  %232 = load i64, i64* %13, align 8
  %233 = lshr i64 %232, 8
  %234 = and i64 %233, 255
  %235 = trunc i64 %234 to i8
  %236 = load i8*, i8** %21, align 8
  %237 = getelementptr inbounds i8, i8* %236, i32 1
  store i8* %237, i8** %21, align 8
  store i8 %235, i8* %236, align 1
  %238 = load i64, i64* %13, align 8
  %239 = and i64 %238, 255
  %240 = trunc i64 %239 to i8
  %241 = load i8*, i8** %21, align 8
  %242 = getelementptr inbounds i8, i8* %241, i32 1
  store i8* %242, i8** %21, align 8
  store i8 %240, i8* %241, align 1
  %243 = load i64, i64* %14, align 8
  %244 = lshr i64 %243, 24
  %245 = and i64 %244, 255
  %246 = trunc i64 %245 to i8
  %247 = load i8*, i8** %21, align 8
  %248 = getelementptr inbounds i8, i8* %247, i32 1
  store i8* %248, i8** %21, align 8
  store i8 %246, i8* %247, align 1
  %249 = load i64, i64* %14, align 8
  %250 = lshr i64 %249, 16
  %251 = and i64 %250, 255
  %252 = trunc i64 %251 to i8
  %253 = load i8*, i8** %21, align 8
  %254 = getelementptr inbounds i8, i8* %253, i32 1
  store i8* %254, i8** %21, align 8
  store i8 %252, i8* %253, align 1
  %255 = load i64, i64* %14, align 8
  %256 = lshr i64 %255, 8
  %257 = and i64 %256, 255
  %258 = trunc i64 %257 to i8
  %259 = load i8*, i8** %21, align 8
  %260 = getelementptr inbounds i8, i8* %259, i32 1
  store i8* %260, i8** %21, align 8
  store i8 %258, i8* %259, align 1
  %261 = load i64, i64* %14, align 8
  %262 = and i64 %261, 255
  %263 = trunc i64 %262 to i8
  %264 = load i8*, i8** %21, align 8
  %265 = getelementptr inbounds i8, i8* %264, i32 1
  store i8* %265, i8** %21, align 8
  store i8 %263, i8* %264, align 1
  br label %266

; <label>:266:                                    ; preds = %213, %210
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BF_ofb64_encrypt, i64 0, i64 2)
  %267 = add i64 %pgocount3, 1
  store i64 %267, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BF_ofb64_encrypt, i64 0, i64 2)
  %268 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 1
  store i64 0, i64* %268, align 8
  %269 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 0
  store i64 0, i64* %269, align 16
  store i64 0, i64* %14, align 8
  store i64 0, i64* %13, align 8
  store i64 0, i64* %15, align 8
  %270 = load i32, i32* %16, align 4
  %271 = load i32*, i32** %12, align 8
  store i32 %270, i32* %271, align 4
  ret void
}

declare void @BF_encrypt(i64*, %struct.bf_key_st*, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
