; ModuleID = 'tmp1.ll'
source_filename = "formatBitstream.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.side_info_link = type { %struct.side_info_link*, %struct.MYSideInfo }
%struct.MYSideInfo = type { i32, i32, i32, i32, %struct.BF_PartHolder*, %struct.BF_PartHolder*, [2 x %struct.BF_PartHolder*], [2 x [2 x %struct.BF_PartHolder*]] }
%struct.BF_PartHolder = type { i32, %struct.BF_BitstreamPart* }
%struct.BF_BitstreamPart = type { i32, %struct.BF_BitstreamElement* }
%struct.BF_BitstreamElement = type { i32, i16 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.BF_FrameData = type { i32, i32, i32, %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart*, [2 x %struct.BF_BitstreamPart*], [2 x [2 x %struct.BF_BitstreamPart*]], [2 x [2 x %struct.BF_BitstreamPart*]], [2 x [2 x %struct.BF_BitstreamPart*]], [2 x [2 x %struct.BF_BitstreamPart*]], %struct.BF_BitstreamPart* }
%struct.BF_FrameResults = type { i32, i32, i32 }

$__llvm_profile_raw_version = comdat any

@BitCount = internal global i32 0, align 4
@ThisFrameSize = internal global i32 0, align 4
@BitsRemaining = internal global i32 0, align 4
@.str = private unnamed_addr constant [37 x i8] c"frameInfo->nGranules <= MAX_GRANULES\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"formatBitstream.c\00", align 1
@__PRETTY_FUNCTION__.BF_BitstreamFrame = private unnamed_addr constant [58 x i8] c"void BF_BitstreamFrame(BF_FrameData *, BF_FrameResults *)\00", align 1
@.str.2 = private unnamed_addr constant [37 x i8] c"frameInfo->nChannels <= MAX_CHANNELS\00", align 1
@.str.3 = private unnamed_addr constant [25 x i8] c"(BitsRemaining % 8) == 0\00", align 1
@forwardFrameLength = internal global i32 0, align 4
@forwardSILength = internal global i32 0, align 4
@elements = internal global i32 0, align 4
@.str.4 = private unnamed_addr constant [6 x i8] c"newPH\00", align 1
@__PRETTY_FUNCTION__.BF_newPartHolder = private unnamed_addr constant [37 x i8] c"BF_PartHolder *BF_newPartHolder(int)\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"newPH->part\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"newPH->part->element\00", align 1
@.str.7 = private unnamed_addr constant [8 x i8] c"results\00", align 1
@__PRETTY_FUNCTION__.writePartMainData = private unnamed_addr constant [61 x i8] c"int writePartMainData(BF_BitstreamPart *, BF_FrameResults *)\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"part\00", align 1
@.str.9 = private unnamed_addr constant [12 x i8] c"nbits <= 32\00", align 1
@__PRETTY_FUNCTION__.WriteMainDataBits = private unnamed_addr constant [56 x i8] c"void WriteMainDataBits(u_int, u_int, BF_FrameResults *)\00", align 1
@.str.10 = private unnamed_addr constant [26 x i8] c"BitCount <= ThisFrameSize\00", align 1
@.str.11 = private unnamed_addr constant [19 x i8] c"BitsRemaining >= 0\00", align 1
@.str.12 = private unnamed_addr constant [44 x i8] c"(BitCount + BitsRemaining) == ThisFrameSize\00", align 1
@__PRETTY_FUNCTION__.writePartSideInfo = private unnamed_addr constant [61 x i8] c"int writePartSideInfo(BF_BitstreamPart *, BF_FrameResults *)\00", align 1
@side_queue_free = internal global %struct.side_info_link* null, align 8
@side_queue_head = internal global %struct.side_info_link* null, align 8
@.str.13 = private unnamed_addr constant [2 x i8] c"l\00", align 1
@__PRETTY_FUNCTION__.get_side_info = private unnamed_addr constant [32 x i8] c"MYSideInfo *get_side_info(void)\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.14 = private unnamed_addr constant [31 x i8] c"cannot allocate side_info_link\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_InitFormatBitStream = private constant [19 x i8] c"InitFormatBitStream"
@__profn_BF_BitstreamFrame = private constant [17 x i8] c"BF_BitstreamFrame"
@__profn_tmp1.ll_store_side_info = private constant [23 x i8] c"tmp1.ll:store_side_info"
@__profn_tmp1.ll_main_data = private constant [17 x i8] c"tmp1.ll:main_data"
@__profn_tmp1.ll_side_queue_elements = private constant [27 x i8] c"tmp1.ll:side_queue_elements"
@__profn_BF_FlushBitstream = private constant [17 x i8] c"BF_FlushBitstream"
@__profn_tmp1.ll_WriteMainDataBits = private constant [25 x i8] c"tmp1.ll:WriteMainDataBits"
@__profn_tmp1.ll_free_side_queues = private constant [24 x i8] c"tmp1.ll:free_side_queues"
@__profn_BF_PartLength = private constant [13 x i8] c"BF_PartLength"
@__profn_BF_newPartHolder = private constant [16 x i8] c"BF_newPartHolder"
@__profn_BF_NewHolderFromBitstreamPart = private constant [29 x i8] c"BF_NewHolderFromBitstreamPart"
@__profn_BF_LoadHolderFromBitstreamPart = private constant [30 x i8] c"BF_LoadHolderFromBitstreamPart"
@__profn_BF_addElement = private constant [13 x i8] c"BF_addElement"
@__profn_BF_resizePartHolder = private constant [19 x i8] c"BF_resizePartHolder"
@__profn_BF_freePartHolder = private constant [17 x i8] c"BF_freePartHolder"
@__profn_BF_addEntry = private constant [11 x i8] c"BF_addEntry"
@__profn_tmp1.ll_writePartMainData = private constant [25 x i8] c"tmp1.ll:writePartMainData"
@__profn_tmp1.ll_write_side_info = private constant [23 x i8] c"tmp1.ll:write_side_info"
@__profn_tmp1.ll_writePartSideInfo = private constant [25 x i8] c"tmp1.ll:writePartSideInfo"
@__profn_tmp1.ll_get_side_info = private constant [21 x i8] c"tmp1.ll:get_side_info"
@__profn_tmp1.ll_free_side_info_link = private constant [27 x i8] c"tmp1.ll:free_side_info_link"
@__profc_InitFormatBitStream = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_InitFormatBitStream = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1154940757702745576, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_InitFormatBitStream, i32 0, i32 0), i8* bitcast (void ()* @InitFormatBitStream to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BF_BitstreamFrame = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BF_BitstreamFrame = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2783442635808403227, i64 75068963977, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BF_BitstreamFrame, i32 0, i32 0), i8* bitcast (void (%struct.BF_FrameData*, %struct.BF_FrameResults*)* @BF_BitstreamFrame to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_store_side_info = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_store_side_info = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4292254930030950725, i64 202972424662, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i32 0, i32 0), i8* null, i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_main_data = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_main_data = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_main_data = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1604021133162345221, i64 1125953835910912, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_main_data, i32 0, i32 0), i8* null, i8* bitcast ([4 x i64]* @__profvp_tmp1.ll_main_data to i8*), i32 3, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_side_queue_elements = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_side_queue_elements = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5583163775679877120, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_side_queue_elements, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BF_FlushBitstream = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BF_FlushBitstream = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -620709865242272599, i64 40425548223, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BF_FlushBitstream, i32 0, i32 0), i8* bitcast (void (%struct.BF_FrameData*, %struct.BF_FrameResults*)* @BF_FlushBitstream to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_WriteMainDataBits = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_WriteMainDataBits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6468807736930143941, i64 139133743072, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_WriteMainDataBits, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_free_side_queues = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_free_side_queues = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7538668266375943388, i64 52028904346, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_free_side_queues, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BF_PartLength = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BF_PartLength = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6166696774666832559, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_PartLength, i32 0, i32 0), i8* bitcast (i32 (%struct.BF_BitstreamPart*)* @BF_PartLength to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BF_newPartHolder = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BF_newPartHolder = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 684897289096478655, i64 90083771758, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BF_newPartHolder, i32 0, i32 0), i8* bitcast (%struct.BF_PartHolder* (i32)* @BF_newPartHolder to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BF_NewHolderFromBitstreamPart = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BF_NewHolderFromBitstreamPart = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6268373398309499344, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BF_NewHolderFromBitstreamPart, i32 0, i32 0), i8* bitcast (%struct.BF_PartHolder* (%struct.BF_BitstreamPart*)* @BF_NewHolderFromBitstreamPart to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BF_LoadHolderFromBitstreamPart = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BF_LoadHolderFromBitstreamPart = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7060423334018412336, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_LoadHolderFromBitstreamPart, i32 0, i32 0), i8* bitcast (%struct.BF_PartHolder* (%struct.BF_PartHolder*, %struct.BF_BitstreamPart*)* @BF_LoadHolderFromBitstreamPart to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BF_addElement = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BF_addElement = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2804736114996505363, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_addElement, i32 0, i32 0), i8* bitcast (%struct.BF_PartHolder* (%struct.BF_PartHolder*, %struct.BF_BitstreamElement*)* @BF_addElement to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BF_resizePartHolder = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BF_resizePartHolder = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2415223224931770625, i64 47960767270, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BF_resizePartHolder, i32 0, i32 0), i8* bitcast (%struct.BF_PartHolder* (%struct.BF_PartHolder*, i32)* @BF_resizePartHolder to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BF_freePartHolder = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BF_freePartHolder = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4991553640441067632, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BF_freePartHolder, i32 0, i32 0), i8* bitcast (%struct.BF_PartHolder* (%struct.BF_PartHolder*)* @BF_freePartHolder to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BF_addEntry = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BF_addEntry = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1081105080348416648, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_addEntry, i32 0, i32 0), i8* bitcast (%struct.BF_PartHolder* (%struct.BF_PartHolder*, i32, i32)* @BF_addEntry to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_writePartMainData = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_writePartMainData = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2371126066023831577, i64 75366768110, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_writePartMainData, i32 0, i32 0), i8* bitcast (i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)* @writePartMainData to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_write_side_info = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_write_side_info = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_write_side_info = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4937740458399717825, i64 1125973651499913, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_write_side_info, i32 0, i32 0), i8* null, i8* bitcast ([4 x i64]* @__profvp_tmp1.ll_write_side_info to i8*), i32 4, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_writePartSideInfo = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_writePartSideInfo = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2723811297300477310, i64 53819594620, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_writePartSideInfo, i32 0, i32 0), i8* bitcast (i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)* @writePartSideInfo to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_side_info = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_get_side_info = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2902757980611942239, i64 33962515092, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_side_info, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_free_side_info_link = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_free_side_info_link = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -837752378006670422, i64 73744657289, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_free_side_info_link, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [16 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [461 x i8] c"\CA\03\00InitFormatBitStream\01BF_BitstreamFrame\01tmp1.ll:store_side_info\01tmp1.ll:main_data\01tmp1.ll:side_queue_elements\01BF_FlushBitstream\01tmp1.ll:WriteMainDataBits\01tmp1.ll:free_side_queues\01BF_PartLength\01BF_newPartHolder\01BF_NewHolderFromBitstreamPart\01BF_LoadHolderFromBitstreamPart\01BF_addElement\01BF_resizePartHolder\01BF_freePartHolder\01BF_addEntry\01tmp1.ll:writePartMainData\01tmp1.ll:write_side_info\01tmp1.ll:writePartSideInfo\01tmp1.ll:get_side_info\01tmp1.ll:free_side_info_link", section "__llvm_prf_names"
@llvm.used = appending global [23 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_InitFormatBitStream to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BF_BitstreamFrame to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_store_side_info to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_main_data to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_side_queue_elements to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BF_FlushBitstream to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_WriteMainDataBits to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_free_side_queues to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BF_PartLength to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BF_newPartHolder to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BF_NewHolderFromBitstreamPart to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BF_LoadHolderFromBitstreamPart to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BF_addElement to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BF_resizePartHolder to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BF_freePartHolder to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BF_addEntry to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_writePartMainData to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_side_info to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_writePartSideInfo to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_side_info to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_free_side_info_link to i8*), i8* bitcast ([16 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([461 x i8], [461 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @InitFormatBitStream() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_InitFormatBitStream, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_InitFormatBitStream, i64 0, i64 0)
  store i32 0, i32* @BitCount, align 4
  store i32 0, i32* @ThisFrameSize, align 4
  store i32 0, i32* @BitsRemaining, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @BF_BitstreamFrame(%struct.BF_FrameData*, %struct.BF_FrameResults*) #0 {
  %3 = alloca %struct.BF_FrameData*, align 8
  %4 = alloca %struct.BF_FrameResults*, align 8
  store %struct.BF_FrameData* %0, %struct.BF_FrameData** %3, align 8
  store %struct.BF_FrameResults* %1, %struct.BF_FrameResults** %4, align 8
  %5 = load %struct.BF_FrameData*, %struct.BF_FrameData** %3, align 8
  %6 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %5, i32 0, i32 1
  %7 = load i32, i32* %6, align 4
  %8 = icmp sle i32 %7, 2
  br i1 %8, label %9, label %10

; <label>:9:                                      ; preds = %2
  br label %13

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BF_BitstreamFrame, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BF_BitstreamFrame, i64 0, i64 1)
  call void @__assert_fail(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0), i32 59, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__PRETTY_FUNCTION__.BF_BitstreamFrame, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %13

; <label>:13:                                     ; preds = %12, %9
  %14 = load %struct.BF_FrameData*, %struct.BF_FrameData** %3, align 8
  %15 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %14, i32 0, i32 2
  %16 = load i32, i32* %15, align 8
  %17 = icmp sle i32 %16, 2
  br i1 %17, label %18, label %19

; <label>:18:                                     ; preds = %13
  br label %22

; <label>:19:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BF_BitstreamFrame, i64 0, i64 2)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BF_BitstreamFrame, i64 0, i64 2)
  call void @__assert_fail(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0), i32 60, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__PRETTY_FUNCTION__.BF_BitstreamFrame, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %22

; <label>:22:                                     ; preds = %21, %18
  %23 = load %struct.BF_FrameData*, %struct.BF_FrameData** %3, align 8
  %24 = call i32 @store_side_info(%struct.BF_FrameData* %23)
  %25 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** %4, align 8
  %26 = getelementptr inbounds %struct.BF_FrameResults, %struct.BF_FrameResults* %25, i32 0, i32 0
  store i32 %24, i32* %26, align 4
  %27 = load %struct.BF_FrameData*, %struct.BF_FrameData** %3, align 8
  %28 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** %4, align 8
  %29 = call i32 @main_data(%struct.BF_FrameData* %27, %struct.BF_FrameResults* %28)
  %30 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** %4, align 8
  %31 = getelementptr inbounds %struct.BF_FrameResults, %struct.BF_FrameResults* %30, i32 0, i32 1
  store i32 %29, i32* %31, align 4
  %32 = load i32, i32* @BitsRemaining, align 4
  %33 = srem i32 %32, 8
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %36

; <label>:35:                                     ; preds = %22
  br label %39

; <label>:36:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BF_BitstreamFrame, i64 0, i64 3)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BF_BitstreamFrame, i64 0, i64 3)
  call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0), i32 74, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__PRETTY_FUNCTION__.BF_BitstreamFrame, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %39

