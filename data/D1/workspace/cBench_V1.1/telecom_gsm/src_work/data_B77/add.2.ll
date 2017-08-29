; ModuleID = 'tmp1.ll'
source_filename = "add.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [31 x i8] c"a != MIN_WORD || b != MIN_WORD\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"add.c\00", align 1
@__PRETTY_FUNCTION__.gsm_L_mult = private unnamed_addr constant [32 x i8] c"longword gsm_L_mult(word, word)\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"a != 0\00", align 1
@__PRETTY_FUNCTION__.gsm_norm = private unnamed_addr constant [24 x i8] c"word gsm_norm(longword)\00", align 1
@bitoff = internal global [256 x i8] c"\08\07\06\06\05\05\05\05\04\04\04\04\04\04\04\04\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str.3 = private unnamed_addr constant [25 x i8] c"num >= 0 && denum >= num\00", align 1
@__PRETTY_FUNCTION__.gsm_div = private unnamed_addr constant [25 x i8] c"word gsm_div(word, word)\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_gsm_add = private constant [7 x i8] c"gsm_add"
@__profn_gsm_sub = private constant [7 x i8] c"gsm_sub"
@__profn_gsm_mult = private constant [8 x i8] c"gsm_mult"
@__profn_gsm_mult_r = private constant [10 x i8] c"gsm_mult_r"
@__profn_gsm_abs = private constant [7 x i8] c"gsm_abs"
@__profn_gsm_L_mult = private constant [10 x i8] c"gsm_L_mult"
@__profn_gsm_L_add = private constant [9 x i8] c"gsm_L_add"
@__profn_gsm_L_sub = private constant [9 x i8] c"gsm_L_sub"
@__profn_gsm_norm = private constant [8 x i8] c"gsm_norm"
@__profn_gsm_L_asl = private constant [9 x i8] c"gsm_L_asl"
@__profn_gsm_L_asr = private constant [9 x i8] c"gsm_L_asr"
@__profn_gsm_asl = private constant [7 x i8] c"gsm_asl"
@__profn_gsm_asr = private constant [7 x i8] c"gsm_asr"
@__profn_gsm_div = private constant [7 x i8] c"gsm_div"
@__profc_gsm_add = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_add = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7280835940028494920, i64 43969736709, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_add, i32 0, i32 0), i8* bitcast (i16 (i16, i16)* @gsm_add to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_gsm_sub = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_sub = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8834059937975406083, i64 43969736709, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_sub, i32 0, i32 0), i8* bitcast (i16 (i16, i16)* @gsm_sub to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_gsm_mult = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_mult = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2723597594742599646, i64 38490985531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_mult, i32 0, i32 0), i8* bitcast (i16 (i16, i16)* @gsm_mult to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_gsm_mult_r = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_mult_r = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2811141809651731883, i64 38490985531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_mult_r, i32 0, i32 0), i8* bitcast (i16 (i16, i16)* @gsm_mult_r to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_gsm_abs = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_abs = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3660745214068349473, i64 46000771972, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_abs, i32 0, i32 0), i8* bitcast (i16 (i16)* @gsm_abs to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_gsm_L_mult = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_L_mult = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2359265912593716856, i64 42164573264, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_L_mult, i32 0, i32 0), i8* bitcast (i64 (i16, i16)* @gsm_L_mult to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_gsm_L_add = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_L_add = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 426317926051074076, i64 88993550302, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_add, i32 0, i32 0), i8* bitcast (i64 (i64, i64)* @gsm_L_add to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_gsm_L_sub = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_L_sub = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6650716925111399178, i64 88993550302, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_sub, i32 0, i32 0), i8* bitcast (i64 (i64, i64)* @gsm_L_sub to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_gsm_norm = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_norm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7152543291797601926, i64 114881146316, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_gsm_norm, i32 0, i32 0), i8* bitcast (i16 (i64)* @gsm_norm to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_gsm_L_asl = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_L_asl = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6501595436728289719, i64 53954356755, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_L_asl, i32 0, i32 0), i8* bitcast (i64 (i64, i32)* @gsm_L_asl to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_gsm_L_asr = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_L_asr = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 27280017670089146, i64 53954356755, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_L_asr, i32 0, i32 0), i8* bitcast (i64 (i64, i32)* @gsm_L_asr to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_gsm_asl = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_asl = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1917490883306315205, i64 53954356755, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_asl, i32 0, i32 0), i8* bitcast (i16 (i16, i32)* @gsm_asl to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_gsm_asr = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_asr = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8335269958112883433, i64 53954356755, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_asr, i32 0, i32 0), i8* bitcast (i16 (i16, i32)* @gsm_asr to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_gsm_div = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_div = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8157604014872948675, i64 89110925220, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_div, i32 0, i32 0), i8* bitcast (i16 (i16, i16)* @gsm_div to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [129 x i8] c"\7F\00gsm_add\01gsm_sub\01gsm_mult\01gsm_mult_r\01gsm_abs\01gsm_L_mult\01gsm_L_add\01gsm_L_sub\01gsm_norm\01gsm_L_asl\01gsm_L_asr\01gsm_asl\01gsm_asr\01gsm_div", section "__llvm_prf_names"
@llvm.used = appending global [15 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_add to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_sub to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_mult to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_mult_r to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_abs to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_L_mult to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_L_add to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_L_sub to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_norm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_L_asl to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_L_asr to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_asl to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_asr to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_div to i8*), i8* getelementptr inbounds ([129 x i8], [129 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define signext i16 @gsm_add(i16 signext, i16 signext) #0 {
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  %5 = alloca i64, align 8
  store i16 %0, i16* %3, align 2
  store i16 %1, i16* %4, align 2
  %6 = load i16, i16* %3, align 2
  %7 = sext i16 %6 to i64
  %8 = load i16, i16* %4, align 2
  %9 = sext i16 %8 to i64
  %10 = add nsw i64 %7, %9
  store i64 %10, i64* %5, align 8
  %11 = load i64, i64* %5, align 8
  %12 = icmp slt i64 %11, -32768
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_add, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_add, i64 0, i64 0)
  br label %25

; <label>:15:                                     ; preds = %2
  %16 = load i64, i64* %5, align 8
  %17 = icmp sgt i64 %16, 32767
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_add, i64 0, i64 1)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_add, i64 0, i64 1)
  br label %23

