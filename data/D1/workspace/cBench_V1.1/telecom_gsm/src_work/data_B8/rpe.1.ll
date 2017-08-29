; ModuleID = 'rpe.ll'
source_filename = "rpe.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

@.str = private unnamed_addr constant [9 x i8] c"exp <= 5\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"rpe.c\00", align 1
@__PRETTY_FUNCTION__.APCM_quantization = private unnamed_addr constant [63 x i8] c"void APCM_quantization(word *, word *, word *, word *, word *)\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"exp <= 6 && exp >= 0\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"temp <= 11 && temp >= 0\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"exp <= 4096 && exp >= -4096\00", align 1
@.str.5 = private unnamed_addr constant [23 x i8] c"mant >= 0 && mant <= 7\00", align 1
@gsm_NRFAC = external local_unnamed_addr global [8 x i16], align 16
@.str.6 = private unnamed_addr constant [25 x i8] c"temp1 >= 0 && temp1 < 16\00", align 1
@__PRETTY_FUNCTION__.APCM_inverse_quantization = private unnamed_addr constant [59 x i8] c"void APCM_inverse_quantization(word *, word, word, word *)\00", align 1
@gsm_FAC = external local_unnamed_addr global [8 x i16], align 16
@.str.7 = private unnamed_addr constant [23 x i8] c"*xMc <= 7 && *xMc >= 0\00", align 1
@.str.8 = private unnamed_addr constant [24 x i8] c"temp <= 7 && temp >= -7\00", align 1
@.str.9 = private unnamed_addr constant [19 x i8] c"0 <= Mc && Mc <= 3\00", align 1
@__PRETTY_FUNCTION__.RPE_grid_positioning = private unnamed_addr constant [48 x i8] c"void RPE_grid_positioning(word, word *, word *)\00", align 1
@.str.10 = private unnamed_addr constant [22 x i8] c"exp >= -4 && exp <= 6\00", align 1
@__PRETTY_FUNCTION__.APCM_quantization_xmaxc_to_exp_mant = private unnamed_addr constant [63 x i8] c"void APCM_quantization_xmaxc_to_exp_mant(word, word *, word *)\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @Gsm_RPE_Encoding(%struct.gsm_state* nocapture readnone, i16* nocapture, i16* nocapture, i16* nocapture, i16* nocapture) local_unnamed_addr #0 {
  %6 = alloca [40 x i16], align 16
  %7 = alloca [13 x i16], align 16
  %8 = alloca [13 x i16], align 16
  %9 = alloca i16, align 2
  %10 = alloca i16, align 2
  %11 = getelementptr inbounds [40 x i16], [40 x i16]* %6, i64 0, i64 0
  call fastcc void @Weighting_filter(i16* %1, i16* nonnull %11)
  %12 = getelementptr inbounds [13 x i16], [13 x i16]* %7, i64 0, i64 0
  call fastcc void @RPE_grid_selection(i16* nonnull %11, i16* nonnull %12, i16* %3)
  call fastcc void @APCM_quantization(i16* nonnull %12, i16* %4, i16* nonnull %9, i16* nonnull %10, i16* %2)
  %13 = load i16, i16* %9, align 2
  %14 = load i16, i16* %10, align 2
  %15 = getelementptr inbounds [13 x i16], [13 x i16]* %8, i64 0, i64 0
  call fastcc void @APCM_inverse_quantization(i16* %4, i16 signext %13, i16 signext %14, i16* nonnull %15)
  %16 = load i16, i16* %3, align 2
  call fastcc void @RPE_grid_positioning(i16 signext %16, i16* nonnull %15, i16* %1)
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @Weighting_filter(i16* nocapture readonly, i16* nocapture) unnamed_addr #1 {
  %3 = getelementptr inbounds i16, i16* %0, i64 -5
  br label %4

; <label>:4:                                      ; preds = %4, %2
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %4 ]
  %5 = getelementptr inbounds i16, i16* %3, i64 %indvars.iv
  %6 = load i16, i16* %5, align 2
  %7 = sext i16 %6 to i64
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %8 = getelementptr inbounds i16, i16* %3, i64 %indvars.iv.next
  %9 = load i16, i16* %8, align 2
  %10 = sext i16 %9 to i64
  %11 = add nuw nsw i64 %indvars.iv, 3
  %12 = getelementptr inbounds i16, i16* %3, i64 %11
  %13 = load i16, i16* %12, align 2
  %14 = sext i16 %13 to i64
  %15 = add nuw nsw i64 %indvars.iv, 4
  %16 = getelementptr inbounds i16, i16* %3, i64 %15
  %17 = load i16, i16* %16, align 2
  %18 = sext i16 %17 to i64
  %19 = add nuw nsw i64 %indvars.iv, 5
  %20 = getelementptr inbounds i16, i16* %3, i64 %19
  %21 = load i16, i16* %20, align 2
  %22 = sext i16 %21 to i64
  %23 = shl nsw i64 %22, 13
  %24 = add nuw nsw i64 %indvars.iv, 6
  %25 = getelementptr inbounds i16, i16* %3, i64 %24
  %26 = load i16, i16* %25, align 2
  %27 = sext i16 %26 to i64
  %28 = add nuw nsw i64 %indvars.iv, 7
  %29 = getelementptr inbounds i16, i16* %3, i64 %28
  %30 = load i16, i16* %29, align 2
  %31 = sext i16 %30 to i64
  %32 = add nuw nsw i64 %indvars.iv, 9
  %33 = getelementptr inbounds i16, i16* %3, i64 %32
  %34 = load i16, i16* %33, align 2
  %35 = sext i16 %34 to i64
  %36 = add nuw nsw i64 %indvars.iv, 10
  %37 = getelementptr inbounds i16, i16* %3, i64 %36
  %38 = load i16, i16* %37, align 2
  %39 = sext i16 %38 to i64
  %tmp = add nsw i64 %27, %18
  %tmp1 = mul nsw i64 %tmp, 5741
  %tmp2 = add nsw i64 %31, %14
  %tmp3 = mul nsw i64 %tmp2, 2054
  %tmp4 = add nsw i64 %35, %10
  %tmp5 = mul nsw i64 %tmp4, -374
  %tmp6 = add nsw i64 %39, %7
  %tmp7 = mul nsw i64 %tmp6, -134
  %40 = or i64 %23, 4096
  %41 = add i64 %40, %tmp1
  %42 = add i64 %41, %tmp3
  %43 = add i64 %42, %tmp5
  %44 = add i64 %43, %tmp7
  %45 = ashr i64 %44, 13
  %46 = icmp slt i64 %45, -32768
  %47 = icmp slt i64 %45, 32767
  %. = select i1 %47, i64 %45, i64 32767
  %48 = trunc i64 %. to i16
  %49 = select i1 %46, i16 -32768, i16 %48
  %50 = getelementptr inbounds i16, i16* %1, i64 %indvars.iv
  store i16 %49, i16* %50, align 2
  %exitcond = icmp eq i64 %indvars.iv.next, 40
  br i1 %exitcond, label %51, label %4

