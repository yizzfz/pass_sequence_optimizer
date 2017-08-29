; ModuleID = 'tif_write.ll'
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

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFWriteScanline(%struct.tiff*, i8*, i32, i16 zeroext) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %6 = load i32, i32* %5, align 8
  %7 = and i32 %6, 64
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %12

; <label>:9:                                      ; preds = %4
  %10 = tail call fastcc i32 @TIFFWriteCheck(%struct.tiff* nonnull %0, i32 0, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFWriteScanline.module, i64 0, i64 0))
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %144, label %12

; <label>:12:                                     ; preds = %9, %4
  %13 = load i32, i32* %5, align 8
  %14 = and i32 %13, 16
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %19

; <label>:16:                                     ; preds = %12
  %17 = tail call i32 @TIFFWriteBufferSetup(%struct.tiff* nonnull %0, i8* null, i32 -1)
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %144, label %19

; <label>:19:                                     ; preds = %16, %12
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %21 = load i32, i32* %20, align 4
  %22 = icmp ugt i32 %21, %2
  br i1 %22, label %32, label %23

; <label>:23:                                     ; preds = %19
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %25 = load i16, i16* %24, align 2
  %26 = icmp eq i16 %25, 2
  br i1 %26, label %27, label %30

; <label>:27:                                     ; preds = %23
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %29 = load i8*, i8** %28, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %29, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str, i64 0, i64 0)) #4
  br label %144

; <label>:30:                                     ; preds = %23
  %31 = add i32 %2, 1
  store i32 %31, i32* %20, align 4
  br label %32

; <label>:32:                                     ; preds = %19, %30
  %.02 = phi i32 [ 1, %30 ], [ 0, %19 ]
  %33 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %34 = load i16, i16* %33, align 2
  %35 = icmp eq i16 %34, 2
  br i1 %35, label %36, label %54

; <label>:36:                                     ; preds = %32
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %38 = load i16, i16* %37, align 2
  %39 = icmp ugt i16 %38, %3
  br i1 %39, label %45, label %40

; <label>:40:                                     ; preds = %36
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %42 = load i8*, i8** %41, align 8
  %43 = zext i16 %3 to i32
  %44 = zext i16 %38 to i32
  tail call void (i8*, i8*, ...) @TIFFError(i8* %42, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0), i32 %43, i32 %44) #4
  br label %144

; <label>:45:                                     ; preds = %36
  %46 = zext i16 %3 to i32
  %47 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 42
  %48 = load i32, i32* %47, align 8
  %49 = mul i32 %48, %46
  %50 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %51 = load i32, i32* %50, align 4
  %52 = udiv i32 %2, %51
  %53 = add i32 %52, %49
  br label %58

; <label>:54:                                     ; preds = %32
  %55 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %56 = load i32, i32* %55, align 4
  %57 = udiv i32 %2, %56
  br label %58

; <label>:58:                                     ; preds = %54, %45
  %.01 = phi i32 [ %53, %45 ], [ %57, %54 ]
  %59 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 13
  %60 = load i32, i32* %59, align 8
  %61 = icmp eq i32 %.01, %60
  br i1 %61, label %103, label %62

; <label>:62:                                     ; preds = %58
  %63 = tail call i32 @TIFFFlushData(%struct.tiff* nonnull %0) #4
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %144, label %65

; <label>:65:                                     ; preds = %62
  store i32 %.01, i32* %59, align 8
  %66 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 42
  %67 = load i32, i32* %66, align 8
  %68 = icmp ult i32 %.01, %67
  %69 = icmp eq i32 %.02, 0
  %or.cond = or i1 %69, %68
  br i1 %or.cond, label %77, label %70

; <label>:70:                                     ; preds = %65
  %71 = load i32, i32* %20, align 4
  %72 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %73 = load i32, i32* %72, align 4
  %74 = add i32 %71, -1
  %75 = add i32 %74, %73
  %76 = udiv i32 %75, %73
  store i32 %76, i32* %66, align 8
  br label %77

; <label>:77:                                     ; preds = %65, %70
  %78 = load i32, i32* %66, align 8
  %79 = urem i32 %.01, %78
  %80 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %81 = load i32, i32* %80, align 4
  %82 = mul i32 %81, %79
  %83 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  store i32 %82, i32* %83, align 8
  %84 = load i32, i32* %5, align 8
  %85 = and i32 %84, 32
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %87, label %95

; <label>:87:                                     ; preds = %77
  %88 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 23
  %89 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %88, align 8
  %90 = tail call i32 %89(%struct.tiff* nonnull %0) #4
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %144, label %92

; <label>:92:                                     ; preds = %87
  %93 = load i32, i32* %5, align 8
  %94 = or i32 %93, 32
  store i32 %94, i32* %5, align 8
  br label %95

; <label>:95:                                     ; preds = %92, %77
  %96 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 24
  %97 = load i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*, i16)** %96, align 8
  %98 = tail call i32 %97(%struct.tiff* nonnull %0, i16 zeroext %3) #4
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %144, label %100

; <label>:100:                                    ; preds = %95
  %101 = load i32, i32* %5, align 8
  %102 = or i32 %101, 4096
  store i32 %102, i32* %5, align 8
  br label %103

; <label>:103:                                    ; preds = %58, %100
  %104 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  %105 = load i32, i32* %104, align 4
  %106 = icmp ult i32 %.01, %105
  br i1 %106, label %110, label %107