; <label>:20:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_add, i64 0, i64 2)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_add, i64 0, i64 2)
  %22 = load i64, i64* %5, align 8
  br label %23

; <label>:23:                                     ; preds = %20, %18
  %24 = phi i64 [ 32767, %18 ], [ %22, %20 ]
  br label %25

; <label>:25:                                     ; preds = %23, %13
  %26 = phi i64 [ -32768, %13 ], [ %24, %23 ]
  %27 = trunc i64 %26 to i16
  ret i16 %27
}

; Function Attrs: noinline nounwind uwtable
define signext i16 @gsm_sub(i16 signext, i16 signext) #0 {
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  %5 = alloca i64, align 8
  store i16 %0, i16* %3, align 2
  store i16 %1, i16* %4, align 2
  %6 = load i16, i16* %3, align 2
  %7 = sext i16 %6 to i64
  %8 = load i16, i16* %4, align 2
  %9 = sext i16 %8 to i64
  %10 = sub nsw i64 %7, %9
  store i64 %10, i64* %5, align 8
  %11 = load i64, i64* %5, align 8
  %12 = icmp slt i64 %11, -32768
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_sub, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_sub, i64 0, i64 0)
  br label %25

; <label>:15:                                     ; preds = %2
  %16 = load i64, i64* %5, align 8
  %17 = icmp sgt i64 %16, 32767
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_sub, i64 0, i64 1)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_sub, i64 0, i64 1)
  br label %23

; <label>:20:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_sub, i64 0, i64 2)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_sub, i64 0, i64 2)
  %22 = load i64, i64* %5, align 8
  br label %23

; <label>:23:                                     ; preds = %20, %18
  %24 = phi i64 [ 32767, %18 ], [ %22, %20 ]
  br label %25

; <label>:25:                                     ; preds = %23, %13
  %26 = phi i64 [ -32768, %13 ], [ %24, %23 ]
  %27 = trunc i64 %26 to i16
  ret i16 %27
}

; Function Attrs: noinline nounwind uwtable
define signext i16 @gsm_mult(i16 signext, i16 signext) #0 {
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  store i16 %0, i16* %4, align 2
  store i16 %1, i16* %5, align 2
  %6 = load i16, i16* %4, align 2
  %7 = sext i16 %6 to i32
  %8 = icmp eq i32 %7, -32768
  br i1 %8, label %9, label %16

; <label>:9:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_mult, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_mult, i64 0, i64 1)
  %11 = load i16, i16* %5, align 2
  %12 = sext i16 %11 to i32
  %13 = icmp eq i32 %12, -32768
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_mult, i64 0, i64 2)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_mult, i64 0, i64 2)
  store i16 32767, i16* %3, align 2
  br label %25

; <label>:16:                                     ; preds = %9, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_mult, i64 0, i64 0)
  %17 = add i64 %pgocount2, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_mult, i64 0, i64 0)
  %18 = load i16, i16* %4, align 2
  %19 = sext i16 %18 to i64
  %20 = load i16, i16* %5, align 2
  %21 = sext i16 %20 to i64
  %22 = mul nsw i64 %19, %21
  %23 = ashr i64 %22, 15
  %24 = trunc i64 %23 to i16
  store i16 %24, i16* %3, align 2
  br label %25

; <label>:25:                                     ; preds = %16, %14
  %26 = load i16, i16* %3, align 2
  ret i16 %26
}

