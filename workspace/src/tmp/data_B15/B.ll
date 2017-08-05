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
  %10 = icmp sgt i32 %9, 0
  %11 = sext i32 %4 to i64
  %12 = sext i32 %3 to i64
  %13 = zext i32 %9 to i64
  %14 = zext i32 %4 to i64
  %15 = zext i32 %6 to i64
  %16 = icmp slt i32 %4, 1
  br label %.loopexit1._crit_edge

.loopexit1._crit_edge:                            ; preds = %.loopexit1, %8
  %17 = phi i64 [ 0, %8 ], [ %85, %.loopexit1 ]
  %18 = mul i64 %17, 280
  %scevgep = getelementptr i8, i8* %2, i64 %18
  br i1 %10, label %19, label %.loopexit1

; <label>:19:                                     ; preds = %.loopexit1._crit_edge
  %20 = trunc i64 %17 to i32
  br i1 %16, label %.loopexit1.loopexit, label %.split.preheader

.split.preheader:                                 ; preds = %19
  br label %.split

.split:                                           ; preds = %.split.preheader, %.loopexit
  %21 = phi i64 [ %83, %.loopexit ], [ 0, %.split.preheader ]
  %22 = sub nsw i64 %21, %11
  %23 = icmp slt i64 %22, %12
  %24 = trunc i64 %22 to i32
  %25 = select i1 %23, i32 %24, i32 %3
  %26 = icmp slt i32 %25, 0
  br i1 %26, label %.loopexit, label %27

; <label>:27:                                     ; preds = %.split
  %28 = trunc i64 %21 to i32
  br label %29

; <label>:29:                                     ; preds = %._crit_edge, %27
  %30 = phi float [ %41, %._crit_edge ], [ 0.000000e+00, %27 ]
  %31 = phi i32 [ %39, %._crit_edge ], [ 0, %27 ]
  %32 = phi i32 [ %40, %._crit_edge ], [ 0, %27 ]
  %33 = sub i32 %28, %32
  br label %._crit_edge10

; <label>:34:                                     ; preds = %50
  %35 = fmul float %70, %70
  %36 = fmul float %73, %76
  %37 = fdiv float %35, %36
  %38 = fcmp ogt float %37, %30
  %39 = select i1 %38, i32 %32, i32 %31
  %exitcond = icmp eq i32 %32, %25
  br i1 %exitcond, label %.loopexit.loopexit, label %._crit_edge

._crit_edge:                                      ; preds = %34
  %40 = add nuw nsw i32 %32, 1
  %41 = select i1 %38, float %37, float %30
  br label %29

._crit_edge10:                                    ; preds = %50, %29
  %42 = phi float [ 0.000000e+00, %29 ], [ %76, %50 ]
  %43 = phi float [ 0.000000e+00, %29 ], [ %73, %50 ]
  %44 = phi float [ 0.000000e+00, %29 ], [ %70, %50 ]
  %45 = phi i32 [ 0, %29 ], [ %51, %50 ]
  %46 = add nuw nsw i32 %45, %20
  %47 = mul nsw i32 %46, 280
  %48 = add i32 %47, %28
  %49 = add i32 %33, %47
  br label %._crit_edge11

; <label>:50:                                     ; preds = %._crit_edge11
  %51 = add nuw nsw i32 %45, 1
  %52 = icmp eq i32 %51, %4
  br i1 %52, label %34, label %._crit_edge10

._crit_edge11:                                    ; preds = %._crit_edge11, %._crit_edge10
  %53 = phi i64 [ 0, %._crit_edge10 ], [ %77, %._crit_edge11 ]
  %54 = phi float [ %42, %._crit_edge10 ], [ %76, %._crit_edge11 ]
  %55 = phi float [ %43, %._crit_edge10 ], [ %73, %._crit_edge11 ]
  %56 = phi float [ %44, %._crit_edge10 ], [ %70, %._crit_edge11 ]
  %57 = trunc i64 %53 to i32
  %58 = add i32 %48, %57
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8* %0, i64 %59
  %61 = load i8, i8* %60, align 1, !tbaa !1
  %62 = zext i8 %61 to i32
  %63 = add i32 %49, %57
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i8, i8* %1, i64 %64
  %66 = load i8, i8* %65, align 1, !tbaa !1
  %67 = zext i8 %66 to i32
  %68 = mul nuw nsw i32 %67, %62
  %69 = sitofp i32 %68 to float
  %70 = fadd float %56, %69
  %71 = mul nuw nsw i32 %62, %62
  %72 = sitofp i32 %71 to float
  %73 = fadd float %55, %72
  %74 = mul nuw nsw i32 %67, %67
  %75 = sitofp i32 %74 to float
  %76 = fadd float %54, %75
  %77 = add nuw nsw i64 %53, 1
  %78 = icmp eq i64 %77, %14
  br i1 %78, label %50, label %._crit_edge11

.loopexit.loopexit:                               ; preds = %34
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.split
  %79 = phi i32 [ 0, %.split ], [ %39, %.loopexit.loopexit ]
  %80 = trunc i32 %79 to i8
  %81 = add nuw nsw i64 %21, %18
  %82 = getelementptr inbounds i8, i8* %2, i64 %81
  store i8 %80, i8* %82, align 1, !tbaa !1
  %83 = add nuw nsw i64 %21, 1
  %84 = icmp eq i64 %83, %13
  br i1 %84, label %.loopexit1.loopexit20, label %.split

.loopexit1.loopexit:                              ; preds = %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %13, i32 1, i1 false)
  br label %.loopexit1

.loopexit1.loopexit20:                            ; preds = %.loopexit
  br label %.loopexit1

.loopexit1:                                       ; preds = %.loopexit1.loopexit20, %.loopexit1._crit_edge, %.loopexit1.loopexit
  %85 = add nuw nsw i64 %17, 1
  %86 = icmp eq i64 %85, %15
  br i1 %86, label %.loopexit2.loopexit, label %.loopexit1._crit_edge

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
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %120, %4
  %6 = phi i64 [ 0, %4 ], [ %121, %120 ]
  %7 = mul nuw nsw i64 %6, 280
  br label %.loopexit._crit_edge

.loopexit._crit_edge:                             ; preds = %.loopexit, %._crit_edge8
  %8 = phi i64 [ 0, %._crit_edge8 ], [ %118, %.loopexit ]
  %9 = add nsw i64 %8, -4
  %10 = icmp slt i64 %9, %5
  %11 = trunc i64 %9 to i32
  %12 = select i1 %10, i32 %11, i32 %3
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %.loopexit, label %14

; <label>:14:                                     ; preds = %.loopexit._crit_edge
  %15 = sext i32 %12 to i64
  br label %16

