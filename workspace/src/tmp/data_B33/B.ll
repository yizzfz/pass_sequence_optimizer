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
  br i1 %7, label %8, label %.loopexit5

; <label>:8:                                      ; preds = %5
  %9 = sub nsw i32 280, %4
  %10 = icmp sgt i32 %9, 0
  %11 = sext i32 %4 to i64
  %12 = sext i32 %3 to i64
  %13 = zext i32 %9 to i64
  %14 = zext i32 %4 to i64
  %15 = zext i32 %6 to i64
  %16 = icmp slt i32 %4, 1
  br label %.loopexit4._crit_edge

.loopexit4._crit_edge:                            ; preds = %.loopexit4, %8
  %17 = phi i64 [ 0, %8 ], [ %85, %.loopexit4 ]
  %18 = mul i64 %17, 280
  %scevgep = getelementptr i8, i8* %2, i64 %18
  br i1 %10, label %19, label %.loopexit4

; <label>:19:                                     ; preds = %.loopexit4._crit_edge
  %20 = trunc i64 %17 to i32
  br i1 %16, label %.split.us.preheader, label %.split.preheader

.split.preheader:                                 ; preds = %19
  br label %.split

.split.us.preheader:                              ; preds = %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %13, i32 1, i1 false)
  br label %.loopexit4

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
  br label %._crit_edge13

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

._crit_edge13:                                    ; preds = %50, %29
  %42 = phi float [ 0.000000e+00, %29 ], [ %76, %50 ]
  %43 = phi float [ 0.000000e+00, %29 ], [ %73, %50 ]
  %44 = phi float [ 0.000000e+00, %29 ], [ %70, %50 ]
  %45 = phi i32 [ 0, %29 ], [ %51, %50 ]
  %46 = add nuw nsw i32 %45, %20
  %47 = mul nsw i32 %46, 280
  %48 = add i32 %47, %28
  %49 = add i32 %33, %47
  br label %._crit_edge14

; <label>:50:                                     ; preds = %._crit_edge14
  %51 = add nuw nsw i32 %45, 1
  %52 = icmp eq i32 %51, %4
  br i1 %52, label %34, label %._crit_edge13

._crit_edge14:                                    ; preds = %._crit_edge14, %._crit_edge13
  %53 = phi i64 [ 0, %._crit_edge13 ], [ %77, %._crit_edge14 ]
  %54 = phi float [ %42, %._crit_edge13 ], [ %76, %._crit_edge14 ]
  %55 = phi float [ %43, %._crit_edge13 ], [ %73, %._crit_edge14 ]
  %56 = phi float [ %44, %._crit_edge13 ], [ %70, %._crit_edge14 ]
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
  br i1 %78, label %50, label %._crit_edge14

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
  br i1 %84, label %.loopexit4.loopexit, label %.split

.loopexit4.loopexit:                              ; preds = %.loopexit
  br label %.loopexit4

.loopexit4:                                       ; preds = %.loopexit4.loopexit, %.loopexit4._crit_edge, %.split.us.preheader
  %85 = add nuw nsw i64 %17, 1
  %86 = icmp eq i64 %85, %15
  br i1 %86, label %.loopexit5.loopexit, label %.loopexit4._crit_edge

.loopexit5.loopexit:                              ; preds = %.loopexit4
  br label %.loopexit5

.loopexit5:                                       ; preds = %.loopexit5.loopexit, %5
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

; Function Attrs: norecurse nounwind uwtable
define void @_Z17Stereo_Vision_fixPhS_S_i(i8* nocapture readonly, i8* nocapture readonly, i8* nocapture, i32) local_unnamed_addr #4 {
  %5 = sext i32 %3 to i64
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %112, %4
  %6 = phi i64 [ 0, %4 ], [ %113, %112 ]
  %7 = mul nuw nsw i64 %6, 280
  br label %.loopexit._crit_edge

.loopexit._crit_edge:                             ; preds = %.loopexit, %._crit_edge11
  %8 = phi i64 [ 0, %._crit_edge11 ], [ %110, %.loopexit ]
  %9 = add nsw i64 %8, -4
  %10 = icmp slt i64 %9, %5
  %11 = trunc i64 %9 to i32
  %12 = select i1 %10, i32 %11, i32 %3
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %.loopexit, label %14

