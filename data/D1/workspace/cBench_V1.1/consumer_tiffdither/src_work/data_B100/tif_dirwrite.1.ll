; ModuleID = 'tif_dirwrite.ll'
source_filename = "tif_dirwrite.c"
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

@.str = private unnamed_addr constant [43 x i8] c"Error post-encoding before directory write\00", align 1
@.str.1 = private unnamed_addr constant [43 x i8] c"Error flushing data before directory write\00", align 1
@.str.2 = private unnamed_addr constant [37 x i8] c"Cannot write directory, out of space\00", align 1
@.str.3 = private unnamed_addr constant [30 x i8] c"Error writing directory count\00", align 1
@.str.4 = private unnamed_addr constant [33 x i8] c"Error writing directory contents\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"Error writing directory link\00", align 1
@tiffDataWidth = external local_unnamed_addr constant [0 x i32], align 4
@.str.6 = private unnamed_addr constant [34 x i8] c"Error writing data for field \22%s\22\00", align 1
@.str.7 = private unnamed_addr constant [65 x i8] c"\22%s\22: Information lost writing value (%g) as (unsigned) RATIONAL\00", align 1
@TIFFLinkDirectory.module = internal constant [18 x i8] c"TIFFLinkDirectory\00", align 16
@.str.8 = private unnamed_addr constant [40 x i8] c"%s: Error writing SubIFD directory link\00", align 1
@.str.9 = private unnamed_addr constant [26 x i8] c"Error writing TIFF header\00", align 1
@.str.10 = private unnamed_addr constant [31 x i8] c"Error fetching directory count\00", align 1
@.str.11 = private unnamed_addr constant [30 x i8] c"Error fetching directory link\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFWriteDirectory(%struct.tiff*) local_unnamed_addr #0 {
  %2 = alloca i16, align 2
  %3 = alloca i32, align 4
  %4 = alloca [3 x i64], align 16
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 2
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %326, label %8

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %10 = load i32, i32* %9, align 8
  %11 = and i32 %10, 4096
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %23, label %13

; <label>:13:                                     ; preds = %8
  %14 = and i32 %10, -4097
  store i32 %14, i32* %9, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 25
  %16 = bitcast {}** %15 to i32 (%struct.tiff*)**
  %17 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %16, align 8
  %18 = tail call i32 %17(%struct.tiff* nonnull %0) #4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %23

; <label>:20:                                     ; preds = %13
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %22 = load i8*, i8** %21, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %22, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str, i64 0, i64 0)) #4
  br label %326

; <label>:23:                                     ; preds = %13, %8
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 32
  %25 = load void (%struct.tiff*)*, void (%struct.tiff*)** %24, align 8
  tail call void %25(%struct.tiff* nonnull %0) #4
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %27 = load i32, i32* %26, align 8
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %29, label %35

; <label>:29:                                     ; preds = %23
  %30 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %35

; <label>:32:                                     ; preds = %29
  %33 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %34 = load i8*, i8** %33, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %34, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.1, i64 0, i64 0)) #4
  br label %326

; <label>:35:                                     ; preds = %29, %23
  %36 = load i32, i32* %9, align 8
  %37 = and i32 %36, 512
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %44, label %39

; <label>:39:                                     ; preds = %35
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %41 = load i8*, i8** %40, align 8
  %42 = icmp eq i8* %41, null
  br i1 %42, label %44, label %43

; <label>:43:                                     ; preds = %39
  tail call void @_TIFFfree(i8* nonnull %41) #4
  store i8* null, i8** %40, align 8
  store i32 0, i32* %26, align 8
  br label %44

; <label>:44:                                     ; preds = %39, %35, %43
  %45 = load i32, i32* %9, align 8
  %46 = and i32 %45, -81
  store i32 %46, i32* %9, align 8
  br label %47

; <label>:47:                                     ; preds = %47, %44
  %.0219 = phi i32 [ 0, %44 ], [ %.02..1, %47 ]
  %.0818 = phi i64 [ 0, %44 ], [ %69, %47 ]
  %48 = lshr i64 %.0818, 5
  %49 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 %48
  %50 = load i64, i64* %49, align 8
  %51 = and i64 %.0818, 30
  %52 = shl i64 1, %51
  %53 = and i64 %50, %52
  %54 = icmp eq i64 %53, 0
  %55 = icmp ult i64 %.0818, 5
  %56 = select i1 %55, i32 2, i32 1
  %57 = select i1 %54, i32 0, i32 %56
  %.02. = add i32 %57, %.0219
  %58 = or i64 %.0818, 1
  %59 = lshr i64 %.0818, 5
  %60 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 %59
  %61 = load i64, i64* %60, align 8
  %62 = and i64 %58, 31
  %63 = shl i64 1, %62
  %64 = and i64 %61, %63
  %65 = icmp eq i64 %64, 0
  %66 = icmp ult i64 %58, 5
  %67 = select i1 %66, i32 2, i32 1
  %68 = select i1 %65, i32 0, i32 %67
  %.02..1 = add i32 %68, %.02.
  %69 = add nsw i64 %.0818, 2
  %exitcond.1 = icmp eq i64 %69, 96
  br i1 %exitcond.1, label %70, label %47

; <label>:70:                                     ; preds = %47
  %71 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6
  %72 = mul i32 %.02..1, 12
  %73 = tail call i8* @_TIFFmalloc(i32 %72) #4
  %74 = icmp eq i8* %73, null
  br i1 %74, label %75, label %78

; <label>:75:                                     ; preds = %70
  %76 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %77 = load i8*, i8** %76, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %77, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.2, i64 0, i64 0)) #4
  br label %326

; <label>:78:                                     ; preds = %70
  %79 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 4
  %80 = load i32, i32* %79, align 4
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %82, label %85

; <label>:82:                                     ; preds = %78
  %83 = tail call fastcc i32 @TIFFLinkDirectory(%struct.tiff* nonnull %0)
  %84 = icmp eq i32 %83, 0
  br i1 %84, label %.loopexit, label %85

; <label>:85:                                     ; preds = %82, %78
  %86 = load i32, i32* %79, align 4
  %87 = or i32 %72, 2
  %88 = add i32 %87, %86
  %89 = add i32 %88, 4
  %90 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 15
  %91 = and i32 %89, 1
  %92 = icmp eq i32 %91, 0
  %93 = add i32 %88, 5
  %. = select i1 %92, i32 %89, i32 %93
  store i32 %., i32* %90, align 8
  %94 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 51
  %95 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %94, align 8
  %96 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 48
  %97 = load i8*, i8** %96, align 8
  %98 = tail call i32 %95(i8* %97, i32 %., i32 0) #4
  %99 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 12
  %100 = load i16, i16* %99, align 4
  %101 = add i16 %100, 1
  store i16 %101, i16* %99, align 4
  %102 = bitcast i8* %73 to %struct.TIFFDirEntry*
  %103 = bitcast [3 x i64]* %4 to i8*
  %104 = bitcast %struct.TIFFDirectory* %71 to i8*
  call void @_TIFFmemcpy(i8* nonnull %103, i8* %104, i32 24) #4
  %105 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 0
  %106 = load i64, i64* %105, align 16
  %107 = trunc i64 %106 to i32
  %108 = icmp slt i32 %107, 0
  br i1 %108, label %109, label %117

; <label>:109:                                    ; preds = %85
  %110 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 30
  %111 = load i16, i16* %110, align 4
  %112 = icmp eq i16 %111, 0
  br i1 %112, label %113, label %117

; <label>:113:                                    ; preds = %109
  %114 = add i32 %72, -12
  %115 = add i32 %.02..1, -1
  %116 = and i64 %106, -2147483649
  store i64 %116, i64* %105, align 16
  br label %117

; <label>:117:                                    ; preds = %109, %113, %85
  %.03 = phi i32 [ %72, %109 ], [ %114, %113 ], [ %72, %85 ]
  %.2 = phi i32 [ %.02..1, %109 ], [ %115, %113 ], [ %.02..1, %85 ]
  %118 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 56
  %119 = load i32, i32* %118, align 8
  %120 = icmp sgt i32 %119, 0
  br i1 %120, label %.lr.ph16, label %._crit_edge17

.lr.ph16:                                         ; preds = %117
  %121 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 55
  %122 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  %123 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 44
  %124 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  %125 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 45
  %126 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %127 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 28, i64 0
  %128 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %129 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %130 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 4
  %131 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 5
  %132 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 25
  %133 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 26
  %134 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 21
  %135 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 22
  %136 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 16
  %137 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 17
  %138 = ptrtoint i8* %73 to i64
  %139 = sub i64 2, %138
  br label %140

; <label>:140:                                    ; preds = %.lr.ph16, %270
  %indvars.iv = phi i64 [ 0, %.lr.ph16 ], [ %indvars.iv.next, %270 ]
  %.0114 = phi i32 [ %119, %.lr.ph16 ], [ %271, %270 ]
  %.0512 = phi %struct.TIFFDirEntry* [ %102, %.lr.ph16 ], [ %.27, %270 ]
  %141 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %121, align 8
  %142 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %141, i64 %indvars.iv
  %143 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %142, align 8
  %144 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %143, i64 0, i32 4
  %145 = load i16, i16* %144, align 4
  %div = lshr i16 %145, 5
  %146 = zext i16 %div to i64
  %147 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 %146
  %148 = load i64, i64* %147, align 8
  %149 = and i16 %145, 31
  %150 = zext i16 %149 to i64
  %151 = shl i64 1, %150
  %152 = and i64 %151, %148
  %153 = icmp eq i64 %152, 0
  br i1 %153, label %270, label %154

; <label>:154:                                    ; preds = %140
  switch i16 %145, label %256 [
    i16 25, label %155
    i16 24, label %168
    i16 17, label %181
    i16 26, label %183
    i16 1, label %186
    i16 2, label %190
    i16 4, label %194
    i16 3, label %201
    i16 6, label %208
    i16 18, label %208
    i16 19, label %208
    i16 32, label %208
    i16 33, label %213
    i16 34, label %213
    i16 23, label %219
    i16 37, label %219
    i16 39, label %219
    i16 47, label %219
    i16 46, label %224
    i16 44, label %227
    i16 49, label %230
  ]

; <label>:155:                                    ; preds = %154
  %156 = load i32, i32* %9, align 8
  %157 = and i32 %156, 1024
  %158 = icmp ne i32 %157, 0
  %159 = select i1 %158, i32 324, i32 273
  %160 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %143, i64 0, i32 0
  %161 = load i32, i32* %160, align 8
  %162 = icmp eq i32 %159, %161
  br i1 %162, label %163, label %270

; <label>:163:                                    ; preds = %155
  %164 = load i32, i32* %122, align 4
  %165 = load i32*, i32** %123, align 8
  %166 = call fastcc i32 @TIFFWriteLongArray(%struct.tiff* nonnull %0, i32 4, i32 %159, %struct.TIFFDirEntry* %.0512, i32 %164, i32* %165)
  %167 = icmp eq i32 %166, 0
  br i1 %167, label %.loopexit.loopexit, label %259

; <label>:168:                                    ; preds = %154
  %169 = load i32, i32* %9, align 8
  %170 = and i32 %169, 1024
  %171 = icmp ne i32 %170, 0
  %172 = select i1 %171, i32 325, i32 279
  %173 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %143, i64 0, i32 0
  %174 = load i32, i32* %173, align 8
  %175 = icmp eq i32 %172, %174
  br i1 %175, label %176, label %270

; <label>:176:                                    ; preds = %168
  %177 = load i32, i32* %124, align 4
  %178 = load i32*, i32** %125, align 8
  %179 = call fastcc i32 @TIFFWriteLongArray(%struct.tiff* nonnull %0, i32 4, i32 %172, %struct.TIFFDirEntry* %.0512, i32 %177, i32* %178)
  %180 = icmp eq i32 %179, 0
  br i1 %180, label %.loopexit.loopexit, label %259

; <label>:181:                                    ; preds = %154
  %182 = load i32, i32* %126, align 4
  call fastcc void @TIFFSetupShortLong(%struct.tiff* nonnull %0, i32 278, %struct.TIFFDirEntry* %.0512, i32 %182)
  br label %259

; <label>:183:                                    ; preds = %154
  %184 = call fastcc i32 @TIFFWriteShortTable(%struct.tiff* nonnull %0, i32 320, %struct.TIFFDirEntry* %.0512, i32 3, i16** nonnull %127)
  %185 = icmp eq i32 %184, 0
  br i1 %185, label %.loopexit.loopexit, label %259

; <label>:186:                                    ; preds = %154
  %187 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.0512, i64 1
  %188 = load i32, i32* %128, align 8
  call fastcc void @TIFFSetupShortLong(%struct.tiff* nonnull %0, i32 256, %struct.TIFFDirEntry* %.0512, i32 %188)
  %189 = load i32, i32* %129, align 4
  call fastcc void @TIFFSetupShortLong(%struct.tiff* nonnull %0, i32 257, %struct.TIFFDirEntry* %187, i32 %189)
  br label %259

; <label>:190:                                    ; preds = %154
  %191 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.0512, i64 1
  %192 = load i32, i32* %130, align 4
  call fastcc void @TIFFSetupShortLong(%struct.tiff* nonnull %0, i32 322, %struct.TIFFDirEntry* %.0512, i32 %192)
  %193 = load i32, i32* %131, align 8
  call fastcc void @TIFFSetupShortLong(%struct.tiff* nonnull %0, i32 323, %struct.TIFFDirEntry* %191, i32 %193)
  br label %259

; <label>:194:                                    ; preds = %154
  %195 = call fastcc i32 @TIFFWriteRationalArray(%struct.tiff* nonnull %0, i32 5, i32 286, %struct.TIFFDirEntry* %.0512, i32 1, float* nonnull %132)
  %196 = icmp eq i32 %195, 0
  br i1 %196, label %.loopexit.loopexit, label %197

; <label>:197:                                    ; preds = %194
  %198 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.0512, i64 1
  %199 = call fastcc i32 @TIFFWriteRationalArray(%struct.tiff* nonnull %0, i32 5, i32 287, %struct.TIFFDirEntry* %198, i32 1, float* nonnull %133)
  %200 = icmp eq i32 %199, 0
  br i1 %200, label %.loopexit.loopexit, label %259

; <label>:201:                                    ; preds = %154
  %202 = call fastcc i32 @TIFFWriteRationalArray(%struct.tiff* nonnull %0, i32 5, i32 282, %struct.TIFFDirEntry* %.0512, i32 1, float* nonnull %134)
  %203 = icmp eq i32 %202, 0
  br i1 %203, label %.loopexit.loopexit, label %204

; <label>:204:                                    ; preds = %201
  %205 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.0512, i64 1
  %206 = call fastcc i32 @TIFFWriteRationalArray(%struct.tiff* %0, i32 5, i32 283, %struct.TIFFDirEntry* %205, i32 1, float* nonnull %135)
  %207 = icmp eq i32 %206, 0
  br i1 %207, label %.loopexit.loopexit, label %259

