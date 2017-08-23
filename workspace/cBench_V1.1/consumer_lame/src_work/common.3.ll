; ModuleID = 'common.2.ll'
source_filename = "common.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.parameter = type { i32, i32, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.frame = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }

$__llvm_profile_raw_version = comdat any

@param = global %struct.parameter { i32 1, i32 1, i32 0, i32 0 }, align 4
@tabsel_123 = global [2 x [3 x [16 x i32]]] [[3 x [16 x i32]] [[16 x i32] [i32 0, i32 32, i32 64, i32 96, i32 128, i32 160, i32 192, i32 224, i32 256, i32 288, i32 320, i32 352, i32 384, i32 416, i32 448, i32 0], [16 x i32] [i32 0, i32 32, i32 48, i32 56, i32 64, i32 80, i32 96, i32 112, i32 128, i32 160, i32 192, i32 224, i32 256, i32 320, i32 384, i32 0], [16 x i32] [i32 0, i32 32, i32 40, i32 48, i32 56, i32 64, i32 80, i32 96, i32 112, i32 128, i32 160, i32 192, i32 224, i32 256, i32 320, i32 0]], [3 x [16 x i32]] [[16 x i32] [i32 0, i32 32, i32 48, i32 56, i32 64, i32 80, i32 96, i32 112, i32 128, i32 144, i32 160, i32 176, i32 192, i32 224, i32 256, i32 0], [16 x i32] [i32 0, i32 8, i32 16, i32 24, i32 32, i32 40, i32 48, i32 56, i32 64, i32 80, i32 96, i32 112, i32 128, i32 144, i32 160, i32 0], [16 x i32] [i32 0, i32 8, i32 16, i32 24, i32 32, i32 40, i32 48, i32 56, i32 64, i32 80, i32 96, i32 112, i32 128, i32 144, i32 160, i32 0]]], align 16
@freqs = global [9 x i64] [i64 44100, i64 48000, i64 32000, i64 22050, i64 24000, i64 16000, i64 11025, i64 12000, i64 8000], align 16
@pcm_point = global i32 0, align 4
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [14 x i8] c"Stream error\0A\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"Free format not supported.\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"layer=1 Not supported!\0A\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"layer=2 Not supported!\0A\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"Sorry, unknown layer type.\0A\00", align 1
@print_header.modes = internal global [4 x i8*] [i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.8, i32 0, i32 0)], align 16
@.str.5 = private unnamed_addr constant [7 x i8] c"Stereo\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"Joint-Stereo\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"Dual-Channel\00", align 1
@.str.8 = private unnamed_addr constant [15 x i8] c"Single-Channel\00", align 1
@print_header.layers = internal global [4 x i8*] [i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0)], align 16
@.str.9 = private unnamed_addr constant [8 x i8] c"Unknown\00", align 1
@.str.10 = private unnamed_addr constant [2 x i8] c"I\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"II\00", align 1
@.str.12 = private unnamed_addr constant [4 x i8] c"III\00", align 1
@.str.13 = private unnamed_addr constant [63 x i8] c"MPEG %s, Layer: %s, Freq: %ld, mode: %s, modext: %d, BPF : %d\0A\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"2.5\00", align 1
@.str.15 = private unnamed_addr constant [4 x i8] c"2.0\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c"1.0\00", align 1
@.str.17 = private unnamed_addr constant [67 x i8] c"Channels: %d, copyright: %s, original: %s, CRC: %s, emphasis: %d.\0A\00", align 1
@.str.18 = private unnamed_addr constant [4 x i8] c"Yes\00", align 1
@.str.19 = private unnamed_addr constant [3 x i8] c"No\00", align 1
@.str.20 = private unnamed_addr constant [42 x i8] c"Bitrate: %d Kbits/s, Extension value: %d\0A\00", align 1
@print_header_compact.modes = internal global [4 x i8*] [i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0)], align 16
@.str.21 = private unnamed_addr constant [7 x i8] c"stereo\00", align 1
@.str.22 = private unnamed_addr constant [13 x i8] c"joint-stereo\00", align 1
@.str.23 = private unnamed_addr constant [13 x i8] c"dual-channel\00", align 1
@.str.24 = private unnamed_addr constant [5 x i8] c"mono\00", align 1
@print_header_compact.layers = internal global [4 x i8*] [i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0)], align 16
@.str.25 = private unnamed_addr constant [40 x i8] c"MPEG %s layer %s, %d kbit/s, %ld Hz %s\0A\00", align 1
@wordpointer = common global i8* null, align 8
@bitindex = common global i32 0, align 4
@pcm_sample = common global i8* null, align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_decode_header = private constant [13 x i8] c"decode_header"
@__profn_print_header = private constant [12 x i8] c"print_header"
@__profn_print_header_compact = private constant [20 x i8] c"print_header_compact"
@__profn_getbits = private constant [7 x i8] c"getbits"
@__profn_getbits_fast = private constant [12 x i8] c"getbits_fast"
@__profc_decode_header = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_decode_header = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8467201263958447820, i64 144115311189894773, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i32 0, i32 0), i8* bitcast (i32 (%struct.frame*, i64)* @decode_header to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_print_header = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_print_header = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3725207701342665436, i64 288230405819259540, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_print_header, i32 0, i32 0), i8* bitcast (void (%struct.frame*)* @print_header to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_print_header_compact = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_print_header_compact = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -211214864390906077, i64 72057623705475732, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_print_header_compact, i32 0, i32 0), i8* bitcast (void (%struct.frame*)* @print_header_compact to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_getbits = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_getbits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8795259939998040218, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_getbits, i32 0, i32 0), i8* bitcast (i32 (i32)* @getbits to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_getbits_fast = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_getbits_fast = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6504525649548415473, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_getbits_fast, i32 0, i32 0), i8* bitcast (i32 (i32)* @getbits_fast to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [53 x i8] c"D3x\DAKIM\CEOI\8D\CFHMLI-b,(\CA\CC+\C1\C6\89O\CE\CF-HL.aLO-I\CA,)\86\D1\F1i\89\C5%\00\88\0D\1AR", section "__llvm_prf_names"
@llvm.used = appending global [6 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_decode_header to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_print_header to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_print_header_compact to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_getbits to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_getbits_fast to i8*), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @decode_header(%struct.frame*, i64) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.frame*, align 8
  %5 = alloca i64, align 8
  store %struct.frame* %0, %struct.frame** %4, align 8
  store i64 %1, i64* %5, align 8
  %6 = load i64, i64* %5, align 8
  %7 = and i64 %6, 1048576
  %8 = icmp ne i64 %7, 0
  br i1 %8, label %9, label %20

; <label>:9:                                      ; preds = %2
  %10 = load i64, i64* %5, align 8
  %11 = and i64 %10, 524288
  %12 = icmp ne i64 %11, 0
  %13 = zext i1 %12 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 9)
  %14 = add i64 %pgocount, %13
  store i64 %14, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 9)
  %15 = select i1 %12, i32 0, i32 1
  %16 = load %struct.frame*, %struct.frame** %4, align 8
  %17 = getelementptr inbounds %struct.frame, %struct.frame* %16, i32 0, i32 3
  store i32 %15, i32* %17, align 4
  %18 = load %struct.frame*, %struct.frame** %4, align 8
  %19 = getelementptr inbounds %struct.frame, %struct.frame* %18, i32 0, i32 4
  store i32 0, i32* %19, align 4
  br label %26

