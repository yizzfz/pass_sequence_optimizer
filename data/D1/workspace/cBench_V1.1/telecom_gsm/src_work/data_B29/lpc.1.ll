; ModuleID = 'lpc.ll'
source_filename = "lpc.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

@.str = private unnamed_addr constant [9 x i8] c"smax > 0\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"lpc.c\00", align 1
@__PRETTY_FUNCTION__.Autocorrelation = private unnamed_addr constant [41 x i8] c"void Autocorrelation(word *, longword *)\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"scalauto <= 4\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"L_ACF[0] != 0\00", align 1
@__PRETTY_FUNCTION__.Reflection_coefficients = private unnamed_addr constant [49 x i8] c"void Reflection_coefficients(longword *, word *)\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"temp >= 0 && temp < 32\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"*r >= 0\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"*r != MIN_WORD\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"temp >= 0\00", align 1
@__PRETTY_FUNCTION__.Transformation_to_Log_Area_Ratios = private unnamed_addr constant [47 x i8] c"void Transformation_to_Log_Area_Ratios(word *)\00", align 1
@.str.8 = private unnamed_addr constant [14 x i8] c"temp >= 11059\00", align 1
@.str.9 = private unnamed_addr constant [14 x i8] c"temp >= 26112\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @Gsm_LPC_Analysis(%struct.gsm_state* nocapture readnone, i16*, i16* nocapture) local_unnamed_addr #0 {
  %4 = alloca [9 x i64], align 16
  %5 = getelementptr inbounds [9 x i64], [9 x i64]* %4, i64 0, i64 0
  call fastcc void @Autocorrelation(i16* %1, i64* nonnull %5)
  call fastcc void @Reflection_coefficients(i64* nonnull %5, i16* %2)
  call fastcc void @Transformation_to_Log_Area_Ratios(i16* %2)
  call fastcc void @Quantization_and_coding(i16* %2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @Autocorrelation(i16*, i64*) unnamed_addr #0 {
  br label %3

; <label>:3:                                      ; preds = %399, %2
  %indvars.iv39 = phi i64 [ 0, %2 ], [ %indvars.iv.next40.1, %399 ]
  %.0424 = phi i16 [ 0, %2 ], [ %..04.1, %399 ]
  %4 = getelementptr inbounds i16, i16* %0, i64 %indvars.iv39
  %5 = load i16, i16* %4, align 2
  %6 = icmp slt i16 %5, 0
  br i1 %6, label %7, label %10

; <label>:7:                                      ; preds = %3
  %8 = icmp eq i16 %5, -32768
  %9 = sub i16 0, %5
  %. = select i1 %8, i16 32767, i16 %9
  br label %10

; <label>:10:                                     ; preds = %7, %3
  %11 = phi i16 [ %5, %3 ], [ %., %7 ]
  %12 = icmp sgt i16 %11, %.0424
  %..04 = select i1 %12, i16 %11, i16 %.0424
  %indvars.iv.next40 = or i64 %indvars.iv39, 1
  %13 = getelementptr inbounds i16, i16* %0, i64 %indvars.iv.next40
  %14 = load i16, i16* %13, align 2
  %15 = icmp slt i16 %14, 0
  br i1 %15, label %396, label %399

; <label>:16:                                     ; preds = %399
  %17 = bitcast i64* %1 to i8*
  %18 = icmp eq i16 %..04.1, 0
  br i1 %18, label %.loopexit42, label %19

; <label>:19:                                     ; preds = %16
  %20 = icmp sgt i16 %..04.1, 0
  br i1 %20, label %22, label %21

; <label>:21:                                     ; preds = %19
  tail call void @__assert_fail(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 57, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__PRETTY_FUNCTION__.Autocorrelation, i64 0, i64 0)) #5
  unreachable

; <label>:22:                                     ; preds = %19
  %23 = sext i16 %..04.1 to i64
  %24 = shl nsw i64 %23, 16
  %25 = tail call signext i16 @gsm_norm(i64 %24) #6
  %26 = sub i16 4, %25
  %27 = icmp sgt i16 %26, 0
  br i1 %27, label %28, label %.loopexit42

; <label>:28:                                     ; preds = %22
  %29 = sext i16 %26 to i32
  switch i32 %29, label %.loopexit42 [
    i32 1, label %.preheader9.preheader
    i32 2, label %.preheader10.preheader
    i32 3, label %.preheader12.preheader
    i32 4, label %.preheader14.preheader
  ]

.preheader14.preheader:                           ; preds = %28
  br label %.preheader14

.preheader12.preheader:                           ; preds = %28
  br label %.preheader12

.preheader10.preheader:                           ; preds = %28
  br label %.preheader10

.preheader9.preheader:                            ; preds = %28
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.preheader, %.preheader9
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader9 ], [ 0, %.preheader9.preheader ]
  %30 = getelementptr inbounds i16, i16* %0, i64 %indvars.iv
  %31 = load i16, i16* %30, align 2
  %32 = sext i16 %31 to i64
  %33 = shl nsw i64 %32, 14
  %34 = add nsw i64 %33, 16384
  %35 = lshr i64 %34, 15
  %36 = trunc i64 %35 to i16
  store i16 %36, i16* %30, align 2
  %indvars.iv.next = or i64 %indvars.iv, 1
  %37 = getelementptr inbounds i16, i16* %0, i64 %indvars.iv.next
  %38 = load i16, i16* %37, align 2
  %39 = sext i16 %38 to i64
  %40 = shl nsw i64 %39, 14
  %41 = add nsw i64 %40, 16384
  %42 = lshr i64 %41, 15
  %43 = trunc i64 %42 to i16
  store i16 %43, i16* %37, align 2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond29.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond29.1, label %.loopexit42.loopexit, label %.preheader9

.preheader10:                                     ; preds = %.preheader10.preheader, %.preheader10
  %indvars.iv30 = phi i64 [ %indvars.iv.next31.1, %.preheader10 ], [ 0, %.preheader10.preheader ]
  %44 = getelementptr inbounds i16, i16* %0, i64 %indvars.iv30
  %45 = load i16, i16* %44, align 2
  %46 = sext i16 %45 to i64
  %47 = shl nsw i64 %46, 13
  %48 = add nsw i64 %47, 16384
  %49 = lshr i64 %48, 15
  %50 = trunc i64 %49 to i16
  store i16 %50, i16* %44, align 2
  %indvars.iv.next31 = or i64 %indvars.iv30, 1
  %51 = getelementptr inbounds i16, i16* %0, i64 %indvars.iv.next31
  %52 = load i16, i16* %51, align 2
  %53 = sext i16 %52 to i64
  %54 = shl nsw i64 %53, 13
  %55 = add nsw i64 %54, 16384
  %56 = lshr i64 %55, 15
  %57 = trunc i64 %56 to i16
  store i16 %57, i16* %51, align 2
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next31.1, 160
  br i1 %exitcond32.1, label %.loopexit42.loopexit49, label %.preheader10

.preheader12:                                     ; preds = %.preheader12.preheader, %.preheader12
  %indvars.iv33 = phi i64 [ %indvars.iv.next34.1, %.preheader12 ], [ 0, %.preheader12.preheader ]
  %58 = getelementptr inbounds i16, i16* %0, i64 %indvars.iv33
  %59 = load i16, i16* %58, align 2
  %60 = sext i16 %59 to i64
  %61 = shl nsw i64 %60, 12
  %62 = add nsw i64 %61, 16384
  %63 = lshr i64 %62, 15
  %64 = trunc i64 %63 to i16
  store i16 %64, i16* %58, align 2
  %indvars.iv.next34 = or i64 %indvars.iv33, 1
  %65 = getelementptr inbounds i16, i16* %0, i64 %indvars.iv.next34
  %66 = load i16, i16* %65, align 2
  %67 = sext i16 %66 to i64
  %68 = shl nsw i64 %67, 12
  %69 = add nsw i64 %68, 16384
  %70 = lshr i64 %69, 15
  %71 = trunc i64 %70 to i16
  store i16 %71, i16* %65, align 2
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv33, 2
  %exitcond35.1 = icmp eq i64 %indvars.iv.next34.1, 160
  br i1 %exitcond35.1, label %.loopexit42.loopexit50, label %.preheader12