; <label>:16:                                     ; preds = %._crit_edge7, %14
  %17 = phi i64 [ %112, %._crit_edge7 ], [ 0, %14 ]
  %18 = phi float [ %113, %._crit_edge7 ], [ 0.000000e+00, %14 ]
  %19 = phi i32 [ %111, %._crit_edge7 ], [ 0, %14 ]
  %20 = sub nsw i64 %8, %17
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %16
  %21 = phi i64 [ 0, %16 ], [ %103, %._crit_edge ]
  %22 = phi float [ 0.000000e+00, %16 ], [ %102, %._crit_edge ]
  %23 = phi float [ 0.000000e+00, %16 ], [ %99, %._crit_edge ]
  %24 = phi float [ 0.000000e+00, %16 ], [ %98, %._crit_edge ]
  %25 = add nuw nsw i64 %21, %6
  %26 = mul nuw nsw i64 %25, 280
  %27 = add nuw nsw i64 %26, %8
  %28 = add nsw i64 %26, %20
  %29 = getelementptr inbounds i8, i8* %0, i64 %27
  %30 = load i8, i8* %29, align 1, !tbaa !1
  %31 = zext i8 %30 to i32
  %32 = getelementptr inbounds i8, i8* %1, i64 %28
  %33 = load i8, i8* %32, align 1, !tbaa !1
  %34 = zext i8 %33 to i32
  %35 = mul nuw nsw i32 %34, %31
  %36 = sitofp i32 %35 to float
  %37 = mul nuw nsw i32 %31, %31
  %38 = sitofp i32 %37 to float
  %39 = insertelement <2 x float> undef, float %36, i32 0
  %40 = insertelement <2 x float> %39, float %38, i32 1
  %41 = insertelement <2 x float> undef, float %24, i32 0
  %42 = insertelement <2 x float> %41, float %23, i32 1
  %43 = fadd <2 x float> %42, %40
  %44 = mul nuw nsw i32 %34, %34
  %45 = sitofp i32 %44 to float
  %46 = fadd float %22, %45
  %47 = add nuw nsw i64 %27, 1
  %48 = getelementptr inbounds i8, i8* %0, i64 %47
  %49 = load i8, i8* %48, align 1, !tbaa !1
  %50 = zext i8 %49 to i32
  %51 = add nsw i64 %28, 1
  %52 = getelementptr inbounds i8, i8* %1, i64 %51
  %53 = load i8, i8* %52, align 1, !tbaa !1
  %54 = zext i8 %53 to i32
  %55 = mul nuw nsw i32 %54, %50
  %56 = sitofp i32 %55 to float
  %57 = mul nuw nsw i32 %50, %50
  %58 = sitofp i32 %57 to float
  %59 = insertelement <2 x float> undef, float %56, i32 0
  %60 = insertelement <2 x float> %59, float %58, i32 1
  %61 = fadd <2 x float> %43, %60
  %62 = mul nuw nsw i32 %54, %54
  %63 = sitofp i32 %62 to float
  %64 = fadd float %46, %63
  %65 = add nuw nsw i64 %27, 2
  %66 = getelementptr inbounds i8, i8* %0, i64 %65
  %67 = load i8, i8* %66, align 1, !tbaa !1
  %68 = zext i8 %67 to i32
  %69 = add nsw i64 %28, 2
  %70 = getelementptr inbounds i8, i8* %1, i64 %69
  %71 = load i8, i8* %70, align 1, !tbaa !1
  %72 = zext i8 %71 to i32
  %73 = mul nuw nsw i32 %72, %68
  %74 = sitofp i32 %73 to float
  %75 = mul nuw nsw i32 %68, %68
  %76 = sitofp i32 %75 to float
  %77 = insertelement <2 x float> undef, float %74, i32 0
  %78 = insertelement <2 x float> %77, float %76, i32 1
  %79 = fadd <2 x float> %61, %78
  %80 = mul nuw nsw i32 %72, %72
  %81 = sitofp i32 %80 to float
  %82 = fadd float %64, %81
  %83 = add nuw nsw i64 %27, 3
  %84 = getelementptr inbounds i8, i8* %0, i64 %83
  %85 = load i8, i8* %84, align 1, !tbaa !1
  %86 = zext i8 %85 to i32
  %87 = add nsw i64 %28, 3
  %88 = getelementptr inbounds i8, i8* %1, i64 %87
  %89 = load i8, i8* %88, align 1, !tbaa !1
  %90 = zext i8 %89 to i32
  %91 = mul nuw nsw i32 %90, %86
  %92 = sitofp i32 %91 to float
  %93 = mul nuw nsw i32 %86, %86
  %94 = sitofp i32 %93 to float
  %95 = insertelement <2 x float> undef, float %92, i32 0
  %96 = insertelement <2 x float> %95, float %94, i32 1
  %97 = fadd <2 x float> %79, %96
  %98 = extractelement <2 x float> %97, i32 0
  %99 = extractelement <2 x float> %97, i32 1
  %100 = mul nuw nsw i32 %90, %90
  %101 = sitofp i32 %100 to float
  %102 = fadd float %82, %101
  %103 = add nuw nsw i64 %21, 1
  %104 = icmp eq i64 %103, 4
  br i1 %104, label %105, label %._crit_edge

; <label>:105:                                    ; preds = %._crit_edge
  %106 = fmul float %98, %98
  %107 = fmul float %99, %102
  %108 = fdiv float %106, %107
  %109 = fcmp ogt float %108, %18
  %110 = trunc i64 %17 to i32
  %111 = select i1 %109, i32 %110, i32 %19
  %exitcond = icmp eq i64 %17, %15
  br i1 %exitcond, label %.loopexit.loopexit, label %._crit_edge7

._crit_edge7:                                     ; preds = %105
  %112 = add nuw nsw i64 %17, 1
  %113 = select i1 %109, float %108, float %18
  br label %16

.loopexit.loopexit:                               ; preds = %105
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.loopexit._crit_edge
  %114 = phi i32 [ 0, %.loopexit._crit_edge ], [ %111, %.loopexit.loopexit ]
  %115 = trunc i32 %114 to i8
  %116 = add nuw nsw i64 %8, %7
  %117 = getelementptr inbounds i8, i8* %2, i64 %116
  store i8 %115, i8* %117, align 1, !tbaa !1
  %118 = add nuw nsw i64 %8, 1
  %119 = icmp eq i64 %118, 276
  br i1 %119, label %120, label %.loopexit._crit_edge

; <label>:120:                                    ; preds = %.loopexit
  %121 = add nuw nsw i64 %6, 1
  %122 = icmp eq i64 %121, 219
  br i1 %122, label %123, label %._crit_edge8

