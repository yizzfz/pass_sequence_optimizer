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

; Function Attrs: norecurse nounwind uwtable
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
  br i1 %87, label %.loopexit1.loopexit18, label %.split

.loopexit1.loopexit:                              ; preds = %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %12, i32 1, i1 false)
  br label %.loopexit1

.loopexit1.loopexit18:                            ; preds = %.loopexit
  br label %.loopexit1

.loopexit1:                                       ; preds = %.loopexit1.loopexit18, %.loopexit1.loopexit, %17
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
define void @_Z17Stereo_Vision_fixPhS_S_i(i8* nocapture readonly, i8* nocapture readonly, i8* nocapture, i32) local_unnamed_addr #2 {
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
define void @_Z4blurPhS_i(i8* nocapture readonly, i8* nocapture, i32) local_unnamed_addr #2 {
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

; <label>:39:                                     ; preds = %39, %.split.us.split
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

.us-lcssa.us.loopexit15:                          ; preds = %.loopexit
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit15, %.us-lcssa.us.loopexit, %.split.us
  %.lcssa4 = phi float [ undef, %.split.us ], [ %57, %.us-lcssa.us.loopexit ], [ %78, %.us-lcssa.us.loopexit15 ]
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
  br i1 %79, label %.us-lcssa.us.loopexit15, label %.split

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
define void @_Z8blur_fixPhS_(i8* nocapture readonly, i8* nocapture) local_unnamed_addr #2 {
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

; Function Attrs: norecurse nounwind uwtable
define void @_Z4testPhS_(i8* nocapture readonly, i8* nocapture) local_unnamed_addr #2 {
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %118
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  br label %3

; <label>:3:                                      ; preds = %118, %.loopexit
  %4 = phi i64 [ 0, %.loopexit ], [ %119, %118 ]
  %5 = mul nuw nsw i64 %4, 280
  %6 = getelementptr i8, i8* %1, i64 %5
  %7 = add nuw nsw i64 %5, 277
  %8 = getelementptr i8, i8* %1, i64 %7
  %9 = add nsw i64 %5, -1
  %10 = getelementptr i8, i8* %0, i64 %9
  %11 = add nuw nsw i64 %5, 276
  %12 = getelementptr i8, i8* %0, i64 %11
  %13 = icmp ult i8* %6, %12
  %14 = icmp ult i8* %10, %8
  %15 = and i1 %13, %14
  br i1 %15, label %.preheader, label %25

.preheader:                                       ; preds = %3, %25
  %.ph = phi i64 [ 0, %3 ], [ 256, %25 ]
  %16 = add nuw nsw i64 %.ph, %5
  %17 = add nsw i64 %16, -1
  %18 = getelementptr inbounds i8, i8* %0, i64 %17
  %19 = load i8, i8* %18, align 1, !tbaa !1
  %20 = getelementptr inbounds i8, i8* %1, i64 %16
  store i8 %19, i8* %20, align 1, !tbaa !1
  %21 = or i64 %.ph, 1
  %22 = or i64 %5, 1
  %23 = or i64 %5, 2
  %24 = or i64 %5, 3
  br label %121

