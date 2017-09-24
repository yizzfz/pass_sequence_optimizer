; ModuleID = 'tmp1.ll'
source_filename = "mpiio.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [4 x i8] c" 0\0A\00", align 1
@global_precision = external global i16, align 2
@puthexbyte.nibs = internal constant [17 x i8] c"0123456789ABCDEF\00", align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_string_length = private constant [13 x i8] c"string_length"
@__profn_mp_display = private constant [10 x i8] c"mp_display"
@__profn_tmp1.ll_putstr = private constant [14 x i8] c"tmp1.ll:putstr"
@__profn_tmp1.ll_puthexw16 = private constant [17 x i8] c"tmp1.ll:puthexw16"
@__profn_checksum = private constant [8 x i8] c"checksum"
@__profn_cbc_xor = private constant [7 x i8] c"cbc_xor"
@__profn_hiloswap = private constant [8 x i8] c"hiloswap"
@__profn_fetch_word16 = private constant [12 x i8] c"fetch_word16"
@__profn_put_word16 = private constant [10 x i8] c"put_word16"
@__profn_fetch_word32 = private constant [12 x i8] c"fetch_word32"
@__profn_put_word32 = private constant [10 x i8] c"put_word32"
@__profn_mpi2reg = private constant [7 x i8] c"mpi2reg"
@__profn_reg2mpi = private constant [7 x i8] c"reg2mpi"
@__profn_tmp1.ll_puthexbyte = private constant [18 x i8] c"tmp1.ll:puthexbyte"
@__profc_string_length = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_string_length = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7235788173520582736, i64 40425548223, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_string_length, i32 0, i32 0), i8* bitcast (i32 (i8*)* @string_length to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_display = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_display = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 274595790760654794, i64 88489361260, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_display, i32 0, i32 0), i8* bitcast (void (i8*, i16*)* @mp_display to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putstr = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putstr = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1677397759285841408, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_putstr, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_puthexw16 = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_puthexw16 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4688956355744084582, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_puthexw16, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_checksum = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_checksum = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5705742643245326046, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_checksum, i32 0, i32 0), i8* bitcast (i16 (i8*, i16)* @checksum to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_cbc_xor = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_cbc_xor = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4823185626980373450, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_cbc_xor, i32 0, i32 0), i8* bitcast (void (i16*, i16*, i16)* @cbc_xor to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_hiloswap = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_hiloswap = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3921241777848606824, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_hiloswap, i32 0, i32 0), i8* bitcast (void (i8*, i16)* @hiloswap to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_fetch_word16 = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_fetch_word16 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2905428689297310981, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_fetch_word16, i32 0, i32 0), i8* bitcast (i16 (i8*)* @fetch_word16 to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_put_word16 = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_put_word16 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4936722735426042300, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_put_word16, i32 0, i32 0), i8* bitcast (i8* (i16, i8*)* @put_word16 to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_fetch_word32 = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_fetch_word32 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7998670716666532369, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_fetch_word32, i32 0, i32 0), i8* bitcast (i64 (i8*)* @fetch_word32 to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_put_word32 = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_put_word32 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3022634530313710486, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_put_word32, i32 0, i32 0), i8* bitcast (i8* (i64, i8*)* @put_word32 to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mpi2reg = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mpi2reg = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4527651674005952677, i64 45078935416, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mpi2reg, i32 0, i32 0), i8* bitcast (i16 (i16*, i8*)* @mpi2reg to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_reg2mpi = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_reg2mpi = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8312466157632266790, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_reg2mpi, i32 0, i32 0), i8* bitcast (i16 (i8*, i16*)* @reg2mpi to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_puthexbyte = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_puthexbyte = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 475858176686085417, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_puthexbyte, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [169 x i8] c"\A6\01\00string_length\01mp_display\01tmp1.ll:putstr\01tmp1.ll:puthexw16\01checksum\01cbc_xor\01hiloswap\01fetch_word16\01put_word16\01fetch_word32\01put_word32\01mpi2reg\01reg2mpi\01tmp1.ll:puthexbyte", section "__llvm_prf_names"
@llvm.used = appending global [15 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_string_length to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_display to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putstr to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_puthexw16 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_checksum to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_cbc_xor to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_hiloswap to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_fetch_word16 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_put_word16 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_fetch_word32 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_put_word32 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mpi2reg to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_reg2mpi to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_puthexbyte to i8*), i8* getelementptr inbounds ([169 x i8], [169 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @string_length(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  store i32 0, i32* %3, align 4
  %4 = load i8*, i8** %2, align 8
  %5 = icmp ne i8* %4, null
  br i1 %5, label %6, label %18

; <label>:6:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_string_length, i64 0, i64 2)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_string_length, i64 0, i64 2)
  br label %8

; <label>:8:                                      ; preds = %13, %6
  %9 = load i8*, i8** %2, align 8
  %10 = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %10, i8** %2, align 8
  %11 = load i8, i8* %9, align 1
  %12 = icmp ne i8 %11, 0
  br i1 %12, label %13, label %17

; <label>:13:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_string_length, i64 0, i64 0)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_string_length, i64 0, i64 0)
  %15 = load i32, i32* %3, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %3, align 4
  br label %8