; Function Attrs: noinline nounwind uwtable
define signext i16 @gsm_mult_r(i16 signext, i16 signext) #0 {
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  %6 = alloca i64, align 8
  store i16 %0, i16* %4, align 2
  store i16 %1, i16* %5, align 2
  %7 = load i16, i16* %5, align 2
  %8 = sext i16 %7 to i32
  %9 = icmp eq i32 %8, -32768
  br i1 %9, label %10, label %17

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_mult_r, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_mult_r, i64 0, i64 1)
  %12 = load i16, i16* %4, align 2
  %13 = sext i16 %12 to i32
  %14 = icmp eq i32 %13, -32768
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_mult_r, i64 0, i64 2)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_mult_r, i64 0, i64 2)
  store i16 32767, i16* %3, align 2
  br label %30

; <label>:17:                                     ; preds = %10, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_mult_r, i64 0, i64 0)
  %18 = add i64 %pgocount2, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_mult_r, i64 0, i64 0)
  %19 = load i16, i16* %4, align 2
  %20 = sext i16 %19 to i64
  %21 = load i16, i16* %5, align 2
  %22 = sext i16 %21 to i64
  %23 = mul nsw i64 %20, %22
  %24 = add nsw i64 %23, 16384
  store i64 %24, i64* %6, align 8
  %25 = load i64, i64* %6, align 8
  %26 = ashr i64 %25, 15
  store i64 %26, i64* %6, align 8
  %27 = load i64, i64* %6, align 8
  %28 = and i64 %27, 65535
  %29 = trunc i64 %28 to i16
  store i16 %29, i16* %3, align 2
  br label %30

; <label>:30:                                     ; preds = %17, %15
  %31 = load i16, i16* %3, align 2
  ret i16 %31
}

; Function Attrs: noinline nounwind uwtable
define signext i16 @gsm_abs(i16 signext) #0 {
  %2 = alloca i16, align 2
  store i16 %0, i16* %2, align 2
  %3 = load i16, i16* %2, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %19

; <label>:6:                                      ; preds = %1
  %7 = load i16, i16* %2, align 2
  %8 = sext i16 %7 to i32
  %9 = icmp eq i32 %8, -32768
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_abs, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_abs, i64 0, i64 1)
  br label %17

; <label>:12:                                     ; preds = %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_abs, i64 0, i64 2)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_abs, i64 0, i64 2)
  %14 = load i16, i16* %2, align 2
  %15 = sext i16 %14 to i32
  %16 = sub nsw i32 0, %15
  br label %17

; <label>:17:                                     ; preds = %12, %10
  %18 = phi i32 [ 32767, %10 ], [ %16, %12 ]
  br label %23

; <label>:19:                                     ; preds = %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_abs, i64 0, i64 0)
  %20 = add i64 %pgocount2, 1
  store i64 %20, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_abs, i64 0, i64 0)
  %21 = load i16, i16* %2, align 2
  %22 = sext i16 %21 to i32
  br label %23

; <label>:23:                                     ; preds = %19, %17
  %24 = phi i32 [ %18, %17 ], [ %22, %19 ]
  %25 = trunc i32 %24 to i16
  ret i16 %25
}

; Function Attrs: noinline nounwind uwtable
define i64 @gsm_L_mult(i16 signext, i16 signext) #0 {
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  store i16 %0, i16* %3, align 2
  store i16 %1, i16* %4, align 2
  %5 = load i16, i16* %3, align 2
  %6 = sext i16 %5 to i32
  %7 = icmp ne i32 %6, -32768
  br i1 %7, label %13, label %8

; <label>:8:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_L_mult, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_L_mult, i64 0, i64 1)
  %10 = load i16, i16* %4, align 2
  %11 = sext i16 %10 to i32
  %12 = icmp ne i32 %11, -32768
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %8, %2
  br label %17

; <label>:14:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_L_mult, i64 0, i64 2)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_L_mult, i64 0, i64 2)
  call void @__assert_fail(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 58, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @__PRETTY_FUNCTION__.gsm_L_mult, i32 0, i32 0)) #3
  unreachable
                                                  ; No predecessors!
  br label %17

; <label>:17:                                     ; preds = %16, %13
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_L_mult, i64 0, i64 0)
  %18 = add i64 %pgocount2, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_gsm_L_mult, i64 0, i64 0)
  %19 = load i16, i16* %3, align 2
  %20 = sext i16 %19 to i64
  %21 = load i16, i16* %4, align 2
  %22 = sext i16 %21 to i64
  %23 = mul nsw i64 %20, %22
  %24 = shl i64 %23, 1
  ret i64 %24
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

