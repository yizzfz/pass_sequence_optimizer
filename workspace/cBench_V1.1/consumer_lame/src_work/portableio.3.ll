; ModuleID = 'portableio.2.ll'
source_filename = "portableio.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_ReadByte = private constant [8 x i8] c"ReadByte"
@__profn_Read16BitsLowHigh = private constant [17 x i8] c"Read16BitsLowHigh"
@__profn_Read16BitsHighLow = private constant [17 x i8] c"Read16BitsHighLow"
@__profn_Write8Bits = private constant [10 x i8] c"Write8Bits"
@__profn_Write16BitsLowHigh = private constant [18 x i8] c"Write16BitsLowHigh"
@__profn_Write16BitsHighLow = private constant [18 x i8] c"Write16BitsHighLow"
@__profn_Read24BitsHighLow = private constant [17 x i8] c"Read24BitsHighLow"
@__profn_Read32Bits = private constant [10 x i8] c"Read32Bits"
@__profn_Read32BitsHighLow = private constant [17 x i8] c"Read32BitsHighLow"
@__profn_Write32Bits = private constant [11 x i8] c"Write32Bits"
@__profn_Write32BitsLowHigh = private constant [18 x i8] c"Write32BitsLowHigh"
@__profn_Write32BitsHighLow = private constant [18 x i8] c"Write32BitsHighLow"
@__profn_ReadBytes = private constant [9 x i8] c"ReadBytes"
@__profn_ReadBytesSwapped = private constant [16 x i8] c"ReadBytesSwapped"
@__profn_WriteBytes = private constant [10 x i8] c"WriteBytes"
@__profn_WriteBytesSwapped = private constant [17 x i8] c"WriteBytesSwapped"
@__profn_ReadIeeeFloatHighLow = private constant [20 x i8] c"ReadIeeeFloatHighLow"
@__profn_ReadIeeeFloatLowHigh = private constant [20 x i8] c"ReadIeeeFloatLowHigh"
@__profn_ReadIeeeDoubleHighLow = private constant [21 x i8] c"ReadIeeeDoubleHighLow"
@__profn_ReadIeeeDoubleLowHigh = private constant [21 x i8] c"ReadIeeeDoubleLowHigh"
@__profn_ReadIeeeExtendedHighLow = private constant [23 x i8] c"ReadIeeeExtendedHighLow"
@__profn_ReadIeeeExtendedLowHigh = private constant [23 x i8] c"ReadIeeeExtendedLowHigh"
@__profn_WriteIeeeFloatLowHigh = private constant [21 x i8] c"WriteIeeeFloatLowHigh"
@__profn_WriteIeeeFloatHighLow = private constant [21 x i8] c"WriteIeeeFloatHighLow"
@__profn_WriteIeeeDoubleLowHigh = private constant [22 x i8] c"WriteIeeeDoubleLowHigh"
@__profn_WriteIeeeDoubleHighLow = private constant [22 x i8] c"WriteIeeeDoubleHighLow"
@__profn_WriteIeeeExtendedLowHigh = private constant [24 x i8] c"WriteIeeeExtendedLowHigh"
@__profn_WriteIeeeExtendedHighLow = private constant [24 x i8] c"WriteIeeeExtendedHighLow"
@__profc_ReadByte = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ReadByte = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2488396768820475588, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ReadByte, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*)* @ReadByte to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_Read16BitsLowHigh = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Read16BitsLowHigh = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3316835259072805393, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_Read16BitsLowHigh, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*)* @Read16BitsLowHigh to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_Read16BitsHighLow = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Read16BitsHighLow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5859643332061769972, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_Read16BitsHighLow, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*)* @Read16BitsHighLow to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_Write8Bits = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Write8Bits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4807079762329650545, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Write8Bits, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, i32)* @Write8Bits to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_Write16BitsLowHigh = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Write16BitsLowHigh = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7056235930438205238, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Write16BitsLowHigh, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, i32)* @Write16BitsLowHigh to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_Write16BitsHighLow = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Write16BitsHighLow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -534656143627785348, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Write16BitsHighLow, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, i32)* @Write16BitsHighLow to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_Read24BitsHighLow = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Read24BitsHighLow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1571844355408786102, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_Read24BitsHighLow, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*)* @Read24BitsHighLow to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_Read32Bits = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Read32Bits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3102835151637930481, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Read32Bits, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*)* @Read32Bits to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_Read32BitsHighLow = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Read32BitsHighLow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5420341040075438084, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Read32BitsHighLow, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*)* @Read32BitsHighLow to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_Write32Bits = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Write32Bits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7086337170580192011, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Write32Bits, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, i32)* @Write32Bits to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_Write32BitsLowHigh = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Write32BitsLowHigh = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2267636531913250733, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Write32BitsLowHigh, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, i32)* @Write32BitsLowHigh to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_Write32BitsHighLow = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Write32BitsHighLow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -510606158692208768, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Write32BitsHighLow, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, i32)* @Write32BitsHighLow to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ReadBytes = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ReadBytes = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5908062461180916569, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ReadBytes, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, i8*, i32)* @ReadBytes to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ReadBytesSwapped = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ReadBytesSwapped = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8786155870337411521, i64 49837926774, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ReadBytesSwapped, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, i8*, i32)* @ReadBytesSwapped to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_WriteBytes = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_WriteBytes = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2764761552066602779, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_WriteBytes, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, i8*, i32)* @WriteBytes to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_WriteBytesSwapped = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_WriteBytesSwapped = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5257530622595023426, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_WriteBytesSwapped, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, i8*, i32)* @WriteBytesSwapped to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ReadIeeeFloatHighLow = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ReadIeeeFloatHighLow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4590701515587727307, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ReadIeeeFloatHighLow, i32 0, i32 0), i8* bitcast (double (%struct._IO_FILE*)* @ReadIeeeFloatHighLow to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ReadIeeeFloatLowHigh = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ReadIeeeFloatLowHigh = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5641002303249736445, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ReadIeeeFloatLowHigh, i32 0, i32 0), i8* bitcast (double (%struct._IO_FILE*)* @ReadIeeeFloatLowHigh to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ReadIeeeDoubleHighLow = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ReadIeeeDoubleHighLow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6496326807612547363, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ReadIeeeDoubleHighLow, i32 0, i32 0), i8* bitcast (double (%struct._IO_FILE*)* @ReadIeeeDoubleHighLow to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ReadIeeeDoubleLowHigh = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ReadIeeeDoubleLowHigh = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2347360114795792234, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ReadIeeeDoubleLowHigh, i32 0, i32 0), i8* bitcast (double (%struct._IO_FILE*)* @ReadIeeeDoubleLowHigh to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ReadIeeeExtendedHighLow = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ReadIeeeExtendedHighLow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -787962670200018713, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ReadIeeeExtendedHighLow, i32 0, i32 0), i8* bitcast (double (%struct._IO_FILE*)* @ReadIeeeExtendedHighLow to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ReadIeeeExtendedLowHigh = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ReadIeeeExtendedLowHigh = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -488975391110015124, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ReadIeeeExtendedLowHigh, i32 0, i32 0), i8* bitcast (double (%struct._IO_FILE*)* @ReadIeeeExtendedLowHigh to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_WriteIeeeFloatLowHigh = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_WriteIeeeFloatLowHigh = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5529426469298018179, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_WriteIeeeFloatLowHigh, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, double)* @WriteIeeeFloatLowHigh to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_WriteIeeeFloatHighLow = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_WriteIeeeFloatHighLow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7367199623313471432, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_WriteIeeeFloatHighLow, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, double)* @WriteIeeeFloatHighLow to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_WriteIeeeDoubleLowHigh = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_WriteIeeeDoubleLowHigh = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4539588072155681575, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_WriteIeeeDoubleLowHigh, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, double)* @WriteIeeeDoubleLowHigh to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_WriteIeeeDoubleHighLow = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_WriteIeeeDoubleHighLow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1619869565084381044, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_WriteIeeeDoubleHighLow, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, double)* @WriteIeeeDoubleHighLow to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_WriteIeeeExtendedLowHigh = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_WriteIeeeExtendedLowHigh = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4480050559855719686, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_WriteIeeeExtendedLowHigh, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, double)* @WriteIeeeExtendedLowHigh to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_WriteIeeeExtendedHighLow = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_WriteIeeeExtendedHighLow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4329435703064787979, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_WriteIeeeExtendedHighLow, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*, double)* @WriteIeeeExtendedHighLow to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [163 x i8] c"\88\04\9F\01x\DAu\90A\0B\C20\0C\85\D9Or\8Ax\1E*\0A\9E\EA\C1s\A5A\0B\C3\0E\971\FD\F7.v\B5I\8A\B7\D7//yi\0CX\D7\BC\11*3\89\C5\BA\F1\D8\9F\C2x\F0\B7;#\F4\9Chuyz\84\0D\91(\A5\9F\A1\D4@#\EA\95&\CB\FA;\22K1\7F\AE2-\02d\87\99\D7\EF\B3:\8F\B6\EB\C0Ew\ACe\99\8A\E4>\02\C0\BE\0D\16\F9\B0\1F\E4W \B8\0D\C3\B5\05m\8DT{w/\84\87\03\A7\DD\89\8B\0F\15\89\92\8A\DB\94\91\0A\17\EE\BF\91j\C7\0F\9E\F0\BB\DF", section "__llvm_prf_names"
@llvm.used = appending global [29 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ReadByte to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Read16BitsLowHigh to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Read16BitsHighLow to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Write8Bits to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Write16BitsLowHigh to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Write16BitsHighLow to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Read24BitsHighLow to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Read32Bits to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Read32BitsHighLow to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Write32Bits to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Write32BitsLowHigh to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Write32BitsHighLow to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ReadBytes to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ReadBytesSwapped to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_WriteBytes to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_WriteBytesSwapped to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ReadIeeeFloatHighLow to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ReadIeeeFloatLowHigh to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ReadIeeeDoubleHighLow to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ReadIeeeDoubleLowHigh to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ReadIeeeExtendedHighLow to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ReadIeeeExtendedLowHigh to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_WriteIeeeFloatLowHigh to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_WriteIeeeFloatHighLow to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_WriteIeeeDoubleLowHigh to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_WriteIeeeDoubleHighLow to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_WriteIeeeExtendedLowHigh to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_WriteIeeeExtendedHighLow to i8*), i8* getelementptr inbounds ([163 x i8], [163 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @ReadByte(%struct._IO_FILE*) #0 {
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %5 = call i32 @_IO_getc(%struct._IO_FILE* %4)
  %6 = and i32 %5, 255
  store i32 %6, i32* %3, align 4
  %7 = load i32, i32* %3, align 4
  %8 = and i32 %7, 128
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ReadByte, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ReadByte, i64 0, i64 1)
  %12 = load i32, i32* %3, align 4
  %13 = sub nsw i32 %12, 256
  store i32 %13, i32* %3, align 4
  br label %14

; <label>:14:                                     ; preds = %10, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ReadByte, i64 0, i64 0)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ReadByte, i64 0, i64 0)
  %16 = load i32, i32* %3, align 4
  ret i32 %16
}

