; ModuleID = 'tmp1.ll'
source_filename = "reservoir.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.III_side_info_t = type { i32, i32, i32, [2 x [4 x i32]], [2 x %struct.anon] }
%struct.anon = type { [2 x %struct.gr_info_ss] }
%struct.gr_info_ss = type { %struct.gr_info }
%struct.gr_info = type { i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, [4 x i32] }

$__llvm_profile_raw_version = comdat any

@ResvSize = internal global i32 0, align 4
@.str = private unnamed_addr constant [43 x i8] c"(l3_side->main_data_begin * 8) == ResvSize\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"reservoir.c\00", align 1
@__PRETTY_FUNCTION__.ResvFrameBegin = private unnamed_addr constant [69 x i8] c"int ResvFrameBegin(lame_global_flags *, III_side_info_t *, int, int)\00", align 1
@ResvMax = internal global i32 0, align 4
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_ResvFrameBegin = private constant [14 x i8] c"ResvFrameBegin"
@__profn_ResvMaxBits = private constant [11 x i8] c"ResvMaxBits"
@__profn_ResvAdjust = private constant [10 x i8] c"ResvAdjust"
@__profn_ResvFrameEnd = private constant [12 x i8] c"ResvFrameEnd"
@__profc_ResvFrameBegin = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ResvFrameBegin = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7635424879916477206, i64 104634138130, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ResvFrameBegin, i32 0, i32 0), i8* bitcast (i32 (%struct.lame_global_flags*, %struct.III_side_info_t*, i32, i32)* @ResvFrameBegin to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ResvMaxBits = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ResvMaxBits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5598859057867848001, i64 58053639314, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_ResvMaxBits, i32 0, i32 0), i8* bitcast (void (i32, i32*, i32*, i32)* @ResvMaxBits to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ResvAdjust = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ResvAdjust = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2222758890833364476, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ResvAdjust, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, %struct.gr_info*, %struct.III_side_info_t*, i32)* @ResvAdjust to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ResvFrameEnd = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ResvFrameEnd = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6019901263895274833, i64 58736958268, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ResvFrameEnd, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, %struct.III_side_info_t*, i32)* @ResvFrameEnd to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [52 x i8] c"2\00ResvFrameBegin\01ResvMaxBits\01ResvAdjust\01ResvFrameEnd", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ResvFrameBegin to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ResvMaxBits to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ResvAdjust to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ResvFrameEnd to i8*), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @ResvFrameBegin(%struct.lame_global_flags*, %struct.III_side_info_t*, i32, i32) #0 {
  %5 = alloca %struct.lame_global_flags*, align 8
  %6 = alloca %struct.III_side_info_t*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %5, align 8
  store %struct.III_side_info_t* %1, %struct.III_side_info_t** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %11 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %12 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %11, i32 0, i32 39
  %13 = load i64, i64* %12, align 8
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ResvFrameBegin, i64 0, i64 5)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ResvFrameBegin, i64 0, i64 5)
  store i32 0, i32* @ResvSize, align 4
  br label %17

; <label>:17:                                     ; preds = %15, %4
  %18 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %19 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %18, i32 0, i32 43
  %20 = load i32, i32* %19, align 8
  %21 = icmp eq i32 %20, 1
  br i1 %21, label %22, label %23

; <label>:22:                                     ; preds = %17
  store i32 4088, i32* %10, align 4
  br label %25

; <label>:23:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ResvFrameBegin, i64 0, i64 1)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ResvFrameBegin, i64 0, i64 1)
  store i32 2040, i32* %10, align 4
  br label %25

; <label>:25:                                     ; preds = %23, %22
  %26 = load %struct.III_side_info_t*, %struct.III_side_info_t** %6, align 8
  %27 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %26, i32 0, i32 0
  %28 = load i32, i32* %27, align 8
  %29 = mul nsw i32 %28, 8
  %30 = load i32, i32* @ResvSize, align 4
  %31 = icmp eq i32 %29, %30
  br i1 %31, label %32, label %33

; <label>:32:                                     ; preds = %25
  br label %36

; <label>:33:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ResvFrameBegin, i64 0, i64 6)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ResvFrameBegin, i64 0, i64 6)
  call void @__assert_fail(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 68, i8* getelementptr inbounds ([69 x i8], [69 x i8]* @__PRETTY_FUNCTION__.ResvFrameBegin, i32 0, i32 0)) #3
  unreachable
                                                  ; No predecessors!
  br label %36

; <label>:36:                                     ; preds = %35, %32
  %37 = load i32, i32* %7, align 4
  %38 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %39 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %38, i32 0, i32 45
  %40 = load i32, i32* %39, align 8
  %41 = mul nsw i32 %37, %40
  %42 = load i32, i32* @ResvSize, align 4
  %43 = add nsw i32 %41, %42
  store i32 %43, i32* %9, align 4
  %44 = load i32, i32* %8, align 4
  %45 = icmp sgt i32 %44, 7680
  br i1 %45, label %46, label %48

