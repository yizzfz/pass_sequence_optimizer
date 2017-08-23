; ModuleID = 'tmp1.ll'
source_filename = "l3bitstream.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.BF_FrameData = type { i32, i32, i32, %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart*, [2 x %struct.BF_BitstreamPart*], [2 x [2 x %struct.BF_BitstreamPart*]], [2 x [2 x %struct.BF_BitstreamPart*]], [2 x [2 x %struct.BF_BitstreamPart*]], [2 x [2 x %struct.BF_BitstreamPart*]], %struct.BF_BitstreamPart* }
%struct.BF_BitstreamPart = type { i32, %struct.BF_BitstreamElement* }
%struct.BF_BitstreamElement = type { i32, i16 }
%struct.BF_FrameResults = type { i32, i32, i32 }
%struct.bit_stream_struc = type { i8*, i32, %struct._IO_FILE*, i8*, i32, i64, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.BF_PartHolder = type { i32, %struct.BF_BitstreamPart* }
%struct.huffcodetab = type { i32, i32, i64*, i8* }
%struct.scalefac_struct = type { [23 x i32], [14 x i32] }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.III_side_info_t = type { i32, i32, i32, [2 x [4 x i32]], [2 x %struct.anon] }
%struct.anon = type { [2 x %struct.gr_info_ss] }
%struct.gr_info_ss = type { %struct.gr_info }
%struct.gr_info = type { i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, [4 x i32] }
%struct.III_scalefac_t = type { [22 x i32], [13 x [3 x i32]] }

$__llvm_profile_raw_version = comdat any

@frameData = global %struct.BF_FrameData* null, align 8
@frameResults = global %struct.BF_FrameResults* null, align 8
@PartHoldersInitialized = global i32 0, align 4
@bs = internal global %struct.bit_stream_struc* null, align 8
@.str = private unnamed_addr constant [10 x i8] c"frameData\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"l3bitstream.c\00", align 1
@__PRETTY_FUNCTION__.III_format_bitstream = private unnamed_addr constant [131 x i8] c"void III_format_bitstream(lame_global_flags *, int, int (*)[2][576], III_side_info_t *, III_scalefac_t (*)[2], Bit_stream_struc *)\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"frameResults\00", align 1
@headerPH = common global %struct.BF_PartHolder* null, align 8
@frameSIPH = common global %struct.BF_PartHolder* null, align 8
@channelSIPH = common global [2 x %struct.BF_PartHolder*] zeroinitializer, align 16
@spectrumSIPH = common global [2 x [2 x %struct.BF_PartHolder*]] zeroinitializer, align 16
@scaleFactorsPH = common global [2 x [2 x %struct.BF_PartHolder*]] zeroinitializer, align 16
@codedDataPH = common global [2 x [2 x %struct.BF_PartHolder*]] zeroinitializer, align 16
@userSpectrumPH = common global [2 x [2 x %struct.BF_PartHolder*]] zeroinitializer, align 16
@userFrameDataPH = common global %struct.BF_PartHolder* null, align 8
@ht = external global [34 x %struct.huffcodetab], align 16
@.str.3 = private unnamed_addr constant [22 x i8] c"linbitsx <= h->linmax\00", align 1
@__PRETTY_FUNCTION__.HuffmanCode = private unnamed_addr constant [77 x i8] c"int HuffmanCode(int, int, int, unsigned int *, unsigned int *, int *, int *)\00", align 1
@.str.4 = private unnamed_addr constant [22 x i8] c"linbitsy <= h->linmax\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"*cbits <= 32\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"*xbits <= 32\00", align 1
@slen1_tab = internal global [16 x i32] [i32 0, i32 0, i32 0, i32 0, i32 3, i32 1, i32 1, i32 1, i32 2, i32 2, i32 2, i32 3, i32 3, i32 3, i32 4, i32 4], align 16
@slen2_tab = internal global [16 x i32] [i32 0, i32 1, i32 2, i32 3, i32 0, i32 1, i32 2, i32 3, i32 1, i32 2, i32 3, i32 1, i32 2, i32 3, i32 2, i32 3], align 16
@.str.7 = private unnamed_addr constant [24 x i8] c"gi->sfb_partition_table\00", align 1
@__PRETTY_FUNCTION__.encodeMainData = private unnamed_addr constant [100 x i8] c"void encodeMainData(lame_global_flags *, int (*)[2][576], III_side_info_t *, III_scalefac_t (*)[2])\00", align 1
@scalefac_band = external global %struct.scalefac_struct, align 4
@.str.8 = private unnamed_addr constant [16 x i8] c"tableindex < 32\00", align 1
@__PRETTY_FUNCTION__.Huffmancodebits = private unnamed_addr constant [57 x i8] c"void Huffmancodebits(BF_PartHolder **, int *, gr_info *)\00", align 1
@.str.9 = private unnamed_addr constant [20 x i8] c"scalefac_index < 23\00", align 1
@.str.10 = private unnamed_addr constant [29 x i8] c"(gi->count1table_select < 2)\00", align 1
@.str.11 = private unnamed_addr constant [17 x i8] c"count1End <= 576\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.12 = private unnamed_addr constant [35 x i8] c"opps - adding stuffing bits = %i.\0A\00", align 1
@.str.13 = private unnamed_addr constant [27 x i8] c"this should not happen...\0A\00", align 1
@.str.14 = private unnamed_addr constant [60 x i8] c"bitsWritten == (int)(gi->part2_3_length - gi->part2_length)\00", align 1
@crc = internal global i32 0, align 4
@.str.15 = private unnamed_addr constant [28 x i8] c"gi->block_type == NORM_TYPE\00", align 1
@__PRETTY_FUNCTION__.encodeSideInfo = private unnamed_addr constant [59 x i8] c"int encodeSideInfo(lame_global_flags *, III_side_info_t *)\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_putMyBits = private constant [9 x i8] c"putMyBits"
@__profn_III_format_bitstream = private constant [20 x i8] c"III_format_bitstream"
@__profn_tmp1.ll_encodeSideInfo = private constant [22 x i8] c"tmp1.ll:encodeSideInfo"
@__profn_tmp1.ll_encodeMainData = private constant [22 x i8] c"tmp1.ll:encodeMainData"
@__profn_tmp1.ll_drain_into_ancillary_data = private constant [33 x i8] c"tmp1.ll:drain_into_ancillary_data"
@__profn_III_FlushBitstream = private constant [18 x i8] c"III_FlushBitstream"
@__profn_abs_and_sign = private constant [12 x i8] c"abs_and_sign"
@__profn_L3_huffman_coder_count1 = private constant [23 x i8] c"L3_huffman_coder_count1"
@__profn_HuffmanCode = private constant [11 x i8] c"HuffmanCode"
@__profn_tmp1.ll_Huffmancodebits = private constant [23 x i8] c"tmp1.ll:Huffmancodebits"
@__profn_tmp1.ll_CRC_BF_addEntry = private constant [23 x i8] c"tmp1.ll:CRC_BF_addEntry"
@__profc_putMyBits = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_putMyBits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 324466470614043289, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_putMyBits, i32 0, i32 0), i8* bitcast (void (i32, i32)* @putMyBits to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_III_format_bitstream = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_III_format_bitstream = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2671566125622394904, i64 219063373590, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, i32, [2 x [576 x i32]]*, %struct.III_side_info_t*, [2 x %struct.III_scalefac_t]*, %struct.bit_stream_struc*)* @III_format_bitstream to i8*), i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_encodeSideInfo = private global [24 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_encodeSideInfo = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4113715198750213721, i64 467023364540, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i32 0, i32 0), i8* null, i8* null, i32 24, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_encodeMainData = private global [33 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_encodeMainData = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1719185026593784071, i64 601044646039, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i32 0, i32 0), i8* null, i8* null, i32 33, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_drain_into_ancillary_data = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_drain_into_ancillary_data = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5255891453382987806, i64 44592619267, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_drain_into_ancillary_data, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_III_FlushBitstream = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_III_FlushBitstream = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7986604175188778365, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_III_FlushBitstream, i32 0, i32 0), i8* bitcast (void ()* @III_FlushBitstream to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_abs_and_sign = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_abs_and_sign = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1946775556817995739, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_abs_and_sign, i32 0, i32 0), i8* bitcast (i32 (i32*)* @abs_and_sign to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_L3_huffman_coder_count1 = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_L3_huffman_coder_count1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8153486988394096992, i64 61563538795, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_L3_huffman_coder_count1, i32 0, i32 0), i8* bitcast (i32 (%struct.BF_PartHolder**, %struct.huffcodetab*, i32, i32, i32, i32)* @L3_huffman_coder_count1 to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_HuffmanCode = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_HuffmanCode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5765021459943873012, i64 232592514777, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i32 0, i32 0), i8* bitcast (i32 (i32, i32, i32, i32*, i32*, i32*, i32*)* @HuffmanCode to i8*), i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Huffmancodebits = private global [24 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Huffmancodebits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3171631047076351643, i64 430153032635, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i32 0, i32 0), i8* null, i8* null, i32 24, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_CRC_BF_addEntry = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_CRC_BF_addEntry = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9109228268654217112, i64 41122367911, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_CRC_BF_addEntry, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [156 x i8] c"\E2\01\98\01x\DA]\CE\C1\0A\C3 \0C\06`|\A1A\D9mG\BB\95\09\EBe{\80\90V]\05\8DE\E3\A1o?e\C3\C3.\81|\FC\E4\CF^x>\A4\E3,\94R`c\0A\C8\B0\D4\9D\93\C1 8\EC\C3\C9\FB\8B\A15j\F3r\DA(\B2\F1\8FgttE\C6\CE:U\01G\1C\01iu\DEc:@\B7D+\99|\C9\9B\EC\15\B8\E4\9A\D2\90\DD\9B\C4\E3\0C[\B16 A\BB\9C\EA,\C4\83\B8\7Fq\AC\D6[~\D6r\ED\E1\EE\E3s\049\01j}#N\C7\07\FE\B2R\EF", section "__llvm_prf_names"
@llvm.used = appending global [12 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_putMyBits to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_III_format_bitstream to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_encodeSideInfo to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_encodeMainData to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_drain_into_ancillary_data to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_III_FlushBitstream to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_abs_and_sign to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_L3_huffman_coder_count1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_HuffmanCode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Huffmancodebits to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_CRC_BF_addEntry to i8*), i8* getelementptr inbounds ([156 x i8], [156 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @putMyBits(i32, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_putMyBits, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_putMyBits, i64 0, i64 0)
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  %6 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** @bs, align 8
  %7 = load i32, i32* %4, align 4
  %8 = load i32, i32* %5, align 4
  call void @putbits(%struct.bit_stream_struc* %6, i32 %7, i32 %8)
  ret void
}

declare void @putbits(%struct.bit_stream_struc*, i32, i32) #1

; Function Attrs: nounwind uwtable
define void @III_format_bitstream(%struct.lame_global_flags*, i32, [2 x [576 x i32]]*, %struct.III_side_info_t*, [2 x %struct.III_scalefac_t]*, %struct.bit_stream_struc*) #0 {
  %7 = alloca %struct.lame_global_flags*, align 8
  %8 = alloca i32, align 4
  %9 = alloca [2 x [576 x i32]]*, align 8
  %10 = alloca %struct.III_side_info_t*, align 8
  %11 = alloca [2 x %struct.III_scalefac_t]*, align 8
  %12 = alloca %struct.bit_stream_struc*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %7, align 8
  store i32 %1, i32* %8, align 4
  store [2 x [576 x i32]]* %2, [2 x [576 x i32]]** %9, align 8
  store %struct.III_side_info_t* %3, %struct.III_side_info_t** %10, align 8
  store [2 x %struct.III_scalefac_t]* %4, [2 x %struct.III_scalefac_t]** %11, align 8
  store %struct.bit_stream_struc* %5, %struct.bit_stream_struc** %12, align 8
  %15 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** %12, align 8
  store %struct.bit_stream_struc* %15, %struct.bit_stream_struc** @bs, align 8
  %16 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %17 = icmp eq %struct.BF_FrameData* %16, null
  br i1 %17, label %18, label %29

; <label>:18:                                     ; preds = %6
  %19 = call noalias i8* @calloc(i64 1, i64 184) #4
  %20 = bitcast i8* %19 to %struct.BF_FrameData*
  store %struct.BF_FrameData* %20, %struct.BF_FrameData** @frameData, align 8
  %21 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %22 = icmp ne %struct.BF_FrameData* %21, null
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 8)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 8)
  br label %28

; <label>:25:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 10)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 10)
  call void @__assert_fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 73, i8* getelementptr inbounds ([131 x i8], [131 x i8]* @__PRETTY_FUNCTION__.III_format_bitstream, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %28

; <label>:28:                                     ; preds = %27, %23
  br label %29

; <label>:29:                                     ; preds = %28, %6
  %30 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** @frameResults, align 8
  %31 = icmp eq %struct.BF_FrameResults* %30, null
  br i1 %31, label %32, label %43

; <label>:32:                                     ; preds = %29
  %33 = call noalias i8* @calloc(i64 1, i64 12) #4
  %34 = bitcast i8* %33 to %struct.BF_FrameResults*
  store %struct.BF_FrameResults* %34, %struct.BF_FrameResults** @frameResults, align 8
  %35 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** @frameResults, align 8
  %36 = icmp ne %struct.BF_FrameResults* %35, null
  br i1 %36, label %37, label %38

; <label>:37:                                     ; preds = %32
  br label %41

; <label>:38:                                     ; preds = %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 11)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 11)
  call void @__assert_fail(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 78, i8* getelementptr inbounds ([131 x i8], [131 x i8]* @__PRETTY_FUNCTION__.III_format_bitstream, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %41

; <label>:41:                                     ; preds = %40, %37
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 9)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 9)
  br label %43

; <label>:43:                                     ; preds = %41, %29
  %44 = load i32, i32* @PartHoldersInitialized, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %110, label %46

; <label>:46:                                     ; preds = %43
  %47 = call %struct.BF_PartHolder* @BF_newPartHolder(i32 14)
  store %struct.BF_PartHolder* %47, %struct.BF_PartHolder** @headerPH, align 8
  %48 = call %struct.BF_PartHolder* @BF_newPartHolder(i32 12)
  store %struct.BF_PartHolder* %48, %struct.BF_PartHolder** @frameSIPH, align 8
  store i32 0, i32* %14, align 4
  br label %49

; <label>:49:                                     ; preds = %57, %46
  %50 = load i32, i32* %14, align 4
  %51 = icmp slt i32 %50, 2
  br i1 %51, label %52, label %61

; <label>:52:                                     ; preds = %49
  %53 = call %struct.BF_PartHolder* @BF_newPartHolder(i32 8)
  %54 = load i32, i32* %14, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* @channelSIPH, i64 0, i64 %55
  store %struct.BF_PartHolder* %53, %struct.BF_PartHolder** %56, align 8
  br label %57

; <label>:57:                                     ; preds = %52
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 3)
  %58 = add i64 %pgocount4, 1
  store i64 %58, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 3)
  %59 = load i32, i32* %14, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %14, align 4
  br label %49

; <label>:61:                                     ; preds = %49
  store i32 0, i32* %13, align 4
  br label %62

; <label>:62:                                     ; preds = %103, %61
  %63 = load i32, i32* %13, align 4
  %64 = icmp slt i32 %63, 2
  br i1 %64, label %65, label %107

; <label>:65:                                     ; preds = %62
  store i32 0, i32* %14, align 4
  br label %66

; <label>:66:                                     ; preds = %98, %65
  %67 = load i32, i32* %14, align 4
  %68 = icmp slt i32 %67, 2
  br i1 %68, label %69, label %102

; <label>:69:                                     ; preds = %66
  %70 = call %struct.BF_PartHolder* @BF_newPartHolder(i32 32)
  %71 = load i32, i32* %13, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @spectrumSIPH, i64 0, i64 %72
  %74 = load i32, i32* %14, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %73, i64 0, i64 %75
  store %struct.BF_PartHolder* %70, %struct.BF_PartHolder** %76, align 8
  %77 = call %struct.BF_PartHolder* @BF_newPartHolder(i32 64)
  %78 = load i32, i32* %13, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @scaleFactorsPH, i64 0, i64 %79
  %81 = load i32, i32* %14, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %80, i64 0, i64 %82
  store %struct.BF_PartHolder* %77, %struct.BF_PartHolder** %83, align 8
  %84 = call %struct.BF_PartHolder* @BF_newPartHolder(i32 576)
  %85 = load i32, i32* %13, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @codedDataPH, i64 0, i64 %86
  %88 = load i32, i32* %14, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %87, i64 0, i64 %89
  store %struct.BF_PartHolder* %84, %struct.BF_PartHolder** %90, align 8
  %91 = call %struct.BF_PartHolder* @BF_newPartHolder(i32 4)
  %92 = load i32, i32* %13, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @userSpectrumPH, i64 0, i64 %93
  %95 = load i32, i32* %14, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %94, i64 0, i64 %96
  store %struct.BF_PartHolder* %91, %struct.BF_PartHolder** %97, align 8
  br label %98

; <label>:98:                                     ; preds = %69
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 0)
  %99 = add i64 %pgocount5, 1
  store i64 %99, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 0)
  %100 = load i32, i32* %14, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, i32* %14, align 4
  br label %66

; <label>:102:                                    ; preds = %66
  br label %103

; <label>:103:                                    ; preds = %102
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 4)
  %104 = add i64 %pgocount6, 1
  store i64 %104, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 4)
  %105 = load i32, i32* %13, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, i32* %13, align 4
  br label %62

; <label>:107:                                    ; preds = %62
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 7)
  %108 = add i64 %pgocount7, 1
  store i64 %108, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 7)
  %109 = call %struct.BF_PartHolder* @BF_newPartHolder(i32 8)
  store %struct.BF_PartHolder* %109, %struct.BF_PartHolder** @userFrameDataPH, align 8
  store i32 1, i32* @PartHoldersInitialized, align 4
  br label %110

