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
define void @jinit_downsampler(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %3 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %3, i64 0, i32 0
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
  br i1 %17, label %25, label %18

; <label>:18:                                     ; preds = %1
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 5
  store i32 23, i32* %21, align 8
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i64 0, i32 0
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  tail call void %24(%struct.jpeg_common_struct* %6) #5
  br label %25

; <label>:25:                                     ; preds = %1, %18
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %27 = load i32, i32* %26, align 4
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %.lr.ph, label %._crit_edge.thread

.lr.ph:                                           ; preds = %25
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %30 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 38
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 27
  %34 = getelementptr inbounds i8, i8* %7, i64 24
  %35 = bitcast i8* %34 to [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*]*
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %37 = getelementptr inbounds i8, i8* %7, i64 24
  %38 = bitcast i8* %37 to [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*]*
  %39 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %40 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 27
  %41 = getelementptr inbounds i8, i8* %7, i64 24
  %42 = bitcast i8* %41 to [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*]*
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %44 = getelementptr inbounds i8, i8* %7, i64 24
  %45 = bitcast i8* %44 to [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*]*
  %46 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  br label %47

; <label>:47:                                     ; preds = %.lr.ph, %111
  %.07 = phi i32 [ 1, %.lr.ph ], [ %.4, %111 ]
  %.015 = phi %struct.jpeg_component_info* [ %30, %.lr.ph ], [ %112, %111 ]
  %indvars.iv3 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %111 ]
  %48 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.015, i64 0, i32 2
  %49 = load i32, i32* %48, align 8
  %50 = load i32, i32* %31, align 8
  %51 = icmp eq i32 %49, %50
  br i1 %51, label %52, label %63

; <label>:52:                                     ; preds = %47
  %53 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.015, i64 0, i32 3
  %54 = load i32, i32* %53, align 4
  %55 = load i32, i32* %32, align 4
  %56 = icmp eq i32 %54, %55
  br i1 %56, label %57, label %63

; <label>:57:                                     ; preds = %52
  %58 = load i32, i32* %33, align 8
  %59 = icmp eq i32 %58, 0
  %60 = getelementptr inbounds [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*], [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*]* %35, i64 0, i64 %indvars.iv3
  br i1 %59, label %62, label %61

; <label>:61:                                     ; preds = %57
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @fullsize_smooth_downsample, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %60, align 8
  store i32 1, i32* %14, align 8
  br label %111

; <label>:62:                                     ; preds = %57
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @fullsize_downsample, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %60, align 8
  br label %111

; <label>:63:                                     ; preds = %52, %47
  %64 = load i32, i32* %48, align 8
  %65 = shl nsw i32 %64, 1
  %66 = load i32, i32* %31, align 8
  %67 = icmp eq i32 %65, %66
  br i1 %67, label %68, label %75

; <label>:68:                                     ; preds = %63
  %69 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.015, i64 0, i32 3
  %70 = load i32, i32* %69, align 4
  %71 = load i32, i32* %36, align 4
  %72 = icmp eq i32 %70, %71
  br i1 %72, label %73, label %75

; <label>:73:                                     ; preds = %68
  %74 = getelementptr inbounds [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*], [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*]* %38, i64 0, i64 %indvars.iv3
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @h2v1_downsample, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %74, align 8
  br label %111

; <label>:75:                                     ; preds = %68, %63
  %76 = load i32, i32* %48, align 8
  %77 = shl nsw i32 %76, 1
  %78 = load i32, i32* %31, align 8
  %79 = icmp eq i32 %77, %78
  br i1 %79, label %80, label %92

; <label>:80:                                     ; preds = %75
  %81 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.015, i64 0, i32 3
  %82 = load i32, i32* %81, align 4
  %83 = shl nsw i32 %82, 1
  %84 = load i32, i32* %39, align 4
  %85 = icmp eq i32 %83, %84
  br i1 %85, label %86, label %92

; <label>:86:                                     ; preds = %80
  %87 = load i32, i32* %40, align 8
  %88 = icmp eq i32 %87, 0
  %89 = getelementptr inbounds [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*], [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*]* %42, i64 0, i64 %indvars.iv3
  br i1 %88, label %91, label %90

; <label>:90:                                     ; preds = %86
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @h2v2_smooth_downsample, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %89, align 8
  store i32 1, i32* %14, align 8
  br label %111

; <label>:91:                                     ; preds = %86
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @h2v2_downsample, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %89, align 8
  br label %111

; <label>:92:                                     ; preds = %80, %75
  %93 = load i32, i32* %31, align 8
  %94 = load i32, i32* %48, align 8
  %95 = srem i32 %93, %94
  %96 = icmp eq i32 %95, 0
  br i1 %96, label %97, label %105

; <label>:97:                                     ; preds = %92
  %98 = load i32, i32* %43, align 4
  %99 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.015, i64 0, i32 3
  %100 = load i32, i32* %99, align 4
  %101 = srem i32 %98, %100
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %103, label %105

; <label>:103:                                    ; preds = %97
  %104 = getelementptr inbounds [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*], [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*]* %45, i64 0, i64 %indvars.iv3
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @int_downsample, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %104, align 8
  br label %111

; <label>:105:                                    ; preds = %97, %92
  %106 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %107 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %106, i64 0, i32 5
  store i32 37, i32* %107, align 8
  %108 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %109 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %108, i64 0, i32 0
  %110 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %109, align 8
  tail call void %110(%struct.jpeg_common_struct* nonnull %6) #5
  br label %111

; <label>:111:                                    ; preds = %62, %61, %91, %90, %105, %103, %73
  %.4 = phi i32 [ %.07, %62 ], [ %.07, %61 ], [ 0, %73 ], [ %.07, %91 ], [ %.07, %90 ], [ 0, %103 ], [ %.07, %105 ]
  %indvars.iv.next = add nuw i64 %indvars.iv3, 1
  %112 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.015, i64 1
  %113 = load i32, i32* %26, align 4
  %114 = sext i32 %113 to i64
  %115 = icmp slt i64 %indvars.iv.next, %114
  br i1 %115, label %47, label %._crit_edge

._crit_edge:                                      ; preds = %111
  %116 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 27
  %117 = load i32, i32* %116, align 8
  %118 = icmp eq i32 %117, 0
  %119 = icmp ne i32 %.4, 0
  %or.cond = or i1 %119, %118
  br i1 %or.cond, label %._crit_edge.thread, label %120

; <label>:120:                                    ; preds = %._crit_edge
  %121 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %122 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %121, align 8
  %123 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %122, i64 0, i32 5
  store i32 98, i32* %123, align 8
  %124 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %121, align 8
  %125 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %124, i64 0, i32 1
  %126 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %125, align 8
  tail call void %126(%struct.jpeg_common_struct* nonnull %6, i32 0) #5
  br label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %25, %._crit_edge, %120
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
  br label %15

; <label>:15:                                     ; preds = %.lr.ph, %15
  %.03 = phi %struct.jpeg_component_info* [ %13, %.lr.ph ], [ %28, %15 ]
  %indvars.iv2 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %15 ]
  %16 = getelementptr inbounds i8**, i8*** %1, i64 %indvars.iv2
  %17 = load i8**, i8*** %16, align 8
  %18 = getelementptr inbounds i8*, i8** %17, i64 %14
  %19 = getelementptr inbounds i8**, i8*** %3, i64 %indvars.iv2
  %20 = load i8**, i8*** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 3
  %22 = load i32, i32* %21, align 4
  %23 = mul i32 %22, %4
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i8*, i8** %20, i64 %24
  %26 = getelementptr inbounds %struct.my_downsampler, %struct.my_downsampler* %8, i64 0, i32 1, i64 %indvars.iv2
  %27 = load void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %26, align 8
  tail call void %27(%struct.jpeg_compress_struct* nonnull %0, %struct.jpeg_component_info* %.03, i8** %18, i8** %25) #5
  %indvars.iv.next = add nuw i64 %indvars.iv2, 1
  %28 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 1
  %29 = load i32, i32* %9, align 4
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
  tail call void @expand_right_edge(i8** %8, i32 %11, i32 %13, i32 %7)
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 27
  %15 = load i32, i32* %14, align 8
  %16 = sext i32 %15 to i64
  %17 = shl nsw i64 %16, 9
  %18 = sub nsw i64 65536, %17
  %19 = shl nsw i32 %15, 6
  %20 = sext i32 %19 to i64
  %21 = add i32 %7, -2
  %22 = or i32 %21, 1
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 3
  %25 = load i32, i32* %24, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %4
  %27 = add i32 %7, -2
  br label %28

