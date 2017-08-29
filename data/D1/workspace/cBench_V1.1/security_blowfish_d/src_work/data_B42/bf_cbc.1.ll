; ModuleID = 'bf_cbc.ll'
source_filename = "bf_cbc.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bf_key_st = type { [18 x i64], [1024 x i64] }

; Function Attrs: noinline nounwind uwtable
define void @BF_cbc_encrypt(i8* nocapture readonly, i8* nocapture, i64, %struct.bf_key_st*, i8* nocapture, i32) local_unnamed_addr #0 {
  %7 = alloca [2 x i64], align 16
  %8 = icmp eq i32 %5, 0
  %9 = getelementptr inbounds i8, i8* %4, i64 1
  %10 = load i8, i8* %4, align 1
  %11 = zext i8 %10 to i64
  %12 = shl nuw nsw i64 %11, 24
  %13 = getelementptr inbounds i8, i8* %4, i64 2
  %14 = load i8, i8* %9, align 1
  %15 = zext i8 %14 to i64
  %16 = shl nuw nsw i64 %15, 16
  %17 = or i64 %16, %12
  %18 = getelementptr inbounds i8, i8* %4, i64 3
  %19 = load i8, i8* %13, align 1
  %20 = zext i8 %19 to i64
  %21 = shl nuw nsw i64 %20, 8
  %22 = or i64 %17, %21
  %23 = getelementptr inbounds i8, i8* %4, i64 4
  %24 = load i8, i8* %18, align 1
  %25 = zext i8 %24 to i64
  %26 = or i64 %22, %25
  %27 = getelementptr inbounds i8, i8* %4, i64 5
  %28 = load i8, i8* %23, align 1
  %29 = zext i8 %28 to i64
  %30 = shl nuw nsw i64 %29, 24
  %31 = getelementptr inbounds i8, i8* %4, i64 6
  %32 = load i8, i8* %27, align 1
  %33 = zext i8 %32 to i64
  %34 = shl nuw nsw i64 %33, 16
  %35 = or i64 %34, %30
  %36 = getelementptr inbounds i8, i8* %4, i64 7
  %37 = load i8, i8* %31, align 1
  %38 = zext i8 %37 to i64
  %39 = shl nuw nsw i64 %38, 8
  %40 = or i64 %35, %39
  %41 = load i8, i8* %36, align 1
  %42 = zext i8 %41 to i64
  %43 = or i64 %40, %42
  %.11152 = add nsw i64 %2, -8
  %44 = icmp sgt i64 %.11152, -1
  br i1 %8, label %.preheader, label %.preheader51

.preheader51:                                     ; preds = %6
  br i1 %44, label %.lr.ph68, label %._crit_edge69

.lr.ph68:                                         ; preds = %.preheader51
  %45 = getelementptr inbounds [2 x i64], [2 x i64]* %7, i64 0, i64 0
  %46 = getelementptr inbounds [2 x i64], [2 x i64]* %7, i64 0, i64 1
  %47 = and i64 %.11152, -8
  %48 = add i64 %47, 8
  %scevgep83 = getelementptr i8, i8* %1, i64 %48
  br label %53

.preheader:                                       ; preds = %6
  br i1 %44, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %49 = getelementptr inbounds [2 x i64], [2 x i64]* %7, i64 0, i64 0
  %50 = getelementptr inbounds [2 x i64], [2 x i64]* %7, i64 0, i64 1
  %51 = and i64 %.11152, -8
  %52 = add i64 %51, 8
  %scevgep = getelementptr i8, i8* %1, i64 %52
  br label %189