; <label>:110:                                    ; preds = %107, %43
  %111 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %112 = load %struct.III_side_info_t*, %struct.III_side_info_t** %10, align 8
  %113 = call i32 @encodeSideInfo(%struct.lame_global_flags* %111, %struct.III_side_info_t* %112)
  %114 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %115 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %9, align 8
  %116 = load %struct.III_side_info_t*, %struct.III_side_info_t** %10, align 8
  %117 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %11, align 8
  call void @encodeMainData(%struct.lame_global_flags* %114, [2 x [576 x i32]]* %115, %struct.III_side_info_t* %116, [2 x %struct.III_scalefac_t]* %117)
  %118 = load %struct.III_side_info_t*, %struct.III_side_info_t** %10, align 8
  %119 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %118, i32 0, i32 2
  %120 = load i32, i32* %119, align 8
  call void @drain_into_ancillary_data(i32 %120)
  %121 = load i32, i32* %8, align 4
  %122 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %123 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %122, i32 0, i32 0
  store i32 %121, i32* %123, align 8
  %124 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %125 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %124, i32 0, i32 45
  %126 = load i32, i32* %125, align 8
  %127 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %128 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %127, i32 0, i32 1
  store i32 %126, i32* %128, align 4
  %129 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %130 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %129, i32 0, i32 46
  %131 = load i32, i32* %130, align 4
  %132 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %133 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %132, i32 0, i32 2
  store i32 %131, i32* %133, align 8
  %134 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %135 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %134, i32 0, i32 1
  %136 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %135, align 8
  %137 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %138 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %137, i32 0, i32 3
  store %struct.BF_BitstreamPart* %136, %struct.BF_BitstreamPart** %138, align 8
  %139 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @frameSIPH, align 8
  %140 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %139, i32 0, i32 1
  %141 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %140, align 8
  %142 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %143 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %142, i32 0, i32 4
  store %struct.BF_BitstreamPart* %141, %struct.BF_BitstreamPart** %143, align 8
  store i32 0, i32* %14, align 4
  br label %144

; <label>:144:                                    ; preds = %163, %110
  %145 = load i32, i32* %14, align 4
  %146 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %147 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %146, i32 0, i32 46
  %148 = load i32, i32* %147, align 4
  %149 = icmp slt i32 %145, %148
  br i1 %149, label %150, label %166

; <label>:150:                                    ; preds = %144
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 1)
  %151 = add i64 %pgocount8, 1
  store i64 %151, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 1)
  %152 = load i32, i32* %14, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* @channelSIPH, i64 0, i64 %153
  %155 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %154, align 8
  %156 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %155, i32 0, i32 1
  %157 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %156, align 8
  %158 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %159 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %158, i32 0, i32 5
  %160 = load i32, i32* %14, align 4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [2 x %struct.BF_BitstreamPart*], [2 x %struct.BF_BitstreamPart*]* %159, i64 0, i64 %161
  store %struct.BF_BitstreamPart* %157, %struct.BF_BitstreamPart** %162, align 8
  br label %163

; <label>:163:                                    ; preds = %150
  %164 = load i32, i32* %14, align 4
  %165 = add nsw i32 %164, 1
  store i32 %165, i32* %14, align 4
  br label %144

; <label>:166:                                    ; preds = %144
  store i32 0, i32* %13, align 4
  br label %167

; <label>:167:                                    ; preds = %255, %166
  %168 = load i32, i32* %13, align 4
  %169 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %170 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %169, i32 0, i32 45
  %171 = load i32, i32* %170, align 8
  %172 = icmp slt i32 %168, %171
  br i1 %172, label %173, label %258

; <label>:173:                                    ; preds = %167
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 2)
  %174 = add i64 %pgocount9, 1
  store i64 %174, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 2)
  store i32 0, i32* %14, align 4
  br label %175

; <label>:175:                                    ; preds = %251, %173
  %176 = load i32, i32* %14, align 4
  %177 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %178 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %177, i32 0, i32 46
  %179 = load i32, i32* %178, align 4
  %180 = icmp slt i32 %176, %179
  br i1 %180, label %181, label %254

; <label>:181:                                    ; preds = %175
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 6)
  %182 = add i64 %pgocount10, 1
  store i64 %182, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 6)
  %183 = load i32, i32* %13, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @spectrumSIPH, i64 0, i64 %184
  %186 = load i32, i32* %14, align 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %185, i64 0, i64 %187
  %189 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %188, align 8
  %190 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %189, i32 0, i32 1
  %191 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %190, align 8
  %192 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %193 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %192, i32 0, i32 6
  %194 = load i32, i32* %13, align 4
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds [2 x [2 x %struct.BF_BitstreamPart*]], [2 x [2 x %struct.BF_BitstreamPart*]]* %193, i64 0, i64 %195
  %197 = load i32, i32* %14, align 4
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [2 x %struct.BF_BitstreamPart*], [2 x %struct.BF_BitstreamPart*]* %196, i64 0, i64 %198
  store %struct.BF_BitstreamPart* %191, %struct.BF_BitstreamPart** %199, align 8
  %200 = load i32, i32* %13, align 4
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @scaleFactorsPH, i64 0, i64 %201
  %203 = load i32, i32* %14, align 4
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %202, i64 0, i64 %204
  %206 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %205, align 8
  %207 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %206, i32 0, i32 1
  %208 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %207, align 8
  %209 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %210 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %209, i32 0, i32 7
  %211 = load i32, i32* %13, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds [2 x [2 x %struct.BF_BitstreamPart*]], [2 x [2 x %struct.BF_BitstreamPart*]]* %210, i64 0, i64 %212
  %214 = load i32, i32* %14, align 4
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds [2 x %struct.BF_BitstreamPart*], [2 x %struct.BF_BitstreamPart*]* %213, i64 0, i64 %215
  store %struct.BF_BitstreamPart* %208, %struct.BF_BitstreamPart** %216, align 8
  %217 = load i32, i32* %13, align 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @codedDataPH, i64 0, i64 %218
  %220 = load i32, i32* %14, align 4
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %219, i64 0, i64 %221
  %223 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %222, align 8
  %224 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %223, i32 0, i32 1
  %225 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %224, align 8
  %226 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %227 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %226, i32 0, i32 8
  %228 = load i32, i32* %13, align 4
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds [2 x [2 x %struct.BF_BitstreamPart*]], [2 x [2 x %struct.BF_BitstreamPart*]]* %227, i64 0, i64 %229
  %231 = load i32, i32* %14, align 4
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds [2 x %struct.BF_BitstreamPart*], [2 x %struct.BF_BitstreamPart*]* %230, i64 0, i64 %232
  store %struct.BF_BitstreamPart* %225, %struct.BF_BitstreamPart** %233, align 8
  %234 = load i32, i32* %13, align 4
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @userSpectrumPH, i64 0, i64 %235
  %237 = load i32, i32* %14, align 4
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %236, i64 0, i64 %238
  %240 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %239, align 8
  %241 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %240, i32 0, i32 1
  %242 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %241, align 8
  %243 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %244 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %243, i32 0, i32 9
  %245 = load i32, i32* %13, align 4
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds [2 x [2 x %struct.BF_BitstreamPart*]], [2 x [2 x %struct.BF_BitstreamPart*]]* %244, i64 0, i64 %246
  %248 = load i32, i32* %14, align 4
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds [2 x %struct.BF_BitstreamPart*], [2 x %struct.BF_BitstreamPart*]* %247, i64 0, i64 %249
  store %struct.BF_BitstreamPart* %242, %struct.BF_BitstreamPart** %250, align 8
  br label %251

; <label>:251:                                    ; preds = %181
  %252 = load i32, i32* %14, align 4
  %253 = add nsw i32 %252, 1
  store i32 %253, i32* %14, align 4
  br label %175

; <label>:254:                                    ; preds = %175
  br label %255

; <label>:255:                                    ; preds = %254
  %256 = load i32, i32* %13, align 4
  %257 = add nsw i32 %256, 1
  store i32 %257, i32* %13, align 4
  br label %167

; <label>:258:                                    ; preds = %167
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 5)
  %259 = add i64 %pgocount11, 1
  store i64 %259, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_III_format_bitstream, i64 0, i64 5)
  %260 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @userFrameDataPH, align 8
  %261 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %260, i32 0, i32 1
  %262 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %261, align 8
  %263 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %264 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %263, i32 0, i32 10
  store %struct.BF_BitstreamPart* %262, %struct.BF_BitstreamPart** %264, align 8
  %265 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %266 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** @frameResults, align 8
  call void @BF_BitstreamFrame(%struct.BF_FrameData* %265, %struct.BF_FrameResults* %266)
  %267 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** @frameResults, align 8
  %268 = getelementptr inbounds %struct.BF_FrameResults, %struct.BF_FrameResults* %267, i32 0, i32 2
  %269 = load i32, i32* %268, align 4
  %270 = load %struct.III_side_info_t*, %struct.III_side_info_t** %10, align 8
  %271 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %270, i32 0, i32 0
  store i32 %269, i32* %271, align 8
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

declare %struct.BF_PartHolder* @BF_newPartHolder(i32) #1

; Function Attrs: nounwind uwtable
define internal i32 @encodeSideInfo(%struct.lame_global_flags*, %struct.III_side_info_t*) #0 {
  %3 = alloca %struct.lame_global_flags*, align 8
  %4 = alloca %struct.III_side_info_t*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.BF_PartHolder**, align 8
  %12 = alloca %struct.BF_PartHolder**, align 8
  %13 = alloca %struct.gr_info*, align 8
  %14 = alloca %struct.BF_PartHolder**, align 8
  %15 = alloca %struct.gr_info*, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %3, align 8
  store %struct.III_side_info_t* %1, %struct.III_side_info_t** %4, align 8
  store i32 65535, i32* @crc, align 4
  %16 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %17 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %16, i32 0, i32 1
  %18 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %17, align 8
  %19 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %18, i32 0, i32 0
  store i32 0, i32* %19, align 8
  %20 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %21 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %20, i32 4095, i32 12)
  store %struct.BF_PartHolder* %21, %struct.BF_PartHolder** @headerPH, align 8
  %22 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %23 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %24 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %23, i32 0, i32 43
  %25 = load i32, i32* %24, align 8
  %26 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %22, i32 %25, i32 1)
  store %struct.BF_PartHolder* %26, %struct.BF_PartHolder** @headerPH, align 8
  %27 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %28 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %27, i32 1, i32 2)
  store %struct.BF_PartHolder* %28, %struct.BF_PartHolder** @headerPH, align 8
  %29 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %30 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %31 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %30, i32 0, i32 14
  %32 = load i32, i32* %31, align 4
  %33 = icmp ne i32 %32, 0
  %34 = xor i1 %33, true
  %35 = zext i1 %34 to i32
  %36 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %29, i32 %35, i32 1)
  store %struct.BF_PartHolder* %36, %struct.BF_PartHolder** @headerPH, align 8
  %37 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %38 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %39 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %38, i32 0, i32 50
  %40 = load i32, i32* %39, align 4
  %41 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %37, i32 %40, i32 4)
  store %struct.BF_PartHolder* %41, %struct.BF_PartHolder** @headerPH, align 8
  %42 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %43 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %44 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %43, i32 0, i32 51
  %45 = load i32, i32* %44, align 8
  %46 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %42, i32 %45, i32 2)
  store %struct.BF_PartHolder* %46, %struct.BF_PartHolder** @headerPH, align 8
  %47 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %48 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %49 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %48, i32 0, i32 44
  %50 = load i32, i32* %49, align 4
  %51 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %47, i32 %50, i32 1)
  store %struct.BF_PartHolder* %51, %struct.BF_PartHolder** @headerPH, align 8
  %52 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %53 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %54 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %53, i32 0, i32 16
  %55 = load i32, i32* %54, align 4
  %56 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %52, i32 %55, i32 1)
  store %struct.BF_PartHolder* %56, %struct.BF_PartHolder** @headerPH, align 8
  %57 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %58 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %59 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %58, i32 0, i32 8
  %60 = load i32, i32* %59, align 4
  %61 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %57, i32 %60, i32 2)
  store %struct.BF_PartHolder* %61, %struct.BF_PartHolder** @headerPH, align 8
  %62 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %63 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %64 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %63, i32 0, i32 52
  %65 = load i32, i32* %64, align 4
  %66 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %62, i32 %65, i32 2)
  store %struct.BF_PartHolder* %66, %struct.BF_PartHolder** @headerPH, align 8
  %67 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %68 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %69 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %68, i32 0, i32 12
  %70 = load i32, i32* %69, align 4
  %71 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %67, i32 %70, i32 1)
  store %struct.BF_PartHolder* %71, %struct.BF_PartHolder** @headerPH, align 8
  %72 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %73 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %74 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %73, i32 0, i32 13
  %75 = load i32, i32* %74, align 8
  %76 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %72, i32 %75, i32 1)
  store %struct.BF_PartHolder* %76, %struct.BF_PartHolder** @headerPH, align 8
  %77 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %78 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %79 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %78, i32 0, i32 38
  %80 = load i32, i32* %79, align 4
  %81 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %77, i32 %80, i32 2)
  store %struct.BF_PartHolder* %81, %struct.BF_PartHolder** @headerPH, align 8
  store i32 32, i32* %10, align 4
  %82 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @frameSIPH, align 8
  %83 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %82, i32 0, i32 1
  %84 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %83, align 8
  %85 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %84, i32 0, i32 0
  store i32 0, i32* %85, align 8
  store i32 0, i32* %6, align 4
  br label %86

; <label>:86:                                     ; preds = %100, %2
  %87 = load i32, i32* %6, align 4
  %88 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %89 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %88, i32 0, i32 46
  %90 = load i32, i32* %89, align 4
  %91 = icmp slt i32 %87, %90
  br i1 %91, label %92, label %104

; <label>:92:                                     ; preds = %86
  %93 = load i32, i32* %6, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* @channelSIPH, i64 0, i64 %94
  %96 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %95, align 8
  %97 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %96, i32 0, i32 1
  %98 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %97, align 8
  %99 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %98, i32 0, i32 0
  store i32 0, i32* %99, align 8
  br label %100

; <label>:100:                                    ; preds = %92
  %pgocount = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 10)
  %101 = add i64 %pgocount, 1
  store i64 %101, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 10)
  %102 = load i32, i32* %6, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, i32* %6, align 4
  br label %86

; <label>:104:                                    ; preds = %86
  store i32 0, i32* %5, align 4
  br label %105

; <label>:105:                                    ; preds = %134, %104
  %106 = load i32, i32* %5, align 4
  %107 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %108 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %107, i32 0, i32 45
  %109 = load i32, i32* %108, align 8
  %110 = icmp slt i32 %106, %109
  br i1 %110, label %111, label %138

; <label>:111:                                    ; preds = %105
  store i32 0, i32* %6, align 4
  br label %112

; <label>:112:                                    ; preds = %130, %111
  %113 = load i32, i32* %6, align 4
  %114 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %115 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %114, i32 0, i32 46
  %116 = load i32, i32* %115, align 4
  %117 = icmp slt i32 %113, %116
  br i1 %117, label %118, label %133

; <label>:118:                                    ; preds = %112
  %pgocount1 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 3)
  %119 = add i64 %pgocount1, 1
  store i64 %119, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 3)
  %120 = load i32, i32* %5, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @spectrumSIPH, i64 0, i64 %121
  %123 = load i32, i32* %6, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %122, i64 0, i64 %124
  %126 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %125, align 8
  %127 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %126, i32 0, i32 1
  %128 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %127, align 8
  %129 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %128, i32 0, i32 0
  store i32 0, i32* %129, align 8
  br label %130

; <label>:130:                                    ; preds = %118
  %131 = load i32, i32* %6, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, i32* %6, align 4
  br label %112

; <label>:133:                                    ; preds = %112
  br label %134

; <label>:134:                                    ; preds = %133
  %pgocount2 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 11)
  %135 = add i64 %pgocount2, 1
  store i64 %135, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 11)
  %136 = load i32, i32* %5, align 4
  %137 = add nsw i32 %136, 1
  store i32 %137, i32* %5, align 4
  br label %105

; <label>:138:                                    ; preds = %105
  %139 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %140 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %139, i32 0, i32 43
  %141 = load i32, i32* %140, align 8
  %142 = icmp eq i32 %141, 1
  br i1 %142, label %143, label %412

; <label>:143:                                    ; preds = %138
  %144 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @frameSIPH, align 8
  %145 = load %struct.III_side_info_t*, %struct.III_side_info_t** %4, align 8
  %146 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %145, i32 0, i32 0
  %147 = load i32, i32* %146, align 8
  %148 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %144, i32 %147, i32 9)
  store %struct.BF_PartHolder* %148, %struct.BF_PartHolder** @frameSIPH, align 8
  %149 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %150 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %149, i32 0, i32 46
  %151 = load i32, i32* %150, align 4
  %152 = icmp eq i32 %151, 2
  br i1 %152, label %153, label %159

; <label>:153:                                    ; preds = %143
  %154 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @frameSIPH, align 8
  %155 = load %struct.III_side_info_t*, %struct.III_side_info_t** %4, align 8
  %156 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %155, i32 0, i32 1
  %157 = load i32, i32* %156, align 4
  %158 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %154, i32 %157, i32 3)
  store %struct.BF_PartHolder* %158, %struct.BF_PartHolder** @frameSIPH, align 8
  br label %166

