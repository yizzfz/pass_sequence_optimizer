; ModuleID = 'bzlib.2.ll'
source_filename = "bzlib.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.bz_stream = type { i8*, i32, i32, i32, i8*, i32, i32, i32, i8*, i8* (i8*, i32, i32)*, void (i8*, i8*)*, i8* }
%struct.EState = type { %struct.bz_stream*, i32, i32, i32, i32*, i32*, i32*, i32, i32*, i8*, i16*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [256 x i8], [256 x i8], i32, i32, i32, i32, i32, i32, i32, i32, [258 x i32], [18002 x i8], [18002 x i8], [6 x [258 x i8]], [6 x [258 x i32]], [6 x [258 x i32]], [258 x [4 x i32]] }
%struct.DState = type { %struct.bz_stream*, i32, i8, i32, i8, i32, i32, i32, i32, i32, i8, i32, i32, i32, i32, i32, [256 x i32], i32, [257 x i32], [257 x i32], i32*, i16*, i8*, i32, i32, i32, i32, i32, [256 x i8], [16 x i8], [256 x i8], [4096 x i8], [16 x i32], [18002 x i8], [18002 x i8], [6 x [258 x i8]], [6 x [258 x i32]], [6 x [258 x i32]], [6 x [258 x i32]], [6 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, i32*, i32* }
%struct.bzFile = type { %struct._IO_FILE*, [5000 x i8], i32, i8, %struct.bz_stream, i32, i8 }

$__llvm_profile_raw_version = comdat any

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [443 x i8] c"\0A\0Abzip2/libbzip2: internal error number %d.\0AThis is a bug in bzip2/libbzip2, %s.\0APlease report it to me at: jseward@bzip.org.  If this happened\0Awhen you were using some program which uses libbzip2 as a\0Acomponent, you should also report this bug to the author(s)\0Aof that program.  Please make an effort to report this bug;\0Atimely and accurate bug reports eventually lead to higher\0Aquality software.  Thanks.  Julian Seward, 15 February 2005.\0A\0A\00", align 1
@.str.1 = private unnamed_addr constant [1057 x i8] c"\0A*** A special note about internal error number 1007 ***\0A\0AExperience suggests that a common cause of i.e. 1007\0Ais unreliable memory or other hardware.  The 1007 assertion\0Ajust happens to cross-check the results of huge numbers of\0Amemory reads/writes, and so acts (unintendedly) as a stress\0Atest of your memory system.\0A\0AI suggest the following: try compressing the file again,\0Apossibly monitoring progress in detail with the -vv flag.\0A\0A* If the error cannot be reproduced, and/or happens at different\0A  points in compression, you may have a flaky memory system.\0A  Try a memory-test program.  I have used Memtest86\0A  (www.memtest86.com).  At the time of writing it is free (GPLd).\0A  Memtest86 tests memory much more thorougly than your BIOSs\0A  power-on test, and may find failures that the BIOS doesn't.\0A\0A* If the error can be repeatably reproduced, this is a bug in\0A  bzip2, and I would very much like to hear about it.  Please\0A  let me know, and, ideally, save a copy of the file causing the\0A  problem -- without which I will be unable to investigate it.\0A\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c" {0x%08x, 0x%08x}\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@.str.4 = private unnamed_addr constant [55 x i8] c"\0A    combined CRCs: stored = 0x%08x, computed = 0x%08x\00", align 1
@.str.5 = private unnamed_addr constant [19 x i8] c"1.0.4, 20-Dec-2006\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@stdout = external global %struct._IO_FILE*, align 8
@bzerrorstrings = internal global [16 x i8*] [i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0)], align 16
@BZ2_crc32Table = external global [256 x i32], align 16
@BZ2_rNums = external global [512 x i32], align 16
@.str.6 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str.9 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"OK\00", align 1
@.str.11 = private unnamed_addr constant [15 x i8] c"SEQUENCE_ERROR\00", align 1
@.str.12 = private unnamed_addr constant [12 x i8] c"PARAM_ERROR\00", align 1
@.str.13 = private unnamed_addr constant [10 x i8] c"MEM_ERROR\00", align 1
@.str.14 = private unnamed_addr constant [11 x i8] c"DATA_ERROR\00", align 1
@.str.15 = private unnamed_addr constant [17 x i8] c"DATA_ERROR_MAGIC\00", align 1
@.str.16 = private unnamed_addr constant [9 x i8] c"IO_ERROR\00", align 1
@.str.17 = private unnamed_addr constant [15 x i8] c"UNEXPECTED_EOF\00", align 1
@.str.18 = private unnamed_addr constant [13 x i8] c"OUTBUFF_FULL\00", align 1
@.str.19 = private unnamed_addr constant [13 x i8] c"CONFIG_ERROR\00", align 1
@.str.20 = private unnamed_addr constant [4 x i8] c"???\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_BZ2_bz__AssertH__fail = private constant [21 x i8] c"BZ2_bz__AssertH__fail"
@__profn_BZ2_bzlibVersion = private constant [16 x i8] c"BZ2_bzlibVersion"
@__profn_BZ2_bzCompressInit = private constant [18 x i8] c"BZ2_bzCompressInit"
@__profn_tmp1.ll_bz_config_ok = private constant [20 x i8] c"tmp1.ll:bz_config_ok"
@__profn_tmp1.ll_default_bzalloc = private constant [23 x i8] c"tmp1.ll:default_bzalloc"
@__profn_tmp1.ll_default_bzfree = private constant [22 x i8] c"tmp1.ll:default_bzfree"
@__profn_tmp1.ll_init_RL = private constant [15 x i8] c"tmp1.ll:init_RL"
@__profn_tmp1.ll_prepare_new_block = private constant [25 x i8] c"tmp1.ll:prepare_new_block"
@__profn_BZ2_bzCompress = private constant [14 x i8] c"BZ2_bzCompress"
@__profn_tmp1.ll_handle_compress = private constant [23 x i8] c"tmp1.ll:handle_compress"
@__profn_tmp1.ll_isempty_RL = private constant [18 x i8] c"tmp1.ll:isempty_RL"
@__profn_BZ2_bzCompressEnd = private constant [17 x i8] c"BZ2_bzCompressEnd"
@__profn_BZ2_bzDecompressInit = private constant [20 x i8] c"BZ2_bzDecompressInit"
@__profn_BZ2_indexIntoF = private constant [14 x i8] c"BZ2_indexIntoF"
@__profn_BZ2_bzDecompress = private constant [16 x i8] c"BZ2_bzDecompress"
@__profn_tmp1.ll_unRLE_obuf_to_output_SMALL = private constant [34 x i8] c"tmp1.ll:unRLE_obuf_to_output_SMALL"
@__profn_tmp1.ll_unRLE_obuf_to_output_FAST = private constant [33 x i8] c"tmp1.ll:unRLE_obuf_to_output_FAST"
@__profn_BZ2_bzDecompressEnd = private constant [19 x i8] c"BZ2_bzDecompressEnd"
@__profn_BZ2_bzWriteOpen = private constant [15 x i8] c"BZ2_bzWriteOpen"
@__profn_BZ2_bzWrite = private constant [11 x i8] c"BZ2_bzWrite"
@__profn_BZ2_bzWriteClose = private constant [16 x i8] c"BZ2_bzWriteClose"
@__profn_BZ2_bzWriteClose64 = private constant [18 x i8] c"BZ2_bzWriteClose64"
@__profn_BZ2_bzReadOpen = private constant [14 x i8] c"BZ2_bzReadOpen"
@__profn_BZ2_bzReadClose = private constant [15 x i8] c"BZ2_bzReadClose"
@__profn_BZ2_bzRead = private constant [10 x i8] c"BZ2_bzRead"
@__profn_tmp1.ll_myfeof = private constant [14 x i8] c"tmp1.ll:myfeof"
@__profn_BZ2_bzReadGetUnused = private constant [19 x i8] c"BZ2_bzReadGetUnused"
@__profn_BZ2_bzBuffToBuffCompress = private constant [24 x i8] c"BZ2_bzBuffToBuffCompress"
@__profn_BZ2_bzBuffToBuffDecompress = private constant [26 x i8] c"BZ2_bzBuffToBuffDecompress"
@__profn_BZ2_bzopen = private constant [10 x i8] c"BZ2_bzopen"
@__profn_tmp1.ll_bzopen_or_bzdopen = private constant [25 x i8] c"tmp1.ll:bzopen_or_bzdopen"
@__profn_BZ2_bzdopen = private constant [11 x i8] c"BZ2_bzdopen"
@__profn_BZ2_bzread = private constant [10 x i8] c"BZ2_bzread"
@__profn_BZ2_bzwrite = private constant [11 x i8] c"BZ2_bzwrite"
@__profn_BZ2_bzflush = private constant [11 x i8] c"BZ2_bzflush"
@__profn_BZ2_bzclose = private constant [11 x i8] c"BZ2_bzclose"
@__profn_BZ2_bzerror = private constant [11 x i8] c"BZ2_bzerror"
@__profn_tmp1.ll_copy_output_until_stop = private constant [30 x i8] c"tmp1.ll:copy_output_until_stop"
@__profn_tmp1.ll_copy_input_until_stop = private constant [29 x i8] c"tmp1.ll:copy_input_until_stop"
@__profn_tmp1.ll_flush_RL = private constant [16 x i8] c"tmp1.ll:flush_RL"
@__profn_tmp1.ll_add_pair_to_block = private constant [25 x i8] c"tmp1.ll:add_pair_to_block"
@__profc_BZ2_bz__AssertH__fail = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bz__AssertH__fail = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4050461313191312572, i64 29866266370, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BZ2_bz__AssertH__fail, i32 0, i32 0), i8* bitcast (void (i32)* @BZ2_bz__AssertH__fail to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzlibVersion = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzlibVersion = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 177773541206363855, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BZ2_bzlibVersion, i32 0, i32 0), i8* bitcast (i8* ()* @BZ2_bzlibVersion to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzCompressInit = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_BZ2_bzCompressInit = private global [8 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_BZ2_bzCompressInit = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9134208065542689945, i64 2252009229289160, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i32 0, i32 0), i8* bitcast (i32 (%struct.bz_stream*, i32, i32, i32)* @BZ2_bzCompressInit to i8*), i8* bitcast ([8 x i64]* @__profvp_BZ2_bzCompressInit to i8*), i32 18, [1 x i16] [i16 8] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_bz_config_ok = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_bz_config_ok = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6409985721022835712, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_bz_config_ok, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_default_bzalloc = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_default_bzalloc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7077436041178340894, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_default_bzalloc, i32 0, i32 0), i8* bitcast (i8* (i8*, i32, i32)* @default_bzalloc to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_default_bzfree = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_default_bzfree = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6636112626458944758, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_default_bzfree, i32 0, i32 0), i8* bitcast (void (i8*, i8*)* @default_bzfree to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_init_RL = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_init_RL = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6172350420042838649, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_init_RL, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_prepare_new_block = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_prepare_new_block = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9001409856428930822, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_prepare_new_block, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzCompress = private global [23 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzCompress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1295149476940134017, i64 72057854782963137, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i32 0, i32 0), i8* bitcast (i32 (%struct.bz_stream*, i32)* @BZ2_bzCompress to i8*), i8* null, i32 23, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_handle_compress = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_handle_compress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8286956505770759442, i64 186636646006, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i32 0, i32 0), i8* null, i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_isempty_RL = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_isempty_RL = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1467591784983450666, i64 38490985531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_isempty_RL, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzCompressEnd = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_BZ2_bzCompressEnd = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_BZ2_bzCompressEnd = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9053029052799593625, i64 1125990365691584, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzCompressEnd, i32 0, i32 0), i8* bitcast (i32 (%struct.bz_stream*)* @BZ2_bzCompressEnd to i8*), i8* bitcast ([4 x i64]* @__profvp_BZ2_bzCompressEnd to i8*), i32 7, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzDecompressInit = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_BZ2_bzDecompressInit = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_BZ2_bzDecompressInit = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7681512082262324031, i64 281596376853221, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i32 0, i32 0), i8* bitcast (i32 (%struct.bz_stream*, i32, i32)* @BZ2_bzDecompressInit to i8*), i8* bitcast ([1 x i64]* @__profvp_BZ2_bzDecompressInit to i8*), i32 10, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_BZ2_indexIntoF = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_indexIntoF = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2870330384686011726, i64 46522476818, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BZ2_indexIntoF, i32 0, i32 0), i8* bitcast (i32 (i32, i32*)* @BZ2_indexIntoF to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzDecompress = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzDecompress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6330148090501954947, i64 244511049594, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i32 0, i32 0), i8* bitcast (i32 (%struct.bz_stream*)* @BZ2_bzDecompress to i8*), i8* null, i32 18, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_unRLE_obuf_to_output_SMALL = private global [39 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_unRLE_obuf_to_output_SMALL = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 788363367450114060, i64 360288436966731143, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i32 0, i32 0), i8* null, i8* null, i32 39, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_unRLE_obuf_to_output_FAST = private global [41 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_unRLE_obuf_to_output_FAST = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3300342285622915629, i64 360288475363406530, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i32 0, i32 0), i8* null, i8* null, i32 41, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzDecompressEnd = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_BZ2_bzDecompressEnd = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_BZ2_bzDecompressEnd = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3862768639514119315, i64 1125990365691584, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzDecompressEnd, i32 0, i32 0), i8* bitcast (i32 (%struct.bz_stream*)* @BZ2_bzDecompressEnd to i8*), i8* bitcast ([4 x i64]* @__profvp_BZ2_bzDecompressEnd to i8*), i32 7, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzWriteOpen = private global [24 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzWriteOpen = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7473438680309283923, i64 287475056860, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i32 0, i32 0), i8* bitcast (i8* (i32*, %struct._IO_FILE*, i32, i32, i32)* @BZ2_bzWriteOpen to i8*), i8* null, i32 24, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzWrite = private global [28 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzWrite = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6361940542218147207, i64 352846946478, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i32 0, i32 0), i8* bitcast (void (i32*, i8*, i8*, i32)* @BZ2_bzWrite to i8*), i8* null, i32 28, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzWriteClose = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzWriteClose = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8913003552658465658, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BZ2_bzWriteClose, i32 0, i32 0), i8* bitcast (void (i32*, i8*, i32, i32*, i32*)* @BZ2_bzWriteClose to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzWriteClose64 = private global [37 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzWriteClose64 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8677243948633110682, i64 469189040615, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i32 0, i32 0), i8* bitcast (void (i32*, i8*, i32, i32*, i32*, i32*, i32*)* @BZ2_bzWriteClose64 to i8*), i8* null, i32 37, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzReadOpen = private global [27 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzReadOpen = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3230503366263752546, i64 317010203873, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i32 0, i32 0), i8* bitcast (i8* (i32*, %struct._IO_FILE*, i32, i32, i8*, i32)* @BZ2_bzReadOpen to i8*), i8* null, i32 27, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzReadClose = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzReadClose = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2138830126146999163, i64 131174562557, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i32 0, i32 0), i8* bitcast (void (i32*, i8*)* @BZ2_bzReadClose to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzRead = private global [38 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzRead = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2301702443045823317, i64 466458770178, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i32 0, i32 0), i8* bitcast (i32 (i32*, i8*, i8*, i32)* @BZ2_bzRead to i8*), i8* null, i32 38, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_myfeof = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_myfeof = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5503725093352131782, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_myfeof, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzReadGetUnused = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzReadGetUnused = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1939770881728471179, i64 165948831267, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i32 0, i32 0), i8* bitcast (void (i32*, i8*, i8**, i32*)* @BZ2_bzReadGetUnused to i8*), i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzBuffToBuffCompress = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzBuffToBuffCompress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -344912832508505767, i64 158229445165, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i32 0, i32 0), i8* bitcast (i32 (i8*, i32*, i8*, i32, i32, i32, i32)* @BZ2_bzBuffToBuffCompress to i8*), i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzBuffToBuffDecompress = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzBuffToBuffDecompress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3596162847266209711, i64 140106921845, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i32 0, i32 0), i8* bitcast (i32 (i8*, i32*, i8*, i32, i32, i32)* @BZ2_bzBuffToBuffDecompress to i8*), i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzopen = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzopen = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6677349881952358697, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BZ2_bzopen, i32 0, i32 0), i8* bitcast (i8* (i8*, i8*)* @BZ2_bzopen to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_bzopen_or_bzdopen = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_bzopen_or_bzdopen = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6531935812533160945, i64 72057836777098722, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i32 0, i32 0), i8* null, i8* null, i32 19, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzdopen = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzdopen = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7196284698182978306, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BZ2_bzdopen, i32 0, i32 0), i8* bitcast (i8* (i32, i8*)* @BZ2_bzdopen to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzread = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzread = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8362904490389047472, i64 50515727635, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BZ2_bzread, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*, i32)* @BZ2_bzread to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzwrite = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzwrite = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9062485201615196721, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BZ2_bzwrite, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*, i32)* @BZ2_bzwrite to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzflush = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzflush = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2317139712487827763, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BZ2_bzflush, i32 0, i32 0), i8* bitcast (i32 (i8*)* @BZ2_bzflush to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzclose = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzclose = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8469914315670655391, i64 73406974495, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BZ2_bzclose, i32 0, i32 0), i8* bitcast (void (i8*)* @BZ2_bzclose to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BZ2_bzerror = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BZ2_bzerror = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4512829092682749914, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BZ2_bzerror, i32 0, i32 0), i8* bitcast (i8* (i8*, i32*)* @BZ2_bzerror to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_copy_output_until_stop = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_copy_output_until_stop = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4447106681188882436, i64 60111028704, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_copy_output_until_stop, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_copy_input_until_stop = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_copy_input_until_stop = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1975136484263758967, i64 262112668820, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i32 0, i32 0), i8* null, i8* null, i32 19, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_flush_RL = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_flush_RL = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3902392304005613735, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_flush_RL, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_add_pair_to_block = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_add_pair_to_block = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5229906405426987013, i64 64548518285, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_add_pair_to_block, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [17 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [322 x i8] c"\96\06\BE\02x\DA}RMO\C30\0C\D5\FE\10\12\08q\E0\B6\8D\0D&\15!m\03$.V\DA8,Z\1AG\F9\D0\18\BF\9E\A4\EB\D2l\03.\95\FD\9E\9F\FD\ECf\F2q\03\F57\C0\D89\B4\FE\09@0\A9F\93\0EU\B2~C\EB$\E9\1E\98Rk,:\B7\D0\D2\8F|k\AE\AF\94\BA\8F\EA\86\B4\90\9F@\DB\0Cr\14,(\1F5L)j~\C1\85E\CC\B0\8C\0DaY\E5<N1\CC\22h\DCA\1D\F5\DB3\03\B9p\C34W\18\0D\9C\E1\D2ak\FC>\F5<U\CE4\EF\91\07l\CAu\12(5\C7\AF\85\F64\BF\A8\C9\9D\83^V3\A0:\08\F0\04\14\BC\09\1EV\CF\E3\AA\FA\BFd>^\AD/\BA\0En\DE\AD\F4\F8bP\97y\19O\15\B9K\E0\EE\B6\87\96\C8x!Oi\A9Hy\F6\D7\EE\05\92(\98G\F4\AF:8<\9A\99\04!\D6\94\BE\F9\E0\E7Dq\99\03Ei\F8\F0&R\0Ad#\C1i\B0U\C66Y:\84\BBbY\A1\82\DB\F4qSl\80\D6\92\CD\03\1A2\FB\E3e\83\F6R\81\F3dNi\A9\FF`\BB\11\E5sc\9C\83a\D2\A6\DF\D5=\B7\1FT\FE\1D\95", section "__llvm_prf_names"
@llvm.used = appending global [43 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bz__AssertH__fail to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzlibVersion to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzCompressInit to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_bz_config_ok to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_default_bzalloc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_default_bzfree to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_init_RL to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_new_block to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzCompress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_handle_compress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_isempty_RL to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzCompressEnd to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzDecompressInit to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_indexIntoF to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzDecompress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_unRLE_obuf_to_output_SMALL to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_unRLE_obuf_to_output_FAST to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzDecompressEnd to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzWriteOpen to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzWrite to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzWriteClose to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzWriteClose64 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzReadOpen to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzReadClose to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzRead to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_myfeof to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzReadGetUnused to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzBuffToBuffCompress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzBuffToBuffDecompress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzopen to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_bzopen_or_bzdopen to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzdopen to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzread to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzwrite to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzflush to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzclose to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzerror to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_copy_output_until_stop to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_copy_input_until_stop to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_flush_RL to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_add_pair_to_block to i8*), i8* bitcast ([17 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([322 x i8], [322 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @BZ2_bz__AssertH__fail(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = load i32, i32* %2, align 4
  %5 = call i8* @BZ2_bzlibVersion()
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([443 x i8], [443 x i8]* @.str, i32 0, i32 0), i32 %4, i8* %5)
  %7 = load i32, i32* %2, align 4
  %8 = icmp eq i32 %7, 1007
  br i1 %8, label %9, label %13

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BZ2_bz__AssertH__fail, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BZ2_bz__AssertH__fail, i64 0, i64 1)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([1057 x i8], [1057 x i8]* @.str.1, i32 0, i32 0))
  br label %13

; <label>:13:                                     ; preds = %9, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BZ2_bz__AssertH__fail, i64 0, i64 0)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BZ2_bz__AssertH__fail, i64 0, i64 0)
  call void @exit(i32 3) #9
  unreachable
                                                  ; No predecessors!
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define i8* @BZ2_bzlibVersion() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BZ2_bzlibVersion, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BZ2_bzlibVersion, i64 0, i64 0)
  ret i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i32 0, i32 0)
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind uwtable
define i32 @BZ2_bzCompressInit(%struct.bz_stream*, i32, i32, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.bz_stream*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.EState*, align 8
  store %struct.bz_stream* %0, %struct.bz_stream** %6, align 8
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  %12 = call i32 @bz_config_ok()
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %16, label %14

; <label>:14:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 2)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 2)
  store i32 -9, i32* %5, align 4
  br label %271

; <label>:16:                                     ; preds = %4
  %17 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %18 = icmp eq %struct.bz_stream* %17, null
  br i1 %18, label %35, label %19

; <label>:19:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 1)
  %21 = load i32, i32* %7, align 4
  %22 = icmp slt i32 %21, 1
  br i1 %22, label %35, label %23

; <label>:23:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 3)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 3)
  %25 = load i32, i32* %7, align 4
  %26 = icmp sgt i32 %25, 9
  br i1 %26, label %35, label %27

; <label>:27:                                     ; preds = %23
  %pgocount3 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 4)
  %28 = add i64 %pgocount3, 1
  store i64 %28, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 4)
  %29 = load i32, i32* %9, align 4
  %30 = icmp slt i32 %29, 0
  br i1 %30, label %35, label %31

; <label>:31:                                     ; preds = %27
  %pgocount4 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 5)
  %32 = add i64 %pgocount4, 1
  store i64 %32, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 5)
  %33 = load i32, i32* %9, align 4
  %34 = icmp sgt i32 %33, 250
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %31, %27, %23, %19, %16
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 0)
  %36 = add i64 %pgocount5, 1
  store i64 %36, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 0)
  store i32 -2, i32* %5, align 4
  br label %271

; <label>:37:                                     ; preds = %31
  %38 = load i32, i32* %9, align 4
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %42

; <label>:40:                                     ; preds = %37
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 8)
  %41 = add i64 %pgocount6, 1
  store i64 %41, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 8)
  store i32 30, i32* %9, align 4
  br label %42

; <label>:42:                                     ; preds = %40, %37
  %43 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %44 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %43, i32 0, i32 9
  %45 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %44, align 8
  %46 = icmp eq i8* (i8*, i32, i32)* %45, null
  br i1 %46, label %47, label %51

; <label>:47:                                     ; preds = %42
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 9)
  %48 = add i64 %pgocount7, 1
  store i64 %48, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 9)
  %49 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %50 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %49, i32 0, i32 9
  store i8* (i8*, i32, i32)* @default_bzalloc, i8* (i8*, i32, i32)** %50, align 8
  br label %51

; <label>:51:                                     ; preds = %47, %42
  %52 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %53 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %52, i32 0, i32 10
  %54 = load void (i8*, i8*)*, void (i8*, i8*)** %53, align 8
  %55 = icmp eq void (i8*, i8*)* %54, null
  br i1 %55, label %56, label %60

; <label>:56:                                     ; preds = %51
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 10)
  %57 = add i64 %pgocount8, 1
  store i64 %57, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 10)
  %58 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %59 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %58, i32 0, i32 10
  store void (i8*, i8*)* @default_bzfree, void (i8*, i8*)** %59, align 8
  br label %60

; <label>:60:                                     ; preds = %56, %51
  %61 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %62 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %61, i32 0, i32 9
  %63 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %62, align 8
  %64 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %65 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %64, i32 0, i32 11
  %66 = load i8*, i8** %65, align 8
  %67 = ptrtoint i8* (i8*, i32, i32)* %63 to i64
  call void @__llvm_profile_instrument_target(i64 %67, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzCompressInit to i8*), i32 0)
  %68 = call i8* %63(i8* %66, i32 55768, i32 1)
  %69 = bitcast i8* %68 to %struct.EState*
  store %struct.EState* %69, %struct.EState** %11, align 8
  %70 = load %struct.EState*, %struct.EState** %11, align 8
  %71 = icmp eq %struct.EState* %70, null
  br i1 %71, label %72, label %74

; <label>:72:                                     ; preds = %60
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 11)
  %73 = add i64 %pgocount9, 1
  store i64 %73, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 11)
  store i32 -3, i32* %5, align 4
  br label %271

; <label>:74:                                     ; preds = %60
  %75 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %76 = load %struct.EState*, %struct.EState** %11, align 8
  %77 = getelementptr inbounds %struct.EState, %struct.EState* %76, i32 0, i32 0
  store %struct.bz_stream* %75, %struct.bz_stream** %77, align 8
  %78 = load %struct.EState*, %struct.EState** %11, align 8
  %79 = getelementptr inbounds %struct.EState, %struct.EState* %78, i32 0, i32 4
  store i32* null, i32** %79, align 8
  %80 = load %struct.EState*, %struct.EState** %11, align 8
  %81 = getelementptr inbounds %struct.EState, %struct.EState* %80, i32 0, i32 5
  store i32* null, i32** %81, align 8
  %82 = load %struct.EState*, %struct.EState** %11, align 8
  %83 = getelementptr inbounds %struct.EState, %struct.EState* %82, i32 0, i32 6
  store i32* null, i32** %83, align 8
  %84 = load i32, i32* %7, align 4
  %85 = mul nsw i32 100000, %84
  store i32 %85, i32* %10, align 4
  %86 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %87 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %86, i32 0, i32 9
  %88 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %87, align 8
  %89 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %90 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %89, i32 0, i32 11
  %91 = load i8*, i8** %90, align 8
  %92 = load i32, i32* %10, align 4
  %93 = sext i32 %92 to i64
  %94 = mul i64 %93, 4
  %95 = trunc i64 %94 to i32
  %96 = ptrtoint i8* (i8*, i32, i32)* %88 to i64
  call void @__llvm_profile_instrument_target(i64 %96, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzCompressInit to i8*), i32 1)
  %97 = call i8* %88(i8* %91, i32 %95, i32 1)
  %98 = bitcast i8* %97 to i32*
  %99 = load %struct.EState*, %struct.EState** %11, align 8
  %100 = getelementptr inbounds %struct.EState, %struct.EState* %99, i32 0, i32 4
  store i32* %98, i32** %100, align 8
  %101 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %102 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %101, i32 0, i32 9
  %103 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %102, align 8
  %104 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %105 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %104, i32 0, i32 11
  %106 = load i8*, i8** %105, align 8
  %107 = load i32, i32* %10, align 4
  %108 = add nsw i32 %107, 34
  %109 = sext i32 %108 to i64
  %110 = mul i64 %109, 4
  %111 = trunc i64 %110 to i32
  %112 = ptrtoint i8* (i8*, i32, i32)* %103 to i64
  call void @__llvm_profile_instrument_target(i64 %112, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzCompressInit to i8*), i32 2)
  %113 = call i8* %103(i8* %106, i32 %111, i32 1)
  %114 = bitcast i8* %113 to i32*
  %115 = load %struct.EState*, %struct.EState** %11, align 8
  %116 = getelementptr inbounds %struct.EState, %struct.EState* %115, i32 0, i32 5
  store i32* %114, i32** %116, align 8
  %117 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %118 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %117, i32 0, i32 9
  %119 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %118, align 8
  %120 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %121 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %120, i32 0, i32 11
  %122 = load i8*, i8** %121, align 8
  %123 = ptrtoint i8* (i8*, i32, i32)* %119 to i64
  call void @__llvm_profile_instrument_target(i64 %123, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzCompressInit to i8*), i32 3)
  %124 = call i8* %119(i8* %122, i32 262148, i32 1)
  %125 = bitcast i8* %124 to i32*
  %126 = load %struct.EState*, %struct.EState** %11, align 8
  %127 = getelementptr inbounds %struct.EState, %struct.EState* %126, i32 0, i32 6
  store i32* %125, i32** %127, align 8
  %128 = load %struct.EState*, %struct.EState** %11, align 8
  %129 = getelementptr inbounds %struct.EState, %struct.EState* %128, i32 0, i32 4
  %130 = load i32*, i32** %129, align 8
  %131 = icmp eq i32* %130, null
  br i1 %131, label %144, label %132

; <label>:132:                                    ; preds = %74
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 7)
  %133 = add i64 %pgocount10, 1
  store i64 %133, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 7)
  %134 = load %struct.EState*, %struct.EState** %11, align 8
  %135 = getelementptr inbounds %struct.EState, %struct.EState* %134, i32 0, i32 5
  %136 = load i32*, i32** %135, align 8
  %137 = icmp eq i32* %136, null
  br i1 %137, label %144, label %138

; <label>:138:                                    ; preds = %132
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 16)
  %139 = add i64 %pgocount11, 1
  store i64 %139, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 16)
  %140 = load %struct.EState*, %struct.EState** %11, align 8
  %141 = getelementptr inbounds %struct.EState, %struct.EState* %140, i32 0, i32 6
  %142 = load i32*, i32** %141, align 8
  %143 = icmp eq i32* %142, null
  br i1 %143, label %144, label %214

; <label>:144:                                    ; preds = %138, %132, %74
  %145 = load %struct.EState*, %struct.EState** %11, align 8
  %146 = getelementptr inbounds %struct.EState, %struct.EState* %145, i32 0, i32 4
  %147 = load i32*, i32** %146, align 8
  %148 = icmp ne i32* %147, null
  br i1 %148, label %149, label %162

; <label>:149:                                    ; preds = %144
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 12)
  %150 = add i64 %pgocount12, 1
  store i64 %150, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 12)
  %151 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %152 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %151, i32 0, i32 10
  %153 = load void (i8*, i8*)*, void (i8*, i8*)** %152, align 8
  %154 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %155 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %154, i32 0, i32 11
  %156 = load i8*, i8** %155, align 8
  %157 = load %struct.EState*, %struct.EState** %11, align 8
  %158 = getelementptr inbounds %struct.EState, %struct.EState* %157, i32 0, i32 4
  %159 = load i32*, i32** %158, align 8
  %160 = bitcast i32* %159 to i8*
  %161 = ptrtoint void (i8*, i8*)* %153 to i64
  call void @__llvm_profile_instrument_target(i64 %161, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzCompressInit to i8*), i32 4)
  call void %153(i8* %156, i8* %160)
  br label %162

; <label>:162:                                    ; preds = %149, %144
  %163 = load %struct.EState*, %struct.EState** %11, align 8
  %164 = getelementptr inbounds %struct.EState, %struct.EState* %163, i32 0, i32 5
  %165 = load i32*, i32** %164, align 8
  %166 = icmp ne i32* %165, null
  br i1 %166, label %167, label %180

; <label>:167:                                    ; preds = %162
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 13)
  %168 = add i64 %pgocount13, 1
  store i64 %168, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 13)
  %169 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %170 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %169, i32 0, i32 10
  %171 = load void (i8*, i8*)*, void (i8*, i8*)** %170, align 8
  %172 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %173 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %172, i32 0, i32 11
  %174 = load i8*, i8** %173, align 8
  %175 = load %struct.EState*, %struct.EState** %11, align 8
  %176 = getelementptr inbounds %struct.EState, %struct.EState* %175, i32 0, i32 5
  %177 = load i32*, i32** %176, align 8
  %178 = bitcast i32* %177 to i8*
  %179 = ptrtoint void (i8*, i8*)* %171 to i64
  call void @__llvm_profile_instrument_target(i64 %179, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzCompressInit to i8*), i32 5)
  call void %171(i8* %174, i8* %178)
  br label %180

; <label>:180:                                    ; preds = %167, %162
  %181 = load %struct.EState*, %struct.EState** %11, align 8
  %182 = getelementptr inbounds %struct.EState, %struct.EState* %181, i32 0, i32 6
  %183 = load i32*, i32** %182, align 8
  %184 = icmp ne i32* %183, null
  br i1 %184, label %185, label %198

; <label>:185:                                    ; preds = %180
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 14)
  %186 = add i64 %pgocount14, 1
  store i64 %186, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 14)
  %187 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %188 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %187, i32 0, i32 10
  %189 = load void (i8*, i8*)*, void (i8*, i8*)** %188, align 8
  %190 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %191 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %190, i32 0, i32 11
  %192 = load i8*, i8** %191, align 8
  %193 = load %struct.EState*, %struct.EState** %11, align 8
  %194 = getelementptr inbounds %struct.EState, %struct.EState* %193, i32 0, i32 6
  %195 = load i32*, i32** %194, align 8
  %196 = bitcast i32* %195 to i8*
  %197 = ptrtoint void (i8*, i8*)* %189 to i64
  call void @__llvm_profile_instrument_target(i64 %197, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzCompressInit to i8*), i32 6)
  call void %189(i8* %192, i8* %196)
  br label %198

; <label>:198:                                    ; preds = %185, %180
  %199 = load %struct.EState*, %struct.EState** %11, align 8
  %200 = icmp ne %struct.EState* %199, null
  br i1 %200, label %201, label %212

; <label>:201:                                    ; preds = %198
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 15)
  %202 = add i64 %pgocount15, 1
  store i64 %202, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 15)
  %203 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %204 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %203, i32 0, i32 10
  %205 = load void (i8*, i8*)*, void (i8*, i8*)** %204, align 8
  %206 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %207 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %206, i32 0, i32 11
  %208 = load i8*, i8** %207, align 8
  %209 = load %struct.EState*, %struct.EState** %11, align 8
  %210 = bitcast %struct.EState* %209 to i8*
  %211 = ptrtoint void (i8*, i8*)* %205 to i64
  call void @__llvm_profile_instrument_target(i64 %211, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzCompressInit to i8*), i32 7)
  call void %205(i8* %208, i8* %210)
  br label %212

; <label>:212:                                    ; preds = %201, %198
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 6)
  %213 = add i64 %pgocount16, 1
  store i64 %213, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 6)
  store i32 -3, i32* %5, align 4
  br label %271

; <label>:214:                                    ; preds = %138
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 17)
  %215 = add i64 %pgocount17, 1
  store i64 %215, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzCompressInit, i64 0, i64 17)
  %216 = load %struct.EState*, %struct.EState** %11, align 8
  %217 = getelementptr inbounds %struct.EState, %struct.EState* %216, i32 0, i32 29
  store i32 0, i32* %217, align 4
  %218 = load %struct.EState*, %struct.EState** %11, align 8
  %219 = getelementptr inbounds %struct.EState, %struct.EState* %218, i32 0, i32 2
  store i32 2, i32* %219, align 4
  %220 = load %struct.EState*, %struct.EState** %11, align 8
  %221 = getelementptr inbounds %struct.EState, %struct.EState* %220, i32 0, i32 1
  store i32 2, i32* %221, align 8
  %222 = load %struct.EState*, %struct.EState** %11, align 8
  %223 = getelementptr inbounds %struct.EState, %struct.EState* %222, i32 0, i32 27
  store i32 0, i32* %223, align 4
  %224 = load i32, i32* %7, align 4
  %225 = load %struct.EState*, %struct.EState** %11, align 8
  %226 = getelementptr inbounds %struct.EState, %struct.EState* %225, i32 0, i32 30
  store i32 %224, i32* %226, align 8
  %227 = load i32, i32* %7, align 4
  %228 = mul nsw i32 100000, %227
  %229 = sub nsw i32 %228, 19
  %230 = load %struct.EState*, %struct.EState** %11, align 8
  %231 = getelementptr inbounds %struct.EState, %struct.EState* %230, i32 0, i32 18
  store i32 %229, i32* %231, align 8
  %232 = load i32, i32* %8, align 4
  %233 = load %struct.EState*, %struct.EState** %11, align 8
  %234 = getelementptr inbounds %struct.EState, %struct.EState* %233, i32 0, i32 28
  store i32 %232, i32* %234, align 8
  %235 = load i32, i32* %9, align 4
  %236 = load %struct.EState*, %struct.EState** %11, align 8
  %237 = getelementptr inbounds %struct.EState, %struct.EState* %236, i32 0, i32 12
  store i32 %235, i32* %237, align 8
  %238 = load %struct.EState*, %struct.EState** %11, align 8
  %239 = getelementptr inbounds %struct.EState, %struct.EState* %238, i32 0, i32 5
  %240 = load i32*, i32** %239, align 8
  %241 = bitcast i32* %240 to i8*
  %242 = load %struct.EState*, %struct.EState** %11, align 8
  %243 = getelementptr inbounds %struct.EState, %struct.EState* %242, i32 0, i32 9
  store i8* %241, i8** %243, align 8
  %244 = load %struct.EState*, %struct.EState** %11, align 8
  %245 = getelementptr inbounds %struct.EState, %struct.EState* %244, i32 0, i32 4
  %246 = load i32*, i32** %245, align 8
  %247 = bitcast i32* %246 to i16*
  %248 = load %struct.EState*, %struct.EState** %11, align 8
  %249 = getelementptr inbounds %struct.EState, %struct.EState* %248, i32 0, i32 10
  store i16* %247, i16** %249, align 8
  %250 = load %struct.EState*, %struct.EState** %11, align 8
  %251 = getelementptr inbounds %struct.EState, %struct.EState* %250, i32 0, i32 11
  store i8* null, i8** %251, align 8
  %252 = load %struct.EState*, %struct.EState** %11, align 8
  %253 = getelementptr inbounds %struct.EState, %struct.EState* %252, i32 0, i32 4
  %254 = load i32*, i32** %253, align 8
  %255 = load %struct.EState*, %struct.EState** %11, align 8
  %256 = getelementptr inbounds %struct.EState, %struct.EState* %255, i32 0, i32 8
  store i32* %254, i32** %256, align 8
  %257 = load %struct.EState*, %struct.EState** %11, align 8
  %258 = bitcast %struct.EState* %257 to i8*
  %259 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %260 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %259, i32 0, i32 8
  store i8* %258, i8** %260, align 8
  %261 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %262 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %261, i32 0, i32 2
  store i32 0, i32* %262, align 4
  %263 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %264 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %263, i32 0, i32 3
  store i32 0, i32* %264, align 8
  %265 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %266 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %265, i32 0, i32 6
  store i32 0, i32* %266, align 4
  %267 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %268 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %267, i32 0, i32 7
  store i32 0, i32* %268, align 8
  %269 = load %struct.EState*, %struct.EState** %11, align 8
  call void @init_RL(%struct.EState* %269)
  %270 = load %struct.EState*, %struct.EState** %11, align 8
  call void @prepare_new_block(%struct.EState* %270)
  store i32 0, i32* %5, align 4
  br label %271

; <label>:271:                                    ; preds = %214, %212, %72, %35, %14
  %272 = load i32, i32* %5, align 4
  ret i32 %272
}

; Function Attrs: nounwind uwtable
define internal i32 @bz_config_ok() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_bz_config_ok, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_bz_config_ok, i64 0, i64 0)
  ret i32 1
}

; Function Attrs: nounwind uwtable
define internal i8* @default_bzalloc(i8*, i32, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_default_bzalloc, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_default_bzalloc, i64 0, i64 0)
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  %9 = load i32, i32* %6, align 4
  %10 = load i32, i32* %7, align 4
  %11 = mul nsw i32 %9, %10
  %12 = sext i32 %11 to i64
  %13 = call noalias i8* @malloc(i64 %12) #8
  store i8* %13, i8** %8, align 8
  %14 = load i8*, i8** %8, align 8
  ret i8* %14
}

; Function Attrs: nounwind uwtable
define internal void @default_bzfree(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %4, align 8
  %6 = icmp ne i8* %5, null
  br i1 %6, label %7, label %10

; <label>:7:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_default_bzfree, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_default_bzfree, i64 0, i64 1)
  %9 = load i8*, i8** %4, align 8
  call void @free(i8* %9) #8
  br label %10

; <label>:10:                                     ; preds = %7, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_default_bzfree, i64 0, i64 0)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_default_bzfree, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @init_RL(%struct.EState*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_init_RL, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_init_RL, i64 0, i64 0)
  %3 = alloca %struct.EState*, align 8
  store %struct.EState* %0, %struct.EState** %3, align 8
  %4 = load %struct.EState*, %struct.EState** %3, align 8
  %5 = getelementptr inbounds %struct.EState, %struct.EState* %4, i32 0, i32 13
  store i32 256, i32* %5, align 4
  %6 = load %struct.EState*, %struct.EState** %3, align 8
  %7 = getelementptr inbounds %struct.EState, %struct.EState* %6, i32 0, i32 14
  store i32 0, i32* %7, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @prepare_new_block(%struct.EState*) #0 {
  %2 = alloca %struct.EState*, align 8
  %3 = alloca i32, align 4
  store %struct.EState* %0, %struct.EState** %2, align 8
  %4 = load %struct.EState*, %struct.EState** %2, align 8
  %5 = getelementptr inbounds %struct.EState, %struct.EState* %4, i32 0, i32 17
  store i32 0, i32* %5, align 4
  %6 = load %struct.EState*, %struct.EState** %2, align 8
  %7 = getelementptr inbounds %struct.EState, %struct.EState* %6, i32 0, i32 19
  store i32 0, i32* %7, align 4
  %8 = load %struct.EState*, %struct.EState** %2, align 8
  %9 = getelementptr inbounds %struct.EState, %struct.EState* %8, i32 0, i32 20
  store i32 0, i32* %9, align 8
  %10 = load %struct.EState*, %struct.EState** %2, align 8
  %11 = getelementptr inbounds %struct.EState, %struct.EState* %10, i32 0, i32 26
  store i32 -1, i32* %11, align 8
  store i32 0, i32* %3, align 4
  br label %12

; <label>:12:                                     ; preds = %21, %1
  %13 = load i32, i32* %3, align 4
  %14 = icmp slt i32 %13, 256
  br i1 %14, label %15, label %25

; <label>:15:                                     ; preds = %12
  %16 = load %struct.EState*, %struct.EState** %2, align 8
  %17 = getelementptr inbounds %struct.EState, %struct.EState* %16, i32 0, i32 22
  %18 = load i32, i32* %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [256 x i8], [256 x i8]* %17, i64 0, i64 %19
  store i8 0, i8* %20, align 1
  br label %21

; <label>:21:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_prepare_new_block, i64 0, i64 0)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_prepare_new_block, i64 0, i64 0)
  %23 = load i32, i32* %3, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %3, align 4
  br label %12

; <label>:25:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_prepare_new_block, i64 0, i64 1)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_prepare_new_block, i64 0, i64 1)
  %27 = load %struct.EState*, %struct.EState** %2, align 8
  %28 = getelementptr inbounds %struct.EState, %struct.EState* %27, i32 0, i32 29
  %29 = load i32, i32* %28, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %28, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @BZ2_bzCompress(%struct.bz_stream*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.bz_stream*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8, align 1
  %7 = alloca %struct.EState*, align 8
  store %struct.bz_stream* %0, %struct.bz_stream** %4, align 8
  store i32 %1, i32* %5, align 4
  %8 = load %struct.bz_stream*, %struct.bz_stream** %4, align 8
  %9 = icmp eq %struct.bz_stream* %8, null
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 2)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 2)
  store i32 -2, i32* %3, align 4
  br label %170

; <label>:12:                                     ; preds = %2
  %13 = load %struct.bz_stream*, %struct.bz_stream** %4, align 8
  %14 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %13, i32 0, i32 8
  %15 = load i8*, i8** %14, align 8
  %16 = bitcast i8* %15 to %struct.EState*
  store %struct.EState* %16, %struct.EState** %7, align 8
  %17 = load %struct.EState*, %struct.EState** %7, align 8
  %18 = icmp eq %struct.EState* %17, null
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 4)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 4)
  store i32 -2, i32* %3, align 4
  br label %170

; <label>:21:                                     ; preds = %12
  %22 = load %struct.EState*, %struct.EState** %7, align 8
  %23 = getelementptr inbounds %struct.EState, %struct.EState* %22, i32 0, i32 0
  %24 = load %struct.bz_stream*, %struct.bz_stream** %23, align 8
  %25 = load %struct.bz_stream*, %struct.bz_stream** %4, align 8
  %26 = icmp ne %struct.bz_stream* %24, %25
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 3)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 3)
  store i32 -2, i32* %3, align 4
  br label %170

; <label>:29:                                     ; preds = %21
  br label %30

; <label>:30:                                     ; preds = %64, %52, %29
  %31 = load %struct.EState*, %struct.EState** %7, align 8
  %32 = getelementptr inbounds %struct.EState, %struct.EState* %31, i32 0, i32 1
  %33 = load i32, i32* %32, align 8
  switch i32 %33, label %168 [
    i32 1, label %34
    i32 2, label %36
    i32 3, label %75
    i32 4, label %119
  ]

; <label>:34:                                     ; preds = %30
  %pgocount3 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 7)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 7)
  store i32 -1, i32* %3, align 4
  br label %170

; <label>:36:                                     ; preds = %30
  %37 = load i32, i32* %5, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %49

; <label>:39:                                     ; preds = %36
  %pgocount4 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 5)
  %40 = add i64 %pgocount4, 1
  store i64 %40, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 5)
  %41 = load %struct.bz_stream*, %struct.bz_stream** %4, align 8
  %42 = call zeroext i8 @handle_compress(%struct.bz_stream* %41)
  store i8 %42, i8* %6, align 1
  %43 = load i8, i8* %6, align 1
  %44 = zext i8 %43 to i32
  %45 = icmp ne i32 %44, 0
  %46 = zext i1 %45 to i64
  %pgocount5 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 22)
  %47 = add i64 %pgocount5, %46
  store i64 %47, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 22)
  %48 = select i1 %45, i32 1, i32 -2
  store i32 %48, i32* %3, align 4
  br label %170

; <label>:49:                                     ; preds = %36
  %50 = load i32, i32* %5, align 4
  %51 = icmp eq i32 %50, 1
  br i1 %51, label %52, label %61

; <label>:52:                                     ; preds = %49
  %pgocount6 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 0)
  %53 = add i64 %pgocount6, 1
  store i64 %53, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 0)
  %54 = load %struct.bz_stream*, %struct.bz_stream** %4, align 8
  %55 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %54, i32 0, i32 1
  %56 = load i32, i32* %55, align 8
  %57 = load %struct.EState*, %struct.EState** %7, align 8
  %58 = getelementptr inbounds %struct.EState, %struct.EState* %57, i32 0, i32 3
  store i32 %56, i32* %58, align 8
  %59 = load %struct.EState*, %struct.EState** %7, align 8
  %60 = getelementptr inbounds %struct.EState, %struct.EState* %59, i32 0, i32 1
  store i32 3, i32* %60, align 8
  br label %30

; <label>:61:                                     ; preds = %49
  %62 = load i32, i32* %5, align 4
  %63 = icmp eq i32 %62, 2
  br i1 %63, label %64, label %73

; <label>:64:                                     ; preds = %61
  %pgocount7 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 1)
  %65 = add i64 %pgocount7, 1
  store i64 %65, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 1)
  %66 = load %struct.bz_stream*, %struct.bz_stream** %4, align 8
  %67 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %66, i32 0, i32 1
  %68 = load i32, i32* %67, align 8
  %69 = load %struct.EState*, %struct.EState** %7, align 8
  %70 = getelementptr inbounds %struct.EState, %struct.EState* %69, i32 0, i32 3
  store i32 %68, i32* %70, align 8
  %71 = load %struct.EState*, %struct.EState** %7, align 8
  %72 = getelementptr inbounds %struct.EState, %struct.EState* %71, i32 0, i32 1
  store i32 4, i32* %72, align 8
  br label %30

; <label>:73:                                     ; preds = %61
  %pgocount8 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 6)
  %74 = add i64 %pgocount8, 1
  store i64 %74, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 6)
  store i32 -2, i32* %3, align 4
  br label %170

; <label>:75:                                     ; preds = %30
  %76 = load i32, i32* %5, align 4
  %77 = icmp ne i32 %76, 1
  br i1 %77, label %78, label %80

; <label>:78:                                     ; preds = %75
  %pgocount9 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 9)
  %79 = add i64 %pgocount9, 1
  store i64 %79, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 9)
  store i32 -1, i32* %3, align 4
  br label %170

; <label>:80:                                     ; preds = %75
  %81 = load %struct.EState*, %struct.EState** %7, align 8
  %82 = getelementptr inbounds %struct.EState, %struct.EState* %81, i32 0, i32 3
  %83 = load i32, i32* %82, align 8
  %84 = load %struct.EState*, %struct.EState** %7, align 8
  %85 = getelementptr inbounds %struct.EState, %struct.EState* %84, i32 0, i32 0
  %86 = load %struct.bz_stream*, %struct.bz_stream** %85, align 8
  %87 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %86, i32 0, i32 1
  %88 = load i32, i32* %87, align 8
  %89 = icmp ne i32 %83, %88
  br i1 %89, label %90, label %92

; <label>:90:                                     ; preds = %80
  %pgocount10 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 11)
  %91 = add i64 %pgocount10, 1
  store i64 %91, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 11)
  store i32 -1, i32* %3, align 4
  br label %170

; <label>:92:                                     ; preds = %80
  %93 = load %struct.bz_stream*, %struct.bz_stream** %4, align 8
  %94 = call zeroext i8 @handle_compress(%struct.bz_stream* %93)
  store i8 %94, i8* %6, align 1
  %95 = load %struct.EState*, %struct.EState** %7, align 8
  %96 = getelementptr inbounds %struct.EState, %struct.EState* %95, i32 0, i32 3
  %97 = load i32, i32* %96, align 8
  %98 = icmp ugt i32 %97, 0
  br i1 %98, label %113, label %99

; <label>:99:                                     ; preds = %92
  %pgocount11 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 15)
  %100 = add i64 %pgocount11, 1
  store i64 %100, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 15)
  %101 = load %struct.EState*, %struct.EState** %7, align 8
  %102 = call zeroext i8 @isempty_RL(%struct.EState* %101)
  %103 = icmp ne i8 %102, 0
  br i1 %103, label %104, label %113

; <label>:104:                                    ; preds = %99
  %pgocount12 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 17)
  %105 = add i64 %pgocount12, 1
  store i64 %105, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 17)
  %106 = load %struct.EState*, %struct.EState** %7, align 8
  %107 = getelementptr inbounds %struct.EState, %struct.EState* %106, i32 0, i32 20
  %108 = load i32, i32* %107, align 8
  %109 = load %struct.EState*, %struct.EState** %7, align 8
  %110 = getelementptr inbounds %struct.EState, %struct.EState* %109, i32 0, i32 19
  %111 = load i32, i32* %110, align 4
  %112 = icmp slt i32 %108, %111
  br i1 %112, label %113, label %115

; <label>:113:                                    ; preds = %104, %99, %92
  %pgocount13 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 13)
  %114 = add i64 %pgocount13, 1
  store i64 %114, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 13)
  store i32 2, i32* %3, align 4
  br label %170

; <label>:115:                                    ; preds = %104
  %pgocount14 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 20)
  %116 = add i64 %pgocount14, 1
  store i64 %116, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 20)
  %117 = load %struct.EState*, %struct.EState** %7, align 8
  %118 = getelementptr inbounds %struct.EState, %struct.EState* %117, i32 0, i32 1
  store i32 2, i32* %118, align 8
  store i32 1, i32* %3, align 4
  br label %170

; <label>:119:                                    ; preds = %30
  %120 = load i32, i32* %5, align 4
  %121 = icmp ne i32 %120, 2
  br i1 %121, label %122, label %124

; <label>:122:                                    ; preds = %119
  %pgocount15 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 10)
  %123 = add i64 %pgocount15, 1
  store i64 %123, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 10)
  store i32 -1, i32* %3, align 4
  br label %170

; <label>:124:                                    ; preds = %119
  %125 = load %struct.EState*, %struct.EState** %7, align 8
  %126 = getelementptr inbounds %struct.EState, %struct.EState* %125, i32 0, i32 3
  %127 = load i32, i32* %126, align 8
  %128 = load %struct.EState*, %struct.EState** %7, align 8
  %129 = getelementptr inbounds %struct.EState, %struct.EState* %128, i32 0, i32 0
  %130 = load %struct.bz_stream*, %struct.bz_stream** %129, align 8
  %131 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %130, i32 0, i32 1
  %132 = load i32, i32* %131, align 8
  %133 = icmp ne i32 %127, %132
  br i1 %133, label %134, label %136

; <label>:134:                                    ; preds = %124
  %pgocount16 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 12)
  %135 = add i64 %pgocount16, 1
  store i64 %135, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 12)
  store i32 -1, i32* %3, align 4
  br label %170

; <label>:136:                                    ; preds = %124
  %137 = load %struct.bz_stream*, %struct.bz_stream** %4, align 8
  %138 = call zeroext i8 @handle_compress(%struct.bz_stream* %137)
  store i8 %138, i8* %6, align 1
  %139 = load i8, i8* %6, align 1
  %140 = icmp ne i8 %139, 0
  br i1 %140, label %143, label %141

; <label>:141:                                    ; preds = %136
  %pgocount17 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 16)
  %142 = add i64 %pgocount17, 1
  store i64 %142, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 16)
  store i32 -1, i32* %3, align 4
  br label %170

; <label>:143:                                    ; preds = %136
  %144 = load %struct.EState*, %struct.EState** %7, align 8
  %145 = getelementptr inbounds %struct.EState, %struct.EState* %144, i32 0, i32 3
  %146 = load i32, i32* %145, align 8
  %147 = icmp ugt i32 %146, 0
  br i1 %147, label %162, label %148

; <label>:148:                                    ; preds = %143
  %pgocount18 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 18)
  %149 = add i64 %pgocount18, 1
  store i64 %149, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 18)
  %150 = load %struct.EState*, %struct.EState** %7, align 8
  %151 = call zeroext i8 @isempty_RL(%struct.EState* %150)
  %152 = icmp ne i8 %151, 0
  br i1 %152, label %153, label %162

; <label>:153:                                    ; preds = %148
  %pgocount19 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 19)
  %154 = add i64 %pgocount19, 1
  store i64 %154, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 19)
  %155 = load %struct.EState*, %struct.EState** %7, align 8
  %156 = getelementptr inbounds %struct.EState, %struct.EState* %155, i32 0, i32 20
  %157 = load i32, i32* %156, align 8
  %158 = load %struct.EState*, %struct.EState** %7, align 8
  %159 = getelementptr inbounds %struct.EState, %struct.EState* %158, i32 0, i32 19
  %160 = load i32, i32* %159, align 4
  %161 = icmp slt i32 %157, %160
  br i1 %161, label %162, label %164

; <label>:162:                                    ; preds = %153, %148, %143
  %pgocount20 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 14)
  %163 = add i64 %pgocount20, 1
  store i64 %163, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 14)
  store i32 3, i32* %3, align 4
  br label %170

; <label>:164:                                    ; preds = %153
  %pgocount21 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 21)
  %165 = add i64 %pgocount21, 1
  store i64 %165, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 21)
  %166 = load %struct.EState*, %struct.EState** %7, align 8
  %167 = getelementptr inbounds %struct.EState, %struct.EState* %166, i32 0, i32 1
  store i32 1, i32* %167, align 8
  store i32 4, i32* %3, align 4
  br label %170

; <label>:168:                                    ; preds = %30
  %pgocount22 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 8)
  %169 = add i64 %pgocount22, 1
  store i64 %169, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_BZ2_bzCompress, i64 0, i64 8)
  store i32 0, i32* %3, align 4
  br label %170

; <label>:170:                                    ; preds = %168, %164, %162, %141, %134, %122, %115, %113, %90, %78, %73, %39, %34, %27, %19, %10
  %171 = load i32, i32* %3, align 4
  ret i32 %171
}

; Function Attrs: nounwind uwtable
define internal zeroext i8 @handle_compress(%struct.bz_stream*) #0 {
  %2 = alloca %struct.bz_stream*, align 8
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca %struct.EState*, align 8
  store %struct.bz_stream* %0, %struct.bz_stream** %2, align 8
  store i8 0, i8* %3, align 1
  store i8 0, i8* %4, align 1
  %6 = load %struct.bz_stream*, %struct.bz_stream** %2, align 8
  %7 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %6, i32 0, i32 8
  %8 = load i8*, i8** %7, align 8
  %9 = bitcast i8* %8 to %struct.EState*
  store %struct.EState* %9, %struct.EState** %5, align 8
  br label %10

; <label>:10:                                     ; preds = %136, %1
  %11 = load %struct.EState*, %struct.EState** %5, align 8
  %12 = getelementptr inbounds %struct.EState, %struct.EState* %11, i32 0, i32 2
  %13 = load i32, i32* %12, align 4
  %14 = icmp eq i32 %13, 1
  br i1 %14, label %15, label %75

; <label>:15:                                     ; preds = %10
  %16 = load %struct.EState*, %struct.EState** %5, align 8
  %17 = call zeroext i8 @copy_output_until_stop(%struct.EState* %16)
  %18 = zext i8 %17 to i32
  %19 = load i8, i8* %4, align 1
  %20 = zext i8 %19 to i32
  %21 = or i32 %20, %18
  %22 = trunc i32 %21 to i8
  store i8 %22, i8* %4, align 1
  %23 = load %struct.EState*, %struct.EState** %5, align 8
  %24 = getelementptr inbounds %struct.EState, %struct.EState* %23, i32 0, i32 20
  %25 = load i32, i32* %24, align 8
  %26 = load %struct.EState*, %struct.EState** %5, align 8
  %27 = getelementptr inbounds %struct.EState, %struct.EState* %26, i32 0, i32 19
  %28 = load i32, i32* %27, align 4
  %29 = icmp slt i32 %25, %28
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 10)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 10)
  br label %138

; <label>:32:                                     ; preds = %15
  %33 = load %struct.EState*, %struct.EState** %5, align 8
  %34 = getelementptr inbounds %struct.EState, %struct.EState* %33, i32 0, i32 1
  %35 = load i32, i32* %34, align 8
  %36 = icmp eq i32 %35, 4
  br i1 %36, label %37, label %51

; <label>:37:                                     ; preds = %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 3)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 3)
  %39 = load %struct.EState*, %struct.EState** %5, align 8
  %40 = getelementptr inbounds %struct.EState, %struct.EState* %39, i32 0, i32 3
  %41 = load i32, i32* %40, align 8
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %43, label %51

; <label>:43:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 8)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 8)
  %45 = load %struct.EState*, %struct.EState** %5, align 8
  %46 = call zeroext i8 @isempty_RL(%struct.EState* %45)
  %47 = zext i8 %46 to i32
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %51

; <label>:49:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 13)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 13)
  br label %138

; <label>:51:                                     ; preds = %43, %37, %32
  %52 = load %struct.EState*, %struct.EState** %5, align 8
  call void @prepare_new_block(%struct.EState* %52)
  %53 = load %struct.EState*, %struct.EState** %5, align 8
  %54 = getelementptr inbounds %struct.EState, %struct.EState* %53, i32 0, i32 2
  store i32 2, i32* %54, align 4
  %55 = load %struct.EState*, %struct.EState** %5, align 8
  %56 = getelementptr inbounds %struct.EState, %struct.EState* %55, i32 0, i32 1
  %57 = load i32, i32* %56, align 8
  %58 = icmp eq i32 %57, 3
  br i1 %58, label %59, label %73

; <label>:59:                                     ; preds = %51
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 4)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 4)
  %61 = load %struct.EState*, %struct.EState** %5, align 8
  %62 = getelementptr inbounds %struct.EState, %struct.EState* %61, i32 0, i32 3
  %63 = load i32, i32* %62, align 8
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %65, label %73

; <label>:65:                                     ; preds = %59
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 9)
  %66 = add i64 %pgocount5, 1
  store i64 %66, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 9)
  %67 = load %struct.EState*, %struct.EState** %5, align 8
  %68 = call zeroext i8 @isempty_RL(%struct.EState* %67)
  %69 = zext i8 %68 to i32
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %73

; <label>:71:                                     ; preds = %65
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 14)
  %72 = add i64 %pgocount6, 1
  store i64 %72, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 14)
  br label %138

; <label>:73:                                     ; preds = %65, %59, %51
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 1)
  %74 = add i64 %pgocount7, 1
  store i64 %74, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 1)
  br label %75

; <label>:75:                                     ; preds = %73, %10
  %76 = load %struct.EState*, %struct.EState** %5, align 8
  %77 = getelementptr inbounds %struct.EState, %struct.EState* %76, i32 0, i32 2
  %78 = load i32, i32* %77, align 4
  %79 = icmp eq i32 %78, 2
  br i1 %79, label %80, label %136

; <label>:80:                                     ; preds = %75
  %81 = load %struct.EState*, %struct.EState** %5, align 8
  %82 = call zeroext i8 @copy_input_until_stop(%struct.EState* %81)
  %83 = zext i8 %82 to i32
  %84 = load i8, i8* %3, align 1
  %85 = zext i8 %84 to i32
  %86 = or i32 %85, %83
  %87 = trunc i32 %86 to i8
  store i8 %87, i8* %3, align 1
  %88 = load %struct.EState*, %struct.EState** %5, align 8
  %89 = getelementptr inbounds %struct.EState, %struct.EState* %88, i32 0, i32 1
  %90 = load i32, i32* %89, align 8
  %91 = icmp ne i32 %90, 2
  br i1 %91, label %92, label %110

; <label>:92:                                     ; preds = %80
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 2)
  %93 = add i64 %pgocount8, 1
  store i64 %93, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 2)
  %94 = load %struct.EState*, %struct.EState** %5, align 8
  %95 = getelementptr inbounds %struct.EState, %struct.EState* %94, i32 0, i32 3
  %96 = load i32, i32* %95, align 8
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %98, label %110

; <label>:98:                                     ; preds = %92
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 7)
  %99 = add i64 %pgocount9, 1
  store i64 %99, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 7)
  %100 = load %struct.EState*, %struct.EState** %5, align 8
  call void @flush_RL(%struct.EState* %100)
  %101 = load %struct.EState*, %struct.EState** %5, align 8
  %102 = load %struct.EState*, %struct.EState** %5, align 8
  %103 = getelementptr inbounds %struct.EState, %struct.EState* %102, i32 0, i32 1
  %104 = load i32, i32* %103, align 8
  %105 = icmp eq i32 %104, 4
  %106 = zext i1 %105 to i32
  %107 = trunc i32 %106 to i8
  call void @BZ2_compressBlock(%struct.EState* %101, i8 zeroext %107)
  %108 = load %struct.EState*, %struct.EState** %5, align 8
  %109 = getelementptr inbounds %struct.EState, %struct.EState* %108, i32 0, i32 2
  store i32 1, i32* %109, align 4
  br label %135

; <label>:110:                                    ; preds = %92, %80
  %111 = load %struct.EState*, %struct.EState** %5, align 8
  %112 = getelementptr inbounds %struct.EState, %struct.EState* %111, i32 0, i32 17
  %113 = load i32, i32* %112, align 4
  %114 = load %struct.EState*, %struct.EState** %5, align 8
  %115 = getelementptr inbounds %struct.EState, %struct.EState* %114, i32 0, i32 18
  %116 = load i32, i32* %115, align 8
  %117 = icmp sge i32 %113, %116
  br i1 %117, label %118, label %123

; <label>:118:                                    ; preds = %110
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 5)
  %119 = add i64 %pgocount10, 1
  store i64 %119, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 5)
  %120 = load %struct.EState*, %struct.EState** %5, align 8
  call void @BZ2_compressBlock(%struct.EState* %120, i8 zeroext 0)
  %121 = load %struct.EState*, %struct.EState** %5, align 8
  %122 = getelementptr inbounds %struct.EState, %struct.EState* %121, i32 0, i32 2
  store i32 1, i32* %122, align 4
  br label %134

; <label>:123:                                    ; preds = %110
  %124 = load %struct.EState*, %struct.EState** %5, align 8
  %125 = getelementptr inbounds %struct.EState, %struct.EState* %124, i32 0, i32 0
  %126 = load %struct.bz_stream*, %struct.bz_stream** %125, align 8
  %127 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %126, i32 0, i32 1
  %128 = load i32, i32* %127, align 8
  %129 = icmp eq i32 %128, 0
  br i1 %129, label %130, label %132

; <label>:130:                                    ; preds = %123
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 12)
  %131 = add i64 %pgocount11, 1
  store i64 %131, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 12)
  br label %138

; <label>:132:                                    ; preds = %123
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 6)
  %133 = add i64 %pgocount12, 1
  store i64 %133, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 6)
  br label %134

; <label>:134:                                    ; preds = %132, %118
  br label %135

; <label>:135:                                    ; preds = %134, %98
  br label %136

; <label>:136:                                    ; preds = %135, %75
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 0)
  %137 = add i64 %pgocount13, 1
  store i64 %137, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 0)
  br label %10

; <label>:138:                                    ; preds = %130, %71, %49, %30
  %139 = load i8, i8* %3, align 1
  %140 = zext i8 %139 to i32
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %147, label %142

; <label>:142:                                    ; preds = %138
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 11)
  %143 = add i64 %pgocount14, 1
  store i64 %143, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_handle_compress, i64 0, i64 11)
  %144 = load i8, i8* %4, align 1
  %145 = zext i8 %144 to i32
  %146 = icmp ne i32 %145, 0
  br label %147

; <label>:147:                                    ; preds = %142, %138
  %148 = phi i1 [ true, %138 ], [ %146, %142 ]
  %149 = zext i1 %148 to i32
  %150 = trunc i32 %149 to i8
  ret i8 %150
}

; Function Attrs: nounwind uwtable
define internal zeroext i8 @isempty_RL(%struct.EState*) #0 {
  %2 = alloca i8, align 1
  %3 = alloca %struct.EState*, align 8
  store %struct.EState* %0, %struct.EState** %3, align 8
  %4 = load %struct.EState*, %struct.EState** %3, align 8
  %5 = getelementptr inbounds %struct.EState, %struct.EState* %4, i32 0, i32 13
  %6 = load i32, i32* %5, align 4
  %7 = icmp ult i32 %6, 256
  br i1 %7, label %8, label %16

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_isempty_RL, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_isempty_RL, i64 0, i64 1)
  %10 = load %struct.EState*, %struct.EState** %3, align 8
  %11 = getelementptr inbounds %struct.EState, %struct.EState* %10, i32 0, i32 14
  %12 = load i32, i32* %11, align 8
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_isempty_RL, i64 0, i64 2)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_isempty_RL, i64 0, i64 2)
  store i8 0, i8* %2, align 1
  br label %18

; <label>:16:                                     ; preds = %8, %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_isempty_RL, i64 0, i64 0)
  %17 = add i64 %pgocount2, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_isempty_RL, i64 0, i64 0)
  store i8 1, i8* %2, align 1
  br label %18

; <label>:18:                                     ; preds = %16, %14
  %19 = load i8, i8* %2, align 1
  ret i8 %19
}

; Function Attrs: nounwind uwtable
define i32 @BZ2_bzCompressEnd(%struct.bz_stream*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.bz_stream*, align 8
  %4 = alloca %struct.EState*, align 8
  store %struct.bz_stream* %0, %struct.bz_stream** %3, align 8
  %5 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %6 = icmp eq %struct.bz_stream* %5, null
  br i1 %6, label %7, label %9

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzCompressEnd, i64 0, i64 0)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzCompressEnd, i64 0, i64 0)
  store i32 -2, i32* %2, align 4
  br label %94

; <label>:9:                                      ; preds = %1
  %10 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %11 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %10, i32 0, i32 8
  %12 = load i8*, i8** %11, align 8
  %13 = bitcast i8* %12 to %struct.EState*
  store %struct.EState* %13, %struct.EState** %4, align 8
  %14 = load %struct.EState*, %struct.EState** %4, align 8
  %15 = icmp eq %struct.EState* %14, null
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzCompressEnd, i64 0, i64 2)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzCompressEnd, i64 0, i64 2)
  store i32 -2, i32* %2, align 4
  br label %94

; <label>:18:                                     ; preds = %9
  %19 = load %struct.EState*, %struct.EState** %4, align 8
  %20 = getelementptr inbounds %struct.EState, %struct.EState* %19, i32 0, i32 0
  %21 = load %struct.bz_stream*, %struct.bz_stream** %20, align 8
  %22 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %23 = icmp ne %struct.bz_stream* %21, %22
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzCompressEnd, i64 0, i64 1)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzCompressEnd, i64 0, i64 1)
  store i32 -2, i32* %2, align 4
  br label %94

; <label>:26:                                     ; preds = %18
  %27 = load %struct.EState*, %struct.EState** %4, align 8
  %28 = getelementptr inbounds %struct.EState, %struct.EState* %27, i32 0, i32 4
  %29 = load i32*, i32** %28, align 8
  %30 = icmp ne i32* %29, null
  br i1 %30, label %31, label %44

; <label>:31:                                     ; preds = %26
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzCompressEnd, i64 0, i64 4)
  %32 = add i64 %pgocount3, 1
  store i64 %32, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzCompressEnd, i64 0, i64 4)
  %33 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %34 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %33, i32 0, i32 10
  %35 = load void (i8*, i8*)*, void (i8*, i8*)** %34, align 8
  %36 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %37 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %36, i32 0, i32 11
  %38 = load i8*, i8** %37, align 8
  %39 = load %struct.EState*, %struct.EState** %4, align 8
  %40 = getelementptr inbounds %struct.EState, %struct.EState* %39, i32 0, i32 4
  %41 = load i32*, i32** %40, align 8
  %42 = bitcast i32* %41 to i8*
  %43 = ptrtoint void (i8*, i8*)* %35 to i64
  call void @__llvm_profile_instrument_target(i64 %43, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzCompressEnd to i8*), i32 0)
  call void %35(i8* %38, i8* %42)
  br label %44

; <label>:44:                                     ; preds = %31, %26
  %45 = load %struct.EState*, %struct.EState** %4, align 8
  %46 = getelementptr inbounds %struct.EState, %struct.EState* %45, i32 0, i32 5
  %47 = load i32*, i32** %46, align 8
  %48 = icmp ne i32* %47, null
  br i1 %48, label %49, label %62

; <label>:49:                                     ; preds = %44
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzCompressEnd, i64 0, i64 5)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzCompressEnd, i64 0, i64 5)
  %51 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %52 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %51, i32 0, i32 10
  %53 = load void (i8*, i8*)*, void (i8*, i8*)** %52, align 8
  %54 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %55 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %54, i32 0, i32 11
  %56 = load i8*, i8** %55, align 8
  %57 = load %struct.EState*, %struct.EState** %4, align 8
  %58 = getelementptr inbounds %struct.EState, %struct.EState* %57, i32 0, i32 5
  %59 = load i32*, i32** %58, align 8
  %60 = bitcast i32* %59 to i8*
  %61 = ptrtoint void (i8*, i8*)* %53 to i64
  call void @__llvm_profile_instrument_target(i64 %61, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzCompressEnd to i8*), i32 1)
  call void %53(i8* %56, i8* %60)
  br label %62

; <label>:62:                                     ; preds = %49, %44
  %63 = load %struct.EState*, %struct.EState** %4, align 8
  %64 = getelementptr inbounds %struct.EState, %struct.EState* %63, i32 0, i32 6
  %65 = load i32*, i32** %64, align 8
  %66 = icmp ne i32* %65, null
  br i1 %66, label %67, label %80

; <label>:67:                                     ; preds = %62
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzCompressEnd, i64 0, i64 6)
  %68 = add i64 %pgocount5, 1
  store i64 %68, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzCompressEnd, i64 0, i64 6)
  %69 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %70 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %69, i32 0, i32 10
  %71 = load void (i8*, i8*)*, void (i8*, i8*)** %70, align 8
  %72 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %73 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %72, i32 0, i32 11
  %74 = load i8*, i8** %73, align 8
  %75 = load %struct.EState*, %struct.EState** %4, align 8
  %76 = getelementptr inbounds %struct.EState, %struct.EState* %75, i32 0, i32 6
  %77 = load i32*, i32** %76, align 8
  %78 = bitcast i32* %77 to i8*
  %79 = ptrtoint void (i8*, i8*)* %71 to i64
  call void @__llvm_profile_instrument_target(i64 %79, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzCompressEnd to i8*), i32 2)
  call void %71(i8* %74, i8* %78)
  br label %80

; <label>:80:                                     ; preds = %67, %62
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzCompressEnd, i64 0, i64 3)
  %81 = add i64 %pgocount6, 1
  store i64 %81, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzCompressEnd, i64 0, i64 3)
  %82 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %83 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %82, i32 0, i32 10
  %84 = load void (i8*, i8*)*, void (i8*, i8*)** %83, align 8
  %85 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %86 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %85, i32 0, i32 11
  %87 = load i8*, i8** %86, align 8
  %88 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %89 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %88, i32 0, i32 8
  %90 = load i8*, i8** %89, align 8
  %91 = ptrtoint void (i8*, i8*)* %84 to i64
  call void @__llvm_profile_instrument_target(i64 %91, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzCompressEnd to i8*), i32 3)
  call void %84(i8* %87, i8* %90)
  %92 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %93 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %92, i32 0, i32 8
  store i8* null, i8** %93, align 8
  store i32 0, i32* %2, align 4
  br label %94

; <label>:94:                                     ; preds = %80, %24, %16, %7
  %95 = load i32, i32* %2, align 4
  ret i32 %95
}

; Function Attrs: nounwind uwtable
define i32 @BZ2_bzDecompressInit(%struct.bz_stream*, i32, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.bz_stream*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.DState*, align 8
  store %struct.bz_stream* %0, %struct.bz_stream** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  %9 = call i32 @bz_config_ok()
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %13, label %11

; <label>:11:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 0)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 0)
  store i32 -9, i32* %4, align 4
  br label %108

; <label>:13:                                     ; preds = %3
  %14 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %15 = icmp eq %struct.bz_stream* %14, null
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 2)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 2)
  store i32 -2, i32* %4, align 4
  br label %108

; <label>:18:                                     ; preds = %13
  %19 = load i32, i32* %7, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %27

; <label>:21:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 1)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 1)
  %23 = load i32, i32* %7, align 4
  %24 = icmp ne i32 %23, 1
  br i1 %24, label %25, label %27

; <label>:25:                                     ; preds = %21
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 5)
  %26 = add i64 %pgocount3, 1
  store i64 %26, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 5)
  store i32 -2, i32* %4, align 4
  br label %108

; <label>:27:                                     ; preds = %21, %18
  %28 = load i32, i32* %6, align 4
  %29 = icmp slt i32 %28, 0
  br i1 %29, label %34, label %30

; <label>:30:                                     ; preds = %27
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 4)
  %31 = add i64 %pgocount4, 1
  store i64 %31, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 4)
  %32 = load i32, i32* %6, align 4
  %33 = icmp sgt i32 %32, 4
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %30, %27
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 3)
  %35 = add i64 %pgocount5, 1
  store i64 %35, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 3)
  store i32 -2, i32* %4, align 4
  br label %108

; <label>:36:                                     ; preds = %30
  %37 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %38 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %37, i32 0, i32 9
  %39 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %38, align 8
  %40 = icmp eq i8* (i8*, i32, i32)* %39, null
  br i1 %40, label %41, label %45

; <label>:41:                                     ; preds = %36
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 7)
  %42 = add i64 %pgocount6, 1
  store i64 %42, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 7)
  %43 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %44 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %43, i32 0, i32 9
  store i8* (i8*, i32, i32)* @default_bzalloc, i8* (i8*, i32, i32)** %44, align 8
  br label %45

; <label>:45:                                     ; preds = %41, %36
  %46 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %47 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %46, i32 0, i32 10
  %48 = load void (i8*, i8*)*, void (i8*, i8*)** %47, align 8
  %49 = icmp eq void (i8*, i8*)* %48, null
  br i1 %49, label %50, label %54

; <label>:50:                                     ; preds = %45
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 8)
  %51 = add i64 %pgocount7, 1
  store i64 %51, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 8)
  %52 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %53 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %52, i32 0, i32 10
  store void (i8*, i8*)* @default_bzfree, void (i8*, i8*)** %53, align 8
  br label %54

; <label>:54:                                     ; preds = %50, %45
  %55 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %56 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %55, i32 0, i32 9
  %57 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %56, align 8
  %58 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %59 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %58, i32 0, i32 11
  %60 = load i8*, i8** %59, align 8
  %61 = ptrtoint i8* (i8*, i32, i32)* %57 to i64
  call void @__llvm_profile_instrument_target(i64 %61, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzDecompressInit to i8*), i32 0)
  %62 = call i8* %57(i8* %60, i32 64144, i32 1)
  %63 = bitcast i8* %62 to %struct.DState*
  store %struct.DState* %63, %struct.DState** %8, align 8
  %64 = load %struct.DState*, %struct.DState** %8, align 8
  %65 = icmp eq %struct.DState* %64, null
  br i1 %65, label %66, label %68

; <label>:66:                                     ; preds = %54
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 9)
  %67 = add i64 %pgocount8, 1
  store i64 %67, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 9)
  store i32 -3, i32* %4, align 4
  br label %108

; <label>:68:                                     ; preds = %54
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 6)
  %69 = add i64 %pgocount9, 1
  store i64 %69, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzDecompressInit, i64 0, i64 6)
  %70 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %71 = load %struct.DState*, %struct.DState** %8, align 8
  %72 = getelementptr inbounds %struct.DState, %struct.DState* %71, i32 0, i32 0
  store %struct.bz_stream* %70, %struct.bz_stream** %72, align 8
  %73 = load %struct.DState*, %struct.DState** %8, align 8
  %74 = bitcast %struct.DState* %73 to i8*
  %75 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %76 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %75, i32 0, i32 8
  store i8* %74, i8** %76, align 8
  %77 = load %struct.DState*, %struct.DState** %8, align 8
  %78 = getelementptr inbounds %struct.DState, %struct.DState* %77, i32 0, i32 1
  store i32 10, i32* %78, align 8
  %79 = load %struct.DState*, %struct.DState** %8, align 8
  %80 = getelementptr inbounds %struct.DState, %struct.DState* %79, i32 0, i32 8
  store i32 0, i32* %80, align 4
  %81 = load %struct.DState*, %struct.DState** %8, align 8
  %82 = getelementptr inbounds %struct.DState, %struct.DState* %81, i32 0, i32 7
  store i32 0, i32* %82, align 8
  %83 = load %struct.DState*, %struct.DState** %8, align 8
  %84 = getelementptr inbounds %struct.DState, %struct.DState* %83, i32 0, i32 26
  store i32 0, i32* %84, align 4
  %85 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %86 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %85, i32 0, i32 2
  store i32 0, i32* %86, align 4
  %87 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %88 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %87, i32 0, i32 3
  store i32 0, i32* %88, align 8
  %89 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %90 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %89, i32 0, i32 6
  store i32 0, i32* %90, align 4
  %91 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %92 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %91, i32 0, i32 7
  store i32 0, i32* %92, align 8
  %93 = load i32, i32* %7, align 4
  %94 = trunc i32 %93 to i8
  %95 = load %struct.DState*, %struct.DState** %8, align 8
  %96 = getelementptr inbounds %struct.DState, %struct.DState* %95, i32 0, i32 10
  store i8 %94, i8* %96, align 4
  %97 = load %struct.DState*, %struct.DState** %8, align 8
  %98 = getelementptr inbounds %struct.DState, %struct.DState* %97, i32 0, i32 22
  store i8* null, i8** %98, align 8
  %99 = load %struct.DState*, %struct.DState** %8, align 8
  %100 = getelementptr inbounds %struct.DState, %struct.DState* %99, i32 0, i32 21
  store i16* null, i16** %100, align 8
  %101 = load %struct.DState*, %struct.DState** %8, align 8
  %102 = getelementptr inbounds %struct.DState, %struct.DState* %101, i32 0, i32 20
  store i32* null, i32** %102, align 8
  %103 = load %struct.DState*, %struct.DState** %8, align 8
  %104 = getelementptr inbounds %struct.DState, %struct.DState* %103, i32 0, i32 11
  store i32 0, i32* %104, align 8
  %105 = load i32, i32* %6, align 4
  %106 = load %struct.DState*, %struct.DState** %8, align 8
  %107 = getelementptr inbounds %struct.DState, %struct.DState* %106, i32 0, i32 12
  store i32 %105, i32* %107, align 4
  store i32 0, i32* %4, align 4
  br label %108

; <label>:108:                                    ; preds = %68, %66, %34, %25, %16, %11
  %109 = load i32, i32* %4, align 4
  ret i32 %109
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @BZ2_indexIntoF(i32, i32*) #3 {
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32* %1, i32** %4, align 8
  store i32 0, i32* %5, align 4
  store i32 256, i32* %6, align 4
  br label %8

; <label>:8:                                      ; preds = %27, %2
  %9 = load i32, i32* %5, align 4
  %10 = load i32, i32* %6, align 4
  %11 = add nsw i32 %9, %10
  %12 = ashr i32 %11, 1
  store i32 %12, i32* %7, align 4
  %13 = load i32, i32* %3, align 4
  %14 = load i32*, i32** %4, align 8
  %15 = load i32, i32* %7, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32* %14, i64 %16
  %18 = load i32, i32* %17, align 4
  %19 = icmp sge i32 %13, %18
  br i1 %19, label %20, label %23

; <label>:20:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BZ2_indexIntoF, i64 0, i64 0)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BZ2_indexIntoF, i64 0, i64 0)
  %22 = load i32, i32* %7, align 4
  store i32 %22, i32* %5, align 4
  br label %26

; <label>:23:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BZ2_indexIntoF, i64 0, i64 1)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BZ2_indexIntoF, i64 0, i64 1)
  %25 = load i32, i32* %7, align 4
  store i32 %25, i32* %6, align 4
  br label %26

; <label>:26:                                     ; preds = %23, %20
  br label %27

; <label>:27:                                     ; preds = %26
  %28 = load i32, i32* %6, align 4
  %29 = load i32, i32* %5, align 4
  %30 = sub nsw i32 %28, %29
  %31 = icmp ne i32 %30, 1
  br i1 %31, label %8, label %32

; <label>:32:                                     ; preds = %27
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BZ2_indexIntoF, i64 0, i64 2)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BZ2_indexIntoF, i64 0, i64 2)
  %34 = load i32, i32* %5, align 4
  ret i32 %34
}

; Function Attrs: nounwind uwtable
define i32 @BZ2_bzDecompress(%struct.bz_stream*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.bz_stream*, align 8
  %4 = alloca i8, align 1
  %5 = alloca %struct.DState*, align 8
  %6 = alloca i32, align 4
  store %struct.bz_stream* %0, %struct.bz_stream** %3, align 8
  %7 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %8 = icmp eq %struct.bz_stream* %7, null
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 4)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 4)
  store i32 -2, i32* %2, align 4
  br label %188

; <label>:11:                                     ; preds = %1
  %12 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %13 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %12, i32 0, i32 8
  %14 = load i8*, i8** %13, align 8
  %15 = bitcast i8* %14 to %struct.DState*
  store %struct.DState* %15, %struct.DState** %5, align 8
  %16 = load %struct.DState*, %struct.DState** %5, align 8
  %17 = icmp eq %struct.DState* %16, null
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 8)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 8)
  store i32 -2, i32* %2, align 4
  br label %188

; <label>:20:                                     ; preds = %11
  %21 = load %struct.DState*, %struct.DState** %5, align 8
  %22 = getelementptr inbounds %struct.DState, %struct.DState* %21, i32 0, i32 0
  %23 = load %struct.bz_stream*, %struct.bz_stream** %22, align 8
  %24 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %25 = icmp ne %struct.bz_stream* %23, %24
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 7)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 7)
  store i32 -2, i32* %2, align 4
  br label %188

; <label>:28:                                     ; preds = %20
  br label %29

; <label>:29:                                     ; preds = %186, %28
  %30 = load %struct.DState*, %struct.DState** %5, align 8
  %31 = getelementptr inbounds %struct.DState, %struct.DState* %30, i32 0, i32 1
  %32 = load i32, i32* %31, align 8
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %29
  %pgocount3 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 10)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 10)
  store i32 -1, i32* %2, align 4
  br label %188

; <label>:36:                                     ; preds = %29
  %37 = load %struct.DState*, %struct.DState** %5, align 8
  %38 = getelementptr inbounds %struct.DState, %struct.DState* %37, i32 0, i32 1
  %39 = load i32, i32* %38, align 8
  %40 = icmp eq i32 %39, 2
  br i1 %40, label %41, label %138

; <label>:41:                                     ; preds = %36
  %42 = load %struct.DState*, %struct.DState** %5, align 8
  %43 = getelementptr inbounds %struct.DState, %struct.DState* %42, i32 0, i32 10
  %44 = load i8, i8* %43, align 4
  %45 = icmp ne i8 %44, 0
  br i1 %45, label %46, label %50

; <label>:46:                                     ; preds = %41
  %pgocount4 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 3)
  %47 = add i64 %pgocount4, 1
  store i64 %47, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 3)
  %48 = load %struct.DState*, %struct.DState** %5, align 8
  %49 = call zeroext i8 @unRLE_obuf_to_output_SMALL(%struct.DState* %48)
  store i8 %49, i8* %4, align 1
  br label %54

; <label>:50:                                     ; preds = %41
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 9)
  %51 = add i64 %pgocount5, 1
  store i64 %51, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 9)
  %52 = load %struct.DState*, %struct.DState** %5, align 8
  %53 = call zeroext i8 @unRLE_obuf_to_output_FAST(%struct.DState* %52)
  store i8 %53, i8* %4, align 1
  br label %54

; <label>:54:                                     ; preds = %50, %46
  %55 = load i8, i8* %4, align 1
  %56 = icmp ne i8 %55, 0
  br i1 %56, label %57, label %59

; <label>:57:                                     ; preds = %54
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 12)
  %58 = add i64 %pgocount6, 1
  store i64 %58, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 12)
  store i32 -4, i32* %2, align 4
  br label %188

; <label>:59:                                     ; preds = %54
  %60 = load %struct.DState*, %struct.DState** %5, align 8
  %61 = getelementptr inbounds %struct.DState, %struct.DState* %60, i32 0, i32 17
  %62 = load i32, i32* %61, align 4
  %63 = load %struct.DState*, %struct.DState** %5, align 8
  %64 = getelementptr inbounds %struct.DState, %struct.DState* %63, i32 0, i32 51
  %65 = load i32, i32* %64, align 8
  %66 = add nsw i32 %65, 1
  %67 = icmp eq i32 %62, %66
  br i1 %67, label %68, label %135

; <label>:68:                                     ; preds = %59
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 1)
  %69 = add i64 %pgocount7, 1
  store i64 %69, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 1)
  %70 = load %struct.DState*, %struct.DState** %5, align 8
  %71 = getelementptr inbounds %struct.DState, %struct.DState* %70, i32 0, i32 3
  %72 = load i32, i32* %71, align 8
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %74, label %135

; <label>:74:                                     ; preds = %68
  %75 = load %struct.DState*, %struct.DState** %5, align 8
  %76 = getelementptr inbounds %struct.DState, %struct.DState* %75, i32 0, i32 25
  %77 = load i32, i32* %76, align 8
  %78 = xor i32 %77, -1
  %79 = load %struct.DState*, %struct.DState** %5, align 8
  %80 = getelementptr inbounds %struct.DState, %struct.DState* %79, i32 0, i32 25
  store i32 %78, i32* %80, align 8
  %81 = load %struct.DState*, %struct.DState** %5, align 8
  %82 = getelementptr inbounds %struct.DState, %struct.DState* %81, i32 0, i32 12
  %83 = load i32, i32* %82, align 4
  %84 = icmp sge i32 %83, 3
  br i1 %84, label %85, label %95

; <label>:85:                                     ; preds = %74
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 5)
  %86 = add i64 %pgocount8, 1
  store i64 %86, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 5)
  %87 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %88 = load %struct.DState*, %struct.DState** %5, align 8
  %89 = getelementptr inbounds %struct.DState, %struct.DState* %88, i32 0, i32 23
  %90 = load i32, i32* %89, align 8
  %91 = load %struct.DState*, %struct.DState** %5, align 8
  %92 = getelementptr inbounds %struct.DState, %struct.DState* %91, i32 0, i32 25
  %93 = load i32, i32* %92, align 8
  %94 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %87, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i32 0, i32 0), i32 %90, i32 %93)
  br label %95

; <label>:95:                                     ; preds = %85, %74
  %96 = load %struct.DState*, %struct.DState** %5, align 8
  %97 = getelementptr inbounds %struct.DState, %struct.DState* %96, i32 0, i32 12
  %98 = load i32, i32* %97, align 4
  %99 = icmp sge i32 %98, 2
  br i1 %99, label %100, label %104

; <label>:100:                                    ; preds = %95
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 6)
  %101 = add i64 %pgocount9, 1
  store i64 %101, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 6)
  %102 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %103 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %102, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  br label %104

; <label>:104:                                    ; preds = %100, %95
  %105 = load %struct.DState*, %struct.DState** %5, align 8
  %106 = getelementptr inbounds %struct.DState, %struct.DState* %105, i32 0, i32 25
  %107 = load i32, i32* %106, align 8
  %108 = load %struct.DState*, %struct.DState** %5, align 8
  %109 = getelementptr inbounds %struct.DState, %struct.DState* %108, i32 0, i32 23
  %110 = load i32, i32* %109, align 8
  %111 = icmp ne i32 %107, %110
  br i1 %111, label %112, label %114

; <label>:112:                                    ; preds = %104
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 13)
  %113 = add i64 %pgocount10, 1
  store i64 %113, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 13)
  store i32 -4, i32* %2, align 4
  br label %188

; <label>:114:                                    ; preds = %104
  %115 = load %struct.DState*, %struct.DState** %5, align 8
  %116 = getelementptr inbounds %struct.DState, %struct.DState* %115, i32 0, i32 26
  %117 = load i32, i32* %116, align 4
  %118 = shl i32 %117, 1
  %119 = load %struct.DState*, %struct.DState** %5, align 8
  %120 = getelementptr inbounds %struct.DState, %struct.DState* %119, i32 0, i32 26
  %121 = load i32, i32* %120, align 4
  %122 = lshr i32 %121, 31
  %123 = or i32 %118, %122
  %124 = load %struct.DState*, %struct.DState** %5, align 8
  %125 = getelementptr inbounds %struct.DState, %struct.DState* %124, i32 0, i32 26
  store i32 %123, i32* %125, align 4
  %126 = load %struct.DState*, %struct.DState** %5, align 8
  %127 = getelementptr inbounds %struct.DState, %struct.DState* %126, i32 0, i32 25
  %128 = load i32, i32* %127, align 8
  %129 = load %struct.DState*, %struct.DState** %5, align 8
  %130 = getelementptr inbounds %struct.DState, %struct.DState* %129, i32 0, i32 26
  %131 = load i32, i32* %130, align 4
  %132 = xor i32 %131, %128
  store i32 %132, i32* %130, align 4
  %133 = load %struct.DState*, %struct.DState** %5, align 8
  %134 = getelementptr inbounds %struct.DState, %struct.DState* %133, i32 0, i32 1
  store i32 14, i32* %134, align 8
  br label %137

; <label>:135:                                    ; preds = %68, %59
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 11)
  %136 = add i64 %pgocount11, 1
  store i64 %136, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 11)
  store i32 0, i32* %2, align 4
  br label %188

; <label>:137:                                    ; preds = %114
  br label %138

; <label>:138:                                    ; preds = %137, %36
  %139 = load %struct.DState*, %struct.DState** %5, align 8
  %140 = getelementptr inbounds %struct.DState, %struct.DState* %139, i32 0, i32 1
  %141 = load i32, i32* %140, align 8
  %142 = icmp sge i32 %141, 10
  br i1 %142, label %143, label %186

; <label>:143:                                    ; preds = %138
  %144 = load %struct.DState*, %struct.DState** %5, align 8
  %145 = call i32 @BZ2_decompress(%struct.DState* %144)
  store i32 %145, i32* %6, align 4
  %146 = load i32, i32* %6, align 4
  %147 = icmp eq i32 %146, 4
  br i1 %147, label %148, label %176

; <label>:148:                                    ; preds = %143
  %149 = load %struct.DState*, %struct.DState** %5, align 8
  %150 = getelementptr inbounds %struct.DState, %struct.DState* %149, i32 0, i32 12
  %151 = load i32, i32* %150, align 4
  %152 = icmp sge i32 %151, 3
  br i1 %152, label %153, label %163

; <label>:153:                                    ; preds = %148
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 15)
  %154 = add i64 %pgocount12, 1
  store i64 %154, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 15)
  %155 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %156 = load %struct.DState*, %struct.DState** %5, align 8
  %157 = getelementptr inbounds %struct.DState, %struct.DState* %156, i32 0, i32 24
  %158 = load i32, i32* %157, align 4
  %159 = load %struct.DState*, %struct.DState** %5, align 8
  %160 = getelementptr inbounds %struct.DState, %struct.DState* %159, i32 0, i32 26
  %161 = load i32, i32* %160, align 4
  %162 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %155, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.4, i32 0, i32 0), i32 %158, i32 %161)
  br label %163

; <label>:163:                                    ; preds = %153, %148
  %164 = load %struct.DState*, %struct.DState** %5, align 8
  %165 = getelementptr inbounds %struct.DState, %struct.DState* %164, i32 0, i32 26
  %166 = load i32, i32* %165, align 4
  %167 = load %struct.DState*, %struct.DState** %5, align 8
  %168 = getelementptr inbounds %struct.DState, %struct.DState* %167, i32 0, i32 24
  %169 = load i32, i32* %168, align 4
  %170 = icmp ne i32 %166, %169
  br i1 %170, label %171, label %173

; <label>:171:                                    ; preds = %163
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 16)
  %172 = add i64 %pgocount13, 1
  store i64 %172, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 16)
  store i32 -4, i32* %2, align 4
  br label %188

; <label>:173:                                    ; preds = %163
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 17)
  %174 = add i64 %pgocount14, 1
  store i64 %174, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 17)
  %175 = load i32, i32* %6, align 4
  store i32 %175, i32* %2, align 4
  br label %188

; <label>:176:                                    ; preds = %143
  %177 = load %struct.DState*, %struct.DState** %5, align 8
  %178 = getelementptr inbounds %struct.DState, %struct.DState* %177, i32 0, i32 1
  %179 = load i32, i32* %178, align 8
  %180 = icmp ne i32 %179, 2
  br i1 %180, label %181, label %184

; <label>:181:                                    ; preds = %176
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 14)
  %182 = add i64 %pgocount15, 1
  store i64 %182, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 14)
  %183 = load i32, i32* %6, align 4
  store i32 %183, i32* %2, align 4
  br label %188

; <label>:184:                                    ; preds = %176
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 2)
  %185 = add i64 %pgocount16, 1
  store i64 %185, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 2)
  br label %186

; <label>:186:                                    ; preds = %184, %138
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 0)
  %187 = add i64 %pgocount17, 1
  store i64 %187, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_BZ2_bzDecompress, i64 0, i64 0)
  br label %29

; <label>:188:                                    ; preds = %181, %173, %171, %135, %112, %57, %34, %26, %18, %9
  %189 = load i32, i32* %2, align 4
  ret i32 %189
}

; Function Attrs: nounwind uwtable
define internal zeroext i8 @unRLE_obuf_to_output_SMALL(%struct.DState*) #0 {
  %2 = alloca i8, align 1
  %3 = alloca %struct.DState*, align 8
  %4 = alloca i8, align 1
  store %struct.DState* %0, %struct.DState** %3, align 8
  %5 = load %struct.DState*, %struct.DState** %3, align 8
  %6 = getelementptr inbounds %struct.DState, %struct.DState* %5, i32 0, i32 4
  %7 = load i8, i8* %6, align 4
  %8 = icmp ne i8 %7, 0
  br i1 %8, label %9, label %641

; <label>:9:                                      ; preds = %1
  br label %10

; <label>:10:                                     ; preds = %620, %453, %444, %340, %331, %227, %218, %9
  br label %11

; <label>:11:                                     ; preds = %91, %10
  %12 = load %struct.DState*, %struct.DState** %3, align 8
  %13 = getelementptr inbounds %struct.DState, %struct.DState* %12, i32 0, i32 0
  %14 = load %struct.bz_stream*, %struct.bz_stream** %13, align 8
  %15 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %14, i32 0, i32 5
  %16 = load i32, i32* %15, align 8
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 4)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 4)
  store i8 0, i8* %2, align 1
  br label %1058

; <label>:20:                                     ; preds = %11
  %21 = load %struct.DState*, %struct.DState** %3, align 8
  %22 = getelementptr inbounds %struct.DState, %struct.DState* %21, i32 0, i32 3
  %23 = load i32, i32* %22, align 8
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %26

; <label>:25:                                     ; preds = %20
  br label %92

; <label>:26:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 0)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 0)
  %28 = load %struct.DState*, %struct.DState** %3, align 8
  %29 = getelementptr inbounds %struct.DState, %struct.DState* %28, i32 0, i32 2
  %30 = load i8, i8* %29, align 4
  %31 = load %struct.DState*, %struct.DState** %3, align 8
  %32 = getelementptr inbounds %struct.DState, %struct.DState* %31, i32 0, i32 0
  %33 = load %struct.bz_stream*, %struct.bz_stream** %32, align 8
  %34 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %33, i32 0, i32 4
  %35 = load i8*, i8** %34, align 8
  store i8 %30, i8* %35, align 1
  %36 = load %struct.DState*, %struct.DState** %3, align 8
  %37 = getelementptr inbounds %struct.DState, %struct.DState* %36, i32 0, i32 25
  %38 = load i32, i32* %37, align 8
  %39 = shl i32 %38, 8
  %40 = load %struct.DState*, %struct.DState** %3, align 8
  %41 = getelementptr inbounds %struct.DState, %struct.DState* %40, i32 0, i32 25
  %42 = load i32, i32* %41, align 8
  %43 = lshr i32 %42, 24
  %44 = load %struct.DState*, %struct.DState** %3, align 8
  %45 = getelementptr inbounds %struct.DState, %struct.DState* %44, i32 0, i32 2
  %46 = load i8, i8* %45, align 4
  %47 = zext i8 %46 to i32
  %48 = xor i32 %43, %47
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds [256 x i32], [256 x i32]* @BZ2_crc32Table, i64 0, i64 %49
  %51 = load i32, i32* %50, align 4
  %52 = xor i32 %39, %51
  %53 = load %struct.DState*, %struct.DState** %3, align 8
  %54 = getelementptr inbounds %struct.DState, %struct.DState* %53, i32 0, i32 25
  store i32 %52, i32* %54, align 8
  %55 = load %struct.DState*, %struct.DState** %3, align 8
  %56 = getelementptr inbounds %struct.DState, %struct.DState* %55, i32 0, i32 3
  %57 = load i32, i32* %56, align 8
  %58 = add nsw i32 %57, -1
  store i32 %58, i32* %56, align 8
  %59 = load %struct.DState*, %struct.DState** %3, align 8
  %60 = getelementptr inbounds %struct.DState, %struct.DState* %59, i32 0, i32 0
  %61 = load %struct.bz_stream*, %struct.bz_stream** %60, align 8
  %62 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %61, i32 0, i32 4
  %63 = load i8*, i8** %62, align 8
  %64 = getelementptr inbounds i8, i8* %63, i32 1
  store i8* %64, i8** %62, align 8
  %65 = load %struct.DState*, %struct.DState** %3, align 8
  %66 = getelementptr inbounds %struct.DState, %struct.DState* %65, i32 0, i32 0
  %67 = load %struct.bz_stream*, %struct.bz_stream** %66, align 8
  %68 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %67, i32 0, i32 5
  %69 = load i32, i32* %68, align 8
  %70 = add i32 %69, -1
  store i32 %70, i32* %68, align 8
  %71 = load %struct.DState*, %struct.DState** %3, align 8
  %72 = getelementptr inbounds %struct.DState, %struct.DState* %71, i32 0, i32 0
  %73 = load %struct.bz_stream*, %struct.bz_stream** %72, align 8
  %74 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %73, i32 0, i32 6
  %75 = load i32, i32* %74, align 4
  %76 = add i32 %75, 1
  store i32 %76, i32* %74, align 4
  %77 = load %struct.DState*, %struct.DState** %3, align 8
  %78 = getelementptr inbounds %struct.DState, %struct.DState* %77, i32 0, i32 0
  %79 = load %struct.bz_stream*, %struct.bz_stream** %78, align 8
  %80 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %79, i32 0, i32 6
  %81 = load i32, i32* %80, align 4
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %83, label %91

; <label>:83:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 2)
  %84 = add i64 %pgocount2, 1
  store i64 %84, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 2)
  %85 = load %struct.DState*, %struct.DState** %3, align 8
  %86 = getelementptr inbounds %struct.DState, %struct.DState* %85, i32 0, i32 0
  %87 = load %struct.bz_stream*, %struct.bz_stream** %86, align 8
  %88 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %87, i32 0, i32 7
  %89 = load i32, i32* %88, align 8
  %90 = add i32 %89, 1
  store i32 %90, i32* %88, align 8
  br label %91

; <label>:91:                                     ; preds = %83, %26
  br label %11

; <label>:92:                                     ; preds = %25
  %93 = load %struct.DState*, %struct.DState** %3, align 8
  %94 = getelementptr inbounds %struct.DState, %struct.DState* %93, i32 0, i32 17
  %95 = load i32, i32* %94, align 4
  %96 = load %struct.DState*, %struct.DState** %3, align 8
  %97 = getelementptr inbounds %struct.DState, %struct.DState* %96, i32 0, i32 51
  %98 = load i32, i32* %97, align 8
  %99 = add nsw i32 %98, 1
  %100 = icmp eq i32 %95, %99
  br i1 %100, label %101, label %103

; <label>:101:                                    ; preds = %92
  %pgocount3 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 18)
  %102 = add i64 %pgocount3, 1
  store i64 %102, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 18)
  store i8 0, i8* %2, align 1
  br label %1058

; <label>:103:                                    ; preds = %92
  %104 = load %struct.DState*, %struct.DState** %3, align 8
  %105 = getelementptr inbounds %struct.DState, %struct.DState* %104, i32 0, i32 17
  %106 = load i32, i32* %105, align 4
  %107 = load %struct.DState*, %struct.DState** %3, align 8
  %108 = getelementptr inbounds %struct.DState, %struct.DState* %107, i32 0, i32 51
  %109 = load i32, i32* %108, align 8
  %110 = add nsw i32 %109, 1
  %111 = icmp sgt i32 %106, %110
  br i1 %111, label %112, label %114

; <label>:112:                                    ; preds = %103
  %pgocount4 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 19)
  %113 = add i64 %pgocount4, 1
  store i64 %113, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 19)
  store i8 1, i8* %2, align 1
  br label %1058

; <label>:114:                                    ; preds = %103
  %115 = load %struct.DState*, %struct.DState** %3, align 8
  %116 = getelementptr inbounds %struct.DState, %struct.DState* %115, i32 0, i32 3
  store i32 1, i32* %116, align 8
  %117 = load %struct.DState*, %struct.DState** %3, align 8
  %118 = getelementptr inbounds %struct.DState, %struct.DState* %117, i32 0, i32 15
  %119 = load i32, i32* %118, align 8
  %120 = trunc i32 %119 to i8
  %121 = load %struct.DState*, %struct.DState** %3, align 8
  %122 = getelementptr inbounds %struct.DState, %struct.DState* %121, i32 0, i32 2
  store i8 %120, i8* %122, align 4
  %123 = load %struct.DState*, %struct.DState** %3, align 8
  %124 = getelementptr inbounds %struct.DState, %struct.DState* %123, i32 0, i32 14
  %125 = load i32, i32* %124, align 4
  %126 = load %struct.DState*, %struct.DState** %3, align 8
  %127 = getelementptr inbounds %struct.DState, %struct.DState* %126, i32 0, i32 18
  %128 = getelementptr inbounds [257 x i32], [257 x i32]* %127, i32 0, i32 0
  %129 = call i32 @BZ2_indexIntoF(i32 %125, i32* %128)
  %130 = trunc i32 %129 to i8
  store i8 %130, i8* %4, align 1
  %131 = load %struct.DState*, %struct.DState** %3, align 8
  %132 = getelementptr inbounds %struct.DState, %struct.DState* %131, i32 0, i32 21
  %133 = load i16*, i16** %132, align 8
  %134 = load %struct.DState*, %struct.DState** %3, align 8
  %135 = getelementptr inbounds %struct.DState, %struct.DState* %134, i32 0, i32 14
  %136 = load i32, i32* %135, align 4
  %137 = zext i32 %136 to i64
  %138 = getelementptr inbounds i16, i16* %133, i64 %137
  %139 = load i16, i16* %138, align 2
  %140 = zext i16 %139 to i32
  %141 = load %struct.DState*, %struct.DState** %3, align 8
  %142 = getelementptr inbounds %struct.DState, %struct.DState* %141, i32 0, i32 22
  %143 = load i8*, i8** %142, align 8
  %144 = load %struct.DState*, %struct.DState** %3, align 8
  %145 = getelementptr inbounds %struct.DState, %struct.DState* %144, i32 0, i32 14
  %146 = load i32, i32* %145, align 4
  %147 = lshr i32 %146, 1
  %148 = zext i32 %147 to i64
  %149 = getelementptr inbounds i8, i8* %143, i64 %148
  %150 = load i8, i8* %149, align 1
  %151 = zext i8 %150 to i32
  %152 = load %struct.DState*, %struct.DState** %3, align 8
  %153 = getelementptr inbounds %struct.DState, %struct.DState* %152, i32 0, i32 14
  %154 = load i32, i32* %153, align 4
  %155 = shl i32 %154, 2
  %156 = and i32 %155, 4
  %157 = lshr i32 %151, %156
  %158 = and i32 %157, 15
  %159 = shl i32 %158, 16
  %160 = or i32 %140, %159
  %161 = load %struct.DState*, %struct.DState** %3, align 8
  %162 = getelementptr inbounds %struct.DState, %struct.DState* %161, i32 0, i32 14
  store i32 %160, i32* %162, align 4
  %163 = load %struct.DState*, %struct.DState** %3, align 8
  %164 = getelementptr inbounds %struct.DState, %struct.DState* %163, i32 0, i32 5
  %165 = load i32, i32* %164, align 8
  %166 = icmp eq i32 %165, 0
  br i1 %166, label %167, label %190

; <label>:167:                                    ; preds = %114
  %pgocount5 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 7)
  %168 = add i64 %pgocount5, 1
  store i64 %168, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 7)
  %169 = load %struct.DState*, %struct.DState** %3, align 8
  %170 = getelementptr inbounds %struct.DState, %struct.DState* %169, i32 0, i32 6
  %171 = load i32, i32* %170, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %172
  %174 = load i32, i32* %173, align 4
  %175 = load %struct.DState*, %struct.DState** %3, align 8
  %176 = getelementptr inbounds %struct.DState, %struct.DState* %175, i32 0, i32 5
  store i32 %174, i32* %176, align 8
  %177 = load %struct.DState*, %struct.DState** %3, align 8
  %178 = getelementptr inbounds %struct.DState, %struct.DState* %177, i32 0, i32 6
  %179 = load i32, i32* %178, align 4
  %180 = add nsw i32 %179, 1
  store i32 %180, i32* %178, align 4
  %181 = load %struct.DState*, %struct.DState** %3, align 8
  %182 = getelementptr inbounds %struct.DState, %struct.DState* %181, i32 0, i32 6
  %183 = load i32, i32* %182, align 4
  %184 = icmp eq i32 %183, 512
  br i1 %184, label %185, label %189

; <label>:185:                                    ; preds = %167
  %pgocount6 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 10)
  %186 = add i64 %pgocount6, 1
  store i64 %186, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 10)
  %187 = load %struct.DState*, %struct.DState** %3, align 8
  %188 = getelementptr inbounds %struct.DState, %struct.DState* %187, i32 0, i32 6
  store i32 0, i32* %188, align 4
  br label %189

; <label>:189:                                    ; preds = %185, %167
  br label %190

; <label>:190:                                    ; preds = %189, %114
  %191 = load %struct.DState*, %struct.DState** %3, align 8
  %192 = getelementptr inbounds %struct.DState, %struct.DState* %191, i32 0, i32 5
  %193 = load i32, i32* %192, align 8
  %194 = add nsw i32 %193, -1
  store i32 %194, i32* %192, align 8
  %195 = load %struct.DState*, %struct.DState** %3, align 8
  %196 = getelementptr inbounds %struct.DState, %struct.DState* %195, i32 0, i32 5
  %197 = load i32, i32* %196, align 8
  %198 = icmp eq i32 %197, 1
  %199 = zext i1 %198 to i64
  %pgocount7 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 34)
  %200 = add i64 %pgocount7, %199
  store i64 %200, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 34)
  %201 = select i1 %198, i32 1, i32 0
  %202 = load i8, i8* %4, align 1
  %203 = zext i8 %202 to i32
  %204 = xor i32 %203, %201
  %205 = trunc i32 %204 to i8
  store i8 %205, i8* %4, align 1
  %206 = load %struct.DState*, %struct.DState** %3, align 8
  %207 = getelementptr inbounds %struct.DState, %struct.DState* %206, i32 0, i32 17
  %208 = load i32, i32* %207, align 4
  %209 = add nsw i32 %208, 1
  store i32 %209, i32* %207, align 4
  %210 = load %struct.DState*, %struct.DState** %3, align 8
  %211 = getelementptr inbounds %struct.DState, %struct.DState* %210, i32 0, i32 17
  %212 = load i32, i32* %211, align 4
  %213 = load %struct.DState*, %struct.DState** %3, align 8
  %214 = getelementptr inbounds %struct.DState, %struct.DState* %213, i32 0, i32 51
  %215 = load i32, i32* %214, align 8
  %216 = add nsw i32 %215, 1
  %217 = icmp eq i32 %212, %216
  br i1 %217, label %218, label %220

; <label>:218:                                    ; preds = %190
  %pgocount8 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 6)
  %219 = add i64 %pgocount8, 1
  store i64 %219, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 6)
  br label %10

; <label>:220:                                    ; preds = %190
  %221 = load i8, i8* %4, align 1
  %222 = zext i8 %221 to i32
  %223 = load %struct.DState*, %struct.DState** %3, align 8
  %224 = getelementptr inbounds %struct.DState, %struct.DState* %223, i32 0, i32 15
  %225 = load i32, i32* %224, align 8
  %226 = icmp ne i32 %222, %225
  br i1 %226, label %227, label %233

; <label>:227:                                    ; preds = %220
  %pgocount9 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 9)
  %228 = add i64 %pgocount9, 1
  store i64 %228, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 9)
  %229 = load i8, i8* %4, align 1
  %230 = zext i8 %229 to i32
  %231 = load %struct.DState*, %struct.DState** %3, align 8
  %232 = getelementptr inbounds %struct.DState, %struct.DState* %231, i32 0, i32 15
  store i32 %230, i32* %232, align 8
  br label %10

; <label>:233:                                    ; preds = %220
  %234 = load %struct.DState*, %struct.DState** %3, align 8
  %235 = getelementptr inbounds %struct.DState, %struct.DState* %234, i32 0, i32 3
  store i32 2, i32* %235, align 8
  %236 = load %struct.DState*, %struct.DState** %3, align 8
  %237 = getelementptr inbounds %struct.DState, %struct.DState* %236, i32 0, i32 14
  %238 = load i32, i32* %237, align 4
  %239 = load %struct.DState*, %struct.DState** %3, align 8
  %240 = getelementptr inbounds %struct.DState, %struct.DState* %239, i32 0, i32 18
  %241 = getelementptr inbounds [257 x i32], [257 x i32]* %240, i32 0, i32 0
  %242 = call i32 @BZ2_indexIntoF(i32 %238, i32* %241)
  %243 = trunc i32 %242 to i8
  store i8 %243, i8* %4, align 1
  %244 = load %struct.DState*, %struct.DState** %3, align 8
  %245 = getelementptr inbounds %struct.DState, %struct.DState* %244, i32 0, i32 21
  %246 = load i16*, i16** %245, align 8
  %247 = load %struct.DState*, %struct.DState** %3, align 8
  %248 = getelementptr inbounds %struct.DState, %struct.DState* %247, i32 0, i32 14
  %249 = load i32, i32* %248, align 4
  %250 = zext i32 %249 to i64
  %251 = getelementptr inbounds i16, i16* %246, i64 %250
  %252 = load i16, i16* %251, align 2
  %253 = zext i16 %252 to i32
  %254 = load %struct.DState*, %struct.DState** %3, align 8
  %255 = getelementptr inbounds %struct.DState, %struct.DState* %254, i32 0, i32 22
  %256 = load i8*, i8** %255, align 8
  %257 = load %struct.DState*, %struct.DState** %3, align 8
  %258 = getelementptr inbounds %struct.DState, %struct.DState* %257, i32 0, i32 14
  %259 = load i32, i32* %258, align 4
  %260 = lshr i32 %259, 1
  %261 = zext i32 %260 to i64
  %262 = getelementptr inbounds i8, i8* %256, i64 %261
  %263 = load i8, i8* %262, align 1
  %264 = zext i8 %263 to i32
  %265 = load %struct.DState*, %struct.DState** %3, align 8
  %266 = getelementptr inbounds %struct.DState, %struct.DState* %265, i32 0, i32 14
  %267 = load i32, i32* %266, align 4
  %268 = shl i32 %267, 2
  %269 = and i32 %268, 4
  %270 = lshr i32 %264, %269
  %271 = and i32 %270, 15
  %272 = shl i32 %271, 16
  %273 = or i32 %253, %272
  %274 = load %struct.DState*, %struct.DState** %3, align 8
  %275 = getelementptr inbounds %struct.DState, %struct.DState* %274, i32 0, i32 14
  store i32 %273, i32* %275, align 4
  %276 = load %struct.DState*, %struct.DState** %3, align 8
  %277 = getelementptr inbounds %struct.DState, %struct.DState* %276, i32 0, i32 5
  %278 = load i32, i32* %277, align 8
  %279 = icmp eq i32 %278, 0
  br i1 %279, label %280, label %303

; <label>:280:                                    ; preds = %233
  %pgocount10 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 13)
  %281 = add i64 %pgocount10, 1
  store i64 %281, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 13)
  %282 = load %struct.DState*, %struct.DState** %3, align 8
  %283 = getelementptr inbounds %struct.DState, %struct.DState* %282, i32 0, i32 6
  %284 = load i32, i32* %283, align 4
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %285
  %287 = load i32, i32* %286, align 4
  %288 = load %struct.DState*, %struct.DState** %3, align 8
  %289 = getelementptr inbounds %struct.DState, %struct.DState* %288, i32 0, i32 5
  store i32 %287, i32* %289, align 8
  %290 = load %struct.DState*, %struct.DState** %3, align 8
  %291 = getelementptr inbounds %struct.DState, %struct.DState* %290, i32 0, i32 6
  %292 = load i32, i32* %291, align 4
  %293 = add nsw i32 %292, 1
  store i32 %293, i32* %291, align 4
  %294 = load %struct.DState*, %struct.DState** %3, align 8
  %295 = getelementptr inbounds %struct.DState, %struct.DState* %294, i32 0, i32 6
  %296 = load i32, i32* %295, align 4
  %297 = icmp eq i32 %296, 512
  br i1 %297, label %298, label %302

; <label>:298:                                    ; preds = %280
  %pgocount11 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 16)
  %299 = add i64 %pgocount11, 1
  store i64 %299, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 16)
  %300 = load %struct.DState*, %struct.DState** %3, align 8
  %301 = getelementptr inbounds %struct.DState, %struct.DState* %300, i32 0, i32 6
  store i32 0, i32* %301, align 4
  br label %302

; <label>:302:                                    ; preds = %298, %280
  br label %303

; <label>:303:                                    ; preds = %302, %233
  %304 = load %struct.DState*, %struct.DState** %3, align 8
  %305 = getelementptr inbounds %struct.DState, %struct.DState* %304, i32 0, i32 5
  %306 = load i32, i32* %305, align 8
  %307 = add nsw i32 %306, -1
  store i32 %307, i32* %305, align 8
  %308 = load %struct.DState*, %struct.DState** %3, align 8
  %309 = getelementptr inbounds %struct.DState, %struct.DState* %308, i32 0, i32 5
  %310 = load i32, i32* %309, align 8
  %311 = icmp eq i32 %310, 1
  %312 = zext i1 %311 to i64
  %pgocount12 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 35)
  %313 = add i64 %pgocount12, %312
  store i64 %313, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 35)
  %314 = select i1 %311, i32 1, i32 0
  %315 = load i8, i8* %4, align 1
  %316 = zext i8 %315 to i32
  %317 = xor i32 %316, %314
  %318 = trunc i32 %317 to i8
  store i8 %318, i8* %4, align 1
  %319 = load %struct.DState*, %struct.DState** %3, align 8
  %320 = getelementptr inbounds %struct.DState, %struct.DState* %319, i32 0, i32 17
  %321 = load i32, i32* %320, align 4
  %322 = add nsw i32 %321, 1
  store i32 %322, i32* %320, align 4
  %323 = load %struct.DState*, %struct.DState** %3, align 8
  %324 = getelementptr inbounds %struct.DState, %struct.DState* %323, i32 0, i32 17
  %325 = load i32, i32* %324, align 4
  %326 = load %struct.DState*, %struct.DState** %3, align 8
  %327 = getelementptr inbounds %struct.DState, %struct.DState* %326, i32 0, i32 51
  %328 = load i32, i32* %327, align 8
  %329 = add nsw i32 %328, 1
  %330 = icmp eq i32 %325, %329
  br i1 %330, label %331, label %333

; <label>:331:                                    ; preds = %303
  %pgocount13 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 12)
  %332 = add i64 %pgocount13, 1
  store i64 %332, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 12)
  br label %10

; <label>:333:                                    ; preds = %303
  %334 = load i8, i8* %4, align 1
  %335 = zext i8 %334 to i32
  %336 = load %struct.DState*, %struct.DState** %3, align 8
  %337 = getelementptr inbounds %struct.DState, %struct.DState* %336, i32 0, i32 15
  %338 = load i32, i32* %337, align 8
  %339 = icmp ne i32 %335, %338
  br i1 %339, label %340, label %346

; <label>:340:                                    ; preds = %333
  %pgocount14 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 15)
  %341 = add i64 %pgocount14, 1
  store i64 %341, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 15)
  %342 = load i8, i8* %4, align 1
  %343 = zext i8 %342 to i32
  %344 = load %struct.DState*, %struct.DState** %3, align 8
  %345 = getelementptr inbounds %struct.DState, %struct.DState* %344, i32 0, i32 15
  store i32 %343, i32* %345, align 8
  br label %10

; <label>:346:                                    ; preds = %333
  %347 = load %struct.DState*, %struct.DState** %3, align 8
  %348 = getelementptr inbounds %struct.DState, %struct.DState* %347, i32 0, i32 3
  store i32 3, i32* %348, align 8
  %349 = load %struct.DState*, %struct.DState** %3, align 8
  %350 = getelementptr inbounds %struct.DState, %struct.DState* %349, i32 0, i32 14
  %351 = load i32, i32* %350, align 4
  %352 = load %struct.DState*, %struct.DState** %3, align 8
  %353 = getelementptr inbounds %struct.DState, %struct.DState* %352, i32 0, i32 18
  %354 = getelementptr inbounds [257 x i32], [257 x i32]* %353, i32 0, i32 0
  %355 = call i32 @BZ2_indexIntoF(i32 %351, i32* %354)
  %356 = trunc i32 %355 to i8
  store i8 %356, i8* %4, align 1
  %357 = load %struct.DState*, %struct.DState** %3, align 8
  %358 = getelementptr inbounds %struct.DState, %struct.DState* %357, i32 0, i32 21
  %359 = load i16*, i16** %358, align 8
  %360 = load %struct.DState*, %struct.DState** %3, align 8
  %361 = getelementptr inbounds %struct.DState, %struct.DState* %360, i32 0, i32 14
  %362 = load i32, i32* %361, align 4
  %363 = zext i32 %362 to i64
  %364 = getelementptr inbounds i16, i16* %359, i64 %363
  %365 = load i16, i16* %364, align 2
  %366 = zext i16 %365 to i32
  %367 = load %struct.DState*, %struct.DState** %3, align 8
  %368 = getelementptr inbounds %struct.DState, %struct.DState* %367, i32 0, i32 22
  %369 = load i8*, i8** %368, align 8
  %370 = load %struct.DState*, %struct.DState** %3, align 8
  %371 = getelementptr inbounds %struct.DState, %struct.DState* %370, i32 0, i32 14
  %372 = load i32, i32* %371, align 4
  %373 = lshr i32 %372, 1
  %374 = zext i32 %373 to i64
  %375 = getelementptr inbounds i8, i8* %369, i64 %374
  %376 = load i8, i8* %375, align 1
  %377 = zext i8 %376 to i32
  %378 = load %struct.DState*, %struct.DState** %3, align 8
  %379 = getelementptr inbounds %struct.DState, %struct.DState* %378, i32 0, i32 14
  %380 = load i32, i32* %379, align 4
  %381 = shl i32 %380, 2
  %382 = and i32 %381, 4
  %383 = lshr i32 %377, %382
  %384 = and i32 %383, 15
  %385 = shl i32 %384, 16
  %386 = or i32 %366, %385
  %387 = load %struct.DState*, %struct.DState** %3, align 8
  %388 = getelementptr inbounds %struct.DState, %struct.DState* %387, i32 0, i32 14
  store i32 %386, i32* %388, align 4
  %389 = load %struct.DState*, %struct.DState** %3, align 8
  %390 = getelementptr inbounds %struct.DState, %struct.DState* %389, i32 0, i32 5
  %391 = load i32, i32* %390, align 8
  %392 = icmp eq i32 %391, 0
  br i1 %392, label %393, label %416

; <label>:393:                                    ; preds = %346
  %pgocount15 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 21)
  %394 = add i64 %pgocount15, 1
  store i64 %394, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 21)
  %395 = load %struct.DState*, %struct.DState** %3, align 8
  %396 = getelementptr inbounds %struct.DState, %struct.DState* %395, i32 0, i32 6
  %397 = load i32, i32* %396, align 4
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %398
  %400 = load i32, i32* %399, align 4
  %401 = load %struct.DState*, %struct.DState** %3, align 8
  %402 = getelementptr inbounds %struct.DState, %struct.DState* %401, i32 0, i32 5
  store i32 %400, i32* %402, align 8
  %403 = load %struct.DState*, %struct.DState** %3, align 8
  %404 = getelementptr inbounds %struct.DState, %struct.DState* %403, i32 0, i32 6
  %405 = load i32, i32* %404, align 4
  %406 = add nsw i32 %405, 1
  store i32 %406, i32* %404, align 4
  %407 = load %struct.DState*, %struct.DState** %3, align 8
  %408 = getelementptr inbounds %struct.DState, %struct.DState* %407, i32 0, i32 6
  %409 = load i32, i32* %408, align 4
  %410 = icmp eq i32 %409, 512
  br i1 %410, label %411, label %415

; <label>:411:                                    ; preds = %393
  %pgocount16 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 27)
  %412 = add i64 %pgocount16, 1
  store i64 %412, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 27)
  %413 = load %struct.DState*, %struct.DState** %3, align 8
  %414 = getelementptr inbounds %struct.DState, %struct.DState* %413, i32 0, i32 6
  store i32 0, i32* %414, align 4
  br label %415

; <label>:415:                                    ; preds = %411, %393
  br label %416

; <label>:416:                                    ; preds = %415, %346
  %417 = load %struct.DState*, %struct.DState** %3, align 8
  %418 = getelementptr inbounds %struct.DState, %struct.DState* %417, i32 0, i32 5
  %419 = load i32, i32* %418, align 8
  %420 = add nsw i32 %419, -1
  store i32 %420, i32* %418, align 8
  %421 = load %struct.DState*, %struct.DState** %3, align 8
  %422 = getelementptr inbounds %struct.DState, %struct.DState* %421, i32 0, i32 5
  %423 = load i32, i32* %422, align 8
  %424 = icmp eq i32 %423, 1
  %425 = zext i1 %424 to i64
  %pgocount17 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 36)
  %426 = add i64 %pgocount17, %425
  store i64 %426, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 36)
  %427 = select i1 %424, i32 1, i32 0
  %428 = load i8, i8* %4, align 1
  %429 = zext i8 %428 to i32
  %430 = xor i32 %429, %427
  %431 = trunc i32 %430 to i8
  store i8 %431, i8* %4, align 1
  %432 = load %struct.DState*, %struct.DState** %3, align 8
  %433 = getelementptr inbounds %struct.DState, %struct.DState* %432, i32 0, i32 17
  %434 = load i32, i32* %433, align 4
  %435 = add nsw i32 %434, 1
  store i32 %435, i32* %433, align 4
  %436 = load %struct.DState*, %struct.DState** %3, align 8
  %437 = getelementptr inbounds %struct.DState, %struct.DState* %436, i32 0, i32 17
  %438 = load i32, i32* %437, align 4
  %439 = load %struct.DState*, %struct.DState** %3, align 8
  %440 = getelementptr inbounds %struct.DState, %struct.DState* %439, i32 0, i32 51
  %441 = load i32, i32* %440, align 8
  %442 = add nsw i32 %441, 1
  %443 = icmp eq i32 %438, %442
  br i1 %443, label %444, label %446

; <label>:444:                                    ; preds = %416
  %pgocount18 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 20)
  %445 = add i64 %pgocount18, 1
  store i64 %445, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 20)
  br label %10

; <label>:446:                                    ; preds = %416
  %447 = load i8, i8* %4, align 1
  %448 = zext i8 %447 to i32
  %449 = load %struct.DState*, %struct.DState** %3, align 8
  %450 = getelementptr inbounds %struct.DState, %struct.DState* %449, i32 0, i32 15
  %451 = load i32, i32* %450, align 8
  %452 = icmp ne i32 %448, %451
  br i1 %452, label %453, label %459

; <label>:453:                                    ; preds = %446
  %pgocount19 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 25)
  %454 = add i64 %pgocount19, 1
  store i64 %454, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 25)
  %455 = load i8, i8* %4, align 1
  %456 = zext i8 %455 to i32
  %457 = load %struct.DState*, %struct.DState** %3, align 8
  %458 = getelementptr inbounds %struct.DState, %struct.DState* %457, i32 0, i32 15
  store i32 %456, i32* %458, align 8
  br label %10

; <label>:459:                                    ; preds = %446
  %460 = load %struct.DState*, %struct.DState** %3, align 8
  %461 = getelementptr inbounds %struct.DState, %struct.DState* %460, i32 0, i32 14
  %462 = load i32, i32* %461, align 4
  %463 = load %struct.DState*, %struct.DState** %3, align 8
  %464 = getelementptr inbounds %struct.DState, %struct.DState* %463, i32 0, i32 18
  %465 = getelementptr inbounds [257 x i32], [257 x i32]* %464, i32 0, i32 0
  %466 = call i32 @BZ2_indexIntoF(i32 %462, i32* %465)
  %467 = trunc i32 %466 to i8
  store i8 %467, i8* %4, align 1
  %468 = load %struct.DState*, %struct.DState** %3, align 8
  %469 = getelementptr inbounds %struct.DState, %struct.DState* %468, i32 0, i32 21
  %470 = load i16*, i16** %469, align 8
  %471 = load %struct.DState*, %struct.DState** %3, align 8
  %472 = getelementptr inbounds %struct.DState, %struct.DState* %471, i32 0, i32 14
  %473 = load i32, i32* %472, align 4
  %474 = zext i32 %473 to i64
  %475 = getelementptr inbounds i16, i16* %470, i64 %474
  %476 = load i16, i16* %475, align 2
  %477 = zext i16 %476 to i32
  %478 = load %struct.DState*, %struct.DState** %3, align 8
  %479 = getelementptr inbounds %struct.DState, %struct.DState* %478, i32 0, i32 22
  %480 = load i8*, i8** %479, align 8
  %481 = load %struct.DState*, %struct.DState** %3, align 8
  %482 = getelementptr inbounds %struct.DState, %struct.DState* %481, i32 0, i32 14
  %483 = load i32, i32* %482, align 4
  %484 = lshr i32 %483, 1
  %485 = zext i32 %484 to i64
  %486 = getelementptr inbounds i8, i8* %480, i64 %485
  %487 = load i8, i8* %486, align 1
  %488 = zext i8 %487 to i32
  %489 = load %struct.DState*, %struct.DState** %3, align 8
  %490 = getelementptr inbounds %struct.DState, %struct.DState* %489, i32 0, i32 14
  %491 = load i32, i32* %490, align 4
  %492 = shl i32 %491, 2
  %493 = and i32 %492, 4
  %494 = lshr i32 %488, %493
  %495 = and i32 %494, 15
  %496 = shl i32 %495, 16
  %497 = or i32 %477, %496
  %498 = load %struct.DState*, %struct.DState** %3, align 8
  %499 = getelementptr inbounds %struct.DState, %struct.DState* %498, i32 0, i32 14
  store i32 %497, i32* %499, align 4
  %500 = load %struct.DState*, %struct.DState** %3, align 8
  %501 = getelementptr inbounds %struct.DState, %struct.DState* %500, i32 0, i32 5
  %502 = load i32, i32* %501, align 8
  %503 = icmp eq i32 %502, 0
  br i1 %503, label %504, label %527

; <label>:504:                                    ; preds = %459
  %pgocount20 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 30)
  %505 = add i64 %pgocount20, 1
  store i64 %505, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 30)
  %506 = load %struct.DState*, %struct.DState** %3, align 8
  %507 = getelementptr inbounds %struct.DState, %struct.DState* %506, i32 0, i32 6
  %508 = load i32, i32* %507, align 4
  %509 = sext i32 %508 to i64
  %510 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %509
  %511 = load i32, i32* %510, align 4
  %512 = load %struct.DState*, %struct.DState** %3, align 8
  %513 = getelementptr inbounds %struct.DState, %struct.DState* %512, i32 0, i32 5
  store i32 %511, i32* %513, align 8
  %514 = load %struct.DState*, %struct.DState** %3, align 8
  %515 = getelementptr inbounds %struct.DState, %struct.DState* %514, i32 0, i32 6
  %516 = load i32, i32* %515, align 4
  %517 = add nsw i32 %516, 1
  store i32 %517, i32* %515, align 4
  %518 = load %struct.DState*, %struct.DState** %3, align 8
  %519 = getelementptr inbounds %struct.DState, %struct.DState* %518, i32 0, i32 6
  %520 = load i32, i32* %519, align 4
  %521 = icmp eq i32 %520, 512
  br i1 %521, label %522, label %526

; <label>:522:                                    ; preds = %504
  %pgocount21 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 32)
  %523 = add i64 %pgocount21, 1
  store i64 %523, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 32)
  %524 = load %struct.DState*, %struct.DState** %3, align 8
  %525 = getelementptr inbounds %struct.DState, %struct.DState* %524, i32 0, i32 6
  store i32 0, i32* %525, align 4
  br label %526

; <label>:526:                                    ; preds = %522, %504
  br label %527

; <label>:527:                                    ; preds = %526, %459
  %528 = load %struct.DState*, %struct.DState** %3, align 8
  %529 = getelementptr inbounds %struct.DState, %struct.DState* %528, i32 0, i32 5
  %530 = load i32, i32* %529, align 8
  %531 = add nsw i32 %530, -1
  store i32 %531, i32* %529, align 8
  %532 = load %struct.DState*, %struct.DState** %3, align 8
  %533 = getelementptr inbounds %struct.DState, %struct.DState* %532, i32 0, i32 5
  %534 = load i32, i32* %533, align 8
  %535 = icmp eq i32 %534, 1
  %536 = zext i1 %535 to i64
  %pgocount22 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 37)
  %537 = add i64 %pgocount22, %536
  store i64 %537, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 37)
  %538 = select i1 %535, i32 1, i32 0
  %539 = load i8, i8* %4, align 1
  %540 = zext i8 %539 to i32
  %541 = xor i32 %540, %538
  %542 = trunc i32 %541 to i8
  store i8 %542, i8* %4, align 1
  %543 = load %struct.DState*, %struct.DState** %3, align 8
  %544 = getelementptr inbounds %struct.DState, %struct.DState* %543, i32 0, i32 17
  %545 = load i32, i32* %544, align 4
  %546 = add nsw i32 %545, 1
  store i32 %546, i32* %544, align 4
  %547 = load i8, i8* %4, align 1
  %548 = zext i8 %547 to i32
  %549 = add nsw i32 %548, 4
  %550 = load %struct.DState*, %struct.DState** %3, align 8
  %551 = getelementptr inbounds %struct.DState, %struct.DState* %550, i32 0, i32 3
  store i32 %549, i32* %551, align 8
  %552 = load %struct.DState*, %struct.DState** %3, align 8
  %553 = getelementptr inbounds %struct.DState, %struct.DState* %552, i32 0, i32 14
  %554 = load i32, i32* %553, align 4
  %555 = load %struct.DState*, %struct.DState** %3, align 8
  %556 = getelementptr inbounds %struct.DState, %struct.DState* %555, i32 0, i32 18
  %557 = getelementptr inbounds [257 x i32], [257 x i32]* %556, i32 0, i32 0
  %558 = call i32 @BZ2_indexIntoF(i32 %554, i32* %557)
  %559 = load %struct.DState*, %struct.DState** %3, align 8
  %560 = getelementptr inbounds %struct.DState, %struct.DState* %559, i32 0, i32 15
  store i32 %558, i32* %560, align 8
  %561 = load %struct.DState*, %struct.DState** %3, align 8
  %562 = getelementptr inbounds %struct.DState, %struct.DState* %561, i32 0, i32 21
  %563 = load i16*, i16** %562, align 8
  %564 = load %struct.DState*, %struct.DState** %3, align 8
  %565 = getelementptr inbounds %struct.DState, %struct.DState* %564, i32 0, i32 14
  %566 = load i32, i32* %565, align 4
  %567 = zext i32 %566 to i64
  %568 = getelementptr inbounds i16, i16* %563, i64 %567
  %569 = load i16, i16* %568, align 2
  %570 = zext i16 %569 to i32
  %571 = load %struct.DState*, %struct.DState** %3, align 8
  %572 = getelementptr inbounds %struct.DState, %struct.DState* %571, i32 0, i32 22
  %573 = load i8*, i8** %572, align 8
  %574 = load %struct.DState*, %struct.DState** %3, align 8
  %575 = getelementptr inbounds %struct.DState, %struct.DState* %574, i32 0, i32 14
  %576 = load i32, i32* %575, align 4
  %577 = lshr i32 %576, 1
  %578 = zext i32 %577 to i64
  %579 = getelementptr inbounds i8, i8* %573, i64 %578
  %580 = load i8, i8* %579, align 1
  %581 = zext i8 %580 to i32
  %582 = load %struct.DState*, %struct.DState** %3, align 8
  %583 = getelementptr inbounds %struct.DState, %struct.DState* %582, i32 0, i32 14
  %584 = load i32, i32* %583, align 4
  %585 = shl i32 %584, 2
  %586 = and i32 %585, 4
  %587 = lshr i32 %581, %586
  %588 = and i32 %587, 15
  %589 = shl i32 %588, 16
  %590 = or i32 %570, %589
  %591 = load %struct.DState*, %struct.DState** %3, align 8
  %592 = getelementptr inbounds %struct.DState, %struct.DState* %591, i32 0, i32 14
  store i32 %590, i32* %592, align 4
  %593 = load %struct.DState*, %struct.DState** %3, align 8
  %594 = getelementptr inbounds %struct.DState, %struct.DState* %593, i32 0, i32 5
  %595 = load i32, i32* %594, align 8
  %596 = icmp eq i32 %595, 0
  br i1 %596, label %597, label %620

; <label>:597:                                    ; preds = %527
  %pgocount23 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 31)
  %598 = add i64 %pgocount23, 1
  store i64 %598, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 31)
  %599 = load %struct.DState*, %struct.DState** %3, align 8
  %600 = getelementptr inbounds %struct.DState, %struct.DState* %599, i32 0, i32 6
  %601 = load i32, i32* %600, align 4
  %602 = sext i32 %601 to i64
  %603 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %602
  %604 = load i32, i32* %603, align 4
  %605 = load %struct.DState*, %struct.DState** %3, align 8
  %606 = getelementptr inbounds %struct.DState, %struct.DState* %605, i32 0, i32 5
  store i32 %604, i32* %606, align 8
  %607 = load %struct.DState*, %struct.DState** %3, align 8
  %608 = getelementptr inbounds %struct.DState, %struct.DState* %607, i32 0, i32 6
  %609 = load i32, i32* %608, align 4
  %610 = add nsw i32 %609, 1
  store i32 %610, i32* %608, align 4
  %611 = load %struct.DState*, %struct.DState** %3, align 8
  %612 = getelementptr inbounds %struct.DState, %struct.DState* %611, i32 0, i32 6
  %613 = load i32, i32* %612, align 4
  %614 = icmp eq i32 %613, 512
  br i1 %614, label %615, label %619

; <label>:615:                                    ; preds = %597
  %pgocount24 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 33)
  %616 = add i64 %pgocount24, 1
  store i64 %616, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 33)
  %617 = load %struct.DState*, %struct.DState** %3, align 8
  %618 = getelementptr inbounds %struct.DState, %struct.DState* %617, i32 0, i32 6
  store i32 0, i32* %618, align 4
  br label %619

; <label>:619:                                    ; preds = %615, %597
  br label %620

; <label>:620:                                    ; preds = %619, %527
  %pgocount25 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 26)
  %621 = add i64 %pgocount25, 1
  store i64 %621, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 26)
  %622 = load %struct.DState*, %struct.DState** %3, align 8
  %623 = getelementptr inbounds %struct.DState, %struct.DState* %622, i32 0, i32 5
  %624 = load i32, i32* %623, align 8
  %625 = add nsw i32 %624, -1
  store i32 %625, i32* %623, align 8
  %626 = load %struct.DState*, %struct.DState** %3, align 8
  %627 = getelementptr inbounds %struct.DState, %struct.DState* %626, i32 0, i32 5
  %628 = load i32, i32* %627, align 8
  %629 = icmp eq i32 %628, 1
  %630 = zext i1 %629 to i64
  %pgocount26 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 38)
  %631 = add i64 %pgocount26, %630
  store i64 %631, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 38)
  %632 = select i1 %629, i32 1, i32 0
  %633 = load %struct.DState*, %struct.DState** %3, align 8
  %634 = getelementptr inbounds %struct.DState, %struct.DState* %633, i32 0, i32 15
  %635 = load i32, i32* %634, align 8
  %636 = xor i32 %635, %632
  store i32 %636, i32* %634, align 8
  %637 = load %struct.DState*, %struct.DState** %3, align 8
  %638 = getelementptr inbounds %struct.DState, %struct.DState* %637, i32 0, i32 17
  %639 = load i32, i32* %638, align 4
  %640 = add nsw i32 %639, 1
  store i32 %640, i32* %638, align 4
  br label %10

; <label>:641:                                    ; preds = %1
  br label %642

; <label>:642:                                    ; preds = %962, %956, %947, %886, %877, %816, %807, %641
  br label %643

; <label>:643:                                    ; preds = %723, %642
  %644 = load %struct.DState*, %struct.DState** %3, align 8
  %645 = getelementptr inbounds %struct.DState, %struct.DState* %644, i32 0, i32 0
  %646 = load %struct.bz_stream*, %struct.bz_stream** %645, align 8
  %647 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %646, i32 0, i32 5
  %648 = load i32, i32* %647, align 8
  %649 = icmp eq i32 %648, 0
  br i1 %649, label %650, label %652

; <label>:650:                                    ; preds = %643
  %pgocount27 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 5)
  %651 = add i64 %pgocount27, 1
  store i64 %651, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 5)
  store i8 0, i8* %2, align 1
  br label %1058

; <label>:652:                                    ; preds = %643
  %653 = load %struct.DState*, %struct.DState** %3, align 8
  %654 = getelementptr inbounds %struct.DState, %struct.DState* %653, i32 0, i32 3
  %655 = load i32, i32* %654, align 8
  %656 = icmp eq i32 %655, 0
  br i1 %656, label %657, label %658

; <label>:657:                                    ; preds = %652
  br label %724

; <label>:658:                                    ; preds = %652
  %pgocount28 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 1)
  %659 = add i64 %pgocount28, 1
  store i64 %659, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 1)
  %660 = load %struct.DState*, %struct.DState** %3, align 8
  %661 = getelementptr inbounds %struct.DState, %struct.DState* %660, i32 0, i32 2
  %662 = load i8, i8* %661, align 4
  %663 = load %struct.DState*, %struct.DState** %3, align 8
  %664 = getelementptr inbounds %struct.DState, %struct.DState* %663, i32 0, i32 0
  %665 = load %struct.bz_stream*, %struct.bz_stream** %664, align 8
  %666 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %665, i32 0, i32 4
  %667 = load i8*, i8** %666, align 8
  store i8 %662, i8* %667, align 1
  %668 = load %struct.DState*, %struct.DState** %3, align 8
  %669 = getelementptr inbounds %struct.DState, %struct.DState* %668, i32 0, i32 25
  %670 = load i32, i32* %669, align 8
  %671 = shl i32 %670, 8
  %672 = load %struct.DState*, %struct.DState** %3, align 8
  %673 = getelementptr inbounds %struct.DState, %struct.DState* %672, i32 0, i32 25
  %674 = load i32, i32* %673, align 8
  %675 = lshr i32 %674, 24
  %676 = load %struct.DState*, %struct.DState** %3, align 8
  %677 = getelementptr inbounds %struct.DState, %struct.DState* %676, i32 0, i32 2
  %678 = load i8, i8* %677, align 4
  %679 = zext i8 %678 to i32
  %680 = xor i32 %675, %679
  %681 = zext i32 %680 to i64
  %682 = getelementptr inbounds [256 x i32], [256 x i32]* @BZ2_crc32Table, i64 0, i64 %681
  %683 = load i32, i32* %682, align 4
  %684 = xor i32 %671, %683
  %685 = load %struct.DState*, %struct.DState** %3, align 8
  %686 = getelementptr inbounds %struct.DState, %struct.DState* %685, i32 0, i32 25
  store i32 %684, i32* %686, align 8
  %687 = load %struct.DState*, %struct.DState** %3, align 8
  %688 = getelementptr inbounds %struct.DState, %struct.DState* %687, i32 0, i32 3
  %689 = load i32, i32* %688, align 8
  %690 = add nsw i32 %689, -1
  store i32 %690, i32* %688, align 8
  %691 = load %struct.DState*, %struct.DState** %3, align 8
  %692 = getelementptr inbounds %struct.DState, %struct.DState* %691, i32 0, i32 0
  %693 = load %struct.bz_stream*, %struct.bz_stream** %692, align 8
  %694 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %693, i32 0, i32 4
  %695 = load i8*, i8** %694, align 8
  %696 = getelementptr inbounds i8, i8* %695, i32 1
  store i8* %696, i8** %694, align 8
  %697 = load %struct.DState*, %struct.DState** %3, align 8
  %698 = getelementptr inbounds %struct.DState, %struct.DState* %697, i32 0, i32 0
  %699 = load %struct.bz_stream*, %struct.bz_stream** %698, align 8
  %700 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %699, i32 0, i32 5
  %701 = load i32, i32* %700, align 8
  %702 = add i32 %701, -1
  store i32 %702, i32* %700, align 8
  %703 = load %struct.DState*, %struct.DState** %3, align 8
  %704 = getelementptr inbounds %struct.DState, %struct.DState* %703, i32 0, i32 0
  %705 = load %struct.bz_stream*, %struct.bz_stream** %704, align 8
  %706 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %705, i32 0, i32 6
  %707 = load i32, i32* %706, align 4
  %708 = add i32 %707, 1
  store i32 %708, i32* %706, align 4
  %709 = load %struct.DState*, %struct.DState** %3, align 8
  %710 = getelementptr inbounds %struct.DState, %struct.DState* %709, i32 0, i32 0
  %711 = load %struct.bz_stream*, %struct.bz_stream** %710, align 8
  %712 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %711, i32 0, i32 6
  %713 = load i32, i32* %712, align 4
  %714 = icmp eq i32 %713, 0
  br i1 %714, label %715, label %723

; <label>:715:                                    ; preds = %658
  %pgocount29 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 3)
  %716 = add i64 %pgocount29, 1
  store i64 %716, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 3)
  %717 = load %struct.DState*, %struct.DState** %3, align 8
  %718 = getelementptr inbounds %struct.DState, %struct.DState* %717, i32 0, i32 0
  %719 = load %struct.bz_stream*, %struct.bz_stream** %718, align 8
  %720 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %719, i32 0, i32 7
  %721 = load i32, i32* %720, align 8
  %722 = add i32 %721, 1
  store i32 %722, i32* %720, align 8
  br label %723

; <label>:723:                                    ; preds = %715, %658
  br label %643

; <label>:724:                                    ; preds = %657
  %725 = load %struct.DState*, %struct.DState** %3, align 8
  %726 = getelementptr inbounds %struct.DState, %struct.DState* %725, i32 0, i32 17
  %727 = load i32, i32* %726, align 4
  %728 = load %struct.DState*, %struct.DState** %3, align 8
  %729 = getelementptr inbounds %struct.DState, %struct.DState* %728, i32 0, i32 51
  %730 = load i32, i32* %729, align 8
  %731 = add nsw i32 %730, 1
  %732 = icmp eq i32 %727, %731
  br i1 %732, label %733, label %735

; <label>:733:                                    ; preds = %724
  %pgocount30 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 22)
  %734 = add i64 %pgocount30, 1
  store i64 %734, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 22)
  store i8 0, i8* %2, align 1
  br label %1058

; <label>:735:                                    ; preds = %724
  %736 = load %struct.DState*, %struct.DState** %3, align 8
  %737 = getelementptr inbounds %struct.DState, %struct.DState* %736, i32 0, i32 17
  %738 = load i32, i32* %737, align 4
  %739 = load %struct.DState*, %struct.DState** %3, align 8
  %740 = getelementptr inbounds %struct.DState, %struct.DState* %739, i32 0, i32 51
  %741 = load i32, i32* %740, align 8
  %742 = add nsw i32 %741, 1
  %743 = icmp sgt i32 %738, %742
  br i1 %743, label %744, label %746

; <label>:744:                                    ; preds = %735
  %pgocount31 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 23)
  %745 = add i64 %pgocount31, 1
  store i64 %745, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 23)
  store i8 1, i8* %2, align 1
  br label %1058

; <label>:746:                                    ; preds = %735
  %747 = load %struct.DState*, %struct.DState** %3, align 8
  %748 = getelementptr inbounds %struct.DState, %struct.DState* %747, i32 0, i32 3
  store i32 1, i32* %748, align 8
  %749 = load %struct.DState*, %struct.DState** %3, align 8
  %750 = getelementptr inbounds %struct.DState, %struct.DState* %749, i32 0, i32 15
  %751 = load i32, i32* %750, align 8
  %752 = trunc i32 %751 to i8
  %753 = load %struct.DState*, %struct.DState** %3, align 8
  %754 = getelementptr inbounds %struct.DState, %struct.DState* %753, i32 0, i32 2
  store i8 %752, i8* %754, align 4
  %755 = load %struct.DState*, %struct.DState** %3, align 8
  %756 = getelementptr inbounds %struct.DState, %struct.DState* %755, i32 0, i32 14
  %757 = load i32, i32* %756, align 4
  %758 = load %struct.DState*, %struct.DState** %3, align 8
  %759 = getelementptr inbounds %struct.DState, %struct.DState* %758, i32 0, i32 18
  %760 = getelementptr inbounds [257 x i32], [257 x i32]* %759, i32 0, i32 0
  %761 = call i32 @BZ2_indexIntoF(i32 %757, i32* %760)
  %762 = trunc i32 %761 to i8
  store i8 %762, i8* %4, align 1
  %763 = load %struct.DState*, %struct.DState** %3, align 8
  %764 = getelementptr inbounds %struct.DState, %struct.DState* %763, i32 0, i32 21
  %765 = load i16*, i16** %764, align 8
  %766 = load %struct.DState*, %struct.DState** %3, align 8
  %767 = getelementptr inbounds %struct.DState, %struct.DState* %766, i32 0, i32 14
  %768 = load i32, i32* %767, align 4
  %769 = zext i32 %768 to i64
  %770 = getelementptr inbounds i16, i16* %765, i64 %769
  %771 = load i16, i16* %770, align 2
  %772 = zext i16 %771 to i32
  %773 = load %struct.DState*, %struct.DState** %3, align 8
  %774 = getelementptr inbounds %struct.DState, %struct.DState* %773, i32 0, i32 22
  %775 = load i8*, i8** %774, align 8
  %776 = load %struct.DState*, %struct.DState** %3, align 8
  %777 = getelementptr inbounds %struct.DState, %struct.DState* %776, i32 0, i32 14
  %778 = load i32, i32* %777, align 4
  %779 = lshr i32 %778, 1
  %780 = zext i32 %779 to i64
  %781 = getelementptr inbounds i8, i8* %775, i64 %780
  %782 = load i8, i8* %781, align 1
  %783 = zext i8 %782 to i32
  %784 = load %struct.DState*, %struct.DState** %3, align 8
  %785 = getelementptr inbounds %struct.DState, %struct.DState* %784, i32 0, i32 14
  %786 = load i32, i32* %785, align 4
  %787 = shl i32 %786, 2
  %788 = and i32 %787, 4
  %789 = lshr i32 %783, %788
  %790 = and i32 %789, 15
  %791 = shl i32 %790, 16
  %792 = or i32 %772, %791
  %793 = load %struct.DState*, %struct.DState** %3, align 8
  %794 = getelementptr inbounds %struct.DState, %struct.DState* %793, i32 0, i32 14
  store i32 %792, i32* %794, align 4
  %795 = load %struct.DState*, %struct.DState** %3, align 8
  %796 = getelementptr inbounds %struct.DState, %struct.DState* %795, i32 0, i32 17
  %797 = load i32, i32* %796, align 4
  %798 = add nsw i32 %797, 1
  store i32 %798, i32* %796, align 4
  %799 = load %struct.DState*, %struct.DState** %3, align 8
  %800 = getelementptr inbounds %struct.DState, %struct.DState* %799, i32 0, i32 17
  %801 = load i32, i32* %800, align 4
  %802 = load %struct.DState*, %struct.DState** %3, align 8
  %803 = getelementptr inbounds %struct.DState, %struct.DState* %802, i32 0, i32 51
  %804 = load i32, i32* %803, align 8
  %805 = add nsw i32 %804, 1
  %806 = icmp eq i32 %801, %805
  br i1 %806, label %807, label %809

; <label>:807:                                    ; preds = %746
  %pgocount32 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 8)
  %808 = add i64 %pgocount32, 1
  store i64 %808, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 8)
  br label %642

; <label>:809:                                    ; preds = %746
  %810 = load i8, i8* %4, align 1
  %811 = zext i8 %810 to i32
  %812 = load %struct.DState*, %struct.DState** %3, align 8
  %813 = getelementptr inbounds %struct.DState, %struct.DState* %812, i32 0, i32 15
  %814 = load i32, i32* %813, align 8
  %815 = icmp ne i32 %811, %814
  br i1 %815, label %816, label %822

; <label>:816:                                    ; preds = %809
  %pgocount33 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 11)
  %817 = add i64 %pgocount33, 1
  store i64 %817, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 11)
  %818 = load i8, i8* %4, align 1
  %819 = zext i8 %818 to i32
  %820 = load %struct.DState*, %struct.DState** %3, align 8
  %821 = getelementptr inbounds %struct.DState, %struct.DState* %820, i32 0, i32 15
  store i32 %819, i32* %821, align 8
  br label %642

; <label>:822:                                    ; preds = %809
  %823 = load %struct.DState*, %struct.DState** %3, align 8
  %824 = getelementptr inbounds %struct.DState, %struct.DState* %823, i32 0, i32 3
  store i32 2, i32* %824, align 8
  %825 = load %struct.DState*, %struct.DState** %3, align 8
  %826 = getelementptr inbounds %struct.DState, %struct.DState* %825, i32 0, i32 14
  %827 = load i32, i32* %826, align 4
  %828 = load %struct.DState*, %struct.DState** %3, align 8
  %829 = getelementptr inbounds %struct.DState, %struct.DState* %828, i32 0, i32 18
  %830 = getelementptr inbounds [257 x i32], [257 x i32]* %829, i32 0, i32 0
  %831 = call i32 @BZ2_indexIntoF(i32 %827, i32* %830)
  %832 = trunc i32 %831 to i8
  store i8 %832, i8* %4, align 1
  %833 = load %struct.DState*, %struct.DState** %3, align 8
  %834 = getelementptr inbounds %struct.DState, %struct.DState* %833, i32 0, i32 21
  %835 = load i16*, i16** %834, align 8
  %836 = load %struct.DState*, %struct.DState** %3, align 8
  %837 = getelementptr inbounds %struct.DState, %struct.DState* %836, i32 0, i32 14
  %838 = load i32, i32* %837, align 4
  %839 = zext i32 %838 to i64
  %840 = getelementptr inbounds i16, i16* %835, i64 %839
  %841 = load i16, i16* %840, align 2
  %842 = zext i16 %841 to i32
  %843 = load %struct.DState*, %struct.DState** %3, align 8
  %844 = getelementptr inbounds %struct.DState, %struct.DState* %843, i32 0, i32 22
  %845 = load i8*, i8** %844, align 8
  %846 = load %struct.DState*, %struct.DState** %3, align 8
  %847 = getelementptr inbounds %struct.DState, %struct.DState* %846, i32 0, i32 14
  %848 = load i32, i32* %847, align 4
  %849 = lshr i32 %848, 1
  %850 = zext i32 %849 to i64
  %851 = getelementptr inbounds i8, i8* %845, i64 %850
  %852 = load i8, i8* %851, align 1
  %853 = zext i8 %852 to i32
  %854 = load %struct.DState*, %struct.DState** %3, align 8
  %855 = getelementptr inbounds %struct.DState, %struct.DState* %854, i32 0, i32 14
  %856 = load i32, i32* %855, align 4
  %857 = shl i32 %856, 2
  %858 = and i32 %857, 4
  %859 = lshr i32 %853, %858
  %860 = and i32 %859, 15
  %861 = shl i32 %860, 16
  %862 = or i32 %842, %861
  %863 = load %struct.DState*, %struct.DState** %3, align 8
  %864 = getelementptr inbounds %struct.DState, %struct.DState* %863, i32 0, i32 14
  store i32 %862, i32* %864, align 4
  %865 = load %struct.DState*, %struct.DState** %3, align 8
  %866 = getelementptr inbounds %struct.DState, %struct.DState* %865, i32 0, i32 17
  %867 = load i32, i32* %866, align 4
  %868 = add nsw i32 %867, 1
  store i32 %868, i32* %866, align 4
  %869 = load %struct.DState*, %struct.DState** %3, align 8
  %870 = getelementptr inbounds %struct.DState, %struct.DState* %869, i32 0, i32 17
  %871 = load i32, i32* %870, align 4
  %872 = load %struct.DState*, %struct.DState** %3, align 8
  %873 = getelementptr inbounds %struct.DState, %struct.DState* %872, i32 0, i32 51
  %874 = load i32, i32* %873, align 8
  %875 = add nsw i32 %874, 1
  %876 = icmp eq i32 %871, %875
  br i1 %876, label %877, label %879

; <label>:877:                                    ; preds = %822
  %pgocount34 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 14)
  %878 = add i64 %pgocount34, 1
  store i64 %878, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 14)
  br label %642

; <label>:879:                                    ; preds = %822
  %880 = load i8, i8* %4, align 1
  %881 = zext i8 %880 to i32
  %882 = load %struct.DState*, %struct.DState** %3, align 8
  %883 = getelementptr inbounds %struct.DState, %struct.DState* %882, i32 0, i32 15
  %884 = load i32, i32* %883, align 8
  %885 = icmp ne i32 %881, %884
  br i1 %885, label %886, label %892

; <label>:886:                                    ; preds = %879
  %pgocount35 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 17)
  %887 = add i64 %pgocount35, 1
  store i64 %887, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 17)
  %888 = load i8, i8* %4, align 1
  %889 = zext i8 %888 to i32
  %890 = load %struct.DState*, %struct.DState** %3, align 8
  %891 = getelementptr inbounds %struct.DState, %struct.DState* %890, i32 0, i32 15
  store i32 %889, i32* %891, align 8
  br label %642

; <label>:892:                                    ; preds = %879
  %893 = load %struct.DState*, %struct.DState** %3, align 8
  %894 = getelementptr inbounds %struct.DState, %struct.DState* %893, i32 0, i32 3
  store i32 3, i32* %894, align 8
  %895 = load %struct.DState*, %struct.DState** %3, align 8
  %896 = getelementptr inbounds %struct.DState, %struct.DState* %895, i32 0, i32 14
  %897 = load i32, i32* %896, align 4
  %898 = load %struct.DState*, %struct.DState** %3, align 8
  %899 = getelementptr inbounds %struct.DState, %struct.DState* %898, i32 0, i32 18
  %900 = getelementptr inbounds [257 x i32], [257 x i32]* %899, i32 0, i32 0
  %901 = call i32 @BZ2_indexIntoF(i32 %897, i32* %900)
  %902 = trunc i32 %901 to i8
  store i8 %902, i8* %4, align 1
  %903 = load %struct.DState*, %struct.DState** %3, align 8
  %904 = getelementptr inbounds %struct.DState, %struct.DState* %903, i32 0, i32 21
  %905 = load i16*, i16** %904, align 8
  %906 = load %struct.DState*, %struct.DState** %3, align 8
  %907 = getelementptr inbounds %struct.DState, %struct.DState* %906, i32 0, i32 14
  %908 = load i32, i32* %907, align 4
  %909 = zext i32 %908 to i64
  %910 = getelementptr inbounds i16, i16* %905, i64 %909
  %911 = load i16, i16* %910, align 2
  %912 = zext i16 %911 to i32
  %913 = load %struct.DState*, %struct.DState** %3, align 8
  %914 = getelementptr inbounds %struct.DState, %struct.DState* %913, i32 0, i32 22
  %915 = load i8*, i8** %914, align 8
  %916 = load %struct.DState*, %struct.DState** %3, align 8
  %917 = getelementptr inbounds %struct.DState, %struct.DState* %916, i32 0, i32 14
  %918 = load i32, i32* %917, align 4
  %919 = lshr i32 %918, 1
  %920 = zext i32 %919 to i64
  %921 = getelementptr inbounds i8, i8* %915, i64 %920
  %922 = load i8, i8* %921, align 1
  %923 = zext i8 %922 to i32
  %924 = load %struct.DState*, %struct.DState** %3, align 8
  %925 = getelementptr inbounds %struct.DState, %struct.DState* %924, i32 0, i32 14
  %926 = load i32, i32* %925, align 4
  %927 = shl i32 %926, 2
  %928 = and i32 %927, 4
  %929 = lshr i32 %923, %928
  %930 = and i32 %929, 15
  %931 = shl i32 %930, 16
  %932 = or i32 %912, %931
  %933 = load %struct.DState*, %struct.DState** %3, align 8
  %934 = getelementptr inbounds %struct.DState, %struct.DState* %933, i32 0, i32 14
  store i32 %932, i32* %934, align 4
  %935 = load %struct.DState*, %struct.DState** %3, align 8
  %936 = getelementptr inbounds %struct.DState, %struct.DState* %935, i32 0, i32 17
  %937 = load i32, i32* %936, align 4
  %938 = add nsw i32 %937, 1
  store i32 %938, i32* %936, align 4
  %939 = load %struct.DState*, %struct.DState** %3, align 8
  %940 = getelementptr inbounds %struct.DState, %struct.DState* %939, i32 0, i32 17
  %941 = load i32, i32* %940, align 4
  %942 = load %struct.DState*, %struct.DState** %3, align 8
  %943 = getelementptr inbounds %struct.DState, %struct.DState* %942, i32 0, i32 51
  %944 = load i32, i32* %943, align 8
  %945 = add nsw i32 %944, 1
  %946 = icmp eq i32 %941, %945
  br i1 %946, label %947, label %949

; <label>:947:                                    ; preds = %892
  %pgocount36 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 24)
  %948 = add i64 %pgocount36, 1
  store i64 %948, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 24)
  br label %642

; <label>:949:                                    ; preds = %892
  %950 = load i8, i8* %4, align 1
  %951 = zext i8 %950 to i32
  %952 = load %struct.DState*, %struct.DState** %3, align 8
  %953 = getelementptr inbounds %struct.DState, %struct.DState* %952, i32 0, i32 15
  %954 = load i32, i32* %953, align 8
  %955 = icmp ne i32 %951, %954
  br i1 %955, label %956, label %962

; <label>:956:                                    ; preds = %949
  %pgocount37 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 28)
  %957 = add i64 %pgocount37, 1
  store i64 %957, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 28)
  %958 = load i8, i8* %4, align 1
  %959 = zext i8 %958 to i32
  %960 = load %struct.DState*, %struct.DState** %3, align 8
  %961 = getelementptr inbounds %struct.DState, %struct.DState* %960, i32 0, i32 15
  store i32 %959, i32* %961, align 8
  br label %642

; <label>:962:                                    ; preds = %949
  %pgocount38 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 29)
  %963 = add i64 %pgocount38, 1
  store i64 %963, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_SMALL, i64 0, i64 29)
  %964 = load %struct.DState*, %struct.DState** %3, align 8
  %965 = getelementptr inbounds %struct.DState, %struct.DState* %964, i32 0, i32 14
  %966 = load i32, i32* %965, align 4
  %967 = load %struct.DState*, %struct.DState** %3, align 8
  %968 = getelementptr inbounds %struct.DState, %struct.DState* %967, i32 0, i32 18
  %969 = getelementptr inbounds [257 x i32], [257 x i32]* %968, i32 0, i32 0
  %970 = call i32 @BZ2_indexIntoF(i32 %966, i32* %969)
  %971 = trunc i32 %970 to i8
  store i8 %971, i8* %4, align 1
  %972 = load %struct.DState*, %struct.DState** %3, align 8
  %973 = getelementptr inbounds %struct.DState, %struct.DState* %972, i32 0, i32 21
  %974 = load i16*, i16** %973, align 8
  %975 = load %struct.DState*, %struct.DState** %3, align 8
  %976 = getelementptr inbounds %struct.DState, %struct.DState* %975, i32 0, i32 14
  %977 = load i32, i32* %976, align 4
  %978 = zext i32 %977 to i64
  %979 = getelementptr inbounds i16, i16* %974, i64 %978
  %980 = load i16, i16* %979, align 2
  %981 = zext i16 %980 to i32
  %982 = load %struct.DState*, %struct.DState** %3, align 8
  %983 = getelementptr inbounds %struct.DState, %struct.DState* %982, i32 0, i32 22
  %984 = load i8*, i8** %983, align 8
  %985 = load %struct.DState*, %struct.DState** %3, align 8
  %986 = getelementptr inbounds %struct.DState, %struct.DState* %985, i32 0, i32 14
  %987 = load i32, i32* %986, align 4
  %988 = lshr i32 %987, 1
  %989 = zext i32 %988 to i64
  %990 = getelementptr inbounds i8, i8* %984, i64 %989
  %991 = load i8, i8* %990, align 1
  %992 = zext i8 %991 to i32
  %993 = load %struct.DState*, %struct.DState** %3, align 8
  %994 = getelementptr inbounds %struct.DState, %struct.DState* %993, i32 0, i32 14
  %995 = load i32, i32* %994, align 4
  %996 = shl i32 %995, 2
  %997 = and i32 %996, 4
  %998 = lshr i32 %992, %997
  %999 = and i32 %998, 15
  %1000 = shl i32 %999, 16
  %1001 = or i32 %981, %1000
  %1002 = load %struct.DState*, %struct.DState** %3, align 8
  %1003 = getelementptr inbounds %struct.DState, %struct.DState* %1002, i32 0, i32 14
  store i32 %1001, i32* %1003, align 4
  %1004 = load %struct.DState*, %struct.DState** %3, align 8
  %1005 = getelementptr inbounds %struct.DState, %struct.DState* %1004, i32 0, i32 17
  %1006 = load i32, i32* %1005, align 4
  %1007 = add nsw i32 %1006, 1
  store i32 %1007, i32* %1005, align 4
  %1008 = load i8, i8* %4, align 1
  %1009 = zext i8 %1008 to i32
  %1010 = add nsw i32 %1009, 4
  %1011 = load %struct.DState*, %struct.DState** %3, align 8
  %1012 = getelementptr inbounds %struct.DState, %struct.DState* %1011, i32 0, i32 3
  store i32 %1010, i32* %1012, align 8
  %1013 = load %struct.DState*, %struct.DState** %3, align 8
  %1014 = getelementptr inbounds %struct.DState, %struct.DState* %1013, i32 0, i32 14
  %1015 = load i32, i32* %1014, align 4
  %1016 = load %struct.DState*, %struct.DState** %3, align 8
  %1017 = getelementptr inbounds %struct.DState, %struct.DState* %1016, i32 0, i32 18
  %1018 = getelementptr inbounds [257 x i32], [257 x i32]* %1017, i32 0, i32 0
  %1019 = call i32 @BZ2_indexIntoF(i32 %1015, i32* %1018)
  %1020 = load %struct.DState*, %struct.DState** %3, align 8
  %1021 = getelementptr inbounds %struct.DState, %struct.DState* %1020, i32 0, i32 15
  store i32 %1019, i32* %1021, align 8
  %1022 = load %struct.DState*, %struct.DState** %3, align 8
  %1023 = getelementptr inbounds %struct.DState, %struct.DState* %1022, i32 0, i32 21
  %1024 = load i16*, i16** %1023, align 8
  %1025 = load %struct.DState*, %struct.DState** %3, align 8
  %1026 = getelementptr inbounds %struct.DState, %struct.DState* %1025, i32 0, i32 14
  %1027 = load i32, i32* %1026, align 4
  %1028 = zext i32 %1027 to i64
  %1029 = getelementptr inbounds i16, i16* %1024, i64 %1028
  %1030 = load i16, i16* %1029, align 2
  %1031 = zext i16 %1030 to i32
  %1032 = load %struct.DState*, %struct.DState** %3, align 8
  %1033 = getelementptr inbounds %struct.DState, %struct.DState* %1032, i32 0, i32 22
  %1034 = load i8*, i8** %1033, align 8
  %1035 = load %struct.DState*, %struct.DState** %3, align 8
  %1036 = getelementptr inbounds %struct.DState, %struct.DState* %1035, i32 0, i32 14
  %1037 = load i32, i32* %1036, align 4
  %1038 = lshr i32 %1037, 1
  %1039 = zext i32 %1038 to i64
  %1040 = getelementptr inbounds i8, i8* %1034, i64 %1039
  %1041 = load i8, i8* %1040, align 1
  %1042 = zext i8 %1041 to i32
  %1043 = load %struct.DState*, %struct.DState** %3, align 8
  %1044 = getelementptr inbounds %struct.DState, %struct.DState* %1043, i32 0, i32 14
  %1045 = load i32, i32* %1044, align 4
  %1046 = shl i32 %1045, 2
  %1047 = and i32 %1046, 4
  %1048 = lshr i32 %1042, %1047
  %1049 = and i32 %1048, 15
  %1050 = shl i32 %1049, 16
  %1051 = or i32 %1031, %1050
  %1052 = load %struct.DState*, %struct.DState** %3, align 8
  %1053 = getelementptr inbounds %struct.DState, %struct.DState* %1052, i32 0, i32 14
  store i32 %1051, i32* %1053, align 4
  %1054 = load %struct.DState*, %struct.DState** %3, align 8
  %1055 = getelementptr inbounds %struct.DState, %struct.DState* %1054, i32 0, i32 17
  %1056 = load i32, i32* %1055, align 4
  %1057 = add nsw i32 %1056, 1
  store i32 %1057, i32* %1055, align 4
  br label %642

; <label>:1058:                                   ; preds = %744, %733, %650, %112, %101, %18
  %1059 = load i8, i8* %2, align 1
  ret i8 %1059
}

; Function Attrs: nounwind uwtable
define internal zeroext i8 @unRLE_obuf_to_output_FAST(%struct.DState*) #0 {
  %2 = alloca i8, align 1
  %3 = alloca %struct.DState*, align 8
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i8, align 1
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store %struct.DState* %0, %struct.DState** %3, align 8
  %17 = load %struct.DState*, %struct.DState** %3, align 8
  %18 = getelementptr inbounds %struct.DState, %struct.DState* %17, i32 0, i32 4
  %19 = load i8, i8* %18, align 4
  %20 = icmp ne i8 %19, 0
  br i1 %20, label %21, label %555

; <label>:21:                                     ; preds = %1
  br label %22

; <label>:22:                                     ; preds = %534, %405, %396, %312, %303, %219, %210, %21
  br label %23

; <label>:23:                                     ; preds = %103, %22
  %24 = load %struct.DState*, %struct.DState** %3, align 8
  %25 = getelementptr inbounds %struct.DState, %struct.DState* %24, i32 0, i32 0
  %26 = load %struct.bz_stream*, %struct.bz_stream** %25, align 8
  %27 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %26, i32 0, i32 5
  %28 = load i32, i32* %27, align 8
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 4)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 4)
  store i8 0, i8* %2, align 1
  br label %839

; <label>:32:                                     ; preds = %23
  %33 = load %struct.DState*, %struct.DState** %3, align 8
  %34 = getelementptr inbounds %struct.DState, %struct.DState* %33, i32 0, i32 3
  %35 = load i32, i32* %34, align 8
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %38

; <label>:37:                                     ; preds = %32
  br label %104

; <label>:38:                                     ; preds = %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 0)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 0)
  %40 = load %struct.DState*, %struct.DState** %3, align 8
  %41 = getelementptr inbounds %struct.DState, %struct.DState* %40, i32 0, i32 2
  %42 = load i8, i8* %41, align 4
  %43 = load %struct.DState*, %struct.DState** %3, align 8
  %44 = getelementptr inbounds %struct.DState, %struct.DState* %43, i32 0, i32 0
  %45 = load %struct.bz_stream*, %struct.bz_stream** %44, align 8
  %46 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %45, i32 0, i32 4
  %47 = load i8*, i8** %46, align 8
  store i8 %42, i8* %47, align 1
  %48 = load %struct.DState*, %struct.DState** %3, align 8
  %49 = getelementptr inbounds %struct.DState, %struct.DState* %48, i32 0, i32 25
  %50 = load i32, i32* %49, align 8
  %51 = shl i32 %50, 8
  %52 = load %struct.DState*, %struct.DState** %3, align 8
  %53 = getelementptr inbounds %struct.DState, %struct.DState* %52, i32 0, i32 25
  %54 = load i32, i32* %53, align 8
  %55 = lshr i32 %54, 24
  %56 = load %struct.DState*, %struct.DState** %3, align 8
  %57 = getelementptr inbounds %struct.DState, %struct.DState* %56, i32 0, i32 2
  %58 = load i8, i8* %57, align 4
  %59 = zext i8 %58 to i32
  %60 = xor i32 %55, %59
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds [256 x i32], [256 x i32]* @BZ2_crc32Table, i64 0, i64 %61
  %63 = load i32, i32* %62, align 4
  %64 = xor i32 %51, %63
  %65 = load %struct.DState*, %struct.DState** %3, align 8
  %66 = getelementptr inbounds %struct.DState, %struct.DState* %65, i32 0, i32 25
  store i32 %64, i32* %66, align 8
  %67 = load %struct.DState*, %struct.DState** %3, align 8
  %68 = getelementptr inbounds %struct.DState, %struct.DState* %67, i32 0, i32 3
  %69 = load i32, i32* %68, align 8
  %70 = add nsw i32 %69, -1
  store i32 %70, i32* %68, align 8
  %71 = load %struct.DState*, %struct.DState** %3, align 8
  %72 = getelementptr inbounds %struct.DState, %struct.DState* %71, i32 0, i32 0
  %73 = load %struct.bz_stream*, %struct.bz_stream** %72, align 8
  %74 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %73, i32 0, i32 4
  %75 = load i8*, i8** %74, align 8
  %76 = getelementptr inbounds i8, i8* %75, i32 1
  store i8* %76, i8** %74, align 8
  %77 = load %struct.DState*, %struct.DState** %3, align 8
  %78 = getelementptr inbounds %struct.DState, %struct.DState* %77, i32 0, i32 0
  %79 = load %struct.bz_stream*, %struct.bz_stream** %78, align 8
  %80 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %79, i32 0, i32 5
  %81 = load i32, i32* %80, align 8
  %82 = add i32 %81, -1
  store i32 %82, i32* %80, align 8
  %83 = load %struct.DState*, %struct.DState** %3, align 8
  %84 = getelementptr inbounds %struct.DState, %struct.DState* %83, i32 0, i32 0
  %85 = load %struct.bz_stream*, %struct.bz_stream** %84, align 8
  %86 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %85, i32 0, i32 6
  %87 = load i32, i32* %86, align 4
  %88 = add i32 %87, 1
  store i32 %88, i32* %86, align 4
  %89 = load %struct.DState*, %struct.DState** %3, align 8
  %90 = getelementptr inbounds %struct.DState, %struct.DState* %89, i32 0, i32 0
  %91 = load %struct.bz_stream*, %struct.bz_stream** %90, align 8
  %92 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %91, i32 0, i32 6
  %93 = load i32, i32* %92, align 4
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %95, label %103

; <label>:95:                                     ; preds = %38
  %pgocount2 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 2)
  %96 = add i64 %pgocount2, 1
  store i64 %96, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 2)
  %97 = load %struct.DState*, %struct.DState** %3, align 8
  %98 = getelementptr inbounds %struct.DState, %struct.DState* %97, i32 0, i32 0
  %99 = load %struct.bz_stream*, %struct.bz_stream** %98, align 8
  %100 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %99, i32 0, i32 7
  %101 = load i32, i32* %100, align 8
  %102 = add i32 %101, 1
  store i32 %102, i32* %100, align 8
  br label %103

; <label>:103:                                    ; preds = %95, %38
  br label %23

; <label>:104:                                    ; preds = %37
  %105 = load %struct.DState*, %struct.DState** %3, align 8
  %106 = getelementptr inbounds %struct.DState, %struct.DState* %105, i32 0, i32 17
  %107 = load i32, i32* %106, align 4
  %108 = load %struct.DState*, %struct.DState** %3, align 8
  %109 = getelementptr inbounds %struct.DState, %struct.DState* %108, i32 0, i32 51
  %110 = load i32, i32* %109, align 8
  %111 = add nsw i32 %110, 1
  %112 = icmp eq i32 %107, %111
  br i1 %112, label %113, label %115

; <label>:113:                                    ; preds = %104
  %pgocount3 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 25)
  %114 = add i64 %pgocount3, 1
  store i64 %114, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 25)
  store i8 0, i8* %2, align 1
  br label %839

; <label>:115:                                    ; preds = %104
  %116 = load %struct.DState*, %struct.DState** %3, align 8
  %117 = getelementptr inbounds %struct.DState, %struct.DState* %116, i32 0, i32 17
  %118 = load i32, i32* %117, align 4
  %119 = load %struct.DState*, %struct.DState** %3, align 8
  %120 = getelementptr inbounds %struct.DState, %struct.DState* %119, i32 0, i32 51
  %121 = load i32, i32* %120, align 8
  %122 = add nsw i32 %121, 1
  %123 = icmp sgt i32 %118, %122
  br i1 %123, label %124, label %126

; <label>:124:                                    ; preds = %115
  %pgocount4 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 26)
  %125 = add i64 %pgocount4, 1
  store i64 %125, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 26)
  store i8 1, i8* %2, align 1
  br label %839

; <label>:126:                                    ; preds = %115
  %127 = load %struct.DState*, %struct.DState** %3, align 8
  %128 = getelementptr inbounds %struct.DState, %struct.DState* %127, i32 0, i32 3
  store i32 1, i32* %128, align 8
  %129 = load %struct.DState*, %struct.DState** %3, align 8
  %130 = getelementptr inbounds %struct.DState, %struct.DState* %129, i32 0, i32 15
  %131 = load i32, i32* %130, align 8
  %132 = trunc i32 %131 to i8
  %133 = load %struct.DState*, %struct.DState** %3, align 8
  %134 = getelementptr inbounds %struct.DState, %struct.DState* %133, i32 0, i32 2
  store i8 %132, i8* %134, align 4
  %135 = load %struct.DState*, %struct.DState** %3, align 8
  %136 = getelementptr inbounds %struct.DState, %struct.DState* %135, i32 0, i32 20
  %137 = load i32*, i32** %136, align 8
  %138 = load %struct.DState*, %struct.DState** %3, align 8
  %139 = getelementptr inbounds %struct.DState, %struct.DState* %138, i32 0, i32 14
  %140 = load i32, i32* %139, align 4
  %141 = zext i32 %140 to i64
  %142 = getelementptr inbounds i32, i32* %137, i64 %141
  %143 = load i32, i32* %142, align 4
  %144 = load %struct.DState*, %struct.DState** %3, align 8
  %145 = getelementptr inbounds %struct.DState, %struct.DState* %144, i32 0, i32 14
  store i32 %143, i32* %145, align 4
  %146 = load %struct.DState*, %struct.DState** %3, align 8
  %147 = getelementptr inbounds %struct.DState, %struct.DState* %146, i32 0, i32 14
  %148 = load i32, i32* %147, align 4
  %149 = and i32 %148, 255
  %150 = trunc i32 %149 to i8
  store i8 %150, i8* %4, align 1
  %151 = load %struct.DState*, %struct.DState** %3, align 8
  %152 = getelementptr inbounds %struct.DState, %struct.DState* %151, i32 0, i32 14
  %153 = load i32, i32* %152, align 4
  %154 = lshr i32 %153, 8
  store i32 %154, i32* %152, align 4
  %155 = load %struct.DState*, %struct.DState** %3, align 8
  %156 = getelementptr inbounds %struct.DState, %struct.DState* %155, i32 0, i32 5
  %157 = load i32, i32* %156, align 8
  %158 = icmp eq i32 %157, 0
  br i1 %158, label %159, label %182

; <label>:159:                                    ; preds = %126
  %pgocount5 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 9)
  %160 = add i64 %pgocount5, 1
  store i64 %160, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 9)
  %161 = load %struct.DState*, %struct.DState** %3, align 8
  %162 = getelementptr inbounds %struct.DState, %struct.DState* %161, i32 0, i32 6
  %163 = load i32, i32* %162, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %164
  %166 = load i32, i32* %165, align 4
  %167 = load %struct.DState*, %struct.DState** %3, align 8
  %168 = getelementptr inbounds %struct.DState, %struct.DState* %167, i32 0, i32 5
  store i32 %166, i32* %168, align 8
  %169 = load %struct.DState*, %struct.DState** %3, align 8
  %170 = getelementptr inbounds %struct.DState, %struct.DState* %169, i32 0, i32 6
  %171 = load i32, i32* %170, align 4
  %172 = add nsw i32 %171, 1
  store i32 %172, i32* %170, align 4
  %173 = load %struct.DState*, %struct.DState** %3, align 8
  %174 = getelementptr inbounds %struct.DState, %struct.DState* %173, i32 0, i32 6
  %175 = load i32, i32* %174, align 4
  %176 = icmp eq i32 %175, 512
  br i1 %176, label %177, label %181

; <label>:177:                                    ; preds = %159
  %pgocount6 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 13)
  %178 = add i64 %pgocount6, 1
  store i64 %178, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 13)
  %179 = load %struct.DState*, %struct.DState** %3, align 8
  %180 = getelementptr inbounds %struct.DState, %struct.DState* %179, i32 0, i32 6
  store i32 0, i32* %180, align 4
  br label %181

; <label>:181:                                    ; preds = %177, %159
  br label %182

; <label>:182:                                    ; preds = %181, %126
  %183 = load %struct.DState*, %struct.DState** %3, align 8
  %184 = getelementptr inbounds %struct.DState, %struct.DState* %183, i32 0, i32 5
  %185 = load i32, i32* %184, align 8
  %186 = add nsw i32 %185, -1
  store i32 %186, i32* %184, align 8
  %187 = load %struct.DState*, %struct.DState** %3, align 8
  %188 = getelementptr inbounds %struct.DState, %struct.DState* %187, i32 0, i32 5
  %189 = load i32, i32* %188, align 8
  %190 = icmp eq i32 %189, 1
  %191 = zext i1 %190 to i64
  %pgocount7 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 36)
  %192 = add i64 %pgocount7, %191
  store i64 %192, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 36)
  %193 = select i1 %190, i32 1, i32 0
  %194 = load i8, i8* %4, align 1
  %195 = zext i8 %194 to i32
  %196 = xor i32 %195, %193
  %197 = trunc i32 %196 to i8
  store i8 %197, i8* %4, align 1
  %198 = load %struct.DState*, %struct.DState** %3, align 8
  %199 = getelementptr inbounds %struct.DState, %struct.DState* %198, i32 0, i32 17
  %200 = load i32, i32* %199, align 4
  %201 = add nsw i32 %200, 1
  store i32 %201, i32* %199, align 4
  %202 = load %struct.DState*, %struct.DState** %3, align 8
  %203 = getelementptr inbounds %struct.DState, %struct.DState* %202, i32 0, i32 17
  %204 = load i32, i32* %203, align 4
  %205 = load %struct.DState*, %struct.DState** %3, align 8
  %206 = getelementptr inbounds %struct.DState, %struct.DState* %205, i32 0, i32 51
  %207 = load i32, i32* %206, align 8
  %208 = add nsw i32 %207, 1
  %209 = icmp eq i32 %204, %208
  br i1 %209, label %210, label %212

; <label>:210:                                    ; preds = %182
  %pgocount8 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 6)
  %211 = add i64 %pgocount8, 1
  store i64 %211, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 6)
  br label %22

; <label>:212:                                    ; preds = %182
  %213 = load i8, i8* %4, align 1
  %214 = zext i8 %213 to i32
  %215 = load %struct.DState*, %struct.DState** %3, align 8
  %216 = getelementptr inbounds %struct.DState, %struct.DState* %215, i32 0, i32 15
  %217 = load i32, i32* %216, align 8
  %218 = icmp ne i32 %214, %217
  br i1 %218, label %219, label %225

; <label>:219:                                    ; preds = %212
  %pgocount9 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 12)
  %220 = add i64 %pgocount9, 1
  store i64 %220, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 12)
  %221 = load i8, i8* %4, align 1
  %222 = zext i8 %221 to i32
  %223 = load %struct.DState*, %struct.DState** %3, align 8
  %224 = getelementptr inbounds %struct.DState, %struct.DState* %223, i32 0, i32 15
  store i32 %222, i32* %224, align 8
  br label %22

; <label>:225:                                    ; preds = %212
  %226 = load %struct.DState*, %struct.DState** %3, align 8
  %227 = getelementptr inbounds %struct.DState, %struct.DState* %226, i32 0, i32 3
  store i32 2, i32* %227, align 8
  %228 = load %struct.DState*, %struct.DState** %3, align 8
  %229 = getelementptr inbounds %struct.DState, %struct.DState* %228, i32 0, i32 20
  %230 = load i32*, i32** %229, align 8
  %231 = load %struct.DState*, %struct.DState** %3, align 8
  %232 = getelementptr inbounds %struct.DState, %struct.DState* %231, i32 0, i32 14
  %233 = load i32, i32* %232, align 4
  %234 = zext i32 %233 to i64
  %235 = getelementptr inbounds i32, i32* %230, i64 %234
  %236 = load i32, i32* %235, align 4
  %237 = load %struct.DState*, %struct.DState** %3, align 8
  %238 = getelementptr inbounds %struct.DState, %struct.DState* %237, i32 0, i32 14
  store i32 %236, i32* %238, align 4
  %239 = load %struct.DState*, %struct.DState** %3, align 8
  %240 = getelementptr inbounds %struct.DState, %struct.DState* %239, i32 0, i32 14
  %241 = load i32, i32* %240, align 4
  %242 = and i32 %241, 255
  %243 = trunc i32 %242 to i8
  store i8 %243, i8* %4, align 1
  %244 = load %struct.DState*, %struct.DState** %3, align 8
  %245 = getelementptr inbounds %struct.DState, %struct.DState* %244, i32 0, i32 14
  %246 = load i32, i32* %245, align 4
  %247 = lshr i32 %246, 8
  store i32 %247, i32* %245, align 4
  %248 = load %struct.DState*, %struct.DState** %3, align 8
  %249 = getelementptr inbounds %struct.DState, %struct.DState* %248, i32 0, i32 5
  %250 = load i32, i32* %249, align 8
  %251 = icmp eq i32 %250, 0
  br i1 %251, label %252, label %275

; <label>:252:                                    ; preds = %225
  %pgocount10 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 16)
  %253 = add i64 %pgocount10, 1
  store i64 %253, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 16)
  %254 = load %struct.DState*, %struct.DState** %3, align 8
  %255 = getelementptr inbounds %struct.DState, %struct.DState* %254, i32 0, i32 6
  %256 = load i32, i32* %255, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %257
  %259 = load i32, i32* %258, align 4
  %260 = load %struct.DState*, %struct.DState** %3, align 8
  %261 = getelementptr inbounds %struct.DState, %struct.DState* %260, i32 0, i32 5
  store i32 %259, i32* %261, align 8
  %262 = load %struct.DState*, %struct.DState** %3, align 8
  %263 = getelementptr inbounds %struct.DState, %struct.DState* %262, i32 0, i32 6
  %264 = load i32, i32* %263, align 4
  %265 = add nsw i32 %264, 1
  store i32 %265, i32* %263, align 4
  %266 = load %struct.DState*, %struct.DState** %3, align 8
  %267 = getelementptr inbounds %struct.DState, %struct.DState* %266, i32 0, i32 6
  %268 = load i32, i32* %267, align 4
  %269 = icmp eq i32 %268, 512
  br i1 %269, label %270, label %274

; <label>:270:                                    ; preds = %252
  %pgocount11 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 22)
  %271 = add i64 %pgocount11, 1
  store i64 %271, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 22)
  %272 = load %struct.DState*, %struct.DState** %3, align 8
  %273 = getelementptr inbounds %struct.DState, %struct.DState* %272, i32 0, i32 6
  store i32 0, i32* %273, align 4
  br label %274

; <label>:274:                                    ; preds = %270, %252
  br label %275

; <label>:275:                                    ; preds = %274, %225
  %276 = load %struct.DState*, %struct.DState** %3, align 8
  %277 = getelementptr inbounds %struct.DState, %struct.DState* %276, i32 0, i32 5
  %278 = load i32, i32* %277, align 8
  %279 = add nsw i32 %278, -1
  store i32 %279, i32* %277, align 8
  %280 = load %struct.DState*, %struct.DState** %3, align 8
  %281 = getelementptr inbounds %struct.DState, %struct.DState* %280, i32 0, i32 5
  %282 = load i32, i32* %281, align 8
  %283 = icmp eq i32 %282, 1
  %284 = zext i1 %283 to i64
  %pgocount12 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 37)
  %285 = add i64 %pgocount12, %284
  store i64 %285, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 37)
  %286 = select i1 %283, i32 1, i32 0
  %287 = load i8, i8* %4, align 1
  %288 = zext i8 %287 to i32
  %289 = xor i32 %288, %286
  %290 = trunc i32 %289 to i8
  store i8 %290, i8* %4, align 1
  %291 = load %struct.DState*, %struct.DState** %3, align 8
  %292 = getelementptr inbounds %struct.DState, %struct.DState* %291, i32 0, i32 17
  %293 = load i32, i32* %292, align 4
  %294 = add nsw i32 %293, 1
  store i32 %294, i32* %292, align 4
  %295 = load %struct.DState*, %struct.DState** %3, align 8
  %296 = getelementptr inbounds %struct.DState, %struct.DState* %295, i32 0, i32 17
  %297 = load i32, i32* %296, align 4
  %298 = load %struct.DState*, %struct.DState** %3, align 8
  %299 = getelementptr inbounds %struct.DState, %struct.DState* %298, i32 0, i32 51
  %300 = load i32, i32* %299, align 8
  %301 = add nsw i32 %300, 1
  %302 = icmp eq i32 %297, %301
  br i1 %302, label %303, label %305

; <label>:303:                                    ; preds = %275
  %pgocount13 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 15)
  %304 = add i64 %pgocount13, 1
  store i64 %304, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 15)
  br label %22

; <label>:305:                                    ; preds = %275
  %306 = load i8, i8* %4, align 1
  %307 = zext i8 %306 to i32
  %308 = load %struct.DState*, %struct.DState** %3, align 8
  %309 = getelementptr inbounds %struct.DState, %struct.DState* %308, i32 0, i32 15
  %310 = load i32, i32* %309, align 8
  %311 = icmp ne i32 %307, %310
  br i1 %311, label %312, label %318

; <label>:312:                                    ; preds = %305
  %pgocount14 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 21)
  %313 = add i64 %pgocount14, 1
  store i64 %313, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 21)
  %314 = load i8, i8* %4, align 1
  %315 = zext i8 %314 to i32
  %316 = load %struct.DState*, %struct.DState** %3, align 8
  %317 = getelementptr inbounds %struct.DState, %struct.DState* %316, i32 0, i32 15
  store i32 %315, i32* %317, align 8
  br label %22

; <label>:318:                                    ; preds = %305
  %319 = load %struct.DState*, %struct.DState** %3, align 8
  %320 = getelementptr inbounds %struct.DState, %struct.DState* %319, i32 0, i32 3
  store i32 3, i32* %320, align 8
  %321 = load %struct.DState*, %struct.DState** %3, align 8
  %322 = getelementptr inbounds %struct.DState, %struct.DState* %321, i32 0, i32 20
  %323 = load i32*, i32** %322, align 8
  %324 = load %struct.DState*, %struct.DState** %3, align 8
  %325 = getelementptr inbounds %struct.DState, %struct.DState* %324, i32 0, i32 14
  %326 = load i32, i32* %325, align 4
  %327 = zext i32 %326 to i64
  %328 = getelementptr inbounds i32, i32* %323, i64 %327
  %329 = load i32, i32* %328, align 4
  %330 = load %struct.DState*, %struct.DState** %3, align 8
  %331 = getelementptr inbounds %struct.DState, %struct.DState* %330, i32 0, i32 14
  store i32 %329, i32* %331, align 4
  %332 = load %struct.DState*, %struct.DState** %3, align 8
  %333 = getelementptr inbounds %struct.DState, %struct.DState* %332, i32 0, i32 14
  %334 = load i32, i32* %333, align 4
  %335 = and i32 %334, 255
  %336 = trunc i32 %335 to i8
  store i8 %336, i8* %4, align 1
  %337 = load %struct.DState*, %struct.DState** %3, align 8
  %338 = getelementptr inbounds %struct.DState, %struct.DState* %337, i32 0, i32 14
  %339 = load i32, i32* %338, align 4
  %340 = lshr i32 %339, 8
  store i32 %340, i32* %338, align 4
  %341 = load %struct.DState*, %struct.DState** %3, align 8
  %342 = getelementptr inbounds %struct.DState, %struct.DState* %341, i32 0, i32 5
  %343 = load i32, i32* %342, align 8
  %344 = icmp eq i32 %343, 0
  br i1 %344, label %345, label %368

; <label>:345:                                    ; preds = %318
  %pgocount15 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 28)
  %346 = add i64 %pgocount15, 1
  store i64 %346, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 28)
  %347 = load %struct.DState*, %struct.DState** %3, align 8
  %348 = getelementptr inbounds %struct.DState, %struct.DState* %347, i32 0, i32 6
  %349 = load i32, i32* %348, align 4
  %350 = sext i32 %349 to i64
  %351 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %350
  %352 = load i32, i32* %351, align 4
  %353 = load %struct.DState*, %struct.DState** %3, align 8
  %354 = getelementptr inbounds %struct.DState, %struct.DState* %353, i32 0, i32 5
  store i32 %352, i32* %354, align 8
  %355 = load %struct.DState*, %struct.DState** %3, align 8
  %356 = getelementptr inbounds %struct.DState, %struct.DState* %355, i32 0, i32 6
  %357 = load i32, i32* %356, align 4
  %358 = add nsw i32 %357, 1
  store i32 %358, i32* %356, align 4
  %359 = load %struct.DState*, %struct.DState** %3, align 8
  %360 = getelementptr inbounds %struct.DState, %struct.DState* %359, i32 0, i32 6
  %361 = load i32, i32* %360, align 4
  %362 = icmp eq i32 %361, 512
  br i1 %362, label %363, label %367

; <label>:363:                                    ; preds = %345
  %pgocount16 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 31)
  %364 = add i64 %pgocount16, 1
  store i64 %364, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 31)
  %365 = load %struct.DState*, %struct.DState** %3, align 8
  %366 = getelementptr inbounds %struct.DState, %struct.DState* %365, i32 0, i32 6
  store i32 0, i32* %366, align 4
  br label %367

; <label>:367:                                    ; preds = %363, %345
  br label %368

; <label>:368:                                    ; preds = %367, %318
  %369 = load %struct.DState*, %struct.DState** %3, align 8
  %370 = getelementptr inbounds %struct.DState, %struct.DState* %369, i32 0, i32 5
  %371 = load i32, i32* %370, align 8
  %372 = add nsw i32 %371, -1
  store i32 %372, i32* %370, align 8
  %373 = load %struct.DState*, %struct.DState** %3, align 8
  %374 = getelementptr inbounds %struct.DState, %struct.DState* %373, i32 0, i32 5
  %375 = load i32, i32* %374, align 8
  %376 = icmp eq i32 %375, 1
  %377 = zext i1 %376 to i64
  %pgocount17 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 38)
  %378 = add i64 %pgocount17, %377
  store i64 %378, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 38)
  %379 = select i1 %376, i32 1, i32 0
  %380 = load i8, i8* %4, align 1
  %381 = zext i8 %380 to i32
  %382 = xor i32 %381, %379
  %383 = trunc i32 %382 to i8
  store i8 %383, i8* %4, align 1
  %384 = load %struct.DState*, %struct.DState** %3, align 8
  %385 = getelementptr inbounds %struct.DState, %struct.DState* %384, i32 0, i32 17
  %386 = load i32, i32* %385, align 4
  %387 = add nsw i32 %386, 1
  store i32 %387, i32* %385, align 4
  %388 = load %struct.DState*, %struct.DState** %3, align 8
  %389 = getelementptr inbounds %struct.DState, %struct.DState* %388, i32 0, i32 17
  %390 = load i32, i32* %389, align 4
  %391 = load %struct.DState*, %struct.DState** %3, align 8
  %392 = getelementptr inbounds %struct.DState, %struct.DState* %391, i32 0, i32 51
  %393 = load i32, i32* %392, align 8
  %394 = add nsw i32 %393, 1
  %395 = icmp eq i32 %390, %394
  br i1 %395, label %396, label %398

; <label>:396:                                    ; preds = %368
  %pgocount18 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 27)
  %397 = add i64 %pgocount18, 1
  store i64 %397, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 27)
  br label %22

; <label>:398:                                    ; preds = %368
  %399 = load i8, i8* %4, align 1
  %400 = zext i8 %399 to i32
  %401 = load %struct.DState*, %struct.DState** %3, align 8
  %402 = getelementptr inbounds %struct.DState, %struct.DState* %401, i32 0, i32 15
  %403 = load i32, i32* %402, align 8
  %404 = icmp ne i32 %400, %403
  br i1 %404, label %405, label %411

; <label>:405:                                    ; preds = %398
  %pgocount19 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 29)
  %406 = add i64 %pgocount19, 1
  store i64 %406, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 29)
  %407 = load i8, i8* %4, align 1
  %408 = zext i8 %407 to i32
  %409 = load %struct.DState*, %struct.DState** %3, align 8
  %410 = getelementptr inbounds %struct.DState, %struct.DState* %409, i32 0, i32 15
  store i32 %408, i32* %410, align 8
  br label %22

; <label>:411:                                    ; preds = %398
  %412 = load %struct.DState*, %struct.DState** %3, align 8
  %413 = getelementptr inbounds %struct.DState, %struct.DState* %412, i32 0, i32 20
  %414 = load i32*, i32** %413, align 8
  %415 = load %struct.DState*, %struct.DState** %3, align 8
  %416 = getelementptr inbounds %struct.DState, %struct.DState* %415, i32 0, i32 14
  %417 = load i32, i32* %416, align 4
  %418 = zext i32 %417 to i64
  %419 = getelementptr inbounds i32, i32* %414, i64 %418
  %420 = load i32, i32* %419, align 4
  %421 = load %struct.DState*, %struct.DState** %3, align 8
  %422 = getelementptr inbounds %struct.DState, %struct.DState* %421, i32 0, i32 14
  store i32 %420, i32* %422, align 4
  %423 = load %struct.DState*, %struct.DState** %3, align 8
  %424 = getelementptr inbounds %struct.DState, %struct.DState* %423, i32 0, i32 14
  %425 = load i32, i32* %424, align 4
  %426 = and i32 %425, 255
  %427 = trunc i32 %426 to i8
  store i8 %427, i8* %4, align 1
  %428 = load %struct.DState*, %struct.DState** %3, align 8
  %429 = getelementptr inbounds %struct.DState, %struct.DState* %428, i32 0, i32 14
  %430 = load i32, i32* %429, align 4
  %431 = lshr i32 %430, 8
  store i32 %431, i32* %429, align 4
  %432 = load %struct.DState*, %struct.DState** %3, align 8
  %433 = getelementptr inbounds %struct.DState, %struct.DState* %432, i32 0, i32 5
  %434 = load i32, i32* %433, align 8
  %435 = icmp eq i32 %434, 0
  br i1 %435, label %436, label %459

; <label>:436:                                    ; preds = %411
  %pgocount20 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 32)
  %437 = add i64 %pgocount20, 1
  store i64 %437, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 32)
  %438 = load %struct.DState*, %struct.DState** %3, align 8
  %439 = getelementptr inbounds %struct.DState, %struct.DState* %438, i32 0, i32 6
  %440 = load i32, i32* %439, align 4
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %441
  %443 = load i32, i32* %442, align 4
  %444 = load %struct.DState*, %struct.DState** %3, align 8
  %445 = getelementptr inbounds %struct.DState, %struct.DState* %444, i32 0, i32 5
  store i32 %443, i32* %445, align 8
  %446 = load %struct.DState*, %struct.DState** %3, align 8
  %447 = getelementptr inbounds %struct.DState, %struct.DState* %446, i32 0, i32 6
  %448 = load i32, i32* %447, align 4
  %449 = add nsw i32 %448, 1
  store i32 %449, i32* %447, align 4
  %450 = load %struct.DState*, %struct.DState** %3, align 8
  %451 = getelementptr inbounds %struct.DState, %struct.DState* %450, i32 0, i32 6
  %452 = load i32, i32* %451, align 4
  %453 = icmp eq i32 %452, 512
  br i1 %453, label %454, label %458

; <label>:454:                                    ; preds = %436
  %pgocount21 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 34)
  %455 = add i64 %pgocount21, 1
  store i64 %455, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 34)
  %456 = load %struct.DState*, %struct.DState** %3, align 8
  %457 = getelementptr inbounds %struct.DState, %struct.DState* %456, i32 0, i32 6
  store i32 0, i32* %457, align 4
  br label %458

; <label>:458:                                    ; preds = %454, %436
  br label %459

; <label>:459:                                    ; preds = %458, %411
  %460 = load %struct.DState*, %struct.DState** %3, align 8
  %461 = getelementptr inbounds %struct.DState, %struct.DState* %460, i32 0, i32 5
  %462 = load i32, i32* %461, align 8
  %463 = add nsw i32 %462, -1
  store i32 %463, i32* %461, align 8
  %464 = load %struct.DState*, %struct.DState** %3, align 8
  %465 = getelementptr inbounds %struct.DState, %struct.DState* %464, i32 0, i32 5
  %466 = load i32, i32* %465, align 8
  %467 = icmp eq i32 %466, 1
  %468 = zext i1 %467 to i64
  %pgocount22 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 39)
  %469 = add i64 %pgocount22, %468
  store i64 %469, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 39)
  %470 = select i1 %467, i32 1, i32 0
  %471 = load i8, i8* %4, align 1
  %472 = zext i8 %471 to i32
  %473 = xor i32 %472, %470
  %474 = trunc i32 %473 to i8
  store i8 %474, i8* %4, align 1
  %475 = load %struct.DState*, %struct.DState** %3, align 8
  %476 = getelementptr inbounds %struct.DState, %struct.DState* %475, i32 0, i32 17
  %477 = load i32, i32* %476, align 4
  %478 = add nsw i32 %477, 1
  store i32 %478, i32* %476, align 4
  %479 = load i8, i8* %4, align 1
  %480 = zext i8 %479 to i32
  %481 = add nsw i32 %480, 4
  %482 = load %struct.DState*, %struct.DState** %3, align 8
  %483 = getelementptr inbounds %struct.DState, %struct.DState* %482, i32 0, i32 3
  store i32 %481, i32* %483, align 8
  %484 = load %struct.DState*, %struct.DState** %3, align 8
  %485 = getelementptr inbounds %struct.DState, %struct.DState* %484, i32 0, i32 20
  %486 = load i32*, i32** %485, align 8
  %487 = load %struct.DState*, %struct.DState** %3, align 8
  %488 = getelementptr inbounds %struct.DState, %struct.DState* %487, i32 0, i32 14
  %489 = load i32, i32* %488, align 4
  %490 = zext i32 %489 to i64
  %491 = getelementptr inbounds i32, i32* %486, i64 %490
  %492 = load i32, i32* %491, align 4
  %493 = load %struct.DState*, %struct.DState** %3, align 8
  %494 = getelementptr inbounds %struct.DState, %struct.DState* %493, i32 0, i32 14
  store i32 %492, i32* %494, align 4
  %495 = load %struct.DState*, %struct.DState** %3, align 8
  %496 = getelementptr inbounds %struct.DState, %struct.DState* %495, i32 0, i32 14
  %497 = load i32, i32* %496, align 4
  %498 = and i32 %497, 255
  %499 = trunc i32 %498 to i8
  %500 = zext i8 %499 to i32
  %501 = load %struct.DState*, %struct.DState** %3, align 8
  %502 = getelementptr inbounds %struct.DState, %struct.DState* %501, i32 0, i32 15
  store i32 %500, i32* %502, align 8
  %503 = load %struct.DState*, %struct.DState** %3, align 8
  %504 = getelementptr inbounds %struct.DState, %struct.DState* %503, i32 0, i32 14
  %505 = load i32, i32* %504, align 4
  %506 = lshr i32 %505, 8
  store i32 %506, i32* %504, align 4
  %507 = load %struct.DState*, %struct.DState** %3, align 8
  %508 = getelementptr inbounds %struct.DState, %struct.DState* %507, i32 0, i32 5
  %509 = load i32, i32* %508, align 8
  %510 = icmp eq i32 %509, 0
  br i1 %510, label %511, label %534

; <label>:511:                                    ; preds = %459
  %pgocount23 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 33)
  %512 = add i64 %pgocount23, 1
  store i64 %512, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 33)
  %513 = load %struct.DState*, %struct.DState** %3, align 8
  %514 = getelementptr inbounds %struct.DState, %struct.DState* %513, i32 0, i32 6
  %515 = load i32, i32* %514, align 4
  %516 = sext i32 %515 to i64
  %517 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %516
  %518 = load i32, i32* %517, align 4
  %519 = load %struct.DState*, %struct.DState** %3, align 8
  %520 = getelementptr inbounds %struct.DState, %struct.DState* %519, i32 0, i32 5
  store i32 %518, i32* %520, align 8
  %521 = load %struct.DState*, %struct.DState** %3, align 8
  %522 = getelementptr inbounds %struct.DState, %struct.DState* %521, i32 0, i32 6
  %523 = load i32, i32* %522, align 4
  %524 = add nsw i32 %523, 1
  store i32 %524, i32* %522, align 4
  %525 = load %struct.DState*, %struct.DState** %3, align 8
  %526 = getelementptr inbounds %struct.DState, %struct.DState* %525, i32 0, i32 6
  %527 = load i32, i32* %526, align 4
  %528 = icmp eq i32 %527, 512
  br i1 %528, label %529, label %533

; <label>:529:                                    ; preds = %511
  %pgocount24 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 35)
  %530 = add i64 %pgocount24, 1
  store i64 %530, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 35)
  %531 = load %struct.DState*, %struct.DState** %3, align 8
  %532 = getelementptr inbounds %struct.DState, %struct.DState* %531, i32 0, i32 6
  store i32 0, i32* %532, align 4
  br label %533

; <label>:533:                                    ; preds = %529, %511
  br label %534

; <label>:534:                                    ; preds = %533, %459
  %pgocount25 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 30)
  %535 = add i64 %pgocount25, 1
  store i64 %535, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 30)
  %536 = load %struct.DState*, %struct.DState** %3, align 8
  %537 = getelementptr inbounds %struct.DState, %struct.DState* %536, i32 0, i32 5
  %538 = load i32, i32* %537, align 8
  %539 = add nsw i32 %538, -1
  store i32 %539, i32* %537, align 8
  %540 = load %struct.DState*, %struct.DState** %3, align 8
  %541 = getelementptr inbounds %struct.DState, %struct.DState* %540, i32 0, i32 5
  %542 = load i32, i32* %541, align 8
  %543 = icmp eq i32 %542, 1
  %544 = zext i1 %543 to i64
  %pgocount26 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 40)
  %545 = add i64 %pgocount26, %544
  store i64 %545, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 40)
  %546 = select i1 %543, i32 1, i32 0
  %547 = load %struct.DState*, %struct.DState** %3, align 8
  %548 = getelementptr inbounds %struct.DState, %struct.DState* %547, i32 0, i32 15
  %549 = load i32, i32* %548, align 8
  %550 = xor i32 %549, %546
  store i32 %550, i32* %548, align 8
  %551 = load %struct.DState*, %struct.DState** %3, align 8
  %552 = getelementptr inbounds %struct.DState, %struct.DState* %551, i32 0, i32 17
  %553 = load i32, i32* %552, align 4
  %554 = add nsw i32 %553, 1
  store i32 %554, i32* %552, align 4
  br label %22

; <label>:555:                                    ; preds = %1
  %556 = load %struct.DState*, %struct.DState** %3, align 8
  %557 = getelementptr inbounds %struct.DState, %struct.DState* %556, i32 0, i32 25
  %558 = load i32, i32* %557, align 8
  store i32 %558, i32* %5, align 4
  %559 = load %struct.DState*, %struct.DState** %3, align 8
  %560 = getelementptr inbounds %struct.DState, %struct.DState* %559, i32 0, i32 2
  %561 = load i8, i8* %560, align 4
  store i8 %561, i8* %6, align 1
  %562 = load %struct.DState*, %struct.DState** %3, align 8
  %563 = getelementptr inbounds %struct.DState, %struct.DState* %562, i32 0, i32 3
  %564 = load i32, i32* %563, align 8
  store i32 %564, i32* %7, align 4
  %565 = load %struct.DState*, %struct.DState** %3, align 8
  %566 = getelementptr inbounds %struct.DState, %struct.DState* %565, i32 0, i32 17
  %567 = load i32, i32* %566, align 4
  store i32 %567, i32* %8, align 4
  %568 = load %struct.DState*, %struct.DState** %3, align 8
  %569 = getelementptr inbounds %struct.DState, %struct.DState* %568, i32 0, i32 15
  %570 = load i32, i32* %569, align 8
  store i32 %570, i32* %9, align 4
  %571 = load %struct.DState*, %struct.DState** %3, align 8
  %572 = getelementptr inbounds %struct.DState, %struct.DState* %571, i32 0, i32 20
  %573 = load i32*, i32** %572, align 8
  store i32* %573, i32** %10, align 8
  %574 = load %struct.DState*, %struct.DState** %3, align 8
  %575 = getelementptr inbounds %struct.DState, %struct.DState* %574, i32 0, i32 14
  %576 = load i32, i32* %575, align 4
  store i32 %576, i32* %11, align 4
  %577 = load %struct.DState*, %struct.DState** %3, align 8
  %578 = getelementptr inbounds %struct.DState, %struct.DState* %577, i32 0, i32 0
  %579 = load %struct.bz_stream*, %struct.bz_stream** %578, align 8
  %580 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %579, i32 0, i32 4
  %581 = load i8*, i8** %580, align 8
  store i8* %581, i8** %12, align 8
  %582 = load %struct.DState*, %struct.DState** %3, align 8
  %583 = getelementptr inbounds %struct.DState, %struct.DState* %582, i32 0, i32 0
  %584 = load %struct.bz_stream*, %struct.bz_stream** %583, align 8
  %585 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %584, i32 0, i32 5
  %586 = load i32, i32* %585, align 8
  store i32 %586, i32* %13, align 4
  %587 = load i32, i32* %13, align 4
  store i32 %587, i32* %14, align 4
  %588 = load %struct.DState*, %struct.DState** %3, align 8
  %589 = getelementptr inbounds %struct.DState, %struct.DState* %588, i32 0, i32 51
  %590 = load i32, i32* %589, align 8
  %591 = add nsw i32 %590, 1
  store i32 %591, i32* %15, align 4
  br label %592

; <label>:592:                                    ; preds = %746, %742, %735, %715, %708, %555
  %593 = load i32, i32* %7, align 4
  %594 = icmp sgt i32 %593, 0
  br i1 %594, label %595, label %651

; <label>:595:                                    ; preds = %592
  br label %596

; <label>:596:                                    ; preds = %605, %595
  %597 = load i32, i32* %13, align 4
  %598 = icmp eq i32 %597, 0
  br i1 %598, label %599, label %601

; <label>:599:                                    ; preds = %596
  %pgocount27 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 7)
  %600 = add i64 %pgocount27, 1
  store i64 %600, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 7)
  br label %776

; <label>:601:                                    ; preds = %596
  %602 = load i32, i32* %7, align 4
  %603 = icmp eq i32 %602, 1
  br i1 %603, label %604, label %605

; <label>:604:                                    ; preds = %601
  br label %626

; <label>:605:                                    ; preds = %601
  %pgocount28 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 1)
  %606 = add i64 %pgocount28, 1
  store i64 %606, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 1)
  %607 = load i8, i8* %6, align 1
  %608 = load i8*, i8** %12, align 8
  store i8 %607, i8* %608, align 1
  %609 = load i32, i32* %5, align 4
  %610 = shl i32 %609, 8
  %611 = load i32, i32* %5, align 4
  %612 = lshr i32 %611, 24
  %613 = load i8, i8* %6, align 1
  %614 = zext i8 %613 to i32
  %615 = xor i32 %612, %614
  %616 = zext i32 %615 to i64
  %617 = getelementptr inbounds [256 x i32], [256 x i32]* @BZ2_crc32Table, i64 0, i64 %616
  %618 = load i32, i32* %617, align 4
  %619 = xor i32 %610, %618
  store i32 %619, i32* %5, align 4
  %620 = load i32, i32* %7, align 4
  %621 = add nsw i32 %620, -1
  store i32 %621, i32* %7, align 4
  %622 = load i8*, i8** %12, align 8
  %623 = getelementptr inbounds i8, i8* %622, i32 1
  store i8* %623, i8** %12, align 8
  %624 = load i32, i32* %13, align 4
  %625 = add i32 %624, -1
  store i32 %625, i32* %13, align 4
  br label %596

; <label>:626:                                    ; preds = %604
  %pgocount29 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 8)
  %627 = add i64 %pgocount29, 1
  store i64 %627, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 8)
  br label %628

; <label>:628:                                    ; preds = %690, %682, %626
  %629 = load i32, i32* %13, align 4
  %630 = icmp eq i32 %629, 0
  br i1 %630, label %631, label %633

; <label>:631:                                    ; preds = %628
  %pgocount30 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 20)
  %632 = add i64 %pgocount30, 1
  store i64 %632, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 20)
  store i32 1, i32* %7, align 4
  br label %776

; <label>:633:                                    ; preds = %628
  %634 = load i8, i8* %6, align 1
  %635 = load i8*, i8** %12, align 8
  store i8 %634, i8* %635, align 1
  %636 = load i32, i32* %5, align 4
  %637 = shl i32 %636, 8
  %638 = load i32, i32* %5, align 4
  %639 = lshr i32 %638, 24
  %640 = load i8, i8* %6, align 1
  %641 = zext i8 %640 to i32
  %642 = xor i32 %639, %641
  %643 = zext i32 %642 to i64
  %644 = getelementptr inbounds [256 x i32], [256 x i32]* @BZ2_crc32Table, i64 0, i64 %643
  %645 = load i32, i32* %644, align 4
  %646 = xor i32 %637, %645
  store i32 %646, i32* %5, align 4
  %647 = load i8*, i8** %12, align 8
  %648 = getelementptr inbounds i8, i8* %647, i32 1
  store i8* %648, i8** %12, align 8
  %649 = load i32, i32* %13, align 4
  %650 = add i32 %649, -1
  store i32 %650, i32* %13, align 4
  br label %651

; <label>:651:                                    ; preds = %633, %592
  %652 = load i32, i32* %8, align 4
  %653 = load i32, i32* %15, align 4
  %654 = icmp sgt i32 %652, %653
  br i1 %654, label %655, label %657

; <label>:655:                                    ; preds = %651
  %pgocount31 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 17)
  %656 = add i64 %pgocount31, 1
  store i64 %656, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 17)
  store i8 1, i8* %2, align 1
  br label %839

; <label>:657:                                    ; preds = %651
  %658 = load i32, i32* %8, align 4
  %659 = load i32, i32* %15, align 4
  %660 = icmp eq i32 %658, %659
  br i1 %660, label %661, label %663

; <label>:661:                                    ; preds = %657
  %pgocount32 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 18)
  %662 = add i64 %pgocount32, 1
  store i64 %662, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 18)
  store i32 0, i32* %7, align 4
  br label %776

; <label>:663:                                    ; preds = %657
  %664 = load i32, i32* %9, align 4
  %665 = trunc i32 %664 to i8
  store i8 %665, i8* %6, align 1
  %666 = load i32*, i32** %10, align 8
  %667 = load i32, i32* %11, align 4
  %668 = zext i32 %667 to i64
  %669 = getelementptr inbounds i32, i32* %666, i64 %668
  %670 = load i32, i32* %669, align 4
  store i32 %670, i32* %11, align 4
  %671 = load i32, i32* %11, align 4
  %672 = and i32 %671, 255
  %673 = trunc i32 %672 to i8
  store i8 %673, i8* %4, align 1
  %674 = load i32, i32* %11, align 4
  %675 = lshr i32 %674, 8
  store i32 %675, i32* %11, align 4
  %676 = load i32, i32* %8, align 4
  %677 = add nsw i32 %676, 1
  store i32 %677, i32* %8, align 4
  %678 = load i8, i8* %4, align 1
  %679 = zext i8 %678 to i32
  %680 = load i32, i32* %9, align 4
  %681 = icmp ne i32 %679, %680
  br i1 %681, label %682, label %686

; <label>:682:                                    ; preds = %663
  %pgocount33 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 3)
  %683 = add i64 %pgocount33, 1
  store i64 %683, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 3)
  %684 = load i8, i8* %4, align 1
  %685 = zext i8 %684 to i32
  store i32 %685, i32* %9, align 4
  br label %628

; <label>:686:                                    ; preds = %663
  %687 = load i32, i32* %8, align 4
  %688 = load i32, i32* %15, align 4
  %689 = icmp eq i32 %687, %688
  br i1 %689, label %690, label %692

; <label>:690:                                    ; preds = %686
  %pgocount34 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 5)
  %691 = add i64 %pgocount34, 1
  store i64 %691, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 5)
  br label %628

; <label>:692:                                    ; preds = %686
  store i32 2, i32* %7, align 4
  %693 = load i32*, i32** %10, align 8
  %694 = load i32, i32* %11, align 4
  %695 = zext i32 %694 to i64
  %696 = getelementptr inbounds i32, i32* %693, i64 %695
  %697 = load i32, i32* %696, align 4
  store i32 %697, i32* %11, align 4
  %698 = load i32, i32* %11, align 4
  %699 = and i32 %698, 255
  %700 = trunc i32 %699 to i8
  store i8 %700, i8* %4, align 1
  %701 = load i32, i32* %11, align 4
  %702 = lshr i32 %701, 8
  store i32 %702, i32* %11, align 4
  %703 = load i32, i32* %8, align 4
  %704 = add nsw i32 %703, 1
  store i32 %704, i32* %8, align 4
  %705 = load i32, i32* %8, align 4
  %706 = load i32, i32* %15, align 4
  %707 = icmp eq i32 %705, %706
  br i1 %707, label %708, label %710

; <label>:708:                                    ; preds = %692
  %pgocount35 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 10)
  %709 = add i64 %pgocount35, 1
  store i64 %709, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 10)
  br label %592

; <label>:710:                                    ; preds = %692
  %711 = load i8, i8* %4, align 1
  %712 = zext i8 %711 to i32
  %713 = load i32, i32* %9, align 4
  %714 = icmp ne i32 %712, %713
  br i1 %714, label %715, label %719

; <label>:715:                                    ; preds = %710
  %pgocount36 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 14)
  %716 = add i64 %pgocount36, 1
  store i64 %716, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 14)
  %717 = load i8, i8* %4, align 1
  %718 = zext i8 %717 to i32
  store i32 %718, i32* %9, align 4
  br label %592

; <label>:719:                                    ; preds = %710
  store i32 3, i32* %7, align 4
  %720 = load i32*, i32** %10, align 8
  %721 = load i32, i32* %11, align 4
  %722 = zext i32 %721 to i64
  %723 = getelementptr inbounds i32, i32* %720, i64 %722
  %724 = load i32, i32* %723, align 4
  store i32 %724, i32* %11, align 4
  %725 = load i32, i32* %11, align 4
  %726 = and i32 %725, 255
  %727 = trunc i32 %726 to i8
  store i8 %727, i8* %4, align 1
  %728 = load i32, i32* %11, align 4
  %729 = lshr i32 %728, 8
  store i32 %729, i32* %11, align 4
  %730 = load i32, i32* %8, align 4
  %731 = add nsw i32 %730, 1
  store i32 %731, i32* %8, align 4
  %732 = load i32, i32* %8, align 4
  %733 = load i32, i32* %15, align 4
  %734 = icmp eq i32 %732, %733
  br i1 %734, label %735, label %737

; <label>:735:                                    ; preds = %719
  %pgocount37 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 19)
  %736 = add i64 %pgocount37, 1
  store i64 %736, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 19)
  br label %592

; <label>:737:                                    ; preds = %719
  %738 = load i8, i8* %4, align 1
  %739 = zext i8 %738 to i32
  %740 = load i32, i32* %9, align 4
  %741 = icmp ne i32 %739, %740
  br i1 %741, label %742, label %746

; <label>:742:                                    ; preds = %737
  %pgocount38 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 23)
  %743 = add i64 %pgocount38, 1
  store i64 %743, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 23)
  %744 = load i8, i8* %4, align 1
  %745 = zext i8 %744 to i32
  store i32 %745, i32* %9, align 4
  br label %592

; <label>:746:                                    ; preds = %737
  %pgocount39 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 24)
  %747 = add i64 %pgocount39, 1
  store i64 %747, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 24)
  %748 = load i32*, i32** %10, align 8
  %749 = load i32, i32* %11, align 4
  %750 = zext i32 %749 to i64
  %751 = getelementptr inbounds i32, i32* %748, i64 %750
  %752 = load i32, i32* %751, align 4
  store i32 %752, i32* %11, align 4
  %753 = load i32, i32* %11, align 4
  %754 = and i32 %753, 255
  %755 = trunc i32 %754 to i8
  store i8 %755, i8* %4, align 1
  %756 = load i32, i32* %11, align 4
  %757 = lshr i32 %756, 8
  store i32 %757, i32* %11, align 4
  %758 = load i32, i32* %8, align 4
  %759 = add nsw i32 %758, 1
  store i32 %759, i32* %8, align 4
  %760 = load i8, i8* %4, align 1
  %761 = zext i8 %760 to i32
  %762 = add nsw i32 %761, 4
  store i32 %762, i32* %7, align 4
  %763 = load i32*, i32** %10, align 8
  %764 = load i32, i32* %11, align 4
  %765 = zext i32 %764 to i64
  %766 = getelementptr inbounds i32, i32* %763, i64 %765
  %767 = load i32, i32* %766, align 4
  store i32 %767, i32* %11, align 4
  %768 = load i32, i32* %11, align 4
  %769 = and i32 %768, 255
  %770 = trunc i32 %769 to i8
  %771 = zext i8 %770 to i32
  store i32 %771, i32* %9, align 4
  %772 = load i32, i32* %11, align 4
  %773 = lshr i32 %772, 8
  store i32 %773, i32* %11, align 4
  %774 = load i32, i32* %8, align 4
  %775 = add nsw i32 %774, 1
  store i32 %775, i32* %8, align 4
  br label %592

; <label>:776:                                    ; preds = %661, %631, %599
  %777 = load %struct.DState*, %struct.DState** %3, align 8
  %778 = getelementptr inbounds %struct.DState, %struct.DState* %777, i32 0, i32 0
  %779 = load %struct.bz_stream*, %struct.bz_stream** %778, align 8
  %780 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %779, i32 0, i32 6
  %781 = load i32, i32* %780, align 4
  store i32 %781, i32* %16, align 4
  %782 = load i32, i32* %14, align 4
  %783 = load i32, i32* %13, align 4
  %784 = sub i32 %782, %783
  %785 = load %struct.DState*, %struct.DState** %3, align 8
  %786 = getelementptr inbounds %struct.DState, %struct.DState* %785, i32 0, i32 0
  %787 = load %struct.bz_stream*, %struct.bz_stream** %786, align 8
  %788 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %787, i32 0, i32 6
  %789 = load i32, i32* %788, align 4
  %790 = add i32 %789, %784
  store i32 %790, i32* %788, align 4
  %791 = load %struct.DState*, %struct.DState** %3, align 8
  %792 = getelementptr inbounds %struct.DState, %struct.DState* %791, i32 0, i32 0
  %793 = load %struct.bz_stream*, %struct.bz_stream** %792, align 8
  %794 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %793, i32 0, i32 6
  %795 = load i32, i32* %794, align 4
  %796 = load i32, i32* %16, align 4
  %797 = icmp ult i32 %795, %796
  br i1 %797, label %798, label %806

; <label>:798:                                    ; preds = %776
  %pgocount40 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 11)
  %799 = add i64 %pgocount40, 1
  store i64 %799, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_tmp1.ll_unRLE_obuf_to_output_FAST, i64 0, i64 11)
  %800 = load %struct.DState*, %struct.DState** %3, align 8
  %801 = getelementptr inbounds %struct.DState, %struct.DState* %800, i32 0, i32 0
  %802 = load %struct.bz_stream*, %struct.bz_stream** %801, align 8
  %803 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %802, i32 0, i32 7
  %804 = load i32, i32* %803, align 8
  %805 = add i32 %804, 1
  store i32 %805, i32* %803, align 8
  br label %806

; <label>:806:                                    ; preds = %798, %776
  %807 = load i32, i32* %5, align 4
  %808 = load %struct.DState*, %struct.DState** %3, align 8
  %809 = getelementptr inbounds %struct.DState, %struct.DState* %808, i32 0, i32 25
  store i32 %807, i32* %809, align 8
  %810 = load i8, i8* %6, align 1
  %811 = load %struct.DState*, %struct.DState** %3, align 8
  %812 = getelementptr inbounds %struct.DState, %struct.DState* %811, i32 0, i32 2
  store i8 %810, i8* %812, align 4
  %813 = load i32, i32* %7, align 4
  %814 = load %struct.DState*, %struct.DState** %3, align 8
  %815 = getelementptr inbounds %struct.DState, %struct.DState* %814, i32 0, i32 3
  store i32 %813, i32* %815, align 8
  %816 = load i32, i32* %8, align 4
  %817 = load %struct.DState*, %struct.DState** %3, align 8
  %818 = getelementptr inbounds %struct.DState, %struct.DState* %817, i32 0, i32 17
  store i32 %816, i32* %818, align 4
  %819 = load i32, i32* %9, align 4
  %820 = load %struct.DState*, %struct.DState** %3, align 8
  %821 = getelementptr inbounds %struct.DState, %struct.DState* %820, i32 0, i32 15
  store i32 %819, i32* %821, align 8
  %822 = load i32*, i32** %10, align 8
  %823 = load %struct.DState*, %struct.DState** %3, align 8
  %824 = getelementptr inbounds %struct.DState, %struct.DState* %823, i32 0, i32 20
  store i32* %822, i32** %824, align 8
  %825 = load i32, i32* %11, align 4
  %826 = load %struct.DState*, %struct.DState** %3, align 8
  %827 = getelementptr inbounds %struct.DState, %struct.DState* %826, i32 0, i32 14
  store i32 %825, i32* %827, align 4
  %828 = load i8*, i8** %12, align 8
  %829 = load %struct.DState*, %struct.DState** %3, align 8
  %830 = getelementptr inbounds %struct.DState, %struct.DState* %829, i32 0, i32 0
  %831 = load %struct.bz_stream*, %struct.bz_stream** %830, align 8
  %832 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %831, i32 0, i32 4
  store i8* %828, i8** %832, align 8
  %833 = load i32, i32* %13, align 4
  %834 = load %struct.DState*, %struct.DState** %3, align 8
  %835 = getelementptr inbounds %struct.DState, %struct.DState* %834, i32 0, i32 0
  %836 = load %struct.bz_stream*, %struct.bz_stream** %835, align 8
  %837 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %836, i32 0, i32 5
  store i32 %833, i32* %837, align 8
  br label %838

; <label>:838:                                    ; preds = %806
  store i8 0, i8* %2, align 1
  br label %839

; <label>:839:                                    ; preds = %838, %655, %124, %113, %30
  %840 = load i8, i8* %2, align 1
  ret i8 %840
}

declare i32 @BZ2_decompress(%struct.DState*) #1

; Function Attrs: nounwind uwtable
define i32 @BZ2_bzDecompressEnd(%struct.bz_stream*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.bz_stream*, align 8
  %4 = alloca %struct.DState*, align 8
  store %struct.bz_stream* %0, %struct.bz_stream** %3, align 8
  %5 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %6 = icmp eq %struct.bz_stream* %5, null
  br i1 %6, label %7, label %9

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzDecompressEnd, i64 0, i64 0)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzDecompressEnd, i64 0, i64 0)
  store i32 -2, i32* %2, align 4
  br label %93

; <label>:9:                                      ; preds = %1
  %10 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %11 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %10, i32 0, i32 8
  %12 = load i8*, i8** %11, align 8
  %13 = bitcast i8* %12 to %struct.DState*
  store %struct.DState* %13, %struct.DState** %4, align 8
  %14 = load %struct.DState*, %struct.DState** %4, align 8
  %15 = icmp eq %struct.DState* %14, null
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzDecompressEnd, i64 0, i64 2)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzDecompressEnd, i64 0, i64 2)
  store i32 -2, i32* %2, align 4
  br label %93

; <label>:18:                                     ; preds = %9
  %19 = load %struct.DState*, %struct.DState** %4, align 8
  %20 = getelementptr inbounds %struct.DState, %struct.DState* %19, i32 0, i32 0
  %21 = load %struct.bz_stream*, %struct.bz_stream** %20, align 8
  %22 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %23 = icmp ne %struct.bz_stream* %21, %22
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzDecompressEnd, i64 0, i64 1)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzDecompressEnd, i64 0, i64 1)
  store i32 -2, i32* %2, align 4
  br label %93

; <label>:26:                                     ; preds = %18
  %27 = load %struct.DState*, %struct.DState** %4, align 8
  %28 = getelementptr inbounds %struct.DState, %struct.DState* %27, i32 0, i32 20
  %29 = load i32*, i32** %28, align 8
  %30 = icmp ne i32* %29, null
  br i1 %30, label %31, label %44

; <label>:31:                                     ; preds = %26
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzDecompressEnd, i64 0, i64 4)
  %32 = add i64 %pgocount3, 1
  store i64 %32, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzDecompressEnd, i64 0, i64 4)
  %33 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %34 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %33, i32 0, i32 10
  %35 = load void (i8*, i8*)*, void (i8*, i8*)** %34, align 8
  %36 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %37 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %36, i32 0, i32 11
  %38 = load i8*, i8** %37, align 8
  %39 = load %struct.DState*, %struct.DState** %4, align 8
  %40 = getelementptr inbounds %struct.DState, %struct.DState* %39, i32 0, i32 20
  %41 = load i32*, i32** %40, align 8
  %42 = bitcast i32* %41 to i8*
  %43 = ptrtoint void (i8*, i8*)* %35 to i64
  call void @__llvm_profile_instrument_target(i64 %43, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzDecompressEnd to i8*), i32 0)
  call void %35(i8* %38, i8* %42)
  br label %44

; <label>:44:                                     ; preds = %31, %26
  %45 = load %struct.DState*, %struct.DState** %4, align 8
  %46 = getelementptr inbounds %struct.DState, %struct.DState* %45, i32 0, i32 21
  %47 = load i16*, i16** %46, align 8
  %48 = icmp ne i16* %47, null
  br i1 %48, label %49, label %62

; <label>:49:                                     ; preds = %44
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzDecompressEnd, i64 0, i64 5)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzDecompressEnd, i64 0, i64 5)
  %51 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %52 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %51, i32 0, i32 10
  %53 = load void (i8*, i8*)*, void (i8*, i8*)** %52, align 8
  %54 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %55 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %54, i32 0, i32 11
  %56 = load i8*, i8** %55, align 8
  %57 = load %struct.DState*, %struct.DState** %4, align 8
  %58 = getelementptr inbounds %struct.DState, %struct.DState* %57, i32 0, i32 21
  %59 = load i16*, i16** %58, align 8
  %60 = bitcast i16* %59 to i8*
  %61 = ptrtoint void (i8*, i8*)* %53 to i64
  call void @__llvm_profile_instrument_target(i64 %61, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzDecompressEnd to i8*), i32 1)
  call void %53(i8* %56, i8* %60)
  br label %62

; <label>:62:                                     ; preds = %49, %44
  %63 = load %struct.DState*, %struct.DState** %4, align 8
  %64 = getelementptr inbounds %struct.DState, %struct.DState* %63, i32 0, i32 22
  %65 = load i8*, i8** %64, align 8
  %66 = icmp ne i8* %65, null
  br i1 %66, label %67, label %79

; <label>:67:                                     ; preds = %62
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzDecompressEnd, i64 0, i64 6)
  %68 = add i64 %pgocount5, 1
  store i64 %68, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzDecompressEnd, i64 0, i64 6)
  %69 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %70 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %69, i32 0, i32 10
  %71 = load void (i8*, i8*)*, void (i8*, i8*)** %70, align 8
  %72 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %73 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %72, i32 0, i32 11
  %74 = load i8*, i8** %73, align 8
  %75 = load %struct.DState*, %struct.DState** %4, align 8
  %76 = getelementptr inbounds %struct.DState, %struct.DState* %75, i32 0, i32 22
  %77 = load i8*, i8** %76, align 8
  %78 = ptrtoint void (i8*, i8*)* %71 to i64
  call void @__llvm_profile_instrument_target(i64 %78, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzDecompressEnd to i8*), i32 2)
  call void %71(i8* %74, i8* %77)
  br label %79

; <label>:79:                                     ; preds = %67, %62
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzDecompressEnd, i64 0, i64 3)
  %80 = add i64 %pgocount6, 1
  store i64 %80, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_BZ2_bzDecompressEnd, i64 0, i64 3)
  %81 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %82 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %81, i32 0, i32 10
  %83 = load void (i8*, i8*)*, void (i8*, i8*)** %82, align 8
  %84 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %85 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %84, i32 0, i32 11
  %86 = load i8*, i8** %85, align 8
  %87 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %88 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %87, i32 0, i32 8
  %89 = load i8*, i8** %88, align 8
  %90 = ptrtoint void (i8*, i8*)* %83 to i64
  call void @__llvm_profile_instrument_target(i64 %90, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_bzDecompressEnd to i8*), i32 3)
  call void %83(i8* %86, i8* %89)
  %91 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %92 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %91, i32 0, i32 8
  store i8* null, i8** %92, align 8
  store i32 0, i32* %2, align 4
  br label %93

; <label>:93:                                     ; preds = %79, %24, %16, %7
  %94 = load i32, i32* %2, align 4
  ret i32 %94
}

; Function Attrs: nounwind uwtable
define i8* @BZ2_bzWriteOpen(i32*, %struct._IO_FILE*, i32, i32, i32) #0 {
  %6 = alloca i8*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca %struct._IO_FILE*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca %struct.bzFile*, align 8
  store i32* %0, i32** %7, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %8, align 8
  store i32 %2, i32* %9, align 4
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store %struct.bzFile* null, %struct.bzFile** %13, align 8
  %14 = load i32*, i32** %7, align 8
  %15 = icmp ne i32* %14, null
  br i1 %15, label %16, label %19

; <label>:16:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 1)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 1)
  %18 = load i32*, i32** %7, align 8
  store i32 0, i32* %18, align 4
  br label %19

; <label>:19:                                     ; preds = %16, %5
  %20 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %21 = icmp ne %struct.bzFile* %20, null
  br i1 %21, label %22, label %26

; <label>:22:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 2)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 2)
  %24 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %25 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %24, i32 0, i32 5
  store i32 0, i32* %25, align 8
  br label %26

; <label>:26:                                     ; preds = %22, %19
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %28 = icmp eq %struct._IO_FILE* %27, null
  br i1 %28, label %53, label %29

; <label>:29:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 3)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 3)
  %31 = load i32, i32* %9, align 4
  %32 = icmp slt i32 %31, 1
  br i1 %32, label %53, label %33

; <label>:33:                                     ; preds = %29
  %pgocount3 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 6)
  %34 = add i64 %pgocount3, 1
  store i64 %34, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 6)
  %35 = load i32, i32* %9, align 4
  %36 = icmp sgt i32 %35, 9
  br i1 %36, label %53, label %37

; <label>:37:                                     ; preds = %33
  %pgocount4 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 7)
  %38 = add i64 %pgocount4, 1
  store i64 %38, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 7)
  %39 = load i32, i32* %11, align 4
  %40 = icmp slt i32 %39, 0
  br i1 %40, label %53, label %41

; <label>:41:                                     ; preds = %37
  %pgocount5 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 8)
  %42 = add i64 %pgocount5, 1
  store i64 %42, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 8)
  %43 = load i32, i32* %11, align 4
  %44 = icmp sgt i32 %43, 250
  br i1 %44, label %53, label %45

; <label>:45:                                     ; preds = %41
  %pgocount6 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 9)
  %46 = add i64 %pgocount6, 1
  store i64 %46, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 9)
  %47 = load i32, i32* %10, align 4
  %48 = icmp slt i32 %47, 0
  br i1 %48, label %53, label %49

; <label>:49:                                     ; preds = %45
  %pgocount7 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 10)
  %50 = add i64 %pgocount7, 1
  store i64 %50, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 10)
  %51 = load i32, i32* %10, align 4
  %52 = icmp sgt i32 %51, 4
  br i1 %52, label %53, label %68

; <label>:53:                                     ; preds = %49, %45, %41, %37, %33, %29, %26
  %54 = load i32*, i32** %7, align 8
  %55 = icmp ne i32* %54, null
  br i1 %55, label %56, label %59

; <label>:56:                                     ; preds = %53
  %pgocount8 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 4)
  %57 = add i64 %pgocount8, 1
  store i64 %57, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 4)
  %58 = load i32*, i32** %7, align 8
  store i32 -2, i32* %58, align 4
  br label %59

; <label>:59:                                     ; preds = %56, %53
  %60 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %61 = icmp ne %struct.bzFile* %60, null
  br i1 %61, label %62, label %66

; <label>:62:                                     ; preds = %59
  %pgocount9 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 5)
  %63 = add i64 %pgocount9, 1
  store i64 %63, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 5)
  %64 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %65 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %64, i32 0, i32 5
  store i32 -2, i32* %65, align 8
  br label %66

; <label>:66:                                     ; preds = %62, %59
  %pgocount10 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 0)
  %67 = add i64 %pgocount10, 1
  store i64 %67, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 0)
  store i8* null, i8** %6, align 8
  br label %180

; <label>:68:                                     ; preds = %49
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %70 = call i32 @ferror(%struct._IO_FILE* %69) #8
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %87

; <label>:72:                                     ; preds = %68
  %73 = load i32*, i32** %7, align 8
  %74 = icmp ne i32* %73, null
  br i1 %74, label %75, label %78

; <label>:75:                                     ; preds = %72
  %pgocount11 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 12)
  %76 = add i64 %pgocount11, 1
  store i64 %76, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 12)
  %77 = load i32*, i32** %7, align 8
  store i32 -6, i32* %77, align 4
  br label %78

; <label>:78:                                     ; preds = %75, %72
  %79 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %80 = icmp ne %struct.bzFile* %79, null
  br i1 %80, label %81, label %85

; <label>:81:                                     ; preds = %78
  %pgocount12 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 13)
  %82 = add i64 %pgocount12, 1
  store i64 %82, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 13)
  %83 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %84 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %83, i32 0, i32 5
  store i32 -6, i32* %84, align 8
  br label %85

; <label>:85:                                     ; preds = %81, %78
  %pgocount13 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 11)
  %86 = add i64 %pgocount13, 1
  store i64 %86, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 11)
  store i8* null, i8** %6, align 8
  br label %180

; <label>:87:                                     ; preds = %68
  %88 = call noalias i8* @malloc(i64 5104) #8
  %89 = bitcast i8* %88 to %struct.bzFile*
  store %struct.bzFile* %89, %struct.bzFile** %13, align 8
  %90 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %91 = icmp eq %struct.bzFile* %90, null
  br i1 %91, label %92, label %107

; <label>:92:                                     ; preds = %87
  %93 = load i32*, i32** %7, align 8
  %94 = icmp ne i32* %93, null
  br i1 %94, label %95, label %98

; <label>:95:                                     ; preds = %92
  %pgocount14 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 20)
  %96 = add i64 %pgocount14, 1
  store i64 %96, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 20)
  %97 = load i32*, i32** %7, align 8
  store i32 -3, i32* %97, align 4
  br label %98

; <label>:98:                                     ; preds = %95, %92
  %99 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %100 = icmp ne %struct.bzFile* %99, null
  br i1 %100, label %101, label %105

; <label>:101:                                    ; preds = %98
  %pgocount15 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 21)
  %102 = add i64 %pgocount15, 1
  store i64 %102, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 21)
  %103 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %104 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %103, i32 0, i32 5
  store i32 -3, i32* %104, align 8
  br label %105

; <label>:105:                                    ; preds = %101, %98
  %pgocount16 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 17)
  %106 = add i64 %pgocount16, 1
  store i64 %106, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 17)
  store i8* null, i8** %6, align 8
  br label %180

; <label>:107:                                    ; preds = %87
  %108 = load i32*, i32** %7, align 8
  %109 = icmp ne i32* %108, null
  br i1 %109, label %110, label %113

; <label>:110:                                    ; preds = %107
  %pgocount17 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 14)
  %111 = add i64 %pgocount17, 1
  store i64 %111, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 14)
  %112 = load i32*, i32** %7, align 8
  store i32 0, i32* %112, align 4
  br label %113

; <label>:113:                                    ; preds = %110, %107
  %114 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %115 = icmp ne %struct.bzFile* %114, null
  br i1 %115, label %116, label %120

; <label>:116:                                    ; preds = %113
  %pgocount18 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 15)
  %117 = add i64 %pgocount18, 1
  store i64 %117, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 15)
  %118 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %119 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %118, i32 0, i32 5
  store i32 0, i32* %119, align 8
  br label %120

; <label>:120:                                    ; preds = %116, %113
  %121 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %122 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %121, i32 0, i32 6
  store i8 0, i8* %122, align 4
  %123 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %124 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %123, i32 0, i32 2
  store i32 0, i32* %124, align 8
  %125 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %126 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %127 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %126, i32 0, i32 0
  store %struct._IO_FILE* %125, %struct._IO_FILE** %127, align 8
  %128 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %129 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %128, i32 0, i32 3
  store i8 1, i8* %129, align 4
  %130 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %131 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %130, i32 0, i32 4
  %132 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %131, i32 0, i32 9
  store i8* (i8*, i32, i32)* null, i8* (i8*, i32, i32)** %132, align 8
  %133 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %134 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %133, i32 0, i32 4
  %135 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %134, i32 0, i32 10
  store void (i8*, i8*)* null, void (i8*, i8*)** %135, align 8
  %136 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %137 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %136, i32 0, i32 4
  %138 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %137, i32 0, i32 11
  store i8* null, i8** %138, align 8
  %139 = load i32, i32* %11, align 4
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %141, label %143

; <label>:141:                                    ; preds = %120
  %pgocount19 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 22)
  %142 = add i64 %pgocount19, 1
  store i64 %142, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 22)
  store i32 30, i32* %11, align 4
  br label %143

; <label>:143:                                    ; preds = %141, %120
  %144 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %145 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %144, i32 0, i32 4
  %146 = load i32, i32* %9, align 4
  %147 = load i32, i32* %10, align 4
  %148 = load i32, i32* %11, align 4
  %149 = call i32 @BZ2_bzCompressInit(%struct.bz_stream* %145, i32 %146, i32 %147, i32 %148)
  store i32 %149, i32* %12, align 4
  %150 = load i32, i32* %12, align 4
  %151 = icmp ne i32 %150, 0
  br i1 %151, label %152, label %171

; <label>:152:                                    ; preds = %143
  %153 = load i32*, i32** %7, align 8
  %154 = icmp ne i32* %153, null
  br i1 %154, label %155, label %159

; <label>:155:                                    ; preds = %152
  %pgocount20 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 18)
  %156 = add i64 %pgocount20, 1
  store i64 %156, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 18)
  %157 = load i32, i32* %12, align 4
  %158 = load i32*, i32** %7, align 8
  store i32 %157, i32* %158, align 4
  br label %159

; <label>:159:                                    ; preds = %155, %152
  %160 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %161 = icmp ne %struct.bzFile* %160, null
  br i1 %161, label %162, label %167

; <label>:162:                                    ; preds = %159
  %pgocount21 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 19)
  %163 = add i64 %pgocount21, 1
  store i64 %163, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 19)
  %164 = load i32, i32* %12, align 4
  %165 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %166 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %165, i32 0, i32 5
  store i32 %164, i32* %166, align 8
  br label %167

; <label>:167:                                    ; preds = %162, %159
  %pgocount22 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 16)
  %168 = add i64 %pgocount22, 1
  store i64 %168, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 16)
  %169 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %170 = bitcast %struct.bzFile* %169 to i8*
  call void @free(i8* %170) #8
  store i8* null, i8** %6, align 8
  br label %180

; <label>:171:                                    ; preds = %143
  %pgocount23 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 23)
  %172 = add i64 %pgocount23, 1
  store i64 %172, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_BZ2_bzWriteOpen, i64 0, i64 23)
  %173 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %174 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %173, i32 0, i32 4
  %175 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %174, i32 0, i32 1
  store i32 0, i32* %175, align 8
  %176 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %177 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %176, i32 0, i32 6
  store i8 1, i8* %177, align 4
  %178 = load %struct.bzFile*, %struct.bzFile** %13, align 8
  %179 = bitcast %struct.bzFile* %178 to i8*
  store i8* %179, i8** %6, align 8
  br label %180

; <label>:180:                                    ; preds = %171, %167, %105, %85, %66
  %181 = load i8*, i8** %6, align 8
  ret i8* %181
}

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

; Function Attrs: nounwind
declare void @free(i8*) #4

; Function Attrs: nounwind uwtable
define void @BZ2_bzWrite(i32*, i8*, i8*, i32) #0 {
  %5 = alloca i32*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct.bzFile*, align 8
  store i32* %0, i32** %5, align 8
  store i8* %1, i8** %6, align 8
  store i8* %2, i8** %7, align 8
  store i32 %3, i32* %8, align 4
  %13 = load i8*, i8** %6, align 8
  %14 = bitcast i8* %13 to %struct.bzFile*
  store %struct.bzFile* %14, %struct.bzFile** %12, align 8
  %15 = load i32*, i32** %5, align 8
  %16 = icmp ne i32* %15, null
  br i1 %16, label %17, label %20

; <label>:17:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 1)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 1)
  %19 = load i32*, i32** %5, align 8
  store i32 0, i32* %19, align 4
  br label %20

; <label>:20:                                     ; preds = %17, %4
  %21 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %22 = icmp ne %struct.bzFile* %21, null
  br i1 %22, label %23, label %27

; <label>:23:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 2)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 2)
  %25 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %26 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %25, i32 0, i32 5
  store i32 0, i32* %26, align 8
  br label %27

; <label>:27:                                     ; preds = %23, %20
  %28 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %29 = icmp eq %struct.bzFile* %28, null
  br i1 %29, label %38, label %30

; <label>:30:                                     ; preds = %27
  %pgocount2 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 3)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 3)
  %32 = load i8*, i8** %7, align 8
  %33 = icmp eq i8* %32, null
  br i1 %33, label %38, label %34

; <label>:34:                                     ; preds = %30
  %pgocount3 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 6)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 6)
  %36 = load i32, i32* %8, align 4
  %37 = icmp slt i32 %36, 0
  br i1 %37, label %38, label %53

; <label>:38:                                     ; preds = %34, %30, %27
  %39 = load i32*, i32** %5, align 8
  %40 = icmp ne i32* %39, null
  br i1 %40, label %41, label %44

; <label>:41:                                     ; preds = %38
  %pgocount4 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 4)
  %42 = add i64 %pgocount4, 1
  store i64 %42, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 4)
  %43 = load i32*, i32** %5, align 8
  store i32 -2, i32* %43, align 4
  br label %44

; <label>:44:                                     ; preds = %41, %38
  %45 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %46 = icmp ne %struct.bzFile* %45, null
  br i1 %46, label %47, label %51

; <label>:47:                                     ; preds = %44
  %pgocount5 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 5)
  %48 = add i64 %pgocount5, 1
  store i64 %48, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 5)
  %49 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %50 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %49, i32 0, i32 5
  store i32 -2, i32* %50, align 8
  br label %51

; <label>:51:                                     ; preds = %47, %44
  %pgocount6 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 0)
  %52 = add i64 %pgocount6, 1
  store i64 %52, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 0)
  br label %225

; <label>:53:                                     ; preds = %34
  %54 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %55 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %54, i32 0, i32 3
  %56 = load i8, i8* %55, align 4
  %57 = icmp ne i8 %56, 0
  br i1 %57, label %73, label %58

; <label>:58:                                     ; preds = %53
  %59 = load i32*, i32** %5, align 8
  %60 = icmp ne i32* %59, null
  br i1 %60, label %61, label %64

; <label>:61:                                     ; preds = %58
  %pgocount7 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 14)
  %62 = add i64 %pgocount7, 1
  store i64 %62, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 14)
  %63 = load i32*, i32** %5, align 8
  store i32 -1, i32* %63, align 4
  br label %64

; <label>:64:                                     ; preds = %61, %58
  %65 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %66 = icmp ne %struct.bzFile* %65, null
  br i1 %66, label %67, label %71

; <label>:67:                                     ; preds = %64
  %pgocount8 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 15)
  %68 = add i64 %pgocount8, 1
  store i64 %68, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 15)
  %69 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %70 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %69, i32 0, i32 5
  store i32 -1, i32* %70, align 8
  br label %71

; <label>:71:                                     ; preds = %67, %64
  %pgocount9 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 11)
  %72 = add i64 %pgocount9, 1
  store i64 %72, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 11)
  br label %225

; <label>:73:                                     ; preds = %53
  %74 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %75 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %74, i32 0, i32 0
  %76 = load %struct._IO_FILE*, %struct._IO_FILE** %75, align 8
  %77 = call i32 @ferror(%struct._IO_FILE* %76) #8
  %78 = icmp ne i32 %77, 0
  br i1 %78, label %79, label %94

; <label>:79:                                     ; preds = %73
  %80 = load i32*, i32** %5, align 8
  %81 = icmp ne i32* %80, null
  br i1 %81, label %82, label %85

; <label>:82:                                     ; preds = %79
  %pgocount10 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 12)
  %83 = add i64 %pgocount10, 1
  store i64 %83, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 12)
  %84 = load i32*, i32** %5, align 8
  store i32 -6, i32* %84, align 4
  br label %85

; <label>:85:                                     ; preds = %82, %79
  %86 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %87 = icmp ne %struct.bzFile* %86, null
  br i1 %87, label %88, label %92

; <label>:88:                                     ; preds = %85
  %pgocount11 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 13)
  %89 = add i64 %pgocount11, 1
  store i64 %89, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 13)
  %90 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %91 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %90, i32 0, i32 5
  store i32 -6, i32* %91, align 8
  br label %92

; <label>:92:                                     ; preds = %88, %85
  %pgocount12 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 10)
  %93 = add i64 %pgocount12, 1
  store i64 %93, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 10)
  br label %225

; <label>:94:                                     ; preds = %73
  %95 = load i32, i32* %8, align 4
  %96 = icmp eq i32 %95, 0
  br i1 %96, label %97, label %112

; <label>:97:                                     ; preds = %94
  %98 = load i32*, i32** %5, align 8
  %99 = icmp ne i32* %98, null
  br i1 %99, label %100, label %103

; <label>:100:                                    ; preds = %97
  %pgocount13 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 17)
  %101 = add i64 %pgocount13, 1
  store i64 %101, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 17)
  %102 = load i32*, i32** %5, align 8
  store i32 0, i32* %102, align 4
  br label %103

; <label>:103:                                    ; preds = %100, %97
  %104 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %105 = icmp ne %struct.bzFile* %104, null
  br i1 %105, label %106, label %110

; <label>:106:                                    ; preds = %103
  %pgocount14 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 18)
  %107 = add i64 %pgocount14, 1
  store i64 %107, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 18)
  %108 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %109 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %108, i32 0, i32 5
  store i32 0, i32* %109, align 8
  br label %110

; <label>:110:                                    ; preds = %106, %103
  %pgocount15 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 16)
  %111 = add i64 %pgocount15, 1
  store i64 %111, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 16)
  br label %225

; <label>:112:                                    ; preds = %94
  %113 = load i32, i32* %8, align 4
  %114 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %115 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %114, i32 0, i32 4
  %116 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %115, i32 0, i32 1
  store i32 %113, i32* %116, align 8
  %117 = load i8*, i8** %7, align 8
  %118 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %119 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %118, i32 0, i32 4
  %120 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %119, i32 0, i32 0
  store i8* %117, i8** %120, align 8
  br label %121

; <label>:121:                                    ; preds = %223, %112
  %122 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %123 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %122, i32 0, i32 4
  %124 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %123, i32 0, i32 5
  store i32 5000, i32* %124, align 8
  %125 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %126 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %125, i32 0, i32 1
  %127 = getelementptr inbounds [5000 x i8], [5000 x i8]* %126, i32 0, i32 0
  %128 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %129 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %128, i32 0, i32 4
  %130 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %129, i32 0, i32 4
  store i8* %127, i8** %130, align 8
  %131 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %132 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %131, i32 0, i32 4
  %133 = call i32 @BZ2_bzCompress(%struct.bz_stream* %132, i32 0)
  store i32 %133, i32* %11, align 4
  %134 = load i32, i32* %11, align 4
  %135 = icmp ne i32 %134, 1
  br i1 %135, label %136, label %153

; <label>:136:                                    ; preds = %121
  %137 = load i32*, i32** %5, align 8
  %138 = icmp ne i32* %137, null
  br i1 %138, label %139, label %143

; <label>:139:                                    ; preds = %136
  %pgocount16 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 22)
  %140 = add i64 %pgocount16, 1
  store i64 %140, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 22)
  %141 = load i32, i32* %11, align 4
  %142 = load i32*, i32** %5, align 8
  store i32 %141, i32* %142, align 4
  br label %143

; <label>:143:                                    ; preds = %139, %136
  %144 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %145 = icmp ne %struct.bzFile* %144, null
  br i1 %145, label %146, label %151

; <label>:146:                                    ; preds = %143
  %pgocount17 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 23)
  %147 = add i64 %pgocount17, 1
  store i64 %147, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 23)
  %148 = load i32, i32* %11, align 4
  %149 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %150 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %149, i32 0, i32 5
  store i32 %148, i32* %150, align 8
  br label %151

; <label>:151:                                    ; preds = %146, %143
  %pgocount18 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 19)
  %152 = add i64 %pgocount18, 1
  store i64 %152, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 19)
  br label %225

; <label>:153:                                    ; preds = %121
  %154 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %155 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %154, i32 0, i32 4
  %156 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %155, i32 0, i32 5
  %157 = load i32, i32* %156, align 8
  %158 = icmp ult i32 %157, 5000
  br i1 %158, label %159, label %202

; <label>:159:                                    ; preds = %153
  %160 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %161 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %160, i32 0, i32 4
  %162 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %161, i32 0, i32 5
  %163 = load i32, i32* %162, align 8
  %164 = sub i32 5000, %163
  store i32 %164, i32* %9, align 4
  %165 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %166 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %165, i32 0, i32 1
  %167 = getelementptr inbounds [5000 x i8], [5000 x i8]* %166, i32 0, i32 0
  %168 = load i32, i32* %9, align 4
  %169 = sext i32 %168 to i64
  %170 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %171 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %170, i32 0, i32 0
  %172 = load %struct._IO_FILE*, %struct._IO_FILE** %171, align 8
  %173 = call i64 @fwrite(i8* %167, i64 1, i64 %169, %struct._IO_FILE* %172)
  %174 = trunc i64 %173 to i32
  store i32 %174, i32* %10, align 4
  %175 = load i32, i32* %9, align 4
  %176 = load i32, i32* %10, align 4
  %177 = icmp ne i32 %175, %176
  br i1 %177, label %185, label %178

; <label>:178:                                    ; preds = %159
  %pgocount19 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 8)
  %179 = add i64 %pgocount19, 1
  store i64 %179, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 8)
  %180 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %181 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %180, i32 0, i32 0
  %182 = load %struct._IO_FILE*, %struct._IO_FILE** %181, align 8
  %183 = call i32 @ferror(%struct._IO_FILE* %182) #8
  %184 = icmp ne i32 %183, 0
  br i1 %184, label %185, label %200

; <label>:185:                                    ; preds = %178, %159
  %186 = load i32*, i32** %5, align 8
  %187 = icmp ne i32* %186, null
  br i1 %187, label %188, label %191

; <label>:188:                                    ; preds = %185
  %pgocount20 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 24)
  %189 = add i64 %pgocount20, 1
  store i64 %189, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 24)
  %190 = load i32*, i32** %5, align 8
  store i32 -6, i32* %190, align 4
  br label %191

; <label>:191:                                    ; preds = %188, %185
  %192 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %193 = icmp ne %struct.bzFile* %192, null
  br i1 %193, label %194, label %198

; <label>:194:                                    ; preds = %191
  %pgocount21 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 25)
  %195 = add i64 %pgocount21, 1
  store i64 %195, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 25)
  %196 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %197 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %196, i32 0, i32 5
  store i32 -6, i32* %197, align 8
  br label %198

; <label>:198:                                    ; preds = %194, %191
  %pgocount22 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 20)
  %199 = add i64 %pgocount22, 1
  store i64 %199, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 20)
  br label %225

; <label>:200:                                    ; preds = %178
  %pgocount23 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 9)
  %201 = add i64 %pgocount23, 1
  store i64 %201, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 9)
  br label %202

; <label>:202:                                    ; preds = %200, %153
  %203 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %204 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %203, i32 0, i32 4
  %205 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %204, i32 0, i32 1
  %206 = load i32, i32* %205, align 8
  %207 = icmp eq i32 %206, 0
  br i1 %207, label %208, label %223

; <label>:208:                                    ; preds = %202
  %209 = load i32*, i32** %5, align 8
  %210 = icmp ne i32* %209, null
  br i1 %210, label %211, label %214

; <label>:211:                                    ; preds = %208
  %pgocount24 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 26)
  %212 = add i64 %pgocount24, 1
  store i64 %212, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 26)
  %213 = load i32*, i32** %5, align 8
  store i32 0, i32* %213, align 4
  br label %214

; <label>:214:                                    ; preds = %211, %208
  %215 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %216 = icmp ne %struct.bzFile* %215, null
  br i1 %216, label %217, label %221

; <label>:217:                                    ; preds = %214
  %pgocount25 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 27)
  %218 = add i64 %pgocount25, 1
  store i64 %218, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 27)
  %219 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %220 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %219, i32 0, i32 5
  store i32 0, i32* %220, align 8
  br label %221

; <label>:221:                                    ; preds = %217, %214
  %pgocount26 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 21)
  %222 = add i64 %pgocount26, 1
  store i64 %222, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 21)
  br label %225

; <label>:223:                                    ; preds = %202
  %pgocount27 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 7)
  %224 = add i64 %pgocount27, 1
  store i64 %224, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_BZ2_bzWrite, i64 0, i64 7)
  br label %121

; <label>:225:                                    ; preds = %221, %198, %151, %110, %92, %71, %51
  ret void
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @BZ2_bzWriteClose(i32*, i8*, i32, i32*, i32*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BZ2_bzWriteClose, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BZ2_bzWriteClose, i64 0, i64 0)
  %7 = alloca i32*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  store i32* %0, i32** %7, align 8
  store i8* %1, i8** %8, align 8
  store i32 %2, i32* %9, align 4
  store i32* %3, i32** %10, align 8
  store i32* %4, i32** %11, align 8
  %12 = load i32*, i32** %7, align 8
  %13 = load i8*, i8** %8, align 8
  %14 = load i32, i32* %9, align 4
  %15 = load i32*, i32** %10, align 8
  %16 = load i32*, i32** %11, align 8
  call void @BZ2_bzWriteClose64(i32* %12, i8* %13, i32 %14, i32* %15, i32* null, i32* %16, i32* null)
  ret void
}

; Function Attrs: nounwind uwtable
define void @BZ2_bzWriteClose64(i32*, i8*, i32, i32*, i32*, i32*, i32*) #0 {
  %8 = alloca i32*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32*, align 8
  %12 = alloca i32*, align 8
  %13 = alloca i32*, align 8
  %14 = alloca i32*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca %struct.bzFile*, align 8
  store i32* %0, i32** %8, align 8
  store i8* %1, i8** %9, align 8
  store i32 %2, i32* %10, align 4
  store i32* %3, i32** %11, align 8
  store i32* %4, i32** %12, align 8
  store i32* %5, i32** %13, align 8
  store i32* %6, i32** %14, align 8
  %19 = load i8*, i8** %9, align 8
  %20 = bitcast i8* %19 to %struct.bzFile*
  store %struct.bzFile* %20, %struct.bzFile** %18, align 8
  %21 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %22 = icmp eq %struct.bzFile* %21, null
  br i1 %22, label %23, label %38

; <label>:23:                                     ; preds = %7
  %24 = load i32*, i32** %8, align 8
  %25 = icmp ne i32* %24, null
  br i1 %25, label %26, label %29

; <label>:26:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 3)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 3)
  %28 = load i32*, i32** %8, align 8
  store i32 0, i32* %28, align 4
  br label %29

; <label>:29:                                     ; preds = %26, %23
  %30 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %31 = icmp ne %struct.bzFile* %30, null
  br i1 %31, label %32, label %36

; <label>:32:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 4)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 4)
  %34 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %35 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %34, i32 0, i32 5
  store i32 0, i32* %35, align 8
  br label %36

; <label>:36:                                     ; preds = %32, %29
  %pgocount2 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 0)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 0)
  br label %303

; <label>:38:                                     ; preds = %7
  %39 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %40 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %39, i32 0, i32 3
  %41 = load i8, i8* %40, align 4
  %42 = icmp ne i8 %41, 0
  br i1 %42, label %58, label %43

; <label>:43:                                     ; preds = %38
  %44 = load i32*, i32** %8, align 8
  %45 = icmp ne i32* %44, null
  br i1 %45, label %46, label %49

; <label>:46:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 8)
  %47 = add i64 %pgocount3, 1
  store i64 %47, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 8)
  %48 = load i32*, i32** %8, align 8
  store i32 -1, i32* %48, align 4
  br label %49

; <label>:49:                                     ; preds = %46, %43
  %50 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %51 = icmp ne %struct.bzFile* %50, null
  br i1 %51, label %52, label %56

; <label>:52:                                     ; preds = %49
  %pgocount4 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 9)
  %53 = add i64 %pgocount4, 1
  store i64 %53, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 9)
  %54 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %55 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %54, i32 0, i32 5
  store i32 -1, i32* %55, align 8
  br label %56

; <label>:56:                                     ; preds = %52, %49
  %pgocount5 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 5)
  %57 = add i64 %pgocount5, 1
  store i64 %57, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 5)
  br label %303

; <label>:58:                                     ; preds = %38
  %59 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %60 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %59, i32 0, i32 0
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** %60, align 8
  %62 = call i32 @ferror(%struct._IO_FILE* %61) #8
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %64, label %79

; <label>:64:                                     ; preds = %58
  %65 = load i32*, i32** %8, align 8
  %66 = icmp ne i32* %65, null
  br i1 %66, label %67, label %70

; <label>:67:                                     ; preds = %64
  %pgocount6 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 6)
  %68 = add i64 %pgocount6, 1
  store i64 %68, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 6)
  %69 = load i32*, i32** %8, align 8
  store i32 -6, i32* %69, align 4
  br label %70

; <label>:70:                                     ; preds = %67, %64
  %71 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %72 = icmp ne %struct.bzFile* %71, null
  br i1 %72, label %73, label %77

; <label>:73:                                     ; preds = %70
  %pgocount7 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 7)
  %74 = add i64 %pgocount7, 1
  store i64 %74, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 7)
  %75 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %76 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %75, i32 0, i32 5
  store i32 -6, i32* %76, align 8
  br label %77

; <label>:77:                                     ; preds = %73, %70
  %pgocount8 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 2)
  %78 = add i64 %pgocount8, 1
  store i64 %78, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 2)
  br label %303

; <label>:79:                                     ; preds = %58
  %80 = load i32*, i32** %11, align 8
  %81 = icmp ne i32* %80, null
  br i1 %81, label %82, label %85

; <label>:82:                                     ; preds = %79
  %pgocount9 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 14)
  %83 = add i64 %pgocount9, 1
  store i64 %83, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 14)
  %84 = load i32*, i32** %11, align 8
  store i32 0, i32* %84, align 4
  br label %85

; <label>:85:                                     ; preds = %82, %79
  %86 = load i32*, i32** %12, align 8
  %87 = icmp ne i32* %86, null
  br i1 %87, label %88, label %91

; <label>:88:                                     ; preds = %85
  %pgocount10 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 15)
  %89 = add i64 %pgocount10, 1
  store i64 %89, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 15)
  %90 = load i32*, i32** %12, align 8
  store i32 0, i32* %90, align 4
  br label %91

; <label>:91:                                     ; preds = %88, %85
  %92 = load i32*, i32** %13, align 8
  %93 = icmp ne i32* %92, null
  br i1 %93, label %94, label %97

; <label>:94:                                     ; preds = %91
  %pgocount11 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 16)
  %95 = add i64 %pgocount11, 1
  store i64 %95, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 16)
  %96 = load i32*, i32** %13, align 8
  store i32 0, i32* %96, align 4
  br label %97

; <label>:97:                                     ; preds = %94, %91
  %98 = load i32*, i32** %14, align 8
  %99 = icmp ne i32* %98, null
  br i1 %99, label %100, label %103

; <label>:100:                                    ; preds = %97
  %pgocount12 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 17)
  %101 = add i64 %pgocount12, 1
  store i64 %101, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 17)
  %102 = load i32*, i32** %14, align 8
  store i32 0, i32* %102, align 4
  br label %103

; <label>:103:                                    ; preds = %100, %97
  %104 = load i32, i32* %10, align 4
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %206, label %106

; <label>:106:                                    ; preds = %103
  %pgocount13 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 24)
  %107 = add i64 %pgocount13, 1
  store i64 %107, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 24)
  %108 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %109 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %108, i32 0, i32 5
  %110 = load i32, i32* %109, align 8
  %111 = icmp eq i32 %110, 0
  br i1 %111, label %112, label %206

; <label>:112:                                    ; preds = %106
  br label %113

; <label>:113:                                    ; preds = %202, %112
  %114 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %115 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %114, i32 0, i32 4
  %116 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %115, i32 0, i32 5
  store i32 5000, i32* %116, align 8
  %117 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %118 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %117, i32 0, i32 1
  %119 = getelementptr inbounds [5000 x i8], [5000 x i8]* %118, i32 0, i32 0
  %120 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %121 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %120, i32 0, i32 4
  %122 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %121, i32 0, i32 4
  store i8* %119, i8** %122, align 8
  %123 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %124 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %123, i32 0, i32 4
  %125 = call i32 @BZ2_bzCompress(%struct.bz_stream* %124, i32 2)
  store i32 %125, i32* %17, align 4
  %126 = load i32, i32* %17, align 4
  %127 = icmp ne i32 %126, 3
  br i1 %127, label %128, label %149

; <label>:128:                                    ; preds = %113
  %pgocount14 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 10)
  %129 = add i64 %pgocount14, 1
  store i64 %129, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 10)
  %130 = load i32, i32* %17, align 4
  %131 = icmp ne i32 %130, 4
  br i1 %131, label %132, label %149

; <label>:132:                                    ; preds = %128
  %133 = load i32*, i32** %8, align 8
  %134 = icmp ne i32* %133, null
  br i1 %134, label %135, label %139

; <label>:135:                                    ; preds = %132
  %pgocount15 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 35)
  %136 = add i64 %pgocount15, 1
  store i64 %136, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 35)
  %137 = load i32, i32* %17, align 4
  %138 = load i32*, i32** %8, align 8
  store i32 %137, i32* %138, align 4
  br label %139

; <label>:139:                                    ; preds = %135, %132
  %140 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %141 = icmp ne %struct.bzFile* %140, null
  br i1 %141, label %142, label %147

; <label>:142:                                    ; preds = %139
  %pgocount16 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 36)
  %143 = add i64 %pgocount16, 1
  store i64 %143, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 36)
  %144 = load i32, i32* %17, align 4
  %145 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %146 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %145, i32 0, i32 5
  store i32 %144, i32* %146, align 8
  br label %147

; <label>:147:                                    ; preds = %142, %139
  %pgocount17 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 34)
  %148 = add i64 %pgocount17, 1
  store i64 %148, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 34)
  br label %303

; <label>:149:                                    ; preds = %128, %113
  %150 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %151 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %150, i32 0, i32 4
  %152 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %151, i32 0, i32 5
  %153 = load i32, i32* %152, align 8
  %154 = icmp ult i32 %153, 5000
  br i1 %154, label %155, label %198

; <label>:155:                                    ; preds = %149
  %156 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %157 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %156, i32 0, i32 4
  %158 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %157, i32 0, i32 5
  %159 = load i32, i32* %158, align 8
  %160 = sub i32 5000, %159
  store i32 %160, i32* %15, align 4
  %161 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %162 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %161, i32 0, i32 1
  %163 = getelementptr inbounds [5000 x i8], [5000 x i8]* %162, i32 0, i32 0
  %164 = load i32, i32* %15, align 4
  %165 = sext i32 %164 to i64
  %166 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %167 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %166, i32 0, i32 0
  %168 = load %struct._IO_FILE*, %struct._IO_FILE** %167, align 8
  %169 = call i64 @fwrite(i8* %163, i64 1, i64 %165, %struct._IO_FILE* %168)
  %170 = trunc i64 %169 to i32
  store i32 %170, i32* %16, align 4
  %171 = load i32, i32* %15, align 4
  %172 = load i32, i32* %16, align 4
  %173 = icmp ne i32 %171, %172
  br i1 %173, label %181, label %174

; <label>:174:                                    ; preds = %155
  %pgocount18 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 11)
  %175 = add i64 %pgocount18, 1
  store i64 %175, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 11)
  %176 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %177 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %176, i32 0, i32 0
  %178 = load %struct._IO_FILE*, %struct._IO_FILE** %177, align 8
  %179 = call i32 @ferror(%struct._IO_FILE* %178) #8
  %180 = icmp ne i32 %179, 0
  br i1 %180, label %181, label %196

; <label>:181:                                    ; preds = %174, %155
  %182 = load i32*, i32** %8, align 8
  %183 = icmp ne i32* %182, null
  br i1 %183, label %184, label %187

; <label>:184:                                    ; preds = %181
  %pgocount19 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 32)
  %185 = add i64 %pgocount19, 1
  store i64 %185, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 32)
  %186 = load i32*, i32** %8, align 8
  store i32 -6, i32* %186, align 4
  br label %187

; <label>:187:                                    ; preds = %184, %181
  %188 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %189 = icmp ne %struct.bzFile* %188, null
  br i1 %189, label %190, label %194

; <label>:190:                                    ; preds = %187
  %pgocount20 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 33)
  %191 = add i64 %pgocount20, 1
  store i64 %191, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 33)
  %192 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %193 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %192, i32 0, i32 5
  store i32 -6, i32* %193, align 8
  br label %194

; <label>:194:                                    ; preds = %190, %187
  %pgocount21 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 27)
  %195 = add i64 %pgocount21, 1
  store i64 %195, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 27)
  br label %303

; <label>:196:                                    ; preds = %174
  %pgocount22 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 12)
  %197 = add i64 %pgocount22, 1
  store i64 %197, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 12)
  br label %198

; <label>:198:                                    ; preds = %196, %149
  %199 = load i32, i32* %17, align 4
  %200 = icmp eq i32 %199, 4
  br i1 %200, label %201, label %202

; <label>:201:                                    ; preds = %198
  br label %204

; <label>:202:                                    ; preds = %198
  %pgocount23 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 1)
  %203 = add i64 %pgocount23, 1
  store i64 %203, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 1)
  br label %113

; <label>:204:                                    ; preds = %201
  %pgocount24 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 28)
  %205 = add i64 %pgocount24, 1
  store i64 %205, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 28)
  br label %206

; <label>:206:                                    ; preds = %204, %106, %103
  %207 = load i32, i32* %10, align 4
  %208 = icmp ne i32 %207, 0
  br i1 %208, label %243, label %209

; <label>:209:                                    ; preds = %206
  %pgocount25 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 25)
  %210 = add i64 %pgocount25, 1
  store i64 %210, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 25)
  %211 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %212 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %211, i32 0, i32 0
  %213 = load %struct._IO_FILE*, %struct._IO_FILE** %212, align 8
  %214 = call i32 @ferror(%struct._IO_FILE* %213) #8
  %215 = icmp ne i32 %214, 0
  br i1 %215, label %243, label %216

; <label>:216:                                    ; preds = %209
  %217 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %218 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %217, i32 0, i32 0
  %219 = load %struct._IO_FILE*, %struct._IO_FILE** %218, align 8
  %220 = call i32 @fflush(%struct._IO_FILE* %219)
  %221 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %222 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %221, i32 0, i32 0
  %223 = load %struct._IO_FILE*, %struct._IO_FILE** %222, align 8
  %224 = call i32 @ferror(%struct._IO_FILE* %223) #8
  %225 = icmp ne i32 %224, 0
  br i1 %225, label %226, label %241

; <label>:226:                                    ; preds = %216
  %227 = load i32*, i32** %8, align 8
  %228 = icmp ne i32* %227, null
  br i1 %228, label %229, label %232

; <label>:229:                                    ; preds = %226
  %pgocount26 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 29)
  %230 = add i64 %pgocount26, 1
  store i64 %230, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 29)
  %231 = load i32*, i32** %8, align 8
  store i32 -6, i32* %231, align 4
  br label %232

; <label>:232:                                    ; preds = %229, %226
  %233 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %234 = icmp ne %struct.bzFile* %233, null
  br i1 %234, label %235, label %239

; <label>:235:                                    ; preds = %232
  %pgocount27 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 30)
  %236 = add i64 %pgocount27, 1
  store i64 %236, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 30)
  %237 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %238 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %237, i32 0, i32 5
  store i32 -6, i32* %238, align 8
  br label %239

; <label>:239:                                    ; preds = %235, %232
  %pgocount28 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 26)
  %240 = add i64 %pgocount28, 1
  store i64 %240, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 26)
  br label %303

; <label>:241:                                    ; preds = %216
  %pgocount29 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 31)
  %242 = add i64 %pgocount29, 1
  store i64 %242, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 31)
  br label %243

; <label>:243:                                    ; preds = %241, %209, %206
  %244 = load i32*, i32** %11, align 8
  %245 = icmp ne i32* %244, null
  br i1 %245, label %246, label %253

; <label>:246:                                    ; preds = %243
  %pgocount30 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 18)
  %247 = add i64 %pgocount30, 1
  store i64 %247, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 18)
  %248 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %249 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %248, i32 0, i32 4
  %250 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %249, i32 0, i32 2
  %251 = load i32, i32* %250, align 4
  %252 = load i32*, i32** %11, align 8
  store i32 %251, i32* %252, align 4
  br label %253

; <label>:253:                                    ; preds = %246, %243
  %254 = load i32*, i32** %12, align 8
  %255 = icmp ne i32* %254, null
  br i1 %255, label %256, label %263

; <label>:256:                                    ; preds = %253
  %pgocount31 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 19)
  %257 = add i64 %pgocount31, 1
  store i64 %257, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 19)
  %258 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %259 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %258, i32 0, i32 4
  %260 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %259, i32 0, i32 3
  %261 = load i32, i32* %260, align 8
  %262 = load i32*, i32** %12, align 8
  store i32 %261, i32* %262, align 4
  br label %263

; <label>:263:                                    ; preds = %256, %253
  %264 = load i32*, i32** %13, align 8
  %265 = icmp ne i32* %264, null
  br i1 %265, label %266, label %273

; <label>:266:                                    ; preds = %263
  %pgocount32 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 20)
  %267 = add i64 %pgocount32, 1
  store i64 %267, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 20)
  %268 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %269 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %268, i32 0, i32 4
  %270 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %269, i32 0, i32 6
  %271 = load i32, i32* %270, align 4
  %272 = load i32*, i32** %13, align 8
  store i32 %271, i32* %272, align 4
  br label %273

; <label>:273:                                    ; preds = %266, %263
  %274 = load i32*, i32** %14, align 8
  %275 = icmp ne i32* %274, null
  br i1 %275, label %276, label %283

; <label>:276:                                    ; preds = %273
  %pgocount33 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 21)
  %277 = add i64 %pgocount33, 1
  store i64 %277, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 21)
  %278 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %279 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %278, i32 0, i32 4
  %280 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %279, i32 0, i32 7
  %281 = load i32, i32* %280, align 8
  %282 = load i32*, i32** %14, align 8
  store i32 %281, i32* %282, align 4
  br label %283

; <label>:283:                                    ; preds = %276, %273
  %284 = load i32*, i32** %8, align 8
  %285 = icmp ne i32* %284, null
  br i1 %285, label %286, label %289

; <label>:286:                                    ; preds = %283
  %pgocount34 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 22)
  %287 = add i64 %pgocount34, 1
  store i64 %287, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 22)
  %288 = load i32*, i32** %8, align 8
  store i32 0, i32* %288, align 4
  br label %289

; <label>:289:                                    ; preds = %286, %283
  %290 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %291 = icmp ne %struct.bzFile* %290, null
  br i1 %291, label %292, label %296

; <label>:292:                                    ; preds = %289
  %pgocount35 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 23)
  %293 = add i64 %pgocount35, 1
  store i64 %293, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 23)
  %294 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %295 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %294, i32 0, i32 5
  store i32 0, i32* %295, align 8
  br label %296

; <label>:296:                                    ; preds = %292, %289
  %pgocount36 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 13)
  %297 = add i64 %pgocount36, 1
  store i64 %297, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_BZ2_bzWriteClose64, i64 0, i64 13)
  %298 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %299 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %298, i32 0, i32 4
  %300 = call i32 @BZ2_bzCompressEnd(%struct.bz_stream* %299)
  %301 = load %struct.bzFile*, %struct.bzFile** %18, align 8
  %302 = bitcast %struct.bzFile* %301 to i8*
  call void @free(i8* %302) #8
  br label %303

; <label>:303:                                    ; preds = %296, %239, %194, %147, %77, %56, %36
  ret void
}

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i8* @BZ2_bzReadOpen(i32*, %struct._IO_FILE*, i32, i32, i8*, i32) #0 {
  %7 = alloca i8*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca %struct._IO_FILE*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca %struct.bzFile*, align 8
  %15 = alloca i32, align 4
  store i32* %0, i32** %8, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %9, align 8
  store i32 %2, i32* %10, align 4
  store i32 %3, i32* %11, align 4
  store i8* %4, i8** %12, align 8
  store i32 %5, i32* %13, align 4
  store %struct.bzFile* null, %struct.bzFile** %14, align 8
  %16 = load i32*, i32** %8, align 8
  %17 = icmp ne i32* %16, null
  br i1 %17, label %18, label %21

; <label>:18:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 3)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 3)
  %20 = load i32*, i32** %8, align 8
  store i32 0, i32* %20, align 4
  br label %21

; <label>:21:                                     ; preds = %18, %6
  %22 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %23 = icmp ne %struct.bzFile* %22, null
  br i1 %23, label %24, label %28

; <label>:24:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 4)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 4)
  %26 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %27 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %26, i32 0, i32 5
  store i32 0, i32* %27, align 8
  br label %28

; <label>:28:                                     ; preds = %24, %21
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %30 = icmp eq %struct._IO_FILE* %29, null
  br i1 %30, label %67, label %31

; <label>:31:                                     ; preds = %28
  %pgocount3 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 5)
  %32 = add i64 %pgocount3, 1
  store i64 %32, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 5)
  %33 = load i32, i32* %11, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %39

; <label>:35:                                     ; preds = %31
  %pgocount4 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 9)
  %36 = add i64 %pgocount4, 1
  store i64 %36, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 9)
  %37 = load i32, i32* %11, align 4
  %38 = icmp ne i32 %37, 1
  br i1 %38, label %67, label %39

; <label>:39:                                     ; preds = %35, %31
  %40 = load i32, i32* %10, align 4
  %41 = icmp slt i32 %40, 0
  br i1 %41, label %._crit_edge, label %43

._crit_edge:                                      ; preds = %39
  %pgocount5 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 0)
  %42 = add i64 %pgocount5, 1
  store i64 %42, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 0)
  br label %67

; <label>:43:                                     ; preds = %39
  %pgocount6 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 10)
  %44 = add i64 %pgocount6, 1
  store i64 %44, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 10)
  %45 = load i32, i32* %10, align 4
  %46 = icmp sgt i32 %45, 4
  br i1 %46, label %67, label %47

; <label>:47:                                     ; preds = %43
  %pgocount7 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 11)
  %48 = add i64 %pgocount7, 1
  store i64 %48, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 11)
  %49 = load i8*, i8** %12, align 8
  %50 = icmp eq i8* %49, null
  br i1 %50, label %51, label %56

; <label>:51:                                     ; preds = %47
  %pgocount8 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 13)
  %52 = add i64 %pgocount8, 1
  store i64 %52, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 13)
  %53 = load i32, i32* %13, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %67, label %._crit_edge1

._crit_edge1:                                     ; preds = %51
  %pgocount9 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 1)
  %55 = add i64 %pgocount9, 1
  store i64 %55, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 1)
  br label %56

; <label>:56:                                     ; preds = %._crit_edge1, %47
  %57 = load i8*, i8** %12, align 8
  %58 = icmp ne i8* %57, null
  br i1 %58, label %59, label %82

; <label>:59:                                     ; preds = %56
  %pgocount10 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 12)
  %60 = add i64 %pgocount10, 1
  store i64 %60, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 12)
  %61 = load i32, i32* %13, align 4
  %62 = icmp slt i32 %61, 0
  br i1 %62, label %67, label %63

; <label>:63:                                     ; preds = %59
  %pgocount11 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 14)
  %64 = add i64 %pgocount11, 1
  store i64 %64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 14)
  %65 = load i32, i32* %13, align 4
  %66 = icmp sgt i32 %65, 5000
  br i1 %66, label %67, label %82

; <label>:67:                                     ; preds = %63, %59, %51, %43, %._crit_edge, %35, %28
  %68 = load i32*, i32** %8, align 8
  %69 = icmp ne i32* %68, null
  br i1 %69, label %70, label %73

; <label>:70:                                     ; preds = %67
  %pgocount12 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 6)
  %71 = add i64 %pgocount12, 1
  store i64 %71, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 6)
  %72 = load i32*, i32** %8, align 8
  store i32 -2, i32* %72, align 4
  br label %73

; <label>:73:                                     ; preds = %70, %67
  %74 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %75 = icmp ne %struct.bzFile* %74, null
  br i1 %75, label %76, label %80

; <label>:76:                                     ; preds = %73
  %pgocount13 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 7)
  %77 = add i64 %pgocount13, 1
  store i64 %77, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 7)
  %78 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %79 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %78, i32 0, i32 5
  store i32 -2, i32* %79, align 8
  br label %80

; <label>:80:                                     ; preds = %76, %73
  %pgocount14 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 2)
  %81 = add i64 %pgocount14, 1
  store i64 %81, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 2)
  store i8* null, i8** %7, align 8
  br label %220

; <label>:82:                                     ; preds = %63, %56
  %83 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %84 = call i32 @ferror(%struct._IO_FILE* %83) #8
  %85 = icmp ne i32 %84, 0
  br i1 %85, label %86, label %101

; <label>:86:                                     ; preds = %82
  %87 = load i32*, i32** %8, align 8
  %88 = icmp ne i32* %87, null
  br i1 %88, label %89, label %92

; <label>:89:                                     ; preds = %86
  %pgocount15 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 16)
  %90 = add i64 %pgocount15, 1
  store i64 %90, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 16)
  %91 = load i32*, i32** %8, align 8
  store i32 -6, i32* %91, align 4
  br label %92

; <label>:92:                                     ; preds = %89, %86
  %93 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %94 = icmp ne %struct.bzFile* %93, null
  br i1 %94, label %95, label %99

; <label>:95:                                     ; preds = %92
  %pgocount16 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 17)
  %96 = add i64 %pgocount16, 1
  store i64 %96, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 17)
  %97 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %98 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %97, i32 0, i32 5
  store i32 -6, i32* %98, align 8
  br label %99

; <label>:99:                                     ; preds = %95, %92
  %pgocount17 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 15)
  %100 = add i64 %pgocount17, 1
  store i64 %100, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 15)
  store i8* null, i8** %7, align 8
  br label %220

; <label>:101:                                    ; preds = %82
  %102 = call noalias i8* @malloc(i64 5104) #8
  %103 = bitcast i8* %102 to %struct.bzFile*
  store %struct.bzFile* %103, %struct.bzFile** %14, align 8
  %104 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %105 = icmp eq %struct.bzFile* %104, null
  br i1 %105, label %106, label %121

; <label>:106:                                    ; preds = %101
  %107 = load i32*, i32** %8, align 8
  %108 = icmp ne i32* %107, null
  br i1 %108, label %109, label %112

; <label>:109:                                    ; preds = %106
  %pgocount18 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 24)
  %110 = add i64 %pgocount18, 1
  store i64 %110, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 24)
  %111 = load i32*, i32** %8, align 8
  store i32 -3, i32* %111, align 4
  br label %112

; <label>:112:                                    ; preds = %109, %106
  %113 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %114 = icmp ne %struct.bzFile* %113, null
  br i1 %114, label %115, label %119

; <label>:115:                                    ; preds = %112
  %pgocount19 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 25)
  %116 = add i64 %pgocount19, 1
  store i64 %116, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 25)
  %117 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %118 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %117, i32 0, i32 5
  store i32 -3, i32* %118, align 8
  br label %119

; <label>:119:                                    ; preds = %115, %112
  %pgocount20 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 21)
  %120 = add i64 %pgocount20, 1
  store i64 %120, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 21)
  store i8* null, i8** %7, align 8
  br label %220

; <label>:121:                                    ; preds = %101
  %122 = load i32*, i32** %8, align 8
  %123 = icmp ne i32* %122, null
  br i1 %123, label %124, label %127

; <label>:124:                                    ; preds = %121
  %pgocount21 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 18)
  %125 = add i64 %pgocount21, 1
  store i64 %125, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 18)
  %126 = load i32*, i32** %8, align 8
  store i32 0, i32* %126, align 4
  br label %127

; <label>:127:                                    ; preds = %124, %121
  %128 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %129 = icmp ne %struct.bzFile* %128, null
  br i1 %129, label %130, label %134

; <label>:130:                                    ; preds = %127
  %pgocount22 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 19)
  %131 = add i64 %pgocount22, 1
  store i64 %131, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 19)
  %132 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %133 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %132, i32 0, i32 5
  store i32 0, i32* %133, align 8
  br label %134

; <label>:134:                                    ; preds = %130, %127
  %135 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %136 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %135, i32 0, i32 6
  store i8 0, i8* %136, align 4
  %137 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %138 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %139 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %138, i32 0, i32 0
  store %struct._IO_FILE* %137, %struct._IO_FILE** %139, align 8
  %140 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %141 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %140, i32 0, i32 2
  store i32 0, i32* %141, align 8
  %142 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %143 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %142, i32 0, i32 3
  store i8 0, i8* %143, align 4
  %144 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %145 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %144, i32 0, i32 4
  %146 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %145, i32 0, i32 9
  store i8* (i8*, i32, i32)* null, i8* (i8*, i32, i32)** %146, align 8
  %147 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %148 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %147, i32 0, i32 4
  %149 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %148, i32 0, i32 10
  store void (i8*, i8*)* null, void (i8*, i8*)** %149, align 8
  %150 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %151 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %150, i32 0, i32 4
  %152 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %151, i32 0, i32 11
  store i8* null, i8** %152, align 8
  br label %153

; <label>:153:                                    ; preds = %156, %134
  %154 = load i32, i32* %13, align 4
  %155 = icmp sgt i32 %154, 0
  br i1 %155, label %156, label %175

; <label>:156:                                    ; preds = %153
  %pgocount23 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 8)
  %157 = add i64 %pgocount23, 1
  store i64 %157, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 8)
  %158 = load i8*, i8** %12, align 8
  %159 = load i8, i8* %158, align 1
  %160 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %161 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %160, i32 0, i32 1
  %162 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %163 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %162, i32 0, i32 2
  %164 = load i32, i32* %163, align 8
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [5000 x i8], [5000 x i8]* %161, i64 0, i64 %165
  store i8 %159, i8* %166, align 1
  %167 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %168 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %167, i32 0, i32 2
  %169 = load i32, i32* %168, align 8
  %170 = add nsw i32 %169, 1
  store i32 %170, i32* %168, align 8
  %171 = load i8*, i8** %12, align 8
  %172 = getelementptr inbounds i8, i8* %171, i64 1
  store i8* %172, i8** %12, align 8
  %173 = load i32, i32* %13, align 4
  %174 = add nsw i32 %173, -1
  store i32 %174, i32* %13, align 4
  br label %153

; <label>:175:                                    ; preds = %153
  %176 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %177 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %176, i32 0, i32 4
  %178 = load i32, i32* %10, align 4
  %179 = load i32, i32* %11, align 4
  %180 = call i32 @BZ2_bzDecompressInit(%struct.bz_stream* %177, i32 %178, i32 %179)
  store i32 %180, i32* %15, align 4
  %181 = load i32, i32* %15, align 4
  %182 = icmp ne i32 %181, 0
  br i1 %182, label %183, label %202

; <label>:183:                                    ; preds = %175
  %184 = load i32*, i32** %8, align 8
  %185 = icmp ne i32* %184, null
  br i1 %185, label %186, label %190

; <label>:186:                                    ; preds = %183
  %pgocount24 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 22)
  %187 = add i64 %pgocount24, 1
  store i64 %187, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 22)
  %188 = load i32, i32* %15, align 4
  %189 = load i32*, i32** %8, align 8
  store i32 %188, i32* %189, align 4
  br label %190

; <label>:190:                                    ; preds = %186, %183
  %191 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %192 = icmp ne %struct.bzFile* %191, null
  br i1 %192, label %193, label %198

; <label>:193:                                    ; preds = %190
  %pgocount25 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 23)
  %194 = add i64 %pgocount25, 1
  store i64 %194, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 23)
  %195 = load i32, i32* %15, align 4
  %196 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %197 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %196, i32 0, i32 5
  store i32 %195, i32* %197, align 8
  br label %198

; <label>:198:                                    ; preds = %193, %190
  %pgocount26 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 20)
  %199 = add i64 %pgocount26, 1
  store i64 %199, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 20)
  %200 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %201 = bitcast %struct.bzFile* %200 to i8*
  call void @free(i8* %201) #8
  store i8* null, i8** %7, align 8
  br label %220

; <label>:202:                                    ; preds = %175
  %pgocount27 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 26)
  %203 = add i64 %pgocount27, 1
  store i64 %203, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_BZ2_bzReadOpen, i64 0, i64 26)
  %204 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %205 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %204, i32 0, i32 2
  %206 = load i32, i32* %205, align 8
  %207 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %208 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %207, i32 0, i32 4
  %209 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %208, i32 0, i32 1
  store i32 %206, i32* %209, align 8
  %210 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %211 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %210, i32 0, i32 1
  %212 = getelementptr inbounds [5000 x i8], [5000 x i8]* %211, i32 0, i32 0
  %213 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %214 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %213, i32 0, i32 4
  %215 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %214, i32 0, i32 0
  store i8* %212, i8** %215, align 8
  %216 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %217 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %216, i32 0, i32 6
  store i8 1, i8* %217, align 4
  %218 = load %struct.bzFile*, %struct.bzFile** %14, align 8
  %219 = bitcast %struct.bzFile* %218 to i8*
  store i8* %219, i8** %7, align 8
  br label %220

; <label>:220:                                    ; preds = %202, %198, %119, %99, %80
  %221 = load i8*, i8** %7, align 8
  ret i8* %221
}

; Function Attrs: nounwind uwtable
define void @BZ2_bzReadClose(i32*, i8*) #0 {
  %3 = alloca i32*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct.bzFile*, align 8
  store i32* %0, i32** %3, align 8
  store i8* %1, i8** %4, align 8
  %6 = load i8*, i8** %4, align 8
  %7 = bitcast i8* %6 to %struct.bzFile*
  store %struct.bzFile* %7, %struct.bzFile** %5, align 8
  %8 = load i32*, i32** %3, align 8
  %9 = icmp ne i32* %8, null
  br i1 %9, label %10, label %13

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 0)
  %12 = load i32*, i32** %3, align 8
  store i32 0, i32* %12, align 4
  br label %13

; <label>:13:                                     ; preds = %10, %2
  %14 = load %struct.bzFile*, %struct.bzFile** %5, align 8
  %15 = icmp ne %struct.bzFile* %14, null
  br i1 %15, label %16, label %20

; <label>:16:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 1)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 1)
  %18 = load %struct.bzFile*, %struct.bzFile** %5, align 8
  %19 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %18, i32 0, i32 5
  store i32 0, i32* %19, align 8
  br label %20

; <label>:20:                                     ; preds = %16, %13
  %21 = load %struct.bzFile*, %struct.bzFile** %5, align 8
  %22 = icmp eq %struct.bzFile* %21, null
  br i1 %22, label %23, label %38

; <label>:23:                                     ; preds = %20
  %24 = load i32*, i32** %3, align 8
  %25 = icmp ne i32* %24, null
  br i1 %25, label %26, label %29

; <label>:26:                                     ; preds = %23
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 6)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 6)
  %28 = load i32*, i32** %3, align 8
  store i32 0, i32* %28, align 4
  br label %29

; <label>:29:                                     ; preds = %26, %23
  %30 = load %struct.bzFile*, %struct.bzFile** %5, align 8
  %31 = icmp ne %struct.bzFile* %30, null
  br i1 %31, label %32, label %36

; <label>:32:                                     ; preds = %29
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 7)
  %33 = add i64 %pgocount3, 1
  store i64 %33, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 7)
  %34 = load %struct.bzFile*, %struct.bzFile** %5, align 8
  %35 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %34, i32 0, i32 5
  store i32 0, i32* %35, align 8
  br label %36

; <label>:36:                                     ; preds = %32, %29
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 3)
  %37 = add i64 %pgocount4, 1
  store i64 %37, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 3)
  br label %72

; <label>:38:                                     ; preds = %20
  %39 = load %struct.bzFile*, %struct.bzFile** %5, align 8
  %40 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %39, i32 0, i32 3
  %41 = load i8, i8* %40, align 4
  %42 = icmp ne i8 %41, 0
  br i1 %42, label %43, label %58

; <label>:43:                                     ; preds = %38
  %44 = load i32*, i32** %3, align 8
  %45 = icmp ne i32* %44, null
  br i1 %45, label %46, label %49

; <label>:46:                                     ; preds = %43
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 4)
  %47 = add i64 %pgocount5, 1
  store i64 %47, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 4)
  %48 = load i32*, i32** %3, align 8
  store i32 -1, i32* %48, align 4
  br label %49

; <label>:49:                                     ; preds = %46, %43
  %50 = load %struct.bzFile*, %struct.bzFile** %5, align 8
  %51 = icmp ne %struct.bzFile* %50, null
  br i1 %51, label %52, label %56

; <label>:52:                                     ; preds = %49
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 5)
  %53 = add i64 %pgocount6, 1
  store i64 %53, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 5)
  %54 = load %struct.bzFile*, %struct.bzFile** %5, align 8
  %55 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %54, i32 0, i32 5
  store i32 -1, i32* %55, align 8
  br label %56

; <label>:56:                                     ; preds = %52, %49
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 2)
  %57 = add i64 %pgocount7, 1
  store i64 %57, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 2)
  br label %72

; <label>:58:                                     ; preds = %38
  %59 = load %struct.bzFile*, %struct.bzFile** %5, align 8
  %60 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %59, i32 0, i32 6
  %61 = load i8, i8* %60, align 4
  %62 = icmp ne i8 %61, 0
  br i1 %62, label %63, label %68

; <label>:63:                                     ; preds = %58
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 9)
  %64 = add i64 %pgocount8, 1
  store i64 %64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 9)
  %65 = load %struct.bzFile*, %struct.bzFile** %5, align 8
  %66 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %65, i32 0, i32 4
  %67 = call i32 @BZ2_bzDecompressEnd(%struct.bz_stream* %66)
  br label %68

; <label>:68:                                     ; preds = %63, %58
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 8)
  %69 = add i64 %pgocount9, 1
  store i64 %69, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_BZ2_bzReadClose, i64 0, i64 8)
  %70 = load %struct.bzFile*, %struct.bzFile** %5, align 8
  %71 = bitcast %struct.bzFile* %70 to i8*
  call void @free(i8* %71) #8
  br label %72

; <label>:72:                                     ; preds = %68, %56, %36
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @BZ2_bzRead(i32*, i8*, i8*, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct.bzFile*, align 8
  store i32* %0, i32** %6, align 8
  store i8* %1, i8** %7, align 8
  store i8* %2, i8** %8, align 8
  store i32 %3, i32* %9, align 4
  %13 = load i8*, i8** %7, align 8
  %14 = bitcast i8* %13 to %struct.bzFile*
  store %struct.bzFile* %14, %struct.bzFile** %12, align 8
  %15 = load i32*, i32** %6, align 8
  %16 = icmp ne i32* %15, null
  br i1 %16, label %17, label %20

; <label>:17:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 1)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 1)
  %19 = load i32*, i32** %6, align 8
  store i32 0, i32* %19, align 4
  br label %20

; <label>:20:                                     ; preds = %17, %4
  %21 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %22 = icmp ne %struct.bzFile* %21, null
  br i1 %22, label %23, label %27

; <label>:23:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 2)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 2)
  %25 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %26 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %25, i32 0, i32 5
  store i32 0, i32* %26, align 8
  br label %27

; <label>:27:                                     ; preds = %23, %20
  %28 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %29 = icmp eq %struct.bzFile* %28, null
  br i1 %29, label %38, label %30

; <label>:30:                                     ; preds = %27
  %pgocount2 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 3)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 3)
  %32 = load i8*, i8** %8, align 8
  %33 = icmp eq i8* %32, null
  br i1 %33, label %38, label %34

; <label>:34:                                     ; preds = %30
  %pgocount3 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 7)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 7)
  %36 = load i32, i32* %9, align 4
  %37 = icmp slt i32 %36, 0
  br i1 %37, label %38, label %53

; <label>:38:                                     ; preds = %34, %30, %27
  %39 = load i32*, i32** %6, align 8
  %40 = icmp ne i32* %39, null
  br i1 %40, label %41, label %44

; <label>:41:                                     ; preds = %38
  %pgocount4 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 4)
  %42 = add i64 %pgocount4, 1
  store i64 %42, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 4)
  %43 = load i32*, i32** %6, align 8
  store i32 -2, i32* %43, align 4
  br label %44

; <label>:44:                                     ; preds = %41, %38
  %45 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %46 = icmp ne %struct.bzFile* %45, null
  br i1 %46, label %47, label %51

; <label>:47:                                     ; preds = %44
  %pgocount5 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 5)
  %48 = add i64 %pgocount5, 1
  store i64 %48, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 5)
  %49 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %50 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %49, i32 0, i32 5
  store i32 -2, i32* %50, align 8
  br label %51

; <label>:51:                                     ; preds = %47, %44
  %pgocount6 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 0)
  %52 = add i64 %pgocount6, 1
  store i64 %52, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 0)
  store i32 0, i32* %5, align 4
  br label %295

; <label>:53:                                     ; preds = %34
  %54 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %55 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %54, i32 0, i32 3
  %56 = load i8, i8* %55, align 4
  %57 = icmp ne i8 %56, 0
  br i1 %57, label %58, label %73

; <label>:58:                                     ; preds = %53
  %59 = load i32*, i32** %6, align 8
  %60 = icmp ne i32* %59, null
  br i1 %60, label %61, label %64

; <label>:61:                                     ; preds = %58
  %pgocount7 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 13)
  %62 = add i64 %pgocount7, 1
  store i64 %62, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 13)
  %63 = load i32*, i32** %6, align 8
  store i32 -1, i32* %63, align 4
  br label %64

; <label>:64:                                     ; preds = %61, %58
  %65 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %66 = icmp ne %struct.bzFile* %65, null
  br i1 %66, label %67, label %71

; <label>:67:                                     ; preds = %64
  %pgocount8 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 14)
  %68 = add i64 %pgocount8, 1
  store i64 %68, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 14)
  %69 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %70 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %69, i32 0, i32 5
  store i32 -1, i32* %70, align 8
  br label %71

; <label>:71:                                     ; preds = %67, %64
  %pgocount9 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 11)
  %72 = add i64 %pgocount9, 1
  store i64 %72, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 11)
  store i32 0, i32* %5, align 4
  br label %295

; <label>:73:                                     ; preds = %53
  %74 = load i32, i32* %9, align 4
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %91

; <label>:76:                                     ; preds = %73
  %77 = load i32*, i32** %6, align 8
  %78 = icmp ne i32* %77, null
  br i1 %78, label %79, label %82

; <label>:79:                                     ; preds = %76
  %pgocount10 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 18)
  %80 = add i64 %pgocount10, 1
  store i64 %80, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 18)
  %81 = load i32*, i32** %6, align 8
  store i32 0, i32* %81, align 4
  br label %82

; <label>:82:                                     ; preds = %79, %76
  %83 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %84 = icmp ne %struct.bzFile* %83, null
  br i1 %84, label %85, label %89

; <label>:85:                                     ; preds = %82
  %pgocount11 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 19)
  %86 = add i64 %pgocount11, 1
  store i64 %86, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 19)
  %87 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %88 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %87, i32 0, i32 5
  store i32 0, i32* %88, align 8
  br label %89

; <label>:89:                                     ; preds = %85, %82
  %pgocount12 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 17)
  %90 = add i64 %pgocount12, 1
  store i64 %90, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 17)
  store i32 0, i32* %5, align 4
  br label %295

; <label>:91:                                     ; preds = %73
  %92 = load i32, i32* %9, align 4
  %93 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %94 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %93, i32 0, i32 4
  %95 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %94, i32 0, i32 5
  store i32 %92, i32* %95, align 8
  %96 = load i8*, i8** %8, align 8
  %97 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %98 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %97, i32 0, i32 4
  %99 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %98, i32 0, i32 4
  store i8* %96, i8** %99, align 8
  br label %100

; <label>:100:                                    ; preds = %293, %91
  %101 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %102 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %101, i32 0, i32 0
  %103 = load %struct._IO_FILE*, %struct._IO_FILE** %102, align 8
  %104 = call i32 @ferror(%struct._IO_FILE* %103) #8
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %106, label %121

; <label>:106:                                    ; preds = %100
  %107 = load i32*, i32** %6, align 8
  %108 = icmp ne i32* %107, null
  br i1 %108, label %109, label %112

; <label>:109:                                    ; preds = %106
  %pgocount13 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 23)
  %110 = add i64 %pgocount13, 1
  store i64 %110, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 23)
  %111 = load i32*, i32** %6, align 8
  store i32 -6, i32* %111, align 4
  br label %112

; <label>:112:                                    ; preds = %109, %106
  %113 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %114 = icmp ne %struct.bzFile* %113, null
  br i1 %114, label %115, label %119

; <label>:115:                                    ; preds = %112
  %pgocount14 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 24)
  %116 = add i64 %pgocount14, 1
  store i64 %116, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 24)
  %117 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %118 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %117, i32 0, i32 5
  store i32 -6, i32* %118, align 8
  br label %119

; <label>:119:                                    ; preds = %115, %112
  %pgocount15 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 20)
  %120 = add i64 %pgocount15, 1
  store i64 %120, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 20)
  store i32 0, i32* %5, align 4
  br label %295

; <label>:121:                                    ; preds = %100
  %122 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %123 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %122, i32 0, i32 4
  %124 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %123, i32 0, i32 1
  %125 = load i32, i32* %124, align 8
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %127, label %180

; <label>:127:                                    ; preds = %121
  %pgocount16 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 9)
  %128 = add i64 %pgocount16, 1
  store i64 %128, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 9)
  %129 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %130 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %129, i32 0, i32 0
  %131 = load %struct._IO_FILE*, %struct._IO_FILE** %130, align 8
  %132 = call zeroext i8 @myfeof(%struct._IO_FILE* %131)
  %133 = icmp ne i8 %132, 0
  br i1 %133, label %180, label %134

; <label>:134:                                    ; preds = %127
  %135 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %136 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %135, i32 0, i32 1
  %137 = getelementptr inbounds [5000 x i8], [5000 x i8]* %136, i32 0, i32 0
  %138 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %139 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %138, i32 0, i32 0
  %140 = load %struct._IO_FILE*, %struct._IO_FILE** %139, align 8
  %141 = call i64 @fread(i8* %137, i64 1, i64 5000, %struct._IO_FILE* %140)
  %142 = trunc i64 %141 to i32
  store i32 %142, i32* %10, align 4
  %143 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %144 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %143, i32 0, i32 0
  %145 = load %struct._IO_FILE*, %struct._IO_FILE** %144, align 8
  %146 = call i32 @ferror(%struct._IO_FILE* %145) #8
  %147 = icmp ne i32 %146, 0
  br i1 %147, label %148, label %163

; <label>:148:                                    ; preds = %134
  %149 = load i32*, i32** %6, align 8
  %150 = icmp ne i32* %149, null
  br i1 %150, label %151, label %154

; <label>:151:                                    ; preds = %148
  %pgocount17 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 33)
  %152 = add i64 %pgocount17, 1
  store i64 %152, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 33)
  %153 = load i32*, i32** %6, align 8
  store i32 -6, i32* %153, align 4
  br label %154

; <label>:154:                                    ; preds = %151, %148
  %155 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %156 = icmp ne %struct.bzFile* %155, null
  br i1 %156, label %157, label %161

; <label>:157:                                    ; preds = %154
  %pgocount18 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 34)
  %158 = add i64 %pgocount18, 1
  store i64 %158, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 34)
  %159 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %160 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %159, i32 0, i32 5
  store i32 -6, i32* %160, align 8
  br label %161

; <label>:161:                                    ; preds = %157, %154
  %pgocount19 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 32)
  %162 = add i64 %pgocount19, 1
  store i64 %162, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 32)
  store i32 0, i32* %5, align 4
  br label %295

; <label>:163:                                    ; preds = %134
  %pgocount20 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 15)
  %164 = add i64 %pgocount20, 1
  store i64 %164, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 15)
  %165 = load i32, i32* %10, align 4
  %166 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %167 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %166, i32 0, i32 2
  store i32 %165, i32* %167, align 8
  %168 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %169 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %168, i32 0, i32 2
  %170 = load i32, i32* %169, align 8
  %171 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %172 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %171, i32 0, i32 4
  %173 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %172, i32 0, i32 1
  store i32 %170, i32* %173, align 8
  %174 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %175 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %174, i32 0, i32 1
  %176 = getelementptr inbounds [5000 x i8], [5000 x i8]* %175, i32 0, i32 0
  %177 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %178 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %177, i32 0, i32 4
  %179 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %178, i32 0, i32 0
  store i8* %176, i8** %179, align 8
  br label %180

; <label>:180:                                    ; preds = %163, %127, %121
  %181 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %182 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %181, i32 0, i32 4
  %183 = call i32 @BZ2_bzDecompress(%struct.bz_stream* %182)
  store i32 %183, i32* %11, align 4
  %184 = load i32, i32* %11, align 4
  %185 = icmp ne i32 %184, 0
  br i1 %185, label %186, label %207

; <label>:186:                                    ; preds = %180
  %pgocount21 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 8)
  %187 = add i64 %pgocount21, 1
  store i64 %187, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 8)
  %188 = load i32, i32* %11, align 4
  %189 = icmp ne i32 %188, 4
  br i1 %189, label %190, label %207

; <label>:190:                                    ; preds = %186
  %191 = load i32*, i32** %6, align 8
  %192 = icmp ne i32* %191, null
  br i1 %192, label %193, label %197

; <label>:193:                                    ; preds = %190
  %pgocount22 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 30)
  %194 = add i64 %pgocount22, 1
  store i64 %194, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 30)
  %195 = load i32, i32* %11, align 4
  %196 = load i32*, i32** %6, align 8
  store i32 %195, i32* %196, align 4
  br label %197

; <label>:197:                                    ; preds = %193, %190
  %198 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %199 = icmp ne %struct.bzFile* %198, null
  br i1 %199, label %200, label %205

; <label>:200:                                    ; preds = %197
  %pgocount23 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 31)
  %201 = add i64 %pgocount23, 1
  store i64 %201, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 31)
  %202 = load i32, i32* %11, align 4
  %203 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %204 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %203, i32 0, i32 5
  store i32 %202, i32* %204, align 8
  br label %205

; <label>:205:                                    ; preds = %200, %197
  %pgocount24 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 25)
  %206 = add i64 %pgocount24, 1
  store i64 %206, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 25)
  store i32 0, i32* %5, align 4
  br label %295

; <label>:207:                                    ; preds = %186, %180
  %208 = load i32, i32* %11, align 4
  %209 = icmp eq i32 %208, 0
  br i1 %209, label %210, label %247

; <label>:210:                                    ; preds = %207
  %pgocount25 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 10)
  %211 = add i64 %pgocount25, 1
  store i64 %211, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 10)
  %212 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %213 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %212, i32 0, i32 0
  %214 = load %struct._IO_FILE*, %struct._IO_FILE** %213, align 8
  %215 = call zeroext i8 @myfeof(%struct._IO_FILE* %214)
  %216 = zext i8 %215 to i32
  %217 = icmp ne i32 %216, 0
  br i1 %217, label %218, label %247

; <label>:218:                                    ; preds = %210
  %pgocount26 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 12)
  %219 = add i64 %pgocount26, 1
  store i64 %219, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 12)
  %220 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %221 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %220, i32 0, i32 4
  %222 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %221, i32 0, i32 1
  %223 = load i32, i32* %222, align 8
  %224 = icmp eq i32 %223, 0
  br i1 %224, label %225, label %247

; <label>:225:                                    ; preds = %218
  %pgocount27 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 16)
  %226 = add i64 %pgocount27, 1
  store i64 %226, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 16)
  %227 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %228 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %227, i32 0, i32 4
  %229 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %228, i32 0, i32 5
  %230 = load i32, i32* %229, align 8
  %231 = icmp ugt i32 %230, 0
  br i1 %231, label %232, label %247

; <label>:232:                                    ; preds = %225
  %233 = load i32*, i32** %6, align 8
  %234 = icmp ne i32* %233, null
  br i1 %234, label %235, label %238

; <label>:235:                                    ; preds = %232
  %pgocount28 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 36)
  %236 = add i64 %pgocount28, 1
  store i64 %236, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 36)
  %237 = load i32*, i32** %6, align 8
  store i32 -7, i32* %237, align 4
  br label %238

; <label>:238:                                    ; preds = %235, %232
  %239 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %240 = icmp ne %struct.bzFile* %239, null
  br i1 %240, label %241, label %245

; <label>:241:                                    ; preds = %238
  %pgocount29 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 37)
  %242 = add i64 %pgocount29, 1
  store i64 %242, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 37)
  %243 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %244 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %243, i32 0, i32 5
  store i32 -7, i32* %244, align 8
  br label %245

; <label>:245:                                    ; preds = %241, %238
  %pgocount30 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 35)
  %246 = add i64 %pgocount30, 1
  store i64 %246, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 35)
  store i32 0, i32* %5, align 4
  br label %295

; <label>:247:                                    ; preds = %225, %218, %210, %207
  %248 = load i32, i32* %11, align 4
  %249 = icmp eq i32 %248, 4
  br i1 %249, label %250, label %271

; <label>:250:                                    ; preds = %247
  %251 = load i32*, i32** %6, align 8
  %252 = icmp ne i32* %251, null
  br i1 %252, label %253, label %256

; <label>:253:                                    ; preds = %250
  %pgocount31 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 26)
  %254 = add i64 %pgocount31, 1
  store i64 %254, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 26)
  %255 = load i32*, i32** %6, align 8
  store i32 4, i32* %255, align 4
  br label %256

; <label>:256:                                    ; preds = %253, %250
  %257 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %258 = icmp ne %struct.bzFile* %257, null
  br i1 %258, label %259, label %263

; <label>:259:                                    ; preds = %256
  %pgocount32 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 27)
  %260 = add i64 %pgocount32, 1
  store i64 %260, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 27)
  %261 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %262 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %261, i32 0, i32 5
  store i32 4, i32* %262, align 8
  br label %263

; <label>:263:                                    ; preds = %259, %256
  %pgocount33 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 21)
  %264 = add i64 %pgocount33, 1
  store i64 %264, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 21)
  %265 = load i32, i32* %9, align 4
  %266 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %267 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %266, i32 0, i32 4
  %268 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %267, i32 0, i32 5
  %269 = load i32, i32* %268, align 8
  %270 = sub i32 %265, %269
  store i32 %270, i32* %5, align 4
  br label %295

; <label>:271:                                    ; preds = %247
  %272 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %273 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %272, i32 0, i32 4
  %274 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %273, i32 0, i32 5
  %275 = load i32, i32* %274, align 8
  %276 = icmp eq i32 %275, 0
  br i1 %276, label %277, label %293

; <label>:277:                                    ; preds = %271
  %278 = load i32*, i32** %6, align 8
  %279 = icmp ne i32* %278, null
  br i1 %279, label %280, label %283

; <label>:280:                                    ; preds = %277
  %pgocount34 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 28)
  %281 = add i64 %pgocount34, 1
  store i64 %281, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 28)
  %282 = load i32*, i32** %6, align 8
  store i32 0, i32* %282, align 4
  br label %283

; <label>:283:                                    ; preds = %280, %277
  %284 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %285 = icmp ne %struct.bzFile* %284, null
  br i1 %285, label %286, label %290

; <label>:286:                                    ; preds = %283
  %pgocount35 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 29)
  %287 = add i64 %pgocount35, 1
  store i64 %287, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 29)
  %288 = load %struct.bzFile*, %struct.bzFile** %12, align 8
  %289 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %288, i32 0, i32 5
  store i32 0, i32* %289, align 8
  br label %290

; <label>:290:                                    ; preds = %286, %283
  %pgocount36 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 22)
  %291 = add i64 %pgocount36, 1
  store i64 %291, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 22)
  %292 = load i32, i32* %9, align 4
  store i32 %292, i32* %5, align 4
  br label %295

; <label>:293:                                    ; preds = %271
  %pgocount37 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 6)
  %294 = add i64 %pgocount37, 1
  store i64 %294, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_BZ2_bzRead, i64 0, i64 6)
  br label %100

; <label>:295:                                    ; preds = %290, %263, %245, %205, %161, %119, %89, %71, %51
  %296 = load i32, i32* %5, align 4
  ret i32 %296
}

; Function Attrs: nounwind uwtable
define internal zeroext i8 @myfeof(%struct._IO_FILE*) #0 {
  %2 = alloca i8, align 1
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %6 = call i32 @fgetc(%struct._IO_FILE* %5)
  store i32 %6, i32* %4, align 4
  %7 = load i32, i32* %4, align 4
  %8 = icmp eq i32 %7, -1
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_myfeof, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_myfeof, i64 0, i64 1)
  store i8 1, i8* %2, align 1
  br label %16

; <label>:11:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_myfeof, i64 0, i64 0)
  %12 = add i64 %pgocount1, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_myfeof, i64 0, i64 0)
  %13 = load i32, i32* %4, align 4
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %15 = call i32 @ungetc(i32 %13, %struct._IO_FILE* %14)
  store i8 0, i8* %2, align 1
  br label %16

; <label>:16:                                     ; preds = %11, %9
  %17 = load i8, i8* %2, align 1
  ret i8 %17
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @BZ2_bzReadGetUnused(i32*, i8*, i8**, i32*) #0 {
  %5 = alloca i32*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i32*, align 8
  %9 = alloca %struct.bzFile*, align 8
  store i32* %0, i32** %5, align 8
  store i8* %1, i8** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i32* %3, i32** %8, align 8
  %10 = load i8*, i8** %6, align 8
  %11 = bitcast i8* %10 to %struct.bzFile*
  store %struct.bzFile* %11, %struct.bzFile** %9, align 8
  %12 = load %struct.bzFile*, %struct.bzFile** %9, align 8
  %13 = icmp eq %struct.bzFile* %12, null
  br i1 %13, label %14, label %29

; <label>:14:                                     ; preds = %4
  %15 = load i32*, i32** %5, align 8
  %16 = icmp ne i32* %15, null
  br i1 %16, label %17, label %20

; <label>:17:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 2)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 2)
  %19 = load i32*, i32** %5, align 8
  store i32 -2, i32* %19, align 4
  br label %20

; <label>:20:                                     ; preds = %17, %14
  %21 = load %struct.bzFile*, %struct.bzFile** %9, align 8
  %22 = icmp ne %struct.bzFile* %21, null
  br i1 %22, label %23, label %27

; <label>:23:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 3)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 3)
  %25 = load %struct.bzFile*, %struct.bzFile** %9, align 8
  %26 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %25, i32 0, i32 5
  store i32 -2, i32* %26, align 8
  br label %27

; <label>:27:                                     ; preds = %23, %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 0)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 0)
  br label %96

; <label>:29:                                     ; preds = %4
  %30 = load %struct.bzFile*, %struct.bzFile** %9, align 8
  %31 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %30, i32 0, i32 5
  %32 = load i32, i32* %31, align 8
  %33 = icmp ne i32 %32, 4
  br i1 %33, label %34, label %49

; <label>:34:                                     ; preds = %29
  %35 = load i32*, i32** %5, align 8
  %36 = icmp ne i32* %35, null
  br i1 %36, label %37, label %40

; <label>:37:                                     ; preds = %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 4)
  %38 = add i64 %pgocount3, 1
  store i64 %38, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 4)
  %39 = load i32*, i32** %5, align 8
  store i32 -1, i32* %39, align 4
  br label %40

; <label>:40:                                     ; preds = %37, %34
  %41 = load %struct.bzFile*, %struct.bzFile** %9, align 8
  %42 = icmp ne %struct.bzFile* %41, null
  br i1 %42, label %43, label %47

; <label>:43:                                     ; preds = %40
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 5)
  %44 = add i64 %pgocount4, 1
  store i64 %44, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 5)
  %45 = load %struct.bzFile*, %struct.bzFile** %9, align 8
  %46 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %45, i32 0, i32 5
  store i32 -1, i32* %46, align 8
  br label %47

; <label>:47:                                     ; preds = %43, %40
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 1)
  %48 = add i64 %pgocount5, 1
  store i64 %48, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 1)
  br label %96

; <label>:49:                                     ; preds = %29
  %50 = load i8**, i8*** %7, align 8
  %51 = icmp eq i8** %50, null
  br i1 %51, label %56, label %52

; <label>:52:                                     ; preds = %49
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 6)
  %53 = add i64 %pgocount6, 1
  store i64 %53, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 6)
  %54 = load i32*, i32** %8, align 8
  %55 = icmp eq i32* %54, null
  br i1 %55, label %56, label %71

; <label>:56:                                     ; preds = %52, %49
  %57 = load i32*, i32** %5, align 8
  %58 = icmp ne i32* %57, null
  br i1 %58, label %59, label %62

; <label>:59:                                     ; preds = %56
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 9)
  %60 = add i64 %pgocount7, 1
  store i64 %60, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 9)
  %61 = load i32*, i32** %5, align 8
  store i32 -2, i32* %61, align 4
  br label %62

; <label>:62:                                     ; preds = %59, %56
  %63 = load %struct.bzFile*, %struct.bzFile** %9, align 8
  %64 = icmp ne %struct.bzFile* %63, null
  br i1 %64, label %65, label %69

; <label>:65:                                     ; preds = %62
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 10)
  %66 = add i64 %pgocount8, 1
  store i64 %66, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 10)
  %67 = load %struct.bzFile*, %struct.bzFile** %9, align 8
  %68 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %67, i32 0, i32 5
  store i32 -2, i32* %68, align 8
  br label %69

; <label>:69:                                     ; preds = %65, %62
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 7)
  %70 = add i64 %pgocount9, 1
  store i64 %70, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 7)
  br label %96

; <label>:71:                                     ; preds = %52
  %72 = load i32*, i32** %5, align 8
  %73 = icmp ne i32* %72, null
  br i1 %73, label %74, label %77

; <label>:74:                                     ; preds = %71
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 11)
  %75 = add i64 %pgocount10, 1
  store i64 %75, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 11)
  %76 = load i32*, i32** %5, align 8
  store i32 0, i32* %76, align 4
  br label %77

; <label>:77:                                     ; preds = %74, %71
  %78 = load %struct.bzFile*, %struct.bzFile** %9, align 8
  %79 = icmp ne %struct.bzFile* %78, null
  br i1 %79, label %80, label %84

; <label>:80:                                     ; preds = %77
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 12)
  %81 = add i64 %pgocount11, 1
  store i64 %81, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 12)
  %82 = load %struct.bzFile*, %struct.bzFile** %9, align 8
  %83 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %82, i32 0, i32 5
  store i32 0, i32* %83, align 8
  br label %84

; <label>:84:                                     ; preds = %80, %77
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 8)
  %85 = add i64 %pgocount12, 1
  store i64 %85, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_BZ2_bzReadGetUnused, i64 0, i64 8)
  %86 = load %struct.bzFile*, %struct.bzFile** %9, align 8
  %87 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %86, i32 0, i32 4
  %88 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %87, i32 0, i32 1
  %89 = load i32, i32* %88, align 8
  %90 = load i32*, i32** %8, align 8
  store i32 %89, i32* %90, align 4
  %91 = load %struct.bzFile*, %struct.bzFile** %9, align 8
  %92 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %91, i32 0, i32 4
  %93 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %92, i32 0, i32 0
  %94 = load i8*, i8** %93, align 8
  %95 = load i8**, i8*** %7, align 8
  store i8* %94, i8** %95, align 8
  br label %96

; <label>:96:                                     ; preds = %84, %69, %47, %27
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @BZ2_bzBuffToBuffCompress(i8*, i32*, i8*, i32, i32, i32, i32) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca %struct.bz_stream, align 8
  %17 = alloca i32, align 4
  store i8* %0, i8** %9, align 8
  store i32* %1, i32** %10, align 8
  store i8* %2, i8** %11, align 8
  store i32 %3, i32* %12, align 4
  store i32 %4, i32* %13, align 4
  store i32 %5, i32* %14, align 4
  store i32 %6, i32* %15, align 4
  %18 = load i8*, i8** %9, align 8
  %19 = icmp eq i8* %18, null
  br i1 %19, label %52, label %20

; <label>:20:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 1)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 1)
  %22 = load i32*, i32** %10, align 8
  %23 = icmp eq i32* %22, null
  br i1 %23, label %52, label %24

; <label>:24:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 2)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 2)
  %26 = load i8*, i8** %11, align 8
  %27 = icmp eq i8* %26, null
  br i1 %27, label %52, label %28

; <label>:28:                                     ; preds = %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 3)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 3)
  %30 = load i32, i32* %13, align 4
  %31 = icmp slt i32 %30, 1
  br i1 %31, label %52, label %32

; <label>:32:                                     ; preds = %28
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 4)
  %33 = add i64 %pgocount3, 1
  store i64 %33, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 4)
  %34 = load i32, i32* %13, align 4
  %35 = icmp sgt i32 %34, 9
  br i1 %35, label %52, label %36

; <label>:36:                                     ; preds = %32
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 5)
  %37 = add i64 %pgocount4, 1
  store i64 %37, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 5)
  %38 = load i32, i32* %14, align 4
  %39 = icmp slt i32 %38, 0
  br i1 %39, label %52, label %40

; <label>:40:                                     ; preds = %36
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 6)
  %41 = add i64 %pgocount5, 1
  store i64 %41, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 6)
  %42 = load i32, i32* %14, align 4
  %43 = icmp sgt i32 %42, 4
  br i1 %43, label %52, label %44

; <label>:44:                                     ; preds = %40
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 7)
  %45 = add i64 %pgocount6, 1
  store i64 %45, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 7)
  %46 = load i32, i32* %15, align 4
  %47 = icmp slt i32 %46, 0
  br i1 %47, label %52, label %48

; <label>:48:                                     ; preds = %44
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 8)
  %49 = add i64 %pgocount7, 1
  store i64 %49, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 8)
  %50 = load i32, i32* %15, align 4
  %51 = icmp sgt i32 %50, 250
  br i1 %51, label %52, label %54

; <label>:52:                                     ; preds = %48, %44, %40, %36, %32, %28, %24, %20, %7
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 0)
  %53 = add i64 %pgocount8, 1
  store i64 %53, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 0)
  store i32 -2, i32* %8, align 4
  br label %105

; <label>:54:                                     ; preds = %48
  %55 = load i32, i32* %15, align 4
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %59

; <label>:57:                                     ; preds = %54
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 10)
  %58 = add i64 %pgocount9, 1
  store i64 %58, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 10)
  store i32 30, i32* %15, align 4
  br label %59

; <label>:59:                                     ; preds = %57, %54
  %60 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %16, i32 0, i32 9
  store i8* (i8*, i32, i32)* null, i8* (i8*, i32, i32)** %60, align 8
  %61 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %16, i32 0, i32 10
  store void (i8*, i8*)* null, void (i8*, i8*)** %61, align 8
  %62 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %16, i32 0, i32 11
  store i8* null, i8** %62, align 8
  %63 = load i32, i32* %13, align 4
  %64 = load i32, i32* %14, align 4
  %65 = load i32, i32* %15, align 4
  %66 = call i32 @BZ2_bzCompressInit(%struct.bz_stream* %16, i32 %63, i32 %64, i32 %65)
  store i32 %66, i32* %17, align 4
  %67 = load i32, i32* %17, align 4
  %68 = icmp ne i32 %67, 0
  br i1 %68, label %69, label %72

; <label>:69:                                     ; preds = %59
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 9)
  %70 = add i64 %pgocount10, 1
  store i64 %70, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 9)
  %71 = load i32, i32* %17, align 4
  store i32 %71, i32* %8, align 4
  br label %105

; <label>:72:                                     ; preds = %59
  %73 = load i8*, i8** %11, align 8
  %74 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %16, i32 0, i32 0
  store i8* %73, i8** %74, align 8
  %75 = load i8*, i8** %9, align 8
  %76 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %16, i32 0, i32 4
  store i8* %75, i8** %76, align 8
  %77 = load i32, i32* %12, align 4
  %78 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %16, i32 0, i32 1
  store i32 %77, i32* %78, align 8
  %79 = load i32*, i32** %10, align 8
  %80 = load i32, i32* %79, align 4
  %81 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %16, i32 0, i32 5
  store i32 %80, i32* %81, align 8
  %82 = call i32 @BZ2_bzCompress(%struct.bz_stream* %16, i32 2)
  store i32 %82, i32* %17, align 4
  %83 = load i32, i32* %17, align 4
  %84 = icmp eq i32 %83, 3
  br i1 %84, label %85, label %86

; <label>:85:                                     ; preds = %72
  br label %98

; <label>:86:                                     ; preds = %72
  %87 = load i32, i32* %17, align 4
  %88 = icmp ne i32 %87, 4
  br i1 %88, label %89, label %90

; <label>:89:                                     ; preds = %86
  br label %101

; <label>:90:                                     ; preds = %86
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 12)
  %91 = add i64 %pgocount11, 1
  store i64 %91, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 12)
  %92 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %16, i32 0, i32 5
  %93 = load i32, i32* %92, align 8
  %94 = load i32*, i32** %10, align 8
  %95 = load i32, i32* %94, align 4
  %96 = sub i32 %95, %93
  store i32 %96, i32* %94, align 4
  %97 = call i32 @BZ2_bzCompressEnd(%struct.bz_stream* %16)
  store i32 0, i32* %8, align 4
  br label %105

; <label>:98:                                     ; preds = %85
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 11)
  %99 = add i64 %pgocount12, 1
  store i64 %99, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 11)
  %100 = call i32 @BZ2_bzCompressEnd(%struct.bz_stream* %16)
  store i32 -8, i32* %8, align 4
  br label %105

; <label>:101:                                    ; preds = %89
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 13)
  %102 = add i64 %pgocount13, 1
  store i64 %102, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_BZ2_bzBuffToBuffCompress, i64 0, i64 13)
  %103 = call i32 @BZ2_bzCompressEnd(%struct.bz_stream* %16)
  %104 = load i32, i32* %17, align 4
  store i32 %104, i32* %8, align 4
  br label %105

; <label>:105:                                    ; preds = %101, %98, %90, %69, %52
  %106 = load i32, i32* %8, align 4
  ret i32 %106
}

; Function Attrs: nounwind uwtable
define i32 @BZ2_bzBuffToBuffDecompress(i8*, i32*, i8*, i32, i32, i32) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca %struct.bz_stream, align 8
  %15 = alloca i32, align 4
  store i8* %0, i8** %8, align 8
  store i32* %1, i32** %9, align 8
  store i8* %2, i8** %10, align 8
  store i32 %3, i32* %11, align 4
  store i32 %4, i32* %12, align 4
  store i32 %5, i32* %13, align 4
  %16 = load i8*, i8** %8, align 8
  %17 = icmp eq i8* %16, null
  br i1 %17, label %42, label %18

; <label>:18:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 2)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 2)
  %20 = load i32*, i32** %9, align 8
  %21 = icmp eq i32* %20, null
  br i1 %21, label %42, label %22

; <label>:22:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 3)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 3)
  %24 = load i8*, i8** %10, align 8
  %25 = icmp eq i8* %24, null
  br i1 %25, label %42, label %26

; <label>:26:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 4)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 4)
  %28 = load i32, i32* %12, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %34

; <label>:30:                                     ; preds = %26
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 5)
  %31 = add i64 %pgocount3, 1
  store i64 %31, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 5)
  %32 = load i32, i32* %12, align 4
  %33 = icmp ne i32 %32, 1
  br i1 %33, label %42, label %34

; <label>:34:                                     ; preds = %30, %26
  %35 = load i32, i32* %13, align 4
  %36 = icmp slt i32 %35, 0
  br i1 %36, label %._crit_edge, label %38

._crit_edge:                                      ; preds = %34
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 0)
  %37 = add i64 %pgocount4, 1
  store i64 %37, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 0)
  br label %42

; <label>:38:                                     ; preds = %34
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 6)
  %39 = add i64 %pgocount5, 1
  store i64 %39, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 6)
  %40 = load i32, i32* %13, align 4
  %41 = icmp sgt i32 %40, 4
  br i1 %41, label %42, label %44

; <label>:42:                                     ; preds = %38, %._crit_edge, %30, %22, %18, %6
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 1)
  %43 = add i64 %pgocount6, 1
  store i64 %43, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 1)
  store i32 -2, i32* %7, align 4
  br label %96

; <label>:44:                                     ; preds = %38
  %45 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %14, i32 0, i32 9
  store i8* (i8*, i32, i32)* null, i8* (i8*, i32, i32)** %45, align 8
  %46 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %14, i32 0, i32 10
  store void (i8*, i8*)* null, void (i8*, i8*)** %46, align 8
  %47 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %14, i32 0, i32 11
  store i8* null, i8** %47, align 8
  %48 = load i32, i32* %13, align 4
  %49 = load i32, i32* %12, align 4
  %50 = call i32 @BZ2_bzDecompressInit(%struct.bz_stream* %14, i32 %48, i32 %49)
  store i32 %50, i32* %15, align 4
  %51 = load i32, i32* %15, align 4
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %56

; <label>:53:                                     ; preds = %44
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 7)
  %54 = add i64 %pgocount7, 1
  store i64 %54, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 7)
  %55 = load i32, i32* %15, align 4
  store i32 %55, i32* %7, align 4
  br label %96

; <label>:56:                                     ; preds = %44
  %57 = load i8*, i8** %10, align 8
  %58 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %14, i32 0, i32 0
  store i8* %57, i8** %58, align 8
  %59 = load i8*, i8** %8, align 8
  %60 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %14, i32 0, i32 4
  store i8* %59, i8** %60, align 8
  %61 = load i32, i32* %11, align 4
  %62 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %14, i32 0, i32 1
  store i32 %61, i32* %62, align 8
  %63 = load i32*, i32** %9, align 8
  %64 = load i32, i32* %63, align 4
  %65 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %14, i32 0, i32 5
  store i32 %64, i32* %65, align 8
  %66 = call i32 @BZ2_bzDecompress(%struct.bz_stream* %14)
  store i32 %66, i32* %15, align 4
  %67 = load i32, i32* %15, align 4
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %70

; <label>:69:                                     ; preds = %56
  br label %82

; <label>:70:                                     ; preds = %56
  %71 = load i32, i32* %15, align 4
  %72 = icmp ne i32 %71, 4
  br i1 %72, label %73, label %74

; <label>:73:                                     ; preds = %70
  br label %92

; <label>:74:                                     ; preds = %70
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 8)
  %75 = add i64 %pgocount8, 1
  store i64 %75, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 8)
  %76 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %14, i32 0, i32 5
  %77 = load i32, i32* %76, align 8
  %78 = load i32*, i32** %9, align 8
  %79 = load i32, i32* %78, align 4
  %80 = sub i32 %79, %77
  store i32 %80, i32* %78, align 4
  %81 = call i32 @BZ2_bzDecompressEnd(%struct.bz_stream* %14)
  store i32 0, i32* %7, align 4
  br label %96

; <label>:82:                                     ; preds = %69
  %83 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %14, i32 0, i32 5
  %84 = load i32, i32* %83, align 8
  %85 = icmp ugt i32 %84, 0
  br i1 %85, label %86, label %89

; <label>:86:                                     ; preds = %82
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 10)
  %87 = add i64 %pgocount9, 1
  store i64 %87, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 10)
  %88 = call i32 @BZ2_bzDecompressEnd(%struct.bz_stream* %14)
  store i32 -7, i32* %7, align 4
  br label %96

; <label>:89:                                     ; preds = %82
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 11)
  %90 = add i64 %pgocount10, 1
  store i64 %90, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 11)
  %91 = call i32 @BZ2_bzDecompressEnd(%struct.bz_stream* %14)
  store i32 -8, i32* %7, align 4
  br label %96

; <label>:92:                                     ; preds = %73
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 9)
  %93 = add i64 %pgocount11, 1
  store i64 %93, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_BZ2_bzBuffToBuffDecompress, i64 0, i64 9)
  %94 = call i32 @BZ2_bzDecompressEnd(%struct.bz_stream* %14)
  %95 = load i32, i32* %15, align 4
  store i32 %95, i32* %7, align 4
  br label %96

; <label>:96:                                     ; preds = %92, %89, %86, %74, %53, %42
  %97 = load i32, i32* %7, align 4
  ret i32 %97
}

; Function Attrs: nounwind uwtable
define i8* @BZ2_bzopen(i8*, i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BZ2_bzopen, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BZ2_bzopen, i64 0, i64 0)
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %6 = load i8*, i8** %4, align 8
  %7 = load i8*, i8** %5, align 8
  %8 = call i8* @bzopen_or_bzdopen(i8* %6, i32 -1, i8* %7, i32 0)
  ret i8* %8
}

; Function Attrs: nounwind uwtable
define internal i8* @bzopen_or_bzdopen(i8*, i32, i8*, i32) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca [5000 x i8], align 16
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca [10 x i8], align 1
  %15 = alloca %struct._IO_FILE*, align 8
  %16 = alloca i8*, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store i8* %0, i8** %6, align 8
  store i32 %1, i32* %7, align 4
  store i8* %2, i8** %8, align 8
  store i32 %3, i32* %9, align 4
  store i32 9, i32* %12, align 4
  store i32 0, i32* %13, align 4
  %21 = bitcast [10 x i8]* %14 to i8*
  call void @llvm.memset.p0i8.i64(i8* %21, i8 0, i64 10, i32 1, i1 false)
  store %struct._IO_FILE* null, %struct._IO_FILE** %15, align 8
  store i8* null, i8** %16, align 8
  store i32 0, i32* %17, align 4
  store i32 30, i32* %18, align 4
  store i32 0, i32* %19, align 4
  store i32 0, i32* %20, align 4
  %22 = load i8*, i8** %8, align 8
  %23 = icmp eq i8* %22, null
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 5)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 5)
  store i8* null, i8** %5, align 8
  br label %158

; <label>:26:                                     ; preds = %4
  br label %27

; <label>:27:                                     ; preds = %61, %26
  %28 = load i8*, i8** %8, align 8
  %29 = load i8, i8* %28, align 1
  %30 = icmp ne i8 %29, 0
  br i1 %30, label %31, label %64

; <label>:31:                                     ; preds = %27
  %32 = load i8*, i8** %8, align 8
  %33 = load i8, i8* %32, align 1
  %34 = sext i8 %33 to i32
  switch i32 %34, label %41 [
    i32 114, label %35
    i32 119, label %37
    i32 115, label %39
  ]

; <label>:35:                                     ; preds = %31
  %pgocount1 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 0)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 0)
  store i32 0, i32* %13, align 4
  br label %61

; <label>:37:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 1)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 1)
  store i32 1, i32* %13, align 4
  br label %61

; <label>:39:                                     ; preds = %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 2)
  %40 = add i64 %pgocount3, 1
  store i64 %40, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 2)
  store i32 1, i32* %19, align 4
  br label %61

; <label>:41:                                     ; preds = %31
  %42 = call i16** @__ctype_b_loc() #10
  %43 = load i16*, i16** %42, align 8
  %44 = load i8*, i8** %8, align 8
  %45 = load i8, i8* %44, align 1
  %46 = sext i8 %45 to i32
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i16, i16* %43, i64 %47
  %49 = load i16, i16* %48, align 2
  %50 = zext i16 %49 to i32
  %51 = and i32 %50, 2048
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %59

; <label>:53:                                     ; preds = %41
  %pgocount4 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 4)
  %54 = add i64 %pgocount4, 1
  store i64 %54, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 4)
  %55 = load i8*, i8** %8, align 8
  %56 = load i8, i8* %55, align 1
  %57 = sext i8 %56 to i32
  %58 = sub nsw i32 %57, 48
  store i32 %58, i32* %12, align 4
  br label %59

; <label>:59:                                     ; preds = %53, %41
  %pgocount5 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 3)
  %60 = add i64 %pgocount5, 1
  store i64 %60, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 3)
  br label %61

; <label>:61:                                     ; preds = %59, %39, %37, %35
  %62 = load i8*, i8** %8, align 8
  %63 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %63, i8** %8, align 8
  br label %27

; <label>:64:                                     ; preds = %27
  %65 = getelementptr inbounds [10 x i8], [10 x i8]* %14, i32 0, i32 0
  %66 = load i32, i32* %13, align 4
  %67 = icmp ne i32 %66, 0
  %68 = zext i1 %67 to i64
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 18)
  %69 = add i64 %pgocount6, %68
  store i64 %69, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 18)
  %70 = select i1 %67, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0)
  %71 = call i8* @strcat(i8* %65, i8* %70) #8
  %72 = getelementptr inbounds [10 x i8], [10 x i8]* %14, i32 0, i32 0
  %73 = call i8* @strcat(i8* %72, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0)) #8
  %74 = load i32, i32* %9, align 4
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %101

; <label>:76:                                     ; preds = %64
  %77 = load i8*, i8** %6, align 8
  %78 = icmp eq i8* %77, null
  br i1 %78, label %84, label %79

; <label>:79:                                     ; preds = %76
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 8)
  %80 = add i64 %pgocount7, 1
  store i64 %80, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 8)
  %81 = load i8*, i8** %6, align 8
  %82 = call i32 @strcmp(i8* %81, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.9, i32 0, i32 0)) #11
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %95

; <label>:84:                                     ; preds = %79, %76
  %85 = load i32, i32* %13, align 4
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %87, label %90

; <label>:87:                                     ; preds = %84
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 12)
  %88 = add i64 %pgocount8, 1
  store i64 %88, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 12)
  %89 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  br label %93

; <label>:90:                                     ; preds = %84
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 17)
  %91 = add i64 %pgocount9, 1
  store i64 %91, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 17)
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  br label %93

; <label>:93:                                     ; preds = %90, %87
  %94 = phi %struct._IO_FILE* [ %89, %87 ], [ %92, %90 ]
  store %struct._IO_FILE* %94, %struct._IO_FILE** %15, align 8
  br label %100

; <label>:95:                                     ; preds = %79
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 13)
  %96 = add i64 %pgocount10, 1
  store i64 %96, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 13)
  %97 = load i8*, i8** %6, align 8
  %98 = getelementptr inbounds [10 x i8], [10 x i8]* %14, i32 0, i32 0
  %99 = call %struct._IO_FILE* @fopen(i8* %97, i8* %98)
  store %struct._IO_FILE* %99, %struct._IO_FILE** %15, align 8
  br label %100

; <label>:100:                                    ; preds = %95, %93
  br label %105

; <label>:101:                                    ; preds = %64
  %102 = load i32, i32* %7, align 4
  %103 = getelementptr inbounds [10 x i8], [10 x i8]* %14, i32 0, i32 0
  %104 = call %struct._IO_FILE* @fdopen(i32 %102, i8* %103) #8
  store %struct._IO_FILE* %104, %struct._IO_FILE** %15, align 8
  br label %105

; <label>:105:                                    ; preds = %101, %100
  %106 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %107 = icmp eq %struct._IO_FILE* %106, null
  br i1 %107, label %108, label %110

; <label>:108:                                    ; preds = %105
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 7)
  %109 = add i64 %pgocount11, 1
  store i64 %109, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 7)
  store i8* null, i8** %5, align 8
  br label %158

; <label>:110:                                    ; preds = %105
  %111 = load i32, i32* %13, align 4
  %112 = icmp ne i32 %111, 0
  br i1 %112, label %113, label %129

; <label>:113:                                    ; preds = %110
  %114 = load i32, i32* %12, align 4
  %115 = icmp slt i32 %114, 1
  br i1 %115, label %116, label %118

; <label>:116:                                    ; preds = %113
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 14)
  %117 = add i64 %pgocount12, 1
  store i64 %117, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 14)
  store i32 1, i32* %12, align 4
  br label %118

; <label>:118:                                    ; preds = %116, %113
  %119 = load i32, i32* %12, align 4
  %120 = icmp sgt i32 %119, 9
  br i1 %120, label %121, label %123

; <label>:121:                                    ; preds = %118
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 11)
  %122 = add i64 %pgocount13, 1
  store i64 %122, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 11)
  store i32 9, i32* %12, align 4
  br label %123

; <label>:123:                                    ; preds = %121, %118
  %124 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %125 = load i32, i32* %12, align 4
  %126 = load i32, i32* %17, align 4
  %127 = load i32, i32* %18, align 4
  %128 = call i8* @BZ2_bzWriteOpen(i32* %10, %struct._IO_FILE* %124, i32 %125, i32 %126, i32 %127)
  store i8* %128, i8** %16, align 8
  br label %137

; <label>:129:                                    ; preds = %110
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 9)
  %130 = add i64 %pgocount14, 1
  store i64 %130, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 9)
  %131 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %132 = load i32, i32* %17, align 4
  %133 = load i32, i32* %19, align 4
  %134 = getelementptr inbounds [5000 x i8], [5000 x i8]* %11, i32 0, i32 0
  %135 = load i32, i32* %20, align 4
  %136 = call i8* @BZ2_bzReadOpen(i32* %10, %struct._IO_FILE* %131, i32 %132, i32 %133, i8* %134, i32 %135)
  store i8* %136, i8** %16, align 8
  br label %137

; <label>:137:                                    ; preds = %129, %123
  %138 = load i8*, i8** %16, align 8
  %139 = icmp eq i8* %138, null
  br i1 %139, label %140, label %155

; <label>:140:                                    ; preds = %137
  %141 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %142 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %143 = icmp ne %struct._IO_FILE* %141, %142
  br i1 %143, label %144, label %153

; <label>:144:                                    ; preds = %140
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 15)
  %145 = add i64 %pgocount15, 1
  store i64 %145, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 15)
  %146 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %147 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %148 = icmp ne %struct._IO_FILE* %146, %147
  br i1 %148, label %149, label %153

; <label>:149:                                    ; preds = %144
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 16)
  %150 = add i64 %pgocount16, 1
  store i64 %150, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 16)
  %151 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %152 = call i32 @fclose(%struct._IO_FILE* %151)
  br label %153

; <label>:153:                                    ; preds = %149, %144, %140
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 10)
  %154 = add i64 %pgocount17, 1
  store i64 %154, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 10)
  store i8* null, i8** %5, align 8
  br label %158

; <label>:155:                                    ; preds = %137
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 6)
  %156 = add i64 %pgocount18, 1
  store i64 %156, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_bzopen_or_bzdopen, i64 0, i64 6)
  %157 = load i8*, i8** %16, align 8
  store i8* %157, i8** %5, align 8
  br label %158

; <label>:158:                                    ; preds = %155, %153, %108, %24
  %159 = load i8*, i8** %5, align 8
  ret i8* %159
}

; Function Attrs: nounwind uwtable
define i8* @BZ2_bzdopen(i32, i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BZ2_bzdopen, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BZ2_bzdopen, i64 0, i64 0)
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  store i32 %0, i32* %4, align 4
  store i8* %1, i8** %5, align 8
  %6 = load i32, i32* %4, align 4
  %7 = load i8*, i8** %5, align 8
  %8 = call i8* @bzopen_or_bzdopen(i8* null, i32 %6, i8* %7, i32 1)
  ret i8* %8
}

; Function Attrs: nounwind uwtable
define i32 @BZ2_bzread(i8*, i8*, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  %10 = load i8*, i8** %5, align 8
  %11 = bitcast i8* %10 to %struct.bzFile*
  %12 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %11, i32 0, i32 5
  %13 = load i32, i32* %12, align 8
  %14 = icmp eq i32 %13, 4
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BZ2_bzread, i64 0, i64 0)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BZ2_bzread, i64 0, i64 0)
  store i32 0, i32* %4, align 4
  br label %33

; <label>:17:                                     ; preds = %3
  %18 = load i8*, i8** %5, align 8
  %19 = load i8*, i8** %6, align 8
  %20 = load i32, i32* %7, align 4
  %21 = call i32 @BZ2_bzRead(i32* %8, i8* %18, i8* %19, i32 %20)
  store i32 %21, i32* %9, align 4
  %22 = load i32, i32* %8, align 4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %28, label %24

; <label>:24:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BZ2_bzread, i64 0, i64 2)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BZ2_bzread, i64 0, i64 2)
  %26 = load i32, i32* %8, align 4
  %27 = icmp eq i32 %26, 4
  br i1 %27, label %28, label %31

; <label>:28:                                     ; preds = %24, %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BZ2_bzread, i64 0, i64 1)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BZ2_bzread, i64 0, i64 1)
  %30 = load i32, i32* %9, align 4
  store i32 %30, i32* %4, align 4
  br label %33

; <label>:31:                                     ; preds = %24
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BZ2_bzread, i64 0, i64 3)
  %32 = add i64 %pgocount3, 1
  store i64 %32, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BZ2_bzread, i64 0, i64 3)
  store i32 -1, i32* %4, align 4
  br label %33

; <label>:33:                                     ; preds = %31, %28, %15
  %34 = load i32, i32* %4, align 4
  ret i32 %34
}

; Function Attrs: nounwind uwtable
define i32 @BZ2_bzwrite(i8*, i8*, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  %9 = load i8*, i8** %5, align 8
  %10 = load i8*, i8** %6, align 8
  %11 = load i32, i32* %7, align 4
  call void @BZ2_bzWrite(i32* %8, i8* %9, i8* %10, i32 %11)
  %12 = load i32, i32* %8, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %17

; <label>:14:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BZ2_bzwrite, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BZ2_bzwrite, i64 0, i64 1)
  %16 = load i32, i32* %7, align 4
  store i32 %16, i32* %4, align 4
  br label %19

; <label>:17:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BZ2_bzwrite, i64 0, i64 0)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BZ2_bzwrite, i64 0, i64 0)
  store i32 -1, i32* %4, align 4
  br label %19

; <label>:19:                                     ; preds = %17, %14
  %20 = load i32, i32* %4, align 4
  ret i32 %20
}

; Function Attrs: nounwind uwtable
define i32 @BZ2_bzflush(i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BZ2_bzflush, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BZ2_bzflush, i64 0, i64 0)
  %3 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  ret i32 0
}

; Function Attrs: nounwind uwtable
define void @BZ2_bzclose(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct._IO_FILE*, align 8
  store i8* %0, i8** %2, align 8
  %5 = load i8*, i8** %2, align 8
  %6 = icmp eq i8* %5, null
  br i1 %6, label %7, label %9

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BZ2_bzclose, i64 0, i64 2)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BZ2_bzclose, i64 0, i64 2)
  br label %44

; <label>:9:                                      ; preds = %1
  %10 = load i8*, i8** %2, align 8
  %11 = bitcast i8* %10 to %struct.bzFile*
  %12 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %11, i32 0, i32 0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  store %struct._IO_FILE* %13, %struct._IO_FILE** %4, align 8
  %14 = load i8*, i8** %2, align 8
  %15 = bitcast i8* %14 to %struct.bzFile*
  %16 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %15, i32 0, i32 3
  %17 = load i8, i8* %16, align 4
  %18 = icmp ne i8 %17, 0
  br i1 %18, label %19, label %28

; <label>:19:                                     ; preds = %9
  %20 = load i8*, i8** %2, align 8
  call void @BZ2_bzWriteClose(i32* %3, i8* %20, i32 0, i32* null, i32* null)
  %21 = load i32, i32* %3, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %26

; <label>:23:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BZ2_bzclose, i64 0, i64 3)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BZ2_bzclose, i64 0, i64 3)
  %25 = load i8*, i8** %2, align 8
  call void @BZ2_bzWriteClose(i32* null, i8* %25, i32 1, i32* null, i32* null)
  br label %26

; <label>:26:                                     ; preds = %23, %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BZ2_bzclose, i64 0, i64 0)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BZ2_bzclose, i64 0, i64 0)
  br label %31

; <label>:28:                                     ; preds = %9
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BZ2_bzclose, i64 0, i64 5)
  %29 = add i64 %pgocount3, 1
  store i64 %29, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BZ2_bzclose, i64 0, i64 5)
  %30 = load i8*, i8** %2, align 8
  call void @BZ2_bzReadClose(i32* %3, i8* %30)
  br label %31

; <label>:31:                                     ; preds = %28, %26
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %34 = icmp ne %struct._IO_FILE* %32, %33
  br i1 %34, label %35, label %44

; <label>:35:                                     ; preds = %31
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BZ2_bzclose, i64 0, i64 1)
  %36 = add i64 %pgocount4, 1
  store i64 %36, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BZ2_bzclose, i64 0, i64 1)
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %39 = icmp ne %struct._IO_FILE* %37, %38
  br i1 %39, label %40, label %44

; <label>:40:                                     ; preds = %35
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BZ2_bzclose, i64 0, i64 4)
  %41 = add i64 %pgocount5, 1
  store i64 %41, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_BZ2_bzclose, i64 0, i64 4)
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %43 = call i32 @fclose(%struct._IO_FILE* %42)
  br label %44

; <label>:44:                                     ; preds = %40, %35, %31, %7
  ret void
}

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i8* @BZ2_bzerror(i8*, i32*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32* %1, i32** %4, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = bitcast i8* %6 to %struct.bzFile*
  %8 = getelementptr inbounds %struct.bzFile, %struct.bzFile* %7, i32 0, i32 5
  %9 = load i32, i32* %8, align 8
  store i32 %9, i32* %5, align 4
  %10 = load i32, i32* %5, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BZ2_bzerror, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BZ2_bzerror, i64 0, i64 1)
  store i32 0, i32* %5, align 4
  br label %14

; <label>:14:                                     ; preds = %12, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BZ2_bzerror, i64 0, i64 0)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BZ2_bzerror, i64 0, i64 0)
  %16 = load i32, i32* %5, align 4
  %17 = load i32*, i32** %4, align 8
  store i32 %16, i32* %17, align 4
  %18 = load i32, i32* %5, align 4
  %19 = mul nsw i32 %18, -1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [16 x i8*], [16 x i8*]* @bzerrorstrings, i64 0, i64 %20
  %22 = load i8*, i8** %21, align 8
  ret i8* %22
}

; Function Attrs: nounwind uwtable
define internal zeroext i8 @copy_output_until_stop(%struct.EState*) #0 {
  %2 = alloca %struct.EState*, align 8
  %3 = alloca i8, align 1
  store %struct.EState* %0, %struct.EState** %2, align 8
  store i8 0, i8* %3, align 1
  br label %4

; <label>:4:                                      ; preds = %74, %1
  %5 = load %struct.EState*, %struct.EState** %2, align 8
  %6 = getelementptr inbounds %struct.EState, %struct.EState* %5, i32 0, i32 0
  %7 = load %struct.bz_stream*, %struct.bz_stream** %6, align 8
  %8 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %7, i32 0, i32 5
  %9 = load i32, i32* %8, align 8
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_copy_output_until_stop, i64 0, i64 2)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_copy_output_until_stop, i64 0, i64 2)
  br label %76

; <label>:13:                                     ; preds = %4
  %14 = load %struct.EState*, %struct.EState** %2, align 8
  %15 = getelementptr inbounds %struct.EState, %struct.EState* %14, i32 0, i32 20
  %16 = load i32, i32* %15, align 8
  %17 = load %struct.EState*, %struct.EState** %2, align 8
  %18 = getelementptr inbounds %struct.EState, %struct.EState* %17, i32 0, i32 19
  %19 = load i32, i32* %18, align 4
  %20 = icmp sge i32 %16, %19
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_copy_output_until_stop, i64 0, i64 3)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_copy_output_until_stop, i64 0, i64 3)
  br label %76

; <label>:23:                                     ; preds = %13
  store i8 1, i8* %3, align 1
  %24 = load %struct.EState*, %struct.EState** %2, align 8
  %25 = getelementptr inbounds %struct.EState, %struct.EState* %24, i32 0, i32 11
  %26 = load i8*, i8** %25, align 8
  %27 = load %struct.EState*, %struct.EState** %2, align 8
  %28 = getelementptr inbounds %struct.EState, %struct.EState* %27, i32 0, i32 20
  %29 = load i32, i32* %28, align 8
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8, i8* %26, i64 %30
  %32 = load i8, i8* %31, align 1
  %33 = load %struct.EState*, %struct.EState** %2, align 8
  %34 = getelementptr inbounds %struct.EState, %struct.EState* %33, i32 0, i32 0
  %35 = load %struct.bz_stream*, %struct.bz_stream** %34, align 8
  %36 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %35, i32 0, i32 4
  %37 = load i8*, i8** %36, align 8
  store i8 %32, i8* %37, align 1
  %38 = load %struct.EState*, %struct.EState** %2, align 8
  %39 = getelementptr inbounds %struct.EState, %struct.EState* %38, i32 0, i32 20
  %40 = load i32, i32* %39, align 8
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %39, align 8
  %42 = load %struct.EState*, %struct.EState** %2, align 8
  %43 = getelementptr inbounds %struct.EState, %struct.EState* %42, i32 0, i32 0
  %44 = load %struct.bz_stream*, %struct.bz_stream** %43, align 8
  %45 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %44, i32 0, i32 5
  %46 = load i32, i32* %45, align 8
  %47 = add i32 %46, -1
  store i32 %47, i32* %45, align 8
  %48 = load %struct.EState*, %struct.EState** %2, align 8
  %49 = getelementptr inbounds %struct.EState, %struct.EState* %48, i32 0, i32 0
  %50 = load %struct.bz_stream*, %struct.bz_stream** %49, align 8
  %51 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %50, i32 0, i32 4
  %52 = load i8*, i8** %51, align 8
  %53 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %53, i8** %51, align 8
  %54 = load %struct.EState*, %struct.EState** %2, align 8
  %55 = getelementptr inbounds %struct.EState, %struct.EState* %54, i32 0, i32 0
  %56 = load %struct.bz_stream*, %struct.bz_stream** %55, align 8
  %57 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %56, i32 0, i32 6
  %58 = load i32, i32* %57, align 4
  %59 = add i32 %58, 1
  store i32 %59, i32* %57, align 4
  %60 = load %struct.EState*, %struct.EState** %2, align 8
  %61 = getelementptr inbounds %struct.EState, %struct.EState* %60, i32 0, i32 0
  %62 = load %struct.bz_stream*, %struct.bz_stream** %61, align 8
  %63 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %62, i32 0, i32 6
  %64 = load i32, i32* %63, align 4
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %74

; <label>:66:                                     ; preds = %23
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_copy_output_until_stop, i64 0, i64 1)
  %67 = add i64 %pgocount2, 1
  store i64 %67, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_copy_output_until_stop, i64 0, i64 1)
  %68 = load %struct.EState*, %struct.EState** %2, align 8
  %69 = getelementptr inbounds %struct.EState, %struct.EState* %68, i32 0, i32 0
  %70 = load %struct.bz_stream*, %struct.bz_stream** %69, align 8
  %71 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %70, i32 0, i32 7
  %72 = load i32, i32* %71, align 8
  %73 = add i32 %72, 1
  store i32 %73, i32* %71, align 8
  br label %74

; <label>:74:                                     ; preds = %66, %23
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_copy_output_until_stop, i64 0, i64 0)
  %75 = add i64 %pgocount3, 1
  store i64 %75, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_copy_output_until_stop, i64 0, i64 0)
  br label %4

; <label>:76:                                     ; preds = %21, %11
  %77 = load i8, i8* %3, align 1
  ret i8 %77
}

; Function Attrs: nounwind uwtable
define internal zeroext i8 @copy_input_until_stop(%struct.EState*) #0 {
  %2 = alloca %struct.EState*, align 8
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  %6 = alloca i32, align 4
  %7 = alloca i8, align 1
  store %struct.EState* %0, %struct.EState** %2, align 8
  store i8 0, i8* %3, align 1
  %8 = load %struct.EState*, %struct.EState** %2, align 8
  %9 = getelementptr inbounds %struct.EState, %struct.EState* %8, i32 0, i32 1
  %10 = load i32, i32* %9, align 8
  %11 = icmp eq i32 %10, 2
  br i1 %11, label %12, label %166

; <label>:12:                                     ; preds = %1
  br label %13

; <label>:13:                                     ; preds = %164, %12
  %14 = load %struct.EState*, %struct.EState** %2, align 8
  %15 = getelementptr inbounds %struct.EState, %struct.EState* %14, i32 0, i32 17
  %16 = load i32, i32* %15, align 4
  %17 = load %struct.EState*, %struct.EState** %2, align 8
  %18 = getelementptr inbounds %struct.EState, %struct.EState* %17, i32 0, i32 18
  %19 = load i32, i32* %18, align 8
  %20 = icmp sge i32 %16, %19
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 14)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 14)
  br label %165

; <label>:23:                                     ; preds = %13
  %24 = load %struct.EState*, %struct.EState** %2, align 8
  %25 = getelementptr inbounds %struct.EState, %struct.EState* %24, i32 0, i32 0
  %26 = load %struct.bz_stream*, %struct.bz_stream** %25, align 8
  %27 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %26, i32 0, i32 1
  %28 = load i32, i32* %27, align 8
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 15)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 15)
  br label %165

; <label>:32:                                     ; preds = %23
  store i8 1, i8* %3, align 1
  %33 = load %struct.EState*, %struct.EState** %2, align 8
  %34 = getelementptr inbounds %struct.EState, %struct.EState* %33, i32 0, i32 0
  %35 = load %struct.bz_stream*, %struct.bz_stream** %34, align 8
  %36 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %35, i32 0, i32 0
  %37 = load i8*, i8** %36, align 8
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i32
  store i32 %39, i32* %4, align 4
  %40 = load i32, i32* %4, align 4
  %41 = load %struct.EState*, %struct.EState** %2, align 8
  %42 = getelementptr inbounds %struct.EState, %struct.EState* %41, i32 0, i32 13
  %43 = load i32, i32* %42, align 4
  %44 = icmp ne i32 %40, %43
  br i1 %44, label %45, label %97

; <label>:45:                                     ; preds = %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 1)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 1)
  %47 = load %struct.EState*, %struct.EState** %2, align 8
  %48 = getelementptr inbounds %struct.EState, %struct.EState* %47, i32 0, i32 14
  %49 = load i32, i32* %48, align 8
  %50 = icmp eq i32 %49, 1
  br i1 %50, label %51, label %97

; <label>:51:                                     ; preds = %45
  %pgocount3 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 7)
  %52 = add i64 %pgocount3, 1
  store i64 %52, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 7)
  %53 = load %struct.EState*, %struct.EState** %2, align 8
  %54 = getelementptr inbounds %struct.EState, %struct.EState* %53, i32 0, i32 13
  %55 = load i32, i32* %54, align 4
  %56 = trunc i32 %55 to i8
  store i8 %56, i8* %5, align 1
  %57 = load %struct.EState*, %struct.EState** %2, align 8
  %58 = getelementptr inbounds %struct.EState, %struct.EState* %57, i32 0, i32 26
  %59 = load i32, i32* %58, align 8
  %60 = shl i32 %59, 8
  %61 = load %struct.EState*, %struct.EState** %2, align 8
  %62 = getelementptr inbounds %struct.EState, %struct.EState* %61, i32 0, i32 26
  %63 = load i32, i32* %62, align 8
  %64 = lshr i32 %63, 24
  %65 = load i8, i8* %5, align 1
  %66 = zext i8 %65 to i32
  %67 = xor i32 %64, %66
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds [256 x i32], [256 x i32]* @BZ2_crc32Table, i64 0, i64 %68
  %70 = load i32, i32* %69, align 4
  %71 = xor i32 %60, %70
  %72 = load %struct.EState*, %struct.EState** %2, align 8
  %73 = getelementptr inbounds %struct.EState, %struct.EState* %72, i32 0, i32 26
  store i32 %71, i32* %73, align 8
  %74 = load %struct.EState*, %struct.EState** %2, align 8
  %75 = getelementptr inbounds %struct.EState, %struct.EState* %74, i32 0, i32 22
  %76 = load %struct.EState*, %struct.EState** %2, align 8
  %77 = getelementptr inbounds %struct.EState, %struct.EState* %76, i32 0, i32 13
  %78 = load i32, i32* %77, align 4
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds [256 x i8], [256 x i8]* %75, i64 0, i64 %79
  store i8 1, i8* %80, align 1
  %81 = load i8, i8* %5, align 1
  %82 = load %struct.EState*, %struct.EState** %2, align 8
  %83 = getelementptr inbounds %struct.EState, %struct.EState* %82, i32 0, i32 9
  %84 = load i8*, i8** %83, align 8
  %85 = load %struct.EState*, %struct.EState** %2, align 8
  %86 = getelementptr inbounds %struct.EState, %struct.EState* %85, i32 0, i32 17
  %87 = load i32, i32* %86, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i8, i8* %84, i64 %88
  store i8 %81, i8* %89, align 1
  %90 = load %struct.EState*, %struct.EState** %2, align 8
  %91 = getelementptr inbounds %struct.EState, %struct.EState* %90, i32 0, i32 17
  %92 = load i32, i32* %91, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %91, align 4
  %94 = load i32, i32* %4, align 4
  %95 = load %struct.EState*, %struct.EState** %2, align 8
  %96 = getelementptr inbounds %struct.EState, %struct.EState* %95, i32 0, i32 13
  store i32 %94, i32* %96, align 4
  br label %131

; <label>:97:                                     ; preds = %45, %32
  %98 = load i32, i32* %4, align 4
  %99 = load %struct.EState*, %struct.EState** %2, align 8
  %100 = getelementptr inbounds %struct.EState, %struct.EState* %99, i32 0, i32 13
  %101 = load i32, i32* %100, align 4
  %102 = icmp ne i32 %98, %101
  br i1 %102, label %109, label %103

; <label>:103:                                    ; preds = %97
  %pgocount4 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 2)
  %104 = add i64 %pgocount4, 1
  store i64 %104, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 2)
  %105 = load %struct.EState*, %struct.EState** %2, align 8
  %106 = getelementptr inbounds %struct.EState, %struct.EState* %105, i32 0, i32 14
  %107 = load i32, i32* %106, align 8
  %108 = icmp eq i32 %107, 255
  br i1 %108, label %109, label %124

; <label>:109:                                    ; preds = %103, %97
  %110 = load %struct.EState*, %struct.EState** %2, align 8
  %111 = getelementptr inbounds %struct.EState, %struct.EState* %110, i32 0, i32 13
  %112 = load i32, i32* %111, align 4
  %113 = icmp ult i32 %112, 256
  br i1 %113, label %114, label %117

; <label>:114:                                    ; preds = %109
  %pgocount5 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 6)
  %115 = add i64 %pgocount5, 1
  store i64 %115, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 6)
  %116 = load %struct.EState*, %struct.EState** %2, align 8
  call void @add_pair_to_block(%struct.EState* %116)
  br label %117

; <label>:117:                                    ; preds = %114, %109
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 0)
  %118 = add i64 %pgocount6, 1
  store i64 %118, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 0)
  %119 = load i32, i32* %4, align 4
  %120 = load %struct.EState*, %struct.EState** %2, align 8
  %121 = getelementptr inbounds %struct.EState, %struct.EState* %120, i32 0, i32 13
  store i32 %119, i32* %121, align 4
  %122 = load %struct.EState*, %struct.EState** %2, align 8
  %123 = getelementptr inbounds %struct.EState, %struct.EState* %122, i32 0, i32 14
  store i32 1, i32* %123, align 8
  br label %130

; <label>:124:                                    ; preds = %103
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 10)
  %125 = add i64 %pgocount7, 1
  store i64 %125, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 10)
  %126 = load %struct.EState*, %struct.EState** %2, align 8
  %127 = getelementptr inbounds %struct.EState, %struct.EState* %126, i32 0, i32 14
  %128 = load i32, i32* %127, align 8
  %129 = add nsw i32 %128, 1
  store i32 %129, i32* %127, align 8
  br label %130

; <label>:130:                                    ; preds = %124, %117
  br label %131

; <label>:131:                                    ; preds = %130, %51
  %132 = load %struct.EState*, %struct.EState** %2, align 8
  %133 = getelementptr inbounds %struct.EState, %struct.EState* %132, i32 0, i32 0
  %134 = load %struct.bz_stream*, %struct.bz_stream** %133, align 8
  %135 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %134, i32 0, i32 0
  %136 = load i8*, i8** %135, align 8
  %137 = getelementptr inbounds i8, i8* %136, i32 1
  store i8* %137, i8** %135, align 8
  %138 = load %struct.EState*, %struct.EState** %2, align 8
  %139 = getelementptr inbounds %struct.EState, %struct.EState* %138, i32 0, i32 0
  %140 = load %struct.bz_stream*, %struct.bz_stream** %139, align 8
  %141 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %140, i32 0, i32 1
  %142 = load i32, i32* %141, align 8
  %143 = add i32 %142, -1
  store i32 %143, i32* %141, align 8
  %144 = load %struct.EState*, %struct.EState** %2, align 8
  %145 = getelementptr inbounds %struct.EState, %struct.EState* %144, i32 0, i32 0
  %146 = load %struct.bz_stream*, %struct.bz_stream** %145, align 8
  %147 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %146, i32 0, i32 2
  %148 = load i32, i32* %147, align 4
  %149 = add i32 %148, 1
  store i32 %149, i32* %147, align 4
  %150 = load %struct.EState*, %struct.EState** %2, align 8
  %151 = getelementptr inbounds %struct.EState, %struct.EState* %150, i32 0, i32 0
  %152 = load %struct.bz_stream*, %struct.bz_stream** %151, align 8
  %153 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %152, i32 0, i32 2
  %154 = load i32, i32* %153, align 4
  %155 = icmp eq i32 %154, 0
  br i1 %155, label %156, label %164

; <label>:156:                                    ; preds = %131
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 3)
  %157 = add i64 %pgocount8, 1
  store i64 %157, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 3)
  %158 = load %struct.EState*, %struct.EState** %2, align 8
  %159 = getelementptr inbounds %struct.EState, %struct.EState* %158, i32 0, i32 0
  %160 = load %struct.bz_stream*, %struct.bz_stream** %159, align 8
  %161 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %160, i32 0, i32 3
  %162 = load i32, i32* %161, align 8
  %163 = add i32 %162, 1
  store i32 %163, i32* %161, align 8
  br label %164

; <label>:164:                                    ; preds = %156, %131
  br label %13

; <label>:165:                                    ; preds = %30, %21
  br label %331

; <label>:166:                                    ; preds = %1
  br label %167

; <label>:167:                                    ; preds = %325, %166
  %168 = load %struct.EState*, %struct.EState** %2, align 8
  %169 = getelementptr inbounds %struct.EState, %struct.EState* %168, i32 0, i32 17
  %170 = load i32, i32* %169, align 4
  %171 = load %struct.EState*, %struct.EState** %2, align 8
  %172 = getelementptr inbounds %struct.EState, %struct.EState* %171, i32 0, i32 18
  %173 = load i32, i32* %172, align 8
  %174 = icmp sge i32 %170, %173
  br i1 %174, label %175, label %177

; <label>:175:                                    ; preds = %167
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 16)
  %176 = add i64 %pgocount9, 1
  store i64 %176, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 16)
  br label %330

; <label>:177:                                    ; preds = %167
  %178 = load %struct.EState*, %struct.EState** %2, align 8
  %179 = getelementptr inbounds %struct.EState, %struct.EState* %178, i32 0, i32 0
  %180 = load %struct.bz_stream*, %struct.bz_stream** %179, align 8
  %181 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %180, i32 0, i32 1
  %182 = load i32, i32* %181, align 8
  %183 = icmp eq i32 %182, 0
  br i1 %183, label %184, label %186

; <label>:184:                                    ; preds = %177
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 17)
  %185 = add i64 %pgocount10, 1
  store i64 %185, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 17)
  br label %330

; <label>:186:                                    ; preds = %177
  %187 = load %struct.EState*, %struct.EState** %2, align 8
  %188 = getelementptr inbounds %struct.EState, %struct.EState* %187, i32 0, i32 3
  %189 = load i32, i32* %188, align 8
  %190 = icmp eq i32 %189, 0
  br i1 %190, label %191, label %193

; <label>:191:                                    ; preds = %186
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 18)
  %192 = add i64 %pgocount11, 1
  store i64 %192, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 18)
  br label %330

; <label>:193:                                    ; preds = %186
  store i8 1, i8* %3, align 1
  %194 = load %struct.EState*, %struct.EState** %2, align 8
  %195 = getelementptr inbounds %struct.EState, %struct.EState* %194, i32 0, i32 0
  %196 = load %struct.bz_stream*, %struct.bz_stream** %195, align 8
  %197 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %196, i32 0, i32 0
  %198 = load i8*, i8** %197, align 8
  %199 = load i8, i8* %198, align 1
  %200 = zext i8 %199 to i32
  store i32 %200, i32* %6, align 4
  %201 = load i32, i32* %6, align 4
  %202 = load %struct.EState*, %struct.EState** %2, align 8
  %203 = getelementptr inbounds %struct.EState, %struct.EState* %202, i32 0, i32 13
  %204 = load i32, i32* %203, align 4
  %205 = icmp ne i32 %201, %204
  br i1 %205, label %206, label %258

; <label>:206:                                    ; preds = %193
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 5)
  %207 = add i64 %pgocount12, 1
  store i64 %207, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 5)
  %208 = load %struct.EState*, %struct.EState** %2, align 8
  %209 = getelementptr inbounds %struct.EState, %struct.EState* %208, i32 0, i32 14
  %210 = load i32, i32* %209, align 8
  %211 = icmp eq i32 %210, 1
  br i1 %211, label %212, label %258

; <label>:212:                                    ; preds = %206
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 12)
  %213 = add i64 %pgocount13, 1
  store i64 %213, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 12)
  %214 = load %struct.EState*, %struct.EState** %2, align 8
  %215 = getelementptr inbounds %struct.EState, %struct.EState* %214, i32 0, i32 13
  %216 = load i32, i32* %215, align 4
  %217 = trunc i32 %216 to i8
  store i8 %217, i8* %7, align 1
  %218 = load %struct.EState*, %struct.EState** %2, align 8
  %219 = getelementptr inbounds %struct.EState, %struct.EState* %218, i32 0, i32 26
  %220 = load i32, i32* %219, align 8
  %221 = shl i32 %220, 8
  %222 = load %struct.EState*, %struct.EState** %2, align 8
  %223 = getelementptr inbounds %struct.EState, %struct.EState* %222, i32 0, i32 26
  %224 = load i32, i32* %223, align 8
  %225 = lshr i32 %224, 24
  %226 = load i8, i8* %7, align 1
  %227 = zext i8 %226 to i32
  %228 = xor i32 %225, %227
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds [256 x i32], [256 x i32]* @BZ2_crc32Table, i64 0, i64 %229
  %231 = load i32, i32* %230, align 4
  %232 = xor i32 %221, %231
  %233 = load %struct.EState*, %struct.EState** %2, align 8
  %234 = getelementptr inbounds %struct.EState, %struct.EState* %233, i32 0, i32 26
  store i32 %232, i32* %234, align 8
  %235 = load %struct.EState*, %struct.EState** %2, align 8
  %236 = getelementptr inbounds %struct.EState, %struct.EState* %235, i32 0, i32 22
  %237 = load %struct.EState*, %struct.EState** %2, align 8
  %238 = getelementptr inbounds %struct.EState, %struct.EState* %237, i32 0, i32 13
  %239 = load i32, i32* %238, align 4
  %240 = zext i32 %239 to i64
  %241 = getelementptr inbounds [256 x i8], [256 x i8]* %236, i64 0, i64 %240
  store i8 1, i8* %241, align 1
  %242 = load i8, i8* %7, align 1
  %243 = load %struct.EState*, %struct.EState** %2, align 8
  %244 = getelementptr inbounds %struct.EState, %struct.EState* %243, i32 0, i32 9
  %245 = load i8*, i8** %244, align 8
  %246 = load %struct.EState*, %struct.EState** %2, align 8
  %247 = getelementptr inbounds %struct.EState, %struct.EState* %246, i32 0, i32 17
  %248 = load i32, i32* %247, align 4
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds i8, i8* %245, i64 %249
  store i8 %242, i8* %250, align 1
  %251 = load %struct.EState*, %struct.EState** %2, align 8
  %252 = getelementptr inbounds %struct.EState, %struct.EState* %251, i32 0, i32 17
  %253 = load i32, i32* %252, align 4
  %254 = add nsw i32 %253, 1
  store i32 %254, i32* %252, align 4
  %255 = load i32, i32* %6, align 4
  %256 = load %struct.EState*, %struct.EState** %2, align 8
  %257 = getelementptr inbounds %struct.EState, %struct.EState* %256, i32 0, i32 13
  store i32 %255, i32* %257, align 4
  br label %292

; <label>:258:                                    ; preds = %206, %193
  %259 = load i32, i32* %6, align 4
  %260 = load %struct.EState*, %struct.EState** %2, align 8
  %261 = getelementptr inbounds %struct.EState, %struct.EState* %260, i32 0, i32 13
  %262 = load i32, i32* %261, align 4
  %263 = icmp ne i32 %259, %262
  br i1 %263, label %270, label %264

; <label>:264:                                    ; preds = %258
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 8)
  %265 = add i64 %pgocount14, 1
  store i64 %265, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 8)
  %266 = load %struct.EState*, %struct.EState** %2, align 8
  %267 = getelementptr inbounds %struct.EState, %struct.EState* %266, i32 0, i32 14
  %268 = load i32, i32* %267, align 8
  %269 = icmp eq i32 %268, 255
  br i1 %269, label %270, label %285

; <label>:270:                                    ; preds = %264, %258
  %271 = load %struct.EState*, %struct.EState** %2, align 8
  %272 = getelementptr inbounds %struct.EState, %struct.EState* %271, i32 0, i32 13
  %273 = load i32, i32* %272, align 4
  %274 = icmp ult i32 %273, 256
  br i1 %274, label %275, label %278

; <label>:275:                                    ; preds = %270
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 11)
  %276 = add i64 %pgocount15, 1
  store i64 %276, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 11)
  %277 = load %struct.EState*, %struct.EState** %2, align 8
  call void @add_pair_to_block(%struct.EState* %277)
  br label %278

; <label>:278:                                    ; preds = %275, %270
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 4)
  %279 = add i64 %pgocount16, 1
  store i64 %279, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 4)
  %280 = load i32, i32* %6, align 4
  %281 = load %struct.EState*, %struct.EState** %2, align 8
  %282 = getelementptr inbounds %struct.EState, %struct.EState* %281, i32 0, i32 13
  store i32 %280, i32* %282, align 4
  %283 = load %struct.EState*, %struct.EState** %2, align 8
  %284 = getelementptr inbounds %struct.EState, %struct.EState* %283, i32 0, i32 14
  store i32 1, i32* %284, align 8
  br label %291

; <label>:285:                                    ; preds = %264
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 13)
  %286 = add i64 %pgocount17, 1
  store i64 %286, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 13)
  %287 = load %struct.EState*, %struct.EState** %2, align 8
  %288 = getelementptr inbounds %struct.EState, %struct.EState* %287, i32 0, i32 14
  %289 = load i32, i32* %288, align 8
  %290 = add nsw i32 %289, 1
  store i32 %290, i32* %288, align 8
  br label %291

; <label>:291:                                    ; preds = %285, %278
  br label %292

; <label>:292:                                    ; preds = %291, %212
  %293 = load %struct.EState*, %struct.EState** %2, align 8
  %294 = getelementptr inbounds %struct.EState, %struct.EState* %293, i32 0, i32 0
  %295 = load %struct.bz_stream*, %struct.bz_stream** %294, align 8
  %296 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %295, i32 0, i32 0
  %297 = load i8*, i8** %296, align 8
  %298 = getelementptr inbounds i8, i8* %297, i32 1
  store i8* %298, i8** %296, align 8
  %299 = load %struct.EState*, %struct.EState** %2, align 8
  %300 = getelementptr inbounds %struct.EState, %struct.EState* %299, i32 0, i32 0
  %301 = load %struct.bz_stream*, %struct.bz_stream** %300, align 8
  %302 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %301, i32 0, i32 1
  %303 = load i32, i32* %302, align 8
  %304 = add i32 %303, -1
  store i32 %304, i32* %302, align 8
  %305 = load %struct.EState*, %struct.EState** %2, align 8
  %306 = getelementptr inbounds %struct.EState, %struct.EState* %305, i32 0, i32 0
  %307 = load %struct.bz_stream*, %struct.bz_stream** %306, align 8
  %308 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %307, i32 0, i32 2
  %309 = load i32, i32* %308, align 4
  %310 = add i32 %309, 1
  store i32 %310, i32* %308, align 4
  %311 = load %struct.EState*, %struct.EState** %2, align 8
  %312 = getelementptr inbounds %struct.EState, %struct.EState* %311, i32 0, i32 0
  %313 = load %struct.bz_stream*, %struct.bz_stream** %312, align 8
  %314 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %313, i32 0, i32 2
  %315 = load i32, i32* %314, align 4
  %316 = icmp eq i32 %315, 0
  br i1 %316, label %317, label %325

; <label>:317:                                    ; preds = %292
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 9)
  %318 = add i64 %pgocount18, 1
  store i64 %318, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_copy_input_until_stop, i64 0, i64 9)
  %319 = load %struct.EState*, %struct.EState** %2, align 8
  %320 = getelementptr inbounds %struct.EState, %struct.EState* %319, i32 0, i32 0
  %321 = load %struct.bz_stream*, %struct.bz_stream** %320, align 8
  %322 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %321, i32 0, i32 3
  %323 = load i32, i32* %322, align 8
  %324 = add i32 %323, 1
  store i32 %324, i32* %322, align 8
  br label %325

; <label>:325:                                    ; preds = %317, %292
  %326 = load %struct.EState*, %struct.EState** %2, align 8
  %327 = getelementptr inbounds %struct.EState, %struct.EState* %326, i32 0, i32 3
  %328 = load i32, i32* %327, align 8
  %329 = add i32 %328, -1
  store i32 %329, i32* %327, align 8
  br label %167

; <label>:330:                                    ; preds = %191, %184, %175
  br label %331

; <label>:331:                                    ; preds = %330, %165
  %332 = load i8, i8* %3, align 1
  ret i8 %332
}

; Function Attrs: nounwind uwtable
define internal void @flush_RL(%struct.EState*) #0 {
  %2 = alloca %struct.EState*, align 8
  store %struct.EState* %0, %struct.EState** %2, align 8
  %3 = load %struct.EState*, %struct.EState** %2, align 8
  %4 = getelementptr inbounds %struct.EState, %struct.EState* %3, i32 0, i32 13
  %5 = load i32, i32* %4, align 4
  %6 = icmp ult i32 %5, 256
  br i1 %6, label %7, label %10

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_flush_RL, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_flush_RL, i64 0, i64 1)
  %9 = load %struct.EState*, %struct.EState** %2, align 8
  call void @add_pair_to_block(%struct.EState* %9)
  br label %10

; <label>:10:                                     ; preds = %7, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_flush_RL, i64 0, i64 0)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_flush_RL, i64 0, i64 0)
  %12 = load %struct.EState*, %struct.EState** %2, align 8
  call void @init_RL(%struct.EState* %12)
  ret void
}

declare void @BZ2_compressBlock(%struct.EState*, i8 zeroext) #1

; Function Attrs: nounwind uwtable
define internal void @add_pair_to_block(%struct.EState*) #0 {
  %2 = alloca %struct.EState*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  store %struct.EState* %0, %struct.EState** %2, align 8
  %5 = load %struct.EState*, %struct.EState** %2, align 8
  %6 = getelementptr inbounds %struct.EState, %struct.EState* %5, i32 0, i32 13
  %7 = load i32, i32* %6, align 4
  %8 = trunc i32 %7 to i8
  store i8 %8, i8* %4, align 1
  store i32 0, i32* %3, align 4
  br label %9

; <label>:9:                                      ; preds = %33, %1
  %10 = load i32, i32* %3, align 4
  %11 = load %struct.EState*, %struct.EState** %2, align 8
  %12 = getelementptr inbounds %struct.EState, %struct.EState* %11, i32 0, i32 14
  %13 = load i32, i32* %12, align 8
  %14 = icmp slt i32 %10, %13
  br i1 %14, label %15, label %37

; <label>:15:                                     ; preds = %9
  %16 = load %struct.EState*, %struct.EState** %2, align 8
  %17 = getelementptr inbounds %struct.EState, %struct.EState* %16, i32 0, i32 26
  %18 = load i32, i32* %17, align 8
  %19 = shl i32 %18, 8
  %20 = load %struct.EState*, %struct.EState** %2, align 8
  %21 = getelementptr inbounds %struct.EState, %struct.EState* %20, i32 0, i32 26
  %22 = load i32, i32* %21, align 8
  %23 = lshr i32 %22, 24
  %24 = load i8, i8* %4, align 1
  %25 = zext i8 %24 to i32
  %26 = xor i32 %23, %25
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds [256 x i32], [256 x i32]* @BZ2_crc32Table, i64 0, i64 %27
  %29 = load i32, i32* %28, align 4
  %30 = xor i32 %19, %29
  %31 = load %struct.EState*, %struct.EState** %2, align 8
  %32 = getelementptr inbounds %struct.EState, %struct.EState* %31, i32 0, i32 26
  store i32 %30, i32* %32, align 8
  br label %33

; <label>:33:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_add_pair_to_block, i64 0, i64 0)
  %34 = add i64 %pgocount, 1
  store i64 %34, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_add_pair_to_block, i64 0, i64 0)
  %35 = load i32, i32* %3, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %3, align 4
  br label %9

; <label>:37:                                     ; preds = %9
  %38 = load %struct.EState*, %struct.EState** %2, align 8
  %39 = getelementptr inbounds %struct.EState, %struct.EState* %38, i32 0, i32 22
  %40 = load %struct.EState*, %struct.EState** %2, align 8
  %41 = getelementptr inbounds %struct.EState, %struct.EState* %40, i32 0, i32 13
  %42 = load i32, i32* %41, align 4
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds [256 x i8], [256 x i8]* %39, i64 0, i64 %43
  store i8 1, i8* %44, align 1
  %45 = load %struct.EState*, %struct.EState** %2, align 8
  %46 = getelementptr inbounds %struct.EState, %struct.EState* %45, i32 0, i32 14
  %47 = load i32, i32* %46, align 8
  switch i32 %47, label %132 [
    i32 1, label %48
    i32 2, label %63
    i32 3, label %91
  ]

; <label>:48:                                     ; preds = %37
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_add_pair_to_block, i64 0, i64 3)
  %49 = add i64 %pgocount1, 1
  store i64 %49, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_add_pair_to_block, i64 0, i64 3)
  %50 = load i8, i8* %4, align 1
  %51 = load %struct.EState*, %struct.EState** %2, align 8
  %52 = getelementptr inbounds %struct.EState, %struct.EState* %51, i32 0, i32 9
  %53 = load i8*, i8** %52, align 8
  %54 = load %struct.EState*, %struct.EState** %2, align 8
  %55 = getelementptr inbounds %struct.EState, %struct.EState* %54, i32 0, i32 17
  %56 = load i32, i32* %55, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8* %53, i64 %57
  store i8 %50, i8* %58, align 1
  %59 = load %struct.EState*, %struct.EState** %2, align 8
  %60 = getelementptr inbounds %struct.EState, %struct.EState* %59, i32 0, i32 17
  %61 = load i32, i32* %60, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %60, align 4
  br label %211

; <label>:63:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_add_pair_to_block, i64 0, i64 1)
  %64 = add i64 %pgocount2, 1
  store i64 %64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_add_pair_to_block, i64 0, i64 1)
  %65 = load i8, i8* %4, align 1
  %66 = load %struct.EState*, %struct.EState** %2, align 8
  %67 = getelementptr inbounds %struct.EState, %struct.EState* %66, i32 0, i32 9
  %68 = load i8*, i8** %67, align 8
  %69 = load %struct.EState*, %struct.EState** %2, align 8
  %70 = getelementptr inbounds %struct.EState, %struct.EState* %69, i32 0, i32 17
  %71 = load i32, i32* %70, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i8, i8* %68, i64 %72
  store i8 %65, i8* %73, align 1
  %74 = load %struct.EState*, %struct.EState** %2, align 8
  %75 = getelementptr inbounds %struct.EState, %struct.EState* %74, i32 0, i32 17
  %76 = load i32, i32* %75, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, i32* %75, align 4
  %78 = load i8, i8* %4, align 1
  %79 = load %struct.EState*, %struct.EState** %2, align 8
  %80 = getelementptr inbounds %struct.EState, %struct.EState* %79, i32 0, i32 9
  %81 = load i8*, i8** %80, align 8
  %82 = load %struct.EState*, %struct.EState** %2, align 8
  %83 = getelementptr inbounds %struct.EState, %struct.EState* %82, i32 0, i32 17
  %84 = load i32, i32* %83, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i8, i8* %81, i64 %85
  store i8 %78, i8* %86, align 1
  %87 = load %struct.EState*, %struct.EState** %2, align 8
  %88 = getelementptr inbounds %struct.EState, %struct.EState* %87, i32 0, i32 17
  %89 = load i32, i32* %88, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, i32* %88, align 4
  br label %211

; <label>:91:                                     ; preds = %37
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_add_pair_to_block, i64 0, i64 2)
  %92 = add i64 %pgocount3, 1
  store i64 %92, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_add_pair_to_block, i64 0, i64 2)
  %93 = load i8, i8* %4, align 1
  %94 = load %struct.EState*, %struct.EState** %2, align 8
  %95 = getelementptr inbounds %struct.EState, %struct.EState* %94, i32 0, i32 9
  %96 = load i8*, i8** %95, align 8
  %97 = load %struct.EState*, %struct.EState** %2, align 8
  %98 = getelementptr inbounds %struct.EState, %struct.EState* %97, i32 0, i32 17
  %99 = load i32, i32* %98, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i8, i8* %96, i64 %100
  store i8 %93, i8* %101, align 1
  %102 = load %struct.EState*, %struct.EState** %2, align 8
  %103 = getelementptr inbounds %struct.EState, %struct.EState* %102, i32 0, i32 17
  %104 = load i32, i32* %103, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %103, align 4
  %106 = load i8, i8* %4, align 1
  %107 = load %struct.EState*, %struct.EState** %2, align 8
  %108 = getelementptr inbounds %struct.EState, %struct.EState* %107, i32 0, i32 9
  %109 = load i8*, i8** %108, align 8
  %110 = load %struct.EState*, %struct.EState** %2, align 8
  %111 = getelementptr inbounds %struct.EState, %struct.EState* %110, i32 0, i32 17
  %112 = load i32, i32* %111, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i8, i8* %109, i64 %113
  store i8 %106, i8* %114, align 1
  %115 = load %struct.EState*, %struct.EState** %2, align 8
  %116 = getelementptr inbounds %struct.EState, %struct.EState* %115, i32 0, i32 17
  %117 = load i32, i32* %116, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, i32* %116, align 4
  %119 = load i8, i8* %4, align 1
  %120 = load %struct.EState*, %struct.EState** %2, align 8
  %121 = getelementptr inbounds %struct.EState, %struct.EState* %120, i32 0, i32 9
  %122 = load i8*, i8** %121, align 8
  %123 = load %struct.EState*, %struct.EState** %2, align 8
  %124 = getelementptr inbounds %struct.EState, %struct.EState* %123, i32 0, i32 17
  %125 = load i32, i32* %124, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i8, i8* %122, i64 %126
  store i8 %119, i8* %127, align 1
  %128 = load %struct.EState*, %struct.EState** %2, align 8
  %129 = getelementptr inbounds %struct.EState, %struct.EState* %128, i32 0, i32 17
  %130 = load i32, i32* %129, align 4
  %131 = add nsw i32 %130, 1
  store i32 %131, i32* %129, align 4
  br label %211

; <label>:132:                                    ; preds = %37
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_add_pair_to_block, i64 0, i64 4)
  %133 = add i64 %pgocount4, 1
  store i64 %133, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_add_pair_to_block, i64 0, i64 4)
  %134 = load %struct.EState*, %struct.EState** %2, align 8
  %135 = getelementptr inbounds %struct.EState, %struct.EState* %134, i32 0, i32 22
  %136 = load %struct.EState*, %struct.EState** %2, align 8
  %137 = getelementptr inbounds %struct.EState, %struct.EState* %136, i32 0, i32 14
  %138 = load i32, i32* %137, align 8
  %139 = sub nsw i32 %138, 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [256 x i8], [256 x i8]* %135, i64 0, i64 %140
  store i8 1, i8* %141, align 1
  %142 = load i8, i8* %4, align 1
  %143 = load %struct.EState*, %struct.EState** %2, align 8
  %144 = getelementptr inbounds %struct.EState, %struct.EState* %143, i32 0, i32 9
  %145 = load i8*, i8** %144, align 8
  %146 = load %struct.EState*, %struct.EState** %2, align 8
  %147 = getelementptr inbounds %struct.EState, %struct.EState* %146, i32 0, i32 17
  %148 = load i32, i32* %147, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds i8, i8* %145, i64 %149
  store i8 %142, i8* %150, align 1
  %151 = load %struct.EState*, %struct.EState** %2, align 8
  %152 = getelementptr inbounds %struct.EState, %struct.EState* %151, i32 0, i32 17
  %153 = load i32, i32* %152, align 4
  %154 = add nsw i32 %153, 1
  store i32 %154, i32* %152, align 4
  %155 = load i8, i8* %4, align 1
  %156 = load %struct.EState*, %struct.EState** %2, align 8
  %157 = getelementptr inbounds %struct.EState, %struct.EState* %156, i32 0, i32 9
  %158 = load i8*, i8** %157, align 8
  %159 = load %struct.EState*, %struct.EState** %2, align 8
  %160 = getelementptr inbounds %struct.EState, %struct.EState* %159, i32 0, i32 17
  %161 = load i32, i32* %160, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i8, i8* %158, i64 %162
  store i8 %155, i8* %163, align 1
  %164 = load %struct.EState*, %struct.EState** %2, align 8
  %165 = getelementptr inbounds %struct.EState, %struct.EState* %164, i32 0, i32 17
  %166 = load i32, i32* %165, align 4
  %167 = add nsw i32 %166, 1
  store i32 %167, i32* %165, align 4
  %168 = load i8, i8* %4, align 1
  %169 = load %struct.EState*, %struct.EState** %2, align 8
  %170 = getelementptr inbounds %struct.EState, %struct.EState* %169, i32 0, i32 9
  %171 = load i8*, i8** %170, align 8
  %172 = load %struct.EState*, %struct.EState** %2, align 8
  %173 = getelementptr inbounds %struct.EState, %struct.EState* %172, i32 0, i32 17
  %174 = load i32, i32* %173, align 4
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds i8, i8* %171, i64 %175
  store i8 %168, i8* %176, align 1
  %177 = load %struct.EState*, %struct.EState** %2, align 8
  %178 = getelementptr inbounds %struct.EState, %struct.EState* %177, i32 0, i32 17
  %179 = load i32, i32* %178, align 4
  %180 = add nsw i32 %179, 1
  store i32 %180, i32* %178, align 4
  %181 = load i8, i8* %4, align 1
  %182 = load %struct.EState*, %struct.EState** %2, align 8
  %183 = getelementptr inbounds %struct.EState, %struct.EState* %182, i32 0, i32 9
  %184 = load i8*, i8** %183, align 8
  %185 = load %struct.EState*, %struct.EState** %2, align 8
  %186 = getelementptr inbounds %struct.EState, %struct.EState* %185, i32 0, i32 17
  %187 = load i32, i32* %186, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds i8, i8* %184, i64 %188
  store i8 %181, i8* %189, align 1
  %190 = load %struct.EState*, %struct.EState** %2, align 8
  %191 = getelementptr inbounds %struct.EState, %struct.EState* %190, i32 0, i32 17
  %192 = load i32, i32* %191, align 4
  %193 = add nsw i32 %192, 1
  store i32 %193, i32* %191, align 4
  %194 = load %struct.EState*, %struct.EState** %2, align 8
  %195 = getelementptr inbounds %struct.EState, %struct.EState* %194, i32 0, i32 14
  %196 = load i32, i32* %195, align 8
  %197 = sub nsw i32 %196, 4
  %198 = trunc i32 %197 to i8
  %199 = load %struct.EState*, %struct.EState** %2, align 8
  %200 = getelementptr inbounds %struct.EState, %struct.EState* %199, i32 0, i32 9
  %201 = load i8*, i8** %200, align 8
  %202 = load %struct.EState*, %struct.EState** %2, align 8
  %203 = getelementptr inbounds %struct.EState, %struct.EState* %202, i32 0, i32 17
  %204 = load i32, i32* %203, align 4
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds i8, i8* %201, i64 %205
  store i8 %198, i8* %206, align 1
  %207 = load %struct.EState*, %struct.EState** %2, align 8
  %208 = getelementptr inbounds %struct.EState, %struct.EState* %207, i32 0, i32 17
  %209 = load i32, i32* %208, align 4
  %210 = add nsw i32 %209, 1
  store i32 %210, i32* %208, align 4
  br label %211

; <label>:211:                                    ; preds = %132, %91, %63, %48
  ret void
}

declare i32 @fgetc(%struct._IO_FILE*) #1

declare i32 @ungetc(i32, %struct._IO_FILE*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #6

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8*) #4

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #7

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: nounwind
declare %struct._IO_FILE* @fdopen(i32, i8*) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #8

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #8

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #8

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind }
attributes #6 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readnone }
attributes #11 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
