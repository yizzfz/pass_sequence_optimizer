; ModuleID = 'tif_write.2.ll'
source_filename = "tif_write.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@TIFFWriteScanline.module = internal constant [18 x i8] c"TIFFWriteScanline\00", align 16
@.str = private unnamed_addr constant [56 x i8] c"Can not change \22ImageLength\22 when using separate planes\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"%d: Sample out of range, max %d\00", align 1
@TIFFWriteEncodedStrip.module = internal constant [22 x i8] c"TIFFWriteEncodedStrip\00", align 16
@.str.2 = private unnamed_addr constant [56 x i8] c"Can not grow image by strips when using separate planes\00", align 1
@TIFFWriteRawStrip.module = internal constant [18 x i8] c"TIFFWriteRawStrip\00", align 16
@TIFFWriteEncodedTile.module = internal constant [21 x i8] c"TIFFWriteEncodedTile\00", align 16
@.str.3 = private unnamed_addr constant [35 x i8] c"%s: Tile %lu out of range, max %lu\00", align 1
@TIFFWriteRawTile.module = internal constant [17 x i8] c"TIFFWriteRawTile\00", align 16
@TIFFWriteBufferSetup.module = internal constant [21 x i8] c"TIFFWriteBufferSetup\00", align 16
@.str.4 = private unnamed_addr constant [31 x i8] c"%s: No space for output buffer\00", align 1
@.str.5 = private unnamed_addr constant [30 x i8] c"%s: File not open for writing\00", align 1
@.str.6 = private unnamed_addr constant [40 x i8] c"Can not write tiles to a stripped image\00", align 1
@.str.7 = private unnamed_addr constant [41 x i8] c"Can not write scanlines to a tiled image\00", align 1
@.str.8 = private unnamed_addr constant [46 x i8] c"%s: Must set \22ImageWidth\22 before writing data\00", align 1
@.str.9 = private unnamed_addr constant [55 x i8] c"%s: Must set \22PlanarConfiguration\22 before writing data\00", align 1
@.str.10 = private unnamed_addr constant [27 x i8] c"%s: No space for %s arrays\00", align 1
@.str.11 = private unnamed_addr constant [5 x i8] c"tile\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"strip\00", align 1
@.str.13 = private unnamed_addr constant [43 x i8] c"td->td_planarconfig == PLANARCONFIG_CONTIG\00", align 1
@.str.14 = private unnamed_addr constant [12 x i8] c"tif_write.c\00", align 1
@__PRETTY_FUNCTION__.TIFFGrowStrips = private unnamed_addr constant [46 x i8] c"int TIFFGrowStrips(TIFF *, int, const char *)\00", align 1
@.str.15 = private unnamed_addr constant [36 x i8] c"%s: No space to expand strip arrays\00", align 1
@TIFFAppendToStrip.module = internal constant [18 x i8] c"TIFFAppendToStrip\00", align 16
@.str.16 = private unnamed_addr constant [31 x i8] c"%s: Seek error at scanline %lu\00", align 1
@.str.17 = private unnamed_addr constant [32 x i8] c"%s: Write error at scanline %lu\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFWriteScanline = private constant [17 x i8] c"TIFFWriteScanline"
@__profn_tmp1.ll_TIFFWriteCheck = private constant [22 x i8] c"tmp1.ll:TIFFWriteCheck"
@__profn_TIFFWriteBufferSetup = private constant [20 x i8] c"TIFFWriteBufferSetup"
@__profn_tmp1.ll_TIFFGrowStrips = private constant [22 x i8] c"tmp1.ll:TIFFGrowStrips"
@__profn_TIFFWriteEncodedStrip = private constant [21 x i8] c"TIFFWriteEncodedStrip"
@__profn_tmp1.ll_TIFFAppendToStrip = private constant [25 x i8] c"tmp1.ll:TIFFAppendToStrip"
@__profn_TIFFWriteRawStrip = private constant [17 x i8] c"TIFFWriteRawStrip"
@__profn_TIFFWriteTile = private constant [13 x i8] c"TIFFWriteTile"
@__profn_TIFFWriteEncodedTile = private constant [20 x i8] c"TIFFWriteEncodedTile"
@__profn_TIFFWriteRawTile = private constant [16 x i8] c"TIFFWriteRawTile"
@__profn_TIFFFlushData1 = private constant [14 x i8] c"TIFFFlushData1"
@__profn_TIFFSetWriteOffset = private constant [18 x i8] c"TIFFSetWriteOffset"
@__profn_tmp1.ll_TIFFSetupStrips = private constant [23 x i8] c"tmp1.ll:TIFFSetupStrips"
@__profc_TIFFWriteScanline = private global [21 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFWriteScanline = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFWriteScanline = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4539956399580673942, i64 1126161430501535, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @TIFFWriteScanline to i8*), i8* bitcast ([4 x i64]* @__profvp_TIFFWriteScanline to i8*), i32 21, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFWriteCheck = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFWriteCheck = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -380798773623258967, i64 144115275433417825, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFWriteBufferSetup = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFWriteBufferSetup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4832134904367508408, i64 112416846134, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteBufferSetup, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32)* @TIFFWriteBufferSetup to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFGrowStrips = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFGrowStrips = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2781534318534676893, i64 59709442649, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFGrowStrips, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFWriteEncodedStrip = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFWriteEncodedStrip = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFWriteEncodedStrip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1106226508211233425, i64 1126103537118062, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, i8*, i32)* @TIFFWriteEncodedStrip to i8*), i8* bitcast ([4 x i64]* @__profvp_TIFFWriteEncodedStrip to i8*), i32 17, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFAppendToStrip = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_TIFFAppendToStrip = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_TIFFAppendToStrip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8909462832955175099, i64 844503671374697, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFAppendToStrip, i32 0, i32 0), i8* null, i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_TIFFAppendToStrip to i8*), i32 6, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_TIFFWriteRawStrip = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFWriteRawStrip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9030860616879096890, i64 107053625435, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteRawStrip, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, i8*, i32)* @TIFFWriteRawStrip to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFWriteTile = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFWriteTile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2713105579359354088, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFWriteTile, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i32, i32, i16)* @TIFFWriteTile to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFWriteEncodedTile = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFWriteEncodedTile = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFWriteEncodedTile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8998530256048989654, i64 1126090146657443, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, i8*, i32)* @TIFFWriteEncodedTile to i8*), i8* bitcast ([4 x i64]* @__profvp_TIFFWriteEncodedTile to i8*), i32 16, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_TIFFWriteRawTile = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFWriteRawTile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2169330602007668986, i64 65070580171, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFWriteRawTile, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, i8*, i32)* @TIFFWriteRawTile to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFFlushData1 = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFFlushData1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 550143308293642861, i64 79208971457, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFFlushData1, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFFlushData1 to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFSetWriteOffset = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFSetWriteOffset = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 542321100974056302, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSetWriteOffset, i32 0, i32 0), i8* bitcast (void (%struct.tiff*, i32)* @TIFFSetWriteOffset to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFSetupStrips = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFSetupStrips = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3362649137045804081, i64 119900422511, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [15 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [263 x i8] c"\84\02\00TIFFWriteScanline\01tmp1.ll:TIFFWriteCheck\01TIFFWriteBufferSetup\01tmp1.ll:TIFFGrowStrips\01TIFFWriteEncodedStrip\01tmp1.ll:TIFFAppendToStrip\01TIFFWriteRawStrip\01TIFFWriteTile\01TIFFWriteEncodedTile\01TIFFWriteRawTile\01TIFFFlushData1\01TIFFSetWriteOffset\01tmp1.ll:TIFFSetupStrips", section "__llvm_prf_names"
@llvm.used = appending global [15 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteScanline to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFWriteCheck to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteBufferSetup to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFGrowStrips to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteEncodedStrip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFAppendToStrip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteRawStrip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteTile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteEncodedTile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteRawTile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFFlushData1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFSetWriteOffset to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFSetupStrips to i8*), i8* bitcast ([15 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([263 x i8], [263 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFWriteScanline(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca %struct.TIFFDirectory*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  store i32 0, i32* %12, align 4
  %14 = load %struct.tiff*, %struct.tiff** %6, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 3
  %16 = load i32, i32* %15, align 8
  %17 = and i32 %16, 64
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %26, label %19

; <label>:19:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 0)
  %21 = load %struct.tiff*, %struct.tiff** %6, align 8
  %22 = call i32 @TIFFWriteCheck(%struct.tiff* %21, i32 0, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFWriteScanline.module, i32 0, i32 0))
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %26, label %24

; <label>:24:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 2)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 2)
  store i32 -1, i32* %5, align 4
  br label %281

; <label>:26:                                     ; preds = %19, %4
  %27 = load %struct.tiff*, %struct.tiff** %6, align 8
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %27, i32 0, i32 3
  %29 = load i32, i32* %28, align 8
  %30 = and i32 %29, 16
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %39, label %32

; <label>:32:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 1)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 1)
  %34 = load %struct.tiff*, %struct.tiff** %6, align 8
  %35 = call i32 @TIFFWriteBufferSetup(%struct.tiff* %34, i8* null, i32 -1)
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %39, label %37

; <label>:37:                                     ; preds = %32
  %pgocount3 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 6)
  %38 = add i64 %pgocount3, 1
  store i64 %38, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 6)
  store i32 -1, i32* %5, align 4
  br label %281

; <label>:39:                                     ; preds = %32, %26
  %40 = load %struct.tiff*, %struct.tiff** %6, align 8
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %40, i32 0, i32 6
  store %struct.TIFFDirectory* %41, %struct.TIFFDirectory** %10, align 8
  %42 = load i32, i32* %8, align 4
  %43 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %44 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %43, i32 0, i32 2
  %45 = load i32, i32* %44, align 4
  %46 = icmp uge i32 %42, %45
  br i1 %46, label %47, label %64

; <label>:47:                                     ; preds = %39
  %48 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %49 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %48, i32 0, i32 24
  %50 = load i16, i16* %49, align 2
  %51 = zext i16 %50 to i32
  %52 = icmp eq i32 %51, 2
  br i1 %52, label %53, label %58

; <label>:53:                                     ; preds = %47
  %pgocount4 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 3)
  %54 = add i64 %pgocount4, 1
  store i64 %54, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 3)
  %55 = load %struct.tiff*, %struct.tiff** %6, align 8
  %56 = getelementptr inbounds %struct.tiff, %struct.tiff* %55, i32 0, i32 0
  %57 = load i8*, i8** %56, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %57, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str, i32 0, i32 0))
  store i32 -1, i32* %5, align 4
  br label %281

; <label>:58:                                     ; preds = %47
  %pgocount5 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 4)
  %59 = add i64 %pgocount5, 1
  store i64 %59, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 4)
  %60 = load i32, i32* %8, align 4
  %61 = add i32 %60, 1
  %62 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %63 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %62, i32 0, i32 2
  store i32 %61, i32* %63, align 4
  store i32 1, i32* %12, align 4
  br label %64

; <label>:64:                                     ; preds = %58, %39
  %65 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %66 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %65, i32 0, i32 24
  %67 = load i16, i16* %66, align 2
  %68 = zext i16 %67 to i32
  %69 = icmp eq i32 %68, 2
  br i1 %69, label %70, label %103

; <label>:70:                                     ; preds = %64
  %71 = load i16, i16* %9, align 2
  %72 = zext i16 %71 to i32
  %73 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %74 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %73, i32 0, i32 15
  %75 = load i16, i16* %74, align 2
  %76 = zext i16 %75 to i32
  %77 = icmp sge i32 %72, %76
  br i1 %77, label %78, label %89

; <label>:78:                                     ; preds = %70
  %pgocount6 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 7)
  %79 = add i64 %pgocount6, 1
  store i64 %79, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 7)
  %80 = load %struct.tiff*, %struct.tiff** %6, align 8
  %81 = getelementptr inbounds %struct.tiff, %struct.tiff* %80, i32 0, i32 0
  %82 = load i8*, i8** %81, align 8
  %83 = load i16, i16* %9, align 2
  %84 = zext i16 %83 to i32
  %85 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %86 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %85, i32 0, i32 15
  %87 = load i16, i16* %86, align 2
  %88 = zext i16 %87 to i32
  call void (i8*, i8*, ...) @TIFFError(i8* %82, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i32 %84, i32 %88)
  store i32 -1, i32* %5, align 4
  br label %281

; <label>:89:                                     ; preds = %70
  %pgocount7 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 8)
  %90 = add i64 %pgocount7, 1
  store i64 %90, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 8)
  %91 = load i16, i16* %9, align 2
  %92 = zext i16 %91 to i32
  %93 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %94 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %93, i32 0, i32 42
  %95 = load i32, i32* %94, align 8
  %96 = mul i32 %92, %95
  %97 = load i32, i32* %8, align 4
  %98 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %99 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %98, i32 0, i32 16
  %100 = load i32, i32* %99, align 4
  %101 = udiv i32 %97, %100
  %102 = add i32 %96, %101
  store i32 %102, i32* %13, align 4
  br label %109

; <label>:103:                                    ; preds = %64
  %104 = load i32, i32* %8, align 4
  %105 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %106 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %105, i32 0, i32 16
  %107 = load i32, i32* %106, align 4
  %108 = udiv i32 %104, %107
  store i32 %108, i32* %13, align 4
  br label %109

; <label>:109:                                    ; preds = %103, %89
  %110 = load i32, i32* %13, align 4
  %111 = load %struct.tiff*, %struct.tiff** %6, align 8
  %112 = getelementptr inbounds %struct.tiff, %struct.tiff* %111, i32 0, i32 13
  %113 = load i32, i32* %112, align 8
  %114 = icmp ne i32 %110, %113
  br i1 %114, label %115, label %200