; <label>:25:                                     ; preds = %3
  %26 = bitcast i8* %10 to <16 x i8>*
  %27 = load <16 x i8>, <16 x i8>* %26, align 1, !tbaa !1, !alias.scope !13
  %28 = getelementptr i8, i8* %10, i64 16
  %29 = bitcast i8* %28 to <16 x i8>*
  %30 = load <16 x i8>, <16 x i8>* %29, align 1, !tbaa !1, !alias.scope !13
  %31 = bitcast i8* %6 to <16 x i8>*
  store <16 x i8> %27, <16 x i8>* %31, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %32 = getelementptr i8, i8* %6, i64 16
  %33 = bitcast i8* %32 to <16 x i8>*
  store <16 x i8> %30, <16 x i8>* %33, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %34 = add nuw nsw i64 %5, 32
  %35 = add nuw nsw i64 %5, 31
  %36 = getelementptr inbounds i8, i8* %0, i64 %35
  %37 = bitcast i8* %36 to <16 x i8>*
  %38 = load <16 x i8>, <16 x i8>* %37, align 1, !tbaa !1, !alias.scope !13
  %39 = getelementptr i8, i8* %36, i64 16
  %40 = bitcast i8* %39 to <16 x i8>*
  %41 = load <16 x i8>, <16 x i8>* %40, align 1, !tbaa !1, !alias.scope !13
  %42 = getelementptr inbounds i8, i8* %1, i64 %34
  %43 = bitcast i8* %42 to <16 x i8>*
  store <16 x i8> %38, <16 x i8>* %43, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %44 = getelementptr i8, i8* %42, i64 16
  %45 = bitcast i8* %44 to <16 x i8>*
  store <16 x i8> %41, <16 x i8>* %45, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %46 = add nuw nsw i64 %5, 64
  %47 = add nuw nsw i64 %5, 63
  %48 = getelementptr inbounds i8, i8* %0, i64 %47
  %49 = bitcast i8* %48 to <16 x i8>*
  %50 = load <16 x i8>, <16 x i8>* %49, align 1, !tbaa !1, !alias.scope !13
  %51 = getelementptr i8, i8* %48, i64 16
  %52 = bitcast i8* %51 to <16 x i8>*
  %53 = load <16 x i8>, <16 x i8>* %52, align 1, !tbaa !1, !alias.scope !13
  %54 = getelementptr inbounds i8, i8* %1, i64 %46
  %55 = bitcast i8* %54 to <16 x i8>*
  store <16 x i8> %50, <16 x i8>* %55, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %56 = getelementptr i8, i8* %54, i64 16
  %57 = bitcast i8* %56 to <16 x i8>*
  store <16 x i8> %53, <16 x i8>* %57, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %58 = add nuw nsw i64 %5, 96
  %59 = add nuw nsw i64 %5, 95
  %60 = getelementptr inbounds i8, i8* %0, i64 %59
  %61 = bitcast i8* %60 to <16 x i8>*
  %62 = load <16 x i8>, <16 x i8>* %61, align 1, !tbaa !1, !alias.scope !13
  %63 = getelementptr i8, i8* %60, i64 16
  %64 = bitcast i8* %63 to <16 x i8>*
  %65 = load <16 x i8>, <16 x i8>* %64, align 1, !tbaa !1, !alias.scope !13
  %66 = getelementptr inbounds i8, i8* %1, i64 %58
  %67 = bitcast i8* %66 to <16 x i8>*
  store <16 x i8> %62, <16 x i8>* %67, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %68 = getelementptr i8, i8* %66, i64 16
  %69 = bitcast i8* %68 to <16 x i8>*
  store <16 x i8> %65, <16 x i8>* %69, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %70 = add nuw nsw i64 %5, 128
  %71 = add nuw nsw i64 %5, 127
  %72 = getelementptr inbounds i8, i8* %0, i64 %71
  %73 = bitcast i8* %72 to <16 x i8>*
  %74 = load <16 x i8>, <16 x i8>* %73, align 1, !tbaa !1, !alias.scope !13
  %75 = getelementptr i8, i8* %72, i64 16
  %76 = bitcast i8* %75 to <16 x i8>*
  %77 = load <16 x i8>, <16 x i8>* %76, align 1, !tbaa !1, !alias.scope !13
  %78 = getelementptr inbounds i8, i8* %1, i64 %70
  %79 = bitcast i8* %78 to <16 x i8>*
  store <16 x i8> %74, <16 x i8>* %79, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %80 = getelementptr i8, i8* %78, i64 16
  %81 = bitcast i8* %80 to <16 x i8>*
  store <16 x i8> %77, <16 x i8>* %81, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %82 = add nuw nsw i64 %5, 160
  %83 = add nuw nsw i64 %5, 159
  %84 = getelementptr inbounds i8, i8* %0, i64 %83
  %85 = bitcast i8* %84 to <16 x i8>*
  %86 = load <16 x i8>, <16 x i8>* %85, align 1, !tbaa !1, !alias.scope !13
  %87 = getelementptr i8, i8* %84, i64 16
  %88 = bitcast i8* %87 to <16 x i8>*
  %89 = load <16 x i8>, <16 x i8>* %88, align 1, !tbaa !1, !alias.scope !13
  %90 = getelementptr inbounds i8, i8* %1, i64 %82
  %91 = bitcast i8* %90 to <16 x i8>*
  store <16 x i8> %86, <16 x i8>* %91, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %92 = getelementptr i8, i8* %90, i64 16
  %93 = bitcast i8* %92 to <16 x i8>*
  store <16 x i8> %89, <16 x i8>* %93, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %94 = add nuw nsw i64 %5, 192
  %95 = add nuw nsw i64 %5, 191
  %96 = getelementptr inbounds i8, i8* %0, i64 %95
  %97 = bitcast i8* %96 to <16 x i8>*
  %98 = load <16 x i8>, <16 x i8>* %97, align 1, !tbaa !1, !alias.scope !13
  %99 = getelementptr i8, i8* %96, i64 16
  %100 = bitcast i8* %99 to <16 x i8>*
  %101 = load <16 x i8>, <16 x i8>* %100, align 1, !tbaa !1, !alias.scope !13
  %102 = getelementptr inbounds i8, i8* %1, i64 %94
  %103 = bitcast i8* %102 to <16 x i8>*
  store <16 x i8> %98, <16 x i8>* %103, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %104 = getelementptr i8, i8* %102, i64 16
  %105 = bitcast i8* %104 to <16 x i8>*
  store <16 x i8> %101, <16 x i8>* %105, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %106 = add nuw nsw i64 %5, 224
  %107 = add nuw nsw i64 %5, 223
  %108 = getelementptr inbounds i8, i8* %0, i64 %107
  %109 = bitcast i8* %108 to <16 x i8>*
  %110 = load <16 x i8>, <16 x i8>* %109, align 1, !tbaa !1, !alias.scope !13
  %111 = getelementptr i8, i8* %108, i64 16
  %112 = bitcast i8* %111 to <16 x i8>*
  %113 = load <16 x i8>, <16 x i8>* %112, align 1, !tbaa !1, !alias.scope !13
  %114 = getelementptr inbounds i8, i8* %1, i64 %106
  %115 = bitcast i8* %114 to <16 x i8>*
  store <16 x i8> %110, <16 x i8>* %115, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %116 = getelementptr i8, i8* %114, i64 16
  %117 = bitcast i8* %116 to <16 x i8>*
  store <16 x i8> %113, <16 x i8>* %117, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  br label %.preheader

