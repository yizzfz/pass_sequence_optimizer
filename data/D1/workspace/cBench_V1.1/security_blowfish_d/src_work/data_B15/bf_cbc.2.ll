; ModuleID = 'tmp1.ll'
source_filename = "bf_cbc.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bf_key_st = type { [18 x i64], [1024 x i64] }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_BF_cbc_encrypt = private constant [14 x i8] c"BF_cbc_encrypt"
@__profc_BF_cbc_encrypt = private global [22 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BF_cbc_encrypt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4211813612149404919, i64 242815263340, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i32 0, i32 0), i8* bitcast (void (i8*, i8*, i64, %struct.bf_key_st*, i8*, i32)* @BF_cbc_encrypt to i8*), i8* null, i32 22, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [16 x i8] c"\0E\00BF_cbc_encrypt", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BF_cbc_encrypt to i8*), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @BF_cbc_encrypt(i8*, i8*, i64, %struct.bf_key_st*, i8*, i32) #0 {
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64, align 8
  %10 = alloca %struct.bf_key_st*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  %20 = alloca [2 x i64], align 16
  store i8* %0, i8** %7, align 8
  store i8* %1, i8** %8, align 8
  store i64 %2, i64* %9, align 8
  store %struct.bf_key_st* %3, %struct.bf_key_st** %10, align 8
  store i8* %4, i8** %11, align 8
  store i32 %5, i32* %12, align 4
  %21 = load i64, i64* %9, align 8
  store i64 %21, i64* %19, align 8
  %22 = load i32, i32* %12, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %387

; <label>:24:                                     ; preds = %6
  %25 = load i8*, i8** %11, align 8
  %26 = getelementptr inbounds i8, i8* %25, i32 1
  store i8* %26, i8** %11, align 8
  %27 = load i8, i8* %25, align 1
  %28 = zext i8 %27 to i64
  %29 = shl i64 %28, 24
  store i64 %29, i64* %15, align 8
  %30 = load i8*, i8** %11, align 8
  %31 = getelementptr inbounds i8, i8* %30, i32 1
  store i8* %31, i8** %11, align 8
  %32 = load i8, i8* %30, align 1
  %33 = zext i8 %32 to i64
  %34 = shl i64 %33, 16
  %35 = load i64, i64* %15, align 8
  %36 = or i64 %35, %34
  store i64 %36, i64* %15, align 8
  %37 = load i8*, i8** %11, align 8
  %38 = getelementptr inbounds i8, i8* %37, i32 1
  store i8* %38, i8** %11, align 8
  %39 = load i8, i8* %37, align 1
  %40 = zext i8 %39 to i64
  %41 = shl i64 %40, 8
  %42 = load i64, i64* %15, align 8
  %43 = or i64 %42, %41
  store i64 %43, i64* %15, align 8
  %44 = load i8*, i8** %11, align 8
  %45 = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %45, i8** %11, align 8
  %46 = load i8, i8* %44, align 1
  %47 = zext i8 %46 to i64
  %48 = load i64, i64* %15, align 8
  %49 = or i64 %48, %47
  store i64 %49, i64* %15, align 8
  %50 = load i8*, i8** %11, align 8
  %51 = getelementptr inbounds i8, i8* %50, i32 1
  store i8* %51, i8** %11, align 8
  %52 = load i8, i8* %50, align 1
  %53 = zext i8 %52 to i64
  %54 = shl i64 %53, 24
  store i64 %54, i64* %16, align 8
  %55 = load i8*, i8** %11, align 8
  %56 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %56, i8** %11, align 8
  %57 = load i8, i8* %55, align 1
  %58 = zext i8 %57 to i64
  %59 = shl i64 %58, 16
  %60 = load i64, i64* %16, align 8
  %61 = or i64 %60, %59
  store i64 %61, i64* %16, align 8
  %62 = load i8*, i8** %11, align 8
  %63 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %63, i8** %11, align 8
  %64 = load i8, i8* %62, align 1
  %65 = zext i8 %64 to i64
  %66 = shl i64 %65, 8
  %67 = load i64, i64* %16, align 8
  %68 = or i64 %67, %66
  store i64 %68, i64* %16, align 8
  %69 = load i8*, i8** %11, align 8
  %70 = getelementptr inbounds i8, i8* %69, i32 1
  store i8* %70, i8** %11, align 8
  %71 = load i8, i8* %69, align 1
  %72 = zext i8 %71 to i64
  %73 = load i64, i64* %16, align 8
  %74 = or i64 %73, %72
  store i64 %74, i64* %16, align 8
  %75 = load i8*, i8** %11, align 8
  %76 = getelementptr inbounds i8, i8* %75, i64 -8
  store i8* %76, i8** %11, align 8
  %77 = load i64, i64* %19, align 8
  %78 = sub nsw i64 %77, 8
  store i64 %78, i64* %19, align 8
  br label %79

; <label>:79:                                     ; preds = %195, %24
  %80 = load i64, i64* %19, align 8
  %81 = icmp sge i64 %80, 0
  br i1 %81, label %82, label %199