; <label>:115:                                    ; preds = %109
  %116 = load %struct.tiff*, %struct.tiff** %6, align 8
  %117 = call i32 @TIFFFlushData(%struct.tiff* %116)
  %118 = icmp ne i32 %117, 0
  br i1 %118, label %121, label %119

; <label>:119:                                    ; preds = %115
  %pgocount8 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 10)
  %120 = add i64 %pgocount8, 1
  store i64 %120, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 10)
  store i32 -1, i32* %5, align 4
  br label %281

; <label>:121:                                    ; preds = %115
  %122 = load i32, i32* %13, align 4
  %123 = load %struct.tiff*, %struct.tiff** %6, align 8
  %124 = getelementptr inbounds %struct.tiff, %struct.tiff* %123, i32 0, i32 13
  store i32 %122, i32* %124, align 8
  %125 = load i32, i32* %13, align 4
  %126 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %127 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %126, i32 0, i32 42
  %128 = load i32, i32* %127, align 8
  %129 = icmp uge i32 %125, %128
  br i1 %129, label %130, label %150

; <label>:130:                                    ; preds = %121
  %pgocount9 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 12)
  %131 = add i64 %pgocount9, 1
  store i64 %131, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 12)
  %132 = load i32, i32* %12, align 4
  %133 = icmp ne i32 %132, 0
  br i1 %133, label %134, label %150

; <label>:134:                                    ; preds = %130
  %pgocount10 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 16)
  %135 = add i64 %pgocount10, 1
  store i64 %135, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 16)
  %136 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %137 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %136, i32 0, i32 2
  %138 = load i32, i32* %137, align 4
  %139 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %140 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %139, i32 0, i32 16
  %141 = load i32, i32* %140, align 4
  %142 = sub i32 %141, 1
  %143 = add i32 %138, %142
  %144 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %145 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %144, i32 0, i32 16
  %146 = load i32, i32* %145, align 4
  %147 = udiv i32 %143, %146
  %148 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %149 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %148, i32 0, i32 42
  store i32 %147, i32* %149, align 8
  br label %150

; <label>:150:                                    ; preds = %134, %130, %121
  %151 = load i32, i32* %13, align 4
  %152 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %153 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %152, i32 0, i32 42
  %154 = load i32, i32* %153, align 8
  %155 = urem i32 %151, %154
  %156 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %157 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %156, i32 0, i32 16
  %158 = load i32, i32* %157, align 4
  %159 = mul i32 %155, %158
  %160 = load %struct.tiff*, %struct.tiff** %6, align 8
  %161 = getelementptr inbounds %struct.tiff, %struct.tiff* %160, i32 0, i32 11
  store i32 %159, i32* %161, align 8
  %162 = load %struct.tiff*, %struct.tiff** %6, align 8
  %163 = getelementptr inbounds %struct.tiff, %struct.tiff* %162, i32 0, i32 3
  %164 = load i32, i32* %163, align 8
  %165 = and i32 %164, 32
  %166 = icmp eq i32 %165, 0
  br i1 %166, label %167, label %183

; <label>:167:                                    ; preds = %150
  %168 = load %struct.tiff*, %struct.tiff** %6, align 8
  %169 = getelementptr inbounds %struct.tiff, %struct.tiff* %168, i32 0, i32 23
  %170 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %169, align 8
  %171 = load %struct.tiff*, %struct.tiff** %6, align 8
  %172 = ptrtoint i32 (%struct.tiff*)* %170 to i64
  call void @__llvm_profile_instrument_target(i64 %172, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteScanline to i8*), i32 0)
  %173 = call i32 %170(%struct.tiff* %171)
  %174 = icmp ne i32 %173, 0
  br i1 %174, label %177, label %175

; <label>:175:                                    ; preds = %167
  %pgocount11 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 20)
  %176 = add i64 %pgocount11, 1
  store i64 %176, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 20)
  store i32 -1, i32* %5, align 4
  br label %281

; <label>:177:                                    ; preds = %167
  %pgocount12 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 17)
  %178 = add i64 %pgocount12, 1
  store i64 %178, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 17)
  %179 = load %struct.tiff*, %struct.tiff** %6, align 8
  %180 = getelementptr inbounds %struct.tiff, %struct.tiff* %179, i32 0, i32 3
  %181 = load i32, i32* %180, align 8
  %182 = or i32 %181, 32
  store i32 %182, i32* %180, align 8
  br label %183

; <label>:183:                                    ; preds = %177, %150
  %184 = load %struct.tiff*, %struct.tiff** %6, align 8
  %185 = getelementptr inbounds %struct.tiff, %struct.tiff* %184, i32 0, i32 24
  %186 = load i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*, i16)** %185, align 8
  %187 = load %struct.tiff*, %struct.tiff** %6, align 8
  %188 = load i16, i16* %9, align 2
  %189 = ptrtoint i32 (%struct.tiff*, i16)* %186 to i64
  call void @__llvm_profile_instrument_target(i64 %189, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteScanline to i8*), i32 1)
  %190 = call i32 %186(%struct.tiff* %187, i16 zeroext %188)
  %191 = icmp ne i32 %190, 0
  br i1 %191, label %194, label %192

; <label>:192:                                    ; preds = %183
  %pgocount13 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 19)
  %193 = add i64 %pgocount13, 1
  store i64 %193, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 19)
  store i32 -1, i32* %5, align 4
  br label %281

; <label>:194:                                    ; preds = %183
  %pgocount14 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 13)
  %195 = add i64 %pgocount14, 1
  store i64 %195, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 13)
  %196 = load %struct.tiff*, %struct.tiff** %6, align 8
  %197 = getelementptr inbounds %struct.tiff, %struct.tiff* %196, i32 0, i32 3
  %198 = load i32, i32* %197, align 8
  %199 = or i32 %198, 4096
  store i32 %199, i32* %197, align 8
  br label %200

; <label>:200:                                    ; preds = %194, %109
  %201 = load i32, i32* %13, align 4
  %202 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %203 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %202, i32 0, i32 43
  %204 = load i32, i32* %203, align 4
  %205 = icmp uge i32 %201, %204
  br i1 %205, label %206, label %213

; <label>:206:                                    ; preds = %200
  %pgocount15 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 9)
  %207 = add i64 %pgocount15, 1
  store i64 %207, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 9)
  %208 = load %struct.tiff*, %struct.tiff** %6, align 8
  %209 = call i32 @TIFFGrowStrips(%struct.tiff* %208, i32 1, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFWriteScanline.module, i32 0, i32 0))
  %210 = icmp ne i32 %209, 0
  br i1 %210, label %213, label %211

; <label>:211:                                    ; preds = %206
  %pgocount16 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 15)
  %212 = add i64 %pgocount16, 1
  store i64 %212, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 15)
  store i32 -1, i32* %5, align 4
  br label %281

; <label>:213:                                    ; preds = %206, %200
  %214 = load i32, i32* %8, align 4
  %215 = load %struct.tiff*, %struct.tiff** %6, align 8
  %216 = getelementptr inbounds %struct.tiff, %struct.tiff* %215, i32 0, i32 11
  %217 = load i32, i32* %216, align 8
  %218 = icmp ne i32 %214, %217
  br i1 %218, label %219, label %263

; <label>:219:                                    ; preds = %213
  %220 = load i32, i32* %8, align 4
  %221 = load %struct.tiff*, %struct.tiff** %6, align 8
  %222 = getelementptr inbounds %struct.tiff, %struct.tiff* %221, i32 0, i32 11
  %223 = load i32, i32* %222, align 8
  %224 = icmp ult i32 %220, %223
  br i1 %224, label %225, label %243

; <label>:225:                                    ; preds = %219
  %pgocount17 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 14)
  %226 = add i64 %pgocount17, 1
  store i64 %226, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 14)
  %227 = load i32, i32* %13, align 4
  %228 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %229 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %228, i32 0, i32 42
  %230 = load i32, i32* %229, align 8
  %231 = urem i32 %227, %230
  %232 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %233 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %232, i32 0, i32 16
  %234 = load i32, i32* %233, align 4
  %235 = mul i32 %231, %234
  %236 = load %struct.tiff*, %struct.tiff** %6, align 8
  %237 = getelementptr inbounds %struct.tiff, %struct.tiff* %236, i32 0, i32 11
  store i32 %235, i32* %237, align 8
  %238 = load %struct.tiff*, %struct.tiff** %6, align 8
  %239 = getelementptr inbounds %struct.tiff, %struct.tiff* %238, i32 0, i32 40
  %240 = load i8*, i8** %239, align 8
  %241 = load %struct.tiff*, %struct.tiff** %6, align 8
  %242 = getelementptr inbounds %struct.tiff, %struct.tiff* %241, i32 0, i32 42
  store i8* %240, i8** %242, align 8
  br label %243

; <label>:243:                                    ; preds = %225, %219
  %244 = load %struct.tiff*, %struct.tiff** %6, align 8
  %245 = getelementptr inbounds %struct.tiff, %struct.tiff* %244, i32 0, i32 33
  %246 = load i32 (%struct.tiff*, i32)*, i32 (%struct.tiff*, i32)** %245, align 8
  %247 = load %struct.tiff*, %struct.tiff** %6, align 8
  %248 = load i32, i32* %8, align 4
  %249 = load %struct.tiff*, %struct.tiff** %6, align 8
  %250 = getelementptr inbounds %struct.tiff, %struct.tiff* %249, i32 0, i32 11
  %251 = load i32, i32* %250, align 8
  %252 = sub i32 %248, %251
  %253 = ptrtoint i32 (%struct.tiff*, i32)* %246 to i64
  call void @__llvm_profile_instrument_target(i64 %253, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteScanline to i8*), i32 2)
  %254 = call i32 %246(%struct.tiff* %247, i32 %252)
  %255 = icmp ne i32 %254, 0
  br i1 %255, label %258, label %256

; <label>:256:                                    ; preds = %243
  %pgocount18 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 18)
  %257 = add i64 %pgocount18, 1
  store i64 %257, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 18)
  store i32 -1, i32* %5, align 4
  br label %281

; <label>:258:                                    ; preds = %243
  %pgocount19 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 11)
  %259 = add i64 %pgocount19, 1
  store i64 %259, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 11)
  %260 = load i32, i32* %8, align 4
  %261 = load %struct.tiff*, %struct.tiff** %6, align 8
  %262 = getelementptr inbounds %struct.tiff, %struct.tiff* %261, i32 0, i32 11
  store i32 %260, i32* %262, align 8
  br label %263

; <label>:263:                                    ; preds = %258, %213
  %pgocount20 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 5)
  %264 = add i64 %pgocount20, 1
  store i64 %264, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_TIFFWriteScanline, i64 0, i64 5)
  %265 = load %struct.tiff*, %struct.tiff** %6, align 8
  %266 = getelementptr inbounds %struct.tiff, %struct.tiff* %265, i32 0, i32 27
  %267 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %266, align 8
  %268 = load %struct.tiff*, %struct.tiff** %6, align 8
  %269 = load i8*, i8** %7, align 8
  %270 = load %struct.tiff*, %struct.tiff** %6, align 8
  %271 = getelementptr inbounds %struct.tiff, %struct.tiff* %270, i32 0, i32 38
  %272 = load i32, i32* %271, align 8
  %273 = load i16, i16* %9, align 2
  %274 = ptrtoint i32 (%struct.tiff*, i8*, i32, i16)* %267 to i64
  call void @__llvm_profile_instrument_target(i64 %274, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteScanline to i8*), i32 3)
  %275 = call i32 %267(%struct.tiff* %268, i8* %269, i32 %272, i16 zeroext %273)
  store i32 %275, i32* %11, align 4
  %276 = load %struct.tiff*, %struct.tiff** %6, align 8
  %277 = getelementptr inbounds %struct.tiff, %struct.tiff* %276, i32 0, i32 11
  %278 = load i32, i32* %277, align 8
  %279 = add i32 %278, 1
  store i32 %279, i32* %277, align 8
  %280 = load i32, i32* %11, align 4
  store i32 %280, i32* %5, align 4
  br label %281

; <label>:281:                                    ; preds = %263, %256, %211, %192, %175, %119, %78, %53, %37, %24
  %282 = load i32, i32* %5, align 4
  ret i32 %282
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFWriteCheck(%struct.tiff*, i32, i8*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32 %1, i32* %6, align 4
  store i8* %2, i8** %7, align 8
  %8 = load %struct.tiff*, %struct.tiff** %5, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %8, i32 0, i32 2
  %10 = load i32, i32* %9, align 4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %18

; <label>:12:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i64 0, i64 1)
  %14 = load i8*, i8** %7, align 8
  %15 = load %struct.tiff*, %struct.tiff** %5, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %15, i32 0, i32 0
  %17 = load i8*, i8** %16, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %14, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.5, i32 0, i32 0), i8* %17)
  store i32 0, i32* %4, align 4
  br label %108

; <label>:18:                                     ; preds = %3
  %19 = load i32, i32* %6, align 4
  %20 = load %struct.tiff*, %struct.tiff** %5, align 8
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %20, i32 0, i32 3
  %22 = load i32, i32* %21, align 8
  %23 = and i32 %22, 1024
  %24 = icmp ne i32 %23, 0
  %25 = zext i1 %24 to i32
  %26 = xor i32 %19, %25
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %38