; <label>:118:                                    ; preds = %121
  %119 = add nuw nsw i64 %4, 1
  %120 = icmp eq i64 %119, 220
  br i1 %120, label %.loopexit.loopexit, label %3

; <label>:121:                                    ; preds = %.preheader, %121
  %122 = phi i64 [ %142, %121 ], [ %21, %.preheader ]
  %123 = add i64 %122, %5
  %124 = add nsw i64 %123, -1
  %125 = getelementptr inbounds i8, i8* %0, i64 %124
  %126 = load i8, i8* %125, align 1, !tbaa !1
  %127 = getelementptr inbounds i8, i8* %1, i64 %123
  store i8 %126, i8* %127, align 1, !tbaa !1
  %128 = add i64 %22, %122
  %129 = getelementptr inbounds i8, i8* %0, i64 %123
  %130 = load i8, i8* %129, align 1, !tbaa !1
  %131 = getelementptr inbounds i8, i8* %1, i64 %128
  store i8 %130, i8* %131, align 1, !tbaa !1
  %132 = add i64 %23, %122
  %133 = add nsw i64 %132, -1
  %134 = getelementptr inbounds i8, i8* %0, i64 %133
  %135 = load i8, i8* %134, align 1, !tbaa !1
  %136 = getelementptr inbounds i8, i8* %1, i64 %132
  store i8 %135, i8* %136, align 1, !tbaa !1
  %137 = add i64 %24, %122
  %138 = add nsw i64 %137, -1
  %139 = getelementptr inbounds i8, i8* %0, i64 %138
  %140 = load i8, i8* %139, align 1, !tbaa !1
  %141 = getelementptr inbounds i8, i8* %1, i64 %137
  store i8 %140, i8* %141, align 1, !tbaa !1
  %142 = add nsw i64 %122, 4
  %143 = icmp eq i64 %142, 277
  br i1 %143, label %118, label %121, !llvm.loop !18
}