; <label>:107:                                    ; preds = %103
  %108 = tail call fastcc i32 @TIFFGrowStrips(%struct.tiff* nonnull %0, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFWriteScanline.module, i64 0, i64 0))
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %144, label %110

; <label>:110:                                    ; preds = %107, %103
  %111 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %112 = load i32, i32* %111, align 8
  %113 = icmp eq i32 %112, %2
  br i1 %113, label %136, label %114

; <label>:114:                                    ; preds = %110
  %115 = icmp ugt i32 %112, %2
  br i1 %115, label %116, label %128

; <label>:116:                                    ; preds = %114
  %117 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 42
  %118 = load i32, i32* %117, align 8
  %119 = urem i32 %.01, %118
  %120 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %121 = load i32, i32* %120, align 4
  %122 = mul i32 %121, %119
  store i32 %122, i32* %111, align 8
  %123 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %124 = bitcast i8** %123 to i64*
  %125 = load i64, i64* %124, align 8
  %126 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %127 = bitcast i8** %126 to i64*
  store i64 %125, i64* %127, align 8
  br label %128

; <label>:128:                                    ; preds = %116, %114
  %129 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 33
  %130 = load i32 (%struct.tiff*, i32)*, i32 (%struct.tiff*, i32)** %129, align 8
  %131 = load i32, i32* %111, align 8
  %132 = sub i32 %2, %131
  %133 = tail call i32 %130(%struct.tiff* nonnull %0, i32 %132) #4
  %134 = icmp eq i32 %133, 0
  br i1 %134, label %144, label %135

; <label>:135:                                    ; preds = %128
  store i32 %2, i32* %111, align 8
  br label %136

; <label>:136:                                    ; preds = %110, %135
  %137 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 27
  %138 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %137, align 8
  %139 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 38
  %140 = load i32, i32* %139, align 8
  %141 = tail call i32 %138(%struct.tiff* nonnull %0, i8* %1, i32 %140, i16 zeroext %3) #4
  %142 = load i32, i32* %111, align 8
  %143 = add i32 %142, 1
  store i32 %143, i32* %111, align 8
  br label %144

; <label>:144:                                    ; preds = %128, %107, %95, %87, %62, %16, %9, %136, %40, %27
  %.0 = phi i32 [ -1, %27 ], [ -1, %40 ], [ %141, %136 ], [ -1, %9 ], [ -1, %16 ], [ -1, %62 ], [ -1, %87 ], [ -1, %95 ], [ -1, %107 ], [ -1, %128 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFWriteCheck(%struct.tiff*, i32, i8*) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 2
  %5 = load i32, i32* %4, align 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %10

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %9 = load i8*, i8** %8, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %2, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.5, i64 0, i64 0), i8* %9) #4
  br label %56

; <label>:10:                                     ; preds = %3
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %12 = load i32, i32* %11, align 8
  %13 = lshr i32 %12, 10
  %.lobit = and i32 %13, 1
  %14 = icmp eq i32 %.lobit, %1
  br i1 %14, label %20, label %15

; <label>:15:                                     ; preds = %10
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %17 = load i8*, i8** %16, align 8
  %18 = icmp ne i32 %1, 0
  %19 = select i1 %18, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.7, i64 0, i64 0)
  tail call void (i8*, i8*, ...) @TIFFError(i8* %17, i8* %19) #4
  br label %56

; <label>:20:                                     ; preds = %10
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 0
  %22 = load i64, i64* %21, align 8
  %23 = and i64 %22, 2
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %25, label %28

; <label>:25:                                     ; preds = %20
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %27 = load i8*, i8** %26, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %2, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.8, i64 0, i64 0), i8* %27) #4
  br label %56

; <label>:28:                                     ; preds = %20
  %29 = and i64 %22, 1048576
  %30 = icmp eq i64 %29, 0
  br i1 %30, label %31, label %34

; <label>:31:                                     ; preds = %28
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %33 = load i8*, i8** %32, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %2, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.9, i64 0, i64 0), i8* %33) #4
  br label %56

; <label>:34:                                     ; preds = %28
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 44
  %36 = load i32*, i32** %35, align 8
  %37 = icmp eq i32* %36, null
  br i1 %37, label %38, label %49

; <label>:38:                                     ; preds = %34
  %39 = tail call fastcc i32 @TIFFSetupStrips(%struct.tiff* nonnull %0)
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %49

; <label>:41:                                     ; preds = %38
  %42 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  store i32 0, i32* %42, align 4
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %44 = load i8*, i8** %43, align 8
  %45 = load i32, i32* %11, align 8
  %46 = and i32 %45, 1024
  %47 = icmp ne i32 %46, 0
  %48 = select i1 %47, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i64 0, i64 0)
  tail call void (i8*, i8*, ...) @TIFFError(i8* %2, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.10, i64 0, i64 0), i8* %44, i8* %48) #4
  br label %56

; <label>:49:                                     ; preds = %38, %34
  %50 = tail call i32 @TIFFTileSize(%struct.tiff* nonnull %0) #4
  %51 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 20
  store i32 %50, i32* %51, align 4
  %52 = tail call i32 @TIFFScanlineSize(%struct.tiff* nonnull %0) #4
  %53 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 38
  store i32 %52, i32* %53, align 8
  %54 = load i32, i32* %11, align 8
  %55 = or i32 %54, 64
  store i32 %55, i32* %11, align 8
  br label %56