; <label>:28:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i64 0, i64 0)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i64 0, i64 0)
  %30 = load %struct.tiff*, %struct.tiff** %5, align 8
  %31 = getelementptr inbounds %struct.tiff, %struct.tiff* %30, i32 0, i32 0
  %32 = load i8*, i8** %31, align 8
  %33 = load i32, i32* %6, align 4
  %34 = icmp ne i32 %33, 0
  %35 = zext i1 %34 to i64
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i64 0, i64 7)
  %36 = add i64 %pgocount2, %35
  store i64 %36, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i64 0, i64 7)
  %37 = select i1 %34, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.7, i32 0, i32 0)
  call void (i8*, i8*, ...) @TIFFError(i8* %32, i8* %37)
  store i32 0, i32* %4, align 4
  br label %108

; <label>:38:                                     ; preds = %18
  %39 = load %struct.tiff*, %struct.tiff** %5, align 8
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %39, i32 0, i32 6
  %41 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %40, i32 0, i32 0
  %42 = getelementptr inbounds [3 x i64], [3 x i64]* %41, i64 0, i64 0
  %43 = load i64, i64* %42, align 8
  %44 = and i64 %43, 2
  %45 = icmp ne i64 %44, 0
  br i1 %45, label %52, label %46

; <label>:46:                                     ; preds = %38
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i64 0, i64 2)
  %47 = add i64 %pgocount3, 1
  store i64 %47, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i64 0, i64 2)
  %48 = load i8*, i8** %7, align 8
  %49 = load %struct.tiff*, %struct.tiff** %5, align 8
  %50 = getelementptr inbounds %struct.tiff, %struct.tiff* %49, i32 0, i32 0
  %51 = load i8*, i8** %50, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %48, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.8, i32 0, i32 0), i8* %51)
  store i32 0, i32* %4, align 4
  br label %108

; <label>:52:                                     ; preds = %38
  %53 = load %struct.tiff*, %struct.tiff** %5, align 8
  %54 = getelementptr inbounds %struct.tiff, %struct.tiff* %53, i32 0, i32 6
  %55 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %54, i32 0, i32 0
  %56 = getelementptr inbounds [3 x i64], [3 x i64]* %55, i64 0, i64 0
  %57 = load i64, i64* %56, align 8
  %58 = and i64 %57, 1048576
  %59 = icmp ne i64 %58, 0
  br i1 %59, label %66, label %60

; <label>:60:                                     ; preds = %52
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i64 0, i64 3)
  %61 = add i64 %pgocount4, 1
  store i64 %61, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i64 0, i64 3)
  %62 = load i8*, i8** %7, align 8
  %63 = load %struct.tiff*, %struct.tiff** %5, align 8
  %64 = getelementptr inbounds %struct.tiff, %struct.tiff* %63, i32 0, i32 0
  %65 = load i8*, i8** %64, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %62, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.9, i32 0, i32 0), i8* %65)
  store i32 0, i32* %4, align 4
  br label %108

; <label>:66:                                     ; preds = %52
  %67 = load %struct.tiff*, %struct.tiff** %5, align 8
  %68 = getelementptr inbounds %struct.tiff, %struct.tiff* %67, i32 0, i32 6
  %69 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %68, i32 0, i32 44
  %70 = load i32*, i32** %69, align 8
  %71 = icmp eq i32* %70, null
  br i1 %71, label %72, label %94

; <label>:72:                                     ; preds = %66
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i64 0, i64 5)
  %73 = add i64 %pgocount5, 1
  store i64 %73, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i64 0, i64 5)
  %74 = load %struct.tiff*, %struct.tiff** %5, align 8
  %75 = call i32 @TIFFSetupStrips(%struct.tiff* %74)
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %94, label %77

; <label>:77:                                     ; preds = %72
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i64 0, i64 6)
  %78 = add i64 %pgocount6, 1
  store i64 %78, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i64 0, i64 6)
  %79 = load %struct.tiff*, %struct.tiff** %5, align 8
  %80 = getelementptr inbounds %struct.tiff, %struct.tiff* %79, i32 0, i32 6
  %81 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %80, i32 0, i32 43
  store i32 0, i32* %81, align 4
  %82 = load i8*, i8** %7, align 8
  %83 = load %struct.tiff*, %struct.tiff** %5, align 8
  %84 = getelementptr inbounds %struct.tiff, %struct.tiff* %83, i32 0, i32 0
  %85 = load i8*, i8** %84, align 8
  %86 = load %struct.tiff*, %struct.tiff** %5, align 8
  %87 = getelementptr inbounds %struct.tiff, %struct.tiff* %86, i32 0, i32 3
  %88 = load i32, i32* %87, align 8
  %89 = and i32 %88, 1024
  %90 = icmp ne i32 %89, 0
  %91 = zext i1 %90 to i64
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i64 0, i64 8)
  %92 = add i64 %pgocount7, %91
  store i64 %92, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i64 0, i64 8)
  %93 = select i1 %90, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i32 0, i32 0)
  call void (i8*, i8*, ...) @TIFFError(i8* %82, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.10, i32 0, i32 0), i8* %85, i8* %93)
  store i32 0, i32* %4, align 4
  br label %108

; <label>:94:                                     ; preds = %72, %66
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i64 0, i64 4)
  %95 = add i64 %pgocount8, 1
  store i64 %95, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFWriteCheck, i64 0, i64 4)
  %96 = load %struct.tiff*, %struct.tiff** %5, align 8
  %97 = call i32 @TIFFTileSize(%struct.tiff* %96)
  %98 = load %struct.tiff*, %struct.tiff** %5, align 8
  %99 = getelementptr inbounds %struct.tiff, %struct.tiff* %98, i32 0, i32 20
  store i32 %97, i32* %99, align 4
  %100 = load %struct.tiff*, %struct.tiff** %5, align 8
  %101 = call i32 @TIFFScanlineSize(%struct.tiff* %100)
  %102 = load %struct.tiff*, %struct.tiff** %5, align 8
  %103 = getelementptr inbounds %struct.tiff, %struct.tiff* %102, i32 0, i32 38
  store i32 %101, i32* %103, align 8
  %104 = load %struct.tiff*, %struct.tiff** %5, align 8
  %105 = getelementptr inbounds %struct.tiff, %struct.tiff* %104, i32 0, i32 3
  %106 = load i32, i32* %105, align 8
  %107 = or i32 %106, 64
  store i32 %107, i32* %105, align 8
  store i32 1, i32* %4, align 4
  br label %108

; <label>:108:                                    ; preds = %94, %77, %60, %46, %28, %12
  %109 = load i32, i32* %4, align 4
  ret i32 %109
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFWriteBufferSetup(%struct.tiff*, i8*, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  %8 = load %struct.tiff*, %struct.tiff** %5, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %8, i32 0, i32 40
  %10 = load i8*, i8** %9, align 8
  %11 = icmp ne i8* %10, null
  br i1 %11, label %12, label %31

; <label>:12:                                     ; preds = %3
  %13 = load %struct.tiff*, %struct.tiff** %5, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %13, i32 0, i32 3
  %15 = load i32, i32* %14, align 8
  %16 = and i32 %15, 512
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %27

; <label>:18:                                     ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteBufferSetup, i64 0, i64 2)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteBufferSetup, i64 0, i64 2)
  %20 = load %struct.tiff*, %struct.tiff** %5, align 8
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %20, i32 0, i32 40
  %22 = load i8*, i8** %21, align 8
  call void @_TIFFfree(i8* %22)
  %23 = load %struct.tiff*, %struct.tiff** %5, align 8
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %23, i32 0, i32 3
  %25 = load i32, i32* %24, align 8
  %26 = and i32 %25, -513
  store i32 %26, i32* %24, align 8
  br label %27

; <label>:27:                                     ; preds = %18, %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteBufferSetup, i64 0, i64 0)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteBufferSetup, i64 0, i64 0)
  %29 = load %struct.tiff*, %struct.tiff** %5, align 8
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %29, i32 0, i32 40
  store i8* null, i8** %30, align 8
  br label %31

; <label>:31:                                     ; preds = %27, %3
  %32 = load i32, i32* %7, align 4
  %33 = icmp eq i32 %32, -1
  br i1 %33, label %34, label %57

; <label>:34:                                     ; preds = %31
  %35 = load %struct.tiff*, %struct.tiff** %5, align 8
  %36 = getelementptr inbounds %struct.tiff, %struct.tiff* %35, i32 0, i32 3
  %37 = load i32, i32* %36, align 8
  %38 = and i32 %37, 1024
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %45

; <label>:40:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteBufferSetup, i64 0, i64 4)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteBufferSetup, i64 0, i64 4)
  %42 = load %struct.tiff*, %struct.tiff** %5, align 8
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %42, i32 0, i32 20
  %44 = load i32, i32* %43, align 4
  br label %50

; <label>:45:                                     ; preds = %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteBufferSetup, i64 0, i64 5)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteBufferSetup, i64 0, i64 5)
  %47 = load %struct.tiff*, %struct.tiff** %5, align 8
  %48 = getelementptr inbounds %struct.tiff, %struct.tiff* %47, i32 0, i32 38
  %49 = load i32, i32* %48, align 8
  br label %50

; <label>:50:                                     ; preds = %45, %40
  %51 = phi i32 [ %44, %40 ], [ %49, %45 ]
  store i32 %51, i32* %7, align 4
  %52 = load i32, i32* %7, align 4
  %53 = icmp slt i32 %52, 8192
  br i1 %53, label %54, label %56

; <label>:54:                                     ; preds = %50
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteBufferSetup, i64 0, i64 6)
  %55 = add i64 %pgocount4, 1
  store i64 %55, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteBufferSetup, i64 0, i64 6)
  store i32 8192, i32* %7, align 4
  br label %56

; <label>:56:                                     ; preds = %54, %50
  store i8* null, i8** %6, align 8
  br label %57

; <label>:57:                                     ; preds = %56, %31
  %58 = load i8*, i8** %6, align 8
  %59 = icmp eq i8* %58, null
  br i1 %59, label %60, label %76

; <label>:60:                                     ; preds = %57
  %61 = load i32, i32* %7, align 4
  %62 = call i8* @_TIFFmalloc(i32 %61)
  store i8* %62, i8** %6, align 8
  %63 = load i8*, i8** %6, align 8
  %64 = icmp eq i8* %63, null
  br i1 %64, label %65, label %70

; <label>:65:                                     ; preds = %60
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteBufferSetup, i64 0, i64 7)
  %66 = add i64 %pgocount5, 1
  store i64 %66, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteBufferSetup, i64 0, i64 7)
  %67 = load %struct.tiff*, %struct.tiff** %5, align 8
  %68 = getelementptr inbounds %struct.tiff, %struct.tiff* %67, i32 0, i32 0
  %69 = load i8*, i8** %68, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @TIFFWriteBufferSetup.module, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i32 0, i32 0), i8* %69)
  store i32 0, i32* %4, align 4
  br label %100

; <label>:70:                                     ; preds = %60
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteBufferSetup, i64 0, i64 3)
  %71 = add i64 %pgocount6, 1
  store i64 %71, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteBufferSetup, i64 0, i64 3)
  %72 = load %struct.tiff*, %struct.tiff** %5, align 8
  %73 = getelementptr inbounds %struct.tiff, %struct.tiff* %72, i32 0, i32 3
  %74 = load i32, i32* %73, align 8
  %75 = or i32 %74, 512
  store i32 %75, i32* %73, align 8
  br label %82

; <label>:76:                                     ; preds = %57
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteBufferSetup, i64 0, i64 1)
  %77 = add i64 %pgocount7, 1
  store i64 %77, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteBufferSetup, i64 0, i64 1)
  %78 = load %struct.tiff*, %struct.tiff** %5, align 8
  %79 = getelementptr inbounds %struct.tiff, %struct.tiff* %78, i32 0, i32 3
  %80 = load i32, i32* %79, align 8
  %81 = and i32 %80, -513
  store i32 %81, i32* %79, align 8
  br label %82

; <label>:82:                                     ; preds = %76, %70
  %83 = load i8*, i8** %6, align 8
  %84 = load %struct.tiff*, %struct.tiff** %5, align 8
  %85 = getelementptr inbounds %struct.tiff, %struct.tiff* %84, i32 0, i32 40
  store i8* %83, i8** %85, align 8
  %86 = load i32, i32* %7, align 4
  %87 = load %struct.tiff*, %struct.tiff** %5, align 8
  %88 = getelementptr inbounds %struct.tiff, %struct.tiff* %87, i32 0, i32 41
  store i32 %86, i32* %88, align 8
  %89 = load %struct.tiff*, %struct.tiff** %5, align 8
  %90 = getelementptr inbounds %struct.tiff, %struct.tiff* %89, i32 0, i32 43
  store i32 0, i32* %90, align 8
  %91 = load %struct.tiff*, %struct.tiff** %5, align 8
  %92 = getelementptr inbounds %struct.tiff, %struct.tiff* %91, i32 0, i32 40
  %93 = load i8*, i8** %92, align 8
  %94 = load %struct.tiff*, %struct.tiff** %5, align 8
  %95 = getelementptr inbounds %struct.tiff, %struct.tiff* %94, i32 0, i32 42
  store i8* %93, i8** %95, align 8
  %96 = load %struct.tiff*, %struct.tiff** %5, align 8
  %97 = getelementptr inbounds %struct.tiff, %struct.tiff* %96, i32 0, i32 3
  %98 = load i32, i32* %97, align 8
  %99 = or i32 %98, 16
  store i32 %99, i32* %97, align 8
  store i32 1, i32* %4, align 4
  br label %100

; <label>:100:                                    ; preds = %82, %65
  %101 = load i32, i32* %4, align 4
  ret i32 %101
}

