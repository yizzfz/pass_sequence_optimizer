; ModuleID = 'tmp1.ll'
source_filename = "rsaglue1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@signon_legalese = global [1 x i8] zeroinitializer, align 1
@global_precision = external global i16, align 2
@asn_array = internal global [18 x i8] c"0 0\0C\06\08*\86H\86\F7\0D\02\05\05\00\04\10", align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_rsa_public_encrypt = private constant [18 x i8] c"rsa_public_encrypt"
@__profn_rsa_private_encrypt = private constant [19 x i8] c"rsa_private_encrypt"
@__profn_rsa_public_decrypt = private constant [18 x i8] c"rsa_public_decrypt"
@__profn_rsa_private_decrypt = private constant [19 x i8] c"rsa_private_decrypt"
@__profc_rsa_public_encrypt = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_rsa_public_encrypt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6882389097932515258, i64 113349036585, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rsa_public_encrypt, i32 0, i32 0), i8* bitcast (i32 (i16*, i8*, i16, i16*, i16*)* @rsa_public_encrypt to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_rsa_private_encrypt = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_rsa_private_encrypt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6037877781138037531, i64 62399652527, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_rsa_private_encrypt, i32 0, i32 0), i8* bitcast (i32 (i16*, i8*, i16, i16*, i16*, i16*, i16*, i16*, i16*)* @rsa_private_encrypt to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_rsa_public_decrypt = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_rsa_public_decrypt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5605786425181997896, i64 233231350511, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i32 0, i32 0), i8* bitcast (i32 (i8*, i16*, i16*, i16*)* @rsa_public_decrypt to i8*), i8* null, i32 17, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_rsa_private_decrypt = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_rsa_private_decrypt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 659923197440763435, i64 172825267363, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i32 0, i32 0), i8* bitcast (i32 (i8*, i16*, i16*, i16*, i16*, i16*, i16*, i16*)* @rsa_private_decrypt to i8*), i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [79 x i8] c"M\00rsa_public_encrypt\01rsa_private_encrypt\01rsa_public_decrypt\01rsa_private_decrypt", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_rsa_public_encrypt to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_rsa_private_encrypt to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_rsa_public_decrypt to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_rsa_private_decrypt to i8*), i8* getelementptr inbounds ([79 x i8], [79 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @rsa_public_encrypt(i16*, i8*, i16 signext, i16*, i16*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i16*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i16, align 2
  %10 = alloca i16*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca [130 x i16], align 16
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  store i16* %0, i16** %7, align 8
  store i8* %1, i8** %8, align 8
  store i16 %2, i16* %9, align 2
  store i16* %3, i16** %10, align 8
  store i16* %4, i16** %11, align 8
  %16 = getelementptr inbounds [130 x i16], [130 x i16]* %12, i32 0, i32 0
  %17 = bitcast i16* %16 to i8*
  store i8* %17, i8** %15, align 8
  %18 = load i16*, i16** %11, align 8
  %19 = call i32 @countbits(i16* %18)
  %20 = add nsw i32 %19, 7
  %21 = ashr i32 %20, 3
  %22 = sub nsw i32 %21, 1
  store i32 %22, i32* %13, align 4
  %23 = load i16, i16* @global_precision, align 2
  %24 = sext i16 %23 to i32
  %25 = shl i32 %24, 1
  %26 = load i32, i32* %13, align 4
  %27 = sub i32 %25, %26
  store i32 %27, i32* %14, align 4
  br label %28

; <label>:28:                                     ; preds = %35, %5
  %29 = load i32, i32* %14, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %38

; <label>:31:                                     ; preds = %28
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rsa_public_encrypt, i64 0, i64 0)
  %32 = add i64 %pgocount, 1
  store i64 %32, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rsa_public_encrypt, i64 0, i64 0)
  %33 = load i8*, i8** %15, align 8
  %34 = getelementptr inbounds i8, i8* %33, i32 1
  store i8* %34, i8** %15, align 8
  store i8 0, i8* %33, align 1
  br label %35

; <label>:35:                                     ; preds = %31
  %36 = load i32, i32* %14, align 4
  %37 = add nsw i32 %36, -1
  store i32 %37, i32* %14, align 4
  br label %28

; <label>:38:                                     ; preds = %28
  %39 = load i32, i32* %13, align 4
  %40 = sub i32 %39, 2
  %41 = load i16, i16* %9, align 2
  %42 = sext i16 %41 to i32
  %43 = sub i32 %40, %42
  store i32 %43, i32* %14, align 4
  %44 = load i32, i32* %14, align 4
  %45 = icmp slt i32 %44, 1
  br i1 %45, label %46, label %48

; <label>:46:                                     ; preds = %38
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rsa_public_encrypt, i64 0, i64 4)
  %47 = add i64 %pgocount1, 1
  store i64 %47, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rsa_public_encrypt, i64 0, i64 4)
  store i32 -4, i32* %6, align 4
  br label %100

; <label>:48:                                     ; preds = %38
  %49 = load i8*, i8** %15, align 8
  %50 = getelementptr inbounds i8, i8* %49, i32 1
  store i8* %50, i8** %15, align 8
  store i8 2, i8* %49, align 1
  br label %51

; <label>:51:                                     ; preds = %65, %48
  %52 = load i32, i32* %14, align 4
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %66