; <label>:159:                                    ; preds = %143
  %pgocount3 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 17)
  %160 = add i64 %pgocount3, 1
  store i64 %160, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 17)
  %161 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @frameSIPH, align 8
  %162 = load %struct.III_side_info_t*, %struct.III_side_info_t** %4, align 8
  %163 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %162, i32 0, i32 1
  %164 = load i32, i32* %163, align 4
  %165 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %161, i32 %164, i32 5)
  store %struct.BF_PartHolder* %165, %struct.BF_PartHolder** @frameSIPH, align 8
  br label %166

; <label>:166:                                    ; preds = %159, %153
  store i32 0, i32* %6, align 4
  br label %167

; <label>:167:                                    ; preds = %200, %166
  %168 = load i32, i32* %6, align 4
  %169 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %170 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %169, i32 0, i32 46
  %171 = load i32, i32* %170, align 4
  %172 = icmp slt i32 %168, %171
  br i1 %172, label %173, label %203

; <label>:173:                                    ; preds = %167
  %pgocount4 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 12)
  %174 = add i64 %pgocount4, 1
  store i64 %174, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 12)
  store i32 0, i32* %7, align 4
  br label %175

; <label>:175:                                    ; preds = %196, %173
  %176 = load i32, i32* %7, align 4
  %177 = icmp slt i32 %176, 4
  br i1 %177, label %178, label %199

; <label>:178:                                    ; preds = %175
  %pgocount5 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 4)
  %179 = add i64 %pgocount5, 1
  store i64 %179, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 4)
  %180 = load i32, i32* %6, align 4
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* @channelSIPH, i64 0, i64 %181
  store %struct.BF_PartHolder** %182, %struct.BF_PartHolder*** %11, align 8
  %183 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %11, align 8
  %184 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %183, align 8
  %185 = load %struct.III_side_info_t*, %struct.III_side_info_t** %4, align 8
  %186 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %185, i32 0, i32 3
  %187 = load i32, i32* %6, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [2 x [4 x i32]], [2 x [4 x i32]]* %186, i64 0, i64 %188
  %190 = load i32, i32* %7, align 4
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds [4 x i32], [4 x i32]* %189, i64 0, i64 %191
  %193 = load i32, i32* %192, align 4
  %194 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %184, i32 %193, i32 1)
  %195 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %11, align 8
  store %struct.BF_PartHolder* %194, %struct.BF_PartHolder** %195, align 8
  br label %196

; <label>:196:                                    ; preds = %178
  %197 = load i32, i32* %7, align 4
  %198 = add nsw i32 %197, 1
  store i32 %198, i32* %7, align 4
  br label %175

; <label>:199:                                    ; preds = %175
  br label %200

; <label>:200:                                    ; preds = %199
  %201 = load i32, i32* %6, align 4
  %202 = add nsw i32 %201, 1
  store i32 %202, i32* %6, align 4
  br label %167

; <label>:203:                                    ; preds = %167
  store i32 0, i32* %5, align 4
  br label %204

; <label>:204:                                    ; preds = %394, %203
  %205 = load i32, i32* %5, align 4
  %206 = icmp slt i32 %205, 2
  br i1 %206, label %207, label %398

; <label>:207:                                    ; preds = %204
  store i32 0, i32* %6, align 4
  br label %208

; <label>:208:                                    ; preds = %390, %207
  %209 = load i32, i32* %6, align 4
  %210 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %211 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %210, i32 0, i32 46
  %212 = load i32, i32* %211, align 4
  %213 = icmp slt i32 %209, %212
  br i1 %213, label %214, label %393

; <label>:214:                                    ; preds = %208
  %215 = load i32, i32* %5, align 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @spectrumSIPH, i64 0, i64 %216
  %218 = load i32, i32* %6, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %217, i64 0, i64 %219
  store %struct.BF_PartHolder** %220, %struct.BF_PartHolder*** %12, align 8
  %221 = load %struct.III_side_info_t*, %struct.III_side_info_t** %4, align 8
  %222 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %221, i32 0, i32 4
  %223 = load i32, i32* %5, align 4
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* %222, i64 0, i64 %224
  %226 = getelementptr inbounds %struct.anon, %struct.anon* %225, i32 0, i32 0
  %227 = load i32, i32* %6, align 4
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %226, i64 0, i64 %228
  %230 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %229, i32 0, i32 0
  store %struct.gr_info* %230, %struct.gr_info** %13, align 8
  %231 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  %232 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %231, align 8
  %233 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %234 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %233, i32 0, i32 0
  %235 = load i32, i32* %234, align 8
  %236 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %232, i32 %235, i32 12)
  %237 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  store %struct.BF_PartHolder* %236, %struct.BF_PartHolder** %237, align 8
  %238 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  %239 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %238, align 8
  %240 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %241 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %240, i32 0, i32 1
  %242 = load i32, i32* %241, align 4
  %243 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %239, i32 %242, i32 9)
  %244 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  store %struct.BF_PartHolder* %243, %struct.BF_PartHolder** %244, align 8
  %245 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  %246 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %245, align 8
  %247 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %248 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %247, i32 0, i32 3
  %249 = load i32, i32* %248, align 4
  %250 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %246, i32 %249, i32 8)
  %251 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  store %struct.BF_PartHolder* %250, %struct.BF_PartHolder** %251, align 8
  %252 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  %253 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %252, align 8
  %254 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %255 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %254, i32 0, i32 4
  %256 = load i32, i32* %255, align 8
  %257 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %253, i32 %256, i32 4)
  %258 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  store %struct.BF_PartHolder* %257, %struct.BF_PartHolder** %258, align 8
  %259 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  %260 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %259, align 8
  %261 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %262 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %261, i32 0, i32 5
  %263 = load i32, i32* %262, align 4
  %264 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %260, i32 %263, i32 1)
  %265 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  store %struct.BF_PartHolder* %264, %struct.BF_PartHolder** %265, align 8
  %266 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %267 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %266, i32 0, i32 5
  %268 = load i32, i32* %267, align 4
  %269 = icmp ne i32 %268, 0
  br i1 %269, label %270, label %324

; <label>:270:                                    ; preds = %214
  %271 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  %272 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %271, align 8
  %273 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %274 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %273, i32 0, i32 6
  %275 = load i32, i32* %274, align 8
  %276 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %272, i32 %275, i32 2)
  %277 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  store %struct.BF_PartHolder* %276, %struct.BF_PartHolder** %277, align 8
  %278 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  %279 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %278, align 8
  %280 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %281 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %280, i32 0, i32 7
  %282 = load i32, i32* %281, align 4
  %283 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %279, i32 %282, i32 1)
  %284 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  store %struct.BF_PartHolder* %283, %struct.BF_PartHolder** %284, align 8
  store i32 0, i32* %8, align 4
  br label %285

; <label>:285:                                    ; preds = %299, %270
  %286 = load i32, i32* %8, align 4
  %287 = icmp slt i32 %286, 2
  br i1 %287, label %288, label %303

; <label>:288:                                    ; preds = %285
  %289 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  %290 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %289, align 8
  %291 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %292 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %291, i32 0, i32 8
  %293 = load i32, i32* %8, align 4
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds [3 x i32], [3 x i32]* %292, i64 0, i64 %294
  %296 = load i32, i32* %295, align 4
  %297 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %290, i32 %296, i32 5)
  %298 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  store %struct.BF_PartHolder* %297, %struct.BF_PartHolder** %298, align 8
  br label %299

; <label>:299:                                    ; preds = %288
  %pgocount6 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 0)
  %300 = add i64 %pgocount6, 1
  store i64 %300, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 0)
  %301 = load i32, i32* %8, align 4
  %302 = add nsw i32 %301, 1
  store i32 %302, i32* %8, align 4
  br label %285

; <label>:303:                                    ; preds = %285
  store i32 0, i32* %9, align 4
  br label %304

; <label>:304:                                    ; preds = %318, %303
  %305 = load i32, i32* %9, align 4
  %306 = icmp slt i32 %305, 3
  br i1 %306, label %307, label %322

; <label>:307:                                    ; preds = %304
  %308 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  %309 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %308, align 8
  %310 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %311 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %310, i32 0, i32 9
  %312 = load i32, i32* %9, align 4
  %313 = sext i32 %312 to i64
  %314 = getelementptr inbounds [3 x i32], [3 x i32]* %311, i64 0, i64 %313
  %315 = load i32, i32* %314, align 4
  %316 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %309, i32 %315, i32 3)
  %317 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  store %struct.BF_PartHolder* %316, %struct.BF_PartHolder** %317, align 8
  br label %318

; <label>:318:                                    ; preds = %307
  %pgocount7 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 1)
  %319 = add i64 %pgocount7, 1
  store i64 %319, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 1)
  %320 = load i32, i32* %9, align 4
  %321 = add nsw i32 %320, 1
  store i32 %321, i32* %9, align 4
  br label %304

; <label>:322:                                    ; preds = %304
  %pgocount8 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 7)
  %323 = add i64 %pgocount8, 1
  store i64 %323, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 7)
  br label %368

; <label>:324:                                    ; preds = %214
  %325 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %326 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %325, i32 0, i32 6
  %327 = load i32, i32* %326, align 8
  %328 = icmp eq i32 %327, 0
  br i1 %328, label %329, label %330

; <label>:329:                                    ; preds = %324
  br label %333

; <label>:330:                                    ; preds = %324
  %pgocount9 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 23)
  %331 = add i64 %pgocount9, 1
  store i64 %331, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 23)
  call void @__assert_fail(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 380, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__PRETTY_FUNCTION__.encodeSideInfo, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %333

; <label>:333:                                    ; preds = %332, %329
  store i32 0, i32* %8, align 4
  br label %334

; <label>:334:                                    ; preds = %348, %333
  %335 = load i32, i32* %8, align 4
  %336 = icmp slt i32 %335, 3
  br i1 %336, label %337, label %352

; <label>:337:                                    ; preds = %334
  %338 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  %339 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %338, align 8
  %340 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %341 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %340, i32 0, i32 8
  %342 = load i32, i32* %8, align 4
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds [3 x i32], [3 x i32]* %341, i64 0, i64 %343
  %345 = load i32, i32* %344, align 4
  %346 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %339, i32 %345, i32 5)
  %347 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  store %struct.BF_PartHolder* %346, %struct.BF_PartHolder** %347, align 8
  br label %348

; <label>:348:                                    ; preds = %337
  %pgocount10 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 2)
  %349 = add i64 %pgocount10, 1
  store i64 %349, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 2)
  %350 = load i32, i32* %8, align 4
  %351 = add nsw i32 %350, 1
  store i32 %351, i32* %8, align 4
  br label %334

; <label>:352:                                    ; preds = %334
  %pgocount11 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 9)
  %353 = add i64 %pgocount11, 1
  store i64 %353, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 9)
  %354 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  %355 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %354, align 8
  %356 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %357 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %356, i32 0, i32 10
  %358 = load i32, i32* %357, align 8
  %359 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %355, i32 %358, i32 4)
  %360 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  store %struct.BF_PartHolder* %359, %struct.BF_PartHolder** %360, align 8
  %361 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  %362 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %361, align 8
  %363 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %364 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %363, i32 0, i32 11
  %365 = load i32, i32* %364, align 4
  %366 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %362, i32 %365, i32 3)
  %367 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  store %struct.BF_PartHolder* %366, %struct.BF_PartHolder** %367, align 8
  br label %368

; <label>:368:                                    ; preds = %352, %322
  %369 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  %370 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %369, align 8
  %371 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %372 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %371, i32 0, i32 12
  %373 = load i32, i32* %372, align 8
  %374 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %370, i32 %373, i32 1)
  %375 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  store %struct.BF_PartHolder* %374, %struct.BF_PartHolder** %375, align 8
  %376 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  %377 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %376, align 8
  %378 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %379 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %378, i32 0, i32 13
  %380 = load i32, i32* %379, align 4
  %381 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %377, i32 %380, i32 1)
  %382 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  store %struct.BF_PartHolder* %381, %struct.BF_PartHolder** %382, align 8
  %383 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  %384 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %383, align 8
  %385 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %386 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %385, i32 0, i32 14
  %387 = load i32, i32* %386, align 8
  %388 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %384, i32 %387, i32 1)
  %389 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %12, align 8
  store %struct.BF_PartHolder* %388, %struct.BF_PartHolder** %389, align 8
  br label %390

; <label>:390:                                    ; preds = %368
  %391 = load i32, i32* %6, align 4
  %392 = add nsw i32 %391, 1
  store i32 %392, i32* %6, align 4
  br label %208

; <label>:393:                                    ; preds = %208
  br label %394

; <label>:394:                                    ; preds = %393
  %pgocount12 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 13)
  %395 = add i64 %pgocount12, 1
  store i64 %395, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 13)
  %396 = load i32, i32* %5, align 4
  %397 = add nsw i32 %396, 1
  store i32 %397, i32* %5, align 4
  br label %204

; <label>:398:                                    ; preds = %204
  %399 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %400 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %399, i32 0, i32 46
  %401 = load i32, i32* %400, align 4
  %402 = icmp eq i32 %401, 2
  br i1 %402, label %403, label %407

; <label>:403:                                    ; preds = %398
  %pgocount13 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 21)
  %404 = add i64 %pgocount13, 1
  store i64 %404, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 21)
  %405 = load i32, i32* %10, align 4
  %406 = add nsw i32 %405, 256
  store i32 %406, i32* %10, align 4
  br label %411

; <label>:407:                                    ; preds = %398
  %pgocount14 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 22)
  %408 = add i64 %pgocount14, 1
  store i64 %408, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 22)
  %409 = load i32, i32* %10, align 4
  %410 = add nsw i32 %409, 136
  store i32 %410, i32* %10, align 4
  br label %411

; <label>:411:                                    ; preds = %407, %403
  br label %619

; <label>:412:                                    ; preds = %138
  %413 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @frameSIPH, align 8
  %414 = load %struct.III_side_info_t*, %struct.III_side_info_t** %4, align 8
  %415 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %414, i32 0, i32 0
  %416 = load i32, i32* %415, align 8
  %417 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %413, i32 %416, i32 8)
  store %struct.BF_PartHolder* %417, %struct.BF_PartHolder** @frameSIPH, align 8
  %418 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %419 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %418, i32 0, i32 46
  %420 = load i32, i32* %419, align 4
  %421 = icmp eq i32 %420, 2
  br i1 %421, label %422, label %428

; <label>:422:                                    ; preds = %412
  %423 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @frameSIPH, align 8
  %424 = load %struct.III_side_info_t*, %struct.III_side_info_t** %4, align 8
  %425 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %424, i32 0, i32 1
  %426 = load i32, i32* %425, align 4
  %427 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %423, i32 %426, i32 2)
  store %struct.BF_PartHolder* %427, %struct.BF_PartHolder** @frameSIPH, align 8
  br label %435

; <label>:428:                                    ; preds = %412
  %pgocount15 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 18)
  %429 = add i64 %pgocount15, 1
  store i64 %429, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 18)
  %430 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @frameSIPH, align 8
  %431 = load %struct.III_side_info_t*, %struct.III_side_info_t** %4, align 8
  %432 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %431, i32 0, i32 1
  %433 = load i32, i32* %432, align 4
  %434 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %430, i32 %433, i32 1)
  store %struct.BF_PartHolder* %434, %struct.BF_PartHolder** @frameSIPH, align 8
  br label %435

; <label>:435:                                    ; preds = %428, %422
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %436

; <label>:436:                                    ; preds = %602, %435
  %437 = load i32, i32* %6, align 4
  %438 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %439 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %438, i32 0, i32 46
  %440 = load i32, i32* %439, align 4
  %441 = icmp slt i32 %437, %440
  br i1 %441, label %442, label %605

; <label>:442:                                    ; preds = %436
  %443 = load i32, i32* %5, align 4
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @spectrumSIPH, i64 0, i64 %444
  %446 = load i32, i32* %6, align 4
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %445, i64 0, i64 %447
  store %struct.BF_PartHolder** %448, %struct.BF_PartHolder*** %14, align 8
  %449 = load %struct.III_side_info_t*, %struct.III_side_info_t** %4, align 8
  %450 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %449, i32 0, i32 4
  %451 = load i32, i32* %5, align 4
  %452 = sext i32 %451 to i64
  %453 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* %450, i64 0, i64 %452
  %454 = getelementptr inbounds %struct.anon, %struct.anon* %453, i32 0, i32 0
  %455 = load i32, i32* %6, align 4
  %456 = sext i32 %455 to i64
  %457 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %454, i64 0, i64 %456
  %458 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %457, i32 0, i32 0
  store %struct.gr_info* %458, %struct.gr_info** %15, align 8
  %459 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %460 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %459, align 8
  %461 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  %462 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %461, i32 0, i32 0
  %463 = load i32, i32* %462, align 8
  %464 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %460, i32 %463, i32 12)
  %465 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %464, %struct.BF_PartHolder** %465, align 8
  %466 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %467 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %466, align 8
  %468 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  %469 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %468, i32 0, i32 1
  %470 = load i32, i32* %469, align 4
  %471 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %467, i32 %470, i32 9)
  %472 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %471, %struct.BF_PartHolder** %472, align 8
  %473 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %474 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %473, align 8
  %475 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  %476 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %475, i32 0, i32 3
  %477 = load i32, i32* %476, align 4
  %478 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %474, i32 %477, i32 8)
  %479 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %478, %struct.BF_PartHolder** %479, align 8
  %480 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %481 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %480, align 8
  %482 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  %483 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %482, i32 0, i32 4
  %484 = load i32, i32* %483, align 8
  %485 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %481, i32 %484, i32 9)
  %486 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %485, %struct.BF_PartHolder** %486, align 8
  %487 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %488 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %487, align 8
  %489 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  %490 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %489, i32 0, i32 5
  %491 = load i32, i32* %490, align 4
  %492 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %488, i32 %491, i32 1)
  %493 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %492, %struct.BF_PartHolder** %493, align 8
  %494 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  %495 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %494, i32 0, i32 5
  %496 = load i32, i32* %495, align 4
  %497 = icmp ne i32 %496, 0
  br i1 %497, label %498, label %552