declare void @TIFFError(i8*, i8*, ...) #1

declare i32 @TIFFFlushData(%struct.tiff*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFGrowStrips(%struct.tiff*, i32, i8*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca %struct.TIFFDirectory*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32 %1, i32* %6, align 4
  store i8* %2, i8** %7, align 8
  %9 = load %struct.tiff*, %struct.tiff** %5, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 6
  store %struct.TIFFDirectory* %10, %struct.TIFFDirectory** %8, align 8
  %11 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %12 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %11, i32 0, i32 24
  %13 = load i16, i16* %12, align 2
  %14 = zext i16 %13 to i32
  %15 = icmp eq i32 %14, 1
  br i1 %15, label %16, label %17

; <label>:16:                                     ; preds = %3
  br label %20

; <label>:17:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFGrowStrips, i64 0, i64 3)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFGrowStrips, i64 0, i64 3)
  call void @__assert_fail(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.14, i32 0, i32 0), i32 570, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__PRETTY_FUNCTION__.TIFFGrowStrips, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %20

; <label>:20:                                     ; preds = %19, %16
  %21 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %22 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %21, i32 0, i32 44
  %23 = load i32*, i32** %22, align 8
  %24 = bitcast i32* %23 to i8*
  %25 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %26 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %25, i32 0, i32 43
  %27 = load i32, i32* %26, align 4
  %28 = load i32, i32* %6, align 4
  %29 = add i32 %27, %28
  %30 = zext i32 %29 to i64
  %31 = mul i64 %30, 4
  %32 = trunc i64 %31 to i32
  %33 = call i8* @_TIFFrealloc(i8* %24, i32 %32)
  %34 = bitcast i8* %33 to i32*
  %35 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %36 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %35, i32 0, i32 44
  store i32* %34, i32** %36, align 8
  %37 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %38 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %37, i32 0, i32 45
  %39 = load i32*, i32** %38, align 8
  %40 = bitcast i32* %39 to i8*
  %41 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %42 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %41, i32 0, i32 43
  %43 = load i32, i32* %42, align 4
  %44 = load i32, i32* %6, align 4
  %45 = add i32 %43, %44
  %46 = zext i32 %45 to i64
  %47 = mul i64 %46, 4
  %48 = trunc i64 %47 to i32
  %49 = call i8* @_TIFFrealloc(i8* %40, i32 %48)
  %50 = bitcast i8* %49 to i32*
  %51 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %52 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %51, i32 0, i32 45
  store i32* %50, i32** %52, align 8
  %53 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %54 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %53, i32 0, i32 44
  %55 = load i32*, i32** %54, align 8
  %56 = icmp eq i32* %55, null
  br i1 %56, label %63, label %57

; <label>:57:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFGrowStrips, i64 0, i64 0)
  %58 = add i64 %pgocount1, 1
  store i64 %58, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFGrowStrips, i64 0, i64 0)
  %59 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %60 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %59, i32 0, i32 45
  %61 = load i32*, i32** %60, align 8
  %62 = icmp eq i32* %61, null
  br i1 %62, label %63, label %71

; <label>:63:                                     ; preds = %57, %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFGrowStrips, i64 0, i64 1)
  %64 = add i64 %pgocount2, 1
  store i64 %64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFGrowStrips, i64 0, i64 1)
  %65 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %66 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %65, i32 0, i32 43
  store i32 0, i32* %66, align 4
  %67 = load i8*, i8** %7, align 8
  %68 = load %struct.tiff*, %struct.tiff** %5, align 8
  %69 = getelementptr inbounds %struct.tiff, %struct.tiff* %68, i32 0, i32 0
  %70 = load i8*, i8** %69, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %67, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.15, i32 0, i32 0), i8* %70)
  store i32 0, i32* %4, align 4
  br label %104

; <label>:71:                                     ; preds = %57
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFGrowStrips, i64 0, i64 2)
  %72 = add i64 %pgocount3, 1
  store i64 %72, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFGrowStrips, i64 0, i64 2)
  %73 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %74 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %73, i32 0, i32 44
  %75 = load i32*, i32** %74, align 8
  %76 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %77 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %76, i32 0, i32 43
  %78 = load i32, i32* %77, align 4
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32* %75, i64 %79
  %81 = bitcast i32* %80 to i8*
  %82 = load i32, i32* %6, align 4
  %83 = sext i32 %82 to i64
  %84 = mul i64 %83, 4
  %85 = trunc i64 %84 to i32
  call void @_TIFFmemset(i8* %81, i32 0, i32 %85)
  %86 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %87 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %86, i32 0, i32 45
  %88 = load i32*, i32** %87, align 8
  %89 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %90 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %89, i32 0, i32 43
  %91 = load i32, i32* %90, align 4
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32* %88, i64 %92
  %94 = bitcast i32* %93 to i8*
  %95 = load i32, i32* %6, align 4
  %96 = sext i32 %95 to i64
  %97 = mul i64 %96, 4
  %98 = trunc i64 %97 to i32
  call void @_TIFFmemset(i8* %94, i32 0, i32 %98)
  %99 = load i32, i32* %6, align 4
  %100 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %101 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %100, i32 0, i32 43
  %102 = load i32, i32* %101, align 4
  %103 = add i32 %102, %99
  store i32 %103, i32* %101, align 4
  store i32 1, i32* %4, align 4
  br label %104

; <label>:104:                                    ; preds = %71, %63
  %105 = load i32, i32* %4, align 4
  ret i32 %105
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFWriteEncodedStrip(%struct.tiff*, i32, i8*, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.TIFFDirectory*, align 8
  %11 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i32 %1, i32* %7, align 4
  store i8* %2, i8** %8, align 8
  store i32 %3, i32* %9, align 4
  %12 = load %struct.tiff*, %struct.tiff** %6, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 6
  store %struct.TIFFDirectory* %13, %struct.TIFFDirectory** %10, align 8
  %14 = load %struct.tiff*, %struct.tiff** %6, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 3
  %16 = load i32, i32* %15, align 8
  %17 = and i32 %16, 64
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %26, label %19

; <label>:19:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 0)
  %21 = load %struct.tiff*, %struct.tiff** %6, align 8
  %22 = call i32 @TIFFWriteCheck(%struct.tiff* %21, i32 0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @TIFFWriteEncodedStrip.module, i32 0, i32 0))
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %26, label %24

; <label>:24:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 3)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 3)
  store i32 -1, i32* %5, align 4
  br label %213

; <label>:26:                                     ; preds = %19, %4
  %27 = load i32, i32* %7, align 4
  %28 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %29 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %28, i32 0, i32 43
  %30 = load i32, i32* %29, align 4
  %31 = icmp uge i32 %27, %30
  br i1 %31, label %32, label %65

; <label>:32:                                     ; preds = %26
  %33 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %34 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %33, i32 0, i32 24
  %35 = load i16, i16* %34, align 2
  %36 = zext i16 %35 to i32
  %37 = icmp eq i32 %36, 2
  br i1 %37, label %38, label %43

; <label>:38:                                     ; preds = %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 2)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 2)
  %40 = load %struct.tiff*, %struct.tiff** %6, align 8
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %40, i32 0, i32 0
  %42 = load i8*, i8** %41, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %42, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.2, i32 0, i32 0))
  store i32 -1, i32* %5, align 4
  br label %213

; <label>:43:                                     ; preds = %32
  %44 = load %struct.tiff*, %struct.tiff** %6, align 8
  %45 = call i32 @TIFFGrowStrips(%struct.tiff* %44, i32 1, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @TIFFWriteEncodedStrip.module, i32 0, i32 0))
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %49, label %47

; <label>:47:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 10)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 10)
  store i32 -1, i32* %5, align 4
  br label %213

; <label>:49:                                     ; preds = %43
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 6)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 6)
  %51 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %52 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %51, i32 0, i32 2
  %53 = load i32, i32* %52, align 4
  %54 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %55 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %54, i32 0, i32 16
  %56 = load i32, i32* %55, align 4
  %57 = sub i32 %56, 1
  %58 = add i32 %53, %57
  %59 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %60 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %59, i32 0, i32 16
  %61 = load i32, i32* %60, align 4
  %62 = udiv i32 %58, %61
  %63 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %64 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %63, i32 0, i32 42
  store i32 %62, i32* %64, align 8
  br label %65

; <label>:65:                                     ; preds = %49, %26
  %66 = load %struct.tiff*, %struct.tiff** %6, align 8
  %67 = getelementptr inbounds %struct.tiff, %struct.tiff* %66, i32 0, i32 3
  %68 = load i32, i32* %67, align 8
  %69 = and i32 %68, 16
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %78, label %71

; <label>:71:                                     ; preds = %65
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 1)
  %72 = add i64 %pgocount5, 1
  store i64 %72, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 1)
  %73 = load %struct.tiff*, %struct.tiff** %6, align 8
  %74 = call i32 @TIFFWriteBufferSetup(%struct.tiff* %73, i8* null, i32 -1)
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %78, label %76

; <label>:76:                                     ; preds = %71
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 7)
  %77 = add i64 %pgocount6, 1
  store i64 %77, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 7)
  store i32 -1, i32* %5, align 4
  br label %213

; <label>:78:                                     ; preds = %71, %65
  %79 = load i32, i32* %7, align 4
  %80 = load %struct.tiff*, %struct.tiff** %6, align 8
  %81 = getelementptr inbounds %struct.tiff, %struct.tiff* %80, i32 0, i32 13
  store i32 %79, i32* %81, align 8
  %82 = load i32, i32* %7, align 4
  %83 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %84 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %83, i32 0, i32 42
  %85 = load i32, i32* %84, align 8
  %86 = urem i32 %82, %85
  %87 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %88 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %87, i32 0, i32 16
  %89 = load i32, i32* %88, align 4
  %90 = mul i32 %86, %89
  %91 = load %struct.tiff*, %struct.tiff** %6, align 8
  %92 = getelementptr inbounds %struct.tiff, %struct.tiff* %91, i32 0, i32 11
  store i32 %90, i32* %92, align 8
  %93 = load %struct.tiff*, %struct.tiff** %6, align 8
  %94 = getelementptr inbounds %struct.tiff, %struct.tiff* %93, i32 0, i32 3
  %95 = load i32, i32* %94, align 8
  %96 = and i32 %95, 32
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %98, label %114

; <label>:98:                                     ; preds = %78
  %99 = load %struct.tiff*, %struct.tiff** %6, align 8
  %100 = getelementptr inbounds %struct.tiff, %struct.tiff* %99, i32 0, i32 23
  %101 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %100, align 8
  %102 = load %struct.tiff*, %struct.tiff** %6, align 8
  %103 = ptrtoint i32 (%struct.tiff*)* %101 to i64
  call void @__llvm_profile_instrument_target(i64 %103, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteEncodedStrip to i8*), i32 0)
  %104 = call i32 %101(%struct.tiff* %102)
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %108, label %106

; <label>:106:                                    ; preds = %98
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 8)
  %107 = add i64 %pgocount7, 1
  store i64 %107, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 8)
  store i32 -1, i32* %5, align 4
  br label %213

; <label>:108:                                    ; preds = %98
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 4)
  %109 = add i64 %pgocount8, 1
  store i64 %109, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 4)
  %110 = load %struct.tiff*, %struct.tiff** %6, align 8
  %111 = getelementptr inbounds %struct.tiff, %struct.tiff* %110, i32 0, i32 3
  %112 = load i32, i32* %111, align 8
  %113 = or i32 %112, 32
  store i32 %113, i32* %111, align 8
  br label %114

; <label>:114:                                    ; preds = %108, %78
  %115 = load %struct.tiff*, %struct.tiff** %6, align 8
  %116 = getelementptr inbounds %struct.tiff, %struct.tiff* %115, i32 0, i32 3
  %117 = load i32, i32* %116, align 8
  %118 = and i32 %117, -4097
  store i32 %118, i32* %116, align 8
  %119 = load i32, i32* %7, align 4
  %120 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %121 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %120, i32 0, i32 42
  %122 = load i32, i32* %121, align 8
  %123 = udiv i32 %119, %122
  %124 = trunc i32 %123 to i16
  store i16 %124, i16* %11, align 2
  %125 = load %struct.tiff*, %struct.tiff** %6, align 8
  %126 = getelementptr inbounds %struct.tiff, %struct.tiff* %125, i32 0, i32 24
  %127 = load i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*, i16)** %126, align 8
  %128 = load %struct.tiff*, %struct.tiff** %6, align 8
  %129 = load i16, i16* %11, align 2
  %130 = ptrtoint i32 (%struct.tiff*, i16)* %127 to i64
  call void @__llvm_profile_instrument_target(i64 %130, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteEncodedStrip to i8*), i32 1)
  %131 = call i32 %127(%struct.tiff* %128, i16 zeroext %129)
  %132 = icmp ne i32 %131, 0
  br i1 %132, label %135, label %133

; <label>:133:                                    ; preds = %114
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 5)
  %134 = add i64 %pgocount9, 1
  store i64 %134, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 5)
  store i32 -1, i32* %5, align 4
  br label %213

; <label>:135:                                    ; preds = %114
  %136 = load %struct.tiff*, %struct.tiff** %6, align 8
  %137 = getelementptr inbounds %struct.tiff, %struct.tiff* %136, i32 0, i32 29
  %138 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %137, align 8
  %139 = load %struct.tiff*, %struct.tiff** %6, align 8
  %140 = load i8*, i8** %8, align 8
  %141 = load i32, i32* %9, align 4
  %142 = load i16, i16* %11, align 2
  %143 = ptrtoint i32 (%struct.tiff*, i8*, i32, i16)* %138 to i64
  call void @__llvm_profile_instrument_target(i64 %143, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteEncodedStrip to i8*), i32 2)
  %144 = call i32 %138(%struct.tiff* %139, i8* %140, i32 %141, i16 zeroext %142)
  %145 = icmp ne i32 %144, 0
  br i1 %145, label %148, label %146