; <label>:82:                                     ; preds = %79
  %83 = load i8*, i8** %7, align 8
  %84 = getelementptr inbounds i8, i8* %83, i32 1
  store i8* %84, i8** %7, align 8
  %85 = load i8, i8* %83, align 1
  %86 = zext i8 %85 to i64
  %87 = shl i64 %86, 24
  store i64 %87, i64* %13, align 8
  %88 = load i8*, i8** %7, align 8
  %89 = getelementptr inbounds i8, i8* %88, i32 1
  store i8* %89, i8** %7, align 8
  %90 = load i8, i8* %88, align 1
  %91 = zext i8 %90 to i64
  %92 = shl i64 %91, 16
  %93 = load i64, i64* %13, align 8
  %94 = or i64 %93, %92
  store i64 %94, i64* %13, align 8
  %95 = load i8*, i8** %7, align 8
  %96 = getelementptr inbounds i8, i8* %95, i32 1
  store i8* %96, i8** %7, align 8
  %97 = load i8, i8* %95, align 1
  %98 = zext i8 %97 to i64
  %99 = shl i64 %98, 8
  %100 = load i64, i64* %13, align 8
  %101 = or i64 %100, %99
  store i64 %101, i64* %13, align 8
  %102 = load i8*, i8** %7, align 8
  %103 = getelementptr inbounds i8, i8* %102, i32 1
  store i8* %103, i8** %7, align 8
  %104 = load i8, i8* %102, align 1
  %105 = zext i8 %104 to i64
  %106 = load i64, i64* %13, align 8
  %107 = or i64 %106, %105
  store i64 %107, i64* %13, align 8
  %108 = load i8*, i8** %7, align 8
  %109 = getelementptr inbounds i8, i8* %108, i32 1
  store i8* %109, i8** %7, align 8
  %110 = load i8, i8* %108, align 1
  %111 = zext i8 %110 to i64
  %112 = shl i64 %111, 24
  store i64 %112, i64* %14, align 8
  %113 = load i8*, i8** %7, align 8
  %114 = getelementptr inbounds i8, i8* %113, i32 1
  store i8* %114, i8** %7, align 8
  %115 = load i8, i8* %113, align 1
  %116 = zext i8 %115 to i64
  %117 = shl i64 %116, 16
  %118 = load i64, i64* %14, align 8
  %119 = or i64 %118, %117
  store i64 %119, i64* %14, align 8
  %120 = load i8*, i8** %7, align 8
  %121 = getelementptr inbounds i8, i8* %120, i32 1
  store i8* %121, i8** %7, align 8
  %122 = load i8, i8* %120, align 1
  %123 = zext i8 %122 to i64
  %124 = shl i64 %123, 8
  %125 = load i64, i64* %14, align 8
  %126 = or i64 %125, %124
  store i64 %126, i64* %14, align 8
  %127 = load i8*, i8** %7, align 8
  %128 = getelementptr inbounds i8, i8* %127, i32 1
  store i8* %128, i8** %7, align 8
  %129 = load i8, i8* %127, align 1
  %130 = zext i8 %129 to i64
  %131 = load i64, i64* %14, align 8
  %132 = or i64 %131, %130
  store i64 %132, i64* %14, align 8
  %133 = load i64, i64* %15, align 8
  %134 = load i64, i64* %13, align 8
  %135 = xor i64 %134, %133
  store i64 %135, i64* %13, align 8
  %136 = load i64, i64* %16, align 8
  %137 = load i64, i64* %14, align 8
  %138 = xor i64 %137, %136
  store i64 %138, i64* %14, align 8
  %139 = load i64, i64* %13, align 8
  %140 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 0
  store i64 %139, i64* %140, align 16
  %141 = load i64, i64* %14, align 8
  %142 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 1
  store i64 %141, i64* %142, align 8
  %143 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i32 0, i32 0
  %144 = load %struct.bf_key_st*, %struct.bf_key_st** %10, align 8
  call void @BF_encrypt(i64* %143, %struct.bf_key_st* %144, i32 1)
  %145 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 0
  %146 = load i64, i64* %145, align 16
  store i64 %146, i64* %15, align 8
  %147 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 1
  %148 = load i64, i64* %147, align 8
  store i64 %148, i64* %16, align 8
  %149 = load i64, i64* %15, align 8
  %150 = lshr i64 %149, 24
  %151 = and i64 %150, 255
  %152 = trunc i64 %151 to i8
  %153 = load i8*, i8** %8, align 8
  %154 = getelementptr inbounds i8, i8* %153, i32 1
  store i8* %154, i8** %8, align 8
  store i8 %152, i8* %153, align 1
  %155 = load i64, i64* %15, align 8
  %156 = lshr i64 %155, 16
  %157 = and i64 %156, 255
  %158 = trunc i64 %157 to i8
  %159 = load i8*, i8** %8, align 8
  %160 = getelementptr inbounds i8, i8* %159, i32 1
  store i8* %160, i8** %8, align 8
  store i8 %158, i8* %159, align 1
  %161 = load i64, i64* %15, align 8
  %162 = lshr i64 %161, 8
  %163 = and i64 %162, 255
  %164 = trunc i64 %163 to i8
  %165 = load i8*, i8** %8, align 8
  %166 = getelementptr inbounds i8, i8* %165, i32 1
  store i8* %166, i8** %8, align 8
  store i8 %164, i8* %165, align 1
  %167 = load i64, i64* %15, align 8
  %168 = and i64 %167, 255
  %169 = trunc i64 %168 to i8
  %170 = load i8*, i8** %8, align 8
  %171 = getelementptr inbounds i8, i8* %170, i32 1
  store i8* %171, i8** %8, align 8
  store i8 %169, i8* %170, align 1
  %172 = load i64, i64* %16, align 8
  %173 = lshr i64 %172, 24
  %174 = and i64 %173, 255
  %175 = trunc i64 %174 to i8
  %176 = load i8*, i8** %8, align 8
  %177 = getelementptr inbounds i8, i8* %176, i32 1
  store i8* %177, i8** %8, align 8
  store i8 %175, i8* %176, align 1
  %178 = load i64, i64* %16, align 8
  %179 = lshr i64 %178, 16
  %180 = and i64 %179, 255
  %181 = trunc i64 %180 to i8
  %182 = load i8*, i8** %8, align 8
  %183 = getelementptr inbounds i8, i8* %182, i32 1
  store i8* %183, i8** %8, align 8
  store i8 %181, i8* %182, align 1
  %184 = load i64, i64* %16, align 8
  %185 = lshr i64 %184, 8
  %186 = and i64 %185, 255
  %187 = trunc i64 %186 to i8
  %188 = load i8*, i8** %8, align 8
  %189 = getelementptr inbounds i8, i8* %188, i32 1
  store i8* %189, i8** %8, align 8
  store i8 %187, i8* %188, align 1
  %190 = load i64, i64* %16, align 8
  %191 = and i64 %190, 255
  %192 = trunc i64 %191 to i8
  %193 = load i8*, i8** %8, align 8
  %194 = getelementptr inbounds i8, i8* %193, i32 1
  store i8* %194, i8** %8, align 8
  store i8 %192, i8* %193, align 1
  br label %195

; <label>:195:                                    ; preds = %82
  %pgocount = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 0)
  %196 = add i64 %pgocount, 1
  store i64 %196, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 0)
  %197 = load i64, i64* %19, align 8
  %198 = sub nsw i64 %197, 8
  store i64 %198, i64* %19, align 8
  br label %79

