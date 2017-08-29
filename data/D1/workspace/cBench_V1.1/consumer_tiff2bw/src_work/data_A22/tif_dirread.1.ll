; ModuleID = 'tif_dirread.ll'
source_filename = "tif_dirread.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, {}*, i32 (%struct.tiff*, i16)*, {}*, i32 (%struct.tiff*, i16)*, {}*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.TIFFDirEntry = type { i16, i16, i32, i32 }

@.str = private unnamed_addr constant [36 x i8] c"Seek error accessing TIFF directory\00", align 1
@.str.1 = private unnamed_addr constant [34 x i8] c"Can not read TIFF directory count\00", align 1
@.str.2 = private unnamed_addr constant [23 x i8] c"to read TIFF directory\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"Can not read TIFF directory\00", align 1
@.str.4 = private unnamed_addr constant [63 x i8] c"invalid TIFF directory; tags are not sorted in ascending order\00", align 1
@.str.5 = private unnamed_addr constant [41 x i8] c"unknown field with tag %d (0x%x) ignored\00", align 1
@.str.6 = private unnamed_addr constant [41 x i8] c"wrong data type %d for \22%s\22; tag ignored\00", align 1
@.str.7 = private unnamed_addr constant [12 x i8] c"ImageLength\00", align 1
@.str.8 = private unnamed_addr constant [20 x i8] c"PlanarConfiguration\00", align 1
@.str.9 = private unnamed_addr constant [12 x i8] c"TileOffsets\00", align 1
@.str.10 = private unnamed_addr constant [13 x i8] c"StripOffsets\00", align 1
@.str.11 = private unnamed_addr constant [31 x i8] c"to read \22TransferFunction\22 tag\00", align 1
@.str.12 = private unnamed_addr constant [9 x i8] c"Colormap\00", align 1
@.str.13 = private unnamed_addr constant [16 x i8] c"StripByteCounts\00", align 1
@.str.14 = private unnamed_addr constant [76 x i8] c"TIFF directory is missing required \22%s\22 field, calculating from imagelength\00", align 1
@.str.15 = private unnamed_addr constant [60 x i8] c"Bogus \22%s\22 field, ignoring and calculating from imagelength\00", align 1
@.str.16 = private unnamed_addr constant [12 x i8] c"No space %s\00", align 1
@.str.17 = private unnamed_addr constant [28 x i8] c"for \22StripByteCounts\22 array\00", align 1
@tiffDataWidth = external local_unnamed_addr constant [0 x i32], align 4
@.str.18 = private unnamed_addr constant [46 x i8] c"TIFF directory is missing required \22%s\22 field\00", align 1
@.str.19 = private unnamed_addr constant [65 x i8] c"incorrect count for field \22%s\22 (%lu, expecting %lu); tag ignored\00", align 1
@.str.20 = private unnamed_addr constant [35 x i8] c"Error fetching data for field \22%s\22\00", align 1
@TIFFFetchNormalTag.mesg = internal constant [19 x i8] c"to fetch tag value\00", align 16
@.str.21 = private unnamed_addr constant [28 x i8] c"to fetch array of rationals\00", align 1
@.str.22 = private unnamed_addr constant [47 x i8] c"%s: Rational with zero denominator (num = %lu)\00", align 1
@.str.23 = private unnamed_addr constant [57 x i8] c"Cannot handle different per-sample values for field \22%s\22\00", align 1
@.str.24 = private unnamed_addr constant [44 x i8] c"Cannot read TIFF_ANY type %d for field \22%s\22\00", align 1
@.str.25 = private unnamed_addr constant [16 x i8] c"for strip array\00", align 1
@.str.26 = private unnamed_addr constant [19 x i8] c"to fetch strip tag\00", align 1
@TIFFFetchRefBlackWhite.mesg = internal constant [32 x i8] c"for \22ReferenceBlackWhite\22 array\00", align 16
@.str.27 = private unnamed_addr constant [36 x i8] c"for chopped \22StripByteCounts\22 array\00", align 1
@.str.28 = private unnamed_addr constant [33 x i8] c"for chopped \22StripOffsets\22 array\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadDirectory(%struct.tiff*) local_unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = alloca double, align 8
  %4 = alloca i16, align 2
  %5 = alloca i32, align 4
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 5
  %7 = load i32, i32* %6, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 4
  store i32 %7, i32* %8, align 4
  %9 = icmp eq i32 %7, 0
  br i1 %9, label %638, label %10

; <label>:10:                                     ; preds = %1
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 34
  %12 = load void (%struct.tiff*)*, void (%struct.tiff*)** %11, align 8
  tail call void %12(%struct.tiff* nonnull %0) #3
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 12
  %14 = load i16, i16* %13, align 4
  %15 = add i16 %14, 1
  store i16 %15, i16* %13, align 4
  store i32 0, i32* %5, align 4
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %17 = load i32, i32* %16, align 8
  %18 = and i32 %17, 2048
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %74

; <label>:20:                                     ; preds = %10
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 51
  %22 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %21, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 48
  %24 = load i8*, i8** %23, align 8
  %25 = load i32, i32* %8, align 4
  %26 = tail call i32 %22(i8* %24, i32 %25, i32 0) #3
  %27 = load i32, i32* %8, align 4
  %28 = icmp eq i32 %26, %27
  br i1 %28, label %32, label %29

; <label>:29:                                     ; preds = %20
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %31 = load i8*, i8** %30, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %31, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str, i64 0, i64 0)) #3
  br label %638

; <label>:32:                                     ; preds = %20
  %33 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 49
  %34 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %33, align 8
  %35 = load i8*, i8** %23, align 8
  %36 = bitcast i16* %4 to i8*
  %37 = call i32 %34(i8* %35, i8* nonnull %36, i32 2) #3
  %38 = icmp eq i32 %37, 2
  br i1 %38, label %42, label %39

; <label>:39:                                     ; preds = %32
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %41 = load i8*, i8** %40, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %41, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1, i64 0, i64 0)) #3
  br label %638

; <label>:42:                                     ; preds = %32
  %43 = load i32, i32* %16, align 8
  %44 = trunc i32 %43 to i8
  %45 = icmp slt i8 %44, 0
  br i1 %45, label %46, label %47

; <label>:46:                                     ; preds = %42
  call void @TIFFSwabShort(i16* nonnull %4) #3
  br label %47

; <label>:47:                                     ; preds = %46, %42
  %48 = load i16, i16* %4, align 2
  %49 = zext i16 %48 to i32
  %50 = mul nuw nsw i32 %49, 12
  %51 = call fastcc i8* @CheckMalloc(%struct.tiff* nonnull %0, i32 %50, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.2, i64 0, i64 0))
  %52 = bitcast i8* %51 to %struct.TIFFDirEntry*
  %53 = icmp eq i8* %51, null
  br i1 %53, label %638, label %54

; <label>:54:                                     ; preds = %47
  %55 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %33, align 8
  %56 = load i8*, i8** %23, align 8
  %57 = load i16, i16* %4, align 2
  %58 = zext i16 %57 to i32
  %59 = mul nuw nsw i32 %58, 12
  %60 = call i32 %55(i8* %56, i8* nonnull %51, i32 %59) #3
  %61 = sext i32 %60 to i64
  %62 = load i16, i16* %4, align 2
  %63 = zext i16 %62 to i64
  %64 = mul nuw nsw i64 %63, 12
  %65 = icmp eq i64 %61, %64
  br i1 %65, label %69, label %66

; <label>:66:                                     ; preds = %54
  %67 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %68 = load i8*, i8** %67, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %68, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i64 0, i64 0)) #3
  br label %.loopexit

; <label>:69:                                     ; preds = %54
  %70 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %33, align 8
  %71 = load i8*, i8** %23, align 8
  %72 = bitcast i32* %5 to i8*
  %73 = call i32 %70(i8* %71, i8* nonnull %72, i32 4) #3
  br label %126

; <label>:74:                                     ; preds = %10
  %75 = load i32, i32* %8, align 4
  %76 = add i32 %75, 2
  %77 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 45
  %78 = load i32, i32* %77, align 8
  %79 = icmp sgt i32 %76, %78
  br i1 %79, label %80, label %83

; <label>:80:                                     ; preds = %74
  %81 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %82 = load i8*, i8** %81, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %82, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1, i64 0, i64 0)) #3
  br label %638

; <label>:83:                                     ; preds = %74
  %84 = bitcast i16* %4 to i8*
  %85 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 44
  %86 = load i8*, i8** %85, align 8
  %87 = sext i32 %75 to i64
  %88 = getelementptr inbounds i8, i8* %86, i64 %87
  call void @_TIFFmemcpy(i8* nonnull %84, i8* %88, i32 2) #3
  %89 = load i32, i32* %16, align 8
  %90 = trunc i32 %89 to i8
  %91 = icmp slt i8 %90, 0
  br i1 %91, label %92, label %93

; <label>:92:                                     ; preds = %83
  call void @TIFFSwabShort(i16* nonnull %4) #3
  br label %93

; <label>:93:                                     ; preds = %92, %83
  %94 = load i16, i16* %4, align 2
  %95 = zext i16 %94 to i32
  %96 = mul nuw nsw i32 %95, 12
  %97 = call fastcc i8* @CheckMalloc(%struct.tiff* nonnull %0, i32 %96, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.2, i64 0, i64 0))
  %98 = bitcast i8* %97 to %struct.TIFFDirEntry*
  %99 = icmp eq i8* %97, null
  br i1 %99, label %638, label %100

; <label>:100:                                    ; preds = %93
  %101 = load i16, i16* %4, align 2
  %102 = zext i16 %101 to i32
  %103 = mul nuw nsw i32 %102, 12
  %104 = add i32 %103, %76
  %105 = load i32, i32* %77, align 8
  %106 = icmp sgt i32 %104, %105
  br i1 %106, label %107, label %110

; <label>:107:                                    ; preds = %100
  %108 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %109 = load i8*, i8** %108, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %109, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i64 0, i64 0)) #3
  br label %.loopexit

; <label>:110:                                    ; preds = %100
  %111 = load i8*, i8** %85, align 8
  %112 = sext i32 %76 to i64
  %113 = getelementptr inbounds i8, i8* %111, i64 %112
  call void @_TIFFmemcpy(i8* nonnull %97, i8* %113, i32 %103) #3
  %114 = load i16, i16* %4, align 2
  %115 = zext i16 %114 to i32
  %116 = mul nuw nsw i32 %115, 12
  %117 = add i32 %116, %76
  %118 = add i32 %117, 4
  %119 = load i32, i32* %77, align 8
  %120 = icmp sgt i32 %118, %119
  br i1 %120, label %126, label %121

; <label>:121:                                    ; preds = %110
  %122 = sext i32 %117 to i64
  %123 = bitcast i32* %5 to i8*
  %124 = load i8*, i8** %85, align 8
  %125 = getelementptr inbounds i8, i8* %124, i64 %122
  call void @_TIFFmemcpy(i8* nonnull %123, i8* %125, i32 4) #3
  br label %126

; <label>:126:                                    ; preds = %121, %110, %69
  %127 = phi i8* [ %51, %69 ], [ %97, %110 ], [ %97, %121 ]
  %.08 = phi %struct.TIFFDirEntry* [ %52, %69 ], [ %98, %110 ], [ %98, %121 ]
  %128 = load i32, i32* %16, align 8
  %129 = trunc i32 %128 to i8
  %130 = icmp slt i8 %129, 0
  br i1 %130, label %131, label %132

; <label>:131:                                    ; preds = %126
  call void @TIFFSwabLong(i32* nonnull %5) #3
  br label %132

; <label>:132:                                    ; preds = %131, %126
  %133 = load i32, i32* %5, align 4
  store i32 %133, i32* %6, align 8
  %134 = load i32, i32* %16, align 8
  %135 = and i32 %134, -65
  store i32 %135, i32* %16, align 8
  call void @TIFFFreeDirectory(%struct.tiff* nonnull %0) #3
  %136 = call i32 @TIFFDefaultDirectory(%struct.tiff* nonnull %0) #3
  %137 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %0, i32 284, i32 1) #3
  %138 = load i16, i16* %4, align 2
  %139 = icmp eq i16 %138, 0
  br i1 %139, label %._crit_edge70, label %.lr.ph74.preheader

.lr.ph74.preheader:                               ; preds = %132
  %140 = zext i16 %138 to i32
  br label %.lr.ph74

.lr.ph74:                                         ; preds = %.lr.ph74.preheader, %155
  %.0172 = phi %struct.TIFFDirEntry* [ %157, %155 ], [ %.08, %.lr.ph74.preheader ]
  %.0271 = phi i32 [ %156, %155 ], [ %140, %.lr.ph74.preheader ]
  %141 = load i32, i32* %16, align 8
  %142 = trunc i32 %141 to i8
  %143 = icmp slt i8 %142, 0
  br i1 %143, label %144, label %147

; <label>:144:                                    ; preds = %.lr.ph74
  %145 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.0172, i64 0, i32 0
  call void @TIFFSwabArrayOfShort(i16* %145, i64 2) #3
  %146 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.0172, i64 0, i32 2
  call void @TIFFSwabArrayOfLong(i32* %146, i64 2) #3
  br label %147

; <label>:147:                                    ; preds = %144, %.lr.ph74
  %148 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.0172, i64 0, i32 0
  %149 = load i16, i16* %148, align 4
  %150 = icmp eq i16 %149, 277
  br i1 %150, label %151, label %155

; <label>:151:                                    ; preds = %147
  %152 = call fastcc i32 @TIFFFetchNormalTag(%struct.tiff* nonnull %0, %struct.TIFFDirEntry* nonnull %.0172)
  %153 = icmp eq i32 %152, 0
  br i1 %153, label %.loopexit.loopexit90, label %154

; <label>:154:                                    ; preds = %151
  store i16 0, i16* %148, align 4
  br label %155

; <label>:155:                                    ; preds = %147, %154
  %156 = add nsw i32 %.0271, -1
  %157 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.0172, i64 1
  %158 = icmp sgt i32 %.0271, 1
  br i1 %158, label %.lr.ph74, label %._crit_edge75

._crit_edge75:                                    ; preds = %155
  %.pr80 = load i16, i16* %4, align 2
  %159 = icmp eq i16 %.pr80, 0
  br i1 %159, label %._crit_edge70, label %.lr.ph69

.lr.ph69:                                         ; preds = %._crit_edge75
  %160 = zext i16 %.pr80 to i32
  %161 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 55
  %162 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %163 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 56
  %164 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %165 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 7, i32 0
  %166 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 9
  %167 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 10
  %168 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %169 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  br label %170

; <label>:170:                                    ; preds = %.lr.ph69, %324
  %.165 = phi %struct.TIFFDirEntry* [ %.08, %.lr.ph69 ], [ %326, %324 ]
  %.1364 = phi i32 [ %160, %.lr.ph69 ], [ %325, %324 ]
  %.0563 = phi i32 [ 0, %.lr.ph69 ], [ %.3, %324 ]
  %.01362 = phi i32 [ 0, %.lr.ph69 ], [ %.5, %324 ]
  %171 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.165, i64 0, i32 0
  %172 = load i16, i16* %171, align 4
  %173 = zext i16 %172 to i32
  %174 = call i32 @TIFFReassignTagToIgnore(i32 1, i32 %173) #3
  %175 = icmp eq i32 %174, 0
  br i1 %175, label %176, label %.thread

.thread:                                          ; preds = %170
  store i16 0, i16* %171, align 4
  br label %324

; <label>:176:                                    ; preds = %170
  %.pr = load i16, i16* %171, align 4
  %177 = icmp eq i16 %.pr, 0
  br i1 %177, label %324, label %178

; <label>:178:                                    ; preds = %176
  %179 = zext i16 %.pr to i32
  %180 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %161, align 8
  %181 = sext i32 %.01362 to i64
  %182 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %180, i64 %181
  %183 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %182, align 8
  %184 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %183, i64 0, i32 0
  %185 = load i32, i32* %184, align 8
  %186 = icmp ult i32 %179, %185
  br i1 %186, label %187, label %191

; <label>:187:                                    ; preds = %178
  %188 = icmp eq i32 %.0563, 0
  br i1 %188, label %189, label %191

; <label>:189:                                    ; preds = %187
  %190 = load i8*, i8** %162, align 8
  call void (i8*, i8*, ...) @TIFFWarning(i8* %190, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.4, i64 0, i64 0)) #3
  br label %191

; <label>:191:                                    ; preds = %189, %187, %178
  %.114 = phi i32 [ %.01362, %178 ], [ 0, %187 ], [ 0, %189 ]
  %.27 = phi i32 [ %.0563, %178 ], [ %.0563, %187 ], [ 1, %189 ]
  %192 = load i32, i32* %163, align 8
  %193 = icmp slt i32 %.114, %192
  br i1 %193, label %.lr.ph57, label %.critedge

.lr.ph57:                                         ; preds = %191
  %194 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %161, align 8
  %195 = load i16, i16* %171, align 4
  %196 = zext i16 %195 to i32
  %197 = sext i32 %.114 to i64
  br label %198

; <label>:198:                                    ; preds = %.lr.ph57, %205
  %indvars.iv = phi i64 [ %197, %.lr.ph57 ], [ %indvars.iv.next, %205 ]
  %.21555 = phi i32 [ %.114, %.lr.ph57 ], [ %206, %205 ]
  %199 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %194, i64 %indvars.iv
  %200 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %199, align 8
  %201 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %200, i64 0, i32 0
  %202 = load i32, i32* %201, align 8
  %203 = icmp ult i32 %202, %196
  %204 = trunc i64 %indvars.iv to i32
  br i1 %203, label %205, label %.critedge.loopexit

; <label>:205:                                    ; preds = %198
  %indvars.iv.next = add i64 %indvars.iv, 1
  %206 = add nsw i32 %.21555, 1
  %207 = load i32, i32* %163, align 8
  %208 = sext i32 %207 to i64
  %209 = icmp slt i64 %indvars.iv.next, %208
  br i1 %209, label %198, label %.critedge.loopexit

.critedge.loopexit:                               ; preds = %205, %198
  %.215.lcssa.ph = phi i32 [ %206, %205 ], [ %204, %198 ]
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %191
  %.215.lcssa = phi i32 [ %.114, %191 ], [ %.215.lcssa.ph, %.critedge.loopexit ]
  %210 = load i32, i32* %163, align 8
  %211 = icmp eq i32 %.215.lcssa, %210
  br i1 %211, label %222, label %212

; <label>:212:                                    ; preds = %.critedge
  %213 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %161, align 8
  %214 = sext i32 %.215.lcssa to i64
  %215 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %213, i64 %214
  %216 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %215, align 8
  %217 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %216, i64 0, i32 0
  %218 = load i32, i32* %217, align 8
  %219 = load i16, i16* %171, align 4
  %220 = zext i16 %219 to i32
  %221 = icmp eq i32 %218, %220
  br i1 %221, label %226, label %222

; <label>:222:                                    ; preds = %212, %.critedge
  %223 = load i8*, i8** %164, align 8
  %224 = load i16, i16* %171, align 4
  %225 = zext i16 %224 to i32
  call void (i8*, i8*, ...) @TIFFWarning(i8* %223, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.5, i64 0, i64 0), i32 %225, i32 %225) #3
  store i16 0, i16* %171, align 4
  br label %324

; <label>:226:                                    ; preds = %212
  %227 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %216, i64 0, i32 4
  %228 = load i16, i16* %227, align 4
  %229 = icmp eq i16 %228, 0
  br i1 %229, label %232, label %.preheader

.preheader:                                       ; preds = %226
  %230 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.165, i64 0, i32 1
  %231 = load i16, i16* %230, align 2
  br label %233

; <label>:232:                                    ; preds = %264, %226, %250
  %.316 = phi i32 [ %241, %250 ], [ %.215.lcssa, %226 ], [ %.4, %264 ]
  store i16 0, i16* %171, align 4
  br label %324

; <label>:233:                                    ; preds = %.preheader, %244
  %.4 = phi i32 [ %241, %244 ], [ %.215.lcssa, %.preheader ]
  %.012 = phi %struct.TIFFFieldInfo* [ %240, %244 ], [ %216, %.preheader ]
  %234 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %.012, i64 0, i32 3
  %235 = load i32, i32* %234, align 8
  %236 = trunc i32 %235 to i16
  %237 = icmp eq i16 %231, %236
  %238 = icmp eq i32 %235, 0
  %or.cond = or i1 %238, %237
  br i1 %or.cond, label %256, label %239