.preheader14:                                     ; preds = %.preheader14.preheader, %.preheader14
  %indvars.iv36 = phi i64 [ %indvars.iv.next37.1, %.preheader14 ], [ 0, %.preheader14.preheader ]
  %72 = getelementptr inbounds i16, i16* %0, i64 %indvars.iv36
  %73 = load i16, i16* %72, align 2
  %74 = sext i16 %73 to i64
  %75 = shl nsw i64 %74, 11
  %76 = add nsw i64 %75, 16384
  %77 = lshr i64 %76, 15
  %78 = trunc i64 %77 to i16
  store i16 %78, i16* %72, align 2
  %indvars.iv.next37 = or i64 %indvars.iv36, 1
  %79 = getelementptr inbounds i16, i16* %0, i64 %indvars.iv.next37
  %80 = load i16, i16* %79, align 2
  %81 = sext i16 %80 to i64
  %82 = shl nsw i64 %81, 11
  %83 = add nsw i64 %82, 16384
  %84 = lshr i64 %83, 15
  %85 = trunc i64 %84 to i16
  store i16 %85, i16* %79, align 2
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, 2
  %exitcond38.1 = icmp eq i64 %indvars.iv.next37.1, 160
  br i1 %exitcond38.1, label %.loopexit42.loopexit51, label %.preheader14

.loopexit42.loopexit:                             ; preds = %.preheader9
  br label %.loopexit42

.loopexit42.loopexit49:                           ; preds = %.preheader10
  br label %.loopexit42

.loopexit42.loopexit50:                           ; preds = %.preheader12
  br label %.loopexit42

.loopexit42.loopexit51:                           ; preds = %.preheader14
  br label %.loopexit42

.loopexit42:                                      ; preds = %.loopexit42.loopexit51, %.loopexit42.loopexit50, %.loopexit42.loopexit49, %.loopexit42.loopexit, %22, %28, %16
  %86 = phi i1 [ true, %28 ], [ false, %22 ], [ false, %16 ], [ %27, %.loopexit42.loopexit ], [ %27, %.loopexit42.loopexit49 ], [ %27, %.loopexit42.loopexit50 ], [ %27, %.loopexit42.loopexit51 ]
  %.067 = phi i16 [ %26, %28 ], [ %26, %22 ], [ 0, %16 ], [ %26, %.loopexit42.loopexit ], [ %26, %.loopexit42.loopexit49 ], [ %26, %.loopexit42.loopexit50 ], [ %26, %.loopexit42.loopexit51 ]
  %87 = load i16, i16* %0, align 2
  call void @llvm.memset.p0i8.i64(i8* %17, i8 0, i64 72, i32 8, i1 false)
  %88 = sext i16 %87 to i64
  %89 = load i16, i16* %0, align 2
  %90 = sext i16 %89 to i64
  %91 = mul nsw i64 %90, %88
  %92 = load i64, i64* %1, align 8
  %93 = add nsw i64 %91, %92
  store i64 %93, i64* %1, align 8
  %94 = getelementptr inbounds i16, i16* %0, i64 1
  %95 = load i16, i16* %94, align 2
  %96 = sext i16 %95 to i64
  %97 = mul nsw i64 %96, %96
  %98 = add nsw i64 %97, %93
  store i64 %98, i64* %1, align 8
  %99 = load i16, i16* %0, align 2
  %100 = sext i16 %99 to i64
  %101 = mul nsw i64 %100, %96
  %102 = getelementptr inbounds i64, i64* %1, i64 1
  %103 = load i64, i64* %102, align 8
  %104 = add nsw i64 %101, %103
  store i64 %104, i64* %102, align 8
  %105 = getelementptr inbounds i16, i16* %0, i64 2
  %106 = load i16, i16* %105, align 2
  %107 = sext i16 %106 to i64
  %108 = mul nsw i64 %107, %107
  %109 = load i64, i64* %1, align 8
  %110 = add nsw i64 %108, %109
  store i64 %110, i64* %1, align 8
  %111 = load i16, i16* %94, align 2
  %112 = sext i16 %111 to i64
  %113 = mul nsw i64 %112, %107
  %114 = load i64, i64* %102, align 8
  %115 = add nsw i64 %113, %114
  store i64 %115, i64* %102, align 8
  %116 = load i16, i16* %0, align 2
  %117 = sext i16 %116 to i64
  %118 = mul nsw i64 %117, %107
  %119 = getelementptr inbounds i64, i64* %1, i64 2
  %120 = load i64, i64* %119, align 8
  %121 = add nsw i64 %118, %120
  store i64 %121, i64* %119, align 8
  %122 = getelementptr inbounds i16, i16* %0, i64 3
  %123 = load i16, i16* %122, align 2
  %124 = sext i16 %123 to i64
  %125 = mul nsw i64 %124, %124
  %126 = load i64, i64* %1, align 8
  %127 = add nsw i64 %125, %126
  store i64 %127, i64* %1, align 8
  %128 = load i16, i16* %105, align 2
  %129 = sext i16 %128 to i64
  %130 = mul nsw i64 %129, %124
  %131 = load i64, i64* %102, align 8
  %132 = add nsw i64 %130, %131
  store i64 %132, i64* %102, align 8
  %133 = load i16, i16* %94, align 2
  %134 = sext i16 %133 to i64
  %135 = mul nsw i64 %134, %124
  %136 = load i64, i64* %119, align 8
  %137 = add nsw i64 %135, %136
  store i64 %137, i64* %119, align 8
  %138 = load i16, i16* %0, align 2
  %139 = sext i16 %138 to i64
  %140 = mul nsw i64 %139, %124
  %141 = getelementptr inbounds i64, i64* %1, i64 3
  %142 = load i64, i64* %141, align 8
  %143 = add nsw i64 %140, %142
  store i64 %143, i64* %141, align 8
  %144 = getelementptr inbounds i16, i16* %0, i64 4
  %145 = load i16, i16* %144, align 2
  %146 = sext i16 %145 to i64
  %147 = mul nsw i64 %146, %146
  %148 = load i64, i64* %1, align 8
  %149 = add nsw i64 %147, %148
  store i64 %149, i64* %1, align 8
  %150 = load i16, i16* %122, align 2
  %151 = sext i16 %150 to i64
  %152 = mul nsw i64 %151, %146
  %153 = load i64, i64* %102, align 8
  %154 = add nsw i64 %152, %153
  store i64 %154, i64* %102, align 8
  %155 = load i16, i16* %105, align 2
  %156 = sext i16 %155 to i64
  %157 = mul nsw i64 %156, %146
  %158 = load i64, i64* %119, align 8
  %159 = add nsw i64 %157, %158
  store i64 %159, i64* %119, align 8
  %160 = load i16, i16* %94, align 2
  %161 = sext i16 %160 to i64
  %162 = mul nsw i64 %161, %146
  %163 = load i64, i64* %141, align 8
  %164 = add nsw i64 %162, %163
  store i64 %164, i64* %141, align 8
  %165 = load i16, i16* %0, align 2
  %166 = sext i16 %165 to i64
  %167 = mul nsw i64 %166, %146
  %168 = getelementptr inbounds i64, i64* %1, i64 4
  %169 = load i64, i64* %168, align 8
  %170 = add nsw i64 %167, %169
  store i64 %170, i64* %168, align 8
  %171 = getelementptr inbounds i16, i16* %0, i64 5
  %172 = load i16, i16* %171, align 2
  %173 = sext i16 %172 to i64
  %174 = mul nsw i64 %173, %173
  %175 = load i64, i64* %1, align 8
  %176 = add nsw i64 %174, %175
  store i64 %176, i64* %1, align 8
  %177 = load i16, i16* %144, align 2
  %178 = sext i16 %177 to i64
  %179 = mul nsw i64 %178, %173
  %180 = load i64, i64* %102, align 8
  %181 = add nsw i64 %179, %180
  store i64 %181, i64* %102, align 8
  %182 = load i16, i16* %122, align 2
  %183 = sext i16 %182 to i64
  %184 = mul nsw i64 %183, %173
  %185 = load i64, i64* %119, align 8
  %186 = add nsw i64 %184, %185
  store i64 %186, i64* %119, align 8
  %187 = load i16, i16* %105, align 2
  %188 = sext i16 %187 to i64
  %189 = mul nsw i64 %188, %173
  %190 = load i64, i64* %141, align 8
  %191 = add nsw i64 %189, %190
  store i64 %191, i64* %141, align 8
  %192 = load i16, i16* %94, align 2
  %193 = sext i16 %192 to i64
  %194 = mul nsw i64 %193, %173
  %195 = load i64, i64* %168, align 8
  %196 = add nsw i64 %194, %195
  store i64 %196, i64* %168, align 8
  %197 = load i16, i16* %0, align 2
  %198 = sext i16 %197 to i64
  %199 = mul nsw i64 %198, %173
  %200 = getelementptr inbounds i64, i64* %1, i64 5
  %201 = load i64, i64* %200, align 8
  %202 = add nsw i64 %199, %201
  store i64 %202, i64* %200, align 8
  %203 = getelementptr inbounds i16, i16* %0, i64 6
  %204 = load i16, i16* %203, align 2
  %205 = sext i16 %204 to i64
  %206 = mul nsw i64 %205, %205
  %207 = load i64, i64* %1, align 8
  %208 = add nsw i64 %206, %207
  store i64 %208, i64* %1, align 8
  %209 = load i16, i16* %171, align 2
  %210 = sext i16 %209 to i64
  %211 = mul nsw i64 %210, %205
  %212 = load i64, i64* %102, align 8
  %213 = add nsw i64 %211, %212
  store i64 %213, i64* %102, align 8
  %214 = load i16, i16* %144, align 2
  %215 = sext i16 %214 to i64
  %216 = mul nsw i64 %215, %205
  %217 = load i64, i64* %119, align 8
  %218 = add nsw i64 %216, %217
  store i64 %218, i64* %119, align 8
  %219 = load i16, i16* %122, align 2
  %220 = sext i16 %219 to i64
  %221 = mul nsw i64 %220, %205
  %222 = load i64, i64* %141, align 8
  %223 = add nsw i64 %221, %222
  store i64 %223, i64* %141, align 8
  %224 = load i16, i16* %105, align 2
  %225 = sext i16 %224 to i64
  %226 = mul nsw i64 %225, %205
  %227 = load i64, i64* %168, align 8
  %228 = add nsw i64 %226, %227
  store i64 %228, i64* %168, align 8
  %229 = load i16, i16* %94, align 2
  %230 = sext i16 %229 to i64
  %231 = mul nsw i64 %230, %205
  %232 = load i64, i64* %200, align 8
  %233 = add nsw i64 %231, %232
  store i64 %233, i64* %200, align 8
  %234 = load i16, i16* %0, align 2
  %235 = sext i16 %234 to i64
  %236 = mul nsw i64 %235, %205
  %237 = getelementptr inbounds i64, i64* %1, i64 6
  %238 = load i64, i64* %237, align 8
  %239 = add nsw i64 %236, %238
  store i64 %239, i64* %237, align 8
  %240 = getelementptr inbounds i16, i16* %0, i64 7
  %241 = load i16, i16* %240, align 2
  %242 = sext i16 %241 to i64
  %243 = mul nsw i64 %242, %242
  %244 = load i64, i64* %1, align 8
  %245 = add nsw i64 %243, %244
  store i64 %245, i64* %1, align 8
  %246 = load i16, i16* %203, align 2
  %247 = sext i16 %246 to i64
  %248 = mul nsw i64 %247, %242
  %249 = load i64, i64* %102, align 8
  %250 = add nsw i64 %248, %249
  store i64 %250, i64* %102, align 8
  %251 = load i16, i16* %171, align 2
  %252 = sext i16 %251 to i64
  %253 = mul nsw i64 %252, %242
  %254 = load i64, i64* %119, align 8
  %255 = add nsw i64 %253, %254
  store i64 %255, i64* %119, align 8
  %256 = load i16, i16* %144, align 2
  %257 = sext i16 %256 to i64
  %258 = mul nsw i64 %257, %242
  %259 = load i64, i64* %141, align 8
  %260 = add nsw i64 %258, %259
  store i64 %260, i64* %141, align 8
  %261 = load i16, i16* %122, align 2
  %262 = sext i16 %261 to i64
  %263 = mul nsw i64 %262, %242
  %264 = load i64, i64* %168, align 8
  %265 = add nsw i64 %263, %264
  store i64 %265, i64* %168, align 8
  %266 = load i16, i16* %105, align 2
  %267 = sext i16 %266 to i64
  %268 = mul nsw i64 %267, %242
  %269 = load i64, i64* %200, align 8
  %270 = add nsw i64 %268, %269
  store i64 %270, i64* %200, align 8
  %271 = load i16, i16* %94, align 2
  %272 = sext i16 %271 to i64
  %273 = mul nsw i64 %272, %242
  %274 = load i64, i64* %237, align 8
  %275 = add nsw i64 %273, %274
  store i64 %275, i64* %237, align 8
  %276 = load i16, i16* %0, align 2
  %277 = sext i16 %276 to i64
  %278 = mul nsw i64 %277, %242
  %279 = getelementptr inbounds i64, i64* %1, i64 7
  %280 = load i64, i64* %279, align 8
  %281 = add nsw i64 %278, %280
  store i64 %281, i64* %279, align 8
  %282 = getelementptr inbounds i64, i64* %1, i64 8
  br label %283