; <label>:498:                                    ; preds = %442
  %499 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %500 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %499, align 8
  %501 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  %502 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %501, i32 0, i32 6
  %503 = load i32, i32* %502, align 8
  %504 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %500, i32 %503, i32 2)
  %505 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %504, %struct.BF_PartHolder** %505, align 8
  %506 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %507 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %506, align 8
  %508 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  %509 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %508, i32 0, i32 7
  %510 = load i32, i32* %509, align 4
  %511 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %507, i32 %510, i32 1)
  %512 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %511, %struct.BF_PartHolder** %512, align 8
  store i32 0, i32* %8, align 4
  br label %513

; <label>:513:                                    ; preds = %527, %498
  %514 = load i32, i32* %8, align 4
  %515 = icmp slt i32 %514, 2
  br i1 %515, label %516, label %531

; <label>:516:                                    ; preds = %513
  %517 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %518 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %517, align 8
  %519 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  %520 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %519, i32 0, i32 8
  %521 = load i32, i32* %8, align 4
  %522 = sext i32 %521 to i64
  %523 = getelementptr inbounds [3 x i32], [3 x i32]* %520, i64 0, i64 %522
  %524 = load i32, i32* %523, align 4
  %525 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %518, i32 %524, i32 5)
  %526 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %525, %struct.BF_PartHolder** %526, align 8
  br label %527

; <label>:527:                                    ; preds = %516
  %pgocount16 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 5)
  %528 = add i64 %pgocount16, 1
  store i64 %528, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 5)
  %529 = load i32, i32* %8, align 4
  %530 = add nsw i32 %529, 1
  store i32 %530, i32* %8, align 4
  br label %513

; <label>:531:                                    ; preds = %513
  store i32 0, i32* %9, align 4
  br label %532

; <label>:532:                                    ; preds = %546, %531
  %533 = load i32, i32* %9, align 4
  %534 = icmp slt i32 %533, 3
  br i1 %534, label %535, label %550

; <label>:535:                                    ; preds = %532
  %536 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %537 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %536, align 8
  %538 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  %539 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %538, i32 0, i32 9
  %540 = load i32, i32* %9, align 4
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds [3 x i32], [3 x i32]* %539, i64 0, i64 %541
  %543 = load i32, i32* %542, align 4
  %544 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %537, i32 %543, i32 3)
  %545 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %544, %struct.BF_PartHolder** %545, align 8
  br label %546

; <label>:546:                                    ; preds = %535
  %pgocount17 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 6)
  %547 = add i64 %pgocount17, 1
  store i64 %547, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 6)
  %548 = load i32, i32* %9, align 4
  %549 = add nsw i32 %548, 1
  store i32 %549, i32* %9, align 4
  br label %532

; <label>:550:                                    ; preds = %532
  %pgocount18 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 14)
  %551 = add i64 %pgocount18, 1
  store i64 %551, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 14)
  br label %587

; <label>:552:                                    ; preds = %442
  store i32 0, i32* %8, align 4
  br label %553

; <label>:553:                                    ; preds = %567, %552
  %554 = load i32, i32* %8, align 4
  %555 = icmp slt i32 %554, 3
  br i1 %555, label %556, label %571

; <label>:556:                                    ; preds = %553
  %557 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %558 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %557, align 8
  %559 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  %560 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %559, i32 0, i32 8
  %561 = load i32, i32* %8, align 4
  %562 = sext i32 %561 to i64
  %563 = getelementptr inbounds [3 x i32], [3 x i32]* %560, i64 0, i64 %562
  %564 = load i32, i32* %563, align 4
  %565 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %558, i32 %564, i32 5)
  %566 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %565, %struct.BF_PartHolder** %566, align 8
  br label %567

; <label>:567:                                    ; preds = %556
  %pgocount19 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 8)
  %568 = add i64 %pgocount19, 1
  store i64 %568, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 8)
  %569 = load i32, i32* %8, align 4
  %570 = add nsw i32 %569, 1
  store i32 %570, i32* %8, align 4
  br label %553

; <label>:571:                                    ; preds = %553
  %pgocount20 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 15)
  %572 = add i64 %pgocount20, 1
  store i64 %572, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 15)
  %573 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %574 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %573, align 8
  %575 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  %576 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %575, i32 0, i32 10
  %577 = load i32, i32* %576, align 8
  %578 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %574, i32 %577, i32 4)
  %579 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %578, %struct.BF_PartHolder** %579, align 8
  %580 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %581 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %580, align 8
  %582 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  %583 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %582, i32 0, i32 11
  %584 = load i32, i32* %583, align 4
  %585 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %581, i32 %584, i32 3)
  %586 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %585, %struct.BF_PartHolder** %586, align 8
  br label %587

; <label>:587:                                    ; preds = %571, %550
  %588 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %589 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %588, align 8
  %590 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  %591 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %590, i32 0, i32 13
  %592 = load i32, i32* %591, align 4
  %593 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %589, i32 %592, i32 1)
  %594 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %593, %struct.BF_PartHolder** %594, align 8
  %595 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %596 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %595, align 8
  %597 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  %598 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %597, i32 0, i32 14
  %599 = load i32, i32* %598, align 8
  %600 = call %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %596, i32 %599, i32 1)
  %601 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %600, %struct.BF_PartHolder** %601, align 8
  br label %602

; <label>:602:                                    ; preds = %587
  %603 = load i32, i32* %6, align 4
  %604 = add nsw i32 %603, 1
  store i32 %604, i32* %6, align 4
  br label %436

; <label>:605:                                    ; preds = %436
  %606 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %607 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %606, i32 0, i32 46
  %608 = load i32, i32* %607, align 4
  %609 = icmp eq i32 %608, 2
  br i1 %609, label %610, label %614

; <label>:610:                                    ; preds = %605
  %pgocount21 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 19)
  %611 = add i64 %pgocount21, 1
  store i64 %611, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 19)
  %612 = load i32, i32* %10, align 4
  %613 = add nsw i32 %612, 136
  store i32 %613, i32* %10, align 4
  br label %618

; <label>:614:                                    ; preds = %605
  %pgocount22 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 20)
  %615 = add i64 %pgocount22, 1
  store i64 %615, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 20)
  %616 = load i32, i32* %10, align 4
  %617 = add nsw i32 %616, 72
  store i32 %617, i32* %10, align 4
  br label %618

; <label>:618:                                    ; preds = %614, %610
  br label %619

; <label>:619:                                    ; preds = %618, %411
  %620 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %621 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %620, i32 0, i32 14
  %622 = load i32, i32* %621, align 4
  %623 = icmp ne i32 %622, 0
  br i1 %623, label %624, label %631

; <label>:624:                                    ; preds = %619
  %pgocount23 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 16)
  %625 = add i64 %pgocount23, 1
  store i64 %625, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_encodeSideInfo, i64 0, i64 16)
  %626 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %627 = load i32, i32* @crc, align 4
  %628 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %626, i32 %627, i32 16)
  store %struct.BF_PartHolder* %628, %struct.BF_PartHolder** @headerPH, align 8
  %629 = load i32, i32* %10, align 4
  %630 = add nsw i32 %629, 16
  store i32 %630, i32* %10, align 4
  br label %631

; <label>:631:                                    ; preds = %624, %619
  %632 = load i32, i32* %10, align 4
  ret i32 %632
}

; Function Attrs: nounwind uwtable
define internal void @encodeMainData(%struct.lame_global_flags*, [2 x [576 x i32]]*, %struct.III_side_info_t*, [2 x %struct.III_scalefac_t]*) #0 {
  %5 = alloca %struct.lame_global_flags*, align 8
  %6 = alloca [2 x [576 x i32]]*, align 8
  %7 = alloca %struct.III_side_info_t*, align 8
  %8 = alloca [2 x %struct.III_scalefac_t]*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca %struct.BF_PartHolder**, align 8
  %15 = alloca %struct.gr_info*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32*, align 8
  %19 = alloca %struct.BF_PartHolder**, align 8
  %20 = alloca %struct.gr_info*, align 8
  %21 = alloca i32*, align 8
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %5, align 8
  store [2 x [576 x i32]]* %1, [2 x [576 x i32]]** %6, align 8
  store %struct.III_side_info_t* %2, %struct.III_side_info_t** %7, align 8
  store [2 x %struct.III_scalefac_t]* %3, [2 x %struct.III_scalefac_t]** %8, align 8
  store i32 0, i32* %10, align 4
  br label %27

; <label>:27:                                     ; preds = %56, %4
  %28 = load i32, i32* %10, align 4
  %29 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %30 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %29, i32 0, i32 45
  %31 = load i32, i32* %30, align 8
  %32 = icmp slt i32 %28, %31
  br i1 %32, label %33, label %60

; <label>:33:                                     ; preds = %27
  store i32 0, i32* %11, align 4
  br label %34

; <label>:34:                                     ; preds = %51, %33
  %35 = load i32, i32* %11, align 4
  %36 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %37 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %36, i32 0, i32 46
  %38 = load i32, i32* %37, align 4
  %39 = icmp slt i32 %35, %38
  br i1 %39, label %40, label %55

; <label>:40:                                     ; preds = %34
  %41 = load i32, i32* %10, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @scaleFactorsPH, i64 0, i64 %42
  %44 = load i32, i32* %11, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %43, i64 0, i64 %45
  %47 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %46, align 8
  %48 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %47, i32 0, i32 1
  %49 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %48, align 8
  %50 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %49, i32 0, i32 0
  store i32 0, i32* %50, align 8
  br label %51

; <label>:51:                                     ; preds = %40
  %pgocount = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 8)
  %52 = add i64 %pgocount, 1
  store i64 %52, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 8)
  %53 = load i32, i32* %11, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %11, align 4
  br label %34

; <label>:55:                                     ; preds = %34
  br label %56

; <label>:56:                                     ; preds = %55
  %pgocount1 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 25)
  %57 = add i64 %pgocount1, 1
  store i64 %57, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 25)
  %58 = load i32, i32* %10, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %10, align 4
  br label %27

; <label>:60:                                     ; preds = %27
  store i32 0, i32* %10, align 4
  br label %61

; <label>:61:                                     ; preds = %90, %60
  %62 = load i32, i32* %10, align 4
  %63 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %64 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %63, i32 0, i32 45
  %65 = load i32, i32* %64, align 8
  %66 = icmp slt i32 %62, %65
  br i1 %66, label %67, label %94

; <label>:67:                                     ; preds = %61
  store i32 0, i32* %11, align 4
  br label %68

; <label>:68:                                     ; preds = %85, %67
  %69 = load i32, i32* %11, align 4
  %70 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %71 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %70, i32 0, i32 46
  %72 = load i32, i32* %71, align 4
  %73 = icmp slt i32 %69, %72
  br i1 %73, label %74, label %89

; <label>:74:                                     ; preds = %68
  %75 = load i32, i32* %10, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @codedDataPH, i64 0, i64 %76
  %78 = load i32, i32* %11, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %77, i64 0, i64 %79
  %81 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %80, align 8
  %82 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %81, i32 0, i32 1
  %83 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %82, align 8
  %84 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %83, i32 0, i32 0
  store i32 0, i32* %84, align 8
  br label %85

; <label>:85:                                     ; preds = %74
  %pgocount2 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 9)
  %86 = add i64 %pgocount2, 1
  store i64 %86, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 9)
  %87 = load i32, i32* %11, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %11, align 4
  br label %68

; <label>:89:                                     ; preds = %68
  br label %90

; <label>:90:                                     ; preds = %89
  %pgocount3 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 26)
  %91 = add i64 %pgocount3, 1
  store i64 %91, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 26)
  %92 = load i32, i32* %10, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %10, align 4
  br label %61

; <label>:94:                                     ; preds = %61
  %95 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %96 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %95, i32 0, i32 43
  %97 = load i32, i32* %96, align 8
  %98 = icmp eq i32 %97, 1
  br i1 %98, label %99, label %414

; <label>:99:                                     ; preds = %94
  store i32 0, i32* %10, align 4
  br label %100

; <label>:100:                                    ; preds = %408, %99
  %101 = load i32, i32* %10, align 4
  %102 = icmp slt i32 %101, 2
  br i1 %102, label %103, label %412

; <label>:103:                                    ; preds = %100
  store i32 0, i32* %11, align 4
  br label %104

; <label>:104:                                    ; preds = %404, %103
  %105 = load i32, i32* %11, align 4
  %106 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %107 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %106, i32 0, i32 46
  %108 = load i32, i32* %107, align 4
  %109 = icmp slt i32 %105, %108
  br i1 %109, label %110, label %407

; <label>:110:                                    ; preds = %104
  %111 = load i32, i32* %10, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @scaleFactorsPH, i64 0, i64 %112
  %114 = load i32, i32* %11, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %113, i64 0, i64 %115
  store %struct.BF_PartHolder** %116, %struct.BF_PartHolder*** %14, align 8
  %117 = load %struct.III_side_info_t*, %struct.III_side_info_t** %7, align 8
  %118 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %117, i32 0, i32 4
  %119 = load i32, i32* %10, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* %118, i64 0, i64 %120
  %122 = getelementptr inbounds %struct.anon, %struct.anon* %121, i32 0, i32 0
  %123 = load i32, i32* %11, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %122, i64 0, i64 %124
  %126 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %125, i32 0, i32 0
  store %struct.gr_info* %126, %struct.gr_info** %15, align 8
  %127 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  %128 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %127, i32 0, i32 4
  %129 = load i32, i32* %128, align 8
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds [16 x i32], [16 x i32]* @slen1_tab, i64 0, i64 %130
  %132 = load i32, i32* %131, align 4
  store i32 %132, i32* %16, align 4
  %133 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  %134 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %133, i32 0, i32 4
  %135 = load i32, i32* %134, align 8
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds [16 x i32], [16 x i32]* @slen2_tab, i64 0, i64 %136
  %138 = load i32, i32* %137, align 4
  store i32 %138, i32* %17, align 4
  %139 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %6, align 8
  %140 = load i32, i32* %10, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %139, i64 %141
  %143 = load i32, i32* %11, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %142, i64 0, i64 %144
  %146 = getelementptr inbounds [576 x i32], [576 x i32]* %145, i64 0, i64 0
  store i32* %146, i32** %18, align 8
  %147 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  %148 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %147, i32 0, i32 6
  %149 = load i32, i32* %148, align 8
  %150 = icmp eq i32 %149, 2
  br i1 %150, label %151, label %229

; <label>:151:                                    ; preds = %110
  store i32 0, i32* %12, align 4
  br label %152

; <label>:152:                                    ; preds = %186, %151
  %153 = load i32, i32* %12, align 4
  %154 = icmp slt i32 %153, 6
  br i1 %154, label %155, label %189

; <label>:155:                                    ; preds = %152
  %pgocount4 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 0)
  %156 = add i64 %pgocount4, 1
  store i64 %156, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 0)
  store i32 0, i32* %13, align 4
  br label %157

; <label>:157:                                    ; preds = %181, %155
  %158 = load i32, i32* %13, align 4
  %159 = icmp slt i32 %158, 3
  br i1 %159, label %160, label %185

; <label>:160:                                    ; preds = %157
  %161 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %162 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %161, align 8
  %163 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %8, align 8
  %164 = load i32, i32* %10, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %163, i64 %165
  %167 = load i32, i32* %11, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %166, i64 0, i64 %168
  %170 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %169, i32 0, i32 1
  %171 = load i32, i32* %12, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds [13 x [3 x i32]], [13 x [3 x i32]]* %170, i64 0, i64 %172
  %174 = load i32, i32* %13, align 4
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [3 x i32], [3 x i32]* %173, i64 0, i64 %175
  %177 = load i32, i32* %176, align 4
  %178 = load i32, i32* %16, align 4
  %179 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %162, i32 %177, i32 %178)
  %180 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %179, %struct.BF_PartHolder** %180, align 8
  br label %181

; <label>:181:                                    ; preds = %160
  %pgocount5 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 10)
  %182 = add i64 %pgocount5, 1
  store i64 %182, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 10)
  %183 = load i32, i32* %13, align 4
  %184 = add nsw i32 %183, 1
  store i32 %184, i32* %13, align 4
  br label %157

; <label>:185:                                    ; preds = %157
  br label %186

; <label>:186:                                    ; preds = %185
  %187 = load i32, i32* %12, align 4
  %188 = add nsw i32 %187, 1
  store i32 %188, i32* %12, align 4
  br label %152

; <label>:189:                                    ; preds = %152
  store i32 6, i32* %12, align 4
  br label %190

; <label>:190:                                    ; preds = %224, %189
  %191 = load i32, i32* %12, align 4
  %192 = icmp slt i32 %191, 12
  br i1 %192, label %193, label %227

; <label>:193:                                    ; preds = %190
  %pgocount6 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 1)
  %194 = add i64 %pgocount6, 1
  store i64 %194, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 1)
  store i32 0, i32* %13, align 4
  br label %195

; <label>:195:                                    ; preds = %219, %193
  %196 = load i32, i32* %13, align 4
  %197 = icmp slt i32 %196, 3
  br i1 %197, label %198, label %223

; <label>:198:                                    ; preds = %195
  %199 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %200 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %199, align 8
  %201 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %8, align 8
  %202 = load i32, i32* %10, align 4
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %201, i64 %203
  %205 = load i32, i32* %11, align 4
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %204, i64 0, i64 %206
  %208 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %207, i32 0, i32 1
  %209 = load i32, i32* %12, align 4
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [13 x [3 x i32]], [13 x [3 x i32]]* %208, i64 0, i64 %210
  %212 = load i32, i32* %13, align 4
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds [3 x i32], [3 x i32]* %211, i64 0, i64 %213
  %215 = load i32, i32* %214, align 4
  %216 = load i32, i32* %17, align 4
  %217 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %200, i32 %215, i32 %216)
  %218 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %217, %struct.BF_PartHolder** %218, align 8
  br label %219