; <label>:146:                                    ; preds = %135
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 9)
  %147 = add i64 %pgocount10, 1
  store i64 %147, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 9)
  store i32 0, i32* %5, align 4
  br label %213

; <label>:148:                                    ; preds = %135
  %149 = load %struct.tiff*, %struct.tiff** %6, align 8
  %150 = getelementptr inbounds %struct.tiff, %struct.tiff* %149, i32 0, i32 25
  %151 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %150, align 8
  %152 = load %struct.tiff*, %struct.tiff** %6, align 8
  %153 = ptrtoint i32 (%struct.tiff*)* %151 to i64
  call void @__llvm_profile_instrument_target(i64 %153, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteEncodedStrip to i8*), i32 3)
  %154 = call i32 %151(%struct.tiff* %152)
  %155 = icmp ne i32 %154, 0
  br i1 %155, label %158, label %156

; <label>:156:                                    ; preds = %148
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 13)
  %157 = add i64 %pgocount11, 1
  store i64 %157, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 13)
  store i32 -1, i32* %5, align 4
  br label %213

; <label>:158:                                    ; preds = %148
  %159 = load %struct.tiff*, %struct.tiff** %6, align 8
  %160 = getelementptr inbounds %struct.tiff, %struct.tiff* %159, i32 0, i32 3
  %161 = load i32, i32* %160, align 8
  %162 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %163 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %162, i32 0, i32 13
  %164 = load i16, i16* %163, align 2
  %165 = zext i16 %164 to i32
  %166 = and i32 %161, %165
  %167 = icmp ne i32 %166, 0
  br i1 %167, label %184, label %168

; <label>:168:                                    ; preds = %158
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 14)
  %169 = add i64 %pgocount12, 1
  store i64 %169, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 14)
  %170 = load %struct.tiff*, %struct.tiff** %6, align 8
  %171 = getelementptr inbounds %struct.tiff, %struct.tiff* %170, i32 0, i32 3
  %172 = load i32, i32* %171, align 8
  %173 = and i32 %172, 256
  %174 = icmp eq i32 %173, 0
  br i1 %174, label %175, label %184

; <label>:175:                                    ; preds = %168
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 16)
  %176 = add i64 %pgocount13, 1
  store i64 %176, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 16)
  %177 = load %struct.tiff*, %struct.tiff** %6, align 8
  %178 = getelementptr inbounds %struct.tiff, %struct.tiff* %177, i32 0, i32 40
  %179 = load i8*, i8** %178, align 8
  %180 = load %struct.tiff*, %struct.tiff** %6, align 8
  %181 = getelementptr inbounds %struct.tiff, %struct.tiff* %180, i32 0, i32 43
  %182 = load i32, i32* %181, align 8
  %183 = sext i32 %182 to i64
  call void @TIFFReverseBits(i8* %179, i64 %183)
  br label %184

; <label>:184:                                    ; preds = %175, %168, %158
  %185 = load %struct.tiff*, %struct.tiff** %6, align 8
  %186 = getelementptr inbounds %struct.tiff, %struct.tiff* %185, i32 0, i32 43
  %187 = load i32, i32* %186, align 8
  %188 = icmp sgt i32 %187, 0
  br i1 %188, label %189, label %203

; <label>:189:                                    ; preds = %184
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 12)
  %190 = add i64 %pgocount14, 1
  store i64 %190, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 12)
  %191 = load %struct.tiff*, %struct.tiff** %6, align 8
  %192 = load i32, i32* %7, align 4
  %193 = load %struct.tiff*, %struct.tiff** %6, align 8
  %194 = getelementptr inbounds %struct.tiff, %struct.tiff* %193, i32 0, i32 40
  %195 = load i8*, i8** %194, align 8
  %196 = load %struct.tiff*, %struct.tiff** %6, align 8
  %197 = getelementptr inbounds %struct.tiff, %struct.tiff* %196, i32 0, i32 43
  %198 = load i32, i32* %197, align 8
  %199 = call i32 @TIFFAppendToStrip(%struct.tiff* %191, i32 %192, i8* %195, i32 %198)
  %200 = icmp ne i32 %199, 0
  br i1 %200, label %203, label %201

; <label>:201:                                    ; preds = %189
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 15)
  %202 = add i64 %pgocount15, 1
  store i64 %202, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 15)
  store i32 -1, i32* %5, align 4
  br label %213

; <label>:203:                                    ; preds = %189, %184
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 11)
  %204 = add i64 %pgocount16, 1
  store i64 %204, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_TIFFWriteEncodedStrip, i64 0, i64 11)
  %205 = load %struct.tiff*, %struct.tiff** %6, align 8
  %206 = getelementptr inbounds %struct.tiff, %struct.tiff* %205, i32 0, i32 43
  store i32 0, i32* %206, align 8
  %207 = load %struct.tiff*, %struct.tiff** %6, align 8
  %208 = getelementptr inbounds %struct.tiff, %struct.tiff* %207, i32 0, i32 40
  %209 = load i8*, i8** %208, align 8
  %210 = load %struct.tiff*, %struct.tiff** %6, align 8
  %211 = getelementptr inbounds %struct.tiff, %struct.tiff* %210, i32 0, i32 42
  store i8* %209, i8** %211, align 8
  %212 = load i32, i32* %9, align 4
  store i32 %212, i32* %5, align 4
  br label %213

; <label>:213:                                    ; preds = %203, %201, %156, %146, %133, %106, %76, %47, %38, %24
  %214 = load i32, i32* %5, align 4
  ret i32 %214
}

declare void @TIFFReverseBits(i8*, i64) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFAppendToStrip(%struct.tiff*, i32, i8*, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.TIFFDirectory*, align 8
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i32 %1, i32* %7, align 4
  store i8* %2, i8** %8, align 8
  store i32 %3, i32* %9, align 4
  %11 = load %struct.tiff*, %struct.tiff** %6, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 6
  store %struct.TIFFDirectory* %12, %struct.TIFFDirectory** %10, align 8
  %13 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %14 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %13, i32 0, i32 44
  %15 = load i32*, i32** %14, align 8
  %16 = load i32, i32* %7, align 4
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds i32, i32* %15, i64 %17
  %19 = load i32, i32* %18, align 4
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %27, label %21

; <label>:21:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFAppendToStrip, i64 0, i64 0)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFAppendToStrip, i64 0, i64 0)
  %23 = load %struct.tiff*, %struct.tiff** %6, align 8
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %23, i32 0, i32 14
  %25 = load i32, i32* %24, align 4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %97

; <label>:27:                                     ; preds = %21, %4
  %28 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %29 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %28, i32 0, i32 44
  %30 = load i32*, i32** %29, align 8
  %31 = load i32, i32* %7, align 4
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32* %30, i64 %32
  %34 = load i32, i32* %33, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %71

; <label>:36:                                     ; preds = %27
  %37 = load %struct.tiff*, %struct.tiff** %6, align 8
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %37, i32 0, i32 51
  %39 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %38, align 8
  %40 = load %struct.tiff*, %struct.tiff** %6, align 8
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %40, i32 0, i32 48
  %42 = load i8*, i8** %41, align 8
  %43 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %44 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %43, i32 0, i32 44
  %45 = load i32*, i32** %44, align 8
  %46 = load i32, i32* %7, align 4
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32* %45, i64 %47
  %49 = load i32, i32* %48, align 4
  %50 = ptrtoint i32 (i8*, i32, i32)* %39 to i64
  call void @__llvm_profile_instrument_target(i64 %50, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFAppendToStrip to i8*), i32 0)
  %51 = call i32 %39(i8* %42, i32 %49, i32 0)
  %52 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %53 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %52, i32 0, i32 44
  %54 = load i32*, i32** %53, align 8
  %55 = load i32, i32* %7, align 4
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32* %54, i64 %56
  %58 = load i32, i32* %57, align 4
  %59 = icmp eq i32 %51, %58
  br i1 %59, label %69, label %60

; <label>:60:                                     ; preds = %36
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFAppendToStrip, i64 0, i64 5)
  %61 = add i64 %pgocount1, 1
  store i64 %61, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFAppendToStrip, i64 0, i64 5)
  %62 = load %struct.tiff*, %struct.tiff** %6, align 8
  %63 = getelementptr inbounds %struct.tiff, %struct.tiff* %62, i32 0, i32 0
  %64 = load i8*, i8** %63, align 8
  %65 = load %struct.tiff*, %struct.tiff** %6, align 8
  %66 = getelementptr inbounds %struct.tiff, %struct.tiff* %65, i32 0, i32 11
  %67 = load i32, i32* %66, align 8
  %68 = zext i32 %67 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFAppendToStrip.module, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.16, i32 0, i32 0), i8* %64, i64 %68)
  store i32 0, i32* %5, align 4
  br label %135

; <label>:69:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFAppendToStrip, i64 0, i64 4)
  %70 = add i64 %pgocount2, 1
  store i64 %70, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFAppendToStrip, i64 0, i64 4)
  br label %87

; <label>:71:                                     ; preds = %27
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFAppendToStrip, i64 0, i64 3)
  %72 = add i64 %pgocount3, 1
  store i64 %72, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFAppendToStrip, i64 0, i64 3)
  %73 = load %struct.tiff*, %struct.tiff** %6, align 8
  %74 = getelementptr inbounds %struct.tiff, %struct.tiff* %73, i32 0, i32 51
  %75 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %74, align 8
  %76 = load %struct.tiff*, %struct.tiff** %6, align 8
  %77 = getelementptr inbounds %struct.tiff, %struct.tiff* %76, i32 0, i32 48
  %78 = load i8*, i8** %77, align 8
  %79 = ptrtoint i32 (i8*, i32, i32)* %75 to i64
  call void @__llvm_profile_instrument_target(i64 %79, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFAppendToStrip to i8*), i32 1)
  %80 = call i32 %75(i8* %78, i32 0, i32 2)
  %81 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %82 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %81, i32 0, i32 44
  %83 = load i32*, i32** %82, align 8
  %84 = load i32, i32* %7, align 4
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32* %83, i64 %85
  store i32 %80, i32* %86, align 4
  br label %87

; <label>:87:                                     ; preds = %71, %69
  %88 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %89 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %88, i32 0, i32 44
  %90 = load i32*, i32** %89, align 8
  %91 = load i32, i32* %7, align 4
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32* %90, i64 %92
  %94 = load i32, i32* %93, align 4
  %95 = load %struct.tiff*, %struct.tiff** %6, align 8
  %96 = getelementptr inbounds %struct.tiff, %struct.tiff* %95, i32 0, i32 14
  store i32 %94, i32* %96, align 4
  br label %97

; <label>:97:                                     ; preds = %87, %21
  %98 = load %struct.tiff*, %struct.tiff** %6, align 8
  %99 = getelementptr inbounds %struct.tiff, %struct.tiff* %98, i32 0, i32 50
  %100 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %99, align 8
  %101 = load %struct.tiff*, %struct.tiff** %6, align 8
  %102 = getelementptr inbounds %struct.tiff, %struct.tiff* %101, i32 0, i32 48
  %103 = load i8*, i8** %102, align 8
  %104 = load i8*, i8** %8, align 8
  %105 = load i32, i32* %9, align 4
  %106 = ptrtoint i32 (i8*, i8*, i32)* %100 to i64
  call void @__llvm_profile_instrument_target(i64 %106, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFAppendToStrip to i8*), i32 2)
  %107 = call i32 %100(i8* %103, i8* %104, i32 %105)
  %108 = load i32, i32* %9, align 4
  %109 = icmp eq i32 %107, %108
  br i1 %109, label %119, label %110

; <label>:110:                                    ; preds = %97
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFAppendToStrip, i64 0, i64 1)
  %111 = add i64 %pgocount4, 1
  store i64 %111, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFAppendToStrip, i64 0, i64 1)
  %112 = load %struct.tiff*, %struct.tiff** %6, align 8
  %113 = getelementptr inbounds %struct.tiff, %struct.tiff* %112, i32 0, i32 0
  %114 = load i8*, i8** %113, align 8
  %115 = load %struct.tiff*, %struct.tiff** %6, align 8
  %116 = getelementptr inbounds %struct.tiff, %struct.tiff* %115, i32 0, i32 11
  %117 = load i32, i32* %116, align 8
  %118 = zext i32 %117 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFAppendToStrip.module, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.17, i32 0, i32 0), i8* %114, i64 %118)
  store i32 0, i32* %5, align 4
  br label %135

; <label>:119:                                    ; preds = %97
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFAppendToStrip, i64 0, i64 2)
  %120 = add i64 %pgocount5, 1
  store i64 %120, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_TIFFAppendToStrip, i64 0, i64 2)
  %121 = load i32, i32* %9, align 4
  %122 = load %struct.tiff*, %struct.tiff** %6, align 8
  %123 = getelementptr inbounds %struct.tiff, %struct.tiff* %122, i32 0, i32 14
  %124 = load i32, i32* %123, align 4
  %125 = add nsw i32 %124, %121
  store i32 %125, i32* %123, align 4
  %126 = load i32, i32* %9, align 4
  %127 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %128 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %127, i32 0, i32 45
  %129 = load i32*, i32** %128, align 8
  %130 = load i32, i32* %7, align 4
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds i32, i32* %129, i64 %131
  %133 = load i32, i32* %132, align 4
  %134 = add i32 %133, %126
  store i32 %134, i32* %132, align 4
  store i32 1, i32* %5, align 4
  br label %135

