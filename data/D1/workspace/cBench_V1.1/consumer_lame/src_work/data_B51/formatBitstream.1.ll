; ModuleID = 'formatBitstream.ll'
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

@BitCount = internal unnamed_addr global i32 0, align 4
@ThisFrameSize = internal unnamed_addr global i32 0, align 4
@BitsRemaining = internal unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [37 x i8] c"frameInfo->nGranules <= MAX_GRANULES\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"formatBitstream.c\00", align 1
@__PRETTY_FUNCTION__.BF_BitstreamFrame = private unnamed_addr constant [58 x i8] c"void BF_BitstreamFrame(BF_FrameData *, BF_FrameResults *)\00", align 1
@.str.2 = private unnamed_addr constant [37 x i8] c"frameInfo->nChannels <= MAX_CHANNELS\00", align 1
@.str.3 = private unnamed_addr constant [25 x i8] c"(BitsRemaining % 8) == 0\00", align 1
@forwardFrameLength = internal global i32 0, align 4
@forwardSILength = internal global i32 0, align 4
@elements = internal unnamed_addr global i32 0, align 4
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
@side_queue_free = internal unnamed_addr global %struct.side_info_link* null, align 8
@side_queue_head = internal unnamed_addr global %struct.side_info_link* null, align 8
@.str.13 = private unnamed_addr constant [2 x i8] c"l\00", align 1
@__PRETTY_FUNCTION__.get_side_info = private unnamed_addr constant [32 x i8] c"MYSideInfo *get_side_info(void)\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.14 = private unnamed_addr constant [31 x i8] c"cannot allocate side_info_link\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define void @InitFormatBitStream() local_unnamed_addr #0 {
  store i32 0, i32* @BitCount, align 4
  store i32 0, i32* @ThisFrameSize, align 4
  store i32 0, i32* @BitsRemaining, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @BF_BitstreamFrame(%struct.BF_FrameData*, %struct.BF_FrameResults*) local_unnamed_addr #1 {
  %3 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 1
  %4 = load i32, i32* %3, align 4
  %5 = icmp slt i32 %4, 3
  br i1 %5, label %7, label %6

; <label>:6:                                      ; preds = %2
  tail call void @__assert_fail(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 59, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__PRETTY_FUNCTION__.BF_BitstreamFrame, i64 0, i64 0)) #7
  unreachable

; <label>:7:                                      ; preds = %2
  %8 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 2
  %9 = load i32, i32* %8, align 8
  %10 = icmp slt i32 %9, 3
  br i1 %10, label %12, label %11

; <label>:11:                                     ; preds = %7
  tail call void @__assert_fail(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 60, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__PRETTY_FUNCTION__.BF_BitstreamFrame, i64 0, i64 0)) #7
  unreachable

; <label>:12:                                     ; preds = %7
  %13 = tail call fastcc i32 @store_side_info(%struct.BF_FrameData* nonnull %0)
  %14 = getelementptr inbounds %struct.BF_FrameResults, %struct.BF_FrameResults* %1, i64 0, i32 0
  store i32 %13, i32* %14, align 4
  %15 = tail call fastcc i32 @main_data(%struct.BF_FrameData* nonnull %0, %struct.BF_FrameResults* %1)
  %16 = getelementptr inbounds %struct.BF_FrameResults, %struct.BF_FrameResults* %1, i64 0, i32 1
  store i32 %15, i32* %16, align 4
  %17 = load i32, i32* @BitsRemaining, align 4
  %18 = and i32 %17, 7
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %21, label %20

; <label>:20:                                     ; preds = %12
  tail call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 74, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__PRETTY_FUNCTION__.BF_BitstreamFrame, i64 0, i64 0)) #7
  unreachable

; <label>:21:                                     ; preds = %12
  %22 = tail call fastcc i32 @side_queue_elements()
  store i32 %22, i32* @elements, align 4
  %23 = load i32, i32* @BitsRemaining, align 4
  %24 = sdiv i32 %23, 8
  %25 = load i32, i32* @forwardFrameLength, align 4
  %26 = sdiv i32 %25, 8
  %27 = add nsw i32 %26, %24
  %28 = load i32, i32* @forwardSILength, align 4
  %.neg = sdiv i32 %28, -8
  %29 = add i32 %27, %.neg
  %30 = getelementptr inbounds %struct.BF_FrameResults, %struct.BF_FrameResults* %1, i64 0, i32 2
  store i32 %29, i32* %30, align 4
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @store_side_info(%struct.BF_FrameData* readonly) unnamed_addr #1 {
  %2 = load %struct.side_info_link*, %struct.side_info_link** @side_queue_free, align 8
  %3 = icmp eq %struct.side_info_link* %2, null
  br i1 %3, label %4, label %60

; <label>:4:                                      ; preds = %1
  %5 = tail call noalias i8* @calloc(i64 1, i64 88) #6
  %6 = bitcast i8* %5 to %struct.side_info_link*
  %7 = icmp eq i8* %5, null
  br i1 %7, label %8, label %11

; <label>:8:                                      ; preds = %4
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.14, i64 0, i64 0), i64 30, i64 1, %struct._IO_FILE* %9) #8
  tail call void @exit(i32 1) #7
  unreachable

; <label>:11:                                     ; preds = %4
  %12 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 3
  %13 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %12, align 8
  %14 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %13, i64 0, i32 0
  %15 = load i32, i32* %14, align 8
  %16 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 %15)
  %17 = getelementptr inbounds i8, i8* %5, i64 24
  %18 = bitcast i8* %17 to %struct.BF_PartHolder**
  store %struct.BF_PartHolder* %16, %struct.BF_PartHolder** %18, align 8
  %19 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 4
  %20 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %19, align 8
  %21 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %20, i64 0, i32 0
  %22 = load i32, i32* %21, align 8
  %23 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 %22)
  %24 = getelementptr inbounds i8, i8* %5, i64 32
  %25 = bitcast i8* %24 to %struct.BF_PartHolder**
  store %struct.BF_PartHolder* %23, %struct.BF_PartHolder** %25, align 8
  %26 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 2
  %27 = load i32, i32* %26, align 8
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %.lr.ph31, label %.preheader11

.lr.ph31:                                         ; preds = %11
  %29 = getelementptr inbounds i8, i8* %5, i64 40
  %30 = bitcast i8* %29 to [2 x %struct.BF_PartHolder*]*
  br label %36

.preheader11.loopexit:                            ; preds = %36
  br label %.preheader11

.preheader11:                                     ; preds = %.preheader11.loopexit, %11
  %31 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 1
  %32 = load i32, i32* %31, align 4
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %.preheader10.lr.ph, label %.loopexit12

.preheader10.lr.ph:                               ; preds = %.preheader11
  %34 = getelementptr inbounds i8, i8* %5, i64 56
  %35 = bitcast i8* %34 to [2 x [2 x %struct.BF_PartHolder*]]*
  br label %.preheader10

