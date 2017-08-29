; ModuleID = 'jcsample.ll'
source_filename = "jcsample.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_compress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_destination_mgr*, i32, i32, i32, i32, double, i32, i32, i32, %struct.jpeg_component_info*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], [16 x i8], [16 x i8], [16 x i8], i32, %struct.jpeg_scan_info*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8, i16, i16, i32, i32, i32, i32, i32, i32, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, %struct.jpeg_comp_master*, %struct.jpeg_c_main_controller*, %struct.jpeg_c_prep_controller*, %struct.jpeg_c_coef_controller*, %struct.jpeg_marker_writer*, %struct.jpeg_color_converter*, %struct.jpeg_downsampler*, %struct.jpeg_forward_dct*, %struct.jpeg_entropy_encoder* }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.jpeg_destination_mgr = type { i8*, i64, {}*, i32 (%struct.jpeg_compress_struct*)*, {}* }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_scan_info = type { i32, [4 x i32], i32, i32, i32, i32 }
%struct.jpeg_comp_master = type { {}*, {}*, {}*, i32, i32 }
%struct.jpeg_c_main_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32)* }
%struct.jpeg_c_prep_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* }
%struct.jpeg_c_coef_controller = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, i8***)* }
%struct.jpeg_marker_writer = type { void (%struct.jpeg_compress_struct*, i32, i8*, i32)*, {}*, {}*, {}*, {}*, {}* }
%struct.jpeg_color_converter = type { {}*, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* }
%struct.jpeg_downsampler = type { {}*, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)*, i32 }
%struct.jpeg_forward_dct = type { {}*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* }
%struct.jpeg_entropy_encoder = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, {}* }
%struct.my_downsampler = type { %struct.jpeg_downsampler, [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*] }

; Function Attrs: noinline nounwind uwtable
define void @jinit_downsampler(%struct.jpeg_compress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 104) #5
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 57
  %9 = bitcast %struct.jpeg_downsampler** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @start_pass_downsample, void (%struct.jpeg_compress_struct*)** %10, align 8
  %11 = getelementptr inbounds i8, i8* %7, i64 8
  %12 = bitcast i8* %11 to void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)**
  store void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)* @sep_downsample, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)** %12, align 8
  %13 = getelementptr inbounds i8, i8* %7, i64 16
  %14 = bitcast i8* %13 to i32*
  store i32 0, i32* %14, align 8
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 26
  %16 = load i32, i32* %15, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %26, label %18

; <label>:18:                                     ; preds = %1
  %19 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i64 0, i32 5
  store i32 23, i32* %22, align 8
  %23 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %24 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %23, align 8
  %25 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %24, align 8
  tail call void %25(%struct.jpeg_common_struct* %19) #5
  br label %26

; <label>:26:                                     ; preds = %1, %18
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %28 = load i32, i32* %27, align 4
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %.lr.ph, label %._crit_edge.thread

.lr.ph:                                           ; preds = %26
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %31 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %30, align 8
  %sunkaddr96 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr97 = add i64 %sunkaddr96, 304
  %sunkaddr98 = inttoptr i64 %sunkaddr97 to i32*
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr99 = add i64 %sunkaddr, 308
  %sunkaddr100 = inttoptr i64 %sunkaddr99 to i32*
  %sunkaddr101 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr102 = add i64 %sunkaddr101, 264
  %sunkaddr103 = inttoptr i64 %sunkaddr102 to i32*
  %sunkaddr112 = ptrtoint i8* %7 to i64
  %sunkaddr109 = ptrtoint i8* %7 to i64
  %sunkaddr110 = add i64 %sunkaddr109, 16
  %sunkaddr111 = inttoptr i64 %sunkaddr110 to i32*
  %sunkaddr151 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr152 = add i64 %sunkaddr151, 68
  %sunkaddr153 = inttoptr i64 %sunkaddr152 to i32*
  %sunkaddr117 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr118 = add i64 %sunkaddr117, 304
  %sunkaddr119 = inttoptr i64 %sunkaddr118 to i32*
  %sunkaddr120 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr121 = add i64 %sunkaddr120, 308
  %sunkaddr122 = inttoptr i64 %sunkaddr121 to i32*
  %32 = ptrtoint i8* %7 to i64
  %sunkaddr123 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr124 = add i64 %sunkaddr123, 304
  %sunkaddr125 = inttoptr i64 %sunkaddr124 to i32*
  %sunkaddr126 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr127 = add i64 %sunkaddr126, 308
  %sunkaddr128 = inttoptr i64 %sunkaddr127 to i32*
  %sunkaddr129 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr130 = add i64 %sunkaddr129, 264
  %sunkaddr131 = inttoptr i64 %sunkaddr130 to i32*
  %sunkaddr140 = ptrtoint i8* %7 to i64
  %sunkaddr137 = ptrtoint i8* %7 to i64
  %sunkaddr138 = add i64 %sunkaddr137, 16
  %sunkaddr139 = inttoptr i64 %sunkaddr138 to i32*
  %sunkaddr145 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr146 = add i64 %sunkaddr145, 304
  %sunkaddr147 = inttoptr i64 %sunkaddr146 to i32*
  %sunkaddr148 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr149 = add i64 %sunkaddr148, 308
  %sunkaddr150 = inttoptr i64 %sunkaddr149 to i32*
  %33 = ptrtoint i8* %7 to i64
  %34 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %36 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  br label %37

; <label>:37:                                     ; preds = %96, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %96 ]
  %.07 = phi i32 [ 1, %.lr.ph ], [ %.4, %96 ]
  %.015 = phi %struct.jpeg_component_info* [ %31, %.lr.ph ], [ %97, %96 ]
  %38 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.015, i64 0, i32 2
  %39 = load i32, i32* %38, align 8
  %40 = load i32, i32* %sunkaddr98, align 8
  %41 = icmp eq i32 %39, %40
  br i1 %41, label %42, label %52

; <label>:42:                                     ; preds = %37
  %43 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.015, i64 0, i32 3
  %44 = load i32, i32* %43, align 4
  %45 = load i32, i32* %sunkaddr100, align 4
  %46 = icmp eq i32 %44, %45
  br i1 %46, label %47, label %52

; <label>:47:                                     ; preds = %42
  %48 = load i32, i32* %sunkaddr103, align 8
  %49 = icmp eq i32 %48, 0
  %sunkaddr113 = shl i64 %indvars.iv, 3
  %sunkaddr114 = add i64 %sunkaddr112, %sunkaddr113
  %sunkaddr115 = add i64 %sunkaddr114, 24
  %sunkaddr116 = inttoptr i64 %sunkaddr115 to void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)**
  br i1 %49, label %51, label %50

; <label>:50:                                     ; preds = %47
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @fullsize_smooth_downsample, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %sunkaddr116, align 8
  store i32 1, i32* %sunkaddr111, align 8
  br label %96

; <label>:51:                                     ; preds = %47
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @fullsize_downsample, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %sunkaddr116, align 8
  br label %96

; <label>:52:                                     ; preds = %42, %37
  %sunkaddr30 = ptrtoint %struct.jpeg_component_info* %.015 to i64
  %sunkaddr31 = add i64 %sunkaddr30, 8
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to i32*
  %53 = load i32, i32* %sunkaddr32, align 8
  %54 = shl nsw i32 %53, 1
  %55 = load i32, i32* %sunkaddr119, align 8
  %56 = icmp eq i32 %54, %55
  br i1 %56, label %57, label %63

; <label>:57:                                     ; preds = %52
  %58 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.015, i64 0, i32 3
  %59 = load i32, i32* %58, align 4
  %60 = load i32, i32* %sunkaddr122, align 4
  %61 = icmp eq i32 %59, %60
  br i1 %61, label %62, label %63

; <label>:62:                                     ; preds = %57
  %sunkaddr40 = shl i64 %indvars.iv, 3
  %sunkaddr41 = add i64 %32, %sunkaddr40
  %sunkaddr42 = add i64 %sunkaddr41, 24
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)**
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @h2v1_downsample, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %sunkaddr43, align 8
  br label %96

; <label>:63:                                     ; preds = %57, %52
  %sunkaddr44 = ptrtoint %struct.jpeg_component_info* %.015 to i64
  %sunkaddr45 = add i64 %sunkaddr44, 8
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to i32*
  %64 = load i32, i32* %sunkaddr46, align 8
  %65 = shl nsw i32 %64, 1
  %66 = load i32, i32* %sunkaddr125, align 8
  %67 = icmp eq i32 %65, %66
  br i1 %67, label %68, label %79

; <label>:68:                                     ; preds = %63
  %69 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.015, i64 0, i32 3
  %70 = load i32, i32* %69, align 4
  %71 = shl nsw i32 %70, 1
  %72 = load i32, i32* %sunkaddr128, align 4
  %73 = icmp eq i32 %71, %72
  br i1 %73, label %74, label %79

