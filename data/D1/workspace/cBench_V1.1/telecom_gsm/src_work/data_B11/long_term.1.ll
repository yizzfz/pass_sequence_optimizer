; ModuleID = 'long_term.ll'
source_filename = "long_term.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

@.str = private unnamed_addr constant [2 x i8] c"d\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"long_term.c\00", align 1
@__PRETTY_FUNCTION__.Gsm_Long_Term_Predictor = private unnamed_addr constant [97 x i8] c"void Gsm_Long_Term_Predictor(struct gsm_state *, word *, word *, word *, word *, word *, word *)\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"dp\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"e\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"dpp\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"Nc\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"bc\00", align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"Nr >= 40 && Nr <= 120\00", align 1
@__PRETTY_FUNCTION__.Gsm_Long_Term_Synthesis_Filtering = private unnamed_addr constant [87 x i8] c"void Gsm_Long_Term_Synthesis_Filtering(struct gsm_state *, word, word, word *, word *)\00", align 1
@gsm_QLB = external local_unnamed_addr global [4 x i16], align 2
@.str.8 = private unnamed_addr constant [16 x i8] c"brp != MIN_WORD\00", align 1
@.str.9 = private unnamed_addr constant [9 x i8] c"dmax > 0\00", align 1
@__PRETTY_FUNCTION__.Calculation_of_the_LTP_parameters = private unnamed_addr constant [71 x i8] c"void Calculation_of_the_LTP_parameters(word *, word *, word *, word *)\00", align 1
@.str.10 = private unnamed_addr constant [10 x i8] c"scal >= 0\00", align 1
@.str.11 = private unnamed_addr constant [28 x i8] c"scal <= 100 && scal >= -100\00", align 1
@.str.12 = private unnamed_addr constant [22 x i8] c"Nc <= 120 && Nc >= 40\00", align 1
@gsm_DLB = external local_unnamed_addr global [4 x i16], align 2

; Function Attrs: noinline nounwind uwtable
define void @Gsm_Long_Term_Predictor(%struct.gsm_state* nocapture readnone, i16* readonly, i16* readonly, i16*, i16*, i16*, i16*) local_unnamed_addr #0 {
  %8 = icmp eq i16* %1, null
  br i1 %8, label %9, label %10

; <label>:9:                                      ; preds = %7
  tail call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 545, i8* getelementptr inbounds ([97 x i8], [97 x i8]* @__PRETTY_FUNCTION__.Gsm_Long_Term_Predictor, i64 0, i64 0)) #4
  unreachable

; <label>:10:                                     ; preds = %7
  %11 = icmp eq i16* %2, null
  br i1 %11, label %12, label %13

; <label>:12:                                     ; preds = %10
  tail call void @__assert_fail(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 545, i8* getelementptr inbounds ([97 x i8], [97 x i8]* @__PRETTY_FUNCTION__.Gsm_Long_Term_Predictor, i64 0, i64 0)) #4
  unreachable

; <label>:13:                                     ; preds = %10
  %14 = icmp eq i16* %3, null
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %13
  tail call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 545, i8* getelementptr inbounds ([97 x i8], [97 x i8]* @__PRETTY_FUNCTION__.Gsm_Long_Term_Predictor, i64 0, i64 0)) #4
  unreachable

; <label>:16:                                     ; preds = %13
  %17 = icmp eq i16* %4, null
  br i1 %17, label %18, label %19

; <label>:18:                                     ; preds = %16
  tail call void @__assert_fail(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 546, i8* getelementptr inbounds ([97 x i8], [97 x i8]* @__PRETTY_FUNCTION__.Gsm_Long_Term_Predictor, i64 0, i64 0)) #4
  unreachable

; <label>:19:                                     ; preds = %16
  %20 = icmp eq i16* %5, null
  br i1 %20, label %21, label %22

; <label>:21:                                     ; preds = %19
  tail call void @__assert_fail(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 546, i8* getelementptr inbounds ([97 x i8], [97 x i8]* @__PRETTY_FUNCTION__.Gsm_Long_Term_Predictor, i64 0, i64 0)) #4
  unreachable

; <label>:22:                                     ; preds = %19
  %23 = icmp eq i16* %6, null
  br i1 %23, label %24, label %25

; <label>:24:                                     ; preds = %22
  tail call void @__assert_fail(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 546, i8* getelementptr inbounds ([97 x i8], [97 x i8]* @__PRETTY_FUNCTION__.Gsm_Long_Term_Predictor, i64 0, i64 0)) #4
  unreachable

; <label>:25:                                     ; preds = %22
  tail call fastcc void @Calculation_of_the_LTP_parameters(i16* nonnull %1, i16* nonnull %2, i16* nonnull %6, i16* nonnull %5)
  %26 = load i16, i16* %6, align 2
  %27 = load i16, i16* %5, align 2
  tail call fastcc void @Long_term_analysis_filtering(i16 signext %26, i16 signext %27, i16* nonnull %2, i16* nonnull %1, i16* nonnull %4, i16* nonnull %3)
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @Calculation_of_the_LTP_parameters(i16* nocapture readonly, i16* readonly, i16* nocapture, i16* nocapture) unnamed_addr #0 {
  %5 = alloca [40 x i16], align 16
  br label %6

; <label>:6:                                      ; preds = %6, %4
  %indvars.iv70 = phi i64 [ 0, %4 ], [ %indvars.iv.next71.1, %6 ]
  %.0264 = phi i16 [ 0, %4 ], [ %..02.1, %6 ]
  %7 = getelementptr inbounds i16, i16* %0, i64 %indvars.iv70
  %8 = load i16, i16* %7, align 2
  %9 = icmp slt i16 %8, 0
  %10 = icmp eq i16 %8, -32768
  %11 = sub i16 0, %8
  %12 = select i1 %10, i16 32767, i16 %11
  %. = select i1 %9, i16 %12, i16 %8
  %13 = icmp sgt i16 %., %.0264
  %..02 = select i1 %13, i16 %., i16 %.0264
  %indvars.iv.next71 = or i64 %indvars.iv70, 1
  %14 = getelementptr inbounds i16, i16* %0, i64 %indvars.iv.next71
  %15 = load i16, i16* %14, align 2
  %16 = icmp slt i16 %15, 0
  %17 = icmp eq i16 %15, -32768
  %18 = sub i16 0, %15
  %19 = select i1 %17, i16 32767, i16 %18
  %..1 = select i1 %16, i16 %19, i16 %15
  %20 = icmp sgt i16 %..1, %..02
  %..02.1 = select i1 %20, i16 %..1, i16 %..02
  %indvars.iv.next71.1 = add nsw i64 %indvars.iv70, 2
  %exitcond72.1 = icmp eq i64 %indvars.iv.next71.1, 40
  br i1 %exitcond72.1, label %21, label %6

; <label>:21:                                     ; preds = %6
  %22 = icmp eq i16 %..02.1, 0
  br i1 %22, label %30, label %23

; <label>:23:                                     ; preds = %21
  %24 = icmp sgt i16 %..02.1, 0
  br i1 %24, label %26, label %25

; <label>:25:                                     ; preds = %23
  tail call void @__assert_fail(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 101, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @__PRETTY_FUNCTION__.Calculation_of_the_LTP_parameters, i64 0, i64 0)) #4
  unreachable

; <label>:26:                                     ; preds = %23
  %27 = sext i16 %..02.1 to i64
  %28 = shl nsw i64 %27, 16
  %29 = tail call signext i16 @gsm_norm(i64 %28) #5
  br label %30

