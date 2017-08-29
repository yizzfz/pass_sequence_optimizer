; ModuleID = 'short_term.ll'
source_filename = "short_term.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

; Function Attrs: noinline norecurse nounwind uwtable
define void @Gsm_Short_Term_Analysis_Filter(%struct.gsm_state* nocapture, i16* nocapture readonly, i16* nocapture) local_unnamed_addr #0 {
  %4 = alloca [8 x i16], align 16
  %5 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 6
  %6 = load i16, i16* %5, align 4
  %7 = sext i16 %6 to i64
  %8 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 5, i64 %7, i64 0
  %9 = xor i16 %6, 1
  store i16 %9, i16* %5, align 4
  %10 = sext i16 %9 to i64
  %11 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 5, i64 %10, i64 0
  tail call fastcc void @Decoding_of_the_coded_Log_Area_Ratios(i16* %1, i16* %8)
  %12 = getelementptr inbounds [8 x i16], [8 x i16]* %4, i64 0, i64 0
  call fastcc void @Coefficients_0_12(i16* %11, i16* %8, i16* nonnull %12)
  call fastcc void @LARp_to_rp(i16* nonnull %12)
  call fastcc void @Short_term_analysis_filtering(%struct.gsm_state* %0, i16* nonnull %12, i32 13, i16* %2)
  call fastcc void @Coefficients_13_26(i16* %11, i16* %8, i16* nonnull %12)
  call fastcc void @LARp_to_rp(i16* nonnull %12)
  %13 = getelementptr inbounds i16, i16* %2, i64 13
  call fastcc void @Short_term_analysis_filtering(%struct.gsm_state* %0, i16* nonnull %12, i32 14, i16* %13)
  call fastcc void @Coefficients_27_39(i16* %11, i16* %8, i16* nonnull %12)
  call fastcc void @LARp_to_rp(i16* nonnull %12)
  %14 = getelementptr inbounds i16, i16* %2, i64 27
  call fastcc void @Short_term_analysis_filtering(%struct.gsm_state* %0, i16* nonnull %12, i32 13, i16* %14)
  call fastcc void @Coefficients_40_159(i16* %8, i16* nonnull %12)
  call fastcc void @LARp_to_rp(i16* nonnull %12)
  %15 = getelementptr inbounds i16, i16* %2, i64 40
  call fastcc void @Short_term_analysis_filtering(%struct.gsm_state* %0, i16* nonnull %12, i32 120, i16* %15)
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @Decoding_of_the_coded_Log_Area_Ratios(i16* nocapture readonly, i16* nocapture) unnamed_addr #0 {
  %3 = getelementptr inbounds i16, i16* %0, i64 1
  %4 = load i16, i16* %0, align 2
  %5 = sext i16 %4 to i64
  %6 = add nsw i64 %5, 32736
  %7 = icmp ugt i64 %6, 65535
  %8 = icmp sgt i16 %4, 32
  %9 = select i1 %8, i16 63, i16 0
  %10 = add i16 %4, 32
  %11 = select i1 %7, i16 %9, i16 %10
  %12 = shl i16 %11, 10
  %13 = sext i16 %12 to i64
  %14 = mul nsw i64 %13, 13107
  %15 = add nsw i64 %14, 16384
  %16 = lshr i64 %15, 15
  %sext = shl i64 %16, 48
  %17 = ashr exact i64 %sext, 47
  %18 = add nsw i64 %17, 32768
  %19 = icmp ugt i64 %18, 65535
  %20 = icmp sgt i64 %sext, 0
  %21 = select i1 %20, i64 32767, i64 32768
  %22 = select i1 %19, i64 %21, i64 %17
  %23 = trunc i64 %22 to i16
  %24 = getelementptr inbounds i16, i16* %1, i64 1
  store i16 %23, i16* %1, align 2
  %25 = getelementptr inbounds i16, i16* %0, i64 2
  %26 = load i16, i16* %3, align 2
  %27 = sext i16 %26 to i64
  %28 = add nsw i64 %27, 32736
  %29 = icmp ugt i64 %28, 65535
  %30 = icmp sgt i16 %26, 32
  %31 = select i1 %30, i16 63, i16 0
  %32 = add i16 %26, 32
  %33 = select i1 %29, i16 %31, i16 %32
  %34 = shl i16 %33, 10
  %35 = sext i16 %34 to i64
  %36 = mul nsw i64 %35, 13107
  %37 = add nsw i64 %36, 16384
  %38 = lshr i64 %37, 15
  %sext3 = shl i64 %38, 48
  %39 = ashr exact i64 %sext3, 47
  %40 = add nsw i64 %39, 32768
  %41 = icmp ugt i64 %40, 65535
  %42 = icmp sgt i64 %sext3, 0
  %43 = select i1 %42, i64 32767, i64 32768
  %44 = select i1 %41, i64 %43, i64 %39
  %45 = trunc i64 %44 to i16
  %46 = getelementptr inbounds i16, i16* %1, i64 2
  store i16 %45, i16* %24, align 2
  %47 = getelementptr inbounds i16, i16* %0, i64 3
  %48 = load i16, i16* %25, align 2
  %49 = sext i16 %48 to i64
  %50 = add nsw i64 %49, 32752
  %51 = icmp ugt i64 %50, 65535
  %52 = icmp sgt i16 %48, 16
  %53 = select i1 %52, i16 63, i16 0
  %54 = add i16 %48, 48
  %55 = select i1 %51, i16 %53, i16 %54
  %56 = shl i16 %55, 10
  %57 = sext i16 %56 to i64
  %58 = add nsw i64 %57, -4096
  %59 = icmp sgt i64 %58, 32766
  %60 = icmp sgt i64 %58, -32768
  %. = select i1 %60, i64 %58, i64 -32768
  %..op = shl i64 %., 48
  %..op.op = ashr exact i64 %..op, 48
  %..op.op.op.op = mul nsw i64 %..op.op, 112588272697344
  %61 = add i64 %..op.op.op.op, 140737488355328
  %..op.op.op.op.op.op.op = ashr i64 %61, 48
  %62 = shl nsw i64 %..op.op.op.op.op.op.op, 1
  %63 = select i1 %59, i64 26214, i64 %62
  %64 = add nsw i64 %63, 32768
  %65 = icmp ugt i64 %64, 65535
  %66 = icmp sgt i64 %63, 0
  %67 = select i1 %66, i64 32767, i64 32768
  %68 = select i1 %65, i64 %67, i64 %63
  %69 = trunc i64 %68 to i16
  %70 = getelementptr inbounds i16, i16* %1, i64 3
  store i16 %69, i16* %46, align 2
  %71 = getelementptr inbounds i16, i16* %0, i64 4
  %72 = load i16, i16* %47, align 2
  %73 = sext i16 %72 to i64
  %74 = add nsw i64 %73, 32752
  %75 = icmp ugt i64 %74, 65535
  %76 = icmp sgt i16 %72, 16
  %77 = select i1 %76, i16 63, i16 0
  %78 = add i16 %72, 48
  %79 = select i1 %75, i16 %77, i16 %78
  %80 = shl i16 %79, 10
  %81 = sext i16 %80 to i64
  %82 = add nsw i64 %81, 5120
  %83 = icmp sgt i64 %82, 32766
  %84 = icmp sgt i64 %82, -32768
  %.28 = select i1 %84, i64 %82, i64 -32768
  %.28.op = shl i64 %.28, 48
  %.28.op.op = ashr exact i64 %.28.op, 48
  %.28.op.op.op.op = mul nsw i64 %.28.op.op, 112588272697344
  %85 = add i64 %.28.op.op.op.op, 140737488355328
  %.28.op.op.op.op.op.op.op = ashr i64 %85, 48
  %86 = shl nsw i64 %.28.op.op.op.op.op.op.op, 1
  %87 = select i1 %83, i64 26214, i64 %86
  %88 = add nsw i64 %87, 32768
  %89 = icmp ugt i64 %88, 65535
  %90 = icmp sgt i64 %87, 0
  %91 = select i1 %90, i64 32767, i64 32768
  %92 = select i1 %89, i64 %91, i64 %87
  %93 = trunc i64 %92 to i16
  %94 = getelementptr inbounds i16, i16* %1, i64 4
  store i16 %93, i16* %70, align 2
  %95 = getelementptr inbounds i16, i16* %0, i64 5
  %96 = load i16, i16* %71, align 2
  %97 = sext i16 %96 to i64
  %98 = add nsw i64 %97, 32760
  %99 = icmp ugt i64 %98, 65535
  %100 = icmp sgt i16 %96, 8
  %101 = select i1 %100, i16 63, i16 0
  %102 = add i16 %96, 56
  %103 = select i1 %99, i16 %101, i16 %102
  %104 = shl i16 %103, 10
  %105 = sext i16 %104 to i64
  %106 = add nsw i64 %105, -188
  %107 = icmp sgt i64 %106, 32766
  %108 = icmp sgt i64 %106, -32768
  %.29 = select i1 %108, i64 %106, i64 -32768
  %.29.op = shl i64 %.29, 48
  %.29.op.op = ashr exact i64 %.29.op, 48
  %.29.op.op.op.op = mul nsw i64 %.29.op.op, 165124312662016
  %109 = add i64 %.29.op.op.op.op, 140737488355328
  %.29.op.op.op.op.op.op.op = ashr i64 %109, 48
  %110 = shl nsw i64 %.29.op.op.op.op.op.op.op, 1
  %111 = select i1 %107, i64 38444, i64 %110
  %112 = add nsw i64 %111, 32768
  %113 = icmp ugt i64 %112, 65535
  %114 = icmp sgt i64 %111, 0
  %115 = select i1 %114, i64 32767, i64 32768
  %116 = select i1 %113, i64 %115, i64 %111
  %117 = trunc i64 %116 to i16
  %118 = getelementptr inbounds i16, i16* %1, i64 5
  store i16 %117, i16* %94, align 2
  %119 = getelementptr inbounds i16, i16* %0, i64 6
  %120 = load i16, i16* %95, align 2
  %121 = sext i16 %120 to i64
  %122 = add nsw i64 %121, 32760
  %123 = icmp ugt i64 %122, 65535
  %124 = icmp sgt i16 %120, 8
  %125 = select i1 %124, i16 63, i16 0
  %126 = add i16 %120, 56
  %127 = select i1 %123, i16 %125, i16 %126
  %128 = shl i16 %127, 10
  %129 = sext i16 %128 to i64
  %130 = add nsw i64 %129, 3584
  %131 = icmp sgt i64 %130, 32766
  %132 = icmp sgt i64 %130, -32768
  %.30 = select i1 %132, i64 %130, i64 -32768
  %.30.op = shl i64 %.30, 48
  %.30.op.op = ashr exact i64 %.30.op, 48
  %.30.op.op.op.op = mul nsw i64 %.30.op.op, 150117696929792
  %133 = add i64 %.30.op.op.op.op, 140737488355328
  %.30.op.op.op.op.op.op.op = ashr i64 %133, 48
  %134 = shl nsw i64 %.30.op.op.op.op.op.op.op, 1
  %135 = select i1 %131, i64 34950, i64 %134
  %136 = add nsw i64 %135, 32768
  %137 = icmp ugt i64 %136, 65535
  %138 = icmp sgt i64 %135, 0
  %139 = select i1 %138, i64 32767, i64 32768
  %140 = select i1 %137, i64 %139, i64 %135
  %141 = trunc i64 %140 to i16
  %142 = getelementptr inbounds i16, i16* %1, i64 6
  store i16 %141, i16* %118, align 2
  %143 = getelementptr inbounds i16, i16* %0, i64 7
  %144 = load i16, i16* %119, align 2
  %145 = sext i16 %144 to i64
  %146 = add nsw i64 %145, 32764
  %147 = icmp ugt i64 %146, 65535
  %148 = icmp sgt i16 %144, 4
  %149 = select i1 %148, i16 63, i16 0
  %150 = add i16 %144, 60
  %151 = select i1 %147, i16 %149, i16 %150
  %152 = shl i16 %151, 10
  %153 = sext i16 %152 to i64
  %154 = or i64 %153, 682
  %155 = icmp sgt i64 %154, 32766
  %156 = icmp sgt i64 %154, -32768
  %.31 = select i1 %156, i64 %154, i64 -32768
  %.31.op.op = mul nsw i64 %.31, 270187802656768
  %157 = add i64 %.31.op.op, 140737488355328
  %.31.op.op.op.op.op = ashr i64 %157, 48
  %158 = shl nsw i64 %.31.op.op.op.op.op, 1
  %159 = select i1 %155, i64 62906, i64 %158
  %160 = add nsw i64 %159, 32768
  %161 = icmp ugt i64 %160, 65535
  %162 = icmp sgt i64 %159, 0
  %163 = select i1 %162, i64 32767, i64 32768
  %164 = select i1 %161, i64 %163, i64 %159
  %165 = trunc i64 %164 to i16
  %166 = getelementptr inbounds i16, i16* %1, i64 7
  store i16 %165, i16* %142, align 2
  %167 = load i16, i16* %143, align 2
  %168 = sext i16 %167 to i64
  %169 = add nsw i64 %168, 32764
  %170 = icmp ugt i64 %169, 65535
  %171 = icmp sgt i16 %167, 4
  %172 = select i1 %171, i16 63, i16 0
  %173 = add i16 %167, 60
  %174 = select i1 %170, i16 %172, i16 %173
  %175 = shl i16 %174, 10
  %176 = sext i16 %175 to i64
  %177 = add nsw i64 %176, 2288
  %178 = icmp sgt i64 %177, 32766
  %179 = icmp sgt i64 %177, -32768
  %.32 = select i1 %179, i64 %177, i64 -32768
  %.32.op = shl i64 %.32, 48
  %.32.op.op = ashr exact i64 %.32.op, 48
  %.32.op.op.op.op = mul nsw i64 %.32.op.op, 255189776859136
  %180 = add i64 %.32.op.op.op.op, 140737488355328
  %.32.op.op.op.op.op.op.op = ashr i64 %180, 48
  %181 = shl nsw i64 %.32.op.op.op.op.op.op.op, 1
  %182 = select i1 %178, i64 59414, i64 %181
  %183 = add nsw i64 %182, 32768
  %184 = icmp ugt i64 %183, 65535
  %185 = icmp sgt i64 %182, 0
  %186 = select i1 %185, i64 32767, i64 32768
  %187 = select i1 %184, i64 %186, i64 %182
  %188 = trunc i64 %187 to i16
  store i16 %188, i16* %166, align 2
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @Coefficients_0_12(i16* nocapture readonly, i16* nocapture readonly, i16* nocapture) unnamed_addr #0 {
  br label %4