; Function Attrs: norecurse uwtable
define i32 @main() local_unnamed_addr #4 {
  %1 = alloca [100 x i8], align 16
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = tail call noalias i8* @calloc(i64 62440, i64 1) #1
  %6 = tail call noalias i8* @calloc(i64 62440, i64 1) #1
  %7 = tail call noalias i8* @calloc(i64 62440, i64 1) #1
  %8 = tail call noalias i8* @calloc(i64 62440, i64 1) #1
  %9 = getelementptr inbounds [100 x i8], [100 x i8]* %1, i64 0, i64 0
  call void @llvm.lifetime.start(i64 100, i8* nonnull %9) #1
  %10 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %10) #1
  %11 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %11) #1
  %12 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %12) #1
  %13 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0))
  %14 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0))
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0), i8* nonnull %9, i32* nonnull %2, i32* nonnull %3, i32* nonnull %4)
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0), i8* nonnull %9, i32* nonnull %2, i32* nonnull %3, i32* nonnull %4)
  br label %17

; <label>:17:                                     ; preds = %156, %0
  %18 = phi i64 [ 0, %0 ], [ %157, %156 ]
  %19 = mul nuw nsw i64 %18, 280
  br label %159

; <label>:20:                                     ; preds = %156
  %21 = call i32 @fclose(%struct._IO_FILE* %13)
  %22 = call i32 @fclose(%struct._IO_FILE* %14)
  %23 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i64 0, i64 0), i64 18)
  br label %24

; <label>:24:                                     ; preds = %147, %20
  %25 = phi i64 [ 0, %20 ], [ %148, %147 ]
  %26 = mul nuw nsw i64 %25, 280
  %27 = shl i64 %25, 32
  %28 = ashr exact i64 %27, 32
  br label %29

; <label>:29:                                     ; preds = %.loopexit, %24
  %30 = phi i64 [ 0, %24 ], [ %145, %.loopexit ]
  %31 = add nsw i64 %30, -4
  %32 = icmp slt i64 %31, 60
  %33 = select i1 %32, i64 %31, i64 60
  %34 = trunc i64 %33 to i32
  %35 = icmp slt i32 %34, 0
  br i1 %35, label %.loopexit, label %36

; <label>:36:                                     ; preds = %29
  %37 = shl i64 %30, 32
  %38 = ashr exact i64 %37, 32
  %39 = shl i64 %33, 32
  %40 = ashr exact i64 %39, 32
  br label %41

; <label>:41:                                     ; preds = %46, %36
  %42 = phi i64 [ %54, %46 ], [ 0, %36 ]
  %43 = phi float [ %53, %46 ], [ 0.000000e+00, %36 ]
  %44 = phi i32 [ %52, %46 ], [ 0, %36 ]
  %45 = sub nsw i64 %38, %42
  br label %56

; <label>:46:                                     ; preds = %56
  %47 = fmul float %134, %134
  %48 = fmul float %138, %135
  %49 = fdiv float %47, %48
  %50 = fcmp ogt float %49, %43
  %51 = trunc i64 %42 to i32
  %52 = select i1 %50, i32 %51, i32 %44
  %53 = select i1 %50, float %49, float %43
  %54 = add nuw nsw i64 %42, 1
  %55 = icmp slt i64 %42, %40
  br i1 %55, label %41, label %.loopexit.loopexit