; <label>:219:                                    ; preds = %198
  %pgocount7 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 11)
  %220 = add i64 %pgocount7, 1
  store i64 %220, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 11)
  %221 = load i32, i32* %13, align 4
  %222 = add nsw i32 %221, 1
  store i32 %222, i32* %13, align 4
  br label %195

; <label>:223:                                    ; preds = %195
  br label %224

; <label>:224:                                    ; preds = %223
  %225 = load i32, i32* %12, align 4
  %226 = add nsw i32 %225, 1
  store i32 %226, i32* %12, align 4
  br label %190

; <label>:227:                                    ; preds = %190
  %pgocount8 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 13)
  %228 = add i64 %pgocount8, 1
  store i64 %228, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 13)
  br label %395

; <label>:229:                                    ; preds = %110
  %230 = load i32, i32* %10, align 4
  %231 = icmp eq i32 %230, 0
  br i1 %231, label %242, label %232

; <label>:232:                                    ; preds = %229
  %pgocount9 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 17)
  %233 = add i64 %pgocount9, 1
  store i64 %233, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 17)
  %234 = load %struct.III_side_info_t*, %struct.III_side_info_t** %7, align 8
  %235 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %234, i32 0, i32 3
  %236 = load i32, i32* %11, align 4
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds [2 x [4 x i32]], [2 x [4 x i32]]* %235, i64 0, i64 %237
  %239 = getelementptr inbounds [4 x i32], [4 x i32]* %238, i64 0, i64 0
  %240 = load i32, i32* %239, align 4
  %241 = icmp eq i32 %240, 0
  br i1 %241, label %242, label %270

; <label>:242:                                    ; preds = %232, %229
  store i32 0, i32* %12, align 4
  br label %243

; <label>:243:                                    ; preds = %265, %242
  %244 = load i32, i32* %12, align 4
  %245 = icmp slt i32 %244, 6
  br i1 %245, label %246, label %268

; <label>:246:                                    ; preds = %243
  %pgocount10 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 4)
  %247 = add i64 %pgocount10, 1
  store i64 %247, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 4)
  %248 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %249 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %248, align 8
  %250 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %8, align 8
  %251 = load i32, i32* %10, align 4
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %250, i64 %252
  %254 = load i32, i32* %11, align 4
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %253, i64 0, i64 %255
  %257 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %256, i32 0, i32 0
  %258 = load i32, i32* %12, align 4
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds [22 x i32], [22 x i32]* %257, i64 0, i64 %259
  %261 = load i32, i32* %260, align 4
  %262 = load i32, i32* %16, align 4
  %263 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %249, i32 %261, i32 %262)
  %264 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %263, %struct.BF_PartHolder** %264, align 8
  br label %265

; <label>:265:                                    ; preds = %246
  %266 = load i32, i32* %12, align 4
  %267 = add nsw i32 %266, 1
  store i32 %267, i32* %12, align 4
  br label %243

; <label>:268:                                    ; preds = %243
  %pgocount11 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 21)
  %269 = add i64 %pgocount11, 1
  store i64 %269, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 21)
  br label %270

; <label>:270:                                    ; preds = %268, %232
  %271 = load i32, i32* %10, align 4
  %272 = icmp eq i32 %271, 0
  br i1 %272, label %283, label %273

; <label>:273:                                    ; preds = %270
  %pgocount12 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 18)
  %274 = add i64 %pgocount12, 1
  store i64 %274, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 18)
  %275 = load %struct.III_side_info_t*, %struct.III_side_info_t** %7, align 8
  %276 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %275, i32 0, i32 3
  %277 = load i32, i32* %11, align 4
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds [2 x [4 x i32]], [2 x [4 x i32]]* %276, i64 0, i64 %278
  %280 = getelementptr inbounds [4 x i32], [4 x i32]* %279, i64 0, i64 1
  %281 = load i32, i32* %280, align 4
  %282 = icmp eq i32 %281, 0
  br i1 %282, label %283, label %311

; <label>:283:                                    ; preds = %273, %270
  store i32 6, i32* %12, align 4
  br label %284

; <label>:284:                                    ; preds = %306, %283
  %285 = load i32, i32* %12, align 4
  %286 = icmp slt i32 %285, 11
  br i1 %286, label %287, label %309

; <label>:287:                                    ; preds = %284
  %pgocount13 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 5)
  %288 = add i64 %pgocount13, 1
  store i64 %288, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 5)
  %289 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %290 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %289, align 8
  %291 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %8, align 8
  %292 = load i32, i32* %10, align 4
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %291, i64 %293
  %295 = load i32, i32* %11, align 4
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %294, i64 0, i64 %296
  %298 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %297, i32 0, i32 0
  %299 = load i32, i32* %12, align 4
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds [22 x i32], [22 x i32]* %298, i64 0, i64 %300
  %302 = load i32, i32* %301, align 4
  %303 = load i32, i32* %16, align 4
  %304 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %290, i32 %302, i32 %303)
  %305 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %304, %struct.BF_PartHolder** %305, align 8
  br label %306

; <label>:306:                                    ; preds = %287
  %307 = load i32, i32* %12, align 4
  %308 = add nsw i32 %307, 1
  store i32 %308, i32* %12, align 4
  br label %284

; <label>:309:                                    ; preds = %284
  %pgocount14 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 22)
  %310 = add i64 %pgocount14, 1
  store i64 %310, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 22)
  br label %311

; <label>:311:                                    ; preds = %309, %273
  %312 = load i32, i32* %10, align 4
  %313 = icmp eq i32 %312, 0
  br i1 %313, label %324, label %314

; <label>:314:                                    ; preds = %311
  %pgocount15 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 19)
  %315 = add i64 %pgocount15, 1
  store i64 %315, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 19)
  %316 = load %struct.III_side_info_t*, %struct.III_side_info_t** %7, align 8
  %317 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %316, i32 0, i32 3
  %318 = load i32, i32* %11, align 4
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds [2 x [4 x i32]], [2 x [4 x i32]]* %317, i64 0, i64 %319
  %321 = getelementptr inbounds [4 x i32], [4 x i32]* %320, i64 0, i64 2
  %322 = load i32, i32* %321, align 4
  %323 = icmp eq i32 %322, 0
  br i1 %323, label %324, label %352

; <label>:324:                                    ; preds = %314, %311
  store i32 11, i32* %12, align 4
  br label %325

; <label>:325:                                    ; preds = %347, %324
  %326 = load i32, i32* %12, align 4
  %327 = icmp slt i32 %326, 16
  br i1 %327, label %328, label %350

; <label>:328:                                    ; preds = %325
  %pgocount16 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 6)
  %329 = add i64 %pgocount16, 1
  store i64 %329, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 6)
  %330 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %331 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %330, align 8
  %332 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %8, align 8
  %333 = load i32, i32* %10, align 4
  %334 = sext i32 %333 to i64
  %335 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %332, i64 %334
  %336 = load i32, i32* %11, align 4
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %335, i64 0, i64 %337
  %339 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %338, i32 0, i32 0
  %340 = load i32, i32* %12, align 4
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds [22 x i32], [22 x i32]* %339, i64 0, i64 %341
  %343 = load i32, i32* %342, align 4
  %344 = load i32, i32* %17, align 4
  %345 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %331, i32 %343, i32 %344)
  %346 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %345, %struct.BF_PartHolder** %346, align 8
  br label %347

; <label>:347:                                    ; preds = %328
  %348 = load i32, i32* %12, align 4
  %349 = add nsw i32 %348, 1
  store i32 %349, i32* %12, align 4
  br label %325

; <label>:350:                                    ; preds = %325
  %pgocount17 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 23)
  %351 = add i64 %pgocount17, 1
  store i64 %351, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 23)
  br label %352

; <label>:352:                                    ; preds = %350, %314
  %353 = load i32, i32* %10, align 4
  %354 = icmp eq i32 %353, 0
  br i1 %354, label %365, label %355

; <label>:355:                                    ; preds = %352
  %pgocount18 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 20)
  %356 = add i64 %pgocount18, 1
  store i64 %356, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 20)
  %357 = load %struct.III_side_info_t*, %struct.III_side_info_t** %7, align 8
  %358 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %357, i32 0, i32 3
  %359 = load i32, i32* %11, align 4
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds [2 x [4 x i32]], [2 x [4 x i32]]* %358, i64 0, i64 %360
  %362 = getelementptr inbounds [4 x i32], [4 x i32]* %361, i64 0, i64 3
  %363 = load i32, i32* %362, align 4
  %364 = icmp eq i32 %363, 0
  br i1 %364, label %365, label %393

; <label>:365:                                    ; preds = %355, %352
  store i32 16, i32* %12, align 4
  br label %366

; <label>:366:                                    ; preds = %388, %365
  %367 = load i32, i32* %12, align 4
  %368 = icmp slt i32 %367, 21
  br i1 %368, label %369, label %391

; <label>:369:                                    ; preds = %366
  %pgocount19 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 7)
  %370 = add i64 %pgocount19, 1
  store i64 %370, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 7)
  %371 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  %372 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %371, align 8
  %373 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %8, align 8
  %374 = load i32, i32* %10, align 4
  %375 = sext i32 %374 to i64
  %376 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %373, i64 %375
  %377 = load i32, i32* %11, align 4
  %378 = sext i32 %377 to i64
  %379 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %376, i64 0, i64 %378
  %380 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %379, i32 0, i32 0
  %381 = load i32, i32* %12, align 4
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds [22 x i32], [22 x i32]* %380, i64 0, i64 %382
  %384 = load i32, i32* %383, align 4
  %385 = load i32, i32* %17, align 4
  %386 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %372, i32 %384, i32 %385)
  %387 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %14, align 8
  store %struct.BF_PartHolder* %386, %struct.BF_PartHolder** %387, align 8
  br label %388

; <label>:388:                                    ; preds = %369
  %389 = load i32, i32* %12, align 4
  %390 = add nsw i32 %389, 1
  store i32 %390, i32* %12, align 4
  br label %366

; <label>:391:                                    ; preds = %366
  %pgocount20 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 24)
  %392 = add i64 %pgocount20, 1
  store i64 %392, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 24)
  br label %393

; <label>:393:                                    ; preds = %391, %355
  %pgocount21 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 14)
  %394 = add i64 %pgocount21, 1
  store i64 %394, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 14)
  br label %395

; <label>:395:                                    ; preds = %393, %227
  %396 = load i32, i32* %10, align 4
  %397 = sext i32 %396 to i64
  %398 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @codedDataPH, i64 0, i64 %397
  %399 = load i32, i32* %11, align 4
  %400 = sext i32 %399 to i64
  %401 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %398, i64 0, i64 %400
  %402 = load i32*, i32** %18, align 8
  %403 = load %struct.gr_info*, %struct.gr_info** %15, align 8
  call void @Huffmancodebits(%struct.BF_PartHolder** %401, i32* %402, %struct.gr_info* %403)
  br label %404

; <label>:404:                                    ; preds = %395
  %405 = load i32, i32* %11, align 4
  %406 = add nsw i32 %405, 1
  store i32 %406, i32* %11, align 4
  br label %104

; <label>:407:                                    ; preds = %104
  br label %408

; <label>:408:                                    ; preds = %407
  %pgocount22 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 27)
  %409 = add i64 %pgocount22, 1
  store i64 %409, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 27)
  %410 = load i32, i32* %10, align 4
  %411 = add nsw i32 %410, 1
  store i32 %411, i32* %10, align 4
  br label %100

; <label>:412:                                    ; preds = %100
  %pgocount23 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 30)
  %413 = add i64 %pgocount23, 1
  store i64 %413, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 30)
  br label %592

; <label>:414:                                    ; preds = %94
  store i32 0, i32* %10, align 4
  store i32 0, i32* %11, align 4
  br label %415

; <label>:415:                                    ; preds = %587, %414
  %416 = load i32, i32* %11, align 4
  %417 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %418 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %417, i32 0, i32 46
  %419 = load i32, i32* %418, align 4
  %420 = icmp slt i32 %416, %419
  br i1 %420, label %421, label %590

; <label>:421:                                    ; preds = %415
  %422 = load i32, i32* %10, align 4
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @scaleFactorsPH, i64 0, i64 %423
  %425 = load i32, i32* %11, align 4
  %426 = sext i32 %425 to i64
  %427 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %424, i64 0, i64 %426
  store %struct.BF_PartHolder** %427, %struct.BF_PartHolder*** %19, align 8
  %428 = load %struct.III_side_info_t*, %struct.III_side_info_t** %7, align 8
  %429 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %428, i32 0, i32 4
  %430 = load i32, i32* %10, align 4
  %431 = sext i32 %430 to i64
  %432 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* %429, i64 0, i64 %431
  %433 = getelementptr inbounds %struct.anon, %struct.anon* %432, i32 0, i32 0
  %434 = load i32, i32* %11, align 4
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %433, i64 0, i64 %435
  %437 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %436, i32 0, i32 0
  store %struct.gr_info* %437, %struct.gr_info** %20, align 8
  %438 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %6, align 8
  %439 = load i32, i32* %10, align 4
  %440 = sext i32 %439 to i64
  %441 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %438, i64 %440
  %442 = load i32, i32* %11, align 4
  %443 = sext i32 %442 to i64
  %444 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %441, i64 0, i64 %443
  %445 = getelementptr inbounds [576 x i32], [576 x i32]* %444, i64 0, i64 0
  store i32* %445, i32** %21, align 8
  %446 = load %struct.gr_info*, %struct.gr_info** %20, align 8
  %447 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %446, i32 0, i32 19
  %448 = load i32*, i32** %447, align 8
  %449 = icmp ne i32* %448, null
  br i1 %449, label %450, label %451

; <label>:450:                                    ; preds = %421
  br label %454

; <label>:451:                                    ; preds = %421
  %pgocount24 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 32)
  %452 = add i64 %pgocount24, 1
  store i64 %452, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 32)
  call void @__assert_fail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 236, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @__PRETTY_FUNCTION__.encodeMainData, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %454

; <label>:454:                                    ; preds = %453, %450
  %455 = load %struct.gr_info*, %struct.gr_info** %20, align 8
  %456 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %455, i32 0, i32 6
  %457 = load i32, i32* %456, align 8
  %458 = icmp eq i32 %457, 2
  br i1 %458, label %459, label %525

; <label>:459:                                    ; preds = %454
  store i32 0, i32* %12, align 4
  store i32 0, i32* %22, align 4
  br label %460

; <label>:460:                                    ; preds = %520, %459
  %461 = load i32, i32* %22, align 4
  %462 = icmp slt i32 %461, 4
  br i1 %462, label %463, label %523

; <label>:463:                                    ; preds = %460
  %pgocount25 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 15)
  %464 = add i64 %pgocount25, 1
  store i64 %464, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 15)
  %465 = load %struct.gr_info*, %struct.gr_info** %20, align 8
  %466 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %465, i32 0, i32 19
  %467 = load i32*, i32** %466, align 8
  %468 = load i32, i32* %22, align 4
  %469 = sext i32 %468 to i64
  %470 = getelementptr inbounds i32, i32* %467, i64 %469
  %471 = load i32, i32* %470, align 4
  %472 = udiv i32 %471, 3
  store i32 %472, i32* %23, align 4
  %473 = load %struct.gr_info*, %struct.gr_info** %20, align 8
  %474 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %473, i32 0, i32 20
  %475 = load i32, i32* %22, align 4
  %476 = sext i32 %475 to i64
  %477 = getelementptr inbounds [4 x i32], [4 x i32]* %474, i64 0, i64 %476
  %478 = load i32, i32* %477, align 4
  store i32 %478, i32* %24, align 4
  store i32 0, i32* %9, align 4
  br label %479

; <label>:479:                                    ; preds = %514, %463
  %480 = load i32, i32* %9, align 4
  %481 = load i32, i32* %23, align 4
  %482 = icmp slt i32 %480, %481
  br i1 %482, label %483, label %519

; <label>:483:                                    ; preds = %479
  %pgocount26 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 2)
  %484 = add i64 %pgocount26, 1
  store i64 %484, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 2)
  store i32 0, i32* %13, align 4
  br label %485

; <label>:485:                                    ; preds = %509, %483
  %486 = load i32, i32* %13, align 4
  %487 = icmp slt i32 %486, 3
  br i1 %487, label %488, label %513

; <label>:488:                                    ; preds = %485
  %489 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %19, align 8
  %490 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %489, align 8
  %491 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %8, align 8
  %492 = load i32, i32* %10, align 4
  %493 = sext i32 %492 to i64
  %494 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %491, i64 %493
  %495 = load i32, i32* %11, align 4
  %496 = sext i32 %495 to i64
  %497 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %494, i64 0, i64 %496
  %498 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %497, i32 0, i32 1
  %499 = load i32, i32* %12, align 4
  %500 = sext i32 %499 to i64
  %501 = getelementptr inbounds [13 x [3 x i32]], [13 x [3 x i32]]* %498, i64 0, i64 %500
  %502 = load i32, i32* %13, align 4
  %503 = sext i32 %502 to i64
  %504 = getelementptr inbounds [3 x i32], [3 x i32]* %501, i64 0, i64 %503
  %505 = load i32, i32* %504, align 4
  %506 = load i32, i32* %24, align 4
  %507 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %490, i32 %505, i32 %506)
  %508 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %19, align 8
  store %struct.BF_PartHolder* %507, %struct.BF_PartHolder** %508, align 8
  br label %509

; <label>:509:                                    ; preds = %488
  %pgocount27 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 12)
  %510 = add i64 %pgocount27, 1
  store i64 %510, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 12)
  %511 = load i32, i32* %13, align 4
  %512 = add nsw i32 %511, 1
  store i32 %512, i32* %13, align 4
  br label %485