; <label>:36:                                     ; preds = %.lr.ph31, %36
  %indvars.iv43 = phi i64 [ 0, %.lr.ph31 ], [ %indvars.iv.next44, %36 ]
  %37 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 5, i64 %indvars.iv43
  %38 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %37, align 8
  %39 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %38, i64 0, i32 0
  %40 = load i32, i32* %39, align 8
  %41 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 %40)
  %42 = getelementptr inbounds [2 x %struct.BF_PartHolder*], [2 x %struct.BF_PartHolder*]* %30, i64 0, i64 %indvars.iv43
  store %struct.BF_PartHolder* %41, %struct.BF_PartHolder** %42, align 8
  %indvars.iv.next44 = add nuw i64 %indvars.iv43, 1
  %43 = load i32, i32* %26, align 8
  %44 = sext i32 %43 to i64
  %45 = icmp slt i64 %indvars.iv.next44, %44
  br i1 %45, label %36, label %.preheader11.loopexit

.preheader10:                                     ; preds = %.preheader10.lr.ph, %._crit_edge27
  %indvars.iv41 = phi i64 [ 0, %.preheader10.lr.ph ], [ %indvars.iv.next42, %._crit_edge27 ]
  %46 = load i32, i32* %26, align 8
  %47 = icmp sgt i32 %46, 0
  br i1 %47, label %.lr.ph26.preheader, label %._crit_edge27

.lr.ph26.preheader:                               ; preds = %.preheader10
  br label %.lr.ph26

.lr.ph26:                                         ; preds = %.lr.ph26.preheader, %.lr.ph26
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %.lr.ph26 ], [ 0, %.lr.ph26.preheader ]
  %48 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 6, i64 %indvars.iv41, i64 %indvars.iv39
  %49 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %48, align 8
  %50 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %49, i64 0, i32 0
  %51 = load i32, i32* %50, align 8
  %52 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 %51)
  %53 = getelementptr inbounds [2 x [2 x %struct.BF_PartHolder*]], [2 x [2 x %struct.BF_PartHolder*]]* %35, i64 0, i64 %indvars.iv41, i64 %indvars.iv39
  store %struct.BF_PartHolder* %52, %struct.BF_PartHolder** %53, align 8
  %indvars.iv.next40 = add nuw i64 %indvars.iv39, 1
  %54 = load i32, i32* %26, align 8
  %55 = sext i32 %54 to i64
  %56 = icmp slt i64 %indvars.iv.next40, %55
  br i1 %56, label %.lr.ph26, label %._crit_edge27.loopexit

._crit_edge27.loopexit:                           ; preds = %.lr.ph26
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27.loopexit, %.preheader10
  %indvars.iv.next42 = add nuw i64 %indvars.iv41, 1
  %57 = load i32, i32* %31, align 4
  %58 = sext i32 %57 to i64
  %59 = icmp slt i64 %indvars.iv.next42, %58
  br i1 %59, label %.preheader10, label %.loopexit12.loopexit

; <label>:60:                                     ; preds = %1
  %61 = bitcast %struct.side_info_link* %2 to i64*
  %62 = load i64, i64* %61, align 8
  store i64 %62, i64* bitcast (%struct.side_info_link** @side_queue_free to i64*), align 8
  %63 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %2, i64 0, i32 0
  store %struct.side_info_link* null, %struct.side_info_link** %63, align 8
  br label %.loopexit12

.loopexit12.loopexit:                             ; preds = %._crit_edge27
  br label %.loopexit12

.loopexit12:                                      ; preds = %.loopexit12.loopexit, %.preheader11, %60
  %.06 = phi %struct.side_info_link* [ %2, %60 ], [ %6, %.preheader11 ], [ %6, %.loopexit12.loopexit ]
  %64 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 0
  %65 = load i32, i32* %64, align 8
  %66 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %.06, i64 0, i32 1, i32 0
  store i32 %65, i32* %66, align 8
  %67 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 1
  %68 = load i32, i32* %67, align 4
  %69 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %.06, i64 0, i32 1, i32 2
  store i32 %68, i32* %69, align 8
  %70 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 2
  %71 = load i32, i32* %70, align 8
  %72 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %.06, i64 0, i32 1, i32 3
  store i32 %71, i32* %72, align 4
  %73 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %.06, i64 0, i32 1, i32 4
  %74 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %73, align 8
  %75 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 3
  %76 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %75, align 8
  %77 = tail call %struct.BF_PartHolder* @BF_LoadHolderFromBitstreamPart(%struct.BF_PartHolder* %74, %struct.BF_BitstreamPart* %76)
  store %struct.BF_PartHolder* %77, %struct.BF_PartHolder** %73, align 8
  %78 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %.06, i64 0, i32 1, i32 5
  %79 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %78, align 8
  %80 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 4
  %81 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %80, align 8
  %82 = tail call %struct.BF_PartHolder* @BF_LoadHolderFromBitstreamPart(%struct.BF_PartHolder* %79, %struct.BF_BitstreamPart* %81)
  store %struct.BF_PartHolder* %82, %struct.BF_PartHolder** %78, align 8
  %83 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %75, align 8
  %84 = tail call i32 @BF_PartLength(%struct.BF_BitstreamPart* %83)
  %85 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %80, align 8
  %86 = tail call i32 @BF_PartLength(%struct.BF_BitstreamPart* %85)
  %87 = add nsw i32 %86, %84
  %88 = load i32, i32* %70, align 8
  %89 = icmp sgt i32 %88, 0
  br i1 %89, label %.lr.ph23.preheader, label %.preheader9

.lr.ph23.preheader:                               ; preds = %.loopexit12
  br label %.lr.ph23

.preheader9.loopexit:                             ; preds = %.lr.ph23
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.loopexit, %.loopexit12
  %.0.lcssa = phi i32 [ %87, %.loopexit12 ], [ %99, %.preheader9.loopexit ]
  %90 = load i32, i32* %67, align 4
  %91 = icmp sgt i32 %90, 0
  br i1 %91, label %.preheader8.preheader, label %._crit_edge18

.preheader8.preheader:                            ; preds = %.preheader9
  br label %.preheader8