; <label>:30:                                     ; preds = %21, %26
  %.0 = phi i16 [ %29, %26 ], [ 0, %21 ]
  %31 = icmp sgt i16 %.0, 6
  %32 = sub i16 6, %.0
  %.01 = select i1 %31, i16 0, i16 %32
  %33 = icmp sgt i16 %.01, -1
  br i1 %33, label %.preheader55, label %35

.preheader55:                                     ; preds = %30
  %34 = sext i16 %.01 to i32
  br label %.preheader5478

; <label>:35:                                     ; preds = %30
  tail call void @__assert_fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 108, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @__PRETTY_FUNCTION__.Calculation_of_the_LTP_parameters, i64 0, i64 0)) #4
  unreachable

.preheader5478:                                   ; preds = %.preheader55
  %36 = load i16, i16* %0, align 2
  %37 = sext i16 %36 to i32
  %38 = ashr i32 %37, %34
  %39 = trunc i32 %38 to i16
  %40 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 0
  store i16 %39, i16* %40, align 16
  %41 = getelementptr inbounds i16, i16* %0, i64 1
  %42 = load i16, i16* %41, align 2
  %43 = sext i16 %42 to i32
  %44 = ashr i32 %43, %34
  %45 = trunc i32 %44 to i16
  %46 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 1
  store i16 %45, i16* %46, align 2
  %47 = getelementptr inbounds i16, i16* %0, i64 2
  %48 = load i16, i16* %47, align 2
  %49 = sext i16 %48 to i32
  %50 = ashr i32 %49, %34
  %51 = trunc i32 %50 to i16
  %52 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 2
  store i16 %51, i16* %52, align 4
  %53 = getelementptr inbounds i16, i16* %0, i64 3
  %54 = load i16, i16* %53, align 2
  %55 = sext i16 %54 to i32
  %56 = ashr i32 %55, %34
  %57 = trunc i32 %56 to i16
  %58 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 3
  store i16 %57, i16* %58, align 2
  %59 = getelementptr inbounds i16, i16* %0, i64 4
  %60 = load i16, i16* %59, align 2
  %61 = sext i16 %60 to i32
  %62 = ashr i32 %61, %34
  %63 = trunc i32 %62 to i16
  %64 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 4
  store i16 %63, i16* %64, align 8
  %65 = getelementptr inbounds i16, i16* %0, i64 5
  %66 = load i16, i16* %65, align 2
  %67 = sext i16 %66 to i32
  %68 = ashr i32 %67, %34
  %69 = trunc i32 %68 to i16
  %70 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 5
  store i16 %69, i16* %70, align 2
  %71 = getelementptr inbounds i16, i16* %0, i64 6
  %72 = load i16, i16* %71, align 2
  %73 = sext i16 %72 to i32
  %74 = ashr i32 %73, %34
  %75 = trunc i32 %74 to i16
  %76 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 6
  store i16 %75, i16* %76, align 4
  %77 = getelementptr inbounds i16, i16* %0, i64 7
  %78 = load i16, i16* %77, align 2
  %79 = sext i16 %78 to i32
  %80 = ashr i32 %79, %34
  %81 = trunc i32 %80 to i16
  %82 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 7
  store i16 %81, i16* %82, align 2
  %83 = getelementptr inbounds i16, i16* %0, i64 8
  %84 = load i16, i16* %83, align 2
  %85 = sext i16 %84 to i32
  %86 = ashr i32 %85, %34
  %87 = trunc i32 %86 to i16
  %88 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 8
  store i16 %87, i16* %88, align 16
  %89 = getelementptr inbounds i16, i16* %0, i64 9
  %90 = load i16, i16* %89, align 2
  %91 = sext i16 %90 to i32
  %92 = ashr i32 %91, %34
  %93 = trunc i32 %92 to i16
  %94 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 9
  store i16 %93, i16* %94, align 2
  %95 = getelementptr inbounds i16, i16* %0, i64 10
  %96 = load i16, i16* %95, align 2
  %97 = sext i16 %96 to i32
  %98 = ashr i32 %97, %34
  %99 = trunc i32 %98 to i16
  %100 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 10
  store i16 %99, i16* %100, align 4
  %101 = getelementptr inbounds i16, i16* %0, i64 11
  %102 = load i16, i16* %101, align 2
  %103 = sext i16 %102 to i32
  %104 = ashr i32 %103, %34
  %105 = trunc i32 %104 to i16
  %106 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 11
  store i16 %105, i16* %106, align 2
  %107 = getelementptr inbounds i16, i16* %0, i64 12
  %108 = load i16, i16* %107, align 2
  %109 = sext i16 %108 to i32
  %110 = ashr i32 %109, %34
  %111 = trunc i32 %110 to i16
  %112 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 12
  store i16 %111, i16* %112, align 8
  %113 = getelementptr inbounds i16, i16* %0, i64 13
  %114 = load i16, i16* %113, align 2
  %115 = sext i16 %114 to i32
  %116 = ashr i32 %115, %34
  %117 = trunc i32 %116 to i16
  %118 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 13
  store i16 %117, i16* %118, align 2
  %119 = getelementptr inbounds i16, i16* %0, i64 14
  %120 = load i16, i16* %119, align 2
  %121 = sext i16 %120 to i32
  %122 = ashr i32 %121, %34
  %123 = trunc i32 %122 to i16
  %124 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 14
  store i16 %123, i16* %124, align 4
  %125 = getelementptr inbounds i16, i16* %0, i64 15
  %126 = load i16, i16* %125, align 2
  %127 = sext i16 %126 to i32
  %128 = ashr i32 %127, %34
  %129 = trunc i32 %128 to i16
  %130 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 15
  store i16 %129, i16* %130, align 2
  %131 = getelementptr inbounds i16, i16* %0, i64 16
  %132 = load i16, i16* %131, align 2
  %133 = sext i16 %132 to i32
  %134 = ashr i32 %133, %34
  %135 = trunc i32 %134 to i16
  %136 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 16
  store i16 %135, i16* %136, align 16
  %137 = getelementptr inbounds i16, i16* %0, i64 17
  %138 = load i16, i16* %137, align 2
  %139 = sext i16 %138 to i32
  %140 = ashr i32 %139, %34
  %141 = trunc i32 %140 to i16
  %142 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 17
  store i16 %141, i16* %142, align 2
  %143 = getelementptr inbounds i16, i16* %0, i64 18
  %144 = load i16, i16* %143, align 2
  %145 = sext i16 %144 to i32
  %146 = ashr i32 %145, %34
  %147 = trunc i32 %146 to i16
  %148 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 18
  store i16 %147, i16* %148, align 4
  %149 = getelementptr inbounds i16, i16* %0, i64 19
  %150 = load i16, i16* %149, align 2
  %151 = sext i16 %150 to i32
  %152 = ashr i32 %151, %34
  %153 = trunc i32 %152 to i16
  %154 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 19
  store i16 %153, i16* %154, align 2
  %155 = getelementptr inbounds i16, i16* %0, i64 20
  %156 = load i16, i16* %155, align 2
  %157 = sext i16 %156 to i32
  %158 = ashr i32 %157, %34
  %159 = trunc i32 %158 to i16
  %160 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 20
  store i16 %159, i16* %160, align 8
  %161 = getelementptr inbounds i16, i16* %0, i64 21
  %162 = load i16, i16* %161, align 2
  %163 = sext i16 %162 to i32
  %164 = ashr i32 %163, %34
  %165 = trunc i32 %164 to i16
  %166 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 21
  store i16 %165, i16* %166, align 2
  %167 = getelementptr inbounds i16, i16* %0, i64 22
  %168 = load i16, i16* %167, align 2
  %169 = sext i16 %168 to i32
  %170 = ashr i32 %169, %34
  %171 = trunc i32 %170 to i16
  %172 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 22
  store i16 %171, i16* %172, align 4
  %173 = getelementptr inbounds i16, i16* %0, i64 23
  %174 = load i16, i16* %173, align 2
  %175 = sext i16 %174 to i32
  %176 = ashr i32 %175, %34
  %177 = trunc i32 %176 to i16
  %178 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 23
  store i16 %177, i16* %178, align 2
  %179 = getelementptr inbounds i16, i16* %0, i64 24
  %180 = load i16, i16* %179, align 2
  %181 = sext i16 %180 to i32
  %182 = ashr i32 %181, %34
  %183 = trunc i32 %182 to i16
  %184 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 24
  store i16 %183, i16* %184, align 16
  %185 = getelementptr inbounds i16, i16* %0, i64 25
  %186 = load i16, i16* %185, align 2
  %187 = sext i16 %186 to i32
  %188 = ashr i32 %187, %34
  %189 = trunc i32 %188 to i16
  %190 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 25
  store i16 %189, i16* %190, align 2
  %191 = getelementptr inbounds i16, i16* %0, i64 26
  %192 = load i16, i16* %191, align 2
  %193 = sext i16 %192 to i32
  %194 = ashr i32 %193, %34
  %195 = trunc i32 %194 to i16
  %196 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 26
  store i16 %195, i16* %196, align 4
  %197 = getelementptr inbounds i16, i16* %0, i64 27
  %198 = load i16, i16* %197, align 2
  %199 = sext i16 %198 to i32
  %200 = ashr i32 %199, %34
  %201 = trunc i32 %200 to i16
  %202 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 27
  store i16 %201, i16* %202, align 2
  %203 = getelementptr inbounds i16, i16* %0, i64 28
  %204 = load i16, i16* %203, align 2
  %205 = sext i16 %204 to i32
  %206 = ashr i32 %205, %34
  %207 = trunc i32 %206 to i16
  %208 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 28
  store i16 %207, i16* %208, align 8
  %209 = getelementptr inbounds i16, i16* %0, i64 29
  %210 = load i16, i16* %209, align 2
  %211 = sext i16 %210 to i32
  %212 = ashr i32 %211, %34
  %213 = trunc i32 %212 to i16
  %214 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 29
  store i16 %213, i16* %214, align 2
  %215 = getelementptr inbounds i16, i16* %0, i64 30
  %216 = load i16, i16* %215, align 2
  %217 = sext i16 %216 to i32
  %218 = ashr i32 %217, %34
  %219 = trunc i32 %218 to i16
  %220 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 30
  store i16 %219, i16* %220, align 4
  %221 = getelementptr inbounds i16, i16* %0, i64 31
  %222 = load i16, i16* %221, align 2
  %223 = sext i16 %222 to i32
  %224 = ashr i32 %223, %34
  %225 = trunc i32 %224 to i16
  %226 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 31
  store i16 %225, i16* %226, align 2
  %227 = getelementptr inbounds i16, i16* %0, i64 32
  %228 = load i16, i16* %227, align 2
  %229 = sext i16 %228 to i32
  %230 = ashr i32 %229, %34
  %231 = trunc i32 %230 to i16
  %232 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 32
  store i16 %231, i16* %232, align 16
  %233 = getelementptr inbounds i16, i16* %0, i64 33
  %234 = load i16, i16* %233, align 2
  %235 = sext i16 %234 to i32
  %236 = ashr i32 %235, %34
  %237 = trunc i32 %236 to i16
  %238 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 33
  store i16 %237, i16* %238, align 2
  %239 = getelementptr inbounds i16, i16* %0, i64 34
  %240 = load i16, i16* %239, align 2
  %241 = sext i16 %240 to i32
  %242 = ashr i32 %241, %34
  %243 = trunc i32 %242 to i16
  %244 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 34
  store i16 %243, i16* %244, align 4
  %245 = getelementptr inbounds i16, i16* %0, i64 35
  %246 = load i16, i16* %245, align 2
  %247 = sext i16 %246 to i32
  %248 = ashr i32 %247, %34
  %249 = trunc i32 %248 to i16
  %250 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 35
  store i16 %249, i16* %250, align 2
  %251 = getelementptr inbounds i16, i16* %0, i64 36
  %252 = load i16, i16* %251, align 2
  %253 = sext i16 %252 to i32
  %254 = ashr i32 %253, %34
  %255 = trunc i32 %254 to i16
  %256 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 36
  store i16 %255, i16* %256, align 8
  %257 = getelementptr inbounds i16, i16* %0, i64 37
  %258 = load i16, i16* %257, align 2
  %259 = sext i16 %258 to i32
  %260 = ashr i32 %259, %34
  %261 = trunc i32 %260 to i16
  %262 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 37
  store i16 %261, i16* %262, align 2
  %263 = getelementptr inbounds i16, i16* %0, i64 38
  %264 = load i16, i16* %263, align 2
  %265 = sext i16 %264 to i32
  %266 = ashr i32 %265, %34
  %267 = trunc i32 %266 to i16
  %268 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 38
  store i16 %267, i16* %268, align 4
  %269 = getelementptr inbounds i16, i16* %0, i64 39
  %270 = load i16, i16* %269, align 2
  %271 = sext i16 %270 to i32
  %272 = ashr i32 %271, %34
  %273 = trunc i32 %272 to i16
  %274 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 39
  store i16 %273, i16* %274, align 2
  %275 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 0
  %276 = load i16, i16* %275, align 16
  %277 = sext i16 %276 to i64
  %278 = shl nsw i64 %277, 32
  %279 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 1
  %280 = load i16, i16* %279, align 2
  %281 = sext i16 %280 to i64
  %282 = shl nsw i64 %281, 32
  %283 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 2
  %284 = load i16, i16* %283, align 4
  %285 = sext i16 %284 to i64
  %286 = shl nsw i64 %285, 32
  %287 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 3
  %288 = load i16, i16* %287, align 2
  %289 = sext i16 %288 to i64
  %290 = shl nsw i64 %289, 32
  %291 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 4
  %292 = load i16, i16* %291, align 8
  %293 = sext i16 %292 to i64
  %294 = shl nsw i64 %293, 32
  %295 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 5
  %296 = load i16, i16* %295, align 2
  %297 = sext i16 %296 to i64
  %298 = shl nsw i64 %297, 32
  %299 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 6
  %300 = load i16, i16* %299, align 4
  %301 = sext i16 %300 to i64
  %302 = shl nsw i64 %301, 32
  %303 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 7
  %304 = load i16, i16* %303, align 2
  %305 = sext i16 %304 to i64
  %306 = shl nsw i64 %305, 32
  %307 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 8
  %308 = load i16, i16* %307, align 16
  %309 = sext i16 %308 to i64
  %310 = shl nsw i64 %309, 32
  %311 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 9
  %312 = load i16, i16* %311, align 2
  %313 = sext i16 %312 to i64
  %314 = shl nsw i64 %313, 32
  %315 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 10
  %316 = load i16, i16* %315, align 4
  %317 = sext i16 %316 to i64
  %318 = shl nsw i64 %317, 32
  %319 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 11
  %320 = load i16, i16* %319, align 2
  %321 = sext i16 %320 to i64
  %322 = shl nsw i64 %321, 32
  %323 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 12
  %324 = load i16, i16* %323, align 8
  %325 = sext i16 %324 to i64
  %326 = shl nsw i64 %325, 32
  %327 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 13
  %328 = load i16, i16* %327, align 2
  %329 = sext i16 %328 to i64
  %330 = shl nsw i64 %329, 32
  %331 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 14
  %332 = load i16, i16* %331, align 4
  %333 = sext i16 %332 to i64
  %334 = shl nsw i64 %333, 32
  %335 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 15
  %336 = load i16, i16* %335, align 2
  %337 = sext i16 %336 to i64
  %338 = shl nsw i64 %337, 32
  %339 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 16
  %340 = load i16, i16* %339, align 16
  %341 = sext i16 %340 to i64
  %342 = shl nsw i64 %341, 32
  %343 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 17
  %344 = load i16, i16* %343, align 2
  %345 = sext i16 %344 to i64
  %346 = shl nsw i64 %345, 32
  %347 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 18
  %348 = load i16, i16* %347, align 4
  %349 = sext i16 %348 to i64
  %350 = shl nsw i64 %349, 32
  %351 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 19
  %352 = load i16, i16* %351, align 2
  %353 = sext i16 %352 to i64
  %354 = shl nsw i64 %353, 32
  %355 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 20
  %356 = load i16, i16* %355, align 8
  %357 = sext i16 %356 to i64
  %358 = shl nsw i64 %357, 32
  %359 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 21
  %360 = load i16, i16* %359, align 2
  %361 = sext i16 %360 to i64
  %362 = shl nsw i64 %361, 32
  %363 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 22
  %364 = load i16, i16* %363, align 4
  %365 = sext i16 %364 to i64
  %366 = shl nsw i64 %365, 32
  %367 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 23
  %368 = load i16, i16* %367, align 2
  %369 = sext i16 %368 to i64
  %370 = shl nsw i64 %369, 32
  %371 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 24
  %372 = load i16, i16* %371, align 16
  %373 = sext i16 %372 to i64
  %374 = shl nsw i64 %373, 32
  %375 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 25
  %376 = load i16, i16* %375, align 2
  %377 = sext i16 %376 to i64
  %378 = shl nsw i64 %377, 32
  %379 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 26
  %380 = load i16, i16* %379, align 4
  %381 = sext i16 %380 to i64
  %382 = shl nsw i64 %381, 32
  %383 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 27
  %384 = load i16, i16* %383, align 2
  %385 = sext i16 %384 to i64
  %386 = shl nsw i64 %385, 32
  %387 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 28
  %388 = load i16, i16* %387, align 8
  %389 = sext i16 %388 to i64
  %390 = shl nsw i64 %389, 32
  %391 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 29
  %392 = load i16, i16* %391, align 2
  %393 = sext i16 %392 to i64
  %394 = shl nsw i64 %393, 32
  %395 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 30
  %396 = load i16, i16* %395, align 4
  %397 = sext i16 %396 to i64
  %398 = shl nsw i64 %397, 32
  %399 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 31
  %400 = load i16, i16* %399, align 2
  %401 = sext i16 %400 to i64
  %402 = shl nsw i64 %401, 32
  %403 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 32
  %404 = load i16, i16* %403, align 16
  %405 = sext i16 %404 to i64
  %406 = shl nsw i64 %405, 32
  %407 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 33
  %408 = load i16, i16* %407, align 2
  %409 = sext i16 %408 to i64
  %410 = shl nsw i64 %409, 32
  %411 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 34
  %412 = load i16, i16* %411, align 4
  %413 = sext i16 %412 to i64
  %414 = shl nsw i64 %413, 32
  %415 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 35
  %416 = load i16, i16* %415, align 2
  %417 = sext i16 %416 to i64
  %418 = shl nsw i64 %417, 32
  %419 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 36
  %420 = load i16, i16* %419, align 8
  %421 = sext i16 %420 to i64
  %422 = shl nsw i64 %421, 32
  %423 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 37
  %424 = load i16, i16* %423, align 2
  %425 = sext i16 %424 to i64
  %426 = shl nsw i64 %425, 32
  %427 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 38
  %428 = load i16, i16* %427, align 4
  %429 = sext i16 %428 to i64
  %430 = shl nsw i64 %429, 32
  %431 = getelementptr inbounds [40 x i16], [40 x i16]* %5, i64 0, i64 39
  %432 = load i16, i16* %431, align 2
  %433 = sext i16 %432 to i64
  %434 = shl nsw i64 %433, 32
  br label %435