; <label>:56:                                     ; preds = %49, %41, %31, %25, %15, %7
  %.0 = phi i32 [ 0, %7 ], [ 0, %15 ], [ 1, %49 ], [ 0, %41 ], [ 0, %31 ], [ 0, %25 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFWriteBufferSetup(%struct.tiff* nocapture, i8*, i32) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %5 = load i8*, i8** %4, align 8
  %6 = icmp eq i8* %5, null
  br i1 %6, label %16, label %7

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %9 = load i32, i32* %8, align 8
  %10 = and i32 %9, 512
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %15, label %12

; <label>:12:                                     ; preds = %7
  tail call void @_TIFFfree(i8* nonnull %5) #4
  %13 = load i32, i32* %8, align 8
  %14 = and i32 %13, -513
  store i32 %14, i32* %8, align 8
  br label %15

; <label>:15:                                     ; preds = %7, %12
  store i8* null, i8** %4, align 8
  br label %16

; <label>:16:                                     ; preds = %3, %15
  %17 = icmp eq i32 %2, -1
  br i1 %17, label %.thread, label %26

.thread:                                          ; preds = %16
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %19 = load i32, i32* %18, align 8
  %20 = and i32 %19, 1024
  %21 = icmp eq i32 %20, 0
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 20
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 38
  %.in = select i1 %21, i32* %23, i32* %22
  %24 = load i32, i32* %.in, align 4
  %25 = icmp sgt i32 %24, 8192
  %. = select i1 %25, i32 %24, i32 8192
  br label %28

; <label>:26:                                     ; preds = %16
  %27 = icmp eq i8* %1, null
  br i1 %27, label %28, label %38

; <label>:28:                                     ; preds = %.thread, %26
  %.14 = phi i32 [ %., %.thread ], [ %2, %26 ]
  %29 = tail call i8* @_TIFFmalloc(i32 %.14) #4
  %30 = icmp eq i8* %29, null
  br i1 %30, label %31, label %34

; <label>:31:                                     ; preds = %28
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %33 = load i8*, i8** %32, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @TIFFWriteBufferSetup.module, i64 0, i64 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0), i8* %33) #4
  br label %50

; <label>:34:                                     ; preds = %28
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %36 = load i32, i32* %35, align 8
  %37 = or i32 %36, 512
  store i32 %37, i32* %35, align 8
  br label %42

; <label>:38:                                     ; preds = %26
  %39 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %40 = load i32, i32* %39, align 8
  %41 = and i32 %40, -513
  store i32 %41, i32* %39, align 8
  br label %42

; <label>:42:                                     ; preds = %38, %34
  %.15 = phi i32 [ %.14, %34 ], [ %2, %38 ]
  %.13 = phi i8* [ %29, %34 ], [ %1, %38 ]
  store i8* %.13, i8** %4, align 8
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  store i32 %.15, i32* %43, align 8
  %44 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  store i32 0, i32* %44, align 8
  %.cast = ptrtoint i8* %.13 to i64
  %45 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %46 = bitcast i8** %45 to i64*
  store i64 %.cast, i64* %46, align 8
  %47 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %48 = load i32, i32* %47, align 8
  %49 = or i32 %48, 16
  store i32 %49, i32* %47, align 8
  br label %50

; <label>:50:                                     ; preds = %42, %31
  %.0 = phi i32 [ 0, %31 ], [ 1, %42 ]
  ret i32 %.0
}

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #1

declare i32 @TIFFFlushData(%struct.tiff*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFGrowStrips(%struct.tiff* nocapture, i8*) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %4 = load i16, i16* %3, align 2
  %5 = icmp eq i16 %4, 1
  br i1 %5, label %7, label %6

; <label>:6:                                      ; preds = %2
  tail call void @__assert_fail(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.13, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.14, i64 0, i64 0), i32 570, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__PRETTY_FUNCTION__.TIFFGrowStrips, i64 0, i64 0)) #5
  unreachable

; <label>:7:                                      ; preds = %2
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 44
  %9 = bitcast i32** %8 to i8**
  %10 = load i8*, i8** %9, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  %12 = load i32, i32* %11, align 4
  %13 = shl i32 %12, 2
  %14 = add i32 %13, 4
  %15 = tail call i8* @_TIFFrealloc(i8* %10, i32 %14) #4
  store i8* %15, i8** %9, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 45
  %17 = bitcast i32** %16 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = load i32, i32* %11, align 4
  %20 = shl i32 %19, 2
  %21 = add i32 %20, 4
  %22 = tail call i8* @_TIFFrealloc(i8* %18, i32 %21) #4
  store i8* %22, i8** %17, align 8
  %23 = load i32*, i32** %8, align 8
  %24 = icmp eq i32* %23, null
  br i1 %24, label %28, label %25

; <label>:25:                                     ; preds = %7
  %26 = load i32*, i32** %16, align 8
  %27 = icmp eq i32* %26, null
  br i1 %27, label %28, label %31

; <label>:28:                                     ; preds = %25, %7
  store i32 0, i32* %11, align 4
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %30 = load i8*, i8** %29, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %1, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.15, i64 0, i64 0), i8* %30) #4
  br label %43