; <label>:283:                                    ; preds = %283, %.loopexit42
  %.0219 = phi i32 [ 8, %.loopexit42 ], [ %337, %283 ]
  %.0318 = phi i16* [ %240, %.loopexit42 ], [ %284, %283 ]
  %284 = getelementptr inbounds i16, i16* %.0318, i64 1
  %285 = load i16, i16* %284, align 2
  %286 = sext i16 %285 to i64
  %287 = mul nsw i64 %286, %286
  %288 = load i64, i64* %1, align 8
  %289 = add nsw i64 %287, %288
  store i64 %289, i64* %1, align 8
  %290 = load i16, i16* %.0318, align 2
  %291 = sext i16 %290 to i64
  %292 = mul nsw i64 %291, %286
  %293 = load i64, i64* %102, align 8
  %294 = add nsw i64 %292, %293
  store i64 %294, i64* %102, align 8
  %295 = getelementptr inbounds i16, i16* %.0318, i64 -1
  %296 = load i16, i16* %295, align 2
  %297 = sext i16 %296 to i64
  %298 = mul nsw i64 %297, %286
  %299 = load i64, i64* %119, align 8
  %300 = add nsw i64 %298, %299
  store i64 %300, i64* %119, align 8
  %301 = getelementptr inbounds i16, i16* %.0318, i64 -2
  %302 = load i16, i16* %301, align 2
  %303 = sext i16 %302 to i64
  %304 = mul nsw i64 %303, %286
  %305 = load i64, i64* %141, align 8
  %306 = add nsw i64 %304, %305
  store i64 %306, i64* %141, align 8
  %307 = getelementptr inbounds i16, i16* %.0318, i64 -3
  %308 = load i16, i16* %307, align 2
  %309 = sext i16 %308 to i64
  %310 = mul nsw i64 %309, %286
  %311 = load i64, i64* %168, align 8
  %312 = add nsw i64 %310, %311
  store i64 %312, i64* %168, align 8
  %313 = getelementptr inbounds i16, i16* %.0318, i64 -4
  %314 = load i16, i16* %313, align 2
  %315 = sext i16 %314 to i64
  %316 = mul nsw i64 %315, %286
  %317 = load i64, i64* %200, align 8
  %318 = add nsw i64 %316, %317
  store i64 %318, i64* %200, align 8
  %319 = getelementptr inbounds i16, i16* %.0318, i64 -5
  %320 = load i16, i16* %319, align 2
  %321 = sext i16 %320 to i64
  %322 = mul nsw i64 %321, %286
  %323 = load i64, i64* %237, align 8
  %324 = add nsw i64 %322, %323
  store i64 %324, i64* %237, align 8
  %325 = getelementptr inbounds i16, i16* %.0318, i64 -6
  %326 = load i16, i16* %325, align 2
  %327 = sext i16 %326 to i64
  %328 = mul nsw i64 %327, %286
  %329 = load i64, i64* %279, align 8
  %330 = add nsw i64 %328, %329
  store i64 %330, i64* %279, align 8
  %331 = getelementptr inbounds i16, i16* %.0318, i64 -7
  %332 = load i16, i16* %331, align 2
  %333 = sext i16 %332 to i64
  %334 = mul nsw i64 %333, %286
  %335 = load i64, i64* %282, align 8
  %336 = add nsw i64 %334, %335
  store i64 %336, i64* %282, align 8
  %337 = add nuw nsw i32 %.0219, 1
  %exitcond = icmp eq i32 %337, 160
  br i1 %exitcond, label %.preheader8, label %283