; <label>:54:                                     ; preds = %51
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rsa_public_encrypt, i64 0, i64 1)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rsa_public_encrypt, i64 0, i64 1)
  %56 = call zeroext i8 @cryptRandByte()
  %57 = load i8*, i8** %15, align 8
  store i8 %56, i8* %57, align 1
  %58 = icmp ne i8 %56, 0
  br i1 %58, label %59, label %65

; <label>:59:                                     ; preds = %54
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rsa_public_encrypt, i64 0, i64 2)
  %60 = add i64 %pgocount3, 1
  store i64 %60, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rsa_public_encrypt, i64 0, i64 2)
  %61 = load i8*, i8** %15, align 8
  %62 = getelementptr inbounds i8, i8* %61, i32 1
  store i8* %62, i8** %15, align 8
  %63 = load i32, i32* %14, align 4
  %64 = add nsw i32 %63, -1
  store i32 %64, i32* %14, align 4
  br label %65

; <label>:65:                                     ; preds = %59, %54
  br label %51

; <label>:66:                                     ; preds = %51
  %67 = load i8*, i8** %15, align 8
  %68 = getelementptr inbounds i8, i8* %67, i32 1
  store i8* %68, i8** %15, align 8
  store i8 0, i8* %67, align 1
  %69 = load i8*, i8** %15, align 8
  %70 = load i8*, i8** %8, align 8
  %71 = load i16, i16* %9, align 2
  %72 = sext i16 %71 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %69, i8* %70, i64 %72, i32 1, i1 false)
  %73 = getelementptr inbounds [130 x i16], [130 x i16]* %12, i32 0, i32 0
  %74 = bitcast i16* %73 to i8*
  %75 = load i16, i16* @global_precision, align 2
  %76 = sext i16 %75 to i32
  %77 = shl i32 %76, 1
  %78 = trunc i32 %77 to i16
  call void @hiloswap(i8* %74, i16 signext %78)
  %79 = load i16*, i16** %7, align 8
  %80 = getelementptr inbounds [130 x i16], [130 x i16]* %12, i32 0, i32 0
  %81 = load i16*, i16** %10, align 8
  %82 = load i16*, i16** %11, align 8
  %83 = call i32 @mp_modexp(i16* %79, i16* %80, i16* %81, i16* %82)
  store i32 %83, i32* %14, align 4
  %84 = load i32, i32* %14, align 4
  %85 = icmp slt i32 %84, 0
  br i1 %85, label %86, label %88

; <label>:86:                                     ; preds = %66
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rsa_public_encrypt, i64 0, i64 5)
  %87 = add i64 %pgocount4, 1
  store i64 %87, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rsa_public_encrypt, i64 0, i64 5)
  store i32 -1, i32* %14, align 4
  br label %88

; <label>:88:                                     ; preds = %86, %66
  br label %89

; <label>:89:                                     ; preds = %88
  %90 = getelementptr inbounds [130 x i16], [130 x i16]* %12, i32 0, i32 0
  call void @mp_init(i16* %90, i16 zeroext 0)
  %91 = load i32, i32* %14, align 4
  %92 = icmp slt i32 %91, 0
  br i1 %92, label %93, label %96

; <label>:93:                                     ; preds = %89
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rsa_public_encrypt, i64 0, i64 6)
  %94 = add i64 %pgocount5, 1
  store i64 %94, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rsa_public_encrypt, i64 0, i64 6)
  %95 = load i32, i32* %14, align 4
  br label %98

; <label>:96:                                     ; preds = %89
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rsa_public_encrypt, i64 0, i64 3)
  %97 = add i64 %pgocount6, 1
  store i64 %97, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_rsa_public_encrypt, i64 0, i64 3)
  br label %98

; <label>:98:                                     ; preds = %96, %93
  %99 = phi i32 [ %95, %93 ], [ 0, %96 ]
  store i32 %99, i32* %6, align 4
  br label %100

; <label>:100:                                    ; preds = %98, %46
  %101 = load i32, i32* %6, align 4
  ret i32 %101
}

declare i32 @countbits(i16*) #1

declare zeroext i8 @cryptRandByte() #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

declare void @hiloswap(i8*, i16 signext) #1

declare i32 @mp_modexp(i16*, i16*, i16*, i16*) #1

declare void @mp_init(i16*, i16 zeroext) #1

