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
  br i1 %7, label %8, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %5
  br label %._crit_edge

; <label>:8:                                      ; preds = %5
  %9 = sub nsw i32 280, %4
  %10 = icmp sgt i32 %9, 0
  %11 = sext i32 %4 to i64
  %12 = sext i32 %3 to i64
  %13 = zext i32 %9 to i64
  %14 = zext i32 %4 to i64
  %15 = zext i32 %6 to i64
  %16 = icmp slt i32 %4, 1
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge1.._crit_edge10_crit_edge, %8
  %17 = phi i64 [ 0, %8 ], [ %84, %._crit_edge1.._crit_edge10_crit_edge ]
  %18 = mul i64 %17, 280
  %scevgep = getelementptr i8, i8* %2, i64 %18
  br i1 %10, label %19, label %._crit_edge10.._crit_edge1_crit_edge

._crit_edge10.._crit_edge1_crit_edge:             ; preds = %._crit_edge10
  br label %._crit_edge1

; <label>:19:                                     ; preds = %._crit_edge10
  %20 = trunc i64 %17 to i32
  br i1 %16, label %._crit_edge1.loopexit, label %._crit_edge8.preheader

._crit_edge8.preheader:                           ; preds = %19
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge2.._crit_edge8_crit_edge, %._crit_edge8.preheader
  %21 = phi i64 [ %82, %._crit_edge2.._crit_edge8_crit_edge ], [ 0, %._crit_edge8.preheader ]
  %22 = sub nsw i64 %21, %11
  %23 = icmp slt i64 %22, %12
  %24 = trunc i64 %22 to i32
  %25 = select i1 %23, i32 %24, i32 %3
  %26 = icmp slt i32 %25, 0
  br i1 %26, label %._crit_edge8.._crit_edge2_crit_edge, label %27

._crit_edge8.._crit_edge2_crit_edge:              ; preds = %._crit_edge8
  br label %._crit_edge2

; <label>:27:                                     ; preds = %._crit_edge8
  %28 = trunc i64 %21 to i32
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %.._crit_edge3_crit_edge, %27
  %29 = phi float [ 0.000000e+00, %27 ], [ %39, %.._crit_edge3_crit_edge ]
  %30 = phi i32 [ 0, %27 ], [ %38, %.._crit_edge3_crit_edge ]
  %31 = phi i32 [ 0, %27 ], [ %40, %.._crit_edge3_crit_edge ]
  %32 = sub i32 %28, %31
  br label %._crit_edge5

; <label>:33:                                     ; preds = %49
  %34 = fmul float %69, %69
  %35 = fmul float %72, %75
  %36 = fdiv float %34, %35
  %37 = fcmp ogt float %36, %29
  %38 = select i1 %37, i32 %31, i32 %30
  %39 = select i1 %37, float %36, float %29
  %40 = add nuw nsw i32 %31, 1
  %exitcond = icmp eq i32 %31, %25
  br i1 %exitcond, label %._crit_edge2.loopexit, label %.._crit_edge3_crit_edge

.._crit_edge3_crit_edge:                          ; preds = %33
  br label %._crit_edge3

._crit_edge5:                                     ; preds = %.._crit_edge5_crit_edge, %._crit_edge3
  %41 = phi float [ 0.000000e+00, %._crit_edge3 ], [ %75, %.._crit_edge5_crit_edge ]
  %42 = phi float [ 0.000000e+00, %._crit_edge3 ], [ %72, %.._crit_edge5_crit_edge ]
  %43 = phi float [ 0.000000e+00, %._crit_edge3 ], [ %69, %.._crit_edge5_crit_edge ]
  %44 = phi i32 [ 0, %._crit_edge3 ], [ %50, %.._crit_edge5_crit_edge ]
  %45 = add nuw nsw i32 %44, %20
  %46 = mul nsw i32 %45, 280
  %47 = add i32 %46, %28
  %48 = add i32 %32, %46
  br label %._crit_edge6

; <label>:49:                                     ; preds = %._crit_edge6
  %50 = add nuw nsw i32 %44, 1
  %51 = icmp eq i32 %50, %4
  br i1 %51, label %33, label %.._crit_edge5_crit_edge

.._crit_edge5_crit_edge:                          ; preds = %49
  br label %._crit_edge5

._crit_edge6:                                     ; preds = %._crit_edge6.._crit_edge6_crit_edge, %._crit_edge5
  %52 = phi i64 [ 0, %._crit_edge5 ], [ %76, %._crit_edge6.._crit_edge6_crit_edge ]
  %53 = phi float [ %41, %._crit_edge5 ], [ %75, %._crit_edge6.._crit_edge6_crit_edge ]
  %54 = phi float [ %42, %._crit_edge5 ], [ %72, %._crit_edge6.._crit_edge6_crit_edge ]
  %55 = phi float [ %43, %._crit_edge5 ], [ %69, %._crit_edge6.._crit_edge6_crit_edge ]
  %56 = trunc i64 %52 to i32
  %57 = add i32 %47, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8* %0, i64 %58
  %60 = load i8, i8* %59, align 1, !tbaa !1
  %61 = zext i8 %60 to i32
  %62 = add i32 %48, %56
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8* %1, i64 %63
  %65 = load i8, i8* %64, align 1, !tbaa !1
  %66 = zext i8 %65 to i32
  %67 = mul nuw nsw i32 %66, %61
  %68 = sitofp i32 %67 to float
  %69 = fadd float %55, %68
  %70 = mul nuw nsw i32 %61, %61
  %71 = sitofp i32 %70 to float
  %72 = fadd float %54, %71
  %73 = mul nuw nsw i32 %66, %66
  %74 = sitofp i32 %73 to float
  %75 = fadd float %53, %74
  %76 = add nuw nsw i64 %52, 1
  %77 = icmp eq i64 %76, %14
  br i1 %77, label %49, label %._crit_edge6.._crit_edge6_crit_edge