; <label>:435:                                    ; preds = %435, %.preheader5478
  %indvars.iv65 = phi i64 [ 40, %.preheader5478 ], [ %indvars.iv.next66, %435 ]
  %.0561 = phi i32 [ 40, %.preheader5478 ], [ %677, %435 ]
  %.0660 = phi i16 [ 40, %.preheader5478 ], [ %..06, %435 ]
  %.0959 = phi i64 [ 0, %.preheader5478 ], [ %..09, %435 ]
  %436 = sub nsw i64 0, %indvars.iv65
  %437 = getelementptr inbounds i16, i16* %1, i64 %436
  %438 = load i16, i16* %437, align 2
  %439 = sext i16 %438 to i64
  %sext13 = mul nsw i64 %278, %439
  %440 = ashr exact i64 %sext13, 32
  %441 = sub nsw i64 1, %indvars.iv65
  %442 = getelementptr inbounds i16, i16* %1, i64 %441
  %443 = load i16, i16* %442, align 2
  %444 = sext i16 %443 to i64
  %sext14 = mul nsw i64 %282, %444
  %445 = ashr exact i64 %sext14, 32
  %446 = add nsw i64 %445, %440
  %447 = sub nsw i64 2, %indvars.iv65
  %448 = getelementptr inbounds i16, i16* %1, i64 %447
  %449 = load i16, i16* %448, align 2
  %450 = sext i16 %449 to i64
  %sext15 = mul nsw i64 %286, %450
  %451 = ashr exact i64 %sext15, 32
  %452 = add nsw i64 %446, %451
  %453 = sub nsw i64 3, %indvars.iv65
  %454 = getelementptr inbounds i16, i16* %1, i64 %453
  %455 = load i16, i16* %454, align 2
  %456 = sext i16 %455 to i64
  %sext16 = mul nsw i64 %290, %456
  %457 = ashr exact i64 %sext16, 32
  %458 = add nsw i64 %452, %457
  %459 = sub nsw i64 4, %indvars.iv65
  %460 = getelementptr inbounds i16, i16* %1, i64 %459
  %461 = load i16, i16* %460, align 2
  %462 = sext i16 %461 to i64
  %sext17 = mul nsw i64 %294, %462
  %463 = ashr exact i64 %sext17, 32
  %464 = add nsw i64 %458, %463
  %465 = sub nsw i64 5, %indvars.iv65
  %466 = getelementptr inbounds i16, i16* %1, i64 %465
  %467 = load i16, i16* %466, align 2
  %468 = sext i16 %467 to i64
  %sext18 = mul nsw i64 %298, %468
  %469 = ashr exact i64 %sext18, 32
  %470 = add nsw i64 %464, %469
  %471 = sub nsw i64 6, %indvars.iv65
  %472 = getelementptr inbounds i16, i16* %1, i64 %471
  %473 = load i16, i16* %472, align 2
  %474 = sext i16 %473 to i64
  %sext19 = mul nsw i64 %302, %474
  %475 = ashr exact i64 %sext19, 32
  %476 = add nsw i64 %470, %475
  %477 = sub nsw i64 7, %indvars.iv65
  %478 = getelementptr inbounds i16, i16* %1, i64 %477
  %479 = load i16, i16* %478, align 2
  %480 = sext i16 %479 to i64
  %sext20 = mul nsw i64 %306, %480
  %481 = ashr exact i64 %sext20, 32
  %482 = add nsw i64 %476, %481
  %483 = sub nsw i64 8, %indvars.iv65
  %484 = getelementptr inbounds i16, i16* %1, i64 %483
  %485 = load i16, i16* %484, align 2
  %486 = sext i16 %485 to i64
  %sext21 = mul nsw i64 %310, %486
  %487 = ashr exact i64 %sext21, 32
  %488 = add nsw i64 %482, %487
  %489 = sub nsw i64 9, %indvars.iv65
  %490 = getelementptr inbounds i16, i16* %1, i64 %489
  %491 = load i16, i16* %490, align 2
  %492 = sext i16 %491 to i64
  %sext22 = mul nsw i64 %314, %492
  %493 = ashr exact i64 %sext22, 32
  %494 = add nsw i64 %488, %493
  %495 = sub nsw i64 10, %indvars.iv65
  %496 = getelementptr inbounds i16, i16* %1, i64 %495
  %497 = load i16, i16* %496, align 2
  %498 = sext i16 %497 to i64
  %sext23 = mul nsw i64 %318, %498
  %499 = ashr exact i64 %sext23, 32
  %500 = add nsw i64 %494, %499
  %501 = sub nsw i64 11, %indvars.iv65
  %502 = getelementptr inbounds i16, i16* %1, i64 %501
  %503 = load i16, i16* %502, align 2
  %504 = sext i16 %503 to i64
  %sext24 = mul nsw i64 %322, %504
  %505 = ashr exact i64 %sext24, 32
  %506 = add nsw i64 %500, %505
  %507 = sub nsw i64 12, %indvars.iv65
  %508 = getelementptr inbounds i16, i16* %1, i64 %507
  %509 = load i16, i16* %508, align 2
  %510 = sext i16 %509 to i64
  %sext25 = mul nsw i64 %326, %510
  %511 = ashr exact i64 %sext25, 32
  %512 = add nsw i64 %506, %511
  %513 = sub nsw i64 13, %indvars.iv65
  %514 = getelementptr inbounds i16, i16* %1, i64 %513
  %515 = load i16, i16* %514, align 2
  %516 = sext i16 %515 to i64
  %sext26 = mul nsw i64 %330, %516
  %517 = ashr exact i64 %sext26, 32
  %518 = add nsw i64 %512, %517
  %519 = sub nsw i64 14, %indvars.iv65
  %520 = getelementptr inbounds i16, i16* %1, i64 %519
  %521 = load i16, i16* %520, align 2
  %522 = sext i16 %521 to i64
  %sext27 = mul nsw i64 %334, %522
  %523 = ashr exact i64 %sext27, 32
  %524 = add nsw i64 %518, %523
  %525 = sub nsw i64 15, %indvars.iv65
  %526 = getelementptr inbounds i16, i16* %1, i64 %525
  %527 = load i16, i16* %526, align 2
  %528 = sext i16 %527 to i64
  %sext28 = mul nsw i64 %338, %528
  %529 = ashr exact i64 %sext28, 32
  %530 = add nsw i64 %524, %529
  %531 = sub nsw i64 16, %indvars.iv65
  %532 = getelementptr inbounds i16, i16* %1, i64 %531
  %533 = load i16, i16* %532, align 2
  %534 = sext i16 %533 to i64
  %sext29 = mul nsw i64 %342, %534
  %535 = ashr exact i64 %sext29, 32
  %536 = add nsw i64 %530, %535
  %537 = sub nsw i64 17, %indvars.iv65
  %538 = getelementptr inbounds i16, i16* %1, i64 %537
  %539 = load i16, i16* %538, align 2
  %540 = sext i16 %539 to i64
  %sext30 = mul nsw i64 %346, %540
  %541 = ashr exact i64 %sext30, 32
  %542 = add nsw i64 %536, %541
  %543 = sub nsw i64 18, %indvars.iv65
  %544 = getelementptr inbounds i16, i16* %1, i64 %543
  %545 = load i16, i16* %544, align 2
  %546 = sext i16 %545 to i64
  %sext31 = mul nsw i64 %350, %546
  %547 = ashr exact i64 %sext31, 32
  %548 = add nsw i64 %542, %547
  %549 = sub nsw i64 19, %indvars.iv65
  %550 = getelementptr inbounds i16, i16* %1, i64 %549
  %551 = load i16, i16* %550, align 2
  %552 = sext i16 %551 to i64
  %sext32 = mul nsw i64 %354, %552
  %553 = ashr exact i64 %sext32, 32
  %554 = add nsw i64 %548, %553
  %555 = sub nsw i64 20, %indvars.iv65
  %556 = getelementptr inbounds i16, i16* %1, i64 %555
  %557 = load i16, i16* %556, align 2
  %558 = sext i16 %557 to i64
  %sext33 = mul nsw i64 %358, %558
  %559 = ashr exact i64 %sext33, 32
  %560 = add nsw i64 %554, %559
  %561 = sub nsw i64 21, %indvars.iv65
  %562 = getelementptr inbounds i16, i16* %1, i64 %561
  %563 = load i16, i16* %562, align 2
  %564 = sext i16 %563 to i64
  %sext34 = mul nsw i64 %362, %564
  %565 = ashr exact i64 %sext34, 32
  %566 = add nsw i64 %560, %565
  %567 = sub nsw i64 22, %indvars.iv65
  %568 = getelementptr inbounds i16, i16* %1, i64 %567
  %569 = load i16, i16* %568, align 2
  %570 = sext i16 %569 to i64
  %sext35 = mul nsw i64 %366, %570
  %571 = ashr exact i64 %sext35, 32
  %572 = add nsw i64 %566, %571
  %573 = sub nsw i64 23, %indvars.iv65
  %574 = getelementptr inbounds i16, i16* %1, i64 %573
  %575 = load i16, i16* %574, align 2
  %576 = sext i16 %575 to i64
  %sext36 = mul nsw i64 %370, %576
  %577 = ashr exact i64 %sext36, 32
  %578 = add nsw i64 %572, %577
  %579 = sub nsw i64 24, %indvars.iv65
  %580 = getelementptr inbounds i16, i16* %1, i64 %579
  %581 = load i16, i16* %580, align 2
  %582 = sext i16 %581 to i64
  %sext37 = mul nsw i64 %374, %582
  %583 = ashr exact i64 %sext37, 32
  %584 = add nsw i64 %578, %583
  %585 = sub nsw i64 25, %indvars.iv65
  %586 = getelementptr inbounds i16, i16* %1, i64 %585
  %587 = load i16, i16* %586, align 2
  %588 = sext i16 %587 to i64
  %sext38 = mul nsw i64 %378, %588
  %589 = ashr exact i64 %sext38, 32
  %590 = add nsw i64 %584, %589
  %591 = sub nsw i64 26, %indvars.iv65
  %592 = getelementptr inbounds i16, i16* %1, i64 %591
  %593 = load i16, i16* %592, align 2
  %594 = sext i16 %593 to i64
  %sext39 = mul nsw i64 %382, %594
  %595 = ashr exact i64 %sext39, 32
  %596 = add nsw i64 %590, %595
  %597 = sub nsw i64 27, %indvars.iv65
  %598 = getelementptr inbounds i16, i16* %1, i64 %597
  %599 = load i16, i16* %598, align 2
  %600 = sext i16 %599 to i64
  %sext40 = mul nsw i64 %386, %600
  %601 = ashr exact i64 %sext40, 32
  %602 = add nsw i64 %596, %601
  %603 = sub nsw i64 28, %indvars.iv65
  %604 = getelementptr inbounds i16, i16* %1, i64 %603
  %605 = load i16, i16* %604, align 2
  %606 = sext i16 %605 to i64
  %sext41 = mul nsw i64 %390, %606
  %607 = ashr exact i64 %sext41, 32
  %608 = add nsw i64 %602, %607
  %609 = sub nsw i64 29, %indvars.iv65
  %610 = getelementptr inbounds i16, i16* %1, i64 %609
  %611 = load i16, i16* %610, align 2
  %612 = sext i16 %611 to i64
  %sext42 = mul nsw i64 %394, %612
  %613 = ashr exact i64 %sext42, 32
  %614 = add nsw i64 %608, %613
  %615 = sub nsw i64 30, %indvars.iv65
  %616 = getelementptr inbounds i16, i16* %1, i64 %615
  %617 = load i16, i16* %616, align 2
  %618 = sext i16 %617 to i64
  %sext43 = mul nsw i64 %398, %618
  %619 = ashr exact i64 %sext43, 32
  %620 = add nsw i64 %614, %619
  %621 = sub nsw i64 31, %indvars.iv65
  %622 = getelementptr inbounds i16, i16* %1, i64 %621
  %623 = load i16, i16* %622, align 2
  %624 = sext i16 %623 to i64
  %sext44 = mul nsw i64 %402, %624
  %625 = ashr exact i64 %sext44, 32
  %626 = add nsw i64 %620, %625
  %627 = sub nsw i64 32, %indvars.iv65
  %628 = getelementptr inbounds i16, i16* %1, i64 %627
  %629 = load i16, i16* %628, align 2
  %630 = sext i16 %629 to i64
  %sext45 = mul nsw i64 %406, %630
  %631 = ashr exact i64 %sext45, 32
  %632 = add nsw i64 %626, %631
  %633 = sub nsw i64 33, %indvars.iv65
  %634 = getelementptr inbounds i16, i16* %1, i64 %633
  %635 = load i16, i16* %634, align 2
  %636 = sext i16 %635 to i64
  %sext46 = mul nsw i64 %410, %636
  %637 = ashr exact i64 %sext46, 32
  %638 = add nsw i64 %632, %637
  %639 = sub nsw i64 34, %indvars.iv65
  %640 = getelementptr inbounds i16, i16* %1, i64 %639
  %641 = load i16, i16* %640, align 2
  %642 = sext i16 %641 to i64
  %sext47 = mul nsw i64 %414, %642
  %643 = ashr exact i64 %sext47, 32
  %644 = add nsw i64 %638, %643
  %645 = sub nsw i64 35, %indvars.iv65
  %646 = getelementptr inbounds i16, i16* %1, i64 %645
  %647 = load i16, i16* %646, align 2
  %648 = sext i16 %647 to i64
  %sext48 = mul nsw i64 %418, %648
  %649 = ashr exact i64 %sext48, 32
  %650 = add nsw i64 %644, %649
  %651 = sub nsw i64 36, %indvars.iv65
  %652 = getelementptr inbounds i16, i16* %1, i64 %651
  %653 = load i16, i16* %652, align 2
  %654 = sext i16 %653 to i64
  %sext49 = mul nsw i64 %422, %654
  %655 = ashr exact i64 %sext49, 32
  %656 = add nsw i64 %650, %655
  %657 = sub nsw i64 37, %indvars.iv65
  %658 = getelementptr inbounds i16, i16* %1, i64 %657
  %659 = load i16, i16* %658, align 2
  %660 = sext i16 %659 to i64
  %sext50 = mul nsw i64 %426, %660
  %661 = ashr exact i64 %sext50, 32
  %662 = add nsw i64 %656, %661
  %663 = sub nsw i64 38, %indvars.iv65
  %664 = getelementptr inbounds i16, i16* %1, i64 %663
  %665 = load i16, i16* %664, align 2
  %666 = sext i16 %665 to i64
  %sext51 = mul nsw i64 %430, %666
  %667 = ashr exact i64 %sext51, 32
  %668 = add nsw i64 %662, %667
  %669 = sub nsw i64 39, %indvars.iv65
  %670 = getelementptr inbounds i16, i16* %1, i64 %669
  %671 = load i16, i16* %670, align 2
  %672 = sext i16 %671 to i64
  %sext52 = mul nsw i64 %434, %672
  %673 = ashr exact i64 %sext52, 32
  %674 = add nsw i64 %668, %673
  %675 = icmp sgt i64 %674, %.0959
  %676 = trunc i32 %.0561 to i16
  %..09 = select i1 %675, i64 %674, i64 %.0959
  %..06 = select i1 %675, i16 %676, i16 %.0660
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %677 = add nuw nsw i32 %.0561, 1
  %exitcond = icmp eq i64 %indvars.iv.next66, 121
  br i1 %exitcond, label %678, label %435