declare i32 @_IO_getc(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @Read16BitsLowHigh(%struct._IO_FILE*) #0 {
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %7 = call i32 @_IO_getc(%struct._IO_FILE* %6)
  %8 = and i32 255, %7
  store i32 %8, i32* %3, align 4
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %10 = call i32 @_IO_getc(%struct._IO_FILE* %9)
  %11 = and i32 255, %10
  store i32 %11, i32* %4, align 4
  %12 = load i32, i32* %4, align 4
  %13 = shl i32 %12, 8
  %14 = load i32, i32* %3, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, i32* %5, align 4
  %16 = load i32, i32* %5, align 4
  %17 = and i32 %16, 32768
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_Read16BitsLowHigh, i64 0, i64 1)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_Read16BitsLowHigh, i64 0, i64 1)
  %21 = load i32, i32* %5, align 4
  %22 = sub nsw i32 %21, 65536
  store i32 %22, i32* %5, align 4
  br label %23

; <label>:23:                                     ; preds = %19, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_Read16BitsLowHigh, i64 0, i64 0)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_Read16BitsLowHigh, i64 0, i64 0)
  %25 = load i32, i32* %5, align 4
  ret i32 %25
}

; Function Attrs: nounwind uwtable
define i32 @Read16BitsHighLow(%struct._IO_FILE*) #0 {
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %7 = call i32 @_IO_getc(%struct._IO_FILE* %6)
  %8 = and i32 255, %7
  store i32 %8, i32* %3, align 4
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %10 = call i32 @_IO_getc(%struct._IO_FILE* %9)
  %11 = and i32 255, %10
  store i32 %11, i32* %4, align 4
  %12 = load i32, i32* %3, align 4
  %13 = shl i32 %12, 8
  %14 = load i32, i32* %4, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, i32* %5, align 4
  %16 = load i32, i32* %5, align 4
  %17 = and i32 %16, 32768
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_Read16BitsHighLow, i64 0, i64 1)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_Read16BitsHighLow, i64 0, i64 1)
  %21 = load i32, i32* %5, align 4
  %22 = sub nsw i32 %21, 65536
  store i32 %22, i32* %5, align 4
  br label %23