; <label>:31:                                     ; preds = %25
  %32 = load i32, i32* %11, align 4
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32* %23, i64 %33
  %35 = bitcast i32* %34 to i8*
  tail call void @_TIFFmemset(i8* %35, i32 0, i32 4) #4
  %36 = load i32*, i32** %16, align 8
  %37 = load i32, i32* %11, align 4
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32* %36, i64 %38
  %40 = bitcast i32* %39 to i8*
  tail call void @_TIFFmemset(i8* %40, i32 0, i32 4) #4
  %41 = load i32, i32* %11, align 4
  %42 = add i32 %41, 1
  store i32 %42, i32* %11, align 4
  br label %43

; <label>:43:                                     ; preds = %31, %28
  %.0 = phi i32 [ 0, %28 ], [ 1, %31 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFWriteEncodedStrip(%struct.tiff*, i32, i8*, i32) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %6 = load i32, i32* %5, align 8
  %7 = and i32 %6, 64
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %12

; <label>:9:                                      ; preds = %4
  %10 = tail call fastcc i32 @TIFFWriteCheck(%struct.tiff* nonnull %0, i32 0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @TIFFWriteEncodedStrip.module, i64 0, i64 0))
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %111, label %12

; <label>:12:                                     ; preds = %9, %4
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  %14 = load i32, i32* %13, align 4
  %15 = icmp ugt i32 %14, %1
  br i1 %15, label %35, label %16

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %18 = load i16, i16* %17, align 2
  %19 = icmp eq i16 %18, 2
  br i1 %19, label %20, label %23

; <label>:20:                                     ; preds = %16
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %22 = load i8*, i8** %21, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %22, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.2, i64 0, i64 0)) #4
  br label %111

; <label>:23:                                     ; preds = %16
  %24 = tail call fastcc i32 @TIFFGrowStrips(%struct.tiff* nonnull %0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @TIFFWriteEncodedStrip.module, i64 0, i64 0))
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %111, label %26

; <label>:26:                                     ; preds = %23
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %28 = load i32, i32* %27, align 4
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %30 = load i32, i32* %29, align 4
  %31 = add i32 %28, -1
  %32 = add i32 %31, %30
  %33 = udiv i32 %32, %30
  %34 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 42
  store i32 %33, i32* %34, align 8
  br label %35

; <label>:35:                                     ; preds = %12, %26
  %36 = load i32, i32* %5, align 8
  %37 = and i32 %36, 16
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %42

; <label>:39:                                     ; preds = %35
  %40 = tail call i32 @TIFFWriteBufferSetup(%struct.tiff* nonnull %0, i8* null, i32 -1)
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %111, label %42

; <label>:42:                                     ; preds = %39, %35
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 13
  store i32 %1, i32* %43, align 8
  %44 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 42
  %45 = load i32, i32* %44, align 8
  %46 = urem i32 %1, %45
  %47 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %48 = load i32, i32* %47, align 4
  %49 = mul i32 %48, %46
  %50 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  store i32 %49, i32* %50, align 8
  %51 = load i32, i32* %5, align 8
  %52 = and i32 %51, 32
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %62

; <label>:54:                                     ; preds = %42
  %55 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 23
  %56 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %55, align 8
  %57 = tail call i32 %56(%struct.tiff* nonnull %0) #4
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %111, label %59

; <label>:59:                                     ; preds = %54
  %60 = load i32, i32* %5, align 8
  %61 = or i32 %60, 32
  store i32 %61, i32* %5, align 8
  br label %62

; <label>:62:                                     ; preds = %59, %42
  %63 = load i32, i32* %5, align 8
  %64 = and i32 %63, -4097
  store i32 %64, i32* %5, align 8
  %65 = load i32, i32* %44, align 8
  %66 = udiv i32 %1, %65
  %67 = trunc i32 %66 to i16
  %68 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 24
  %69 = load i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*, i16)** %68, align 8
  %70 = tail call i32 %69(%struct.tiff* nonnull %0, i16 zeroext %67) #4
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %111, label %72

; <label>:72:                                     ; preds = %62
  %73 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 29
  %74 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %73, align 8
  %75 = tail call i32 %74(%struct.tiff* nonnull %0, i8* %2, i32 %3, i16 zeroext %67) #4
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %111, label %77

; <label>:77:                                     ; preds = %72
  %78 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 25
  %79 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %78, align 8
  %80 = tail call i32 %79(%struct.tiff* nonnull %0) #4
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %111, label %82

; <label>:82:                                     ; preds = %77
  %83 = load i32, i32* %5, align 8
  %84 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 13
  %85 = load i16, i16* %84, align 2
  %86 = or i16 %85, 256
  %87 = zext i16 %86 to i32
  %88 = and i32 %87, %83
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %90, label %96

; <label>:90:                                     ; preds = %82
  %91 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %92 = load i8*, i8** %91, align 8
  %93 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %94 = load i32, i32* %93, align 8
  %95 = sext i32 %94 to i64
  tail call void @TIFFReverseBits(i8* %92, i64 %95) #4
  br label %96

; <label>:96:                                     ; preds = %82, %90
  %97 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %98 = load i32, i32* %97, align 8
  %99 = icmp sgt i32 %98, 0
  br i1 %99, label %100, label %105

