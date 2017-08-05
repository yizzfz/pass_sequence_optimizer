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
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %5
  %9 = sub nsw i32 280, %4
  %10 = sext i32 %4 to i64
  %11 = sext i32 %3 to i64
  %12 = zext i32 %9 to i64
  %13 = zext i32 %4 to i64
  %14 = zext i32 %6 to i64
  %15 = icmp sgt i32 %9, 0
  %16 = icmp slt i32 %4, 1
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge4, %8
  %17 = phi i64 [ 0, %8 ], [ %85, %._crit_edge4 ]
  %18 = mul i64 %17, 280
  %scevgep = getelementptr i8, i8* %2, i64 %18
  br i1 %15, label %19, label %._crit_edge4

; <label>:19:                                     ; preds = %._crit_edge10
  %20 = trunc i64 %17 to i32
  br i1 %16, label %._crit_edge4.loopexit, label %._crit_edge9.preheader

._crit_edge9.preheader:                           ; preds = %19
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.preheader, %._crit_edge5
  %21 = phi i64 [ %83, %._crit_edge5 ], [ 0, %._crit_edge9.preheader ]
  %22 = sub nsw i64 %21, %10
  %23 = icmp slt i64 %22, %11
  %24 = trunc i64 %22 to i32
  %25 = select i1 %23, i32 %24, i32 %3
  %26 = icmp slt i32 %25, 0
  br i1 %26, label %._crit_edge5, label %27

; <label>:27:                                     ; preds = %._crit_edge9
  %28 = trunc i64 %21 to i32
  br label %29

; <label>:29:                                     ; preds = %._crit_edge6, %27
  %30 = phi float [ %41, %._crit_edge6 ], [ 0.000000e+00, %27 ]
  %31 = phi i32 [ %39, %._crit_edge6 ], [ 0, %27 ]
  %32 = phi i32 [ %40, %._crit_edge6 ], [ 0, %27 ]
  %33 = sub i32 %28, %32
  br label %._crit_edge7

; <label>:34:                                     ; preds = %50
  %35 = fmul float %70, %70
  %36 = fmul float %73, %76
  %37 = fdiv float %35, %36
  %38 = fcmp ogt float %37, %30
  %39 = select i1 %38, i32 %32, i32 %31
  %exitcond = icmp eq i32 %32, %25
  br i1 %exitcond, label %._crit_edge5.loopexit, label %._crit_edge6

._crit_edge6:                                     ; preds = %34
  %40 = add nuw nsw i32 %32, 1
  %41 = select i1 %38, float %37, float %30
  br label %29

._crit_edge7:                                     ; preds = %50, %29
  %42 = phi float [ 0.000000e+00, %29 ], [ %76, %50 ]
  %43 = phi float [ 0.000000e+00, %29 ], [ %73, %50 ]
  %44 = phi float [ 0.000000e+00, %29 ], [ %70, %50 ]
  %45 = phi i32 [ 0, %29 ], [ %51, %50 ]
  %46 = add nuw nsw i32 %45, %20
  %47 = mul nsw i32 %46, 280
  %48 = add i32 %47, %28
  %49 = add i32 %33, %47
  br label %._crit_edge8

; <label>:50:                                     ; preds = %._crit_edge8
  %51 = add nuw nsw i32 %45, 1
  %52 = icmp eq i32 %51, %4
  br i1 %52, label %34, label %._crit_edge7

._crit_edge8:                                     ; preds = %._crit_edge8, %._crit_edge7
  %53 = phi i64 [ 0, %._crit_edge7 ], [ %77, %._crit_edge8 ]
  %54 = phi float [ %42, %._crit_edge7 ], [ %76, %._crit_edge8 ]
  %55 = phi float [ %43, %._crit_edge7 ], [ %73, %._crit_edge8 ]
  %56 = phi float [ %44, %._crit_edge7 ], [ %70, %._crit_edge8 ]
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
  %78 = icmp eq i64 %77, %13
  br i1 %78, label %50, label %._crit_edge8

._crit_edge5.loopexit:                            ; preds = %34
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %._crit_edge9
  %79 = phi i32 [ 0, %._crit_edge9 ], [ %39, %._crit_edge5.loopexit ]
  %80 = trunc i32 %79 to i8
  %81 = add nuw nsw i64 %21, %18
  %82 = getelementptr inbounds i8, i8* %2, i64 %81
  store i8 %80, i8* %82, align 1, !tbaa !1
  %83 = add nuw nsw i64 %21, 1
  %84 = icmp eq i64 %83, %12
  br i1 %84, label %._crit_edge4.loopexit36, label %._crit_edge9

._crit_edge4.loopexit:                            ; preds = %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %12, i32 1, i1 false)
  br label %._crit_edge4

._crit_edge4.loopexit36:                          ; preds = %._crit_edge5
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit36, %._crit_edge4.loopexit, %._crit_edge10
  %85 = add nuw nsw i64 %17, 1
  %86 = icmp eq i64 %85, %14
  br i1 %86, label %._crit_edge.loopexit, label %._crit_edge10

._crit_edge.loopexit:                             ; preds = %._crit_edge4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

