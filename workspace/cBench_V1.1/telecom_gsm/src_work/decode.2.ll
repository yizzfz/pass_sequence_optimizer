; ModuleID = 'tmp1.ll'
source_filename = "decode.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_Gsm_Decoder = private constant [11 x i8] c"Gsm_Decoder"
@__profn_tmp1.ll_Postprocessing = private constant [22 x i8] c"tmp1.ll:Postprocessing"
@__profc_Gsm_Decoder = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Gsm_Decoder = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4512030646838364751, i64 53929068288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_Gsm_Decoder, i32 0, i32 0), i8* bitcast (void (%struct.gsm_state*, i16*, i16*, i16*, i16*, i16*, i16*, i16*)* @Gsm_Decoder to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Postprocessing = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Postprocessing = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4071564715440708105, i64 144115255854779585, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Postprocessing, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [44 x i8] c"\22*x\DAs/\CE\8DwIM\CEOI-b,\C9-0\D4\CB\C9\B1\0A\C8/.)(\CAON-.\CE\CCK\07\00\D9\F5\0C\E3", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Gsm_Decoder to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Postprocessing to i8*), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @Gsm_Decoder(%struct.gsm_state*, i16*, i16*, i16*, i16*, i16*, i16*, i16*) #0 {
  %9 = alloca %struct.gsm_state*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca i16*, align 8
  %13 = alloca i16*, align 8
  %14 = alloca i16*, align 8
  %15 = alloca i16*, align 8
  %16 = alloca i16*, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca [40 x i16], align 16
  %20 = alloca [160 x i16], align 16
  %21 = alloca i16*, align 8
  store %struct.gsm_state* %0, %struct.gsm_state** %9, align 8
  store i16* %1, i16** %10, align 8
  store i16* %2, i16** %11, align 8
  store i16* %3, i16** %12, align 8
  store i16* %4, i16** %13, align 8
  store i16* %5, i16** %14, align 8
  store i16* %6, i16** %15, align 8
  store i16* %7, i16** %16, align 8
  %22 = load %struct.gsm_state*, %struct.gsm_state** %9, align 8
  %23 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %22, i32 0, i32 0
  %24 = getelementptr inbounds [280 x i16], [280 x i16]* %23, i32 0, i32 0
  %25 = getelementptr inbounds i16, i16* %24, i64 120
  store i16* %25, i16** %21, align 8
  store i32 0, i32* %17, align 4
  br label %26

; <label>:26:                                     ; preds = %64, %8
  %27 = load i32, i32* %17, align 4
  %28 = icmp sle i32 %27, 3
  br i1 %28, label %29, label %78

; <label>:29:                                     ; preds = %26
  %30 = load %struct.gsm_state*, %struct.gsm_state** %9, align 8
  %31 = load i16*, i16** %14, align 8
  %32 = load i16, i16* %31, align 2
  %33 = load i16*, i16** %13, align 8
  %34 = load i16, i16* %33, align 2
  %35 = load i16*, i16** %15, align 8
  %36 = getelementptr inbounds [40 x i16], [40 x i16]* %19, i32 0, i32 0
  call void @Gsm_RPE_Decoding(%struct.gsm_state* %30, i16 signext %32, i16 signext %34, i16* %35, i16* %36)
  %37 = load %struct.gsm_state*, %struct.gsm_state** %9, align 8
  %38 = load i16*, i16** %11, align 8
  %39 = load i16, i16* %38, align 2
  %40 = load i16*, i16** %12, align 8
  %41 = load i16, i16* %40, align 2
  %42 = getelementptr inbounds [40 x i16], [40 x i16]* %19, i32 0, i32 0
  %43 = load i16*, i16** %21, align 8
  call void @Gsm_Long_Term_Synthesis_Filtering(%struct.gsm_state* %37, i16 signext %39, i16 signext %41, i16* %42, i16* %43)
  store i32 0, i32* %18, align 4
  br label %44

; <label>:44:                                     ; preds = %59, %29
  %45 = load i32, i32* %18, align 4
  %46 = icmp sle i32 %45, 39
  br i1 %46, label %47, label %63