; <label>:23:                                     ; preds = %19, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_Read16BitsHighLow, i64 0, i64 0)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_Read16BitsHighLow, i64 0, i64 0)
  %25 = load i32, i32* %5, align 4
  ret i32 %25
}

; Function Attrs: nounwind uwtable
define void @Write8Bits(%struct._IO_FILE*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Write8Bits, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Write8Bits, i64 0, i64 0)
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = and i32 %6, 255
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %9 = call i32 @_IO_putc(i32 %7, %struct._IO_FILE* %8)
  ret void
}

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @Write16BitsLowHigh(%struct._IO_FILE*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Write16BitsLowHigh, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Write16BitsLowHigh, i64 0, i64 0)
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = and i32 %6, 255
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %9 = call i32 @_IO_putc(i32 %7, %struct._IO_FILE* %8)
  %10 = load i32, i32* %5, align 4
  %11 = ashr i32 %10, 8
  %12 = and i32 %11, 255
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %14 = call i32 @_IO_putc(i32 %12, %struct._IO_FILE* %13)
  ret void
}

; Function Attrs: nounwind uwtable
define void @Write16BitsHighLow(%struct._IO_FILE*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Write16BitsHighLow, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Write16BitsHighLow, i64 0, i64 0)
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = ashr i32 %6, 8
  %8 = and i32 %7, 255
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %10 = call i32 @_IO_putc(i32 %8, %struct._IO_FILE* %9)
  %11 = load i32, i32* %5, align 4
  %12 = and i32 %11, 255
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %14 = call i32 @_IO_putc(i32 %12, %struct._IO_FILE* %13)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @Read24BitsHighLow(%struct._IO_FILE*) #0 {
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %8 = call i32 @_IO_getc(%struct._IO_FILE* %7)
  %9 = and i32 255, %8
  store i32 %9, i32* %3, align 4
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %11 = call i32 @_IO_getc(%struct._IO_FILE* %10)
  %12 = and i32 255, %11
  store i32 %12, i32* %4, align 4
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %14 = call i32 @_IO_getc(%struct._IO_FILE* %13)
  %15 = and i32 255, %14
  store i32 %15, i32* %5, align 4
  %16 = load i32, i32* %3, align 4
  %17 = shl i32 %16, 16
  %18 = load i32, i32* %4, align 4
  %19 = shl i32 %18, 8
  %20 = add nsw i32 %17, %19
  %21 = load i32, i32* %5, align 4
  %22 = add nsw i32 %20, %21
  store i32 %22, i32* %6, align 4
  %23 = load i32, i32* %6, align 4
  %24 = and i32 %23, 8388608
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %30

