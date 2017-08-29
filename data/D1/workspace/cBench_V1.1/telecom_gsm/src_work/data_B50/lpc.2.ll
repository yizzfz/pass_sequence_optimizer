; ModuleID = 'tmp1.ll'
source_filename = "lpc.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [9 x i8] c"smax > 0\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"lpc.c\00", align 1
@__PRETTY_FUNCTION__.Autocorrelation = private unnamed_addr constant [41 x i8] c"void Autocorrelation(word *, longword *)\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"scalauto <= 4\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"L_ACF[0] != 0\00", align 1
@__PRETTY_FUNCTION__.Reflection_coefficients = private unnamed_addr constant [49 x i8] c"void Reflection_coefficients(longword *, word *)\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"temp >= 0 && temp < 32\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"*r >= 0\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"*r != MIN_WORD\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"temp >= 0\00", align 1
@__PRETTY_FUNCTION__.Transformation_to_Log_Area_Ratios = private unnamed_addr constant [47 x i8] c"void Transformation_to_Log_Area_Ratios(word *)\00", align 1
@.str.8 = private unnamed_addr constant [14 x i8] c"temp >= 11059\00", align 1
@.str.9 = private unnamed_addr constant [14 x i8] c"temp >= 26112\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_Gsm_LPC_Analysis = private constant [16 x i8] c"Gsm_LPC_Analysis"
@__profn_tmp1.ll_Autocorrelation = private constant [23 x i8] c"tmp1.ll:Autocorrelation"
@__profn_tmp1.ll_Reflection_coefficients = private constant [31 x i8] c"tmp1.ll:Reflection_coefficients"
@__profn_tmp1.ll_Transformation_to_Log_Area_Ratios = private constant [41 x i8] c"tmp1.ll:Transformation_to_Log_Area_Ratios"
@__profn_tmp1.ll_Quantization_and_coding = private constant [31 x i8] c"tmp1.ll:Quantization_and_coding"
@__profc_Gsm_LPC_Analysis = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Gsm_LPC_Analysis = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8478654869926214765, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Gsm_LPC_Analysis, i32 0, i32 0), i8* bitcast (void (%struct.gsm_state*, i16*, i16*)* @Gsm_LPC_Analysis to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Autocorrelation = private global [22 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Autocorrelation = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8028694484009886872, i64 377079141771, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i32 0, i32 0), i8* null, i8* null, i32 22, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Reflection_coefficients = private global [25 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Reflection_coefficients = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6304356150944015926, i64 216173176189892001, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i32 0, i32 0), i8* null, i8* null, i32 25, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Transformation_to_Log_Area_Ratios = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Transformation_to_Log_Area_Ratios = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6425497743129580287, i64 204237665054, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i32 0, i32 0), i8* null, i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Quantization_and_coding = private global [49 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Quantization_and_coding = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7993112653428073799, i64 1152922065432434212, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i32 0, i32 0), i8* null, i8* null, i32 49, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [149 x i8] c"\92\01\00Gsm_LPC_Analysis\01tmp1.ll:Autocorrelation\01tmp1.ll:Reflection_coefficients\01tmp1.ll:Transformation_to_Log_Area_Ratios\01tmp1.ll:Quantization_and_coding", section "__llvm_prf_names"
@llvm.used = appending global [6 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Gsm_LPC_Analysis to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Autocorrelation to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Reflection_coefficients to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Transformation_to_Log_Area_Ratios to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Quantization_and_coding to i8*), i8* getelementptr inbounds ([149 x i8], [149 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @Gsm_LPC_Analysis(%struct.gsm_state*, i16*, i16*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Gsm_LPC_Analysis, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Gsm_LPC_Analysis, i64 0, i64 0)
  %5 = alloca %struct.gsm_state*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca [9 x i64], align 16
  store %struct.gsm_state* %0, %struct.gsm_state** %5, align 8
  store i16* %1, i16** %6, align 8
  store i16* %2, i16** %7, align 8
  %9 = load i16*, i16** %6, align 8
  %10 = getelementptr inbounds [9 x i64], [9 x i64]* %8, i32 0, i32 0
  call void @Autocorrelation(i16* %9, i64* %10)
  %11 = getelementptr inbounds [9 x i64], [9 x i64]* %8, i32 0, i32 0
  %12 = load i16*, i16** %7, align 8
  call void @Reflection_coefficients(i64* %11, i16* %12)
  %13 = load i16*, i16** %7, align 8
  call void @Transformation_to_Log_Area_Ratios(i16* %13)
  %14 = load i16*, i16** %7, align 8
  call void @Quantization_and_coding(i16* %14)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Autocorrelation(i16*, i64*) #0 {
  %3 = alloca i16*, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  %10 = alloca i16*, align 8
  %11 = alloca i16, align 2
  store i16* %0, i16** %3, align 8
  store i64* %1, i64** %4, align 8
  store i16 0, i16* %8, align 2
  store i32 0, i32* %5, align 4
  br label %12

; <label>:12:                                     ; preds = %64, %2
  %13 = load i32, i32* %5, align 4
  %14 = icmp sle i32 %13, 159
  br i1 %14, label %15, label %67

; <label>:15:                                     ; preds = %12
  %16 = load i16*, i16** %3, align 8
  %17 = load i32, i32* %5, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i16, i16* %16, i64 %18
  %20 = load i16, i16* %19, align 2
  %21 = sext i16 %20 to i32
  %22 = icmp slt i32 %21, 0
  br i1 %22, label %23, label %44

; <label>:23:                                     ; preds = %15
  %24 = load i16*, i16** %3, align 8
  %25 = load i32, i32* %5, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i16, i16* %24, i64 %26
  %28 = load i16, i16* %27, align 2
  %29 = sext i16 %28 to i32
  %30 = icmp eq i32 %29, -32768
  br i1 %30, label %31, label %33

; <label>:31:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 6)
  %32 = add i64 %pgocount, 1
  store i64 %32, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 6)
  br label %42

; <label>:33:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 7)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 7)
  %35 = load i16*, i16** %3, align 8
  %36 = load i32, i32* %5, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i16, i16* %35, i64 %37
  %39 = load i16, i16* %38, align 2
  %40 = sext i16 %39 to i32
  %41 = sub nsw i32 0, %40
  br label %42

; <label>:42:                                     ; preds = %33, %31
  %43 = phi i32 [ 32767, %31 ], [ %41, %33 ]
  br label %52

; <label>:44:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 3)
  %45 = add i64 %pgocount2, 1
  store i64 %45, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 3)
  %46 = load i16*, i16** %3, align 8
  %47 = load i32, i32* %5, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i16, i16* %46, i64 %48
  %50 = load i16, i16* %49, align 2
  %51 = sext i16 %50 to i32
  br label %52

; <label>:52:                                     ; preds = %44, %42
  %53 = phi i32 [ %43, %42 ], [ %51, %44 ]
  %54 = trunc i32 %53 to i16
  store i16 %54, i16* %7, align 2
  %55 = load i16, i16* %7, align 2
  %56 = sext i16 %55 to i32
  %57 = load i16, i16* %8, align 2
  %58 = sext i16 %57 to i32
  %59 = icmp sgt i32 %56, %58
  br i1 %59, label %60, label %63

; <label>:60:                                     ; preds = %52
  %pgocount3 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 5)
  %61 = add i64 %pgocount3, 1
  store i64 %61, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 5)
  %62 = load i16, i16* %7, align 2
  store i16 %62, i16* %8, align 2
  br label %63

; <label>:63:                                     ; preds = %60, %52
  br label %64

; <label>:64:                                     ; preds = %63
  %65 = load i32, i32* %5, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, i32* %5, align 4
  br label %12

; <label>:67:                                     ; preds = %12
  %68 = load i16, i16* %8, align 2
  %69 = sext i16 %68 to i32
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %73

; <label>:71:                                     ; preds = %67
  %pgocount4 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 15)
  %72 = add i64 %pgocount4, 1
  store i64 %72, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 15)
  store i16 0, i16* %9, align 2
  br label %90

; <label>:73:                                     ; preds = %67
  %74 = load i16, i16* %8, align 2
  %75 = sext i16 %74 to i32
  %76 = icmp sgt i32 %75, 0
  br i1 %76, label %77, label %78

; <label>:77:                                     ; preds = %73
  br label %81

; <label>:78:                                     ; preds = %73
  %pgocount5 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 20)
  %79 = add i64 %pgocount5, 1
  store i64 %79, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 20)
  call void @__assert_fail(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 57, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__PRETTY_FUNCTION__.Autocorrelation, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %81

; <label>:81:                                     ; preds = %80, %77
  %pgocount6 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 13)
  %82 = add i64 %pgocount6, 1
  store i64 %82, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 13)
  %83 = load i16, i16* %8, align 2
  %84 = sext i16 %83 to i64
  %85 = shl i64 %84, 16
  %86 = call signext i16 @gsm_norm(i64 %85)
  %87 = sext i16 %86 to i32
  %88 = sub nsw i32 4, %87
  %89 = trunc i32 %88 to i16
  store i16 %89, i16* %9, align 2
  br label %90

; <label>:90:                                     ; preds = %81, %71
  %91 = load i16, i16* %9, align 2
  %92 = sext i16 %91 to i32
  %93 = icmp sgt i32 %92, 0
  br i1 %93, label %94, label %199

; <label>:94:                                     ; preds = %90
  %95 = load i16, i16* %9, align 2
  %96 = sext i16 %95 to i32
  switch i32 %96, label %197 [
    i32 1, label %97
    i32 2, label %122
    i32 3, label %147
    i32 4, label %172
  ]

; <label>:97:                                     ; preds = %94
  store i32 0, i32* %5, align 4
  br label %98

; <label>:98:                                     ; preds = %116, %97
  %99 = load i32, i32* %5, align 4
  %100 = icmp sle i32 %99, 159
  br i1 %100, label %101, label %120

; <label>:101:                                    ; preds = %98
  %102 = load i16*, i16** %3, align 8
  %103 = load i32, i32* %5, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i16, i16* %102, i64 %104
  %106 = load i16, i16* %105, align 2
  %107 = sext i16 %106 to i64
  %108 = mul nsw i64 %107, 16384
  %109 = add nsw i64 %108, 16384
  %110 = ashr i64 %109, 15
  %111 = trunc i64 %110 to i16
  %112 = load i16*, i16** %3, align 8
  %113 = load i32, i32* %5, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i16, i16* %112, i64 %114
  store i16 %111, i16* %115, align 2
  br label %116

; <label>:116:                                    ; preds = %101
  %pgocount7 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 8)
  %117 = add i64 %pgocount7, 1
  store i64 %117, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 8)
  %118 = load i32, i32* %5, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, i32* %5, align 4
  br label %98

; <label>:120:                                    ; preds = %98
  %pgocount8 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 16)
  %121 = add i64 %pgocount8, 1
  store i64 %121, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 16)
  br label %197

; <label>:122:                                    ; preds = %94
  store i32 0, i32* %5, align 4
  br label %123

; <label>:123:                                    ; preds = %141, %122
  %124 = load i32, i32* %5, align 4
  %125 = icmp sle i32 %124, 159
  br i1 %125, label %126, label %145

; <label>:126:                                    ; preds = %123
  %127 = load i16*, i16** %3, align 8
  %128 = load i32, i32* %5, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i16, i16* %127, i64 %129
  %131 = load i16, i16* %130, align 2
  %132 = sext i16 %131 to i64
  %133 = mul nsw i64 %132, 8192
  %134 = add nsw i64 %133, 16384
  %135 = ashr i64 %134, 15
  %136 = trunc i64 %135 to i16
  %137 = load i16*, i16** %3, align 8
  %138 = load i32, i32* %5, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i16, i16* %137, i64 %139
  store i16 %136, i16* %140, align 2
  br label %141

; <label>:141:                                    ; preds = %126
  %pgocount9 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 9)
  %142 = add i64 %pgocount9, 1
  store i64 %142, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 9)
  %143 = load i32, i32* %5, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, i32* %5, align 4
  br label %123

; <label>:145:                                    ; preds = %123
  %pgocount10 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 17)
  %146 = add i64 %pgocount10, 1
  store i64 %146, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 17)
  br label %197

; <label>:147:                                    ; preds = %94
  store i32 0, i32* %5, align 4
  br label %148

; <label>:148:                                    ; preds = %166, %147
  %149 = load i32, i32* %5, align 4
  %150 = icmp sle i32 %149, 159
  br i1 %150, label %151, label %170

; <label>:151:                                    ; preds = %148
  %152 = load i16*, i16** %3, align 8
  %153 = load i32, i32* %5, align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds i16, i16* %152, i64 %154
  %156 = load i16, i16* %155, align 2
  %157 = sext i16 %156 to i64
  %158 = mul nsw i64 %157, 4096
  %159 = add nsw i64 %158, 16384
  %160 = ashr i64 %159, 15
  %161 = trunc i64 %160 to i16
  %162 = load i16*, i16** %3, align 8
  %163 = load i32, i32* %5, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i16, i16* %162, i64 %164
  store i16 %161, i16* %165, align 2
  br label %166

; <label>:166:                                    ; preds = %151
  %pgocount11 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 10)
  %167 = add i64 %pgocount11, 1
  store i64 %167, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 10)
  %168 = load i32, i32* %5, align 4
  %169 = add nsw i32 %168, 1
  store i32 %169, i32* %5, align 4
  br label %148

; <label>:170:                                    ; preds = %148
  %pgocount12 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 18)
  %171 = add i64 %pgocount12, 1
  store i64 %171, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 18)
  br label %197

; <label>:172:                                    ; preds = %94
  store i32 0, i32* %5, align 4
  br label %173

; <label>:173:                                    ; preds = %191, %172
  %174 = load i32, i32* %5, align 4
  %175 = icmp sle i32 %174, 159
  br i1 %175, label %176, label %195