; Function Attrs: noinline nounwind uwtable
define i32 @rsa_private_encrypt(i16*, i8*, i16 signext, i16*, i16*, i16*, i16*, i16*, i16*) #0 {
  %10 = alloca i16*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i16, align 2
  %13 = alloca i16*, align 8
  %14 = alloca i16*, align 8
  %15 = alloca i16*, align 8
  %16 = alloca i16*, align 8
  %17 = alloca i16*, align 8
  %18 = alloca i16*, align 8
  %19 = alloca [130 x i16], align 16
  %20 = alloca [130 x i16], align 16
  %21 = alloca [130 x i16], align 16
  %22 = alloca i8*, align 8
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  store i16* %0, i16** %10, align 8
  store i8* %1, i8** %11, align 8
  store i16 %2, i16* %12, align 2
  store i16* %3, i16** %13, align 8
  store i16* %4, i16** %14, align 8
  store i16* %5, i16** %15, align 8
  store i16* %6, i16** %16, align 8
  store i16* %7, i16** %17, align 8
  store i16* %8, i16** %18, align 8
  %25 = getelementptr inbounds [130 x i16], [130 x i16]* %19, i32 0, i32 0
  %26 = bitcast i16* %25 to i8*
  %27 = load i16*, i16** %15, align 8
  %28 = bitcast i16* %27 to i8*
  %29 = load i16, i16* @global_precision, align 2
  %30 = sext i16 %29 to i32
  %31 = shl i32 %30, 1
  %32 = sext i32 %31 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* %28, i64 %32, i32 1, i1 false)
  %33 = getelementptr inbounds [130 x i16], [130 x i16]* %19, i32 0, i32 0
  %34 = call zeroext i8 @mp_dec(i16* %33)
  %35 = getelementptr inbounds [130 x i16], [130 x i16]* %20, i32 0, i32 0
  %36 = load i16*, i16** %14, align 8
  %37 = getelementptr inbounds [130 x i16], [130 x i16]* %19, i32 0, i32 0
  %38 = call i32 @mp_mod(i16* %35, i16* %36, i16* %37)
  %39 = getelementptr inbounds [130 x i16], [130 x i16]* %19, i32 0, i32 0
  %40 = bitcast i16* %39 to i8*
  %41 = load i16*, i16** %16, align 8
  %42 = bitcast i16* %41 to i8*
  %43 = load i16, i16* @global_precision, align 2
  %44 = sext i16 %43 to i32
  %45 = shl i32 %44, 1
  %46 = sext i32 %45 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %40, i8* %42, i64 %46, i32 1, i1 false)
  %47 = getelementptr inbounds [130 x i16], [130 x i16]* %19, i32 0, i32 0
  %48 = call zeroext i8 @mp_dec(i16* %47)
  %49 = getelementptr inbounds [130 x i16], [130 x i16]* %21, i32 0, i32 0
  %50 = load i16*, i16** %14, align 8
  %51 = getelementptr inbounds [130 x i16], [130 x i16]* %19, i32 0, i32 0
  %52 = call i32 @mp_mod(i16* %49, i16* %50, i16* %51)
  %53 = getelementptr inbounds [130 x i16], [130 x i16]* %19, i32 0, i32 0
  %54 = bitcast i16* %53 to i8*
  store i8* %54, i8** %22, align 8
  %55 = load i16*, i16** %18, align 8
  %56 = call i32 @countbits(i16* %55)
  %57 = add nsw i32 %56, 7
  %58 = ashr i32 %57, 3
  %59 = sub nsw i32 %58, 1
  store i32 %59, i32* %24, align 4
  %60 = load i16, i16* @global_precision, align 2
  %61 = sext i16 %60 to i32
  %62 = shl i32 %61, 1
  %63 = load i32, i32* %24, align 4
  %64 = sub i32 %62, %63
  store i32 %64, i32* %23, align 4
  br label %65

; <label>:65:                                     ; preds = %72, %9
  %66 = load i32, i32* %23, align 4
  %67 = icmp sgt i32 %66, 0
  br i1 %67, label %68, label %75

; <label>:68:                                     ; preds = %65
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_rsa_private_encrypt, i64 0, i64 0)
  %69 = add i64 %pgocount, 1
  store i64 %69, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_rsa_private_encrypt, i64 0, i64 0)
  %70 = load i8*, i8** %22, align 8
  %71 = getelementptr inbounds i8, i8* %70, i32 1
  store i8* %71, i8** %22, align 8
  store i8 0, i8* %70, align 1
  br label %72

; <label>:72:                                     ; preds = %68
  %73 = load i32, i32* %23, align 4
  %74 = add nsw i32 %73, -1
  store i32 %74, i32* %23, align 4
  br label %65

; <label>:75:                                     ; preds = %65
  %76 = load i32, i32* %24, align 4
  %77 = sub i32 %76, 2
  %78 = load i16, i16* %12, align 2
  %79 = sext i16 %78 to i32
  %80 = sub i32 %77, %79
  store i32 %80, i32* %23, align 4
  %81 = load i32, i32* %23, align 4
  %82 = sext i32 %81 to i64
  %83 = sub i64 %82, 18
  %84 = trunc i64 %83 to i32
  store i32 %84, i32* %23, align 4
  %85 = load i32, i32* %23, align 4
  %86 = icmp slt i32 %85, 0
  br i1 %86, label %87, label %89

; <label>:87:                                     ; preds = %75
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_rsa_private_encrypt, i64 0, i64 2)
  %88 = add i64 %pgocount1, 1
  store i64 %88, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_rsa_private_encrypt, i64 0, i64 2)
  store i32 -4, i32* %23, align 4
  br label %128