; <label>:4:                                      ; preds = %4, %3
  %.07 = phi i16* [ %0, %3 ], [ %31, %4 ]
  %.016 = phi i16* [ %1, %3 ], [ %32, %4 ]
  %.025 = phi i16* [ %2, %3 ], [ %30, %4 ]
  %.034 = phi i32 [ 1, %3 ], [ %29, %4 ]
  %5 = load i16, i16* %.07, align 2
  %6 = sext i16 %5 to i32
  %7 = ashr i32 %6, 2
  %8 = load i16, i16* %.016, align 2
  %9 = sext i16 %8 to i32
  %10 = ashr i32 %9, 2
  %addconv = add nsw i32 %10, %7
  %11 = sext i32 %addconv to i64
  %12 = add nsw i64 %11, 32768
  %13 = icmp ugt i64 %12, 65535
  %14 = icmp sgt i32 %addconv, 0
  %15 = select i1 %14, i64 32767, i64 -32768
  %16 = select i1 %13, i64 %15, i64 %11
  %17 = trunc i64 %16 to i16
  store i16 %17, i16* %.025, align 2
  %18 = load i16, i16* %.07, align 2
  %19 = sext i16 %18 to i32
  %20 = ashr i32 %19, 1
  %21 = sext i32 %20 to i64
  %22 = add nsw i64 %16, %21
  %23 = add nsw i64 %22, 32768
  %24 = icmp ugt i64 %23, 65535
  %25 = icmp sgt i64 %22, 0
  %26 = select i1 %25, i64 32767, i64 32768
  %27 = select i1 %24, i64 %26, i64 %22
  %28 = trunc i64 %27 to i16
  store i16 %28, i16* %.025, align 2
  %29 = add nuw nsw i32 %.034, 1
  %30 = getelementptr inbounds i16, i16* %.025, i64 1
  %31 = getelementptr inbounds i16, i16* %.07, i64 1
  %32 = getelementptr inbounds i16, i16* %.016, i64 1
  %exitcond = icmp eq i32 %29, 9
  br i1 %exitcond, label %33, label %4