; <label>:17:                                     ; preds = %8
  br label %18

; <label>:18:                                     ; preds = %17, %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_string_length, i64 0, i64 1)
  %19 = add i64 %pgocount2, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_string_length, i64 0, i64 1)
  %20 = load i32, i32* %3, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind uwtable
define void @mp_display(i8*, i16*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i16*, align 8
  %5 = alloca i16, align 2
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i16* %1, i16** %4, align 8
  %8 = load i8*, i8** %3, align 8
  call void @putstr(i8* %8)
  %9 = load i16*, i16** %4, align 8
  %10 = call signext i16 @significance(i16* %9)
  store i16 %10, i16* %5, align 2
  %11 = load i16, i16* %5, align 2
  %12 = sext i16 %11 to i32
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_display, i64 0, i64 5)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_display, i64 0, i64 5)
  call void @putstr(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0))
  br label %60

; <label>:16:                                     ; preds = %2
  %17 = load i16*, i16** %4, align 8
  %18 = load i16, i16* %5, align 2
  %19 = sext i16 %18 to i32
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i16, i16* %17, i64 %20
  %22 = getelementptr inbounds i16, i16* %21, i64 -1
  store i16* %22, i16** %4, align 8
  store i32 0, i32* %6, align 4
  br label %23

; <label>:23:                                     ; preds = %51, %16
  %24 = load i16, i16* %5, align 2
  %25 = add i16 %24, -1
  store i16 %25, i16* %5, align 2
  %26 = icmp ne i16 %24, 0
  br i1 %26, label %27, label %57

; <label>:27:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_display, i64 0, i64 1)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_display, i64 0, i64 1)
  %29 = load i32, i32* %6, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %6, align 4
  %31 = srem i32 %29, 8
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %51, label %33

; <label>:33:                                     ; preds = %27
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_display, i64 0, i64 2)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_display, i64 0, i64 2)
  %35 = load i32, i32* %6, align 4
  %36 = icmp sgt i32 %35, 1
  br i1 %36, label %37, label %50

; <label>:37:                                     ; preds = %33
  %38 = call i32 @putchar(i32 10)
  %39 = load i8*, i8** %3, align 8
  %40 = call i32 @string_length(i8* %39)
  store i32 %40, i32* %7, align 4
  br label %41

; <label>:41:                                     ; preds = %45, %37
  %42 = load i32, i32* %7, align 4
  %43 = add nsw i32 %42, -1
  store i32 %43, i32* %7, align 4
  %44 = icmp ne i32 %42, 0
  br i1 %44, label %45, label %48

; <label>:45:                                     ; preds = %41
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_display, i64 0, i64 0)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_display, i64 0, i64 0)
  %47 = call i32 @putchar(i32 32)
  br label %41

