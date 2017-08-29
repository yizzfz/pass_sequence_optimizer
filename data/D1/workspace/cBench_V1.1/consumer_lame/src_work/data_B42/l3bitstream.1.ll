; ModuleID = 'l3bitstream.ll'
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

@frameData = local_unnamed_addr global %struct.BF_FrameData* null, align 8
@frameResults = local_unnamed_addr global %struct.BF_FrameResults* null, align 8
@PartHoldersInitialized = local_unnamed_addr global i32 0, align 4
@bs = internal unnamed_addr global %struct.bit_stream_struc* null, align 8
@.str = private unnamed_addr constant [10 x i8] c"frameData\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"l3bitstream.c\00", align 1
@__PRETTY_FUNCTION__.III_format_bitstream = private unnamed_addr constant [131 x i8] c"void III_format_bitstream(lame_global_flags *, int, int (*)[2][576], III_side_info_t *, III_scalefac_t (*)[2], Bit_stream_struc *)\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"frameResults\00", align 1
@headerPH = common local_unnamed_addr global %struct.BF_PartHolder* null, align 8
@frameSIPH = common local_unnamed_addr global %struct.BF_PartHolder* null, align 8
@channelSIPH = common global [2 x %struct.BF_PartHolder*] zeroinitializer, align 16
@spectrumSIPH = common global [2 x [2 x %struct.BF_PartHolder*]] zeroinitializer, align 16
@scaleFactorsPH = common global [2 x [2 x %struct.BF_PartHolder*]] zeroinitializer, align 16
@codedDataPH = common global [2 x [2 x %struct.BF_PartHolder*]] zeroinitializer, align 16
@userSpectrumPH = common local_unnamed_addr global [2 x [2 x %struct.BF_PartHolder*]] zeroinitializer, align 16
@userFrameDataPH = common local_unnamed_addr global %struct.BF_PartHolder* null, align 8
@ht = external global [34 x %struct.huffcodetab], align 16
@.str.3 = private unnamed_addr constant [22 x i8] c"linbitsx <= h->linmax\00", align 1
@__PRETTY_FUNCTION__.HuffmanCode = private unnamed_addr constant [77 x i8] c"int HuffmanCode(int, int, int, unsigned int *, unsigned int *, int *, int *)\00", align 1
@.str.4 = private unnamed_addr constant [22 x i8] c"linbitsy <= h->linmax\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"*cbits <= 32\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"*xbits <= 32\00", align 1
@slen1_tab = internal unnamed_addr constant [16 x i32] [i32 0, i32 0, i32 0, i32 0, i32 3, i32 1, i32 1, i32 1, i32 2, i32 2, i32 2, i32 3, i32 3, i32 3, i32 4, i32 4], align 16
@slen2_tab = internal unnamed_addr constant [16 x i32] [i32 0, i32 1, i32 2, i32 3, i32 0, i32 1, i32 2, i32 3, i32 1, i32 2, i32 3, i32 1, i32 2, i32 3, i32 2, i32 3], align 16
@.str.7 = private unnamed_addr constant [24 x i8] c"gi->sfb_partition_table\00", align 1
@__PRETTY_FUNCTION__.encodeMainData = private unnamed_addr constant [100 x i8] c"void encodeMainData(lame_global_flags *, int (*)[2][576], III_side_info_t *, III_scalefac_t (*)[2])\00", align 1
@scalefac_band = external local_unnamed_addr global %struct.scalefac_struct, align 4
@.str.8 = private unnamed_addr constant [16 x i8] c"tableindex < 32\00", align 1
@__PRETTY_FUNCTION__.Huffmancodebits = private unnamed_addr constant [57 x i8] c"void Huffmancodebits(BF_PartHolder **, int *, gr_info *)\00", align 1
@.str.9 = private unnamed_addr constant [20 x i8] c"scalefac_index < 23\00", align 1
@.str.10 = private unnamed_addr constant [29 x i8] c"(gi->count1table_select < 2)\00", align 1
@.str.11 = private unnamed_addr constant [17 x i8] c"count1End <= 576\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.12 = private unnamed_addr constant [35 x i8] c"opps - adding stuffing bits = %i.\0A\00", align 1
@.str.13 = private unnamed_addr constant [27 x i8] c"this should not happen...\0A\00", align 1
@.str.14 = private unnamed_addr constant [60 x i8] c"bitsWritten == (int)(gi->part2_3_length - gi->part2_length)\00", align 1
@crc = internal unnamed_addr global i32 0, align 4
@.str.15 = private unnamed_addr constant [28 x i8] c"gi->block_type == NORM_TYPE\00", align 1
@__PRETTY_FUNCTION__.encodeSideInfo = private unnamed_addr constant [59 x i8] c"int encodeSideInfo(lame_global_flags *, III_side_info_t *)\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @putMyBits(i32, i32) local_unnamed_addr #0 {
  %3 = load %struct.bit_stream_struc*, %struct.bit_stream_struc** @bs, align 8
  tail call void @putbits(%struct.bit_stream_struc* %3, i32 %0, i32 %1) #5
  ret void
}

declare void @putbits(%struct.bit_stream_struc*, i32, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @III_format_bitstream(%struct.lame_global_flags* readonly, i32, [2 x [576 x i32]]* nocapture readonly, %struct.III_side_info_t*, [2 x %struct.III_scalefac_t]* nocapture readonly, %struct.bit_stream_struc*) local_unnamed_addr #0 {
  store %struct.bit_stream_struc* %5, %struct.bit_stream_struc** @bs, align 8
  %7 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %8 = icmp eq %struct.BF_FrameData* %7, null
  br i1 %8, label %9, label %13

; <label>:9:                                      ; preds = %6
  %10 = tail call noalias i8* @calloc(i64 1, i64 184) #5
  store i8* %10, i8** bitcast (%struct.BF_FrameData** @frameData to i8**), align 8
  %11 = icmp eq i8* %10, null
  br i1 %11, label %12, label %13

; <label>:12:                                     ; preds = %9
  tail call void @__assert_fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 73, i8* getelementptr inbounds ([131 x i8], [131 x i8]* @__PRETTY_FUNCTION__.III_format_bitstream, i64 0, i64 0)) #6
  unreachable

; <label>:13:                                     ; preds = %9, %6
  %14 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** @frameResults, align 8
  %15 = icmp eq %struct.BF_FrameResults* %14, null
  br i1 %15, label %16, label %20

; <label>:16:                                     ; preds = %13
  %17 = tail call noalias i8* @calloc(i64 1, i64 12) #5
  store i8* %17, i8** bitcast (%struct.BF_FrameResults** @frameResults to i8**), align 8
  %18 = icmp eq i8* %17, null
  br i1 %18, label %19, label %20

; <label>:19:                                     ; preds = %16
  tail call void @__assert_fail(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 78, i8* getelementptr inbounds ([131 x i8], [131 x i8]* @__PRETTY_FUNCTION__.III_format_bitstream, i64 0, i64 0)) #6
  unreachable

; <label>:20:                                     ; preds = %16, %13
  %21 = load i32, i32* @PartHoldersInitialized, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %115, label %23

; <label>:23:                                     ; preds = %20, %115
  tail call fastcc void @encodeSideInfo(%struct.lame_global_flags* %0, %struct.III_side_info_t* %3)
  tail call fastcc void @encodeMainData(%struct.lame_global_flags* %0, [2 x [576 x i32]]* %2, %struct.III_side_info_t* %3, [2 x %struct.III_scalefac_t]* %4)
  %24 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %3, i64 0, i32 2
  %25 = load i32, i32* %24, align 8
  tail call fastcc void @drain_into_ancillary_data(i32 %25)
  %26 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %27 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %26, i64 0, i32 0
  store i32 %1, i32* %27, align 8
  %28 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 45
  %29 = load i32, i32* %28, align 8
  %30 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %31 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %30, i64 0, i32 1
  store i32 %29, i32* %31, align 4
  %32 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %33 = load i32, i32* %32, align 4
  %34 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %35 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %34, i64 0, i32 2
  store i32 %33, i32* %35, align 8
  %36 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %37 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %36, i64 0, i32 1
  %38 = bitcast %struct.BF_BitstreamPart** %37 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %41 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %40, i64 0, i32 3
  %42 = bitcast %struct.BF_BitstreamPart** %41 to i64*
  store i64 %39, i64* %42, align 8
  %43 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @frameSIPH, align 8
  %44 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %43, i64 0, i32 1
  %45 = bitcast %struct.BF_BitstreamPart** %44 to i64*
  %46 = load i64, i64* %45, align 8
  %47 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %48 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %47, i64 0, i32 4
  %49 = bitcast %struct.BF_BitstreamPart** %48 to i64*
  store i64 %46, i64* %49, align 8
  %50 = load i32, i32* %32, align 4
  %51 = icmp sgt i32 %50, 0
  br i1 %51, label %.lr.ph11, label %.preheader3

.lr.ph11:                                         ; preds = %23
  %52 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  br label %56

.preheader3.loopexit:                             ; preds = %56
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %23
  %53 = load i32, i32* %28, align 8
  %54 = icmp sgt i32 %53, 0
  br i1 %54, label %.preheader.lr.ph, label %._crit_edge8

.preheader.lr.ph:                                 ; preds = %.preheader3
  %55 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  br label %.preheader

; <label>:56:                                     ; preds = %.lr.ph11, %56
  %indvars.iv17 = phi i64 [ 0, %.lr.ph11 ], [ %indvars.iv.next18, %56 ]
  %57 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* @channelSIPH, i64 0, i64 %indvars.iv17
  %58 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %57, align 8
  %59 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %58, i64 0, i32 1
  %60 = bitcast %struct.BF_BitstreamPart** %59 to i64*
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %52, i64 0, i32 5, i64 %indvars.iv17
  %63 = bitcast %struct.BF_BitstreamPart** %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %64 = load i32, i32* %32, align 4
  %65 = sext i32 %64 to i64
  %66 = icmp slt i64 %indvars.iv.next18, %65
  br i1 %66, label %56, label %.preheader3.loopexit

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge
  %indvars.iv15 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next16, %._crit_edge ]
  %67 = load i32, i32* %32, align 4
  %68 = icmp sgt i32 %67, 0
  br i1 %68, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %69 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @spectrumSIPH, i64 0, i64 %indvars.iv15, i64 %indvars.iv
  %70 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %69, align 8
  %71 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %70, i64 0, i32 1
  %72 = bitcast %struct.BF_BitstreamPart** %71 to i64*
  %73 = load i64, i64* %72, align 8
  %74 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %55, i64 0, i32 6, i64 %indvars.iv15, i64 %indvars.iv
  %75 = bitcast %struct.BF_BitstreamPart** %74 to i64*
  store i64 %73, i64* %75, align 8
  %76 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @scaleFactorsPH, i64 0, i64 %indvars.iv15, i64 %indvars.iv
  %77 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %76, align 8
  %78 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %77, i64 0, i32 1
  %79 = bitcast %struct.BF_BitstreamPart** %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %55, i64 0, i32 7, i64 %indvars.iv15, i64 %indvars.iv
  %82 = bitcast %struct.BF_BitstreamPart** %81 to i64*
  store i64 %80, i64* %82, align 8
  %83 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @codedDataPH, i64 0, i64 %indvars.iv15, i64 %indvars.iv
  %84 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %83, align 8
  %85 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %84, i64 0, i32 1
  %86 = bitcast %struct.BF_BitstreamPart** %85 to i64*
  %87 = load i64, i64* %86, align 8
  %88 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %55, i64 0, i32 8, i64 %indvars.iv15, i64 %indvars.iv
  %89 = bitcast %struct.BF_BitstreamPart** %88 to i64*
  store i64 %87, i64* %89, align 8
  %90 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @userSpectrumPH, i64 0, i64 %indvars.iv15, i64 %indvars.iv
  %91 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %90, align 8
  %92 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %91, i64 0, i32 1
  %93 = bitcast %struct.BF_BitstreamPart** %92 to i64*
  %94 = load i64, i64* %93, align 8
  %95 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %55, i64 0, i32 9, i64 %indvars.iv15, i64 %indvars.iv
  %96 = bitcast %struct.BF_BitstreamPart** %95 to i64*
  store i64 %94, i64* %96, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %97 = load i32, i32* %32, align 4
  %98 = sext i32 %97 to i64
  %99 = icmp slt i64 %indvars.iv.next, %98
  br i1 %99, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %100 = load i32, i32* %28, align 8
  %101 = sext i32 %100 to i64
  %102 = icmp slt i64 %indvars.iv.next16, %101
  br i1 %102, label %.preheader, label %._crit_edge8.loopexit

._crit_edge8.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.preheader3
  %103 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @userFrameDataPH, align 8
  %104 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %103, i64 0, i32 1
  %105 = bitcast %struct.BF_BitstreamPart** %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %108 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %107, i64 0, i32 10
  %109 = bitcast %struct.BF_BitstreamPart** %108 to i64*
  store i64 %106, i64* %109, align 8
  %110 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** @frameResults, align 8
  tail call void @BF_BitstreamFrame(%struct.BF_FrameData* %107, %struct.BF_FrameResults* %110) #5
  %111 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** @frameResults, align 8
  %112 = getelementptr inbounds %struct.BF_FrameResults, %struct.BF_FrameResults* %111, i64 0, i32 2
  %113 = load i32, i32* %112, align 4
  %114 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %3, i64 0, i32 0
  store i32 %113, i32* %114, align 8
  ret void

