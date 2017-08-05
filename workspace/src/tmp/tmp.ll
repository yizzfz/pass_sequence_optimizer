; ModuleID = 'A.ll'
source_filename = "Source.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@.str = private unnamed_addr constant [6 x i8] c"L.pgm\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"R.pgm\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"%s %i %i %i\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str.5 = private unnamed_addr constant [19 x i8] c"finishing reading\0A\00", align 1
@.str.6 = private unnamed_addr constant [16 x i8] c"finishing calc\0A\00", align 1
@.str.7 = private unnamed_addr constant [15 x i8] c"disparity1.pgm\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.9 = private unnamed_addr constant [15 x i8] c"disparity2.pgm\00", align 1
@.str.10 = private unnamed_addr constant [13 x i8] c"P2\0A%i %i %i\0A\00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_Source.cpp, i8* null }]

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #0

declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #0

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define void @_Z13Stereo_VisionPhS_S_ii(i8* nocapture readonly, i8* nocapture readonly, i8* nocapture, i32, i32) local_unnamed_addr #2 {
  %6 = sub nsw i32 223, %4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %.loopexit2

; <label>:8:                                      ; preds = %5
  %9 = sub nsw i32 280, %4
  %10 = sext i32 %4 to i64
  %11 = sext i32 %3 to i64
  %12 = zext i32 %9 to i64
  %13 = zext i32 %4 to i64
  %14 = zext i32 %6 to i64
  %15 = icmp sgt i32 %9, 0
  %16 = icmp slt i32 %4, 1
  br label %17

; <label>:17:                                     ; preds = %.loopexit1, %8
  %18 = phi i64 [ 0, %8 ], [ %88, %.loopexit1 ]
  %19 = mul i64 %18, 280
  %scevgep = getelementptr i8, i8* %2, i64 %19
  br i1 %15, label %20, label %.loopexit1

; <label>:20:                                     ; preds = %17
  %21 = trunc i64 %18 to i32
  br i1 %16, label %.loopexit1.loopexit, label %.split.preheader

.split.preheader:                                 ; preds = %20
  br label %.split

.split:                                           ; preds = %.split.preheader, %.loopexit
  %22 = phi i64 [ %86, %.loopexit ], [ 0, %.split.preheader ]
  %23 = sub nsw i64 %22, %10
  %24 = icmp slt i64 %23, %11
  %25 = trunc i64 %23 to i32
  %26 = select i1 %24, i32 %25, i32 %3
  %27 = icmp slt i32 %26, 0
  br i1 %27, label %.loopexit, label %28

; <label>:28:                                     ; preds = %.split
  %29 = trunc i64 %22 to i32
  br label %30

; <label>:30:                                     ; preds = %35, %28
  %31 = phi float [ %41, %35 ], [ 0.000000e+00, %28 ]
  %32 = phi i32 [ %40, %35 ], [ 0, %28 ]
  %33 = phi i32 [ %42, %35 ], [ 0, %28 ]
  %34 = sub i32 %29, %33
  br label %43

; <label>:35:                                     ; preds = %52
  %36 = fmul float %73, %73
  %37 = fmul float %76, %79
  %38 = fdiv float %36, %37
  %39 = fcmp ogt float %38, %31
  %40 = select i1 %39, i32 %33, i32 %32
  %41 = select i1 %39, float %38, float %31
  %42 = add nuw nsw i32 %33, 1
  %exitcond = icmp eq i32 %33, %26
  br i1 %exitcond, label %.loopexit.loopexit, label %30

; <label>:43:                                     ; preds = %52, %30
  %44 = phi float [ %79, %52 ], [ 0.000000e+00, %30 ]
  %45 = phi float [ %76, %52 ], [ 0.000000e+00, %30 ]
  %46 = phi float [ %73, %52 ], [ 0.000000e+00, %30 ]
  %47 = phi i32 [ %53, %52 ], [ 0, %30 ]
  %48 = add nuw nsw i32 %47, %21
  %49 = mul nsw i32 %48, 280
  %50 = add i32 %49, %29
  %51 = add i32 %34, %49
  br label %55

; <label>:52:                                     ; preds = %55
  %53 = add nuw nsw i32 %47, 1
  %54 = icmp eq i32 %53, %4
  br i1 %54, label %35, label %43

; <label>:55:                                     ; preds = %55, %43
  %56 = phi i64 [ %80, %55 ], [ 0, %43 ]
  %57 = phi float [ %79, %55 ], [ %44, %43 ]
  %58 = phi float [ %76, %55 ], [ %45, %43 ]
  %59 = phi float [ %73, %55 ], [ %46, %43 ]
  %60 = trunc i64 %56 to i32
  %61 = add i32 %50, %60
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8* %0, i64 %62
  %64 = load i8, i8* %63, align 1, !tbaa !1
  %65 = zext i8 %64 to i32
  %66 = add i32 %51, %60
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8, i8* %1, i64 %67
  %69 = load i8, i8* %68, align 1, !tbaa !1
  %70 = zext i8 %69 to i32
  %71 = mul nuw nsw i32 %70, %65
  %72 = sitofp i32 %71 to float
  %73 = fadd float %59, %72
  %74 = mul nuw nsw i32 %65, %65
  %75 = sitofp i32 %74 to float
  %76 = fadd float %58, %75
  %77 = mul nuw nsw i32 %70, %70
  %78 = sitofp i32 %77 to float
  %79 = fadd float %57, %78
  %80 = add nuw nsw i64 %56, 1
  %81 = icmp eq i64 %80, %13
  br i1 %81, label %52, label %55

.loopexit.loopexit:                               ; preds = %35
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.split
  %82 = phi i32 [ 0, %.split ], [ %40, %.loopexit.loopexit ]
  %83 = trunc i32 %82 to i8
  %84 = add nuw nsw i64 %22, %19
  %85 = getelementptr inbounds i8, i8* %2, i64 %84
  store i8 %83, i8* %85, align 1, !tbaa !1
  %86 = add nuw nsw i64 %22, 1
  %87 = icmp eq i64 %86, %12
  br i1 %87, label %.loopexit1.loopexit25, label %.split

.loopexit1.loopexit:                              ; preds = %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %12, i32 1, i1 false)
  br label %.loopexit1

.loopexit1.loopexit25:                            ; preds = %.loopexit
  br label %.loopexit1

.loopexit1:                                       ; preds = %.loopexit1.loopexit25, %.loopexit1.loopexit, %17
  %88 = add nuw nsw i64 %18, 1
  %89 = icmp eq i64 %88, %14
  br i1 %89, label %.loopexit2.loopexit, label %17

.loopexit2.loopexit:                              ; preds = %.loopexit1
  br label %.loopexit2

.loopexit2:                                       ; preds = %.loopexit2.loopexit, %5
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