; <label>:100:                                    ; preds = %96
  %101 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %102 = load i8*, i8** %101, align 8
  %103 = tail call fastcc i32 @TIFFAppendToStrip(%struct.tiff* nonnull %0, i32 %1, i8* %102, i32 %98)
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %111, label %105

; <label>:105:                                    ; preds = %100, %96
  store i32 0, i32* %97, align 8
  %106 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %107 = bitcast i8** %106 to i64*
  %108 = load i64, i64* %107, align 8
  %109 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %110 = bitcast i8** %109 to i64*
  store i64 %108, i64* %110, align 8
  br label %111

; <label>:111:                                    ; preds = %100, %77, %72, %62, %54, %39, %23, %9, %105, %20
  %.0 = phi i32 [ -1, %20 ], [ %3, %105 ], [ -1, %9 ], [ -1, %23 ], [ -1, %39 ], [ -1, %54 ], [ -1, %62 ], [ 0, %72 ], [ -1, %77 ], [ -1, %100 ]
  ret i32 %.0
}

declare void @TIFFReverseBits(i8*, i64) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFAppendToStrip(%struct.tiff* nocapture, i32, i8*, i32) unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 44
  %6 = load i32*, i32** %5, align 8
  %7 = zext i32 %1 to i64
  %8 = getelementptr inbounds i32, i32* %6, i64 %7
  %9 = load i32, i32* %8, align 4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %15, label %11

; <label>:11:                                     ; preds = %4
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 14
  %13 = load i32, i32* %12, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %45

; <label>:15:                                     ; preds = %11, %4
  %16 = load i32*, i32** %5, align 8
  %17 = getelementptr inbounds i32, i32* %16, i64 %7
  %18 = load i32, i32* %17, align 4
  %19 = icmp eq i32 %18, 0
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 51
  %21 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %20, align 8
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 48
  %23 = load i8*, i8** %22, align 8
  br i1 %19, label %36, label %24

; <label>:24:                                     ; preds = %15
  %25 = tail call i32 %21(i8* %23, i32 %18, i32 0) #4
  %26 = load i32*, i32** %5, align 8
  %27 = getelementptr inbounds i32, i32* %26, i64 %7
  %28 = load i32, i32* %27, align 4
  %29 = icmp eq i32 %25, %28
  br i1 %29, label %40, label %30

; <label>:30:                                     ; preds = %24
  %31 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %32 = load i8*, i8** %31, align 8
  %33 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %34 = load i32, i32* %33, align 8
  %35 = zext i32 %34 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFAppendToStrip.module, i64 0, i64 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.16, i64 0, i64 0), i8* %32, i64 %35) #4
  br label %67

; <label>:36:                                     ; preds = %15
  %37 = tail call i32 %21(i8* %23, i32 0, i32 2) #4
  %38 = load i32*, i32** %5, align 8
  %39 = getelementptr inbounds i32, i32* %38, i64 %7
  store i32 %37, i32* %39, align 4
  br label %40

; <label>:40:                                     ; preds = %24, %36
  %41 = load i32*, i32** %5, align 8
  %42 = getelementptr inbounds i32, i32* %41, i64 %7
  %43 = load i32, i32* %42, align 4
  %44 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 14
  store i32 %43, i32* %44, align 4
  br label %45

; <label>:45:                                     ; preds = %40, %11
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 50
  %47 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %46, align 8
  %48 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 48
  %49 = load i8*, i8** %48, align 8
  %50 = tail call i32 %47(i8* %49, i8* %2, i32 %3) #4
  %51 = icmp eq i32 %50, %3
  br i1 %51, label %58, label %52

; <label>:52:                                     ; preds = %45
  %53 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %54 = load i8*, i8** %53, align 8
  %55 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %56 = load i32, i32* %55, align 8
  %57 = zext i32 %56 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFAppendToStrip.module, i64 0, i64 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.17, i64 0, i64 0), i8* %54, i64 %57) #4
  br label %67

; <label>:58:                                     ; preds = %45
  %59 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 14
  %60 = load i32, i32* %59, align 4
  %61 = add nsw i32 %60, %3
  store i32 %61, i32* %59, align 4
  %62 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 45
  %63 = load i32*, i32** %62, align 8
  %64 = getelementptr inbounds i32, i32* %63, i64 %7
  %65 = load i32, i32* %64, align 4
  %66 = add i32 %65, %3
  store i32 %66, i32* %64, align 4
  br label %67

; <label>:67:                                     ; preds = %58, %52, %30
  %.0 = phi i32 [ 1, %58 ], [ 0, %52 ], [ 0, %30 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFWriteRawStrip(%struct.tiff*, i32, i8*, i32) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %6 = load i32, i32* %5, align 8
  %7 = and i32 %6, 64
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %12

; <label>:9:                                      ; preds = %4
  %10 = tail call fastcc i32 @TIFFWriteCheck(%struct.tiff* nonnull %0, i32 0, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFWriteRawStrip.module, i64 0, i64 0))
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %49, label %12

; <label>:12:                                     ; preds = %9, %4
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  %14 = load i32, i32* %13, align 4
  %15 = icmp ugt i32 %14, %1
  br i1 %15, label %38, label %16

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %18 = load i16, i16* %17, align 2
  %19 = icmp eq i16 %18, 2
  br i1 %19, label %20, label %23

