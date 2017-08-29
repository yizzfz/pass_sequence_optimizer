; ModuleID = 'tif_thunder.ll'
source_filename = "tif_thunder.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@twobitdeltas = internal unnamed_addr constant [4 x i32] [i32 0, i32 1, i32 0, i32 -1], align 16
@threebitdeltas = internal unnamed_addr constant [8 x i32] [i32 0, i32 1, i32 2, i32 3, i32 0, i32 -3, i32 -2, i32 -1], align 16
@.str = private unnamed_addr constant [52 x i8] c"ThunderDecode: %s data at scanline %ld (%lu != %lu)\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"Not enough\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"Too much\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @TIFFInitThunderScan(%struct.tiff* nocapture, i32) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @ThunderDecodeRow, i32 (%struct.tiff*, i8*, i32, i16)** %3, align 8
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @ThunderDecodeRow, i32 (%struct.tiff*, i8*, i32, i16)** %4, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @ThunderDecodeRow(%struct.tiff* nocapture, i8* nocapture, i32, i16 zeroext) #1 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %6 = icmp sgt i32 %2, 0
  br i1 %6, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %4
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 38
  br label %8

; <label>:8:                                      ; preds = %.lr.ph, %12
  %.014 = phi i8* [ %1, %.lr.ph ], [ %16, %12 ]
  %.023 = phi i32 [ %2, %.lr.ph ], [ %14, %12 ]
  %9 = load i32, i32* %5, align 8
  %10 = tail call fastcc i32 @ThunderDecode(%struct.tiff* %0, i8* %.014, i32 %9)
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %._crit_edge.loopexit, label %12