._crit_edge6.._crit_edge6_crit_edge:              ; preds = %._crit_edge6
  br label %._crit_edge6

._crit_edge2.loopexit:                            ; preds = %33
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge8.._crit_edge2_crit_edge, %._crit_edge2.loopexit
  %78 = phi i32 [ 0, %._crit_edge8.._crit_edge2_crit_edge ], [ %38, %._crit_edge2.loopexit ]
  %79 = trunc i32 %78 to i8
  %80 = add nuw nsw i64 %21, %18
  %81 = getelementptr inbounds i8, i8* %2, i64 %80
  store i8 %79, i8* %81, align 1, !tbaa !1
  %82 = add nuw nsw i64 %21, 1
  %83 = icmp eq i64 %82, %13
  br i1 %83, label %._crit_edge1.loopexit27, label %._crit_edge2.._crit_edge8_crit_edge

._crit_edge2.._crit_edge8_crit_edge:              ; preds = %._crit_edge2
  br label %._crit_edge8

._crit_edge1.loopexit:                            ; preds = %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %13, i32 1, i1 false)
  br label %._crit_edge1

._crit_edge1.loopexit27:                          ; preds = %._crit_edge2
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge10.._crit_edge1_crit_edge, %._crit_edge1.loopexit27, %._crit_edge1.loopexit
  %84 = add nuw nsw i64 %17, 1
  %85 = icmp eq i64 %84, %15
  br i1 %85, label %._crit_edge.loopexit, label %._crit_edge1.._crit_edge10_crit_edge

._crit_edge1.._crit_edge10_crit_edge:             ; preds = %._crit_edge1
  br label %._crit_edge10

._crit_edge.loopexit:                             ; preds = %._crit_edge1
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

; Function Attrs: norecurse nounwind uwtable
define void @_Z17Stereo_Vision_fixPhS_S_i(i8* nocapture readonly, i8* nocapture readonly, i8* nocapture, i32) local_unnamed_addr #2 {
  %5 = sext i32 %3 to i64
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %.._crit_edge5_crit_edge, %4
  %6 = phi i64 [ 0, %4 ], [ %120, %.._crit_edge5_crit_edge ]
  %7 = mul nuw nsw i64 %6, 280
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge.._crit_edge4_crit_edge, %._crit_edge5
  %8 = phi i64 [ 0, %._crit_edge5 ], [ %117, %._crit_edge.._crit_edge4_crit_edge ]
  %9 = add nsw i64 %8, -4
  %10 = icmp slt i64 %9, %5
  %11 = trunc i64 %9 to i32
  %12 = select i1 %10, i32 %11, i32 %3
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %._crit_edge4.._crit_edge_crit_edge, label %14

