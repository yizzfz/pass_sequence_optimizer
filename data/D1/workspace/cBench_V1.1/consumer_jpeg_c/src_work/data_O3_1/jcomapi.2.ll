; ModuleID = 'tmp1.ll'
source_filename = "jcomapi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%struct.jpeg_error_mgr = type { {}*, void (%struct.jpeg_common_struct*, i32)*, {}*, void (%struct.jpeg_common_struct*, i8*)*, {}*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_abort = private constant [10 x i8] c"jpeg_abort"
@__profn_jpeg_destroy = private constant [12 x i8] c"jpeg_destroy"
@__profn_jpeg_alloc_quant_table = private constant [22 x i8] c"jpeg_alloc_quant_table"
@__profn_jpeg_alloc_huff_table = private constant [21 x i8] c"jpeg_alloc_huff_table"
@__profc_jpeg_abort = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_abort = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_abort = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3486699600788553525, i64 72339103152298908, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_abort, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_common_struct*)* @jpeg_abort to i8*), i8* bitcast ([1 x i64]* @__profvp_jpeg_abort to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_jpeg_destroy = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_destroy = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_destroy = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4383757993133712575, i64 281500548009730, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_destroy, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_common_struct*)* @jpeg_destroy to i8*), i8* bitcast ([1 x i64]* @__profvp_jpeg_destroy to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_jpeg_alloc_quant_table = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_alloc_quant_table = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_alloc_quant_table = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2979961158022415179, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_alloc_quant_table, i32 0, i32 0), i8* bitcast (%struct.JQUANT_TBL* (%struct.jpeg_common_struct*)* @jpeg_alloc_quant_table to i8*), i8* bitcast ([1 x i64]* @__profvp_jpeg_alloc_quant_table to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_jpeg_alloc_huff_table = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_alloc_huff_table = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_alloc_huff_table = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6295894268251147717, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_alloc_huff_table, i32 0, i32 0), i8* bitcast (%struct.JHUFF_TBL* (%struct.jpeg_common_struct*)* @jpeg_alloc_huff_table to i8*), i8* bitcast ([1 x i64]* @__profvp_jpeg_alloc_huff_table to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [70 x i8] c"D\00jpeg_abort\01jpeg_destroy\01jpeg_alloc_quant_table\01jpeg_alloc_huff_table", section "__llvm_prf_names"
@llvm.used = appending global [6 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_abort to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_destroy to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_alloc_quant_table to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_alloc_huff_table to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([70 x i8], [70 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jpeg_abort(%struct.jpeg_common_struct*) #0 {
  %2 = alloca %struct.jpeg_common_struct*, align 8
  %3 = alloca i32, align 4
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %2, align 8
  store i32 1, i32* %3, align 4
  br label %4

; <label>:4:                                      ; preds = %16, %1
  %5 = load i32, i32* %3, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %20

; <label>:7:                                      ; preds = %4
  %8 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %9 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %8, i32 0, i32 1
  %10 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %10, i32 0, i32 9
  %12 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %11, align 8
  %13 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %14 = load i32, i32* %3, align 4
  %15 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %12 to i64
  call void @__llvm_profile_instrument_target(i64 %15, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_abort to i8*), i32 0)
  call void %12(%struct.jpeg_common_struct* %13, i32 %14)
  br label %16

; <label>:16:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_abort, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_abort, i64 0, i64 0)
  %18 = load i32, i32* %3, align 4
  %19 = add nsw i32 %18, -1
  store i32 %19, i32* %3, align 4
  br label %4

; <label>:20:                                     ; preds = %4
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_abort, i64 0, i64 1)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_abort, i64 0, i64 1)
  %22 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %23 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %22, i32 0, i32 3
  %24 = load i32, i32* %23, align 8
  %25 = icmp ne i32 %24, 0
  %26 = zext i1 %25 to i64
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_abort, i64 0, i64 2)
  %27 = add i64 %pgocount2, %26
  store i64 %27, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_abort, i64 0, i64 2)
  %28 = select i1 %25, i32 200, i32 100
  %29 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %30 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %29, i32 0, i32 4
  store i32 %28, i32* %30, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_destroy(%struct.jpeg_common_struct*) #0 {
  %2 = alloca %struct.jpeg_common_struct*, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %2, align 8
  %3 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %3, i32 0, i32 1
  %5 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %4, align 8
  %6 = icmp ne %struct.jpeg_memory_mgr* %5, null
  br i1 %6, label %7, label %17

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_destroy, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_destroy, i64 0, i64 1)
  %9 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %10 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %9, i32 0, i32 1
  %11 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %11, i32 0, i32 10
  %13 = bitcast {}** %12 to void (%struct.jpeg_common_struct*)**
  %14 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %13, align 8
  %15 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %16 = ptrtoint void (%struct.jpeg_common_struct*)* %14 to i64
  call void @__llvm_profile_instrument_target(i64 %16, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_destroy to i8*), i32 0)
  call void %14(%struct.jpeg_common_struct* %15)
  br label %17

; <label>:17:                                     ; preds = %7, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_destroy, i64 0, i64 0)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_destroy, i64 0, i64 0)
  %19 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %20 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %19, i32 0, i32 1
  store %struct.jpeg_memory_mgr* null, %struct.jpeg_memory_mgr** %20, align 8
  %21 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %22 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %21, i32 0, i32 4
  store i32 0, i32* %22, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_alloc_quant_table, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_alloc_quant_table, i64 0, i64 0)
  %3 = alloca %struct.jpeg_common_struct*, align 8
  %4 = alloca %struct.JQUANT_TBL*, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %3, align 8
  %5 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %5, i32 0, i32 1
  %7 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %7, i32 0, i32 0
  %9 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %8, align 8
  %10 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %11 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %9 to i64
  call void @__llvm_profile_instrument_target(i64 %11, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_alloc_quant_table to i8*), i32 0)
  %12 = call i8* %9(%struct.jpeg_common_struct* %10, i32 0, i64 132)
  %13 = bitcast i8* %12 to %struct.JQUANT_TBL*
  store %struct.JQUANT_TBL* %13, %struct.JQUANT_TBL** %4, align 8
  %14 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %4, align 8
  %15 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %14, i32 0, i32 1
  store i32 0, i32* %15, align 4
  %16 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %4, align 8
  ret %struct.JQUANT_TBL* %16
}

; Function Attrs: noinline nounwind uwtable
define %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_alloc_huff_table, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_alloc_huff_table, i64 0, i64 0)
  %3 = alloca %struct.jpeg_common_struct*, align 8
  %4 = alloca %struct.JHUFF_TBL*, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %3, align 8
  %5 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %5, i32 0, i32 1
  %7 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %7, i32 0, i32 0
  %9 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %8, align 8
  %10 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %11 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %9 to i64
  call void @__llvm_profile_instrument_target(i64 %11, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_alloc_huff_table to i8*), i32 0)
  %12 = call i8* %9(%struct.jpeg_common_struct* %10, i32 0, i64 280)
  %13 = bitcast i8* %12 to %struct.JHUFF_TBL*
  store %struct.JHUFF_TBL* %13, %struct.JHUFF_TBL** %4, align 8
  %14 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %4, align 8
  %15 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %14, i32 0, i32 2
  store i32 0, i32* %15, align 4
  %16 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %4, align 8
  ret %struct.JHUFF_TBL* %16
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #1

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
