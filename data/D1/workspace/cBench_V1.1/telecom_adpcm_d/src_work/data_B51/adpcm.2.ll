; ModuleID = 'tmp1.ll'
source_filename = "adpcm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.adpcm_state = type { i16, i8 }

$__llvm_profile_raw_version = comdat any

@stepsizeTable = internal global [89 x i32] [i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 16, i32 17, i32 19, i32 21, i32 23, i32 25, i32 28, i32 31, i32 34, i32 37, i32 41, i32 45, i32 50, i32 55, i32 60, i32 66, i32 73, i32 80, i32 88, i32 97, i32 107, i32 118, i32 130, i32 143, i32 157, i32 173, i32 190, i32 209, i32 230, i32 253, i32 279, i32 307, i32 337, i32 371, i32 408, i32 449, i32 494, i32 544, i32 598, i32 658, i32 724, i32 796, i32 876, i32 963, i32 1060, i32 1166, i32 1282, i32 1411, i32 1552, i32 1707, i32 1878, i32 2066, i32 2272, i32 2499, i32 2749, i32 3024, i32 3327, i32 3660, i32 4026, i32 4428, i32 4871, i32 5358, i32 5894, i32 6484, i32 7132, i32 7845, i32 8630, i32 9493, i32 10442, i32 11487, i32 12635, i32 13899, i32 15289, i32 16818, i32 18500, i32 20350, i32 22385, i32 24623, i32 27086, i32 29794, i32 32767], align 16
@indexTable = internal global [16 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8, i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8], align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_adpcm_coder = private constant [11 x i8] c"adpcm_coder"
@__profn_adpcm_decoder = private constant [13 x i8] c"adpcm_decoder"
@__profc_adpcm_coder = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_adpcm_coder = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4725767580896531455, i64 72057780342871155, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i32 0, i32 0), i8* bitcast (void (i16*, i8*, i32, %struct.adpcm_state*)* @adpcm_coder to i8*), i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_adpcm_decoder = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_adpcm_decoder = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9185738878439042720, i64 159539472701, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i32 0, i32 0), i8* bitcast (void (i8*, i16*, i32, %struct.adpcm_state*)* @adpcm_decoder to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [27 x i8] c"\19\00adpcm_coder\01adpcm_decoder", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_adpcm_coder to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_adpcm_decoder to i8*), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @adpcm_coder(i16*, i8*, i32, %struct.adpcm_state*) #0 {
  %5 = alloca i16*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.adpcm_state*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store i16* %0, i16** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store %struct.adpcm_state* %3, %struct.adpcm_state** %8, align 8
  store i32 0, i32* %19, align 4
  %21 = load i8*, i8** %6, align 8
  store i8* %21, i8** %10, align 8
  %22 = load i16*, i16** %5, align 8
  store i16* %22, i16** %9, align 8
  %23 = load %struct.adpcm_state*, %struct.adpcm_state** %8, align 8
  %24 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %23, i32 0, i32 0
  %25 = load i16, i16* %24, align 2
  %26 = sext i16 %25 to i32
  store i32 %26, i32* %16, align 4
  %27 = load %struct.adpcm_state*, %struct.adpcm_state** %8, align 8
  %28 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %27, i32 0, i32 1
  %29 = load i8, i8* %28, align 2
  %30 = sext i8 %29 to i32
  store i32 %30, i32* %18, align 4
  %31 = load i32, i32* %18, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %32
  %34 = load i32, i32* %33, align 4
  store i32 %34, i32* %15, align 4
  store i32 1, i32* %20, align 4
  br label %35

; <label>:35:                                     ; preds = %168, %4
  %36 = load i32, i32* %7, align 4
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %38, label %171

; <label>:38:                                     ; preds = %35
  %39 = load i16*, i16** %9, align 8
  %40 = getelementptr inbounds i16, i16* %39, i32 1
  store i16* %40, i16** %9, align 8
  %41 = load i16, i16* %39, align 2
  %42 = sext i16 %41 to i32
  store i32 %42, i32* %11, align 4
  %43 = load i32, i32* %11, align 4
  %44 = load i32, i32* %16, align 4
  %45 = sub nsw i32 %43, %44
  store i32 %45, i32* %14, align 4
  %46 = load i32, i32* %14, align 4
  %47 = icmp slt i32 %46, 0
  %48 = zext i1 %47 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 13)
  %49 = add i64 %pgocount, %48
  store i64 %49, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 13)
  %50 = select i1 %47, i32 8, i32 0
  store i32 %50, i32* %12, align 4
  %51 = load i32, i32* %12, align 4
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %57

