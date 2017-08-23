; ModuleID = 'tmp1.ll'
source_filename = "util.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%union.anon = type { i64 }
%struct.bit_stream_struc = type { i8*, i32, %struct._IO_FILE*, i8*, i32, i64, i32, i32 }

$__llvm_profile_raw_version = comdat any

@s_freq_table = global [2 x [4 x double]] [[4 x double] [double 2.205000e+01, double 2.400000e+01, double 1.600000e+01, double 0.000000e+00], [4 x double] [double 4.410000e+01, double 4.800000e+01, double 3.200000e+01, double 0.000000e+00]], align 16
@bitrate_table = global [2 x [15 x i32]] [[15 x i32] [i32 0, i32 8, i32 16, i32 24, i32 32, i32 40, i32 48, i32 56, i32 64, i32 80, i32 96, i32 112, i32 128, i32 144, i32 160], [15 x i32] [i32 0, i32 32, i32 40, i32 48, i32 56, i32 64, i32 80, i32 96, i32 112, i32 128, i32 160, i32 192, i32 224, i32 256, i32 320]], align 16
@NativeByteOrder = global i32 0, align 4
@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.1 = private unnamed_addr constant [37 x i8] c"MPEG1 samplerates(kHz): 32 44.1 48 \0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"bitrates(kbs): \00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%i \00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"MPEG2 samplerates(kHz): 16 22.05 24 \0A\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [51 x i8] c"Bitrate %dkbs not legal for %iHz output sampling.\0A\00", align 1
@.str.6 = private unnamed_addr constant [47 x i8] c"SmpFrqIndex: %ldHz is not a legal sample rate\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"Unable to allocate %s\0A\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"ABCD\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"DCBA\00", align 1
@.str.10 = private unnamed_addr constant [41 x i8] c"j == (bs->buf_size-1 - bs->buf_byte_idx)\00", align 1
@.str.11 = private unnamed_addr constant [7 x i8] c"util.c\00", align 1
@__PRETTY_FUNCTION__.copy_buffer = private unnamed_addr constant [49 x i8] c"int copy_buffer(char *, int, Bit_stream_struc *)\00", align 1
@.str.12 = private unnamed_addr constant [7 x i8] c"buffer\00", align 1
@putmask = global [9 x i32] [i32 0, i32 1, i32 3, i32 7, i32 15, i32 31, i32 63, i32 127, i32 255], align 16
@.str.13 = private unnamed_addr constant [51 x i8] c"Cannot read or write more than %d bits at a time.\0A\00", align 1
@.str.14 = private unnamed_addr constant [22 x i8] c"bs->buf_byte_idx >= 0\00", align 1
@__PRETTY_FUNCTION__.putbits = private unnamed_addr constant [52 x i8] c"void putbits(Bit_stream_struc *, unsigned int, int)\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_getframebits = private constant [12 x i8] c"getframebits"
@__profn_display_bitrates = private constant [16 x i8] c"display_bitrates"
@__profn_BitrateIndex = private constant [12 x i8] c"BitrateIndex"
@__profn_SmpFrqIndex = private constant [11 x i8] c"SmpFrqIndex"
@__profn_mem_alloc = private constant [9 x i8] c"mem_alloc"
@__profn_DetermineByteOrder = private constant [18 x i8] c"DetermineByteOrder"
@__profn_SwapBytesInWords = private constant [16 x i8] c"SwapBytesInWords"
@__profn_empty_buffer = private constant [12 x i8] c"empty_buffer"
@__profn_copy_buffer = private constant [11 x i8] c"copy_buffer"
@__profn_init_bit_stream_w = private constant [17 x i8] c"init_bit_stream_w"
@__profn_alloc_buffer = private constant [12 x i8] c"alloc_buffer"
@__profn_desalloc_buffer = private constant [15 x i8] c"desalloc_buffer"
@__profn_putbits = private constant [7 x i8] c"putbits"
@__profc_getframebits = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_getframebits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1484472696907704494, i64 77103277215, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_getframebits, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, i32*, i32*)* @getframebits to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_display_bitrates = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_display_bitrates = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2089048235229772520, i64 52028904346, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_display_bitrates, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*)* @display_bitrates to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BitrateIndex = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BitrateIndex = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -113612379804085003, i64 76452051762, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BitrateIndex, i32 0, i32 0), i8* bitcast (i32 (i32, i32, i32)* @BitrateIndex to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_SmpFrqIndex = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_SmpFrqIndex = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4694639315154283975, i64 93038352337, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_SmpFrqIndex, i32 0, i32 0), i8* bitcast (i32 (i64, i32*)* @SmpFrqIndex to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mem_alloc = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mem_alloc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2555324940288236341, i64 27547940795, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mem_alloc, i32 0, i32 0), i8* bitcast (i8* (i64, i8*)* @mem_alloc to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_DetermineByteOrder = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_DetermineByteOrder = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8690186169611320541, i64 42754363654, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_DetermineByteOrder, i32 0, i32 0), i8* bitcast (i32 ()* @DetermineByteOrder to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_SwapBytesInWords = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_SwapBytesInWords = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3201922005856222222, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_SwapBytesInWords, i32 0, i32 0), i8* bitcast (void (i16*, i32)* @SwapBytesInWords to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_empty_buffer = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_empty_buffer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3425850316397928199, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_empty_buffer, i32 0, i32 0), i8* bitcast (void (%struct.bit_stream_struc*)* @empty_buffer to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_copy_buffer = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_copy_buffer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1966500351621579433, i64 77675581917, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_copy_buffer, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, %struct.bit_stream_struc*)* @copy_buffer to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_init_bit_stream_w = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_init_bit_stream_w = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1817947580118487903, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_init_bit_stream_w, i32 0, i32 0), i8* bitcast (void (%struct.bit_stream_struc*)* @init_bit_stream_w to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_alloc_buffer = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_alloc_buffer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6490433218157701874, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_alloc_buffer, i32 0, i32 0), i8* bitcast (void (%struct.bit_stream_struc*, i32)* @alloc_buffer to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_desalloc_buffer = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_desalloc_buffer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8372435723329234066, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_desalloc_buffer, i32 0, i32 0), i8* bitcast (void (%struct.bit_stream_struc*)* @desalloc_buffer to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_putbits = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_putbits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6805214196529772537, i64 93678579880, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_putbits, i32 0, i32 0), i8* bitcast (void (%struct.bit_stream_struc*, i32, i32)* @putbits to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [130 x i8] c"\B4\01\7Fx\DAU\8E\C1\0A\C20\10D\D9_+\22\F4\E4\A1\07\8F!6\93\12\E8&qwK\ED\DF\9BX\14\BC\BD\C7\C0\CC,\B0(\9E\F1H\A6\14\92\D6\D5\1F\AE\89x\83\D2p\C2\98\03^4q\BD\CA\F3d\06;\BF\AEe\A6\0B\0C\C2)c8\0C7\09\10\9Av_\BB\E9\98\EFE\82\12\B8Zk\DDbl\E9\5C\EA\8FSN\D6\D7\9C\9A\C0\B3\DB\E9S\FA\8D\03\F4\CF\EBf\FD\E7\1B?UD\CD", section "__llvm_prf_names"
@llvm.used = appending global [14 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_getframebits to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_display_bitrates to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BitrateIndex to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_SmpFrqIndex to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mem_alloc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_DetermineByteOrder to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_SwapBytesInWords to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_empty_buffer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_copy_buffer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_init_bit_stream_w to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_alloc_buffer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_desalloc_buffer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_putbits to i8*), i8* getelementptr inbounds ([130 x i8], [130 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @getframebits(%struct.lame_global_flags*, i32*, i32*) #0 {
  %4 = alloca %struct.lame_global_flags*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %4, align 8
  store i32* %1, i32** %5, align 8
  store i32* %2, i32** %6, align 8
  %12 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %13 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %12, i32 0, i32 3
  %14 = load i32, i32* %13, align 8
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 1.000000e+03
  store double %16, double* %9, align 8
  %17 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %18 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %17, i32 0, i32 43
  %19 = load i32, i32* %18, align 8
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 %20
  %22 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %23 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %22, i32 0, i32 50
  %24 = load i32, i32* %23, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [15 x i32], [15 x i32]* %21, i64 0, i64 %25
  %27 = load i32, i32* %26, align 4
  %28 = sitofp i32 %27 to double
  store double %28, double* %8, align 8
  store i32 8, i32* %10, align 4
  store i32 32, i32* %11, align 4
  %29 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %30 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %29, i32 0, i32 43
  %31 = load i32, i32* %30, align 8
  %32 = icmp eq i32 %31, 1
  br i1 %32, label %33, label %47

; <label>:33:                                     ; preds = %3
  %34 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %35 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %34, i32 0, i32 46
  %36 = load i32, i32* %35, align 4
  %37 = icmp eq i32 %36, 1
  br i1 %37, label %38, label %42

; <label>:38:                                     ; preds = %33
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_getframebits, i64 0, i64 1)
  %39 = add i64 %pgocount, 1
  store i64 %39, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_getframebits, i64 0, i64 1)
  %40 = load i32, i32* %11, align 4
  %41 = add nsw i32 %40, 136
  store i32 %41, i32* %11, align 4
  br label %46

; <label>:42:                                     ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_getframebits, i64 0, i64 2)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_getframebits, i64 0, i64 2)
  %44 = load i32, i32* %11, align 4
  %45 = add nsw i32 %44, 256
  store i32 %45, i32* %11, align 4
  br label %46

