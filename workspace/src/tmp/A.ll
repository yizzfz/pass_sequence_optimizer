; ModuleID = 'Source.cpp'
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
  br i1 %7, label %8, label %98

; <label>:8:                                      ; preds = %5
  %9 = sub nsw i32 280, %4
  %10 = icmp sgt i32 %9, 0
  %11 = sext i32 %4 to i64
  %12 = sext i32 %3 to i64
  %13 = zext i32 %9 to i64
  %14 = zext i32 %4 to i64
  %15 = zext i32 %6 to i64
  %16 = icmp slt i32 %4, 1
  br label %17

; <label>:17:                                     ; preds = %94, %8
  %18 = phi i64 [ 0, %8 ], [ %95, %94 ]
  br i1 %10, label %19, label %94

; <label>:19:                                     ; preds = %17
  %20 = mul nuw nsw i64 %18, 280
  %21 = trunc i64 %18 to i32
  br label %22

; <label>:22:                                     ; preds = %86, %19
  %23 = phi i64 [ 0, %19 ], [ %91, %86 ]
  %24 = sub nsw i64 %23, %11
  %25 = icmp slt i64 %24, %12
  %26 = trunc i64 %24 to i32
  %27 = select i1 %25, i32 %26, i32 %3
  %28 = icmp slt i32 %27, 0
  %29 = or i1 %28, %16
  br i1 %29, label %86, label %30

; <label>:30:                                     ; preds = %22
  %31 = trunc i64 %23 to i32
  br label %32

; <label>:32:                                     ; preds = %30, %37
  %33 = phi float [ %43, %37 ], [ 0.000000e+00, %30 ]
  %34 = phi i32 [ %42, %37 ], [ 0, %30 ]
  %35 = phi i32 [ %44, %37 ], [ 0, %30 ]
  %36 = sub nsw i32 %31, %35
  br label %46

; <label>:37:                                     ; preds = %55
  %38 = fmul float %76, %76
  %39 = fmul float %79, %82
  %40 = fdiv float %38, %39
  %41 = fcmp ogt float %40, %33
  %42 = select i1 %41, i32 %35, i32 %34
  %43 = select i1 %41, float %40, float %33
  %44 = add nuw nsw i32 %35, 1
  %45 = icmp slt i32 %35, %27
  br i1 %45, label %32, label %85

; <label>:46:                                     ; preds = %55, %32
  %47 = phi float [ %82, %55 ], [ 0.000000e+00, %32 ]
  %48 = phi float [ %79, %55 ], [ 0.000000e+00, %32 ]
  %49 = phi float [ %76, %55 ], [ 0.000000e+00, %32 ]
  %50 = phi i32 [ %56, %55 ], [ 0, %32 ]
  %51 = add nuw nsw i32 %50, %21
  %52 = mul nsw i32 %51, 280
  %53 = add i32 %52, %31
  %54 = add i32 %36, %52
  br label %58

; <label>:55:                                     ; preds = %58
  %56 = add nuw nsw i32 %50, 1
  %57 = icmp eq i32 %56, %4
  br i1 %57, label %37, label %46

; <label>:58:                                     ; preds = %58, %46
  %59 = phi i64 [ %83, %58 ], [ 0, %46 ]
  %60 = phi float [ %82, %58 ], [ %47, %46 ]
  %61 = phi float [ %79, %58 ], [ %48, %46 ]
  %62 = phi float [ %76, %58 ], [ %49, %46 ]
  %63 = trunc i64 %59 to i32
  %64 = add i32 %53, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i8, i8* %0, i64 %65
  %67 = load i8, i8* %66, align 1, !tbaa !1
  %68 = zext i8 %67 to i32
  %69 = add i32 %54, %63
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8* %1, i64 %70
  %72 = load i8, i8* %71, align 1, !tbaa !1
  %73 = zext i8 %72 to i32
  %74 = mul nuw nsw i32 %73, %68
  %75 = sitofp i32 %74 to float
  %76 = fadd float %62, %75
  %77 = mul nuw nsw i32 %68, %68
  %78 = sitofp i32 %77 to float
  %79 = fadd float %61, %78
  %80 = mul nuw nsw i32 %73, %73
  %81 = sitofp i32 %80 to float
  %82 = fadd float %60, %81
  %83 = add nuw nsw i64 %59, 1
  %84 = icmp eq i64 %83, %14
  br i1 %84, label %55, label %58

; <label>:85:                                     ; preds = %37
  br label %86

; <label>:86:                                     ; preds = %85, %22
  %87 = phi i32 [ 0, %22 ], [ %42, %85 ]
  %88 = trunc i32 %87 to i8
  %89 = add nuw nsw i64 %23, %20
  %90 = getelementptr inbounds i8, i8* %2, i64 %89
  store i8 %88, i8* %90, align 1, !tbaa !1
  %91 = add nuw nsw i64 %23, 1
  %92 = icmp eq i64 %91, %13
  br i1 %92, label %93, label %22

; <label>:93:                                     ; preds = %86
  br label %94

