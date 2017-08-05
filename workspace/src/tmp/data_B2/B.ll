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
  br label %15

; <label>:15:                                     ; preds = %.loopexit1, %8
  %16 = phi i64 [ 0, %8 ], [ %89, %.loopexit1 ]
  %17 = icmp sgt i32 %9, 0
  %18 = mul i64 %16, 280
  %scevgep = getelementptr i8, i8* %2, i64 %18
  br i1 %17, label %19, label %.loopexit1

; <label>:19:                                     ; preds = %15
  %20 = icmp slt i32 %4, 1
  %21 = mul nuw nsw i64 %16, 280
  %22 = trunc i64 %16 to i32
  br i1 %20, label %.loopexit1.loopexit, label %.split.preheader

.split.preheader:                                 ; preds = %19
  br label %.split

.split:                                           ; preds = %.split.preheader, %.loopexit
  %23 = phi i64 [ %87, %.loopexit ], [ 0, %.split.preheader ]
  %24 = sub nsw i64 %23, %10
  %25 = icmp slt i64 %24, %11
  %26 = trunc i64 %24 to i32
  %27 = select i1 %25, i32 %26, i32 %3
  %28 = icmp slt i32 %27, 0
  br i1 %28, label %.loopexit, label %29

; <label>:29:                                     ; preds = %.split
  %30 = trunc i64 %23 to i32
  br label %31

; <label>:31:                                     ; preds = %36, %29
  %32 = phi float [ %42, %36 ], [ 0.000000e+00, %29 ]
  %33 = phi i32 [ %41, %36 ], [ 0, %29 ]
  %34 = phi i32 [ %43, %36 ], [ 0, %29 ]
  %35 = sub i32 %30, %34
  br label %44

; <label>:36:                                     ; preds = %53
  %37 = fmul float %74, %74
  %38 = fmul float %77, %80
  %39 = fdiv float %37, %38
  %40 = fcmp ogt float %39, %32
  %41 = select i1 %40, i32 %34, i32 %33
  %42 = select i1 %40, float %39, float %32
  %43 = add nuw nsw i32 %34, 1
  %exitcond = icmp eq i32 %34, %27
  br i1 %exitcond, label %.loopexit.loopexit, label %31

; <label>:44:                                     ; preds = %53, %31
  %45 = phi float [ %80, %53 ], [ 0.000000e+00, %31 ]
  %46 = phi float [ %77, %53 ], [ 0.000000e+00, %31 ]
  %47 = phi float [ %74, %53 ], [ 0.000000e+00, %31 ]
  %48 = phi i32 [ %54, %53 ], [ 0, %31 ]
  %49 = add nuw nsw i32 %48, %22
  %50 = mul nsw i32 %49, 280
  %51 = add i32 %50, %30
  %52 = add i32 %35, %50
  br label %56

; <label>:53:                                     ; preds = %56
  %54 = add nuw nsw i32 %48, 1
  %55 = icmp eq i32 %54, %4
  br i1 %55, label %36, label %44

; <label>:56:                                     ; preds = %56, %44
  %57 = phi i64 [ %81, %56 ], [ 0, %44 ]
  %58 = phi float [ %80, %56 ], [ %45, %44 ]
  %59 = phi float [ %77, %56 ], [ %46, %44 ]
  %60 = phi float [ %74, %56 ], [ %47, %44 ]
  %61 = trunc i64 %57 to i32
  %62 = add i32 %51, %61
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8* %0, i64 %63
  %65 = load i8, i8* %64, align 1, !tbaa !1
  %66 = zext i8 %65 to i32
  %67 = add i32 %52, %61
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i8, i8* %1, i64 %68
  %70 = load i8, i8* %69, align 1, !tbaa !1
  %71 = zext i8 %70 to i32
  %72 = mul nuw nsw i32 %71, %66
  %73 = sitofp i32 %72 to float
  %74 = fadd float %60, %73
  %75 = mul nuw nsw i32 %66, %66
  %76 = sitofp i32 %75 to float
  %77 = fadd float %59, %76
  %78 = mul nuw nsw i32 %71, %71
  %79 = sitofp i32 %78 to float
  %80 = fadd float %58, %79
  %81 = add nuw nsw i64 %57, 1
  %82 = icmp eq i64 %81, %13
  br i1 %82, label %53, label %56

.loopexit.loopexit:                               ; preds = %36
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.split
  %83 = phi i32 [ 0, %.split ], [ %41, %.loopexit.loopexit ]
  %84 = trunc i32 %83 to i8
  %85 = add nuw nsw i64 %23, %21
  %86 = getelementptr inbounds i8, i8* %2, i64 %85
  store i8 %84, i8* %86, align 1, !tbaa !1
  %87 = add nuw nsw i64 %23, 1
  %88 = icmp eq i64 %87, %12
  br i1 %88, label %.loopexit1.loopexit27, label %.split