; <label>:48:                                     ; preds = %41
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_display, i64 0, i64 3)
  %49 = add i64 %pgocount4, 1
  store i64 %49, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_display, i64 0, i64 3)
  br label %50

; <label>:50:                                     ; preds = %48, %33
  br label %51

; <label>:51:                                     ; preds = %50, %27
  %52 = load i16*, i16** %4, align 8
  %53 = load i16, i16* %52, align 2
  call void @puthexw16(i16 zeroext %53)
  %54 = call i32 @putchar(i32 32)
  %55 = load i16*, i16** %4, align 8
  %56 = getelementptr inbounds i16, i16* %55, i32 -1
  store i16* %56, i16** %4, align 8
  br label %23

; <label>:57:                                     ; preds = %23
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_display, i64 0, i64 4)
  %58 = add i64 %pgocount5, 1
  store i64 %58, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_display, i64 0, i64 4)
  %59 = call i32 @putchar(i32 10)
  br label %60

; <label>:60:                                     ; preds = %57, %14
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @putstr(i8*) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  br label %3

; <label>:3:                                      ; preds = %7, %1
  %4 = load i8*, i8** %2, align 8
  %5 = load i8, i8* %4, align 1
  %6 = icmp ne i8 %5, 0
  br i1 %6, label %7, label %14

; <label>:7:                                      ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_putstr, i64 0, i64 0)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_putstr, i64 0, i64 0)
  %9 = load i8*, i8** %2, align 8
  %10 = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %10, i8** %2, align 8
  %11 = load i8, i8* %9, align 1
  %12 = sext i8 %11 to i32
  %13 = call i32 @putchar(i32 %12)
  br label %3

; <label>:14:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_putstr, i64 0, i64 1)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_putstr, i64 0, i64 1)
  ret void
}

declare signext i16 @significance(i16*) #1

declare i32 @putchar(i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @puthexw16(i16 zeroext) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_puthexw16, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_puthexw16, i64 0, i64 0)
  %3 = alloca i16, align 2
  store i16 %0, i16* %3, align 2
  %4 = load i16, i16* %3, align 2
  %5 = zext i16 %4 to i32
  %6 = ashr i32 %5, 8
  %7 = trunc i32 %6 to i8
  call void @puthexbyte(i8 zeroext %7)
  %8 = load i16, i16* %3, align 2
  %9 = zext i16 %8 to i32
  %10 = and i32 %9, 255
  %11 = trunc i32 %10 to i8
  call void @puthexbyte(i8 zeroext %11)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define zeroext i16 @checksum(i8*, i16 zeroext) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  store i8* %0, i8** %3, align 8
  store i16 %1, i16* %4, align 2
  store i16 0, i16* %5, align 2
  br label %6

; <label>:6:                                      ; preds = %10, %2
  %7 = load i16, i16* %4, align 2
  %8 = add i16 %7, -1
  store i16 %8, i16* %4, align 2
  %9 = icmp ne i16 %7, 0
  br i1 %9, label %10, label %20

; <label>:10:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_checksum, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_checksum, i64 0, i64 0)
  %12 = load i8*, i8** %3, align 8
  %13 = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %13, i8** %3, align 8
  %14 = load i8, i8* %12, align 1
  %15 = zext i8 %14 to i32
  %16 = load i16, i16* %5, align 2
  %17 = zext i16 %16 to i32
  %18 = add nsw i32 %17, %15
  %19 = trunc i32 %18 to i16
  store i16 %19, i16* %5, align 2
  br label %6

; <label>:20:                                     ; preds = %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_checksum, i64 0, i64 1)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_checksum, i64 0, i64 1)
  %22 = load i16, i16* %5, align 2
  ret i16 %22
}

; Function Attrs: noinline nounwind uwtable
define void @cbc_xor(i16*, i16*, i16 zeroext) #0 {
  %4 = alloca i16*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  store i16* %0, i16** %4, align 8
  store i16* %1, i16** %5, align 8
  store i16 %2, i16* %6, align 2
  %8 = load i16, i16* %6, align 2
  %9 = zext i16 %8 to i32
  %10 = add nsw i32 %9, 1
  %11 = ashr i32 %10, 1
  %12 = sub nsw i32 %11, 1
  %13 = trunc i32 %12 to i16
  store i16 %13, i16* %7, align 2
  br label %14

