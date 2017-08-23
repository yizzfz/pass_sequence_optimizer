; ModuleID = 'tmp1.ll'
source_filename = "resample.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.resample_state = type { i32, i32, i32 }

$__llvm_profile_raw_version = comdat any

@resample_table = internal constant [9 x [9 x i32]] [[9 x i32] [i32 268435456, i32 292174646, i32 402653184, i32 536870912, i32 584349292, i32 805306368, i32 1073741824, i32 1168698584, i32 1610612736], [9 x i32] [i32 246625075, i32 268435456, i32 369937613, i32 493250150, i32 536870912, i32 739875226, i32 986500301, i32 1073741824, i32 1479750451], [9 x i32] [i32 178956971, i32 194783097, i32 268435456, i32 357913941, i32 389566195, i32 536870912, i32 715827883, i32 779132389, i32 1073741824], [9 x i32] [i32 134217728, i32 146087323, i32 201326592, i32 268435456, i32 292174646, i32 402653184, i32 536870912, i32 584349292, i32 805306368], [9 x i32] [i32 123312538, i32 134217728, i32 184968806, i32 246625075, i32 268435456, i32 369937613, i32 493250150, i32 536870912, i32 739875226], [9 x i32] [i32 89478485, i32 97391549, i32 134217728, i32 178956971, i32 194783097, i32 268435456, i32 357913941, i32 389566195, i32 536870912], [9 x i32] [i32 67108864, i32 73043661, i32 100663296, i32 134217728, i32 146087323, i32 201326592, i32 268435456, i32 292174646, i32 402653184], [9 x i32] [i32 61656269, i32 67108864, i32 92484403, i32 123312538, i32 134217728, i32 184968806, i32 246625075, i32 268435456, i32 369937613], [9 x i32] [i32 44739243, i32 48695774, i32 67108864, i32 89478485, i32 97391549, i32 134217728, i32 178956971, i32 194783097, i32 268435456]], align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_resample_init = private constant [13 x i8] c"resample_init"
@__profn_tmp1.ll_rate_index = private constant [18 x i8] c"tmp1.ll:rate_index"
@__profn_resample_block = private constant [14 x i8] c"resample_block"
@__profc_resample_init = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_resample_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6363235912760264779, i64 37869605968, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_resample_init, i32 0, i32 0), i8* bitcast (i32 (%struct.resample_state*, i32, i32)* @resample_init to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_rate_index = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_rate_index = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6306793320237815225, i64 94932365988, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i32 0, i32 0), i8* null, i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_resample_block = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_resample_block = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2769388301591967262, i64 151779986845, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i32 0, i32 0), i8* bitcast (i32 (%struct.resample_state*, i32, i32*, i32*)* @resample_block to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [49 x i8] c"//x\DA+J-N\CC-\C8I\8D\CF\CC\CB,a,\C9-0\D4\CB\C9\B1*J,\01\89\A4\A4V0\16\C1\14$\E5\E4'g\03\00\B1;\12\17", section "__llvm_prf_names"
@llvm.used = appending global [4 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_resample_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_rate_index to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_resample_block to i8*), i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @resample_init(%struct.resample_state*, i32, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.resample_state*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct.resample_state* %0, %struct.resample_state** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  %10 = load i32, i32* %6, align 4
  %11 = call i32 @rate_index(i32 %10)
  store i32 %11, i32* %8, align 4
  %12 = load i32, i32* %7, align 4
  %13 = call i32 @rate_index(i32 %12)
  store i32 %13, i32* %9, align 4
  %14 = load i32, i32* %8, align 4
  %15 = icmp eq i32 %14, -1
  br i1 %15, label %20, label %16

; <label>:16:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_resample_init, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_resample_init, i64 0, i64 0)
  %18 = load i32, i32* %9, align 4
  %19 = icmp eq i32 %18, -1
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %16, %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_resample_init, i64 0, i64 1)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_resample_init, i64 0, i64 1)
  store i32 -1, i32* %4, align 4
  br label %37