; <label>:26:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_Read24BitsHighLow, i64 0, i64 1)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_Read24BitsHighLow, i64 0, i64 1)
  %28 = load i32, i32* %6, align 4
  %29 = sub nsw i32 %28, 16777216
  store i32 %29, i32* %6, align 4
  br label %30

; <label>:30:                                     ; preds = %26, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_Read24BitsHighLow, i64 0, i64 0)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_Read24BitsHighLow, i64 0, i64 0)
  %32 = load i32, i32* %6, align 4
  ret i32 %32
}

; Function Attrs: nounwind uwtable
define i32 @Read32Bits(%struct._IO_FILE*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Read32Bits, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Read32Bits, i64 0, i64 0)
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %8 = call i32 @Read16BitsLowHigh(%struct._IO_FILE* %7)
  %9 = and i32 65535, %8
  store i32 %9, i32* %4, align 4
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %11 = call i32 @Read16BitsLowHigh(%struct._IO_FILE* %10)
  %12 = and i32 65535, %11
  store i32 %12, i32* %5, align 4
  %13 = load i32, i32* %5, align 4
  %14 = shl i32 %13, 16
  %15 = load i32, i32* %4, align 4
  %16 = add nsw i32 %14, %15
  store i32 %16, i32* %6, align 4
  %17 = load i32, i32* %6, align 4
  ret i32 %17
}