; <label>:115:                                    ; preds = %20
  %116 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 14) #5
  store %struct.BF_PartHolder* %116, %struct.BF_PartHolder** @headerPH, align 8
  %117 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 12) #5
  store %struct.BF_PartHolder* %117, %struct.BF_PartHolder** @frameSIPH, align 8
  %118 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 8) #5
  store %struct.BF_PartHolder* %118, %struct.BF_PartHolder** getelementptr inbounds ([2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* @channelSIPH, i64 0, i64 0), align 16
  %119 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 8) #5
  store %struct.BF_PartHolder* %119, %struct.BF_PartHolder** getelementptr inbounds ([2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* @channelSIPH, i64 0, i64 1), align 8
  %120 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 32) #5
  store %struct.BF_PartHolder* %120, %struct.BF_PartHolder** getelementptr inbounds ([2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @spectrumSIPH, i64 0, i64 0, i64 0), align 16
  %121 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 64) #5
  store %struct.BF_PartHolder* %121, %struct.BF_PartHolder** getelementptr inbounds ([2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @scaleFactorsPH, i64 0, i64 0, i64 0), align 16
  %122 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 576) #5
  store %struct.BF_PartHolder* %122, %struct.BF_PartHolder** getelementptr inbounds ([2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @codedDataPH, i64 0, i64 0, i64 0), align 16
  %123 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 4) #5
  store %struct.BF_PartHolder* %123, %struct.BF_PartHolder** getelementptr inbounds ([2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @userSpectrumPH, i64 0, i64 0, i64 0), align 16
  %124 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 32) #5
  store %struct.BF_PartHolder* %124, %struct.BF_PartHolder** getelementptr inbounds ([2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @spectrumSIPH, i64 0, i64 0, i64 1), align 8
  %125 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 64) #5
  store %struct.BF_PartHolder* %125, %struct.BF_PartHolder** getelementptr inbounds ([2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @scaleFactorsPH, i64 0, i64 0, i64 1), align 8
  %126 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 576) #5
  store %struct.BF_PartHolder* %126, %struct.BF_PartHolder** getelementptr inbounds ([2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @codedDataPH, i64 0, i64 0, i64 1), align 8
  %127 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 4) #5
  store %struct.BF_PartHolder* %127, %struct.BF_PartHolder** getelementptr inbounds ([2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @userSpectrumPH, i64 0, i64 0, i64 1), align 8
  %128 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 32) #5
  store %struct.BF_PartHolder* %128, %struct.BF_PartHolder** getelementptr inbounds ([2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @spectrumSIPH, i64 0, i64 1, i64 0), align 16
  %129 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 64) #5
  store %struct.BF_PartHolder* %129, %struct.BF_PartHolder** getelementptr inbounds ([2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @scaleFactorsPH, i64 0, i64 1, i64 0), align 16
  %130 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 576) #5
  store %struct.BF_PartHolder* %130, %struct.BF_PartHolder** getelementptr inbounds ([2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @codedDataPH, i64 0, i64 1, i64 0), align 16
  %131 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 4) #5
  store %struct.BF_PartHolder* %131, %struct.BF_PartHolder** getelementptr inbounds ([2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @userSpectrumPH, i64 0, i64 1, i64 0), align 16
  %132 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 32) #5
  store %struct.BF_PartHolder* %132, %struct.BF_PartHolder** getelementptr inbounds ([2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @spectrumSIPH, i64 0, i64 1, i64 1), align 8
  %133 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 64) #5
  store %struct.BF_PartHolder* %133, %struct.BF_PartHolder** getelementptr inbounds ([2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @scaleFactorsPH, i64 0, i64 1, i64 1), align 8
  %134 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 576) #5
  store %struct.BF_PartHolder* %134, %struct.BF_PartHolder** getelementptr inbounds ([2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @codedDataPH, i64 0, i64 1, i64 1), align 8
  %135 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 4) #5
  store %struct.BF_PartHolder* %135, %struct.BF_PartHolder** getelementptr inbounds ([2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @userSpectrumPH, i64 0, i64 1, i64 1), align 8
  %136 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 8) #5
  store %struct.BF_PartHolder* %136, %struct.BF_PartHolder** @userFrameDataPH, align 8
  store i32 1, i32* @PartHoldersInitialized, align 4
  br label %23
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #3

declare %struct.BF_PartHolder* @BF_newPartHolder(i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @encodeSideInfo(%struct.lame_global_flags* readonly, %struct.III_side_info_t* readonly) unnamed_addr #0 {
  store i32 65535, i32* @crc, align 4
  %3 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %4 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %3, i64 0, i32 1
  %5 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %4, align 8
  %6 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %5, i64 0, i32 0
  store i32 0, i32* %6, align 8
  %7 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %8 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %7, i32 4095, i32 12) #5
  store %struct.BF_PartHolder* %8, %struct.BF_PartHolder** @headerPH, align 8
  %9 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 43
  %10 = load i32, i32* %9, align 8
  %11 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %8, i32 %10, i32 1) #5
  store %struct.BF_PartHolder* %11, %struct.BF_PartHolder** @headerPH, align 8
  %12 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %11, i32 1, i32 2) #5
  store %struct.BF_PartHolder* %12, %struct.BF_PartHolder** @headerPH, align 8
  %13 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 14
  %14 = load i32, i32* %13, align 4
  %15 = icmp eq i32 %14, 0
  %16 = zext i1 %15 to i32
  %17 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %12, i32 %16, i32 1) #5
  store %struct.BF_PartHolder* %17, %struct.BF_PartHolder** @headerPH, align 8
  %18 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 50
  %19 = load i32, i32* %18, align 4
  %20 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %17, i32 %19, i32 4)
  store %struct.BF_PartHolder* %20, %struct.BF_PartHolder** @headerPH, align 8
  %21 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 51
  %22 = load i32, i32* %21, align 8
  %23 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %20, i32 %22, i32 2)
  store %struct.BF_PartHolder* %23, %struct.BF_PartHolder** @headerPH, align 8
  %24 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 44
  %25 = load i32, i32* %24, align 4
  %26 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %23, i32 %25, i32 1)
  store %struct.BF_PartHolder* %26, %struct.BF_PartHolder** @headerPH, align 8
  %27 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 16
  %28 = load i32, i32* %27, align 4
  %29 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %26, i32 %28, i32 1)
  store %struct.BF_PartHolder* %29, %struct.BF_PartHolder** @headerPH, align 8
  %30 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %31 = load i32, i32* %30, align 4
  %32 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %29, i32 %31, i32 2)
  store %struct.BF_PartHolder* %32, %struct.BF_PartHolder** @headerPH, align 8
  %33 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 52
  %34 = load i32, i32* %33, align 4
  %35 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %32, i32 %34, i32 2)
  store %struct.BF_PartHolder* %35, %struct.BF_PartHolder** @headerPH, align 8
  %36 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 12
  %37 = load i32, i32* %36, align 4
  %38 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %35, i32 %37, i32 1)
  store %struct.BF_PartHolder* %38, %struct.BF_PartHolder** @headerPH, align 8
  %39 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 13
  %40 = load i32, i32* %39, align 8
  %41 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %38, i32 %40, i32 1)
  store %struct.BF_PartHolder* %41, %struct.BF_PartHolder** @headerPH, align 8
  %42 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 38
  %43 = load i32, i32* %42, align 4
  %44 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %41, i32 %43, i32 2)
  store %struct.BF_PartHolder* %44, %struct.BF_PartHolder** @headerPH, align 8
  %45 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @frameSIPH, align 8
  %46 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %45, i64 0, i32 1
  %47 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %46, align 8
  %48 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %47, i64 0, i32 0
  store i32 0, i32* %48, align 8
  %49 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %50 = load i32, i32* %49, align 4
  %51 = icmp sgt i32 %50, 0
  br i1 %51, label %.lr.ph36.preheader, label %.preheader13

.lr.ph36.preheader:                               ; preds = %2
  br label %.lr.ph36

.preheader13.loopexit:                            ; preds = %.lr.ph36
  br label %.preheader13

.preheader13:                                     ; preds = %.preheader13.loopexit, %2
  %52 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 45
  %53 = load i32, i32* %52, align 8
  %54 = icmp sgt i32 %53, 0
  br i1 %54, label %.preheader12.preheader, label %._crit_edge33

.preheader12.preheader:                           ; preds = %.preheader13
  br label %.preheader12

.lr.ph36:                                         ; preds = %.lr.ph36.preheader, %.lr.ph36
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %.lr.ph36 ], [ 0, %.lr.ph36.preheader ]
  %55 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* @channelSIPH, i64 0, i64 %indvars.iv59
  %56 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %55, align 8
  %57 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %56, i64 0, i32 1
  %58 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %57, align 8
  %59 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %58, i64 0, i32 0
  store i32 0, i32* %59, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %60 = load i32, i32* %49, align 4
  %61 = sext i32 %60 to i64
  %62 = icmp slt i64 %indvars.iv.next60, %61
  br i1 %62, label %.lr.ph36, label %.preheader13.loopexit

.preheader12:                                     ; preds = %.preheader12.preheader, %._crit_edge31
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge31 ], [ 0, %.preheader12.preheader ]
  %63 = load i32, i32* %49, align 4
  %64 = icmp sgt i32 %63, 0
  br i1 %64, label %.lr.ph30.preheader, label %._crit_edge31

.lr.ph30.preheader:                               ; preds = %.preheader12
  br label %.lr.ph30

.lr.ph30:                                         ; preds = %.lr.ph30.preheader, %.lr.ph30
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %.lr.ph30 ], [ 0, %.lr.ph30.preheader ]
  %65 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @spectrumSIPH, i64 0, i64 %indvars.iv57, i64 %indvars.iv55
  %66 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %65, align 8
  %67 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %66, i64 0, i32 1
  %68 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %67, align 8
  %69 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %68, i64 0, i32 0
  store i32 0, i32* %69, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %70 = load i32, i32* %49, align 4
  %71 = sext i32 %70 to i64
  %72 = icmp slt i64 %indvars.iv.next56, %71
  br i1 %72, label %.lr.ph30, label %._crit_edge31.loopexit

._crit_edge31.loopexit:                           ; preds = %.lr.ph30
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %.preheader12
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %73 = load i32, i32* %52, align 8
  %74 = sext i32 %73 to i64
  %75 = icmp slt i64 %indvars.iv.next58, %74
  br i1 %75, label %.preheader12, label %._crit_edge33.loopexit

._crit_edge33.loopexit:                           ; preds = %._crit_edge31
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %.preheader13
  %76 = load i32, i32* %9, align 8
  %77 = icmp eq i32 %76, 1
  %78 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @frameSIPH, align 8
  %79 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 0
  %80 = load i32, i32* %79, align 8
  br i1 %77, label %81, label %179

; <label>:81:                                     ; preds = %._crit_edge33
  %82 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %78, i32 %80, i32 9)
  store %struct.BF_PartHolder* %82, %struct.BF_PartHolder** @frameSIPH, align 8
  %83 = load i32, i32* %49, align 4
  %84 = icmp eq i32 %83, 2
  %85 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 1
  %86 = load i32, i32* %85, align 4
  %.sink = select i1 %84, i32 3, i32 5
  %87 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %82, i32 %86, i32 %.sink)
  store %struct.BF_PartHolder* %87, %struct.BF_PartHolder** @frameSIPH, align 8
  %88 = load i32, i32* %49, align 4
  %89 = icmp sgt i32 %88, 0
  br i1 %89, label %.preheader62.preheader, label %.preheader4.preheader

.preheader62.preheader:                           ; preds = %81
  br label %.preheader62

.preheader62:                                     ; preds = %.preheader62.preheader, %.preheader62
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %.preheader62 ], [ 0, %.preheader62.preheader ]
  %90 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* @channelSIPH, i64 0, i64 %indvars.iv44
  %91 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %90, align 8
  %92 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 3, i64 %indvars.iv44, i64 0
  %93 = load i32, i32* %92, align 4
  %94 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %91, i32 %93, i32 1)
  store %struct.BF_PartHolder* %94, %struct.BF_PartHolder** %90, align 8
  %95 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 3, i64 %indvars.iv44, i64 1
  %96 = load i32, i32* %95, align 4
  %97 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %94, i32 %96, i32 1)
  store %struct.BF_PartHolder* %97, %struct.BF_PartHolder** %90, align 8
  %98 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 3, i64 %indvars.iv44, i64 2
  %99 = load i32, i32* %98, align 4
  %100 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %97, i32 %99, i32 1)
  store %struct.BF_PartHolder* %100, %struct.BF_PartHolder** %90, align 8
  %101 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 3, i64 %indvars.iv44, i64 3
  %102 = load i32, i32* %101, align 4
  %103 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %100, i32 %102, i32 1)
  store %struct.BF_PartHolder* %103, %struct.BF_PartHolder** %90, align 8
  %indvars.iv.next45 = add nuw i64 %indvars.iv44, 1
  %104 = load i32, i32* %49, align 4
  %105 = sext i32 %104 to i64
  %106 = icmp slt i64 %indvars.iv.next45, %105
  br i1 %106, label %.preheader62, label %.preheader4.preheader.loopexit

.preheader4.preheader.loopexit:                   ; preds = %.preheader62
  br label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader4.preheader.loopexit, %81
  %.ph = phi i32 [ %88, %81 ], [ %104, %.preheader4.preheader.loopexit ]
  br label %.preheader4