; <label>:208:                                    ; preds = %154, %154, %154, %154
  %209 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %143, i64 0, i32 0
  %210 = load i32, i32* %209, align 8
  %211 = call fastcc i32 @TIFFWritePerSampleShorts(%struct.tiff* nonnull %0, i32 %210, %struct.TIFFDirEntry* %.0512)
  %212 = icmp eq i32 %211, 0
  br i1 %212, label %.loopexit.loopexit, label %259

; <label>:213:                                    ; preds = %154, %154
  %214 = call i32 @_TIFFSampleToTagType(%struct.tiff* nonnull %0) #4
  %215 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %143, i64 0, i32 0
  %216 = load i32, i32* %215, align 8
  %217 = call fastcc i32 @TIFFWritePerSampleAnys(%struct.tiff* nonnull %0, i32 %214, i32 %216, %struct.TIFFDirEntry* %.0512)
  %218 = icmp eq i32 %217, 0
  br i1 %218, label %.loopexit.loopexit, label %259

; <label>:219:                                    ; preds = %154, %154, %154, %154
  %220 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %143, i64 0, i32 0
  %221 = load i32, i32* %220, align 8
  %222 = call fastcc i32 @TIFFSetupShortPair(%struct.tiff* nonnull %0, i32 %221, %struct.TIFFDirEntry* %.0512)
  %223 = icmp eq i32 %222, 0
  br i1 %223, label %.loopexit.loopexit, label %259

; <label>:224:                                    ; preds = %154
  %225 = call fastcc i32 @TIFFWriteInkNames(%struct.tiff* nonnull %0, %struct.TIFFDirEntry* %.0512)
  %226 = icmp eq i32 %225, 0
  br i1 %226, label %.loopexit.loopexit, label %259

; <label>:227:                                    ; preds = %154
  %228 = call fastcc i32 @TIFFWriteTransferFunction(%struct.tiff* nonnull %0, %struct.TIFFDirEntry* %.0512)
  %229 = icmp eq i32 %228, 0
  br i1 %229, label %.loopexit.loopexit, label %259

; <label>:230:                                    ; preds = %154
  %231 = call fastcc i32 @TIFFWriteNormalTag(%struct.tiff* nonnull %0, %struct.TIFFDirEntry* %.0512, %struct.TIFFFieldInfo* %143)
  %232 = icmp eq i32 %231, 0
  br i1 %232, label %.loopexit.loopexit, label %233

; <label>:233:                                    ; preds = %230
  %234 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.0512, i64 0, i32 2
  %235 = load i32, i32* %234, align 4
  %236 = icmp eq i32 %235, 0
  br i1 %236, label %259, label %237

; <label>:237:                                    ; preds = %233
  %238 = load i32, i32* %9, align 8
  %239 = or i32 %238, 8192
  store i32 %239, i32* %9, align 8
  %240 = load i32, i32* %234, align 4
  %241 = trunc i32 %240 to i16
  store i16 %241, i16* %136, align 4
  %242 = load i32, i32* %234, align 4
  %243 = icmp ugt i32 %242, 1
  br i1 %243, label %244, label %247

; <label>:244:                                    ; preds = %237
  %245 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.0512, i64 0, i32 3
  %246 = load i32, i32* %245, align 4
  br label %255

; <label>:247:                                    ; preds = %237
  %248 = load i32, i32* %79, align 4
  %249 = zext i32 %248 to i64
  %250 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.0512, i64 0, i32 3
  %251 = ptrtoint i32* %250 to i64
  %252 = add i64 %139, %251
  %253 = add i64 %252, %249
  %254 = trunc i64 %253 to i32
  br label %255

; <label>:255:                                    ; preds = %247, %244
  %.sink = phi i32 [ %254, %247 ], [ %246, %244 ]
  store i32 %.sink, i32* %137, align 8
  br label %259

; <label>:256:                                    ; preds = %154
  %257 = call fastcc i32 @TIFFWriteNormalTag(%struct.tiff* nonnull %0, %struct.TIFFDirEntry* %.0512, %struct.TIFFFieldInfo* %143)
  %258 = icmp eq i32 %257, 0
  br i1 %258, label %.loopexit.loopexit, label %259

; <label>:259:                                    ; preds = %204, %197, %256, %255, %233, %227, %224, %219, %213, %208, %183, %176, %163, %190, %186, %181
  %.16 = phi %struct.TIFFDirEntry* [ %191, %190 ], [ %187, %186 ], [ %.0512, %181 ], [ %.0512, %163 ], [ %.0512, %176 ], [ %.0512, %183 ], [ %.0512, %208 ], [ %.0512, %213 ], [ %.0512, %219 ], [ %.0512, %224 ], [ %.0512, %227 ], [ %.0512, %233 ], [ %.0512, %255 ], [ %.0512, %256 ], [ %198, %197 ], [ %205, %204 ]
  %260 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.16, i64 1
  %261 = load i16, i16* %144, align 4
  %262 = and i16 %261, 31
  %263 = zext i16 %262 to i64
  %264 = shl i64 1, %263
  %265 = xor i64 %264, -1
  %div9 = lshr i16 %261, 5
  %266 = zext i16 %div9 to i64
  %267 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 %266
  %268 = load i64, i64* %267, align 8
  %269 = and i64 %268, %265
  store i64 %269, i64* %267, align 8
  br label %270

; <label>:270:                                    ; preds = %168, %155, %140, %259
  %.27 = phi %struct.TIFFDirEntry* [ %260, %259 ], [ %.0512, %140 ], [ %.0512, %155 ], [ %.0512, %168 ]
  %271 = add nsw i32 %.0114, -1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %272 = icmp sgt i32 %.0114, 1
  br i1 %272, label %140, label %._crit_edge17.loopexit

._crit_edge17.loopexit:                           ; preds = %270
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %117
  %273 = trunc i32 %.2 to i16
  store i16 %273, i16* %2, align 2
  %274 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 5
  %275 = load i32, i32* %274, align 8
  store i32 %275, i32* %3, align 4
  %276 = load i32, i32* %9, align 8
  %277 = trunc i32 %276 to i8
  %278 = icmp slt i8 %277, 0
  br i1 %278, label %thread-pre-split, label %286

thread-pre-split:                                 ; preds = %._crit_edge17
  %.pr = load i16, i16* %2, align 2
  %279 = icmp eq i16 %.pr, 0
  br i1 %279, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %thread-pre-split
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.311 = phi %struct.TIFFDirEntry* [ %282, %.lr.ph ], [ %102, %.lr.ph.preheader ]
  %280 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.311, i64 0, i32 0
  call void @TIFFSwabArrayOfShort(i16* %280, i64 2) #4
  %281 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.311, i64 0, i32 2
  call void @TIFFSwabArrayOfLong(i32* %281, i64 2) #4
  %282 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %.311, i64 1
  %283 = load i16, i16* %2, align 2
  %284 = add i16 %283, -1
  store i16 %284, i16* %2, align 2
  %285 = icmp eq i16 %284, 0
  br i1 %285, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %thread-pre-split
  store i16 %273, i16* %2, align 2
  call void @TIFFSwabShort(i16* nonnull %2) #4
  call void @TIFFSwabLong(i32* nonnull %3) #4
  br label %286

; <label>:286:                                    ; preds = %._crit_edge, %._crit_edge17
  %287 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %94, align 8
  %288 = load i8*, i8** %96, align 8
  %289 = load i32, i32* %79, align 4
  %290 = call i32 %287(i8* %288, i32 %289, i32 0) #4
  %291 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 50
  %292 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %291, align 8
  %293 = load i8*, i8** %96, align 8
  %294 = bitcast i16* %2 to i8*
  %295 = call i32 %292(i8* %293, i8* nonnull %294, i32 2) #4
  %296 = icmp eq i32 %295, 2
  br i1 %296, label %300, label %297

; <label>:297:                                    ; preds = %286
  %298 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %299 = load i8*, i8** %298, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %299, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %.loopexit

; <label>:300:                                    ; preds = %286
  %301 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %291, align 8
  %302 = load i8*, i8** %96, align 8
  %303 = call i32 %301(i8* %302, i8* nonnull %73, i32 %.03) #4
  %304 = icmp eq i32 %303, %.03
  br i1 %304, label %308, label %305

; <label>:305:                                    ; preds = %300
  %306 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %307 = load i8*, i8** %306, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %307, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.4, i64 0, i64 0)) #4
  br label %.loopexit

; <label>:308:                                    ; preds = %300
  %309 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %291, align 8
  %310 = load i8*, i8** %96, align 8
  %311 = bitcast i32* %3 to i8*
  %312 = call i32 %309(i8* %310, i8* nonnull %311, i32 4) #4
  %313 = icmp eq i32 %312, 4
  br i1 %313, label %317, label %314

; <label>:314:                                    ; preds = %308
  %315 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %316 = load i8*, i8** %315, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %316, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.5, i64 0, i64 0)) #4
  br label %.loopexit

; <label>:317:                                    ; preds = %308
  call void @TIFFFreeDirectory(%struct.tiff* nonnull %0) #4
  call void @_TIFFfree(i8* nonnull %73) #4
  %318 = load i32, i32* %9, align 8
  %319 = and i32 %318, -9
  store i32 %319, i32* %9, align 8
  %320 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 34
  %321 = load void (%struct.tiff*)*, void (%struct.tiff*)** %320, align 8
  call void %321(%struct.tiff* nonnull %0) #4
  %322 = call i32 @TIFFDefaultDirectory(%struct.tiff* nonnull %0) #4
  store i32 0, i32* %79, align 4
  %323 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 14
  store i32 0, i32* %323, align 4
  %324 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  store i32 -1, i32* %324, align 8
  %325 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 13
  store i32 -1, i32* %325, align 8
  br label %326

.loopexit.loopexit:                               ; preds = %163, %176, %183, %194, %197, %201, %204, %208, %213, %219, %224, %227, %230, %256
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %82, %314, %305, %297
  call void @_TIFFfree(i8* nonnull %73) #4
  br label %326

; <label>:326:                                    ; preds = %1, %.loopexit, %317, %75, %32, %20
  %.0 = phi i32 [ 0, %75 ], [ 0, %.loopexit ], [ 1, %317 ], [ 0, %32 ], [ 0, %20 ], [ 1, %1 ]
  ret i32 %.0
}

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #1

declare i32 @TIFFFlushData1(%struct.tiff*) local_unnamed_addr #1

declare void @_TIFFfree(i8*) local_unnamed_addr #1

declare i8* @_TIFFmalloc(i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFLinkDirectory(%struct.tiff*) unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i16, align 2
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 51
  %6 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %5, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 48
  %8 = load i8*, i8** %7, align 8
  %9 = tail call i32 %6(i8* %8, i32 0, i32 2) #4
  %10 = add nsw i32 %9, 1
  %11 = and i32 %10, -2
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 4
  store i32 %11, i32* %12, align 4
  store i32 %11, i32* %3, align 4
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %14 = load i32, i32* %13, align 8
  %15 = trunc i32 %14 to i8
  %16 = icmp slt i8 %15, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %1
  call void @TIFFSwabLong(i32* nonnull %3) #4
  br label %18

; <label>:18:                                     ; preds = %17, %1
  %19 = load i32, i32* %13, align 8
  %20 = and i32 %19, 8192
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %48, label %22

; <label>:22:                                     ; preds = %18
  %23 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %5, align 8
  %24 = load i8*, i8** %7, align 8
  %25 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 17
  %26 = load i32, i32* %25, align 8
  %27 = call i32 %23(i8* %24, i32 %26, i32 0) #4
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 50
  %29 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %28, align 8
  %30 = load i8*, i8** %7, align 8
  %31 = bitcast i32* %3 to i8*
  %32 = call i32 %29(i8* %30, i8* nonnull %31, i32 4) #4
  %33 = icmp eq i32 %32, 4
  br i1 %33, label %37, label %34

; <label>:34:                                     ; preds = %22
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %36 = load i8*, i8** %35, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFLinkDirectory.module, i64 0, i64 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.8, i64 0, i64 0), i8* %36) #4
  br label %119

; <label>:37:                                     ; preds = %22
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 16
  %39 = load i16, i16* %38, align 4
  %40 = add i16 %39, -1
  store i16 %40, i16* %38, align 4
  %41 = icmp eq i16 %40, 0
  br i1 %41, label %45, label %42

; <label>:42:                                     ; preds = %37
  %43 = load i32, i32* %25, align 8
  %44 = add i32 %43, 4
  store i32 %44, i32* %25, align 8
  br label %119

; <label>:45:                                     ; preds = %37
  %46 = load i32, i32* %13, align 8
  %47 = and i32 %46, -8193
  store i32 %47, i32* %13, align 8
  br label %119

; <label>:48:                                     ; preds = %18
  %49 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 7, i32 2
  %50 = load i32, i32* %49, align 4
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %66

; <label>:52:                                     ; preds = %48
  %53 = load i32, i32* %12, align 4
  store i32 %53, i32* %49, align 4
  %54 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %5, align 8
  %55 = load i8*, i8** %7, align 8
  %56 = call i32 %54(i8* %55, i32 4, i32 0) #4
  %57 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 50
  %58 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %57, align 8
  %59 = load i8*, i8** %7, align 8
  %60 = bitcast i32* %3 to i8*
  %61 = call i32 %58(i8* %59, i8* nonnull %60, i32 4) #4
  %62 = icmp eq i32 %61, 4
  br i1 %62, label %119, label %63

; <label>:63:                                     ; preds = %52
  %64 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %65 = load i8*, i8** %64, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %65, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.9, i64 0, i64 0)) #4
  br label %119

; <label>:66:                                     ; preds = %48
  store i32 %50, i32* %2, align 4
  %67 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 49
  %68 = bitcast i16* %4 to i8*
  %69 = bitcast i32* %2 to i8*
  br label %70

; <label>:70:                                     ; preds = %105, %66
  %71 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %5, align 8
  %72 = load i8*, i8** %7, align 8
  %73 = load i32, i32* %2, align 4
  %74 = call i32 %71(i8* %72, i32 %73, i32 0) #4
  %75 = load i32, i32* %2, align 4
  %76 = icmp eq i32 %74, %75
  br i1 %76, label %77, label %82

; <label>:77:                                     ; preds = %70
  %78 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %67, align 8
  %79 = load i8*, i8** %7, align 8
  %80 = call i32 %78(i8* %79, i8* nonnull %68, i32 2) #4
  %81 = icmp eq i32 %80, 2
  br i1 %81, label %83, label %82

; <label>:82:                                     ; preds = %77, %70
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFLinkDirectory.module, i64 0, i64 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.10, i64 0, i64 0)) #4
  br label %119

; <label>:83:                                     ; preds = %77
  %84 = load i32, i32* %13, align 8
  %85 = trunc i32 %84 to i8
  %86 = icmp slt i8 %85, 0
  br i1 %86, label %87, label %88

; <label>:87:                                     ; preds = %83
  call void @TIFFSwabShort(i16* nonnull %4) #4
  br label %88

; <label>:88:                                     ; preds = %87, %83
  %89 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %5, align 8
  %90 = load i8*, i8** %7, align 8
  %91 = load i16, i16* %4, align 2
  %92 = zext i16 %91 to i32
  %93 = mul nuw nsw i32 %92, 12
  %94 = call i32 %89(i8* %90, i32 %93, i32 1) #4
  %95 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %67, align 8
  %96 = load i8*, i8** %7, align 8
  %97 = call i32 %95(i8* %96, i8* nonnull %69, i32 4) #4
  %98 = icmp eq i32 %97, 4
  br i1 %98, label %100, label %99