; <label>:33:                                     ; preds = %4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @LARp_to_rp(i16* nocapture) unnamed_addr #0 {
  br label %2

; <label>:2:                                      ; preds = %51, %1
  %.05 = phi i16* [ %0, %1 ], [ %53, %51 ]
  %.014 = phi i32 [ 1, %1 ], [ %52, %51 ]
  %3 = load i16, i16* %.05, align 2
  %4 = icmp slt i16 %3, 0
  br i1 %4, label %5, label %31

; <label>:5:                                      ; preds = %2
  %6 = icmp eq i16 %3, -32768
  %7 = sub i16 0, %3
  br i1 %6, label %.thread3, label %8

; <label>:8:                                      ; preds = %5
  %9 = icmp slt i16 %7, 11059
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %8
  %11 = sext i16 %7 to i32
  %12 = shl nsw i32 %11, 1
  %13 = sext i32 %12 to i64
  br label %28

; <label>:14:                                     ; preds = %8
  %15 = icmp slt i16 %7, 20070
  br i1 %15, label %16, label %.thread3

; <label>:16:                                     ; preds = %14
  %17 = sext i16 %7 to i64
  %18 = add nsw i64 %17, 11059
  br label %28

.thread3:                                         ; preds = %5, %14
  %19 = phi i16 [ %7, %14 ], [ 32767, %5 ]
  %20 = sext i16 %19 to i32
  %21 = ashr i32 %20, 2
  %addconv2 = add nsw i32 %21, 26112
  %22 = sext i32 %addconv2 to i64
  %23 = add nsw i64 %22, 32768
  %24 = icmp ugt i64 %23, 65535
  %25 = icmp sgt i32 %21, -26112
  %26 = select i1 %25, i64 32767, i64 -32768
  %27 = select i1 %24, i64 %26, i64 %22
  br label %28

