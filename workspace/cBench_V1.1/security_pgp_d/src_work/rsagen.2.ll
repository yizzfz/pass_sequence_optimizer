; ModuleID = 'tmp1.ll'
source_filename = "rsagen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@global_precision = external global i16, align 2
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_rsa_keygen = private constant [10 x i8] c"rsa_keygen"
@__profn_tmp1.ll_derive_rsakeys = private constant [22 x i8] c"tmp1.ll:derive_rsakeys"
@__profc_rsa_keygen = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_rsa_keygen = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4765493536367521871, i64 216903540237, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i32 0, i32 0), i8* bitcast (i32 (i16*, i16*, i16*, i16*, i16*, i16*, i16, i16)* @rsa_keygen to i8*), i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_derive_rsakeys = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_derive_rsakeys = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6630274662670239552, i64 100348946129, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_derive_rsakeys, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [35 x i8] c"!\00rsa_keygen\01tmp1.ll:derive_rsakeys", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_rsa_keygen to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_derive_rsakeys to i8*), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @rsa_keygen(i16*, i16*, i16*, i16*, i16*, i16*, i16 signext, i16 signext) #0 {
  %9 = alloca i32, align 4
  %10 = alloca i16*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca i16*, align 8
  %13 = alloca i16*, align 8
  %14 = alloca i16*, align 8
  %15 = alloca i16*, align 8
  %16 = alloca i16, align 2
  %17 = alloca i16, align 2
  %18 = alloca i16, align 2
  %19 = alloca i16, align 2
  %20 = alloca i8, align 1
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca [130 x i16], align 16
  %24 = alloca i32, align 4
  store i16* %0, i16** %10, align 8
  store i16* %1, i16** %11, align 8
  store i16* %2, i16** %12, align 8
  store i16* %3, i16** %13, align 8
  store i16* %4, i16** %14, align 8
  store i16* %5, i16** %15, align 8
  store i16 %6, i16* %16, align 2
  store i16 %7, i16* %17, align 2
  store i32 1, i32* %22, align 4
  %25 = load i16, i16* %16, align 2
  %26 = sext i16 %25 to i32
  %27 = load i32, i32* %22, align 4
  %28 = sub nsw i32 2080, %27
  %29 = icmp slt i32 %26, %28
  br i1 %29, label %30, label %33

; <label>:30:                                     ; preds = %8
  %31 = load i16, i16* %16, align 2
  %32 = sext i16 %31 to i32
  br label %37

; <label>:33:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 4)
  %34 = add i64 %pgocount, 1
  store i64 %34, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 4)
  %35 = load i32, i32* %22, align 4
  %36 = sub nsw i32 2080, %35
  br label %37

; <label>:37:                                     ; preds = %33, %30
  %38 = phi i32 [ %32, %30 ], [ %36, %33 ]
  %39 = trunc i32 %38 to i16
  store i16 %39, i16* %16, align 2
  %40 = load i16, i16* %16, align 2
  %41 = sext i16 %40 to i32
  %42 = icmp sgt i32 %41, 32
  br i1 %42, label %43, label %46

; <label>:43:                                     ; preds = %37
  %44 = load i16, i16* %16, align 2
  %45 = sext i16 %44 to i32
  br label %48

; <label>:46:                                     ; preds = %37
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 5)
  %47 = add i64 %pgocount1, 1
  store i64 %47, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 5)
  br label %48

; <label>:48:                                     ; preds = %46, %43
  %49 = phi i32 [ %45, %43 ], [ 32, %46 ]
  %50 = trunc i32 %49 to i16
  store i16 %50, i16* %16, align 2
  %51 = load i16, i16* %16, align 2
  %52 = sext i16 %51 to i32
  %53 = icmp sgt i32 %52, 32
  br i1 %53, label %54, label %57

; <label>:54:                                     ; preds = %48
  %55 = load i16, i16* %16, align 2
  %56 = sext i16 %55 to i32
  br label %59

; <label>:57:                                     ; preds = %48
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 6)
  %58 = add i64 %pgocount2, 1
  store i64 %58, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 6)
  br label %59

