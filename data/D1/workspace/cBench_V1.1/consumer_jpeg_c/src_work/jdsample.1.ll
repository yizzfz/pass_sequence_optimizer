; ModuleID = 'jdsample.ll'
source_filename = "jdsample.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_decompress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_source_mgr*, i32, i32, i32, i32, i32, i32, i32, double, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8**, i32, i32, i32, i32, i32, [64 x i32]*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], i32, %struct.jpeg_component_info*, i32, i32, [16 x i8], [16 x i8], [16 x i8], i32, i32, i8, i16, i16, i32, i8, i32, i32, i32, i32, i32, i8*, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, i32, %struct.jpeg_decomp_master*, %struct.jpeg_d_main_controller*, %struct.jpeg_d_coef_controller*, %struct.jpeg_d_post_controller*, %struct.jpeg_input_controller*, %struct.jpeg_marker_reader*, %struct.jpeg_entropy_decoder*, %struct.jpeg_inverse_dct*, %struct.jpeg_upsampler*, %struct.jpeg_color_deconverter*, %struct.jpeg_color_quantizer* }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.jpeg_source_mgr = type { i8*, i64, {}*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, {}* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.jpeg_decomp_master = type { {}*, {}*, i32 }
%struct.jpeg_d_main_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* }
%struct.jpeg_d_coef_controller = type { {}*, i32 (%struct.jpeg_decompress_struct*)*, {}*, i32 (%struct.jpeg_decompress_struct*, i8***)*, %struct.jvirt_barray_control** }
%struct.jpeg_d_post_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* }
%struct.jpeg_input_controller = type { i32 (%struct.jpeg_decompress_struct*)*, {}*, {}*, {}*, i32, i32 }
%struct.jpeg_marker_reader = type { {}*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, [16 x i32 (%struct.jpeg_decompress_struct*)*], i32, i32, i32, i32 }
%struct.jpeg_entropy_decoder = type { {}*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* }
%struct.jpeg_inverse_dct = type { {}*, [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*] }
%struct.jpeg_upsampler = type { {}*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, i32 }
%struct.jpeg_color_deconverter = type { {}*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* }
%struct.jpeg_color_quantizer = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, {}*, {}* }
%struct.my_upsampler = type { %struct.jpeg_upsampler, [10 x i8**], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*], i32, i32, [10 x i32], [10 x i8], [10 x i8] }

; Function Attrs: noinline nounwind uwtable
define void @jinit_upsampler(%struct.jpeg_decompress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 256) #4
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %9 = bitcast %struct.jpeg_upsampler** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_pass_upsample, void (%struct.jpeg_decompress_struct*)** %10, align 8
  %11 = getelementptr inbounds i8, i8* %7, i64 8
  %12 = bitcast i8* %11 to void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @sep_upsample, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %12, align 8
  %13 = getelementptr inbounds i8, i8* %7, i64 16
  %14 = bitcast i8* %13 to i32*
  store i32 0, i32* %14, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 56
  %16 = load i32, i32* %15, align 8
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %26, label %18

; <label>:18:                                     ; preds = %1
  %19 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i64 0, i32 5
  store i32 23, i32* %22, align 8
  %23 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %24 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %23, align 8
  %25 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %24, align 8
  tail call void %25(%struct.jpeg_common_struct* %19) #4
  br label %26

; <label>:26:                                     ; preds = %1, %18
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 17
  %28 = load i32, i32* %27, align 4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %34, label %30

; <label>:30:                                     ; preds = %26
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %32 = load i32, i32* %31, align 4
  %33 = icmp sgt i32 %32, 1
  br label %34

; <label>:34:                                     ; preds = %26, %30
  %35 = phi i1 [ %33, %30 ], [ false, %26 ]
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %37 = load i32, i32* %36, align 8
  %38 = icmp sgt i32 %37, 0
  br i1 %38, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %34
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %40 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %39, align 8
  %41 = ptrtoint i8* %7 to i64
  %sunkaddr93 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr94 = add i64 %sunkaddr93, 396
  %sunkaddr95 = inttoptr i64 %sunkaddr94 to i32*
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr96 = add i64 %sunkaddr, 388
  %sunkaddr97 = inttoptr i64 %sunkaddr96 to i32*
  %sunkaddr98 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr99 = add i64 %sunkaddr98, 392
  %sunkaddr100 = inttoptr i64 %sunkaddr99 to i32*
  %42 = ptrtoint i8* %7 to i64
  %sunkaddr116 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr117 = add i64 %sunkaddr116, 48
  %sunkaddr118 = inttoptr i64 %sunkaddr117 to i32*
  %43 = ptrtoint i8* %7 to i64
  %44 = ptrtoint i8* %7 to i64
  %45 = ptrtoint i8* %7 to i64
  %46 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr104 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr105 = add i64 %sunkaddr104, 8
  %sunkaddr106 = inttoptr i64 %sunkaddr105 to %struct.jpeg_memory_mgr**
  %sunkaddr107 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr108 = add i64 %sunkaddr107, 128
  %sunkaddr109 = inttoptr i64 %sunkaddr108 to i32*
  %sunkaddr110 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr111 = add i64 %sunkaddr110, 388
  %sunkaddr112 = inttoptr i64 %sunkaddr111 to i32*
  %sunkaddr113 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr114 = add i64 %sunkaddr113, 392
  %sunkaddr115 = inttoptr i64 %sunkaddr114 to i32*
  %47 = ptrtoint i8* %7 to i64
  %sunkaddr101 = ptrtoint i8* %7 to i64
  %sunkaddr102 = add i64 %sunkaddr101, 16
  %sunkaddr103 = inttoptr i64 %sunkaddr102 to i32*
  %48 = ptrtoint i8* %7 to i64
  %49 = ptrtoint i8* %7 to i64
  %50 = ptrtoint i8* %7 to i64
  %51 = ptrtoint i8* %7 to i64
  %52 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %54 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  br label %55

; <label>:55:                                     ; preds = %126, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %126 ]
  %.019 = phi %struct.jpeg_component_info* [ %40, %.lr.ph ], [ %127, %126 ]
  %56 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.019, i64 0, i32 2
  %57 = load i32, i32* %56, align 8
  %58 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.019, i64 0, i32 9
  %59 = load i32, i32* %58, align 4
  %60 = mul nsw i32 %59, %57
  %61 = load i32, i32* %sunkaddr95, align 4
  %62 = sdiv i32 %60, %61
  %63 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.019, i64 0, i32 3
  %64 = load i32, i32* %63, align 4
  %65 = mul nsw i32 %64, %59
  %66 = sdiv i32 %65, %61
  %67 = load i32, i32* %sunkaddr97, align 4
  %68 = load i32, i32* %sunkaddr100, align 8
  %sunkaddr19 = shl i64 %indvars.iv, 2
  %sunkaddr20 = add i64 %41, %sunkaddr19
  %sunkaddr21 = add i64 %sunkaddr20, 192
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i32*
  store i32 %66, i32* %sunkaddr22, align 4
  %69 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.019, i64 0, i32 12
  %70 = load i32, i32* %69, align 8
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %73

; <label>:72:                                     ; preds = %55
  %sunkaddr24 = shl i64 %indvars.iv, 3
  %sunkaddr25 = add i64 %42, %sunkaddr24
  %sunkaddr26 = add i64 %sunkaddr25, 104
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)**
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @noop_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %sunkaddr27, align 8
  br label %126

; <label>:73:                                     ; preds = %55
  %74 = icmp eq i32 %62, %67
  %75 = icmp eq i32 %66, %68
  %or.cond = and i1 %74, %75
  br i1 %or.cond, label %76, label %77

; <label>:76:                                     ; preds = %73
  %sunkaddr29 = shl i64 %indvars.iv, 3
  %sunkaddr30 = add i64 %43, %sunkaddr29
  %sunkaddr31 = add i64 %sunkaddr30, 104
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)**
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @fullsize_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %sunkaddr32, align 8
  br label %126

; <label>:77:                                     ; preds = %73
  %78 = icmp eq i32 %66, %68
  %79 = shl nsw i32 %62, 1
  %80 = icmp eq i32 %79, %67
  %or.cond3 = and i1 %80, %78
  br i1 %or.cond3, label %81, label %87

; <label>:81:                                     ; preds = %77
  br i1 %35, label %82, label %86

; <label>:82:                                     ; preds = %81
  %83 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.019, i64 0, i32 10
  %84 = load i32, i32* %83, align 8
  %85 = icmp ugt i32 %84, 2
  %h2v1_fancy_upsample.h2v1_upsample = select i1 %85, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @h2v1_fancy_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @h2v1_upsample
  br label %86