; <label>:20:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 1)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 1)
  %22 = load %struct.frame*, %struct.frame** %4, align 8
  %23 = getelementptr inbounds %struct.frame, %struct.frame* %22, i32 0, i32 3
  store i32 1, i32* %23, align 4
  %24 = load %struct.frame*, %struct.frame** %4, align 8
  %25 = getelementptr inbounds %struct.frame, %struct.frame* %24, i32 0, i32 4
  store i32 1, i32* %25, align 4
  br label %26

; <label>:26:                                     ; preds = %20, %9
  %27 = load i64, i64* %5, align 8
  %28 = lshr i64 %27, 17
  %29 = and i64 %28, 3
  %30 = sub i64 4, %29
  %31 = trunc i64 %30 to i32
  %32 = load %struct.frame*, %struct.frame** %4, align 8
  %33 = getelementptr inbounds %struct.frame, %struct.frame* %32, i32 0, i32 6
  store i32 %31, i32* %33, align 4
  %34 = load i64, i64* %5, align 8
  %35 = lshr i64 %34, 10
  %36 = and i64 %35, 3
  %37 = icmp eq i64 %36, 3
  br i1 %37, label %38, label %42

; <label>:38:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 8)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 8)
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 1) #4
  unreachable

; <label>:42:                                     ; preds = %26
  %43 = load %struct.frame*, %struct.frame** %4, align 8
  %44 = getelementptr inbounds %struct.frame, %struct.frame* %43, i32 0, i32 4
  %45 = load i32, i32* %44, align 4
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %55