; <label>:59:                                     ; preds = %57, %54
  %60 = phi i32 [ %56, %54 ], [ 32, %57 ]
  %61 = trunc i32 %60 to i16
  store i16 %61, i16* %16, align 2
  %62 = load i16, i16* %16, align 2
  %63 = sext i16 %62 to i32
  %64 = load i32, i32* %22, align 4
  %65 = add nsw i32 %63, %64
  %66 = add nsw i32 %65, 15
  %67 = ashr i32 %66, 4
  %68 = trunc i32 %67 to i16
  store i16 %68, i16* @global_precision, align 2
  %69 = load i16, i16* %16, align 2
  %70 = sext i16 %69 to i32
  %71 = add nsw i32 %70, 32
  call void @trueRandAccum(i32 %71)
  %72 = load i16, i16* %16, align 2
  %73 = sext i16 %72 to i32
  %74 = sdiv i32 %73, 2
  %75 = trunc i32 %74 to i16
  store i16 %75, i16* %18, align 2
  %76 = load i16, i16* %16, align 2
  %77 = sext i16 %76 to i32
  %78 = load i16, i16* %18, align 2
  %79 = sext i16 %78 to i32
  %80 = sub nsw i32 %77, %79
  %81 = trunc i32 %80 to i16
  store i16 %81, i16* %19, align 2
  %82 = load i16, i16* %18, align 2
  %83 = sext i16 %82 to i32
  call void @trueRandConsume(i32 %83)
  %84 = load i16*, i16** %13, align 8
  %85 = load i16, i16* %18, align 2
  %86 = call i32 @randomprime(i16* %84, i16 signext %85)
  store i32 %86, i32* %21, align 4
  %87 = load i32, i32* %21, align 4
  %88 = icmp slt i32 %87, 0
  br i1 %88, label %89, label %92

; <label>:89:                                     ; preds = %59
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 7)
  %90 = add i64 %pgocount3, 1
  store i64 %90, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 7)
  %91 = load i32, i32* %21, align 4
  store i32 %91, i32* %9, align 4
  br label %249

; <label>:92:                                     ; preds = %59
  %93 = load i16, i16* %16, align 2
  %94 = sext i16 %93 to i32
  %95 = load i16*, i16** %13, align 8
  %96 = call i32 @countbits(i16* %95)
  %97 = sub nsw i32 %94, %96
  %98 = trunc i32 %97 to i16
  store i16 %98, i16* %19, align 2
  %99 = load i16, i16* %19, align 2
  %100 = sext i16 %99 to i32
  call void @trueRandConsume(i32 %100)
  br label %101

; <label>:101:                                    ; preds = %163, %92
  %102 = load i16*, i16** %14, align 8
  %103 = load i16, i16* %19, align 2
  %104 = call i32 @randomprime(i16* %102, i16 signext %103)
  store i32 %104, i32* %21, align 4
  %105 = load i32, i32* %21, align 4
  %106 = icmp slt i32 %105, 0
  br i1 %106, label %107, label %110

; <label>:107:                                    ; preds = %101
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 8)
  %108 = add i64 %pgocount4, 1
  store i64 %108, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 8)
  %109 = load i32, i32* %21, align 4
  store i32 %109, i32* %9, align 4
  br label %249

; <label>:110:                                    ; preds = %101
  %111 = load i16*, i16** %13, align 8
  %112 = load i16*, i16** %14, align 8
  %113 = call signext i16 @mp_compare(i16* %111, i16* %112)
  %114 = sext i16 %113 to i32
  %115 = icmp sge i32 %114, 0
  br i1 %115, label %116, label %142