; Function Attrs: norecurse nounwind uwtable
define void @_Z17Stereo_Vision_fixPhS_S_i(i8* nocapture readonly, i8* nocapture readonly, i8* nocapture, i32) local_unnamed_addr #4 {
  %5 = sext i32 %3 to i64
  br label %6

; <label>:6:                                      ; preds = %123, %4
  %7 = phi i64 [ 0, %4 ], [ %124, %123 ]
  %8 = mul nuw nsw i64 %7, 280
  br label %9

; <label>:9:                                      ; preds = %.loopexit, %6
  %10 = phi i64 [ 0, %6 ], [ %121, %.loopexit ]
  %11 = add nsw i64 %10, -4
  %12 = icmp slt i64 %11, %5
  %13 = trunc i64 %11 to i32
  %14 = select i1 %12, i32 %13, i32 %3
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %.loopexit, label %16

; <label>:16:                                     ; preds = %9
  %17 = sext i32 %14 to i64
  br label %18

; <label>:18:                                     ; preds = %108, %16
  %19 = phi i64 [ %116, %108 ], [ 0, %16 ]
  %20 = phi float [ %115, %108 ], [ 0.000000e+00, %16 ]
  %21 = phi i32 [ %114, %108 ], [ 0, %16 ]
  %22 = sub nsw i64 %10, %19
  br label %23

; <label>:23:                                     ; preds = %23, %18
  %24 = phi i64 [ 0, %18 ], [ %106, %23 ]
  %25 = phi float [ 0.000000e+00, %18 ], [ %105, %23 ]
  %26 = phi float [ 0.000000e+00, %18 ], [ %102, %23 ]
  %27 = phi float [ 0.000000e+00, %18 ], [ %101, %23 ]
  %28 = add nuw nsw i64 %24, %7
  %29 = mul nuw nsw i64 %28, 280
  %30 = add nuw nsw i64 %29, %10
  %31 = add nsw i64 %29, %22
  %32 = getelementptr inbounds i8, i8* %0, i64 %30
  %33 = load i8, i8* %32, align 1, !tbaa !1
  %34 = zext i8 %33 to i32
  %35 = getelementptr inbounds i8, i8* %1, i64 %31
  %36 = load i8, i8* %35, align 1, !tbaa !1
  %37 = zext i8 %36 to i32
  %38 = mul nuw nsw i32 %37, %34
  %39 = sitofp i32 %38 to float
  %40 = mul nuw nsw i32 %34, %34
  %41 = sitofp i32 %40 to float
  %42 = insertelement <2 x float> undef, float %39, i32 0
  %43 = insertelement <2 x float> %42, float %41, i32 1
  %44 = insertelement <2 x float> undef, float %27, i32 0
  %45 = insertelement <2 x float> %44, float %26, i32 1
  %46 = fadd <2 x float> %45, %43
  %47 = mul nuw nsw i32 %37, %37
  %48 = sitofp i32 %47 to float
  %49 = fadd float %25, %48
  %50 = add nuw nsw i64 %30, 1
  %51 = getelementptr inbounds i8, i8* %0, i64 %50
  %52 = load i8, i8* %51, align 1, !tbaa !1
  %53 = zext i8 %52 to i32
  %54 = add nsw i64 %31, 1
  %55 = getelementptr inbounds i8, i8* %1, i64 %54
  %56 = load i8, i8* %55, align 1, !tbaa !1
  %57 = zext i8 %56 to i32
  %58 = mul nuw nsw i32 %57, %53
  %59 = sitofp i32 %58 to float
  %60 = mul nuw nsw i32 %53, %53
  %61 = sitofp i32 %60 to float
  %62 = insertelement <2 x float> undef, float %59, i32 0
  %63 = insertelement <2 x float> %62, float %61, i32 1
  %64 = fadd <2 x float> %46, %63
  %65 = mul nuw nsw i32 %57, %57
  %66 = sitofp i32 %65 to float
  %67 = fadd float %49, %66
  %68 = add nuw nsw i64 %30, 2
  %69 = getelementptr inbounds i8, i8* %0, i64 %68
  %70 = load i8, i8* %69, align 1, !tbaa !1
  %71 = zext i8 %70 to i32
  %72 = add nsw i64 %31, 2
  %73 = getelementptr inbounds i8, i8* %1, i64 %72
  %74 = load i8, i8* %73, align 1, !tbaa !1
  %75 = zext i8 %74 to i32
  %76 = mul nuw nsw i32 %75, %71
  %77 = sitofp i32 %76 to float
  %78 = mul nuw nsw i32 %71, %71
  %79 = sitofp i32 %78 to float
  %80 = insertelement <2 x float> undef, float %77, i32 0
  %81 = insertelement <2 x float> %80, float %79, i32 1
  %82 = fadd <2 x float> %64, %81
  %83 = mul nuw nsw i32 %75, %75
  %84 = sitofp i32 %83 to float
  %85 = fadd float %67, %84
  %86 = add nuw nsw i64 %30, 3
  %87 = getelementptr inbounds i8, i8* %0, i64 %86
  %88 = load i8, i8* %87, align 1, !tbaa !1
  %89 = zext i8 %88 to i32
  %90 = add nsw i64 %31, 3
  %91 = getelementptr inbounds i8, i8* %1, i64 %90
  %92 = load i8, i8* %91, align 1, !tbaa !1
  %93 = zext i8 %92 to i32
  %94 = mul nuw nsw i32 %93, %89
  %95 = sitofp i32 %94 to float
  %96 = mul nuw nsw i32 %89, %89
  %97 = sitofp i32 %96 to float
  %98 = insertelement <2 x float> undef, float %95, i32 0
  %99 = insertelement <2 x float> %98, float %97, i32 1
  %100 = fadd <2 x float> %82, %99
  %101 = extractelement <2 x float> %100, i32 0
  %102 = extractelement <2 x float> %100, i32 1
  %103 = mul nuw nsw i32 %93, %93
  %104 = sitofp i32 %103 to float
  %105 = fadd float %85, %104
  %106 = add nuw nsw i64 %24, 1
  %107 = icmp eq i64 %106, 4
  br i1 %107, label %108, label %23

; <label>:108:                                    ; preds = %23
  %109 = fmul float %101, %101
  %110 = fmul float %105, %102
  %111 = fdiv float %109, %110
  %112 = fcmp ogt float %111, %20
  %113 = trunc i64 %19 to i32
  %114 = select i1 %112, i32 %113, i32 %21
  %115 = select i1 %112, float %111, float %20
  %116 = add nuw nsw i64 %19, 1
  %exitcond = icmp eq i64 %19, %17
  br i1 %exitcond, label %.loopexit.loopexit, label %18