; <label>:94:                                     ; preds = %93, %17
  %95 = add nuw nsw i64 %18, 1
  %96 = icmp eq i64 %95, %15
  br i1 %96, label %97, label %17

; <label>:97:                                     ; preds = %94
  br label %98

; <label>:98:                                     ; preds = %97, %5
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define void @_Z17Stereo_Vision_fixPhS_S_i(i8* nocapture readonly, i8* nocapture readonly, i8* nocapture, i32) local_unnamed_addr #2 {
  %5 = sext i32 %3 to i64
  br label %6

; <label>:6:                                      ; preds = %118, %4
  %7 = phi i64 [ 0, %4 ], [ %119, %118 ]
  %8 = mul nuw nsw i64 %7, 280
  br label %9

; <label>:9:                                      ; preds = %111, %6
  %10 = phi i64 [ 0, %6 ], [ %116, %111 ]
  %11 = add nsw i64 %10, -4
  %12 = icmp slt i64 %11, %5
  %13 = trunc i64 %11 to i32
  %14 = select i1 %12, i32 %13, i32 %3
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %111, label %16

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
  %31 = add nsw i64 %22, %29
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
  %109 = icmp slt i64 %19, %17
  br i1 %109, label %18, label %110

; <label>:110:                                    ; preds = %100
  br label %111

; <label>:111:                                    ; preds = %110, %9
  %112 = phi i32 [ 0, %9 ], [ %106, %110 ]
  %113 = trunc i32 %112 to i8
  %114 = add nuw nsw i64 %10, %8
  %115 = getelementptr inbounds i8, i8* %2, i64 %114
  store i8 %113, i8* %115, align 1, !tbaa !1
  %116 = add nuw nsw i64 %10, 1
  %117 = icmp eq i64 %116, 276
  br i1 %117, label %118, label %9

; <label>:118:                                    ; preds = %111
  %119 = add nuw nsw i64 %7, 1
  %120 = icmp eq i64 %119, 219
  br i1 %120, label %121, label %6

; <label>:121:                                    ; preds = %118
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define void @_Z4blurPhS_i(i8* nocapture readonly, i8* nocapture, i32) local_unnamed_addr #4 {
  %4 = mul nsw i32 %2, %2
  %5 = sitofp i32 %4 to float
  %6 = fdiv float 1.000000e+00, %5
  %7 = sub nsw i32 223, %2
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %90

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
  br label %22

; <label>:22:                                     ; preds = %92, %9
  %23 = phi i64 [ 0, %9 ], [ %93, %92 ]
  %24 = trunc i64 %23 to i32
  %25 = mul i64 %23, 1202590842880
  %26 = ashr exact i64 %25, 32
  %27 = getelementptr i8, i8* %1, i64 %26
  br i1 %11, label %28, label %92

; <label>:28:                                     ; preds = %22
  %29 = mul nuw nsw i64 %23, 280
  br i1 %12, label %30, label %31

; <label>:30:                                     ; preds = %28
  br label %32

; <label>:31:                                     ; preds = %28
  call void @llvm.memset.p0i8.i64(i8* %27, i8 0, i64 %15, i32 1, i1 false)
  br label %92

; <label>:32:                                     ; preds = %30, %35
  %33 = phi i64 [ %39, %35 ], [ 0, %30 ]
  %34 = trunc i64 %33 to i32
  br label %41

; <label>:35:                                     ; preds = %63
  %36 = fptoui float %64 to i8
  %37 = add nuw nsw i64 %33, %29
  %38 = getelementptr inbounds i8, i8* %1, i64 %37
  store i8 %36, i8* %38, align 1, !tbaa !1
  %39 = add nuw nsw i64 %33, 1
  %40 = icmp eq i64 %39, %17
  br i1 %40, label %91, label %32

; <label>:41:                                     ; preds = %63, %32
  %42 = phi i32 [ %65, %63 ], [ 0, %32 ]
  %43 = phi float [ %64, %63 ], [ 0.000000e+00, %32 ]
  %44 = add nuw nsw i32 %42, %24
  %45 = mul nsw i32 %44, 280
  %46 = add i32 %45, %34
  br i1 %20, label %56, label %47

; <label>:47:                                     ; preds = %41
  br label %48

; <label>:48:                                     ; preds = %47
  %49 = add i32 %45, %34
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8* %0, i64 %50
  %52 = load i8, i8* %51, align 1, !tbaa !1
  %53 = uitofp i8 %52 to float
  %54 = fmul float %6, %53
  %55 = fadd float %43, %54
  br label %56

; <label>:56:                                     ; preds = %41, %48
  %57 = phi float [ %55, %48 ], [ undef, %41 ]
  %58 = phi i64 [ 1, %48 ], [ 0, %41 ]
  %59 = phi float [ %55, %48 ], [ %43, %41 ]
  br label %60

; <label>:60:                                     ; preds = %56
  br i1 %21, label %63, label %61

; <label>:61:                                     ; preds = %60
  br label %67

; <label>:62:                                     ; preds = %67
  br label %63