; <label>:47:                                     ; preds = %42
  %48 = load i64, i64* %5, align 8
  %49 = lshr i64 %48, 10
  %50 = and i64 %49, 3
  %51 = add i64 6, %50
  %52 = trunc i64 %51 to i32
  %53 = load %struct.frame*, %struct.frame** %4, align 8
  %54 = getelementptr inbounds %struct.frame, %struct.frame* %53, i32 0, i32 9
  store i32 %52, i32* %54, align 4
  br label %69

; <label>:55:                                     ; preds = %42
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 2)
  %56 = add i64 %pgocount3, 1
  store i64 %56, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 2)
  %57 = load i64, i64* %5, align 8
  %58 = lshr i64 %57, 10
  %59 = and i64 %58, 3
  %60 = load %struct.frame*, %struct.frame** %4, align 8
  %61 = getelementptr inbounds %struct.frame, %struct.frame* %60, i32 0, i32 3
  %62 = load i32, i32* %61, align 4
  %63 = mul nsw i32 %62, 3
  %64 = sext i32 %63 to i64
  %65 = add i64 %59, %64
  %66 = trunc i64 %65 to i32
  %67 = load %struct.frame*, %struct.frame** %4, align 8
  %68 = getelementptr inbounds %struct.frame, %struct.frame* %67, i32 0, i32 9
  store i32 %66, i32* %68, align 4
  br label %69

; <label>:69:                                     ; preds = %55, %47
  %70 = load i64, i64* %5, align 8
  %71 = lshr i64 %70, 16
  %72 = and i64 %71, 1
  %73 = xor i64 %72, 1
  %74 = trunc i64 %73 to i32
  %75 = load %struct.frame*, %struct.frame** %4, align 8
  %76 = getelementptr inbounds %struct.frame, %struct.frame* %75, i32 0, i32 7
  store i32 %74, i32* %76, align 4
  %77 = load %struct.frame*, %struct.frame** %4, align 8
  %78 = getelementptr inbounds %struct.frame, %struct.frame* %77, i32 0, i32 4
  %79 = load i32, i32* %78, align 4
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %81, label %89

; <label>:81:                                     ; preds = %69
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 0)
  %82 = add i64 %pgocount4, 1
  store i64 %82, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 0)
  %83 = load i64, i64* %5, align 8
  %84 = lshr i64 %83, 12
  %85 = and i64 %84, 15
  %86 = trunc i64 %85 to i32
  %87 = load %struct.frame*, %struct.frame** %4, align 8
  %88 = getelementptr inbounds %struct.frame, %struct.frame* %87, i32 0, i32 8
  store i32 %86, i32* %88, align 4
  br label %89