._crit_edge4.._crit_edge_crit_edge:               ; preds = %._crit_edge4
  br label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge4
  %15 = sext i32 %12 to i64
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %.._crit_edge2_crit_edge, %14
  %16 = phi i64 [ 0, %14 ], [ %112, %.._crit_edge2_crit_edge ]
  %17 = phi float [ 0.000000e+00, %14 ], [ %111, %.._crit_edge2_crit_edge ]
  %18 = phi i32 [ 0, %14 ], [ %110, %.._crit_edge2_crit_edge ]
  %19 = sub nsw i64 %8, %16
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.._crit_edge1_crit_edge, %._crit_edge2
  %20 = phi i64 [ 0, %._crit_edge2 ], [ %102, %._crit_edge1.._crit_edge1_crit_edge ]
  %21 = phi float [ 0.000000e+00, %._crit_edge2 ], [ %101, %._crit_edge1.._crit_edge1_crit_edge ]
  %22 = phi float [ 0.000000e+00, %._crit_edge2 ], [ %98, %._crit_edge1.._crit_edge1_crit_edge ]
  %23 = phi float [ 0.000000e+00, %._crit_edge2 ], [ %97, %._crit_edge1.._crit_edge1_crit_edge ]
  %24 = add nuw nsw i64 %20, %6
  %25 = mul nuw nsw i64 %24, 280
  %26 = add nuw nsw i64 %25, %8
  %27 = add nsw i64 %25, %19
  %28 = getelementptr inbounds i8, i8* %0, i64 %26
  %29 = load i8, i8* %28, align 1, !tbaa !1
  %30 = zext i8 %29 to i32
  %31 = getelementptr inbounds i8, i8* %1, i64 %27
  %32 = load i8, i8* %31, align 1, !tbaa !1
  %33 = zext i8 %32 to i32
  %34 = mul nuw nsw i32 %33, %30
  %35 = sitofp i32 %34 to float
  %36 = mul nuw nsw i32 %30, %30
  %37 = sitofp i32 %36 to float
  %38 = insertelement <2 x float> undef, float %35, i32 0
  %39 = insertelement <2 x float> %38, float %37, i32 1
  %40 = insertelement <2 x float> undef, float %23, i32 0
  %41 = insertelement <2 x float> %40, float %22, i32 1
  %42 = fadd <2 x float> %41, %39
  %43 = mul nuw nsw i32 %33, %33
  %44 = sitofp i32 %43 to float
  %45 = fadd float %21, %44
  %46 = add nuw nsw i64 %26, 1
  %47 = getelementptr inbounds i8, i8* %0, i64 %46
  %48 = load i8, i8* %47, align 1, !tbaa !1
  %49 = zext i8 %48 to i32
  %50 = add nsw i64 %27, 1
  %51 = getelementptr inbounds i8, i8* %1, i64 %50
  %52 = load i8, i8* %51, align 1, !tbaa !1
  %53 = zext i8 %52 to i32
  %54 = mul nuw nsw i32 %53, %49
  %55 = sitofp i32 %54 to float
  %56 = mul nuw nsw i32 %49, %49
  %57 = sitofp i32 %56 to float
  %58 = insertelement <2 x float> undef, float %55, i32 0
  %59 = insertelement <2 x float> %58, float %57, i32 1
  %60 = fadd <2 x float> %42, %59
  %61 = mul nuw nsw i32 %53, %53
  %62 = sitofp i32 %61 to float
  %63 = fadd float %45, %62
  %64 = add nuw nsw i64 %26, 2
  %65 = getelementptr inbounds i8, i8* %0, i64 %64
  %66 = load i8, i8* %65, align 1, !tbaa !1
  %67 = zext i8 %66 to i32
  %68 = add nsw i64 %27, 2
  %69 = getelementptr inbounds i8, i8* %1, i64 %68
  %70 = load i8, i8* %69, align 1, !tbaa !1
  %71 = zext i8 %70 to i32
  %72 = mul nuw nsw i32 %71, %67
  %73 = sitofp i32 %72 to float
  %74 = mul nuw nsw i32 %67, %67
  %75 = sitofp i32 %74 to float
  %76 = insertelement <2 x float> undef, float %73, i32 0
  %77 = insertelement <2 x float> %76, float %75, i32 1
  %78 = fadd <2 x float> %60, %77
  %79 = mul nuw nsw i32 %71, %71
  %80 = sitofp i32 %79 to float
  %81 = fadd float %63, %80
  %82 = add nuw nsw i64 %26, 3
  %83 = getelementptr inbounds i8, i8* %0, i64 %82
  %84 = load i8, i8* %83, align 1, !tbaa !1
  %85 = zext i8 %84 to i32
  %86 = add nsw i64 %27, 3
  %87 = getelementptr inbounds i8, i8* %1, i64 %86
  %88 = load i8, i8* %87, align 1, !tbaa !1
  %89 = zext i8 %88 to i32
  %90 = mul nuw nsw i32 %89, %85
  %91 = sitofp i32 %90 to float
  %92 = mul nuw nsw i32 %85, %85
  %93 = sitofp i32 %92 to float
  %94 = insertelement <2 x float> undef, float %91, i32 0
  %95 = insertelement <2 x float> %94, float %93, i32 1
  %96 = fadd <2 x float> %78, %95
  %97 = extractelement <2 x float> %96, i32 0
  %98 = extractelement <2 x float> %96, i32 1
  %99 = mul nuw nsw i32 %89, %89
  %100 = sitofp i32 %99 to float
  %101 = fadd float %81, %100
  %102 = add nuw nsw i64 %20, 1
  %103 = icmp eq i64 %102, 4
  br i1 %103, label %104, label %._crit_edge1.._crit_edge1_crit_edge

._crit_edge1.._crit_edge1_crit_edge:              ; preds = %._crit_edge1
  br label %._crit_edge1

; <label>:104:                                    ; preds = %._crit_edge1
  %105 = fmul float %97, %97
  %106 = fmul float %98, %101
  %107 = fdiv float %105, %106
  %108 = fcmp ogt float %107, %17
  %109 = trunc i64 %16 to i32
  %110 = select i1 %108, i32 %109, i32 %18
  %111 = select i1 %108, float %107, float %17
  %112 = add nuw nsw i64 %16, 1
  %exitcond = icmp eq i64 %16, %15
  br i1 %exitcond, label %._crit_edge.loopexit, label %.._crit_edge2_crit_edge

.._crit_edge2_crit_edge:                          ; preds = %104
  br label %._crit_edge2

._crit_edge.loopexit:                             ; preds = %104
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge4.._crit_edge_crit_edge, %._crit_edge.loopexit
  %113 = phi i32 [ 0, %._crit_edge4.._crit_edge_crit_edge ], [ %110, %._crit_edge.loopexit ]
  %114 = trunc i32 %113 to i8
  %115 = add nuw nsw i64 %8, %7
  %116 = getelementptr inbounds i8, i8* %2, i64 %115
  store i8 %114, i8* %116, align 1, !tbaa !1
  %117 = add nuw nsw i64 %8, 1
  %118 = icmp eq i64 %117, 276
  br i1 %118, label %119, label %._crit_edge.._crit_edge4_crit_edge