.loopexit1.loopexit:                              ; preds = %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %12, i32 1, i1 false)
  br label %.loopexit1

.loopexit1.loopexit27:                            ; preds = %.loopexit
  br label %.loopexit1

.loopexit1:                                       ; preds = %.loopexit1.loopexit27, %.loopexit1.loopexit, %15
  %89 = add nuw nsw i64 %16, 1
  %90 = icmp eq i64 %89, %14
  br i1 %90, label %.loopexit2.loopexit, label %15

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

; <label>:6:                                      ; preds = %115, %4
  %7 = phi i64 [ 0, %4 ], [ %116, %115 ]
  %8 = mul nuw nsw i64 %7, 280
  br label %9

; <label>:9:                                      ; preds = %.loopexit, %6
  %10 = phi i64 [ 0, %6 ], [ %113, %.loopexit ]
  %11 = add nsw i64 %10, -4
  %12 = icmp slt i64 %11, %5
  %13 = trunc i64 %11 to i32
  %14 = select i1 %12, i32 %13, i32 %3
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %.loopexit, label %16

; <label>:16:                                     ; preds = %9
  %17 = sext i32 %14 to i64
  br label %18

; <label>:18:                                     ; preds = %100, %16
  %19 = phi i64 [ %108, %100 ], [ 0, %16 ]
  %20 = phi float [ %107, %100 ], [ 0.000000e+00, %16 ]
  %21 = phi i32 [ %106, %100 ], [ 0, %16 ]
  %22 = sub nsw i64 %10, %19
  br label %23

; <label>:23:                                     ; preds = %23, %18
  %24 = phi i64 [ 0, %18 ], [ %98, %23 ]
  %25 = phi float [ 0.000000e+00, %18 ], [ %97, %23 ]
  %26 = phi float [ 0.000000e+00, %18 ], [ %94, %23 ]
  %27 = phi float [ 0.000000e+00, %18 ], [ %91, %23 ]
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
  %40 = fadd float %27, %39
  %41 = mul nuw nsw i32 %34, %34
  %42 = sitofp i32 %41 to float
  %43 = fadd float %26, %42
  %44 = mul nuw nsw i32 %37, %37
  %45 = sitofp i32 %44 to float
  %46 = fadd float %25, %45
  %47 = add nuw nsw i64 %30, 1
  %48 = getelementptr inbounds i8, i8* %0, i64 %47
  %49 = load i8, i8* %48, align 1, !tbaa !1
  %50 = zext i8 %49 to i32
  %51 = add nsw i64 %31, 1
  %52 = getelementptr inbounds i8, i8* %1, i64 %51
  %53 = load i8, i8* %52, align 1, !tbaa !1
  %54 = zext i8 %53 to i32
  %55 = mul nuw nsw i32 %54, %50
  %56 = sitofp i32 %55 to float
  %57 = fadd float %40, %56
  %58 = mul nuw nsw i32 %50, %50
  %59 = sitofp i32 %58 to float
  %60 = fadd float %43, %59
  %61 = mul nuw nsw i32 %54, %54
  %62 = sitofp i32 %61 to float
  %63 = fadd float %46, %62
  %64 = add nuw nsw i64 %30, 2
  %65 = getelementptr inbounds i8, i8* %0, i64 %64
  %66 = load i8, i8* %65, align 1, !tbaa !1
  %67 = zext i8 %66 to i32
  %68 = add nsw i64 %31, 2
  %69 = getelementptr inbounds i8, i8* %1, i64 %68
  %70 = load i8, i8* %69, align 1, !tbaa !1
  %71 = zext i8 %70 to i32
  %72 = mul nuw nsw i32 %71, %67
  %73 = sitofp i32 %72 to float
  %74 = fadd float %57, %73
  %75 = mul nuw nsw i32 %67, %67
  %76 = sitofp i32 %75 to float
  %77 = fadd float %60, %76
  %78 = mul nuw nsw i32 %71, %71
  %79 = sitofp i32 %78 to float
  %80 = fadd float %63, %79
  %81 = add nuw nsw i64 %30, 3
  %82 = getelementptr inbounds i8, i8* %0, i64 %81
  %83 = load i8, i8* %82, align 1, !tbaa !1
  %84 = zext i8 %83 to i32
  %85 = add nsw i64 %31, 3
  %86 = getelementptr inbounds i8, i8* %1, i64 %85
  %87 = load i8, i8* %86, align 1, !tbaa !1
  %88 = zext i8 %87 to i32
  %89 = mul nuw nsw i32 %88, %84
  %90 = sitofp i32 %89 to float
  %91 = fadd float %74, %90
  %92 = mul nuw nsw i32 %84, %84
  %93 = sitofp i32 %92 to float
  %94 = fadd float %77, %93
  %95 = mul nuw nsw i32 %88, %88
  %96 = sitofp i32 %95 to float
  %97 = fadd float %80, %96
  %98 = add nuw nsw i64 %24, 1
  %99 = icmp eq i64 %98, 4
  br i1 %99, label %100, label %23