; <label>:53:                                     ; preds = %.lr.ph68, %53
  %.01067 = phi i64 [ %.11152, %.lr.ph68 ], [ %.010, %53 ]
  %.066 = phi i8* [ %0, %.lr.ph68 ], [ %115, %53 ]
  %.0165 = phi i8* [ %1, %.lr.ph68 ], [ %114, %53 ]
  %.02864 = phi i64 [ %26, %.lr.ph68 ], [ %91, %53 ]
  %.03063 = phi i64 [ %43, %.lr.ph68 ], [ %92, %53 ]
  %54 = getelementptr inbounds i8, i8* %.066, i64 1
  %55 = load i8, i8* %.066, align 1
  %56 = zext i8 %55 to i64
  %57 = shl nuw nsw i64 %56, 24
  %58 = getelementptr inbounds i8, i8* %.066, i64 2
  %59 = load i8, i8* %54, align 1
  %60 = zext i8 %59 to i64
  %61 = shl nuw nsw i64 %60, 16
  %62 = or i64 %61, %57
  %63 = getelementptr inbounds i8, i8* %.066, i64 3
  %64 = load i8, i8* %58, align 1
  %65 = zext i8 %64 to i64
  %66 = shl nuw nsw i64 %65, 8
  %67 = or i64 %62, %66
  %68 = getelementptr inbounds i8, i8* %.066, i64 4
  %69 = load i8, i8* %63, align 1
  %70 = zext i8 %69 to i64
  %71 = or i64 %67, %70
  %72 = getelementptr inbounds i8, i8* %.066, i64 5
  %73 = load i8, i8* %68, align 1
  %74 = zext i8 %73 to i64
  %75 = shl nuw nsw i64 %74, 24
  %76 = getelementptr inbounds i8, i8* %.066, i64 6
  %77 = load i8, i8* %72, align 1
  %78 = zext i8 %77 to i64
  %79 = shl nuw nsw i64 %78, 16
  %80 = or i64 %79, %75
  %81 = getelementptr inbounds i8, i8* %.066, i64 7
  %82 = load i8, i8* %76, align 1
  %83 = zext i8 %82 to i64
  %84 = shl nuw nsw i64 %83, 8
  %85 = or i64 %80, %84
  %86 = load i8, i8* %81, align 1
  %87 = zext i8 %86 to i64
  %88 = or i64 %85, %87
  %89 = xor i64 %71, %.02864
  %90 = xor i64 %88, %.03063
  store i64 %89, i64* %45, align 16
  store i64 %90, i64* %46, align 8
  call void @BF_encrypt(i64* nonnull %45, %struct.bf_key_st* %3, i32 1) #2
  %91 = load i64, i64* %45, align 16
  %92 = load i64, i64* %46, align 8
  %93 = lshr i64 %91, 24
  %94 = trunc i64 %93 to i8
  %95 = getelementptr inbounds i8, i8* %.0165, i64 1
  store i8 %94, i8* %.0165, align 1
  %96 = lshr i64 %91, 16
  %97 = trunc i64 %96 to i8
  %98 = getelementptr inbounds i8, i8* %.0165, i64 2
  store i8 %97, i8* %95, align 1
  %99 = lshr i64 %91, 8
  %100 = trunc i64 %99 to i8
  %101 = getelementptr inbounds i8, i8* %.0165, i64 3
  store i8 %100, i8* %98, align 1
  %102 = trunc i64 %91 to i8
  %103 = getelementptr inbounds i8, i8* %.0165, i64 4
  store i8 %102, i8* %101, align 1
  %104 = lshr i64 %92, 24
  %105 = trunc i64 %104 to i8
  %106 = getelementptr inbounds i8, i8* %.0165, i64 5
  store i8 %105, i8* %103, align 1
  %107 = lshr i64 %92, 16
  %108 = trunc i64 %107 to i8
  %109 = getelementptr inbounds i8, i8* %.0165, i64 6
  store i8 %108, i8* %106, align 1
  %110 = lshr i64 %92, 8
  %111 = trunc i64 %110 to i8
  %112 = getelementptr inbounds i8, i8* %.0165, i64 7
  store i8 %111, i8* %109, align 1
  %113 = trunc i64 %92 to i8
  store i8 %113, i8* %112, align 1
  %114 = getelementptr inbounds i8, i8* %.0165, i64 8
  %115 = getelementptr inbounds i8, i8* %.066, i64 8
  %.010 = add nsw i64 %.01067, -8
  %116 = icmp sgt i64 %.010, -1
  br i1 %116, label %53, label %._crit_edge69.loopexit