; <label>:123:                                    ; preds = %120
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
  %11 = icmp sgt i32 %10, 0
  %12 = icmp sgt i32 %2, 0
  %13 = sub i32 279, %2
  %14 = zext i32 %13 to i64
  %15 = add nuw nsw i64 %14, 1
  %16 = zext i32 %2 to i64
  %17 = zext i32 %10 to i64
  %18 = zext i32 %7 to i64
  %19 = and i64 %16, 1
  %20 = icmp eq i64 %19, 0
  %21 = icmp eq i32 %2, 1
  br label %.loopexit2._crit_edge

.loopexit2._crit_edge:                            ; preds = %.loopexit2, %9
  %22 = phi i64 [ 0, %9 ], [ %99, %.loopexit2 ]
  %23 = trunc i64 %22 to i32
  %24 = mul i64 %22, 1202590842880
  %25 = ashr exact i64 %24, 32
  %26 = getelementptr i8, i8* %1, i64 %25
  br i1 %11, label %27, label %.loopexit2

; <label>:27:                                     ; preds = %.loopexit2._crit_edge
  %28 = mul nuw nsw i64 %22, 280
  br i1 %12, label %.preheader1.preheader, label %30

.preheader1.preheader:                            ; preds = %27
  %sext = shl i64 %22, 32
  %29 = ashr exact i64 %sext, 32
  br label %.preheader1

; <label>:30:                                     ; preds = %27
  tail call void @llvm.memset.p0i8.i64(i8* %26, i8 0, i64 %15, i32 1, i1 false)
  br label %.loopexit2

.preheader1:                                      ; preds = %.us-lcssa.us, %.preheader1.preheader
  %31 = phi i64 [ 0, %.preheader1.preheader ], [ %63, %.us-lcssa.us ]
  %32 = trunc i64 %31 to i32
  br i1 %20, label %.split.us, label %.split.preheader

.split.preheader:                                 ; preds = %.preheader1
  br label %.split

.split.us:                                        ; preds = %.preheader1
  br i1 %21, label %.us-lcssa.us, label %.split.us.split.preheader

.split.us.split.preheader:                        ; preds = %.split.us
  br label %.split.us.split

.split.us.split:                                  ; preds = %.split.us.split.preheader, %.loopexit.us
  %33 = phi i32 [ %58, %.loopexit.us ], [ 0, %.split.us.split.preheader ]
  %34 = phi float [ %55, %.loopexit.us ], [ 0.000000e+00, %.split.us.split.preheader ]
  %35 = add nuw nsw i32 %33, %23
  %36 = mul nsw i32 %35, 280
  %37 = add i32 %36, %32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.split.us.split
  %38 = phi i64 [ 0, %.split.us.split ], [ %56, %._crit_edge ]
  %39 = phi float [ %34, %.split.us.split ], [ %55, %._crit_edge ]
  %40 = trunc i64 %38 to i32
  %41 = add i32 %40, %37
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8* %0, i64 %42
  %44 = load i8, i8* %43, align 1, !tbaa !1
  %45 = uitofp i8 %44 to float
  %46 = fmul float %6, %45
  %47 = fadd float %39, %46
  %48 = or i32 %40, 1
  %49 = add i32 %48, %37
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8* %0, i64 %50
  %52 = load i8, i8* %51, align 1, !tbaa !1
  %53 = uitofp i8 %52 to float
  %54 = fmul float %6, %53
  %55 = fadd float %47, %54
  %56 = add nuw nsw i64 %38, 2
  %57 = icmp eq i64 %56, %16
  br i1 %57, label %.loopexit.us, label %._crit_edge

.loopexit.us:                                     ; preds = %._crit_edge
  %58 = add nuw nsw i32 %33, 1
  %59 = icmp eq i32 %58, %2
  br i1 %59, label %.us-lcssa.us.loopexit, label %.split.us.split

.us-lcssa.us.loopexit:                            ; preds = %.loopexit.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit15:                          ; preds = %.loopexit
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit15, %.us-lcssa.us.loopexit, %.split.us
  %.lcssa4 = phi float [ undef, %.split.us ], [ %55, %.us-lcssa.us.loopexit ], [ %76, %.us-lcssa.us.loopexit15 ]
  %60 = fptoui float %.lcssa4 to i8
  %61 = add nuw nsw i64 %31, %28
  %62 = getelementptr inbounds i8, i8* %1, i64 %61
  store i8 %60, i8* %62, align 1, !tbaa !1
  %63 = add nuw nsw i64 %31, 1
  %64 = icmp eq i64 %63, %17
  br i1 %64, label %.loopexit2.loopexit, label %.preheader1

.split:                                           ; preds = %.split.preheader, %.loopexit
  %indvars.iv = phi i64 [ %indvars.iv.next, %.loopexit ], [ 0, %.split.preheader ]
  %65 = phi float [ %76, %.loopexit ], [ 0.000000e+00, %.split.preheader ]
  %66 = add nuw nsw i64 %indvars.iv, %29
  %67 = mul nsw i64 %66, 280
  %68 = trunc i64 %67 to i32
  %69 = add i32 %68, %32
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8* %0, i64 %70
  %72 = load i8, i8* %71, align 1, !tbaa !1
  %73 = uitofp i8 %72 to float
  %74 = fmul float %6, %73
  %75 = fadd float %65, %74
  br i1 %21, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.split
  br label %.preheader

.loopexit.loopexit:                               ; preds = %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.split
  %76 = phi float [ %75, %.split ], [ %96, %.loopexit.loopexit ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %77 = icmp eq i64 %indvars.iv.next, %16
  br i1 %77, label %.us-lcssa.us.loopexit15, label %.split

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %78 = phi i64 [ %97, %.preheader ], [ 1, %.preheader.preheader ]
  %79 = phi float [ %96, %.preheader ], [ %75, %.preheader.preheader ]
  %80 = trunc i64 %78 to i32
  %81 = add i32 %80, %69
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i8, i8* %0, i64 %82
  %84 = load i8, i8* %83, align 1, !tbaa !1
  %85 = uitofp i8 %84 to float
  %86 = fmul float %6, %85
  %87 = fadd float %79, %86
  %88 = add nuw nsw i64 %78, 1
  %89 = trunc i64 %88 to i32
  %90 = add i32 %89, %69
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, i8* %0, i64 %91
  %93 = load i8, i8* %92, align 1, !tbaa !1
  %94 = uitofp i8 %93 to float
  %95 = fmul float %6, %94
  %96 = fadd float %87, %95
  %97 = add nuw nsw i64 %78, 2
  %98 = icmp eq i64 %97, %16
  br i1 %98, label %.loopexit.loopexit, label %.preheader

.loopexit3.loopexit:                              ; preds = %.loopexit2
  br label %.loopexit3

.loopexit3:                                       ; preds = %.loopexit3.loopexit, %3
  ret void

.loopexit2.loopexit:                              ; preds = %.us-lcssa.us
  br label %.loopexit2

.loopexit2:                                       ; preds = %.loopexit2.loopexit, %.loopexit2._crit_edge, %30
  %99 = add nuw nsw i64 %22, 1
  %100 = icmp eq i64 %99, %18
  br i1 %100, label %.loopexit3.loopexit, label %.loopexit2._crit_edge
}