; <label>:46:                                     ; preds = %42, %38
  br label %61

; <label>:47:                                     ; preds = %3
  %48 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %49 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %48, i32 0, i32 46
  %50 = load i32, i32* %49, align 4
  %51 = icmp eq i32 %50, 1
  br i1 %51, label %52, label %56

; <label>:52:                                     ; preds = %47
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_getframebits, i64 0, i64 3)
  %53 = add i64 %pgocount2, 1
  store i64 %53, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_getframebits, i64 0, i64 3)
  %54 = load i32, i32* %11, align 4
  %55 = add nsw i32 %54, 72
  store i32 %55, i32* %11, align 4
  br label %60

; <label>:56:                                     ; preds = %47
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_getframebits, i64 0, i64 4)
  %57 = add i64 %pgocount3, 1
  store i64 %57, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_getframebits, i64 0, i64 4)
  %58 = load i32, i32* %11, align 4
  %59 = add nsw i32 %58, 136
  store i32 %59, i32* %11, align 4
  br label %60

; <label>:60:                                     ; preds = %56, %52
  br label %61

; <label>:61:                                     ; preds = %60, %46
  %62 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %63 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %62, i32 0, i32 14
  %64 = load i32, i32* %63, align 4
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %70

; <label>:66:                                     ; preds = %61
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_getframebits, i64 0, i64 0)
  %67 = add i64 %pgocount4, 1
  store i64 %67, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_getframebits, i64 0, i64 0)
  %68 = load i32, i32* %11, align 4
  %69 = add nsw i32 %68, 16
  store i32 %69, i32* %11, align 4
  br label %70