; <label>:89:                                     ; preds = %75
  %90 = load i8*, i8** %22, align 8
  %91 = getelementptr inbounds i8, i8* %90, i32 1
  store i8* %91, i8** %22, align 8
  store i8 1, i8* %90, align 1
  %92 = load i8*, i8** %22, align 8
  %93 = load i32, i32* %23, align 4
  %94 = sext i32 %93 to i64
  call void @llvm.memset.p0i8.i64(i8* %92, i8 -1, i64 %94, i32 1, i1 false)
  %95 = load i32, i32* %23, align 4
  %96 = load i8*, i8** %22, align 8
  %97 = sext i32 %95 to i64
  %98 = getelementptr inbounds i8, i8* %96, i64 %97
  store i8* %98, i8** %22, align 8
  %99 = load i8*, i8** %22, align 8
  %100 = getelementptr inbounds i8, i8* %99, i32 1
  store i8* %100, i8** %22, align 8
  store i8 0, i8* %99, align 1
  %101 = load i8*, i8** %22, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %101, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @asn_array, i32 0, i32 0), i64 18, i32 1, i1 false)
  %102 = load i8*, i8** %22, align 8
  %103 = getelementptr inbounds i8, i8* %102, i64 18
  store i8* %103, i8** %22, align 8
  %104 = load i8*, i8** %22, align 8
  %105 = load i8*, i8** %11, align 8
  %106 = load i16, i16* %12, align 2
  %107 = sext i16 %106 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %104, i8* %105, i64 %107, i32 1, i1 false)
  %108 = getelementptr inbounds [130 x i16], [130 x i16]* %19, i32 0, i32 0
  %109 = bitcast i16* %108 to i8*
  %110 = load i16, i16* @global_precision, align 2
  %111 = sext i16 %110 to i32
  %112 = shl i32 %111, 1
  %113 = trunc i32 %112 to i16
  call void @hiloswap(i8* %109, i16 signext %113)
  %114 = load i16*, i16** %10, align 8
  %115 = getelementptr inbounds [130 x i16], [130 x i16]* %19, i32 0, i32 0
  %116 = load i16*, i16** %15, align 8
  %117 = load i16*, i16** %16, align 8
  %118 = getelementptr inbounds [130 x i16], [130 x i16]* %20, i32 0, i32 0
  %119 = getelementptr inbounds [130 x i16], [130 x i16]* %21, i32 0, i32 0
  %120 = load i16*, i16** %17, align 8
  %121 = call i32 @mp_modexp_crt(i16* %114, i16* %115, i16* %116, i16* %117, i16* %118, i16* %119, i16* %120)
  store i32 %121, i32* %23, align 4
  %122 = load i32, i32* %23, align 4
  %123 = icmp slt i32 %122, 0
  br i1 %123, label %124, label %126

; <label>:124:                                    ; preds = %89
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_rsa_private_encrypt, i64 0, i64 3)
  %125 = add i64 %pgocount2, 1
  store i64 %125, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_rsa_private_encrypt, i64 0, i64 3)
  store i32 -1, i32* %23, align 4
  br label %126

; <label>:126:                                    ; preds = %124, %89
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_rsa_private_encrypt, i64 0, i64 1)
  %127 = add i64 %pgocount3, 1
  store i64 %127, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_rsa_private_encrypt, i64 0, i64 1)
  br label %128

; <label>:128:                                    ; preds = %126, %87
  %129 = bitcast [130 x i16]* %19 to i8*
  call void @llvm.memset.p0i8.i64(i8* %129, i8 0, i64 260, i32 16, i1 false)
  %130 = load i32, i32* %23, align 4
  ret i32 %130
}

declare zeroext i8 @mp_dec(i16*) #1

declare i32 @mp_mod(i16*, i16*, i16*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

declare i32 @mp_modexp_crt(i16*, i16*, i16*, i16*, i16*, i16*, i16*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @rsa_public_decrypt(i8*, i16*, i16*, i16*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca [130 x i16], align 16
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  store i8* %0, i8** %6, align 8
  store i16* %1, i16** %7, align 8
  store i16* %2, i16** %8, align 8
  store i16* %3, i16** %9, align 8
  %15 = getelementptr inbounds [130 x i16], [130 x i16]* %10, i32 0, i32 0
  %16 = load i16*, i16** %7, align 8
  %17 = load i16*, i16** %8, align 8
  %18 = load i16*, i16** %9, align 8
  %19 = call i32 @mp_modexp(i16* %15, i16* %16, i16* %17, i16* %18)
  store i32 %19, i32* %12, align 4
  %20 = load i32, i32* %12, align 4
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %22, label %25

; <label>:22:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 2)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 2)
  %24 = getelementptr inbounds [130 x i16], [130 x i16]* %10, i32 0, i32 0
  call void @mp_init(i16* %24, i16 zeroext 0)
  store i32 -1, i32* %5, align 4
  br label %181

; <label>:25:                                     ; preds = %4
  %26 = getelementptr inbounds [130 x i16], [130 x i16]* %10, i32 0, i32 0
  %27 = bitcast i16* %26 to i8*
  %28 = load i16, i16* @global_precision, align 2
  %29 = sext i16 %28 to i32
  %30 = shl i32 %29, 1
  %31 = trunc i32 %30 to i16
  call void @hiloswap(i8* %27, i16 signext %31)
  %32 = load i16*, i16** %9, align 8
  %33 = call i32 @countbits(i16* %32)
  %34 = add nsw i32 %33, 7
  %35 = ashr i32 %34, 3
  %36 = sub nsw i32 %35, 1
  store i32 %36, i32* %11, align 4
  %37 = getelementptr inbounds [130 x i16], [130 x i16]* %10, i32 0, i32 0
  %38 = bitcast i16* %37 to i8*
  store i8* %38, i8** %13, align 8
  %39 = load i16, i16* @global_precision, align 2
  %40 = sext i16 %39 to i32
  %41 = shl i32 %40, 1
  store i32 %41, i32* %12, align 4
  %42 = load i8*, i8** %13, align 8
  %43 = load i32, i32* %12, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8* %42, i64 %44
  store i8* %45, i8** %14, align 8
  %46 = load i16*, i16** %9, align 8
  %47 = call i32 @countbits(i16* %46)
  %48 = add nsw i32 %47, 7
  %49 = ashr i32 %48, 3
  %50 = sub nsw i32 %49, 1
  %51 = load i32, i32* %12, align 4
  %52 = sub nsw i32 %51, %50
  store i32 %52, i32* %12, align 4
  %53 = load i32, i32* %12, align 4
  %54 = icmp slt i32 %53, 0
  br i1 %54, label %55, label %57

; <label>:55:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 3)
  %56 = add i64 %pgocount1, 1
  store i64 %56, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 3)
  br label %179