; <label>:74:                                     ; preds = %68
  %75 = load i32, i32* %sunkaddr131, align 8
  %76 = icmp eq i32 %75, 0
  %sunkaddr141 = shl i64 %indvars.iv, 3
  %sunkaddr142 = add i64 %sunkaddr140, %sunkaddr141
  %sunkaddr143 = add i64 %sunkaddr142, 24
  %sunkaddr144 = inttoptr i64 %sunkaddr143 to void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)**
  br i1 %76, label %78, label %77

; <label>:77:                                     ; preds = %74
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @h2v2_smooth_downsample, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %sunkaddr144, align 8
  store i32 1, i32* %sunkaddr139, align 8
  br label %96

; <label>:78:                                     ; preds = %74
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @h2v2_downsample, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %sunkaddr144, align 8
  br label %96

; <label>:79:                                     ; preds = %68, %63
  %80 = load i32, i32* %sunkaddr147, align 8
  %sunkaddr72 = ptrtoint %struct.jpeg_component_info* %.015 to i64
  %sunkaddr73 = add i64 %sunkaddr72, 8
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to i32*
  %81 = load i32, i32* %sunkaddr74, align 8
  %82 = srem i32 %80, %81
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %91

; <label>:84:                                     ; preds = %79
  %85 = load i32, i32* %sunkaddr150, align 4
  %86 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.015, i64 0, i32 3
  %87 = load i32, i32* %86, align 4
  %88 = srem i32 %85, %87
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %90, label %91

; <label>:90:                                     ; preds = %84
  %sunkaddr79 = shl i64 %indvars.iv, 3
  %sunkaddr80 = add i64 %33, %sunkaddr79
  %sunkaddr81 = add i64 %sunkaddr80, 24
  %sunkaddr82 = inttoptr i64 %sunkaddr81 to void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)**
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @int_downsample, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %sunkaddr82, align 8
  br label %96

; <label>:91:                                     ; preds = %84, %79
  %92 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %35, align 8
  %93 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %92, i64 0, i32 5
  store i32 37, i32* %93, align 8
  %94 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %36, align 8
  %95 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %94, align 8
  tail call void %95(%struct.jpeg_common_struct* nonnull %34) #5
  br label %96

; <label>:96:                                     ; preds = %51, %50, %78, %77, %91, %90, %62
  %.4 = phi i32 [ %.07, %51 ], [ %.07, %50 ], [ 0, %62 ], [ %.07, %78 ], [ %.07, %77 ], [ 0, %90 ], [ %.07, %91 ]
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %97 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.015, i64 1
  %98 = load i32, i32* %sunkaddr153, align 4
  %99 = sext i32 %98 to i64
  %100 = icmp slt i64 %indvars.iv.next, %99
  br i1 %100, label %37, label %._crit_edge

._crit_edge:                                      ; preds = %96
  %101 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 27
  %102 = load i32, i32* %101, align 8
  %103 = icmp ne i32 %102, 0
  %104 = icmp eq i32 %.4, 0
  %or.cond = and i1 %104, %103
  br i1 %or.cond, label %105, label %._crit_edge.thread

; <label>:105:                                    ; preds = %._crit_edge
  %106 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %107 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %108 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %107, align 8
  %109 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %108, i64 0, i32 5
  store i32 98, i32* %109, align 8
  %110 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %107, align 8
  %111 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %110, i64 0, i32 1
  %112 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %111, align 8
  tail call void %112(%struct.jpeg_common_struct* nonnull %106, i32 0) #5
  ret void

._crit_edge.thread:                               ; preds = %._crit_edge, %26
  ret void
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal void @start_pass_downsample(%struct.jpeg_compress_struct* nocapture) #1 {
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @sep_downsample(%struct.jpeg_compress_struct*, i8*** nocapture readonly, i32, i8*** nocapture readonly, i32) #0 {
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 57
  %7 = bitcast %struct.jpeg_downsampler** %6 to %struct.my_downsampler**
  %8 = load %struct.my_downsampler*, %struct.my_downsampler** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %10 = load i32, i32* %9, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %5
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %13 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %12, align 8
  %14 = zext i32 %2 to i64
  %sunkaddr8 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr9 = add i64 %sunkaddr8, 68
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to i32*
  br label %15

; <label>:15:                                     ; preds = %15, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %15 ]
  %.03 = phi %struct.jpeg_component_info* [ %13, %.lr.ph ], [ %28, %15 ]
  %16 = getelementptr inbounds i8**, i8*** %1, i64 %indvars.iv
  %17 = load i8**, i8*** %16, align 8
  %18 = getelementptr inbounds i8*, i8** %17, i64 %14
  %19 = getelementptr inbounds i8**, i8*** %3, i64 %indvars.iv
  %20 = load i8**, i8*** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 3
  %22 = load i32, i32* %21, align 4
  %23 = mul i32 %22, %4
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i8*, i8** %20, i64 %24
  %26 = getelementptr inbounds %struct.my_downsampler, %struct.my_downsampler* %8, i64 0, i32 1, i64 %indvars.iv
  %27 = load void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %26, align 8
  tail call void %27(%struct.jpeg_compress_struct* nonnull %0, %struct.jpeg_component_info* %.03, i8** %18, i8** %25) #5
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %28 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 1
  %29 = load i32, i32* %sunkaddr10, align 4
  %30 = sext i32 %29 to i64
  %31 = icmp slt i64 %indvars.iv.next, %30
  br i1 %31, label %15, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %15
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @fullsize_smooth_downsample(%struct.jpeg_compress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i8** nocapture readonly, i8** nocapture readonly) #2 {
  %5 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 7
  %6 = load i32, i32* %5, align 4
  %7 = shl i32 %6, 3
  %8 = getelementptr inbounds i8*, i8** %2, i64 -1
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %10 = load i32, i32* %9, align 4
  %11 = add nsw i32 %10, 2
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %13 = load i32, i32* %12, align 8
  tail call fastcc void @expand_right_edge(i8** %8, i32 %11, i32 %13, i32 %7)
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 27
  %15 = load i32, i32* %14, align 8
  %16 = sext i32 %15 to i64
  %17 = sext i32 %15 to i64
  %18 = shl nsw i64 %17, 9
  %19 = sub nsw i64 65536, %18
  %20 = shl nsw i64 %16, 6
  %21 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 3
  %22 = load i32, i32* %21, align 4
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %4
  %24 = add i32 %7, -2
  %25 = add i32 %7, -3
  %26 = or i32 %25, 2
  %27 = zext i32 %26 to i64
  %sunkaddr50 = ptrtoint %struct.jpeg_component_info* %1 to i64
  %sunkaddr51 = add i64 %sunkaddr50, 12
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to i32*
  br label %28

; <label>:28:                                     ; preds = %82, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %82 ]
  %29 = getelementptr inbounds i8*, i8** %3, i64 %indvars.iv
  %30 = load i8*, i8** %29, align 8
  %31 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv
  %32 = load i8*, i8** %31, align 8
  %33 = add nsw i64 %indvars.iv, -1
  %34 = getelementptr inbounds i8*, i8** %2, i64 %33
  %35 = load i8*, i8** %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %36 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next
  %37 = load i8*, i8** %36, align 8
  %38 = getelementptr inbounds i8, i8* %35, i64 1
  %39 = load i8, i8* %35, align 1
  %promoted39 = zext i8 %39 to i64
  %40 = getelementptr inbounds i8, i8* %37, i64 1
  %41 = load i8, i8* %37, align 1
  %promoted28 = zext i8 %41 to i64
  %42 = add nuw nsw i64 %promoted28, %promoted39
  %43 = load i8, i8* %32, align 1
  %promoted40 = zext i8 %43 to i64
  %44 = add nuw nsw i64 %42, %promoted40
  %45 = getelementptr inbounds i8, i8* %32, i64 1
  %46 = zext i8 %43 to i64
  %47 = load i8, i8* %38, align 1
  %promoted41 = zext i8 %47 to i64
  %48 = load i8, i8* %40, align 1
  %promoted24 = zext i8 %48 to i64
  %49 = add nuw nsw i64 %promoted24, %promoted41
  %50 = load i8, i8* %45, align 1
  %promoted42 = zext i8 %50 to i64
  %51 = add nuw nsw i64 %49, %promoted42
  %52 = shl nuw nsw i64 %44, 1
  %53 = sub nsw i64 %52, %46
  %54 = add nsw i64 %53, %51
  %55 = mul nsw i64 %46, %19
  %56 = mul nsw i64 %54, %20
  %57 = add i64 %55, 32768
  %58 = add i64 %57, %56
  %59 = lshr i64 %58, 16
  %60 = trunc i64 %59 to i8
  store i8 %60, i8* %30, align 1
  br label %61