; <label>:99:                                     ; preds = %88
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFLinkDirectory.module, i64 0, i64 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.11, i64 0, i64 0)) #4
  br label %119

; <label>:100:                                    ; preds = %88
  %101 = load i32, i32* %13, align 8
  %102 = trunc i32 %101 to i8
  %103 = icmp slt i8 %102, 0
  br i1 %103, label %104, label %105

; <label>:104:                                    ; preds = %100
  call void @TIFFSwabLong(i32* nonnull %2) #4
  br label %105

; <label>:105:                                    ; preds = %100, %104
  %106 = load i32, i32* %2, align 4
  %107 = icmp eq i32 %106, 0
  br i1 %107, label %108, label %70

; <label>:108:                                    ; preds = %105
  %109 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %5, align 8
  %110 = load i8*, i8** %7, align 8
  %111 = call i32 %109(i8* %110, i32 -4, i32 1) #4
  %112 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 50
  %113 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %112, align 8
  %114 = load i8*, i8** %7, align 8
  %115 = bitcast i32* %3 to i8*
  %116 = call i32 %113(i8* %114, i8* nonnull %115, i32 4) #4
  %117 = icmp eq i32 %116, 4
  br i1 %117, label %119, label %118

; <label>:118:                                    ; preds = %108
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @TIFFLinkDirectory.module, i64 0, i64 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.5, i64 0, i64 0)) #4
  br label %119

; <label>:119:                                    ; preds = %108, %52, %42, %45, %118, %99, %82, %63, %34
  %.0 = phi i32 [ 0, %34 ], [ 0, %63 ], [ 0, %118 ], [ 0, %99 ], [ 0, %82 ], [ 1, %45 ], [ 1, %42 ], [ 1, %52 ], [ 1, %108 ]
  ret i32 %.0
}

declare void @_TIFFmemcpy(i8*, i8*, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFWriteLongArray(%struct.tiff*, i32, i32, %struct.TIFFDirEntry* nocapture, i32, i32*) unnamed_addr #0 {
  %7 = trunc i32 %2 to i16
  %8 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 0
  store i16 %7, i16* %8, align 4
  %9 = trunc i32 %1 to i16
  %10 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 1
  store i16 %9, i16* %10, align 2
  %11 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 2
  store i32 %4, i32* %11, align 4
  %12 = icmp eq i32 %4, 1
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %6
  %14 = load i32, i32* %5, align 4
  %15 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 3
  store i32 %14, i32* %15, align 4
  br label %19

; <label>:16:                                     ; preds = %6
  %17 = bitcast i32* %5 to i8*
  %18 = tail call fastcc i32 @TIFFWriteData(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %3, i8* %17)
  br label %19

; <label>:19:                                     ; preds = %16, %13
  %.0 = phi i32 [ 1, %13 ], [ %18, %16 ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @TIFFSetupShortLong(%struct.tiff* nocapture readonly, i32, %struct.TIFFDirEntry* nocapture, i32) unnamed_addr #2 {
  %5 = trunc i32 %1 to i16
  %6 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %2, i64 0, i32 0
  store i16 %5, i16* %6, align 4
  %7 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %2, i64 0, i32 2
  store i32 1, i32* %7, align 4
  %8 = icmp ugt i32 %3, 65535
  %9 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %2, i64 0, i32 1
  br i1 %8, label %10, label %11

; <label>:10:                                     ; preds = %4
  store i16 4, i16* %9, align 2
  br label %31

; <label>:11:                                     ; preds = %4
  store i16 3, i16* %9, align 2
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 7, i32 0
  %13 = load i16, i16* %12, align 8
  %14 = icmp eq i16 %13, 19789
  %15 = zext i32 %3 to i64
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 10
  %17 = load i64*, i64** %16, align 8
  %18 = getelementptr inbounds i64, i64* %17, i64 3
  %19 = load i64, i64* %18, align 8
  %20 = and i64 %19, %15
  br i1 %14, label %21, label %28

; <label>:21:                                     ; preds = %11
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 9
  %23 = load i32*, i32** %22, align 8
  %24 = getelementptr inbounds i32, i32* %23, i64 3
  %25 = load i32, i32* %24, align 4
  %26 = zext i32 %25 to i64
  %27 = shl i64 %20, %26
  br label %28

; <label>:28:                                     ; preds = %11, %21
  %29 = phi i64 [ %27, %21 ], [ %20, %11 ]
  %30 = trunc i64 %29 to i32
  br label %31

; <label>:31:                                     ; preds = %28, %10
  %.sink = phi i32 [ %30, %28 ], [ %3, %10 ]
  %32 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %2, i64 0, i32 3
  store i32 %.sink, i32* %32, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFWriteShortTable(%struct.tiff*, i32, %struct.TIFFDirEntry* nocapture, i32, i16** nocapture readonly) unnamed_addr #0 {
  %6 = trunc i32 %1 to i16
  %7 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %2, i64 0, i32 0
  store i16 %6, i16* %7, align 4
  %8 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %2, i64 0, i32 1
  store i16 3, i16* %8, align 2
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %10 = load i16, i16* %9, align 4
  %11 = zext i16 %10 to i64
  %12 = shl i64 1, %11
  %13 = trunc i64 %12 to i32
  %14 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %2, i64 0, i32 2
  store i32 %13, i32* %14, align 4
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 15
  %16 = load i32, i32* %15, align 8
  %17 = icmp eq i32 %3, 0
  br i1 %17, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %5
  %18 = zext i32 %3 to i64
  br label %.lr.ph

; <label>:19:                                     ; preds = %.lr.ph
  %20 = icmp ult i64 %indvars.iv.next, %18
  br i1 %20, label %.lr.ph, label %._crit_edge.loopexit

.lr.ph:                                           ; preds = %.lr.ph.preheader, %19
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %19 ]
  %21 = getelementptr inbounds i16*, i16** %4, i64 %indvars.iv
  %22 = bitcast i16** %21 to i8**
  %23 = load i8*, i8** %22, align 8
  %24 = tail call fastcc i32 @TIFFWriteData(%struct.tiff* %0, %struct.TIFFDirEntry* %2, i8* %23)
  %25 = icmp eq i32 %24, 0
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %25, label %.loopexit.loopexit, label %19

._crit_edge.loopexit:                             ; preds = %19
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  %26 = load i32, i32* %14, align 4
  %27 = mul i32 %26, %3
  store i32 %27, i32* %14, align 4
  %28 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %2, i64 0, i32 3
  store i32 %16, i32* %28, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge
  %.0 = phi i32 [ 1, %._crit_edge ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFWriteRationalArray(%struct.tiff*, i32, i32, %struct.TIFFDirEntry* nocapture, i32, float* nocapture readonly) unnamed_addr #0 {
  %7 = trunc i32 %2 to i16
  %8 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 0
  store i16 %7, i16* %8, align 4
  %9 = trunc i32 %1 to i16
  %10 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 1
  store i16 %9, i16* %10, align 2
  %11 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 2
  store i32 %4, i32* %11, align 4
  %12 = shl i32 %4, 3
  %13 = tail call i8* @_TIFFmalloc(i32 %12) #4
  %14 = bitcast i8* %13 to i32*
  %15 = icmp eq i32 %4, 0
  br i1 %15, label %._crit_edge, label %.lr.ph11

.lr.ph11:                                         ; preds = %6
  %16 = icmp eq i32 %1, 5
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %wide.trip.count = zext i32 %4 to i64
  br i1 %16, label %.lr.ph11.split.us.preheader, label %.lr.ph11.split.preheader

.lr.ph11.split.preheader:                         ; preds = %.lr.ph11
  br label %.lr.ph11.split

.lr.ph11.split.us.preheader:                      ; preds = %.lr.ph11
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %.lr.ph11.split.us.preheader, %.loopexit.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %.loopexit.us ], [ 0, %.lr.ph11.split.us.preheader ]
  %18 = getelementptr inbounds float, float* %5, i64 %indvars.iv
  %19 = load float, float* %18, align 4
  %20 = fcmp olt float %19, 0.000000e+00
  br i1 %20, label %.thread.us, label %21

; <label>:21:                                     ; preds = %.lr.ph11.split.us
  %22 = fcmp ogt float %19, 0.000000e+00
  %23 = fcmp olt float %19, 0x41B0000000000000
  %or.cond = and i1 %22, %23
  br i1 %or.cond, label %.lr.ph.us.preheader, label %.loopexit.us

.lr.ph.us.preheader:                              ; preds = %21
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %.lr.ph.us
  %.08.us = phi i32 [ %25, %.lr.ph.us ], [ 1, %.lr.ph.us.preheader ]
  %.27.us = phi float [ %24, %.lr.ph.us ], [ %19, %.lr.ph.us.preheader ]
  %24 = fmul float %.27.us, 8.000000e+00
  %25 = shl i32 %.08.us, 3
  %26 = fcmp olt float %24, 0x41B0000000000000
  %27 = icmp ult i32 %25, 268435456
  %28 = and i1 %26, %27
  br i1 %28, label %.lr.ph.us, label %.loopexit.us.loopexit

.thread.us:                                       ; preds = %.lr.ph11.split.us
  %29 = load i8*, i8** %17, align 8
  %30 = tail call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %0, i32 %2) #4
  %31 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %30, i64 0, i32 7
  %32 = load i8*, i8** %31, align 8
  %33 = fpext float %19 to double
  tail call void (i8*, i8*, ...) @TIFFWarning(i8* %29, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.7, i64 0, i64 0), i8* %32, double %33) #4
  br label %.loopexit.us

.loopexit.us.loopexit:                            ; preds = %.lr.ph.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.thread.us, %21
  %.3.us = phi float [ %19, %21 ], [ 0.000000e+00, %.thread.us ], [ %24, %.loopexit.us.loopexit ]
  %.1.us = phi i32 [ 1, %21 ], [ 1, %.thread.us ], [ %25, %.loopexit.us.loopexit ]
  %34 = fpext float %.3.us to double
  %35 = fadd double %34, 5.000000e-01
  %36 = fptoui double %35 to i32
  %37 = trunc i64 %indvars.iv to i32
  %38 = shl i32 %37, 1
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32* %14, i64 %39
  store i32 %36, i32* %40, align 4
  %41 = or i32 %38, 1
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32* %14, i64 %42
  store i32 %.1.us, i32* %43, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph11.split.us

.lr.ph11.split:                                   ; preds = %.lr.ph11.split.preheader, %.loopexit
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %.loopexit ], [ 0, %.lr.ph11.split.preheader ]
  %44 = getelementptr inbounds float, float* %5, i64 %indvars.iv19
  %45 = load float, float* %44, align 4
  %46 = fcmp olt float %45, 0.000000e+00
  %47 = fsub float -0.000000e+00, %45
  %.14 = select i1 %46, float %47, float %45
  %48 = fcmp ogt float %.14, 0.000000e+00
  %49 = fcmp olt float %.14, 0x41B0000000000000
  %or.cond14 = and i1 %48, %49
  br i1 %or.cond14, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.lr.ph11.split
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.08 = phi i32 [ %51, %.lr.ph ], [ 1, %.lr.ph.preheader ]
  %.27 = phi float [ %50, %.lr.ph ], [ %.14, %.lr.ph.preheader ]
  %50 = fmul float %.27, 8.000000e+00
  %51 = shl i32 %.08, 3
  %52 = fcmp olt float %50, 0x41B0000000000000
  %53 = icmp ult i32 %51, 268435456
  %54 = and i1 %52, %53
  br i1 %54, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.lr.ph11.split
  %.3 = phi float [ %.14, %.lr.ph11.split ], [ %50, %.loopexit.loopexit ]
  %.1 = phi i32 [ 1, %.lr.ph11.split ], [ %51, %.loopexit.loopexit ]
  %55 = select i1 %46, double -1.000000e+00, double 1.000000e+00
  %56 = fpext float %.3 to double
  %57 = fadd double %56, 5.000000e-01
  %58 = fmul double %55, %57
  %59 = fptoui double %58 to i32
  %60 = trunc i64 %indvars.iv19 to i32
  %61 = shl i32 %60, 1
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32* %14, i64 %62
  store i32 %59, i32* %63, align 4
  %64 = or i32 %61, 1
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32* %14, i64 %65
  store i32 %.1, i32* %66, align 4
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count
  br i1 %exitcond22, label %._crit_edge.loopexit31, label %.lr.ph11.split

._crit_edge.loopexit:                             ; preds = %.loopexit.us
  br label %._crit_edge

._crit_edge.loopexit31:                           ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit31, %._crit_edge.loopexit, %6
  %67 = tail call fastcc i32 @TIFFWriteData(%struct.tiff* %0, %struct.TIFFDirEntry* %3, i8* %13)
  tail call void @_TIFFfree(i8* %13) #4
  ret i32 %67
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFWritePerSampleShorts(%struct.tiff*, i32, %struct.TIFFDirEntry* nocapture) unnamed_addr #0 {
  %4 = alloca [10 x i16], align 16
  %5 = alloca i16, align 2
  %6 = getelementptr inbounds [10 x i16], [10 x i16]* %4, i64 0, i64 0
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %8 = load i16, i16* %7, align 2
  %9 = zext i16 %8 to i32
  %10 = icmp ugt i16 %8, 10
  br i1 %10, label %.thread, label %15

.thread:                                          ; preds = %3
  %11 = shl nuw nsw i32 %9, 1
  %12 = tail call i8* @_TIFFmalloc(i32 %11) #4
  %13 = bitcast i8* %12 to i16*
  %14 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %0, i32 %1, i16* nonnull %5) #4
  br label %.lr.ph.preheader

; <label>:15:                                     ; preds = %3
  %16 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %0, i32 %1, i16* nonnull %5) #4
  %17 = icmp eq i16 %8, 0
  br i1 %17, label %._crit_edge.thread, label %.lr.ph.preheader

._crit_edge.thread:                               ; preds = %15
  %18 = call fastcc i32 @TIFFWriteShortArray(%struct.tiff* nonnull %0, i32 3, i32 %1, %struct.TIFFDirEntry* %2, i32 %9, i16* nonnull %6)
  br label %88

.lr.ph.preheader:                                 ; preds = %.thread, %15
  %.013 = phi i16* [ %13, %.thread ], [ %6, %15 ]
  %19 = add nsw i32 %9, -1
  %xtraiter = and i32 %9, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %20 = load i16, i16* %5, align 2
  %21 = getelementptr inbounds i16, i16* %.013, i64 %indvars.iv.prol
  store i16 %20, i16* %21, align 2
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next.prol, %.lr.ph.prol.loopexit.loopexit ]
  %22 = icmp ult i32 %19, 7
  br i1 %22, label %._crit_edge, label %.lr.ph.preheader6