; Function Attrs: nounwind uwtable
define i32 @Read32BitsHighLow(%struct._IO_FILE*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Read32BitsHighLow, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Read32BitsHighLow, i64 0, i64 0)
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %8 = call i32 @Read16BitsHighLow(%struct._IO_FILE* %7)
  %9 = and i32 65535, %8
  store i32 %9, i32* %4, align 4
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %11 = call i32 @Read16BitsHighLow(%struct._IO_FILE* %10)
  %12 = and i32 65535, %11
  store i32 %12, i32* %5, align 4
  %13 = load i32, i32* %4, align 4
  %14 = shl i32 %13, 16
  %15 = load i32, i32* %5, align 4
  %16 = add nsw i32 %14, %15
  store i32 %16, i32* %6, align 4
  %17 = load i32, i32* %6, align 4
  ret i32 %17
}

; Function Attrs: nounwind uwtable
define void @Write32Bits(%struct._IO_FILE*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Write32Bits, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Write32Bits, i64 0, i64 0)
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %7 = load i32, i32* %5, align 4
  %8 = sext i32 %7 to i64
  %9 = and i64 %8, 65535
  %10 = trunc i64 %9 to i32
  call void @Write16BitsLowHigh(%struct._IO_FILE* %6, i32 %10)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %12 = load i32, i32* %5, align 4
  %13 = ashr i32 %12, 16
  %14 = sext i32 %13 to i64
  %15 = and i64 %14, 65535
  %16 = trunc i64 %15 to i32
  call void @Write16BitsLowHigh(%struct._IO_FILE* %11, i32 %16)
  ret void
}

; Function Attrs: nounwind uwtable
define void @Write32BitsLowHigh(%struct._IO_FILE*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Write32BitsLowHigh, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Write32BitsLowHigh, i64 0, i64 0)
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %7 = load i32, i32* %5, align 4
  %8 = sext i32 %7 to i64
  %9 = and i64 %8, 65535
  %10 = trunc i64 %9 to i32
  call void @Write16BitsLowHigh(%struct._IO_FILE* %6, i32 %10)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %12 = load i32, i32* %5, align 4
  %13 = ashr i32 %12, 16
  %14 = sext i32 %13 to i64
  %15 = and i64 %14, 65535
  %16 = trunc i64 %15 to i32
  call void @Write16BitsLowHigh(%struct._IO_FILE* %11, i32 %16)
  ret void
}

; Function Attrs: nounwind uwtable
define void @Write32BitsHighLow(%struct._IO_FILE*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Write32BitsHighLow, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Write32BitsHighLow, i64 0, i64 0)
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %7 = load i32, i32* %5, align 4
  %8 = ashr i32 %7, 16
  %9 = sext i32 %8 to i64
  %10 = and i64 %9, 65535
  %11 = trunc i64 %10 to i32
  call void @Write16BitsHighLow(%struct._IO_FILE* %6, i32 %11)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %13 = load i32, i32* %5, align 4
  %14 = sext i32 %13 to i64
  %15 = and i64 %14, 65535
  %16 = trunc i64 %15 to i32
  call void @Write16BitsHighLow(%struct._IO_FILE* %12, i32 %16)
  ret void
}

; Function Attrs: nounwind uwtable
define void @ReadBytes(%struct._IO_FILE*, i8*, i32) #0 {
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  br label %7

; <label>:7:                                      ; preds = %19, %3
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %9 = call i32 @feof(%struct._IO_FILE* %8) #3
  %10 = icmp ne i32 %9, 0
  %11 = xor i1 %10, true
  %12 = zext i1 %11 to i32
  %13 = load i32, i32* %6, align 4
  %14 = add nsw i32 %13, -1
  store i32 %14, i32* %6, align 4
  %15 = icmp sgt i32 %13, 0
  %16 = zext i1 %15 to i32
  %17 = and i32 %12, %16
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %26

; <label>:19:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ReadBytes, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ReadBytes, i64 0, i64 0)
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %22 = call i32 @_IO_getc(%struct._IO_FILE* %21)
  %23 = trunc i32 %22 to i8
  %24 = load i8*, i8** %5, align 8
  %25 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %25, i8** %5, align 8
  store i8 %23, i8* %24, align 1
  br label %7