; <label>:100:                                    ; preds = %23
  %101 = fmul float %91, %91
  %102 = fmul float %94, %97
  %103 = fdiv float %101, %102
  %104 = fcmp ogt float %103, %20
  %105 = trunc i64 %19 to i32
  %106 = select i1 %104, i32 %105, i32 %21
  %107 = select i1 %104, float %103, float %20
  %108 = add nuw nsw i64 %19, 1
  %exitcond = icmp eq i64 %19, %17
  br i1 %exitcond, label %.loopexit.loopexit, label %18

.loopexit.loopexit:                               ; preds = %100
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %9
  %109 = phi i32 [ 0, %9 ], [ %106, %.loopexit.loopexit ]
  %110 = trunc i32 %109 to i8
  %111 = add nuw nsw i64 %10, %8
  %112 = getelementptr inbounds i8, i8* %2, i64 %111
  store i8 %110, i8* %112, align 1, !tbaa !1
  %113 = add nuw nsw i64 %10, 1
  %114 = icmp eq i64 %113, 276
  br i1 %114, label %115, label %9

; <label>:115:                                    ; preds = %.loopexit
  %116 = add nuw nsw i64 %7, 1
  %117 = icmp eq i64 %116, 219
  br i1 %117, label %118, label %6

; <label>:118:                                    ; preds = %115
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
  %18 = zext i32 %2 to i64
  br label %19

; <label>:19:                                     ; preds = %.loopexit2, %9
  %20 = phi i64 [ 0, %9 ], [ %104, %.loopexit2 ]
  %21 = icmp sgt i32 %10, 0
  %22 = trunc i64 %20 to i32
  %23 = mul i64 %20, 1202590842880
  %24 = ashr exact i64 %23, 32
  %25 = getelementptr i8, i8* %1, i64 %24
  br i1 %21, label %26, label %.loopexit2

; <label>:26:                                     ; preds = %19
  %27 = icmp sgt i32 %2, 0
  %28 = mul nuw nsw i64 %20, 280
  br i1 %27, label %.preheader1.preheader, label %30

.preheader1.preheader:                            ; preds = %26
  %sext = shl i64 %20, 32
  %29 = ashr exact i64 %sext, 32
  br label %.preheader1

; <label>:30:                                     ; preds = %26
  tail call void @llvm.memset.p0i8.i64(i8* %25, i8 0, i64 %13, i32 1, i1 false)
  br label %.loopexit2

.preheader1:                                      ; preds = %.preheader1.preheader, %.us-lcssa.us
  %31 = phi i64 [ %67, %.us-lcssa.us ], [ 0, %.preheader1.preheader ]
  %32 = icmp eq i64 %17, 0
  %33 = trunc i64 %31 to i32
  br i1 %32, label %.split.us, label %.split.preheader

.split.preheader:                                 ; preds = %.preheader1
  br label %.split

.split.us:                                        ; preds = %.preheader1
  %34 = icmp eq i32 %2, 1
  br i1 %34, label %.us-lcssa.us, label %.split.us.split.preheader

.split.us.split.preheader:                        ; preds = %.split.us
  br label %.split.us.split

.split.us.split:                                  ; preds = %.split.us.split.preheader, %.loopexit.us
  %35 = phi i32 [ %62, %.loopexit.us ], [ 0, %.split.us.split.preheader ]
  %36 = phi float [ %59, %.loopexit.us ], [ 0.000000e+00, %.split.us.split.preheader ]
  %37 = add nuw nsw i32 %35, %22
  %38 = mul nsw i32 %37, 280
  %39 = add i32 %38, %33
  br label %40

; <label>:40:                                     ; preds = %.split.us.split, %40
  %41 = phi i64 [ %60, %40 ], [ 0, %.split.us.split ]
  %42 = phi float [ %59, %40 ], [ %36, %.split.us.split ]
  %43 = trunc i64 %41 to i32
  %44 = add i32 %43, %39
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8, i8* %0, i64 %45
  %47 = load i8, i8* %46, align 1, !tbaa !1
  %48 = uitofp i8 %47 to float
  %49 = fmul float %6, %48
  %50 = fadd float %42, %49
  %51 = trunc i64 %41 to i32
  %52 = or i32 %51, 1
  %53 = add i32 %52, %39
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8, i8* %0, i64 %54
  %56 = load i8, i8* %55, align 1, !tbaa !1
  %57 = uitofp i8 %56 to float
  %58 = fmul float %6, %57
  %59 = fadd float %50, %58
  %60 = add nuw nsw i64 %41, 2
  %61 = icmp eq i64 %60, %14
  br i1 %61, label %.loopexit.us, label %40