; <label>:89:                                     ; preds = %81, %69
  %90 = load i64, i64* %5, align 8
  %91 = lshr i64 %90, 12
  %92 = and i64 %91, 15
  %93 = trunc i64 %92 to i32
  %94 = load %struct.frame*, %struct.frame** %4, align 8
  %95 = getelementptr inbounds %struct.frame, %struct.frame* %94, i32 0, i32 8
  store i32 %93, i32* %95, align 4
  %96 = load i64, i64* %5, align 8
  %97 = lshr i64 %96, 9
  %98 = and i64 %97, 1
  %99 = trunc i64 %98 to i32
  %100 = load %struct.frame*, %struct.frame** %4, align 8
  %101 = getelementptr inbounds %struct.frame, %struct.frame* %100, i32 0, i32 10
  store i32 %99, i32* %101, align 4
  %102 = load i64, i64* %5, align 8
  %103 = lshr i64 %102, 8
  %104 = and i64 %103, 1
  %105 = trunc i64 %104 to i32
  %106 = load %struct.frame*, %struct.frame** %4, align 8
  %107 = getelementptr inbounds %struct.frame, %struct.frame* %106, i32 0, i32 11
  store i32 %105, i32* %107, align 4
  %108 = load i64, i64* %5, align 8
  %109 = lshr i64 %108, 6
  %110 = and i64 %109, 3
  %111 = trunc i64 %110 to i32
  %112 = load %struct.frame*, %struct.frame** %4, align 8
  %113 = getelementptr inbounds %struct.frame, %struct.frame* %112, i32 0, i32 12
  store i32 %111, i32* %113, align 4
  %114 = load i64, i64* %5, align 8
  %115 = lshr i64 %114, 4
  %116 = and i64 %115, 3
  %117 = trunc i64 %116 to i32
  %118 = load %struct.frame*, %struct.frame** %4, align 8
  %119 = getelementptr inbounds %struct.frame, %struct.frame* %118, i32 0, i32 13
  store i32 %117, i32* %119, align 4
  %120 = load i64, i64* %5, align 8
  %121 = lshr i64 %120, 3
  %122 = and i64 %121, 1
  %123 = trunc i64 %122 to i32
  %124 = load %struct.frame*, %struct.frame** %4, align 8
  %125 = getelementptr inbounds %struct.frame, %struct.frame* %124, i32 0, i32 14
  store i32 %123, i32* %125, align 4
  %126 = load i64, i64* %5, align 8
  %127 = lshr i64 %126, 2
  %128 = and i64 %127, 1
  %129 = trunc i64 %128 to i32
  %130 = load %struct.frame*, %struct.frame** %4, align 8
  %131 = getelementptr inbounds %struct.frame, %struct.frame* %130, i32 0, i32 15
  store i32 %129, i32* %131, align 4
  %132 = load i64, i64* %5, align 8
  %133 = and i64 %132, 3
  %134 = trunc i64 %133 to i32
  %135 = load %struct.frame*, %struct.frame** %4, align 8
  %136 = getelementptr inbounds %struct.frame, %struct.frame* %135, i32 0, i32 16
  store i32 %134, i32* %136, align 4
  %137 = load %struct.frame*, %struct.frame** %4, align 8
  %138 = getelementptr inbounds %struct.frame, %struct.frame* %137, i32 0, i32 12
  %139 = load i32, i32* %138, align 4
  %140 = icmp eq i32 %139, 3
  %141 = zext i1 %140 to i64
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 10)
  %142 = add i64 %pgocount5, %141
  store i64 %142, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 10)
  %143 = select i1 %140, i32 1, i32 2
  %144 = load %struct.frame*, %struct.frame** %4, align 8
  %145 = getelementptr inbounds %struct.frame, %struct.frame* %144, i32 0, i32 0
  store i32 %143, i32* %145, align 4
  %146 = load %struct.frame*, %struct.frame** %4, align 8
  %147 = getelementptr inbounds %struct.frame, %struct.frame* %146, i32 0, i32 8
  %148 = load i32, i32* %147, align 4
  %149 = icmp ne i32 %148, 0
  br i1 %149, label %154, label %150

; <label>:150:                                    ; preds = %89
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 3)
  %151 = add i64 %pgocount6, 1
  store i64 %151, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 3)
  %152 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %153 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %152, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i32 0, i32 0))
  store i32 0, i32* %3, align 4
  br label %217

; <label>:154:                                    ; preds = %89
  %155 = load %struct.frame*, %struct.frame** %4, align 8
  %156 = getelementptr inbounds %struct.frame, %struct.frame* %155, i32 0, i32 6
  %157 = load i32, i32* %156, align 4
  switch i32 %157, label %212 [
    i32 1, label %158
    i32 2, label %162
    i32 3, label %166
  ]

; <label>:158:                                    ; preds = %154
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 4)
  %159 = add i64 %pgocount7, 1
  store i64 %159, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 4)
  %160 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %161 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %160, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i32 0, i32 0))
  br label %216

; <label>:162:                                    ; preds = %154
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 5)
  %163 = add i64 %pgocount8, 1
  store i64 %163, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 5)
  %164 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %165 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %164, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.3, i32 0, i32 0))
  br label %216