; <label>:26:                                     ; preds = %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ReadBytes, i64 0, i64 1)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ReadBytes, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind
declare i32 @feof(%struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define void @ReadBytesSwapped(%struct._IO_FILE*, i8*, i32) #0 {
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %8 = load i8*, i8** %5, align 8
  store i8* %8, i8** %7, align 8
  br label %9

; <label>:9:                                      ; preds = %21, %3
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %11 = call i32 @feof(%struct._IO_FILE* %10) #3
  %12 = icmp ne i32 %11, 0
  %13 = xor i1 %12, true
  %14 = zext i1 %13 to i32
  %15 = load i32, i32* %6, align 4
  %16 = add nsw i32 %15, -1
  store i32 %16, i32* %6, align 4
  %17 = icmp sgt i32 %15, 0
  %18 = zext i1 %17 to i32
  %19 = and i32 %14, %18
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %28

; <label>:21:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ReadBytesSwapped, i64 0, i64 0)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ReadBytesSwapped, i64 0, i64 0)
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %24 = call i32 @_IO_getc(%struct._IO_FILE* %23)
  %25 = trunc i32 %24 to i8
  %26 = load i8*, i8** %7, align 8
  %27 = getelementptr inbounds i8, i8* %26, i32 1
  store i8* %27, i8** %7, align 8
  store i8 %25, i8* %26, align 1
  br label %9

; <label>:28:                                     ; preds = %9
  %29 = load i8*, i8** %7, align 8
  %30 = getelementptr inbounds i8, i8* %29, i32 -1
  store i8* %30, i8** %7, align 8
  br label %31

; <label>:31:                                     ; preds = %45, %28
  %32 = load i8*, i8** %5, align 8
  %33 = load i8*, i8** %7, align 8
  %34 = icmp ult i8* %32, %33
  br i1 %34, label %35, label %51

; <label>:35:                                     ; preds = %31
  %36 = load i8*, i8** %5, align 8
  %37 = load i8, i8* %36, align 1
  %38 = sext i8 %37 to i32
  store i32 %38, i32* %6, align 4
  %39 = load i8*, i8** %7, align 8
  %40 = load i8, i8* %39, align 1
  %41 = load i8*, i8** %5, align 8
  store i8 %40, i8* %41, align 1
  %42 = load i32, i32* %6, align 4
  %43 = trunc i32 %42 to i8
  %44 = load i8*, i8** %7, align 8
  store i8 %43, i8* %44, align 1
  br label %45

; <label>:45:                                     ; preds = %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ReadBytesSwapped, i64 0, i64 1)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ReadBytesSwapped, i64 0, i64 1)
  %47 = load i8*, i8** %5, align 8
  %48 = getelementptr inbounds i8, i8* %47, i32 1
  store i8* %48, i8** %5, align 8
  %49 = load i8*, i8** %7, align 8
  %50 = getelementptr inbounds i8, i8* %49, i32 -1
  store i8* %50, i8** %7, align 8
  br label %31

; <label>:51:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ReadBytesSwapped, i64 0, i64 2)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ReadBytesSwapped, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind uwtable
define void @WriteBytes(%struct._IO_FILE*, i8*, i32) #0 {
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  br label %7

; <label>:7:                                      ; preds = %11, %3
  %8 = load i32, i32* %6, align 4
  %9 = add nsw i32 %8, -1
  store i32 %9, i32* %6, align 4
  %10 = icmp sgt i32 %8, 0
  br i1 %10, label %11, label %19

; <label>:11:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_WriteBytes, i64 0, i64 0)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_WriteBytes, i64 0, i64 0)
  %13 = load i8*, i8** %5, align 8
  %14 = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %14, i8** %5, align 8
  %15 = load i8, i8* %13, align 1
  %16 = sext i8 %15 to i32
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %18 = call i32 @_IO_putc(i32 %16, %struct._IO_FILE* %17)
  br label %7

; <label>:19:                                     ; preds = %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_WriteBytes, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_WriteBytes, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define void @WriteBytesSwapped(%struct._IO_FILE*, i8*, i32) #0 {
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %7 = load i32, i32* %6, align 4
  %8 = sub nsw i32 %7, 1
  %9 = load i8*, i8** %5, align 8
  %10 = sext i32 %8 to i64
  %11 = getelementptr inbounds i8, i8* %9, i64 %10
  store i8* %11, i8** %5, align 8
  br label %12

; <label>:12:                                     ; preds = %16, %3
  %13 = load i32, i32* %6, align 4
  %14 = add nsw i32 %13, -1
  store i32 %14, i32* %6, align 4
  %15 = icmp sgt i32 %13, 0
  br i1 %15, label %16, label %24