; Function Attrs: norecurse nounwind uwtable
define void @_Z8blur_fixPhS_(i8* nocapture readonly, i8* nocapture) local_unnamed_addr #4 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %146, %2
  %3 = phi i64 [ 0, %2 ], [ %12, %146 ]
  %4 = mul nuw nsw i64 %3, 280
  %5 = getelementptr i8, i8* %1, i64 %4
  %6 = add nuw nsw i64 %4, 277
  %7 = getelementptr i8, i8* %1, i64 %6
  %8 = getelementptr i8, i8* %0, i64 %4
  %9 = add nuw nsw i64 %4, 839
  %10 = getelementptr i8, i8* %0, i64 %9
  %11 = add nuw nsw i64 %4, 560
  %12 = add nuw nsw i64 %3, 1
  %13 = mul nuw nsw i64 %12, 280
  %14 = icmp ult i8* %5, %10
  %15 = icmp ult i8* %8, %7
  %16 = and i1 %14, %15
  br i1 %16, label %.preheader.preheader, label %.preheader1.preheader

.preheader1.preheader:                            ; preds = %._crit_edge
  br label %.preheader1

.preheader.preheader.loopexit:                    ; preds = %.preheader1
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit, %._crit_edge
  %.ph = phi i64 [ 0, %._crit_edge ], [ 272, %.preheader.preheader.loopexit ]
  br label %.preheader

.preheader1:                                      ; preds = %.preheader1.preheader, %.preheader1
  %17 = phi i64 [ %84, %.preheader1 ], [ 0, %.preheader1.preheader ]
  %18 = add nuw nsw i64 %17, %4
  %19 = getelementptr inbounds i8, i8* %0, i64 %18
  %20 = bitcast i8* %19 to <16 x i8>*
  %21 = load <16 x i8>, <16 x i8>* %20, align 1, !tbaa !1, !alias.scope !4
  %22 = uitofp <16 x i8> %21 to <16 x float>
  %23 = fmul <16 x float> %22, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %24 = fadd <16 x float> %23, zeroinitializer
  %25 = or i64 %18, 1
  %26 = getelementptr inbounds i8, i8* %0, i64 %25
  %27 = bitcast i8* %26 to <16 x i8>*
  %28 = load <16 x i8>, <16 x i8>* %27, align 1, !tbaa !1, !alias.scope !4
  %29 = uitofp <16 x i8> %28 to <16 x float>
  %30 = fmul <16 x float> %29, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %31 = fadd <16 x float> %24, %30
  %32 = or i64 %18, 2
  %33 = getelementptr inbounds i8, i8* %0, i64 %32
  %34 = bitcast i8* %33 to <16 x i8>*
  %35 = load <16 x i8>, <16 x i8>* %34, align 1, !tbaa !1, !alias.scope !4
  %36 = uitofp <16 x i8> %35 to <16 x float>
  %37 = fmul <16 x float> %36, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %38 = fadd <16 x float> %31, %37
  %39 = add nuw nsw i64 %17, %13
  %40 = getelementptr inbounds i8, i8* %0, i64 %39
  %41 = bitcast i8* %40 to <16 x i8>*
  %42 = load <16 x i8>, <16 x i8>* %41, align 1, !tbaa !1, !alias.scope !4
  %43 = uitofp <16 x i8> %42 to <16 x float>
  %44 = fmul <16 x float> %43, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %45 = fadd <16 x float> %38, %44
  %46 = or i64 %39, 1
  %47 = getelementptr inbounds i8, i8* %0, i64 %46
  %48 = bitcast i8* %47 to <16 x i8>*
  %49 = load <16 x i8>, <16 x i8>* %48, align 1, !tbaa !1, !alias.scope !4
  %50 = uitofp <16 x i8> %49 to <16 x float>
  %51 = fmul <16 x float> %50, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %52 = fadd <16 x float> %45, %51
  %53 = or i64 %39, 2
  %54 = getelementptr inbounds i8, i8* %0, i64 %53
  %55 = bitcast i8* %54 to <16 x i8>*
  %56 = load <16 x i8>, <16 x i8>* %55, align 1, !tbaa !1, !alias.scope !4
  %57 = uitofp <16 x i8> %56 to <16 x float>
  %58 = fmul <16 x float> %57, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %59 = fadd <16 x float> %52, %58
  %60 = add nuw nsw i64 %17, %11
  %61 = getelementptr inbounds i8, i8* %0, i64 %60
  %62 = bitcast i8* %61 to <16 x i8>*
  %63 = load <16 x i8>, <16 x i8>* %62, align 1, !tbaa !1, !alias.scope !4
  %64 = uitofp <16 x i8> %63 to <16 x float>
  %65 = fmul <16 x float> %64, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %66 = fadd <16 x float> %59, %65
  %67 = or i64 %60, 1
  %68 = getelementptr inbounds i8, i8* %0, i64 %67
  %69 = bitcast i8* %68 to <16 x i8>*
  %70 = load <16 x i8>, <16 x i8>* %69, align 1, !tbaa !1, !alias.scope !4
  %71 = uitofp <16 x i8> %70 to <16 x float>
  %72 = fmul <16 x float> %71, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %73 = fadd <16 x float> %66, %72
  %74 = or i64 %60, 2
  %75 = getelementptr inbounds i8, i8* %0, i64 %74
  %76 = bitcast i8* %75 to <16 x i8>*
  %77 = load <16 x i8>, <16 x i8>* %76, align 1, !tbaa !1, !alias.scope !4
  %78 = uitofp <16 x i8> %77 to <16 x float>
  %79 = fmul <16 x float> %78, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %80 = fadd <16 x float> %73, %79
  %81 = fptoui <16 x float> %80 to <16 x i8>
  %82 = getelementptr inbounds i8, i8* %1, i64 %18
  %83 = bitcast i8* %82 to <16 x i8>*
  store <16 x i8> %81, <16 x i8>* %83, align 1, !tbaa !1, !alias.scope !7, !noalias !4
  %84 = add nuw nsw i64 %17, 16
  %85 = icmp eq i64 %84, 272
  br i1 %85, label %.preheader.preheader.loopexit, label %.preheader1, !llvm.loop !9