; Function Attrs: norecurse nounwind uwtable
define void @_Z17Stereo_Vision_fixPhS_S_i(i8* nocapture readonly, i8* nocapture readonly, i8* nocapture, i32) local_unnamed_addr #2 {
  %5 = sext i32 %3 to i64
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %112, %4
  %6 = phi i64 [ 0, %4 ], [ %113, %112 ]
  %7 = mul nuw nsw i64 %6, 280
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge, %._crit_edge7
  %8 = phi i64 [ 0, %._crit_edge7 ], [ %110, %._crit_edge ]
  %9 = add nsw i64 %8, -4
  %10 = icmp slt i64 %9, %5
  %11 = trunc i64 %9 to i32
  %12 = select i1 %10, i32 %11, i32 %3
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %._crit_edge, label %14

; <label>:14:                                     ; preds = %._crit_edge6
  %15 = sext i32 %12 to i64
  br label %16

; <label>:16:                                     ; preds = %._crit_edge5, %14
  %17 = phi i64 [ %104, %._crit_edge5 ], [ 0, %14 ]
  %18 = phi float [ %105, %._crit_edge5 ], [ 0.000000e+00, %14 ]
  %19 = phi i32 [ %103, %._crit_edge5 ], [ 0, %14 ]
  %20 = sub nsw i64 %8, %17
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4, %16
  %21 = phi i64 [ 0, %16 ], [ %95, %._crit_edge4 ]
  %22 = phi float [ 0.000000e+00, %16 ], [ %94, %._crit_edge4 ]
  %23 = phi float [ 0.000000e+00, %16 ], [ %91, %._crit_edge4 ]
  %24 = phi float [ 0.000000e+00, %16 ], [ %88, %._crit_edge4 ]
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
  %37 = fadd float %24, %36
  %38 = mul nuw nsw i32 %31, %31
  %39 = sitofp i32 %38 to float
  %40 = fadd float %23, %39
  %41 = mul nuw nsw i32 %34, %34
  %42 = sitofp i32 %41 to float
  %43 = fadd float %22, %42
  %44 = add nuw nsw i64 %27, 1
  %45 = getelementptr inbounds i8, i8* %0, i64 %44
  %46 = load i8, i8* %45, align 1, !tbaa !1
  %47 = zext i8 %46 to i32
  %48 = add nsw i64 %28, 1
  %49 = getelementptr inbounds i8, i8* %1, i64 %48
  %50 = load i8, i8* %49, align 1, !tbaa !1
  %51 = zext i8 %50 to i32
  %52 = mul nuw nsw i32 %51, %47
  %53 = sitofp i32 %52 to float
  %54 = fadd float %37, %53
  %55 = mul nuw nsw i32 %47, %47
  %56 = sitofp i32 %55 to float
  %57 = fadd float %40, %56
  %58 = mul nuw nsw i32 %51, %51
  %59 = sitofp i32 %58 to float
  %60 = fadd float %43, %59
  %61 = add nuw nsw i64 %27, 2
  %62 = getelementptr inbounds i8, i8* %0, i64 %61
  %63 = load i8, i8* %62, align 1, !tbaa !1
  %64 = zext i8 %63 to i32
  %65 = add nsw i64 %28, 2
  %66 = getelementptr inbounds i8, i8* %1, i64 %65
  %67 = load i8, i8* %66, align 1, !tbaa !1
  %68 = zext i8 %67 to i32
  %69 = mul nuw nsw i32 %68, %64
  %70 = sitofp i32 %69 to float
  %71 = fadd float %54, %70
  %72 = mul nuw nsw i32 %64, %64
  %73 = sitofp i32 %72 to float
  %74 = fadd float %57, %73
  %75 = mul nuw nsw i32 %68, %68
  %76 = sitofp i32 %75 to float
  %77 = fadd float %60, %76
  %78 = add nuw nsw i64 %27, 3
  %79 = getelementptr inbounds i8, i8* %0, i64 %78
  %80 = load i8, i8* %79, align 1, !tbaa !1
  %81 = zext i8 %80 to i32
  %82 = add nsw i64 %28, 3
  %83 = getelementptr inbounds i8, i8* %1, i64 %82
  %84 = load i8, i8* %83, align 1, !tbaa !1
  %85 = zext i8 %84 to i32
  %86 = mul nuw nsw i32 %85, %81
  %87 = sitofp i32 %86 to float
  %88 = fadd float %71, %87
  %89 = mul nuw nsw i32 %81, %81
  %90 = sitofp i32 %89 to float
  %91 = fadd float %74, %90
  %92 = mul nuw nsw i32 %85, %85
  %93 = sitofp i32 %92 to float
  %94 = fadd float %77, %93
  %95 = add nuw nsw i64 %21, 1
  %96 = icmp eq i64 %95, 4
  br i1 %96, label %97, label %._crit_edge4

; <label>:97:                                     ; preds = %._crit_edge4
  %98 = fmul float %88, %88
  %99 = fmul float %91, %94
  %100 = fdiv float %98, %99
  %101 = fcmp ogt float %100, %18
  %102 = trunc i64 %17 to i32
  %103 = select i1 %101, i32 %102, i32 %19
  %exitcond = icmp eq i64 %17, %15
  br i1 %exitcond, label %._crit_edge.loopexit, label %._crit_edge5

._crit_edge5:                                     ; preds = %97
  %104 = add nuw nsw i64 %17, 1
  %105 = select i1 %101, float %100, float %18
  br label %16