; <label>:678:                                    ; preds = %435
  store i16 %..06, i16* %3, align 2
  %.01.off = add i16 %.01, 100
  %679 = icmp ult i16 %.01.off, 201
  br i1 %679, label %681, label %680

; <label>:680:                                    ; preds = %678
  tail call void @__assert_fail(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 165, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @__PRETTY_FUNCTION__.Calculation_of_the_LTP_parameters, i64 0, i64 0)) #4
  unreachable

; <label>:681:                                    ; preds = %678
  %682 = shl i64 %..09, 1
  %683 = sext i16 %.01 to i64
  %684 = sub nsw i64 6, %683
  %685 = and i64 %684, 4294967295
  %686 = ashr i64 %682, %685
  %.06.off = add i16 %..06, -40
  %687 = icmp ult i16 %.06.off, 81
  br i1 %687, label %.preheader, label %689

.preheader:                                       ; preds = %681
  %688 = sext i16 %..06 to i64
  br label %690

; <label>:689:                                    ; preds = %681
  tail call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.12, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 168, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @__PRETTY_FUNCTION__.Calculation_of_the_LTP_parameters, i64 0, i64 0)) #4
  unreachable

; <label>:690:                                    ; preds = %690, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %690 ]
  %.01157 = phi i64 [ 0, %.preheader ], [ %706, %690 ]
  %691 = sub nsw i64 %indvars.iv, %688
  %692 = getelementptr inbounds i16, i16* %1, i64 %691
  %693 = load i16, i16* %692, align 2
  %694 = sext i16 %693 to i32
  %695 = ashr i32 %694, 3
  %696 = sext i32 %695 to i64
  %697 = mul nsw i64 %696, %696
  %698 = add nsw i64 %697, %.01157
  %indvars.iv.next = or i64 %indvars.iv, 1
  %699 = sub nsw i64 %indvars.iv.next, %688
  %700 = getelementptr inbounds i16, i16* %1, i64 %699
  %701 = load i16, i16* %700, align 2
  %702 = sext i16 %701 to i32
  %703 = ashr i32 %702, 3
  %704 = sext i32 %703 to i64
  %705 = mul nsw i64 %704, %704
  %706 = add nsw i64 %705, %698
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 40
  br i1 %exitcond.1, label %707, label %690