; <label>:28:                                     ; preds = %.lr.ph, %94
  %indvars.iv20 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %94 ]
  %29 = getelementptr inbounds i8*, i8** %3, i64 %indvars.iv20
  %30 = load i8*, i8** %29, align 8
  %31 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv20
  %32 = load i8*, i8** %31, align 8
  %33 = add nsw i64 %indvars.iv20, -1
  %34 = getelementptr inbounds i8*, i8** %2, i64 %33
  %35 = load i8*, i8** %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv20, 1
  %36 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next
  %37 = load i8*, i8** %36, align 8
  %38 = getelementptr inbounds i8, i8* %35, i64 1
  %39 = load i8, i8* %35, align 1
  %40 = zext i8 %39 to i32
  %41 = getelementptr inbounds i8, i8* %37, i64 1
  %42 = load i8, i8* %37, align 1
  %43 = zext i8 %42 to i32
  %44 = add nuw nsw i32 %43, %40
  %45 = load i8, i8* %32, align 1
  %46 = zext i8 %45 to i32
  %47 = add nuw nsw i32 %44, %46
  %48 = getelementptr inbounds i8, i8* %32, i64 1
  %49 = zext i8 %45 to i64
  %50 = load i8, i8* %38, align 1
  %51 = zext i8 %50 to i32
  %52 = load i8, i8* %41, align 1
  %53 = zext i8 %52 to i32
  %54 = add nuw nsw i32 %53, %51
  %55 = load i8, i8* %48, align 1
  %56 = zext i8 %55 to i32
  %57 = add nuw nsw i32 %54, %56
  %58 = zext i32 %57 to i64
  %59 = shl nuw nsw i32 %47, 1
  %factor = zext i32 %59 to i64
  %60 = sub nsw i64 %factor, %49
  %61 = add nsw i64 %60, %58
  %62 = mul nsw i64 %49, %18
  %63 = mul nsw i64 %61, %20
  %64 = add i64 %62, 32768
  %65 = add i64 %64, %63
  %66 = lshr i64 %65, 16
  %67 = trunc i64 %66 to i8
  store i8 %67, i8* %30, align 1
  br label %68

; <label>:68:                                     ; preds = %28, %68
  %.pn = phi i8* [ %30, %28 ], [ %.0719, %68 ]
  %.018 = phi i32 [ %47, %28 ], [ %.0117, %68 ]
  %.0117 = phi i32 [ %57, %28 ], [ %81, %68 ]
  %.0316 = phi i32 [ %27, %28 ], [ %92, %68 ]
  %.0415 = phi i8* [ %48, %28 ], [ %69, %68 ]
  %.0514 = phi i8* [ %38, %28 ], [ %72, %68 ]
  %.0613 = phi i8* [ %41, %28 ], [ %73, %68 ]
  %.0719 = getelementptr inbounds i8, i8* %.pn, i64 1
  %69 = getelementptr inbounds i8, i8* %.0415, i64 1
  %70 = load i8, i8* %.0415, align 1
  %71 = zext i8 %70 to i64
  %72 = getelementptr inbounds i8, i8* %.0514, i64 1
  %73 = getelementptr inbounds i8, i8* %.0613, i64 1
  %74 = load i8, i8* %72, align 1
  %75 = zext i8 %74 to i32
  %76 = load i8, i8* %73, align 1
  %77 = zext i8 %76 to i32
  %78 = add nuw nsw i32 %77, %75
  %79 = load i8, i8* %69, align 1
  %80 = zext i8 %79 to i32
  %81 = add nuw nsw i32 %78, %80
  %82 = zext i32 %81 to i64
  %addconv = add nsw i32 %.018, %.0117
  %83 = sext i32 %addconv to i64
  %84 = sub nsw i64 %83, %71
  %85 = add nsw i64 %84, %82
  %86 = mul nsw i64 %71, %18
  %87 = mul nsw i64 %85, %20
  %88 = add i64 %86, 32768
  %89 = add i64 %88, %87
  %90 = lshr i64 %89, 16
  %91 = trunc i64 %90 to i8
  store i8 %91, i8* %.0719, align 1
  %92 = add i32 %.0316, -1
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %94, label %68

; <label>:94:                                     ; preds = %68
  %scevgep = getelementptr i8, i8* %30, i64 %23
  %scevgep8 = getelementptr i8, i8* %32, i64 %23
  %95 = load i8, i8* %scevgep8, align 1
  %96 = zext i8 %95 to i64
  %97 = sext i32 %.0117 to i64
  %98 = shl nuw nsw i32 %81, 1
  %factor11 = zext i32 %98 to i64
  %99 = add nsw i64 %factor11, %97
  %100 = sub nsw i64 %99, %96
  %101 = mul nsw i64 %96, %18
  %102 = mul nsw i64 %100, %20
  %103 = add i64 %101, 32768
  %104 = add i64 %103, %102
  %105 = lshr i64 %104, 16
  %106 = trunc i64 %105 to i8
  store i8 %106, i8* %scevgep, align 1
  %107 = load i32, i32* %24, align 4
  %108 = sext i32 %107 to i64
  %109 = icmp slt i64 %indvars.iv.next, %108
  br i1 %109, label %28, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %94
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
  tail call void @expand_right_edge(i8** %3, i32 %9, i32 %10, i32 %13)
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
  tail call void @expand_right_edge(i8** %2, i32 %9, i32 %11, i32 %12)
  %13 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 3
  %14 = load i32, i32* %13, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %.lr.ph12, label %._crit_edge13

.lr.ph12:                                         ; preds = %4
  %exitcond5 = icmp eq i32 %7, 0
  br i1 %exitcond5, label %.lr.ph12.split.us.preheader, label %.lr.ph12.split.preheader

.lr.ph12.split.preheader:                         ; preds = %.lr.ph12
  %16 = add i32 %7, -2
  %17 = lshr exact i32 %16, 1
  %addconv = add nuw i32 %17, 1
  %18 = zext i32 %addconv to i64
  %19 = zext i32 %17 to i64
  %20 = zext i32 %16 to i64
  %21 = add nuw nsw i64 %20, 2
  %22 = shl nuw nsw i64 %19, 2
  %23 = add nuw nsw i64 %22, 4
  %min.iters.check = icmp ult i32 %addconv, 16
  %24 = and i32 %addconv, 12
  %n.mod.vf = zext i32 %24 to i64
  %n.vec = sub nsw i64 %18, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %25 = shl nsw i64 %n.vec, 1
  %26 = shl nsw i64 %n.vec, 2
  %cast.crd = trunc i64 %n.vec to i32
  %ind.end21 = shl i32 %cast.crd, 1
  %cmp.n = icmp eq i32 %24, 0
  br label %.lr.ph12.split

.lr.ph12.split.us.preheader:                      ; preds = %.lr.ph12
  %27 = load i32, i32* %13, align 4
  %28 = sext i32 %27 to i64
  br label %.lr.ph12.split.us