._crit_edge.loopexit:                             ; preds = %97
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge6
  %106 = phi i32 [ 0, %._crit_edge6 ], [ %103, %._crit_edge.loopexit ]
  %107 = trunc i32 %106 to i8
  %108 = add nuw nsw i64 %8, %7
  %109 = getelementptr inbounds i8, i8* %2, i64 %108
  store i8 %107, i8* %109, align 1, !tbaa !1
  %110 = add nuw nsw i64 %8, 1
  %111 = icmp eq i64 %110, 276
  br i1 %111, label %112, label %._crit_edge6

; <label>:112:                                    ; preds = %._crit_edge
  %113 = add nuw nsw i64 %6, 1
  %114 = icmp eq i64 %113, 219
  br i1 %114, label %115, label %._crit_edge7

; <label>:115:                                    ; preds = %112
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define void @_Z4blurPhS_i(i8* nocapture readonly, i8* nocapture, i32) local_unnamed_addr #2 {
  %4 = mul nsw i32 %2, %2
  %5 = sitofp i32 %4 to float
  %6 = fdiv float 1.000000e+00, %5
  %7 = sub nsw i32 223, %2
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

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
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge2, %9
  %22 = phi i64 [ 0, %9 ], [ %106, %._crit_edge2 ]
  %23 = mul i64 %22, 1202590842880
  %24 = ashr exact i64 %23, 32
  %25 = getelementptr i8, i8* %1, i64 %24
  br i1 %18, label %26, label %._crit_edge2

; <label>:26:                                     ; preds = %._crit_edge8
  %27 = mul nuw nsw i64 %22, 280
  br i1 %19, label %28, label %63

; <label>:28:                                     ; preds = %26
  %sext = shl i64 %22, 32
  %29 = ashr exact i64 %sext, 32
  br i1 %20, label %._crit_edge3.us.preheader, label %._crit_edge3.preheader

._crit_edge3.preheader:                           ; preds = %28
  br label %._crit_edge3

._crit_edge3.us.preheader:                        ; preds = %28
  br label %._crit_edge3.us

._crit_edge3.us:                                  ; preds = %._crit_edge3.us.preheader, %.us-lcssa.us.us
  %30 = phi i64 [ %61, %.us-lcssa.us.us ], [ 0, %._crit_edge3.us.preheader ]
  %31 = trunc i64 %30 to i32
  br i1 %21, label %.us-lcssa.us.us, label %._crit_edge6.us.us.preheader

._crit_edge6.us.us.preheader:                     ; preds = %._crit_edge3.us
  br label %._crit_edge6.us.us

._crit_edge6.us.us:                               ; preds = %._crit_edge6.us.us.preheader, %._crit_edge5.loopexit.us.us
  %indvars.iv.us.us = phi i64 [ %indvars.iv.next.us.us, %._crit_edge5.loopexit.us.us ], [ 0, %._crit_edge6.us.us.preheader ]
  %32 = phi float [ %55, %._crit_edge5.loopexit.us.us ], [ 0.000000e+00, %._crit_edge6.us.us.preheader ]
  %33 = add nuw nsw i64 %indvars.iv.us.us, %29
  %34 = mul nsw i64 %33, 280
  %35 = trunc i64 %34 to i32
  %36 = add i32 %35, %31
  br label %._crit_edge7.us.us

._crit_edge5.loopexit.us.us:                      ; preds = %._crit_edge7.us.us
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv.us.us, 1
  %37 = icmp eq i64 %indvars.iv.next.us.us, %14
  br i1 %37, label %.us-lcssa.us.us.loopexit, label %._crit_edge6.us.us

._crit_edge7.us.us:                               ; preds = %._crit_edge7.us.us, %._crit_edge6.us.us
  %38 = phi i64 [ %56, %._crit_edge7.us.us ], [ 0, %._crit_edge6.us.us ]
  %39 = phi float [ %55, %._crit_edge7.us.us ], [ %32, %._crit_edge6.us.us ]
  %40 = trunc i64 %38 to i32
  %41 = add i32 %40, %36
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8* %0, i64 %42
  %44 = load i8, i8* %43, align 1, !tbaa !1
  %45 = uitofp i8 %44 to float
  %46 = fmul float %6, %45
  %47 = fadd float %39, %46
  %48 = or i32 %40, 1
  %49 = add i32 %48, %36
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8* %0, i64 %50
  %52 = load i8, i8* %51, align 1, !tbaa !1
  %53 = uitofp i8 %52 to float
  %54 = fmul float %6, %53
  %55 = fadd float %47, %54
  %56 = add nuw nsw i64 %38, 2
  %57 = icmp eq i64 %56, %14
  br i1 %57, label %._crit_edge5.loopexit.us.us, label %._crit_edge7.us.us

.us-lcssa.us.us.loopexit:                         ; preds = %._crit_edge5.loopexit.us.us
  br label %.us-lcssa.us.us

.us-lcssa.us.us:                                  ; preds = %.us-lcssa.us.us.loopexit, %._crit_edge3.us
  %.lcssa10.ph.us.us = phi float [ undef, %._crit_edge3.us ], [ %55, %.us-lcssa.us.us.loopexit ]
  %58 = fptoui float %.lcssa10.ph.us.us to i8
  %59 = add nuw nsw i64 %30, %27
  %60 = getelementptr inbounds i8, i8* %1, i64 %59
  store i8 %58, i8* %60, align 1, !tbaa !1
  %61 = add nuw nsw i64 %30, 1
  %62 = icmp eq i64 %61, %15
  br i1 %62, label %._crit_edge2.loopexit, label %._crit_edge3.us