; <label>:176:                                    ; preds = %173
  %177 = load i16*, i16** %3, align 8
  %178 = load i32, i32* %5, align 4
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds i16, i16* %177, i64 %179
  %181 = load i16, i16* %180, align 2
  %182 = sext i16 %181 to i64
  %183 = mul nsw i64 %182, 2048
  %184 = add nsw i64 %183, 16384
  %185 = ashr i64 %184, 15
  %186 = trunc i64 %185 to i16
  %187 = load i16*, i16** %3, align 8
  %188 = load i32, i32* %5, align 4
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds i16, i16* %187, i64 %189
  store i16 %186, i16* %190, align 2
  br label %191

; <label>:191:                                    ; preds = %176
  %pgocount13 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 11)
  %192 = add i64 %pgocount13, 1
  store i64 %192, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 11)
  %193 = load i32, i32* %5, align 4
  %194 = add nsw i32 %193, 1
  store i32 %194, i32* %5, align 4
  br label %173

; <label>:195:                                    ; preds = %173
  %pgocount14 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 19)
  %196 = add i64 %pgocount14, 1
  store i64 %196, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 19)
  br label %197

; <label>:197:                                    ; preds = %195, %170, %145, %120, %94
  %pgocount15 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 12)
  %198 = add i64 %pgocount15, 1
  store i64 %198, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 12)
  br label %199

; <label>:199:                                    ; preds = %197, %90
  %200 = load i16*, i16** %3, align 8
  store i16* %200, i16** %10, align 8
  %201 = load i16*, i16** %10, align 8
  %202 = load i16, i16* %201, align 2
  store i16 %202, i16* %11, align 2
  store i32 9, i32* %5, align 4
  br label %203

; <label>:203:                                    ; preds = %208, %199
  %204 = load i32, i32* %5, align 4
  %205 = add nsw i32 %204, -1
  store i32 %205, i32* %5, align 4
  %206 = icmp ne i32 %204, 0
  br i1 %206, label %207, label %214

; <label>:207:                                    ; preds = %203
  br label %208

; <label>:208:                                    ; preds = %207
  %pgocount16 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 0)
  %209 = add i64 %pgocount16, 1
  store i64 %209, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 0)
  %210 = load i64*, i64** %4, align 8
  %211 = load i32, i32* %5, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds i64, i64* %210, i64 %212
  store i64 0, i64* %213, align 8
  br label %203