; <label>:61:                                     ; preds = %61, %28
  %.pn = phi i8* [ %30, %28 ], [ %.0718, %61 ]
  %.017 = phi i64 [ %44, %28 ], [ %.0116.in, %61 ]
  %.0116.in = phi i64 [ %51, %28 ], [ %71, %61 ]
  %.0315 = phi i32 [ %24, %28 ], [ %80, %61 ]
  %.0414 = phi i8* [ %45, %28 ], [ %62, %61 ]
  %.0513 = phi i8* [ %38, %28 ], [ %65, %61 ]
  %.0612 = phi i8* [ %40, %28 ], [ %66, %61 ]
  %.0718 = getelementptr inbounds i8, i8* %.pn, i64 1
  %62 = getelementptr inbounds i8, i8* %.0414, i64 1
  %63 = load i8, i8* %.0414, align 1
  %64 = zext i8 %63 to i64
  %65 = getelementptr inbounds i8, i8* %.0513, i64 1
  %66 = getelementptr inbounds i8, i8* %.0612, i64 1
  %67 = load i8, i8* %65, align 1
  %promoted43 = zext i8 %67 to i64
  %68 = load i8, i8* %66, align 1
  %promoted32 = zext i8 %68 to i64
  %69 = add nuw nsw i64 %promoted32, %promoted43
  %70 = load i8, i8* %62, align 1
  %promoted44 = zext i8 %70 to i64
  %71 = add nuw nsw i64 %69, %promoted44
  %addconv = add nsw i64 %.017, %.0116.in
  %72 = sub nsw i64 %addconv, %64
  %73 = add nsw i64 %72, %71
  %74 = mul nsw i64 %64, %19
  %75 = mul nsw i64 %73, %20
  %76 = add i64 %74, 32768
  %77 = add i64 %76, %75
  %78 = lshr i64 %77, 16
  %79 = trunc i64 %78 to i8
  store i8 %79, i8* %.0718, align 1
  %80 = add i32 %.0315, -1
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %82, label %61

; <label>:82:                                     ; preds = %61
  %scevgep21 = getelementptr i8, i8* %30, i64 %27
  %sunkaddr = ptrtoint i8* %32 to i64
  %sunkaddr34 = add i64 %sunkaddr, %27
  %sunkaddr35 = inttoptr i64 %sunkaddr34 to i8*
  %83 = load i8, i8* %sunkaddr35, align 1
  %84 = zext i8 %83 to i64
  %85 = shl nuw nsw i64 %71, 1
  %86 = add nsw i64 %85, %.0116.in
  %87 = sub nsw i64 %86, %84
  %88 = mul nsw i64 %84, %19
  %89 = mul nsw i64 %87, %20
  %90 = add i64 %88, 32768
  %91 = add i64 %90, %89
  %92 = lshr i64 %91, 16
  %93 = trunc i64 %92 to i8
  store i8 %93, i8* %scevgep21, align 1
  %94 = load i32, i32* %sunkaddr52, align 4
  %95 = sext i32 %94 to i64
  %96 = icmp slt i64 %indvars.iv.next, %95
  br i1 %96, label %28, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %82
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @fullsize_downsample(%struct.jpeg_compress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i8**, i8**) #0 {
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %8 = load i32, i32* %7, align 8
  tail call void @jcopy_sample_rows(i8** %2, i32 0, i8** %3, i32 0, i32 %6, i32 %8) #5
  %9 = load i32, i32* %5, align 4
  %10 = load i32, i32* %7, align 8
  %11 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 7
  %12 = load i32, i32* %11, align 4
  %13 = shl i32 %12, 3
  tail call fastcc void @expand_right_edge(i8** %3, i32 %9, i32 %10, i32 %13)
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @h2v1_downsample(%struct.jpeg_compress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i8** nocapture readonly, i8** nocapture readonly) #2 {
  %5 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 7
  %6 = load i32, i32* %5, align 4
  %7 = shl i32 %6, 3
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %9 = load i32, i32* %8, align 4
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %11 = load i32, i32* %10, align 8
  %12 = shl i32 %6, 4
  tail call fastcc void @expand_right_edge(i8** %2, i32 %9, i32 %11, i32 %12)
  %13 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 3
  %14 = load i32, i32* %13, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %.lr.ph11, label %._crit_edge12

.lr.ph11:                                         ; preds = %4
  %16 = icmp eq i32 %7, 0
  br i1 %16, label %.lr.ph11.split.preheader, label %.lr.ph11..lr.ph11.split.us_crit_edge

.lr.ph11..lr.ph11.split.us_crit_edge:             ; preds = %.lr.ph11
  %17 = add i32 %7, -2
  %18 = lshr exact i32 %17, 1
  %addconv = add nuw i32 %18, 1
  %19 = zext i32 %addconv to i64
  %20 = zext i32 %18 to i64
  %21 = zext i32 %17 to i64
  %22 = add nuw nsw i64 %21, 2
  %23 = shl nuw nsw i64 %20, 2
  %24 = add nuw nsw i64 %23, 4
  %min.iters.check = icmp ult i32 %addconv, 16
  %sunkaddr23 = ptrtoint %struct.jpeg_component_info* %1 to i64
  %sunkaddr24 = add i64 %sunkaddr23, 12
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to i32*
  %25 = and i32 %addconv, 12
  %n.mod.vf = zext i32 %25 to i64
  %n.vec = sub nsw i64 %19, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %26 = shl nsw i64 %n.vec, 1
  %27 = shl nsw i64 %n.vec, 2
  %cast.crd = trunc i64 %n.vec to i32
  %ind.end31 = shl i32 %cast.crd, 1
  %cmp.n = icmp eq i32 %25, 0
  br label %.lr.ph11.split.us

.lr.ph11.split.preheader:                         ; preds = %.lr.ph11
  %sunkaddr = ptrtoint %struct.jpeg_component_info* %1 to i64
  %sunkaddr21 = add i64 %sunkaddr, 12
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i32*
  %28 = load i32, i32* %sunkaddr22, align 4
  br label %.lr.ph11.split