; <label>:239:                                    ; preds = %233
  %240 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %.012, i64 1
  %241 = add nsw i32 %.4, 1
  %242 = load i32, i32* %163, align 8
  %243 = icmp eq i32 %241, %242
  br i1 %243, label %250, label %244

; <label>:244:                                    ; preds = %239
  %245 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %240, i64 0, i32 0
  %246 = load i32, i32* %245, align 8
  %247 = load i16, i16* %171, align 4
  %248 = zext i16 %247 to i32
  %249 = icmp eq i32 %246, %248
  br i1 %249, label %233, label %250

; <label>:250:                                    ; preds = %244, %239
  %251 = load i8*, i8** %169, align 8
  %252 = load i16, i16* %230, align 2
  %253 = zext i16 %252 to i32
  %254 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %.012, i64 0, i32 7
  %255 = load i8*, i8** %254, align 8
  call void (i8*, i8*, ...) @TIFFWarning(i8* %251, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.6, i64 0, i64 0), i32 %253, i8* %255) #3
  br label %232

; <label>:256:                                    ; preds = %233
  %257 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %.012, i64 0, i32 1
  %258 = load i16, i16* %257, align 4
  switch i16 %258, label %262 [
    i16 -1, label %268
    i16 -2, label %259
  ]

; <label>:259:                                    ; preds = %256
  %260 = load i16, i16* %168, align 2
  %261 = zext i16 %260 to i32
  br label %264

; <label>:262:                                    ; preds = %256
  %263 = sext i16 %258 to i32
  br label %264

; <label>:264:                                    ; preds = %262, %259
  %265 = phi i32 [ %261, %259 ], [ %263, %262 ]
  %266 = call fastcc i32 @CheckDirCount(%struct.tiff* nonnull %0, %struct.TIFFDirEntry* nonnull %.165, i32 %265)
  %267 = icmp eq i32 %266, 0
  br i1 %267, label %232, label %268

; <label>:268:                                    ; preds = %256, %264
  %269 = load i16, i16* %171, align 4
  switch i16 %269, label %324 [
    i16 259, label %270
    i16 273, label %309
    i16 279, label %309
    i16 324, label %309
    i16 325, label %309
    i16 256, label %319
    i16 257, label %319
    i16 -32539, label %319
    i16 323, label %319
    i16 322, label %319
    i16 -32538, label %319
    i16 284, label %319
    i16 278, label %319
    i16 338, label %323
  ]

; <label>:270:                                    ; preds = %268
  %271 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.165, i64 0, i32 2
  %272 = load i32, i32* %271, align 4
  %273 = icmp eq i32 %272, 1
  br i1 %273, label %274, label %299

; <label>:274:                                    ; preds = %270
  %275 = load i16, i16* %165, align 8
  %276 = icmp eq i16 %275, 19789
  %277 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.165, i64 0, i32 3
  %278 = load i32, i32* %277, align 4
  br i1 %276, label %279, label %286

; <label>:279:                                    ; preds = %274
  %280 = load i32*, i32** %166, align 8
  %281 = load i16, i16* %230, align 2
  %282 = zext i16 %281 to i64
  %283 = getelementptr inbounds i32, i32* %280, i64 %282
  %284 = load i32, i32* %283, align 4
  %285 = lshr i32 %278, %284
  br label %286

; <label>:286:                                    ; preds = %274, %279
  %.sink24 = phi i32 [ %285, %279 ], [ %278, %274 ]
  %287 = zext i32 %.sink24 to i64
  %288 = load i64*, i64** %167, align 8
  %289 = load i16, i16* %230, align 2
  %290 = zext i16 %289 to i64
  %291 = getelementptr inbounds i64, i64* %288, i64 %290
  %292 = load i64, i64* %291, align 8
  %293 = and i64 %292, %287
  %294 = trunc i64 %293 to i32
  %295 = load i16, i16* %171, align 4
  %296 = zext i16 %295 to i32
  %297 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %0, i32 %296, i32 %294) #3
  %298 = icmp eq i32 %297, 0
  br i1 %298, label %.loopexit.loopexit89, label %324

; <label>:299:                                    ; preds = %270
  %300 = call fastcc i32 @TIFFFetchPerSampleShorts(%struct.tiff* nonnull %0, %struct.TIFFDirEntry* nonnull %.165, i32* nonnull %2)
  %301 = icmp eq i32 %300, 0
  br i1 %301, label %.loopexit.loopexit89, label %302

; <label>:302:                                    ; preds = %299
  %303 = load i16, i16* %171, align 4
  %304 = zext i16 %303 to i32
  %305 = load i32, i32* %2, align 4
  %306 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %0, i32 %304, i32 %305) #3
  %307 = icmp eq i32 %306, 0
  br i1 %307, label %.loopexit.loopexit89, label %308

; <label>:308:                                    ; preds = %302
  store i16 0, i16* %171, align 4
  br label %324

; <label>:309:                                    ; preds = %268, %268, %268, %268
  %310 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %.012, i64 0, i32 4
  %311 = load i16, i16* %310, align 4
  %312 = and i16 %311, 31
  %313 = zext i16 %312 to i64
  %314 = shl i64 1, %313
  %div = lshr i16 %311, 5
  %315 = zext i16 %div to i64
  %316 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 %315
  %317 = load i64, i64* %316, align 8
  %318 = or i64 %314, %317
  store i64 %318, i64* %316, align 8
  br label %324

; <label>:319:                                    ; preds = %268, %268, %268, %268, %268, %268, %268, %268
  %320 = call fastcc i32 @TIFFFetchNormalTag(%struct.tiff* nonnull %0, %struct.TIFFDirEntry* nonnull %.165)
  %321 = icmp eq i32 %320, 0
  br i1 %321, label %.loopexit.loopexit89, label %322

; <label>:322:                                    ; preds = %319
  store i16 0, i16* %171, align 4
  br label %324

; <label>:323:                                    ; preds = %268
  call fastcc void @TIFFFetchExtraSamples(%struct.tiff* nonnull %0, %struct.TIFFDirEntry* nonnull %.165)
  store i16 0, i16* %171, align 4
  br label %324

; <label>:324:                                    ; preds = %.thread, %268, %308, %309, %322, %323, %286, %176, %232, %222
  %.5 = phi i32 [ 0, %222 ], [ %.316, %232 ], [ %.01362, %176 ], [ %.4, %286 ], [ %.4, %323 ], [ %.4, %322 ], [ %.4, %309 ], [ %.4, %308 ], [ %.4, %268 ], [ %.01362, %.thread ]
  %.3 = phi i32 [ %.27, %222 ], [ %.27, %232 ], [ %.0563, %176 ], [ %.27, %286 ], [ %.27, %323 ], [ %.27, %322 ], [ %.27, %309 ], [ %.27, %308 ], [ %.27, %268 ], [ %.0563, %.thread ]
  %325 = add nsw i32 %.1364, -1
  %326 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.165, i64 1
  %327 = icmp sgt i32 %.1364, 1
  br i1 %327, label %170, label %._crit_edge70.loopexit

._crit_edge70.loopexit:                           ; preds = %324
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %._crit_edge70.loopexit, %132, %._crit_edge75
  %328 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 0
  %329 = load i64, i64* %328, align 8
  %330 = and i64 %329, 2
  %331 = icmp eq i64 %330, 0
  br i1 %331, label %332, label %333

; <label>:332:                                    ; preds = %._crit_edge70
  call fastcc void @MissingRequired(%struct.tiff* nonnull %0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.7, i64 0, i64 0))
  br label %.loopexit

; <label>:333:                                    ; preds = %._crit_edge70
  %334 = and i64 %329, 1048576
  %335 = icmp eq i64 %334, 0
  br i1 %335, label %336, label %337

; <label>:336:                                    ; preds = %333
  call fastcc void @MissingRequired(%struct.tiff* nonnull %0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0))
  br label %.loopexit

; <label>:337:                                    ; preds = %333
  %338 = and i64 %329, 4
  %339 = icmp eq i64 %338, 0
  br i1 %339, label %340, label %354

; <label>:340:                                    ; preds = %337
  %341 = call i32 @TIFFNumberOfStrips(%struct.tiff* nonnull %0) #3
  %342 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  store i32 %341, i32* %342, align 4
  %343 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %344 = load i32, i32* %343, align 8
  %345 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 4
  store i32 %344, i32* %345, align 4
  %346 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %347 = load i32, i32* %346, align 4
  %348 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 5
  store i32 %347, i32* %348, align 8
  %349 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 3
  %350 = load i32, i32* %349, align 8
  %351 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 6
  store i32 %350, i32* %351, align 4
  %352 = load i32, i32* %16, align 8
  %353 = and i32 %352, -1025
  br label %359

; <label>:354:                                    ; preds = %337
  %355 = call i32 @TIFFNumberOfTiles(%struct.tiff* nonnull %0) #3
  %356 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  store i32 %355, i32* %356, align 4
  %357 = load i32, i32* %16, align 8
  %358 = or i32 %357, 1024
  br label %359

; <label>:359:                                    ; preds = %354, %340
  %.sink = phi i32 [ %358, %354 ], [ %353, %340 ]
  store i32 %.sink, i32* %16, align 8
  %360 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  %361 = load i32, i32* %360, align 4
  %362 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 42
  store i32 %361, i32* %362, align 8
  %363 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %364 = load i16, i16* %363, align 2
  %365 = icmp eq i16 %364, 2
  br i1 %365, label %366, label %371

; <label>:366:                                    ; preds = %359
  %367 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %368 = load i16, i16* %367, align 2
  %369 = zext i16 %368 to i32
  %370 = udiv i32 %361, %369
  store i32 %370, i32* %362, align 8
  br label %371

; <label>:371:                                    ; preds = %366, %359
  %372 = load i64, i64* %328, align 8
  %373 = and i64 %372, 33554432
  %374 = icmp eq i64 %373, 0
  br i1 %374, label %375, label %380

; <label>:375:                                    ; preds = %371
  %376 = load i32, i32* %16, align 8
  %377 = and i32 %376, 1024
  %378 = icmp ne i32 %377, 0
  %379 = select i1 %378, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0)
  call fastcc void @MissingRequired(%struct.tiff* nonnull %0, i8* %379)
  br label %.loopexit

; <label>:380:                                    ; preds = %371
  %381 = load i16, i16* %4, align 2
  %382 = icmp eq i16 %381, 0
  br i1 %382, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %380
  %383 = zext i16 %381 to i32
  %384 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 7, i32 0
  %385 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 9
  %386 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 10
  %387 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 44
  %388 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 45
  %389 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %390 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 7, i32 0
  %391 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 9
  %392 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 10
  br label %393

; <label>:393:                                    ; preds = %.lr.ph, %524
  %.252 = phi %struct.TIFFDirEntry* [ %.08, %.lr.ph ], [ %526, %524 ]
  %.2451 = phi i32 [ %383, %.lr.ph ], [ %525, %524 ]
  %394 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.252, i64 0, i32 0
  %395 = load i16, i16* %394, align 4
  switch i16 %395, label %522 [
    i16 0, label %524
    i16 280, label %396
    i16 281, label %396
    i16 258, label %396
    i16 -32540, label %427
    i16 339, label %427
    i16 340, label %436
    i16 341, label %436
    i16 273, label %445
    i16 324, label %445
    i16 279, label %450
    i16 325, label %450
    i16 320, label %455
    i16 301, label %455
    i16 297, label %493
    i16 321, label %493
    i16 530, label %493
    i16 336, label %493
    i16 532, label %494
    i16 255, label %495
  ]

; <label>:396:                                    ; preds = %393, %393, %393
  %397 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.252, i64 0, i32 2
  %398 = load i32, i32* %397, align 4
  %399 = icmp eq i32 %398, 1
  br i1 %399, label %400, label %427

; <label>:400:                                    ; preds = %396
  %401 = load i16, i16* %384, align 8
  %402 = icmp eq i16 %401, 19789
  %403 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.252, i64 0, i32 3
  %404 = load i32, i32* %403, align 4
  br i1 %402, label %405, label %413

; <label>:405:                                    ; preds = %400
  %406 = load i32*, i32** %385, align 8
  %407 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.252, i64 0, i32 1
  %408 = load i16, i16* %407, align 2
  %409 = zext i16 %408 to i64
  %410 = getelementptr inbounds i32, i32* %406, i64 %409
  %411 = load i32, i32* %410, align 4
  %412 = lshr i32 %404, %411
  br label %413

; <label>:413:                                    ; preds = %400, %405
  %.sink32 = phi i32 [ %412, %405 ], [ %404, %400 ]
  %414 = zext i32 %.sink32 to i64
  %415 = load i64*, i64** %386, align 8
  %416 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.252, i64 0, i32 1
  %417 = load i16, i16* %416, align 2
  %418 = zext i16 %417 to i64
  %419 = getelementptr inbounds i64, i64* %415, i64 %418
  %420 = load i64, i64* %419, align 8
  %421 = and i64 %420, %414
  %422 = trunc i64 %421 to i32
  %423 = load i16, i16* %394, align 4
  %424 = zext i16 %423 to i32
  %425 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %0, i32 %424, i32 %422) #3
  %426 = icmp eq i32 %425, 0
  br i1 %426, label %.loopexit.loopexit, label %524

; <label>:427:                                    ; preds = %393, %393, %396
  %428 = call fastcc i32 @TIFFFetchPerSampleShorts(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %.252, i32* nonnull %2)
  %429 = icmp eq i32 %428, 0
  br i1 %429, label %.loopexit.loopexit, label %430

; <label>:430:                                    ; preds = %427
  %431 = load i16, i16* %394, align 4
  %432 = zext i16 %431 to i32
  %433 = load i32, i32* %2, align 4
  %434 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %0, i32 %432, i32 %433) #3
  %435 = icmp eq i32 %434, 0
  br i1 %435, label %.loopexit.loopexit, label %524

; <label>:436:                                    ; preds = %393, %393
  %437 = call fastcc i32 @TIFFFetchPerSampleAnys(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %.252, double* nonnull %3)
  %438 = icmp eq i32 %437, 0
  br i1 %438, label %.loopexit.loopexit, label %439

; <label>:439:                                    ; preds = %436
  %440 = load i16, i16* %394, align 4
  %441 = zext i16 %440 to i32
  %442 = load double, double* %3, align 8
  %443 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %0, i32 %441, double %442) #3
  %444 = icmp eq i32 %443, 0
  br i1 %444, label %.loopexit.loopexit, label %524

; <label>:445:                                    ; preds = %393, %393
  %446 = load i32, i32* %360, align 4
  %447 = zext i32 %446 to i64
  %448 = call fastcc i32 @TIFFFetchStripThing(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %.252, i64 %447, i32** %387)
  %449 = icmp eq i32 %448, 0
  br i1 %449, label %.loopexit.loopexit, label %524

; <label>:450:                                    ; preds = %393, %393
  %451 = load i32, i32* %360, align 4
  %452 = zext i32 %451 to i64
  %453 = call fastcc i32 @TIFFFetchStripThing(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %.252, i64 %452, i32** %388)
  %454 = icmp eq i32 %453, 0
  br i1 %454, label %.loopexit.loopexit, label %524

; <label>:455:                                    ; preds = %393, %393
  %456 = load i16, i16* %389, align 4
  %457 = zext i16 %456 to i64
  %458 = shl i64 1, %457
  %459 = icmp eq i16 %395, 320
  br i1 %459, label %465, label %460

; <label>:460:                                    ; preds = %455
  %461 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.252, i64 0, i32 2
  %462 = load i32, i32* %461, align 4
  %463 = trunc i64 %458 to i32
  %464 = icmp eq i32 %462, %463
  br i1 %464, label %470, label %465

; <label>:465:                                    ; preds = %460, %455
  %466 = shl i64 3, %457
  %467 = trunc i64 %466 to i32
  %468 = call fastcc i32 @CheckDirCount(%struct.tiff* nonnull %0, %struct.TIFFDirEntry* nonnull %.252, i32 %467)
  %469 = icmp eq i32 %468, 0
  br i1 %469, label %524, label %470

; <label>:470:                                    ; preds = %465, %460
  %471 = shl i64 %458, 1
  %472 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.252, i64 0, i32 2
  %473 = load i32, i32* %472, align 4
  %474 = shl i32 %473, 1
  %475 = call fastcc i8* @CheckMalloc(%struct.tiff* nonnull %0, i32 %474, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.11, i64 0, i64 0))
  %476 = icmp eq i8* %475, null
  br i1 %476, label %524, label %477

; <label>:477:                                    ; preds = %470
  %478 = call fastcc i32 @TIFFFetchData(%struct.tiff* nonnull %0, %struct.TIFFDirEntry* nonnull %.252, i8* nonnull %475)
  %479 = icmp eq i32 %478, 0
  br i1 %479, label %492, label %480

; <label>:480:                                    ; preds = %477
  %481 = load i16, i16* %389, align 4
  %482 = zext i16 %481 to i32
  %483 = shl i32 1, %482
  %484 = load i32, i32* %472, align 4
  %485 = icmp eq i32 %484, %483
  %. = select i1 %485, i64 0, i64 %471
  %486 = load i16, i16* %394, align 4
  %487 = zext i16 %486 to i32
  %488 = getelementptr inbounds i8, i8* %475, i64 %.
  %489 = shl nsw i64 %., 1
  %490 = getelementptr inbounds i8, i8* %475, i64 %489
  %491 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %0, i32 %487, i8* nonnull %475, i8* %488, i8* %490) #3
  br label %492

; <label>:492:                                    ; preds = %477, %480
  call void @_TIFFfree(i8* nonnull %475) #3
  br label %524

; <label>:493:                                    ; preds = %393, %393, %393, %393
  call fastcc void @TIFFFetchShortPair(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %.252)
  br label %524

; <label>:494:                                    ; preds = %393
  call fastcc void @TIFFFetchRefBlackWhite(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %.252)
  br label %524

; <label>:495:                                    ; preds = %393
  %496 = load i16, i16* %390, align 8
  %497 = icmp eq i16 %496, 19789
  %498 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.252, i64 0, i32 3
  %499 = load i32, i32* %498, align 4
  br i1 %497, label %500, label %508

; <label>:500:                                    ; preds = %495
  %501 = load i32*, i32** %391, align 8
  %502 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.252, i64 0, i32 1
  %503 = load i16, i16* %502, align 2
  %504 = zext i16 %503 to i64
  %505 = getelementptr inbounds i32, i32* %501, i64 %504
  %506 = load i32, i32* %505, align 4
  %507 = lshr i32 %499, %506
  br label %508

; <label>:508:                                    ; preds = %495, %500
  %.sink40 = phi i32 [ %507, %500 ], [ %499, %495 ]
  %509 = zext i32 %.sink40 to i64
  %510 = load i64*, i64** %392, align 8
  %511 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.252, i64 0, i32 1
  %512 = load i16, i16* %511, align 2
  %513 = zext i16 %512 to i64
  %514 = getelementptr inbounds i64, i64* %510, i64 %513
  %515 = load i64, i64* %514, align 8
  %516 = and i64 %515, %509
  %517 = trunc i64 %516 to i32
  %switch.selectcmp = icmp eq i32 %517, 3
  %switch.select = select i1 %switch.selectcmp, i64 2, i64 0
  %switch.selectcmp41 = icmp eq i32 %517, 2
  %switch.select42 = select i1 %switch.selectcmp41, i64 1, i64 %switch.select
  %518 = icmp eq i64 %switch.select42, 0
  br i1 %518, label %524, label %519

; <label>:519:                                    ; preds = %508
  %520 = trunc i64 %switch.select42 to i32
  %521 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %0, i32 254, i32 %520) #3
  br label %524

; <label>:522:                                    ; preds = %393
  %523 = call fastcc i32 @TIFFFetchNormalTag(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %.252)
  br label %524

; <label>:524:                                    ; preds = %393, %493, %494, %522, %413, %430, %439, %445, %450, %465, %470, %492, %508, %519
  %525 = add nsw i32 %.2451, -1
  %526 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.252, i64 1
  %527 = icmp sgt i32 %.2451, 1
  br i1 %527, label %393, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %524
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %380
  %528 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 11
  %529 = load i16, i16* %528, align 2
  %530 = icmp eq i16 %529, 3
  br i1 %530, label %531, label %536

; <label>:531:                                    ; preds = %._crit_edge
  %532 = load i64, i64* %328, align 8
  %533 = and i64 %532, 67108864
  %534 = icmp eq i64 %533, 0
  br i1 %534, label %535, label %536

; <label>:535:                                    ; preds = %531
  call fastcc void @MissingRequired(%struct.tiff* nonnull %0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.12, i64 0, i64 0))
  br label %.loopexit