; <label>:56:                                     ; preds = %56, %41
  %57 = phi i64 [ %139, %56 ], [ 0, %41 ]
  %58 = phi float [ %138, %56 ], [ 0.000000e+00, %41 ]
  %59 = phi float [ %135, %56 ], [ 0.000000e+00, %41 ]
  %60 = phi float [ %134, %56 ], [ 0.000000e+00, %41 ]
  %61 = add nuw nsw i64 %57, %28
  %62 = mul nuw nsw i64 %61, 280
  %63 = add nuw nsw i64 %62, %38
  %64 = add nsw i64 %62, %45
  %65 = getelementptr inbounds i8, i8* %5, i64 %63
  %66 = load i8, i8* %65, align 1, !tbaa !1
  %67 = zext i8 %66 to i32
  %68 = getelementptr inbounds i8, i8* %6, i64 %64
  %69 = load i8, i8* %68, align 1, !tbaa !1
  %70 = zext i8 %69 to i32
  %71 = mul nuw nsw i32 %70, %67
  %72 = sitofp i32 %71 to float
  %73 = mul nuw nsw i32 %67, %67
  %74 = sitofp i32 %73 to float
  %75 = insertelement <2 x float> undef, float %72, i32 0
  %76 = insertelement <2 x float> %75, float %74, i32 1
  %77 = insertelement <2 x float> undef, float %60, i32 0
  %78 = insertelement <2 x float> %77, float %59, i32 1
  %79 = fadd <2 x float> %78, %76
  %80 = mul nuw nsw i32 %70, %70
  %81 = sitofp i32 %80 to float
  %82 = fadd float %58, %81
  %83 = add nuw nsw i64 %63, 1
  %84 = getelementptr inbounds i8, i8* %5, i64 %83
  %85 = load i8, i8* %84, align 1, !tbaa !1
  %86 = zext i8 %85 to i32
  %87 = add nsw i64 %64, 1
  %88 = getelementptr inbounds i8, i8* %6, i64 %87
  %89 = load i8, i8* %88, align 1, !tbaa !1
  %90 = zext i8 %89 to i32
  %91 = mul nuw nsw i32 %90, %86
  %92 = sitofp i32 %91 to float
  %93 = mul nuw nsw i32 %86, %86
  %94 = sitofp i32 %93 to float
  %95 = insertelement <2 x float> undef, float %92, i32 0
  %96 = insertelement <2 x float> %95, float %94, i32 1
  %97 = fadd <2 x float> %79, %96
  %98 = mul nuw nsw i32 %90, %90
  %99 = sitofp i32 %98 to float
  %100 = fadd float %82, %99
  %101 = add nuw nsw i64 %63, 2
  %102 = getelementptr inbounds i8, i8* %5, i64 %101
  %103 = load i8, i8* %102, align 1, !tbaa !1
  %104 = zext i8 %103 to i32
  %105 = add nsw i64 %64, 2
  %106 = getelementptr inbounds i8, i8* %6, i64 %105
  %107 = load i8, i8* %106, align 1, !tbaa !1
  %108 = zext i8 %107 to i32
  %109 = mul nuw nsw i32 %108, %104
  %110 = sitofp i32 %109 to float
  %111 = mul nuw nsw i32 %104, %104
  %112 = sitofp i32 %111 to float
  %113 = insertelement <2 x float> undef, float %110, i32 0
  %114 = insertelement <2 x float> %113, float %112, i32 1
  %115 = fadd <2 x float> %97, %114
  %116 = mul nuw nsw i32 %108, %108
  %117 = sitofp i32 %116 to float
  %118 = fadd float %100, %117
  %119 = add nuw nsw i64 %63, 3
  %120 = getelementptr inbounds i8, i8* %5, i64 %119
  %121 = load i8, i8* %120, align 1, !tbaa !1
  %122 = zext i8 %121 to i32
  %123 = add nsw i64 %64, 3
  %124 = getelementptr inbounds i8, i8* %6, i64 %123
  %125 = load i8, i8* %124, align 1, !tbaa !1
  %126 = zext i8 %125 to i32
  %127 = mul nuw nsw i32 %126, %122
  %128 = sitofp i32 %127 to float
  %129 = mul nuw nsw i32 %122, %122
  %130 = sitofp i32 %129 to float
  %131 = insertelement <2 x float> undef, float %128, i32 0
  %132 = insertelement <2 x float> %131, float %130, i32 1
  %133 = fadd <2 x float> %115, %132
  %134 = extractelement <2 x float> %133, i32 0
  %135 = extractelement <2 x float> %133, i32 1
  %136 = mul nuw nsw i32 %126, %126
  %137 = sitofp i32 %136 to float
  %138 = fadd float %118, %137
  %139 = add nuw nsw i64 %57, 1
  %140 = icmp eq i64 %139, 4
  br i1 %140, label %46, label %56