; <label>:53:                                     ; preds = %38
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 0)
  %54 = add i64 %pgocount1, 1
  store i64 %54, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 0)
  %55 = load i32, i32* %14, align 4
  %56 = sub nsw i32 0, %55
  store i32 %56, i32* %14, align 4
  br label %57

; <label>:57:                                     ; preds = %53, %38
  store i32 0, i32* %13, align 4
  %58 = load i32, i32* %15, align 4
  %59 = ashr i32 %58, 3
  store i32 %59, i32* %17, align 4
  %60 = load i32, i32* %14, align 4
  %61 = load i32, i32* %15, align 4
  %62 = icmp sge i32 %60, %61
  br i1 %62, label %63, label %71

; <label>:63:                                     ; preds = %57
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 1)
  %64 = add i64 %pgocount2, 1
  store i64 %64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 1)
  store i32 4, i32* %13, align 4
  %65 = load i32, i32* %15, align 4
  %66 = load i32, i32* %14, align 4
  %67 = sub nsw i32 %66, %65
  store i32 %67, i32* %14, align 4
  %68 = load i32, i32* %15, align 4
  %69 = load i32, i32* %17, align 4
  %70 = add nsw i32 %69, %68
  store i32 %70, i32* %17, align 4
  br label %71

; <label>:71:                                     ; preds = %63, %57
  %72 = load i32, i32* %15, align 4
  %73 = ashr i32 %72, 1
  store i32 %73, i32* %15, align 4
  %74 = load i32, i32* %14, align 4
  %75 = load i32, i32* %15, align 4
  %76 = icmp sge i32 %74, %75
  br i1 %76, label %77, label %87

; <label>:77:                                     ; preds = %71
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 2)
  %78 = add i64 %pgocount3, 1
  store i64 %78, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 2)
  %79 = load i32, i32* %13, align 4
  %80 = or i32 %79, 2
  store i32 %80, i32* %13, align 4
  %81 = load i32, i32* %15, align 4
  %82 = load i32, i32* %14, align 4
  %83 = sub nsw i32 %82, %81
  store i32 %83, i32* %14, align 4
  %84 = load i32, i32* %15, align 4
  %85 = load i32, i32* %17, align 4
  %86 = add nsw i32 %85, %84
  store i32 %86, i32* %17, align 4
  br label %87

; <label>:87:                                     ; preds = %77, %71
  %88 = load i32, i32* %15, align 4
  %89 = ashr i32 %88, 1
  store i32 %89, i32* %15, align 4
  %90 = load i32, i32* %14, align 4
  %91 = load i32, i32* %15, align 4
  %92 = icmp sge i32 %90, %91
  br i1 %92, label %93, label %100

; <label>:93:                                     ; preds = %87
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 3)
  %94 = add i64 %pgocount4, 1
  store i64 %94, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 3)
  %95 = load i32, i32* %13, align 4
  %96 = or i32 %95, 1
  store i32 %96, i32* %13, align 4
  %97 = load i32, i32* %15, align 4
  %98 = load i32, i32* %17, align 4
  %99 = add nsw i32 %98, %97
  store i32 %99, i32* %17, align 4
  br label %100

; <label>:100:                                    ; preds = %93, %87
  %101 = load i32, i32* %12, align 4
  %102 = icmp ne i32 %101, 0
  br i1 %102, label %103, label %107

; <label>:103:                                    ; preds = %100
  %104 = load i32, i32* %17, align 4
  %105 = load i32, i32* %16, align 4
  %106 = sub nsw i32 %105, %104
  store i32 %106, i32* %16, align 4
  br label %112

; <label>:107:                                    ; preds = %100
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 7)
  %108 = add i64 %pgocount5, 1
  store i64 %108, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 7)
  %109 = load i32, i32* %17, align 4
  %110 = load i32, i32* %16, align 4
  %111 = add nsw i32 %110, %109
  store i32 %111, i32* %16, align 4
  br label %112

; <label>:112:                                    ; preds = %107, %103
  %113 = load i32, i32* %16, align 4
  %114 = icmp sgt i32 %113, 32767
  br i1 %114, label %115, label %117

; <label>:115:                                    ; preds = %112
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 4)
  %116 = add i64 %pgocount6, 1
  store i64 %116, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 4)
  store i32 32767, i32* %16, align 4
  br label %124