; <label>:51:                                     ; preds = %4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @RPE_grid_selection(i16* readonly, i16* nocapture, i16* nocapture) unnamed_addr #1 {
  %4 = getelementptr inbounds i16, i16* %0, i64 3
  %5 = load i16, i16* %4, align 2
  %6 = sext i16 %5 to i32
  %7 = ashr i32 %6, 2
  %8 = sext i32 %7 to i64
  %9 = mul nsw i64 %8, %8
  %10 = getelementptr inbounds i16, i16* %0, i64 6
  %11 = load i16, i16* %10, align 2
  %12 = sext i16 %11 to i32
  %13 = ashr i32 %12, 2
  %14 = sext i32 %13 to i64
  %15 = mul nsw i64 %14, %14
  %16 = add nuw nsw i64 %15, %9
  %17 = getelementptr inbounds i16, i16* %0, i64 9
  %18 = load i16, i16* %17, align 2
  %19 = sext i16 %18 to i32
  %20 = ashr i32 %19, 2
  %21 = sext i32 %20 to i64
  %22 = mul nsw i64 %21, %21
  %23 = add nuw nsw i64 %16, %22
  %24 = getelementptr inbounds i16, i16* %0, i64 12
  %25 = load i16, i16* %24, align 2
  %26 = sext i16 %25 to i32
  %27 = ashr i32 %26, 2
  %28 = sext i32 %27 to i64
  %29 = mul nsw i64 %28, %28
  %30 = add nuw nsw i64 %23, %29
  %31 = getelementptr inbounds i16, i16* %0, i64 15
  %32 = load i16, i16* %31, align 2
  %33 = sext i16 %32 to i32
  %34 = ashr i32 %33, 2
  %35 = sext i32 %34 to i64
  %36 = mul nsw i64 %35, %35
  %37 = add nuw nsw i64 %30, %36
  %38 = getelementptr inbounds i16, i16* %0, i64 18
  %39 = load i16, i16* %38, align 2
  %40 = sext i16 %39 to i32
  %41 = ashr i32 %40, 2
  %42 = sext i32 %41 to i64
  %43 = mul nsw i64 %42, %42
  %44 = add nuw nsw i64 %37, %43
  %45 = getelementptr inbounds i16, i16* %0, i64 21
  %46 = load i16, i16* %45, align 2
  %47 = sext i16 %46 to i32
  %48 = ashr i32 %47, 2
  %49 = sext i32 %48 to i64
  %50 = mul nsw i64 %49, %49
  %51 = add nuw nsw i64 %44, %50
  %52 = getelementptr inbounds i16, i16* %0, i64 24
  %53 = load i16, i16* %52, align 2
  %54 = sext i16 %53 to i32
  %55 = ashr i32 %54, 2
  %56 = sext i32 %55 to i64
  %57 = mul nsw i64 %56, %56
  %58 = add nsw i64 %51, %57
  %59 = getelementptr inbounds i16, i16* %0, i64 27
  %60 = load i16, i16* %59, align 2
  %61 = sext i16 %60 to i32
  %62 = ashr i32 %61, 2
  %63 = sext i32 %62 to i64
  %64 = mul nsw i64 %63, %63
  %65 = add nsw i64 %58, %64
  %66 = getelementptr inbounds i16, i16* %0, i64 30
  %67 = load i16, i16* %66, align 2
  %68 = sext i16 %67 to i32
  %69 = ashr i32 %68, 2
  %70 = sext i32 %69 to i64
  %71 = mul nsw i64 %70, %70
  %72 = add nsw i64 %65, %71
  %73 = getelementptr inbounds i16, i16* %0, i64 33
  %74 = load i16, i16* %73, align 2
  %75 = sext i16 %74 to i32
  %76 = ashr i32 %75, 2
  %77 = sext i32 %76 to i64
  %78 = mul nsw i64 %77, %77
  %79 = add nsw i64 %72, %78
  %80 = getelementptr inbounds i16, i16* %0, i64 36
  %81 = load i16, i16* %80, align 2
  %82 = sext i16 %81 to i32
  %83 = ashr i32 %82, 2
  %84 = sext i32 %83 to i64
  %85 = mul nsw i64 %84, %84
  %86 = add nsw i64 %79, %85
  %87 = load i16, i16* %0, align 2
  %88 = sext i16 %87 to i32
  %89 = ashr i32 %88, 2
  %90 = sext i32 %89 to i64
  %91 = mul nsw i64 %90, %90
  %92 = add nsw i64 %86, %91
  %93 = shl i64 %92, 1
  %94 = getelementptr inbounds i16, i16* %0, i64 1
  %95 = load i16, i16* %94, align 2
  %96 = sext i16 %95 to i32
  %97 = ashr i32 %96, 2
  %98 = sext i32 %97 to i64
  %99 = mul nsw i64 %98, %98
  %100 = getelementptr inbounds i16, i16* %0, i64 4
  %101 = load i16, i16* %100, align 2
  %102 = sext i16 %101 to i32
  %103 = ashr i32 %102, 2
  %104 = sext i32 %103 to i64
  %105 = mul nsw i64 %104, %104
  %106 = add nuw nsw i64 %105, %99
  %107 = getelementptr inbounds i16, i16* %0, i64 7
  %108 = load i16, i16* %107, align 2
  %109 = sext i16 %108 to i32
  %110 = ashr i32 %109, 2
  %111 = sext i32 %110 to i64
  %112 = mul nsw i64 %111, %111
  %113 = add nuw nsw i64 %106, %112
  %114 = getelementptr inbounds i16, i16* %0, i64 10
  %115 = load i16, i16* %114, align 2
  %116 = sext i16 %115 to i32
  %117 = ashr i32 %116, 2
  %118 = sext i32 %117 to i64
  %119 = mul nsw i64 %118, %118
  %120 = add nuw nsw i64 %113, %119
  %121 = getelementptr inbounds i16, i16* %0, i64 13
  %122 = load i16, i16* %121, align 2
  %123 = sext i16 %122 to i32
  %124 = ashr i32 %123, 2
  %125 = sext i32 %124 to i64
  %126 = mul nsw i64 %125, %125
  %127 = add nuw nsw i64 %120, %126
  %128 = getelementptr inbounds i16, i16* %0, i64 16
  %129 = load i16, i16* %128, align 2
  %130 = sext i16 %129 to i32
  %131 = ashr i32 %130, 2
  %132 = sext i32 %131 to i64
  %133 = mul nsw i64 %132, %132
  %134 = add nuw nsw i64 %127, %133
  %135 = getelementptr inbounds i16, i16* %0, i64 19
  %136 = load i16, i16* %135, align 2
  %137 = sext i16 %136 to i32
  %138 = ashr i32 %137, 2
  %139 = sext i32 %138 to i64
  %140 = mul nsw i64 %139, %139
  %141 = add nuw nsw i64 %134, %140
  %142 = getelementptr inbounds i16, i16* %0, i64 22
  %143 = load i16, i16* %142, align 2
  %144 = sext i16 %143 to i32
  %145 = ashr i32 %144, 2
  %146 = sext i32 %145 to i64
  %147 = mul nsw i64 %146, %146
  %148 = add nsw i64 %141, %147
  %149 = getelementptr inbounds i16, i16* %0, i64 25
  %150 = load i16, i16* %149, align 2
  %151 = sext i16 %150 to i32
  %152 = ashr i32 %151, 2
  %153 = sext i32 %152 to i64
  %154 = mul nsw i64 %153, %153
  %155 = add nsw i64 %148, %154
  %156 = getelementptr inbounds i16, i16* %0, i64 28
  %157 = load i16, i16* %156, align 2
  %158 = sext i16 %157 to i32
  %159 = ashr i32 %158, 2
  %160 = sext i32 %159 to i64
  %161 = mul nsw i64 %160, %160
  %162 = add nsw i64 %155, %161
  %163 = getelementptr inbounds i16, i16* %0, i64 31
  %164 = load i16, i16* %163, align 2
  %165 = sext i16 %164 to i32
  %166 = ashr i32 %165, 2
  %167 = sext i32 %166 to i64
  %168 = mul nsw i64 %167, %167
  %169 = add nsw i64 %162, %168
  %170 = getelementptr inbounds i16, i16* %0, i64 34
  %171 = load i16, i16* %170, align 2
  %172 = sext i16 %171 to i32
  %173 = ashr i32 %172, 2
  %174 = sext i32 %173 to i64
  %175 = mul nsw i64 %174, %174
  %176 = add nsw i64 %169, %175
  %177 = getelementptr inbounds i16, i16* %0, i64 37
  %178 = load i16, i16* %177, align 2
  %179 = sext i16 %178 to i32
  %180 = ashr i32 %179, 2
  %181 = sext i32 %180 to i64
  %182 = mul nsw i64 %181, %181
  %183 = add nsw i64 %176, %182
  %184 = shl i64 %183, 1
  %185 = icmp sgt i64 %184, %93
  %. = select i1 %185, i64 %184, i64 %93
  %.4 = zext i1 %185 to i16
  %186 = getelementptr inbounds i16, i16* %0, i64 2
  %187 = load i16, i16* %186, align 2
  %188 = sext i16 %187 to i32
  %189 = ashr i32 %188, 2
  %190 = sext i32 %189 to i64
  %191 = mul nsw i64 %190, %190
  %192 = getelementptr inbounds i16, i16* %0, i64 5
  %193 = load i16, i16* %192, align 2
  %194 = sext i16 %193 to i32
  %195 = ashr i32 %194, 2
  %196 = sext i32 %195 to i64
  %197 = mul nsw i64 %196, %196
  %198 = add nuw nsw i64 %197, %191
  %199 = getelementptr inbounds i16, i16* %0, i64 8
  %200 = load i16, i16* %199, align 2
  %201 = sext i16 %200 to i32
  %202 = ashr i32 %201, 2
  %203 = sext i32 %202 to i64
  %204 = mul nsw i64 %203, %203
  %205 = add nuw nsw i64 %198, %204
  %206 = getelementptr inbounds i16, i16* %0, i64 11
  %207 = load i16, i16* %206, align 2
  %208 = sext i16 %207 to i32
  %209 = ashr i32 %208, 2
  %210 = sext i32 %209 to i64
  %211 = mul nsw i64 %210, %210
  %212 = add nuw nsw i64 %205, %211
  %213 = getelementptr inbounds i16, i16* %0, i64 14
  %214 = load i16, i16* %213, align 2
  %215 = sext i16 %214 to i32
  %216 = ashr i32 %215, 2
  %217 = sext i32 %216 to i64
  %218 = mul nsw i64 %217, %217
  %219 = add nuw nsw i64 %212, %218
  %220 = getelementptr inbounds i16, i16* %0, i64 17
  %221 = load i16, i16* %220, align 2
  %222 = sext i16 %221 to i32
  %223 = ashr i32 %222, 2
  %224 = sext i32 %223 to i64
  %225 = mul nsw i64 %224, %224
  %226 = add nuw nsw i64 %219, %225
  %227 = getelementptr inbounds i16, i16* %0, i64 20
  %228 = load i16, i16* %227, align 2
  %229 = sext i16 %228 to i32
  %230 = ashr i32 %229, 2
  %231 = sext i32 %230 to i64
  %232 = mul nsw i64 %231, %231
  %233 = add nuw nsw i64 %226, %232
  %234 = getelementptr inbounds i16, i16* %0, i64 23
  %235 = load i16, i16* %234, align 2
  %236 = sext i16 %235 to i32
  %237 = ashr i32 %236, 2
  %238 = sext i32 %237 to i64
  %239 = mul nsw i64 %238, %238
  %240 = add nsw i64 %233, %239
  %241 = getelementptr inbounds i16, i16* %0, i64 26
  %242 = load i16, i16* %241, align 2
  %243 = sext i16 %242 to i32
  %244 = ashr i32 %243, 2
  %245 = sext i32 %244 to i64
  %246 = mul nsw i64 %245, %245
  %247 = add nsw i64 %240, %246
  %248 = getelementptr inbounds i16, i16* %0, i64 29
  %249 = load i16, i16* %248, align 2
  %250 = sext i16 %249 to i32
  %251 = ashr i32 %250, 2
  %252 = sext i32 %251 to i64
  %253 = mul nsw i64 %252, %252
  %254 = add nsw i64 %247, %253
  %255 = getelementptr inbounds i16, i16* %0, i64 32
  %256 = load i16, i16* %255, align 2
  %257 = sext i16 %256 to i32
  %258 = ashr i32 %257, 2
  %259 = sext i32 %258 to i64
  %260 = mul nsw i64 %259, %259
  %261 = add nsw i64 %254, %260
  %262 = getelementptr inbounds i16, i16* %0, i64 35
  %263 = load i16, i16* %262, align 2
  %264 = sext i16 %263 to i32
  %265 = ashr i32 %264, 2
  %266 = sext i32 %265 to i64
  %267 = mul nsw i64 %266, %266
  %268 = add nsw i64 %261, %267
  %269 = getelementptr inbounds i16, i16* %0, i64 38
  %270 = load i16, i16* %269, align 2
  %271 = sext i16 %270 to i32
  %272 = ashr i32 %271, 2
  %273 = sext i32 %272 to i64
  %274 = mul nsw i64 %273, %273
  %275 = add nsw i64 %268, %274
  %276 = shl i64 %275, 1
  %277 = icmp sgt i64 %276, %.
  %.12 = select i1 %277, i64 %276, i64 %.
  %.1 = select i1 %277, i16 2, i16 %.4
  %278 = getelementptr inbounds i16, i16* %0, i64 39
  %279 = load i16, i16* %278, align 2
  %280 = sext i16 %279 to i32
  %281 = ashr i32 %280, 2
  %282 = sext i32 %281 to i64
  %283 = mul nsw i64 %282, %282
  %284 = add nsw i64 %283, %86
  %285 = shl i64 %284, 1
  %286 = icmp sgt i64 %285, %.12
  %..1 = select i1 %286, i16 3, i16 %.1
  %287 = zext i16 %..1 to i64
  %288 = getelementptr inbounds i16, i16* %0, i64 %287
  %289 = load i16, i16* %288, align 2
  store i16 %289, i16* %1, align 2
  %290 = add nuw nsw i64 %287, 3
  %291 = getelementptr inbounds i16, i16* %0, i64 %290
  %292 = load i16, i16* %291, align 2
  %293 = getelementptr inbounds i16, i16* %1, i64 1
  store i16 %292, i16* %293, align 2
  %294 = add nuw nsw i64 %287, 6
  %295 = getelementptr inbounds i16, i16* %0, i64 %294
  %296 = load i16, i16* %295, align 2
  %297 = getelementptr inbounds i16, i16* %1, i64 2
  store i16 %296, i16* %297, align 2
  %298 = add nuw nsw i64 %287, 9
  %299 = getelementptr inbounds i16, i16* %0, i64 %298
  %300 = load i16, i16* %299, align 2
  %301 = getelementptr inbounds i16, i16* %1, i64 3
  store i16 %300, i16* %301, align 2
  %302 = or i64 %287, 12
  %303 = getelementptr inbounds i16, i16* %0, i64 %302
  %304 = load i16, i16* %303, align 2
  %305 = getelementptr inbounds i16, i16* %1, i64 4
  store i16 %304, i16* %305, align 2
  %306 = add nuw nsw i64 %287, 15
  %307 = getelementptr inbounds i16, i16* %0, i64 %306
  %308 = load i16, i16* %307, align 2
  %309 = getelementptr inbounds i16, i16* %1, i64 5
  store i16 %308, i16* %309, align 2
  %310 = add nuw nsw i64 %287, 18
  %311 = getelementptr inbounds i16, i16* %0, i64 %310
  %312 = load i16, i16* %311, align 2
  %313 = getelementptr inbounds i16, i16* %1, i64 6
  store i16 %312, i16* %313, align 2
  %314 = add nuw nsw i64 %287, 21
  %315 = getelementptr inbounds i16, i16* %0, i64 %314
  %316 = load i16, i16* %315, align 2
  %317 = getelementptr inbounds i16, i16* %1, i64 7
  store i16 %316, i16* %317, align 2
  %318 = or i64 %287, 24
  %319 = getelementptr inbounds i16, i16* %0, i64 %318
  %320 = load i16, i16* %319, align 2
  %321 = getelementptr inbounds i16, i16* %1, i64 8
  store i16 %320, i16* %321, align 2
  %322 = add nuw nsw i64 %287, 27
  %323 = getelementptr inbounds i16, i16* %0, i64 %322
  %324 = load i16, i16* %323, align 2
  %325 = getelementptr inbounds i16, i16* %1, i64 9
  store i16 %324, i16* %325, align 2
  %326 = add nuw nsw i64 %287, 30
  %327 = getelementptr inbounds i16, i16* %0, i64 %326
  %328 = load i16, i16* %327, align 2
  %329 = getelementptr inbounds i16, i16* %1, i64 10
  store i16 %328, i16* %329, align 2
  %330 = add nuw nsw i64 %287, 33
  %331 = getelementptr inbounds i16, i16* %0, i64 %330
  %332 = load i16, i16* %331, align 2
  %333 = getelementptr inbounds i16, i16* %1, i64 11
  store i16 %332, i16* %333, align 2
  %334 = or i64 %287, 36
  %335 = getelementptr inbounds i16, i16* %0, i64 %334
  %336 = load i16, i16* %335, align 2
  %337 = getelementptr inbounds i16, i16* %1, i64 12
  store i16 %336, i16* %337, align 2
  store i16 %..1, i16* %2, align 2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @APCM_quantization(i16* nocapture readonly, i16* nocapture, i16* nocapture, i16* nocapture, i16* nocapture) unnamed_addr #0 {
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = load i16, i16* %0, align 2
  %9 = icmp slt i16 %8, 0
  %10 = icmp eq i16 %8, -32768
  %11 = sub i16 0, %8
  %12 = select i1 %10, i16 32767, i16 %11
  %. = select i1 %9, i16 %12, i16 %8
  %13 = icmp sgt i16 %., 0
  %..01 = select i1 %13, i16 %., i16 0
  %14 = getelementptr inbounds i16, i16* %0, i64 1
  %15 = load i16, i16* %14, align 2
  %16 = icmp slt i16 %15, 0
  %17 = icmp eq i16 %15, -32768
  %18 = sub i16 0, %15
  %19 = select i1 %17, i16 32767, i16 %18
  %..1 = select i1 %16, i16 %19, i16 %15
  %20 = icmp sgt i16 %..1, %..01
  %..01.1 = select i1 %20, i16 %..1, i16 %..01
  %21 = getelementptr inbounds i16, i16* %0, i64 2
  %22 = load i16, i16* %21, align 2
  %23 = icmp slt i16 %22, 0
  %24 = icmp eq i16 %22, -32768
  %25 = sub i16 0, %22
  %26 = select i1 %24, i16 32767, i16 %25
  %..2 = select i1 %23, i16 %26, i16 %22
  %27 = icmp sgt i16 %..2, %..01.1
  %..01.2 = select i1 %27, i16 %..2, i16 %..01.1
  %28 = getelementptr inbounds i16, i16* %0, i64 3
  %29 = load i16, i16* %28, align 2
  %30 = icmp slt i16 %29, 0
  %31 = icmp eq i16 %29, -32768
  %32 = sub i16 0, %29
  %33 = select i1 %31, i16 32767, i16 %32
  %..3 = select i1 %30, i16 %33, i16 %29
  %34 = icmp sgt i16 %..3, %..01.2
  %..01.3 = select i1 %34, i16 %..3, i16 %..01.2
  %35 = getelementptr inbounds i16, i16* %0, i64 4
  %36 = load i16, i16* %35, align 2
  %37 = icmp slt i16 %36, 0
  %38 = icmp eq i16 %36, -32768
  %39 = sub i16 0, %36
  %40 = select i1 %38, i16 32767, i16 %39
  %..4 = select i1 %37, i16 %40, i16 %36
  %41 = icmp sgt i16 %..4, %..01.3
  %..01.4 = select i1 %41, i16 %..4, i16 %..01.3
  %42 = getelementptr inbounds i16, i16* %0, i64 5
  %43 = load i16, i16* %42, align 2
  %44 = icmp slt i16 %43, 0
  %45 = icmp eq i16 %43, -32768
  %46 = sub i16 0, %43
  %47 = select i1 %45, i16 32767, i16 %46
  %..5 = select i1 %44, i16 %47, i16 %43
  %48 = icmp sgt i16 %..5, %..01.4
  %..01.5 = select i1 %48, i16 %..5, i16 %..01.4
  %49 = getelementptr inbounds i16, i16* %0, i64 6
  %50 = load i16, i16* %49, align 2
  %51 = icmp slt i16 %50, 0
  %52 = icmp eq i16 %50, -32768
  %53 = sub i16 0, %50
  %54 = select i1 %52, i16 32767, i16 %53
  %..6 = select i1 %51, i16 %54, i16 %50
  %55 = icmp sgt i16 %..6, %..01.5
  %..01.6 = select i1 %55, i16 %..6, i16 %..01.5
  %56 = getelementptr inbounds i16, i16* %0, i64 7
  %57 = load i16, i16* %56, align 2
  %58 = icmp slt i16 %57, 0
  %59 = icmp eq i16 %57, -32768
  %60 = sub i16 0, %57
  %61 = select i1 %59, i16 32767, i16 %60
  %..7 = select i1 %58, i16 %61, i16 %57
  %62 = icmp sgt i16 %..7, %..01.6
  %..01.7 = select i1 %62, i16 %..7, i16 %..01.6
  %63 = getelementptr inbounds i16, i16* %0, i64 8
  %64 = load i16, i16* %63, align 2
  %65 = icmp slt i16 %64, 0
  %66 = icmp eq i16 %64, -32768
  %67 = sub i16 0, %64
  %68 = select i1 %66, i16 32767, i16 %67
  %..8 = select i1 %65, i16 %68, i16 %64
  %69 = icmp sgt i16 %..8, %..01.7
  %..01.8 = select i1 %69, i16 %..8, i16 %..01.7
  %70 = getelementptr inbounds i16, i16* %0, i64 9
  %71 = load i16, i16* %70, align 2
  %72 = icmp slt i16 %71, 0
  %73 = icmp eq i16 %71, -32768
  %74 = sub i16 0, %71
  %75 = select i1 %73, i16 32767, i16 %74
  %..9 = select i1 %72, i16 %75, i16 %71
  %76 = icmp sgt i16 %..9, %..01.8
  %..01.9 = select i1 %76, i16 %..9, i16 %..01.8
  %77 = getelementptr inbounds i16, i16* %0, i64 10
  %78 = load i16, i16* %77, align 2
  %79 = icmp slt i16 %78, 0
  %80 = icmp eq i16 %78, -32768
  %81 = sub i16 0, %78
  %82 = select i1 %80, i16 32767, i16 %81
  %..10 = select i1 %79, i16 %82, i16 %78
  %83 = icmp sgt i16 %..10, %..01.9
  %..01.10 = select i1 %83, i16 %..10, i16 %..01.9
  %84 = getelementptr inbounds i16, i16* %0, i64 11
  %85 = load i16, i16* %84, align 2
  %86 = icmp slt i16 %85, 0
  %87 = icmp eq i16 %85, -32768
  %88 = sub i16 0, %85
  %89 = select i1 %87, i16 32767, i16 %88
  %..11 = select i1 %86, i16 %89, i16 %85
  %90 = icmp sgt i16 %..11, %..01.10
  %..01.11 = select i1 %90, i16 %..11, i16 %..01.10
  %91 = getelementptr inbounds i16, i16* %0, i64 12
  %92 = load i16, i16* %91, align 2
  %93 = icmp slt i16 %92, 0
  %94 = icmp eq i16 %92, -32768
  %95 = sub i16 0, %92
  %96 = select i1 %94, i16 32767, i16 %95
  %..12 = select i1 %93, i16 %96, i16 %92
  %97 = icmp sgt i16 %..12, %..01.11
  %..01.12 = select i1 %97, i16 %..12, i16 %..01.11
  store i16 0, i16* %6, align 2
  %98 = sext i16 %..01.12 to i32
  %99 = lshr i32 %98, 9
  %100 = trunc i32 %99 to i16
  %101 = icmp slt i16 %100, 1
  %sext8 = shl i32 %99, 16
  %102 = ashr i32 %sext8, 17
  %103 = xor i1 %101, true
  %104 = zext i1 %103 to i16
  %105 = trunc i32 %102 to i16
  %106 = icmp slt i16 %105, 1
  %107 = or i1 %106, %101
  %108 = ashr i32 %sext8, 18
  %109 = xor i1 %107, true
  %110 = zext i1 %109 to i16
  %.24.1 = add nuw nsw i16 %104, %110
  %111 = trunc i32 %108 to i16
  %112 = icmp slt i16 %111, 1
  %113 = or i1 %112, %107
  %114 = ashr i32 %sext8, 19
  %115 = xor i1 %113, true
  %116 = zext i1 %115 to i16
  %.24.2 = add nuw nsw i16 %.24.1, %116
  %117 = trunc i32 %114 to i16
  %118 = icmp slt i16 %117, 1
  %119 = or i1 %118, %113
  %120 = icmp ult i16 %.24.2, 6
  br i1 %120, label %291, label %121