; <label>:14:                                     ; preds = %.loopexit._crit_edge
  %15 = sext i32 %12 to i64
  br label %16

; <label>:16:                                     ; preds = %._crit_edge10, %14
  %17 = phi i64 [ %104, %._crit_edge10 ], [ 0, %14 ]
  %18 = phi float [ %105, %._crit_edge10 ], [ 0.000000e+00, %14 ]
  %19 = phi i32 [ %103, %._crit_edge10 ], [ 0, %14 ]
  %20 = sub nsw i64 %8, %17
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %16
  %21 = phi i64 [ 0, %16 ], [ %95, %._crit_edge ]
  %22 = phi float [ 0.000000e+00, %16 ], [ %94, %._crit_edge ]
  %23 = phi float [ 0.000000e+00, %16 ], [ %91, %._crit_edge ]
  %24 = phi float [ 0.000000e+00, %16 ], [ %88, %._crit_edge ]
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
  br i1 %96, label %97, label %._crit_edge

; <label>:97:                                     ; preds = %._crit_edge
  %98 = fmul float %88, %88
  %99 = fmul float %91, %94
  %100 = fdiv float %98, %99
  %101 = fcmp ogt float %100, %18
  %102 = trunc i64 %17 to i32
  %103 = select i1 %101, i32 %102, i32 %19
  %exitcond = icmp eq i64 %17, %15
  br i1 %exitcond, label %.loopexit.loopexit, label %._crit_edge10

._crit_edge10:                                    ; preds = %97
  %104 = add nuw nsw i64 %17, 1
  %105 = select i1 %101, float %100, float %18
  br label %16

.loopexit.loopexit:                               ; preds = %97
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.loopexit._crit_edge
  %106 = phi i32 [ 0, %.loopexit._crit_edge ], [ %103, %.loopexit.loopexit ]
  %107 = trunc i32 %106 to i8
  %108 = add nuw nsw i64 %8, %7
  %109 = getelementptr inbounds i8, i8* %2, i64 %108
  store i8 %107, i8* %109, align 1, !tbaa !1
  %110 = add nuw nsw i64 %8, 1
  %111 = icmp eq i64 %110, 276
  br i1 %111, label %112, label %.loopexit._crit_edge

; <label>:112:                                    ; preds = %.loopexit
  %113 = add nuw nsw i64 %6, 1
  %114 = icmp eq i64 %113, 219
  br i1 %114, label %115, label %._crit_edge11

; <label>:115:                                    ; preds = %112
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
  %22 = phi i64 [ 0, %9 ], [ %98, %.loopexit2 ]
  %23 = mul i64 %22, 1202590842880
  %24 = ashr exact i64 %23, 32
  %25 = getelementptr i8, i8* %1, i64 %24
  br i1 %11, label %26, label %.loopexit2

; <label>:26:                                     ; preds = %.loopexit2._crit_edge
  %27 = mul nuw nsw i64 %22, 280
  br i1 %12, label %28, label %30

; <label>:28:                                     ; preds = %26
  %sext = shl i64 %22, 32
  %29 = ashr exact i64 %sext, 32
  br label %.us-lcssa.us._crit_edge

; <label>:30:                                     ; preds = %26
  tail call void @llvm.memset.p0i8.i64(i8* %25, i8 0, i64 %15, i32 1, i1 false)
  br label %.loopexit2

.us-lcssa.us._crit_edge:                          ; preds = %.us-lcssa.us, %28
  %31 = phi i64 [ 0, %28 ], [ %62, %.us-lcssa.us ]
  %32 = trunc i64 %31 to i32
  br i1 %20, label %.split.us, label %.split.preheader

.split.preheader:                                 ; preds = %.us-lcssa.us._crit_edge
  br label %.split

.split.us:                                        ; preds = %.us-lcssa.us._crit_edge
  br i1 %21, label %.us-lcssa.us, label %.split.us.split.preheader

.split.us.split.preheader:                        ; preds = %.split.us
  br label %.split.us.split