; <label>:536:                                    ; preds = %531, %._crit_edge
  %537 = load i64, i64* %328, align 8
  %538 = and i64 %537, 16777216
  %539 = icmp eq i64 %538, 0
  br i1 %539, label %540, label %563

; <label>:540:                                    ; preds = %536
  %541 = load i16, i16* %363, align 2
  %542 = icmp eq i16 %541, 1
  br i1 %542, label %543, label %546

; <label>:543:                                    ; preds = %540
  %544 = load i32, i32* %360, align 4
  %545 = icmp ugt i32 %544, 1
  br i1 %545, label %555, label %thread-pre-split

thread-pre-split:                                 ; preds = %543
  %.pr43 = load i16, i16* %363, align 2
  br label %546

; <label>:546:                                    ; preds = %thread-pre-split, %540
  %547 = phi i16 [ %.pr43, %thread-pre-split ], [ %541, %540 ]
  %548 = icmp eq i16 %547, 2
  br i1 %548, label %549, label %556

; <label>:549:                                    ; preds = %546
  %550 = load i32, i32* %360, align 4
  %551 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %552 = load i16, i16* %551, align 2
  %553 = zext i16 %552 to i32
  %554 = icmp eq i32 %550, %553
  br i1 %554, label %556, label %555

; <label>:555:                                    ; preds = %549, %543
  call fastcc void @MissingRequired(%struct.tiff* nonnull %0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.13, i64 0, i64 0))
  br label %.loopexit

; <label>:556:                                    ; preds = %549, %546
  %557 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %558 = load i8*, i8** %557, align 8
  %559 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* nonnull %0, i32 279) #3
  %560 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %559, i64 0, i32 7
  %561 = load i8*, i8** %560, align 8
  call void (i8*, i8*, ...) @TIFFWarning(i8* %558, i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.14, i64 0, i64 0), i8* %561) #3
  %562 = load i16, i16* %4, align 2
  call fastcc void @EstimateStripByteCounts(%struct.tiff* nonnull %0, %struct.TIFFDirEntry* %.08, i16 zeroext %562)
  br label %593

; <label>:563:                                    ; preds = %536
  %564 = load i32, i32* %360, align 4
  %565 = icmp eq i32 %564, 1
  br i1 %565, label %566, label %593

; <label>:566:                                    ; preds = %563
  %567 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 45
  %568 = load i32*, i32** %567, align 8
  %569 = load i32, i32* %568, align 4
  %570 = icmp eq i32 %569, 0
  br i1 %570, label %586, label %571

; <label>:571:                                    ; preds = %566
  %572 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 10
  %573 = load i16, i16* %572, align 8
  %574 = icmp eq i16 %573, 1
  br i1 %574, label %575, label %593

; <label>:575:                                    ; preds = %571
  %576 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 53
  %577 = load i32 (i8*)*, i32 (i8*)** %576, align 8
  %578 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 48
  %579 = load i8*, i8** %578, align 8
  %580 = call i32 %577(i8* %579) #3
  %581 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 44
  %582 = load i32*, i32** %581, align 8
  %583 = load i32, i32* %582, align 4
  %584 = sub i32 %580, %583
  %585 = icmp ugt i32 %569, %584
  br i1 %585, label %586, label %593

; <label>:586:                                    ; preds = %575, %566
  %587 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %588 = load i8*, i8** %587, align 8
  %589 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* nonnull %0, i32 279) #3
  %590 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %589, i64 0, i32 7
  %591 = load i8*, i8** %590, align 8
  call void (i8*, i8*, ...) @TIFFWarning(i8* %588, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.15, i64 0, i64 0), i8* %591) #3
  %592 = load i16, i16* %4, align 2
  call fastcc void @EstimateStripByteCounts(%struct.tiff* nonnull %0, %struct.TIFFDirEntry* %.08, i16 zeroext %592)
  br label %593

; <label>:593:                                    ; preds = %563, %571, %575, %586, %556
  %594 = icmp eq %struct.TIFFDirEntry* %.08, null
  br i1 %594, label %596, label %595

; <label>:595:                                    ; preds = %593
  call void @_TIFFfree(i8* %127) #3
  br label %596

; <label>:596:                                    ; preds = %593, %595
  %597 = load i64, i64* %328, align 8
  %598 = and i64 %597, 524288
  %599 = icmp eq i64 %598, 0
  br i1 %599, label %600, label %608

; <label>:600:                                    ; preds = %596
  %601 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %602 = load i16, i16* %601, align 4
  %603 = zext i16 %602 to i64
  %604 = shl i64 1, %603
  %605 = add i64 %604, 65535
  %606 = trunc i64 %605 to i16
  %607 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 18
  store i16 %606, i16* %607, align 2
  br label %608

; <label>:608:                                    ; preds = %596, %600
  %609 = load i64, i64* %328, align 8
  %610 = trunc i64 %609 to i8
  %611 = icmp slt i8 %610, 0
  br i1 %611, label %614, label %612

; <label>:612:                                    ; preds = %608
  %613 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %0, i32 259, i32 1) #3
  br label %614

; <label>:614:                                    ; preds = %612, %608
  %615 = load i32, i32* %360, align 4
  %616 = icmp eq i32 %615, 1
  br i1 %616, label %617, label %626

; <label>:617:                                    ; preds = %614
  %618 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 10
  %619 = load i16, i16* %618, align 8
  %620 = icmp eq i16 %619, 1
  br i1 %620, label %621, label %626

; <label>:621:                                    ; preds = %617
  %622 = load i32, i32* %16, align 8
  %623 = and i32 %622, 33792
  %624 = icmp eq i32 %623, 32768
  br i1 %624, label %625, label %626

; <label>:625:                                    ; preds = %621
  call fastcc void @ChopUpSingleUncompressedStrip(%struct.tiff* nonnull %0)
  br label %626

; <label>:626:                                    ; preds = %625, %621, %617, %614
  %627 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  store i32 -1, i32* %627, align 8
  %628 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 13
  store i32 -1, i32* %628, align 8
  %629 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 18
  store i32 -1, i32* %629, align 4
  %630 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 19
  store i32 -1, i32* %630, align 8
  %631 = call i32 @TIFFTileSize(%struct.tiff* nonnull %0) #3
  %632 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 20
  store i32 %631, i32* %632, align 4
  %633 = call i32 @TIFFScanlineSize(%struct.tiff* nonnull %0) #3
  %634 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 38
  store i32 %633, i32* %634, align 8
  br label %638

.loopexit.loopexit:                               ; preds = %413, %430, %427, %439, %436, %445, %450
  br label %.loopexit

.loopexit.loopexit89:                             ; preds = %286, %302, %299, %319
  br label %.loopexit

.loopexit.loopexit90:                             ; preds = %151
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit90, %.loopexit.loopexit89, %.loopexit.loopexit, %555, %535, %375, %336, %332, %107, %66
  %635 = phi i8* [ %97, %107 ], [ %127, %555 ], [ %127, %535 ], [ %127, %375 ], [ %127, %336 ], [ %127, %332 ], [ %51, %66 ], [ %127, %.loopexit.loopexit ], [ %127, %.loopexit.loopexit89 ], [ %127, %.loopexit.loopexit90 ]
  %.19 = phi %struct.TIFFDirEntry* [ %98, %107 ], [ %.08, %555 ], [ %.08, %535 ], [ %.08, %375 ], [ %.08, %336 ], [ %.08, %332 ], [ %52, %66 ], [ %.08, %.loopexit.loopexit ], [ %.08, %.loopexit.loopexit89 ], [ %.08, %.loopexit.loopexit90 ]
  %636 = icmp eq %struct.TIFFDirEntry* %.19, null
  br i1 %636, label %638, label %637

; <label>:637:                                    ; preds = %.loopexit
  call void @_TIFFfree(i8* %635) #3
  br label %638

; <label>:638:                                    ; preds = %637, %.loopexit, %93, %47, %1, %626, %80, %39, %29
  %.0 = phi i32 [ 0, %80 ], [ 1, %626 ], [ 0, %39 ], [ 0, %29 ], [ 0, %1 ], [ 0, %47 ], [ 0, %93 ], [ 0, %.loopexit ], [ 0, %637 ]
  ret i32 %.0
}

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #1

declare void @TIFFSwabShort(i16*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i8* @CheckMalloc(%struct.tiff* nocapture readonly, i32, i8*) unnamed_addr #0 {
  %4 = tail call i8* @_TIFFmalloc(i32 %1) #3
  %5 = icmp eq i8* %4, null
  br i1 %5, label %6, label %9

; <label>:6:                                      ; preds = %3
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %8 = load i8*, i8** %7, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.16, i64 0, i64 0), i8* %2) #3
  br label %9

; <label>:9:                                      ; preds = %6, %3
  ret i8* %4
}

declare void @_TIFFmemcpy(i8*, i8*, i32) local_unnamed_addr #1

declare void @TIFFSwabLong(i32*) local_unnamed_addr #1

declare void @TIFFFreeDirectory(%struct.tiff*) local_unnamed_addr #1

declare i32 @TIFFDefaultDirectory(%struct.tiff*) local_unnamed_addr #1

declare i32 @TIFFSetField(%struct.tiff*, i32, ...) local_unnamed_addr #1

declare void @TIFFSwabArrayOfShort(i16*, i64) local_unnamed_addr #1

declare void @TIFFSwabArrayOfLong(i32*, i64) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFFetchNormalTag(%struct.tiff*, %struct.TIFFDirEntry* readonly) unnamed_addr #0 {
  %3 = alloca i16, align 2
  %4 = alloca i32, align 4
  %5 = alloca float, align 4
  %6 = alloca double, align 8
  %7 = alloca [2 x i8], align 1
  %8 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 0
  %9 = load i16, i16* %8, align 4
  %10 = zext i16 %9 to i32
  %11 = tail call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %0, i32 %10) #3
  %12 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %13 = load i32, i32* %12, align 4
  %14 = icmp ugt i32 %13, 1
  br i1 %14, label %15, label %92

; <label>:15:                                     ; preds = %2
  %16 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 1
  %17 = load i16, i16* %16, align 2
  switch i16 %17, label %.thread33 [
    i16 1, label %18
    i16 6, label %18
    i16 3, label %27
    i16 8, label %27
    i16 4, label %36
    i16 9, label %36
    i16 5, label %45
    i16 10, label %45
    i16 11, label %54
    i16 12, label %62
    i16 2, label %66
    i16 7, label %66
  ]

; <label>:18:                                     ; preds = %15, %15
  %19 = load i32, i32* %12, align 4
  %20 = shl i32 %19, 1
  %21 = tail call fastcc i8* @CheckMalloc(%struct.tiff* %0, i32 %20, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @TIFFFetchNormalTag.mesg, i64 0, i64 0))
  %22 = icmp eq i8* %21, null
  br i1 %22, label %.thread33, label %23

; <label>:23:                                     ; preds = %18
  %24 = bitcast i8* %21 to i16*
  %25 = tail call fastcc i32 @TIFFFetchByteArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i16* %24)
  %26 = icmp ne i32 %25, 0
  %.0124 = zext i1 %26 to i32
  br i1 %26, label %81, label %.thread30

; <label>:27:                                     ; preds = %15, %15
  %28 = load i32, i32* %12, align 4
  %29 = shl i32 %28, 1
  %30 = tail call fastcc i8* @CheckMalloc(%struct.tiff* %0, i32 %29, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @TIFFFetchNormalTag.mesg, i64 0, i64 0))
  %31 = icmp eq i8* %30, null
  br i1 %31, label %.thread33, label %32

; <label>:32:                                     ; preds = %27
  %33 = bitcast i8* %30 to i16*
  %34 = tail call fastcc i32 @TIFFFetchShortArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i16* %33)
  %35 = icmp ne i32 %34, 0
  %.0125 = zext i1 %35 to i32
  br i1 %35, label %81, label %.thread30

; <label>:36:                                     ; preds = %15, %15
  %37 = load i32, i32* %12, align 4
  %38 = shl i32 %37, 2
  %39 = tail call fastcc i8* @CheckMalloc(%struct.tiff* %0, i32 %38, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @TIFFFetchNormalTag.mesg, i64 0, i64 0))
  %40 = icmp eq i8* %39, null
  br i1 %40, label %.thread33, label %41

; <label>:41:                                     ; preds = %36
  %42 = bitcast i8* %39 to i32*
  %43 = tail call fastcc i32 @TIFFFetchLongArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i32* %42)
  %44 = icmp ne i32 %43, 0
  %.0126 = zext i1 %44 to i32
  br i1 %44, label %81, label %.thread30

; <label>:45:                                     ; preds = %15, %15
  %46 = load i32, i32* %12, align 4
  %47 = shl i32 %46, 2
  %48 = tail call fastcc i8* @CheckMalloc(%struct.tiff* %0, i32 %47, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @TIFFFetchNormalTag.mesg, i64 0, i64 0))
  %49 = icmp eq i8* %48, null
  br i1 %49, label %.thread33, label %50

; <label>:50:                                     ; preds = %45
  %51 = bitcast i8* %48 to float*
  %52 = tail call fastcc i32 @TIFFFetchRationalArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, float* %51)
  %53 = icmp ne i32 %52, 0
  %.0127 = zext i1 %53 to i32
  br i1 %53, label %81, label %.thread30

; <label>:54:                                     ; preds = %15
  %55 = shl i32 %13, 2
  %56 = tail call fastcc i8* @CheckMalloc(%struct.tiff* %0, i32 %55, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @TIFFFetchNormalTag.mesg, i64 0, i64 0))
  %57 = icmp eq i8* %56, null
  br i1 %57, label %.thread33, label %58

; <label>:58:                                     ; preds = %54
  %59 = bitcast i8* %56 to float*
  %60 = tail call fastcc i32 @TIFFFetchFloatArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, float* %59)
  %61 = icmp ne i32 %60, 0
  %.0128 = zext i1 %61 to i32
  br i1 %61, label %81, label %.thread30

; <label>:62:                                     ; preds = %15
  %63 = shl i32 %13, 3
  %64 = tail call fastcc i8* @CheckMalloc(%struct.tiff* %0, i32 %63, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @TIFFFetchNormalTag.mesg, i64 0, i64 0))
  %65 = icmp eq i8* %64, null
  br i1 %65, label %.thread33, label %77

; <label>:66:                                     ; preds = %15, %15
  %67 = load i32, i32* %12, align 4
  %68 = add i32 %67, 1
  %69 = tail call fastcc i8* @CheckMalloc(%struct.tiff* %0, i32 %68, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @TIFFFetchNormalTag.mesg, i64 0, i64 0))
  %70 = icmp eq i8* %69, null
  br i1 %70, label %.thread33, label %71

; <label>:71:                                     ; preds = %66
  %72 = tail call fastcc i32 @TIFFFetchString(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i8* nonnull %69)
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %.thread30, label %.thread21

.thread21:                                        ; preds = %71
  %74 = load i32, i32* %12, align 4
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8* %69, i64 %75
  store i8 0, i8* %76, align 1
  br label %81

; <label>:77:                                     ; preds = %62
  %78 = bitcast i8* %64 to double*
  %79 = tail call fastcc i32 @TIFFFetchDoubleArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, double* %78)
  %80 = icmp ne i32 %79, 0
  %.01 = zext i1 %80 to i32
  br i1 %80, label %81, label %.thread30

; <label>:81:                                     ; preds = %58, %50, %41, %32, %23, %.thread21, %77
  %.023 = phi i8* [ %69, %.thread21 ], [ %64, %77 ], [ %21, %23 ], [ %30, %32 ], [ %39, %41 ], [ %48, %50 ], [ %56, %58 ]
  %82 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %11, i64 0, i32 6
  %83 = load i8, i8* %82, align 1
  %84 = icmp eq i8 %83, 0
  %85 = load i16, i16* %8, align 4
  %86 = zext i16 %85 to i32
  br i1 %84, label %90, label %87

; <label>:87:                                     ; preds = %81
  %88 = load i32, i32* %12, align 4
  %89 = tail call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %0, i32 %86, i32 %88, i8* nonnull %.023) #3
  br label %.thread30

; <label>:90:                                     ; preds = %81
  %91 = tail call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %0, i32 %86, i8* nonnull %.023) #3
  br label %.thread30

.thread30:                                        ; preds = %71, %58, %50, %41, %32, %23, %90, %87, %77
  %.132 = phi i32 [ %.0128, %58 ], [ %.0127, %50 ], [ %.0126, %41 ], [ %.0125, %32 ], [ %.0124, %23 ], [ %91, %90 ], [ %89, %87 ], [ %.01, %77 ], [ 0, %71 ]
  %.02031 = phi i8* [ %56, %58 ], [ %48, %50 ], [ %39, %41 ], [ %30, %32 ], [ %21, %23 ], [ %.023, %90 ], [ %.023, %87 ], [ %64, %77 ], [ %69, %71 ]
  tail call void @_TIFFfree(i8* nonnull %.02031) #3
  br label %.thread33

; <label>:92:                                     ; preds = %2
  %93 = tail call fastcc i32 @CheckDirCount(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i32 1)
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %.thread33, label %95

; <label>:95:                                     ; preds = %92
  %96 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 1
  %97 = load i16, i16* %96, align 2
  switch i16 %97, label %.thread33 [
    i16 1, label %98
    i16 6, label %98
    i16 3, label %98
    i16 8, label %98
    i16 4, label %136
    i16 9, label %136
    i16 7, label %205
    i16 2, label %205
    i16 12, label %185
    i16 11, label %169
    i16 5, label %171
    i16 10, label %171
  ]

; <label>:98:                                     ; preds = %95, %95, %95, %95
  %99 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %11, i64 0, i32 3
  %100 = load i32, i32* %99, align 8
  switch i32 %100, label %101 [
    i32 4, label %136
    i32 9, label %136
  ]

; <label>:101:                                    ; preds = %98
  %102 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 7, i32 0
  %103 = load i16, i16* %102, align 8
  %104 = icmp eq i16 %103, 19789
  %105 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %106 = load i32, i32* %105, align 4
  br i1 %104, label %107, label %115

; <label>:107:                                    ; preds = %101
  %108 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 9
  %109 = load i32*, i32** %108, align 8
  %110 = load i16, i16* %96, align 2
  %111 = zext i16 %110 to i64
  %112 = getelementptr inbounds i32, i32* %109, i64 %111
  %113 = load i32, i32* %112, align 4
  %114 = lshr i32 %106, %113
  br label %115

; <label>:115:                                    ; preds = %101, %107
  %.sink9 = phi i32 [ %114, %107 ], [ %106, %101 ]
  %116 = zext i32 %.sink9 to i64
  %117 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 10
  %118 = load i64*, i64** %117, align 8
  %119 = load i16, i16* %96, align 2
  %120 = zext i16 %119 to i64
  %121 = getelementptr inbounds i64, i64* %118, i64 %120
  %122 = load i64, i64* %121, align 8
  %123 = and i64 %122, %116
  %124 = trunc i64 %123 to i16
  store i16 %124, i16* %3, align 2
  %125 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %11, i64 0, i32 6
  %126 = load i8, i8* %125, align 1
  %127 = icmp eq i8 %126, 0
  %128 = load i16, i16* %8, align 4
  %129 = zext i16 %128 to i32
  br i1 %127, label %132, label %130

; <label>:130:                                    ; preds = %115
  %131 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %0, i32 %129, i32 1, i16* nonnull %3) #3
  br label %.thread33

; <label>:132:                                    ; preds = %115
  %133 = trunc i64 %123 to i32
  %134 = and i32 %133, 65535
  %135 = tail call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %0, i32 %129, i32 %134) #3
  br label %.thread33

; <label>:136:                                    ; preds = %95, %95, %98, %98
  %137 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 7, i32 0
  %138 = load i16, i16* %137, align 8
  %139 = icmp eq i16 %138, 19789
  %140 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %141 = load i32, i32* %140, align 4
  br i1 %139, label %142, label %150

; <label>:142:                                    ; preds = %136
  %143 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 9
  %144 = load i32*, i32** %143, align 8
  %145 = load i16, i16* %96, align 2
  %146 = zext i16 %145 to i64
  %147 = getelementptr inbounds i32, i32* %144, i64 %146
  %148 = load i32, i32* %147, align 4
  %149 = lshr i32 %141, %148
  br label %150