; <label>:39:                                     ; preds = %38, %35
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BF_BitstreamFrame, i64 0, i64 0)
  %40 = add i64 %pgocount3, 1
  store i64 %40, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_BF_BitstreamFrame, i64 0, i64 0)
  %41 = call i32 @side_queue_elements(i32* @forwardFrameLength, i32* @forwardSILength)
  store i32 %41, i32* @elements, align 4
  %42 = load i32, i32* @BitsRemaining, align 4
  %43 = sdiv i32 %42, 8
  %44 = load i32, i32* @forwardFrameLength, align 4
  %45 = sdiv i32 %44, 8
  %46 = add nsw i32 %43, %45
  %47 = load i32, i32* @forwardSILength, align 4
  %48 = sdiv i32 %47, 8
  %49 = sub nsw i32 %46, %48
  %50 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** %4, align 8
  %51 = getelementptr inbounds %struct.BF_FrameResults, %struct.BF_FrameResults* %50, i32 0, i32 2
  store i32 %49, i32* %51, align 4
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @store_side_info(%struct.BF_FrameData*) #0 {
  %2 = alloca %struct.BF_FrameData*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.side_info_link*, align 8
  %6 = alloca %struct.side_info_link*, align 8
  %7 = alloca i32, align 4
  store %struct.BF_FrameData* %0, %struct.BF_FrameData** %2, align 8
  %8 = load %struct.side_info_link*, %struct.side_info_link** @side_queue_free, align 8
  store %struct.side_info_link* %8, %struct.side_info_link** %6, align 8
  store i32 0, i32* %7, align 4
  %9 = load %struct.side_info_link*, %struct.side_info_link** %6, align 8
  %10 = icmp eq %struct.side_info_link* %9, null
  br i1 %10, label %11, label %114

; <label>:11:                                     ; preds = %1
  %12 = call noalias i8* @calloc(i64 1, i64 88) #5
  %13 = bitcast i8* %12 to %struct.side_info_link*
  store %struct.side_info_link* %13, %struct.side_info_link** %5, align 8
  %14 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %15 = icmp eq %struct.side_info_link* %14, null
  br i1 %15, label %16, label %20

; <label>:16:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 10)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 10)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.14, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:20:                                     ; preds = %11
  %21 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %22 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %21, i32 0, i32 0
  store %struct.side_info_link* null, %struct.side_info_link** %22, align 8
  %23 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %24 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %23, i32 0, i32 3
  %25 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %24, align 8
  %26 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %25, i32 0, i32 0
  %27 = load i32, i32* %26, align 8
  %28 = call %struct.BF_PartHolder* @BF_newPartHolder(i32 %27)
  %29 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %30 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %29, i32 0, i32 1
  %31 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %30, i32 0, i32 4
  store %struct.BF_PartHolder* %28, %struct.BF_PartHolder** %31, align 8
  %32 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %33 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %32, i32 0, i32 4
  %34 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %33, align 8
  %35 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %34, i32 0, i32 0
  %36 = load i32, i32* %35, align 8
  %37 = call %struct.BF_PartHolder* @BF_newPartHolder(i32 %36)
  %38 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %39 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %38, i32 0, i32 1
  %40 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %39, i32 0, i32 5
  store %struct.BF_PartHolder* %37, %struct.BF_PartHolder** %40, align 8
  store i32 0, i32* %3, align 4
  br label %41

; <label>:41:                                     ; preds = %63, %20
  %42 = load i32, i32* %3, align 4
  %43 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %44 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %43, i32 0, i32 2
  %45 = load i32, i32* %44, align 8
  %46 = icmp slt i32 %42, %45
  br i1 %46, label %47, label %67

; <label>:47:                                     ; preds = %41
  %48 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %49 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %48, i32 0, i32 5
  %50 = load i32, i32* %3, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [2 x %struct.BF_BitstreamPart*], [2 x %struct.BF_BitstreamPart*]* %49, i64 0, i64 %51
  %53 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %52, align 8
  %54 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %53, i32 0, i32 0
  %55 = load i32, i32* %54, align 8
  %56 = call %struct.BF_PartHolder* @BF_newPartHolder(i32 %55)
  %57 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %58 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %57, i32 0, i32 1
  %59 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %58, i32 0, i32 6
  %60 = load i32, i32* %3, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %59, i64 0, i64 %61
  store %struct.BF_PartHolder* %56, %struct.BF_PartHolder** %62, align 8
  br label %63

; <label>:63:                                     ; preds = %47
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 4)
  %64 = add i64 %pgocount1, 1
  store i64 %64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 4)
  %65 = load i32, i32* %3, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, i32* %3, align 4
  br label %41

; <label>:67:                                     ; preds = %41
  store i32 0, i32* %4, align 4
  br label %68

; <label>:68:                                     ; preds = %108, %67
  %69 = load i32, i32* %4, align 4
  %70 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %71 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %70, i32 0, i32 1
  %72 = load i32, i32* %71, align 4
  %73 = icmp slt i32 %69, %72
  br i1 %73, label %74, label %112

; <label>:74:                                     ; preds = %68
  store i32 0, i32* %3, align 4
  br label %75

; <label>:75:                                     ; preds = %103, %74
  %76 = load i32, i32* %3, align 4
  %77 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %78 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %77, i32 0, i32 2
  %79 = load i32, i32* %78, align 8
  %80 = icmp slt i32 %76, %79
  br i1 %80, label %81, label %107

; <label>:81:                                     ; preds = %75
  %82 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %83 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %82, i32 0, i32 6
  %84 = load i32, i32* %4, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [2 x [2 x %struct.BF_BitstreamPart*]], [2 x [2 x %struct.BF_BitstreamPart*]]* %83, i64 0, i64 %85
  %87 = load i32, i32* %3, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [2 x %struct.BF_BitstreamPart*], [2 x %struct.BF_BitstreamPart*]* %86, i64 0, i64 %88
  %90 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %89, align 8
  %91 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %90, i32 0, i32 0
  %92 = load i32, i32* %91, align 8
  %93 = call %struct.BF_PartHolder* @BF_newPartHolder(i32 %92)
  %94 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %95 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %94, i32 0, i32 1
  %96 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %95, i32 0, i32 7
  %97 = load i32, i32* %4, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* %96, i64 0, i64 %98
  %100 = load i32, i32* %3, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %99, i64 0, i64 %101
  store %struct.BF_PartHolder* %93, %struct.BF_PartHolder** %102, align 8
  br label %103

; <label>:103:                                    ; preds = %81
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 0)
  %104 = add i64 %pgocount2, 1
  store i64 %104, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 0)
  %105 = load i32, i32* %3, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, i32* %3, align 4
  br label %75

; <label>:107:                                    ; preds = %75
  br label %108

; <label>:108:                                    ; preds = %107
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 5)
  %109 = add i64 %pgocount3, 1
  store i64 %109, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 5)
  %110 = load i32, i32* %4, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, i32* %4, align 4
  br label %68

; <label>:112:                                    ; preds = %68
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 9)
  %113 = add i64 %pgocount4, 1
  store i64 %113, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 9)
  br label %121