; <label>:513:                                    ; preds = %485
  br label %514

; <label>:514:                                    ; preds = %513
  %515 = load i32, i32* %9, align 4
  %516 = add nsw i32 %515, 1
  store i32 %516, i32* %9, align 4
  %517 = load i32, i32* %12, align 4
  %518 = add nsw i32 %517, 1
  store i32 %518, i32* %12, align 4
  br label %479

; <label>:519:                                    ; preds = %479
  br label %520

; <label>:520:                                    ; preds = %519
  %521 = load i32, i32* %22, align 4
  %522 = add nsw i32 %521, 1
  store i32 %522, i32* %22, align 4
  br label %460

; <label>:523:                                    ; preds = %460
  %pgocount28 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 28)
  %524 = add i64 %pgocount28, 1
  store i64 %524, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 28)
  br label %578

; <label>:525:                                    ; preds = %454
  store i32 0, i32* %12, align 4
  store i32 0, i32* %22, align 4
  br label %526

; <label>:526:                                    ; preds = %573, %525
  %527 = load i32, i32* %22, align 4
  %528 = icmp slt i32 %527, 4
  br i1 %528, label %529, label %576

; <label>:529:                                    ; preds = %526
  %pgocount29 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 16)
  %530 = add i64 %pgocount29, 1
  store i64 %530, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 16)
  %531 = load %struct.gr_info*, %struct.gr_info** %20, align 8
  %532 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %531, i32 0, i32 19
  %533 = load i32*, i32** %532, align 8
  %534 = load i32, i32* %22, align 4
  %535 = sext i32 %534 to i64
  %536 = getelementptr inbounds i32, i32* %533, i64 %535
  %537 = load i32, i32* %536, align 4
  store i32 %537, i32* %25, align 4
  %538 = load %struct.gr_info*, %struct.gr_info** %20, align 8
  %539 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %538, i32 0, i32 20
  %540 = load i32, i32* %22, align 4
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds [4 x i32], [4 x i32]* %539, i64 0, i64 %541
  %543 = load i32, i32* %542, align 4
  store i32 %543, i32* %26, align 4
  store i32 0, i32* %9, align 4
  br label %544

; <label>:544:                                    ; preds = %567, %529
  %545 = load i32, i32* %9, align 4
  %546 = load i32, i32* %25, align 4
  %547 = icmp slt i32 %545, %546
  br i1 %547, label %548, label %572

; <label>:548:                                    ; preds = %544
  %pgocount30 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 3)
  %549 = add i64 %pgocount30, 1
  store i64 %549, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 3)
  %550 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %19, align 8
  %551 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %550, align 8
  %552 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %8, align 8
  %553 = load i32, i32* %10, align 4
  %554 = sext i32 %553 to i64
  %555 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %552, i64 %554
  %556 = load i32, i32* %11, align 4
  %557 = sext i32 %556 to i64
  %558 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %555, i64 0, i64 %557
  %559 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %558, i32 0, i32 0
  %560 = load i32, i32* %12, align 4
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds [22 x i32], [22 x i32]* %559, i64 0, i64 %561
  %563 = load i32, i32* %562, align 4
  %564 = load i32, i32* %26, align 4
  %565 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %551, i32 %563, i32 %564)
  %566 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %19, align 8
  store %struct.BF_PartHolder* %565, %struct.BF_PartHolder** %566, align 8
  br label %567

; <label>:567:                                    ; preds = %548
  %568 = load i32, i32* %9, align 4
  %569 = add nsw i32 %568, 1
  store i32 %569, i32* %9, align 4
  %570 = load i32, i32* %12, align 4
  %571 = add nsw i32 %570, 1
  store i32 %571, i32* %12, align 4
  br label %544

; <label>:572:                                    ; preds = %544
  br label %573

; <label>:573:                                    ; preds = %572
  %574 = load i32, i32* %22, align 4
  %575 = add nsw i32 %574, 1
  store i32 %575, i32* %22, align 4
  br label %526

; <label>:576:                                    ; preds = %526
  %pgocount31 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 29)
  %577 = add i64 %pgocount31, 1
  store i64 %577, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 29)
  br label %578

; <label>:578:                                    ; preds = %576, %523
  %579 = load i32, i32* %10, align 4
  %580 = sext i32 %579 to i64
  %581 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @codedDataPH, i64 0, i64 %580
  %582 = load i32, i32* %11, align 4
  %583 = sext i32 %582 to i64
  %584 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %581, i64 0, i64 %583
  %585 = load i32*, i32** %21, align 8
  %586 = load %struct.gr_info*, %struct.gr_info** %20, align 8
  call void @Huffmancodebits(%struct.BF_PartHolder** %584, i32* %585, %struct.gr_info* %586)
  br label %587

; <label>:587:                                    ; preds = %578
  %588 = load i32, i32* %11, align 4
  %589 = add nsw i32 %588, 1
  store i32 %589, i32* %11, align 4
  br label %415

; <label>:590:                                    ; preds = %415
  %pgocount32 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 31)
  %591 = add i64 %pgocount32, 1
  store i64 %591, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_tmp1.ll_encodeMainData, i64 0, i64 31)
  br label %592

; <label>:592:                                    ; preds = %590, %412
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @drain_into_ancillary_data(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %6 = load i32, i32* %2, align 4
  %7 = sdiv i32 %6, 32
  store i32 %7, i32* %3, align 4
  %8 = load i32, i32* %2, align 4
  %9 = srem i32 %8, 32
  store i32 %9, i32* %4, align 4
  %10 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @userFrameDataPH, align 8
  %11 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %10, i32 0, i32 1
  %12 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %11, align 8
  %13 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %12, i32 0, i32 0
  store i32 0, i32* %13, align 8
  store i32 0, i32* %5, align 4
  br label %14

; <label>:14:                                     ; preds = %21, %1
  %15 = load i32, i32* %5, align 4
  %16 = load i32, i32* %3, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %25

; <label>:18:                                     ; preds = %14
  %19 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @userFrameDataPH, align 8
  %20 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %19, i32 0, i32 32)
  store %struct.BF_PartHolder* %20, %struct.BF_PartHolder** @userFrameDataPH, align 8
  br label %21

; <label>:21:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_drain_into_ancillary_data, i64 0, i64 0)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_drain_into_ancillary_data, i64 0, i64 0)
  %23 = load i32, i32* %5, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %5, align 4
  br label %14

; <label>:25:                                     ; preds = %14
  %26 = load i32, i32* %4, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %33

; <label>:28:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_drain_into_ancillary_data, i64 0, i64 2)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_drain_into_ancillary_data, i64 0, i64 2)
  %30 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @userFrameDataPH, align 8
  %31 = load i32, i32* %4, align 4
  %32 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %30, i32 0, i32 %31)
  store %struct.BF_PartHolder* %32, %struct.BF_PartHolder** @userFrameDataPH, align 8
  br label %33

; <label>:33:                                     ; preds = %28, %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_drain_into_ancillary_data, i64 0, i64 1)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_drain_into_ancillary_data, i64 0, i64 1)
  ret void
}

declare void @BF_BitstreamFrame(%struct.BF_FrameData*, %struct.BF_FrameResults*) #1

; Function Attrs: nounwind uwtable
define void @III_FlushBitstream() #0 {
  %1 = load i32, i32* @PartHoldersInitialized, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %3, label %7

; <label>:3:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_III_FlushBitstream, i64 0, i64 1)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_III_FlushBitstream, i64 0, i64 1)
  %5 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %6 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** @frameResults, align 8
  call void @BF_FlushBitstream(%struct.BF_FrameData* %5, %struct.BF_FrameResults* %6)
  br label %7

; <label>:7:                                      ; preds = %3, %0
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_III_FlushBitstream, i64 0, i64 0)
  %8 = add i64 %pgocount1, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_III_FlushBitstream, i64 0, i64 0)
  ret void
}

declare void @BF_FlushBitstream(%struct.BF_FrameData*, %struct.BF_FrameResults*) #1

; Function Attrs: nounwind uwtable
define i32 @abs_and_sign(i32*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  store i32* %0, i32** %3, align 8
  %4 = load i32*, i32** %3, align 8
  %5 = load i32, i32* %4, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %9

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_abs_and_sign, i64 0, i64 0)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_abs_and_sign, i64 0, i64 0)
  store i32 0, i32* %2, align 4
  br label %14

; <label>:9:                                      ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_abs_and_sign, i64 0, i64 1)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_abs_and_sign, i64 0, i64 1)
  %11 = load i32*, i32** %3, align 8
  %12 = load i32, i32* %11, align 4
  %13 = mul nsw i32 %12, -1
  store i32 %13, i32* %11, align 4
  store i32 1, i32* %2, align 4
  br label %14

; <label>:14:                                     ; preds = %9, %7
  %15 = load i32, i32* %2, align 4
  ret i32 %15
}

; Function Attrs: nounwind uwtable
define i32 @L3_huffman_coder_count1(%struct.BF_PartHolder**, %struct.huffcodetab*, i32, i32, i32, i32) #0 {
  %7 = alloca %struct.BF_PartHolder**, align 8
  %8 = alloca %struct.huffcodetab*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i64, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store %struct.BF_PartHolder** %0, %struct.BF_PartHolder*** %7, align 8
  store %struct.huffcodetab* %1, %struct.huffcodetab** %8, align 8
  store i32 %2, i32* %9, align 4
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store i32 %5, i32* %12, align 4
  store i32 0, i32* %20, align 4
  %21 = call i32 @abs_and_sign(i32* %9)
  store i32 %21, i32* %14, align 4
  %22 = call i32 @abs_and_sign(i32* %10)
  store i32 %22, i32* %15, align 4
  %23 = call i32 @abs_and_sign(i32* %11)
  store i32 %23, i32* %16, align 4
  %24 = call i32 @abs_and_sign(i32* %12)
  store i32 %24, i32* %17, align 4
  %25 = load i32, i32* %9, align 4
  %26 = shl i32 %25, 3
  %27 = load i32, i32* %10, align 4
  %28 = shl i32 %27, 2
  %29 = add nsw i32 %26, %28
  %30 = load i32, i32* %11, align 4
  %31 = shl i32 %30, 1
  %32 = add nsw i32 %29, %31
  %33 = load i32, i32* %12, align 4
  %34 = add nsw i32 %32, %33
  store i32 %34, i32* %18, align 4
  %35 = load %struct.huffcodetab*, %struct.huffcodetab** %8, align 8
  %36 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %35, i32 0, i32 2
  %37 = load i64*, i64** %36, align 8
  %38 = load i32, i32* %18, align 4
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i64, i64* %37, i64 %39
  %41 = load i64, i64* %40, align 8
  store i64 %41, i64* %13, align 8
  %42 = load %struct.huffcodetab*, %struct.huffcodetab** %8, align 8
  %43 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %42, i32 0, i32 3
  %44 = load i8*, i8** %43, align 8
  %45 = load i32, i32* %18, align 4
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8* %44, i64 %46
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i32
  store i32 %49, i32* %19, align 4
  %50 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %7, align 8
  %51 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %50, align 8
  %52 = load i64, i64* %13, align 8
  %53 = trunc i64 %52 to i32
  %54 = load i32, i32* %19, align 4
  %55 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %51, i32 %53, i32 %54)
  %56 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %7, align 8
  store %struct.BF_PartHolder* %55, %struct.BF_PartHolder** %56, align 8
  store i32 0, i32* %20, align 4
  store i32 0, i32* %18, align 4
  %57 = load i32, i32* %9, align 4
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %64

; <label>:59:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_L3_huffman_coder_count1, i64 0, i64 1)
  %60 = add i64 %pgocount, 1
  store i64 %60, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_L3_huffman_coder_count1, i64 0, i64 1)
  %61 = load i32, i32* %14, align 4
  store i32 %61, i32* %18, align 4
  %62 = load i32, i32* %20, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %20, align 4
  br label %64

; <label>:64:                                     ; preds = %59, %6
  %65 = load i32, i32* %10, align 4
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %75

; <label>:67:                                     ; preds = %64
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_L3_huffman_coder_count1, i64 0, i64 2)
  %68 = add i64 %pgocount1, 1
  store i64 %68, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_L3_huffman_coder_count1, i64 0, i64 2)
  %69 = load i32, i32* %18, align 4
  %70 = mul i32 2, %69
  %71 = load i32, i32* %15, align 4
  %72 = add i32 %70, %71
  store i32 %72, i32* %18, align 4
  %73 = load i32, i32* %20, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %20, align 4
  br label %75

; <label>:75:                                     ; preds = %67, %64
  %76 = load i32, i32* %11, align 4
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %78, label %86

; <label>:78:                                     ; preds = %75
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_L3_huffman_coder_count1, i64 0, i64 3)
  %79 = add i64 %pgocount2, 1
  store i64 %79, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_L3_huffman_coder_count1, i64 0, i64 3)
  %80 = load i32, i32* %18, align 4
  %81 = mul i32 2, %80
  %82 = load i32, i32* %16, align 4
  %83 = add i32 %81, %82
  store i32 %83, i32* %18, align 4
  %84 = load i32, i32* %20, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %20, align 4
  br label %86

; <label>:86:                                     ; preds = %78, %75
  %87 = load i32, i32* %12, align 4
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %89, label %97

; <label>:89:                                     ; preds = %86
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_L3_huffman_coder_count1, i64 0, i64 4)
  %90 = add i64 %pgocount3, 1
  store i64 %90, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_L3_huffman_coder_count1, i64 0, i64 4)
  %91 = load i32, i32* %18, align 4
  %92 = mul i32 2, %91
  %93 = load i32, i32* %17, align 4
  %94 = add i32 %92, %93
  store i32 %94, i32* %18, align 4
  %95 = load i32, i32* %20, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* %20, align 4
  br label %97

; <label>:97:                                     ; preds = %89, %86
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_L3_huffman_coder_count1, i64 0, i64 0)
  %98 = add i64 %pgocount4, 1
  store i64 %98, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_L3_huffman_coder_count1, i64 0, i64 0)
  %99 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %7, align 8
  %100 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %99, align 8
  %101 = load i32, i32* %18, align 4
  %102 = load i32, i32* %20, align 4
  %103 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %100, i32 %101, i32 %102)
  %104 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %7, align 8
  store %struct.BF_PartHolder* %103, %struct.BF_PartHolder** %104, align 8
  %105 = load i32, i32* %20, align 4
  %106 = load i32, i32* %19, align 4
  %107 = add nsw i32 %105, %106
  ret i32 %107
}

declare %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder*, i32, i32) #1

; Function Attrs: nounwind uwtable
define i32 @HuffmanCode(i32, i32, i32, i32*, i32*, i32*, i32*) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32*, align 8
  %13 = alloca i32*, align 8
  %14 = alloca i32*, align 8
  %15 = alloca i32*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca %struct.huffcodetab*, align 8
  store i32 %0, i32* %9, align 4
  store i32 %1, i32* %10, align 4
  store i32 %2, i32* %11, align 4
  store i32* %3, i32** %12, align 8
  store i32* %4, i32** %13, align 8
  store i32* %5, i32** %14, align 8
  store i32* %6, i32** %15, align 8
  %23 = load i32*, i32** %14, align 8
  store i32 0, i32* %23, align 4
  %24 = load i32*, i32** %15, align 8
  store i32 0, i32* %24, align 4
  %25 = load i32*, i32** %12, align 8
  store i32 0, i32* %25, align 4
  %26 = load i32*, i32** %13, align 8
  store i32 0, i32* %26, align 4
  %27 = load i32, i32* %9, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 0)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 0)
  store i32 0, i32* %8, align 4
  br label %238

; <label>:31:                                     ; preds = %7
  %32 = call i32 @abs_and_sign(i32* %10)
  store i32 %32, i32* %16, align 4
  %33 = call i32 @abs_and_sign(i32* %11)
  store i32 %33, i32* %17, align 4
  %34 = load i32, i32* %9, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %35
  store %struct.huffcodetab* %36, %struct.huffcodetab** %22, align 8
  %37 = load i32, i32* %9, align 4
  %38 = icmp sgt i32 %37, 15
  br i1 %38, label %39, label %160

; <label>:39:                                     ; preds = %31
  %40 = load %struct.huffcodetab*, %struct.huffcodetab** %22, align 8
  %41 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %40, i32 0, i32 0
  %42 = load i32, i32* %41, align 8
  store i32 %42, i32* %20, align 4
  store i32 0, i32* %19, align 4
  store i32 0, i32* %18, align 4
  %43 = load i32, i32* %10, align 4
  %44 = icmp sgt i32 %43, 14
  br i1 %44, label %45, label %59

; <label>:45:                                     ; preds = %39
  %46 = load i32, i32* %10, align 4
  %47 = sub nsw i32 %46, 15
  store i32 %47, i32* %18, align 4
  %48 = load i32, i32* %18, align 4
  %49 = load %struct.huffcodetab*, %struct.huffcodetab** %22, align 8
  %50 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %49, i32 0, i32 1
  %51 = load i32, i32* %50, align 4
  %52 = icmp ule i32 %48, %51
  br i1 %52, label %53, label %55

; <label>:53:                                     ; preds = %45
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 9)
  %54 = add i64 %pgocount1, 1
  store i64 %54, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 9)
  br label %58

; <label>:55:                                     ; preds = %45
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 13)
  %56 = add i64 %pgocount2, 1
  store i64 %56, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 13)
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 797, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @__PRETTY_FUNCTION__.HuffmanCode, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %58

; <label>:58:                                     ; preds = %57, %53
  store i32 15, i32* %10, align 4
  br label %59

; <label>:59:                                     ; preds = %58, %39
  %60 = load i32, i32* %11, align 4
  %61 = icmp sgt i32 %60, 14
  br i1 %61, label %62, label %76