.split.us.split:                                  ; preds = %.split.us.split.preheader, %.loopexit.us
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us, %.loopexit.us ], [ 0, %.split.us.split.preheader ]
  %33 = phi float [ %55, %.loopexit.us ], [ 0.000000e+00, %.split.us.split.preheader ]
  %34 = add nuw nsw i64 %indvars.iv.us, %29
  %35 = mul nsw i64 %34, 280
  %36 = trunc i64 %35 to i32
  %37 = add i32 %36, %32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.split.us.split
  %38 = phi i64 [ 0, %.split.us.split ], [ %56, %._crit_edge ]
  %39 = phi float [ %33, %.split.us.split ], [ %55, %._crit_edge ]
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
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %58 = icmp eq i64 %indvars.iv.next.us, %16
  br i1 %58, label %.us-lcssa.us.loopexit, label %.split.us.split

.us-lcssa.us.loopexit:                            ; preds = %.loopexit.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit15:                          ; preds = %.loopexit
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit15, %.us-lcssa.us.loopexit, %.split.us
  %.lcssa4 = phi float [ undef, %.split.us ], [ %55, %.us-lcssa.us.loopexit ], [ %75, %.us-lcssa.us.loopexit15 ]
  %59 = fptoui float %.lcssa4 to i8
  %60 = add nuw nsw i64 %31, %27
  %61 = getelementptr inbounds i8, i8* %1, i64 %60
  store i8 %59, i8* %61, align 1, !tbaa !1
  %62 = add nuw nsw i64 %31, 1
  %63 = icmp eq i64 %62, %17
  br i1 %63, label %.loopexit2.loopexit, label %.us-lcssa.us._crit_edge

.split:                                           ; preds = %.split.preheader, %.loopexit
  %indvars.iv = phi i64 [ %indvars.iv.next, %.loopexit ], [ 0, %.split.preheader ]
  %64 = phi float [ %75, %.loopexit ], [ 0.000000e+00, %.split.preheader ]
  %65 = add nuw nsw i64 %indvars.iv, %29
  %66 = mul nsw i64 %65, 280
  %67 = trunc i64 %66 to i32
  %68 = add i32 %67, %32
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8* %0, i64 %69
  %71 = load i8, i8* %70, align 1, !tbaa !1
  %72 = uitofp i8 %71 to float
  %73 = fmul float %6, %72
  %74 = fadd float %64, %73
  br i1 %21, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.split
  br label %.preheader

