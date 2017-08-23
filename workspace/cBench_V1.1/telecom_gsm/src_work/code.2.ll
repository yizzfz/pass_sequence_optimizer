; ModuleID = 'tmp1.ll'
source_filename = "code.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

$__llvm_profile_raw_version = comdat any

@Gsm_Coder.e = internal global [50 x i16] zeroinitializer, align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_Gsm_Coder = private constant [9 x i8] c"Gsm_Coder"
@__profc_Gsm_Coder = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Gsm_Coder = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3116060655227121908, i64 72057664304947627, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_Gsm_Coder, i32 0, i32 0), i8* bitcast (void (%struct.gsm_state*, i16*, i16*, i16*, i16*, i16*, i16*, i16*)* @Gsm_Coder to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [19 x i8] c"\09\11x\DAs/\CE\8Dw\CEOI-\02\00\10\C8\03t", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Gsm_Coder to i8*), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @Gsm_Coder(%struct.gsm_state*, i16*, i16*, i16*, i16*, i16*, i16*, i16*) #0 {
  %9 = alloca %struct.gsm_state*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca i16*, align 8
  %13 = alloca i16*, align 8
  %14 = alloca i16*, align 8
  %15 = alloca i16*, align 8
  %16 = alloca i16*, align 8
  %17 = alloca i32, align 4
  %18 = alloca i16*, align 8
  %19 = alloca i16*, align 8
  %20 = alloca [160 x i16], align 16
  %21 = alloca i32, align 4
  %22 = alloca i64, align 8
  store %struct.gsm_state* %0, %struct.gsm_state** %9, align 8
  store i16* %1, i16** %10, align 8
  store i16* %2, i16** %11, align 8
  store i16* %3, i16** %12, align 8
  store i16* %4, i16** %13, align 8
  store i16* %5, i16** %14, align 8
  store i16* %6, i16** %15, align 8
  store i16* %7, i16** %16, align 8
  %23 = load %struct.gsm_state*, %struct.gsm_state** %9, align 8
  %24 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %23, i32 0, i32 0
  %25 = getelementptr inbounds [280 x i16], [280 x i16]* %24, i32 0, i32 0
  %26 = getelementptr inbounds i16, i16* %25, i64 120
  store i16* %26, i16** %18, align 8
  %27 = load i16*, i16** %18, align 8
  store i16* %27, i16** %19, align 8
  %28 = load %struct.gsm_state*, %struct.gsm_state** %9, align 8
  %29 = load i16*, i16** %10, align 8
  %30 = getelementptr inbounds [160 x i16], [160 x i16]* %20, i32 0, i32 0
  call void @Gsm_Preprocess(%struct.gsm_state* %28, i16* %29, i16* %30)
  %31 = load %struct.gsm_state*, %struct.gsm_state** %9, align 8
  %32 = getelementptr inbounds [160 x i16], [160 x i16]* %20, i32 0, i32 0
  %33 = load i16*, i16** %11, align 8
  call void @Gsm_LPC_Analysis(%struct.gsm_state* %31, i16* %32, i16* %33)
  %34 = load %struct.gsm_state*, %struct.gsm_state** %9, align 8
  %35 = load i16*, i16** %11, align 8
  %36 = getelementptr inbounds [160 x i16], [160 x i16]* %20, i32 0, i32 0
  call void @Gsm_Short_Term_Analysis_Filter(%struct.gsm_state* %34, i16* %35, i16* %36)
  store i32 0, i32* %17, align 4
  br label %37

; <label>:37:                                     ; preds = %104, %8
  %38 = load i32, i32* %17, align 4
  %39 = icmp sle i32 %38, 3
  br i1 %39, label %40, label %110

; <label>:40:                                     ; preds = %37
  %41 = load %struct.gsm_state*, %struct.gsm_state** %9, align 8
  %42 = getelementptr inbounds [160 x i16], [160 x i16]* %20, i32 0, i32 0
  %43 = load i32, i32* %17, align 4
  %44 = mul nsw i32 %43, 40
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i16, i16* %42, i64 %45
  %47 = load i16*, i16** %18, align 8
  %48 = load i16*, i16** %19, align 8
  %49 = load i16*, i16** %12, align 8
  %50 = getelementptr inbounds i16, i16* %49, i32 1
  store i16* %50, i16** %12, align 8
  %51 = load i16*, i16** %13, align 8
  %52 = getelementptr inbounds i16, i16* %51, i32 1
  store i16* %52, i16** %13, align 8
  call void @Gsm_Long_Term_Predictor(%struct.gsm_state* %41, i16* %46, i16* %47, i16* getelementptr inbounds ([50 x i16], [50 x i16]* @Gsm_Coder.e, i32 0, i64 5), i16* %48, i16* %49, i16* %51)
  %53 = load %struct.gsm_state*, %struct.gsm_state** %9, align 8
  %54 = load i16*, i16** %15, align 8
  %55 = getelementptr inbounds i16, i16* %54, i32 1
  store i16* %55, i16** %15, align 8
  %56 = load i16*, i16** %14, align 8
  %57 = getelementptr inbounds i16, i16* %56, i32 1
  store i16* %57, i16** %14, align 8
  %58 = load i16*, i16** %16, align 8
  call void @Gsm_RPE_Encoding(%struct.gsm_state* %53, i16* getelementptr inbounds ([50 x i16], [50 x i16]* @Gsm_Coder.e, i32 0, i64 5), i16* %54, i16* %56, i16* %58)
  store i32 0, i32* %21, align 4
  br label %59