.lr.ph.preheader6:                                ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count.7 = zext i16 %8 to i64
  %23 = add nsw i64 %wide.trip.count.7, -8
  %24 = sub i64 %23, %indvars.iv.unr
  %25 = lshr i64 %24, 3
  %26 = add nuw nsw i64 %25, 1
  %min.iters.check = icmp ult i64 %26, 8
  br i1 %min.iters.check, label %.lr.ph.preheader11, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.preheader6
  %n.mod.vf = and i64 %26, 7
  %n.vec = sub nsw i64 %26, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph.preheader11, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i16, i16* %.013, i64 %indvars.iv.unr
  %27 = add nsw i64 %wide.trip.count.7, -8
  %28 = sub i64 %27, %indvars.iv.unr
  %29 = and i64 %28, -8
  %30 = add i64 %indvars.iv.unr, %29
  %31 = add i64 %30, 8
  %scevgep8 = getelementptr i16, i16* %.013, i64 %31
  %bound0 = icmp ult i16* %scevgep, %5
  %bound1 = icmp ult i16* %5, %scevgep8
  %memcheck.conflict = and i1 %bound0, %bound1
  %32 = shl nuw i64 %25, 3
  %33 = add i64 %indvars.iv.unr, %32
  %34 = add i64 %33, 8
  %35 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %34, %35
  br i1 %memcheck.conflict, label %.lr.ph.preheader11, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %36 = load i16, i16* %5, align 2, !alias.scope !3
  %37 = insertelement <8 x i16> undef, i16 %36, i32 0
  %38 = shufflevector <8 x i16> %37, <8 x i16> undef, <8 x i32> zeroinitializer
  %39 = insertelement <8 x i16> undef, i16 %36, i32 0
  %40 = shufflevector <8 x i16> %39, <8 x i16> undef, <8 x i32> zeroinitializer
  %41 = insertelement <8 x i16> undef, i16 %36, i32 0
  %42 = shufflevector <8 x i16> %41, <8 x i16> undef, <8 x i32> zeroinitializer
  %43 = load i16, i16* %5, align 2, !alias.scope !3
  %44 = insertelement <8 x i16> undef, i16 %43, i32 0
  %45 = shufflevector <8 x i16> %44, <8 x i16> undef, <8 x i32> zeroinitializer
  %46 = insertelement <8 x i16> undef, i16 %43, i32 0
  %47 = shufflevector <8 x i16> %46, <8 x i16> undef, <8 x i32> zeroinitializer
  %48 = insertelement <8 x i16> undef, i16 %43, i32 0
  %49 = shufflevector <8 x i16> %48, <8 x i16> undef, <8 x i32> zeroinitializer
  %50 = load i16, i16* %5, align 2, !alias.scope !3
  %51 = insertelement <8 x i16> undef, i16 %50, i32 0
  %52 = shufflevector <8 x i16> %51, <8 x i16> undef, <8 x i32> zeroinitializer
  %53 = insertelement <8 x i16> undef, i16 %50, i32 0
  %54 = shufflevector <8 x i16> %53, <8 x i16> undef, <8 x i32> zeroinitializer
  %55 = shufflevector <8 x i16> %38, <8 x i16> %40, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %56 = shufflevector <8 x i16> %42, <8 x i16> %45, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %57 = shufflevector <8 x i16> %47, <8 x i16> %49, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %58 = shufflevector <8 x i16> %52, <8 x i16> %54, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %59 = shufflevector <16 x i16> %55, <16 x i16> %56, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %60 = shufflevector <16 x i16> %57, <16 x i16> %58, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %interleaved.vec = shufflevector <32 x i16> %59, <32 x i16> %60, <64 x i32> <i32 0, i32 8, i32 16, i32 24, i32 32, i32 40, i32 48, i32 56, i32 1, i32 9, i32 17, i32 25, i32 33, i32 41, i32 49, i32 57, i32 2, i32 10, i32 18, i32 26, i32 34, i32 42, i32 50, i32 58, i32 3, i32 11, i32 19, i32 27, i32 35, i32 43, i32 51, i32 59, i32 4, i32 12, i32 20, i32 28, i32 36, i32 44, i32 52, i32 60, i32 5, i32 13, i32 21, i32 29, i32 37, i32 45, i32 53, i32 61, i32 6, i32 14, i32 22, i32 30, i32 38, i32 46, i32 54, i32 62, i32 7, i32 15, i32 23, i32 31, i32 39, i32 47, i32 55, i32 63>
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %61 = shl i64 %index, 3
  %62 = add i64 %indvars.iv.unr, %61
  %63 = add nsw i64 %62, 7
  %64 = getelementptr inbounds i16, i16* %.013, i64 %63
  %65 = getelementptr i16, i16* %64, i64 -7
  %66 = bitcast i16* %65 to <64 x i16>*
  store <64 x i16> %interleaved.vec, <64 x i16>* %66, align 2, !alias.scope !6, !noalias !3
  %index.next = add i64 %index, 8
  %67 = icmp eq i64 %index.next, %n.vec
  br i1 %67, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph.preheader11

.lr.ph.preheader11:                               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph.preheader6
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %vector.memcheck ], [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %.lr.ph.preheader6 ], [ %ind.end, %middle.block ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader11, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph ], [ %indvars.iv.ph, %.lr.ph.preheader11 ]
  %68 = load i16, i16* %5, align 2
  %69 = getelementptr inbounds i16, i16* %.013, i64 %indvars.iv
  store i16 %68, i16* %69, align 2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %70 = load i16, i16* %5, align 2
  %71 = getelementptr inbounds i16, i16* %.013, i64 %indvars.iv.next
  store i16 %70, i16* %71, align 2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %72 = load i16, i16* %5, align 2
  %73 = getelementptr inbounds i16, i16* %.013, i64 %indvars.iv.next.1
  store i16 %72, i16* %73, align 2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %74 = load i16, i16* %5, align 2
  %75 = getelementptr inbounds i16, i16* %.013, i64 %indvars.iv.next.2
  store i16 %74, i16* %75, align 2
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %76 = load i16, i16* %5, align 2
  %77 = getelementptr inbounds i16, i16* %.013, i64 %indvars.iv.next.3
  store i16 %76, i16* %77, align 2
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %78 = load i16, i16* %5, align 2
  %79 = getelementptr inbounds i16, i16* %.013, i64 %indvars.iv.next.4
  store i16 %78, i16* %79, align 2
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %80 = load i16, i16* %5, align 2
  %81 = getelementptr inbounds i16, i16* %.013, i64 %indvars.iv.next.5
  store i16 %80, i16* %81, align 2
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %82 = load i16, i16* %5, align 2
  %83 = getelementptr inbounds i16, i16* %.013, i64 %indvars.iv.next.6
  store i16 %82, i16* %83, align 2
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, %wide.trip.count.7
  br i1 %exitcond.7, label %._crit_edge.loopexit, label %.lr.ph, !llvm.loop !11

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %.lr.ph.prol.loopexit
  %84 = call fastcc i32 @TIFFWriteShortArray(%struct.tiff* %0, i32 3, i32 %1, %struct.TIFFDirEntry* %2, i32 %9, i16* %.013)
  %85 = icmp eq i16* %.013, %6
  br i1 %85, label %88, label %86

; <label>:86:                                     ; preds = %._crit_edge
  %87 = bitcast i16* %.013 to i8*
  call void @_TIFFfree(i8* %87) #4
  br label %88

; <label>:88:                                     ; preds = %._crit_edge.thread, %._crit_edge, %86
  %89 = phi i32 [ %18, %._crit_edge.thread ], [ %84, %._crit_edge ], [ %84, %86 ]
  ret i32 %89
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFWritePerSampleAnys(%struct.tiff*, i32, i32, %struct.TIFFDirEntry*) unnamed_addr #0 {
  %5 = alloca [10 x double], align 16
  %6 = alloca double, align 8
  %7 = getelementptr inbounds [10 x double], [10 x double]* %5, i64 0, i64 0
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %9 = load i16, i16* %8, align 2
  %10 = zext i16 %9 to i32
  %11 = icmp ugt i16 %9, 10
  br i1 %11, label %.thread, label %16

.thread:                                          ; preds = %4
  %12 = shl nuw nsw i32 %10, 3
  %13 = tail call i8* @_TIFFmalloc(i32 %12) #4
  %14 = bitcast i8* %13 to double*
  %15 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %0, i32 %2, double* nonnull %6) #4
  br label %.lr.ph

; <label>:16:                                     ; preds = %4
  %17 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %0, i32 %2, double* nonnull %6) #4
  %18 = icmp eq i16 %9, 0
  br i1 %18, label %._crit_edge.thread, label %.lr.ph

._crit_edge.thread:                               ; preds = %16
  %19 = call fastcc i32 @TIFFWriteAnyArray(%struct.tiff* nonnull %0, i32 %1, i32 %2, %struct.TIFFDirEntry* %3, i32 %10, double* nonnull %7)
  br label %54

.lr.ph:                                           ; preds = %.thread, %16
  %.013 = phi double* [ %14, %.thread ], [ %7, %16 ]
  %20 = bitcast double* %6 to i64*
  %21 = add nsw i32 %10, -1
  %xtraiter = and i32 %10, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %22 = load i64, i64* %20, align 8
  %23 = getelementptr inbounds double, double* %.013, i64 %indvars.iv.prol
  %24 = bitcast double* %23 to i64*
  store i64 %22, i64* %24, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !12

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %25 = icmp ult i32 %21, 7
  br i1 %25, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %wide.trip.count.7 = zext i16 %9 to i64
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %26 = load i64, i64* %20, align 8
  %27 = getelementptr inbounds double, double* %.013, i64 %indvars.iv
  %28 = bitcast double* %27 to i64*
  store i64 %26, i64* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = load i64, i64* %20, align 8
  %30 = getelementptr inbounds double, double* %.013, i64 %indvars.iv.next
  %31 = bitcast double* %30 to i64*
  store i64 %29, i64* %31, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %32 = load i64, i64* %20, align 8
  %33 = getelementptr inbounds double, double* %.013, i64 %indvars.iv.next.1
  %34 = bitcast double* %33 to i64*
  store i64 %32, i64* %34, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %35 = load i64, i64* %20, align 8
  %36 = getelementptr inbounds double, double* %.013, i64 %indvars.iv.next.2
  %37 = bitcast double* %36 to i64*
  store i64 %35, i64* %37, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %38 = load i64, i64* %20, align 8
  %39 = getelementptr inbounds double, double* %.013, i64 %indvars.iv.next.3
  %40 = bitcast double* %39 to i64*
  store i64 %38, i64* %40, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %41 = load i64, i64* %20, align 8
  %42 = getelementptr inbounds double, double* %.013, i64 %indvars.iv.next.4
  %43 = bitcast double* %42 to i64*
  store i64 %41, i64* %43, align 8
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %44 = load i64, i64* %20, align 8
  %45 = getelementptr inbounds double, double* %.013, i64 %indvars.iv.next.5
  %46 = bitcast double* %45 to i64*
  store i64 %44, i64* %46, align 8
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %47 = load i64, i64* %20, align 8
  %48 = getelementptr inbounds double, double* %.013, i64 %indvars.iv.next.6
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, %wide.trip.count.7
  br i1 %exitcond.7, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %50 = call fastcc i32 @TIFFWriteAnyArray(%struct.tiff* %0, i32 %1, i32 %2, %struct.TIFFDirEntry* %3, i32 %10, double* %.013)
  %51 = icmp eq double* %.013, %7
  br i1 %51, label %54, label %52

; <label>:52:                                     ; preds = %._crit_edge
  %53 = bitcast double* %.013 to i8*
  call void @_TIFFfree(i8* %53) #4
  br label %54

; <label>:54:                                     ; preds = %._crit_edge.thread, %._crit_edge, %52
  %55 = phi i32 [ %19, %._crit_edge.thread ], [ %50, %._crit_edge ], [ %50, %52 ]
  ret i32 %55
}

declare i32 @_TIFFSampleToTagType(%struct.tiff*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFSetupShortPair(%struct.tiff*, i32, %struct.TIFFDirEntry* nocapture) unnamed_addr #0 {
  %4 = alloca [2 x i16], align 2
  %5 = getelementptr inbounds [2 x i16], [2 x i16]* %4, i64 0, i64 0
  %6 = getelementptr inbounds [2 x i16], [2 x i16]* %4, i64 0, i64 1
  %7 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %1, i16* nonnull %5, i16* %6) #4
  %8 = call fastcc i32 @TIFFWriteShortArray(%struct.tiff* %0, i32 3, i32 %1, %struct.TIFFDirEntry* %2, i32 2, i16* nonnull %5)
  ret i32 %8
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFWriteInkNames(%struct.tiff*, %struct.TIFFDirEntry*) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 0
  store i16 333, i16* %3, align 4
  %4 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 1
  store i16 2, i16* %4, align 2
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 58
  %6 = load i32, i32* %5, align 8
  %7 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  store i32 %6, i32* %7, align 4
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 59
  %9 = load i8*, i8** %8, align 8
  %10 = tail call fastcc i32 @TIFFWriteByteArray(%struct.tiff* %0, %struct.TIFFDirEntry* %1, i8* %9)
  ret i32 %10
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFWriteTransferFunction(%struct.tiff*, %struct.TIFFDirEntry* nocapture) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %4 = load i16, i16* %3, align 4
  %5 = zext i16 %4 to i64
  %6 = shl i64 2, %5
  %7 = trunc i64 %6 to i32
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 54, i64 0
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %10 = load i16, i16* %9, align 2
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 30
  %13 = load i16, i16* %12, align 4
  %14 = zext i16 %13 to i32
  %15 = sub nsw i32 %11, %14
  switch i32 %15, label %16 [
    i32 2, label %24
    i32 1, label %32
    i32 0, label %32
  ]

; <label>:16:                                     ; preds = %2
  %17 = bitcast i16** %8 to i8**
  %18 = load i8*, i8** %17, align 8
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 54, i64 2
  %20 = bitcast i16** %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = tail call i32 @_TIFFmemcmp(i8* %18, i8* %21, i32 %7) #4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %33

; <label>:24:                                     ; preds = %16, %2
  %25 = bitcast i16** %8 to i8**
  %26 = load i8*, i8** %25, align 8
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 54, i64 1
  %28 = bitcast i16** %27 to i8**
  %29 = load i8*, i8** %28, align 8
  %30 = tail call i32 @_TIFFmemcmp(i8* %26, i8* %29, i32 %7) #4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %33

; <label>:32:                                     ; preds = %24, %2, %2
  br label %33