; <label>:135:                                    ; preds = %119, %110, %60
  %136 = load i32, i32* %5, align 4
  ret i32 %136
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFWriteRawStrip(%struct.tiff*, i32, i8*, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.TIFFDirectory*, align 8
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i32 %1, i32* %7, align 4
  store i8* %2, i8** %8, align 8
  store i32 %3, i32* %9, align 4
  %11 = load %struct.tiff*, %struct.tiff** %6, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 6
  store %struct.TIFFDirectory* %12, %struct.TIFFDirectory** %10, align 8
  %13 = load %struct.tiff*, %struct.tiff** %6, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %13, i32 0, i32 3
  %15 = load i32, i32* %14, align 8
  %16 = and i32 %15, 64
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %25, label %18

; <label>:18:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteRawStrip, i64 0, i64 0)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteRawStrip, i64 0, i64 0)
  %20 = load %struct.tiff*, %struct.tiff** %6, align 8
  %21 = call i32 @TIFFWriteCheck(%struct.tiff* %20, i32 0, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFWriteRawStrip.module, i32 0, i32 0))
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %25, label %23

; <label>:23:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteRawStrip, i64 0, i64 4)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteRawStrip, i64 0, i64 4)
  store i32 -1, i32* %5, align 4
  br label %100

; <label>:25:                                     ; preds = %18, %4
  %26 = load i32, i32* %7, align 4
  %27 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %28 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %27, i32 0, i32 43
  %29 = load i32, i32* %28, align 4
  %30 = icmp uge i32 %26, %29
  br i1 %30, label %31, label %72

; <label>:31:                                     ; preds = %25
  %32 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %33 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %32, i32 0, i32 24
  %34 = load i16, i16* %33, align 2
  %35 = zext i16 %34 to i32
  %36 = icmp eq i32 %35, 2
  br i1 %36, label %37, label %42

; <label>:37:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteRawStrip, i64 0, i64 2)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteRawStrip, i64 0, i64 2)
  %39 = load %struct.tiff*, %struct.tiff** %6, align 8
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %39, i32 0, i32 0
  %41 = load i8*, i8** %40, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %41, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.2, i32 0, i32 0))
  store i32 -1, i32* %5, align 4
  br label %100

; <label>:42:                                     ; preds = %31
  %43 = load i32, i32* %7, align 4
  %44 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %45 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %44, i32 0, i32 42
  %46 = load i32, i32* %45, align 8
  %47 = icmp uge i32 %43, %46
  br i1 %47, label %48, label %64

; <label>:48:                                     ; preds = %42
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteRawStrip, i64 0, i64 6)
  %49 = add i64 %pgocount3, 1
  store i64 %49, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteRawStrip, i64 0, i64 6)
  %50 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %51 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %50, i32 0, i32 2
  %52 = load i32, i32* %51, align 4
  %53 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %54 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %53, i32 0, i32 16
  %55 = load i32, i32* %54, align 4
  %56 = sub i32 %55, 1
  %57 = add i32 %52, %56
  %58 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %59 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %58, i32 0, i32 16
  %60 = load i32, i32* %59, align 4
  %61 = udiv i32 %57, %60
  %62 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %63 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %62, i32 0, i32 42
  store i32 %61, i32* %63, align 8
  br label %64

; <label>:64:                                     ; preds = %48, %42
  %65 = load %struct.tiff*, %struct.tiff** %6, align 8
  %66 = call i32 @TIFFGrowStrips(%struct.tiff* %65, i32 1, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFWriteRawStrip.module, i32 0, i32 0))
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %70, label %68

; <label>:68:                                     ; preds = %64
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteRawStrip, i64 0, i64 7)
  %69 = add i64 %pgocount4, 1
  store i64 %69, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteRawStrip, i64 0, i64 7)
  store i32 -1, i32* %5, align 4
  br label %100

; <label>:70:                                     ; preds = %64
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteRawStrip, i64 0, i64 5)
  %71 = add i64 %pgocount5, 1
  store i64 %71, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteRawStrip, i64 0, i64 5)
  br label %72

; <label>:72:                                     ; preds = %70, %25
  %73 = load i32, i32* %7, align 4
  %74 = load %struct.tiff*, %struct.tiff** %6, align 8
  %75 = getelementptr inbounds %struct.tiff, %struct.tiff* %74, i32 0, i32 13
  store i32 %73, i32* %75, align 8
  %76 = load i32, i32* %7, align 4
  %77 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %78 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %77, i32 0, i32 42
  %79 = load i32, i32* %78, align 8
  %80 = urem i32 %76, %79
  %81 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %82 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %81, i32 0, i32 16
  %83 = load i32, i32* %82, align 4
  %84 = mul i32 %80, %83
  %85 = load %struct.tiff*, %struct.tiff** %6, align 8
  %86 = getelementptr inbounds %struct.tiff, %struct.tiff* %85, i32 0, i32 11
  store i32 %84, i32* %86, align 8
  %87 = load %struct.tiff*, %struct.tiff** %6, align 8
  %88 = load i32, i32* %7, align 4
  %89 = load i8*, i8** %8, align 8
  %90 = load i32, i32* %9, align 4
  %91 = call i32 @TIFFAppendToStrip(%struct.tiff* %87, i32 %88, i8* %89, i32 %90)
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %93, label %96

; <label>:93:                                     ; preds = %72
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteRawStrip, i64 0, i64 1)
  %94 = add i64 %pgocount6, 1
  store i64 %94, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteRawStrip, i64 0, i64 1)
  %95 = load i32, i32* %9, align 4
  br label %98

; <label>:96:                                     ; preds = %72
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteRawStrip, i64 0, i64 3)
  %97 = add i64 %pgocount7, 1
  store i64 %97, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFWriteRawStrip, i64 0, i64 3)
  br label %98

; <label>:98:                                     ; preds = %96, %93
  %99 = phi i32 [ %95, %93 ], [ -1, %96 ]
  store i32 %99, i32* %5, align 4
  br label %100

; <label>:100:                                    ; preds = %98, %68, %37, %23
  %101 = load i32, i32* %5, align 4
  ret i32 %101
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFWriteTile(%struct.tiff*, i8*, i32, i32, i32, i16 zeroext) #0 {
  %7 = alloca i32, align 4
  %8 = alloca %struct.tiff*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %8, align 8
  store i8* %1, i8** %9, align 8
  store i32 %2, i32* %10, align 4
  store i32 %3, i32* %11, align 4
  store i32 %4, i32* %12, align 4
  store i16 %5, i16* %13, align 2
  %14 = load %struct.tiff*, %struct.tiff** %8, align 8
  %15 = load i32, i32* %10, align 4
  %16 = load i32, i32* %11, align 4
  %17 = load i32, i32* %12, align 4
  %18 = load i16, i16* %13, align 2
  %19 = call i32 @TIFFCheckTile(%struct.tiff* %14, i32 %15, i32 %16, i32 %17, i16 zeroext %18)
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %23, label %21

; <label>:21:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFWriteTile, i64 0, i64 1)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFWriteTile, i64 0, i64 1)
  store i32 -1, i32* %7, align 4
  br label %34

; <label>:23:                                     ; preds = %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFWriteTile, i64 0, i64 0)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFWriteTile, i64 0, i64 0)
  %25 = load %struct.tiff*, %struct.tiff** %8, align 8
  %26 = load %struct.tiff*, %struct.tiff** %8, align 8
  %27 = load i32, i32* %10, align 4
  %28 = load i32, i32* %11, align 4
  %29 = load i32, i32* %12, align 4
  %30 = load i16, i16* %13, align 2
  %31 = call i32 @TIFFComputeTile(%struct.tiff* %26, i32 %27, i32 %28, i32 %29, i16 zeroext %30)
  %32 = load i8*, i8** %9, align 8
  %33 = call i32 @TIFFWriteEncodedTile(%struct.tiff* %25, i32 %31, i8* %32, i32 -1)
  store i32 %33, i32* %7, align 4
  br label %34

; <label>:34:                                     ; preds = %23, %21
  %35 = load i32, i32* %7, align 4
  ret i32 %35
}

declare i32 @TIFFCheckTile(%struct.tiff*, i32, i32, i32, i16 zeroext) #1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFWriteEncodedTile(%struct.tiff*, i32, i8*, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.TIFFDirectory*, align 8
  %11 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i32 %1, i32* %7, align 4
  store i8* %2, i8** %8, align 8
  store i32 %3, i32* %9, align 4
  %12 = load %struct.tiff*, %struct.tiff** %6, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 3
  %14 = load i32, i32* %13, align 8
  %15 = and i32 %14, 64
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %24, label %17

; <label>:17:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 0)
  %19 = load %struct.tiff*, %struct.tiff** %6, align 8
  %20 = call i32 @TIFFWriteCheck(%struct.tiff* %19, i32 1, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @TIFFWriteEncodedTile.module, i32 0, i32 0))
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %24, label %22

; <label>:22:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 3)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 3)
  store i32 -1, i32* %5, align 4
  br label %231

; <label>:24:                                     ; preds = %17, %4
  %25 = load %struct.tiff*, %struct.tiff** %6, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %25, i32 0, i32 6
  store %struct.TIFFDirectory* %26, %struct.TIFFDirectory** %10, align 8
  %27 = load i32, i32* %7, align 4
  %28 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %29 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %28, i32 0, i32 43
  %30 = load i32, i32* %29, align 4
  %31 = icmp uge i32 %27, %30
  br i1 %31, label %32, label %43

; <label>:32:                                     ; preds = %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 1)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 1)
  %34 = load %struct.tiff*, %struct.tiff** %6, align 8
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %34, i32 0, i32 0
  %36 = load i8*, i8** %35, align 8
  %37 = load i32, i32* %7, align 4
  %38 = zext i32 %37 to i64
  %39 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %40 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %39, i32 0, i32 43
  %41 = load i32, i32* %40, align 4
  %42 = zext i32 %41 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @TIFFWriteEncodedTile.module, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i32 0, i32 0), i8* %36, i64 %38, i64 %42)
  store i32 -1, i32* %5, align 4
  br label %231

; <label>:43:                                     ; preds = %24
  %44 = load %struct.tiff*, %struct.tiff** %6, align 8
  %45 = getelementptr inbounds %struct.tiff, %struct.tiff* %44, i32 0, i32 3
  %46 = load i32, i32* %45, align 8
  %47 = and i32 %46, 16
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %56, label %49

; <label>:49:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 2)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 2)
  %51 = load %struct.tiff*, %struct.tiff** %6, align 8
  %52 = call i32 @TIFFWriteBufferSetup(%struct.tiff* %51, i8* null, i32 -1)
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %56, label %54

; <label>:54:                                     ; preds = %49
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 7)
  %55 = add i64 %pgocount4, 1
  store i64 %55, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 7)
  store i32 -1, i32* %5, align 4
  br label %231

; <label>:56:                                     ; preds = %49, %43
  %57 = load i32, i32* %7, align 4
  %58 = load %struct.tiff*, %struct.tiff** %6, align 8
  %59 = getelementptr inbounds %struct.tiff, %struct.tiff* %58, i32 0, i32 19
  store i32 %57, i32* %59, align 8
  %60 = load i32, i32* %7, align 4
  %61 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %62 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %61, i32 0, i32 2
  %63 = load i32, i32* %62, align 4
  %64 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %65 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %64, i32 0, i32 5
  %66 = load i32, i32* %65, align 8
  %67 = sub i32 %66, 1
  %68 = add i32 %63, %67
  %69 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %70 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %69, i32 0, i32 5
  %71 = load i32, i32* %70, align 8
  %72 = udiv i32 %68, %71
  %73 = urem i32 %60, %72
  %74 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %75 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %74, i32 0, i32 5
  %76 = load i32, i32* %75, align 8
  %77 = mul i32 %73, %76
  %78 = load %struct.tiff*, %struct.tiff** %6, align 8
  %79 = getelementptr inbounds %struct.tiff, %struct.tiff* %78, i32 0, i32 11
  store i32 %77, i32* %79, align 8
  %80 = load i32, i32* %7, align 4
  %81 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %82 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %81, i32 0, i32 1
  %83 = load i32, i32* %82, align 8
  %84 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %85 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %84, i32 0, i32 4
  %86 = load i32, i32* %85, align 4
  %87 = sub i32 %86, 1
  %88 = add i32 %83, %87
  %89 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %90 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %89, i32 0, i32 4
  %91 = load i32, i32* %90, align 4
  %92 = udiv i32 %88, %91
  %93 = urem i32 %80, %92
  %94 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %95 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %94, i32 0, i32 4
  %96 = load i32, i32* %95, align 4
  %97 = mul i32 %93, %96
  %98 = load %struct.tiff*, %struct.tiff** %6, align 8
  %99 = getelementptr inbounds %struct.tiff, %struct.tiff* %98, i32 0, i32 18
  store i32 %97, i32* %99, align 4
  %100 = load %struct.tiff*, %struct.tiff** %6, align 8
  %101 = getelementptr inbounds %struct.tiff, %struct.tiff* %100, i32 0, i32 3
  %102 = load i32, i32* %101, align 8
  %103 = and i32 %102, 32
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %105, label %121