; <label>:86:                                     ; preds = %81, %82
  %h2v1_upsample.sink = phi void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* [ %h2v1_fancy_upsample.h2v1_upsample, %82 ], [ @h2v1_upsample, %81 ]
  %sunkaddr34 = shl i64 %indvars.iv, 3
  %sunkaddr35 = add i64 %44, %sunkaddr34
  %sunkaddr36 = add i64 %sunkaddr35, 104
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)**
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* %h2v1_upsample.sink, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %sunkaddr37, align 8
  br label %114

; <label>:87:                                     ; preds = %77
  %88 = icmp eq i32 %79, %67
  %89 = shl nsw i32 %66, 1
  %90 = icmp eq i32 %89, %68
  %or.cond7 = and i1 %88, %90
  br i1 %or.cond7, label %91, label %98

; <label>:91:                                     ; preds = %87
  br i1 %35, label %92, label %97

; <label>:92:                                     ; preds = %91
  %93 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.019, i64 0, i32 10
  %94 = load i32, i32* %93, align 8
  %95 = icmp ugt i32 %94, 2
  br i1 %95, label %96, label %97

; <label>:96:                                     ; preds = %92
  %sunkaddr39 = shl i64 %indvars.iv, 3
  %sunkaddr40 = add i64 %47, %sunkaddr39
  %sunkaddr41 = add i64 %sunkaddr40, 104
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)**
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @h2v2_fancy_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %sunkaddr42, align 8
  store i32 1, i32* %sunkaddr103, align 8
  br label %114

; <label>:97:                                     ; preds = %92, %91
  %sunkaddr47 = shl i64 %indvars.iv, 3
  %sunkaddr48 = add i64 %48, %sunkaddr47
  %sunkaddr49 = add i64 %sunkaddr48, 104
  %sunkaddr50 = inttoptr i64 %sunkaddr49 to void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)**
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @h2v2_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %sunkaddr50, align 8
  br label %114

; <label>:98:                                     ; preds = %87
  %99 = srem i32 %67, %62
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %101, label %109

; <label>:101:                                    ; preds = %98
  %102 = srem i32 %68, %66
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %104, label %109

; <label>:104:                                    ; preds = %101
  %sunkaddr52 = shl i64 %indvars.iv, 3
  %sunkaddr53 = add i64 %51, %sunkaddr52
  %sunkaddr54 = add i64 %sunkaddr53, 104
  %sunkaddr55 = inttoptr i64 %sunkaddr54 to void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)**
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @int_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %sunkaddr55, align 8
  %105 = sdiv i32 %67, %62
  %106 = trunc i32 %105 to i8
  %sunkaddr57 = add i64 %50, %indvars.iv
  %sunkaddr58 = add i64 %sunkaddr57, 232
  %sunkaddr59 = inttoptr i64 %sunkaddr58 to i8*
  store i8 %106, i8* %sunkaddr59, align 1
  %107 = sdiv i32 %68, %66
  %108 = trunc i32 %107 to i8
  %sunkaddr61 = add i64 %49, %indvars.iv
  %sunkaddr62 = add i64 %sunkaddr61, 242
  %sunkaddr63 = inttoptr i64 %sunkaddr62 to i8*
  store i8 %108, i8* %sunkaddr63, align 1
  br label %114

; <label>:109:                                    ; preds = %101, %98
  %110 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %53, align 8
  %111 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %110, i64 0, i32 5
  store i32 37, i32* %111, align 8
  %112 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %54, align 8
  %113 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %112, align 8
  tail call void %113(%struct.jpeg_common_struct* nonnull %52) #4
  br label %114

; <label>:114:                                    ; preds = %97, %96, %109, %104, %86
  %115 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr106, align 8
  %116 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %115, i64 0, i32 2
  %117 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %116, align 8
  %118 = load i32, i32* %sunkaddr109, align 8
  %119 = zext i32 %118 to i64
  %120 = load i32, i32* %sunkaddr112, align 4
  %121 = sext i32 %120 to i64
  %122 = tail call i64 @jround_up(i64 %119, i64 %121) #4
  %123 = trunc i64 %122 to i32
  %124 = load i32, i32* %sunkaddr115, align 8
  %125 = tail call i8** %117(%struct.jpeg_common_struct* nonnull %46, i32 1, i32 %123, i32 %124) #4
  %sunkaddr77 = shl i64 %indvars.iv, 3
  %sunkaddr78 = add i64 %45, %sunkaddr77
  %sunkaddr79 = add i64 %sunkaddr78, 24
  %sunkaddr80 = inttoptr i64 %sunkaddr79 to i8***
  store i8** %125, i8*** %sunkaddr80, align 8
  br label %126

; <label>:126:                                    ; preds = %72, %76, %114
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %127 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.019, i64 1
  %128 = load i32, i32* %sunkaddr118, align 8
  %129 = sext i32 %128 to i64
  %130 = icmp slt i64 %indvars.iv.next, %129
  br i1 %130, label %55, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %126
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %34
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @start_pass_upsample(%struct.jpeg_decompress_struct* nocapture readonly) #1 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %3 = bitcast %struct.jpeg_upsampler** %2 to %struct.my_upsampler**
  %4 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %6 = load i32, i32* %5, align 8
  %7 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %4, i64 0, i32 3
  store i32 %6, i32* %7, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  %9 = load i32, i32* %8, align 4
  %10 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %4, i64 0, i32 4
  store i32 %9, i32* %10, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @sep_upsample(%struct.jpeg_decompress_struct*, i8*** nocapture readonly, i32* nocapture, i32, i8**, i32* nocapture, i32) #0 {
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %9 = bitcast %struct.jpeg_upsampler** %8 to %struct.my_upsampler**
  %10 = load %struct.my_upsampler*, %struct.my_upsampler** %9, align 8
  %11 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %10, i64 0, i32 3
  %12 = load i32, i32* %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %14 = load i32, i32* %13, align 8
  %15 = icmp slt i32 %12, %14
  br i1 %15, label %37, label %16

; <label>:16:                                     ; preds = %7
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %18 = load i32, i32* %17, align 8
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %16
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %21 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %sunkaddr18 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr19 = add i64 %sunkaddr18, 48
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph ]
  %.014 = phi %struct.jpeg_component_info* [ %21, %.lr.ph.preheader ], [ %33, %.lr.ph ]
  %22 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %10, i64 0, i32 2, i64 %indvars.iv
  %23 = load void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %22, align 8
  %24 = getelementptr inbounds i8**, i8*** %1, i64 %indvars.iv
  %25 = load i8**, i8*** %24, align 8
  %26 = load i32, i32* %2, align 4
  %27 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %10, i64 0, i32 5, i64 %indvars.iv
  %28 = load i32, i32* %27, align 4
  %29 = mul i32 %28, %26
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i8*, i8** %25, i64 %30
  %32 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %10, i64 0, i32 1, i64 %indvars.iv
  tail call void %23(%struct.jpeg_decompress_struct* nonnull %0, %struct.jpeg_component_info* %.014, i8** %31, i8*** %32) #4
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %33 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.014, i64 1
  %34 = load i32, i32* %sunkaddr20, align 8
  %35 = sext i32 %34 to i64
  %36 = icmp slt i64 %indvars.iv.next, %35
  br i1 %36, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %16
  %sunkaddr7 = ptrtoint %struct.my_upsampler* %10 to i64
  %sunkaddr8 = add i64 %sunkaddr7, 184
  %sunkaddr9 = inttoptr i64 %sunkaddr8 to i32*
  store i32 0, i32* %sunkaddr9, align 8
  br label %37