; <label>:150:                                    ; preds = %136, %142
  %.sink17 = phi i32 [ %149, %142 ], [ %141, %136 ]
  %151 = zext i32 %.sink17 to i64
  %152 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 10
  %153 = load i64*, i64** %152, align 8
  %154 = load i16, i16* %96, align 2
  %155 = zext i16 %154 to i64
  %156 = getelementptr inbounds i64, i64* %153, i64 %155
  %157 = load i64, i64* %156, align 8
  %158 = and i64 %157, %151
  %159 = trunc i64 %158 to i32
  store i32 %159, i32* %4, align 4
  %160 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %11, i64 0, i32 6
  %161 = load i8, i8* %160, align 1
  %162 = icmp eq i8 %161, 0
  %163 = load i16, i16* %8, align 4
  %164 = zext i16 %163 to i32
  br i1 %162, label %167, label %165

; <label>:165:                                    ; preds = %150
  %166 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %0, i32 %164, i32 1, i32* nonnull %4) #3
  br label %.thread33

; <label>:167:                                    ; preds = %150
  %168 = tail call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %0, i32 %164, i32 %159) #3
  br label %.thread33

; <label>:169:                                    ; preds = %95
  %170 = tail call fastcc float @TIFFFetchFloat(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1)
  br label %173

; <label>:171:                                    ; preds = %95, %95
  %172 = tail call fastcc float @TIFFFetchRational(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1)
  br label %173

; <label>:173:                                    ; preds = %171, %169
  %174 = phi float [ %170, %169 ], [ %172, %171 ]
  store float %174, float* %5, align 4
  %175 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %11, i64 0, i32 6
  %176 = load i8, i8* %175, align 1
  %177 = icmp eq i8 %176, 0
  %178 = load i16, i16* %8, align 4
  %179 = zext i16 %178 to i32
  br i1 %177, label %182, label %180

; <label>:180:                                    ; preds = %173
  %181 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %0, i32 %179, i32 1, float* nonnull %5) #3
  br label %.thread33

; <label>:182:                                    ; preds = %173
  %183 = fpext float %174 to double
  %184 = tail call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %0, i32 %179, double %183) #3
  br label %.thread33

; <label>:185:                                    ; preds = %95
  %186 = call fastcc i32 @TIFFFetchDoubleArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, double* nonnull %6)
  %187 = icmp eq i32 %186, 0
  br i1 %187, label %202, label %188

; <label>:188:                                    ; preds = %185
  %189 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %11, i64 0, i32 6
  %190 = load i8, i8* %189, align 1
  %191 = icmp eq i8 %190, 0
  %192 = load i16, i16* %8, align 4
  %193 = zext i16 %192 to i32
  br i1 %191, label %196, label %194

; <label>:194:                                    ; preds = %188
  %195 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %0, i32 %193, i32 1, double* nonnull %6) #3
  br label %199

; <label>:196:                                    ; preds = %188
  %197 = load double, double* %6, align 8
  %198 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %0, i32 %193, double %197) #3
  br label %199

; <label>:199:                                    ; preds = %196, %194
  %200 = phi i32 [ %195, %194 ], [ %198, %196 ]
  %201 = icmp ne i32 %200, 0
  br label %202

; <label>:202:                                    ; preds = %185, %199
  %203 = phi i1 [ false, %185 ], [ %201, %199 ]
  %204 = zext i1 %203 to i32
  br label %.thread33

; <label>:205:                                    ; preds = %95, %95
  %206 = getelementptr inbounds [2 x i8], [2 x i8]* %7, i64 0, i64 0
  %207 = call fastcc i32 @TIFFFetchString(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i8* nonnull %206)
  %208 = icmp ne i32 %207, 0
  %209 = zext i1 %208 to i32
  br i1 %208, label %210, label %.thread33

; <label>:210:                                    ; preds = %205
  %211 = getelementptr inbounds [2 x i8], [2 x i8]* %7, i64 0, i64 1
  store i8 0, i8* %211, align 1
  %212 = load i16, i16* %8, align 4
  %213 = zext i16 %212 to i32
  %214 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %0, i32 %213, i8* nonnull %206) #3
  br label %.thread33

.thread33:                                        ; preds = %95, %66, %15, %18, %27, %36, %45, %54, %62, %92, %205, %210, %180, %182, %165, %167, %130, %132, %202, %.thread30
  %.5 = phi i32 [ %.132, %.thread30 ], [ 0, %92 ], [ 0, %95 ], [ %204, %202 ], [ %131, %130 ], [ %135, %132 ], [ %166, %165 ], [ %168, %167 ], [ %181, %180 ], [ %184, %182 ], [ %214, %210 ], [ %209, %205 ], [ 0, %62 ], [ 0, %54 ], [ 0, %45 ], [ 0, %36 ], [ 0, %27 ], [ 0, %18 ], [ 0, %15 ], [ 0, %66 ]
  ret i32 %.5
}

declare i32 @TIFFReassignTagToIgnore(i32, i32) local_unnamed_addr #1

declare void @TIFFWarning(i8*, i8*, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @CheckDirCount(%struct.tiff*, %struct.TIFFDirEntry* nocapture readonly, i32) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %5 = load i32, i32* %4, align 4
  %6 = icmp eq i32 %5, %2
  br i1 %6, label %17, label %7

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %9 = load i8*, i8** %8, align 8
  %10 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 0
  %11 = load i16, i16* %10, align 4
  %12 = zext i16 %11 to i32
  %13 = tail call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %0, i32 %12) #3
  %14 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %13, i64 0, i32 7
  %15 = load i8*, i8** %14, align 8
  %16 = load i32, i32* %4, align 4
  tail call void (i8*, i8*, ...) @TIFFWarning(i8* %9, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.19, i64 0, i64 0), i8* %15, i32 %16, i32 %2) #3
  br label %17

; <label>:17:                                     ; preds = %3, %7
  %.0 = phi i32 [ 0, %7 ], [ 1, %3 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFFetchPerSampleShorts(%struct.tiff*, %struct.TIFFDirEntry* nocapture readonly, i32* nocapture) unnamed_addr #0 {
  %4 = alloca [10 x i16], align 16
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %6 = load i16, i16* %5, align 2
  %7 = zext i16 %6 to i32
  %8 = tail call fastcc i32 @CheckDirCount(%struct.tiff* %0, %struct.TIFFDirEntry* %1, i32 %7)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %44, label %10

; <label>:10:                                     ; preds = %3
  %11 = getelementptr inbounds [10 x i16], [10 x i16]* %4, i64 0, i64 0
  %12 = icmp ugt i16 %6, 10
  br i1 %12, label %13, label %17

; <label>:13:                                     ; preds = %10
  %14 = shl nuw nsw i32 %7, 1
  %15 = tail call i8* @_TIFFmalloc(i32 %14) #3
  %16 = bitcast i8* %15 to i16*
  br label %17

; <label>:17:                                     ; preds = %13, %10
  %.01 = phi i16* [ %16, %13 ], [ %11, %10 ]
  %18 = call fastcc i32 @TIFFFetchShortArray(%struct.tiff* nonnull %0, %struct.TIFFDirEntry* %1, i16* %.01)
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %40, label %.preheader

.preheader:                                       ; preds = %17
  %20 = icmp ugt i16 %6, 1
  br i1 %20, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %21 = load i16, i16* %.01, align 2
  %22 = zext i16 %6 to i64
  br label %25

; <label>:23:                                     ; preds = %25
  %24 = icmp slt i64 %indvars.iv.next, %22
  br i1 %24, label %25, label %._crit_edge.loopexit

; <label>:25:                                     ; preds = %.lr.ph, %23
  %indvars.iv = phi i64 [ 1, %.lr.ph ], [ %indvars.iv.next, %23 ]
  %26 = getelementptr inbounds i16, i16* %.01, i64 %indvars.iv
  %27 = load i16, i16* %26, align 2
  %28 = icmp eq i16 %27, %21
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %28, label %23, label %29

; <label>:29:                                     ; preds = %25
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %31 = load i8*, i8** %30, align 8
  %32 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 0
  %33 = load i16, i16* %32, align 4
  %34 = zext i16 %33 to i32
  %35 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %0, i32 %34) #3
  %36 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %35, i64 0, i32 7
  %37 = load i8*, i8** %36, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %31, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.23, i64 0, i64 0), i8* %37) #3
  br label %40

._crit_edge.loopexit:                             ; preds = %23
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %38 = load i16, i16* %.01, align 2
  %39 = zext i16 %38 to i32
  store i32 %39, i32* %2, align 4
  br label %40

; <label>:40:                                     ; preds = %._crit_edge, %17, %29
  %.1 = phi i32 [ 0, %29 ], [ 1, %._crit_edge ], [ 0, %17 ]
  %41 = icmp eq i16* %.01, %11
  br i1 %41, label %44, label %42

; <label>:42:                                     ; preds = %40
  %43 = bitcast i16* %.01 to i8*
  call void @_TIFFfree(i8* %43) #3
  br label %44

; <label>:44:                                     ; preds = %42, %40, %3
  %.2 = phi i32 [ 0, %3 ], [ %.1, %40 ], [ %.1, %42 ]
  ret i32 %.2
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @TIFFFetchExtraSamples(%struct.tiff*, %struct.TIFFDirEntry* nocapture readonly) unnamed_addr #0 {
  %3 = alloca [10 x i16], align 16
  %4 = getelementptr inbounds [10 x i16], [10 x i16]* %3, i64 0, i64 0
  %5 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %6 = load i32, i32* %5, align 4
  %7 = icmp ugt i32 %6, 10
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %2
  %9 = shl i32 %6, 1
  %10 = tail call i8* @_TIFFmalloc(i32 %9) #3
  %11 = bitcast i8* %10 to i16*
  br label %12

; <label>:12:                                     ; preds = %8, %2
  %.01 = phi i16* [ %11, %8 ], [ %4, %2 ]
  %13 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 1
  %14 = load i16, i16* %13, align 2
  %15 = icmp eq i16 %14, 1
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %12
  %17 = call fastcc i32 @TIFFFetchByteArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i16* %.01)
  br label %20

; <label>:18:                                     ; preds = %12
  %19 = call fastcc i32 @TIFFFetchShortArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i16* %.01)
  br label %20

; <label>:20:                                     ; preds = %18, %16
  %.0 = phi i32 [ %17, %16 ], [ %19, %18 ]
  %21 = icmp eq i32 %.0, 0
  br i1 %21, label %28, label %22

; <label>:22:                                     ; preds = %20
  %23 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 0
  %24 = load i16, i16* %23, align 4
  %25 = zext i16 %24 to i32
  %26 = load i32, i32* %5, align 4
  %27 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %0, i32 %25, i32 %26, i16* %.01) #3
  br label %28

; <label>:28:                                     ; preds = %20, %22
  %29 = icmp eq i16* %.01, %4
  br i1 %29, label %32, label %30

; <label>:30:                                     ; preds = %28
  %31 = bitcast i16* %.01 to i8*
  call void @_TIFFfree(i8* %31) #3
  br label %32

; <label>:32:                                     ; preds = %28, %30
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @MissingRequired(%struct.tiff* nocapture readonly, i8*) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %4 = load i8*, i8** %3, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %4, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.18, i64 0, i64 0), i8* %1) #3
  ret void
}

declare i32 @TIFFNumberOfStrips(%struct.tiff*) local_unnamed_addr #1

declare i32 @TIFFNumberOfTiles(%struct.tiff*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFFetchPerSampleAnys(%struct.tiff*, %struct.TIFFDirEntry* nocapture readonly, double* nocapture) unnamed_addr #0 {
  %4 = alloca [10 x double], align 16
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %6 = load i16, i16* %5, align 2
  %7 = zext i16 %6 to i32
  %8 = tail call fastcc i32 @CheckDirCount(%struct.tiff* %0, %struct.TIFFDirEntry* %1, i32 %7)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %45, label %10

; <label>:10:                                     ; preds = %3
  %11 = getelementptr inbounds [10 x double], [10 x double]* %4, i64 0, i64 0
  %12 = icmp ugt i16 %6, 10
  br i1 %12, label %13, label %17

; <label>:13:                                     ; preds = %10
  %14 = shl nuw nsw i32 %7, 3
  %15 = tail call i8* @_TIFFmalloc(i32 %14) #3
  %16 = bitcast i8* %15 to double*
  br label %17

; <label>:17:                                     ; preds = %13, %10
  %.01 = phi double* [ %16, %13 ], [ %11, %10 ]
  %18 = call fastcc i32 @TIFFFetchAnyArray(%struct.tiff* nonnull %0, %struct.TIFFDirEntry* %1, double* %.01)
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %41, label %.preheader

.preheader:                                       ; preds = %17
  %20 = icmp ugt i16 %6, 1
  br i1 %20, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %21 = load double, double* %.01, align 8
  %22 = zext i16 %6 to i64
  br label %25

; <label>:23:                                     ; preds = %25
  %24 = icmp slt i64 %indvars.iv.next, %22
  br i1 %24, label %25, label %._crit_edge.loopexit

; <label>:25:                                     ; preds = %.lr.ph, %23
  %indvars.iv = phi i64 [ 1, %.lr.ph ], [ %indvars.iv.next, %23 ]
  %26 = getelementptr inbounds double, double* %.01, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = fcmp une double %27, %21
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %28, label %29, label %23

; <label>:29:                                     ; preds = %25
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %31 = load i8*, i8** %30, align 8
  %32 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 0
  %33 = load i16, i16* %32, align 4
  %34 = zext i16 %33 to i32
  %35 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %0, i32 %34) #3
  %36 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %35, i64 0, i32 7
  %37 = load i8*, i8** %36, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %31, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.23, i64 0, i64 0), i8* %37) #3
  br label %41

._crit_edge.loopexit:                             ; preds = %23
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %38 = bitcast double* %.01 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = bitcast double* %2 to i64*
  store i64 %39, i64* %40, align 8
  br label %41

; <label>:41:                                     ; preds = %._crit_edge, %17, %29
  %.1 = phi i32 [ 0, %29 ], [ 1, %._crit_edge ], [ 0, %17 ]
  %42 = icmp eq double* %.01, %11
  br i1 %42, label %45, label %43

; <label>:43:                                     ; preds = %41
  %44 = bitcast double* %.01 to i8*
  call void @_TIFFfree(i8* %44) #3
  br label %45

; <label>:45:                                     ; preds = %43, %41, %3
  %.2 = phi i32 [ 0, %3 ], [ %.1, %41 ], [ %.1, %43 ]
  ret i32 %.2
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFFetchStripThing(%struct.tiff*, %struct.TIFFDirEntry* nocapture readonly, i64, i32** nocapture) unnamed_addr #0 {
  %5 = trunc i64 %2 to i32
  %6 = tail call fastcc i32 @CheckDirCount(%struct.tiff* %0, %struct.TIFFDirEntry* %1, i32 %5)
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %80, label %8

; <label>:8:                                      ; preds = %4
  %9 = load i32*, i32** %3, align 8
  %10 = icmp eq i32* %9, null
  br i1 %10, label %11, label %16

; <label>:11:                                     ; preds = %8
  %12 = shl i32 %5, 2
  %13 = tail call fastcc i8* @CheckMalloc(%struct.tiff* %0, i32 %12, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.25, i64 0, i64 0))
  %14 = bitcast i32** %3 to i8**
  store i8* %13, i8** %14, align 8
  %15 = icmp eq i8* %13, null
  br i1 %15, label %80, label %16

; <label>:16:                                     ; preds = %11, %8
  %17 = load i32*, i32** %3, align 8
  %18 = bitcast i32* %17 to i8*
  %19 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 1
  %20 = load i16, i16* %19, align 2
  %21 = icmp eq i16 %20, 3
  br i1 %21, label %22, label %78

; <label>:22:                                     ; preds = %16
  %23 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %24 = load i32, i32* %23, align 4
  %25 = shl i32 %24, 1
  %26 = tail call fastcc i8* @CheckMalloc(%struct.tiff* %0, i32 %25, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.26, i64 0, i64 0))
  %27 = bitcast i8* %26 to i16*
  %28 = icmp eq i8* %26, null
  br i1 %28, label %80, label %29

; <label>:29:                                     ; preds = %22
  %30 = tail call fastcc i32 @TIFFFetchShortArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i16* %27)
  %31 = icmp ne i32 %30, 0
  %32 = icmp sgt i64 %2, 0
  %or.cond = and i1 %31, %32
  br i1 %or.cond, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %29
  %33 = xor i64 %2, -1
  %34 = icmp sgt i64 %33, -2
  %smax = select i1 %34, i64 %33, i64 -2
  %35 = add i64 %smax, %2
  %36 = add i64 %35, 2
  %min.iters.check = icmp ult i64 %36, 8
  br i1 %min.iters.check, label %.lr.ph.preheader20, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.preheader
  %n.vec = and i64 %36, -8
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph.preheader20, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %37 = xor i64 %2, -1
  %38 = icmp sgt i64 %37, -2
  %smax8 = select i1 %38, i64 %37, i64 -2
  %39 = add i64 %smax8, %2
  %40 = add i64 %39, 2
  %scevgep = getelementptr i32, i32* %17, i64 %40
  %scevgep9 = bitcast i32* %scevgep to i8*
  %41 = shl i64 %39, 1
  %42 = add i64 %41, 4
  %scevgep10 = getelementptr i8, i8* %26, i64 %42
  %bound0 = icmp ult i8* %18, %scevgep10
  %bound1 = icmp ult i8* %26, %scevgep9
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = getelementptr i16, i16* %27, i64 %n.vec
  %ind.end12 = sub i64 %2, %n.vec
  %ind.end14 = getelementptr i32, i32* %17, i64 %n.vec
  br i1 %memcheck.conflict, label %.lr.ph.preheader20, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %43 = add i64 %n.vec, -8
  %44 = lshr exact i64 %43, 3
  %45 = and i64 %44, 1
  %lcmp.mod = icmp eq i64 %45, 0
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %46 = bitcast i8* %26 to <4 x i16>*
  %wide.load.prol = load <4 x i16>, <4 x i16>* %46, align 2, !alias.scope !1
  %47 = getelementptr i8, i8* %26, i64 8
  %48 = bitcast i8* %47 to <4 x i16>*
  %wide.load19.prol = load <4 x i16>, <4 x i16>* %48, align 2, !alias.scope !1
  %49 = zext <4 x i16> %wide.load.prol to <4 x i32>
  %50 = zext <4 x i16> %wide.load19.prol to <4 x i32>
  %51 = bitcast i32* %17 to <4 x i32>*
  store <4 x i32> %49, <4 x i32>* %51, align 4, !alias.scope !4, !noalias !1
  %52 = getelementptr i32, i32* %17, i64 4
  %53 = bitcast i32* %52 to <4 x i32>*
  store <4 x i32> %50, <4 x i32>* %53, align 4, !alias.scope !4, !noalias !1
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 8, %vector.body.prol ]
  %54 = icmp eq i64 %44, 0
  br i1 %54, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %next.gep = getelementptr i16, i16* %27, i64 %index
  %next.gep17 = getelementptr i32, i32* %17, i64 %index
  %55 = bitcast i16* %next.gep to <4 x i16>*
  %wide.load = load <4 x i16>, <4 x i16>* %55, align 2, !alias.scope !1
  %56 = getelementptr i16, i16* %next.gep, i64 4
  %57 = bitcast i16* %56 to <4 x i16>*
  %wide.load19 = load <4 x i16>, <4 x i16>* %57, align 2, !alias.scope !1
  %58 = zext <4 x i16> %wide.load to <4 x i32>
  %59 = zext <4 x i16> %wide.load19 to <4 x i32>
  %60 = bitcast i32* %next.gep17 to <4 x i32>*
  store <4 x i32> %58, <4 x i32>* %60, align 4, !alias.scope !4, !noalias !1
  %61 = getelementptr i32, i32* %next.gep17, i64 4
  %62 = bitcast i32* %61 to <4 x i32>*
  store <4 x i32> %59, <4 x i32>* %62, align 4, !alias.scope !4, !noalias !1
  %index.next = add i64 %index, 8
  %next.gep.1 = getelementptr i16, i16* %27, i64 %index.next
  %next.gep17.1 = getelementptr i32, i32* %17, i64 %index.next
  %63 = bitcast i16* %next.gep.1 to <4 x i16>*
  %wide.load.1 = load <4 x i16>, <4 x i16>* %63, align 2, !alias.scope !1
  %64 = getelementptr i16, i16* %next.gep.1, i64 4
  %65 = bitcast i16* %64 to <4 x i16>*
  %wide.load19.1 = load <4 x i16>, <4 x i16>* %65, align 2, !alias.scope !1
  %66 = zext <4 x i16> %wide.load.1 to <4 x i32>
  %67 = zext <4 x i16> %wide.load19.1 to <4 x i32>
  %68 = bitcast i32* %next.gep17.1 to <4 x i32>*
  store <4 x i32> %66, <4 x i32>* %68, align 4, !alias.scope !4, !noalias !1
  %69 = getelementptr i32, i32* %next.gep17.1, i64 4
  %70 = bitcast i32* %69 to <4 x i32>*
  store <4 x i32> %67, <4 x i32>* %70, align 4, !alias.scope !4, !noalias !1
  %index.next.1 = add i64 %index, 16
  %71 = icmp eq i64 %index.next.1, %n.vec
  br i1 %71, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !6

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %36, %n.vec
  br i1 %cmp.n, label %.loopexit, label %.lr.ph.preheader20