; <label>:121:                                    ; preds = %299, %291, %5
  tail call void @__assert_fail(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 293, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.APCM_quantization, i64 0, i64 0)) #5
  unreachable

; <label>:122:                                    ; preds = %303
  tail call void @__assert_fail(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 297, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.APCM_quantization, i64 0, i64 0)) #5
  unreachable

; <label>:123:                                    ; preds = %303
  %124 = add nuw nsw i16 %.24.5, 5
  %125 = icmp ult i16 %124, 12
  br i1 %125, label %127, label %126

; <label>:126:                                    ; preds = %123
  tail call void @__assert_fail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 300, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.APCM_quantization, i64 0, i64 0)) #5
  unreachable

; <label>:127:                                    ; preds = %123
  %128 = sext i16 %124 to i32
  %129 = ashr i32 %98, %128
  %130 = trunc i32 %129 to i16
  %131 = shl nuw nsw i16 %.24.5, 3
  %132 = tail call signext i16 @gsm_add(i16 signext %130, i16 signext %131) #6
  call fastcc void @APCM_quantization_xmaxc_to_exp_mant(i16 signext %132, i16* nonnull %6, i16* nonnull %7)
  %133 = load i16, i16* %6, align 2
  %.off = add i16 %133, 4096
  %134 = icmp ult i16 %.off, 8193
  br i1 %134, label %136, label %135

