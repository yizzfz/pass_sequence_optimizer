; ModuleID = 'decompress.1.ll'
source_filename = "decompress.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.DState = type { %struct.bz_stream*, i32, i8, i32, i8, i32, i32, i32, i32, i32, i8, i32, i32, i32, i32, i32, [256 x i32], i32, [257 x i32], [257 x i32], i32*, i16*, i8*, i32, i32, i32, i32, i32, [256 x i8], [16 x i8], [256 x i8], [4096 x i8], [16 x i32], [18002 x i8], [18002 x i8], [6 x [258 x i8]], [6 x [258 x i32]], [6 x [258 x i32]], [6 x [258 x i32]], [6 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, i32*, i32* }
%struct.bz_stream = type { i8*, i32, i32, i32, i8*, i32, i32, i32, i8*, i8* (i8*, i32, i32)*, void (i8*, i8*)*, i8* }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [20 x i8] c"\0A    [%d: huff+mtf \00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"rt+rld\00", align 1
@BZ2_rNums = external local_unnamed_addr global [512 x i32], align 16

; Function Attrs: noinline nounwind uwtable
define i32 @BZ2_decompress(%struct.DState*) local_unnamed_addr #0 {
  %2 = alloca [6 x i8], align 16
  %3 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 0
  %4 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %5 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 1
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %6, 10
  br i1 %7, label %8, label %11

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 40
  %10 = bitcast i32* %9 to i8*
  call void @llvm.memset.p0i8.i64(i8* %10, i8 0, i64 108, i32 4, i1 false)
  br label %11

; <label>:11:                                     ; preds = %8, %1
  %12 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 40
  %13 = load i32, i32* %12, align 4
  %14 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 41
  %15 = load i32, i32* %14, align 8
  %16 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 42
  %17 = load i32, i32* %16, align 4
  %18 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 43
  %19 = load i32, i32* %18, align 8
  %20 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 44
  %21 = load i32, i32* %20, align 4
  %22 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 45
  %23 = load i32, i32* %22, align 8
  %24 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 46
  %25 = load i32, i32* %24, align 4
  %26 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 47
  %27 = load i32, i32* %26, align 8
  %28 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 48
  %29 = load i32, i32* %28, align 4
  %30 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 49
  %31 = load i32, i32* %30, align 8
  %32 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 50
  %33 = load i32, i32* %32, align 4
  %34 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 51
  %35 = load i32, i32* %34, align 8
  %36 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 52
  %37 = load i32, i32* %36, align 4
  %38 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 53
  %39 = load i32, i32* %38, align 8
  %40 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 54
  %41 = load i32, i32* %40, align 4
  %42 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 55
  %43 = load i32, i32* %42, align 8
  %44 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 56
  %45 = load i32, i32* %44, align 4
  %46 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 57
  %47 = load i32, i32* %46, align 8
  %48 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 58
  %49 = load i32, i32* %48, align 4
  %50 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 59
  %51 = load i32, i32* %50, align 8
  %52 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 60
  %53 = load i32, i32* %52, align 4
  %54 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 61
  %55 = load i32*, i32** %54, align 8
  %56 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 62
  %57 = load i32*, i32** %56, align 8
  %58 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 63
  %59 = load i32*, i32** %58, align 8
  %60 = load i32, i32* %5, align 8
  switch i32 %60, label %3067 [
    i32 10, label %61
    i32 11, label %109
    i32 12, label %157
    i32 13, label %205
    i32 14, label %284
    i32 15, label %330
    i32 16, label %378
    i32 17, label %426
    i32 18, label %474
    i32 19, label %522
    i32 20, label %582
    i32 21, label %633
    i32 22, label %684
    i32 23, label %735
    i32 24, label %786
    i32 25, label %836
    i32 26, label %887
    i32 27, label %938
    i32 28, label %998
    i32 29, label %1056
    i32 30, label %1119
    i32 31, label %1166
    i32 32, label %1243
    i32 33, label %1365
    i32 34, label %1416
    i32 35, label %1464
    i32 36, label %1598
    i32 37, label %1656
    i32 38, label %1745
    i32 39, label %1803
    i32 40, label %2172
    i32 41, label %2230
    i32 42, label %2621
    i32 43, label %2669
    i32 44, label %2717
    i32 45, label %2765
    i32 46, label %2813
    i32 47, label %2863
    i32 48, label %2914
    i32 49, label %2965
    i32 50, label %3016
  ]

; <label>:61:                                     ; preds = %11
  store i32 10, i32* %5, align 8
  %62 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %63 = load i32, i32* %62, align 4
  %64 = icmp sgt i32 %63, 7
  br i1 %64, label %._crit_edge938, label %.lr.ph937

.lr.ph937:                                        ; preds = %61
  %65 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %72

._crit_edge938.loopexit:                          ; preds = %.backedge496
  br label %._crit_edge938

._crit_edge938:                                   ; preds = %._crit_edge938.loopexit, %61
  %.lcssa667 = phi i32 [ %63, %61 ], [ %107, %._crit_edge938.loopexit ]
  %66 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %67 = load i32, i32* %66, align 8
  %68 = add nsw i32 %.lcssa667, -8
  store i32 %68, i32* %62, align 4
  %69 = lshr i32 %67, %68
  %70 = and i32 %69, 255
  %71 = icmp eq i32 %70, 66
  br i1 %71, label %109, label %.loopexit

; <label>:72:                                     ; preds = %.backedge496, %.lr.ph937
  %73 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %74 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %73, i64 0, i32 1
  %75 = load i32, i32* %74, align 8
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %.loopexit.loopexit1369, label %77

; <label>:77:                                     ; preds = %72
  %78 = load i32, i32* %65, align 8
  %79 = shl i32 %78, 8
  %80 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %73, i64 0, i32 0
  %81 = load i8*, i8** %80, align 8
  %82 = load i8, i8* %81, align 1
  %83 = zext i8 %82 to i32
  %84 = or i32 %83, %79
  store i32 %84, i32* %65, align 8
  %85 = load i32, i32* %62, align 4
  %86 = add nsw i32 %85, 8
  store i32 %86, i32* %62, align 4
  %87 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %88 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %87, i64 0, i32 0
  %89 = load i8*, i8** %88, align 8
  %90 = getelementptr inbounds i8, i8* %89, i64 1
  store i8* %90, i8** %88, align 8
  %91 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %92 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %91, i64 0, i32 1
  %93 = load i32, i32* %92, align 8
  %94 = add i32 %93, -1
  store i32 %94, i32* %92, align 8
  %95 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %96 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %95, i64 0, i32 2
  %97 = load i32, i32* %96, align 4
  %98 = add i32 %97, 1
  store i32 %98, i32* %96, align 4
  %99 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %100 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %99, i64 0, i32 2
  %101 = load i32, i32* %100, align 4
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %103, label %.backedge496

; <label>:103:                                    ; preds = %77
  %104 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %99, i64 0, i32 3
  %105 = load i32, i32* %104, align 8
  %106 = add i32 %105, 1
  store i32 %106, i32* %104, align 8
  br label %.backedge496

.backedge496:                                     ; preds = %103, %77
  %107 = load i32, i32* %62, align 4
  %108 = icmp sgt i32 %107, 7
  br i1 %108, label %._crit_edge938.loopexit, label %72

; <label>:109:                                    ; preds = %._crit_edge938, %11
  store i32 11, i32* %5, align 8
  %110 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %111 = load i32, i32* %110, align 4
  %112 = icmp sgt i32 %111, 7
  br i1 %112, label %._crit_edge933, label %.lr.ph932

.lr.ph932:                                        ; preds = %109
  %113 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %120

._crit_edge933.loopexit:                          ; preds = %.backedge494
  br label %._crit_edge933

._crit_edge933:                                   ; preds = %._crit_edge933.loopexit, %109
  %.lcssa663 = phi i32 [ %111, %109 ], [ %155, %._crit_edge933.loopexit ]
  %114 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %115 = load i32, i32* %114, align 8
  %116 = add nsw i32 %.lcssa663, -8
  store i32 %116, i32* %110, align 4
  %117 = lshr i32 %115, %116
  %118 = and i32 %117, 255
  %119 = icmp eq i32 %118, 90
  br i1 %119, label %157, label %.loopexit

; <label>:120:                                    ; preds = %.backedge494, %.lr.ph932
  %121 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %122 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %121, i64 0, i32 1
  %123 = load i32, i32* %122, align 8
  %124 = icmp eq i32 %123, 0
  br i1 %124, label %.loopexit.loopexit1368, label %125

; <label>:125:                                    ; preds = %120
  %126 = load i32, i32* %113, align 8
  %127 = shl i32 %126, 8
  %128 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %121, i64 0, i32 0
  %129 = load i8*, i8** %128, align 8
  %130 = load i8, i8* %129, align 1
  %131 = zext i8 %130 to i32
  %132 = or i32 %131, %127
  store i32 %132, i32* %113, align 8
  %133 = load i32, i32* %110, align 4
  %134 = add nsw i32 %133, 8
  store i32 %134, i32* %110, align 4
  %135 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %136 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %135, i64 0, i32 0
  %137 = load i8*, i8** %136, align 8
  %138 = getelementptr inbounds i8, i8* %137, i64 1
  store i8* %138, i8** %136, align 8
  %139 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %140 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %139, i64 0, i32 1
  %141 = load i32, i32* %140, align 8
  %142 = add i32 %141, -1
  store i32 %142, i32* %140, align 8
  %143 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %144 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %143, i64 0, i32 2
  %145 = load i32, i32* %144, align 4
  %146 = add i32 %145, 1
  store i32 %146, i32* %144, align 4
  %147 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %148 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %147, i64 0, i32 2
  %149 = load i32, i32* %148, align 4
  %150 = icmp eq i32 %149, 0
  br i1 %150, label %151, label %.backedge494

; <label>:151:                                    ; preds = %125
  %152 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %147, i64 0, i32 3
  %153 = load i32, i32* %152, align 8
  %154 = add i32 %153, 1
  store i32 %154, i32* %152, align 8
  br label %.backedge494

.backedge494:                                     ; preds = %151, %125
  %155 = load i32, i32* %110, align 4
  %156 = icmp sgt i32 %155, 7
  br i1 %156, label %._crit_edge933.loopexit, label %120

; <label>:157:                                    ; preds = %._crit_edge933, %11
  store i32 12, i32* %5, align 8
  %158 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %159 = load i32, i32* %158, align 4
  %160 = icmp sgt i32 %159, 7
  br i1 %160, label %._crit_edge928, label %.lr.ph927

.lr.ph927:                                        ; preds = %157
  %161 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %168

._crit_edge928.loopexit:                          ; preds = %.backedge492
  br label %._crit_edge928

._crit_edge928:                                   ; preds = %._crit_edge928.loopexit, %157
  %.lcssa659 = phi i32 [ %159, %157 ], [ %203, %._crit_edge928.loopexit ]
  %162 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %163 = load i32, i32* %162, align 8
  %164 = add nsw i32 %.lcssa659, -8
  store i32 %164, i32* %158, align 4
  %165 = lshr i32 %163, %164
  %166 = and i32 %165, 255
  %167 = icmp eq i32 %166, 104
  br i1 %167, label %205, label %.loopexit

; <label>:168:                                    ; preds = %.backedge492, %.lr.ph927
  %169 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %170 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %169, i64 0, i32 1
  %171 = load i32, i32* %170, align 8
  %172 = icmp eq i32 %171, 0
  br i1 %172, label %.loopexit.loopexit1367, label %173

; <label>:173:                                    ; preds = %168
  %174 = load i32, i32* %161, align 8
  %175 = shl i32 %174, 8
  %176 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %169, i64 0, i32 0
  %177 = load i8*, i8** %176, align 8
  %178 = load i8, i8* %177, align 1
  %179 = zext i8 %178 to i32
  %180 = or i32 %179, %175
  store i32 %180, i32* %161, align 8
  %181 = load i32, i32* %158, align 4
  %182 = add nsw i32 %181, 8
  store i32 %182, i32* %158, align 4
  %183 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %184 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %183, i64 0, i32 0
  %185 = load i8*, i8** %184, align 8
  %186 = getelementptr inbounds i8, i8* %185, i64 1
  store i8* %186, i8** %184, align 8
  %187 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %188 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %187, i64 0, i32 1
  %189 = load i32, i32* %188, align 8
  %190 = add i32 %189, -1
  store i32 %190, i32* %188, align 8
  %191 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %192 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %191, i64 0, i32 2
  %193 = load i32, i32* %192, align 4
  %194 = add i32 %193, 1
  store i32 %194, i32* %192, align 4
  %195 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %196 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %195, i64 0, i32 2
  %197 = load i32, i32* %196, align 4
  %198 = icmp eq i32 %197, 0
  br i1 %198, label %199, label %.backedge492

; <label>:199:                                    ; preds = %173
  %200 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %195, i64 0, i32 3
  %201 = load i32, i32* %200, align 8
  %202 = add i32 %201, 1
  store i32 %202, i32* %200, align 8
  br label %.backedge492

.backedge492:                                     ; preds = %199, %173
  %203 = load i32, i32* %158, align 4
  %204 = icmp sgt i32 %203, 7
  br i1 %204, label %._crit_edge928.loopexit, label %168

; <label>:205:                                    ; preds = %._crit_edge928, %11
  store i32 13, i32* %5, align 8
  %206 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %207 = load i32, i32* %206, align 4
  %208 = icmp sgt i32 %207, 7
  br i1 %208, label %._crit_edge923, label %.lr.ph922

.lr.ph922:                                        ; preds = %205
  %209 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %217

._crit_edge923.loopexit:                          ; preds = %.backedge490
  br label %._crit_edge923

._crit_edge923:                                   ; preds = %._crit_edge923.loopexit, %205
  %.lcssa655 = phi i32 [ %207, %205 ], [ %252, %._crit_edge923.loopexit ]
  %210 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %211 = load i32, i32* %210, align 8
  %212 = add nsw i32 %.lcssa655, -8
  %213 = lshr i32 %211, %212
  %214 = and i32 %213, 255
  store i32 %212, i32* %206, align 4
  %215 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 9
  store i32 %214, i32* %215, align 8
  %.off = add nsw i32 %214, -49
  %216 = icmp ugt i32 %.off, 8
  br i1 %216, label %.loopexit, label %254

; <label>:217:                                    ; preds = %.backedge490, %.lr.ph922
  %218 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %219 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %218, i64 0, i32 1
  %220 = load i32, i32* %219, align 8
  %221 = icmp eq i32 %220, 0
  br i1 %221, label %.loopexit.loopexit1366, label %222

; <label>:222:                                    ; preds = %217
  %223 = load i32, i32* %209, align 8
  %224 = shl i32 %223, 8
  %225 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %218, i64 0, i32 0
  %226 = load i8*, i8** %225, align 8
  %227 = load i8, i8* %226, align 1
  %228 = zext i8 %227 to i32
  %229 = or i32 %228, %224
  store i32 %229, i32* %209, align 8
  %230 = load i32, i32* %206, align 4
  %231 = add nsw i32 %230, 8
  store i32 %231, i32* %206, align 4
  %232 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %233 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %232, i64 0, i32 0
  %234 = load i8*, i8** %233, align 8
  %235 = getelementptr inbounds i8, i8* %234, i64 1
  store i8* %235, i8** %233, align 8
  %236 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %237 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %236, i64 0, i32 1
  %238 = load i32, i32* %237, align 8
  %239 = add i32 %238, -1
  store i32 %239, i32* %237, align 8
  %240 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %241 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %240, i64 0, i32 2
  %242 = load i32, i32* %241, align 4
  %243 = add i32 %242, 1
  store i32 %243, i32* %241, align 4
  %244 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %245 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %244, i64 0, i32 2
  %246 = load i32, i32* %245, align 4
  %247 = icmp eq i32 %246, 0
  br i1 %247, label %248, label %.backedge490

; <label>:248:                                    ; preds = %222
  %249 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %244, i64 0, i32 3
  %250 = load i32, i32* %249, align 8
  %251 = add i32 %250, 1
  store i32 %251, i32* %249, align 8
  br label %.backedge490

.backedge490:                                     ; preds = %248, %222
  %252 = load i32, i32* %206, align 4
  %253 = icmp sgt i32 %252, 7
  br i1 %253, label %._crit_edge923.loopexit, label %217

; <label>:254:                                    ; preds = %._crit_edge923
  %255 = add nsw i32 %214, -48
  store i32 %255, i32* %215, align 8
  %256 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 10
  %257 = load i8, i8* %256, align 4
  %258 = icmp eq i8 %257, 0
  %259 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4, i64 0, i32 9
  %260 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %259, align 8
  %261 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4, i64 0, i32 11
  %262 = load i8*, i8** %261, align 8
  br i1 %258, label %278, label %263

; <label>:263:                                    ; preds = %254
  %264 = mul nsw i32 %255, 200000
  %265 = tail call i8* %260(i8* %262, i32 %264, i32 1) #4
  %266 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 21
  %267 = bitcast i16** %266 to i8**
  store i8* %265, i8** %267, align 8
  %268 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %259, align 8
  %269 = load i8*, i8** %261, align 8
  %270 = load i32, i32* %215, align 8
  %271 = mul nsw i32 %270, 100000
  %272 = ashr exact i32 %271, 1
  %273 = tail call i8* %268(i8* %269, i32 %272, i32 1) #4
  %274 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 22
  store i8* %273, i8** %274, align 8
  %275 = load i16*, i16** %266, align 8
  %276 = icmp eq i16* %275, null
  %277 = icmp eq i8* %273, null
  %or.cond388 = or i1 %277, %276
  br i1 %or.cond388, label %.loopexit, label %284

; <label>:278:                                    ; preds = %254
  %279 = mul nsw i32 %255, 400000
  %280 = tail call i8* %260(i8* %262, i32 %279, i32 1) #4
  %281 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 20
  %282 = bitcast i32** %281 to i8**
  store i8* %280, i8** %282, align 8
  %283 = icmp eq i8* %280, null
  br i1 %283, label %.loopexit, label %284

; <label>:284:                                    ; preds = %278, %263, %11
  store i32 14, i32* %5, align 8
  %285 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %286 = load i32, i32* %285, align 4
  %287 = icmp sgt i32 %286, 7
  br i1 %287, label %._crit_edge918, label %.lr.ph917

.lr.ph917:                                        ; preds = %284
  %288 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %293

._crit_edge918.loopexit:                          ; preds = %.backedge488
  br label %._crit_edge918

._crit_edge918:                                   ; preds = %._crit_edge918.loopexit, %284
  %.lcssa651 = phi i32 [ %286, %284 ], [ %328, %._crit_edge918.loopexit ]
  %289 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %290 = load i32, i32* %289, align 8
  %291 = add nsw i32 %.lcssa651, -8
  %292 = lshr i32 %290, %291
  store i32 %291, i32* %285, align 4
  %trunc392 = trunc i32 %292 to i8
  switch i8 %trunc392, label %.loopexit [
    i8 23, label %2621
    i8 49, label %330
  ]

; <label>:293:                                    ; preds = %.backedge488, %.lr.ph917
  %294 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %295 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %294, i64 0, i32 1
  %296 = load i32, i32* %295, align 8
  %297 = icmp eq i32 %296, 0
  br i1 %297, label %.loopexit.loopexit1365, label %298

; <label>:298:                                    ; preds = %293
  %299 = load i32, i32* %288, align 8
  %300 = shl i32 %299, 8
  %301 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %294, i64 0, i32 0
  %302 = load i8*, i8** %301, align 8
  %303 = load i8, i8* %302, align 1
  %304 = zext i8 %303 to i32
  %305 = or i32 %304, %300
  store i32 %305, i32* %288, align 8
  %306 = load i32, i32* %285, align 4
  %307 = add nsw i32 %306, 8
  store i32 %307, i32* %285, align 4
  %308 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %309 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %308, i64 0, i32 0
  %310 = load i8*, i8** %309, align 8
  %311 = getelementptr inbounds i8, i8* %310, i64 1
  store i8* %311, i8** %309, align 8
  %312 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %313 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %312, i64 0, i32 1
  %314 = load i32, i32* %313, align 8
  %315 = add i32 %314, -1
  store i32 %315, i32* %313, align 8
  %316 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %317 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %316, i64 0, i32 2
  %318 = load i32, i32* %317, align 4
  %319 = add i32 %318, 1
  store i32 %319, i32* %317, align 4
  %320 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %321 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %320, i64 0, i32 2
  %322 = load i32, i32* %321, align 4
  %323 = icmp eq i32 %322, 0
  br i1 %323, label %324, label %.backedge488

; <label>:324:                                    ; preds = %298
  %325 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %320, i64 0, i32 3
  %326 = load i32, i32* %325, align 8
  %327 = add i32 %326, 1
  store i32 %327, i32* %325, align 8
  br label %.backedge488

.backedge488:                                     ; preds = %324, %298
  %328 = load i32, i32* %285, align 4
  %329 = icmp sgt i32 %328, 7
  br i1 %329, label %._crit_edge918.loopexit, label %293

; <label>:330:                                    ; preds = %._crit_edge918, %11
  store i32 15, i32* %5, align 8
  %331 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %332 = load i32, i32* %331, align 4
  %333 = icmp sgt i32 %332, 7
  br i1 %333, label %._crit_edge913, label %.lr.ph912

.lr.ph912:                                        ; preds = %330
  %334 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %341

._crit_edge913.loopexit:                          ; preds = %.backedge486
  br label %._crit_edge913

._crit_edge913:                                   ; preds = %._crit_edge913.loopexit, %330
  %.lcssa647 = phi i32 [ %332, %330 ], [ %376, %._crit_edge913.loopexit ]
  %335 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %336 = load i32, i32* %335, align 8
  %337 = add nsw i32 %.lcssa647, -8
  store i32 %337, i32* %331, align 4
  %338 = lshr i32 %336, %337
  %339 = and i32 %338, 255
  %340 = icmp eq i32 %339, 65
  br i1 %340, label %378, label %.loopexit

; <label>:341:                                    ; preds = %.backedge486, %.lr.ph912
  %342 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %343 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %342, i64 0, i32 1
  %344 = load i32, i32* %343, align 8
  %345 = icmp eq i32 %344, 0
  br i1 %345, label %.loopexit.loopexit1364, label %346

; <label>:346:                                    ; preds = %341
  %347 = load i32, i32* %334, align 8
  %348 = shl i32 %347, 8
  %349 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %342, i64 0, i32 0
  %350 = load i8*, i8** %349, align 8
  %351 = load i8, i8* %350, align 1
  %352 = zext i8 %351 to i32
  %353 = or i32 %352, %348
  store i32 %353, i32* %334, align 8
  %354 = load i32, i32* %331, align 4
  %355 = add nsw i32 %354, 8
  store i32 %355, i32* %331, align 4
  %356 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %357 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %356, i64 0, i32 0
  %358 = load i8*, i8** %357, align 8
  %359 = getelementptr inbounds i8, i8* %358, i64 1
  store i8* %359, i8** %357, align 8
  %360 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %361 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %360, i64 0, i32 1
  %362 = load i32, i32* %361, align 8
  %363 = add i32 %362, -1
  store i32 %363, i32* %361, align 8
  %364 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %365 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %364, i64 0, i32 2
  %366 = load i32, i32* %365, align 4
  %367 = add i32 %366, 1
  store i32 %367, i32* %365, align 4
  %368 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %369 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %368, i64 0, i32 2
  %370 = load i32, i32* %369, align 4
  %371 = icmp eq i32 %370, 0
  br i1 %371, label %372, label %.backedge486

; <label>:372:                                    ; preds = %346
  %373 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %368, i64 0, i32 3
  %374 = load i32, i32* %373, align 8
  %375 = add i32 %374, 1
  store i32 %375, i32* %373, align 8
  br label %.backedge486

.backedge486:                                     ; preds = %372, %346
  %376 = load i32, i32* %331, align 4
  %377 = icmp sgt i32 %376, 7
  br i1 %377, label %._crit_edge913.loopexit, label %341

; <label>:378:                                    ; preds = %._crit_edge913, %11
  store i32 16, i32* %5, align 8
  %379 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %380 = load i32, i32* %379, align 4
  %381 = icmp sgt i32 %380, 7
  br i1 %381, label %._crit_edge908, label %.lr.ph907

.lr.ph907:                                        ; preds = %378
  %382 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %389

._crit_edge908.loopexit:                          ; preds = %.backedge484
  br label %._crit_edge908

._crit_edge908:                                   ; preds = %._crit_edge908.loopexit, %378
  %.lcssa643 = phi i32 [ %380, %378 ], [ %424, %._crit_edge908.loopexit ]
  %383 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %384 = load i32, i32* %383, align 8
  %385 = add nsw i32 %.lcssa643, -8
  store i32 %385, i32* %379, align 4
  %386 = lshr i32 %384, %385
  %387 = and i32 %386, 255
  %388 = icmp eq i32 %387, 89
  br i1 %388, label %426, label %.loopexit

; <label>:389:                                    ; preds = %.backedge484, %.lr.ph907
  %390 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %391 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %390, i64 0, i32 1
  %392 = load i32, i32* %391, align 8
  %393 = icmp eq i32 %392, 0
  br i1 %393, label %.loopexit.loopexit1363, label %394

; <label>:394:                                    ; preds = %389
  %395 = load i32, i32* %382, align 8
  %396 = shl i32 %395, 8
  %397 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %390, i64 0, i32 0
  %398 = load i8*, i8** %397, align 8
  %399 = load i8, i8* %398, align 1
  %400 = zext i8 %399 to i32
  %401 = or i32 %400, %396
  store i32 %401, i32* %382, align 8
  %402 = load i32, i32* %379, align 4
  %403 = add nsw i32 %402, 8
  store i32 %403, i32* %379, align 4
  %404 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %405 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %404, i64 0, i32 0
  %406 = load i8*, i8** %405, align 8
  %407 = getelementptr inbounds i8, i8* %406, i64 1
  store i8* %407, i8** %405, align 8
  %408 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %409 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %408, i64 0, i32 1
  %410 = load i32, i32* %409, align 8
  %411 = add i32 %410, -1
  store i32 %411, i32* %409, align 8
  %412 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %413 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %412, i64 0, i32 2
  %414 = load i32, i32* %413, align 4
  %415 = add i32 %414, 1
  store i32 %415, i32* %413, align 4
  %416 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %417 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %416, i64 0, i32 2
  %418 = load i32, i32* %417, align 4
  %419 = icmp eq i32 %418, 0
  br i1 %419, label %420, label %.backedge484

; <label>:420:                                    ; preds = %394
  %421 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %416, i64 0, i32 3
  %422 = load i32, i32* %421, align 8
  %423 = add i32 %422, 1
  store i32 %423, i32* %421, align 8
  br label %.backedge484

.backedge484:                                     ; preds = %420, %394
  %424 = load i32, i32* %379, align 4
  %425 = icmp sgt i32 %424, 7
  br i1 %425, label %._crit_edge908.loopexit, label %389

; <label>:426:                                    ; preds = %._crit_edge908, %11
  store i32 17, i32* %5, align 8
  %427 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %428 = load i32, i32* %427, align 4
  %429 = icmp sgt i32 %428, 7
  br i1 %429, label %._crit_edge903, label %.lr.ph902

.lr.ph902:                                        ; preds = %426
  %430 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %437

._crit_edge903.loopexit:                          ; preds = %.backedge482
  br label %._crit_edge903

._crit_edge903:                                   ; preds = %._crit_edge903.loopexit, %426
  %.lcssa639 = phi i32 [ %428, %426 ], [ %472, %._crit_edge903.loopexit ]
  %431 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %432 = load i32, i32* %431, align 8
  %433 = add nsw i32 %.lcssa639, -8
  store i32 %433, i32* %427, align 4
  %434 = lshr i32 %432, %433
  %435 = and i32 %434, 255
  %436 = icmp eq i32 %435, 38
  br i1 %436, label %474, label %.loopexit

; <label>:437:                                    ; preds = %.backedge482, %.lr.ph902
  %438 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %439 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %438, i64 0, i32 1
  %440 = load i32, i32* %439, align 8
  %441 = icmp eq i32 %440, 0
  br i1 %441, label %.loopexit.loopexit1362, label %442

; <label>:442:                                    ; preds = %437
  %443 = load i32, i32* %430, align 8
  %444 = shl i32 %443, 8
  %445 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %438, i64 0, i32 0
  %446 = load i8*, i8** %445, align 8
  %447 = load i8, i8* %446, align 1
  %448 = zext i8 %447 to i32
  %449 = or i32 %448, %444
  store i32 %449, i32* %430, align 8
  %450 = load i32, i32* %427, align 4
  %451 = add nsw i32 %450, 8
  store i32 %451, i32* %427, align 4
  %452 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %453 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %452, i64 0, i32 0
  %454 = load i8*, i8** %453, align 8
  %455 = getelementptr inbounds i8, i8* %454, i64 1
  store i8* %455, i8** %453, align 8
  %456 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %457 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %456, i64 0, i32 1
  %458 = load i32, i32* %457, align 8
  %459 = add i32 %458, -1
  store i32 %459, i32* %457, align 8
  %460 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %461 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %460, i64 0, i32 2
  %462 = load i32, i32* %461, align 4
  %463 = add i32 %462, 1
  store i32 %463, i32* %461, align 4
  %464 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %465 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %464, i64 0, i32 2
  %466 = load i32, i32* %465, align 4
  %467 = icmp eq i32 %466, 0
  br i1 %467, label %468, label %.backedge482

; <label>:468:                                    ; preds = %442
  %469 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %464, i64 0, i32 3
  %470 = load i32, i32* %469, align 8
  %471 = add i32 %470, 1
  store i32 %471, i32* %469, align 8
  br label %.backedge482

.backedge482:                                     ; preds = %468, %442
  %472 = load i32, i32* %427, align 4
  %473 = icmp sgt i32 %472, 7
  br i1 %473, label %._crit_edge903.loopexit, label %437

; <label>:474:                                    ; preds = %._crit_edge903, %11
  store i32 18, i32* %5, align 8
  %475 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %476 = load i32, i32* %475, align 4
  %477 = icmp sgt i32 %476, 7
  br i1 %477, label %._crit_edge898, label %.lr.ph897

.lr.ph897:                                        ; preds = %474
  %478 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %485

._crit_edge898.loopexit:                          ; preds = %.backedge480
  br label %._crit_edge898

._crit_edge898:                                   ; preds = %._crit_edge898.loopexit, %474
  %.lcssa635 = phi i32 [ %476, %474 ], [ %520, %._crit_edge898.loopexit ]
  %479 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %480 = load i32, i32* %479, align 8
  %481 = add nsw i32 %.lcssa635, -8
  store i32 %481, i32* %475, align 4
  %482 = lshr i32 %480, %481
  %483 = and i32 %482, 255
  %484 = icmp eq i32 %483, 83
  br i1 %484, label %522, label %.loopexit

; <label>:485:                                    ; preds = %.backedge480, %.lr.ph897
  %486 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %487 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %486, i64 0, i32 1
  %488 = load i32, i32* %487, align 8
  %489 = icmp eq i32 %488, 0
  br i1 %489, label %.loopexit.loopexit1361, label %490

; <label>:490:                                    ; preds = %485
  %491 = load i32, i32* %478, align 8
  %492 = shl i32 %491, 8
  %493 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %486, i64 0, i32 0
  %494 = load i8*, i8** %493, align 8
  %495 = load i8, i8* %494, align 1
  %496 = zext i8 %495 to i32
  %497 = or i32 %496, %492
  store i32 %497, i32* %478, align 8
  %498 = load i32, i32* %475, align 4
  %499 = add nsw i32 %498, 8
  store i32 %499, i32* %475, align 4
  %500 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %501 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %500, i64 0, i32 0
  %502 = load i8*, i8** %501, align 8
  %503 = getelementptr inbounds i8, i8* %502, i64 1
  store i8* %503, i8** %501, align 8
  %504 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %505 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %504, i64 0, i32 1
  %506 = load i32, i32* %505, align 8
  %507 = add i32 %506, -1
  store i32 %507, i32* %505, align 8
  %508 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %509 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %508, i64 0, i32 2
  %510 = load i32, i32* %509, align 4
  %511 = add i32 %510, 1
  store i32 %511, i32* %509, align 4
  %512 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %513 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %512, i64 0, i32 2
  %514 = load i32, i32* %513, align 4
  %515 = icmp eq i32 %514, 0
  br i1 %515, label %516, label %.backedge480

; <label>:516:                                    ; preds = %490
  %517 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %512, i64 0, i32 3
  %518 = load i32, i32* %517, align 8
  %519 = add i32 %518, 1
  store i32 %519, i32* %517, align 8
  br label %.backedge480

.backedge480:                                     ; preds = %516, %490
  %520 = load i32, i32* %475, align 4
  %521 = icmp sgt i32 %520, 7
  br i1 %521, label %._crit_edge898.loopexit, label %485

; <label>:522:                                    ; preds = %._crit_edge898, %11
  store i32 19, i32* %5, align 8
  %523 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %524 = load i32, i32* %523, align 4
  %525 = icmp sgt i32 %524, 7
  br i1 %525, label %._crit_edge893, label %.lr.ph892

.lr.ph892:                                        ; preds = %522
  %526 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %533

._crit_edge893.loopexit:                          ; preds = %.backedge478
  br label %._crit_edge893

._crit_edge893:                                   ; preds = %._crit_edge893.loopexit, %522
  %.lcssa631 = phi i32 [ %524, %522 ], [ %568, %._crit_edge893.loopexit ]
  %527 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %528 = load i32, i32* %527, align 8
  %529 = add nsw i32 %.lcssa631, -8
  store i32 %529, i32* %523, align 4
  %530 = lshr i32 %528, %529
  %531 = and i32 %530, 255
  %532 = icmp eq i32 %531, 89
  br i1 %532, label %570, label %.loopexit

; <label>:533:                                    ; preds = %.backedge478, %.lr.ph892
  %534 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %535 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %534, i64 0, i32 1
  %536 = load i32, i32* %535, align 8
  %537 = icmp eq i32 %536, 0
  br i1 %537, label %.loopexit.loopexit1360, label %538

; <label>:538:                                    ; preds = %533
  %539 = load i32, i32* %526, align 8
  %540 = shl i32 %539, 8
  %541 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %534, i64 0, i32 0
  %542 = load i8*, i8** %541, align 8
  %543 = load i8, i8* %542, align 1
  %544 = zext i8 %543 to i32
  %545 = or i32 %544, %540
  store i32 %545, i32* %526, align 8
  %546 = load i32, i32* %523, align 4
  %547 = add nsw i32 %546, 8
  store i32 %547, i32* %523, align 4
  %548 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %549 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %548, i64 0, i32 0
  %550 = load i8*, i8** %549, align 8
  %551 = getelementptr inbounds i8, i8* %550, i64 1
  store i8* %551, i8** %549, align 8
  %552 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %553 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %552, i64 0, i32 1
  %554 = load i32, i32* %553, align 8
  %555 = add i32 %554, -1
  store i32 %555, i32* %553, align 8
  %556 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %557 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %556, i64 0, i32 2
  %558 = load i32, i32* %557, align 4
  %559 = add i32 %558, 1
  store i32 %559, i32* %557, align 4
  %560 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %561 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %560, i64 0, i32 2
  %562 = load i32, i32* %561, align 4
  %563 = icmp eq i32 %562, 0
  br i1 %563, label %564, label %.backedge478

; <label>:564:                                    ; preds = %538
  %565 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %560, i64 0, i32 3
  %566 = load i32, i32* %565, align 8
  %567 = add i32 %566, 1
  store i32 %567, i32* %565, align 8
  br label %.backedge478

.backedge478:                                     ; preds = %564, %538
  %568 = load i32, i32* %523, align 4
  %569 = icmp sgt i32 %568, 7
  br i1 %569, label %._crit_edge893.loopexit, label %533

; <label>:570:                                    ; preds = %._crit_edge893
  %571 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 11
  %572 = load i32, i32* %571, align 8
  %573 = add nsw i32 %572, 1
  store i32 %573, i32* %571, align 8
  %574 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 12
  %575 = load i32, i32* %574, align 4
  %576 = icmp sgt i32 %575, 1
  br i1 %576, label %577, label %580

; <label>:577:                                    ; preds = %570
  %578 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %579 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %578, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), i32 %573) #6
  br label %580

; <label>:580:                                    ; preds = %577, %570
  %581 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 23
  store i32 0, i32* %581, align 8
  br label %582

; <label>:582:                                    ; preds = %580, %11
  store i32 20, i32* %5, align 8
  %583 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %584 = load i32, i32* %583, align 4
  %585 = icmp sgt i32 %584, 7
  br i1 %585, label %._crit_edge888, label %.lr.ph887

.lr.ph887:                                        ; preds = %582
  %586 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %596

._crit_edge888.loopexit:                          ; preds = %.backedge476
  br label %._crit_edge888

._crit_edge888:                                   ; preds = %._crit_edge888.loopexit, %582
  %.lcssa627 = phi i32 [ %584, %582 ], [ %631, %._crit_edge888.loopexit ]
  %587 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %588 = load i32, i32* %587, align 8
  %589 = add nsw i32 %.lcssa627, -8
  store i32 %589, i32* %583, align 4
  %590 = lshr i32 %588, %589
  %591 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 23
  %592 = load i32, i32* %591, align 8
  %593 = shl i32 %592, 8
  %594 = and i32 %590, 255
  %595 = or i32 %593, %594
  store i32 %595, i32* %591, align 8
  br label %633

; <label>:596:                                    ; preds = %.backedge476, %.lr.ph887
  %597 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %598 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %597, i64 0, i32 1
  %599 = load i32, i32* %598, align 8
  %600 = icmp eq i32 %599, 0
  br i1 %600, label %.loopexit.loopexit1359, label %601

; <label>:601:                                    ; preds = %596
  %602 = load i32, i32* %586, align 8
  %603 = shl i32 %602, 8
  %604 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %597, i64 0, i32 0
  %605 = load i8*, i8** %604, align 8
  %606 = load i8, i8* %605, align 1
  %607 = zext i8 %606 to i32
  %608 = or i32 %607, %603
  store i32 %608, i32* %586, align 8
  %609 = load i32, i32* %583, align 4
  %610 = add nsw i32 %609, 8
  store i32 %610, i32* %583, align 4
  %611 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %612 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %611, i64 0, i32 0
  %613 = load i8*, i8** %612, align 8
  %614 = getelementptr inbounds i8, i8* %613, i64 1
  store i8* %614, i8** %612, align 8
  %615 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %616 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %615, i64 0, i32 1
  %617 = load i32, i32* %616, align 8
  %618 = add i32 %617, -1
  store i32 %618, i32* %616, align 8
  %619 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %620 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %619, i64 0, i32 2
  %621 = load i32, i32* %620, align 4
  %622 = add i32 %621, 1
  store i32 %622, i32* %620, align 4
  %623 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %624 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %623, i64 0, i32 2
  %625 = load i32, i32* %624, align 4
  %626 = icmp eq i32 %625, 0
  br i1 %626, label %627, label %.backedge476

; <label>:627:                                    ; preds = %601
  %628 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %623, i64 0, i32 3
  %629 = load i32, i32* %628, align 8
  %630 = add i32 %629, 1
  store i32 %630, i32* %628, align 8
  br label %.backedge476

.backedge476:                                     ; preds = %627, %601
  %631 = load i32, i32* %583, align 4
  %632 = icmp sgt i32 %631, 7
  br i1 %632, label %._crit_edge888.loopexit, label %596

; <label>:633:                                    ; preds = %._crit_edge888, %11
  store i32 21, i32* %5, align 8
  %634 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %635 = load i32, i32* %634, align 4
  %636 = icmp sgt i32 %635, 7
  br i1 %636, label %._crit_edge883, label %.lr.ph882

.lr.ph882:                                        ; preds = %633
  %637 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %647

._crit_edge883.loopexit:                          ; preds = %.backedge474
  br label %._crit_edge883

._crit_edge883:                                   ; preds = %._crit_edge883.loopexit, %633
  %.lcssa623 = phi i32 [ %635, %633 ], [ %682, %._crit_edge883.loopexit ]
  %638 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %639 = load i32, i32* %638, align 8
  %640 = add nsw i32 %.lcssa623, -8
  store i32 %640, i32* %634, align 4
  %641 = lshr i32 %639, %640
  %642 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 23
  %643 = load i32, i32* %642, align 8
  %644 = shl i32 %643, 8
  %645 = and i32 %641, 255
  %646 = or i32 %644, %645
  store i32 %646, i32* %642, align 8
  br label %684

; <label>:647:                                    ; preds = %.backedge474, %.lr.ph882
  %648 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %649 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %648, i64 0, i32 1
  %650 = load i32, i32* %649, align 8
  %651 = icmp eq i32 %650, 0
  br i1 %651, label %.loopexit.loopexit1358, label %652

; <label>:652:                                    ; preds = %647
  %653 = load i32, i32* %637, align 8
  %654 = shl i32 %653, 8
  %655 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %648, i64 0, i32 0
  %656 = load i8*, i8** %655, align 8
  %657 = load i8, i8* %656, align 1
  %658 = zext i8 %657 to i32
  %659 = or i32 %658, %654
  store i32 %659, i32* %637, align 8
  %660 = load i32, i32* %634, align 4
  %661 = add nsw i32 %660, 8
  store i32 %661, i32* %634, align 4
  %662 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %663 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %662, i64 0, i32 0
  %664 = load i8*, i8** %663, align 8
  %665 = getelementptr inbounds i8, i8* %664, i64 1
  store i8* %665, i8** %663, align 8
  %666 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %667 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %666, i64 0, i32 1
  %668 = load i32, i32* %667, align 8
  %669 = add i32 %668, -1
  store i32 %669, i32* %667, align 8
  %670 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %671 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %670, i64 0, i32 2
  %672 = load i32, i32* %671, align 4
  %673 = add i32 %672, 1
  store i32 %673, i32* %671, align 4
  %674 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %675 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %674, i64 0, i32 2
  %676 = load i32, i32* %675, align 4
  %677 = icmp eq i32 %676, 0
  br i1 %677, label %678, label %.backedge474

; <label>:678:                                    ; preds = %652
  %679 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %674, i64 0, i32 3
  %680 = load i32, i32* %679, align 8
  %681 = add i32 %680, 1
  store i32 %681, i32* %679, align 8
  br label %.backedge474

.backedge474:                                     ; preds = %678, %652
  %682 = load i32, i32* %634, align 4
  %683 = icmp sgt i32 %682, 7
  br i1 %683, label %._crit_edge883.loopexit, label %647

; <label>:684:                                    ; preds = %._crit_edge883, %11
  store i32 22, i32* %5, align 8
  %685 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %686 = load i32, i32* %685, align 4
  %687 = icmp sgt i32 %686, 7
  br i1 %687, label %._crit_edge878, label %.lr.ph877

.lr.ph877:                                        ; preds = %684
  %688 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %698

._crit_edge878.loopexit:                          ; preds = %.backedge472
  br label %._crit_edge878

._crit_edge878:                                   ; preds = %._crit_edge878.loopexit, %684
  %.lcssa619 = phi i32 [ %686, %684 ], [ %733, %._crit_edge878.loopexit ]
  %689 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %690 = load i32, i32* %689, align 8
  %691 = add nsw i32 %.lcssa619, -8
  store i32 %691, i32* %685, align 4
  %692 = lshr i32 %690, %691
  %693 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 23
  %694 = load i32, i32* %693, align 8
  %695 = shl i32 %694, 8
  %696 = and i32 %692, 255
  %697 = or i32 %695, %696
  store i32 %697, i32* %693, align 8
  br label %735

; <label>:698:                                    ; preds = %.backedge472, %.lr.ph877
  %699 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %700 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %699, i64 0, i32 1
  %701 = load i32, i32* %700, align 8
  %702 = icmp eq i32 %701, 0
  br i1 %702, label %.loopexit.loopexit1357, label %703

; <label>:703:                                    ; preds = %698
  %704 = load i32, i32* %688, align 8
  %705 = shl i32 %704, 8
  %706 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %699, i64 0, i32 0
  %707 = load i8*, i8** %706, align 8
  %708 = load i8, i8* %707, align 1
  %709 = zext i8 %708 to i32
  %710 = or i32 %709, %705
  store i32 %710, i32* %688, align 8
  %711 = load i32, i32* %685, align 4
  %712 = add nsw i32 %711, 8
  store i32 %712, i32* %685, align 4
  %713 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %714 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %713, i64 0, i32 0
  %715 = load i8*, i8** %714, align 8
  %716 = getelementptr inbounds i8, i8* %715, i64 1
  store i8* %716, i8** %714, align 8
  %717 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %718 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %717, i64 0, i32 1
  %719 = load i32, i32* %718, align 8
  %720 = add i32 %719, -1
  store i32 %720, i32* %718, align 8
  %721 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %722 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %721, i64 0, i32 2
  %723 = load i32, i32* %722, align 4
  %724 = add i32 %723, 1
  store i32 %724, i32* %722, align 4
  %725 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %726 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %725, i64 0, i32 2
  %727 = load i32, i32* %726, align 4
  %728 = icmp eq i32 %727, 0
  br i1 %728, label %729, label %.backedge472

; <label>:729:                                    ; preds = %703
  %730 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %725, i64 0, i32 3
  %731 = load i32, i32* %730, align 8
  %732 = add i32 %731, 1
  store i32 %732, i32* %730, align 8
  br label %.backedge472

.backedge472:                                     ; preds = %729, %703
  %733 = load i32, i32* %685, align 4
  %734 = icmp sgt i32 %733, 7
  br i1 %734, label %._crit_edge878.loopexit, label %698

; <label>:735:                                    ; preds = %._crit_edge878, %11
  store i32 23, i32* %5, align 8
  %736 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %737 = load i32, i32* %736, align 4
  %738 = icmp sgt i32 %737, 7
  br i1 %738, label %._crit_edge873, label %.lr.ph872

.lr.ph872:                                        ; preds = %735
  %739 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %749

._crit_edge873.loopexit:                          ; preds = %.backedge470
  br label %._crit_edge873

._crit_edge873:                                   ; preds = %._crit_edge873.loopexit, %735
  %.lcssa615 = phi i32 [ %737, %735 ], [ %784, %._crit_edge873.loopexit ]
  %740 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %741 = load i32, i32* %740, align 8
  %742 = add nsw i32 %.lcssa615, -8
  store i32 %742, i32* %736, align 4
  %743 = lshr i32 %741, %742
  %744 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 23
  %745 = load i32, i32* %744, align 8
  %746 = shl i32 %745, 8
  %747 = and i32 %743, 255
  %748 = or i32 %746, %747
  store i32 %748, i32* %744, align 8
  br label %786

; <label>:749:                                    ; preds = %.backedge470, %.lr.ph872
  %750 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %751 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %750, i64 0, i32 1
  %752 = load i32, i32* %751, align 8
  %753 = icmp eq i32 %752, 0
  br i1 %753, label %.loopexit.loopexit1356, label %754

; <label>:754:                                    ; preds = %749
  %755 = load i32, i32* %739, align 8
  %756 = shl i32 %755, 8
  %757 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %750, i64 0, i32 0
  %758 = load i8*, i8** %757, align 8
  %759 = load i8, i8* %758, align 1
  %760 = zext i8 %759 to i32
  %761 = or i32 %760, %756
  store i32 %761, i32* %739, align 8
  %762 = load i32, i32* %736, align 4
  %763 = add nsw i32 %762, 8
  store i32 %763, i32* %736, align 4
  %764 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %765 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %764, i64 0, i32 0
  %766 = load i8*, i8** %765, align 8
  %767 = getelementptr inbounds i8, i8* %766, i64 1
  store i8* %767, i8** %765, align 8
  %768 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %769 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %768, i64 0, i32 1
  %770 = load i32, i32* %769, align 8
  %771 = add i32 %770, -1
  store i32 %771, i32* %769, align 8
  %772 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %773 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %772, i64 0, i32 2
  %774 = load i32, i32* %773, align 4
  %775 = add i32 %774, 1
  store i32 %775, i32* %773, align 4
  %776 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %777 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %776, i64 0, i32 2
  %778 = load i32, i32* %777, align 4
  %779 = icmp eq i32 %778, 0
  br i1 %779, label %780, label %.backedge470

; <label>:780:                                    ; preds = %754
  %781 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %776, i64 0, i32 3
  %782 = load i32, i32* %781, align 8
  %783 = add i32 %782, 1
  store i32 %783, i32* %781, align 8
  br label %.backedge470

.backedge470:                                     ; preds = %780, %754
  %784 = load i32, i32* %736, align 4
  %785 = icmp sgt i32 %784, 7
  br i1 %785, label %._crit_edge873.loopexit, label %749

; <label>:786:                                    ; preds = %._crit_edge873, %11
  store i32 24, i32* %5, align 8
  %787 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %788 = load i32, i32* %787, align 4
  %789 = icmp sgt i32 %788, 0
  br i1 %789, label %._crit_edge868, label %.lr.ph867

.lr.ph867:                                        ; preds = %786
  %790 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %799

._crit_edge868.loopexit:                          ; preds = %.backedge468
  br label %._crit_edge868

._crit_edge868:                                   ; preds = %._crit_edge868.loopexit, %786
  %.lcssa611 = phi i32 [ %788, %786 ], [ %834, %._crit_edge868.loopexit ]
  %791 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %792 = load i32, i32* %791, align 8
  %793 = add nsw i32 %.lcssa611, -1
  %794 = lshr i32 %792, %793
  store i32 %793, i32* %787, align 4
  %795 = trunc i32 %794 to i8
  %796 = and i8 %795, 1
  %797 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 4
  store i8 %796, i8* %797, align 4
  %798 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 13
  store i32 0, i32* %798, align 8
  br label %836

; <label>:799:                                    ; preds = %.backedge468, %.lr.ph867
  %800 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %801 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %800, i64 0, i32 1
  %802 = load i32, i32* %801, align 8
  %803 = icmp eq i32 %802, 0
  br i1 %803, label %.loopexit.loopexit1355, label %804

; <label>:804:                                    ; preds = %799
  %805 = load i32, i32* %790, align 8
  %806 = shl i32 %805, 8
  %807 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %800, i64 0, i32 0
  %808 = load i8*, i8** %807, align 8
  %809 = load i8, i8* %808, align 1
  %810 = zext i8 %809 to i32
  %811 = or i32 %810, %806
  store i32 %811, i32* %790, align 8
  %812 = load i32, i32* %787, align 4
  %813 = add nsw i32 %812, 8
  store i32 %813, i32* %787, align 4
  %814 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %815 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %814, i64 0, i32 0
  %816 = load i8*, i8** %815, align 8
  %817 = getelementptr inbounds i8, i8* %816, i64 1
  store i8* %817, i8** %815, align 8
  %818 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %819 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %818, i64 0, i32 1
  %820 = load i32, i32* %819, align 8
  %821 = add i32 %820, -1
  store i32 %821, i32* %819, align 8
  %822 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %823 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %822, i64 0, i32 2
  %824 = load i32, i32* %823, align 4
  %825 = add i32 %824, 1
  store i32 %825, i32* %823, align 4
  %826 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %827 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %826, i64 0, i32 2
  %828 = load i32, i32* %827, align 4
  %829 = icmp eq i32 %828, 0
  br i1 %829, label %830, label %.backedge468

; <label>:830:                                    ; preds = %804
  %831 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %826, i64 0, i32 3
  %832 = load i32, i32* %831, align 8
  %833 = add i32 %832, 1
  store i32 %833, i32* %831, align 8
  br label %.backedge468

.backedge468:                                     ; preds = %830, %804
  %834 = load i32, i32* %787, align 4
  %835 = icmp sgt i32 %834, 0
  br i1 %835, label %._crit_edge868.loopexit, label %799

; <label>:836:                                    ; preds = %._crit_edge868, %11
  store i32 25, i32* %5, align 8
  %837 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %838 = load i32, i32* %837, align 4
  %839 = icmp sgt i32 %838, 7
  br i1 %839, label %._crit_edge863, label %.lr.ph862

.lr.ph862:                                        ; preds = %836
  %840 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %850

._crit_edge863.loopexit:                          ; preds = %.backedge466
  br label %._crit_edge863

._crit_edge863:                                   ; preds = %._crit_edge863.loopexit, %836
  %.lcssa607 = phi i32 [ %838, %836 ], [ %885, %._crit_edge863.loopexit ]
  %841 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %842 = load i32, i32* %841, align 8
  %843 = add nsw i32 %.lcssa607, -8
  store i32 %843, i32* %837, align 4
  %844 = lshr i32 %842, %843
  %845 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 13
  %846 = load i32, i32* %845, align 8
  %847 = shl i32 %846, 8
  %848 = and i32 %844, 255
  %849 = or i32 %847, %848
  store i32 %849, i32* %845, align 8
  br label %887

; <label>:850:                                    ; preds = %.backedge466, %.lr.ph862
  %851 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %852 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %851, i64 0, i32 1
  %853 = load i32, i32* %852, align 8
  %854 = icmp eq i32 %853, 0
  br i1 %854, label %.loopexit.loopexit1354, label %855

; <label>:855:                                    ; preds = %850
  %856 = load i32, i32* %840, align 8
  %857 = shl i32 %856, 8
  %858 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %851, i64 0, i32 0
  %859 = load i8*, i8** %858, align 8
  %860 = load i8, i8* %859, align 1
  %861 = zext i8 %860 to i32
  %862 = or i32 %861, %857
  store i32 %862, i32* %840, align 8
  %863 = load i32, i32* %837, align 4
  %864 = add nsw i32 %863, 8
  store i32 %864, i32* %837, align 4
  %865 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %866 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %865, i64 0, i32 0
  %867 = load i8*, i8** %866, align 8
  %868 = getelementptr inbounds i8, i8* %867, i64 1
  store i8* %868, i8** %866, align 8
  %869 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %870 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %869, i64 0, i32 1
  %871 = load i32, i32* %870, align 8
  %872 = add i32 %871, -1
  store i32 %872, i32* %870, align 8
  %873 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %874 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %873, i64 0, i32 2
  %875 = load i32, i32* %874, align 4
  %876 = add i32 %875, 1
  store i32 %876, i32* %874, align 4
  %877 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %878 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %877, i64 0, i32 2
  %879 = load i32, i32* %878, align 4
  %880 = icmp eq i32 %879, 0
  br i1 %880, label %881, label %.backedge466

; <label>:881:                                    ; preds = %855
  %882 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %877, i64 0, i32 3
  %883 = load i32, i32* %882, align 8
  %884 = add i32 %883, 1
  store i32 %884, i32* %882, align 8
  br label %.backedge466

.backedge466:                                     ; preds = %881, %855
  %885 = load i32, i32* %837, align 4
  %886 = icmp sgt i32 %885, 7
  br i1 %886, label %._crit_edge863.loopexit, label %850

; <label>:887:                                    ; preds = %._crit_edge863, %11
  store i32 26, i32* %5, align 8
  %888 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %889 = load i32, i32* %888, align 4
  %890 = icmp sgt i32 %889, 7
  br i1 %890, label %._crit_edge858, label %.lr.ph857

.lr.ph857:                                        ; preds = %887
  %891 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %901

._crit_edge858.loopexit:                          ; preds = %.backedge464
  br label %._crit_edge858

._crit_edge858:                                   ; preds = %._crit_edge858.loopexit, %887
  %.lcssa603 = phi i32 [ %889, %887 ], [ %936, %._crit_edge858.loopexit ]
  %892 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %893 = load i32, i32* %892, align 8
  %894 = add nsw i32 %.lcssa603, -8
  store i32 %894, i32* %888, align 4
  %895 = lshr i32 %893, %894
  %896 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 13
  %897 = load i32, i32* %896, align 8
  %898 = shl i32 %897, 8
  %899 = and i32 %895, 255
  %900 = or i32 %898, %899
  store i32 %900, i32* %896, align 8
  br label %938

; <label>:901:                                    ; preds = %.backedge464, %.lr.ph857
  %902 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %903 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %902, i64 0, i32 1
  %904 = load i32, i32* %903, align 8
  %905 = icmp eq i32 %904, 0
  br i1 %905, label %.loopexit.loopexit1353, label %906

; <label>:906:                                    ; preds = %901
  %907 = load i32, i32* %891, align 8
  %908 = shl i32 %907, 8
  %909 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %902, i64 0, i32 0
  %910 = load i8*, i8** %909, align 8
  %911 = load i8, i8* %910, align 1
  %912 = zext i8 %911 to i32
  %913 = or i32 %912, %908
  store i32 %913, i32* %891, align 8
  %914 = load i32, i32* %888, align 4
  %915 = add nsw i32 %914, 8
  store i32 %915, i32* %888, align 4
  %916 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %917 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %916, i64 0, i32 0
  %918 = load i8*, i8** %917, align 8
  %919 = getelementptr inbounds i8, i8* %918, i64 1
  store i8* %919, i8** %917, align 8
  %920 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %921 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %920, i64 0, i32 1
  %922 = load i32, i32* %921, align 8
  %923 = add i32 %922, -1
  store i32 %923, i32* %921, align 8
  %924 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %925 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %924, i64 0, i32 2
  %926 = load i32, i32* %925, align 4
  %927 = add i32 %926, 1
  store i32 %927, i32* %925, align 4
  %928 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %929 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %928, i64 0, i32 2
  %930 = load i32, i32* %929, align 4
  %931 = icmp eq i32 %930, 0
  br i1 %931, label %932, label %.backedge464

; <label>:932:                                    ; preds = %906
  %933 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %928, i64 0, i32 3
  %934 = load i32, i32* %933, align 8
  %935 = add i32 %934, 1
  store i32 %935, i32* %933, align 8
  br label %.backedge464

.backedge464:                                     ; preds = %932, %906
  %936 = load i32, i32* %888, align 4
  %937 = icmp sgt i32 %936, 7
  br i1 %937, label %._crit_edge858.loopexit, label %901

; <label>:938:                                    ; preds = %._crit_edge858, %11
  store i32 27, i32* %5, align 8
  %939 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %940 = load i32, i32* %939, align 4
  %941 = icmp sgt i32 %940, 7
  br i1 %941, label %._crit_edge853, label %.lr.ph852

.lr.ph852:                                        ; preds = %938
  %942 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %953

._crit_edge853.loopexit:                          ; preds = %.backedge462
  br label %._crit_edge853

._crit_edge853:                                   ; preds = %._crit_edge853.loopexit, %938
  %.lcssa599 = phi i32 [ %940, %938 ], [ %988, %._crit_edge853.loopexit ]
  %943 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %944 = load i32, i32* %943, align 8
  %945 = add nsw i32 %.lcssa599, -8
  store i32 %945, i32* %939, align 4
  %946 = lshr i32 %944, %945
  %947 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 13
  %948 = load i32, i32* %947, align 8
  %949 = shl i32 %948, 8
  %950 = and i32 %946, 255
  %951 = or i32 %949, %950
  store i32 %951, i32* %947, align 8
  %952 = icmp slt i32 %951, 0
  br i1 %952, label %.loopexit, label %990

; <label>:953:                                    ; preds = %.backedge462, %.lr.ph852
  %954 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %955 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %954, i64 0, i32 1
  %956 = load i32, i32* %955, align 8
  %957 = icmp eq i32 %956, 0
  br i1 %957, label %.loopexit.loopexit1352, label %958

; <label>:958:                                    ; preds = %953
  %959 = load i32, i32* %942, align 8
  %960 = shl i32 %959, 8
  %961 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %954, i64 0, i32 0
  %962 = load i8*, i8** %961, align 8
  %963 = load i8, i8* %962, align 1
  %964 = zext i8 %963 to i32
  %965 = or i32 %964, %960
  store i32 %965, i32* %942, align 8
  %966 = load i32, i32* %939, align 4
  %967 = add nsw i32 %966, 8
  store i32 %967, i32* %939, align 4
  %968 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %969 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %968, i64 0, i32 0
  %970 = load i8*, i8** %969, align 8
  %971 = getelementptr inbounds i8, i8* %970, i64 1
  store i8* %971, i8** %969, align 8
  %972 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %973 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %972, i64 0, i32 1
  %974 = load i32, i32* %973, align 8
  %975 = add i32 %974, -1
  store i32 %975, i32* %973, align 8
  %976 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %977 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %976, i64 0, i32 2
  %978 = load i32, i32* %977, align 4
  %979 = add i32 %978, 1
  store i32 %979, i32* %977, align 4
  %980 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %981 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %980, i64 0, i32 2
  %982 = load i32, i32* %981, align 4
  %983 = icmp eq i32 %982, 0
  br i1 %983, label %984, label %.backedge462

; <label>:984:                                    ; preds = %958
  %985 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %980, i64 0, i32 3
  %986 = load i32, i32* %985, align 8
  %987 = add i32 %986, 1
  store i32 %987, i32* %985, align 8
  br label %.backedge462

.backedge462:                                     ; preds = %984, %958
  %988 = load i32, i32* %939, align 4
  %989 = icmp sgt i32 %988, 7
  br i1 %989, label %._crit_edge853.loopexit, label %953

; <label>:990:                                    ; preds = %._crit_edge853
  %991 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 9
  %992 = load i32, i32* %991, align 8
  %993 = mul nsw i32 %992, 100000
  %994 = or i32 %993, 10
  %995 = icmp sgt i32 %951, %994
  br i1 %995, label %.loopexit, label %996

; <label>:996:                                    ; preds = %._crit_edge714, %990
  %.08 = phi i32 [ %1010, %._crit_edge714 ], [ 0, %990 ]
  %997 = icmp slt i32 %.08, 16
  br i1 %997, label %998, label %.loopexit460.loopexit

; <label>:998:                                    ; preds = %996, %11
  %.19 = phi i32 [ %13, %11 ], [ %.08, %996 ]
  store i32 28, i32* %5, align 8
  %999 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %1000 = load i32, i32* %999, align 4
  %1001 = icmp sgt i32 %1000, 0
  br i1 %1001, label %._crit_edge714, label %.lr.ph713

.lr.ph713:                                        ; preds = %998
  %1002 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %1011

._crit_edge714.loopexit:                          ; preds = %.backedge410
  br label %._crit_edge714

._crit_edge714:                                   ; preds = %._crit_edge714.loopexit, %998
  %.lcssa532 = phi i32 [ %1000, %998 ], [ %1046, %._crit_edge714.loopexit ]
  %1003 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %1004 = load i32, i32* %1003, align 8
  %1005 = add nsw i32 %.lcssa532, -1
  store i32 %1005, i32* %999, align 4
  %1006 = shl i32 1, %1005
  %1007 = and i32 %1004, %1006
  %not. = icmp ne i32 %1007, 0
  %.sink = zext i1 %not. to i8
  %1008 = sext i32 %.19 to i64
  %1009 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 29, i64 %1008
  store i8 %.sink, i8* %1009, align 1
  %1010 = add nsw i32 %.19, 1
  br label %996

; <label>:1011:                                   ; preds = %.backedge410, %.lr.ph713
  %1012 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1013 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1012, i64 0, i32 1
  %1014 = load i32, i32* %1013, align 8
  %1015 = icmp eq i32 %1014, 0
  br i1 %1015, label %.loopexit.loopexit1334, label %1016

; <label>:1016:                                   ; preds = %1011
  %1017 = load i32, i32* %1002, align 8
  %1018 = shl i32 %1017, 8
  %1019 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1012, i64 0, i32 0
  %1020 = load i8*, i8** %1019, align 8
  %1021 = load i8, i8* %1020, align 1
  %1022 = zext i8 %1021 to i32
  %1023 = or i32 %1022, %1018
  store i32 %1023, i32* %1002, align 8
  %1024 = load i32, i32* %999, align 4
  %1025 = add nsw i32 %1024, 8
  store i32 %1025, i32* %999, align 4
  %1026 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1027 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1026, i64 0, i32 0
  %1028 = load i8*, i8** %1027, align 8
  %1029 = getelementptr inbounds i8, i8* %1028, i64 1
  store i8* %1029, i8** %1027, align 8
  %1030 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1031 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1030, i64 0, i32 1
  %1032 = load i32, i32* %1031, align 8
  %1033 = add i32 %1032, -1
  store i32 %1033, i32* %1031, align 8
  %1034 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1035 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1034, i64 0, i32 2
  %1036 = load i32, i32* %1035, align 4
  %1037 = add i32 %1036, 1
  store i32 %1037, i32* %1035, align 4
  %1038 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1039 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1038, i64 0, i32 2
  %1040 = load i32, i32* %1039, align 4
  %1041 = icmp eq i32 %1040, 0
  br i1 %1041, label %1042, label %.backedge410

; <label>:1042:                                   ; preds = %1016
  %1043 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1038, i64 0, i32 3
  %1044 = load i32, i32* %1043, align 8
  %1045 = add i32 %1044, 1
  store i32 %1045, i32* %1043, align 8
  br label %.backedge410

.backedge410:                                     ; preds = %1042, %1016
  %1046 = load i32, i32* %999, align 4
  %1047 = icmp sgt i32 %1046, 0
  br i1 %1047, label %._crit_edge714.loopexit, label %1011

.loopexit460.loopexit:                            ; preds = %996
  %scevgep1121 = getelementptr %struct.DState, %struct.DState* %0, i64 0, i32 28, i64 0
  call void @llvm.memset.p0i8.i64(i8* %scevgep1121, i8 0, i64 256, i32 1, i1 false)
  br label %.loopexit460

.loopexit460:                                     ; preds = %1111, %.loopexit460.loopexit
  %.013 = phi i32 [ %.316, %1111 ], [ %15, %.loopexit460.loopexit ]
  %.3 = phi i32 [ %1112, %1111 ], [ 0, %.loopexit460.loopexit ]
  %1048 = icmp slt i32 %.3, 16
  br i1 %1048, label %1049, label %1113

; <label>:1049:                                   ; preds = %.loopexit460
  %1050 = sext i32 %.3 to i64
  %1051 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 29, i64 %1050
  %1052 = load i8, i8* %1051, align 1
  %1053 = icmp eq i8 %1052, 0
  br i1 %1053, label %1111, label %1054

; <label>:1054:                                   ; preds = %1109, %1049
  %.114 = phi i32 [ %1110, %1109 ], [ 0, %1049 ]
  %.4 = phi i32 [ %.5, %1109 ], [ %.3, %1049 ]
  %1055 = icmp slt i32 %.114, 16
  br i1 %1055, label %1056, label %1111

; <label>:1056:                                   ; preds = %1054, %11
  %.215 = phi i32 [ %15, %11 ], [ %.114, %1054 ]
  %.5 = phi i32 [ %13, %11 ], [ %.4, %1054 ]
  store i32 29, i32* %5, align 8
  %1057 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %1058 = load i32, i32* %1057, align 4
  %1059 = icmp sgt i32 %1058, 0
  br i1 %1059, label %._crit_edge719, label %.lr.ph718

.lr.ph718:                                        ; preds = %1056
  %1060 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %1067

._crit_edge719.loopexit:                          ; preds = %.backedge412
  br label %._crit_edge719

._crit_edge719:                                   ; preds = %._crit_edge719.loopexit, %1056
  %.lcssa536 = phi i32 [ %1058, %1056 ], [ %1102, %._crit_edge719.loopexit ]
  %1061 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %1062 = load i32, i32* %1061, align 8
  %1063 = add nsw i32 %.lcssa536, -1
  store i32 %1063, i32* %1057, align 4
  %1064 = shl i32 1, %1063
  %1065 = and i32 %1062, %1064
  %1066 = icmp eq i32 %1065, 0
  br i1 %1066, label %1109, label %1104

; <label>:1067:                                   ; preds = %.backedge412, %.lr.ph718
  %1068 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1069 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1068, i64 0, i32 1
  %1070 = load i32, i32* %1069, align 8
  %1071 = icmp eq i32 %1070, 0
  br i1 %1071, label %.loopexit.loopexit1335, label %1072

; <label>:1072:                                   ; preds = %1067
  %1073 = load i32, i32* %1060, align 8
  %1074 = shl i32 %1073, 8
  %1075 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1068, i64 0, i32 0
  %1076 = load i8*, i8** %1075, align 8
  %1077 = load i8, i8* %1076, align 1
  %1078 = zext i8 %1077 to i32
  %1079 = or i32 %1078, %1074
  store i32 %1079, i32* %1060, align 8
  %1080 = load i32, i32* %1057, align 4
  %1081 = add nsw i32 %1080, 8
  store i32 %1081, i32* %1057, align 4
  %1082 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1083 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1082, i64 0, i32 0
  %1084 = load i8*, i8** %1083, align 8
  %1085 = getelementptr inbounds i8, i8* %1084, i64 1
  store i8* %1085, i8** %1083, align 8
  %1086 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1087 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1086, i64 0, i32 1
  %1088 = load i32, i32* %1087, align 8
  %1089 = add i32 %1088, -1
  store i32 %1089, i32* %1087, align 8
  %1090 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1091 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1090, i64 0, i32 2
  %1092 = load i32, i32* %1091, align 4
  %1093 = add i32 %1092, 1
  store i32 %1093, i32* %1091, align 4
  %1094 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1095 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1094, i64 0, i32 2
  %1096 = load i32, i32* %1095, align 4
  %1097 = icmp eq i32 %1096, 0
  br i1 %1097, label %1098, label %.backedge412

; <label>:1098:                                   ; preds = %1072
  %1099 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1094, i64 0, i32 3
  %1100 = load i32, i32* %1099, align 8
  %1101 = add i32 %1100, 1
  store i32 %1101, i32* %1099, align 8
  br label %.backedge412

.backedge412:                                     ; preds = %1098, %1072
  %1102 = load i32, i32* %1057, align 4
  %1103 = icmp sgt i32 %1102, 0
  br i1 %1103, label %._crit_edge719.loopexit, label %1067

; <label>:1104:                                   ; preds = %._crit_edge719
  %1105 = shl i32 %.5, 4
  %1106 = add nsw i32 %1105, %.215
  %1107 = sext i32 %1106 to i64
  %1108 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 28, i64 %1107
  store i8 1, i8* %1108, align 1
  br label %1109

; <label>:1109:                                   ; preds = %1104, %._crit_edge719
  %1110 = add nsw i32 %.215, 1
  br label %1054

; <label>:1111:                                   ; preds = %1054, %1049
  %.316 = phi i32 [ %.013, %1049 ], [ %.114, %1054 ]
  %.6 = phi i32 [ %.3, %1049 ], [ %.4, %1054 ]
  %1112 = add nsw i32 %.6, 1
  br label %.loopexit460

; <label>:1113:                                   ; preds = %.loopexit460
  tail call fastcc void @makeMaps_d(%struct.DState* %0)
  %1114 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 27
  %1115 = load i32, i32* %1114, align 8
  %1116 = icmp eq i32 %1115, 0
  br i1 %1116, label %.loopexit, label %1117

; <label>:1117:                                   ; preds = %1113
  %1118 = add nsw i32 %1115, 2
  br label %1119

; <label>:1119:                                   ; preds = %1117, %11
  %.061 = phi i32 [ %19, %11 ], [ %1118, %1117 ]
  %.417 = phi i32 [ %15, %11 ], [ %.013, %1117 ]
  %.7 = phi i32 [ %13, %11 ], [ %.3, %1117 ]
  store i32 30, i32* %5, align 8
  %1120 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %1121 = load i32, i32* %1120, align 4
  %1122 = icmp sgt i32 %1121, 2
  br i1 %1122, label %._crit_edge847, label %.lr.ph846

.lr.ph846:                                        ; preds = %1119
  %1123 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %1129

._crit_edge847.loopexit:                          ; preds = %.backedge458
  br label %._crit_edge847

._crit_edge847:                                   ; preds = %._crit_edge847.loopexit, %1119
  %.lcssa595 = phi i32 [ %1121, %1119 ], [ %1164, %._crit_edge847.loopexit ]
  %1124 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %1125 = load i32, i32* %1124, align 8
  %1126 = add nsw i32 %.lcssa595, -3
  %1127 = lshr i32 %1125, %1126
  %1128 = and i32 %1127, 7
  store i32 %1126, i32* %1120, align 4
  %trunc = trunc i32 %1127 to i3
  switch i3 %trunc, label %1166 [
    i3 -1, label %.loopexit
    i3 1, label %.loopexit
    i3 0, label %.loopexit
  ]

; <label>:1129:                                   ; preds = %.backedge458, %.lr.ph846
  %1130 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1131 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1130, i64 0, i32 1
  %1132 = load i32, i32* %1131, align 8
  %1133 = icmp eq i32 %1132, 0
  br i1 %1133, label %.loopexit.loopexit1351, label %1134

; <label>:1134:                                   ; preds = %1129
  %1135 = load i32, i32* %1123, align 8
  %1136 = shl i32 %1135, 8
  %1137 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1130, i64 0, i32 0
  %1138 = load i8*, i8** %1137, align 8
  %1139 = load i8, i8* %1138, align 1
  %1140 = zext i8 %1139 to i32
  %1141 = or i32 %1140, %1136
  store i32 %1141, i32* %1123, align 8
  %1142 = load i32, i32* %1120, align 4
  %1143 = add nsw i32 %1142, 8
  store i32 %1143, i32* %1120, align 4
  %1144 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1145 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1144, i64 0, i32 0
  %1146 = load i8*, i8** %1145, align 8
  %1147 = getelementptr inbounds i8, i8* %1146, i64 1
  store i8* %1147, i8** %1145, align 8
  %1148 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1149 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1148, i64 0, i32 1
  %1150 = load i32, i32* %1149, align 8
  %1151 = add i32 %1150, -1
  store i32 %1151, i32* %1149, align 8
  %1152 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1153 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1152, i64 0, i32 2
  %1154 = load i32, i32* %1153, align 4
  %1155 = add i32 %1154, 1
  store i32 %1155, i32* %1153, align 4
  %1156 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1157 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1156, i64 0, i32 2
  %1158 = load i32, i32* %1157, align 4
  %1159 = icmp eq i32 %1158, 0
  br i1 %1159, label %1160, label %.backedge458

; <label>:1160:                                   ; preds = %1134
  %1161 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1156, i64 0, i32 3
  %1162 = load i32, i32* %1161, align 8
  %1163 = add i32 %1162, 1
  store i32 %1163, i32* %1161, align 8
  br label %.backedge458

.backedge458:                                     ; preds = %1160, %1134
  %1164 = load i32, i32* %1120, align 4
  %1165 = icmp sgt i32 %1164, 2
  br i1 %1165, label %._crit_edge847.loopexit, label %1129

; <label>:1166:                                   ; preds = %._crit_edge847, %11
  %.084 = phi i32 [ %21, %11 ], [ %1128, %._crit_edge847 ]
  %.162 = phi i32 [ %19, %11 ], [ %.061, %._crit_edge847 ]
  %.518 = phi i32 [ %15, %11 ], [ %.417, %._crit_edge847 ]
  %.8 = phi i32 [ %13, %11 ], [ %.7, %._crit_edge847 ]
  store i32 31, i32* %5, align 8
  %1167 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %1168 = load i32, i32* %1167, align 4
  %1169 = icmp sgt i32 %1168, 14
  br i1 %1169, label %._crit_edge842, label %.lr.ph841

.lr.ph841:                                        ; preds = %1166
  %1170 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %1177

._crit_edge842.loopexit:                          ; preds = %.backedge456
  br label %._crit_edge842

._crit_edge842:                                   ; preds = %._crit_edge842.loopexit, %1166
  %.lcssa591 = phi i32 [ %1168, %1166 ], [ %1212, %._crit_edge842.loopexit ]
  %1171 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %1172 = load i32, i32* %1171, align 8
  %1173 = add nsw i32 %.lcssa591, -15
  %1174 = lshr i32 %1172, %1173
  %1175 = and i32 %1174, 32767
  store i32 %1173, i32* %1167, align 4
  %1176 = icmp eq i32 %1175, 0
  br i1 %1176, label %.loopexit, label %1214

; <label>:1177:                                   ; preds = %.backedge456, %.lr.ph841
  %1178 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1179 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1178, i64 0, i32 1
  %1180 = load i32, i32* %1179, align 8
  %1181 = icmp eq i32 %1180, 0
  br i1 %1181, label %.loopexit.loopexit1350, label %1182

; <label>:1182:                                   ; preds = %1177
  %1183 = load i32, i32* %1170, align 8
  %1184 = shl i32 %1183, 8
  %1185 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1178, i64 0, i32 0
  %1186 = load i8*, i8** %1185, align 8
  %1187 = load i8, i8* %1186, align 1
  %1188 = zext i8 %1187 to i32
  %1189 = or i32 %1188, %1184
  store i32 %1189, i32* %1170, align 8
  %1190 = load i32, i32* %1167, align 4
  %1191 = add nsw i32 %1190, 8
  store i32 %1191, i32* %1167, align 4
  %1192 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1193 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1192, i64 0, i32 0
  %1194 = load i8*, i8** %1193, align 8
  %1195 = getelementptr inbounds i8, i8* %1194, i64 1
  store i8* %1195, i8** %1193, align 8
  %1196 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1197 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1196, i64 0, i32 1
  %1198 = load i32, i32* %1197, align 8
  %1199 = add i32 %1198, -1
  store i32 %1199, i32* %1197, align 8
  %1200 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1201 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1200, i64 0, i32 2
  %1202 = load i32, i32* %1201, align 4
  %1203 = add i32 %1202, 1
  store i32 %1203, i32* %1201, align 4
  %1204 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1205 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1204, i64 0, i32 2
  %1206 = load i32, i32* %1205, align 4
  %1207 = icmp eq i32 %1206, 0
  br i1 %1207, label %1208, label %.backedge456

; <label>:1208:                                   ; preds = %1182
  %1209 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1204, i64 0, i32 3
  %1210 = load i32, i32* %1209, align 8
  %1211 = add i32 %1210, 1
  store i32 %1211, i32* %1209, align 8
  br label %.backedge456

.backedge456:                                     ; preds = %1208, %1182
  %1212 = load i32, i32* %1167, align 4
  %1213 = icmp sgt i32 %1212, 14
  br i1 %1213, label %._crit_edge842.loopexit, label %1177

; <label>:1214:                                   ; preds = %1294, %._crit_edge842
  %.0106 = phi i32 [ %.2108, %1294 ], [ %1175, %._crit_edge842 ]
  %.185 = phi i32 [ %.387, %1294 ], [ %.084, %._crit_edge842 ]
  %.263 = phi i32 [ %.465, %1294 ], [ %.162, %._crit_edge842 ]
  %.619 = phi i32 [ %.821, %1294 ], [ %.518, %._crit_edge842 ]
  %.9 = phi i32 [ %1298, %1294 ], [ 0, %._crit_edge842 ]
  %1215 = icmp slt i32 %.9, %.0106
  br i1 %1215, label %1242, label %.preheader454

.preheader454:                                    ; preds = %1214
  %1216 = icmp sgt i32 %.185, 0
  br i1 %1216, label %.lr.ph839.preheader, label %.preheader452

.lr.ph839.preheader:                              ; preds = %.preheader454
  %min.iters.check = icmp ult i32 %.185, 32
  br i1 %min.iters.check, label %.lr.ph839.preheader1349, label %min.iters.checked

.lr.ph839.preheader1349:                          ; preds = %middle.block, %vector.scevcheck, %min.iters.checked, %.lr.ph839.preheader
  %.0365838.ph = phi i8 [ 0, %vector.scevcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph839.preheader ], [ %cast.crd, %middle.block ]
  br label %.lr.ph839

min.iters.checked:                                ; preds = %.lr.ph839.preheader
  %n.vec = and i32 %.185, -32
  %cmp.zero = icmp eq i32 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph839.preheader1349, label %vector.scevcheck

vector.scevcheck:                                 ; preds = %min.iters.checked
  %1217 = add i32 %.185, -1
  %1218 = trunc i32 %1217 to i8
  %1219 = icmp eq i8 %1218, -1
  %1220 = icmp ugt i32 %1217, 255
  %1221 = or i1 %1219, %1220
  %cast.crd = trunc i32 %n.vec to i8
  br i1 %1221, label %.lr.ph839.preheader1349, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.scevcheck
  %1222 = add i32 %n.vec, -32
  %1223 = lshr exact i32 %1222, 5
  %1224 = and i32 %1223, 1
  %lcmp.mod1423 = icmp eq i32 %1224, 0
  br i1 %lcmp.mod1423, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %1225 = bitcast [6 x i8]* %2 to <16 x i8>*
  store <16 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>, <16 x i8>* %1225, align 16
  %1226 = getelementptr [6 x i8], [6 x i8]* %2, i64 0, i64 16
  %1227 = bitcast i8* %1226 to <16 x i8>*
  store <16 x i8> <i8 16, i8 17, i8 18, i8 19, i8 20, i8 21, i8 22, i8 23, i8 24, i8 25, i8 26, i8 27, i8 28, i8 29, i8 30, i8 31>, <16 x i8>* %1227, align 16
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i32 [ 0, %vector.body.preheader ], [ 32, %vector.body.prol ]
  %1228 = icmp eq i32 %1223, 0
  br i1 %1228, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i32 [ %index.unr, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %1229 = trunc i32 %index to i8
  %broadcast.splatinsert = insertelement <16 x i8> undef, i8 %1229, i32 0
  %broadcast.splat = shufflevector <16 x i8> %broadcast.splatinsert, <16 x i8> undef, <16 x i32> zeroinitializer
  %induction = add <16 x i8> %broadcast.splat, <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>
  %induction1324 = add <16 x i8> %broadcast.splat, <i8 16, i8 17, i8 18, i8 19, i8 20, i8 21, i8 22, i8 23, i8 24, i8 25, i8 26, i8 27, i8 28, i8 29, i8 30, i8 31>
  %.mask1325 = and i32 %index, 224
  %1230 = zext i32 %.mask1325 to i64
  %1231 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 %1230
  %1232 = bitcast i8* %1231 to <16 x i8>*
  store <16 x i8> %induction, <16 x i8>* %1232, align 16
  %1233 = getelementptr i8, i8* %1231, i64 16
  %1234 = bitcast i8* %1233 to <16 x i8>*
  store <16 x i8> %induction1324, <16 x i8>* %1234, align 16
  %index.next = add i32 %index, 32
  %1235 = trunc i32 %index.next to i8
  %broadcast.splatinsert.1 = insertelement <16 x i8> undef, i8 %1235, i32 0
  %broadcast.splat.1 = shufflevector <16 x i8> %broadcast.splatinsert.1, <16 x i8> undef, <16 x i32> zeroinitializer
  %induction.1 = add <16 x i8> %broadcast.splat.1, <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>
  %induction1324.1 = add <16 x i8> %broadcast.splat.1, <i8 16, i8 17, i8 18, i8 19, i8 20, i8 21, i8 22, i8 23, i8 24, i8 25, i8 26, i8 27, i8 28, i8 29, i8 30, i8 31>
  %.mask1325.1 = and i32 %index.next, 224
  %1236 = zext i32 %.mask1325.1 to i64
  %1237 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 %1236
  %1238 = bitcast i8* %1237 to <16 x i8>*
  store <16 x i8> %induction.1, <16 x i8>* %1238, align 16
  %1239 = getelementptr i8, i8* %1237, i64 16
  %1240 = bitcast i8* %1239 to <16 x i8>*
  store <16 x i8> %induction1324.1, <16 x i8>* %1240, align 16
  %index.next.1 = add i32 %index, 64
  %1241 = icmp eq i32 %index.next.1, %n.vec
  br i1 %1241, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !1

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.unr-lcssa, %vector.body.prol.loopexit
  %cmp.n = icmp eq i32 %.185, %n.vec
  br i1 %cmp.n, label %.preheader452, label %.lr.ph839.preheader1349

; <label>:1242:                                   ; preds = %1291, %1214
  %.1107 = phi i32 [ %.0106, %1214 ], [ %.2108, %1291 ]
  %.286 = phi i32 [ %.185, %1214 ], [ %.387, %1291 ]
  %.364 = phi i32 [ %.263, %1214 ], [ %.465, %1291 ]
  %.720 = phi i32 [ 0, %1214 ], [ %1292, %1291 ]
  %.10 = phi i32 [ %.9, %1214 ], [ %.11, %1291 ]
  br label %1243

; <label>:1243:                                   ; preds = %1242, %11
  %.2108 = phi i32 [ %23, %11 ], [ %.1107, %1242 ]
  %.387 = phi i32 [ %21, %11 ], [ %.286, %1242 ]
  %.465 = phi i32 [ %19, %11 ], [ %.364, %1242 ]
  %.821 = phi i32 [ %15, %11 ], [ %.720, %1242 ]
  %.11 = phi i32 [ %13, %11 ], [ %.10, %1242 ]
  store i32 32, i32* %5, align 8
  %1244 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %1245 = load i32, i32* %1244, align 4
  %1246 = icmp sgt i32 %1245, 0
  br i1 %1246, label %._crit_edge724, label %.lr.ph723

.lr.ph723:                                        ; preds = %1243
  %1247 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %1254

._crit_edge724.loopexit:                          ; preds = %.backedge414
  br label %._crit_edge724

._crit_edge724:                                   ; preds = %._crit_edge724.loopexit, %1243
  %.lcssa540 = phi i32 [ %1245, %1243 ], [ %1289, %._crit_edge724.loopexit ]
  %1248 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %1249 = load i32, i32* %1248, align 8
  %1250 = add nsw i32 %.lcssa540, -1
  store i32 %1250, i32* %1244, align 4
  %1251 = shl i32 1, %1250
  %1252 = and i32 %1249, %1251
  %1253 = icmp eq i32 %1252, 0
  br i1 %1253, label %1294, label %1291

; <label>:1254:                                   ; preds = %.backedge414, %.lr.ph723
  %1255 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1256 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1255, i64 0, i32 1
  %1257 = load i32, i32* %1256, align 8
  %1258 = icmp eq i32 %1257, 0
  br i1 %1258, label %.loopexit.loopexit1336, label %1259

; <label>:1259:                                   ; preds = %1254
  %1260 = load i32, i32* %1247, align 8
  %1261 = shl i32 %1260, 8
  %1262 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1255, i64 0, i32 0
  %1263 = load i8*, i8** %1262, align 8
  %1264 = load i8, i8* %1263, align 1
  %1265 = zext i8 %1264 to i32
  %1266 = or i32 %1265, %1261
  store i32 %1266, i32* %1247, align 8
  %1267 = load i32, i32* %1244, align 4
  %1268 = add nsw i32 %1267, 8
  store i32 %1268, i32* %1244, align 4
  %1269 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1270 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1269, i64 0, i32 0
  %1271 = load i8*, i8** %1270, align 8
  %1272 = getelementptr inbounds i8, i8* %1271, i64 1
  store i8* %1272, i8** %1270, align 8
  %1273 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1274 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1273, i64 0, i32 1
  %1275 = load i32, i32* %1274, align 8
  %1276 = add i32 %1275, -1
  store i32 %1276, i32* %1274, align 8
  %1277 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1278 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1277, i64 0, i32 2
  %1279 = load i32, i32* %1278, align 4
  %1280 = add i32 %1279, 1
  store i32 %1280, i32* %1278, align 4
  %1281 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1282 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1281, i64 0, i32 2
  %1283 = load i32, i32* %1282, align 4
  %1284 = icmp eq i32 %1283, 0
  br i1 %1284, label %1285, label %.backedge414

; <label>:1285:                                   ; preds = %1259
  %1286 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1281, i64 0, i32 3
  %1287 = load i32, i32* %1286, align 8
  %1288 = add i32 %1287, 1
  store i32 %1288, i32* %1286, align 8
  br label %.backedge414

.backedge414:                                     ; preds = %1285, %1259
  %1289 = load i32, i32* %1244, align 4
  %1290 = icmp sgt i32 %1289, 0
  br i1 %1290, label %._crit_edge724.loopexit, label %1254

; <label>:1291:                                   ; preds = %._crit_edge724
  %1292 = add nsw i32 %.821, 1
  %1293 = icmp slt i32 %1292, %.387
  br i1 %1293, label %1242, label %.loopexit

; <label>:1294:                                   ; preds = %._crit_edge724
  %1295 = trunc i32 %.821 to i8
  %1296 = sext i32 %.11 to i64
  %1297 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 34, i64 %1296
  store i8 %1295, i8* %1297, align 1
  %1298 = add nsw i32 %.11, 1
  br label %1214

.preheader452.loopexit:                           ; preds = %.lr.ph839
  br label %.preheader452

.preheader452:                                    ; preds = %.preheader452.loopexit, %middle.block, %.preheader454
  %1299 = icmp sgt i32 %.0106, 0
  br i1 %1299, label %.lr.ph836, label %.loopexit453

.lr.ph836:                                        ; preds = %.preheader452
  %1300 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 0
  %wide.trip.count1116 = zext i32 %.0106 to i64
  br label %1306

.lr.ph839:                                        ; preds = %.lr.ph839, %.lr.ph839.preheader1349
  %.0365838 = phi i8 [ %1303, %.lr.ph839 ], [ %.0365838.ph, %.lr.ph839.preheader1349 ]
  %1301 = zext i8 %.0365838 to i64
  %1302 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 %1301
  store i8 %.0365838, i8* %1302, align 1
  %1303 = add i8 %.0365838, 1
  %1304 = zext i8 %1303 to i32
  %1305 = icmp slt i32 %1304, %.185
  br i1 %1305, label %.lr.ph839, label %.preheader452.loopexit, !llvm.loop !4

; <label>:1306:                                   ; preds = %._crit_edge834, %.lr.ph836
  %indvars.iv1114 = phi i64 [ 0, %.lr.ph836 ], [ %indvars.iv.next1115, %._crit_edge834 ]
  %1307 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 34, i64 %indvars.iv1114
  %1308 = load i8, i8* %1307, align 1
  %1309 = zext i8 %1308 to i64
  %1310 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 %1309
  %1311 = load i8, i8* %1310, align 1
  %1312 = icmp eq i8 %1308, 0
  br i1 %1312, label %._crit_edge834, label %.lr.ph833.preheader

.lr.ph833.preheader:                              ; preds = %1306
  %1313 = zext i8 %1308 to i64
  %1314 = add i8 %1308, -1
  %xtraiter1111 = and i8 %1308, 3
  %lcmp.mod1112 = icmp eq i8 %xtraiter1111, 0
  br i1 %lcmp.mod1112, label %.lr.ph833.prol.loopexit, label %.lr.ph833.prol.preheader

.lr.ph833.prol.preheader:                         ; preds = %.lr.ph833.preheader
  br label %.lr.ph833.prol

.lr.ph833.prol:                                   ; preds = %.lr.ph833.prol, %.lr.ph833.prol.preheader
  %indvars.iv1108.prol = phi i64 [ %indvars.iv.next1109.prol, %.lr.ph833.prol ], [ %1313, %.lr.ph833.prol.preheader ]
  %prol.iter1113 = phi i8 [ %prol.iter1113.sub, %.lr.ph833.prol ], [ %xtraiter1111, %.lr.ph833.prol.preheader ]
  %1315 = add nsw i64 %indvars.iv1108.prol, -1
  %1316 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 %1315
  %1317 = load i8, i8* %1316, align 1
  %1318 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 %indvars.iv1108.prol
  store i8 %1317, i8* %1318, align 1
  %indvars.iv.next1109.prol = add nsw i64 %indvars.iv1108.prol, -1
  %prol.iter1113.sub = add i8 %prol.iter1113, -1
  %prol.iter1113.cmp = icmp eq i8 %prol.iter1113.sub, 0
  br i1 %prol.iter1113.cmp, label %.lr.ph833.prol.loopexit.loopexit, label %.lr.ph833.prol, !llvm.loop !5

.lr.ph833.prol.loopexit.loopexit:                 ; preds = %.lr.ph833.prol
  br label %.lr.ph833.prol.loopexit

.lr.ph833.prol.loopexit:                          ; preds = %.lr.ph833.prol.loopexit.loopexit, %.lr.ph833.preheader
  %indvars.iv1108.unr = phi i64 [ %1313, %.lr.ph833.preheader ], [ %indvars.iv.next1109.prol, %.lr.ph833.prol.loopexit.loopexit ]
  %1319 = icmp ult i8 %1314, 3
  br i1 %1319, label %._crit_edge834, label %.lr.ph833.preheader1348

.lr.ph833.preheader1348:                          ; preds = %.lr.ph833.prol.loopexit
  br label %.lr.ph833

.lr.ph833:                                        ; preds = %.lr.ph833, %.lr.ph833.preheader1348
  %indvars.iv1108 = phi i64 [ %indvars.iv.next1109.3, %.lr.ph833 ], [ %indvars.iv1108.unr, %.lr.ph833.preheader1348 ]
  %1320 = add nsw i64 %indvars.iv1108, -1
  %1321 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 %1320
  %1322 = load i8, i8* %1321, align 1
  %1323 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 %indvars.iv1108
  store i8 %1322, i8* %1323, align 1
  %indvars.iv.next1109 = add nsw i64 %indvars.iv1108, -1
  %1324 = add nsw i64 %indvars.iv1108, -2
  %1325 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 %1324
  %1326 = load i8, i8* %1325, align 1
  %1327 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 %indvars.iv.next1109
  store i8 %1326, i8* %1327, align 1
  %indvars.iv.next1109.1 = add nsw i64 %indvars.iv1108, -2
  %1328 = add nsw i64 %indvars.iv1108, -3
  %1329 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 %1328
  %1330 = load i8, i8* %1329, align 1
  %1331 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 %indvars.iv.next1109.1
  store i8 %1330, i8* %1331, align 1
  %indvars.iv.next1109.2 = add nsw i64 %indvars.iv1108, -3
  %1332 = add nsw i64 %indvars.iv1108, -4
  %1333 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 %1332
  %1334 = load i8, i8* %1333, align 1
  %1335 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 %indvars.iv.next1109.2
  store i8 %1334, i8* %1335, align 1
  %1336 = trunc i64 %indvars.iv.next1109.2 to i8
  %1337 = icmp eq i8 %1336, 1
  %indvars.iv.next1109.3 = add nsw i64 %indvars.iv1108, -4
  br i1 %1337, label %._crit_edge834.loopexit, label %.lr.ph833

._crit_edge834.loopexit:                          ; preds = %.lr.ph833
  br label %._crit_edge834

._crit_edge834:                                   ; preds = %._crit_edge834.loopexit, %.lr.ph833.prol.loopexit, %1306
  store i8 %1311, i8* %1300, align 16
  %1338 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 33, i64 %indvars.iv1114
  store i8 %1311, i8* %1338, align 1
  %indvars.iv.next1115 = add nuw nsw i64 %indvars.iv1114, 1
  %exitcond1117 = icmp eq i64 %indvars.iv.next1115, %wide.trip.count1116
  br i1 %exitcond1117, label %.loopexit453.loopexit, label %1306

.loopexit453.loopexit:                            ; preds = %._crit_edge834
  br label %.loopexit453

.loopexit453:                                     ; preds = %1519, %.loopexit453.loopexit, %.preheader452
  %.0228 = phi i32 [ %.2230, %1519 ], [ %41, %.preheader452 ], [ %41, %.loopexit453.loopexit ]
  %.3109 = phi i32 [ %.5111, %1519 ], [ %.0106, %.preheader452 ], [ %.0106, %.loopexit453.loopexit ]
  %.488 = phi i32 [ %.690, %1519 ], [ %.185, %.preheader452 ], [ %.185, %.loopexit453.loopexit ]
  %.566 = phi i32 [ %.768, %1519 ], [ %.263, %.preheader452 ], [ %.263, %.loopexit453.loopexit ]
  %.042 = phi i32 [ %1520, %1519 ], [ 0, %.preheader452 ], [ 0, %.loopexit453.loopexit ]
  %.922 = phi i32 [ %.1124, %1519 ], [ %.619, %.preheader452 ], [ %.619, %.loopexit453.loopexit ]
  %.13 = phi i32 [ %.15, %1519 ], [ 0, %.preheader452 ], [ %.0106, %.loopexit453.loopexit ]
  %1339 = icmp slt i32 %.042, %.488
  br i1 %1339, label %1365, label %.preheader451

.preheader451:                                    ; preds = %.loopexit453
  %1340 = icmp sgt i32 %.488, 0
  br i1 %1340, label %.preheader450.lr.ph, label %.preheader449

.preheader450.lr.ph:                              ; preds = %.preheader451
  %1341 = icmp sgt i32 %.566, 0
  br i1 %1341, label %.preheader450.us.preheader, label %.preheader450.preheader

.preheader450.preheader:                          ; preds = %.preheader450.lr.ph
  %wide.trip.count1106 = zext i32 %.488 to i64
  br label %.preheader450

.preheader450.us.preheader:                       ; preds = %.preheader450.lr.ph
  %xtraiter1098 = and i32 %.566, 1
  %lcmp.mod1099 = icmp eq i32 %xtraiter1098, 0
  %1342 = icmp eq i32 %.566, 1
  %wide.trip.count1102 = zext i32 %.488 to i64
  %wide.trip.count1096.1 = zext i32 %.566 to i64
  br label %.preheader450.us

.preheader450.us:                                 ; preds = %._crit_edge824.us, %.preheader450.us.preheader
  %indvars.iv1100 = phi i64 [ %indvars.iv.next1101, %._crit_edge824.us ], [ 0, %.preheader450.us.preheader ]
  br i1 %lcmp.mod1099, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader450.us
  %1343 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 35, i64 %indvars.iv1100, i64 0
  %1344 = load i8, i8* %1343, align 1
  %1345 = zext i8 %1344 to i32
  %1346 = zext i8 %1344 to i32
  %1347 = icmp ult i32 %1346, 32
  %.14.us.prol = select i1 %1347, i32 %1346, i32 32
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader450.us
  %indvars.iv1094.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader450.us ]
  %.03822.us.unr.ph = phi i32 [ %.14.us.prol, %.prol.preheader ], [ 32, %.preheader450.us ]
  %.05821.us.unr.ph = phi i32 [ %1345, %.prol.preheader ], [ 0, %.preheader450.us ]
  %..05.us.lcssa.unr.ph = phi i32 [ %1345, %.prol.preheader ], [ undef, %.preheader450.us ]
  %.14.us.lcssa.unr.ph = phi i32 [ %.14.us.prol, %.prol.preheader ], [ undef, %.preheader450.us ]
  br i1 %1342, label %._crit_edge824.us, label %.preheader450.us.new.preheader

.preheader450.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader450.us.new

.preheader450.us.new:                             ; preds = %.preheader450.us.new, %.preheader450.us.new.preheader
  %indvars.iv1094 = phi i64 [ %indvars.iv.next1095.1, %.preheader450.us.new ], [ %indvars.iv1094.unr.ph, %.preheader450.us.new.preheader ]
  %.03822.us = phi i32 [ %.14.us.1, %.preheader450.us.new ], [ %.03822.us.unr.ph, %.preheader450.us.new.preheader ]
  %.05821.us = phi i32 [ %..05.us.1, %.preheader450.us.new ], [ %.05821.us.unr.ph, %.preheader450.us.new.preheader ]
  %1348 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 35, i64 %indvars.iv1100, i64 %indvars.iv1094
  %1349 = load i8, i8* %1348, align 1
  %1350 = zext i8 %1349 to i32
  %1351 = icmp sgt i32 %1350, %.05821.us
  %..05.us = select i1 %1351, i32 %1350, i32 %.05821.us
  %1352 = zext i8 %1349 to i32
  %1353 = icmp slt i32 %1352, %.03822.us
  %.14.us = select i1 %1353, i32 %1352, i32 %.03822.us
  %indvars.iv.next1095 = add nuw nsw i64 %indvars.iv1094, 1
  %1354 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 35, i64 %indvars.iv1100, i64 %indvars.iv.next1095
  %1355 = load i8, i8* %1354, align 1
  %1356 = zext i8 %1355 to i32
  %1357 = icmp sgt i32 %1356, %..05.us
  %..05.us.1 = select i1 %1357, i32 %1356, i32 %..05.us
  %1358 = zext i8 %1355 to i32
  %1359 = icmp slt i32 %1358, %.14.us
  %.14.us.1 = select i1 %1359, i32 %1358, i32 %.14.us
  %indvars.iv.next1095.1 = add nsw i64 %indvars.iv1094, 2
  %exitcond1097.1 = icmp eq i64 %indvars.iv.next1095.1, %wide.trip.count1096.1
  br i1 %exitcond1097.1, label %._crit_edge824.us.loopexit, label %.preheader450.us.new

._crit_edge824.us.loopexit:                       ; preds = %.preheader450.us.new
  br label %._crit_edge824.us

._crit_edge824.us:                                ; preds = %._crit_edge824.us.loopexit, %.prol.loopexit
  %..05.us.lcssa = phi i32 [ %..05.us.lcssa.unr.ph, %.prol.loopexit ], [ %..05.us.1, %._crit_edge824.us.loopexit ]
  %.14.us.lcssa = phi i32 [ %.14.us.lcssa.unr.ph, %.prol.loopexit ], [ %.14.us.1, %._crit_edge824.us.loopexit ]
  %1360 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 36, i64 %indvars.iv1100, i64 0
  %1361 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 37, i64 %indvars.iv1100, i64 0
  %1362 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 38, i64 %indvars.iv1100, i64 0
  %1363 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 35, i64 %indvars.iv1100, i64 0
  tail call void @BZ2_hbCreateDecodeTables(i32* %1360, i32* %1361, i32* %1362, i8* %1363, i32 %.14.us.lcssa, i32 %..05.us.lcssa, i32 %.566) #4
  %1364 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 39, i64 %indvars.iv1100
  store i32 %.14.us.lcssa, i32* %1364, align 4
  %indvars.iv.next1101 = add nuw nsw i64 %indvars.iv1100, 1
  %exitcond1103 = icmp eq i64 %indvars.iv.next1101, %wide.trip.count1102
  br i1 %exitcond1103, label %.preheader449.loopexit, label %.preheader450.us

; <label>:1365:                                   ; preds = %.loopexit453, %11
  %.1229 = phi i32 [ %41, %11 ], [ %.0228, %.loopexit453 ]
  %.4110 = phi i32 [ %23, %11 ], [ %.3109, %.loopexit453 ]
  %.589 = phi i32 [ %21, %11 ], [ %.488, %.loopexit453 ]
  %.667 = phi i32 [ %19, %11 ], [ %.566, %.loopexit453 ]
  %.143 = phi i32 [ %17, %11 ], [ %.042, %.loopexit453 ]
  %.1023 = phi i32 [ %15, %11 ], [ %.922, %.loopexit453 ]
  %.1410 = phi i32 [ %13, %11 ], [ %.13, %.loopexit453 ]
  store i32 33, i32* %5, align 8
  %1366 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %1367 = load i32, i32* %1366, align 4
  %1368 = icmp sgt i32 %1367, 4
  br i1 %1368, label %._crit_edge739, label %.lr.ph738

.lr.ph738:                                        ; preds = %1365
  %1369 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %1375

._crit_edge739.loopexit:                          ; preds = %.backedge420
  br label %._crit_edge739

._crit_edge739:                                   ; preds = %._crit_edge739.loopexit, %1365
  %.lcssa552 = phi i32 [ %1367, %1365 ], [ %1410, %._crit_edge739.loopexit ]
  %1370 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %1371 = load i32, i32* %1370, align 8
  %1372 = add nsw i32 %.lcssa552, -5
  store i32 %1372, i32* %1366, align 4
  %1373 = lshr i32 %1371, %1372
  %1374 = and i32 %1373, 31
  br label %1412

; <label>:1375:                                   ; preds = %.backedge420, %.lr.ph738
  %1376 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1377 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1376, i64 0, i32 1
  %1378 = load i32, i32* %1377, align 8
  %1379 = icmp eq i32 %1378, 0
  br i1 %1379, label %.loopexit.loopexit1339, label %1380

; <label>:1380:                                   ; preds = %1375
  %1381 = load i32, i32* %1369, align 8
  %1382 = shl i32 %1381, 8
  %1383 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1376, i64 0, i32 0
  %1384 = load i8*, i8** %1383, align 8
  %1385 = load i8, i8* %1384, align 1
  %1386 = zext i8 %1385 to i32
  %1387 = or i32 %1386, %1382
  store i32 %1387, i32* %1369, align 8
  %1388 = load i32, i32* %1366, align 4
  %1389 = add nsw i32 %1388, 8
  store i32 %1389, i32* %1366, align 4
  %1390 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1391 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1390, i64 0, i32 0
  %1392 = load i8*, i8** %1391, align 8
  %1393 = getelementptr inbounds i8, i8* %1392, i64 1
  store i8* %1393, i8** %1391, align 8
  %1394 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1395 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1394, i64 0, i32 1
  %1396 = load i32, i32* %1395, align 8
  %1397 = add i32 %1396, -1
  store i32 %1397, i32* %1395, align 8
  %1398 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1399 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1398, i64 0, i32 2
  %1400 = load i32, i32* %1399, align 4
  %1401 = add i32 %1400, 1
  store i32 %1401, i32* %1399, align 4
  %1402 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1403 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1402, i64 0, i32 2
  %1404 = load i32, i32* %1403, align 4
  %1405 = icmp eq i32 %1404, 0
  br i1 %1405, label %1406, label %.backedge420

; <label>:1406:                                   ; preds = %1380
  %1407 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1402, i64 0, i32 3
  %1408 = load i32, i32* %1407, align 8
  %1409 = add i32 %1408, 1
  store i32 %1409, i32* %1407, align 8
  br label %.backedge420

.backedge420:                                     ; preds = %1406, %1380
  %1410 = load i32, i32* %1366, align 4
  %1411 = icmp sgt i32 %1410, 4
  br i1 %1411, label %._crit_edge739.loopexit, label %1375

; <label>:1412:                                   ; preds = %1513, %._crit_edge739
  %.2230 = phi i32 [ %.4232, %1513 ], [ %1374, %._crit_edge739 ]
  %.5111 = phi i32 [ %.7113, %1513 ], [ %.4110, %._crit_edge739 ]
  %.690 = phi i32 [ %.892, %1513 ], [ %.589, %._crit_edge739 ]
  %.768 = phi i32 [ %.970, %1513 ], [ %.667, %._crit_edge739 ]
  %.244 = phi i32 [ %.446, %1513 ], [ %.143, %._crit_edge739 ]
  %.1124 = phi i32 [ %.1326, %1513 ], [ %.1023, %._crit_edge739 ]
  %.15 = phi i32 [ %1518, %1513 ], [ 0, %._crit_edge739 ]
  %1413 = icmp slt i32 %.15, %.768
  br i1 %1413, label %1414, label %1519

; <label>:1414:                                   ; preds = %._crit_edge729, %1412
  %.3231 = phi i32 [ %1475, %._crit_edge729 ], [ %.2230, %1412 ]
  %.6112 = phi i32 [ %.8114, %._crit_edge729 ], [ %.5111, %1412 ]
  %.791 = phi i32 [ %.993, %._crit_edge729 ], [ %.690, %1412 ]
  %.869 = phi i32 [ %.1071, %._crit_edge729 ], [ %.768, %1412 ]
  %.345 = phi i32 [ %.547, %._crit_edge729 ], [ %.244, %1412 ]
  %.1225 = phi i32 [ %.1427, %._crit_edge729 ], [ %.1124, %1412 ]
  %.1611 = phi i32 [ %.18, %._crit_edge729 ], [ %.15, %1412 ]
  %.3231.off = add i32 %.3231, -1
  %1415 = icmp ugt i32 %.3231.off, 19
  br i1 %1415, label %.loopexit, label %1416

; <label>:1416:                                   ; preds = %1414, %11
  %.4232 = phi i32 [ %41, %11 ], [ %.3231, %1414 ]
  %.7113 = phi i32 [ %23, %11 ], [ %.6112, %1414 ]
  %.892 = phi i32 [ %21, %11 ], [ %.791, %1414 ]
  %.970 = phi i32 [ %19, %11 ], [ %.869, %1414 ]
  %.446 = phi i32 [ %17, %11 ], [ %.345, %1414 ]
  %.1326 = phi i32 [ %15, %11 ], [ %.1225, %1414 ]
  %.17 = phi i32 [ %13, %11 ], [ %.1611, %1414 ]
  store i32 34, i32* %5, align 8
  %1417 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %1418 = load i32, i32* %1417, align 4
  %1419 = icmp sgt i32 %1418, 0
  br i1 %1419, label %._crit_edge734, label %.lr.ph733

.lr.ph733:                                        ; preds = %1416
  %1420 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %1427

._crit_edge734.loopexit:                          ; preds = %.backedge418
  br label %._crit_edge734

._crit_edge734:                                   ; preds = %._crit_edge734.loopexit, %1416
  %.lcssa548 = phi i32 [ %1418, %1416 ], [ %1462, %._crit_edge734.loopexit ]
  %1421 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %1422 = load i32, i32* %1421, align 8
  %1423 = add nsw i32 %.lcssa548, -1
  store i32 %1423, i32* %1417, align 4
  %1424 = shl i32 1, %1423
  %1425 = and i32 %1422, %1424
  %1426 = icmp eq i32 %1425, 0
  br i1 %1426, label %1513, label %1464

; <label>:1427:                                   ; preds = %.backedge418, %.lr.ph733
  %1428 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1429 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1428, i64 0, i32 1
  %1430 = load i32, i32* %1429, align 8
  %1431 = icmp eq i32 %1430, 0
  br i1 %1431, label %.loopexit.loopexit1338, label %1432

; <label>:1432:                                   ; preds = %1427
  %1433 = load i32, i32* %1420, align 8
  %1434 = shl i32 %1433, 8
  %1435 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1428, i64 0, i32 0
  %1436 = load i8*, i8** %1435, align 8
  %1437 = load i8, i8* %1436, align 1
  %1438 = zext i8 %1437 to i32
  %1439 = or i32 %1438, %1434
  store i32 %1439, i32* %1420, align 8
  %1440 = load i32, i32* %1417, align 4
  %1441 = add nsw i32 %1440, 8
  store i32 %1441, i32* %1417, align 4
  %1442 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1443 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1442, i64 0, i32 0
  %1444 = load i8*, i8** %1443, align 8
  %1445 = getelementptr inbounds i8, i8* %1444, i64 1
  store i8* %1445, i8** %1443, align 8
  %1446 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1447 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1446, i64 0, i32 1
  %1448 = load i32, i32* %1447, align 8
  %1449 = add i32 %1448, -1
  store i32 %1449, i32* %1447, align 8
  %1450 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1451 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1450, i64 0, i32 2
  %1452 = load i32, i32* %1451, align 4
  %1453 = add i32 %1452, 1
  store i32 %1453, i32* %1451, align 4
  %1454 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1455 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1454, i64 0, i32 2
  %1456 = load i32, i32* %1455, align 4
  %1457 = icmp eq i32 %1456, 0
  br i1 %1457, label %1458, label %.backedge418

; <label>:1458:                                   ; preds = %1432
  %1459 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1454, i64 0, i32 3
  %1460 = load i32, i32* %1459, align 8
  %1461 = add i32 %1460, 1
  store i32 %1461, i32* %1459, align 8
  br label %.backedge418

.backedge418:                                     ; preds = %1458, %1432
  %1462 = load i32, i32* %1417, align 4
  %1463 = icmp sgt i32 %1462, 0
  br i1 %1463, label %._crit_edge734.loopexit, label %1427

; <label>:1464:                                   ; preds = %._crit_edge734, %11
  %.5233 = phi i32 [ %41, %11 ], [ %.4232, %._crit_edge734 ]
  %.8114 = phi i32 [ %23, %11 ], [ %.7113, %._crit_edge734 ]
  %.993 = phi i32 [ %21, %11 ], [ %.892, %._crit_edge734 ]
  %.1071 = phi i32 [ %19, %11 ], [ %.970, %._crit_edge734 ]
  %.547 = phi i32 [ %17, %11 ], [ %.446, %._crit_edge734 ]
  %.1427 = phi i32 [ %15, %11 ], [ %.1326, %._crit_edge734 ]
  %.18 = phi i32 [ %13, %11 ], [ %.17, %._crit_edge734 ]
  store i32 35, i32* %5, align 8
  %1465 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %1466 = load i32, i32* %1465, align 4
  %1467 = icmp sgt i32 %1466, 0
  br i1 %1467, label %._crit_edge729, label %.lr.ph728

.lr.ph728:                                        ; preds = %1464
  %1468 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %1476

._crit_edge729.loopexit:                          ; preds = %.backedge416
  br label %._crit_edge729

._crit_edge729:                                   ; preds = %._crit_edge729.loopexit, %1464
  %.lcssa544 = phi i32 [ %1466, %1464 ], [ %1511, %._crit_edge729.loopexit ]
  %1469 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %1470 = load i32, i32* %1469, align 8
  %1471 = add nsw i32 %.lcssa544, -1
  store i32 %1471, i32* %1465, align 4
  %1472 = shl i32 1, %1471
  %1473 = and i32 %1470, %1472
  %1474 = icmp eq i32 %1473, 0
  %.sink373 = select i1 %1474, i32 1, i32 -1
  %1475 = add nsw i32 %.sink373, %.5233
  br label %1414

; <label>:1476:                                   ; preds = %.backedge416, %.lr.ph728
  %1477 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1478 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1477, i64 0, i32 1
  %1479 = load i32, i32* %1478, align 8
  %1480 = icmp eq i32 %1479, 0
  br i1 %1480, label %.loopexit.loopexit1337, label %1481

; <label>:1481:                                   ; preds = %1476
  %1482 = load i32, i32* %1468, align 8
  %1483 = shl i32 %1482, 8
  %1484 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1477, i64 0, i32 0
  %1485 = load i8*, i8** %1484, align 8
  %1486 = load i8, i8* %1485, align 1
  %1487 = zext i8 %1486 to i32
  %1488 = or i32 %1487, %1483
  store i32 %1488, i32* %1468, align 8
  %1489 = load i32, i32* %1465, align 4
  %1490 = add nsw i32 %1489, 8
  store i32 %1490, i32* %1465, align 4
  %1491 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1492 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1491, i64 0, i32 0
  %1493 = load i8*, i8** %1492, align 8
  %1494 = getelementptr inbounds i8, i8* %1493, i64 1
  store i8* %1494, i8** %1492, align 8
  %1495 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1496 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1495, i64 0, i32 1
  %1497 = load i32, i32* %1496, align 8
  %1498 = add i32 %1497, -1
  store i32 %1498, i32* %1496, align 8
  %1499 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1500 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1499, i64 0, i32 2
  %1501 = load i32, i32* %1500, align 4
  %1502 = add i32 %1501, 1
  store i32 %1502, i32* %1500, align 4
  %1503 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1504 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1503, i64 0, i32 2
  %1505 = load i32, i32* %1504, align 4
  %1506 = icmp eq i32 %1505, 0
  br i1 %1506, label %1507, label %.backedge416

; <label>:1507:                                   ; preds = %1481
  %1508 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1503, i64 0, i32 3
  %1509 = load i32, i32* %1508, align 8
  %1510 = add i32 %1509, 1
  store i32 %1510, i32* %1508, align 8
  br label %.backedge416

.backedge416:                                     ; preds = %1507, %1481
  %1511 = load i32, i32* %1465, align 4
  %1512 = icmp sgt i32 %1511, 0
  br i1 %1512, label %._crit_edge729.loopexit, label %1476

; <label>:1513:                                   ; preds = %._crit_edge734
  %1514 = trunc i32 %.4232 to i8
  %1515 = sext i32 %.446 to i64
  %1516 = sext i32 %.17 to i64
  %1517 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 35, i64 %1515, i64 %1516
  store i8 %1514, i8* %1517, align 1
  %1518 = add nsw i32 %.17, 1
  br label %1412

; <label>:1519:                                   ; preds = %1412
  %1520 = add nsw i32 %.244, 1
  br label %.loopexit453

.preheader450:                                    ; preds = %.preheader450, %.preheader450.preheader
  %indvars.iv1104 = phi i64 [ %indvars.iv.next1105, %.preheader450 ], [ 0, %.preheader450.preheader ]
  %1521 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 36, i64 %indvars.iv1104, i64 0
  %1522 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 37, i64 %indvars.iv1104, i64 0
  %1523 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 38, i64 %indvars.iv1104, i64 0
  %1524 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 35, i64 %indvars.iv1104, i64 0
  tail call void @BZ2_hbCreateDecodeTables(i32* %1521, i32* %1522, i32* %1523, i8* %1524, i32 32, i32 0, i32 %.566) #4
  %1525 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 39, i64 %indvars.iv1104
  store i32 32, i32* %1525, align 4
  %indvars.iv.next1105 = add nuw nsw i64 %indvars.iv1104, 1
  %exitcond1107 = icmp eq i64 %indvars.iv.next1105, %wide.trip.count1106
  br i1 %exitcond1107, label %.preheader449.loopexit1347, label %.preheader450

.preheader449.loopexit:                           ; preds = %._crit_edge824.us
  br label %.preheader449

.preheader449.loopexit1347:                       ; preds = %.preheader450
  br label %.preheader449

.preheader449:                                    ; preds = %.preheader449.loopexit1347, %.preheader449.loopexit, %.preheader451
  %.648.lcssa = phi i32 [ 0, %.preheader451 ], [ %.488, %.preheader449.loopexit ], [ %.488, %.preheader449.loopexit1347 ]
  %1526 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 27
  %1527 = load i32, i32* %1526, align 8
  %1528 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 9
  %1529 = load i32, i32* %1528, align 8
  %scevgep = getelementptr %struct.DState, %struct.DState* %0, i64 0, i32 16, i64 0
  %scevgep1093 = bitcast i32* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep1093, i8 0, i64 1024, i32 4, i1 false)
  %1530 = add nsw i32 %1527, 1
  %1531 = mul nsw i32 %1529, 100000
  br label %1532

; <label>:1532:                                   ; preds = %1532, %.preheader449
  %indvars.iv1088 = phi i64 [ 15, %.preheader449 ], [ %indvars.iv.next1089, %1532 ]
  %indvars.iv1086 = phi i64 [ 4095, %.preheader449 ], [ %indvars.iv.next1087, %1532 ]
  %.0364817 = phi i32 [ 15, %.preheader449 ], [ %1584, %1532 ]
  %1533 = shl i32 %.0364817, 4
  %1534 = add i64 %indvars.iv1086, 4294967281
  %1535 = trunc i32 %1533 to i8
  %1536 = or i8 %1535, 15
  %1537 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv1086
  store i8 %1536, i8* %1537, align 1
  %indvars.iv.next1085 = add nsw i64 %indvars.iv1086, -1
  %1538 = trunc i32 %1533 to i8
  %1539 = or i8 %1538, 14
  %1540 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1085
  store i8 %1539, i8* %1540, align 1
  %indvars.iv.next1085.1 = add nsw i64 %indvars.iv1086, -2
  %1541 = trunc i32 %1533 to i8
  %1542 = or i8 %1541, 13
  %1543 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1085.1
  store i8 %1542, i8* %1543, align 1
  %indvars.iv.next1085.2 = add nsw i64 %indvars.iv1086, -3
  %1544 = trunc i32 %1533 to i8
  %1545 = or i8 %1544, 12
  %1546 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1085.2
  store i8 %1545, i8* %1546, align 1
  %indvars.iv.next1085.3 = add nsw i64 %indvars.iv1086, -4
  %1547 = trunc i32 %1533 to i8
  %1548 = or i8 %1547, 11
  %1549 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1085.3
  store i8 %1548, i8* %1549, align 1
  %indvars.iv.next1085.4 = add nsw i64 %indvars.iv1086, -5
  %1550 = trunc i32 %1533 to i8
  %1551 = or i8 %1550, 10
  %1552 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1085.4
  store i8 %1551, i8* %1552, align 1
  %indvars.iv.next1085.5 = add nsw i64 %indvars.iv1086, -6
  %1553 = trunc i32 %1533 to i8
  %1554 = or i8 %1553, 9
  %1555 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1085.5
  store i8 %1554, i8* %1555, align 1
  %indvars.iv.next1085.6 = add nsw i64 %indvars.iv1086, -7
  %1556 = trunc i32 %1533 to i8
  %1557 = or i8 %1556, 8
  %1558 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1085.6
  store i8 %1557, i8* %1558, align 1
  %indvars.iv.next1085.7 = add nsw i64 %indvars.iv1086, -8
  %1559 = trunc i32 %1533 to i8
  %1560 = or i8 %1559, 7
  %1561 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1085.7
  store i8 %1560, i8* %1561, align 1
  %indvars.iv.next1085.8 = add nsw i64 %indvars.iv1086, -9
  %1562 = trunc i32 %1533 to i8
  %1563 = or i8 %1562, 6
  %1564 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1085.8
  store i8 %1563, i8* %1564, align 1
  %indvars.iv.next1085.9 = add nsw i64 %indvars.iv1086, -10
  %1565 = trunc i32 %1533 to i8
  %1566 = or i8 %1565, 5
  %1567 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1085.9
  store i8 %1566, i8* %1567, align 1
  %indvars.iv.next1085.10 = add nsw i64 %indvars.iv1086, -11
  %1568 = trunc i32 %1533 to i8
  %1569 = or i8 %1568, 4
  %1570 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1085.10
  store i8 %1569, i8* %1570, align 1
  %indvars.iv.next1085.11 = add nsw i64 %indvars.iv1086, -12
  %1571 = trunc i32 %1533 to i8
  %1572 = or i8 %1571, 3
  %1573 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1085.11
  store i8 %1572, i8* %1573, align 1
  %indvars.iv.next1085.12 = add nsw i64 %indvars.iv1086, -13
  %1574 = trunc i32 %1533 to i8
  %1575 = or i8 %1574, 2
  %1576 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1085.12
  store i8 %1575, i8* %1576, align 1
  %indvars.iv.next1085.13 = add nsw i64 %indvars.iv1086, -14
  %1577 = trunc i32 %1533 to i8
  %1578 = or i8 %1577, 1
  %1579 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1085.13
  store i8 %1578, i8* %1579, align 1
  %indvars.iv.next1085.14 = add nsw i64 %indvars.iv1086, -15
  %1580 = trunc i32 %1533 to i8
  %1581 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1085.14
  store i8 %1580, i8* %1581, align 1
  %1582 = trunc i64 %1534 to i32
  %1583 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 32, i64 %indvars.iv1088
  store i32 %1582, i32* %1583, align 4
  %indvars.iv.next1089 = add nsw i64 %indvars.iv1088, -1
  %1584 = add nsw i32 %.0364817, -1
  %1585 = icmp sgt i64 %indvars.iv1088, 0
  %indvars.iv.next1087 = add nsw i64 %indvars.iv1086, -16
  br i1 %1585, label %1532, label %1586

; <label>:1586:                                   ; preds = %1532
  %1587 = icmp slt i32 %.3109, 1
  br i1 %1587, label %.loopexit, label %1588

; <label>:1588:                                   ; preds = %1586
  %1589 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 33, i64 0
  %1590 = load i8, i8* %1589, align 1
  %1591 = zext i8 %1590 to i32
  %1592 = zext i8 %1590 to i64
  %1593 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 39, i64 %1592
  %1594 = load i32, i32* %1593, align 4
  %1595 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 36, i64 %1592, i64 0
  %1596 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 38, i64 %1592, i64 0
  %1597 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 37, i64 %1592, i64 0
  br label %1598

; <label>:1598:                                   ; preds = %1588, %11
  %.1343 = phi i32* [ %59, %11 ], [ %1596, %1588 ]
  %.1328 = phi i32* [ %57, %11 ], [ %1597, %1588 ]
  %.1313 = phi i32* [ %55, %11 ], [ %1595, %1588 ]
  %.1298 = phi i32 [ %53, %11 ], [ %1594, %1588 ]
  %.1283 = phi i32 [ %51, %11 ], [ %1591, %1588 ]
  %.0248 = phi i32 [ %45, %11 ], [ %1594, %1588 ]
  %.7235 = phi i32 [ %41, %11 ], [ %.0228, %1588 ]
  %.0190 = phi i32 [ %35, %11 ], [ 0, %1588 ]
  %.0178 = phi i32 [ %33, %11 ], [ %1531, %1588 ]
  %.1155 = phi i32 [ %29, %11 ], [ 49, %1588 ]
  %.1140 = phi i32 [ %27, %11 ], [ 0, %1588 ]
  %.0127 = phi i32 [ %25, %11 ], [ %1530, %1588 ]
  %.9115 = phi i32 [ %23, %11 ], [ %.3109, %1588 ]
  %.1094 = phi i32 [ %21, %11 ], [ %.488, %1588 ]
  %.1172 = phi i32 [ %19, %11 ], [ %.566, %1588 ]
  %.749 = phi i32 [ %17, %11 ], [ %.648.lcssa, %1588 ]
  %.1528 = phi i32 [ %15, %11 ], [ %.922, %1588 ]
  %.21 = phi i32 [ %13, %11 ], [ 256, %1588 ]
  store i32 36, i32* %5, align 8
  %1599 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %1600 = load i32, i32* %1599, align 4
  %1601 = icmp slt i32 %1600, %.0248
  br i1 %1601, label %.lr.ph811, label %._crit_edge812

.lr.ph811:                                        ; preds = %1598
  %1602 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %1610

._crit_edge812.loopexit:                          ; preds = %.backedge447
  br label %._crit_edge812

._crit_edge812:                                   ; preds = %._crit_edge812.loopexit, %1598
  %.lcssa586 = phi i32 [ %1600, %1598 ], [ %1645, %._crit_edge812.loopexit ]
  %1603 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %1604 = load i32, i32* %1603, align 8
  %1605 = sub nsw i32 %.lcssa586, %.0248
  store i32 %1605, i32* %1599, align 4
  %1606 = lshr i32 %1604, %1605
  %1607 = shl i32 1, %.0248
  %1608 = add nsw i32 %1607, -1
  %1609 = and i32 %1606, %1608
  br label %1647

; <label>:1610:                                   ; preds = %.backedge447, %.lr.ph811
  %1611 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1612 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1611, i64 0, i32 1
  %1613 = load i32, i32* %1612, align 8
  %1614 = icmp eq i32 %1613, 0
  br i1 %1614, label %.loopexit.loopexit1346, label %1615

; <label>:1615:                                   ; preds = %1610
  %1616 = load i32, i32* %1602, align 8
  %1617 = shl i32 %1616, 8
  %1618 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1611, i64 0, i32 0
  %1619 = load i8*, i8** %1618, align 8
  %1620 = load i8, i8* %1619, align 1
  %1621 = zext i8 %1620 to i32
  %1622 = or i32 %1621, %1617
  store i32 %1622, i32* %1602, align 8
  %1623 = load i32, i32* %1599, align 4
  %1624 = add nsw i32 %1623, 8
  store i32 %1624, i32* %1599, align 4
  %1625 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1626 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1625, i64 0, i32 0
  %1627 = load i8*, i8** %1626, align 8
  %1628 = getelementptr inbounds i8, i8* %1627, i64 1
  store i8* %1628, i8** %1626, align 8
  %1629 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1630 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1629, i64 0, i32 1
  %1631 = load i32, i32* %1630, align 8
  %1632 = add i32 %1631, -1
  store i32 %1632, i32* %1630, align 8
  %1633 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1634 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1633, i64 0, i32 2
  %1635 = load i32, i32* %1634, align 4
  %1636 = add i32 %1635, 1
  store i32 %1636, i32* %1634, align 4
  %1637 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1638 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1637, i64 0, i32 2
  %1639 = load i32, i32* %1638, align 4
  %1640 = icmp eq i32 %1639, 0
  br i1 %1640, label %1641, label %.backedge447

; <label>:1641:                                   ; preds = %1615
  %1642 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1637, i64 0, i32 3
  %1643 = load i32, i32* %1642, align 8
  %1644 = add i32 %1643, 1
  store i32 %1644, i32* %1642, align 8
  br label %.backedge447

.backedge447:                                     ; preds = %1641, %1615
  %1645 = load i32, i32* %1599, align 4
  %1646 = icmp slt i32 %1645, %.0248
  br i1 %1646, label %1610, label %._crit_edge812.loopexit

; <label>:1647:                                   ; preds = %._crit_edge744, %._crit_edge812
  %.2344 = phi i32* [ %.3345, %._crit_edge744 ], [ %.1343, %._crit_edge812 ]
  %.2329 = phi i32* [ %.3330, %._crit_edge744 ], [ %.1328, %._crit_edge812 ]
  %.2314 = phi i32* [ %.3315, %._crit_edge744 ], [ %.1313, %._crit_edge812 ]
  %.2299 = phi i32 [ %.3300, %._crit_edge744 ], [ %.1298, %._crit_edge812 ]
  %.2284 = phi i32 [ %.3285, %._crit_edge744 ], [ %.1283, %._crit_edge812 ]
  %.0271 = phi i32 [ %1665, %._crit_edge744 ], [ %49, %._crit_edge812 ]
  %.0260 = phi i32 [ %1667, %._crit_edge744 ], [ %1609, %._crit_edge812 ]
  %.1249 = phi i32 [ %.2250, %._crit_edge744 ], [ %.0248, %._crit_edge812 ]
  %.8236 = phi i32 [ %.9237, %._crit_edge744 ], [ %.7235, %._crit_edge812 ]
  %.1191 = phi i32 [ %.2192, %._crit_edge744 ], [ %.0190, %._crit_edge812 ]
  %.1179 = phi i32 [ %.2180, %._crit_edge744 ], [ %.0178, %._crit_edge812 ]
  %.2156 = phi i32 [ %.3157, %._crit_edge744 ], [ %.1155, %._crit_edge812 ]
  %.2141 = phi i32 [ %.3142, %._crit_edge744 ], [ %.1140, %._crit_edge812 ]
  %.1128 = phi i32 [ %.2129, %._crit_edge744 ], [ %.0127, %._crit_edge812 ]
  %.10116 = phi i32 [ %.11117, %._crit_edge744 ], [ %.9115, %._crit_edge812 ]
  %.1195 = phi i32 [ %.1296, %._crit_edge744 ], [ %.1094, %._crit_edge812 ]
  %.1273 = phi i32 [ %.1374, %._crit_edge744 ], [ %.1172, %._crit_edge812 ]
  %.850 = phi i32 [ %.951, %._crit_edge744 ], [ %.749, %._crit_edge812 ]
  %.1629 = phi i32 [ %.1730, %._crit_edge744 ], [ %.1528, %._crit_edge812 ]
  %.22 = phi i32 [ %.23, %._crit_edge744 ], [ %.21, %._crit_edge812 ]
  %1648 = icmp sgt i32 %.1249, 20
  br i1 %1648, label %.loopexit, label %1649

; <label>:1649:                                   ; preds = %1647
  %1650 = sext i32 %.1249 to i64
  %1651 = getelementptr inbounds i32, i32* %.2314, i64 %1650
  %1652 = load i32, i32* %1651, align 4
  %1653 = icmp sgt i32 %.0260, %1652
  br i1 %1653, label %1654, label %1705

; <label>:1654:                                   ; preds = %1649
  %1655 = add nsw i32 %.1249, 1
  br label %1656

; <label>:1656:                                   ; preds = %1654, %11
  %.3345 = phi i32* [ %59, %11 ], [ %.2344, %1654 ]
  %.3330 = phi i32* [ %57, %11 ], [ %.2329, %1654 ]
  %.3315 = phi i32* [ %55, %11 ], [ %.2314, %1654 ]
  %.3300 = phi i32 [ %53, %11 ], [ %.2299, %1654 ]
  %.3285 = phi i32 [ %51, %11 ], [ %.2284, %1654 ]
  %.1272 = phi i32 [ %49, %11 ], [ %.0271, %1654 ]
  %.1261 = phi i32 [ %47, %11 ], [ %.0260, %1654 ]
  %.2250 = phi i32 [ %45, %11 ], [ %1655, %1654 ]
  %.9237 = phi i32 [ %41, %11 ], [ %.8236, %1654 ]
  %.2192 = phi i32 [ %35, %11 ], [ %.1191, %1654 ]
  %.2180 = phi i32 [ %33, %11 ], [ %.1179, %1654 ]
  %.3157 = phi i32 [ %29, %11 ], [ %.2156, %1654 ]
  %.3142 = phi i32 [ %27, %11 ], [ %.2141, %1654 ]
  %.2129 = phi i32 [ %25, %11 ], [ %.1128, %1654 ]
  %.11117 = phi i32 [ %23, %11 ], [ %.10116, %1654 ]
  %.1296 = phi i32 [ %21, %11 ], [ %.1195, %1654 ]
  %.1374 = phi i32 [ %19, %11 ], [ %.1273, %1654 ]
  %.951 = phi i32 [ %17, %11 ], [ %.850, %1654 ]
  %.1730 = phi i32 [ %15, %11 ], [ %.1629, %1654 ]
  %.23 = phi i32 [ %13, %11 ], [ %.22, %1654 ]
  store i32 37, i32* %5, align 8
  %1657 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %1658 = load i32, i32* %1657, align 4
  %1659 = icmp sgt i32 %1658, 0
  br i1 %1659, label %._crit_edge744, label %.lr.ph743

.lr.ph743:                                        ; preds = %1656
  %1660 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %1668

._crit_edge744.loopexit:                          ; preds = %.backedge422
  br label %._crit_edge744

._crit_edge744:                                   ; preds = %._crit_edge744.loopexit, %1656
  %.lcssa556 = phi i32 [ %1658, %1656 ], [ %1703, %._crit_edge744.loopexit ]
  %1661 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %1662 = load i32, i32* %1661, align 8
  %1663 = add nsw i32 %.lcssa556, -1
  %1664 = lshr i32 %1662, %1663
  %1665 = and i32 %1664, 1
  store i32 %1663, i32* %1657, align 4
  %1666 = shl i32 %.1261, 1
  %1667 = or i32 %1665, %1666
  br label %1647

; <label>:1668:                                   ; preds = %.backedge422, %.lr.ph743
  %1669 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1670 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1669, i64 0, i32 1
  %1671 = load i32, i32* %1670, align 8
  %1672 = icmp eq i32 %1671, 0
  br i1 %1672, label %.loopexit.loopexit1340, label %1673

; <label>:1673:                                   ; preds = %1668
  %1674 = load i32, i32* %1660, align 8
  %1675 = shl i32 %1674, 8
  %1676 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1669, i64 0, i32 0
  %1677 = load i8*, i8** %1676, align 8
  %1678 = load i8, i8* %1677, align 1
  %1679 = zext i8 %1678 to i32
  %1680 = or i32 %1679, %1675
  store i32 %1680, i32* %1660, align 8
  %1681 = load i32, i32* %1657, align 4
  %1682 = add nsw i32 %1681, 8
  store i32 %1682, i32* %1657, align 4
  %1683 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1684 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1683, i64 0, i32 0
  %1685 = load i8*, i8** %1684, align 8
  %1686 = getelementptr inbounds i8, i8* %1685, i64 1
  store i8* %1686, i8** %1684, align 8
  %1687 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1688 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1687, i64 0, i32 1
  %1689 = load i32, i32* %1688, align 8
  %1690 = add i32 %1689, -1
  store i32 %1690, i32* %1688, align 8
  %1691 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1692 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1691, i64 0, i32 2
  %1693 = load i32, i32* %1692, align 4
  %1694 = add i32 %1693, 1
  store i32 %1694, i32* %1692, align 4
  %1695 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1696 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1695, i64 0, i32 2
  %1697 = load i32, i32* %1696, align 4
  %1698 = icmp eq i32 %1697, 0
  br i1 %1698, label %1699, label %.backedge422

; <label>:1699:                                   ; preds = %1673
  %1700 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1695, i64 0, i32 3
  %1701 = load i32, i32* %1700, align 8
  %1702 = add i32 %1701, 1
  store i32 %1702, i32* %1700, align 8
  br label %.backedge422

.backedge422:                                     ; preds = %1699, %1673
  %1703 = load i32, i32* %1657, align 4
  %1704 = icmp sgt i32 %1703, 0
  br i1 %1704, label %._crit_edge744.loopexit, label %1668

; <label>:1705:                                   ; preds = %1649
  %1706 = getelementptr inbounds i32, i32* %.2329, i64 %1650
  %1707 = load i32, i32* %1706, align 4
  %1708 = icmp slt i32 %.0260, %1707
  br i1 %1708, label %.loopexit, label %1709

; <label>:1709:                                   ; preds = %1705
  %1710 = sub nsw i32 %.0260, %1707
  %1711 = icmp sgt i32 %1710, 257
  br i1 %1711, label %.loopexit, label %1712

; <label>:1712:                                   ; preds = %1709
  %1713 = sext i32 %1710 to i64
  %1714 = getelementptr inbounds i32, i32* %.2344, i64 %1713
  %1715 = load i32, i32* %1714, align 4
  br label %.loopexit431

.loopexit431.loopexit:                            ; preds = %1900
  %1716 = trunc i64 %indvars.iv.next1067 to i32
  br label %.loopexit431

.loopexit431.loopexit960:                         ; preds = %1893
  %1717 = trunc i64 %indvars.iv.next1069 to i32
  br label %.loopexit431

.loopexit431:                                     ; preds = %2286, %.preheader430, %.preheader433, %.loopexit431.loopexit960, %.loopexit431.loopexit, %1712
  %.4346 = phi i32* [ %.12354, %2286 ], [ %.2344, %1712 ], [ %.8350, %.preheader430 ], [ %.8350, %.preheader433 ], [ %.8350, %.loopexit431.loopexit ], [ %.8350, %.loopexit431.loopexit960 ]
  %.4331 = phi i32* [ %.12339, %2286 ], [ %.2329, %1712 ], [ %.8335, %.preheader430 ], [ %.8335, %.preheader433 ], [ %.8335, %.loopexit431.loopexit ], [ %.8335, %.loopexit431.loopexit960 ]
  %.4316 = phi i32* [ %.12324, %2286 ], [ %.2314, %1712 ], [ %.8320, %.preheader430 ], [ %.8320, %.preheader433 ], [ %.8320, %.loopexit431.loopexit ], [ %.8320, %.loopexit431.loopexit960 ]
  %.4301 = phi i32 [ %.12309, %2286 ], [ %.2299, %1712 ], [ %.8305, %.preheader430 ], [ %.8305, %.preheader433 ], [ %.8305, %.loopexit431.loopexit ], [ %.8305, %.loopexit431.loopexit960 ]
  %.4286 = phi i32 [ %.12294, %2286 ], [ %.2284, %1712 ], [ %.8290, %.preheader430 ], [ %.8290, %.preheader433 ], [ %.8290, %.loopexit431.loopexit ], [ %.8290, %.loopexit431.loopexit960 ]
  %.2273 = phi i32 [ %.8279, %2286 ], [ %.0271, %1712 ], [ %.5276, %.preheader430 ], [ %.5276, %.preheader433 ], [ %.5276, %.loopexit431.loopexit ], [ %.5276, %.loopexit431.loopexit960 ]
  %.2262 = phi i32 [ %.8268, %2286 ], [ %.0260, %1712 ], [ %.5265, %.preheader430 ], [ %.5265, %.preheader433 ], [ %.5265, %.loopexit431.loopexit ], [ %.5265, %.loopexit431.loopexit960 ]
  %.3251 = phi i32 [ %.9257, %2286 ], [ %.1249, %1712 ], [ %.6254, %.preheader430 ], [ %.6254, %.preheader433 ], [ %.6254, %.loopexit431.loopexit ], [ %.6254, %.loopexit431.loopexit960 ]
  %.10238 = phi i32 [ %.16244, %2286 ], [ %.8236, %1712 ], [ %.13241, %.preheader430 ], [ %.13241, %.preheader433 ], [ %.13241, %.loopexit431.loopexit ], [ %.13241, %.loopexit431.loopexit960 ]
  %.0219 = phi i32 [ %.6225, %2286 ], [ %39, %1712 ], [ %.3222, %.preheader430 ], [ %.3222, %.preheader433 ], [ %.3222, %.loopexit431.loopexit ], [ %.3222, %.loopexit431.loopexit960 ]
  %.0205 = phi i32 [ %.11216, %2286 ], [ %37, %1712 ], [ %1866, %.preheader430 ], [ %1866, %.preheader433 ], [ %1903, %.loopexit431.loopexit ], [ %1896, %.loopexit431.loopexit960 ]
  %.3193 = phi i32 [ %.12202, %2286 ], [ %.1191, %1712 ], [ %.6196, %.preheader430 ], [ %.6196, %.preheader433 ], [ %1716, %.loopexit431.loopexit ], [ %1717, %.loopexit431.loopexit960 ]
  %.3181 = phi i32 [ %.9187, %2286 ], [ %.1179, %1712 ], [ %.6184, %.preheader430 ], [ %.6184, %.preheader433 ], [ %.6184, %.loopexit431.loopexit ], [ %.6184, %.loopexit431.loopexit960 ]
  %.0169 = phi i32 [ %2289, %2286 ], [ %1715, %1712 ], [ %1862, %.preheader430 ], [ %1862, %.preheader433 ], [ %1862, %.loopexit431.loopexit ], [ %1862, %.loopexit431.loopexit960 ]
  %.4158 = phi i32 [ %.12166, %2286 ], [ %.2156, %1712 ], [ %.8162, %.preheader430 ], [ %.8162, %.preheader433 ], [ %.8162, %.loopexit431.loopexit ], [ %.8162, %.loopexit431.loopexit960 ]
  %.4143 = phi i32 [ %.12151, %2286 ], [ %.2141, %1712 ], [ %.8147, %.preheader430 ], [ %.8147, %.preheader433 ], [ %.8147, %.loopexit431.loopexit ], [ %.8147, %.loopexit431.loopexit960 ]
  %.3130 = phi i32 [ %.9136, %2286 ], [ %.1128, %1712 ], [ %.6133, %.preheader430 ], [ %.6133, %.preheader433 ], [ %.6133, %.loopexit431.loopexit ], [ %.6133, %.loopexit431.loopexit960 ]
  %.12118 = phi i32 [ %.18124, %2286 ], [ %.10116, %1712 ], [ %.15121, %.preheader430 ], [ %.15121, %.preheader433 ], [ %.15121, %.loopexit431.loopexit ], [ %.15121, %.loopexit431.loopexit960 ]
  %.1397 = phi i32 [ %.19103, %2286 ], [ %.1195, %1712 ], [ %.16100, %.preheader430 ], [ %.16100, %.preheader433 ], [ %.16100, %.loopexit431.loopexit ], [ %.16100, %.loopexit431.loopexit960 ]
  %.1475 = phi i32 [ %.2081, %2286 ], [ %.1273, %1712 ], [ %.1778, %.preheader430 ], [ %.1778, %.preheader433 ], [ %.1778, %.loopexit431.loopexit ], [ %.1778, %.loopexit431.loopexit960 ]
  %.1052 = phi i32 [ %.1658, %2286 ], [ %.850, %1712 ], [ %.1355, %.preheader430 ], [ %.1355, %.preheader433 ], [ %.1355, %.loopexit431.loopexit ], [ %.1355, %.loopexit431.loopexit960 ]
  %.1831 = phi i32 [ %.2437, %2286 ], [ %.1629, %1712 ], [ %.2134, %.preheader430 ], [ %.2134, %.preheader433 ], [ %.2134, %.loopexit431.loopexit ], [ %.2134, %.loopexit431.loopexit960 ]
  %.24 = phi i32 [ %.30, %2286 ], [ %.22, %1712 ], [ %.27, %.preheader430 ], [ %.27, %.preheader433 ], [ %.27, %.loopexit431.loopexit ], [ %.27, %.loopexit431.loopexit960 ]
  %1718 = icmp eq i32 %.0169, %.3130
  br i1 %1718, label %2290, label %1719

; <label>:1719:                                   ; preds = %.loopexit431
  %switch = icmp ult i32 %.0169, 2
  br i1 %switch, label %1720, label %1905

; <label>:1720:                                   ; preds = %1859, %1719
  %.5347 = phi i32* [ %.8350, %1859 ], [ %.4346, %1719 ]
  %.5332 = phi i32* [ %.8335, %1859 ], [ %.4331, %1719 ]
  %.5317 = phi i32* [ %.8320, %1859 ], [ %.4316, %1719 ]
  %.5302 = phi i32 [ %.8305, %1859 ], [ %.4301, %1719 ]
  %.5287 = phi i32 [ %.8290, %1859 ], [ %.4286, %1719 ]
  %.3274 = phi i32 [ %.5276, %1859 ], [ %.2273, %1719 ]
  %.3263 = phi i32 [ %.5265, %1859 ], [ %.2262, %1719 ]
  %.4252 = phi i32 [ %.6254, %1859 ], [ %.3251, %1719 ]
  %.11239 = phi i32 [ %.13241, %1859 ], [ %.10238, %1719 ]
  %.1220 = phi i32 [ %.3222, %1859 ], [ 1, %1719 ]
  %.1206 = phi i32 [ %.5210, %1859 ], [ -1, %1719 ]
  %.4194 = phi i32 [ %.6196, %1859 ], [ %.3193, %1719 ]
  %.4182 = phi i32 [ %.6184, %1859 ], [ %.3181, %1719 ]
  %.1170 = phi i32 [ %1862, %1859 ], [ %.0169, %1719 ]
  %.5159 = phi i32 [ %.8162, %1859 ], [ %.4158, %1719 ]
  %.5144 = phi i32 [ %.8147, %1859 ], [ %.4143, %1719 ]
  %.4131 = phi i32 [ %.6133, %1859 ], [ %.3130, %1719 ]
  %.13119 = phi i32 [ %.15121, %1859 ], [ %.12118, %1719 ]
  %.1498 = phi i32 [ %.16100, %1859 ], [ %.1397, %1719 ]
  %.1576 = phi i32 [ %.1778, %1859 ], [ %.1475, %1719 ]
  %.1153 = phi i32 [ %.1355, %1859 ], [ %.1052, %1719 ]
  %.1932 = phi i32 [ %.2134, %1859 ], [ %.1831, %1719 ]
  %.25 = phi i32 [ %.27, %1859 ], [ %.24, %1719 ]
  switch i32 %.1170, label %1726 [
    i32 0, label %1721
    i32 1, label %1723
  ]

; <label>:1721:                                   ; preds = %1720
  %1722 = add nsw i32 %.1206, %.1220
  br label %1726

; <label>:1723:                                   ; preds = %1720
  %1724 = shl i32 %.1220, 1
  %1725 = add nsw i32 %.1206, %1724
  br label %1726

; <label>:1726:                                   ; preds = %1723, %1721, %1720
  %.3208 = phi i32 [ %1722, %1721 ], [ %1725, %1723 ], [ %.1206, %1720 ]
  %1727 = shl nsw i32 %.1220, 1
  %1728 = icmp eq i32 %.5159, 0
  br i1 %1728, label %1729, label %1743

; <label>:1729:                                   ; preds = %1726
  %1730 = add nsw i32 %.5144, 1
  %1731 = icmp slt i32 %1730, %.13119
  br i1 %1731, label %1732, label %.loopexit

; <label>:1732:                                   ; preds = %1729
  %1733 = sext i32 %1730 to i64
  %1734 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 33, i64 %1733
  %1735 = load i8, i8* %1734, align 1
  %1736 = zext i8 %1735 to i32
  %1737 = zext i8 %1735 to i64
  %1738 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 39, i64 %1737
  %1739 = load i32, i32* %1738, align 4
  %1740 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 36, i64 %1737, i64 0
  %1741 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 38, i64 %1737, i64 0
  %1742 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 37, i64 %1737, i64 0
  br label %1743

; <label>:1743:                                   ; preds = %1732, %1726
  %.6348 = phi i32* [ %1741, %1732 ], [ %.5347, %1726 ]
  %.6333 = phi i32* [ %1742, %1732 ], [ %.5332, %1726 ]
  %.6318 = phi i32* [ %1740, %1732 ], [ %.5317, %1726 ]
  %.6303 = phi i32 [ %1739, %1732 ], [ %.5302, %1726 ]
  %.6288 = phi i32 [ %1736, %1732 ], [ %.5287, %1726 ]
  %.6160 = phi i32 [ 50, %1732 ], [ %.5159, %1726 ]
  %.6145 = phi i32 [ %1730, %1732 ], [ %.5144, %1726 ]
  %1744 = add nsw i32 %.6160, -1
  br label %1745

; <label>:1745:                                   ; preds = %1743, %11
  %.7349 = phi i32* [ %.6348, %1743 ], [ %59, %11 ]
  %.7334 = phi i32* [ %.6333, %1743 ], [ %57, %11 ]
  %.7319 = phi i32* [ %.6318, %1743 ], [ %55, %11 ]
  %.7304 = phi i32 [ %.6303, %1743 ], [ %53, %11 ]
  %.7289 = phi i32 [ %.6288, %1743 ], [ %51, %11 ]
  %.4275 = phi i32 [ %.3274, %1743 ], [ %49, %11 ]
  %.4264 = phi i32 [ %.3263, %1743 ], [ %47, %11 ]
  %.5253 = phi i32 [ %.6303, %1743 ], [ %45, %11 ]
  %.12240 = phi i32 [ %.11239, %1743 ], [ %41, %11 ]
  %.2221 = phi i32 [ %1727, %1743 ], [ %39, %11 ]
  %.4209 = phi i32 [ %.3208, %1743 ], [ %37, %11 ]
  %.5195 = phi i32 [ %.4194, %1743 ], [ %35, %11 ]
  %.5183 = phi i32 [ %.4182, %1743 ], [ %33, %11 ]
  %.2171 = phi i32 [ %.1170, %1743 ], [ %31, %11 ]
  %.7161 = phi i32 [ %1744, %1743 ], [ %29, %11 ]
  %.7146 = phi i32 [ %.6145, %1743 ], [ %27, %11 ]
  %.5132 = phi i32 [ %.4131, %1743 ], [ %25, %11 ]
  %.14120 = phi i32 [ %.13119, %1743 ], [ %23, %11 ]
  %.1599 = phi i32 [ %.1498, %1743 ], [ %21, %11 ]
  %.1677 = phi i32 [ %.1576, %1743 ], [ %19, %11 ]
  %.1254 = phi i32 [ %.1153, %1743 ], [ %17, %11 ]
  %.2033 = phi i32 [ %.1932, %1743 ], [ %15, %11 ]
  %.26 = phi i32 [ %.25, %1743 ], [ %13, %11 ]
  store i32 38, i32* %5, align 8
  %1746 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %1747 = load i32, i32* %1746, align 4
  %1748 = icmp slt i32 %1747, %.5253
  br i1 %1748, label %.lr.ph776, label %._crit_edge777

.lr.ph776:                                        ; preds = %1745
  %1749 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %1757

._crit_edge777.loopexit:                          ; preds = %.backedge437
  br label %._crit_edge777

._crit_edge777:                                   ; preds = %._crit_edge777.loopexit, %1745
  %.lcssa573 = phi i32 [ %1747, %1745 ], [ %1792, %._crit_edge777.loopexit ]
  %1750 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %1751 = load i32, i32* %1750, align 8
  %1752 = sub nsw i32 %.lcssa573, %.5253
  store i32 %1752, i32* %1746, align 4
  %1753 = lshr i32 %1751, %1752
  %1754 = shl i32 1, %.5253
  %1755 = add nsw i32 %1754, -1
  %1756 = and i32 %1753, %1755
  br label %1794

; <label>:1757:                                   ; preds = %.backedge437, %.lr.ph776
  %1758 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1759 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1758, i64 0, i32 1
  %1760 = load i32, i32* %1759, align 8
  %1761 = icmp eq i32 %1760, 0
  br i1 %1761, label %.loopexit.loopexit1342, label %1762

; <label>:1762:                                   ; preds = %1757
  %1763 = load i32, i32* %1749, align 8
  %1764 = shl i32 %1763, 8
  %1765 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1758, i64 0, i32 0
  %1766 = load i8*, i8** %1765, align 8
  %1767 = load i8, i8* %1766, align 1
  %1768 = zext i8 %1767 to i32
  %1769 = or i32 %1768, %1764
  store i32 %1769, i32* %1749, align 8
  %1770 = load i32, i32* %1746, align 4
  %1771 = add nsw i32 %1770, 8
  store i32 %1771, i32* %1746, align 4
  %1772 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1773 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1772, i64 0, i32 0
  %1774 = load i8*, i8** %1773, align 8
  %1775 = getelementptr inbounds i8, i8* %1774, i64 1
  store i8* %1775, i8** %1773, align 8
  %1776 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1777 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1776, i64 0, i32 1
  %1778 = load i32, i32* %1777, align 8
  %1779 = add i32 %1778, -1
  store i32 %1779, i32* %1777, align 8
  %1780 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1781 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1780, i64 0, i32 2
  %1782 = load i32, i32* %1781, align 4
  %1783 = add i32 %1782, 1
  store i32 %1783, i32* %1781, align 4
  %1784 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1785 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1784, i64 0, i32 2
  %1786 = load i32, i32* %1785, align 4
  %1787 = icmp eq i32 %1786, 0
  br i1 %1787, label %1788, label %.backedge437

; <label>:1788:                                   ; preds = %1762
  %1789 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1784, i64 0, i32 3
  %1790 = load i32, i32* %1789, align 8
  %1791 = add i32 %1790, 1
  store i32 %1791, i32* %1789, align 8
  br label %.backedge437

.backedge437:                                     ; preds = %1788, %1762
  %1792 = load i32, i32* %1746, align 4
  %1793 = icmp slt i32 %1792, %.5253
  br i1 %1793, label %1757, label %._crit_edge777.loopexit

; <label>:1794:                                   ; preds = %._crit_edge762, %._crit_edge777
  %.8350 = phi i32* [ %.7349, %._crit_edge777 ], [ %.9351, %._crit_edge762 ]
  %.8335 = phi i32* [ %.7334, %._crit_edge777 ], [ %.9336, %._crit_edge762 ]
  %.8320 = phi i32* [ %.7319, %._crit_edge777 ], [ %.9321, %._crit_edge762 ]
  %.8305 = phi i32 [ %.7304, %._crit_edge777 ], [ %.9306, %._crit_edge762 ]
  %.8290 = phi i32 [ %.7289, %._crit_edge777 ], [ %.9291, %._crit_edge762 ]
  %.5276 = phi i32 [ %.4275, %._crit_edge777 ], [ %1812, %._crit_edge762 ]
  %.5265 = phi i32 [ %1756, %._crit_edge777 ], [ %1814, %._crit_edge762 ]
  %.6254 = phi i32 [ %.5253, %._crit_edge777 ], [ %.7255, %._crit_edge762 ]
  %.13241 = phi i32 [ %.12240, %._crit_edge777 ], [ %.14242, %._crit_edge762 ]
  %.3222 = phi i32 [ %.2221, %._crit_edge777 ], [ %.4223, %._crit_edge762 ]
  %.5210 = phi i32 [ %.4209, %._crit_edge777 ], [ %.6211, %._crit_edge762 ]
  %.6196 = phi i32 [ %.5195, %._crit_edge777 ], [ %.7197, %._crit_edge762 ]
  %.6184 = phi i32 [ %.5183, %._crit_edge777 ], [ %.7185, %._crit_edge762 ]
  %.3172 = phi i32 [ %.2171, %._crit_edge777 ], [ %.4173, %._crit_edge762 ]
  %.8162 = phi i32 [ %.7161, %._crit_edge777 ], [ %.9163, %._crit_edge762 ]
  %.8147 = phi i32 [ %.7146, %._crit_edge777 ], [ %.9148, %._crit_edge762 ]
  %.6133 = phi i32 [ %.5132, %._crit_edge777 ], [ %.7134, %._crit_edge762 ]
  %.15121 = phi i32 [ %.14120, %._crit_edge777 ], [ %.16122, %._crit_edge762 ]
  %.16100 = phi i32 [ %.1599, %._crit_edge777 ], [ %.17101, %._crit_edge762 ]
  %.1778 = phi i32 [ %.1677, %._crit_edge777 ], [ %.1879, %._crit_edge762 ]
  %.1355 = phi i32 [ %.1254, %._crit_edge777 ], [ %.1456, %._crit_edge762 ]
  %.2134 = phi i32 [ %.2033, %._crit_edge777 ], [ %.2235, %._crit_edge762 ]
  %.27 = phi i32 [ %.26, %._crit_edge777 ], [ %.28, %._crit_edge762 ]
  %1795 = icmp sgt i32 %.6254, 20
  br i1 %1795, label %.loopexit, label %1796

; <label>:1796:                                   ; preds = %1794
  %1797 = sext i32 %.6254 to i64
  %1798 = getelementptr inbounds i32, i32* %.8320, i64 %1797
  %1799 = load i32, i32* %1798, align 4
  %1800 = icmp sgt i32 %.5265, %1799
  br i1 %1800, label %1801, label %1852

; <label>:1801:                                   ; preds = %1796
  %1802 = add nsw i32 %.6254, 1
  br label %1803

; <label>:1803:                                   ; preds = %1801, %11
  %.9351 = phi i32* [ %.8350, %1801 ], [ %59, %11 ]
  %.9336 = phi i32* [ %.8335, %1801 ], [ %57, %11 ]
  %.9321 = phi i32* [ %.8320, %1801 ], [ %55, %11 ]
  %.9306 = phi i32 [ %.8305, %1801 ], [ %53, %11 ]
  %.9291 = phi i32 [ %.8290, %1801 ], [ %51, %11 ]
  %.6277 = phi i32 [ %.5276, %1801 ], [ %49, %11 ]
  %.6266 = phi i32 [ %.5265, %1801 ], [ %47, %11 ]
  %.7255 = phi i32 [ %1802, %1801 ], [ %45, %11 ]
  %.14242 = phi i32 [ %.13241, %1801 ], [ %41, %11 ]
  %.4223 = phi i32 [ %.3222, %1801 ], [ %39, %11 ]
  %.6211 = phi i32 [ %.5210, %1801 ], [ %37, %11 ]
  %.7197 = phi i32 [ %.6196, %1801 ], [ %35, %11 ]
  %.7185 = phi i32 [ %.6184, %1801 ], [ %33, %11 ]
  %.4173 = phi i32 [ %.3172, %1801 ], [ %31, %11 ]
  %.9163 = phi i32 [ %.8162, %1801 ], [ %29, %11 ]
  %.9148 = phi i32 [ %.8147, %1801 ], [ %27, %11 ]
  %.7134 = phi i32 [ %.6133, %1801 ], [ %25, %11 ]
  %.16122 = phi i32 [ %.15121, %1801 ], [ %23, %11 ]
  %.17101 = phi i32 [ %.16100, %1801 ], [ %21, %11 ]
  %.1879 = phi i32 [ %.1778, %1801 ], [ %19, %11 ]
  %.1456 = phi i32 [ %.1355, %1801 ], [ %17, %11 ]
  %.2235 = phi i32 [ %.2134, %1801 ], [ %15, %11 ]
  %.28 = phi i32 [ %.27, %1801 ], [ %13, %11 ]
  store i32 39, i32* %5, align 8
  %1804 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %1805 = load i32, i32* %1804, align 4
  %1806 = icmp sgt i32 %1805, 0
  br i1 %1806, label %._crit_edge762, label %.lr.ph761

.lr.ph761:                                        ; preds = %1803
  %1807 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %1815

._crit_edge762.loopexit:                          ; preds = %.backedge429
  br label %._crit_edge762

._crit_edge762:                                   ; preds = %._crit_edge762.loopexit, %1803
  %.lcssa565 = phi i32 [ %1805, %1803 ], [ %1850, %._crit_edge762.loopexit ]
  %1808 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %1809 = load i32, i32* %1808, align 8
  %1810 = add nsw i32 %.lcssa565, -1
  %1811 = lshr i32 %1809, %1810
  %1812 = and i32 %1811, 1
  store i32 %1810, i32* %1804, align 4
  %1813 = shl i32 %.6266, 1
  %1814 = or i32 %1812, %1813
  br label %1794

; <label>:1815:                                   ; preds = %.backedge429, %.lr.ph761
  %1816 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1817 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1816, i64 0, i32 1
  %1818 = load i32, i32* %1817, align 8
  %1819 = icmp eq i32 %1818, 0
  br i1 %1819, label %.loopexit.loopexit1341, label %1820

; <label>:1820:                                   ; preds = %1815
  %1821 = load i32, i32* %1807, align 8
  %1822 = shl i32 %1821, 8
  %1823 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1816, i64 0, i32 0
  %1824 = load i8*, i8** %1823, align 8
  %1825 = load i8, i8* %1824, align 1
  %1826 = zext i8 %1825 to i32
  %1827 = or i32 %1826, %1822
  store i32 %1827, i32* %1807, align 8
  %1828 = load i32, i32* %1804, align 4
  %1829 = add nsw i32 %1828, 8
  store i32 %1829, i32* %1804, align 4
  %1830 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1831 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1830, i64 0, i32 0
  %1832 = load i8*, i8** %1831, align 8
  %1833 = getelementptr inbounds i8, i8* %1832, i64 1
  store i8* %1833, i8** %1831, align 8
  %1834 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1835 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1834, i64 0, i32 1
  %1836 = load i32, i32* %1835, align 8
  %1837 = add i32 %1836, -1
  store i32 %1837, i32* %1835, align 8
  %1838 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1839 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1838, i64 0, i32 2
  %1840 = load i32, i32* %1839, align 4
  %1841 = add i32 %1840, 1
  store i32 %1841, i32* %1839, align 4
  %1842 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %1843 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1842, i64 0, i32 2
  %1844 = load i32, i32* %1843, align 4
  %1845 = icmp eq i32 %1844, 0
  br i1 %1845, label %1846, label %.backedge429

; <label>:1846:                                   ; preds = %1820
  %1847 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1842, i64 0, i32 3
  %1848 = load i32, i32* %1847, align 8
  %1849 = add i32 %1848, 1
  store i32 %1849, i32* %1847, align 8
  br label %.backedge429

.backedge429:                                     ; preds = %1846, %1820
  %1850 = load i32, i32* %1804, align 4
  %1851 = icmp sgt i32 %1850, 0
  br i1 %1851, label %._crit_edge762.loopexit, label %1815

; <label>:1852:                                   ; preds = %1796
  %1853 = getelementptr inbounds i32, i32* %.8335, i64 %1797
  %1854 = load i32, i32* %1853, align 4
  %1855 = icmp slt i32 %.5265, %1854
  br i1 %1855, label %.loopexit, label %1856

; <label>:1856:                                   ; preds = %1852
  %1857 = sub nsw i32 %.5265, %1854
  %1858 = icmp sgt i32 %1857, 257
  br i1 %1858, label %.loopexit, label %1859

; <label>:1859:                                   ; preds = %1856
  %1860 = sext i32 %1857 to i64
  %1861 = getelementptr inbounds i32, i32* %.8350, i64 %1860
  %1862 = load i32, i32* %1861, align 4
  %1863 = or i32 %1862, 1
  %1864 = icmp eq i32 %1863, 1
  br i1 %1864, label %1720, label %1865

; <label>:1865:                                   ; preds = %1859
  %1866 = add nsw i32 %.5210, 1
  %1867 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 32, i64 0
  %1868 = load i32, i32* %1867, align 4
  %1869 = sext i32 %1868 to i64
  %1870 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1869
  %1871 = load i8, i8* %1870, align 1
  %1872 = zext i8 %1871 to i64
  %1873 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 30, i64 %1872
  %1874 = load i8, i8* %1873, align 1
  %1875 = zext i8 %1874 to i64
  %1876 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 16, i64 %1875
  %1877 = load i32, i32* %1876, align 4
  %1878 = add nsw i32 %1877, %1866
  store i32 %1878, i32* %1876, align 4
  %1879 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 10
  %1880 = load i8, i8* %1879, align 4
  %1881 = icmp eq i8 %1880, 0
  %1882 = icmp sgt i32 %.5210, -1
  br i1 %1881, label %.preheader430, label %.preheader433

.preheader433:                                    ; preds = %1865
  br i1 %1882, label %.lr.ph772, label %.loopexit431

.lr.ph772:                                        ; preds = %.preheader433
  %1883 = zext i8 %1874 to i16
  %1884 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 21
  %1885 = sext i32 %.6196 to i64
  %1886 = sext i32 %.6184 to i64
  br label %1891

.preheader430:                                    ; preds = %1865
  br i1 %1882, label %.lr.ph767, label %.loopexit431

.lr.ph767:                                        ; preds = %.preheader430
  %1887 = zext i8 %1874 to i32
  %1888 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 20
  %1889 = sext i32 %.6196 to i64
  %1890 = sext i32 %.6184 to i64
  br label %1898

; <label>:1891:                                   ; preds = %1893, %.lr.ph772
  %indvars.iv1068 = phi i64 [ %1885, %.lr.ph772 ], [ %indvars.iv.next1069, %1893 ]
  %.7212770 = phi i32 [ %1866, %.lr.ph772 ], [ %1896, %1893 ]
  %1892 = icmp slt i64 %indvars.iv1068, %1886
  br i1 %1892, label %1893, label %.loopexit.loopexit959

; <label>:1893:                                   ; preds = %1891
  %1894 = load i16*, i16** %1884, align 8
  %1895 = getelementptr inbounds i16, i16* %1894, i64 %indvars.iv1068
  store i16 %1883, i16* %1895, align 2
  %indvars.iv.next1069 = add nsw i64 %indvars.iv1068, 1
  %1896 = add nsw i32 %.7212770, -1
  %1897 = icmp sgt i32 %.7212770, 1
  br i1 %1897, label %1891, label %.loopexit431.loopexit960

; <label>:1898:                                   ; preds = %1900, %.lr.ph767
  %indvars.iv1066 = phi i64 [ %1889, %.lr.ph767 ], [ %indvars.iv.next1067, %1900 ]
  %.8213765 = phi i32 [ %1866, %.lr.ph767 ], [ %1903, %1900 ]
  %1899 = icmp slt i64 %indvars.iv1066, %1890
  br i1 %1899, label %1900, label %.loopexit.loopexit958

; <label>:1900:                                   ; preds = %1898
  %1901 = load i32*, i32** %1888, align 8
  %1902 = getelementptr inbounds i32, i32* %1901, i64 %indvars.iv1066
  store i32 %1887, i32* %1902, align 4
  %indvars.iv.next1067 = add nsw i64 %indvars.iv1066, 1
  %1903 = add nsw i32 %.8213765, -1
  %1904 = icmp sgt i32 %.8213765, 1
  br i1 %1904, label %1898, label %.loopexit431.loopexit

; <label>:1905:                                   ; preds = %1719
  %1906 = icmp slt i32 %.3193, %.3181
  br i1 %1906, label %1907, label %.loopexit

; <label>:1907:                                   ; preds = %1905
  %1908 = add nsw i32 %.0169, -1
  %1909 = icmp ult i32 %1908, 16
  br i1 %1909, label %1910, label %1989

; <label>:1910:                                   ; preds = %1907
  %1911 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 32, i64 0
  %1912 = load i32, i32* %1911, align 4
  %1913 = add i32 %1912, %1908
  %1914 = zext i32 %1913 to i64
  %1915 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1914
  %1916 = load i8, i8* %1915, align 1
  %1917 = icmp ugt i32 %1908, 3
  br i1 %1917, label %.lr.ph795.preheader, label %.lr.ph791.preheader

.lr.ph795.preheader:                              ; preds = %1910
  %1918 = add i32 %.0169, 3
  br label %.lr.ph795

.preheader442:                                    ; preds = %.lr.ph795
  %1919 = and i32 %1918, 3
  %1920 = icmp eq i32 %1919, 0
  br i1 %1920, label %._crit_edge792, label %.lr.ph791.preheader

.lr.ph791.preheader:                              ; preds = %.preheader442, %1910
  %.0.lcssa1122 = phi i32 [ %1919, %.preheader442 ], [ %1908, %1910 ]
  %1921 = add i32 %.0.lcssa1122, -1
  %xtraiter1072 = and i32 %.0.lcssa1122, 3
  %lcmp.mod1073 = icmp eq i32 %xtraiter1072, 0
  br i1 %lcmp.mod1073, label %._crit_edge792, label %.lr.ph791.prol.preheader

.lr.ph791.prol.preheader:                         ; preds = %.lr.ph791.preheader
  %1922 = zext i32 %.0.lcssa1122 to i64
  br label %.lr.ph791.prol

.lr.ph791.prol:                                   ; preds = %.lr.ph791.prol, %.lr.ph791.prol.preheader
  %indvars.iv1070.prol = phi i64 [ %indvars.iv.next1071.prol, %.lr.ph791.prol ], [ %1922, %.lr.ph791.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph791.prol ], [ %xtraiter1072, %.lr.ph791.prol.preheader ]
  %1923 = trunc i64 %indvars.iv1070.prol to i32
  %1924 = add i32 %1923, %1912
  %1925 = add i32 %1924, -1
  %1926 = zext i32 %1925 to i64
  %1927 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1926
  %1928 = load i8, i8* %1927, align 1
  %1929 = zext i32 %1924 to i64
  %1930 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1929
  store i8 %1928, i8* %1930, align 1
  %indvars.iv.next1071.prol = add nsw i64 %indvars.iv1070.prol, -1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph791.prol.loopexit, label %.lr.ph791.prol, !llvm.loop !7

.lr.ph791.prol.loopexit:                          ; preds = %.lr.ph791.prol
  %1931 = icmp ult i32 %1921, 3
  br i1 %1931, label %._crit_edge792, label %.lr.ph791.preheader1345

.lr.ph791.preheader1345:                          ; preds = %.lr.ph791.prol.loopexit
  br label %.lr.ph791

.lr.ph795:                                        ; preds = %.lr.ph795, %.lr.ph795.preheader
  %.0793 = phi i32 [ %1951, %.lr.ph795 ], [ %1908, %.lr.ph795.preheader ]
  %1932 = add i32 %.0793, %1912
  %1933 = add nsw i32 %1932, -1
  %1934 = sext i32 %1933 to i64
  %1935 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1934
  %1936 = load i8, i8* %1935, align 1
  %1937 = sext i32 %1932 to i64
  %1938 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1937
  store i8 %1936, i8* %1938, align 1
  %1939 = add nsw i32 %1932, -2
  %1940 = sext i32 %1939 to i64
  %1941 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1940
  %1942 = load i8, i8* %1941, align 1
  store i8 %1942, i8* %1935, align 1
  %1943 = add nsw i32 %1932, -3
  %1944 = sext i32 %1943 to i64
  %1945 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1944
  %1946 = load i8, i8* %1945, align 1
  store i8 %1946, i8* %1941, align 1
  %1947 = add nsw i32 %1932, -4
  %1948 = sext i32 %1947 to i64
  %1949 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1948
  %1950 = load i8, i8* %1949, align 1
  store i8 %1950, i8* %1945, align 1
  %1951 = add i32 %.0793, -4
  %1952 = icmp ugt i32 %1951, 3
  br i1 %1952, label %.lr.ph795, label %.preheader442

.lr.ph791:                                        ; preds = %.lr.ph791, %.lr.ph791.preheader1345
  %indvars.iv1070 = phi i64 [ %indvars.iv.next1071.3, %.lr.ph791 ], [ %indvars.iv.next1071.prol, %.lr.ph791.preheader1345 ]
  %1953 = trunc i64 %indvars.iv1070 to i32
  %1954 = add i32 %1953, %1912
  %1955 = add i32 %1954, -1
  %1956 = zext i32 %1955 to i64
  %1957 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1956
  %1958 = load i8, i8* %1957, align 1
  %1959 = zext i32 %1954 to i64
  %1960 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1959
  store i8 %1958, i8* %1960, align 1
  %indvars.iv.next1071 = add i64 %indvars.iv1070, 4294967295
  %1961 = trunc i64 %indvars.iv.next1071 to i32
  %1962 = add i32 %1961, %1912
  %1963 = add i32 %1962, -1
  %1964 = zext i32 %1963 to i64
  %1965 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1964
  %1966 = load i8, i8* %1965, align 1
  %1967 = zext i32 %1962 to i64
  %1968 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1967
  store i8 %1966, i8* %1968, align 1
  %indvars.iv.next1071.1 = add i64 %indvars.iv1070, 4294967294
  %1969 = trunc i64 %indvars.iv.next1071.1 to i32
  %1970 = add i32 %1969, %1912
  %1971 = add i32 %1970, -1
  %1972 = zext i32 %1971 to i64
  %1973 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1972
  %1974 = load i8, i8* %1973, align 1
  %1975 = zext i32 %1970 to i64
  %1976 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1975
  store i8 %1974, i8* %1976, align 1
  %indvars.iv.next1071.2 = add nsw i64 %indvars.iv1070, -3
  %1977 = trunc i64 %indvars.iv.next1071.2 to i32
  %1978 = add i32 %1977, %1912
  %1979 = add i32 %1978, -1
  %1980 = zext i32 %1979 to i64
  %1981 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1980
  %1982 = load i8, i8* %1981, align 1
  %1983 = zext i32 %1978 to i64
  %1984 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1983
  store i8 %1982, i8* %1984, align 1
  %1985 = trunc i64 %indvars.iv.next1071.2 to i32
  %1986 = icmp eq i32 %1985, 1
  %indvars.iv.next1071.3 = add nsw i64 %indvars.iv1070, -4
  br i1 %1986, label %._crit_edge792.loopexit, label %.lr.ph791

._crit_edge792.loopexit:                          ; preds = %.lr.ph791
  br label %._crit_edge792

._crit_edge792:                                   ; preds = %._crit_edge792.loopexit, %.lr.ph791.prol.loopexit, %.lr.ph791.preheader, %.preheader442
  %1987 = sext i32 %1912 to i64
  %1988 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1987
  store i8 %1916, i8* %1988, align 1
  br label %.loopexit445

; <label>:1989:                                   ; preds = %1907
  %1990 = lshr i32 %1908, 4
  %1991 = and i32 %1908, 15
  %1992 = zext i32 %1990 to i64
  %1993 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 32, i64 %1992
  %1994 = load i32, i32* %1993, align 4
  %1995 = add nsw i32 %1994, %1991
  %1996 = sext i32 %1995 to i64
  %1997 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %1996
  %1998 = load i8, i8* %1997, align 1
  %1999 = icmp eq i32 %1991, 0
  br i1 %1999, label %._crit_edge808.thread, label %.lr.ph807.preheader

._crit_edge808.thread:                            ; preds = %1989
  %2000 = add nsw i32 %1994, 1
  store i32 %2000, i32* %1993, align 4
  br label %.lr.ph803.preheader

.lr.ph807.preheader:                              ; preds = %1989
  %2001 = sext i32 %1995 to i64
  br label %.lr.ph807

.lr.ph807:                                        ; preds = %.lr.ph807, %.lr.ph807.preheader
  %indvars.iv1082 = phi i64 [ %2001, %.lr.ph807.preheader ], [ %indvars.iv.next1083, %.lr.ph807 ]
  %indvars.iv.next1083 = add i64 %indvars.iv1082, -1
  %2002 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1083
  %2003 = load i8, i8* %2002, align 1
  %2004 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv1082
  store i8 %2003, i8* %2004, align 1
  %2005 = load i32, i32* %1993, align 4
  %2006 = sext i32 %2005 to i64
  %2007 = icmp sgt i64 %indvars.iv.next1083, %2006
  br i1 %2007, label %.lr.ph807, label %._crit_edge808

._crit_edge808:                                   ; preds = %.lr.ph807
  %2008 = add nsw i32 %2005, 1
  store i32 %2008, i32* %1993, align 4
  %2009 = icmp eq i32 %1990, 0
  br i1 %2009, label %._crit_edge804, label %.lr.ph803.preheader

.lr.ph803.preheader:                              ; preds = %._crit_edge808, %._crit_edge808.thread
  %2010 = zext i32 %1990 to i64
  br label %.lr.ph803

.lr.ph803:                                        ; preds = %.lr.ph803, %.lr.ph803.preheader
  %indvars.iv1080 = phi i64 [ %2010, %.lr.ph803.preheader ], [ %indvars.iv.next1081, %.lr.ph803 ]
  %2011 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 32, i64 %indvars.iv1080
  %2012 = load i32, i32* %2011, align 4
  %2013 = add nsw i32 %2012, -1
  store i32 %2013, i32* %2011, align 4
  %indvars.iv.next1081 = add nsw i64 %indvars.iv1080, -1
  %2014 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 32, i64 %indvars.iv.next1081
  %2015 = load i32, i32* %2014, align 4
  %2016 = add nsw i32 %2015, 15
  %2017 = sext i32 %2016 to i64
  %2018 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2017
  %2019 = load i8, i8* %2018, align 1
  %2020 = sext i32 %2013 to i64
  %2021 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2020
  store i8 %2019, i8* %2021, align 1
  %2022 = icmp sgt i64 %indvars.iv1080, 1
  br i1 %2022, label %.lr.ph803, label %._crit_edge804.loopexit

._crit_edge804.loopexit:                          ; preds = %.lr.ph803
  br label %._crit_edge804

._crit_edge804:                                   ; preds = %._crit_edge804.loopexit, %._crit_edge808
  %2023 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 32, i64 0
  %2024 = load i32, i32* %2023, align 4
  %2025 = add nsw i32 %2024, -1
  store i32 %2025, i32* %2023, align 4
  %2026 = sext i32 %2025 to i64
  %2027 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2026
  store i8 %1998, i8* %2027, align 1
  %2028 = load i32, i32* %2023, align 4
  %2029 = icmp eq i32 %2028, 0
  br i1 %2029, label %.preheader1144.preheader, label %.loopexit445

.preheader1144.preheader:                         ; preds = %._crit_edge804
  br label %.preheader1144

.preheader1144:                                   ; preds = %.preheader1144, %.preheader1144.preheader
  %indvars.iv1078 = phi i64 [ %indvars.iv.next1079, %.preheader1144 ], [ 15, %.preheader1144.preheader ]
  %indvars.iv1076 = phi i64 [ %indvars.iv.next1077, %.preheader1144 ], [ 4095, %.preheader1144.preheader ]
  %2030 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 32, i64 %indvars.iv1078
  %2031 = add i64 %indvars.iv1076, 4294967281
  %2032 = load i32, i32* %2030, align 4
  %2033 = add nsw i32 %2032, 15
  %2034 = sext i32 %2033 to i64
  %2035 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2034
  %2036 = load i8, i8* %2035, align 1
  %2037 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv1076
  store i8 %2036, i8* %2037, align 1
  %indvars.iv.next1075 = add nsw i64 %indvars.iv1076, -1
  %2038 = load i32, i32* %2030, align 4
  %2039 = add nsw i32 %2038, 14
  %2040 = sext i32 %2039 to i64
  %2041 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2040
  %2042 = load i8, i8* %2041, align 1
  %2043 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1075
  store i8 %2042, i8* %2043, align 1
  %indvars.iv.next1075.1 = add nsw i64 %indvars.iv1076, -2
  %2044 = load i32, i32* %2030, align 4
  %2045 = add nsw i32 %2044, 13
  %2046 = sext i32 %2045 to i64
  %2047 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2046
  %2048 = load i8, i8* %2047, align 1
  %2049 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1075.1
  store i8 %2048, i8* %2049, align 1
  %indvars.iv.next1075.2 = add nsw i64 %indvars.iv1076, -3
  %2050 = load i32, i32* %2030, align 4
  %2051 = add nsw i32 %2050, 12
  %2052 = sext i32 %2051 to i64
  %2053 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2052
  %2054 = load i8, i8* %2053, align 1
  %2055 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1075.2
  store i8 %2054, i8* %2055, align 1
  %indvars.iv.next1075.3 = add nsw i64 %indvars.iv1076, -4
  %2056 = load i32, i32* %2030, align 4
  %2057 = add nsw i32 %2056, 11
  %2058 = sext i32 %2057 to i64
  %2059 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2058
  %2060 = load i8, i8* %2059, align 1
  %2061 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1075.3
  store i8 %2060, i8* %2061, align 1
  %indvars.iv.next1075.4 = add nsw i64 %indvars.iv1076, -5
  %2062 = load i32, i32* %2030, align 4
  %2063 = add nsw i32 %2062, 10
  %2064 = sext i32 %2063 to i64
  %2065 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2064
  %2066 = load i8, i8* %2065, align 1
  %2067 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1075.4
  store i8 %2066, i8* %2067, align 1
  %indvars.iv.next1075.5 = add nsw i64 %indvars.iv1076, -6
  %2068 = load i32, i32* %2030, align 4
  %2069 = add nsw i32 %2068, 9
  %2070 = sext i32 %2069 to i64
  %2071 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2070
  %2072 = load i8, i8* %2071, align 1
  %2073 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1075.5
  store i8 %2072, i8* %2073, align 1
  %indvars.iv.next1075.6 = add nsw i64 %indvars.iv1076, -7
  %2074 = load i32, i32* %2030, align 4
  %2075 = add nsw i32 %2074, 8
  %2076 = sext i32 %2075 to i64
  %2077 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2076
  %2078 = load i8, i8* %2077, align 1
  %2079 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1075.6
  store i8 %2078, i8* %2079, align 1
  %indvars.iv.next1075.7 = add nsw i64 %indvars.iv1076, -8
  %2080 = load i32, i32* %2030, align 4
  %2081 = add nsw i32 %2080, 7
  %2082 = sext i32 %2081 to i64
  %2083 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2082
  %2084 = load i8, i8* %2083, align 1
  %2085 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1075.7
  store i8 %2084, i8* %2085, align 1
  %indvars.iv.next1075.8 = add nsw i64 %indvars.iv1076, -9
  %2086 = load i32, i32* %2030, align 4
  %2087 = add nsw i32 %2086, 6
  %2088 = sext i32 %2087 to i64
  %2089 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2088
  %2090 = load i8, i8* %2089, align 1
  %2091 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1075.8
  store i8 %2090, i8* %2091, align 1
  %indvars.iv.next1075.9 = add nsw i64 %indvars.iv1076, -10
  %2092 = load i32, i32* %2030, align 4
  %2093 = add nsw i32 %2092, 5
  %2094 = sext i32 %2093 to i64
  %2095 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2094
  %2096 = load i8, i8* %2095, align 1
  %2097 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1075.9
  store i8 %2096, i8* %2097, align 1
  %indvars.iv.next1075.10 = add nsw i64 %indvars.iv1076, -11
  %2098 = load i32, i32* %2030, align 4
  %2099 = add nsw i32 %2098, 4
  %2100 = sext i32 %2099 to i64
  %2101 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2100
  %2102 = load i8, i8* %2101, align 1
  %2103 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1075.10
  store i8 %2102, i8* %2103, align 1
  %indvars.iv.next1075.11 = add nsw i64 %indvars.iv1076, -12
  %2104 = load i32, i32* %2030, align 4
  %2105 = add nsw i32 %2104, 3
  %2106 = sext i32 %2105 to i64
  %2107 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2106
  %2108 = load i8, i8* %2107, align 1
  %2109 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1075.11
  store i8 %2108, i8* %2109, align 1
  %indvars.iv.next1075.12 = add nsw i64 %indvars.iv1076, -13
  %2110 = load i32, i32* %2030, align 4
  %2111 = add nsw i32 %2110, 2
  %2112 = sext i32 %2111 to i64
  %2113 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2112
  %2114 = load i8, i8* %2113, align 1
  %2115 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1075.12
  store i8 %2114, i8* %2115, align 1
  %indvars.iv.next1075.13 = add nsw i64 %indvars.iv1076, -14
  %2116 = load i32, i32* %2030, align 4
  %2117 = add nsw i32 %2116, 1
  %2118 = sext i32 %2117 to i64
  %2119 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2118
  %2120 = load i8, i8* %2119, align 1
  %2121 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1075.13
  store i8 %2120, i8* %2121, align 1
  %indvars.iv.next1075.14 = add nsw i64 %indvars.iv1076, -15
  %2122 = load i32, i32* %2030, align 4
  %2123 = sext i32 %2122 to i64
  %2124 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %2123
  %2125 = load i8, i8* %2124, align 1
  %2126 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 31, i64 %indvars.iv.next1075.14
  store i8 %2125, i8* %2126, align 1
  %2127 = trunc i64 %2031 to i32
  %2128 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 32, i64 %indvars.iv1078
  store i32 %2127, i32* %2128, align 4
  %indvars.iv.next1079 = add nsw i64 %indvars.iv1078, -1
  %2129 = icmp sgt i64 %indvars.iv1078, 0
  %indvars.iv.next1077 = add nsw i64 %indvars.iv1076, -16
  br i1 %2129, label %.preheader1144, label %.loopexit445.loopexit

.loopexit445.loopexit:                            ; preds = %.preheader1144
  br label %.loopexit445

.loopexit445:                                     ; preds = %.loopexit445.loopexit, %._crit_edge804, %._crit_edge792
  %.01 = phi i8 [ %1916, %._crit_edge792 ], [ %1998, %._crit_edge804 ], [ %1998, %.loopexit445.loopexit ]
  %2130 = zext i8 %.01 to i64
  %2131 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 30, i64 %2130
  %2132 = load i8, i8* %2131, align 1
  %2133 = zext i8 %2132 to i64
  %2134 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 16, i64 %2133
  %2135 = load i32, i32* %2134, align 4
  %2136 = add nsw i32 %2135, 1
  store i32 %2136, i32* %2134, align 4
  %2137 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 10
  %2138 = load i8, i8* %2137, align 4
  %2139 = icmp eq i8 %2138, 0
  %2140 = load i8, i8* %2131, align 1
  br i1 %2139, label %2147, label %2141

; <label>:2141:                                   ; preds = %.loopexit445
  %2142 = zext i8 %2140 to i16
  %2143 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 21
  %2144 = load i16*, i16** %2143, align 8
  %2145 = sext i32 %.3193 to i64
  %2146 = getelementptr inbounds i16, i16* %2144, i64 %2145
  store i16 %2142, i16* %2146, align 2
  br label %2153

; <label>:2147:                                   ; preds = %.loopexit445
  %2148 = zext i8 %2140 to i32
  %2149 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 20
  %2150 = load i32*, i32** %2149, align 8
  %2151 = sext i32 %.3193 to i64
  %2152 = getelementptr inbounds i32, i32* %2150, i64 %2151
  store i32 %2148, i32* %2152, align 4
  br label %2153

; <label>:2153:                                   ; preds = %2147, %2141
  %2154 = add nsw i32 %.3193, 1
  %2155 = icmp eq i32 %.4158, 0
  br i1 %2155, label %2156, label %2170

; <label>:2156:                                   ; preds = %2153
  %2157 = add nsw i32 %.4143, 1
  %2158 = icmp slt i32 %2157, %.12118
  br i1 %2158, label %2159, label %.loopexit

; <label>:2159:                                   ; preds = %2156
  %2160 = sext i32 %2157 to i64
  %2161 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 33, i64 %2160
  %2162 = load i8, i8* %2161, align 1
  %2163 = zext i8 %2162 to i32
  %2164 = zext i8 %2162 to i64
  %2165 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 39, i64 %2164
  %2166 = load i32, i32* %2165, align 4
  %2167 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 36, i64 %2164, i64 0
  %2168 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 38, i64 %2164, i64 0
  %2169 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 37, i64 %2164, i64 0
  br label %2170

; <label>:2170:                                   ; preds = %2159, %2153
  %.10352 = phi i32* [ %2168, %2159 ], [ %.4346, %2153 ]
  %.10337 = phi i32* [ %2169, %2159 ], [ %.4331, %2153 ]
  %.10322 = phi i32* [ %2167, %2159 ], [ %.4316, %2153 ]
  %.10307 = phi i32 [ %2166, %2159 ], [ %.4301, %2153 ]
  %.10292 = phi i32 [ %2163, %2159 ], [ %.4286, %2153 ]
  %.10164 = phi i32 [ 50, %2159 ], [ %.4158, %2153 ]
  %.10149 = phi i32 [ %2157, %2159 ], [ %.4143, %2153 ]
  %2171 = add nsw i32 %.10164, -1
  br label %2172

; <label>:2172:                                   ; preds = %2170, %11
  %.11353 = phi i32* [ %.10352, %2170 ], [ %59, %11 ]
  %.11338 = phi i32* [ %.10337, %2170 ], [ %57, %11 ]
  %.11323 = phi i32* [ %.10322, %2170 ], [ %55, %11 ]
  %.11308 = phi i32 [ %.10307, %2170 ], [ %53, %11 ]
  %.11293 = phi i32 [ %.10292, %2170 ], [ %51, %11 ]
  %.7278 = phi i32 [ %.2273, %2170 ], [ %49, %11 ]
  %.7267 = phi i32 [ %.2262, %2170 ], [ %47, %11 ]
  %.8256 = phi i32 [ %.10307, %2170 ], [ %45, %11 ]
  %.15243 = phi i32 [ %.10238, %2170 ], [ %41, %11 ]
  %.5224 = phi i32 [ %.0219, %2170 ], [ %39, %11 ]
  %.10215 = phi i32 [ %.0205, %2170 ], [ %37, %11 ]
  %.11201 = phi i32 [ %2154, %2170 ], [ %35, %11 ]
  %.8186 = phi i32 [ %.3181, %2170 ], [ %33, %11 ]
  %.5174 = phi i32 [ %.0169, %2170 ], [ %31, %11 ]
  %.11165 = phi i32 [ %2171, %2170 ], [ %29, %11 ]
  %.11150 = phi i32 [ %.10149, %2170 ], [ %27, %11 ]
  %.8135 = phi i32 [ %.3130, %2170 ], [ %25, %11 ]
  %.17123 = phi i32 [ %.12118, %2170 ], [ %23, %11 ]
  %.18102 = phi i32 [ %.1397, %2170 ], [ %21, %11 ]
  %.1980 = phi i32 [ %.1475, %2170 ], [ %19, %11 ]
  %.1557 = phi i32 [ %.1052, %2170 ], [ %17, %11 ]
  %.2336 = phi i32 [ %.1831, %2170 ], [ %15, %11 ]
  %.29 = phi i32 [ %.24, %2170 ], [ %13, %11 ]
  store i32 40, i32* %5, align 8
  %2173 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %2174 = load i32, i32* %2173, align 4
  %2175 = icmp slt i32 %2174, %.8256
  br i1 %2175, label %.lr.ph786, label %._crit_edge787

.lr.ph786:                                        ; preds = %2172
  %2176 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %2184

._crit_edge787.loopexit:                          ; preds = %.backedge441
  br label %._crit_edge787

._crit_edge787:                                   ; preds = %._crit_edge787.loopexit, %2172
  %.lcssa581 = phi i32 [ %2174, %2172 ], [ %2219, %._crit_edge787.loopexit ]
  %2177 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %2178 = load i32, i32* %2177, align 8
  %2179 = sub nsw i32 %.lcssa581, %.8256
  store i32 %2179, i32* %2173, align 4
  %2180 = lshr i32 %2178, %2179
  %2181 = shl i32 1, %.8256
  %2182 = add nsw i32 %2181, -1
  %2183 = and i32 %2180, %2182
  br label %2221

; <label>:2184:                                   ; preds = %.backedge441, %.lr.ph786
  %2185 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2186 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2185, i64 0, i32 1
  %2187 = load i32, i32* %2186, align 8
  %2188 = icmp eq i32 %2187, 0
  br i1 %2188, label %.loopexit.loopexit1344, label %2189

; <label>:2189:                                   ; preds = %2184
  %2190 = load i32, i32* %2176, align 8
  %2191 = shl i32 %2190, 8
  %2192 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2185, i64 0, i32 0
  %2193 = load i8*, i8** %2192, align 8
  %2194 = load i8, i8* %2193, align 1
  %2195 = zext i8 %2194 to i32
  %2196 = or i32 %2195, %2191
  store i32 %2196, i32* %2176, align 8
  %2197 = load i32, i32* %2173, align 4
  %2198 = add nsw i32 %2197, 8
  store i32 %2198, i32* %2173, align 4
  %2199 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2200 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2199, i64 0, i32 0
  %2201 = load i8*, i8** %2200, align 8
  %2202 = getelementptr inbounds i8, i8* %2201, i64 1
  store i8* %2202, i8** %2200, align 8
  %2203 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2204 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2203, i64 0, i32 1
  %2205 = load i32, i32* %2204, align 8
  %2206 = add i32 %2205, -1
  store i32 %2206, i32* %2204, align 8
  %2207 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2208 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2207, i64 0, i32 2
  %2209 = load i32, i32* %2208, align 4
  %2210 = add i32 %2209, 1
  store i32 %2210, i32* %2208, align 4
  %2211 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2212 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2211, i64 0, i32 2
  %2213 = load i32, i32* %2212, align 4
  %2214 = icmp eq i32 %2213, 0
  br i1 %2214, label %2215, label %.backedge441

; <label>:2215:                                   ; preds = %2189
  %2216 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2211, i64 0, i32 3
  %2217 = load i32, i32* %2216, align 8
  %2218 = add i32 %2217, 1
  store i32 %2218, i32* %2216, align 8
  br label %.backedge441

.backedge441:                                     ; preds = %2215, %2189
  %2219 = load i32, i32* %2173, align 4
  %2220 = icmp slt i32 %2219, %.8256
  br i1 %2220, label %2184, label %._crit_edge787.loopexit

; <label>:2221:                                   ; preds = %._crit_edge782, %._crit_edge787
  %.12354 = phi i32* [ %.13355, %._crit_edge782 ], [ %.11353, %._crit_edge787 ]
  %.12339 = phi i32* [ %.13340, %._crit_edge782 ], [ %.11338, %._crit_edge787 ]
  %.12324 = phi i32* [ %.13325, %._crit_edge782 ], [ %.11323, %._crit_edge787 ]
  %.12309 = phi i32 [ %.13310, %._crit_edge782 ], [ %.11308, %._crit_edge787 ]
  %.12294 = phi i32 [ %.13295, %._crit_edge782 ], [ %.11293, %._crit_edge787 ]
  %.8279 = phi i32 [ %2239, %._crit_edge782 ], [ %.7278, %._crit_edge787 ]
  %.8268 = phi i32 [ %2241, %._crit_edge782 ], [ %2183, %._crit_edge787 ]
  %.9257 = phi i32 [ %.10258, %._crit_edge782 ], [ %.8256, %._crit_edge787 ]
  %.16244 = phi i32 [ %.17245, %._crit_edge782 ], [ %.15243, %._crit_edge787 ]
  %.6225 = phi i32 [ %.7226, %._crit_edge782 ], [ %.5224, %._crit_edge787 ]
  %.11216 = phi i32 [ %.12217, %._crit_edge782 ], [ %.10215, %._crit_edge787 ]
  %.12202 = phi i32 [ %.13203, %._crit_edge782 ], [ %.11201, %._crit_edge787 ]
  %.9187 = phi i32 [ %.10188, %._crit_edge782 ], [ %.8186, %._crit_edge787 ]
  %.6175 = phi i32 [ %.7176, %._crit_edge782 ], [ %.5174, %._crit_edge787 ]
  %.12166 = phi i32 [ %.13167, %._crit_edge782 ], [ %.11165, %._crit_edge787 ]
  %.12151 = phi i32 [ %.13152, %._crit_edge782 ], [ %.11150, %._crit_edge787 ]
  %.9136 = phi i32 [ %.10137, %._crit_edge782 ], [ %.8135, %._crit_edge787 ]
  %.18124 = phi i32 [ %.19125, %._crit_edge782 ], [ %.17123, %._crit_edge787 ]
  %.19103 = phi i32 [ %.20104, %._crit_edge782 ], [ %.18102, %._crit_edge787 ]
  %.2081 = phi i32 [ %.2182, %._crit_edge782 ], [ %.1980, %._crit_edge787 ]
  %.1658 = phi i32 [ %.1759, %._crit_edge782 ], [ %.1557, %._crit_edge787 ]
  %.2437 = phi i32 [ %.2538, %._crit_edge782 ], [ %.2336, %._crit_edge787 ]
  %.30 = phi i32 [ %.31, %._crit_edge782 ], [ %.29, %._crit_edge787 ]
  %2222 = icmp sgt i32 %.9257, 20
  br i1 %2222, label %.loopexit, label %2223

; <label>:2223:                                   ; preds = %2221
  %2224 = sext i32 %.9257 to i64
  %2225 = getelementptr inbounds i32, i32* %.12324, i64 %2224
  %2226 = load i32, i32* %2225, align 4
  %2227 = icmp sgt i32 %.8268, %2226
  br i1 %2227, label %2228, label %2279

; <label>:2228:                                   ; preds = %2223
  %2229 = add nsw i32 %.9257, 1
  br label %2230

; <label>:2230:                                   ; preds = %2228, %11
  %.13355 = phi i32* [ %59, %11 ], [ %.12354, %2228 ]
  %.13340 = phi i32* [ %57, %11 ], [ %.12339, %2228 ]
  %.13325 = phi i32* [ %55, %11 ], [ %.12324, %2228 ]
  %.13310 = phi i32 [ %53, %11 ], [ %.12309, %2228 ]
  %.13295 = phi i32 [ %51, %11 ], [ %.12294, %2228 ]
  %.9280 = phi i32 [ %49, %11 ], [ %.8279, %2228 ]
  %.9269 = phi i32 [ %47, %11 ], [ %.8268, %2228 ]
  %.10258 = phi i32 [ %45, %11 ], [ %2229, %2228 ]
  %.17245 = phi i32 [ %41, %11 ], [ %.16244, %2228 ]
  %.7226 = phi i32 [ %39, %11 ], [ %.6225, %2228 ]
  %.12217 = phi i32 [ %37, %11 ], [ %.11216, %2228 ]
  %.13203 = phi i32 [ %35, %11 ], [ %.12202, %2228 ]
  %.10188 = phi i32 [ %33, %11 ], [ %.9187, %2228 ]
  %.7176 = phi i32 [ %31, %11 ], [ %.6175, %2228 ]
  %.13167 = phi i32 [ %29, %11 ], [ %.12166, %2228 ]
  %.13152 = phi i32 [ %27, %11 ], [ %.12151, %2228 ]
  %.10137 = phi i32 [ %25, %11 ], [ %.9136, %2228 ]
  %.19125 = phi i32 [ %23, %11 ], [ %.18124, %2228 ]
  %.20104 = phi i32 [ %21, %11 ], [ %.19103, %2228 ]
  %.2182 = phi i32 [ %19, %11 ], [ %.2081, %2228 ]
  %.1759 = phi i32 [ %17, %11 ], [ %.1658, %2228 ]
  %.2538 = phi i32 [ %15, %11 ], [ %.2437, %2228 ]
  %.31 = phi i32 [ %13, %11 ], [ %.30, %2228 ]
  store i32 41, i32* %5, align 8
  %2231 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %2232 = load i32, i32* %2231, align 4
  %2233 = icmp sgt i32 %2232, 0
  br i1 %2233, label %._crit_edge782, label %.lr.ph781

.lr.ph781:                                        ; preds = %2230
  %2234 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %2242

._crit_edge782.loopexit:                          ; preds = %.backedge439
  br label %._crit_edge782

._crit_edge782:                                   ; preds = %._crit_edge782.loopexit, %2230
  %.lcssa577 = phi i32 [ %2232, %2230 ], [ %2277, %._crit_edge782.loopexit ]
  %2235 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %2236 = load i32, i32* %2235, align 8
  %2237 = add nsw i32 %.lcssa577, -1
  %2238 = lshr i32 %2236, %2237
  %2239 = and i32 %2238, 1
  store i32 %2237, i32* %2231, align 4
  %2240 = shl i32 %.9269, 1
  %2241 = or i32 %2239, %2240
  br label %2221

; <label>:2242:                                   ; preds = %.backedge439, %.lr.ph781
  %2243 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2244 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2243, i64 0, i32 1
  %2245 = load i32, i32* %2244, align 8
  %2246 = icmp eq i32 %2245, 0
  br i1 %2246, label %.loopexit.loopexit1343, label %2247

; <label>:2247:                                   ; preds = %2242
  %2248 = load i32, i32* %2234, align 8
  %2249 = shl i32 %2248, 8
  %2250 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2243, i64 0, i32 0
  %2251 = load i8*, i8** %2250, align 8
  %2252 = load i8, i8* %2251, align 1
  %2253 = zext i8 %2252 to i32
  %2254 = or i32 %2253, %2249
  store i32 %2254, i32* %2234, align 8
  %2255 = load i32, i32* %2231, align 4
  %2256 = add nsw i32 %2255, 8
  store i32 %2256, i32* %2231, align 4
  %2257 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2258 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2257, i64 0, i32 0
  %2259 = load i8*, i8** %2258, align 8
  %2260 = getelementptr inbounds i8, i8* %2259, i64 1
  store i8* %2260, i8** %2258, align 8
  %2261 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2262 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2261, i64 0, i32 1
  %2263 = load i32, i32* %2262, align 8
  %2264 = add i32 %2263, -1
  store i32 %2264, i32* %2262, align 8
  %2265 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2266 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2265, i64 0, i32 2
  %2267 = load i32, i32* %2266, align 4
  %2268 = add i32 %2267, 1
  store i32 %2268, i32* %2266, align 4
  %2269 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2270 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2269, i64 0, i32 2
  %2271 = load i32, i32* %2270, align 4
  %2272 = icmp eq i32 %2271, 0
  br i1 %2272, label %2273, label %.backedge439

; <label>:2273:                                   ; preds = %2247
  %2274 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2269, i64 0, i32 3
  %2275 = load i32, i32* %2274, align 8
  %2276 = add i32 %2275, 1
  store i32 %2276, i32* %2274, align 8
  br label %.backedge439

.backedge439:                                     ; preds = %2273, %2247
  %2277 = load i32, i32* %2231, align 4
  %2278 = icmp sgt i32 %2277, 0
  br i1 %2278, label %._crit_edge782.loopexit, label %2242

; <label>:2279:                                   ; preds = %2223
  %2280 = getelementptr inbounds i32, i32* %.12339, i64 %2224
  %2281 = load i32, i32* %2280, align 4
  %2282 = icmp slt i32 %.8268, %2281
  br i1 %2282, label %.loopexit, label %2283

; <label>:2283:                                   ; preds = %2279
  %2284 = sub nsw i32 %.8268, %2281
  %2285 = icmp sgt i32 %2284, 257
  br i1 %2285, label %.loopexit, label %2286

; <label>:2286:                                   ; preds = %2283
  %2287 = sext i32 %2284 to i64
  %2288 = getelementptr inbounds i32, i32* %.12354, i64 %2287
  %2289 = load i32, i32* %2288, align 4
  br label %.loopexit431

; <label>:2290:                                   ; preds = %.loopexit431
  %2291 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 13
  %2292 = load i32, i32* %2291, align 8
  %2293 = icmp sgt i32 %2292, -1
  %2294 = icmp slt i32 %2292, %.3193
  %or.cond389 = and i1 %2293, %2294
  br i1 %or.cond389, label %2295, label %.loopexit

; <label>:2295:                                   ; preds = %2290
  %2296 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 0
  store i32 0, i32* %2296, align 8
  br label %2297

; <label>:2297:                                   ; preds = %2297, %2295
  %indvars.iv1062 = phi i64 [ 1, %2295 ], [ %indvars.iv.next1063.3.1, %2297 ]
  %2298 = add nsw i64 %indvars.iv1062, -1
  %2299 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 16, i64 %2298
  %2300 = load i32, i32* %2299, align 4
  %2301 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv1062
  store i32 %2300, i32* %2301, align 4
  %indvars.iv.next1063 = add nuw nsw i64 %indvars.iv1062, 1
  %2302 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 16, i64 %indvars.iv1062
  %2303 = load i32, i32* %2302, align 4
  %2304 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1063
  store i32 %2303, i32* %2304, align 4
  %indvars.iv.next1063.1 = add nuw nsw i64 %indvars.iv1062, 2
  %2305 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 16, i64 %indvars.iv.next1063
  %2306 = load i32, i32* %2305, align 4
  %2307 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1063.1
  store i32 %2306, i32* %2307, align 4
  %indvars.iv.next1063.2 = add nuw nsw i64 %indvars.iv1062, 3
  %2308 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 16, i64 %indvars.iv.next1063.1
  %2309 = load i32, i32* %2308, align 4
  %2310 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1063.2
  store i32 %2309, i32* %2310, align 4
  %indvars.iv.next1063.3 = add nuw nsw i64 %indvars.iv1062, 4
  %2311 = add nsw i64 %indvars.iv1062, 3
  %2312 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 16, i64 %2311
  %2313 = load i32, i32* %2312, align 4
  %2314 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1063.3
  store i32 %2313, i32* %2314, align 4
  %indvars.iv.next1063.11421 = add nsw i64 %indvars.iv1062, 5
  %2315 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 16, i64 %indvars.iv.next1063.3
  %2316 = load i32, i32* %2315, align 4
  %2317 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1063.11421
  store i32 %2316, i32* %2317, align 4
  %indvars.iv.next1063.1.1 = add nsw i64 %indvars.iv1062, 6
  %2318 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 16, i64 %indvars.iv.next1063.11421
  %2319 = load i32, i32* %2318, align 4
  %2320 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1063.1.1
  store i32 %2319, i32* %2320, align 4
  %indvars.iv.next1063.2.1 = add nsw i64 %indvars.iv1062, 7
  %2321 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 16, i64 %indvars.iv.next1063.1.1
  %2322 = load i32, i32* %2321, align 4
  %2323 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1063.2.1
  store i32 %2322, i32* %2323, align 4
  %indvars.iv.next1063.3.1 = add nsw i64 %indvars.iv1062, 8
  %exitcond1064.3.1 = icmp eq i64 %indvars.iv.next1063.3.1, 257
  br i1 %exitcond1064.3.1, label %.preheader427.preheader, label %2297

.preheader427.preheader:                          ; preds = %2297
  br label %.preheader427

.preheader427:                                    ; preds = %.preheader427, %.preheader427.preheader
  %indvars.iv1059 = phi i64 [ %indvars.iv.next1060.3, %.preheader427 ], [ 1, %.preheader427.preheader ]
  %2324 = add nsw i64 %indvars.iv1059, -1
  %2325 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %2324
  %2326 = load i32, i32* %2325, align 4
  %2327 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv1059
  %2328 = load i32, i32* %2327, align 4
  %2329 = add nsw i32 %2328, %2326
  store i32 %2329, i32* %2327, align 4
  %indvars.iv.next1060 = add nuw nsw i64 %indvars.iv1059, 1
  %2330 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1060
  %2331 = load i32, i32* %2330, align 4
  %2332 = add nsw i32 %2331, %2329
  store i32 %2332, i32* %2330, align 4
  %indvars.iv.next1060.1 = add nsw i64 %indvars.iv1059, 2
  %2333 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1060.1
  %2334 = load i32, i32* %2333, align 4
  %2335 = add nsw i32 %2334, %2332
  store i32 %2335, i32* %2333, align 4
  %indvars.iv.next1060.2 = add nsw i64 %indvars.iv1059, 3
  %2336 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1060.2
  %2337 = load i32, i32* %2336, align 4
  %2338 = add nsw i32 %2337, %2335
  store i32 %2338, i32* %2336, align 4
  %indvars.iv.next1060.3 = add nsw i64 %indvars.iv1059, 4
  %exitcond1061.3 = icmp eq i64 %indvars.iv.next1060.3, 257
  br i1 %exitcond1061.3, label %.preheader425.preheader, label %.preheader427

.preheader425.preheader:                          ; preds = %.preheader427
  %2339 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 0
  %2340 = load i32, i32* %2339, align 4
  %2341 = icmp slt i32 %2340, 0
  %2342 = icmp sgt i32 %2340, %.3193
  %or.cond3901315 = or i1 %2341, %2342
  br i1 %or.cond3901315, label %.loopexit.loopexit956, label %.lr.ph1317.preheader

.lr.ph1317.preheader:                             ; preds = %.preheader425.preheader
  br label %.lr.ph1317

.lr.ph1317:                                       ; preds = %.preheader425, %.lr.ph1317.preheader
  %indvars.iv10551316 = phi i64 [ %indvars.iv.next1056.3, %.preheader425 ], [ 0, %.lr.ph1317.preheader ]
  %indvars.iv.next1056 = or i64 %indvars.iv10551316, 1
  %2343 = icmp slt i64 %indvars.iv.next1056, 257
  br i1 %2343, label %.preheader425.1, label %2344

; <label>:2344:                                   ; preds = %.lr.ph1317
  %2345 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 3
  store i32 0, i32* %2345, align 8
  %2346 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 2
  store i8 0, i8* %2346, align 4
  %2347 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 25
  store i32 -1, i32* %2347, align 8
  store i32 2, i32* %5, align 8
  %2348 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 12
  %2349 = load i32, i32* %2348, align 4
  %2350 = icmp sgt i32 %2349, 1
  br i1 %2350, label %2351, label %2354

; <label>:2351:                                   ; preds = %2344
  %2352 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2353 = tail call i64 @fwrite(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i64 6, i64 1, %struct._IO_FILE* %2352) #6
  br label %2354

; <label>:2354:                                   ; preds = %2351, %2344
  %2355 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 10
  %2356 = load i8, i8* %2355, align 4
  %2357 = icmp eq i8 %2356, 0
  br i1 %2357, label %.preheader, label %.preheader424.preheader

.preheader424.preheader:                          ; preds = %2354
  %2358 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 0
  %2359 = load i32, i32* %2358, align 4
  %2360 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 19, i64 0
  store i32 %2359, i32* %2360, align 4
  br label %.preheader424.1

.preheader:                                       ; preds = %2354
  %2361 = icmp sgt i32 %.3193, 0
  %2362 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 20
  %2363 = load i32*, i32** %2362, align 8
  br i1 %2361, label %.lr.ph748.preheader, label %._crit_edge749

.lr.ph748.preheader:                              ; preds = %.preheader
  %xtraiter = and i32 %.3193, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph748.prol.loopexit, label %.lr.ph748.prol

.lr.ph748.prol:                                   ; preds = %.lr.ph748.preheader
  %2364 = load i32, i32* %2363, align 4
  %.mask.prol = and i32 %2364, 255
  %2365 = zext i32 %.mask.prol to i64
  %2366 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %2365
  %2367 = load i32, i32* %2366, align 4
  %2368 = add nsw i32 %2367, 1
  store i32 %2368, i32* %2366, align 4
  %2369 = load i32*, i32** %2362, align 8
  br label %.lr.ph748.prol.loopexit

.lr.ph748.prol.loopexit:                          ; preds = %.lr.ph748.prol, %.lr.ph748.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph748.preheader ], [ 1, %.lr.ph748.prol ]
  %.unr = phi i32* [ %2363, %.lr.ph748.preheader ], [ %2369, %.lr.ph748.prol ]
  %.lcssa1002.unr = phi i32* [ undef, %.lr.ph748.preheader ], [ %2369, %.lr.ph748.prol ]
  %2370 = icmp eq i32 %.3193, 1
  br i1 %2370, label %._crit_edge749, label %.lr.ph748.preheader1138

.lr.ph748.preheader1138:                          ; preds = %.lr.ph748.prol.loopexit
  %wide.trip.count.1 = zext i32 %.3193 to i64
  br label %.lr.ph748

.preheader423:                                    ; preds = %.preheader424.1
  %2371 = icmp sgt i32 %.3193, 0
  br i1 %2371, label %.lr.ph754, label %._crit_edge755

.lr.ph754:                                        ; preds = %.preheader423
  %2372 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 21
  %2373 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 22
  %wide.trip.count1050 = zext i32 %.3193 to i64
  br label %2374

; <label>:2374:                                   ; preds = %2403, %.lr.ph754
  %indvars.iv1048 = phi i64 [ 0, %.lr.ph754 ], [ %indvars.iv.next1049, %2403 ]
  %2375 = load i16*, i16** %2372, align 8
  %2376 = getelementptr inbounds i16, i16* %2375, i64 %indvars.iv1048
  %2377 = load i16, i16* %2376, align 2
  %.mask367 = and i16 %2377, 255
  %2378 = zext i16 %.mask367 to i64
  %2379 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 19, i64 %2378
  %2380 = load i32, i32* %2379, align 4
  %2381 = trunc i32 %2380 to i16
  store i16 %2381, i16* %2376, align 2
  %2382 = and i64 %indvars.iv1048, 1
  %2383 = icmp eq i64 %2382, 0
  %2384 = load i8*, i8** %2373, align 8
  %2385 = trunc i64 %indvars.iv1048 to i32
  %2386 = ashr i32 %2385, 1
  %2387 = sext i32 %2386 to i64
  %2388 = getelementptr inbounds i8, i8* %2384, i64 %2387
  %2389 = load i8, i8* %2388, align 1
  br i1 %2383, label %2390, label %2396

; <label>:2390:                                   ; preds = %2374
  %2391 = and i8 %2389, -16
  %2392 = zext i8 %2391 to i32
  %2393 = load i32, i32* %2379, align 4
  %2394 = lshr i32 %2393, 16
  %2395 = or i32 %2394, %2392
  br label %2403

; <label>:2396:                                   ; preds = %2374
  %2397 = and i8 %2389, 15
  %2398 = zext i8 %2397 to i32
  %2399 = load i32, i32* %2379, align 4
  %2400 = ashr i32 %2399, 16
  %2401 = shl nsw i32 %2400, 4
  %2402 = or i32 %2401, %2398
  br label %2403

; <label>:2403:                                   ; preds = %2396, %2390
  %.sink380 = phi i32 [ %2402, %2396 ], [ %2395, %2390 ]
  %2404 = trunc i32 %.sink380 to i8
  %2405 = load i8*, i8** %2373, align 8
  %2406 = getelementptr inbounds i8, i8* %2405, i64 %2387
  store i8 %2404, i8* %2406, align 1
  %2407 = load i32, i32* %2379, align 4
  %2408 = add nsw i32 %2407, 1
  store i32 %2408, i32* %2379, align 4
  %indvars.iv.next1049 = add nuw nsw i64 %indvars.iv1048, 1
  %exitcond = icmp eq i64 %indvars.iv.next1049, %wide.trip.count1050
  br i1 %exitcond, label %._crit_edge755.loopexit, label %2374

._crit_edge755.loopexit:                          ; preds = %2403
  br label %._crit_edge755

._crit_edge755:                                   ; preds = %._crit_edge755.loopexit, %.preheader423
  %2409 = load i32, i32* %2291, align 8
  %2410 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 21
  %2411 = load i16*, i16** %2410, align 8
  %2412 = sext i32 %2409 to i64
  %2413 = getelementptr inbounds i16, i16* %2411, i64 %2412
  %2414 = load i16, i16* %2413, align 2
  %2415 = zext i16 %2414 to i32
  %2416 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 22
  %2417 = load i8*, i8** %2416, align 8
  %2418 = ashr i32 %2409, 1
  %2419 = sext i32 %2418 to i64
  %2420 = getelementptr inbounds i8, i8* %2417, i64 %2419
  %2421 = load i8, i8* %2420, align 1
  %2422 = zext i8 %2421 to i32
  %2423 = shl i32 %2409, 2
  %2424 = and i32 %2423, 4
  %2425 = lshr i32 %2422, %2424
  %2426 = shl nuw nsw i32 %2425, 16
  %2427 = and i32 %2426, 983040
  %2428 = or i32 %2427, %2415
  br label %2429

; <label>:2429:                                   ; preds = %2464, %._crit_edge755
  %.2639 = phi i32 [ %2428, %._crit_edge755 ], [ %2446, %2464 ]
  %.37 = phi i32 [ %2409, %._crit_edge755 ], [ %.2639, %2464 ]
  %2430 = load i16*, i16** %2410, align 8
  %2431 = sext i32 %.2639 to i64
  %2432 = getelementptr inbounds i16, i16* %2430, i64 %2431
  %2433 = load i16, i16* %2432, align 2
  %2434 = zext i16 %2433 to i32
  %2435 = load i8*, i8** %2416, align 8
  %2436 = ashr i32 %.2639, 1
  %2437 = sext i32 %2436 to i64
  %2438 = getelementptr inbounds i8, i8* %2435, i64 %2437
  %2439 = load i8, i8* %2438, align 1
  %2440 = zext i8 %2439 to i32
  %2441 = shl nsw i32 %.2639, 2
  %2442 = and i32 %2441, 4
  %2443 = lshr i32 %2440, %2442
  %2444 = shl nuw nsw i32 %2443, 16
  %2445 = and i32 %2444, 983040
  %2446 = or i32 %2445, %2434
  %2447 = trunc i32 %.37 to i16
  store i16 %2447, i16* %2432, align 2
  %2448 = and i32 %.2639, 1
  %2449 = icmp eq i32 %2448, 0
  %2450 = load i8*, i8** %2416, align 8
  %2451 = getelementptr inbounds i8, i8* %2450, i64 %2437
  %2452 = load i8, i8* %2451, align 1
  br i1 %2449, label %2453, label %2458

; <label>:2453:                                   ; preds = %2429
  %2454 = and i8 %2452, -16
  %2455 = zext i8 %2454 to i32
  %2456 = lshr i32 %.37, 16
  %2457 = or i32 %2455, %2456
  br label %2464

; <label>:2458:                                   ; preds = %2429
  %2459 = and i8 %2452, 15
  %2460 = zext i8 %2459 to i32
  %2461 = ashr i32 %.37, 16
  %2462 = shl nsw i32 %2461, 4
  %2463 = or i32 %2460, %2462
  br label %2464

; <label>:2464:                                   ; preds = %2458, %2453
  %.sink387 = phi i32 [ %2463, %2458 ], [ %2457, %2453 ]
  %2465 = trunc i32 %.sink387 to i8
  %2466 = load i8*, i8** %2416, align 8
  %2467 = getelementptr inbounds i8, i8* %2466, i64 %2437
  store i8 %2465, i8* %2467, align 1
  %2468 = load i32, i32* %2291, align 8
  %2469 = icmp eq i32 %.2639, %2468
  br i1 %2469, label %2470, label %2429

; <label>:2470:                                   ; preds = %2464
  %2471 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 14
  store i32 %2468, i32* %2471, align 4
  %2472 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 17
  store i32 0, i32* %2472, align 4
  %2473 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 4
  %2474 = load i8, i8* %2473, align 4
  %2475 = icmp eq i8 %2474, 0
  br i1 %2475, label %2518, label %2476

; <label>:2476:                                   ; preds = %2470
  %2477 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 5
  store i32 0, i32* %2477, align 8
  %2478 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 6
  store i32 0, i32* %2478, align 4
  %2479 = load i32, i32* %2471, align 4
  %2480 = tail call i32 @BZ2_indexIntoF(i32 %2479, i32* nonnull %2296) #4
  %2481 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 15
  store i32 %2480, i32* %2481, align 8
  %2482 = load i16*, i16** %2410, align 8
  %2483 = load i32, i32* %2471, align 4
  %2484 = zext i32 %2483 to i64
  %2485 = getelementptr inbounds i16, i16* %2482, i64 %2484
  %2486 = load i16, i16* %2485, align 2
  %2487 = zext i16 %2486 to i32
  %2488 = load i8*, i8** %2416, align 8
  %2489 = lshr i32 %2483, 1
  %2490 = zext i32 %2489 to i64
  %2491 = getelementptr inbounds i8, i8* %2488, i64 %2490
  %2492 = load i8, i8* %2491, align 1
  %2493 = zext i8 %2492 to i32
  %2494 = shl i32 %2483, 2
  %2495 = and i32 %2494, 4
  %2496 = lshr i32 %2493, %2495
  %2497 = shl nuw nsw i32 %2496, 16
  %2498 = and i32 %2497, 983040
  %2499 = or i32 %2498, %2487
  store i32 %2499, i32* %2471, align 4
  %2500 = load i32, i32* %2472, align 4
  %2501 = add nsw i32 %2500, 1
  store i32 %2501, i32* %2472, align 4
  %2502 = load i32, i32* %2477, align 8
  %2503 = icmp eq i32 %2502, 0
  br i1 %2503, label %2504, label %2511

; <label>:2504:                                   ; preds = %2476
  %2505 = load i32, i32* %2478, align 4
  %2506 = sext i32 %2505 to i64
  %2507 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %2506
  %2508 = load i32, i32* %2507, align 4
  store i32 %2508, i32* %2477, align 8
  %2509 = add nsw i32 %2505, 1
  %2510 = icmp eq i32 %2509, 512
  %. = select i1 %2510, i32 0, i32 %2509
  store i32 %., i32* %2478, align 4
  br label %2511

; <label>:2511:                                   ; preds = %2504, %2476
  %2512 = load i32, i32* %2477, align 8
  %2513 = add nsw i32 %2512, -1
  store i32 %2513, i32* %2477, align 8
  %2514 = icmp eq i32 %2513, 1
  %2515 = zext i1 %2514 to i32
  %2516 = load i32, i32* %2481, align 8
  %2517 = xor i32 %2515, %2516
  store i32 %2517, i32* %2481, align 8
  br label %.loopexit

; <label>:2518:                                   ; preds = %2470
  %2519 = load i32, i32* %2471, align 4
  %2520 = tail call i32 @BZ2_indexIntoF(i32 %2519, i32* nonnull %2296) #4
  %2521 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 15
  store i32 %2520, i32* %2521, align 8
  %2522 = load i16*, i16** %2410, align 8
  %2523 = load i32, i32* %2471, align 4
  %2524 = zext i32 %2523 to i64
  %2525 = getelementptr inbounds i16, i16* %2522, i64 %2524
  %2526 = load i16, i16* %2525, align 2
  %2527 = zext i16 %2526 to i32
  %2528 = load i8*, i8** %2416, align 8
  %2529 = lshr i32 %2523, 1
  %2530 = zext i32 %2529 to i64
  %2531 = getelementptr inbounds i8, i8* %2528, i64 %2530
  %2532 = load i8, i8* %2531, align 1
  %2533 = zext i8 %2532 to i32
  %2534 = shl i32 %2523, 2
  %2535 = and i32 %2534, 4
  %2536 = lshr i32 %2533, %2535
  %2537 = shl nuw nsw i32 %2536, 16
  %2538 = and i32 %2537, 983040
  %2539 = or i32 %2538, %2527
  store i32 %2539, i32* %2471, align 4
  %2540 = load i32, i32* %2472, align 4
  %2541 = add nsw i32 %2540, 1
  store i32 %2541, i32* %2472, align 4
  br label %.loopexit

.lr.ph748:                                        ; preds = %.lr.ph748, %.lr.ph748.preheader1138
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph748 ], [ %indvars.iv.unr, %.lr.ph748.preheader1138 ]
  %2542 = phi i32* [ %2570, %.lr.ph748 ], [ %.unr, %.lr.ph748.preheader1138 ]
  %2543 = getelementptr inbounds i32, i32* %2542, i64 %indvars.iv
  %2544 = load i32, i32* %2543, align 4
  %2545 = trunc i64 %indvars.iv to i32
  %2546 = shl i32 %2545, 8
  %.mask = and i32 %2544, 255
  %2547 = zext i32 %.mask to i64
  %2548 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %2547
  %2549 = load i32, i32* %2548, align 4
  %2550 = sext i32 %2549 to i64
  %2551 = getelementptr inbounds i32, i32* %2542, i64 %2550
  %2552 = load i32, i32* %2551, align 4
  %2553 = or i32 %2552, %2546
  store i32 %2553, i32* %2551, align 4
  %2554 = load i32, i32* %2548, align 4
  %2555 = add nsw i32 %2554, 1
  store i32 %2555, i32* %2548, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %2556 = load i32*, i32** %2362, align 8
  %2557 = getelementptr inbounds i32, i32* %2556, i64 %indvars.iv.next
  %2558 = load i32, i32* %2557, align 4
  %2559 = trunc i64 %indvars.iv.next to i32
  %2560 = shl i32 %2559, 8
  %.mask.1 = and i32 %2558, 255
  %2561 = zext i32 %.mask.1 to i64
  %2562 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %2561
  %2563 = load i32, i32* %2562, align 4
  %2564 = sext i32 %2563 to i64
  %2565 = getelementptr inbounds i32, i32* %2556, i64 %2564
  %2566 = load i32, i32* %2565, align 4
  %2567 = or i32 %2566, %2560
  store i32 %2567, i32* %2565, align 4
  %2568 = load i32, i32* %2562, align 4
  %2569 = add nsw i32 %2568, 1
  store i32 %2569, i32* %2562, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %2570 = load i32*, i32** %2362, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge749.loopexit, label %.lr.ph748

._crit_edge749.loopexit:                          ; preds = %.lr.ph748
  br label %._crit_edge749

._crit_edge749:                                   ; preds = %._crit_edge749.loopexit, %.lr.ph748.prol.loopexit, %.preheader
  %.38.lcssa = phi i32 [ 0, %.preheader ], [ 1, %.lr.ph748.prol.loopexit ], [ %.3193, %._crit_edge749.loopexit ]
  %.lcssa560 = phi i32* [ %2363, %.preheader ], [ %.lcssa1002.unr, %.lr.ph748.prol.loopexit ], [ %2570, %._crit_edge749.loopexit ]
  %2571 = load i32, i32* %2291, align 8
  %2572 = sext i32 %2571 to i64
  %2573 = getelementptr inbounds i32, i32* %.lcssa560, i64 %2572
  %2574 = load i32, i32* %2573, align 4
  %2575 = lshr i32 %2574, 8
  %2576 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 14
  store i32 %2575, i32* %2576, align 4
  %2577 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 17
  store i32 0, i32* %2577, align 4
  %2578 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 4
  %2579 = load i8, i8* %2578, align 4
  %2580 = icmp eq i8 %2579, 0
  br i1 %2580, label %2610, label %2581

; <label>:2581:                                   ; preds = %._crit_edge749
  %2582 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 5
  store i32 0, i32* %2582, align 8
  %2583 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 6
  store i32 0, i32* %2583, align 4
  %2584 = load i32*, i32** %2362, align 8
  %2585 = load i32, i32* %2576, align 4
  %2586 = zext i32 %2585 to i64
  %2587 = getelementptr inbounds i32, i32* %2584, i64 %2586
  %2588 = load i32, i32* %2587, align 4
  %2589 = and i32 %2588, 255
  %2590 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 15
  store i32 %2589, i32* %2590, align 8
  %2591 = lshr i32 %2588, 8
  store i32 %2591, i32* %2576, align 4
  %2592 = load i32, i32* %2577, align 4
  %2593 = add nsw i32 %2592, 1
  store i32 %2593, i32* %2577, align 4
  %2594 = load i32, i32* %2582, align 8
  %2595 = icmp eq i32 %2594, 0
  br i1 %2595, label %2596, label %2603

; <label>:2596:                                   ; preds = %2581
  %2597 = load i32, i32* %2583, align 4
  %2598 = sext i32 %2597 to i64
  %2599 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %2598
  %2600 = load i32, i32* %2599, align 4
  store i32 %2600, i32* %2582, align 8
  %2601 = add nsw i32 %2597, 1
  %2602 = icmp eq i32 %2601, 512
  %.391 = select i1 %2602, i32 0, i32 %2601
  store i32 %.391, i32* %2583, align 4
  br label %2603

; <label>:2603:                                   ; preds = %2596, %2581
  %2604 = load i32, i32* %2582, align 8
  %2605 = add nsw i32 %2604, -1
  store i32 %2605, i32* %2582, align 8
  %2606 = icmp eq i32 %2605, 1
  %2607 = zext i1 %2606 to i32
  %2608 = load i32, i32* %2590, align 8
  %2609 = xor i32 %2607, %2608
  store i32 %2609, i32* %2590, align 8
  br label %.loopexit

; <label>:2610:                                   ; preds = %._crit_edge749
  %2611 = load i32*, i32** %2362, align 8
  %2612 = load i32, i32* %2576, align 4
  %2613 = zext i32 %2612 to i64
  %2614 = getelementptr inbounds i32, i32* %2611, i64 %2613
  %2615 = load i32, i32* %2614, align 4
  %2616 = and i32 %2615, 255
  %2617 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 15
  store i32 %2616, i32* %2617, align 8
  %2618 = lshr i32 %2615, 8
  store i32 %2618, i32* %2576, align 4
  %2619 = load i32, i32* %2577, align 4
  %2620 = add nsw i32 %2619, 1
  store i32 %2620, i32* %2577, align 4
  br label %.loopexit

; <label>:2621:                                   ; preds = %._crit_edge918, %11
  store i32 42, i32* %5, align 8
  %2622 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %2623 = load i32, i32* %2622, align 4
  %2624 = icmp sgt i32 %2623, 7
  br i1 %2624, label %._crit_edge709, label %.lr.ph708

.lr.ph708:                                        ; preds = %2621
  %2625 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %2632

._crit_edge709.loopexit:                          ; preds = %.backedge408
  br label %._crit_edge709

._crit_edge709:                                   ; preds = %._crit_edge709.loopexit, %2621
  %.lcssa528 = phi i32 [ %2623, %2621 ], [ %2667, %._crit_edge709.loopexit ]
  %2626 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %2627 = load i32, i32* %2626, align 8
  %2628 = add nsw i32 %.lcssa528, -8
  store i32 %2628, i32* %2622, align 4
  %2629 = lshr i32 %2627, %2628
  %2630 = and i32 %2629, 255
  %2631 = icmp eq i32 %2630, 114
  br i1 %2631, label %2669, label %.loopexit

; <label>:2632:                                   ; preds = %.backedge408, %.lr.ph708
  %2633 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2634 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2633, i64 0, i32 1
  %2635 = load i32, i32* %2634, align 8
  %2636 = icmp eq i32 %2635, 0
  br i1 %2636, label %.loopexit.loopexit1333, label %2637

; <label>:2637:                                   ; preds = %2632
  %2638 = load i32, i32* %2625, align 8
  %2639 = shl i32 %2638, 8
  %2640 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2633, i64 0, i32 0
  %2641 = load i8*, i8** %2640, align 8
  %2642 = load i8, i8* %2641, align 1
  %2643 = zext i8 %2642 to i32
  %2644 = or i32 %2643, %2639
  store i32 %2644, i32* %2625, align 8
  %2645 = load i32, i32* %2622, align 4
  %2646 = add nsw i32 %2645, 8
  store i32 %2646, i32* %2622, align 4
  %2647 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2648 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2647, i64 0, i32 0
  %2649 = load i8*, i8** %2648, align 8
  %2650 = getelementptr inbounds i8, i8* %2649, i64 1
  store i8* %2650, i8** %2648, align 8
  %2651 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2652 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2651, i64 0, i32 1
  %2653 = load i32, i32* %2652, align 8
  %2654 = add i32 %2653, -1
  store i32 %2654, i32* %2652, align 8
  %2655 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2656 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2655, i64 0, i32 2
  %2657 = load i32, i32* %2656, align 4
  %2658 = add i32 %2657, 1
  store i32 %2658, i32* %2656, align 4
  %2659 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2660 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2659, i64 0, i32 2
  %2661 = load i32, i32* %2660, align 4
  %2662 = icmp eq i32 %2661, 0
  br i1 %2662, label %2663, label %.backedge408

; <label>:2663:                                   ; preds = %2637
  %2664 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2659, i64 0, i32 3
  %2665 = load i32, i32* %2664, align 8
  %2666 = add i32 %2665, 1
  store i32 %2666, i32* %2664, align 8
  br label %.backedge408

.backedge408:                                     ; preds = %2663, %2637
  %2667 = load i32, i32* %2622, align 4
  %2668 = icmp sgt i32 %2667, 7
  br i1 %2668, label %._crit_edge709.loopexit, label %2632

; <label>:2669:                                   ; preds = %._crit_edge709, %11
  store i32 43, i32* %5, align 8
  %2670 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %2671 = load i32, i32* %2670, align 4
  %2672 = icmp sgt i32 %2671, 7
  br i1 %2672, label %._crit_edge704, label %.lr.ph703

.lr.ph703:                                        ; preds = %2669
  %2673 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %2680

._crit_edge704.loopexit:                          ; preds = %.backedge406
  br label %._crit_edge704

._crit_edge704:                                   ; preds = %._crit_edge704.loopexit, %2669
  %.lcssa524 = phi i32 [ %2671, %2669 ], [ %2715, %._crit_edge704.loopexit ]
  %2674 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %2675 = load i32, i32* %2674, align 8
  %2676 = add nsw i32 %.lcssa524, -8
  store i32 %2676, i32* %2670, align 4
  %2677 = lshr i32 %2675, %2676
  %2678 = and i32 %2677, 255
  %2679 = icmp eq i32 %2678, 69
  br i1 %2679, label %2717, label %.loopexit

; <label>:2680:                                   ; preds = %.backedge406, %.lr.ph703
  %2681 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2682 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2681, i64 0, i32 1
  %2683 = load i32, i32* %2682, align 8
  %2684 = icmp eq i32 %2683, 0
  br i1 %2684, label %.loopexit.loopexit1332, label %2685

; <label>:2685:                                   ; preds = %2680
  %2686 = load i32, i32* %2673, align 8
  %2687 = shl i32 %2686, 8
  %2688 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2681, i64 0, i32 0
  %2689 = load i8*, i8** %2688, align 8
  %2690 = load i8, i8* %2689, align 1
  %2691 = zext i8 %2690 to i32
  %2692 = or i32 %2691, %2687
  store i32 %2692, i32* %2673, align 8
  %2693 = load i32, i32* %2670, align 4
  %2694 = add nsw i32 %2693, 8
  store i32 %2694, i32* %2670, align 4
  %2695 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2696 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2695, i64 0, i32 0
  %2697 = load i8*, i8** %2696, align 8
  %2698 = getelementptr inbounds i8, i8* %2697, i64 1
  store i8* %2698, i8** %2696, align 8
  %2699 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2700 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2699, i64 0, i32 1
  %2701 = load i32, i32* %2700, align 8
  %2702 = add i32 %2701, -1
  store i32 %2702, i32* %2700, align 8
  %2703 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2704 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2703, i64 0, i32 2
  %2705 = load i32, i32* %2704, align 4
  %2706 = add i32 %2705, 1
  store i32 %2706, i32* %2704, align 4
  %2707 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2708 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2707, i64 0, i32 2
  %2709 = load i32, i32* %2708, align 4
  %2710 = icmp eq i32 %2709, 0
  br i1 %2710, label %2711, label %.backedge406

; <label>:2711:                                   ; preds = %2685
  %2712 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2707, i64 0, i32 3
  %2713 = load i32, i32* %2712, align 8
  %2714 = add i32 %2713, 1
  store i32 %2714, i32* %2712, align 8
  br label %.backedge406

.backedge406:                                     ; preds = %2711, %2685
  %2715 = load i32, i32* %2670, align 4
  %2716 = icmp sgt i32 %2715, 7
  br i1 %2716, label %._crit_edge704.loopexit, label %2680

; <label>:2717:                                   ; preds = %._crit_edge704, %11
  store i32 44, i32* %5, align 8
  %2718 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %2719 = load i32, i32* %2718, align 4
  %2720 = icmp sgt i32 %2719, 7
  br i1 %2720, label %._crit_edge699, label %.lr.ph698

.lr.ph698:                                        ; preds = %2717
  %2721 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %2728

._crit_edge699.loopexit:                          ; preds = %.backedge404
  br label %._crit_edge699

._crit_edge699:                                   ; preds = %._crit_edge699.loopexit, %2717
  %.lcssa520 = phi i32 [ %2719, %2717 ], [ %2763, %._crit_edge699.loopexit ]
  %2722 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %2723 = load i32, i32* %2722, align 8
  %2724 = add nsw i32 %.lcssa520, -8
  store i32 %2724, i32* %2718, align 4
  %2725 = lshr i32 %2723, %2724
  %2726 = and i32 %2725, 255
  %2727 = icmp eq i32 %2726, 56
  br i1 %2727, label %2765, label %.loopexit

; <label>:2728:                                   ; preds = %.backedge404, %.lr.ph698
  %2729 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2730 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2729, i64 0, i32 1
  %2731 = load i32, i32* %2730, align 8
  %2732 = icmp eq i32 %2731, 0
  br i1 %2732, label %.loopexit.loopexit1331, label %2733

; <label>:2733:                                   ; preds = %2728
  %2734 = load i32, i32* %2721, align 8
  %2735 = shl i32 %2734, 8
  %2736 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2729, i64 0, i32 0
  %2737 = load i8*, i8** %2736, align 8
  %2738 = load i8, i8* %2737, align 1
  %2739 = zext i8 %2738 to i32
  %2740 = or i32 %2739, %2735
  store i32 %2740, i32* %2721, align 8
  %2741 = load i32, i32* %2718, align 4
  %2742 = add nsw i32 %2741, 8
  store i32 %2742, i32* %2718, align 4
  %2743 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2744 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2743, i64 0, i32 0
  %2745 = load i8*, i8** %2744, align 8
  %2746 = getelementptr inbounds i8, i8* %2745, i64 1
  store i8* %2746, i8** %2744, align 8
  %2747 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2748 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2747, i64 0, i32 1
  %2749 = load i32, i32* %2748, align 8
  %2750 = add i32 %2749, -1
  store i32 %2750, i32* %2748, align 8
  %2751 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2752 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2751, i64 0, i32 2
  %2753 = load i32, i32* %2752, align 4
  %2754 = add i32 %2753, 1
  store i32 %2754, i32* %2752, align 4
  %2755 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2756 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2755, i64 0, i32 2
  %2757 = load i32, i32* %2756, align 4
  %2758 = icmp eq i32 %2757, 0
  br i1 %2758, label %2759, label %.backedge404

; <label>:2759:                                   ; preds = %2733
  %2760 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2755, i64 0, i32 3
  %2761 = load i32, i32* %2760, align 8
  %2762 = add i32 %2761, 1
  store i32 %2762, i32* %2760, align 8
  br label %.backedge404

.backedge404:                                     ; preds = %2759, %2733
  %2763 = load i32, i32* %2718, align 4
  %2764 = icmp sgt i32 %2763, 7
  br i1 %2764, label %._crit_edge699.loopexit, label %2728

; <label>:2765:                                   ; preds = %._crit_edge699, %11
  store i32 45, i32* %5, align 8
  %2766 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %2767 = load i32, i32* %2766, align 4
  %2768 = icmp sgt i32 %2767, 7
  br i1 %2768, label %._crit_edge694, label %.lr.ph693

.lr.ph693:                                        ; preds = %2765
  %2769 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %2776

._crit_edge694.loopexit:                          ; preds = %.backedge402
  br label %._crit_edge694

._crit_edge694:                                   ; preds = %._crit_edge694.loopexit, %2765
  %.lcssa516 = phi i32 [ %2767, %2765 ], [ %2811, %._crit_edge694.loopexit ]
  %2770 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %2771 = load i32, i32* %2770, align 8
  %2772 = add nsw i32 %.lcssa516, -8
  store i32 %2772, i32* %2766, align 4
  %2773 = lshr i32 %2771, %2772
  %2774 = and i32 %2773, 255
  %2775 = icmp eq i32 %2774, 80
  br i1 %2775, label %2813, label %.loopexit

; <label>:2776:                                   ; preds = %.backedge402, %.lr.ph693
  %2777 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2778 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2777, i64 0, i32 1
  %2779 = load i32, i32* %2778, align 8
  %2780 = icmp eq i32 %2779, 0
  br i1 %2780, label %.loopexit.loopexit1330, label %2781

; <label>:2781:                                   ; preds = %2776
  %2782 = load i32, i32* %2769, align 8
  %2783 = shl i32 %2782, 8
  %2784 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2777, i64 0, i32 0
  %2785 = load i8*, i8** %2784, align 8
  %2786 = load i8, i8* %2785, align 1
  %2787 = zext i8 %2786 to i32
  %2788 = or i32 %2787, %2783
  store i32 %2788, i32* %2769, align 8
  %2789 = load i32, i32* %2766, align 4
  %2790 = add nsw i32 %2789, 8
  store i32 %2790, i32* %2766, align 4
  %2791 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2792 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2791, i64 0, i32 0
  %2793 = load i8*, i8** %2792, align 8
  %2794 = getelementptr inbounds i8, i8* %2793, i64 1
  store i8* %2794, i8** %2792, align 8
  %2795 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2796 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2795, i64 0, i32 1
  %2797 = load i32, i32* %2796, align 8
  %2798 = add i32 %2797, -1
  store i32 %2798, i32* %2796, align 8
  %2799 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2800 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2799, i64 0, i32 2
  %2801 = load i32, i32* %2800, align 4
  %2802 = add i32 %2801, 1
  store i32 %2802, i32* %2800, align 4
  %2803 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2804 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2803, i64 0, i32 2
  %2805 = load i32, i32* %2804, align 4
  %2806 = icmp eq i32 %2805, 0
  br i1 %2806, label %2807, label %.backedge402

; <label>:2807:                                   ; preds = %2781
  %2808 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2803, i64 0, i32 3
  %2809 = load i32, i32* %2808, align 8
  %2810 = add i32 %2809, 1
  store i32 %2810, i32* %2808, align 8
  br label %.backedge402

.backedge402:                                     ; preds = %2807, %2781
  %2811 = load i32, i32* %2766, align 4
  %2812 = icmp sgt i32 %2811, 7
  br i1 %2812, label %._crit_edge694.loopexit, label %2776

; <label>:2813:                                   ; preds = %._crit_edge694, %11
  store i32 46, i32* %5, align 8
  %2814 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %2815 = load i32, i32* %2814, align 4
  %2816 = icmp sgt i32 %2815, 7
  br i1 %2816, label %._crit_edge689, label %.lr.ph688

.lr.ph688:                                        ; preds = %2813
  %2817 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %2824

._crit_edge689.loopexit:                          ; preds = %.backedge400
  br label %._crit_edge689

._crit_edge689:                                   ; preds = %._crit_edge689.loopexit, %2813
  %.lcssa512 = phi i32 [ %2815, %2813 ], [ %2859, %._crit_edge689.loopexit ]
  %2818 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %2819 = load i32, i32* %2818, align 8
  %2820 = add nsw i32 %.lcssa512, -8
  store i32 %2820, i32* %2814, align 4
  %2821 = lshr i32 %2819, %2820
  %2822 = and i32 %2821, 255
  %2823 = icmp eq i32 %2822, 144
  br i1 %2823, label %2861, label %.loopexit

; <label>:2824:                                   ; preds = %.backedge400, %.lr.ph688
  %2825 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2826 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2825, i64 0, i32 1
  %2827 = load i32, i32* %2826, align 8
  %2828 = icmp eq i32 %2827, 0
  br i1 %2828, label %.loopexit.loopexit1329, label %2829

; <label>:2829:                                   ; preds = %2824
  %2830 = load i32, i32* %2817, align 8
  %2831 = shl i32 %2830, 8
  %2832 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2825, i64 0, i32 0
  %2833 = load i8*, i8** %2832, align 8
  %2834 = load i8, i8* %2833, align 1
  %2835 = zext i8 %2834 to i32
  %2836 = or i32 %2835, %2831
  store i32 %2836, i32* %2817, align 8
  %2837 = load i32, i32* %2814, align 4
  %2838 = add nsw i32 %2837, 8
  store i32 %2838, i32* %2814, align 4
  %2839 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2840 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2839, i64 0, i32 0
  %2841 = load i8*, i8** %2840, align 8
  %2842 = getelementptr inbounds i8, i8* %2841, i64 1
  store i8* %2842, i8** %2840, align 8
  %2843 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2844 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2843, i64 0, i32 1
  %2845 = load i32, i32* %2844, align 8
  %2846 = add i32 %2845, -1
  store i32 %2846, i32* %2844, align 8
  %2847 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2848 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2847, i64 0, i32 2
  %2849 = load i32, i32* %2848, align 4
  %2850 = add i32 %2849, 1
  store i32 %2850, i32* %2848, align 4
  %2851 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2852 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2851, i64 0, i32 2
  %2853 = load i32, i32* %2852, align 4
  %2854 = icmp eq i32 %2853, 0
  br i1 %2854, label %2855, label %.backedge400

; <label>:2855:                                   ; preds = %2829
  %2856 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2851, i64 0, i32 3
  %2857 = load i32, i32* %2856, align 8
  %2858 = add i32 %2857, 1
  store i32 %2858, i32* %2856, align 8
  br label %.backedge400

.backedge400:                                     ; preds = %2855, %2829
  %2859 = load i32, i32* %2814, align 4
  %2860 = icmp sgt i32 %2859, 7
  br i1 %2860, label %._crit_edge689.loopexit, label %2824

; <label>:2861:                                   ; preds = %._crit_edge689
  %2862 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 24
  store i32 0, i32* %2862, align 4
  br label %2863

; <label>:2863:                                   ; preds = %2861, %11
  store i32 47, i32* %5, align 8
  %2864 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %2865 = load i32, i32* %2864, align 4
  %2866 = icmp sgt i32 %2865, 7
  br i1 %2866, label %._crit_edge684, label %.lr.ph683

.lr.ph683:                                        ; preds = %2863
  %2867 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %2877

._crit_edge684.loopexit:                          ; preds = %.backedge398
  br label %._crit_edge684

._crit_edge684:                                   ; preds = %._crit_edge684.loopexit, %2863
  %.lcssa508 = phi i32 [ %2865, %2863 ], [ %2912, %._crit_edge684.loopexit ]
  %2868 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %2869 = load i32, i32* %2868, align 8
  %2870 = add nsw i32 %.lcssa508, -8
  store i32 %2870, i32* %2864, align 4
  %2871 = lshr i32 %2869, %2870
  %2872 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 24
  %2873 = load i32, i32* %2872, align 4
  %2874 = shl i32 %2873, 8
  %2875 = and i32 %2871, 255
  %2876 = or i32 %2874, %2875
  store i32 %2876, i32* %2872, align 4
  br label %2914

; <label>:2877:                                   ; preds = %.backedge398, %.lr.ph683
  %2878 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2879 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2878, i64 0, i32 1
  %2880 = load i32, i32* %2879, align 8
  %2881 = icmp eq i32 %2880, 0
  br i1 %2881, label %.loopexit.loopexit1328, label %2882

; <label>:2882:                                   ; preds = %2877
  %2883 = load i32, i32* %2867, align 8
  %2884 = shl i32 %2883, 8
  %2885 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2878, i64 0, i32 0
  %2886 = load i8*, i8** %2885, align 8
  %2887 = load i8, i8* %2886, align 1
  %2888 = zext i8 %2887 to i32
  %2889 = or i32 %2888, %2884
  store i32 %2889, i32* %2867, align 8
  %2890 = load i32, i32* %2864, align 4
  %2891 = add nsw i32 %2890, 8
  store i32 %2891, i32* %2864, align 4
  %2892 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2893 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2892, i64 0, i32 0
  %2894 = load i8*, i8** %2893, align 8
  %2895 = getelementptr inbounds i8, i8* %2894, i64 1
  store i8* %2895, i8** %2893, align 8
  %2896 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2897 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2896, i64 0, i32 1
  %2898 = load i32, i32* %2897, align 8
  %2899 = add i32 %2898, -1
  store i32 %2899, i32* %2897, align 8
  %2900 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2901 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2900, i64 0, i32 2
  %2902 = load i32, i32* %2901, align 4
  %2903 = add i32 %2902, 1
  store i32 %2903, i32* %2901, align 4
  %2904 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2905 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2904, i64 0, i32 2
  %2906 = load i32, i32* %2905, align 4
  %2907 = icmp eq i32 %2906, 0
  br i1 %2907, label %2908, label %.backedge398

; <label>:2908:                                   ; preds = %2882
  %2909 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2904, i64 0, i32 3
  %2910 = load i32, i32* %2909, align 8
  %2911 = add i32 %2910, 1
  store i32 %2911, i32* %2909, align 8
  br label %.backedge398

.backedge398:                                     ; preds = %2908, %2882
  %2912 = load i32, i32* %2864, align 4
  %2913 = icmp sgt i32 %2912, 7
  br i1 %2913, label %._crit_edge684.loopexit, label %2877

; <label>:2914:                                   ; preds = %._crit_edge684, %11
  store i32 48, i32* %5, align 8
  %2915 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %2916 = load i32, i32* %2915, align 4
  %2917 = icmp sgt i32 %2916, 7
  br i1 %2917, label %._crit_edge679, label %.lr.ph678

.lr.ph678:                                        ; preds = %2914
  %2918 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %2928

._crit_edge679.loopexit:                          ; preds = %.backedge396
  br label %._crit_edge679

._crit_edge679:                                   ; preds = %._crit_edge679.loopexit, %2914
  %.lcssa504 = phi i32 [ %2916, %2914 ], [ %2963, %._crit_edge679.loopexit ]
  %2919 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %2920 = load i32, i32* %2919, align 8
  %2921 = add nsw i32 %.lcssa504, -8
  store i32 %2921, i32* %2915, align 4
  %2922 = lshr i32 %2920, %2921
  %2923 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 24
  %2924 = load i32, i32* %2923, align 4
  %2925 = shl i32 %2924, 8
  %2926 = and i32 %2922, 255
  %2927 = or i32 %2925, %2926
  store i32 %2927, i32* %2923, align 4
  br label %2965

; <label>:2928:                                   ; preds = %.backedge396, %.lr.ph678
  %2929 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2930 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2929, i64 0, i32 1
  %2931 = load i32, i32* %2930, align 8
  %2932 = icmp eq i32 %2931, 0
  br i1 %2932, label %.loopexit.loopexit1327, label %2933

; <label>:2933:                                   ; preds = %2928
  %2934 = load i32, i32* %2918, align 8
  %2935 = shl i32 %2934, 8
  %2936 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2929, i64 0, i32 0
  %2937 = load i8*, i8** %2936, align 8
  %2938 = load i8, i8* %2937, align 1
  %2939 = zext i8 %2938 to i32
  %2940 = or i32 %2939, %2935
  store i32 %2940, i32* %2918, align 8
  %2941 = load i32, i32* %2915, align 4
  %2942 = add nsw i32 %2941, 8
  store i32 %2942, i32* %2915, align 4
  %2943 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2944 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2943, i64 0, i32 0
  %2945 = load i8*, i8** %2944, align 8
  %2946 = getelementptr inbounds i8, i8* %2945, i64 1
  store i8* %2946, i8** %2944, align 8
  %2947 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2948 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2947, i64 0, i32 1
  %2949 = load i32, i32* %2948, align 8
  %2950 = add i32 %2949, -1
  store i32 %2950, i32* %2948, align 8
  %2951 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2952 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2951, i64 0, i32 2
  %2953 = load i32, i32* %2952, align 4
  %2954 = add i32 %2953, 1
  store i32 %2954, i32* %2952, align 4
  %2955 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2956 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2955, i64 0, i32 2
  %2957 = load i32, i32* %2956, align 4
  %2958 = icmp eq i32 %2957, 0
  br i1 %2958, label %2959, label %.backedge396

; <label>:2959:                                   ; preds = %2933
  %2960 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2955, i64 0, i32 3
  %2961 = load i32, i32* %2960, align 8
  %2962 = add i32 %2961, 1
  store i32 %2962, i32* %2960, align 8
  br label %.backedge396

.backedge396:                                     ; preds = %2959, %2933
  %2963 = load i32, i32* %2915, align 4
  %2964 = icmp sgt i32 %2963, 7
  br i1 %2964, label %._crit_edge679.loopexit, label %2928

; <label>:2965:                                   ; preds = %._crit_edge679, %11
  store i32 49, i32* %5, align 8
  %2966 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %2967 = load i32, i32* %2966, align 4
  %2968 = icmp sgt i32 %2967, 7
  br i1 %2968, label %._crit_edge674, label %.lr.ph673

.lr.ph673:                                        ; preds = %2965
  %2969 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %2979

._crit_edge674.loopexit:                          ; preds = %.backedge394
  br label %._crit_edge674

._crit_edge674:                                   ; preds = %._crit_edge674.loopexit, %2965
  %.lcssa500 = phi i32 [ %2967, %2965 ], [ %3014, %._crit_edge674.loopexit ]
  %2970 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %2971 = load i32, i32* %2970, align 8
  %2972 = add nsw i32 %.lcssa500, -8
  store i32 %2972, i32* %2966, align 4
  %2973 = lshr i32 %2971, %2972
  %2974 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 24
  %2975 = load i32, i32* %2974, align 4
  %2976 = shl i32 %2975, 8
  %2977 = and i32 %2973, 255
  %2978 = or i32 %2976, %2977
  store i32 %2978, i32* %2974, align 4
  br label %3016

; <label>:2979:                                   ; preds = %.backedge394, %.lr.ph673
  %2980 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2981 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2980, i64 0, i32 1
  %2982 = load i32, i32* %2981, align 8
  %2983 = icmp eq i32 %2982, 0
  br i1 %2983, label %.loopexit.loopexit1326, label %2984

; <label>:2984:                                   ; preds = %2979
  %2985 = load i32, i32* %2969, align 8
  %2986 = shl i32 %2985, 8
  %2987 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2980, i64 0, i32 0
  %2988 = load i8*, i8** %2987, align 8
  %2989 = load i8, i8* %2988, align 1
  %2990 = zext i8 %2989 to i32
  %2991 = or i32 %2990, %2986
  store i32 %2991, i32* %2969, align 8
  %2992 = load i32, i32* %2966, align 4
  %2993 = add nsw i32 %2992, 8
  store i32 %2993, i32* %2966, align 4
  %2994 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2995 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2994, i64 0, i32 0
  %2996 = load i8*, i8** %2995, align 8
  %2997 = getelementptr inbounds i8, i8* %2996, i64 1
  store i8* %2997, i8** %2995, align 8
  %2998 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %2999 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2998, i64 0, i32 1
  %3000 = load i32, i32* %2999, align 8
  %3001 = add i32 %3000, -1
  store i32 %3001, i32* %2999, align 8
  %3002 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %3003 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3002, i64 0, i32 2
  %3004 = load i32, i32* %3003, align 4
  %3005 = add i32 %3004, 1
  store i32 %3005, i32* %3003, align 4
  %3006 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %3007 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3006, i64 0, i32 2
  %3008 = load i32, i32* %3007, align 4
  %3009 = icmp eq i32 %3008, 0
  br i1 %3009, label %3010, label %.backedge394

; <label>:3010:                                   ; preds = %2984
  %3011 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3006, i64 0, i32 3
  %3012 = load i32, i32* %3011, align 8
  %3013 = add i32 %3012, 1
  store i32 %3013, i32* %3011, align 8
  br label %.backedge394

.backedge394:                                     ; preds = %3010, %2984
  %3014 = load i32, i32* %2966, align 4
  %3015 = icmp sgt i32 %3014, 7
  br i1 %3015, label %._crit_edge674.loopexit, label %2979

; <label>:3016:                                   ; preds = %._crit_edge674, %11
  store i32 50, i32* %5, align 8
  %3017 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 8
  %3018 = load i32, i32* %3017, align 4
  %3019 = icmp sgt i32 %3018, 7
  br i1 %3019, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %3016
  %3020 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  br label %3030

._crit_edge.loopexit:                             ; preds = %.backedge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3016
  %.lcssa = phi i32 [ %3018, %3016 ], [ %3065, %._crit_edge.loopexit ]
  %3021 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 7
  %3022 = load i32, i32* %3021, align 8
  %3023 = add nsw i32 %.lcssa, -8
  store i32 %3023, i32* %3017, align 4
  %3024 = lshr i32 %3022, %3023
  %3025 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 24
  %3026 = load i32, i32* %3025, align 4
  %3027 = shl i32 %3026, 8
  %3028 = and i32 %3024, 255
  %3029 = or i32 %3027, %3028
  store i32 %3029, i32* %3025, align 4
  store i32 1, i32* %5, align 8
  br label %.loopexit

; <label>:3030:                                   ; preds = %.backedge, %.lr.ph
  %3031 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %3032 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3031, i64 0, i32 1
  %3033 = load i32, i32* %3032, align 8
  %3034 = icmp eq i32 %3033, 0
  br i1 %3034, label %.loopexit.loopexit, label %3035

; <label>:3035:                                   ; preds = %3030
  %3036 = load i32, i32* %3020, align 8
  %3037 = shl i32 %3036, 8
  %3038 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3031, i64 0, i32 0
  %3039 = load i8*, i8** %3038, align 8
  %3040 = load i8, i8* %3039, align 1
  %3041 = zext i8 %3040 to i32
  %3042 = or i32 %3041, %3037
  store i32 %3042, i32* %3020, align 8
  %3043 = load i32, i32* %3017, align 4
  %3044 = add nsw i32 %3043, 8
  store i32 %3044, i32* %3017, align 4
  %3045 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %3046 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3045, i64 0, i32 0
  %3047 = load i8*, i8** %3046, align 8
  %3048 = getelementptr inbounds i8, i8* %3047, i64 1
  store i8* %3048, i8** %3046, align 8
  %3049 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %3050 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3049, i64 0, i32 1
  %3051 = load i32, i32* %3050, align 8
  %3052 = add i32 %3051, -1
  store i32 %3052, i32* %3050, align 8
  %3053 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %3054 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3053, i64 0, i32 2
  %3055 = load i32, i32* %3054, align 4
  %3056 = add i32 %3055, 1
  store i32 %3056, i32* %3054, align 4
  %3057 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %3058 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3057, i64 0, i32 2
  %3059 = load i32, i32* %3058, align 4
  %3060 = icmp eq i32 %3059, 0
  br i1 %3060, label %3061, label %.backedge

; <label>:3061:                                   ; preds = %3035
  %3062 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3057, i64 0, i32 3
  %3063 = load i32, i32* %3062, align 8
  %3064 = add i32 %3063, 1
  store i32 %3064, i32* %3062, align 8
  br label %.backedge

.backedge:                                        ; preds = %3061, %3035
  %3065 = load i32, i32* %3017, align 4
  %3066 = icmp sgt i32 %3065, 7
  br i1 %3066, label %._crit_edge.loopexit, label %3030

; <label>:3067:                                   ; preds = %11
  tail call void @BZ2_bz__AssertH__fail(i32 4001) #4
  tail call void @BZ2_bz__AssertH__fail(i32 4002) #4
  br label %.loopexit

.loopexit.loopexit956.loopexit:                   ; preds = %.preheader425, %.preheader425.31058, %.preheader425.21057, %.preheader425.1
  %.34757.lcssa.wide.ph = phi i64 [ %indvars.iv.next1056.3, %.preheader425 ], [ %indvars.iv.next1056, %.preheader425.1 ], [ %indvars.iv.next1056.1, %.preheader425.21057 ], [ %indvars.iv.next1056.2, %.preheader425.31058 ]
  br label %.loopexit.loopexit956

.loopexit.loopexit956:                            ; preds = %.loopexit.loopexit956.loopexit, %.preheader425.preheader
  %.34757.lcssa.wide = phi i64 [ 0, %.preheader425.preheader ], [ %.34757.lcssa.wide.ph, %.loopexit.loopexit956.loopexit ]
  %3068 = trunc i64 %.34757.lcssa.wide to i32
  br label %.loopexit

.loopexit.loopexit958:                            ; preds = %1898
  %3069 = trunc i64 %indvars.iv1066 to i32
  br label %.loopexit

.loopexit.loopexit959:                            ; preds = %1891
  %3070 = trunc i64 %indvars.iv1068 to i32
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %3030
  br label %.loopexit

.loopexit.loopexit1326:                           ; preds = %2979
  br label %.loopexit

.loopexit.loopexit1327:                           ; preds = %2928
  br label %.loopexit

.loopexit.loopexit1328:                           ; preds = %2877
  br label %.loopexit

.loopexit.loopexit1329:                           ; preds = %2824
  br label %.loopexit

.loopexit.loopexit1330:                           ; preds = %2776
  br label %.loopexit

.loopexit.loopexit1331:                           ; preds = %2728
  br label %.loopexit

.loopexit.loopexit1332:                           ; preds = %2680
  br label %.loopexit

.loopexit.loopexit1333:                           ; preds = %2632
  br label %.loopexit

.loopexit.loopexit1334:                           ; preds = %1011
  br label %.loopexit

.loopexit.loopexit1335:                           ; preds = %1067
  br label %.loopexit

.loopexit.loopexit1336:                           ; preds = %1254
  br label %.loopexit

.loopexit.loopexit1337:                           ; preds = %1476
  br label %.loopexit

.loopexit.loopexit1338:                           ; preds = %1427
  br label %.loopexit

.loopexit.loopexit1339:                           ; preds = %1375
  br label %.loopexit

.loopexit.loopexit1340:                           ; preds = %1668
  br label %.loopexit

.loopexit.loopexit1341:                           ; preds = %1815
  br label %.loopexit

.loopexit.loopexit1342:                           ; preds = %1757
  br label %.loopexit

.loopexit.loopexit1343:                           ; preds = %2242
  br label %.loopexit

.loopexit.loopexit1344:                           ; preds = %2184
  br label %.loopexit

.loopexit.loopexit1346:                           ; preds = %1610
  br label %.loopexit

.loopexit.loopexit1350:                           ; preds = %1177
  br label %.loopexit

.loopexit.loopexit1351:                           ; preds = %1129
  br label %.loopexit

.loopexit.loopexit1352:                           ; preds = %953
  br label %.loopexit

.loopexit.loopexit1353:                           ; preds = %901
  br label %.loopexit

.loopexit.loopexit1354:                           ; preds = %850
  br label %.loopexit

.loopexit.loopexit1355:                           ; preds = %799
  br label %.loopexit

.loopexit.loopexit1356:                           ; preds = %749
  br label %.loopexit

.loopexit.loopexit1357:                           ; preds = %698
  br label %.loopexit

.loopexit.loopexit1358:                           ; preds = %647
  br label %.loopexit

.loopexit.loopexit1359:                           ; preds = %596
  br label %.loopexit

.loopexit.loopexit1360:                           ; preds = %533
  br label %.loopexit

.loopexit.loopexit1361:                           ; preds = %485
  br label %.loopexit

.loopexit.loopexit1362:                           ; preds = %437
  br label %.loopexit

.loopexit.loopexit1363:                           ; preds = %389
  br label %.loopexit

.loopexit.loopexit1364:                           ; preds = %341
  br label %.loopexit

.loopexit.loopexit1365:                           ; preds = %293
  br label %.loopexit

.loopexit.loopexit1366:                           ; preds = %217
  br label %.loopexit

.loopexit.loopexit1367:                           ; preds = %168
  br label %.loopexit

.loopexit.loopexit1368:                           ; preds = %120
  br label %.loopexit

.loopexit.loopexit1369:                           ; preds = %72
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit1369, %.loopexit.loopexit1368, %.loopexit.loopexit1367, %.loopexit.loopexit1366, %.loopexit.loopexit1365, %.loopexit.loopexit1364, %.loopexit.loopexit1363, %.loopexit.loopexit1362, %.loopexit.loopexit1361, %.loopexit.loopexit1360, %.loopexit.loopexit1359, %.loopexit.loopexit1358, %.loopexit.loopexit1357, %.loopexit.loopexit1356, %.loopexit.loopexit1355, %.loopexit.loopexit1354, %.loopexit.loopexit1353, %.loopexit.loopexit1352, %.loopexit.loopexit1351, %.loopexit.loopexit1350, %.loopexit.loopexit1346, %.loopexit.loopexit1344, %.loopexit.loopexit1343, %.loopexit.loopexit1342, %.loopexit.loopexit1341, %.loopexit.loopexit1340, %.loopexit.loopexit1339, %.loopexit.loopexit1338, %.loopexit.loopexit1337, %.loopexit.loopexit1336, %.loopexit.loopexit1335, %.loopexit.loopexit1334, %.loopexit.loopexit1333, %.loopexit.loopexit1332, %.loopexit.loopexit1331, %.loopexit.loopexit1330, %.loopexit.loopexit1329, %.loopexit.loopexit1328, %.loopexit.loopexit1327, %.loopexit.loopexit1326, %.loopexit.loopexit, %.loopexit.loopexit959, %.loopexit.loopexit958, %.loopexit.loopexit956, %3067, %._crit_edge, %._crit_edge689, %._crit_edge694, %._crit_edge699, %._crit_edge704, %._crit_edge709, %2610, %2603, %2518, %2511, %2290, %2283, %2279, %2221, %2156, %1905, %1856, %1852, %1794, %1729, %1709, %1705, %1647, %1586, %1414, %1291, %._crit_edge842, %._crit_edge847, %._crit_edge847, %._crit_edge847, %1113, %990, %._crit_edge853, %._crit_edge893, %._crit_edge898, %._crit_edge903, %._crit_edge908, %._crit_edge913, %._crit_edge918, %278, %263, %._crit_edge923, %._crit_edge928, %._crit_edge933, %._crit_edge938
  %.14356 = phi i32* [ %59, %3067 ], [ %59, %._crit_edge ], [ %59, %._crit_edge938 ], [ %59, %._crit_edge933 ], [ %59, %._crit_edge928 ], [ %59, %._crit_edge923 ], [ %59, %263 ], [ %59, %278 ], [ %59, %._crit_edge913 ], [ %59, %._crit_edge908 ], [ %59, %._crit_edge903 ], [ %59, %._crit_edge898 ], [ %59, %._crit_edge893 ], [ %59, %._crit_edge853 ], [ %59, %990 ], [ %59, %1113 ], [ %59, %._crit_edge847 ], [ %59, %._crit_edge842 ], [ %59, %1291 ], [ %59, %1414 ], [ %59, %1586 ], [ %.2344, %1647 ], [ %.2344, %1709 ], [ %.2344, %1705 ], [ %.5347, %1729 ], [ %.8350, %1794 ], [ %.8350, %1856 ], [ %.8350, %1852 ], [ %.4346, %1905 ], [ %.4346, %2156 ], [ %.12354, %2221 ], [ %.12354, %2283 ], [ %.12354, %2279 ], [ %.4346, %2290 ], [ %.4346, %2603 ], [ %.4346, %2610 ], [ %.4346, %2511 ], [ %.4346, %2518 ], [ %59, %._crit_edge709 ], [ %59, %._crit_edge704 ], [ %59, %._crit_edge699 ], [ %59, %._crit_edge694 ], [ %59, %._crit_edge689 ], [ %59, %._crit_edge847 ], [ %59, %._crit_edge847 ], [ %59, %._crit_edge918 ], [ %.4346, %.loopexit.loopexit956 ], [ %.8350, %.loopexit.loopexit958 ], [ %.8350, %.loopexit.loopexit959 ], [ %59, %.loopexit.loopexit ], [ %59, %.loopexit.loopexit1326 ], [ %59, %.loopexit.loopexit1327 ], [ %59, %.loopexit.loopexit1328 ], [ %59, %.loopexit.loopexit1329 ], [ %59, %.loopexit.loopexit1330 ], [ %59, %.loopexit.loopexit1331 ], [ %59, %.loopexit.loopexit1332 ], [ %59, %.loopexit.loopexit1333 ], [ %59, %.loopexit.loopexit1334 ], [ %59, %.loopexit.loopexit1335 ], [ %59, %.loopexit.loopexit1336 ], [ %59, %.loopexit.loopexit1337 ], [ %59, %.loopexit.loopexit1338 ], [ %59, %.loopexit.loopexit1339 ], [ %.3345, %.loopexit.loopexit1340 ], [ %.9351, %.loopexit.loopexit1341 ], [ %.7349, %.loopexit.loopexit1342 ], [ %.13355, %.loopexit.loopexit1343 ], [ %.11353, %.loopexit.loopexit1344 ], [ %.1343, %.loopexit.loopexit1346 ], [ %59, %.loopexit.loopexit1350 ], [ %59, %.loopexit.loopexit1351 ], [ %59, %.loopexit.loopexit1352 ], [ %59, %.loopexit.loopexit1353 ], [ %59, %.loopexit.loopexit1354 ], [ %59, %.loopexit.loopexit1355 ], [ %59, %.loopexit.loopexit1356 ], [ %59, %.loopexit.loopexit1357 ], [ %59, %.loopexit.loopexit1358 ], [ %59, %.loopexit.loopexit1359 ], [ %59, %.loopexit.loopexit1360 ], [ %59, %.loopexit.loopexit1361 ], [ %59, %.loopexit.loopexit1362 ], [ %59, %.loopexit.loopexit1363 ], [ %59, %.loopexit.loopexit1364 ], [ %59, %.loopexit.loopexit1365 ], [ %59, %.loopexit.loopexit1366 ], [ %59, %.loopexit.loopexit1367 ], [ %59, %.loopexit.loopexit1368 ], [ %59, %.loopexit.loopexit1369 ]
  %.14341 = phi i32* [ %57, %3067 ], [ %57, %._crit_edge ], [ %57, %._crit_edge938 ], [ %57, %._crit_edge933 ], [ %57, %._crit_edge928 ], [ %57, %._crit_edge923 ], [ %57, %263 ], [ %57, %278 ], [ %57, %._crit_edge913 ], [ %57, %._crit_edge908 ], [ %57, %._crit_edge903 ], [ %57, %._crit_edge898 ], [ %57, %._crit_edge893 ], [ %57, %._crit_edge853 ], [ %57, %990 ], [ %57, %1113 ], [ %57, %._crit_edge847 ], [ %57, %._crit_edge842 ], [ %57, %1291 ], [ %57, %1414 ], [ %57, %1586 ], [ %.2329, %1647 ], [ %.2329, %1709 ], [ %.2329, %1705 ], [ %.5332, %1729 ], [ %.8335, %1794 ], [ %.8335, %1856 ], [ %.8335, %1852 ], [ %.4331, %1905 ], [ %.4331, %2156 ], [ %.12339, %2221 ], [ %.12339, %2283 ], [ %.12339, %2279 ], [ %.4331, %2290 ], [ %.4331, %2603 ], [ %.4331, %2610 ], [ %.4331, %2511 ], [ %.4331, %2518 ], [ %57, %._crit_edge709 ], [ %57, %._crit_edge704 ], [ %57, %._crit_edge699 ], [ %57, %._crit_edge694 ], [ %57, %._crit_edge689 ], [ %57, %._crit_edge847 ], [ %57, %._crit_edge847 ], [ %57, %._crit_edge918 ], [ %.4331, %.loopexit.loopexit956 ], [ %.8335, %.loopexit.loopexit958 ], [ %.8335, %.loopexit.loopexit959 ], [ %57, %.loopexit.loopexit ], [ %57, %.loopexit.loopexit1326 ], [ %57, %.loopexit.loopexit1327 ], [ %57, %.loopexit.loopexit1328 ], [ %57, %.loopexit.loopexit1329 ], [ %57, %.loopexit.loopexit1330 ], [ %57, %.loopexit.loopexit1331 ], [ %57, %.loopexit.loopexit1332 ], [ %57, %.loopexit.loopexit1333 ], [ %57, %.loopexit.loopexit1334 ], [ %57, %.loopexit.loopexit1335 ], [ %57, %.loopexit.loopexit1336 ], [ %57, %.loopexit.loopexit1337 ], [ %57, %.loopexit.loopexit1338 ], [ %57, %.loopexit.loopexit1339 ], [ %.3330, %.loopexit.loopexit1340 ], [ %.9336, %.loopexit.loopexit1341 ], [ %.7334, %.loopexit.loopexit1342 ], [ %.13340, %.loopexit.loopexit1343 ], [ %.11338, %.loopexit.loopexit1344 ], [ %.1328, %.loopexit.loopexit1346 ], [ %57, %.loopexit.loopexit1350 ], [ %57, %.loopexit.loopexit1351 ], [ %57, %.loopexit.loopexit1352 ], [ %57, %.loopexit.loopexit1353 ], [ %57, %.loopexit.loopexit1354 ], [ %57, %.loopexit.loopexit1355 ], [ %57, %.loopexit.loopexit1356 ], [ %57, %.loopexit.loopexit1357 ], [ %57, %.loopexit.loopexit1358 ], [ %57, %.loopexit.loopexit1359 ], [ %57, %.loopexit.loopexit1360 ], [ %57, %.loopexit.loopexit1361 ], [ %57, %.loopexit.loopexit1362 ], [ %57, %.loopexit.loopexit1363 ], [ %57, %.loopexit.loopexit1364 ], [ %57, %.loopexit.loopexit1365 ], [ %57, %.loopexit.loopexit1366 ], [ %57, %.loopexit.loopexit1367 ], [ %57, %.loopexit.loopexit1368 ], [ %57, %.loopexit.loopexit1369 ]
  %.14326 = phi i32* [ %55, %3067 ], [ %55, %._crit_edge ], [ %55, %._crit_edge938 ], [ %55, %._crit_edge933 ], [ %55, %._crit_edge928 ], [ %55, %._crit_edge923 ], [ %55, %263 ], [ %55, %278 ], [ %55, %._crit_edge913 ], [ %55, %._crit_edge908 ], [ %55, %._crit_edge903 ], [ %55, %._crit_edge898 ], [ %55, %._crit_edge893 ], [ %55, %._crit_edge853 ], [ %55, %990 ], [ %55, %1113 ], [ %55, %._crit_edge847 ], [ %55, %._crit_edge842 ], [ %55, %1291 ], [ %55, %1414 ], [ %55, %1586 ], [ %.2314, %1647 ], [ %.2314, %1709 ], [ %.2314, %1705 ], [ %.5317, %1729 ], [ %.8320, %1794 ], [ %.8320, %1856 ], [ %.8320, %1852 ], [ %.4316, %1905 ], [ %.4316, %2156 ], [ %.12324, %2221 ], [ %.12324, %2283 ], [ %.12324, %2279 ], [ %.4316, %2290 ], [ %.4316, %2603 ], [ %.4316, %2610 ], [ %.4316, %2511 ], [ %.4316, %2518 ], [ %55, %._crit_edge709 ], [ %55, %._crit_edge704 ], [ %55, %._crit_edge699 ], [ %55, %._crit_edge694 ], [ %55, %._crit_edge689 ], [ %55, %._crit_edge847 ], [ %55, %._crit_edge847 ], [ %55, %._crit_edge918 ], [ %.4316, %.loopexit.loopexit956 ], [ %.8320, %.loopexit.loopexit958 ], [ %.8320, %.loopexit.loopexit959 ], [ %55, %.loopexit.loopexit ], [ %55, %.loopexit.loopexit1326 ], [ %55, %.loopexit.loopexit1327 ], [ %55, %.loopexit.loopexit1328 ], [ %55, %.loopexit.loopexit1329 ], [ %55, %.loopexit.loopexit1330 ], [ %55, %.loopexit.loopexit1331 ], [ %55, %.loopexit.loopexit1332 ], [ %55, %.loopexit.loopexit1333 ], [ %55, %.loopexit.loopexit1334 ], [ %55, %.loopexit.loopexit1335 ], [ %55, %.loopexit.loopexit1336 ], [ %55, %.loopexit.loopexit1337 ], [ %55, %.loopexit.loopexit1338 ], [ %55, %.loopexit.loopexit1339 ], [ %.3315, %.loopexit.loopexit1340 ], [ %.9321, %.loopexit.loopexit1341 ], [ %.7319, %.loopexit.loopexit1342 ], [ %.13325, %.loopexit.loopexit1343 ], [ %.11323, %.loopexit.loopexit1344 ], [ %.1313, %.loopexit.loopexit1346 ], [ %55, %.loopexit.loopexit1350 ], [ %55, %.loopexit.loopexit1351 ], [ %55, %.loopexit.loopexit1352 ], [ %55, %.loopexit.loopexit1353 ], [ %55, %.loopexit.loopexit1354 ], [ %55, %.loopexit.loopexit1355 ], [ %55, %.loopexit.loopexit1356 ], [ %55, %.loopexit.loopexit1357 ], [ %55, %.loopexit.loopexit1358 ], [ %55, %.loopexit.loopexit1359 ], [ %55, %.loopexit.loopexit1360 ], [ %55, %.loopexit.loopexit1361 ], [ %55, %.loopexit.loopexit1362 ], [ %55, %.loopexit.loopexit1363 ], [ %55, %.loopexit.loopexit1364 ], [ %55, %.loopexit.loopexit1365 ], [ %55, %.loopexit.loopexit1366 ], [ %55, %.loopexit.loopexit1367 ], [ %55, %.loopexit.loopexit1368 ], [ %55, %.loopexit.loopexit1369 ]
  %.14311 = phi i32 [ %53, %3067 ], [ %53, %._crit_edge ], [ %53, %._crit_edge938 ], [ %53, %._crit_edge933 ], [ %53, %._crit_edge928 ], [ %53, %._crit_edge923 ], [ %53, %263 ], [ %53, %278 ], [ %53, %._crit_edge913 ], [ %53, %._crit_edge908 ], [ %53, %._crit_edge903 ], [ %53, %._crit_edge898 ], [ %53, %._crit_edge893 ], [ %53, %._crit_edge853 ], [ %53, %990 ], [ %53, %1113 ], [ %53, %._crit_edge847 ], [ %53, %._crit_edge842 ], [ %53, %1291 ], [ %53, %1414 ], [ %53, %1586 ], [ %.2299, %1647 ], [ %.2299, %1709 ], [ %.2299, %1705 ], [ %.5302, %1729 ], [ %.8305, %1794 ], [ %.8305, %1856 ], [ %.8305, %1852 ], [ %.4301, %1905 ], [ %.4301, %2156 ], [ %.12309, %2221 ], [ %.12309, %2283 ], [ %.12309, %2279 ], [ %.4301, %2290 ], [ %.4301, %2603 ], [ %.4301, %2610 ], [ %.4301, %2511 ], [ %.4301, %2518 ], [ %53, %._crit_edge709 ], [ %53, %._crit_edge704 ], [ %53, %._crit_edge699 ], [ %53, %._crit_edge694 ], [ %53, %._crit_edge689 ], [ %53, %._crit_edge847 ], [ %53, %._crit_edge847 ], [ %53, %._crit_edge918 ], [ %.4301, %.loopexit.loopexit956 ], [ %.8305, %.loopexit.loopexit958 ], [ %.8305, %.loopexit.loopexit959 ], [ %53, %.loopexit.loopexit ], [ %53, %.loopexit.loopexit1326 ], [ %53, %.loopexit.loopexit1327 ], [ %53, %.loopexit.loopexit1328 ], [ %53, %.loopexit.loopexit1329 ], [ %53, %.loopexit.loopexit1330 ], [ %53, %.loopexit.loopexit1331 ], [ %53, %.loopexit.loopexit1332 ], [ %53, %.loopexit.loopexit1333 ], [ %53, %.loopexit.loopexit1334 ], [ %53, %.loopexit.loopexit1335 ], [ %53, %.loopexit.loopexit1336 ], [ %53, %.loopexit.loopexit1337 ], [ %53, %.loopexit.loopexit1338 ], [ %53, %.loopexit.loopexit1339 ], [ %.3300, %.loopexit.loopexit1340 ], [ %.9306, %.loopexit.loopexit1341 ], [ %.7304, %.loopexit.loopexit1342 ], [ %.13310, %.loopexit.loopexit1343 ], [ %.11308, %.loopexit.loopexit1344 ], [ %.1298, %.loopexit.loopexit1346 ], [ %53, %.loopexit.loopexit1350 ], [ %53, %.loopexit.loopexit1351 ], [ %53, %.loopexit.loopexit1352 ], [ %53, %.loopexit.loopexit1353 ], [ %53, %.loopexit.loopexit1354 ], [ %53, %.loopexit.loopexit1355 ], [ %53, %.loopexit.loopexit1356 ], [ %53, %.loopexit.loopexit1357 ], [ %53, %.loopexit.loopexit1358 ], [ %53, %.loopexit.loopexit1359 ], [ %53, %.loopexit.loopexit1360 ], [ %53, %.loopexit.loopexit1361 ], [ %53, %.loopexit.loopexit1362 ], [ %53, %.loopexit.loopexit1363 ], [ %53, %.loopexit.loopexit1364 ], [ %53, %.loopexit.loopexit1365 ], [ %53, %.loopexit.loopexit1366 ], [ %53, %.loopexit.loopexit1367 ], [ %53, %.loopexit.loopexit1368 ], [ %53, %.loopexit.loopexit1369 ]
  %.14296 = phi i32 [ %51, %3067 ], [ %51, %._crit_edge ], [ %51, %._crit_edge938 ], [ %51, %._crit_edge933 ], [ %51, %._crit_edge928 ], [ %51, %._crit_edge923 ], [ %51, %263 ], [ %51, %278 ], [ %51, %._crit_edge913 ], [ %51, %._crit_edge908 ], [ %51, %._crit_edge903 ], [ %51, %._crit_edge898 ], [ %51, %._crit_edge893 ], [ %51, %._crit_edge853 ], [ %51, %990 ], [ %51, %1113 ], [ %51, %._crit_edge847 ], [ %51, %._crit_edge842 ], [ %51, %1291 ], [ %51, %1414 ], [ %51, %1586 ], [ %.2284, %1647 ], [ %.2284, %1709 ], [ %.2284, %1705 ], [ %.5287, %1729 ], [ %.8290, %1794 ], [ %.8290, %1856 ], [ %.8290, %1852 ], [ %.4286, %1905 ], [ %.4286, %2156 ], [ %.12294, %2221 ], [ %.12294, %2283 ], [ %.12294, %2279 ], [ %.4286, %2290 ], [ %.4286, %2603 ], [ %.4286, %2610 ], [ %.4286, %2511 ], [ %.4286, %2518 ], [ %51, %._crit_edge709 ], [ %51, %._crit_edge704 ], [ %51, %._crit_edge699 ], [ %51, %._crit_edge694 ], [ %51, %._crit_edge689 ], [ %51, %._crit_edge847 ], [ %51, %._crit_edge847 ], [ %51, %._crit_edge918 ], [ %.4286, %.loopexit.loopexit956 ], [ %.8290, %.loopexit.loopexit958 ], [ %.8290, %.loopexit.loopexit959 ], [ %51, %.loopexit.loopexit ], [ %51, %.loopexit.loopexit1326 ], [ %51, %.loopexit.loopexit1327 ], [ %51, %.loopexit.loopexit1328 ], [ %51, %.loopexit.loopexit1329 ], [ %51, %.loopexit.loopexit1330 ], [ %51, %.loopexit.loopexit1331 ], [ %51, %.loopexit.loopexit1332 ], [ %51, %.loopexit.loopexit1333 ], [ %51, %.loopexit.loopexit1334 ], [ %51, %.loopexit.loopexit1335 ], [ %51, %.loopexit.loopexit1336 ], [ %51, %.loopexit.loopexit1337 ], [ %51, %.loopexit.loopexit1338 ], [ %51, %.loopexit.loopexit1339 ], [ %.3285, %.loopexit.loopexit1340 ], [ %.9291, %.loopexit.loopexit1341 ], [ %.7289, %.loopexit.loopexit1342 ], [ %.13295, %.loopexit.loopexit1343 ], [ %.11293, %.loopexit.loopexit1344 ], [ %.1283, %.loopexit.loopexit1346 ], [ %51, %.loopexit.loopexit1350 ], [ %51, %.loopexit.loopexit1351 ], [ %51, %.loopexit.loopexit1352 ], [ %51, %.loopexit.loopexit1353 ], [ %51, %.loopexit.loopexit1354 ], [ %51, %.loopexit.loopexit1355 ], [ %51, %.loopexit.loopexit1356 ], [ %51, %.loopexit.loopexit1357 ], [ %51, %.loopexit.loopexit1358 ], [ %51, %.loopexit.loopexit1359 ], [ %51, %.loopexit.loopexit1360 ], [ %51, %.loopexit.loopexit1361 ], [ %51, %.loopexit.loopexit1362 ], [ %51, %.loopexit.loopexit1363 ], [ %51, %.loopexit.loopexit1364 ], [ %51, %.loopexit.loopexit1365 ], [ %51, %.loopexit.loopexit1366 ], [ %51, %.loopexit.loopexit1367 ], [ %51, %.loopexit.loopexit1368 ], [ %51, %.loopexit.loopexit1369 ]
  %.10281 = phi i32 [ %49, %3067 ], [ %49, %._crit_edge ], [ %49, %._crit_edge938 ], [ %49, %._crit_edge933 ], [ %49, %._crit_edge928 ], [ %49, %._crit_edge923 ], [ %49, %263 ], [ %49, %278 ], [ %49, %._crit_edge913 ], [ %49, %._crit_edge908 ], [ %49, %._crit_edge903 ], [ %49, %._crit_edge898 ], [ %49, %._crit_edge893 ], [ %49, %._crit_edge853 ], [ %49, %990 ], [ %49, %1113 ], [ %49, %._crit_edge847 ], [ %49, %._crit_edge842 ], [ %49, %1291 ], [ %49, %1414 ], [ %49, %1586 ], [ %.0271, %1647 ], [ %.0271, %1709 ], [ %.0271, %1705 ], [ %.3274, %1729 ], [ %.5276, %1794 ], [ %.5276, %1856 ], [ %.5276, %1852 ], [ %.2273, %1905 ], [ %.2273, %2156 ], [ %.8279, %2221 ], [ %.8279, %2283 ], [ %.8279, %2279 ], [ %.2273, %2290 ], [ %.2273, %2603 ], [ %.2273, %2610 ], [ %.2273, %2511 ], [ %.2273, %2518 ], [ %49, %._crit_edge709 ], [ %49, %._crit_edge704 ], [ %49, %._crit_edge699 ], [ %49, %._crit_edge694 ], [ %49, %._crit_edge689 ], [ %49, %._crit_edge847 ], [ %49, %._crit_edge847 ], [ %49, %._crit_edge918 ], [ %.2273, %.loopexit.loopexit956 ], [ %.5276, %.loopexit.loopexit958 ], [ %.5276, %.loopexit.loopexit959 ], [ %49, %.loopexit.loopexit ], [ %49, %.loopexit.loopexit1326 ], [ %49, %.loopexit.loopexit1327 ], [ %49, %.loopexit.loopexit1328 ], [ %49, %.loopexit.loopexit1329 ], [ %49, %.loopexit.loopexit1330 ], [ %49, %.loopexit.loopexit1331 ], [ %49, %.loopexit.loopexit1332 ], [ %49, %.loopexit.loopexit1333 ], [ %49, %.loopexit.loopexit1334 ], [ %49, %.loopexit.loopexit1335 ], [ %49, %.loopexit.loopexit1336 ], [ %49, %.loopexit.loopexit1337 ], [ %49, %.loopexit.loopexit1338 ], [ %49, %.loopexit.loopexit1339 ], [ %.1272, %.loopexit.loopexit1340 ], [ %.6277, %.loopexit.loopexit1341 ], [ %.4275, %.loopexit.loopexit1342 ], [ %.9280, %.loopexit.loopexit1343 ], [ %.7278, %.loopexit.loopexit1344 ], [ %49, %.loopexit.loopexit1346 ], [ %49, %.loopexit.loopexit1350 ], [ %49, %.loopexit.loopexit1351 ], [ %49, %.loopexit.loopexit1352 ], [ %49, %.loopexit.loopexit1353 ], [ %49, %.loopexit.loopexit1354 ], [ %49, %.loopexit.loopexit1355 ], [ %49, %.loopexit.loopexit1356 ], [ %49, %.loopexit.loopexit1357 ], [ %49, %.loopexit.loopexit1358 ], [ %49, %.loopexit.loopexit1359 ], [ %49, %.loopexit.loopexit1360 ], [ %49, %.loopexit.loopexit1361 ], [ %49, %.loopexit.loopexit1362 ], [ %49, %.loopexit.loopexit1363 ], [ %49, %.loopexit.loopexit1364 ], [ %49, %.loopexit.loopexit1365 ], [ %49, %.loopexit.loopexit1366 ], [ %49, %.loopexit.loopexit1367 ], [ %49, %.loopexit.loopexit1368 ], [ %49, %.loopexit.loopexit1369 ]
  %.10270 = phi i32 [ %47, %3067 ], [ %47, %._crit_edge ], [ %47, %._crit_edge938 ], [ %47, %._crit_edge933 ], [ %47, %._crit_edge928 ], [ %47, %._crit_edge923 ], [ %47, %263 ], [ %47, %278 ], [ %47, %._crit_edge913 ], [ %47, %._crit_edge908 ], [ %47, %._crit_edge903 ], [ %47, %._crit_edge898 ], [ %47, %._crit_edge893 ], [ %47, %._crit_edge853 ], [ %47, %990 ], [ %47, %1113 ], [ %47, %._crit_edge847 ], [ %47, %._crit_edge842 ], [ %47, %1291 ], [ %47, %1414 ], [ %47, %1586 ], [ %.0260, %1647 ], [ %.0260, %1709 ], [ %.0260, %1705 ], [ %.3263, %1729 ], [ %.5265, %1794 ], [ %.5265, %1856 ], [ %.5265, %1852 ], [ %.2262, %1905 ], [ %.2262, %2156 ], [ %.8268, %2221 ], [ %.8268, %2283 ], [ %.8268, %2279 ], [ %.2262, %2290 ], [ %.2262, %2603 ], [ %.2262, %2610 ], [ %.2262, %2511 ], [ %.2262, %2518 ], [ %47, %._crit_edge709 ], [ %47, %._crit_edge704 ], [ %47, %._crit_edge699 ], [ %47, %._crit_edge694 ], [ %47, %._crit_edge689 ], [ %47, %._crit_edge847 ], [ %47, %._crit_edge847 ], [ %47, %._crit_edge918 ], [ %.2262, %.loopexit.loopexit956 ], [ %.5265, %.loopexit.loopexit958 ], [ %.5265, %.loopexit.loopexit959 ], [ %47, %.loopexit.loopexit ], [ %47, %.loopexit.loopexit1326 ], [ %47, %.loopexit.loopexit1327 ], [ %47, %.loopexit.loopexit1328 ], [ %47, %.loopexit.loopexit1329 ], [ %47, %.loopexit.loopexit1330 ], [ %47, %.loopexit.loopexit1331 ], [ %47, %.loopexit.loopexit1332 ], [ %47, %.loopexit.loopexit1333 ], [ %47, %.loopexit.loopexit1334 ], [ %47, %.loopexit.loopexit1335 ], [ %47, %.loopexit.loopexit1336 ], [ %47, %.loopexit.loopexit1337 ], [ %47, %.loopexit.loopexit1338 ], [ %47, %.loopexit.loopexit1339 ], [ %.1261, %.loopexit.loopexit1340 ], [ %.6266, %.loopexit.loopexit1341 ], [ %.4264, %.loopexit.loopexit1342 ], [ %.9269, %.loopexit.loopexit1343 ], [ %.7267, %.loopexit.loopexit1344 ], [ %47, %.loopexit.loopexit1346 ], [ %47, %.loopexit.loopexit1350 ], [ %47, %.loopexit.loopexit1351 ], [ %47, %.loopexit.loopexit1352 ], [ %47, %.loopexit.loopexit1353 ], [ %47, %.loopexit.loopexit1354 ], [ %47, %.loopexit.loopexit1355 ], [ %47, %.loopexit.loopexit1356 ], [ %47, %.loopexit.loopexit1357 ], [ %47, %.loopexit.loopexit1358 ], [ %47, %.loopexit.loopexit1359 ], [ %47, %.loopexit.loopexit1360 ], [ %47, %.loopexit.loopexit1361 ], [ %47, %.loopexit.loopexit1362 ], [ %47, %.loopexit.loopexit1363 ], [ %47, %.loopexit.loopexit1364 ], [ %47, %.loopexit.loopexit1365 ], [ %47, %.loopexit.loopexit1366 ], [ %47, %.loopexit.loopexit1367 ], [ %47, %.loopexit.loopexit1368 ], [ %47, %.loopexit.loopexit1369 ]
  %.11259 = phi i32 [ %45, %3067 ], [ %45, %._crit_edge ], [ %45, %._crit_edge938 ], [ %45, %._crit_edge933 ], [ %45, %._crit_edge928 ], [ %45, %._crit_edge923 ], [ %45, %263 ], [ %45, %278 ], [ %45, %._crit_edge913 ], [ %45, %._crit_edge908 ], [ %45, %._crit_edge903 ], [ %45, %._crit_edge898 ], [ %45, %._crit_edge893 ], [ %45, %._crit_edge853 ], [ %45, %990 ], [ %45, %1113 ], [ %45, %._crit_edge847 ], [ %45, %._crit_edge842 ], [ %45, %1291 ], [ %45, %1414 ], [ %45, %1586 ], [ %.1249, %1647 ], [ %.1249, %1709 ], [ %.1249, %1705 ], [ %.4252, %1729 ], [ %.6254, %1794 ], [ %.6254, %1856 ], [ %.6254, %1852 ], [ %.3251, %1905 ], [ %.3251, %2156 ], [ %.9257, %2221 ], [ %.9257, %2283 ], [ %.9257, %2279 ], [ %.3251, %2290 ], [ %.3251, %2603 ], [ %.3251, %2610 ], [ %.3251, %2511 ], [ %.3251, %2518 ], [ %45, %._crit_edge709 ], [ %45, %._crit_edge704 ], [ %45, %._crit_edge699 ], [ %45, %._crit_edge694 ], [ %45, %._crit_edge689 ], [ %45, %._crit_edge847 ], [ %45, %._crit_edge847 ], [ %45, %._crit_edge918 ], [ %.3251, %.loopexit.loopexit956 ], [ %.6254, %.loopexit.loopexit958 ], [ %.6254, %.loopexit.loopexit959 ], [ %45, %.loopexit.loopexit ], [ %45, %.loopexit.loopexit1326 ], [ %45, %.loopexit.loopexit1327 ], [ %45, %.loopexit.loopexit1328 ], [ %45, %.loopexit.loopexit1329 ], [ %45, %.loopexit.loopexit1330 ], [ %45, %.loopexit.loopexit1331 ], [ %45, %.loopexit.loopexit1332 ], [ %45, %.loopexit.loopexit1333 ], [ %45, %.loopexit.loopexit1334 ], [ %45, %.loopexit.loopexit1335 ], [ %45, %.loopexit.loopexit1336 ], [ %45, %.loopexit.loopexit1337 ], [ %45, %.loopexit.loopexit1338 ], [ %45, %.loopexit.loopexit1339 ], [ %.2250, %.loopexit.loopexit1340 ], [ %.7255, %.loopexit.loopexit1341 ], [ %.5253, %.loopexit.loopexit1342 ], [ %.10258, %.loopexit.loopexit1343 ], [ %.8256, %.loopexit.loopexit1344 ], [ %.0248, %.loopexit.loopexit1346 ], [ %45, %.loopexit.loopexit1350 ], [ %45, %.loopexit.loopexit1351 ], [ %45, %.loopexit.loopexit1352 ], [ %45, %.loopexit.loopexit1353 ], [ %45, %.loopexit.loopexit1354 ], [ %45, %.loopexit.loopexit1355 ], [ %45, %.loopexit.loopexit1356 ], [ %45, %.loopexit.loopexit1357 ], [ %45, %.loopexit.loopexit1358 ], [ %45, %.loopexit.loopexit1359 ], [ %45, %.loopexit.loopexit1360 ], [ %45, %.loopexit.loopexit1361 ], [ %45, %.loopexit.loopexit1362 ], [ %45, %.loopexit.loopexit1363 ], [ %45, %.loopexit.loopexit1364 ], [ %45, %.loopexit.loopexit1365 ], [ %45, %.loopexit.loopexit1366 ], [ %45, %.loopexit.loopexit1367 ], [ %45, %.loopexit.loopexit1368 ], [ %45, %.loopexit.loopexit1369 ]
  %.18246 = phi i32 [ %41, %3067 ], [ %41, %._crit_edge ], [ %41, %._crit_edge938 ], [ %41, %._crit_edge933 ], [ %41, %._crit_edge928 ], [ %41, %._crit_edge923 ], [ %41, %263 ], [ %41, %278 ], [ %41, %._crit_edge913 ], [ %41, %._crit_edge908 ], [ %41, %._crit_edge903 ], [ %41, %._crit_edge898 ], [ %41, %._crit_edge893 ], [ %41, %._crit_edge853 ], [ %41, %990 ], [ %41, %1113 ], [ %41, %._crit_edge847 ], [ %41, %._crit_edge842 ], [ %41, %1291 ], [ %.3231, %1414 ], [ %.0228, %1586 ], [ %.8236, %1647 ], [ %.8236, %1709 ], [ %.8236, %1705 ], [ %.11239, %1729 ], [ %.13241, %1794 ], [ %.13241, %1856 ], [ %.13241, %1852 ], [ %.10238, %1905 ], [ %.10238, %2156 ], [ %.16244, %2221 ], [ %.16244, %2283 ], [ %.16244, %2279 ], [ %.10238, %2290 ], [ %.10238, %2603 ], [ %.10238, %2610 ], [ %.10238, %2511 ], [ %.10238, %2518 ], [ %41, %._crit_edge709 ], [ %41, %._crit_edge704 ], [ %41, %._crit_edge699 ], [ %41, %._crit_edge694 ], [ %41, %._crit_edge689 ], [ %41, %._crit_edge847 ], [ %41, %._crit_edge847 ], [ %41, %._crit_edge918 ], [ %.10238, %.loopexit.loopexit956 ], [ %.13241, %.loopexit.loopexit958 ], [ %.13241, %.loopexit.loopexit959 ], [ %41, %.loopexit.loopexit ], [ %41, %.loopexit.loopexit1326 ], [ %41, %.loopexit.loopexit1327 ], [ %41, %.loopexit.loopexit1328 ], [ %41, %.loopexit.loopexit1329 ], [ %41, %.loopexit.loopexit1330 ], [ %41, %.loopexit.loopexit1331 ], [ %41, %.loopexit.loopexit1332 ], [ %41, %.loopexit.loopexit1333 ], [ %41, %.loopexit.loopexit1334 ], [ %41, %.loopexit.loopexit1335 ], [ %41, %.loopexit.loopexit1336 ], [ %.5233, %.loopexit.loopexit1337 ], [ %.4232, %.loopexit.loopexit1338 ], [ %.1229, %.loopexit.loopexit1339 ], [ %.9237, %.loopexit.loopexit1340 ], [ %.14242, %.loopexit.loopexit1341 ], [ %.12240, %.loopexit.loopexit1342 ], [ %.17245, %.loopexit.loopexit1343 ], [ %.15243, %.loopexit.loopexit1344 ], [ %.7235, %.loopexit.loopexit1346 ], [ %41, %.loopexit.loopexit1350 ], [ %41, %.loopexit.loopexit1351 ], [ %41, %.loopexit.loopexit1352 ], [ %41, %.loopexit.loopexit1353 ], [ %41, %.loopexit.loopexit1354 ], [ %41, %.loopexit.loopexit1355 ], [ %41, %.loopexit.loopexit1356 ], [ %41, %.loopexit.loopexit1357 ], [ %41, %.loopexit.loopexit1358 ], [ %41, %.loopexit.loopexit1359 ], [ %41, %.loopexit.loopexit1360 ], [ %41, %.loopexit.loopexit1361 ], [ %41, %.loopexit.loopexit1362 ], [ %41, %.loopexit.loopexit1363 ], [ %41, %.loopexit.loopexit1364 ], [ %41, %.loopexit.loopexit1365 ], [ %41, %.loopexit.loopexit1366 ], [ %41, %.loopexit.loopexit1367 ], [ %41, %.loopexit.loopexit1368 ], [ %41, %.loopexit.loopexit1369 ]
  %.8227 = phi i32 [ %39, %3067 ], [ %39, %._crit_edge ], [ %39, %._crit_edge938 ], [ %39, %._crit_edge933 ], [ %39, %._crit_edge928 ], [ %39, %._crit_edge923 ], [ %39, %263 ], [ %39, %278 ], [ %39, %._crit_edge913 ], [ %39, %._crit_edge908 ], [ %39, %._crit_edge903 ], [ %39, %._crit_edge898 ], [ %39, %._crit_edge893 ], [ %39, %._crit_edge853 ], [ %39, %990 ], [ %39, %1113 ], [ %39, %._crit_edge847 ], [ %39, %._crit_edge842 ], [ %39, %1291 ], [ %39, %1414 ], [ %39, %1586 ], [ %39, %1647 ], [ %39, %1709 ], [ %39, %1705 ], [ %1727, %1729 ], [ %.3222, %1794 ], [ %.3222, %1856 ], [ %.3222, %1852 ], [ %.0219, %1905 ], [ %.0219, %2156 ], [ %.6225, %2221 ], [ %.6225, %2283 ], [ %.6225, %2279 ], [ %.0219, %2290 ], [ %.0219, %2603 ], [ %.0219, %2610 ], [ %.0219, %2511 ], [ %.0219, %2518 ], [ %39, %._crit_edge709 ], [ %39, %._crit_edge704 ], [ %39, %._crit_edge699 ], [ %39, %._crit_edge694 ], [ %39, %._crit_edge689 ], [ %39, %._crit_edge847 ], [ %39, %._crit_edge847 ], [ %39, %._crit_edge918 ], [ %.0219, %.loopexit.loopexit956 ], [ %.3222, %.loopexit.loopexit958 ], [ %.3222, %.loopexit.loopexit959 ], [ %39, %.loopexit.loopexit ], [ %39, %.loopexit.loopexit1326 ], [ %39, %.loopexit.loopexit1327 ], [ %39, %.loopexit.loopexit1328 ], [ %39, %.loopexit.loopexit1329 ], [ %39, %.loopexit.loopexit1330 ], [ %39, %.loopexit.loopexit1331 ], [ %39, %.loopexit.loopexit1332 ], [ %39, %.loopexit.loopexit1333 ], [ %39, %.loopexit.loopexit1334 ], [ %39, %.loopexit.loopexit1335 ], [ %39, %.loopexit.loopexit1336 ], [ %39, %.loopexit.loopexit1337 ], [ %39, %.loopexit.loopexit1338 ], [ %39, %.loopexit.loopexit1339 ], [ %39, %.loopexit.loopexit1340 ], [ %.4223, %.loopexit.loopexit1341 ], [ %.2221, %.loopexit.loopexit1342 ], [ %.7226, %.loopexit.loopexit1343 ], [ %.5224, %.loopexit.loopexit1344 ], [ %39, %.loopexit.loopexit1346 ], [ %39, %.loopexit.loopexit1350 ], [ %39, %.loopexit.loopexit1351 ], [ %39, %.loopexit.loopexit1352 ], [ %39, %.loopexit.loopexit1353 ], [ %39, %.loopexit.loopexit1354 ], [ %39, %.loopexit.loopexit1355 ], [ %39, %.loopexit.loopexit1356 ], [ %39, %.loopexit.loopexit1357 ], [ %39, %.loopexit.loopexit1358 ], [ %39, %.loopexit.loopexit1359 ], [ %39, %.loopexit.loopexit1360 ], [ %39, %.loopexit.loopexit1361 ], [ %39, %.loopexit.loopexit1362 ], [ %39, %.loopexit.loopexit1363 ], [ %39, %.loopexit.loopexit1364 ], [ %39, %.loopexit.loopexit1365 ], [ %39, %.loopexit.loopexit1366 ], [ %39, %.loopexit.loopexit1367 ], [ %39, %.loopexit.loopexit1368 ], [ %39, %.loopexit.loopexit1369 ]
  %.13218 = phi i32 [ %37, %3067 ], [ %37, %._crit_edge ], [ %37, %._crit_edge938 ], [ %37, %._crit_edge933 ], [ %37, %._crit_edge928 ], [ %37, %._crit_edge923 ], [ %37, %263 ], [ %37, %278 ], [ %37, %._crit_edge913 ], [ %37, %._crit_edge908 ], [ %37, %._crit_edge903 ], [ %37, %._crit_edge898 ], [ %37, %._crit_edge893 ], [ %37, %._crit_edge853 ], [ %37, %990 ], [ %37, %1113 ], [ %37, %._crit_edge847 ], [ %37, %._crit_edge842 ], [ %37, %1291 ], [ %37, %1414 ], [ %37, %1586 ], [ %37, %1647 ], [ %37, %1709 ], [ %37, %1705 ], [ %.3208, %1729 ], [ %.5210, %1794 ], [ %.5210, %1856 ], [ %.5210, %1852 ], [ %.0205, %1905 ], [ %.0205, %2156 ], [ %.11216, %2221 ], [ %.11216, %2283 ], [ %.11216, %2279 ], [ %.0205, %2290 ], [ %.0205, %2603 ], [ %.0205, %2610 ], [ %.0205, %2511 ], [ %.0205, %2518 ], [ %37, %._crit_edge709 ], [ %37, %._crit_edge704 ], [ %37, %._crit_edge699 ], [ %37, %._crit_edge694 ], [ %37, %._crit_edge689 ], [ %37, %._crit_edge847 ], [ %37, %._crit_edge847 ], [ %37, %._crit_edge918 ], [ %.0205, %.loopexit.loopexit956 ], [ %.8213765, %.loopexit.loopexit958 ], [ %.7212770, %.loopexit.loopexit959 ], [ %37, %.loopexit.loopexit ], [ %37, %.loopexit.loopexit1326 ], [ %37, %.loopexit.loopexit1327 ], [ %37, %.loopexit.loopexit1328 ], [ %37, %.loopexit.loopexit1329 ], [ %37, %.loopexit.loopexit1330 ], [ %37, %.loopexit.loopexit1331 ], [ %37, %.loopexit.loopexit1332 ], [ %37, %.loopexit.loopexit1333 ], [ %37, %.loopexit.loopexit1334 ], [ %37, %.loopexit.loopexit1335 ], [ %37, %.loopexit.loopexit1336 ], [ %37, %.loopexit.loopexit1337 ], [ %37, %.loopexit.loopexit1338 ], [ %37, %.loopexit.loopexit1339 ], [ %37, %.loopexit.loopexit1340 ], [ %.6211, %.loopexit.loopexit1341 ], [ %.4209, %.loopexit.loopexit1342 ], [ %.12217, %.loopexit.loopexit1343 ], [ %.10215, %.loopexit.loopexit1344 ], [ %37, %.loopexit.loopexit1346 ], [ %37, %.loopexit.loopexit1350 ], [ %37, %.loopexit.loopexit1351 ], [ %37, %.loopexit.loopexit1352 ], [ %37, %.loopexit.loopexit1353 ], [ %37, %.loopexit.loopexit1354 ], [ %37, %.loopexit.loopexit1355 ], [ %37, %.loopexit.loopexit1356 ], [ %37, %.loopexit.loopexit1357 ], [ %37, %.loopexit.loopexit1358 ], [ %37, %.loopexit.loopexit1359 ], [ %37, %.loopexit.loopexit1360 ], [ %37, %.loopexit.loopexit1361 ], [ %37, %.loopexit.loopexit1362 ], [ %37, %.loopexit.loopexit1363 ], [ %37, %.loopexit.loopexit1364 ], [ %37, %.loopexit.loopexit1365 ], [ %37, %.loopexit.loopexit1366 ], [ %37, %.loopexit.loopexit1367 ], [ %37, %.loopexit.loopexit1368 ], [ %37, %.loopexit.loopexit1369 ]
  %.14204 = phi i32 [ %35, %3067 ], [ %35, %._crit_edge ], [ %35, %._crit_edge938 ], [ %35, %._crit_edge933 ], [ %35, %._crit_edge928 ], [ %35, %._crit_edge923 ], [ %35, %263 ], [ %35, %278 ], [ %35, %._crit_edge913 ], [ %35, %._crit_edge908 ], [ %35, %._crit_edge903 ], [ %35, %._crit_edge898 ], [ %35, %._crit_edge893 ], [ %35, %._crit_edge853 ], [ %35, %990 ], [ %35, %1113 ], [ %35, %._crit_edge847 ], [ %35, %._crit_edge842 ], [ %35, %1291 ], [ %35, %1414 ], [ 0, %1586 ], [ %.1191, %1647 ], [ %.1191, %1709 ], [ %.1191, %1705 ], [ %.4194, %1729 ], [ %.6196, %1794 ], [ %.6196, %1856 ], [ %.6196, %1852 ], [ %.3193, %1905 ], [ %2154, %2156 ], [ %.12202, %2221 ], [ %.12202, %2283 ], [ %.12202, %2279 ], [ %.3193, %2290 ], [ %.3193, %2603 ], [ %.3193, %2610 ], [ %.3193, %2511 ], [ %.3193, %2518 ], [ %35, %._crit_edge709 ], [ %35, %._crit_edge704 ], [ %35, %._crit_edge699 ], [ %35, %._crit_edge694 ], [ %35, %._crit_edge689 ], [ %35, %._crit_edge847 ], [ %35, %._crit_edge847 ], [ %35, %._crit_edge918 ], [ %.3193, %.loopexit.loopexit956 ], [ %3069, %.loopexit.loopexit958 ], [ %3070, %.loopexit.loopexit959 ], [ %35, %.loopexit.loopexit ], [ %35, %.loopexit.loopexit1326 ], [ %35, %.loopexit.loopexit1327 ], [ %35, %.loopexit.loopexit1328 ], [ %35, %.loopexit.loopexit1329 ], [ %35, %.loopexit.loopexit1330 ], [ %35, %.loopexit.loopexit1331 ], [ %35, %.loopexit.loopexit1332 ], [ %35, %.loopexit.loopexit1333 ], [ %35, %.loopexit.loopexit1334 ], [ %35, %.loopexit.loopexit1335 ], [ %35, %.loopexit.loopexit1336 ], [ %35, %.loopexit.loopexit1337 ], [ %35, %.loopexit.loopexit1338 ], [ %35, %.loopexit.loopexit1339 ], [ %.2192, %.loopexit.loopexit1340 ], [ %.7197, %.loopexit.loopexit1341 ], [ %.5195, %.loopexit.loopexit1342 ], [ %.13203, %.loopexit.loopexit1343 ], [ %.11201, %.loopexit.loopexit1344 ], [ %.0190, %.loopexit.loopexit1346 ], [ %35, %.loopexit.loopexit1350 ], [ %35, %.loopexit.loopexit1351 ], [ %35, %.loopexit.loopexit1352 ], [ %35, %.loopexit.loopexit1353 ], [ %35, %.loopexit.loopexit1354 ], [ %35, %.loopexit.loopexit1355 ], [ %35, %.loopexit.loopexit1356 ], [ %35, %.loopexit.loopexit1357 ], [ %35, %.loopexit.loopexit1358 ], [ %35, %.loopexit.loopexit1359 ], [ %35, %.loopexit.loopexit1360 ], [ %35, %.loopexit.loopexit1361 ], [ %35, %.loopexit.loopexit1362 ], [ %35, %.loopexit.loopexit1363 ], [ %35, %.loopexit.loopexit1364 ], [ %35, %.loopexit.loopexit1365 ], [ %35, %.loopexit.loopexit1366 ], [ %35, %.loopexit.loopexit1367 ], [ %35, %.loopexit.loopexit1368 ], [ %35, %.loopexit.loopexit1369 ]
  %.11189 = phi i32 [ %33, %3067 ], [ %33, %._crit_edge ], [ %33, %._crit_edge938 ], [ %33, %._crit_edge933 ], [ %33, %._crit_edge928 ], [ %33, %._crit_edge923 ], [ %33, %263 ], [ %33, %278 ], [ %33, %._crit_edge913 ], [ %33, %._crit_edge908 ], [ %33, %._crit_edge903 ], [ %33, %._crit_edge898 ], [ %33, %._crit_edge893 ], [ %33, %._crit_edge853 ], [ %33, %990 ], [ %33, %1113 ], [ %33, %._crit_edge847 ], [ %33, %._crit_edge842 ], [ %33, %1291 ], [ %33, %1414 ], [ %1531, %1586 ], [ %.1179, %1647 ], [ %.1179, %1709 ], [ %.1179, %1705 ], [ %.4182, %1729 ], [ %.6184, %1794 ], [ %.6184, %1856 ], [ %.6184, %1852 ], [ %.3181, %1905 ], [ %.3181, %2156 ], [ %.9187, %2221 ], [ %.9187, %2283 ], [ %.9187, %2279 ], [ %.3181, %2290 ], [ %.3181, %2603 ], [ %.3181, %2610 ], [ %.3181, %2511 ], [ %.3181, %2518 ], [ %33, %._crit_edge709 ], [ %33, %._crit_edge704 ], [ %33, %._crit_edge699 ], [ %33, %._crit_edge694 ], [ %33, %._crit_edge689 ], [ %33, %._crit_edge847 ], [ %33, %._crit_edge847 ], [ %33, %._crit_edge918 ], [ %.3181, %.loopexit.loopexit956 ], [ %.6184, %.loopexit.loopexit958 ], [ %.6184, %.loopexit.loopexit959 ], [ %33, %.loopexit.loopexit ], [ %33, %.loopexit.loopexit1326 ], [ %33, %.loopexit.loopexit1327 ], [ %33, %.loopexit.loopexit1328 ], [ %33, %.loopexit.loopexit1329 ], [ %33, %.loopexit.loopexit1330 ], [ %33, %.loopexit.loopexit1331 ], [ %33, %.loopexit.loopexit1332 ], [ %33, %.loopexit.loopexit1333 ], [ %33, %.loopexit.loopexit1334 ], [ %33, %.loopexit.loopexit1335 ], [ %33, %.loopexit.loopexit1336 ], [ %33, %.loopexit.loopexit1337 ], [ %33, %.loopexit.loopexit1338 ], [ %33, %.loopexit.loopexit1339 ], [ %.2180, %.loopexit.loopexit1340 ], [ %.7185, %.loopexit.loopexit1341 ], [ %.5183, %.loopexit.loopexit1342 ], [ %.10188, %.loopexit.loopexit1343 ], [ %.8186, %.loopexit.loopexit1344 ], [ %.0178, %.loopexit.loopexit1346 ], [ %33, %.loopexit.loopexit1350 ], [ %33, %.loopexit.loopexit1351 ], [ %33, %.loopexit.loopexit1352 ], [ %33, %.loopexit.loopexit1353 ], [ %33, %.loopexit.loopexit1354 ], [ %33, %.loopexit.loopexit1355 ], [ %33, %.loopexit.loopexit1356 ], [ %33, %.loopexit.loopexit1357 ], [ %33, %.loopexit.loopexit1358 ], [ %33, %.loopexit.loopexit1359 ], [ %33, %.loopexit.loopexit1360 ], [ %33, %.loopexit.loopexit1361 ], [ %33, %.loopexit.loopexit1362 ], [ %33, %.loopexit.loopexit1363 ], [ %33, %.loopexit.loopexit1364 ], [ %33, %.loopexit.loopexit1365 ], [ %33, %.loopexit.loopexit1366 ], [ %33, %.loopexit.loopexit1367 ], [ %33, %.loopexit.loopexit1368 ], [ %33, %.loopexit.loopexit1369 ]
  %.8177 = phi i32 [ %31, %3067 ], [ %31, %._crit_edge ], [ %31, %._crit_edge938 ], [ %31, %._crit_edge933 ], [ %31, %._crit_edge928 ], [ %31, %._crit_edge923 ], [ %31, %263 ], [ %31, %278 ], [ %31, %._crit_edge913 ], [ %31, %._crit_edge908 ], [ %31, %._crit_edge903 ], [ %31, %._crit_edge898 ], [ %31, %._crit_edge893 ], [ %31, %._crit_edge853 ], [ %31, %990 ], [ %31, %1113 ], [ %31, %._crit_edge847 ], [ %31, %._crit_edge842 ], [ %31, %1291 ], [ %31, %1414 ], [ %31, %1586 ], [ %31, %1647 ], [ %31, %1709 ], [ %31, %1705 ], [ %.1170, %1729 ], [ %.3172, %1794 ], [ %.3172, %1856 ], [ %.3172, %1852 ], [ %.0169, %1905 ], [ %.0169, %2156 ], [ %.6175, %2221 ], [ %.6175, %2283 ], [ %.6175, %2279 ], [ %.0169, %2290 ], [ %.0169, %2603 ], [ %.0169, %2610 ], [ %.0169, %2511 ], [ %.0169, %2518 ], [ %31, %._crit_edge709 ], [ %31, %._crit_edge704 ], [ %31, %._crit_edge699 ], [ %31, %._crit_edge694 ], [ %31, %._crit_edge689 ], [ %31, %._crit_edge847 ], [ %31, %._crit_edge847 ], [ %31, %._crit_edge918 ], [ %.0169, %.loopexit.loopexit956 ], [ %1862, %.loopexit.loopexit958 ], [ %1862, %.loopexit.loopexit959 ], [ %31, %.loopexit.loopexit ], [ %31, %.loopexit.loopexit1326 ], [ %31, %.loopexit.loopexit1327 ], [ %31, %.loopexit.loopexit1328 ], [ %31, %.loopexit.loopexit1329 ], [ %31, %.loopexit.loopexit1330 ], [ %31, %.loopexit.loopexit1331 ], [ %31, %.loopexit.loopexit1332 ], [ %31, %.loopexit.loopexit1333 ], [ %31, %.loopexit.loopexit1334 ], [ %31, %.loopexit.loopexit1335 ], [ %31, %.loopexit.loopexit1336 ], [ %31, %.loopexit.loopexit1337 ], [ %31, %.loopexit.loopexit1338 ], [ %31, %.loopexit.loopexit1339 ], [ %31, %.loopexit.loopexit1340 ], [ %.4173, %.loopexit.loopexit1341 ], [ %.2171, %.loopexit.loopexit1342 ], [ %.7176, %.loopexit.loopexit1343 ], [ %.5174, %.loopexit.loopexit1344 ], [ %31, %.loopexit.loopexit1346 ], [ %31, %.loopexit.loopexit1350 ], [ %31, %.loopexit.loopexit1351 ], [ %31, %.loopexit.loopexit1352 ], [ %31, %.loopexit.loopexit1353 ], [ %31, %.loopexit.loopexit1354 ], [ %31, %.loopexit.loopexit1355 ], [ %31, %.loopexit.loopexit1356 ], [ %31, %.loopexit.loopexit1357 ], [ %31, %.loopexit.loopexit1358 ], [ %31, %.loopexit.loopexit1359 ], [ %31, %.loopexit.loopexit1360 ], [ %31, %.loopexit.loopexit1361 ], [ %31, %.loopexit.loopexit1362 ], [ %31, %.loopexit.loopexit1363 ], [ %31, %.loopexit.loopexit1364 ], [ %31, %.loopexit.loopexit1365 ], [ %31, %.loopexit.loopexit1366 ], [ %31, %.loopexit.loopexit1367 ], [ %31, %.loopexit.loopexit1368 ], [ %31, %.loopexit.loopexit1369 ]
  %.14168 = phi i32 [ %29, %3067 ], [ %29, %._crit_edge ], [ %29, %._crit_edge938 ], [ %29, %._crit_edge933 ], [ %29, %._crit_edge928 ], [ %29, %._crit_edge923 ], [ %29, %263 ], [ %29, %278 ], [ %29, %._crit_edge913 ], [ %29, %._crit_edge908 ], [ %29, %._crit_edge903 ], [ %29, %._crit_edge898 ], [ %29, %._crit_edge893 ], [ %29, %._crit_edge853 ], [ %29, %990 ], [ %29, %1113 ], [ %29, %._crit_edge847 ], [ %29, %._crit_edge842 ], [ %29, %1291 ], [ %29, %1414 ], [ 0, %1586 ], [ %.2156, %1647 ], [ %.2156, %1709 ], [ %.2156, %1705 ], [ 0, %1729 ], [ %.8162, %1794 ], [ %.8162, %1856 ], [ %.8162, %1852 ], [ %.4158, %1905 ], [ 0, %2156 ], [ %.12166, %2221 ], [ %.12166, %2283 ], [ %.12166, %2279 ], [ %.4158, %2290 ], [ %.4158, %2603 ], [ %.4158, %2610 ], [ %.4158, %2511 ], [ %.4158, %2518 ], [ %29, %._crit_edge709 ], [ %29, %._crit_edge704 ], [ %29, %._crit_edge699 ], [ %29, %._crit_edge694 ], [ %29, %._crit_edge689 ], [ %29, %._crit_edge847 ], [ %29, %._crit_edge847 ], [ %29, %._crit_edge918 ], [ %.4158, %.loopexit.loopexit956 ], [ %.8162, %.loopexit.loopexit958 ], [ %.8162, %.loopexit.loopexit959 ], [ %29, %.loopexit.loopexit ], [ %29, %.loopexit.loopexit1326 ], [ %29, %.loopexit.loopexit1327 ], [ %29, %.loopexit.loopexit1328 ], [ %29, %.loopexit.loopexit1329 ], [ %29, %.loopexit.loopexit1330 ], [ %29, %.loopexit.loopexit1331 ], [ %29, %.loopexit.loopexit1332 ], [ %29, %.loopexit.loopexit1333 ], [ %29, %.loopexit.loopexit1334 ], [ %29, %.loopexit.loopexit1335 ], [ %29, %.loopexit.loopexit1336 ], [ %29, %.loopexit.loopexit1337 ], [ %29, %.loopexit.loopexit1338 ], [ %29, %.loopexit.loopexit1339 ], [ %.3157, %.loopexit.loopexit1340 ], [ %.9163, %.loopexit.loopexit1341 ], [ %.7161, %.loopexit.loopexit1342 ], [ %.13167, %.loopexit.loopexit1343 ], [ %.11165, %.loopexit.loopexit1344 ], [ %.1155, %.loopexit.loopexit1346 ], [ %29, %.loopexit.loopexit1350 ], [ %29, %.loopexit.loopexit1351 ], [ %29, %.loopexit.loopexit1352 ], [ %29, %.loopexit.loopexit1353 ], [ %29, %.loopexit.loopexit1354 ], [ %29, %.loopexit.loopexit1355 ], [ %29, %.loopexit.loopexit1356 ], [ %29, %.loopexit.loopexit1357 ], [ %29, %.loopexit.loopexit1358 ], [ %29, %.loopexit.loopexit1359 ], [ %29, %.loopexit.loopexit1360 ], [ %29, %.loopexit.loopexit1361 ], [ %29, %.loopexit.loopexit1362 ], [ %29, %.loopexit.loopexit1363 ], [ %29, %.loopexit.loopexit1364 ], [ %29, %.loopexit.loopexit1365 ], [ %29, %.loopexit.loopexit1366 ], [ %29, %.loopexit.loopexit1367 ], [ %29, %.loopexit.loopexit1368 ], [ %29, %.loopexit.loopexit1369 ]
  %.14153 = phi i32 [ %27, %3067 ], [ %27, %._crit_edge ], [ %27, %._crit_edge938 ], [ %27, %._crit_edge933 ], [ %27, %._crit_edge928 ], [ %27, %._crit_edge923 ], [ %27, %263 ], [ %27, %278 ], [ %27, %._crit_edge913 ], [ %27, %._crit_edge908 ], [ %27, %._crit_edge903 ], [ %27, %._crit_edge898 ], [ %27, %._crit_edge893 ], [ %27, %._crit_edge853 ], [ %27, %990 ], [ %27, %1113 ], [ %27, %._crit_edge847 ], [ %27, %._crit_edge842 ], [ %27, %1291 ], [ %27, %1414 ], [ 0, %1586 ], [ %.2141, %1647 ], [ %.2141, %1709 ], [ %.2141, %1705 ], [ %1730, %1729 ], [ %.8147, %1794 ], [ %.8147, %1856 ], [ %.8147, %1852 ], [ %.4143, %1905 ], [ %2157, %2156 ], [ %.12151, %2221 ], [ %.12151, %2283 ], [ %.12151, %2279 ], [ %.4143, %2290 ], [ %.4143, %2603 ], [ %.4143, %2610 ], [ %.4143, %2511 ], [ %.4143, %2518 ], [ %27, %._crit_edge709 ], [ %27, %._crit_edge704 ], [ %27, %._crit_edge699 ], [ %27, %._crit_edge694 ], [ %27, %._crit_edge689 ], [ %27, %._crit_edge847 ], [ %27, %._crit_edge847 ], [ %27, %._crit_edge918 ], [ %.4143, %.loopexit.loopexit956 ], [ %.8147, %.loopexit.loopexit958 ], [ %.8147, %.loopexit.loopexit959 ], [ %27, %.loopexit.loopexit ], [ %27, %.loopexit.loopexit1326 ], [ %27, %.loopexit.loopexit1327 ], [ %27, %.loopexit.loopexit1328 ], [ %27, %.loopexit.loopexit1329 ], [ %27, %.loopexit.loopexit1330 ], [ %27, %.loopexit.loopexit1331 ], [ %27, %.loopexit.loopexit1332 ], [ %27, %.loopexit.loopexit1333 ], [ %27, %.loopexit.loopexit1334 ], [ %27, %.loopexit.loopexit1335 ], [ %27, %.loopexit.loopexit1336 ], [ %27, %.loopexit.loopexit1337 ], [ %27, %.loopexit.loopexit1338 ], [ %27, %.loopexit.loopexit1339 ], [ %.3142, %.loopexit.loopexit1340 ], [ %.9148, %.loopexit.loopexit1341 ], [ %.7146, %.loopexit.loopexit1342 ], [ %.13152, %.loopexit.loopexit1343 ], [ %.11150, %.loopexit.loopexit1344 ], [ %.1140, %.loopexit.loopexit1346 ], [ %27, %.loopexit.loopexit1350 ], [ %27, %.loopexit.loopexit1351 ], [ %27, %.loopexit.loopexit1352 ], [ %27, %.loopexit.loopexit1353 ], [ %27, %.loopexit.loopexit1354 ], [ %27, %.loopexit.loopexit1355 ], [ %27, %.loopexit.loopexit1356 ], [ %27, %.loopexit.loopexit1357 ], [ %27, %.loopexit.loopexit1358 ], [ %27, %.loopexit.loopexit1359 ], [ %27, %.loopexit.loopexit1360 ], [ %27, %.loopexit.loopexit1361 ], [ %27, %.loopexit.loopexit1362 ], [ %27, %.loopexit.loopexit1363 ], [ %27, %.loopexit.loopexit1364 ], [ %27, %.loopexit.loopexit1365 ], [ %27, %.loopexit.loopexit1366 ], [ %27, %.loopexit.loopexit1367 ], [ %27, %.loopexit.loopexit1368 ], [ %27, %.loopexit.loopexit1369 ]
  %.11138 = phi i32 [ %25, %3067 ], [ %25, %._crit_edge ], [ %25, %._crit_edge938 ], [ %25, %._crit_edge933 ], [ %25, %._crit_edge928 ], [ %25, %._crit_edge923 ], [ %25, %263 ], [ %25, %278 ], [ %25, %._crit_edge913 ], [ %25, %._crit_edge908 ], [ %25, %._crit_edge903 ], [ %25, %._crit_edge898 ], [ %25, %._crit_edge893 ], [ %25, %._crit_edge853 ], [ %25, %990 ], [ %25, %1113 ], [ %25, %._crit_edge847 ], [ %25, %._crit_edge842 ], [ %25, %1291 ], [ %25, %1414 ], [ %1530, %1586 ], [ %.1128, %1647 ], [ %.1128, %1709 ], [ %.1128, %1705 ], [ %.4131, %1729 ], [ %.6133, %1794 ], [ %.6133, %1856 ], [ %.6133, %1852 ], [ %.3130, %1905 ], [ %.3130, %2156 ], [ %.9136, %2221 ], [ %.9136, %2283 ], [ %.9136, %2279 ], [ %.3130, %2290 ], [ %.3130, %2603 ], [ %.3130, %2610 ], [ %.3130, %2511 ], [ %.3130, %2518 ], [ %25, %._crit_edge709 ], [ %25, %._crit_edge704 ], [ %25, %._crit_edge699 ], [ %25, %._crit_edge694 ], [ %25, %._crit_edge689 ], [ %25, %._crit_edge847 ], [ %25, %._crit_edge847 ], [ %25, %._crit_edge918 ], [ %.3130, %.loopexit.loopexit956 ], [ %.6133, %.loopexit.loopexit958 ], [ %.6133, %.loopexit.loopexit959 ], [ %25, %.loopexit.loopexit ], [ %25, %.loopexit.loopexit1326 ], [ %25, %.loopexit.loopexit1327 ], [ %25, %.loopexit.loopexit1328 ], [ %25, %.loopexit.loopexit1329 ], [ %25, %.loopexit.loopexit1330 ], [ %25, %.loopexit.loopexit1331 ], [ %25, %.loopexit.loopexit1332 ], [ %25, %.loopexit.loopexit1333 ], [ %25, %.loopexit.loopexit1334 ], [ %25, %.loopexit.loopexit1335 ], [ %25, %.loopexit.loopexit1336 ], [ %25, %.loopexit.loopexit1337 ], [ %25, %.loopexit.loopexit1338 ], [ %25, %.loopexit.loopexit1339 ], [ %.2129, %.loopexit.loopexit1340 ], [ %.7134, %.loopexit.loopexit1341 ], [ %.5132, %.loopexit.loopexit1342 ], [ %.10137, %.loopexit.loopexit1343 ], [ %.8135, %.loopexit.loopexit1344 ], [ %.0127, %.loopexit.loopexit1346 ], [ %25, %.loopexit.loopexit1350 ], [ %25, %.loopexit.loopexit1351 ], [ %25, %.loopexit.loopexit1352 ], [ %25, %.loopexit.loopexit1353 ], [ %25, %.loopexit.loopexit1354 ], [ %25, %.loopexit.loopexit1355 ], [ %25, %.loopexit.loopexit1356 ], [ %25, %.loopexit.loopexit1357 ], [ %25, %.loopexit.loopexit1358 ], [ %25, %.loopexit.loopexit1359 ], [ %25, %.loopexit.loopexit1360 ], [ %25, %.loopexit.loopexit1361 ], [ %25, %.loopexit.loopexit1362 ], [ %25, %.loopexit.loopexit1363 ], [ %25, %.loopexit.loopexit1364 ], [ %25, %.loopexit.loopexit1365 ], [ %25, %.loopexit.loopexit1366 ], [ %25, %.loopexit.loopexit1367 ], [ %25, %.loopexit.loopexit1368 ], [ %25, %.loopexit.loopexit1369 ]
  %.20126 = phi i32 [ %23, %3067 ], [ %23, %._crit_edge ], [ %23, %._crit_edge938 ], [ %23, %._crit_edge933 ], [ %23, %._crit_edge928 ], [ %23, %._crit_edge923 ], [ %23, %263 ], [ %23, %278 ], [ %23, %._crit_edge913 ], [ %23, %._crit_edge908 ], [ %23, %._crit_edge903 ], [ %23, %._crit_edge898 ], [ %23, %._crit_edge893 ], [ %23, %._crit_edge853 ], [ %23, %990 ], [ %23, %1113 ], [ %23, %._crit_edge847 ], [ 0, %._crit_edge842 ], [ %.2108, %1291 ], [ %.6112, %1414 ], [ %.3109, %1586 ], [ %.10116, %1647 ], [ %.10116, %1709 ], [ %.10116, %1705 ], [ %.13119, %1729 ], [ %.15121, %1794 ], [ %.15121, %1856 ], [ %.15121, %1852 ], [ %.12118, %1905 ], [ %.12118, %2156 ], [ %.18124, %2221 ], [ %.18124, %2283 ], [ %.18124, %2279 ], [ %.12118, %2290 ], [ %.12118, %2603 ], [ %.12118, %2610 ], [ %.12118, %2511 ], [ %.12118, %2518 ], [ %23, %._crit_edge709 ], [ %23, %._crit_edge704 ], [ %23, %._crit_edge699 ], [ %23, %._crit_edge694 ], [ %23, %._crit_edge689 ], [ %23, %._crit_edge847 ], [ %23, %._crit_edge847 ], [ %23, %._crit_edge918 ], [ %.12118, %.loopexit.loopexit956 ], [ %.15121, %.loopexit.loopexit958 ], [ %.15121, %.loopexit.loopexit959 ], [ %23, %.loopexit.loopexit ], [ %23, %.loopexit.loopexit1326 ], [ %23, %.loopexit.loopexit1327 ], [ %23, %.loopexit.loopexit1328 ], [ %23, %.loopexit.loopexit1329 ], [ %23, %.loopexit.loopexit1330 ], [ %23, %.loopexit.loopexit1331 ], [ %23, %.loopexit.loopexit1332 ], [ %23, %.loopexit.loopexit1333 ], [ %23, %.loopexit.loopexit1334 ], [ %23, %.loopexit.loopexit1335 ], [ %.2108, %.loopexit.loopexit1336 ], [ %.8114, %.loopexit.loopexit1337 ], [ %.7113, %.loopexit.loopexit1338 ], [ %.4110, %.loopexit.loopexit1339 ], [ %.11117, %.loopexit.loopexit1340 ], [ %.16122, %.loopexit.loopexit1341 ], [ %.14120, %.loopexit.loopexit1342 ], [ %.19125, %.loopexit.loopexit1343 ], [ %.17123, %.loopexit.loopexit1344 ], [ %.9115, %.loopexit.loopexit1346 ], [ %23, %.loopexit.loopexit1350 ], [ %23, %.loopexit.loopexit1351 ], [ %23, %.loopexit.loopexit1352 ], [ %23, %.loopexit.loopexit1353 ], [ %23, %.loopexit.loopexit1354 ], [ %23, %.loopexit.loopexit1355 ], [ %23, %.loopexit.loopexit1356 ], [ %23, %.loopexit.loopexit1357 ], [ %23, %.loopexit.loopexit1358 ], [ %23, %.loopexit.loopexit1359 ], [ %23, %.loopexit.loopexit1360 ], [ %23, %.loopexit.loopexit1361 ], [ %23, %.loopexit.loopexit1362 ], [ %23, %.loopexit.loopexit1363 ], [ %23, %.loopexit.loopexit1364 ], [ %23, %.loopexit.loopexit1365 ], [ %23, %.loopexit.loopexit1366 ], [ %23, %.loopexit.loopexit1367 ], [ %23, %.loopexit.loopexit1368 ], [ %23, %.loopexit.loopexit1369 ]
  %.21105 = phi i32 [ %21, %3067 ], [ %21, %._crit_edge ], [ %21, %._crit_edge938 ], [ %21, %._crit_edge933 ], [ %21, %._crit_edge928 ], [ %21, %._crit_edge923 ], [ %21, %263 ], [ %21, %278 ], [ %21, %._crit_edge913 ], [ %21, %._crit_edge908 ], [ %21, %._crit_edge903 ], [ %21, %._crit_edge898 ], [ %21, %._crit_edge893 ], [ %21, %._crit_edge853 ], [ %21, %990 ], [ %21, %1113 ], [ %1128, %._crit_edge847 ], [ %.084, %._crit_edge842 ], [ %.387, %1291 ], [ %.791, %1414 ], [ %.488, %1586 ], [ %.1195, %1647 ], [ %.1195, %1709 ], [ %.1195, %1705 ], [ %.1498, %1729 ], [ %.16100, %1794 ], [ %.16100, %1856 ], [ %.16100, %1852 ], [ %.1397, %1905 ], [ %.1397, %2156 ], [ %.19103, %2221 ], [ %.19103, %2283 ], [ %.19103, %2279 ], [ %.1397, %2290 ], [ %.1397, %2603 ], [ %.1397, %2610 ], [ %.1397, %2511 ], [ %.1397, %2518 ], [ %21, %._crit_edge709 ], [ %21, %._crit_edge704 ], [ %21, %._crit_edge699 ], [ %21, %._crit_edge694 ], [ %21, %._crit_edge689 ], [ %1128, %._crit_edge847 ], [ %1128, %._crit_edge847 ], [ %21, %._crit_edge918 ], [ %.1397, %.loopexit.loopexit956 ], [ %.16100, %.loopexit.loopexit958 ], [ %.16100, %.loopexit.loopexit959 ], [ %21, %.loopexit.loopexit ], [ %21, %.loopexit.loopexit1326 ], [ %21, %.loopexit.loopexit1327 ], [ %21, %.loopexit.loopexit1328 ], [ %21, %.loopexit.loopexit1329 ], [ %21, %.loopexit.loopexit1330 ], [ %21, %.loopexit.loopexit1331 ], [ %21, %.loopexit.loopexit1332 ], [ %21, %.loopexit.loopexit1333 ], [ %21, %.loopexit.loopexit1334 ], [ %21, %.loopexit.loopexit1335 ], [ %.387, %.loopexit.loopexit1336 ], [ %.993, %.loopexit.loopexit1337 ], [ %.892, %.loopexit.loopexit1338 ], [ %.589, %.loopexit.loopexit1339 ], [ %.1296, %.loopexit.loopexit1340 ], [ %.17101, %.loopexit.loopexit1341 ], [ %.1599, %.loopexit.loopexit1342 ], [ %.20104, %.loopexit.loopexit1343 ], [ %.18102, %.loopexit.loopexit1344 ], [ %.1094, %.loopexit.loopexit1346 ], [ %.084, %.loopexit.loopexit1350 ], [ %21, %.loopexit.loopexit1351 ], [ %21, %.loopexit.loopexit1352 ], [ %21, %.loopexit.loopexit1353 ], [ %21, %.loopexit.loopexit1354 ], [ %21, %.loopexit.loopexit1355 ], [ %21, %.loopexit.loopexit1356 ], [ %21, %.loopexit.loopexit1357 ], [ %21, %.loopexit.loopexit1358 ], [ %21, %.loopexit.loopexit1359 ], [ %21, %.loopexit.loopexit1360 ], [ %21, %.loopexit.loopexit1361 ], [ %21, %.loopexit.loopexit1362 ], [ %21, %.loopexit.loopexit1363 ], [ %21, %.loopexit.loopexit1364 ], [ %21, %.loopexit.loopexit1365 ], [ %21, %.loopexit.loopexit1366 ], [ %21, %.loopexit.loopexit1367 ], [ %21, %.loopexit.loopexit1368 ], [ %21, %.loopexit.loopexit1369 ]
  %.2283 = phi i32 [ %19, %3067 ], [ %19, %._crit_edge ], [ %19, %._crit_edge938 ], [ %19, %._crit_edge933 ], [ %19, %._crit_edge928 ], [ %19, %._crit_edge923 ], [ %19, %263 ], [ %19, %278 ], [ %19, %._crit_edge913 ], [ %19, %._crit_edge908 ], [ %19, %._crit_edge903 ], [ %19, %._crit_edge898 ], [ %19, %._crit_edge893 ], [ %19, %._crit_edge853 ], [ %19, %990 ], [ %19, %1113 ], [ %.061, %._crit_edge847 ], [ %.162, %._crit_edge842 ], [ %.465, %1291 ], [ %.869, %1414 ], [ %.566, %1586 ], [ %.1273, %1647 ], [ %.1273, %1709 ], [ %.1273, %1705 ], [ %.1576, %1729 ], [ %.1778, %1794 ], [ %.1778, %1856 ], [ %.1778, %1852 ], [ %.1475, %1905 ], [ %.1475, %2156 ], [ %.2081, %2221 ], [ %.2081, %2283 ], [ %.2081, %2279 ], [ %.1475, %2290 ], [ %.1475, %2603 ], [ %.1475, %2610 ], [ %.1475, %2511 ], [ %.1475, %2518 ], [ %19, %._crit_edge709 ], [ %19, %._crit_edge704 ], [ %19, %._crit_edge699 ], [ %19, %._crit_edge694 ], [ %19, %._crit_edge689 ], [ %.061, %._crit_edge847 ], [ %.061, %._crit_edge847 ], [ %19, %._crit_edge918 ], [ %.1475, %.loopexit.loopexit956 ], [ %.1778, %.loopexit.loopexit958 ], [ %.1778, %.loopexit.loopexit959 ], [ %19, %.loopexit.loopexit ], [ %19, %.loopexit.loopexit1326 ], [ %19, %.loopexit.loopexit1327 ], [ %19, %.loopexit.loopexit1328 ], [ %19, %.loopexit.loopexit1329 ], [ %19, %.loopexit.loopexit1330 ], [ %19, %.loopexit.loopexit1331 ], [ %19, %.loopexit.loopexit1332 ], [ %19, %.loopexit.loopexit1333 ], [ %19, %.loopexit.loopexit1334 ], [ %19, %.loopexit.loopexit1335 ], [ %.465, %.loopexit.loopexit1336 ], [ %.1071, %.loopexit.loopexit1337 ], [ %.970, %.loopexit.loopexit1338 ], [ %.667, %.loopexit.loopexit1339 ], [ %.1374, %.loopexit.loopexit1340 ], [ %.1879, %.loopexit.loopexit1341 ], [ %.1677, %.loopexit.loopexit1342 ], [ %.2182, %.loopexit.loopexit1343 ], [ %.1980, %.loopexit.loopexit1344 ], [ %.1172, %.loopexit.loopexit1346 ], [ %.162, %.loopexit.loopexit1350 ], [ %.061, %.loopexit.loopexit1351 ], [ %19, %.loopexit.loopexit1352 ], [ %19, %.loopexit.loopexit1353 ], [ %19, %.loopexit.loopexit1354 ], [ %19, %.loopexit.loopexit1355 ], [ %19, %.loopexit.loopexit1356 ], [ %19, %.loopexit.loopexit1357 ], [ %19, %.loopexit.loopexit1358 ], [ %19, %.loopexit.loopexit1359 ], [ %19, %.loopexit.loopexit1360 ], [ %19, %.loopexit.loopexit1361 ], [ %19, %.loopexit.loopexit1362 ], [ %19, %.loopexit.loopexit1363 ], [ %19, %.loopexit.loopexit1364 ], [ %19, %.loopexit.loopexit1365 ], [ %19, %.loopexit.loopexit1366 ], [ %19, %.loopexit.loopexit1367 ], [ %19, %.loopexit.loopexit1368 ], [ %19, %.loopexit.loopexit1369 ]
  %.1860 = phi i32 [ %17, %3067 ], [ %17, %._crit_edge ], [ %17, %._crit_edge938 ], [ %17, %._crit_edge933 ], [ %17, %._crit_edge928 ], [ %17, %._crit_edge923 ], [ %17, %263 ], [ %17, %278 ], [ %17, %._crit_edge913 ], [ %17, %._crit_edge908 ], [ %17, %._crit_edge903 ], [ %17, %._crit_edge898 ], [ %17, %._crit_edge893 ], [ %17, %._crit_edge853 ], [ %17, %990 ], [ %17, %1113 ], [ %17, %._crit_edge847 ], [ %17, %._crit_edge842 ], [ %17, %1291 ], [ %.345, %1414 ], [ %.648.lcssa, %1586 ], [ %.850, %1647 ], [ %.850, %1709 ], [ %.850, %1705 ], [ %.1153, %1729 ], [ %.1355, %1794 ], [ %.1355, %1856 ], [ %.1355, %1852 ], [ %.1052, %1905 ], [ %.1052, %2156 ], [ %.1658, %2221 ], [ %.1658, %2283 ], [ %.1658, %2279 ], [ %.1052, %2290 ], [ %.1052, %2603 ], [ %.1052, %2610 ], [ %.1052, %2511 ], [ %.1052, %2518 ], [ %17, %._crit_edge709 ], [ %17, %._crit_edge704 ], [ %17, %._crit_edge699 ], [ %17, %._crit_edge694 ], [ %17, %._crit_edge689 ], [ %17, %._crit_edge847 ], [ %17, %._crit_edge847 ], [ %17, %._crit_edge918 ], [ %.1052, %.loopexit.loopexit956 ], [ %.1355, %.loopexit.loopexit958 ], [ %.1355, %.loopexit.loopexit959 ], [ %17, %.loopexit.loopexit ], [ %17, %.loopexit.loopexit1326 ], [ %17, %.loopexit.loopexit1327 ], [ %17, %.loopexit.loopexit1328 ], [ %17, %.loopexit.loopexit1329 ], [ %17, %.loopexit.loopexit1330 ], [ %17, %.loopexit.loopexit1331 ], [ %17, %.loopexit.loopexit1332 ], [ %17, %.loopexit.loopexit1333 ], [ %17, %.loopexit.loopexit1334 ], [ %17, %.loopexit.loopexit1335 ], [ %17, %.loopexit.loopexit1336 ], [ %.547, %.loopexit.loopexit1337 ], [ %.446, %.loopexit.loopexit1338 ], [ %.143, %.loopexit.loopexit1339 ], [ %.951, %.loopexit.loopexit1340 ], [ %.1456, %.loopexit.loopexit1341 ], [ %.1254, %.loopexit.loopexit1342 ], [ %.1759, %.loopexit.loopexit1343 ], [ %.1557, %.loopexit.loopexit1344 ], [ %.749, %.loopexit.loopexit1346 ], [ %17, %.loopexit.loopexit1350 ], [ %17, %.loopexit.loopexit1351 ], [ %17, %.loopexit.loopexit1352 ], [ %17, %.loopexit.loopexit1353 ], [ %17, %.loopexit.loopexit1354 ], [ %17, %.loopexit.loopexit1355 ], [ %17, %.loopexit.loopexit1356 ], [ %17, %.loopexit.loopexit1357 ], [ %17, %.loopexit.loopexit1358 ], [ %17, %.loopexit.loopexit1359 ], [ %17, %.loopexit.loopexit1360 ], [ %17, %.loopexit.loopexit1361 ], [ %17, %.loopexit.loopexit1362 ], [ %17, %.loopexit.loopexit1363 ], [ %17, %.loopexit.loopexit1364 ], [ %17, %.loopexit.loopexit1365 ], [ %17, %.loopexit.loopexit1366 ], [ %17, %.loopexit.loopexit1367 ], [ %17, %.loopexit.loopexit1368 ], [ %17, %.loopexit.loopexit1369 ]
  %.2841 = phi i32 [ %15, %3067 ], [ %15, %._crit_edge ], [ %15, %._crit_edge938 ], [ %15, %._crit_edge933 ], [ %15, %._crit_edge928 ], [ %15, %._crit_edge923 ], [ %15, %263 ], [ %15, %278 ], [ %15, %._crit_edge913 ], [ %15, %._crit_edge908 ], [ %15, %._crit_edge903 ], [ %15, %._crit_edge898 ], [ %15, %._crit_edge893 ], [ %15, %._crit_edge853 ], [ %15, %990 ], [ %.013, %1113 ], [ %.417, %._crit_edge847 ], [ %.518, %._crit_edge842 ], [ %1292, %1291 ], [ %.1225, %1414 ], [ %.922, %1586 ], [ %.1629, %1647 ], [ %.1629, %1709 ], [ %.1629, %1705 ], [ %.1932, %1729 ], [ %.2134, %1794 ], [ %.2134, %1856 ], [ %.2134, %1852 ], [ %.1831, %1905 ], [ %.1831, %2156 ], [ %.2437, %2221 ], [ %.2437, %2283 ], [ %.2437, %2279 ], [ %.1831, %2290 ], [ %.1831, %2603 ], [ %.1831, %2610 ], [ %2446, %2511 ], [ %2446, %2518 ], [ %15, %._crit_edge709 ], [ %15, %._crit_edge704 ], [ %15, %._crit_edge699 ], [ %15, %._crit_edge694 ], [ %15, %._crit_edge689 ], [ %.417, %._crit_edge847 ], [ %.417, %._crit_edge847 ], [ %15, %._crit_edge918 ], [ %.1831, %.loopexit.loopexit956 ], [ %.2134, %.loopexit.loopexit958 ], [ %.2134, %.loopexit.loopexit959 ], [ %15, %.loopexit.loopexit ], [ %15, %.loopexit.loopexit1326 ], [ %15, %.loopexit.loopexit1327 ], [ %15, %.loopexit.loopexit1328 ], [ %15, %.loopexit.loopexit1329 ], [ %15, %.loopexit.loopexit1330 ], [ %15, %.loopexit.loopexit1331 ], [ %15, %.loopexit.loopexit1332 ], [ %15, %.loopexit.loopexit1333 ], [ %15, %.loopexit.loopexit1334 ], [ %.215, %.loopexit.loopexit1335 ], [ %.821, %.loopexit.loopexit1336 ], [ %.1427, %.loopexit.loopexit1337 ], [ %.1326, %.loopexit.loopexit1338 ], [ %.1023, %.loopexit.loopexit1339 ], [ %.1730, %.loopexit.loopexit1340 ], [ %.2235, %.loopexit.loopexit1341 ], [ %.2033, %.loopexit.loopexit1342 ], [ %.2538, %.loopexit.loopexit1343 ], [ %.2336, %.loopexit.loopexit1344 ], [ %.1528, %.loopexit.loopexit1346 ], [ %.518, %.loopexit.loopexit1350 ], [ %.417, %.loopexit.loopexit1351 ], [ %15, %.loopexit.loopexit1352 ], [ %15, %.loopexit.loopexit1353 ], [ %15, %.loopexit.loopexit1354 ], [ %15, %.loopexit.loopexit1355 ], [ %15, %.loopexit.loopexit1356 ], [ %15, %.loopexit.loopexit1357 ], [ %15, %.loopexit.loopexit1358 ], [ %15, %.loopexit.loopexit1359 ], [ %15, %.loopexit.loopexit1360 ], [ %15, %.loopexit.loopexit1361 ], [ %15, %.loopexit.loopexit1362 ], [ %15, %.loopexit.loopexit1363 ], [ %15, %.loopexit.loopexit1364 ], [ %15, %.loopexit.loopexit1365 ], [ %15, %.loopexit.loopexit1366 ], [ %15, %.loopexit.loopexit1367 ], [ %15, %.loopexit.loopexit1368 ], [ %15, %.loopexit.loopexit1369 ]
  %.40 = phi i32 [ %13, %3067 ], [ %13, %._crit_edge ], [ %13, %._crit_edge938 ], [ %13, %._crit_edge933 ], [ %13, %._crit_edge928 ], [ %13, %._crit_edge923 ], [ %13, %263 ], [ %13, %278 ], [ %13, %._crit_edge913 ], [ %13, %._crit_edge908 ], [ %13, %._crit_edge903 ], [ %13, %._crit_edge898 ], [ %13, %._crit_edge893 ], [ %13, %._crit_edge853 ], [ %13, %990 ], [ %.3, %1113 ], [ %.7, %._crit_edge847 ], [ %.8, %._crit_edge842 ], [ %.11, %1291 ], [ %.1611, %1414 ], [ 256, %1586 ], [ %.22, %1647 ], [ %.22, %1709 ], [ %.22, %1705 ], [ %.25, %1729 ], [ %.27, %1794 ], [ %.27, %1856 ], [ %.27, %1852 ], [ %.24, %1905 ], [ %.24, %2156 ], [ %.30, %2221 ], [ %.30, %2283 ], [ %.30, %2279 ], [ %.24, %2290 ], [ %.38.lcssa, %2603 ], [ %.38.lcssa, %2610 ], [ %.2639, %2511 ], [ %.2639, %2518 ], [ %13, %._crit_edge709 ], [ %13, %._crit_edge704 ], [ %13, %._crit_edge699 ], [ %13, %._crit_edge694 ], [ %13, %._crit_edge689 ], [ %.7, %._crit_edge847 ], [ %.7, %._crit_edge847 ], [ %13, %._crit_edge918 ], [ %3068, %.loopexit.loopexit956 ], [ %.27, %.loopexit.loopexit958 ], [ %.27, %.loopexit.loopexit959 ], [ %13, %.loopexit.loopexit ], [ %13, %.loopexit.loopexit1326 ], [ %13, %.loopexit.loopexit1327 ], [ %13, %.loopexit.loopexit1328 ], [ %13, %.loopexit.loopexit1329 ], [ %13, %.loopexit.loopexit1330 ], [ %13, %.loopexit.loopexit1331 ], [ %13, %.loopexit.loopexit1332 ], [ %13, %.loopexit.loopexit1333 ], [ %.19, %.loopexit.loopexit1334 ], [ %.5, %.loopexit.loopexit1335 ], [ %.11, %.loopexit.loopexit1336 ], [ %.18, %.loopexit.loopexit1337 ], [ %.17, %.loopexit.loopexit1338 ], [ %.1410, %.loopexit.loopexit1339 ], [ %.23, %.loopexit.loopexit1340 ], [ %.28, %.loopexit.loopexit1341 ], [ %.26, %.loopexit.loopexit1342 ], [ %.31, %.loopexit.loopexit1343 ], [ %.29, %.loopexit.loopexit1344 ], [ %.21, %.loopexit.loopexit1346 ], [ %.8, %.loopexit.loopexit1350 ], [ %.7, %.loopexit.loopexit1351 ], [ %13, %.loopexit.loopexit1352 ], [ %13, %.loopexit.loopexit1353 ], [ %13, %.loopexit.loopexit1354 ], [ %13, %.loopexit.loopexit1355 ], [ %13, %.loopexit.loopexit1356 ], [ %13, %.loopexit.loopexit1357 ], [ %13, %.loopexit.loopexit1358 ], [ %13, %.loopexit.loopexit1359 ], [ %13, %.loopexit.loopexit1360 ], [ %13, %.loopexit.loopexit1361 ], [ %13, %.loopexit.loopexit1362 ], [ %13, %.loopexit.loopexit1363 ], [ %13, %.loopexit.loopexit1364 ], [ %13, %.loopexit.loopexit1365 ], [ %13, %.loopexit.loopexit1366 ], [ %13, %.loopexit.loopexit1367 ], [ %13, %.loopexit.loopexit1368 ], [ %13, %.loopexit.loopexit1369 ]
  %.02 = phi i32 [ 0, %3067 ], [ 4, %._crit_edge ], [ -5, %._crit_edge938 ], [ -5, %._crit_edge933 ], [ -5, %._crit_edge928 ], [ -5, %._crit_edge923 ], [ -3, %263 ], [ -3, %278 ], [ -4, %._crit_edge913 ], [ -4, %._crit_edge908 ], [ -4, %._crit_edge903 ], [ -4, %._crit_edge898 ], [ -4, %._crit_edge893 ], [ -4, %._crit_edge853 ], [ -4, %990 ], [ -4, %1113 ], [ -4, %._crit_edge847 ], [ -4, %._crit_edge842 ], [ -4, %1291 ], [ -4, %1414 ], [ -4, %1586 ], [ -4, %1647 ], [ -4, %1709 ], [ -4, %1705 ], [ -4, %1729 ], [ -4, %1794 ], [ -4, %1856 ], [ -4, %1852 ], [ -4, %1905 ], [ -4, %2156 ], [ -4, %2221 ], [ -4, %2283 ], [ -4, %2279 ], [ -4, %2290 ], [ 0, %2603 ], [ 0, %2610 ], [ 0, %2511 ], [ 0, %2518 ], [ -4, %._crit_edge709 ], [ -4, %._crit_edge704 ], [ -4, %._crit_edge699 ], [ -4, %._crit_edge694 ], [ -4, %._crit_edge689 ], [ -4, %._crit_edge847 ], [ -4, %._crit_edge847 ], [ -4, %._crit_edge918 ], [ -4, %.loopexit.loopexit956 ], [ -4, %.loopexit.loopexit958 ], [ -4, %.loopexit.loopexit959 ], [ 0, %.loopexit.loopexit ], [ 0, %.loopexit.loopexit1326 ], [ 0, %.loopexit.loopexit1327 ], [ 0, %.loopexit.loopexit1328 ], [ 0, %.loopexit.loopexit1329 ], [ 0, %.loopexit.loopexit1330 ], [ 0, %.loopexit.loopexit1331 ], [ 0, %.loopexit.loopexit1332 ], [ 0, %.loopexit.loopexit1333 ], [ 0, %.loopexit.loopexit1334 ], [ 0, %.loopexit.loopexit1335 ], [ 0, %.loopexit.loopexit1336 ], [ 0, %.loopexit.loopexit1337 ], [ 0, %.loopexit.loopexit1338 ], [ 0, %.loopexit.loopexit1339 ], [ 0, %.loopexit.loopexit1340 ], [ 0, %.loopexit.loopexit1341 ], [ 0, %.loopexit.loopexit1342 ], [ 0, %.loopexit.loopexit1343 ], [ 0, %.loopexit.loopexit1344 ], [ 0, %.loopexit.loopexit1346 ], [ 0, %.loopexit.loopexit1350 ], [ 0, %.loopexit.loopexit1351 ], [ 0, %.loopexit.loopexit1352 ], [ 0, %.loopexit.loopexit1353 ], [ 0, %.loopexit.loopexit1354 ], [ 0, %.loopexit.loopexit1355 ], [ 0, %.loopexit.loopexit1356 ], [ 0, %.loopexit.loopexit1357 ], [ 0, %.loopexit.loopexit1358 ], [ 0, %.loopexit.loopexit1359 ], [ 0, %.loopexit.loopexit1360 ], [ 0, %.loopexit.loopexit1361 ], [ 0, %.loopexit.loopexit1362 ], [ 0, %.loopexit.loopexit1363 ], [ 0, %.loopexit.loopexit1364 ], [ 0, %.loopexit.loopexit1365 ], [ 0, %.loopexit.loopexit1366 ], [ 0, %.loopexit.loopexit1367 ], [ 0, %.loopexit.loopexit1368 ], [ 0, %.loopexit.loopexit1369 ]
  store i32 %.40, i32* %12, align 4
  store i32 %.2841, i32* %14, align 8
  store i32 %.1860, i32* %16, align 4
  store i32 %.2283, i32* %18, align 8
  store i32 %.21105, i32* %20, align 4
  store i32 %.20126, i32* %22, align 8
  store i32 %.11138, i32* %24, align 4
  store i32 %.14153, i32* %26, align 8
  store i32 %.14168, i32* %28, align 4
  store i32 %.8177, i32* %30, align 8
  store i32 %.11189, i32* %32, align 4
  store i32 %.14204, i32* %34, align 8
  store i32 %.13218, i32* %36, align 4
  store i32 %.8227, i32* %38, align 8
  store i32 %.18246, i32* %40, align 4
  store i32 %43, i32* %42, align 8
  store i32 %.11259, i32* %44, align 4
  store i32 %.10270, i32* %46, align 8
  store i32 %.10281, i32* %48, align 4
  store i32 %.14296, i32* %50, align 8
  store i32 %.14311, i32* %52, align 4
  store i32* %.14326, i32** %54, align 8
  store i32* %.14341, i32** %56, align 8
  store i32* %.14356, i32** %58, align 8
  ret i32 %.02

.preheader424.1:                                  ; preds = %.preheader424.1, %.preheader424.preheader
  %indvars.iv.next10521314 = phi i64 [ 1, %.preheader424.preheader ], [ %indvars.iv.next1052, %.preheader424.1 ]
  %indvars.iv10511313 = phi i64 [ 0, %.preheader424.preheader ], [ %indvars.iv.next1052.7, %.preheader424.1 ]
  %3071 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next10521314
  %3072 = load i32, i32* %3071, align 4
  %3073 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 19, i64 %indvars.iv.next10521314
  store i32 %3072, i32* %3073, align 4
  %indvars.iv.next1052.1 = or i64 %indvars.iv10511313, 2
  %3074 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1052.1
  %3075 = load i32, i32* %3074, align 4
  %3076 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 19, i64 %indvars.iv.next1052.1
  store i32 %3075, i32* %3076, align 4
  %indvars.iv.next1052.2 = or i64 %indvars.iv10511313, 3
  %3077 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1052.2
  %3078 = load i32, i32* %3077, align 4
  %3079 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 19, i64 %indvars.iv.next1052.2
  store i32 %3078, i32* %3079, align 4
  %indvars.iv.next1052.3 = or i64 %indvars.iv10511313, 4
  %3080 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1052.3
  %3081 = load i32, i32* %3080, align 4
  %3082 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 19, i64 %indvars.iv.next1052.3
  store i32 %3081, i32* %3082, align 4
  %indvars.iv.next1052.4 = or i64 %indvars.iv10511313, 5
  %3083 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1052.4
  %3084 = load i32, i32* %3083, align 4
  %3085 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 19, i64 %indvars.iv.next1052.4
  store i32 %3084, i32* %3085, align 4
  %indvars.iv.next1052.5 = or i64 %indvars.iv10511313, 6
  %3086 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1052.5
  %3087 = load i32, i32* %3086, align 4
  %3088 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 19, i64 %indvars.iv.next1052.5
  store i32 %3087, i32* %3088, align 4
  %indvars.iv.next1052.6 = or i64 %indvars.iv10511313, 7
  %3089 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1052.6
  %3090 = load i32, i32* %3089, align 4
  %3091 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 19, i64 %indvars.iv.next1052.6
  store i32 %3090, i32* %3091, align 4
  %indvars.iv.next1052.7 = add nsw i64 %indvars.iv10511313, 8
  %3092 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1052.7
  %3093 = load i32, i32* %3092, align 4
  %3094 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 19, i64 %indvars.iv.next1052.7
  store i32 %3093, i32* %3094, align 4
  %indvars.iv.next1052 = or i64 %indvars.iv.next1052.7, 1
  %exitcond1053 = icmp eq i64 %indvars.iv.next1052, 257
  br i1 %exitcond1053, label %.preheader423, label %.preheader424.1

.preheader425.1:                                  ; preds = %.lr.ph1317
  %3095 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1056
  %3096 = load i32, i32* %3095, align 4
  %3097 = icmp slt i32 %3096, 0
  %3098 = icmp sgt i32 %3096, %.3193
  %or.cond390.1 = or i1 %3097, %3098
  br i1 %or.cond390.1, label %.loopexit.loopexit956.loopexit, label %.preheader425.21057

.preheader425.21057:                              ; preds = %.preheader425.1
  %indvars.iv.next1056.1 = or i64 %indvars.iv10551316, 2
  %3099 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1056.1
  %3100 = load i32, i32* %3099, align 4
  %3101 = icmp slt i32 %3100, 0
  %3102 = icmp sgt i32 %3100, %.3193
  %or.cond390.2 = or i1 %3101, %3102
  br i1 %or.cond390.2, label %.loopexit.loopexit956.loopexit, label %.preheader425.31058

.preheader425.31058:                              ; preds = %.preheader425.21057
  %indvars.iv.next1056.2 = or i64 %indvars.iv10551316, 3
  %3103 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1056.2
  %3104 = load i32, i32* %3103, align 4
  %3105 = icmp slt i32 %3104, 0
  %3106 = icmp sgt i32 %3104, %.3193
  %or.cond390.3 = or i1 %3105, %3106
  br i1 %or.cond390.3, label %.loopexit.loopexit956.loopexit, label %.preheader425

.preheader425:                                    ; preds = %.preheader425.31058
  %indvars.iv.next1056.3 = add nsw i64 %indvars.iv10551316, 4
  %3107 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 %indvars.iv.next1056.3
  %3108 = load i32, i32* %3107, align 4
  %3109 = icmp slt i32 %3108, 0
  %3110 = icmp sgt i32 %3108, %.3193
  %or.cond390 = or i1 %3109, %3110
  br i1 %or.cond390, label %.loopexit.loopexit956.loopexit, label %.lr.ph1317
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @makeMaps_d(%struct.DState* nocapture) unnamed_addr #2 {
  %2 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 27
  store i32 0, i32* %2, align 8
  br label %3

; <label>:3:                                      ; preds = %27, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next.1, %27 ]
  %.01 = phi i32 [ 0, %1 ], [ %28, %27 ]
  %4 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 28, i64 %indvars.iv
  %5 = load i8, i8* %4, align 1
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %14, label %7

; <label>:7:                                      ; preds = %3
  %8 = trunc i32 %.01 to i8
  %9 = load i32, i32* %2, align 8
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 30, i64 %10
  store i8 %8, i8* %11, align 1
  %12 = load i32, i32* %2, align 8
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %2, align 8
  br label %14

; <label>:14:                                     ; preds = %7, %3
  %indvars.iv.next = or i64 %indvars.iv, 1
  %15 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 28, i64 %indvars.iv.next
  %16 = load i8, i8* %15, align 1
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %27, label %19

; <label>:18:                                     ; preds = %27
  ret void

; <label>:19:                                     ; preds = %14
  %20 = trunc i32 %.01 to i8
  %21 = or i8 %20, 1
  %22 = load i32, i32* %2, align 8
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 30, i64 %23
  store i8 %21, i8* %24, align 1
  %25 = load i32, i32* %2, align 8
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %2, align 8
  br label %27

; <label>:27:                                     ; preds = %19, %14
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %28 = add nsw i32 %.01, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 256
  br i1 %exitcond.1, label %18, label %3
}

declare void @BZ2_hbCreateDecodeTables(i32*, i32*, i32*, i8*, i32, i32, i32) local_unnamed_addr #3

declare i32 @BZ2_indexIntoF(i32, i32*) local_unnamed_addr #3

declare void @BZ2_bz__AssertH__fail(i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !2, !3}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !6}