; <label>:166:                                    ; preds = %154
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 6)
  %167 = add i64 %pgocount9, 1
  store i64 %167, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 6)
  %168 = load %struct.frame*, %struct.frame** %4, align 8
  %169 = getelementptr inbounds %struct.frame, %struct.frame* %168, i32 0, i32 3
  %170 = load i32, i32* %169, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [2 x [3 x [16 x i32]]], [2 x [3 x [16 x i32]]]* @tabsel_123, i64 0, i64 %171
  %173 = getelementptr inbounds [3 x [16 x i32]], [3 x [16 x i32]]* %172, i64 0, i64 2
  %174 = load %struct.frame*, %struct.frame** %4, align 8
  %175 = getelementptr inbounds %struct.frame, %struct.frame* %174, i32 0, i32 8
  %176 = load i32, i32* %175, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [16 x i32], [16 x i32]* %173, i64 0, i64 %177
  %179 = load i32, i32* %178, align 4
  %180 = sext i32 %179 to i64
  %181 = mul nsw i64 %180, 144000
  %182 = trunc i64 %181 to i32
  %183 = load %struct.frame*, %struct.frame** %4, align 8
  %184 = getelementptr inbounds %struct.frame, %struct.frame* %183, i32 0, i32 17
  store i32 %182, i32* %184, align 4
  %185 = load %struct.frame*, %struct.frame** %4, align 8
  %186 = getelementptr inbounds %struct.frame, %struct.frame* %185, i32 0, i32 9
  %187 = load i32, i32* %186, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [9 x i64], [9 x i64]* @freqs, i64 0, i64 %188
  %190 = load i64, i64* %189, align 8
  %191 = load %struct.frame*, %struct.frame** %4, align 8
  %192 = getelementptr inbounds %struct.frame, %struct.frame* %191, i32 0, i32 3
  %193 = load i32, i32* %192, align 4
  %194 = zext i32 %193 to i64
  %195 = shl i64 %190, %194
  %196 = load %struct.frame*, %struct.frame** %4, align 8
  %197 = getelementptr inbounds %struct.frame, %struct.frame* %196, i32 0, i32 17
  %198 = load i32, i32* %197, align 4
  %199 = sext i32 %198 to i64
  %200 = sdiv i64 %199, %195
  %201 = trunc i64 %200 to i32
  store i32 %201, i32* %197, align 4
  %202 = load %struct.frame*, %struct.frame** %4, align 8
  %203 = getelementptr inbounds %struct.frame, %struct.frame* %202, i32 0, i32 17
  %204 = load i32, i32* %203, align 4
  %205 = load %struct.frame*, %struct.frame** %4, align 8
  %206 = getelementptr inbounds %struct.frame, %struct.frame* %205, i32 0, i32 10
  %207 = load i32, i32* %206, align 4
  %208 = add nsw i32 %204, %207
  %209 = sub nsw i32 %208, 4
  %210 = load %struct.frame*, %struct.frame** %4, align 8
  %211 = getelementptr inbounds %struct.frame, %struct.frame* %210, i32 0, i32 17
  store i32 %209, i32* %211, align 4
  br label %216

; <label>:212:                                    ; preds = %154
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 7)
  %213 = add i64 %pgocount10, 1
  store i64 %213, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decode_header, i64 0, i64 7)
  %214 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %215 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %214, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i32 0, i32 0))
  store i32 0, i32* %3, align 4
  br label %217

; <label>:216:                                    ; preds = %166, %162, %158
  store i32 1, i32* %3, align 4
  br label %217

; <label>:217:                                    ; preds = %216, %212, %150
  %218 = load i32, i32* %3, align 4
  ret i32 %218
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind uwtable
define void @print_header(%struct.frame*) #0 {
  %2 = alloca %struct.frame*, align 8
  store %struct.frame* %0, %struct.frame** %2, align 8
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = load %struct.frame*, %struct.frame** %2, align 8
  %5 = getelementptr inbounds %struct.frame, %struct.frame* %4, i32 0, i32 4
  %6 = load i32, i32* %5, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_print_header, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_print_header, i64 0, i64 0)
  br label %19

; <label>:10:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_print_header, i64 0, i64 1)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_print_header, i64 0, i64 1)
  %12 = load %struct.frame*, %struct.frame** %2, align 8
  %13 = getelementptr inbounds %struct.frame, %struct.frame* %12, i32 0, i32 3
  %14 = load i32, i32* %13, align 4
  %15 = icmp ne i32 %14, 0
  %16 = zext i1 %15 to i64
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_print_header, i64 0, i64 2)
  %17 = add i64 %pgocount2, %16
  store i64 %17, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_print_header, i64 0, i64 2)
  %18 = select i1 %15, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i32 0, i32 0)
  br label %19