.lr.ph23:                                         ; preds = %.lr.ph23.preheader, %.lr.ph23
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %.lr.ph23 ], [ 0, %.lr.ph23.preheader ]
  %.021 = phi i32 [ %99, %.lr.ph23 ], [ %87, %.lr.ph23.preheader ]
  %92 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %.06, i64 0, i32 1, i32 6, i64 %indvars.iv37
  %93 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %92, align 8
  %94 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 5, i64 %indvars.iv37
  %95 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %94, align 8
  %96 = tail call %struct.BF_PartHolder* @BF_LoadHolderFromBitstreamPart(%struct.BF_PartHolder* %93, %struct.BF_BitstreamPart* %95)
  store %struct.BF_PartHolder* %96, %struct.BF_PartHolder** %92, align 8
  %97 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %94, align 8
  %98 = tail call i32 @BF_PartLength(%struct.BF_BitstreamPart* %97)
  %99 = add nsw i32 %98, %.021
  %indvars.iv.next38 = add nuw i64 %indvars.iv37, 1
  %100 = load i32, i32* %70, align 8
  %101 = sext i32 %100 to i64
  %102 = icmp slt i64 %indvars.iv.next38, %101
  br i1 %102, label %.lr.ph23, label %.preheader9.loopexit

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge ], [ 0, %.preheader8.preheader ]
  %.117 = phi i32 [ %.2.lcssa, %._crit_edge ], [ %.0.lcssa, %.preheader8.preheader ]
  %103 = load i32, i32* %70, align 8
  %104 = icmp sgt i32 %103, 0
  br i1 %104, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %.215 = phi i32 [ %112, %.lr.ph ], [ %.117, %.lr.ph.preheader ]
  %105 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %.06, i64 0, i32 1, i32 7, i64 %indvars.iv35, i64 %indvars.iv
  %106 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %105, align 8
  %107 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 6, i64 %indvars.iv35, i64 %indvars.iv
  %108 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %107, align 8
  %109 = tail call %struct.BF_PartHolder* @BF_LoadHolderFromBitstreamPart(%struct.BF_PartHolder* %106, %struct.BF_BitstreamPart* %108)
  store %struct.BF_PartHolder* %109, %struct.BF_PartHolder** %105, align 8
  %110 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %107, align 8
  %111 = tail call i32 @BF_PartLength(%struct.BF_BitstreamPart* %110)
  %112 = add nsw i32 %111, %.215
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %113 = load i32, i32* %70, align 8
  %114 = sext i32 %113 to i64
  %115 = icmp slt i64 %indvars.iv.next, %114
  br i1 %115, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader8
  %.2.lcssa = phi i32 [ %.117, %.preheader8 ], [ %112, %._crit_edge.loopexit ]
  %indvars.iv.next36 = add nuw i64 %indvars.iv35, 1
  %116 = load i32, i32* %67, align 4
  %117 = sext i32 %116 to i64
  %118 = icmp slt i64 %indvars.iv.next36, %117
  br i1 %118, label %.preheader8, label %._crit_edge18.loopexit

._crit_edge18.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %.preheader9
  %.1.lcssa = phi i32 [ %.0.lcssa, %.preheader9 ], [ %.2.lcssa, %._crit_edge18.loopexit ]
  %119 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %.06, i64 0, i32 1, i32 1
  store i32 %.1.lcssa, i32* %119, align 4
  %120 = load %struct.side_info_link*, %struct.side_info_link** @side_queue_head, align 8
  %121 = icmp eq %struct.side_info_link* %120, null
  br i1 %121, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %._crit_edge18
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %.07 = phi %struct.side_info_link* [ %123, %.preheader ], [ %120, %.preheader.preheader ]
  %122 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %.07, i64 0, i32 0
  %123 = load %struct.side_info_link*, %struct.side_info_link** %122, align 8
  %124 = icmp eq %struct.side_info_link* %123, null
  br i1 %124, label %.loopexit.loopexit, label %.preheader

.loopexit.loopexit:                               ; preds = %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge18
  %.sink = phi %struct.side_info_link** [ @side_queue_head, %._crit_edge18 ], [ %122, %.loopexit.loopexit ]
  store %struct.side_info_link* %.06, %struct.side_info_link** %.sink, align 8
  ret i32 %.1.lcssa
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @main_data(%struct.BF_FrameData* nocapture readonly, %struct.BF_FrameResults*) unnamed_addr #1 {
  %3 = getelementptr inbounds %struct.BF_FrameResults, %struct.BF_FrameResults* %1, i64 0, i32 1
  store i32 0, i32* %3, align 4
  %4 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 1
  %5 = load i32, i32* %4, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge7

.preheader.lr.ph:                                 ; preds = %2
  %7 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 2
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge
  %indvars.iv9 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next10, %._crit_edge ]
  %.06 = phi i32 [ 0, %.preheader.lr.ph ], [ %.1.lcssa, %._crit_edge ]
  %8 = load i32, i32* %7, align 8
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %.14 = phi i32 [ %21, %.lr.ph ], [ %.06, %.lr.ph.preheader ]
  %10 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 7, i64 %indvars.iv9, i64 %indvars.iv
  %11 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %10, align 8
  %12 = tail call i32 @writePartMainData(%struct.BF_BitstreamPart* %11, %struct.BF_FrameResults* %1)
  %13 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 8, i64 %indvars.iv9, i64 %indvars.iv
  %14 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %13, align 8
  %15 = tail call i32 @writePartMainData(%struct.BF_BitstreamPart* %14, %struct.BF_FrameResults* %1)
  %16 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 9, i64 %indvars.iv9, i64 %indvars.iv
  %17 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %16, align 8
  %18 = tail call i32 @writePartMainData(%struct.BF_BitstreamPart* %17, %struct.BF_FrameResults* %1)
  %19 = add nsw i32 %12, %.14
  %20 = add nsw i32 %19, %15
  %21 = add nsw i32 %20, %18
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %22 = load i32, i32* %7, align 8
  %23 = sext i32 %22 to i64
  %24 = icmp slt i64 %indvars.iv.next, %23
  br i1 %24, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.1.lcssa = phi i32 [ %.06, %.preheader ], [ %21, %._crit_edge.loopexit ]
  %indvars.iv.next10 = add nuw i64 %indvars.iv9, 1
  %25 = load i32, i32* %4, align 4
  %26 = sext i32 %25 to i64
  %27 = icmp slt i64 %indvars.iv.next10, %26
  br i1 %27, label %.preheader, label %._crit_edge7.loopexit

._crit_edge7.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %2
  %.0.lcssa = phi i32 [ 0, %2 ], [ %.1.lcssa, %._crit_edge7.loopexit ]
  %28 = getelementptr inbounds %struct.BF_FrameData, %struct.BF_FrameData* %0, i64 0, i32 10
  %29 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %28, align 8
  %30 = tail call i32 @writePartMainData(%struct.BF_BitstreamPart* %29, %struct.BF_FrameResults* %1)
  %31 = add nsw i32 %30, %.0.lcssa
  ret i32 %31
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc i32 @side_queue_elements() unnamed_addr #0 {
  store i32 0, i32* @forwardFrameLength, align 4
  store i32 0, i32* @forwardSILength, align 4
  %.02 = load %struct.side_info_link*, %struct.side_info_link** @side_queue_head, align 8
  %1 = icmp eq %struct.side_info_link* %.02, null
  br i1 %1, label %14, label %.lr.ph

.lr.ph:                                           ; preds = %0
  %forwardFrameLength.promoted = load i32, i32* @forwardFrameLength, align 4
  %forwardSILength.promoted = load i32, i32* @forwardSILength, align 4
  br label %2

; <label>:2:                                      ; preds = %.lr.ph, %2
  %3 = phi i32 [ %forwardSILength.promoted, %.lr.ph ], [ %10, %2 ]
  %4 = phi i32 [ %forwardFrameLength.promoted, %.lr.ph ], [ %7, %2 ]
  %.04 = phi %struct.side_info_link* [ %.02, %.lr.ph ], [ %.0, %2 ]
  %.013 = phi i32 [ 0, %.lr.ph ], [ %11, %2 ]
  %5 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %.04, i64 0, i32 1, i32 0
  %6 = load i32, i32* %5, align 8
  %7 = add nsw i32 %4, %6
  %8 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %.04, i64 0, i32 1, i32 1
  %9 = load i32, i32* %8, align 4
  %10 = add nsw i32 %3, %9
  %11 = add nuw nsw i32 %.013, 1
  %12 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %.04, i64 0, i32 0
  %.0 = load %struct.side_info_link*, %struct.side_info_link** %12, align 8
  %13 = icmp eq %struct.side_info_link* %.0, null
  br i1 %13, label %._crit_edge, label %2