.lr.ph11.split.us:                                ; preds = %._crit_edge.us, %.lr.ph11..lr.ph11.split.us_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us ], [ 0, %.lr.ph11..lr.ph11.split.us_crit_edge ]
  %29 = getelementptr inbounds i8*, i8** %3, i64 %indvars.iv
  %30 = load i8*, i8** %29, align 8
  %31 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv
  %32 = load i8*, i8** %31, align 8
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph11.split.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i8, i8* %30, i64 %22
  %scevgep27 = getelementptr i8, i8* %32, i64 %24
  %bound0 = icmp ult i8* %30, %scevgep27
  %bound1 = icmp ult i8* %32, %scevgep
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = getelementptr i8, i8* %30, i64 %26
  %ind.end29 = getelementptr i8, i8* %32, i64 %27
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %33 = shl i64 %index, 1
  %next.gep = getelementptr i8, i8* %30, i64 %33
  %34 = shl i64 %index, 2
  %next.gep32 = getelementptr i8, i8* %32, i64 %34
  %35 = bitcast i8* %next.gep32 to <64 x i8>*
  %wide.vec = load <64 x i8>, <64 x i8>* %35, align 1, !alias.scope !1
  %strided.vec = shufflevector <64 x i8> %wide.vec, <64 x i8> undef, <16 x i32> <i32 0, i32 4, i32 8, i32 12, i32 16, i32 20, i32 24, i32 28, i32 32, i32 36, i32 40, i32 44, i32 48, i32 52, i32 56, i32 60>
  %strided.vec33 = shufflevector <64 x i8> %wide.vec, <64 x i8> undef, <16 x i32> <i32 1, i32 5, i32 9, i32 13, i32 17, i32 21, i32 25, i32 29, i32 33, i32 37, i32 41, i32 45, i32 49, i32 53, i32 57, i32 61>
  %strided.vec34 = shufflevector <64 x i8> %wide.vec, <64 x i8> undef, <16 x i32> <i32 2, i32 6, i32 10, i32 14, i32 18, i32 22, i32 26, i32 30, i32 34, i32 38, i32 42, i32 46, i32 50, i32 54, i32 58, i32 62>
  %strided.vec35 = shufflevector <64 x i8> %wide.vec, <64 x i8> undef, <16 x i32> <i32 3, i32 7, i32 11, i32 15, i32 19, i32 23, i32 27, i32 31, i32 35, i32 39, i32 43, i32 47, i32 51, i32 55, i32 59, i32 63>
  %36 = zext <16 x i8> %strided.vec to <16 x i32>
  %37 = zext <16 x i8> %strided.vec33 to <16 x i32>
  %38 = add nuw nsw <16 x i32> %36, %37
  %39 = lshr <16 x i32> %38, <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %40 = trunc <16 x i32> %39 to <16 x i8>
  %41 = getelementptr inbounds i8, i8* %next.gep, i64 1
  %42 = zext <16 x i8> %strided.vec34 to <16 x i32>
  %43 = zext <16 x i8> %strided.vec35 to <16 x i32>
  %44 = add nuw nsw <16 x i32> %42, <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %45 = add nuw nsw <16 x i32> %44, %43
  %46 = lshr <16 x i32> %45, <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %47 = trunc <16 x i32> %46 to <16 x i8>
  %48 = getelementptr i8, i8* %41, i64 -1
  %49 = bitcast i8* %48 to <32 x i8>*
  %interleaved.vec = shufflevector <16 x i8> %40, <16 x i8> %47, <32 x i32> <i32 0, i32 16, i32 1, i32 17, i32 2, i32 18, i32 3, i32 19, i32 4, i32 20, i32 5, i32 21, i32 6, i32 22, i32 7, i32 23, i32 8, i32 24, i32 9, i32 25, i32 10, i32 26, i32 11, i32 27, i32 12, i32 28, i32 13, i32 29, i32 14, i32 30, i32 15, i32 31>
  store <32 x i8> %interleaved.vec, <32 x i8>* %49, align 1, !alias.scope !4, !noalias !1
  %index.next = add i64 %index, 16
  %50 = icmp eq i64 %index.next, %n.vec
  br i1 %50, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph11.split.us
  %.017.us.ph = phi i8* [ %30, %vector.memcheck ], [ %30, %min.iters.checked ], [ %30, %.lr.ph11.split.us ], [ %ind.end, %middle.block ]
  %.026.us.ph = phi i8* [ %32, %vector.memcheck ], [ %32, %min.iters.checked ], [ %32, %.lr.ph11.split.us ], [ %ind.end29, %middle.block ]
  %.035.us.ph = phi i32 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph11.split.us ], [ %ind.end31, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %.017.us = phi i8* [ %71, %scalar.ph ], [ %.017.us.ph, %scalar.ph.preheader ]
  %.026.us = phi i8* [ %70, %scalar.ph ], [ %.026.us.ph, %scalar.ph.preheader ]
  %.035.us = phi i32 [ %72, %scalar.ph ], [ %.035.us.ph, %scalar.ph.preheader ]
  %51 = load i8, i8* %.026.us, align 1
  %52 = zext i8 %51 to i32
  %53 = getelementptr inbounds i8, i8* %.026.us, i64 1
  %54 = load i8, i8* %53, align 1
  %55 = zext i8 %54 to i32
  %56 = add nuw nsw i32 %52, %55
  %57 = lshr i32 %56, 1
  %58 = trunc i32 %57 to i8
  store i8 %58, i8* %.017.us, align 1
  %59 = getelementptr inbounds i8, i8* %.026.us, i64 2
  %60 = getelementptr inbounds i8, i8* %.017.us, i64 1
  %61 = load i8, i8* %59, align 1
  %62 = zext i8 %61 to i32
  %63 = getelementptr inbounds i8, i8* %.026.us, i64 3
  %64 = load i8, i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = add nuw nsw i32 %62, 1
  %67 = add nuw nsw i32 %66, %65
  %68 = lshr i32 %67, 1
  %69 = trunc i32 %68 to i8
  store i8 %69, i8* %60, align 1
  %70 = getelementptr inbounds i8, i8* %.026.us, i64 4
  %71 = getelementptr inbounds i8, i8* %.017.us, i64 2
  %72 = add i32 %.035.us, 2
  %exitcond.1 = icmp eq i32 %72, %7
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %scalar.ph, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %73 = load i32, i32* %sunkaddr25, align 4
  %74 = sext i32 %73 to i64
  %75 = icmp slt i64 %indvars.iv.next, %74
  br i1 %75, label %.lr.ph11.split.us, label %._crit_edge12.loopexit36

.lr.ph11.split:                                   ; preds = %.lr.ph11.split, %.lr.ph11.split.preheader
  %.049 = phi i32 [ %76, %.lr.ph11.split ], [ 0, %.lr.ph11.split.preheader ]
  %76 = add nuw nsw i32 %.049, 1
  %77 = icmp slt i32 %76, %28
  br i1 %77, label %.lr.ph11.split, label %._crit_edge12.loopexit

._crit_edge12.loopexit:                           ; preds = %.lr.ph11.split
  br label %._crit_edge12

._crit_edge12.loopexit36:                         ; preds = %._crit_edge.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit36, %._crit_edge12.loopexit, %4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @h2v2_smooth_downsample(%struct.jpeg_compress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i8** nocapture readonly, i8** nocapture readonly) #2 {
  %5 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 7
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr inbounds i8*, i8** %2, i64 -1
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %9 = load i32, i32* %8, align 4
  %10 = add nsw i32 %9, 2
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %12 = load i32, i32* %11, align 8
  %13 = shl i32 %6, 4
  tail call fastcc void @expand_right_edge(i8** %7, i32 %10, i32 %12, i32 %13)
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 27
  %15 = load i32, i32* %14, align 8
  %16 = sext i32 %15 to i64
  %17 = mul i32 %15, -80
  %18 = add i32 %17, 16384
  %19 = sext i32 %18 to i64
  %20 = shl nsw i64 %16, 4
  %21 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 3
  %22 = load i32, i32* %21, align 4
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %4
  %24 = shl i32 %6, 3
  %25 = add i32 %24, -2
  %26 = zext i32 %25 to i64
  %27 = or i64 %26, 1
  %sunkaddr61 = shl nuw nsw i64 %26, 1
  %sunkaddr65 = shl nuw nsw i64 %26, 1
  %sunkaddr70 = shl nuw nsw i64 %26, 1
  %sunkaddr74 = ptrtoint %struct.jpeg_component_info* %1 to i64
  %sunkaddr75 = add i64 %sunkaddr74, 12
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to i32*
  br label %28

; <label>:28:                                     ; preds = %163, %.lr.ph
  %indvars.iv29 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next30, %163 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %163 ]
  %29 = getelementptr inbounds i8*, i8** %3, i64 %indvars.iv29
  %30 = load i8*, i8** %29, align 8
  %31 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv
  %32 = load i8*, i8** %31, align 8
  %33 = or i64 %indvars.iv, 1
  %34 = getelementptr inbounds i8*, i8** %2, i64 %33
  %35 = load i8*, i8** %34, align 8
  %36 = add nsw i64 %indvars.iv, -1
  %37 = getelementptr inbounds i8*, i8** %2, i64 %36
  %38 = load i8*, i8** %37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2
  %39 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next
  %40 = load i8*, i8** %39, align 8
  %41 = load i8, i8* %32, align 1
  %42 = zext i8 %41 to i64
  %43 = getelementptr inbounds i8, i8* %32, i64 1
  %44 = load i8, i8* %43, align 1
  %45 = zext i8 %44 to i64
  %46 = add nuw nsw i64 %45, %42
  %47 = load i8, i8* %35, align 1
  %48 = zext i8 %47 to i64
  %49 = add nuw nsw i64 %46, %48
  %50 = getelementptr inbounds i8, i8* %35, i64 1
  %51 = load i8, i8* %50, align 1
  %52 = zext i8 %51 to i64
  %53 = add nuw nsw i64 %49, %52
  %54 = load i8, i8* %38, align 1
  %55 = zext i8 %54 to i64
  %56 = getelementptr inbounds i8, i8* %38, i64 1
  %57 = load i8, i8* %56, align 1
  %58 = zext i8 %57 to i64
  %59 = load i8, i8* %40, align 1
  %60 = zext i8 %59 to i64
  %61 = getelementptr inbounds i8, i8* %40, i64 1
  %62 = load i8, i8* %61, align 1
  %63 = zext i8 %62 to i64
  %64 = getelementptr inbounds i8, i8* %32, i64 2
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i64
  %67 = getelementptr inbounds i8, i8* %35, i64 2
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i64
  %70 = add nuw nsw i64 %48, %42
  %71 = add nuw nsw i64 %70, %55
  %72 = add nuw nsw i64 %71, %58
  %73 = add nuw nsw i64 %72, %60
  %74 = add nuw nsw i64 %73, %63
  %75 = add nuw nsw i64 %74, %66
  %76 = add i64 %75, %69
  %sext = shl i64 %76, 32
  %77 = ashr exact i64 %sext, 31
  %78 = getelementptr inbounds i8, i8* %38, i64 2
  %79 = load i8, i8* %78, align 1
  %80 = zext i8 %79 to i64
  %81 = getelementptr inbounds i8, i8* %40, i64 2
  %82 = load i8, i8* %81, align 1
  %83 = zext i8 %82 to i64
  %84 = add nuw nsw i64 %60, %55
  %85 = add nuw nsw i64 %84, %80
  %86 = add nuw nsw i64 %85, %83
  %87 = add nsw i64 %86, %77
  %88 = mul nsw i64 %53, %19
  %89 = mul nsw i64 %87, %20
  %90 = add i64 %88, 32768
  %91 = add i64 %90, %89
  %92 = lshr i64 %91, 16
  %93 = trunc i64 %92 to i8
  store i8 %93, i8* %30, align 1
  br label %94