.loopexit.loopexit:                               ; preds = %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.split
  %75 = phi float [ %74, %.split ], [ %95, %.loopexit.loopexit ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %76 = icmp eq i64 %indvars.iv.next, %16
  br i1 %76, label %.us-lcssa.us.loopexit15, label %.split

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %77 = phi i64 [ %96, %.preheader ], [ 1, %.preheader.preheader ]
  %78 = phi float [ %95, %.preheader ], [ %74, %.preheader.preheader ]
  %79 = trunc i64 %77 to i32
  %80 = add i32 %79, %68
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i8, i8* %0, i64 %81
  %83 = load i8, i8* %82, align 1, !tbaa !1
  %84 = uitofp i8 %83 to float
  %85 = fmul float %6, %84
  %86 = fadd float %78, %85
  %87 = add nuw nsw i64 %77, 1
  %88 = trunc i64 %87 to i32
  %89 = add i32 %88, %68
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i8, i8* %0, i64 %90
  %92 = load i8, i8* %91, align 1, !tbaa !1
  %93 = uitofp i8 %92 to float
  %94 = fmul float %6, %93
  %95 = fadd float %86, %94
  %96 = add nuw nsw i64 %77, 2
  %97 = icmp eq i64 %96, %16
  br i1 %97, label %.loopexit.loopexit, label %.preheader

.loopexit3.loopexit:                              ; preds = %.loopexit2
  br label %.loopexit3

.loopexit3:                                       ; preds = %.loopexit3.loopexit, %3
  ret void

.loopexit2.loopexit:                              ; preds = %.us-lcssa.us
  br label %.loopexit2

.loopexit2:                                       ; preds = %.loopexit2.loopexit, %.loopexit2._crit_edge, %30
  %98 = add nuw nsw i64 %22, 1
  %99 = icmp eq i64 %98, %18
  br i1 %99, label %.loopexit3.loopexit, label %.loopexit2._crit_edge
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

; Function Attrs: norecurse noreturn nounwind uwtable
define void @_Z4testPhS_(i8* nocapture readonly, i8* nocapture) local_unnamed_addr #5 {
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %118
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %118, %.loopexit
  %3 = phi i64 [ 0, %.loopexit ], [ %119, %118 ]
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
  br i1 %14, label %._crit_edge, label %25

._crit_edge:                                      ; preds = %._crit_edge1, %25
  %15 = phi i64 [ 256, %25 ], [ 0, %._crit_edge1 ]
  %16 = add nuw nsw i64 %15, %4
  %17 = add nsw i64 %16, -1
  %18 = getelementptr inbounds i8, i8* %0, i64 %17
  %19 = load i8, i8* %18, align 1, !tbaa !1
  %20 = getelementptr inbounds i8, i8* %1, i64 %16
  store i8 %19, i8* %20, align 1, !tbaa !1
  %21 = or i64 %15, 1
  %22 = or i64 %4, 1
  %23 = or i64 %4, 2
  %24 = or i64 %4, 3
  br label %._crit_edge2

; <label>:25:                                     ; preds = %._crit_edge1
  %26 = bitcast i8* %9 to <16 x i8>*
  %27 = load <16 x i8>, <16 x i8>* %26, align 1, !tbaa !1, !alias.scope !13
  %28 = getelementptr i8, i8* %9, i64 16
  %29 = bitcast i8* %28 to <16 x i8>*
  %30 = load <16 x i8>, <16 x i8>* %29, align 1, !tbaa !1, !alias.scope !13
  %31 = bitcast i8* %5 to <16 x i8>*
  store <16 x i8> %27, <16 x i8>* %31, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %32 = getelementptr i8, i8* %5, i64 16
  %33 = bitcast i8* %32 to <16 x i8>*
  store <16 x i8> %30, <16 x i8>* %33, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %34 = add nuw nsw i64 %4, 32
  %35 = add nuw nsw i64 %4, 31
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
  %46 = add nuw nsw i64 %4, 64
  %47 = add nuw nsw i64 %4, 63
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
  %58 = add nuw nsw i64 %4, 96
  %59 = add nuw nsw i64 %4, 95
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
  %70 = add nuw nsw i64 %4, 128
  %71 = add nuw nsw i64 %4, 127
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
  %82 = add nuw nsw i64 %4, 160
  %83 = add nuw nsw i64 %4, 159
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
  %94 = add nuw nsw i64 %4, 192
  %95 = add nuw nsw i64 %4, 191
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
  %106 = add nuw nsw i64 %4, 224
  %107 = add nuw nsw i64 %4, 223
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
  br label %._crit_edge

; <label>:118:                                    ; preds = %._crit_edge2
  %119 = add nuw nsw i64 %3, 1
  %120 = icmp eq i64 %119, 220
  br i1 %120, label %.loopexit.loopexit, label %._crit_edge1

._crit_edge2:                                     ; preds = %._crit_edge2, %._crit_edge
  %121 = phi i64 [ %21, %._crit_edge ], [ %141, %._crit_edge2 ]
  %122 = add i64 %121, %4
  %123 = add nsw i64 %122, -1
  %124 = getelementptr inbounds i8, i8* %0, i64 %123
  %125 = load i8, i8* %124, align 1, !tbaa !1
  %126 = getelementptr inbounds i8, i8* %1, i64 %122
  store i8 %125, i8* %126, align 1, !tbaa !1
  %127 = add i64 %22, %121
  %128 = getelementptr inbounds i8, i8* %0, i64 %122
  %129 = load i8, i8* %128, align 1, !tbaa !1
  %130 = getelementptr inbounds i8, i8* %1, i64 %127
  store i8 %129, i8* %130, align 1, !tbaa !1
  %131 = add i64 %23, %121
  %132 = add nsw i64 %131, -1
  %133 = getelementptr inbounds i8, i8* %0, i64 %132
  %134 = load i8, i8* %133, align 1, !tbaa !1
  %135 = getelementptr inbounds i8, i8* %1, i64 %131
  store i8 %134, i8* %135, align 1, !tbaa !1
  %136 = add i64 %24, %121
  %137 = add nsw i64 %136, -1
  %138 = getelementptr inbounds i8, i8* %0, i64 %137
  %139 = load i8, i8* %138, align 1, !tbaa !1
  %140 = getelementptr inbounds i8, i8* %1, i64 %136
  store i8 %139, i8* %140, align 1, !tbaa !1
  %141 = add nsw i64 %121, 4
  %142 = icmp eq i64 %141, 277
  br i1 %142, label %118, label %._crit_edge2, !llvm.loop !18
}