; <label>:114:                                    ; preds = %1
  %115 = load %struct.side_info_link*, %struct.side_info_link** %6, align 8
  %116 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %115, i32 0, i32 0
  %117 = load %struct.side_info_link*, %struct.side_info_link** %116, align 8
  store %struct.side_info_link* %117, %struct.side_info_link** @side_queue_free, align 8
  %118 = load %struct.side_info_link*, %struct.side_info_link** %6, align 8
  %119 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %118, i32 0, i32 0
  store %struct.side_info_link* null, %struct.side_info_link** %119, align 8
  %120 = load %struct.side_info_link*, %struct.side_info_link** %6, align 8
  store %struct.side_info_link* %120, %struct.side_info_link** %5, align 8
  br label %121

; <label>:121:                                    ; preds = %114, %112
  %122 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %123 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %122, i32 0, i32 0
  %124 = load i32, i32* %123, align 8
  %125 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %126 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %125, i32 0, i32 1
  %127 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %126, i32 0, i32 0
  store i32 %124, i32* %127, align 8
  %128 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %129 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %128, i32 0, i32 1
  %130 = load i32, i32* %129, align 4
  %131 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %132 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %131, i32 0, i32 1
  %133 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %132, i32 0, i32 2
  store i32 %130, i32* %133, align 8
  %134 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %135 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %134, i32 0, i32 2
  %136 = load i32, i32* %135, align 8
  %137 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %138 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %137, i32 0, i32 1
  %139 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %138, i32 0, i32 3
  store i32 %136, i32* %139, align 4
  %140 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %141 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %140, i32 0, i32 1
  %142 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %141, i32 0, i32 4
  %143 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %142, align 8
  %144 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %145 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %144, i32 0, i32 3
  %146 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %145, align 8
  %147 = call %struct.BF_PartHolder* @BF_LoadHolderFromBitstreamPart(%struct.BF_PartHolder* %143, %struct.BF_BitstreamPart* %146)
  %148 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %149 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %148, i32 0, i32 1
  %150 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %149, i32 0, i32 4
  store %struct.BF_PartHolder* %147, %struct.BF_PartHolder** %150, align 8
  %151 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %152 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %151, i32 0, i32 1
  %153 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %152, i32 0, i32 5
  %154 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %153, align 8
  %155 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %156 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %155, i32 0, i32 4
  %157 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %156, align 8
  %158 = call %struct.BF_PartHolder* @BF_LoadHolderFromBitstreamPart(%struct.BF_PartHolder* %154, %struct.BF_BitstreamPart* %157)
  %159 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %160 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %159, i32 0, i32 1
  %161 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %160, i32 0, i32 5
  store %struct.BF_PartHolder* %158, %struct.BF_PartHolder** %161, align 8
  %162 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %163 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %162, i32 0, i32 3
  %164 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %163, align 8
  %165 = call i32 @BF_PartLength(%struct.BF_BitstreamPart* %164)
  %166 = load i32, i32* %7, align 4
  %167 = add nsw i32 %166, %165
  store i32 %167, i32* %7, align 4
  %168 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %169 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %168, i32 0, i32 4
  %170 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %169, align 8
  %171 = call i32 @BF_PartLength(%struct.BF_BitstreamPart* %170)
  %172 = load i32, i32* %7, align 4
  %173 = add nsw i32 %172, %171
  store i32 %173, i32* %7, align 4
  store i32 0, i32* %3, align 4
  br label %174

; <label>:174:                                    ; preds = %211, %121
  %175 = load i32, i32* %3, align 4
  %176 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %177 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %176, i32 0, i32 2
  %178 = load i32, i32* %177, align 8
  %179 = icmp slt i32 %175, %178
  br i1 %179, label %180, label %214

; <label>:180:                                    ; preds = %174
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 1)
  %181 = add i64 %pgocount5, 1
  store i64 %181, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 1)
  %182 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %183 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %182, i32 0, i32 1
  %184 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %183, i32 0, i32 6
  %185 = load i32, i32* %3, align 4
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %184, i64 0, i64 %186
  %188 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %187, align 8
  %189 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %190 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %189, i32 0, i32 5
  %191 = load i32, i32* %3, align 4
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds [2 x %struct.BF_BitstreamPart*], [2 x %struct.BF_BitstreamPart*]* %190, i64 0, i64 %192
  %194 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %193, align 8
  %195 = call %struct.BF_PartHolder* @BF_LoadHolderFromBitstreamPart(%struct.BF_PartHolder* %188, %struct.BF_BitstreamPart* %194)
  %196 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %197 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %196, i32 0, i32 1
  %198 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %197, i32 0, i32 6
  %199 = load i32, i32* %3, align 4
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %198, i64 0, i64 %200
  store %struct.BF_PartHolder* %195, %struct.BF_PartHolder** %201, align 8
  %202 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %203 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %202, i32 0, i32 5
  %204 = load i32, i32* %3, align 4
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds [2 x %struct.BF_BitstreamPart*], [2 x %struct.BF_BitstreamPart*]* %203, i64 0, i64 %205
  %207 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %206, align 8
  %208 = call i32 @BF_PartLength(%struct.BF_BitstreamPart* %207)
  %209 = load i32, i32* %7, align 4
  %210 = add nsw i32 %209, %208
  store i32 %210, i32* %7, align 4
  br label %211

; <label>:211:                                    ; preds = %180
  %212 = load i32, i32* %3, align 4
  %213 = add nsw i32 %212, 1
  store i32 %213, i32* %3, align 4
  br label %174

; <label>:214:                                    ; preds = %174
  store i32 0, i32* %4, align 4
  br label %215

; <label>:215:                                    ; preds = %276, %214
  %216 = load i32, i32* %4, align 4
  %217 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %218 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %217, i32 0, i32 1
  %219 = load i32, i32* %218, align 4
  %220 = icmp slt i32 %216, %219
  br i1 %220, label %221, label %279

; <label>:221:                                    ; preds = %215
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 2)
  %222 = add i64 %pgocount6, 1
  store i64 %222, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 2)
  store i32 0, i32* %3, align 4
  br label %223

; <label>:223:                                    ; preds = %272, %221
  %224 = load i32, i32* %3, align 4
  %225 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %226 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %225, i32 0, i32 2
  %227 = load i32, i32* %226, align 8
  %228 = icmp slt i32 %224, %227
  br i1 %228, label %229, label %275

; <label>:229:                                    ; preds = %223
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 6)
  %230 = add i64 %pgocount7, 1
  store i64 %230, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 6)
  %231 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %232 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %231, i32 0, i32 1
  %233 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %232, i32 0, i32 7
  %234 = load i32, i32* %4, align 4
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* %233, i64 0, i64 %235
  %237 = load i32, i32* %3, align 4
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %236, i64 0, i64 %238
  %240 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %239, align 8
  %241 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %242 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %241, i32 0, i32 6
  %243 = load i32, i32* %4, align 4
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds [2 x [2 x %struct.BF_BitstreamPart*]], [2 x [2 x %struct.BF_BitstreamPart*]]* %242, i64 0, i64 %244
  %246 = load i32, i32* %3, align 4
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds [2 x %struct.BF_BitstreamPart*], [2 x %struct.BF_BitstreamPart*]* %245, i64 0, i64 %247
  %249 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %248, align 8
  %250 = call %struct.BF_PartHolder* @BF_LoadHolderFromBitstreamPart(%struct.BF_PartHolder* %240, %struct.BF_BitstreamPart* %249)
  %251 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %252 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %251, i32 0, i32 1
  %253 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %252, i32 0, i32 7
  %254 = load i32, i32* %4, align 4
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* %253, i64 0, i64 %255
  %257 = load i32, i32* %3, align 4
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %256, i64 0, i64 %258
  store %struct.BF_PartHolder* %250, %struct.BF_PartHolder** %259, align 8
  %260 = load %struct.BF_FrameData*, %struct.BF_FrameData** %2, align 8
  %261 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %260, i32 0, i32 6
  %262 = load i32, i32* %4, align 4
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds [2 x [2 x %struct.BF_BitstreamPart*]], [2 x [2 x %struct.BF_BitstreamPart*]]* %261, i64 0, i64 %263
  %265 = load i32, i32* %3, align 4
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds [2 x %struct.BF_BitstreamPart*], [2 x %struct.BF_BitstreamPart*]* %264, i64 0, i64 %266
  %268 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %267, align 8
  %269 = call i32 @BF_PartLength(%struct.BF_BitstreamPart* %268)
  %270 = load i32, i32* %7, align 4
  %271 = add nsw i32 %270, %269
  store i32 %271, i32* %7, align 4
  br label %272

; <label>:272:                                    ; preds = %229
  %273 = load i32, i32* %3, align 4
  %274 = add nsw i32 %273, 1
  store i32 %274, i32* %3, align 4
  br label %223

; <label>:275:                                    ; preds = %223
  br label %276

; <label>:276:                                    ; preds = %275
  %277 = load i32, i32* %4, align 4
  %278 = add nsw i32 %277, 1
  store i32 %278, i32* %4, align 4
  br label %215

; <label>:279:                                    ; preds = %215
  %280 = load i32, i32* %7, align 4
  %281 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %282 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %281, i32 0, i32 1
  %283 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %282, i32 0, i32 1
  store i32 %280, i32* %283, align 4
  %284 = load %struct.side_info_link*, %struct.side_info_link** @side_queue_head, align 8
  store %struct.side_info_link* %284, %struct.side_info_link** %6, align 8
  %285 = load %struct.side_info_link*, %struct.side_info_link** %6, align 8
  %286 = icmp eq %struct.side_info_link* %285, null
  br i1 %286, label %287, label %290

; <label>:287:                                    ; preds = %279
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 8)
  %288 = add i64 %pgocount8, 1
  store i64 %288, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 8)
  %289 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  store %struct.side_info_link* %289, %struct.side_info_link** @side_queue_head, align 8
  br label %306

; <label>:290:                                    ; preds = %279
  br label %291

; <label>:291:                                    ; preds = %296, %290
  %292 = load %struct.side_info_link*, %struct.side_info_link** %6, align 8
  %293 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %292, i32 0, i32 0
  %294 = load %struct.side_info_link*, %struct.side_info_link** %293, align 8
  %295 = icmp ne %struct.side_info_link* %294, null
  br i1 %295, label %296, label %301

; <label>:296:                                    ; preds = %291
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 3)
  %297 = add i64 %pgocount9, 1
  store i64 %297, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 3)
  %298 = load %struct.side_info_link*, %struct.side_info_link** %6, align 8
  %299 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %298, i32 0, i32 0
  %300 = load %struct.side_info_link*, %struct.side_info_link** %299, align 8
  store %struct.side_info_link* %300, %struct.side_info_link** %6, align 8
  br label %291

; <label>:301:                                    ; preds = %291
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 7)
  %302 = add i64 %pgocount10, 1
  store i64 %302, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_store_side_info, i64 0, i64 7)
  %303 = load %struct.side_info_link*, %struct.side_info_link** %5, align 8
  %304 = load %struct.side_info_link*, %struct.side_info_link** %6, align 8
  %305 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %304, i32 0, i32 0
  store %struct.side_info_link* %303, %struct.side_info_link** %305, align 8
  br label %306