.lr.ph12.split.us:                                ; preds = %.lr.ph12.split.us.preheader, %.lr.ph12.split.us
  %indvars.iv10.us = phi i64 [ %indvars.iv.next.us, %.lr.ph12.split.us ], [ 0, %.lr.ph12.split.us.preheader ]
  %indvars.iv.next.us = add nuw i64 %indvars.iv10.us, 1
  %29 = icmp slt i64 %indvars.iv.next.us, %28
  br i1 %29, label %.lr.ph12.split.us, label %._crit_edge13.loopexit

.lr.ph12.split:                                   ; preds = %.lr.ph12.split.preheader, %._crit_edge
  %indvars.iv10 = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph12.split.preheader ]
  %30 = getelementptr inbounds i8*, i8** %3, i64 %indvars.iv10
  %31 = load i8*, i8** %30, align 8
  %32 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv10
  %33 = load i8*, i8** %32, align 8
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph12.split
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i8, i8* %31, i64 %21
  %scevgep17 = getelementptr i8, i8* %33, i64 %23
  %bound0 = icmp ult i8* %31, %scevgep17
  %bound1 = icmp ult i8* %33, %scevgep
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = getelementptr i8, i8* %31, i64 %25
  %ind.end19 = getelementptr i8, i8* %33, i64 %26
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %34 = shl i64 %index, 1
  %next.gep = getelementptr i8, i8* %31, i64 %34
  %35 = shl i64 %index, 2
  %next.gep22 = getelementptr i8, i8* %33, i64 %35
  %36 = bitcast i8* %next.gep22 to <64 x i8>*
  %wide.vec = load <64 x i8>, <64 x i8>* %36, align 1, !alias.scope !1
  %strided.vec = shufflevector <64 x i8> %wide.vec, <64 x i8> undef, <16 x i32> <i32 0, i32 4, i32 8, i32 12, i32 16, i32 20, i32 24, i32 28, i32 32, i32 36, i32 40, i32 44, i32 48, i32 52, i32 56, i32 60>
  %strided.vec23 = shufflevector <64 x i8> %wide.vec, <64 x i8> undef, <16 x i32> <i32 1, i32 5, i32 9, i32 13, i32 17, i32 21, i32 25, i32 29, i32 33, i32 37, i32 41, i32 45, i32 49, i32 53, i32 57, i32 61>
  %strided.vec24 = shufflevector <64 x i8> %wide.vec, <64 x i8> undef, <16 x i32> <i32 2, i32 6, i32 10, i32 14, i32 18, i32 22, i32 26, i32 30, i32 34, i32 38, i32 42, i32 46, i32 50, i32 54, i32 58, i32 62>
  %strided.vec25 = shufflevector <64 x i8> %wide.vec, <64 x i8> undef, <16 x i32> <i32 3, i32 7, i32 11, i32 15, i32 19, i32 23, i32 27, i32 31, i32 35, i32 39, i32 43, i32 47, i32 51, i32 55, i32 59, i32 63>
  %37 = zext <16 x i8> %strided.vec to <16 x i32>
  %38 = zext <16 x i8> %strided.vec23 to <16 x i32>
  %39 = add nuw nsw <16 x i32> %37, %38
  %40 = lshr <16 x i32> %39, <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %41 = trunc <16 x i32> %40 to <16 x i8>
  %42 = getelementptr inbounds i8, i8* %next.gep, i64 1
  %43 = zext <16 x i8> %strided.vec24 to <16 x i32>
  %44 = zext <16 x i8> %strided.vec25 to <16 x i32>
  %45 = add nuw nsw <16 x i32> %43, <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %46 = add nuw nsw <16 x i32> %45, %44
  %47 = lshr <16 x i32> %46, <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %48 = trunc <16 x i32> %47 to <16 x i8>
  %49 = getelementptr i8, i8* %42, i64 -1
  %50 = bitcast i8* %49 to <32 x i8>*
  %interleaved.vec = shufflevector <16 x i8> %41, <16 x i8> %48, <32 x i32> <i32 0, i32 16, i32 1, i32 17, i32 2, i32 18, i32 3, i32 19, i32 4, i32 20, i32 5, i32 21, i32 6, i32 22, i32 7, i32 23, i32 8, i32 24, i32 9, i32 25, i32 10, i32 26, i32 11, i32 27, i32 12, i32 28, i32 13, i32 29, i32 14, i32 30, i32 15, i32 31>
  store <32 x i8> %interleaved.vec, <32 x i8>* %50, align 1, !alias.scope !4, !noalias !1
  %index.next = add i64 %index, 16
  %51 = icmp eq i64 %index.next, %n.vec
  br i1 %51, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph12.split
  %.018.ph = phi i8* [ %31, %vector.memcheck ], [ %31, %min.iters.checked ], [ %31, %.lr.ph12.split ], [ %ind.end, %middle.block ]
  %.027.ph = phi i8* [ %33, %vector.memcheck ], [ %33, %min.iters.checked ], [ %33, %.lr.ph12.split ], [ %ind.end19, %middle.block ]
  %.036.ph = phi i32 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph12.split ], [ %ind.end21, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %.018 = phi i8* [ %71, %scalar.ph ], [ %.018.ph, %scalar.ph.preheader ]
  %.027 = phi i8* [ %72, %scalar.ph ], [ %.027.ph, %scalar.ph.preheader ]
  %.036 = phi i32 [ %73, %scalar.ph ], [ %.036.ph, %scalar.ph.preheader ]
  %52 = load i8, i8* %.027, align 1
  %53 = zext i8 %52 to i32
  %54 = getelementptr inbounds i8, i8* %.027, i64 1
  %55 = load i8, i8* %54, align 1
  %56 = zext i8 %55 to i32
  %57 = add nuw nsw i32 %53, %56
  %58 = lshr i32 %57, 1
  %59 = trunc i32 %58 to i8
  %60 = getelementptr inbounds i8, i8* %.018, i64 1
  store i8 %59, i8* %.018, align 1
  %61 = getelementptr inbounds i8, i8* %.027, i64 2
  %62 = load i8, i8* %61, align 1
  %63 = zext i8 %62 to i32
  %64 = getelementptr inbounds i8, i8* %.027, i64 3
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = add nuw nsw i32 %63, 1
  %68 = add nuw nsw i32 %67, %66
  %69 = lshr i32 %68, 1
  %70 = trunc i32 %69 to i8
  %71 = getelementptr inbounds i8, i8* %.018, i64 2
  store i8 %70, i8* %60, align 1
  %72 = getelementptr inbounds i8, i8* %.027, i64 4
  %73 = add i32 %.036, 2
  %exitcond.1 = icmp eq i32 %73, %7
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block
  %indvars.iv.next = add nuw i64 %indvars.iv10, 1
  %74 = load i32, i32* %13, align 4
  %75 = sext i32 %74 to i64
  %76 = icmp slt i64 %indvars.iv.next, %75
  br i1 %76, label %.lr.ph12.split, label %._crit_edge13.loopexit26

._crit_edge13.loopexit:                           ; preds = %.lr.ph12.split.us
  br label %._crit_edge13

._crit_edge13.loopexit26:                         ; preds = %._crit_edge
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit26, %._crit_edge13.loopexit, %4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @h2v2_smooth_downsample(%struct.jpeg_compress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i8** nocapture readonly, i8** nocapture readonly) #2 {
  %5 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 7
  %6 = load i32, i32* %5, align 4
  %7 = shl i32 %6, 3
  %8 = getelementptr inbounds i8*, i8** %2, i64 -1
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %10 = load i32, i32* %9, align 4
  %11 = add nsw i32 %10, 2
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %13 = load i32, i32* %12, align 8
  %14 = shl i32 %6, 4
  tail call void @expand_right_edge(i8** %8, i32 %11, i32 %13, i32 %14)
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 27
  %16 = load i32, i32* %15, align 8
  %17 = mul i32 %16, -80
  %18 = add i32 %17, 16384
  %19 = sext i32 %18 to i64
  %20 = shl nsw i32 %16, 4
  %21 = sext i32 %20 to i64
  %22 = add i32 %7, -2
  %23 = zext i32 %22 to i64
  %24 = shl nuw nsw i64 %23, 1
  %25 = or i64 %24, 2
  %26 = or i64 %23, 1
  %27 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 3
  %28 = load i32, i32* %27, align 4
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %4
  %30 = add i32 %7, -2
  br label %31

; <label>:31:                                     ; preds = %.lr.ph, %168
  %indvars.iv22 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %168 ]
  %indvars.iv1221 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next13, %168 ]
  %32 = getelementptr inbounds i8*, i8** %3, i64 %indvars.iv22
  %33 = load i8*, i8** %32, align 8
  %34 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv1221
  %35 = load i8*, i8** %34, align 8
  %36 = or i64 %indvars.iv1221, 1
  %37 = getelementptr inbounds i8*, i8** %2, i64 %36
  %38 = load i8*, i8** %37, align 8
  %39 = add nsw i64 %indvars.iv1221, -1
  %40 = getelementptr inbounds i8*, i8** %2, i64 %39
  %41 = load i8*, i8** %40, align 8
  %indvars.iv.next13 = add nuw i64 %indvars.iv1221, 2
  %42 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next13
  %43 = load i8*, i8** %42, align 8
  %44 = load i8, i8* %35, align 1
  %45 = zext i8 %44 to i32
  %46 = getelementptr inbounds i8, i8* %35, i64 1
  %47 = load i8, i8* %46, align 1
  %48 = zext i8 %47 to i32
  %49 = add nuw nsw i32 %48, %45
  %50 = load i8, i8* %38, align 1
  %51 = zext i8 %50 to i32
  %52 = add nuw nsw i32 %49, %51
  %53 = getelementptr inbounds i8, i8* %38, i64 1
  %54 = load i8, i8* %53, align 1
  %55 = zext i8 %54 to i32
  %56 = add nuw nsw i32 %52, %55
  %57 = zext i32 %56 to i64
  %58 = load i8, i8* %41, align 1
  %59 = zext i8 %58 to i32
  %60 = getelementptr inbounds i8, i8* %41, i64 1
  %61 = load i8, i8* %60, align 1
  %62 = zext i8 %61 to i32
  %63 = load i8, i8* %43, align 1
  %64 = zext i8 %63 to i32
  %65 = getelementptr inbounds i8, i8* %43, i64 1
  %66 = load i8, i8* %65, align 1
  %67 = zext i8 %66 to i32
  %68 = getelementptr inbounds i8, i8* %35, i64 2
  %69 = load i8, i8* %68, align 1
  %70 = zext i8 %69 to i32
  %71 = getelementptr inbounds i8, i8* %38, i64 2
  %72 = load i8, i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = add nuw nsw i32 %51, %45
  %75 = add nuw nsw i32 %74, %59
  %76 = add nuw nsw i32 %75, %62
  %77 = add nuw nsw i32 %76, %64
  %78 = add nuw nsw i32 %77, %67
  %79 = add nuw nsw i32 %78, %70
  %80 = add i32 %79, %73
  %81 = sext i32 %80 to i64
  %82 = shl nsw i64 %81, 1
  %83 = getelementptr inbounds i8, i8* %41, i64 2
  %84 = load i8, i8* %83, align 1
  %85 = zext i8 %84 to i32
  %86 = getelementptr inbounds i8, i8* %43, i64 2
  %87 = load i8, i8* %86, align 1
  %88 = zext i8 %87 to i32
  %89 = add nuw nsw i32 %64, %59
  %90 = add nuw nsw i32 %89, %85
  %91 = add nuw nsw i32 %90, %88
  %92 = zext i32 %91 to i64
  %93 = add nsw i64 %82, %92
  %94 = mul nsw i64 %57, %19
  %95 = mul nsw i64 %93, %21
  %96 = add i64 %94, 32768
  %97 = add i64 %96, %95
  %98 = lshr i64 %97, 16
  %99 = trunc i64 %98 to i8
  store i8 %99, i8* %33, align 1
  %scevgep8 = getelementptr i8, i8* %35, i64 %25
  br label %100