; <label>:63:                                     ; preds = %60, %62
  %64 = phi float [ %57, %60 ], [ %86, %62 ]
  %65 = add nuw nsw i32 %42, 1
  %66 = icmp eq i32 %65, %2
  br i1 %66, label %35, label %41

; <label>:67:                                     ; preds = %67, %61
  %68 = phi i64 [ %58, %61 ], [ %87, %67 ]
  %69 = phi float [ %59, %61 ], [ %86, %67 ]
  %70 = trunc i64 %68 to i32
  %71 = add i32 %46, %70
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i8, i8* %0, i64 %72
  %74 = load i8, i8* %73, align 1, !tbaa !1
  %75 = uitofp i8 %74 to float
  %76 = fmul float %6, %75
  %77 = fadd float %69, %76
  %78 = add nuw nsw i64 %68, 1
  %79 = trunc i64 %78 to i32
  %80 = add i32 %46, %79
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i8, i8* %0, i64 %81
  %83 = load i8, i8* %82, align 1, !tbaa !1
  %84 = uitofp i8 %83 to float
  %85 = fmul float %6, %84
  %86 = fadd float %77, %85
  %87 = add nsw i64 %68, 2
  %88 = icmp eq i64 %87, %16
  br i1 %88, label %62, label %67

; <label>:89:                                     ; preds = %92
  br label %90

; <label>:90:                                     ; preds = %89, %3
  ret void

; <label>:91:                                     ; preds = %35
  br label %92

; <label>:92:                                     ; preds = %91, %31, %22
  %93 = add nuw nsw i64 %23, 1
  %94 = icmp eq i64 %93, %18
  br i1 %94, label %89, label %22
}

; Function Attrs: norecurse nounwind uwtable
define void @_Z8blur_fixPhS_(i8* nocapture readonly, i8* nocapture) local_unnamed_addr #4 {
  br label %3

; <label>:3:                                      ; preds = %155, %2
  %4 = phi i64 [ 0, %2 ], [ %15, %155 ]
  %5 = mul i64 %4, 280
  %6 = getelementptr i8, i8* %1, i64 %5
  %7 = add i64 %5, 277
  %8 = getelementptr i8, i8* %1, i64 %7
  %9 = getelementptr i8, i8* %0, i64 %5
  %10 = add i64 %5, 839
  %11 = getelementptr i8, i8* %0, i64 %10
  %12 = mul nuw nsw i64 %4, 280
  %13 = mul i64 %4, 280
  %14 = add i64 %13, 560
  %15 = add nuw nsw i64 %4, 1
  %16 = mul nuw nsw i64 %15, 280
  %17 = icmp ult i8* %6, %11
  %18 = icmp ult i8* %9, %8
  %19 = and i1 %17, %18
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %3
  br label %24

; <label>:21:                                     ; preds = %24
  br label %22

; <label>:22:                                     ; preds = %21, %3
  %23 = phi i64 [ 0, %3 ], [ 272, %21 ]
  br label %95

