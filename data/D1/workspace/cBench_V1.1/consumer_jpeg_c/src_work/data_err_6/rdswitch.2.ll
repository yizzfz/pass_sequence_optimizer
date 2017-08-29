; ModuleID = 'tmp1.ll'
source_filename = "rdswitch.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.jpeg_compress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_destination_mgr*, i32, i32, i32, i32, double, i32, i32, i32, %struct.jpeg_component_info*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], [16 x i8], [16 x i8], [16 x i8], i32, %struct.jpeg_scan_info*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8, i16, i16, i32, i32, i32, i32, i32, i32, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, %struct.jpeg_comp_master*, %struct.jpeg_c_main_controller*, %struct.jpeg_c_prep_controller*, %struct.jpeg_c_coef_controller*, %struct.jpeg_marker_writer*, %struct.jpeg_color_converter*, %struct.jpeg_downsampler*, %struct.jpeg_forward_dct*, %struct.jpeg_entropy_encoder* }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.jpeg_destination_mgr = type { i8*, i64, void (%struct.jpeg_compress_struct*)*, i32 (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)* }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_scan_info = type { i32, [4 x i32], i32, i32, i32, i32 }
%struct.jpeg_comp_master = type opaque
%struct.jpeg_c_main_controller = type opaque
%struct.jpeg_c_prep_controller = type opaque
%struct.jpeg_c_coef_controller = type opaque
%struct.jpeg_marker_writer = type opaque
%struct.jpeg_color_converter = type opaque
%struct.jpeg_downsampler = type opaque
%struct.jpeg_forward_dct = type opaque
%struct.jpeg_entropy_encoder = type opaque

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [26 x i8] c"Can't open table file %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"Too many tables in file %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [31 x i8] c"Invalid table data in file %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [29 x i8] c"Non-numeric data in file %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"Can't open scan definition file %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [35 x i8] c"Too many scans defined in file %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [44 x i8] c"Too many components in one scan in file %s\0A\00", align 1
@.str.8 = private unnamed_addr constant [38 x i8] c"Invalid scan entry format in file %s\0A\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"%d%c\00", align 1
@.str.10 = private unnamed_addr constant [45 x i8] c"JPEG quantization tables are numbered 0..%d\0A\00", align 1
@.str.11 = private unnamed_addr constant [9 x i8] c"%d%c%d%c\00", align 1
@.str.12 = private unnamed_addr constant [36 x i8] c"JPEG sampling factors must be 1..4\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_read_quant_tables = private constant [17 x i8] c"read_quant_tables"
@__profn_tmp1.ll_read_text_integer = private constant [25 x i8] c"tmp1.ll:read_text_integer"
@__profn_read_scan_script = private constant [16 x i8] c"read_scan_script"
@__profn_tmp1.ll_read_scan_integer = private constant [25 x i8] c"tmp1.ll:read_scan_integer"
@__profn_set_quant_slots = private constant [15 x i8] c"set_quant_slots"
@__profn_set_sample_factors = private constant [18 x i8] c"set_sample_factors"
@__profn_tmp1.ll_text_getc = private constant [17 x i8] c"tmp1.ll:text_getc"
@__profc_read_quant_tables = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_read_quant_tables = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5739405117878713915, i64 104221861331, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_read_quant_tables, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, i8*, i32, i32)* @read_quant_tables to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_read_text_integer = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_read_text_integer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2905789843515778624, i64 87386038273, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_read_text_integer, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_read_scan_script = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_read_scan_script = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_read_scan_script = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2710367188043524282, i64 281720422480365, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, i8*)* @read_scan_script to i8*), i8* bitcast ([1 x i64]* @__profvp_read_scan_script to i8*), i32 19, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_read_scan_integer = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_read_scan_integer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7999467896135117063, i64 116669562931, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_set_quant_slots = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_set_quant_slots = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2707466221740654032, i64 129920076745, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, i8*)* @set_quant_slots to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_set_sample_factors = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_set_sample_factors = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3163069285598575574, i64 165332880696, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, i8*)* @set_sample_factors to i8*), i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_text_getc = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_text_getc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1561512469621171456, i64 55552838574, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_text_getc, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [142 x i8] c"\8B\01\00read_quant_tables\01tmp1.ll:read_text_integer\01read_scan_script\01tmp1.ll:read_scan_integer\01set_quant_slots\01set_sample_factors\01tmp1.ll:text_getc", section "__llvm_prf_names"
@llvm.used = appending global [9 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_read_quant_tables to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_text_integer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_read_scan_script to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_scan_integer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_set_quant_slots to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_set_sample_factors to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_text_getc to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([142 x i8], [142 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @read_quant_tables(%struct.jpeg_compress_struct*, i8*, i32, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.jpeg_compress_struct*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct._IO_FILE*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i64, align 8
  %15 = alloca [64 x i32], align 16
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  %16 = load i8*, i8** %7, align 8
  %17 = call %struct._IO_FILE* @fopen(i8* %16, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %17, %struct._IO_FILE** %10, align 8
  %18 = icmp eq %struct._IO_FILE* %17, null
  br i1 %18, label %19, label %24

; <label>:19:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_read_quant_tables, i64 0, i64 3)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_read_quant_tables, i64 0, i64 3)
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = load i8*, i8** %7, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i32 0, i32 0), i8* %22)
  store i32 0, i32* %5, align 4
  br label %90

; <label>:24:                                     ; preds = %4
  store i32 0, i32* %11, align 4
  br label %25

; <label>:25:                                     ; preds = %67, %24
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %27 = call i32 @read_text_integer(%struct._IO_FILE* %26, i64* %14, i32* %13)
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %76

; <label>:29:                                     ; preds = %25
  %30 = load i32, i32* %11, align 4
  %31 = icmp sge i32 %30, 4
  br i1 %31, label %32, label %39

; <label>:32:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_read_quant_tables, i64 0, i64 4)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_read_quant_tables, i64 0, i64 4)
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = load i8*, i8** %7, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i32 0, i32 0), i8* %35)
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %38 = call i32 @fclose(%struct._IO_FILE* %37)
  store i32 0, i32* %5, align 4
  br label %90