; <label>:47:                                     ; preds = %44
  %48 = load i16*, i16** %21, align 8
  %49 = load i32, i32* %18, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i16, i16* %48, i64 %50
  %52 = load i16, i16* %51, align 2
  %53 = load i32, i32* %17, align 4
  %54 = mul nsw i32 %53, 40
  %55 = load i32, i32* %18, align 4
  %56 = add nsw i32 %54, %55
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [160 x i16], [160 x i16]* %20, i64 0, i64 %57
  store i16 %52, i16* %58, align 2
  br label %59

; <label>:59:                                     ; preds = %47
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_Gsm_Decoder, i64 0, i64 0)
  %60 = add i64 %pgocount, 1
  store i64 %60, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_Gsm_Decoder, i64 0, i64 0)
  %61 = load i32, i32* %18, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %18, align 4
  br label %44

; <label>:63:                                     ; preds = %44
  br label %64

; <label>:64:                                     ; preds = %63
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_Gsm_Decoder, i64 0, i64 1)
  %65 = add i64 %pgocount1, 1
  store i64 %65, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_Gsm_Decoder, i64 0, i64 1)
  %66 = load i32, i32* %17, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %17, align 4
  %68 = load i16*, i16** %14, align 8
  %69 = getelementptr inbounds i16, i16* %68, i32 1
  store i16* %69, i16** %14, align 8
  %70 = load i16*, i16** %12, align 8
  %71 = getelementptr inbounds i16, i16* %70, i32 1
  store i16* %71, i16** %12, align 8
  %72 = load i16*, i16** %11, align 8
  %73 = getelementptr inbounds i16, i16* %72, i32 1
  store i16* %73, i16** %11, align 8
  %74 = load i16*, i16** %13, align 8
  %75 = getelementptr inbounds i16, i16* %74, i32 1
  store i16* %75, i16** %13, align 8
  %76 = load i16*, i16** %15, align 8
  %77 = getelementptr inbounds i16, i16* %76, i64 13
  store i16* %77, i16** %15, align 8
  br label %26

; <label>:78:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_Gsm_Decoder, i64 0, i64 2)
  %79 = add i64 %pgocount2, 1
  store i64 %79, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_Gsm_Decoder, i64 0, i64 2)
  %80 = load %struct.gsm_state*, %struct.gsm_state** %9, align 8
  %81 = load i16*, i16** %10, align 8
  %82 = getelementptr inbounds [160 x i16], [160 x i16]* %20, i32 0, i32 0
  %83 = load i16*, i16** %16, align 8
  call void @Gsm_Short_Term_Synthesis_Filter(%struct.gsm_state* %80, i16* %81, i16* %82, i16* %83)
  %84 = load %struct.gsm_state*, %struct.gsm_state** %9, align 8
  %85 = load i16*, i16** %16, align 8
  call void @Postprocessing(%struct.gsm_state* %84, i16* %85)
  ret void
}

declare void @Gsm_RPE_Decoding(%struct.gsm_state*, i16 signext, i16 signext, i16*, i16*) #1

declare void @Gsm_Long_Term_Synthesis_Filtering(%struct.gsm_state*, i16 signext, i16 signext, i16*, i16*) #1

declare void @Gsm_Short_Term_Synthesis_Filter(%struct.gsm_state*, i16*, i16*, i16*) #1

; Function Attrs: nounwind uwtable
define internal void @Postprocessing(%struct.gsm_state*, i16*) #0 {
  %3 = alloca %struct.gsm_state*, align 8
  %4 = alloca i16*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i16, align 2
  %7 = alloca i64, align 8
  %8 = alloca i16, align 2
  store %struct.gsm_state* %0, %struct.gsm_state** %3, align 8
  store i16* %1, i16** %4, align 8
  %9 = load %struct.gsm_state*, %struct.gsm_state** %3, align 8
  %10 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %9, i32 0, i32 9
  %11 = load i16, i16* %10, align 2
  store i16 %11, i16* %6, align 2
  store i32 160, i32* %5, align 4
  br label %12