; <label>:70:                                     ; preds = %66, %61
  %71 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %72 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %71, i32 0, i32 42
  %73 = load i32, i32* %72, align 4
  %74 = sitofp i32 %73 to double
  %75 = load double, double* %9, align 8
  %76 = fdiv double %74, %75
  %77 = load double, double* %8, align 8
  %78 = load i32, i32* %10, align 4
  %79 = sitofp i32 %78 to double
  %80 = fdiv double %77, %79
  %81 = fmul double %76, %80
  %82 = fadd double %81, 1.000000e-09
  %83 = call double @floor(double %82) #8
  %84 = fptosi double %83 to i32
  store i32 %84, i32* %7, align 4
  %85 = load i32, i32* %7, align 4
  %86 = mul nsw i32 8, %85
  %87 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %88 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %87, i32 0, i32 44
  %89 = load i32, i32* %88, align 4
  %90 = mul nsw i32 %89, 8
  %91 = add nsw i32 %86, %90
  %92 = load i32*, i32** %5, align 8
  store i32 %91, i32* %92, align 4
  %93 = load i32*, i32** %5, align 8
  %94 = load i32, i32* %93, align 4
  %95 = load i32, i32* %11, align 4
  %96 = sub nsw i32 %94, %95
  %97 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %98 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %97, i32 0, i32 45
  %99 = load i32, i32* %98, align 8
  %100 = sdiv i32 %96, %99
  %101 = load i32*, i32** %6, align 8
  store i32 %100, i32* %101, align 4
  ret void
}

; Function Attrs: nounwind readnone
declare double @floor(double) #1

; Function Attrs: nounwind uwtable
define void @display_bitrates(%struct._IO_FILE*) #0 {
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8
  store i32 1, i32* %4, align 4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.1, i32 0, i32 0))
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0))
  store i32 1, i32* %3, align 4
  br label %11

; <label>:11:                                     ; preds = %24, %1
  %12 = load i32, i32* %3, align 4
  %13 = icmp slt i32 %12, 15
  br i1 %13, label %14, label %28

; <label>:14:                                     ; preds = %11
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %16 = load i32, i32* %4, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 %17
  %19 = load i32, i32* %3, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [15 x i32], [15 x i32]* %18, i64 0, i64 %20
  %22 = load i32, i32* %21, align 4
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i32 %22)
  br label %24

; <label>:24:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_display_bitrates, i64 0, i64 0)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_display_bitrates, i64 0, i64 0)
  %26 = load i32, i32* %3, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %3, align 4
  br label %11

; <label>:28:                                     ; preds = %11
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* %4, align 4
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %32 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i32 0, i32 0))
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0))
  store i32 1, i32* %3, align 4
  br label %37

; <label>:37:                                     ; preds = %50, %28
  %38 = load i32, i32* %3, align 4
  %39 = icmp slt i32 %38, 15
  br i1 %39, label %40, label %54

; <label>:40:                                     ; preds = %37
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %42 = load i32, i32* %4, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 %43
  %45 = load i32, i32* %3, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [15 x i32], [15 x i32]* %44, i64 0, i64 %46
  %48 = load i32, i32* %47, align 4
  %49 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i32 %48)
  br label %50

; <label>:50:                                     ; preds = %40
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_display_bitrates, i64 0, i64 1)
  %51 = add i64 %pgocount1, 1
  store i64 %51, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_display_bitrates, i64 0, i64 1)
  %52 = load i32, i32* %3, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %3, align 4
  br label %37