; <label>:14:                                     ; preds = %18, %3
  %15 = load i16, i16* %7, align 2
  %16 = add i16 %15, -1
  store i16 %16, i16* %7, align 2
  %17 = icmp ne i16 %15, 0
  br i1 %17, label %18, label %35

; <label>:18:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_cbc_xor, i64 0, i64 0)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_cbc_xor, i64 0, i64 0)
  %20 = load i16*, i16** %5, align 8
  %21 = getelementptr inbounds i16, i16* %20, i32 1
  store i16* %21, i16** %5, align 8
  %22 = load i16, i16* %20, align 2
  %23 = zext i16 %22 to i32
  %24 = load i16*, i16** %4, align 8
  %25 = load i16, i16* %24, align 2
  %26 = zext i16 %25 to i32
  %27 = xor i32 %26, %23
  %28 = trunc i32 %27 to i16
  store i16 %28, i16* %24, align 2
  %29 = load i16*, i16** %4, align 8
  %30 = getelementptr inbounds i16, i16* %29, i32 1
  store i16* %30, i16** %4, align 8
  %31 = load i16, i16* %6, align 2
  %32 = zext i16 %31 to i32
  %33 = sub nsw i32 %32, 2
  %34 = trunc i32 %33 to i16
  store i16 %34, i16* %6, align 2
  br label %14

; <label>:35:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_cbc_xor, i64 0, i64 1)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_cbc_xor, i64 0, i64 1)
  %37 = load i16*, i16** %5, align 8
  %38 = load i16, i16* %37, align 2
  %39 = zext i16 %38 to i32
  %40 = load i16, i16* %6, align 2
  %41 = zext i16 %40 to i32
  %42 = shl i32 %41, 3
  %43 = shl i32 1, %42
  %44 = sub nsw i32 %43, 1
  %45 = and i32 %39, %44
  %46 = load i16*, i16** %4, align 8
  %47 = load i16, i16* %46, align 2
  %48 = zext i16 %47 to i32
  %49 = xor i32 %48, %45
  %50 = trunc i32 %49 to i16
  store i16 %50, i16* %46, align 2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @hiloswap(i8*, i16 signext) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i16, align 2
  %5 = alloca i8*, align 8
  %6 = alloca i8, align 1
  store i8* %0, i8** %3, align 8
  store i16 %1, i16* %4, align 2
  %7 = load i8*, i8** %3, align 8
  %8 = load i16, i16* %4, align 2
  %9 = sext i16 %8 to i32
  %10 = sub nsw i32 %9, 1
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i8, i8* %7, i64 %11
  store i8* %12, i8** %5, align 8
  br label %13

; <label>:13:                                     ; preds = %17, %2
  %14 = load i8*, i8** %3, align 8
  %15 = load i8*, i8** %5, align 8
  %16 = icmp ult i8* %14, %15
  br i1 %16, label %17, label %28

; <label>:17:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_hiloswap, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_hiloswap, i64 0, i64 0)
  %19 = load i8*, i8** %3, align 8
  %20 = load i8, i8* %19, align 1
  store i8 %20, i8* %6, align 1
  %21 = load i8*, i8** %5, align 8
  %22 = load i8, i8* %21, align 1
  %23 = load i8*, i8** %3, align 8
  %24 = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %24, i8** %3, align 8
  store i8 %22, i8* %23, align 1
  %25 = load i8, i8* %6, align 1
  %26 = load i8*, i8** %5, align 8
  %27 = getelementptr inbounds i8, i8* %26, i32 -1
  store i8* %27, i8** %5, align 8
  store i8 %25, i8* %26, align 1
  br label %13