._crit_edge.._crit_edge4_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge4

; <label>:119:                                    ; preds = %._crit_edge
  %120 = add nuw nsw i64 %6, 1
  %121 = icmp eq i64 %120, 219
  br i1 %121, label %122, label %.._crit_edge5_crit_edge

.._crit_edge5_crit_edge:                          ; preds = %119
  br label %._crit_edge5

; <label>:122:                                    ; preds = %119
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define void @_Z4blurPhS_i(i8* nocapture readonly, i8* nocapture, i32) local_unnamed_addr #2 {
  %4 = mul nsw i32 %2, %2
  %5 = sitofp i32 %4 to float
  %6 = fdiv float 1.000000e+00, %5
  %7 = sub nsw i32 223, %2
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %3
  br label %._crit_edge

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
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge1.._crit_edge12_crit_edge, %9
  %22 = phi i64 [ 0, %9 ], [ %99, %._crit_edge1.._crit_edge12_crit_edge ]
  %23 = trunc i64 %22 to i32
  %24 = mul i64 %22, 1202590842880
  %25 = ashr exact i64 %24, 32
  %26 = getelementptr i8, i8* %1, i64 %25
  br i1 %11, label %27, label %._crit_edge12.._crit_edge1_crit_edge

._crit_edge12.._crit_edge1_crit_edge:             ; preds = %._crit_edge12
  br label %._crit_edge1

; <label>:27:                                     ; preds = %._crit_edge12
  %28 = mul nuw nsw i64 %22, 280
  br i1 %12, label %._crit_edge2.preheader, label %30

._crit_edge2.preheader:                           ; preds = %27
  %sext = shl i64 %22, 32
  %29 = ashr exact i64 %sext, 32
  br label %._crit_edge2

; <label>:30:                                     ; preds = %27
  tail call void @llvm.memset.p0i8.i64(i8* %26, i8 0, i64 %15, i32 1, i1 false)
  br label %._crit_edge1

._crit_edge2:                                     ; preds = %.us-lcssa.us.._crit_edge2_crit_edge, %._crit_edge2.preheader
  %31 = phi i64 [ %63, %.us-lcssa.us.._crit_edge2_crit_edge ], [ 0, %._crit_edge2.preheader ]
  %32 = trunc i64 %31 to i32
  br i1 %20, label %._crit_edge2.split.us, label %._crit_edge8.preheader

._crit_edge8.preheader:                           ; preds = %._crit_edge2
  br label %._crit_edge8

._crit_edge2.split.us:                            ; preds = %._crit_edge2
  br i1 %21, label %._crit_edge2.split.us..us-lcssa.us_crit_edge, label %._crit_edge8.us.preheader

._crit_edge2.split.us..us-lcssa.us_crit_edge:     ; preds = %._crit_edge2.split.us
  br label %.us-lcssa.us

._crit_edge8.us.preheader:                        ; preds = %._crit_edge2.split.us
  br label %._crit_edge8.us

._crit_edge8.us:                                  ; preds = %._crit_edge6.loopexit.us.._crit_edge8.us_crit_edge, %._crit_edge8.us.preheader
  %33 = phi i32 [ %58, %._crit_edge6.loopexit.us.._crit_edge8.us_crit_edge ], [ 0, %._crit_edge8.us.preheader ]
  %34 = phi float [ %55, %._crit_edge6.loopexit.us.._crit_edge8.us_crit_edge ], [ 0.000000e+00, %._crit_edge8.us.preheader ]
  %35 = add nuw nsw i32 %33, %23
  %36 = mul nsw i32 %35, 280
  %37 = add i32 %36, %32
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.._crit_edge7.us_crit_edge, %._crit_edge8.us
  %38 = phi i64 [ %56, %._crit_edge7.us.._crit_edge7.us_crit_edge ], [ 0, %._crit_edge8.us ]
  %39 = phi float [ %55, %._crit_edge7.us.._crit_edge7.us_crit_edge ], [ %34, %._crit_edge8.us ]
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
  br i1 %57, label %._crit_edge6.loopexit.us, label %._crit_edge7.us.._crit_edge7.us_crit_edge

._crit_edge7.us.._crit_edge7.us_crit_edge:        ; preds = %._crit_edge7.us
  br label %._crit_edge7.us

._crit_edge6.loopexit.us:                         ; preds = %._crit_edge7.us
  %58 = add nuw nsw i32 %33, 1
  %59 = icmp eq i32 %58, %2
  br i1 %59, label %.us-lcssa.us.loopexit, label %._crit_edge6.loopexit.us.._crit_edge8.us_crit_edge

._crit_edge6.loopexit.us.._crit_edge8.us_crit_edge: ; preds = %._crit_edge6.loopexit.us
  br label %._crit_edge8.us