; <label>:20:                                     ; preds = %16
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %22 = load i8*, i8** %21, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %22, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.2, i64 0, i64 0)) #4
  br label %49

; <label>:23:                                     ; preds = %16
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 42
  %25 = load i32, i32* %24, align 8
  %26 = icmp ugt i32 %25, %1
  br i1 %26, label %35, label %27

; <label>:27:                                     ; preds = %23
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %29 = load i32, i32* %28, align 4
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %31 = load i32, i32* %30, align 4
  %32 = add i32 %29, -1
  %33 = add i32 %32, %31
  %34 = udiv i32 %33, %31
  store i32 %34, i32* %24, align 8
  br label %35

; <label>:35:                                     ; preds = %23, %27
  %36 = tail call fastcc i32 @TIFFGrowStrips(%struct.tiff* nonnull %0, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFWriteRawStrip.module, i64 0, i64 0))
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %49, label %38

; <label>:38:                                     ; preds = %35, %12
  %39 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 13
  store i32 %1, i32* %39, align 8
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 42
  %41 = load i32, i32* %40, align 8
  %42 = urem i32 %1, %41
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %44 = load i32, i32* %43, align 4
  %45 = mul i32 %44, %42
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  store i32 %45, i32* %46, align 8
  %47 = tail call fastcc i32 @TIFFAppendToStrip(%struct.tiff* nonnull %0, i32 %1, i8* %2, i32 %3)
  %48 = icmp eq i32 %47, 0
  %. = select i1 %48, i32 -1, i32 %3
  br label %49

; <label>:49:                                     ; preds = %35, %9, %38, %20
  %.0 = phi i32 [ -1, %20 ], [ %., %38 ], [ -1, %9 ], [ -1, %35 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFWriteTile(%struct.tiff*, i8*, i32, i32, i32, i16 zeroext) local_unnamed_addr #0 {
  %7 = tail call i32 @TIFFCheckTile(%struct.tiff* %0, i32 %2, i32 %3, i32 %4, i16 zeroext %5) #4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %12, label %9

; <label>:9:                                      ; preds = %6
  %10 = tail call i32 @TIFFComputeTile(%struct.tiff* %0, i32 %2, i32 %3, i32 %4, i16 zeroext %5) #4
  %11 = tail call i32 @TIFFWriteEncodedTile(%struct.tiff* %0, i32 %10, i8* %1, i32 -1)
  br label %12

; <label>:12:                                     ; preds = %6, %9
  %.0 = phi i32 [ %11, %9 ], [ -1, %6 ]
  ret i32 %.0
}

declare i32 @TIFFCheckTile(%struct.tiff*, i32, i32, i32, i16 zeroext) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFWriteEncodedTile(%struct.tiff*, i32, i8*, i32) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %6 = load i32, i32* %5, align 8
  %7 = and i32 %6, 64
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %12

; <label>:9:                                      ; preds = %4
  %10 = tail call fastcc i32 @TIFFWriteCheck(%struct.tiff* nonnull %0, i32 1, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @TIFFWriteEncodedTile.module, i64 0, i64 0))
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %114, label %12

; <label>:12:                                     ; preds = %9, %4
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  %14 = load i32, i32* %13, align 4
  %15 = icmp ugt i32 %14, %1
  br i1 %15, label %21, label %16

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %18 = load i8*, i8** %17, align 8
  %19 = zext i32 %1 to i64
  %20 = zext i32 %14 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @TIFFWriteEncodedTile.module, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i64 0, i64 0), i8* %18, i64 %19, i64 %20) #4
  br label %114

; <label>:21:                                     ; preds = %12
  %22 = load i32, i32* %5, align 8
  %23 = and i32 %22, 16
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %28

; <label>:25:                                     ; preds = %21
  %26 = tail call i32 @TIFFWriteBufferSetup(%struct.tiff* nonnull %0, i8* null, i32 -1)
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %114, label %28

; <label>:28:                                     ; preds = %25, %21
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 19
  store i32 %1, i32* %29, align 8
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %31 = load i32, i32* %30, align 4
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 5
  %33 = load i32, i32* %32, align 8
  %34 = add i32 %31, -1
  %35 = add i32 %34, %33
  %36 = udiv i32 %35, %33
  %37 = urem i32 %1, %36
  %38 = mul i32 %37, %33
  %39 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  store i32 %38, i32* %39, align 8
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %41 = load i32, i32* %40, align 8
  %42 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 4
  %43 = load i32, i32* %42, align 4
  %44 = add i32 %41, -1
  %45 = add i32 %44, %43
  %46 = udiv i32 %45, %43
  %47 = urem i32 %1, %46
  %48 = mul i32 %47, %43
  %49 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 18
  store i32 %48, i32* %49, align 4
  %50 = load i32, i32* %5, align 8
  %51 = and i32 %50, 32
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %53, label %61

; <label>:53:                                     ; preds = %28
  %54 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 23
  %55 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %54, align 8
  %56 = tail call i32 %55(%struct.tiff* nonnull %0) #4
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %114, label %58

; <label>:58:                                     ; preds = %53
  %59 = load i32, i32* %5, align 8
  %60 = or i32 %59, 32
  store i32 %60, i32* %5, align 8
  br label %61