; <label>:16:                                     ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_WriteBytesSwapped, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_WriteBytesSwapped, i64 0, i64 0)
  %18 = load i8*, i8** %5, align 8
  %19 = getelementptr inbounds i8, i8* %18, i32 -1
  store i8* %19, i8** %5, align 8
  %20 = load i8, i8* %18, align 1
  %21 = sext i8 %20 to i32
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %23 = call i32 @_IO_putc(i32 %21, %struct._IO_FILE* %22)
  br label %12

; <label>:24:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_WriteBytesSwapped, i64 0, i64 1)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_WriteBytesSwapped, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define double @ReadIeeeFloatHighLow(%struct._IO_FILE*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ReadIeeeFloatHighLow, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ReadIeeeFloatHighLow, i64 0, i64 0)
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca [4 x i8], align 1
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %6 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i32 0, i32 0
  call void @ReadBytes(%struct._IO_FILE* %5, i8* %6, i32 4)
  %7 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i32 0, i32 0
  %8 = call double @ConvertFromIeeeSingle(i8* %7)
  ret double %8
}

declare double @ConvertFromIeeeSingle(i8*) #1

; Function Attrs: nounwind uwtable
define double @ReadIeeeFloatLowHigh(%struct._IO_FILE*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ReadIeeeFloatLowHigh, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ReadIeeeFloatLowHigh, i64 0, i64 0)
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca [4 x i8], align 1
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %6 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i32 0, i32 0
  call void @ReadBytesSwapped(%struct._IO_FILE* %5, i8* %6, i32 4)
  %7 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i32 0, i32 0
  %8 = call double @ConvertFromIeeeSingle(i8* %7)
  ret double %8
}

; Function Attrs: nounwind uwtable
define double @ReadIeeeDoubleHighLow(%struct._IO_FILE*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ReadIeeeDoubleHighLow, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ReadIeeeDoubleHighLow, i64 0, i64 0)
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca [8 x i8], align 1
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %6 = getelementptr inbounds [8 x i8], [8 x i8]* %4, i32 0, i32 0
  call void @ReadBytes(%struct._IO_FILE* %5, i8* %6, i32 8)
  %7 = getelementptr inbounds [8 x i8], [8 x i8]* %4, i32 0, i32 0
  %8 = call double @ConvertFromIeeeDouble(i8* %7)
  ret double %8
}

declare double @ConvertFromIeeeDouble(i8*) #1

; Function Attrs: nounwind uwtable
define double @ReadIeeeDoubleLowHigh(%struct._IO_FILE*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ReadIeeeDoubleLowHigh, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ReadIeeeDoubleLowHigh, i64 0, i64 0)
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca [8 x i8], align 1
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %6 = getelementptr inbounds [8 x i8], [8 x i8]* %4, i32 0, i32 0
  call void @ReadBytesSwapped(%struct._IO_FILE* %5, i8* %6, i32 8)
  %7 = getelementptr inbounds [8 x i8], [8 x i8]* %4, i32 0, i32 0
  %8 = call double @ConvertFromIeeeDouble(i8* %7)
  ret double %8
}

; Function Attrs: nounwind uwtable
define double @ReadIeeeExtendedHighLow(%struct._IO_FILE*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ReadIeeeExtendedHighLow, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ReadIeeeExtendedHighLow, i64 0, i64 0)
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca [10 x i8], align 1
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %6 = getelementptr inbounds [10 x i8], [10 x i8]* %4, i32 0, i32 0
  call void @ReadBytes(%struct._IO_FILE* %5, i8* %6, i32 10)
  %7 = getelementptr inbounds [10 x i8], [10 x i8]* %4, i32 0, i32 0
  %8 = call double @ConvertFromIeeeExtended(i8* %7)
  ret double %8
}

declare double @ConvertFromIeeeExtended(i8*) #1

; Function Attrs: nounwind uwtable
define double @ReadIeeeExtendedLowHigh(%struct._IO_FILE*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ReadIeeeExtendedLowHigh, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ReadIeeeExtendedLowHigh, i64 0, i64 0)
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca [10 x i8], align 1
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %6 = getelementptr inbounds [10 x i8], [10 x i8]* %4, i32 0, i32 0
  call void @ReadBytesSwapped(%struct._IO_FILE* %5, i8* %6, i32 10)
  %7 = getelementptr inbounds [10 x i8], [10 x i8]* %4, i32 0, i32 0
  %8 = call double @ConvertFromIeeeExtended(i8* %7)
  ret double %8
}