; <label>:135:                                    ; preds = %127
  tail call void @__assert_fail(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 323, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.APCM_quantization, i64 0, i64 0)) #5
  unreachable

; <label>:136:                                    ; preds = %127
  %137 = load i16, i16* %7, align 2
  %138 = icmp ult i16 %137, 8
  br i1 %138, label %140, label %139

; <label>:139:                                    ; preds = %136
  tail call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 324, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.APCM_quantization, i64 0, i64 0)) #5
  unreachable

; <label>:140:                                    ; preds = %136
  %141 = sub i16 6, %133
  %142 = sext i16 %137 to i64
  %143 = getelementptr inbounds [8 x i16], [8 x i16]* @gsm_NRFAC, i64 0, i64 %142
  %144 = load i16, i16* %143, align 2
  %145 = icmp ult i16 %141, 16
  %146 = sext i16 %141 to i32
  %147 = sext i16 %144 to i64
  br i1 %145, label %.split, label %.split17

.split:                                           ; preds = %140
  %148 = load i16, i16* %0, align 2
  %149 = sext i16 %148 to i32
  %150 = shl i32 %149, %146
  %151 = zext i32 %150 to i64
  %sext = shl i64 %151, 48
  %152 = ashr exact i64 %sext, 48
  %153 = mul nsw i64 %152, %147
  %.tr = trunc i64 %153 to i32
  %sext5 = shl i32 %.tr, 1
  %154 = ashr i32 %sext5, 28
  %155 = add nsw i32 %154, 4
  %156 = trunc i32 %155 to i16
  store i16 %156, i16* %1, align 2
  %157 = getelementptr inbounds i16, i16* %0, i64 1
  %158 = load i16, i16* %157, align 2
  %159 = sext i16 %158 to i32
  %160 = shl i32 %159, %146
  %161 = zext i32 %160 to i64
  %sext.1 = shl i64 %161, 48
  %162 = ashr exact i64 %sext.1, 48
  %163 = mul nsw i64 %162, %147
  %.tr.1 = trunc i64 %163 to i32
  %sext5.1 = shl i32 %.tr.1, 1
  %164 = ashr i32 %sext5.1, 28
  %165 = add nsw i32 %164, 4
  %166 = trunc i32 %165 to i16
  %167 = getelementptr inbounds i16, i16* %1, i64 1
  store i16 %166, i16* %167, align 2
  %168 = getelementptr inbounds i16, i16* %0, i64 2
  %169 = load i16, i16* %168, align 2
  %170 = sext i16 %169 to i32
  %171 = shl i32 %170, %146
  %172 = zext i32 %171 to i64
  %sext.2 = shl i64 %172, 48
  %173 = ashr exact i64 %sext.2, 48
  %174 = mul nsw i64 %173, %147
  %.tr.2 = trunc i64 %174 to i32
  %sext5.2 = shl i32 %.tr.2, 1
  %175 = ashr i32 %sext5.2, 28
  %176 = add nsw i32 %175, 4
  %177 = trunc i32 %176 to i16
  %178 = getelementptr inbounds i16, i16* %1, i64 2
  store i16 %177, i16* %178, align 2
  %179 = getelementptr inbounds i16, i16* %0, i64 3
  %180 = load i16, i16* %179, align 2
  %181 = sext i16 %180 to i32
  %182 = shl i32 %181, %146
  %183 = zext i32 %182 to i64
  %sext.3 = shl i64 %183, 48
  %184 = ashr exact i64 %sext.3, 48
  %185 = mul nsw i64 %184, %147
  %.tr.3 = trunc i64 %185 to i32
  %sext5.3 = shl i32 %.tr.3, 1
  %186 = ashr i32 %sext5.3, 28
  %187 = add nsw i32 %186, 4
  %188 = trunc i32 %187 to i16
  %189 = getelementptr inbounds i16, i16* %1, i64 3
  store i16 %188, i16* %189, align 2
  %190 = getelementptr inbounds i16, i16* %0, i64 4
  %191 = load i16, i16* %190, align 2
  %192 = sext i16 %191 to i32
  %193 = shl i32 %192, %146
  %194 = zext i32 %193 to i64
  %sext.4 = shl i64 %194, 48
  %195 = ashr exact i64 %sext.4, 48
  %196 = mul nsw i64 %195, %147
  %.tr.4 = trunc i64 %196 to i32
  %sext5.4 = shl i32 %.tr.4, 1
  %197 = ashr i32 %sext5.4, 28
  %198 = add nsw i32 %197, 4
  %199 = trunc i32 %198 to i16
  %200 = getelementptr inbounds i16, i16* %1, i64 4
  store i16 %199, i16* %200, align 2
  %201 = getelementptr inbounds i16, i16* %0, i64 5
  %202 = load i16, i16* %201, align 2
  %203 = sext i16 %202 to i32
  %204 = shl i32 %203, %146
  %205 = zext i32 %204 to i64
  %sext.5 = shl i64 %205, 48
  %206 = ashr exact i64 %sext.5, 48
  %207 = mul nsw i64 %206, %147
  %.tr.5 = trunc i64 %207 to i32
  %sext5.5 = shl i32 %.tr.5, 1
  %208 = ashr i32 %sext5.5, 28
  %209 = add nsw i32 %208, 4
  %210 = trunc i32 %209 to i16
  %211 = getelementptr inbounds i16, i16* %1, i64 5
  store i16 %210, i16* %211, align 2
  %212 = getelementptr inbounds i16, i16* %0, i64 6
  %213 = load i16, i16* %212, align 2
  %214 = sext i16 %213 to i32
  %215 = shl i32 %214, %146
  %216 = zext i32 %215 to i64
  %sext.6 = shl i64 %216, 48
  %217 = ashr exact i64 %sext.6, 48
  %218 = mul nsw i64 %217, %147
  %.tr.6 = trunc i64 %218 to i32
  %sext5.6 = shl i32 %.tr.6, 1
  %219 = ashr i32 %sext5.6, 28
  %220 = add nsw i32 %219, 4
  %221 = trunc i32 %220 to i16
  %222 = getelementptr inbounds i16, i16* %1, i64 6
  store i16 %221, i16* %222, align 2
  %223 = getelementptr inbounds i16, i16* %0, i64 7
  %224 = load i16, i16* %223, align 2
  %225 = sext i16 %224 to i32
  %226 = shl i32 %225, %146
  %227 = zext i32 %226 to i64
  %sext.7 = shl i64 %227, 48
  %228 = ashr exact i64 %sext.7, 48
  %229 = mul nsw i64 %228, %147
  %.tr.7 = trunc i64 %229 to i32
  %sext5.7 = shl i32 %.tr.7, 1
  %230 = ashr i32 %sext5.7, 28
  %231 = add nsw i32 %230, 4
  %232 = trunc i32 %231 to i16
  %233 = getelementptr inbounds i16, i16* %1, i64 7
  store i16 %232, i16* %233, align 2
  %234 = getelementptr inbounds i16, i16* %0, i64 8
  %235 = load i16, i16* %234, align 2
  %236 = sext i16 %235 to i32
  %237 = shl i32 %236, %146
  %238 = zext i32 %237 to i64
  %sext.8 = shl i64 %238, 48
  %239 = ashr exact i64 %sext.8, 48
  %240 = mul nsw i64 %239, %147
  %.tr.8 = trunc i64 %240 to i32
  %sext5.8 = shl i32 %.tr.8, 1
  %241 = ashr i32 %sext5.8, 28
  %242 = add nsw i32 %241, 4
  %243 = trunc i32 %242 to i16
  %244 = getelementptr inbounds i16, i16* %1, i64 8
  store i16 %243, i16* %244, align 2
  %245 = getelementptr inbounds i16, i16* %0, i64 9
  %246 = load i16, i16* %245, align 2
  %247 = sext i16 %246 to i32
  %248 = shl i32 %247, %146
  %249 = zext i32 %248 to i64
  %sext.9 = shl i64 %249, 48
  %250 = ashr exact i64 %sext.9, 48
  %251 = mul nsw i64 %250, %147
  %.tr.9 = trunc i64 %251 to i32
  %sext5.9 = shl i32 %.tr.9, 1
  %252 = ashr i32 %sext5.9, 28
  %253 = add nsw i32 %252, 4
  %254 = trunc i32 %253 to i16
  %255 = getelementptr inbounds i16, i16* %1, i64 9
  store i16 %254, i16* %255, align 2
  %256 = getelementptr inbounds i16, i16* %0, i64 10
  %257 = load i16, i16* %256, align 2
  %258 = sext i16 %257 to i32
  %259 = shl i32 %258, %146
  %260 = zext i32 %259 to i64
  %sext.10 = shl i64 %260, 48
  %261 = ashr exact i64 %sext.10, 48
  %262 = mul nsw i64 %261, %147
  %.tr.10 = trunc i64 %262 to i32
  %sext5.10 = shl i32 %.tr.10, 1
  %263 = ashr i32 %sext5.10, 28
  %264 = add nsw i32 %263, 4
  %265 = trunc i32 %264 to i16
  %266 = getelementptr inbounds i16, i16* %1, i64 10
  store i16 %265, i16* %266, align 2
  %267 = getelementptr inbounds i16, i16* %0, i64 11
  %268 = load i16, i16* %267, align 2
  %269 = sext i16 %268 to i32
  %270 = shl i32 %269, %146
  %271 = zext i32 %270 to i64
  %sext.11 = shl i64 %271, 48
  %272 = ashr exact i64 %sext.11, 48
  %273 = mul nsw i64 %272, %147
  %.tr.11 = trunc i64 %273 to i32
  %sext5.11 = shl i32 %.tr.11, 1
  %274 = ashr i32 %sext5.11, 28
  %275 = add nsw i32 %274, 4
  %276 = trunc i32 %275 to i16
  %277 = getelementptr inbounds i16, i16* %1, i64 11
  store i16 %276, i16* %277, align 2
  %278 = getelementptr inbounds i16, i16* %0, i64 12
  %279 = load i16, i16* %278, align 2
  %280 = sext i16 %279 to i32
  %281 = shl i32 %280, %146
  %282 = zext i32 %281 to i64
  %sext.12 = shl i64 %282, 48
  %283 = ashr exact i64 %sext.12, 48
  %284 = mul nsw i64 %283, %147
  %.tr.12 = trunc i64 %284 to i32
  %sext5.12 = shl i32 %.tr.12, 1
  %285 = ashr i32 %sext5.12, 28
  %286 = add nsw i32 %285, 4
  %287 = trunc i32 %286 to i16
  %288 = getelementptr inbounds i16, i16* %1, i64 12
  store i16 %287, i16* %288, align 2
  %289 = load i16, i16* %7, align 2
  store i16 %289, i16* %2, align 2
  %290 = load i16, i16* %6, align 2
  store i16 %290, i16* %3, align 2
  store i16 %132, i16* %4, align 2
  ret void