; <label>:39:                                     ; preds = %29
  %40 = load i64, i64* %14, align 8
  %41 = trunc i64 %40 to i32
  %42 = getelementptr inbounds [64 x i32], [64 x i32]* %15, i64 0, i64 0
  store i32 %41, i32* %42, align 16
  store i32 1, i32* %12, align 4
  br label %43

; <label>:43:                                     ; preds = %64, %39
  %44 = load i32, i32* %12, align 4
  %45 = icmp slt i32 %44, 64
  br i1 %45, label %46, label %67

; <label>:46:                                     ; preds = %43
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %48 = call i32 @read_text_integer(%struct._IO_FILE* %47, i64* %14, i32* %13)
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %57, label %50

; <label>:50:                                     ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_read_quant_tables, i64 0, i64 2)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_read_quant_tables, i64 0, i64 2)
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = load i8*, i8** %7, align 8
  %54 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.3, i32 0, i32 0), i8* %53)
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %56 = call i32 @fclose(%struct._IO_FILE* %55)
  store i32 0, i32* %5, align 4
  br label %90

; <label>:57:                                     ; preds = %46
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_read_quant_tables, i64 0, i64 0)
  %58 = add i64 %pgocount3, 1
  store i64 %58, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_read_quant_tables, i64 0, i64 0)
  %59 = load i64, i64* %14, align 8
  %60 = trunc i64 %59 to i32
  %61 = load i32, i32* %12, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [64 x i32], [64 x i32]* %15, i64 0, i64 %62
  store i32 %60, i32* %63, align 4
  br label %64

; <label>:64:                                     ; preds = %57
  %65 = load i32, i32* %12, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, i32* %12, align 4
  br label %43

; <label>:67:                                     ; preds = %43
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_read_quant_tables, i64 0, i64 1)
  %68 = add i64 %pgocount4, 1
  store i64 %68, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_read_quant_tables, i64 0, i64 1)
  %69 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %70 = load i32, i32* %11, align 4
  %71 = getelementptr inbounds [64 x i32], [64 x i32]* %15, i32 0, i32 0
  %72 = load i32, i32* %8, align 4
  %73 = load i32, i32* %9, align 4
  call void @jpeg_add_quant_table(%struct.jpeg_compress_struct* %69, i32 %70, i32* %71, i32 %72, i32 %73)
  %74 = load i32, i32* %11, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %11, align 4
  br label %25

; <label>:76:                                     ; preds = %25
  %77 = load i32, i32* %13, align 4
  %78 = icmp ne i32 %77, -1
  br i1 %78, label %79, label %86

; <label>:79:                                     ; preds = %76
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_read_quant_tables, i64 0, i64 5)
  %80 = add i64 %pgocount5, 1
  store i64 %80, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_read_quant_tables, i64 0, i64 5)
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %82 = load i8*, i8** %7, align 8
  %83 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %81, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.4, i32 0, i32 0), i8* %82)
  %84 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %85 = call i32 @fclose(%struct._IO_FILE* %84)
  store i32 0, i32* %5, align 4
  br label %90

; <label>:86:                                     ; preds = %76
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_read_quant_tables, i64 0, i64 6)
  %87 = add i64 %pgocount6, 1
  store i64 %87, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_read_quant_tables, i64 0, i64 6)
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %89 = call i32 @fclose(%struct._IO_FILE* %88)
  store i32 1, i32* %5, align 4
  br label %90

; <label>:90:                                     ; preds = %86, %79, %50, %32, %19
  %91 = load i32, i32* %5, align 4
  ret i32 %91
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @read_text_integer(%struct._IO_FILE*, i64*, i32*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i64*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %5, align 8
  store i64* %1, i64** %6, align 8
  store i32* %2, i32** %7, align 8
  br label %10

; <label>:10:                                     ; preds = %21, %3
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %12 = call i32 @text_getc(%struct._IO_FILE* %11)
  store i32 %12, i32* %8, align 4
  %13 = load i32, i32* %8, align 4
  %14 = icmp eq i32 %13, -1
  br i1 %14, label %15, label %19

; <label>:15:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_read_text_integer, i64 0, i64 2)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_read_text_integer, i64 0, i64 2)
  %17 = load i32, i32* %8, align 4
  %18 = load i32*, i32** %7, align 8
  store i32 %17, i32* %18, align 4
  store i32 0, i32* %4, align 4
  br label %80

; <label>:19:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_read_text_integer, i64 0, i64 0)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_read_text_integer, i64 0, i64 0)
  br label %21

; <label>:21:                                     ; preds = %19
  %22 = call i16** @__ctype_b_loc() #6
  %23 = load i16*, i16** %22, align 8
  %24 = load i32, i32* %8, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i16, i16* %23, i64 %25
  %27 = load i16, i16* %26, align 2
  %28 = zext i16 %27 to i32
  %29 = and i32 %28, 8192
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %10, label %31