; <label>:28:                                     ; preds = %16, %.thread3, %10
  %29 = phi i64 [ %13, %10 ], [ %18, %16 ], [ %27, %.thread3 ]
  %30 = sub nsw i64 0, %29
  br label %51

; <label>:31:                                     ; preds = %2
  %32 = icmp slt i16 %3, 11059
  br i1 %32, label %33, label %37

; <label>:33:                                     ; preds = %31
  %34 = sext i16 %3 to i32
  %35 = shl nsw i32 %34, 1
  %36 = sext i32 %35 to i64
  br label %51

; <label>:37:                                     ; preds = %31
  %38 = icmp slt i16 %3, 20070
  br i1 %38, label %39, label %42

; <label>:39:                                     ; preds = %37
  %40 = sext i16 %3 to i64
  %41 = add nsw i64 %40, 11059
  br label %51

; <label>:42:                                     ; preds = %37
  %43 = sext i16 %3 to i32
  %44 = ashr i32 %43, 2
  %addconv = add nsw i32 %44, 26112
  %45 = sext i32 %addconv to i64
  %46 = add nsw i64 %45, 32768
  %47 = icmp ugt i64 %46, 65535
  %48 = icmp sgt i32 %44, -26112
  %49 = select i1 %48, i64 32767, i64 -32768
  %50 = select i1 %47, i64 %49, i64 %45
  br label %51

; <label>:51:                                     ; preds = %33, %42, %39, %28
  %storemerge.in = phi i64 [ %30, %28 ], [ %36, %33 ], [ %41, %39 ], [ %50, %42 ]
  %storemerge = trunc i64 %storemerge.in to i16
  store i16 %storemerge, i16* %.05, align 2
  %52 = add nuw nsw i32 %.014, 1
  %53 = getelementptr inbounds i16, i16* %.05, i64 1
  %exitcond = icmp eq i32 %52, 9
  br i1 %exitcond, label %54, label %2