; <label>:63:                                     ; preds = %26
  tail call void @llvm.memset.p0i8.i64(i8* %25, i8 0, i64 %13, i32 1, i1 false)
  br label %._crit_edge2

._crit_edge3:                                     ; preds = %._crit_edge3.preheader, %.us-lcssa
  %64 = phi i64 [ %69, %.us-lcssa ], [ 0, %._crit_edge3.preheader ]
  %65 = trunc i64 %64 to i32
  br label %._crit_edge6

.us-lcssa:                                        ; preds = %._crit_edge5
  %66 = fptoui float %83 to i8
  %67 = add nuw nsw i64 %64, %27
  %68 = getelementptr inbounds i8, i8* %1, i64 %67
  store i8 %66, i8* %68, align 1, !tbaa !1
  %69 = add nuw nsw i64 %64, 1
  %70 = icmp eq i64 %69, %15
  br i1 %70, label %._crit_edge2.loopexit41, label %._crit_edge3

._crit_edge6:                                     ; preds = %._crit_edge5, %._crit_edge3
  %indvars.iv = phi i64 [ 0, %._crit_edge3 ], [ %indvars.iv.next, %._crit_edge5 ]
  %71 = phi float [ 0.000000e+00, %._crit_edge3 ], [ %83, %._crit_edge5 ]
  %72 = add nuw nsw i64 %indvars.iv, %29
  %73 = mul nsw i64 %72, 280
  %74 = trunc i64 %73 to i32
  %75 = add i32 %74, %65
  %76 = add i64 %73, %64
  %sext9 = shl i64 %76, 32
  %77 = ashr exact i64 %sext9, 32
  %78 = getelementptr inbounds i8, i8* %0, i64 %77
  %79 = load i8, i8* %78, align 1, !tbaa !1
  %80 = uitofp i8 %79 to float
  %81 = fmul float %6, %80
  %82 = fadd float %71, %81
  br i1 %21, label %._crit_edge5, label %._crit_edge7.preheader

._crit_edge7.preheader:                           ; preds = %._crit_edge6
  br label %._crit_edge7

._crit_edge5.loopexit:                            ; preds = %._crit_edge7
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %._crit_edge6
  %83 = phi float [ %82, %._crit_edge6 ], [ %103, %._crit_edge5.loopexit ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %84 = icmp eq i64 %indvars.iv.next, %14
  br i1 %84, label %.us-lcssa, label %._crit_edge6

._crit_edge7:                                     ; preds = %._crit_edge7.preheader, %._crit_edge7
  %85 = phi i64 [ %104, %._crit_edge7 ], [ 1, %._crit_edge7.preheader ]
  %86 = phi float [ %103, %._crit_edge7 ], [ %82, %._crit_edge7.preheader ]
  %87 = trunc i64 %85 to i32
  %88 = add i32 %87, %75
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i8, i8* %0, i64 %89
  %91 = load i8, i8* %90, align 1, !tbaa !1
  %92 = uitofp i8 %91 to float
  %93 = fmul float %6, %92
  %94 = fadd float %86, %93
  %95 = add nuw nsw i64 %85, 1
  %96 = trunc i64 %95 to i32
  %97 = add i32 %96, %75
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i8, i8* %0, i64 %98
  %100 = load i8, i8* %99, align 1, !tbaa !1
  %101 = uitofp i8 %100 to float
  %102 = fmul float %6, %101
  %103 = fadd float %94, %102
  %104 = add nuw nsw i64 %85, 2
  %105 = icmp eq i64 %104, %14
  br i1 %105, label %._crit_edge5.loopexit, label %._crit_edge7

._crit_edge.loopexit:                             ; preds = %._crit_edge2
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void

._crit_edge2.loopexit:                            ; preds = %.us-lcssa.us.us
  br label %._crit_edge2

._crit_edge2.loopexit41:                          ; preds = %.us-lcssa
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2.loopexit41, %._crit_edge2.loopexit, %._crit_edge8, %63
  %106 = add nuw nsw i64 %22, 1
  %107 = icmp eq i64 %106, %16
  br i1 %107, label %._crit_edge.loopexit, label %._crit_edge8
}

; Function Attrs: norecurse nounwind uwtable
define void @_Z8blur_fixPhS_(i8* nocapture readonly, i8* nocapture) local_unnamed_addr #2 {
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %146, %2
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
  br i1 %16, label %._crit_edge.preheader, label %._crit_edge1.preheader

._crit_edge1.preheader:                           ; preds = %._crit_edge3
  br label %._crit_edge1

._crit_edge.preheader.loopexit:                   ; preds = %._crit_edge1
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.preheader.loopexit, %._crit_edge3
  %.ph = phi i64 [ 0, %._crit_edge3 ], [ 272, %._crit_edge.preheader.loopexit ]
  br label %._crit_edge

._crit_edge1:                                     ; preds = %._crit_edge1.preheader, %._crit_edge1
  %17 = phi i64 [ %84, %._crit_edge1 ], [ 0, %._crit_edge1.preheader ]
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
  br i1 %85, label %._crit_edge.preheader.loopexit, label %._crit_edge1, !llvm.loop !9