.preheader4thread-pre-split:                      ; preds = %._crit_edge
  %.pr = load i32, i32* %49, align 4
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.preheader, %.preheader4thread-pre-split
  %107 = phi i32 [ %.pr, %.preheader4thread-pre-split ], [ %.ph, %.preheader4.preheader ]
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %.preheader4thread-pre-split ], [ 0, %.preheader4.preheader ]
  %108 = icmp sgt i32 %107, 0
  br i1 %108, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader4
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.loopexit
  %indvars.iv = phi i64 [ %indvars.iv.next, %.loopexit ], [ 0, %.lr.ph.preheader ]
  %109 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @spectrumSIPH, i64 0, i64 %indvars.iv40, i64 %indvars.iv
  %110 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %109, align 8
  %111 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 0
  %112 = load i32, i32* %111, align 8
  %113 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %110, i32 %112, i32 12)
  store %struct.BF_PartHolder* %113, %struct.BF_PartHolder** %109, align 8
  %114 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 1
  %115 = load i32, i32* %114, align 4
  %116 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %113, i32 %115, i32 9)
  store %struct.BF_PartHolder* %116, %struct.BF_PartHolder** %109, align 8
  %117 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 3
  %118 = load i32, i32* %117, align 4
  %119 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %116, i32 %118, i32 8)
  store %struct.BF_PartHolder* %119, %struct.BF_PartHolder** %109, align 8
  %120 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 4
  %121 = load i32, i32* %120, align 8
  %122 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %119, i32 %121, i32 4)
  store %struct.BF_PartHolder* %122, %struct.BF_PartHolder** %109, align 8
  %123 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 5
  %124 = load i32, i32* %123, align 4
  %125 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %122, i32 %124, i32 1)
  store %struct.BF_PartHolder* %125, %struct.BF_PartHolder** %109, align 8
  %126 = load i32, i32* %123, align 4
  %127 = icmp eq i32 %126, 0
  %128 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 6
  %129 = load i32, i32* %128, align 8
  br i1 %127, label %147, label %.preheader3

.preheader3:                                      ; preds = %.lr.ph
  %130 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %125, i32 %129, i32 2)
  store %struct.BF_PartHolder* %130, %struct.BF_PartHolder** %109, align 8
  %131 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 7
  %132 = load i32, i32* %131, align 4
  %133 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %130, i32 %132, i32 1)
  store %struct.BF_PartHolder* %133, %struct.BF_PartHolder** %109, align 8
  %134 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 8, i64 0
  %135 = load i32, i32* %134, align 4
  %136 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %133, i32 %135, i32 5)
  store %struct.BF_PartHolder* %136, %struct.BF_PartHolder** %109, align 8
  %137 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 8, i64 1
  %138 = load i32, i32* %137, align 4
  %139 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %136, i32 %138, i32 5)
  store %struct.BF_PartHolder* %139, %struct.BF_PartHolder** %109, align 8
  %140 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 9, i64 0
  %141 = load i32, i32* %140, align 4
  %142 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %139, i32 %141, i32 3)
  store %struct.BF_PartHolder* %142, %struct.BF_PartHolder** %109, align 8
  %143 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 9, i64 1
  %144 = load i32, i32* %143, align 4
  %145 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %142, i32 %144, i32 3)
  store %struct.BF_PartHolder* %145, %struct.BF_PartHolder** %109, align 8
  %146 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 9, i64 2
  br label %.loopexit

; <label>:147:                                    ; preds = %.lr.ph
  %148 = icmp eq i32 %129, 0
  br i1 %148, label %.preheader, label %149

; <label>:149:                                    ; preds = %147
  tail call void @__assert_fail(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 380, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__PRETTY_FUNCTION__.encodeSideInfo, i64 0, i64 0)) #6
  unreachable

.preheader:                                       ; preds = %147
  %150 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %109, align 8
  %151 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 8, i64 0
  %152 = load i32, i32* %151, align 4
  %153 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %150, i32 %152, i32 5)
  store %struct.BF_PartHolder* %153, %struct.BF_PartHolder** %109, align 8
  %154 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 8, i64 1
  %155 = load i32, i32* %154, align 4
  %156 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %153, i32 %155, i32 5)
  store %struct.BF_PartHolder* %156, %struct.BF_PartHolder** %109, align 8
  %157 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 8, i64 2
  %158 = load i32, i32* %157, align 4
  %159 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %156, i32 %158, i32 5)
  store %struct.BF_PartHolder* %159, %struct.BF_PartHolder** %109, align 8
  %160 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 10
  %161 = load i32, i32* %160, align 8
  %162 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %159, i32 %161, i32 4)
  store %struct.BF_PartHolder* %162, %struct.BF_PartHolder** %109, align 8
  %163 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 11
  br label %.loopexit

.loopexit:                                        ; preds = %.preheader3, %.preheader
  %.sink66 = phi i32* [ %146, %.preheader3 ], [ %163, %.preheader ]
  %.sink64 = phi %struct.BF_PartHolder* [ %145, %.preheader3 ], [ %162, %.preheader ]
  %164 = load i32, i32* %.sink66, align 4
  %165 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %.sink64, i32 %164, i32 3)
  store %struct.BF_PartHolder* %165, %struct.BF_PartHolder** %109, align 8
  %166 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 12
  %167 = load i32, i32* %166, align 8
  %168 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %165, i32 %167, i32 1)
  store %struct.BF_PartHolder* %168, %struct.BF_PartHolder** %109, align 8
  %169 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 13
  %170 = load i32, i32* %169, align 4
  %171 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %168, i32 %170, i32 1)
  store %struct.BF_PartHolder* %171, %struct.BF_PartHolder** %109, align 8
  %172 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 %indvars.iv40, i32 0, i64 %indvars.iv, i32 0, i32 14
  %173 = load i32, i32* %172, align 8
  %174 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %171, i32 %173, i32 1)
  store %struct.BF_PartHolder* %174, %struct.BF_PartHolder** %109, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %175 = load i32, i32* %49, align 4
  %176 = sext i32 %175 to i64
  %177 = icmp slt i64 %indvars.iv.next, %176
  br i1 %177, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader4
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %178 = icmp slt i64 %indvars.iv.next41, 2
  br i1 %178, label %.preheader4thread-pre-split, label %.loopexit6.loopexit

; <label>:179:                                    ; preds = %._crit_edge33
  %180 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %78, i32 %80, i32 8)
  store %struct.BF_PartHolder* %180, %struct.BF_PartHolder** @frameSIPH, align 8
  %181 = load i32, i32* %49, align 4
  %182 = icmp eq i32 %181, 2
  %183 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 1
  %184 = load i32, i32* %183, align 4
  %.sink2 = select i1 %182, i32 2, i32 1
  %185 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %180, i32 %184, i32 %.sink2)
  store %struct.BF_PartHolder* %185, %struct.BF_PartHolder** @frameSIPH, align 8
  %186 = load i32, i32* %49, align 4
  %187 = icmp sgt i32 %186, 0
  br i1 %187, label %.lr.ph28.preheader, label %.loopexit6

.lr.ph28.preheader:                               ; preds = %179
  br label %.lr.ph28

.lr.ph28:                                         ; preds = %.lr.ph28.preheader, %.loopexit10
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %.loopexit10 ], [ 0, %.lr.ph28.preheader ]
  %188 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @spectrumSIPH, i64 0, i64 0, i64 %indvars.iv53
  %189 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %188, align 8
  %190 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 0
  %191 = load i32, i32* %190, align 8
  %192 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %189, i32 %191, i32 12)
  store %struct.BF_PartHolder* %192, %struct.BF_PartHolder** %188, align 8
  %193 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 1
  %194 = load i32, i32* %193, align 4
  %195 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %192, i32 %194, i32 9)
  store %struct.BF_PartHolder* %195, %struct.BF_PartHolder** %188, align 8
  %196 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 3
  %197 = load i32, i32* %196, align 4
  %198 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %195, i32 %197, i32 8)
  store %struct.BF_PartHolder* %198, %struct.BF_PartHolder** %188, align 8
  %199 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 4
  %200 = load i32, i32* %199, align 8
  %201 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %198, i32 %200, i32 9)
  store %struct.BF_PartHolder* %201, %struct.BF_PartHolder** %188, align 8
  %202 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 5
  %203 = load i32, i32* %202, align 4
  %204 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %201, i32 %203, i32 1)
  store %struct.BF_PartHolder* %204, %struct.BF_PartHolder** %188, align 8
  %205 = load i32, i32* %202, align 4
  %206 = icmp eq i32 %205, 0
  br i1 %206, label %.preheader8, label %.preheader9

.preheader9:                                      ; preds = %.lr.ph28
  %207 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 6
  %208 = load i32, i32* %207, align 8
  %209 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %204, i32 %208, i32 2)
  store %struct.BF_PartHolder* %209, %struct.BF_PartHolder** %188, align 8
  %210 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 7
  %211 = load i32, i32* %210, align 4
  %212 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %209, i32 %211, i32 1)
  store %struct.BF_PartHolder* %212, %struct.BF_PartHolder** %188, align 8
  %213 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 8, i64 0
  %214 = load i32, i32* %213, align 4
  %215 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %212, i32 %214, i32 5)
  store %struct.BF_PartHolder* %215, %struct.BF_PartHolder** %188, align 8
  %216 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 8, i64 1
  %217 = load i32, i32* %216, align 4
  %218 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %215, i32 %217, i32 5)
  store %struct.BF_PartHolder* %218, %struct.BF_PartHolder** %188, align 8
  %219 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 9, i64 0
  %220 = load i32, i32* %219, align 4
  %221 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %218, i32 %220, i32 3)
  store %struct.BF_PartHolder* %221, %struct.BF_PartHolder** %188, align 8
  %222 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 9, i64 1
  %223 = load i32, i32* %222, align 4
  %224 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %221, i32 %223, i32 3)
  store %struct.BF_PartHolder* %224, %struct.BF_PartHolder** %188, align 8
  %225 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 9, i64 2
  br label %.loopexit10

.preheader8:                                      ; preds = %.lr.ph28
  %226 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %188, align 8
  %227 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 8, i64 0
  %228 = load i32, i32* %227, align 4
  %229 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %226, i32 %228, i32 5)
  store %struct.BF_PartHolder* %229, %struct.BF_PartHolder** %188, align 8
  %230 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 8, i64 1
  %231 = load i32, i32* %230, align 4
  %232 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %229, i32 %231, i32 5)
  store %struct.BF_PartHolder* %232, %struct.BF_PartHolder** %188, align 8
  %233 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 8, i64 2
  %234 = load i32, i32* %233, align 4
  %235 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %232, i32 %234, i32 5)
  store %struct.BF_PartHolder* %235, %struct.BF_PartHolder** %188, align 8
  %236 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 10
  %237 = load i32, i32* %236, align 8
  %238 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %235, i32 %237, i32 4)
  store %struct.BF_PartHolder* %238, %struct.BF_PartHolder** %188, align 8
  %239 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 11
  br label %.loopexit10

.loopexit10:                                      ; preds = %.preheader9, %.preheader8
  %.sink69 = phi i32* [ %225, %.preheader9 ], [ %239, %.preheader8 ]
  %.sink67 = phi %struct.BF_PartHolder* [ %224, %.preheader9 ], [ %238, %.preheader8 ]
  %240 = load i32, i32* %.sink69, align 4
  %241 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %.sink67, i32 %240, i32 3)
  store %struct.BF_PartHolder* %241, %struct.BF_PartHolder** %188, align 8
  %242 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 13
  %243 = load i32, i32* %242, align 4
  %244 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %241, i32 %243, i32 1)
  store %struct.BF_PartHolder* %244, %struct.BF_PartHolder** %188, align 8
  %245 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv53, i32 0, i32 14
  %246 = load i32, i32* %245, align 8
  %247 = tail call fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder* %244, i32 %246, i32 1)
  store %struct.BF_PartHolder* %247, %struct.BF_PartHolder** %188, align 8
  %indvars.iv.next54 = add nuw i64 %indvars.iv53, 1
  %248 = load i32, i32* %49, align 4
  %249 = sext i32 %248 to i64
  %250 = icmp slt i64 %indvars.iv.next54, %249
  br i1 %250, label %.lr.ph28, label %.loopexit6.loopexit71

.loopexit6.loopexit:                              ; preds = %._crit_edge
  br label %.loopexit6

.loopexit6.loopexit71:                            ; preds = %.loopexit10
  br label %.loopexit6

.loopexit6:                                       ; preds = %.loopexit6.loopexit71, %.loopexit6.loopexit, %179
  %251 = load i32, i32* %13, align 4
  %252 = icmp eq i32 %251, 0
  br i1 %252, label %257, label %253

; <label>:253:                                    ; preds = %.loopexit6
  %254 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @headerPH, align 8
  %255 = load i32, i32* @crc, align 4
  %256 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %254, i32 %255, i32 16) #5
  store %struct.BF_PartHolder* %256, %struct.BF_PartHolder** @headerPH, align 8
  br label %257

; <label>:257:                                    ; preds = %.loopexit6, %253
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @encodeMainData(%struct.lame_global_flags* nocapture readonly, [2 x [576 x i32]]* nocapture readonly, %struct.III_side_info_t* nocapture readonly, [2 x %struct.III_scalefac_t]* nocapture readonly) unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 45
  %6 = load i32, i32* %5, align 8
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %.preheader37.lr.ph, label %._crit_edge68

.preheader37.lr.ph:                               ; preds = %4
  %8 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  br label %.preheader37