; <label>:54:                                     ; preds = %51
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @Short_term_analysis_filtering(%struct.gsm_state* nocapture, i16* nocapture readonly, i32, i16* nocapture) unnamed_addr #0 {
  %5 = icmp eq i32 %2, 0
  br i1 %5, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %4
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %37
  %.in = phi i32 [ %38, %37 ], [ %2, %.lr.ph.preheader ]
  %.028 = phi i16* [ %39, %37 ], [ %3, %.lr.ph.preheader ]
  %6 = load i16, i16* %.028, align 2
  br label %7

; <label>:7:                                      ; preds = %7, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %7 ]
  %.07 = phi i16 [ %6, %.lr.ph ], [ %25, %7 ]
  %.045 = phi i16 [ %6, %.lr.ph ], [ %36, %7 ]
  %8 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 4, i64 %indvars.iv
  %9 = load i16, i16* %8, align 2
  %10 = getelementptr inbounds i16, i16* %1, i64 %indvars.iv
  %11 = load i16, i16* %10, align 2
  store i16 %.07, i16* %8, align 2
  %12 = sext i16 %11 to i64
  %13 = sext i16 %.045 to i64
  %14 = sext i16 %9 to i64
  %15 = shl nsw i64 %13, 33
  %16 = mul i64 %15, %12
  %17 = add i64 %16, 140737488355328
  %18 = ashr i64 %17, 48
  %19 = add nsw i64 %18, %14
  %20 = add nsw i64 %19, 32768
  %21 = icmp ugt i64 %20, 65535
  %22 = icmp sgt i64 %19, 0
  %23 = select i1 %22, i64 32767, i64 32768
  %24 = select i1 %21, i64 %23, i64 %19
  %25 = trunc i64 %24 to i16
  %26 = shl nsw i64 %14, 33
  %27 = mul i64 %26, %12
  %28 = add i64 %27, 140737488355328
  %29 = ashr i64 %28, 48
  %30 = add nsw i64 %29, %13
  %31 = add nsw i64 %30, 32768
  %32 = icmp ugt i64 %31, 65535
  %33 = icmp sgt i64 %30, 0
  %34 = select i1 %33, i64 32767, i64 32768
  %35 = select i1 %32, i64 %34, i64 %30
  %36 = trunc i64 %35 to i16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond, label %37, label %7