.loopexit.loopexit:                               ; preds = %108
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %9
  %117 = phi i32 [ 0, %9 ], [ %114, %.loopexit.loopexit ]
  %118 = trunc i32 %117 to i8
  %119 = add nuw nsw i64 %10, %8
  %120 = getelementptr inbounds i8, i8* %2, i64 %119
  store i8 %118, i8* %120, align 1, !tbaa !1
  %121 = add nuw nsw i64 %10, 1
  %122 = icmp eq i64 %121, 276
  br i1 %122, label %123, label %9

; <label>:123:                                    ; preds = %.loopexit
  %124 = add nuw nsw i64 %7, 1
  %125 = icmp eq i64 %124, 219
  br i1 %125, label %126, label %6

; <label>:126:                                    ; preds = %123
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define void @_Z4blurPhS_i(i8* nocapture readonly, i8* nocapture, i32) local_unnamed_addr #4 {
  %4 = mul nsw i32 %2, %2
  %5 = sitofp i32 %4 to float
  %6 = fdiv float 1.000000e+00, %5
  %7 = sub nsw i32 223, %2
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %.loopexit3

; <label>:9:                                      ; preds = %3
  %10 = sub nsw i32 280, %2
  %11 = sub i32 279, %2
  %12 = zext i32 %11 to i64
  %13 = add nuw nsw i64 %12, 1
  %14 = zext i32 %2 to i64
  %15 = zext i32 %10 to i64
  %16 = zext i32 %7 to i64
  %17 = and i64 %14, 1
  %18 = icmp sgt i32 %10, 0
  %19 = icmp sgt i32 %2, 0
  %20 = icmp eq i64 %17, 0
  %21 = icmp eq i32 %2, 1
  br label %22

; <label>:22:                                     ; preds = %.loopexit2, %9
  %23 = phi i64 [ 0, %9 ], [ %101, %.loopexit2 ]
  %24 = trunc i64 %23 to i32
  %25 = mul i64 %23, 1202590842880
  %26 = ashr exact i64 %25, 32
  %27 = getelementptr i8, i8* %1, i64 %26
  br i1 %18, label %28, label %.loopexit2

; <label>:28:                                     ; preds = %22
  %29 = mul nuw nsw i64 %23, 280
  br i1 %19, label %.preheader1.preheader, label %31

.preheader1.preheader:                            ; preds = %28
  %sext = shl i64 %23, 32
  %30 = ashr exact i64 %sext, 32
  br label %.preheader1

; <label>:31:                                     ; preds = %28
  tail call void @llvm.memset.p0i8.i64(i8* %27, i8 0, i64 %13, i32 1, i1 false)
  br label %.loopexit2

.preheader1:                                      ; preds = %.preheader1.preheader, %.us-lcssa.us
  %32 = phi i64 [ %65, %.us-lcssa.us ], [ 0, %.preheader1.preheader ]
  %33 = trunc i64 %32 to i32
  br i1 %20, label %.split.us, label %.split.preheader

.split.preheader:                                 ; preds = %.preheader1
  br label %.split

.split.us:                                        ; preds = %.preheader1
  br i1 %21, label %.us-lcssa.us, label %.split.us.split.preheader

.split.us.split.preheader:                        ; preds = %.split.us
  br label %.split.us.split

.split.us.split:                                  ; preds = %.split.us.split.preheader, %.loopexit.us
  %34 = phi i32 [ %60, %.loopexit.us ], [ 0, %.split.us.split.preheader ]
  %35 = phi float [ %57, %.loopexit.us ], [ 0.000000e+00, %.split.us.split.preheader ]
  %36 = add nuw nsw i32 %34, %24
  %37 = mul nsw i32 %36, 280
  %38 = add i32 %37, %33
  br label %39

; <label>:39:                                     ; preds = %.split.us.split, %39
  %40 = phi i64 [ %58, %39 ], [ 0, %.split.us.split ]
  %41 = phi float [ %57, %39 ], [ %35, %.split.us.split ]
  %42 = trunc i64 %40 to i32
  %43 = add i32 %42, %38
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8* %0, i64 %44
  %46 = load i8, i8* %45, align 1, !tbaa !1
  %47 = uitofp i8 %46 to float
  %48 = fmul float %6, %47
  %49 = fadd float %41, %48
  %50 = or i32 %42, 1
  %51 = add i32 %50, %38
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8, i8* %0, i64 %52
  %54 = load i8, i8* %53, align 1, !tbaa !1
  %55 = uitofp i8 %54 to float
  %56 = fmul float %6, %55
  %57 = fadd float %49, %56
  %58 = add nuw nsw i64 %40, 2
  %59 = icmp eq i64 %58, %14
  br i1 %59, label %.loopexit.us, label %39

.loopexit.us:                                     ; preds = %39
  %60 = add nuw nsw i32 %34, 1
  %61 = icmp eq i32 %60, %2
  br i1 %61, label %.us-lcssa.us.loopexit, label %.split.us.split

.us-lcssa.us.loopexit:                            ; preds = %.loopexit.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit20:                          ; preds = %.loopexit
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit20, %.us-lcssa.us.loopexit, %.split.us
  %.lcssa4 = phi float [ undef, %.split.us ], [ %57, %.us-lcssa.us.loopexit ], [ %78, %.us-lcssa.us.loopexit20 ]
  %62 = fptoui float %.lcssa4 to i8
  %63 = add nuw nsw i64 %32, %29
  %64 = getelementptr inbounds i8, i8* %1, i64 %63
  store i8 %62, i8* %64, align 1, !tbaa !1
  %65 = add nuw nsw i64 %32, 1
  %66 = icmp eq i64 %65, %15
  br i1 %66, label %.loopexit2.loopexit, label %.preheader1

.split:                                           ; preds = %.split.preheader, %.loopexit
  %indvars.iv = phi i64 [ %indvars.iv.next, %.loopexit ], [ 0, %.split.preheader ]
  %67 = phi float [ %78, %.loopexit ], [ 0.000000e+00, %.split.preheader ]
  %68 = add nuw nsw i64 %indvars.iv, %30
  %69 = mul nsw i64 %68, 280
  %70 = trunc i64 %69 to i32
  %71 = add i32 %70, %33
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i8, i8* %0, i64 %72
  %74 = load i8, i8* %73, align 1, !tbaa !1
  %75 = uitofp i8 %74 to float
  %76 = fmul float %6, %75
  %77 = fadd float %67, %76
  br i1 %21, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.split
  br label %.preheader