; <label>:86:                                     ; preds = %146
  ret void

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %87 = phi i64 [ %144, %._crit_edge ], [ %.ph, %._crit_edge.preheader ]
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
  br i1 %145, label %146, label %._crit_edge, !llvm.loop !12

; <label>:146:                                    ; preds = %._crit_edge
  %147 = icmp eq i64 %12, 220
  br i1 %147, label %86, label %._crit_edge3
}

; Function Attrs: norecurse noreturn nounwind uwtable
define void @_Z4testPhS_(i8* nocapture readonly, i8* nocapture) local_unnamed_addr #4 {
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %119
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %119, %.loopexit
  %3 = phi i64 [ 0, %.loopexit ], [ %120, %119 ]
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
  br i1 %14, label %15, label %26

; <label>:15:                                     ; preds = %26, %._crit_edge4
  %16 = phi i64 [ 256, %26 ], [ 0, %._crit_edge4 ]
  %17 = add nuw nsw i64 %16, %4
  %18 = add nsw i64 %17, -1
  %19 = getelementptr inbounds i8, i8* %0, i64 %18
  %20 = load i8, i8* %19, align 1, !tbaa !1
  %21 = getelementptr inbounds i8, i8* %1, i64 %17
  store i8 %20, i8* %21, align 1, !tbaa !1
  %22 = or i64 %16, 1
  %23 = or i64 %4, 1
  %24 = or i64 %4, 2
  %25 = or i64 %4, 3
  br label %._crit_edge5

; <label>:26:                                     ; preds = %._crit_edge4
  %27 = bitcast i8* %9 to <16 x i8>*
  %28 = load <16 x i8>, <16 x i8>* %27, align 1, !tbaa !1, !alias.scope !13
  %29 = getelementptr i8, i8* %9, i64 16
  %30 = bitcast i8* %29 to <16 x i8>*
  %31 = load <16 x i8>, <16 x i8>* %30, align 1, !tbaa !1, !alias.scope !13
  %32 = bitcast i8* %5 to <16 x i8>*
  store <16 x i8> %28, <16 x i8>* %32, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %33 = getelementptr i8, i8* %5, i64 16
  %34 = bitcast i8* %33 to <16 x i8>*
  store <16 x i8> %31, <16 x i8>* %34, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %35 = add nuw nsw i64 %4, 32
  %36 = add nuw nsw i64 %4, 31
  %37 = getelementptr inbounds i8, i8* %0, i64 %36
  %38 = bitcast i8* %37 to <16 x i8>*
  %39 = load <16 x i8>, <16 x i8>* %38, align 1, !tbaa !1, !alias.scope !13
  %40 = getelementptr i8, i8* %37, i64 16
  %41 = bitcast i8* %40 to <16 x i8>*
  %42 = load <16 x i8>, <16 x i8>* %41, align 1, !tbaa !1, !alias.scope !13
  %43 = getelementptr inbounds i8, i8* %1, i64 %35
  %44 = bitcast i8* %43 to <16 x i8>*
  store <16 x i8> %39, <16 x i8>* %44, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %45 = getelementptr i8, i8* %43, i64 16
  %46 = bitcast i8* %45 to <16 x i8>*
  store <16 x i8> %42, <16 x i8>* %46, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %47 = add nuw nsw i64 %4, 64
  %48 = add nuw nsw i64 %4, 63
  %49 = getelementptr inbounds i8, i8* %0, i64 %48
  %50 = bitcast i8* %49 to <16 x i8>*
  %51 = load <16 x i8>, <16 x i8>* %50, align 1, !tbaa !1, !alias.scope !13
  %52 = getelementptr i8, i8* %49, i64 16
  %53 = bitcast i8* %52 to <16 x i8>*
  %54 = load <16 x i8>, <16 x i8>* %53, align 1, !tbaa !1, !alias.scope !13
  %55 = getelementptr inbounds i8, i8* %1, i64 %47
  %56 = bitcast i8* %55 to <16 x i8>*
  store <16 x i8> %51, <16 x i8>* %56, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %57 = getelementptr i8, i8* %55, i64 16
  %58 = bitcast i8* %57 to <16 x i8>*
  store <16 x i8> %54, <16 x i8>* %58, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %59 = add nuw nsw i64 %4, 96
  %60 = add nuw nsw i64 %4, 95
  %61 = getelementptr inbounds i8, i8* %0, i64 %60
  %62 = bitcast i8* %61 to <16 x i8>*
  %63 = load <16 x i8>, <16 x i8>* %62, align 1, !tbaa !1, !alias.scope !13
  %64 = getelementptr i8, i8* %61, i64 16
  %65 = bitcast i8* %64 to <16 x i8>*
  %66 = load <16 x i8>, <16 x i8>* %65, align 1, !tbaa !1, !alias.scope !13
  %67 = getelementptr inbounds i8, i8* %1, i64 %59
  %68 = bitcast i8* %67 to <16 x i8>*
  store <16 x i8> %63, <16 x i8>* %68, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %69 = getelementptr i8, i8* %67, i64 16
  %70 = bitcast i8* %69 to <16 x i8>*
  store <16 x i8> %66, <16 x i8>* %70, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %71 = add nuw nsw i64 %4, 128
  %72 = add nuw nsw i64 %4, 127
  %73 = getelementptr inbounds i8, i8* %0, i64 %72
  %74 = bitcast i8* %73 to <16 x i8>*
  %75 = load <16 x i8>, <16 x i8>* %74, align 1, !tbaa !1, !alias.scope !13
  %76 = getelementptr i8, i8* %73, i64 16
  %77 = bitcast i8* %76 to <16 x i8>*
  %78 = load <16 x i8>, <16 x i8>* %77, align 1, !tbaa !1, !alias.scope !13
  %79 = getelementptr inbounds i8, i8* %1, i64 %71
  %80 = bitcast i8* %79 to <16 x i8>*
  store <16 x i8> %75, <16 x i8>* %80, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %81 = getelementptr i8, i8* %79, i64 16
  %82 = bitcast i8* %81 to <16 x i8>*
  store <16 x i8> %78, <16 x i8>* %82, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %83 = add nuw nsw i64 %4, 160
  %84 = add nuw nsw i64 %4, 159
  %85 = getelementptr inbounds i8, i8* %0, i64 %84
  %86 = bitcast i8* %85 to <16 x i8>*
  %87 = load <16 x i8>, <16 x i8>* %86, align 1, !tbaa !1, !alias.scope !13
  %88 = getelementptr i8, i8* %85, i64 16
  %89 = bitcast i8* %88 to <16 x i8>*
  %90 = load <16 x i8>, <16 x i8>* %89, align 1, !tbaa !1, !alias.scope !13
  %91 = getelementptr inbounds i8, i8* %1, i64 %83
  %92 = bitcast i8* %91 to <16 x i8>*
  store <16 x i8> %87, <16 x i8>* %92, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %93 = getelementptr i8, i8* %91, i64 16
  %94 = bitcast i8* %93 to <16 x i8>*
  store <16 x i8> %90, <16 x i8>* %94, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %95 = add nuw nsw i64 %4, 192
  %96 = add nuw nsw i64 %4, 191
  %97 = getelementptr inbounds i8, i8* %0, i64 %96
  %98 = bitcast i8* %97 to <16 x i8>*
  %99 = load <16 x i8>, <16 x i8>* %98, align 1, !tbaa !1, !alias.scope !13
  %100 = getelementptr i8, i8* %97, i64 16
  %101 = bitcast i8* %100 to <16 x i8>*
  %102 = load <16 x i8>, <16 x i8>* %101, align 1, !tbaa !1, !alias.scope !13
  %103 = getelementptr inbounds i8, i8* %1, i64 %95
  %104 = bitcast i8* %103 to <16 x i8>*
  store <16 x i8> %99, <16 x i8>* %104, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %105 = getelementptr i8, i8* %103, i64 16
  %106 = bitcast i8* %105 to <16 x i8>*
  store <16 x i8> %102, <16 x i8>* %106, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %107 = add nuw nsw i64 %4, 224
  %108 = add nuw nsw i64 %4, 223
  %109 = getelementptr inbounds i8, i8* %0, i64 %108
  %110 = bitcast i8* %109 to <16 x i8>*
  %111 = load <16 x i8>, <16 x i8>* %110, align 1, !tbaa !1, !alias.scope !13
  %112 = getelementptr i8, i8* %109, i64 16
  %113 = bitcast i8* %112 to <16 x i8>*
  %114 = load <16 x i8>, <16 x i8>* %113, align 1, !tbaa !1, !alias.scope !13
  %115 = getelementptr inbounds i8, i8* %1, i64 %107
  %116 = bitcast i8* %115 to <16 x i8>*
  store <16 x i8> %111, <16 x i8>* %116, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %117 = getelementptr i8, i8* %115, i64 16
  %118 = bitcast i8* %117 to <16 x i8>*
  store <16 x i8> %114, <16 x i8>* %118, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  br label %15