; <label>:31:                                     ; preds = %21
  %32 = call i16** @__ctype_b_loc() #6
  %33 = load i16*, i16** %32, align 8
  %34 = load i32, i32* %8, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i16, i16* %33, i64 %35
  %37 = load i16, i16* %36, align 2
  %38 = zext i16 %37 to i32
  %39 = and i32 %38, 2048
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %45, label %41

; <label>:41:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_read_text_integer, i64 0, i64 3)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_read_text_integer, i64 0, i64 3)
  %43 = load i32, i32* %8, align 4
  %44 = load i32*, i32** %7, align 8
  store i32 %43, i32* %44, align 4
  store i32 0, i32* %4, align 4
  br label %80

; <label>:45:                                     ; preds = %31
  %46 = load i32, i32* %8, align 4
  %47 = sub nsw i32 %46, 48
  %48 = sext i32 %47 to i64
  store i64 %48, i64* %9, align 8
  br label %49

; <label>:49:                                     ; preds = %65, %45
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %51 = call i32 @text_getc(%struct._IO_FILE* %50)
  store i32 %51, i32* %8, align 4
  %52 = icmp ne i32 %51, -1
  br i1 %52, label %53, label %74

; <label>:53:                                     ; preds = %49
  %54 = call i16** @__ctype_b_loc() #6
  %55 = load i16*, i16** %54, align 8
  %56 = load i32, i32* %8, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i16, i16* %55, i64 %57
  %59 = load i16, i16* %58, align 2
  %60 = zext i16 %59 to i32
  %61 = and i32 %60, 2048
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %65, label %63

; <label>:63:                                     ; preds = %53
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_read_text_integer, i64 0, i64 5)
  %64 = add i64 %pgocount3, 1
  store i64 %64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_read_text_integer, i64 0, i64 5)
  br label %74

; <label>:65:                                     ; preds = %53
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_read_text_integer, i64 0, i64 1)
  %66 = add i64 %pgocount4, 1
  store i64 %66, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_read_text_integer, i64 0, i64 1)
  %67 = load i64, i64* %9, align 8
  %68 = mul nsw i64 %67, 10
  store i64 %68, i64* %9, align 8
  %69 = load i32, i32* %8, align 4
  %70 = sub nsw i32 %69, 48
  %71 = sext i32 %70 to i64
  %72 = load i64, i64* %9, align 8
  %73 = add nsw i64 %72, %71
  store i64 %73, i64* %9, align 8
  br label %49

; <label>:74:                                     ; preds = %63, %49
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_read_text_integer, i64 0, i64 4)
  %75 = add i64 %pgocount5, 1
  store i64 %75, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_read_text_integer, i64 0, i64 4)
  %76 = load i64, i64* %9, align 8
  %77 = load i64*, i64** %6, align 8
  store i64 %76, i64* %77, align 8
  %78 = load i32, i32* %8, align 4
  %79 = load i32*, i32** %7, align 8
  store i32 %78, i32* %79, align 4
  store i32 1, i32* %4, align 4
  br label %80

; <label>:80:                                     ; preds = %74, %41, %15
  %81 = load i32, i32* %4, align 4
  ret i32 %81
}

declare i32 @fclose(%struct._IO_FILE*) #1

declare void @jpeg_add_quant_table(%struct.jpeg_compress_struct*, i32, i32*, i32, i32) #1

; Function Attrs: noinline nounwind uwtable
define i32 @read_scan_script(%struct.jpeg_compress_struct*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  %11 = alloca %struct.jpeg_scan_info*, align 8
  %12 = alloca [100 x %struct.jpeg_scan_info], align 16
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store i8* %1, i8** %5, align 8
  %13 = load i8*, i8** %5, align 8
  %14 = call %struct._IO_FILE* @fopen(i8* %13, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %14, %struct._IO_FILE** %6, align 8
  %15 = icmp eq %struct._IO_FILE* %14, null
  br i1 %15, label %16, label %21

; <label>:16:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 1)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 1)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = load i8*, i8** %5, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i32 0, i32 0), i8* %19)
  store i32 0, i32* %3, align 4
  br label %208

; <label>:21:                                     ; preds = %2
  %22 = getelementptr inbounds [100 x %struct.jpeg_scan_info], [100 x %struct.jpeg_scan_info]* %12, i32 0, i32 0
  store %struct.jpeg_scan_info* %22, %struct.jpeg_scan_info** %11, align 8
  store i32 0, i32* %7, align 4
  br label %23

; <label>:23:                                     ; preds = %158, %21
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %25 = call i32 @read_scan_integer(%struct._IO_FILE* %24, i64* %10, i32* %9)
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %163

; <label>:27:                                     ; preds = %23
  %28 = load i32, i32* %7, align 4
  %29 = icmp sge i32 %28, 100
  br i1 %29, label %30, label %37

; <label>:30:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 10)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 10)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = load i8*, i8** %5, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.6, i32 0, i32 0), i8* %33)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %36 = call i32 @fclose(%struct._IO_FILE* %35)
  store i32 0, i32* %3, align 4
  br label %208

; <label>:37:                                     ; preds = %27
  %38 = load i64, i64* %10, align 8
  %39 = trunc i64 %38 to i32
  %40 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %11, align 8
  %41 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %40, i32 0, i32 1
  %42 = getelementptr inbounds [4 x i32], [4 x i32]* %41, i64 0, i64 0
  store i32 %39, i32* %42, align 4
  store i32 1, i32* %8, align 4
  br label %43