; Function Attrs: norecurse uwtable
define i32 @main() local_unnamed_addr #6 {
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
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %144, %0
  %17 = phi i64 [ 0, %0 ], [ %145, %144 ]
  %18 = mul nuw nsw i64 %17, 280
  br label %._crit_edge13

; <label>:19:                                     ; preds = %144
  %20 = call i32 @fclose(%struct._IO_FILE* %13)
  %21 = call i32 @fclose(%struct._IO_FILE* %14)
  %22 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i64 0, i64 0), i64 18)
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %135, %19
  %23 = phi i64 [ 0, %19 ], [ %136, %135 ]
  %24 = mul nuw nsw i64 %23, 280
  %25 = shl i64 %23, 32
  %26 = ashr exact i64 %25, 32
  br label %.loopexit._crit_edge

.loopexit._crit_edge:                             ; preds = %.loopexit, %._crit_edge11
  %27 = phi i64 [ 0, %._crit_edge11 ], [ %133, %.loopexit ]
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
  br label %._crit_edge10

; <label>:43:                                     ; preds = %._crit_edge10
  %44 = fmul float %120, %120
  %45 = fmul float %123, %126
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

._crit_edge10:                                    ; preds = %._crit_edge10, %38
  %53 = phi i64 [ 0, %38 ], [ %127, %._crit_edge10 ]
  %54 = phi float [ 0.000000e+00, %38 ], [ %126, %._crit_edge10 ]
  %55 = phi float [ 0.000000e+00, %38 ], [ %123, %._crit_edge10 ]
  %56 = phi float [ 0.000000e+00, %38 ], [ %120, %._crit_edge10 ]
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
  %69 = fadd float %56, %68
  %70 = mul nuw nsw i32 %63, %63
  %71 = sitofp i32 %70 to float
  %72 = fadd float %55, %71
  %73 = mul nuw nsw i32 %66, %66
  %74 = sitofp i32 %73 to float
  %75 = fadd float %54, %74
  %76 = add nuw nsw i64 %59, 1
  %77 = getelementptr inbounds i8, i8* %5, i64 %76
  %78 = load i8, i8* %77, align 1, !tbaa !1
  %79 = zext i8 %78 to i32
  %80 = add nsw i64 %60, 1
  %81 = getelementptr inbounds i8, i8* %6, i64 %80
  %82 = load i8, i8* %81, align 1, !tbaa !1
  %83 = zext i8 %82 to i32
  %84 = mul nuw nsw i32 %83, %79
  %85 = sitofp i32 %84 to float
  %86 = fadd float %69, %85
  %87 = mul nuw nsw i32 %79, %79
  %88 = sitofp i32 %87 to float
  %89 = fadd float %72, %88
  %90 = mul nuw nsw i32 %83, %83
  %91 = sitofp i32 %90 to float
  %92 = fadd float %75, %91
  %93 = add nuw nsw i64 %59, 2
  %94 = getelementptr inbounds i8, i8* %5, i64 %93
  %95 = load i8, i8* %94, align 1, !tbaa !1
  %96 = zext i8 %95 to i32
  %97 = add nsw i64 %60, 2
  %98 = getelementptr inbounds i8, i8* %6, i64 %97
  %99 = load i8, i8* %98, align 1, !tbaa !1
  %100 = zext i8 %99 to i32
  %101 = mul nuw nsw i32 %100, %96
  %102 = sitofp i32 %101 to float
  %103 = fadd float %86, %102
  %104 = mul nuw nsw i32 %96, %96
  %105 = sitofp i32 %104 to float
  %106 = fadd float %89, %105
  %107 = mul nuw nsw i32 %100, %100
  %108 = sitofp i32 %107 to float
  %109 = fadd float %92, %108
  %110 = add nuw nsw i64 %59, 3
  %111 = getelementptr inbounds i8, i8* %5, i64 %110
  %112 = load i8, i8* %111, align 1, !tbaa !1
  %113 = zext i8 %112 to i32
  %114 = add nsw i64 %60, 3
  %115 = getelementptr inbounds i8, i8* %6, i64 %114
  %116 = load i8, i8* %115, align 1, !tbaa !1
  %117 = zext i8 %116 to i32
  %118 = mul nuw nsw i32 %117, %113
  %119 = sitofp i32 %118 to float
  %120 = fadd float %103, %119
  %121 = mul nuw nsw i32 %113, %113
  %122 = sitofp i32 %121 to float
  %123 = fadd float %106, %122
  %124 = mul nuw nsw i32 %117, %117
  %125 = sitofp i32 %124 to float
  %126 = fadd float %109, %125
  %127 = add nuw nsw i64 %53, 1
  %128 = icmp eq i64 %127, 4
  br i1 %128, label %43, label %._crit_edge10