; <label>:54:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_display_bitrates, i64 0, i64 2)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_display_bitrates, i64 0, i64 2)
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %57 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @BitrateIndex(i32, i32, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store i32 0, i32* %8, align 4
  store i32 0, i32* %9, align 4
  br label %10

; <label>:10:                                     ; preds = %35, %3
  %11 = load i32, i32* %9, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %17, label %13

; <label>:13:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BitrateIndex, i64 0, i64 2)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BitrateIndex, i64 0, i64 2)
  %15 = load i32, i32* %8, align 4
  %16 = icmp slt i32 %15, 15
  br label %17

; <label>:17:                                     ; preds = %13, %10
  %18 = phi i1 [ false, %10 ], [ %16, %13 ]
  br i1 %18, label %19, label %36

; <label>:19:                                     ; preds = %17
  %20 = load i32, i32* %6, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 %21
  %23 = load i32, i32* %8, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [15 x i32], [15 x i32]* %22, i64 0, i64 %24
  %26 = load i32, i32* %25, align 4
  %27 = load i32, i32* %5, align 4
  %28 = icmp eq i32 %26, %27
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BitrateIndex, i64 0, i64 0)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BitrateIndex, i64 0, i64 0)
  store i32 1, i32* %9, align 4
  br label %35

; <label>:31:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BitrateIndex, i64 0, i64 1)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BitrateIndex, i64 0, i64 1)
  %33 = load i32, i32* %8, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %8, align 4
  br label %35

; <label>:35:                                     ; preds = %31, %29
  br label %10

; <label>:36:                                     ; preds = %17
  %37 = load i32, i32* %9, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %42

; <label>:39:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BitrateIndex, i64 0, i64 3)
  %40 = add i64 %pgocount3, 1
  store i64 %40, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BitrateIndex, i64 0, i64 3)
  %41 = load i32, i32* %8, align 4
  store i32 %41, i32* %4, align 4
  br label %48

; <label>:42:                                     ; preds = %36
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BitrateIndex, i64 0, i64 4)
  %43 = add i64 %pgocount4, 1
  store i64 %43, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BitrateIndex, i64 0, i64 4)
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = load i32, i32* %5, align 4
  %46 = load i32, i32* %7, align 4
  %47 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.5, i32 0, i32 0), i32 %45, i32 %46)
  store i32 -1, i32* %4, align 4
  br label %48

; <label>:48:                                     ; preds = %42, %39
  %49 = load i32, i32* %4, align 4
  ret i32 %49
}

; Function Attrs: nounwind uwtable
define i32 @SmpFrqIndex(i64, i32*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i32*, align 8
  store i64 %0, i64* %4, align 8
  store i32* %1, i32** %5, align 8
  %6 = load i32*, i32** %5, align 8
  store i32 0, i32* %6, align 4
  %7 = load i64, i64* %4, align 8
  %8 = icmp eq i64 %7, 44100
  br i1 %8, label %9, label %12

; <label>:9:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_SmpFrqIndex, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_SmpFrqIndex, i64 0, i64 0)
  %11 = load i32*, i32** %5, align 8
  store i32 1, i32* %11, align 4
  store i32 0, i32* %3, align 4
  br label %47

; <label>:12:                                     ; preds = %2
  %13 = load i64, i64* %4, align 8
  %14 = icmp eq i64 %13, 48000
  br i1 %14, label %15, label %18

; <label>:15:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_SmpFrqIndex, i64 0, i64 1)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_SmpFrqIndex, i64 0, i64 1)
  %17 = load i32*, i32** %5, align 8
  store i32 1, i32* %17, align 4
  store i32 1, i32* %3, align 4
  br label %47

; <label>:18:                                     ; preds = %12
  %19 = load i64, i64* %4, align 8
  %20 = icmp eq i64 %19, 32000
  br i1 %20, label %21, label %24

; <label>:21:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_SmpFrqIndex, i64 0, i64 2)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_SmpFrqIndex, i64 0, i64 2)
  %23 = load i32*, i32** %5, align 8
  store i32 1, i32* %23, align 4
  store i32 2, i32* %3, align 4
  br label %47

; <label>:24:                                     ; preds = %18
  %25 = load i64, i64* %4, align 8
  %26 = icmp eq i64 %25, 24000
  br i1 %26, label %27, label %30

; <label>:27:                                     ; preds = %24
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_SmpFrqIndex, i64 0, i64 3)
  %28 = add i64 %pgocount3, 1
  store i64 %28, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_SmpFrqIndex, i64 0, i64 3)
  %29 = load i32*, i32** %5, align 8
  store i32 0, i32* %29, align 4
  store i32 1, i32* %3, align 4
  br label %47

; <label>:30:                                     ; preds = %24
  %31 = load i64, i64* %4, align 8
  %32 = icmp eq i64 %31, 22050
  br i1 %32, label %33, label %36