._crit_edge:                                      ; preds = %2
  store i32 %7, i32* @forwardFrameLength, align 4
  store i32 %10, i32* @forwardSILength, align 4
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %0
  %.01.lcssa = phi i32 [ %11, %._crit_edge ], [ 0, %0 ]
  ret i32 %.01.lcssa
}

; Function Attrs: noinline nounwind uwtable
define void @BF_FlushBitstream(%struct.BF_FrameData* nocapture readnone, %struct.BF_FrameResults* nocapture) local_unnamed_addr #1 {
  %3 = load i32, i32* @elements, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %14, label %5

; <label>:5:                                      ; preds = %2
  %6 = load i32, i32* @forwardFrameLength, align 4
  %7 = load i32, i32* @forwardSILength, align 4
  %8 = sub nsw i32 %6, %7
  %.off = add i32 %8, 31
  %9 = icmp ult i32 %.off, 63
  br i1 %9, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %5
  %10 = sdiv i32 %8, 32
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.01 = phi i32 [ %11, %.lr.ph ], [ %10, %.lr.ph.preheader ]
  %11 = add nsw i32 %.01, -1
  tail call fastcc void @WriteMainDataBits(i32 0, i32 32)
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  %13 = srem i32 %8, 32
  tail call fastcc void @WriteMainDataBits(i32 0, i32 %13)
  br label %14

; <label>:14:                                     ; preds = %2, %._crit_edge
  %15 = load i32, i32* @forwardFrameLength, align 4
  %16 = load i32, i32* @forwardSILength, align 4
  %17 = sub nsw i32 %15, %16
  %18 = getelementptr inbounds %struct.BF_FrameResults, %struct.BF_FrameResults* %1, i64 0, i32 1
  store i32 %17, i32* %18, align 4
  %19 = getelementptr inbounds %struct.BF_FrameResults, %struct.BF_FrameResults* %1, i64 0, i32 0
  store i32 %16, i32* %19, align 4
  %20 = getelementptr inbounds %struct.BF_FrameResults, %struct.BF_FrameResults* %1, i64 0, i32 2
  store i32 0, i32* %20, align 4
  tail call fastcc void @free_side_queues()
  store i32 0, i32* @BitCount, align 4
  store i32 0, i32* @ThisFrameSize, align 4
  store i32 0, i32* @BitsRemaining, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @WriteMainDataBits(i32, i32) unnamed_addr #1 {
  %3 = icmp ult i32 %1, 33
  br i1 %3, label %5, label %4

; <label>:4:                                      ; preds = %2
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 217, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__PRETTY_FUNCTION__.WriteMainDataBits, i64 0, i64 0)) #7
  unreachable

; <label>:5:                                      ; preds = %2
  %6 = icmp eq i32 %1, 0
  br i1 %6, label %41, label %7

; <label>:7:                                      ; preds = %5
  %8 = load i32, i32* @BitCount, align 4
  %9 = load i32, i32* @ThisFrameSize, align 4
  %10 = icmp eq i32 %8, %9
  br i1 %10, label %11, label %15

; <label>:11:                                     ; preds = %7
  %12 = tail call fastcc i32 @write_side_info()
  store i32 %12, i32* @BitCount, align 4
  %13 = load i32, i32* @ThisFrameSize, align 4
  %14 = sub nsw i32 %13, %12
  store i32 %14, i32* @BitsRemaining, align 4
  br label %15

; <label>:15:                                     ; preds = %11, %7
  %16 = load i32, i32* @BitsRemaining, align 4
  %17 = icmp ult i32 %16, %1
  br i1 %17, label %18, label %24

; <label>:18:                                     ; preds = %15
  %19 = sub i32 %1, %16
  %20 = lshr i32 %0, %19
  tail call void @putMyBits(i32 %20, i32 %16) #6
  %21 = tail call fastcc i32 @write_side_info()
  store i32 %21, i32* @BitCount, align 4
  %22 = load i32, i32* @ThisFrameSize, align 4
  %23 = sub nsw i32 %22, %21
  store i32 %23, i32* @BitsRemaining, align 4
  tail call void @putMyBits(i32 %0, i32 %19) #6
  br label %25

; <label>:24:                                     ; preds = %15
  tail call void @putMyBits(i32 %0, i32 %1) #6
  br label %25

; <label>:25:                                     ; preds = %24, %18
  %.0 = phi i32 [ %19, %18 ], [ %1, %24 ]
  %26 = load i32, i32* @BitCount, align 4
  %27 = add i32 %26, %.0
  store i32 %27, i32* @BitCount, align 4
  %28 = load i32, i32* @BitsRemaining, align 4
  %29 = sub i32 %28, %.0
  store i32 %29, i32* @BitsRemaining, align 4
  %30 = load i32, i32* @ThisFrameSize, align 4
  %31 = icmp sgt i32 %27, %30
  br i1 %31, label %32, label %33

; <label>:32:                                     ; preds = %25
  tail call void @__assert_fail(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 238, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__PRETTY_FUNCTION__.WriteMainDataBits, i64 0, i64 0)) #7
  unreachable

; <label>:33:                                     ; preds = %25
  %34 = icmp sgt i32 %29, -1
  br i1 %34, label %36, label %35

; <label>:35:                                     ; preds = %33
  tail call void @__assert_fail(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 239, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__PRETTY_FUNCTION__.WriteMainDataBits, i64 0, i64 0)) #7
  unreachable

; <label>:36:                                     ; preds = %33
  %37 = load i32, i32* @BitCount, align 4
  %38 = add nsw i32 %37, %29
  %39 = icmp eq i32 %38, %30
  br i1 %39, label %41, label %40

; <label>:40:                                     ; preds = %36
  tail call void @__assert_fail(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.12, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 240, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__PRETTY_FUNCTION__.WriteMainDataBits, i64 0, i64 0)) #7
  unreachable

; <label>:41:                                     ; preds = %36, %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @free_side_queues() unnamed_addr #1 {
  %1 = load %struct.side_info_link*, %struct.side_info_link** @side_queue_head, align 8
  %2 = icmp eq %struct.side_info_link* %1, null
  br i1 %2, label %._crit_edge5, label %.lr.ph4.preheader

.lr.ph4.preheader:                                ; preds = %0
  br label %.lr.ph4

.lr.ph4:                                          ; preds = %.lr.ph4.preheader, %.lr.ph4
  %.02 = phi %struct.side_info_link* [ %4, %.lr.ph4 ], [ %1, %.lr.ph4.preheader ]
  %3 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %.02, i64 0, i32 0
  %4 = load %struct.side_info_link*, %struct.side_info_link** %3, align 8
  tail call fastcc void @free_side_info_link(%struct.side_info_link* nonnull %.02)
  %5 = icmp eq %struct.side_info_link* %4, null
  br i1 %5, label %._crit_edge5.loopexit, label %.lr.ph4