; <label>:707:                                    ; preds = %690
  %708 = shl i64 %706, 1
  %709 = icmp slt i64 %686, 1
  br i1 %709, label %.loopexit, label %710

; <label>:710:                                    ; preds = %707
  %711 = icmp slt i64 %686, %708
  br i1 %711, label %712, label %.loopexit

; <label>:712:                                    ; preds = %710
  %713 = tail call signext i16 @gsm_norm(i64 %708) #5
  %714 = sext i16 %713 to i64
  %715 = and i64 %714, 4294967295
  %716 = shl i64 %686, %715
  %717 = shl i64 %708, %715
  %718 = lshr i64 %717, 16
  %719 = trunc i64 %718 to i16
  %720 = trunc i64 %716 to i32
  %sext = ashr i32 %720, 16
  %721 = load i16, i16* getelementptr inbounds ([4 x i16], [4 x i16]* @gsm_DLB, i64 0, i64 0), align 2
  %722 = tail call signext i16 @gsm_mult(i16 signext %719, i16 signext %721) #5
  %723 = sext i16 %722 to i32
  %724 = icmp sgt i32 %sext, %723
  br i1 %724, label %725, label %.loopexit

; <label>:725:                                    ; preds = %712
  %726 = load i16, i16* getelementptr inbounds ([4 x i16], [4 x i16]* @gsm_DLB, i64 0, i64 1), align 2
  %727 = tail call signext i16 @gsm_mult(i16 signext %719, i16 signext %726) #5
  %728 = sext i16 %727 to i32
  %729 = icmp sgt i32 %sext, %728
  br i1 %729, label %730, label %.loopexit