; <label>:22:                                     ; preds = %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_resample_init, i64 0, i64 2)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_resample_init, i64 0, i64 2)
  %24 = load i32, i32* %8, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [9 x [9 x i32]], [9 x [9 x i32]]* @resample_table, i64 0, i64 %25
  %27 = load i32, i32* %9, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [9 x i32], [9 x i32]* %26, i64 0, i64 %28
  %30 = load i32, i32* %29, align 4
  %31 = load %struct.resample_state*, %struct.resample_state** %5, align 8
  %32 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %31, i32 0, i32 0
  store i32 %30, i32* %32, align 4
  %33 = load %struct.resample_state*, %struct.resample_state** %5, align 8
  %34 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %33, i32 0, i32 1
  store i32 0, i32* %34, align 4
  %35 = load %struct.resample_state*, %struct.resample_state** %5, align 8
  %36 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %35, i32 0, i32 2
  store i32 0, i32* %36, align 4
  store i32 0, i32* %4, align 4
  br label %37

; <label>:37:                                     ; preds = %22, %20
  %38 = load i32, i32* %4, align 4
  ret i32 %38
}

; Function Attrs: nounwind uwtable
define internal i32 @rate_index(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  switch i32 %4, label %23 [
    i32 48000, label %5
    i32 44100, label %7
    i32 32000, label %9
    i32 24000, label %11
    i32 22050, label %13
    i32 16000, label %15
    i32 12000, label %17
    i32 11025, label %19
    i32 8000, label %21
  ]

; <label>:5:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 0)
  store i32 0, i32* %2, align 4
  br label %25

; <label>:7:                                      ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 1)
  %8 = add i64 %pgocount1, 1
  store i64 %8, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 1)
  store i32 1, i32* %2, align 4
  br label %25

; <label>:9:                                      ; preds = %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 2)
  %10 = add i64 %pgocount2, 1
  store i64 %10, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 2)
  store i32 2, i32* %2, align 4
  br label %25

; <label>:11:                                     ; preds = %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 3)
  %12 = add i64 %pgocount3, 1
  store i64 %12, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 3)
  store i32 3, i32* %2, align 4
  br label %25

; <label>:13:                                     ; preds = %1
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 4)
  %14 = add i64 %pgocount4, 1
  store i64 %14, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 4)
  store i32 4, i32* %2, align 4
  br label %25

; <label>:15:                                     ; preds = %1
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 5)
  %16 = add i64 %pgocount5, 1
  store i64 %16, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 5)
  store i32 5, i32* %2, align 4
  br label %25

; <label>:17:                                     ; preds = %1
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 6)
  %18 = add i64 %pgocount6, 1
  store i64 %18, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 6)
  store i32 6, i32* %2, align 4
  br label %25

; <label>:19:                                     ; preds = %1
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 7)
  %20 = add i64 %pgocount7, 1
  store i64 %20, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 7)
  store i32 7, i32* %2, align 4
  br label %25

; <label>:21:                                     ; preds = %1
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 8)
  %22 = add i64 %pgocount8, 1
  store i64 %22, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 8)
  store i32 8, i32* %2, align 4
  br label %25

; <label>:23:                                     ; preds = %1
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 9)
  %24 = add i64 %pgocount9, 1
  store i64 %24, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_rate_index, i64 0, i64 9)
  store i32 -1, i32* %2, align 4
  br label %25

; <label>:25:                                     ; preds = %23, %21, %19, %17, %15, %13, %11, %9, %7, %5
  %26 = load i32, i32* %2, align 4
  ret i32 %26
}

; Function Attrs: nounwind uwtable
define i32 @resample_block(%struct.resample_state*, i32, i32*, i32*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.resample_state*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  store %struct.resample_state* %0, %struct.resample_state** %6, align 8
  store i32 %1, i32* %7, align 4
  store i32* %2, i32** %8, align 8
  store i32* %3, i32** %9, align 8
  %12 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %13 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %12, i32 0, i32 0
  %14 = load i32, i32* %13, align 4
  %15 = icmp eq i32 %14, 268435456
  br i1 %15, label %16, label %26

; <label>:16:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 6)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 6)
  %18 = load i32*, i32** %9, align 8
  %19 = bitcast i32* %18 to i8*
  %20 = load i32*, i32** %8, align 8
  %21 = bitcast i32* %20 to i8*
  %22 = load i32, i32* %7, align 4
  %23 = zext i32 %22 to i64
  %24 = mul i64 %23, 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* %21, i64 %24, i32 4, i1 false)
  %25 = load i32, i32* %7, align 4
  store i32 %25, i32* %5, align 4
  br label %266