; <label>:24:                                     ; preds = %20, %24
  %25 = phi i64 [ %92, %24 ], [ 0, %20 ]
  %26 = add nuw nsw i64 %12, %25
  %27 = getelementptr inbounds i8, i8* %0, i64 %26
  %28 = bitcast i8* %27 to <16 x i8>*
  %29 = load <16 x i8>, <16 x i8>* %28, align 1, !tbaa !1, !alias.scope !4
  %30 = uitofp <16 x i8> %29 to <16 x float>
  %31 = fmul <16 x float> %30, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %32 = fadd <16 x float> %31, zeroinitializer
  %33 = or i64 %26, 1
  %34 = getelementptr inbounds i8, i8* %0, i64 %33
  %35 = bitcast i8* %34 to <16 x i8>*
  %36 = load <16 x i8>, <16 x i8>* %35, align 1, !tbaa !1, !alias.scope !4
  %37 = uitofp <16 x i8> %36 to <16 x float>
  %38 = fmul <16 x float> %37, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %39 = fadd <16 x float> %32, %38
  %40 = or i64 %26, 2
  %41 = getelementptr inbounds i8, i8* %0, i64 %40
  %42 = bitcast i8* %41 to <16 x i8>*
  %43 = load <16 x i8>, <16 x i8>* %42, align 1, !tbaa !1, !alias.scope !4
  %44 = uitofp <16 x i8> %43 to <16 x float>
  %45 = fmul <16 x float> %44, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %46 = fadd <16 x float> %39, %45
  %47 = add nuw nsw i64 %16, %25
  %48 = getelementptr inbounds i8, i8* %0, i64 %47
  %49 = bitcast i8* %48 to <16 x i8>*
  %50 = load <16 x i8>, <16 x i8>* %49, align 1, !tbaa !1, !alias.scope !4
  %51 = uitofp <16 x i8> %50 to <16 x float>
  %52 = fmul <16 x float> %51, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %53 = fadd <16 x float> %46, %52
  %54 = or i64 %47, 1
  %55 = getelementptr inbounds i8, i8* %0, i64 %54
  %56 = bitcast i8* %55 to <16 x i8>*
  %57 = load <16 x i8>, <16 x i8>* %56, align 1, !tbaa !1, !alias.scope !4
  %58 = uitofp <16 x i8> %57 to <16 x float>
  %59 = fmul <16 x float> %58, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %60 = fadd <16 x float> %53, %59
  %61 = or i64 %47, 2
  %62 = getelementptr inbounds i8, i8* %0, i64 %61
  %63 = bitcast i8* %62 to <16 x i8>*
  %64 = load <16 x i8>, <16 x i8>* %63, align 1, !tbaa !1, !alias.scope !4
  %65 = uitofp <16 x i8> %64 to <16 x float>
  %66 = fmul <16 x float> %65, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %67 = fadd <16 x float> %60, %66
  %68 = add nuw nsw i64 %14, %25
  %69 = getelementptr inbounds i8, i8* %0, i64 %68
  %70 = bitcast i8* %69 to <16 x i8>*
  %71 = load <16 x i8>, <16 x i8>* %70, align 1, !tbaa !1, !alias.scope !4
  %72 = uitofp <16 x i8> %71 to <16 x float>
  %73 = fmul <16 x float> %72, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %74 = fadd <16 x float> %67, %73
  %75 = or i64 %68, 1
  %76 = getelementptr inbounds i8, i8* %0, i64 %75
  %77 = bitcast i8* %76 to <16 x i8>*
  %78 = load <16 x i8>, <16 x i8>* %77, align 1, !tbaa !1, !alias.scope !4
  %79 = uitofp <16 x i8> %78 to <16 x float>
  %80 = fmul <16 x float> %79, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %81 = fadd <16 x float> %74, %80
  %82 = or i64 %68, 2
  %83 = getelementptr inbounds i8, i8* %0, i64 %82
  %84 = bitcast i8* %83 to <16 x i8>*
  %85 = load <16 x i8>, <16 x i8>* %84, align 1, !tbaa !1, !alias.scope !4
  %86 = uitofp <16 x i8> %85 to <16 x float>
  %87 = fmul <16 x float> %86, <float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000, float 0x3FBC71C720000000>
  %88 = fadd <16 x float> %81, %87
  %89 = fptoui <16 x float> %88 to <16 x i8>
  %90 = getelementptr inbounds i8, i8* %1, i64 %26
  %91 = bitcast i8* %90 to <16 x i8>*
  store <16 x i8> %89, <16 x i8>* %91, align 1, !tbaa !1, !alias.scope !7, !noalias !4
  %92 = add i64 %25, 16
  %93 = icmp eq i64 %92, 272
  br i1 %93, label %21, label %24, !llvm.loop !9

; <label>:94:                                     ; preds = %155
  ret void

; <label>:95:                                     ; preds = %22, %95
  %96 = phi i64 [ %153, %95 ], [ %23, %22 ]
  %97 = add nuw nsw i64 %12, %96
  %98 = getelementptr inbounds i8, i8* %0, i64 %97
  %99 = load i8, i8* %98, align 1, !tbaa !1
  %100 = uitofp i8 %99 to float
  %101 = fmul float %100, 0x3FBC71C720000000
  %102 = fadd float %101, 0.000000e+00
  %103 = add nuw nsw i64 %97, 1
  %104 = getelementptr inbounds i8, i8* %0, i64 %103
  %105 = load i8, i8* %104, align 1, !tbaa !1
  %106 = uitofp i8 %105 to float
  %107 = fmul float %106, 0x3FBC71C720000000
  %108 = fadd float %102, %107
  %109 = add nuw nsw i64 %97, 2
  %110 = getelementptr inbounds i8, i8* %0, i64 %109
  %111 = load i8, i8* %110, align 1, !tbaa !1
  %112 = uitofp i8 %111 to float
  %113 = fmul float %112, 0x3FBC71C720000000
  %114 = fadd float %108, %113
  %115 = add nuw nsw i64 %16, %96
  %116 = getelementptr inbounds i8, i8* %0, i64 %115
  %117 = load i8, i8* %116, align 1, !tbaa !1
  %118 = uitofp i8 %117 to float
  %119 = fmul float %118, 0x3FBC71C720000000
  %120 = fadd float %114, %119
  %121 = add nuw nsw i64 %115, 1
  %122 = getelementptr inbounds i8, i8* %0, i64 %121
  %123 = load i8, i8* %122, align 1, !tbaa !1
  %124 = uitofp i8 %123 to float
  %125 = fmul float %124, 0x3FBC71C720000000
  %126 = fadd float %120, %125
  %127 = add nuw nsw i64 %115, 2
  %128 = getelementptr inbounds i8, i8* %0, i64 %127
  %129 = load i8, i8* %128, align 1, !tbaa !1
  %130 = uitofp i8 %129 to float
  %131 = fmul float %130, 0x3FBC71C720000000
  %132 = fadd float %126, %131
  %133 = add nuw nsw i64 %14, %96
  %134 = getelementptr inbounds i8, i8* %0, i64 %133
  %135 = load i8, i8* %134, align 1, !tbaa !1
  %136 = uitofp i8 %135 to float
  %137 = fmul float %136, 0x3FBC71C720000000
  %138 = fadd float %132, %137
  %139 = add nuw nsw i64 %133, 1
  %140 = getelementptr inbounds i8, i8* %0, i64 %139
  %141 = load i8, i8* %140, align 1, !tbaa !1
  %142 = uitofp i8 %141 to float
  %143 = fmul float %142, 0x3FBC71C720000000
  %144 = fadd float %138, %143
  %145 = add nuw nsw i64 %133, 2
  %146 = getelementptr inbounds i8, i8* %0, i64 %145
  %147 = load i8, i8* %146, align 1, !tbaa !1
  %148 = uitofp i8 %147 to float
  %149 = fmul float %148, 0x3FBC71C720000000
  %150 = fadd float %144, %149
  %151 = fptoui float %150 to i8
  %152 = getelementptr inbounds i8, i8* %1, i64 %97
  store i8 %151, i8* %152, align 1, !tbaa !1
  %153 = add nuw nsw i64 %96, 1
  %154 = icmp eq i64 %153, 277
  br i1 %154, label %155, label %95, !llvm.loop !12