; <label>:37:                                     ; preds = %7
  %38 = add nsw i32 %.in, -1
  store i16 %36, i16* %.028, align 2
  %39 = getelementptr inbounds i16, i16* %.028, i64 1
  %40 = icmp eq i32 %38, 0
  br i1 %40, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %37
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @Coefficients_13_26(i16* nocapture readonly, i16* nocapture readonly, i16* nocapture) unnamed_addr #0 {
  %4 = load i16, i16* %0, align 2
  %5 = sext i16 %4 to i32
  %6 = ashr i32 %5, 1
  %7 = load i16, i16* %1, align 2
  %8 = sext i16 %7 to i32
  %9 = ashr i32 %8, 1
  %addconv = add nsw i32 %9, %6
  %10 = sext i32 %addconv to i64
  %11 = add nsw i64 %10, 32768
  %12 = icmp ugt i64 %11, 65535
  %13 = icmp sgt i32 %addconv, 0
  %14 = select i1 %13, i64 32767, i64 32768
  %15 = select i1 %12, i64 %14, i64 %10
  %16 = trunc i64 %15 to i16
  store i16 %16, i16* %2, align 2
  %17 = getelementptr inbounds i16, i16* %0, i64 1
  %18 = getelementptr inbounds i16, i16* %1, i64 1
  %19 = getelementptr inbounds i16, i16* %2, i64 1
  %20 = load i16, i16* %17, align 2
  %21 = sext i16 %20 to i32
  %22 = ashr i32 %21, 1
  %23 = load i16, i16* %18, align 2
  %24 = sext i16 %23 to i32
  %25 = ashr i32 %24, 1
  %addconv.1 = add nsw i32 %25, %22
  %26 = sext i32 %addconv.1 to i64
  %27 = add nsw i64 %26, 32768
  %28 = icmp ugt i64 %27, 65535
  %29 = icmp sgt i32 %addconv.1, 0
  %30 = select i1 %29, i64 32767, i64 32768
  %31 = select i1 %28, i64 %30, i64 %26
  %32 = trunc i64 %31 to i16
  store i16 %32, i16* %19, align 2
  %33 = getelementptr inbounds i16, i16* %0, i64 2
  %34 = getelementptr inbounds i16, i16* %1, i64 2
  %35 = getelementptr inbounds i16, i16* %2, i64 2
  %36 = load i16, i16* %33, align 2
  %37 = sext i16 %36 to i32
  %38 = ashr i32 %37, 1
  %39 = load i16, i16* %34, align 2
  %40 = sext i16 %39 to i32
  %41 = ashr i32 %40, 1
  %addconv.2 = add nsw i32 %41, %38
  %42 = sext i32 %addconv.2 to i64
  %43 = add nsw i64 %42, 32768
  %44 = icmp ugt i64 %43, 65535
  %45 = icmp sgt i32 %addconv.2, 0
  %46 = select i1 %45, i64 32767, i64 32768
  %47 = select i1 %44, i64 %46, i64 %42
  %48 = trunc i64 %47 to i16
  store i16 %48, i16* %35, align 2
  %49 = getelementptr inbounds i16, i16* %0, i64 3
  %50 = getelementptr inbounds i16, i16* %1, i64 3
  %51 = getelementptr inbounds i16, i16* %2, i64 3
  %52 = load i16, i16* %49, align 2
  %53 = sext i16 %52 to i32
  %54 = ashr i32 %53, 1
  %55 = load i16, i16* %50, align 2
  %56 = sext i16 %55 to i32
  %57 = ashr i32 %56, 1
  %addconv.3 = add nsw i32 %57, %54
  %58 = sext i32 %addconv.3 to i64
  %59 = add nsw i64 %58, 32768
  %60 = icmp ugt i64 %59, 65535
  %61 = icmp sgt i32 %addconv.3, 0
  %62 = select i1 %61, i64 32767, i64 32768
  %63 = select i1 %60, i64 %62, i64 %58
  %64 = trunc i64 %63 to i16
  store i16 %64, i16* %51, align 2
  %65 = getelementptr inbounds i16, i16* %0, i64 4
  %66 = getelementptr inbounds i16, i16* %1, i64 4
  %67 = getelementptr inbounds i16, i16* %2, i64 4
  %68 = load i16, i16* %65, align 2
  %69 = sext i16 %68 to i32
  %70 = ashr i32 %69, 1
  %71 = load i16, i16* %66, align 2
  %72 = sext i16 %71 to i32
  %73 = ashr i32 %72, 1
  %addconv.4 = add nsw i32 %73, %70
  %74 = sext i32 %addconv.4 to i64
  %75 = add nsw i64 %74, 32768
  %76 = icmp ugt i64 %75, 65535
  %77 = icmp sgt i32 %addconv.4, 0
  %78 = select i1 %77, i64 32767, i64 32768
  %79 = select i1 %76, i64 %78, i64 %74
  %80 = trunc i64 %79 to i16
  store i16 %80, i16* %67, align 2
  %81 = getelementptr inbounds i16, i16* %0, i64 5
  %82 = getelementptr inbounds i16, i16* %1, i64 5
  %83 = getelementptr inbounds i16, i16* %2, i64 5
  %84 = load i16, i16* %81, align 2
  %85 = sext i16 %84 to i32
  %86 = ashr i32 %85, 1
  %87 = load i16, i16* %82, align 2
  %88 = sext i16 %87 to i32
  %89 = ashr i32 %88, 1
  %addconv.5 = add nsw i32 %89, %86
  %90 = sext i32 %addconv.5 to i64
  %91 = add nsw i64 %90, 32768
  %92 = icmp ugt i64 %91, 65535
  %93 = icmp sgt i32 %addconv.5, 0
  %94 = select i1 %93, i64 32767, i64 32768
  %95 = select i1 %92, i64 %94, i64 %90
  %96 = trunc i64 %95 to i16
  store i16 %96, i16* %83, align 2
  %97 = getelementptr inbounds i16, i16* %0, i64 6
  %98 = getelementptr inbounds i16, i16* %1, i64 6
  %99 = getelementptr inbounds i16, i16* %2, i64 6
  %100 = load i16, i16* %97, align 2
  %101 = sext i16 %100 to i32
  %102 = ashr i32 %101, 1
  %103 = load i16, i16* %98, align 2
  %104 = sext i16 %103 to i32
  %105 = ashr i32 %104, 1
  %addconv.6 = add nsw i32 %105, %102
  %106 = sext i32 %addconv.6 to i64
  %107 = add nsw i64 %106, 32768
  %108 = icmp ugt i64 %107, 65535
  %109 = icmp sgt i32 %addconv.6, 0
  %110 = select i1 %109, i64 32767, i64 32768
  %111 = select i1 %108, i64 %110, i64 %106
  %112 = trunc i64 %111 to i16
  store i16 %112, i16* %99, align 2
  %113 = getelementptr inbounds i16, i16* %0, i64 7
  %114 = getelementptr inbounds i16, i16* %1, i64 7
  %115 = getelementptr inbounds i16, i16* %2, i64 7
  %116 = load i16, i16* %113, align 2
  %117 = sext i16 %116 to i32
  %118 = ashr i32 %117, 1
  %119 = load i16, i16* %114, align 2
  %120 = sext i16 %119 to i32
  %121 = ashr i32 %120, 1
  %addconv.7 = add nsw i32 %121, %118
  %122 = sext i32 %addconv.7 to i64
  %123 = add nsw i64 %122, 32768
  %124 = icmp ugt i64 %123, 65535
  %125 = icmp sgt i32 %addconv.7, 0
  %126 = select i1 %125, i64 32767, i64 32768
  %127 = select i1 %124, i64 %126, i64 %122
  %128 = trunc i64 %127 to i16
  store i16 %128, i16* %115, align 2
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @Coefficients_27_39(i16* nocapture readonly, i16* nocapture readonly, i16* nocapture) unnamed_addr #0 {
  br label %4