; Function Attrs: nounwind uwtable
define void @WriteIeeeFloatLowHigh(%struct._IO_FILE*, double) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_WriteIeeeFloatLowHigh, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_WriteIeeeFloatLowHigh, i64 0, i64 0)
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca double, align 8
  %6 = alloca [4 x i8], align 1
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store double %1, double* %5, align 8
  %7 = load double, double* %5, align 8
  %8 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i32 0, i32 0
  call void @ConvertToIeeeSingle(double %7, i8* %8)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %10 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i32 0, i32 0
  call void @WriteBytesSwapped(%struct._IO_FILE* %9, i8* %10, i32 4)
  ret void
}

declare void @ConvertToIeeeSingle(double, i8*) #1

; Function Attrs: nounwind uwtable
define void @WriteIeeeFloatHighLow(%struct._IO_FILE*, double) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_WriteIeeeFloatHighLow, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_WriteIeeeFloatHighLow, i64 0, i64 0)
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca double, align 8
  %6 = alloca [4 x i8], align 1
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store double %1, double* %5, align 8
  %7 = load double, double* %5, align 8
  %8 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i32 0, i32 0
  call void @ConvertToIeeeSingle(double %7, i8* %8)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %10 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i32 0, i32 0
  call void @WriteBytes(%struct._IO_FILE* %9, i8* %10, i32 4)
  ret void
}

; Function Attrs: nounwind uwtable
define void @WriteIeeeDoubleLowHigh(%struct._IO_FILE*, double) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_WriteIeeeDoubleLowHigh, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_WriteIeeeDoubleLowHigh, i64 0, i64 0)
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca double, align 8
  %6 = alloca [8 x i8], align 1
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store double %1, double* %5, align 8
  %7 = load double, double* %5, align 8
  %8 = getelementptr inbounds [8 x i8], [8 x i8]* %6, i32 0, i32 0
  call void @ConvertToIeeeDouble(double %7, i8* %8)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %10 = getelementptr inbounds [8 x i8], [8 x i8]* %6, i32 0, i32 0
  call void @WriteBytesSwapped(%struct._IO_FILE* %9, i8* %10, i32 8)
  ret void
}

declare void @ConvertToIeeeDouble(double, i8*) #1

; Function Attrs: nounwind uwtable
define void @WriteIeeeDoubleHighLow(%struct._IO_FILE*, double) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_WriteIeeeDoubleHighLow, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_WriteIeeeDoubleHighLow, i64 0, i64 0)
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca double, align 8
  %6 = alloca [8 x i8], align 1
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store double %1, double* %5, align 8
  %7 = load double, double* %5, align 8
  %8 = getelementptr inbounds [8 x i8], [8 x i8]* %6, i32 0, i32 0
  call void @ConvertToIeeeDouble(double %7, i8* %8)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %10 = getelementptr inbounds [8 x i8], [8 x i8]* %6, i32 0, i32 0
  call void @WriteBytes(%struct._IO_FILE* %9, i8* %10, i32 8)
  ret void
}

; Function Attrs: nounwind uwtable
define void @WriteIeeeExtendedLowHigh(%struct._IO_FILE*, double) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_WriteIeeeExtendedLowHigh, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_WriteIeeeExtendedLowHigh, i64 0, i64 0)
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca double, align 8
  %6 = alloca [10 x i8], align 1
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store double %1, double* %5, align 8
  %7 = load double, double* %5, align 8
  %8 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i32 0, i32 0
  call void @ConvertToIeeeExtended(double %7, i8* %8)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %10 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i32 0, i32 0
  call void @WriteBytesSwapped(%struct._IO_FILE* %9, i8* %10, i32 10)
  ret void
}

declare void @ConvertToIeeeExtended(double, i8*) #1

; Function Attrs: nounwind uwtable
define void @WriteIeeeExtendedHighLow(%struct._IO_FILE*, double) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_WriteIeeeExtendedHighLow, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_WriteIeeeExtendedHighLow, i64 0, i64 0)
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca double, align 8
  %6 = alloca [10 x i8], align 1
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store double %1, double* %5, align 8
  %7 = load double, double* %5, align 8
  %8 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i32 0, i32 0
  call void @ConvertToIeeeExtended(double %7, i8* %8)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %10 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i32 0, i32 0
  call void @WriteBytes(%struct._IO_FILE* %9, i8* %10, i32 10)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