; <label>:155:                                    ; preds = %95
  %156 = icmp eq i64 %15, 220
  br i1 %156, label %94, label %3
}

; Function Attrs: nounwind uwtable
define void @_Z4testPhS_(i8* nocapture readonly, i8* nocapture) local_unnamed_addr #2 {
  br label %4

; <label>:3:                                      ; preds = %135
  br label %4

; <label>:4:                                      ; preds = %3, %2
  br label %5

; <label>:5:                                      ; preds = %135, %4
  %6 = phi i64 [ 0, %4 ], [ %136, %135 ]
  %7 = mul i64 %6, 280
  %8 = getelementptr i8, i8* %1, i64 %7
  %9 = add i64 %7, 277
  %10 = getelementptr i8, i8* %1, i64 %9
  %11 = add i64 %7, -1
  %12 = getelementptr i8, i8* %0, i64 %11
  %13 = add i64 %7, 276
  %14 = getelementptr i8, i8* %0, i64 %13
  %15 = mul nuw nsw i64 %6, 280
  %16 = icmp ult i8* %8, %14
  %17 = icmp ult i8* %12, %10
  %18 = and i1 %16, %17
  br i1 %18, label %20, label %19

; <label>:19:                                     ; preds = %5
  br label %38

; <label>:20:                                     ; preds = %38, %5
  %21 = phi i64 [ 0, %5 ], [ 256, %38 ]
  br i1 true, label %22, label %35

; <label>:22:                                     ; preds = %20
  br label %23

; <label>:23:                                     ; preds = %23, %22
  %24 = phi i64 [ %31, %23 ], [ %21, %22 ]
  %25 = phi i64 [ %32, %23 ], [ 1, %22 ]
  %26 = add nuw nsw i64 %24, %15
  %27 = add nsw i64 %26, -1
  %28 = getelementptr inbounds i8, i8* %0, i64 %27
  %29 = load i8, i8* %28, align 1, !tbaa !1
  %30 = getelementptr inbounds i8, i8* %1, i64 %26
  store i8 %29, i8* %30, align 1, !tbaa !1
  %31 = add nuw nsw i64 %24, 1
  %32 = add i64 %25, -1
  %33 = icmp eq i64 %32, 0
  br i1 %33, label %34, label %23, !llvm.loop !13

; <label>:34:                                     ; preds = %23
  br label %35

; <label>:35:                                     ; preds = %34, %20
  %36 = phi i64 [ %21, %20 ], [ %31, %34 ]
  br i1 false, label %135, label %37

; <label>:37:                                     ; preds = %35
  br label %138