.split17:                                         ; preds = %140
  tail call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 331, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.APCM_quantization, i64 0, i64 0)) #5
  unreachable

; <label>:291:                                    ; preds = %5
  %292 = ashr i32 %sext8, 20
  %293 = xor i1 %119, true
  %294 = zext i1 %293 to i16
  %.24.3 = add nuw nsw i16 %.24.2, %294
  %295 = trunc i32 %292 to i16
  %296 = icmp slt i16 %295, 1
  %297 = or i1 %296, %119
  %298 = icmp ult i16 %.24.3, 6
  br i1 %298, label %299, label %121

; <label>:299:                                    ; preds = %291
  %300 = xor i1 %297, true
  %301 = zext i1 %300 to i16
  %.24.4 = add nuw nsw i16 %.24.3, %301
  %302 = icmp ult i16 %.24.4, 6
  br i1 %302, label %303, label %121

; <label>:303:                                    ; preds = %299
  %304 = ashr i32 %sext8, 21
  %305 = trunc i32 %304 to i16
  %306 = icmp slt i16 %305, 1
  %307 = or i1 %306, %297
  %308 = xor i1 %307, true
  %309 = zext i1 %308 to i16
  %.24.5 = add nuw nsw i16 %.24.4, %309
  store i16 %.24.5, i16* %6, align 2
  %310 = icmp ult i16 %.24.5, 7
  br i1 %310, label %123, label %122
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @APCM_inverse_quantization(i16* nocapture readonly, i16 signext, i16 signext, i16* nocapture) unnamed_addr #0 {
  %5 = icmp ult i16 %1, 8
  br i1 %5, label %7, label %6