; <label>:26:                                     ; preds = %4
  %27 = load i32*, i32** %8, align 8
  %28 = load i32, i32* %7, align 4
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32* %27, i64 %29
  store i32* %30, i32** %10, align 8
  %31 = load i32*, i32** %9, align 8
  store i32* %31, i32** %11, align 8
  %32 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %33 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %32, i32 0, i32 1
  %34 = load i32, i32* %33, align 4
  %35 = icmp slt i32 %34, 0
  br i1 %35, label %36, label %122

; <label>:36:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 9)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 9)
  %38 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %39 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %38, i32 0, i32 1
  %40 = load i32, i32* %39, align 4
  %41 = sub nsw i32 0, %40
  %42 = sext i32 %41 to i64
  %43 = and i64 %42, 268435455
  %44 = trunc i64 %43 to i32
  %45 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %46 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %45, i32 0, i32 1
  store i32 %44, i32* %46, align 4
  br label %47

; <label>:47:                                     ; preds = %116, %36
  %48 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %49 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %48, i32 0, i32 1
  %50 = load i32, i32* %49, align 4
  %51 = icmp slt i32 %50, 268435456
  br i1 %51, label %52, label %117

; <label>:52:                                     ; preds = %47
  %53 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %54 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %53, i32 0, i32 1
  %55 = load i32, i32* %54, align 4
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %80

; <label>:57:                                     ; preds = %52
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 3)
  %58 = add i64 %pgocount2, 1
  store i64 %58, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 3)
  %59 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %60 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %59, i32 0, i32 2
  %61 = load i32, i32* %60, align 4
  %62 = sext i32 %61 to i64
  %63 = load i32*, i32** %8, align 8
  %64 = load i32, i32* %63, align 4
  %65 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %66 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %65, i32 0, i32 2
  %67 = load i32, i32* %66, align 4
  %68 = sub nsw i32 %64, %67
  %69 = sext i32 %68 to i64
  %70 = add nsw i64 %69, 2048
  %71 = ashr i64 %70, 12
  %72 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %73 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %72, i32 0, i32 1
  %74 = load i32, i32* %73, align 4
  %75 = sext i32 %74 to i64
  %76 = add nsw i64 %75, 32768
  %77 = ashr i64 %76, 16
  %78 = mul nsw i64 %71, %77
  %79 = add nsw i64 %62, %78
  br label %86

; <label>:80:                                     ; preds = %52
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 4)
  %81 = add i64 %pgocount3, 1
  store i64 %81, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 4)
  %82 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %83 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %82, i32 0, i32 2
  %84 = load i32, i32* %83, align 4
  %85 = sext i32 %84 to i64
  br label %86

; <label>:86:                                     ; preds = %80, %57
  %87 = phi i64 [ %79, %57 ], [ %85, %80 ]
  %88 = trunc i64 %87 to i32
  %89 = load i32*, i32** %9, align 8
  %90 = getelementptr inbounds i32, i32* %89, i32 1
  store i32* %90, i32** %9, align 8
  store i32 %88, i32* %89, align 4
  %91 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %92 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %91, i32 0, i32 0
  %93 = load i32, i32* %92, align 4
  %94 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %95 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %94, i32 0, i32 1
  %96 = load i32, i32* %95, align 4
  %97 = add nsw i32 %96, %93
  store i32 %97, i32* %95, align 4
  %98 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %99 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %98, i32 0, i32 1
  %100 = load i32, i32* %99, align 4
  %101 = sext i32 %100 to i64
  %102 = add nsw i64 %101, 128
  %103 = and i64 %102, 268435200
  %104 = icmp eq i64 %103, 0
  br i1 %104, label %105, label %116