; <label>:119:                                    ; preds = %._crit_edge5
  %120 = add nuw nsw i64 %3, 1
  %121 = icmp eq i64 %120, 220
  br i1 %121, label %.loopexit.loopexit, label %._crit_edge4

._crit_edge5:                                     ; preds = %._crit_edge5, %15
  %122 = phi i64 [ %22, %15 ], [ %142, %._crit_edge5 ]
  %123 = add i64 %122, %4
  %124 = add nsw i64 %123, -1
  %125 = getelementptr inbounds i8, i8* %0, i64 %124
  %126 = load i8, i8* %125, align 1, !tbaa !1
  %127 = getelementptr inbounds i8, i8* %1, i64 %123
  store i8 %126, i8* %127, align 1, !tbaa !1
  %128 = add i64 %23, %122
  %129 = getelementptr inbounds i8, i8* %0, i64 %123
  %130 = load i8, i8* %129, align 1, !tbaa !1
  %131 = getelementptr inbounds i8, i8* %1, i64 %128
  store i8 %130, i8* %131, align 1, !tbaa !1
  %132 = add i64 %24, %122
  %133 = add nsw i64 %132, -1
  %134 = getelementptr inbounds i8, i8* %0, i64 %133
  %135 = load i8, i8* %134, align 1, !tbaa !1
  %136 = getelementptr inbounds i8, i8* %1, i64 %132
  store i8 %135, i8* %136, align 1, !tbaa !1
  %137 = add i64 %25, %122
  %138 = add nsw i64 %137, -1
  %139 = getelementptr inbounds i8, i8* %0, i64 %138
  %140 = load i8, i8* %139, align 1, !tbaa !1
  %141 = getelementptr inbounds i8, i8* %1, i64 %137
  store i8 %140, i8* %141, align 1, !tbaa !1
  %142 = add nsw i64 %122, 4
  %143 = icmp eq i64 %142, 277
  br i1 %143, label %119, label %._crit_edge5, !llvm.loop !18
}