.preheader37:                                     ; preds = %.preheader37.lr.ph, %._crit_edge71
  %indvars.iv111 = phi i64 [ 0, %.preheader37.lr.ph ], [ %indvars.iv.next112, %._crit_edge71 ]
  %9 = load i32, i32* %8, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %.lr.ph70.preheader, label %._crit_edge71

.lr.ph70.preheader:                               ; preds = %.preheader37
  br label %.lr.ph70

.preheader36:                                     ; preds = %._crit_edge71
  %11 = icmp sgt i32 %21, 0
  br i1 %11, label %.preheader35.lr.ph, label %._crit_edge68

.preheader35.lr.ph:                               ; preds = %.preheader36
  %12 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  br label %.preheader35

.lr.ph70:                                         ; preds = %.lr.ph70.preheader, %.lr.ph70
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %.lr.ph70 ], [ 0, %.lr.ph70.preheader ]
  %13 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @scaleFactorsPH, i64 0, i64 %indvars.iv111, i64 %indvars.iv109
  %14 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %13, align 8
  %15 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %14, i64 0, i32 1
  %16 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %15, align 8
  %17 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %16, i64 0, i32 0
  store i32 0, i32* %17, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %18 = load i32, i32* %8, align 4
  %19 = sext i32 %18 to i64
  %20 = icmp slt i64 %indvars.iv.next110, %19
  br i1 %20, label %.lr.ph70, label %._crit_edge71.loopexit

._crit_edge71.loopexit:                           ; preds = %.lr.ph70
  br label %._crit_edge71

._crit_edge71:                                    ; preds = %._crit_edge71.loopexit, %.preheader37
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %21 = load i32, i32* %5, align 8
  %22 = sext i32 %21 to i64
  %23 = icmp slt i64 %indvars.iv.next112, %22
  br i1 %23, label %.preheader37, label %.preheader36

.preheader35:                                     ; preds = %.preheader35.lr.ph, %._crit_edge66
  %indvars.iv107 = phi i64 [ 0, %.preheader35.lr.ph ], [ %indvars.iv.next108, %._crit_edge66 ]
  %24 = load i32, i32* %12, align 4
  %25 = icmp sgt i32 %24, 0
  br i1 %25, label %.lr.ph65.preheader, label %._crit_edge66

.lr.ph65.preheader:                               ; preds = %.preheader35
  br label %.lr.ph65

.lr.ph65:                                         ; preds = %.lr.ph65.preheader, %.lr.ph65
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %.lr.ph65 ], [ 0, %.lr.ph65.preheader ]
  %26 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @codedDataPH, i64 0, i64 %indvars.iv107, i64 %indvars.iv105
  %27 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %26, align 8
  %28 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %27, i64 0, i32 1
  %29 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %28, align 8
  %30 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %29, i64 0, i32 0
  store i32 0, i32* %30, align 8
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %31 = load i32, i32* %12, align 4
  %32 = sext i32 %31 to i64
  %33 = icmp slt i64 %indvars.iv.next106, %32
  br i1 %33, label %.lr.ph65, label %._crit_edge66.loopexit

._crit_edge66.loopexit:                           ; preds = %.lr.ph65
  br label %._crit_edge66

._crit_edge66:                                    ; preds = %._crit_edge66.loopexit, %.preheader35
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %34 = load i32, i32* %5, align 8
  %35 = sext i32 %34 to i64
  %36 = icmp slt i64 %indvars.iv.next108, %35
  br i1 %36, label %.preheader35, label %._crit_edge68.loopexit

._crit_edge68.loopexit:                           ; preds = %._crit_edge66
  br label %._crit_edge68

._crit_edge68:                                    ; preds = %._crit_edge68.loopexit, %4, %.preheader36
  %37 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 43
  %38 = load i32, i32* %37, align 8
  %39 = icmp eq i32 %38, 1
  %40 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  br i1 %39, label %.preheader25.preheader, label %.preheader33

.preheader25.preheader:                           ; preds = %._crit_edge68
  br label %.preheader25

.preheader33:                                     ; preds = %._crit_edge68
  %41 = load i32, i32* %40, align 4
  %42 = icmp sgt i32 %41, 0
  br i1 %42, label %.lr.ph63.preheader, label %.loopexit27

.lr.ph63.preheader:                               ; preds = %.preheader33
  br label %.lr.ph63

.preheader25:                                     ; preds = %.preheader25.preheader, %._crit_edge
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %._crit_edge ], [ 0, %.preheader25.preheader ]
  %43 = load i32, i32* %40, align 4
  %44 = icmp sgt i32 %43, 0
  br i1 %44, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader25
  %45 = icmp eq i64 %indvars.iv86, 0
  br label %46

; <label>:46:                                     ; preds = %.lr.ph, %.loopexit
  %indvars.iv84 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next85, %.loopexit ]
  %47 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @scaleFactorsPH, i64 0, i64 %indvars.iv86, i64 %indvars.iv84
  %48 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %2, i64 0, i32 4, i64 %indvars.iv86, i32 0, i64 %indvars.iv84, i32 0
  %49 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %2, i64 0, i32 4, i64 %indvars.iv86, i32 0, i64 %indvars.iv84, i32 0, i32 4
  %50 = load i32, i32* %49, align 8
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds [16 x i32], [16 x i32]* @slen1_tab, i64 0, i64 %51
  %53 = load i32, i32* %52, align 4
  %54 = getelementptr inbounds [16 x i32], [16 x i32]* @slen2_tab, i64 0, i64 %51
  %55 = load i32, i32* %54, align 4
  %56 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %1, i64 %indvars.iv86, i64 %indvars.iv84, i64 0
  %57 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %2, i64 0, i32 4, i64 %indvars.iv86, i32 0, i64 %indvars.iv84, i32 0, i32 6
  %58 = load i32, i32* %57, align 8
  %59 = icmp eq i32 %58, 2
  br i1 %59, label %.preheader113.preheader, label %170

.preheader113.preheader:                          ; preds = %46
  br label %.preheader113

.preheader113:                                    ; preds = %.preheader113.preheader
  %60 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %47, align 8
  %61 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 0, i64 0
  %62 = load i32, i32* %61, align 4
  %63 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %60, i32 %62, i32 %53) #5
  store %struct.BF_PartHolder* %63, %struct.BF_PartHolder** %47, align 8
  %64 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 0, i64 1
  %65 = load i32, i32* %64, align 4
  %66 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %63, i32 %65, i32 %53) #5
  store %struct.BF_PartHolder* %66, %struct.BF_PartHolder** %47, align 8
  %67 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 0, i64 2
  %68 = load i32, i32* %67, align 4
  %69 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %66, i32 %68, i32 %53) #5
  store %struct.BF_PartHolder* %69, %struct.BF_PartHolder** %47, align 8
  %70 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 1, i64 0
  %71 = load i32, i32* %70, align 4
  %72 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %69, i32 %71, i32 %53) #5
  store %struct.BF_PartHolder* %72, %struct.BF_PartHolder** %47, align 8
  %73 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 1, i64 1
  %74 = load i32, i32* %73, align 4
  %75 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %72, i32 %74, i32 %53) #5
  store %struct.BF_PartHolder* %75, %struct.BF_PartHolder** %47, align 8
  %76 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 1, i64 2
  %77 = load i32, i32* %76, align 4
  %78 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %75, i32 %77, i32 %53) #5
  store %struct.BF_PartHolder* %78, %struct.BF_PartHolder** %47, align 8
  %79 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 2, i64 0
  %80 = load i32, i32* %79, align 4
  %81 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %78, i32 %80, i32 %53) #5
  store %struct.BF_PartHolder* %81, %struct.BF_PartHolder** %47, align 8
  %82 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 2, i64 1
  %83 = load i32, i32* %82, align 4
  %84 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %81, i32 %83, i32 %53) #5
  store %struct.BF_PartHolder* %84, %struct.BF_PartHolder** %47, align 8
  %85 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 2, i64 2
  %86 = load i32, i32* %85, align 4
  %87 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %84, i32 %86, i32 %53) #5
  store %struct.BF_PartHolder* %87, %struct.BF_PartHolder** %47, align 8
  %88 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 3, i64 0
  %89 = load i32, i32* %88, align 4
  %90 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %87, i32 %89, i32 %53) #5
  store %struct.BF_PartHolder* %90, %struct.BF_PartHolder** %47, align 8
  %91 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 3, i64 1
  %92 = load i32, i32* %91, align 4
  %93 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %90, i32 %92, i32 %53) #5
  store %struct.BF_PartHolder* %93, %struct.BF_PartHolder** %47, align 8
  %94 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 3, i64 2
  %95 = load i32, i32* %94, align 4
  %96 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %93, i32 %95, i32 %53) #5
  store %struct.BF_PartHolder* %96, %struct.BF_PartHolder** %47, align 8
  %97 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 4, i64 0
  %98 = load i32, i32* %97, align 4
  %99 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %96, i32 %98, i32 %53) #5
  store %struct.BF_PartHolder* %99, %struct.BF_PartHolder** %47, align 8
  %100 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 4, i64 1
  %101 = load i32, i32* %100, align 4
  %102 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %99, i32 %101, i32 %53) #5
  store %struct.BF_PartHolder* %102, %struct.BF_PartHolder** %47, align 8
  %103 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 4, i64 2
  %104 = load i32, i32* %103, align 4
  %105 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %102, i32 %104, i32 %53) #5
  store %struct.BF_PartHolder* %105, %struct.BF_PartHolder** %47, align 8
  %106 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 5, i64 0
  %107 = load i32, i32* %106, align 4
  %108 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %105, i32 %107, i32 %53) #5
  store %struct.BF_PartHolder* %108, %struct.BF_PartHolder** %47, align 8
  %109 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 5, i64 1
  %110 = load i32, i32* %109, align 4
  %111 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %108, i32 %110, i32 %53) #5
  store %struct.BF_PartHolder* %111, %struct.BF_PartHolder** %47, align 8
  %112 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 5, i64 2
  %113 = load i32, i32* %112, align 4
  %114 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %111, i32 %113, i32 %53) #5
  store %struct.BF_PartHolder* %114, %struct.BF_PartHolder** %47, align 8
  br label %.preheader

.preheader:                                       ; preds = %.preheader113
  %115 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %47, align 8
  %116 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 6, i64 0
  %117 = load i32, i32* %116, align 4
  %118 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %115, i32 %117, i32 %55) #5
  store %struct.BF_PartHolder* %118, %struct.BF_PartHolder** %47, align 8
  %119 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 6, i64 1
  %120 = load i32, i32* %119, align 4
  %121 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %118, i32 %120, i32 %55) #5
  store %struct.BF_PartHolder* %121, %struct.BF_PartHolder** %47, align 8
  %122 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 6, i64 2
  %123 = load i32, i32* %122, align 4
  %124 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %121, i32 %123, i32 %55) #5
  store %struct.BF_PartHolder* %124, %struct.BF_PartHolder** %47, align 8
  %125 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 7, i64 0
  %126 = load i32, i32* %125, align 4
  %127 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %124, i32 %126, i32 %55) #5
  store %struct.BF_PartHolder* %127, %struct.BF_PartHolder** %47, align 8
  %128 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 7, i64 1
  %129 = load i32, i32* %128, align 4
  %130 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %127, i32 %129, i32 %55) #5
  store %struct.BF_PartHolder* %130, %struct.BF_PartHolder** %47, align 8
  %131 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 7, i64 2
  %132 = load i32, i32* %131, align 4
  %133 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %130, i32 %132, i32 %55) #5
  store %struct.BF_PartHolder* %133, %struct.BF_PartHolder** %47, align 8
  %134 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 8, i64 0
  %135 = load i32, i32* %134, align 4
  %136 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %133, i32 %135, i32 %55) #5
  store %struct.BF_PartHolder* %136, %struct.BF_PartHolder** %47, align 8
  %137 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 8, i64 1
  %138 = load i32, i32* %137, align 4
  %139 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %136, i32 %138, i32 %55) #5
  store %struct.BF_PartHolder* %139, %struct.BF_PartHolder** %47, align 8
  %140 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 8, i64 2
  %141 = load i32, i32* %140, align 4
  %142 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %139, i32 %141, i32 %55) #5
  store %struct.BF_PartHolder* %142, %struct.BF_PartHolder** %47, align 8
  %143 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 9, i64 0
  %144 = load i32, i32* %143, align 4
  %145 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %142, i32 %144, i32 %55) #5
  store %struct.BF_PartHolder* %145, %struct.BF_PartHolder** %47, align 8
  %146 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 9, i64 1
  %147 = load i32, i32* %146, align 4
  %148 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %145, i32 %147, i32 %55) #5
  store %struct.BF_PartHolder* %148, %struct.BF_PartHolder** %47, align 8
  %149 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 9, i64 2
  %150 = load i32, i32* %149, align 4
  %151 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %148, i32 %150, i32 %55) #5
  store %struct.BF_PartHolder* %151, %struct.BF_PartHolder** %47, align 8
  %152 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 10, i64 0
  %153 = load i32, i32* %152, align 4
  %154 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %151, i32 %153, i32 %55) #5
  store %struct.BF_PartHolder* %154, %struct.BF_PartHolder** %47, align 8
  %155 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 10, i64 1
  %156 = load i32, i32* %155, align 4
  %157 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %154, i32 %156, i32 %55) #5
  store %struct.BF_PartHolder* %157, %struct.BF_PartHolder** %47, align 8
  %158 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 10, i64 2
  %159 = load i32, i32* %158, align 4
  %160 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %157, i32 %159, i32 %55) #5
  store %struct.BF_PartHolder* %160, %struct.BF_PartHolder** %47, align 8
  %161 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 11, i64 0
  %162 = load i32, i32* %161, align 4
  %163 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %160, i32 %162, i32 %55) #5
  store %struct.BF_PartHolder* %163, %struct.BF_PartHolder** %47, align 8
  %164 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 11, i64 1
  %165 = load i32, i32* %164, align 4
  %166 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %163, i32 %165, i32 %55) #5
  store %struct.BF_PartHolder* %166, %struct.BF_PartHolder** %47, align 8
  %167 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 1, i64 11, i64 2
  %168 = load i32, i32* %167, align 4
  %169 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %166, i32 %168, i32 %55) #5
  store %struct.BF_PartHolder* %169, %struct.BF_PartHolder** %47, align 8
  br label %.loopexit