.loopexit.us:                                     ; preds = %40
  %62 = add nuw nsw i32 %35, 1
  %63 = icmp eq i32 %62, %2
  br i1 %63, label %.us-lcssa.us.loopexit, label %.split.us.split

.us-lcssa.us.loopexit:                            ; preds = %.loopexit.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit20:                          ; preds = %.loopexit
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit20, %.us-lcssa.us.loopexit, %.split.us
  %.lcssa4 = phi float [ undef, %.split.us ], [ %59, %.us-lcssa.us.loopexit ], [ %81, %.us-lcssa.us.loopexit20 ]
  %64 = fptoui float %.lcssa4 to i8
  %65 = add nuw nsw i64 %31, %28
  %66 = getelementptr inbounds i8, i8* %1, i64 %65
  store i8 %64, i8* %66, align 1, !tbaa !1
  %67 = add nuw nsw i64 %31, 1
  %68 = icmp eq i64 %67, %15
  br i1 %68, label %.loopexit2.loopexit, label %.preheader1

.split:                                           ; preds = %.split.preheader, %.loopexit
  %indvars.iv = phi i64 [ %indvars.iv.next, %.loopexit ], [ 0, %.split.preheader ]
  %69 = phi float [ %81, %.loopexit ], [ 0.000000e+00, %.split.preheader ]
  %70 = icmp eq i32 %2, 1
  %71 = add nuw nsw i64 %indvars.iv, %29
  %72 = mul nsw i64 %71, 280
  %73 = trunc i64 %72 to i32
  %74 = add i32 %73, %33
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8* %0, i64 %75
  %77 = load i8, i8* %76, align 1, !tbaa !1
  %78 = uitofp i8 %77 to float
  %79 = fmul float %6, %78
  %80 = fadd float %69, %79
  br i1 %70, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.split
  br label %.preheader