; <label>:116:                                    ; preds = %110
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 2)
  %117 = add i64 %pgocount5, 1
  store i64 %117, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 2)
  %118 = load i16*, i16** %15, align 8
  %119 = bitcast i16* %118 to i8*
  %120 = load i16*, i16** %13, align 8
  %121 = bitcast i16* %120 to i8*
  %122 = load i16, i16* @global_precision, align 2
  %123 = sext i16 %122 to i32
  %124 = shl i32 %123, 1
  %125 = sext i32 %124 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %119, i8* %121, i64 %125, i32 1, i1 false)
  %126 = load i16*, i16** %13, align 8
  %127 = bitcast i16* %126 to i8*
  %128 = load i16*, i16** %14, align 8
  %129 = bitcast i16* %128 to i8*
  %130 = load i16, i16* @global_precision, align 2
  %131 = sext i16 %130 to i32
  %132 = shl i32 %131, 1
  %133 = sext i32 %132 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %127, i8* %129, i64 %133, i32 1, i1 false)
  %134 = load i16*, i16** %14, align 8
  %135 = bitcast i16* %134 to i8*
  %136 = load i16*, i16** %15, align 8
  %137 = bitcast i16* %136 to i8*
  %138 = load i16, i16* @global_precision, align 2
  %139 = sext i16 %138 to i32
  %140 = shl i32 %139, 1
  %141 = sext i32 %140 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %135, i8* %137, i64 %141, i32 1, i1 false)
  br label %142

; <label>:142:                                    ; preds = %116, %110
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 0)
  %143 = add i64 %pgocount6, 1
  store i64 %143, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 0)
  %144 = load i16*, i16** %15, align 8
  %145 = bitcast i16* %144 to i8*
  %146 = load i16*, i16** %14, align 8
  %147 = bitcast i16* %146 to i8*
  %148 = load i16, i16* @global_precision, align 2
  %149 = sext i16 %148 to i32
  %150 = shl i32 %149, 1
  %151 = sext i32 %150 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %145, i8* %147, i64 %151, i32 1, i1 false)
  %152 = load i16*, i16** %15, align 8
  %153 = load i16*, i16** %13, align 8
  %154 = call zeroext i8 @mp_subb(i16* %152, i16* %153, i8 zeroext 0)
  %155 = load i16*, i16** %15, align 8
  %156 = call i32 @countbits(i16* %155)
  %157 = load i16*, i16** %14, align 8
  %158 = call i32 @countbits(i16* %157)
  %159 = sub nsw i32 %158, 7
  %160 = icmp slt i32 %156, %159
  %161 = zext i1 %160 to i32
  %162 = trunc i32 %161 to i8
  store i8 %162, i8* %20, align 1
  br label %163

; <label>:163:                                    ; preds = %142
  %164 = load i8, i8* %20, align 1
  %165 = icmp ne i8 %164, 0
  br i1 %165, label %101, label %166

; <label>:166:                                    ; preds = %163
  %167 = load i16*, i16** %10, align 8
  %168 = load i16*, i16** %11, align 8
  %169 = load i16*, i16** %12, align 8
  %170 = load i16*, i16** %13, align 8
  %171 = load i16*, i16** %14, align 8
  %172 = load i16*, i16** %15, align 8
  %173 = load i16, i16* %17, align 2
  call void @derive_rsakeys(i16* %167, i16* %168, i16* %169, i16* %170, i16* %171, i16* %172, i16 signext %173)
  call void @trueRandFlush()
  store i32 0, i32* %24, align 4
  br label %174

; <label>:174:                                    ; preds = %188, %166
  %175 = load i32, i32* %24, align 4
  %176 = icmp slt i32 %175, 16
  br i1 %176, label %177, label %191

; <label>:177:                                    ; preds = %174
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 1)
  %178 = add i64 %pgocount7, 1
  store i64 %178, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 1)
  %179 = load i32, i32* %24, align 4
  %180 = mul nsw i32 3, %179
  %181 = add nsw i32 %180, 7
  %182 = trunc i32 %181 to i8
  %183 = getelementptr inbounds [130 x i16], [130 x i16]* %23, i32 0, i32 0
  %184 = bitcast i16* %183 to i8*
  %185 = load i32, i32* %24, align 4
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds i8, i8* %184, i64 %186
  store i8 %182, i8* %187, align 1
  br label %188

; <label>:188:                                    ; preds = %177
  %189 = load i32, i32* %24, align 4
  %190 = add nsw i32 %189, 1
  store i32 %190, i32* %24, align 4
  br label %174