; <label>:43:                                     ; preds = %62, %37
  %44 = load i32, i32* %9, align 4
  %45 = icmp eq i32 %44, 32
  br i1 %45, label %46, label %73

; <label>:46:                                     ; preds = %43
  %47 = load i32, i32* %8, align 4
  %48 = icmp sge i32 %47, 4
  br i1 %48, label %49, label %56

; <label>:49:                                     ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 2)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 2)
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = load i8*, i8** %5, align 8
  %53 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.7, i32 0, i32 0), i8* %52)
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %55 = call i32 @fclose(%struct._IO_FILE* %54)
  store i32 0, i32* %3, align 4
  br label %208

; <label>:56:                                     ; preds = %46
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %58 = call i32 @read_scan_integer(%struct._IO_FILE* %57, i64* %10, i32* %9)
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %62, label %60

; <label>:60:                                     ; preds = %56
  %pgocount3 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 3)
  %61 = add i64 %pgocount3, 1
  store i64 %61, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 3)
  br label %152

; <label>:62:                                     ; preds = %56
  %pgocount4 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 0)
  %63 = add i64 %pgocount4, 1
  store i64 %63, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 0)
  %64 = load i64, i64* %10, align 8
  %65 = trunc i64 %64 to i32
  %66 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %11, align 8
  %67 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %66, i32 0, i32 1
  %68 = load i32, i32* %8, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [4 x i32], [4 x i32]* %67, i64 0, i64 %69
  store i32 %65, i32* %70, align 4
  %71 = load i32, i32* %8, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %8, align 4
  br label %43

; <label>:73:                                     ; preds = %43
  %74 = load i32, i32* %8, align 4
  %75 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %11, align 8
  %76 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %75, i32 0, i32 0
  store i32 %74, i32* %76, align 4
  %77 = load i32, i32* %9, align 4
  %78 = icmp eq i32 %77, 58
  br i1 %78, label %79, label %133

; <label>:79:                                     ; preds = %73
  %80 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %81 = call i32 @read_scan_integer(%struct._IO_FILE* %80, i64* %10, i32* %9)
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %83, label %87

; <label>:83:                                     ; preds = %79
  %pgocount5 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 5)
  %84 = add i64 %pgocount5, 1
  store i64 %84, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 5)
  %85 = load i32, i32* %9, align 4
  %86 = icmp ne i32 %85, 32
  br i1 %86, label %87, label %89

; <label>:87:                                     ; preds = %83, %79
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 13)
  %88 = add i64 %pgocount6, 1
  store i64 %88, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 13)
  br label %152

; <label>:89:                                     ; preds = %83
  %90 = load i64, i64* %10, align 8
  %91 = trunc i64 %90 to i32
  %92 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %11, align 8
  %93 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %92, i32 0, i32 2
  store i32 %91, i32* %93, align 4
  %94 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %95 = call i32 @read_scan_integer(%struct._IO_FILE* %94, i64* %10, i32* %9)
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %101

; <label>:97:                                     ; preds = %89
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 6)
  %98 = add i64 %pgocount7, 1
  store i64 %98, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 6)
  %99 = load i32, i32* %9, align 4
  %100 = icmp ne i32 %99, 32
  br i1 %100, label %101, label %103

; <label>:101:                                    ; preds = %97, %89
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 14)
  %102 = add i64 %pgocount8, 1
  store i64 %102, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 14)
  br label %152

; <label>:103:                                    ; preds = %97
  %104 = load i64, i64* %10, align 8
  %105 = trunc i64 %104 to i32
  %106 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %11, align 8
  %107 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %106, i32 0, i32 3
  store i32 %105, i32* %107, align 4
  %108 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %109 = call i32 @read_scan_integer(%struct._IO_FILE* %108, i64* %10, i32* %9)
  %110 = icmp ne i32 %109, 0
  br i1 %110, label %111, label %115

; <label>:111:                                    ; preds = %103
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 8)
  %112 = add i64 %pgocount9, 1
  store i64 %112, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 8)
  %113 = load i32, i32* %9, align 4
  %114 = icmp ne i32 %113, 32
  br i1 %114, label %115, label %117

; <label>:115:                                    ; preds = %111, %103
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 15)
  %116 = add i64 %pgocount10, 1
  store i64 %116, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 15)
  br label %152

; <label>:117:                                    ; preds = %111
  %118 = load i64, i64* %10, align 8
  %119 = trunc i64 %118 to i32
  %120 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %11, align 8
  %121 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %120, i32 0, i32 4
  store i32 %119, i32* %121, align 4
  %122 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %123 = call i32 @read_scan_integer(%struct._IO_FILE* %122, i64* %10, i32* %9)
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %127, label %125

; <label>:125:                                    ; preds = %117
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 18)
  %126 = add i64 %pgocount11, 1
  store i64 %126, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 18)
  br label %152

; <label>:127:                                    ; preds = %117
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 9)
  %128 = add i64 %pgocount12, 1
  store i64 %128, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 9)
  %129 = load i64, i64* %10, align 8
  %130 = trunc i64 %129 to i32
  %131 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %11, align 8
  %132 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %131, i32 0, i32 5
  store i32 %130, i32* %132, align 4
  br label %143