; Function Attrs: noinline nounwind uwtable
define i64 @gsm_L_add(i64, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i64 %0, i64* %4, align 8
  store i64 %1, i64* %5, align 8
  %8 = load i64, i64* %4, align 8
  %9 = icmp slt i64 %8, 0
  br i1 %9, label %10, label %37

; <label>:10:                                     ; preds = %2
  %11 = load i64, i64* %5, align 8
  %12 = icmp sge i64 %11, 0
  br i1 %12, label %13, label %18

; <label>:13:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_add, i64 0, i64 1)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_add, i64 0, i64 1)
  %15 = load i64, i64* %4, align 8
  %16 = load i64, i64* %5, align 8
  %17 = add nsw i64 %15, %16
  store i64 %17, i64* %3, align 8
  br label %58

; <label>:18:                                     ; preds = %10
  %19 = load i64, i64* %4, align 8
  %20 = add nsw i64 %19, 1
  %21 = sub nsw i64 0, %20
  %22 = load i64, i64* %5, align 8
  %23 = add nsw i64 %22, 1
  %24 = sub nsw i64 0, %23
  %25 = add i64 %21, %24
  store i64 %25, i64* %6, align 8
  %26 = load i64, i64* %6, align 8
  %27 = icmp uge i64 %26, 2147483647
  br i1 %27, label %28, label %30

; <label>:28:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_add, i64 0, i64 4)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_add, i64 0, i64 4)
  br label %35

; <label>:30:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_add, i64 0, i64 5)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_add, i64 0, i64 5)
  %32 = load i64, i64* %6, align 8
  %33 = sub nsw i64 0, %32
  %34 = sub nsw i64 %33, 2
  br label %35

; <label>:35:                                     ; preds = %30, %28
  %36 = phi i64 [ -2147483648, %28 ], [ %34, %30 ]
  store i64 %36, i64* %3, align 8
  br label %58

; <label>:37:                                     ; preds = %2
  %38 = load i64, i64* %5, align 8
  %39 = icmp sle i64 %38, 0
  br i1 %39, label %40, label %45

; <label>:40:                                     ; preds = %37
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_add, i64 0, i64 0)
  %41 = add i64 %pgocount3, 1
  store i64 %41, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_add, i64 0, i64 0)
  %42 = load i64, i64* %4, align 8
  %43 = load i64, i64* %5, align 8
  %44 = add nsw i64 %42, %43
  store i64 %44, i64* %3, align 8
  br label %58

; <label>:45:                                     ; preds = %37
  %46 = load i64, i64* %4, align 8
  %47 = load i64, i64* %5, align 8
  %48 = add i64 %46, %47
  store i64 %48, i64* %7, align 8
  %49 = load i64, i64* %7, align 8
  %50 = icmp ugt i64 %49, 2147483647
  br i1 %50, label %51, label %53

; <label>:51:                                     ; preds = %45
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_add, i64 0, i64 2)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_add, i64 0, i64 2)
  br label %56

; <label>:53:                                     ; preds = %45
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_add, i64 0, i64 3)
  %54 = add i64 %pgocount5, 1
  store i64 %54, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_add, i64 0, i64 3)
  %55 = load i64, i64* %7, align 8
  br label %56

; <label>:56:                                     ; preds = %53, %51
  %57 = phi i64 [ 2147483647, %51 ], [ %55, %53 ]
  store i64 %57, i64* %3, align 8
  br label %58

; <label>:58:                                     ; preds = %56, %40, %35, %13
  %59 = load i64, i64* %3, align 8
  ret i64 %59
}

; Function Attrs: noinline nounwind uwtable
define i64 @gsm_L_sub(i64, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i64 %0, i64* %4, align 8
  store i64 %1, i64* %5, align 8
  %8 = load i64, i64* %4, align 8
  %9 = icmp sge i64 %8, 0
  br i1 %9, label %10, label %34

; <label>:10:                                     ; preds = %2
  %11 = load i64, i64* %5, align 8
  %12 = icmp sge i64 %11, 0
  br i1 %12, label %13, label %18

; <label>:13:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_sub, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_sub, i64 0, i64 0)
  %15 = load i64, i64* %4, align 8
  %16 = load i64, i64* %5, align 8
  %17 = sub nsw i64 %15, %16
  store i64 %17, i64* %3, align 8
  br label %59

; <label>:18:                                     ; preds = %10
  %19 = load i64, i64* %4, align 8
  %20 = load i64, i64* %5, align 8
  %21 = add nsw i64 %20, 1
  %22 = sub nsw i64 0, %21
  %23 = add i64 %19, %22
  store i64 %23, i64* %6, align 8
  %24 = load i64, i64* %6, align 8
  %25 = icmp uge i64 %24, 2147483647
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_sub, i64 0, i64 2)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_sub, i64 0, i64 2)
  br label %32

; <label>:28:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_sub, i64 0, i64 3)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_sub, i64 0, i64 3)
  %30 = load i64, i64* %6, align 8
  %31 = add i64 %30, 1
  br label %32