; <label>:306:                                    ; preds = %301, %287
  %307 = load i32, i32* %7, align 4
  ret i32 %307
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @main_data(%struct.BF_FrameData*, %struct.BF_FrameResults*) #0 {
  %3 = alloca %struct.BF_FrameData*, align 8
  %4 = alloca %struct.BF_FrameResults*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)*, align 8
  store %struct.BF_FrameData* %0, %struct.BF_FrameData** %3, align 8
  store %struct.BF_FrameResults* %1, %struct.BF_FrameResults** %4, align 8
  store i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)* @writePartMainData, i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)** %8, align 8
  store i32 0, i32* %7, align 4
  %9 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** %4, align 8
  %10 = getelementptr inbounds %struct.BF_FrameResults, %struct.BF_FrameResults* %9, i32 0, i32 1
  store i32 0, i32* %10, align 4
  store i32 0, i32* %5, align 4
  br label %11

; <label>:11:                                     ; preds = %75, %2
  %12 = load i32, i32* %5, align 4
  %13 = load %struct.BF_FrameData*, %struct.BF_FrameData** %3, align 8
  %14 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %13, i32 0, i32 1
  %15 = load i32, i32* %14, align 4
  %16 = icmp slt i32 %12, %15
  br i1 %16, label %17, label %79

; <label>:17:                                     ; preds = %11
  store i32 0, i32* %6, align 4
  br label %18

; <label>:18:                                     ; preds = %70, %17
  %19 = load i32, i32* %6, align 4
  %20 = load %struct.BF_FrameData*, %struct.BF_FrameData** %3, align 8
  %21 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %20, i32 0, i32 2
  %22 = load i32, i32* %21, align 8
  %23 = icmp slt i32 %19, %22
  br i1 %23, label %24, label %74

; <label>:24:                                     ; preds = %18
  %25 = load i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)*, i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)** %8, align 8
  %26 = load %struct.BF_FrameData*, %struct.BF_FrameData** %3, align 8
  %27 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %26, i32 0, i32 7
  %28 = load i32, i32* %5, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [2 x [2 x %struct.BF_BitstreamPart*]], [2 x [2 x %struct.BF_BitstreamPart*]]* %27, i64 0, i64 %29
  %31 = load i32, i32* %6, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [2 x %struct.BF_BitstreamPart*], [2 x %struct.BF_BitstreamPart*]* %30, i64 0, i64 %32
  %34 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %33, align 8
  %35 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** %4, align 8
  %36 = ptrtoint i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)* %25 to i64
  call void @__llvm_profile_instrument_target(i64 %36, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_main_data to i8*), i32 0)
  %37 = call i32 %25(%struct.BF_BitstreamPart* %34, %struct.BF_FrameResults* %35)
  %38 = load i32, i32* %7, align 4
  %39 = add nsw i32 %38, %37
  store i32 %39, i32* %7, align 4
  %40 = load i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)*, i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)** %8, align 8
  %41 = load %struct.BF_FrameData*, %struct.BF_FrameData** %3, align 8
  %42 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %41, i32 0, i32 8
  %43 = load i32, i32* %5, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [2 x [2 x %struct.BF_BitstreamPart*]], [2 x [2 x %struct.BF_BitstreamPart*]]* %42, i64 0, i64 %44
  %46 = load i32, i32* %6, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [2 x %struct.BF_BitstreamPart*], [2 x %struct.BF_BitstreamPart*]* %45, i64 0, i64 %47
  %49 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %48, align 8
  %50 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** %4, align 8
  %51 = ptrtoint i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)* %40 to i64
  call void @__llvm_profile_instrument_target(i64 %51, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_main_data to i8*), i32 1)
  %52 = call i32 %40(%struct.BF_BitstreamPart* %49, %struct.BF_FrameResults* %50)
  %53 = load i32, i32* %7, align 4
  %54 = add nsw i32 %53, %52
  store i32 %54, i32* %7, align 4
  %55 = load i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)*, i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)** %8, align 8
  %56 = load %struct.BF_FrameData*, %struct.BF_FrameData** %3, align 8
  %57 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %56, i32 0, i32 9
  %58 = load i32, i32* %5, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [2 x [2 x %struct.BF_BitstreamPart*]], [2 x [2 x %struct.BF_BitstreamPart*]]* %57, i64 0, i64 %59
  %61 = load i32, i32* %6, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [2 x %struct.BF_BitstreamPart*], [2 x %struct.BF_BitstreamPart*]* %60, i64 0, i64 %62
  %64 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %63, align 8
  %65 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** %4, align 8
  %66 = ptrtoint i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)* %55 to i64
  call void @__llvm_profile_instrument_target(i64 %66, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_main_data to i8*), i32 2)
  %67 = call i32 %55(%struct.BF_BitstreamPart* %64, %struct.BF_FrameResults* %65)
  %68 = load i32, i32* %7, align 4
  %69 = add nsw i32 %68, %67
  store i32 %69, i32* %7, align 4
  br label %70

; <label>:70:                                     ; preds = %24
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_main_data, i64 0, i64 0)
  %71 = add i64 %pgocount, 1
  store i64 %71, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_main_data, i64 0, i64 0)
  %72 = load i32, i32* %6, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* %6, align 4
  br label %18

; <label>:74:                                     ; preds = %18
  br label %75

; <label>:75:                                     ; preds = %74
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_main_data, i64 0, i64 1)
  %76 = add i64 %pgocount1, 1
  store i64 %76, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_main_data, i64 0, i64 1)
  %77 = load i32, i32* %5, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %5, align 4
  br label %11

; <label>:79:                                     ; preds = %11
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_main_data, i64 0, i64 2)
  %80 = add i64 %pgocount2, 1
  store i64 %80, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_main_data, i64 0, i64 2)
  %81 = load i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)*, i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)** %8, align 8
  %82 = load %struct.BF_FrameData*, %struct.BF_FrameData** %3, align 8
  %83 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %82, i32 0, i32 10
  %84 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %83, align 8
  %85 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** %4, align 8
  %86 = ptrtoint i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)* %81 to i64
  call void @__llvm_profile_instrument_target(i64 %86, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_main_data to i8*), i32 3)
  %87 = call i32 %81(%struct.BF_BitstreamPart* %84, %struct.BF_FrameResults* %85)
  %88 = load i32, i32* %7, align 4
  %89 = add nsw i32 %88, %87
  store i32 %89, i32* %7, align 4
  %90 = load i32, i32* %7, align 4
  ret i32 %90
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @side_queue_elements(i32*, i32*) #0 {
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.side_info_link*, align 8
  store i32* %0, i32** %3, align 8
  store i32* %1, i32** %4, align 8
  store i32 0, i32* %5, align 4
  %7 = load i32*, i32** %3, align 8
  store i32 0, i32* %7, align 4
  %8 = load i32*, i32** %4, align 8
  store i32 0, i32* %8, align 4
  %9 = load %struct.side_info_link*, %struct.side_info_link** @side_queue_head, align 8
  store %struct.side_info_link* %9, %struct.side_info_link** %6, align 8
  br label %10

; <label>:10:                                     ; preds = %30, %2
  %11 = load %struct.side_info_link*, %struct.side_info_link** %6, align 8
  %12 = icmp ne %struct.side_info_link* %11, null
  br i1 %12, label %13, label %35

; <label>:13:                                     ; preds = %10
  %14 = load i32, i32* %5, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %5, align 4
  %16 = load %struct.side_info_link*, %struct.side_info_link** %6, align 8
  %17 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %16, i32 0, i32 1
  %18 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %17, i32 0, i32 0
  %19 = load i32, i32* %18, align 8
  %20 = load i32*, i32** %3, align 8
  %21 = load i32, i32* %20, align 4
  %22 = add nsw i32 %21, %19
  store i32 %22, i32* %20, align 4
  %23 = load %struct.side_info_link*, %struct.side_info_link** %6, align 8
  %24 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %23, i32 0, i32 1
  %25 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %24, i32 0, i32 1
  %26 = load i32, i32* %25, align 4
  %27 = load i32*, i32** %4, align 8
  %28 = load i32, i32* %27, align 4
  %29 = add nsw i32 %28, %26
  store i32 %29, i32* %27, align 4
  br label %30

; <label>:30:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_side_queue_elements, i64 0, i64 0)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_side_queue_elements, i64 0, i64 0)
  %32 = load %struct.side_info_link*, %struct.side_info_link** %6, align 8
  %33 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %32, i32 0, i32 0
  %34 = load %struct.side_info_link*, %struct.side_info_link** %33, align 8
  store %struct.side_info_link* %34, %struct.side_info_link** %6, align 8
  br label %10

; <label>:35:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_side_queue_elements, i64 0, i64 1)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_side_queue_elements, i64 0, i64 1)
  %37 = load i32, i32* %5, align 4
  ret i32 %37
}

; Function Attrs: noinline nounwind uwtable
define void @BF_FlushBitstream(%struct.BF_FrameData*, %struct.BF_FrameResults*) #0 {
  %3 = alloca %struct.BF_FrameData*, align 8
  %4 = alloca %struct.BF_FrameResults*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct.BF_FrameData* %0, %struct.BF_FrameData** %3, align 8
  store %struct.BF_FrameResults* %1, %struct.BF_FrameResults** %4, align 8
  %7 = load i32, i32* @elements, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %27

; <label>:9:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BF_FlushBitstream, i64 0, i64 2)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BF_FlushBitstream, i64 0, i64 2)
  %11 = load i32, i32* @forwardFrameLength, align 4
  %12 = load i32, i32* @forwardSILength, align 4
  %13 = sub nsw i32 %11, %12
  store i32 %13, i32* %5, align 4
  %14 = load i32, i32* %5, align 4
  %15 = sdiv i32 %14, 32
  store i32 %15, i32* %6, align 4
  br label %16

; <label>:16:                                     ; preds = %20, %9
  %17 = load i32, i32* %6, align 4
  %18 = add nsw i32 %17, -1
  store i32 %18, i32* %6, align 4
  %19 = icmp ne i32 %17, 0
  br i1 %19, label %20, label %23

; <label>:20:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BF_FlushBitstream, i64 0, i64 0)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BF_FlushBitstream, i64 0, i64 0)
  %22 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** %4, align 8
  call void @WriteMainDataBits(i32 0, i32 32, %struct.BF_FrameResults* %22)
  br label %16

; <label>:23:                                     ; preds = %16
  %24 = load i32, i32* %5, align 4
  %25 = srem i32 %24, 32
  %26 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** %4, align 8
  call void @WriteMainDataBits(i32 0, i32 %25, %struct.BF_FrameResults* %26)
  br label %27

; <label>:27:                                     ; preds = %23, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BF_FlushBitstream, i64 0, i64 1)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BF_FlushBitstream, i64 0, i64 1)
  %29 = load i32, i32* @forwardFrameLength, align 4
  %30 = load i32, i32* @forwardSILength, align 4
  %31 = sub nsw i32 %29, %30
  %32 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** %4, align 8
  %33 = getelementptr inbounds %struct.BF_FrameResults, %struct.BF_FrameResults* %32, i32 0, i32 1
  store i32 %31, i32* %33, align 4
  %34 = load i32, i32* @forwardSILength, align 4
  %35 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** %4, align 8
  %36 = getelementptr inbounds %struct.BF_FrameResults, %struct.BF_FrameResults* %35, i32 0, i32 0
  store i32 %34, i32* %36, align 4
  %37 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** %4, align 8
  %38 = getelementptr inbounds %struct.BF_FrameResults, %struct.BF_FrameResults* %37, i32 0, i32 2
  store i32 0, i32* %38, align 4
  call void @free_side_queues()
  store i32 0, i32* @BitCount, align 4
  store i32 0, i32* @ThisFrameSize, align 4
  store i32 0, i32* @BitsRemaining, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @WriteMainDataBits(i32, i32, %struct.BF_FrameResults*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.BF_FrameResults*, align 8
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store %struct.BF_FrameResults* %2, %struct.BF_FrameResults** %6, align 8
  %8 = load i32, i32* %5, align 4
  %9 = icmp ule i32 %8, 32
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %3
  br label %14

; <label>:11:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_WriteMainDataBits, i64 0, i64 4)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_WriteMainDataBits, i64 0, i64 4)
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0), i32 217, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__PRETTY_FUNCTION__.WriteMainDataBits, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %14