; <label>:28:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_hiloswap, i64 0, i64 1)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_hiloswap, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define zeroext i16 @fetch_word16(i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_fetch_word16, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_fetch_word16, i64 0, i64 0)
  %3 = alloca i8*, align 8
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  store i8* %0, i8** %3, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %7, i8** %3, align 8
  %8 = load i8, i8* %6, align 1
  %9 = zext i8 %8 to i16
  store i16 %9, i16* %5, align 2
  %10 = load i8*, i8** %3, align 8
  %11 = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %11, i8** %3, align 8
  %12 = load i8, i8* %10, align 1
  %13 = zext i8 %12 to i16
  store i16 %13, i16* %4, align 2
  %14 = load i16, i16* %4, align 2
  %15 = zext i16 %14 to i32
  %16 = load i16, i16* %5, align 2
  %17 = zext i16 %16 to i32
  %18 = shl i32 %17, 8
  %19 = add nsw i32 %15, %18
  %20 = trunc i32 %19 to i16
  ret i16 %20
}

; Function Attrs: noinline nounwind uwtable
define i8* @put_word16(i16 zeroext, i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_put_word16, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_put_word16, i64 0, i64 0)
  %4 = alloca i16, align 2
  %5 = alloca i8*, align 8
  store i16 %0, i16* %4, align 2
  store i8* %1, i8** %5, align 8
  %6 = load i16, i16* %4, align 2
  %7 = zext i16 %6 to i32
  %8 = and i32 %7, 255
  %9 = trunc i32 %8 to i8
  %10 = load i8*, i8** %5, align 8
  %11 = getelementptr inbounds i8, i8* %10, i64 1
  store i8 %9, i8* %11, align 1
  %12 = load i16, i16* %4, align 2
  %13 = zext i16 %12 to i32
  %14 = ashr i32 %13, 8
  %15 = trunc i32 %14 to i16
  store i16 %15, i16* %4, align 2
  %16 = load i16, i16* %4, align 2
  %17 = zext i16 %16 to i32
  %18 = and i32 %17, 255
  %19 = trunc i32 %18 to i8
  %20 = load i8*, i8** %5, align 8
  %21 = getelementptr inbounds i8, i8* %20, i64 0
  store i8 %19, i8* %21, align 1
  %22 = load i8*, i8** %5, align 8
  %23 = getelementptr inbounds i8, i8* %22, i64 2
  ret i8* %23
}

; Function Attrs: noinline nounwind uwtable
define i64 @fetch_word32(i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_fetch_word32, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_fetch_word32, i64 0, i64 0)
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i8* %0, i8** %3, align 8
  %8 = load i8*, i8** %3, align 8
  %9 = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %9, i8** %3, align 8
  %10 = load i8, i8* %8, align 1
  %11 = zext i8 %10 to i64
  store i64 %11, i64* %7, align 8
  %12 = load i8*, i8** %3, align 8
  %13 = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %13, i8** %3, align 8
  %14 = load i8, i8* %12, align 1
  %15 = zext i8 %14 to i64
  store i64 %15, i64* %6, align 8
  %16 = load i8*, i8** %3, align 8
  %17 = getelementptr inbounds i8, i8* %16, i32 1
  store i8* %17, i8** %3, align 8
  %18 = load i8, i8* %16, align 1
  %19 = zext i8 %18 to i64
  store i64 %19, i64* %5, align 8
  %20 = load i8*, i8** %3, align 8
  %21 = getelementptr inbounds i8, i8* %20, i32 1
  store i8* %21, i8** %3, align 8
  %22 = load i8, i8* %20, align 1
  %23 = zext i8 %22 to i64
  store i64 %23, i64* %4, align 8
  %24 = load i64, i64* %4, align 8
  %25 = load i64, i64* %5, align 8
  %26 = shl i64 %25, 8
  %27 = add i64 %24, %26
  %28 = load i64, i64* %6, align 8
  %29 = shl i64 %28, 16
  %30 = add i64 %27, %29
  %31 = load i64, i64* %7, align 8
  %32 = shl i64 %31, 24
  %33 = add i64 %30, %32
  ret i64 %33
}