; <label>:46:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ResvFrameBegin, i64 0, i64 2)
  %47 = add i64 %pgocount3, 1
  store i64 %47, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ResvFrameBegin, i64 0, i64 2)
  store i32 0, i32* @ResvMax, align 4
  br label %52

; <label>:48:                                     ; preds = %36
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ResvFrameBegin, i64 0, i64 3)
  %49 = add i64 %pgocount4, 1
  store i64 %49, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ResvFrameBegin, i64 0, i64 3)
  %50 = load i32, i32* %8, align 4
  %51 = sub nsw i32 7680, %50
  store i32 %51, i32* @ResvMax, align 4
  br label %52

; <label>:52:                                     ; preds = %48, %46
  %53 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %54 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %53, i32 0, i32 17
  %55 = load i32, i32* %54, align 8
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %59

; <label>:57:                                     ; preds = %52
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ResvFrameBegin, i64 0, i64 0)
  %58 = add i64 %pgocount5, 1
  store i64 %58, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ResvFrameBegin, i64 0, i64 0)
  store i32 0, i32* @ResvMax, align 4
  br label %59

; <label>:59:                                     ; preds = %57, %52
  %60 = load i32, i32* @ResvMax, align 4
  %61 = load i32, i32* %10, align 4
  %62 = icmp sgt i32 %60, %61
  br i1 %62, label %63, label %66

; <label>:63:                                     ; preds = %59
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ResvFrameBegin, i64 0, i64 4)
  %64 = add i64 %pgocount6, 1
  store i64 %64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ResvFrameBegin, i64 0, i64 4)
  %65 = load i32, i32* %10, align 4
  store i32 %65, i32* @ResvMax, align 4
  br label %66

; <label>:66:                                     ; preds = %63, %59
  %67 = load i32, i32* %9, align 4
  ret i32 %67
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

; Function Attrs: noinline nounwind uwtable
define void @ResvMaxBits(i32, i32*, i32*, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i32* %1, i32** %6, align 8
  store i32* %2, i32** %7, align 8
  store i32 %3, i32* %8, align 4
  %10 = load i32, i32* %5, align 4
  %11 = load i32*, i32** %6, align 8
  store i32 %10, i32* %11, align 4
  %12 = load i32, i32* @ResvSize, align 4
  %13 = load i32, i32* @ResvMax, align 4
  %14 = mul nsw i32 %13, 9
  %15 = sdiv i32 %14, 10
  %16 = icmp sgt i32 %12, %15
  br i1 %16, label %17, label %27

; <label>:17:                                     ; preds = %4
  %18 = load i32, i32* @ResvSize, align 4
  %19 = load i32, i32* @ResvMax, align 4
  %20 = mul nsw i32 %19, 9
  %21 = sdiv i32 %20, 10
  %22 = sub nsw i32 %18, %21
  store i32 %22, i32* %9, align 4
  %23 = load i32, i32* %9, align 4
  %24 = load i32*, i32** %6, align 8
  %25 = load i32, i32* %24, align 4
  %26 = add nsw i32 %25, %23
  store i32 %26, i32* %24, align 4
  br label %36

; <label>:27:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_ResvMaxBits, i64 0, i64 0)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_ResvMaxBits, i64 0, i64 0)
  store i32 0, i32* %9, align 4
  %29 = load i32, i32* %5, align 4
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 1.520000e+01
  %32 = fptosi double %31 to i32
  %33 = load i32*, i32** %6, align 8
  %34 = load i32, i32* %33, align 4
  %35 = sub nsw i32 %34, %32
  store i32 %35, i32* %33, align 4
  br label %36

; <label>:36:                                     ; preds = %27, %17
  %37 = load i32, i32* @ResvSize, align 4
  %38 = load i32, i32* @ResvMax, align 4
  %39 = mul nsw i32 %38, 6
  %40 = sdiv i32 %39, 10
  %41 = icmp slt i32 %37, %40
  br i1 %41, label %42, label %45

; <label>:42:                                     ; preds = %36
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_ResvMaxBits, i64 0, i64 1)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_ResvMaxBits, i64 0, i64 1)
  %44 = load i32, i32* @ResvSize, align 4
  br label %50

; <label>:45:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_ResvMaxBits, i64 0, i64 2)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_ResvMaxBits, i64 0, i64 2)
  %47 = load i32, i32* @ResvMax, align 4
  %48 = mul nsw i32 %47, 6
  %49 = sdiv i32 %48, 10
  br label %50

; <label>:50:                                     ; preds = %45, %42
  %51 = phi i32 [ %44, %42 ], [ %49, %45 ]
  %52 = load i32*, i32** %7, align 8
  store i32 %51, i32* %52, align 4
  %53 = load i32, i32* %9, align 4
  %54 = load i32*, i32** %7, align 8
  %55 = load i32, i32* %54, align 4
  %56 = sub nsw i32 %55, %53
  store i32 %56, i32* %54, align 4
  %57 = load i32*, i32** %7, align 8
  %58 = load i32, i32* %57, align 4
  %59 = icmp slt i32 %58, 0
  br i1 %59, label %60, label %63