; <label>:214:                                    ; preds = %203
  %215 = load i16, i16* %11, align 2
  %216 = sext i16 %215 to i64
  %217 = load i16*, i16** %10, align 8
  %218 = getelementptr inbounds i16, i16* %217, i64 0
  %219 = load i16, i16* %218, align 2
  %220 = sext i16 %219 to i64
  %221 = mul nsw i64 %216, %220
  %222 = load i64*, i64** %4, align 8
  %223 = getelementptr inbounds i64, i64* %222, i64 0
  %224 = load i64, i64* %223, align 8
  %225 = add nsw i64 %224, %221
  store i64 %225, i64* %223, align 8
  %226 = load i16*, i16** %10, align 8
  %227 = getelementptr inbounds i16, i16* %226, i32 1
  store i16* %227, i16** %10, align 8
  %228 = load i16, i16* %227, align 2
  store i16 %228, i16* %11, align 2
  %229 = load i16, i16* %11, align 2
  %230 = sext i16 %229 to i64
  %231 = load i16*, i16** %10, align 8
  %232 = getelementptr inbounds i16, i16* %231, i64 0
  %233 = load i16, i16* %232, align 2
  %234 = sext i16 %233 to i64
  %235 = mul nsw i64 %230, %234
  %236 = load i64*, i64** %4, align 8
  %237 = getelementptr inbounds i64, i64* %236, i64 0
  %238 = load i64, i64* %237, align 8
  %239 = add nsw i64 %238, %235
  store i64 %239, i64* %237, align 8
  %240 = load i16, i16* %11, align 2
  %241 = sext i16 %240 to i64
  %242 = load i16*, i16** %10, align 8
  %243 = getelementptr inbounds i16, i16* %242, i64 -1
  %244 = load i16, i16* %243, align 2
  %245 = sext i16 %244 to i64
  %246 = mul nsw i64 %241, %245
  %247 = load i64*, i64** %4, align 8
  %248 = getelementptr inbounds i64, i64* %247, i64 1
  %249 = load i64, i64* %248, align 8
  %250 = add nsw i64 %249, %246
  store i64 %250, i64* %248, align 8
  %251 = load i16*, i16** %10, align 8
  %252 = getelementptr inbounds i16, i16* %251, i32 1
  store i16* %252, i16** %10, align 8
  %253 = load i16, i16* %252, align 2
  store i16 %253, i16* %11, align 2
  %254 = load i16, i16* %11, align 2
  %255 = sext i16 %254 to i64
  %256 = load i16*, i16** %10, align 8
  %257 = getelementptr inbounds i16, i16* %256, i64 0
  %258 = load i16, i16* %257, align 2
  %259 = sext i16 %258 to i64
  %260 = mul nsw i64 %255, %259
  %261 = load i64*, i64** %4, align 8
  %262 = getelementptr inbounds i64, i64* %261, i64 0
  %263 = load i64, i64* %262, align 8
  %264 = add nsw i64 %263, %260
  store i64 %264, i64* %262, align 8
  %265 = load i16, i16* %11, align 2
  %266 = sext i16 %265 to i64
  %267 = load i16*, i16** %10, align 8
  %268 = getelementptr inbounds i16, i16* %267, i64 -1
  %269 = load i16, i16* %268, align 2
  %270 = sext i16 %269 to i64
  %271 = mul nsw i64 %266, %270
  %272 = load i64*, i64** %4, align 8
  %273 = getelementptr inbounds i64, i64* %272, i64 1
  %274 = load i64, i64* %273, align 8
  %275 = add nsw i64 %274, %271
  store i64 %275, i64* %273, align 8
  %276 = load i16, i16* %11, align 2
  %277 = sext i16 %276 to i64
  %278 = load i16*, i16** %10, align 8
  %279 = getelementptr inbounds i16, i16* %278, i64 -2
  %280 = load i16, i16* %279, align 2
  %281 = sext i16 %280 to i64
  %282 = mul nsw i64 %277, %281
  %283 = load i64*, i64** %4, align 8
  %284 = getelementptr inbounds i64, i64* %283, i64 2
  %285 = load i64, i64* %284, align 8
  %286 = add nsw i64 %285, %282
  store i64 %286, i64* %284, align 8
  %287 = load i16*, i16** %10, align 8
  %288 = getelementptr inbounds i16, i16* %287, i32 1
  store i16* %288, i16** %10, align 8
  %289 = load i16, i16* %288, align 2
  store i16 %289, i16* %11, align 2
  %290 = load i16, i16* %11, align 2
  %291 = sext i16 %290 to i64
  %292 = load i16*, i16** %10, align 8
  %293 = getelementptr inbounds i16, i16* %292, i64 0
  %294 = load i16, i16* %293, align 2
  %295 = sext i16 %294 to i64
  %296 = mul nsw i64 %291, %295
  %297 = load i64*, i64** %4, align 8
  %298 = getelementptr inbounds i64, i64* %297, i64 0
  %299 = load i64, i64* %298, align 8
  %300 = add nsw i64 %299, %296
  store i64 %300, i64* %298, align 8
  %301 = load i16, i16* %11, align 2
  %302 = sext i16 %301 to i64
  %303 = load i16*, i16** %10, align 8
  %304 = getelementptr inbounds i16, i16* %303, i64 -1
  %305 = load i16, i16* %304, align 2
  %306 = sext i16 %305 to i64
  %307 = mul nsw i64 %302, %306
  %308 = load i64*, i64** %4, align 8
  %309 = getelementptr inbounds i64, i64* %308, i64 1
  %310 = load i64, i64* %309, align 8
  %311 = add nsw i64 %310, %307
  store i64 %311, i64* %309, align 8
  %312 = load i16, i16* %11, align 2
  %313 = sext i16 %312 to i64
  %314 = load i16*, i16** %10, align 8
  %315 = getelementptr inbounds i16, i16* %314, i64 -2
  %316 = load i16, i16* %315, align 2
  %317 = sext i16 %316 to i64
  %318 = mul nsw i64 %313, %317
  %319 = load i64*, i64** %4, align 8
  %320 = getelementptr inbounds i64, i64* %319, i64 2
  %321 = load i64, i64* %320, align 8
  %322 = add nsw i64 %321, %318
  store i64 %322, i64* %320, align 8
  %323 = load i16, i16* %11, align 2
  %324 = sext i16 %323 to i64
  %325 = load i16*, i16** %10, align 8
  %326 = getelementptr inbounds i16, i16* %325, i64 -3
  %327 = load i16, i16* %326, align 2
  %328 = sext i16 %327 to i64
  %329 = mul nsw i64 %324, %328
  %330 = load i64*, i64** %4, align 8
  %331 = getelementptr inbounds i64, i64* %330, i64 3
  %332 = load i64, i64* %331, align 8
  %333 = add nsw i64 %332, %329
  store i64 %333, i64* %331, align 8
  %334 = load i16*, i16** %10, align 8
  %335 = getelementptr inbounds i16, i16* %334, i32 1
  store i16* %335, i16** %10, align 8
  %336 = load i16, i16* %335, align 2
  store i16 %336, i16* %11, align 2
  %337 = load i16, i16* %11, align 2
  %338 = sext i16 %337 to i64
  %339 = load i16*, i16** %10, align 8
  %340 = getelementptr inbounds i16, i16* %339, i64 0
  %341 = load i16, i16* %340, align 2
  %342 = sext i16 %341 to i64
  %343 = mul nsw i64 %338, %342
  %344 = load i64*, i64** %4, align 8
  %345 = getelementptr inbounds i64, i64* %344, i64 0
  %346 = load i64, i64* %345, align 8
  %347 = add nsw i64 %346, %343
  store i64 %347, i64* %345, align 8
  %348 = load i16, i16* %11, align 2
  %349 = sext i16 %348 to i64
  %350 = load i16*, i16** %10, align 8
  %351 = getelementptr inbounds i16, i16* %350, i64 -1
  %352 = load i16, i16* %351, align 2
  %353 = sext i16 %352 to i64
  %354 = mul nsw i64 %349, %353
  %355 = load i64*, i64** %4, align 8
  %356 = getelementptr inbounds i64, i64* %355, i64 1
  %357 = load i64, i64* %356, align 8
  %358 = add nsw i64 %357, %354
  store i64 %358, i64* %356, align 8
  %359 = load i16, i16* %11, align 2
  %360 = sext i16 %359 to i64
  %361 = load i16*, i16** %10, align 8
  %362 = getelementptr inbounds i16, i16* %361, i64 -2
  %363 = load i16, i16* %362, align 2
  %364 = sext i16 %363 to i64
  %365 = mul nsw i64 %360, %364
  %366 = load i64*, i64** %4, align 8
  %367 = getelementptr inbounds i64, i64* %366, i64 2
  %368 = load i64, i64* %367, align 8
  %369 = add nsw i64 %368, %365
  store i64 %369, i64* %367, align 8
  %370 = load i16, i16* %11, align 2
  %371 = sext i16 %370 to i64
  %372 = load i16*, i16** %10, align 8
  %373 = getelementptr inbounds i16, i16* %372, i64 -3
  %374 = load i16, i16* %373, align 2
  %375 = sext i16 %374 to i64
  %376 = mul nsw i64 %371, %375
  %377 = load i64*, i64** %4, align 8
  %378 = getelementptr inbounds i64, i64* %377, i64 3
  %379 = load i64, i64* %378, align 8
  %380 = add nsw i64 %379, %376
  store i64 %380, i64* %378, align 8
  %381 = load i16, i16* %11, align 2
  %382 = sext i16 %381 to i64
  %383 = load i16*, i16** %10, align 8
  %384 = getelementptr inbounds i16, i16* %383, i64 -4
  %385 = load i16, i16* %384, align 2
  %386 = sext i16 %385 to i64
  %387 = mul nsw i64 %382, %386
  %388 = load i64*, i64** %4, align 8
  %389 = getelementptr inbounds i64, i64* %388, i64 4
  %390 = load i64, i64* %389, align 8
  %391 = add nsw i64 %390, %387
  store i64 %391, i64* %389, align 8
  %392 = load i16*, i16** %10, align 8
  %393 = getelementptr inbounds i16, i16* %392, i32 1
  store i16* %393, i16** %10, align 8
  %394 = load i16, i16* %393, align 2
  store i16 %394, i16* %11, align 2
  %395 = load i16, i16* %11, align 2
  %396 = sext i16 %395 to i64
  %397 = load i16*, i16** %10, align 8
  %398 = getelementptr inbounds i16, i16* %397, i64 0
  %399 = load i16, i16* %398, align 2
  %400 = sext i16 %399 to i64
  %401 = mul nsw i64 %396, %400
  %402 = load i64*, i64** %4, align 8
  %403 = getelementptr inbounds i64, i64* %402, i64 0
  %404 = load i64, i64* %403, align 8
  %405 = add nsw i64 %404, %401
  store i64 %405, i64* %403, align 8
  %406 = load i16, i16* %11, align 2
  %407 = sext i16 %406 to i64
  %408 = load i16*, i16** %10, align 8
  %409 = getelementptr inbounds i16, i16* %408, i64 -1
  %410 = load i16, i16* %409, align 2
  %411 = sext i16 %410 to i64
  %412 = mul nsw i64 %407, %411
  %413 = load i64*, i64** %4, align 8
  %414 = getelementptr inbounds i64, i64* %413, i64 1
  %415 = load i64, i64* %414, align 8
  %416 = add nsw i64 %415, %412
  store i64 %416, i64* %414, align 8
  %417 = load i16, i16* %11, align 2
  %418 = sext i16 %417 to i64
  %419 = load i16*, i16** %10, align 8
  %420 = getelementptr inbounds i16, i16* %419, i64 -2
  %421 = load i16, i16* %420, align 2
  %422 = sext i16 %421 to i64
  %423 = mul nsw i64 %418, %422
  %424 = load i64*, i64** %4, align 8
  %425 = getelementptr inbounds i64, i64* %424, i64 2
  %426 = load i64, i64* %425, align 8
  %427 = add nsw i64 %426, %423
  store i64 %427, i64* %425, align 8
  %428 = load i16, i16* %11, align 2
  %429 = sext i16 %428 to i64
  %430 = load i16*, i16** %10, align 8
  %431 = getelementptr inbounds i16, i16* %430, i64 -3
  %432 = load i16, i16* %431, align 2
  %433 = sext i16 %432 to i64
  %434 = mul nsw i64 %429, %433
  %435 = load i64*, i64** %4, align 8
  %436 = getelementptr inbounds i64, i64* %435, i64 3
  %437 = load i64, i64* %436, align 8
  %438 = add nsw i64 %437, %434
  store i64 %438, i64* %436, align 8
  %439 = load i16, i16* %11, align 2
  %440 = sext i16 %439 to i64
  %441 = load i16*, i16** %10, align 8
  %442 = getelementptr inbounds i16, i16* %441, i64 -4
  %443 = load i16, i16* %442, align 2
  %444 = sext i16 %443 to i64
  %445 = mul nsw i64 %440, %444
  %446 = load i64*, i64** %4, align 8
  %447 = getelementptr inbounds i64, i64* %446, i64 4
  %448 = load i64, i64* %447, align 8
  %449 = add nsw i64 %448, %445
  store i64 %449, i64* %447, align 8
  %450 = load i16, i16* %11, align 2
  %451 = sext i16 %450 to i64
  %452 = load i16*, i16** %10, align 8
  %453 = getelementptr inbounds i16, i16* %452, i64 -5
  %454 = load i16, i16* %453, align 2
  %455 = sext i16 %454 to i64
  %456 = mul nsw i64 %451, %455
  %457 = load i64*, i64** %4, align 8
  %458 = getelementptr inbounds i64, i64* %457, i64 5
  %459 = load i64, i64* %458, align 8
  %460 = add nsw i64 %459, %456
  store i64 %460, i64* %458, align 8
  %461 = load i16*, i16** %10, align 8
  %462 = getelementptr inbounds i16, i16* %461, i32 1
  store i16* %462, i16** %10, align 8
  %463 = load i16, i16* %462, align 2
  store i16 %463, i16* %11, align 2
  %464 = load i16, i16* %11, align 2
  %465 = sext i16 %464 to i64
  %466 = load i16*, i16** %10, align 8
  %467 = getelementptr inbounds i16, i16* %466, i64 0
  %468 = load i16, i16* %467, align 2
  %469 = sext i16 %468 to i64
  %470 = mul nsw i64 %465, %469
  %471 = load i64*, i64** %4, align 8
  %472 = getelementptr inbounds i64, i64* %471, i64 0
  %473 = load i64, i64* %472, align 8
  %474 = add nsw i64 %473, %470
  store i64 %474, i64* %472, align 8
  %475 = load i16, i16* %11, align 2
  %476 = sext i16 %475 to i64
  %477 = load i16*, i16** %10, align 8
  %478 = getelementptr inbounds i16, i16* %477, i64 -1
  %479 = load i16, i16* %478, align 2
  %480 = sext i16 %479 to i64
  %481 = mul nsw i64 %476, %480
  %482 = load i64*, i64** %4, align 8
  %483 = getelementptr inbounds i64, i64* %482, i64 1
  %484 = load i64, i64* %483, align 8
  %485 = add nsw i64 %484, %481
  store i64 %485, i64* %483, align 8
  %486 = load i16, i16* %11, align 2
  %487 = sext i16 %486 to i64
  %488 = load i16*, i16** %10, align 8
  %489 = getelementptr inbounds i16, i16* %488, i64 -2
  %490 = load i16, i16* %489, align 2
  %491 = sext i16 %490 to i64
  %492 = mul nsw i64 %487, %491
  %493 = load i64*, i64** %4, align 8
  %494 = getelementptr inbounds i64, i64* %493, i64 2
  %495 = load i64, i64* %494, align 8
  %496 = add nsw i64 %495, %492
  store i64 %496, i64* %494, align 8
  %497 = load i16, i16* %11, align 2
  %498 = sext i16 %497 to i64
  %499 = load i16*, i16** %10, align 8
  %500 = getelementptr inbounds i16, i16* %499, i64 -3
  %501 = load i16, i16* %500, align 2
  %502 = sext i16 %501 to i64
  %503 = mul nsw i64 %498, %502
  %504 = load i64*, i64** %4, align 8
  %505 = getelementptr inbounds i64, i64* %504, i64 3
  %506 = load i64, i64* %505, align 8
  %507 = add nsw i64 %506, %503
  store i64 %507, i64* %505, align 8
  %508 = load i16, i16* %11, align 2
  %509 = sext i16 %508 to i64
  %510 = load i16*, i16** %10, align 8
  %511 = getelementptr inbounds i16, i16* %510, i64 -4
  %512 = load i16, i16* %511, align 2
  %513 = sext i16 %512 to i64
  %514 = mul nsw i64 %509, %513
  %515 = load i64*, i64** %4, align 8
  %516 = getelementptr inbounds i64, i64* %515, i64 4
  %517 = load i64, i64* %516, align 8
  %518 = add nsw i64 %517, %514
  store i64 %518, i64* %516, align 8
  %519 = load i16, i16* %11, align 2
  %520 = sext i16 %519 to i64
  %521 = load i16*, i16** %10, align 8
  %522 = getelementptr inbounds i16, i16* %521, i64 -5
  %523 = load i16, i16* %522, align 2
  %524 = sext i16 %523 to i64
  %525 = mul nsw i64 %520, %524
  %526 = load i64*, i64** %4, align 8
  %527 = getelementptr inbounds i64, i64* %526, i64 5
  %528 = load i64, i64* %527, align 8
  %529 = add nsw i64 %528, %525
  store i64 %529, i64* %527, align 8
  %530 = load i16, i16* %11, align 2
  %531 = sext i16 %530 to i64
  %532 = load i16*, i16** %10, align 8
  %533 = getelementptr inbounds i16, i16* %532, i64 -6
  %534 = load i16, i16* %533, align 2
  %535 = sext i16 %534 to i64
  %536 = mul nsw i64 %531, %535
  %537 = load i64*, i64** %4, align 8
  %538 = getelementptr inbounds i64, i64* %537, i64 6
  %539 = load i64, i64* %538, align 8
  %540 = add nsw i64 %539, %536
  store i64 %540, i64* %538, align 8
  %541 = load i16*, i16** %10, align 8
  %542 = getelementptr inbounds i16, i16* %541, i32 1
  store i16* %542, i16** %10, align 8
  %543 = load i16, i16* %542, align 2
  store i16 %543, i16* %11, align 2
  %544 = load i16, i16* %11, align 2
  %545 = sext i16 %544 to i64
  %546 = load i16*, i16** %10, align 8
  %547 = getelementptr inbounds i16, i16* %546, i64 0
  %548 = load i16, i16* %547, align 2
  %549 = sext i16 %548 to i64
  %550 = mul nsw i64 %545, %549
  %551 = load i64*, i64** %4, align 8
  %552 = getelementptr inbounds i64, i64* %551, i64 0
  %553 = load i64, i64* %552, align 8
  %554 = add nsw i64 %553, %550
  store i64 %554, i64* %552, align 8
  %555 = load i16, i16* %11, align 2
  %556 = sext i16 %555 to i64
  %557 = load i16*, i16** %10, align 8
  %558 = getelementptr inbounds i16, i16* %557, i64 -1
  %559 = load i16, i16* %558, align 2
  %560 = sext i16 %559 to i64
  %561 = mul nsw i64 %556, %560
  %562 = load i64*, i64** %4, align 8
  %563 = getelementptr inbounds i64, i64* %562, i64 1
  %564 = load i64, i64* %563, align 8
  %565 = add nsw i64 %564, %561
  store i64 %565, i64* %563, align 8
  %566 = load i16, i16* %11, align 2
  %567 = sext i16 %566 to i64
  %568 = load i16*, i16** %10, align 8
  %569 = getelementptr inbounds i16, i16* %568, i64 -2
  %570 = load i16, i16* %569, align 2
  %571 = sext i16 %570 to i64
  %572 = mul nsw i64 %567, %571
  %573 = load i64*, i64** %4, align 8
  %574 = getelementptr inbounds i64, i64* %573, i64 2
  %575 = load i64, i64* %574, align 8
  %576 = add nsw i64 %575, %572
  store i64 %576, i64* %574, align 8
  %577 = load i16, i16* %11, align 2
  %578 = sext i16 %577 to i64
  %579 = load i16*, i16** %10, align 8
  %580 = getelementptr inbounds i16, i16* %579, i64 -3
  %581 = load i16, i16* %580, align 2
  %582 = sext i16 %581 to i64
  %583 = mul nsw i64 %578, %582
  %584 = load i64*, i64** %4, align 8
  %585 = getelementptr inbounds i64, i64* %584, i64 3
  %586 = load i64, i64* %585, align 8
  %587 = add nsw i64 %586, %583
  store i64 %587, i64* %585, align 8
  %588 = load i16, i16* %11, align 2
  %589 = sext i16 %588 to i64
  %590 = load i16*, i16** %10, align 8
  %591 = getelementptr inbounds i16, i16* %590, i64 -4
  %592 = load i16, i16* %591, align 2
  %593 = sext i16 %592 to i64
  %594 = mul nsw i64 %589, %593
  %595 = load i64*, i64** %4, align 8
  %596 = getelementptr inbounds i64, i64* %595, i64 4
  %597 = load i64, i64* %596, align 8
  %598 = add nsw i64 %597, %594
  store i64 %598, i64* %596, align 8
  %599 = load i16, i16* %11, align 2
  %600 = sext i16 %599 to i64
  %601 = load i16*, i16** %10, align 8
  %602 = getelementptr inbounds i16, i16* %601, i64 -5
  %603 = load i16, i16* %602, align 2
  %604 = sext i16 %603 to i64
  %605 = mul nsw i64 %600, %604
  %606 = load i64*, i64** %4, align 8
  %607 = getelementptr inbounds i64, i64* %606, i64 5
  %608 = load i64, i64* %607, align 8
  %609 = add nsw i64 %608, %605
  store i64 %609, i64* %607, align 8
  %610 = load i16, i16* %11, align 2
  %611 = sext i16 %610 to i64
  %612 = load i16*, i16** %10, align 8
  %613 = getelementptr inbounds i16, i16* %612, i64 -6
  %614 = load i16, i16* %613, align 2
  %615 = sext i16 %614 to i64
  %616 = mul nsw i64 %611, %615
  %617 = load i64*, i64** %4, align 8
  %618 = getelementptr inbounds i64, i64* %617, i64 6
  %619 = load i64, i64* %618, align 8
  %620 = add nsw i64 %619, %616
  store i64 %620, i64* %618, align 8
  %621 = load i16, i16* %11, align 2
  %622 = sext i16 %621 to i64
  %623 = load i16*, i16** %10, align 8
  %624 = getelementptr inbounds i16, i16* %623, i64 -7
  %625 = load i16, i16* %624, align 2
  %626 = sext i16 %625 to i64
  %627 = mul nsw i64 %622, %626
  %628 = load i64*, i64** %4, align 8
  %629 = getelementptr inbounds i64, i64* %628, i64 7
  %630 = load i64, i64* %629, align 8
  %631 = add nsw i64 %630, %627
  store i64 %631, i64* %629, align 8
  store i32 8, i32* %6, align 4
  br label %632

; <label>:632:                                    ; preds = %738, %214
  %633 = load i32, i32* %6, align 4
  %634 = icmp sle i32 %633, 159
  br i1 %634, label %635, label %742