._crit_edge69.loopexit:                           ; preds = %53
  %117 = add i64 %2, -8
  %118 = sub i64 %117, %47
  %scevgep84 = getelementptr i8, i8* %0, i64 %48
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %._crit_edge69.loopexit, %.preheader51
  %.030.lcssa = phi i64 [ %43, %.preheader51 ], [ %92, %._crit_edge69.loopexit ]
  %.028.lcssa = phi i64 [ %26, %.preheader51 ], [ %91, %._crit_edge69.loopexit ]
  %.010.in.lcssa = phi i64 [ %2, %.preheader51 ], [ %118, %._crit_edge69.loopexit ]
  %.01.lcssa = phi i8* [ %1, %.preheader51 ], [ %scevgep83, %._crit_edge69.loopexit ]
  %.0.lcssa = phi i8* [ %0, %.preheader51 ], [ %scevgep84, %._crit_edge69.loopexit ]
  %119 = icmp eq i64 %.010.in.lcssa, 0
  br i1 %119, label %326, label %120

; <label>:120:                                    ; preds = %._crit_edge69
  %121 = getelementptr inbounds i8, i8* %.0.lcssa, i64 %.010.in.lcssa
  switch i64 %.010.in.lcssa, label %161 [
    i64 1, label %155
    i64 7, label %122
    i64 6, label %127
    i64 5, label %133
    i64 4, label %139
    i64 3, label %143
    i64 2, label %149
  ]

; <label>:122:                                    ; preds = %120
  %123 = getelementptr inbounds i8, i8* %121, i64 -1
  %124 = load i8, i8* %123, align 1
  %125 = zext i8 %124 to i64
  %126 = shl nuw nsw i64 %125, 8
  br label %127

; <label>:127:                                    ; preds = %122, %120
  %.121 = phi i64 [ 0, %120 ], [ %126, %122 ]
  %.2 = phi i8* [ %121, %120 ], [ %123, %122 ]
  %128 = getelementptr inbounds i8, i8* %.2, i64 -1
  %129 = load i8, i8* %128, align 1
  %130 = zext i8 %129 to i64
  %131 = shl nuw nsw i64 %130, 16
  %132 = or i64 %131, %.121
  br label %133

; <label>:133:                                    ; preds = %127, %120
  %.222 = phi i64 [ 0, %120 ], [ %132, %127 ]
  %.3 = phi i8* [ %121, %120 ], [ %128, %127 ]
  %134 = getelementptr inbounds i8, i8* %.3, i64 -1
  %135 = load i8, i8* %134, align 1
  %136 = zext i8 %135 to i64
  %137 = shl nuw nsw i64 %136, 24
  %138 = or i64 %137, %.222
  br label %139

; <label>:139:                                    ; preds = %133, %120
  %.323 = phi i64 [ 0, %120 ], [ %138, %133 ]
  %.4 = phi i8* [ %121, %120 ], [ %134, %133 ]
  %140 = getelementptr inbounds i8, i8* %.4, i64 -1
  %141 = load i8, i8* %140, align 1
  %142 = zext i8 %141 to i64
  br label %143

; <label>:143:                                    ; preds = %139, %120
  %.424 = phi i64 [ 0, %120 ], [ %.323, %139 ]
  %.016 = phi i64 [ 0, %120 ], [ %142, %139 ]
  %.5 = phi i8* [ %121, %120 ], [ %140, %139 ]
  %144 = getelementptr inbounds i8, i8* %.5, i64 -1
  %145 = load i8, i8* %144, align 1
  %146 = zext i8 %145 to i64
  %147 = shl nuw nsw i64 %146, 8
  %148 = or i64 %147, %.016
  br label %149