.lr.ph.preheader20:                               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph.preheader
  %.017.ph = phi i16* [ %27, %vector.memcheck ], [ %27, %min.iters.checked ], [ %27, %.lr.ph.preheader ], [ %ind.end, %middle.block ]
  %.036.ph = phi i64 [ %2, %vector.memcheck ], [ %2, %min.iters.checked ], [ %2, %.lr.ph.preheader ], [ %ind.end12, %middle.block ]
  %.045.ph = phi i32* [ %17, %vector.memcheck ], [ %17, %min.iters.checked ], [ %17, %.lr.ph.preheader ], [ %ind.end14, %middle.block ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader20, %.lr.ph
  %.017 = phi i16* [ %73, %.lr.ph ], [ %.017.ph, %.lr.ph.preheader20 ]
  %.036 = phi i64 [ %72, %.lr.ph ], [ %.036.ph, %.lr.ph.preheader20 ]
  %.045 = phi i32* [ %76, %.lr.ph ], [ %.045.ph, %.lr.ph.preheader20 ]
  %72 = add nsw i64 %.036, -1
  %73 = getelementptr inbounds i16, i16* %.017, i64 1
  %74 = load i16, i16* %.017, align 2
  %75 = zext i16 %74 to i32
  %76 = getelementptr inbounds i32, i32* %.045, i64 1
  store i32 %75, i32* %.045, align 4
  %77 = icmp sgt i64 %.036, 1
  br i1 %77, label %.lr.ph, label %.loopexit.loopexit, !llvm.loop !9

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %29
  tail call void @_TIFFfree(i8* nonnull %26) #3
  br label %80

; <label>:78:                                     ; preds = %16
  %79 = tail call fastcc i32 @TIFFFetchLongArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i32* %17)
  br label %80

; <label>:80:                                     ; preds = %.loopexit, %78, %22, %11, %4
  %.0 = phi i32 [ 0, %4 ], [ 0, %11 ], [ 0, %22 ], [ %30, %.loopexit ], [ %79, %78 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFFetchData(%struct.tiff*, %struct.TIFFDirEntry* nocapture readonly, i8*) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 1
  %5 = load i16, i16* %4, align 2
  %6 = zext i16 %5 to i64
  %7 = getelementptr inbounds [0 x i32], [0 x i32]* @tiffDataWidth, i64 0, i64 %6
  %8 = load i32, i32* %7, align 4
  %9 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %10 = load i32, i32* %9, align 4
  %11 = mul i32 %10, %8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %13 = load i32, i32* %12, align 8
  %14 = and i32 %13, 2048
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %32

; <label>:16:                                     ; preds = %3
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 51
  %18 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %17, align 8
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 48
  %20 = load i8*, i8** %19, align 8
  %21 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %22 = load i32, i32* %21, align 4
  %23 = tail call i32 %18(i8* %20, i32 %22, i32 0) #3
  %24 = load i32, i32* %21, align 4
  %25 = icmp eq i32 %23, %24
  br i1 %25, label %26, label %67

; <label>:26:                                     ; preds = %16
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 49
  %28 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %27, align 8
  %29 = load i8*, i8** %19, align 8
  %30 = tail call i32 %28(i8* %29, i8* %2, i32 %11) #3
  %31 = icmp eq i32 %30, %11
  br i1 %31, label %44, label %67

; <label>:32:                                     ; preds = %3
  %33 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %34 = load i32, i32* %33, align 4
  %35 = add i32 %34, %11
  %36 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 45
  %37 = load i32, i32* %36, align 8
  %38 = icmp sgt i32 %35, %37
  br i1 %38, label %67, label %39

; <label>:39:                                     ; preds = %32
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 44
  %41 = load i8*, i8** %40, align 8
  %42 = zext i32 %34 to i64
  %43 = getelementptr inbounds i8, i8* %41, i64 %42
  tail call void @_TIFFmemcpy(i8* %2, i8* %43, i32 %11) #3
  br label %44

; <label>:44:                                     ; preds = %26, %39
  %45 = load i32, i32* %12, align 8
  %46 = trunc i32 %45 to i8
  %47 = icmp slt i8 %46, 0
  br i1 %47, label %48, label %76

; <label>:48:                                     ; preds = %44
  %49 = load i16, i16* %4, align 2
  switch i16 %49, label %76 [
    i16 3, label %50
    i16 8, label %50
    i16 4, label %54
    i16 9, label %54
    i16 11, label %54
    i16 5, label %58
    i16 10, label %58
    i16 12, label %63
  ]

; <label>:50:                                     ; preds = %48, %48
  %51 = bitcast i8* %2 to i16*
  %52 = load i32, i32* %9, align 4
  %53 = zext i32 %52 to i64
  tail call void @TIFFSwabArrayOfShort(i16* %51, i64 %53) #3
  br label %76

; <label>:54:                                     ; preds = %48, %48, %48
  %55 = bitcast i8* %2 to i32*
  %56 = load i32, i32* %9, align 4
  %57 = zext i32 %56 to i64
  tail call void @TIFFSwabArrayOfLong(i32* %55, i64 %57) #3
  br label %76

; <label>:58:                                     ; preds = %48, %48
  %59 = bitcast i8* %2 to i32*
  %60 = load i32, i32* %9, align 4
  %61 = shl i32 %60, 1
  %62 = zext i32 %61 to i64
  tail call void @TIFFSwabArrayOfLong(i32* %59, i64 %62) #3
  br label %76

; <label>:63:                                     ; preds = %48
  %64 = bitcast i8* %2 to double*
  %65 = load i32, i32* %9, align 4
  %66 = zext i32 %65 to i64
  tail call void @TIFFSwabArrayOfDouble(double* %64, i64 %66) #3
  br label %76

; <label>:67:                                     ; preds = %32, %26, %16
  %68 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %69 = load i8*, i8** %68, align 8
  %70 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 0
  %71 = load i16, i16* %70, align 4
  %72 = zext i16 %71 to i32
  %73 = tail call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* nonnull %0, i32 %72) #3
  %74 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %73, i64 0, i32 7
  %75 = load i8*, i8** %74, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %69, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.20, i64 0, i64 0), i8* %75) #3
  br label %76

; <label>:76:                                     ; preds = %44, %63, %58, %54, %50, %48, %67
  %.0 = phi i32 [ 0, %67 ], [ %11, %48 ], [ %11, %50 ], [ %11, %54 ], [ %11, %58 ], [ %11, %63 ], [ %11, %44 ]
  ret i32 %.0
}

declare void @_TIFFfree(i8*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @TIFFFetchShortPair(%struct.tiff*, %struct.TIFFDirEntry* nocapture readonly) unnamed_addr #0 {
  %3 = alloca [2 x i16], align 2
  %4 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 1
  %5 = load i16, i16* %4, align 2
  switch i16 %5, label %.thread [
    i16 3, label %6
    i16 8, label %6
    i16 1, label %9
    i16 6, label %9
  ]

; <label>:6:                                      ; preds = %2, %2
  %7 = getelementptr inbounds [2 x i16], [2 x i16]* %3, i64 0, i64 0
  %8 = call fastcc i32 @TIFFFetchShortArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i16* nonnull %7)
  br label %12

; <label>:9:                                      ; preds = %2, %2
  %10 = getelementptr inbounds [2 x i16], [2 x i16]* %3, i64 0, i64 0
  %11 = call fastcc i32 @TIFFFetchByteArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i16* nonnull %10)
  br label %12

; <label>:12:                                     ; preds = %9, %6
  %.0 = phi i32 [ %11, %9 ], [ %8, %6 ]
  %13 = icmp eq i32 %.0, 0
  br i1 %13, label %.thread, label %14

; <label>:14:                                     ; preds = %12
  %15 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 0
  %16 = load i16, i16* %15, align 4
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds [2 x i16], [2 x i16]* %3, i64 0, i64 0
  %19 = load i16, i16* %18, align 2
  %20 = zext i16 %19 to i32
  %21 = getelementptr inbounds [2 x i16], [2 x i16]* %3, i64 0, i64 1
  %22 = load i16, i16* %21, align 2
  %23 = zext i16 %22 to i32
  %24 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %0, i32 %17, i32 %20, i32 %23) #3
  br label %.thread

.thread:                                          ; preds = %2, %12, %14
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @TIFFFetchRefBlackWhite(%struct.tiff*, %struct.TIFFDirEntry* readonly) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 1
  %4 = load i16, i16* %3, align 2
  %5 = icmp eq i16 %4, 5
  br i1 %5, label %6, label %8

; <label>:6:                                      ; preds = %2
  %7 = tail call fastcc i32 @TIFFFetchNormalTag(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1)
  br label %37

; <label>:8:                                      ; preds = %2
  %9 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %10 = load i32, i32* %9, align 4
  %11 = shl i32 %10, 2
  %12 = tail call fastcc i8* @CheckMalloc(%struct.tiff* %0, i32 %11, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @TIFFFetchRefBlackWhite.mesg, i64 0, i64 0))
  %cond = icmp eq i8* %12, null
  br i1 %cond, label %37, label %13

; <label>:13:                                     ; preds = %8
  %14 = bitcast i8* %12 to i32*
  %15 = tail call fastcc i32 @TIFFFetchLongArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i32* %14)
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %.critedge, label %17

; <label>:17:                                     ; preds = %13
  %18 = load i32, i32* %9, align 4
  %19 = shl i32 %18, 2
  %20 = tail call fastcc i8* @CheckMalloc(%struct.tiff* %0, i32 %19, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @TIFFFetchRefBlackWhite.mesg, i64 0, i64 0))
  %21 = bitcast i8* %20 to float*
  %22 = icmp eq i8* %20, null
  br i1 %22, label %.critedge, label %.preheader

.preheader:                                       ; preds = %17
  %23 = load i32, i32* %9, align 4
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.011 = phi i32 [ %30, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %25 = zext i32 %.011 to i64
  %26 = getelementptr inbounds i32, i32* %14, i64 %25
  %27 = load i32, i32* %26, align 4
  %28 = uitofp i32 %27 to float
  %29 = getelementptr inbounds float, float* %21, i64 %25
  store float %28, float* %29, align 4
  %30 = add i32 %.011, 1
  %31 = load i32, i32* %9, align 4
  %32 = icmp ult i32 %30, %31
  br i1 %32, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %33 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 0
  %34 = load i16, i16* %33, align 4
  %35 = zext i16 %34 to i32
  %36 = tail call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %0, i32 %35, i8* nonnull %20) #3
  tail call void @_TIFFfree(i8* nonnull %20) #3
  br label %.critedge

.critedge:                                        ; preds = %17, %._crit_edge, %13
  tail call void @_TIFFfree(i8* nonnull %12) #3
  br label %37

; <label>:37:                                     ; preds = %8, %.critedge, %6
  ret void
}

declare %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff*, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @EstimateStripByteCounts(%struct.tiff*, %struct.TIFFDirEntry* nocapture readonly, i16 zeroext) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 45
  %5 = load i32*, i32** %4, align 8
  %6 = icmp eq i32* %5, null
  br i1 %6, label %10, label %7

; <label>:7:                                      ; preds = %3
  %8 = bitcast i32** %4 to i8**
  %9 = load i8*, i8** %8, align 8
  tail call void @_TIFFfree(i8* %9) #3
  br label %10

; <label>:10:                                     ; preds = %3, %7
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  %12 = load i32, i32* %11, align 4
  %13 = shl i32 %12, 2
  %14 = tail call fastcc i8* @CheckMalloc(%struct.tiff* nonnull %0, i32 %13, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.17, i64 0, i64 0))
  %15 = bitcast i32** %4 to i8**
  store i8* %14, i8** %15, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 10
  %17 = load i16, i16* %16, align 8
  %18 = icmp eq i16 %17, 1
  br i1 %18, label %96, label %19

; <label>:19:                                     ; preds = %10
  %20 = zext i16 %2 to i32
  %21 = mul nuw nsw i32 %20, 12
  %22 = add nuw nsw i32 %21, 14
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 53
  %24 = load i32 (i8*)*, i32 (i8*)** %23, align 8
  %25 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 48
  %26 = load i8*, i8** %25, align 8
  %27 = tail call i32 %24(i8* %26) #3
  %28 = icmp eq i16 %2, 0
  br i1 %28, label %._crit_edge13, label %.lr.ph12.preheader

.lr.ph12.preheader:                               ; preds = %19
  %xtraiter = and i16 %2, 1
  %lcmp.mod = icmp eq i16 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph12.prol.loopexit, label %.lr.ph12.prol

.lr.ph12.prol:                                    ; preds = %.lr.ph12.preheader
  %29 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %30 = load i32, i32* %29, align 4
  %31 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 1
  %32 = load i16, i16* %31, align 2
  %33 = zext i16 %32 to i64
  %34 = getelementptr inbounds [0 x i32], [0 x i32]* @tiffDataWidth, i64 0, i64 %33
  %35 = load i32, i32* %34, align 4
  %36 = mul i32 %35, %30
  %37 = icmp ugt i32 %36, 4
  %38 = select i1 %37, i32 %36, i32 0
  %..01.prol = add i32 %38, %22
  %39 = add i16 %2, -1
  %40 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 1
  br label %.lr.ph12.prol.loopexit

.lr.ph12.prol.loopexit:                           ; preds = %.lr.ph12.preheader, %.lr.ph12.prol
  %..01.lcssa.unr = phi i32 [ undef, %.lr.ph12.preheader ], [ %..01.prol, %.lr.ph12.prol ]
  %.010.unr = phi i16 [ %2, %.lr.ph12.preheader ], [ %39, %.lr.ph12.prol ]
  %.019.unr = phi i32 [ %22, %.lr.ph12.preheader ], [ %..01.prol, %.lr.ph12.prol ]
  %.048.unr = phi %struct.TIFFDirEntry* [ %1, %.lr.ph12.preheader ], [ %40, %.lr.ph12.prol ]
  %41 = icmp eq i16 %2, 1
  br i1 %41, label %._crit_edge13, label %.lr.ph12.preheader17

.lr.ph12.preheader17:                             ; preds = %.lr.ph12.prol.loopexit
  br label %.lr.ph12

.lr.ph12:                                         ; preds = %.lr.ph12.preheader17, %.lr.ph12
  %.010 = phi i16 [ %62, %.lr.ph12 ], [ %.010.unr, %.lr.ph12.preheader17 ]
  %.019 = phi i32 [ %..01.1, %.lr.ph12 ], [ %.019.unr, %.lr.ph12.preheader17 ]
  %.048 = phi %struct.TIFFDirEntry* [ %63, %.lr.ph12 ], [ %.048.unr, %.lr.ph12.preheader17 ]
  %42 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.048, i64 0, i32 2
  %43 = load i32, i32* %42, align 4
  %44 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.048, i64 0, i32 1
  %45 = load i16, i16* %44, align 2
  %46 = zext i16 %45 to i64
  %47 = getelementptr inbounds [0 x i32], [0 x i32]* @tiffDataWidth, i64 0, i64 %46
  %48 = load i32, i32* %47, align 4
  %49 = mul i32 %48, %43
  %50 = icmp ugt i32 %49, 4
  %51 = select i1 %50, i32 %49, i32 0
  %..01 = add i32 %51, %.019
  %52 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.048, i64 1, i32 2
  %53 = load i32, i32* %52, align 4
  %54 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.048, i64 1, i32 1
  %55 = load i16, i16* %54, align 2
  %56 = zext i16 %55 to i64
  %57 = getelementptr inbounds [0 x i32], [0 x i32]* @tiffDataWidth, i64 0, i64 %56
  %58 = load i32, i32* %57, align 4
  %59 = mul i32 %58, %53
  %60 = icmp ugt i32 %59, 4
  %61 = select i1 %60, i32 %59, i32 0
  %..01.1 = add i32 %61, %..01
  %62 = add i16 %.010, -2
  %63 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.048, i64 2
  %64 = icmp eq i16 %62, 0
  br i1 %64, label %._crit_edge13.loopexit, label %.lr.ph12

._crit_edge13.loopexit:                           ; preds = %.lr.ph12
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.lr.ph12.prol.loopexit, %19
  %.01.lcssa = phi i32 [ %22, %19 ], [ %..01.lcssa.unr, %.lr.ph12.prol.loopexit ], [ %..01.1, %._crit_edge13.loopexit ]
  %65 = sub i32 %27, %.01.lcssa
  %66 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %67 = load i16, i16* %66, align 2
  %68 = icmp eq i16 %67, 2
  br i1 %68, label %69, label %74

; <label>:69:                                     ; preds = %._crit_edge13
  %70 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %71 = load i16, i16* %70, align 2
  %72 = zext i16 %71 to i32
  %73 = udiv i32 %65, %72
  br label %74

; <label>:74:                                     ; preds = %69, %._crit_edge13
  %.2 = phi i32 [ %73, %69 ], [ %65, %._crit_edge13 ]
  %75 = load i32, i32* %11, align 4
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %._crit_edge, label %.lr.ph7.preheader

.lr.ph7.preheader:                                ; preds = %74
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7.preheader, %.lr.ph7
  %.026 = phi i16 [ %80, %.lr.ph7 ], [ 0, %.lr.ph7.preheader ]
  %77 = load i32*, i32** %4, align 8
  %78 = zext i16 %.026 to i64
  %79 = getelementptr inbounds i32, i32* %77, i64 %78
  store i32 %.2, i32* %79, align 4
  %80 = add i16 %.026, 1
  %81 = zext i16 %80 to i32
  %82 = load i32, i32* %11, align 4
  %83 = icmp ult i32 %81, %82
  br i1 %83, label %.lr.ph7, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph7
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %74
  %.02.lcssa = phi i16 [ -1, %74 ], [ %.026, %._crit_edge.loopexit ]
  %84 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 44
  %85 = load i32*, i32** %84, align 8
  %86 = zext i16 %.02.lcssa to i64
  %87 = getelementptr inbounds i32, i32* %85, i64 %86
  %88 = load i32, i32* %87, align 4
  %89 = load i32*, i32** %4, align 8
  %90 = getelementptr inbounds i32, i32* %89, i64 %86
  %91 = load i32, i32* %90, align 4
  %92 = add i32 %91, %88
  %93 = icmp sgt i32 %92, %27
  br i1 %93, label %94, label %.loopexit

; <label>:94:                                     ; preds = %._crit_edge
  %95 = sub i32 %27, %88
  store i32 %95, i32* %90, align 4
  br label %.loopexit

; <label>:96:                                     ; preds = %10
  %97 = tail call i32 @TIFFScanlineSize(%struct.tiff* nonnull %0) #3
  %98 = load i32, i32* %11, align 4
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %96
  %100 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %101 = load i32, i32* %100, align 4
  %102 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 42
  %103 = load i32, i32* %102, align 8
  %104 = udiv i32 %101, %103
  %105 = mul i32 %104, %97
  br label %106

; <label>:106:                                    ; preds = %.lr.ph, %106
  %.135 = phi i16 [ 0, %.lr.ph ], [ %110, %106 ]
  %107 = load i32*, i32** %4, align 8
  %108 = zext i16 %.135 to i64
  %109 = getelementptr inbounds i32, i32* %107, i64 %108
  store i32 %105, i32* %109, align 4
  %110 = add i16 %.135, 1
  %111 = zext i16 %110 to i32
  %112 = load i32, i32* %11, align 4
  %113 = icmp ult i32 %111, %112
  br i1 %113, label %106, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %106
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %96, %._crit_edge, %94
  %114 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 0
  %115 = load i64, i64* %114, align 8
  %116 = or i64 %115, 16777216
  store i64 %116, i64* %114, align 8
  %117 = and i64 %115, 131072
  %118 = icmp eq i64 %117, 0
  br i1 %118, label %119, label %123