.loopexit.loopexit:                               ; preds = %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.split
  %81 = phi float [ %80, %.split ], [ %101, %.loopexit.loopexit ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %82 = icmp eq i64 %indvars.iv.next, %18
  br i1 %82, label %.us-lcssa.us.loopexit20, label %.split

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %83 = phi i64 [ %102, %.preheader ], [ 1, %.preheader.preheader ]
  %84 = phi float [ %101, %.preheader ], [ %80, %.preheader.preheader ]
  %85 = trunc i64 %83 to i32
  %86 = add i32 %85, %74
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i8, i8* %0, i64 %87
  %89 = load i8, i8* %88, align 1, !tbaa !1
  %90 = uitofp i8 %89 to float
  %91 = fmul float %6, %90
  %92 = fadd float %84, %91
  %93 = add nuw nsw i64 %83, 1
  %94 = trunc i64 %93 to i32
  %95 = add i32 %94, %74
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i8, i8* %0, i64 %96
  %98 = load i8, i8* %97, align 1, !tbaa !1
  %99 = uitofp i8 %98 to float
  %100 = fmul float %6, %99
  %101 = fadd float %92, %100
  %102 = add nuw nsw i64 %83, 2
  %103 = icmp eq i64 %102, %14
  br i1 %103, label %.loopexit.loopexit, label %.preheader

.loopexit3.loopexit:                              ; preds = %.loopexit2
  br label %.loopexit3

.loopexit3:                                       ; preds = %.loopexit3.loopexit, %3
  ret void

.loopexit2.loopexit:                              ; preds = %.us-lcssa.us
  br label %.loopexit2

.loopexit2:                                       ; preds = %.loopexit2.loopexit, %30, %19
  %104 = add nuw nsw i64 %20, 1
  %105 = icmp eq i64 %104, %16
  br i1 %105, label %.loopexit3.loopexit, label %19
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

; Function Attrs: norecurse noreturn nounwind uwtable
define void @_Z4testPhS_(i8* nocapture readonly, i8* nocapture) local_unnamed_addr #4 {
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %114
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  br label %3

; <label>:3:                                      ; preds = %114, %.loopexit
  %4 = phi i64 [ 0, %.loopexit ], [ %115, %114 ]
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
  br i1 %15, label %16, label %27

; <label>:16:                                     ; preds = %27, %3
  %17 = phi i64 [ 0, %3 ], [ 256, %27 ]
  %18 = add nuw nsw i64 %17, %5
  %19 = add nsw i64 %18, -1
  %20 = getelementptr inbounds i8, i8* %0, i64 %19
  %21 = load i8, i8* %20, align 1, !tbaa !1
  %22 = getelementptr inbounds i8, i8* %1, i64 %18
  store i8 %21, i8* %22, align 1, !tbaa !1
  %23 = or i64 %17, 1
  %24 = or i64 %5, 1
  %25 = or i64 %5, 2
  %26 = or i64 %5, 3
  br label %117

; <label>:27:                                     ; preds = %3
  %sunkaddr = ptrtoint i8* %0 to i64
  %sunkaddr1 = add i64 %sunkaddr, %5
  %sunkaddr2 = add i64 %sunkaddr1, -1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to <16 x i8>*
  %28 = load <16 x i8>, <16 x i8>* %sunkaddr3, align 1, !tbaa !1, !alias.scope !13
  %sunkaddr4 = ptrtoint i8* %0 to i64
  %sunkaddr5 = add i64 %sunkaddr4, %5
  %sunkaddr6 = add i64 %sunkaddr5, 15
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to <16 x i8>*
  %29 = load <16 x i8>, <16 x i8>* %sunkaddr7, align 1, !tbaa !1, !alias.scope !13
  %sunkaddr8 = ptrtoint i8* %1 to i64
  %sunkaddr9 = add i64 %sunkaddr8, %5
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to <16 x i8>*
  store <16 x i8> %28, <16 x i8>* %sunkaddr10, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %sunkaddr11 = ptrtoint i8* %1 to i64
  %sunkaddr12 = add i64 %sunkaddr11, %5
  %sunkaddr13 = add i64 %sunkaddr12, 16
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to <16 x i8>*
  store <16 x i8> %29, <16 x i8>* %sunkaddr14, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %30 = add nuw nsw i64 %5, 32
  %31 = add nuw nsw i64 %5, 31
  %32 = getelementptr inbounds i8, i8* %0, i64 %31
  %33 = bitcast i8* %32 to <16 x i8>*
  %34 = load <16 x i8>, <16 x i8>* %33, align 1, !tbaa !1, !alias.scope !13
  %35 = getelementptr i8, i8* %32, i64 16
  %36 = bitcast i8* %35 to <16 x i8>*
  %37 = load <16 x i8>, <16 x i8>* %36, align 1, !tbaa !1, !alias.scope !13
  %38 = getelementptr inbounds i8, i8* %1, i64 %30
  %39 = bitcast i8* %38 to <16 x i8>*
  store <16 x i8> %34, <16 x i8>* %39, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %40 = getelementptr i8, i8* %38, i64 16
  %41 = bitcast i8* %40 to <16 x i8>*
  store <16 x i8> %37, <16 x i8>* %41, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %42 = add nuw nsw i64 %5, 64
  %43 = add nuw nsw i64 %5, 63
  %44 = getelementptr inbounds i8, i8* %0, i64 %43
  %45 = bitcast i8* %44 to <16 x i8>*
  %46 = load <16 x i8>, <16 x i8>* %45, align 1, !tbaa !1, !alias.scope !13
  %47 = getelementptr i8, i8* %44, i64 16
  %48 = bitcast i8* %47 to <16 x i8>*
  %49 = load <16 x i8>, <16 x i8>* %48, align 1, !tbaa !1, !alias.scope !13
  %50 = getelementptr inbounds i8, i8* %1, i64 %42
  %51 = bitcast i8* %50 to <16 x i8>*
  store <16 x i8> %46, <16 x i8>* %51, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %52 = getelementptr i8, i8* %50, i64 16
  %53 = bitcast i8* %52 to <16 x i8>*
  store <16 x i8> %49, <16 x i8>* %53, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %54 = add nuw nsw i64 %5, 96
  %55 = add nuw nsw i64 %5, 95
  %56 = getelementptr inbounds i8, i8* %0, i64 %55
  %57 = bitcast i8* %56 to <16 x i8>*
  %58 = load <16 x i8>, <16 x i8>* %57, align 1, !tbaa !1, !alias.scope !13
  %59 = getelementptr i8, i8* %56, i64 16
  %60 = bitcast i8* %59 to <16 x i8>*
  %61 = load <16 x i8>, <16 x i8>* %60, align 1, !tbaa !1, !alias.scope !13
  %62 = getelementptr inbounds i8, i8* %1, i64 %54
  %63 = bitcast i8* %62 to <16 x i8>*
  store <16 x i8> %58, <16 x i8>* %63, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %64 = getelementptr i8, i8* %62, i64 16
  %65 = bitcast i8* %64 to <16 x i8>*
  store <16 x i8> %61, <16 x i8>* %65, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %66 = add nuw nsw i64 %5, 128
  %67 = add nuw nsw i64 %5, 127
  %68 = getelementptr inbounds i8, i8* %0, i64 %67
  %69 = bitcast i8* %68 to <16 x i8>*
  %70 = load <16 x i8>, <16 x i8>* %69, align 1, !tbaa !1, !alias.scope !13
  %71 = getelementptr i8, i8* %68, i64 16
  %72 = bitcast i8* %71 to <16 x i8>*
  %73 = load <16 x i8>, <16 x i8>* %72, align 1, !tbaa !1, !alias.scope !13
  %74 = getelementptr inbounds i8, i8* %1, i64 %66
  %75 = bitcast i8* %74 to <16 x i8>*
  store <16 x i8> %70, <16 x i8>* %75, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %76 = getelementptr i8, i8* %74, i64 16
  %77 = bitcast i8* %76 to <16 x i8>*
  store <16 x i8> %73, <16 x i8>* %77, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %78 = add nuw nsw i64 %5, 160
  %79 = add nuw nsw i64 %5, 159
  %80 = getelementptr inbounds i8, i8* %0, i64 %79
  %81 = bitcast i8* %80 to <16 x i8>*
  %82 = load <16 x i8>, <16 x i8>* %81, align 1, !tbaa !1, !alias.scope !13
  %83 = getelementptr i8, i8* %80, i64 16
  %84 = bitcast i8* %83 to <16 x i8>*
  %85 = load <16 x i8>, <16 x i8>* %84, align 1, !tbaa !1, !alias.scope !13
  %86 = getelementptr inbounds i8, i8* %1, i64 %78
  %87 = bitcast i8* %86 to <16 x i8>*
  store <16 x i8> %82, <16 x i8>* %87, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %88 = getelementptr i8, i8* %86, i64 16
  %89 = bitcast i8* %88 to <16 x i8>*
  store <16 x i8> %85, <16 x i8>* %89, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %90 = add nuw nsw i64 %5, 192
  %91 = add nuw nsw i64 %5, 191
  %92 = getelementptr inbounds i8, i8* %0, i64 %91
  %93 = bitcast i8* %92 to <16 x i8>*
  %94 = load <16 x i8>, <16 x i8>* %93, align 1, !tbaa !1, !alias.scope !13
  %95 = getelementptr i8, i8* %92, i64 16
  %96 = bitcast i8* %95 to <16 x i8>*
  %97 = load <16 x i8>, <16 x i8>* %96, align 1, !tbaa !1, !alias.scope !13
  %98 = getelementptr inbounds i8, i8* %1, i64 %90
  %99 = bitcast i8* %98 to <16 x i8>*
  store <16 x i8> %94, <16 x i8>* %99, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %100 = getelementptr i8, i8* %98, i64 16
  %101 = bitcast i8* %100 to <16 x i8>*
  store <16 x i8> %97, <16 x i8>* %101, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %102 = add nuw nsw i64 %5, 224
  %103 = add nuw nsw i64 %5, 223
  %104 = getelementptr inbounds i8, i8* %0, i64 %103
  %105 = bitcast i8* %104 to <16 x i8>*
  %106 = load <16 x i8>, <16 x i8>* %105, align 1, !tbaa !1, !alias.scope !13
  %107 = getelementptr i8, i8* %104, i64 16
  %108 = bitcast i8* %107 to <16 x i8>*
  %109 = load <16 x i8>, <16 x i8>* %108, align 1, !tbaa !1, !alias.scope !13
  %110 = getelementptr inbounds i8, i8* %1, i64 %102
  %111 = bitcast i8* %110 to <16 x i8>*
  store <16 x i8> %106, <16 x i8>* %111, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  %112 = getelementptr i8, i8* %110, i64 16
  %113 = bitcast i8* %112 to <16 x i8>*
  store <16 x i8> %109, <16 x i8>* %113, align 1, !tbaa !1, !alias.scope !16, !noalias !13
  br label %16

; <label>:114:                                    ; preds = %117
  %115 = add nuw nsw i64 %4, 1
  %116 = icmp eq i64 %115, 220
  br i1 %116, label %.loopexit.loopexit, label %3

; <label>:117:                                    ; preds = %117, %16
  %118 = phi i64 [ %23, %16 ], [ %138, %117 ]
  %119 = add i64 %118, %5
  %120 = add nsw i64 %119, -1
  %121 = getelementptr inbounds i8, i8* %0, i64 %120
  %122 = load i8, i8* %121, align 1, !tbaa !1
  %123 = getelementptr inbounds i8, i8* %1, i64 %119
  store i8 %122, i8* %123, align 1, !tbaa !1
  %124 = add i64 %24, %118
  %125 = getelementptr inbounds i8, i8* %0, i64 %119
  %126 = load i8, i8* %125, align 1, !tbaa !1
  %127 = getelementptr inbounds i8, i8* %1, i64 %124
  store i8 %126, i8* %127, align 1, !tbaa !1
  %128 = add i64 %25, %118
  %129 = add nsw i64 %128, -1
  %130 = getelementptr inbounds i8, i8* %0, i64 %129
  %131 = load i8, i8* %130, align 1, !tbaa !1
  %132 = getelementptr inbounds i8, i8* %1, i64 %128
  store i8 %131, i8* %132, align 1, !tbaa !1
  %133 = add i64 %26, %118
  %134 = add nsw i64 %133, -1
  %135 = getelementptr inbounds i8, i8* %0, i64 %134
  %136 = load i8, i8* %135, align 1, !tbaa !1
  %137 = getelementptr inbounds i8, i8* %1, i64 %133
  store i8 %136, i8* %137, align 1, !tbaa !1
  %138 = add nsw i64 %118, 4
  %139 = icmp eq i64 %138, 277
  br i1 %139, label %114, label %117, !llvm.loop !18
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
  %9 = bitcast [100 x i8]* %1 to i8*
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

; <label>:17:                                     ; preds = %148, %0
  %18 = phi i64 [ 0, %0 ], [ %149, %148 ]
  %19 = mul nuw nsw i64 %18, 280
  br label %151

; <label>:20:                                     ; preds = %148
  %21 = call i32 @fclose(%struct._IO_FILE* %13)
  %22 = call i32 @fclose(%struct._IO_FILE* %14)
  %23 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i64 0, i64 0), i64 18)
  br label %24