; <label>:635:                                    ; preds = %632
  %636 = load i16*, i16** %10, align 8
  %637 = getelementptr inbounds i16, i16* %636, i32 1
  store i16* %637, i16** %10, align 8
  %638 = load i16, i16* %637, align 2
  store i16 %638, i16* %11, align 2
  %639 = load i16, i16* %11, align 2
  %640 = sext i16 %639 to i64
  %641 = load i16*, i16** %10, align 8
  %642 = getelementptr inbounds i16, i16* %641, i64 0
  %643 = load i16, i16* %642, align 2
  %644 = sext i16 %643 to i64
  %645 = mul nsw i64 %640, %644
  %646 = load i64*, i64** %4, align 8
  %647 = getelementptr inbounds i64, i64* %646, i64 0
  %648 = load i64, i64* %647, align 8
  %649 = add nsw i64 %648, %645
  store i64 %649, i64* %647, align 8
  %650 = load i16, i16* %11, align 2
  %651 = sext i16 %650 to i64
  %652 = load i16*, i16** %10, align 8
  %653 = getelementptr inbounds i16, i16* %652, i64 -1
  %654 = load i16, i16* %653, align 2
  %655 = sext i16 %654 to i64
  %656 = mul nsw i64 %651, %655
  %657 = load i64*, i64** %4, align 8
  %658 = getelementptr inbounds i64, i64* %657, i64 1
  %659 = load i64, i64* %658, align 8
  %660 = add nsw i64 %659, %656
  store i64 %660, i64* %658, align 8
  %661 = load i16, i16* %11, align 2
  %662 = sext i16 %661 to i64
  %663 = load i16*, i16** %10, align 8
  %664 = getelementptr inbounds i16, i16* %663, i64 -2
  %665 = load i16, i16* %664, align 2
  %666 = sext i16 %665 to i64
  %667 = mul nsw i64 %662, %666
  %668 = load i64*, i64** %4, align 8
  %669 = getelementptr inbounds i64, i64* %668, i64 2
  %670 = load i64, i64* %669, align 8
  %671 = add nsw i64 %670, %667
  store i64 %671, i64* %669, align 8
  %672 = load i16, i16* %11, align 2
  %673 = sext i16 %672 to i64
  %674 = load i16*, i16** %10, align 8
  %675 = getelementptr inbounds i16, i16* %674, i64 -3
  %676 = load i16, i16* %675, align 2
  %677 = sext i16 %676 to i64
  %678 = mul nsw i64 %673, %677
  %679 = load i64*, i64** %4, align 8
  %680 = getelementptr inbounds i64, i64* %679, i64 3
  %681 = load i64, i64* %680, align 8
  %682 = add nsw i64 %681, %678
  store i64 %682, i64* %680, align 8
  %683 = load i16, i16* %11, align 2
  %684 = sext i16 %683 to i64
  %685 = load i16*, i16** %10, align 8
  %686 = getelementptr inbounds i16, i16* %685, i64 -4
  %687 = load i16, i16* %686, align 2
  %688 = sext i16 %687 to i64
  %689 = mul nsw i64 %684, %688
  %690 = load i64*, i64** %4, align 8
  %691 = getelementptr inbounds i64, i64* %690, i64 4
  %692 = load i64, i64* %691, align 8
  %693 = add nsw i64 %692, %689
  store i64 %693, i64* %691, align 8
  %694 = load i16, i16* %11, align 2
  %695 = sext i16 %694 to i64
  %696 = load i16*, i16** %10, align 8
  %697 = getelementptr inbounds i16, i16* %696, i64 -5
  %698 = load i16, i16* %697, align 2
  %699 = sext i16 %698 to i64
  %700 = mul nsw i64 %695, %699
  %701 = load i64*, i64** %4, align 8
  %702 = getelementptr inbounds i64, i64* %701, i64 5
  %703 = load i64, i64* %702, align 8
  %704 = add nsw i64 %703, %700
  store i64 %704, i64* %702, align 8
  %705 = load i16, i16* %11, align 2
  %706 = sext i16 %705 to i64
  %707 = load i16*, i16** %10, align 8
  %708 = getelementptr inbounds i16, i16* %707, i64 -6
  %709 = load i16, i16* %708, align 2
  %710 = sext i16 %709 to i64
  %711 = mul nsw i64 %706, %710
  %712 = load i64*, i64** %4, align 8
  %713 = getelementptr inbounds i64, i64* %712, i64 6
  %714 = load i64, i64* %713, align 8
  %715 = add nsw i64 %714, %711
  store i64 %715, i64* %713, align 8
  %716 = load i16, i16* %11, align 2
  %717 = sext i16 %716 to i64
  %718 = load i16*, i16** %10, align 8
  %719 = getelementptr inbounds i16, i16* %718, i64 -7
  %720 = load i16, i16* %719, align 2
  %721 = sext i16 %720 to i64
  %722 = mul nsw i64 %717, %721
  %723 = load i64*, i64** %4, align 8
  %724 = getelementptr inbounds i64, i64* %723, i64 7
  %725 = load i64, i64* %724, align 8
  %726 = add nsw i64 %725, %722
  store i64 %726, i64* %724, align 8
  %727 = load i16, i16* %11, align 2
  %728 = sext i16 %727 to i64
  %729 = load i16*, i16** %10, align 8
  %730 = getelementptr inbounds i16, i16* %729, i64 -8
  %731 = load i16, i16* %730, align 2
  %732 = sext i16 %731 to i64
  %733 = mul nsw i64 %728, %732
  %734 = load i64*, i64** %4, align 8
  %735 = getelementptr inbounds i64, i64* %734, i64 8
  %736 = load i64, i64* %735, align 8
  %737 = add nsw i64 %736, %733
  store i64 %737, i64* %735, align 8
  br label %738

; <label>:738:                                    ; preds = %635
  %pgocount17 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 1)
  %739 = add i64 %pgocount17, 1
  store i64 %739, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 1)
  %740 = load i32, i32* %6, align 4
  %741 = add nsw i32 %740, 1
  store i32 %741, i32* %6, align 4
  br label %632

; <label>:742:                                    ; preds = %632
  store i32 9, i32* %5, align 4
  br label %743

; <label>:743:                                    ; preds = %748, %742
  %744 = load i32, i32* %5, align 4
  %745 = add nsw i32 %744, -1
  store i32 %745, i32* %5, align 4
  %746 = icmp ne i32 %744, 0
  br i1 %746, label %747, label %756

; <label>:747:                                    ; preds = %743
  br label %748

; <label>:748:                                    ; preds = %747
  %pgocount18 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 2)
  %749 = add i64 %pgocount18, 1
  store i64 %749, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 2)
  %750 = load i64*, i64** %4, align 8
  %751 = load i32, i32* %5, align 4
  %752 = sext i32 %751 to i64
  %753 = getelementptr inbounds i64, i64* %750, i64 %752
  %754 = load i64, i64* %753, align 8
  %755 = shl i64 %754, 1
  store i64 %755, i64* %753, align 8
  br label %743

; <label>:756:                                    ; preds = %743
  %757 = load i16, i16* %9, align 2
  %758 = sext i16 %757 to i32
  %759 = icmp sgt i32 %758, 0
  br i1 %759, label %760, label %786

; <label>:760:                                    ; preds = %756
  %761 = load i16, i16* %9, align 2
  %762 = sext i16 %761 to i32
  %763 = icmp sle i32 %762, 4
  br i1 %763, label %764, label %765

; <label>:764:                                    ; preds = %760
  br label %768

; <label>:765:                                    ; preds = %760
  %pgocount19 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 21)
  %766 = add i64 %pgocount19, 1
  store i64 %766, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 21)
  call void @__assert_fail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 142, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__PRETTY_FUNCTION__.Autocorrelation, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %768

; <label>:768:                                    ; preds = %767, %764
  store i32 160, i32* %5, align 4
  br label %769

; <label>:769:                                    ; preds = %774, %768
  %770 = load i32, i32* %5, align 4
  %771 = add nsw i32 %770, -1
  store i32 %771, i32* %5, align 4
  %772 = icmp ne i32 %770, 0
  br i1 %772, label %773, label %784

; <label>:773:                                    ; preds = %769
  br label %774

; <label>:774:                                    ; preds = %773
  %pgocount20 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 4)
  %775 = add i64 %pgocount20, 1
  store i64 %775, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 4)
  %776 = load i16, i16* %9, align 2
  %777 = sext i16 %776 to i32
  %778 = load i16*, i16** %3, align 8
  %779 = getelementptr inbounds i16, i16* %778, i32 1
  store i16* %779, i16** %3, align 8
  %780 = load i16, i16* %778, align 2
  %781 = sext i16 %780 to i32
  %782 = shl i32 %781, %777
  %783 = trunc i32 %782 to i16
  store i16 %783, i16* %778, align 2
  br label %769

; <label>:784:                                    ; preds = %769
  %pgocount21 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 14)
  %785 = add i64 %pgocount21, 1
  store i64 %785, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_tmp1.ll_Autocorrelation, i64 0, i64 14)
  br label %786

; <label>:786:                                    ; preds = %784, %756
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Reflection_coefficients(i64*, i16*) #0 {
  %3 = alloca i64*, align 8
  %4 = alloca i16*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  %9 = alloca i64, align 8
  %10 = alloca [9 x i16], align 16
  %11 = alloca [9 x i16], align 16
  %12 = alloca [9 x i16], align 16
  store i64* %0, i64** %3, align 8
  store i16* %1, i16** %4, align 8
  %13 = load i64*, i64** %3, align 8
  %14 = getelementptr inbounds i64, i64* %13, i64 0
  %15 = load i64, i64* %14, align 8
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %17, label %29

; <label>:17:                                     ; preds = %2
  store i32 8, i32* %5, align 4
  br label %18

; <label>:18:                                     ; preds = %23, %17
  %19 = load i32, i32* %5, align 4
  %20 = add nsw i32 %19, -1
  store i32 %20, i32* %5, align 4
  %21 = icmp ne i32 %19, 0
  br i1 %21, label %22, label %27

; <label>:22:                                     ; preds = %18
  br label %23

; <label>:23:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 6)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 6)
  %25 = load i16*, i16** %4, align 8
  %26 = getelementptr inbounds i16, i16* %25, i32 1
  store i16* %26, i16** %4, align 8
  store i16 0, i16* %25, align 2
  br label %18

; <label>:27:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 14)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 14)
  br label %329

; <label>:29:                                     ; preds = %2
  %30 = load i64*, i64** %3, align 8
  %31 = getelementptr inbounds i64, i64* %30, i64 0
  %32 = load i64, i64* %31, align 8
  %33 = icmp ne i64 %32, 0
  br i1 %33, label %34, label %35

; <label>:34:                                     ; preds = %29
  br label %38

; <label>:35:                                     ; preds = %29
  %pgocount2 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 21)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 21)
  call void @__assert_fail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 197, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__PRETTY_FUNCTION__.Reflection_coefficients, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %38

; <label>:38:                                     ; preds = %37, %34
  %39 = load i64*, i64** %3, align 8
  %40 = getelementptr inbounds i64, i64* %39, i64 0
  %41 = load i64, i64* %40, align 8
  %42 = call signext i16 @gsm_norm(i64 %41)
  store i16 %42, i16* %8, align 2
  %43 = load i16, i16* %8, align 2
  %44 = sext i16 %43 to i32
  %45 = icmp sge i32 %44, 0
  br i1 %45, label %46, label %52

; <label>:46:                                     ; preds = %38
  %47 = load i16, i16* %8, align 2
  %48 = sext i16 %47 to i32
  %49 = icmp slt i32 %48, 32
  br i1 %49, label %51, label %._crit_edge

._crit_edge:                                      ; preds = %46
  %pgocount3 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 17)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 17)
  br label %52

; <label>:51:                                     ; preds = %46
  br label %55

; <label>:52:                                     ; preds = %._crit_edge, %38
  %pgocount4 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 20)
  %53 = add i64 %pgocount4, 1
  store i64 %53, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 20)
  call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 200, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__PRETTY_FUNCTION__.Reflection_coefficients, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %55

; <label>:55:                                     ; preds = %54, %51
  store i32 0, i32* %5, align 4
  br label %56

; <label>:56:                                     ; preds = %74, %55
  %57 = load i32, i32* %5, align 4
  %58 = icmp sle i32 %57, 8
  br i1 %58, label %59, label %78

; <label>:59:                                     ; preds = %56
  %60 = load i64*, i64** %3, align 8
  %61 = load i32, i32* %5, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i64, i64* %60, i64 %62
  %64 = load i64, i64* %63, align 8
  %65 = load i16, i16* %8, align 2
  %66 = sext i16 %65 to i32
  %67 = zext i32 %66 to i64
  %68 = shl i64 %64, %67
  %69 = ashr i64 %68, 16
  %70 = trunc i64 %69 to i16
  %71 = load i32, i32* %5, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [9 x i16], [9 x i16]* %10, i64 0, i64 %72
  store i16 %70, i16* %73, align 2
  br label %74

; <label>:74:                                     ; preds = %59
  %pgocount5 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 3)
  %75 = add i64 %pgocount5, 1
  store i64 %75, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 3)
  %76 = load i32, i32* %5, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, i32* %5, align 4
  br label %56

; <label>:78:                                     ; preds = %56
  store i32 1, i32* %5, align 4
  br label %79

; <label>:79:                                     ; preds = %90, %78
  %80 = load i32, i32* %5, align 4
  %81 = icmp sle i32 %80, 7
  br i1 %81, label %82, label %94

; <label>:82:                                     ; preds = %79
  %83 = load i32, i32* %5, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [9 x i16], [9 x i16]* %10, i64 0, i64 %84
  %86 = load i16, i16* %85, align 2
  %87 = load i32, i32* %5, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [9 x i16], [9 x i16]* %12, i64 0, i64 %88
  store i16 %86, i16* %89, align 2
  br label %90

; <label>:90:                                     ; preds = %82
  %pgocount6 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 4)
  %91 = add i64 %pgocount6, 1
  store i64 %91, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 4)
  %92 = load i32, i32* %5, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %5, align 4
  br label %79

; <label>:94:                                     ; preds = %79
  store i32 0, i32* %5, align 4
  br label %95

; <label>:95:                                     ; preds = %106, %94
  %96 = load i32, i32* %5, align 4
  %97 = icmp sle i32 %96, 8
  br i1 %97, label %98, label %110

; <label>:98:                                     ; preds = %95
  %99 = load i32, i32* %5, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [9 x i16], [9 x i16]* %10, i64 0, i64 %100
  %102 = load i16, i16* %101, align 2
  %103 = load i32, i32* %5, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [9 x i16], [9 x i16]* %11, i64 0, i64 %104
  store i16 %102, i16* %105, align 2
  br label %106

; <label>:106:                                    ; preds = %98
  %pgocount7 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 5)
  %107 = add i64 %pgocount7, 1
  store i64 %107, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 5)
  %108 = load i32, i32* %5, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %5, align 4
  br label %95

; <label>:110:                                    ; preds = %95
  %pgocount8 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 13)
  %111 = add i64 %pgocount8, 1
  store i64 %111, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 13)
  store i32 1, i32* %7, align 4
  br label %112

; <label>:112:                                    ; preds = %324, %110
  %113 = load i32, i32* %7, align 4
  %114 = icmp sle i32 %113, 8
  br i1 %114, label %115, label %329