; <label>:57:                                     ; preds = %25
  br label %58

; <label>:58:                                     ; preds = %69, %57
  %59 = load i32, i32* %12, align 4
  %60 = add nsw i32 %59, -1
  store i32 %60, i32* %12, align 4
  %61 = icmp ne i32 %59, 0
  br i1 %61, label %62, label %71

; <label>:62:                                     ; preds = %58
  %63 = load i8*, i8** %13, align 8
  %64 = getelementptr inbounds i8, i8* %63, i32 1
  store i8* %64, i8** %13, align 8
  %65 = load i8, i8* %63, align 1
  %66 = icmp ne i8 %65, 0
  br i1 %66, label %67, label %69

; <label>:67:                                     ; preds = %62
  %pgocount2 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 4)
  %68 = add i64 %pgocount2, 1
  store i64 %68, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 4)
  br label %179

; <label>:69:                                     ; preds = %62
  %pgocount3 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 0)
  %70 = add i64 %pgocount3, 1
  store i64 %70, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 0)
  br label %58

; <label>:71:                                     ; preds = %58
  %72 = load i8*, i8** %14, align 8
  %73 = getelementptr inbounds i8, i8* %72, i64 -1
  %74 = load i8, i8* %73, align 1
  %75 = zext i8 %74 to i32
  %76 = icmp eq i32 %75, 1
  br i1 %76, label %77, label %125

; <label>:77:                                     ; preds = %71
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 6)
  %78 = add i64 %pgocount4, 1
  store i64 %78, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 6)
  %79 = load i8*, i8** %14, align 8
  %80 = getelementptr inbounds i8, i8* %79, i64 -17
  %81 = load i8, i8* %80, align 1
  %82 = zext i8 %81 to i32
  %83 = icmp eq i32 %82, 255
  br i1 %83, label %84, label %125

; <label>:84:                                     ; preds = %77
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 9)
  %85 = add i64 %pgocount5, 1
  store i64 %85, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 9)
  %86 = load i8*, i8** %14, align 8
  %87 = getelementptr inbounds i8, i8* %86, i64 -18
  %88 = load i8, i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = icmp eq i32 %89, 255
  br i1 %90, label %91, label %125

; <label>:91:                                     ; preds = %84
  %92 = load i8*, i8** %14, align 8
  %93 = getelementptr inbounds i8, i8* %92, i32 -1
  store i8* %93, i8** %14, align 8
  %94 = load i8, i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = icmp ne i32 %95, 1
  br i1 %96, label %97, label %99

; <label>:97:                                     ; preds = %91
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 11)
  %98 = add i64 %pgocount6, 1
  store i64 %98, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 11)
  br label %179

; <label>:99:                                     ; preds = %91
  %100 = load i8*, i8** %13, align 8
  %101 = getelementptr inbounds i8, i8* %100, i32 1
  store i8* %101, i8** %13, align 8
  %102 = load i8, i8* %100, align 1
  %103 = zext i8 %102 to i32
  %104 = icmp ne i32 %103, 1
  br i1 %104, label %105, label %108

; <label>:105:                                    ; preds = %99
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 14)
  %106 = add i64 %pgocount7, 1
  store i64 %106, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 14)
  %107 = getelementptr inbounds [130 x i16], [130 x i16]* %10, i32 0, i32 0
  call void @mp_init(i16* %107, i16 zeroext 0)
  store i32 -7, i32* %5, align 4
  br label %181

; <label>:108:                                    ; preds = %99
  br label %109

; <label>:109:                                    ; preds = %115, %108
  %110 = load i8*, i8** %14, align 8
  %111 = getelementptr inbounds i8, i8* %110, i32 -1
  store i8* %111, i8** %14, align 8
  %112 = load i8, i8* %111, align 1
  %113 = zext i8 %112 to i32
  %114 = icmp eq i32 %113, 255
  br i1 %114, label %115, label %117

; <label>:115:                                    ; preds = %109
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 5)
  %116 = add i64 %pgocount8, 1
  store i64 %116, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 5)
  br label %109

; <label>:117:                                    ; preds = %109
  %118 = load i8*, i8** %14, align 8
  %119 = load i8, i8* %118, align 1
  %120 = icmp ne i8 %119, 0
  br i1 %120, label %121, label %123

; <label>:121:                                    ; preds = %117
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 15)
  %122 = add i64 %pgocount9, 1
  store i64 %122, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 15)
  br label %179

; <label>:123:                                    ; preds = %117
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 16)
  %124 = add i64 %pgocount10, 1
  store i64 %124, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 16)
  br label %159

; <label>:125:                                    ; preds = %84, %77, %71
  %126 = load i8*, i8** %13, align 8
  %127 = getelementptr inbounds i8, i8* %126, i32 1
  store i8* %127, i8** %13, align 8
  %128 = load i8, i8* %126, align 1
  %129 = zext i8 %128 to i32
  %130 = icmp ne i32 %129, 1
  br i1 %130, label %131, label %133

; <label>:131:                                    ; preds = %125
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 7)
  %132 = add i64 %pgocount11, 1
  store i64 %132, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 7)
  br label %179

; <label>:133:                                    ; preds = %125
  br label %134