; <label>:62:                                     ; preds = %59
  %63 = load i32, i32* %11, align 4
  %64 = sub nsw i32 %63, 15
  store i32 %64, i32* %19, align 4
  %65 = load i32, i32* %19, align 4
  %66 = load %struct.huffcodetab*, %struct.huffcodetab** %22, align 8
  %67 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %66, i32 0, i32 1
  %68 = load i32, i32* %67, align 4
  %69 = icmp ule i32 %65, %68
  br i1 %69, label %70, label %71

; <label>:70:                                     ; preds = %62
  br label %74

; <label>:71:                                     ; preds = %62
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 14)
  %72 = add i64 %pgocount3, 1
  store i64 %72, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 14)
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 803, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @__PRETTY_FUNCTION__.HuffmanCode, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %74

; <label>:74:                                     ; preds = %73, %70
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 10)
  %75 = add i64 %pgocount4, 1
  store i64 %75, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 10)
  store i32 15, i32* %11, align 4
  br label %76

; <label>:76:                                     ; preds = %74, %59
  %77 = load i32, i32* %10, align 4
  %78 = mul nsw i32 %77, 16
  %79 = load i32, i32* %11, align 4
  %80 = add nsw i32 %78, %79
  store i32 %80, i32* %21, align 4
  %81 = load %struct.huffcodetab*, %struct.huffcodetab** %22, align 8
  %82 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %81, i32 0, i32 2
  %83 = load i64*, i64** %82, align 8
  %84 = load i32, i32* %21, align 4
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds i64, i64* %83, i64 %85
  %87 = load i64, i64* %86, align 8
  %88 = trunc i64 %87 to i32
  %89 = load i32*, i32** %12, align 8
  store i32 %88, i32* %89, align 4
  %90 = load %struct.huffcodetab*, %struct.huffcodetab** %22, align 8
  %91 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %90, i32 0, i32 3
  %92 = load i8*, i8** %91, align 8
  %93 = load i32, i32* %21, align 4
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds i8, i8* %92, i64 %94
  %96 = load i8, i8* %95, align 1
  %97 = zext i8 %96 to i32
  %98 = load i32*, i32** %14, align 8
  store i32 %97, i32* %98, align 4
  %99 = load i32, i32* %10, align 4
  %100 = icmp sgt i32 %99, 14
  br i1 %100, label %101, label %111

; <label>:101:                                    ; preds = %76
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 7)
  %102 = add i64 %pgocount5, 1
  store i64 %102, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 7)
  %103 = load i32, i32* %18, align 4
  %104 = load i32*, i32** %13, align 8
  %105 = load i32, i32* %104, align 4
  %106 = or i32 %105, %103
  store i32 %106, i32* %104, align 4
  %107 = load i32, i32* %20, align 4
  %108 = load i32*, i32** %15, align 8
  %109 = load i32, i32* %108, align 4
  %110 = add i32 %109, %107
  store i32 %110, i32* %108, align 4
  br label %111

; <label>:111:                                    ; preds = %101, %76
  %112 = load i32, i32* %10, align 4
  %113 = icmp ne i32 %112, 0
  br i1 %113, label %114, label %126

; <label>:114:                                    ; preds = %111
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 5)
  %115 = add i64 %pgocount6, 1
  store i64 %115, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 5)
  %116 = load i32*, i32** %13, align 8
  %117 = load i32, i32* %116, align 4
  %118 = shl i32 %117, 1
  store i32 %118, i32* %116, align 4
  %119 = load i32, i32* %16, align 4
  %120 = load i32*, i32** %13, align 8
  %121 = load i32, i32* %120, align 4
  %122 = or i32 %121, %119
  store i32 %122, i32* %120, align 4
  %123 = load i32*, i32** %15, align 8
  %124 = load i32, i32* %123, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* %123, align 4
  br label %126

; <label>:126:                                    ; preds = %114, %111
  %127 = load i32, i32* %11, align 4
  %128 = icmp sgt i32 %127, 14
  br i1 %128, label %129, label %143

; <label>:129:                                    ; preds = %126
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 8)
  %130 = add i64 %pgocount7, 1
  store i64 %130, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 8)
  %131 = load i32, i32* %20, align 4
  %132 = load i32*, i32** %13, align 8
  %133 = load i32, i32* %132, align 4
  %134 = shl i32 %133, %131
  store i32 %134, i32* %132, align 4
  %135 = load i32, i32* %19, align 4
  %136 = load i32*, i32** %13, align 8
  %137 = load i32, i32* %136, align 4
  %138 = or i32 %137, %135
  store i32 %138, i32* %136, align 4
  %139 = load i32, i32* %20, align 4
  %140 = load i32*, i32** %15, align 8
  %141 = load i32, i32* %140, align 4
  %142 = add i32 %141, %139
  store i32 %142, i32* %140, align 4
  br label %143

; <label>:143:                                    ; preds = %129, %126
  %144 = load i32, i32* %11, align 4
  %145 = icmp ne i32 %144, 0
  br i1 %145, label %146, label %158

; <label>:146:                                    ; preds = %143
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 6)
  %147 = add i64 %pgocount8, 1
  store i64 %147, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 6)
  %148 = load i32*, i32** %13, align 8
  %149 = load i32, i32* %148, align 4
  %150 = shl i32 %149, 1
  store i32 %150, i32* %148, align 4
  %151 = load i32, i32* %17, align 4
  %152 = load i32*, i32** %13, align 8
  %153 = load i32, i32* %152, align 4
  %154 = or i32 %153, %151
  store i32 %154, i32* %152, align 4
  %155 = load i32*, i32** %15, align 8
  %156 = load i32, i32* %155, align 4
  %157 = add nsw i32 %156, 1
  store i32 %157, i32* %155, align 4
  br label %158

; <label>:158:                                    ; preds = %146, %143
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 2)
  %159 = add i64 %pgocount9, 1
  store i64 %159, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 2)
  br label %216

; <label>:160:                                    ; preds = %31
  %161 = load i32, i32* %10, align 4
  %162 = mul nsw i32 %161, 16
  %163 = load i32, i32* %11, align 4
  %164 = add nsw i32 %162, %163
  store i32 %164, i32* %21, align 4
  %165 = load %struct.huffcodetab*, %struct.huffcodetab** %22, align 8
  %166 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %165, i32 0, i32 2
  %167 = load i64*, i64** %166, align 8
  %168 = load i32, i32* %21, align 4
  %169 = zext i32 %168 to i64
  %170 = getelementptr inbounds i64, i64* %167, i64 %169
  %171 = load i64, i64* %170, align 8
  %172 = trunc i64 %171 to i32
  %173 = load i32*, i32** %12, align 8
  store i32 %172, i32* %173, align 4
  %174 = load %struct.huffcodetab*, %struct.huffcodetab** %22, align 8
  %175 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %174, i32 0, i32 3
  %176 = load i8*, i8** %175, align 8
  %177 = load i32, i32* %21, align 4
  %178 = zext i32 %177 to i64
  %179 = getelementptr inbounds i8, i8* %176, i64 %178
  %180 = load i8, i8* %179, align 1
  %181 = zext i8 %180 to i32
  %182 = load i32*, i32** %14, align 8
  %183 = load i32, i32* %182, align 4
  %184 = add nsw i32 %183, %181
  store i32 %184, i32* %182, align 4
  %185 = load i32, i32* %10, align 4
  %186 = icmp ne i32 %185, 0
  br i1 %186, label %187, label %199

; <label>:187:                                    ; preds = %160
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 3)
  %188 = add i64 %pgocount10, 1
  store i64 %188, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 3)
  %189 = load i32*, i32** %12, align 8
  %190 = load i32, i32* %189, align 4
  %191 = shl i32 %190, 1
  store i32 %191, i32* %189, align 4
  %192 = load i32, i32* %16, align 4
  %193 = load i32*, i32** %12, align 8
  %194 = load i32, i32* %193, align 4
  %195 = or i32 %194, %192
  store i32 %195, i32* %193, align 4
  %196 = load i32*, i32** %14, align 8
  %197 = load i32, i32* %196, align 4
  %198 = add nsw i32 %197, 1
  store i32 %198, i32* %196, align 4
  br label %199

; <label>:199:                                    ; preds = %187, %160
  %200 = load i32, i32* %11, align 4
  %201 = icmp ne i32 %200, 0
  br i1 %201, label %202, label %214

; <label>:202:                                    ; preds = %199
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 4)
  %203 = add i64 %pgocount11, 1
  store i64 %203, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 4)
  %204 = load i32*, i32** %12, align 8
  %205 = load i32, i32* %204, align 4
  %206 = shl i32 %205, 1
  store i32 %206, i32* %204, align 4
  %207 = load i32, i32* %17, align 4
  %208 = load i32*, i32** %12, align 8
  %209 = load i32, i32* %208, align 4
  %210 = or i32 %209, %207
  store i32 %210, i32* %208, align 4
  %211 = load i32*, i32** %14, align 8
  %212 = load i32, i32* %211, align 4
  %213 = add nsw i32 %212, 1
  store i32 %213, i32* %211, align 4
  br label %214

; <label>:214:                                    ; preds = %202, %199
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 1)
  %215 = add i64 %pgocount12, 1
  store i64 %215, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 1)
  br label %216

; <label>:216:                                    ; preds = %214, %158
  %217 = load i32*, i32** %14, align 8
  %218 = load i32, i32* %217, align 4
  %219 = icmp sle i32 %218, 32
  br i1 %219, label %220, label %221

; <label>:220:                                    ; preds = %216
  br label %224

; <label>:221:                                    ; preds = %216
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 11)
  %222 = add i64 %pgocount13, 1
  store i64 %222, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 11)
  call void @__assert_fail(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 851, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @__PRETTY_FUNCTION__.HuffmanCode, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %224

; <label>:224:                                    ; preds = %223, %220
  %225 = load i32*, i32** %15, align 8
  %226 = load i32, i32* %225, align 4
  %227 = icmp sle i32 %226, 32
  br i1 %227, label %228, label %229

; <label>:228:                                    ; preds = %224
  br label %232

; <label>:229:                                    ; preds = %224
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 12)
  %230 = add i64 %pgocount14, 1
  store i64 %230, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_HuffmanCode, i64 0, i64 12)
  call void @__assert_fail(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 852, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @__PRETTY_FUNCTION__.HuffmanCode, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %232

; <label>:232:                                    ; preds = %231, %228
  %233 = load i32*, i32** %14, align 8
  %234 = load i32, i32* %233, align 4
  %235 = load i32*, i32** %15, align 8
  %236 = load i32, i32* %235, align 4
  %237 = add nsw i32 %234, %236
  store i32 %237, i32* %8, align 4
  br label %238

; <label>:238:                                    ; preds = %232, %29
  %239 = load i32, i32* %8, align 4
  ret i32 %239
}

; Function Attrs: nounwind uwtable
define internal void @Huffmancodebits(%struct.BF_PartHolder**, i32*, %struct.gr_info*) #0 {
  %4 = alloca %struct.BF_PartHolder**, align 8
  %5 = alloca i32*, align 8
  %6 = alloca %struct.gr_info*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
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
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca [192 x [3 x i32]]*, align 8
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  store %struct.BF_PartHolder** %0, %struct.BF_PartHolder*** %4, align 8
  store i32* %1, i32** %5, align 8
  store %struct.gr_info* %2, %struct.gr_info** %6, align 8
  store i32 0, i32* %22, align 4
  %34 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %35 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %34, i32 0, i32 1
  %36 = load i32, i32* %35, align 4
  %37 = mul i32 %36, 2
  store i32 %37, i32* %10, align 4
  %38 = load i32, i32* %10, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %272

; <label>:40:                                     ; preds = %3
  %41 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %42 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %41, i32 0, i32 7
  %43 = load i32, i32* %42, align 4
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %151, label %45

; <label>:45:                                     ; preds = %40
  %pgocount = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 14)
  %46 = add i64 %pgocount, 1
  store i64 %46, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 14)
  %47 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %48 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %47, i32 0, i32 6
  %49 = load i32, i32* %48, align 8
  %50 = icmp eq i32 %49, 2
  br i1 %50, label %51, label %151

; <label>:51:                                     ; preds = %45
  %52 = load i32*, i32** %5, align 8
  %53 = bitcast i32* %52 to [192 x [3 x i32]]*
  store [192 x [3 x i32]]* %53, [192 x [3 x i32]]** %28, align 8
  store i32 12, i32* %7, align 4
  store i32 576, i32* %8, align 4
  store i32 0, i32* %23, align 4
  br label %54

; <label>:54:                                     ; preds = %146, %51
  %55 = load i32, i32* %23, align 4
  %56 = icmp slt i32 %55, 13
  br i1 %56, label %57, label %149

; <label>:57:                                     ; preds = %54
  store i32 100, i32* %29, align 4
  %58 = load i32, i32* %23, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [14 x i32], [14 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 1), i64 0, i64 %59
  %61 = load i32, i32* %60, align 4
  store i32 %61, i32* %26, align 4
  %62 = load i32, i32* %23, align 4
  %63 = add nsw i32 %62, 1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [14 x i32], [14 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 1), i64 0, i64 %64
  %66 = load i32, i32* %65, align 4
  store i32 %66, i32* %27, align 4
  %67 = load i32, i32* %26, align 4
  %68 = load i32, i32* %7, align 4
  %69 = icmp slt i32 %67, %68
  br i1 %69, label %70, label %76

; <label>:70:                                     ; preds = %57
  %pgocount1 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 8)
  %71 = add i64 %pgocount1, 1
  store i64 %71, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 8)
  %72 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %73 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %72, i32 0, i32 8
  %74 = getelementptr inbounds [3 x i32], [3 x i32]* %73, i64 0, i64 0
  %75 = load i32, i32* %74, align 8
  store i32 %75, i32* %29, align 4
  br label %82

; <label>:76:                                     ; preds = %57
  %pgocount2 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 9)
  %77 = add i64 %pgocount2, 1
  store i64 %77, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 9)
  %78 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %79 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %78, i32 0, i32 8
  %80 = getelementptr inbounds [3 x i32], [3 x i32]* %79, i64 0, i64 1
  %81 = load i32, i32* %80, align 4
  store i32 %81, i32* %29, align 4
  br label %82

; <label>:82:                                     ; preds = %76, %70
  %83 = load i32, i32* %29, align 4
  %84 = icmp ult i32 %83, 32
  br i1 %84, label %85, label %86

; <label>:85:                                     ; preds = %82
  br label %89

; <label>:86:                                     ; preds = %82
  %pgocount3 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 18)
  %87 = add i64 %pgocount3, 1
  store i64 %87, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 18)
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 532, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.Huffmancodebits, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %89

; <label>:89:                                     ; preds = %88, %85
  store i32 0, i32* %24, align 4
  br label %90

; <label>:90:                                     ; preds = %141, %89
  %91 = load i32, i32* %24, align 4
  %92 = icmp slt i32 %91, 3
  br i1 %92, label %93, label %145

; <label>:93:                                     ; preds = %90
  %94 = load i32, i32* %26, align 4
  store i32 %94, i32* %25, align 4
  br label %95

; <label>:95:                                     ; preds = %136, %93
  %96 = load i32, i32* %25, align 4
  %97 = load i32, i32* %27, align 4
  %98 = icmp slt i32 %96, %97
  br i1 %98, label %99, label %140

; <label>:99:                                     ; preds = %95
  %100 = load [192 x [3 x i32]]*, [192 x [3 x i32]]** %28, align 8
  %101 = load i32, i32* %25, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [192 x [3 x i32]], [192 x [3 x i32]]* %100, i64 0, i64 %102
  %104 = load i32, i32* %24, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [3 x i32], [3 x i32]* %103, i64 0, i64 %105
  %107 = load i32, i32* %106, align 4
  store i32 %107, i32* %14, align 4
  %108 = load [192 x [3 x i32]]*, [192 x [3 x i32]]** %28, align 8
  %109 = load i32, i32* %25, align 4
  %110 = add nsw i32 %109, 1
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [192 x [3 x i32]], [192 x [3 x i32]]* %108, i64 0, i64 %111
  %113 = load i32, i32* %24, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [3 x i32], [3 x i32]* %112, i64 0, i64 %114
  %116 = load i32, i32* %115, align 4
  store i32 %116, i32* %15, align 4
  %117 = load i32, i32* %29, align 4
  %118 = load i32, i32* %14, align 4
  %119 = load i32, i32* %15, align 4
  %120 = call i32 @HuffmanCode(i32 %117, i32 %118, i32 %119, i32* %20, i32* %21, i32* %17, i32* %18)
  store i32 %120, i32* %16, align 4
  %121 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %4, align 8
  %122 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %121, align 8
  %123 = load i32, i32* %20, align 4
  %124 = load i32, i32* %17, align 4
  %125 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %122, i32 %123, i32 %124)
  %126 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %4, align 8
  store %struct.BF_PartHolder* %125, %struct.BF_PartHolder** %126, align 8
  %127 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %4, align 8
  %128 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %127, align 8
  %129 = load i32, i32* %21, align 4
  %130 = load i32, i32* %18, align 4
  %131 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %128, i32 %129, i32 %130)
  %132 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %4, align 8
  store %struct.BF_PartHolder* %131, %struct.BF_PartHolder** %132, align 8
  %133 = load i32, i32* %16, align 4
  %134 = load i32, i32* %22, align 4
  %135 = add nsw i32 %134, %133
  store i32 %135, i32* %22, align 4
  br label %136

; <label>:136:                                    ; preds = %99
  %pgocount4 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 0)
  %137 = add i64 %pgocount4, 1
  store i64 %137, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 0)
  %138 = load i32, i32* %25, align 4
  %139 = add nsw i32 %138, 2
  store i32 %139, i32* %25, align 4
  br label %95