.preheader8:                                      ; preds = %283
  %338 = getelementptr inbounds i64, i64* %1, i64 8
  %339 = load i64, i64* %338, align 8
  %340 = shl i64 %339, 1
  store i64 %340, i64* %338, align 8
  %341 = getelementptr inbounds i64, i64* %1, i64 7
  %342 = load i64, i64* %341, align 8
  %343 = shl i64 %342, 1
  store i64 %343, i64* %341, align 8
  %344 = getelementptr inbounds i64, i64* %1, i64 6
  %345 = load i64, i64* %344, align 8
  %346 = shl i64 %345, 1
  store i64 %346, i64* %344, align 8
  %347 = getelementptr inbounds i64, i64* %1, i64 5
  %348 = load i64, i64* %347, align 8
  %349 = shl i64 %348, 1
  store i64 %349, i64* %347, align 8
  %350 = getelementptr inbounds i64, i64* %1, i64 4
  %351 = load i64, i64* %350, align 8
  %352 = shl i64 %351, 1
  store i64 %352, i64* %350, align 8
  %353 = getelementptr inbounds i64, i64* %1, i64 3
  %354 = load i64, i64* %353, align 8
  %355 = shl i64 %354, 1
  store i64 %355, i64* %353, align 8
  %356 = getelementptr inbounds i64, i64* %1, i64 2
  %357 = load i64, i64* %356, align 8
  %358 = shl i64 %357, 1
  store i64 %358, i64* %356, align 8
  %359 = getelementptr inbounds i64, i64* %1, i64 1
  %360 = load i64, i64* %359, align 8
  %361 = shl i64 %360, 1
  store i64 %361, i64* %359, align 8
  %362 = load i64, i64* %1, align 8
  %363 = shl i64 %362, 1
  store i64 %363, i64* %1, align 8
  br i1 %86, label %364, label %.loopexit

; <label>:364:                                    ; preds = %.preheader8
  %365 = icmp slt i16 %.067, 5
  br i1 %365, label %.preheader, label %367

.preheader:                                       ; preds = %364
  %366 = sext i16 %.067 to i32
  br label %368

; <label>:367:                                    ; preds = %364
  tail call void @__assert_fail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 142, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__PRETTY_FUNCTION__.Autocorrelation, i64 0, i64 0)) #5
  unreachable

; <label>:368:                                    ; preds = %368, %.preheader
  %.017 = phi i16* [ %0, %.preheader ], [ %390, %368 ]
  %.716 = phi i32 [ 160, %.preheader ], [ %389, %368 ]
  %369 = getelementptr inbounds i16, i16* %.017, i64 1
  %370 = load i16, i16* %.017, align 2
  %371 = sext i16 %370 to i32
  %372 = shl i32 %371, %366
  %373 = trunc i32 %372 to i16
  store i16 %373, i16* %.017, align 2
  %374 = getelementptr inbounds i16, i16* %.017, i64 2
  %375 = load i16, i16* %369, align 2
  %376 = sext i16 %375 to i32
  %377 = shl i32 %376, %366
  %378 = trunc i32 %377 to i16
  store i16 %378, i16* %369, align 2
  %379 = getelementptr inbounds i16, i16* %.017, i64 3
  %380 = load i16, i16* %374, align 2
  %381 = sext i16 %380 to i32
  %382 = shl i32 %381, %366
  %383 = trunc i32 %382 to i16
  store i16 %383, i16* %374, align 2
  %384 = getelementptr inbounds i16, i16* %.017, i64 4
  %385 = load i16, i16* %379, align 2
  %386 = sext i16 %385 to i32
  %387 = shl i32 %386, %366
  %388 = trunc i32 %387 to i16
  store i16 %388, i16* %379, align 2
  %389 = add nsw i32 %.716, -5
  %390 = getelementptr inbounds i16, i16* %.017, i64 5
  %391 = load i16, i16* %384, align 2
  %392 = sext i16 %391 to i32
  %393 = shl i32 %392, %366
  %394 = trunc i32 %393 to i16
  store i16 %394, i16* %384, align 2
  %395 = icmp eq i32 %389, 0
  br i1 %395, label %.loopexit.loopexit, label %368

.loopexit.loopexit:                               ; preds = %368
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader8
  ret void

; <label>:396:                                    ; preds = %10
  %397 = icmp eq i16 %14, -32768
  %398 = sub i16 0, %14
  %..1 = select i1 %397, i16 32767, i16 %398
  br label %399

; <label>:399:                                    ; preds = %396, %10
  %400 = phi i16 [ %14, %10 ], [ %..1, %396 ]
  %401 = icmp sgt i16 %400, %..04
  %..04.1 = select i1 %401, i16 %400, i16 %..04
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv39, 2
  %exitcond41.1 = icmp eq i64 %indvars.iv.next40.1, 160
  br i1 %exitcond41.1, label %16, label %3
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @Reflection_coefficients(i64* nocapture readonly, i16* nocapture) unnamed_addr #0 {
  %3 = alloca [9 x i16], align 16
  %4 = bitcast [9 x i16]* %3 to i8*
  %5 = alloca [9 x i16], align 16
  %6 = bitcast [9 x i16]* %5 to i8*
  %7 = alloca [9 x i16], align 16
  %8 = load i64, i64* %0, align 8
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %.loopexit.loopexit, label %10

; <label>:10:                                     ; preds = %2
  %11 = tail call signext i16 @gsm_norm(i64 %8) #6
  %12 = icmp ult i16 %11, 32
  br i1 %12, label %.preheader8, label %13

; <label>:13:                                     ; preds = %10
  tail call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 200, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__PRETTY_FUNCTION__.Reflection_coefficients, i64 0, i64 0)) #5
  unreachable

.preheader8:                                      ; preds = %10
  %14 = sext i16 %11 to i64
  %15 = and i64 %14, 4294967295
  %16 = load i64, i64* %0, align 8
  %17 = shl i64 %16, %15
  %18 = lshr i64 %17, 16
  %19 = trunc i64 %18 to i16
  %20 = getelementptr inbounds [9 x i16], [9 x i16]* %3, i64 0, i64 0
  store i16 %19, i16* %20, align 16
  %21 = getelementptr inbounds i64, i64* %0, i64 1
  %22 = load i64, i64* %21, align 8
  %23 = shl i64 %22, %15
  %24 = lshr i64 %23, 16
  %25 = trunc i64 %24 to i16
  %26 = getelementptr inbounds [9 x i16], [9 x i16]* %3, i64 0, i64 1
  store i16 %25, i16* %26, align 2
  %27 = getelementptr inbounds i64, i64* %0, i64 2
  %28 = load i64, i64* %27, align 8
  %29 = shl i64 %28, %15
  %30 = lshr i64 %29, 16
  %31 = trunc i64 %30 to i16
  %32 = getelementptr inbounds [9 x i16], [9 x i16]* %3, i64 0, i64 2
  store i16 %31, i16* %32, align 4
  %33 = getelementptr inbounds i64, i64* %0, i64 3
  %34 = load i64, i64* %33, align 8
  %35 = shl i64 %34, %15
  %36 = lshr i64 %35, 16
  %37 = trunc i64 %36 to i16
  %38 = getelementptr inbounds [9 x i16], [9 x i16]* %3, i64 0, i64 3
  store i16 %37, i16* %38, align 2
  %39 = getelementptr inbounds i64, i64* %0, i64 4
  %40 = load i64, i64* %39, align 8
  %41 = shl i64 %40, %15
  %42 = lshr i64 %41, 16
  %43 = trunc i64 %42 to i16
  %44 = getelementptr inbounds [9 x i16], [9 x i16]* %3, i64 0, i64 4
  store i16 %43, i16* %44, align 8
  %45 = getelementptr inbounds i64, i64* %0, i64 5
  %46 = load i64, i64* %45, align 8
  %47 = shl i64 %46, %15
  %48 = lshr i64 %47, 16
  %49 = trunc i64 %48 to i16
  %50 = getelementptr inbounds [9 x i16], [9 x i16]* %3, i64 0, i64 5
  store i16 %49, i16* %50, align 2
  %51 = getelementptr inbounds i64, i64* %0, i64 6
  %52 = load i64, i64* %51, align 8
  %53 = shl i64 %52, %15
  %54 = lshr i64 %53, 16
  %55 = trunc i64 %54 to i16
  %56 = getelementptr inbounds [9 x i16], [9 x i16]* %3, i64 0, i64 6
  store i16 %55, i16* %56, align 4
  %57 = getelementptr inbounds i64, i64* %0, i64 7
  %58 = load i64, i64* %57, align 8
  %59 = shl i64 %58, %15
  %60 = lshr i64 %59, 16
  %61 = trunc i64 %60 to i16
  %62 = getelementptr inbounds [9 x i16], [9 x i16]* %3, i64 0, i64 7
  store i16 %61, i16* %62, align 2
  %63 = getelementptr inbounds i64, i64* %0, i64 8
  %64 = load i64, i64* %63, align 8
  %65 = shl i64 %64, %15
  %66 = lshr i64 %65, 16
  %67 = trunc i64 %66 to i16
  %68 = getelementptr inbounds [9 x i16], [9 x i16]* %3, i64 0, i64 8
  store i16 %67, i16* %68, align 16
  %scevgep = getelementptr inbounds [9 x i16], [9 x i16]* %7, i64 0, i64 1
  %scevgep49 = bitcast i16* %scevgep to i8*
  %scevgep50 = getelementptr inbounds [9 x i16], [9 x i16]* %3, i64 0, i64 1
  %scevgep5051 = bitcast i16* %scevgep50 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep49, i8* %scevgep5051, i64 14, i32 2, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %6, i8* nonnull %4, i64 18, i32 16, i1 false)
  %69 = getelementptr inbounds [9 x i16], [9 x i16]* %5, i64 0, i64 1
  %70 = getelementptr inbounds [9 x i16], [9 x i16]* %5, i64 0, i64 0
  br label %71

