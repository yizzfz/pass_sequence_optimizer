; ModuleID = 'jcinit.2.ll'
source_filename = "jcinit.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_compress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_destination_mgr*, i32, i32, i32, i32, double, i32, i32, i32, %struct.jpeg_component_info*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], [16 x i8], [16 x i8], [16 x i8], i32, %struct.jpeg_scan_info*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8, i16, i16, i32, i32, i32, i32, i32, i32, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, %struct.jpeg_comp_master*, %struct.jpeg_c_main_controller*, %struct.jpeg_c_prep_controller*, %struct.jpeg_c_coef_controller*, %struct.jpeg_marker_writer*, %struct.jpeg_color_converter*, %struct.jpeg_downsampler*, %struct.jpeg_forward_dct*, %struct.jpeg_entropy_encoder* }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.jpeg_destination_mgr = type { i8*, i64, {}*, i32 (%struct.jpeg_compress_struct*)*, {}* }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_scan_info = type { i32, [4 x i32], i32, i32, i32, i32 }
%struct.jpeg_comp_master = type { {}*, {}*, {}*, i32, i32 }
%struct.jpeg_c_main_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32)* }
%struct.jpeg_c_prep_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* }
%struct.jpeg_c_coef_controller = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, i8***)* }
%struct.jpeg_marker_writer = type { void (%struct.jpeg_compress_struct*, i32, i8*, i32)*, {}*, {}*, {}*, {}*, {}* }
%struct.jpeg_color_converter = type { {}*, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* }
%struct.jpeg_downsampler = type { {}*, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)*, i32 }
%struct.jpeg_forward_dct = type { {}*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* }
%struct.jpeg_entropy_encoder = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, {}* }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_compress_master = private constant [21 x i8] c"jinit_compress_master"
@__profc_jinit_compress_master = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_compress_master = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_compress_master = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1906438956716402878, i64 844495215219964, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_compress_master, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @jinit_compress_master to i8*), i8* bitcast ([3 x i64]* @__profvp_jinit_compress_master to i8*), i32 5, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [31 x i8] c"\15\1Dx\DA\CB\CA\CC\CB,\89O\CE\CF-(J-.\8E\CFM,.I-\02\00`\BE\08\D5", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_compress_master to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jinit_compress_master(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %3 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @jinit_c_master_control(%struct.jpeg_compress_struct* %3, i32 0)
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %4, i32 0, i32 23
  %6 = load i32, i32* %5, align 8
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %13, label %8

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_compress_master, i64 0, i64 2)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_compress_master, i64 0, i64 2)
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @jinit_color_converter(%struct.jpeg_compress_struct* %10)
  %11 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @jinit_downsampler(%struct.jpeg_compress_struct* %11)
  %12 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @jinit_c_prep_controller(%struct.jpeg_compress_struct* %12, i32 0)
  br label %13

; <label>:13:                                     ; preds = %8, %1
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @jinit_forward_dct(%struct.jpeg_compress_struct* %14)
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %15, i32 0, i32 24
  %17 = load i32, i32* %16, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %33

; <label>:19:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_compress_master, i64 0, i64 0)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_compress_master, i64 0, i64 0)
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i32 0, i32 0
  %23 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %23, i32 0, i32 5
  store i32 1, i32* %24, align 8
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 0
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i32 0, i32 0
  %29 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %28, align 8
  %30 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %31 = bitcast %struct.jpeg_compress_struct* %30 to %struct.jpeg_common_struct*
  %32 = ptrtoint void (%struct.jpeg_common_struct*)* %29 to i64
  call void @__llvm_profile_instrument_target(i64 %32, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_compress_master to i8*), i32 0)
  call void %29(%struct.jpeg_common_struct* %31)
  br label %45

; <label>:33:                                     ; preds = %13
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %34, i32 0, i32 37
  %36 = load i32, i32* %35, align 4
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %41

; <label>:38:                                     ; preds = %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_compress_master, i64 0, i64 3)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_compress_master, i64 0, i64 3)
  %40 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @jinit_phuff_encoder(%struct.jpeg_compress_struct* %40)
  br label %44

; <label>:41:                                     ; preds = %33
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_compress_master, i64 0, i64 4)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_compress_master, i64 0, i64 4)
  %43 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @jinit_huff_encoder(%struct.jpeg_compress_struct* %43)
  br label %44

; <label>:44:                                     ; preds = %41, %38
  br label %45

; <label>:45:                                     ; preds = %44, %19
  %46 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %47 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %48 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %47, i32 0, i32 21
  %49 = load i32, i32* %48, align 8
  %50 = icmp sgt i32 %49, 1
  br i1 %50, label %57, label %51

; <label>:51:                                     ; preds = %45
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_compress_master, i64 0, i64 1)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_compress_master, i64 0, i64 1)
  %53 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %54 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %53, i32 0, i32 25
  %55 = load i32, i32* %54, align 8
  %56 = icmp ne i32 %55, 0
  br label %57

; <label>:57:                                     ; preds = %51, %45
  %58 = phi i1 [ true, %45 ], [ %56, %51 ]
  %59 = zext i1 %58 to i32
  call void @jinit_c_coef_controller(%struct.jpeg_compress_struct* %46, i32 %59)
  %60 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @jinit_c_main_controller(%struct.jpeg_compress_struct* %60, i32 0)
  %61 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @jinit_marker_writer(%struct.jpeg_compress_struct* %61)
  %62 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %63 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %62, i32 0, i32 1
  %64 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %63, align 8
  %65 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %64, i32 0, i32 6
  %66 = bitcast {}** %65 to void (%struct.jpeg_common_struct*)**
  %67 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %66, align 8
  %68 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %69 = bitcast %struct.jpeg_compress_struct* %68 to %struct.jpeg_common_struct*
  %70 = ptrtoint void (%struct.jpeg_common_struct*)* %67 to i64
  call void @__llvm_profile_instrument_target(i64 %70, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_compress_master to i8*), i32 1)
  call void %67(%struct.jpeg_common_struct* %69)
  %71 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %72 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %71, i32 0, i32 55
  %73 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %72, align 8
  %74 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %73, i32 0, i32 1
  %75 = bitcast {}** %74 to void (%struct.jpeg_compress_struct*)**
  %76 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %75, align 8
  %77 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %78 = ptrtoint void (%struct.jpeg_compress_struct*)* %76 to i64
  call void @__llvm_profile_instrument_target(i64 %78, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_compress_master to i8*), i32 2)
  call void %76(%struct.jpeg_compress_struct* %77)
  ret void
}

declare void @jinit_c_master_control(%struct.jpeg_compress_struct*, i32) #1

declare void @jinit_color_converter(%struct.jpeg_compress_struct*) #1

declare void @jinit_downsampler(%struct.jpeg_compress_struct*) #1

declare void @jinit_c_prep_controller(%struct.jpeg_compress_struct*, i32) #1

declare void @jinit_forward_dct(%struct.jpeg_compress_struct*) #1

declare void @jinit_phuff_encoder(%struct.jpeg_compress_struct*) #1

declare void @jinit_huff_encoder(%struct.jpeg_compress_struct*) #1

declare void @jinit_c_coef_controller(%struct.jpeg_compress_struct*, i32) #1

declare void @jinit_c_main_controller(%struct.jpeg_compress_struct*, i32) #1

declare void @jinit_marker_writer(%struct.jpeg_compress_struct*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #2

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