; <label>:86:                                     ; preds = %146
  ret void

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %87 = phi i64 [ %144, %.preheader ], [ %.ph, %.preheader.preheader ]
  %88 = add nuw nsw i64 %87, %4
  %89 = getelementptr inbounds i8, i8* %0, i64 %88
  %90 = load i8, i8* %89, align 1, !tbaa !1
  %91 = uitofp i8 %90 to float
  %92 = fmul float %91, 0x3FBC71C720000000
  %93 = fadd float %92, 0.000000e+00
  %94 = add nuw nsw i64 %88, 1
  %95 = getelementptr inbounds i8, i8* %0, i64 %94
  %96 = load i8, i8* %95, align 1, !tbaa !1
  %97 = uitofp i8 %96 to float
  %98 = fmul float %97, 0x3FBC71C720000000
  %99 = fadd float %93, %98
  %100 = add nuw nsw i64 %88, 2
  %101 = getelementptr inbounds i8, i8* %0, i64 %100
  %102 = load i8, i8* %101, align 1, !tbaa !1
  %103 = uitofp i8 %102 to float
  %104 = fmul float %103, 0x3FBC71C720000000
  %105 = fadd float %99, %104
  %106 = add nuw nsw i64 %87, %13
  %107 = getelementptr inbounds i8, i8* %0, i64 %106
  %108 = load i8, i8* %107, align 1, !tbaa !1
  %109 = uitofp i8 %108 to float
  %110 = fmul float %109, 0x3FBC71C720000000
  %111 = fadd float %105, %110
  %112 = add nuw nsw i64 %106, 1
  %113 = getelementptr inbounds i8, i8* %0, i64 %112
  %114 = load i8, i8* %113, align 1, !tbaa !1
  %115 = uitofp i8 %114 to float
  %116 = fmul float %115, 0x3FBC71C720000000
  %117 = fadd float %111, %116
  %118 = add nuw nsw i64 %106, 2
  %119 = getelementptr inbounds i8, i8* %0, i64 %118
  %120 = load i8, i8* %119, align 1, !tbaa !1
  %121 = uitofp i8 %120 to float
  %122 = fmul float %121, 0x3FBC71C720000000
  %123 = fadd float %117, %122
  %124 = add nuw nsw i64 %87, %11
  %125 = getelementptr inbounds i8, i8* %0, i64 %124
  %126 = load i8, i8* %125, align 1, !tbaa !1
  %127 = uitofp i8 %126 to float
  %128 = fmul float %127, 0x3FBC71C720000000
  %129 = fadd float %123, %128
  %130 = add nuw nsw i64 %124, 1
  %131 = getelementptr inbounds i8, i8* %0, i64 %130
  %132 = load i8, i8* %131, align 1, !tbaa !1
  %133 = uitofp i8 %132 to float
  %134 = fmul float %133, 0x3FBC71C720000000
  %135 = fadd float %129, %134
  %136 = add nuw nsw i64 %124, 2
  %137 = getelementptr inbounds i8, i8* %0, i64 %136
  %138 = load i8, i8* %137, align 1, !tbaa !1
  %139 = uitofp i8 %138 to float
  %140 = fmul float %139, 0x3FBC71C720000000
  %141 = fadd float %135, %140
  %142 = fptoui float %141 to i8
  %143 = getelementptr inbounds i8, i8* %1, i64 %88
  store i8 %142, i8* %143, align 1, !tbaa !1
  %144 = add nuw nsw i64 %87, 1
  %145 = icmp eq i64 %144, 277
  br i1 %145, label %146, label %.preheader, !llvm.loop !12

; <label>:146:                                    ; preds = %.preheader
  %147 = icmp eq i64 %12, 220
  br i1 %147, label %86, label %._crit_edge
}

; Function Attrs: norecurse nounwind uwtable
define void @_Z4testPhS_(i8* nocapture readonly, i8* nocapture) local_unnamed_addr #4 {
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %117
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  br label %._crit_edge

._crit_edge:                                      ; preds = %117, %.loopexit
  %3 = phi i64 [ 0, %.loopexit ], [ %118, %117 ]
  %4 = mul nuw nsw i64 %3, 280
  %5 = getelementptr i8, i8* %1, i64 %4
  %6 = add nuw nsw i64 %4, 277
  %7 = getelementptr i8, i8* %1, i64 %6
  %8 = add nsw i64 %4, -1
  %9 = getelementptr i8, i8* %0, i64 %8
  %10 = add nuw nsw i64 %4, 276
  %11 = getelementptr i8, i8* %0, i64 %10
  %12 = icmp ult i8* %5, %11
  %13 = icmp ult i8* %9, %7
  %14 = and i1 %12, %13
  br i1 %14, label %.preheader, label %24

.preheader:                                       ; preds = %._crit_edge, %24
  %.ph = phi i64 [ 256, %24 ], [ 0, %._crit_edge ]
  %15 = add nuw nsw i64 %.ph, %4
  %16 = add nsw i64 %15, -1
  %17 = getelementptr inbounds i8, i8* %0, i64 %16
  %18 = load i8, i8* %17, align 1, !tbaa !1
  %19 = getelementptr inbounds i8, i8* %1, i64 %15
  store i8 %18, i8* %19, align 1, !tbaa !1
  %20 = or i64 %.ph, 1
  %21 = or i64 %4, 1
  %22 = or i64 %4, 2
  %23 = or i64 %4, 3
  br label %._crit_edge2

