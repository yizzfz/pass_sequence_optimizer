; ModuleID = 'tmp1.ll'
source_filename = "equalizer.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.equalizer = type { [2 x [32 x i32]] }
%struct.mad_frame = type { %struct.mad_header, i32, [2 x [36 x [32 x i32]]], [2 x [32 x [18 x i32]]]* }
%struct.mad_header = type { i32, i32, i32, i32, i64, i32, i16, i16, i32, i32, %struct.mad_timer_t }
%struct.mad_timer_t = type { i64, i64 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_equalizer_init = private constant [14 x i8] c"equalizer_init"
@__profn_equalizer_filter = private constant [16 x i8] c"equalizer_filter"
@__profc_equalizer_init = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_equalizer_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2344519587931042273, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_equalizer_init, i32 0, i32 0), i8* bitcast (void (%struct.equalizer*)* @equalizer_init to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_equalizer_filter = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_equalizer_filter = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5255037892960161044, i64 144115307416042851, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i32 0, i32 0), i8* bitcast (i32 (i8*, %struct.mad_frame*)* @equalizer_filter to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [33 x i8] c"\1F\1Fx\DAK-,M\CC\C9\ACJ-\8A\CF\CC\CB,aL\85s\D32sJR\8B\00\C9\8E\0C\9E", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_equalizer_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_equalizer_filter to i8*), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @equalizer_init(%struct.equalizer*) #0 {
  %2 = alloca %struct.equalizer*, align 8
  %3 = alloca i32, align 4
  store %struct.equalizer* %0, %struct.equalizer** %2, align 8
  store i32 0, i32* %3, align 4
  br label %4

; <label>:4:                                      ; preds = %20, %1
  %5 = load i32, i32* %3, align 4
  %6 = icmp slt i32 %5, 32
  br i1 %6, label %7, label %24

; <label>:7:                                      ; preds = %4
  %8 = load %struct.equalizer*, %struct.equalizer** %2, align 8
  %9 = getelementptr inbounds %struct.equalizer, %struct.equalizer* %8, i32 0, i32 0
  %10 = getelementptr inbounds [2 x [32 x i32]], [2 x [32 x i32]]* %9, i64 0, i64 1
  %11 = load i32, i32* %3, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [32 x i32], [32 x i32]* %10, i64 0, i64 %12
  store i32 268435456, i32* %13, align 4
  %14 = load %struct.equalizer*, %struct.equalizer** %2, align 8
  %15 = getelementptr inbounds %struct.equalizer, %struct.equalizer* %14, i32 0, i32 0
  %16 = getelementptr inbounds [2 x [32 x i32]], [2 x [32 x i32]]* %15, i64 0, i64 0
  %17 = load i32, i32* %3, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [32 x i32], [32 x i32]* %16, i64 0, i64 %18
  store i32 268435456, i32* %19, align 4
  br label %20

; <label>:20:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_equalizer_init, i64 0, i64 0)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_equalizer_init, i64 0, i64 0)
  %22 = load i32, i32* %3, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %3, align 4
  br label %4

; <label>:24:                                     ; preds = %4
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_equalizer_init, i64 0, i64 1)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_equalizer_init, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @equalizer_filter(i8*, %struct.mad_frame*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca %struct.mad_frame*, align 8
  %5 = alloca %struct.equalizer*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store %struct.mad_frame* %1, %struct.mad_frame** %4, align 8
  %12 = load i8*, i8** %3, align 8
  %13 = bitcast i8* %12 to %struct.equalizer*
  store %struct.equalizer* %13, %struct.equalizer** %5, align 8
  %14 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %15 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %14, i32 0, i32 0
  %16 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %15, i32 0, i32 1
  %17 = load i32, i32* %16, align 4
  %18 = icmp ne i32 %17, 0
  %19 = zext i1 %18 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i64 0, i64 7)
  %20 = add i64 %pgocount, %19
  store i64 %20, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i64 0, i64 7)
  %21 = select i1 %18, i32 2, i32 1
  store i32 %21, i32* %6, align 4
  %22 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %23 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %22, i32 0, i32 0
  %24 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %23, i32 0, i32 0
  %25 = load i32, i32* %24, align 8
  %26 = icmp eq i32 %25, 1
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i64 0, i64 4)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i64 0, i64 4)
  br label %49

; <label>:29:                                     ; preds = %2
  %30 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %31 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %30, i32 0, i32 0
  %32 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %31, i32 0, i32 0
  %33 = load i32, i32* %32, align 8
  %34 = icmp eq i32 %33, 3
  br i1 %34, label %35, label %43

; <label>:35:                                     ; preds = %29
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i64 0, i64 6)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i64 0, i64 6)
  %37 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %38 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %37, i32 0, i32 0
  %39 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %38, i32 0, i32 8
  %40 = load i32, i32* %39, align 8
  %41 = and i32 %40, 4096
  %42 = icmp ne i32 %41, 0
  br label %43