; <label>:61:                                     ; preds = %58, %28
  %62 = load i32, i32* %5, align 8
  %63 = and i32 %62, -4097
  store i32 %63, i32* %5, align 8
  %64 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 42
  %65 = load i32, i32* %64, align 8
  %66 = udiv i32 %1, %65
  %67 = trunc i32 %66 to i16
  %68 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 24
  %69 = load i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*, i16)** %68, align 8
  %70 = tail call i32 %69(%struct.tiff* nonnull %0, i16 zeroext %67) #4
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %114, label %72

; <label>:72:                                     ; preds = %61
  %73 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 20
  %74 = load i32, i32* %73, align 4
  %75 = icmp ult i32 %74, %3
  %. = select i1 %75, i32 %74, i32 %3
  %76 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 31
  %77 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %76, align 8
  %78 = tail call i32 %77(%struct.tiff* nonnull %0, i8* %2, i32 %., i16 zeroext %67) #4
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %114, label %80

; <label>:80:                                     ; preds = %72
  %81 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 25
  %82 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %81, align 8
  %83 = tail call i32 %82(%struct.tiff* nonnull %0) #4
  %84 = icmp eq i32 %83, 0
  br i1 %84, label %114, label %85

; <label>:85:                                     ; preds = %80
  %86 = load i32, i32* %5, align 8
  %87 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 13
  %88 = load i16, i16* %87, align 2
  %89 = or i16 %88, 256
  %90 = zext i16 %89 to i32
  %91 = and i32 %90, %86
  %92 = icmp eq i32 %91, 0
  br i1 %92, label %93, label %99

; <label>:93:                                     ; preds = %85
  %94 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %95 = load i8*, i8** %94, align 8
  %96 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %97 = load i32, i32* %96, align 8
  %98 = sext i32 %97 to i64
  tail call void @TIFFReverseBits(i8* %95, i64 %98) #4
  br label %99

; <label>:99:                                     ; preds = %85, %93
  %100 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %101 = load i32, i32* %100, align 8
  %102 = icmp sgt i32 %101, 0
  br i1 %102, label %103, label %108

; <label>:103:                                    ; preds = %99
  %104 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %105 = load i8*, i8** %104, align 8
  %106 = tail call fastcc i32 @TIFFAppendToStrip(%struct.tiff* nonnull %0, i32 %1, i8* %105, i32 %101)
  %107 = icmp eq i32 %106, 0
  br i1 %107, label %114, label %108

; <label>:108:                                    ; preds = %103, %99
  store i32 0, i32* %100, align 8
  %109 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %110 = bitcast i8** %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %113 = bitcast i8** %112 to i64*
  store i64 %111, i64* %113, align 8
  br label %114

; <label>:114:                                    ; preds = %103, %80, %72, %61, %53, %25, %9, %108, %16
  %.0 = phi i32 [ -1, %16 ], [ %., %108 ], [ -1, %9 ], [ -1, %25 ], [ -1, %53 ], [ -1, %61 ], [ 0, %72 ], [ -1, %80 ], [ -1, %103 ]
  ret i32 %.0
}

declare i32 @TIFFComputeTile(%struct.tiff*, i32, i32, i32, i16 zeroext) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFWriteRawTile(%struct.tiff*, i32, i8*, i32) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %6 = load i32, i32* %5, align 8
  %7 = and i32 %6, 64
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %12

; <label>:9:                                      ; preds = %4
  %10 = tail call fastcc i32 @TIFFWriteCheck(%struct.tiff* nonnull %0, i32 1, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @TIFFWriteRawTile.module, i64 0, i64 0))
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %24, label %12

; <label>:12:                                     ; preds = %9, %4
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  %14 = load i32, i32* %13, align 4
  %15 = icmp ugt i32 %14, %1
  br i1 %15, label %21, label %16

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %18 = load i8*, i8** %17, align 8
  %19 = zext i32 %1 to i64
  %20 = zext i32 %14 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @TIFFWriteRawTile.module, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i64 0, i64 0), i8* %18, i64 %19, i64 %20) #4
  br label %24

; <label>:21:                                     ; preds = %12
  %22 = tail call fastcc i32 @TIFFAppendToStrip(%struct.tiff* nonnull %0, i32 %1, i8* %2, i32 %3)
  %23 = icmp eq i32 %22, 0
  %. = select i1 %23, i32 -1, i32 %3
  br label %24

; <label>:24:                                     ; preds = %9, %21, %16
  %.0 = phi i32 [ -1, %16 ], [ %., %21 ], [ -1, %9 ]
  ret i32 %.0
}

declare void @_TIFFfree(i8*) local_unnamed_addr #1

