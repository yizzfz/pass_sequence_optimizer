; ModuleID = 'jdmarker.ll'
source_filename = "jdmarker.c"
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
%struct.jpeg_source_mgr = type { i8*, i64, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, {}*, void (%struct.jpeg_decompress_struct*)* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.jpeg_decomp_master = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32 }
%struct.jpeg_d_main_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* }
%struct.jpeg_d_coef_controller = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, i8***)*, %struct.jvirt_barray_control** }
%struct.jpeg_d_post_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* }
%struct.jpeg_input_controller = type { i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32, i32 }
%struct.jpeg_marker_reader = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, [16 x i32 (%struct.jpeg_decompress_struct*)*], i32, i32, i32, i32 }
%struct.jpeg_entropy_decoder = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* }
%struct.jpeg_inverse_dct = type { void (%struct.jpeg_decompress_struct*)*, [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*] }
%struct.jpeg_upsampler = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, i32 }
%struct.jpeg_color_deconverter = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* }
%struct.jpeg_color_quantizer = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)* }

@jpeg_natural_order = external local_unnamed_addr constant [0 x i32], align 4

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_resync_to_restart(%struct.jpeg_decompress_struct*, i32) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  %4 = load i32, i32* %3, align 4
  %.cast1424 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %5 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %.cast1424, align 8
  %6 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %5, i64 0, i32 5
  store i32 117, i32* %6, align 8
  %7 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %.cast1424, align 8
  %8 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %7, i64 0, i32 6, i32 0, i64 0
  store i32 %4, i32* %8, align 4
  %9 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %.cast1424, align 8
  %10 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %9, i64 0, i32 6, i32 0, i64 1
  store i32 %1, i32* %10, align 4
  %11 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %.cast1424, align 8
  %12 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 1
  %13 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %12, align 8
  %.cast9 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %13(%struct.jpeg_common_struct* %.cast9, i32 -1) #4
  %14 = add nsw i32 %1, 1
  %15 = and i32 %14, 7
  %16 = or i32 %15, 208
  %17 = add nsw i32 %1, 2
  %18 = and i32 %17, 7
  %19 = or i32 %18, 208
  %20 = add i32 %1, 7
  %21 = and i32 %20, 7
  %22 = or i32 %21, 208
  %23 = add i32 %1, 6
  %24 = and i32 %23, 7
  %25 = or i32 %24, 208
  br label %.backedge.outer

.backedge.outer:                                  ; preds = %49, %2
  %.ph = phi i32 [ %50, %49 ], [ %4, %2 ]
  %26 = icmp slt i32 %.ph, 192
  %27 = and i32 %.ph, -8
  %28 = icmp eq i32 %.ph, %16
  %29 = icmp eq i32 %.ph, %19
  %or.cond7 = or i1 %28, %29
  %30 = icmp eq i32 %.ph, %22
  %31 = icmp eq i32 %.ph, %25
  %or.cond8 = or i1 %30, %31
  %. = select i1 %or.cond8, i32 2, i32 1
  %.not = icmp ne i32 %27, 208
  %brmerge = or i1 %26, %.not
  %.mux = select i1 %26, i32 2, i32 3
  %.. = select i1 %or.cond7, i32 3, i32 %.
  %32 = select i1 %brmerge, i32 %.mux, i32 %..
  %trunc21 = trunc i32 %32 to i2
  br label %.backedge

.backedge:                                        ; preds = %.backedge.outer, %.backedge
  %33 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %34 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %35 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %35, i64 0, i32 5
  store i32 96, i32* %36, align 8
  %37 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %38 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %37, i64 0, i32 6, i32 0, i64 0
  store i32 %.ph, i32* %38, align 4
  %39 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %40 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %39, i64 0, i32 6, i32 0, i64 1
  store i32 %32, i32* %40, align 4
  %41 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %42 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %41, i64 0, i32 1
  %43 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %42, align 8
  tail call void %43(%struct.jpeg_common_struct* %33, i32 4) #4
  %44 = zext i2 %trunc21 to i8
  switch i8 %44, label %.backedge [
    i8 1, label %45
    i8 2, label %46
    i8 3, label %.loopexit.loopexit
  ]

; <label>:45:                                     ; preds = %.backedge
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr25 = add i64 %sunkaddr, 524
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to i32*
  store i32 0, i32* %sunkaddr26, align 4
  br label %.loopexit

; <label>:46:                                     ; preds = %.backedge
  %47 = tail call fastcc i32 @next_marker(%struct.jpeg_decompress_struct* nonnull %0)
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %.loopexit.loopexit30, label %49

; <label>:49:                                     ; preds = %46
  %sunkaddr27 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr28 = add i64 %sunkaddr27, 524
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to i32*
  %50 = load i32, i32* %sunkaddr29, align 4
  br label %.backedge.outer

.loopexit.loopexit:                               ; preds = %.backedge
  br label %.loopexit

.loopexit.loopexit30:                             ; preds = %46
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit30, %.loopexit.loopexit, %45
  %51 = phi i32 [ 1, %45 ], [ 1, %.loopexit.loopexit ], [ 0, %.loopexit.loopexit30 ]
  ret i32 %51
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @next_marker(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.jpeg_source_mgr*, align 8
  %4 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %6 = bitcast %struct.jpeg_source_mgr** %5 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = bitcast %struct.jpeg_source_mgr** %3 to i64*
  store i64 %7, i64* %8, align 8
  %9 = inttoptr i64 %7 to i64*
  %10 = inttoptr i64 %7 to i8**
  %11 = load i8*, i8** %10, align 8
  %.cast = inttoptr i64 %7 to %struct.jpeg_source_mgr*
  %12 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %.cast, i64 0, i32 1
  %13 = load i64, i64* %12, align 8
  store i64 %13, i64* %4, align 8
  %14 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  br label %15

; <label>:15:                                     ; preds = %1, %102
  %16 = phi i64* [ %9, %1 ], [ %69, %102 ]
  %17 = phi %struct.jpeg_error_mgr** [ %14, %1 ], [ %70, %102 ]
  %18 = phi %struct.jpeg_error_mgr** [ %14, %1 ], [ %71, %102 ]
  %19 = phi %struct.jpeg_error_mgr** [ %14, %1 ], [ %72, %102 ]
  %20 = phi %struct.jpeg_source_mgr* [ %.cast, %1 ], [ %107, %102 ]
  %21 = phi i8** [ %10, %1 ], [ %108, %102 ]
  %22 = phi i8* [ %11, %1 ], [ %92, %102 ]
  %23 = phi %struct.jpeg_decompress_struct* [ %0, %1 ], [ %73, %102 ]
  %24 = phi i64 [ %13, %1 ], [ %105, %102 ]
  %25 = icmp eq i64 %24, 0
  br i1 %25, label %26, label %36

; <label>:26:                                     ; preds = %15
  %27 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %20, i64 0, i32 3
  %28 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %27, align 8
  %29 = tail call i32 %28(%struct.jpeg_decompress_struct* %23) #4
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %.loopexit.loopexit, label %31

; <label>:31:                                     ; preds = %26
  %32 = bitcast i64* %16 to i8**
  %33 = load i8*, i8** %32, align 8
  %34 = getelementptr inbounds i64, i64* %16, i64 1
  %35 = load i64, i64* %34, align 8
  store i64 %35, i64* %4, align 8
  br label %36

; <label>:36:                                     ; preds = %31, %15
  %37 = phi i8* [ %33, %31 ], [ %22, %15 ]
  %38 = phi i64 [ %35, %31 ], [ %24, %15 ]
  %39 = add i64 %38, -1
  store i64 %39, i64* %4, align 8
  %40 = getelementptr inbounds i8, i8* %37, i64 1
  %41 = load i8, i8* %37, align 1
  %42 = icmp eq i8 %41, -1
  br i1 %42, label %68, label %.lr.ph

.lr.ph:                                           ; preds = %36
  br label %43

; <label>:43:                                     ; preds = %59, %.lr.ph
  %44 = phi i64 [ %39, %.lr.ph ], [ %62, %59 ]
  %45 = phi i8* [ %40, %.lr.ph ], [ %63, %59 ]
  %sunkaddr166 = ptrtoint %struct.jpeg_decompress_struct* %23 to i64
  %sunkaddr167 = add i64 %sunkaddr166, 568
  %sunkaddr168 = inttoptr i64 %sunkaddr167 to %struct.jpeg_marker_reader**
  %46 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %sunkaddr168, align 8
  %47 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %46, i64 0, i32 8
  %48 = load i32, i32* %47, align 4
  %49 = add i32 %48, 1
  store i32 %49, i32* %47, align 4
  store i8* %45, i8** %21, align 8
  %sunkaddr = ptrtoint i8** %21 to i64
  %sunkaddr169 = add i64 %sunkaddr, 8
  %sunkaddr170 = inttoptr i64 %sunkaddr169 to i64*
  store i64 %44, i64* %sunkaddr170, align 8
  %50 = icmp eq i64 %44, 0
  br i1 %50, label %51, label %59

; <label>:51:                                     ; preds = %43
  %sunkaddr171 = ptrtoint i8** %21 to i64
  %sunkaddr172 = add i64 %sunkaddr171, 24
  %sunkaddr173 = inttoptr i64 %sunkaddr172 to i32 (%struct.jpeg_decompress_struct*)**
  %52 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %sunkaddr173, align 8
  %53 = tail call i32 %52(%struct.jpeg_decompress_struct* nonnull %23) #4
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %55, label %56

; <label>:55:                                     ; preds = %51
  store i64 0, i64* %4, align 8
  br label %.loopexit

; <label>:56:                                     ; preds = %51
  %57 = load i8*, i8** %21, align 8
  %sunkaddr174 = ptrtoint i8** %21 to i64
  %sunkaddr175 = add i64 %sunkaddr174, 8
  %sunkaddr176 = inttoptr i64 %sunkaddr175 to i64*
  %58 = load i64, i64* %sunkaddr176, align 8
  br label %59

; <label>:59:                                     ; preds = %56, %43
  %60 = phi i64 [ %58, %56 ], [ %44, %43 ]
  %61 = phi i8* [ %57, %56 ], [ %45, %43 ]
  %62 = add i64 %60, -1
  %63 = getelementptr inbounds i8, i8* %61, i64 1
  %64 = load i8, i8* %61, align 1
  %65 = icmp eq i8 %64, -1
  br i1 %65, label %._crit_edge, label %43

._crit_edge:                                      ; preds = %59
  store i64 %62, i64* %4, align 8
  %.pre = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %3, align 8
  %.pre27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %66 = bitcast %struct.jpeg_decompress_struct* %.pre27 to %struct.jpeg_error_mgr**
  %67 = bitcast %struct.jpeg_source_mgr* %.pre to i64*
  br label %68

; <label>:68:                                     ; preds = %36, %._crit_edge
  %69 = phi i64* [ %16, %36 ], [ %67, %._crit_edge ]
  %70 = phi %struct.jpeg_error_mgr** [ %17, %36 ], [ %66, %._crit_edge ]
  %71 = phi %struct.jpeg_error_mgr** [ %18, %36 ], [ %66, %._crit_edge ]
  %72 = phi %struct.jpeg_error_mgr** [ %19, %36 ], [ %66, %._crit_edge ]
  %.promoted11 = phi i8* [ %40, %36 ], [ %63, %._crit_edge ]
  %.promoted8 = phi i64 [ %39, %36 ], [ %62, %._crit_edge ]
  %73 = phi %struct.jpeg_decompress_struct* [ %23, %36 ], [ %.pre27, %._crit_edge ]
  %74 = phi %struct.jpeg_source_mgr* [ %20, %36 ], [ %.pre, %._crit_edge ]
  br label %75

; <label>:75:                                     ; preds = %68, %88
  %76 = phi i8* [ %.promoted11, %68 ], [ %92, %88 ]
  %77 = phi i64 [ %.promoted8, %68 ], [ %91, %88 ]
  %78 = icmp eq i64 %77, 0
  br i1 %78, label %79, label %88

; <label>:79:                                     ; preds = %75
  %sunkaddr177 = ptrtoint %struct.jpeg_source_mgr* %74 to i64
  %sunkaddr178 = add i64 %sunkaddr177, 24
  %sunkaddr179 = inttoptr i64 %sunkaddr178 to i32 (%struct.jpeg_decompress_struct*)**
  %80 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %sunkaddr179, align 8
  %81 = tail call i32 %80(%struct.jpeg_decompress_struct* %73) #4
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %83, label %84

; <label>:83:                                     ; preds = %79
  store i64 0, i64* %4, align 8
  br label %.loopexit

; <label>:84:                                     ; preds = %79
  %85 = bitcast %struct.jpeg_source_mgr* %74 to i8**
  %86 = load i8*, i8** %85, align 8
  %sunkaddr180 = ptrtoint %struct.jpeg_source_mgr* %74 to i64
  %sunkaddr181 = add i64 %sunkaddr180, 8
  %sunkaddr182 = inttoptr i64 %sunkaddr181 to i64*
  %87 = load i64, i64* %sunkaddr182, align 8
  br label %88

; <label>:88:                                     ; preds = %75, %84
  %89 = phi i8* [ %76, %75 ], [ %86, %84 ]
  %90 = phi i64 [ %77, %75 ], [ %87, %84 ]
  %91 = add i64 %90, -1
  %92 = getelementptr inbounds i8, i8* %89, i64 1
  %93 = load i8, i8* %89, align 1
  %94 = zext i8 %93 to i32
  %95 = icmp eq i8 %93, -1
  br i1 %95, label %75, label %96

; <label>:96:                                     ; preds = %88
  store i64 %91, i64* %4, align 8
  %97 = icmp eq i8 %93, 0
  %98 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %73, i64 0, i32 78
  %99 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %98, align 8
  %100 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %99, i64 0, i32 8
  %101 = load i32, i32* %100, align 4
  br i1 %97, label %102, label %109

; <label>:102:                                    ; preds = %96
  %103 = ptrtoint i8* %92 to i64
  %104 = add i32 %101, 2
  %sunkaddr83 = ptrtoint %struct.jpeg_marker_reader* %99 to i64
  %sunkaddr84 = add i64 %sunkaddr83, 172
  %sunkaddr85 = inttoptr i64 %sunkaddr84 to i32*
  store i32 %104, i32* %sunkaddr85, align 4
  store i64 %103, i64* %69, align 8
  %105 = load i64, i64* %4, align 8
  %106 = getelementptr inbounds i64, i64* %69, i64 1
  store i64 %105, i64* %106, align 8
  %107 = bitcast i64* %69 to %struct.jpeg_source_mgr*
  %108 = bitcast i64* %69 to i8**
  br label %15

; <label>:109:                                    ; preds = %96
  %110 = icmp eq i32 %101, 0
  br i1 %110, label %130, label %111

; <label>:111:                                    ; preds = %109
  %112 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %72, align 8
  %113 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %112, i64 0, i32 5
  store i32 112, i32* %113, align 8
  %114 = getelementptr inbounds %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %72, i64 71
  %115 = bitcast %struct.jpeg_error_mgr** %114 to %struct.jpeg_marker_reader**
  %116 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %115, align 8
  %117 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %116, i64 0, i32 8
  %118 = load i32, i32* %117, align 4
  %119 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %71, align 8
  %120 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %119, i64 0, i32 6, i32 0, i64 0
  store i32 %118, i32* %120, align 4
  %121 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %71, align 8
  %122 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %121, i64 0, i32 6, i32 0, i64 1
  store i32 %94, i32* %122, align 4
  %123 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %70, align 8
  %124 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %123, i64 0, i32 1
  %125 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %124, align 8
  %.cast21 = bitcast %struct.jpeg_error_mgr** %70 to %struct.jpeg_common_struct*
  tail call void %125(%struct.jpeg_common_struct* %.cast21, i32 -1) #4
  %126 = getelementptr inbounds %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %70, i64 71
  %127 = bitcast %struct.jpeg_error_mgr** %126 to %struct.jpeg_marker_reader**
  %128 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %127, align 8
  %129 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %128, i64 0, i32 8
  store i32 0, i32* %129, align 4
  br label %130

; <label>:130:                                    ; preds = %109, %111
  %131 = ptrtoint i8* %92 to i64
  %132 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %73, i64 0, i32 72
  store i32 %94, i32* %132, align 4
  store i64 %131, i64* %69, align 8
  %133 = load i64, i64* %4, align 8
  %134 = getelementptr inbounds i64, i64* %69, i64 1
  store i64 %133, i64* %134, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %26
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %130, %83, %55
  %135 = phi i32 [ 1, %130 ], [ 0, %83 ], [ 0, %55 ], [ 0, %.loopexit.loopexit ]
  ret i32 %135
}