; <label>:134:                                    ; preds = %140, %133
  %135 = load i8*, i8** %13, align 8
  %136 = getelementptr inbounds i8, i8* %135, i32 1
  store i8* %136, i8** %13, align 8
  %137 = load i8, i8* %135, align 1
  %138 = zext i8 %137 to i32
  %139 = icmp eq i32 %138, 255
  br i1 %139, label %140, label %142

; <label>:140:                                    ; preds = %134
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 1)
  %141 = add i64 %pgocount12, 1
  store i64 %141, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 1)
  br label %134

; <label>:142:                                    ; preds = %134
  %143 = load i8*, i8** %13, align 8
  %144 = getelementptr inbounds i8, i8* %143, i64 -1
  %145 = load i8, i8* %144, align 1
  %146 = icmp ne i8 %145, 0
  br i1 %146, label %147, label %149

; <label>:147:                                    ; preds = %142
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 8)
  %148 = add i64 %pgocount13, 1
  store i64 %148, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 8)
  br label %179

; <label>:149:                                    ; preds = %142
  %150 = load i8*, i8** %13, align 8
  %151 = call i32 @memcmp(i8* %150, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @asn_array, i32 0, i32 0), i64 18) #5
  %152 = icmp ne i32 %151, 0
  br i1 %152, label %153, label %156

; <label>:153:                                    ; preds = %149
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 10)
  %154 = add i64 %pgocount14, 1
  store i64 %154, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 10)
  %155 = getelementptr inbounds [130 x i16], [130 x i16]* %10, i32 0, i32 0
  call void @mp_init(i16* %155, i16 zeroext 0)
  store i32 -7, i32* %5, align 4
  br label %181

; <label>:156:                                    ; preds = %149
  %157 = load i8*, i8** %13, align 8
  %158 = getelementptr inbounds i8, i8* %157, i64 18
  store i8* %158, i8** %13, align 8
  br label %159

; <label>:159:                                    ; preds = %156, %123
  %160 = load i8*, i8** %14, align 8
  %161 = load i8*, i8** %13, align 8
  %162 = icmp ult i8* %160, %161
  br i1 %162, label %163, label %165

; <label>:163:                                    ; preds = %159
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 12)
  %164 = add i64 %pgocount15, 1
  store i64 %164, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 12)
  br label %179

; <label>:165:                                    ; preds = %159
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 13)
  %166 = add i64 %pgocount16, 1
  store i64 %166, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_rsa_public_decrypt, i64 0, i64 13)
  %167 = load i8*, i8** %14, align 8
  %168 = load i8*, i8** %13, align 8
  %169 = ptrtoint i8* %167 to i64
  %170 = ptrtoint i8* %168 to i64
  %171 = sub i64 %169, %170
  %172 = trunc i64 %171 to i32
  store i32 %172, i32* %11, align 4
  %173 = load i8*, i8** %6, align 8
  %174 = load i8*, i8** %13, align 8
  %175 = load i32, i32* %11, align 4
  %176 = zext i32 %175 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %173, i8* %174, i64 %176, i32 1, i1 false)
  %177 = getelementptr inbounds [130 x i16], [130 x i16]* %10, i32 0, i32 0
  call void @mp_init(i16* %177, i16 zeroext 0)
  %178 = load i32, i32* %11, align 4
  store i32 %178, i32* %5, align 4
  br label %181

; <label>:179:                                    ; preds = %163, %147, %131, %121, %97, %67, %55
  %180 = getelementptr inbounds [130 x i16], [130 x i16]* %10, i32 0, i32 0
  call void @mp_init(i16* %180, i16 zeroext 0)
  store i32 -9, i32* %5, align 4
  br label %181

; <label>:181:                                    ; preds = %179, %165, %153, %105, %22
  %182 = load i32, i32* %5, align 4
  ret i32 %182
}

; Function Attrs: nounwind readonly
declare i32 @memcmp(i8*, i8*, i64) #3