; <label>:199:                                    ; preds = %79
  %200 = load i64, i64* %19, align 8
  %201 = icmp ne i64 %200, -8
  br i1 %201, label %202, label %339

; <label>:202:                                    ; preds = %199
  %203 = load i64, i64* %19, align 8
  %204 = add nsw i64 %203, 8
  %205 = load i8*, i8** %7, align 8
  %206 = getelementptr inbounds i8, i8* %205, i64 %204
  store i8* %206, i8** %7, align 8
  store i64 0, i64* %14, align 8
  store i64 0, i64* %13, align 8
  %207 = load i64, i64* %19, align 8
  %208 = add nsw i64 %207, 8
  switch i64 %208, label %275 [
    i64 8, label %209
    i64 7, label %215
    i64 6, label %224
    i64 5, label %233
    i64 4, label %242
    i64 3, label %248
    i64 2, label %257
    i64 1, label %266
  ]

; <label>:209:                                    ; preds = %202
  %pgocount1 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 20)
  %210 = add i64 %pgocount1, 1
  store i64 %210, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 20)
  %211 = load i8*, i8** %7, align 8
  %212 = getelementptr inbounds i8, i8* %211, i32 -1
  store i8* %212, i8** %7, align 8
  %213 = load i8, i8* %212, align 1
  %214 = zext i8 %213 to i64
  store i64 %214, i64* %14, align 8
  br label %215

; <label>:215:                                    ; preds = %209, %202
  %pgocount2 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 17)
  %216 = add i64 %pgocount2, 1
  store i64 %216, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 17)
  %217 = load i8*, i8** %7, align 8
  %218 = getelementptr inbounds i8, i8* %217, i32 -1
  store i8* %218, i8** %7, align 8
  %219 = load i8, i8* %218, align 1
  %220 = zext i8 %219 to i64
  %221 = shl i64 %220, 8
  %222 = load i64, i64* %14, align 8
  %223 = or i64 %222, %221
  store i64 %223, i64* %14, align 8
  br label %224

; <label>:224:                                    ; preds = %215, %202
  %pgocount3 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 14)
  %225 = add i64 %pgocount3, 1
  store i64 %225, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 14)
  %226 = load i8*, i8** %7, align 8
  %227 = getelementptr inbounds i8, i8* %226, i32 -1
  store i8* %227, i8** %7, align 8
  %228 = load i8, i8* %227, align 1
  %229 = zext i8 %228 to i64
  %230 = shl i64 %229, 16
  %231 = load i64, i64* %14, align 8
  %232 = or i64 %231, %230
  store i64 %232, i64* %14, align 8
  br label %233

; <label>:233:                                    ; preds = %224, %202
  %pgocount4 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 12)
  %234 = add i64 %pgocount4, 1
  store i64 %234, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 12)
  %235 = load i8*, i8** %7, align 8
  %236 = getelementptr inbounds i8, i8* %235, i32 -1
  store i8* %236, i8** %7, align 8
  %237 = load i8, i8* %236, align 1
  %238 = zext i8 %237 to i64
  %239 = shl i64 %238, 24
  %240 = load i64, i64* %14, align 8
  %241 = or i64 %240, %239
  store i64 %241, i64* %14, align 8
  br label %242

; <label>:242:                                    ; preds = %233, %202
  %pgocount5 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 9)
  %243 = add i64 %pgocount5, 1
  store i64 %243, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 9)
  %244 = load i8*, i8** %7, align 8
  %245 = getelementptr inbounds i8, i8* %244, i32 -1
  store i8* %245, i8** %7, align 8
  %246 = load i8, i8* %245, align 1
  %247 = zext i8 %246 to i64
  store i64 %247, i64* %13, align 8
  br label %248

; <label>:248:                                    ; preds = %242, %202
  %pgocount6 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 7)
  %249 = add i64 %pgocount6, 1
  store i64 %249, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 7)
  %250 = load i8*, i8** %7, align 8
  %251 = getelementptr inbounds i8, i8* %250, i32 -1
  store i8* %251, i8** %7, align 8
  %252 = load i8, i8* %251, align 1
  %253 = zext i8 %252 to i64
  %254 = shl i64 %253, 8
  %255 = load i64, i64* %13, align 8
  %256 = or i64 %255, %254
  store i64 %256, i64* %13, align 8
  br label %257

; <label>:257:                                    ; preds = %248, %202
  %pgocount7 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 6)
  %258 = add i64 %pgocount7, 1
  store i64 %258, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 6)
  %259 = load i8*, i8** %7, align 8
  %260 = getelementptr inbounds i8, i8* %259, i32 -1
  store i8* %260, i8** %7, align 8
  %261 = load i8, i8* %260, align 1
  %262 = zext i8 %261 to i64
  %263 = shl i64 %262, 16
  %264 = load i64, i64* %13, align 8
  %265 = or i64 %264, %263
  store i64 %265, i64* %13, align 8
  br label %266

; <label>:266:                                    ; preds = %257, %202
  %pgocount8 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 5)
  %267 = add i64 %pgocount8, 1
  store i64 %267, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 5)
  %268 = load i8*, i8** %7, align 8
  %269 = getelementptr inbounds i8, i8* %268, i32 -1
  store i8* %269, i8** %7, align 8
  %270 = load i8, i8* %269, align 1
  %271 = zext i8 %270 to i64
  %272 = shl i64 %271, 24
  %273 = load i64, i64* %13, align 8
  %274 = or i64 %273, %272
  store i64 %274, i64* %13, align 8
  br label %275