; Function Attrs: noinline nounwind uwtable
define void @jinit_marker_reader(%struct.jpeg_decompress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %.cast = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %6 = tail call i8* %5(%struct.jpeg_common_struct* %.cast, i32 0, i64 176) #4
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %8 = bitcast %struct.jpeg_marker_reader** %7 to i8**
  store i8* %6, i8** %8, align 8
  %.cast1 = bitcast i8* %6 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @reset_marker_reader, void (%struct.jpeg_decompress_struct*)** %.cast1, align 8
  %9 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %10 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %9, i64 0, i32 1
  store i32 (%struct.jpeg_decompress_struct*)* @read_markers, i32 (%struct.jpeg_decompress_struct*)** %10, align 8
  %11 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %12 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %11, i64 0, i32 2
  store i32 (%struct.jpeg_decompress_struct*)* @read_restart_marker, i32 (%struct.jpeg_decompress_struct*)** %12, align 8
  %13 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %14 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %13, i64 0, i32 3
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %14, align 8
  %15 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %16 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %15, i64 0, i32 4, i64 0
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %16, align 8
  %17 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %18 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %17, i64 0, i32 4, i64 1
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %18, align 8
  %19 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %20 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %19, i64 0, i32 4, i64 2
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %20, align 8
  %21 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %22 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %21, i64 0, i32 4, i64 3
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %22, align 8
  %23 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %24 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %23, i64 0, i32 4, i64 4
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %24, align 8
  %25 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %26 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %25, i64 0, i32 4, i64 5
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %26, align 8
  %27 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %28 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %27, i64 0, i32 4, i64 6
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %28, align 8
  %29 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %30 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %29, i64 0, i32 4, i64 7
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %30, align 8
  %31 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %32 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %31, i64 0, i32 4, i64 8
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %32, align 8
  %33 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %34 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %33, i64 0, i32 4, i64 9
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %34, align 8
  %35 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %36 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %35, i64 0, i32 4, i64 10
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %36, align 8
  %37 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %38 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %37, i64 0, i32 4, i64 11
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %38, align 8
  %39 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %40 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %39, i64 0, i32 4, i64 12
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %40, align 8
  %41 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %42 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %41, i64 0, i32 4, i64 13
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %42, align 8
  %43 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %44 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %43, i64 0, i32 4, i64 14
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %44, align 8
  %45 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %46 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %45, i64 0, i32 4, i64 15
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %46, align 8
  %47 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %48 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %47, i64 0, i32 4, i64 0
  store i32 (%struct.jpeg_decompress_struct*)* @get_app0, i32 (%struct.jpeg_decompress_struct*)** %48, align 8
  %49 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %7, align 8
  %50 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %49, i64 0, i32 4, i64 14
  store i32 (%struct.jpeg_decompress_struct*)* @get_app14, i32 (%struct.jpeg_decompress_struct*)** %50, align 8
  tail call void @reset_marker_reader(%struct.jpeg_decompress_struct* %0)
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @reset_marker_reader(%struct.jpeg_decompress_struct* nocapture) #1 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  store %struct.jpeg_component_info* null, %struct.jpeg_component_info** %2, align 8
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 34
  store i32 0, i32* %3, align 4
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %6 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %6, i64 0, i32 5
  store i32 0, i32* %7, align 8
  %8 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %5, align 8
  %9 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %8, i64 0, i32 6
  store i32 0, i32* %9, align 4
  %10 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %5, align 8
  %11 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %10, i64 0, i32 8
  store i32 0, i32* %11, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @read_markers(%struct.jpeg_decompress_struct*) #0 {
  %.phi.trans.insert = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  %.pre = load i32, i32* %.phi.trans.insert, align 4
  %phitmp = icmp eq i32 %.pre, 0
  br i1 %phitmp, label %2, label %13

; <label>:2:                                      ; preds = %.critedge, %1
  %sunkaddr12 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 568
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to %struct.jpeg_marker_reader**
  %3 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %sunkaddr14, align 8
  %4 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %3, i64 0, i32 5
  %5 = load i32, i32* %4, align 8
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %10

; <label>:7:                                      ; preds = %2
  %8 = tail call fastcc i32 @first_marker(%struct.jpeg_decompress_struct* nonnull %0)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %.loopexit, label %13

; <label>:10:                                     ; preds = %2
  %11 = tail call fastcc i32 @next_marker(%struct.jpeg_decompress_struct* nonnull %0)
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %.loopexit, label %13

; <label>:13:                                     ; preds = %10, %7, %1
  %sunkaddr15 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 524
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i32*
  %14 = load i32, i32* %sunkaddr17, align 4
  %15 = sext i32 %14 to i64
  switch i32 %14, label %91 [
    i32 216, label %16
    i32 192, label %17
    i32 193, label %17
    i32 194, label %20
    i32 201, label %23
    i32 202, label %26
    i32 195, label %29
    i32 197, label %29
    i32 198, label %29
    i32 199, label %29
    i32 200, label %29
    i32 203, label %29
    i32 205, label %29
    i32 206, label %29
    i32 207, label %29
    i32 218, label %40
    i32 217, label %44
    i32 204, label %52
    i32 196, label %55
    i32 219, label %58
    i32 221, label %61
    i32 224, label %64
    i32 225, label %64
    i32 226, label %64
    i32 227, label %64
    i32 228, label %64
    i32 229, label %64
    i32 230, label %64
    i32 231, label %64
    i32 232, label %64
    i32 233, label %64
    i32 234, label %64
    i32 235, label %64
    i32 236, label %64
    i32 237, label %64
    i32 238, label %64
    i32 239, label %64
    i32 254, label %71
    i32 208, label %77
    i32 209, label %77
    i32 210, label %77
    i32 211, label %77
    i32 212, label %77
    i32 213, label %77
    i32 214, label %77
    i32 215, label %77
    i32 1, label %77
    i32 220, label %88
  ]

; <label>:16:                                     ; preds = %13
  tail call fastcc void @get_soi(%struct.jpeg_decompress_struct* nonnull %0)
  br label %.critedge

; <label>:17:                                     ; preds = %13, %13
  %18 = tail call fastcc i32 @get_sof(%struct.jpeg_decompress_struct* nonnull %0, i32 0, i32 0)
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %.loopexit, label %.critedge

; <label>:20:                                     ; preds = %13
  %21 = tail call fastcc i32 @get_sof(%struct.jpeg_decompress_struct* nonnull %0, i32 1, i32 0)
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %.loopexit, label %.critedge

; <label>:23:                                     ; preds = %13
  %24 = tail call fastcc i32 @get_sof(%struct.jpeg_decompress_struct* nonnull %0, i32 0, i32 1)
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %.loopexit, label %.critedge

; <label>:26:                                     ; preds = %13
  %27 = tail call fastcc i32 @get_sof(%struct.jpeg_decompress_struct* nonnull %0, i32 1, i32 1)
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %.loopexit, label %.critedge

; <label>:29:                                     ; preds = %13, %13, %13, %13, %13, %13, %13, %13, %13
  %30 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %31 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %32 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %33 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %34 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %33, i64 0, i32 5
  store i32 59, i32* %34, align 8
  %sunkaddr18 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr19 = add i64 %sunkaddr18, 524
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i32*
  %35 = load i32, i32* %sunkaddr20, align 4
  %36 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %37 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %36, i64 0, i32 6, i32 0, i64 0
  store i32 %35, i32* %37, align 4
  %38 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %30, align 8
  %39 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %38, align 8
  tail call void %39(%struct.jpeg_common_struct* nonnull %32) #4
  br label %.critedge

; <label>:40:                                     ; preds = %13
  %41 = tail call fastcc i32 @get_sos(%struct.jpeg_decompress_struct* nonnull %0)
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %.loopexit, label %43

; <label>:43:                                     ; preds = %40
  %sunkaddr21 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr22 = add i64 %sunkaddr21, 524
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to i32*
  store i32 0, i32* %sunkaddr23, align 4
  br label %.loopexit

; <label>:44:                                     ; preds = %13
  %45 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %46 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %47 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %45, align 8
  %48 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i64 0, i32 5
  store i32 84, i32* %48, align 8
  %49 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %45, align 8
  %50 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %49, i64 0, i32 1
  %51 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %50, align 8
  tail call void %51(%struct.jpeg_common_struct* nonnull %46, i32 1) #4
  %sunkaddr24 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr25 = add i64 %sunkaddr24, 524
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to i32*
  store i32 0, i32* %sunkaddr26, align 4
  br label %.loopexit

; <label>:52:                                     ; preds = %13
  %53 = tail call fastcc i32 @get_dac(%struct.jpeg_decompress_struct* nonnull %0)
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %.loopexit, label %.critedge

; <label>:55:                                     ; preds = %13
  %56 = tail call fastcc i32 @get_dht(%struct.jpeg_decompress_struct* nonnull %0)
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %.loopexit, label %.critedge

; <label>:58:                                     ; preds = %13
  %59 = tail call fastcc i32 @get_dqt(%struct.jpeg_decompress_struct* nonnull %0)
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %.loopexit, label %.critedge

; <label>:61:                                     ; preds = %13
  %62 = tail call fastcc i32 @get_dri(%struct.jpeg_decompress_struct* nonnull %0)
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %.loopexit, label %.critedge

; <label>:64:                                     ; preds = %13, %13, %13, %13, %13, %13, %13, %13, %13, %13, %13, %13, %13, %13, %13, %13
  %sunkaddr27 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr28 = add i64 %sunkaddr27, 568
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to %struct.jpeg_marker_reader**
  %65 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %sunkaddr29, align 8
  %66 = add nsw i64 %15, -224
  %67 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %65, i64 0, i32 4, i64 %66
  %68 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %67, align 8
  %69 = tail call i32 %68(%struct.jpeg_decompress_struct* nonnull %0) #4
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %.loopexit, label %.critedge

; <label>:71:                                     ; preds = %13
  %sunkaddr30 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr31 = add i64 %sunkaddr30, 568
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to %struct.jpeg_marker_reader**
  %72 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %sunkaddr32, align 8
  %73 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %72, i64 0, i32 3
  %74 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %73, align 8
  %75 = tail call i32 %74(%struct.jpeg_decompress_struct* nonnull %0) #4
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %.loopexit, label %.critedge

; <label>:77:                                     ; preds = %13, %13, %13, %13, %13, %13, %13, %13, %13
  %78 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %79 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %80 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %78, align 8
  %81 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %80, i64 0, i32 5
  store i32 91, i32* %81, align 8
  %sunkaddr33 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr34 = add i64 %sunkaddr33, 524
  %sunkaddr35 = inttoptr i64 %sunkaddr34 to i32*
  %82 = load i32, i32* %sunkaddr35, align 4
  %83 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %78, align 8
  %84 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %83, i64 0, i32 6, i32 0, i64 0
  store i32 %82, i32* %84, align 4
  %85 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %78, align 8
  %86 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %85, i64 0, i32 1
  %87 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %86, align 8
  tail call void %87(%struct.jpeg_common_struct* nonnull %79, i32 1) #4
  br label %.critedge

; <label>:88:                                     ; preds = %13
  %89 = tail call i32 @skip_variable(%struct.jpeg_decompress_struct* nonnull %0)
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %.loopexit, label %.critedge

; <label>:91:                                     ; preds = %13
  %92 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %93 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %94 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %95 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %93, align 8
  %96 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %95, i64 0, i32 5
  store i32 67, i32* %96, align 8
  %sunkaddr36 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr37 = add i64 %sunkaddr36, 524
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to i32*
  %97 = load i32, i32* %sunkaddr38, align 4
  %98 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %93, align 8
  %99 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i64 0, i32 6, i32 0, i64 0
  store i32 %97, i32* %99, align 4
  %100 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %92, align 8
  %101 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %100, align 8
  tail call void %101(%struct.jpeg_common_struct* nonnull %94) #4
  br label %.critedge

.critedge:                                        ; preds = %16, %17, %20, %23, %26, %52, %55, %58, %61, %64, %71, %88, %91, %77, %29
  %sunkaddr39 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr40 = add i64 %sunkaddr39, 524
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to i32*
  store i32 0, i32* %sunkaddr41, align 4
  br label %2

.loopexit:                                        ; preds = %88, %71, %64, %61, %58, %55, %52, %26, %23, %20, %17, %10, %7, %40, %44, %43
  %102 = phi i32 [ 2, %44 ], [ 1, %43 ], [ 0, %40 ], [ 0, %7 ], [ 0, %10 ], [ 0, %17 ], [ 0, %20 ], [ 0, %23 ], [ 0, %26 ], [ 0, %52 ], [ 0, %55 ], [ 0, %58 ], [ 0, %61 ], [ 0, %64 ], [ 0, %71 ], [ 0, %88 ]
  ret i32 %102
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @read_restart_marker(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %8

; <label>:5:                                      ; preds = %1
  %6 = tail call fastcc i32 @next_marker(%struct.jpeg_decompress_struct* nonnull %0)
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %42, label %._crit_edge

._crit_edge:                                      ; preds = %5
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr3 = add i64 %sunkaddr, 524
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to i32*
  %.pre = load i32, i32* %sunkaddr4, align 4
  br label %8

; <label>:8:                                      ; preds = %._crit_edge, %1
  %9 = phi i32 [ %.pre, %._crit_edge ], [ %3, %1 ]
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %11 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %11, i64 0, i32 7
  %13 = load i32, i32* %12, align 8
  %14 = add nsw i32 %13, 208
  %15 = icmp eq i32 %9, %14
  br i1 %15, label %16, label %28

; <label>:16:                                     ; preds = %8
  %17 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i64 0, i32 5
  store i32 97, i32* %19, align 8
  %sunkaddr5 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr6 = add i64 %sunkaddr5, 568
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to %struct.jpeg_marker_reader**
  %20 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %sunkaddr7, align 8
  %21 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %20, i64 0, i32 7
  %22 = load i32, i32* %21, align 8
  %23 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %24 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %23, i64 0, i32 6, i32 0, i64 0
  store i32 %22, i32* %24, align 4
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i64 0, i32 1
  %27 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %26, align 8
  %.cast1 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %27(%struct.jpeg_common_struct* %.cast1, i32 3) #4
  %sunkaddr15 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 524
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i32*
  store i32 0, i32* %sunkaddr17, align 4
  br label %36

; <label>:28:                                     ; preds = %8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %30 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %30, i64 0, i32 5
  %32 = bitcast {}** %31 to i32 (%struct.jpeg_decompress_struct*, i32)**
  %33 = load i32 (%struct.jpeg_decompress_struct*, i32)*, i32 (%struct.jpeg_decompress_struct*, i32)** %32, align 8
  %34 = tail call i32 %33(%struct.jpeg_decompress_struct* nonnull %0, i32 %13) #4
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %42, label %._crit_edge11

._crit_edge11:                                    ; preds = %28
  %.pre12 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %.pre13 = add i64 %.pre12, 568
  %.pre14 = inttoptr i64 %.pre13 to %struct.jpeg_marker_reader**
  br label %36

; <label>:36:                                     ; preds = %._crit_edge11, %16
  %sunkaddr10.pre-phi = phi %struct.jpeg_marker_reader** [ %.pre14, %._crit_edge11 ], [ %sunkaddr7, %16 ]
  %37 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %sunkaddr10.pre-phi, align 8
  %38 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %37, i64 0, i32 7
  %39 = load i32, i32* %38, align 8
  %40 = add nsw i32 %39, 1
  %41 = and i32 %40, 7
  store i32 %41, i32* %38, align 8
  br label %42

; <label>:42:                                     ; preds = %28, %5, %36
  %43 = phi i32 [ 1, %36 ], [ 0, %5 ], [ 0, %28 ]
  ret i32 %43
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @skip_variable(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %6 = bitcast %struct.jpeg_source_mgr** %5 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = inttoptr i64 %7 to i8**
  %9 = load i8*, i8** %8, align 8
  %.cast = inttoptr i64 %7 to %struct.jpeg_source_mgr*
  %10 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %.cast, i64 0, i32 1
  %11 = load i64, i64* %10, align 8
  store i64 %11, i64* %4, align 8
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %13, label %25

; <label>:13:                                     ; preds = %1
  %14 = inttoptr i64 %7 to %struct.jpeg_source_mgr*
  %15 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %14, i64 0, i32 3
  %16 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %15, align 8
  %17 = tail call i32 %16(%struct.jpeg_decompress_struct* nonnull %0) #4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %77, label %19

; <label>:19:                                     ; preds = %13
  %20 = inttoptr i64 %7 to i8**
  %21 = inttoptr i64 %7 to i64*
  %22 = load i8*, i8** %20, align 8
  %23 = getelementptr inbounds i64, i64* %21, i64 1
  %24 = load i64, i64* %23, align 8
  store i64 %24, i64* %4, align 8
  br label %25

; <label>:25:                                     ; preds = %19, %1
  %26 = phi i8* [ %22, %19 ], [ %9, %1 ]
  %27 = phi i64 [ %24, %19 ], [ %11, %1 ]
  %28 = add i64 %27, -1
  store i64 %28, i64* %4, align 8
  %29 = load i8, i8* %26, align 1
  %30 = zext i8 %29 to i64
  %31 = shl nuw nsw i64 %30, 8
  store i64 %31, i64* %3, align 8
  %32 = icmp eq i64 %28, 0
  br i1 %32, label %34, label %._crit_edge

._crit_edge:                                      ; preds = %25
  %33 = getelementptr inbounds i8, i8* %26, i64 1
  br label %46

; <label>:34:                                     ; preds = %25
  %35 = inttoptr i64 %7 to %struct.jpeg_source_mgr*
  %36 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %35, i64 0, i32 3
  %37 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %36, align 8
  %38 = tail call i32 %37(%struct.jpeg_decompress_struct* nonnull %0) #4
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %77, label %40

; <label>:40:                                     ; preds = %34
  %41 = inttoptr i64 %7 to i8**
  %42 = inttoptr i64 %7 to i64*
  %43 = load i8*, i8** %41, align 8
  %44 = getelementptr inbounds i64, i64* %42, i64 1
  %45 = load i64, i64* %44, align 8
  store i64 %45, i64* %4, align 8
  br label %46

; <label>:46:                                     ; preds = %._crit_edge, %40
  %47 = phi i8* [ %33, %._crit_edge ], [ %43, %40 ]
  %48 = phi i64 [ %28, %._crit_edge ], [ %45, %40 ]
  %49 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %50 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %51 = add i64 %48, -1
  store i64 %51, i64* %4, align 8
  %52 = getelementptr inbounds i8, i8* %47, i64 1
  %53 = load i8, i8* %47, align 1
  %54 = zext i8 %53 to i64
  %55 = or i64 %31, %54
  store i64 %55, i64* %3, align 8
  %56 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %50, align 8
  %57 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %56, i64 0, i32 5
  store i32 90, i32* %57, align 8
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  %59 = load i32, i32* %58, align 4
  %60 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %50, align 8
  %61 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %60, i64 0, i32 6, i32 0, i64 0
  store i32 %59, i32* %61, align 4
  %62 = trunc i64 %55 to i32
  %63 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %50, align 8
  %64 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %63, i64 0, i32 6, i32 0, i64 1
  store i32 %62, i32* %64, align 4
  %65 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %50, align 8
  %66 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %65, i64 0, i32 1
  %67 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %66, align 8
  tail call void %67(%struct.jpeg_common_struct* %49, i32 1) #4
  %68 = ptrtoint i8* %52 to i64
  %sunkaddr8 = inttoptr i64 %7 to i64*
  store i64 %68, i64* %sunkaddr8, align 8
  %69 = load i64, i64* %4, align 8
  %sunkaddr = add i64 %7, 8
  %sunkaddr7 = inttoptr i64 %sunkaddr to i64*
  store i64 %69, i64* %sunkaddr7, align 8
  %70 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %71 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %70, i64 0, i32 5
  %72 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %71, align 8
  %73 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %72, i64 0, i32 4
  %74 = load void (%struct.jpeg_decompress_struct*, i64)*, void (%struct.jpeg_decompress_struct*, i64)** %73, align 8
  %75 = load i64, i64* %3, align 8
  %76 = add nsw i64 %75, -2
  tail call void %74(%struct.jpeg_decompress_struct* %70, i64 %76) #4
  br label %77

; <label>:77:                                     ; preds = %34, %13, %46
  %78 = phi i32 [ 1, %46 ], [ 0, %13 ], [ 0, %34 ]
  ret i32 %78
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_app0(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca i64, align 8
  %4 = alloca [14 x i8], align 1
  %5 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %7 = bitcast %struct.jpeg_source_mgr** %6 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = inttoptr i64 %8 to i8**
  %10 = load i8*, i8** %9, align 8
  %.cast = inttoptr i64 %8 to %struct.jpeg_source_mgr*
  %11 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %.cast, i64 0, i32 1
  %12 = load i64, i64* %11, align 8
  store i64 %12, i64* %5, align 8
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %26

; <label>:14:                                     ; preds = %1
  %15 = inttoptr i64 %8 to %struct.jpeg_source_mgr*
  %16 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %15, i64 0, i32 3
  %17 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %16, align 8
  %18 = tail call i32 %17(%struct.jpeg_decompress_struct* nonnull %0) #4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %241, label %20

; <label>:20:                                     ; preds = %14
  %21 = inttoptr i64 %8 to i8**
  %22 = inttoptr i64 %8 to i64*
  %23 = load i8*, i8** %21, align 8
  %24 = getelementptr inbounds i64, i64* %22, i64 1
  %25 = load i64, i64* %24, align 8
  store i64 %25, i64* %5, align 8
  br label %26

; <label>:26:                                     ; preds = %20, %1
  %27 = phi i8* [ %23, %20 ], [ %10, %1 ]
  %28 = phi i64 [ %25, %20 ], [ %12, %1 ]
  %29 = add i64 %28, -1
  store i64 %29, i64* %5, align 8
  %30 = getelementptr inbounds i8, i8* %27, i64 1
  %31 = load i8, i8* %27, align 1
  %32 = zext i8 %31 to i64
  %33 = shl nuw nsw i64 %32, 8
  store i64 %33, i64* %3, align 8
  %34 = icmp eq i64 %29, 0
  br i1 %34, label %35, label %47

; <label>:35:                                     ; preds = %26
  %36 = inttoptr i64 %8 to %struct.jpeg_source_mgr*
  %37 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %36, i64 0, i32 3
  %38 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %37, align 8
  %39 = tail call i32 %38(%struct.jpeg_decompress_struct* nonnull %0) #4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %241, label %41

; <label>:41:                                     ; preds = %35
  %42 = inttoptr i64 %8 to i8**
  %43 = inttoptr i64 %8 to i64*
  %44 = load i8*, i8** %42, align 8
  %45 = getelementptr inbounds i64, i64* %43, i64 1
  %46 = load i64, i64* %45, align 8
  store i64 %46, i64* %5, align 8
  br label %47

; <label>:47:                                     ; preds = %26, %41
  %48 = phi i8* [ %30, %26 ], [ %44, %41 ]
  %49 = phi i64 [ %29, %26 ], [ %46, %41 ]
  %50 = add i64 %49, -1
  store i64 %50, i64* %5, align 8
  %51 = getelementptr inbounds i8, i8* %48, i64 1
  %52 = load i8, i8* %48, align 1
  %53 = zext i8 %52 to i64
  %54 = or i64 %33, %53
  %55 = add nsw i64 %54, -2
  store i64 %55, i64* %3, align 8
  %56 = icmp sgt i64 %55, 13
  br i1 %56, label %.lr.ph, label %217

.lr.ph:                                           ; preds = %47
  br label %57

; <label>:57:                                     ; preds = %.lr.ph, %70
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %70 ]
  %58 = phi i8* [ %51, %.lr.ph ], [ %74, %70 ]
  %59 = phi i64 [ %50, %.lr.ph ], [ %73, %70 ]
  %60 = icmp eq i64 %59, 0
  br i1 %60, label %61, label %70

; <label>:61:                                     ; preds = %57
  %sunkaddr37 = add i64 %8, 24
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to i32 (%struct.jpeg_decompress_struct*)**
  %62 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %sunkaddr38, align 8
  %63 = tail call i32 %62(%struct.jpeg_decompress_struct* %0) #4
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %65, label %66

; <label>:65:                                     ; preds = %61
  store i64 0, i64* %5, align 8
  br label %241

; <label>:66:                                     ; preds = %61
  %67 = inttoptr i64 %8 to i8**
  %68 = load i8*, i8** %67, align 8
  %sunkaddr = add i64 %8, 8
  %sunkaddr39 = inttoptr i64 %sunkaddr to i64*
  %69 = load i64, i64* %sunkaddr39, align 8
  br label %70

; <label>:70:                                     ; preds = %57, %66
  %71 = phi i8* [ %58, %57 ], [ %68, %66 ]
  %72 = phi i64 [ %59, %57 ], [ %69, %66 ]
  %73 = add i64 %72, -1
  %74 = getelementptr inbounds i8, i8* %71, i64 1
  %75 = load i8, i8* %71, align 1
  %76 = getelementptr inbounds [14 x i8], [14 x i8]* %4, i64 0, i64 %indvars.iv
  store i8 %75, i8* %76, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %77 = icmp slt i64 %indvars.iv.next, 14
  br i1 %77, label %57, label %78

; <label>:78:                                     ; preds = %70
  store i64 %73, i64* %5, align 8
  %.phi.trans.insert2740 = bitcast [14 x i8]* %4 to i8*
  %.pre = load i8, i8* %.phi.trans.insert2740, align 1
  %phitmp = icmp eq i8 %.pre, 74
  %79 = add nsw i64 %54, -16
  store i64 %79, i64* %3, align 8
  br i1 %phitmp, label %80, label %205

; <label>:80:                                     ; preds = %78
  %81 = getelementptr inbounds [14 x i8], [14 x i8]* %4, i64 0, i64 1
  %82 = load i8, i8* %81, align 1
  %83 = icmp eq i8 %82, 70
  br i1 %83, label %84, label %205

; <label>:84:                                     ; preds = %80
  %85 = getelementptr inbounds [14 x i8], [14 x i8]* %4, i64 0, i64 2
  %86 = load i8, i8* %85, align 1
  %87 = icmp eq i8 %86, 73
  br i1 %87, label %88, label %205

; <label>:88:                                     ; preds = %84
  %89 = getelementptr inbounds [14 x i8], [14 x i8]* %4, i64 0, i64 3
  %90 = load i8, i8* %89, align 1
  %91 = icmp eq i8 %90, 70
  br i1 %91, label %92, label %205

; <label>:92:                                     ; preds = %88
  %93 = getelementptr inbounds [14 x i8], [14 x i8]* %4, i64 0, i64 4
  %94 = load i8, i8* %93, align 1
  %95 = icmp eq i8 %94, 0
  br i1 %95, label %96, label %205

; <label>:96:                                     ; preds = %92
  %97 = getelementptr inbounds [14 x i8], [14 x i8]* %4, i64 0, i64 5
  %98 = load i8, i8* %97, align 1
  %99 = zext i8 %98 to i32
  %100 = icmp eq i8 %98, 1
  br i1 %100, label %116, label %101

; <label>:101:                                    ; preds = %96
  %102 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %103 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %104 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %103, align 8
  %105 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %104, i64 0, i32 5
  store i32 115, i32* %105, align 8
  %106 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %103, align 8
  %107 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %106, i64 0, i32 6, i32 0, i64 0
  store i32 %99, i32* %107, align 4
  %108 = getelementptr inbounds [14 x i8], [14 x i8]* %4, i64 0, i64 6
  %109 = load i8, i8* %108, align 1
  %110 = zext i8 %109 to i32
  %111 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %103, align 8
  %112 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %111, i64 0, i32 6, i32 0, i64 1
  store i32 %110, i32* %112, align 4
  %113 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %103, align 8
  %114 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %113, i64 0, i32 1
  %115 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %114, align 8
  tail call void %115(%struct.jpeg_common_struct* %102, i32 -1) #4
  br label %._crit_edge15

; <label>:116:                                    ; preds = %96
  %117 = getelementptr inbounds [14 x i8], [14 x i8]* %4, i64 0, i64 6
  %118 = load i8, i8* %117, align 1
  %119 = zext i8 %118 to i32
  %120 = icmp ugt i8 %118, 2
  br i1 %120, label %121, label %.._crit_edge15_crit_edge

.._crit_edge15_crit_edge:                         ; preds = %116
  %.pre32 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %.pre3341 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  br label %._crit_edge15

; <label>:121:                                    ; preds = %116
  %122 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %123 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %124 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %123, align 8
  %125 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %124, i64 0, i32 5
  store i32 88, i32* %125, align 8
  %126 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %123, align 8
  %127 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %126, i64 0, i32 6, i32 0, i64 0
  store i32 1, i32* %127, align 4
  %128 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %123, align 8
  %129 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %128, i64 0, i32 6, i32 0, i64 1
  store i32 %119, i32* %129, align 4
  %130 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %123, align 8
  %131 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %130, i64 0, i32 1
  %132 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %131, align 8
  tail call void %132(%struct.jpeg_common_struct* %122, i32 1) #4
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %.._crit_edge15_crit_edge, %121, %101
  %.pre-phi34 = phi %struct.jpeg_error_mgr** [ %.pre3341, %.._crit_edge15_crit_edge ], [ %123, %121 ], [ %103, %101 ]
  %.pre-phi = phi %struct.jpeg_common_struct* [ %.pre32, %.._crit_edge15_crit_edge ], [ %122, %121 ], [ %102, %101 ]
  %133 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 50
  store i32 1, i32* %133, align 4
  %134 = getelementptr inbounds [14 x i8], [14 x i8]* %4, i64 0, i64 7
  %135 = load i8, i8* %134, align 1
  %136 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 51
  store i8 %135, i8* %136, align 8
  %137 = getelementptr inbounds [14 x i8], [14 x i8]* %4, i64 0, i64 8
  %138 = load i8, i8* %137, align 1
  %139 = zext i8 %138 to i16
  %140 = shl nuw i16 %139, 8
  %141 = getelementptr inbounds [14 x i8], [14 x i8]* %4, i64 0, i64 9
  %142 = load i8, i8* %141, align 1
  %143 = zext i8 %142 to i16
  %144 = or i16 %140, %143
  %145 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 52
  %146 = bitcast i16* %145 to <2 x i16>*
  %147 = getelementptr inbounds [14 x i8], [14 x i8]* %4, i64 0, i64 10
  %148 = load i8, i8* %147, align 1
  %149 = zext i8 %148 to i16
  %150 = shl nuw i16 %149, 8
  %151 = getelementptr inbounds [14 x i8], [14 x i8]* %4, i64 0, i64 11
  %152 = load i8, i8* %151, align 1
  %153 = zext i8 %152 to i16
  %154 = or i16 %150, %153
  %155 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 53
  %156 = insertelement <2 x i16> undef, i16 %144, i32 0
  %157 = insertelement <2 x i16> %156, i16 %154, i32 1
  store <2 x i16> %157, <2 x i16>* %146, align 2
  %sunkaddr42 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to %struct.jpeg_error_mgr**
  %158 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %sunkaddr43, align 8
  %159 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %158, i64 0, i32 6, i32 0, i64 0
  %160 = zext i16 %144 to i32
  store i32 %160, i32* %159, align 4
  %161 = load i16, i16* %155, align 4
  %162 = zext i16 %161 to i32
  %163 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %158, i64 0, i32 6, i32 0, i64 1
  store i32 %162, i32* %163, align 4
  %164 = load i8, i8* %136, align 8
  %165 = zext i8 %164 to i32
  %166 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %158, i64 0, i32 6, i32 0, i64 2
  store i32 %165, i32* %166, align 4
  %167 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %sunkaddr43, align 8
  %168 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %167, i64 0, i32 5
  store i32 86, i32* %168, align 8
  %169 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %sunkaddr43, align 8
  %170 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %169, i64 0, i32 1
  %171 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %170, align 8
  tail call void %171(%struct.jpeg_common_struct* %.pre-phi, i32 1) #4
  %172 = getelementptr inbounds [14 x i8], [14 x i8]* %4, i64 0, i64 12
  %173 = load i8, i8* %172, align 1
  %174 = zext i8 %173 to i32
  %175 = getelementptr inbounds [14 x i8], [14 x i8]* %4, i64 0, i64 13
  %176 = load i8, i8* %175, align 1
  %177 = zext i8 %176 to i32
  %178 = or i8 %173, %176
  %179 = icmp eq i8 %178, 0
  br i1 %179, label %190, label %180

; <label>:180:                                    ; preds = %._crit_edge15
  %181 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %.pre-phi34, align 8
  %182 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %181, i64 0, i32 5
  store i32 89, i32* %182, align 8
  %183 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %.pre-phi34, align 8
  %184 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %183, i64 0, i32 6, i32 0, i64 0
  store i32 %174, i32* %184, align 4
  %185 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %.pre-phi34, align 8
  %186 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %185, i64 0, i32 6, i32 0, i64 1
  store i32 %177, i32* %186, align 4
  %187 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %.pre-phi34, align 8
  %188 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %187, i64 0, i32 1
  %189 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %188, align 8
  tail call void %189(%struct.jpeg_common_struct* nonnull %.pre-phi, i32 1) #4
  br label %190

; <label>:190:                                    ; preds = %._crit_edge15, %180
  %191 = zext i8 %173 to i64
  %192 = zext i8 %176 to i64
  %193 = mul nuw nsw i64 %191, %192
  %194 = mul nuw nsw i64 %193, 3
  %195 = icmp eq i64 %79, %194
  br i1 %195, label %228, label %196

; <label>:196:                                    ; preds = %190
  %197 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %.pre-phi34, align 8
  %198 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %197, i64 0, i32 5
  store i32 87, i32* %198, align 8
  %199 = trunc i64 %79 to i32
  %200 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %.pre-phi34, align 8
  %201 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %200, i64 0, i32 6, i32 0, i64 0
  store i32 %199, i32* %201, align 4
  %202 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %.pre-phi34, align 8
  %203 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %202, i64 0, i32 1
  %204 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %203, align 8
  tail call void %204(%struct.jpeg_common_struct* nonnull %.pre-phi, i32 1) #4
  br label %228

; <label>:205:                                    ; preds = %92, %88, %84, %80, %78
  %206 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %207 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %208 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %207, align 8
  %209 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %208, i64 0, i32 5
  store i32 76, i32* %209, align 8
  %210 = trunc i64 %79 to i32
  %211 = add nsw i32 %210, 14
  %212 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %207, align 8
  %213 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %212, i64 0, i32 6, i32 0, i64 0
  store i32 %211, i32* %213, align 4
  %214 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %207, align 8
  %215 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %214, i64 0, i32 1
  %216 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %215, align 8
  tail call void %216(%struct.jpeg_common_struct* %206, i32 1) #4
  br label %228

; <label>:217:                                    ; preds = %47
  %218 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %219 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %220 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %219, align 8
  %221 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %220, i64 0, i32 5
  store i32 76, i32* %221, align 8
  %222 = trunc i64 %55 to i32
  %223 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %219, align 8
  %224 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %223, i64 0, i32 6, i32 0, i64 0
  store i32 %222, i32* %224, align 4
  %225 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %219, align 8
  %226 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %225, i64 0, i32 1
  %227 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %226, align 8
  tail call void %227(%struct.jpeg_common_struct* %218, i32 1) #4
  br label %228

; <label>:228:                                    ; preds = %190, %205, %196, %217
  %.in = phi i8* [ %74, %190 ], [ %74, %205 ], [ %74, %196 ], [ %51, %217 ]
  %229 = ptrtoint i8* %.in to i64
  %230 = inttoptr i64 %8 to i64*
  store i64 %229, i64* %230, align 8
  %231 = load i64, i64* %5, align 8
  %232 = getelementptr inbounds i64, i64* %230, i64 1
  store i64 %231, i64* %232, align 8
  %233 = load i64, i64* %3, align 8
  %234 = icmp sgt i64 %233, 0
  br i1 %234, label %235, label %241

; <label>:235:                                    ; preds = %228
  %236 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %237 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %236, i64 0, i32 5
  %238 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %237, align 8
  %239 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %238, i64 0, i32 4
  %240 = load void (%struct.jpeg_decompress_struct*, i64)*, void (%struct.jpeg_decompress_struct*, i64)** %239, align 8
  tail call void %240(%struct.jpeg_decompress_struct* %236, i64 %233) #4
  br label %241

; <label>:241:                                    ; preds = %228, %235, %35, %14, %65
  %242 = phi i32 [ 0, %65 ], [ 0, %14 ], [ 0, %35 ], [ 1, %235 ], [ 1, %228 ]
  ret i32 %242
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_app14(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca i64, align 8
  %4 = alloca [12 x i8], align 1
  %5 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %7 = bitcast %struct.jpeg_source_mgr** %6 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = inttoptr i64 %8 to i8**
  %10 = load i8*, i8** %9, align 8
  %.cast = inttoptr i64 %8 to %struct.jpeg_source_mgr*
  %11 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %.cast, i64 0, i32 1
  %12 = load i64, i64* %11, align 8
  store i64 %12, i64* %5, align 8
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %26

; <label>:14:                                     ; preds = %1
  %15 = inttoptr i64 %8 to %struct.jpeg_source_mgr*
  %16 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %15, i64 0, i32 3
  %17 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %16, align 8
  %18 = tail call i32 %17(%struct.jpeg_decompress_struct* nonnull %0) #4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %177, label %20

; <label>:20:                                     ; preds = %14
  %21 = inttoptr i64 %8 to i8**
  %22 = inttoptr i64 %8 to i64*
  %23 = load i8*, i8** %21, align 8
  %24 = getelementptr inbounds i64, i64* %22, i64 1
  %25 = load i64, i64* %24, align 8
  store i64 %25, i64* %5, align 8
  br label %26

; <label>:26:                                     ; preds = %20, %1
  %27 = phi i8* [ %23, %20 ], [ %10, %1 ]
  %28 = phi i64 [ %25, %20 ], [ %12, %1 ]
  %29 = add i64 %28, -1
  store i64 %29, i64* %5, align 8
  %30 = getelementptr inbounds i8, i8* %27, i64 1
  %31 = load i8, i8* %27, align 1
  %32 = zext i8 %31 to i64
  %33 = shl nuw nsw i64 %32, 8
  store i64 %33, i64* %3, align 8
  %34 = icmp eq i64 %29, 0
  br i1 %34, label %35, label %47

; <label>:35:                                     ; preds = %26
  %36 = inttoptr i64 %8 to %struct.jpeg_source_mgr*
  %37 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %36, i64 0, i32 3
  %38 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %37, align 8
  %39 = tail call i32 %38(%struct.jpeg_decompress_struct* nonnull %0) #4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %177, label %41

; <label>:41:                                     ; preds = %35
  %42 = inttoptr i64 %8 to i8**
  %43 = inttoptr i64 %8 to i64*
  %44 = load i8*, i8** %42, align 8
  %45 = getelementptr inbounds i64, i64* %43, i64 1
  %46 = load i64, i64* %45, align 8
  store i64 %46, i64* %5, align 8
  br label %47

; <label>:47:                                     ; preds = %26, %41
  %48 = phi i8* [ %30, %26 ], [ %44, %41 ]
  %49 = phi i64 [ %29, %26 ], [ %46, %41 ]
  %50 = add i64 %49, -1
  store i64 %50, i64* %5, align 8
  %51 = getelementptr inbounds i8, i8* %48, i64 1
  %52 = load i8, i8* %48, align 1
  %53 = zext i8 %52 to i64
  %54 = or i64 %33, %53
  %55 = add nsw i64 %54, -2
  store i64 %55, i64* %3, align 8
  %56 = icmp sgt i64 %55, 11
  br i1 %56, label %.lr.ph, label %153

.lr.ph:                                           ; preds = %47
  br label %57

; <label>:57:                                     ; preds = %.lr.ph, %70
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %70 ]
  %58 = phi i8* [ %51, %.lr.ph ], [ %74, %70 ]
  %59 = phi i64 [ %50, %.lr.ph ], [ %73, %70 ]
  %60 = icmp eq i64 %59, 0
  br i1 %60, label %61, label %70

; <label>:61:                                     ; preds = %57
  %sunkaddr29 = add i64 %8, 24
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i32 (%struct.jpeg_decompress_struct*)**
  %62 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %sunkaddr30, align 8
  %63 = tail call i32 %62(%struct.jpeg_decompress_struct* %0) #4
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %65, label %66

; <label>:65:                                     ; preds = %61
  store i64 0, i64* %5, align 8
  br label %177

; <label>:66:                                     ; preds = %61
  %67 = inttoptr i64 %8 to i8**
  %68 = load i8*, i8** %67, align 8
  %sunkaddr = add i64 %8, 8
  %sunkaddr31 = inttoptr i64 %sunkaddr to i64*
  %69 = load i64, i64* %sunkaddr31, align 8
  br label %70

; <label>:70:                                     ; preds = %57, %66
  %71 = phi i8* [ %58, %57 ], [ %68, %66 ]
  %72 = phi i64 [ %59, %57 ], [ %69, %66 ]
  %73 = add i64 %72, -1
  %74 = getelementptr inbounds i8, i8* %71, i64 1
  %75 = load i8, i8* %71, align 1
  %76 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 %indvars.iv
  store i8 %75, i8* %76, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %77 = icmp slt i64 %indvars.iv.next, 12
  br i1 %77, label %57, label %78

; <label>:78:                                     ; preds = %70
  store i64 %73, i64* %5, align 8
  %.phi.trans.insert2332 = bitcast [12 x i8]* %4 to i8*
  %.pre = load i8, i8* %.phi.trans.insert2332, align 1
  %phitmp = icmp eq i8 %.pre, 65
  %79 = add nsw i64 %54, -14
  store i64 %79, i64* %3, align 8
  br i1 %phitmp, label %80, label %141

; <label>:80:                                     ; preds = %78
  %81 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 1
  %82 = load i8, i8* %81, align 1
  %83 = icmp eq i8 %82, 100
  br i1 %83, label %84, label %141

; <label>:84:                                     ; preds = %80
  %85 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 2
  %86 = load i8, i8* %85, align 1
  %87 = icmp eq i8 %86, 111
  br i1 %87, label %88, label %141

; <label>:88:                                     ; preds = %84
  %89 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 3
  %90 = load i8, i8* %89, align 1
  %91 = icmp eq i8 %90, 98
  br i1 %91, label %92, label %141

; <label>:92:                                     ; preds = %88
  %93 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 4
  %94 = load i8, i8* %93, align 1
  %95 = icmp eq i8 %94, 101
  br i1 %95, label %96, label %141

; <label>:96:                                     ; preds = %92
  %97 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %98 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %99 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 5
  %100 = load i8, i8* %99, align 1
  %101 = zext i8 %100 to i32
  %102 = shl nuw nsw i32 %101, 8
  %103 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 6
  %104 = load i8, i8* %103, align 1
  %105 = zext i8 %104 to i32
  %106 = or i32 %102, %105
  %107 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 7
  %108 = load i8, i8* %107, align 1
  %109 = zext i8 %108 to i32
  %110 = shl nuw nsw i32 %109, 8
  %111 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 8
  %112 = load i8, i8* %111, align 1
  %113 = zext i8 %112 to i32
  %114 = or i32 %110, %113
  %115 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 9
  %116 = load i8, i8* %115, align 1
  %117 = zext i8 %116 to i32
  %118 = shl nuw nsw i32 %117, 8
  %119 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 10
  %120 = load i8, i8* %119, align 1
  %121 = zext i8 %120 to i32
  %122 = or i32 %118, %121
  %123 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 11
  %124 = load i8, i8* %123, align 1
  %125 = zext i8 %124 to i32
  %126 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %98, align 8
  %127 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %126, i64 0, i32 6, i32 0, i64 0
  %128 = insertelement <2 x i32> undef, i32 %106, i32 0
  %129 = insertelement <2 x i32> %128, i32 %114, i32 1
  %130 = bitcast i32* %127 to <4 x i32>*
  %131 = insertelement <2 x i32> undef, i32 %122, i32 0
  %132 = insertelement <2 x i32> %131, i32 %125, i32 1
  %133 = shufflevector <2 x i32> %129, <2 x i32> %132, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  store <4 x i32> %133, <4 x i32>* %130, align 4
  %134 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %98, align 8
  %135 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %134, i64 0, i32 5
  store i32 75, i32* %135, align 8
  %136 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %98, align 8
  %137 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i64 0, i32 1
  %138 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %137, align 8
  tail call void %138(%struct.jpeg_common_struct* %97, i32 1) #4
  %139 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 54
  store i32 1, i32* %139, align 8
  %140 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 55
  store i8 %124, i8* %140, align 4
  br label %164

; <label>:141:                                    ; preds = %92, %88, %84, %80, %78
  %142 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %143 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %144 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %143, align 8
  %145 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %144, i64 0, i32 5
  store i32 77, i32* %145, align 8
  %146 = trunc i64 %79 to i32
  %147 = add nsw i32 %146, 12
  %148 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %143, align 8
  %149 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %148, i64 0, i32 6, i32 0, i64 0
  store i32 %147, i32* %149, align 4
  %150 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %143, align 8
  %151 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %150, i64 0, i32 1
  %152 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %151, align 8
  tail call void %152(%struct.jpeg_common_struct* %142, i32 1) #4
  br label %164

; <label>:153:                                    ; preds = %47
  %154 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %155 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %156 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %155, align 8
  %157 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %156, i64 0, i32 5
  store i32 77, i32* %157, align 8
  %158 = trunc i64 %55 to i32
  %159 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %155, align 8
  %160 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %159, i64 0, i32 6, i32 0, i64 0
  store i32 %158, i32* %160, align 4
  %161 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %155, align 8
  %162 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %161, i64 0, i32 1
  %163 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %162, align 8
  tail call void %163(%struct.jpeg_common_struct* %154, i32 1) #4
  br label %164

; <label>:164:                                    ; preds = %96, %141, %153
  %.in = phi i8* [ %74, %96 ], [ %74, %141 ], [ %51, %153 ]
  %165 = ptrtoint i8* %.in to i64
  %166 = inttoptr i64 %8 to i64*
  store i64 %165, i64* %166, align 8
  %167 = load i64, i64* %5, align 8
  %168 = getelementptr inbounds i64, i64* %166, i64 1
  store i64 %167, i64* %168, align 8
  %169 = load i64, i64* %3, align 8
  %170 = icmp sgt i64 %169, 0
  br i1 %170, label %171, label %177

; <label>:171:                                    ; preds = %164
  %172 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %173 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %172, i64 0, i32 5
  %174 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %173, align 8
  %175 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %174, i64 0, i32 4
  %176 = load void (%struct.jpeg_decompress_struct*, i64)*, void (%struct.jpeg_decompress_struct*, i64)** %175, align 8
  tail call void %176(%struct.jpeg_decompress_struct* %172, i64 %169) #4
  br label %177

; <label>:177:                                    ; preds = %164, %171, %35, %14, %65
  %178 = phi i32 [ 0, %65 ], [ 0, %14 ], [ 0, %35 ], [ 1, %171 ], [ 1, %164 ]
  ret i32 %178
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @first_marker(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = alloca i64, align 8
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %4 = bitcast %struct.jpeg_source_mgr** %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = inttoptr i64 %5 to i8**
  %7 = load i8*, i8** %6, align 8
  %.cast = inttoptr i64 %5 to %struct.jpeg_source_mgr*
  %8 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %.cast, i64 0, i32 1
  %9 = load i64, i64* %8, align 8
  store i64 %9, i64* %2, align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %11, label %23

; <label>:11:                                     ; preds = %1
  %12 = inttoptr i64 %5 to %struct.jpeg_source_mgr*
  %13 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %12, i64 0, i32 3
  %14 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %13, align 8
  %15 = tail call i32 %14(%struct.jpeg_decompress_struct* nonnull %0) #4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %70, label %17

; <label>:17:                                     ; preds = %11
  %18 = inttoptr i64 %5 to i8**
  %19 = inttoptr i64 %5 to i64*
  %20 = load i8*, i8** %18, align 8
  %21 = getelementptr inbounds i64, i64* %19, i64 1
  %22 = load i64, i64* %21, align 8
  store i64 %22, i64* %2, align 8
  br label %23

; <label>:23:                                     ; preds = %1, %17
  %24 = phi i8* [ %7, %1 ], [ %20, %17 ]
  %25 = phi i64 [ %9, %1 ], [ %22, %17 ]
  %26 = add i64 %25, -1
  store i64 %26, i64* %2, align 8
  %27 = getelementptr inbounds i8, i8* %24, i64 1
  %28 = load i8, i8* %24, align 1
  %29 = zext i8 %28 to i32
  %30 = icmp eq i64 %26, 0
  br i1 %30, label %31, label %43

; <label>:31:                                     ; preds = %23
  %32 = inttoptr i64 %5 to %struct.jpeg_source_mgr*
  %33 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %32, i64 0, i32 3
  %34 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %33, align 8
  %35 = tail call i32 %34(%struct.jpeg_decompress_struct* nonnull %0) #4
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %70, label %37

; <label>:37:                                     ; preds = %31
  %38 = inttoptr i64 %5 to i8**
  %39 = inttoptr i64 %5 to i64*
  %40 = load i8*, i8** %38, align 8
  %41 = getelementptr inbounds i64, i64* %39, i64 1
  %42 = load i64, i64* %41, align 8
  store i64 %42, i64* %2, align 8
  br label %43

; <label>:43:                                     ; preds = %23, %37
  %44 = phi i8* [ %27, %23 ], [ %40, %37 ]
  %45 = phi i64 [ %26, %23 ], [ %42, %37 ]
  %46 = add i64 %45, -1
  store i64 %46, i64* %2, align 8
  %47 = getelementptr inbounds i8, i8* %44, i64 1
  %48 = load i8, i8* %44, align 1
  %49 = zext i8 %48 to i32
  %50 = icmp ne i8 %28, -1
  %51 = icmp ne i8 %48, -40
  %or.cond = or i1 %50, %51
  br i1 %or.cond, label %52, label %64

; <label>:52:                                     ; preds = %43
  %53 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %54 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %55 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %56 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %55, i64 0, i32 5
  store i32 52, i32* %56, align 8
  %57 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %58 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %57, i64 0, i32 6, i32 0, i64 0
  store i32 %29, i32* %58, align 4
  %59 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %60 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %59, i64 0, i32 6, i32 0, i64 1
  store i32 %49, i32* %60, align 4
  %61 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %62 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %61, align 8
  %63 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %62, align 8
  tail call void %63(%struct.jpeg_common_struct* %53) #4
  br label %64

; <label>:64:                                     ; preds = %43, %52
  %65 = ptrtoint i8* %47 to i64
  %66 = inttoptr i64 %5 to i64*
  %67 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  store i32 %49, i32* %67, align 4
  store i64 %65, i64* %66, align 8
  %68 = load i64, i64* %2, align 8
  %69 = getelementptr inbounds i64, i64* %66, i64 1
  store i64 %68, i64* %69, align 8
  br label %70

; <label>:70:                                     ; preds = %31, %11, %64
  %71 = phi i32 [ 1, %64 ], [ 0, %11 ], [ 0, %31 ]
  ret i32 %71
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @get_soi(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %.cast51 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %2 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %.cast51, align 8
  %3 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %2, i64 0, i32 5
  store i32 101, i32* %3, align 8
  %4 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %.cast51, align 8
  %5 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %4, i64 0, i32 1
  %6 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %5, align 8
  %7 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %6(%struct.jpeg_common_struct* %7, i32 1) #4
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %9 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %9, i64 0, i32 5
  %11 = load i32, i32* %10, align 8
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %21, label %13

; <label>:13:                                     ; preds = %1
  %14 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %15 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i64 0, i32 5
  store i32 60, i32* %17, align 8
  %18 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %19 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %18, align 8
  %20 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %19, align 8
  tail call void %20(%struct.jpeg_common_struct* %14) #4
  br label %21

; <label>:21:                                     ; preds = %13, %1
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 0
  store i8 0, i8* %22, align 1
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 0
  store i8 1, i8* %23, align 1
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 0
  store i8 5, i8* %24, align 1
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 1
  store i8 0, i8* %25, align 1
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 1
  store i8 1, i8* %26, align 1
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 1
  store i8 5, i8* %27, align 1
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 2
  store i8 0, i8* %28, align 1
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 2
  store i8 1, i8* %29, align 1
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 2
  store i8 5, i8* %30, align 1
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 3
  store i8 0, i8* %31, align 1
  %32 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 3
  store i8 1, i8* %32, align 1
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 3
  store i8 5, i8* %33, align 1
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 4
  store i8 0, i8* %34, align 1
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 4
  store i8 1, i8* %35, align 1
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 4
  store i8 5, i8* %36, align 1
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 5
  store i8 0, i8* %37, align 1
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 5
  store i8 1, i8* %38, align 1
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 5
  store i8 5, i8* %39, align 1
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 6
  store i8 0, i8* %40, align 1
  %41 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 6
  store i8 1, i8* %41, align 1
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 6
  store i8 5, i8* %42, align 1
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 7
  store i8 0, i8* %43, align 1
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 7
  store i8 1, i8* %44, align 1
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 7
  store i8 5, i8* %45, align 1
  %46 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 8
  store i8 0, i8* %46, align 1
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 8
  store i8 1, i8* %47, align 1
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 8
  store i8 5, i8* %48, align 1
  %49 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 9
  store i8 0, i8* %49, align 1
  %50 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 9
  store i8 1, i8* %50, align 1
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 9
  store i8 5, i8* %51, align 1
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 10
  store i8 0, i8* %52, align 1
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 10
  store i8 1, i8* %53, align 1
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 10
  store i8 5, i8* %54, align 1
  %55 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 11
  store i8 0, i8* %55, align 1
  %56 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 11
  store i8 1, i8* %56, align 1
  %57 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 11
  store i8 5, i8* %57, align 1
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 12
  store i8 0, i8* %58, align 1
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 12
  store i8 1, i8* %59, align 1
  %60 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 12
  store i8 5, i8* %60, align 1
  %61 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 13
  store i8 0, i8* %61, align 1
  %62 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 13
  store i8 1, i8* %62, align 1
  %63 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 13
  store i8 5, i8* %63, align 1
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 14
  store i8 0, i8* %64, align 1
  %65 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 14
  store i8 1, i8* %65, align 1
  %66 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 14
  store i8 5, i8* %66, align 1
  %67 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 15
  store i8 0, i8* %67, align 1
  %68 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 15
  store i8 1, i8* %68, align 1
  %69 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 15
  store i8 5, i8* %69, align 1
  %70 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 49
  %71 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 9
  store i32 0, i32* %71, align 4
  %72 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 56
  store i32 0, i32* %72, align 8
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 52
  %74 = bitcast i32* %70 to i8*
  call void @llvm.memset.p0i8.i64(i8* %74, i8 0, i64 9, i32 8, i1 false)
  store i16 1, i16* %73, align 2
  %75 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 53
  store i16 1, i16* %75, align 4
  %76 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 54
  store i32 0, i32* %76, align 8
  %77 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 55
  store i8 0, i8* %77, align 4
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr2 = add i64 %sunkaddr, 568
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to %struct.jpeg_marker_reader**
  %78 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %sunkaddr3, align 8
  %79 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %78, i64 0, i32 5
  store i32 1, i32* %79, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @get_sof(%struct.jpeg_decompress_struct*, i32, i32) unnamed_addr #0 {
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca %struct.jpeg_source_mgr*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %9 = bitcast %struct.jpeg_source_mgr** %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = bitcast %struct.jpeg_source_mgr** %5 to i64*
  store i64 %10, i64* %11, align 8
  %12 = inttoptr i64 %10 to i64*
  %13 = load i64, i64* %12, align 8
  %14 = bitcast i8** %6 to i64*
  store i64 %13, i64* %14, align 8
  %.cast = inttoptr i64 %10 to %struct.jpeg_source_mgr*
  %15 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %.cast, i64 0, i32 1
  %16 = load i64, i64* %15, align 8
  store i64 %16, i64* %7, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 44
  store i32 %1, i32* %17, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 45
  store i32 %2, i32* %18, align 4
  %19 = icmp eq i64 %16, 0
  br i1 %19, label %20, label %32

; <label>:20:                                     ; preds = %3
  %21 = inttoptr i64 %10 to %struct.jpeg_source_mgr*
  %22 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %21, i64 0, i32 3
  %23 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %22, align 8
  %24 = tail call i32 %23(%struct.jpeg_decompress_struct* nonnull %0) #4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %.loopexit, label %26

; <label>:26:                                     ; preds = %20
  %27 = bitcast i8** %6 to i64*
  %28 = inttoptr i64 %10 to i64*
  %29 = load i64, i64* %28, align 8
  store i64 %29, i64* %27, align 8
  %30 = getelementptr inbounds i64, i64* %28, i64 1
  %31 = load i64, i64* %30, align 8
  store i64 %31, i64* %7, align 8
  br label %32

; <label>:32:                                     ; preds = %26, %3
  %.in = phi i64 [ %29, %26 ], [ %13, %3 ]
  %33 = phi i64 [ %31, %26 ], [ %16, %3 ]
  %34 = inttoptr i64 %.in to i8*
  %35 = add i64 %33, -1
  store i64 %35, i64* %7, align 8
  %36 = getelementptr inbounds i8, i8* %34, i64 1
  store i8* %36, i8** %6, align 8
  %37 = load i8, i8* %34, align 1
  %38 = zext i8 %37 to i64
  %39 = shl nuw nsw i64 %38, 8
  %40 = icmp eq i64 %35, 0
  br i1 %40, label %41, label %54

; <label>:41:                                     ; preds = %32
  %42 = inttoptr i64 %10 to %struct.jpeg_source_mgr*
  %43 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %42, i64 0, i32 3
  %44 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %43, align 8
  %45 = tail call i32 %44(%struct.jpeg_decompress_struct* nonnull %0) #4
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %.loopexit, label %47

; <label>:47:                                     ; preds = %41
  %48 = bitcast i8** %6 to i64*
  %49 = inttoptr i64 %10 to i64*
  %50 = load i64, i64* %49, align 8
  store i64 %50, i64* %48, align 8
  %51 = getelementptr inbounds i64, i64* %49, i64 1
  %52 = load i64, i64* %51, align 8
  store i64 %52, i64* %7, align 8
  %53 = inttoptr i64 %50 to i8*
  br label %54

; <label>:54:                                     ; preds = %32, %47
  %55 = phi i8* [ %36, %32 ], [ %53, %47 ]
  %56 = phi i64 [ %35, %32 ], [ %52, %47 ]
  %57 = add i64 %56, -1
  store i64 %57, i64* %7, align 8
  %58 = getelementptr inbounds i8, i8* %55, i64 1
  store i8* %58, i8** %6, align 8
  %59 = load i8, i8* %55, align 1
  %60 = zext i8 %59 to i64
  %61 = or i64 %39, %60
  %62 = icmp eq i64 %57, 0
  br i1 %62, label %63, label %76

; <label>:63:                                     ; preds = %54
  %64 = inttoptr i64 %10 to %struct.jpeg_source_mgr*
  %65 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %64, i64 0, i32 3
  %66 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %65, align 8
  %67 = tail call i32 %66(%struct.jpeg_decompress_struct* nonnull %0) #4
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %.loopexit, label %69

; <label>:69:                                     ; preds = %63
  %70 = bitcast i8** %6 to i64*
  %71 = inttoptr i64 %10 to i64*
  %72 = load i64, i64* %71, align 8
  store i64 %72, i64* %70, align 8
  %73 = getelementptr inbounds i64, i64* %71, i64 1
  %74 = load i64, i64* %73, align 8
  store i64 %74, i64* %7, align 8
  %75 = inttoptr i64 %72 to i8*
  br label %76

; <label>:76:                                     ; preds = %54, %69
  %77 = phi i8* [ %58, %54 ], [ %75, %69 ]
  %78 = phi i64 [ %57, %54 ], [ %74, %69 ]
  %79 = add i64 %78, -1
  store i64 %79, i64* %7, align 8
  %80 = getelementptr inbounds i8, i8* %77, i64 1
  store i8* %80, i8** %6, align 8
  %81 = load i8, i8* %77, align 1
  %82 = zext i8 %81 to i32
  %83 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 42
  store i32 %82, i32* %83, align 8
  %84 = icmp eq i64 %79, 0
  br i1 %84, label %85, label %98

; <label>:85:                                     ; preds = %76
  %86 = inttoptr i64 %10 to %struct.jpeg_source_mgr*
  %87 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %86, i64 0, i32 3
  %88 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %87, align 8
  %89 = tail call i32 %88(%struct.jpeg_decompress_struct* nonnull %0) #4
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %.loopexit, label %91

; <label>:91:                                     ; preds = %85
  %92 = bitcast i8** %6 to i64*
  %93 = inttoptr i64 %10 to i64*
  %94 = load i64, i64* %93, align 8
  store i64 %94, i64* %92, align 8
  %95 = getelementptr inbounds i64, i64* %93, i64 1
  %96 = load i64, i64* %95, align 8
  store i64 %96, i64* %7, align 8
  %97 = inttoptr i64 %94 to i8*
  br label %98

; <label>:98:                                     ; preds = %91, %76
  %99 = phi i8* [ %97, %91 ], [ %80, %76 ]
  %100 = phi i64 [ %96, %91 ], [ %79, %76 ]
  %101 = add i64 %100, -1
  store i64 %101, i64* %7, align 8
  %102 = getelementptr inbounds i8, i8* %99, i64 1
  store i8* %102, i8** %6, align 8
  %103 = load i8, i8* %99, align 1
  %104 = zext i8 %103 to i32
  %105 = shl nuw nsw i32 %104, 8
  %106 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 7
  store i32 %105, i32* %106, align 4
  %107 = icmp eq i64 %101, 0
  br i1 %107, label %108, label %._crit_edge97

._crit_edge97:                                    ; preds = %98
  %.pre98 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %.pre99 = add i64 %.pre98, 44
  %.pre100 = inttoptr i64 %.pre99 to i32*
  br label %121

; <label>:108:                                    ; preds = %98
  %109 = inttoptr i64 %10 to %struct.jpeg_source_mgr*
  %110 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %109, i64 0, i32 3
  %111 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %110, align 8
  %112 = tail call i32 %111(%struct.jpeg_decompress_struct* nonnull %0) #4
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %.loopexit, label %114

; <label>:114:                                    ; preds = %108
  %115 = bitcast i8** %6 to i64*
  %116 = inttoptr i64 %10 to i64*
  %117 = load i64, i64* %116, align 8
  store i64 %117, i64* %115, align 8
  %118 = getelementptr inbounds i64, i64* %116, i64 1
  %119 = load i64, i64* %118, align 8
  store i64 %119, i64* %7, align 8
  %120 = inttoptr i64 %117 to i8*
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr48 = add i64 %sunkaddr, 44
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to i32*
  %.pre = load i32, i32* %sunkaddr49, align 4
  br label %121

; <label>:121:                                    ; preds = %._crit_edge97, %114
  %sunkaddr52.pre-phi = phi i32* [ %.pre100, %._crit_edge97 ], [ %sunkaddr49, %114 ]
  %sunkaddr50.pre-phi = phi i64 [ %.pre98, %._crit_edge97 ], [ %sunkaddr, %114 ]
  %122 = phi i32 [ %105, %._crit_edge97 ], [ %.pre, %114 ]
  %123 = phi i8* [ %102, %._crit_edge97 ], [ %120, %114 ]
  %124 = phi i64 [ %101, %._crit_edge97 ], [ %119, %114 ]
  %125 = add i64 %124, -1
  store i64 %125, i64* %7, align 8
  %126 = getelementptr inbounds i8, i8* %123, i64 1
  store i8* %126, i8** %6, align 8
  %127 = load i8, i8* %123, align 1
  %128 = zext i8 %127 to i32
  %129 = add i32 %122, %128
  store i32 %129, i32* %sunkaddr52.pre-phi, align 4
  %130 = icmp eq i64 %125, 0
  br i1 %130, label %131, label %144

; <label>:131:                                    ; preds = %121
  %132 = inttoptr i64 %10 to %struct.jpeg_source_mgr*
  %133 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %132, i64 0, i32 3
  %134 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %133, align 8
  %135 = tail call i32 %134(%struct.jpeg_decompress_struct* nonnull %0) #4
  %136 = icmp eq i32 %135, 0
  br i1 %136, label %.loopexit, label %137

; <label>:137:                                    ; preds = %131
  %138 = bitcast i8** %6 to i64*
  %139 = inttoptr i64 %10 to i64*
  %140 = load i64, i64* %139, align 8
  store i64 %140, i64* %138, align 8
  %141 = getelementptr inbounds i64, i64* %139, i64 1
  %142 = load i64, i64* %141, align 8
  store i64 %142, i64* %7, align 8
  %143 = inttoptr i64 %140 to i8*
  br label %144

; <label>:144:                                    ; preds = %137, %121
  %145 = phi i8* [ %143, %137 ], [ %126, %121 ]
  %146 = phi i64 [ %142, %137 ], [ %125, %121 ]
  %147 = add i64 %146, -1
  store i64 %147, i64* %7, align 8
  %148 = getelementptr inbounds i8, i8* %145, i64 1
  store i8* %148, i8** %6, align 8
  %149 = load i8, i8* %145, align 1
  %150 = zext i8 %149 to i32
  %151 = shl nuw nsw i32 %150, 8
  %152 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 6
  store i32 %151, i32* %152, align 8
  %153 = icmp eq i64 %147, 0
  br i1 %153, label %154, label %._crit_edge96

._crit_edge96:                                    ; preds = %144
  %.pre101 = add i64 %sunkaddr50.pre-phi, 40
  %.pre102 = inttoptr i64 %.pre101 to i32*
  br label %167

; <label>:154:                                    ; preds = %144
  %155 = inttoptr i64 %10 to %struct.jpeg_source_mgr*
  %156 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %155, i64 0, i32 3
  %157 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %156, align 8
  %158 = tail call i32 %157(%struct.jpeg_decompress_struct* nonnull %0) #4
  %159 = icmp eq i32 %158, 0
  br i1 %159, label %.loopexit, label %160

; <label>:160:                                    ; preds = %154
  %161 = bitcast i8** %6 to i64*
  %162 = inttoptr i64 %10 to i64*
  %163 = load i64, i64* %162, align 8
  store i64 %163, i64* %161, align 8
  %164 = getelementptr inbounds i64, i64* %162, i64 1
  %165 = load i64, i64* %164, align 8
  store i64 %165, i64* %7, align 8
  %166 = inttoptr i64 %163 to i8*
  %sunkaddr54 = add i64 %sunkaddr50.pre-phi, 40
  %sunkaddr55 = inttoptr i64 %sunkaddr54 to i32*
  %.pre34 = load i32, i32* %sunkaddr55, align 8
  br label %167

; <label>:167:                                    ; preds = %._crit_edge96, %160
  %sunkaddr58.pre-phi = phi i32* [ %.pre102, %._crit_edge96 ], [ %sunkaddr55, %160 ]
  %168 = phi i32 [ %151, %._crit_edge96 ], [ %.pre34, %160 ]
  %169 = phi i8* [ %148, %._crit_edge96 ], [ %166, %160 ]
  %170 = phi i64 [ %147, %._crit_edge96 ], [ %165, %160 ]
  %171 = add i64 %170, -1
  store i64 %171, i64* %7, align 8
  %172 = getelementptr inbounds i8, i8* %169, i64 1
  store i8* %172, i8** %6, align 8
  %173 = load i8, i8* %169, align 1
  %174 = zext i8 %173 to i32
  %175 = add i32 %168, %174
  store i32 %175, i32* %sunkaddr58.pre-phi, align 8
  %176 = icmp eq i64 %171, 0
  br i1 %176, label %177, label %190

; <label>:177:                                    ; preds = %167
  %178 = inttoptr i64 %10 to %struct.jpeg_source_mgr*
  %179 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %178, i64 0, i32 3
  %180 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %179, align 8
  %181 = tail call i32 %180(%struct.jpeg_decompress_struct* nonnull %0) #4
  %182 = icmp eq i32 %181, 0
  br i1 %182, label %.loopexit, label %183

; <label>:183:                                    ; preds = %177
  %184 = bitcast i8** %6 to i64*
  %185 = inttoptr i64 %10 to i64*
  %186 = load i64, i64* %185, align 8
  store i64 %186, i64* %184, align 8
  %187 = getelementptr inbounds i64, i64* %185, i64 1
  %188 = load i64, i64* %187, align 8
  store i64 %188, i64* %7, align 8
  %189 = inttoptr i64 %186 to i8*
  br label %190

; <label>:190:                                    ; preds = %167, %183
  %191 = phi i8* [ %172, %167 ], [ %189, %183 ]
  %192 = phi i64 [ %171, %167 ], [ %188, %183 ]
  %193 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %194 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %195 = add i64 %192, -1
  store i64 %195, i64* %7, align 8
  %196 = getelementptr inbounds i8, i8* %191, i64 1
  store i8* %196, i8** %6, align 8
  %197 = load i8, i8* %191, align 1
  %198 = zext i8 %197 to i32
  %199 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  store i32 %198, i32* %199, align 8
  %200 = add nsw i64 %61, -8
  %201 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %194, align 8
  %202 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %201, i64 0, i32 6, i32 0, i64 0
  %203 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  %204 = load i32, i32* %203, align 4
  store i32 %204, i32* %202, align 4
  %205 = load i32, i32* %sunkaddr58.pre-phi, align 8
  %206 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %201, i64 0, i32 6, i32 0, i64 1
  store i32 %205, i32* %206, align 4
  %sunkaddr107 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr108 = add i64 %sunkaddr107, 44
  %sunkaddr109 = inttoptr i64 %sunkaddr108 to i32*
  %207 = load i32, i32* %sunkaddr109, align 4
  %208 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %201, i64 0, i32 6, i32 0, i64 2
  store i32 %207, i32* %208, align 4
  %209 = load i32, i32* %199, align 8
  %210 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %201, i64 0, i32 6, i32 0, i64 3
  store i32 %209, i32* %210, align 4
  %211 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %194, align 8
  %212 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %211, i64 0, i32 5
  store i32 99, i32* %212, align 8
  %213 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %194, align 8
  %214 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %213, i64 0, i32 1
  %215 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %214, align 8
  tail call void %215(%struct.jpeg_common_struct* nonnull %193, i32 1) #4
  %216 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %217 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %216, align 8
  %218 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %217, i64 0, i32 6
  %219 = load i32, i32* %218, align 4
  %220 = icmp eq i32 %219, 0
  br i1 %220, label %229, label %221

; <label>:221:                                    ; preds = %190
  %222 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %223 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %224 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %222, align 8
  %225 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %224, i64 0, i32 5
  store i32 57, i32* %225, align 8
  %226 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %227 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %226, align 8
  %228 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %227, align 8
  tail call void %228(%struct.jpeg_common_struct* nonnull %223) #4
  br label %229

; <label>:229:                                    ; preds = %190, %221
  %230 = load i32, i32* %sunkaddr52.pre-phi, align 4
  %231 = icmp eq i32 %230, 0
  br i1 %231, label %238, label %232

; <label>:232:                                    ; preds = %229
  %233 = load i32, i32* %sunkaddr58.pre-phi, align 8
  %234 = icmp eq i32 %233, 0
  br i1 %234, label %238, label %235

; <label>:235:                                    ; preds = %232
  %sunkaddr72 = add i64 %sunkaddr50.pre-phi, 48
  %sunkaddr73 = inttoptr i64 %sunkaddr72 to i32*
  %236 = load i32, i32* %sunkaddr73, align 8
  %237 = icmp slt i32 %236, 1
  br i1 %237, label %238, label %246

; <label>:238:                                    ; preds = %235, %232, %229
  %239 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %240 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %241 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %239, align 8
  %242 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %241, i64 0, i32 5
  store i32 31, i32* %242, align 8
  %243 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %244 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %243, align 8
  %245 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %244, align 8
  tail call void %245(%struct.jpeg_common_struct* nonnull %240) #4
  %sunkaddr75 = add i64 %sunkaddr50.pre-phi, 48
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to i32*
  %.pre35 = load i32, i32* %sunkaddr76, align 8
  br label %246

; <label>:246:                                    ; preds = %238, %235
  %247 = phi i32 [ %.pre35, %238 ], [ %236, %235 ]
  %248 = sext i32 %247 to i64
  %249 = mul nsw i64 %248, 3
  %250 = icmp eq i64 %200, %249
  br i1 %250, label %259, label %251

; <label>:251:                                    ; preds = %246
  %252 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %253 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %254 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %252, align 8
  %255 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %254, i64 0, i32 5
  store i32 9, i32* %255, align 8
  %256 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %257 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %256, align 8
  %258 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %257, align 8
  tail call void %258(%struct.jpeg_common_struct* nonnull %253) #4
  br label %259

; <label>:259:                                    ; preds = %246, %251
  %260 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %261 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %260, align 8
  %262 = icmp eq %struct.jpeg_component_info* %261, null
  br i1 %262, label %264, label %._crit_edge95

._crit_edge95:                                    ; preds = %259
  %263 = ptrtoint %struct.jpeg_component_info* %261 to i64
  %.pre103 = add i64 %sunkaddr50.pre-phi, 48
  %.pre104 = inttoptr i64 %.pre103 to i32*
  br label %275

; <label>:264:                                    ; preds = %259
  %265 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %266 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %267 = bitcast %struct.jpeg_memory_mgr** %266 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %268 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %267, align 8
  %269 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %268, align 8
  %sunkaddr78 = add i64 %sunkaddr50.pre-phi, 48
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to i32*
  %270 = load i32, i32* %sunkaddr79, align 8
  %271 = sext i32 %270 to i64
  %272 = mul nsw i64 %271, 96
  %273 = tail call i8* %269(%struct.jpeg_common_struct* %265, i32 1, i64 %272) #4
  %sunkaddr81 = add i64 %sunkaddr50.pre-phi, 296
  %sunkaddr82 = inttoptr i64 %sunkaddr81 to i8**
  store i8* %273, i8** %sunkaddr82, align 8
  %274 = ptrtoint i8* %273 to i64
  br label %275

; <label>:275:                                    ; preds = %._crit_edge95, %264
  %sunkaddr85.pre-phi = phi i32* [ %.pre104, %._crit_edge95 ], [ %sunkaddr79, %264 ]
  %276 = phi i64 [ %263, %._crit_edge95 ], [ %274, %264 ]
  %277 = inttoptr i64 %10 to i64*
  %278 = load i32, i32* %sunkaddr85.pre-phi, align 8
  %279 = icmp sgt i32 %278, 0
  br i1 %279, label %.lr.ph, label %._crit_edge43

.lr.ph:                                           ; preds = %275
  %280 = inttoptr i64 %276 to %struct.jpeg_component_info*
  br label %281

; <label>:281:                                    ; preds = %.lr.ph, %356
  %282 = phi %struct.jpeg_component_info* [ %280, %.lr.ph ], [ %383, %356 ]
  %283 = phi i32 [ 0, %.lr.ph ], [ %382, %356 ]
  %284 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %282, i64 0, i32 1
  store i32 %283, i32* %284, align 4
  %285 = load i64, i64* %7, align 8
  %286 = icmp eq i64 %285, 0
  br i1 %286, label %287, label %._crit_edge36

._crit_edge36:                                    ; preds = %281
  %.pre37 = load i8*, i8** %6, align 8
  br label %301

; <label>:287:                                    ; preds = %281
  %288 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %289 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %288, i64 0, i32 3
  %290 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %289, align 8
  %291 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %292 = tail call i32 %290(%struct.jpeg_decompress_struct* %291) #4
  %293 = icmp eq i32 %292, 0
  br i1 %293, label %.loopexit.loopexit, label %294

; <label>:294:                                    ; preds = %287
  %295 = bitcast i8** %6 to i64*
  %296 = bitcast %struct.jpeg_source_mgr* %288 to i64*
  %297 = load i64, i64* %296, align 8
  store i64 %297, i64* %295, align 8
  %298 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %288, i64 0, i32 1
  %299 = load i64, i64* %298, align 8
  store i64 %299, i64* %7, align 8
  %300 = inttoptr i64 %297 to i8*
  br label %301

; <label>:301:                                    ; preds = %._crit_edge36, %294
  %302 = phi i8* [ %.pre37, %._crit_edge36 ], [ %300, %294 ]
  %303 = phi i64 [ %285, %._crit_edge36 ], [ %299, %294 ]
  %304 = add i64 %303, -1
  store i64 %304, i64* %7, align 8
  %305 = getelementptr inbounds i8, i8* %302, i64 1
  store i8* %305, i8** %6, align 8
  %306 = load i8, i8* %302, align 1
  %307 = zext i8 %306 to i32
  %308 = bitcast %struct.jpeg_component_info* %282 to i32*
  store i32 %307, i32* %308, align 8
  %309 = load i64, i64* %7, align 8
  %310 = icmp eq i64 %309, 0
  br i1 %310, label %311, label %._crit_edge38

._crit_edge38:                                    ; preds = %301
  %.pre39 = load i8*, i8** %6, align 8
  br label %325

; <label>:311:                                    ; preds = %301
  %312 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %313 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %312, i64 0, i32 3
  %314 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %313, align 8
  %315 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %316 = tail call i32 %314(%struct.jpeg_decompress_struct* %315) #4
  %317 = icmp eq i32 %316, 0
  br i1 %317, label %.loopexit.loopexit, label %318

; <label>:318:                                    ; preds = %311
  %319 = bitcast i8** %6 to i64*
  %320 = bitcast %struct.jpeg_source_mgr* %312 to i64*
  %321 = load i64, i64* %320, align 8
  store i64 %321, i64* %319, align 8
  %322 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %312, i64 0, i32 1
  %323 = load i64, i64* %322, align 8
  store i64 %323, i64* %7, align 8
  %324 = inttoptr i64 %321 to i8*
  br label %325

; <label>:325:                                    ; preds = %._crit_edge38, %318
  %326 = phi i8* [ %324, %318 ], [ %.pre39, %._crit_edge38 ]
  %327 = phi i64 [ %323, %318 ], [ %309, %._crit_edge38 ]
  %328 = add i64 %327, -1
  store i64 %328, i64* %7, align 8
  %329 = getelementptr inbounds i8, i8* %326, i64 1
  store i8* %329, i8** %6, align 8
  %330 = load i8, i8* %326, align 1
  %331 = zext i8 %330 to i32
  %332 = lshr i32 %331, 4
  %333 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %282, i64 0, i32 2
  store i32 %332, i32* %333, align 8
  %334 = and i32 %331, 15
  %335 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %282, i64 0, i32 3
  store i32 %334, i32* %335, align 4
  %336 = icmp eq i64 %328, 0
  br i1 %336, label %340, label %._crit_edge40

._crit_edge40:                                    ; preds = %325
  %337 = bitcast %struct.jpeg_decompress_struct** %4 to %struct.jpeg_error_mgr***
  %.pre41 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %337, align 8
  %338 = bitcast %struct.jpeg_error_mgr** %.pre41 to %struct.jpeg_common_struct*
  %339 = bitcast %struct.jpeg_error_mgr** %.pre41 to %struct.jpeg_decompress_struct*
  br label %356

; <label>:340:                                    ; preds = %325
  %341 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %342 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %341, i64 0, i32 3
  %343 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %342, align 8
  %344 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %345 = tail call i32 %343(%struct.jpeg_decompress_struct* %344) #4
  %346 = icmp eq i32 %345, 0
  br i1 %346, label %.loopexit.loopexit, label %347

; <label>:347:                                    ; preds = %340
  %348 = bitcast i8** %6 to i64*
  %349 = bitcast %struct.jpeg_decompress_struct* %344 to %struct.jpeg_error_mgr**
  %350 = bitcast %struct.jpeg_source_mgr* %341 to i64*
  %351 = bitcast %struct.jpeg_decompress_struct* %344 to %struct.jpeg_common_struct*
  %352 = load i64, i64* %350, align 8
  store i64 %352, i64* %348, align 8
  %353 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %341, i64 0, i32 1
  %354 = load i64, i64* %353, align 8
  store i64 %354, i64* %7, align 8
  %355 = inttoptr i64 %352 to i8*
  br label %356

; <label>:356:                                    ; preds = %._crit_edge40, %347
  %357 = phi %struct.jpeg_decompress_struct* [ %344, %347 ], [ %339, %._crit_edge40 ]
  %358 = phi %struct.jpeg_common_struct* [ %351, %347 ], [ %338, %._crit_edge40 ]
  %359 = phi %struct.jpeg_error_mgr** [ %349, %347 ], [ %.pre41, %._crit_edge40 ]
  %360 = phi i8* [ %355, %347 ], [ %329, %._crit_edge40 ]
  %361 = phi i64 [ %354, %347 ], [ %328, %._crit_edge40 ]
  %362 = bitcast %struct.jpeg_component_info* %282 to i32*
  %363 = add i64 %361, -1
  store i64 %363, i64* %7, align 8
  %364 = getelementptr inbounds i8, i8* %360, i64 1
  store i8* %364, i8** %6, align 8
  %365 = load i8, i8* %360, align 1
  %366 = zext i8 %365 to i32
  %367 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %282, i64 0, i32 4
  store i32 %366, i32* %367, align 8
  %368 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %359, align 8
  %369 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %368, i64 0, i32 6, i32 0, i64 0
  %370 = load i32, i32* %362, align 8
  store i32 %370, i32* %369, align 4
  %sunkaddr86 = ptrtoint %struct.jpeg_component_info* %282 to i64
  %sunkaddr87 = add i64 %sunkaddr86, 8
  %sunkaddr88 = inttoptr i64 %sunkaddr87 to i32*
  %371 = load i32, i32* %sunkaddr88, align 8
  %372 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %368, i64 0, i32 6, i32 0, i64 1
  store i32 %371, i32* %372, align 4
  %sunkaddr90 = add i64 %sunkaddr86, 12
  %sunkaddr91 = inttoptr i64 %sunkaddr90 to i32*
  %373 = load i32, i32* %sunkaddr91, align 4
  %374 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %368, i64 0, i32 6, i32 0, i64 2
  store i32 %373, i32* %374, align 4
  %375 = load i32, i32* %367, align 8
  %376 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %368, i64 0, i32 6, i32 0, i64 3
  store i32 %375, i32* %376, align 4
  %377 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %359, align 8
  %378 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %377, i64 0, i32 5
  store i32 100, i32* %378, align 8
  %379 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %359, align 8
  %380 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %379, i64 0, i32 1
  %381 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %380, align 8
  tail call void %381(%struct.jpeg_common_struct* %358, i32 1) #4
  %382 = add nuw nsw i32 %283, 1
  %383 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %282, i64 1
  %384 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %358, i64 1, i32 2
  %385 = bitcast %struct.jpeg_progress_mgr** %384 to i32*
  %386 = load i32, i32* %385, align 8
  %387 = icmp slt i32 %382, %386
  br i1 %387, label %281, label %._crit_edge

._crit_edge:                                      ; preds = %356
  %.phi.trans.insert = bitcast %struct.jpeg_source_mgr** %5 to i64**
  %.pre42 = load i64*, i64** %.phi.trans.insert, align 8
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %275, %._crit_edge
  %388 = phi i64* [ %.pre42, %._crit_edge ], [ %277, %275 ]
  %.in45 = phi i8* [ %364, %._crit_edge ], [ %196, %275 ]
  %389 = phi %struct.jpeg_decompress_struct* [ %357, %._crit_edge ], [ %0, %275 ]
  %390 = ptrtoint i8* %.in45 to i64
  %391 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %389, i64 0, i32 78
  %392 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %391, align 8
  %393 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %392, i64 0, i32 6
  store i32 1, i32* %393, align 4
  store i64 %390, i64* %388, align 8
  %394 = load i64, i64* %7, align 8
  %395 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %396 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %395, i64 0, i32 1
  store i64 %394, i64* %396, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %287, %311, %340
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %177, %154, %131, %108, %85, %63, %41, %20, %._crit_edge43
  %397 = phi i32 [ 1, %._crit_edge43 ], [ 0, %20 ], [ 0, %41 ], [ 0, %63 ], [ 0, %85 ], [ 0, %108 ], [ 0, %131 ], [ 0, %154 ], [ 0, %177 ], [ 0, %.loopexit.loopexit ]
  ret i32 %397
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @get_sos(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = alloca i64, align 8
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %4 = bitcast %struct.jpeg_source_mgr** %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = inttoptr i64 %5 to i8**
  %7 = load i8*, i8** %6, align 8
  %.cast = inttoptr i64 %5 to %struct.jpeg_source_mgr*
  %8 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %.cast, i64 0, i32 1
  %9 = load i64, i64* %8, align 8
  store i64 %9, i64* %2, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %11 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %11, i64 0, i32 6
  %13 = load i32, i32* %12, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %23

; <label>:15:                                     ; preds = %1
  %16 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %17 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i64 0, i32 5
  store i32 61, i32* %19, align 8
  %20 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %21 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %20, align 8
  %22 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %21, align 8
  tail call void %22(%struct.jpeg_common_struct* %16) #4
  br label %23

; <label>:23:                                     ; preds = %1, %15
  %24 = icmp eq i64 %9, 0
  br i1 %24, label %25, label %37

; <label>:25:                                     ; preds = %23
  %26 = inttoptr i64 %5 to %struct.jpeg_source_mgr*
  %27 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %26, i64 0, i32 3
  %28 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %27, align 8
  %29 = tail call i32 %28(%struct.jpeg_decompress_struct* nonnull %0) #4
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %.loopexit68, label %31

; <label>:31:                                     ; preds = %25
  %32 = inttoptr i64 %5 to i8**
  %33 = inttoptr i64 %5 to i64*
  %34 = load i8*, i8** %32, align 8
  %35 = getelementptr inbounds i64, i64* %33, i64 1
  %36 = load i64, i64* %35, align 8
  store i64 %36, i64* %2, align 8
  br label %37

; <label>:37:                                     ; preds = %31, %23
  %38 = phi i8* [ %34, %31 ], [ %7, %23 ]
  %39 = phi i64 [ %36, %31 ], [ %9, %23 ]
  %40 = add i64 %39, -1
  store i64 %40, i64* %2, align 8
  %41 = getelementptr inbounds i8, i8* %38, i64 1
  %42 = load i8, i8* %38, align 1
  %43 = zext i8 %42 to i64
  %44 = shl nuw nsw i64 %43, 8
  %45 = icmp eq i64 %40, 0
  br i1 %45, label %46, label %58

; <label>:46:                                     ; preds = %37
  %47 = inttoptr i64 %5 to %struct.jpeg_source_mgr*
  %48 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %47, i64 0, i32 3
  %49 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %48, align 8
  %50 = tail call i32 %49(%struct.jpeg_decompress_struct* nonnull %0) #4
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %.loopexit68, label %52

; <label>:52:                                     ; preds = %46
  %53 = inttoptr i64 %5 to i8**
  %54 = inttoptr i64 %5 to i64*
  %55 = load i8*, i8** %53, align 8
  %56 = getelementptr inbounds i64, i64* %54, i64 1
  %57 = load i64, i64* %56, align 8
  store i64 %57, i64* %2, align 8
  br label %58

; <label>:58:                                     ; preds = %37, %52
  %59 = phi i8* [ %41, %37 ], [ %55, %52 ]
  %60 = phi i64 [ %40, %37 ], [ %57, %52 ]
  %61 = add i64 %60, -1
  store i64 %61, i64* %2, align 8
  %62 = getelementptr inbounds i8, i8* %59, i64 1
  %63 = load i8, i8* %59, align 1
  %64 = zext i8 %63 to i64
  %65 = or i64 %44, %64
  %66 = icmp eq i64 %61, 0
  br i1 %66, label %67, label %79

; <label>:67:                                     ; preds = %58
  %68 = inttoptr i64 %5 to %struct.jpeg_source_mgr*
  %69 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %68, i64 0, i32 3
  %70 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %69, align 8
  %71 = tail call i32 %70(%struct.jpeg_decompress_struct* nonnull %0) #4
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %.loopexit68, label %73

; <label>:73:                                     ; preds = %67
  %74 = inttoptr i64 %5 to i8**
  %75 = inttoptr i64 %5 to i64*
  %76 = load i8*, i8** %74, align 8
  %77 = getelementptr inbounds i64, i64* %75, i64 1
  %78 = load i64, i64* %77, align 8
  store i64 %78, i64* %2, align 8
  br label %79

; <label>:79:                                     ; preds = %58, %73
  %80 = phi i8* [ %62, %58 ], [ %76, %73 ]
  %81 = phi i64 [ %61, %58 ], [ %78, %73 ]
  %82 = add i64 %81, -1
  store i64 %82, i64* %2, align 8
  %83 = getelementptr inbounds i8, i8* %80, i64 1
  %84 = load i8, i8* %80, align 1
  %85 = zext i8 %84 to i32
  %86 = zext i8 %84 to i64
  %87 = shl nuw nsw i64 %86, 1
  %88 = add nuw nsw i64 %87, 6
  %89 = icmp ne i64 %65, %88
  %90 = add i8 %84, -1
  %91 = icmp ugt i8 %90, 3
  %92 = or i1 %91, %89
  br i1 %92, label %93, label %.._crit_edge50_crit_edge

.._crit_edge50_crit_edge:                         ; preds = %79
  %.pre83 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  br label %._crit_edge50

; <label>:93:                                     ; preds = %79
  %94 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %95 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %96 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %95, align 8
  %97 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %96, i64 0, i32 5
  store i32 9, i32* %97, align 8
  %98 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %99 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %98, align 8
  %100 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %99, align 8
  tail call void %100(%struct.jpeg_common_struct* %94) #4
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %.._crit_edge50_crit_edge, %93
  %.cast36.pre-phi = phi %struct.jpeg_common_struct* [ %.pre83, %.._crit_edge50_crit_edge ], [ %94, %93 ]
  %sunkaddr93 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr94 = inttoptr i64 %sunkaddr93 to %struct.jpeg_error_mgr**
  %101 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %sunkaddr94, align 8
  %102 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %101, i64 0, i32 5
  store i32 102, i32* %102, align 8
  %103 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %sunkaddr94, align 8
  %104 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %103, i64 0, i32 6, i32 0, i64 0
  store i32 %85, i32* %104, align 4
  %105 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %sunkaddr94, align 8
  %106 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %105, i64 0, i32 1
  %107 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %106, align 8
  tail call void %107(%struct.jpeg_common_struct* %.cast36.pre-phi, i32 1) #4
  %108 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 62
  store i32 %85, i32* %108, align 8
  %109 = icmp eq i8 %84, 0
  br i1 %109, label %._crit_edge7, label %.lr.ph6

.lr.ph6:                                          ; preds = %._crit_edge50
  br label %110

; <label>:110:                                    ; preds = %.lr.ph6, %.loopexit
  %indvars.iv = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next, %.loopexit ]
  %111 = phi i8* [ %83, %.lr.ph6 ], [ %142, %.loopexit ]
  %112 = phi i64 [ %82, %.lr.ph6 ], [ %141, %.loopexit ]
  %113 = icmp eq i64 %112, 0
  br i1 %113, label %114, label %122

; <label>:114:                                    ; preds = %110
  %sunkaddr95 = add i64 %5, 24
  %sunkaddr96 = inttoptr i64 %sunkaddr95 to i32 (%struct.jpeg_decompress_struct*)**
  %115 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %sunkaddr96, align 8
  %116 = tail call i32 %115(%struct.jpeg_decompress_struct* %0) #4
  %117 = icmp eq i32 %116, 0
  br i1 %117, label %.loopexit68.loopexit, label %118

; <label>:118:                                    ; preds = %114
  %119 = inttoptr i64 %5 to i8**
  %120 = load i8*, i8** %119, align 8
  %sunkaddr97 = add i64 %5, 8
  %sunkaddr98 = inttoptr i64 %sunkaddr97 to i64*
  %121 = load i64, i64* %sunkaddr98, align 8
  store i64 %121, i64* %2, align 8
  br label %122

; <label>:122:                                    ; preds = %110, %118
  %123 = phi i8* [ %111, %110 ], [ %120, %118 ]
  %124 = phi i64 [ %112, %110 ], [ %121, %118 ]
  %125 = add i64 %124, -1
  store i64 %125, i64* %2, align 8
  %126 = getelementptr inbounds i8, i8* %123, i64 1
  %127 = load i8, i8* %123, align 1
  %128 = zext i8 %127 to i32
  %129 = icmp eq i64 %125, 0
  br i1 %129, label %130, label %138

; <label>:130:                                    ; preds = %122
  %sunkaddr99 = add i64 %5, 24
  %sunkaddr100 = inttoptr i64 %sunkaddr99 to i32 (%struct.jpeg_decompress_struct*)**
  %131 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %sunkaddr100, align 8
  %132 = tail call i32 %131(%struct.jpeg_decompress_struct* %0) #4
  %133 = icmp eq i32 %132, 0
  br i1 %133, label %.loopexit68.loopexit, label %134

; <label>:134:                                    ; preds = %130
  %135 = inttoptr i64 %5 to i8**
  %136 = load i8*, i8** %135, align 8
  %sunkaddr101 = add i64 %5, 8
  %sunkaddr102 = inttoptr i64 %sunkaddr101 to i64*
  %137 = load i64, i64* %sunkaddr102, align 8
  store i64 %137, i64* %2, align 8
  br label %138

; <label>:138:                                    ; preds = %122, %134
  %139 = phi i8* [ %126, %122 ], [ %136, %134 ]
  %140 = phi i64 [ %125, %122 ], [ %137, %134 ]
  %141 = add i64 %140, -1
  store i64 %141, i64* %2, align 8
  %142 = getelementptr inbounds i8, i8* %139, i64 1
  %143 = load i8, i8* %139, align 1
  %144 = zext i8 %143 to i32
  %sunkaddr103 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr104 = add i64 %sunkaddr103, 296
  %sunkaddr105 = inttoptr i64 %sunkaddr104 to %struct.jpeg_component_info**
  %145 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %sunkaddr105, align 8
  %sunkaddr106 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr107 = add i64 %sunkaddr106, 48
  %sunkaddr108 = inttoptr i64 %sunkaddr107 to i32*
  %146 = load i32, i32* %sunkaddr108, align 8
  %147 = icmp sgt i32 %146, 0
  br i1 %147, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %138
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %153
  %148 = phi i32 [ %154, %153 ], [ 0, %.lr.ph.preheader ]
  %149 = phi %struct.jpeg_component_info* [ %155, %153 ], [ %145, %.lr.ph.preheader ]
  %150 = bitcast %struct.jpeg_component_info* %149 to i32*
  %151 = load i32, i32* %150, align 8
  %152 = icmp eq i32 %128, %151
  br i1 %152, label %.loopexit.loopexit, label %153

; <label>:153:                                    ; preds = %.lr.ph
  %154 = add nuw nsw i32 %148, 1
  %155 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %149, i64 1
  %156 = icmp slt i32 %154, %146
  br i1 %156, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %153
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %138
  %.lcssa114 = phi %struct.jpeg_component_info* [ %145, %138 ], [ %155, %._crit_edge.loopexit ]
  %157 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %sunkaddr109 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr110 = inttoptr i64 %sunkaddr109 to %struct.jpeg_error_mgr**
  %158 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %sunkaddr110, align 8
  %159 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %158, i64 0, i32 5
  store i32 5, i32* %159, align 8
  %160 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %sunkaddr110, align 8
  %161 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %160, i64 0, i32 6, i32 0, i64 0
  store i32 %128, i32* %161, align 4
  %162 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %157, align 8
  %163 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %162, align 8
  tail call void %163(%struct.jpeg_common_struct* %.cast36.pre-phi) #4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge
  %.lcssa113 = phi %struct.jpeg_component_info* [ %.lcssa114, %._crit_edge ], [ %149, %.loopexit.loopexit ]
  %164 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv
  store %struct.jpeg_component_info* %.lcssa113, %struct.jpeg_component_info** %164, align 8
  %165 = lshr i32 %144, 4
  %166 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.lcssa113, i64 0, i32 5
  store i32 %165, i32* %166, align 4
  %167 = and i32 %144, 15
  %168 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.lcssa113, i64 0, i32 6
  store i32 %167, i32* %168, align 8
  %sunkaddr111 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr112 = inttoptr i64 %sunkaddr111 to %struct.jpeg_error_mgr**
  %169 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %sunkaddr112, align 8
  %170 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %169, i64 0, i32 6, i32 0, i64 0
  store i32 %128, i32* %170, align 4
  %171 = load i32, i32* %166, align 4
  %172 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %169, i64 0, i32 6, i32 0, i64 1
  store i32 %171, i32* %172, align 4
  %173 = load i32, i32* %168, align 8
  %174 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %169, i64 0, i32 6, i32 0, i64 2
  store i32 %173, i32* %174, align 4
  %175 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %sunkaddr112, align 8
  %176 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %175, i64 0, i32 5
  store i32 103, i32* %176, align 8
  %177 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %sunkaddr112, align 8
  %178 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %177, i64 0, i32 1
  %179 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %178, align 8
  tail call void %179(%struct.jpeg_common_struct* %.cast36.pre-phi, i32 1) #4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %180 = icmp slt i64 %indvars.iv.next, %86
  br i1 %180, label %110, label %._crit_edge7.loopexit

._crit_edge7.loopexit:                            ; preds = %.loopexit
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %._crit_edge50
  %181 = phi i8* [ %83, %._crit_edge50 ], [ %142, %._crit_edge7.loopexit ]
  %182 = phi i64 [ %82, %._crit_edge50 ], [ %141, %._crit_edge7.loopexit ]
  %183 = icmp eq i64 %182, 0
  br i1 %183, label %184, label %196

; <label>:184:                                    ; preds = %._crit_edge7
  %185 = inttoptr i64 %5 to %struct.jpeg_source_mgr*
  %186 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %185, i64 0, i32 3
  %187 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %186, align 8
  %188 = tail call i32 %187(%struct.jpeg_decompress_struct* nonnull %0) #4
  %189 = icmp eq i32 %188, 0
  br i1 %189, label %.loopexit68, label %190

; <label>:190:                                    ; preds = %184
  %191 = inttoptr i64 %5 to i8**
  %192 = inttoptr i64 %5 to i64*
  %193 = load i8*, i8** %191, align 8
  %194 = getelementptr inbounds i64, i64* %192, i64 1
  %195 = load i64, i64* %194, align 8
  store i64 %195, i64* %2, align 8
  br label %196

; <label>:196:                                    ; preds = %190, %._crit_edge7
  %197 = phi i8* [ %193, %190 ], [ %181, %._crit_edge7 ]
  %198 = phi i64 [ %195, %190 ], [ %182, %._crit_edge7 ]
  %199 = add i64 %198, -1
  store i64 %199, i64* %2, align 8
  %200 = getelementptr inbounds i8, i8* %197, i64 1
  %201 = load i8, i8* %197, align 1
  %202 = zext i8 %201 to i32
  %203 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 68
  store i32 %202, i32* %203, align 4
  %204 = icmp eq i64 %199, 0
  br i1 %204, label %205, label %217

; <label>:205:                                    ; preds = %196
  %206 = inttoptr i64 %5 to %struct.jpeg_source_mgr*
  %207 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %206, i64 0, i32 3
  %208 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %207, align 8
  %209 = tail call i32 %208(%struct.jpeg_decompress_struct* nonnull %0) #4
  %210 = icmp eq i32 %209, 0
  br i1 %210, label %.loopexit68, label %211

; <label>:211:                                    ; preds = %205
  %212 = inttoptr i64 %5 to i8**
  %213 = inttoptr i64 %5 to i64*
  %214 = load i8*, i8** %212, align 8
  %215 = getelementptr inbounds i64, i64* %213, i64 1
  %216 = load i64, i64* %215, align 8
  store i64 %216, i64* %2, align 8
  br label %217

; <label>:217:                                    ; preds = %211, %196
  %218 = phi i8* [ %214, %211 ], [ %200, %196 ]
  %219 = phi i64 [ %216, %211 ], [ %199, %196 ]
  %220 = add i64 %219, -1
  store i64 %220, i64* %2, align 8
  %221 = load i8, i8* %218, align 1
  %222 = zext i8 %221 to i32
  %223 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 69
  store i32 %222, i32* %223, align 8
  %224 = icmp eq i64 %220, 0
  br i1 %224, label %226, label %._crit_edge49

._crit_edge49:                                    ; preds = %217
  %225 = getelementptr inbounds i8, i8* %218, i64 1
  br label %238

; <label>:226:                                    ; preds = %217
  %227 = inttoptr i64 %5 to %struct.jpeg_source_mgr*
  %228 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %227, i64 0, i32 3
  %229 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %228, align 8
  %230 = tail call i32 %229(%struct.jpeg_decompress_struct* nonnull %0) #4
  %231 = icmp eq i32 %230, 0
  br i1 %231, label %.loopexit68, label %232

; <label>:232:                                    ; preds = %226
  %233 = inttoptr i64 %5 to i8**
  %234 = inttoptr i64 %5 to i64*
  %235 = load i8*, i8** %233, align 8
  %236 = getelementptr inbounds i64, i64* %234, i64 1
  %237 = load i64, i64* %236, align 8
  store i64 %237, i64* %2, align 8
  br label %238

; <label>:238:                                    ; preds = %._crit_edge49, %232
  %239 = phi i8* [ %225, %._crit_edge49 ], [ %235, %232 ]
  %240 = phi i64 [ %220, %._crit_edge49 ], [ %237, %232 ]
  %241 = add i64 %240, -1
  store i64 %241, i64* %2, align 8
  %242 = getelementptr inbounds i8, i8* %239, i64 1
  %243 = load i8, i8* %239, align 1
  %244 = zext i8 %243 to i32
  %245 = lshr i32 %244, 4
  %246 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 70
  store i32 %245, i32* %246, align 4
  %247 = and i32 %244, 15
  %248 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 71
  store i32 %247, i32* %248, align 8
  %sunkaddr113 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr114 = inttoptr i64 %sunkaddr113 to %struct.jpeg_error_mgr**
  %249 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %sunkaddr114, align 8
  %250 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %249, i64 0, i32 6, i32 0, i64 0
  %sunkaddr115 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr116 = add i64 %sunkaddr115, 508
  %sunkaddr117 = inttoptr i64 %sunkaddr116 to i32*
  %251 = load i32, i32* %sunkaddr117, align 4
  store i32 %251, i32* %250, align 4
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr64 = add i64 %sunkaddr, 512
  %sunkaddr65 = inttoptr i64 %sunkaddr64 to i32*
  %252 = load i32, i32* %sunkaddr65, align 8
  %253 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %249, i64 0, i32 6, i32 0, i64 1
  store i32 %252, i32* %253, align 4
  %254 = load i32, i32* %246, align 4
  %255 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %249, i64 0, i32 6, i32 0, i64 2
  store i32 %254, i32* %255, align 4
  %256 = load i32, i32* %248, align 8
  %257 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %249, i64 0, i32 6, i32 0, i64 3
  store i32 %256, i32* %257, align 4
  %258 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %sunkaddr114, align 8
  %259 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %258, i64 0, i32 5
  store i32 104, i32* %259, align 8
  %260 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %sunkaddr114, align 8
  %261 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %260, i64 0, i32 1
  %262 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %261, align 8
  tail call void %262(%struct.jpeg_common_struct* nonnull %.cast36.pre-phi, i32 1) #4
  %sunkaddr118 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr119 = add i64 %sunkaddr118, 568
  %sunkaddr120 = inttoptr i64 %sunkaddr119 to %struct.jpeg_marker_reader**
  %263 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %sunkaddr120, align 8
  %264 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %263, i64 0, i32 7
  store i32 0, i32* %264, align 8
  %265 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 34
  %266 = load i32, i32* %265, align 4
  %267 = add nsw i32 %266, 1
  store i32 %267, i32* %265, align 4
  %268 = ptrtoint i8* %242 to i64
  %sunkaddr121 = inttoptr i64 %5 to i64*
  store i64 %268, i64* %sunkaddr121, align 8
  %269 = load i64, i64* %2, align 8
  %sunkaddr66 = add i64 %5, 8
  %sunkaddr67 = inttoptr i64 %sunkaddr66 to i64*
  store i64 %269, i64* %sunkaddr67, align 8
  br label %.loopexit68

.loopexit68.loopexit:                             ; preds = %114, %130
  br label %.loopexit68

.loopexit68:                                      ; preds = %.loopexit68.loopexit, %226, %205, %184, %67, %46, %25, %238
  %270 = phi i32 [ 1, %238 ], [ 0, %25 ], [ 0, %46 ], [ 0, %67 ], [ 0, %184 ], [ 0, %205 ], [ 0, %226 ], [ 0, %.loopexit68.loopexit ]
  ret i32 %270
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @get_dac(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = alloca i64, align 8
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %4 = bitcast %struct.jpeg_source_mgr** %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = inttoptr i64 %5 to i8**
  %7 = load i8*, i8** %6, align 8
  %.cast = inttoptr i64 %5 to %struct.jpeg_source_mgr*
  %8 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %.cast, i64 0, i32 1
  %9 = load i64, i64* %8, align 8
  store i64 %9, i64* %2, align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %11, label %23

; <label>:11:                                     ; preds = %1
  %12 = inttoptr i64 %5 to %struct.jpeg_source_mgr*
  %13 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %12, i64 0, i32 3
  %14 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %13, align 8
  %15 = tail call i32 %14(%struct.jpeg_decompress_struct* nonnull %0) #4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %140, label %17

; <label>:17:                                     ; preds = %11
  %18 = inttoptr i64 %5 to i8**
  %19 = inttoptr i64 %5 to i64*
  %20 = load i8*, i8** %18, align 8
  %21 = getelementptr inbounds i64, i64* %19, i64 1
  %22 = load i64, i64* %21, align 8
  store i64 %22, i64* %2, align 8
  br label %23

; <label>:23:                                     ; preds = %17, %1
  %24 = phi i8* [ %20, %17 ], [ %7, %1 ]
  %25 = phi i64 [ %22, %17 ], [ %9, %1 ]
  %26 = add i64 %25, -1
  store i64 %26, i64* %2, align 8
  %27 = getelementptr inbounds i8, i8* %24, i64 1
  %28 = load i8, i8* %24, align 1
  %29 = zext i8 %28 to i64
  %30 = shl nuw nsw i64 %29, 8
  %31 = icmp eq i64 %26, 0
  br i1 %31, label %32, label %44

; <label>:32:                                     ; preds = %23
  %33 = inttoptr i64 %5 to %struct.jpeg_source_mgr*
  %34 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %33, i64 0, i32 3
  %35 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %34, align 8
  %36 = tail call i32 %35(%struct.jpeg_decompress_struct* nonnull %0) #4
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %140, label %38

; <label>:38:                                     ; preds = %32
  %39 = inttoptr i64 %5 to i8**
  %40 = inttoptr i64 %5 to i64*
  %41 = load i8*, i8** %39, align 8
  %42 = getelementptr inbounds i64, i64* %40, i64 1
  %43 = load i64, i64* %42, align 8
  store i64 %43, i64* %2, align 8
  br label %44

; <label>:44:                                     ; preds = %23, %38
  %45 = phi i8* [ %27, %23 ], [ %41, %38 ]
  %46 = phi i64 [ %26, %23 ], [ %43, %38 ]
  %47 = add i64 %46, -1
  store i64 %47, i64* %2, align 8
  %48 = getelementptr inbounds i8, i8* %45, i64 1
  %49 = load i8, i8* %45, align 1
  %50 = zext i8 %49 to i64
  %51 = or i64 %30, %50
  %52 = icmp ugt i64 %51, 2
  br i1 %52, label %.lr.ph, label %135

.lr.ph:                                           ; preds = %44
  br label %53

; <label>:53:                                     ; preds = %.lr.ph, %.backedge
  %.in26 = phi i64 [ %51, %.lr.ph ], [ %56, %.backedge ]
  %54 = phi i8* [ %48, %.lr.ph ], [ %91, %.backedge ]
  %55 = phi i64 [ %47, %.lr.ph ], [ %90, %.backedge ]
  %56 = add nsw i64 %.in26, -2
  %57 = icmp eq i64 %55, 0
  br i1 %57, label %58, label %67

; <label>:58:                                     ; preds = %53
  %sunkaddr44 = add i64 %5, 24
  %sunkaddr45 = inttoptr i64 %sunkaddr44 to i32 (%struct.jpeg_decompress_struct*)**
  %59 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %sunkaddr45, align 8
  %60 = tail call i32 %59(%struct.jpeg_decompress_struct* nonnull %0) #4
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %62, label %63

; <label>:62:                                     ; preds = %58
  store i64 0, i64* %2, align 8
  br label %140

; <label>:63:                                     ; preds = %58
  %64 = inttoptr i64 %5 to i8**
  %65 = load i8*, i8** %64, align 8
  %sunkaddr46 = add i64 %5, 8
  %sunkaddr47 = inttoptr i64 %sunkaddr46 to i64*
  %66 = load i64, i64* %sunkaddr47, align 8
  br label %67

; <label>:67:                                     ; preds = %53, %63
  %68 = phi i8* [ %54, %53 ], [ %65, %63 ]
  %69 = phi i64 [ %55, %53 ], [ %66, %63 ]
  %70 = add i64 %69, -1
  %71 = getelementptr inbounds i8, i8* %68, i64 1
  %72 = load i8, i8* %68, align 1
  %73 = zext i8 %72 to i64
  %74 = zext i8 %72 to i32
  %75 = icmp eq i64 %70, 0
  br i1 %75, label %76, label %85

; <label>:76:                                     ; preds = %67
  %sunkaddr48 = add i64 %5, 24
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to i32 (%struct.jpeg_decompress_struct*)**
  %77 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %sunkaddr49, align 8
  %78 = tail call i32 %77(%struct.jpeg_decompress_struct* %0) #4
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %81

; <label>:80:                                     ; preds = %76
  store i64 0, i64* %2, align 8
  br label %140

; <label>:81:                                     ; preds = %76
  %82 = inttoptr i64 %5 to i8**
  %83 = load i8*, i8** %82, align 8
  %sunkaddr = add i64 %5, 8
  %sunkaddr50 = inttoptr i64 %sunkaddr to i64*
  %84 = load i64, i64* %sunkaddr50, align 8
  br label %85

; <label>:85:                                     ; preds = %67, %81
  %86 = phi i8* [ %71, %67 ], [ %83, %81 ]
  %87 = phi i64 [ %70, %67 ], [ %84, %81 ]
  %88 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %89 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %90 = add i64 %87, -1
  %91 = getelementptr inbounds i8, i8* %86, i64 1
  %92 = load i8, i8* %86, align 1
  %93 = zext i8 %92 to i32
  %94 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %89, align 8
  %95 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %94, i64 0, i32 5
  store i32 78, i32* %95, align 8
  %96 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %89, align 8
  %97 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %96, i64 0, i32 6, i32 0, i64 0
  store i32 %74, i32* %97, align 4
  %98 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %89, align 8
  %99 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i64 0, i32 6, i32 0, i64 1
  store i32 %93, i32* %99, align 4
  %100 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %89, align 8
  %101 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %100, i64 0, i32 1
  %102 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %101, align 8
  tail call void %102(%struct.jpeg_common_struct* %88, i32 1) #4
  %103 = icmp ugt i8 %72, 31
  br i1 %103, label %.thread, label %113

.thread:                                          ; preds = %85
  %104 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %105 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %106 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %107 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %105, align 8
  %108 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %107, i64 0, i32 5
  store i32 26, i32* %108, align 8
  %109 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %105, align 8
  %110 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %109, i64 0, i32 6, i32 0, i64 0
  store i32 %74, i32* %110, align 4
  %111 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %106, align 8
  %112 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %111, align 8
  tail call void %112(%struct.jpeg_common_struct* %104) #4
  br label %115

; <label>:113:                                    ; preds = %85
  %114 = icmp ugt i8 %72, 15
  br i1 %114, label %115, label %118

; <label>:115:                                    ; preds = %.thread, %113
  %116 = add nsw i64 %73, -16
  %117 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 %116
  store i8 %92, i8* %117, align 1
  br label %.backedge

; <label>:118:                                    ; preds = %113
  %119 = and i8 %92, 15
  %120 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 %73
  store i8 %119, i8* %120, align 1
  %121 = lshr i8 %92, 4
  %122 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 %73
  store i8 %121, i8* %122, align 1
  %123 = icmp ugt i8 %119, %121
  br i1 %123, label %125, label %.backedge

.backedge:                                        ; preds = %118, %125, %115
  %124 = icmp sgt i64 %56, 2
  br i1 %124, label %53, label %._crit_edge

; <label>:125:                                    ; preds = %118
  %126 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %127 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %128 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %129 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %127, align 8
  %130 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %129, i64 0, i32 5
  store i32 27, i32* %130, align 8
  %131 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %127, align 8
  %132 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %131, i64 0, i32 6, i32 0, i64 0
  store i32 %93, i32* %132, align 4
  %133 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %128, align 8
  %134 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %133, align 8
  tail call void %134(%struct.jpeg_common_struct* %126) #4
  br label %.backedge

._crit_edge:                                      ; preds = %.backedge
  store i64 %90, i64* %2, align 8
  br label %135

; <label>:135:                                    ; preds = %._crit_edge, %44
  %.in = phi i8* [ %91, %._crit_edge ], [ %48, %44 ]
  %136 = inttoptr i64 %5 to i64*
  %137 = ptrtoint i8* %.in to i64
  store i64 %137, i64* %136, align 8
  %138 = load i64, i64* %2, align 8
  %139 = getelementptr inbounds i64, i64* %136, i64 1
  store i64 %138, i64* %139, align 8
  br label %140

; <label>:140:                                    ; preds = %32, %11, %135, %80, %62
  %141 = phi i32 [ 1, %135 ], [ 0, %80 ], [ 0, %62 ], [ 0, %11 ], [ 0, %32 ]
  ret i32 %141
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @get_dht(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = alloca [17 x i8], align 16
  %3 = alloca [256 x i8], align 16
  %4 = alloca i64, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %6 = bitcast %struct.jpeg_source_mgr** %5 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = inttoptr i64 %7 to i8**
  %9 = load i8*, i8** %8, align 8
  %.cast = inttoptr i64 %7 to %struct.jpeg_source_mgr*
  %10 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %.cast, i64 0, i32 1
  %11 = load i64, i64* %10, align 8
  store i64 %11, i64* %4, align 8
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %13, label %25

; <label>:13:                                     ; preds = %1
  %14 = inttoptr i64 %7 to %struct.jpeg_source_mgr*
  %15 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %14, i64 0, i32 3
  %16 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %15, align 8
  %17 = tail call i32 %16(%struct.jpeg_decompress_struct* nonnull %0) #4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %.loopexit, label %19

; <label>:19:                                     ; preds = %13
  %20 = inttoptr i64 %7 to i8**
  %21 = inttoptr i64 %7 to i64*
  %22 = load i8*, i8** %20, align 8
  %23 = getelementptr inbounds i64, i64* %21, i64 1
  %24 = load i64, i64* %23, align 8
  store i64 %24, i64* %4, align 8
  br label %25

; <label>:25:                                     ; preds = %19, %1
  %26 = phi i8* [ %22, %19 ], [ %9, %1 ]
  %27 = phi i64 [ %24, %19 ], [ %11, %1 ]
  %28 = add i64 %27, -1
  store i64 %28, i64* %4, align 8
  %29 = load i8, i8* %26, align 1
  %30 = zext i8 %29 to i64
  %31 = shl nuw nsw i64 %30, 8
  %32 = icmp eq i64 %28, 0
  br i1 %32, label %34, label %._crit_edge

._crit_edge:                                      ; preds = %25
  %33 = getelementptr inbounds i8, i8* %26, i64 1
  %.pre170 = inttoptr i64 %7 to i64*
  br label %46

; <label>:34:                                     ; preds = %25
  %35 = inttoptr i64 %7 to %struct.jpeg_source_mgr*
  %36 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %35, i64 0, i32 3
  %37 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %36, align 8
  %38 = tail call i32 %37(%struct.jpeg_decompress_struct* nonnull %0) #4
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %.loopexit, label %40

; <label>:40:                                     ; preds = %34
  %41 = inttoptr i64 %7 to i8**
  %42 = inttoptr i64 %7 to i64*
  %43 = load i8*, i8** %41, align 8
  %44 = getelementptr inbounds i64, i64* %42, i64 1
  %45 = load i64, i64* %44, align 8
  store i64 %45, i64* %4, align 8
  br label %46

; <label>:46:                                     ; preds = %._crit_edge, %40
  %.pre-phi = phi i64* [ %.pre170, %._crit_edge ], [ %42, %40 ]
  %47 = phi i8* [ %33, %._crit_edge ], [ %43, %40 ]
  %48 = phi i64 [ %28, %._crit_edge ], [ %45, %40 ]
  %49 = add i64 %48, -1
  store i64 %49, i64* %4, align 8
  %50 = getelementptr inbounds i8, i8* %47, i64 1
  %51 = load i8, i8* %47, align 1
  %52 = zext i8 %51 to i64
  %53 = or i64 %31, %52
  %54 = icmp ugt i64 %53, 2
  br i1 %54, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %46
  %55 = add nsw i64 %53, -2
  %sunkaddr77 = ptrtoint [17 x i8]* %2 to i64
  %sunkaddr78 = or i64 %sunkaddr77, 1
  %sunkaddr81 = or i64 %sunkaddr77, 2
  %sunkaddr84 = or i64 %sunkaddr77, 3
  %sunkaddr87 = or i64 %sunkaddr77, 4
  %sunkaddr90 = or i64 %sunkaddr77, 5
  %sunkaddr93 = or i64 %sunkaddr77, 6
  %sunkaddr96 = or i64 %sunkaddr77, 7
  %sunkaddr99 = or i64 %sunkaddr77, 8
  %sunkaddr102 = or i64 %sunkaddr77, 9
  %sunkaddr105 = or i64 %sunkaddr77, 10
  %sunkaddr108 = or i64 %sunkaddr77, 11
  %sunkaddr111 = or i64 %sunkaddr77, 12
  %sunkaddr114 = or i64 %sunkaddr77, 13
  %sunkaddr117 = or i64 %sunkaddr77, 14
  %sunkaddr120 = or i64 %sunkaddr77, 15
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %238, %.lr.ph18
  %.pre33 = phi i8* [ %50, %.lr.ph18 ], [ %.pre3353, %238 ]
  %56 = phi i64 [ %55, %.lr.ph18 ], [ %213, %238 ]
  %57 = phi i64 [ %49, %.lr.ph18 ], [ %.pre, %238 ]
  %58 = icmp eq i64 %57, 0
  br i1 %58, label %59, label %.lr.ph

; <label>:59:                                     ; preds = %._crit_edge31
  %sunkaddr186 = add i64 %7, 24
  %sunkaddr187 = inttoptr i64 %sunkaddr186 to i32 (%struct.jpeg_decompress_struct*)**
  %60 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %sunkaddr187, align 8
  %61 = tail call i32 %60(%struct.jpeg_decompress_struct* %0) #4
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %.loopexit.loopexit213, label %63

; <label>:63:                                     ; preds = %59
  %64 = inttoptr i64 %7 to %struct.jpeg_source_mgr*
  %65 = bitcast %struct.jpeg_source_mgr* %64 to i8**
  %66 = load i8*, i8** %65, align 8
  %sunkaddr188 = add i64 %7, 8
  %sunkaddr189 = inttoptr i64 %sunkaddr188 to i64*
  %67 = load i64, i64* %sunkaddr189, align 8
  store i64 %67, i64* %4, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge31, %63
  %68 = phi i8* [ %66, %63 ], [ %.pre33, %._crit_edge31 ]
  %69 = phi i64 [ %67, %63 ], [ %57, %._crit_edge31 ]
  %70 = bitcast [17 x i8]* %2 to i8*
  %71 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %72 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %73 = add i64 %69, -1
  store i64 %73, i64* %4, align 8
  %74 = getelementptr inbounds i8, i8* %68, i64 1
  %75 = load i8, i8* %68, align 1
  %promoted139 = zext i8 %75 to i64
  %76 = zext i8 %75 to i32
  %77 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %71, align 8
  %78 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %77, i64 0, i32 5
  store i32 79, i32* %78, align 8
  %79 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %71, align 8
  %80 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %79, i64 0, i32 6, i32 0, i64 0
  store i32 %76, i32* %80, align 4
  %81 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %71, align 8
  %82 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %81, i64 0, i32 1
  %83 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %82, align 8
  tail call void %83(%struct.jpeg_common_struct* %72, i32 1) #4
  store i8 0, i8* %70, align 16
  br label %84

; <label>:84:                                     ; preds = %.lr.ph, %96
  %indvars.iv = phi i64 [ 1, %.lr.ph ], [ %indvars.iv.next, %96 ]
  %85 = phi i64 [ %73, %.lr.ph ], [ %99, %96 ]
  %86 = phi i32 [ 0, %.lr.ph ], [ %104, %96 ]
  %87 = phi i8* [ %74, %.lr.ph ], [ %100, %96 ]
  %88 = icmp eq i64 %85, 0
  br i1 %88, label %89, label %96

; <label>:89:                                     ; preds = %84
  %sunkaddr190 = add i64 %7, 24
  %sunkaddr191 = inttoptr i64 %sunkaddr190 to i32 (%struct.jpeg_decompress_struct*)**
  %90 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %sunkaddr191, align 8
  %91 = tail call i32 %90(%struct.jpeg_decompress_struct* %0) #4
  %92 = icmp eq i32 %91, 0
  br i1 %92, label %.loopexit.loopexit212, label %93

; <label>:93:                                     ; preds = %89
  %sunkaddr204 = inttoptr i64 %7 to i8**
  %94 = load i8*, i8** %sunkaddr204, align 8
  %sunkaddr192 = add i64 %7, 8
  %sunkaddr193 = inttoptr i64 %sunkaddr192 to i64*
  %95 = load i64, i64* %sunkaddr193, align 8
  store i64 %95, i64* %4, align 8
  br label %96

; <label>:96:                                     ; preds = %93, %84
  %97 = phi i64 [ %95, %93 ], [ %85, %84 ]
  %98 = phi i8* [ %94, %93 ], [ %87, %84 ]
  %99 = add i64 %97, -1
  store i64 %99, i64* %4, align 8
  %100 = getelementptr inbounds i8, i8* %98, i64 1
  %101 = load i8, i8* %98, align 1
  %102 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 %indvars.iv
  store i8 %101, i8* %102, align 1
  %103 = zext i8 %101 to i32
  %104 = add nsw i32 %86, %103
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %105 = icmp slt i64 %indvars.iv.next, 17
  br i1 %105, label %84, label %106

; <label>:106:                                    ; preds = %96
  %107 = inttoptr i64 %sunkaddr120 to i8*
  %108 = inttoptr i64 %sunkaddr117 to i8*
  %109 = inttoptr i64 %sunkaddr114 to i8*
  %110 = inttoptr i64 %sunkaddr111 to i8*
  %111 = inttoptr i64 %sunkaddr108 to i8*
  %112 = inttoptr i64 %sunkaddr105 to i8*
  %113 = inttoptr i64 %sunkaddr102 to i8*
  %114 = inttoptr i64 %sunkaddr99 to i8*
  %115 = inttoptr i64 %sunkaddr96 to i8*
  %116 = inttoptr i64 %sunkaddr93 to i8*
  %117 = inttoptr i64 %sunkaddr90 to i8*
  %118 = inttoptr i64 %sunkaddr87 to i8*
  %119 = inttoptr i64 %sunkaddr84 to i8*
  %120 = inttoptr i64 %sunkaddr81 to i8*
  %121 = inttoptr i64 %sunkaddr78 to i8*
  %122 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %123 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %.pre35 = load i8, i8* %121, align 1
  %.pre36 = load i8, i8* %120, align 2
  %.pre37 = load i8, i8* %119, align 1
  %.pre38 = load i8, i8* %118, align 4
  %.pre39 = load i8, i8* %117, align 1
  %.pre40 = load i8, i8* %116, align 2
  %.pre41 = load i8, i8* %115, align 1
  %.pre42 = load i8, i8* %114, align 8
  %.pre43 = load i8, i8* %113, align 1
  %.pre44 = load i8, i8* %112, align 2
  %.pre45 = load i8, i8* %111, align 1
  %.pre46 = load i8, i8* %110, align 4
  %.pre47 = load i8, i8* %109, align 1
  %.pre48 = load i8, i8* %108, align 2
  %.pre49 = load i8, i8* %107, align 1
  %sunkaddr194 = ptrtoint [17 x i8]* %2 to i64
  %sunkaddr195 = add i64 %sunkaddr194, 16
  %sunkaddr196 = inttoptr i64 %sunkaddr195 to i8*
  %.pre50 = load i8, i8* %sunkaddr196, align 16
  %124 = add nsw i64 %56, -17
  %125 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %122, align 8
  %126 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %125, i64 0, i32 6, i32 0, i64 0
  %127 = zext i8 %.pre35 to i32
  %128 = zext i8 %.pre36 to i32
  %129 = insertelement <2 x i32> undef, i32 %127, i32 0
  %130 = insertelement <2 x i32> %129, i32 %128, i32 1
  %131 = bitcast i32* %126 to <4 x i32>*
  %132 = zext i8 %.pre37 to i32
  %133 = zext i8 %.pre38 to i32
  %134 = insertelement <2 x i32> undef, i32 %132, i32 0
  %135 = insertelement <2 x i32> %134, i32 %133, i32 1
  %136 = shufflevector <2 x i32> %130, <2 x i32> %135, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  store <4 x i32> %136, <4 x i32>* %131, align 4
  %137 = zext i8 %.pre39 to i32
  %138 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %125, i64 0, i32 6, i32 0, i64 4
  %139 = zext i8 %.pre40 to i32
  %140 = insertelement <2 x i32> undef, i32 %137, i32 0
  %141 = insertelement <2 x i32> %140, i32 %139, i32 1
  %142 = bitcast i32* %138 to <4 x i32>*
  %143 = zext i8 %.pre41 to i32
  %144 = zext i8 %.pre42 to i32
  %145 = insertelement <2 x i32> undef, i32 %143, i32 0
  %146 = insertelement <2 x i32> %145, i32 %144, i32 1
  %147 = shufflevector <2 x i32> %141, <2 x i32> %146, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  store <4 x i32> %147, <4 x i32>* %142, align 4
  %148 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %122, align 8
  %149 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %148, i64 0, i32 5
  store i32 85, i32* %149, align 8
  %150 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %122, align 8
  %151 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %150, i64 0, i32 1
  %152 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %151, align 8
  tail call void %152(%struct.jpeg_common_struct* %123, i32 2) #4
  %153 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %122, align 8
  %154 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %153, i64 0, i32 6, i32 0, i64 0
  %155 = zext i8 %.pre43 to i32
  %156 = zext i8 %.pre44 to i32
  %157 = insertelement <2 x i32> undef, i32 %155, i32 0
  %158 = insertelement <2 x i32> %157, i32 %156, i32 1
  %159 = bitcast i32* %154 to <4 x i32>*
  %160 = zext i8 %.pre45 to i32
  %161 = zext i8 %.pre46 to i32
  %162 = insertelement <2 x i32> undef, i32 %160, i32 0
  %163 = insertelement <2 x i32> %162, i32 %161, i32 1
  %164 = shufflevector <2 x i32> %158, <2 x i32> %163, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  store <4 x i32> %164, <4 x i32>* %159, align 4
  %165 = zext i8 %.pre47 to i32
  %166 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %153, i64 0, i32 6, i32 0, i64 4
  %167 = zext i8 %.pre48 to i32
  %168 = insertelement <2 x i32> undef, i32 %165, i32 0
  %169 = insertelement <2 x i32> %168, i32 %167, i32 1
  %170 = bitcast i32* %166 to <4 x i32>*
  %171 = zext i8 %.pre49 to i32
  %172 = zext i8 %.pre50 to i32
  %173 = insertelement <2 x i32> undef, i32 %171, i32 0
  %174 = insertelement <2 x i32> %173, i32 %172, i32 1
  %175 = shufflevector <2 x i32> %169, <2 x i32> %174, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  store <4 x i32> %175, <4 x i32>* %170, align 4
  %176 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %122, align 8
  %177 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %176, i64 0, i32 5
  store i32 85, i32* %177, align 8
  %178 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %122, align 8
  %179 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %178, i64 0, i32 1
  %180 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %179, align 8
  tail call void %180(%struct.jpeg_common_struct* %123, i32 2) #4
  %181 = icmp sgt i32 %104, 256
  %182 = sext i32 %104 to i64
  %183 = icmp slt i64 %124, %182
  %or.cond = or i1 %181, %183
  br i1 %or.cond, label %184, label %192

; <label>:184:                                    ; preds = %106
  %185 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %186 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %187 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %188 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %186, align 8
  %189 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %188, i64 0, i32 5
  store i32 28, i32* %189, align 8
  %190 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %185, align 8
  %191 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %190, align 8
  tail call void %191(%struct.jpeg_common_struct* %187) #4
  br label %192

; <label>:192:                                    ; preds = %106, %184
  %193 = icmp sgt i32 %104, 0
  br i1 %193, label %.lr.ph9, label %._crit_edge10

.lr.ph9:                                          ; preds = %192
  br label %194

; <label>:194:                                    ; preds = %.lr.ph9, %205
  %indvars.iv62 = phi i64 [ 0, %.lr.ph9 ], [ %indvars.iv.next63, %205 ]
  %195 = phi i64 [ %99, %.lr.ph9 ], [ %208, %205 ]
  %196 = phi i8* [ %100, %.lr.ph9 ], [ %209, %205 ]
  %197 = icmp eq i64 %195, 0
  br i1 %197, label %198, label %205

; <label>:198:                                    ; preds = %194
  %sunkaddr200 = add i64 %7, 24
  %sunkaddr201 = inttoptr i64 %sunkaddr200 to i32 (%struct.jpeg_decompress_struct*)**
  %199 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %sunkaddr201, align 8
  %200 = tail call i32 %199(%struct.jpeg_decompress_struct* %0) #4
  %201 = icmp eq i32 %200, 0
  br i1 %201, label %.loopexit.loopexit, label %202

; <label>:202:                                    ; preds = %198
  %sunkaddr208 = inttoptr i64 %7 to i8**
  %203 = load i8*, i8** %sunkaddr208, align 8
  %sunkaddr202 = add i64 %7, 8
  %sunkaddr203 = inttoptr i64 %sunkaddr202 to i64*
  %204 = load i64, i64* %sunkaddr203, align 8
  store i64 %204, i64* %4, align 8
  br label %205

; <label>:205:                                    ; preds = %194, %202
  %206 = phi i64 [ %195, %194 ], [ %204, %202 ]
  %207 = phi i8* [ %196, %194 ], [ %203, %202 ]
  %208 = add i64 %206, -1
  store i64 %208, i64* %4, align 8
  %209 = getelementptr inbounds i8, i8* %207, i64 1
  %210 = load i8, i8* %207, align 1
  %211 = getelementptr inbounds [256 x i8], [256 x i8]* %3, i64 0, i64 %indvars.iv62
  store i8 %210, i8* %211, align 1
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %212 = icmp slt i64 %indvars.iv.next63, %182
  br i1 %212, label %194, label %._crit_edge10.loopexit

._crit_edge10.loopexit:                           ; preds = %205
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %192
  %.pre = phi i64 [ %99, %192 ], [ %208, %._crit_edge10.loopexit ]
  %.pre3353 = phi i8* [ %100, %192 ], [ %209, %._crit_edge10.loopexit ]
  %213 = sub nsw i64 %124, %182
  %214 = and i32 %76, 16
  %215 = icmp eq i32 %214, 0
  %216 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 40, i64 %promoted139
  %217 = add nsw i64 %promoted139, -16
  %promoted = trunc i64 %217 to i32
  %218 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 41, i64 %217
  %219 = select i1 %215, i32 %76, i32 %promoted
  %220 = select i1 %215, %struct.JHUFF_TBL** %216, %struct.JHUFF_TBL** %218
  %221 = icmp ugt i32 %219, 3
  br i1 %221, label %222, label %232

; <label>:222:                                    ; preds = %._crit_edge10
  %223 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %224 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %225 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %226 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %224, align 8
  %227 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %226, i64 0, i32 5
  store i32 29, i32* %227, align 8
  %228 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %224, align 8
  %229 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %228, i64 0, i32 6, i32 0, i64 0
  store i32 %219, i32* %229, align 4
  %230 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %223, align 8
  %231 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %230, align 8
  tail call void %231(%struct.jpeg_common_struct* %225) #4
  br label %232

; <label>:232:                                    ; preds = %._crit_edge10, %222
  %233 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %220, align 8
  %234 = icmp eq %struct.JHUFF_TBL* %233, null
  br i1 %234, label %235, label %238

; <label>:235:                                    ; preds = %232
  %236 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %237 = tail call %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct* %236) #4
  store %struct.JHUFF_TBL* %237, %struct.JHUFF_TBL** %220, align 8
  br label %238

; <label>:238:                                    ; preds = %235, %232
  %.pn = phi %struct.JHUFF_TBL* [ %237, %235 ], [ %233, %232 ]
  %239 = bitcast [256 x i8]* %3 to i8*
  %240 = bitcast [17 x i8]* %2 to i8*
  %241 = bitcast %struct.JHUFF_TBL* %.pn to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %241, i8* nonnull %240, i64 17, i32 4, i1 false)
  %242 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %220, align 8
  %243 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %242, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %243, i8* nonnull %239, i64 256, i32 1, i1 false)
  %244 = icmp sgt i64 %213, 0
  br i1 %244, label %._crit_edge31, label %._crit_edge19.loopexit

._crit_edge19.loopexit:                           ; preds = %238
  %245 = inttoptr i64 %7 to i64*
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %46
  %246 = phi i64* [ %.pre-phi, %46 ], [ %245, %._crit_edge19.loopexit ]
  %.in56 = phi i8* [ %50, %46 ], [ %.pre3353, %._crit_edge19.loopexit ]
  %247 = ptrtoint i8* %.in56 to i64
  store i64 %247, i64* %246, align 8
  %248 = load i64, i64* %4, align 8
  %249 = getelementptr inbounds i64, i64* %246, i64 1
  store i64 %248, i64* %249, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %198
  br label %.loopexit

.loopexit.loopexit212:                            ; preds = %89
  br label %.loopexit

.loopexit.loopexit213:                            ; preds = %59
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit213, %.loopexit.loopexit212, %.loopexit.loopexit, %34, %13, %._crit_edge19
  %250 = phi i32 [ 1, %._crit_edge19 ], [ 0, %13 ], [ 0, %34 ], [ 0, %.loopexit.loopexit ], [ 0, %.loopexit.loopexit212 ], [ 0, %.loopexit.loopexit213 ]
  ret i32 %250
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @get_dqt(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.JQUANT_TBL*, align 8
  %6 = alloca %struct.jpeg_source_mgr*, align 8
  %7 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %9 = bitcast %struct.jpeg_source_mgr** %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = bitcast %struct.jpeg_source_mgr** %6 to i64*
  store i64 %10, i64* %11, align 8
  %12 = inttoptr i64 %10 to i64*
  %13 = load i64, i64* %12, align 8
  %.cast = inttoptr i64 %10 to %struct.jpeg_source_mgr*
  %14 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %.cast, i64 0, i32 1
  %15 = load i64, i64* %14, align 8
  store i64 %15, i64* %7, align 8
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %17, label %28

; <label>:17:                                     ; preds = %1
  %18 = inttoptr i64 %10 to %struct.jpeg_source_mgr*
  %19 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %18, i64 0, i32 3
  %20 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %19, align 8
  %21 = tail call i32 %20(%struct.jpeg_decompress_struct* nonnull %0) #4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %.loopexit91, label %23

; <label>:23:                                     ; preds = %17
  %24 = inttoptr i64 %10 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds i64, i64* %24, i64 1
  %27 = load i64, i64* %26, align 8
  store i64 %27, i64* %7, align 8
  br label %28

; <label>:28:                                     ; preds = %23, %1
  %.in = phi i64 [ %25, %23 ], [ %13, %1 ]
  %29 = phi i64 [ %27, %23 ], [ %15, %1 ]
  %30 = inttoptr i64 %.in to i8*
  %31 = add i64 %29, -1
  store i64 %31, i64* %7, align 8
  %32 = getelementptr inbounds i8, i8* %30, i64 1
  %33 = load i8, i8* %30, align 1
  %34 = zext i8 %33 to i64
  %35 = shl nuw nsw i64 %34, 8
  store i64 %35, i64* %3, align 8
  %36 = icmp eq i64 %31, 0
  br i1 %36, label %37, label %49

; <label>:37:                                     ; preds = %28
  %38 = inttoptr i64 %10 to %struct.jpeg_source_mgr*
  %39 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %38, i64 0, i32 3
  %40 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %39, align 8
  %41 = tail call i32 %40(%struct.jpeg_decompress_struct* nonnull %0) #4
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %.loopexit91, label %43

; <label>:43:                                     ; preds = %37
  %44 = inttoptr i64 %10 to i64*
  %45 = inttoptr i64 %10 to i8**
  %46 = load i8*, i8** %45, align 8
  %47 = getelementptr inbounds i64, i64* %44, i64 1
  %48 = load i64, i64* %47, align 8
  store i64 %48, i64* %7, align 8
  br label %49

; <label>:49:                                     ; preds = %28, %43
  %50 = phi i8* [ %32, %28 ], [ %46, %43 ]
  %51 = phi i64 [ %31, %28 ], [ %48, %43 ]
  %52 = inttoptr i64 %10 to i64*
  %53 = add i64 %51, -1
  store i64 %53, i64* %7, align 8
  %54 = getelementptr inbounds i8, i8* %50, i64 1
  %55 = load i8, i8* %50, align 1
  %56 = zext i8 %55 to i64
  %57 = or i64 %35, %56
  %58 = add nsw i64 %57, -2
  store i64 %58, i64* %3, align 8
  %59 = icmp ugt i64 %57, 2
  br i1 %59, label %.lr.ph23.preheader, label %._crit_edge24

.lr.ph23.preheader:                               ; preds = %49
  %60 = inttoptr i64 %10 to %struct.jpeg_source_mgr*
  %61 = inttoptr i64 %10 to i64*
  %62 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %63 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %64 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  br label %.lr.ph23

.lr.ph23:                                         ; preds = %.lr.ph23.preheader, %.backedge..lr.ph23_crit_edge
  %.pre34 = phi %struct.jpeg_decompress_struct* [ %312, %.backedge..lr.ph23_crit_edge ], [ %0, %.lr.ph23.preheader ]
  %65 = phi %struct.jpeg_source_mgr* [ %243, %.backedge..lr.ph23_crit_edge ], [ %60, %.lr.ph23.preheader ]
  %66 = phi %struct.jpeg_source_mgr* [ %244, %.backedge..lr.ph23_crit_edge ], [ %60, %.lr.ph23.preheader ]
  %67 = phi %struct.jpeg_source_mgr* [ %245, %.backedge..lr.ph23_crit_edge ], [ %60, %.lr.ph23.preheader ]
  %68 = phi %struct.jpeg_decompress_struct* [ %312, %.backedge..lr.ph23_crit_edge ], [ %0, %.lr.ph23.preheader ]
  %69 = phi %struct.jpeg_common_struct* [ %.pre-phi, %.backedge..lr.ph23_crit_edge ], [ %63, %.lr.ph23.preheader ]
  %70 = phi void (%struct.jpeg_common_struct*)*** [ %311, %.backedge..lr.ph23_crit_edge ], [ %62, %.lr.ph23.preheader ]
  %71 = phi %struct.jpeg_error_mgr** [ %.pre38, %.backedge..lr.ph23_crit_edge ], [ %64, %.lr.ph23.preheader ]
  %72 = phi i8* [ %.lcssa3, %.backedge..lr.ph23_crit_edge ], [ %54, %.lr.ph23.preheader ]
  %73 = phi i64* [ %246, %.backedge..lr.ph23_crit_edge ], [ %61, %.lr.ph23.preheader ]
  %74 = phi %struct.jpeg_source_mgr* [ %247, %.backedge..lr.ph23_crit_edge ], [ %60, %.lr.ph23.preheader ]
  %75 = phi i64 [ %.pre, %.backedge..lr.ph23_crit_edge ], [ %53, %.lr.ph23.preheader ]
  %76 = icmp eq i64 %75, 0
  br i1 %76, label %77, label %88

; <label>:77:                                     ; preds = %.lr.ph23
  %78 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %74, i64 0, i32 3
  %79 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %78, align 8
  %80 = tail call i32 %79(%struct.jpeg_decompress_struct* %68) #4
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %.loopexit91.loopexit180, label %82

; <label>:82:                                     ; preds = %77
  %83 = bitcast i64* %73 to i8**
  %84 = load i8*, i8** %83, align 8
  %85 = getelementptr inbounds i64, i64* %73, i64 1
  %86 = load i64, i64* %85, align 8
  store i64 %86, i64* %7, align 8
  %87 = bitcast i64* %73 to %struct.jpeg_source_mgr*
  br label %88

; <label>:88:                                     ; preds = %.lr.ph23, %82
  %89 = phi i8* [ %72, %.lr.ph23 ], [ %84, %82 ]
  %90 = phi i64 [ %75, %.lr.ph23 ], [ %86, %82 ]
  %91 = phi %struct.jpeg_source_mgr* [ %74, %.lr.ph23 ], [ %87, %82 ]
  %92 = add i64 %90, -1
  store i64 %92, i64* %7, align 8
  %93 = getelementptr inbounds i8, i8* %89, i64 1
  %94 = load i8, i8* %89, align 1
  %95 = zext i8 %94 to i32
  %96 = lshr i32 %95, 4
  store i32 %96, i32* %4, align 4
  %97 = and i32 %95, 15
  %98 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %71, align 8
  %99 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i64 0, i32 5
  store i32 80, i32* %99, align 8
  %100 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %71, align 8
  %101 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %100, i64 0, i32 6, i32 0, i64 0
  store i32 %97, i32* %101, align 4
  %102 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %71, align 8
  %103 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %102, i64 0, i32 6, i32 0, i64 1
  store i32 %96, i32* %103, align 4
  %104 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %71, align 8
  %105 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %104, i64 0, i32 1
  %106 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %105, align 8
  tail call void %106(%struct.jpeg_common_struct* %69, i32 1) #4
  %107 = icmp ugt i32 %97, 3
  br i1 %107, label %108, label %115

; <label>:108:                                    ; preds = %88
  %109 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %71, align 8
  %110 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %109, i64 0, i32 5
  store i32 30, i32* %110, align 8
  %111 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %71, align 8
  %112 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %111, i64 0, i32 6, i32 0, i64 0
  store i32 %97, i32* %112, align 4
  %113 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %70, align 8
  %114 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %113, align 8
  %.cast29 = bitcast void (%struct.jpeg_common_struct*)*** %70 to %struct.jpeg_common_struct*
  tail call void %114(%struct.jpeg_common_struct* %.cast29) #4
  br label %115

; <label>:115:                                    ; preds = %108, %88
  %116 = zext i32 %97 to i64
  %117 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %68, i64 0, i32 39, i64 %116
  %118 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %117, align 8
  %119 = icmp eq %struct.JQUANT_TBL* %118, null
  br i1 %119, label %120, label %.lr.ph

; <label>:120:                                    ; preds = %115
  %121 = tail call %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct* %69) #4
  %122 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %69, i64 6
  %123 = bitcast %struct.jpeg_common_struct* %122 to [4 x %struct.JQUANT_TBL*]*
  %124 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %123, i64 0, i64 %116
  store %struct.JQUANT_TBL* %121, %struct.JQUANT_TBL** %124, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %115, %120
  %125 = phi %struct.jpeg_decompress_struct* [ %.pre34, %120 ], [ %68, %115 ]
  %126 = bitcast %struct.JQUANT_TBL** %5 to i64*
  %127 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %125, i64 0, i32 39, i64 %116
  %128 = bitcast %struct.JQUANT_TBL** %127 to i64*
  %129 = load i64, i64* %128, align 8
  store i64 %129, i64* %126, align 8
  %130 = icmp eq i32 %96, 0
  br i1 %130, label %.lr.ph.split.preheader, label %.lr.ph.split.us.preheader

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  br label %.lr.ph.split

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %..lr.ph.split.us_crit_edge
  %131 = phi i64 [ %.pre148, %..lr.ph.split.us_crit_edge ], [ %92, %.lr.ph.split.us.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %..lr.ph.split.us_crit_edge ], [ 0, %.lr.ph.split.us.preheader ]
  %132 = phi %struct.jpeg_source_mgr* [ %184, %..lr.ph.split.us_crit_edge ], [ %65, %.lr.ph.split.us.preheader ]
  %133 = phi %struct.jpeg_source_mgr* [ %186, %..lr.ph.split.us_crit_edge ], [ %66, %.lr.ph.split.us.preheader ]
  %134 = phi %struct.jpeg_source_mgr* [ %187, %..lr.ph.split.us_crit_edge ], [ %67, %.lr.ph.split.us.preheader ]
  %135 = phi i64* [ %188, %..lr.ph.split.us_crit_edge ], [ %73, %.lr.ph.split.us.preheader ]
  %136 = phi %struct.jpeg_source_mgr* [ %189, %..lr.ph.split.us_crit_edge ], [ %91, %.lr.ph.split.us.preheader ]
  %137 = phi i8* [ %193, %..lr.ph.split.us_crit_edge ], [ %93, %.lr.ph.split.us.preheader ]
  %138 = icmp eq i64 %131, 0
  br i1 %138, label %139, label %154

; <label>:139:                                    ; preds = %.lr.ph.split.us
  %140 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %134, i64 0, i32 3
  %141 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %140, align 8
  %142 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %143 = tail call i32 %141(%struct.jpeg_decompress_struct* %142) #4
  %144 = icmp eq i32 %143, 0
  br i1 %144, label %.loopexit91.loopexit178, label %145

; <label>:145:                                    ; preds = %139
  %146 = bitcast %struct.jpeg_source_mgr** %6 to i8***
  %147 = load i8**, i8*** %146, align 8
  %148 = load i8*, i8** %147, align 8
  %149 = getelementptr inbounds i8*, i8** %147, i64 1
  %150 = bitcast i8** %149 to i64*
  %151 = load i64, i64* %150, align 8
  store i64 %151, i64* %7, align 8
  %152 = bitcast i8** %147 to %struct.jpeg_source_mgr*
  %153 = bitcast i8** %147 to i64*
  br label %154

; <label>:154:                                    ; preds = %145, %.lr.ph.split.us
  %155 = phi %struct.jpeg_source_mgr* [ %152, %145 ], [ %132, %.lr.ph.split.us ]
  %156 = phi %struct.jpeg_source_mgr* [ %152, %145 ], [ %133, %.lr.ph.split.us ]
  %157 = phi i64 [ %151, %145 ], [ %131, %.lr.ph.split.us ]
  %158 = phi %struct.jpeg_source_mgr* [ %152, %145 ], [ %134, %.lr.ph.split.us ]
  %159 = phi i64* [ %153, %145 ], [ %135, %.lr.ph.split.us ]
  %160 = phi %struct.jpeg_source_mgr* [ %152, %145 ], [ %136, %.lr.ph.split.us ]
  %161 = phi i8* [ %148, %145 ], [ %137, %.lr.ph.split.us ]
  %162 = add i64 %157, -1
  store i64 %162, i64* %7, align 8
  %163 = getelementptr inbounds i8, i8* %161, i64 1
  %164 = load i8, i8* %161, align 1
  %165 = zext i8 %164 to i16
  %166 = shl nuw i16 %165, 8
  %167 = icmp eq i64 %162, 0
  br i1 %167, label %168, label %183

; <label>:168:                                    ; preds = %154
  %169 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %156, i64 0, i32 3
  %170 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %169, align 8
  %171 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %172 = tail call i32 %170(%struct.jpeg_decompress_struct* %171) #4
  %173 = icmp eq i32 %172, 0
  br i1 %173, label %.loopexit91.loopexit178, label %174

; <label>:174:                                    ; preds = %168
  %175 = bitcast %struct.jpeg_source_mgr** %6 to i8***
  %176 = load i8**, i8*** %175, align 8
  %177 = load i8*, i8** %176, align 8
  %178 = getelementptr inbounds i8*, i8** %176, i64 1
  %179 = bitcast i8** %178 to i64*
  %180 = load i64, i64* %179, align 8
  store i64 %180, i64* %7, align 8
  %181 = bitcast i8** %176 to %struct.jpeg_source_mgr*
  %182 = bitcast i8** %176 to i64*
  br label %183

; <label>:183:                                    ; preds = %174, %154
  %184 = phi %struct.jpeg_source_mgr* [ %181, %174 ], [ %155, %154 ]
  %185 = phi i64 [ %180, %174 ], [ %162, %154 ]
  %186 = phi %struct.jpeg_source_mgr* [ %181, %174 ], [ %156, %154 ]
  %187 = phi %struct.jpeg_source_mgr* [ %181, %174 ], [ %158, %154 ]
  %188 = phi i64* [ %182, %174 ], [ %159, %154 ]
  %189 = phi %struct.jpeg_source_mgr* [ %181, %174 ], [ %160, %154 ]
  %190 = phi i8* [ %177, %174 ], [ %163, %154 ]
  %191 = inttoptr i64 %129 to [64 x i16]*
  %192 = add i64 %185, -1
  store i64 %192, i64* %7, align 8
  %193 = getelementptr inbounds i8, i8* %190, i64 1
  %194 = load i8, i8* %190, align 1
  %195 = zext i8 %194 to i16
  %196 = or i16 %166, %195
  %197 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv
  %198 = load i32, i32* %197, align 4
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds [64 x i16], [64 x i16]* %191, i64 0, i64 %199
  store i16 %196, i16* %200, align 2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %201 = icmp slt i64 %indvars.iv.next, 64
  br i1 %201, label %..lr.ph.split.us_crit_edge, label %.loopexit89.loopexit179

..lr.ph.split.us_crit_edge:                       ; preds = %183
  %.pre148 = load i64, i64* %7, align 8
  br label %.lr.ph.split.us

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader, %..lr.ph.split_crit_edge
  %202 = phi i64 [ %.pre149, %..lr.ph.split_crit_edge ], [ %92, %.lr.ph.split.preheader ]
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %..lr.ph.split_crit_edge ], [ 0, %.lr.ph.split.preheader ]
  %203 = phi %struct.jpeg_source_mgr* [ %227, %..lr.ph.split_crit_edge ], [ %65, %.lr.ph.split.preheader ]
  %204 = phi %struct.jpeg_source_mgr* [ %228, %..lr.ph.split_crit_edge ], [ %66, %.lr.ph.split.preheader ]
  %205 = phi %struct.jpeg_source_mgr* [ %229, %..lr.ph.split_crit_edge ], [ %67, %.lr.ph.split.preheader ]
  %206 = phi i64* [ %230, %..lr.ph.split_crit_edge ], [ %73, %.lr.ph.split.preheader ]
  %207 = phi %struct.jpeg_source_mgr* [ %231, %..lr.ph.split_crit_edge ], [ %91, %.lr.ph.split.preheader ]
  %208 = phi i8* [ %235, %..lr.ph.split_crit_edge ], [ %93, %.lr.ph.split.preheader ]
  %209 = icmp eq i64 %202, 0
  br i1 %209, label %210, label %225

; <label>:210:                                    ; preds = %.lr.ph.split
  %211 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %203, i64 0, i32 3
  %212 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %211, align 8
  %213 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %214 = tail call i32 %212(%struct.jpeg_decompress_struct* %213) #4
  %215 = icmp eq i32 %214, 0
  br i1 %215, label %.loopexit91.loopexit, label %216

; <label>:216:                                    ; preds = %210
  %217 = bitcast %struct.jpeg_source_mgr** %6 to i8***
  %218 = load i8**, i8*** %217, align 8
  %219 = load i8*, i8** %218, align 8
  %220 = getelementptr inbounds i8*, i8** %218, i64 1
  %221 = bitcast i8** %220 to i64*
  %222 = load i64, i64* %221, align 8
  store i64 %222, i64* %7, align 8
  %223 = bitcast i8** %218 to %struct.jpeg_source_mgr*
  %224 = bitcast i8** %218 to i64*
  br label %225

; <label>:225:                                    ; preds = %216, %.lr.ph.split
  %226 = phi i64 [ %222, %216 ], [ %202, %.lr.ph.split ]
  %227 = phi %struct.jpeg_source_mgr* [ %223, %216 ], [ %203, %.lr.ph.split ]
  %228 = phi %struct.jpeg_source_mgr* [ %223, %216 ], [ %204, %.lr.ph.split ]
  %229 = phi %struct.jpeg_source_mgr* [ %223, %216 ], [ %205, %.lr.ph.split ]
  %230 = phi i64* [ %224, %216 ], [ %206, %.lr.ph.split ]
  %231 = phi %struct.jpeg_source_mgr* [ %223, %216 ], [ %207, %.lr.ph.split ]
  %232 = phi i8* [ %219, %216 ], [ %208, %.lr.ph.split ]
  %233 = inttoptr i64 %129 to [64 x i16]*
  %234 = add i64 %226, -1
  store i64 %234, i64* %7, align 8
  %235 = getelementptr inbounds i8, i8* %232, i64 1
  %236 = load i8, i8* %232, align 1
  %237 = zext i8 %236 to i16
  %238 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv64
  %239 = load i32, i32* %238, align 4
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [64 x i16], [64 x i16]* %233, i64 0, i64 %240
  store i16 %237, i16* %241, align 2
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %242 = icmp slt i64 %indvars.iv.next65, 64
  br i1 %242, label %..lr.ph.split_crit_edge, label %.loopexit89.loopexit

..lr.ph.split_crit_edge:                          ; preds = %225
  %.pre149 = load i64, i64* %7, align 8
  br label %.lr.ph.split

.loopexit89.loopexit:                             ; preds = %225
  br label %.loopexit89

.loopexit89.loopexit179:                          ; preds = %183
  br label %.loopexit89

.loopexit89:                                      ; preds = %.loopexit89.loopexit179, %.loopexit89.loopexit
  %243 = phi %struct.jpeg_source_mgr* [ %227, %.loopexit89.loopexit ], [ %184, %.loopexit89.loopexit179 ]
  %244 = phi %struct.jpeg_source_mgr* [ %228, %.loopexit89.loopexit ], [ %186, %.loopexit89.loopexit179 ]
  %245 = phi %struct.jpeg_source_mgr* [ %229, %.loopexit89.loopexit ], [ %187, %.loopexit89.loopexit179 ]
  %246 = phi i64* [ %230, %.loopexit89.loopexit ], [ %188, %.loopexit89.loopexit179 ]
  %247 = phi %struct.jpeg_source_mgr* [ %231, %.loopexit89.loopexit ], [ %189, %.loopexit89.loopexit179 ]
  %.lcssa3 = phi i8* [ %235, %.loopexit89.loopexit ], [ %193, %.loopexit89.loopexit179 ]
  %248 = bitcast %struct.jpeg_decompress_struct** %2 to %struct.jpeg_error_mgr***
  %.pre38 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %248, align 8
  %249 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %.pre38, align 8
  %250 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %249, i64 0, i32 7
  %251 = load i32, i32* %250, align 4
  %252 = icmp sgt i32 %251, 1
  br i1 %252, label %.lr.ph17, label %.loopexit89..loopexit_crit_edge

.loopexit89..loopexit_crit_edge:                  ; preds = %.loopexit89
  %.pre151 = bitcast %struct.jpeg_error_mgr** %.pre38 to %struct.jpeg_common_struct*
  br label %.loopexit

.lr.ph17:                                         ; preds = %.loopexit89
  %253 = bitcast %struct.JQUANT_TBL** %5 to [64 x i16]**
  %254 = load [64 x i16]*, [64 x i16]** %253, align 8
  br label %255

; <label>:255:                                    ; preds = %._crit_edge, %.lr.ph17
  %256 = phi %struct.jpeg_error_mgr* [ %249, %.lr.ph17 ], [ %.pre150, %._crit_edge ]
  %indvars.iv66 = phi i64 [ 0, %.lr.ph17 ], [ %indvars.iv.next67, %._crit_edge ]
  %257 = bitcast %struct.jpeg_error_mgr** %.pre38 to %struct.jpeg_common_struct*
  %258 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %256, i64 0, i32 6, i32 0, i64 0
  %259 = getelementptr inbounds [64 x i16], [64 x i16]* %254, i64 0, i64 %indvars.iv66
  %260 = load i16, i16* %259, align 2
  %261 = zext i16 %260 to i32
  store i32 %261, i32* %258, align 4
  %262 = or i64 %indvars.iv66, 1
  %263 = getelementptr inbounds [64 x i16], [64 x i16]* %254, i64 0, i64 %262
  %264 = load i16, i16* %263, align 2
  %265 = zext i16 %264 to i32
  %266 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %256, i64 0, i32 6, i32 0, i64 1
  store i32 %265, i32* %266, align 4
  %267 = or i64 %indvars.iv66, 2
  %268 = getelementptr inbounds [64 x i16], [64 x i16]* %254, i64 0, i64 %267
  %269 = load i16, i16* %268, align 2
  %270 = zext i16 %269 to i32
  %271 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %256, i64 0, i32 6, i32 0, i64 2
  store i32 %270, i32* %271, align 4
  %272 = or i64 %indvars.iv66, 3
  %273 = getelementptr inbounds [64 x i16], [64 x i16]* %254, i64 0, i64 %272
  %274 = load i16, i16* %273, align 2
  %275 = zext i16 %274 to i32
  %276 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %256, i64 0, i32 6, i32 0, i64 3
  store i32 %275, i32* %276, align 4
  %277 = or i64 %indvars.iv66, 4
  %278 = getelementptr inbounds [64 x i16], [64 x i16]* %254, i64 0, i64 %277
  %279 = load i16, i16* %278, align 2
  %280 = zext i16 %279 to i32
  %281 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %256, i64 0, i32 6, i32 0, i64 4
  store i32 %280, i32* %281, align 4
  %282 = or i64 %indvars.iv66, 5
  %283 = getelementptr inbounds [64 x i16], [64 x i16]* %254, i64 0, i64 %282
  %284 = load i16, i16* %283, align 2
  %285 = zext i16 %284 to i32
  %286 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %256, i64 0, i32 6, i32 0, i64 5
  store i32 %285, i32* %286, align 4
  %287 = or i64 %indvars.iv66, 6
  %288 = getelementptr inbounds [64 x i16], [64 x i16]* %254, i64 0, i64 %287
  %289 = load i16, i16* %288, align 2
  %290 = zext i16 %289 to i32
  %291 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %256, i64 0, i32 6, i32 0, i64 6
  store i32 %290, i32* %291, align 4
  %292 = or i64 %indvars.iv66, 7
  %293 = getelementptr inbounds [64 x i16], [64 x i16]* %254, i64 0, i64 %292
  %294 = load i16, i16* %293, align 2
  %295 = zext i16 %294 to i32
  %296 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %256, i64 0, i32 6, i32 0, i64 7
  store i32 %295, i32* %296, align 4
  %297 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %.pre38, align 8
  %298 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %297, i64 0, i32 5
  store i32 92, i32* %298, align 8
  %299 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %.pre38, align 8
  %300 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %299, i64 0, i32 1
  %301 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %300, align 8
  tail call void %301(%struct.jpeg_common_struct* %257, i32 2) #4
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 8
  %302 = icmp slt i64 %indvars.iv.next67, 64
  br i1 %302, label %._crit_edge, label %.loopexit.loopexit

._crit_edge:                                      ; preds = %255
  %.pre150 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %.pre38, align 8
  br label %255

.loopexit.loopexit:                               ; preds = %255
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.loopexit89..loopexit_crit_edge
  %.pre-phi = phi %struct.jpeg_common_struct* [ %.pre151, %.loopexit89..loopexit_crit_edge ], [ %257, %.loopexit.loopexit ]
  %303 = load i64, i64* %3, align 8
  %304 = add nsw i64 %303, -65
  store i64 %304, i64* %3, align 8
  %305 = load i32, i32* %4, align 4
  %306 = icmp eq i32 %305, 0
  br i1 %306, label %.backedge, label %307

; <label>:307:                                    ; preds = %.loopexit
  %308 = add nsw i64 %303, -129
  store i64 %308, i64* %3, align 8
  br label %.backedge

.backedge:                                        ; preds = %.loopexit, %307
  %309 = phi i64 [ %304, %.loopexit ], [ %308, %307 ]
  %310 = icmp sgt i64 %309, 0
  br i1 %310, label %.backedge..lr.ph23_crit_edge, label %.backedge.._crit_edge24_crit_edge

.backedge.._crit_edge24_crit_edge:                ; preds = %.backedge
  %.phi.trans.insert = bitcast %struct.jpeg_source_mgr** %6 to i64**
  %.pre41 = load i64*, i64** %.phi.trans.insert, align 8
  br label %._crit_edge24

.backedge..lr.ph23_crit_edge:                     ; preds = %.backedge
  %311 = bitcast %struct.jpeg_error_mgr** %.pre38 to void (%struct.jpeg_common_struct*)***
  %312 = bitcast %struct.jpeg_error_mgr** %.pre38 to %struct.jpeg_decompress_struct*
  %.pre = load i64, i64* %7, align 8
  br label %.lr.ph23

._crit_edge24:                                    ; preds = %49, %.backedge.._crit_edge24_crit_edge
  %313 = phi i64* [ %.pre41, %.backedge.._crit_edge24_crit_edge ], [ %52, %49 ]
  %.in152 = phi i8* [ %.lcssa3, %.backedge.._crit_edge24_crit_edge ], [ %54, %49 ]
  %314 = ptrtoint i8* %.in152 to i64
  store i64 %314, i64* %313, align 8
  %315 = load i64, i64* %7, align 8
  %316 = getelementptr inbounds i64, i64* %313, i64 1
  store i64 %315, i64* %316, align 8
  br label %.loopexit91

.loopexit91.loopexit:                             ; preds = %210
  br label %.loopexit91

.loopexit91.loopexit178:                          ; preds = %139, %168
  br label %.loopexit91

.loopexit91.loopexit180:                          ; preds = %77
  br label %.loopexit91

.loopexit91:                                      ; preds = %.loopexit91.loopexit180, %.loopexit91.loopexit178, %.loopexit91.loopexit, %37, %17, %._crit_edge24
  %317 = phi i32 [ 1, %._crit_edge24 ], [ 0, %17 ], [ 0, %37 ], [ 0, %.loopexit91.loopexit ], [ 0, %.loopexit91.loopexit178 ], [ 0, %.loopexit91.loopexit180 ]
  ret i32 %317
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @get_dri(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = alloca i64, align 8
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %4 = bitcast %struct.jpeg_source_mgr** %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = inttoptr i64 %5 to i8**
  %7 = load i8*, i8** %6, align 8
  %.cast = inttoptr i64 %5 to %struct.jpeg_source_mgr*
  %8 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %.cast, i64 0, i32 1
  %9 = load i64, i64* %8, align 8
  store i64 %9, i64* %2, align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %11, label %23

; <label>:11:                                     ; preds = %1
  %12 = inttoptr i64 %5 to %struct.jpeg_source_mgr*
  %13 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %12, i64 0, i32 3
  %14 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %13, align 8
  %15 = tail call i32 %14(%struct.jpeg_decompress_struct* nonnull %0) #4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %115, label %17

; <label>:17:                                     ; preds = %11
  %18 = inttoptr i64 %5 to i8**
  %19 = inttoptr i64 %5 to i64*
  %20 = load i8*, i8** %18, align 8
  %21 = getelementptr inbounds i64, i64* %19, i64 1
  %22 = load i64, i64* %21, align 8
  store i64 %22, i64* %2, align 8
  br label %23

; <label>:23:                                     ; preds = %17, %1
  %24 = phi i8* [ %20, %17 ], [ %7, %1 ]
  %25 = phi i64 [ %22, %17 ], [ %9, %1 ]
  %26 = add i64 %25, -1
  store i64 %26, i64* %2, align 8
  %27 = getelementptr inbounds i8, i8* %24, i64 1
  %28 = load i8, i8* %24, align 1
  %29 = zext i8 %28 to i64
  %30 = shl nuw nsw i64 %29, 8
  %31 = icmp eq i64 %26, 0
  br i1 %31, label %32, label %44

; <label>:32:                                     ; preds = %23
  %33 = inttoptr i64 %5 to %struct.jpeg_source_mgr*
  %34 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %33, i64 0, i32 3
  %35 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %34, align 8
  %36 = tail call i32 %35(%struct.jpeg_decompress_struct* nonnull %0) #4
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %115, label %38

; <label>:38:                                     ; preds = %32
  %39 = inttoptr i64 %5 to i8**
  %40 = inttoptr i64 %5 to i64*
  %41 = load i8*, i8** %39, align 8
  %42 = getelementptr inbounds i64, i64* %40, i64 1
  %43 = load i64, i64* %42, align 8
  store i64 %43, i64* %2, align 8
  br label %44

; <label>:44:                                     ; preds = %23, %38
  %45 = phi i8* [ %27, %23 ], [ %41, %38 ]
  %46 = phi i64 [ %26, %23 ], [ %43, %38 ]
  %47 = add i64 %46, -1
  store i64 %47, i64* %2, align 8
  %48 = getelementptr inbounds i8, i8* %45, i64 1
  %49 = load i8, i8* %45, align 1
  %50 = zext i8 %49 to i64
  %51 = or i64 %30, %50
  %52 = icmp eq i64 %51, 4
  br i1 %52, label %61, label %53

; <label>:53:                                     ; preds = %44
  %54 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %55 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %56 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %55, align 8
  %57 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %56, i64 0, i32 5
  store i32 9, i32* %57, align 8
  %58 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %59 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %58, align 8
  %60 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %59, align 8
  tail call void %60(%struct.jpeg_common_struct* %54) #4
  br label %61

; <label>:61:                                     ; preds = %44, %53
  %62 = icmp eq i64 %47, 0
  br i1 %62, label %63, label %75

; <label>:63:                                     ; preds = %61
  %64 = inttoptr i64 %5 to %struct.jpeg_source_mgr*
  %65 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %64, i64 0, i32 3
  %66 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %65, align 8
  %67 = tail call i32 %66(%struct.jpeg_decompress_struct* nonnull %0) #4
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %115, label %69

; <label>:69:                                     ; preds = %63
  %70 = inttoptr i64 %5 to i8**
  %71 = inttoptr i64 %5 to i64*
  %72 = load i8*, i8** %70, align 8
  %73 = getelementptr inbounds i64, i64* %71, i64 1
  %74 = load i64, i64* %73, align 8
  store i64 %74, i64* %2, align 8
  br label %75

; <label>:75:                                     ; preds = %69, %61
  %76 = phi i8* [ %72, %69 ], [ %48, %61 ]
  %77 = phi i64 [ %74, %69 ], [ %47, %61 ]
  %78 = add i64 %77, -1
  store i64 %78, i64* %2, align 8
  %79 = load i8, i8* %76, align 1
  %80 = zext i8 %79 to i32
  %81 = shl nuw nsw i32 %80, 8
  %82 = icmp eq i64 %78, 0
  br i1 %82, label %84, label %._crit_edge

._crit_edge:                                      ; preds = %75
  %83 = getelementptr inbounds i8, i8* %76, i64 1
  br label %96

; <label>:84:                                     ; preds = %75
  %85 = inttoptr i64 %5 to %struct.jpeg_source_mgr*
  %86 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %85, i64 0, i32 3
  %87 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %86, align 8
  %88 = tail call i32 %87(%struct.jpeg_decompress_struct* nonnull %0) #4
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %115, label %90

; <label>:90:                                     ; preds = %84
  %91 = inttoptr i64 %5 to i8**
  %92 = inttoptr i64 %5 to i64*
  %93 = load i8*, i8** %91, align 8
  %94 = getelementptr inbounds i64, i64* %92, i64 1
  %95 = load i64, i64* %94, align 8
  store i64 %95, i64* %2, align 8
  br label %96

; <label>:96:                                     ; preds = %._crit_edge, %90
  %97 = phi i8* [ %83, %._crit_edge ], [ %93, %90 ]
  %98 = phi i64 [ %78, %._crit_edge ], [ %95, %90 ]
  %99 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_error_mgr**
  %100 = add i64 %98, -1
  store i64 %100, i64* %2, align 8
  %101 = getelementptr inbounds i8, i8* %97, i64 1
  %102 = load i8, i8* %97, align 1
  %103 = zext i8 %102 to i32
  %104 = or i32 %81, %103
  %105 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %99, align 8
  %106 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %105, i64 0, i32 5
  store i32 81, i32* %106, align 8
  %107 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %99, align 8
  %108 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %107, i64 0, i32 6, i32 0, i64 0
  store i32 %104, i32* %108, align 4
  %109 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %99, align 8
  %110 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %109, i64 0, i32 1
  %111 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %110, align 8
  %.cast1 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %111(%struct.jpeg_common_struct* %.cast1, i32 1) #4
  %112 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 49
  store i32 %104, i32* %112, align 8
  %113 = ptrtoint i8* %101 to i64
  %sunkaddr10 = inttoptr i64 %5 to i64*
  store i64 %113, i64* %sunkaddr10, align 8
  %114 = load i64, i64* %2, align 8
  %sunkaddr = add i64 %5, 8
  %sunkaddr9 = inttoptr i64 %sunkaddr to i64*
  store i64 %114, i64* %sunkaddr9, align 8
  br label %115

; <label>:115:                                    ; preds = %84, %63, %32, %11, %96
  %116 = phi i32 [ 1, %96 ], [ 0, %11 ], [ 0, %32 ], [ 0, %63 ], [ 0, %84 ]
  ret i32 %116
}

declare %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct*) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

declare %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct*) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