; <label>:149:                                    ; preds = %143, %120
  %.525 = phi i64 [ 0, %120 ], [ %.424, %143 ]
  %.117 = phi i64 [ 0, %120 ], [ %148, %143 ]
  %.6 = phi i8* [ %121, %120 ], [ %144, %143 ]
  %150 = getelementptr inbounds i8, i8* %.6, i64 -1
  %151 = load i8, i8* %150, align 1
  %152 = zext i8 %151 to i64
  %153 = shl nuw nsw i64 %152, 16
  %154 = or i64 %153, %.117
  br label %155

; <label>:155:                                    ; preds = %120, %149
  %.626 = phi i64 [ 0, %120 ], [ %.525, %149 ]
  %.218 = phi i64 [ 0, %120 ], [ %154, %149 ]
  %.7 = phi i8* [ %121, %120 ], [ %150, %149 ]
  %156 = getelementptr inbounds i8, i8* %.7, i64 -1
  %157 = load i8, i8* %156, align 1
  %158 = zext i8 %157 to i64
  %159 = shl nuw nsw i64 %158, 24
  %160 = or i64 %159, %.218
  br label %161

; <label>:161:                                    ; preds = %155, %120
  %.727 = phi i64 [ 0, %120 ], [ %.626, %155 ]
  %.319 = phi i64 [ 0, %120 ], [ %160, %155 ]
  %162 = xor i64 %.319, %.028.lcssa
  %163 = xor i64 %.727, %.030.lcssa
  %164 = getelementptr inbounds [2 x i64], [2 x i64]* %7, i64 0, i64 0
  store i64 %162, i64* %164, align 16
  %165 = getelementptr inbounds [2 x i64], [2 x i64]* %7, i64 0, i64 1
  store i64 %163, i64* %165, align 8
  call void @BF_encrypt(i64* nonnull %164, %struct.bf_key_st* %3, i32 1) #2
  %166 = load i64, i64* %164, align 16
  %167 = load i64, i64* %165, align 8
  %168 = lshr i64 %166, 24
  %169 = trunc i64 %168 to i8
  %170 = getelementptr inbounds i8, i8* %.01.lcssa, i64 1
  store i8 %169, i8* %.01.lcssa, align 1
  %171 = lshr i64 %166, 16
  %172 = trunc i64 %171 to i8
  %173 = getelementptr inbounds i8, i8* %.01.lcssa, i64 2
  store i8 %172, i8* %170, align 1
  %174 = lshr i64 %166, 8
  %175 = trunc i64 %174 to i8
  %176 = getelementptr inbounds i8, i8* %.01.lcssa, i64 3
  store i8 %175, i8* %173, align 1
  %177 = trunc i64 %166 to i8
  %178 = getelementptr inbounds i8, i8* %.01.lcssa, i64 4
  store i8 %177, i8* %176, align 1
  %179 = lshr i64 %167, 24
  %180 = trunc i64 %179 to i8
  %181 = getelementptr inbounds i8, i8* %.01.lcssa, i64 5
  store i8 %180, i8* %178, align 1
  %182 = lshr i64 %167, 16
  %183 = trunc i64 %182 to i8
  %184 = getelementptr inbounds i8, i8* %.01.lcssa, i64 6
  store i8 %183, i8* %181, align 1
  %185 = lshr i64 %167, 8
  %186 = trunc i64 %185 to i8
  %187 = getelementptr inbounds i8, i8* %.01.lcssa, i64 7
  store i8 %186, i8* %184, align 1
  %188 = trunc i64 %167 to i8
  store i8 %188, i8* %187, align 1
  br label %326