; <label>:33:                                     ; preds = %24, %16, %32
  %.0 = phi i32 [ 1, %32 ], [ 3, %16 ], [ 3, %24 ]
  %34 = tail call fastcc i32 @TIFFWriteShortTable(%struct.tiff* nonnull %0, i32 301, %struct.TIFFDirEntry* %1, i32 %.0, i16** %8)
  ret i32 %34
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFWriteNormalTag(%struct.tiff*, %struct.TIFFDirEntry*, %struct.TIFFFieldInfo* readonly) unnamed_addr #0 {
  %4 = alloca i16, align 2
  %5 = alloca i32, align 4
  %6 = alloca i16*, align 8
  %7 = alloca i16, align 2
  %8 = alloca i32*, align 8
  %9 = alloca float*, align 8
  %10 = alloca float, align 4
  %11 = alloca float*, align 8
  %12 = alloca float, align 4
  %13 = alloca double*, align 8
  %14 = alloca double, align 8
  %15 = alloca i8*, align 8
  %16 = alloca i8*, align 8
  %17 = alloca i8, align 1
  %18 = alloca i8*, align 8
  %19 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %2, i64 0, i32 2
  %20 = load i16, i16* %19, align 2
  store i16 %20, i16* %4, align 2
  %21 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %2, i64 0, i32 0
  %22 = load i32, i32* %21, align 8
  %23 = trunc i32 %22 to i16
  %24 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 0
  store i16 %23, i16* %24, align 4
  %25 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %2, i64 0, i32 3
  %26 = load i32, i32* %25, align 8
  %27 = trunc i32 %26 to i16
  %28 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 1
  store i16 %27, i16* %28, align 2
  %29 = load i16, i16* %4, align 2
  %30 = zext i16 %29 to i32
  %31 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  store i32 %30, i32* %31, align 4
  %32 = load i32, i32* %25, align 8
  switch i32 %32, label %230 [
    i32 3, label %33
    i32 8, label %33
    i32 4, label %77
    i32 9, label %77
    i32 5, label %99
    i32 10, label %99
    i32 11, label %126
    i32 12, label %153
    i32 2, label %180
    i32 1, label %189
    i32 6, label %189
    i32 7, label %210
  ]

; <label>:33:                                     ; preds = %3, %3
  %34 = load i16, i16* %4, align 2
  %35 = icmp ugt i16 %34, 1
  br i1 %35, label %36, label %51

; <label>:36:                                     ; preds = %33
  %37 = icmp eq i16 %34, -1
  %38 = load i32, i32* %21, align 8
  br i1 %37, label %39, label %41

; <label>:39:                                     ; preds = %36
  %40 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %38, i16* nonnull %4, i16** nonnull %6) #4
  br label %43

; <label>:41:                                     ; preds = %36
  %42 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %38, i16** nonnull %6) #4
  br label %43

; <label>:43:                                     ; preds = %41, %39
  %44 = load i32, i32* %25, align 8
  %45 = load i32, i32* %21, align 8
  %46 = load i16, i16* %4, align 2
  %47 = zext i16 %46 to i32
  %48 = load i16*, i16** %6, align 8
  %49 = call fastcc i32 @TIFFWriteShortArray(%struct.tiff* %0, i32 %44, i32 %45, %struct.TIFFDirEntry* nonnull %1, i32 %47, i16* %48)
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %231, label %230

; <label>:51:                                     ; preds = %33
  %52 = load i32, i32* %21, align 8
  %53 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %52, i16* nonnull %7) #4
  %54 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 7, i32 0
  %55 = load i16, i16* %54, align 8
  %56 = icmp eq i16 %55, 19789
  %57 = load i16, i16* %7, align 2
  %58 = zext i16 %57 to i64
  %59 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 10
  %60 = load i64*, i64** %59, align 8
  %61 = load i16, i16* %28, align 2
  %62 = zext i16 %61 to i64
  %63 = getelementptr inbounds i64, i64* %60, i64 %62
  %64 = load i64, i64* %63, align 8
  %65 = and i64 %64, %58
  br i1 %56, label %66, label %73

; <label>:66:                                     ; preds = %51
  %67 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 9
  %68 = load i32*, i32** %67, align 8
  %69 = getelementptr inbounds i32, i32* %68, i64 %62
  %70 = load i32, i32* %69, align 4
  %71 = zext i32 %70 to i64
  %72 = shl i64 %65, %71
  br label %73

; <label>:73:                                     ; preds = %51, %66
  %74 = phi i64 [ %72, %66 ], [ %65, %51 ]
  %75 = trunc i64 %74 to i32
  %76 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  store i32 %75, i32* %76, align 4
  br label %230

; <label>:77:                                     ; preds = %3, %3
  %78 = load i16, i16* %4, align 2
  %79 = icmp ugt i16 %78, 1
  br i1 %79, label %80, label %95

; <label>:80:                                     ; preds = %77
  %81 = icmp eq i16 %78, -1
  %82 = load i32, i32* %21, align 8
  br i1 %81, label %83, label %85

; <label>:83:                                     ; preds = %80
  %84 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %82, i16* nonnull %4, i32** nonnull %8) #4
  br label %87

; <label>:85:                                     ; preds = %80
  %86 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %82, i32** nonnull %8) #4
  br label %87

; <label>:87:                                     ; preds = %85, %83
  %88 = load i32, i32* %25, align 8
  %89 = load i32, i32* %21, align 8
  %90 = load i16, i16* %4, align 2
  %91 = zext i16 %90 to i32
  %92 = load i32*, i32** %8, align 8
  %93 = call fastcc i32 @TIFFWriteLongArray(%struct.tiff* %0, i32 %88, i32 %89, %struct.TIFFDirEntry* nonnull %1, i32 %91, i32* %92)
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %231, label %230

; <label>:95:                                     ; preds = %77
  %96 = load i32, i32* %21, align 8
  %97 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %98 = tail call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %96, i32* %97) #4
  br label %230

; <label>:99:                                     ; preds = %3, %3
  %100 = load i16, i16* %4, align 2
  %101 = icmp ugt i16 %100, 1
  br i1 %101, label %102, label %117

; <label>:102:                                    ; preds = %99
  %103 = icmp eq i16 %100, -1
  %104 = load i32, i32* %21, align 8
  br i1 %103, label %105, label %107

; <label>:105:                                    ; preds = %102
  %106 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %104, i16* nonnull %4, float** nonnull %9) #4
  br label %109

; <label>:107:                                    ; preds = %102
  %108 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %104, float** nonnull %9) #4
  br label %109

; <label>:109:                                    ; preds = %107, %105
  %110 = load i32, i32* %25, align 8
  %111 = load i32, i32* %21, align 8
  %112 = load i16, i16* %4, align 2
  %113 = zext i16 %112 to i32
  %114 = load float*, float** %9, align 8
  %115 = call fastcc i32 @TIFFWriteRationalArray(%struct.tiff* %0, i32 %110, i32 %111, %struct.TIFFDirEntry* nonnull %1, i32 %113, float* %114)
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %231, label %230

; <label>:117:                                    ; preds = %99
  %118 = load i32, i32* %21, align 8
  %119 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %118, float* nonnull %10) #4
  %120 = load i32, i32* %25, align 8
  %121 = load i32, i32* %21, align 8
  %122 = load i16, i16* %4, align 2
  %123 = zext i16 %122 to i32
  %124 = call fastcc i32 @TIFFWriteRationalArray(%struct.tiff* %0, i32 %120, i32 %121, %struct.TIFFDirEntry* nonnull %1, i32 %123, float* nonnull %10)
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %231, label %230

; <label>:126:                                    ; preds = %3
  %127 = load i16, i16* %4, align 2
  %128 = icmp ugt i16 %127, 1
  br i1 %128, label %129, label %144

; <label>:129:                                    ; preds = %126
  %130 = icmp eq i16 %127, -1
  %131 = load i32, i32* %21, align 8
  br i1 %130, label %132, label %134

; <label>:132:                                    ; preds = %129
  %133 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %131, i16* nonnull %4, float** nonnull %11) #4
  br label %136

; <label>:134:                                    ; preds = %129
  %135 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %131, float** nonnull %11) #4
  br label %136

; <label>:136:                                    ; preds = %134, %132
  %137 = load i32, i32* %25, align 8
  %138 = load i32, i32* %21, align 8
  %139 = load i16, i16* %4, align 2
  %140 = zext i16 %139 to i32
  %141 = load float*, float** %11, align 8
  %142 = call fastcc i32 @TIFFWriteFloatArray(%struct.tiff* %0, i32 %137, i32 %138, %struct.TIFFDirEntry* nonnull %1, i32 %140, float* %141)
  %143 = icmp eq i32 %142, 0
  br i1 %143, label %231, label %230

; <label>:144:                                    ; preds = %126
  %145 = load i32, i32* %21, align 8
  %146 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %145, float* nonnull %12) #4
  %147 = load i32, i32* %25, align 8
  %148 = load i32, i32* %21, align 8
  %149 = load i16, i16* %4, align 2
  %150 = zext i16 %149 to i32
  %151 = call fastcc i32 @TIFFWriteFloatArray(%struct.tiff* %0, i32 %147, i32 %148, %struct.TIFFDirEntry* nonnull %1, i32 %150, float* nonnull %12)
  %152 = icmp eq i32 %151, 0
  br i1 %152, label %231, label %230

; <label>:153:                                    ; preds = %3
  %154 = load i16, i16* %4, align 2
  %155 = icmp ugt i16 %154, 1
  br i1 %155, label %156, label %171

; <label>:156:                                    ; preds = %153
  %157 = icmp eq i16 %154, -1
  %158 = load i32, i32* %21, align 8
  br i1 %157, label %159, label %161

; <label>:159:                                    ; preds = %156
  %160 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %158, i16* nonnull %4, double** nonnull %13) #4
  br label %163

; <label>:161:                                    ; preds = %156
  %162 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %158, double** nonnull %13) #4
  br label %163

; <label>:163:                                    ; preds = %161, %159
  %164 = load i32, i32* %25, align 8
  %165 = load i32, i32* %21, align 8
  %166 = load i16, i16* %4, align 2
  %167 = zext i16 %166 to i32
  %168 = load double*, double** %13, align 8
  %169 = call fastcc i32 @TIFFWriteDoubleArray(%struct.tiff* %0, i32 %164, i32 %165, %struct.TIFFDirEntry* nonnull %1, i32 %167, double* %168)
  %170 = icmp eq i32 %169, 0
  br i1 %170, label %231, label %230

; <label>:171:                                    ; preds = %153
  %172 = load i32, i32* %21, align 8
  %173 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %172, double* nonnull %14) #4
  %174 = load i32, i32* %25, align 8
  %175 = load i32, i32* %21, align 8
  %176 = load i16, i16* %4, align 2
  %177 = zext i16 %176 to i32
  %178 = call fastcc i32 @TIFFWriteDoubleArray(%struct.tiff* %0, i32 %174, i32 %175, %struct.TIFFDirEntry* nonnull %1, i32 %177, double* nonnull %14)
  %179 = icmp eq i32 %178, 0
  br i1 %179, label %231, label %230

; <label>:180:                                    ; preds = %3
  %181 = load i32, i32* %21, align 8
  %182 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %181, i8** nonnull %15) #4
  %183 = load i8*, i8** %15, align 8
  %184 = call i64 @strlen(i8* %183) #5
  %185 = add i64 %184, 1
  %186 = trunc i64 %185 to i32
  store i32 %186, i32* %31, align 4
  %187 = call fastcc i32 @TIFFWriteByteArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i8* %183)
  %188 = icmp eq i32 %187, 0
  br i1 %188, label %231, label %230

; <label>:189:                                    ; preds = %3, %3
  %190 = load i16, i16* %4, align 2
  %191 = icmp ugt i16 %190, 1
  br i1 %191, label %192, label %205

; <label>:192:                                    ; preds = %189
  %193 = icmp eq i16 %190, -1
  %194 = load i32, i32* %21, align 8
  br i1 %193, label %195, label %199

; <label>:195:                                    ; preds = %192
  %196 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %194, i16* nonnull %4, i8** nonnull %16) #4
  %197 = load i16, i16* %4, align 2
  %198 = zext i16 %197 to i32
  store i32 %198, i32* %31, align 4
  br label %201

; <label>:199:                                    ; preds = %192
  %200 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %194, i8** nonnull %16) #4
  br label %201

; <label>:201:                                    ; preds = %199, %195
  %202 = load i8*, i8** %16, align 8
  %203 = call fastcc i32 @TIFFWriteByteArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i8* %202)
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %231, label %230

; <label>:205:                                    ; preds = %189
  %206 = load i32, i32* %21, align 8
  %207 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %206, i8* nonnull %17) #4
  %208 = call fastcc i32 @TIFFWriteByteArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i8* nonnull %17)
  %209 = icmp eq i32 %208, 0
  br i1 %209, label %231, label %230

; <label>:210:                                    ; preds = %3
  %211 = load i16, i16* %4, align 2
  %212 = icmp eq i16 %211, -1
  br i1 %212, label %213, label %218

; <label>:213:                                    ; preds = %210
  %214 = load i32, i32* %21, align 8
  %215 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %214, i16* nonnull %4, i8** nonnull %18) #4
  %216 = load i16, i16* %4, align 2
  %217 = zext i16 %216 to i32
  store i32 %217, i32* %31, align 4
  br label %226

; <label>:218:                                    ; preds = %210
  %219 = icmp eq i16 %211, -3
  %220 = load i32, i32* %21, align 8
  br i1 %219, label %221, label %224

; <label>:221:                                    ; preds = %218
  %222 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %220, i32* nonnull %5, i8** nonnull %18) #4
  %223 = load i32, i32* %5, align 4
  store i32 %223, i32* %31, align 4
  br label %226

; <label>:224:                                    ; preds = %218
  %225 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %220, i8** nonnull %18) #4
  br label %226

; <label>:226:                                    ; preds = %221, %224, %213
  %227 = load i8*, i8** %18, align 8
  %228 = call fastcc i32 @TIFFWriteByteArray(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i8* %227)
  %229 = icmp eq i32 %228, 0
  br i1 %229, label %231, label %230

; <label>:230:                                    ; preds = %226, %201, %205, %180, %163, %171, %136, %144, %109, %117, %95, %87, %73, %43, %3
  br label %231

; <label>:231:                                    ; preds = %226, %205, %201, %180, %171, %163, %144, %136, %117, %109, %87, %43, %230
  %.0 = phi i32 [ 1, %230 ], [ 0, %43 ], [ 0, %87 ], [ 0, %109 ], [ 0, %117 ], [ 0, %136 ], [ 0, %144 ], [ 0, %163 ], [ 0, %171 ], [ 0, %180 ], [ 0, %201 ], [ 0, %205 ], [ 0, %226 ]
  ret i32 %.0
}

declare void @TIFFSwabArrayOfShort(i16*, i64) local_unnamed_addr #1

declare void @TIFFSwabArrayOfLong(i32*, i64) local_unnamed_addr #1

declare void @TIFFSwabShort(i16*) local_unnamed_addr #1

declare void @TIFFSwabLong(i32*) local_unnamed_addr #1

declare void @TIFFFreeDirectory(%struct.tiff*) local_unnamed_addr #1

declare i32 @TIFFDefaultDirectory(%struct.tiff*) local_unnamed_addr #1