; <label>:4:                                      ; preds = %4, %3
  %.07 = phi i16* [ %0, %3 ], [ %30, %4 ]
  %.016 = phi i16* [ %1, %3 ], [ %31, %4 ]
  %.025 = phi i16* [ %2, %3 ], [ %32, %4 ]
  %.034 = phi i32 [ 1, %3 ], [ %29, %4 ]
  %5 = load i16, i16* %.07, align 2
  %6 = sext i16 %5 to i32
  %7 = ashr i32 %6, 2
  %8 = load i16, i16* %.016, align 2
  %9 = sext i16 %8 to i32
  %10 = ashr i32 %9, 2
  %addconv = add nsw i32 %10, %7
  %11 = sext i32 %addconv to i64
  %12 = add nsw i64 %11, 32768
  %13 = icmp ugt i64 %12, 65535
  %14 = icmp sgt i32 %addconv, 0
  %15 = select i1 %14, i64 32767, i64 -32768
  %16 = select i1 %13, i64 %15, i64 %11
  %17 = trunc i64 %16 to i16
  store i16 %17, i16* %.025, align 2
  %18 = load i16, i16* %.016, align 2
  %19 = sext i16 %18 to i32
  %20 = ashr i32 %19, 1
  %21 = sext i32 %20 to i64
  %22 = add nsw i64 %16, %21
  %23 = add nsw i64 %22, 32768
  %24 = icmp ugt i64 %23, 65535
  %25 = icmp sgt i64 %22, 0
  %26 = select i1 %25, i64 32767, i64 32768
  %27 = select i1 %24, i64 %26, i64 %22
  %28 = trunc i64 %27 to i16
  store i16 %28, i16* %.025, align 2
  %29 = add nuw nsw i32 %.034, 1
  %30 = getelementptr inbounds i16, i16* %.07, i64 1
  %31 = getelementptr inbounds i16, i16* %.016, i64 1
  %32 = getelementptr inbounds i16, i16* %.025, i64 1
  %exitcond = icmp eq i32 %29, 9
  br i1 %exitcond, label %33, label %4

; <label>:33:                                     ; preds = %4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @Coefficients_40_159(i16* nocapture readonly, i16* nocapture) unnamed_addr #0 {
  %3 = load i16, i16* %0, align 2
  store i16 %3, i16* %1, align 2
  %4 = getelementptr inbounds i16, i16* %1, i64 1
  %5 = getelementptr inbounds i16, i16* %0, i64 1
  %6 = load i16, i16* %5, align 2
  store i16 %6, i16* %4, align 2
  %7 = getelementptr inbounds i16, i16* %1, i64 2
  %8 = getelementptr inbounds i16, i16* %0, i64 2
  %9 = load i16, i16* %8, align 2
  store i16 %9, i16* %7, align 2
  %10 = getelementptr inbounds i16, i16* %1, i64 3
  %11 = getelementptr inbounds i16, i16* %0, i64 3
  %12 = load i16, i16* %11, align 2
  store i16 %12, i16* %10, align 2
  %13 = getelementptr inbounds i16, i16* %1, i64 4
  %14 = getelementptr inbounds i16, i16* %0, i64 4
  %15 = load i16, i16* %14, align 2
  store i16 %15, i16* %13, align 2
  %16 = getelementptr inbounds i16, i16* %1, i64 5
  %17 = getelementptr inbounds i16, i16* %0, i64 5
  %18 = load i16, i16* %17, align 2
  store i16 %18, i16* %16, align 2
  %19 = getelementptr inbounds i16, i16* %1, i64 6
  %20 = getelementptr inbounds i16, i16* %0, i64 6
  %21 = load i16, i16* %20, align 2
  store i16 %21, i16* %19, align 2
  %22 = getelementptr inbounds i16, i16* %1, i64 7
  %23 = getelementptr inbounds i16, i16* %0, i64 7
  %24 = load i16, i16* %23, align 2
  store i16 %24, i16* %22, align 2
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @Gsm_Short_Term_Synthesis_Filter(%struct.gsm_state* nocapture, i16* nocapture readonly, i16* nocapture readonly, i16* nocapture) local_unnamed_addr #0 {
  %5 = alloca [8 x i16], align 16
  %6 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 6
  %7 = load i16, i16* %6, align 4
  %8 = sext i16 %7 to i64
  %9 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 5, i64 %8, i64 0
  %10 = xor i16 %7, 1
  store i16 %10, i16* %6, align 4
  %11 = sext i16 %10 to i64
  %12 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 5, i64 %11, i64 0
  tail call fastcc void @Decoding_of_the_coded_Log_Area_Ratios(i16* %1, i16* %9)
  %13 = getelementptr inbounds [8 x i16], [8 x i16]* %5, i64 0, i64 0
  call fastcc void @Coefficients_0_12(i16* %12, i16* %9, i16* nonnull %13)
  call fastcc void @LARp_to_rp(i16* nonnull %13)
  call fastcc void @Short_term_synthesis_filtering(%struct.gsm_state* %0, i16* nonnull %13, i32 13, i16* %2, i16* %3)
  call fastcc void @Coefficients_13_26(i16* %12, i16* %9, i16* nonnull %13)
  call fastcc void @LARp_to_rp(i16* nonnull %13)
  %14 = getelementptr inbounds i16, i16* %2, i64 13
  %15 = getelementptr inbounds i16, i16* %3, i64 13
  call fastcc void @Short_term_synthesis_filtering(%struct.gsm_state* %0, i16* nonnull %13, i32 14, i16* %14, i16* %15)
  call fastcc void @Coefficients_27_39(i16* %12, i16* %9, i16* nonnull %13)
  call fastcc void @LARp_to_rp(i16* nonnull %13)
  %16 = getelementptr inbounds i16, i16* %2, i64 27
  %17 = getelementptr inbounds i16, i16* %3, i64 27
  call fastcc void @Short_term_synthesis_filtering(%struct.gsm_state* %0, i16* nonnull %13, i32 13, i16* %16, i16* %17)
  call fastcc void @Coefficients_40_159(i16* %9, i16* nonnull %13)
  call fastcc void @LARp_to_rp(i16* nonnull %13)
  %18 = getelementptr inbounds i16, i16* %2, i64 40
  %19 = getelementptr inbounds i16, i16* %3, i64 40
  call fastcc void @Short_term_synthesis_filtering(%struct.gsm_state* %0, i16* nonnull %13, i32 120, i16* %18, i16* %19)
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @Short_term_synthesis_filtering(%struct.gsm_state* nocapture, i16* nocapture readonly, i32, i16* nocapture readonly, i16* nocapture) unnamed_addr #0 {
  %6 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 8, i64 0
  %7 = icmp eq i32 %2, 0
  br i1 %7, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %5
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %47
  %.in = phi i32 [ %8, %47 ], [ %2, %.lr.ph.preheader ]
  %.0113 = phi i16* [ %48, %47 ], [ %3, %.lr.ph.preheader ]
  %.0212 = phi i16* [ %49, %47 ], [ %4, %.lr.ph.preheader ]
  %8 = add nsw i32 %.in, -1
  %9 = load i16, i16* %.0113, align 2
  br label %10