; <label>:94:                                     ; preds = %126, %28
  %.pn = phi i8* [ %35, %28 ], [ %.07, %126 ]
  %.pn8 = phi i8* [ %32, %28 ], [ %.06, %126 ]
  %.pn9 = phi i8* [ %38, %28 ], [ %.05, %126 ]
  %.04 = phi i32 [ %25, %28 ], [ %162, %126 ]
  %.pn10 = phi i8* [ %40, %28 ], [ %.01, %126 ]
  %.pn13 = phi i8* [ %30, %28 ], [ %.0, %126 ]
  %.0 = getelementptr inbounds i8, i8* %.pn13, i64 1
  %.01 = getelementptr inbounds i8, i8* %.pn10, i64 2
  %.05 = getelementptr inbounds i8, i8* %.pn9, i64 2
  %.06 = getelementptr inbounds i8, i8* %.pn8, i64 2
  %.07 = getelementptr inbounds i8, i8* %.pn, i64 2
  %95 = icmp eq i32 %.04, 0
  %96 = load i8, i8* %.06, align 1
  %97 = zext i8 %96 to i64
  %98 = getelementptr inbounds i8, i8* %.pn8, i64 3
  %99 = load i8, i8* %98, align 1
  %100 = zext i8 %99 to i64
  %101 = add nuw nsw i64 %100, %97
  %102 = load i8, i8* %.07, align 1
  %103 = zext i8 %102 to i64
  %104 = add nuw nsw i64 %101, %103
  %105 = getelementptr inbounds i8, i8* %.pn, i64 3
  %106 = load i8, i8* %105, align 1
  %107 = zext i8 %106 to i64
  %108 = add nuw nsw i64 %104, %107
  %109 = load i8, i8* %.05, align 1
  %110 = zext i8 %109 to i64
  %111 = getelementptr inbounds i8, i8* %.pn9, i64 3
  %112 = load i8, i8* %111, align 1
  %113 = zext i8 %112 to i64
  %114 = add nuw nsw i64 %113, %110
  %115 = load i8, i8* %.01, align 1
  %116 = zext i8 %115 to i64
  %117 = add nuw nsw i64 %114, %116
  %118 = getelementptr inbounds i8, i8* %.pn10, i64 3
  %119 = load i8, i8* %118, align 1
  %120 = zext i8 %119 to i64
  %121 = add nuw nsw i64 %117, %120
  %122 = getelementptr inbounds i8, i8* %.pn8, i64 1
  %123 = load i8, i8* %122, align 1
  %124 = zext i8 %123 to i64
  %125 = add nuw nsw i64 %121, %124
  br i1 %95, label %163, label %126

; <label>:126:                                    ; preds = %94
  %127 = getelementptr inbounds i8, i8* %.pn8, i64 4
  %128 = load i8, i8* %127, align 1
  %129 = zext i8 %128 to i64
  %130 = add nuw nsw i64 %129, %125
  %131 = getelementptr inbounds i8, i8* %.pn, i64 1
  %132 = load i8, i8* %131, align 1
  %133 = zext i8 %132 to i64
  %134 = add nuw nsw i64 %130, %133
  %135 = getelementptr inbounds i8, i8* %.pn, i64 4
  %136 = load i8, i8* %135, align 1
  %137 = zext i8 %136 to i64
  %138 = add i64 %134, %137
  %sext12 = shl i64 %138, 32
  %139 = ashr exact i64 %sext12, 31
  %140 = getelementptr inbounds i8, i8* %.pn9, i64 1
  %141 = load i8, i8* %140, align 1
  %142 = zext i8 %141 to i64
  %143 = getelementptr inbounds i8, i8* %.pn9, i64 4
  %144 = load i8, i8* %143, align 1
  %145 = zext i8 %144 to i64
  %146 = add nuw nsw i64 %145, %142
  %147 = getelementptr inbounds i8, i8* %.pn10, i64 1
  %148 = load i8, i8* %147, align 1
  %149 = zext i8 %148 to i64
  %150 = add nuw nsw i64 %146, %149
  %151 = getelementptr inbounds i8, i8* %.pn10, i64 4
  %152 = load i8, i8* %151, align 1
  %153 = zext i8 %152 to i64
  %154 = add nsw i64 %150, %139
  %155 = add nsw i64 %154, %153
  %156 = mul nsw i64 %108, %19
  %157 = mul nsw i64 %155, %20
  %158 = add i64 %156, 32768
  %159 = add i64 %158, %157
  %160 = lshr i64 %159, 16
  %161 = trunc i64 %160 to i8
  store i8 %161, i8* %.0, align 1
  %162 = add i32 %.04, -1
  br label %94

; <label>:163:                                    ; preds = %94
  %scevgep28 = getelementptr i8, i8* %30, i64 %27
  %sunkaddr60 = ptrtoint i8* %35 to i64
  %sunkaddr62 = add i64 %sunkaddr60, %sunkaddr61
  %sunkaddr63 = add i64 %sunkaddr62, 1
  %sunkaddr64 = inttoptr i64 %sunkaddr63 to i8*
  %164 = load i8, i8* %sunkaddr64, align 1
  %165 = zext i8 %164 to i64
  %166 = add nuw nsw i64 %107, %100
  %167 = add nuw nsw i64 %166, %125
  %168 = add nuw nsw i64 %167, %165
  %sext11 = shl i64 %168, 32
  %169 = ashr exact i64 %sext11, 31
  %sunkaddr = ptrtoint i8* %38 to i64
  %sunkaddr66 = add i64 %sunkaddr, %sunkaddr65
  %sunkaddr67 = add i64 %sunkaddr66, 1
  %sunkaddr68 = inttoptr i64 %sunkaddr67 to i8*
  %170 = load i8, i8* %sunkaddr68, align 1
  %171 = zext i8 %170 to i64
  %sunkaddr69 = ptrtoint i8* %40 to i64
  %sunkaddr71 = add i64 %sunkaddr69, %sunkaddr70
  %sunkaddr72 = add i64 %sunkaddr71, 1
  %sunkaddr73 = inttoptr i64 %sunkaddr72 to i8*
  %172 = load i8, i8* %sunkaddr73, align 1
  %173 = zext i8 %172 to i64
  %174 = add nuw nsw i64 %120, %113
  %175 = add nuw nsw i64 %174, %171
  %176 = add nuw nsw i64 %175, %173
  %177 = add nsw i64 %176, %169
  %178 = mul nsw i64 %108, %19
  %179 = mul nsw i64 %177, %20
  %180 = add i64 %178, 32768
  %181 = add i64 %180, %179
  %182 = lshr i64 %181, 16
  %183 = trunc i64 %182 to i8
  store i8 %183, i8* %scevgep28, align 1
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %184 = load i32, i32* %sunkaddr76, align 4
  %185 = sext i32 %184 to i64
  %186 = icmp slt i64 %indvars.iv.next30, %185
  br i1 %186, label %28, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %163
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @h2v2_downsample(%struct.jpeg_compress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i8** nocapture readonly, i8** nocapture readonly) #2 {
  %5 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 7
  %6 = load i32, i32* %5, align 4
  %7 = shl i32 %6, 3
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %9 = load i32, i32* %8, align 4
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %11 = load i32, i32* %10, align 8
  %12 = shl i32 %6, 4
  tail call fastcc void @expand_right_edge(i8** %2, i32 %9, i32 %11, i32 %12)
  %13 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 3
  %14 = load i32, i32* %13, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %.lr.ph15, label %._crit_edge16

.lr.ph15:                                         ; preds = %4
  %16 = icmp eq i32 %7, 0
  br i1 %16, label %.lr.ph15.split.preheader, label %.lr.ph15.split.us.preheader

.lr.ph15.split.us.preheader:                      ; preds = %.lr.ph15
  %sunkaddr29 = ptrtoint %struct.jpeg_component_info* %1 to i64
  %sunkaddr30 = add i64 %sunkaddr29, 12
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to i32*
  br label %.lr.ph15.split.us

.lr.ph15.split.preheader:                         ; preds = %.lr.ph15
  %sunkaddr = ptrtoint %struct.jpeg_component_info* %1 to i64
  %sunkaddr27 = add i64 %sunkaddr, 12
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i32*
  %17 = load i32, i32* %sunkaddr28, align 4
  br label %.lr.ph15.split

.lr.ph15.split.us:                                ; preds = %.lr.ph15.split.us.preheader, %._crit_edge.us
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge.us ], [ 0, %.lr.ph15.split.us.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us ], [ 0, %.lr.ph15.split.us.preheader ]
  %18 = getelementptr inbounds i8*, i8** %3, i64 %indvars.iv18
  %19 = load i8*, i8** %18, align 8
  %20 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv
  %21 = load i8*, i8** %20, align 8
  %22 = or i64 %indvars.iv, 1
  %23 = getelementptr inbounds i8*, i8** %2, i64 %22
  %24 = load i8*, i8** %23, align 8
  br label %25