; <label>:37:                                     ; preds = %7, %._crit_edge
  %sunkaddr10 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr11 = add i64 %sunkaddr10, 392
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to i32*
  %38 = load i32, i32* %sunkaddr12, align 8
  %sunkaddr13 = ptrtoint %struct.my_upsampler* %10 to i64
  %sunkaddr14 = add i64 %sunkaddr13, 184
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to i32*
  %39 = load i32, i32* %sunkaddr15, align 8
  %40 = sub nsw i32 %38, %39
  %41 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %10, i64 0, i32 4
  %42 = load i32, i32* %41, align 4
  %43 = icmp ugt i32 %40, %42
  %. = select i1 %43, i32 %42, i32 %40
  %44 = load i32, i32* %5, align 4
  %45 = sub i32 %6, %44
  %46 = icmp ugt i32 %., %45
  %..0 = select i1 %46, i32 %45, i32 %.
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 82
  %48 = load %struct.jpeg_color_deconverter*, %struct.jpeg_color_deconverter** %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_color_deconverter, %struct.jpeg_color_deconverter* %48, i64 0, i32 1
  %50 = load void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %49, align 8
  %51 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %10, i64 0, i32 1, i64 0
  %52 = load i32, i32* %sunkaddr15, align 8
  %53 = zext i32 %44 to i64
  %54 = getelementptr inbounds i8*, i8** %4, i64 %53
  tail call void %50(%struct.jpeg_decompress_struct* nonnull %0, i8*** %51, i32 %52, i8** %54, i32 %..0) #4
  %55 = load i32, i32* %5, align 4
  %56 = add i32 %55, %..0
  store i32 %56, i32* %5, align 4
  %57 = load i32, i32* %41, align 4
  %58 = sub i32 %57, %..0
  store i32 %58, i32* %41, align 4
  %59 = load i32, i32* %sunkaddr15, align 8
  %60 = add i32 %59, %..0
  store i32 %60, i32* %sunkaddr15, align 8
  %61 = load i32, i32* %sunkaddr12, align 8
  %62 = icmp slt i32 %60, %61
  br i1 %62, label %66, label %63

; <label>:63:                                     ; preds = %37
  %64 = load i32, i32* %2, align 4
  %65 = add i32 %64, 1
  store i32 %65, i32* %2, align 4
  br label %66

; <label>:66:                                     ; preds = %37, %63
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @noop_upsample(%struct.jpeg_decompress_struct* nocapture readnone, %struct.jpeg_component_info* nocapture readnone, i8** nocapture readnone, i8*** nocapture) #1 {
  store i8** null, i8*** %3, align 8
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @fullsize_upsample(%struct.jpeg_decompress_struct* nocapture readnone, %struct.jpeg_component_info* nocapture readnone, i8**, i8*** nocapture) #1 {
  store i8** %2, i8*** %3, align 8
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @h2v1_fancy_upsample(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i8** nocapture readonly, i8*** nocapture readonly) #1 {
  %5 = load i8**, i8*** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %7 = load i32, i32* %6, align 8
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %.lr.ph13.preheader, label %._crit_edge14

.lr.ph13.preheader:                               ; preds = %4
  %sunkaddr26 = ptrtoint %struct.jpeg_component_info* %1 to i64
  %sunkaddr27 = add i64 %sunkaddr26, 40
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i32*
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr29 = add i64 %sunkaddr, 392
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i32*
  br label %.lr.ph13

.lr.ph13:                                         ; preds = %.lr.ph13.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph13.preheader ]
  %9 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv
  %10 = load i8*, i8** %9, align 8
  %11 = getelementptr inbounds i8*, i8** %5, i64 %indvars.iv
  %12 = load i8*, i8** %11, align 8
  %13 = getelementptr inbounds i8, i8* %10, i64 1
  %14 = load i8, i8* %10, align 1
  %15 = zext i8 %14 to i32
  %16 = getelementptr inbounds i8, i8* %12, i64 1
  store i8 %14, i8* %12, align 1
  %17 = mul nuw nsw i32 %15, 3
  %18 = load i8, i8* %13, align 1
  %19 = zext i8 %18 to i32
  %20 = add nuw nsw i32 %17, 2
  %21 = add nuw nsw i32 %20, %19
  %22 = lshr i32 %21, 2
  %23 = trunc i32 %22 to i8
  store i8 %23, i8* %16, align 1
  %24 = load i32, i32* %sunkaddr28, align 8
  %25 = add i32 %24, -2
  %.024 = getelementptr inbounds i8, i8* %12, i64 2
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph13
  %27 = add i32 %24, -3
  %28 = zext i32 %27 to i64
  %scevgep17 = getelementptr i8, i8* %10, i64 2
  %29 = zext i32 %27 to i64
  %30 = add nuw nsw i64 %29, 1
  %min.iters.check = icmp ult i64 %30, 16
  br i1 %min.iters.check, label %.lr.ph.preheader45, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.preheader
  %n.vec = and i64 %30, 8589934576
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph.preheader45, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep31 = getelementptr i8, i8* %12, i64 4
  %31 = add i32 %24, -3
  %32 = zext i32 %31 to i64
  %33 = shl nuw nsw i64 %32, 1
  %scevgep32 = getelementptr i8, i8* %scevgep31, i64 %33
  %scevgep33 = getelementptr i8, i8* %10, i64 3
  %scevgep34 = getelementptr i8, i8* %scevgep33, i64 %32
  %bound0 = icmp ult i8* %.024, %scevgep34
  %bound1 = icmp ult i8* %10, %scevgep32
  %memcheck.conflict = and i1 %bound0, %bound1
  %34 = shl nuw nsw i64 %n.vec, 1
  %ind.end = getelementptr i8, i8* %.024, i64 %34
  %cast.crd = trunc i64 %n.vec to i32
  %ind.end36 = sub i32 %25, %cast.crd
  %ind.end38 = getelementptr i8, i8* %12, i64 %34
  %ind.end40 = getelementptr i8, i8* %13, i64 %n.vec
  br i1 %memcheck.conflict, label %.lr.ph.preheader45, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %35 = shl i64 %index, 1
  %next.gep41 = getelementptr i8, i8* %12, i64 %35
  %next.gep42 = getelementptr i8, i8* %13, i64 %index
  %36 = getelementptr inbounds i8, i8* %next.gep42, i64 1
  %37 = bitcast i8* %next.gep42 to <16 x i8>*
  %wide.load = load <16 x i8>, <16 x i8>* %37, align 1, !alias.scope !1
  %38 = zext <16 x i8> %wide.load to <16 x i32>
  %39 = mul nuw nsw <16 x i32> %38, <i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3>
  %40 = getelementptr inbounds i8, i8* %next.gep42, i64 -1
  %41 = bitcast i8* %40 to <16 x i8>*
  %wide.load43 = load <16 x i8>, <16 x i8>* %41, align 1, !alias.scope !1
  %42 = zext <16 x i8> %wide.load43 to <16 x i32>
  %43 = add nuw nsw <16 x i32> %42, <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %44 = add nuw nsw <16 x i32> %43, %39
  %45 = lshr <16 x i32> %44, <i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2>
  %46 = trunc <16 x i32> %45 to <16 x i8>
  %47 = getelementptr inbounds i8, i8* %next.gep41, i64 3
  %48 = bitcast i8* %36 to <16 x i8>*
  %wide.load44 = load <16 x i8>, <16 x i8>* %48, align 1, !alias.scope !1
  %49 = zext <16 x i8> %wide.load44 to <16 x i32>
  %50 = add nuw nsw <16 x i32> %39, <i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2>
  %51 = add nuw nsw <16 x i32> %50, %49
  %52 = lshr <16 x i32> %51, <i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2>
  %53 = trunc <16 x i32> %52 to <16 x i8>
  %54 = getelementptr i8, i8* %47, i64 -1
  %55 = bitcast i8* %54 to <32 x i8>*
  %interleaved.vec = shufflevector <16 x i8> %46, <16 x i8> %53, <32 x i32> <i32 0, i32 16, i32 1, i32 17, i32 2, i32 18, i32 3, i32 19, i32 4, i32 20, i32 5, i32 21, i32 6, i32 22, i32 7, i32 23, i32 8, i32 24, i32 9, i32 25, i32 10, i32 26, i32 11, i32 27, i32 12, i32 28, i32 13, i32 29, i32 14, i32 30, i32 15, i32 31>
  store <32 x i8> %interleaved.vec, <32 x i8>* %55, align 1, !alias.scope !4, !noalias !1
  %index.next = add i64 %index, 16
  %56 = icmp eq i64 %index.next, %n.vec
  br i1 %56, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %30, %n.vec
  br i1 %cmp.n, label %._crit_edge.loopexit, label %.lr.ph.preheader45