; <label>:117:                                    ; preds = %112
  %118 = load i32, i32* %16, align 4
  %119 = icmp slt i32 %118, -32768
  br i1 %119, label %120, label %122

; <label>:120:                                    ; preds = %117
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 10)
  %121 = add i64 %pgocount7, 1
  store i64 %121, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 10)
  store i32 -32768, i32* %16, align 4
  br label %122

; <label>:122:                                    ; preds = %120, %117
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 5)
  %123 = add i64 %pgocount8, 1
  store i64 %123, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 5)
  br label %124

; <label>:124:                                    ; preds = %122, %115
  %125 = load i32, i32* %12, align 4
  %126 = load i32, i32* %13, align 4
  %127 = or i32 %126, %125
  store i32 %127, i32* %13, align 4
  %128 = load i32, i32* %13, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [16 x i32], [16 x i32]* @indexTable, i64 0, i64 %129
  %131 = load i32, i32* %130, align 4
  %132 = load i32, i32* %18, align 4
  %133 = add nsw i32 %132, %131
  store i32 %133, i32* %18, align 4
  %134 = load i32, i32* %18, align 4
  %135 = icmp slt i32 %134, 0
  br i1 %135, label %136, label %138

; <label>:136:                                    ; preds = %124
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 8)
  %137 = add i64 %pgocount9, 1
  store i64 %137, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 8)
  store i32 0, i32* %18, align 4
  br label %138

; <label>:138:                                    ; preds = %136, %124
  %139 = load i32, i32* %18, align 4
  %140 = icmp sgt i32 %139, 88
  br i1 %140, label %141, label %143

; <label>:141:                                    ; preds = %138
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 6)
  %142 = add i64 %pgocount10, 1
  store i64 %142, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 6)
  store i32 88, i32* %18, align 4
  br label %143

; <label>:143:                                    ; preds = %141, %138
  %144 = load i32, i32* %18, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %145
  %147 = load i32, i32* %146, align 4
  store i32 %147, i32* %15, align 4
  %148 = load i32, i32* %20, align 4
  %149 = icmp ne i32 %148, 0
  br i1 %149, label %150, label %154

; <label>:150:                                    ; preds = %143
  %151 = load i32, i32* %13, align 4
  %152 = shl i32 %151, 4
  %153 = and i32 %152, 240
  store i32 %153, i32* %19, align 4
  br label %163

; <label>:154:                                    ; preds = %143
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 9)
  %155 = add i64 %pgocount11, 1
  store i64 %155, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 9)
  %156 = load i32, i32* %13, align 4
  %157 = and i32 %156, 15
  %158 = load i32, i32* %19, align 4
  %159 = or i32 %157, %158
  %160 = trunc i32 %159 to i8
  %161 = load i8*, i8** %10, align 8
  %162 = getelementptr inbounds i8, i8* %161, i32 1
  store i8* %162, i8** %10, align 8
  store i8 %160, i8* %161, align 1
  br label %163

; <label>:163:                                    ; preds = %154, %150
  %164 = load i32, i32* %20, align 4
  %165 = icmp ne i32 %164, 0
  %166 = xor i1 %165, true
  %167 = zext i1 %166 to i32
  store i32 %167, i32* %20, align 4
  br label %168

; <label>:168:                                    ; preds = %163
  %169 = load i32, i32* %7, align 4
  %170 = add nsw i32 %169, -1
  store i32 %170, i32* %7, align 4
  br label %35

; <label>:171:                                    ; preds = %35
  %172 = load i32, i32* %20, align 4
  %173 = icmp ne i32 %172, 0
  br i1 %173, label %180, label %174

; <label>:174:                                    ; preds = %171
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 12)
  %175 = add i64 %pgocount12, 1
  store i64 %175, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 12)
  %176 = load i32, i32* %19, align 4
  %177 = trunc i32 %176 to i8
  %178 = load i8*, i8** %10, align 8
  %179 = getelementptr inbounds i8, i8* %178, i32 1
  store i8* %179, i8** %10, align 8
  store i8 %177, i8* %178, align 1
  br label %180