; <label>:14:                                     ; preds = %13, %10
  %15 = load i32, i32* %5, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_WriteMainDataBits, i64 0, i64 0)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_WriteMainDataBits, i64 0, i64 0)
  br label %86

; <label>:19:                                     ; preds = %14
  %20 = load i32, i32* @BitCount, align 4
  %21 = load i32, i32* @ThisFrameSize, align 4
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %23, label %29

; <label>:23:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_WriteMainDataBits, i64 0, i64 1)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_WriteMainDataBits, i64 0, i64 1)
  %25 = call i32 @write_side_info()
  store i32 %25, i32* @BitCount, align 4
  %26 = load i32, i32* @ThisFrameSize, align 4
  %27 = load i32, i32* @BitCount, align 4
  %28 = sub nsw i32 %26, %27
  store i32 %28, i32* @BitsRemaining, align 4
  br label %29

; <label>:29:                                     ; preds = %23, %19
  %30 = load i32, i32* %5, align 4
  %31 = load i32, i32* @BitsRemaining, align 4
  %32 = icmp ugt i32 %30, %31
  br i1 %32, label %33, label %51

; <label>:33:                                     ; preds = %29
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_WriteMainDataBits, i64 0, i64 2)
  %34 = add i64 %pgocount3, 1
  store i64 %34, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_WriteMainDataBits, i64 0, i64 2)
  %35 = load i32, i32* %4, align 4
  %36 = load i32, i32* %5, align 4
  %37 = load i32, i32* @BitsRemaining, align 4
  %38 = sub i32 %36, %37
  %39 = lshr i32 %35, %38
  store i32 %39, i32* %7, align 4
  %40 = load i32, i32* @BitsRemaining, align 4
  %41 = load i32, i32* %5, align 4
  %42 = sub i32 %41, %40
  store i32 %42, i32* %5, align 4
  %43 = load i32, i32* %7, align 4
  %44 = load i32, i32* @BitsRemaining, align 4
  call void @putMyBits(i32 %43, i32 %44)
  %45 = call i32 @write_side_info()
  store i32 %45, i32* @BitCount, align 4
  %46 = load i32, i32* @ThisFrameSize, align 4
  %47 = load i32, i32* @BitCount, align 4
  %48 = sub nsw i32 %46, %47
  store i32 %48, i32* @BitsRemaining, align 4
  %49 = load i32, i32* %4, align 4
  %50 = load i32, i32* %5, align 4
  call void @putMyBits(i32 %49, i32 %50)
  br label %55

; <label>:51:                                     ; preds = %29
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_WriteMainDataBits, i64 0, i64 3)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_WriteMainDataBits, i64 0, i64 3)
  %53 = load i32, i32* %4, align 4
  %54 = load i32, i32* %5, align 4
  call void @putMyBits(i32 %53, i32 %54)
  br label %55

; <label>:55:                                     ; preds = %51, %33
  %56 = load i32, i32* %5, align 4
  %57 = load i32, i32* @BitCount, align 4
  %58 = add i32 %57, %56
  store i32 %58, i32* @BitCount, align 4
  %59 = load i32, i32* %5, align 4
  %60 = load i32, i32* @BitsRemaining, align 4
  %61 = sub i32 %60, %59
  store i32 %61, i32* @BitsRemaining, align 4
  %62 = load i32, i32* @BitCount, align 4
  %63 = load i32, i32* @ThisFrameSize, align 4
  %64 = icmp sle i32 %62, %63
  br i1 %64, label %65, label %66

; <label>:65:                                     ; preds = %55
  br label %69

; <label>:66:                                     ; preds = %55
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_WriteMainDataBits, i64 0, i64 5)
  %67 = add i64 %pgocount5, 1
  store i64 %67, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_WriteMainDataBits, i64 0, i64 5)
  call void @__assert_fail(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0), i32 238, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__PRETTY_FUNCTION__.WriteMainDataBits, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %69

; <label>:69:                                     ; preds = %68, %65
  %70 = load i32, i32* @BitsRemaining, align 4
  %71 = icmp sge i32 %70, 0
  br i1 %71, label %72, label %73

; <label>:72:                                     ; preds = %69
  br label %76

; <label>:73:                                     ; preds = %69
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_WriteMainDataBits, i64 0, i64 6)
  %74 = add i64 %pgocount6, 1
  store i64 %74, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_WriteMainDataBits, i64 0, i64 6)
  call void @__assert_fail(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0), i32 239, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__PRETTY_FUNCTION__.WriteMainDataBits, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %76

; <label>:76:                                     ; preds = %75, %72
  %77 = load i32, i32* @BitCount, align 4
  %78 = load i32, i32* @BitsRemaining, align 4
  %79 = add nsw i32 %77, %78
  %80 = load i32, i32* @ThisFrameSize, align 4
  %81 = icmp eq i32 %79, %80
  br i1 %81, label %82, label %83

; <label>:82:                                     ; preds = %76
  br label %86

; <label>:83:                                     ; preds = %76
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_WriteMainDataBits, i64 0, i64 7)
  %84 = add i64 %pgocount7, 1
  store i64 %84, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_WriteMainDataBits, i64 0, i64 7)
  call void @__assert_fail(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0), i32 240, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__PRETTY_FUNCTION__.WriteMainDataBits, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %86

; <label>:86:                                     ; preds = %85, %82, %17
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @free_side_queues() #0 {
  %1 = alloca %struct.side_info_link*, align 8
  %2 = alloca %struct.side_info_link*, align 8
  %3 = load %struct.side_info_link*, %struct.side_info_link** @side_queue_head, align 8
  store %struct.side_info_link* %3, %struct.side_info_link** %1, align 8
  br label %4

; <label>:4:                                      ; preds = %12, %0
  %5 = load %struct.side_info_link*, %struct.side_info_link** %1, align 8
  %6 = icmp ne %struct.side_info_link* %5, null
  br i1 %6, label %7, label %15

; <label>:7:                                      ; preds = %4
  %8 = load %struct.side_info_link*, %struct.side_info_link** %1, align 8
  %9 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %8, i32 0, i32 0
  %10 = load %struct.side_info_link*, %struct.side_info_link** %9, align 8
  store %struct.side_info_link* %10, %struct.side_info_link** %2, align 8
  %11 = load %struct.side_info_link*, %struct.side_info_link** %1, align 8
  call void @free_side_info_link(%struct.side_info_link* %11)
  br label %12

; <label>:12:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_free_side_queues, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_free_side_queues, i64 0, i64 0)
  %14 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  store %struct.side_info_link* %14, %struct.side_info_link** %1, align 8
  br label %4

; <label>:15:                                     ; preds = %4
  store %struct.side_info_link* null, %struct.side_info_link** @side_queue_head, align 8
  %16 = load %struct.side_info_link*, %struct.side_info_link** @side_queue_free, align 8
  store %struct.side_info_link* %16, %struct.side_info_link** %1, align 8
  br label %17

; <label>:17:                                     ; preds = %25, %15
  %18 = load %struct.side_info_link*, %struct.side_info_link** %1, align 8
  %19 = icmp ne %struct.side_info_link* %18, null
  br i1 %19, label %20, label %28

; <label>:20:                                     ; preds = %17
  %21 = load %struct.side_info_link*, %struct.side_info_link** %1, align 8
  %22 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %21, i32 0, i32 0
  %23 = load %struct.side_info_link*, %struct.side_info_link** %22, align 8
  store %struct.side_info_link* %23, %struct.side_info_link** %2, align 8
  %24 = load %struct.side_info_link*, %struct.side_info_link** %1, align 8
  call void @free_side_info_link(%struct.side_info_link* %24)
  br label %25

; <label>:25:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_free_side_queues, i64 0, i64 1)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_free_side_queues, i64 0, i64 1)
  %27 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  store %struct.side_info_link* %27, %struct.side_info_link** %1, align 8
  br label %17

; <label>:28:                                     ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_free_side_queues, i64 0, i64 2)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_free_side_queues, i64 0, i64 2)
  store %struct.side_info_link* null, %struct.side_info_link** @side_queue_free, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @BF_PartLength(%struct.BF_BitstreamPart*) #0 {
  %2 = alloca %struct.BF_BitstreamPart*, align 8
  %3 = alloca %struct.BF_BitstreamElement*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct.BF_BitstreamPart* %0, %struct.BF_BitstreamPart** %2, align 8
  %6 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %2, align 8
  %7 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %6, i32 0, i32 1
  %8 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %7, align 8
  store %struct.BF_BitstreamElement* %8, %struct.BF_BitstreamElement** %3, align 8
  store i32 0, i32* %5, align 4
  store i32 0, i32* %4, align 4
  br label %9

; <label>:9:                                      ; preds = %22, %1
  %10 = load i32, i32* %4, align 4
  %11 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %2, align 8
  %12 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %11, i32 0, i32 0
  %13 = load i32, i32* %12, align 8
  %14 = icmp ult i32 %10, %13
  br i1 %14, label %15, label %28

; <label>:15:                                     ; preds = %9
  %16 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %3, align 8
  %17 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %16, i32 0, i32 1
  %18 = load i16, i16* %17, align 4
  %19 = zext i16 %18 to i32
  %20 = load i32, i32* %5, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, i32* %5, align 4
  br label %22

; <label>:22:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_PartLength, i64 0, i64 0)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_PartLength, i64 0, i64 0)
  %24 = load i32, i32* %4, align 4
  %25 = add i32 %24, 1
  store i32 %25, i32* %4, align 4
  %26 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %3, align 8
  %27 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %26, i32 1
  store %struct.BF_BitstreamElement* %27, %struct.BF_BitstreamElement** %3, align 8
  br label %9

; <label>:28:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_PartLength, i64 0, i64 1)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_PartLength, i64 0, i64 1)
  %30 = load i32, i32* %5, align 4
  ret i32 %30
}

; Function Attrs: noinline nounwind uwtable
define %struct.BF_PartHolder* @BF_newPartHolder(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.BF_PartHolder*, align 8
  store i32 %0, i32* %2, align 4
  %4 = call noalias i8* @calloc(i64 1, i64 16) #5
  %5 = bitcast i8* %4 to %struct.BF_PartHolder*
  store %struct.BF_PartHolder* %5, %struct.BF_PartHolder** %3, align 8
  %6 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %7 = icmp ne %struct.BF_PartHolder* %6, null
  br i1 %7, label %8, label %9

; <label>:8:                                      ; preds = %1
  br label %12

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BF_newPartHolder, i64 0, i64 2)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BF_newPartHolder, i64 0, i64 2)
  call void @__assert_fail(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0), i32 443, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__PRETTY_FUNCTION__.BF_newPartHolder, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %12