; <label>:32:                                     ; preds = %28, %26
  %33 = phi i64 [ 2147483647, %26 ], [ %31, %28 ]
  store i64 %33, i64* %3, align 8
  br label %59

; <label>:34:                                     ; preds = %2
  %35 = load i64, i64* %5, align 8
  %36 = icmp sle i64 %35, 0
  br i1 %36, label %37, label %42

; <label>:37:                                     ; preds = %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_sub, i64 0, i64 1)
  %38 = add i64 %pgocount3, 1
  store i64 %38, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_sub, i64 0, i64 1)
  %39 = load i64, i64* %4, align 8
  %40 = load i64, i64* %5, align 8
  %41 = sub nsw i64 %39, %40
  store i64 %41, i64* %3, align 8
  br label %59

; <label>:42:                                     ; preds = %34
  %43 = load i64, i64* %4, align 8
  %44 = add nsw i64 %43, 1
  %45 = sub nsw i64 0, %44
  %46 = load i64, i64* %5, align 8
  %47 = add i64 %45, %46
  store i64 %47, i64* %7, align 8
  %48 = load i64, i64* %7, align 8
  %49 = icmp uge i64 %48, 2147483647
  br i1 %49, label %50, label %52

; <label>:50:                                     ; preds = %42
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_sub, i64 0, i64 4)
  %51 = add i64 %pgocount4, 1
  store i64 %51, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_sub, i64 0, i64 4)
  br label %57

; <label>:52:                                     ; preds = %42
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_sub, i64 0, i64 5)
  %53 = add i64 %pgocount5, 1
  store i64 %53, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_L_sub, i64 0, i64 5)
  %54 = load i64, i64* %7, align 8
  %55 = sub nsw i64 0, %54
  %56 = sub nsw i64 %55, 1
  br label %57

; <label>:57:                                     ; preds = %52, %50
  %58 = phi i64 [ -2147483648, %50 ], [ %56, %52 ]
  store i64 %58, i64* %3, align 8
  br label %59

; <label>:59:                                     ; preds = %57, %37, %32, %13
  %60 = load i64, i64* %3, align 8
  ret i64 %60
}

; Function Attrs: noinline nounwind uwtable
define signext i16 @gsm_norm(i64) #0 {
  %2 = alloca i16, align 2
  %3 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  %4 = load i64, i64* %3, align 8
  %5 = icmp ne i64 %4, 0
  br i1 %5, label %6, label %7

; <label>:6:                                      ; preds = %1
  br label %10

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_gsm_norm, i64 0, i64 6)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_gsm_norm, i64 0, i64 6)
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 137, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @__PRETTY_FUNCTION__.gsm_norm, i32 0, i32 0)) #3
  unreachable
                                                  ; No predecessors!
  br label %10

; <label>:10:                                     ; preds = %9, %6
  %11 = load i64, i64* %3, align 8
  %12 = icmp slt i64 %11, 0
  br i1 %12, label %13, label %22

; <label>:13:                                     ; preds = %10
  %14 = load i64, i64* %3, align 8
  %15 = icmp sle i64 %14, -1073741824
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_gsm_norm, i64 0, i64 3)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_gsm_norm, i64 0, i64 3)
  store i16 0, i16* %2, align 2
  br label %76

; <label>:18:                                     ; preds = %13
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_gsm_norm, i64 0, i64 4)
  %19 = add i64 %pgocount2, 1
  store i64 %19, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_gsm_norm, i64 0, i64 4)
  %20 = load i64, i64* %3, align 8
  %21 = xor i64 %20, -1
  store i64 %21, i64* %3, align 8
  br label %22

; <label>:22:                                     ; preds = %18, %10
  %23 = load i64, i64* %3, align 8
  %24 = and i64 %23, 4294901760
  %25 = icmp ne i64 %24, 0
  br i1 %25, label %26, label %50

; <label>:26:                                     ; preds = %22
  %27 = load i64, i64* %3, align 8
  %28 = and i64 %27, 4278190080
  %29 = icmp ne i64 %28, 0
  br i1 %29, label %30, label %39

; <label>:30:                                     ; preds = %26
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_gsm_norm, i64 0, i64 0)
  %31 = add i64 %pgocount3, 1
  store i64 %31, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_gsm_norm, i64 0, i64 0)
  %32 = load i64, i64* %3, align 8
  %33 = ashr i64 %32, 24
  %34 = and i64 255, %33
  %35 = getelementptr inbounds [256 x i8], [256 x i8]* @bitoff, i64 0, i64 %34
  %36 = load i8, i8* %35, align 1
  %37 = zext i8 %36 to i32
  %38 = add nsw i32 -1, %37
  br label %48