; <label>:10:                                     ; preds = %.lr.ph, %10
  %indvars.iv14 = phi i64 [ 8, %.lr.ph ], [ %indvars.iv.next15, %10 ]
  %indvars.iv = phi i64 [ 7, %.lr.ph ], [ %indvars.iv.next, %10 ]
  %.0410 = phi i16 [ %9, %.lr.ph ], [ %28, %10 ]
  %11 = getelementptr inbounds i16, i16* %1, i64 %indvars.iv
  %12 = load i16, i16* %11, align 2
  %13 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 8, i64 %indvars.iv
  %14 = load i16, i16* %13, align 2
  %15 = icmp eq i16 %12, -32768
  %16 = icmp eq i16 %14, -32768
  %or.cond = and i1 %15, %16
  %17 = sext i16 %12 to i64
  %18 = sext i16 %14 to i64
  %19 = mul nsw i64 %18, %17
  %20 = add nsw i64 %19, 16384
  %21 = lshr i64 %20, 15
  %22 = sext i16 %.0410 to i64
  %.op = shl i64 %21, 48
  %.op.op = ashr exact i64 %.op, 48
  %23 = select i1 %or.cond, i64 32767, i64 %.op.op
  %24 = sub nsw i64 %22, %23
  %25 = icmp sgt i64 %24, 32766
  %26 = icmp sgt i64 %24, -32768
  %. = select i1 %26, i64 %24, i64 -32768
  %27 = select i1 %25, i64 32767, i64 %.
  %28 = trunc i64 %27 to i16
  %29 = icmp eq i16 %28, -32768
  %or.cond7 = and i1 %15, %29
  %30 = sext i16 %12 to i64
  %sext5 = shl i64 %27, 48
  %31 = ashr exact i64 %sext5, 48
  %32 = mul nsw i64 %31, %30
  %33 = add nsw i64 %32, 16384
  %34 = lshr i64 %33, 15
  %35 = load i16, i16* %13, align 2
  %36 = sext i16 %35 to i64
  %.op9 = shl i64 %34, 48
  %.op9.op = ashr exact i64 %.op9, 48
  %37 = select i1 %or.cond7, i64 32767, i64 %.op9.op
  %38 = add nsw i64 %37, %36
  %39 = add nsw i64 %38, 32768
  %40 = icmp ugt i64 %39, 65535
  %41 = icmp sgt i64 %38, 0
  %42 = select i1 %41, i64 32767, i64 32768
  %43 = select i1 %40, i64 %42, i64 %38
  %44 = trunc i64 %43 to i16
  %45 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 8, i64 %indvars.iv14
  store i16 %44, i16* %45, align 2
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %46 = icmp eq i64 %indvars.iv, 0
  %indvars.iv.next15 = add nsw i64 %indvars.iv14, -1
  br i1 %46, label %47, label %10

; <label>:47:                                     ; preds = %10
  %48 = getelementptr inbounds i16, i16* %.0113, i64 1
  store i16 %28, i16* %6, align 2
  %49 = getelementptr inbounds i16, i16* %.0212, i64 1
  store i16 %28, i16* %.0212, align 2
  %50 = icmp eq i32 %8, 0
  br i1 %50, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %47
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  ret void
}

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