; <label>:60:                                     ; preds = %50
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_ResvMaxBits, i64 0, i64 3)
  %61 = add i64 %pgocount3, 1
  store i64 %61, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_ResvMaxBits, i64 0, i64 3)
  %62 = load i32*, i32** %7, align 8
  store i32 0, i32* %62, align 4
  br label %63

; <label>:63:                                     ; preds = %60, %50
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @ResvAdjust(%struct.lame_global_flags*, %struct.gr_info*, %struct.III_side_info_t*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ResvAdjust, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ResvAdjust, i64 0, i64 0)
  %6 = alloca %struct.lame_global_flags*, align 8
  %7 = alloca %struct.gr_info*, align 8
  %8 = alloca %struct.III_side_info_t*, align 8
  %9 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %6, align 8
  store %struct.gr_info* %1, %struct.gr_info** %7, align 8
  store %struct.III_side_info_t* %2, %struct.III_side_info_t** %8, align 8
  store i32 %3, i32* %9, align 4
  %10 = load i32, i32* %9, align 4
  %11 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %12 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %11, i32 0, i32 46
  %13 = load i32, i32* %12, align 4
  %14 = sdiv i32 %10, %13
  %15 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %16 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %15, i32 0, i32 0
  %17 = load i32, i32* %16, align 8
  %18 = sub i32 %14, %17
  %19 = load i32, i32* @ResvSize, align 4
  %20 = add i32 %19, %18
  store i32 %20, i32* @ResvSize, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @ResvFrameEnd(%struct.lame_global_flags*, %struct.III_side_info_t*, i32) #0 {
  %4 = alloca %struct.lame_global_flags*, align 8
  %5 = alloca %struct.III_side_info_t*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %4, align 8
  store %struct.III_side_info_t* %1, %struct.III_side_info_t** %5, align 8
  store i32 %2, i32* %6, align 4
  %9 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %10 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %9, i32 0, i32 46
  %11 = load i32, i32* %10, align 4
  %12 = icmp eq i32 %11, 2
  br i1 %12, label %13, label %22

; <label>:13:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ResvFrameEnd, i64 0, i64 2)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ResvFrameEnd, i64 0, i64 2)
  %15 = load i32, i32* %6, align 4
  %16 = and i32 %15, 1
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %22

; <label>:18:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ResvFrameEnd, i64 0, i64 4)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ResvFrameEnd, i64 0, i64 4)
  %20 = load i32, i32* @ResvSize, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* @ResvSize, align 4
  br label %22

; <label>:22:                                     ; preds = %18, %13, %3
  %23 = load i32, i32* @ResvSize, align 4
  %24 = load i32, i32* @ResvMax, align 4
  %25 = sub nsw i32 %23, %24
  store i32 %25, i32* %8, align 4
  %26 = load i32, i32* %8, align 4
  %27 = icmp slt i32 %26, 0
  br i1 %27, label %28, label %30

; <label>:28:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ResvFrameEnd, i64 0, i64 3)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ResvFrameEnd, i64 0, i64 3)
  store i32 0, i32* %8, align 4
  br label %30

; <label>:30:                                     ; preds = %28, %22
  %31 = load i32, i32* %8, align 4
  %32 = load i32, i32* @ResvSize, align 4
  %33 = sub nsw i32 %32, %31
  store i32 %33, i32* @ResvSize, align 4
  %34 = load i32, i32* %8, align 4
  store i32 %34, i32* %7, align 4
  %35 = load i32, i32* @ResvSize, align 4
  %36 = srem i32 %35, 8
  store i32 %36, i32* %8, align 4
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %46

; <label>:38:                                     ; preds = %30
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ResvFrameEnd, i64 0, i64 1)
  %39 = add i64 %pgocount3, 1
  store i64 %39, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ResvFrameEnd, i64 0, i64 1)
  %40 = load i32, i32* %8, align 4
  %41 = load i32, i32* %7, align 4
  %42 = add nsw i32 %41, %40
  store i32 %42, i32* %7, align 4
  %43 = load i32, i32* %8, align 4
  %44 = load i32, i32* @ResvSize, align 4
  %45 = sub nsw i32 %44, %43
  store i32 %45, i32* @ResvSize, align 4
  br label %46

; <label>:46:                                     ; preds = %38, %30
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ResvFrameEnd, i64 0, i64 0)
  %47 = add i64 %pgocount4, 1
  store i64 %47, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ResvFrameEnd, i64 0, i64 0)
  %48 = load i32, i32* %7, align 4
  %49 = load %struct.III_side_info_t*, %struct.III_side_info_t** %5, align 8
  %50 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %49, i32 0, i32 2
  store i32 %48, i32* %50, align 8
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