; <label>:39:                                     ; preds = %26
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_gsm_norm, i64 0, i64 1)
  %40 = add i64 %pgocount4, 1
  store i64 %40, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_gsm_norm, i64 0, i64 1)
  %41 = load i64, i64* %3, align 8
  %42 = ashr i64 %41, 16
  %43 = and i64 255, %42
  %44 = getelementptr inbounds [256 x i8], [256 x i8]* @bitoff, i64 0, i64 %43
  %45 = load i8, i8* %44, align 1
  %46 = zext i8 %45 to i32
  %47 = add nsw i32 7, %46
  br label %48

; <label>:48:                                     ; preds = %39, %30
  %49 = phi i32 [ %38, %30 ], [ %47, %39 ]
  br label %73

; <label>:50:                                     ; preds = %22
  %51 = load i64, i64* %3, align 8
  %52 = and i64 %51, 65280
  %53 = icmp ne i64 %52, 0
  br i1 %53, label %54, label %63

; <label>:54:                                     ; preds = %50
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_gsm_norm, i64 0, i64 2)
  %55 = add i64 %pgocount5, 1
  store i64 %55, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_gsm_norm, i64 0, i64 2)
  %56 = load i64, i64* %3, align 8
  %57 = ashr i64 %56, 8
  %58 = and i64 255, %57
  %59 = getelementptr inbounds [256 x i8], [256 x i8]* @bitoff, i64 0, i64 %58
  %60 = load i8, i8* %59, align 1
  %61 = zext i8 %60 to i32
  %62 = add nsw i32 15, %61
  br label %71

; <label>:63:                                     ; preds = %50
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_gsm_norm, i64 0, i64 5)
  %64 = add i64 %pgocount6, 1
  store i64 %64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_gsm_norm, i64 0, i64 5)
  %65 = load i64, i64* %3, align 8
  %66 = and i64 255, %65
  %67 = getelementptr inbounds [256 x i8], [256 x i8]* @bitoff, i64 0, i64 %66
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = add nsw i32 23, %69
  br label %71

; <label>:71:                                     ; preds = %63, %54
  %72 = phi i32 [ %62, %54 ], [ %70, %63 ]
  br label %73

; <label>:73:                                     ; preds = %71, %48
  %74 = phi i32 [ %49, %48 ], [ %72, %71 ]
  %75 = trunc i32 %74 to i16
  store i16 %75, i16* %2, align 2
  br label %76

; <label>:76:                                     ; preds = %73, %16
  %77 = load i16, i16* %2, align 2
  ret i16 %77
}

; Function Attrs: noinline nounwind uwtable
define i64 @gsm_L_asl(i64, i32) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  store i64 %0, i64* %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = icmp sge i32 %6, 32
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_L_asl, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_L_asl, i64 0, i64 0)
  store i64 0, i64* %3, align 8
  br label %35

; <label>:10:                                     ; preds = %2
  %11 = load i32, i32* %5, align 4
  %12 = icmp sle i32 %11, -32
  br i1 %12, label %13, label %20

; <label>:13:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_L_asl, i64 0, i64 1)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_L_asl, i64 0, i64 1)
  %15 = load i64, i64* %4, align 8
  %16 = icmp slt i64 %15, 0
  %17 = zext i1 %16 to i32
  %18 = sub nsw i32 0, %17
  %19 = sext i32 %18 to i64
  store i64 %19, i64* %3, align 8
  br label %35

; <label>:20:                                     ; preds = %10
  %21 = load i32, i32* %5, align 4
  %22 = icmp slt i32 %21, 0
  br i1 %22, label %23, label %29

; <label>:23:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_L_asl, i64 0, i64 3)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_L_asl, i64 0, i64 3)
  %25 = load i64, i64* %4, align 8
  %26 = load i32, i32* %5, align 4
  %27 = sub nsw i32 0, %26
  %28 = call i64 @gsm_L_asr(i64 %25, i32 %27)
  store i64 %28, i64* %3, align 8
  br label %35

; <label>:29:                                     ; preds = %20
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_L_asl, i64 0, i64 2)
  %30 = add i64 %pgocount3, 1
  store i64 %30, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_L_asl, i64 0, i64 2)
  %31 = load i64, i64* %4, align 8
  %32 = load i32, i32* %5, align 4
  %33 = zext i32 %32 to i64
  %34 = shl i64 %31, %33
  store i64 %34, i64* %3, align 8
  br label %35

; <label>:35:                                     ; preds = %29, %23, %13, %8
  %36 = load i64, i64* %3, align 8
  ret i64 %36
}

; Function Attrs: noinline nounwind uwtable
define i64 @gsm_L_asr(i64, i32) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  store i64 %0, i64* %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = icmp sge i32 %6, 32
  br i1 %7, label %8, label %15

; <label>:8:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_L_asr, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_L_asr, i64 0, i64 0)
  %10 = load i64, i64* %4, align 8
  %11 = icmp slt i64 %10, 0
  %12 = zext i1 %11 to i32
  %13 = sub nsw i32 0, %12
  %14 = sext i32 %13 to i64
  store i64 %14, i64* %3, align 8
  br label %36