; <label>:275:                                    ; preds = %266, %202
  %pgocount9 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 4)
  %276 = add i64 %pgocount9, 1
  store i64 %276, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 4)
  %277 = load i64, i64* %15, align 8
  %278 = load i64, i64* %13, align 8
  %279 = xor i64 %278, %277
  store i64 %279, i64* %13, align 8
  %280 = load i64, i64* %16, align 8
  %281 = load i64, i64* %14, align 8
  %282 = xor i64 %281, %280
  store i64 %282, i64* %14, align 8
  %283 = load i64, i64* %13, align 8
  %284 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 0
  store i64 %283, i64* %284, align 16
  %285 = load i64, i64* %14, align 8
  %286 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 1
  store i64 %285, i64* %286, align 8
  %287 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i32 0, i32 0
  %288 = load %struct.bf_key_st*, %struct.bf_key_st** %10, align 8
  call void @BF_encrypt(i64* %287, %struct.bf_key_st* %288, i32 1)
  %289 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 0
  %290 = load i64, i64* %289, align 16
  store i64 %290, i64* %15, align 8
  %291 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 1
  %292 = load i64, i64* %291, align 8
  store i64 %292, i64* %16, align 8
  %293 = load i64, i64* %15, align 8
  %294 = lshr i64 %293, 24
  %295 = and i64 %294, 255
  %296 = trunc i64 %295 to i8
  %297 = load i8*, i8** %8, align 8
  %298 = getelementptr inbounds i8, i8* %297, i32 1
  store i8* %298, i8** %8, align 8
  store i8 %296, i8* %297, align 1
  %299 = load i64, i64* %15, align 8
  %300 = lshr i64 %299, 16
  %301 = and i64 %300, 255
  %302 = trunc i64 %301 to i8
  %303 = load i8*, i8** %8, align 8
  %304 = getelementptr inbounds i8, i8* %303, i32 1
  store i8* %304, i8** %8, align 8
  store i8 %302, i8* %303, align 1
  %305 = load i64, i64* %15, align 8
  %306 = lshr i64 %305, 8
  %307 = and i64 %306, 255
  %308 = trunc i64 %307 to i8
  %309 = load i8*, i8** %8, align 8
  %310 = getelementptr inbounds i8, i8* %309, i32 1
  store i8* %310, i8** %8, align 8
  store i8 %308, i8* %309, align 1
  %311 = load i64, i64* %15, align 8
  %312 = and i64 %311, 255
  %313 = trunc i64 %312 to i8
  %314 = load i8*, i8** %8, align 8
  %315 = getelementptr inbounds i8, i8* %314, i32 1
  store i8* %315, i8** %8, align 8
  store i8 %313, i8* %314, align 1
  %316 = load i64, i64* %16, align 8
  %317 = lshr i64 %316, 24
  %318 = and i64 %317, 255
  %319 = trunc i64 %318 to i8
  %320 = load i8*, i8** %8, align 8
  %321 = getelementptr inbounds i8, i8* %320, i32 1
  store i8* %321, i8** %8, align 8
  store i8 %319, i8* %320, align 1
  %322 = load i64, i64* %16, align 8
  %323 = lshr i64 %322, 16
  %324 = and i64 %323, 255
  %325 = trunc i64 %324 to i8
  %326 = load i8*, i8** %8, align 8
  %327 = getelementptr inbounds i8, i8* %326, i32 1
  store i8* %327, i8** %8, align 8
  store i8 %325, i8* %326, align 1
  %328 = load i64, i64* %16, align 8
  %329 = lshr i64 %328, 8
  %330 = and i64 %329, 255
  %331 = trunc i64 %330 to i8
  %332 = load i8*, i8** %8, align 8
  %333 = getelementptr inbounds i8, i8* %332, i32 1
  store i8* %333, i8** %8, align 8
  store i8 %331, i8* %332, align 1
  %334 = load i64, i64* %16, align 8
  %335 = and i64 %334, 255
  %336 = trunc i64 %335 to i8
  %337 = load i8*, i8** %8, align 8
  %338 = getelementptr inbounds i8, i8* %337, i32 1
  store i8* %338, i8** %8, align 8
  store i8 %336, i8* %337, align 1
  br label %339

; <label>:339:                                    ; preds = %275, %199
  %pgocount10 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 2)
  %340 = add i64 %pgocount10, 1
  store i64 %340, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 2)
  %341 = load i64, i64* %15, align 8
  %342 = lshr i64 %341, 24
  %343 = and i64 %342, 255
  %344 = trunc i64 %343 to i8
  %345 = load i8*, i8** %11, align 8
  %346 = getelementptr inbounds i8, i8* %345, i32 1
  store i8* %346, i8** %11, align 8
  store i8 %344, i8* %345, align 1
  %347 = load i64, i64* %15, align 8
  %348 = lshr i64 %347, 16
  %349 = and i64 %348, 255
  %350 = trunc i64 %349 to i8
  %351 = load i8*, i8** %11, align 8
  %352 = getelementptr inbounds i8, i8* %351, i32 1
  store i8* %352, i8** %11, align 8
  store i8 %350, i8* %351, align 1
  %353 = load i64, i64* %15, align 8
  %354 = lshr i64 %353, 8
  %355 = and i64 %354, 255
  %356 = trunc i64 %355 to i8
  %357 = load i8*, i8** %11, align 8
  %358 = getelementptr inbounds i8, i8* %357, i32 1
  store i8* %358, i8** %11, align 8
  store i8 %356, i8* %357, align 1
  %359 = load i64, i64* %15, align 8
  %360 = and i64 %359, 255
  %361 = trunc i64 %360 to i8
  %362 = load i8*, i8** %11, align 8
  %363 = getelementptr inbounds i8, i8* %362, i32 1
  store i8* %363, i8** %11, align 8
  store i8 %361, i8* %362, align 1
  %364 = load i64, i64* %16, align 8
  %365 = lshr i64 %364, 24
  %366 = and i64 %365, 255
  %367 = trunc i64 %366 to i8
  %368 = load i8*, i8** %11, align 8
  %369 = getelementptr inbounds i8, i8* %368, i32 1
  store i8* %369, i8** %11, align 8
  store i8 %367, i8* %368, align 1
  %370 = load i64, i64* %16, align 8
  %371 = lshr i64 %370, 16
  %372 = and i64 %371, 255
  %373 = trunc i64 %372 to i8
  %374 = load i8*, i8** %11, align 8
  %375 = getelementptr inbounds i8, i8* %374, i32 1
  store i8* %375, i8** %11, align 8
  store i8 %373, i8* %374, align 1
  %376 = load i64, i64* %16, align 8
  %377 = lshr i64 %376, 8
  %378 = and i64 %377, 255
  %379 = trunc i64 %378 to i8
  %380 = load i8*, i8** %11, align 8
  %381 = getelementptr inbounds i8, i8* %380, i32 1
  store i8* %381, i8** %11, align 8
  store i8 %379, i8* %380, align 1
  %382 = load i64, i64* %16, align 8
  %383 = and i64 %382, 255
  %384 = trunc i64 %383 to i8
  %385 = load i8*, i8** %11, align 8
  %386 = getelementptr inbounds i8, i8* %385, i32 1
  store i8* %386, i8** %11, align 8
  store i8 %384, i8* %385, align 1
  br label %750