.loopexit:                                        ; preds = %730, %712, %725, %707, %710
  %.08.sink = phi i16 [ 3, %710 ], [ 0, %707 ], [ 0, %712 ], [ 1, %725 ], [ %.73, %730 ]
  store i16 %.08.sink, i16* %2, align 2
  ret void

; <label>:730:                                    ; preds = %725
  %731 = load i16, i16* getelementptr inbounds ([4 x i16], [4 x i16]* @gsm_DLB, i64 0, i64 2), align 2
  %732 = tail call signext i16 @gsm_mult(i16 signext %719, i16 signext %731) #5
  %733 = sext i16 %732 to i32
  %734 = icmp sgt i32 %sext, %733
  %.73 = select i1 %734, i16 3, i16 2
  br label %.loopexit
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @Long_term_analysis_filtering(i16 signext, i16 signext, i16* nocapture readonly, i16* nocapture readonly, i16* nocapture, i16* nocapture) unnamed_addr #2 {
  %7 = sext i16 %0 to i32
  switch i32 %7, label %.loopexit [
    i32 0, label %.preheader
    i32 1, label %.preheader10
    i32 2, label %.preheader12
    i32 3, label %.preheader14
  ]

.preheader14:                                     ; preds = %6
  %8 = sext i16 %1 to i64
  br label %72