.lr.ph.preheader45:                               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph.preheader
  %.028.ph = phi i8* [ %.024, %vector.memcheck ], [ %.024, %min.iters.checked ], [ %.024, %.lr.ph.preheader ], [ %ind.end, %middle.block ]
  %.017.ph = phi i32 [ %25, %vector.memcheck ], [ %25, %min.iters.checked ], [ %25, %.lr.ph.preheader ], [ %ind.end36, %middle.block ]
  %.pn6.ph = phi i8* [ %12, %vector.memcheck ], [ %12, %min.iters.checked ], [ %12, %.lr.ph.preheader ], [ %ind.end38, %middle.block ]
  %.035.ph = phi i8* [ %13, %vector.memcheck ], [ %13, %min.iters.checked ], [ %13, %.lr.ph.preheader ], [ %ind.end40, %middle.block ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader45, %.lr.ph
  %.028 = phi i8* [ %.02, %.lr.ph ], [ %.028.ph, %.lr.ph.preheader45 ]
  %.017 = phi i32 [ %75, %.lr.ph ], [ %.017.ph, %.lr.ph.preheader45 ]
  %.pn6 = phi i8* [ %.028, %.lr.ph ], [ %.pn6.ph, %.lr.ph.preheader45 ]
  %.035 = phi i8* [ %57, %.lr.ph ], [ %.035.ph, %.lr.ph.preheader45 ]
  %57 = getelementptr inbounds i8, i8* %.035, i64 1
  %58 = load i8, i8* %.035, align 1
  %59 = zext i8 %58 to i32
  %60 = mul nuw nsw i32 %59, 3
  %61 = getelementptr inbounds i8, i8* %.035, i64 -1
  %62 = load i8, i8* %61, align 1
  %63 = zext i8 %62 to i32
  %64 = add nuw nsw i32 %63, 1
  %65 = add nuw nsw i32 %64, %60
  %66 = lshr i32 %65, 2
  %67 = trunc i32 %66 to i8
  %68 = getelementptr inbounds i8, i8* %.pn6, i64 3
  store i8 %67, i8* %.028, align 1
  %69 = load i8, i8* %57, align 1
  %70 = zext i8 %69 to i32
  %71 = add nuw nsw i32 %60, 2
  %72 = add nuw nsw i32 %71, %70
  %73 = lshr i32 %72, 2
  %74 = trunc i32 %73 to i8
  store i8 %74, i8* %68, align 1
  %75 = add i32 %.017, -1
  %.02 = getelementptr inbounds i8, i8* %.028, i64 2
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %._crit_edge.loopexit.loopexit, label %.lr.ph, !llvm.loop !9

._crit_edge.loopexit.loopexit:                    ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge.loopexit.loopexit, %middle.block
  %77 = shl nuw nsw i64 %28, 1
  %scevgep19 = getelementptr i8, i8* %12, i64 4
  %scevgep = getelementptr i8, i8* %12, i64 2
  %scevgep16 = getelementptr i8, i8* %scevgep, i64 %77
  %scevgep18 = getelementptr i8, i8* %scevgep17, i64 %28
  %scevgep20 = getelementptr i8, i8* %scevgep19, i64 %77
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph13, %._crit_edge.loopexit
  %.03.lcssa = phi i8* [ %scevgep18, %._crit_edge.loopexit ], [ %13, %.lr.ph13 ]
  %.pn.lcssa = phi i8* [ %scevgep16, %._crit_edge.loopexit ], [ %12, %.lr.ph13 ]
  %.02.lcssa = phi i8* [ %scevgep20, %._crit_edge.loopexit ], [ %.024, %.lr.ph13 ]
  %78 = load i8, i8* %.03.lcssa, align 1
  %79 = zext i8 %78 to i32
  %80 = mul nuw nsw i32 %79, 3
  %81 = getelementptr inbounds i8, i8* %.03.lcssa, i64 -1
  %82 = load i8, i8* %81, align 1
  %83 = zext i8 %82 to i32
  %84 = add nuw nsw i32 %83, 1
  %85 = add nuw nsw i32 %84, %80
  %86 = lshr i32 %85, 2
  %87 = trunc i32 %86 to i8
  %88 = getelementptr inbounds i8, i8* %.pn.lcssa, i64 3
  store i8 %87, i8* %.02.lcssa, align 1
  store i8 %78, i8* %88, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %89 = load i32, i32* %sunkaddr30, align 8
  %90 = sext i32 %89 to i64
  %91 = icmp slt i64 %indvars.iv.next, %90
  br i1 %91, label %.lr.ph13, label %._crit_edge14.loopexit

._crit_edge14.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @h2v1_upsample(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readnone, i8** nocapture readonly, i8*** nocapture readonly) #1 {
  %5 = load i8**, i8*** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %7 = load i32, i32* %6, align 8
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %.lr.ph7.preheader, label %._crit_edge8

.lr.ph7.preheader:                                ; preds = %4
  %sunkaddr22 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr23 = add i64 %sunkaddr22, 128
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to i32*
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr25 = add i64 %sunkaddr, 392
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to i32*
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph7.preheader ]
  %9 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv
  %10 = load i8*, i8** %9, align 8
  %11 = getelementptr inbounds i8*, i8** %5, i64 %indvars.iv
  %12 = load i8*, i8** %11, align 8
  %13 = load i32, i32* %sunkaddr24, align 8
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i8, i8* %12, i64 %14
  %16 = icmp eq i32 %13, 0
  br i1 %16, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph7
  %17 = ptrtoint i8* %12 to i64
  %scevgep = getelementptr i8, i8* %12, i64 2
  %18 = icmp ugt i8* %15, %scevgep
  %umax = select i1 %18, i8* %15, i8* %scevgep
  %scevgep9 = getelementptr i8, i8* %umax, i64 -1
  %19 = sub i64 0, %17
  %scevgep10 = getelementptr i8, i8* %scevgep9, i64 %19
  %scevgep1011 = ptrtoint i8* %scevgep10 to i64
  %20 = lshr i64 %scevgep1011, 1
  %21 = add nuw i64 %20, 1
  %xtraiter = and i64 %21, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.preheader..lr.ph.prol_crit_edge

.lr.ph.preheader..lr.ph.prol_crit_edge:           ; preds = %.lr.ph.preheader
  %22 = shl nuw nsw i64 %xtraiter, 1
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.preheader..lr.ph.prol_crit_edge
  %.014.prol = phi i8* [ %26, %.lr.ph.prol ], [ %12, %.lr.ph.preheader..lr.ph.prol_crit_edge ]
  %.023.prol = phi i8* [ %23, %.lr.ph.prol ], [ %10, %.lr.ph.preheader..lr.ph.prol_crit_edge ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.preheader..lr.ph.prol_crit_edge ]
  %23 = getelementptr inbounds i8, i8* %.023.prol, i64 1
  %24 = load i8, i8* %.023.prol, align 1
  %25 = getelementptr inbounds i8, i8* %.014.prol, i64 1
  store i8 %24, i8* %.014.prol, align 1
  %26 = getelementptr inbounds i8, i8* %.014.prol, i64 2
  store i8 %24, i8* %25, align 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge, label %.lr.ph.prol, !llvm.loop !10

.lr.ph.prol..lr.ph.prol.loopexit_crit_edge:       ; preds = %.lr.ph.prol
  %scevgep20 = getelementptr i8, i8* %10, i64 %xtraiter
  %scevgep21 = getelementptr i8, i8* %12, i64 %22
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge
  %.014.unr = phi i8* [ %scevgep21, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ], [ %12, %.lr.ph.preheader ]
  %.023.unr = phi i8* [ %scevgep20, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ], [ %10, %.lr.ph.preheader ]
  %27 = icmp ult i8* %scevgep10, inttoptr (i64 14 to i8*)
  br i1 %27, label %._crit_edge, label %.lr.ph.preheader27