; <label>:38:                                     ; preds = %19
  %39 = add nsw i64 %15, -1
  %40 = getelementptr inbounds i8, i8* %0, i64 %39
  %41 = bitcast i8* %40 to <16 x i8>*
  %42 = load <16 x i8>, <16 x i8>* %41, align 1, !tbaa !1, !alias.scope !15
  %43 = getelementptr i8, i8* %40, i64 16
  %44 = bitcast i8* %43 to <16 x i8>*
  %45 = load <16 x i8>, <16 x i8>* %44, align 1, !tbaa !1, !alias.scope !15
  %46 = getelementptr inbounds i8, i8* %1, i64 %15
  %47 = bitcast i8* %46 to <16 x i8>*
  store <16 x i8> %42, <16 x i8>* %47, align 1, !tbaa !1, !alias.scope !18, !noalias !15
  %48 = getelementptr i8, i8* %46, i64 16
  %49 = bitcast i8* %48 to <16 x i8>*
  store <16 x i8> %45, <16 x i8>* %49, align 1, !tbaa !1, !alias.scope !18, !noalias !15
  %50 = add nuw nsw i64 %15, 32
  %51 = add nsw i64 %15, 31
  %52 = getelementptr inbounds i8, i8* %0, i64 %51
  %53 = bitcast i8* %52 to <16 x i8>*
  %54 = load <16 x i8>, <16 x i8>* %53, align 1, !tbaa !1, !alias.scope !15
  %55 = getelementptr i8, i8* %52, i64 16
  %56 = bitcast i8* %55 to <16 x i8>*
  %57 = load <16 x i8>, <16 x i8>* %56, align 1, !tbaa !1, !alias.scope !15
  %58 = getelementptr inbounds i8, i8* %1, i64 %50
  %59 = bitcast i8* %58 to <16 x i8>*
  store <16 x i8> %54, <16 x i8>* %59, align 1, !tbaa !1, !alias.scope !18, !noalias !15
  %60 = getelementptr i8, i8* %58, i64 16
  %61 = bitcast i8* %60 to <16 x i8>*
  store <16 x i8> %57, <16 x i8>* %61, align 1, !tbaa !1, !alias.scope !18, !noalias !15
  %62 = add nuw nsw i64 %15, 64
  %63 = add nsw i64 %15, 63
  %64 = getelementptr inbounds i8, i8* %0, i64 %63
  %65 = bitcast i8* %64 to <16 x i8>*
  %66 = load <16 x i8>, <16 x i8>* %65, align 1, !tbaa !1, !alias.scope !15
  %67 = getelementptr i8, i8* %64, i64 16
  %68 = bitcast i8* %67 to <16 x i8>*
  %69 = load <16 x i8>, <16 x i8>* %68, align 1, !tbaa !1, !alias.scope !15
  %70 = getelementptr inbounds i8, i8* %1, i64 %62
  %71 = bitcast i8* %70 to <16 x i8>*
  store <16 x i8> %66, <16 x i8>* %71, align 1, !tbaa !1, !alias.scope !18, !noalias !15
  %72 = getelementptr i8, i8* %70, i64 16
  %73 = bitcast i8* %72 to <16 x i8>*
  store <16 x i8> %69, <16 x i8>* %73, align 1, !tbaa !1, !alias.scope !18, !noalias !15
  %74 = add nuw nsw i64 %15, 96
  %75 = add nsw i64 %15, 95
  %76 = getelementptr inbounds i8, i8* %0, i64 %75
  %77 = bitcast i8* %76 to <16 x i8>*
  %78 = load <16 x i8>, <16 x i8>* %77, align 1, !tbaa !1, !alias.scope !15
  %79 = getelementptr i8, i8* %76, i64 16
  %80 = bitcast i8* %79 to <16 x i8>*
  %81 = load <16 x i8>, <16 x i8>* %80, align 1, !tbaa !1, !alias.scope !15
  %82 = getelementptr inbounds i8, i8* %1, i64 %74
  %83 = bitcast i8* %82 to <16 x i8>*
  store <16 x i8> %78, <16 x i8>* %83, align 1, !tbaa !1, !alias.scope !18, !noalias !15
  %84 = getelementptr i8, i8* %82, i64 16
  %85 = bitcast i8* %84 to <16 x i8>*
  store <16 x i8> %81, <16 x i8>* %85, align 1, !tbaa !1, !alias.scope !18, !noalias !15
  %86 = add nuw nsw i64 %15, 128
  %87 = add nsw i64 %15, 127
  %88 = getelementptr inbounds i8, i8* %0, i64 %87
  %89 = bitcast i8* %88 to <16 x i8>*
  %90 = load <16 x i8>, <16 x i8>* %89, align 1, !tbaa !1, !alias.scope !15
  %91 = getelementptr i8, i8* %88, i64 16
  %92 = bitcast i8* %91 to <16 x i8>*
  %93 = load <16 x i8>, <16 x i8>* %92, align 1, !tbaa !1, !alias.scope !15
  %94 = getelementptr inbounds i8, i8* %1, i64 %86
  %95 = bitcast i8* %94 to <16 x i8>*
  store <16 x i8> %90, <16 x i8>* %95, align 1, !tbaa !1, !alias.scope !18, !noalias !15
  %96 = getelementptr i8, i8* %94, i64 16
  %97 = bitcast i8* %96 to <16 x i8>*
  store <16 x i8> %93, <16 x i8>* %97, align 1, !tbaa !1, !alias.scope !18, !noalias !15
  %98 = add nuw nsw i64 %15, 160
  %99 = add nsw i64 %15, 159
  %100 = getelementptr inbounds i8, i8* %0, i64 %99
  %101 = bitcast i8* %100 to <16 x i8>*
  %102 = load <16 x i8>, <16 x i8>* %101, align 1, !tbaa !1, !alias.scope !15
  %103 = getelementptr i8, i8* %100, i64 16
  %104 = bitcast i8* %103 to <16 x i8>*
  %105 = load <16 x i8>, <16 x i8>* %104, align 1, !tbaa !1, !alias.scope !15
  %106 = getelementptr inbounds i8, i8* %1, i64 %98
  %107 = bitcast i8* %106 to <16 x i8>*
  store <16 x i8> %102, <16 x i8>* %107, align 1, !tbaa !1, !alias.scope !18, !noalias !15
  %108 = getelementptr i8, i8* %106, i64 16
  %109 = bitcast i8* %108 to <16 x i8>*
  store <16 x i8> %105, <16 x i8>* %109, align 1, !tbaa !1, !alias.scope !18, !noalias !15
  %110 = add nuw nsw i64 %15, 192
  %111 = add nsw i64 %15, 191
  %112 = getelementptr inbounds i8, i8* %0, i64 %111
  %113 = bitcast i8* %112 to <16 x i8>*
  %114 = load <16 x i8>, <16 x i8>* %113, align 1, !tbaa !1, !alias.scope !15
  %115 = getelementptr i8, i8* %112, i64 16
  %116 = bitcast i8* %115 to <16 x i8>*
  %117 = load <16 x i8>, <16 x i8>* %116, align 1, !tbaa !1, !alias.scope !15
  %118 = getelementptr inbounds i8, i8* %1, i64 %110
  %119 = bitcast i8* %118 to <16 x i8>*
  store <16 x i8> %114, <16 x i8>* %119, align 1, !tbaa !1, !alias.scope !18, !noalias !15
  %120 = getelementptr i8, i8* %118, i64 16
  %121 = bitcast i8* %120 to <16 x i8>*
  store <16 x i8> %117, <16 x i8>* %121, align 1, !tbaa !1, !alias.scope !18, !noalias !15
  %122 = add nuw nsw i64 %15, 224
  %123 = add nsw i64 %15, 223
  %124 = getelementptr inbounds i8, i8* %0, i64 %123
  %125 = bitcast i8* %124 to <16 x i8>*
  %126 = load <16 x i8>, <16 x i8>* %125, align 1, !tbaa !1, !alias.scope !15
  %127 = getelementptr i8, i8* %124, i64 16
  %128 = bitcast i8* %127 to <16 x i8>*
  %129 = load <16 x i8>, <16 x i8>* %128, align 1, !tbaa !1, !alias.scope !15
  %130 = getelementptr inbounds i8, i8* %1, i64 %122
  %131 = bitcast i8* %130 to <16 x i8>*
  store <16 x i8> %126, <16 x i8>* %131, align 1, !tbaa !1, !alias.scope !18, !noalias !15
  %132 = getelementptr i8, i8* %130, i64 16
  %133 = bitcast i8* %132 to <16 x i8>*
  store <16 x i8> %129, <16 x i8>* %133, align 1, !tbaa !1, !alias.scope !18, !noalias !15
  br label %20