; <label>:71:                                     ; preds = %.preheader8, %._crit_edge
  %indvars.iv41 = phi i64 [ 8, %.preheader8 ], [ %indvars.iv.next42, %._crit_edge ]
  %.126 = phi i16* [ %1, %.preheader8 ], [ %150, %._crit_edge ]
  %.0525 = phi i32 [ 1, %.preheader8 ], [ %149, %._crit_edge ]
  %72 = load i16, i16* %69, align 2
  %73 = icmp slt i16 %72, 0
  %74 = icmp eq i16 %72, -32768
  %75 = sub i16 0, %72
  %76 = select i1 %74, i16 32767, i16 %75
  %. = select i1 %73, i16 %76, i16 %72
  %77 = load i16, i16* %70, align 16
  %78 = icmp slt i16 %77, %.
  br i1 %78, label %.loopexit.loopexit30, label %79

; <label>:79:                                     ; preds = %71
  %80 = tail call signext i16 @gsm_div(i16 signext %., i16 signext %77) #6
  store i16 %80, i16* %.126, align 2
  %81 = icmp sgt i16 %80, -1
  br i1 %81, label %83, label %82

; <label>:82:                                     ; preds = %79
  tail call void @__assert_fail(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 224, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__PRETTY_FUNCTION__.Reflection_coefficients, i64 0, i64 0)) #5
  unreachable

; <label>:83:                                     ; preds = %79
  %84 = load i16, i16* %69, align 2
  %85 = icmp sgt i16 %84, 0
  %86 = sub i16 0, %80
  br i1 %85, label %87, label %thread-pre-split

; <label>:87:                                     ; preds = %83
  store i16 %86, i16* %.126, align 2
  br label %88

thread-pre-split:                                 ; preds = %83
  %.pr = load i16, i16* %.126, align 2
  br label %88

; <label>:88:                                     ; preds = %thread-pre-split, %87
  %89 = phi i16 [ %.pr, %thread-pre-split ], [ %86, %87 ]
  %90 = icmp eq i16 %89, -32768
  br i1 %90, label %91, label %92

; <label>:91:                                     ; preds = %88
  tail call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 226, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__PRETTY_FUNCTION__.Reflection_coefficients, i64 0, i64 0)) #5
  unreachable

; <label>:92:                                     ; preds = %88
  %93 = icmp eq i32 %.0525, 8
  br i1 %93, label %.loopexit.loopexit70, label %94

; <label>:94:                                     ; preds = %92
  %95 = load i16, i16* %69, align 2
  %96 = sext i16 %95 to i64
  %97 = sext i16 %89 to i64
  %98 = load i16, i16* %70, align 16
  %99 = sext i16 %98 to i64
  %100 = shl nsw i64 %97, 33
  %101 = mul i64 %100, %96
  %102 = add i64 %101, 140737488355328
  %103 = ashr i64 %102, 48
  %104 = add nsw i64 %103, %99
  %105 = add nsw i64 %104, 32768
  %106 = icmp ugt i64 %105, 65535
  %107 = icmp sgt i64 %104, 0
  %108 = select i1 %107, i64 32767, i64 32768
  %109 = select i1 %106, i64 %108, i64 %104
  %110 = trunc i64 %109 to i16
  store i16 %110, i16* %70, align 16
  %111 = icmp sgt i32 %.0525, 7
  br i1 %111, label %._crit_edge, label %.lr.ph24.preheader

.lr.ph24.preheader:                               ; preds = %94
  br label %.lr.ph24

.lr.ph24:                                         ; preds = %.lr.ph24.preheader, %.lr.ph24
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph24 ], [ 1, %.lr.ph24.preheader ]
  %112 = getelementptr inbounds [9 x i16], [9 x i16]* %7, i64 0, i64 %indvars.iv
  %113 = load i16, i16* %112, align 2
  %114 = sext i16 %113 to i64
  %115 = load i16, i16* %.126, align 2
  %116 = sext i16 %115 to i64
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %117 = getelementptr inbounds [9 x i16], [9 x i16]* %5, i64 0, i64 %indvars.iv.next
  %118 = load i16, i16* %117, align 2
  %119 = sext i16 %118 to i64
  %120 = shl nsw i64 %114, 33
  %121 = mul i64 %120, %116
  %122 = add i64 %121, 140737488355328
  %123 = ashr i64 %122, 48
  %124 = add nsw i64 %123, %119
  %125 = add nsw i64 %124, 32768
  %126 = icmp ugt i64 %125, 65535
  %127 = icmp sgt i64 %124, 0
  %128 = select i1 %127, i64 32767, i64 32768
  %129 = select i1 %126, i64 %128, i64 %124
  %130 = trunc i64 %129 to i16
  %131 = getelementptr inbounds [9 x i16], [9 x i16]* %5, i64 0, i64 %indvars.iv
  store i16 %130, i16* %131, align 2
  %132 = load i16, i16* %117, align 2
  %133 = sext i16 %132 to i64
  %134 = load i16, i16* %.126, align 2
  %135 = sext i16 %134 to i64
  %136 = load i16, i16* %112, align 2
  %137 = sext i16 %136 to i64
  %138 = shl nsw i64 %133, 33
  %139 = mul i64 %138, %135
  %140 = add i64 %139, 140737488355328
  %141 = ashr i64 %140, 48
  %142 = add nsw i64 %141, %137
  %143 = add nsw i64 %142, 32768
  %144 = icmp ugt i64 %143, 65535
  %145 = icmp sgt i64 %142, 0
  %146 = select i1 %145, i64 32767, i64 32768
  %147 = select i1 %144, i64 %146, i64 %142
  %148 = trunc i64 %147 to i16
  store i16 %148, i16* %112, align 2
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv41
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph24

._crit_edge.loopexit:                             ; preds = %.lr.ph24
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %94
  %149 = add nuw nsw i32 %.0525, 1
  %150 = getelementptr inbounds i16, i16* %.126, i64 1
  %151 = icmp slt i32 %149, 9
  %indvars.iv.next42 = add nsw i64 %indvars.iv41, -1
  br i1 %151, label %71, label %.loopexit.loopexit70

.loopexit.loopexit:                               ; preds = %2
  %152 = bitcast i16* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %152, i8 0, i64 16, i32 2, i1 false)
  br label %.loopexit

.loopexit.loopexit30:                             ; preds = %71
  %.126.lcssa38 = bitcast i16* %.126 to i8*
  %153 = sub i32 8, %.0525
  %154 = zext i32 %153 to i64
  %155 = shl nuw nsw i64 %154, 1
  %156 = add nuw nsw i64 %155, 2
  call void @llvm.memset.p0i8.i64(i8* %.126.lcssa38, i8 0, i64 %156, i32 2, i1 false)
  br label %.loopexit

.loopexit.loopexit70:                             ; preds = %._crit_edge, %92
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit70, %.loopexit.loopexit30, %.loopexit.loopexit
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @Transformation_to_Log_Area_Ratios(i16* nocapture) unnamed_addr #0 {
  %2 = load i16, i16* %0, align 2
  %3 = icmp slt i16 %2, 0
  %4 = icmp eq i16 %2, -32768
  %5 = sub i16 0, %2
  %6 = select i1 %4, i16 32767, i16 %5
  br i1 %3, label %7, label %.thread

; <label>:7:                                      ; preds = %1
  %8 = icmp sgt i16 %6, -1
  br i1 %8, label %.thread, label %9