; <label>:12:                                     ; preds = %11, %8
  %13 = load i32, i32* %2, align 4
  %14 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %15 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %14, i32 0, i32 0
  store i32 %13, i32* %15, align 8
  %16 = call noalias i8* @calloc(i64 1, i64 16) #5
  %17 = bitcast i8* %16 to %struct.BF_BitstreamPart*
  %18 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %19 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %18, i32 0, i32 1
  store %struct.BF_BitstreamPart* %17, %struct.BF_BitstreamPart** %19, align 8
  %20 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %21 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %20, i32 0, i32 1
  %22 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %21, align 8
  %23 = icmp ne %struct.BF_BitstreamPart* %22, null
  br i1 %23, label %24, label %25

; <label>:24:                                     ; preds = %12
  br label %28

; <label>:25:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BF_newPartHolder, i64 0, i64 3)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BF_newPartHolder, i64 0, i64 3)
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0), i32 446, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__PRETTY_FUNCTION__.BF_newPartHolder, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %28

; <label>:28:                                     ; preds = %27, %24
  %29 = load i32, i32* %2, align 4
  %30 = sext i32 %29 to i64
  %31 = call noalias i8* @calloc(i64 %30, i64 8) #5
  %32 = bitcast i8* %31 to %struct.BF_BitstreamElement*
  %33 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %34 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %33, i32 0, i32 1
  %35 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %34, align 8
  %36 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %35, i32 0, i32 1
  store %struct.BF_BitstreamElement* %32, %struct.BF_BitstreamElement** %36, align 8
  %37 = load i32, i32* %2, align 4
  %38 = icmp sgt i32 %37, 0
  br i1 %38, label %39, label %52

; <label>:39:                                     ; preds = %28
  %40 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %41 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %40, i32 0, i32 1
  %42 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %41, align 8
  %43 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %42, i32 0, i32 1
  %44 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %43, align 8
  %45 = icmp ne %struct.BF_BitstreamElement* %44, null
  br i1 %45, label %46, label %47

; <label>:46:                                     ; preds = %39
  br label %50

; <label>:47:                                     ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BF_newPartHolder, i64 0, i64 4)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BF_newPartHolder, i64 0, i64 4)
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0), i32 448, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__PRETTY_FUNCTION__.BF_newPartHolder, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %50

; <label>:50:                                     ; preds = %49, %46
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BF_newPartHolder, i64 0, i64 1)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BF_newPartHolder, i64 0, i64 1)
  br label %52

; <label>:52:                                     ; preds = %50, %28
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BF_newPartHolder, i64 0, i64 0)
  %53 = add i64 %pgocount4, 1
  store i64 %53, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_BF_newPartHolder, i64 0, i64 0)
  %54 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %55 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %54, i32 0, i32 1
  %56 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %55, align 8
  %57 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %56, i32 0, i32 0
  store i32 0, i32* %57, align 8
  %58 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  ret %struct.BF_PartHolder* %58
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: noinline nounwind uwtable
define %struct.BF_PartHolder* @BF_NewHolderFromBitstreamPart(%struct.BF_BitstreamPart*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BF_NewHolderFromBitstreamPart, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BF_NewHolderFromBitstreamPart, i64 0, i64 0)
  %3 = alloca %struct.BF_BitstreamPart*, align 8
  %4 = alloca %struct.BF_PartHolder*, align 8
  store %struct.BF_BitstreamPart* %0, %struct.BF_BitstreamPart** %3, align 8
  %5 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %3, align 8
  %6 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %5, i32 0, i32 0
  %7 = load i32, i32* %6, align 8
  %8 = call %struct.BF_PartHolder* @BF_newPartHolder(i32 %7)
  store %struct.BF_PartHolder* %8, %struct.BF_PartHolder** %4, align 8
  %9 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %4, align 8
  %10 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %3, align 8
  %11 = call %struct.BF_PartHolder* @BF_LoadHolderFromBitstreamPart(%struct.BF_PartHolder* %9, %struct.BF_BitstreamPart* %10)
  ret %struct.BF_PartHolder* %11
}

; Function Attrs: noinline nounwind uwtable
define %struct.BF_PartHolder* @BF_LoadHolderFromBitstreamPart(%struct.BF_PartHolder*, %struct.BF_BitstreamPart*) #0 {
  %3 = alloca %struct.BF_PartHolder*, align 8
  %4 = alloca %struct.BF_BitstreamPart*, align 8
  %5 = alloca %struct.BF_BitstreamElement*, align 8
  %6 = alloca i32, align 4
  store %struct.BF_PartHolder* %0, %struct.BF_PartHolder** %3, align 8
  store %struct.BF_BitstreamPart* %1, %struct.BF_BitstreamPart** %4, align 8
  %7 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %8 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %7, i32 0, i32 1
  %9 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %8, align 8
  %10 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %9, i32 0, i32 0
  store i32 0, i32* %10, align 8
  store i32 0, i32* %6, align 4
  br label %11

; <label>:11:                                     ; preds = %27, %2
  %12 = load i32, i32* %6, align 4
  %13 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %4, align 8
  %14 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %13, i32 0, i32 0
  %15 = load i32, i32* %14, align 8
  %16 = icmp ult i32 %12, %15
  br i1 %16, label %17, label %31

; <label>:17:                                     ; preds = %11
  %18 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %4, align 8
  %19 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %18, i32 0, i32 1
  %20 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %19, align 8
  %21 = load i32, i32* %6, align 4
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %20, i64 %22
  store %struct.BF_BitstreamElement* %23, %struct.BF_BitstreamElement** %5, align 8
  %24 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %25 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %5, align 8
  %26 = call %struct.BF_PartHolder* @BF_addElement(%struct.BF_PartHolder* %24, %struct.BF_BitstreamElement* %25)
  store %struct.BF_PartHolder* %26, %struct.BF_PartHolder** %3, align 8
  br label %27

; <label>:27:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_LoadHolderFromBitstreamPart, i64 0, i64 0)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_LoadHolderFromBitstreamPart, i64 0, i64 0)
  %29 = load i32, i32* %6, align 4
  %30 = add i32 %29, 1
  store i32 %30, i32* %6, align 4
  br label %11

; <label>:31:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_LoadHolderFromBitstreamPart, i64 0, i64 1)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_LoadHolderFromBitstreamPart, i64 0, i64 1)
  %33 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  ret %struct.BF_PartHolder* %33
}

; Function Attrs: noinline nounwind uwtable
define %struct.BF_PartHolder* @BF_addElement(%struct.BF_PartHolder*, %struct.BF_BitstreamElement*) #0 {
  %3 = alloca %struct.BF_PartHolder*, align 8
  %4 = alloca %struct.BF_BitstreamElement*, align 8
  %5 = alloca %struct.BF_PartHolder*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct.BF_PartHolder* %0, %struct.BF_PartHolder** %3, align 8
  store %struct.BF_BitstreamElement* %1, %struct.BF_BitstreamElement** %4, align 8
  %8 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  store %struct.BF_PartHolder* %8, %struct.BF_PartHolder** %5, align 8
  %9 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %10 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %9, i32 0, i32 1
  %11 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %10, align 8
  %12 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %11, i32 0, i32 0
  %13 = load i32, i32* %12, align 8
  %14 = add i32 %13, 1
  store i32 %14, i32* %6, align 4
  store i32 8, i32* %7, align 4
  %15 = load i32, i32* %6, align 4
  %16 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %17 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %16, i32 0, i32 0
  %18 = load i32, i32* %17, align 8
  %19 = icmp sgt i32 %15, %18
  br i1 %19, label %20, label %27

; <label>:20:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_addElement, i64 0, i64 1)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_addElement, i64 0, i64 1)
  %22 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %23 = load i32, i32* %6, align 4
  %24 = load i32, i32* %7, align 4
  %25 = add nsw i32 %23, %24
  %26 = call %struct.BF_PartHolder* @BF_resizePartHolder(%struct.BF_PartHolder* %22, i32 %25)
  store %struct.BF_PartHolder* %26, %struct.BF_PartHolder** %5, align 8
  br label %27

; <label>:27:                                     ; preds = %20, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_addElement, i64 0, i64 0)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_addElement, i64 0, i64 0)
  %29 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %5, align 8
  %30 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %29, i32 0, i32 1
  %31 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %30, align 8
  %32 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %31, i32 0, i32 1
  %33 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %32, align 8
  %34 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %5, align 8
  %35 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %34, i32 0, i32 1
  %36 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %35, align 8
  %37 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %36, i32 0, i32 0
  %38 = load i32, i32* %37, align 8
  %39 = add i32 %38, 1
  store i32 %39, i32* %37, align 8
  %40 = zext i32 %38 to i64
  %41 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %33, i64 %40
  %42 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %4, align 8
  %43 = bitcast %struct.BF_BitstreamElement* %41 to i8*
  %44 = bitcast %struct.BF_BitstreamElement* %42 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %43, i8* %44, i64 8, i32 4, i1 false)
  %45 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %5, align 8
  ret %struct.BF_PartHolder* %45
}

; Function Attrs: noinline nounwind uwtable
define %struct.BF_PartHolder* @BF_resizePartHolder(%struct.BF_PartHolder*, i32) #0 {
  %3 = alloca %struct.BF_PartHolder*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.BF_PartHolder*, align 8
  store %struct.BF_PartHolder* %0, %struct.BF_PartHolder** %3, align 8
  store i32 %1, i32* %4, align 4
  %8 = load i32, i32* %4, align 4
  %9 = call %struct.BF_PartHolder* @BF_newPartHolder(i32 %8)
  store %struct.BF_PartHolder* %9, %struct.BF_PartHolder** %7, align 8
  %10 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %11 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %10, i32 0, i32 0
  %12 = load i32, i32* %11, align 8
  %13 = load i32, i32* %4, align 4
  %14 = icmp sgt i32 %12, %13
  br i1 %14, label %15, label %18

; <label>:15:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BF_resizePartHolder, i64 0, i64 1)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BF_resizePartHolder, i64 0, i64 1)
  %17 = load i32, i32* %4, align 4
  br label %23

; <label>:18:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BF_resizePartHolder, i64 0, i64 2)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BF_resizePartHolder, i64 0, i64 2)
  %20 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %21 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %20, i32 0, i32 0
  %22 = load i32, i32* %21, align 8
  br label %23

; <label>:23:                                     ; preds = %18, %15
  %24 = phi i32 [ %17, %15 ], [ %22, %18 ]
  store i32 %24, i32* %5, align 4
  %25 = load i32, i32* %5, align 4
  %26 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %7, align 8
  %27 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %26, i32 0, i32 1
  %28 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %27, align 8
  %29 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %28, i32 0, i32 0
  store i32 %25, i32* %29, align 8
  store i32 0, i32* %6, align 4
  br label %30

; <label>:30:                                     ; preds = %53, %23
  %31 = load i32, i32* %6, align 4
  %32 = load i32, i32* %5, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %57