; Function Attrs: noinline nounwind uwtable
define i32 @rsa_private_decrypt(i8*, i16*, i16*, i16*, i16*, i16*, i16*, i16*) #0 {
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca i16*, align 8
  %13 = alloca i16*, align 8
  %14 = alloca i16*, align 8
  %15 = alloca i16*, align 8
  %16 = alloca i16*, align 8
  %17 = alloca i16*, align 8
  %18 = alloca i8*, align 8
  %19 = alloca i8*, align 8
  %20 = alloca i32, align 4
  %21 = alloca [130 x i16], align 16
  %22 = alloca [130 x i16], align 16
  %23 = alloca [130 x i16], align 16
  %24 = alloca i32, align 4
  store i8* %0, i8** %10, align 8
  store i16* %1, i16** %11, align 8
  store i16* %2, i16** %12, align 8
  store i16* %3, i16** %13, align 8
  store i16* %4, i16** %14, align 8
  store i16* %5, i16** %15, align 8
  store i16* %6, i16** %16, align 8
  store i16* %7, i16** %17, align 8
  %25 = getelementptr inbounds [130 x i16], [130 x i16]* %21, i32 0, i32 0
  %26 = bitcast i16* %25 to i8*
  %27 = load i16*, i16** %14, align 8
  %28 = bitcast i16* %27 to i8*
  %29 = load i16, i16* @global_precision, align 2
  %30 = sext i16 %29 to i32
  %31 = shl i32 %30, 1
  %32 = sext i32 %31 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* %28, i64 %32, i32 1, i1 false)
  %33 = getelementptr inbounds [130 x i16], [130 x i16]* %21, i32 0, i32 0
  %34 = call zeroext i8 @mp_dec(i16* %33)
  %35 = getelementptr inbounds [130 x i16], [130 x i16]* %22, i32 0, i32 0
  %36 = load i16*, i16** %13, align 8
  %37 = getelementptr inbounds [130 x i16], [130 x i16]* %21, i32 0, i32 0
  %38 = call i32 @mp_mod(i16* %35, i16* %36, i16* %37)
  %39 = getelementptr inbounds [130 x i16], [130 x i16]* %21, i32 0, i32 0
  %40 = bitcast i16* %39 to i8*
  %41 = load i16*, i16** %15, align 8
  %42 = bitcast i16* %41 to i8*
  %43 = load i16, i16* @global_precision, align 2
  %44 = sext i16 %43 to i32
  %45 = shl i32 %44, 1
  %46 = sext i32 %45 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %40, i8* %42, i64 %46, i32 1, i1 false)
  %47 = getelementptr inbounds [130 x i16], [130 x i16]* %21, i32 0, i32 0
  %48 = call zeroext i8 @mp_dec(i16* %47)
  %49 = getelementptr inbounds [130 x i16], [130 x i16]* %23, i32 0, i32 0
  %50 = load i16*, i16** %13, align 8
  %51 = getelementptr inbounds [130 x i16], [130 x i16]* %21, i32 0, i32 0
  %52 = call i32 @mp_mod(i16* %49, i16* %50, i16* %51)
  %53 = getelementptr inbounds [130 x i16], [130 x i16]* %21, i32 0, i32 0
  %54 = load i16*, i16** %11, align 8
  %55 = load i16*, i16** %14, align 8
  %56 = load i16*, i16** %15, align 8
  %57 = getelementptr inbounds [130 x i16], [130 x i16]* %22, i32 0, i32 0
  %58 = getelementptr inbounds [130 x i16], [130 x i16]* %23, i32 0, i32 0
  %59 = load i16*, i16** %16, align 8
  %60 = call i32 @mp_modexp_crt(i16* %53, i16* %54, i16* %55, i16* %56, i16* %57, i16* %58, i16* %59)
  store i32 %60, i32* %24, align 4
  %61 = getelementptr inbounds [130 x i16], [130 x i16]* %22, i32 0, i32 0
  call void @mp_init(i16* %61, i16 zeroext 0)
  %62 = getelementptr inbounds [130 x i16], [130 x i16]* %23, i32 0, i32 0
  call void @mp_init(i16* %62, i16 zeroext 0)
  %63 = load i32, i32* %24, align 4
  %64 = icmp slt i32 %63, 0
  br i1 %64, label %65, label %68

; <label>:65:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 3)
  %66 = add i64 %pgocount, 1
  store i64 %66, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 3)
  %67 = getelementptr inbounds [130 x i16], [130 x i16]* %21, i32 0, i32 0
  call void @mp_init(i16* %67, i16 zeroext 0)
  store i32 -1, i32* %9, align 4
  br label %180

; <label>:68:                                     ; preds = %8
  %69 = getelementptr inbounds [130 x i16], [130 x i16]* %21, i32 0, i32 0
  %70 = bitcast i16* %69 to i8*
  %71 = load i16, i16* @global_precision, align 2
  %72 = sext i16 %71 to i32
  %73 = shl i32 %72, 1
  %74 = trunc i32 %73 to i16
  call void @hiloswap(i8* %70, i16 signext %74)
  %75 = getelementptr inbounds [130 x i16], [130 x i16]* %21, i32 0, i32 0
  %76 = bitcast i16* %75 to i8*
  store i8* %76, i8** %19, align 8
  %77 = load i16, i16* @global_precision, align 2
  %78 = sext i16 %77 to i32
  %79 = shl i32 %78, 1
  store i32 %79, i32* %24, align 4
  %80 = load i8*, i8** %19, align 8
  %81 = load i32, i32* %24, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i8, i8* %80, i64 %82
  store i8* %83, i8** %18, align 8
  %84 = load i16*, i16** %17, align 8
  %85 = call i32 @countbits(i16* %84)
  %86 = add nsw i32 %85, 7
  %87 = ashr i32 %86, 3
  %88 = sub nsw i32 %87, 1
  store i32 %88, i32* %20, align 4
  %89 = load i32, i32* %20, align 4
  %90 = load i32, i32* %24, align 4
  %91 = sub i32 %90, %89
  store i32 %91, i32* %24, align 4
  %92 = load i32, i32* %24, align 4
  %93 = icmp slt i32 %92, 0
  br i1 %93, label %94, label %96

; <label>:94:                                     ; preds = %68
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 4)
  %95 = add i64 %pgocount1, 1
  store i64 %95, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 4)
  br label %178

; <label>:96:                                     ; preds = %68
  br label %97

; <label>:97:                                     ; preds = %108, %96
  %98 = load i32, i32* %24, align 4
  %99 = add nsw i32 %98, -1
  store i32 %99, i32* %24, align 4
  %100 = icmp ne i32 %98, 0
  br i1 %100, label %101, label %110

; <label>:101:                                    ; preds = %97
  %102 = load i8*, i8** %19, align 8
  %103 = getelementptr inbounds i8, i8* %102, i32 1
  store i8* %103, i8** %19, align 8
  %104 = load i8, i8* %102, align 1
  %105 = icmp ne i8 %104, 0
  br i1 %105, label %106, label %108