.loopexit.loopexit:                               ; preds = %46
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %29
  %141 = phi i32 [ 0, %29 ], [ %52, %.loopexit.loopexit ]
  %142 = trunc i32 %141 to i8
  %143 = add nuw nsw i64 %30, %26
  %144 = getelementptr inbounds i8, i8* %7, i64 %143
  store i8 %142, i8* %144, align 1, !tbaa !1
  %145 = add nuw nsw i64 %30, 1
  %146 = icmp eq i64 %145, 276
  br i1 %146, label %147, label %29

; <label>:147:                                    ; preds = %.loopexit
  %148 = add nuw nsw i64 %25, 1
  %149 = icmp eq i64 %148, 219
  br i1 %149, label %150, label %24

; <label>:150:                                    ; preds = %147
  call void @_Z17Stereo_Vision_fixPhS_S_i(i8* %5, i8* %6, i8* %8, i32 60)
  %151 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6, i64 0, i64 0), i64 15)
  %152 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  %153 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  %154 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %152, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0), i32 280, i32 223, i32 255)
  %155 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %153, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0), i32 280, i32 223, i32 255)
  br label %168

; <label>:156:                                    ; preds = %159
  %157 = add nuw nsw i64 %18, 1
  %158 = icmp eq i64 %157, 223
  br i1 %158, label %20, label %17

; <label>:159:                                    ; preds = %159, %17
  %160 = phi i64 [ 0, %17 ], [ %166, %159 ]
  %161 = add nuw nsw i64 %160, %19
  %162 = getelementptr inbounds i8, i8* %5, i64 %161
  %163 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %162)
  %164 = getelementptr inbounds i8, i8* %6, i64 %161
  %165 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %164)
  %166 = add nuw nsw i64 %160, 1
  %167 = icmp eq i64 %166, 280
  br i1 %167, label %156, label %159

; <label>:168:                                    ; preds = %174, %150
  %169 = phi i64 [ 0, %150 ], [ %175, %174 ]
  %170 = mul nuw nsw i64 %169, 280
  br label %177

; <label>:171:                                    ; preds = %174
  %172 = call i32 @fclose(%struct._IO_FILE* %152)
  %173 = call i32 @fclose(%struct._IO_FILE* %153)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %12) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %11) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %10) #1
  call void @llvm.lifetime.end(i64 100, i8* nonnull %9) #1
  ret i32 0

; <label>:174:                                    ; preds = %177
  %175 = add nuw nsw i64 %169, 1
  %176 = icmp eq i64 %175, 223
  br i1 %176, label %171, label %168

; <label>:177:                                    ; preds = %177, %168
  %178 = phi i64 [ 0, %168 ], [ %188, %177 ]
  %179 = add nuw nsw i64 %178, %170
  %180 = getelementptr inbounds i8, i8* %7, i64 %179
  %181 = load i8, i8* %180, align 1, !tbaa !1
  %182 = zext i8 %181 to i32
  %183 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %152, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0), i32 %182)
  %184 = getelementptr inbounds i8, i8* %8, i64 %179
  %185 = load i8, i8* %184, align 1, !tbaa !1
  %186 = zext i8 %185 to i32
  %187 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %153, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0), i32 %186)
  %188 = add nuw nsw i64 %178, 1
  %189 = icmp eq i64 %188, 280
  br i1 %189, label %174, label %177
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) local_unnamed_addr #5

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fscanf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #5

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* dereferenceable(272), i8*, i64) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_Source.cpp() #6 section ".text.startup" {
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull @_ZStL8__ioinit)
  %1 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #1
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

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