; Function Attrs: norecurse uwtable
define i32 @main() local_unnamed_addr #5 {
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
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %143, %0
  %16 = phi i64 [ 0, %0 ], [ %144, %143 ]
  %17 = mul nuw nsw i64 %16, 280
  br label %._crit_edge9

; <label>:18:                                     ; preds = %143
  %19 = call i32 @fclose(%struct._IO_FILE* %12)
  %20 = call i32 @fclose(%struct._IO_FILE* %13)
  %21 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i64 0, i64 0), i64 18)
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %134, %18
  %22 = phi i64 [ 0, %18 ], [ %135, %134 ]
  %23 = mul nuw nsw i64 %22, 280
  %24 = shl i64 %22, 32
  %25 = ashr exact i64 %24, 32
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge, %._crit_edge7
  %26 = phi i64 [ 0, %._crit_edge7 ], [ %132, %._crit_edge ]
  %27 = add nsw i64 %26, -4
  %28 = icmp slt i64 %27, 60
  %29 = select i1 %28, i64 %27, i64 60
  %30 = trunc i64 %29 to i32
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %._crit_edge, label %32

; <label>:32:                                     ; preds = %._crit_edge6
  %33 = shl i64 %26, 32
  %34 = ashr exact i64 %33, 32
  %35 = shl i64 %29, 32
  %36 = ashr exact i64 %35, 32
  br label %37

; <label>:37:                                     ; preds = %._crit_edge4, %32
  %38 = phi i64 [ %50, %._crit_edge4 ], [ 0, %32 ]
  %39 = phi float [ %51, %._crit_edge4 ], [ 0.000000e+00, %32 ]
  %40 = phi i32 [ %48, %._crit_edge4 ], [ 0, %32 ]
  %41 = sub nsw i64 %34, %38
  br label %._crit_edge5

; <label>:42:                                     ; preds = %._crit_edge5
  %43 = fmul float %119, %119
  %44 = fmul float %122, %125
  %45 = fdiv float %43, %44
  %46 = fcmp ogt float %45, %39
  %47 = trunc i64 %38 to i32
  %48 = select i1 %46, i32 %47, i32 %40
  %49 = icmp slt i64 %38, %36
  br i1 %49, label %._crit_edge4, label %._crit_edge.loopexit

._crit_edge4:                                     ; preds = %42
  %50 = add nuw nsw i64 %38, 1
  %51 = select i1 %46, float %45, float %39
  br label %37

._crit_edge5:                                     ; preds = %._crit_edge5, %37
  %52 = phi i64 [ 0, %37 ], [ %126, %._crit_edge5 ]
  %53 = phi float [ 0.000000e+00, %37 ], [ %125, %._crit_edge5 ]
  %54 = phi float [ 0.000000e+00, %37 ], [ %122, %._crit_edge5 ]
  %55 = phi float [ 0.000000e+00, %37 ], [ %119, %._crit_edge5 ]
  %56 = add nuw nsw i64 %52, %25
  %57 = mul nuw nsw i64 %56, 280
  %58 = add nuw nsw i64 %57, %34
  %59 = add nsw i64 %57, %41
  %60 = getelementptr inbounds i8, i8* %5, i64 %58
  %61 = load i8, i8* %60, align 1, !tbaa !1
  %62 = zext i8 %61 to i32
  %63 = getelementptr inbounds i8, i8* %6, i64 %59
  %64 = load i8, i8* %63, align 1, !tbaa !1
  %65 = zext i8 %64 to i32
  %66 = mul nuw nsw i32 %65, %62
  %67 = sitofp i32 %66 to float
  %68 = fadd float %55, %67
  %69 = mul nuw nsw i32 %62, %62
  %70 = sitofp i32 %69 to float
  %71 = fadd float %54, %70
  %72 = mul nuw nsw i32 %65, %65
  %73 = sitofp i32 %72 to float
  %74 = fadd float %53, %73
  %75 = add nuw nsw i64 %58, 1
  %76 = getelementptr inbounds i8, i8* %5, i64 %75
  %77 = load i8, i8* %76, align 1, !tbaa !1
  %78 = zext i8 %77 to i32
  %79 = add nsw i64 %59, 1
  %80 = getelementptr inbounds i8, i8* %6, i64 %79
  %81 = load i8, i8* %80, align 1, !tbaa !1
  %82 = zext i8 %81 to i32
  %83 = mul nuw nsw i32 %82, %78
  %84 = sitofp i32 %83 to float
  %85 = fadd float %68, %84
  %86 = mul nuw nsw i32 %78, %78
  %87 = sitofp i32 %86 to float
  %88 = fadd float %71, %87
  %89 = mul nuw nsw i32 %82, %82
  %90 = sitofp i32 %89 to float
  %91 = fadd float %74, %90
  %92 = add nuw nsw i64 %58, 2
  %93 = getelementptr inbounds i8, i8* %5, i64 %92
  %94 = load i8, i8* %93, align 1, !tbaa !1
  %95 = zext i8 %94 to i32
  %96 = add nsw i64 %59, 2
  %97 = getelementptr inbounds i8, i8* %6, i64 %96
  %98 = load i8, i8* %97, align 1, !tbaa !1
  %99 = zext i8 %98 to i32
  %100 = mul nuw nsw i32 %99, %95
  %101 = sitofp i32 %100 to float
  %102 = fadd float %85, %101
  %103 = mul nuw nsw i32 %95, %95
  %104 = sitofp i32 %103 to float
  %105 = fadd float %88, %104
  %106 = mul nuw nsw i32 %99, %99
  %107 = sitofp i32 %106 to float
  %108 = fadd float %91, %107
  %109 = add nuw nsw i64 %58, 3
  %110 = getelementptr inbounds i8, i8* %5, i64 %109
  %111 = load i8, i8* %110, align 1, !tbaa !1
  %112 = zext i8 %111 to i32
  %113 = add nsw i64 %59, 3
  %114 = getelementptr inbounds i8, i8* %6, i64 %113
  %115 = load i8, i8* %114, align 1, !tbaa !1
  %116 = zext i8 %115 to i32
  %117 = mul nuw nsw i32 %116, %112
  %118 = sitofp i32 %117 to float
  %119 = fadd float %102, %118
  %120 = mul nuw nsw i32 %112, %112
  %121 = sitofp i32 %120 to float
  %122 = fadd float %105, %121
  %123 = mul nuw nsw i32 %116, %116
  %124 = sitofp i32 %123 to float
  %125 = fadd float %108, %124
  %126 = add nuw nsw i64 %52, 1
  %127 = icmp eq i64 %126, 4
  br i1 %127, label %42, label %._crit_edge5