; <label>:387:                                    ; preds = %6
  %388 = load i8*, i8** %11, align 8
  %389 = getelementptr inbounds i8, i8* %388, i32 1
  store i8* %389, i8** %11, align 8
  %390 = load i8, i8* %388, align 1
  %391 = zext i8 %390 to i64
  %392 = shl i64 %391, 24
  store i64 %392, i64* %17, align 8
  %393 = load i8*, i8** %11, align 8
  %394 = getelementptr inbounds i8, i8* %393, i32 1
  store i8* %394, i8** %11, align 8
  %395 = load i8, i8* %393, align 1
  %396 = zext i8 %395 to i64
  %397 = shl i64 %396, 16
  %398 = load i64, i64* %17, align 8
  %399 = or i64 %398, %397
  store i64 %399, i64* %17, align 8
  %400 = load i8*, i8** %11, align 8
  %401 = getelementptr inbounds i8, i8* %400, i32 1
  store i8* %401, i8** %11, align 8
  %402 = load i8, i8* %400, align 1
  %403 = zext i8 %402 to i64
  %404 = shl i64 %403, 8
  %405 = load i64, i64* %17, align 8
  %406 = or i64 %405, %404
  store i64 %406, i64* %17, align 8
  %407 = load i8*, i8** %11, align 8
  %408 = getelementptr inbounds i8, i8* %407, i32 1
  store i8* %408, i8** %11, align 8
  %409 = load i8, i8* %407, align 1
  %410 = zext i8 %409 to i64
  %411 = load i64, i64* %17, align 8
  %412 = or i64 %411, %410
  store i64 %412, i64* %17, align 8
  %413 = load i8*, i8** %11, align 8
  %414 = getelementptr inbounds i8, i8* %413, i32 1
  store i8* %414, i8** %11, align 8
  %415 = load i8, i8* %413, align 1
  %416 = zext i8 %415 to i64
  %417 = shl i64 %416, 24
  store i64 %417, i64* %18, align 8
  %418 = load i8*, i8** %11, align 8
  %419 = getelementptr inbounds i8, i8* %418, i32 1
  store i8* %419, i8** %11, align 8
  %420 = load i8, i8* %418, align 1
  %421 = zext i8 %420 to i64
  %422 = shl i64 %421, 16
  %423 = load i64, i64* %18, align 8
  %424 = or i64 %423, %422
  store i64 %424, i64* %18, align 8
  %425 = load i8*, i8** %11, align 8
  %426 = getelementptr inbounds i8, i8* %425, i32 1
  store i8* %426, i8** %11, align 8
  %427 = load i8, i8* %425, align 1
  %428 = zext i8 %427 to i64
  %429 = shl i64 %428, 8
  %430 = load i64, i64* %18, align 8
  %431 = or i64 %430, %429
  store i64 %431, i64* %18, align 8
  %432 = load i8*, i8** %11, align 8
  %433 = getelementptr inbounds i8, i8* %432, i32 1
  store i8* %433, i8** %11, align 8
  %434 = load i8, i8* %432, align 1
  %435 = zext i8 %434 to i64
  %436 = load i64, i64* %18, align 8
  %437 = or i64 %436, %435
  store i64 %437, i64* %18, align 8
  %438 = load i8*, i8** %11, align 8
  %439 = getelementptr inbounds i8, i8* %438, i64 -8
  store i8* %439, i8** %11, align 8
  %440 = load i64, i64* %19, align 8
  %441 = sub nsw i64 %440, 8
  store i64 %441, i64* %19, align 8
  br label %442

; <label>:442:                                    ; preds = %558, %387
  %443 = load i64, i64* %19, align 8
  %444 = icmp sge i64 %443, 0
  br i1 %444, label %445, label %562