; <label>:134:                                    ; preds = %138
  br label %135

; <label>:135:                                    ; preds = %35, %134
  %136 = add nuw nsw i64 %6, 1
  %137 = icmp eq i64 %136, 220
  br i1 %137, label %3, label %5

; <label>:138:                                    ; preds = %138, %37
  %139 = phi i64 [ %36, %37 ], [ %163, %138 ]
  %140 = add nuw nsw i64 %139, %15
  %141 = add nsw i64 %140, -1
  %142 = getelementptr inbounds i8, i8* %0, i64 %141
  %143 = load i8, i8* %142, align 1, !tbaa !1
  %144 = getelementptr inbounds i8, i8* %1, i64 %140
  store i8 %143, i8* %144, align 1, !tbaa !1
  %145 = add nuw nsw i64 %139, 1
  %146 = add nuw nsw i64 %145, %15
  %147 = add i64 %139, %15
  %148 = getelementptr inbounds i8, i8* %0, i64 %147
  %149 = load i8, i8* %148, align 1, !tbaa !1
  %150 = getelementptr inbounds i8, i8* %1, i64 %146
  store i8 %149, i8* %150, align 1, !tbaa !1
  %151 = add nsw i64 %139, 2
  %152 = add nuw nsw i64 %151, %15
  %153 = add nsw i64 %152, -1
  %154 = getelementptr inbounds i8, i8* %0, i64 %153
  %155 = load i8, i8* %154, align 1, !tbaa !1
  %156 = getelementptr inbounds i8, i8* %1, i64 %152
  store i8 %155, i8* %156, align 1, !tbaa !1
  %157 = add nsw i64 %139, 3
  %158 = add nuw nsw i64 %157, %15
  %159 = add nsw i64 %158, -1
  %160 = getelementptr inbounds i8, i8* %0, i64 %159
  %161 = load i8, i8* %160, align 1, !tbaa !1
  %162 = getelementptr inbounds i8, i8* %1, i64 %158
  store i8 %161, i8* %162, align 1, !tbaa !1
  %163 = add nsw i64 %139, 4
  %164 = icmp eq i64 %163, 277
  br i1 %164, label %134, label %138, !llvm.loop !20
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
  br label %17

; <label>:17:                                     ; preds = %150, %0
  %18 = phi i64 [ 0, %0 ], [ %151, %150 ]
  %19 = mul nuw nsw i64 %18, 280
  br label %153