; <label>:189:                                    ; preds = %.lr.ph, %189
  %.11157 = phi i64 [ %.11152, %.lr.ph ], [ %.111, %189 ]
  %.856 = phi i8* [ %0, %.lr.ph ], [ %251, %189 ]
  %.1255 = phi i8* [ %1, %.lr.ph ], [ %250, %189 ]
  %.01254 = phi i64 [ %43, %.lr.ph ], [ %224, %189 ]
  %.01453 = phi i64 [ %26, %.lr.ph ], [ %207, %189 ]
  %190 = getelementptr inbounds i8, i8* %.856, i64 1
  %191 = load i8, i8* %.856, align 1
  %192 = zext i8 %191 to i64
  %193 = shl nuw nsw i64 %192, 24
  %194 = getelementptr inbounds i8, i8* %.856, i64 2
  %195 = load i8, i8* %190, align 1
  %196 = zext i8 %195 to i64
  %197 = shl nuw nsw i64 %196, 16
  %198 = or i64 %197, %193
  %199 = getelementptr inbounds i8, i8* %.856, i64 3
  %200 = load i8, i8* %194, align 1
  %201 = zext i8 %200 to i64
  %202 = shl nuw nsw i64 %201, 8
  %203 = or i64 %198, %202
  %204 = getelementptr inbounds i8, i8* %.856, i64 4
  %205 = load i8, i8* %199, align 1
  %206 = zext i8 %205 to i64
  %207 = or i64 %203, %206
  %208 = getelementptr inbounds i8, i8* %.856, i64 5
  %209 = load i8, i8* %204, align 1
  %210 = zext i8 %209 to i64
  %211 = shl nuw nsw i64 %210, 24
  %212 = getelementptr inbounds i8, i8* %.856, i64 6
  %213 = load i8, i8* %208, align 1
  %214 = zext i8 %213 to i64
  %215 = shl nuw nsw i64 %214, 16
  %216 = or i64 %215, %211
  %217 = getelementptr inbounds i8, i8* %.856, i64 7
  %218 = load i8, i8* %212, align 1
  %219 = zext i8 %218 to i64
  %220 = shl nuw nsw i64 %219, 8
  %221 = or i64 %216, %220
  %222 = load i8, i8* %217, align 1
  %223 = zext i8 %222 to i64
  %224 = or i64 %221, %223
  store i64 %207, i64* %49, align 16
  store i64 %224, i64* %50, align 8
  call void @BF_encrypt(i64* nonnull %49, %struct.bf_key_st* %3, i32 0) #2
  %225 = load i64, i64* %49, align 16
  %226 = xor i64 %225, %.01453
  %227 = load i64, i64* %50, align 8
  %228 = xor i64 %227, %.01254
  %229 = lshr i64 %226, 24
  %230 = trunc i64 %229 to i8
  %231 = getelementptr inbounds i8, i8* %.1255, i64 1
  store i8 %230, i8* %.1255, align 1
  %232 = lshr i64 %226, 16
  %233 = trunc i64 %232 to i8
  %234 = getelementptr inbounds i8, i8* %.1255, i64 2
  store i8 %233, i8* %231, align 1
  %235 = lshr i64 %226, 8
  %236 = trunc i64 %235 to i8
  %237 = getelementptr inbounds i8, i8* %.1255, i64 3
  store i8 %236, i8* %234, align 1
  %238 = trunc i64 %226 to i8
  %239 = getelementptr inbounds i8, i8* %.1255, i64 4
  store i8 %238, i8* %237, align 1
  %240 = lshr i64 %228, 24
  %241 = trunc i64 %240 to i8
  %242 = getelementptr inbounds i8, i8* %.1255, i64 5
  store i8 %241, i8* %239, align 1
  %243 = lshr i64 %228, 16
  %244 = trunc i64 %243 to i8
  %245 = getelementptr inbounds i8, i8* %.1255, i64 6
  store i8 %244, i8* %242, align 1
  %246 = lshr i64 %228, 8
  %247 = trunc i64 %246 to i8
  %248 = getelementptr inbounds i8, i8* %.1255, i64 7
  store i8 %247, i8* %245, align 1
  %249 = trunc i64 %228 to i8
  store i8 %249, i8* %248, align 1
  %250 = getelementptr inbounds i8, i8* %.1255, i64 8
  %251 = getelementptr inbounds i8, i8* %.856, i64 8
  %.111 = add nsw i64 %.11157, -8
  %252 = icmp sgt i64 %.111, -1
  br i1 %252, label %189, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %189
  %253 = add i64 %2, -8
  %254 = sub i64 %253, %51
  %scevgep82 = getelementptr i8, i8* %0, i64 %52
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.014.lcssa = phi i64 [ %26, %.preheader ], [ %207, %._crit_edge.loopexit ]
  %.012.lcssa = phi i64 [ %43, %.preheader ], [ %224, %._crit_edge.loopexit ]
  %.111.in.lcssa = phi i64 [ %2, %.preheader ], [ %254, %._crit_edge.loopexit ]
  %.12.lcssa = phi i8* [ %1, %.preheader ], [ %scevgep, %._crit_edge.loopexit ]
  %.8.lcssa = phi i8* [ %0, %.preheader ], [ %scevgep82, %._crit_edge.loopexit ]
  %255 = icmp eq i64 %.111.in.lcssa, 0
  br i1 %255, label %326, label %256