.lr.ph.preheader27:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader27, %.lr.ph
  %.014 = phi i8* [ %59, %.lr.ph ], [ %.014.unr, %.lr.ph.preheader27 ]
  %.023 = phi i8* [ %56, %.lr.ph ], [ %.023.unr, %.lr.ph.preheader27 ]
  %28 = getelementptr inbounds i8, i8* %.023, i64 1
  %29 = load i8, i8* %.023, align 1
  %30 = getelementptr inbounds i8, i8* %.014, i64 1
  store i8 %29, i8* %.014, align 1
  %31 = getelementptr inbounds i8, i8* %.014, i64 2
  store i8 %29, i8* %30, align 1
  %32 = getelementptr inbounds i8, i8* %.023, i64 2
  %33 = load i8, i8* %28, align 1
  %34 = getelementptr inbounds i8, i8* %.014, i64 3
  store i8 %33, i8* %31, align 1
  %35 = getelementptr inbounds i8, i8* %.014, i64 4
  store i8 %33, i8* %34, align 1
  %36 = getelementptr inbounds i8, i8* %.023, i64 3
  %37 = load i8, i8* %32, align 1
  %38 = getelementptr inbounds i8, i8* %.014, i64 5
  store i8 %37, i8* %35, align 1
  %39 = getelementptr inbounds i8, i8* %.014, i64 6
  store i8 %37, i8* %38, align 1
  %40 = getelementptr inbounds i8, i8* %.023, i64 4
  %41 = load i8, i8* %36, align 1
  %42 = getelementptr inbounds i8, i8* %.014, i64 7
  store i8 %41, i8* %39, align 1
  %43 = getelementptr inbounds i8, i8* %.014, i64 8
  store i8 %41, i8* %42, align 1
  %44 = getelementptr inbounds i8, i8* %.023, i64 5
  %45 = load i8, i8* %40, align 1
  %46 = getelementptr inbounds i8, i8* %.014, i64 9
  store i8 %45, i8* %43, align 1
  %47 = getelementptr inbounds i8, i8* %.014, i64 10
  store i8 %45, i8* %46, align 1
  %48 = getelementptr inbounds i8, i8* %.023, i64 6
  %49 = load i8, i8* %44, align 1
  %50 = getelementptr inbounds i8, i8* %.014, i64 11
  store i8 %49, i8* %47, align 1
  %51 = getelementptr inbounds i8, i8* %.014, i64 12
  store i8 %49, i8* %50, align 1
  %52 = getelementptr inbounds i8, i8* %.023, i64 7
  %53 = load i8, i8* %48, align 1
  %54 = getelementptr inbounds i8, i8* %.014, i64 13
  store i8 %53, i8* %51, align 1
  %55 = getelementptr inbounds i8, i8* %.014, i64 14
  store i8 %53, i8* %54, align 1
  %56 = getelementptr inbounds i8, i8* %.023, i64 8
  %57 = load i8, i8* %52, align 1
  %58 = getelementptr inbounds i8, i8* %.014, i64 15
  store i8 %57, i8* %55, align 1
  %59 = getelementptr inbounds i8, i8* %.014, i64 16
  store i8 %57, i8* %58, align 1
  %60 = icmp ult i8* %59, %15
  br i1 %60, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.lr.ph7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %61 = load i32, i32* %sunkaddr26, align 8
  %62 = sext i32 %61 to i64
  %63 = icmp slt i64 %indvars.iv.next, %62
  br i1 %63, label %.lr.ph7, label %._crit_edge8.loopexit

._crit_edge8.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @h2v2_fancy_upsample(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i8** nocapture readonly, i8*** nocapture readonly) #1 {
  %5 = load i8**, i8*** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %7 = load i32, i32* %6, align 8
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %.preheader.lr.ph.preheader, label %._crit_edge26

.preheader.lr.ph.preheader:                       ; preds = %4
  %sunkaddr52 = ptrtoint %struct.jpeg_component_info* %1 to i64
  %sunkaddr53 = add i64 %sunkaddr52, 40
  %sunkaddr54 = inttoptr i64 %sunkaddr53 to i32*
  %9 = ptrtoint i8** %5 to i64
  %10 = ptrtoint i8** %2 to i64
  %sunkaddr = ptrtoint %struct.jpeg_component_info* %1 to i64
  %sunkaddr55 = add i64 %sunkaddr, 40
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to i32*
  %sunkaddr57 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr58 = add i64 %sunkaddr57, 392
  %sunkaddr59 = inttoptr i64 %sunkaddr58 to i32*
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge.1
  %indvars.iv = phi i64 [ %indvars.iv.next32, %._crit_edge.1 ], [ 0, %.preheader.lr.ph.preheader ]
  %.0125 = phi i64 [ %143, %._crit_edge.1 ], [ 0, %.preheader.lr.ph.preheader ]
  %11 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv
  %sext = shl i64 %.0125, 32
  %12 = ashr exact i64 %sext, 32
  %13 = load i8*, i8** %11, align 8
  %14 = add nsw i64 %indvars.iv, -1
  %.05.in = getelementptr inbounds i8*, i8** %2, i64 %14
  %.05 = load i8*, i8** %.05.in, align 8
  %15 = getelementptr inbounds i8*, i8** %5, i64 %12
  %16 = load i8*, i8** %15, align 8
  %17 = getelementptr inbounds i8, i8* %13, i64 1
  %18 = load i8, i8* %13, align 1
  %19 = zext i8 %18 to i32
  %20 = mul nuw nsw i32 %19, 3
  %21 = getelementptr inbounds i8, i8* %.05, i64 1
  %22 = load i8, i8* %.05, align 1
  %23 = zext i8 %22 to i32
  %24 = add nuw nsw i32 %20, %23
  %25 = load i8, i8* %17, align 1
  %26 = zext i8 %25 to i32
  %27 = mul nuw nsw i32 %26, 3
  %28 = load i8, i8* %21, align 1
  %29 = zext i8 %28 to i32
  %30 = add nuw nsw i32 %27, %29
  %31 = shl nuw nsw i32 %24, 2
  %32 = add nuw nsw i32 %31, 8
  %33 = lshr i32 %32, 4
  %34 = trunc i32 %33 to i8
  %35 = getelementptr inbounds i8, i8* %16, i64 1
  store i8 %34, i8* %16, align 1
  %36 = mul nuw nsw i32 %24, 3
  %37 = add nuw nsw i32 %36, 7
  %38 = add nuw nsw i32 %37, %30
  %39 = lshr i32 %38, 4
  %40 = trunc i32 %39 to i8
  store i8 %40, i8* %35, align 1
  %41 = load i32, i32* %sunkaddr54, align 8
  %42 = add i32 %41, -2
  %.0711 = getelementptr inbounds i8, i8* %16, i64 2
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader.lr.ph
  %44 = getelementptr inbounds i8, i8* %.05, i64 2
  %45 = getelementptr inbounds i8, i8* %13, i64 2
  %46 = add i32 %41, -3
  %47 = zext i32 %46 to i64
  %48 = shl nuw nsw i64 %47, 1
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %.0718 = phi i8* [ %.07, %.lr.ph ], [ %.0711, %.lr.ph.preheader ]
  %.0317 = phi i32 [ %67, %.lr.ph ], [ %42, %.lr.ph.preheader ]
  %.0416 = phi i8* [ %66, %.lr.ph ], [ %45, %.lr.ph.preheader ]
  %.1615 = phi i8* [ %65, %.lr.ph ], [ %44, %.lr.ph.preheader ]
  %.pn14 = phi i8* [ %.0718, %.lr.ph ], [ %16, %.lr.ph.preheader ]
  %.0813 = phi i32 [ %54, %.lr.ph ], [ %30, %.lr.ph.preheader ]
  %.0912 = phi i32 [ %.0813, %.lr.ph ], [ %24, %.lr.ph.preheader ]
  %49 = load i8, i8* %.0416, align 1
  %50 = zext i8 %49 to i32
  %51 = mul nuw nsw i32 %50, 3
  %52 = load i8, i8* %.1615, align 1
  %53 = zext i8 %52 to i32
  %54 = add nuw nsw i32 %51, %53
  %55 = mul nsw i32 %.0813, 3
  %56 = add nsw i32 %.0912, 8
  %57 = add i32 %56, %55
  %58 = lshr i32 %57, 4
  %59 = trunc i32 %58 to i8
  %60 = getelementptr inbounds i8, i8* %.pn14, i64 3
  store i8 %59, i8* %.0718, align 1
  %61 = add i32 %55, 7
  %62 = add i32 %61, %54
  %63 = lshr i32 %62, 4
  %64 = trunc i32 %63 to i8
  store i8 %64, i8* %60, align 1
  %65 = getelementptr inbounds i8, i8* %.1615, i64 1
  %66 = getelementptr inbounds i8, i8* %.0416, i64 1
  %67 = add i32 %.0317, -1
  %.07 = getelementptr inbounds i8, i8* %.0718, i64 2
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  %scevgep30 = getelementptr i8, i8* %16, i64 4
  %scevgep = getelementptr i8, i8* %16, i64 2
  %scevgep29 = getelementptr i8, i8* %scevgep, i64 %48
  %scevgep31 = getelementptr i8, i8* %scevgep30, i64 %48
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader.lr.ph, %._crit_edge.loopexit
  %.09.lcssa = phi i32 [ %.0813, %._crit_edge.loopexit ], [ %24, %.preheader.lr.ph ]
  %.08.lcssa = phi i32 [ %54, %._crit_edge.loopexit ], [ %30, %.preheader.lr.ph ]
  %.pn.lcssa = phi i8* [ %scevgep29, %._crit_edge.loopexit ], [ %16, %.preheader.lr.ph ]
  %.07.lcssa = phi i8* [ %scevgep31, %._crit_edge.loopexit ], [ %.0711, %.preheader.lr.ph ]
  %69 = mul nsw i32 %.08.lcssa, 3
  %70 = add nsw i32 %.09.lcssa, 8
  %71 = add i32 %70, %69
  %72 = lshr i32 %71, 4
  %73 = trunc i32 %72 to i8
  %74 = getelementptr inbounds i8, i8* %.pn.lcssa, i64 3
  store i8 %73, i8* %.07.lcssa, align 1
  %75 = shl nsw i32 %.08.lcssa, 2
  %76 = add nsw i32 %75, 7
  %77 = lshr i32 %76, 4
  %78 = trunc i32 %77 to i8
  store i8 %78, i8* %74, align 1
  %sunkaddr36 = shl i64 %indvars.iv, 3
  %sunkaddr37 = add i64 %10, %sunkaddr36
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to i8**
  %79 = load i8*, i8** %sunkaddr38, align 8
  %indvars.iv.next32 = add nuw i64 %indvars.iv, 1
  %.05.in.1 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next32
  %.05.1 = load i8*, i8** %.05.in.1, align 8
  %sunkaddr40 = ashr exact i64 %sext, 29
  %sunkaddr41 = add i64 %9, %sunkaddr40
  %sunkaddr42 = add i64 %sunkaddr41, 8
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to i8**
  %80 = load i8*, i8** %sunkaddr43, align 8
  %81 = getelementptr inbounds i8, i8* %79, i64 1
  %82 = load i8, i8* %79, align 1
  %83 = zext i8 %82 to i32
  %84 = mul nuw nsw i32 %83, 3
  %85 = getelementptr inbounds i8, i8* %.05.1, i64 1
  %86 = load i8, i8* %.05.1, align 1
  %87 = zext i8 %86 to i32
  %88 = add nuw nsw i32 %84, %87
  %89 = load i8, i8* %81, align 1
  %90 = zext i8 %89 to i32
  %91 = mul nuw nsw i32 %90, 3
  %92 = load i8, i8* %85, align 1
  %93 = zext i8 %92 to i32
  %94 = add nuw nsw i32 %91, %93
  %95 = shl nuw nsw i32 %88, 2
  %96 = add nuw nsw i32 %95, 8
  %97 = lshr i32 %96, 4
  %98 = trunc i32 %97 to i8
  %99 = getelementptr inbounds i8, i8* %80, i64 1
  store i8 %98, i8* %80, align 1
  %100 = mul nuw nsw i32 %88, 3
  %101 = add nuw nsw i32 %100, 7
  %102 = add nuw nsw i32 %101, %94
  %103 = lshr i32 %102, 4
  %104 = trunc i32 %103 to i8
  store i8 %104, i8* %99, align 1
  %105 = load i32, i32* %sunkaddr56, align 8
  %106 = add i32 %105, -2
  %.0711.1 = getelementptr inbounds i8, i8* %80, i64 2
  %107 = icmp eq i32 %106, 0
  br i1 %107, label %._crit_edge.1, label %.lr.ph.preheader.1