; <label>:25:                                     ; preds = %25, %.lr.ph15.split.us
  %.011.us = phi i32 [ 1, %.lr.ph15.split.us ], [ %44, %25 ]
  %.0110.us = phi i8* [ %19, %.lr.ph15.split.us ], [ %45, %25 ]
  %.029.us = phi i8* [ %24, %.lr.ph15.split.us ], [ %42, %25 ]
  %.038.us = phi i8* [ %21, %.lr.ph15.split.us ], [ %43, %25 ]
  %.067.us = phi i32 [ 0, %.lr.ph15.split.us ], [ %46, %25 ]
  %26 = load i8, i8* %.038.us, align 1
  %27 = zext i8 %26 to i32
  %28 = getelementptr inbounds i8, i8* %.038.us, i64 1
  %29 = load i8, i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = load i8, i8* %.029.us, align 1
  %32 = zext i8 %31 to i32
  %33 = getelementptr inbounds i8, i8* %.029.us, i64 1
  %34 = load i8, i8* %33, align 1
  %35 = zext i8 %34 to i32
  %36 = add i32 %27, %.011.us
  %37 = add i32 %36, %30
  %38 = add i32 %37, %32
  %39 = add i32 %38, %35
  %40 = lshr i32 %39, 2
  %41 = trunc i32 %40 to i8
  store i8 %41, i8* %.0110.us, align 1
  %42 = getelementptr inbounds i8, i8* %.029.us, i64 2
  %43 = getelementptr inbounds i8, i8* %.038.us, i64 2
  %44 = xor i32 %.011.us, 3
  %45 = getelementptr inbounds i8, i8* %.0110.us, i64 1
  %46 = add nuw i32 %.067.us, 1
  %exitcond = icmp eq i32 %46, %7
  br i1 %exitcond, label %._crit_edge.us, label %25

._crit_edge.us:                                   ; preds = %25
  %indvars.iv.next = add nuw i64 %indvars.iv, 2
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %47 = load i32, i32* %sunkaddr31, align 4
  %48 = sext i32 %47 to i64
  %49 = icmp slt i64 %indvars.iv.next19, %48
  br i1 %49, label %.lr.ph15.split.us, label %._crit_edge16.loopexit33

.lr.ph15.split:                                   ; preds = %.lr.ph15.split, %.lr.ph15.split.preheader
  %.0512 = phi i32 [ %50, %.lr.ph15.split ], [ 0, %.lr.ph15.split.preheader ]
  %50 = add nuw nsw i32 %.0512, 1
  %51 = icmp slt i32 %50, %17
  br i1 %51, label %.lr.ph15.split, label %._crit_edge16.loopexit

._crit_edge16.loopexit:                           ; preds = %.lr.ph15.split
  br label %._crit_edge16

._crit_edge16.loopexit33:                         ; preds = %._crit_edge.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit33, %._crit_edge16.loopexit, %4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @int_downsample(%struct.jpeg_compress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i8** nocapture readonly, i8** nocapture readonly) #2 {
  %5 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 7
  %6 = load i32, i32* %5, align 4
  %7 = shl i32 %6, 3
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 38
  %9 = load i32, i32* %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 2
  %11 = load i32, i32* %10, align 8
  %12 = sdiv i32 %9, %11
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %14 = load i32, i32* %13, align 4
  %15 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 3
  %16 = load i32, i32* %15, align 4
  %17 = sdiv i32 %14, %16
  %18 = mul nsw i32 %17, %12
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %20 = load i32, i32* %19, align 8
  %21 = mul i32 %12, %7
  tail call fastcc void @expand_right_edge(i8** %2, i32 %14, i32 %20, i32 %21)
  %22 = load i32, i32* %15, align 4
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %.lr.ph25, label %._crit_edge26

.lr.ph25:                                         ; preds = %4
  %24 = sdiv i32 %18, 2
  %25 = sext i32 %24 to i64
  %26 = sext i32 %18 to i64
  %27 = add i32 %12, -1
  %28 = sext i32 %17 to i64
  %xtraiter = and i32 %12, 3
  %wide.trip.count = zext i32 %17 to i64
  %29 = add nsw i32 %xtraiter, -1
  %30 = zext i32 %29 to i64
  %31 = add nuw nsw i64 %30, 1
  %32 = add i32 %12, -4
  %33 = add i32 %7, -4
  %34 = lshr exact i32 %33, 2
  %35 = add nuw nsw i32 %34, 1
  %36 = icmp eq i32 %7, 0
  %sunkaddr65 = ptrtoint %struct.jpeg_component_info* %1 to i64
  %sunkaddr66 = add i64 %sunkaddr65, 12
  %sunkaddr67 = inttoptr i64 %sunkaddr66 to i32*
  %37 = icmp sgt i32 %17, 0
  %38 = icmp sgt i32 %12, 0
  %39 = icmp eq i32 %xtraiter, 0
  %40 = icmp ult i32 %27, 3
  %xtraiter91 = and i32 %35, 2
  %lcmp.mod = icmp eq i32 %xtraiter91, 0
  %41 = icmp ult i32 %33, 12
  br label %42

; <label>:42:                                     ; preds = %._crit_edge20, %.lr.ph25
  %indvars.iv45 = phi i64 [ 0, %.lr.ph25 ], [ %indvars.iv.next46, %._crit_edge20 ]
  %indvars.iv43 = phi i64 [ 0, %.lr.ph25 ], [ %indvars.iv.next44, %._crit_edge20 ]
  %43 = getelementptr inbounds i8*, i8** %3, i64 %indvars.iv45
  %44 = load i8*, i8** %43, align 8
  br i1 %36, label %._crit_edge20, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %42
  br i1 %37, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %45 = sdiv i64 %25, %26
  %46 = trunc i64 %45 to i8
  %47 = sdiv i64 %25, %26
  %48 = trunc i64 %47 to i8
  %49 = sdiv i64 %25, %26
  %50 = trunc i64 %49 to i8
  %51 = sdiv i64 %25, %26
  %52 = trunc i64 %51 to i8
  br i1 %lcmp.mod, label %.preheader.prol.loopexit, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.preheader.preheader
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol, %.preheader.prol.preheader
  %.0119.prol = phi i8* [ %56, %.preheader.prol ], [ %44, %.preheader.prol.preheader ]
  %.0617.prol = phi i32 [ %57, %.preheader.prol ], [ 0, %.preheader.prol.preheader ]
  %prol.iter92 = phi i32 [ %prol.iter92.sub, %.preheader.prol ], [ %xtraiter91, %.preheader.prol.preheader ]
  store i8 %46, i8* %.0119.prol, align 1
  %53 = getelementptr inbounds i8, i8* %.0119.prol, i64 1
  store i8 %48, i8* %53, align 1
  %54 = getelementptr inbounds i8, i8* %.0119.prol, i64 2
  store i8 %50, i8* %54, align 1
  %55 = getelementptr inbounds i8, i8* %.0119.prol, i64 3
  store i8 %52, i8* %55, align 1
  %56 = getelementptr inbounds i8, i8* %.0119.prol, i64 4
  %57 = add i32 %.0617.prol, 4
  %prol.iter92.sub = add i32 %prol.iter92, -1
  %prol.iter92.cmp = icmp eq i32 %prol.iter92.sub, 0
  br i1 %prol.iter92.cmp, label %.preheader.prol.loopexit.unr-lcssa, label %.preheader.prol, !llvm.loop !10

.preheader.prol.loopexit.unr-lcssa:               ; preds = %.preheader.prol
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.preheader, %.preheader.prol.loopexit.unr-lcssa
  %.0119.unr = phi i8* [ %44, %.preheader.preheader ], [ %56, %.preheader.prol.loopexit.unr-lcssa ]
  %.0617.unr = phi i32 [ 0, %.preheader.preheader ], [ %57, %.preheader.prol.loopexit.unr-lcssa ]
  br i1 %41, label %._crit_edge20.loopexit86, label %.preheader.preheader.new

.preheader.preheader.new:                         ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge15.us
  %indvars.iv61 = phi i32 [ %indvars.iv.next62, %._crit_edge15.us ], [ 0, %.preheader.us.preheader ]
  %.0119.us = phi i8* [ %63, %._crit_edge15.us ], [ %44, %.preheader.us.preheader ]
  %.0617.us = phi i32 [ %64, %._crit_edge15.us ], [ 0, %.preheader.us.preheader ]
  %58 = zext i32 %indvars.iv61 to i64
  %59 = zext i32 %indvars.iv61 to i64
  br i1 %38, label %.lr.ph.us.us.preheader, label %._crit_edge15.us

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  br label %.lr.ph.us.us