; <label>:180:                                    ; preds = %174, %171
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 11)
  %181 = add i64 %pgocount13, 1
  store i64 %181, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_adpcm_coder, i64 0, i64 11)
  %182 = load i32, i32* %16, align 4
  %183 = trunc i32 %182 to i16
  %184 = load %struct.adpcm_state*, %struct.adpcm_state** %8, align 8
  %185 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %184, i32 0, i32 0
  store i16 %183, i16* %185, align 2
  %186 = load i32, i32* %18, align 4
  %187 = trunc i32 %186 to i8
  %188 = load %struct.adpcm_state*, %struct.adpcm_state** %8, align 8
  %189 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %188, i32 0, i32 1
  store i8 %187, i8* %189, align 2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @adpcm_decoder(i8*, i16*, i32, %struct.adpcm_state*) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.adpcm_state*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i16* %1, i16** %6, align 8
  store i32 %2, i32* %7, align 4
  store %struct.adpcm_state* %3, %struct.adpcm_state** %8, align 8
  store i32 0, i32* %17, align 4
  %19 = load i16*, i16** %6, align 8
  store i16* %19, i16** %10, align 8
  %20 = load i8*, i8** %5, align 8
  store i8* %20, i8** %9, align 8
  %21 = load %struct.adpcm_state*, %struct.adpcm_state** %8, align 8
  %22 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %21, i32 0, i32 0
  %23 = load i16, i16* %22, align 2
  %24 = sext i16 %23 to i32
  store i32 %24, i32* %14, align 4
  %25 = load %struct.adpcm_state*, %struct.adpcm_state** %8, align 8
  %26 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %25, i32 0, i32 1
  %27 = load i8, i8* %26, align 2
  %28 = sext i8 %27 to i32
  store i32 %28, i32* %16, align 4
  %29 = load i32, i32* %16, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %30
  %32 = load i32, i32* %31, align 4
  store i32 %32, i32* %13, align 4
  store i32 0, i32* %18, align 4
  br label %33

; <label>:33:                                     ; preds = %139, %4
  %34 = load i32, i32* %7, align 4
  %35 = icmp sgt i32 %34, 0
  br i1 %35, label %36, label %142

; <label>:36:                                     ; preds = %33
  %37 = load i32, i32* %18, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %42

; <label>:39:                                     ; preds = %36
  %40 = load i32, i32* %17, align 4
  %41 = and i32 %40, 15
  store i32 %41, i32* %12, align 4
  br label %51

; <label>:42:                                     ; preds = %36
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 6)
  %43 = add i64 %pgocount, 1
  store i64 %43, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 6)
  %44 = load i8*, i8** %9, align 8
  %45 = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %45, i8** %9, align 8
  %46 = load i8, i8* %44, align 1
  %47 = sext i8 %46 to i32
  store i32 %47, i32* %17, align 4
  %48 = load i32, i32* %17, align 4
  %49 = ashr i32 %48, 4
  %50 = and i32 %49, 15
  store i32 %50, i32* %12, align 4
  br label %51

; <label>:51:                                     ; preds = %42, %39
  %52 = load i32, i32* %18, align 4
  %53 = icmp ne i32 %52, 0
  %54 = xor i1 %53, true
  %55 = zext i1 %54 to i32
  store i32 %55, i32* %18, align 4
  %56 = load i32, i32* %12, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [16 x i32], [16 x i32]* @indexTable, i64 0, i64 %57
  %59 = load i32, i32* %58, align 4
  %60 = load i32, i32* %16, align 4
  %61 = add nsw i32 %60, %59
  store i32 %61, i32* %16, align 4
  %62 = load i32, i32* %16, align 4
  %63 = icmp slt i32 %62, 0
  br i1 %63, label %64, label %66

; <label>:64:                                     ; preds = %51
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 7)
  %65 = add i64 %pgocount1, 1
  store i64 %65, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 7)
  store i32 0, i32* %16, align 4
  br label %66

; <label>:66:                                     ; preds = %64, %51
  %67 = load i32, i32* %16, align 4
  %68 = icmp sgt i32 %67, 88
  br i1 %68, label %69, label %71

; <label>:69:                                     ; preds = %66
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 0)
  %70 = add i64 %pgocount2, 1
  store i64 %70, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 0)
  store i32 88, i32* %16, align 4
  br label %71

; <label>:71:                                     ; preds = %69, %66
  %72 = load i32, i32* %12, align 4
  %73 = and i32 %72, 8
  store i32 %73, i32* %11, align 4
  %74 = load i32, i32* %12, align 4
  %75 = and i32 %74, 7
  store i32 %75, i32* %12, align 4
  %76 = load i32, i32* %13, align 4
  %77 = ashr i32 %76, 3
  store i32 %77, i32* %15, align 4
  %78 = load i32, i32* %12, align 4
  %79 = and i32 %78, 4
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %81, label %86