; <label>:19:                                     ; preds = %10, %8
  %20 = phi i8* [ getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), %8 ], [ %18, %10 ]
  %21 = load %struct.frame*, %struct.frame** %2, align 8
  %22 = getelementptr inbounds %struct.frame, %struct.frame* %21, i32 0, i32 6
  %23 = load i32, i32* %22, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [4 x i8*], [4 x i8*]* @print_header.layers, i64 0, i64 %24
  %26 = load i8*, i8** %25, align 8
  %27 = load %struct.frame*, %struct.frame** %2, align 8
  %28 = getelementptr inbounds %struct.frame, %struct.frame* %27, i32 0, i32 9
  %29 = load i32, i32* %28, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [9 x i64], [9 x i64]* @freqs, i64 0, i64 %30
  %32 = load i64, i64* %31, align 8
  %33 = load %struct.frame*, %struct.frame** %2, align 8
  %34 = getelementptr inbounds %struct.frame, %struct.frame* %33, i32 0, i32 12
  %35 = load i32, i32* %34, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [4 x i8*], [4 x i8*]* @print_header.modes, i64 0, i64 %36
  %38 = load i8*, i8** %37, align 8
  %39 = load %struct.frame*, %struct.frame** %2, align 8
  %40 = getelementptr inbounds %struct.frame, %struct.frame* %39, i32 0, i32 13
  %41 = load i32, i32* %40, align 4
  %42 = load %struct.frame*, %struct.frame** %2, align 8
  %43 = getelementptr inbounds %struct.frame, %struct.frame* %42, i32 0, i32 17
  %44 = load i32, i32* %43, align 4
  %45 = add nsw i32 %44, 4
  %46 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.13, i32 0, i32 0), i8* %20, i8* %26, i64 %32, i8* %38, i32 %41, i32 %45)
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %48 = load %struct.frame*, %struct.frame** %2, align 8
  %49 = getelementptr inbounds %struct.frame, %struct.frame* %48, i32 0, i32 0
  %50 = load i32, i32* %49, align 4
  %51 = load %struct.frame*, %struct.frame** %2, align 8
  %52 = getelementptr inbounds %struct.frame, %struct.frame* %51, i32 0, i32 14
  %53 = load i32, i32* %52, align 4
  %54 = icmp ne i32 %53, 0
  %55 = zext i1 %54 to i64
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_print_header, i64 0, i64 3)
  %56 = add i64 %pgocount3, %55
  store i64 %56, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_print_header, i64 0, i64 3)
  %57 = select i1 %54, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i32 0, i32 0)
  %58 = load %struct.frame*, %struct.frame** %2, align 8
  %59 = getelementptr inbounds %struct.frame, %struct.frame* %58, i32 0, i32 15
  %60 = load i32, i32* %59, align 4
  %61 = icmp ne i32 %60, 0
  %62 = zext i1 %61 to i64
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_print_header, i64 0, i64 4)
  %63 = add i64 %pgocount4, %62
  store i64 %63, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_print_header, i64 0, i64 4)
  %64 = select i1 %61, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i32 0, i32 0)
  %65 = load %struct.frame*, %struct.frame** %2, align 8
  %66 = getelementptr inbounds %struct.frame, %struct.frame* %65, i32 0, i32 7
  %67 = load i32, i32* %66, align 4
  %68 = icmp ne i32 %67, 0
  %69 = zext i1 %68 to i64
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_print_header, i64 0, i64 5)
  %70 = add i64 %pgocount5, %69
  store i64 %70, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_print_header, i64 0, i64 5)
  %71 = select i1 %68, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i32 0, i32 0)
  %72 = load %struct.frame*, %struct.frame** %2, align 8
  %73 = getelementptr inbounds %struct.frame, %struct.frame* %72, i32 0, i32 16
  %74 = load i32, i32* %73, align 4
  %75 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.17, i32 0, i32 0), i32 %50, i8* %57, i8* %64, i8* %71, i32 %74)
  %76 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %77 = load %struct.frame*, %struct.frame** %2, align 8
  %78 = getelementptr inbounds %struct.frame, %struct.frame* %77, i32 0, i32 3
  %79 = load i32, i32* %78, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [2 x [3 x [16 x i32]]], [2 x [3 x [16 x i32]]]* @tabsel_123, i64 0, i64 %80
  %82 = load %struct.frame*, %struct.frame** %2, align 8
  %83 = getelementptr inbounds %struct.frame, %struct.frame* %82, i32 0, i32 6
  %84 = load i32, i32* %83, align 4
  %85 = sub nsw i32 %84, 1
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [3 x [16 x i32]], [3 x [16 x i32]]* %81, i64 0, i64 %86
  %88 = load %struct.frame*, %struct.frame** %2, align 8
  %89 = getelementptr inbounds %struct.frame, %struct.frame* %88, i32 0, i32 8
  %90 = load i32, i32* %89, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [16 x i32], [16 x i32]* %87, i64 0, i64 %91
  %93 = load i32, i32* %92, align 4
  %94 = load %struct.frame*, %struct.frame** %2, align 8
  %95 = getelementptr inbounds %struct.frame, %struct.frame* %94, i32 0, i32 11
  %96 = load i32, i32* %95, align 4
  %97 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %76, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.20, i32 0, i32 0), i32 %93, i32 %96)
  ret void
}