; <label>:115:                                    ; preds = %112
  %116 = getelementptr inbounds [9 x i16], [9 x i16]* %11, i64 0, i64 1
  %117 = load i16, i16* %116, align 2
  store i16 %117, i16* %8, align 2
  %118 = load i16, i16* %8, align 2
  %119 = sext i16 %118 to i32
  %120 = icmp slt i32 %119, 0
  br i1 %120, label %121, label %134

; <label>:121:                                    ; preds = %115
  %122 = load i16, i16* %8, align 2
  %123 = sext i16 %122 to i32
  %124 = icmp eq i32 %123, -32768
  br i1 %124, label %125, label %127

; <label>:125:                                    ; preds = %121
  %pgocount9 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 11)
  %126 = add i64 %pgocount9, 1
  store i64 %126, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 11)
  br label %132

; <label>:127:                                    ; preds = %121
  %pgocount10 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 12)
  %128 = add i64 %pgocount10, 1
  store i64 %128, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 12)
  %129 = load i16, i16* %8, align 2
  %130 = sext i16 %129 to i32
  %131 = sub nsw i32 0, %130
  br label %132

; <label>:132:                                    ; preds = %127, %125
  %133 = phi i32 [ 32767, %125 ], [ %131, %127 ]
  br label %137

; <label>:134:                                    ; preds = %115
  %135 = load i16, i16* %8, align 2
  %136 = sext i16 %135 to i32
  br label %137

; <label>:137:                                    ; preds = %134, %132
  %138 = phi i32 [ %133, %132 ], [ %136, %134 ]
  %139 = trunc i32 %138 to i16
  store i16 %139, i16* %8, align 2
  %140 = getelementptr inbounds [9 x i16], [9 x i16]* %11, i64 0, i64 0
  %141 = load i16, i16* %140, align 16
  %142 = sext i16 %141 to i32
  %143 = load i16, i16* %8, align 2
  %144 = sext i16 %143 to i32
  %145 = icmp slt i32 %142, %144
  br i1 %145, label %146, label %160

; <label>:146:                                    ; preds = %137
  %147 = load i32, i32* %7, align 4
  store i32 %147, i32* %5, align 4
  br label %148

; <label>:148:                                    ; preds = %155, %146
  %149 = load i32, i32* %5, align 4
  %150 = icmp sle i32 %149, 8
  br i1 %150, label %151, label %158

; <label>:151:                                    ; preds = %148
  %pgocount11 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 7)
  %152 = add i64 %pgocount11, 1
  store i64 %152, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 7)
  %153 = load i16*, i16** %4, align 8
  %154 = getelementptr inbounds i16, i16* %153, i32 1
  store i16* %154, i16** %4, align 8
  store i16 0, i16* %153, align 2
  br label %155

; <label>:155:                                    ; preds = %151
  %156 = load i32, i32* %5, align 4
  %157 = add nsw i32 %156, 1
  store i32 %157, i32* %5, align 4
  br label %148

; <label>:158:                                    ; preds = %148
  %pgocount12 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 15)
  %159 = add i64 %pgocount12, 1
  store i64 %159, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 15)
  br label %329

; <label>:160:                                    ; preds = %137
  %161 = load i16, i16* %8, align 2
  %162 = getelementptr inbounds [9 x i16], [9 x i16]* %11, i64 0, i64 0
  %163 = load i16, i16* %162, align 16
  %164 = call signext i16 @gsm_div(i16 signext %161, i16 signext %163)
  %165 = load i16*, i16** %4, align 8
  store i16 %164, i16* %165, align 2
  %166 = load i16*, i16** %4, align 8
  %167 = load i16, i16* %166, align 2
  %168 = sext i16 %167 to i32
  %169 = icmp sge i32 %168, 0
  br i1 %169, label %170, label %171

; <label>:170:                                    ; preds = %160
  br label %174

; <label>:171:                                    ; preds = %160
  %pgocount13 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 18)
  %172 = add i64 %pgocount13, 1
  store i64 %172, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 18)
  call void @__assert_fail(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 224, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__PRETTY_FUNCTION__.Reflection_coefficients, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %174

; <label>:174:                                    ; preds = %173, %170
  %175 = getelementptr inbounds [9 x i16], [9 x i16]* %11, i64 0, i64 1
  %176 = load i16, i16* %175, align 2
  %177 = sext i16 %176 to i32
  %178 = icmp sgt i32 %177, 0
  br i1 %178, label %179, label %187

; <label>:179:                                    ; preds = %174
  %pgocount14 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 8)
  %180 = add i64 %pgocount14, 1
  store i64 %180, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 8)
  %181 = load i16*, i16** %4, align 8
  %182 = load i16, i16* %181, align 2
  %183 = sext i16 %182 to i32
  %184 = sub nsw i32 0, %183
  %185 = trunc i32 %184 to i16
  %186 = load i16*, i16** %4, align 8
  store i16 %185, i16* %186, align 2
  br label %187

; <label>:187:                                    ; preds = %179, %174
  %188 = load i16*, i16** %4, align 8
  %189 = load i16, i16* %188, align 2
  %190 = sext i16 %189 to i32
  %191 = icmp ne i32 %190, -32768
  br i1 %191, label %192, label %193

; <label>:192:                                    ; preds = %187
  br label %196

; <label>:193:                                    ; preds = %187
  %pgocount15 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 19)
  %194 = add i64 %pgocount15, 1
  store i64 %194, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 19)
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 226, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__PRETTY_FUNCTION__.Reflection_coefficients, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %196

; <label>:196:                                    ; preds = %195, %192
  %197 = load i32, i32* %7, align 4
  %198 = icmp eq i32 %197, 8
  br i1 %198, label %199, label %201

; <label>:199:                                    ; preds = %196
  %pgocount16 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 16)
  %200 = add i64 %pgocount16, 1
  store i64 %200, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 16)
  br label %329

; <label>:201:                                    ; preds = %196
  %202 = getelementptr inbounds [9 x i16], [9 x i16]* %11, i64 0, i64 1
  %203 = load i16, i16* %202, align 2
  %204 = sext i16 %203 to i64
  %205 = load i16*, i16** %4, align 8
  %206 = load i16, i16* %205, align 2
  %207 = sext i16 %206 to i64
  %208 = mul nsw i64 %204, %207
  %209 = add nsw i64 %208, 16384
  %210 = ashr i64 %209, 15
  %211 = trunc i64 %210 to i16
  store i16 %211, i16* %8, align 2
  %212 = getelementptr inbounds [9 x i16], [9 x i16]* %11, i64 0, i64 0
  %213 = load i16, i16* %212, align 16
  %214 = sext i16 %213 to i64
  %215 = load i16, i16* %8, align 2
  %216 = sext i16 %215 to i64
  %217 = add nsw i64 %214, %216
  store i64 %217, i64* %9, align 8
  %218 = sub nsw i64 %217, -32768
  %219 = icmp ugt i64 %218, 65535
  br i1 %219, label %220, label %228

; <label>:220:                                    ; preds = %201
  %pgocount17 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 9)
  %221 = add i64 %pgocount17, 1
  store i64 %221, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 9)
  %222 = load i64, i64* %9, align 8
  %223 = icmp sgt i64 %222, 0
  %224 = zext i1 %223 to i64
  %pgocount18 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 22)
  %225 = add i64 %pgocount18, %224
  store i64 %225, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 22)
  %226 = select i1 %223, i32 32767, i32 -32768
  %227 = sext i32 %226 to i64
  br label %231

; <label>:228:                                    ; preds = %201
  %pgocount19 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 10)
  %229 = add i64 %pgocount19, 1
  store i64 %229, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 10)
  %230 = load i64, i64* %9, align 8
  br label %231

; <label>:231:                                    ; preds = %228, %220
  %232 = phi i64 [ %227, %220 ], [ %230, %228 ]
  %233 = trunc i64 %232 to i16
  %234 = getelementptr inbounds [9 x i16], [9 x i16]* %11, i64 0, i64 0
  store i16 %233, i16* %234, align 16
  store i32 1, i32* %6, align 4
  br label %235

; <label>:235:                                    ; preds = %320, %231
  %236 = load i32, i32* %6, align 4
  %237 = load i32, i32* %7, align 4
  %238 = sub nsw i32 8, %237
  %239 = icmp sle i32 %236, %238
  br i1 %239, label %240, label %323

; <label>:240:                                    ; preds = %235
  %241 = load i32, i32* %6, align 4
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds [9 x i16], [9 x i16]* %12, i64 0, i64 %242
  %244 = load i16, i16* %243, align 2
  %245 = sext i16 %244 to i64
  %246 = load i16*, i16** %4, align 8
  %247 = load i16, i16* %246, align 2
  %248 = sext i16 %247 to i64
  %249 = mul nsw i64 %245, %248
  %250 = add nsw i64 %249, 16384
  %251 = ashr i64 %250, 15
  %252 = trunc i64 %251 to i16
  store i16 %252, i16* %8, align 2
  %253 = load i32, i32* %6, align 4
  %254 = add nsw i32 %253, 1
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds [9 x i16], [9 x i16]* %11, i64 0, i64 %255
  %257 = load i16, i16* %256, align 2
  %258 = sext i16 %257 to i64
  %259 = load i16, i16* %8, align 2
  %260 = sext i16 %259 to i64
  %261 = add nsw i64 %258, %260
  store i64 %261, i64* %9, align 8
  %262 = sub nsw i64 %261, -32768
  %263 = icmp ugt i64 %262, 65535
  br i1 %263, label %264, label %271

; <label>:264:                                    ; preds = %240
  %265 = load i64, i64* %9, align 8
  %266 = icmp sgt i64 %265, 0
  %267 = zext i1 %266 to i64
  %pgocount20 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 23)
  %268 = add i64 %pgocount20, %267
  store i64 %268, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 23)
  %269 = select i1 %266, i32 32767, i32 -32768
  %270 = sext i32 %269 to i64
  br label %274

; <label>:271:                                    ; preds = %240
  %pgocount21 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 0)
  %272 = add i64 %pgocount21, 1
  store i64 %272, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 0)
  %273 = load i64, i64* %9, align 8
  br label %274

; <label>:274:                                    ; preds = %271, %264
  %275 = phi i64 [ %270, %264 ], [ %273, %271 ]
  %276 = trunc i64 %275 to i16
  %277 = load i32, i32* %6, align 4
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds [9 x i16], [9 x i16]* %11, i64 0, i64 %278
  store i16 %276, i16* %279, align 2
  %280 = load i32, i32* %6, align 4
  %281 = add nsw i32 %280, 1
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds [9 x i16], [9 x i16]* %11, i64 0, i64 %282
  %284 = load i16, i16* %283, align 2
  %285 = sext i16 %284 to i64
  %286 = load i16*, i16** %4, align 8
  %287 = load i16, i16* %286, align 2
  %288 = sext i16 %287 to i64
  %289 = mul nsw i64 %285, %288
  %290 = add nsw i64 %289, 16384
  %291 = ashr i64 %290, 15
  %292 = trunc i64 %291 to i16
  store i16 %292, i16* %8, align 2
  %293 = load i32, i32* %6, align 4
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds [9 x i16], [9 x i16]* %12, i64 0, i64 %294
  %296 = load i16, i16* %295, align 2
  %297 = sext i16 %296 to i64
  %298 = load i16, i16* %8, align 2
  %299 = sext i16 %298 to i64
  %300 = add nsw i64 %297, %299
  store i64 %300, i64* %9, align 8
  %301 = sub nsw i64 %300, -32768
  %302 = icmp ugt i64 %301, 65535
  br i1 %302, label %303, label %311

; <label>:303:                                    ; preds = %274
  %pgocount22 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 1)
  %304 = add i64 %pgocount22, 1
  store i64 %304, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 1)
  %305 = load i64, i64* %9, align 8
  %306 = icmp sgt i64 %305, 0
  %307 = zext i1 %306 to i64
  %pgocount23 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 24)
  %308 = add i64 %pgocount23, %307
  store i64 %308, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 24)
  %309 = select i1 %306, i32 32767, i32 -32768
  %310 = sext i32 %309 to i64
  br label %314

; <label>:311:                                    ; preds = %274
  %pgocount24 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 2)
  %312 = add i64 %pgocount24, 1
  store i64 %312, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_Reflection_coefficients, i64 0, i64 2)
  %313 = load i64, i64* %9, align 8
  br label %314

; <label>:314:                                    ; preds = %311, %303
  %315 = phi i64 [ %310, %303 ], [ %313, %311 ]
  %316 = trunc i64 %315 to i16
  %317 = load i32, i32* %6, align 4
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds [9 x i16], [9 x i16]* %12, i64 0, i64 %318
  store i16 %316, i16* %319, align 2
  br label %320

; <label>:320:                                    ; preds = %314
  %321 = load i32, i32* %6, align 4
  %322 = add nsw i32 %321, 1
  store i32 %322, i32* %6, align 4
  br label %235

; <label>:323:                                    ; preds = %235
  br label %324

; <label>:324:                                    ; preds = %323
  %325 = load i32, i32* %7, align 4
  %326 = add nsw i32 %325, 1
  store i32 %326, i32* %7, align 4
  %327 = load i16*, i16** %4, align 8
  %328 = getelementptr inbounds i16, i16* %327, i32 1
  store i16* %328, i16** %4, align 8
  br label %112

; <label>:329:                                    ; preds = %199, %158, %112, %27
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Transformation_to_Log_Area_Ratios(i16*) #0 {
  %2 = alloca i16*, align 8
  %3 = alloca i16, align 2
  %4 = alloca i32, align 4
  store i16* %0, i16** %2, align 8
  store i32 1, i32* %4, align 4
  br label %5

; <label>:5:                                      ; preds = %113, %1
  %6 = load i32, i32* %4, align 4
  %7 = icmp sle i32 %6, 8
  br i1 %7, label %8, label %118

; <label>:8:                                      ; preds = %5
  %9 = load i16*, i16** %2, align 8
  %10 = load i16, i16* %9, align 2
  store i16 %10, i16* %3, align 2
  %11 = load i16, i16* %3, align 2
  %12 = sext i16 %11 to i32
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %14, label %27