; <label>:191:                                    ; preds = %174
  %192 = getelementptr inbounds [130 x i16], [130 x i16]* %23, i32 0, i32 0
  %193 = getelementptr inbounds [130 x i16], [130 x i16]* %23, i32 0, i32 0
  %194 = bitcast i16* %193 to i8*
  %195 = load i16*, i16** %11, align 8
  %196 = load i16*, i16** %12, align 8
  %197 = load i16*, i16** %13, align 8
  %198 = load i16*, i16** %14, align 8
  %199 = load i16*, i16** %15, align 8
  %200 = load i16*, i16** %10, align 8
  %201 = call i32 @rsa_private_encrypt(i16* %192, i8* %194, i16 signext 16, i16* %195, i16* %196, i16* %197, i16* %198, i16* %199, i16* %200)
  store i32 %201, i32* %21, align 4
  %202 = load i32, i32* %21, align 4
  %203 = icmp slt i32 %202, 0
  br i1 %203, label %204, label %207

; <label>:204:                                    ; preds = %191
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 9)
  %205 = add i64 %pgocount8, 1
  store i64 %205, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 9)
  %206 = load i32, i32* %21, align 4
  store i32 %206, i32* %9, align 4
  br label %249

; <label>:207:                                    ; preds = %191
  %208 = getelementptr inbounds [130 x i16], [130 x i16]* %23, i32 0, i32 0
  %209 = bitcast i16* %208 to i8*
  %210 = getelementptr inbounds [130 x i16], [130 x i16]* %23, i32 0, i32 0
  %211 = load i16*, i16** %11, align 8
  %212 = load i16*, i16** %10, align 8
  %213 = call i32 @rsa_public_decrypt(i8* %209, i16* %210, i16* %211, i16* %212)
  store i32 %213, i32* %21, align 4
  %214 = load i32, i32* %21, align 4
  %215 = icmp slt i32 %214, 0
  br i1 %215, label %216, label %219

; <label>:216:                                    ; preds = %207
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 10)
  %217 = add i64 %pgocount9, 1
  store i64 %217, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 10)
  %218 = load i32, i32* %21, align 4
  store i32 %218, i32* %9, align 4
  br label %249

; <label>:219:                                    ; preds = %207
  %220 = load i32, i32* %21, align 4
  %221 = icmp ne i32 %220, 16
  br i1 %221, label %222, label %224

; <label>:222:                                    ; preds = %219
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 11)
  %223 = add i64 %pgocount10, 1
  store i64 %223, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 11)
  store i32 -15, i32* %9, align 4
  br label %249

; <label>:224:                                    ; preds = %219
  store i32 0, i32* %24, align 4
  br label %225

; <label>:225:                                    ; preds = %243, %224
  %226 = load i32, i32* %24, align 4
  %227 = icmp slt i32 %226, 16
  br i1 %227, label %228, label %247

; <label>:228:                                    ; preds = %225
  %229 = getelementptr inbounds [130 x i16], [130 x i16]* %23, i32 0, i32 0
  %230 = bitcast i16* %229 to i8*
  %231 = load i32, i32* %24, align 4
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds i8, i8* %230, i64 %232
  %234 = load i8, i8* %233, align 1
  %235 = zext i8 %234 to i32
  %236 = load i32, i32* %24, align 4
  %237 = mul nsw i32 3, %236
  %238 = add nsw i32 %237, 7
  %239 = icmp ne i32 %235, %238
  br i1 %239, label %240, label %242

; <label>:240:                                    ; preds = %228
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 13)
  %241 = add i64 %pgocount11, 1
  store i64 %241, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 13)
  store i32 -15, i32* %9, align 4
  br label %249

; <label>:242:                                    ; preds = %228
  br label %243

; <label>:243:                                    ; preds = %242
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 3)
  %244 = add i64 %pgocount12, 1
  store i64 %244, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 3)
  %245 = load i32, i32* %24, align 4
  %246 = add nsw i32 %245, 1
  store i32 %246, i32* %24, align 4
  br label %225

; <label>:247:                                    ; preds = %225
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 12)
  %248 = add i64 %pgocount13, 1
  store i64 %248, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_rsa_keygen, i64 0, i64 12)
  store i32 0, i32* %9, align 4
  br label %249