; <label>:33:                                     ; preds = %30
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_SmpFrqIndex, i64 0, i64 4)
  %34 = add i64 %pgocount4, 1
  store i64 %34, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_SmpFrqIndex, i64 0, i64 4)
  %35 = load i32*, i32** %5, align 8
  store i32 0, i32* %35, align 4
  store i32 0, i32* %3, align 4
  br label %47

; <label>:36:                                     ; preds = %30
  %37 = load i64, i64* %4, align 8
  %38 = icmp eq i64 %37, 16000
  br i1 %38, label %39, label %42

; <label>:39:                                     ; preds = %36
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_SmpFrqIndex, i64 0, i64 5)
  %40 = add i64 %pgocount5, 1
  store i64 %40, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_SmpFrqIndex, i64 0, i64 5)
  %41 = load i32*, i32** %5, align 8
  store i32 0, i32* %41, align 4
  store i32 2, i32* %3, align 4
  br label %47

; <label>:42:                                     ; preds = %36
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_SmpFrqIndex, i64 0, i64 6)
  %43 = add i64 %pgocount6, 1
  store i64 %43, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_SmpFrqIndex, i64 0, i64 6)
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = load i64, i64* %4, align 8
  %46 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.6, i32 0, i32 0), i64 %45)
  store i32 -1, i32* %3, align 4
  br label %47

; <label>:47:                                     ; preds = %42, %39, %33, %27, %21, %15, %9
  %48 = load i32, i32* %3, align 4
  ret i32 %48
}

; Function Attrs: nounwind uwtable
define i8* @mem_alloc(i64, i8*) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store i64 %0, i64* %3, align 8
  store i8* %1, i8** %4, align 8
  %6 = load i64, i64* %3, align 8
  %7 = call noalias i8* @malloc(i64 %6) #7
  store i8* %7, i8** %5, align 8
  %8 = load i8*, i8** %5, align 8
  %9 = icmp ne i8* %8, null
  br i1 %9, label %10, label %13

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %5, align 8
  %12 = load i64, i64* %3, align 8
  call void @llvm.memset.p0i8.i64(i8* %11, i8 0, i64 %12, i32 1, i1 false)
  br label %18

; <label>:13:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mem_alloc, i64 0, i64 1)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mem_alloc, i64 0, i64 1)
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = load i8*, i8** %4, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0), i8* %16)
  call void @exit(i32 1) #9
  unreachable

; <label>:18:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mem_alloc, i64 0, i64 0)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mem_alloc, i64 0, i64 0)
  %20 = load i8*, i8** %5, align 8
  ret i8* %20
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

; Function Attrs: nounwind uwtable
define i32 @DetermineByteOrder() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [9 x i8], align 1
  %3 = alloca %union.anon, align 8
  %4 = bitcast %union.anon* %3 to i64*
  store i64 1094861636, i64* %4, align 8
  %5 = getelementptr inbounds [9 x i8], [9 x i8]* %2, i32 0, i32 0
  %6 = bitcast %union.anon* %3 to [8 x i8]*
  %7 = getelementptr inbounds [8 x i8], [8 x i8]* %6, i32 0, i32 0
  %8 = call i8* @strncpy(i8* %5, i8* %7, i64 8) #7
  %9 = getelementptr inbounds [9 x i8], [9 x i8]* %2, i64 0, i64 8
  store i8 0, i8* %9, align 1
  %10 = getelementptr inbounds [9 x i8], [9 x i8]* %2, i32 0, i32 0
  %11 = call i32 @strcmp(i8* %10, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i32 0, i32 0)) #10
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_DetermineByteOrder, i64 0, i64 1)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_DetermineByteOrder, i64 0, i64 1)
  store i32 1, i32* %1, align 4
  br label %23

; <label>:15:                                     ; preds = %0
  %16 = getelementptr inbounds [9 x i8], [9 x i8]* %2, i32 0, i32 0
  %17 = call i32 @strcmp(i8* %16, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0)) #10
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_DetermineByteOrder, i64 0, i64 2)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_DetermineByteOrder, i64 0, i64 2)
  store i32 2, i32* %1, align 4
  br label %23

; <label>:21:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_DetermineByteOrder, i64 0, i64 0)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_DetermineByteOrder, i64 0, i64 0)
  store i32 0, i32* %1, align 4
  br label %23

; <label>:23:                                     ; preds = %21, %19, %13
  %24 = load i32, i32* %1, align 4
  ret i32 %24
}

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #6

; Function Attrs: nounwind uwtable
define void @SwapBytesInWords(i16*, i32) #0 {
  %3 = alloca i16*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i16, align 2
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  store i16* %0, i16** %3, align 8
  store i32 %1, i32* %4, align 4
  %9 = bitcast i16* %6 to i8*
  store i8* %9, i8** %8, align 8
  store i32 0, i32* %5, align 4
  br label %10

; <label>:10:                                     ; preds = %30, %2
  %11 = load i32, i32* %5, align 4
  %12 = load i32, i32* %4, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %34