._crit_edge26.loopexit:                           ; preds = %._crit_edge.1
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %4
  ret void

.lr.ph.preheader.1:                               ; preds = %._crit_edge
  %108 = getelementptr inbounds i8, i8* %.05.1, i64 2
  %109 = getelementptr inbounds i8, i8* %79, i64 2
  %110 = add i32 %105, -3
  %111 = zext i32 %110 to i64
  %112 = shl nuw nsw i64 %111, 1
  br label %.lr.ph.1

.lr.ph.1:                                         ; preds = %.lr.ph.1, %.lr.ph.preheader.1
  %.0718.1 = phi i8* [ %.07.1, %.lr.ph.1 ], [ %.0711.1, %.lr.ph.preheader.1 ]
  %.0317.1 = phi i32 [ %131, %.lr.ph.1 ], [ %106, %.lr.ph.preheader.1 ]
  %.0416.1 = phi i8* [ %130, %.lr.ph.1 ], [ %109, %.lr.ph.preheader.1 ]
  %.1615.1 = phi i8* [ %129, %.lr.ph.1 ], [ %108, %.lr.ph.preheader.1 ]
  %.pn14.1 = phi i8* [ %.0718.1, %.lr.ph.1 ], [ %80, %.lr.ph.preheader.1 ]
  %.0813.1 = phi i32 [ %118, %.lr.ph.1 ], [ %94, %.lr.ph.preheader.1 ]
  %.0912.1 = phi i32 [ %.0813.1, %.lr.ph.1 ], [ %88, %.lr.ph.preheader.1 ]
  %113 = load i8, i8* %.0416.1, align 1
  %114 = zext i8 %113 to i32
  %115 = mul nuw nsw i32 %114, 3
  %116 = load i8, i8* %.1615.1, align 1
  %117 = zext i8 %116 to i32
  %118 = add nuw nsw i32 %115, %117
  %119 = mul nsw i32 %.0813.1, 3
  %120 = add nsw i32 %.0912.1, 8
  %121 = add i32 %120, %119
  %122 = lshr i32 %121, 4
  %123 = trunc i32 %122 to i8
  %124 = getelementptr inbounds i8, i8* %.pn14.1, i64 3
  store i8 %123, i8* %.0718.1, align 1
  %125 = add i32 %119, 7
  %126 = add i32 %125, %118
  %127 = lshr i32 %126, 4
  %128 = trunc i32 %127 to i8
  store i8 %128, i8* %124, align 1
  %129 = getelementptr inbounds i8, i8* %.1615.1, i64 1
  %130 = getelementptr inbounds i8, i8* %.0416.1, i64 1
  %131 = add i32 %.0317.1, -1
  %.07.1 = getelementptr inbounds i8, i8* %.0718.1, i64 2
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %._crit_edge.loopexit.1, label %.lr.ph.1

._crit_edge.loopexit.1:                           ; preds = %.lr.ph.1
  %scevgep30.1 = getelementptr i8, i8* %80, i64 4
  %scevgep.1 = getelementptr i8, i8* %80, i64 2
  %scevgep29.1 = getelementptr i8, i8* %scevgep.1, i64 %112
  %scevgep31.1 = getelementptr i8, i8* %scevgep30.1, i64 %112
  br label %._crit_edge.1

._crit_edge.1:                                    ; preds = %._crit_edge, %._crit_edge.loopexit.1
  %.09.lcssa.1 = phi i32 [ %.0813.1, %._crit_edge.loopexit.1 ], [ %88, %._crit_edge ]
  %.08.lcssa.1 = phi i32 [ %118, %._crit_edge.loopexit.1 ], [ %94, %._crit_edge ]
  %.pn.lcssa.1 = phi i8* [ %scevgep29.1, %._crit_edge.loopexit.1 ], [ %80, %._crit_edge ]
  %.07.lcssa.1 = phi i8* [ %scevgep31.1, %._crit_edge.loopexit.1 ], [ %.0711.1, %._crit_edge ]
  %133 = mul nsw i32 %.08.lcssa.1, 3
  %134 = add nsw i32 %.09.lcssa.1, 8
  %135 = add i32 %134, %133
  %136 = lshr i32 %135, 4
  %137 = trunc i32 %136 to i8
  %138 = getelementptr inbounds i8, i8* %.pn.lcssa.1, i64 3
  store i8 %137, i8* %.07.lcssa.1, align 1
  %139 = shl nsw i32 %.08.lcssa.1, 2
  %140 = add nsw i32 %139, 7
  %141 = lshr i32 %140, 4
  %142 = trunc i32 %141 to i8
  store i8 %142, i8* %138, align 1
  %143 = add nsw i64 %12, 2
  %144 = trunc i64 %143 to i32
  %145 = load i32, i32* %sunkaddr59, align 8
  %146 = icmp slt i32 %144, %145
  br i1 %146, label %.preheader.lr.ph, label %._crit_edge26.loopexit
}

; Function Attrs: noinline nounwind uwtable
define internal void @h2v2_upsample(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readnone, i8** nocapture readonly, i8*** nocapture readonly) #0 {
  %5 = load i8**, i8*** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %7 = load i32, i32* %6, align 8
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %.lr.ph9.preheader, label %._crit_edge10