.loopexit.loopexit:                               ; preds = %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.split
  %78 = phi float [ %77, %.split ], [ %98, %.loopexit.loopexit ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %79 = icmp eq i64 %indvars.iv.next, %14
  br i1 %79, label %.us-lcssa.us.loopexit20, label %.split

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %80 = phi i64 [ %99, %.preheader ], [ 1, %.preheader.preheader ]
  %81 = phi float [ %98, %.preheader ], [ %77, %.preheader.preheader ]
  %82 = trunc i64 %80 to i32
  %83 = add i32 %82, %71
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i8, i8* %0, i64 %84
  %86 = load i8, i8* %85, align 1, !tbaa !1
  %87 = uitofp i8 %86 to float
  %88 = fmul float %6, %87
  %89 = fadd float %81, %88
  %90 = add nuw nsw i64 %80, 1
  %91 = trunc i64 %90 to i32
  %92 = add i32 %91, %71
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8* %0, i64 %93
  %95 = load i8, i8* %94, align 1, !tbaa !1
  %96 = uitofp i8 %95 to float
  %97 = fmul float %6, %96
  %98 = fadd float %89, %97
  %99 = add nuw nsw i64 %80, 2
  %100 = icmp eq i64 %99, %14
  br i1 %100, label %.loopexit.loopexit, label %.preheader

.loopexit3.loopexit:                              ; preds = %.loopexit2
  br label %.loopexit3

.loopexit3:                                       ; preds = %.loopexit3.loopexit, %3
  ret void

.loopexit2.loopexit:                              ; preds = %.us-lcssa.us
  br label %.loopexit2

.loopexit2:                                       ; preds = %.loopexit2.loopexit, %31, %22
  %101 = add nuw nsw i64 %23, 1
  %102 = icmp eq i64 %101, %16
  br i1 %102, label %.loopexit3.loopexit, label %22
}

; Function Attrs: norecurse nounwind uwtable
define void @_Z8blur_fixPhS_(i8* nocapture readonly, i8* nocapture) local_unnamed_addr #4 {
  br label %3

; <label>:3:                                      ; preds = %147, %2
  %4 = phi i64 [ 0, %2 ], [ %13, %147 ]
  %5 = mul nuw nsw i64 %4, 280
  %6 = getelementptr i8, i8* %1, i64 %5
  %7 = add nuw nsw i64 %5, 277
  %8 = getelementptr i8, i8* %1, i64 %7
  %9 = getelementptr i8, i8* %0, i64 %5
  %10 = add nuw nsw i64 %5, 839
  %11 = getelementptr i8, i8* %0, i64 %10
  %12 = add nuw nsw i64 %5, 560
  %13 = add nuw nsw i64 %4, 1
  %14 = mul nuw nsw i64 %13, 280
  %15 = icmp ult i8* %6, %11
  %16 = icmp ult i8* %9, %8
  %17 = and i1 %15, %16
  br i1 %17, label %.preheader.preheader, label %.preheader1.preheader

.preheader1.preheader:                            ; preds = %3
  br label %.preheader1

.preheader.preheader.loopexit:                    ; preds = %.preheader1
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit, %3
  %.ph = phi i64 [ 0, %3 ], [ 272, %.preheader.preheader.loopexit ]
  br label %.preheader

.preheader1:                                      ; preds = %.preheader1.preheader, %.preheader1
  %18 = phi i64 [ %85, %.preheader1 ], [ 0, %.preheader1.preheader ]
  %19 = add nuw nsw i64 %18, %5
  %20 = getelementptr inbounds i8, i8* %0, i64 %19
  %21 = bitcast i8* %20 to <16 x i8>*
  %22 = load <16 x i8>, <16 x i8>* %21, align 1, !tbaa !1, !alias.scope !4
  %23 = uitofp <16 x i8> %22 to <16 x float>
  %24 = fmul <16 x float> %23, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %25 = fadd <16 x float> %24, zeroinitializer
  %26 = or i64 %19, 1
  %27 = getelementptr inbounds i8, i8* %0, i64 %26
  %28 = bitcast i8* %27 to <16 x i8>*
  %29 = load <16 x i8>, <16 x i8>* %28, align 1, !tbaa !1, !alias.scope !4
  %30 = uitofp <16 x i8> %29 to <16 x float>
  %31 = fmul <16 x float> %30, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %32 = fadd <16 x float> %25, %31
  %33 = or i64 %19, 2
  %34 = getelementptr inbounds i8, i8* %0, i64 %33
  %35 = bitcast i8* %34 to <16 x i8>*
  %36 = load <16 x i8>, <16 x i8>* %35, align 1, !tbaa !1, !alias.scope !4
  %37 = uitofp <16 x i8> %36 to <16 x float>
  %38 = fmul <16 x float> %37, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %39 = fadd <16 x float> %32, %38
  %40 = add nuw nsw i64 %18, %14
  %41 = getelementptr inbounds i8, i8* %0, i64 %40
  %42 = bitcast i8* %41 to <16 x i8>*
  %43 = load <16 x i8>, <16 x i8>* %42, align 1, !tbaa !1, !alias.scope !4
  %44 = uitofp <16 x i8> %43 to <16 x float>
  %45 = fmul <16 x float> %44, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %46 = fadd <16 x float> %39, %45
  %47 = or i64 %40, 1
  %48 = getelementptr inbounds i8, i8* %0, i64 %47
  %49 = bitcast i8* %48 to <16 x i8>*
  %50 = load <16 x i8>, <16 x i8>* %49, align 1, !tbaa !1, !alias.scope !4
  %51 = uitofp <16 x i8> %50 to <16 x float>
  %52 = fmul <16 x float> %51, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %53 = fadd <16 x float> %46, %52
  %54 = or i64 %40, 2
  %55 = getelementptr inbounds i8, i8* %0, i64 %54
  %56 = bitcast i8* %55 to <16 x i8>*
  %57 = load <16 x i8>, <16 x i8>* %56, align 1, !tbaa !1, !alias.scope !4
  %58 = uitofp <16 x i8> %57 to <16 x float>
  %59 = fmul <16 x float> %58, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %60 = fadd <16 x float> %53, %59
  %61 = add nuw nsw i64 %18, %12
  %62 = getelementptr inbounds i8, i8* %0, i64 %61
  %63 = bitcast i8* %62 to <16 x i8>*
  %64 = load <16 x i8>, <16 x i8>* %63, align 1, !tbaa !1, !alias.scope !4
  %65 = uitofp <16 x i8> %64 to <16 x float>
  %66 = fmul <16 x float> %65, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %67 = fadd <16 x float> %60, %66
  %68 = or i64 %61, 1
  %69 = getelementptr inbounds i8, i8* %0, i64 %68
  %70 = bitcast i8* %69 to <16 x i8>*
  %71 = load <16 x i8>, <16 x i8>* %70, align 1, !tbaa !1, !alias.scope !4
  %72 = uitofp <16 x i8> %71 to <16 x float>
  %73 = fmul <16 x float> %72, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %74 = fadd <16 x float> %67, %73
  %75 = or i64 %61, 2
  %76 = getelementptr inbounds i8, i8* %0, i64 %75
  %77 = bitcast i8* %76 to <16 x i8>*
  %78 = load <16 x i8>, <16 x i8>* %77, align 1, !tbaa !1, !alias.scope !4
  %79 = uitofp <16 x i8> %78 to <16 x float>
  %80 = fmul <16 x float> %79, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %81 = fadd <16 x float> %74, %80
  %82 = fptoui <16 x float> %81 to <16 x i8>
  %83 = getelementptr inbounds i8, i8* %1, i64 %19
  %84 = bitcast i8* %83 to <16 x i8>*
  store <16 x i8> %82, <16 x i8>* %84, align 1, !tbaa !1, !alias.scope !7, !noalias !4
  %85 = add nuw nsw i64 %18, 16
  %86 = icmp eq i64 %85, 272
  br i1 %86, label %.preheader.preheader.loopexit, label %.preheader1, !llvm.loop !9