; <label>:133:                                    ; preds = %73
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 4)
  %134 = add i64 %pgocount13, 1
  store i64 %134, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 4)
  %135 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %11, align 8
  %136 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %135, i32 0, i32 2
  store i32 0, i32* %136, align 4
  %137 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %11, align 8
  %138 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %137, i32 0, i32 3
  store i32 63, i32* %138, align 4
  %139 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %11, align 8
  %140 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %139, i32 0, i32 4
  store i32 0, i32* %140, align 4
  %141 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %11, align 8
  %142 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %141, i32 0, i32 5
  store i32 0, i32* %142, align 4
  br label %143

; <label>:143:                                    ; preds = %133, %127
  %144 = load i32, i32* %9, align 4
  %145 = icmp ne i32 %144, 59
  br i1 %145, label %146, label %158

; <label>:146:                                    ; preds = %143
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 7)
  %147 = add i64 %pgocount14, 1
  store i64 %147, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 7)
  %148 = load i32, i32* %9, align 4
  %149 = icmp ne i32 %148, -1
  br i1 %149, label %150, label %158

; <label>:150:                                    ; preds = %146
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 17)
  %151 = add i64 %pgocount15, 1
  store i64 %151, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 17)
  br label %152

; <label>:152:                                    ; preds = %150, %125, %115, %101, %87, %60
  %153 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %154 = load i8*, i8** %5, align 8
  %155 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %153, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.8, i32 0, i32 0), i8* %154)
  %156 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %157 = call i32 @fclose(%struct._IO_FILE* %156)
  store i32 0, i32* %3, align 4
  br label %208

; <label>:158:                                    ; preds = %146, %143
  %159 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %11, align 8
  %160 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %159, i32 1
  store %struct.jpeg_scan_info* %160, %struct.jpeg_scan_info** %11, align 8
  %161 = load i32, i32* %7, align 4
  %162 = add nsw i32 %161, 1
  store i32 %162, i32* %7, align 4
  br label %23

; <label>:163:                                    ; preds = %23
  %164 = load i32, i32* %9, align 4
  %165 = icmp ne i32 %164, -1
  br i1 %165, label %166, label %173

; <label>:166:                                    ; preds = %163
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 11)
  %167 = add i64 %pgocount16, 1
  store i64 %167, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 11)
  %168 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %169 = load i8*, i8** %5, align 8
  %170 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %168, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.4, i32 0, i32 0), i8* %169)
  %171 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %172 = call i32 @fclose(%struct._IO_FILE* %171)
  store i32 0, i32* %3, align 4
  br label %208

; <label>:173:                                    ; preds = %163
  %174 = load i32, i32* %7, align 4
  %175 = icmp sgt i32 %174, 0
  br i1 %175, label %176, label %204

; <label>:176:                                    ; preds = %173
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 16)
  %177 = add i64 %pgocount17, 1
  store i64 %177, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 16)
  %178 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %179 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %178, i32 0, i32 1
  %180 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %179, align 8
  %181 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %180, i32 0, i32 0
  %182 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %181, align 8
  %183 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %184 = bitcast %struct.jpeg_compress_struct* %183 to %struct.jpeg_common_struct*
  %185 = load i32, i32* %7, align 4
  %186 = sext i32 %185 to i64
  %187 = mul i64 %186, 36
  %188 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %182 to i64
  call void @__llvm_profile_instrument_target(i64 %188, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_read_scan_script to i8*), i32 0)
  %189 = call i8* %182(%struct.jpeg_common_struct* %184, i32 1, i64 %187)
  %190 = bitcast i8* %189 to %struct.jpeg_scan_info*
  store %struct.jpeg_scan_info* %190, %struct.jpeg_scan_info** %11, align 8
  %191 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %11, align 8
  %192 = bitcast %struct.jpeg_scan_info* %191 to i8*
  %193 = getelementptr inbounds [100 x %struct.jpeg_scan_info], [100 x %struct.jpeg_scan_info]* %12, i32 0, i32 0
  %194 = bitcast %struct.jpeg_scan_info* %193 to i8*
  %195 = load i32, i32* %7, align 4
  %196 = sext i32 %195 to i64
  %197 = mul i64 %196, 36
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %192, i8* %194, i64 %197, i32 1, i1 false)
  %198 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %11, align 8
  %199 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %200 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %199, i32 0, i32 22
  store %struct.jpeg_scan_info* %198, %struct.jpeg_scan_info** %200, align 8
  %201 = load i32, i32* %7, align 4
  %202 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %203 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %202, i32 0, i32 21
  store i32 %201, i32* %203, align 8
  br label %204

; <label>:204:                                    ; preds = %176, %173
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 12)
  %205 = add i64 %pgocount18, 1
  store i64 %205, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_read_scan_script, i64 0, i64 12)
  %206 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %207 = call i32 @fclose(%struct._IO_FILE* %206)
  store i32 1, i32* %3, align 4
  br label %208

; <label>:208:                                    ; preds = %204, %166, %152, %49, %30, %16
  %209 = load i32, i32* %3, align 4
  ret i32 %209
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @read_scan_integer(%struct._IO_FILE*, i64*, i32*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i64*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %5, align 8
  store i64* %1, i64** %6, align 8
  store i32* %2, i32** %7, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %10 = load i64*, i64** %6, align 8
  %11 = load i32*, i32** %7, align 8
  %12 = call i32 @read_text_integer(%struct._IO_FILE* %9, i64* %10, i32* %11)
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %16, label %14

; <label>:14:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i64 0, i64 2)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i64 0, i64 2)
  store i32 0, i32* %4, align 4
  br label %76