; <label>:249:                                    ; preds = %247, %240, %222, %216, %204, %107, %89
  %250 = load i32, i32* %9, align 4
  ret i32 %250
}

declare void @trueRandAccum(i32) #1

declare void @trueRandConsume(i32) #1

declare i32 @randomprime(i16*, i16 signext) #1

declare i32 @countbits(i16*) #1

declare signext i16 @mp_compare(i16*, i16*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

declare zeroext i8 @mp_subb(i16*, i16*, i8 zeroext) #1

; Function Attrs: noinline nounwind uwtable
define internal void @derive_rsakeys(i16*, i16*, i16*, i16*, i16*, i16*, i16 signext) #0 {
  %8 = alloca i16*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca i16*, align 8
  %13 = alloca i16*, align 8
  %14 = alloca i16, align 2
  %15 = alloca [130 x i16], align 16
  %16 = alloca i16*, align 8
  %17 = alloca i16*, align 8
  %18 = alloca i16*, align 8
  %19 = alloca i16*, align 8
  %20 = alloca i16*, align 8
  store i16* %0, i16** %8, align 8
  store i16* %1, i16** %9, align 8
  store i16* %2, i16** %10, align 8
  store i16* %3, i16** %11, align 8
  store i16* %4, i16** %12, align 8
  store i16* %5, i16** %13, align 8
  store i16 %6, i16* %14, align 2
  %21 = load i16*, i16** %10, align 8
  store i16* %21, i16** %16, align 8
  %22 = load i16*, i16** %13, align 8
  store i16* %22, i16** %17, align 8
  %23 = load i16*, i16** %8, align 8
  store i16* %23, i16** %18, align 8
  %24 = getelementptr inbounds [130 x i16], [130 x i16]* %15, i32 0, i32 0
  store i16* %24, i16** %19, align 8
  %25 = load i16*, i16** %11, align 8
  %26 = load i16*, i16** %12, align 8
  %27 = call signext i16 @mp_compare(i16* %25, i16* %26)
  %28 = sext i16 %27 to i32
  %29 = icmp sge i32 %28, 0
  br i1 %29, label %30, label %35

; <label>:30:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_derive_rsakeys, i64 0, i64 2)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_derive_rsakeys, i64 0, i64 2)
  %32 = load i16*, i16** %11, align 8
  store i16* %32, i16** %20, align 8
  %33 = load i16*, i16** %12, align 8
  store i16* %33, i16** %11, align 8
  %34 = load i16*, i16** %20, align 8
  store i16* %34, i16** %12, align 8
  br label %35

; <label>:35:                                     ; preds = %30, %7
  %36 = load i16*, i16** %16, align 8
  %37 = bitcast i16* %36 to i8*
  %38 = load i16*, i16** %11, align 8
  %39 = bitcast i16* %38 to i8*
  %40 = load i16, i16* @global_precision, align 2
  %41 = sext i16 %40 to i32
  %42 = shl i32 %41, 1
  %43 = sext i32 %42 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %37, i8* %39, i64 %43, i32 1, i1 false)
  %44 = load i16*, i16** %17, align 8
  %45 = bitcast i16* %44 to i8*
  %46 = load i16*, i16** %12, align 8
  %47 = bitcast i16* %46 to i8*
  %48 = load i16, i16* @global_precision, align 2
  %49 = sext i16 %48 to i32
  %50 = shl i32 %49, 1
  %51 = sext i32 %50 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %45, i8* %47, i64 %51, i32 1, i1 false)
  %52 = load i16*, i16** %16, align 8
  %53 = call zeroext i8 @mp_dec(i16* %52)
  %54 = load i16*, i16** %17, align 8
  %55 = call zeroext i8 @mp_dec(i16* %54)
  %56 = load i16*, i16** %18, align 8
  %57 = load i16*, i16** %16, align 8
  %58 = load i16*, i16** %17, align 8
  %59 = call i32 @mp_mult(i16* %56, i16* %57, i16* %58)
  %60 = load i16*, i16** %19, align 8
  %61 = load i16*, i16** %16, align 8
  %62 = load i16*, i16** %17, align 8
  call void @mp_gcd(i16* %60, i16* %61, i16* %62)
  %63 = load i16*, i16** %16, align 8
  %64 = load i16*, i16** %17, align 8
  %65 = load i16*, i16** %18, align 8
  %66 = load i16*, i16** %19, align 8
  %67 = call i32 @mp_udiv(i16* %63, i16* %64, i16* %65, i16* %66)
  %68 = getelementptr inbounds [130 x i16], [130 x i16]* %15, i32 0, i32 0
  %69 = bitcast i16* %68 to i8*
  %70 = load i16*, i16** %17, align 8
  %71 = bitcast i16* %70 to i8*
  %72 = load i16, i16* @global_precision, align 2
  %73 = sext i16 %72 to i32
  %74 = shl i32 %73, 1
  %75 = sext i32 %74 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %69, i8* %71, i64 %75, i32 1, i1 false)
  %76 = load i16, i16* %14, align 2
  %77 = sext i16 %76 to i32
  %78 = load i16*, i16** %18, align 8
  %79 = call i32 @countbits(i16* %78)
  %80 = sub nsw i32 %79, 1
  %81 = icmp slt i32 %77, %80
  br i1 %81, label %82, label %85