; <label>:170:                                    ; preds = %46
  br i1 %45, label %.preheader24, label %171

; <label>:171:                                    ; preds = %170
  %172 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %2, i64 0, i32 3, i64 %indvars.iv84, i64 0
  %173 = load i32, i32* %172, align 4
  %174 = icmp eq i32 %173, 0
  br i1 %174, label %.preheader24, label %.thread

.preheader24:                                     ; preds = %170, %171
  %175 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %47, align 8
  %176 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 0
  %177 = load i32, i32* %176, align 4
  %178 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %175, i32 %177, i32 %53) #5
  store %struct.BF_PartHolder* %178, %struct.BF_PartHolder** %47, align 8
  %179 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 1
  %180 = load i32, i32* %179, align 4
  %181 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %178, i32 %180, i32 %53) #5
  store %struct.BF_PartHolder* %181, %struct.BF_PartHolder** %47, align 8
  %182 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 2
  %183 = load i32, i32* %182, align 4
  %184 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %181, i32 %183, i32 %53) #5
  store %struct.BF_PartHolder* %184, %struct.BF_PartHolder** %47, align 8
  %185 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 3
  %186 = load i32, i32* %185, align 4
  %187 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %184, i32 %186, i32 %53) #5
  store %struct.BF_PartHolder* %187, %struct.BF_PartHolder** %47, align 8
  %188 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 4
  %189 = load i32, i32* %188, align 4
  %190 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %187, i32 %189, i32 %53) #5
  store %struct.BF_PartHolder* %190, %struct.BF_PartHolder** %47, align 8
  %191 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 5
  %192 = load i32, i32* %191, align 4
  %193 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %190, i32 %192, i32 %53) #5
  store %struct.BF_PartHolder* %193, %struct.BF_PartHolder** %47, align 8
  br i1 %45, label %.preheader23, label %.thread

.thread:                                          ; preds = %171, %.preheader24
  %194 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %2, i64 0, i32 3, i64 %indvars.iv84, i64 1
  %195 = load i32, i32* %194, align 4
  %196 = icmp eq i32 %195, 0
  br i1 %196, label %.preheader23, label %.thread15

.preheader23:                                     ; preds = %.preheader24, %.thread
  %197 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %47, align 8
  %198 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 6
  %199 = load i32, i32* %198, align 4
  %200 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %197, i32 %199, i32 %53) #5
  store %struct.BF_PartHolder* %200, %struct.BF_PartHolder** %47, align 8
  %201 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 7
  %202 = load i32, i32* %201, align 4
  %203 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %200, i32 %202, i32 %53) #5
  store %struct.BF_PartHolder* %203, %struct.BF_PartHolder** %47, align 8
  %204 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 8
  %205 = load i32, i32* %204, align 4
  %206 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %203, i32 %205, i32 %53) #5
  store %struct.BF_PartHolder* %206, %struct.BF_PartHolder** %47, align 8
  %207 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 9
  %208 = load i32, i32* %207, align 4
  %209 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %206, i32 %208, i32 %53) #5
  store %struct.BF_PartHolder* %209, %struct.BF_PartHolder** %47, align 8
  %210 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 10
  %211 = load i32, i32* %210, align 4
  %212 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %209, i32 %211, i32 %53) #5
  store %struct.BF_PartHolder* %212, %struct.BF_PartHolder** %47, align 8
  br i1 %45, label %.preheader22, label %.thread15

.thread15:                                        ; preds = %.thread, %.preheader23
  %213 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %2, i64 0, i32 3, i64 %indvars.iv84, i64 2
  %214 = load i32, i32* %213, align 4
  %215 = icmp eq i32 %214, 0
  br i1 %215, label %.preheader22, label %.thread16

.preheader22:                                     ; preds = %.preheader23, %.thread15
  %216 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %47, align 8
  %217 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 11
  %218 = load i32, i32* %217, align 4
  %219 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %216, i32 %218, i32 %55) #5
  store %struct.BF_PartHolder* %219, %struct.BF_PartHolder** %47, align 8
  %220 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 12
  %221 = load i32, i32* %220, align 4
  %222 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %219, i32 %221, i32 %55) #5
  store %struct.BF_PartHolder* %222, %struct.BF_PartHolder** %47, align 8
  %223 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 13
  %224 = load i32, i32* %223, align 4
  %225 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %222, i32 %224, i32 %55) #5
  store %struct.BF_PartHolder* %225, %struct.BF_PartHolder** %47, align 8
  %226 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 14
  %227 = load i32, i32* %226, align 4
  %228 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %225, i32 %227, i32 %55) #5
  store %struct.BF_PartHolder* %228, %struct.BF_PartHolder** %47, align 8
  %229 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 15
  %230 = load i32, i32* %229, align 4
  %231 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %228, i32 %230, i32 %55) #5
  store %struct.BF_PartHolder* %231, %struct.BF_PartHolder** %47, align 8
  br i1 %45, label %.preheader20, label %.thread16

.thread16:                                        ; preds = %.thread15, %.preheader22
  %232 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %2, i64 0, i32 3, i64 %indvars.iv84, i64 3
  %233 = load i32, i32* %232, align 4
  %234 = icmp eq i32 %233, 0
  br i1 %234, label %.preheader20, label %.loopexit

.preheader20:                                     ; preds = %.preheader22, %.thread16
  %235 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %47, align 8
  %236 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 16
  %237 = load i32, i32* %236, align 4
  %238 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %235, i32 %237, i32 %55) #5
  store %struct.BF_PartHolder* %238, %struct.BF_PartHolder** %47, align 8
  %239 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 17
  %240 = load i32, i32* %239, align 4
  %241 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %238, i32 %240, i32 %55) #5
  store %struct.BF_PartHolder* %241, %struct.BF_PartHolder** %47, align 8
  %242 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 18
  %243 = load i32, i32* %242, align 4
  %244 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %241, i32 %243, i32 %55) #5
  store %struct.BF_PartHolder* %244, %struct.BF_PartHolder** %47, align 8
  %245 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 19
  %246 = load i32, i32* %245, align 4
  %247 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %244, i32 %246, i32 %55) #5
  store %struct.BF_PartHolder* %247, %struct.BF_PartHolder** %47, align 8
  %248 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 %indvars.iv86, i64 %indvars.iv84, i32 0, i64 20
  %249 = load i32, i32* %248, align 4
  %250 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %247, i32 %249, i32 %55) #5
  store %struct.BF_PartHolder* %250, %struct.BF_PartHolder** %47, align 8
  br label %.loopexit

.loopexit:                                        ; preds = %.preheader, %.preheader20, %.thread16
  %251 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @codedDataPH, i64 0, i64 %indvars.iv86, i64 %indvars.iv84
  tail call fastcc void @Huffmancodebits(%struct.BF_PartHolder** %251, i32* %56, %struct.gr_info* %48)
  %indvars.iv.next85 = add nuw i64 %indvars.iv84, 1
  %252 = load i32, i32* %40, align 4
  %253 = sext i32 %252 to i64
  %254 = icmp slt i64 %indvars.iv.next85, %253
  br i1 %254, label %46, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader25
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next87, 2
  br i1 %exitcond88, label %.loopexit27.loopexit, label %.preheader25

.lr.ph63:                                         ; preds = %.lr.ph63.preheader, %.loopexit30
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %.loopexit30 ], [ 0, %.lr.ph63.preheader ]
  %255 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @scaleFactorsPH, i64 0, i64 0, i64 %indvars.iv103
  %256 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %2, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv103, i32 0
  %257 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %1, i64 0, i64 %indvars.iv103, i64 0
  %258 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %2, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv103, i32 0, i32 19
  %259 = load i32*, i32** %258, align 8
  %260 = icmp eq i32* %259, null
  br i1 %260, label %261, label %262

; <label>:261:                                    ; preds = %.lr.ph63
  tail call void @__assert_fail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 236, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @__PRETTY_FUNCTION__.encodeMainData, i64 0, i64 0)) #6
  unreachable

; <label>:262:                                    ; preds = %.lr.ph63
  %263 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %2, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv103, i32 0, i32 6
  %264 = load i32, i32* %263, align 8
  %265 = icmp eq i32 %264, 2
  br i1 %265, label %.preheader29.preheader, label %.preheader31

.preheader29.preheader:                           ; preds = %262
  br label %.preheader29

.preheader29:                                     ; preds = %.preheader29.preheader, %._crit_edge58
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %._crit_edge58 ], [ 0, %.preheader29.preheader ]
  %.660 = phi i32 [ %.7.lcssa, %._crit_edge58 ], [ 0, %.preheader29.preheader ]
  %266 = load i32*, i32** %258, align 8
  %267 = getelementptr inbounds i32, i32* %266, i64 %indvars.iv100
  %268 = load i32, i32* %267, align 4
  %269 = udiv i32 %268, 3
  %270 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %2, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv103, i32 0, i32 20, i64 %indvars.iv100
  %271 = load i32, i32* %270, align 4
  %272 = icmp ugt i32 %268, 2
  br i1 %272, label %.preheader28.preheader, label %._crit_edge58

.preheader28.preheader:                           ; preds = %.preheader29
  %273 = sext i32 %.660 to i64
  br label %274

; <label>:274:                                    ; preds = %274, %.preheader28.preheader
  %indvars.iv98 = phi i64 [ %273, %.preheader28.preheader ], [ %indvars.iv.next99, %274 ]
  %.01056 = phi i32 [ 0, %.preheader28.preheader ], [ %285, %274 ]
  %275 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %255, align 8
  %276 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 0, i64 %indvars.iv103, i32 1, i64 %indvars.iv98, i64 0
  %277 = load i32, i32* %276, align 4
  %278 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %275, i32 %277, i32 %271) #5
  store %struct.BF_PartHolder* %278, %struct.BF_PartHolder** %255, align 8
  %279 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 0, i64 %indvars.iv103, i32 1, i64 %indvars.iv98, i64 1
  %280 = load i32, i32* %279, align 4
  %281 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %278, i32 %280, i32 %271) #5
  store %struct.BF_PartHolder* %281, %struct.BF_PartHolder** %255, align 8
  %282 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 0, i64 %indvars.iv103, i32 1, i64 %indvars.iv98, i64 2
  %283 = load i32, i32* %282, align 4
  %284 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %281, i32 %283, i32 %271) #5
  store %struct.BF_PartHolder* %284, %struct.BF_PartHolder** %255, align 8
  %285 = add nuw nsw i32 %.01056, 1
  %indvars.iv.next99 = add nsw i64 %indvars.iv98, 1
  %286 = icmp slt i32 %285, %269
  br i1 %286, label %274, label %._crit_edge58.loopexit

._crit_edge58.loopexit:                           ; preds = %274
  %287 = trunc i64 %indvars.iv.next99 to i32
  br label %._crit_edge58

._crit_edge58:                                    ; preds = %._crit_edge58.loopexit, %.preheader29
  %.7.lcssa = phi i32 [ %.660, %.preheader29 ], [ %287, %._crit_edge58.loopexit ]
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next101, 4
  br i1 %exitcond102, label %.loopexit30.loopexit, label %.preheader29

.preheader31:                                     ; preds = %262
  %288 = load i32*, i32** %258, align 8
  %289 = load i32, i32* %288, align 4
  %290 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %2, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv103, i32 0, i32 20, i64 0
  %291 = load i32, i32* %290, align 4
  %292 = icmp sgt i32 %289, 0
  br i1 %292, label %.lr.ph51.preheader, label %._crit_edge52

.lr.ph51.preheader:                               ; preds = %.preheader31
  br label %.lr.ph51

.lr.ph51:                                         ; preds = %.lr.ph51.preheader, %.lr.ph51
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %.lr.ph51 ], [ 0, %.lr.ph51.preheader ]
  %.11148 = phi i32 [ %297, %.lr.ph51 ], [ 0, %.lr.ph51.preheader ]
  %293 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %255, align 8
  %294 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 0, i64 %indvars.iv103, i32 0, i64 %indvars.iv89
  %295 = load i32, i32* %294, align 4
  %296 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %293, i32 %295, i32 %291) #5
  store %struct.BF_PartHolder* %296, %struct.BF_PartHolder** %255, align 8
  %297 = add nuw nsw i32 %.11148, 1
  %indvars.iv.next90 = add nsw i64 %indvars.iv89, 1
  %exitcond91 = icmp eq i32 %297, %289
  br i1 %exitcond91, label %._crit_edge52.loopexit, label %.lr.ph51

._crit_edge52.loopexit:                           ; preds = %.lr.ph51
  br label %._crit_edge52