; <label>:119:                                    ; preds = %.loopexit
  %120 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %121 = load i32, i32* %120, align 4
  %122 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  store i32 %121, i32* %122, align 4
  br label %123

; <label>:123:                                    ; preds = %.loopexit, %119
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @ChopUpSingleUncompressedStrip(%struct.tiff*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 45
  %3 = load i32*, i32** %2, align 8
  %4 = load i32, i32* %3, align 4
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 44
  %6 = load i32*, i32** %5, align 8
  %7 = load i32, i32* %6, align 4
  %8 = tail call i32 @TIFFVTileSize(%struct.tiff* %0, i32 1) #3
  %9 = icmp sgt i32 %8, 8192
  br i1 %9, label %13, label %10

; <label>:10:                                     ; preds = %1
  %11 = sdiv i32 8192, %8
  %12 = mul i32 %11, %8
  br label %13

; <label>:13:                                     ; preds = %1, %10
  %.04 = phi i32 [ %12, %10 ], [ %8, %1 ]
  %.0 = phi i32 [ %11, %10 ], [ 1, %1 ]
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %15 = load i32, i32* %14, align 4
  %16 = icmp ult i32 %.0, %15
  br i1 %16, label %17, label %47

; <label>:17:                                     ; preds = %13
  %18 = add i32 %4, -1
  %19 = add i32 %18, %.04
  %20 = udiv i32 %19, %.04
  %21 = shl i32 %20, 2
  %22 = tail call fastcc i8* @CheckMalloc(%struct.tiff* nonnull %0, i32 %21, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.27, i64 0, i64 0))
  %23 = bitcast i8* %22 to i32*
  %24 = tail call fastcc i8* @CheckMalloc(%struct.tiff* nonnull %0, i32 %21, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.28, i64 0, i64 0))
  %25 = bitcast i8* %24 to i32*
  %26 = icmp eq i8* %22, null
  %27 = icmp eq i8* %24, null
  %or.cond = or i1 %26, %27
  br i1 %or.cond, label %30, label %.preheader

.preheader:                                       ; preds = %17
  %28 = icmp ugt i32 %.04, %19
  br i1 %28, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  %29 = zext i32 %20 to i64
  br label %.lr.ph

; <label>:30:                                     ; preds = %17
  br i1 %26, label %32, label %31

; <label>:31:                                     ; preds = %30
  tail call void @_TIFFfree(i8* nonnull %22) #3
  br label %32

; <label>:32:                                     ; preds = %30, %31
  br i1 %27, label %47, label %33

; <label>:33:                                     ; preds = %32
  tail call void @_TIFFfree(i8* nonnull %24) #3
  br label %47

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph ]
  %.027 = phi i32 [ %4, %.lr.ph.preheader ], [ %37, %.lr.ph ]
  %.036 = phi i32 [ %7, %.lr.ph.preheader ], [ %38, %.lr.ph ]
  %.15 = phi i32 [ %.04, %.lr.ph.preheader ], [ %.02..1, %.lr.ph ]
  %34 = icmp sgt i32 %.15, %.027
  %.02..1 = select i1 %34, i32 %.027, i32 %.15
  %35 = getelementptr inbounds i32, i32* %23, i64 %indvars.iv
  store i32 %.02..1, i32* %35, align 4
  %36 = getelementptr inbounds i32, i32* %25, i64 %indvars.iv
  store i32 %.036, i32* %36, align 4
  %37 = sub i32 %.027, %.02..1
  %38 = add i32 %.02..1, %.036
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %39 = icmp ult i64 %indvars.iv.next, %29
  br i1 %39, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  store i32 %20, i32* %40, align 4
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 42
  store i32 %20, i32* %41, align 8
  %42 = tail call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %0, i32 278, i32 %.0) #3
  %43 = bitcast i32** %2 to i8**
  %44 = load i8*, i8** %43, align 8
  tail call void @_TIFFfree(i8* %44) #3
  %45 = bitcast i32** %5 to i8**
  %46 = load i8*, i8** %45, align 8
  tail call void @_TIFFfree(i8* %46) #3
  store i8* %22, i8** %43, align 8
  store i8* %24, i8** %45, align 8
  br label %47

; <label>:47:                                     ; preds = %33, %32, %13, %._crit_edge
  ret void
}

declare i32 @TIFFTileSize(%struct.tiff*) local_unnamed_addr #1

declare i32 @TIFFScanlineSize(%struct.tiff*) local_unnamed_addr #1

declare i8* @_TIFFmalloc(i32) local_unnamed_addr #1

declare void @TIFFSwabArrayOfDouble(double*, i64) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFFetchShortArray(%struct.tiff*, %struct.TIFFDirEntry* nocapture readonly, i16*) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %5 = load i32, i32* %4, align 4
  %6 = icmp ult i32 %5, 3
  br i1 %6, label %7, label %33

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 7, i32 0
  %9 = load i16, i16* %8, align 8
  %10 = icmp eq i16 %9, 19789
  br i1 %10, label %11, label %22

; <label>:11:                                     ; preds = %7
  switch i32 %5, label %38 [
    i32 2, label %12
    i32 1, label %17
  ]

; <label>:12:                                     ; preds = %11
  %13 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %14 = load i32, i32* %13, align 4
  %15 = trunc i32 %14 to i16
  %16 = getelementptr inbounds i16, i16* %2, i64 1
  store i16 %15, i16* %16, align 2
  br label %17

; <label>:17:                                     ; preds = %12, %11
  %18 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %19 = load i32, i32* %18, align 4
  %20 = lshr i32 %19, 16
  %21 = trunc i32 %20 to i16
  store i16 %21, i16* %2, align 2
  br label %38

; <label>:22:                                     ; preds = %7
  switch i32 %5, label %38 [
    i32 2, label %23
    i32 1, label %29
  ]

; <label>:23:                                     ; preds = %22
  %24 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %25 = load i32, i32* %24, align 4
  %26 = lshr i32 %25, 16
  %27 = trunc i32 %26 to i16
  %28 = getelementptr inbounds i16, i16* %2, i64 1
  store i16 %27, i16* %28, align 2
  br label %29

; <label>:29:                                     ; preds = %23, %22
  %30 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %31 = load i32, i32* %30, align 4
  %32 = trunc i32 %31 to i16
  store i16 %32, i16* %2, align 2
  br label %38

; <label>:33:                                     ; preds = %3
  %34 = bitcast i16* %2 to i8*
  %35 = tail call fastcc i32 @TIFFFetchData(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i8* %34)
  %36 = icmp ne i32 %35, 0
  %37 = zext i1 %36 to i32
  br label %38