._crit_edge.loopexit:                             ; preds = %42
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge6
  %128 = phi i32 [ 0, %._crit_edge6 ], [ %48, %._crit_edge.loopexit ]
  %129 = trunc i32 %128 to i8
  %130 = add nuw nsw i64 %26, %23
  %131 = getelementptr inbounds i8, i8* %7, i64 %130
  store i8 %129, i8* %131, align 1, !tbaa !1
  %132 = add nuw nsw i64 %26, 1
  %133 = icmp eq i64 %132, 276
  br i1 %133, label %134, label %._crit_edge6

; <label>:134:                                    ; preds = %._crit_edge
  %135 = add nuw nsw i64 %22, 1
  %136 = icmp eq i64 %135, 219
  br i1 %136, label %137, label %._crit_edge7

; <label>:137:                                    ; preds = %134
  call void @_Z17Stereo_Vision_fixPhS_S_i(i8* %5, i8* %6, i8* %8, i32 60)
  %138 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6, i64 0, i64 0), i64 15)
  %139 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  %140 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  %141 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %139, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0), i32 280, i32 223, i32 255)
  %142 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %140, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0), i32 280, i32 223, i32 255)
  br label %._crit_edge10

; <label>:143:                                    ; preds = %._crit_edge9
  %144 = add nuw nsw i64 %16, 1
  %145 = icmp eq i64 %144, 223
  br i1 %145, label %18, label %._crit_edge8

._crit_edge9:                                     ; preds = %._crit_edge9, %._crit_edge8
  %146 = phi i64 [ 0, %._crit_edge8 ], [ %152, %._crit_edge9 ]
  %147 = add nuw nsw i64 %146, %17
  %148 = getelementptr inbounds i8, i8* %5, i64 %147
  %149 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %148)
  %150 = getelementptr inbounds i8, i8* %6, i64 %147
  %151 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %150)
  %152 = add nuw nsw i64 %146, 1
  %153 = icmp eq i64 %152, 280
  br i1 %153, label %143, label %._crit_edge9

._crit_edge10:                                    ; preds = %159, %137
  %154 = phi i64 [ 0, %137 ], [ %160, %159 ]
  %155 = mul nuw nsw i64 %154, 280
  br label %._crit_edge11

; <label>:156:                                    ; preds = %159
  %157 = call i32 @fclose(%struct._IO_FILE* %139)
  %158 = call i32 @fclose(%struct._IO_FILE* %140)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %11) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %10) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %9) #1
  call void @llvm.lifetime.end(i64 100, i8* nonnull %.sub) #1
  ret i32 0

; <label>:159:                                    ; preds = %._crit_edge11
  %160 = add nuw nsw i64 %154, 1
  %161 = icmp eq i64 %160, 223
  br i1 %161, label %156, label %._crit_edge10

._crit_edge11:                                    ; preds = %._crit_edge11, %._crit_edge10
  %162 = phi i64 [ 0, %._crit_edge10 ], [ %172, %._crit_edge11 ]
  %163 = add nuw nsw i64 %162, %155
  %164 = getelementptr inbounds i8, i8* %7, i64 %163
  %165 = load i8, i8* %164, align 1, !tbaa !1
  %166 = zext i8 %165 to i32
  %167 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %139, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0), i32 %166)
  %168 = getelementptr inbounds i8, i8* %8, i64 %163
  %169 = load i8, i8* %168, align 1, !tbaa !1
  %170 = zext i8 %169 to i32
  %171 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %140, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0), i32 %170)
  %172 = add nuw nsw i64 %162, 1
  %173 = icmp eq i64 %172, 280
  br i1 %173, label %159, label %._crit_edge11
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