; <label>:14:                                     ; preds = %10
  %15 = load i16*, i16** %3, align 8
  %16 = load i16, i16* %15, align 2
  store i16 %16, i16* %6, align 2
  %17 = load i16*, i16** %3, align 8
  %18 = getelementptr inbounds i16, i16* %17, i32 1
  store i16* %18, i16** %3, align 8
  %19 = bitcast i16* %17 to i8*
  store i8* %19, i8** %7, align 8
  %20 = load i8*, i8** %8, align 8
  %21 = getelementptr inbounds i8, i8* %20, i64 1
  %22 = load i8, i8* %21, align 1
  %23 = load i8*, i8** %7, align 8
  %24 = getelementptr inbounds i8, i8* %23, i64 0
  store i8 %22, i8* %24, align 1
  %25 = load i8*, i8** %8, align 8
  %26 = getelementptr inbounds i8, i8* %25, i64 0
  %27 = load i8, i8* %26, align 1
  %28 = load i8*, i8** %7, align 8
  %29 = getelementptr inbounds i8, i8* %28, i64 1
  store i8 %27, i8* %29, align 1
  br label %30

; <label>:30:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_SwapBytesInWords, i64 0, i64 0)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_SwapBytesInWords, i64 0, i64 0)
  %32 = load i32, i32* %5, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %5, align 4
  br label %10

; <label>:34:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_SwapBytesInWords, i64 0, i64 1)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_SwapBytesInWords, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define void @empty_buffer(%struct.bit_stream_struc*) #0 {
  %2 = alloca %struct.bit_stream_struc*, align 8
  %3 = alloca i32, align 4
  store %struct.bit_stream_struc* %0, %struct.bit_stream_struc** %2, align 8
  %4 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %2, align 8
  %5 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %4, i32 0, i32 6
  %6 = load i32, i32* %5, align 8
  %7 = add nsw i32 1, %6
  store i32 %7, i32* %3, align 4
  %8 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %2, align 8
  %9 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %8, i32 0, i32 4
  %10 = load i32, i32* %9, align 8
  %11 = load i32, i32* %3, align 4
  %12 = sub nsw i32 %10, %11
  %13 = icmp sle i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_empty_buffer, i64 0, i64 0)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_empty_buffer, i64 0, i64 0)
  br label %34

; <label>:16:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_empty_buffer, i64 0, i64 1)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_empty_buffer, i64 0, i64 1)
  %18 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %2, align 8
  %19 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %18, i32 0, i32 4
  %20 = load i32, i32* %19, align 8
  %21 = sub nsw i32 %20, 1
  %22 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %2, align 8
  %23 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %22, i32 0, i32 6
  store i32 %21, i32* %23, align 8
  %24 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %2, align 8
  %25 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %24, i32 0, i32 7
  store i32 8, i32* %25, align 4
  %26 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %2, align 8
  %27 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %26, i32 0, i32 3
  %28 = load i8*, i8** %27, align 8
  %29 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %2, align 8
  %30 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %29, i32 0, i32 6
  %31 = load i32, i32* %30, align 8
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8* %28, i64 %32
  store i8 0, i8* %33, align 1
  br label %34

; <label>:34:                                     ; preds = %16, %14
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @copy_buffer(i8*, i32, %struct.bit_stream_struc*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.bit_stream_struc*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store %struct.bit_stream_struc* %2, %struct.bit_stream_struc** %7, align 8
  store i32 0, i32* %9, align 4
  %10 = load i32, i32* %6, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %26

; <label>:12:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_copy_buffer, i64 0, i64 2)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_copy_buffer, i64 0, i64 2)
  %14 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %7, align 8
  %15 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %14, i32 0, i32 4
  %16 = load i32, i32* %15, align 8
  %17 = sub nsw i32 %16, 1
  %18 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %7, align 8
  %19 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %18, i32 0, i32 6
  %20 = load i32, i32* %19, align 8
  %21 = sub nsw i32 %17, %20
  %22 = load i32, i32* %6, align 4
  %23 = icmp sgt i32 %21, %22
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_copy_buffer, i64 0, i64 3)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_copy_buffer, i64 0, i64 3)
  store i32 -1, i32* %4, align 4
  br label %73

; <label>:26:                                     ; preds = %12, %3
  %27 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %7, align 8
  %28 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %27, i32 0, i32 4
  %29 = load i32, i32* %28, align 8
  %30 = sub nsw i32 %29, 1
  store i32 %30, i32* %8, align 4
  br label %31

; <label>:31:                                     ; preds = %50, %26
  %32 = load i32, i32* %8, align 4
  %33 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %7, align 8
  %34 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %33, i32 0, i32 6
  %35 = load i32, i32* %34, align 8
  %36 = icmp sgt i32 %32, %35
  br i1 %36, label %37, label %54