declare i8* @_TIFFmalloc(i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFFlushData1(%struct.tiff* nocapture) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %3 = load i32, i32* %2, align 8
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %35

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %7 = load i32, i32* %6, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 13
  %9 = load i16, i16* %8, align 2
  %10 = or i16 %9, 256
  %11 = zext i16 %10 to i32
  %12 = and i32 %7, %11
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %5
  %15 = sext i32 %3 to i64
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %17 = load i8*, i8** %16, align 8
  tail call void @TIFFReverseBits(i8* %17, i64 %15) #4
  br label %18

; <label>:18:                                     ; preds = %5, %14
  %19 = load i32, i32* %6, align 8
  %20 = and i32 %19, 1024
  %21 = icmp eq i32 %20, 0
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 19
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 13
  %.in = select i1 %21, i32* %23, i32* %22
  %24 = load i32, i32* %.in, align 8
  %25 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %26 = load i8*, i8** %25, align 8
  %27 = load i32, i32* %2, align 8
  %28 = tail call fastcc i32 @TIFFAppendToStrip(%struct.tiff* nonnull %0, i32 %24, i8* %26, i32 %27)
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %35, label %30

; <label>:30:                                     ; preds = %18
  store i32 0, i32* %2, align 8
  %31 = bitcast i8** %25 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %34 = bitcast i8** %33 to i64*
  store i64 %32, i64* %34, align 8
  br label %35

; <label>:35:                                     ; preds = %1, %30, %18
  %.0 = phi i32 [ 0, %18 ], [ 1, %30 ], [ 1, %1 ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @TIFFSetWriteOffset(%struct.tiff* nocapture, i32) local_unnamed_addr #2 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 14
  store i32 %1, i32* %3, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFSetupStrips(%struct.tiff*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %3 = load i32, i32* %2, align 8
  %4 = and i32 %3, 1024
  %5 = icmp eq i32 %4, 0
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 0
  %7 = load i64, i64* %6, align 8
  br i1 %5, label %21, label %8

; <label>:8:                                      ; preds = %1
  %9 = and i64 %7, 4
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %19, label %11

; <label>:11:                                     ; preds = %8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %13 = load i32, i32* %12, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %19

; <label>:15:                                     ; preds = %11
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %17 = load i16, i16* %16, align 2
  %18 = zext i16 %17 to i32
  br label %34

; <label>:19:                                     ; preds = %8, %11
  %20 = tail call i32 @TIFFNumberOfTiles(%struct.tiff* nonnull %0) #4
  br label %34

; <label>:21:                                     ; preds = %1
  %22 = and i64 %7, 131072
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %32, label %24

; <label>:24:                                     ; preds = %21
  %25 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %26 = load i32, i32* %25, align 4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %32

; <label>:28:                                     ; preds = %24
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %30 = load i16, i16* %29, align 2
  %31 = zext i16 %30 to i32
  br label %34

; <label>:32:                                     ; preds = %21, %24
  %33 = tail call i32 @TIFFNumberOfStrips(%struct.tiff* nonnull %0) #4
  br label %34

; <label>:34:                                     ; preds = %15, %19, %28, %32
  %.sink = phi i32 [ %31, %28 ], [ %33, %32 ], [ %18, %15 ], [ %20, %19 ]
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 42
  store i32 %.sink, i32* %35, align 8
  %36 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  store i32 %.sink, i32* %36, align 4
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %38 = load i16, i16* %37, align 2
  %39 = icmp eq i16 %38, 2
  br i1 %39, label %40, label %46

; <label>:40:                                     ; preds = %34
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %42 = load i16, i16* %41, align 2
  %43 = zext i16 %42 to i32
  %44 = load i32, i32* %35, align 8
  %45 = udiv i32 %44, %43
  store i32 %45, i32* %35, align 8
  br label %46

; <label>:46:                                     ; preds = %40, %34
  %47 = load i32, i32* %36, align 4
  %48 = shl i32 %47, 2
  %49 = tail call i8* @_TIFFmalloc(i32 %48) #4
  %50 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 44
  %51 = bitcast i32** %50 to i8**
  store i8* %49, i8** %51, align 8
  %52 = load i32, i32* %36, align 4
  %53 = shl i32 %52, 2
  %54 = tail call i8* @_TIFFmalloc(i32 %53) #4
  %55 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 45
  %56 = bitcast i32** %55 to i8**
  store i8* %54, i8** %56, align 8
  %57 = load i32*, i32** %50, align 8
  %58 = icmp eq i32* %57, null
  br i1 %58, label %71, label %59

; <label>:59:                                     ; preds = %46
  %60 = load i32*, i32** %55, align 8
  %61 = icmp eq i32* %60, null
  br i1 %61, label %71, label %62

; <label>:62:                                     ; preds = %59
  %63 = load i8*, i8** %51, align 8
  %64 = load i32, i32* %36, align 4
  %65 = shl i32 %64, 2
  tail call void @_TIFFmemset(i8* %63, i32 0, i32 %65) #4
  %66 = load i8*, i8** %56, align 8
  %67 = load i32, i32* %36, align 4
  %68 = shl i32 %67, 2
  tail call void @_TIFFmemset(i8* %66, i32 0, i32 %68) #4
  %69 = load i64, i64* %6, align 8
  %70 = or i64 %69, 50331648
  store i64 %70, i64* %6, align 8
  br label %71

; <label>:71:                                     ; preds = %46, %59, %62
  %.0 = phi i32 [ 1, %62 ], [ 0, %59 ], [ 0, %46 ]
  ret i32 %.0
}

declare i32 @TIFFTileSize(%struct.tiff*) local_unnamed_addr #1

declare i32 @TIFFScanlineSize(%struct.tiff*) local_unnamed_addr #1

declare i32 @TIFFNumberOfTiles(%struct.tiff*) local_unnamed_addr #1

declare i32 @TIFFNumberOfStrips(%struct.tiff*) local_unnamed_addr #1

declare void @_TIFFmemset(i8*, i32, i32) local_unnamed_addr #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #3

declare i8* @_TIFFrealloc(i8*, i32) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