.lr.ph9.preheader:                                ; preds = %4
  %sunkaddr29 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr30 = add i64 %sunkaddr29, 128
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to i32*
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr32 = add i64 %sunkaddr, 128
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to i32*
  %sunkaddr34 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr35 = add i64 %sunkaddr34, 392
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to i32*
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %.lr.ph9.preheader, %._crit_edge
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge ], [ 0, %.lr.ph9.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph9.preheader ]
  %.07 = phi i32 [ %64, %._crit_edge ], [ 0, %.lr.ph9.preheader ]
  %9 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv14
  %10 = load i8*, i8** %9, align 8
  %11 = getelementptr inbounds i8*, i8** %5, i64 %indvars.iv
  %12 = load i8*, i8** %11, align 8
  %13 = load i32, i32* %sunkaddr31, align 8
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i8, i8* %12, i64 %14
  %16 = icmp eq i32 %13, 0
  br i1 %16, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph9
  %17 = ptrtoint i8* %12 to i64
  %scevgep = getelementptr i8, i8* %12, i64 2
  %18 = icmp ugt i8* %15, %scevgep
  %umax = select i1 %18, i8* %15, i8* %scevgep
  %scevgep11 = getelementptr i8, i8* %umax, i64 -1
  %19 = sub i64 0, %17
  %scevgep12 = getelementptr i8, i8* %scevgep11, i64 %19
  %scevgep1213 = ptrtoint i8* %scevgep12 to i64
  %20 = lshr i64 %scevgep1213, 1
  %21 = add nuw i64 %20, 1
  %xtraiter = and i64 %21, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.preheader..lr.ph.prol_crit_edge

.lr.ph.preheader..lr.ph.prol_crit_edge:           ; preds = %.lr.ph.preheader
  %22 = shl nuw nsw i64 %xtraiter, 1
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.preheader..lr.ph.prol_crit_edge
  %.025.prol = phi i8* [ %26, %.lr.ph.prol ], [ %12, %.lr.ph.preheader..lr.ph.prol_crit_edge ]
  %.034.prol = phi i8* [ %23, %.lr.ph.prol ], [ %10, %.lr.ph.preheader..lr.ph.prol_crit_edge ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.preheader..lr.ph.prol_crit_edge ]
  %23 = getelementptr inbounds i8, i8* %.034.prol, i64 1
  %24 = load i8, i8* %.034.prol, align 1
  %25 = getelementptr inbounds i8, i8* %.025.prol, i64 1
  store i8 %24, i8* %.025.prol, align 1
  %26 = getelementptr inbounds i8, i8* %.025.prol, i64 2
  store i8 %24, i8* %25, align 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge, label %.lr.ph.prol, !llvm.loop !12

.lr.ph.prol..lr.ph.prol.loopexit_crit_edge:       ; preds = %.lr.ph.prol
  %scevgep27 = getelementptr i8, i8* %10, i64 %xtraiter
  %scevgep28 = getelementptr i8, i8* %12, i64 %22
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge
  %.025.unr = phi i8* [ %scevgep28, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ], [ %12, %.lr.ph.preheader ]
  %.034.unr = phi i8* [ %scevgep27, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ], [ %10, %.lr.ph.preheader ]
  %27 = icmp ult i8* %scevgep12, inttoptr (i64 14 to i8*)
  br i1 %27, label %._crit_edge, label %.lr.ph.preheader37

.lr.ph.preheader37:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader37, %.lr.ph
  %.025 = phi i8* [ %59, %.lr.ph ], [ %.025.unr, %.lr.ph.preheader37 ]
  %.034 = phi i8* [ %56, %.lr.ph ], [ %.034.unr, %.lr.ph.preheader37 ]
  %28 = getelementptr inbounds i8, i8* %.034, i64 1
  %29 = load i8, i8* %.034, align 1
  %30 = getelementptr inbounds i8, i8* %.025, i64 1
  store i8 %29, i8* %.025, align 1
  %31 = getelementptr inbounds i8, i8* %.025, i64 2
  store i8 %29, i8* %30, align 1
  %32 = getelementptr inbounds i8, i8* %.034, i64 2
  %33 = load i8, i8* %28, align 1
  %34 = getelementptr inbounds i8, i8* %.025, i64 3
  store i8 %33, i8* %31, align 1
  %35 = getelementptr inbounds i8, i8* %.025, i64 4
  store i8 %33, i8* %34, align 1
  %36 = getelementptr inbounds i8, i8* %.034, i64 3
  %37 = load i8, i8* %32, align 1
  %38 = getelementptr inbounds i8, i8* %.025, i64 5
  store i8 %37, i8* %35, align 1
  %39 = getelementptr inbounds i8, i8* %.025, i64 6
  store i8 %37, i8* %38, align 1
  %40 = getelementptr inbounds i8, i8* %.034, i64 4
  %41 = load i8, i8* %36, align 1
  %42 = getelementptr inbounds i8, i8* %.025, i64 7
  store i8 %41, i8* %39, align 1
  %43 = getelementptr inbounds i8, i8* %.025, i64 8
  store i8 %41, i8* %42, align 1
  %44 = getelementptr inbounds i8, i8* %.034, i64 5
  %45 = load i8, i8* %40, align 1
  %46 = getelementptr inbounds i8, i8* %.025, i64 9
  store i8 %45, i8* %43, align 1
  %47 = getelementptr inbounds i8, i8* %.025, i64 10
  store i8 %45, i8* %46, align 1
  %48 = getelementptr inbounds i8, i8* %.034, i64 6
  %49 = load i8, i8* %44, align 1
  %50 = getelementptr inbounds i8, i8* %.025, i64 11
  store i8 %49, i8* %47, align 1
  %51 = getelementptr inbounds i8, i8* %.025, i64 12
  store i8 %49, i8* %50, align 1
  %52 = getelementptr inbounds i8, i8* %.034, i64 7
  %53 = load i8, i8* %48, align 1
  %54 = getelementptr inbounds i8, i8* %.025, i64 13
  store i8 %53, i8* %51, align 1
  %55 = getelementptr inbounds i8, i8* %.025, i64 14
  store i8 %53, i8* %54, align 1
  %56 = getelementptr inbounds i8, i8* %.034, i64 8
  %57 = load i8, i8* %52, align 1
  %58 = getelementptr inbounds i8, i8* %.025, i64 15
  store i8 %57, i8* %55, align 1
  %59 = getelementptr inbounds i8, i8* %.025, i64 16
  store i8 %57, i8* %58, align 1
  %60 = icmp ult i8* %59, %15
  br i1 %60, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.lr.ph9
  %61 = or i32 %.07, 1
  %62 = load i32, i32* %sunkaddr33, align 8
  %63 = trunc i64 %indvars.iv to i32
  tail call void @jcopy_sample_rows(i8** %5, i32 %63, i8** %5, i32 %61, i32 1, i32 %62) #4
  %indvars.iv.next15 = add nuw i64 %indvars.iv14, 1
  %indvars.iv.next = add nuw i64 %indvars.iv, 2
  %64 = add nuw nsw i32 %.07, 2
  %65 = load i32, i32* %sunkaddr36, align 8
  %66 = sext i32 %65 to i64
  %67 = icmp slt i64 %indvars.iv.next, %66
  br i1 %67, label %.lr.ph9, label %._crit_edge10.loopexit

._crit_edge10.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @int_upsample(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i8** nocapture readonly, i8*** nocapture readonly) #0 {
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %6 = bitcast %struct.jpeg_upsampler** %5 to %struct.my_upsampler**
  %7 = load %struct.my_upsampler*, %struct.my_upsampler** %6, align 8
  %8 = load i8**, i8*** %3, align 8
  %9 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 1
  %10 = load i32, i32* %9, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %7, i64 0, i32 6, i64 %11
  %13 = load i8, i8* %12, align 1
  %14 = zext i8 %13 to i32
  %15 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %7, i64 0, i32 7, i64 %11
  %16 = load i8, i8* %15, align 1
  %17 = zext i8 %16 to i64
  %18 = zext i8 %16 to i32
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %20 = load i32, i32* %19, align 8
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %.lr.ph13, label %._crit_edge14

.lr.ph13:                                         ; preds = %4
  %22 = icmp eq i8 %13, 0
  %23 = add nsw i32 %18, -1
  br i1 %22, label %.lr.ph13.split, label %.lr.ph13.split.us.preheader

.lr.ph13.split.us.preheader:                      ; preds = %.lr.ph13
  %24 = add nsw i32 %14, -1
  %25 = zext i32 %24 to i64
  %26 = add nuw nsw i64 %25, 1
  %27 = add nsw i32 %14, -1
  %28 = zext i32 %27 to i64
  %29 = add nuw nsw i64 %28, 1
  %sunkaddr88 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr89 = add i64 %sunkaddr88, 128
  %sunkaddr90 = inttoptr i64 %sunkaddr89 to i32*
  %30 = icmp ugt i8 %16, 1
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr91 = add i64 %sunkaddr, 128
  %sunkaddr92 = inttoptr i64 %sunkaddr91 to i32*
  %sunkaddr93 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr94 = add i64 %sunkaddr93, 392
  %sunkaddr95 = inttoptr i64 %sunkaddr94 to i32*
  br label %.lr.ph13.split.us