; <label>:140:                                    ; preds = %95
  br label %141

; <label>:141:                                    ; preds = %140
  %pgocount5 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 3)
  %142 = add i64 %pgocount5, 1
  store i64 %142, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 3)
  %143 = load i32, i32* %24, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, i32* %24, align 4
  br label %90

; <label>:145:                                    ; preds = %90
  br label %146

; <label>:146:                                    ; preds = %145
  %147 = load i32, i32* %23, align 4
  %148 = add nsw i32 %147, 1
  store i32 %148, i32* %23, align 4
  br label %54

; <label>:149:                                    ; preds = %54
  %pgocount6 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 16)
  %150 = add i64 %pgocount6, 1
  store i64 %150, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 16)
  br label %271

; <label>:151:                                    ; preds = %45, %40
  store i32 100, i32* %30, align 4
  %152 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %153 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %152, i32 0, i32 7
  %154 = load i32, i32* %153, align 4
  %155 = icmp ne i32 %154, 0
  br i1 %155, label %156, label %158

; <label>:156:                                    ; preds = %151
  %pgocount7 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 13)
  %157 = add i64 %pgocount7, 1
  store i64 %157, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 13)
  store i32 36, i32* %7, align 4
  store i32 576, i32* %8, align 4
  br label %192

; <label>:158:                                    ; preds = %151
  %159 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %160 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %159, i32 0, i32 10
  %161 = load i32, i32* %160, align 8
  %162 = add i32 %161, 1
  store i32 %162, i32* %30, align 4
  %163 = load i32, i32* %30, align 4
  %164 = icmp ult i32 %163, 23
  br i1 %164, label %165, label %166

; <label>:165:                                    ; preds = %158
  br label %169

; <label>:166:                                    ; preds = %158
  %pgocount8 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 22)
  %167 = add i64 %pgocount8, 1
  store i64 %167, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 22)
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 605, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.Huffmancodebits, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %169

; <label>:169:                                    ; preds = %168, %165
  %170 = load i32, i32* %30, align 4
  %171 = zext i32 %170 to i64
  %172 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %171
  %173 = load i32, i32* %172, align 4
  store i32 %173, i32* %7, align 4
  %174 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %175 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %174, i32 0, i32 11
  %176 = load i32, i32* %175, align 4
  %177 = add i32 %176, 1
  %178 = load i32, i32* %30, align 4
  %179 = add i32 %178, %177
  store i32 %179, i32* %30, align 4
  %180 = load i32, i32* %30, align 4
  %181 = icmp ult i32 %180, 23
  br i1 %181, label %182, label %183

; <label>:182:                                    ; preds = %169
  br label %186

; <label>:183:                                    ; preds = %169
  %pgocount9 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 23)
  %184 = add i64 %pgocount9, 1
  store i64 %184, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 23)
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 608, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.Huffmancodebits, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %186

; <label>:186:                                    ; preds = %185, %182
  %pgocount10 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 15)
  %187 = add i64 %pgocount10, 1
  store i64 %187, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 15)
  %188 = load i32, i32* %30, align 4
  %189 = zext i32 %188 to i64
  %190 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %189
  %191 = load i32, i32* %190, align 4
  store i32 %191, i32* %8, align 4
  br label %192

; <label>:192:                                    ; preds = %186, %156
  store i32 0, i32* %9, align 4
  br label %193

; <label>:193:                                    ; preds = %267, %192
  %194 = load i32, i32* %9, align 4
  %195 = load i32, i32* %10, align 4
  %196 = icmp slt i32 %194, %195
  br i1 %196, label %197, label %270

; <label>:197:                                    ; preds = %193
  store i32 100, i32* %31, align 4
  %198 = load i32, i32* %9, align 4
  %199 = load i32, i32* %7, align 4
  %200 = icmp slt i32 %198, %199
  br i1 %200, label %201, label %207

; <label>:201:                                    ; preds = %197
  %pgocount11 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 5)
  %202 = add i64 %pgocount11, 1
  store i64 %202, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 5)
  %203 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %204 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %203, i32 0, i32 8
  %205 = getelementptr inbounds [3 x i32], [3 x i32]* %204, i64 0, i64 0
  %206 = load i32, i32* %205, align 8
  store i32 %206, i32* %31, align 4
  br label %224

; <label>:207:                                    ; preds = %197
  %208 = load i32, i32* %9, align 4
  %209 = load i32, i32* %8, align 4
  %210 = icmp slt i32 %208, %209
  br i1 %210, label %211, label %217

; <label>:211:                                    ; preds = %207
  %pgocount12 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 6)
  %212 = add i64 %pgocount12, 1
  store i64 %212, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 6)
  %213 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %214 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %213, i32 0, i32 8
  %215 = getelementptr inbounds [3 x i32], [3 x i32]* %214, i64 0, i64 1
  %216 = load i32, i32* %215, align 4
  store i32 %216, i32* %31, align 4
  br label %223

; <label>:217:                                    ; preds = %207
  %pgocount13 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 7)
  %218 = add i64 %pgocount13, 1
  store i64 %218, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 7)
  %219 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %220 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %219, i32 0, i32 8
  %221 = getelementptr inbounds [3 x i32], [3 x i32]* %220, i64 0, i64 2
  %222 = load i32, i32* %221, align 8
  store i32 %222, i32* %31, align 4
  br label %223

; <label>:223:                                    ; preds = %217, %211
  br label %224

; <label>:224:                                    ; preds = %223, %201
  %225 = load i32, i32* %31, align 4
  %226 = icmp ult i32 %225, 32
  br i1 %226, label %227, label %228

; <label>:227:                                    ; preds = %224
  br label %231

; <label>:228:                                    ; preds = %224
  %pgocount14 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 17)
  %229 = add i64 %pgocount14, 1
  store i64 %229, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 17)
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 629, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.Huffmancodebits, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %231

; <label>:231:                                    ; preds = %230, %227
  %232 = load i32*, i32** %5, align 8
  %233 = load i32, i32* %9, align 4
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds i32, i32* %232, i64 %234
  %236 = load i32, i32* %235, align 4
  store i32 %236, i32* %14, align 4
  %237 = load i32*, i32** %5, align 8
  %238 = load i32, i32* %9, align 4
  %239 = add nsw i32 %238, 1
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds i32, i32* %237, i64 %240
  %242 = load i32, i32* %241, align 4
  store i32 %242, i32* %15, align 4
  %243 = load i32, i32* %31, align 4
  %244 = icmp ne i32 %243, 0
  br i1 %244, label %245, label %266

; <label>:245:                                    ; preds = %231
  %pgocount15 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 4)
  %246 = add i64 %pgocount15, 1
  store i64 %246, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 4)
  %247 = load i32, i32* %31, align 4
  %248 = load i32, i32* %14, align 4
  %249 = load i32, i32* %15, align 4
  %250 = call i32 @HuffmanCode(i32 %247, i32 %248, i32 %249, i32* %20, i32* %21, i32* %17, i32* %18)
  store i32 %250, i32* %16, align 4
  %251 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %4, align 8
  %252 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %251, align 8
  %253 = load i32, i32* %20, align 4
  %254 = load i32, i32* %17, align 4
  %255 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %252, i32 %253, i32 %254)
  %256 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %4, align 8
  store %struct.BF_PartHolder* %255, %struct.BF_PartHolder** %256, align 8
  %257 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %4, align 8
  %258 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %257, align 8
  %259 = load i32, i32* %21, align 4
  %260 = load i32, i32* %18, align 4
  %261 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %258, i32 %259, i32 %260)
  %262 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %4, align 8
  store %struct.BF_PartHolder* %261, %struct.BF_PartHolder** %262, align 8
  %263 = load i32, i32* %16, align 4
  %264 = load i32, i32* %22, align 4
  %265 = add nsw i32 %264, %263
  store i32 %265, i32* %22, align 4
  br label %266

; <label>:266:                                    ; preds = %245, %231
  br label %267

; <label>:267:                                    ; preds = %266
  %268 = load i32, i32* %9, align 4
  %269 = add nsw i32 %268, 2
  store i32 %269, i32* %9, align 4
  br label %193

; <label>:270:                                    ; preds = %193
  br label %271

; <label>:271:                                    ; preds = %270, %149
  br label %272

; <label>:272:                                    ; preds = %271, %3
  %273 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %274 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %273, i32 0, i32 14
  %275 = load i32, i32* %274, align 8
  %276 = icmp ult i32 %275, 2
  br i1 %276, label %277, label %278

; <label>:277:                                    ; preds = %272
  br label %281

; <label>:278:                                    ; preds = %272
  %pgocount16 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 19)
  %279 = add i64 %pgocount16, 1
  store i64 %279, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 19)
  call void @__assert_fail(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 649, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.Huffmancodebits, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %281

; <label>:281:                                    ; preds = %280, %277
  %282 = load i32, i32* %10, align 4
  %283 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %284 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %283, i32 0, i32 2
  %285 = load i32, i32* %284, align 8
  %286 = mul i32 %285, 4
  %287 = add i32 %282, %286
  store i32 %287, i32* %11, align 4
  %288 = load i32, i32* %11, align 4
  %289 = icmp sle i32 %288, 576
  br i1 %289, label %290, label %291

; <label>:290:                                    ; preds = %281
  br label %294

; <label>:291:                                    ; preds = %281
  %pgocount17 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 20)
  %292 = add i64 %pgocount17, 1
  store i64 %292, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 20)
  call void @__assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 652, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.Huffmancodebits, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %294

; <label>:294:                                    ; preds = %293, %290
  %295 = load i32, i32* %10, align 4
  store i32 %295, i32* %9, align 4
  br label %296

; <label>:296:                                    ; preds = %338, %294
  %297 = load i32, i32* %9, align 4
  %298 = load i32, i32* %11, align 4
  %299 = icmp slt i32 %297, %298
  br i1 %299, label %300, label %342

; <label>:300:                                    ; preds = %296
  %301 = load i32*, i32** %5, align 8
  %302 = load i32, i32* %9, align 4
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds i32, i32* %301, i64 %303
  %305 = load i32, i32* %304, align 4
  store i32 %305, i32* %12, align 4
  %306 = load i32*, i32** %5, align 8
  %307 = load i32, i32* %9, align 4
  %308 = add nsw i32 %307, 1
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds i32, i32* %306, i64 %309
  %311 = load i32, i32* %310, align 4
  store i32 %311, i32* %13, align 4
  %312 = load i32*, i32** %5, align 8
  %313 = load i32, i32* %9, align 4
  %314 = add nsw i32 %313, 2
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds i32, i32* %312, i64 %315
  %317 = load i32, i32* %316, align 4
  store i32 %317, i32* %14, align 4
  %318 = load i32*, i32** %5, align 8
  %319 = load i32, i32* %9, align 4
  %320 = add nsw i32 %319, 3
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds i32, i32* %318, i64 %321
  %323 = load i32, i32* %322, align 4
  store i32 %323, i32* %15, align 4
  %324 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %4, align 8
  %325 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %326 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %325, i32 0, i32 14
  %327 = load i32, i32* %326, align 8
  %328 = add i32 %327, 32
  %329 = zext i32 %328 to i64
  %330 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %329
  %331 = load i32, i32* %12, align 4
  %332 = load i32, i32* %13, align 4
  %333 = load i32, i32* %14, align 4
  %334 = load i32, i32* %15, align 4
  %335 = call i32 @L3_huffman_coder_count1(%struct.BF_PartHolder** %324, %struct.huffcodetab* %330, i32 %331, i32 %332, i32 %333, i32 %334)
  %336 = load i32, i32* %22, align 4
  %337 = add nsw i32 %336, %335
  store i32 %337, i32* %22, align 4
  br label %338

; <label>:338:                                    ; preds = %300
  %pgocount18 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 1)
  %339 = add i64 %pgocount18, 1
  store i64 %339, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 1)
  %340 = load i32, i32* %9, align 4
  %341 = add nsw i32 %340, 4
  store i32 %341, i32* %9, align 4
  br label %296

; <label>:342:                                    ; preds = %296
  %343 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %344 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %343, i32 0, i32 0
  %345 = load i32, i32* %344, align 8
  %346 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %347 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %346, i32 0, i32 15
  %348 = load i32, i32* %347, align 4
  %349 = sub i32 %345, %348
  %350 = load i32, i32* %22, align 4
  %351 = sub i32 %349, %350
  store i32 %351, i32* %19, align 4
  %352 = icmp ne i32 %351, 0
  br i1 %352, label %353, label %388

; <label>:353:                                    ; preds = %342
  %354 = load i32, i32* %19, align 4
  %355 = sdiv i32 %354, 32
  store i32 %355, i32* %32, align 4
  %356 = load i32, i32* %19, align 4
  %357 = srem i32 %356, 32
  store i32 %357, i32* %33, align 4
  %358 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %359 = load i32, i32* %19, align 4
  %360 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %358, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.12, i32 0, i32 0), i32 %359)
  %361 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %362 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %361, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.13, i32 0, i32 0))
  br label %363

; <label>:363:                                    ; preds = %367, %353
  %364 = load i32, i32* %32, align 4
  %365 = add nsw i32 %364, -1
  store i32 %365, i32* %32, align 4
  %366 = icmp ne i32 %364, 0
  br i1 %366, label %367, label %373

; <label>:367:                                    ; preds = %363
  %pgocount19 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 2)
  %368 = add i64 %pgocount19, 1
  store i64 %368, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 2)
  %369 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %4, align 8
  %370 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %369, align 8
  %371 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %370, i32 -1, i32 32)
  %372 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %4, align 8
  store %struct.BF_PartHolder* %371, %struct.BF_PartHolder** %372, align 8
  br label %363

; <label>:373:                                    ; preds = %363
  %374 = load i32, i32* %33, align 4
  %375 = icmp ne i32 %374, 0
  br i1 %375, label %376, label %383

; <label>:376:                                    ; preds = %373
  %pgocount20 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 12)
  %377 = add i64 %pgocount20, 1
  store i64 %377, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 12)
  %378 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %4, align 8
  %379 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %378, align 8
  %380 = load i32, i32* %33, align 4
  %381 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %379, i32 -1, i32 %380)
  %382 = load %struct.BF_PartHolder**, %struct.BF_PartHolder*** %4, align 8
  store %struct.BF_PartHolder* %381, %struct.BF_PartHolder** %382, align 8
  br label %383

; <label>:383:                                    ; preds = %376, %373
  %pgocount21 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 11)
  %384 = add i64 %pgocount21, 1
  store i64 %384, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 11)
  %385 = load i32, i32* %19, align 4
  %386 = load i32, i32* %22, align 4
  %387 = add nsw i32 %386, %385
  store i32 %387, i32* %22, align 4
  br label %388

; <label>:388:                                    ; preds = %383, %342
  %389 = load i32, i32* %22, align 4
  %390 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %391 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %390, i32 0, i32 0
  %392 = load i32, i32* %391, align 8
  %393 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %394 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %393, i32 0, i32 15
  %395 = load i32, i32* %394, align 4
  %396 = sub i32 %392, %395
  %397 = icmp eq i32 %389, %396
  br i1 %397, label %398, label %400

; <label>:398:                                    ; preds = %388
  %pgocount22 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 10)
  %399 = add i64 %pgocount22, 1
  store i64 %399, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 10)
  br label %403

; <label>:400:                                    ; preds = %388
  %pgocount23 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 21)
  %401 = add i64 %pgocount23, 1
  store i64 %401, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_Huffmancodebits, i64 0, i64 21)
  call void @__assert_fail(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 683, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.Huffmancodebits, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %403

; <label>:403:                                    ; preds = %402, %398
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder*, i32, i32) #0 {
  %4 = alloca %struct.BF_PartHolder*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct.BF_PartHolder* %0, %struct.BF_PartHolder** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %8 = load i32, i32* %6, align 4
  %9 = shl i32 1, %8
  store i32 %9, i32* %7, align 4
  br label %10

; <label>:10:                                     ; preds = %34, %3
  %11 = load i32, i32* %7, align 4
  %12 = lshr i32 %11, 1
  store i32 %12, i32* %7, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %36

; <label>:14:                                     ; preds = %10
  %15 = load i32, i32* @crc, align 4
  %16 = shl i32 %15, 1
  store i32 %16, i32* @crc, align 4
  %17 = load i32, i32* @crc, align 4
  %18 = and i32 %17, 65536
  %19 = icmp ne i32 %18, 0
  %20 = xor i1 %19, true
  %21 = zext i1 %20 to i32
  %22 = load i32, i32* %5, align 4
  %23 = load i32, i32* %7, align 4
  %24 = and i32 %22, %23
  %25 = icmp ne i32 %24, 0
  %26 = xor i1 %25, true
  %27 = zext i1 %26 to i32
  %28 = xor i32 %21, %27
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %34

; <label>:30:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_CRC_BF_addEntry, i64 0, i64 1)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_CRC_BF_addEntry, i64 0, i64 1)
  %32 = load i32, i32* @crc, align 4
  %33 = xor i32 %32, 32773
  store i32 %33, i32* @crc, align 4
  br label %34

; <label>:34:                                     ; preds = %30, %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_CRC_BF_addEntry, i64 0, i64 0)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_CRC_BF_addEntry, i64 0, i64 0)
  br label %10

; <label>:36:                                     ; preds = %10
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_CRC_BF_addEntry, i64 0, i64 2)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_CRC_BF_addEntry, i64 0, i64 2)
  %38 = load i32, i32* @crc, align 4
  %39 = and i32 %38, 65535
  store i32 %39, i32* @crc, align 4
  %40 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %4, align 8
  %41 = load i32, i32* %5, align 4
  %42 = load i32, i32* %6, align 4
  %43 = call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %40, i32 %41, i32 %42)
  ret %struct.BF_PartHolder* %43
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