; <label>:81:                                     ; preds = %71
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 1)
  %82 = add i64 %pgocount3, 1
  store i64 %82, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 1)
  %83 = load i32, i32* %13, align 4
  %84 = load i32, i32* %15, align 4
  %85 = add nsw i32 %84, %83
  store i32 %85, i32* %15, align 4
  br label %86

; <label>:86:                                     ; preds = %81, %71
  %87 = load i32, i32* %12, align 4
  %88 = and i32 %87, 2
  %89 = icmp ne i32 %88, 0
  br i1 %89, label %90, label %96

; <label>:90:                                     ; preds = %86
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 2)
  %91 = add i64 %pgocount4, 1
  store i64 %91, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 2)
  %92 = load i32, i32* %13, align 4
  %93 = ashr i32 %92, 1
  %94 = load i32, i32* %15, align 4
  %95 = add nsw i32 %94, %93
  store i32 %95, i32* %15, align 4
  br label %96

; <label>:96:                                     ; preds = %90, %86
  %97 = load i32, i32* %12, align 4
  %98 = and i32 %97, 1
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %100, label %106

; <label>:100:                                    ; preds = %96
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 3)
  %101 = add i64 %pgocount5, 1
  store i64 %101, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 3)
  %102 = load i32, i32* %13, align 4
  %103 = ashr i32 %102, 2
  %104 = load i32, i32* %15, align 4
  %105 = add nsw i32 %104, %103
  store i32 %105, i32* %15, align 4
  br label %106

; <label>:106:                                    ; preds = %100, %96
  %107 = load i32, i32* %11, align 4
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %109, label %113

; <label>:109:                                    ; preds = %106
  %110 = load i32, i32* %15, align 4
  %111 = load i32, i32* %14, align 4
  %112 = sub nsw i32 %111, %110
  store i32 %112, i32* %14, align 4
  br label %118

; <label>:113:                                    ; preds = %106
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 8)
  %114 = add i64 %pgocount6, 1
  store i64 %114, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 8)
  %115 = load i32, i32* %15, align 4
  %116 = load i32, i32* %14, align 4
  %117 = add nsw i32 %116, %115
  store i32 %117, i32* %14, align 4
  br label %118

; <label>:118:                                    ; preds = %113, %109
  %119 = load i32, i32* %14, align 4
  %120 = icmp sgt i32 %119, 32767
  br i1 %120, label %121, label %123

; <label>:121:                                    ; preds = %118
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 4)
  %122 = add i64 %pgocount7, 1
  store i64 %122, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 4)
  store i32 32767, i32* %14, align 4
  br label %130

; <label>:123:                                    ; preds = %118
  %124 = load i32, i32* %14, align 4
  %125 = icmp slt i32 %124, -32768
  br i1 %125, label %126, label %128

; <label>:126:                                    ; preds = %123
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 9)
  %127 = add i64 %pgocount8, 1
  store i64 %127, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 9)
  store i32 -32768, i32* %14, align 4
  br label %128

; <label>:128:                                    ; preds = %126, %123
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 5)
  %129 = add i64 %pgocount9, 1
  store i64 %129, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 5)
  br label %130

; <label>:130:                                    ; preds = %128, %121
  %131 = load i32, i32* %16, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %132
  %134 = load i32, i32* %133, align 4
  store i32 %134, i32* %13, align 4
  %135 = load i32, i32* %14, align 4
  %136 = trunc i32 %135 to i16
  %137 = load i16*, i16** %10, align 8
  %138 = getelementptr inbounds i16, i16* %137, i32 1
  store i16* %138, i16** %10, align 8
  store i16 %136, i16* %137, align 2
  br label %139

; <label>:139:                                    ; preds = %130
  %140 = load i32, i32* %7, align 4
  %141 = add nsw i32 %140, -1
  store i32 %141, i32* %7, align 4
  br label %33

; <label>:142:                                    ; preds = %33
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 10)
  %143 = add i64 %pgocount10, 1
  store i64 %143, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_adpcm_decoder, i64 0, i64 10)
  %144 = load i32, i32* %14, align 4
  %145 = trunc i32 %144 to i16
  %146 = load %struct.adpcm_state*, %struct.adpcm_state** %8, align 8
  %147 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %146, i32 0, i32 0
  store i16 %145, i16* %147, align 2
  %148 = load i32, i32* %16, align 4
  %149 = trunc i32 %148 to i8
  %150 = load %struct.adpcm_state*, %struct.adpcm_state** %8, align 8
  %151 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %150, i32 0, i32 1
  store i8 %149, i8* %151, align 2
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