._crit_edge5.loopexit:                            ; preds = %.lr.ph4
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %0
  store %struct.side_info_link* null, %struct.side_info_link** @side_queue_head, align 8
  %6 = load %struct.side_info_link*, %struct.side_info_link** @side_queue_free, align 8
  %7 = icmp eq %struct.side_info_link* %6, null
  br i1 %7, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %._crit_edge5
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.11 = phi %struct.side_info_link* [ %9, %.lr.ph ], [ %6, %.lr.ph.preheader ]
  %8 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %.11, i64 0, i32 0
  %9 = load %struct.side_info_link*, %struct.side_info_link** %8, align 8
  tail call fastcc void @free_side_info_link(%struct.side_info_link* nonnull %.11)
  %10 = icmp eq %struct.side_info_link* %9, null
  br i1 %10, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge5
  store %struct.side_info_link* null, %struct.side_info_link** @side_queue_free, align 8
  ret void
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @BF_PartLength(%struct.BF_BitstreamPart* nocapture readonly) local_unnamed_addr #3 {
  %2 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %0, i64 0, i32 0
  %3 = load i32, i32* %2, align 8
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %1
  %5 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %0, i64 0, i32 1
  %6 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %5, align 8
  %7 = load i32, i32* %2, align 8
  %8 = icmp ugt i32 %7, 1
  %umax = select i1 %8, i32 %7, i32 1
  %9 = add i32 %umax, -1
  %10 = zext i32 %9 to i64
  %11 = add nuw nsw i64 %10, 1
  %min.iters.check = icmp ult i64 %11, 8
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  %n.mod.vf = and i64 %11, 7
  %12 = icmp eq i64 %n.mod.vf, 0
  %13 = select i1 %12, i64 8, i64 %n.mod.vf
  %n.vec = sub nsw i64 %11, %13
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = getelementptr %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %6, i64 %n.vec
  %cast.crd = trunc i64 %n.vec to i32
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %vec.phi = phi <4 x i32> [ %21, %vector.body ], [ zeroinitializer, %vector.body.preheader ]
  %vec.phi8 = phi <4 x i32> [ %22, %vector.body ], [ zeroinitializer, %vector.body.preheader ]
  %14 = or i64 %index, 4
  %15 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %6, i64 %index, i32 1
  %16 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %6, i64 %14, i32 1
  %17 = bitcast i16* %15 to <16 x i16>*
  %18 = bitcast i16* %16 to <16 x i16>*
  %wide.vec = load <16 x i16>, <16 x i16>* %17, align 4
  %wide.vec11 = load <16 x i16>, <16 x i16>* %18, align 4
  %strided.vec = shufflevector <16 x i16> %wide.vec, <16 x i16> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec12 = shufflevector <16 x i16> %wide.vec11, <16 x i16> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %19 = zext <4 x i16> %strided.vec to <4 x i32>
  %20 = zext <4 x i16> %strided.vec12 to <4 x i32>
  %21 = add nsw <4 x i32> %19, %vec.phi
  %22 = add nsw <4 x i32> %20, %vec.phi8
  %index.next = add i64 %index, 8
  %23 = icmp eq i64 %index.next, %n.vec
  br i1 %23, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <4 x i32> %22, %21
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx13 = add <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf14 = shufflevector <4 x i32> %bin.rdx13, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx15 = add <4 x i32> %bin.rdx13, %rdx.shuf14
  %24 = extractelement <4 x i32> %bin.rdx15, i32 0
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph
  %.05.ph = phi i32 [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ %24, %middle.block ]
  %.014.ph = phi %struct.BF_BitstreamElement* [ %6, %min.iters.checked ], [ %6, %.lr.ph ], [ %ind.end, %middle.block ]
  %.023.ph = phi i32 [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ %cast.crd, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %.05 = phi i32 [ %28, %scalar.ph ], [ %.05.ph, %scalar.ph.preheader ]
  %.014 = phi %struct.BF_BitstreamElement* [ %30, %scalar.ph ], [ %.014.ph, %scalar.ph.preheader ]
  %.023 = phi i32 [ %29, %scalar.ph ], [ %.023.ph, %scalar.ph.preheader ]
  %25 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %.014, i64 0, i32 1
  %26 = load i16, i16* %25, align 4
  %27 = zext i16 %26 to i32
  %28 = add nsw i32 %27, %.05
  %29 = add nuw i32 %.023, 1
  %30 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %.014, i64 1
  %31 = icmp ult i32 %29, %7
  br i1 %31, label %scalar.ph, label %._crit_edge.loopexit, !llvm.loop !4

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  %.0.lcssa = phi i32 [ 0, %1 ], [ %28, %._crit_edge.loopexit ]
  ret i32 %.0.lcssa
}

; Function Attrs: noinline nounwind uwtable
define noalias %struct.BF_PartHolder* @BF_newPartHolder(i32) local_unnamed_addr #1 {
  %2 = tail call noalias i8* @calloc(i64 1, i64 16) #6
  %3 = bitcast i8* %2 to %struct.BF_PartHolder*
  %4 = icmp eq i8* %2, null
  br i1 %4, label %5, label %6

; <label>:5:                                      ; preds = %1
  tail call void @__assert_fail(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 443, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__PRETTY_FUNCTION__.BF_newPartHolder, i64 0, i64 0)) #7
  unreachable

; <label>:6:                                      ; preds = %1
  %7 = bitcast i8* %2 to i32*
  store i32 %0, i32* %7, align 8
  %8 = tail call noalias i8* @calloc(i64 1, i64 16) #6
  %9 = getelementptr inbounds i8, i8* %2, i64 8
  %10 = bitcast i8* %9 to i8**
  store i8* %8, i8** %10, align 8
  %11 = icmp eq i8* %8, null
  br i1 %11, label %12, label %13

; <label>:12:                                     ; preds = %6
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 446, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__PRETTY_FUNCTION__.BF_newPartHolder, i64 0, i64 0)) #7
  unreachable

; <label>:13:                                     ; preds = %6
  %14 = sext i32 %0 to i64
  %15 = tail call noalias i8* @calloc(i64 %14, i64 8) #6
  %16 = bitcast i8* %9 to %struct.BF_BitstreamPart**
  %17 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %16, align 8
  %18 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %17, i64 0, i32 1
  %19 = bitcast %struct.BF_BitstreamElement** %18 to i8**
  store i8* %15, i8** %19, align 8
  %20 = icmp sgt i32 %0, 0
  br i1 %20, label %21, label %27

; <label>:21:                                     ; preds = %13
  %22 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %16, align 8
  %23 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %22, i64 0, i32 1
  %24 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %23, align 8
  %25 = icmp eq %struct.BF_BitstreamElement* %24, null
  br i1 %25, label %26, label %27

; <label>:26:                                     ; preds = %21
  tail call void @__assert_fail(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 448, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__PRETTY_FUNCTION__.BF_newPartHolder, i64 0, i64 0)) #7
  unreachable

; <label>:27:                                     ; preds = %21, %13
  %28 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %16, align 8
  %29 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %28, i64 0, i32 0
  store i32 0, i32* %29, align 8
  ret %struct.BF_PartHolder* %3
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) local_unnamed_addr #4