; <label>:6:                                      ; preds = %4
  tail call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 364, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__PRETTY_FUNCTION__.APCM_inverse_quantization, i64 0, i64 0)) #5
  unreachable

; <label>:7:                                      ; preds = %4
  %8 = sext i16 %1 to i64
  %9 = getelementptr inbounds [8 x i16], [8 x i16]* @gsm_FAC, i64 0, i64 %8
  %10 = load i16, i16* %9, align 2
  %11 = tail call signext i16 @gsm_sub(i16 signext 6, i16 signext %2) #6
  %12 = tail call signext i16 @gsm_sub(i16 signext %11, i16 signext 1) #6
  %13 = sext i16 %12 to i32
  %14 = tail call signext i16 @gsm_asl(i16 signext 1, i32 %13) #6
  %15 = sext i16 %10 to i64
  %16 = shl nsw i64 %15, 33
  %17 = sext i16 %14 to i64
  %18 = sext i16 %11 to i32
  br label %19

; <label>:19:                                     ; preds = %7, %28
  %20 = phi i32 [ 12, %7 ], [ %45, %28 ]
  %.06 = phi i16* [ %0, %7 ], [ %29, %28 ]
  %.025 = phi i16* [ %3, %7 ], [ %44, %28 ]
  %21 = load i16, i16* %.06, align 2
  %22 = icmp ult i16 %21, 8
  br i1 %22, label %24, label %23