; <label>:105:                                    ; preds = %86
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 5)
  %106 = add i64 %pgocount4, 1
  store i64 %106, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 5)
  %107 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %108 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %107, i32 0, i32 1
  %109 = load i32, i32* %108, align 4
  %110 = sext i32 %109 to i64
  %111 = add nsw i64 %110, 128
  %112 = and i64 %111, -268435456
  %113 = trunc i64 %112 to i32
  %114 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %115 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %114, i32 0, i32 1
  store i32 %113, i32* %115, align 4
  br label %116

; <label>:116:                                    ; preds = %105, %86
  br label %47

; <label>:117:                                    ; preds = %47
  %118 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %119 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %118, i32 0, i32 1
  %120 = load i32, i32* %119, align 4
  %121 = sub nsw i32 %120, 268435456
  store i32 %121, i32* %119, align 4
  br label %122

; <label>:122:                                    ; preds = %117, %26
  br label %123

; <label>:123:                                    ; preds = %215, %122
  %124 = load i32*, i32** %10, align 8
  %125 = load i32*, i32** %8, align 8
  %126 = ptrtoint i32* %124 to i64
  %127 = ptrtoint i32* %125 to i64
  %128 = sub i64 %126, %127
  %129 = sdiv exact i64 %128, 4
  %130 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %131 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %130, i32 0, i32 1
  %132 = load i32, i32* %131, align 4
  %133 = ashr i32 %132, 28
  %134 = add nsw i32 1, %133
  %135 = sext i32 %134 to i64
  %136 = icmp sgt i64 %129, %135
  br i1 %136, label %137, label %216

; <label>:137:                                    ; preds = %123
  %138 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %139 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %138, i32 0, i32 1
  %140 = load i32, i32* %139, align 4
  %141 = ashr i32 %140, 28
  %142 = load i32*, i32** %8, align 8
  %143 = sext i32 %141 to i64
  %144 = getelementptr inbounds i32, i32* %142, i64 %143
  store i32* %144, i32** %8, align 8
  %145 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %146 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %145, i32 0, i32 1
  %147 = load i32, i32* %146, align 4
  %148 = sext i32 %147 to i64
  %149 = and i64 %148, 268435455
  %150 = trunc i64 %149 to i32
  %151 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %152 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %151, i32 0, i32 1
  store i32 %150, i32* %152, align 4
  %153 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %154 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %153, i32 0, i32 1
  %155 = load i32, i32* %154, align 4
  %156 = icmp ne i32 %155, 0
  br i1 %156, label %157, label %180

; <label>:157:                                    ; preds = %137
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 0)
  %158 = add i64 %pgocount5, 1
  store i64 %158, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 0)
  %159 = load i32*, i32** %8, align 8
  %160 = load i32, i32* %159, align 4
  %161 = sext i32 %160 to i64
  %162 = load i32*, i32** %8, align 8
  %163 = getelementptr inbounds i32, i32* %162, i64 1
  %164 = load i32, i32* %163, align 4
  %165 = load i32*, i32** %8, align 8
  %166 = getelementptr inbounds i32, i32* %165, i64 0
  %167 = load i32, i32* %166, align 4
  %168 = sub nsw i32 %164, %167
  %169 = sext i32 %168 to i64
  %170 = add nsw i64 %169, 2048
  %171 = ashr i64 %170, 12
  %172 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %173 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %172, i32 0, i32 1
  %174 = load i32, i32* %173, align 4
  %175 = sext i32 %174 to i64
  %176 = add nsw i64 %175, 32768
  %177 = ashr i64 %176, 16
  %178 = mul nsw i64 %171, %177
  %179 = add nsw i64 %161, %178
  br label %185

; <label>:180:                                    ; preds = %137
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 1)
  %181 = add i64 %pgocount6, 1
  store i64 %181, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 1)
  %182 = load i32*, i32** %8, align 8
  %183 = load i32, i32* %182, align 4
  %184 = sext i32 %183 to i64
  br label %185