; Function Attrs: noinline nounwind uwtable
define %struct.BF_PartHolder* @BF_NewHolderFromBitstreamPart(%struct.BF_BitstreamPart* nocapture readonly) local_unnamed_addr #1 {
  %2 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %0, i64 0, i32 0
  %3 = load i32, i32* %2, align 8
  %4 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 %3)
  %5 = tail call %struct.BF_PartHolder* @BF_LoadHolderFromBitstreamPart(%struct.BF_PartHolder* %4, %struct.BF_BitstreamPart* %0)
  ret %struct.BF_PartHolder* %5
}

; Function Attrs: noinline nounwind uwtable
define %struct.BF_PartHolder* @BF_LoadHolderFromBitstreamPart(%struct.BF_PartHolder*, %struct.BF_BitstreamPart* nocapture readonly) local_unnamed_addr #1 {
  %3 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %0, i64 0, i32 1
  %4 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %3, align 8
  %5 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %4, i64 0, i32 0
  store i32 0, i32* %5, align 8
  %6 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %1, i64 0, i32 0
  %7 = load i32, i32* %6, align 8
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %2
  %9 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %1, i64 0, i32 1
  br label %10

; <label>:10:                                     ; preds = %.lr.ph, %10
  %.03 = phi %struct.BF_PartHolder* [ %0, %.lr.ph ], [ %14, %10 ]
  %.012 = phi i32 [ 0, %.lr.ph ], [ %15, %10 ]
  %11 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %9, align 8
  %12 = zext i32 %.012 to i64
  %13 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %11, i64 %12
  %14 = tail call %struct.BF_PartHolder* @BF_addElement(%struct.BF_PartHolder* %.03, %struct.BF_BitstreamElement* %13)
  %15 = add i32 %.012, 1
  %16 = load i32, i32* %6, align 8
  %17 = icmp ult i32 %15, %16
  br i1 %17, label %10, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %10
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %.0.lcssa = phi %struct.BF_PartHolder* [ %0, %2 ], [ %14, %._crit_edge.loopexit ]
  ret %struct.BF_PartHolder* %.0.lcssa
}

; Function Attrs: noinline nounwind uwtable
define %struct.BF_PartHolder* @BF_addElement(%struct.BF_PartHolder*, %struct.BF_BitstreamElement* nocapture readonly) local_unnamed_addr #1 {
  %3 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %0, i64 0, i32 1
  %4 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %3, align 8
  %5 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %4, i64 0, i32 0
  %6 = load i32, i32* %5, align 8
  %7 = add i32 %6, 1
  %8 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %0, i64 0, i32 0
  %9 = load i32, i32* %8, align 8
  %10 = icmp sgt i32 %7, %9
  br i1 %10, label %11, label %14

; <label>:11:                                     ; preds = %2
  %12 = add i32 %6, 9
  %13 = tail call %struct.BF_PartHolder* @BF_resizePartHolder(%struct.BF_PartHolder* nonnull %0, i32 %12)
  br label %14

; <label>:14:                                     ; preds = %11, %2
  %.0 = phi %struct.BF_PartHolder* [ %13, %11 ], [ %0, %2 ]
  %15 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %.0, i64 0, i32 1
  %16 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %15, align 8
  %17 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %16, i64 0, i32 1
  %18 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %17, align 8
  %19 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %16, i64 0, i32 0
  %20 = load i32, i32* %19, align 8
  %21 = add i32 %20, 1
  store i32 %21, i32* %19, align 8
  %22 = zext i32 %20 to i64
  %23 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %18, i64 %22
  %24 = bitcast %struct.BF_BitstreamElement* %1 to i64*
  %25 = bitcast %struct.BF_BitstreamElement* %23 to i64*
  %26 = load i64, i64* %24, align 4
  store i64 %26, i64* %25, align 4
  ret %struct.BF_PartHolder* %.0
}

; Function Attrs: noinline nounwind uwtable
define noalias %struct.BF_PartHolder* @BF_resizePartHolder(%struct.BF_PartHolder* nocapture, i32) local_unnamed_addr #1 {
  %3 = tail call %struct.BF_PartHolder* @BF_newPartHolder(i32 %1)
  %4 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %0, i64 0, i32 0
  %5 = load i32, i32* %4, align 8
  %6 = icmp sgt i32 %5, %1
  %. = select i1 %6, i32 %1, i32 %5
  %7 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %3, i64 0, i32 1
  %8 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %7, align 8
  %9 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %8, i64 0, i32 0
  store i32 %., i32* %9, align 8
  %10 = icmp sgt i32 %., 0
  br i1 %10, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  %11 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %7, align 8
  %12 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %11, i64 0, i32 1
  %13 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %0, i64 0, i32 1
  %14 = sext i32 %. to i64
  %15 = icmp sgt i32 %5, %1
  %16 = select i1 %15, i32 %1, i32 %5
  %17 = add i32 %16, -1
  %xtraiter = and i32 %., 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %18 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %12, align 8
  %19 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %18, i64 %indvars.iv.prol
  %20 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %13, align 8
  %21 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %20, i64 0, i32 1
  %22 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %21, align 8
  %23 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %22, i64 %indvars.iv.prol
  %24 = bitcast %struct.BF_BitstreamElement* %23 to i64*
  %25 = bitcast %struct.BF_BitstreamElement* %19 to i64*
  %26 = load i64, i64* %24, align 4
  store i64 %26, i64* %25, align 4
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !6

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %27 = icmp ult i32 %17, 3
  br i1 %27, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %28 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %12, align 8
  %29 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %28, i64 %indvars.iv
  %30 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %13, align 8
  %31 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %30, i64 0, i32 1
  %32 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %31, align 8
  %33 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %32, i64 %indvars.iv
  %34 = bitcast %struct.BF_BitstreamElement* %33 to i64*
  %35 = bitcast %struct.BF_BitstreamElement* %29 to i64*
  %36 = load i64, i64* %34, align 4
  store i64 %36, i64* %35, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %37 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %12, align 8
  %38 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %37, i64 %indvars.iv.next
  %39 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %13, align 8
  %40 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %39, i64 0, i32 1
  %41 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %40, align 8
  %42 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %41, i64 %indvars.iv.next
  %43 = bitcast %struct.BF_BitstreamElement* %42 to i64*
  %44 = bitcast %struct.BF_BitstreamElement* %38 to i64*
  %45 = load i64, i64* %43, align 4
  store i64 %45, i64* %44, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %46 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %12, align 8
  %47 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %46, i64 %indvars.iv.next.1
  %48 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %13, align 8
  %49 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %48, i64 0, i32 1
  %50 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %49, align 8
  %51 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %50, i64 %indvars.iv.next.1
  %52 = bitcast %struct.BF_BitstreamElement* %51 to i64*
  %53 = bitcast %struct.BF_BitstreamElement* %47 to i64*
  %54 = load i64, i64* %52, align 4
  store i64 %54, i64* %53, align 4
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %55 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %12, align 8
  %56 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %55, i64 %indvars.iv.next.2
  %57 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %13, align 8
  %58 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %57, i64 0, i32 1
  %59 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %58, align 8
  %60 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %59, i64 %indvars.iv.next.2
  %61 = bitcast %struct.BF_BitstreamElement* %60 to i64*
  %62 = bitcast %struct.BF_BitstreamElement* %56 to i64*
  %63 = load i64, i64* %61, align 4
  store i64 %63, i64* %62, align 4
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %64 = icmp slt i64 %indvars.iv.next.3, %14
  br i1 %64, label %.lr.ph.new, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %2
  %65 = tail call %struct.BF_PartHolder* @BF_freePartHolder(%struct.BF_PartHolder* nonnull %0)
  ret %struct.BF_PartHolder* %3
}