; <label>:23:                                     ; preds = %19
  tail call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 372, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__PRETTY_FUNCTION__.APCM_inverse_quantization, i64 0, i64 0)) #5
  unreachable

; <label>:24:                                     ; preds = %19
  %25 = shl i16 %21, 1
  %26 = icmp ult i16 %25, 15
  br i1 %26, label %28, label %27

; <label>:27:                                     ; preds = %24
  tail call void @__assert_fail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 376, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__PRETTY_FUNCTION__.APCM_inverse_quantization, i64 0, i64 0)) #5
  unreachable

; <label>:28:                                     ; preds = %24
  %29 = getelementptr inbounds i16, i16* %.06, i64 1
  %30 = shl i16 %21, 13
  %31 = add i16 %30, -28672
  %32 = sext i16 %31 to i64
  %33 = mul i64 %16, %32
  %34 = add i64 %33, 140737488355328
  %35 = ashr i64 %34, 48
  %36 = add nsw i64 %35, %17
  %37 = add nsw i64 %36, 32768
  %38 = icmp ugt i64 %37, 65535
  %39 = icmp sgt i64 %36, 0
  %40 = select i1 %39, i64 32767, i64 32768
  %41 = select i1 %38, i64 %40, i64 %36
  %42 = trunc i64 %41 to i16
  %43 = tail call signext i16 @gsm_asr(i16 signext %42, i32 %18) #6
  %44 = getelementptr inbounds i16, i16* %.025, i64 1
  store i16 %43, i16* %.025, align 2
  %45 = add nsw i32 %20, -1
  %46 = icmp eq i32 %20, 0
  br i1 %46, label %47, label %19