; <label>:16:                                     ; preds = %3
  %17 = load i32*, i32** %7, align 8
  %18 = load i32, i32* %17, align 4
  store i32 %18, i32* %8, align 4
  br label %19

; <label>:19:                                     ; preds = %35, %16
  %20 = load i32, i32* %8, align 4
  %21 = icmp ne i32 %20, -1
  br i1 %21, label %22, label %33

; <label>:22:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i64 0, i64 1)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i64 0, i64 1)
  %24 = call i16** @__ctype_b_loc() #6
  %25 = load i16*, i16** %24, align 8
  %26 = load i32, i32* %8, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i16, i16* %25, i64 %27
  %29 = load i16, i16* %28, align 2
  %30 = zext i16 %29 to i32
  %31 = and i32 %30, 8192
  %32 = icmp ne i32 %31, 0
  br label %33

; <label>:33:                                     ; preds = %22, %19
  %34 = phi i1 [ false, %19 ], [ %32, %22 ]
  br i1 %34, label %35, label %39

; <label>:35:                                     ; preds = %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i64 0, i64 0)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i64 0, i64 0)
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %38 = call i32 @text_getc(%struct._IO_FILE* %37)
  store i32 %38, i32* %8, align 4
  br label %19

; <label>:39:                                     ; preds = %33
  %40 = call i16** @__ctype_b_loc() #6
  %41 = load i16*, i16** %40, align 8
  %42 = load i32, i32* %8, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i16, i16* %41, i64 %43
  %45 = load i16, i16* %44, align 2
  %46 = zext i16 %45 to i32
  %47 = and i32 %46, 2048
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %58

; <label>:49:                                     ; preds = %39
  %50 = load i32, i32* %8, align 4
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %52 = call i32 @ungetc(i32 %50, %struct._IO_FILE* %51)
  %53 = icmp eq i32 %52, -1
  br i1 %53, label %54, label %56

; <label>:54:                                     ; preds = %49
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i64 0, i64 6)
  %55 = add i64 %pgocount3, 1
  store i64 %55, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i64 0, i64 6)
  store i32 0, i32* %4, align 4
  br label %76

; <label>:56:                                     ; preds = %49
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i64 0, i64 4)
  %57 = add i64 %pgocount4, 1
  store i64 %57, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i64 0, i64 4)
  store i32 32, i32* %8, align 4
  br label %73

; <label>:58:                                     ; preds = %39
  %59 = load i32, i32* %8, align 4
  %60 = icmp ne i32 %59, -1
  br i1 %60, label %61, label %71

; <label>:61:                                     ; preds = %58
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i64 0, i64 5)
  %62 = add i64 %pgocount5, 1
  store i64 %62, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i64 0, i64 5)
  %63 = load i32, i32* %8, align 4
  %64 = icmp ne i32 %63, 59
  br i1 %64, label %65, label %71

; <label>:65:                                     ; preds = %61
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i64 0, i64 7)
  %66 = add i64 %pgocount6, 1
  store i64 %66, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i64 0, i64 7)
  %67 = load i32, i32* %8, align 4
  %68 = icmp ne i32 %67, 58
  br i1 %68, label %69, label %71

; <label>:69:                                     ; preds = %65
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i64 0, i64 8)
  %70 = add i64 %pgocount7, 1
  store i64 %70, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i64 0, i64 8)
  store i32 32, i32* %8, align 4
  br label %71

; <label>:71:                                     ; preds = %69, %65, %61, %58
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i64 0, i64 3)
  %72 = add i64 %pgocount8, 1
  store i64 %72, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_read_scan_integer, i64 0, i64 3)
  br label %73

; <label>:73:                                     ; preds = %71, %56
  %74 = load i32, i32* %8, align 4
  %75 = load i32*, i32** %7, align 8
  store i32 %74, i32* %75, align 4
  store i32 1, i32* %4, align 4
  br label %76

; <label>:76:                                     ; preds = %73, %54, %14
  %77 = load i32, i32* %4, align 4
  ret i32 %77
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noinline nounwind uwtable
define i32 @set_quant_slots(%struct.jpeg_compress_struct*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8, align 1
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 0, i32* %6, align 4
  store i32 0, i32* %7, align 4
  br label %9

; <label>:9:                                      ; preds = %77, %2
  %10 = load i32, i32* %7, align 4
  %11 = icmp slt i32 %10, 10
  br i1 %11, label %12, label %80

; <label>:12:                                     ; preds = %9
  %13 = load i8*, i8** %5, align 8
  %14 = load i8, i8* %13, align 1
  %15 = icmp ne i8 %14, 0
  br i1 %15, label %16, label %66

; <label>:16:                                     ; preds = %12
  store i8 44, i8* %8, align 1
  %17 = load i8*, i8** %5, align 8
  %18 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i32* %6, i8* %8) #5
  %19 = icmp slt i32 %18, 1
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %16
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i64 0, i64 7)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i64 0, i64 7)
  store i32 0, i32* %3, align 4
  br label %82

; <label>:22:                                     ; preds = %16
  %23 = load i8, i8* %8, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp ne i32 %24, 44
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i64 0, i64 8)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i64 0, i64 8)
  store i32 0, i32* %3, align 4
  br label %82

; <label>:28:                                     ; preds = %22
  %29 = load i32, i32* %6, align 4
  %30 = icmp slt i32 %29, 0
  br i1 %30, label %35, label %31