; <label>:34:                                     ; preds = %30
  %35 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %7, align 8
  %36 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %35, i32 0, i32 1
  %37 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %36, align 8
  %38 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %37, i32 0, i32 1
  %39 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %38, align 8
  %40 = load i32, i32* %6, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %39, i64 %41
  %43 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %44 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %43, i32 0, i32 1
  %45 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %44, align 8
  %46 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %45, i32 0, i32 1
  %47 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %46, align 8
  %48 = load i32, i32* %6, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %47, i64 %49
  %51 = bitcast %struct.BF_BitstreamElement* %42 to i8*
  %52 = bitcast %struct.BF_BitstreamElement* %50 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %51, i8* %52, i64 8, i32 4, i1 false)
  br label %53

; <label>:53:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BF_resizePartHolder, i64 0, i64 0)
  %54 = add i64 %pgocount2, 1
  store i64 %54, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_BF_resizePartHolder, i64 0, i64 0)
  %55 = load i32, i32* %6, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %6, align 4
  br label %30

; <label>:57:                                     ; preds = %30
  %58 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %59 = call %struct.BF_PartHolder* @BF_freePartHolder(%struct.BF_PartHolder* %58)
  %60 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %7, align 8
  ret %struct.BF_PartHolder* %60
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: noinline nounwind uwtable
define %struct.BF_PartHolder* @BF_freePartHolder(%struct.BF_PartHolder*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BF_freePartHolder, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BF_freePartHolder, i64 0, i64 0)
  %3 = alloca %struct.BF_PartHolder*, align 8
  store %struct.BF_PartHolder* %0, %struct.BF_PartHolder** %3, align 8
  %4 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %5 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %4, i32 0, i32 1
  %6 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %5, align 8
  %7 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %6, i32 0, i32 1
  %8 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %7, align 8
  %9 = bitcast %struct.BF_BitstreamElement* %8 to i8*
  call void @free(i8* %9) #5
  %10 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %11 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %10, i32 0, i32 1
  %12 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %11, align 8
  %13 = bitcast %struct.BF_BitstreamPart* %12 to i8*
  call void @free(i8* %13) #5
  %14 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %3, align 8
  %15 = bitcast %struct.BF_PartHolder* %14 to i8*
  call void @free(i8* %15) #5
  ret %struct.BF_PartHolder* null
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder*, i32, i32) #0 {
  %4 = alloca %struct.BF_PartHolder*, align 8
  %5 = alloca %struct.BF_PartHolder*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.BF_BitstreamElement, align 4
  store %struct.BF_PartHolder* %0, %struct.BF_PartHolder** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  %9 = load i32, i32* %6, align 4
  %10 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %8, i32 0, i32 0
  store i32 %9, i32* %10, align 4
  %11 = load i32, i32* %7, align 4
  %12 = trunc i32 %11 to i16
  %13 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %8, i32 0, i32 1
  store i16 %12, i16* %13, align 4
  %14 = load i32, i32* %7, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %20

; <label>:16:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_addEntry, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_addEntry, i64 0, i64 0)
  %18 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %5, align 8
  %19 = call %struct.BF_PartHolder* @BF_addElement(%struct.BF_PartHolder* %18, %struct.BF_BitstreamElement* %8)
  store %struct.BF_PartHolder* %19, %struct.BF_PartHolder** %4, align 8
  br label %23

; <label>:20:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_addEntry, i64 0, i64 1)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_BF_addEntry, i64 0, i64 1)
  %22 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %5, align 8
  store %struct.BF_PartHolder* %22, %struct.BF_PartHolder** %4, align 8
  br label %23

; <label>:23:                                     ; preds = %20, %16
  %24 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %4, align 8
  ret %struct.BF_PartHolder* %24
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @writePartMainData(%struct.BF_BitstreamPart*, %struct.BF_FrameResults*) #0 {
  %3 = alloca %struct.BF_BitstreamPart*, align 8
  %4 = alloca %struct.BF_FrameResults*, align 8
  %5 = alloca %struct.BF_BitstreamElement*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct.BF_BitstreamPart* %0, %struct.BF_BitstreamPart** %3, align 8
  store %struct.BF_FrameResults* %1, %struct.BF_FrameResults** %4, align 8
  store i32 0, i32* %7, align 4
  %8 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** %4, align 8
  %9 = icmp ne %struct.BF_FrameResults* %8, null
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %2
  br label %14

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_writePartMainData, i64 0, i64 2)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_writePartMainData, i64 0, i64 2)
  call void @__assert_fail(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0), i32 157, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.writePartMainData, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %14

; <label>:14:                                     ; preds = %13, %10
  %15 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %3, align 8
  %16 = icmp ne %struct.BF_BitstreamPart* %15, null
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  br label %21

; <label>:18:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_writePartMainData, i64 0, i64 3)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_writePartMainData, i64 0, i64 3)
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0), i32 158, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.writePartMainData, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %21

; <label>:21:                                     ; preds = %20, %17
  %22 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %3, align 8
  %23 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %22, i32 0, i32 1
  %24 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %23, align 8
  store %struct.BF_BitstreamElement* %24, %struct.BF_BitstreamElement** %5, align 8
  store i32 0, i32* %6, align 4
  br label %25

; <label>:25:                                     ; preds = %46, %21
  %26 = load i32, i32* %6, align 4
  %27 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %3, align 8
  %28 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %27, i32 0, i32 0
  %29 = load i32, i32* %28, align 8
  %30 = icmp ult i32 %26, %29
  br i1 %30, label %31, label %52

; <label>:31:                                     ; preds = %25
  %32 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %5, align 8
  %33 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %32, i32 0, i32 0
  %34 = load i32, i32* %33, align 4
  %35 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %5, align 8
  %36 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %35, i32 0, i32 1
  %37 = load i16, i16* %36, align 4
  %38 = zext i16 %37 to i32
  %39 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** %4, align 8
  call void @WriteMainDataBits(i32 %34, i32 %38, %struct.BF_FrameResults* %39)
  %40 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %5, align 8
  %41 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %40, i32 0, i32 1
  %42 = load i16, i16* %41, align 4
  %43 = zext i16 %42 to i32
  %44 = load i32, i32* %7, align 4
  %45 = add nsw i32 %44, %43
  store i32 %45, i32* %7, align 4
  br label %46

; <label>:46:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_writePartMainData, i64 0, i64 0)
  %47 = add i64 %pgocount2, 1
  store i64 %47, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_writePartMainData, i64 0, i64 0)
  %48 = load i32, i32* %6, align 4
  %49 = add i32 %48, 1
  store i32 %49, i32* %6, align 4
  %50 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %5, align 8
  %51 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %50, i32 1
  store %struct.BF_BitstreamElement* %51, %struct.BF_BitstreamElement** %5, align 8
  br label %25

; <label>:52:                                     ; preds = %25
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_writePartMainData, i64 0, i64 1)
  %53 = add i64 %pgocount3, 1
  store i64 %53, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_writePartMainData, i64 0, i64 1)
  %54 = load i32, i32* %7, align 4
  ret i32 %54
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @write_side_info() #0 {
  %1 = alloca %struct.MYSideInfo*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)*, align 8
  store i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)* @writePartSideInfo, i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)** %5, align 8
  store i32 0, i32* %2, align 4
  %6 = call %struct.MYSideInfo* @get_side_info()
  store %struct.MYSideInfo* %6, %struct.MYSideInfo** %1, align 8
  %7 = load %struct.MYSideInfo*, %struct.MYSideInfo** %1, align 8
  %8 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %7, i32 0, i32 0
  %9 = load i32, i32* %8, align 8
  store i32 %9, i32* @ThisFrameSize, align 4
  %10 = load i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)*, i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)** %5, align 8
  %11 = load %struct.MYSideInfo*, %struct.MYSideInfo** %1, align 8
  %12 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %11, i32 0, i32 4
  %13 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %12, align 8
  %14 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %13, i32 0, i32 1
  %15 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %14, align 8
  %16 = ptrtoint i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)* %10 to i64
  call void @__llvm_profile_instrument_target(i64 %16, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_side_info to i8*), i32 0)
  %17 = call i32 %10(%struct.BF_BitstreamPart* %15, %struct.BF_FrameResults* null)
  %18 = load i32, i32* %2, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, i32* %2, align 4
  %20 = load i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)*, i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)** %5, align 8
  %21 = load %struct.MYSideInfo*, %struct.MYSideInfo** %1, align 8
  %22 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %21, i32 0, i32 5
  %23 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %22, align 8
  %24 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %23, i32 0, i32 1
  %25 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %24, align 8
  %26 = ptrtoint i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)* %20 to i64
  call void @__llvm_profile_instrument_target(i64 %26, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_side_info to i8*), i32 1)
  %27 = call i32 %20(%struct.BF_BitstreamPart* %25, %struct.BF_FrameResults* null)
  %28 = load i32, i32* %2, align 4
  %29 = add nsw i32 %28, %27
  store i32 %29, i32* %2, align 4
  store i32 0, i32* %3, align 4
  br label %30

; <label>:30:                                     ; preds = %50, %0
  %31 = load i32, i32* %3, align 4
  %32 = load %struct.MYSideInfo*, %struct.MYSideInfo** %1, align 8
  %33 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %32, i32 0, i32 3
  %34 = load i32, i32* %33, align 4
  %35 = icmp slt i32 %31, %34
  br i1 %35, label %36, label %54

; <label>:36:                                     ; preds = %30
  %37 = load i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)*, i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)** %5, align 8
  %38 = load %struct.MYSideInfo*, %struct.MYSideInfo** %1, align 8
  %39 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %38, i32 0, i32 6
  %40 = load i32, i32* %3, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %39, i64 0, i64 %41
  %43 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %42, align 8
  %44 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %43, i32 0, i32 1
  %45 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %44, align 8
  %46 = ptrtoint i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)* %37 to i64
  call void @__llvm_profile_instrument_target(i64 %46, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_side_info to i8*), i32 2)
  %47 = call i32 %37(%struct.BF_BitstreamPart* %45, %struct.BF_FrameResults* null)
  %48 = load i32, i32* %2, align 4
  %49 = add nsw i32 %48, %47
  store i32 %49, i32* %2, align 4
  br label %50

; <label>:50:                                     ; preds = %36
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_write_side_info, i64 0, i64 1)
  %51 = add i64 %pgocount, 1
  store i64 %51, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_write_side_info, i64 0, i64 1)
  %52 = load i32, i32* %3, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %3, align 4
  br label %30

; <label>:54:                                     ; preds = %30
  store i32 0, i32* %4, align 4
  br label %55

; <label>:55:                                     ; preds = %90, %54
  %56 = load i32, i32* %4, align 4
  %57 = load %struct.MYSideInfo*, %struct.MYSideInfo** %1, align 8
  %58 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %57, i32 0, i32 2
  %59 = load i32, i32* %58, align 8
  %60 = icmp slt i32 %56, %59
  br i1 %60, label %61, label %94

; <label>:61:                                     ; preds = %55
  store i32 0, i32* %3, align 4
  br label %62

; <label>:62:                                     ; preds = %85, %61
  %63 = load i32, i32* %3, align 4
  %64 = load %struct.MYSideInfo*, %struct.MYSideInfo** %1, align 8
  %65 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %64, i32 0, i32 3
  %66 = load i32, i32* %65, align 4
  %67 = icmp slt i32 %63, %66
  br i1 %67, label %68, label %89