; <label>:15:                                     ; preds = %2
  %16 = load i32, i32* %5, align 4
  %17 = icmp sle i32 %16, -32
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_L_asr, i64 0, i64 1)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_L_asr, i64 0, i64 1)
  store i64 0, i64* %3, align 8
  br label %36

; <label>:20:                                     ; preds = %15
  %21 = load i32, i32* %5, align 4
  %22 = icmp slt i32 %21, 0
  br i1 %22, label %23, label %30

; <label>:23:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_L_asr, i64 0, i64 3)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_L_asr, i64 0, i64 3)
  %25 = load i64, i64* %4, align 8
  %26 = load i32, i32* %5, align 4
  %27 = sub nsw i32 0, %26
  %28 = zext i32 %27 to i64
  %29 = shl i64 %25, %28
  store i64 %29, i64* %3, align 8
  br label %36

; <label>:30:                                     ; preds = %20
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_L_asr, i64 0, i64 2)
  %31 = add i64 %pgocount3, 1
  store i64 %31, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_L_asr, i64 0, i64 2)
  %32 = load i64, i64* %4, align 8
  %33 = load i32, i32* %5, align 4
  %34 = zext i32 %33 to i64
  %35 = ashr i64 %32, %34
  store i64 %35, i64* %3, align 8
  br label %36

; <label>:36:                                     ; preds = %30, %23, %18, %8
  %37 = load i64, i64* %3, align 8
  ret i64 %37
}

; Function Attrs: noinline nounwind uwtable
define signext i16 @gsm_asl(i16 signext, i32) #0 {
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  %5 = alloca i32, align 4
  store i16 %0, i16* %4, align 2
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = icmp sge i32 %6, 16
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_asl, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_asl, i64 0, i64 0)
  store i16 0, i16* %3, align 2
  br label %37

; <label>:10:                                     ; preds = %2
  %11 = load i32, i32* %5, align 4
  %12 = icmp sle i32 %11, -16
  br i1 %12, label %13, label %21

; <label>:13:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_asl, i64 0, i64 1)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_asl, i64 0, i64 1)
  %15 = load i16, i16* %4, align 2
  %16 = sext i16 %15 to i32
  %17 = icmp slt i32 %16, 0
  %18 = zext i1 %17 to i32
  %19 = sub nsw i32 0, %18
  %20 = trunc i32 %19 to i16
  store i16 %20, i16* %3, align 2
  br label %37

; <label>:21:                                     ; preds = %10
  %22 = load i32, i32* %5, align 4
  %23 = icmp slt i32 %22, 0
  br i1 %23, label %24, label %30

; <label>:24:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_asl, i64 0, i64 3)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_asl, i64 0, i64 3)
  %26 = load i16, i16* %4, align 2
  %27 = load i32, i32* %5, align 4
  %28 = sub nsw i32 0, %27
  %29 = call signext i16 @gsm_asr(i16 signext %26, i32 %28)
  store i16 %29, i16* %3, align 2
  br label %37

; <label>:30:                                     ; preds = %21
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_asl, i64 0, i64 2)
  %31 = add i64 %pgocount3, 1
  store i64 %31, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_asl, i64 0, i64 2)
  %32 = load i16, i16* %4, align 2
  %33 = sext i16 %32 to i32
  %34 = load i32, i32* %5, align 4
  %35 = shl i32 %33, %34
  %36 = trunc i32 %35 to i16
  store i16 %36, i16* %3, align 2
  br label %37

; <label>:37:                                     ; preds = %30, %24, %13, %8
  %38 = load i16, i16* %3, align 2
  ret i16 %38
}

; Function Attrs: noinline nounwind uwtable
define signext i16 @gsm_asr(i16 signext, i32) #0 {
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  %5 = alloca i32, align 4
  store i16 %0, i16* %4, align 2
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = icmp sge i32 %6, 16
  br i1 %7, label %8, label %16

; <label>:8:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_asr, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_asr, i64 0, i64 0)
  %10 = load i16, i16* %4, align 2
  %11 = sext i16 %10 to i32
  %12 = icmp slt i32 %11, 0
  %13 = zext i1 %12 to i32
  %14 = sub nsw i32 0, %13
  %15 = trunc i32 %14 to i16
  store i16 %15, i16* %3, align 2
  br label %39

; <label>:16:                                     ; preds = %2
  %17 = load i32, i32* %5, align 4
  %18 = icmp sle i32 %17, -16
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_asr, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_asr, i64 0, i64 1)
  store i16 0, i16* %3, align 2
  br label %39

; <label>:21:                                     ; preds = %16
  %22 = load i32, i32* %5, align 4
  %23 = icmp slt i32 %22, 0
  br i1 %23, label %24, label %32