; Function Attrs: nounwind uwtable
define void @print_header_compact(%struct.frame*) #0 {
  %2 = alloca %struct.frame*, align 8
  store %struct.frame* %0, %struct.frame** %2, align 8
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = load %struct.frame*, %struct.frame** %2, align 8
  %5 = getelementptr inbounds %struct.frame, %struct.frame* %4, i32 0, i32 4
  %6 = load i32, i32* %5, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_print_header_compact, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_print_header_compact, i64 0, i64 0)
  br label %19

; <label>:10:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_print_header_compact, i64 0, i64 1)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_print_header_compact, i64 0, i64 1)
  %12 = load %struct.frame*, %struct.frame** %2, align 8
  %13 = getelementptr inbounds %struct.frame, %struct.frame* %12, i32 0, i32 3
  %14 = load i32, i32* %13, align 4
  %15 = icmp ne i32 %14, 0
  %16 = zext i1 %15 to i64
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_print_header_compact, i64 0, i64 2)
  %17 = add i64 %pgocount2, %16
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_print_header_compact, i64 0, i64 2)
  %18 = select i1 %15, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i32 0, i32 0)
  br label %19

; <label>:19:                                     ; preds = %10, %8
  %20 = phi i8* [ getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), %8 ], [ %18, %10 ]
  %21 = load %struct.frame*, %struct.frame** %2, align 8
  %22 = getelementptr inbounds %struct.frame, %struct.frame* %21, i32 0, i32 6
  %23 = load i32, i32* %22, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [4 x i8*], [4 x i8*]* @print_header_compact.layers, i64 0, i64 %24
  %26 = load i8*, i8** %25, align 8
  %27 = load %struct.frame*, %struct.frame** %2, align 8
  %28 = getelementptr inbounds %struct.frame, %struct.frame* %27, i32 0, i32 3
  %29 = load i32, i32* %28, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [2 x [3 x [16 x i32]]], [2 x [3 x [16 x i32]]]* @tabsel_123, i64 0, i64 %30
  %32 = load %struct.frame*, %struct.frame** %2, align 8
  %33 = getelementptr inbounds %struct.frame, %struct.frame* %32, i32 0, i32 6
  %34 = load i32, i32* %33, align 4
  %35 = sub nsw i32 %34, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [3 x [16 x i32]], [3 x [16 x i32]]* %31, i64 0, i64 %36
  %38 = load %struct.frame*, %struct.frame** %2, align 8
  %39 = getelementptr inbounds %struct.frame, %struct.frame* %38, i32 0, i32 8
  %40 = load i32, i32* %39, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [16 x i32], [16 x i32]* %37, i64 0, i64 %41
  %43 = load i32, i32* %42, align 4
  %44 = load %struct.frame*, %struct.frame** %2, align 8
  %45 = getelementptr inbounds %struct.frame, %struct.frame* %44, i32 0, i32 9
  %46 = load i32, i32* %45, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [9 x i64], [9 x i64]* @freqs, i64 0, i64 %47
  %49 = load i64, i64* %48, align 8
  %50 = load %struct.frame*, %struct.frame** %2, align 8
  %51 = getelementptr inbounds %struct.frame, %struct.frame* %50, i32 0, i32 12
  %52 = load i32, i32* %51, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [4 x i8*], [4 x i8*]* @print_header_compact.modes, i64 0, i64 %53
  %55 = load i8*, i8** %54, align 8
  %56 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.25, i32 0, i32 0), i8* %20, i8* %26, i32 %43, i64 %49, i8* %55)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @getbits(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  store i32 %0, i32* %3, align 4
  %5 = load i32, i32* %3, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %9, label %7

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_getbits, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_getbits, i64 0, i64 1)
  store i32 0, i32* %2, align 4
  br label %54