; <label>:87:                                     ; preds = %147
  ret void

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %88 = phi i64 [ %145, %.preheader ], [ %.ph, %.preheader.preheader ]
  %89 = add nuw nsw i64 %88, %5
  %90 = getelementptr inbounds i8, i8* %0, i64 %89
  %91 = load i8, i8* %90, align 1, !tbaa !1
  %92 = uitofp i8 %91 to float
  %93 = fmul float %92, 0x3FBC71C720000000
  %94 = fadd float %93, 0.000000e+00
  %95 = add nuw nsw i64 %89, 1
  %96 = getelementptr inbounds i8, i8* %0, i64 %95
  %97 = load i8, i8* %96, align 1, !tbaa !1
  %98 = uitofp i8 %97 to float
  %99 = fmul float %98, 0x3FBC71C720000000
  %100 = fadd float %94, %99
  %101 = add nuw nsw i64 %89, 2
  %102 = getelementptr inbounds i8, i8* %0, i64 %101
  %103 = load i8, i8* %102, align 1, !tbaa !1
  %104 = uitofp i8 %103 to float
  %105 = fmul float %104, 0x3FBC71C720000000
  %106 = fadd float %100, %105
  %107 = add nuw nsw i64 %88, %14
  %108 = getelementptr inbounds i8, i8* %0, i64 %107
  %109 = load i8, i8* %108, align 1, !tbaa !1
  %110 = uitofp i8 %109 to float
  %111 = fmul float %110, 0x3FBC71C720000000
  %112 = fadd float %106, %111
  %113 = add nuw nsw i64 %107, 1
  %114 = getelementptr inbounds i8, i8* %0, i64 %113
  %115 = load i8, i8* %114, align 1, !tbaa !1
  %116 = uitofp i8 %115 to float
  %117 = fmul float %116, 0x3FBC71C720000000
  %118 = fadd float %112, %117
  %119 = add nuw nsw i64 %107, 2
  %120 = getelementptr inbounds i8, i8* %0, i64 %119
  %121 = load i8, i8* %120, align 1, !tbaa !1
  %122 = uitofp i8 %121 to float
  %123 = fmul float %122, 0x3FBC71C720000000
  %124 = fadd float %118, %123
  %125 = add nuw nsw i64 %88, %12
  %126 = getelementptr inbounds i8, i8* %0, i64 %125
  %127 = load i8, i8* %126, align 1, !tbaa !1
  %128 = uitofp i8 %127 to float
  %129 = fmul float %128, 0x3FBC71C720000000
  %130 = fadd float %124, %129
  %131 = add nuw nsw i64 %125, 1
  %132 = getelementptr inbounds i8, i8* %0, i64 %131
  %133 = load i8, i8* %132, align 1, !tbaa !1
  %134 = uitofp i8 %133 to float
  %135 = fmul float %134, 0x3FBC71C720000000
  %136 = fadd float %130, %135
  %137 = add nuw nsw i64 %125, 2
  %138 = getelementptr inbounds i8, i8* %0, i64 %137
  %139 = load i8, i8* %138, align 1, !tbaa !1
  %140 = uitofp i8 %139 to float
  %141 = fmul float %140, 0x3FBC71C720000000
  %142 = fadd float %136, %141
  %143 = fptoui float %142 to i8
  %144 = getelementptr inbounds i8, i8* %1, i64 %89
  store i8 %143, i8* %144, align 1, !tbaa !1
  %145 = add nuw nsw i64 %88, 1
  %146 = icmp eq i64 %145, 277
  br i1 %146, label %147, label %.preheader, !llvm.loop !12

; <label>:147:                                    ; preds = %.preheader
  %148 = icmp eq i64 %13, 220
  br i1 %148, label %87, label %3
}

; Function Attrs: norecurse noreturn nounwind uwtable
define void @_Z4testPhS_(i8* nocapture readonly, i8* nocapture) local_unnamed_addr #5 {
  %3 = ptrtoint i8* %1 to i64
  %sunkaddr16 = ptrtoint i8* %0 to i64
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %113
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  br label %4

; <label>:4:                                      ; preds = %113, %.loopexit
  %5 = phi i64 [ 0, %.loopexit ], [ %114, %113 ]
  %6 = mul nuw nsw i64 %5, 280
  %7 = getelementptr i8, i8* %1, i64 %6
  %8 = add nuw nsw i64 %6, 277
  %9 = getelementptr i8, i8* %1, i64 %8
  %10 = add nsw i64 %6, -1
  %11 = getelementptr i8, i8* %0, i64 %10
  %12 = add nuw nsw i64 %6, 276
  %13 = getelementptr i8, i8* %0, i64 %12
  %14 = icmp ult i8* %7, %13
  %15 = icmp ult i8* %11, %9
  %16 = and i1 %14, %15
  br i1 %16, label %.preheader, label %26

.preheader:                                       ; preds = %4, %26
  %.ph = phi i64 [ 0, %4 ], [ 256, %26 ]
  %17 = add nuw nsw i64 %.ph, %6
  %18 = add nsw i64 %17, -1
  %19 = getelementptr inbounds i8, i8* %0, i64 %18
  %20 = load i8, i8* %19, align 1, !tbaa !1
  %21 = getelementptr inbounds i8, i8* %1, i64 %17
  store i8 %20, i8* %21, align 1, !tbaa !1
  %22 = or i64 %.ph, 1
  %23 = or i64 %6, 1
  %24 = or i64 %6, 2
  %25 = or i64 %6, 3
  br label %116