; <label>:100:                                    ; preds = %31, %100
  %.pn = phi i8* [ %33, %31 ], [ %.020, %100 ]
  %.0119 = phi i8* [ %86, %31 ], [ %155, %100 ]
  %.0418 = phi i32 [ %30, %31 ], [ %166, %100 ]
  %.0517 = phi i8* [ %83, %31 ], [ %147, %100 ]
  %.0616 = phi i8* [ %68, %31 ], [ %131, %100 ]
  %.0715 = phi i8* [ %71, %31 ], [ %139, %100 ]
  %.020 = getelementptr inbounds i8, i8* %.pn, i64 1
  %101 = load i8, i8* %.0616, align 1
  %102 = zext i8 %101 to i64
  %103 = getelementptr inbounds i8, i8* %.0616, i64 1
  %104 = load i8, i8* %103, align 1
  %105 = zext i8 %104 to i64
  %106 = add nuw nsw i64 %105, %102
  %107 = load i8, i8* %.0715, align 1
  %108 = zext i8 %107 to i64
  %109 = add nuw nsw i64 %106, %108
  %110 = getelementptr inbounds i8, i8* %.0715, i64 1
  %111 = load i8, i8* %110, align 1
  %112 = zext i8 %111 to i64
  %113 = add nuw nsw i64 %109, %112
  %114 = load i8, i8* %.0517, align 1
  %115 = zext i8 %114 to i64
  %116 = getelementptr inbounds i8, i8* %.0517, i64 1
  %117 = load i8, i8* %116, align 1
  %118 = zext i8 %117 to i64
  %119 = add nuw nsw i64 %118, %115
  %120 = load i8, i8* %.0119, align 1
  %121 = zext i8 %120 to i64
  %122 = add nuw nsw i64 %119, %121
  %123 = getelementptr inbounds i8, i8* %.0119, i64 1
  %124 = load i8, i8* %123, align 1
  %125 = zext i8 %124 to i64
  %126 = add nuw nsw i64 %122, %125
  %127 = getelementptr inbounds i8, i8* %.0616, i64 -1
  %128 = load i8, i8* %127, align 1
  %129 = zext i8 %128 to i64
  %130 = add nuw nsw i64 %126, %129
  %131 = getelementptr inbounds i8, i8* %.0616, i64 2
  %132 = load i8, i8* %131, align 1
  %133 = zext i8 %132 to i64
  %134 = add nuw nsw i64 %130, %133
  %135 = getelementptr inbounds i8, i8* %.0715, i64 -1
  %136 = load i8, i8* %135, align 1
  %137 = zext i8 %136 to i64
  %138 = add nuw nsw i64 %134, %137
  %139 = getelementptr inbounds i8, i8* %.0715, i64 2
  %140 = load i8, i8* %139, align 1
  %141 = zext i8 %140 to i64
  %142 = add i64 %138, %141
  %sext = shl i64 %142, 32
  %143 = ashr exact i64 %sext, 31
  %144 = getelementptr inbounds i8, i8* %.0517, i64 -1
  %145 = load i8, i8* %144, align 1
  %146 = zext i8 %145 to i64
  %147 = getelementptr inbounds i8, i8* %.0517, i64 2
  %148 = load i8, i8* %147, align 1
  %149 = zext i8 %148 to i64
  %150 = add nuw nsw i64 %149, %146
  %151 = getelementptr inbounds i8, i8* %.0119, i64 -1
  %152 = load i8, i8* %151, align 1
  %153 = zext i8 %152 to i64
  %154 = add nuw nsw i64 %150, %153
  %155 = getelementptr inbounds i8, i8* %.0119, i64 2
  %156 = load i8, i8* %155, align 1
  %157 = zext i8 %156 to i64
  %158 = add nsw i64 %154, %143
  %159 = add nsw i64 %158, %157
  %160 = mul nsw i64 %113, %19
  %161 = mul nsw i64 %159, %21
  %162 = add i64 %160, 32768
  %163 = add i64 %162, %161
  %164 = lshr i64 %163, 16
  %165 = trunc i64 %164 to i8
  store i8 %165, i8* %.020, align 1
  %166 = add i32 %.0418, -1
  %167 = icmp eq i32 %166, 0
  br i1 %167, label %168, label %100