; <label>:31:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i64 0, i64 2)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i64 0, i64 2)
  %33 = load i32, i32* %6, align 4
  %34 = icmp sge i32 %33, 4
  br i1 %34, label %35, label %39

; <label>:35:                                     ; preds = %31, %28
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i64 0, i64 5)
  %36 = add i64 %pgocount3, 1
  store i64 %36, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i64 0, i64 5)
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.10, i32 0, i32 0), i32 3)
  store i32 0, i32* %3, align 4
  br label %82

; <label>:39:                                     ; preds = %31
  %40 = load i32, i32* %6, align 4
  %41 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %41, i32 0, i32 14
  %43 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %42, align 8
  %44 = load i32, i32* %7, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %43, i64 %45
  %47 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %46, i32 0, i32 4
  store i32 %40, i32* %47, align 8
  br label %48

; <label>:48:                                     ; preds = %62, %39
  %49 = load i8*, i8** %5, align 8
  %50 = load i8, i8* %49, align 1
  %51 = sext i8 %50 to i32
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %60

; <label>:53:                                     ; preds = %48
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i64 0, i64 1)
  %54 = add i64 %pgocount4, 1
  store i64 %54, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i64 0, i64 1)
  %55 = load i8*, i8** %5, align 8
  %56 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %56, i8** %5, align 8
  %57 = load i8, i8* %55, align 1
  %58 = sext i8 %57 to i32
  %59 = icmp ne i32 %58, 44
  br label %60

; <label>:60:                                     ; preds = %53, %48
  %61 = phi i1 [ false, %48 ], [ %59, %53 ]
  br i1 %61, label %62, label %64

; <label>:62:                                     ; preds = %60
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i64 0, i64 0)
  %63 = add i64 %pgocount5, 1
  store i64 %63, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i64 0, i64 0)
  br label %48

; <label>:64:                                     ; preds = %60
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i64 0, i64 3)
  %65 = add i64 %pgocount6, 1
  store i64 %65, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i64 0, i64 3)
  br label %76

; <label>:66:                                     ; preds = %12
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i64 0, i64 4)
  %67 = add i64 %pgocount7, 1
  store i64 %67, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i64 0, i64 4)
  %68 = load i32, i32* %6, align 4
  %69 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %70 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %69, i32 0, i32 14
  %71 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %70, align 8
  %72 = load i32, i32* %7, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %71, i64 %73
  %75 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %74, i32 0, i32 4
  store i32 %68, i32* %75, align 8
  br label %76

; <label>:76:                                     ; preds = %66, %64
  br label %77

; <label>:77:                                     ; preds = %76
  %78 = load i32, i32* %7, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, i32* %7, align 4
  br label %9

; <label>:80:                                     ; preds = %9
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i64 0, i64 6)
  %81 = add i64 %pgocount8, 1
  store i64 %81, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_set_quant_slots, i64 0, i64 6)
  store i32 1, i32* %3, align 4
  br label %82

; <label>:82:                                     ; preds = %80, %35, %26, %20
  %83 = load i32, i32* %3, align 4
  ret i32 %83
}

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #3

; Function Attrs: noinline nounwind uwtable
define i32 @set_sample_factors(%struct.jpeg_compress_struct*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8, align 1
  %10 = alloca i8, align 1
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 0, i32* %6, align 4
  br label %11

; <label>:11:                                     ; preds = %111, %2
  %12 = load i32, i32* %6, align 4
  %13 = icmp slt i32 %12, 10
  br i1 %13, label %14, label %114

; <label>:14:                                     ; preds = %11
  %15 = load i8*, i8** %5, align 8
  %16 = load i8, i8* %15, align 1
  %17 = icmp ne i8 %16, 0
  br i1 %17, label %18, label %94

; <label>:18:                                     ; preds = %14
  store i8 44, i8* %10, align 1
  %19 = load i8*, i8** %5, align 8
  %20 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %19, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.11, i32 0, i32 0), i32* %7, i8* %9, i32* %8, i8* %10) #5
  %21 = icmp slt i32 %20, 3
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 12)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 12)
  store i32 0, i32* %3, align 4
  br label %116

; <label>:24:                                     ; preds = %18
  %25 = load i8, i8* %9, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp ne i32 %26, 120
  br i1 %27, label %28, label %34

; <label>:28:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 8)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 8)
  %30 = load i8, i8* %9, align 1
  %31 = sext i8 %30 to i32
  %32 = icmp ne i32 %31, 88
  br i1 %32, label %._crit_edge, label %34

._crit_edge:                                      ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 2)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 2)
  br label %38

; <label>:34:                                     ; preds = %28, %24
  %35 = load i8, i8* %10, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp ne i32 %36, 44
  br i1 %37, label %38, label %40

; <label>:38:                                     ; preds = %._crit_edge, %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 11)
  %39 = add i64 %pgocount3, 1
  store i64 %39, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 11)
  store i32 0, i32* %3, align 4
  br label %116

; <label>:40:                                     ; preds = %34
  %41 = load i32, i32* %7, align 4
  %42 = icmp sle i32 %41, 0
  br i1 %42, label %55, label %43

; <label>:43:                                     ; preds = %40
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 3)
  %44 = add i64 %pgocount4, 1
  store i64 %44, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 3)
  %45 = load i32, i32* %7, align 4
  %46 = icmp sgt i32 %45, 4
  br i1 %46, label %55, label %47