; <label>:59:                                     ; preds = %96, %40
  %60 = load i32, i32* %21, align 4
  %61 = icmp sle i32 %60, 39
  br i1 %61, label %62, label %99

; <label>:62:                                     ; preds = %59
  %63 = load i32, i32* %21, align 4
  %64 = add nsw i32 5, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [50 x i16], [50 x i16]* @Gsm_Coder.e, i64 0, i64 %65
  %67 = load i16, i16* %66, align 2
  %68 = sext i16 %67 to i64
  %69 = load i16*, i16** %19, align 8
  %70 = load i32, i32* %21, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i16, i16* %69, i64 %71
  %73 = load i16, i16* %72, align 2
  %74 = sext i16 %73 to i64
  %75 = add nsw i64 %68, %74
  store i64 %75, i64* %22, align 8
  %76 = sub nsw i64 %75, -32768
  %77 = icmp ugt i64 %76, 65535
  br i1 %77, label %78, label %86

; <label>:78:                                     ; preds = %62
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_Gsm_Coder, i64 0, i64 0)
  %79 = add i64 %pgocount, 1
  store i64 %79, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_Gsm_Coder, i64 0, i64 0)
  %80 = load i64, i64* %22, align 8
  %81 = icmp sgt i64 %80, 0
  %82 = zext i1 %81 to i64
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_Gsm_Coder, i64 0, i64 4)
  %83 = add i64 %pgocount1, %82
  store i64 %83, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_Gsm_Coder, i64 0, i64 4)
  %84 = select i1 %81, i32 32767, i32 -32768
  %85 = sext i32 %84 to i64
  br label %89

; <label>:86:                                     ; preds = %62
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_Gsm_Coder, i64 0, i64 1)
  %87 = add i64 %pgocount2, 1
  store i64 %87, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_Gsm_Coder, i64 0, i64 1)
  %88 = load i64, i64* %22, align 8
  br label %89

; <label>:89:                                     ; preds = %86, %78
  %90 = phi i64 [ %85, %78 ], [ %88, %86 ]
  %91 = trunc i64 %90 to i16
  %92 = load i16*, i16** %18, align 8
  %93 = load i32, i32* %21, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i16, i16* %92, i64 %94
  store i16 %91, i16* %95, align 2
  br label %96

; <label>:96:                                     ; preds = %89
  %97 = load i32, i32* %21, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %21, align 4
  br label %59

; <label>:99:                                     ; preds = %59
  %100 = load i16*, i16** %18, align 8
  %101 = getelementptr inbounds i16, i16* %100, i64 40
  store i16* %101, i16** %18, align 8
  %102 = load i16*, i16** %19, align 8
  %103 = getelementptr inbounds i16, i16* %102, i64 40
  store i16* %103, i16** %19, align 8
  br label %104

; <label>:104:                                    ; preds = %99
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_Gsm_Coder, i64 0, i64 2)
  %105 = add i64 %pgocount3, 1
  store i64 %105, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_Gsm_Coder, i64 0, i64 2)
  %106 = load i32, i32* %17, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, i32* %17, align 4
  %108 = load i16*, i16** %16, align 8
  %109 = getelementptr inbounds i16, i16* %108, i64 13
  store i16* %109, i16** %16, align 8
  br label %37

; <label>:110:                                    ; preds = %37
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_Gsm_Coder, i64 0, i64 3)
  %111 = add i64 %pgocount4, 1
  store i64 %111, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_Gsm_Coder, i64 0, i64 3)
  %112 = load %struct.gsm_state*, %struct.gsm_state** %9, align 8
  %113 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %112, i32 0, i32 0
  %114 = getelementptr inbounds [280 x i16], [280 x i16]* %113, i32 0, i32 0
  %115 = bitcast i16* %114 to i8*
  %116 = load %struct.gsm_state*, %struct.gsm_state** %9, align 8
  %117 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %116, i32 0, i32 0
  %118 = getelementptr inbounds [280 x i16], [280 x i16]* %117, i32 0, i32 0
  %119 = getelementptr inbounds i16, i16* %118, i64 160
  %120 = bitcast i16* %119 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %115, i8* %120, i64 240, i32 1, i1 false)
  ret void
}

declare void @Gsm_Preprocess(%struct.gsm_state*, i16*, i16*) #1

declare void @Gsm_LPC_Analysis(%struct.gsm_state*, i16*, i16*) #1

declare void @Gsm_Short_Term_Analysis_Filter(%struct.gsm_state*, i16*, i16*) #1

declare void @Gsm_Long_Term_Predictor(%struct.gsm_state*, i16*, i16*, i16*, i16*, i16*, i16*) #1

declare void @Gsm_RPE_Encoding(%struct.gsm_state*, i16*, i16*, i16*, i16*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