; <label>:9:                                      ; preds = %191, %165, %139, %113, %87, %61, %35, %7
  tail call void @__assert_fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 267, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__PRETTY_FUNCTION__.Transformation_to_Log_Area_Ratios, i64 0, i64 0)) #5
  unreachable

.thread:                                          ; preds = %1, %7
  %10 = phi i16 [ %6, %7 ], [ %2, %1 ]
  %11 = icmp slt i16 %10, 22118
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %.thread
  %13 = lshr i16 %10, 1
  br label %21

; <label>:14:                                     ; preds = %.thread
  %15 = icmp slt i16 %10, 31130
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %14
  %17 = add i16 %10, -11059
  br label %21

; <label>:18:                                     ; preds = %14
  %19 = shl i16 %10, 2
  %20 = add i16 %19, 26624
  br label %21

; <label>:21:                                     ; preds = %16, %18, %12
  %.1 = phi i16 [ %13, %12 ], [ %17, %16 ], [ %20, %18 ]
  %22 = load i16, i16* %0, align 2
  %23 = icmp slt i16 %22, 0
  %24 = sub i16 0, %.1
  %25 = select i1 %23, i16 %24, i16 %.1
  store i16 %25, i16* %0, align 2
  %26 = icmp eq i16 %25, -32768
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %204, %178, %152, %126, %100, %74, %48, %21
  tail call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 281, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__PRETTY_FUNCTION__.Transformation_to_Log_Area_Ratios, i64 0, i64 0)) #5
  unreachable

; <label>:28:                                     ; preds = %21
  %29 = getelementptr inbounds i16, i16* %0, i64 1
  %30 = load i16, i16* %29, align 2
  %31 = icmp slt i16 %30, 0
  %32 = icmp eq i16 %30, -32768
  %33 = sub i16 0, %30
  %34 = select i1 %32, i16 32767, i16 %33
  br i1 %31, label %35, label %.thread.1

; <label>:35:                                     ; preds = %28
  %36 = icmp sgt i16 %34, -1
  br i1 %36, label %.thread.1, label %9

.thread.1:                                        ; preds = %35, %28
  %37 = phi i16 [ %34, %35 ], [ %30, %28 ]
  %38 = icmp slt i16 %37, 22118
  br i1 %38, label %46, label %39

; <label>:39:                                     ; preds = %.thread.1
  %40 = icmp slt i16 %37, 31130
  br i1 %40, label %44, label %41

; <label>:41:                                     ; preds = %39
  %42 = shl i16 %37, 2
  %43 = add i16 %42, 26624
  br label %48

; <label>:44:                                     ; preds = %39
  %45 = add i16 %37, -11059
  br label %48

; <label>:46:                                     ; preds = %.thread.1
  %47 = lshr i16 %37, 1
  br label %48

; <label>:48:                                     ; preds = %46, %44, %41
  %.1.1 = phi i16 [ %47, %46 ], [ %45, %44 ], [ %43, %41 ]
  %49 = load i16, i16* %29, align 2
  %50 = icmp slt i16 %49, 0
  %51 = sub i16 0, %.1.1
  %52 = select i1 %50, i16 %51, i16 %.1.1
  store i16 %52, i16* %29, align 2
  %53 = icmp eq i16 %52, -32768
  br i1 %53, label %27, label %54

; <label>:54:                                     ; preds = %48
  %55 = getelementptr inbounds i16, i16* %0, i64 2
  %56 = load i16, i16* %55, align 2
  %57 = icmp slt i16 %56, 0
  %58 = icmp eq i16 %56, -32768
  %59 = sub i16 0, %56
  %60 = select i1 %58, i16 32767, i16 %59
  br i1 %57, label %61, label %.thread.2

; <label>:61:                                     ; preds = %54
  %62 = icmp sgt i16 %60, -1
  br i1 %62, label %.thread.2, label %9

.thread.2:                                        ; preds = %61, %54
  %63 = phi i16 [ %60, %61 ], [ %56, %54 ]
  %64 = icmp slt i16 %63, 22118
  br i1 %64, label %72, label %65

; <label>:65:                                     ; preds = %.thread.2
  %66 = icmp slt i16 %63, 31130
  br i1 %66, label %70, label %67

; <label>:67:                                     ; preds = %65
  %68 = shl i16 %63, 2
  %69 = add i16 %68, 26624
  br label %74

; <label>:70:                                     ; preds = %65
  %71 = add i16 %63, -11059
  br label %74

; <label>:72:                                     ; preds = %.thread.2
  %73 = lshr i16 %63, 1
  br label %74

; <label>:74:                                     ; preds = %72, %70, %67
  %.1.2 = phi i16 [ %73, %72 ], [ %71, %70 ], [ %69, %67 ]
  %75 = load i16, i16* %55, align 2
  %76 = icmp slt i16 %75, 0
  %77 = sub i16 0, %.1.2
  %78 = select i1 %76, i16 %77, i16 %.1.2
  store i16 %78, i16* %55, align 2
  %79 = icmp eq i16 %78, -32768
  br i1 %79, label %27, label %80

; <label>:80:                                     ; preds = %74
  %81 = getelementptr inbounds i16, i16* %0, i64 3
  %82 = load i16, i16* %81, align 2
  %83 = icmp slt i16 %82, 0
  %84 = icmp eq i16 %82, -32768
  %85 = sub i16 0, %82
  %86 = select i1 %84, i16 32767, i16 %85
  br i1 %83, label %87, label %.thread.3

; <label>:87:                                     ; preds = %80
  %88 = icmp sgt i16 %86, -1
  br i1 %88, label %.thread.3, label %9

.thread.3:                                        ; preds = %87, %80
  %89 = phi i16 [ %86, %87 ], [ %82, %80 ]
  %90 = icmp slt i16 %89, 22118
  br i1 %90, label %98, label %91

; <label>:91:                                     ; preds = %.thread.3
  %92 = icmp slt i16 %89, 31130
  br i1 %92, label %96, label %93

; <label>:93:                                     ; preds = %91
  %94 = shl i16 %89, 2
  %95 = add i16 %94, 26624
  br label %100

; <label>:96:                                     ; preds = %91
  %97 = add i16 %89, -11059
  br label %100

; <label>:98:                                     ; preds = %.thread.3
  %99 = lshr i16 %89, 1
  br label %100

; <label>:100:                                    ; preds = %98, %96, %93
  %.1.3 = phi i16 [ %99, %98 ], [ %97, %96 ], [ %95, %93 ]
  %101 = load i16, i16* %81, align 2
  %102 = icmp slt i16 %101, 0
  %103 = sub i16 0, %.1.3
  %104 = select i1 %102, i16 %103, i16 %.1.3
  store i16 %104, i16* %81, align 2
  %105 = icmp eq i16 %104, -32768
  br i1 %105, label %27, label %106

; <label>:106:                                    ; preds = %100
  %107 = getelementptr inbounds i16, i16* %0, i64 4
  %108 = load i16, i16* %107, align 2
  %109 = icmp slt i16 %108, 0
  %110 = icmp eq i16 %108, -32768
  %111 = sub i16 0, %108
  %112 = select i1 %110, i16 32767, i16 %111
  br i1 %109, label %113, label %.thread.4

; <label>:113:                                    ; preds = %106
  %114 = icmp sgt i16 %112, -1
  br i1 %114, label %.thread.4, label %9

.thread.4:                                        ; preds = %113, %106
  %115 = phi i16 [ %112, %113 ], [ %108, %106 ]
  %116 = icmp slt i16 %115, 22118
  br i1 %116, label %124, label %117

; <label>:117:                                    ; preds = %.thread.4
  %118 = icmp slt i16 %115, 31130
  br i1 %118, label %122, label %119

; <label>:119:                                    ; preds = %117
  %120 = shl i16 %115, 2
  %121 = add i16 %120, 26624
  br label %126

; <label>:122:                                    ; preds = %117
  %123 = add i16 %115, -11059
  br label %126

; <label>:124:                                    ; preds = %.thread.4
  %125 = lshr i16 %115, 1
  br label %126

; <label>:126:                                    ; preds = %124, %122, %119
  %.1.4 = phi i16 [ %125, %124 ], [ %123, %122 ], [ %121, %119 ]
  %127 = load i16, i16* %107, align 2
  %128 = icmp slt i16 %127, 0
  %129 = sub i16 0, %.1.4
  %130 = select i1 %128, i16 %129, i16 %.1.4
  store i16 %130, i16* %107, align 2
  %131 = icmp eq i16 %130, -32768
  br i1 %131, label %27, label %132