; <label>:47:                                     ; preds = %43
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 4)
  %48 = add i64 %pgocount5, 1
  store i64 %48, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 4)
  %49 = load i32, i32* %8, align 4
  %50 = icmp sle i32 %49, 0
  br i1 %50, label %55, label %51

; <label>:51:                                     ; preds = %47
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 5)
  %52 = add i64 %pgocount6, 1
  store i64 %52, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 5)
  %53 = load i32, i32* %8, align 4
  %54 = icmp sgt i32 %53, 4
  br i1 %54, label %55, label %59

; <label>:55:                                     ; preds = %51, %47, %43, %40
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 9)
  %56 = add i64 %pgocount7, 1
  store i64 %56, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 9)
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %58 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.12, i32 0, i32 0))
  store i32 0, i32* %3, align 4
  br label %116

; <label>:59:                                     ; preds = %51
  %60 = load i32, i32* %7, align 4
  %61 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %62 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %61, i32 0, i32 14
  %63 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %62, align 8
  %64 = load i32, i32* %6, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %63, i64 %65
  %67 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %66, i32 0, i32 2
  store i32 %60, i32* %67, align 8
  %68 = load i32, i32* %8, align 4
  %69 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %70 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %69, i32 0, i32 14
  %71 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %70, align 8
  %72 = load i32, i32* %6, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %71, i64 %73
  %75 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %74, i32 0, i32 3
  store i32 %68, i32* %75, align 4
  br label %76

; <label>:76:                                     ; preds = %90, %59
  %77 = load i8*, i8** %5, align 8
  %78 = load i8, i8* %77, align 1
  %79 = sext i8 %78 to i32
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %81, label %88

; <label>:81:                                     ; preds = %76
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 1)
  %82 = add i64 %pgocount8, 1
  store i64 %82, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 1)
  %83 = load i8*, i8** %5, align 8
  %84 = getelementptr inbounds i8, i8* %83, i32 1
  store i8* %84, i8** %5, align 8
  %85 = load i8, i8* %83, align 1
  %86 = sext i8 %85 to i32
  %87 = icmp ne i32 %86, 44
  br label %88

; <label>:88:                                     ; preds = %81, %76
  %89 = phi i1 [ false, %76 ], [ %87, %81 ]
  br i1 %89, label %90, label %92

; <label>:90:                                     ; preds = %88
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 0)
  %91 = add i64 %pgocount9, 1
  store i64 %91, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 0)
  br label %76

; <label>:92:                                     ; preds = %88
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 6)
  %93 = add i64 %pgocount10, 1
  store i64 %93, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 6)
  br label %110

; <label>:94:                                     ; preds = %14
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 7)
  %95 = add i64 %pgocount11, 1
  store i64 %95, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 7)
  %96 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %97 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %96, i32 0, i32 14
  %98 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %97, align 8
  %99 = load i32, i32* %6, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %98, i64 %100
  %102 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %101, i32 0, i32 2
  store i32 1, i32* %102, align 8
  %103 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %104 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %103, i32 0, i32 14
  %105 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %104, align 8
  %106 = load i32, i32* %6, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %105, i64 %107
  %109 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %108, i32 0, i32 3
  store i32 1, i32* %109, align 4
  br label %110

; <label>:110:                                    ; preds = %94, %92
  br label %111

; <label>:111:                                    ; preds = %110
  %112 = load i32, i32* %6, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, i32* %6, align 4
  br label %11

; <label>:114:                                    ; preds = %11
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 10)
  %115 = add i64 %pgocount12, 1
  store i64 %115, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_set_sample_factors, i64 0, i64 10)
  store i32 1, i32* %3, align 4
  br label %116

; <label>:116:                                    ; preds = %114, %55, %38, %22
  %117 = load i32, i32* %3, align 4
  ret i32 %117
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @text_getc(%struct._IO_FILE*) #0 {
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %5 = call i32 @_IO_getc(%struct._IO_FILE* %4)
  store i32 %5, i32* %3, align 4
  %6 = load i32, i32* %3, align 4
  %7 = icmp eq i32 %6, 35
  br i1 %7, label %8, label %24

; <label>:8:                                      ; preds = %1
  br label %9

; <label>:9:                                      ; preds = %20, %8
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_text_getc, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_text_getc, i64 0, i64 0)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %12 = call i32 @_IO_getc(%struct._IO_FILE* %11)
  store i32 %12, i32* %3, align 4
  br label %13

; <label>:13:                                     ; preds = %9
  %14 = load i32, i32* %3, align 4
  %15 = icmp ne i32 %14, 10
  br i1 %15, label %16, label %20

; <label>:16:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_text_getc, i64 0, i64 1)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_text_getc, i64 0, i64 1)
  %18 = load i32, i32* %3, align 4
  %19 = icmp ne i32 %18, -1
  br label %20

; <label>:20:                                     ; preds = %16, %13
  %21 = phi i1 [ false, %13 ], [ %19, %16 ]
  br i1 %21, label %9, label %22

; <label>:22:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_text_getc, i64 0, i64 3)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_text_getc, i64 0, i64 3)
  br label %24

; <label>:24:                                     ; preds = %22, %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_text_getc, i64 0, i64 2)
  %25 = add i64 %pgocount3, 1
  store i64 %25, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_text_getc, i64 0, i64 2)
  %26 = load i32, i32* %3, align 4
  ret i32 %26
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #4

declare i32 @_IO_getc(%struct._IO_FILE*) #1

declare i32 @ungetc(i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #5

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