; Function Attrs: noinline nounwind uwtable
define noalias %struct.BF_PartHolder* @BF_freePartHolder(%struct.BF_PartHolder* nocapture) local_unnamed_addr #1 {
  %2 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %0, i64 0, i32 1
  %3 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %2, align 8
  %4 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %3, i64 0, i32 1
  %5 = bitcast %struct.BF_BitstreamElement** %4 to i8**
  %6 = load i8*, i8** %5, align 8
  tail call void @free(i8* %6) #6
  %7 = bitcast %struct.BF_BitstreamPart** %2 to i8**
  %8 = load i8*, i8** %7, align 8
  tail call void @free(i8* %8) #6
  %9 = bitcast %struct.BF_PartHolder* %0 to i8*
  tail call void @free(i8* %9) #6
  ret %struct.BF_PartHolder* null
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #4

; Function Attrs: noinline nounwind uwtable
define %struct.BF_PartHolder* @BF_addEntry(%struct.BF_PartHolder*, i32, i32) local_unnamed_addr #1 {
  %4 = alloca %struct.BF_BitstreamElement, align 4
  %5 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %4, i64 0, i32 0
  store i32 %1, i32* %5, align 4
  %6 = trunc i32 %2 to i16
  %7 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %4, i64 0, i32 1
  store i16 %6, i16* %7, align 4
  %8 = icmp eq i32 %2, 0
  br i1 %8, label %11, label %9

; <label>:9:                                      ; preds = %3
  %10 = call %struct.BF_PartHolder* @BF_addElement(%struct.BF_PartHolder* %0, %struct.BF_BitstreamElement* nonnull %4)
  br label %11

; <label>:11:                                     ; preds = %3, %9
  %.0 = phi %struct.BF_PartHolder* [ %10, %9 ], [ %0, %3 ]
  ret %struct.BF_PartHolder* %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @writePartMainData(%struct.BF_BitstreamPart* readonly, %struct.BF_FrameResults* readnone) #1 {
  %3 = icmp eq %struct.BF_FrameResults* %1, null
  br i1 %3, label %4, label %5

; <label>:4:                                      ; preds = %2
  tail call void @__assert_fail(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 157, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.writePartMainData, i64 0, i64 0)) #7
  unreachable

; <label>:5:                                      ; preds = %2
  %6 = icmp eq %struct.BF_BitstreamPart* %0, null
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %5
  tail call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 158, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.writePartMainData, i64 0, i64 0)) #7
  unreachable

; <label>:8:                                      ; preds = %5
  %9 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %0, i64 0, i32 0
  %10 = load i32, i32* %9, align 8
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %8
  %12 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %0, i64 0, i32 1
  %13 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %12, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.05 = phi i32 [ %21, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %.014 = phi i32 [ %22, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %.023 = phi %struct.BF_BitstreamElement* [ %23, %.lr.ph ], [ %13, %.lr.ph.preheader ]
  %14 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %.023, i64 0, i32 0
  %15 = load i32, i32* %14, align 4
  %16 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %.023, i64 0, i32 1
  %17 = load i16, i16* %16, align 4
  %18 = zext i16 %17 to i32
  tail call fastcc void @WriteMainDataBits(i32 %15, i32 %18)
  %19 = load i16, i16* %16, align 4
  %20 = zext i16 %19 to i32
  %21 = add nsw i32 %20, %.05
  %22 = add i32 %.014, 1
  %23 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %.023, i64 1
  %24 = load i32, i32* %9, align 8
  %25 = icmp ult i32 %22, %24
  br i1 %25, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %8
  %.0.lcssa = phi i32 [ 0, %8 ], [ %21, %._crit_edge.loopexit ]
  ret i32 %.0.lcssa
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @write_side_info() unnamed_addr #1 {
  %1 = tail call fastcc %struct.MYSideInfo* @get_side_info()
  %2 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %1, i64 0, i32 0
  %3 = load i32, i32* %2, align 8
  store i32 %3, i32* @ThisFrameSize, align 4
  %4 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %1, i64 0, i32 4
  %5 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %4, align 8
  %6 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %5, i64 0, i32 1
  %7 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %6, align 8
  %8 = tail call i32 @writePartSideInfo(%struct.BF_BitstreamPart* %7)
  %9 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %1, i64 0, i32 5
  %10 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %9, align 8
  %11 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %10, i64 0, i32 1
  %12 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %11, align 8
  %13 = tail call i32 @writePartSideInfo(%struct.BF_BitstreamPart* %12)
  %14 = add nsw i32 %13, %8
  %15 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %1, i64 0, i32 3
  %16 = load i32, i32* %15, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %.lr.ph14.preheader, label %.preheader4

.lr.ph14.preheader:                               ; preds = %0
  br label %.lr.ph14

.preheader4.loopexit:                             ; preds = %.lr.ph14
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %0
  %.01.lcssa = phi i32 [ %14, %0 ], [ %26, %.preheader4.loopexit ]
  %18 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %1, i64 0, i32 2
  %19 = load i32, i32* %18, align 8
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %.preheader.preheader, label %._crit_edge9

.preheader.preheader:                             ; preds = %.preheader4
  br label %.preheader

.lr.ph14:                                         ; preds = %.lr.ph14.preheader, %.lr.ph14
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %.lr.ph14 ], [ 0, %.lr.ph14.preheader ]
  %.0112 = phi i32 [ %26, %.lr.ph14 ], [ %14, %.lr.ph14.preheader ]
  %21 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %1, i64 0, i32 6, i64 %indvars.iv20
  %22 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %21, align 8
  %23 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %22, i64 0, i32 1
  %24 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %23, align 8
  %25 = tail call i32 @writePartSideInfo(%struct.BF_BitstreamPart* %24)
  %26 = add nsw i32 %25, %.0112
  %indvars.iv.next21 = add nuw i64 %indvars.iv20, 1
  %27 = load i32, i32* %15, align 4
  %28 = sext i32 %27 to i64
  %29 = icmp slt i64 %indvars.iv.next21, %28
  br i1 %29, label %.lr.ph14, label %.preheader4.loopexit

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge ], [ 0, %.preheader.preheader ]
  %.17 = phi i32 [ %.2.lcssa, %._crit_edge ], [ %.01.lcssa, %.preheader.preheader ]
  %30 = load i32, i32* %15, align 4
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %.26 = phi i32 [ %37, %.lr.ph ], [ %.17, %.lr.ph.preheader ]
  %32 = getelementptr inbounds %struct.MYSideInfo, %struct.MYSideInfo* %1, i64 0, i32 7, i64 %indvars.iv18, i64 %indvars.iv
  %33 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %32, align 8
  %34 = getelementptr inbounds %struct.BF_PartHolder, %struct.BF_PartHolder* %33, i64 0, i32 1
  %35 = load %struct.BF_BitstreamPart*, %struct.BF_BitstreamPart** %34, align 8
  %36 = tail call i32 @writePartSideInfo(%struct.BF_BitstreamPart* %35)
  %37 = add nsw i32 %36, %.26
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %38 = load i32, i32* %15, align 4
  %39 = sext i32 %38 to i64
  %40 = icmp slt i64 %indvars.iv.next, %39
  br i1 %40, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.2.lcssa = phi i32 [ %.17, %.preheader ], [ %37, %._crit_edge.loopexit ]
  %indvars.iv.next19 = add nuw i64 %indvars.iv18, 1
  %41 = load i32, i32* %18, align 8
  %42 = sext i32 %41 to i64
  %43 = icmp slt i64 %indvars.iv.next19, %42
  br i1 %43, label %.preheader, label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.preheader4
  %.1.lcssa = phi i32 [ %.01.lcssa, %.preheader4 ], [ %.2.lcssa, %._crit_edge9.loopexit ]
  ret i32 %.1.lcssa
}