.us-lcssa.us.loopexit:                            ; preds = %._crit_edge6.loopexit.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit25:                          ; preds = %._crit_edge6
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %._crit_edge2.split.us..us-lcssa.us_crit_edge, %.us-lcssa.us.loopexit25, %.us-lcssa.us.loopexit
  %.lcssa13 = phi float [ undef, %._crit_edge2.split.us..us-lcssa.us_crit_edge ], [ %55, %.us-lcssa.us.loopexit ], [ %76, %.us-lcssa.us.loopexit25 ]
  %60 = fptoui float %.lcssa13 to i8
  %61 = add nuw nsw i64 %31, %28
  %62 = getelementptr inbounds i8, i8* %1, i64 %61
  store i8 %60, i8* %62, align 1, !tbaa !1
  %63 = add nuw nsw i64 %31, 1
  %64 = icmp eq i64 %63, %17
  br i1 %64, label %._crit_edge1.loopexit, label %.us-lcssa.us.._crit_edge2_crit_edge

.us-lcssa.us.._crit_edge2_crit_edge:              ; preds = %.us-lcssa.us
  br label %._crit_edge2

._crit_edge8:                                     ; preds = %._crit_edge6.._crit_edge8_crit_edge, %._crit_edge8.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge6.._crit_edge8_crit_edge ], [ 0, %._crit_edge8.preheader ]
  %65 = phi float [ %76, %._crit_edge6.._crit_edge8_crit_edge ], [ 0.000000e+00, %._crit_edge8.preheader ]
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
  br i1 %21, label %._crit_edge8.._crit_edge6_crit_edge, label %._crit_edge7.preheader

._crit_edge8.._crit_edge6_crit_edge:              ; preds = %._crit_edge8
  br label %._crit_edge6

._crit_edge7.preheader:                           ; preds = %._crit_edge8
  br label %._crit_edge7

._crit_edge6.loopexit:                            ; preds = %._crit_edge7
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge8.._crit_edge6_crit_edge, %._crit_edge6.loopexit
  %76 = phi float [ %75, %._crit_edge8.._crit_edge6_crit_edge ], [ %96, %._crit_edge6.loopexit ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %77 = icmp eq i64 %indvars.iv.next, %16
  br i1 %77, label %.us-lcssa.us.loopexit25, label %._crit_edge6.._crit_edge8_crit_edge

._crit_edge6.._crit_edge8_crit_edge:              ; preds = %._crit_edge6
  br label %._crit_edge8

._crit_edge7:                                     ; preds = %._crit_edge7.._crit_edge7_crit_edge, %._crit_edge7.preheader
  %78 = phi i64 [ %97, %._crit_edge7.._crit_edge7_crit_edge ], [ 1, %._crit_edge7.preheader ]
  %79 = phi float [ %96, %._crit_edge7.._crit_edge7_crit_edge ], [ %75, %._crit_edge7.preheader ]
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
  br i1 %98, label %._crit_edge6.loopexit, label %._crit_edge7.._crit_edge7_crit_edge

._crit_edge7.._crit_edge7_crit_edge:              ; preds = %._crit_edge7
  br label %._crit_edge7

._crit_edge.loopexit:                             ; preds = %._crit_edge1
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  ret void

._crit_edge1.loopexit:                            ; preds = %.us-lcssa.us
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge12.._crit_edge1_crit_edge, %._crit_edge1.loopexit, %30
  %99 = add nuw nsw i64 %22, 1
  %100 = icmp eq i64 %99, %18
  br i1 %100, label %._crit_edge.loopexit, label %._crit_edge1.._crit_edge12_crit_edge

._crit_edge1.._crit_edge12_crit_edge:             ; preds = %._crit_edge1
  br label %._crit_edge12
}

; Function Attrs: norecurse nounwind uwtable
define void @_Z8blur_fixPhS_(i8* nocapture readonly, i8* nocapture) local_unnamed_addr #2 {
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %.._crit_edge5_crit_edge, %2
  %3 = phi i64 [ 0, %2 ], [ %12, %.._crit_edge5_crit_edge ]
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
  br i1 %16, label %._crit_edge5.._crit_edge.preheader_crit_edge, label %._crit_edge1.preheader

._crit_edge5.._crit_edge.preheader_crit_edge:     ; preds = %._crit_edge5
  br label %._crit_edge.preheader

._crit_edge1.preheader:                           ; preds = %._crit_edge5
  br label %._crit_edge1

._crit_edge.preheader.loopexit:                   ; preds = %._crit_edge1
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge5.._crit_edge.preheader_crit_edge, %._crit_edge.preheader.loopexit
  %.ph = phi i64 [ 0, %._crit_edge5.._crit_edge.preheader_crit_edge ], [ 272, %._crit_edge.preheader.loopexit ]
  br label %._crit_edge

._crit_edge1:                                     ; preds = %._crit_edge1.._crit_edge1_crit_edge, %._crit_edge1.preheader
  %17 = phi i64 [ %84, %._crit_edge1.._crit_edge1_crit_edge ], [ 0, %._crit_edge1.preheader ]
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
  br i1 %85, label %._crit_edge.preheader.loopexit, label %._crit_edge1.._crit_edge1_crit_edge, !llvm.loop !9