; <label>:24:                                     ; preds = %139, %20
  %25 = phi i64 [ 0, %20 ], [ %140, %139 ]
  %26 = mul nuw nsw i64 %25, 280
  %27 = shl i64 %25, 32
  %28 = ashr exact i64 %27, 32
  br label %29

; <label>:29:                                     ; preds = %.loopexit, %24
  %30 = phi i64 [ 0, %24 ], [ %137, %.loopexit ]
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
  %47 = fmul float %124, %124
  %48 = fmul float %127, %130
  %49 = fdiv float %47, %48
  %50 = fcmp ogt float %49, %43
  %51 = trunc i64 %42 to i32
  %52 = select i1 %50, i32 %51, i32 %44
  %53 = select i1 %50, float %49, float %43
  %54 = add nuw nsw i64 %42, 1
  %55 = icmp slt i64 %42, %40
  br i1 %55, label %41, label %.loopexit.loopexit

; <label>:56:                                     ; preds = %56, %41
  %57 = phi i64 [ %131, %56 ], [ 0, %41 ]
  %58 = phi float [ %130, %56 ], [ 0.000000e+00, %41 ]
  %59 = phi float [ %127, %56 ], [ 0.000000e+00, %41 ]
  %60 = phi float [ %124, %56 ], [ 0.000000e+00, %41 ]
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
  %73 = fadd float %60, %72
  %74 = mul nuw nsw i32 %67, %67
  %75 = sitofp i32 %74 to float
  %76 = fadd float %59, %75
  %77 = mul nuw nsw i32 %70, %70
  %78 = sitofp i32 %77 to float
  %79 = fadd float %58, %78
  %80 = add nuw nsw i64 %63, 1
  %81 = getelementptr inbounds i8, i8* %5, i64 %80
  %82 = load i8, i8* %81, align 1, !tbaa !1
  %83 = zext i8 %82 to i32
  %84 = add nsw i64 %64, 1
  %85 = getelementptr inbounds i8, i8* %6, i64 %84
  %86 = load i8, i8* %85, align 1, !tbaa !1
  %87 = zext i8 %86 to i32
  %88 = mul nuw nsw i32 %87, %83
  %89 = sitofp i32 %88 to float
  %90 = fadd float %73, %89
  %91 = mul nuw nsw i32 %83, %83
  %92 = sitofp i32 %91 to float
  %93 = fadd float %76, %92
  %94 = mul nuw nsw i32 %87, %87
  %95 = sitofp i32 %94 to float
  %96 = fadd float %79, %95
  %97 = add nuw nsw i64 %63, 2
  %98 = getelementptr inbounds i8, i8* %5, i64 %97
  %99 = load i8, i8* %98, align 1, !tbaa !1
  %100 = zext i8 %99 to i32
  %101 = add nsw i64 %64, 2
  %102 = getelementptr inbounds i8, i8* %6, i64 %101
  %103 = load i8, i8* %102, align 1, !tbaa !1
  %104 = zext i8 %103 to i32
  %105 = mul nuw nsw i32 %104, %100
  %106 = sitofp i32 %105 to float
  %107 = fadd float %90, %106
  %108 = mul nuw nsw i32 %100, %100
  %109 = sitofp i32 %108 to float
  %110 = fadd float %93, %109
  %111 = mul nuw nsw i32 %104, %104
  %112 = sitofp i32 %111 to float
  %113 = fadd float %96, %112
  %114 = add nuw nsw i64 %63, 3
  %115 = getelementptr inbounds i8, i8* %5, i64 %114
  %116 = load i8, i8* %115, align 1, !tbaa !1
  %117 = zext i8 %116 to i32
  %118 = add nsw i64 %64, 3
  %119 = getelementptr inbounds i8, i8* %6, i64 %118
  %120 = load i8, i8* %119, align 1, !tbaa !1
  %121 = zext i8 %120 to i32
  %122 = mul nuw nsw i32 %121, %117
  %123 = sitofp i32 %122 to float
  %124 = fadd float %107, %123
  %125 = mul nuw nsw i32 %117, %117
  %126 = sitofp i32 %125 to float
  %127 = fadd float %110, %126
  %128 = mul nuw nsw i32 %121, %121
  %129 = sitofp i32 %128 to float
  %130 = fadd float %113, %129
  %131 = add nuw nsw i64 %57, 1
  %132 = icmp eq i64 %131, 4
  br i1 %132, label %46, label %56