; <label>:24:                                     ; preds = %._crit_edge
  %25 = bitcast i8* %9 to <16 x i8>*
  %26 = load <16 x i8>, <16 x i8>* %25, align 1, !tbaa !1, !alias.scope !13
  %27 = getelementptr i8, i8* %9, i64 16
  %28 = bitcast i8* %27 to <16 x i8>*
  %29 = load <16 x i8>, <16 x i8>* %28, align 1, !tbaa !1, !alias.scope !13
  %30 = bitcast i8* %5 to <16 x i8>*
  store <16 x i8> %26, <16 x i8>* %30, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %31 = getelementptr i8, i8* %5, i64 16
  %32 = bitcast i8* %31 to <16 x i8>*
  store <16 x i8> %29, <16 x i8>* %32, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %33 = add nuw nsw i64 %4, 32
  %34 = add nuw nsw i64 %4, 31
  %35 = getelementptr inbounds i8, i8* %0, i64 %34
  %36 = bitcast i8* %35 to <16 x i8>*
  %37 = load <16 x i8>, <16 x i8>* %36, align 1, !tbaa !1, !alias.scope !13
  %38 = getelementptr i8, i8* %35, i64 16
  %39 = bitcast i8* %38 to <16 x i8>*
  %40 = load <16 x i8>, <16 x i8>* %39, align 1, !tbaa !1, !alias.scope !13
  %41 = getelementptr inbounds i8, i8* %1, i64 %33
  %42 = bitcast i8* %41 to <16 x i8>*
  store <16 x i8> %37, <16 x i8>* %42, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %43 = getelementptr i8, i8* %41, i64 16
  %44 = bitcast i8* %43 to <16 x i8>*
  store <16 x i8> %40, <16 x i8>* %44, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %45 = add nuw nsw i64 %4, 64
  %46 = add nuw nsw i64 %4, 63
  %47 = getelementptr inbounds i8, i8* %0, i64 %46
  %48 = bitcast i8* %47 to <16 x i8>*
  %49 = load <16 x i8>, <16 x i8>* %48, align 1, !tbaa !1, !alias.scope !13
  %50 = getelementptr i8, i8* %47, i64 16
  %51 = bitcast i8* %50 to <16 x i8>*
  %52 = load <16 x i8>, <16 x i8>* %51, align 1, !tbaa !1, !alias.scope !13
  %53 = getelementptr inbounds i8, i8* %1, i64 %45
  %54 = bitcast i8* %53 to <16 x i8>*
  store <16 x i8> %49, <16 x i8>* %54, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %55 = getelementptr i8, i8* %53, i64 16
  %56 = bitcast i8* %55 to <16 x i8>*
  store <16 x i8> %52, <16 x i8>* %56, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %57 = add nuw nsw i64 %4, 96
  %58 = add nuw nsw i64 %4, 95
  %59 = getelementptr inbounds i8, i8* %0, i64 %58
  %60 = bitcast i8* %59 to <16 x i8>*
  %61 = load <16 x i8>, <16 x i8>* %60, align 1, !tbaa !1, !alias.scope !13
  %62 = getelementptr i8, i8* %59, i64 16
  %63 = bitcast i8* %62 to <16 x i8>*
  %64 = load <16 x i8>, <16 x i8>* %63, align 1, !tbaa !1, !alias.scope !13
  %65 = getelementptr inbounds i8, i8* %1, i64 %57
  %66 = bitcast i8* %65 to <16 x i8>*
  store <16 x i8> %61, <16 x i8>* %66, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %67 = getelementptr i8, i8* %65, i64 16
  %68 = bitcast i8* %67 to <16 x i8>*
  store <16 x i8> %64, <16 x i8>* %68, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %69 = add nuw nsw i64 %4, 128
  %70 = add nuw nsw i64 %4, 127
  %71 = getelementptr inbounds i8, i8* %0, i64 %70
  %72 = bitcast i8* %71 to <16 x i8>*
  %73 = load <16 x i8>, <16 x i8>* %72, align 1, !tbaa !1, !alias.scope !13
  %74 = getelementptr i8, i8* %71, i64 16
  %75 = bitcast i8* %74 to <16 x i8>*
  %76 = load <16 x i8>, <16 x i8>* %75, align 1, !tbaa !1, !alias.scope !13
  %77 = getelementptr inbounds i8, i8* %1, i64 %69
  %78 = bitcast i8* %77 to <16 x i8>*
  store <16 x i8> %73, <16 x i8>* %78, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %79 = getelementptr i8, i8* %77, i64 16
  %80 = bitcast i8* %79 to <16 x i8>*
  store <16 x i8> %76, <16 x i8>* %80, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %81 = add nuw nsw i64 %4, 160
  %82 = add nuw nsw i64 %4, 159
  %83 = getelementptr inbounds i8, i8* %0, i64 %82
  %84 = bitcast i8* %83 to <16 x i8>*
  %85 = load <16 x i8>, <16 x i8>* %84, align 1, !tbaa !1, !alias.scope !13
  %86 = getelementptr i8, i8* %83, i64 16
  %87 = bitcast i8* %86 to <16 x i8>*
  %88 = load <16 x i8>, <16 x i8>* %87, align 1, !tbaa !1, !alias.scope !13
  %89 = getelementptr inbounds i8, i8* %1, i64 %81
  %90 = bitcast i8* %89 to <16 x i8>*
  store <16 x i8> %85, <16 x i8>* %90, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %91 = getelementptr i8, i8* %89, i64 16
  %92 = bitcast i8* %91 to <16 x i8>*
  store <16 x i8> %88, <16 x i8>* %92, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %93 = add nuw nsw i64 %4, 192
  %94 = add nuw nsw i64 %4, 191
  %95 = getelementptr inbounds i8, i8* %0, i64 %94
  %96 = bitcast i8* %95 to <16 x i8>*
  %97 = load <16 x i8>, <16 x i8>* %96, align 1, !tbaa !1, !alias.scope !13
  %98 = getelementptr i8, i8* %95, i64 16
  %99 = bitcast i8* %98 to <16 x i8>*
  %100 = load <16 x i8>, <16 x i8>* %99, align 1, !tbaa !1, !alias.scope !13
  %101 = getelementptr inbounds i8, i8* %1, i64 %93
  %102 = bitcast i8* %101 to <16 x i8>*
  store <16 x i8> %97, <16 x i8>* %102, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %103 = getelementptr i8, i8* %101, i64 16
  %104 = bitcast i8* %103 to <16 x i8>*
  store <16 x i8> %100, <16 x i8>* %104, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %105 = add nuw nsw i64 %4, 224
  %106 = add nuw nsw i64 %4, 223
  %107 = getelementptr inbounds i8, i8* %0, i64 %106
  %108 = bitcast i8* %107 to <16 x i8>*
  %109 = load <16 x i8>, <16 x i8>* %108, align 1, !tbaa !1, !alias.scope !13
  %110 = getelementptr i8, i8* %107, i64 16
  %111 = bitcast i8* %110 to <16 x i8>*
  %112 = load <16 x i8>, <16 x i8>* %111, align 1, !tbaa !1, !alias.scope !13
  %113 = getelementptr inbounds i8, i8* %1, i64 %105
  %114 = bitcast i8* %113 to <16 x i8>*
  store <16 x i8> %109, <16 x i8>* %114, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %115 = getelementptr i8, i8* %113, i64 16
  %116 = bitcast i8* %115 to <16 x i8>*
  store <16 x i8> %112, <16 x i8>* %116, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  br label %.preheader