; <label>:26:                                     ; preds = %4
  %sunkaddr17 = add i64 %6, %sunkaddr16
  %sunkaddr18 = add i64 %sunkaddr17, -1
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to <16 x i8>*
  %27 = load <16 x i8>, <16 x i8>* %sunkaddr19, align 1, !tbaa !1, !alias.scope !13
  %sunkaddr21 = add i64 %sunkaddr17, 15
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to <16 x i8>*
  %28 = load <16 x i8>, <16 x i8>* %sunkaddr22, align 1, !tbaa !1, !alias.scope !13
  %sunkaddr9 = add i64 %6, %3
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to <16 x i8>*
  store <16 x i8> %27, <16 x i8>* %sunkaddr10, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %sunkaddr25 = add i64 %sunkaddr9, 16
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to <16 x i8>*
  store <16 x i8> %28, <16 x i8>* %sunkaddr26, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %29 = add nuw nsw i64 %6, 32
  %30 = add nuw nsw i64 %6, 31
  %31 = getelementptr inbounds i8, i8* %0, i64 %30
  %32 = bitcast i8* %31 to <16 x i8>*
  %33 = load <16 x i8>, <16 x i8>* %32, align 1, !tbaa !1, !alias.scope !13
  %34 = getelementptr i8, i8* %31, i64 16
  %35 = bitcast i8* %34 to <16 x i8>*
  %36 = load <16 x i8>, <16 x i8>* %35, align 1, !tbaa !1, !alias.scope !13
  %37 = getelementptr inbounds i8, i8* %1, i64 %29
  %38 = bitcast i8* %37 to <16 x i8>*
  store <16 x i8> %33, <16 x i8>* %38, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %39 = getelementptr i8, i8* %37, i64 16
  %40 = bitcast i8* %39 to <16 x i8>*
  store <16 x i8> %36, <16 x i8>* %40, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %41 = add nuw nsw i64 %6, 64
  %42 = add nuw nsw i64 %6, 63
  %43 = getelementptr inbounds i8, i8* %0, i64 %42
  %44 = bitcast i8* %43 to <16 x i8>*
  %45 = load <16 x i8>, <16 x i8>* %44, align 1, !tbaa !1, !alias.scope !13
  %46 = getelementptr i8, i8* %43, i64 16
  %47 = bitcast i8* %46 to <16 x i8>*
  %48 = load <16 x i8>, <16 x i8>* %47, align 1, !tbaa !1, !alias.scope !13
  %49 = getelementptr inbounds i8, i8* %1, i64 %41
  %50 = bitcast i8* %49 to <16 x i8>*
  store <16 x i8> %45, <16 x i8>* %50, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %51 = getelementptr i8, i8* %49, i64 16
  %52 = bitcast i8* %51 to <16 x i8>*
  store <16 x i8> %48, <16 x i8>* %52, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %53 = add nuw nsw i64 %6, 96
  %54 = add nuw nsw i64 %6, 95
  %55 = getelementptr inbounds i8, i8* %0, i64 %54
  %56 = bitcast i8* %55 to <16 x i8>*
  %57 = load <16 x i8>, <16 x i8>* %56, align 1, !tbaa !1, !alias.scope !13
  %58 = getelementptr i8, i8* %55, i64 16
  %59 = bitcast i8* %58 to <16 x i8>*
  %60 = load <16 x i8>, <16 x i8>* %59, align 1, !tbaa !1, !alias.scope !13
  %61 = getelementptr inbounds i8, i8* %1, i64 %53
  %62 = bitcast i8* %61 to <16 x i8>*
  store <16 x i8> %57, <16 x i8>* %62, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %63 = getelementptr i8, i8* %61, i64 16
  %64 = bitcast i8* %63 to <16 x i8>*
  store <16 x i8> %60, <16 x i8>* %64, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %65 = add nuw nsw i64 %6, 128
  %66 = add nuw nsw i64 %6, 127
  %67 = getelementptr inbounds i8, i8* %0, i64 %66
  %68 = bitcast i8* %67 to <16 x i8>*
  %69 = load <16 x i8>, <16 x i8>* %68, align 1, !tbaa !1, !alias.scope !13
  %70 = getelementptr i8, i8* %67, i64 16
  %71 = bitcast i8* %70 to <16 x i8>*
  %72 = load <16 x i8>, <16 x i8>* %71, align 1, !tbaa !1, !alias.scope !13
  %73 = getelementptr inbounds i8, i8* %1, i64 %65
  %74 = bitcast i8* %73 to <16 x i8>*
  store <16 x i8> %69, <16 x i8>* %74, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %75 = getelementptr i8, i8* %73, i64 16
  %76 = bitcast i8* %75 to <16 x i8>*
  store <16 x i8> %72, <16 x i8>* %76, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %77 = add nuw nsw i64 %6, 160
  %78 = add nuw nsw i64 %6, 159
  %79 = getelementptr inbounds i8, i8* %0, i64 %78
  %80 = bitcast i8* %79 to <16 x i8>*
  %81 = load <16 x i8>, <16 x i8>* %80, align 1, !tbaa !1, !alias.scope !13
  %82 = getelementptr i8, i8* %79, i64 16
  %83 = bitcast i8* %82 to <16 x i8>*
  %84 = load <16 x i8>, <16 x i8>* %83, align 1, !tbaa !1, !alias.scope !13
  %85 = getelementptr inbounds i8, i8* %1, i64 %77
  %86 = bitcast i8* %85 to <16 x i8>*
  store <16 x i8> %81, <16 x i8>* %86, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %87 = getelementptr i8, i8* %85, i64 16
  %88 = bitcast i8* %87 to <16 x i8>*
  store <16 x i8> %84, <16 x i8>* %88, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %89 = add nuw nsw i64 %6, 192
  %90 = add nuw nsw i64 %6, 191
  %91 = getelementptr inbounds i8, i8* %0, i64 %90
  %92 = bitcast i8* %91 to <16 x i8>*
  %93 = load <16 x i8>, <16 x i8>* %92, align 1, !tbaa !1, !alias.scope !13
  %94 = getelementptr i8, i8* %91, i64 16
  %95 = bitcast i8* %94 to <16 x i8>*
  %96 = load <16 x i8>, <16 x i8>* %95, align 1, !tbaa !1, !alias.scope !13
  %97 = getelementptr inbounds i8, i8* %1, i64 %89
  %98 = bitcast i8* %97 to <16 x i8>*
  store <16 x i8> %93, <16 x i8>* %98, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %99 = getelementptr i8, i8* %97, i64 16
  %100 = bitcast i8* %99 to <16 x i8>*
  store <16 x i8> %96, <16 x i8>* %100, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %101 = add nuw nsw i64 %6, 224
  %102 = add nuw nsw i64 %6, 223
  %103 = getelementptr inbounds i8, i8* %0, i64 %102
  %104 = bitcast i8* %103 to <16 x i8>*
  %105 = load <16 x i8>, <16 x i8>* %104, align 1, !tbaa !1, !alias.scope !13
  %106 = getelementptr i8, i8* %103, i64 16
  %107 = bitcast i8* %106 to <16 x i8>*
  %108 = load <16 x i8>, <16 x i8>* %107, align 1, !tbaa !1, !alias.scope !13
  %109 = getelementptr inbounds i8, i8* %1, i64 %101
  %110 = bitcast i8* %109 to <16 x i8>*
  store <16 x i8> %105, <16 x i8>* %110, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %111 = getelementptr i8, i8* %109, i64 16
  %112 = bitcast i8* %111 to <16 x i8>*
  store <16 x i8> %108, <16 x i8>* %112, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  br label %.preheader