; <label>:68:                                     ; preds = %62
  %69 = load i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)*, i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)** %5, align 8
  %70 = load %struct.MYSideInfo*, %struct.MYSideInfo** %1, align 8
  %71 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %70, i32 0, i32 7
  %72 = load i32, i32* %4, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* %71, i64 0, i64 %73
  %75 = load i32, i32* %3, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %74, i64 0, i64 %76
  %78 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %77, align 8
  %79 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %78, i32 0, i32 1
  %80 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %79, align 8
  %81 = ptrtoint i32 (%struct.BF_BitstreamPart*, %struct.BF_FrameResults*)* %69 to i64
  call void @__llvm_profile_instrument_target(i64 %81, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_side_info to i8*), i32 3)
  %82 = call i32 %69(%struct.BF_BitstreamPart* %80, %struct.BF_FrameResults* null)
  %83 = load i32, i32* %2, align 4
  %84 = add nsw i32 %83, %82
  store i32 %84, i32* %2, align 4
  br label %85

; <label>:85:                                     ; preds = %68
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_write_side_info, i64 0, i64 0)
  %86 = add i64 %pgocount1, 1
  store i64 %86, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_write_side_info, i64 0, i64 0)
  %87 = load i32, i32* %3, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %3, align 4
  br label %62

; <label>:89:                                     ; preds = %62
  br label %90

; <label>:90:                                     ; preds = %89
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_write_side_info, i64 0, i64 2)
  %91 = add i64 %pgocount2, 1
  store i64 %91, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_write_side_info, i64 0, i64 2)
  %92 = load i32, i32* %4, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %4, align 4
  br label %55

; <label>:94:                                     ; preds = %55
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_write_side_info, i64 0, i64 3)
  %95 = add i64 %pgocount3, 1
  store i64 %95, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_write_side_info, i64 0, i64 3)
  %96 = load i32, i32* %2, align 4
  ret i32 %96
}

declare void @putMyBits(i32, i32) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @writePartSideInfo(%struct.BF_BitstreamPart*, %struct.BF_FrameResults*) #0 {
  %3 = alloca %struct.BF_BitstreamPart*, align 8
  %4 = alloca %struct.BF_FrameResults*, align 8
  %5 = alloca %struct.BF_BitstreamElement*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct.BF_BitstreamPart* %0, %struct.BF_BitstreamPart** %3, align 8
  store %struct.BF_FrameResults* %1, %struct.BF_FrameResults** %4, align 8
  store i32 0, i32* %7, align 4
  %8 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %3, align 8
  %9 = icmp ne %struct.BF_BitstreamPart* %8, null
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %2
  br label %14

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_writePartSideInfo, i64 0, i64 2)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_writePartSideInfo, i64 0, i64 2)
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0), i32 176, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.writePartSideInfo, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %14

; <label>:14:                                     ; preds = %13, %10
  %15 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %3, align 8
  %16 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %15, i32 0, i32 1
  %17 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %16, align 8
  store %struct.BF_BitstreamElement* %17, %struct.BF_BitstreamElement** %5, align 8
  store i32 0, i32* %6, align 4
  br label %18

; <label>:18:                                     ; preds = %38, %14
  %19 = load i32, i32* %6, align 4
  %20 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %3, align 8
  %21 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %20, i32 0, i32 0
  %22 = load i32, i32* %21, align 8
  %23 = icmp ult i32 %19, %22
  br i1 %23, label %24, label %44

; <label>:24:                                     ; preds = %18
  %25 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %5, align 8
  %26 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %25, i32 0, i32 0
  %27 = load i32, i32* %26, align 4
  %28 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %5, align 8
  %29 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %28, i32 0, i32 1
  %30 = load i16, i16* %29, align 4
  %31 = zext i16 %30 to i32
  call void @putMyBits(i32 %27, i32 %31)
  %32 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %5, align 8
  %33 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %32, i32 0, i32 1
  %34 = load i16, i16* %33, align 4
  %35 = zext i16 %34 to i32
  %36 = load i32, i32* %7, align 4
  %37 = add nsw i32 %36, %35
  store i32 %37, i32* %7, align 4
  br label %38

; <label>:38:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_writePartSideInfo, i64 0, i64 0)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_writePartSideInfo, i64 0, i64 0)
  %40 = load i32, i32* %6, align 4
  %41 = add i32 %40, 1
  store i32 %41, i32* %6, align 4
  %42 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %5, align 8
  %43 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %42, i32 1
  store %struct.BF_BitstreamElement* %43, %struct.BF_BitstreamElement** %5, align 8
  br label %18

; <label>:44:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_writePartSideInfo, i64 0, i64 1)
  %45 = add i64 %pgocount2, 1
  store i64 %45, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_writePartSideInfo, i64 0, i64 1)
  %46 = load i32, i32* %7, align 4
  ret i32 %46
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.MYSideInfo* @get_side_info() #0 {
  %1 = alloca %struct.side_info_link*, align 8
  %2 = alloca %struct.side_info_link*, align 8
  %3 = load %struct.side_info_link*, %struct.side_info_link** @side_queue_free, align 8
  store %struct.side_info_link* %3, %struct.side_info_link** %1, align 8
  %4 = load %struct.side_info_link*, %struct.side_info_link** @side_queue_head, align 8
  store %struct.side_info_link* %4, %struct.side_info_link** %2, align 8
  %5 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  %6 = icmp ne %struct.side_info_link* %5, null
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %0
  br label %11

; <label>:8:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_side_info, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_side_info, i64 0, i64 1)
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0), i32 384, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @__PRETTY_FUNCTION__.get_side_info, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %11

; <label>:11:                                     ; preds = %10, %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_side_info, i64 0, i64 0)
  %12 = add i64 %pgocount1, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_side_info, i64 0, i64 0)
  %13 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  %14 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %13, i32 0, i32 0
  %15 = load %struct.side_info_link*, %struct.side_info_link** %14, align 8
  store %struct.side_info_link* %15, %struct.side_info_link** @side_queue_head, align 8
  %16 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  store %struct.side_info_link* %16, %struct.side_info_link** @side_queue_free, align 8
  %17 = load %struct.side_info_link*, %struct.side_info_link** %1, align 8
  %18 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  %19 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %18, i32 0, i32 0
  store %struct.side_info_link* %17, %struct.side_info_link** %19, align 8
  %20 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  %21 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %20, i32 0, i32 1
  ret %struct.MYSideInfo* %21
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @free_side_info_link(%struct.side_info_link*) #0 {
  %2 = alloca %struct.side_info_link*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store %struct.side_info_link* %0, %struct.side_info_link** %2, align 8
  %5 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  %6 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %5, i32 0, i32 1
  %7 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %6, i32 0, i32 4
  %8 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %7, align 8
  %9 = call %struct.BF_PartHolder* @BF_freePartHolder(%struct.BF_PartHolder* %8)
  %10 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  %11 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %10, i32 0, i32 1
  %12 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %11, i32 0, i32 4
  store %struct.BF_PartHolder* %9, %struct.BF_PartHolder** %12, align 8
  %13 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  %14 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %13, i32 0, i32 1
  %15 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %14, i32 0, i32 5
  %16 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %15, align 8
  %17 = call %struct.BF_PartHolder* @BF_freePartHolder(%struct.BF_PartHolder* %16)
  %18 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  %19 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %18, i32 0, i32 1
  %20 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %19, i32 0, i32 5
  store %struct.BF_PartHolder* %17, %struct.BF_PartHolder** %20, align 8
  store i32 0, i32* %4, align 4
  br label %21

; <label>:21:                                     ; preds = %43, %1
  %22 = load i32, i32* %4, align 4
  %23 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  %24 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %23, i32 0, i32 1
  %25 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %24, i32 0, i32 3
  %26 = load i32, i32* %25, align 4
  %27 = icmp slt i32 %22, %26
  br i1 %27, label %28, label %47

; <label>:28:                                     ; preds = %21
  %29 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  %30 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %29, i32 0, i32 1
  %31 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %30, i32 0, i32 6
  %32 = load i32, i32* %4, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %31, i64 0, i64 %33
  %35 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %34, align 8
  %36 = call %struct.BF_PartHolder* @BF_freePartHolder(%struct.BF_PartHolder* %35)
  %37 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  %38 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %37, i32 0, i32 1
  %39 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %38, i32 0, i32 6
  %40 = load i32, i32* %4, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %39, i64 0, i64 %41
  store %struct.BF_PartHolder* %36, %struct.BF_PartHolder** %42, align 8
  br label %43

; <label>:43:                                     ; preds = %28
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_free_side_info_link, i64 0, i64 1)
  %44 = add i64 %pgocount, 1
  store i64 %44, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_free_side_info_link, i64 0, i64 1)
  %45 = load i32, i32* %4, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %4, align 4
  br label %21

; <label>:47:                                     ; preds = %21
  store i32 0, i32* %3, align 4
  br label %48

; <label>:48:                                     ; preds = %89, %47
  %49 = load i32, i32* %3, align 4
  %50 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  %51 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %50, i32 0, i32 1
  %52 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %51, i32 0, i32 2
  %53 = load i32, i32* %52, align 8
  %54 = icmp slt i32 %49, %53
  br i1 %54, label %55, label %93

; <label>:55:                                     ; preds = %48
  store i32 0, i32* %4, align 4
  br label %56

; <label>:56:                                     ; preds = %84, %55
  %57 = load i32, i32* %4, align 4
  %58 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  %59 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %58, i32 0, i32 1
  %60 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %59, i32 0, i32 3
  %61 = load i32, i32* %60, align 4
  %62 = icmp slt i32 %57, %61
  br i1 %62, label %63, label %88

; <label>:63:                                     ; preds = %56
  %64 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  %65 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %64, i32 0, i32 1
  %66 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %65, i32 0, i32 7
  %67 = load i32, i32* %3, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* %66, i64 0, i64 %68
  %70 = load i32, i32* %4, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %69, i64 0, i64 %71
  %73 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %72, align 8
  %74 = call %struct.BF_PartHolder* @BF_freePartHolder(%struct.BF_PartHolder* %73)
  %75 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  %76 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %75, i32 0, i32 1
  %77 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %76, i32 0, i32 7
  %78 = load i32, i32* %3, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* %77, i64 0, i64 %79
  %81 = load i32, i32* %4, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %80, i64 0, i64 %82
  store %struct.BF_PartHolder* %74, %struct.BF_PartHolder** %83, align 8
  br label %84

; <label>:84:                                     ; preds = %63
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_free_side_info_link, i64 0, i64 0)
  %85 = add i64 %pgocount1, 1
  store i64 %85, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_free_side_info_link, i64 0, i64 0)
  %86 = load i32, i32* %4, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %4, align 4
  br label %56

; <label>:88:                                     ; preds = %56
  br label %89

; <label>:89:                                     ; preds = %88
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_free_side_info_link, i64 0, i64 2)
  %90 = add i64 %pgocount2, 1
  store i64 %90, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_free_side_info_link, i64 0, i64 2)
  %91 = load i32, i32* %3, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %3, align 4
  br label %48

; <label>:93:                                     ; preds = %48
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_free_side_info_link, i64 0, i64 3)
  %94 = add i64 %pgocount3, 1
  store i64 %94, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_free_side_info_link, i64 0, i64 3)
  %95 = load %struct.side_info_link*, %struct.side_info_link** %2, align 8
  %96 = bitcast %struct.side_info_link* %95 to i8*
  call void @free(i8* %96) #5
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #5

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