; <label>:14:                                     ; preds = %8
  %15 = load i16, i16* %3, align 2
  %16 = sext i16 %15 to i32
  %17 = icmp eq i32 %16, -32768
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 4)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 4)
  br label %25

; <label>:20:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 5)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 5)
  %22 = load i16, i16* %3, align 2
  %23 = sext i16 %22 to i32
  %24 = sub nsw i32 0, %23
  br label %25

; <label>:25:                                     ; preds = %20, %18
  %26 = phi i32 [ 32767, %18 ], [ %24, %20 ]
  br label %30

; <label>:27:                                     ; preds = %8
  %28 = load i16, i16* %3, align 2
  %29 = sext i16 %28 to i32
  br label %30

; <label>:30:                                     ; preds = %27, %25
  %31 = phi i32 [ %26, %25 ], [ %29, %27 ]
  %32 = trunc i32 %31 to i16
  store i16 %32, i16* %3, align 2
  %33 = load i16, i16* %3, align 2
  %34 = sext i16 %33 to i32
  %35 = icmp sge i32 %34, 0
  br i1 %35, label %36, label %37

; <label>:36:                                     ; preds = %30
  br label %40

; <label>:37:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 7)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 7)
  call void @__assert_fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 267, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__PRETTY_FUNCTION__.Transformation_to_Log_Area_Ratios, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %40

; <label>:40:                                     ; preds = %39, %36
  %41 = load i16, i16* %3, align 2
  %42 = sext i16 %41 to i32
  %43 = icmp slt i32 %42, 22118
  br i1 %43, label %44, label %50

; <label>:44:                                     ; preds = %40
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 0)
  %45 = add i64 %pgocount3, 1
  store i64 %45, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 0)
  %46 = load i16, i16* %3, align 2
  %47 = sext i16 %46 to i32
  %48 = ashr i32 %47, 1
  %49 = trunc i32 %48 to i16
  store i16 %49, i16* %3, align 2
  br label %87

; <label>:50:                                     ; preds = %40
  %51 = load i16, i16* %3, align 2
  %52 = sext i16 %51 to i32
  %53 = icmp slt i32 %52, 31130
  br i1 %53, label %54, label %68

; <label>:54:                                     ; preds = %50
  %55 = load i16, i16* %3, align 2
  %56 = sext i16 %55 to i32
  %57 = icmp sge i32 %56, 11059
  br i1 %57, label %58, label %60

; <label>:58:                                     ; preds = %54
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 2)
  %59 = add i64 %pgocount4, 1
  store i64 %59, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 2)
  br label %63

; <label>:60:                                     ; preds = %54
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 9)
  %61 = add i64 %pgocount5, 1
  store i64 %61, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 9)
  call void @__assert_fail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 272, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__PRETTY_FUNCTION__.Transformation_to_Log_Area_Ratios, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %63

; <label>:63:                                     ; preds = %62, %58
  %64 = load i16, i16* %3, align 2
  %65 = sext i16 %64 to i32
  %66 = sub nsw i32 %65, 11059
  %67 = trunc i32 %66 to i16
  store i16 %67, i16* %3, align 2
  br label %86

; <label>:68:                                     ; preds = %50
  %69 = load i16, i16* %3, align 2
  %70 = sext i16 %69 to i32
  %71 = icmp sge i32 %70, 26112
  br i1 %71, label %72, label %74

; <label>:72:                                     ; preds = %68
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 3)
  %73 = add i64 %pgocount6, 1
  store i64 %73, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 3)
  br label %77

; <label>:74:                                     ; preds = %68
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 10)
  %75 = add i64 %pgocount7, 1
  store i64 %75, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 10)
  call void @__assert_fail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 275, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__PRETTY_FUNCTION__.Transformation_to_Log_Area_Ratios, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %77

; <label>:77:                                     ; preds = %76, %72
  %78 = load i16, i16* %3, align 2
  %79 = sext i16 %78 to i32
  %80 = sub nsw i32 %79, 26112
  %81 = trunc i32 %80 to i16
  store i16 %81, i16* %3, align 2
  %82 = load i16, i16* %3, align 2
  %83 = sext i16 %82 to i32
  %84 = shl i32 %83, 2
  %85 = trunc i32 %84 to i16
  store i16 %85, i16* %3, align 2
  br label %86

; <label>:86:                                     ; preds = %77, %63
  br label %87

; <label>:87:                                     ; preds = %86, %44
  %88 = load i16*, i16** %2, align 8
  %89 = load i16, i16* %88, align 2
  %90 = sext i16 %89 to i32
  %91 = icmp slt i32 %90, 0
  br i1 %91, label %92, label %97

; <label>:92:                                     ; preds = %87
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 1)
  %93 = add i64 %pgocount8, 1
  store i64 %93, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 1)
  %94 = load i16, i16* %3, align 2
  %95 = sext i16 %94 to i32
  %96 = sub nsw i32 0, %95
  br label %100

; <label>:97:                                     ; preds = %87
  %98 = load i16, i16* %3, align 2
  %99 = sext i16 %98 to i32
  br label %100

; <label>:100:                                    ; preds = %97, %92
  %101 = phi i32 [ %96, %92 ], [ %99, %97 ]
  %102 = trunc i32 %101 to i16
  %103 = load i16*, i16** %2, align 8
  store i16 %102, i16* %103, align 2
  %104 = load i16*, i16** %2, align 8
  %105 = load i16, i16* %104, align 2
  %106 = sext i16 %105 to i32
  %107 = icmp ne i32 %106, -32768
  br i1 %107, label %108, label %109

; <label>:108:                                    ; preds = %100
  br label %112

; <label>:109:                                    ; preds = %100
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 8)
  %110 = add i64 %pgocount9, 1
  store i64 %110, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 8)
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 281, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__PRETTY_FUNCTION__.Transformation_to_Log_Area_Ratios, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %112

; <label>:112:                                    ; preds = %111, %108
  br label %113

; <label>:113:                                    ; preds = %112
  %114 = load i32, i32* %4, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, i32* %4, align 4
  %116 = load i16*, i16** %2, align 8
  %117 = getelementptr inbounds i16, i16* %116, i32 1
  store i16* %117, i16** %2, align 8
  br label %5

; <label>:118:                                    ; preds = %5
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 6)
  %119 = add i64 %pgocount10, 1
  store i64 %119, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Transformation_to_Log_Area_Ratios, i64 0, i64 6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Quantization_and_coding(i16*) #0 {
  %2 = alloca i16*, align 8
  %3 = alloca i16, align 2
  %4 = alloca i64, align 8
  store i16* %0, i16** %2, align 8
  %5 = load i16*, i16** %2, align 8
  %6 = load i16, i16* %5, align 2
  %7 = sext i16 %6 to i64
  %8 = mul nsw i64 20480, %7
  %9 = ashr i64 %8, 15
  %10 = trunc i64 %9 to i16
  store i16 %10, i16* %3, align 2
  %11 = load i16, i16* %3, align 2
  %12 = sext i16 %11 to i64
  %13 = add nsw i64 %12, 0
  store i64 %13, i64* %4, align 8
  %14 = sub nsw i64 %13, -32768
  %15 = icmp ugt i64 %14, 65535
  br i1 %15, label %16, label %23

; <label>:16:                                     ; preds = %1
  %17 = load i64, i64* %4, align 8
  %18 = icmp sgt i64 %17, 0
  %19 = zext i1 %18 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 33)
  %20 = add i64 %pgocount, %19
  store i64 %20, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 33)
  %21 = select i1 %18, i32 32767, i32 -32768
  %22 = sext i32 %21 to i64
  br label %26

; <label>:23:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 0)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 0)
  %25 = load i64, i64* %4, align 8
  br label %26

; <label>:26:                                     ; preds = %23, %16
  %27 = phi i64 [ %22, %16 ], [ %25, %23 ]
  %28 = trunc i64 %27 to i16
  store i16 %28, i16* %3, align 2
  %29 = load i16, i16* %3, align 2
  %30 = sext i16 %29 to i64
  %31 = add nsw i64 %30, 256
  store i64 %31, i64* %4, align 8
  %32 = sub nsw i64 %31, -32768
  %33 = icmp ugt i64 %32, 65535
  br i1 %33, label %34, label %41

; <label>:34:                                     ; preds = %26
  %35 = load i64, i64* %4, align 8
  %36 = icmp sgt i64 %35, 0
  %37 = zext i1 %36 to i64
  %pgocount2 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 34)
  %38 = add i64 %pgocount2, %37
  store i64 %38, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 34)
  %39 = select i1 %36, i32 32767, i32 -32768
  %40 = sext i32 %39 to i64
  br label %44

; <label>:41:                                     ; preds = %26
  %pgocount3 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 1)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 1)
  %43 = load i64, i64* %4, align 8
  br label %44

; <label>:44:                                     ; preds = %41, %34
  %45 = phi i64 [ %40, %34 ], [ %43, %41 ]
  %46 = trunc i64 %45 to i16
  store i16 %46, i16* %3, align 2
  %47 = load i16, i16* %3, align 2
  %48 = sext i16 %47 to i32
  %49 = ashr i32 %48, 9
  %50 = trunc i32 %49 to i16
  store i16 %50, i16* %3, align 2
  %51 = load i16, i16* %3, align 2
  %52 = sext i16 %51 to i32
  %53 = icmp sgt i32 %52, 31
  br i1 %53, label %54, label %55

; <label>:54:                                     ; preds = %44
  br label %68

; <label>:55:                                     ; preds = %44
  %56 = load i16, i16* %3, align 2
  %57 = sext i16 %56 to i32
  %58 = icmp slt i32 %57, -32
  br i1 %58, label %59, label %61

; <label>:59:                                     ; preds = %55
  %pgocount4 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 17)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 17)
  br label %66

; <label>:61:                                     ; preds = %55
  %pgocount5 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 18)
  %62 = add i64 %pgocount5, 1
  store i64 %62, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 18)
  %63 = load i16, i16* %3, align 2
  %64 = sext i16 %63 to i32
  %65 = sub nsw i32 %64, -32
  br label %66

; <label>:66:                                     ; preds = %61, %59
  %67 = phi i32 [ 0, %59 ], [ %65, %61 ]
  br label %68

; <label>:68:                                     ; preds = %66, %54
  %69 = phi i32 [ 63, %54 ], [ %67, %66 ]
  %70 = trunc i32 %69 to i16
  %71 = load i16*, i16** %2, align 8
  store i16 %70, i16* %71, align 2
  %72 = load i16*, i16** %2, align 8
  %73 = getelementptr inbounds i16, i16* %72, i32 1
  store i16* %73, i16** %2, align 8
  %74 = load i16*, i16** %2, align 8
  %75 = load i16, i16* %74, align 2
  %76 = sext i16 %75 to i64
  %77 = mul nsw i64 20480, %76
  %78 = ashr i64 %77, 15
  %79 = trunc i64 %78 to i16
  store i16 %79, i16* %3, align 2
  %80 = load i16, i16* %3, align 2
  %81 = sext i16 %80 to i64
  %82 = add nsw i64 %81, 0
  store i64 %82, i64* %4, align 8
  %83 = sub nsw i64 %82, -32768
  %84 = icmp ugt i64 %83, 65535
  br i1 %84, label %85, label %92

; <label>:85:                                     ; preds = %68
  %86 = load i64, i64* %4, align 8
  %87 = icmp sgt i64 %86, 0
  %88 = zext i1 %87 to i64
  %pgocount6 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 35)
  %89 = add i64 %pgocount6, %88
  store i64 %89, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 35)
  %90 = select i1 %87, i32 32767, i32 -32768
  %91 = sext i32 %90 to i64
  br label %95

; <label>:92:                                     ; preds = %68
  %pgocount7 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 2)
  %93 = add i64 %pgocount7, 1
  store i64 %93, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 2)
  %94 = load i64, i64* %4, align 8
  br label %95

; <label>:95:                                     ; preds = %92, %85
  %96 = phi i64 [ %91, %85 ], [ %94, %92 ]
  %97 = trunc i64 %96 to i16
  store i16 %97, i16* %3, align 2
  %98 = load i16, i16* %3, align 2
  %99 = sext i16 %98 to i64
  %100 = add nsw i64 %99, 256
  store i64 %100, i64* %4, align 8
  %101 = sub nsw i64 %100, -32768
  %102 = icmp ugt i64 %101, 65535
  br i1 %102, label %103, label %110

; <label>:103:                                    ; preds = %95
  %104 = load i64, i64* %4, align 8
  %105 = icmp sgt i64 %104, 0
  %106 = zext i1 %105 to i64
  %pgocount8 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 36)
  %107 = add i64 %pgocount8, %106
  store i64 %107, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 36)
  %108 = select i1 %105, i32 32767, i32 -32768
  %109 = sext i32 %108 to i64
  br label %113

; <label>:110:                                    ; preds = %95
  %pgocount9 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 3)
  %111 = add i64 %pgocount9, 1
  store i64 %111, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 3)
  %112 = load i64, i64* %4, align 8
  br label %113

; <label>:113:                                    ; preds = %110, %103
  %114 = phi i64 [ %109, %103 ], [ %112, %110 ]
  %115 = trunc i64 %114 to i16
  store i16 %115, i16* %3, align 2
  %116 = load i16, i16* %3, align 2
  %117 = sext i16 %116 to i32
  %118 = ashr i32 %117, 9
  %119 = trunc i32 %118 to i16
  store i16 %119, i16* %3, align 2
  %120 = load i16, i16* %3, align 2
  %121 = sext i16 %120 to i32
  %122 = icmp sgt i32 %121, 31
  br i1 %122, label %123, label %124

; <label>:123:                                    ; preds = %113
  br label %137