; <label>:168:                                    ; preds = %100
  %scevgep10 = getelementptr i8, i8* %43, i64 %25
  %scevgep = getelementptr i8, i8* %38, i64 %25
  %scevgep9 = getelementptr i8, i8* %41, i64 %25
  %scevgep11 = getelementptr i8, i8* %33, i64 %26
  %169 = load i8, i8* %scevgep8, align 1
  %170 = zext i8 %169 to i32
  %171 = getelementptr inbounds i8, i8* %scevgep8, i64 1
  %172 = load i8, i8* %171, align 1
  %173 = zext i8 %172 to i32
  %174 = add nuw nsw i32 %173, %170
  %175 = load i8, i8* %scevgep, align 1
  %176 = zext i8 %175 to i32
  %177 = add nuw nsw i32 %174, %176
  %178 = getelementptr inbounds i8, i8* %scevgep, i64 1
  %179 = load i8, i8* %178, align 1
  %180 = zext i8 %179 to i32
  %181 = add nuw nsw i32 %177, %180
  %182 = zext i32 %181 to i64
  %183 = load i8, i8* %scevgep9, align 1
  %184 = zext i8 %183 to i32
  %185 = getelementptr inbounds i8, i8* %scevgep9, i64 1
  %186 = load i8, i8* %185, align 1
  %187 = zext i8 %186 to i32
  %188 = load i8, i8* %scevgep10, align 1
  %189 = zext i8 %188 to i32
  %190 = getelementptr inbounds i8, i8* %scevgep10, i64 1
  %191 = load i8, i8* %190, align 1
  %192 = zext i8 %191 to i32
  %193 = getelementptr inbounds i8, i8* %scevgep8, i64 -1
  %194 = load i8, i8* %193, align 1
  %195 = zext i8 %194 to i32
  %196 = getelementptr inbounds i8, i8* %scevgep, i64 -1
  %197 = load i8, i8* %196, align 1
  %198 = zext i8 %197 to i32
  %199 = add nuw nsw i32 %180, %173
  %200 = add nuw nsw i32 %199, %184
  %201 = add nuw nsw i32 %200, %187
  %202 = add nuw nsw i32 %201, %189
  %203 = add nuw nsw i32 %202, %192
  %204 = add nuw nsw i32 %203, %195
  %205 = add i32 %204, %198
  %206 = sext i32 %205 to i64
  %207 = shl nsw i64 %206, 1
  %208 = getelementptr inbounds i8, i8* %scevgep9, i64 -1
  %209 = load i8, i8* %208, align 1
  %210 = zext i8 %209 to i32
  %211 = getelementptr inbounds i8, i8* %scevgep10, i64 -1
  %212 = load i8, i8* %211, align 1
  %213 = zext i8 %212 to i32
  %214 = add nuw nsw i32 %192, %187
  %215 = add nuw nsw i32 %214, %210
  %216 = add nuw nsw i32 %215, %213
  %217 = zext i32 %216 to i64
  %218 = add nsw i64 %207, %217
  %219 = mul nsw i64 %182, %19
  %220 = mul nsw i64 %218, %21
  %221 = add i64 %219, 32768
  %222 = add i64 %221, %220
  %223 = lshr i64 %222, 16
  %224 = trunc i64 %223 to i8
  store i8 %224, i8* %scevgep11, align 1
  %indvars.iv.next = add nuw i64 %indvars.iv22, 1
  %225 = load i32, i32* %27, align 4
  %226 = sext i32 %225 to i64
  %227 = icmp slt i64 %indvars.iv.next, %226
  br i1 %227, label %31, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %168
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
  tail call void @expand_right_edge(i8** %2, i32 %9, i32 %11, i32 %12)
  %13 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 3
  %14 = load i32, i32* %13, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %4
  %exitcond9 = icmp eq i32 %7, 0
  br i1 %exitcond9, label %.lr.ph18.split.us.preheader, label %.lr.ph18.split.preheader

.lr.ph18.split.preheader:                         ; preds = %.lr.ph18
  br label %.lr.ph18.split

.lr.ph18.split.us.preheader:                      ; preds = %.lr.ph18
  %16 = load i32, i32* %13, align 4
  %17 = sext i32 %16 to i64
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %.lr.ph18.split.us.preheader, %.lr.ph18.split.us
  %indvars.iv16.us = phi i64 [ %indvars.iv.next.us, %.lr.ph18.split.us ], [ 0, %.lr.ph18.split.us.preheader ]
  %indvars.iv.next.us = add nuw i64 %indvars.iv16.us, 1
  %18 = icmp slt i64 %indvars.iv.next.us, %17
  br i1 %18, label %.lr.ph18.split.us, label %._crit_edge19.loopexit

.lr.ph18.split:                                   ; preds = %.lr.ph18.split.preheader, %._crit_edge
  %indvars.iv16 = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph18.split.preheader ]
  %indvars.iv715 = phi i64 [ %indvars.iv.next8, %._crit_edge ], [ 0, %.lr.ph18.split.preheader ]
  %19 = getelementptr inbounds i8*, i8** %3, i64 %indvars.iv16
  %20 = load i8*, i8** %19, align 8
  %21 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv715
  %22 = load i8*, i8** %21, align 8
  %23 = or i64 %indvars.iv715, 1
  %24 = getelementptr inbounds i8*, i8** %2, i64 %23
  %25 = load i8*, i8** %24, align 8
  br label %26

; <label>:26:                                     ; preds = %.lr.ph18.split, %26
  %.014 = phi i32 [ 1, %.lr.ph18.split ], [ %44, %26 ]
  %.0113 = phi i8* [ %20, %.lr.ph18.split ], [ %43, %26 ]
  %.0212 = phi i8* [ %25, %.lr.ph18.split ], [ %46, %26 ]
  %.0311 = phi i8* [ %22, %.lr.ph18.split ], [ %45, %26 ]
  %.0610 = phi i32 [ 0, %.lr.ph18.split ], [ %47, %26 ]
  %27 = load i8, i8* %.0311, align 1
  %28 = zext i8 %27 to i32
  %29 = getelementptr inbounds i8, i8* %.0311, i64 1
  %30 = load i8, i8* %29, align 1
  %31 = zext i8 %30 to i32
  %32 = load i8, i8* %.0212, align 1
  %33 = zext i8 %32 to i32
  %34 = getelementptr inbounds i8, i8* %.0212, i64 1
  %35 = load i8, i8* %34, align 1
  %36 = zext i8 %35 to i32
  %37 = add i32 %28, %.014
  %38 = add i32 %37, %31
  %39 = add i32 %38, %33
  %40 = add i32 %39, %36
  %41 = lshr i32 %40, 2
  %42 = trunc i32 %41 to i8
  %43 = getelementptr inbounds i8, i8* %.0113, i64 1
  store i8 %42, i8* %.0113, align 1
  %44 = xor i32 %.014, 3
  %45 = getelementptr inbounds i8, i8* %.0311, i64 2
  %46 = getelementptr inbounds i8, i8* %.0212, i64 2
  %47 = add nuw i32 %.0610, 1
  %exitcond = icmp eq i32 %47, %7
  br i1 %exitcond, label %._crit_edge, label %26