.preheader12:                                     ; preds = %6
  %9 = sext i16 %1 to i64
  br label %52

.preheader10:                                     ; preds = %6
  %10 = sext i16 %1 to i64
  br label %32

.preheader:                                       ; preds = %6
  %11 = sext i16 %1 to i64
  br label %12

; <label>:12:                                     ; preds = %12, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %12 ]
  %13 = sub nsw i64 %indvars.iv, %11
  %14 = getelementptr inbounds i16, i16* %2, i64 %13
  %15 = load i16, i16* %14, align 2
  %16 = sext i16 %15 to i64
  %17 = mul nsw i64 %16, 3277
  %18 = add nsw i64 %17, 16384
  %19 = lshr i64 %18, 15
  %20 = trunc i64 %19 to i16
  %21 = getelementptr inbounds i16, i16* %4, i64 %indvars.iv
  store i16 %20, i16* %21, align 2
  %22 = getelementptr inbounds i16, i16* %3, i64 %indvars.iv
  %23 = load i16, i16* %22, align 2
  %24 = sext i16 %23 to i64
  %sext9 = shl i64 %19, 48
  %25 = ashr exact i64 %sext9, 48
  %26 = sub nsw i64 %24, %25
  %27 = icmp sgt i64 %26, 32766
  %28 = icmp sgt i64 %26, -32768
  %. = select i1 %28, i64 %26, i64 -32768
  %29 = trunc i64 %. to i16
  %30 = select i1 %27, i16 32767, i16 %29
  %31 = getelementptr inbounds i16, i16* %5, i64 %indvars.iv
  store i16 %30, i16* %31, align 2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 40
  br i1 %exitcond, label %.loopexit.loopexit, label %12

; <label>:32:                                     ; preds = %32, %.preheader10
  %indvars.iv23 = phi i64 [ 0, %.preheader10 ], [ %indvars.iv.next24, %32 ]
  %33 = sub nsw i64 %indvars.iv23, %10
  %34 = getelementptr inbounds i16, i16* %2, i64 %33
  %35 = load i16, i16* %34, align 2
  %36 = sext i16 %35 to i64
  %37 = mul nsw i64 %36, 11469
  %38 = add nsw i64 %37, 16384
  %39 = lshr i64 %38, 15
  %40 = trunc i64 %39 to i16
  %41 = getelementptr inbounds i16, i16* %4, i64 %indvars.iv23
  store i16 %40, i16* %41, align 2
  %42 = getelementptr inbounds i16, i16* %3, i64 %indvars.iv23
  %43 = load i16, i16* %42, align 2
  %44 = sext i16 %43 to i64
  %sext8 = shl i64 %39, 48
  %45 = ashr exact i64 %sext8, 48
  %46 = sub nsw i64 %44, %45
  %47 = icmp sgt i64 %46, 32766
  %48 = icmp sgt i64 %46, -32768
  %.4 = select i1 %48, i64 %46, i64 -32768
  %49 = trunc i64 %.4 to i16
  %50 = select i1 %47, i16 32767, i16 %49
  %51 = getelementptr inbounds i16, i16* %5, i64 %indvars.iv23
  store i16 %50, i16* %51, align 2
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 40
  br i1 %exitcond25, label %.loopexit.loopexit38, label %32

; <label>:52:                                     ; preds = %52, %.preheader12
  %indvars.iv26 = phi i64 [ 0, %.preheader12 ], [ %indvars.iv.next27, %52 ]
  %53 = sub nsw i64 %indvars.iv26, %9
  %54 = getelementptr inbounds i16, i16* %2, i64 %53
  %55 = load i16, i16* %54, align 2
  %56 = sext i16 %55 to i64
  %57 = mul nsw i64 %56, 21299
  %58 = add nsw i64 %57, 16384
  %59 = lshr i64 %58, 15
  %60 = trunc i64 %59 to i16
  %61 = getelementptr inbounds i16, i16* %4, i64 %indvars.iv26
  store i16 %60, i16* %61, align 2
  %62 = getelementptr inbounds i16, i16* %3, i64 %indvars.iv26
  %63 = load i16, i16* %62, align 2
  %64 = sext i16 %63 to i64
  %sext7 = shl i64 %59, 48
  %65 = ashr exact i64 %sext7, 48
  %66 = sub nsw i64 %64, %65
  %67 = icmp sgt i64 %66, 32766
  %68 = icmp sgt i64 %66, -32768
  %.5 = select i1 %68, i64 %66, i64 -32768
  %69 = trunc i64 %.5 to i16
  %70 = select i1 %67, i16 32767, i16 %69
  %71 = getelementptr inbounds i16, i16* %5, i64 %indvars.iv26
  store i16 %70, i16* %71, align 2
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next27, 40
  br i1 %exitcond28, label %.loopexit.loopexit39, label %52