; <label>:113:                                    ; preds = %116
  %114 = add nuw nsw i64 %5, 1
  %115 = icmp eq i64 %114, 220
  br i1 %115, label %.loopexit.loopexit, label %4

; <label>:116:                                    ; preds = %.preheader, %116
  %117 = phi i64 [ %137, %116 ], [ %22, %.preheader ]
  %118 = add i64 %117, %6
  %119 = add nsw i64 %118, -1
  %120 = getelementptr inbounds i8, i8* %0, i64 %119
  %121 = load i8, i8* %120, align 1, !tbaa !1
  %122 = getelementptr inbounds i8, i8* %1, i64 %118
  store i8 %121, i8* %122, align 1, !tbaa !1
  %123 = add i64 %23, %117
  %124 = getelementptr inbounds i8, i8* %0, i64 %118
  %125 = load i8, i8* %124, align 1, !tbaa !1
  %126 = getelementptr inbounds i8, i8* %1, i64 %123
  store i8 %125, i8* %126, align 1, !tbaa !1
  %127 = add i64 %24, %117
  %128 = add nsw i64 %127, -1
  %129 = getelementptr inbounds i8, i8* %0, i64 %128
  %130 = load i8, i8* %129, align 1, !tbaa !1
  %131 = getelementptr inbounds i8, i8* %1, i64 %127
  store i8 %130, i8* %131, align 1, !tbaa !1
  %132 = add i64 %25, %117
  %133 = add nsw i64 %132, -1
  %134 = getelementptr inbounds i8, i8* %0, i64 %133
  %135 = load i8, i8* %134, align 1, !tbaa !1
  %136 = getelementptr inbounds i8, i8* %1, i64 %132
  store i8 %135, i8* %136, align 1, !tbaa !1
  %137 = add nsw i64 %117, 4
  %138 = icmp eq i64 %137, 277
  br i1 %138, label %113, label %116, !llvm.loop !18
}

; Function Attrs: norecurse uwtable
define i32 @main() local_unnamed_addr #6 {
  %1 = alloca [100 x i8], align 16
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %.sub = getelementptr inbounds [100 x i8], [100 x i8]* %1, i64 0, i64 0
  %5 = tail call noalias i8* @calloc(i64 62440, i64 1) #1
  %6 = tail call noalias i8* @calloc(i64 62440, i64 1) #1
  %7 = tail call noalias i8* @calloc(i64 62440, i64 1) #1
  %8 = tail call noalias i8* @calloc(i64 62440, i64 1) #1
  call void @llvm.lifetime.start(i64 100, i8* nonnull %.sub) #1
  %9 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %9) #1
  %10 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %10) #1
  %11 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %11) #1
  %12 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0))
  %13 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0))
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0), i8* nonnull %.sub, i32* nonnull %2, i32* nonnull %3, i32* nonnull %4)
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0), i8* nonnull %.sub, i32* nonnull %2, i32* nonnull %3, i32* nonnull %4)
  br label %16

; <label>:16:                                     ; preds = %155, %0
  %17 = phi i64 [ 0, %0 ], [ %156, %155 ]
  %18 = mul nuw nsw i64 %17, 280
  br label %158

; <label>:19:                                     ; preds = %155
  %20 = call i32 @fclose(%struct._IO_FILE* %12)
  %21 = call i32 @fclose(%struct._IO_FILE* %13)
  %22 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i64 0, i64 0), i64 18)
  br label %23

; <label>:23:                                     ; preds = %146, %19
  %24 = phi i64 [ 0, %19 ], [ %147, %146 ]
  %25 = mul nuw nsw i64 %24, 280
  %26 = shl i64 %24, 32
  %27 = ashr exact i64 %26, 32
  br label %28

; <label>:28:                                     ; preds = %.loopexit, %23
  %29 = phi i64 [ 0, %23 ], [ %144, %.loopexit ]
  %30 = add nsw i64 %29, -4
  %31 = icmp slt i64 %30, 60
  %32 = select i1 %31, i64 %30, i64 60
  %33 = trunc i64 %32 to i32
  %34 = icmp slt i32 %33, 0
  br i1 %34, label %.loopexit, label %35

; <label>:35:                                     ; preds = %28
  %36 = shl i64 %29, 32
  %37 = ashr exact i64 %36, 32
  %38 = shl i64 %32, 32
  %39 = ashr exact i64 %38, 32
  br label %40

; <label>:40:                                     ; preds = %45, %35
  %41 = phi i64 [ %53, %45 ], [ 0, %35 ]
  %42 = phi float [ %52, %45 ], [ 0.000000e+00, %35 ]
  %43 = phi i32 [ %51, %45 ], [ 0, %35 ]
  %44 = sub nsw i64 %37, %41
  br label %55

; <label>:45:                                     ; preds = %55
  %46 = fmul float %133, %133
  %47 = fmul float %137, %134
  %48 = fdiv float %46, %47
  %49 = fcmp ogt float %48, %42
  %50 = trunc i64 %41 to i32
  %51 = select i1 %49, i32 %50, i32 %43
  %52 = select i1 %49, float %48, float %42
  %53 = add nuw nsw i64 %41, 1
  %54 = icmp slt i64 %41, %39
  br i1 %54, label %40, label %.loopexit.loopexit