._crit_edge:                                      ; preds = %26
  %indvars.iv.next8 = add nuw i64 %indvars.iv715, 2
  %indvars.iv.next = add nuw i64 %indvars.iv16, 1
  %48 = load i32, i32* %13, align 4
  %49 = sext i32 %48 to i64
  %50 = icmp slt i64 %indvars.iv.next, %49
  br i1 %50, label %.lr.ph18.split, label %._crit_edge19.loopexit23

._crit_edge19.loopexit:                           ; preds = %.lr.ph18.split.us
  br label %._crit_edge19

._crit_edge19.loopexit23:                         ; preds = %._crit_edge
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit23, %._crit_edge19.loopexit, %4
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
  tail call void @expand_right_edge(i8** %2, i32 %14, i32 %20, i32 %21)
  %22 = sext i32 %17 to i64
  %23 = load i32, i32* %15, align 4
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %.lr.ph44, label %._crit_edge45

.lr.ph44:                                         ; preds = %4
  %25 = sdiv i32 %18, 2
  %exitcond21 = icmp eq i32 %7, 0
  %26 = icmp sgt i32 %17, 0
  %27 = icmp sgt i32 %12, 0
  %28 = sext i32 %25 to i64
  %29 = sext i32 %18 to i64
  %30 = add i32 %12, -1
  %xtraiter = and i32 %12, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %31 = icmp ult i32 %30, 3
  %32 = add i32 %12, -4
  %33 = add i32 %7, -4
  %34 = lshr exact i32 %33, 2
  %35 = add nuw nsw i32 %34, 1
  %xtraiter81 = and i32 %35, 2
  %lcmp.mod82 = icmp eq i32 %xtraiter81, 0
  %36 = icmp ult i32 %33, 12
  br label %37

; <label>:37:                                     ; preds = %.lr.ph44, %._crit_edge25
  %indvars.iv942 = phi i64 [ 0, %.lr.ph44 ], [ %indvars.iv.next10, %._crit_edge25 ]
  %indvars.iv1139 = phi i64 [ 0, %.lr.ph44 ], [ %indvars.iv.next12, %._crit_edge25 ]
  %38 = getelementptr inbounds i8*, i8** %3, i64 %indvars.iv942
  %39 = load i8*, i8** %38, align 8
  br i1 %exitcond21, label %._crit_edge25, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %37
  br i1 %26, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %40 = sdiv i64 %28, %29
  %41 = trunc i64 %40 to i8
  %42 = sdiv i64 %28, %29
  %43 = trunc i64 %42 to i8
  %44 = sdiv i64 %28, %29
  %45 = trunc i64 %44 to i8
  %46 = sdiv i64 %28, %29
  %47 = trunc i64 %46 to i8
  br i1 %lcmp.mod82, label %.preheader.prol.loopexit, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.preheader.preheader
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol, %.preheader.prol.preheader
  %.0124.prol = phi i8* [ %51, %.preheader.prol ], [ %39, %.preheader.prol.preheader ]
  %.0622.prol = phi i32 [ %52, %.preheader.prol ], [ 0, %.preheader.prol.preheader ]
  %prol.iter83 = phi i32 [ %prol.iter83.sub, %.preheader.prol ], [ %xtraiter81, %.preheader.prol.preheader ]
  %48 = getelementptr inbounds i8, i8* %.0124.prol, i64 1
  store i8 %41, i8* %.0124.prol, align 1
  %49 = getelementptr inbounds i8, i8* %.0124.prol, i64 2
  store i8 %43, i8* %48, align 1
  %50 = getelementptr inbounds i8, i8* %.0124.prol, i64 3
  store i8 %45, i8* %49, align 1
  %51 = getelementptr inbounds i8, i8* %.0124.prol, i64 4
  store i8 %47, i8* %50, align 1
  %52 = add i32 %.0622.prol, 4
  %prol.iter83.sub = add i32 %prol.iter83, -1
  %prol.iter83.cmp = icmp eq i32 %prol.iter83.sub, 0
  br i1 %prol.iter83.cmp, label %.preheader.prol.loopexit.unr-lcssa, label %.preheader.prol, !llvm.loop !10

.preheader.prol.loopexit.unr-lcssa:               ; preds = %.preheader.prol
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.preheader, %.preheader.prol.loopexit.unr-lcssa
  %.0124.unr = phi i8* [ %39, %.preheader.preheader ], [ %51, %.preheader.prol.loopexit.unr-lcssa ]
  %.0622.unr = phi i32 [ 0, %.preheader.preheader ], [ %52, %.preheader.prol.loopexit.unr-lcssa ]
  br i1 %36, label %._crit_edge25.loopexit74, label %.preheader.preheader.new

.preheader.preheader.new:                         ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge19.us
  %.0124.us = phi i8* [ %57, %._crit_edge19.us ], [ %39, %.preheader.us.preheader ]
  %.0323.us = phi i32 [ %59, %._crit_edge19.us ], [ 0, %.preheader.us.preheader ]
  %.0622.us = phi i32 [ %58, %._crit_edge19.us ], [ 0, %.preheader.us.preheader ]
  %53 = zext i32 %.0323.us to i64
  br i1 %27, label %.lr.ph.us.us.preheader, label %._crit_edge19.us

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  br label %.lr.ph.us.us