.loopexit.loopexit:                               ; preds = %43
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.loopexit._crit_edge
  %129 = phi i32 [ 0, %.loopexit._crit_edge ], [ %49, %.loopexit.loopexit ]
  %130 = trunc i32 %129 to i8
  %131 = add nuw nsw i64 %27, %24
  %132 = getelementptr inbounds i8, i8* %7, i64 %131
  store i8 %130, i8* %132, align 1, !tbaa !1
  %133 = add nuw nsw i64 %27, 1
  %134 = icmp eq i64 %133, 276
  br i1 %134, label %135, label %.loopexit._crit_edge

; <label>:135:                                    ; preds = %.loopexit
  %136 = add nuw nsw i64 %23, 1
  %137 = icmp eq i64 %136, 219
  br i1 %137, label %138, label %._crit_edge11

; <label>:138:                                    ; preds = %135
  call void @_Z17Stereo_Vision_fixPhS_S_i(i8* %5, i8* %6, i8* %8, i32 60)
  %139 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6, i64 0, i64 0), i64 15)
  %140 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  %141 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  %142 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %140, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0), i32 280, i32 223, i32 255)
  %143 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %141, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0), i32 280, i32 223, i32 255)
  br label %._crit_edge14

; <label>:144:                                    ; preds = %._crit_edge13
  %145 = add nuw nsw i64 %17, 1
  %146 = icmp eq i64 %145, 223
  br i1 %146, label %19, label %._crit_edge12

._crit_edge13:                                    ; preds = %._crit_edge13, %._crit_edge12
  %147 = phi i64 [ 0, %._crit_edge12 ], [ %153, %._crit_edge13 ]
  %148 = add nuw nsw i64 %147, %18
  %149 = getelementptr inbounds i8, i8* %5, i64 %148
  %150 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %149)
  %151 = getelementptr inbounds i8, i8* %6, i64 %148
  %152 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %151)
  %153 = add nuw nsw i64 %147, 1
  %154 = icmp eq i64 %153, 280
  br i1 %154, label %144, label %._crit_edge13

._crit_edge14:                                    ; preds = %160, %138
  %155 = phi i64 [ 0, %138 ], [ %161, %160 ]
  %156 = mul nuw nsw i64 %155, 280
  br label %._crit_edge15

; <label>:157:                                    ; preds = %160
  %158 = call i32 @fclose(%struct._IO_FILE* %140)
  %159 = call i32 @fclose(%struct._IO_FILE* %141)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %12) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %11) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %10) #1
  call void @llvm.lifetime.end(i64 100, i8* nonnull %9) #1
  ret i32 0

; <label>:160:                                    ; preds = %._crit_edge15
  %161 = add nuw nsw i64 %155, 1
  %162 = icmp eq i64 %161, 223
  br i1 %162, label %157, label %._crit_edge14

._crit_edge15:                                    ; preds = %._crit_edge15, %._crit_edge14
  %163 = phi i64 [ 0, %._crit_edge14 ], [ %173, %._crit_edge15 ]
  %164 = add nuw nsw i64 %163, %156
  %165 = getelementptr inbounds i8, i8* %7, i64 %164
  %166 = load i8, i8* %165, align 1, !tbaa !1
  %167 = zext i8 %166 to i32
  %168 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %140, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0), i32 %167)
  %169 = getelementptr inbounds i8, i8* %8, i64 %164
  %170 = load i8, i8* %169, align 1, !tbaa !1
  %171 = zext i8 %170 to i32
  %172 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %141, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0), i32 %171)
  %173 = add nuw nsw i64 %163, 1
  %174 = icmp eq i64 %173, 280
  br i1 %174, label %160, label %._crit_edge15
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