; <label>:20:                                     ; preds = %150
  %21 = call i32 @fclose(%struct._IO_FILE* %13)
  %22 = call i32 @fclose(%struct._IO_FILE* %14)
  %23 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i64 0, i64 0), i64 18)
  br label %24

; <label>:24:                                     ; preds = %141, %20
  %25 = phi i64 [ 0, %20 ], [ %142, %141 ]
  %26 = mul nuw nsw i64 %25, 280
  %27 = shl i64 %25, 32
  %28 = ashr exact i64 %27, 32
  br label %29

; <label>:29:                                     ; preds = %134, %24
  %30 = phi i64 [ 0, %24 ], [ %139, %134 ]
  %31 = add nsw i64 %30, -4
  %32 = icmp slt i64 %31, 60
  %33 = select i1 %32, i64 %31, i64 60
  %34 = trunc i64 %33 to i32
  %35 = icmp slt i32 %34, 0
  br i1 %35, label %134, label %36

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
  br i1 %55, label %41, label %133

; <label>:56:                                     ; preds = %56, %41
  %57 = phi i64 [ %131, %56 ], [ 0, %41 ]
  %58 = phi float [ %130, %56 ], [ 0.000000e+00, %41 ]
  %59 = phi float [ %127, %56 ], [ 0.000000e+00, %41 ]
  %60 = phi float [ %124, %56 ], [ 0.000000e+00, %41 ]
  %61 = add nuw nsw i64 %57, %28
  %62 = mul nuw nsw i64 %61, 280
  %63 = add nuw nsw i64 %62, %38
  %64 = add nsw i64 %45, %62
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

; <label>:133:                                    ; preds = %46
  br label %134

; <label>:134:                                    ; preds = %133, %29
  %135 = phi i32 [ 0, %29 ], [ %52, %133 ]
  %136 = trunc i32 %135 to i8
  %137 = add nuw nsw i64 %30, %26
  %138 = getelementptr inbounds i8, i8* %7, i64 %137
  store i8 %136, i8* %138, align 1, !tbaa !1
  %139 = add nuw nsw i64 %30, 1
  %140 = icmp eq i64 %139, 276
  br i1 %140, label %141, label %29

; <label>:141:                                    ; preds = %134
  %142 = add nuw nsw i64 %25, 1
  %143 = icmp eq i64 %142, 219
  br i1 %143, label %144, label %24

; <label>:144:                                    ; preds = %141
  call void @_Z17Stereo_Vision_fixPhS_S_i(i8* %5, i8* %6, i8* %8, i32 60)
  %145 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6, i64 0, i64 0), i64 15)
  %146 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  %147 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  %148 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %146, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0), i32 280, i32 223, i32 255)
  %149 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %147, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i64 0, i64 0), i32 280, i32 223, i32 255)
  br label %162

; <label>:150:                                    ; preds = %153
  %151 = add nuw nsw i64 %18, 1
  %152 = icmp eq i64 %151, 223
  br i1 %152, label %20, label %17

; <label>:153:                                    ; preds = %153, %17
  %154 = phi i64 [ 0, %17 ], [ %160, %153 ]
  %155 = add nuw nsw i64 %154, %19
  %156 = getelementptr inbounds i8, i8* %5, i64 %155
  %157 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %156)
  %158 = getelementptr inbounds i8, i8* %6, i64 %155
  %159 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* %158)
  %160 = add nuw nsw i64 %154, 1
  %161 = icmp eq i64 %160, 280
  br i1 %161, label %150, label %153

; <label>:162:                                    ; preds = %168, %144
  %163 = phi i64 [ 0, %144 ], [ %169, %168 ]
  %164 = mul nuw nsw i64 %163, 280
  br label %171

; <label>:165:                                    ; preds = %168
  %166 = call i32 @fclose(%struct._IO_FILE* %146)
  %167 = call i32 @fclose(%struct._IO_FILE* %147)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %12) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %11) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %10) #1
  call void @llvm.lifetime.end(i64 100, i8* nonnull %9) #1
  ret i32 0

; <label>:168:                                    ; preds = %171
  %169 = add nuw nsw i64 %163, 1
  %170 = icmp eq i64 %169, 223
  br i1 %170, label %165, label %162

; <label>:171:                                    ; preds = %171, %162
  %172 = phi i64 [ 0, %162 ], [ %182, %171 ]
  %173 = add nuw nsw i64 %172, %164
  %174 = getelementptr inbounds i8, i8* %7, i64 %173
  %175 = load i8, i8* %174, align 1, !tbaa !1
  %176 = zext i8 %175 to i32
  %177 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %146, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0), i32 %176)
  %178 = getelementptr inbounds i8, i8* %8, i64 %173
  %179 = load i8, i8* %178, align 1, !tbaa !1
  %180 = zext i8 %179 to i32
  %181 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %147, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0), i32 %180)
  %182 = add nuw nsw i64 %172, 1
  %183 = icmp eq i64 %182, 280
  br i1 %183, label %168, label %171
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
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !10, !11}