; <label>:132:                                    ; preds = %126
  %133 = getelementptr inbounds i16, i16* %0, i64 5
  %134 = load i16, i16* %133, align 2
  %135 = icmp slt i16 %134, 0
  %136 = icmp eq i16 %134, -32768
  %137 = sub i16 0, %134
  %138 = select i1 %136, i16 32767, i16 %137
  br i1 %135, label %139, label %.thread.5

; <label>:139:                                    ; preds = %132
  %140 = icmp sgt i16 %138, -1
  br i1 %140, label %.thread.5, label %9

.thread.5:                                        ; preds = %139, %132
  %141 = phi i16 [ %138, %139 ], [ %134, %132 ]
  %142 = icmp slt i16 %141, 22118
  br i1 %142, label %150, label %143

; <label>:143:                                    ; preds = %.thread.5
  %144 = icmp slt i16 %141, 31130
  br i1 %144, label %148, label %145

; <label>:145:                                    ; preds = %143
  %146 = shl i16 %141, 2
  %147 = add i16 %146, 26624
  br label %152

; <label>:148:                                    ; preds = %143
  %149 = add i16 %141, -11059
  br label %152

; <label>:150:                                    ; preds = %.thread.5
  %151 = lshr i16 %141, 1
  br label %152

; <label>:152:                                    ; preds = %150, %148, %145
  %.1.5 = phi i16 [ %151, %150 ], [ %149, %148 ], [ %147, %145 ]
  %153 = load i16, i16* %133, align 2
  %154 = icmp slt i16 %153, 0
  %155 = sub i16 0, %.1.5
  %156 = select i1 %154, i16 %155, i16 %.1.5
  store i16 %156, i16* %133, align 2
  %157 = icmp eq i16 %156, -32768
  br i1 %157, label %27, label %158

; <label>:158:                                    ; preds = %152
  %159 = getelementptr inbounds i16, i16* %0, i64 6
  %160 = load i16, i16* %159, align 2
  %161 = icmp slt i16 %160, 0
  %162 = icmp eq i16 %160, -32768
  %163 = sub i16 0, %160
  %164 = select i1 %162, i16 32767, i16 %163
  br i1 %161, label %165, label %.thread.6

; <label>:165:                                    ; preds = %158
  %166 = icmp sgt i16 %164, -1
  br i1 %166, label %.thread.6, label %9

.thread.6:                                        ; preds = %165, %158
  %167 = phi i16 [ %164, %165 ], [ %160, %158 ]
  %168 = icmp slt i16 %167, 22118
  br i1 %168, label %176, label %169

; <label>:169:                                    ; preds = %.thread.6
  %170 = icmp slt i16 %167, 31130
  br i1 %170, label %174, label %171

; <label>:171:                                    ; preds = %169
  %172 = shl i16 %167, 2
  %173 = add i16 %172, 26624
  br label %178

; <label>:174:                                    ; preds = %169
  %175 = add i16 %167, -11059
  br label %178

; <label>:176:                                    ; preds = %.thread.6
  %177 = lshr i16 %167, 1
  br label %178

; <label>:178:                                    ; preds = %176, %174, %171
  %.1.6 = phi i16 [ %177, %176 ], [ %175, %174 ], [ %173, %171 ]
  %179 = load i16, i16* %159, align 2
  %180 = icmp slt i16 %179, 0
  %181 = sub i16 0, %.1.6
  %182 = select i1 %180, i16 %181, i16 %.1.6
  store i16 %182, i16* %159, align 2
  %183 = icmp eq i16 %182, -32768
  br i1 %183, label %27, label %184

; <label>:184:                                    ; preds = %178
  %185 = getelementptr inbounds i16, i16* %0, i64 7
  %186 = load i16, i16* %185, align 2
  %187 = icmp slt i16 %186, 0
  %188 = icmp eq i16 %186, -32768
  %189 = sub i16 0, %186
  %190 = select i1 %188, i16 32767, i16 %189
  br i1 %187, label %191, label %.thread.7

; <label>:191:                                    ; preds = %184
  %192 = icmp sgt i16 %190, -1
  br i1 %192, label %.thread.7, label %9

.thread.7:                                        ; preds = %191, %184
  %193 = phi i16 [ %190, %191 ], [ %186, %184 ]
  %194 = icmp slt i16 %193, 22118
  br i1 %194, label %202, label %195

; <label>:195:                                    ; preds = %.thread.7
  %196 = icmp slt i16 %193, 31130
  br i1 %196, label %200, label %197

; <label>:197:                                    ; preds = %195
  %198 = shl i16 %193, 2
  %199 = add i16 %198, 26624
  br label %204

; <label>:200:                                    ; preds = %195
  %201 = add i16 %193, -11059
  br label %204

; <label>:202:                                    ; preds = %.thread.7
  %203 = lshr i16 %193, 1
  br label %204

; <label>:204:                                    ; preds = %202, %200, %197
  %.1.7 = phi i16 [ %203, %202 ], [ %201, %200 ], [ %199, %197 ]
  %205 = load i16, i16* %185, align 2
  %206 = icmp slt i16 %205, 0
  %207 = sub i16 0, %.1.7
  %208 = select i1 %206, i16 %207, i16 %.1.7
  store i16 %208, i16* %185, align 2
  %209 = icmp eq i16 %208, -32768
  br i1 %209, label %27, label %210