; <label>:55:                                     ; preds = %55, %40
  %56 = phi i64 [ %138, %55 ], [ 0, %40 ]
  %57 = phi float [ %137, %55 ], [ 0.000000e+00, %40 ]
  %58 = phi float [ %134, %55 ], [ 0.000000e+00, %40 ]
  %59 = phi float [ %133, %55 ], [ 0.000000e+00, %40 ]
  %60 = add nuw nsw i64 %56, %27
  %61 = mul nuw nsw i64 %60, 280
  %62 = add nuw nsw i64 %61, %37
  %63 = add nsw i64 %61, %44
  %64 = getelementptr inbounds i8, i8* %5, i64 %62
  %65 = load i8, i8* %64, align 1, !tbaa !1
  %66 = zext i8 %65 to i32
  %67 = getelementptr inbounds i8, i8* %6, i64 %63
  %68 = load i8, i8* %67, align 1, !tbaa !1
  %69 = zext i8 %68 to i32
  %70 = mul nuw nsw i32 %69, %66
  %71 = sitofp i32 %70 to float
  %72 = mul nuw nsw i32 %66, %66
  %73 = sitofp i32 %72 to float
  %74 = insertelement <2 x float> undef, float %71, i32 0
  %75 = insertelement <2 x float> %74, float %73, i32 1
  %76 = insertelement <2 x float> undef, float %59, i32 0
  %77 = insertelement <2 x float> %76, float %58, i32 1
  %78 = fadd <2 x float> %77, %75
  %79 = mul nuw nsw i32 %69, %69
  %80 = sitofp i32 %79 to float
  %81 = fadd float %57, %80
  %82 = add nuw nsw i64 %62, 1
  %83 = getelementptr inbounds i8, i8* %5, i64 %82
  %84 = load i8, i8* %83, align 1, !tbaa !1
  %85 = zext i8 %84 to i32
  %86 = add nsw i64 %63, 1
  %87 = getelementptr inbounds i8, i8* %6, i64 %86
  %88 = load i8, i8* %87, align 1, !tbaa !1
  %89 = zext i8 %88 to i32
  %90 = mul nuw nsw i32 %89, %85
  %91 = sitofp i32 %90 to float
  %92 = mul nuw nsw i32 %85, %85
  %93 = sitofp i32 %92 to float
  %94 = insertelement <2 x float> undef, float %91, i32 0
  %95 = insertelement <2 x float> %94, float %93, i32 1
  %96 = fadd <2 x float> %78, %95
  %97 = mul nuw nsw i32 %89, %89
  %98 = sitofp i32 %97 to float
  %99 = fadd float %81, %98
  %100 = add nuw nsw i64 %62, 2
  %101 = getelementptr inbounds i8, i8* %5, i64 %100
  %102 = load i8, i8* %101, align 1, !tbaa !1
  %103 = zext i8 %102 to i32
  %104 = add nsw i64 %63, 2
  %105 = getelementptr inbounds i8, i8* %6, i64 %104
  %106 = load i8, i8* %105, align 1, !tbaa !1
  %107 = zext i8 %106 to i32
  %108 = mul nuw nsw i32 %107, %103
  %109 = sitofp i32 %108 to float
  %110 = mul nuw nsw i32 %103, %103
  %111 = sitofp i32 %110 to float
  %112 = insertelement <2 x float> undef, float %109, i32 0
  %113 = insertelement <2 x float> %112, float %111, i32 1
  %114 = fadd <2 x float> %96, %113
  %115 = mul nuw nsw i32 %107, %107
  %116 = sitofp i32 %115 to float
  %117 = fadd float %99, %116
  %118 = add nuw nsw i64 %62, 3
  %119 = getelementptr inbounds i8, i8* %5, i64 %118
  %120 = load i8, i8* %119, align 1, !tbaa !1
  %121 = zext i8 %120 to i32
  %122 = add nsw i64 %63, 3
  %123 = getelementptr inbounds i8, i8* %6, i64 %122
  %124 = load i8, i8* %123, align 1, !tbaa !1
  %125 = zext i8 %124 to i32
  %126 = mul nuw nsw i32 %125, %121
  %127 = sitofp i32 %126 to float
  %128 = mul nuw nsw i32 %121, %121
  %129 = sitofp i32 %128 to float
  %130 = insertelement <2 x float> undef, float %127, i32 0
  %131 = insertelement <2 x float> %130, float %129, i32 1
  %132 = fadd <2 x float> %114, %131
  %133 = extractelement <2 x float> %132, i32 0
  %134 = extractelement <2 x float> %132, i32 1
  %135 = mul nuw nsw i32 %125, %125
  %136 = sitofp i32 %135 to float
  %137 = fadd float %117, %136
  %138 = add nuw nsw i64 %56, 1
  %139 = icmp eq i64 %138, 4
  br i1 %139, label %45, label %55

.loopexit.loopexit:                               ; preds = %45
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %28
  %140 = phi i32 [ 0, %28 ], [ %51, %.loopexit.loopexit ]
  %141 = trunc i32 %140 to i8
  %142 = add nuw nsw i64 %29, %25
  %143 = getelementptr inbounds i8, i8* %7, i64 %142
  store i8 %141, i8* %143, align 1, !tbaa !1
  %144 = add nuw nsw i64 %29, 1
  %145 = icmp eq i64 %144, 276
  br i1 %145, label %146, label %28

; <label>:146:                                    ; preds = %.loopexit
  %147 = add nuw nsw i64 %24, 1
  %148 = icmp eq i64 %147, 219
  br i1 %148, label %149, label %23

; <label>:149:                                    ; preds = %146
  call void @_Z17Stereo_Vision_fixPhS_S_i(i8* %5, i8* %6, i8* %8, i32 60)
  %150 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6, i64 0, i64 0), i64 15)
  %151 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  %152 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  %153 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %151, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0), i32 280, i32 223, i32 255)
  %154 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %152, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0), i32 280, i32 223, i32 255)
  br label %167

; <label>:155:                                    ; preds = %158
  %156 = add nuw nsw i64 %17, 1
  %157 = icmp eq i64 %156, 223
  br i1 %157, label %19, label %16

; <label>:158:                                    ; preds = %158, %16
  %159 = phi i64 [ 0, %16 ], [ %165, %158 ]
  %160 = add nuw nsw i64 %159, %18
  %161 = getelementptr inbounds i8, i8* %5, i64 %160
  %162 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %161)
  %163 = getelementptr inbounds i8, i8* %6, i64 %160
  %164 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %163)
  %165 = add nuw nsw i64 %159, 1
  %166 = icmp eq i64 %165, 280
  br i1 %166, label %155, label %158

; <label>:167:                                    ; preds = %173, %149
  %168 = phi i64 [ 0, %149 ], [ %174, %173 ]
  %169 = mul nuw nsw i64 %168, 280
  br label %176

; <label>:170:                                    ; preds = %173
  %171 = call i32 @fclose(%struct._IO_FILE* %151)
  %172 = call i32 @fclose(%struct._IO_FILE* %152)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %11) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %10) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %9) #1
  call void @llvm.lifetime.end(i64 100, i8* nonnull %.sub) #1
  ret i32 0

; <label>:173:                                    ; preds = %176
  %174 = add nuw nsw i64 %168, 1
  %175 = icmp eq i64 %174, 223
  br i1 %175, label %170, label %167

; <label>:176:                                    ; preds = %176, %167
  %177 = phi i64 [ 0, %167 ], [ %187, %176 ]
  %178 = add nuw nsw i64 %177, %169
  %179 = getelementptr inbounds i8, i8* %7, i64 %178
  %180 = load i8, i8* %179, align 1, !tbaa !1
  %181 = zext i8 %180 to i32
  %182 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %151, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0), i32 %181)
  %183 = getelementptr inbounds i8, i8* %8, i64 %178
  %184 = load i8, i8* %183, align 1, !tbaa !1
  %185 = zext i8 %184 to i32
  %186 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %152, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0), i32 %185)
  %187 = add nuw nsw i64 %177, 1
  %188 = icmp eq i64 %187, 280
  br i1 %188, label %173, label %176
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) local_unnamed_addr #7

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #7

; Function Attrs: nounwind
declare i32 @fscanf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #7

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #7

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #7

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* dereferenceable(272), i8*, i64) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_Source.cpp() #8 section ".text.startup" {
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull @_ZStL8__ioinit)
  %1 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #1
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { norecurse noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C++ TBAA"}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