; <label>:9:                                      ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_getbits, i64 0, i64 0)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_getbits, i64 0, i64 0)
  %11 = load i8*, i8** @wordpointer, align 8
  %12 = getelementptr inbounds i8, i8* %11, i64 0
  %13 = load i8, i8* %12, align 1
  %14 = zext i8 %13 to i64
  store i64 %14, i64* %4, align 8
  %15 = load i64, i64* %4, align 8
  %16 = shl i64 %15, 8
  store i64 %16, i64* %4, align 8
  %17 = load i8*, i8** @wordpointer, align 8
  %18 = getelementptr inbounds i8, i8* %17, i64 1
  %19 = load i8, i8* %18, align 1
  %20 = zext i8 %19 to i64
  %21 = load i64, i64* %4, align 8
  %22 = or i64 %21, %20
  store i64 %22, i64* %4, align 8
  %23 = load i64, i64* %4, align 8
  %24 = shl i64 %23, 8
  store i64 %24, i64* %4, align 8
  %25 = load i8*, i8** @wordpointer, align 8
  %26 = getelementptr inbounds i8, i8* %25, i64 2
  %27 = load i8, i8* %26, align 1
  %28 = zext i8 %27 to i64
  %29 = load i64, i64* %4, align 8
  %30 = or i64 %29, %28
  store i64 %30, i64* %4, align 8
  %31 = load i32, i32* @bitindex, align 4
  %32 = load i64, i64* %4, align 8
  %33 = zext i32 %31 to i64
  %34 = shl i64 %32, %33
  store i64 %34, i64* %4, align 8
  %35 = load i64, i64* %4, align 8
  %36 = and i64 %35, 16777215
  store i64 %36, i64* %4, align 8
  %37 = load i32, i32* %3, align 4
  %38 = load i32, i32* @bitindex, align 4
  %39 = add nsw i32 %38, %37
  store i32 %39, i32* @bitindex, align 4
  %40 = load i32, i32* %3, align 4
  %41 = sub nsw i32 24, %40
  %42 = load i64, i64* %4, align 8
  %43 = zext i32 %41 to i64
  %44 = lshr i64 %42, %43
  store i64 %44, i64* %4, align 8
  %45 = load i32, i32* @bitindex, align 4
  %46 = ashr i32 %45, 3
  %47 = load i8*, i8** @wordpointer, align 8
  %48 = sext i32 %46 to i64
  %49 = getelementptr inbounds i8, i8* %47, i64 %48
  store i8* %49, i8** @wordpointer, align 8
  %50 = load i32, i32* @bitindex, align 4
  %51 = and i32 %50, 7
  store i32 %51, i32* @bitindex, align 4
  %52 = load i64, i64* %4, align 8
  %53 = trunc i64 %52 to i32
  store i32 %53, i32* %2, align 4
  br label %54

; <label>:54:                                     ; preds = %9, %7
  %55 = load i32, i32* %2, align 4
  ret i32 %55
}

; Function Attrs: nounwind uwtable
define i32 @getbits_fast(i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_getbits_fast, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_getbits_fast, i64 0, i64 0)
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  store i32 %0, i32* %3, align 4
  %5 = load i8*, i8** @wordpointer, align 8
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = load i8, i8* %6, align 1
  %8 = zext i8 %7 to i64
  store i64 %8, i64* %4, align 8
  %9 = load i64, i64* %4, align 8
  %10 = shl i64 %9, 8
  store i64 %10, i64* %4, align 8
  %11 = load i8*, i8** @wordpointer, align 8
  %12 = getelementptr inbounds i8, i8* %11, i64 1
  %13 = load i8, i8* %12, align 1
  %14 = zext i8 %13 to i64
  %15 = load i64, i64* %4, align 8
  %16 = or i64 %15, %14
  store i64 %16, i64* %4, align 8
  %17 = load i32, i32* @bitindex, align 4
  %18 = load i64, i64* %4, align 8
  %19 = zext i32 %17 to i64
  %20 = shl i64 %18, %19
  store i64 %20, i64* %4, align 8
  %21 = load i64, i64* %4, align 8
  %22 = and i64 %21, 65535
  store i64 %22, i64* %4, align 8
  %23 = load i32, i32* %3, align 4
  %24 = load i32, i32* @bitindex, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, i32* @bitindex, align 4
  %26 = load i32, i32* %3, align 4
  %27 = sub nsw i32 16, %26
  %28 = load i64, i64* %4, align 8
  %29 = zext i32 %27 to i64
  %30 = lshr i64 %28, %29
  store i64 %30, i64* %4, align 8
  %31 = load i32, i32* @bitindex, align 4
  %32 = ashr i32 %31, 3
  %33 = load i8*, i8** @wordpointer, align 8
  %34 = sext i32 %32 to i64
  %35 = getelementptr inbounds i8, i8* %33, i64 %34
  store i8* %35, i8** @wordpointer, align 8
  %36 = load i32, i32* @bitindex, align 4
  %37 = and i32 %36, 7
  store i32 %37, i32* @bitindex, align 4
  %38 = load i64, i64* %4, align 8
  %39 = trunc i64 %38 to i32
  ret i32 %39
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