; <label>:37:                                     ; preds = %31
  %38 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %7, align 8
  %39 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %38, i32 0, i32 3
  %40 = load i8*, i8** %39, align 8
  %41 = load i32, i32* %8, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8* %40, i64 %42
  %44 = load i8, i8* %43, align 1
  %45 = load i8*, i8** %5, align 8
  %46 = load i32, i32* %9, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %9, align 4
  %48 = sext i32 %46 to i64
  %49 = getelementptr inbounds i8, i8* %45, i64 %48
  store i8 %44, i8* %49, align 1
  br label %50

; <label>:50:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_copy_buffer, i64 0, i64 0)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_copy_buffer, i64 0, i64 0)
  %52 = load i32, i32* %8, align 4
  %53 = add nsw i32 %52, -1
  store i32 %53, i32* %8, align 4
  br label %31

; <label>:54:                                     ; preds = %31
  %55 = load i32, i32* %9, align 4
  %56 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %7, align 8
  %57 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %56, i32 0, i32 4
  %58 = load i32, i32* %57, align 8
  %59 = sub nsw i32 %58, 1
  %60 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %7, align 8
  %61 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %60, i32 0, i32 6
  %62 = load i32, i32* %61, align 8
  %63 = sub nsw i32 %59, %62
  %64 = icmp eq i32 %55, %63
  br i1 %64, label %65, label %66

; <label>:65:                                     ; preds = %54
  br label %69

; <label>:66:                                     ; preds = %54
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_copy_buffer, i64 0, i64 4)
  %67 = add i64 %pgocount3, 1
  store i64 %67, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_copy_buffer, i64 0, i64 4)
  call void @__assert_fail(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i32 0, i32 0), i32 270, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__PRETTY_FUNCTION__.copy_buffer, i32 0, i32 0)) #9
  unreachable
                                                  ; No predecessors!
  br label %69

; <label>:69:                                     ; preds = %68, %65
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_copy_buffer, i64 0, i64 1)
  %70 = add i64 %pgocount4, 1
  store i64 %70, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_copy_buffer, i64 0, i64 1)
  %71 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %7, align 8
  call void @empty_buffer(%struct.bit_stream_struc* %71)
  %72 = load i32, i32* %9, align 4
  store i32 %72, i32* %4, align 4
  br label %73

; <label>:73:                                     ; preds = %69, %24
  %74 = load i32, i32* %4, align 4
  ret i32 %74
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #5

; Function Attrs: nounwind uwtable
define void @init_bit_stream_w(%struct.bit_stream_struc*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_init_bit_stream_w, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_init_bit_stream_w, i64 0, i64 0)
  %3 = alloca %struct.bit_stream_struc*, align 8
  store %struct.bit_stream_struc* %0, %struct.bit_stream_struc** %3, align 8
  %4 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %3, align 8
  call void @alloc_buffer(%struct.bit_stream_struc* %4, i32 16384)
  %5 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %3, align 8
  %6 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %5, i32 0, i32 6
  store i32 16383, i32* %6, align 8
  %7 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %3, align 8
  %8 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %7, i32 0, i32 7
  store i32 8, i32* %8, align 4
  %9 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %3, align 8
  %10 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %9, i32 0, i32 5
  store i64 0, i64* %10, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @alloc_buffer(%struct.bit_stream_struc*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_alloc_buffer, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_alloc_buffer, i64 0, i64 0)
  %4 = alloca %struct.bit_stream_struc*, align 8
  %5 = alloca i32, align 4
  store %struct.bit_stream_struc* %0, %struct.bit_stream_struc** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = sext i32 %6 to i64
  %8 = mul i64 %7, 1
  %9 = call i8* @mem_alloc(i64 %8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0))
  %10 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %4, align 8
  %11 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %10, i32 0, i32 3
  store i8* %9, i8** %11, align 8
  %12 = load i32, i32* %5, align 4
  %13 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %4, align 8
  %14 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %13, i32 0, i32 4
  store i32 %12, i32* %14, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @desalloc_buffer(%struct.bit_stream_struc*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_desalloc_buffer, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_desalloc_buffer, i64 0, i64 0)
  %3 = alloca %struct.bit_stream_struc*, align 8
  store %struct.bit_stream_struc* %0, %struct.bit_stream_struc** %3, align 8
  %4 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %3, align 8
  %5 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %4, i32 0, i32 3
  %6 = load i8*, i8** %5, align 8
  call void @free(i8* %6) #7
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind uwtable
define void @putbits(%struct.bit_stream_struc*, i32, i32) #0 {
  %4 = alloca %struct.bit_stream_struc*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct.bit_stream_struc* %0, %struct.bit_stream_struc** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %10 = load i32, i32* %6, align 4
  store i32 %10, i32* %7, align 4
  %11 = load i32, i32* %6, align 4
  %12 = icmp sgt i32 %11, 32
  br i1 %12, label %13, label %17

; <label>:13:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_putbits, i64 0, i64 4)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_putbits, i64 0, i64 4)
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.13, i32 0, i32 0), i32 32)
  br label %17