; <label>:38:                                     ; preds = %17, %11, %29, %22, %33
  %.0 = phi i32 [ %37, %33 ], [ 1, %22 ], [ 1, %29 ], [ 1, %11 ], [ 1, %17 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFFetchByteArray(%struct.tiff*, %struct.TIFFDirEntry* nocapture readonly, i16*) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %5 = load i32, i32* %4, align 4
  %6 = icmp ult i32 %5, 5
  br i1 %6, label %7, label %63

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 7, i32 0
  %9 = load i16, i16* %8, align 8
  %10 = icmp eq i16 %9, 19789
  br i1 %10, label %11, label %37

; <label>:11:                                     ; preds = %7
  switch i32 %5, label %68 [
    i32 4, label %12
    i32 3, label %18
    i32 2, label %25
    i32 1, label %32
  ]

; <label>:12:                                     ; preds = %11
  %13 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %14 = load i32, i32* %13, align 4
  %15 = trunc i32 %14 to i16
  %16 = and i16 %15, 255
  %17 = getelementptr inbounds i16, i16* %2, i64 3
  store i16 %16, i16* %17, align 2
  br label %18

; <label>:18:                                     ; preds = %12, %11
  %19 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %20 = load i32, i32* %19, align 4
  %21 = lshr i32 %20, 8
  %22 = trunc i32 %21 to i16
  %23 = and i16 %22, 255
  %24 = getelementptr inbounds i16, i16* %2, i64 2
  store i16 %23, i16* %24, align 2
  br label %25

; <label>:25:                                     ; preds = %18, %11
  %26 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %27 = load i32, i32* %26, align 4
  %28 = lshr i32 %27, 16
  %29 = trunc i32 %28 to i16
  %30 = and i16 %29, 255
  %31 = getelementptr inbounds i16, i16* %2, i64 1
  store i16 %30, i16* %31, align 2
  br label %32

; <label>:32:                                     ; preds = %25, %11
  %33 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %34 = load i32, i32* %33, align 4
  %35 = lshr i32 %34, 24
  %36 = trunc i32 %35 to i16
  store i16 %36, i16* %2, align 2
  br label %68

; <label>:37:                                     ; preds = %7
  switch i32 %5, label %68 [
    i32 4, label %38
    i32 3, label %44
    i32 2, label %51
    i32 1, label %58
  ]

; <label>:38:                                     ; preds = %37
  %39 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %40 = load i32, i32* %39, align 4
  %41 = lshr i32 %40, 24
  %42 = trunc i32 %41 to i16
  %43 = getelementptr inbounds i16, i16* %2, i64 3
  store i16 %42, i16* %43, align 2
  br label %44

; <label>:44:                                     ; preds = %38, %37
  %45 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %46 = load i32, i32* %45, align 4
  %47 = lshr i32 %46, 16
  %48 = trunc i32 %47 to i16
  %49 = and i16 %48, 255
  %50 = getelementptr inbounds i16, i16* %2, i64 2
  store i16 %49, i16* %50, align 2
  br label %51

; <label>:51:                                     ; preds = %44, %37
  %52 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %53 = load i32, i32* %52, align 4
  %54 = lshr i32 %53, 8
  %55 = trunc i32 %54 to i16
  %56 = and i16 %55, 255
  %57 = getelementptr inbounds i16, i16* %2, i64 1
  store i16 %56, i16* %57, align 2
  br label %58

; <label>:58:                                     ; preds = %51, %37
  %59 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %60 = load i32, i32* %59, align 4
  %61 = trunc i32 %60 to i16
  %62 = and i16 %61, 255
  store i16 %62, i16* %2, align 2
  br label %68

; <label>:63:                                     ; preds = %3
  %64 = bitcast i16* %2 to i8*
  %65 = tail call fastcc i32 @TIFFFetchData(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i8* %64)
  %66 = icmp ne i32 %65, 0
  %67 = zext i1 %66 to i32
  br label %68

; <label>:68:                                     ; preds = %32, %11, %58, %37, %63
  %.0 = phi i32 [ %67, %63 ], [ 1, %37 ], [ 1, %58 ], [ 1, %11 ], [ 1, %32 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFFetchLongArray(%struct.tiff*, %struct.TIFFDirEntry* nocapture readonly, i32*) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %5 = load i32, i32* %4, align 4
  %6 = icmp eq i32 %5, 1
  br i1 %6, label %7, label %10

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %9 = load i32, i32* %8, align 4
  store i32 %9, i32* %2, align 4
  br label %15

; <label>:10:                                     ; preds = %3
  %11 = bitcast i32* %2 to i8*
  %12 = tail call fastcc i32 @TIFFFetchData(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i8* %11)
  %13 = icmp ne i32 %12, 0
  %14 = zext i1 %13 to i32
  br label %15

; <label>:15:                                     ; preds = %10, %7
  %.0 = phi i32 [ 1, %7 ], [ %14, %10 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFFetchRationalArray(%struct.tiff*, %struct.TIFFDirEntry* nocapture readonly, float* nocapture) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %5 = load i32, i32* %4, align 4
  %6 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 1
  %7 = load i16, i16* %6, align 2
  %8 = zext i16 %7 to i64
  %9 = getelementptr inbounds [0 x i32], [0 x i32]* @tiffDataWidth, i64 0, i64 %8
  %10 = load i32, i32* %9, align 4
  %11 = mul i32 %10, %5
  %12 = tail call fastcc i8* @CheckMalloc(%struct.tiff* %0, i32 %11, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.21, i64 0, i64 0))
  %13 = bitcast i8* %12 to i32*
  %14 = icmp eq i8* %12, null
  br i1 %14, label %36, label %15

; <label>:15:                                     ; preds = %3
  %16 = tail call fastcc i32 @TIFFFetchData(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i8* nonnull %12)
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %15
  %18 = load i32, i32* %4, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

; <label>:20:                                     ; preds = %.lr.ph
  %21 = load i32, i32* %4, align 4
  %22 = icmp ult i32 %35, %21
  br i1 %22, label %.lr.ph, label %.loopexit.loopexit

.lr.ph:                                           ; preds = %.lr.ph.preheader, %20
  %.02 = phi i32 [ %35, %20 ], [ 0, %.lr.ph.preheader ]
  %23 = shl i32 %.02, 1
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32* %13, i64 %24
  %26 = load i32, i32* %25, align 4
  %27 = or i32 %23, 1
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32* %13, i64 %28
  %30 = load i32, i32* %29, align 4
  %31 = zext i32 %.02 to i64
  %32 = getelementptr inbounds float, float* %2, i64 %31
  %33 = tail call fastcc i32 @cvtRational(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i32 %26, i32 %30, float* %32)
  %34 = icmp eq i32 %33, 0
  %35 = add i32 %.02, 1
  br i1 %34, label %.loopexit.loopexit, label %20

.loopexit.loopexit:                               ; preds = %20, %.lr.ph
  %.2.ph = phi i32 [ 0, %.lr.ph ], [ %33, %20 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %15
  %.2 = phi i32 [ 0, %15 ], [ 0, %.preheader ], [ %.2.ph, %.loopexit.loopexit ]
  tail call void @_TIFFfree(i8* nonnull %12) #3
  br label %36

; <label>:36:                                     ; preds = %3, %.loopexit
  %.3 = phi i32 [ %.2, %.loopexit ], [ 0, %3 ]
  ret i32 %.3
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFFetchFloatArray(%struct.tiff*, %struct.TIFFDirEntry* nocapture readonly, float*) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %5 = load i32, i32* %4, align 4
  %6 = icmp eq i32 %5, 1
  br i1 %6, label %7, label %11

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %9 = load i32, i32* %8, align 4
  %10 = bitcast float* %2 to i32*
  store i32 %9, i32* %10, align 4
  br label %14

; <label>:11:                                     ; preds = %3
  %12 = bitcast float* %2 to i8*
  %13 = tail call fastcc i32 @TIFFFetchData(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i8* %12)
  %not. = icmp ne i32 %13, 0
  %. = zext i1 %not. to i32
  br label %14

; <label>:14:                                     ; preds = %11, %7
  %.0 = phi i32 [ 1, %7 ], [ %., %11 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFFetchDoubleArray(%struct.tiff*, %struct.TIFFDirEntry* nocapture readonly, double*) unnamed_addr #0 {
  %4 = bitcast double* %2 to i8*
  %5 = tail call fastcc i32 @TIFFFetchData(%struct.tiff* %0, %struct.TIFFDirEntry* %1, i8* %4)
  %not. = icmp ne i32 %5, 0
  %. = zext i1 %not. to i32
  ret i32 %.
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFFetchString(%struct.tiff*, %struct.TIFFDirEntry* nocapture readonly, i8*) unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %6 = load i32, i32* %5, align 4
  %7 = icmp ult i32 %6, 5
  br i1 %7, label %8, label %19

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %10 = load i32, i32* %9, align 4
  store i32 %10, i32* %4, align 4
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %12 = load i32, i32* %11, align 8
  %13 = trunc i32 %12 to i8
  %14 = icmp slt i8 %13, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %8
  call void @TIFFSwabLong(i32* nonnull %4) #3
  br label %16

; <label>:16:                                     ; preds = %15, %8
  %17 = bitcast i32* %4 to i8*
  %18 = load i32, i32* %5, align 4
  call void @_TIFFmemcpy(i8* %2, i8* nonnull %17, i32 %18) #3
  br label %21

; <label>:19:                                     ; preds = %3
  %20 = tail call fastcc i32 @TIFFFetchData(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i8* %2)
  br label %21

; <label>:21:                                     ; preds = %19, %16
  %.0 = phi i32 [ 1, %16 ], [ %20, %19 ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal fastcc float @TIFFFetchFloat(%struct.tiff* nocapture readonly, %struct.TIFFDirEntry* nocapture readonly) unnamed_addr #2 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 7, i32 0
  %4 = load i16, i16* %3, align 8
  %5 = icmp eq i16 %4, 19789
  %6 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %7 = load i32, i32* %6, align 4
  br i1 %5, label %8, label %17

; <label>:8:                                      ; preds = %2
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 9
  %10 = load i32*, i32** %9, align 8
  %11 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 1
  %12 = load i16, i16* %11, align 2
  %13 = zext i16 %12 to i64
  %14 = getelementptr inbounds i32, i32* %10, i64 %13
  %15 = load i32, i32* %14, align 4
  %16 = lshr i32 %7, %15
  br label %17

; <label>:17:                                     ; preds = %2, %8
  %.sink8 = phi i32 [ %16, %8 ], [ %7, %2 ]
  %18 = zext i32 %.sink8 to i64
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 10
  %20 = load i64*, i64** %19, align 8
  %21 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 1
  %22 = load i16, i16* %21, align 2
  %23 = zext i16 %22 to i64
  %24 = getelementptr inbounds i64, i64* %20, i64 %23
  %25 = load i64, i64* %24, align 8
  %26 = and i64 %25, %18
  %.sroa.0.0.extract.trunc = trunc i64 %26 to i32
  %27 = bitcast i32 %.sroa.0.0.extract.trunc to float
  ret float %27
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc float @TIFFFetchRational(%struct.tiff*, %struct.TIFFDirEntry* nocapture readonly) unnamed_addr #0 {
  %3 = alloca [2 x i32], align 4
  %4 = alloca float, align 4
  %5 = bitcast [2 x i32]* %3 to i8*
  %6 = call fastcc i32 @TIFFFetchData(%struct.tiff* %0, %struct.TIFFDirEntry* %1, i8* nonnull %5)
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %16, label %8

; <label>:8:                                      ; preds = %2
  %9 = getelementptr inbounds [2 x i32], [2 x i32]* %3, i64 0, i64 0
  %10 = load i32, i32* %9, align 4
  %11 = getelementptr inbounds [2 x i32], [2 x i32]* %3, i64 0, i64 1
  %12 = load i32, i32* %11, align 4
  %13 = call fastcc i32 @cvtRational(%struct.tiff* %0, %struct.TIFFDirEntry* %1, i32 %10, i32 %12, float* nonnull %4)
  %14 = icmp eq i32 %13, 0
  %15 = load float, float* %4, align 4
  %. = select i1 %14, float 1.000000e+00, float %15
  ret float %.

; <label>:16:                                     ; preds = %2
  ret float 1.000000e+00
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @cvtRational(%struct.tiff*, %struct.TIFFDirEntry* nocapture readonly, i32, i32, float* nocapture) unnamed_addr #0 {
  %6 = icmp eq i32 %3, 0
  br i1 %6, label %7, label %16

; <label>:7:                                      ; preds = %5
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %9 = load i8*, i8** %8, align 8
  %10 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 0
  %11 = load i16, i16* %10, align 4
  %12 = zext i16 %11 to i32
  %13 = tail call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %0, i32 %12) #3
  %14 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %13, i64 0, i32 7
  %15 = load i8*, i8** %14, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %9, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.22, i64 0, i64 0), i8* %15, i32 %2) #3
  br label %29

; <label>:16:                                     ; preds = %5
  %17 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 1
  %18 = load i16, i16* %17, align 2
  %19 = icmp eq i16 %18, 5
  br i1 %19, label %20, label %24

; <label>:20:                                     ; preds = %16
  %21 = uitofp i32 %2 to float
  %22 = uitofp i32 %3 to float
  %23 = fdiv float %21, %22
  br label %28

; <label>:24:                                     ; preds = %16
  %25 = sitofp i32 %2 to float
  %26 = sitofp i32 %3 to float
  %27 = fdiv float %25, %26
  br label %28

; <label>:28:                                     ; preds = %24, %20
  %storemerge = phi float [ %27, %24 ], [ %23, %20 ]
  store float %storemerge, float* %4, align 4
  br label %29

; <label>:29:                                     ; preds = %28, %7
  %.0 = phi i32 [ 0, %7 ], [ 1, %28 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFFetchAnyArray(%struct.tiff*, %struct.TIFFDirEntry* nocapture readonly, double*) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 1
  %5 = load i16, i16* %4, align 2
  switch i16 %5, label %238 [
    i16 1, label %6
    i16 6, label %6
    i16 3, label %62
    i16 8, label %62
    i16 4, label %118
    i16 9, label %118
    i16 5, label %174
    i16 10, label %174
    i16 11, label %205
    i16 12, label %236
  ]

; <label>:6:                                      ; preds = %3, %3
  %7 = bitcast double* %2 to i16*
  %8 = tail call fastcc i32 @TIFFFetchByteArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i16* %7)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %.loopexit, label %10

; <label>:10:                                     ; preds = %6
  %11 = load i16, i16* %4, align 2
  %12 = icmp eq i16 %11, 1
  %13 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %14 = load i32, i32* %13, align 4
  %.0114 = add i32 %14, -1
  %15 = icmp sgt i32 %.0114, -1
  br i1 %12, label %.preheader, label %.preheader2

.preheader2:                                      ; preds = %10
  br i1 %15, label %.lr.ph18.preheader, label %.loopexit

.lr.ph18.preheader:                               ; preds = %.preheader2
  %16 = sext i32 %.0114 to i64
  %xtraiter46 = and i32 %14, 3
  %lcmp.mod47 = icmp eq i32 %xtraiter46, 0
  br i1 %lcmp.mod47, label %.lr.ph18.prol.loopexit, label %.lr.ph18.prol.preheader

.lr.ph18.prol.preheader:                          ; preds = %.lr.ph18.preheader
  br label %.lr.ph18.prol

.lr.ph18.prol:                                    ; preds = %.lr.ph18.prol.preheader, %.lr.ph18.prol
  %indvars.iv44.prol = phi i64 [ %indvars.iv.next45.prol, %.lr.ph18.prol ], [ %16, %.lr.ph18.prol.preheader ]
  %.117.prol = phi i32 [ %.1.prol, %.lr.ph18.prol ], [ %.0114, %.lr.ph18.prol.preheader ]
  %prol.iter48 = phi i32 [ %prol.iter48.sub, %.lr.ph18.prol ], [ %xtraiter46, %.lr.ph18.prol.preheader ]
  %17 = getelementptr inbounds i16, i16* %7, i64 %indvars.iv44.prol
  %18 = load i16, i16* %17, align 2
  %19 = sitofp i16 %18 to double
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv44.prol
  store double %19, double* %20, align 8
  %.1.prol = add i32 %.117.prol, -1
  %indvars.iv.next45.prol = add nsw i64 %indvars.iv44.prol, -1
  %prol.iter48.sub = add i32 %prol.iter48, -1
  %prol.iter48.cmp = icmp eq i32 %prol.iter48.sub, 0
  br i1 %prol.iter48.cmp, label %.lr.ph18.prol.loopexit.loopexit, label %.lr.ph18.prol, !llvm.loop !10

.lr.ph18.prol.loopexit.loopexit:                  ; preds = %.lr.ph18.prol
  br label %.lr.ph18.prol.loopexit

.lr.ph18.prol.loopexit:                           ; preds = %.lr.ph18.prol.loopexit.loopexit, %.lr.ph18.preheader
  %indvars.iv44.unr = phi i64 [ %16, %.lr.ph18.preheader ], [ %indvars.iv.next45.prol, %.lr.ph18.prol.loopexit.loopexit ]
  %.117.unr = phi i32 [ %.0114, %.lr.ph18.preheader ], [ %.1.prol, %.lr.ph18.prol.loopexit.loopexit ]
  %21 = icmp ult i32 %.0114, 3
  br i1 %21, label %.loopexit, label %.lr.ph18.preheader110

.lr.ph18.preheader110:                            ; preds = %.lr.ph18.prol.loopexit
  br label %.lr.ph18

.preheader:                                       ; preds = %10
  br i1 %15, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.preheader
  %22 = sext i32 %.0114 to i64
  %xtraiter = and i32 %14, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph.prol ], [ %22, %.lr.ph.prol.preheader ]
  %.0115.prol = phi i32 [ %.01.prol, %.lr.ph.prol ], [ %.0114, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %23 = getelementptr inbounds i16, i16* %7, i64 %indvars.iv.prol
  %24 = load i16, i16* %23, align 2
  %25 = uitofp i16 %24 to double
  %26 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  store double %25, double* %26, align 8
  %.01.prol = add i32 %.0115.prol, -1
  %indvars.iv.next.prol = add nsw i64 %indvars.iv.prol, -1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !12

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv.unr = phi i64 [ %22, %.lr.ph.preheader ], [ %indvars.iv.next.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.0115.unr = phi i32 [ %.0114, %.lr.ph.preheader ], [ %.01.prol, %.lr.ph.prol.loopexit.loopexit ]
  %27 = icmp ult i32 %.0114, 3
  br i1 %27, label %.loopexit, label %.lr.ph.preheader109

.lr.ph.preheader109:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader109, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph ], [ %indvars.iv.unr, %.lr.ph.preheader109 ]
  %.0115 = phi i32 [ %.01.3, %.lr.ph ], [ %.0115.unr, %.lr.ph.preheader109 ]
  %28 = getelementptr inbounds i16, i16* %7, i64 %indvars.iv
  %29 = load i16, i16* %28, align 2
  %30 = uitofp i16 %29 to double
  %31 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  store double %30, double* %31, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %32 = getelementptr inbounds i16, i16* %7, i64 %indvars.iv.next
  %33 = load i16, i16* %32, align 2
  %34 = uitofp i16 %33 to double
  %35 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  store double %34, double* %35, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, -2
  %36 = getelementptr inbounds i16, i16* %7, i64 %indvars.iv.next.1
  %37 = load i16, i16* %36, align 2
  %38 = uitofp i16 %37 to double
  %39 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  store double %38, double* %39, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, -3
  %40 = getelementptr inbounds i16, i16* %7, i64 %indvars.iv.next.2
  %41 = load i16, i16* %40, align 2
  %42 = uitofp i16 %41 to double
  %43 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  store double %42, double* %43, align 8
  %.01.3 = add i32 %.0115, -4
  %44 = icmp sgt i32 %.01.3, -1
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, -4
  br i1 %44, label %.lr.ph, label %.loopexit.loopexit

.lr.ph18:                                         ; preds = %.lr.ph18.preheader110, %.lr.ph18
  %indvars.iv44 = phi i64 [ %indvars.iv.next45.3, %.lr.ph18 ], [ %indvars.iv44.unr, %.lr.ph18.preheader110 ]
  %.117 = phi i32 [ %.1.3, %.lr.ph18 ], [ %.117.unr, %.lr.ph18.preheader110 ]
  %45 = getelementptr inbounds i16, i16* %7, i64 %indvars.iv44
  %46 = load i16, i16* %45, align 2
  %47 = sitofp i16 %46 to double
  %48 = getelementptr inbounds double, double* %2, i64 %indvars.iv44
  store double %47, double* %48, align 8
  %indvars.iv.next45 = add nsw i64 %indvars.iv44, -1
  %49 = getelementptr inbounds i16, i16* %7, i64 %indvars.iv.next45
  %50 = load i16, i16* %49, align 2
  %51 = sitofp i16 %50 to double
  %52 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next45
  store double %51, double* %52, align 8
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, -2
  %53 = getelementptr inbounds i16, i16* %7, i64 %indvars.iv.next45.1
  %54 = load i16, i16* %53, align 2
  %55 = sitofp i16 %54 to double
  %56 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next45.1
  store double %55, double* %56, align 8
  %indvars.iv.next45.2 = add nsw i64 %indvars.iv44, -3
  %57 = getelementptr inbounds i16, i16* %7, i64 %indvars.iv.next45.2
  %58 = load i16, i16* %57, align 2
  %59 = sitofp i16 %58 to double
  %60 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next45.2
  store double %59, double* %60, align 8
  %.1.3 = add i32 %.117, -4
  %61 = icmp sgt i32 %.1.3, -1
  %indvars.iv.next45.3 = add nsw i64 %indvars.iv44, -4
  br i1 %61, label %.lr.ph18, label %.loopexit.loopexit111

; <label>:62:                                     ; preds = %3, %3
  %63 = bitcast double* %2 to i16*
  %64 = tail call fastcc i32 @TIFFFetchShortArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i16* %63)
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %.loopexit, label %66

; <label>:66:                                     ; preds = %62
  %67 = load i16, i16* %4, align 2
  %68 = icmp eq i16 %67, 3
  %69 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %70 = load i32, i32* %69, align 4
  %.219 = add i32 %70, -1
  %71 = icmp sgt i32 %.219, -1
  br i1 %68, label %.preheader4, label %.preheader6

.preheader6:                                      ; preds = %66
  br i1 %71, label %.lr.ph24.preheader, label %.loopexit

.lr.ph24.preheader:                               ; preds = %.preheader6
  %72 = sext i32 %.219 to i64
  %xtraiter56 = and i32 %70, 3
  %lcmp.mod57 = icmp eq i32 %xtraiter56, 0
  br i1 %lcmp.mod57, label %.lr.ph24.prol.loopexit, label %.lr.ph24.prol.preheader

.lr.ph24.prol.preheader:                          ; preds = %.lr.ph24.preheader
  br label %.lr.ph24.prol

.lr.ph24.prol:                                    ; preds = %.lr.ph24.prol.preheader, %.lr.ph24.prol
  %indvars.iv54.prol = phi i64 [ %indvars.iv.next55.prol, %.lr.ph24.prol ], [ %72, %.lr.ph24.prol.preheader ]
  %.323.prol = phi i32 [ %.3.prol, %.lr.ph24.prol ], [ %.219, %.lr.ph24.prol.preheader ]
  %prol.iter58 = phi i32 [ %prol.iter58.sub, %.lr.ph24.prol ], [ %xtraiter56, %.lr.ph24.prol.preheader ]
  %73 = getelementptr inbounds i16, i16* %63, i64 %indvars.iv54.prol
  %74 = load i16, i16* %73, align 2
  %75 = sitofp i16 %74 to double
  %76 = getelementptr inbounds double, double* %2, i64 %indvars.iv54.prol
  store double %75, double* %76, align 8
  %.3.prol = add i32 %.323.prol, -1
  %indvars.iv.next55.prol = add nsw i64 %indvars.iv54.prol, -1
  %prol.iter58.sub = add i32 %prol.iter58, -1
  %prol.iter58.cmp = icmp eq i32 %prol.iter58.sub, 0
  br i1 %prol.iter58.cmp, label %.lr.ph24.prol.loopexit.loopexit, label %.lr.ph24.prol, !llvm.loop !13

.lr.ph24.prol.loopexit.loopexit:                  ; preds = %.lr.ph24.prol
  br label %.lr.ph24.prol.loopexit

.lr.ph24.prol.loopexit:                           ; preds = %.lr.ph24.prol.loopexit.loopexit, %.lr.ph24.preheader
  %indvars.iv54.unr = phi i64 [ %72, %.lr.ph24.preheader ], [ %indvars.iv.next55.prol, %.lr.ph24.prol.loopexit.loopexit ]
  %.323.unr = phi i32 [ %.219, %.lr.ph24.preheader ], [ %.3.prol, %.lr.ph24.prol.loopexit.loopexit ]
  %77 = icmp ult i32 %.219, 3
  br i1 %77, label %.loopexit, label %.lr.ph24.preheader114

.lr.ph24.preheader114:                            ; preds = %.lr.ph24.prol.loopexit
  br label %.lr.ph24

.preheader4:                                      ; preds = %66
  br i1 %71, label %.lr.ph21.preheader, label %.loopexit

.lr.ph21.preheader:                               ; preds = %.preheader4
  %78 = sext i32 %.219 to i64
  %xtraiter51 = and i32 %70, 3
  %lcmp.mod52 = icmp eq i32 %xtraiter51, 0
  br i1 %lcmp.mod52, label %.lr.ph21.prol.loopexit, label %.lr.ph21.prol.preheader

.lr.ph21.prol.preheader:                          ; preds = %.lr.ph21.preheader
  br label %.lr.ph21.prol

.lr.ph21.prol:                                    ; preds = %.lr.ph21.prol.preheader, %.lr.ph21.prol
  %indvars.iv49.prol = phi i64 [ %indvars.iv.next50.prol, %.lr.ph21.prol ], [ %78, %.lr.ph21.prol.preheader ]
  %.220.prol = phi i32 [ %.2.prol, %.lr.ph21.prol ], [ %.219, %.lr.ph21.prol.preheader ]
  %prol.iter53 = phi i32 [ %prol.iter53.sub, %.lr.ph21.prol ], [ %xtraiter51, %.lr.ph21.prol.preheader ]
  %79 = getelementptr inbounds i16, i16* %63, i64 %indvars.iv49.prol
  %80 = load i16, i16* %79, align 2
  %81 = uitofp i16 %80 to double
  %82 = getelementptr inbounds double, double* %2, i64 %indvars.iv49.prol
  store double %81, double* %82, align 8
  %.2.prol = add i32 %.220.prol, -1
  %indvars.iv.next50.prol = add nsw i64 %indvars.iv49.prol, -1
  %prol.iter53.sub = add i32 %prol.iter53, -1
  %prol.iter53.cmp = icmp eq i32 %prol.iter53.sub, 0
  br i1 %prol.iter53.cmp, label %.lr.ph21.prol.loopexit.loopexit, label %.lr.ph21.prol, !llvm.loop !14

.lr.ph21.prol.loopexit.loopexit:                  ; preds = %.lr.ph21.prol
  br label %.lr.ph21.prol.loopexit

.lr.ph21.prol.loopexit:                           ; preds = %.lr.ph21.prol.loopexit.loopexit, %.lr.ph21.preheader
  %indvars.iv49.unr = phi i64 [ %78, %.lr.ph21.preheader ], [ %indvars.iv.next50.prol, %.lr.ph21.prol.loopexit.loopexit ]
  %.220.unr = phi i32 [ %.219, %.lr.ph21.preheader ], [ %.2.prol, %.lr.ph21.prol.loopexit.loopexit ]
  %83 = icmp ult i32 %.219, 3
  br i1 %83, label %.loopexit, label %.lr.ph21.preheader112

.lr.ph21.preheader112:                            ; preds = %.lr.ph21.prol.loopexit
  br label %.lr.ph21

.lr.ph21:                                         ; preds = %.lr.ph21.preheader112, %.lr.ph21
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.3, %.lr.ph21 ], [ %indvars.iv49.unr, %.lr.ph21.preheader112 ]
  %.220 = phi i32 [ %.2.3, %.lr.ph21 ], [ %.220.unr, %.lr.ph21.preheader112 ]
  %84 = getelementptr inbounds i16, i16* %63, i64 %indvars.iv49
  %85 = load i16, i16* %84, align 2
  %86 = uitofp i16 %85 to double
  %87 = getelementptr inbounds double, double* %2, i64 %indvars.iv49
  store double %86, double* %87, align 8
  %indvars.iv.next50 = add nsw i64 %indvars.iv49, -1
  %88 = getelementptr inbounds i16, i16* %63, i64 %indvars.iv.next50
  %89 = load i16, i16* %88, align 2
  %90 = uitofp i16 %89 to double
  %91 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next50
  store double %90, double* %91, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, -2
  %92 = getelementptr inbounds i16, i16* %63, i64 %indvars.iv.next50.1
  %93 = load i16, i16* %92, align 2
  %94 = uitofp i16 %93 to double
  %95 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next50.1
  store double %94, double* %95, align 8
  %indvars.iv.next50.2 = add nsw i64 %indvars.iv49, -3
  %96 = getelementptr inbounds i16, i16* %63, i64 %indvars.iv.next50.2
  %97 = load i16, i16* %96, align 2
  %98 = uitofp i16 %97 to double
  %99 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next50.2
  store double %98, double* %99, align 8
  %.2.3 = add i32 %.220, -4
  %100 = icmp sgt i32 %.2.3, -1
  %indvars.iv.next50.3 = add nsw i64 %indvars.iv49, -4
  br i1 %100, label %.lr.ph21, label %.loopexit.loopexit113

.lr.ph24:                                         ; preds = %.lr.ph24.preheader114, %.lr.ph24
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.3, %.lr.ph24 ], [ %indvars.iv54.unr, %.lr.ph24.preheader114 ]
  %.323 = phi i32 [ %.3.3, %.lr.ph24 ], [ %.323.unr, %.lr.ph24.preheader114 ]
  %101 = getelementptr inbounds i16, i16* %63, i64 %indvars.iv54
  %102 = load i16, i16* %101, align 2
  %103 = sitofp i16 %102 to double
  %104 = getelementptr inbounds double, double* %2, i64 %indvars.iv54
  store double %103, double* %104, align 8
  %indvars.iv.next55 = add nsw i64 %indvars.iv54, -1
  %105 = getelementptr inbounds i16, i16* %63, i64 %indvars.iv.next55
  %106 = load i16, i16* %105, align 2
  %107 = sitofp i16 %106 to double
  %108 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next55
  store double %107, double* %108, align 8
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv54, -2
  %109 = getelementptr inbounds i16, i16* %63, i64 %indvars.iv.next55.1
  %110 = load i16, i16* %109, align 2
  %111 = sitofp i16 %110 to double
  %112 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next55.1
  store double %111, double* %112, align 8
  %indvars.iv.next55.2 = add nsw i64 %indvars.iv54, -3
  %113 = getelementptr inbounds i16, i16* %63, i64 %indvars.iv.next55.2
  %114 = load i16, i16* %113, align 2
  %115 = sitofp i16 %114 to double
  %116 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next55.2
  store double %115, double* %116, align 8
  %.3.3 = add i32 %.323, -4
  %117 = icmp sgt i32 %.3.3, -1
  %indvars.iv.next55.3 = add nsw i64 %indvars.iv54, -4
  br i1 %117, label %.lr.ph24, label %.loopexit.loopexit115

; <label>:118:                                    ; preds = %3, %3
  %119 = bitcast double* %2 to i32*
  %120 = tail call fastcc i32 @TIFFFetchLongArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i32* %119)
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %.loopexit, label %122

; <label>:122:                                    ; preds = %118
  %123 = load i16, i16* %4, align 2
  %124 = icmp eq i16 %123, 4
  %125 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %126 = load i32, i32* %125, align 4
  %.425 = add i32 %126, -1
  %127 = icmp sgt i32 %.425, -1
  br i1 %124, label %.preheader8, label %.preheader10

.preheader10:                                     ; preds = %122
  br i1 %127, label %.lr.ph30.preheader, label %.loopexit

.lr.ph30.preheader:                               ; preds = %.preheader10
  %128 = sext i32 %.425 to i64
  %xtraiter66 = and i32 %126, 3
  %lcmp.mod67 = icmp eq i32 %xtraiter66, 0
  br i1 %lcmp.mod67, label %.lr.ph30.prol.loopexit, label %.lr.ph30.prol.preheader

.lr.ph30.prol.preheader:                          ; preds = %.lr.ph30.preheader
  br label %.lr.ph30.prol

.lr.ph30.prol:                                    ; preds = %.lr.ph30.prol.preheader, %.lr.ph30.prol
  %indvars.iv64.prol = phi i64 [ %indvars.iv.next65.prol, %.lr.ph30.prol ], [ %128, %.lr.ph30.prol.preheader ]
  %.529.prol = phi i32 [ %.5.prol, %.lr.ph30.prol ], [ %.425, %.lr.ph30.prol.preheader ]
  %prol.iter68 = phi i32 [ %prol.iter68.sub, %.lr.ph30.prol ], [ %xtraiter66, %.lr.ph30.prol.preheader ]
  %129 = getelementptr inbounds i32, i32* %119, i64 %indvars.iv64.prol
  %130 = load i32, i32* %129, align 4
  %131 = sitofp i32 %130 to double
  %132 = getelementptr inbounds double, double* %2, i64 %indvars.iv64.prol
  store double %131, double* %132, align 8
  %.5.prol = add i32 %.529.prol, -1
  %indvars.iv.next65.prol = add nsw i64 %indvars.iv64.prol, -1
  %prol.iter68.sub = add i32 %prol.iter68, -1
  %prol.iter68.cmp = icmp eq i32 %prol.iter68.sub, 0
  br i1 %prol.iter68.cmp, label %.lr.ph30.prol.loopexit.loopexit, label %.lr.ph30.prol, !llvm.loop !15

.lr.ph30.prol.loopexit.loopexit:                  ; preds = %.lr.ph30.prol
  br label %.lr.ph30.prol.loopexit

.lr.ph30.prol.loopexit:                           ; preds = %.lr.ph30.prol.loopexit.loopexit, %.lr.ph30.preheader
  %indvars.iv64.unr = phi i64 [ %128, %.lr.ph30.preheader ], [ %indvars.iv.next65.prol, %.lr.ph30.prol.loopexit.loopexit ]
  %.529.unr = phi i32 [ %.425, %.lr.ph30.preheader ], [ %.5.prol, %.lr.ph30.prol.loopexit.loopexit ]
  %133 = icmp ult i32 %.425, 3
  br i1 %133, label %.loopexit, label %.lr.ph30.preheader118