; <label>:256:                                    ; preds = %._crit_edge
  %257 = getelementptr inbounds i8, i8* %.8.lcssa, i64 1
  %258 = load i8, i8* %.8.lcssa, align 1
  %259 = zext i8 %258 to i64
  %260 = shl nuw nsw i64 %259, 24
  %261 = getelementptr inbounds i8, i8* %.8.lcssa, i64 2
  %262 = load i8, i8* %257, align 1
  %263 = zext i8 %262 to i64
  %264 = shl nuw nsw i64 %263, 16
  %265 = or i64 %264, %260
  %266 = getelementptr inbounds i8, i8* %.8.lcssa, i64 3
  %267 = load i8, i8* %261, align 1
  %268 = zext i8 %267 to i64
  %269 = shl nuw nsw i64 %268, 8
  %270 = or i64 %265, %269
  %271 = getelementptr inbounds i8, i8* %.8.lcssa, i64 4
  %272 = load i8, i8* %266, align 1
  %273 = zext i8 %272 to i64
  %274 = or i64 %270, %273
  %275 = getelementptr inbounds i8, i8* %.8.lcssa, i64 5
  %276 = load i8, i8* %271, align 1
  %277 = zext i8 %276 to i64
  %278 = shl nuw nsw i64 %277, 24
  %279 = getelementptr inbounds i8, i8* %.8.lcssa, i64 6
  %280 = load i8, i8* %275, align 1
  %281 = zext i8 %280 to i64
  %282 = shl nuw nsw i64 %281, 16
  %283 = or i64 %282, %278
  %284 = getelementptr inbounds i8, i8* %.8.lcssa, i64 7
  %285 = load i8, i8* %279, align 1
  %286 = zext i8 %285 to i64
  %287 = shl nuw nsw i64 %286, 8
  %288 = or i64 %283, %287
  %289 = load i8, i8* %284, align 1
  %290 = zext i8 %289 to i64
  %291 = or i64 %288, %290
  %292 = getelementptr inbounds [2 x i64], [2 x i64]* %7, i64 0, i64 0
  store i64 %274, i64* %292, align 16
  %293 = getelementptr inbounds [2 x i64], [2 x i64]* %7, i64 0, i64 1
  store i64 %291, i64* %293, align 8
  call void @BF_encrypt(i64* nonnull %292, %struct.bf_key_st* %3, i32 0) #2
  %294 = load i64, i64* %292, align 16
  %295 = xor i64 %294, %.014.lcssa
  %296 = load i64, i64* %293, align 8
  %297 = xor i64 %296, %.012.lcssa
  %298 = getelementptr inbounds i8, i8* %.12.lcssa, i64 %.111.in.lcssa
  switch i64 %.111.in.lcssa, label %326 [
    i64 1, label %322
    i64 7, label %299
    i64 6, label %303
    i64 5, label %307
    i64 4, label %311
    i64 3, label %314
    i64 2, label %318
  ]