; <label>:124:                                    ; preds = %113
  %125 = load i16, i16* %3, align 2
  %126 = sext i16 %125 to i32
  %127 = icmp slt i32 %126, -32
  br i1 %127, label %128, label %130

; <label>:128:                                    ; preds = %124
  %pgocount10 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 19)
  %129 = add i64 %pgocount10, 1
  store i64 %129, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 19)
  br label %135

; <label>:130:                                    ; preds = %124
  %pgocount11 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 20)
  %131 = add i64 %pgocount11, 1
  store i64 %131, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 20)
  %132 = load i16, i16* %3, align 2
  %133 = sext i16 %132 to i32
  %134 = sub nsw i32 %133, -32
  br label %135

; <label>:135:                                    ; preds = %130, %128
  %136 = phi i32 [ 0, %128 ], [ %134, %130 ]
  br label %137

; <label>:137:                                    ; preds = %135, %123
  %138 = phi i32 [ 63, %123 ], [ %136, %135 ]
  %139 = trunc i32 %138 to i16
  %140 = load i16*, i16** %2, align 8
  store i16 %139, i16* %140, align 2
  %141 = load i16*, i16** %2, align 8
  %142 = getelementptr inbounds i16, i16* %141, i32 1
  store i16* %142, i16** %2, align 8
  %143 = load i16*, i16** %2, align 8
  %144 = load i16, i16* %143, align 2
  %145 = sext i16 %144 to i64
  %146 = mul nsw i64 20480, %145
  %147 = ashr i64 %146, 15
  %148 = trunc i64 %147 to i16
  store i16 %148, i16* %3, align 2
  %149 = load i16, i16* %3, align 2
  %150 = sext i16 %149 to i64
  %151 = add nsw i64 %150, 2048
  store i64 %151, i64* %4, align 8
  %152 = sub nsw i64 %151, -32768
  %153 = icmp ugt i64 %152, 65535
  br i1 %153, label %154, label %161

; <label>:154:                                    ; preds = %137
  %155 = load i64, i64* %4, align 8
  %156 = icmp sgt i64 %155, 0
  %157 = zext i1 %156 to i64
  %pgocount12 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 37)
  %158 = add i64 %pgocount12, %157
  store i64 %158, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 37)
  %159 = select i1 %156, i32 32767, i32 -32768
  %160 = sext i32 %159 to i64
  br label %164

; <label>:161:                                    ; preds = %137
  %pgocount13 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 4)
  %162 = add i64 %pgocount13, 1
  store i64 %162, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 4)
  %163 = load i64, i64* %4, align 8
  br label %164

; <label>:164:                                    ; preds = %161, %154
  %165 = phi i64 [ %160, %154 ], [ %163, %161 ]
  %166 = trunc i64 %165 to i16
  store i16 %166, i16* %3, align 2
  %167 = load i16, i16* %3, align 2
  %168 = sext i16 %167 to i64
  %169 = add nsw i64 %168, 256
  store i64 %169, i64* %4, align 8
  %170 = sub nsw i64 %169, -32768
  %171 = icmp ugt i64 %170, 65535
  br i1 %171, label %172, label %179

; <label>:172:                                    ; preds = %164
  %173 = load i64, i64* %4, align 8
  %174 = icmp sgt i64 %173, 0
  %175 = zext i1 %174 to i64
  %pgocount14 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 38)
  %176 = add i64 %pgocount14, %175
  store i64 %176, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 38)
  %177 = select i1 %174, i32 32767, i32 -32768
  %178 = sext i32 %177 to i64
  br label %182

; <label>:179:                                    ; preds = %164
  %pgocount15 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 5)
  %180 = add i64 %pgocount15, 1
  store i64 %180, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 5)
  %181 = load i64, i64* %4, align 8
  br label %182

; <label>:182:                                    ; preds = %179, %172
  %183 = phi i64 [ %178, %172 ], [ %181, %179 ]
  %184 = trunc i64 %183 to i16
  store i16 %184, i16* %3, align 2
  %185 = load i16, i16* %3, align 2
  %186 = sext i16 %185 to i32
  %187 = ashr i32 %186, 9
  %188 = trunc i32 %187 to i16
  store i16 %188, i16* %3, align 2
  %189 = load i16, i16* %3, align 2
  %190 = sext i16 %189 to i32
  %191 = icmp sgt i32 %190, 15
  br i1 %191, label %192, label %193

; <label>:192:                                    ; preds = %182
  br label %206

; <label>:193:                                    ; preds = %182
  %194 = load i16, i16* %3, align 2
  %195 = sext i16 %194 to i32
  %196 = icmp slt i32 %195, -16
  br i1 %196, label %197, label %199

; <label>:197:                                    ; preds = %193
  %pgocount16 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 21)
  %198 = add i64 %pgocount16, 1
  store i64 %198, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 21)
  br label %204

; <label>:199:                                    ; preds = %193
  %pgocount17 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 22)
  %200 = add i64 %pgocount17, 1
  store i64 %200, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 22)
  %201 = load i16, i16* %3, align 2
  %202 = sext i16 %201 to i32
  %203 = sub nsw i32 %202, -16
  br label %204

; <label>:204:                                    ; preds = %199, %197
  %205 = phi i32 [ 0, %197 ], [ %203, %199 ]
  br label %206

; <label>:206:                                    ; preds = %204, %192
  %207 = phi i32 [ 31, %192 ], [ %205, %204 ]
  %208 = trunc i32 %207 to i16
  %209 = load i16*, i16** %2, align 8
  store i16 %208, i16* %209, align 2
  %210 = load i16*, i16** %2, align 8
  %211 = getelementptr inbounds i16, i16* %210, i32 1
  store i16* %211, i16** %2, align 8
  %212 = load i16*, i16** %2, align 8
  %213 = load i16, i16* %212, align 2
  %214 = sext i16 %213 to i64
  %215 = mul nsw i64 20480, %214
  %216 = ashr i64 %215, 15
  %217 = trunc i64 %216 to i16
  store i16 %217, i16* %3, align 2
  %218 = load i16, i16* %3, align 2
  %219 = sext i16 %218 to i64
  %220 = add nsw i64 %219, -2560
  store i64 %220, i64* %4, align 8
  %221 = sub nsw i64 %220, -32768
  %222 = icmp ugt i64 %221, 65535
  br i1 %222, label %223, label %230

; <label>:223:                                    ; preds = %206
  %224 = load i64, i64* %4, align 8
  %225 = icmp sgt i64 %224, 0
  %226 = zext i1 %225 to i64
  %pgocount18 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 39)
  %227 = add i64 %pgocount18, %226
  store i64 %227, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 39)
  %228 = select i1 %225, i32 32767, i32 -32768
  %229 = sext i32 %228 to i64
  br label %233

; <label>:230:                                    ; preds = %206
  %pgocount19 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 6)
  %231 = add i64 %pgocount19, 1
  store i64 %231, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 6)
  %232 = load i64, i64* %4, align 8
  br label %233

; <label>:233:                                    ; preds = %230, %223
  %234 = phi i64 [ %229, %223 ], [ %232, %230 ]
  %235 = trunc i64 %234 to i16
  store i16 %235, i16* %3, align 2
  %236 = load i16, i16* %3, align 2
  %237 = sext i16 %236 to i64
  %238 = add nsw i64 %237, 256
  store i64 %238, i64* %4, align 8
  %239 = sub nsw i64 %238, -32768
  %240 = icmp ugt i64 %239, 65535
  br i1 %240, label %241, label %248

; <label>:241:                                    ; preds = %233
  %242 = load i64, i64* %4, align 8
  %243 = icmp sgt i64 %242, 0
  %244 = zext i1 %243 to i64
  %pgocount20 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 40)
  %245 = add i64 %pgocount20, %244
  store i64 %245, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 40)
  %246 = select i1 %243, i32 32767, i32 -32768
  %247 = sext i32 %246 to i64
  br label %251

; <label>:248:                                    ; preds = %233
  %pgocount21 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 7)
  %249 = add i64 %pgocount21, 1
  store i64 %249, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 7)
  %250 = load i64, i64* %4, align 8
  br label %251

; <label>:251:                                    ; preds = %248, %241
  %252 = phi i64 [ %247, %241 ], [ %250, %248 ]
  %253 = trunc i64 %252 to i16
  store i16 %253, i16* %3, align 2
  %254 = load i16, i16* %3, align 2
  %255 = sext i16 %254 to i32
  %256 = ashr i32 %255, 9
  %257 = trunc i32 %256 to i16
  store i16 %257, i16* %3, align 2
  %258 = load i16, i16* %3, align 2
  %259 = sext i16 %258 to i32
  %260 = icmp sgt i32 %259, 15
  br i1 %260, label %261, label %262

; <label>:261:                                    ; preds = %251
  br label %275

; <label>:262:                                    ; preds = %251
  %263 = load i16, i16* %3, align 2
  %264 = sext i16 %263 to i32
  %265 = icmp slt i32 %264, -16
  br i1 %265, label %266, label %268

; <label>:266:                                    ; preds = %262
  %pgocount22 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 23)
  %267 = add i64 %pgocount22, 1
  store i64 %267, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 23)
  br label %273

; <label>:268:                                    ; preds = %262
  %pgocount23 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 24)
  %269 = add i64 %pgocount23, 1
  store i64 %269, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 24)
  %270 = load i16, i16* %3, align 2
  %271 = sext i16 %270 to i32
  %272 = sub nsw i32 %271, -16
  br label %273

; <label>:273:                                    ; preds = %268, %266
  %274 = phi i32 [ 0, %266 ], [ %272, %268 ]
  br label %275

; <label>:275:                                    ; preds = %273, %261
  %276 = phi i32 [ 31, %261 ], [ %274, %273 ]
  %277 = trunc i32 %276 to i16
  %278 = load i16*, i16** %2, align 8
  store i16 %277, i16* %278, align 2
  %279 = load i16*, i16** %2, align 8
  %280 = getelementptr inbounds i16, i16* %279, i32 1
  store i16* %280, i16** %2, align 8
  %281 = load i16*, i16** %2, align 8
  %282 = load i16, i16* %281, align 2
  %283 = sext i16 %282 to i64
  %284 = mul nsw i64 13964, %283
  %285 = ashr i64 %284, 15
  %286 = trunc i64 %285 to i16
  store i16 %286, i16* %3, align 2
  %287 = load i16, i16* %3, align 2
  %288 = sext i16 %287 to i64
  %289 = add nsw i64 %288, 94
  store i64 %289, i64* %4, align 8
  %290 = sub nsw i64 %289, -32768
  %291 = icmp ugt i64 %290, 65535
  br i1 %291, label %292, label %299

; <label>:292:                                    ; preds = %275
  %293 = load i64, i64* %4, align 8
  %294 = icmp sgt i64 %293, 0
  %295 = zext i1 %294 to i64
  %pgocount24 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 41)
  %296 = add i64 %pgocount24, %295
  store i64 %296, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 41)
  %297 = select i1 %294, i32 32767, i32 -32768
  %298 = sext i32 %297 to i64
  br label %302

; <label>:299:                                    ; preds = %275
  %pgocount25 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 8)
  %300 = add i64 %pgocount25, 1
  store i64 %300, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 8)
  %301 = load i64, i64* %4, align 8
  br label %302

; <label>:302:                                    ; preds = %299, %292
  %303 = phi i64 [ %298, %292 ], [ %301, %299 ]
  %304 = trunc i64 %303 to i16
  store i16 %304, i16* %3, align 2
  %305 = load i16, i16* %3, align 2
  %306 = sext i16 %305 to i64
  %307 = add nsw i64 %306, 256
  store i64 %307, i64* %4, align 8
  %308 = sub nsw i64 %307, -32768
  %309 = icmp ugt i64 %308, 65535
  br i1 %309, label %310, label %317

; <label>:310:                                    ; preds = %302
  %311 = load i64, i64* %4, align 8
  %312 = icmp sgt i64 %311, 0
  %313 = zext i1 %312 to i64
  %pgocount26 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 42)
  %314 = add i64 %pgocount26, %313
  store i64 %314, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 42)
  %315 = select i1 %312, i32 32767, i32 -32768
  %316 = sext i32 %315 to i64
  br label %320

; <label>:317:                                    ; preds = %302
  %pgocount27 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 9)
  %318 = add i64 %pgocount27, 1
  store i64 %318, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 9)
  %319 = load i64, i64* %4, align 8
  br label %320

; <label>:320:                                    ; preds = %317, %310
  %321 = phi i64 [ %316, %310 ], [ %319, %317 ]
  %322 = trunc i64 %321 to i16
  store i16 %322, i16* %3, align 2
  %323 = load i16, i16* %3, align 2
  %324 = sext i16 %323 to i32
  %325 = ashr i32 %324, 9
  %326 = trunc i32 %325 to i16
  store i16 %326, i16* %3, align 2
  %327 = load i16, i16* %3, align 2
  %328 = sext i16 %327 to i32
  %329 = icmp sgt i32 %328, 7
  br i1 %329, label %330, label %331

; <label>:330:                                    ; preds = %320
  br label %344

; <label>:331:                                    ; preds = %320
  %332 = load i16, i16* %3, align 2
  %333 = sext i16 %332 to i32
  %334 = icmp slt i32 %333, -8
  br i1 %334, label %335, label %337

; <label>:335:                                    ; preds = %331
  %pgocount28 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 25)
  %336 = add i64 %pgocount28, 1
  store i64 %336, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 25)
  br label %342

; <label>:337:                                    ; preds = %331
  %pgocount29 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 26)
  %338 = add i64 %pgocount29, 1
  store i64 %338, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 26)
  %339 = load i16, i16* %3, align 2
  %340 = sext i16 %339 to i32
  %341 = sub nsw i32 %340, -8
  br label %342

; <label>:342:                                    ; preds = %337, %335
  %343 = phi i32 [ 0, %335 ], [ %341, %337 ]
  br label %344