; <label>:445:                                    ; preds = %442
  %446 = load i8*, i8** %7, align 8
  %447 = getelementptr inbounds i8, i8* %446, i32 1
  store i8* %447, i8** %7, align 8
  %448 = load i8, i8* %446, align 1
  %449 = zext i8 %448 to i64
  %450 = shl i64 %449, 24
  store i64 %450, i64* %13, align 8
  %451 = load i8*, i8** %7, align 8
  %452 = getelementptr inbounds i8, i8* %451, i32 1
  store i8* %452, i8** %7, align 8
  %453 = load i8, i8* %451, align 1
  %454 = zext i8 %453 to i64
  %455 = shl i64 %454, 16
  %456 = load i64, i64* %13, align 8
  %457 = or i64 %456, %455
  store i64 %457, i64* %13, align 8
  %458 = load i8*, i8** %7, align 8
  %459 = getelementptr inbounds i8, i8* %458, i32 1
  store i8* %459, i8** %7, align 8
  %460 = load i8, i8* %458, align 1
  %461 = zext i8 %460 to i64
  %462 = shl i64 %461, 8
  %463 = load i64, i64* %13, align 8
  %464 = or i64 %463, %462
  store i64 %464, i64* %13, align 8
  %465 = load i8*, i8** %7, align 8
  %466 = getelementptr inbounds i8, i8* %465, i32 1
  store i8* %466, i8** %7, align 8
  %467 = load i8, i8* %465, align 1
  %468 = zext i8 %467 to i64
  %469 = load i64, i64* %13, align 8
  %470 = or i64 %469, %468
  store i64 %470, i64* %13, align 8
  %471 = load i8*, i8** %7, align 8
  %472 = getelementptr inbounds i8, i8* %471, i32 1
  store i8* %472, i8** %7, align 8
  %473 = load i8, i8* %471, align 1
  %474 = zext i8 %473 to i64
  %475 = shl i64 %474, 24
  store i64 %475, i64* %14, align 8
  %476 = load i8*, i8** %7, align 8
  %477 = getelementptr inbounds i8, i8* %476, i32 1
  store i8* %477, i8** %7, align 8
  %478 = load i8, i8* %476, align 1
  %479 = zext i8 %478 to i64
  %480 = shl i64 %479, 16
  %481 = load i64, i64* %14, align 8
  %482 = or i64 %481, %480
  store i64 %482, i64* %14, align 8
  %483 = load i8*, i8** %7, align 8
  %484 = getelementptr inbounds i8, i8* %483, i32 1
  store i8* %484, i8** %7, align 8
  %485 = load i8, i8* %483, align 1
  %486 = zext i8 %485 to i64
  %487 = shl i64 %486, 8
  %488 = load i64, i64* %14, align 8
  %489 = or i64 %488, %487
  store i64 %489, i64* %14, align 8
  %490 = load i8*, i8** %7, align 8
  %491 = getelementptr inbounds i8, i8* %490, i32 1
  store i8* %491, i8** %7, align 8
  %492 = load i8, i8* %490, align 1
  %493 = zext i8 %492 to i64
  %494 = load i64, i64* %14, align 8
  %495 = or i64 %494, %493
  store i64 %495, i64* %14, align 8
  %496 = load i64, i64* %13, align 8
  %497 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 0
  store i64 %496, i64* %497, align 16
  %498 = load i64, i64* %14, align 8
  %499 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 1
  store i64 %498, i64* %499, align 8
  %500 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i32 0, i32 0
  %501 = load %struct.bf_key_st*, %struct.bf_key_st** %10, align 8
  call void @BF_encrypt(i64* %500, %struct.bf_key_st* %501, i32 0)
  %502 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 0
  %503 = load i64, i64* %502, align 16
  %504 = load i64, i64* %17, align 8
  %505 = xor i64 %503, %504
  store i64 %505, i64* %15, align 8
  %506 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 1
  %507 = load i64, i64* %506, align 8
  %508 = load i64, i64* %18, align 8
  %509 = xor i64 %507, %508
  store i64 %509, i64* %16, align 8
  %510 = load i64, i64* %15, align 8
  %511 = lshr i64 %510, 24
  %512 = and i64 %511, 255
  %513 = trunc i64 %512 to i8
  %514 = load i8*, i8** %8, align 8
  %515 = getelementptr inbounds i8, i8* %514, i32 1
  store i8* %515, i8** %8, align 8
  store i8 %513, i8* %514, align 1
  %516 = load i64, i64* %15, align 8
  %517 = lshr i64 %516, 16
  %518 = and i64 %517, 255
  %519 = trunc i64 %518 to i8
  %520 = load i8*, i8** %8, align 8
  %521 = getelementptr inbounds i8, i8* %520, i32 1
  store i8* %521, i8** %8, align 8
  store i8 %519, i8* %520, align 1
  %522 = load i64, i64* %15, align 8
  %523 = lshr i64 %522, 8
  %524 = and i64 %523, 255
  %525 = trunc i64 %524 to i8
  %526 = load i8*, i8** %8, align 8
  %527 = getelementptr inbounds i8, i8* %526, i32 1
  store i8* %527, i8** %8, align 8
  store i8 %525, i8* %526, align 1
  %528 = load i64, i64* %15, align 8
  %529 = and i64 %528, 255
  %530 = trunc i64 %529 to i8
  %531 = load i8*, i8** %8, align 8
  %532 = getelementptr inbounds i8, i8* %531, i32 1
  store i8* %532, i8** %8, align 8
  store i8 %530, i8* %531, align 1
  %533 = load i64, i64* %16, align 8
  %534 = lshr i64 %533, 24
  %535 = and i64 %534, 255
  %536 = trunc i64 %535 to i8
  %537 = load i8*, i8** %8, align 8
  %538 = getelementptr inbounds i8, i8* %537, i32 1
  store i8* %538, i8** %8, align 8
  store i8 %536, i8* %537, align 1
  %539 = load i64, i64* %16, align 8
  %540 = lshr i64 %539, 16
  %541 = and i64 %540, 255
  %542 = trunc i64 %541 to i8
  %543 = load i8*, i8** %8, align 8
  %544 = getelementptr inbounds i8, i8* %543, i32 1
  store i8* %544, i8** %8, align 8
  store i8 %542, i8* %543, align 1
  %545 = load i64, i64* %16, align 8
  %546 = lshr i64 %545, 8
  %547 = and i64 %546, 255
  %548 = trunc i64 %547 to i8
  %549 = load i8*, i8** %8, align 8
  %550 = getelementptr inbounds i8, i8* %549, i32 1
  store i8* %550, i8** %8, align 8
  store i8 %548, i8* %549, align 1
  %551 = load i64, i64* %16, align 8
  %552 = and i64 %551, 255
  %553 = trunc i64 %552 to i8
  %554 = load i8*, i8** %8, align 8
  %555 = getelementptr inbounds i8, i8* %554, i32 1
  store i8* %555, i8** %8, align 8
  store i8 %553, i8* %554, align 1
  %556 = load i64, i64* %13, align 8
  store i64 %556, i64* %17, align 8
  %557 = load i64, i64* %14, align 8
  store i64 %557, i64* %18, align 8
  br label %558

; <label>:558:                                    ; preds = %445
  %pgocount11 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 1)
  %559 = add i64 %pgocount11, 1
  store i64 %559, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 1)
  %560 = load i64, i64* %19, align 8
  %561 = sub nsw i64 %560, 8
  store i64 %561, i64* %19, align 8
  br label %442

; <label>:562:                                    ; preds = %442
  %563 = load i64, i64* %19, align 8
  %564 = icmp ne i64 %563, -8
  br i1 %564, label %565, label %702