.lr.ph13.split.us:                                ; preds = %43, %.lr.ph13.split.us.preheader
  %indvars.iv55 = phi i64 [ 0, %.lr.ph13.split.us.preheader ], [ %indvars.iv.next56, %43 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph13.split.us.preheader ], [ %indvars.iv.next, %43 ]
  %.011.us = phi i32 [ 0, %.lr.ph13.split.us.preheader ], [ %44, %43 ]
  %31 = getelementptr inbounds i8*, i8** %8, i64 %indvars.iv
  %32 = load i8*, i8** %31, align 8
  %33 = load i32, i32* %sunkaddr90, align 8
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8* %32, i64 %34
  %36 = icmp eq i32 %33, 0
  br i1 %36, label %._crit_edge.us-lcssa.us.us, label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph13.split.us
  %37 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv55
  %38 = load i8*, i8** %37, align 8
  br label %.lr.ph.us.us

._crit_edge.us-lcssa.us.us.loopexit:              ; preds = %.loopexit.us.us
  br label %._crit_edge.us-lcssa.us.us

._crit_edge.us-lcssa.us.us:                       ; preds = %._crit_edge.us-lcssa.us.us.loopexit, %.lr.ph13.split.us
  br i1 %30, label %39, label %43

; <label>:39:                                     ; preds = %._crit_edge.us-lcssa.us.us
  %40 = add nuw nsw i32 %.011.us, 1
  %41 = load i32, i32* %sunkaddr92, align 8
  %42 = trunc i64 %indvars.iv to i32
  tail call void @jcopy_sample_rows(i8** %8, i32 %42, i8** %8, i32 %40, i32 %23, i32 %41) #4
  br label %43

; <label>:43:                                     ; preds = %._crit_edge.us-lcssa.us.us, %39
  %indvars.iv.next56 = add nuw i64 %indvars.iv55, 1
  %indvars.iv.next = add i64 %indvars.iv, %17
  %44 = add nsw i32 %.011.us, %18
  %45 = load i32, i32* %sunkaddr95, align 8
  %46 = sext i32 %45 to i64
  %47 = icmp slt i64 %indvars.iv.next, %46
  br i1 %47, label %.lr.ph13.split.us, label %._crit_edge14.loopexit117

.lr.ph.us.us:                                     ; preds = %.loopexit.us.us, %.lr.ph.us.us.preheader
  %.038.us.us = phi i8* [ %scevgep, %.loopexit.us.us ], [ %32, %.lr.ph.us.us.preheader ]
  %.047.us.us = phi i8* [ %49, %.loopexit.us.us ], [ %38, %.lr.ph.us.us.preheader ]
  %48 = load i8, i8* %.047.us.us, align 1
  call void @llvm.memset.p0i8.i64(i8* %.038.us.us, i8 %48, i64 %26, i32 1, i1 false)
  br label %51

.loopexit.us.us:                                  ; preds = %51
  %scevgep = getelementptr i8, i8* %.038.us.us, i64 %29
  %49 = getelementptr inbounds i8, i8* %.047.us.us, i64 1
  %50 = icmp ult i8* %scevgep, %35
  br i1 %50, label %.lr.ph.us.us, label %._crit_edge.us-lcssa.us.us.loopexit

; <label>:51:                                     ; preds = %51, %.lr.ph.us.us
  %.026.us.us = phi i32 [ %14, %.lr.ph.us.us ], [ %52, %51 ]
  %52 = add nsw i32 %.026.us.us, -1
  %53 = icmp sgt i32 %.026.us.us, 1
  br i1 %53, label %51, label %.loopexit.us.us

.lr.ph13.split:                                   ; preds = %.lr.ph13
  %54 = icmp ugt i8 %16, 1
  %sunkaddr99 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr100 = add i64 %sunkaddr99, 128
  %sunkaddr101 = inttoptr i64 %sunkaddr100 to i32*
  %55 = load i32, i32* %sunkaddr101, align 8
  %56 = icmp eq i32 %55, 0
  br i1 %54, label %.lr.ph13.split.split.us.preheader, label %.lr.ph13.split.split.preheader

.lr.ph13.split.split.preheader:                   ; preds = %.lr.ph13.split
  br i1 %56, label %._crit_edge.preheader, label %.lr.ph9.split.preheader

._crit_edge.preheader:                            ; preds = %.lr.ph13.split.split.preheader
  %sunkaddr111 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr112 = add i64 %sunkaddr111, 392
  %sunkaddr113 = inttoptr i64 %sunkaddr112 to i32*
  %57 = load i32, i32* %sunkaddr113, align 8
  %58 = icmp eq i32 %55, 0
  br label %._crit_edge

.lr.ph13.split.split.us.preheader:                ; preds = %.lr.ph13.split
  br i1 %56, label %._crit_edge.us-lcssa.us40.preheader, label %.loopexit.us36.preheader

._crit_edge.us-lcssa.us40.preheader:              ; preds = %.lr.ph13.split.split.us.preheader
  %sunkaddr105 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr106 = add i64 %sunkaddr105, 128
  %sunkaddr107 = inttoptr i64 %sunkaddr106 to i32*
  %sunkaddr108 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr109 = add i64 %sunkaddr108, 392
  %sunkaddr110 = inttoptr i64 %sunkaddr109 to i32*
  %sunkaddr102 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr103 = add i64 %sunkaddr102, 128
  %sunkaddr104 = inttoptr i64 %sunkaddr103 to i32*
  br label %._crit_edge.us-lcssa.us40

.lr.ph13.split.split.us:                          ; preds = %._crit_edge.us-lcssa.us40
  %59 = load i32, i32* %sunkaddr104, align 8
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %._crit_edge.us-lcssa.us40, label %.loopexit.us36.preheader.loopexit

.loopexit.us36.preheader.loopexit:                ; preds = %.lr.ph13.split.split.us
  br label %.loopexit.us36.preheader

.loopexit.us36.preheader:                         ; preds = %.loopexit.us36.preheader.loopexit, %.lr.ph13.split.split.us.preheader
  br label %.loopexit.us36

.loopexit.us36:                                   ; preds = %.loopexit.us36.preheader, %.loopexit.us36
  br label %.loopexit.us36

._crit_edge.us-lcssa.us40:                        ; preds = %._crit_edge.us-lcssa.us40.preheader, %.lr.ph13.split.split.us
  %.011.us2686 = phi i32 [ %63, %.lr.ph13.split.split.us ], [ 0, %._crit_edge.us-lcssa.us40.preheader ]
  %61 = add nuw nsw i32 %.011.us2686, 1
  %62 = load i32, i32* %sunkaddr107, align 8
  tail call void @jcopy_sample_rows(i8** %8, i32 %.011.us2686, i8** %8, i32 %61, i32 %23, i32 %62) #4
  %63 = add nsw i32 %.011.us2686, %18
  %64 = load i32, i32* %sunkaddr110, align 8
  %65 = icmp slt i32 %63, %64
  br i1 %65, label %.lr.ph13.split.split.us, label %._crit_edge14.loopexit

.lr.ph13.split.split:                             ; preds = %._crit_edge
  br i1 %58, label %._crit_edge, label %.lr.ph9.split.preheader.loopexit

.lr.ph9.split.preheader.loopexit:                 ; preds = %.lr.ph13.split.split
  br label %.lr.ph9.split.preheader

.lr.ph9.split.preheader:                          ; preds = %.lr.ph9.split.preheader.loopexit, %.lr.ph13.split.split.preheader
  br label %.lr.ph9.split

.lr.ph9.split:                                    ; preds = %.lr.ph9.split.preheader, %.lr.ph9.split
  br label %.lr.ph9.split

._crit_edge:                                      ; preds = %._crit_edge.preheader, %.lr.ph13.split.split
  %.01187 = phi i32 [ %66, %.lr.ph13.split.split ], [ 0, %._crit_edge.preheader ]
  %66 = add nuw nsw i32 %.01187, %18
  %67 = icmp slt i32 %66, %57
  br i1 %67, label %.lr.ph13.split.split, label %._crit_edge14.loopexit116

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us-lcssa.us40
  br label %._crit_edge14

._crit_edge14.loopexit116:                        ; preds = %._crit_edge
  br label %._crit_edge14

._crit_edge14.loopexit117:                        ; preds = %43
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit117, %._crit_edge14.loopexit116, %._crit_edge14.loopexit, %4
  ret void
}

declare i64 @jround_up(i64, i64) local_unnamed_addr #2

declare void @jcopy_sample_rows(i8**, i32, i8**, i32, i32, i32) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !11}