._crit_edge15.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit, %.preheader.us
  %split16.us = phi i64 [ 0, %.preheader.us ], [ %.lcssa, %._crit_edge15.us.loopexit ]
  %60 = add nsw i64 %split16.us, %25
  %61 = sdiv i64 %60, %26
  %62 = trunc i64 %61 to i8
  store i8 %62, i8* %.0119.us, align 1
  %63 = getelementptr inbounds i8, i8* %.0119.us, i64 1
  %64 = add nuw i32 %.0617.us, 1
  %indvars.iv.next62 = add i32 %indvars.iv61, %12
  %exitcond42 = icmp eq i32 %64, %7
  br i1 %exitcond42, label %._crit_edge20.loopexit, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %.013.us.us = phi i64 [ %.lcssa, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %65 = add nsw i64 %indvars.iv, %indvars.iv43
  %66 = getelementptr inbounds i8*, i8** %2, i64 %65
  %67 = load i8*, i8** %66, align 8
  %68 = getelementptr inbounds i8, i8* %67, i64 %59
  br i1 %39, label %.prol.loopexit, label %.lr.ph.us.us..prol.preheader_crit_edge

.lr.ph.us.us..prol.preheader_crit_edge:           ; preds = %.lr.ph.us.us
  %scevgep = getelementptr i8, i8* %67, i64 %31
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader, %.lr.ph.us.us..prol.preheader_crit_edge
  %.111.us.us.prol = phi i64 [ %71, %.prol.preheader ], [ %.013.us.us, %.lr.ph.us.us..prol.preheader_crit_edge ]
  %.0210.us.us.prol = phi i8* [ %72, %.prol.preheader ], [ %68, %.lr.ph.us.us..prol.preheader_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.lr.ph.us.us..prol.preheader_crit_edge ]
  %69 = load i8, i8* %.0210.us.us.prol, align 1
  %70 = zext i8 %69 to i64
  %71 = add nsw i64 %70, %.111.us.us.prol
  %72 = getelementptr inbounds i8, i8* %.0210.us.us.prol, i64 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.preheader..prol.loopexit_crit_edge, label %.prol.preheader, !llvm.loop !12

.prol.preheader..prol.loopexit_crit_edge:         ; preds = %.prol.preheader
  %scevgep63 = getelementptr i8, i8* %scevgep, i64 %58
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %.prol.preheader..prol.loopexit_crit_edge
  %.111.us.us.unr = phi i64 [ %71, %.prol.preheader..prol.loopexit_crit_edge ], [ %.013.us.us, %.lr.ph.us.us ]
  %.0210.us.us.unr = phi i8* [ %scevgep63, %.prol.preheader..prol.loopexit_crit_edge ], [ %68, %.lr.ph.us.us ]
  %.089.us.us.unr = phi i32 [ %xtraiter, %.prol.preheader..prol.loopexit_crit_edge ], [ 0, %.lr.ph.us.us ]
  %.lcssa.unr = phi i64 [ %71, %.prol.preheader..prol.loopexit_crit_edge ], [ undef, %.lr.ph.us.us ]
  br i1 %40, label %._crit_edge.us.us, label %.prol.loopexit..lr.ph.us.us.new_crit_edge

.prol.loopexit..lr.ph.us.us.new_crit_edge:        ; preds = %.prol.loopexit
  %73 = sub i32 %32, %.089.us.us.unr
  %74 = lshr i32 %73, 2
  %addconv = add nuw nsw i32 %74, 1
  %min.iters.check = icmp ult i32 %addconv, 4
  br i1 %min.iters.check, label %.lr.ph.us.us.new.preheader, label %min.iters.checked

.lr.ph.us.us.new.preheader:                       ; preds = %middle.block, %min.iters.checked, %.prol.loopexit..lr.ph.us.us.new_crit_edge
  %.111.us.us.ph = phi i64 [ %.111.us.us.unr, %min.iters.checked ], [ %.111.us.us.unr, %.prol.loopexit..lr.ph.us.us.new_crit_edge ], [ %102, %middle.block ]
  %.0210.us.us.ph = phi i8* [ %.0210.us.us.unr, %min.iters.checked ], [ %.0210.us.us.unr, %.prol.loopexit..lr.ph.us.us.new_crit_edge ], [ %ind.end, %middle.block ]
  %.089.us.us.ph = phi i32 [ %.089.us.us.unr, %min.iters.checked ], [ %.089.us.us.unr, %.prol.loopexit..lr.ph.us.us.new_crit_edge ], [ %ind.end73, %middle.block ]
  br label %.lr.ph.us.us.new

min.iters.checked:                                ; preds = %.prol.loopexit..lr.ph.us.us.new_crit_edge
  %75 = zext i32 %addconv to i64
  %76 = and i32 %addconv, 3
  %n.mod.vf = zext i32 %76 to i64
  %n.vec = sub nsw i64 %75, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %77 = shl nsw i64 %n.vec, 2
  %ind.end = getelementptr i8, i8* %.0210.us.us.unr, i64 %77
  %cast.crd = trunc i64 %n.vec to i32
  %78 = shl i32 %cast.crd, 2
  %ind.end73 = or i32 %.089.us.us.unr, %78
  br i1 %cmp.zero, label %.lr.ph.us.us.new.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %79 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %.111.us.us.unr, i32 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <2 x i64> [ %79, %vector.ph ], [ %99, %vector.body ]
  %vec.phi74 = phi <2 x i64> [ zeroinitializer, %vector.ph ], [ %100, %vector.body ]
  %80 = shl i64 %index, 2
  %next.gep = getelementptr i8, i8* %.0210.us.us.unr, i64 %80
  %81 = shl i64 %index, 2
  %82 = or i64 %81, 8
  %next.gep75 = getelementptr i8, i8* %.0210.us.us.unr, i64 %82
  %83 = bitcast i8* %next.gep to <8 x i8>*
  %84 = bitcast i8* %next.gep75 to <8 x i8>*
  %wide.vec = load <8 x i8>, <8 x i8>* %83, align 1
  %wide.vec77 = load <8 x i8>, <8 x i8>* %84, align 1
  %strided.vec = shufflevector <8 x i8> %wide.vec, <8 x i8> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec78 = shufflevector <8 x i8> %wide.vec77, <8 x i8> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec79 = shufflevector <8 x i8> %wide.vec, <8 x i8> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec80 = shufflevector <8 x i8> %wide.vec77, <8 x i8> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec81 = shufflevector <8 x i8> %wide.vec, <8 x i8> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec82 = shufflevector <8 x i8> %wide.vec77, <8 x i8> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec83 = shufflevector <8 x i8> %wide.vec, <8 x i8> undef, <2 x i32> <i32 3, i32 7>
  %strided.vec84 = shufflevector <8 x i8> %wide.vec77, <8 x i8> undef, <2 x i32> <i32 3, i32 7>
  %85 = zext <2 x i8> %strided.vec to <2 x i64>
  %86 = zext <2 x i8> %strided.vec78 to <2 x i64>
  %87 = add nsw <2 x i64> %85, %vec.phi
  %88 = add nsw <2 x i64> %86, %vec.phi74
  %89 = zext <2 x i8> %strided.vec79 to <2 x i64>
  %90 = zext <2 x i8> %strided.vec80 to <2 x i64>
  %91 = add nsw <2 x i64> %89, %87
  %92 = add nsw <2 x i64> %90, %88
  %93 = zext <2 x i8> %strided.vec81 to <2 x i64>
  %94 = zext <2 x i8> %strided.vec82 to <2 x i64>
  %95 = add nsw <2 x i64> %93, %91
  %96 = add nsw <2 x i64> %94, %92
  %97 = zext <2 x i8> %strided.vec83 to <2 x i64>
  %98 = zext <2 x i8> %strided.vec84 to <2 x i64>
  %99 = add nsw <2 x i64> %97, %95
  %100 = add nsw <2 x i64> %98, %96
  %index.next = add i64 %index, 4
  %101 = icmp eq i64 %index.next, %n.vec
  br i1 %101, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <2 x i64> %100, %99
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx85 = add <2 x i64> %bin.rdx, %rdx.shuf
  %102 = extractelement <2 x i64> %bin.rdx85, i32 0
  %cmp.n = icmp eq i32 %76, 0
  br i1 %cmp.n, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %middle.block, %.prol.loopexit
  %.lcssa = phi i64 [ %.lcssa.unr, %.prol.loopexit ], [ %102, %middle.block ], [ %117, %._crit_edge.us.us.loopexit ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge15.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %.111.us.us = phi i64 [ %117, %.lr.ph.us.us.new ], [ %.111.us.us.ph, %.lr.ph.us.us.new.preheader ]
  %.0210.us.us = phi i8* [ %118, %.lr.ph.us.us.new ], [ %.0210.us.us.ph, %.lr.ph.us.us.new.preheader ]
  %.089.us.us = phi i32 [ %119, %.lr.ph.us.us.new ], [ %.089.us.us.ph, %.lr.ph.us.us.new.preheader ]
  %103 = load i8, i8* %.0210.us.us, align 1
  %104 = zext i8 %103 to i64
  %105 = add nsw i64 %104, %.111.us.us
  %106 = getelementptr inbounds i8, i8* %.0210.us.us, i64 1
  %107 = load i8, i8* %106, align 1
  %108 = zext i8 %107 to i64
  %109 = add nsw i64 %108, %105
  %110 = getelementptr inbounds i8, i8* %.0210.us.us, i64 2
  %111 = load i8, i8* %110, align 1
  %112 = zext i8 %111 to i64
  %113 = add nsw i64 %112, %109
  %114 = getelementptr inbounds i8, i8* %.0210.us.us, i64 3
  %115 = load i8, i8* %114, align 1
  %116 = zext i8 %115 to i64
  %117 = add nsw i64 %116, %113
  %118 = getelementptr inbounds i8, i8* %.0210.us.us, i64 4
  %119 = add nuw nsw i32 %.089.us.us, 4
  %exitcond.341 = icmp eq i32 %119, %12
  br i1 %exitcond.341, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new, !llvm.loop !14

.preheader:                                       ; preds = %.preheader, %.preheader.preheader.new
  %.0119 = phi i8* [ %.0119.unr, %.preheader.preheader.new ], [ %135, %.preheader ]
  %.0617 = phi i32 [ %.0617.unr, %.preheader.preheader.new ], [ %136, %.preheader ]
  store i8 %46, i8* %.0119, align 1
  %120 = getelementptr inbounds i8, i8* %.0119, i64 1
  store i8 %48, i8* %120, align 1
  %121 = getelementptr inbounds i8, i8* %.0119, i64 2
  store i8 %50, i8* %121, align 1
  %122 = getelementptr inbounds i8, i8* %.0119, i64 3
  store i8 %52, i8* %122, align 1
  %123 = getelementptr inbounds i8, i8* %.0119, i64 4
  store i8 %46, i8* %123, align 1
  %124 = getelementptr inbounds i8, i8* %.0119, i64 5
  store i8 %48, i8* %124, align 1
  %125 = getelementptr inbounds i8, i8* %.0119, i64 6
  store i8 %50, i8* %125, align 1
  %126 = getelementptr inbounds i8, i8* %.0119, i64 7
  store i8 %52, i8* %126, align 1
  %127 = getelementptr inbounds i8, i8* %.0119, i64 8
  store i8 %46, i8* %127, align 1
  %128 = getelementptr inbounds i8, i8* %.0119, i64 9
  store i8 %48, i8* %128, align 1
  %129 = getelementptr inbounds i8, i8* %.0119, i64 10
  store i8 %50, i8* %129, align 1
  %130 = getelementptr inbounds i8, i8* %.0119, i64 11
  store i8 %52, i8* %130, align 1
  %131 = getelementptr inbounds i8, i8* %.0119, i64 12
  store i8 %46, i8* %131, align 1
  %132 = getelementptr inbounds i8, i8* %.0119, i64 13
  store i8 %48, i8* %132, align 1
  %133 = getelementptr inbounds i8, i8* %.0119, i64 14
  store i8 %50, i8* %133, align 1
  %134 = getelementptr inbounds i8, i8* %.0119, i64 15
  store i8 %52, i8* %134, align 1
  %135 = getelementptr inbounds i8, i8* %.0119, i64 16
  %136 = add i32 %.0617, 16
  %exitcond.3.3 = icmp eq i32 %136, %7
  br i1 %exitcond.3.3, label %._crit_edge20.loopexit86.unr-lcssa, label %.preheader

._crit_edge20.loopexit:                           ; preds = %._crit_edge15.us
  br label %._crit_edge20

._crit_edge20.loopexit86.unr-lcssa:               ; preds = %.preheader
  br label %._crit_edge20.loopexit86

._crit_edge20.loopexit86:                         ; preds = %.preheader.prol.loopexit, %._crit_edge20.loopexit86.unr-lcssa
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit86, %._crit_edge20.loopexit, %42
  %indvars.iv.next44 = add i64 %indvars.iv43, %28
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %137 = load i32, i32* %sunkaddr67, align 4
  %138 = sext i32 %137 to i64
  %139 = icmp slt i64 %indvars.iv.next46, %138
  br i1 %139, label %42, label %._crit_edge26.loopexit

._crit_edge26.loopexit:                           ; preds = %._crit_edge20
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @expand_right_edge(i8** nocapture readonly, i32, i32, i32) unnamed_addr #2 {
  %5 = sub i32 %3, %2
  %6 = icmp sgt i32 %5, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.lr.ph6.split.us.preheader, label %.loopexit

.lr.ph6.split.us.preheader:                       ; preds = %4
  %8 = zext i32 %2 to i64
  %9 = add i32 %2, -1
  %10 = sub i32 %9, %3
  %11 = icmp sgt i32 %10, -2
  %smax = select i1 %11, i32 %10, i32 -2
  %12 = add i32 %smax, %3
  %13 = add i32 %12, 1
  %14 = sub i32 %13, %2
  %15 = zext i32 %14 to i64
  %16 = add nuw nsw i64 %15, 1
  %17 = add i32 %1, -1
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph6.split.us.prol.loopexit, label %.lr.ph6.split.us.preheader.._crit_edge.us.prol_crit_edge

.lr.ph6.split.us.preheader.._crit_edge.us.prol_crit_edge: ; preds = %.lr.ph6.split.us.preheader
  %18 = add nsw i32 %xtraiter, -1
  %19 = zext i32 %18 to i64
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol, %.lr.ph6.split.us.preheader.._crit_edge.us.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge.us.prol ], [ 0, %.lr.ph6.split.us.preheader.._crit_edge.us.prol_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %.lr.ph6.split.us.preheader.._crit_edge.us.prol_crit_edge ]
  %20 = getelementptr inbounds i8*, i8** %0, i64 %indvars.iv.prol
  %21 = load i8*, i8** %20, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 %8
  %23 = getelementptr inbounds i8, i8* %22, i64 -1
  %24 = load i8, i8* %23, align 1
  call void @llvm.memset.p0i8.i64(i8* %22, i8 %24, i64 %16, i32 1, i1 false)
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge.us.prol..lr.ph6.split.us.prol.loopexit_crit_edge, label %._crit_edge.us.prol, !llvm.loop !16

._crit_edge.us.prol..lr.ph6.split.us.prol.loopexit_crit_edge: ; preds = %._crit_edge.us.prol
  %25 = add nuw nsw i64 %19, 1
  br label %.lr.ph6.split.us.prol.loopexit

.lr.ph6.split.us.prol.loopexit:                   ; preds = %.lr.ph6.split.us.preheader, %._crit_edge.us.prol..lr.ph6.split.us.prol.loopexit_crit_edge
  %indvars.iv.unr = phi i64 [ %25, %._crit_edge.us.prol..lr.ph6.split.us.prol.loopexit_crit_edge ], [ 0, %.lr.ph6.split.us.preheader ]
  %26 = icmp ult i32 %17, 3
  br i1 %26, label %.loopexit, label %._crit_edge.us.3.preheader

._crit_edge.us.3.preheader:                       ; preds = %.lr.ph6.split.us.prol.loopexit
  %wide.trip.count.3 = zext i32 %1 to i64
  br label %._crit_edge.us.3

.loopexit.loopexit:                               ; preds = %._crit_edge.us.3
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.lr.ph6.split.us.prol.loopexit, %4
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %._crit_edge.us.3 ], [ %indvars.iv.unr, %._crit_edge.us.3.preheader ]
  %27 = getelementptr inbounds i8*, i8** %0, i64 %indvars.iv
  %28 = load i8*, i8** %27, align 8
  %29 = getelementptr inbounds i8, i8* %28, i64 %8
  %30 = getelementptr inbounds i8, i8* %29, i64 -1
  %31 = load i8, i8* %30, align 1
  call void @llvm.memset.p0i8.i64(i8* %29, i8 %31, i64 %16, i32 1, i1 false)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %32 = getelementptr inbounds i8*, i8** %0, i64 %indvars.iv.next
  %33 = load i8*, i8** %32, align 8
  %34 = getelementptr inbounds i8, i8* %33, i64 %8
  %35 = getelementptr inbounds i8, i8* %34, i64 -1
  %36 = load i8, i8* %35, align 1
  call void @llvm.memset.p0i8.i64(i8* %34, i8 %36, i64 %16, i32 1, i1 false)
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %37 = getelementptr inbounds i8*, i8** %0, i64 %indvars.iv.next.1
  %38 = load i8*, i8** %37, align 8
  %39 = getelementptr inbounds i8, i8* %38, i64 %8
  %40 = getelementptr inbounds i8, i8* %39, i64 -1
  %41 = load i8, i8* %40, align 1
  call void @llvm.memset.p0i8.i64(i8* %39, i8 %41, i64 %16, i32 1, i1 false)
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %42 = getelementptr inbounds i8*, i8** %0, i64 %indvars.iv.next.2
  %43 = load i8*, i8** %42, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 %8
  %45 = getelementptr inbounds i8, i8* %44, i64 -1
  %46 = load i8, i8* %45, align 1
  call void @llvm.memset.p0i8.i64(i8* %44, i8 %46, i64 %16, i32 1, i1 false)
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %.loopexit.loopexit, label %._crit_edge.us.3
}

declare void @jcopy_sample_rows(i8**, i32, i8**, i32, i32, i32) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }

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
!13 = distinct !{!13, !7, !8}
!14 = distinct !{!14, !15, !7, !8}
!15 = !{!"llvm.loop.unroll.runtime.disable"}
!16 = distinct !{!16, !11}