._crit_edge52:                                    ; preds = %._crit_edge52.loopexit, %.preheader31
  %.9.lcssa = phi i32 [ 0, %.preheader31 ], [ %289, %._crit_edge52.loopexit ]
  %298 = load i32*, i32** %258, align 8
  %299 = getelementptr inbounds i32, i32* %298, i64 1
  %300 = load i32, i32* %299, align 4
  %301 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %2, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv103, i32 0, i32 20, i64 1
  %302 = load i32, i32* %301, align 4
  %303 = icmp sgt i32 %300, 0
  br i1 %303, label %.lr.ph51.preheader.1, label %._crit_edge52.1

.loopexit30.loopexit:                             ; preds = %._crit_edge58
  br label %.loopexit30

.loopexit30.loopexit118:                          ; preds = %.lr.ph51.3
  br label %.loopexit30

.loopexit30:                                      ; preds = %.loopexit30.loopexit118, %.loopexit30.loopexit, %._crit_edge52.2
  %304 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* @codedDataPH, i64 0, i64 0, i64 %indvars.iv103
  tail call fastcc void @Huffmancodebits(%struct.BF_PartHolder** %304, i32* %257, %struct.gr_info* %256)
  %indvars.iv.next104 = add nuw i64 %indvars.iv103, 1
  %305 = load i32, i32* %40, align 4
  %306 = sext i32 %305 to i64
  %307 = icmp slt i64 %indvars.iv.next104, %306
  br i1 %307, label %.lr.ph63, label %.loopexit27.loopexit119

.loopexit27.loopexit:                             ; preds = %._crit_edge
  br label %.loopexit27

.loopexit27.loopexit119:                          ; preds = %.loopexit30
  br label %.loopexit27

.loopexit27:                                      ; preds = %.loopexit27.loopexit119, %.loopexit27.loopexit, %.preheader33
  ret void

.lr.ph51.preheader.1:                             ; preds = %._crit_edge52
  %308 = sext i32 %.9.lcssa to i64
  br label %.lr.ph51.1

.lr.ph51.1:                                       ; preds = %.lr.ph51.1, %.lr.ph51.preheader.1
  %indvars.iv89.1 = phi i64 [ %308, %.lr.ph51.preheader.1 ], [ %indvars.iv.next90.1, %.lr.ph51.1 ]
  %.11148.1 = phi i32 [ 0, %.lr.ph51.preheader.1 ], [ %313, %.lr.ph51.1 ]
  %309 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %255, align 8
  %310 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 0, i64 %indvars.iv103, i32 0, i64 %indvars.iv89.1
  %311 = load i32, i32* %310, align 4
  %312 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %309, i32 %311, i32 %302) #5
  store %struct.BF_PartHolder* %312, %struct.BF_PartHolder** %255, align 8
  %313 = add nuw nsw i32 %.11148.1, 1
  %indvars.iv.next90.1 = add nsw i64 %indvars.iv89.1, 1
  %exitcond91.1 = icmp eq i32 %313, %300
  br i1 %exitcond91.1, label %._crit_edge52.loopexit.1, label %.lr.ph51.1

._crit_edge52.loopexit.1:                         ; preds = %.lr.ph51.1
  %314 = add i32 %.9.lcssa, %300
  br label %._crit_edge52.1

._crit_edge52.1:                                  ; preds = %._crit_edge52.loopexit.1, %._crit_edge52
  %.9.lcssa.1 = phi i32 [ %.9.lcssa, %._crit_edge52 ], [ %314, %._crit_edge52.loopexit.1 ]
  %315 = load i32*, i32** %258, align 8
  %316 = getelementptr inbounds i32, i32* %315, i64 2
  %317 = load i32, i32* %316, align 4
  %318 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %2, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv103, i32 0, i32 20, i64 2
  %319 = load i32, i32* %318, align 4
  %320 = icmp sgt i32 %317, 0
  br i1 %320, label %.lr.ph51.preheader.2, label %._crit_edge52.2

.lr.ph51.preheader.2:                             ; preds = %._crit_edge52.1
  %321 = sext i32 %.9.lcssa.1 to i64
  br label %.lr.ph51.2

.lr.ph51.2:                                       ; preds = %.lr.ph51.2, %.lr.ph51.preheader.2
  %indvars.iv89.2 = phi i64 [ %321, %.lr.ph51.preheader.2 ], [ %indvars.iv.next90.2, %.lr.ph51.2 ]
  %.11148.2 = phi i32 [ 0, %.lr.ph51.preheader.2 ], [ %326, %.lr.ph51.2 ]
  %322 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %255, align 8
  %323 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 0, i64 %indvars.iv103, i32 0, i64 %indvars.iv89.2
  %324 = load i32, i32* %323, align 4
  %325 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %322, i32 %324, i32 %319) #5
  store %struct.BF_PartHolder* %325, %struct.BF_PartHolder** %255, align 8
  %326 = add nuw nsw i32 %.11148.2, 1
  %indvars.iv.next90.2 = add nsw i64 %indvars.iv89.2, 1
  %exitcond91.2 = icmp eq i32 %326, %317
  br i1 %exitcond91.2, label %._crit_edge52.loopexit.2, label %.lr.ph51.2

._crit_edge52.loopexit.2:                         ; preds = %.lr.ph51.2
  %327 = add i32 %.9.lcssa.1, %317
  br label %._crit_edge52.2

._crit_edge52.2:                                  ; preds = %._crit_edge52.loopexit.2, %._crit_edge52.1
  %.9.lcssa.2 = phi i32 [ %.9.lcssa.1, %._crit_edge52.1 ], [ %327, %._crit_edge52.loopexit.2 ]
  %328 = load i32*, i32** %258, align 8
  %329 = getelementptr inbounds i32, i32* %328, i64 3
  %330 = load i32, i32* %329, align 4
  %331 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %2, i64 0, i32 4, i64 0, i32 0, i64 %indvars.iv103, i32 0, i32 20, i64 3
  %332 = load i32, i32* %331, align 4
  %333 = icmp sgt i32 %330, 0
  br i1 %333, label %.lr.ph51.preheader.3, label %.loopexit30

.lr.ph51.preheader.3:                             ; preds = %._crit_edge52.2
  %334 = sext i32 %.9.lcssa.2 to i64
  br label %.lr.ph51.3

.lr.ph51.3:                                       ; preds = %.lr.ph51.3, %.lr.ph51.preheader.3
  %indvars.iv89.3 = phi i64 [ %334, %.lr.ph51.preheader.3 ], [ %indvars.iv.next90.3, %.lr.ph51.3 ]
  %.11148.3 = phi i32 [ 0, %.lr.ph51.preheader.3 ], [ %339, %.lr.ph51.3 ]
  %335 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %255, align 8
  %336 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %3, i64 0, i64 %indvars.iv103, i32 0, i64 %indvars.iv89.3
  %337 = load i32, i32* %336, align 4
  %338 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %335, i32 %337, i32 %332) #5
  store %struct.BF_PartHolder* %338, %struct.BF_PartHolder** %255, align 8
  %339 = add nuw nsw i32 %.11148.3, 1
  %indvars.iv.next90.3 = add nsw i64 %indvars.iv89.3, 1
  %exitcond91.3 = icmp eq i32 %339, %330
  br i1 %exitcond91.3, label %.loopexit30.loopexit118, label %.lr.ph51.3
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @drain_into_ancillary_data(i32) unnamed_addr #0 {
  %2 = sdiv i32 %0, 32
  %3 = srem i32 %0, 32
  %4 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @userFrameDataPH, align 8
  %5 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %4, i64 0, i32 1
  %6 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %5, align 8
  %7 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %6, i64 0, i32 0
  store i32 0, i32* %7, align 8
  %8 = icmp sgt i32 %0, 31
  br i1 %8, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %1
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.01 = phi i32 [ %11, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %9 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @userFrameDataPH, align 8
  %10 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %9, i32 0, i32 32) #5
  store %struct.BF_PartHolder* %10, %struct.BF_PartHolder** @userFrameDataPH, align 8
  %11 = add nuw nsw i32 %.01, 1
  %12 = icmp slt i32 %11, %2
  br i1 %12, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  %13 = icmp eq i32 %3, 0
  br i1 %13, label %17, label %14

; <label>:14:                                     ; preds = %._crit_edge
  %15 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** @userFrameDataPH, align 8
  %16 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %15, i32 0, i32 %3) #5
  store %struct.BF_PartHolder* %16, %struct.BF_PartHolder** @userFrameDataPH, align 8
  br label %17

; <label>:17:                                     ; preds = %._crit_edge, %14
  ret void
}

declare void @BF_BitstreamFrame(%struct.BF_FrameData*, %struct.BF_FrameResults*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @III_FlushBitstream() local_unnamed_addr #0 {
  %1 = load i32, i32* @PartHoldersInitialized, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %6, label %3

; <label>:3:                                      ; preds = %0
  %4 = load %struct.BF_FrameData*, %struct.BF_FrameData** @frameData, align 8
  %5 = load %struct.BF_FrameResults*, %struct.BF_FrameResults** @frameResults, align 8
  tail call void @BF_FlushBitstream(%struct.BF_FrameData* %4, %struct.BF_FrameResults* %5) #5
  br label %6

; <label>:6:                                      ; preds = %0, %3
  ret void
}

declare void @BF_FlushBitstream(%struct.BF_FrameData*, %struct.BF_FrameResults*) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @abs_and_sign(i32* nocapture) local_unnamed_addr #4 {
  %2 = load i32, i32* %0, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %6, label %4

; <label>:4:                                      ; preds = %1
  %5 = sub nsw i32 0, %2
  store i32 %5, i32* %0, align 4
  br label %6

; <label>:6:                                      ; preds = %1, %4
  %.0 = phi i32 [ 1, %4 ], [ 0, %1 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @L3_huffman_coder_count1(%struct.BF_PartHolder** nocapture, %struct.huffcodetab* nocapture readonly, i32, i32, i32, i32) local_unnamed_addr #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  store i32 %4, i32* %9, align 4
  store i32 %5, i32* %10, align 4
  %11 = call i32 @abs_and_sign(i32* nonnull %7)
  %12 = call i32 @abs_and_sign(i32* nonnull %8)
  %13 = call i32 @abs_and_sign(i32* nonnull %9)
  %14 = call i32 @abs_and_sign(i32* nonnull %10)
  %15 = load i32, i32* %7, align 4
  %16 = shl i32 %15, 3
  %17 = load i32, i32* %8, align 4
  %18 = shl i32 %17, 2
  %19 = add nsw i32 %18, %16
  %20 = load i32, i32* %9, align 4
  %21 = shl i32 %20, 1
  %22 = add nsw i32 %19, %21
  %23 = load i32, i32* %10, align 4
  %24 = add nsw i32 %22, %23
  %25 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %1, i64 0, i32 2
  %26 = load i64*, i64** %25, align 8
  %27 = zext i32 %24 to i64
  %28 = getelementptr inbounds i64, i64* %26, i64 %27
  %29 = load i64, i64* %28, align 8
  %30 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %1, i64 0, i32 3
  %31 = load i8*, i8** %30, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 %27
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i32
  %35 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %0, align 8
  %36 = trunc i64 %29 to i32
  %37 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %35, i32 %36, i32 %34) #5
  store %struct.BF_PartHolder* %37, %struct.BF_PartHolder** %0, align 8
  %38 = load i32, i32* %7, align 4
  %39 = icmp eq i32 %38, 0
  %. = select i1 %39, i32 0, i32 %11
  %not. = xor i1 %39, true
  %.5 = zext i1 %not. to i32
  %40 = load i32, i32* %8, align 4
  %41 = icmp eq i32 %40, 0
  %42 = shl i32 %., 1
  %43 = add i32 %42, %12
  %44 = select i1 %39, i32 1, i32 2
  %.. = select i1 %41, i32 %., i32 %43
  %.5. = select i1 %41, i32 %.5, i32 %44
  %45 = load i32, i32* %9, align 4
  %46 = icmp eq i32 %45, 0
  %47 = shl i32 %.., 1
  %48 = add i32 %47, %13
  %.23 = select i1 %46, i32 %.., i32 %48
  %not.6 = xor i1 %46, true
  %49 = zext i1 %not.6 to i32
  %.2 = add nuw nsw i32 %49, %.5.
  %50 = load i32, i32* %10, align 4
  %51 = icmp eq i32 %50, 0
  %52 = shl i32 %.23, 1
  %53 = add i32 %52, %14
  %.23. = select i1 %51, i32 %.23, i32 %53
  %not.7 = xor i1 %51, true
  %54 = zext i1 %not.7 to i32
  %.2. = add nuw nsw i32 %.2, %54
  %55 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %0, align 8
  %56 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %55, i32 %.23., i32 %.2.) #5
  store %struct.BF_PartHolder* %56, %struct.BF_PartHolder** %0, align 8
  %57 = add nuw nsw i32 %.2., %34
  ret i32 %57
}

declare %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder*, i32, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define i32 @HuffmanCode(i32, i32, i32, i32* nocapture, i32* nocapture, i32* nocapture, i32* nocapture) local_unnamed_addr #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %1, i32* %8, align 4
  store i32 %2, i32* %9, align 4
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  store i32 0, i32* %3, align 4
  store i32 0, i32* %4, align 4
  %10 = icmp eq i32 %0, 0
  br i1 %10, label %133, label %11