; <label>:82:                                     ; preds = %35
  %83 = load i16, i16* %14, align 2
  %84 = sext i16 %83 to i32
  br label %90

; <label>:85:                                     ; preds = %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_derive_rsakeys, i64 0, i64 3)
  %86 = add i64 %pgocount1, 1
  store i64 %86, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_derive_rsakeys, i64 0, i64 3)
  %87 = load i16*, i16** %18, align 8
  %88 = call i32 @countbits(i16* %87)
  %89 = sub nsw i32 %88, 1
  br label %90

; <label>:90:                                     ; preds = %85, %82
  %91 = phi i32 [ %84, %82 ], [ %89, %85 ]
  %92 = trunc i32 %91 to i16
  store i16 %92, i16* %14, align 2
  %93 = load i16, i16* %14, align 2
  %94 = sext i16 %93 to i32
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %96, label %98

; <label>:96:                                     ; preds = %90
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_derive_rsakeys, i64 0, i64 6)
  %97 = add i64 %pgocount2, 1
  store i64 %97, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_derive_rsakeys, i64 0, i64 6)
  store i16 5, i16* %14, align 2
  br label %98

; <label>:98:                                     ; preds = %96, %90
  %99 = load i16, i16* %14, align 2
  %100 = sext i16 %99 to i32
  %101 = icmp sgt i32 %100, 2
  br i1 %101, label %102, label %106

; <label>:102:                                    ; preds = %98
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_derive_rsakeys, i64 0, i64 4)
  %103 = add i64 %pgocount3, 1
  store i64 %103, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_derive_rsakeys, i64 0, i64 4)
  %104 = load i16, i16* %14, align 2
  %105 = sext i16 %104 to i32
  br label %108

; <label>:106:                                    ; preds = %98
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_derive_rsakeys, i64 0, i64 5)
  %107 = add i64 %pgocount4, 1
  store i64 %107, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_derive_rsakeys, i64 0, i64 5)
  br label %108

; <label>:108:                                    ; preds = %106, %102
  %109 = phi i32 [ %105, %102 ], [ 2, %106 ]
  %110 = trunc i32 %109 to i16
  store i16 %110, i16* %14, align 2
  %111 = load i16*, i16** %9, align 8
  call void @mp_init(i16* %111, i16 zeroext 0)
  %112 = load i16, i16* %14, align 2
  %113 = sext i16 %112 to i32
  %114 = sub nsw i32 %113, 1
  %115 = and i32 %114, 15
  %116 = shl i32 1, %115
  %117 = load i16*, i16** %9, align 8
  %118 = load i16, i16* %14, align 2
  %119 = sext i16 %118 to i32
  %120 = sub nsw i32 %119, 1
  %121 = add nsw i32 %120, 1
  %122 = add nsw i32 %121, 15
  %123 = ashr i32 %122, 4
  %124 = sub nsw i32 %123, 1
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i16, i16* %117, i64 %125
  %127 = load i16, i16* %126, align 2
  %128 = zext i16 %127 to i32
  %129 = or i32 %128, %116
  %130 = trunc i32 %129 to i16
  store i16 %130, i16* %126, align 2
  %131 = load i16*, i16** %9, align 8
  %132 = load i16, i16* %131, align 2
  %133 = zext i16 %132 to i32
  %134 = or i32 %133, 1
  %135 = trunc i32 %134 to i16
  store i16 %135, i16* %131, align 2
  %136 = load i16*, i16** %9, align 8
  %137 = call zeroext i8 @mp_dec(i16* %136)
  %138 = load i16*, i16** %9, align 8
  %139 = call zeroext i8 @mp_dec(i16* %138)
  br label %140