declare i32 @TIFFGetField(%struct.tiff*, i32, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFWriteShortArray(%struct.tiff*, i32, i32, %struct.TIFFDirEntry* nocapture, i32, i16*) unnamed_addr #0 {
  %7 = trunc i32 %2 to i16
  %8 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 0
  store i16 %7, i16* %8, align 4
  %9 = trunc i32 %1 to i16
  %10 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 1
  store i16 %9, i16* %10, align 2
  %11 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 2
  store i32 %4, i32* %11, align 4
  %12 = icmp ult i32 %4, 3
  br i1 %12, label %13, label %37

; <label>:13:                                     ; preds = %6
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 7, i32 0
  %15 = load i16, i16* %14, align 8
  %16 = icmp eq i16 %15, 19789
  %17 = load i16, i16* %5, align 2
  %18 = zext i16 %17 to i32
  br i1 %16, label %19, label %28

; <label>:19:                                     ; preds = %13
  %20 = shl nuw i32 %18, 16
  %21 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 3
  store i32 %20, i32* %21, align 4
  %22 = icmp eq i32 %4, 2
  br i1 %22, label %23, label %40

; <label>:23:                                     ; preds = %19
  %24 = getelementptr inbounds i16, i16* %5, i64 1
  %25 = load i16, i16* %24, align 2
  %26 = zext i16 %25 to i32
  %27 = or i32 %26, %20
  store i32 %27, i32* %21, align 4
  br label %40

; <label>:28:                                     ; preds = %13
  %29 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 3
  store i32 %18, i32* %29, align 4
  %30 = icmp eq i32 %4, 2
  br i1 %30, label %31, label %40

; <label>:31:                                     ; preds = %28
  %32 = getelementptr inbounds i16, i16* %5, i64 1
  %33 = load i16, i16* %32, align 2
  %34 = zext i16 %33 to i32
  %35 = shl nuw i32 %34, 16
  %36 = or i32 %35, %18
  store i32 %36, i32* %29, align 4
  br label %40

; <label>:37:                                     ; preds = %6
  %38 = bitcast i16* %5 to i8*
  %39 = tail call fastcc i32 @TIFFWriteData(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %3, i8* %38)
  br label %40

; <label>:40:                                     ; preds = %23, %19, %31, %28, %37
  %.0 = phi i32 [ %39, %37 ], [ 1, %28 ], [ 1, %31 ], [ 1, %19 ], [ 1, %23 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFWriteFloatArray(%struct.tiff*, i32, i32, %struct.TIFFDirEntry* nocapture, i32, float*) unnamed_addr #0 {
  %7 = trunc i32 %2 to i16
  %8 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 0
  store i16 %7, i16* %8, align 4
  %9 = trunc i32 %1 to i16
  %10 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 1
  store i16 %9, i16* %10, align 2
  %11 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 2
  store i32 %4, i32* %11, align 4
  %12 = icmp eq i32 %4, 1
  br i1 %12, label %13, label %17

; <label>:13:                                     ; preds = %6
  %14 = bitcast float* %5 to i32*
  %15 = load i32, i32* %14, align 4
  %16 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 3
  store i32 %15, i32* %16, align 4
  br label %20

; <label>:17:                                     ; preds = %6
  %18 = bitcast float* %5 to i8*
  %19 = tail call fastcc i32 @TIFFWriteData(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %3, i8* %18)
  br label %20

; <label>:20:                                     ; preds = %17, %13
  %.0 = phi i32 [ 1, %13 ], [ %19, %17 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFWriteDoubleArray(%struct.tiff*, i32, i32, %struct.TIFFDirEntry* nocapture, i32, double*) unnamed_addr #0 {
  %7 = trunc i32 %2 to i16
  %8 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 0
  store i16 %7, i16* %8, align 4
  %9 = trunc i32 %1 to i16
  %10 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 1
  store i16 %9, i16* %10, align 2
  %11 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 2
  store i32 %4, i32* %11, align 4
  %12 = bitcast double* %5 to i8*
  %13 = tail call fastcc i32 @TIFFWriteData(%struct.tiff* %0, %struct.TIFFDirEntry* %3, i8* %12)
  ret i32 %13
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFWriteByteArray(%struct.tiff*, %struct.TIFFDirEntry*, i8*) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %5 = load i32, i32* %4, align 4
  %6 = icmp ugt i32 %5, 4
  br i1 %6, label %7, label %10

; <label>:7:                                      ; preds = %3
  %8 = tail call fastcc i32 @TIFFWriteData(%struct.tiff* %0, %struct.TIFFDirEntry* nonnull %1, i8* %2)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %14, label %13

; <label>:10:                                     ; preds = %3
  %11 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  %12 = bitcast i32* %11 to i8*
  tail call void @_TIFFmemcpy(i8* %12, i8* %2, i32 %5) #4
  br label %13

; <label>:13:                                     ; preds = %7, %10
  br label %14

; <label>:14:                                     ; preds = %7, %13
  %.0 = phi i32 [ 1, %13 ], [ 0, %7 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFWriteData(%struct.tiff*, %struct.TIFFDirEntry* nocapture, i8*) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %5 = load i32, i32* %4, align 8
  %6 = trunc i32 %5 to i8
  %7 = icmp slt i8 %6, 0
  br i1 %7, label %8, label %32

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 1
  %10 = load i16, i16* %9, align 2
  switch i16 %10, label %32 [
    i16 3, label %11
    i16 8, label %11
    i16 4, label %16
    i16 9, label %16
    i16 11, label %16
    i16 5, label %21
    i16 10, label %21
    i16 12, label %27
  ]

; <label>:11:                                     ; preds = %8, %8
  %12 = bitcast i8* %2 to i16*
  %13 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %14 = load i32, i32* %13, align 4
  %15 = zext i32 %14 to i64
  tail call void @TIFFSwabArrayOfShort(i16* %12, i64 %15) #4
  br label %32

; <label>:16:                                     ; preds = %8, %8, %8
  %17 = bitcast i8* %2 to i32*
  %18 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %19 = load i32, i32* %18, align 4
  %20 = zext i32 %19 to i64
  tail call void @TIFFSwabArrayOfLong(i32* %17, i64 %20) #4
  br label %32

; <label>:21:                                     ; preds = %8, %8
  %22 = bitcast i8* %2 to i32*
  %23 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %24 = load i32, i32* %23, align 4
  %25 = shl i32 %24, 1
  %26 = zext i32 %25 to i64
  tail call void @TIFFSwabArrayOfLong(i32* %22, i64 %26) #4
  br label %32

; <label>:27:                                     ; preds = %8
  %28 = bitcast i8* %2 to double*
  %29 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %30 = load i32, i32* %29, align 4
  %31 = zext i32 %30 to i64
  tail call void @TIFFSwabArrayOfDouble(double* %28, i64 %31) #4
  br label %32

; <label>:32:                                     ; preds = %8, %11, %16, %21, %27, %3
  %33 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 15
  %34 = load i32, i32* %33, align 8
  %35 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 3
  store i32 %34, i32* %35, align 4
  %36 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 2
  %37 = load i32, i32* %36, align 4
  %38 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 1
  %39 = load i16, i16* %38, align 2
  %40 = zext i16 %39 to i64
  %41 = getelementptr inbounds [0 x i32], [0 x i32]* @tiffDataWidth, i64 0, i64 %40
  %42 = load i32, i32* %41, align 4
  %43 = mul i32 %42, %37
  %44 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 51
  %45 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %44, align 8
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 48
  %47 = load i8*, i8** %46, align 8
  %48 = tail call i32 %45(i8* %47, i32 %34, i32 0) #4
  %49 = load i32, i32* %35, align 4
  %50 = icmp eq i32 %48, %49
  br i1 %50, label %51, label %62

; <label>:51:                                     ; preds = %32
  %52 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 50
  %53 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %52, align 8
  %54 = load i8*, i8** %46, align 8
  %55 = tail call i32 %53(i8* %54, i8* %2, i32 %43) #4
  %56 = icmp eq i32 %55, %43
  br i1 %56, label %57, label %62

; <label>:57:                                     ; preds = %51
  %58 = add nsw i32 %43, 1
  %59 = and i32 %58, -2
  %60 = load i32, i32* %33, align 8
  %61 = add nsw i32 %60, %59
  store i32 %61, i32* %33, align 8
  br label %71

; <label>:62:                                     ; preds = %51, %32
  %63 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %64 = load i8*, i8** %63, align 8
  %65 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %1, i64 0, i32 0
  %66 = load i16, i16* %65, align 4
  %67 = zext i16 %66 to i32
  %68 = tail call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* nonnull %0, i32 %67) #4
  %69 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %68, i64 0, i32 7
  %70 = load i8*, i8** %69, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %64, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.6, i64 0, i64 0), i8* %70) #4
  br label %71

; <label>:71:                                     ; preds = %62, %57
  %.0 = phi i32 [ 1, %57 ], [ 0, %62 ]
  ret i32 %.0
}

declare void @TIFFSwabArrayOfDouble(double*, i64) local_unnamed_addr #1

declare %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff*, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFWriteAnyArray(%struct.tiff*, i32, i32, %struct.TIFFDirEntry*, i32, double*) unnamed_addr #0 {
  %7 = alloca [80 x i8], align 16
  %8 = getelementptr inbounds [80 x i8], [80 x i8]* %7, i64 0, i64 0
  %9 = zext i32 %1 to i64
  %10 = getelementptr inbounds [0 x i32], [0 x i32]* @tiffDataWidth, i64 0, i64 %9
  %11 = load i32, i32* %10, align 4
  %12 = mul i32 %11, %4
  %13 = icmp ugt i32 %12, 80
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %6
  %15 = tail call i8* @_TIFFmalloc(i32 %12) #4
  br label %16

; <label>:16:                                     ; preds = %14, %6
  %.03 = phi i8* [ %15, %14 ], [ %8, %6 ]
  switch i32 %1, label %248 [
    i32 1, label %.preheader
    i32 6, label %.preheader4
    i32 3, label %77
    i32 8, label %104
    i32 4, label %131
    i32 9, label %158
    i32 11, label %185
    i32 12, label %245
  ]

.preheader4:                                      ; preds = %16
  %17 = icmp sgt i32 %4, 0
  br i1 %17, label %.lr.ph7.preheader, label %._crit_edge8

.lr.ph7.preheader:                                ; preds = %.preheader4
  %18 = add i32 %4, -1
  %xtraiter32 = and i32 %4, 3
  %lcmp.mod33 = icmp eq i32 %xtraiter32, 0
  br i1 %lcmp.mod33, label %.lr.ph7.prol.loopexit, label %.lr.ph7.prol.preheader

.lr.ph7.prol.preheader:                           ; preds = %.lr.ph7.preheader
  br label %.lr.ph7.prol

.lr.ph7.prol:                                     ; preds = %.lr.ph7.prol.preheader, %.lr.ph7.prol
  %indvars.iv29.prol = phi i64 [ %indvars.iv.next30.prol, %.lr.ph7.prol ], [ 0, %.lr.ph7.prol.preheader ]
  %prol.iter35 = phi i32 [ %prol.iter35.sub, %.lr.ph7.prol ], [ %xtraiter32, %.lr.ph7.prol.preheader ]
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv29.prol
  %20 = load double, double* %19, align 8
  %21 = fptosi double %20 to i8
  %22 = getelementptr inbounds i8, i8* %.03, i64 %indvars.iv29.prol
  store i8 %21, i8* %22, align 1
  %indvars.iv.next30.prol = add nuw nsw i64 %indvars.iv29.prol, 1
  %prol.iter35.sub = add i32 %prol.iter35, -1
  %prol.iter35.cmp = icmp eq i32 %prol.iter35.sub, 0
  br i1 %prol.iter35.cmp, label %.lr.ph7.prol.loopexit.loopexit, label %.lr.ph7.prol, !llvm.loop !13

.lr.ph7.prol.loopexit.loopexit:                   ; preds = %.lr.ph7.prol
  br label %.lr.ph7.prol.loopexit

.lr.ph7.prol.loopexit:                            ; preds = %.lr.ph7.prol.loopexit.loopexit, %.lr.ph7.preheader
  %indvars.iv29.unr = phi i64 [ 0, %.lr.ph7.preheader ], [ %indvars.iv.next30.prol, %.lr.ph7.prol.loopexit.loopexit ]
  %23 = icmp ult i32 %18, 3
  br i1 %23, label %._crit_edge8, label %.lr.ph7.preheader78

.lr.ph7.preheader78:                              ; preds = %.lr.ph7.prol.loopexit
  %wide.trip.count31.3 = zext i32 %4 to i64
  br label %.lr.ph7

.preheader:                                       ; preds = %16
  %24 = icmp sgt i32 %4, 0
  br i1 %24, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %25 = add i32 %4, -1
  %xtraiter = and i32 %4, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv.prol
  %27 = load double, double* %26, align 8
  %28 = fptoui double %27 to i8
  %29 = getelementptr inbounds i8, i8* %.03, i64 %indvars.iv.prol
  store i8 %28, i8* %29, align 1
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !14

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next.prol, %.lr.ph.prol.loopexit.loopexit ]
  %30 = icmp ult i32 %25, 3
  br i1 %30, label %._crit_edge, label %.lr.ph.preheader77

.lr.ph.preheader77:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count.3 = zext i32 %4 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader77, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph ], [ %indvars.iv.unr, %.lr.ph.preheader77 ]
  %31 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %32 = load double, double* %31, align 8
  %33 = fptoui double %32 to i8
  %34 = getelementptr inbounds i8, i8* %.03, i64 %indvars.iv
  store i8 %33, i8* %34, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next
  %36 = load double, double* %35, align 8
  %37 = fptoui double %36 to i8
  %38 = getelementptr inbounds i8, i8* %.03, i64 %indvars.iv.next
  store i8 %37, i8* %38, align 1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %39 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next.1
  %40 = load double, double* %39, align 8
  %41 = fptoui double %40 to i8
  %42 = getelementptr inbounds i8, i8* %.03, i64 %indvars.iv.next.1
  store i8 %41, i8* %42, align 1
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %43 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next.2
  %44 = load double, double* %43, align 8
  %45 = fptoui double %44 to i8
  %46 = getelementptr inbounds i8, i8* %.03, i64 %indvars.iv.next.2
  store i8 %45, i8* %46, align 1
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader
  %47 = trunc i32 %2 to i16
  %48 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 0
  store i16 %47, i16* %48, align 4
  %49 = trunc i32 %1 to i16
  %50 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 1
  store i16 %49, i16* %50, align 2
  %51 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 2
  store i32 %4, i32* %51, align 4
  %52 = call fastcc i32 @TIFFWriteByteArray(%struct.tiff* %0, %struct.TIFFDirEntry* %3, i8* %.03)
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %248, label %247

.lr.ph7:                                          ; preds = %.lr.ph7.preheader78, %.lr.ph7
  %indvars.iv29 = phi i64 [ %indvars.iv.next30.3, %.lr.ph7 ], [ %indvars.iv29.unr, %.lr.ph7.preheader78 ]
  %54 = getelementptr inbounds double, double* %5, i64 %indvars.iv29
  %55 = load double, double* %54, align 8
  %56 = fptosi double %55 to i8
  %57 = getelementptr inbounds i8, i8* %.03, i64 %indvars.iv29
  store i8 %56, i8* %57, align 1
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %58 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next30
  %59 = load double, double* %58, align 8
  %60 = fptosi double %59 to i8
  %61 = getelementptr inbounds i8, i8* %.03, i64 %indvars.iv.next30
  store i8 %60, i8* %61, align 1
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %62 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next30.1
  %63 = load double, double* %62, align 8
  %64 = fptosi double %63 to i8
  %65 = getelementptr inbounds i8, i8* %.03, i64 %indvars.iv.next30.1
  store i8 %64, i8* %65, align 1
  %indvars.iv.next30.2 = add nsw i64 %indvars.iv29, 3
  %66 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next30.2
  %67 = load double, double* %66, align 8
  %68 = fptosi double %67 to i8
  %69 = getelementptr inbounds i8, i8* %.03, i64 %indvars.iv.next30.2
  store i8 %68, i8* %69, align 1
  %indvars.iv.next30.3 = add nsw i64 %indvars.iv29, 4
  %exitcond.336 = icmp eq i64 %indvars.iv.next30.3, %wide.trip.count31.3
  br i1 %exitcond.336, label %._crit_edge8.loopexit, label %.lr.ph7