; Function Attrs: noinline nounwind uwtable
define i8* @put_word32(i64, i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_put_word32, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_put_word32, i64 0, i64 0)
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  store i64 %0, i64* %4, align 8
  store i8* %1, i8** %5, align 8
  %6 = load i64, i64* %4, align 8
  %7 = and i64 %6, 255
  %8 = trunc i64 %7 to i8
  %9 = load i8*, i8** %5, align 8
  %10 = getelementptr inbounds i8, i8* %9, i64 3
  store i8 %8, i8* %10, align 1
  %11 = load i64, i64* %4, align 8
  %12 = lshr i64 %11, 8
  store i64 %12, i64* %4, align 8
  %13 = load i64, i64* %4, align 8
  %14 = and i64 %13, 255
  %15 = trunc i64 %14 to i8
  %16 = load i8*, i8** %5, align 8
  %17 = getelementptr inbounds i8, i8* %16, i64 2
  store i8 %15, i8* %17, align 1
  %18 = load i64, i64* %4, align 8
  %19 = lshr i64 %18, 8
  store i64 %19, i64* %4, align 8
  %20 = load i64, i64* %4, align 8
  %21 = and i64 %20, 255
  %22 = trunc i64 %21 to i8
  %23 = load i8*, i8** %5, align 8
  %24 = getelementptr inbounds i8, i8* %23, i64 1
  store i8 %22, i8* %24, align 1
  %25 = load i64, i64* %4, align 8
  %26 = lshr i64 %25, 8
  store i64 %26, i64* %4, align 8
  %27 = load i64, i64* %4, align 8
  %28 = and i64 %27, 255
  %29 = trunc i64 %28 to i8
  %30 = load i8*, i8** %5, align 8
  %31 = getelementptr inbounds i8, i8* %30, i64 0
  store i8 %29, i8* %31, align 1
  %32 = load i8*, i8** %5, align 8
  %33 = getelementptr inbounds i8, i8* %32, i64 4
  ret i8* %33
}

; Function Attrs: noinline nounwind uwtable
define signext i16 @mpi2reg(i16*, i8*) #0 {
  %3 = alloca i16, align 2
  %4 = alloca i16*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca [260 x i8], align 16
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  %10 = alloca i16, align 2
  %11 = alloca i16, align 2
  store i16* %0, i16** %4, align 8
  store i8* %1, i8** %5, align 8
  %12 = load i8*, i8** %5, align 8
  %13 = call zeroext i16 @fetch_word16(i8* %12)
  store i16 %13, i16* %7, align 2
  %14 = load i8*, i8** %5, align 8
  %15 = getelementptr inbounds i8, i8* %14, i64 2
  store i8* %15, i8** %5, align 8
  %16 = load i16, i16* %7, align 2
  %17 = zext i16 %16 to i32
  %18 = add nsw i32 %17, 7
  %19 = ashr i32 %18, 3
  %20 = trunc i32 %19 to i16
  store i16 %20, i16* %8, align 2
  %21 = load i16, i16* %8, align 2
  %22 = zext i16 %21 to i32
  %23 = add nsw i32 %22, 1
  %24 = ashr i32 %23, 1
  %25 = trunc i32 %24 to i16
  store i16 %25, i16* %9, align 2
  %26 = load i16, i16* %9, align 2
  %27 = zext i16 %26 to i32
  %28 = load i16, i16* @global_precision, align 2
  %29 = sext i16 %28 to i32
  %30 = icmp sgt i32 %27, %29
  br i1 %30, label %31, label %33

; <label>:31:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mpi2reg, i64 0, i64 1)
  %32 = add i64 %pgocount, 1
  store i64 %32, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mpi2reg, i64 0, i64 1)
  store i16 -1, i16* %3, align 2
  br label %77