; <label>:565:                                    ; preds = %562
  %566 = load i8*, i8** %7, align 8
  %567 = getelementptr inbounds i8, i8* %566, i32 1
  store i8* %567, i8** %7, align 8
  %568 = load i8, i8* %566, align 1
  %569 = zext i8 %568 to i64
  %570 = shl i64 %569, 24
  store i64 %570, i64* %13, align 8
  %571 = load i8*, i8** %7, align 8
  %572 = getelementptr inbounds i8, i8* %571, i32 1
  store i8* %572, i8** %7, align 8
  %573 = load i8, i8* %571, align 1
  %574 = zext i8 %573 to i64
  %575 = shl i64 %574, 16
  %576 = load i64, i64* %13, align 8
  %577 = or i64 %576, %575
  store i64 %577, i64* %13, align 8
  %578 = load i8*, i8** %7, align 8
  %579 = getelementptr inbounds i8, i8* %578, i32 1
  store i8* %579, i8** %7, align 8
  %580 = load i8, i8* %578, align 1
  %581 = zext i8 %580 to i64
  %582 = shl i64 %581, 8
  %583 = load i64, i64* %13, align 8
  %584 = or i64 %583, %582
  store i64 %584, i64* %13, align 8
  %585 = load i8*, i8** %7, align 8
  %586 = getelementptr inbounds i8, i8* %585, i32 1
  store i8* %586, i8** %7, align 8
  %587 = load i8, i8* %585, align 1
  %588 = zext i8 %587 to i64
  %589 = load i64, i64* %13, align 8
  %590 = or i64 %589, %588
  store i64 %590, i64* %13, align 8
  %591 = load i8*, i8** %7, align 8
  %592 = getelementptr inbounds i8, i8* %591, i32 1
  store i8* %592, i8** %7, align 8
  %593 = load i8, i8* %591, align 1
  %594 = zext i8 %593 to i64
  %595 = shl i64 %594, 24
  store i64 %595, i64* %14, align 8
  %596 = load i8*, i8** %7, align 8
  %597 = getelementptr inbounds i8, i8* %596, i32 1
  store i8* %597, i8** %7, align 8
  %598 = load i8, i8* %596, align 1
  %599 = zext i8 %598 to i64
  %600 = shl i64 %599, 16
  %601 = load i64, i64* %14, align 8
  %602 = or i64 %601, %600
  store i64 %602, i64* %14, align 8
  %603 = load i8*, i8** %7, align 8
  %604 = getelementptr inbounds i8, i8* %603, i32 1
  store i8* %604, i8** %7, align 8
  %605 = load i8, i8* %603, align 1
  %606 = zext i8 %605 to i64
  %607 = shl i64 %606, 8
  %608 = load i64, i64* %14, align 8
  %609 = or i64 %608, %607
  store i64 %609, i64* %14, align 8
  %610 = load i8*, i8** %7, align 8
  %611 = getelementptr inbounds i8, i8* %610, i32 1
  store i8* %611, i8** %7, align 8
  %612 = load i8, i8* %610, align 1
  %613 = zext i8 %612 to i64
  %614 = load i64, i64* %14, align 8
  %615 = or i64 %614, %613
  store i64 %615, i64* %14, align 8
  %616 = load i64, i64* %13, align 8
  %617 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 0
  store i64 %616, i64* %617, align 16
  %618 = load i64, i64* %14, align 8
  %619 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 1
  store i64 %618, i64* %619, align 8
  %620 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i32 0, i32 0
  %621 = load %struct.bf_key_st*, %struct.bf_key_st** %10, align 8
  call void @BF_encrypt(i64* %620, %struct.bf_key_st* %621, i32 0)
  %622 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 0
  %623 = load i64, i64* %622, align 16
  %624 = load i64, i64* %17, align 8
  %625 = xor i64 %623, %624
  store i64 %625, i64* %15, align 8
  %626 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 1
  %627 = load i64, i64* %626, align 8
  %628 = load i64, i64* %18, align 8
  %629 = xor i64 %627, %628
  store i64 %629, i64* %16, align 8
  %630 = load i64, i64* %19, align 8
  %631 = add nsw i64 %630, 8
  %632 = load i8*, i8** %8, align 8
  %633 = getelementptr inbounds i8, i8* %632, i64 %631
  store i8* %633, i8** %8, align 8
  %634 = load i64, i64* %19, align 8
  %635 = add nsw i64 %634, 8
  switch i64 %635, label %698 [
    i64 8, label %636
    i64 7, label %643
    i64 6, label %651
    i64 5, label %659
    i64 4, label %667
    i64 3, label %674
    i64 2, label %682
    i64 1, label %690
  ]

; <label>:636:                                    ; preds = %565
  %pgocount12 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 21)
  %637 = add i64 %pgocount12, 1
  store i64 %637, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 21)
  %638 = load i64, i64* %16, align 8
  %639 = and i64 %638, 255
  %640 = trunc i64 %639 to i8
  %641 = load i8*, i8** %8, align 8
  %642 = getelementptr inbounds i8, i8* %641, i32 -1
  store i8* %642, i8** %8, align 8
  store i8 %640, i8* %642, align 1
  br label %643

; <label>:643:                                    ; preds = %636, %565
  %pgocount13 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 19)
  %644 = add i64 %pgocount13, 1
  store i64 %644, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 19)
  %645 = load i64, i64* %16, align 8
  %646 = lshr i64 %645, 8
  %647 = and i64 %646, 255
  %648 = trunc i64 %647 to i8
  %649 = load i8*, i8** %8, align 8
  %650 = getelementptr inbounds i8, i8* %649, i32 -1
  store i8* %650, i8** %8, align 8
  store i8 %648, i8* %650, align 1
  br label %651

; <label>:651:                                    ; preds = %643, %565
  %pgocount14 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 18)
  %652 = add i64 %pgocount14, 1
  store i64 %652, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 18)
  %653 = load i64, i64* %16, align 8
  %654 = lshr i64 %653, 16
  %655 = and i64 %654, 255
  %656 = trunc i64 %655 to i8
  %657 = load i8*, i8** %8, align 8
  %658 = getelementptr inbounds i8, i8* %657, i32 -1
  store i8* %658, i8** %8, align 8
  store i8 %656, i8* %658, align 1
  br label %659

; <label>:659:                                    ; preds = %651, %565
  %pgocount15 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 16)
  %660 = add i64 %pgocount15, 1
  store i64 %660, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 16)
  %661 = load i64, i64* %16, align 8
  %662 = lshr i64 %661, 24
  %663 = and i64 %662, 255
  %664 = trunc i64 %663 to i8
  %665 = load i8*, i8** %8, align 8
  %666 = getelementptr inbounds i8, i8* %665, i32 -1
  store i8* %666, i8** %8, align 8
  store i8 %664, i8* %666, align 1
  br label %667