declare void @putMyBits(i32, i32) local_unnamed_addr #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @writePartSideInfo(%struct.BF_BitstreamPart* readonly) #1 {
  %2 = icmp eq %struct.BF_BitstreamPart* %0, null
  br i1 %2, label %3, label %4

; <label>:3:                                      ; preds = %1
  tail call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 176, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.writePartSideInfo, i64 0, i64 0)) #7
  unreachable

; <label>:4:                                      ; preds = %1
  %5 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %0, i64 0, i32 0
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %4
  %8 = getelementptr inbounds %struct.BF_BitstreamPart, %struct.BF_BitstreamPart* %0, i64 0, i32 1
  %9 = load %struct.BF_BitstreamElement*, %struct.BF_BitstreamElement** %8, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.03 = phi i32 [ %17, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %.012 = phi i32 [ %18, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %.021 = phi %struct.BF_BitstreamElement* [ %19, %.lr.ph ], [ %9, %.lr.ph.preheader ]
  %10 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %.021, i64 0, i32 0
  %11 = load i32, i32* %10, align 4
  %12 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %.021, i64 0, i32 1
  %13 = load i16, i16* %12, align 4
  %14 = zext i16 %13 to i32
  tail call void @putMyBits(i32 %11, i32 %14) #6
  %15 = load i16, i16* %12, align 4
  %16 = zext i16 %15 to i32
  %17 = add nsw i32 %16, %.03
  %18 = add i32 %.012, 1
  %19 = getelementptr inbounds %struct.BF_BitstreamElement, %struct.BF_BitstreamElement* %.021, i64 1
  %20 = load i32, i32* %5, align 8
  %21 = icmp ult i32 %18, %20
  br i1 %21, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  %.0.lcssa = phi i32 [ 0, %4 ], [ %17, %._crit_edge.loopexit ]
  ret i32 %.0.lcssa
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc %struct.MYSideInfo* @get_side_info() unnamed_addr #1 {
  %1 = load %struct.side_info_link*, %struct.side_info_link** @side_queue_head, align 8
  %2 = icmp eq %struct.side_info_link* %1, null
  br i1 %2, label %3, label %4

; <label>:3:                                      ; preds = %0
  tail call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.13, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 384, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @__PRETTY_FUNCTION__.get_side_info, i64 0, i64 0)) #7
  unreachable

; <label>:4:                                      ; preds = %0
  %5 = load i64, i64* bitcast (%struct.side_info_link** @side_queue_free to i64*), align 8
  %6 = bitcast %struct.side_info_link* %1 to i64*
  %7 = load i64, i64* %6, align 8
  store i64 %7, i64* bitcast (%struct.side_info_link** @side_queue_head to i64*), align 8
  store %struct.side_info_link* %1, %struct.side_info_link** @side_queue_free, align 8
  store i64 %5, i64* %6, align 8
  %8 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %1, i64 0, i32 1
  ret %struct.MYSideInfo* %8
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @free_side_info_link(%struct.side_info_link* nocapture) unnamed_addr #1 {
  %2 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %0, i64 0, i32 1, i32 4
  %3 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %2, align 8
  %4 = tail call %struct.BF_PartHolder* @BF_freePartHolder(%struct.BF_PartHolder* %3)
  store %struct.BF_PartHolder* null, %struct.BF_PartHolder** %2, align 8
  %5 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %0, i64 0, i32 1, i32 5
  %6 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %5, align 8
  %7 = tail call %struct.BF_PartHolder* @BF_freePartHolder(%struct.BF_PartHolder* %6)
  store %struct.BF_PartHolder* null, %struct.BF_PartHolder** %5, align 8
  %8 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %0, i64 0, i32 1, i32 3
  %9 = load i32, i32* %8, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %.lr.ph8.preheader, label %.preheader2

.lr.ph8.preheader:                                ; preds = %1
  br label %.lr.ph8

.preheader2.loopexit:                             ; preds = %.lr.ph8
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.loopexit, %1
  %11 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %0, i64 0, i32 1, i32 2
  %12 = load i32, i32* %11, align 8
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %.preheader.preheader, label %._crit_edge5

.preheader.preheader:                             ; preds = %.preheader2
  br label %.preheader

.lr.ph8:                                          ; preds = %.lr.ph8.preheader, %.lr.ph8
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %.lr.ph8 ], [ 0, %.lr.ph8.preheader ]
  %14 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %0, i64 0, i32 1, i32 6, i64 %indvars.iv11
  %15 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %14, align 8
  %16 = tail call %struct.BF_PartHolder* @BF_freePartHolder(%struct.BF_PartHolder* %15)
  store %struct.BF_PartHolder* null, %struct.BF_PartHolder** %14, align 8
  %indvars.iv.next12 = add nuw i64 %indvars.iv11, 1
  %17 = load i32, i32* %8, align 4
  %18 = sext i32 %17 to i64
  %19 = icmp slt i64 %indvars.iv.next12, %18
  br i1 %19, label %.lr.ph8, label %.preheader2.loopexit

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge ], [ 0, %.preheader.preheader ]
  %20 = load i32, i32* %8, align 4
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %22 = getelementptr inbounds %struct.side_info_link, %struct.side_info_link* %0, i64 0, i32 1, i32 7, i64 %indvars.iv9, i64 %indvars.iv
  %23 = load %struct.BF_PartHolder*, %struct.BF_PartHolder** %22, align 8
  %24 = tail call %struct.BF_PartHolder* @BF_freePartHolder(%struct.BF_PartHolder* %23)
  store %struct.BF_PartHolder* null, %struct.BF_PartHolder** %22, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %25 = load i32, i32* %8, align 4
  %26 = sext i32 %25 to i64
  %27 = icmp slt i64 %indvars.iv.next, %26
  br i1 %27, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %indvars.iv.next10 = add nuw i64 %indvars.iv9, 1
  %28 = load i32, i32* %11, align 8
  %29 = sext i32 %28 to i64
  %30 = icmp slt i64 %indvars.iv.next10, %29
  br i1 %30, label %.preheader, label %._crit_edge5.loopexit

._crit_edge5.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %.preheader2
  %31 = bitcast %struct.side_info_link* %0 to i8*
  tail call void @free(i8* %31) #6
  ret void
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.unroll.disable"}