._crit_edge8.loopexit:                            ; preds = %.lr.ph7
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.lr.ph7.prol.loopexit, %.preheader4
  %70 = trunc i32 %2 to i16
  %71 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 0
  store i16 %70, i16* %71, align 4
  %72 = trunc i32 %1 to i16
  %73 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 1
  store i16 %72, i16* %73, align 2
  %74 = getelementptr inbounds %struct.TIFFDirEntry, %struct.TIFFDirEntry* %3, i64 0, i32 2
  store i32 %4, i32* %74, align 4
  %75 = call fastcc i32 @TIFFWriteByteArray(%struct.tiff* %0, %struct.TIFFDirEntry* %3, i8* %.03)
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %248, label %247

; <label>:77:                                     ; preds = %16
  %78 = bitcast i8* %.03 to i16*
  %79 = icmp sgt i32 %4, 0
  br i1 %79, label %.lr.ph11.preheader, label %._crit_edge12

.lr.ph11.preheader:                               ; preds = %77
  %80 = add i32 %4, -1
  %xtraiter40 = and i32 %4, 3
  %lcmp.mod41 = icmp eq i32 %xtraiter40, 0
  br i1 %lcmp.mod41, label %.lr.ph11.prol.loopexit, label %.lr.ph11.prol.preheader

.lr.ph11.prol.preheader:                          ; preds = %.lr.ph11.preheader
  br label %.lr.ph11.prol

.lr.ph11.prol:                                    ; preds = %.lr.ph11.prol.preheader, %.lr.ph11.prol
  %indvars.iv37.prol = phi i64 [ %indvars.iv.next38.prol, %.lr.ph11.prol ], [ 0, %.lr.ph11.prol.preheader ]
  %prol.iter43 = phi i32 [ %prol.iter43.sub, %.lr.ph11.prol ], [ %xtraiter40, %.lr.ph11.prol.preheader ]
  %81 = getelementptr inbounds double, double* %5, i64 %indvars.iv37.prol
  %82 = load double, double* %81, align 8
  %83 = fptoui double %82 to i16
  %84 = getelementptr inbounds i16, i16* %78, i64 %indvars.iv37.prol
  store i16 %83, i16* %84, align 2
  %indvars.iv.next38.prol = add nuw nsw i64 %indvars.iv37.prol, 1
  %prol.iter43.sub = add i32 %prol.iter43, -1
  %prol.iter43.cmp = icmp eq i32 %prol.iter43.sub, 0
  br i1 %prol.iter43.cmp, label %.lr.ph11.prol.loopexit.loopexit, label %.lr.ph11.prol, !llvm.loop !15

.lr.ph11.prol.loopexit.loopexit:                  ; preds = %.lr.ph11.prol
  br label %.lr.ph11.prol.loopexit

.lr.ph11.prol.loopexit:                           ; preds = %.lr.ph11.prol.loopexit.loopexit, %.lr.ph11.preheader
  %indvars.iv37.unr = phi i64 [ 0, %.lr.ph11.preheader ], [ %indvars.iv.next38.prol, %.lr.ph11.prol.loopexit.loopexit ]
  %85 = icmp ult i32 %80, 3
  br i1 %85, label %._crit_edge12, label %.lr.ph11.preheader79

.lr.ph11.preheader79:                             ; preds = %.lr.ph11.prol.loopexit
  %wide.trip.count39.3 = zext i32 %4 to i64
  br label %.lr.ph11

.lr.ph11:                                         ; preds = %.lr.ph11.preheader79, %.lr.ph11
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.3, %.lr.ph11 ], [ %indvars.iv37.unr, %.lr.ph11.preheader79 ]
  %86 = getelementptr inbounds double, double* %5, i64 %indvars.iv37
  %87 = load double, double* %86, align 8
  %88 = fptoui double %87 to i16
  %89 = getelementptr inbounds i16, i16* %78, i64 %indvars.iv37
  store i16 %88, i16* %89, align 2
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %90 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next38
  %91 = load double, double* %90, align 8
  %92 = fptoui double %91 to i16
  %93 = getelementptr inbounds i16, i16* %78, i64 %indvars.iv.next38
  store i16 %92, i16* %93, align 2
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %94 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next38.1
  %95 = load double, double* %94, align 8
  %96 = fptoui double %95 to i16
  %97 = getelementptr inbounds i16, i16* %78, i64 %indvars.iv.next38.1
  store i16 %96, i16* %97, align 2
  %indvars.iv.next38.2 = add nsw i64 %indvars.iv37, 3
  %98 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next38.2
  %99 = load double, double* %98, align 8
  %100 = fptoui double %99 to i16
  %101 = getelementptr inbounds i16, i16* %78, i64 %indvars.iv.next38.2
  store i16 %100, i16* %101, align 2
  %indvars.iv.next38.3 = add nsw i64 %indvars.iv37, 4
  %exitcond.344 = icmp eq i64 %indvars.iv.next38.3, %wide.trip.count39.3
  br i1 %exitcond.344, label %._crit_edge12.loopexit, label %.lr.ph11

._crit_edge12.loopexit:                           ; preds = %.lr.ph11
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %.lr.ph11.prol.loopexit, %77
  %102 = call fastcc i32 @TIFFWriteShortArray(%struct.tiff* %0, i32 %1, i32 %2, %struct.TIFFDirEntry* %3, i32 %4, i16* %78)
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %248, label %247

; <label>:104:                                    ; preds = %16
  %105 = bitcast i8* %.03 to i16*
  %106 = icmp sgt i32 %4, 0
  br i1 %106, label %.lr.ph15.preheader, label %._crit_edge16

.lr.ph15.preheader:                               ; preds = %104
  %107 = add i32 %4, -1
  %xtraiter48 = and i32 %4, 3
  %lcmp.mod49 = icmp eq i32 %xtraiter48, 0
  br i1 %lcmp.mod49, label %.lr.ph15.prol.loopexit, label %.lr.ph15.prol.preheader

.lr.ph15.prol.preheader:                          ; preds = %.lr.ph15.preheader
  br label %.lr.ph15.prol

.lr.ph15.prol:                                    ; preds = %.lr.ph15.prol.preheader, %.lr.ph15.prol
  %indvars.iv45.prol = phi i64 [ %indvars.iv.next46.prol, %.lr.ph15.prol ], [ 0, %.lr.ph15.prol.preheader ]
  %prol.iter51 = phi i32 [ %prol.iter51.sub, %.lr.ph15.prol ], [ %xtraiter48, %.lr.ph15.prol.preheader ]
  %108 = getelementptr inbounds double, double* %5, i64 %indvars.iv45.prol
  %109 = load double, double* %108, align 8
  %110 = fptosi double %109 to i16
  %111 = getelementptr inbounds i16, i16* %105, i64 %indvars.iv45.prol
  store i16 %110, i16* %111, align 2
  %indvars.iv.next46.prol = add nuw nsw i64 %indvars.iv45.prol, 1
  %prol.iter51.sub = add i32 %prol.iter51, -1
  %prol.iter51.cmp = icmp eq i32 %prol.iter51.sub, 0
  br i1 %prol.iter51.cmp, label %.lr.ph15.prol.loopexit.loopexit, label %.lr.ph15.prol, !llvm.loop !16

.lr.ph15.prol.loopexit.loopexit:                  ; preds = %.lr.ph15.prol
  br label %.lr.ph15.prol.loopexit

.lr.ph15.prol.loopexit:                           ; preds = %.lr.ph15.prol.loopexit.loopexit, %.lr.ph15.preheader
  %indvars.iv45.unr = phi i64 [ 0, %.lr.ph15.preheader ], [ %indvars.iv.next46.prol, %.lr.ph15.prol.loopexit.loopexit ]
  %112 = icmp ult i32 %107, 3
  br i1 %112, label %._crit_edge16, label %.lr.ph15.preheader80

.lr.ph15.preheader80:                             ; preds = %.lr.ph15.prol.loopexit
  %wide.trip.count47.3 = zext i32 %4 to i64
  br label %.lr.ph15

.lr.ph15:                                         ; preds = %.lr.ph15.preheader80, %.lr.ph15
  %indvars.iv45 = phi i64 [ %indvars.iv.next46.3, %.lr.ph15 ], [ %indvars.iv45.unr, %.lr.ph15.preheader80 ]
  %113 = getelementptr inbounds double, double* %5, i64 %indvars.iv45
  %114 = load double, double* %113, align 8
  %115 = fptosi double %114 to i16
  %116 = getelementptr inbounds i16, i16* %105, i64 %indvars.iv45
  store i16 %115, i16* %116, align 2
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %117 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next46
  %118 = load double, double* %117, align 8
  %119 = fptosi double %118 to i16
  %120 = getelementptr inbounds i16, i16* %105, i64 %indvars.iv.next46
  store i16 %119, i16* %120, align 2
  %indvars.iv.next46.1 = add nsw i64 %indvars.iv45, 2
  %121 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next46.1
  %122 = load double, double* %121, align 8
  %123 = fptosi double %122 to i16
  %124 = getelementptr inbounds i16, i16* %105, i64 %indvars.iv.next46.1
  store i16 %123, i16* %124, align 2
  %indvars.iv.next46.2 = add nsw i64 %indvars.iv45, 3
  %125 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next46.2
  %126 = load double, double* %125, align 8
  %127 = fptosi double %126 to i16
  %128 = getelementptr inbounds i16, i16* %105, i64 %indvars.iv.next46.2
  store i16 %127, i16* %128, align 2
  %indvars.iv.next46.3 = add nsw i64 %indvars.iv45, 4
  %exitcond.352 = icmp eq i64 %indvars.iv.next46.3, %wide.trip.count47.3
  br i1 %exitcond.352, label %._crit_edge16.loopexit, label %.lr.ph15

._crit_edge16.loopexit:                           ; preds = %.lr.ph15
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.lr.ph15.prol.loopexit, %104
  %129 = call fastcc i32 @TIFFWriteShortArray(%struct.tiff* %0, i32 %1, i32 %2, %struct.TIFFDirEntry* %3, i32 %4, i16* %105)
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %248, label %247

; <label>:131:                                    ; preds = %16
  %132 = bitcast i8* %.03 to i32*
  %133 = icmp sgt i32 %4, 0
  br i1 %133, label %.lr.ph19.preheader, label %._crit_edge20

.lr.ph19.preheader:                               ; preds = %131
  %134 = add i32 %4, -1
  %xtraiter56 = and i32 %4, 3
  %lcmp.mod57 = icmp eq i32 %xtraiter56, 0
  br i1 %lcmp.mod57, label %.lr.ph19.prol.loopexit, label %.lr.ph19.prol.preheader

.lr.ph19.prol.preheader:                          ; preds = %.lr.ph19.preheader
  br label %.lr.ph19.prol

.lr.ph19.prol:                                    ; preds = %.lr.ph19.prol.preheader, %.lr.ph19.prol
  %indvars.iv53.prol = phi i64 [ %indvars.iv.next54.prol, %.lr.ph19.prol ], [ 0, %.lr.ph19.prol.preheader ]
  %prol.iter59 = phi i32 [ %prol.iter59.sub, %.lr.ph19.prol ], [ %xtraiter56, %.lr.ph19.prol.preheader ]
  %135 = getelementptr inbounds double, double* %5, i64 %indvars.iv53.prol
  %136 = load double, double* %135, align 8
  %137 = fptoui double %136 to i32
  %138 = getelementptr inbounds i32, i32* %132, i64 %indvars.iv53.prol
  store i32 %137, i32* %138, align 4
  %indvars.iv.next54.prol = add nuw nsw i64 %indvars.iv53.prol, 1
  %prol.iter59.sub = add i32 %prol.iter59, -1
  %prol.iter59.cmp = icmp eq i32 %prol.iter59.sub, 0
  br i1 %prol.iter59.cmp, label %.lr.ph19.prol.loopexit.loopexit, label %.lr.ph19.prol, !llvm.loop !17

.lr.ph19.prol.loopexit.loopexit:                  ; preds = %.lr.ph19.prol
  br label %.lr.ph19.prol.loopexit

.lr.ph19.prol.loopexit:                           ; preds = %.lr.ph19.prol.loopexit.loopexit, %.lr.ph19.preheader
  %indvars.iv53.unr = phi i64 [ 0, %.lr.ph19.preheader ], [ %indvars.iv.next54.prol, %.lr.ph19.prol.loopexit.loopexit ]
  %139 = icmp ult i32 %134, 3
  br i1 %139, label %._crit_edge20, label %.lr.ph19.preheader81

.lr.ph19.preheader81:                             ; preds = %.lr.ph19.prol.loopexit
  %wide.trip.count55.3 = zext i32 %4 to i64
  br label %.lr.ph19

.lr.ph19:                                         ; preds = %.lr.ph19.preheader81, %.lr.ph19
  %indvars.iv53 = phi i64 [ %indvars.iv.next54.3, %.lr.ph19 ], [ %indvars.iv53.unr, %.lr.ph19.preheader81 ]
  %140 = getelementptr inbounds double, double* %5, i64 %indvars.iv53
  %141 = load double, double* %140, align 8
  %142 = fptoui double %141 to i32
  %143 = getelementptr inbounds i32, i32* %132, i64 %indvars.iv53
  store i32 %142, i32* %143, align 4
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %144 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next54
  %145 = load double, double* %144, align 8
  %146 = fptoui double %145 to i32
  %147 = getelementptr inbounds i32, i32* %132, i64 %indvars.iv.next54
  store i32 %146, i32* %147, align 4
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %148 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next54.1
  %149 = load double, double* %148, align 8
  %150 = fptoui double %149 to i32
  %151 = getelementptr inbounds i32, i32* %132, i64 %indvars.iv.next54.1
  store i32 %150, i32* %151, align 4
  %indvars.iv.next54.2 = add nsw i64 %indvars.iv53, 3
  %152 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next54.2
  %153 = load double, double* %152, align 8
  %154 = fptoui double %153 to i32
  %155 = getelementptr inbounds i32, i32* %132, i64 %indvars.iv.next54.2
  store i32 %154, i32* %155, align 4
  %indvars.iv.next54.3 = add nsw i64 %indvars.iv53, 4
  %exitcond.360 = icmp eq i64 %indvars.iv.next54.3, %wide.trip.count55.3
  br i1 %exitcond.360, label %._crit_edge20.loopexit, label %.lr.ph19

._crit_edge20.loopexit:                           ; preds = %.lr.ph19
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %.lr.ph19.prol.loopexit, %131
  %156 = call fastcc i32 @TIFFWriteLongArray(%struct.tiff* %0, i32 %1, i32 %2, %struct.TIFFDirEntry* %3, i32 %4, i32* %132)
  %157 = icmp eq i32 %156, 0
  br i1 %157, label %248, label %247