; <label>:106:                                    ; preds = %101
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 5)
  %107 = add i64 %pgocount2, 1
  store i64 %107, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 5)
  br label %178

; <label>:108:                                    ; preds = %101
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 0)
  %109 = add i64 %pgocount3, 1
  store i64 %109, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 0)
  br label %97

; <label>:110:                                    ; preds = %97
  %111 = load i8*, i8** %19, align 8
  %112 = getelementptr inbounds i8, i8* %111, i64 0
  %113 = load i8, i8* %112, align 1
  %114 = zext i8 %113 to i32
  %115 = icmp ne i32 %114, 2
  br i1 %115, label %116, label %141

; <label>:116:                                    ; preds = %110
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 6)
  %117 = add i64 %pgocount4, 1
  store i64 %117, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 6)
  %118 = load i8*, i8** %18, align 8
  %119 = getelementptr inbounds i8, i8* %118, i64 -1
  %120 = load i8, i8* %119, align 1
  %121 = zext i8 %120 to i32
  %122 = icmp eq i32 %121, 2
  br i1 %122, label %123, label %141

; <label>:123:                                    ; preds = %116
  %124 = load i8*, i8** %18, align 8
  %125 = getelementptr inbounds i8, i8* %124, i64 -1
  %126 = load i8, i8* %125, align 1
  %127 = zext i8 %126 to i32
  %128 = icmp ne i32 %127, 2
  br i1 %128, label %129, label %131

; <label>:129:                                    ; preds = %123
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 10)
  %130 = add i64 %pgocount5, 1
  store i64 %130, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 10)
  br label %178

; <label>:131:                                    ; preds = %123
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 11)
  %132 = add i64 %pgocount6, 1
  store i64 %132, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 11)
  br label %133

; <label>:133:                                    ; preds = %138, %131
  %134 = load i8*, i8** %18, align 8
  %135 = getelementptr inbounds i8, i8* %134, i32 -1
  store i8* %135, i8** %18, align 8
  %136 = load i8, i8* %135, align 1
  %137 = icmp ne i8 %136, 0
  br i1 %137, label %138, label %140

; <label>:138:                                    ; preds = %133
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 2)
  %139 = add i64 %pgocount7, 1
  store i64 %139, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 2)
  br label %133

; <label>:140:                                    ; preds = %133
  br label %158

; <label>:141:                                    ; preds = %116, %110
  %142 = load i8*, i8** %19, align 8
  %143 = getelementptr inbounds i8, i8* %142, i32 1
  store i8* %143, i8** %19, align 8
  %144 = load i8, i8* %142, align 1
  %145 = zext i8 %144 to i32
  %146 = icmp ne i32 %145, 2
  br i1 %146, label %147, label %149

; <label>:147:                                    ; preds = %141
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 7)
  %148 = add i64 %pgocount8, 1
  store i64 %148, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 7)
  br label %178

; <label>:149:                                    ; preds = %141
  br label %150

; <label>:150:                                    ; preds = %155, %149
  %151 = load i8*, i8** %19, align 8
  %152 = getelementptr inbounds i8, i8* %151, i32 1
  store i8* %152, i8** %19, align 8
  %153 = load i8, i8* %151, align 1
  %154 = icmp ne i8 %153, 0
  br i1 %154, label %155, label %157

; <label>:155:                                    ; preds = %150
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 1)
  %156 = add i64 %pgocount9, 1
  store i64 %156, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 1)
  br label %150

; <label>:157:                                    ; preds = %150
  br label %158

; <label>:158:                                    ; preds = %157, %140
  %159 = load i8*, i8** %18, align 8
  %160 = load i8*, i8** %19, align 8
  %161 = icmp ule i8* %159, %160
  br i1 %161, label %162, label %164

; <label>:162:                                    ; preds = %158
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 8)
  %163 = add i64 %pgocount10, 1
  store i64 %163, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 8)
  br label %178

; <label>:164:                                    ; preds = %158
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 9)
  %165 = add i64 %pgocount11, 1
  store i64 %165, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_rsa_private_decrypt, i64 0, i64 9)
  %166 = load i8*, i8** %18, align 8
  %167 = load i8*, i8** %19, align 8
  %168 = ptrtoint i8* %166 to i64
  %169 = ptrtoint i8* %167 to i64
  %170 = sub i64 %168, %169
  %171 = trunc i64 %170 to i32
  store i32 %171, i32* %20, align 4
  %172 = load i8*, i8** %10, align 8
  %173 = load i8*, i8** %19, align 8
  %174 = load i32, i32* %20, align 4
  %175 = zext i32 %174 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %172, i8* %173, i64 %175, i32 1, i1 false)
  %176 = getelementptr inbounds [130 x i16], [130 x i16]* %21, i32 0, i32 0
  call void @mp_init(i16* %176, i16 zeroext 0)
  %177 = load i32, i32* %20, align 4
  store i32 %177, i32* %9, align 4
  br label %180

; <label>:178:                                    ; preds = %162, %147, %129, %106, %94
  %179 = getelementptr inbounds [130 x i16], [130 x i16]* %21, i32 0, i32 0
  call void @mp_init(i16* %179, i16 zeroext 0)
  store i32 -9, i32* %9, align 4
  br label %180

; <label>:180:                                    ; preds = %178, %164, %65
  %181 = load i32, i32* %9, align 4
  ret i32 %181
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