; <label>:33:                                     ; preds = %2
  %34 = load i16, i16* @global_precision, align 2
  %35 = sext i16 %34 to i32
  %36 = shl i32 %35, 1
  %37 = load i16, i16* %8, align 2
  %38 = zext i16 %37 to i32
  %39 = sub nsw i32 %36, %38
  %40 = trunc i32 %39 to i16
  store i16 %40, i16* %10, align 2
  %41 = getelementptr inbounds [260 x i8], [260 x i8]* %6, i32 0, i32 0
  %42 = load i16, i16* %10, align 2
  %43 = zext i16 %42 to i64
  call void @llvm.memset.p0i8.i64(i8* %41, i8 0, i64 %43, i32 16, i1 false)
  %44 = load i16, i16* %10, align 2
  store i16 %44, i16* %11, align 2
  br label %45

; <label>:45:                                     ; preds = %49, %33
  %46 = load i16, i16* %8, align 2
  %47 = add i16 %46, -1
  store i16 %47, i16* %8, align 2
  %48 = icmp ne i16 %46, 0
  br i1 %48, label %49, label %58

; <label>:49:                                     ; preds = %45
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mpi2reg, i64 0, i64 0)
  %50 = add i64 %pgocount1, 1
  store i64 %50, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mpi2reg, i64 0, i64 0)
  %51 = load i8*, i8** %5, align 8
  %52 = getelementptr inbounds i8, i8* %51, i32 1
  store i8* %52, i8** %5, align 8
  %53 = load i8, i8* %51, align 1
  %54 = load i16, i16* %11, align 2
  %55 = add i16 %54, 1
  store i16 %55, i16* %11, align 2
  %56 = zext i16 %54 to i64
  %57 = getelementptr inbounds [260 x i8], [260 x i8]* %6, i64 0, i64 %56
  store i8 %53, i8* %57, align 1
  br label %45

; <label>:58:                                     ; preds = %45
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mpi2reg, i64 0, i64 2)
  %59 = add i64 %pgocount2, 1
  store i64 %59, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mpi2reg, i64 0, i64 2)
  %60 = getelementptr inbounds [260 x i8], [260 x i8]* %6, i32 0, i32 0
  %61 = load i16, i16* @global_precision, align 2
  %62 = sext i16 %61 to i32
  %63 = shl i32 %62, 1
  %64 = trunc i32 %63 to i16
  call void @hiloswap(i8* %60, i16 signext %64)
  %65 = load i16*, i16** %4, align 8
  %66 = bitcast i16* %65 to i8*
  %67 = getelementptr inbounds [260 x i8], [260 x i8]* %6, i32 0, i32 0
  %68 = bitcast i8* %67 to i16*
  %69 = bitcast i16* %68 to i8*
  %70 = load i16, i16* @global_precision, align 2
  %71 = sext i16 %70 to i32
  %72 = shl i32 %71, 1
  %73 = sext i32 %72 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %66, i8* %69, i64 %73, i32 1, i1 false)
  %74 = getelementptr inbounds [260 x i8], [260 x i8]* %6, i32 0, i32 0
  %75 = bitcast i8* %74 to i16*
  call void @mp_init(i16* %75, i16 zeroext 0)
  %76 = load i16, i16* %9, align 2
  store i16 %76, i16* %3, align 2
  br label %77

; <label>:77:                                     ; preds = %58, %31
  %78 = load i16, i16* %3, align 2
  ret i16 %78
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

declare void @mp_init(i16*, i16 zeroext) #1