; <label>:11:                                     ; preds = %7
  %12 = call i32 @abs_and_sign(i32* nonnull %8)
  %13 = call i32 @abs_and_sign(i32* nonnull %9)
  %14 = sext i32 %0 to i64
  %15 = icmp sgt i32 %0, 15
  br i1 %15, label %16, label %88

; <label>:16:                                     ; preds = %11
  %17 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %14, i32 0
  %18 = load i32, i32* %17, align 8
  %19 = load i32, i32* %8, align 4
  %20 = icmp sgt i32 %19, 14
  br i1 %20, label %21, label %28

; <label>:21:                                     ; preds = %16
  %22 = add nsw i32 %19, -15
  %23 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %14, i32 1
  %24 = load i32, i32* %23, align 4
  %25 = icmp ugt i32 %22, %24
  br i1 %25, label %26, label %27

; <label>:26:                                     ; preds = %21
  tail call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 797, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @__PRETTY_FUNCTION__.HuffmanCode, i64 0, i64 0)) #6
  unreachable

; <label>:27:                                     ; preds = %21
  store i32 15, i32* %8, align 4
  br label %28

; <label>:28:                                     ; preds = %27, %16
  %.02 = phi i32 [ %22, %27 ], [ 0, %16 ]
  %29 = load i32, i32* %9, align 4
  %30 = icmp sgt i32 %29, 14
  br i1 %30, label %31, label %38

; <label>:31:                                     ; preds = %28
  %32 = add nsw i32 %29, -15
  %33 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %14, i32 1
  %34 = load i32, i32* %33, align 4
  %35 = icmp ugt i32 %32, %34
  br i1 %35, label %36, label %37

; <label>:36:                                     ; preds = %31
  tail call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 803, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @__PRETTY_FUNCTION__.HuffmanCode, i64 0, i64 0)) #6
  unreachable

; <label>:37:                                     ; preds = %31
  store i32 15, i32* %9, align 4
  br label %38

; <label>:38:                                     ; preds = %37, %28
  %.01 = phi i32 [ %32, %37 ], [ 0, %28 ]
  %39 = load i32, i32* %8, align 4
  %40 = shl i32 %39, 4
  %41 = load i32, i32* %9, align 4
  %42 = add nsw i32 %40, %41
  %43 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %14, i32 2
  %44 = load i64*, i64** %43, align 8
  %45 = zext i32 %42 to i64
  %46 = getelementptr inbounds i64, i64* %44, i64 %45
  %47 = load i64, i64* %46, align 8
  %48 = trunc i64 %47 to i32
  store i32 %48, i32* %3, align 4
  %49 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %14, i32 3
  %50 = load i8*, i8** %49, align 8
  %51 = getelementptr inbounds i8, i8* %50, i64 %45
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i32
  store i32 %53, i32* %5, align 4
  %54 = load i32, i32* %8, align 4
  %55 = icmp sgt i32 %54, 14
  br i1 %55, label %56, label %61

; <label>:56:                                     ; preds = %38
  %57 = load i32, i32* %4, align 4
  %58 = or i32 %57, %.02
  store i32 %58, i32* %4, align 4
  %59 = load i32, i32* %6, align 4
  %60 = add i32 %59, %18
  store i32 %60, i32* %6, align 4
  %.pr = load i32, i32* %8, align 4
  br label %61

; <label>:61:                                     ; preds = %56, %38
  %62 = phi i32 [ %.pr, %56 ], [ %54, %38 ]
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %70, label %64

; <label>:64:                                     ; preds = %61
  %65 = load i32, i32* %4, align 4
  %66 = shl i32 %65, 1
  %67 = or i32 %66, %12
  store i32 %67, i32* %4, align 4
  %68 = load i32, i32* %6, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %6, align 4
  br label %70

; <label>:70:                                     ; preds = %61, %64
  %71 = load i32, i32* %9, align 4
  %72 = icmp sgt i32 %71, 14
  br i1 %72, label %73, label %79

; <label>:73:                                     ; preds = %70
  %74 = load i32, i32* %4, align 4
  %75 = shl i32 %74, %18
  %76 = or i32 %75, %.01
  store i32 %76, i32* %4, align 4
  %77 = load i32, i32* %6, align 4
  %78 = add i32 %77, %18
  store i32 %78, i32* %6, align 4
  %.pr3 = load i32, i32* %9, align 4
  br label %79

; <label>:79:                                     ; preds = %73, %70
  %80 = phi i32 [ %.pr3, %73 ], [ %71, %70 ]
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %thread-pre-split, label %82

; <label>:82:                                     ; preds = %79
  %83 = load i32, i32* %4, align 4
  %84 = shl i32 %83, 1
  %85 = or i32 %84, %13
  store i32 %85, i32* %4, align 4
  %86 = load i32, i32* %6, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %6, align 4
  br label %thread-pre-split

; <label>:88:                                     ; preds = %11
  %89 = load i32, i32* %8, align 4
  %90 = shl i32 %89, 4
  %91 = load i32, i32* %9, align 4
  %92 = add nsw i32 %90, %91
  %93 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %14, i32 2
  %94 = load i64*, i64** %93, align 8
  %95 = zext i32 %92 to i64
  %96 = getelementptr inbounds i64, i64* %94, i64 %95
  %97 = load i64, i64* %96, align 8
  %98 = trunc i64 %97 to i32
  store i32 %98, i32* %3, align 4
  %99 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %14, i32 3
  %100 = load i8*, i8** %99, align 8
  %101 = getelementptr inbounds i8, i8* %100, i64 %95
  %102 = load i8, i8* %101, align 1
  %103 = zext i8 %102 to i32
  %104 = load i32, i32* %5, align 4
  %105 = add nsw i32 %104, %103
  store i32 %105, i32* %5, align 4
  %106 = load i32, i32* %8, align 4
  %107 = icmp eq i32 %106, 0
  br i1 %107, label %114, label %108

; <label>:108:                                    ; preds = %88
  %109 = load i32, i32* %3, align 4
  %110 = shl i32 %109, 1
  %111 = or i32 %110, %12
  store i32 %111, i32* %3, align 4
  %112 = load i32, i32* %5, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, i32* %5, align 4
  br label %114

; <label>:114:                                    ; preds = %88, %108
  %115 = load i32, i32* %9, align 4
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %thread-pre-split, label %117

; <label>:117:                                    ; preds = %114
  %118 = load i32, i32* %3, align 4
  %119 = shl i32 %118, 1
  %120 = or i32 %119, %13
  store i32 %120, i32* %3, align 4
  %121 = load i32, i32* %5, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, i32* %5, align 4
  br label %123

thread-pre-split:                                 ; preds = %79, %82, %114
  %.pr4 = load i32, i32* %5, align 4
  br label %123

; <label>:123:                                    ; preds = %thread-pre-split, %117
  %124 = phi i32 [ %.pr4, %thread-pre-split ], [ %122, %117 ]
  %125 = icmp slt i32 %124, 33
  br i1 %125, label %127, label %126

; <label>:126:                                    ; preds = %123
  tail call void @__assert_fail(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 851, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @__PRETTY_FUNCTION__.HuffmanCode, i64 0, i64 0)) #6
  unreachable

; <label>:127:                                    ; preds = %123
  %128 = load i32, i32* %6, align 4
  %129 = icmp slt i32 %128, 33
  br i1 %129, label %131, label %130

; <label>:130:                                    ; preds = %127
  tail call void @__assert_fail(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 852, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @__PRETTY_FUNCTION__.HuffmanCode, i64 0, i64 0)) #6
  unreachable

; <label>:131:                                    ; preds = %127
  %132 = add nsw i32 %128, %124
  br label %133

; <label>:133:                                    ; preds = %7, %131
  %.0 = phi i32 [ %132, %131 ], [ 0, %7 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @Huffmancodebits(%struct.BF_PartHolder** nocapture, i32* nocapture readonly, %struct.gr_info* nocapture readonly) unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 1
  %9 = load i32, i32* %8, align 4
  %10 = shl i32 %9, 1
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %.loopexit15, label %12

; <label>:12:                                     ; preds = %3
  %13 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 7
  %14 = load i32, i32* %13, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %.thread

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 6
  %18 = load i32, i32* %17, align 8
  %19 = icmp eq i32 %18, 2
  br i1 %19, label %20, label %50

; <label>:20:                                     ; preds = %16
  %21 = bitcast i32* %1 to [192 x [3 x i32]]*
  br label %23

.loopexit.loopexit:                               ; preds = %._crit_edge27.us.1
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader14
  %.111.lcssa = phi i32 [ %.01031, %.preheader14 ], [ %188, %.loopexit.loopexit ]
  %22 = icmp slt i64 %indvars.iv.next45, 13
  br i1 %22, label %23, label %.loopexit15.loopexit

; <label>:23:                                     ; preds = %20, %.loopexit
  %indvars.iv44 = phi i64 [ 0, %20 ], [ %indvars.iv.next45, %.loopexit ]
  %.01031 = phi i32 [ 0, %20 ], [ %.111.lcssa, %.loopexit ]
  %24 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 %indvars.iv44
  %25 = load i32, i32* %24, align 4
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %26 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 %indvars.iv.next45
  %27 = load i32, i32* %26, align 4
  %not. = icmp sgt i32 %25, 11
  %.sink = zext i1 %not. to i64
  %28 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 8, i64 %.sink
  %.06 = load i32, i32* %28, align 4
  %29 = icmp ult i32 %.06, 32
  br i1 %29, label %.preheader14, label %49

.preheader14:                                     ; preds = %23
  %30 = icmp slt i32 %25, %27
  br i1 %30, label %.preheader13.us, label %.loopexit

.preheader13.us:                                  ; preds = %.preheader14
  %31 = sext i32 %25 to i64
  %32 = sext i32 %27 to i64
  br label %33

; <label>:33:                                     ; preds = %.preheader13.us, %33
  %indvars.iv40 = phi i64 [ %31, %.preheader13.us ], [ %indvars.iv.next41, %33 ]
  %.224.us = phi i32 [ %.01031, %.preheader13.us ], [ %47, %33 ]
  %34 = getelementptr inbounds [192 x [3 x i32]], [192 x [3 x i32]]* %21, i64 0, i64 %indvars.iv40, i64 0
  %35 = load i32, i32* %34, align 4
  %36 = add nsw i64 %indvars.iv40, 1
  %37 = getelementptr inbounds [192 x [3 x i32]], [192 x [3 x i32]]* %21, i64 0, i64 %36, i64 0
  %38 = load i32, i32* %37, align 4
  %39 = call i32 @HuffmanCode(i32 %.06, i32 %35, i32 %38, i32* nonnull %6, i32* nonnull %7, i32* nonnull %4, i32* nonnull %5)
  %40 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %0, align 8
  %41 = load i32, i32* %6, align 4
  %42 = load i32, i32* %4, align 4
  %43 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %40, i32 %41, i32 %42) #5
  store %struct.BF_PartHolder* %43, %struct.BF_PartHolder** %0, align 8
  %44 = load i32, i32* %7, align 4
  %45 = load i32, i32* %5, align 4
  %46 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %43, i32 %44, i32 %45) #5
  store %struct.BF_PartHolder* %46, %struct.BF_PartHolder** %0, align 8
  %47 = add nsw i32 %39, %.224.us
  %indvars.iv.next41 = add i64 %indvars.iv40, 2
  %48 = icmp slt i64 %indvars.iv.next41, %32
  br i1 %48, label %33, label %._crit_edge27.us.preheader

._crit_edge27.us.preheader:                       ; preds = %33
  br label %._crit_edge27.us

; <label>:49:                                     ; preds = %23
  tail call void @__assert_fail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 532, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.Huffmancodebits, i64 0, i64 0)) #6
  unreachable

; <label>:50:                                     ; preds = %16
  %.pr = load i32, i32* %13, align 4
  %51 = icmp eq i32 %.pr, 0
  br i1 %51, label %52, label %.thread

; <label>:52:                                     ; preds = %50
  %53 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 10
  %54 = load i32, i32* %53, align 8
  %55 = add i32 %54, 1
  %56 = icmp ult i32 %55, 23
  br i1 %56, label %58, label %57

; <label>:57:                                     ; preds = %52
  tail call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 605, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.Huffmancodebits, i64 0, i64 0)) #6
  unreachable

; <label>:58:                                     ; preds = %52
  %59 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 11
  %60 = load i32, i32* %59, align 4
  %61 = add i32 %54, 2
  %62 = add i32 %61, %60
  %63 = icmp ult i32 %62, 23
  br i1 %63, label %65, label %64

; <label>:64:                                     ; preds = %58
  tail call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 608, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.Huffmancodebits, i64 0, i64 0)) #6
  unreachable

; <label>:65:                                     ; preds = %58
  %66 = zext i32 %55 to i64
  %67 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %66
  %68 = load i32, i32* %67, align 4
  %69 = zext i32 %62 to i64
  %70 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %69
  %71 = load i32, i32* %70, align 4
  %phitmp = sext i32 %71 to i64
  %phitmp48 = sext i32 %68 to i64
  br label %.thread

.thread:                                          ; preds = %12, %50, %65
  %.03 = phi i64 [ %phitmp, %65 ], [ 576, %50 ], [ 576, %12 ]
  %.02 = phi i64 [ %phitmp48, %65 ], [ 36, %50 ], [ 36, %12 ]
  %72 = icmp sgt i32 %10, 0
  br i1 %72, label %.lr.ph35.preheader, label %.loopexit15

.lr.ph35.preheader:                               ; preds = %.thread
  %73 = sext i32 %10 to i64
  br label %.lr.ph35