._crit_edge1.._crit_edge1_crit_edge:              ; preds = %._crit_edge1
  br label %._crit_edge1

; <label>:86:                                     ; preds = %146
  ret void

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %._crit_edge.preheader
  %87 = phi i64 [ %144, %._crit_edge.._crit_edge_crit_edge ], [ %.ph, %._crit_edge.preheader ]
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
  br i1 %145, label %146, label %._crit_edge.._crit_edge_crit_edge, !llvm.loop !12

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

; <label>:146:                                    ; preds = %._crit_edge
  %147 = icmp eq i64 %12, 220
  br i1 %147, label %86, label %.._crit_edge5_crit_edge

.._crit_edge5_crit_edge:                          ; preds = %146
  br label %._crit_edge5
}

; Function Attrs: norecurse noreturn nounwind uwtable
define void @_Z4testPhS_(i8* nocapture readonly, i8* nocapture) local_unnamed_addr #4 {
  br label %._crit_edge3

._crit_edge3.loopexit:                            ; preds = %117
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %2
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %.._crit_edge4_crit_edge, %._crit_edge3
  %3 = phi i64 [ 0, %._crit_edge3 ], [ %118, %.._crit_edge4_crit_edge ]
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
  br i1 %14, label %._crit_edge4.._crit_edge1.preheader_crit_edge, label %24

._crit_edge4.._crit_edge1.preheader_crit_edge:    ; preds = %._crit_edge4
  br label %._crit_edge1.preheader

._crit_edge1.preheader:                           ; preds = %._crit_edge4.._crit_edge1.preheader_crit_edge, %24
  %.ph = phi i64 [ 256, %24 ], [ 0, %._crit_edge4.._crit_edge1.preheader_crit_edge ]
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
  br label %._crit_edge1

; <label>:24:                                     ; preds = %._crit_edge4
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
  br label %._crit_edge1.preheader

; <label>:117:                                    ; preds = %._crit_edge1
  %118 = add nuw nsw i64 %3, 1
  %119 = icmp eq i64 %118, 220
  br i1 %119, label %._crit_edge3.loopexit, label %.._crit_edge4_crit_edge

.._crit_edge4_crit_edge:                          ; preds = %117
  br label %._crit_edge4

._crit_edge1:                                     ; preds = %._crit_edge1.._crit_edge1_crit_edge, %._crit_edge1.preheader
  %120 = phi i64 [ %140, %._crit_edge1.._crit_edge1_crit_edge ], [ %20, %._crit_edge1.preheader ]
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
  br i1 %141, label %117, label %._crit_edge1.._crit_edge1_crit_edge, !llvm.loop !18

._crit_edge1.._crit_edge1_crit_edge:              ; preds = %._crit_edge1
  br label %._crit_edge1
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
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %.._crit_edge6_crit_edge, %0
  %17 = phi i64 [ 0, %0 ], [ %152, %.._crit_edge6_crit_edge ]
  %18 = mul nuw nsw i64 %17, 280
  br label %._crit_edge7

; <label>:19:                                     ; preds = %151
  %20 = call i32 @fclose(%struct._IO_FILE* %13)
  %21 = call i32 @fclose(%struct._IO_FILE* %14)
  %22 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i64 0, i64 0), i64 18)
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %.._crit_edge5_crit_edge, %19
  %23 = phi i64 [ 0, %19 ], [ %143, %.._crit_edge5_crit_edge ]
  %24 = mul nuw nsw i64 %23, 280
  %25 = shl i64 %23, 32
  %26 = ashr exact i64 %25, 32
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge.._crit_edge4_crit_edge, %._crit_edge5
  %27 = phi i64 [ 0, %._crit_edge5 ], [ %140, %._crit_edge.._crit_edge4_crit_edge ]
  %28 = add nsw i64 %27, -4
  %29 = icmp slt i64 %28, 60
  %30 = select i1 %29, i64 %28, i64 60
  %31 = trunc i64 %30 to i32
  %32 = icmp slt i32 %31, 0
  br i1 %32, label %._crit_edge4.._crit_edge_crit_edge, label %33

._crit_edge4.._crit_edge_crit_edge:               ; preds = %._crit_edge4
  br label %._crit_edge

; <label>:33:                                     ; preds = %._crit_edge4
  %34 = shl i64 %27, 32
  %35 = ashr exact i64 %34, 32
  %36 = shl i64 %30, 32
  %37 = ashr exact i64 %36, 32
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %.._crit_edge1_crit_edge, %33
  %38 = phi i64 [ 0, %33 ], [ %50, %.._crit_edge1_crit_edge ]
  %39 = phi float [ 0.000000e+00, %33 ], [ %49, %.._crit_edge1_crit_edge ]
  %40 = phi i32 [ 0, %33 ], [ %48, %.._crit_edge1_crit_edge ]
  %41 = sub nsw i64 %35, %38
  br label %._crit_edge3

; <label>:42:                                     ; preds = %._crit_edge3
  %43 = fmul float %129, %129
  %44 = fmul float %130, %133
  %45 = fdiv float %43, %44
  %46 = fcmp ogt float %45, %39
  %47 = trunc i64 %38 to i32
  %48 = select i1 %46, i32 %47, i32 %40
  %49 = select i1 %46, float %45, float %39
  %50 = add nuw nsw i64 %38, 1
  %51 = icmp slt i64 %38, %37
  br i1 %51, label %.._crit_edge1_crit_edge, label %._crit_edge.loopexit