; <label>:299:                                    ; preds = %256
  %300 = lshr i64 %297, 8
  %301 = trunc i64 %300 to i8
  %302 = getelementptr inbounds i8, i8* %298, i64 -1
  store i8 %301, i8* %302, align 1
  br label %303

; <label>:303:                                    ; preds = %299, %256
  %.34 = phi i8* [ %298, %256 ], [ %302, %299 ]
  %304 = lshr i64 %297, 16
  %305 = trunc i64 %304 to i8
  %306 = getelementptr inbounds i8, i8* %.34, i64 -1
  store i8 %305, i8* %306, align 1
  br label %307

; <label>:307:                                    ; preds = %303, %256
  %.45 = phi i8* [ %298, %256 ], [ %306, %303 ]
  %308 = lshr i64 %297, 24
  %309 = trunc i64 %308 to i8
  %310 = getelementptr inbounds i8, i8* %.45, i64 -1
  store i8 %309, i8* %310, align 1
  br label %311

; <label>:311:                                    ; preds = %307, %256
  %.56 = phi i8* [ %298, %256 ], [ %310, %307 ]
  %312 = trunc i64 %295 to i8
  %313 = getelementptr inbounds i8, i8* %.56, i64 -1
  store i8 %312, i8* %313, align 1
  br label %314

; <label>:314:                                    ; preds = %311, %256
  %.67 = phi i8* [ %298, %256 ], [ %313, %311 ]
  %315 = lshr i64 %295, 8
  %316 = trunc i64 %315 to i8
  %317 = getelementptr inbounds i8, i8* %.67, i64 -1
  store i8 %316, i8* %317, align 1
  br label %318

; <label>:318:                                    ; preds = %314, %256
  %.78 = phi i8* [ %298, %256 ], [ %317, %314 ]
  %319 = lshr i64 %295, 16
  %320 = trunc i64 %319 to i8
  %321 = getelementptr inbounds i8, i8* %.78, i64 -1
  store i8 %320, i8* %321, align 1
  br label %322

; <label>:322:                                    ; preds = %256, %318
  %.89 = phi i8* [ %298, %256 ], [ %321, %318 ]
  %323 = lshr i64 %295, 24
  %324 = trunc i64 %323 to i8
  %325 = getelementptr inbounds i8, i8* %.89, i64 -1
  store i8 %324, i8* %325, align 1
  br label %326

; <label>:326:                                    ; preds = %161, %._crit_edge69, %._crit_edge, %322, %256
  %.115.sink50 = phi i64 [ %.014.lcssa, %._crit_edge ], [ %274, %322 ], [ %274, %256 ], [ %166, %161 ], [ %.028.lcssa, %._crit_edge69 ]
  %.113.sink41 = phi i64 [ %.012.lcssa, %._crit_edge ], [ %291, %322 ], [ %291, %256 ], [ %167, %161 ], [ %.030.lcssa, %._crit_edge69 ]
  %327 = lshr i64 %.115.sink50, 24
  %328 = trunc i64 %327 to i8
  store i8 %328, i8* %4, align 1
  %329 = lshr i64 %.115.sink50, 16
  %330 = trunc i64 %329 to i8
  store i8 %330, i8* %9, align 1
  %331 = lshr i64 %.115.sink50, 8
  %332 = trunc i64 %331 to i8
  store i8 %332, i8* %13, align 1
  %333 = trunc i64 %.115.sink50 to i8
  store i8 %333, i8* %18, align 1
  %334 = lshr i64 %.113.sink41, 24
  %335 = trunc i64 %334 to i8
  store i8 %335, i8* %23, align 1
  %336 = lshr i64 %.113.sink41, 16
  %337 = trunc i64 %336 to i8
  store i8 %337, i8* %27, align 1
  %338 = lshr i64 %.113.sink41, 8
  %339 = trunc i64 %338 to i8
  store i8 %339, i8* %31, align 1
  %340 = trunc i64 %.113.sink41 to i8
  store i8 %340, i8* %36, align 1
  ret void
}

declare void @BF_encrypt(i64*, %struct.bf_key_st*, i32) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