.lr.ph35:                                         ; preds = %.lr.ph35.preheader, %96
  %indvars.iv46 = phi i64 [ 0, %.lr.ph35.preheader ], [ %indvars.iv.next47, %96 ]
  %.333 = phi i32 [ 0, %.lr.ph35.preheader ], [ %.4, %96 ]
  %74 = icmp slt i64 %indvars.iv46, %.02
  %75 = icmp slt i64 %indvars.iv46, %.03
  %.sink12 = select i1 %75, i64 1, i64 2
  %.sink12.sink = select i1 %74, i64 0, i64 %.sink12
  %76 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 8, i64 %.sink12.sink
  %.1 = load i32, i32* %76, align 4
  %77 = icmp ult i32 %.1, 32
  br i1 %77, label %79, label %78

; <label>:78:                                     ; preds = %.lr.ph35
  tail call void @__assert_fail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 629, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.Huffmancodebits, i64 0, i64 0)) #6
  unreachable

; <label>:79:                                     ; preds = %.lr.ph35
  %80 = icmp eq i32 %.1, 0
  br i1 %80, label %96, label %81

; <label>:81:                                     ; preds = %79
  %82 = or i64 %indvars.iv46, 1
  %83 = getelementptr inbounds i32, i32* %1, i64 %82
  %84 = load i32, i32* %83, align 4
  %85 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv46
  %86 = load i32, i32* %85, align 4
  %87 = call i32 @HuffmanCode(i32 %.1, i32 %86, i32 %84, i32* nonnull %6, i32* nonnull %7, i32* nonnull %4, i32* nonnull %5)
  %88 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %0, align 8
  %89 = load i32, i32* %6, align 4
  %90 = load i32, i32* %4, align 4
  %91 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %88, i32 %89, i32 %90) #5
  store %struct.BF_PartHolder* %91, %struct.BF_PartHolder** %0, align 8
  %92 = load i32, i32* %7, align 4
  %93 = load i32, i32* %5, align 4
  %94 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %91, i32 %92, i32 %93) #5
  store %struct.BF_PartHolder* %94, %struct.BF_PartHolder** %0, align 8
  %95 = add nsw i32 %87, %.333
  br label %96

; <label>:96:                                     ; preds = %81, %79
  %.4 = phi i32 [ %95, %81 ], [ %.333, %79 ]
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 2
  %97 = icmp slt i64 %indvars.iv.next47, %73
  br i1 %97, label %.lr.ph35, label %.loopexit15.loopexit57

.loopexit15.loopexit:                             ; preds = %.loopexit
  br label %.loopexit15

.loopexit15.loopexit57:                           ; preds = %96
  br label %.loopexit15

.loopexit15:                                      ; preds = %.loopexit15.loopexit57, %.loopexit15.loopexit, %.thread, %3
  %.6 = phi i32 [ 0, %3 ], [ 0, %.thread ], [ %.111.lcssa, %.loopexit15.loopexit ], [ %.4, %.loopexit15.loopexit57 ]
  %98 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 14
  %99 = load i32, i32* %98, align 8
  %100 = icmp ult i32 %99, 2
  br i1 %100, label %102, label %101

; <label>:101:                                    ; preds = %.loopexit15
  tail call void @__assert_fail(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 649, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.Huffmancodebits, i64 0, i64 0)) #6
  unreachable

; <label>:102:                                    ; preds = %.loopexit15
  %103 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 2
  %104 = load i32, i32* %103, align 8
  %105 = shl i32 %104, 2
  %106 = add i32 %105, %10
  %107 = icmp slt i32 %106, 577
  br i1 %107, label %.preheader, label %111

.preheader:                                       ; preds = %102
  %108 = icmp slt i32 %10, %106
  br i1 %108, label %.lr.ph22.preheader, label %._crit_edge23

.lr.ph22.preheader:                               ; preds = %.preheader
  %109 = sext i32 %10 to i64
  %110 = sext i32 %106 to i64
  br label %.lr.ph22

; <label>:111:                                    ; preds = %102
  tail call void @__assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 652, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.Huffmancodebits, i64 0, i64 0)) #6
  unreachable

.lr.ph22:                                         ; preds = %.lr.ph22.preheader, %.lr.ph22
  %indvars.iv = phi i64 [ %109, %.lr.ph22.preheader ], [ %indvars.iv.next, %.lr.ph22 ]
  %.720 = phi i32 [ %.6, %.lr.ph22.preheader ], [ %128, %.lr.ph22 ]
  %112 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv
  %113 = load i32, i32* %112, align 4
  %114 = or i64 %indvars.iv, 1
  %115 = getelementptr inbounds i32, i32* %1, i64 %114
  %116 = load i32, i32* %115, align 4
  %117 = add nsw i64 %indvars.iv, 2
  %118 = getelementptr inbounds i32, i32* %1, i64 %117
  %119 = load i32, i32* %118, align 4
  %120 = add nsw i64 %indvars.iv, 3
  %121 = getelementptr inbounds i32, i32* %1, i64 %120
  %122 = load i32, i32* %121, align 4
  %123 = load i32, i32* %98, align 8
  %124 = add i32 %123, 32
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %125
  %127 = tail call i32 @L3_huffman_coder_count1(%struct.BF_PartHolder** %0, %struct.huffcodetab* %126, i32 %113, i32 %116, i32 %119, i32 %122)
  %128 = add nsw i32 %127, %.720
  %indvars.iv.next = add i64 %indvars.iv, 4
  %129 = icmp slt i64 %indvars.iv.next, %110
  br i1 %129, label %.lr.ph22, label %._crit_edge23.loopexit

._crit_edge23.loopexit:                           ; preds = %.lr.ph22
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %.preheader
  %.7.lcssa = phi i32 [ %.6, %.preheader ], [ %128, %._crit_edge23.loopexit ]
  %130 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 0
  %131 = load i32, i32* %130, align 8
  %132 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %2, i64 0, i32 15
  %133 = load i32, i32* %132, align 4
  %134 = sub i32 %131, %133
  %135 = sub i32 %134, %.7.lcssa
  %136 = icmp eq i32 %135, 0
  br i1 %136, label %153, label %137

; <label>:137:                                    ; preds = %._crit_edge23
  %138 = srem i32 %135, 32
  %139 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %140 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %139, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.12, i64 0, i64 0), i32 %135) #7
  %141 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %142 = tail call i64 @fwrite(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.13, i64 0, i64 0), i64 26, i64 1, %struct._IO_FILE* %141) #7
  %.off = add i32 %135, 31
  %143 = icmp ult i32 %.off, 63
  br i1 %143, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %137
  %144 = sdiv i32 %135, 32
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.019 = phi i32 [ %145, %.lr.ph ], [ %144, %.lr.ph.preheader ]
  %145 = add nsw i32 %.019, -1
  %146 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %0, align 8
  %147 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %146, i32 -1, i32 32) #5
  store %struct.BF_PartHolder* %147, %struct.BF_PartHolder** %0, align 8
  %148 = icmp eq i32 %145, 0
  br i1 %148, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %137
  %149 = icmp eq i32 %138, 0
  br i1 %149, label %153, label %150

; <label>:150:                                    ; preds = %._crit_edge
  %151 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %0, align 8
  %152 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %151, i32 -1, i32 %138) #5
  store %struct.BF_PartHolder* %152, %struct.BF_PartHolder** %0, align 8
  br label %153

; <label>:153:                                    ; preds = %150, %._crit_edge, %._crit_edge23
  %.8 = phi i32 [ %.7.lcssa, %._crit_edge23 ], [ %134, %._crit_edge ], [ %134, %150 ]
  %154 = load i32, i32* %130, align 8
  %155 = load i32, i32* %132, align 4
  %156 = sub i32 %154, %155
  %157 = icmp eq i32 %.8, %156
  br i1 %157, label %159, label %158

; <label>:158:                                    ; preds = %153
  tail call void @__assert_fail(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 683, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__PRETTY_FUNCTION__.Huffmancodebits, i64 0, i64 0)) #6
  unreachable

; <label>:159:                                    ; preds = %153
  ret void

._crit_edge27.us:                                 ; preds = %._crit_edge27.us.preheader, %._crit_edge27.us
  %indvars.iv40.1 = phi i64 [ %indvars.iv.next41.1, %._crit_edge27.us ], [ %31, %._crit_edge27.us.preheader ]
  %.224.us.1 = phi i32 [ %173, %._crit_edge27.us ], [ %47, %._crit_edge27.us.preheader ]
  %160 = getelementptr inbounds [192 x [3 x i32]], [192 x [3 x i32]]* %21, i64 0, i64 %indvars.iv40.1, i64 1
  %161 = load i32, i32* %160, align 4
  %162 = add nsw i64 %indvars.iv40.1, 1
  %163 = getelementptr inbounds [192 x [3 x i32]], [192 x [3 x i32]]* %21, i64 0, i64 %162, i64 1
  %164 = load i32, i32* %163, align 4
  %165 = call i32 @HuffmanCode(i32 %.06, i32 %161, i32 %164, i32* nonnull %6, i32* nonnull %7, i32* nonnull %4, i32* nonnull %5)
  %166 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %0, align 8
  %167 = load i32, i32* %6, align 4
  %168 = load i32, i32* %4, align 4
  %169 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %166, i32 %167, i32 %168) #5
  store %struct.BF_PartHolder* %169, %struct.BF_PartHolder** %0, align 8
  %170 = load i32, i32* %7, align 4
  %171 = load i32, i32* %5, align 4
  %172 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %169, i32 %170, i32 %171) #5
  store %struct.BF_PartHolder* %172, %struct.BF_PartHolder** %0, align 8
  %173 = add nsw i32 %165, %.224.us.1
  %indvars.iv.next41.1 = add i64 %indvars.iv40.1, 2
  %174 = icmp slt i64 %indvars.iv.next41.1, %32
  br i1 %174, label %._crit_edge27.us, label %._crit_edge27.us.1.preheader

._crit_edge27.us.1.preheader:                     ; preds = %._crit_edge27.us
  br label %._crit_edge27.us.1

._crit_edge27.us.1:                               ; preds = %._crit_edge27.us.1.preheader, %._crit_edge27.us.1
  %indvars.iv40.2 = phi i64 [ %indvars.iv.next41.2, %._crit_edge27.us.1 ], [ %31, %._crit_edge27.us.1.preheader ]
  %.224.us.2 = phi i32 [ %188, %._crit_edge27.us.1 ], [ %173, %._crit_edge27.us.1.preheader ]
  %175 = getelementptr inbounds [192 x [3 x i32]], [192 x [3 x i32]]* %21, i64 0, i64 %indvars.iv40.2, i64 2
  %176 = load i32, i32* %175, align 4
  %177 = add nsw i64 %indvars.iv40.2, 1
  %178 = getelementptr inbounds [192 x [3 x i32]], [192 x [3 x i32]]* %21, i64 0, i64 %177, i64 2
  %179 = load i32, i32* %178, align 4
  %180 = call i32 @HuffmanCode(i32 %.06, i32 %176, i32 %179, i32* nonnull %6, i32* nonnull %7, i32* nonnull %4, i32* nonnull %5)
  %181 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %0, align 8
  %182 = load i32, i32* %6, align 4
  %183 = load i32, i32* %4, align 4
  %184 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %181, i32 %182, i32 %183) #5
  store %struct.BF_PartHolder* %184, %struct.BF_PartHolder** %0, align 8
  %185 = load i32, i32* %7, align 4
  %186 = load i32, i32* %5, align 4
  %187 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %184, i32 %185, i32 %186) #5
  store %struct.BF_PartHolder* %187, %struct.BF_PartHolder** %0, align 8
  %188 = add nsw i32 %180, %.224.us.2
  %indvars.iv.next41.2 = add i64 %indvars.iv40.2, 2
  %189 = icmp slt i64 %indvars.iv.next41.2, %32
  br i1 %189, label %._crit_edge27.us.1, label %.loopexit.loopexit
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc %struct.BF_PartHolder* @CRC_BF_addEntry(%struct.BF_PartHolder*, i32, i32) unnamed_addr #0 {
  %4 = shl i32 1, %2
  %5 = lshr i32 %4, 1
  %6 = icmp eq i32 %5, 0
  %7 = load i32, i32* @crc, align 4
  br i1 %6, label %20, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %3
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %8 = phi i32 [ %., %.lr.ph ], [ %7, %.lr.ph.preheader ]
  %9 = phi i32 [ %18, %.lr.ph ], [ %5, %.lr.ph.preheader ]
  %10 = shl i32 %8, 1
  %11 = lshr i32 %8, 15
  %.lobit = and i32 %11, 1
  %12 = xor i32 %.lobit, 1
  %13 = and i32 %9, %1
  %14 = icmp eq i32 %13, 0
  %15 = zext i1 %14 to i32
  %16 = icmp eq i32 %12, %15
  %17 = xor i32 %10, 32773
  %. = select i1 %16, i32 %10, i32 %17
  %18 = lshr i32 %9, 1
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph
  store i32 %., i32* @crc, align 4
  br label %20

; <label>:20:                                     ; preds = %._crit_edge, %3
  %.lcssa = phi i32 [ %., %._crit_edge ], [ %7, %3 ]
  %21 = and i32 %.lcssa, 65535
  store i32 %21, i32* @crc, align 4
  %22 = tail call %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder* %0, i32 %1, i32 %2) #5
  ret %struct.BF_PartHolder* %22
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }
attributes #7 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