.lr.ph30.preheader118:                            ; preds = %.lr.ph30.prol.loopexit
  br label %.lr.ph30

.preheader8:                                      ; preds = %122
  br i1 %127, label %.lr.ph27.preheader, label %.loopexit

.lr.ph27.preheader:                               ; preds = %.preheader8
  %134 = sext i32 %.425 to i64
  %xtraiter61 = and i32 %126, 3
  %lcmp.mod62 = icmp eq i32 %xtraiter61, 0
  br i1 %lcmp.mod62, label %.lr.ph27.prol.loopexit, label %.lr.ph27.prol.preheader

.lr.ph27.prol.preheader:                          ; preds = %.lr.ph27.preheader
  br label %.lr.ph27.prol

.lr.ph27.prol:                                    ; preds = %.lr.ph27.prol.preheader, %.lr.ph27.prol
  %indvars.iv59.prol = phi i64 [ %indvars.iv.next60.prol, %.lr.ph27.prol ], [ %134, %.lr.ph27.prol.preheader ]
  %.426.prol = phi i32 [ %.4.prol, %.lr.ph27.prol ], [ %.425, %.lr.ph27.prol.preheader ]
  %prol.iter63 = phi i32 [ %prol.iter63.sub, %.lr.ph27.prol ], [ %xtraiter61, %.lr.ph27.prol.preheader ]
  %135 = getelementptr inbounds i32, i32* %119, i64 %indvars.iv59.prol
  %136 = load i32, i32* %135, align 4
  %137 = uitofp i32 %136 to double
  %138 = getelementptr inbounds double, double* %2, i64 %indvars.iv59.prol
  store double %137, double* %138, align 8
  %.4.prol = add i32 %.426.prol, -1
  %indvars.iv.next60.prol = add nsw i64 %indvars.iv59.prol, -1
  %prol.iter63.sub = add i32 %prol.iter63, -1
  %prol.iter63.cmp = icmp eq i32 %prol.iter63.sub, 0
  br i1 %prol.iter63.cmp, label %.lr.ph27.prol.loopexit.loopexit, label %.lr.ph27.prol, !llvm.loop !16

.lr.ph27.prol.loopexit.loopexit:                  ; preds = %.lr.ph27.prol
  br label %.lr.ph27.prol.loopexit

.lr.ph27.prol.loopexit:                           ; preds = %.lr.ph27.prol.loopexit.loopexit, %.lr.ph27.preheader
  %indvars.iv59.unr = phi i64 [ %134, %.lr.ph27.preheader ], [ %indvars.iv.next60.prol, %.lr.ph27.prol.loopexit.loopexit ]
  %.426.unr = phi i32 [ %.425, %.lr.ph27.preheader ], [ %.4.prol, %.lr.ph27.prol.loopexit.loopexit ]
  %139 = icmp ult i32 %.425, 3
  br i1 %139, label %.loopexit, label %.lr.ph27.preheader116

.lr.ph27.preheader116:                            ; preds = %.lr.ph27.prol.loopexit
  br label %.lr.ph27

.lr.ph27:                                         ; preds = %.lr.ph27.preheader116, %.lr.ph27
  %indvars.iv59 = phi i64 [ %indvars.iv.next60.3, %.lr.ph27 ], [ %indvars.iv59.unr, %.lr.ph27.preheader116 ]
  %.426 = phi i32 [ %.4.3, %.lr.ph27 ], [ %.426.unr, %.lr.ph27.preheader116 ]
  %140 = getelementptr inbounds i32, i32* %119, i64 %indvars.iv59
  %141 = load i32, i32* %140, align 4
  %142 = uitofp i32 %141 to double
  %143 = getelementptr inbounds double, double* %2, i64 %indvars.iv59
  store double %142, double* %143, align 8
  %indvars.iv.next60 = add nsw i64 %indvars.iv59, -1
  %144 = getelementptr inbounds i32, i32* %119, i64 %indvars.iv.next60
  %145 = load i32, i32* %144, align 4
  %146 = uitofp i32 %145 to double
  %147 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next60
  store double %146, double* %147, align 8
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, -2
  %148 = getelementptr inbounds i32, i32* %119, i64 %indvars.iv.next60.1
  %149 = load i32, i32* %148, align 4
  %150 = uitofp i32 %149 to double
  %151 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next60.1
  store double %150, double* %151, align 8
  %indvars.iv.next60.2 = add nsw i64 %indvars.iv59, -3
  %152 = getelementptr inbounds i32, i32* %119, i64 %indvars.iv.next60.2
  %153 = load i32, i32* %152, align 4
  %154 = uitofp i32 %153 to double
  %155 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next60.2
  store double %154, double* %155, align 8
  %.4.3 = add i32 %.426, -4
  %156 = icmp sgt i32 %.4.3, -1
  %indvars.iv.next60.3 = add nsw i64 %indvars.iv59, -4
  br i1 %156, label %.lr.ph27, label %.loopexit.loopexit117

.lr.ph30:                                         ; preds = %.lr.ph30.preheader118, %.lr.ph30
  %indvars.iv64 = phi i64 [ %indvars.iv.next65.3, %.lr.ph30 ], [ %indvars.iv64.unr, %.lr.ph30.preheader118 ]
  %.529 = phi i32 [ %.5.3, %.lr.ph30 ], [ %.529.unr, %.lr.ph30.preheader118 ]
  %157 = getelementptr inbounds i32, i32* %119, i64 %indvars.iv64
  %158 = load i32, i32* %157, align 4
  %159 = sitofp i32 %158 to double
  %160 = getelementptr inbounds double, double* %2, i64 %indvars.iv64
  store double %159, double* %160, align 8
  %indvars.iv.next65 = add nsw i64 %indvars.iv64, -1
  %161 = getelementptr inbounds i32, i32* %119, i64 %indvars.iv.next65
  %162 = load i32, i32* %161, align 4
  %163 = sitofp i32 %162 to double
  %164 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next65
  store double %163, double* %164, align 8
  %indvars.iv.next65.1 = add nsw i64 %indvars.iv64, -2
  %165 = getelementptr inbounds i32, i32* %119, i64 %indvars.iv.next65.1
  %166 = load i32, i32* %165, align 4
  %167 = sitofp i32 %166 to double
  %168 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next65.1
  store double %167, double* %168, align 8
  %indvars.iv.next65.2 = add nsw i64 %indvars.iv64, -3
  %169 = getelementptr inbounds i32, i32* %119, i64 %indvars.iv.next65.2
  %170 = load i32, i32* %169, align 4
  %171 = sitofp i32 %170 to double
  %172 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next65.2
  store double %171, double* %172, align 8
  %.5.3 = add i32 %.529, -4
  %173 = icmp sgt i32 %.5.3, -1
  %indvars.iv.next65.3 = add nsw i64 %indvars.iv64, -4
  br i1 %173, label %.lr.ph30, label %.loopexit.loopexit119

; <label>:174:                                    ; preds = %3, %3
  %175 = bitcast double* %2 to float*
  %176 = tail call fastcc i32 @TIFFFetchRationalArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, float* %175)
  %177 = icmp eq i32 %176, 0
  br i1 %177, label %.loopexit, label %178

; <label>:178:                                    ; preds = %174
  %179 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %180 = load i32, i32* %179, align 4
  %.631 = add i32 %180, -1
  %181 = icmp sgt i32 %.631, -1
  br i1 %181, label %.lr.ph33.preheader, label %.loopexit

.lr.ph33.preheader:                               ; preds = %178
  %182 = sext i32 %.631 to i64
  %xtraiter71 = and i32 %180, 3
  %lcmp.mod72 = icmp eq i32 %xtraiter71, 0
  br i1 %lcmp.mod72, label %.lr.ph33.prol.loopexit, label %.lr.ph33.prol.preheader

.lr.ph33.prol.preheader:                          ; preds = %.lr.ph33.preheader
  br label %.lr.ph33.prol

.lr.ph33.prol:                                    ; preds = %.lr.ph33.prol.preheader, %.lr.ph33.prol
  %indvars.iv69.prol = phi i64 [ %indvars.iv.next70.prol, %.lr.ph33.prol ], [ %182, %.lr.ph33.prol.preheader ]
  %.632.prol = phi i32 [ %.6.prol, %.lr.ph33.prol ], [ %.631, %.lr.ph33.prol.preheader ]
  %prol.iter73 = phi i32 [ %prol.iter73.sub, %.lr.ph33.prol ], [ %xtraiter71, %.lr.ph33.prol.preheader ]
  %183 = getelementptr inbounds float, float* %175, i64 %indvars.iv69.prol
  %184 = load float, float* %183, align 4
  %185 = fpext float %184 to double
  %186 = getelementptr inbounds double, double* %2, i64 %indvars.iv69.prol
  store double %185, double* %186, align 8
  %.6.prol = add i32 %.632.prol, -1
  %indvars.iv.next70.prol = add nsw i64 %indvars.iv69.prol, -1
  %prol.iter73.sub = add i32 %prol.iter73, -1
  %prol.iter73.cmp = icmp eq i32 %prol.iter73.sub, 0
  br i1 %prol.iter73.cmp, label %.lr.ph33.prol.loopexit.loopexit, label %.lr.ph33.prol, !llvm.loop !17

.lr.ph33.prol.loopexit.loopexit:                  ; preds = %.lr.ph33.prol
  br label %.lr.ph33.prol.loopexit

.lr.ph33.prol.loopexit:                           ; preds = %.lr.ph33.prol.loopexit.loopexit, %.lr.ph33.preheader
  %indvars.iv69.unr = phi i64 [ %182, %.lr.ph33.preheader ], [ %indvars.iv.next70.prol, %.lr.ph33.prol.loopexit.loopexit ]
  %.632.unr = phi i32 [ %.631, %.lr.ph33.preheader ], [ %.6.prol, %.lr.ph33.prol.loopexit.loopexit ]
  %187 = icmp ult i32 %.631, 3
  br i1 %187, label %.loopexit, label %.lr.ph33.preheader120

.lr.ph33.preheader120:                            ; preds = %.lr.ph33.prol.loopexit
  br label %.lr.ph33

.lr.ph33:                                         ; preds = %.lr.ph33.preheader120, %.lr.ph33
  %indvars.iv69 = phi i64 [ %indvars.iv.next70.3, %.lr.ph33 ], [ %indvars.iv69.unr, %.lr.ph33.preheader120 ]
  %.632 = phi i32 [ %.6.3, %.lr.ph33 ], [ %.632.unr, %.lr.ph33.preheader120 ]
  %188 = getelementptr inbounds float, float* %175, i64 %indvars.iv69
  %189 = load float, float* %188, align 4
  %190 = fpext float %189 to double
  %191 = getelementptr inbounds double, double* %2, i64 %indvars.iv69
  store double %190, double* %191, align 8
  %indvars.iv.next70 = add nsw i64 %indvars.iv69, -1
  %192 = getelementptr inbounds float, float* %175, i64 %indvars.iv.next70
  %193 = load float, float* %192, align 4
  %194 = fpext float %193 to double
  %195 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next70
  store double %194, double* %195, align 8
  %indvars.iv.next70.1 = add nsw i64 %indvars.iv69, -2
  %196 = getelementptr inbounds float, float* %175, i64 %indvars.iv.next70.1
  %197 = load float, float* %196, align 4
  %198 = fpext float %197 to double
  %199 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next70.1
  store double %198, double* %199, align 8
  %indvars.iv.next70.2 = add nsw i64 %indvars.iv69, -3
  %200 = getelementptr inbounds float, float* %175, i64 %indvars.iv.next70.2
  %201 = load float, float* %200, align 4
  %202 = fpext float %201 to double
  %203 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next70.2
  store double %202, double* %203, align 8
  %.6.3 = add i32 %.632, -4
  %204 = icmp sgt i32 %.6.3, -1
  %indvars.iv.next70.3 = add nsw i64 %indvars.iv69, -4
  br i1 %204, label %.lr.ph33, label %.loopexit.loopexit121

; <label>:205:                                    ; preds = %3
  %206 = bitcast double* %2 to float*
  %207 = tail call fastcc i32 @TIFFFetchFloatArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, float* %206)
  %208 = icmp eq i32 %207, 0
  br i1 %208, label %.loopexit, label %209

; <label>:209:                                    ; preds = %205
  %210 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %211 = load i32, i32* %210, align 4
  %.734 = add i32 %211, -1
  %212 = icmp sgt i32 %.734, -1
  br i1 %212, label %.lr.ph36.preheader, label %.loopexit

.lr.ph36.preheader:                               ; preds = %209
  %213 = sext i32 %.734 to i64
  %xtraiter76 = and i32 %211, 3
  %lcmp.mod77 = icmp eq i32 %xtraiter76, 0
  br i1 %lcmp.mod77, label %.lr.ph36.prol.loopexit, label %.lr.ph36.prol.preheader

.lr.ph36.prol.preheader:                          ; preds = %.lr.ph36.preheader
  br label %.lr.ph36.prol

.lr.ph36.prol:                                    ; preds = %.lr.ph36.prol.preheader, %.lr.ph36.prol
  %indvars.iv74.prol = phi i64 [ %indvars.iv.next75.prol, %.lr.ph36.prol ], [ %213, %.lr.ph36.prol.preheader ]
  %.735.prol = phi i32 [ %.7.prol, %.lr.ph36.prol ], [ %.734, %.lr.ph36.prol.preheader ]
  %prol.iter78 = phi i32 [ %prol.iter78.sub, %.lr.ph36.prol ], [ %xtraiter76, %.lr.ph36.prol.preheader ]
  %214 = getelementptr inbounds float, float* %206, i64 %indvars.iv74.prol
  %215 = load float, float* %214, align 4
  %216 = fpext float %215 to double
  %217 = getelementptr inbounds double, double* %2, i64 %indvars.iv74.prol
  store double %216, double* %217, align 8
  %.7.prol = add i32 %.735.prol, -1
  %indvars.iv.next75.prol = add nsw i64 %indvars.iv74.prol, -1
  %prol.iter78.sub = add i32 %prol.iter78, -1
  %prol.iter78.cmp = icmp eq i32 %prol.iter78.sub, 0
  br i1 %prol.iter78.cmp, label %.lr.ph36.prol.loopexit.loopexit, label %.lr.ph36.prol, !llvm.loop !18

.lr.ph36.prol.loopexit.loopexit:                  ; preds = %.lr.ph36.prol
  br label %.lr.ph36.prol.loopexit

.lr.ph36.prol.loopexit:                           ; preds = %.lr.ph36.prol.loopexit.loopexit, %.lr.ph36.preheader
  %indvars.iv74.unr = phi i64 [ %213, %.lr.ph36.preheader ], [ %indvars.iv.next75.prol, %.lr.ph36.prol.loopexit.loopexit ]
  %.735.unr = phi i32 [ %.734, %.lr.ph36.preheader ], [ %.7.prol, %.lr.ph36.prol.loopexit.loopexit ]
  %218 = icmp ult i32 %.734, 3
  br i1 %218, label %.loopexit, label %.lr.ph36.preheader122

.lr.ph36.preheader122:                            ; preds = %.lr.ph36.prol.loopexit
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %.lr.ph36.preheader122, %.lr.ph36
  %indvars.iv74 = phi i64 [ %indvars.iv.next75.3, %.lr.ph36 ], [ %indvars.iv74.unr, %.lr.ph36.preheader122 ]
  %.735 = phi i32 [ %.7.3, %.lr.ph36 ], [ %.735.unr, %.lr.ph36.preheader122 ]
  %219 = getelementptr inbounds float, float* %206, i64 %indvars.iv74
  %220 = load float, float* %219, align 4
  %221 = fpext float %220 to double
  %222 = getelementptr inbounds double, double* %2, i64 %indvars.iv74
  store double %221, double* %222, align 8
  %indvars.iv.next75 = add nsw i64 %indvars.iv74, -1
  %223 = getelementptr inbounds float, float* %206, i64 %indvars.iv.next75
  %224 = load float, float* %223, align 4
  %225 = fpext float %224 to double
  %226 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next75
  store double %225, double* %226, align 8
  %indvars.iv.next75.1 = add nsw i64 %indvars.iv74, -2
  %227 = getelementptr inbounds float, float* %206, i64 %indvars.iv.next75.1
  %228 = load float, float* %227, align 4
  %229 = fpext float %228 to double
  %230 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next75.1
  store double %229, double* %230, align 8
  %indvars.iv.next75.2 = add nsw i64 %indvars.iv74, -3
  %231 = getelementptr inbounds float, float* %206, i64 %indvars.iv.next75.2
  %232 = load float, float* %231, align 4
  %233 = fpext float %232 to double
  %234 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next75.2
  store double %233, double* %234, align 8
  %.7.3 = add i32 %.735, -4
  %235 = icmp sgt i32 %.7.3, -1
  %indvars.iv.next75.3 = add nsw i64 %indvars.iv74, -4
  br i1 %235, label %.lr.ph36, label %.loopexit.loopexit123

; <label>:236:                                    ; preds = %3
  %237 = tail call fastcc i32 @TIFFFetchDoubleArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, double* %2)
  br label %.loopexit

; <label>:238:                                    ; preds = %3
  %239 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %240 = load i8*, i8** %239, align 8
  %241 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 0
  %242 = load i16, i16* %241, align 4
  %243 = zext i16 %242 to i32
  %244 = tail call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %0, i32 %243) #3
  %245 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %244, i64 0, i32 7
  %246 = load i8*, i8** %245, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %240, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.24, i64 0, i64 0), i8* %246) #3
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit.loopexit111:                            ; preds = %.lr.ph18
  br label %.loopexit

.loopexit.loopexit113:                            ; preds = %.lr.ph21
  br label %.loopexit

.loopexit.loopexit115:                            ; preds = %.lr.ph24
  br label %.loopexit

.loopexit.loopexit117:                            ; preds = %.lr.ph27
  br label %.loopexit

.loopexit.loopexit119:                            ; preds = %.lr.ph30
  br label %.loopexit

.loopexit.loopexit121:                            ; preds = %.lr.ph33
  br label %.loopexit

.loopexit.loopexit123:                            ; preds = %.lr.ph36
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit123, %.loopexit.loopexit121, %.loopexit.loopexit119, %.loopexit.loopexit117, %.loopexit.loopexit115, %.loopexit.loopexit113, %.loopexit.loopexit111, %.loopexit.loopexit, %.lr.ph36.prol.loopexit, %.lr.ph33.prol.loopexit, %.lr.ph30.prol.loopexit, %.lr.ph27.prol.loopexit, %.lr.ph24.prol.loopexit, %.lr.ph21.prol.loopexit, %.lr.ph18.prol.loopexit, %.lr.ph.prol.loopexit, %209, %178, %.preheader10, %.preheader8, %.preheader6, %.preheader4, %.preheader2, %.preheader, %205, %174, %118, %62, %6, %238, %236
  %.0 = phi i32 [ 0, %238 ], [ %237, %236 ], [ 0, %6 ], [ 0, %62 ], [ 0, %118 ], [ 0, %174 ], [ 0, %205 ], [ 1, %.preheader ], [ 1, %.preheader2 ], [ 1, %.preheader4 ], [ 1, %.preheader6 ], [ 1, %.preheader8 ], [ 1, %.preheader10 ], [ 1, %178 ], [ 1, %209 ], [ 1, %.lr.ph.prol.loopexit ], [ 1, %.lr.ph18.prol.loopexit ], [ 1, %.lr.ph21.prol.loopexit ], [ 1, %.lr.ph24.prol.loopexit ], [ 1, %.lr.ph27.prol.loopexit ], [ 1, %.lr.ph30.prol.loopexit ], [ 1, %.lr.ph33.prol.loopexit ], [ 1, %.lr.ph36.prol.loopexit ], [ 1, %.loopexit.loopexit ], [ 1, %.loopexit.loopexit111 ], [ 1, %.loopexit.loopexit113 ], [ 1, %.loopexit.loopexit115 ], [ 1, %.loopexit.loopexit117 ], [ 1, %.loopexit.loopexit119 ], [ 1, %.loopexit.loopexit121 ], [ 1, %.loopexit.loopexit123 ]
  ret i32 %.0
}

declare i32 @TIFFVTileSize(%struct.tiff*, i32) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !11}
!18 = distinct !{!18, !11}