; <label>:24:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_asr, i64 0, i64 3)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_asr, i64 0, i64 3)
  %26 = load i16, i16* %4, align 2
  %27 = sext i16 %26 to i32
  %28 = load i32, i32* %5, align 4
  %29 = sub nsw i32 0, %28
  %30 = shl i32 %27, %29
  %31 = trunc i32 %30 to i16
  store i16 %31, i16* %3, align 2
  br label %39

; <label>:32:                                     ; preds = %21
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_asr, i64 0, i64 2)
  %33 = add i64 %pgocount3, 1
  store i64 %33, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_asr, i64 0, i64 2)
  %34 = load i16, i16* %4, align 2
  %35 = sext i16 %34 to i32
  %36 = load i32, i32* %5, align 4
  %37 = ashr i32 %35, %36
  %38 = trunc i32 %37 to i16
  store i16 %38, i16* %3, align 2
  br label %39

; <label>:39:                                     ; preds = %32, %24, %19, %8
  %40 = load i16, i16* %3, align 2
  ret i16 %40
}

; Function Attrs: noinline nounwind uwtable
define signext i16 @gsm_div(i16 signext, i16 signext) #0 {
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i16, align 2
  %9 = alloca i32, align 4
  store i16 %0, i16* %4, align 2
  store i16 %1, i16* %5, align 2
  %10 = load i16, i16* %4, align 2
  %11 = sext i16 %10 to i64
  store i64 %11, i64* %6, align 8
  %12 = load i16, i16* %5, align 2
  %13 = sext i16 %12 to i64
  store i64 %13, i64* %7, align 8
  store i16 0, i16* %8, align 2
  store i32 15, i32* %9, align 4
  %14 = load i16, i16* %4, align 2
  %15 = sext i16 %14 to i32
  %16 = icmp sge i32 %15, 0
  br i1 %16, label %17, label %25

; <label>:17:                                     ; preds = %2
  %18 = load i16, i16* %5, align 2
  %19 = sext i16 %18 to i32
  %20 = load i16, i16* %4, align 2
  %21 = sext i16 %20 to i32
  %22 = icmp sge i32 %19, %21
  br i1 %22, label %24, label %._crit_edge

._crit_edge:                                      ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_div, i64 0, i64 4)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_div, i64 0, i64 4)
  br label %25

; <label>:24:                                     ; preds = %17
  br label %28

; <label>:25:                                     ; preds = %._crit_edge, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_div, i64 0, i64 5)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_div, i64 0, i64 5)
  call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 220, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @__PRETTY_FUNCTION__.gsm_div, i32 0, i32 0)) #3
  unreachable
                                                  ; No predecessors!
  br label %28

; <label>:28:                                     ; preds = %27, %24
  %29 = load i16, i16* %4, align 2
  %30 = sext i16 %29 to i32
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_div, i64 0, i64 3)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_div, i64 0, i64 3)
  store i16 0, i16* %3, align 2
  br label %61

; <label>:34:                                     ; preds = %28
  br label %35

; <label>:35:                                     ; preds = %56, %34
  %36 = load i32, i32* %9, align 4
  %37 = add nsw i32 %36, -1
  store i32 %37, i32* %9, align 4
  %38 = icmp ne i32 %36, 0
  br i1 %38, label %39, label %58

; <label>:39:                                     ; preds = %35
  %40 = load i16, i16* %8, align 2
  %41 = sext i16 %40 to i32
  %42 = shl i32 %41, 1
  %43 = trunc i32 %42 to i16
  store i16 %43, i16* %8, align 2
  %44 = load i64, i64* %6, align 8
  %45 = shl i64 %44, 1
  store i64 %45, i64* %6, align 8
  %46 = load i64, i64* %6, align 8
  %47 = load i64, i64* %7, align 8
  %48 = icmp sge i64 %46, %47
  br i1 %48, label %49, label %56

; <label>:49:                                     ; preds = %39
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_div, i64 0, i64 1)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_div, i64 0, i64 1)
  %51 = load i64, i64* %7, align 8
  %52 = load i64, i64* %6, align 8
  %53 = sub nsw i64 %52, %51
  store i64 %53, i64* %6, align 8
  %54 = load i16, i16* %8, align 2
  %55 = add i16 %54, 1
  store i16 %55, i16* %8, align 2
  br label %56

; <label>:56:                                     ; preds = %49, %39
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_div, i64 0, i64 0)
  %57 = add i64 %pgocount4, 1
  store i64 %57, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_div, i64 0, i64 0)
  br label %35

; <label>:58:                                     ; preds = %35
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_div, i64 0, i64 2)
  %59 = add i64 %pgocount5, 1
  store i64 %59, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_gsm_div, i64 0, i64 2)
  %60 = load i16, i16* %8, align 2
  store i16 %60, i16* %3, align 2
  br label %61

; <label>:61:                                     ; preds = %58, %32
  %62 = load i16, i16* %3, align 2
  ret i16 %62
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