; <label>:117:                                    ; preds = %._crit_edge2
  %118 = add nuw nsw i64 %3, 1
  %119 = icmp eq i64 %118, 220
  br i1 %119, label %.loopexit.loopexit, label %._crit_edge

._crit_edge2:                                     ; preds = %._crit_edge2, %.preheader
  %120 = phi i64 [ %20, %.preheader ], [ %140, %._crit_edge2 ]
  %121 = add i64 %120, %4
  %122 = add nsw i64 %121, -1
  %123 = getelementptr inbounds i8, i8* %0, i64 %122
  %124 = load i8, i8* %123, align 1, !tbaa !1
  %125 = getelementptr inbounds i8, i8* %1, i64 %121
  store i8 %124, i8* %125, align 1, !tbaa !1
  %126 = add i64 %21, %120
  %127 = getelementptr inbounds i8, i8* %0, i64 %121
  %128 = load i8, i8* %127, align 1, !tbaa !1
  %129 = getelementptr inbounds i8, i8* %1, i64 %126
  store i8 %128, i8* %129, align 1, !tbaa !1
  %130 = add i64 %22, %120
  %131 = add nsw i64 %130, -1
  %132 = getelementptr inbounds i8, i8* %0, i64 %131
  %133 = load i8, i8* %132, align 1, !tbaa !1
  %134 = getelementptr inbounds i8, i8* %1, i64 %130
  store i8 %133, i8* %134, align 1, !tbaa !1
  %135 = add i64 %23, %120
  %136 = add nsw i64 %135, -1
  %137 = getelementptr inbounds i8, i8* %0, i64 %136
  %138 = load i8, i8* %137, align 1, !tbaa !1
  %139 = getelementptr inbounds i8, i8* %1, i64 %135
  store i8 %138, i8* %139, align 1, !tbaa !1
  %140 = add nsw i64 %120, 4
  %141 = icmp eq i64 %140, 277
  br i1 %141, label %117, label %._crit_edge2, !llvm.loop !18
}

; Function Attrs: norecurse uwtable
define i32 @main() local_unnamed_addr #5 {
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
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %152, %0
  %17 = phi i64 [ 0, %0 ], [ %153, %152 ]
  %18 = mul nuw nsw i64 %17, 280
  br label %._crit_edge10

; <label>:19:                                     ; preds = %152
  %20 = call i32 @fclose(%struct._IO_FILE* %13)
  %21 = call i32 @fclose(%struct._IO_FILE* %14)
  %22 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i64 0, i64 0), i64 18)
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %143, %19
  %23 = phi i64 [ 0, %19 ], [ %144, %143 ]
  %24 = mul nuw nsw i64 %23, 280
  %25 = shl i64 %23, 32
  %26 = ashr exact i64 %25, 32
  br label %.loopexit._crit_edge

.loopexit._crit_edge:                             ; preds = %.loopexit, %._crit_edge8
  %27 = phi i64 [ 0, %._crit_edge8 ], [ %141, %.loopexit ]
  %28 = add nsw i64 %27, -4
  %29 = icmp slt i64 %28, 60
  %30 = select i1 %29, i64 %28, i64 60
  %31 = trunc i64 %30 to i32
  %32 = icmp slt i32 %31, 0
  br i1 %32, label %.loopexit, label %33

; <label>:33:                                     ; preds = %.loopexit._crit_edge
  %34 = shl i64 %27, 32
  %35 = ashr exact i64 %34, 32
  %36 = shl i64 %30, 32
  %37 = ashr exact i64 %36, 32
  br label %38

; <label>:38:                                     ; preds = %._crit_edge, %33
  %39 = phi i64 [ %51, %._crit_edge ], [ 0, %33 ]
  %40 = phi float [ %52, %._crit_edge ], [ 0.000000e+00, %33 ]
  %41 = phi i32 [ %49, %._crit_edge ], [ 0, %33 ]
  %42 = sub nsw i64 %35, %39
  br label %._crit_edge7

; <label>:43:                                     ; preds = %._crit_edge7
  %44 = fmul float %130, %130
  %45 = fmul float %131, %134
  %46 = fdiv float %44, %45
  %47 = fcmp ogt float %46, %40
  %48 = trunc i64 %39 to i32
  %49 = select i1 %47, i32 %48, i32 %41
  %50 = icmp slt i64 %39, %37
  br i1 %50, label %._crit_edge, label %.loopexit.loopexit

._crit_edge:                                      ; preds = %43
  %51 = add nuw nsw i64 %39, 1
  %52 = select i1 %47, float %46, float %40
  br label %38