; <label>:344:                                    ; preds = %342, %330
  %345 = phi i32 [ 15, %330 ], [ %343, %342 ]
  %346 = trunc i32 %345 to i16
  %347 = load i16*, i16** %2, align 8
  store i16 %346, i16* %347, align 2
  %348 = load i16*, i16** %2, align 8
  %349 = getelementptr inbounds i16, i16* %348, i32 1
  store i16* %349, i16** %2, align 8
  %350 = load i16*, i16** %2, align 8
  %351 = load i16, i16* %350, align 2
  %352 = sext i16 %351 to i64
  %353 = mul nsw i64 15360, %352
  %354 = ashr i64 %353, 15
  %355 = trunc i64 %354 to i16
  store i16 %355, i16* %3, align 2
  %356 = load i16, i16* %3, align 2
  %357 = sext i16 %356 to i64
  %358 = add nsw i64 %357, -1792
  store i64 %358, i64* %4, align 8
  %359 = sub nsw i64 %358, -32768
  %360 = icmp ugt i64 %359, 65535
  br i1 %360, label %361, label %368

; <label>:361:                                    ; preds = %344
  %362 = load i64, i64* %4, align 8
  %363 = icmp sgt i64 %362, 0
  %364 = zext i1 %363 to i64
  %pgocount30 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 43)
  %365 = add i64 %pgocount30, %364
  store i64 %365, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 43)
  %366 = select i1 %363, i32 32767, i32 -32768
  %367 = sext i32 %366 to i64
  br label %371

; <label>:368:                                    ; preds = %344
  %pgocount31 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 10)
  %369 = add i64 %pgocount31, 1
  store i64 %369, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 10)
  %370 = load i64, i64* %4, align 8
  br label %371

; <label>:371:                                    ; preds = %368, %361
  %372 = phi i64 [ %367, %361 ], [ %370, %368 ]
  %373 = trunc i64 %372 to i16
  store i16 %373, i16* %3, align 2
  %374 = load i16, i16* %3, align 2
  %375 = sext i16 %374 to i64
  %376 = add nsw i64 %375, 256
  store i64 %376, i64* %4, align 8
  %377 = sub nsw i64 %376, -32768
  %378 = icmp ugt i64 %377, 65535
  br i1 %378, label %379, label %386

; <label>:379:                                    ; preds = %371
  %380 = load i64, i64* %4, align 8
  %381 = icmp sgt i64 %380, 0
  %382 = zext i1 %381 to i64
  %pgocount32 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 44)
  %383 = add i64 %pgocount32, %382
  store i64 %383, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 44)
  %384 = select i1 %381, i32 32767, i32 -32768
  %385 = sext i32 %384 to i64
  br label %389

; <label>:386:                                    ; preds = %371
  %pgocount33 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 11)
  %387 = add i64 %pgocount33, 1
  store i64 %387, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 11)
  %388 = load i64, i64* %4, align 8
  br label %389

; <label>:389:                                    ; preds = %386, %379
  %390 = phi i64 [ %385, %379 ], [ %388, %386 ]
  %391 = trunc i64 %390 to i16
  store i16 %391, i16* %3, align 2
  %392 = load i16, i16* %3, align 2
  %393 = sext i16 %392 to i32
  %394 = ashr i32 %393, 9
  %395 = trunc i32 %394 to i16
  store i16 %395, i16* %3, align 2
  %396 = load i16, i16* %3, align 2
  %397 = sext i16 %396 to i32
  %398 = icmp sgt i32 %397, 7
  br i1 %398, label %399, label %400

; <label>:399:                                    ; preds = %389
  br label %413

; <label>:400:                                    ; preds = %389
  %401 = load i16, i16* %3, align 2
  %402 = sext i16 %401 to i32
  %403 = icmp slt i32 %402, -8
  br i1 %403, label %404, label %406

; <label>:404:                                    ; preds = %400
  %pgocount34 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 27)
  %405 = add i64 %pgocount34, 1
  store i64 %405, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 27)
  br label %411

; <label>:406:                                    ; preds = %400
  %pgocount35 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 28)
  %407 = add i64 %pgocount35, 1
  store i64 %407, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 28)
  %408 = load i16, i16* %3, align 2
  %409 = sext i16 %408 to i32
  %410 = sub nsw i32 %409, -8
  br label %411

; <label>:411:                                    ; preds = %406, %404
  %412 = phi i32 [ 0, %404 ], [ %410, %406 ]
  br label %413

; <label>:413:                                    ; preds = %411, %399
  %414 = phi i32 [ 15, %399 ], [ %412, %411 ]
  %415 = trunc i32 %414 to i16
  %416 = load i16*, i16** %2, align 8
  store i16 %415, i16* %416, align 2
  %417 = load i16*, i16** %2, align 8
  %418 = getelementptr inbounds i16, i16* %417, i32 1
  store i16* %418, i16** %2, align 8
  %419 = load i16*, i16** %2, align 8
  %420 = load i16, i16* %419, align 2
  %421 = sext i16 %420 to i64
  %422 = mul nsw i64 8534, %421
  %423 = ashr i64 %422, 15
  %424 = trunc i64 %423 to i16
  store i16 %424, i16* %3, align 2
  %425 = load i16, i16* %3, align 2
  %426 = sext i16 %425 to i64
  %427 = add nsw i64 %426, -341
  store i64 %427, i64* %4, align 8
  %428 = sub nsw i64 %427, -32768
  %429 = icmp ugt i64 %428, 65535
  br i1 %429, label %430, label %437

; <label>:430:                                    ; preds = %413
  %431 = load i64, i64* %4, align 8
  %432 = icmp sgt i64 %431, 0
  %433 = zext i1 %432 to i64
  %pgocount36 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 45)
  %434 = add i64 %pgocount36, %433
  store i64 %434, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 45)
  %435 = select i1 %432, i32 32767, i32 -32768
  %436 = sext i32 %435 to i64
  br label %440

; <label>:437:                                    ; preds = %413
  %pgocount37 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 12)
  %438 = add i64 %pgocount37, 1
  store i64 %438, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 12)
  %439 = load i64, i64* %4, align 8
  br label %440

; <label>:440:                                    ; preds = %437, %430
  %441 = phi i64 [ %436, %430 ], [ %439, %437 ]
  %442 = trunc i64 %441 to i16
  store i16 %442, i16* %3, align 2
  %443 = load i16, i16* %3, align 2
  %444 = sext i16 %443 to i64
  %445 = add nsw i64 %444, 256
  store i64 %445, i64* %4, align 8
  %446 = sub nsw i64 %445, -32768
  %447 = icmp ugt i64 %446, 65535
  br i1 %447, label %448, label %455

; <label>:448:                                    ; preds = %440
  %449 = load i64, i64* %4, align 8
  %450 = icmp sgt i64 %449, 0
  %451 = zext i1 %450 to i64
  %pgocount38 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 46)
  %452 = add i64 %pgocount38, %451
  store i64 %452, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 46)
  %453 = select i1 %450, i32 32767, i32 -32768
  %454 = sext i32 %453 to i64
  br label %458

; <label>:455:                                    ; preds = %440
  %pgocount39 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 13)
  %456 = add i64 %pgocount39, 1
  store i64 %456, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 13)
  %457 = load i64, i64* %4, align 8
  br label %458

; <label>:458:                                    ; preds = %455, %448
  %459 = phi i64 [ %454, %448 ], [ %457, %455 ]
  %460 = trunc i64 %459 to i16
  store i16 %460, i16* %3, align 2
  %461 = load i16, i16* %3, align 2
  %462 = sext i16 %461 to i32
  %463 = ashr i32 %462, 9
  %464 = trunc i32 %463 to i16
  store i16 %464, i16* %3, align 2
  %465 = load i16, i16* %3, align 2
  %466 = sext i16 %465 to i32
  %467 = icmp sgt i32 %466, 3
  br i1 %467, label %468, label %469

; <label>:468:                                    ; preds = %458
  br label %482

; <label>:469:                                    ; preds = %458
  %470 = load i16, i16* %3, align 2
  %471 = sext i16 %470 to i32
  %472 = icmp slt i32 %471, -4
  br i1 %472, label %473, label %475

; <label>:473:                                    ; preds = %469
  %pgocount40 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 29)
  %474 = add i64 %pgocount40, 1
  store i64 %474, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 29)
  br label %480

; <label>:475:                                    ; preds = %469
  %pgocount41 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 30)
  %476 = add i64 %pgocount41, 1
  store i64 %476, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 30)
  %477 = load i16, i16* %3, align 2
  %478 = sext i16 %477 to i32
  %479 = sub nsw i32 %478, -4
  br label %480

; <label>:480:                                    ; preds = %475, %473
  %481 = phi i32 [ 0, %473 ], [ %479, %475 ]
  br label %482

; <label>:482:                                    ; preds = %480, %468
  %483 = phi i32 [ 7, %468 ], [ %481, %480 ]
  %484 = trunc i32 %483 to i16
  %485 = load i16*, i16** %2, align 8
  store i16 %484, i16* %485, align 2
  %486 = load i16*, i16** %2, align 8
  %487 = getelementptr inbounds i16, i16* %486, i32 1
  store i16* %487, i16** %2, align 8
  %488 = load i16*, i16** %2, align 8
  %489 = load i16, i16* %488, align 2
  %490 = sext i16 %489 to i64
  %491 = mul nsw i64 9036, %490
  %492 = ashr i64 %491, 15
  %493 = trunc i64 %492 to i16
  store i16 %493, i16* %3, align 2
  %494 = load i16, i16* %3, align 2
  %495 = sext i16 %494 to i64
  %496 = add nsw i64 %495, -1144
  store i64 %496, i64* %4, align 8
  %497 = sub nsw i64 %496, -32768
  %498 = icmp ugt i64 %497, 65535
  br i1 %498, label %499, label %506

; <label>:499:                                    ; preds = %482
  %500 = load i64, i64* %4, align 8
  %501 = icmp sgt i64 %500, 0
  %502 = zext i1 %501 to i64
  %pgocount42 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 47)
  %503 = add i64 %pgocount42, %502
  store i64 %503, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 47)
  %504 = select i1 %501, i32 32767, i32 -32768
  %505 = sext i32 %504 to i64
  br label %509

; <label>:506:                                    ; preds = %482
  %pgocount43 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 14)
  %507 = add i64 %pgocount43, 1
  store i64 %507, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 14)
  %508 = load i64, i64* %4, align 8
  br label %509

; <label>:509:                                    ; preds = %506, %499
  %510 = phi i64 [ %505, %499 ], [ %508, %506 ]
  %511 = trunc i64 %510 to i16
  store i16 %511, i16* %3, align 2
  %512 = load i16, i16* %3, align 2
  %513 = sext i16 %512 to i64
  %514 = add nsw i64 %513, 256
  store i64 %514, i64* %4, align 8
  %515 = sub nsw i64 %514, -32768
  %516 = icmp ugt i64 %515, 65535
  br i1 %516, label %517, label %524

; <label>:517:                                    ; preds = %509
  %518 = load i64, i64* %4, align 8
  %519 = icmp sgt i64 %518, 0
  %520 = zext i1 %519 to i64
  %pgocount44 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 48)
  %521 = add i64 %pgocount44, %520
  store i64 %521, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 48)
  %522 = select i1 %519, i32 32767, i32 -32768
  %523 = sext i32 %522 to i64
  br label %527

; <label>:524:                                    ; preds = %509
  %pgocount45 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 15)
  %525 = add i64 %pgocount45, 1
  store i64 %525, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 15)
  %526 = load i64, i64* %4, align 8
  br label %527

; <label>:527:                                    ; preds = %524, %517
  %528 = phi i64 [ %523, %517 ], [ %526, %524 ]
  %529 = trunc i64 %528 to i16
  store i16 %529, i16* %3, align 2
  %530 = load i16, i16* %3, align 2
  %531 = sext i16 %530 to i32
  %532 = ashr i32 %531, 9
  %533 = trunc i32 %532 to i16
  store i16 %533, i16* %3, align 2
  %534 = load i16, i16* %3, align 2
  %535 = sext i16 %534 to i32
  %536 = icmp sgt i32 %535, 3
  br i1 %536, label %537, label %539

; <label>:537:                                    ; preds = %527
  %pgocount46 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 16)
  %538 = add i64 %pgocount46, 1
  store i64 %538, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 16)
  br label %552

; <label>:539:                                    ; preds = %527
  %540 = load i16, i16* %3, align 2
  %541 = sext i16 %540 to i32
  %542 = icmp slt i32 %541, -4
  br i1 %542, label %543, label %545

; <label>:543:                                    ; preds = %539
  %pgocount47 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 31)
  %544 = add i64 %pgocount47, 1
  store i64 %544, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 31)
  br label %550

; <label>:545:                                    ; preds = %539
  %pgocount48 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 32)
  %546 = add i64 %pgocount48, 1
  store i64 %546, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Quantization_and_coding, i64 0, i64 32)
  %547 = load i16, i16* %3, align 2
  %548 = sext i16 %547 to i32
  %549 = sub nsw i32 %548, -4
  br label %550

; <label>:550:                                    ; preds = %545, %543
  %551 = phi i32 [ 0, %543 ], [ %549, %545 ]
  br label %552

; <label>:552:                                    ; preds = %550, %537
  %553 = phi i32 [ 7, %537 ], [ %551, %550 ]
  %554 = trunc i32 %553 to i16
  %555 = load i16*, i16** %2, align 8
  store i16 %554, i16* %555, align 2
  %556 = load i16*, i16** %2, align 8
  %557 = getelementptr inbounds i16, i16* %556, i32 1
  store i16* %557, i16** %2, align 8
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

declare signext i16 @gsm_norm(i64) #2

declare signext i16 @gsm_div(i16 signext, i16 signext) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