; <label>:105:                                    ; preds = %56
  %106 = load %struct.tiff*, %struct.tiff** %6, align 8
  %107 = getelementptr inbounds %struct.tiff, %struct.tiff* %106, i32 0, i32 23
  %108 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %107, align 8
  %109 = load %struct.tiff*, %struct.tiff** %6, align 8
  %110 = ptrtoint i32 (%struct.tiff*)* %108 to i64
  call void @__llvm_profile_instrument_target(i64 %110, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteEncodedTile to i8*), i32 0)
  %111 = call i32 %108(%struct.tiff* %109)
  %112 = icmp ne i32 %111, 0
  br i1 %112, label %115, label %113

; <label>:113:                                    ; preds = %105
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 8)
  %114 = add i64 %pgocount5, 1
  store i64 %114, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 8)
  store i32 -1, i32* %5, align 4
  br label %231

; <label>:115:                                    ; preds = %105
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 4)
  %116 = add i64 %pgocount6, 1
  store i64 %116, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 4)
  %117 = load %struct.tiff*, %struct.tiff** %6, align 8
  %118 = getelementptr inbounds %struct.tiff, %struct.tiff* %117, i32 0, i32 3
  %119 = load i32, i32* %118, align 8
  %120 = or i32 %119, 32
  store i32 %120, i32* %118, align 8
  br label %121

; <label>:121:                                    ; preds = %115, %56
  %122 = load %struct.tiff*, %struct.tiff** %6, align 8
  %123 = getelementptr inbounds %struct.tiff, %struct.tiff* %122, i32 0, i32 3
  %124 = load i32, i32* %123, align 8
  %125 = and i32 %124, -4097
  store i32 %125, i32* %123, align 8
  %126 = load i32, i32* %7, align 4
  %127 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %128 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %127, i32 0, i32 42
  %129 = load i32, i32* %128, align 8
  %130 = udiv i32 %126, %129
  %131 = trunc i32 %130 to i16
  store i16 %131, i16* %11, align 2
  %132 = load %struct.tiff*, %struct.tiff** %6, align 8
  %133 = getelementptr inbounds %struct.tiff, %struct.tiff* %132, i32 0, i32 24
  %134 = load i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*, i16)** %133, align 8
  %135 = load %struct.tiff*, %struct.tiff** %6, align 8
  %136 = load i16, i16* %11, align 2
  %137 = ptrtoint i32 (%struct.tiff*, i16)* %134 to i64
  call void @__llvm_profile_instrument_target(i64 %137, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteEncodedTile to i8*), i32 1)
  %138 = call i32 %134(%struct.tiff* %135, i16 zeroext %136)
  %139 = icmp ne i32 %138, 0
  br i1 %139, label %142, label %140

; <label>:140:                                    ; preds = %121
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 5)
  %141 = add i64 %pgocount7, 1
  store i64 %141, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 5)
  store i32 -1, i32* %5, align 4
  br label %231

; <label>:142:                                    ; preds = %121
  %143 = load i32, i32* %9, align 4
  %144 = load %struct.tiff*, %struct.tiff** %6, align 8
  %145 = getelementptr inbounds %struct.tiff, %struct.tiff* %144, i32 0, i32 20
  %146 = load i32, i32* %145, align 4
  %147 = icmp ugt i32 %143, %146
  br i1 %147, label %148, label %153

; <label>:148:                                    ; preds = %142
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 6)
  %149 = add i64 %pgocount8, 1
  store i64 %149, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 6)
  %150 = load %struct.tiff*, %struct.tiff** %6, align 8
  %151 = getelementptr inbounds %struct.tiff, %struct.tiff* %150, i32 0, i32 20
  %152 = load i32, i32* %151, align 4
  store i32 %152, i32* %9, align 4
  br label %153

; <label>:153:                                    ; preds = %148, %142
  %154 = load %struct.tiff*, %struct.tiff** %6, align 8
  %155 = getelementptr inbounds %struct.tiff, %struct.tiff* %154, i32 0, i32 31
  %156 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %155, align 8
  %157 = load %struct.tiff*, %struct.tiff** %6, align 8
  %158 = load i8*, i8** %8, align 8
  %159 = load i32, i32* %9, align 4
  %160 = load i16, i16* %11, align 2
  %161 = ptrtoint i32 (%struct.tiff*, i8*, i32, i16)* %156 to i64
  call void @__llvm_profile_instrument_target(i64 %161, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteEncodedTile to i8*), i32 2)
  %162 = call i32 %156(%struct.tiff* %157, i8* %158, i32 %159, i16 zeroext %160)
  %163 = icmp ne i32 %162, 0
  br i1 %163, label %166, label %164

; <label>:164:                                    ; preds = %153
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 9)
  %165 = add i64 %pgocount9, 1
  store i64 %165, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 9)
  store i32 0, i32* %5, align 4
  br label %231

; <label>:166:                                    ; preds = %153
  %167 = load %struct.tiff*, %struct.tiff** %6, align 8
  %168 = getelementptr inbounds %struct.tiff, %struct.tiff* %167, i32 0, i32 25
  %169 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %168, align 8
  %170 = load %struct.tiff*, %struct.tiff** %6, align 8
  %171 = ptrtoint i32 (%struct.tiff*)* %169 to i64
  call void @__llvm_profile_instrument_target(i64 %171, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFWriteEncodedTile to i8*), i32 3)
  %172 = call i32 %169(%struct.tiff* %170)
  %173 = icmp ne i32 %172, 0
  br i1 %173, label %176, label %174

; <label>:174:                                    ; preds = %166
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 12)
  %175 = add i64 %pgocount10, 1
  store i64 %175, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 12)
  store i32 -1, i32* %5, align 4
  br label %231

; <label>:176:                                    ; preds = %166
  %177 = load %struct.tiff*, %struct.tiff** %6, align 8
  %178 = getelementptr inbounds %struct.tiff, %struct.tiff* %177, i32 0, i32 3
  %179 = load i32, i32* %178, align 8
  %180 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %10, align 8
  %181 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %180, i32 0, i32 13
  %182 = load i16, i16* %181, align 2
  %183 = zext i16 %182 to i32
  %184 = and i32 %179, %183
  %185 = icmp ne i32 %184, 0
  br i1 %185, label %202, label %186

; <label>:186:                                    ; preds = %176
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 13)
  %187 = add i64 %pgocount11, 1
  store i64 %187, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 13)
  %188 = load %struct.tiff*, %struct.tiff** %6, align 8
  %189 = getelementptr inbounds %struct.tiff, %struct.tiff* %188, i32 0, i32 3
  %190 = load i32, i32* %189, align 8
  %191 = and i32 %190, 256
  %192 = icmp eq i32 %191, 0
  br i1 %192, label %193, label %202

; <label>:193:                                    ; preds = %186
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 15)
  %194 = add i64 %pgocount12, 1
  store i64 %194, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 15)
  %195 = load %struct.tiff*, %struct.tiff** %6, align 8
  %196 = getelementptr inbounds %struct.tiff, %struct.tiff* %195, i32 0, i32 40
  %197 = load i8*, i8** %196, align 8
  %198 = load %struct.tiff*, %struct.tiff** %6, align 8
  %199 = getelementptr inbounds %struct.tiff, %struct.tiff* %198, i32 0, i32 43
  %200 = load i32, i32* %199, align 8
  %201 = sext i32 %200 to i64
  call void @TIFFReverseBits(i8* %197, i64 %201)
  br label %202

; <label>:202:                                    ; preds = %193, %186, %176
  %203 = load %struct.tiff*, %struct.tiff** %6, align 8
  %204 = getelementptr inbounds %struct.tiff, %struct.tiff* %203, i32 0, i32 43
  %205 = load i32, i32* %204, align 8
  %206 = icmp sgt i32 %205, 0
  br i1 %206, label %207, label %221

; <label>:207:                                    ; preds = %202
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 11)
  %208 = add i64 %pgocount13, 1
  store i64 %208, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 11)
  %209 = load %struct.tiff*, %struct.tiff** %6, align 8
  %210 = load i32, i32* %7, align 4
  %211 = load %struct.tiff*, %struct.tiff** %6, align 8
  %212 = getelementptr inbounds %struct.tiff, %struct.tiff* %211, i32 0, i32 40
  %213 = load i8*, i8** %212, align 8
  %214 = load %struct.tiff*, %struct.tiff** %6, align 8
  %215 = getelementptr inbounds %struct.tiff, %struct.tiff* %214, i32 0, i32 43
  %216 = load i32, i32* %215, align 8
  %217 = call i32 @TIFFAppendToStrip(%struct.tiff* %209, i32 %210, i8* %213, i32 %216)
  %218 = icmp ne i32 %217, 0
  br i1 %218, label %221, label %219

; <label>:219:                                    ; preds = %207
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 14)
  %220 = add i64 %pgocount14, 1
  store i64 %220, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 14)
  store i32 -1, i32* %5, align 4
  br label %231

; <label>:221:                                    ; preds = %207, %202
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 10)
  %222 = add i64 %pgocount15, 1
  store i64 %222, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_TIFFWriteEncodedTile, i64 0, i64 10)
  %223 = load %struct.tiff*, %struct.tiff** %6, align 8
  %224 = getelementptr inbounds %struct.tiff, %struct.tiff* %223, i32 0, i32 43
  store i32 0, i32* %224, align 8
  %225 = load %struct.tiff*, %struct.tiff** %6, align 8
  %226 = getelementptr inbounds %struct.tiff, %struct.tiff* %225, i32 0, i32 40
  %227 = load i8*, i8** %226, align 8
  %228 = load %struct.tiff*, %struct.tiff** %6, align 8
  %229 = getelementptr inbounds %struct.tiff, %struct.tiff* %228, i32 0, i32 42
  store i8* %227, i8** %229, align 8
  %230 = load i32, i32* %9, align 4
  store i32 %230, i32* %5, align 4
  br label %231

; <label>:231:                                    ; preds = %221, %219, %174, %164, %140, %113, %54, %32, %22
  %232 = load i32, i32* %5, align 4
  ret i32 %232
}

declare i32 @TIFFComputeTile(%struct.tiff*, i32, i32, i32, i16 zeroext) #1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFWriteRawTile(%struct.tiff*, i32, i8*, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i32 %1, i32* %7, align 4
  store i8* %2, i8** %8, align 8
  store i32 %3, i32* %9, align 4
  %10 = load %struct.tiff*, %struct.tiff** %6, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 3
  %12 = load i32, i32* %11, align 8
  %13 = and i32 %12, 64
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %22, label %15

; <label>:15:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFWriteRawTile, i64 0, i64 0)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFWriteRawTile, i64 0, i64 0)
  %17 = load %struct.tiff*, %struct.tiff** %6, align 8
  %18 = call i32 @TIFFWriteCheck(%struct.tiff* %17, i32 1, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @TIFFWriteRawTile.module, i32 0, i32 0))
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFWriteRawTile, i64 0, i64 3)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFWriteRawTile, i64 0, i64 3)
  store i32 -1, i32* %5, align 4
  br label %55

; <label>:22:                                     ; preds = %15, %4
  %23 = load i32, i32* %7, align 4
  %24 = load %struct.tiff*, %struct.tiff** %6, align 8
  %25 = getelementptr inbounds %struct.tiff, %struct.tiff* %24, i32 0, i32 6
  %26 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %25, i32 0, i32 43
  %27 = load i32, i32* %26, align 4
  %28 = icmp uge i32 %23, %27
  br i1 %28, label %29, label %41

; <label>:29:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFWriteRawTile, i64 0, i64 1)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFWriteRawTile, i64 0, i64 1)
  %31 = load %struct.tiff*, %struct.tiff** %6, align 8
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %31, i32 0, i32 0
  %33 = load i8*, i8** %32, align 8
  %34 = load i32, i32* %7, align 4
  %35 = zext i32 %34 to i64
  %36 = load %struct.tiff*, %struct.tiff** %6, align 8
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %36, i32 0, i32 6
  %38 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %37, i32 0, i32 43
  %39 = load i32, i32* %38, align 4
  %40 = zext i32 %39 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @TIFFWriteRawTile.module, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i32 0, i32 0), i8* %33, i64 %35, i64 %40)
  store i32 -1, i32* %5, align 4
  br label %55

; <label>:41:                                     ; preds = %22
  %42 = load %struct.tiff*, %struct.tiff** %6, align 8
  %43 = load i32, i32* %7, align 4
  %44 = load i8*, i8** %8, align 8
  %45 = load i32, i32* %9, align 4
  %46 = call i32 @TIFFAppendToStrip(%struct.tiff* %42, i32 %43, i8* %44, i32 %45)
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %48, label %51

; <label>:48:                                     ; preds = %41
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFWriteRawTile, i64 0, i64 2)
  %49 = add i64 %pgocount3, 1
  store i64 %49, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFWriteRawTile, i64 0, i64 2)
  %50 = load i32, i32* %9, align 4
  br label %53

; <label>:51:                                     ; preds = %41
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFWriteRawTile, i64 0, i64 4)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFWriteRawTile, i64 0, i64 4)
  br label %53

; <label>:53:                                     ; preds = %51, %48
  %54 = phi i32 [ %50, %48 ], [ -1, %51 ]
  store i32 %54, i32* %5, align 4
  br label %55

; <label>:55:                                     ; preds = %53, %29, %20
  %56 = load i32, i32* %5, align 4
  ret i32 %56
}

declare void @_TIFFfree(i8*) #1

declare i8* @_TIFFmalloc(i32) #1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFFlushData1(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 43
  %6 = load i32, i32* %5, align 8
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %72