; <label>:158:                                    ; preds = %16
  %159 = bitcast i8* %.03 to i32*
  %160 = icmp sgt i32 %4, 0
  br i1 %160, label %.lr.ph23.preheader, label %._crit_edge24

.lr.ph23.preheader:                               ; preds = %158
  %161 = add i32 %4, -1
  %xtraiter64 = and i32 %4, 3
  %lcmp.mod65 = icmp eq i32 %xtraiter64, 0
  br i1 %lcmp.mod65, label %.lr.ph23.prol.loopexit, label %.lr.ph23.prol.preheader

.lr.ph23.prol.preheader:                          ; preds = %.lr.ph23.preheader
  br label %.lr.ph23.prol

.lr.ph23.prol:                                    ; preds = %.lr.ph23.prol.preheader, %.lr.ph23.prol
  %indvars.iv61.prol = phi i64 [ %indvars.iv.next62.prol, %.lr.ph23.prol ], [ 0, %.lr.ph23.prol.preheader ]
  %prol.iter67 = phi i32 [ %prol.iter67.sub, %.lr.ph23.prol ], [ %xtraiter64, %.lr.ph23.prol.preheader ]
  %162 = getelementptr inbounds double, double* %5, i64 %indvars.iv61.prol
  %163 = load double, double* %162, align 8
  %164 = fptosi double %163 to i32
  %165 = getelementptr inbounds i32, i32* %159, i64 %indvars.iv61.prol
  store i32 %164, i32* %165, align 4
  %indvars.iv.next62.prol = add nuw nsw i64 %indvars.iv61.prol, 1
  %prol.iter67.sub = add i32 %prol.iter67, -1
  %prol.iter67.cmp = icmp eq i32 %prol.iter67.sub, 0
  br i1 %prol.iter67.cmp, label %.lr.ph23.prol.loopexit.loopexit, label %.lr.ph23.prol, !llvm.loop !18

.lr.ph23.prol.loopexit.loopexit:                  ; preds = %.lr.ph23.prol
  br label %.lr.ph23.prol.loopexit

.lr.ph23.prol.loopexit:                           ; preds = %.lr.ph23.prol.loopexit.loopexit, %.lr.ph23.preheader
  %indvars.iv61.unr = phi i64 [ 0, %.lr.ph23.preheader ], [ %indvars.iv.next62.prol, %.lr.ph23.prol.loopexit.loopexit ]
  %166 = icmp ult i32 %161, 3
  br i1 %166, label %._crit_edge24, label %.lr.ph23.preheader82

.lr.ph23.preheader82:                             ; preds = %.lr.ph23.prol.loopexit
  %wide.trip.count63.3 = zext i32 %4 to i64
  br label %.lr.ph23

.lr.ph23:                                         ; preds = %.lr.ph23.preheader82, %.lr.ph23
  %indvars.iv61 = phi i64 [ %indvars.iv.next62.3, %.lr.ph23 ], [ %indvars.iv61.unr, %.lr.ph23.preheader82 ]
  %167 = getelementptr inbounds double, double* %5, i64 %indvars.iv61
  %168 = load double, double* %167, align 8
  %169 = fptosi double %168 to i32
  %170 = getelementptr inbounds i32, i32* %159, i64 %indvars.iv61
  store i32 %169, i32* %170, align 4
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %171 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next62
  %172 = load double, double* %171, align 8
  %173 = fptosi double %172 to i32
  %174 = getelementptr inbounds i32, i32* %159, i64 %indvars.iv.next62
  store i32 %173, i32* %174, align 4
  %indvars.iv.next62.1 = add nsw i64 %indvars.iv61, 2
  %175 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next62.1
  %176 = load double, double* %175, align 8
  %177 = fptosi double %176 to i32
  %178 = getelementptr inbounds i32, i32* %159, i64 %indvars.iv.next62.1
  store i32 %177, i32* %178, align 4
  %indvars.iv.next62.2 = add nsw i64 %indvars.iv61, 3
  %179 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next62.2
  %180 = load double, double* %179, align 8
  %181 = fptosi double %180 to i32
  %182 = getelementptr inbounds i32, i32* %159, i64 %indvars.iv.next62.2
  store i32 %181, i32* %182, align 4
  %indvars.iv.next62.3 = add nsw i64 %indvars.iv61, 4
  %exitcond.368 = icmp eq i64 %indvars.iv.next62.3, %wide.trip.count63.3
  br i1 %exitcond.368, label %._crit_edge24.loopexit, label %.lr.ph23

._crit_edge24.loopexit:                           ; preds = %.lr.ph23
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %.lr.ph23.prol.loopexit, %158
  %183 = call fastcc i32 @TIFFWriteLongArray(%struct.tiff* %0, i32 %1, i32 %2, %struct.TIFFDirEntry* %3, i32 %4, i32* %159)
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %248, label %247

; <label>:185:                                    ; preds = %16
  %186 = bitcast i8* %.03 to float*
  %187 = icmp sgt i32 %4, 0
  br i1 %187, label %.lr.ph27.preheader, label %._crit_edge28

.lr.ph27.preheader:                               ; preds = %185
  %188 = add i32 %4, -1
  %xtraiter72 = and i32 %4, 3
  %lcmp.mod73 = icmp eq i32 %xtraiter72, 0
  br i1 %lcmp.mod73, label %.lr.ph27.prol.loopexit, label %.lr.ph27.prol.preheader

.lr.ph27.prol.preheader:                          ; preds = %.lr.ph27.preheader
  br label %.lr.ph27.prol

.lr.ph27.prol:                                    ; preds = %.lr.ph27.prol.preheader, %.lr.ph27.prol
  %indvars.iv69.prol = phi i64 [ %indvars.iv.next70.prol, %.lr.ph27.prol ], [ 0, %.lr.ph27.prol.preheader ]
  %prol.iter75 = phi i32 [ %prol.iter75.sub, %.lr.ph27.prol ], [ %xtraiter72, %.lr.ph27.prol.preheader ]
  %189 = getelementptr inbounds double, double* %5, i64 %indvars.iv69.prol
  %190 = load double, double* %189, align 8
  %191 = fptrunc double %190 to float
  %192 = getelementptr inbounds float, float* %186, i64 %indvars.iv69.prol
  store float %191, float* %192, align 4
  %indvars.iv.next70.prol = add nuw nsw i64 %indvars.iv69.prol, 1
  %prol.iter75.sub = add i32 %prol.iter75, -1
  %prol.iter75.cmp = icmp eq i32 %prol.iter75.sub, 0
  br i1 %prol.iter75.cmp, label %.lr.ph27.prol.loopexit.loopexit, label %.lr.ph27.prol, !llvm.loop !19

.lr.ph27.prol.loopexit.loopexit:                  ; preds = %.lr.ph27.prol
  br label %.lr.ph27.prol.loopexit

.lr.ph27.prol.loopexit:                           ; preds = %.lr.ph27.prol.loopexit.loopexit, %.lr.ph27.preheader
  %indvars.iv69.unr = phi i64 [ 0, %.lr.ph27.preheader ], [ %indvars.iv.next70.prol, %.lr.ph27.prol.loopexit.loopexit ]
  %193 = icmp ult i32 %188, 3
  br i1 %193, label %._crit_edge28, label %.lr.ph27.preheader83

.lr.ph27.preheader83:                             ; preds = %.lr.ph27.prol.loopexit
  %wide.trip.count71.3 = zext i32 %4 to i64
  %194 = add nsw i64 %wide.trip.count71.3, -4
  %195 = sub i64 %194, %indvars.iv69.unr
  %196 = lshr i64 %195, 2
  %197 = add nuw nsw i64 %196, 1
  %min.iters.check = icmp ult i64 %197, 2
  br i1 %min.iters.check, label %.lr.ph27.preheader92, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph27.preheader83
  %n.mod.vf = and i64 %197, 1
  %n.vec = sub nsw i64 %197, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph27.preheader92, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %198 = shl i64 %indvars.iv69.unr, 2
  %scevgep = getelementptr i8, i8* %.03, i64 %198
  %199 = add nsw i64 %wide.trip.count71.3, -4
  %200 = sub i64 %199, %indvars.iv69.unr
  %201 = lshr i64 %200, 2
  %202 = shl i64 %201, 4
  %203 = add i64 %202, %198
  %204 = add i64 %203, 16
  %scevgep84 = getelementptr i8, i8* %.03, i64 %204
  %scevgep85 = getelementptr double, double* %5, i64 %indvars.iv69.unr
  %scevgep8586 = bitcast double* %scevgep85 to i8*
  %205 = shl nuw i64 %201, 2
  %206 = add i64 %indvars.iv69.unr, %205
  %207 = add i64 %206, 4
  %scevgep87 = getelementptr double, double* %5, i64 %207
  %scevgep8788 = bitcast double* %scevgep87 to i8*
  %bound0 = icmp ult i8* %scevgep, %scevgep8788
  %bound1 = icmp ult i8* %scevgep8586, %scevgep84
  %memcheck.conflict = and i1 %bound0, %bound1
  %208 = shl nuw i64 %196, 2
  %209 = add i64 %indvars.iv69.unr, %208
  %210 = add i64 %209, 4
  %211 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %210, %211
  br i1 %memcheck.conflict, label %.lr.ph27.preheader92, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %212 = shl i64 %index, 2
  %213 = add i64 %indvars.iv69.unr, %212
  %214 = getelementptr inbounds double, double* %5, i64 %213
  %215 = bitcast double* %214 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %215, align 8, !alias.scope !20
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec89 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec90 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec91 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %216 = fptrunc <2 x double> %strided.vec to <2 x float>
  %217 = fptrunc <2 x double> %strided.vec89 to <2 x float>
  %218 = fptrunc <2 x double> %strided.vec90 to <2 x float>
  %219 = add nsw i64 %213, 3
  %220 = fptrunc <2 x double> %strided.vec91 to <2 x float>
  %221 = getelementptr inbounds float, float* %186, i64 %219
  %222 = getelementptr float, float* %221, i64 -3
  %223 = bitcast float* %222 to <8 x float>*
  %224 = shufflevector <2 x float> %216, <2 x float> %217, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %225 = shufflevector <2 x float> %218, <2 x float> %220, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x float> %224, <4 x float> %225, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %223, align 4, !alias.scope !23, !noalias !20
  %index.next = add i64 %index, 2
  %226 = icmp eq i64 %index.next, %n.vec
  br i1 %226, label %middle.block, label %vector.body, !llvm.loop !25

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge28, label %.lr.ph27.preheader92

.lr.ph27.preheader92:                             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph27.preheader83
  %indvars.iv69.ph = phi i64 [ %indvars.iv69.unr, %vector.memcheck ], [ %indvars.iv69.unr, %min.iters.checked ], [ %indvars.iv69.unr, %.lr.ph27.preheader83 ], [ %ind.end, %middle.block ]
  br label %.lr.ph27

.lr.ph27:                                         ; preds = %.lr.ph27.preheader92, %.lr.ph27
  %indvars.iv69 = phi i64 [ %indvars.iv.next70.3, %.lr.ph27 ], [ %indvars.iv69.ph, %.lr.ph27.preheader92 ]
  %227 = getelementptr inbounds double, double* %5, i64 %indvars.iv69
  %228 = load double, double* %227, align 8
  %229 = fptrunc double %228 to float
  %230 = getelementptr inbounds float, float* %186, i64 %indvars.iv69
  store float %229, float* %230, align 4
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %231 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next70
  %232 = load double, double* %231, align 8
  %233 = fptrunc double %232 to float
  %234 = getelementptr inbounds float, float* %186, i64 %indvars.iv.next70
  store float %233, float* %234, align 4
  %indvars.iv.next70.1 = add nsw i64 %indvars.iv69, 2
  %235 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next70.1
  %236 = load double, double* %235, align 8
  %237 = fptrunc double %236 to float
  %238 = getelementptr inbounds float, float* %186, i64 %indvars.iv.next70.1
  store float %237, float* %238, align 4
  %indvars.iv.next70.2 = add nsw i64 %indvars.iv69, 3
  %239 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next70.2
  %240 = load double, double* %239, align 8
  %241 = fptrunc double %240 to float
  %242 = getelementptr inbounds float, float* %186, i64 %indvars.iv.next70.2
  store float %241, float* %242, align 4
  %indvars.iv.next70.3 = add nsw i64 %indvars.iv69, 4
  %exitcond.376 = icmp eq i64 %indvars.iv.next70.3, %wide.trip.count71.3
  br i1 %exitcond.376, label %._crit_edge28.loopexit, label %.lr.ph27, !llvm.loop !26

._crit_edge28.loopexit:                           ; preds = %.lr.ph27
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit, %middle.block, %.lr.ph27.prol.loopexit, %185
  %243 = call fastcc i32 @TIFFWriteFloatArray(%struct.tiff* %0, i32 %1, i32 %2, %struct.TIFFDirEntry* %3, i32 %4, float* %186)
  %244 = icmp eq i32 %243, 0
  br i1 %244, label %248, label %247

; <label>:245:                                    ; preds = %16
  %246 = tail call fastcc i32 @TIFFWriteDoubleArray(%struct.tiff* %0, i32 %1, i32 %2, %struct.TIFFDirEntry* %3, i32 %4, double* %5)
  br label %251

; <label>:247:                                    ; preds = %._crit_edge28, %._crit_edge24, %._crit_edge20, %._crit_edge16, %._crit_edge12, %._crit_edge8, %._crit_edge
  br label %248

; <label>:248:                                    ; preds = %16, %._crit_edge28, %._crit_edge24, %._crit_edge20, %._crit_edge16, %._crit_edge12, %._crit_edge8, %._crit_edge, %247
  %.01 = phi i32 [ 1, %247 ], [ 0, %._crit_edge ], [ 0, %._crit_edge8 ], [ 0, %._crit_edge12 ], [ 0, %._crit_edge16 ], [ 0, %._crit_edge20 ], [ 0, %._crit_edge24 ], [ 0, %._crit_edge28 ], [ 0, %16 ]
  %249 = icmp eq i8* %.03, %8
  br i1 %249, label %251, label %250

; <label>:250:                                    ; preds = %248
  call void @_TIFFfree(i8* %.03) #4
  br label %251

; <label>:251:                                    ; preds = %250, %248, %245
  %.0 = phi i32 [ %246, %245 ], [ %.01, %248 ], [ %.01, %250 ]
  ret i32 %.0
}

declare void @TIFFWarning(i8*, i8*, ...) local_unnamed_addr #1

declare i32 @_TIFFmemcmp(i8*, i8*, i32) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
!11 = distinct !{!11, !9, !10}
!12 = distinct !{!12, !2}
!13 = distinct !{!13, !2}
!14 = distinct !{!14, !2}
!15 = distinct !{!15, !2}
!16 = distinct !{!16, !2}
!17 = distinct !{!17, !2}
!18 = distinct !{!18, !2}
!19 = distinct !{!19, !2}
!20 = !{!21}
!21 = distinct !{!21, !22}
!22 = distinct !{!22, !"LVerDomain"}
!23 = !{!24}
!24 = distinct !{!24, !22}
!25 = distinct !{!25, !9, !10}
!26 = distinct !{!26, !9, !10}