.._crit_edge1_crit_edge:                          ; preds = %42
  br label %._crit_edge1

._crit_edge3:                                     ; preds = %._crit_edge3.._crit_edge3_crit_edge, %._crit_edge1
  %52 = phi i64 [ 0, %._crit_edge1 ], [ %134, %._crit_edge3.._crit_edge3_crit_edge ]
  %53 = phi float [ 0.000000e+00, %._crit_edge1 ], [ %133, %._crit_edge3.._crit_edge3_crit_edge ]
  %54 = phi float [ 0.000000e+00, %._crit_edge1 ], [ %130, %._crit_edge3.._crit_edge3_crit_edge ]
  %55 = phi float [ 0.000000e+00, %._crit_edge1 ], [ %129, %._crit_edge3.._crit_edge3_crit_edge ]
  %56 = add nuw nsw i64 %52, %26
  %57 = mul nuw nsw i64 %56, 280
  %58 = add nuw nsw i64 %57, %35
  %59 = add nsw i64 %57, %41
  %60 = getelementptr inbounds i8, i8* %5, i64 %58
  %61 = load i8, i8* %60, align 1, !tbaa !1
  %62 = zext i8 %61 to i32
  %63 = getelementptr inbounds i8, i8* %6, i64 %59
  %64 = load i8, i8* %63, align 1, !tbaa !1
  %65 = zext i8 %64 to i32
  %66 = mul nuw nsw i32 %65, %62
  %67 = sitofp i32 %66 to float
  %68 = mul nuw nsw i32 %62, %62
  %69 = sitofp i32 %68 to float
  %70 = insertelement <2 x float> undef, float %67, i32 0
  %71 = insertelement <2 x float> %70, float %69, i32 1
  %72 = insertelement <2 x float> undef, float %55, i32 0
  %73 = insertelement <2 x float> %72, float %54, i32 1
  %74 = fadd <2 x float> %73, %71
  %75 = mul nuw nsw i32 %65, %65
  %76 = sitofp i32 %75 to float
  %77 = fadd float %53, %76
  %78 = add nuw nsw i64 %58, 1
  %79 = getelementptr inbounds i8, i8* %5, i64 %78
  %80 = load i8, i8* %79, align 1, !tbaa !1
  %81 = zext i8 %80 to i32
  %82 = add nsw i64 %59, 1
  %83 = getelementptr inbounds i8, i8* %6, i64 %82
  %84 = load i8, i8* %83, align 1, !tbaa !1
  %85 = zext i8 %84 to i32
  %86 = mul nuw nsw i32 %85, %81
  %87 = sitofp i32 %86 to float
  %88 = mul nuw nsw i32 %81, %81
  %89 = sitofp i32 %88 to float
  %90 = insertelement <2 x float> undef, float %87, i32 0
  %91 = insertelement <2 x float> %90, float %89, i32 1
  %92 = fadd <2 x float> %74, %91
  %93 = mul nuw nsw i32 %85, %85
  %94 = sitofp i32 %93 to float
  %95 = fadd float %77, %94
  %96 = add nuw nsw i64 %58, 2
  %97 = getelementptr inbounds i8, i8* %5, i64 %96
  %98 = load i8, i8* %97, align 1, !tbaa !1
  %99 = zext i8 %98 to i32
  %100 = add nsw i64 %59, 2
  %101 = getelementptr inbounds i8, i8* %6, i64 %100
  %102 = load i8, i8* %101, align 1, !tbaa !1
  %103 = zext i8 %102 to i32
  %104 = mul nuw nsw i32 %103, %99
  %105 = sitofp i32 %104 to float
  %106 = mul nuw nsw i32 %99, %99
  %107 = sitofp i32 %106 to float
  %108 = insertelement <2 x float> undef, float %105, i32 0
  %109 = insertelement <2 x float> %108, float %107, i32 1
  %110 = fadd <2 x float> %92, %109
  %111 = mul nuw nsw i32 %103, %103
  %112 = sitofp i32 %111 to float
  %113 = fadd float %95, %112
  %114 = add nuw nsw i64 %58, 3
  %115 = getelementptr inbounds i8, i8* %5, i64 %114
  %116 = load i8, i8* %115, align 1, !tbaa !1
  %117 = zext i8 %116 to i32
  %118 = add nsw i64 %59, 3
  %119 = getelementptr inbounds i8, i8* %6, i64 %118
  %120 = load i8, i8* %119, align 1, !tbaa !1
  %121 = zext i8 %120 to i32
  %122 = mul nuw nsw i32 %121, %117
  %123 = sitofp i32 %122 to float
  %124 = mul nuw nsw i32 %117, %117
  %125 = sitofp i32 %124 to float
  %126 = insertelement <2 x float> undef, float %123, i32 0
  %127 = insertelement <2 x float> %126, float %125, i32 1
  %128 = fadd <2 x float> %110, %127
  %129 = extractelement <2 x float> %128, i32 0
  %130 = extractelement <2 x float> %128, i32 1
  %131 = mul nuw nsw i32 %121, %121
  %132 = sitofp i32 %131 to float
  %133 = fadd float %113, %132
  %134 = add nuw nsw i64 %52, 1
  %135 = icmp eq i64 %134, 4
  br i1 %135, label %42, label %._crit_edge3.._crit_edge3_crit_edge