; <label>:140:                                    ; preds = %160, %108
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_derive_rsakeys, i64 0, i64 0)
  %141 = add i64 %pgocount5, 1
  store i64 %141, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_derive_rsakeys, i64 0, i64 0)
  %142 = load i16*, i16** %9, align 8
  %143 = call zeroext i8 @mp_inc(i16* %142)
  %144 = load i16*, i16** %9, align 8
  %145 = call zeroext i8 @mp_inc(i16* %144)
  %146 = load i16*, i16** %16, align 8
  %147 = load i16*, i16** %9, align 8
  %148 = load i16*, i16** %18, align 8
  call void @mp_gcd(i16* %146, i16* %147, i16* %148)
  br label %149

; <label>:149:                                    ; preds = %140
  %150 = load i16*, i16** %16, align 8
  %151 = load i16, i16* %150, align 2
  %152 = zext i16 %151 to i32
  %153 = icmp ne i32 %152, 1
  br i1 %153, label %160, label %154

; <label>:154:                                    ; preds = %149
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_derive_rsakeys, i64 0, i64 1)
  %155 = add i64 %pgocount6, 1
  store i64 %155, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_derive_rsakeys, i64 0, i64 1)
  %156 = load i16*, i16** %16, align 8
  %157 = call signext i16 @significance(i16* %156)
  %158 = sext i16 %157 to i32
  %159 = icmp sgt i32 %158, 1
  br label %160

; <label>:160:                                    ; preds = %154, %149
  %161 = phi i1 [ true, %149 ], [ %159, %154 ]
  br i1 %161, label %140, label %162

; <label>:162:                                    ; preds = %160
  %163 = load i16*, i16** %10, align 8
  %164 = load i16*, i16** %9, align 8
  %165 = getelementptr inbounds [130 x i16], [130 x i16]* %15, i32 0, i32 0
  call void @mp_inv(i16* %163, i16* %164, i16* %165)
  %166 = load i16*, i16** %13, align 8
  %167 = load i16*, i16** %11, align 8
  %168 = load i16*, i16** %12, align 8
  call void @mp_inv(i16* %166, i16* %167, i16* %168)
  %169 = load i16*, i16** %8, align 8
  %170 = load i16*, i16** %11, align 8
  %171 = load i16*, i16** %12, align 8
  %172 = call i32 @mp_mult(i16* %169, i16* %170, i16* %171)
  %173 = getelementptr inbounds [130 x i16], [130 x i16]* %15, i32 0, i32 0
  call void @mp_init(i16* %173, i16 zeroext 0)
  ret void
}

declare void @trueRandFlush() #1

declare i32 @rsa_private_encrypt(i16*, i8*, i16 signext, i16*, i16*, i16*, i16*, i16*, i16*) #1

declare i32 @rsa_public_decrypt(i8*, i16*, i16*, i16*) #1

declare zeroext i8 @mp_dec(i16*) #1

declare i32 @mp_mult(i16*, i16*, i16*) #1

declare void @mp_gcd(i16*, i16*, i16*) #1

declare i32 @mp_udiv(i16*, i16*, i16*, i16*) #1

declare void @mp_init(i16*, i16 zeroext) #1

declare zeroext i8 @mp_inc(i16*) #1

declare signext i16 @significance(i16*) #1

declare void @mp_inv(i16*, i16*, i16*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