; <label>:210:                                    ; preds = %204
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @Quantization_and_coding(i16* nocapture) unnamed_addr #1 {
  %2 = load i16, i16* %0, align 2
  %3 = sext i16 %2 to i64
  %4 = mul nsw i64 %3, 175921860444160
  %5 = ashr i64 %4, 48
  %6 = add nsw i64 %5, 32768
  %7 = icmp ugt i64 %6, 65535
  %8 = icmp sgt i64 %5, 0
  %9 = select i1 %8, i64 32767, i64 -32768
  %10 = select i1 %7, i64 %9, i64 %5
  %11 = add nsw i64 %10, 33024
  %12 = icmp ugt i64 %11, 65535
  %13 = icmp sgt i64 %10, -256
  %14 = select i1 %13, i64 32256, i64 32768
  %15 = add nsw i64 %10, 256
  %16 = select i1 %12, i64 %14, i64 %15
  %17 = trunc i64 %16 to i32
  %sext = shl i32 %17, 16
  %18 = ashr i32 %sext, 25
  %19 = icmp sgt i32 %18, 31
  %20 = icmp slt i32 %18, -32
  %21 = add nsw i32 %18, 32
  %22 = trunc i32 %21 to i16
  %23 = select i1 %20, i16 0, i16 %22
  %24 = select i1 %19, i16 63, i16 %23
  store i16 %24, i16* %0, align 2
  %25 = getelementptr inbounds i16, i16* %0, i64 1
  %26 = load i16, i16* %25, align 2
  %27 = sext i16 %26 to i64
  %28 = mul nsw i64 %27, 175921860444160
  %29 = ashr i64 %28, 48
  %30 = add nsw i64 %29, 32768
  %31 = icmp ugt i64 %30, 65535
  %32 = icmp sgt i64 %29, 0
  %33 = select i1 %32, i64 32767, i64 -32768
  %34 = select i1 %31, i64 %33, i64 %29
  %35 = add nsw i64 %34, 33024
  %36 = icmp ugt i64 %35, 65535
  %37 = icmp sgt i64 %34, -256
  %38 = select i1 %37, i64 32256, i64 32768
  %39 = add nsw i64 %34, 256
  %40 = select i1 %36, i64 %38, i64 %39
  %41 = trunc i64 %40 to i32
  %sext2 = shl i32 %41, 16
  %42 = ashr i32 %sext2, 25
  %43 = icmp sgt i32 %42, 31
  %44 = icmp slt i32 %42, -32
  %45 = add nsw i32 %42, 32
  %46 = trunc i32 %45 to i16
  %47 = select i1 %44, i16 0, i16 %46
  %48 = select i1 %43, i16 63, i16 %47
  store i16 %48, i16* %25, align 2
  %49 = getelementptr inbounds i16, i16* %0, i64 2
  %50 = load i16, i16* %49, align 2
  %51 = sext i16 %50 to i64
  %52 = mul nsw i64 %51, 175921860444160
  %53 = ashr i64 %52, 48
  %54 = add nsw i64 %53, 34816
  %55 = icmp ugt i64 %54, 65535
  %56 = icmp sgt i64 %53, -2048
  %57 = select i1 %56, i64 32767, i64 32768
  %58 = add nsw i64 %53, 2048
  %59 = select i1 %55, i64 %57, i64 %58
  %sext4 = shl i64 %59, 48
  %60 = ashr exact i64 %sext4, 48
  %61 = add nsw i64 %60, 33024
  %62 = icmp ugt i64 %61, 65535
  %63 = icmp sgt i64 %sext4, -72057594037927936
  %64 = select i1 %63, i64 32256, i64 32768
  %65 = add nsw i64 %60, 256
  %66 = select i1 %62, i64 %64, i64 %65
  %67 = trunc i64 %66 to i32
  %sext5 = shl i32 %67, 16
  %68 = ashr i32 %sext5, 25
  %69 = icmp sgt i32 %68, 15
  %70 = icmp slt i32 %68, -16
  %71 = add nsw i32 %68, 16
  %72 = trunc i32 %71 to i16
  %73 = select i1 %70, i16 0, i16 %72
  %74 = select i1 %69, i16 31, i16 %73
  store i16 %74, i16* %49, align 2
  %75 = getelementptr inbounds i16, i16* %0, i64 3
  %76 = load i16, i16* %75, align 2
  %77 = sext i16 %76 to i64
  %78 = mul nsw i64 %77, 175921860444160
  %79 = ashr i64 %78, 48
  %80 = add nsw i64 %79, 30208
  %81 = icmp ugt i64 %80, 65535
  %82 = icmp sgt i64 %79, 2560
  %83 = select i1 %82, i64 32767, i64 32768
  %84 = add nsw i64 %79, 62976
  %85 = select i1 %81, i64 %83, i64 %84
  %sext7 = shl i64 %85, 48
  %86 = ashr exact i64 %sext7, 48
  %87 = add nsw i64 %86, 33024
  %88 = icmp ugt i64 %87, 65535
  %89 = icmp sgt i64 %sext7, -72057594037927936
  %90 = select i1 %89, i64 32256, i64 32768
  %91 = add nsw i64 %86, 256
  %92 = select i1 %88, i64 %90, i64 %91
  %93 = trunc i64 %92 to i32
  %sext8 = shl i32 %93, 16
  %94 = ashr i32 %sext8, 25
  %95 = icmp sgt i32 %94, 15
  %96 = icmp slt i32 %94, -16
  %97 = add nsw i32 %94, 16
  %98 = trunc i32 %97 to i16
  %99 = select i1 %96, i16 0, i16 %98
  %100 = select i1 %95, i16 31, i16 %99
  store i16 %100, i16* %75, align 2
  %101 = getelementptr inbounds i16, i16* %0, i64 4
  %102 = load i16, i16* %101, align 2
  %103 = sext i16 %102 to i64
  %104 = mul nsw i64 %103, 119949846642688
  %105 = ashr i64 %104, 48
  %106 = add nsw i64 %105, 32862
  %107 = icmp ugt i64 %106, 65535
  %108 = icmp sgt i64 %105, -94
  %109 = select i1 %108, i64 32767, i64 32768
  %110 = add nsw i64 %105, 94
  %111 = select i1 %107, i64 %109, i64 %110
  %sext10 = shl i64 %111, 48
  %112 = ashr exact i64 %sext10, 48
  %113 = add nsw i64 %112, 33024
  %114 = icmp ugt i64 %113, 65535
  %115 = icmp sgt i64 %sext10, -72057594037927936
  %116 = select i1 %115, i64 32256, i64 32768
  %117 = add nsw i64 %112, 256
  %118 = select i1 %114, i64 %116, i64 %117
  %119 = trunc i64 %118 to i32
  %sext11 = shl i32 %119, 16
  %120 = ashr i32 %sext11, 25
  %121 = icmp sgt i32 %120, 7
  %122 = icmp slt i32 %120, -8
  %123 = add nsw i32 %120, 8
  %124 = trunc i32 %123 to i16
  %125 = select i1 %122, i16 0, i16 %124
  %126 = select i1 %121, i16 15, i16 %125
  store i16 %126, i16* %101, align 2
  %127 = getelementptr inbounds i16, i16* %0, i64 5
  %128 = load i16, i16* %127, align 2
  %129 = sext i16 %128 to i64
  %130 = mul nsw i64 %129, 131941395333120
  %131 = ashr i64 %130, 48
  %132 = add nsw i64 %131, 30976
  %133 = icmp ugt i64 %132, 65535
  %134 = icmp sgt i64 %131, 1792
  %135 = select i1 %134, i64 32767, i64 32768
  %136 = add nsw i64 %131, 63744
  %137 = select i1 %133, i64 %135, i64 %136
  %sext13 = shl i64 %137, 48
  %138 = ashr exact i64 %sext13, 48
  %139 = add nsw i64 %138, 33024
  %140 = icmp ugt i64 %139, 65535
  %141 = icmp sgt i64 %sext13, -72057594037927936
  %142 = select i1 %141, i64 32256, i64 32768
  %143 = add nsw i64 %138, 256
  %144 = select i1 %140, i64 %142, i64 %143
  %145 = trunc i64 %144 to i32
  %sext14 = shl i32 %145, 16
  %146 = ashr i32 %sext14, 25
  %147 = icmp sgt i32 %146, 7
  %148 = icmp slt i32 %146, -8
  %149 = add nsw i32 %146, 8
  %150 = trunc i32 %149 to i16
  %151 = select i1 %148, i16 0, i16 %150
  %152 = select i1 %147, i16 15, i16 %151
  store i16 %152, i16* %127, align 2
  %153 = getelementptr inbounds i16, i16* %0, i64 6
  %154 = load i16, i16* %153, align 2
  %155 = sext i16 %154 to i64
  %156 = mul nsw i64 %155, 73306501808128
  %157 = ashr i64 %156, 48
  %158 = add nsw i64 %157, 32427
  %159 = icmp ugt i64 %158, 65535
  %160 = icmp sgt i64 %157, 341
  %161 = select i1 %160, i64 32767, i64 32768
  %162 = add nsw i64 %157, 65195
  %163 = select i1 %159, i64 %161, i64 %162
  %sext16 = shl i64 %163, 48
  %164 = ashr exact i64 %sext16, 48
  %165 = add nsw i64 %164, 33024
  %166 = icmp ugt i64 %165, 65535
  %167 = icmp sgt i64 %sext16, -72057594037927936
  %168 = select i1 %167, i64 32256, i64 32768
  %169 = add nsw i64 %164, 256
  %170 = select i1 %166, i64 %168, i64 %169
  %171 = trunc i64 %170 to i32
  %sext17 = shl i32 %171, 16
  %172 = ashr i32 %sext17, 25
  %173 = icmp sgt i32 %172, 3
  %174 = icmp slt i32 %172, -4
  %175 = add nsw i32 %172, 4
  %176 = trunc i32 %175 to i16
  %177 = select i1 %174, i16 0, i16 %176
  %178 = select i1 %173, i16 7, i16 %177
  store i16 %178, i16* %153, align 2
  %179 = getelementptr inbounds i16, i16* %0, i64 7
  %180 = load i16, i16* %179, align 2
  %181 = sext i16 %180 to i64
  %182 = mul nsw i64 %181, 77618648973312
  %183 = ashr i64 %182, 48
  %184 = add nsw i64 %183, 31624
  %185 = icmp ugt i64 %184, 65535
  %186 = icmp sgt i64 %183, 1144
  %187 = select i1 %186, i64 32767, i64 32768
  %188 = add nsw i64 %183, 64392
  %189 = select i1 %185, i64 %187, i64 %188
  %sext19 = shl i64 %189, 48
  %190 = ashr exact i64 %sext19, 48
  %191 = add nsw i64 %190, 33024
  %192 = icmp ugt i64 %191, 65535
  %193 = icmp sgt i64 %sext19, -72057594037927936
  %194 = select i1 %193, i64 32256, i64 32768
  %195 = add nsw i64 %190, 256
  %196 = select i1 %192, i64 %194, i64 %195
  %197 = trunc i64 %196 to i32
  %sext20 = shl i32 %197, 16
  %198 = ashr i32 %sext20, 25
  %199 = icmp sgt i32 %198, 3
  %200 = icmp slt i32 %198, -4
  %201 = add nsw i32 %198, 4
  %202 = trunc i32 %201 to i16
  %203 = select i1 %200, i16 0, i16 %202
  %204 = select i1 %199, i16 7, i16 %203
  store i16 %204, i16* %179, align 2
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #2

declare signext i16 @gsm_norm(i64) local_unnamed_addr #3

declare signext i16 @gsm_div(i16 signext, i16 signext) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