; <label>:12:                                     ; preds = %8
  %13 = load i32, i32* %7, align 8
  %14 = sub nsw i32 %.023, %13
  %15 = sext i32 %13 to i64
  %16 = getelementptr inbounds i8, i8* %.014, i64 %15
  %17 = icmp sgt i32 %14, 0
  br i1 %17, label %8, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %12, %8
  %.0.ph = phi i32 [ 1, %12 ], [ 0, %8 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  %.0 = phi i32 [ 1, %4 ], [ %.0.ph, %._crit_edge.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @ThunderDecode(%struct.tiff* nocapture, i8* nocapture, i32) unnamed_addr #1 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %5 = load i8*, i8** %4, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %7 = load i32, i32* %6, align 8
  %8 = icmp sgt i32 %7, 0
  %9 = icmp sgt i32 %2, 0
  %.41 = and i1 %9, %8
  br i1 %.41, label %.lr.ph48.preheader, label %._crit_edge49

.lr.ph48.preheader:                               ; preds = %3
  br label %.lr.ph48

.lr.ph48:                                         ; preds = %.lr.ph48.preheader, %.backedge
  %.0146 = phi i8* [ %.01.be, %.backedge ], [ %1, %.lr.ph48.preheader ]
  %.0745 = phi i8* [ %10, %.backedge ], [ %5, %.lr.ph48.preheader ]
  %.0844 = phi i32 [ %13, %.backedge ], [ %7, %.lr.ph48.preheader ]
  %.0943 = phi i32 [ %.09.be, %.backedge ], [ 0, %.lr.ph48.preheader ]
  %.01742 = phi i32 [ %.017.be, %.backedge ], [ 0, %.lr.ph48.preheader ]
  %10 = getelementptr inbounds i8, i8* %.0745, i64 1
  %11 = load i8, i8* %.0745, align 1
  %12 = zext i8 %11 to i32
  %13 = add nsw i32 %.0844, -1
  %14 = lshr i8 %11, 6
  %15 = xor i8 %14, 2
  %trunc = trunc i8 %15 to i2
  switch i2 %trunc, label %181 [
    i2 -2, label %16
    i2 -1, label %57
    i2 0, label %122
    i2 1, label %167
  ]

; <label>:16:                                     ; preds = %.lr.ph48
  %17 = and i32 %.01742, 1
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %28, label %19

; <label>:19:                                     ; preds = %16
  %20 = load i8, i8* %.0146, align 1
  %21 = zext i8 %20 to i32
  %22 = or i32 %21, %.0943
  %23 = trunc i32 %22 to i8
  store i8 %23, i8* %.0146, align 1
  %24 = getelementptr inbounds i8, i8* %.0146, i64 1
  %25 = and i32 %22, 255
  %26 = add nsw i32 %.01742, 1
  %27 = add nsw i32 %12, -1
  br label %31

; <label>:28:                                     ; preds = %16
  %29 = shl i32 %.0943, 4
  %30 = or i32 %29, %.0943
  br label %31

; <label>:31:                                     ; preds = %28, %19
  %.118 = phi i32 [ %26, %19 ], [ %.01742, %28 ]
  %.110 = phi i32 [ %25, %19 ], [ %30, %28 ]
  %.02 = phi i32 [ %27, %19 ], [ %12, %28 ]
  %.1 = phi i8* [ %24, %19 ], [ %.0146, %28 ]
  %32 = add nsw i32 %.02, %.118
  %33 = icmp sgt i32 %.02, 0
  br i1 %33, label %._crit_edge.loopexit, label %._crit_edge

._crit_edge.loopexit:                             ; preds = %31
  %34 = trunc i32 %.110 to i8
  %35 = add nsw i32 %.02, 2
  %36 = xor i32 %.02, -1
  %37 = icmp sgt i32 %36, -3
  %smax = select i1 %37, i32 %36, i32 -3
  %38 = add nsw i32 %35, %smax
  %39 = lshr i32 %38, 1
  %40 = add nsw i32 %.02, 2
  %41 = xor i32 %.02, -1
  %42 = icmp sgt i32 %41, -3
  %smax62 = select i1 %42, i32 %41, i32 -3
  %43 = add nsw i32 %40, %smax62
  %44 = lshr i32 %43, 1
  %addconv = add nuw i32 %44, 1
  %45 = zext i32 %addconv to i64
  call void @llvm.memset.p0i8.i64(i8* %.1, i8 %34, i64 %45, i32 1, i1 false)
  %46 = shl nuw i32 %39, 1
  %scevgep = getelementptr i8, i8* %.1, i64 1
  %47 = zext i32 %39 to i64
  %scevgep61 = getelementptr i8, i8* %scevgep, i64 %47
  %48 = add nsw i32 %.02, -2
  %49 = sub i32 %48, %46
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %31
  %.16.lcssa = phi i32 [ %.02, %31 ], [ %49, %._crit_edge.loopexit ]
  %.2.lcssa = phi i8* [ %.1, %31 ], [ %scevgep61, %._crit_edge.loopexit ]
  %50 = icmp eq i32 %.16.lcssa, -1
  br i1 %50, label %51, label %55

; <label>:51:                                     ; preds = %._crit_edge
  %52 = getelementptr inbounds i8, i8* %.2.lcssa, i64 -1
  %53 = load i8, i8* %52, align 1
  %54 = and i8 %53, -16
  store i8 %54, i8* %52, align 1
  br label %55

; <label>:55:                                     ; preds = %51, %._crit_edge
  %.3 = phi i8* [ %52, %51 ], [ %.2.lcssa, %._crit_edge ]
  %56 = and i32 %.110, 15
  br label %.backedge

; <label>:57:                                     ; preds = %.lr.ph48
  %58 = lshr i32 %12, 4
  %59 = and i32 %58, 3
  %60 = icmp eq i32 %59, 2
  br i1 %60, label %79, label %61

; <label>:61:                                     ; preds = %57
  %62 = zext i32 %59 to i64
  %63 = getelementptr inbounds [4 x i32], [4 x i32]* @twobitdeltas, i64 0, i64 %62
  %64 = load i32, i32* %63, align 4
  %65 = add i32 %64, %.0943
  %66 = and i32 %65, 15
  %67 = add nsw i32 %.01742, 1
  %68 = and i32 %.01742, 1
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %76, label %70

; <label>:70:                                     ; preds = %61
  %71 = getelementptr inbounds i8, i8* %.0146, i64 1
  %72 = load i8, i8* %.0146, align 1
  %73 = zext i8 %72 to i32
  %74 = or i32 %73, %66
  %75 = trunc i32 %74 to i8
  br label %78

; <label>:76:                                     ; preds = %61
  %.tr32 = trunc i32 %65 to i8
  %77 = shl i8 %.tr32, 4
  br label %78

; <label>:78:                                     ; preds = %76, %70
  %storemerge33 = phi i8 [ %77, %76 ], [ %75, %70 ]
  %.4 = phi i8* [ %.0146, %76 ], [ %71, %70 ]
  store i8 %storemerge33, i8* %.0146, align 1
  br label %79

; <label>:79:                                     ; preds = %57, %78
  %.219 = phi i32 [ %67, %78 ], [ %.01742, %57 ]
  %.211 = phi i32 [ %66, %78 ], [ %.0943, %57 ]
  %.5 = phi i8* [ %.4, %78 ], [ %.0146, %57 ]
  %80 = lshr i32 %12, 2
  %81 = and i32 %80, 3
  %82 = icmp eq i32 %81, 2
  br i1 %82, label %101, label %83

; <label>:83:                                     ; preds = %79
  %84 = zext i32 %81 to i64
  %85 = getelementptr inbounds [4 x i32], [4 x i32]* @twobitdeltas, i64 0, i64 %84
  %86 = load i32, i32* %85, align 4
  %87 = add i32 %86, %.211
  %88 = and i32 %87, 15
  %89 = add nsw i32 %.219, 1
  %90 = and i32 %.219, 1
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %98, label %92

; <label>:92:                                     ; preds = %83
  %93 = getelementptr inbounds i8, i8* %.5, i64 1
  %94 = load i8, i8* %.5, align 1
  %95 = zext i8 %94 to i32
  %96 = or i32 %95, %88
  %97 = trunc i32 %96 to i8
  br label %100

; <label>:98:                                     ; preds = %83
  %.tr30 = trunc i32 %87 to i8
  %99 = shl i8 %.tr30, 4
  br label %100

; <label>:100:                                    ; preds = %98, %92
  %storemerge31 = phi i8 [ %99, %98 ], [ %97, %92 ]
  %.6 = phi i8* [ %.5, %98 ], [ %93, %92 ]
  store i8 %storemerge31, i8* %.5, align 1
  br label %101

; <label>:101:                                    ; preds = %79, %100
  %.320 = phi i32 [ %89, %100 ], [ %.219, %79 ]
  %.312 = phi i32 [ %88, %100 ], [ %.211, %79 ]
  %.7 = phi i8* [ %.6, %100 ], [ %.5, %79 ]
  %102 = and i32 %12, 3
  %103 = icmp eq i32 %102, 2
  br i1 %103, label %.backedge, label %104

; <label>:104:                                    ; preds = %101
  %105 = zext i32 %102 to i64
  %106 = getelementptr inbounds [4 x i32], [4 x i32]* @twobitdeltas, i64 0, i64 %105
  %107 = load i32, i32* %106, align 4
  %108 = add i32 %107, %.312
  %109 = and i32 %108, 15
  %110 = add nsw i32 %.320, 1
  %111 = and i32 %.320, 1
  %112 = icmp eq i32 %111, 0
  br i1 %112, label %119, label %113

; <label>:113:                                    ; preds = %104
  %114 = getelementptr inbounds i8, i8* %.7, i64 1
  %115 = load i8, i8* %.7, align 1
  %116 = zext i8 %115 to i32
  %117 = or i32 %116, %109
  %118 = trunc i32 %117 to i8
  br label %121

; <label>:119:                                    ; preds = %104
  %.tr28 = trunc i32 %108 to i8
  %120 = shl i8 %.tr28, 4
  br label %121

; <label>:121:                                    ; preds = %119, %113
  %storemerge29 = phi i8 [ %120, %119 ], [ %118, %113 ]
  %.8 = phi i8* [ %.7, %119 ], [ %114, %113 ]
  store i8 %storemerge29, i8* %.7, align 1
  br label %.backedge

; <label>:122:                                    ; preds = %.lr.ph48
  %123 = lshr i32 %12, 3
  %124 = and i32 %123, 7
  %125 = icmp eq i32 %124, 4
  br i1 %125, label %144, label %126

; <label>:126:                                    ; preds = %122
  %127 = zext i32 %124 to i64
  %128 = getelementptr inbounds [8 x i32], [8 x i32]* @threebitdeltas, i64 0, i64 %127
  %129 = load i32, i32* %128, align 4
  %130 = add i32 %129, %.0943
  %131 = and i32 %130, 15
  %132 = add nsw i32 %.01742, 1
  %133 = and i32 %.01742, 1
  %134 = icmp eq i32 %133, 0
  br i1 %134, label %141, label %135

; <label>:135:                                    ; preds = %126
  %136 = getelementptr inbounds i8, i8* %.0146, i64 1
  %137 = load i8, i8* %.0146, align 1
  %138 = zext i8 %137 to i32
  %139 = or i32 %138, %131
  %140 = trunc i32 %139 to i8
  br label %143

; <label>:141:                                    ; preds = %126
  %.tr26 = trunc i32 %130 to i8
  %142 = shl i8 %.tr26, 4
  br label %143

; <label>:143:                                    ; preds = %141, %135
  %storemerge27 = phi i8 [ %142, %141 ], [ %140, %135 ]
  %.10 = phi i8* [ %.0146, %141 ], [ %136, %135 ]
  store i8 %storemerge27, i8* %.0146, align 1
  br label %144

; <label>:144:                                    ; preds = %122, %143
  %.522 = phi i32 [ %132, %143 ], [ %.01742, %122 ]
  %.514 = phi i32 [ %131, %143 ], [ %.0943, %122 ]
  %.11 = phi i8* [ %.10, %143 ], [ %.0146, %122 ]
  %145 = and i32 %12, 7
  %146 = icmp eq i32 %145, 4
  br i1 %146, label %.backedge, label %147

; <label>:147:                                    ; preds = %144
  %148 = zext i32 %145 to i64
  %149 = getelementptr inbounds [8 x i32], [8 x i32]* @threebitdeltas, i64 0, i64 %148
  %150 = load i32, i32* %149, align 4
  %151 = add i32 %150, %.514
  %152 = and i32 %151, 15
  %153 = add nsw i32 %.522, 1
  %154 = and i32 %.522, 1
  %155 = icmp eq i32 %154, 0
  br i1 %155, label %162, label %156

; <label>:156:                                    ; preds = %147
  %157 = getelementptr inbounds i8, i8* %.11, i64 1
  %158 = load i8, i8* %.11, align 1
  %159 = zext i8 %158 to i32
  %160 = or i32 %159, %152
  %161 = trunc i32 %160 to i8
  br label %164

; <label>:162:                                    ; preds = %147
  %.tr = trunc i32 %151 to i8
  %163 = shl i8 %.tr, 4
  br label %164

; <label>:164:                                    ; preds = %162, %156
  %storemerge25 = phi i8 [ %163, %162 ], [ %161, %156 ]
  %.12 = phi i8* [ %.11, %162 ], [ %157, %156 ]
  store i8 %storemerge25, i8* %.11, align 1
  br label %.backedge

.backedge:                                        ; preds = %164, %144, %121, %101, %180, %55
  %.017.be = phi i32 [ %169, %180 ], [ %32, %55 ], [ %110, %121 ], [ %.320, %101 ], [ %153, %164 ], [ %.522, %144 ]
  %.09.be = phi i32 [ %168, %180 ], [ %56, %55 ], [ %109, %121 ], [ %.312, %101 ], [ %152, %164 ], [ %.514, %144 ]
  %.01.be = phi i8* [ %.14, %180 ], [ %.3, %55 ], [ %.8, %121 ], [ %.7, %101 ], [ %.12, %164 ], [ %.11, %144 ]
  %165 = icmp sgt i32 %.0844, 1
  %166 = icmp slt i32 %.017.be, %2
  %. = and i1 %166, %165
  br i1 %., label %.lr.ph48, label %._crit_edge49.loopexit

; <label>:167:                                    ; preds = %.lr.ph48
  %168 = and i32 %12, 15
  %169 = add nsw i32 %.01742, 1
  %170 = and i32 %.01742, 1
  %171 = icmp eq i32 %170, 0
  br i1 %171, label %178, label %172

; <label>:172:                                    ; preds = %167
  %173 = getelementptr inbounds i8, i8* %.0146, i64 1
  %174 = load i8, i8* %.0146, align 1
  %175 = zext i8 %174 to i32
  %176 = or i32 %175, %168
  %177 = trunc i32 %176 to i8
  br label %180

; <label>:178:                                    ; preds = %167
  %179 = shl i8 %11, 4
  br label %180

; <label>:180:                                    ; preds = %178, %172
  %storemerge = phi i8 [ %179, %178 ], [ %177, %172 ]
  %.14 = phi i8* [ %.0146, %178 ], [ %173, %172 ]
  store i8 %storemerge, i8* %.0146, align 1
  br label %.backedge

; <label>:181:                                    ; preds = %.lr.ph48
  unreachable

._crit_edge49.loopexit:                           ; preds = %.backedge
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49.loopexit, %3
  %.017.lcssa = phi i32 [ 0, %3 ], [ %.017.be, %._crit_edge49.loopexit ]
  %.08.lcssa = phi i32 [ %7, %3 ], [ %13, %._crit_edge49.loopexit ]
  %.07.lcssa = phi i8* [ %5, %3 ], [ %10, %._crit_edge49.loopexit ]
  %.lcssa = phi i1 [ %9, %3 ], [ %166, %._crit_edge49.loopexit ]
  store i8* %.07.lcssa, i8** %4, align 8
  store i32 %.08.lcssa, i32* %6, align 8
  %182 = icmp eq i32 %.017.lcssa, %2
  br i1 %182, label %192, label %183

; <label>:183:                                    ; preds = %._crit_edge49
  %184 = sext i32 %2 to i64
  %185 = sext i32 %.017.lcssa to i64
  %186 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %187 = select i1 %.lcssa, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0)
  %188 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %189 = load i8*, i8** %188, align 8
  %190 = load i32, i32* %186, align 8
  %191 = zext i32 %190 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %189, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str, i64 0, i64 0), i8* %187, i64 %191, i64 %185, i64 %184) #4
  br label %192

; <label>:192:                                    ; preds = %._crit_edge49, %183
  %.0 = phi i32 [ 0, %183 ], [ 1, %._crit_edge49 ]
  ret i32 %.0
}

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