._crit_edge7:                                     ; preds = %._crit_edge7, %38
  %53 = phi i64 [ 0, %38 ], [ %135, %._crit_edge7 ]
  %54 = phi float [ 0.000000e+00, %38 ], [ %134, %._crit_edge7 ]
  %55 = phi float [ 0.000000e+00, %38 ], [ %131, %._crit_edge7 ]
  %56 = phi float [ 0.000000e+00, %38 ], [ %130, %._crit_edge7 ]
  %57 = add nuw nsw i64 %53, %26
  %58 = mul nuw nsw i64 %57, 280
  %59 = add nuw nsw i64 %58, %35
  %60 = add nsw i64 %58, %42
  %61 = getelementptr inbounds i8, i8* %5, i64 %59
  %62 = load i8, i8* %61, align 1, !tbaa !1
  %63 = zext i8 %62 to i32
  %64 = getelementptr inbounds i8, i8* %6, i64 %60
  %65 = load i8, i8* %64, align 1, !tbaa !1
  %66 = zext i8 %65 to i32
  %67 = mul nuw nsw i32 %66, %63
  %68 = sitofp i32 %67 to float
  %69 = mul nuw nsw i32 %63, %63
  %70 = sitofp i32 %69 to float
  %71 = insertelement <2 x float> undef, float %68, i32 0
  %72 = insertelement <2 x float> %71, float %70, i32 1
  %73 = insertelement <2 x float> undef, float %56, i32 0
  %74 = insertelement <2 x float> %73, float %55, i32 1
  %75 = fadd <2 x float> %74, %72
  %76 = mul nuw nsw i32 %66, %66
  %77 = sitofp i32 %76 to float
  %78 = fadd float %54, %77
  %79 = add nuw nsw i64 %59, 1
  %80 = getelementptr inbounds i8, i8* %5, i64 %79
  %81 = load i8, i8* %80, align 1, !tbaa !1
  %82 = zext i8 %81 to i32
  %83 = add nsw i64 %60, 1
  %84 = getelementptr inbounds i8, i8* %6, i64 %83
  %85 = load i8, i8* %84, align 1, !tbaa !1
  %86 = zext i8 %85 to i32
  %87 = mul nuw nsw i32 %86, %82
  %88 = sitofp i32 %87 to float
  %89 = mul nuw nsw i32 %82, %82
  %90 = sitofp i32 %89 to float
  %91 = insertelement <2 x float> undef, float %88, i32 0
  %92 = insertelement <2 x float> %91, float %90, i32 1
  %93 = fadd <2 x float> %75, %92
  %94 = mul nuw nsw i32 %86, %86
  %95 = sitofp i32 %94 to float
  %96 = fadd float %78, %95
  %97 = add nuw nsw i64 %59, 2
  %98 = getelementptr inbounds i8, i8* %5, i64 %97
  %99 = load i8, i8* %98, align 1, !tbaa !1
  %100 = zext i8 %99 to i32
  %101 = add nsw i64 %60, 2
  %102 = getelementptr inbounds i8, i8* %6, i64 %101
  %103 = load i8, i8* %102, align 1, !tbaa !1
  %104 = zext i8 %103 to i32
  %105 = mul nuw nsw i32 %104, %100
  %106 = sitofp i32 %105 to float
  %107 = mul nuw nsw i32 %100, %100
  %108 = sitofp i32 %107 to float
  %109 = insertelement <2 x float> undef, float %106, i32 0
  %110 = insertelement <2 x float> %109, float %108, i32 1
  %111 = fadd <2 x float> %93, %110
  %112 = mul nuw nsw i32 %104, %104
  %113 = sitofp i32 %112 to float
  %114 = fadd float %96, %113
  %115 = add nuw nsw i64 %59, 3
  %116 = getelementptr inbounds i8, i8* %5, i64 %115
  %117 = load i8, i8* %116, align 1, !tbaa !1
  %118 = zext i8 %117 to i32
  %119 = add nsw i64 %60, 3
  %120 = getelementptr inbounds i8, i8* %6, i64 %119
  %121 = load i8, i8* %120, align 1, !tbaa !1
  %122 = zext i8 %121 to i32
  %123 = mul nuw nsw i32 %122, %118
  %124 = sitofp i32 %123 to float
  %125 = mul nuw nsw i32 %118, %118
  %126 = sitofp i32 %125 to float
  %127 = insertelement <2 x float> undef, float %124, i32 0
  %128 = insertelement <2 x float> %127, float %126, i32 1
  %129 = fadd <2 x float> %111, %128
  %130 = extractelement <2 x float> %129, i32 0
  %131 = extractelement <2 x float> %129, i32 1
  %132 = mul nuw nsw i32 %122, %122
  %133 = sitofp i32 %132 to float
  %134 = fadd float %114, %133
  %135 = add nuw nsw i64 %53, 1
  %136 = icmp eq i64 %135, 4
  br i1 %136, label %43, label %._crit_edge7

.loopexit.loopexit:                               ; preds = %43
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.loopexit._crit_edge
  %137 = phi i32 [ 0, %.loopexit._crit_edge ], [ %49, %.loopexit.loopexit ]
  %138 = trunc i32 %137 to i8
  %139 = add nuw nsw i64 %27, %24
  %140 = getelementptr inbounds i8, i8* %7, i64 %139
  store i8 %138, i8* %140, align 1, !tbaa !1
  %141 = add nuw nsw i64 %27, 1
  %142 = icmp eq i64 %141, 276
  br i1 %142, label %143, label %.loopexit._crit_edge

; <label>:143:                                    ; preds = %.loopexit
  %144 = add nuw nsw i64 %23, 1
  %145 = icmp eq i64 %144, 219
  br i1 %145, label %146, label %._crit_edge8

; <label>:146:                                    ; preds = %143
  call void @_Z17Stereo_Vision_fixPhS_S_i(i8* %5, i8* %6, i8* %8, i32 60)
  %147 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6, i64 0, i64 0), i64 15)
  %148 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  %149 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  %150 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %148, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0), i32 280, i32 223, i32 255)
  %151 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %149, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0), i32 280, i32 223, i32 255)
  br label %._crit_edge11

; <label>:152:                                    ; preds = %._crit_edge10
  %153 = add nuw nsw i64 %17, 1
  %154 = icmp eq i64 %153, 223
  br i1 %154, label %19, label %._crit_edge9

._crit_edge10:                                    ; preds = %._crit_edge10, %._crit_edge9
  %155 = phi i64 [ 0, %._crit_edge9 ], [ %161, %._crit_edge10 ]
  %156 = add nuw nsw i64 %155, %18
  %157 = getelementptr inbounds i8, i8* %5, i64 %156
  %158 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %157)
  %159 = getelementptr inbounds i8, i8* %6, i64 %156
  %160 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %159)
  %161 = add nuw nsw i64 %155, 1
  %162 = icmp eq i64 %161, 280
  br i1 %162, label %152, label %._crit_edge10

._crit_edge11:                                    ; preds = %168, %146
  %163 = phi i64 [ 0, %146 ], [ %169, %168 ]
  %164 = mul nuw nsw i64 %163, 280
  br label %._crit_edge12

; <label>:165:                                    ; preds = %168
  %166 = call i32 @fclose(%struct._IO_FILE* %148)
  %167 = call i32 @fclose(%struct._IO_FILE* %149)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %12) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %11) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %10) #1
  call void @llvm.lifetime.end(i64 100, i8* nonnull %9) #1
  ret i32 0

; <label>:168:                                    ; preds = %._crit_edge12
  %169 = add nuw nsw i64 %163, 1
  %170 = icmp eq i64 %169, 223
  br i1 %170, label %165, label %._crit_edge11

._crit_edge12:                                    ; preds = %._crit_edge12, %._crit_edge11
  %171 = phi i64 [ 0, %._crit_edge11 ], [ %181, %._crit_edge12 ]
  %172 = add nuw nsw i64 %171, %164
  %173 = getelementptr inbounds i8, i8* %7, i64 %172
  %174 = load i8, i8* %173, align 1, !tbaa !1
  %175 = zext i8 %174 to i32
  %176 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %148, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0), i32 %175)
  %177 = getelementptr inbounds i8, i8* %8, i64 %172
  %178 = load i8, i8* %177, align 1, !tbaa !1
  %179 = zext i8 %178 to i32
  %180 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %149, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0), i32 %179)
  %181 = add nuw nsw i64 %171, 1
  %182 = icmp eq i64 %181, 280
  br i1 %182, label %168, label %._crit_edge12
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) local_unnamed_addr #6

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #6

; Function Attrs: nounwind
declare i32 @fscanf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #6

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #6

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #6

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* dereferenceable(272), i8*, i64) local_unnamed_addr #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_Source.cpp() #7 section ".text.startup" {
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
attributes #5 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

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