; Function Attrs: noinline nounwind uwtable
define signext i16 @reg2mpi(i8*, i16*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i16*, align 8
  %5 = alloca [260 x i8], align 16
  %6 = alloca i8*, align 8
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  store i8* %0, i8** %3, align 8
  store i16* %1, i16** %4, align 8
  %10 = load i16*, i16** %4, align 8
  %11 = call i32 @countbits(i16* %10)
  %12 = trunc i32 %11 to i16
  store i16 %12, i16* %9, align 2
  %13 = load i16, i16* %9, align 2
  %14 = zext i16 %13 to i32
  %15 = add nsw i32 %14, 7
  %16 = ashr i32 %15, 3
  %17 = trunc i32 %16 to i16
  store i16 %17, i16* %7, align 2
  %18 = load i16, i16* %7, align 2
  store i16 %18, i16* %8, align 2
  %19 = getelementptr inbounds [260 x i8], [260 x i8]* %5, i32 0, i32 0
  store i8* %19, i8** %6, align 8
  %20 = load i8*, i8** %6, align 8
  %21 = bitcast i8* %20 to i16*
  %22 = bitcast i16* %21 to i8*
  %23 = load i16*, i16** %4, align 8
  %24 = bitcast i16* %23 to i8*
  %25 = load i16, i16* @global_precision, align 2
  %26 = sext i16 %25 to i32
  %27 = shl i32 %26, 1
  %28 = sext i32 %27 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %22, i8* %24, i64 %28, i32 1, i1 false)
  %29 = load i8*, i8** %6, align 8
  %30 = load i16, i16* @global_precision, align 2
  %31 = sext i16 %30 to i32
  %32 = shl i32 %31, 1
  %33 = trunc i32 %32 to i16
  call void @hiloswap(i8* %29, i16 signext %33)
  %34 = load i16, i16* @global_precision, align 2
  %35 = sext i16 %34 to i32
  %36 = shl i32 %35, 1
  %37 = load i16, i16* %7, align 2
  %38 = sext i16 %37 to i32
  %39 = sub nsw i32 %36, %38
  %40 = load i8*, i8** %6, align 8
  %41 = sext i32 %39 to i64
  %42 = getelementptr inbounds i8, i8* %40, i64 %41
  store i8* %42, i8** %6, align 8
  %43 = load i16, i16* %9, align 2
  %44 = load i8*, i8** %3, align 8
  %45 = call i8* @put_word16(i16 zeroext %43, i8* %44)
  store i8* %45, i8** %3, align 8
  br label %46

; <label>:46:                                     ; preds = %50, %2
  %47 = load i16, i16* %7, align 2
  %48 = add i16 %47, -1
  store i16 %48, i16* %7, align 2
  %49 = icmp ne i16 %47, 0
  br i1 %49, label %50, label %57

; <label>:50:                                     ; preds = %46
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_reg2mpi, i64 0, i64 0)
  %51 = add i64 %pgocount, 1
  store i64 %51, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_reg2mpi, i64 0, i64 0)
  %52 = load i8*, i8** %6, align 8
  %53 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %53, i8** %6, align 8
  %54 = load i8, i8* %52, align 1
  %55 = load i8*, i8** %3, align 8
  %56 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %56, i8** %3, align 8
  store i8 %54, i8* %55, align 1
  br label %46

; <label>:57:                                     ; preds = %46
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_reg2mpi, i64 0, i64 1)
  %58 = add i64 %pgocount1, 1
  store i64 %58, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_reg2mpi, i64 0, i64 1)
  %59 = getelementptr inbounds [260 x i8], [260 x i8]* %5, i32 0, i32 0
  %60 = bitcast i8* %59 to i16*
  call void @mp_init(i16* %60, i16 zeroext 0)
  %61 = load i16, i16* %8, align 2
  ret i16 %61
}

declare i32 @countbits(i16*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @puthexbyte(i8 zeroext) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_puthexbyte, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_puthexbyte, i64 0, i64 0)
  %3 = alloca i8, align 1
  store i8 %0, i8* %3, align 1
  %4 = load i8, i8* %3, align 1
  %5 = zext i8 %4 to i32
  %6 = ashr i32 %5, 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [17 x i8], [17 x i8]* @puthexbyte.nibs, i64 0, i64 %7
  %9 = load i8, i8* %8, align 1
  %10 = sext i8 %9 to i32
  %11 = call i32 @putchar(i32 %10)
  %12 = load i8, i8* %3, align 1
  %13 = zext i8 %12 to i32
  %14 = and i32 %13, 15
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [17 x i8], [17 x i8]* @puthexbyte.nibs, i64 0, i64 %15
  %17 = load i8, i8* %16, align 1
  %18 = sext i8 %17 to i32
  %19 = call i32 @putchar(i32 %18)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