; <label>:17:                                     ; preds = %13, %3
  %18 = load i32, i32* %6, align 4
  %19 = sext i32 %18 to i64
  %20 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %4, align 8
  %21 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %20, i32 0, i32 5
  %22 = load i64, i64* %21, align 8
  %23 = add i64 %22, %19
  store i64 %23, i64* %21, align 8
  br label %24

; <label>:24:                                     ; preds = %106, %17
  %25 = load i32, i32* %7, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %27, label %110

; <label>:27:                                     ; preds = %24
  %28 = load i32, i32* %7, align 4
  %29 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %4, align 8
  %30 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %29, i32 0, i32 7
  %31 = load i32, i32* %30, align 4
  %32 = icmp slt i32 %28, %31
  br i1 %32, label %33, label %36

; <label>:33:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_putbits, i64 0, i64 0)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_putbits, i64 0, i64 0)
  %35 = load i32, i32* %7, align 4
  br label %41

; <label>:36:                                     ; preds = %27
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_putbits, i64 0, i64 1)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_putbits, i64 0, i64 1)
  %38 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %4, align 8
  %39 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %38, i32 0, i32 7
  %40 = load i32, i32* %39, align 4
  br label %41

; <label>:41:                                     ; preds = %36, %33
  %42 = phi i32 [ %35, %33 ], [ %40, %36 ]
  store i32 %42, i32* %8, align 4
  %43 = load i32, i32* %5, align 4
  %44 = load i32, i32* %7, align 4
  %45 = load i32, i32* %8, align 4
  %46 = sub nsw i32 %44, %45
  %47 = lshr i32 %43, %46
  store i32 %47, i32* %9, align 4
  %48 = load i32, i32* %9, align 4
  %49 = load i32, i32* %8, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [9 x i32], [9 x i32]* @putmask, i64 0, i64 %50
  %52 = load i32, i32* %51, align 4
  %53 = and i32 %48, %52
  %54 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %4, align 8
  %55 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %54, i32 0, i32 7
  %56 = load i32, i32* %55, align 4
  %57 = load i32, i32* %8, align 4
  %58 = sub nsw i32 %56, %57
  %59 = shl i32 %53, %58
  %60 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %4, align 8
  %61 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %60, i32 0, i32 3
  %62 = load i8*, i8** %61, align 8
  %63 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %4, align 8
  %64 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %63, i32 0, i32 6
  %65 = load i32, i32* %64, align 8
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8* %62, i64 %66
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = or i32 %69, %59
  %71 = trunc i32 %70 to i8
  store i8 %71, i8* %67, align 1
  %72 = load i32, i32* %8, align 4
  %73 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %4, align 8
  %74 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %73, i32 0, i32 7
  %75 = load i32, i32* %74, align 4
  %76 = sub nsw i32 %75, %72
  store i32 %76, i32* %74, align 4
  %77 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %4, align 8
  %78 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %77, i32 0, i32 7
  %79 = load i32, i32* %78, align 4
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %106, label %81

; <label>:81:                                     ; preds = %41
  %82 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %4, align 8
  %83 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %82, i32 0, i32 7
  store i32 8, i32* %83, align 4
  %84 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %4, align 8
  %85 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %84, i32 0, i32 6
  %86 = load i32, i32* %85, align 8
  %87 = add nsw i32 %86, -1
  store i32 %87, i32* %85, align 8
  %88 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %4, align 8
  %89 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %88, i32 0, i32 6
  %90 = load i32, i32* %89, align 8
  %91 = icmp sge i32 %90, 0
  br i1 %91, label %92, label %93

; <label>:92:                                     ; preds = %81
  br label %96

; <label>:93:                                     ; preds = %81
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_putbits, i64 0, i64 5)
  %94 = add i64 %pgocount3, 1
  store i64 %94, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_putbits, i64 0, i64 5)
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i32 0, i32 0), i32 328, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__PRETTY_FUNCTION__.putbits, i32 0, i32 0)) #9
  unreachable
                                                  ; No predecessors!
  br label %96

; <label>:96:                                     ; preds = %95, %92
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_putbits, i64 0, i64 2)
  %97 = add i64 %pgocount4, 1
  store i64 %97, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_putbits, i64 0, i64 2)
  %98 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %4, align 8
  %99 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %98, i32 0, i32 3
  %100 = load i8*, i8** %99, align 8
  %101 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %4, align 8
  %102 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %101, i32 0, i32 6
  %103 = load i32, i32* %102, align 8
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i8, i8* %100, i64 %104
  store i8 0, i8* %105, align 1
  br label %106

; <label>:106:                                    ; preds = %96, %41
  %107 = load i32, i32* %8, align 4
  %108 = load i32, i32* %7, align 4
  %109 = sub nsw i32 %108, %107
  store i32 %109, i32* %7, align 4
  br label %24

; <label>:110:                                    ; preds = %24
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_putbits, i64 0, i64 3)
  %111 = add i64 %pgocount5, 1
  store i64 %111, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_putbits, i64 0, i64 3)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #7

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