; <label>:667:                                    ; preds = %659, %565
  %pgocount16 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 15)
  %668 = add i64 %pgocount16, 1
  store i64 %668, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 15)
  %669 = load i64, i64* %15, align 8
  %670 = and i64 %669, 255
  %671 = trunc i64 %670 to i8
  %672 = load i8*, i8** %8, align 8
  %673 = getelementptr inbounds i8, i8* %672, i32 -1
  store i8* %673, i8** %8, align 8
  store i8 %671, i8* %673, align 1
  br label %674

; <label>:674:                                    ; preds = %667, %565
  %pgocount17 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 13)
  %675 = add i64 %pgocount17, 1
  store i64 %675, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 13)
  %676 = load i64, i64* %15, align 8
  %677 = lshr i64 %676, 8
  %678 = and i64 %677, 255
  %679 = trunc i64 %678 to i8
  %680 = load i8*, i8** %8, align 8
  %681 = getelementptr inbounds i8, i8* %680, i32 -1
  store i8* %681, i8** %8, align 8
  store i8 %679, i8* %681, align 1
  br label %682

; <label>:682:                                    ; preds = %674, %565
  %pgocount18 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 11)
  %683 = add i64 %pgocount18, 1
  store i64 %683, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 11)
  %684 = load i64, i64* %15, align 8
  %685 = lshr i64 %684, 16
  %686 = and i64 %685, 255
  %687 = trunc i64 %686 to i8
  %688 = load i8*, i8** %8, align 8
  %689 = getelementptr inbounds i8, i8* %688, i32 -1
  store i8* %689, i8** %8, align 8
  store i8 %687, i8* %689, align 1
  br label %690

; <label>:690:                                    ; preds = %682, %565
  %pgocount19 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 10)
  %691 = add i64 %pgocount19, 1
  store i64 %691, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 10)
  %692 = load i64, i64* %15, align 8
  %693 = lshr i64 %692, 24
  %694 = and i64 %693, 255
  %695 = trunc i64 %694 to i8
  %696 = load i8*, i8** %8, align 8
  %697 = getelementptr inbounds i8, i8* %696, i32 -1
  store i8* %697, i8** %8, align 8
  store i8 %695, i8* %697, align 1
  br label %698

; <label>:698:                                    ; preds = %690, %565
  %pgocount20 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 8)
  %699 = add i64 %pgocount20, 1
  store i64 %699, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 8)
  %700 = load i64, i64* %13, align 8
  store i64 %700, i64* %17, align 8
  %701 = load i64, i64* %14, align 8
  store i64 %701, i64* %18, align 8
  br label %702

; <label>:702:                                    ; preds = %698, %562
  %pgocount21 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 3)
  %703 = add i64 %pgocount21, 1
  store i64 %703, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_BF_cbc_encrypt, i64 0, i64 3)
  %704 = load i64, i64* %17, align 8
  %705 = lshr i64 %704, 24
  %706 = and i64 %705, 255
  %707 = trunc i64 %706 to i8
  %708 = load i8*, i8** %11, align 8
  %709 = getelementptr inbounds i8, i8* %708, i32 1
  store i8* %709, i8** %11, align 8
  store i8 %707, i8* %708, align 1
  %710 = load i64, i64* %17, align 8
  %711 = lshr i64 %710, 16
  %712 = and i64 %711, 255
  %713 = trunc i64 %712 to i8
  %714 = load i8*, i8** %11, align 8
  %715 = getelementptr inbounds i8, i8* %714, i32 1
  store i8* %715, i8** %11, align 8
  store i8 %713, i8* %714, align 1
  %716 = load i64, i64* %17, align 8
  %717 = lshr i64 %716, 8
  %718 = and i64 %717, 255
  %719 = trunc i64 %718 to i8
  %720 = load i8*, i8** %11, align 8
  %721 = getelementptr inbounds i8, i8* %720, i32 1
  store i8* %721, i8** %11, align 8
  store i8 %719, i8* %720, align 1
  %722 = load i64, i64* %17, align 8
  %723 = and i64 %722, 255
  %724 = trunc i64 %723 to i8
  %725 = load i8*, i8** %11, align 8
  %726 = getelementptr inbounds i8, i8* %725, i32 1
  store i8* %726, i8** %11, align 8
  store i8 %724, i8* %725, align 1
  %727 = load i64, i64* %18, align 8
  %728 = lshr i64 %727, 24
  %729 = and i64 %728, 255
  %730 = trunc i64 %729 to i8
  %731 = load i8*, i8** %11, align 8
  %732 = getelementptr inbounds i8, i8* %731, i32 1
  store i8* %732, i8** %11, align 8
  store i8 %730, i8* %731, align 1
  %733 = load i64, i64* %18, align 8
  %734 = lshr i64 %733, 16
  %735 = and i64 %734, 255
  %736 = trunc i64 %735 to i8
  %737 = load i8*, i8** %11, align 8
  %738 = getelementptr inbounds i8, i8* %737, i32 1
  store i8* %738, i8** %11, align 8
  store i8 %736, i8* %737, align 1
  %739 = load i64, i64* %18, align 8
  %740 = lshr i64 %739, 8
  %741 = and i64 %740, 255
  %742 = trunc i64 %741 to i8
  %743 = load i8*, i8** %11, align 8
  %744 = getelementptr inbounds i8, i8* %743, i32 1
  store i8* %744, i8** %11, align 8
  store i8 %742, i8* %743, align 1
  %745 = load i64, i64* %18, align 8
  %746 = and i64 %745, 255
  %747 = trunc i64 %746 to i8
  %748 = load i8*, i8** %11, align 8
  %749 = getelementptr inbounds i8, i8* %748, i32 1
  store i8* %749, i8** %11, align 8
  store i8 %747, i8* %748, align 1
  br label %750

; <label>:750:                                    ; preds = %702, %339
  store i64 0, i64* %18, align 8
  store i64 0, i64* %17, align 8
  store i64 0, i64* %16, align 8
  store i64 0, i64* %15, align 8
  store i64 0, i64* %14, align 8
  store i64 0, i64* %13, align 8
  %751 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 1
  store i64 0, i64* %751, align 8
  %752 = getelementptr inbounds [2 x i64], [2 x i64]* %20, i64 0, i64 0
  store i64 0, i64* %752, align 16
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