; <label>:47:                                     ; preds = %28
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @RPE_grid_positioning(i16 signext, i16* nocapture readonly, i16* nocapture) unnamed_addr #0 {
  %4 = icmp ult i16 %0, 4
  br i1 %4, label %6, label %5

; <label>:5:                                      ; preds = %3
  tail call void @__assert_fail(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 402, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__PRETTY_FUNCTION__.RPE_grid_positioning, i64 0, i64 0)) #5
  unreachable

; <label>:6:                                      ; preds = %3
  %7 = sext i16 %0 to i32
  switch i32 %7, label %.preheader [
    i32 3, label %11
    i32 2, label %13
    i32 1, label %15
    i32 0, label %.thread
  ]

.thread:                                          ; preds = %6
  %8 = load i16, i16* %1, align 2
  %9 = getelementptr inbounds i16, i16* %2, i64 1
  store i16 %8, i16* %2, align 2
  %10 = getelementptr inbounds i16, i16* %1, i64 1
  br label %13

; <label>:11:                                     ; preds = %6
  %12 = getelementptr inbounds i16, i16* %2, i64 1
  store i16 0, i16* %2, align 2
  br label %13

; <label>:13:                                     ; preds = %.thread, %6, %11, %15
  %.05 = phi i32 [ %20, %15 ], [ 13, %11 ], [ 13, %6 ], [ 12, %.thread ]
  %.13 = phi i16* [ %18, %15 ], [ %12, %11 ], [ %2, %6 ], [ %9, %.thread ]
  %.01 = phi i16* [ %19, %15 ], [ %1, %11 ], [ %1, %6 ], [ %10, %.thread ]
  %14 = getelementptr inbounds i16, i16* %.13, i64 1
  store i16 0, i16* %.13, align 2
  br label %15

; <label>:15:                                     ; preds = %6, %13
  %.16 = phi i32 [ %.05, %13 ], [ 13, %6 ]
  %.24 = phi i16* [ %14, %13 ], [ %2, %6 ]
  %.1 = phi i16* [ %.01, %13 ], [ %1, %6 ]
  %16 = getelementptr inbounds i16, i16* %.24, i64 1
  store i16 0, i16* %.24, align 2
  %17 = load i16, i16* %.1, align 2
  %18 = getelementptr inbounds i16, i16* %.24, i64 2
  store i16 %17, i16* %16, align 2
  %19 = getelementptr inbounds i16, i16* %.1, i64 1
  %20 = add nsw i32 %.16, -1
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %.preheader, label %13

.preheader:                                       ; preds = %15, %6
  %.5.ph = phi i16* [ %18, %15 ], [ %2, %6 ]
  %22 = add i16 %0, 1
  %23 = icmp slt i16 %22, 4
  br i1 %23, label %._crit_edge.loopexit, label %._crit_edge

._crit_edge.loopexit:                             ; preds = %.preheader
  %.5.ph9 = bitcast i16* %.5.ph to i8*
  %24 = sub i16 2, %0
  %25 = zext i16 %24 to i64
  %26 = shl nuw nsw i64 %25, 1
  %27 = add nuw nsw i64 %26, 2
  call void @llvm.memset.p0i8.i64(i8* %.5.ph9, i8 0, i64 %27, i32 2, i1 false)
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @Gsm_RPE_Decoding(%struct.gsm_state* nocapture readnone, i16 signext, i16 signext, i16* nocapture readonly, i16* nocapture) local_unnamed_addr #0 {
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = alloca [13 x i16], align 16
  call fastcc void @APCM_quantization_xmaxc_to_exp_mant(i16 signext %1, i16* nonnull %6, i16* nonnull %7)
  %9 = load i16, i16* %7, align 2
  %10 = load i16, i16* %6, align 2
  %11 = getelementptr inbounds [13 x i16], [13 x i16]* %8, i64 0, i64 0
  call fastcc void @APCM_inverse_quantization(i16* %3, i16 signext %9, i16 signext %10, i16* nonnull %11)
  call fastcc void @RPE_grid_positioning(i16 signext %2, i16* nonnull %11, i16* %4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @APCM_quantization_xmaxc_to_exp_mant(i16 signext, i16* nocapture, i16* nocapture) unnamed_addr #0 {
  %4 = icmp sgt i16 %0, 15
  %5 = sext i16 %0 to i32
  %6 = lshr i32 %5, 3
  %7 = add nuw nsw i32 %6, 65535
  %8 = trunc i32 %7 to i16
  %.01 = select i1 %4, i16 %8, i16 0
  %9 = shl i16 %.01, 3
  %10 = sub i16 %0, %9
  %11 = icmp eq i16 %10, 0
  br i1 %11, label %.thread11, label %.preheader

.preheader:                                       ; preds = %3
  %12 = icmp slt i16 %10, 8
  br i1 %12, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.05 = phi i16 [ %14, %.lr.ph ], [ %10, %.lr.ph.preheader ]
  %.124 = phi i16 [ %15, %.lr.ph ], [ %.01, %.lr.ph.preheader ]
  %13 = shl i16 %.05, 1
  %14 = or i16 %13, 1
  %15 = add i16 %.124, -1
  %16 = icmp slt i16 %14, 8
  br i1 %16, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader
  %.12.lcssa = phi i16 [ %.01, %.preheader ], [ %15, %.loopexit.loopexit ]
  %.0.lcssa = phi i16 [ %10, %.preheader ], [ %14, %.loopexit.loopexit ]
  %17 = add i16 %.0.lcssa, -8
  %.2.off = add i16 %.12.lcssa, 4
  %18 = icmp ult i16 %.2.off, 11
  br i1 %18, label %20, label %19

; <label>:19:                                     ; preds = %.loopexit
  tail call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 249, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.APCM_quantization_xmaxc_to_exp_mant, i64 0, i64 0)) #5
  unreachable

; <label>:20:                                     ; preds = %.loopexit
  %21 = icmp slt i16 %17, 8
  br i1 %21, label %.thread11, label %22

; <label>:22:                                     ; preds = %20
  tail call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 250, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.APCM_quantization_xmaxc_to_exp_mant, i64 0, i64 0)) #5
  unreachable

.thread11:                                        ; preds = %3, %20
  %.2913 = phi i16 [ %.12.lcssa, %20 ], [ -4, %3 ]
  %.11012 = phi i16 [ %17, %20 ], [ 7, %3 ]
  store i16 %.2913, i16* %1, align 2
  store i16 %.11012, i16* %2, align 2
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #2

declare signext i16 @gsm_add(i16 signext, i16 signext) local_unnamed_addr #3

declare signext i16 @gsm_sub(i16 signext, i16 signext) local_unnamed_addr #3

declare signext i16 @gsm_asl(i16 signext, i32) local_unnamed_addr #3

declare signext i16 @gsm_asr(i16 signext, i32) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