.loopexit.loopexit:                               ; preds = %46
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %29
  %133 = phi i32 [ 0, %29 ], [ %52, %.loopexit.loopexit ]
  %134 = trunc i32 %133 to i8
  %135 = add nuw nsw i64 %30, %26
  %136 = getelementptr inbounds i8, i8* %7, i64 %135
  store i8 %134, i8* %136, align 1, !tbaa !1
  %137 = add nuw nsw i64 %30, 1
  %138 = icmp eq i64 %137, 276
  br i1 %138, label %139, label %29

; <label>:139:                                    ; preds = %.loopexit
  %140 = add nuw nsw i64 %25, 1
  %141 = icmp eq i64 %140, 219
  br i1 %141, label %142, label %24

; <label>:142:                                    ; preds = %139
  call void @_Z17Stereo_Vision_fixPhS_S_i(i8* %5, i8* %6, i8* %8, i32 60)
  %143 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6, i64 0, i64 0), i64 15)
  %144 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  %145 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  %146 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %144, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0), i32 280, i32 223, i32 255)
  %147 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %145, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0), i32 280, i32 223, i32 255)
  br label %160

; <label>:148:                                    ; preds = %151
  %149 = add nuw nsw i64 %18, 1
  %150 = icmp eq i64 %149, 223
  br i1 %150, label %20, label %17