._crit_edge19.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %._crit_edge19.us.loopexit, %.preheader.us
  %split20.us = phi i64 [ 0, %.preheader.us ], [ %.lcssa, %._crit_edge19.us.loopexit ]
  %54 = add nsw i64 %split20.us, %28
  %55 = sdiv i64 %54, %29
  %56 = trunc i64 %55 to i8
  %57 = getelementptr inbounds i8, i8* %.0124.us, i64 1
  store i8 %56, i8* %.0124.us, align 1
  %58 = add nuw i32 %.0622.us, 1
  %59 = add i32 %.0323.us, %12
  %exitcond.us = icmp eq i32 %58, %7
  br i1 %exitcond.us, label %._crit_edge25.loopexit, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %.017.us.us = phi i64 [ %.lcssa, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %indvars.iv16.us.us = phi i64 [ %indvars.iv.next.us.us, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %60 = add nsw i64 %indvars.iv16.us.us, %indvars.iv1139
  %61 = getelementptr inbounds i8*, i8** %2, i64 %60
  %62 = load i8*, i8** %61, align 8
  %63 = getelementptr inbounds i8, i8* %62, i64 %53
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %.115.us.us.prol = phi i64 [ %67, %.prol.preheader ], [ %.017.us.us, %.prol.preheader.preheader ]
  %.0214.us.us.prol = phi i8* [ %64, %.prol.preheader ], [ %63, %.prol.preheader.preheader ]
  %.0813.us.us.prol = phi i32 [ %68, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %64 = getelementptr inbounds i8, i8* %.0214.us.us.prol, i64 1
  %65 = load i8, i8* %.0214.us.us.prol, align 1
  %66 = zext i8 %65 to i64
  %67 = add nsw i64 %66, %.115.us.us.prol
  %68 = add nuw nsw i32 %.0813.us.us.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !12

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us.us
  %.115.us.us.unr = phi i64 [ %.017.us.us, %.lr.ph.us.us ], [ %67, %.prol.loopexit.loopexit ]
  %.0214.us.us.unr = phi i8* [ %63, %.lr.ph.us.us ], [ %64, %.prol.loopexit.loopexit ]
  %.0813.us.us.unr = phi i32 [ 0, %.lr.ph.us.us ], [ %68, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi i64 [ undef, %.lr.ph.us.us ], [ %67, %.prol.loopexit.loopexit ]
  br i1 %31, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  %69 = sub i32 %32, %.0813.us.us.unr
  %70 = lshr i32 %69, 2
  %addconv = add nuw nsw i32 %70, 1
  %min.iters.check = icmp ult i32 %addconv, 4
  br i1 %min.iters.check, label %.lr.ph.us.us.new.preheader73, label %min.iters.checked

.lr.ph.us.us.new.preheader73:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph.us.us.new.preheader
  %.115.us.us.ph = phi i64 [ %.115.us.us.unr, %min.iters.checked ], [ %.115.us.us.unr, %.lr.ph.us.us.new.preheader ], [ %98, %middle.block ]
  %.0214.us.us.ph = phi i8* [ %.0214.us.us.unr, %min.iters.checked ], [ %.0214.us.us.unr, %.lr.ph.us.us.new.preheader ], [ %ind.end, %middle.block ]
  %.0813.us.us.ph = phi i32 [ %.0813.us.us.unr, %min.iters.checked ], [ %.0813.us.us.unr, %.lr.ph.us.us.new.preheader ], [ %ind.end60, %middle.block ]
  br label %.lr.ph.us.us.new

min.iters.checked:                                ; preds = %.lr.ph.us.us.new.preheader
  %71 = zext i32 %addconv to i64
  %72 = and i32 %addconv, 3
  %n.mod.vf = zext i32 %72 to i64
  %n.vec = sub nsw i64 %71, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %73 = shl nsw i64 %n.vec, 2
  %ind.end = getelementptr i8, i8* %.0214.us.us.unr, i64 %73
  %cast.crd = trunc i64 %n.vec to i32
  %74 = shl i32 %cast.crd, 2
  %ind.end60 = add i32 %.0813.us.us.unr, %74
  br i1 %cmp.zero, label %.lr.ph.us.us.new.preheader73, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %75 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %.115.us.us.unr, i32 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <2 x i64> [ %75, %vector.ph ], [ %95, %vector.body ]
  %vec.phi61 = phi <2 x i64> [ zeroinitializer, %vector.ph ], [ %96, %vector.body ]
  %76 = shl i64 %index, 2
  %next.gep = getelementptr i8, i8* %.0214.us.us.unr, i64 %76
  %77 = shl i64 %index, 2
  %78 = or i64 %77, 8
  %next.gep62 = getelementptr i8, i8* %.0214.us.us.unr, i64 %78
  %79 = bitcast i8* %next.gep to <8 x i8>*
  %80 = bitcast i8* %next.gep62 to <8 x i8>*
  %wide.vec = load <8 x i8>, <8 x i8>* %79, align 1
  %wide.vec64 = load <8 x i8>, <8 x i8>* %80, align 1
  %strided.vec = shufflevector <8 x i8> %wide.vec, <8 x i8> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec65 = shufflevector <8 x i8> %wide.vec64, <8 x i8> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec66 = shufflevector <8 x i8> %wide.vec, <8 x i8> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec67 = shufflevector <8 x i8> %wide.vec64, <8 x i8> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec68 = shufflevector <8 x i8> %wide.vec, <8 x i8> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec69 = shufflevector <8 x i8> %wide.vec64, <8 x i8> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec70 = shufflevector <8 x i8> %wide.vec, <8 x i8> undef, <2 x i32> <i32 3, i32 7>
  %strided.vec71 = shufflevector <8 x i8> %wide.vec64, <8 x i8> undef, <2 x i32> <i32 3, i32 7>
  %81 = zext <2 x i8> %strided.vec to <2 x i64>
  %82 = zext <2 x i8> %strided.vec65 to <2 x i64>
  %83 = add nsw <2 x i64> %81, %vec.phi
  %84 = add nsw <2 x i64> %82, %vec.phi61
  %85 = zext <2 x i8> %strided.vec66 to <2 x i64>
  %86 = zext <2 x i8> %strided.vec67 to <2 x i64>
  %87 = add nsw <2 x i64> %85, %83
  %88 = add nsw <2 x i64> %86, %84
  %89 = zext <2 x i8> %strided.vec68 to <2 x i64>
  %90 = zext <2 x i8> %strided.vec69 to <2 x i64>
  %91 = add nsw <2 x i64> %89, %87
  %92 = add nsw <2 x i64> %90, %88
  %93 = zext <2 x i8> %strided.vec70 to <2 x i64>
  %94 = zext <2 x i8> %strided.vec71 to <2 x i64>
  %95 = add nsw <2 x i64> %93, %91
  %96 = add nsw <2 x i64> %94, %92
  %index.next = add i64 %index, 4
  %97 = icmp eq i64 %index.next, %n.vec
  br i1 %97, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <2 x i64> %96, %95
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx72 = add <2 x i64> %bin.rdx, %rdx.shuf
  %98 = extractelement <2 x i64> %bin.rdx72, i32 0
  %cmp.n = icmp eq i32 %72, 0
  br i1 %cmp.n, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader73

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %middle.block, %.prol.loopexit
  %.lcssa = phi i64 [ %.lcssa.unr, %.prol.loopexit ], [ %98, %middle.block ], [ %114, %._crit_edge.us.us.loopexit ]
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv16.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us.us, %22
  br i1 %exitcond, label %._crit_edge19.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader73, %.lr.ph.us.us.new
  %.115.us.us = phi i64 [ %114, %.lr.ph.us.us.new ], [ %.115.us.us.ph, %.lr.ph.us.us.new.preheader73 ]
  %.0214.us.us = phi i8* [ %111, %.lr.ph.us.us.new ], [ %.0214.us.us.ph, %.lr.ph.us.us.new.preheader73 ]
  %.0813.us.us = phi i32 [ %115, %.lr.ph.us.us.new ], [ %.0813.us.us.ph, %.lr.ph.us.us.new.preheader73 ]
  %99 = getelementptr inbounds i8, i8* %.0214.us.us, i64 1
  %100 = load i8, i8* %.0214.us.us, align 1
  %101 = zext i8 %100 to i64
  %102 = add nsw i64 %101, %.115.us.us
  %103 = getelementptr inbounds i8, i8* %.0214.us.us, i64 2
  %104 = load i8, i8* %99, align 1
  %105 = zext i8 %104 to i64
  %106 = add nsw i64 %105, %102
  %107 = getelementptr inbounds i8, i8* %.0214.us.us, i64 3
  %108 = load i8, i8* %103, align 1
  %109 = zext i8 %108 to i64
  %110 = add nsw i64 %109, %106
  %111 = getelementptr inbounds i8, i8* %.0214.us.us, i64 4
  %112 = load i8, i8* %107, align 1
  %113 = zext i8 %112 to i64
  %114 = add nsw i64 %113, %110
  %115 = add nsw i32 %.0813.us.us, 4
  %exitcond.348 = icmp eq i32 %115, %12
  br i1 %exitcond.348, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new, !llvm.loop !14

.preheader:                                       ; preds = %.preheader, %.preheader.preheader.new
  %.0124 = phi i8* [ %.0124.unr, %.preheader.preheader.new ], [ %131, %.preheader ]
  %.0622 = phi i32 [ %.0622.unr, %.preheader.preheader.new ], [ %132, %.preheader ]
  %116 = getelementptr inbounds i8, i8* %.0124, i64 1
  store i8 %41, i8* %.0124, align 1
  %117 = getelementptr inbounds i8, i8* %.0124, i64 2
  store i8 %43, i8* %116, align 1
  %118 = getelementptr inbounds i8, i8* %.0124, i64 3
  store i8 %45, i8* %117, align 1
  %119 = getelementptr inbounds i8, i8* %.0124, i64 4
  store i8 %47, i8* %118, align 1
  %120 = getelementptr inbounds i8, i8* %.0124, i64 5
  store i8 %41, i8* %119, align 1
  %121 = getelementptr inbounds i8, i8* %.0124, i64 6
  store i8 %43, i8* %120, align 1
  %122 = getelementptr inbounds i8, i8* %.0124, i64 7
  store i8 %45, i8* %121, align 1
  %123 = getelementptr inbounds i8, i8* %.0124, i64 8
  store i8 %47, i8* %122, align 1
  %124 = getelementptr inbounds i8, i8* %.0124, i64 9
  store i8 %41, i8* %123, align 1
  %125 = getelementptr inbounds i8, i8* %.0124, i64 10
  store i8 %43, i8* %124, align 1
  %126 = getelementptr inbounds i8, i8* %.0124, i64 11
  store i8 %45, i8* %125, align 1
  %127 = getelementptr inbounds i8, i8* %.0124, i64 12
  store i8 %47, i8* %126, align 1
  %128 = getelementptr inbounds i8, i8* %.0124, i64 13
  store i8 %41, i8* %127, align 1
  %129 = getelementptr inbounds i8, i8* %.0124, i64 14
  store i8 %43, i8* %128, align 1
  %130 = getelementptr inbounds i8, i8* %.0124, i64 15
  store i8 %45, i8* %129, align 1
  %131 = getelementptr inbounds i8, i8* %.0124, i64 16
  store i8 %47, i8* %130, align 1
  %132 = add i32 %.0622, 16
  %exitcond.3.3 = icmp eq i32 %132, %7
  br i1 %exitcond.3.3, label %._crit_edge25.loopexit74.unr-lcssa, label %.preheader

._crit_edge25.loopexit:                           ; preds = %._crit_edge19.us
  br label %._crit_edge25

._crit_edge25.loopexit74.unr-lcssa:               ; preds = %.preheader
  br label %._crit_edge25.loopexit74

._crit_edge25.loopexit74:                         ; preds = %.preheader.prol.loopexit, %._crit_edge25.loopexit74.unr-lcssa
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit74, %._crit_edge25.loopexit, %37
  %indvars.iv.next12 = add i64 %indvars.iv1139, %22
  %indvars.iv.next10 = add nuw i64 %indvars.iv942, 1
  %133 = load i32, i32* %15, align 4
  %134 = sext i32 %133 to i64
  %135 = icmp slt i64 %indvars.iv.next10, %134
  br i1 %135, label %37, label %._crit_edge45.loopexit

._crit_edge45.loopexit:                           ; preds = %._crit_edge25
  br label %._crit_edge45

._crit_edge45:                                    ; preds = %._crit_edge45.loopexit, %4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @expand_right_edge(i8** nocapture readonly, i32, i32, i32) #2 {
  %5 = sub i32 %3, %2
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %.loopexit

; <label>:7:                                      ; preds = %4
  %8 = sext i32 %1 to i64
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph7.split.us.preheader, label %.loopexit

.lr.ph7.split.us.preheader:                       ; preds = %7
  %10 = zext i32 %2 to i64
  %11 = add i32 %2, -1
  %12 = sub i32 %11, %3
  %13 = icmp sgt i32 %12, -2
  %smax = select i1 %13, i32 %12, i32 -2
  %14 = add i32 %smax, %3
  %15 = add i32 %14, 1
  %16 = sub i32 %15, %2
  %17 = zext i32 %16 to i64
  %18 = add nuw nsw i64 %17, 1
  %19 = add nsw i64 %8, -1
  %xtraiter = and i64 %8, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph7.split.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.lr.ph7.split.us.preheader
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv5.us.prol = phi i64 [ %indvars.iv.next.us.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %20 = getelementptr inbounds i8*, i8** %0, i64 %indvars.iv5.us.prol
  %21 = load i8*, i8** %20, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 %10
  %23 = getelementptr inbounds i8, i8* %22, i64 -1
  %24 = load i8, i8* %23, align 1
  call void @llvm.memset.p0i8.i64(i8* %22, i8 %24, i64 %18, i32 1, i1 false)
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv5.us.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph7.split.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !16

.lr.ph7.split.us.prol.loopexit.loopexit:          ; preds = %._crit_edge.us.prol
  br label %.lr.ph7.split.us.prol.loopexit

.lr.ph7.split.us.prol.loopexit:                   ; preds = %.lr.ph7.split.us.prol.loopexit.loopexit, %.lr.ph7.split.us.preheader
  %indvars.iv5.us.unr = phi i64 [ 0, %.lr.ph7.split.us.preheader ], [ %indvars.iv.next.us.prol, %.lr.ph7.split.us.prol.loopexit.loopexit ]
  %25 = icmp ult i64 %19, 3
  br i1 %25, label %.loopexit, label %._crit_edge.us.3.preheader

._crit_edge.us.3.preheader:                       ; preds = %.lr.ph7.split.us.prol.loopexit
  br label %._crit_edge.us.3

.loopexit.loopexit:                               ; preds = %._crit_edge.us.3
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.lr.ph7.split.us.prol.loopexit, %7, %4
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3.preheader, %._crit_edge.us.3
  %indvars.iv5.us = phi i64 [ %indvars.iv.next.us.3, %._crit_edge.us.3 ], [ %indvars.iv5.us.unr, %._crit_edge.us.3.preheader ]
  %26 = getelementptr inbounds i8*, i8** %0, i64 %indvars.iv5.us
  %27 = load i8*, i8** %26, align 8
  %28 = getelementptr inbounds i8, i8* %27, i64 %10
  %29 = getelementptr inbounds i8, i8* %28, i64 -1
  %30 = load i8, i8* %29, align 1
  call void @llvm.memset.p0i8.i64(i8* %28, i8 %30, i64 %18, i32 1, i1 false)
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv5.us, 1
  %31 = getelementptr inbounds i8*, i8** %0, i64 %indvars.iv.next.us
  %32 = load i8*, i8** %31, align 8
  %33 = getelementptr inbounds i8, i8* %32, i64 %10
  %34 = getelementptr inbounds i8, i8* %33, i64 -1
  %35 = load i8, i8* %34, align 1
  call void @llvm.memset.p0i8.i64(i8* %33, i8 %35, i64 %18, i32 1, i1 false)
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv5.us, 2
  %36 = getelementptr inbounds i8*, i8** %0, i64 %indvars.iv.next.us.1
  %37 = load i8*, i8** %36, align 8
  %38 = getelementptr inbounds i8, i8* %37, i64 %10
  %39 = getelementptr inbounds i8, i8* %38, i64 -1
  %40 = load i8, i8* %39, align 1
  call void @llvm.memset.p0i8.i64(i8* %38, i8 %40, i64 %18, i32 1, i1 false)
  %indvars.iv.next.us.2 = add nsw i64 %indvars.iv5.us, 3
  %41 = getelementptr inbounds i8*, i8** %0, i64 %indvars.iv.next.us.2
  %42 = load i8*, i8** %41, align 8
  %43 = getelementptr inbounds i8, i8* %42, i64 %10
  %44 = getelementptr inbounds i8, i8* %43, i64 -1
  %45 = load i8, i8* %44, align 1
  call void @llvm.memset.p0i8.i64(i8* %43, i8 %45, i64 %18, i32 1, i1 false)
  %indvars.iv.next.us.3 = add nsw i64 %indvars.iv5.us, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.us.3, %8
  br i1 %exitcond.3, label %.loopexit.loopexit, label %._crit_edge.us.3
}

declare void @jcopy_sample_rows(i8**, i32, i8**, i32, i32, i32) #3

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