; <label>:185:                                    ; preds = %180, %157
  %186 = phi i64 [ %179, %157 ], [ %184, %180 ]
  %187 = trunc i64 %186 to i32
  %188 = load i32*, i32** %9, align 8
  %189 = getelementptr inbounds i32, i32* %188, i32 1
  store i32* %189, i32** %9, align 8
  store i32 %187, i32* %188, align 4
  %190 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %191 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %190, i32 0, i32 0
  %192 = load i32, i32* %191, align 4
  %193 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %194 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %193, i32 0, i32 1
  %195 = load i32, i32* %194, align 4
  %196 = add nsw i32 %195, %192
  store i32 %196, i32* %194, align 4
  %197 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %198 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %197, i32 0, i32 1
  %199 = load i32, i32* %198, align 4
  %200 = sext i32 %199 to i64
  %201 = add nsw i64 %200, 128
  %202 = and i64 %201, 268435200
  %203 = icmp eq i64 %202, 0
  br i1 %203, label %204, label %215

; <label>:204:                                    ; preds = %185
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 2)
  %205 = add i64 %pgocount7, 1
  store i64 %205, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 2)
  %206 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %207 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %206, i32 0, i32 1
  %208 = load i32, i32* %207, align 4
  %209 = sext i32 %208 to i64
  %210 = add nsw i64 %209, 128
  %211 = and i64 %210, -268435456
  %212 = trunc i64 %211 to i32
  %213 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %214 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %213, i32 0, i32 1
  store i32 %212, i32* %214, align 4
  br label %215

; <label>:215:                                    ; preds = %204, %185
  br label %123

; <label>:216:                                    ; preds = %123
  %217 = load i32*, i32** %10, align 8
  %218 = load i32*, i32** %8, align 8
  %219 = ptrtoint i32* %217 to i64
  %220 = ptrtoint i32* %218 to i64
  %221 = sub i64 %219, %220
  %222 = sdiv exact i64 %221, 4
  %223 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %224 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %223, i32 0, i32 1
  %225 = load i32, i32* %224, align 4
  %226 = ashr i32 %225, 28
  %227 = add nsw i32 1, %226
  %228 = sext i32 %227 to i64
  %229 = icmp eq i64 %222, %228
  br i1 %229, label %230, label %243

; <label>:230:                                    ; preds = %216
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 7)
  %231 = add i64 %pgocount8, 1
  store i64 %231, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 7)
  %232 = load i32*, i32** %10, align 8
  %233 = getelementptr inbounds i32, i32* %232, i64 -1
  %234 = load i32, i32* %233, align 4
  %235 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %236 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %235, i32 0, i32 2
  store i32 %234, i32* %236, align 4
  %237 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %238 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %237, i32 0, i32 1
  %239 = load i32, i32* %238, align 4
  %240 = sub nsw i32 0, %239
  %241 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %242 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %241, i32 0, i32 1
  store i32 %240, i32* %242, align 4
  br label %258

; <label>:243:                                    ; preds = %216
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 8)
  %244 = add i64 %pgocount9, 1
  store i64 %244, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_resample_block, i64 0, i64 8)
  %245 = load i32*, i32** %10, align 8
  %246 = load i32*, i32** %8, align 8
  %247 = ptrtoint i32* %245 to i64
  %248 = ptrtoint i32* %246 to i64
  %249 = sub i64 %247, %248
  %250 = sdiv exact i64 %249, 4
  %251 = shl i64 %250, 28
  %252 = load %struct.resample_state*, %struct.resample_state** %6, align 8
  %253 = getelementptr inbounds %struct.resample_state, %struct.resample_state* %252, i32 0, i32 1
  %254 = load i32, i32* %253, align 4
  %255 = sext i32 %254 to i64
  %256 = sub nsw i64 %255, %251
  %257 = trunc i64 %256 to i32
  store i32 %257, i32* %253, align 4
  br label %258

; <label>:258:                                    ; preds = %243, %230
  %259 = load i32*, i32** %9, align 8
  %260 = load i32*, i32** %11, align 8
  %261 = ptrtoint i32* %259 to i64
  %262 = ptrtoint i32* %260 to i64
  %263 = sub i64 %261, %262
  %264 = sdiv exact i64 %263, 4
  %265 = trunc i64 %264 to i32
  store i32 %265, i32* %5, align 4
  br label %266

; <label>:266:                                    ; preds = %258, %16
  %267 = load i32, i32* %5, align 4
  ret i32 %267
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