; <label>:151:                                    ; preds = %151, %17
  %152 = phi i64 [ 0, %17 ], [ %158, %151 ]
  %153 = add nuw nsw i64 %152, %19
  %154 = getelementptr inbounds i8, i8* %5, i64 %153
  %155 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %154)
  %156 = getelementptr inbounds i8, i8* %6, i64 %153
  %157 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %156)
  %158 = add nuw nsw i64 %152, 1
  %159 = icmp eq i64 %158, 280
  br i1 %159, label %148, label %151

; <label>:160:                                    ; preds = %170, %142
  %161 = phi i64 [ 0, %142 ], [ %171, %170 ]
  %162 = mul nuw nsw i64 %161, 280
  br label %173

; <label>:163:                                    ; preds = %170
  %164 = bitcast i32* %4 to i8*
  %165 = bitcast i32* %3 to i8*
  %166 = bitcast i32* %2 to i8*
  %167 = bitcast [100 x i8]* %1 to i8*
  %168 = call i32 @fclose(%struct._IO_FILE* %144)
  %169 = call i32 @fclose(%struct._IO_FILE* %145)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %164) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %165) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %166) #1
  call void @llvm.lifetime.end(i64 100, i8* nonnull %167) #1
  ret i32 0

; <label>:170:                                    ; preds = %173
  %171 = add nuw nsw i64 %161, 1
  %172 = icmp eq i64 %171, 223
  br i1 %172, label %163, label %160

; <label>:173:                                    ; preds = %173, %160
  %174 = phi i64 [ 0, %160 ], [ %184, %173 ]
  %175 = add nuw nsw i64 %174, %162
  %176 = getelementptr inbounds i8, i8* %7, i64 %175
  %177 = load i8, i8* %176, align 1, !tbaa !1
  %178 = zext i8 %177 to i32
  %179 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %144, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0), i32 %178)
  %180 = getelementptr inbounds i8, i8* %8, i64 %175
  %181 = load i8, i8* %180, align 1, !tbaa !1
  %182 = zext i8 %181 to i32
  %183 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %145, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0), i32 %182)
  %184 = add nuw nsw i64 %174, 1
  %185 = icmp eq i64 %184, 280
  br i1 %185, label %170, label %173
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