; <label>:12:                                     ; preds = %67, %2
  %13 = load i32, i32* %5, align 4
  %14 = add nsw i32 %13, -1
  store i32 %14, i32* %5, align 4
  %15 = icmp ne i32 %13, 0
  br i1 %15, label %16, label %70

; <label>:16:                                     ; preds = %12
  %17 = load i16, i16* %6, align 2
  %18 = sext i16 %17 to i64
  %19 = mul nsw i64 %18, 28180
  %20 = add nsw i64 %19, 16384
  %21 = ashr i64 %20, 15
  %22 = trunc i64 %21 to i16
  store i16 %22, i16* %8, align 2
  %23 = load i16*, i16** %4, align 8
  %24 = load i16, i16* %23, align 2
  %25 = sext i16 %24 to i64
  %26 = load i16, i16* %8, align 2
  %27 = sext i16 %26 to i64
  %28 = add nsw i64 %25, %27
  store i64 %28, i64* %7, align 8
  %29 = sub nsw i64 %28, -32768
  %30 = icmp ugt i64 %29, 65535
  br i1 %30, label %31, label %38

; <label>:31:                                     ; preds = %16
  %32 = load i64, i64* %7, align 8
  %33 = icmp sgt i64 %32, 0
  %34 = zext i1 %33 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Postprocessing, i64 0, i64 4)
  %35 = add i64 %pgocount, %34
  store i64 %35, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Postprocessing, i64 0, i64 4)
  %36 = select i1 %33, i32 32767, i32 -32768
  %37 = sext i32 %36 to i64
  br label %41

; <label>:38:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Postprocessing, i64 0, i64 0)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Postprocessing, i64 0, i64 0)
  %40 = load i64, i64* %7, align 8
  br label %41

; <label>:41:                                     ; preds = %38, %31
  %42 = phi i64 [ %37, %31 ], [ %40, %38 ]
  %43 = trunc i64 %42 to i16
  store i16 %43, i16* %6, align 2
  %44 = load i16, i16* %6, align 2
  %45 = sext i16 %44 to i64
  %46 = load i16, i16* %6, align 2
  %47 = sext i16 %46 to i64
  %48 = add nsw i64 %45, %47
  store i64 %48, i64* %7, align 8
  %49 = sub nsw i64 %48, -32768
  %50 = icmp ugt i64 %49, 65535
  br i1 %50, label %51, label %59

; <label>:51:                                     ; preds = %41
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Postprocessing, i64 0, i64 1)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Postprocessing, i64 0, i64 1)
  %53 = load i64, i64* %7, align 8
  %54 = icmp sgt i64 %53, 0
  %55 = zext i1 %54 to i64
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Postprocessing, i64 0, i64 5)
  %56 = add i64 %pgocount3, %55
  store i64 %56, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Postprocessing, i64 0, i64 5)
  %57 = select i1 %54, i32 32767, i32 -32768
  %58 = sext i32 %57 to i64
  br label %62

; <label>:59:                                     ; preds = %41
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Postprocessing, i64 0, i64 2)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Postprocessing, i64 0, i64 2)
  %61 = load i64, i64* %7, align 8
  br label %62

; <label>:62:                                     ; preds = %59, %51
  %63 = phi i64 [ %58, %51 ], [ %61, %59 ]
  %64 = and i64 %63, 65528
  %65 = trunc i64 %64 to i16
  %66 = load i16*, i16** %4, align 8
  store i16 %65, i16* %66, align 2
  br label %67

; <label>:67:                                     ; preds = %62
  %68 = load i16*, i16** %4, align 8
  %69 = getelementptr inbounds i16, i16* %68, i32 1
  store i16* %69, i16** %4, align 8
  br label %12

; <label>:70:                                     ; preds = %12
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Postprocessing, i64 0, i64 3)
  %71 = add i64 %pgocount5, 1
  store i64 %71, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Postprocessing, i64 0, i64 3)
  %72 = load i16, i16* %6, align 2
  %73 = load %struct.gsm_state*, %struct.gsm_state** %3, align 8
  %74 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %73, i32 0, i32 9
  store i16 %72, i16* %74, align 2
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