; <label>:72:                                     ; preds = %72, %.preheader14
  %indvars.iv29 = phi i64 [ 0, %.preheader14 ], [ %indvars.iv.next30, %72 ]
  %73 = sub nsw i64 %indvars.iv29, %8
  %74 = getelementptr inbounds i16, i16* %2, i64 %73
  %75 = load i16, i16* %74, align 2
  %76 = sext i16 %75 to i64
  %77 = mul nsw i64 %76, 32767
  %78 = add nsw i64 %77, 16384
  %79 = lshr i64 %78, 15
  %80 = trunc i64 %79 to i16
  %81 = getelementptr inbounds i16, i16* %4, i64 %indvars.iv29
  store i16 %80, i16* %81, align 2
  %82 = getelementptr inbounds i16, i16* %3, i64 %indvars.iv29
  %83 = load i16, i16* %82, align 2
  %84 = sext i16 %83 to i64
  %sext = shl i64 %79, 48
  %85 = ashr exact i64 %sext, 48
  %86 = sub nsw i64 %84, %85
  %87 = icmp sgt i64 %86, 32766
  %88 = icmp sgt i64 %86, -32768
  %.6 = select i1 %88, i64 %86, i64 -32768
  %89 = trunc i64 %.6 to i16
  %90 = select i1 %87, i16 32767, i16 %89
  %91 = getelementptr inbounds i16, i16* %5, i64 %indvars.iv29
  store i16 %90, i16* %91, align 2
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next30, 40
  br i1 %exitcond31, label %.loopexit.loopexit40, label %72

.loopexit.loopexit:                               ; preds = %12
  br label %.loopexit

.loopexit.loopexit38:                             ; preds = %32
  br label %.loopexit

.loopexit.loopexit39:                             ; preds = %52
  br label %.loopexit

.loopexit.loopexit40:                             ; preds = %72
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit40, %.loopexit.loopexit39, %.loopexit.loopexit38, %.loopexit.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @Gsm_Long_Term_Synthesis_Filtering(%struct.gsm_state* nocapture, i16 signext, i16 signext, i16* nocapture readonly, i16* nocapture) local_unnamed_addr #0 {
  %.off = add i16 %1, -40
  %6 = icmp ugt i16 %.off, 80
  br i1 %6, label %7, label %10

; <label>:7:                                      ; preds = %5
  %8 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 7
  %9 = load i16, i16* %8, align 2
  br label %10

; <label>:10:                                     ; preds = %5, %7
  %.in = phi i16 [ %9, %7 ], [ %1, %5 ]
  %11 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 7
  store i16 %.in, i16* %11, align 2
  %.in.off = add i16 %.in, -40
  %12 = icmp ult i16 %.in.off, 81
  br i1 %12, label %14, label %13

; <label>:13:                                     ; preds = %10
  tail call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 581, i8* getelementptr inbounds ([87 x i8], [87 x i8]* @__PRETTY_FUNCTION__.Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 0)) #4
  unreachable

; <label>:14:                                     ; preds = %10
  %15 = sext i16 %2 to i64
  %16 = getelementptr inbounds [4 x i16], [4 x i16]* @gsm_QLB, i64 0, i64 %15
  %17 = load i16, i16* %16, align 2
  %18 = icmp eq i16 %17, -32768
  br i1 %18, label %22, label %.preheader2

.preheader2:                                      ; preds = %14
  %19 = sext i16 %17 to i64
  %20 = shl nsw i64 %19, 33
  %21 = sext i16 %.in to i64
  br label %23

; <label>:22:                                     ; preds = %14
  tail call void @__assert_fail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 590, i8* getelementptr inbounds ([87 x i8], [87 x i8]* @__PRETTY_FUNCTION__.Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 0)) #4
  unreachable

; <label>:23:                                     ; preds = %23, %.preheader2
  %indvars.iv6 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next7, %23 ]
  %24 = sub nsw i64 %indvars.iv6, %21
  %25 = getelementptr inbounds i16, i16* %4, i64 %24
  %26 = load i16, i16* %25, align 2
  %27 = sext i16 %26 to i64
  %28 = getelementptr inbounds i16, i16* %3, i64 %indvars.iv6
  %29 = load i16, i16* %28, align 2
  %30 = sext i16 %29 to i64
  %31 = mul i64 %20, %27
  %32 = add i64 %31, 140737488355328
  %33 = ashr i64 %32, 48
  %34 = add nsw i64 %33, %30
  %35 = add nsw i64 %34, 32768
  %36 = icmp ugt i64 %35, 65535
  %37 = icmp sgt i64 %34, 0
  %38 = select i1 %37, i64 32767, i64 32768
  %39 = select i1 %36, i64 %38, i64 %34
  %40 = trunc i64 %39 to i16
  %41 = getelementptr inbounds i16, i16* %4, i64 %indvars.iv6
  store i16 %40, i16* %41, align 2
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, 40
  br i1 %exitcond, label %.preheader.preheader, label %23

.preheader.preheader:                             ; preds = %23
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.4, %.preheader ], [ 0, %.preheader.preheader ]
  %42 = add nsw i64 %indvars.iv, -80
  %43 = getelementptr inbounds i16, i16* %4, i64 %42
  %44 = load i16, i16* %43, align 2
  %45 = add nuw nsw i64 %indvars.iv, -120
  %46 = getelementptr inbounds i16, i16* %4, i64 %45
  store i16 %44, i16* %46, align 2
  %47 = add nsw i64 %indvars.iv, -79
  %48 = getelementptr inbounds i16, i16* %4, i64 %47
  %49 = load i16, i16* %48, align 2
  %50 = add nsw i64 %indvars.iv, -119
  %51 = getelementptr inbounds i16, i16* %4, i64 %50
  store i16 %49, i16* %51, align 2
  %52 = add nsw i64 %indvars.iv, -78
  %53 = getelementptr inbounds i16, i16* %4, i64 %52
  %54 = load i16, i16* %53, align 2
  %55 = add nsw i64 %indvars.iv, -118
  %56 = getelementptr inbounds i16, i16* %4, i64 %55
  store i16 %54, i16* %56, align 2
  %57 = add nsw i64 %indvars.iv, -77
  %58 = getelementptr inbounds i16, i16* %4, i64 %57
  %59 = load i16, i16* %58, align 2
  %60 = add nsw i64 %indvars.iv, -117
  %61 = getelementptr inbounds i16, i16* %4, i64 %60
  store i16 %59, i16* %61, align 2
  %62 = add nsw i64 %indvars.iv, -76
  %63 = getelementptr inbounds i16, i16* %4, i64 %62
  %64 = load i16, i16* %63, align 2
  %65 = add nsw i64 %indvars.iv, -116
  %66 = getelementptr inbounds i16, i16* %4, i64 %65
  store i16 %64, i16* %66, align 2
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 120
  br i1 %exitcond.4, label %67, label %.preheader

; <label>:67:                                     ; preds = %.preheader
  ret void
}

declare signext i16 @gsm_norm(i64) local_unnamed_addr #3

declare signext i16 @gsm_mult(i16 signext, i16 signext) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