._crit_edge3.._crit_edge3_crit_edge:              ; preds = %._crit_edge3
  br label %._crit_edge3

._crit_edge.loopexit:                             ; preds = %42
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge4.._crit_edge_crit_edge, %._crit_edge.loopexit
  %136 = phi i32 [ 0, %._crit_edge4.._crit_edge_crit_edge ], [ %48, %._crit_edge.loopexit ]
  %137 = trunc i32 %136 to i8
  %138 = add nuw nsw i64 %27, %24
  %139 = getelementptr inbounds i8, i8* %7, i64 %138
  store i8 %137, i8* %139, align 1, !tbaa !1
  %140 = add nuw nsw i64 %27, 1
  %141 = icmp eq i64 %140, 276
  br i1 %141, label %142, label %._crit_edge.._crit_edge4_crit_edge

._crit_edge.._crit_edge4_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge4

; <label>:142:                                    ; preds = %._crit_edge
  %143 = add nuw nsw i64 %23, 1
  %144 = icmp eq i64 %143, 219
  br i1 %144, label %145, label %.._crit_edge5_crit_edge

.._crit_edge5_crit_edge:                          ; preds = %142
  br label %._crit_edge5

; <label>:145:                                    ; preds = %142
  call void @_Z17Stereo_Vision_fixPhS_S_i(i8* %5, i8* %6, i8* %8, i32 60)
  %146 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6, i64 0, i64 0), i64 15)
  %147 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  %148 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  %149 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %147, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0), i32 280, i32 223, i32 255)
  %150 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %148, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0), i32 280, i32 223, i32 255)
  br label %._crit_edge8

; <label>:151:                                    ; preds = %._crit_edge7
  %152 = add nuw nsw i64 %17, 1
  %153 = icmp eq i64 %152, 223
  br i1 %153, label %19, label %.._crit_edge6_crit_edge

.._crit_edge6_crit_edge:                          ; preds = %151
  br label %._crit_edge6

._crit_edge7:                                     ; preds = %._crit_edge7.._crit_edge7_crit_edge, %._crit_edge6
  %154 = phi i64 [ 0, %._crit_edge6 ], [ %160, %._crit_edge7.._crit_edge7_crit_edge ]
  %155 = add nuw nsw i64 %154, %18
  %156 = getelementptr inbounds i8, i8* %5, i64 %155
  %157 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %156)
  %158 = getelementptr inbounds i8, i8* %6, i64 %155
  %159 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %158)
  %160 = add nuw nsw i64 %154, 1
  %161 = icmp eq i64 %160, 280
  br i1 %161, label %151, label %._crit_edge7.._crit_edge7_crit_edge

._crit_edge7.._crit_edge7_crit_edge:              ; preds = %._crit_edge7
  br label %._crit_edge7

._crit_edge8:                                     ; preds = %.._crit_edge8_crit_edge, %145
  %162 = phi i64 [ 0, %145 ], [ %168, %.._crit_edge8_crit_edge ]
  %163 = mul nuw nsw i64 %162, 280
  br label %._crit_edge9

; <label>:164:                                    ; preds = %167
  %165 = call i32 @fclose(%struct._IO_FILE* %147)
  %166 = call i32 @fclose(%struct._IO_FILE* %148)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %12) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %11) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %10) #1
  call void @llvm.lifetime.end(i64 100, i8* nonnull %9) #1
  ret i32 0

; <label>:167:                                    ; preds = %._crit_edge9
  %168 = add nuw nsw i64 %162, 1
  %169 = icmp eq i64 %168, 223
  br i1 %169, label %164, label %.._crit_edge8_crit_edge

.._crit_edge8_crit_edge:                          ; preds = %167
  br label %._crit_edge8

._crit_edge9:                                     ; preds = %._crit_edge9.._crit_edge9_crit_edge, %._crit_edge8
  %170 = phi i64 [ 0, %._crit_edge8 ], [ %180, %._crit_edge9.._crit_edge9_crit_edge ]
  %171 = add nuw nsw i64 %170, %163
  %172 = getelementptr inbounds i8, i8* %7, i64 %171
  %173 = load i8, i8* %172, align 1, !tbaa !1
  %174 = zext i8 %173 to i32
  %175 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %147, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0), i32 %174)
  %176 = getelementptr inbounds i8, i8* %8, i64 %171
  %177 = load i8, i8* %176, align 1, !tbaa !1
  %178 = zext i8 %177 to i32
  %179 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %148, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0), i32 %178)
  %180 = add nuw nsw i64 %170, 1
  %181 = icmp eq i64 %180, 280
  br i1 %181, label %167, label %._crit_edge9.._crit_edge9_crit_edge

._crit_edge9.._crit_edge9_crit_edge:              ; preds = %._crit_edge9
  br label %._crit_edge9
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
attributes #2 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { norecurse noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