; <label>:43:                                     ; preds = %35, %29
  %44 = phi i1 [ false, %29 ], [ %42, %35 ]
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i64 0, i64 5)
  %45 = add i64 %pgocount3, 1
  store i64 %45, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i64 0, i64 5)
  %46 = zext i1 %44 to i64
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i64 0, i64 8)
  %47 = add i64 %pgocount4, %46
  store i64 %47, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i64 0, i64 8)
  %48 = select i1 %44, i32 18, i32 36
  br label %49

; <label>:49:                                     ; preds = %43, %27
  %50 = phi i32 [ 12, %27 ], [ %48, %43 ]
  store i32 %50, i32* %8, align 4
  store i32 0, i32* %10, align 4
  br label %51

; <label>:51:                                     ; preds = %121, %49
  %52 = load i32, i32* %10, align 4
  %53 = icmp ult i32 %52, 32
  br i1 %53, label %54, label %125

; <label>:54:                                     ; preds = %51
  store i32 0, i32* %7, align 4
  br label %55

; <label>:55:                                     ; preds = %117, %54
  %56 = load i32, i32* %7, align 4
  %57 = load i32, i32* %6, align 4
  %58 = icmp ult i32 %56, %57
  br i1 %58, label %59, label %120

; <label>:59:                                     ; preds = %55
  %60 = load %struct.equalizer*, %struct.equalizer** %5, align 8
  %61 = getelementptr inbounds %struct.equalizer, %struct.equalizer* %60, i32 0, i32 0
  %62 = load i32, i32* %7, align 4
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds [2 x [32 x i32]], [2 x [32 x i32]]* %61, i64 0, i64 %63
  %65 = load i32, i32* %10, align 4
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds [32 x i32], [32 x i32]* %64, i64 0, i64 %66
  %68 = load i32, i32* %67, align 4
  store i32 %68, i32* %11, align 4
  %69 = load i32, i32* %11, align 4
  %70 = icmp eq i32 %69, 268435456
  br i1 %70, label %71, label %73

; <label>:71:                                     ; preds = %59
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i64 0, i64 1)
  %72 = add i64 %pgocount5, 1
  store i64 %72, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i64 0, i64 1)
  br label %117

; <label>:73:                                     ; preds = %59
  store i32 0, i32* %9, align 4
  br label %74

; <label>:74:                                     ; preds = %111, %73
  %75 = load i32, i32* %9, align 4
  %76 = load i32, i32* %8, align 4
  %77 = icmp ult i32 %75, %76
  br i1 %77, label %78, label %115

; <label>:78:                                     ; preds = %74
  %79 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %80 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %79, i32 0, i32 2
  %81 = load i32, i32* %7, align 4
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds [2 x [36 x [32 x i32]]], [2 x [36 x [32 x i32]]]* %80, i64 0, i64 %82
  %84 = load i32, i32* %9, align 4
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds [36 x [32 x i32]], [36 x [32 x i32]]* %83, i64 0, i64 %85
  %87 = load i32, i32* %10, align 4
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds [32 x i32], [32 x i32]* %86, i64 0, i64 %88
  %90 = load i32, i32* %89, align 4
  %91 = sext i32 %90 to i64
  %92 = add nsw i64 %91, 2048
  %93 = ashr i64 %92, 12
  %94 = load i32, i32* %11, align 4
  %95 = sext i32 %94 to i64
  %96 = add nsw i64 %95, 32768
  %97 = ashr i64 %96, 16
  %98 = mul nsw i64 %93, %97
  %99 = trunc i64 %98 to i32
  %100 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %101 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %100, i32 0, i32 2
  %102 = load i32, i32* %7, align 4
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds [2 x [36 x [32 x i32]]], [2 x [36 x [32 x i32]]]* %101, i64 0, i64 %103
  %105 = load i32, i32* %9, align 4
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds [36 x [32 x i32]], [36 x [32 x i32]]* %104, i64 0, i64 %106
  %108 = load i32, i32* %10, align 4
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds [32 x i32], [32 x i32]* %107, i64 0, i64 %109
  store i32 %99, i32* %110, align 4
  br label %111

; <label>:111:                                    ; preds = %78
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i64 0, i64 0)
  %112 = add i64 %pgocount6, 1
  store i64 %112, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i64 0, i64 0)
  %113 = load i32, i32* %9, align 4
  %114 = add i32 %113, 1
  store i32 %114, i32* %9, align 4
  br label %74

; <label>:115:                                    ; preds = %74
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i64 0, i64 2)
  %116 = add i64 %pgocount7, 1
  store i64 %116, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i64 0, i64 2)
  br label %117

; <label>:117:                                    ; preds = %115, %71
  %118 = load i32, i32* %7, align 4
  %119 = add i32 %118, 1
  store i32 %119, i32* %7, align 4
  br label %55

; <label>:120:                                    ; preds = %55
  br label %121

; <label>:121:                                    ; preds = %120
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i64 0, i64 3)
  %122 = add i64 %pgocount8, 1
  store i64 %122, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_equalizer_filter, i64 0, i64 3)
  %123 = load i32, i32* %10, align 4
  %124 = add i32 %123, 1
  store i32 %124, i32* %10, align 4
  br label %51

; <label>:125:                                    ; preds = %51
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