; <label>:8:                                      ; preds = %1
  %9 = load %struct.tiff*, %struct.tiff** %3, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 3
  %11 = load i32, i32* %10, align 8
  %12 = load %struct.tiff*, %struct.tiff** %3, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 6
  %14 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %13, i32 0, i32 13
  %15 = load i16, i16* %14, align 2
  %16 = zext i16 %15 to i32
  %17 = and i32 %11, %16
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %35, label %19

; <label>:19:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFFlushData1, i64 0, i64 3)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFFlushData1, i64 0, i64 3)
  %21 = load %struct.tiff*, %struct.tiff** %3, align 8
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %21, i32 0, i32 3
  %23 = load i32, i32* %22, align 8
  %24 = and i32 %23, 256
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %35

; <label>:26:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFFlushData1, i64 0, i64 5)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFFlushData1, i64 0, i64 5)
  %28 = load %struct.tiff*, %struct.tiff** %3, align 8
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %28, i32 0, i32 40
  %30 = load i8*, i8** %29, align 8
  %31 = load %struct.tiff*, %struct.tiff** %3, align 8
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %31, i32 0, i32 43
  %33 = load i32, i32* %32, align 8
  %34 = sext i32 %33 to i64
  call void @TIFFReverseBits(i8* %30, i64 %34)
  br label %35

; <label>:35:                                     ; preds = %26, %19, %8
  %36 = load %struct.tiff*, %struct.tiff** %3, align 8
  %37 = load %struct.tiff*, %struct.tiff** %3, align 8
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %37, i32 0, i32 3
  %39 = load i32, i32* %38, align 8
  %40 = and i32 %39, 1024
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %47

; <label>:42:                                     ; preds = %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFFlushData1, i64 0, i64 1)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFFlushData1, i64 0, i64 1)
  %44 = load %struct.tiff*, %struct.tiff** %3, align 8
  %45 = getelementptr inbounds %struct.tiff, %struct.tiff* %44, i32 0, i32 19
  %46 = load i32, i32* %45, align 8
  br label %52

; <label>:47:                                     ; preds = %35
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFFlushData1, i64 0, i64 2)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFFlushData1, i64 0, i64 2)
  %49 = load %struct.tiff*, %struct.tiff** %3, align 8
  %50 = getelementptr inbounds %struct.tiff, %struct.tiff* %49, i32 0, i32 13
  %51 = load i32, i32* %50, align 8
  br label %52

; <label>:52:                                     ; preds = %47, %42
  %53 = phi i32 [ %46, %42 ], [ %51, %47 ]
  %54 = load %struct.tiff*, %struct.tiff** %3, align 8
  %55 = getelementptr inbounds %struct.tiff, %struct.tiff* %54, i32 0, i32 40
  %56 = load i8*, i8** %55, align 8
  %57 = load %struct.tiff*, %struct.tiff** %3, align 8
  %58 = getelementptr inbounds %struct.tiff, %struct.tiff* %57, i32 0, i32 43
  %59 = load i32, i32* %58, align 8
  %60 = call i32 @TIFFAppendToStrip(%struct.tiff* %36, i32 %53, i8* %56, i32 %59)
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %64, label %62

; <label>:62:                                     ; preds = %52
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFFlushData1, i64 0, i64 4)
  %63 = add i64 %pgocount4, 1
  store i64 %63, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFFlushData1, i64 0, i64 4)
  store i32 0, i32* %2, align 4
  br label %74

; <label>:64:                                     ; preds = %52
  %65 = load %struct.tiff*, %struct.tiff** %3, align 8
  %66 = getelementptr inbounds %struct.tiff, %struct.tiff* %65, i32 0, i32 43
  store i32 0, i32* %66, align 8
  %67 = load %struct.tiff*, %struct.tiff** %3, align 8
  %68 = getelementptr inbounds %struct.tiff, %struct.tiff* %67, i32 0, i32 40
  %69 = load i8*, i8** %68, align 8
  %70 = load %struct.tiff*, %struct.tiff** %3, align 8
  %71 = getelementptr inbounds %struct.tiff, %struct.tiff* %70, i32 0, i32 42
  store i8* %69, i8** %71, align 8
  br label %72

; <label>:72:                                     ; preds = %64, %1
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFFlushData1, i64 0, i64 0)
  %73 = add i64 %pgocount5, 1
  store i64 %73, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFFlushData1, i64 0, i64 0)
  store i32 1, i32* %2, align 4
  br label %74

; <label>:74:                                     ; preds = %72, %62
  %75 = load i32, i32* %2, align 4
  ret i32 %75
}

; Function Attrs: noinline nounwind uwtable
define void @TIFFSetWriteOffset(%struct.tiff*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSetWriteOffset, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSetWriteOffset, i64 0, i64 0)
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = load %struct.tiff*, %struct.tiff** %4, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %7, i32 0, i32 14
  store i32 %6, i32* %8, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @TIFFSetupStrips(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFDirectory*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %5 = load %struct.tiff*, %struct.tiff** %3, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %5, i32 0, i32 6
  store %struct.TIFFDirectory* %6, %struct.TIFFDirectory** %4, align 8
  %7 = load %struct.tiff*, %struct.tiff** %3, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %7, i32 0, i32 3
  %9 = load i32, i32* %8, align 8
  %10 = and i32 %9, 1024
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %41

; <label>:12:                                     ; preds = %1
  %13 = load %struct.tiff*, %struct.tiff** %3, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %13, i32 0, i32 6
  %15 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %14, i32 0, i32 0
  %16 = getelementptr inbounds [3 x i64], [3 x i64]* %15, i64 0, i64 0
  %17 = load i64, i64* %16, align 8
  %18 = and i64 %17, 4
  %19 = icmp ne i64 %18, 0
  br i1 %19, label %20, label %33

; <label>:20:                                     ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i64 0, i64 5)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i64 0, i64 5)
  %22 = load %struct.tiff*, %struct.tiff** %3, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %22, i32 0, i32 6
  %24 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %23, i32 0, i32 2
  %25 = load i32, i32* %24, align 4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %33

; <label>:27:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i64 0, i64 7)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i64 0, i64 7)
  %29 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %30 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %29, i32 0, i32 15
  %31 = load i16, i16* %30, align 2
  %32 = zext i16 %31 to i32
  br label %37

; <label>:33:                                     ; preds = %20, %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i64 0, i64 2)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i64 0, i64 2)
  %35 = load %struct.tiff*, %struct.tiff** %3, align 8
  %36 = call i32 @TIFFNumberOfTiles(%struct.tiff* %35)
  br label %37

; <label>:37:                                     ; preds = %33, %27
  %38 = phi i32 [ %32, %27 ], [ %36, %33 ]
  %39 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %40 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %39, i32 0, i32 42
  store i32 %38, i32* %40, align 8
  br label %70

; <label>:41:                                     ; preds = %1
  %42 = load %struct.tiff*, %struct.tiff** %3, align 8
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %42, i32 0, i32 6
  %44 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %43, i32 0, i32 0
  %45 = getelementptr inbounds [3 x i64], [3 x i64]* %44, i64 0, i64 0
  %46 = load i64, i64* %45, align 8
  %47 = and i64 %46, 131072
  %48 = icmp ne i64 %47, 0
  br i1 %48, label %49, label %62

; <label>:49:                                     ; preds = %41
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i64 0, i64 6)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i64 0, i64 6)
  %51 = load %struct.tiff*, %struct.tiff** %3, align 8
  %52 = getelementptr inbounds %struct.tiff, %struct.tiff* %51, i32 0, i32 6
  %53 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %52, i32 0, i32 2
  %54 = load i32, i32* %53, align 4
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %56, label %62

; <label>:56:                                     ; preds = %49
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i64 0, i64 8)
  %57 = add i64 %pgocount4, 1
  store i64 %57, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i64 0, i64 8)
  %58 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %59 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %58, i32 0, i32 15
  %60 = load i16, i16* %59, align 2
  %61 = zext i16 %60 to i32
  br label %66

; <label>:62:                                     ; preds = %49, %41
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i64 0, i64 3)
  %63 = add i64 %pgocount5, 1
  store i64 %63, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i64 0, i64 3)
  %64 = load %struct.tiff*, %struct.tiff** %3, align 8
  %65 = call i32 @TIFFNumberOfStrips(%struct.tiff* %64)
  br label %66

; <label>:66:                                     ; preds = %62, %56
  %67 = phi i32 [ %61, %56 ], [ %65, %62 ]
  %68 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %69 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %68, i32 0, i32 42
  store i32 %67, i32* %69, align 8
  br label %70

; <label>:70:                                     ; preds = %66, %37
  %71 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %72 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %71, i32 0, i32 42
  %73 = load i32, i32* %72, align 8
  %74 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %75 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %74, i32 0, i32 43
  store i32 %73, i32* %75, align 4
  %76 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %77 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %76, i32 0, i32 24
  %78 = load i16, i16* %77, align 2
  %79 = zext i16 %78 to i32
  %80 = icmp eq i32 %79, 2
  br i1 %80, label %81, label %91

; <label>:81:                                     ; preds = %70
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i64 0, i64 1)
  %82 = add i64 %pgocount6, 1
  store i64 %82, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i64 0, i64 1)
  %83 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %84 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %83, i32 0, i32 15
  %85 = load i16, i16* %84, align 2
  %86 = zext i16 %85 to i32
  %87 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %88 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %87, i32 0, i32 42
  %89 = load i32, i32* %88, align 8
  %90 = udiv i32 %89, %86
  store i32 %90, i32* %88, align 8
  br label %91

; <label>:91:                                     ; preds = %81, %70
  %92 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %93 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %92, i32 0, i32 43
  %94 = load i32, i32* %93, align 4
  %95 = zext i32 %94 to i64
  %96 = mul i64 %95, 4
  %97 = trunc i64 %96 to i32
  %98 = call i8* @_TIFFmalloc(i32 %97)
  %99 = bitcast i8* %98 to i32*
  %100 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %101 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %100, i32 0, i32 44
  store i32* %99, i32** %101, align 8
  %102 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %103 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %102, i32 0, i32 43
  %104 = load i32, i32* %103, align 4
  %105 = zext i32 %104 to i64
  %106 = mul i64 %105, 4
  %107 = trunc i64 %106 to i32
  %108 = call i8* @_TIFFmalloc(i32 %107)
  %109 = bitcast i8* %108 to i32*
  %110 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %111 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %110, i32 0, i32 45
  store i32* %109, i32** %111, align 8
  %112 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %113 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %112, i32 0, i32 44
  %114 = load i32*, i32** %113, align 8
  %115 = icmp eq i32* %114, null
  br i1 %115, label %122, label %116

; <label>:116:                                    ; preds = %91
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i64 0, i64 0)
  %117 = add i64 %pgocount7, 1
  store i64 %117, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i64 0, i64 0)
  %118 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %119 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %118, i32 0, i32 45
  %120 = load i32*, i32** %119, align 8
  %121 = icmp eq i32* %120, null
  br i1 %121, label %122, label %123

; <label>:122:                                    ; preds = %116, %91
  store i32 0, i32* %2, align 4
  br label %157

; <label>:123:                                    ; preds = %116
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i64 0, i64 4)
  %124 = add i64 %pgocount8, 1
  store i64 %124, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_TIFFSetupStrips, i64 0, i64 4)
  %125 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %126 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %125, i32 0, i32 44
  %127 = load i32*, i32** %126, align 8
  %128 = bitcast i32* %127 to i8*
  %129 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %130 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %129, i32 0, i32 43
  %131 = load i32, i32* %130, align 4
  %132 = zext i32 %131 to i64
  %133 = mul i64 %132, 4
  %134 = trunc i64 %133 to i32
  call void @_TIFFmemset(i8* %128, i32 0, i32 %134)
  %135 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %136 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %135, i32 0, i32 45
  %137 = load i32*, i32** %136, align 8
  %138 = bitcast i32* %137 to i8*
  %139 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %140 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %139, i32 0, i32 43
  %141 = load i32, i32* %140, align 4
  %142 = zext i32 %141 to i64
  %143 = mul i64 %142, 4
  %144 = trunc i64 %143 to i32
  call void @_TIFFmemset(i8* %138, i32 0, i32 %144)
  %145 = load %struct.tiff*, %struct.tiff** %3, align 8
  %146 = getelementptr inbounds %struct.tiff, %struct.tiff* %145, i32 0, i32 6
  %147 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %146, i32 0, i32 0
  %148 = getelementptr inbounds [3 x i64], [3 x i64]* %147, i64 0, i64 0
  %149 = load i64, i64* %148, align 8
  %150 = or i64 %149, 33554432
  store i64 %150, i64* %148, align 8
  %151 = load %struct.tiff*, %struct.tiff** %3, align 8
  %152 = getelementptr inbounds %struct.tiff, %struct.tiff* %151, i32 0, i32 6
  %153 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %152, i32 0, i32 0
  %154 = getelementptr inbounds [3 x i64], [3 x i64]* %153, i64 0, i64 0
  %155 = load i64, i64* %154, align 8
  %156 = or i64 %155, 16777216
  store i64 %156, i64* %154, align 8
  store i32 1, i32* %2, align 4
  br label %157

; <label>:157:                                    ; preds = %123, %122
  %158 = load i32, i32* %2, align 4
  ret i32 %158
}

declare i32 @TIFFTileSize(%struct.tiff*) #1

declare i32 @TIFFScanlineSize(%struct.tiff*) #1

declare i32 @TIFFNumberOfTiles(%struct.tiff*) #1

declare i32 @TIFFNumberOfStrips(%struct.tiff*) #1

declare void @_TIFFmemset(i8*, i32, i32) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

declare i8* @_TIFFrealloc(i8*, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
