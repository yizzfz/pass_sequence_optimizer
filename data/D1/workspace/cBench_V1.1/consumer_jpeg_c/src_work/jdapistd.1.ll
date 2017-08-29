; ModuleID = 'jdapistd.ll'
source_filename = "jdapistd.c"
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
%struct.jpeg_source_mgr = type { i8*, i64, void (%struct.jpeg_decompress_struct*)*, {}*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*)* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.jpeg_decomp_master = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32 }
%struct.jpeg_d_main_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* }
%struct.jpeg_d_coef_controller = type { void (%struct.jpeg_decompress_struct*)*, {}*, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, i8***)*, %struct.jvirt_barray_control** }
%struct.jpeg_d_post_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* }
%struct.jpeg_input_controller = type { {}*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32, i32 }
%struct.jpeg_marker_reader = type { void (%struct.jpeg_decompress_struct*)*, {}*, {}*, {}*, [16 x {}*], i32, i32, i32, i32 }
%struct.jpeg_entropy_decoder = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* }
%struct.jpeg_inverse_dct = type { void (%struct.jpeg_decompress_struct*)*, [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*] }
%struct.jpeg_upsampler = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, i32 }
%struct.jpeg_color_deconverter = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* }
%struct.jpeg_color_quantizer = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)* }

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_start_decompress(%struct.jpeg_decompress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 4
  switch i32 %3, label %45 [
    i32 202, label %4
    i32 203, label %9
    i32 204, label %56
  ]

; <label>:4:                                      ; preds = %1
  tail call void @jinit_master_decompress(%struct.jpeg_decompress_struct* nonnull %0) #2
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 14
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %6, 0
  %sunkaddr40 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr41 = add i64 %sunkaddr40, 28
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to i32*
  br i1 %7, label %.thread, label %8

; <label>:8:                                      ; preds = %4
  store i32 207, i32* %sunkaddr42, align 4
  br label %.loopexit

.thread:                                          ; preds = %4
  store i32 203, i32* %sunkaddr42, align 4
  br label %9

; <label>:9:                                      ; preds = %1, %.thread
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %11 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %11, i64 0, i32 4
  %13 = load i32, i32* %12, align 8
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %.loopexit1, label %.backedgethread-pre-split.preheader

.backedgethread-pre-split.preheader:              ; preds = %9
  %sunkaddr43 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr44 = add i64 %sunkaddr43, 16
  %sunkaddr45 = inttoptr i64 %sunkaddr44 to %struct.jpeg_progress_mgr**
  %sunkaddr49 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr50 = add i64 %sunkaddr49, 560
  %sunkaddr51 = inttoptr i64 %sunkaddr50 to i32 (%struct.jpeg_decompress_struct*)***
  %sunkaddr52 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr53 = add i64 %sunkaddr52, 16
  %sunkaddr54 = inttoptr i64 %sunkaddr53 to %struct.jpeg_progress_mgr**
  %sunkaddr55 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr56 = add i64 %sunkaddr55, 16
  %sunkaddr57 = inttoptr i64 %sunkaddr56 to %struct.jpeg_progress_mgr**
  %15 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr46 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr47 = add i64 %sunkaddr46, 16
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to void (%struct.jpeg_common_struct*)***
  %sunkaddr58 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr59 = add i64 %sunkaddr58, 400
  %sunkaddr60 = inttoptr i64 %sunkaddr59 to i32*
  br label %.backedgethread-pre-split

.backedgethread-pre-split.loopexit:               ; preds = %28
  br label %.backedgethread-pre-split.backedge

.backedgethread-pre-split:                        ; preds = %.backedgethread-pre-split.backedge, %.backedgethread-pre-split.preheader
  %.pr = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr45, align 8
  br label %.backedge

.backedge:                                        ; preds = %.backedge.backedge, %.backedgethread-pre-split
  %16 = phi %struct.jpeg_progress_mgr* [ %.pr, %.backedgethread-pre-split ], [ %.be, %.backedge.backedge ]
  %17 = icmp eq %struct.jpeg_progress_mgr* %16, null
  br i1 %17, label %21, label %18

; <label>:18:                                     ; preds = %.backedge
  %19 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %sunkaddr48, align 8
  %20 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %19, align 8
  tail call void %20(%struct.jpeg_common_struct* nonnull %15) #2
  br label %21

; <label>:21:                                     ; preds = %.backedge, %18
  %22 = load i32 (%struct.jpeg_decompress_struct*)**, i32 (%struct.jpeg_decompress_struct*)*** %sunkaddr51, align 8
  %23 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %22, align 8
  %24 = tail call i32 %23(%struct.jpeg_decompress_struct* nonnull %0) #2
  switch i32 %24, label %25 [
    i32 0, label %.loopexit.loopexit
    i32 2, label %.loopexit1.loopexit
  ]

; <label>:25:                                     ; preds = %21
  %26 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr54, align 8
  %27 = icmp eq %struct.jpeg_progress_mgr* %26, null
  br i1 %27, label %.backedge.backedge, label %28

.backedge.backedge:                               ; preds = %25, %29
  %.be = phi %struct.jpeg_progress_mgr* [ null, %25 ], [ %34, %29 ]
  br label %.backedge

; <label>:28:                                     ; preds = %25
  switch i32 %24, label %.backedgethread-pre-split.loopexit [
    i32 3, label %29
    i32 1, label %29
  ]

; <label>:29:                                     ; preds = %28, %28
  %30 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr57, align 8
  %31 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %30, i64 0, i32 1
  %32 = load i64, i64* %31, align 8
  %33 = add nsw i64 %32, 1
  store i64 %33, i64* %31, align 8
  %34 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr57, align 8
  %35 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %34, i64 0, i32 2
  %36 = load i64, i64* %35, align 8
  %37 = icmp slt i64 %33, %36
  br i1 %37, label %.backedge.backedge, label %38

; <label>:38:                                     ; preds = %29
  %39 = load i32, i32* %sunkaddr60, align 8
  %40 = zext i32 %39 to i64
  %41 = add nsw i64 %40, %36
  %sunkaddr25 = ptrtoint %struct.jpeg_progress_mgr* %34 to i64
  %sunkaddr26 = add i64 %sunkaddr25, 16
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to i64*
  store i64 %41, i64* %sunkaddr27, align 8
  br label %.backedgethread-pre-split.backedge

.backedgethread-pre-split.backedge:               ; preds = %38, %.backedgethread-pre-split.loopexit
  br label %.backedgethread-pre-split

.loopexit1.loopexit:                              ; preds = %21
  br label %.loopexit1

.loopexit1:                                       ; preds = %.loopexit1.loopexit, %9
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 34
  %43 = load i32, i32* %42, align 4
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 36
  store i32 %43, i32* %44, align 4
  br label %56

; <label>:45:                                     ; preds = %1
  %46 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %47 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i64 0, i32 5
  store i32 18, i32* %48, align 8
  %sunkaddr28 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr29 = add i64 %sunkaddr28, 28
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i32*
  %49 = load i32, i32* %sunkaddr30, align 4
  %50 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %51 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %50, i64 0, i32 6, i32 0, i64 0
  store i32 %49, i32* %51, align 4
  %52 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %53 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %52, align 8
  %54 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %53, align 8
  %55 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %54(%struct.jpeg_common_struct* %55) #2
  br label %56

; <label>:56:                                     ; preds = %1, %45, %.loopexit1
  %57 = tail call fastcc i32 @output_pass_setup(%struct.jpeg_decompress_struct* nonnull %0)
  ret i32 %57

.loopexit.loopexit:                               ; preds = %21
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %8
  %.0 = phi i32 [ 1, %8 ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

declare void @jinit_master_decompress(%struct.jpeg_decompress_struct*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @output_pass_setup(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 204
  br i1 %4, label %.preheader1, label %5

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 73
  %7 = bitcast %struct.jpeg_decomp_master** %6 to void (%struct.jpeg_decompress_struct*)***
  %8 = load void (%struct.jpeg_decompress_struct*)**, void (%struct.jpeg_decompress_struct*)*** %7, align 8
  %9 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %8, align 8
  tail call void %9(%struct.jpeg_decompress_struct* nonnull %0) #2
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 33
  store i32 0, i32* %10, align 8
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr3 = add i64 %sunkaddr, 28
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to i32*
  store i32 204, i32* %sunkaddr4, align 4
  br label %.preheader1

.preheader1:                                      ; preds = %1, %5
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 73
  %12 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %12, i64 0, i32 2
  %14 = load i32, i32* %13, align 8
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %._crit_edge, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader1
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 33
  %sunkaddr41 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr42 = add i64 %sunkaddr41, 160
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to i32*
  %sunkaddr44 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr45 = add i64 %sunkaddr44, 132
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to i32*
  %sunkaddr71 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr72 = add i64 %sunkaddr71, 528
  %sunkaddr73 = inttoptr i64 %sunkaddr72 to %struct.jpeg_decomp_master**
  %sunkaddr74 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr75 = add i64 %sunkaddr74, 528
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to void (%struct.jpeg_decompress_struct*)***
  %sunkaddr77 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr78 = add i64 %sunkaddr77, 160
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to i32*
  %sunkaddr53 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr54 = add i64 %sunkaddr53, 16
  %sunkaddr55 = inttoptr i64 %sunkaddr54 to %struct.jpeg_progress_mgr**
  %sunkaddr65 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr66 = add i64 %sunkaddr65, 160
  %sunkaddr67 = inttoptr i64 %sunkaddr66 to i32*
  %sunkaddr68 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr69 = add i64 %sunkaddr68, 536
  %sunkaddr70 = inttoptr i64 %sunkaddr69 to %struct.jpeg_d_main_controller**
  %sunkaddr47 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr48 = add i64 %sunkaddr47, 160
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to i32*
  %sunkaddr50 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr51 = add i64 %sunkaddr50, 132
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to i32*
  %17 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr56 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr57 = add i64 %sunkaddr56, 132
  %sunkaddr58 = inttoptr i64 %sunkaddr57 to i32*
  %sunkaddr59 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr60 = add i64 %sunkaddr59, 16
  %sunkaddr61 = inttoptr i64 %sunkaddr60 to %struct.jpeg_progress_mgr**
  %sunkaddr62 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr63 = add i64 %sunkaddr62, 16
  %sunkaddr64 = inttoptr i64 %sunkaddr63 to void (%struct.jpeg_common_struct*)***
  br label %.preheader

.preheader:                                       ; preds = %.loopexit80, %.preheader.lr.ph
  %18 = load i32, i32* %sunkaddr43, align 8
  %19 = load i32, i32* %sunkaddr46, align 4
  %20 = icmp ult i32 %18, %19
  br i1 %20, label %.lr.ph.preheader, label %.loopexit80

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

; <label>:21:                                     ; preds = %36
  %22 = load i32, i32* %sunkaddr49, align 8
  %23 = load i32, i32* %sunkaddr52, align 4
  %24 = icmp ult i32 %22, %23
  br i1 %24, label %.lr.ph, label %.loopexit80.loopexit

.lr.ph:                                           ; preds = %.lr.ph.preheader, %21
  %.in = phi i32 [ %22, %21 ], [ %18, %.lr.ph.preheader ]
  %25 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr55, align 8
  %26 = icmp eq %struct.jpeg_progress_mgr* %25, null
  br i1 %26, label %36, label %27

; <label>:27:                                     ; preds = %.lr.ph
  %28 = zext i32 %.in to i64
  %29 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %25, i64 0, i32 1
  store i64 %28, i64* %29, align 8
  %30 = load i32, i32* %sunkaddr58, align 4
  %31 = zext i32 %30 to i64
  %32 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr61, align 8
  %33 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %32, i64 0, i32 2
  store i64 %31, i64* %33, align 8
  %34 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %sunkaddr64, align 8
  %35 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %34, align 8
  tail call void %35(%struct.jpeg_common_struct* nonnull %17) #2
  br label %36

; <label>:36:                                     ; preds = %.lr.ph, %27
  %37 = load i32, i32* %sunkaddr67, align 8
  %38 = load %struct.jpeg_d_main_controller*, %struct.jpeg_d_main_controller** %sunkaddr70, align 8
  %39 = getelementptr inbounds %struct.jpeg_d_main_controller, %struct.jpeg_d_main_controller* %38, i64 0, i32 1
  %40 = load void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)** %39, align 8
  tail call void %40(%struct.jpeg_decompress_struct* nonnull %0, i8** null, i32* nonnull %16, i32 0) #2
  %41 = load i32, i32* %sunkaddr67, align 8
  %42 = icmp eq i32 %41, %37
  br i1 %42, label %.loopexit.loopexit, label %21

.loopexit80.loopexit:                             ; preds = %21
  br label %.loopexit80

.loopexit80:                                      ; preds = %.loopexit80.loopexit, %.preheader
  %43 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %sunkaddr73, align 8
  %44 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %43, i64 0, i32 1
  %45 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %44, align 8
  tail call void %45(%struct.jpeg_decompress_struct* nonnull %0) #2
  %46 = load void (%struct.jpeg_decompress_struct*)**, void (%struct.jpeg_decompress_struct*)*** %sunkaddr76, align 8
  %47 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %46, align 8
  tail call void %47(%struct.jpeg_decompress_struct* nonnull %0) #2
  store i32 0, i32* %sunkaddr79, align 8
  %48 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %sunkaddr73, align 8
  %49 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %48, i64 0, i32 2
  %50 = load i32, i32* %49, align 8
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %._crit_edge.loopexit, label %.preheader

._crit_edge.loopexit:                             ; preds = %.loopexit80
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader1
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 15
  %53 = load i32, i32* %52, align 4
  %54 = icmp ne i32 %53, 0
  %55 = select i1 %54, i32 206, i32 205
  %sunkaddr32 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr33 = add i64 %sunkaddr32, 28
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i32*
  store i32 %55, i32* %sunkaddr34, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %36
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge
  %.0 = phi i32 [ 1, %._crit_edge ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_read_scanlines(%struct.jpeg_decompress_struct*, i8**, i32) local_unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 205
  br i1 %7, label %19, label %8

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 5
  store i32 18, i32* %11, align 8
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr1 = add i64 %sunkaddr, 28
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  %12 = load i32, i32* %sunkaddr2, align 4
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i64 0, i32 6, i32 0, i64 0
  store i32 %12, i32* %14, align 4
  %15 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %16 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %15, align 8
  %17 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %16, align 8
  %18 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %17(%struct.jpeg_common_struct* %18) #2
  br label %19

; <label>:19:                                     ; preds = %3, %8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 33
  %21 = load i32, i32* %20, align 8
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  %24 = load i32, i32* %23, align 4
  %25 = icmp ult i32 %21, %24
  br i1 %25, label %34, label %26

; <label>:26:                                     ; preds = %19
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %28 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %27, align 8
  %29 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %28, i64 0, i32 5
  store i32 119, i32* %29, align 8
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %27, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i64 0, i32 1
  %32 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %31, align 8
  %33 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %32(%struct.jpeg_common_struct* %33, i32 -1) #2
  br label %55

; <label>:34:                                     ; preds = %19
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 2
  %36 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %35, align 8
  %37 = icmp eq %struct.jpeg_progress_mgr* %36, null
  br i1 %37, label %47, label %38

; <label>:38:                                     ; preds = %34
  %39 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %36, i64 0, i32 1
  store i64 %22, i64* %39, align 8
  %sunkaddr3 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 132
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  %40 = load i32, i32* %sunkaddr5, align 4
  %41 = zext i32 %40 to i64
  %sunkaddr6 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 16
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to %struct.jpeg_progress_mgr**
  %42 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr8, align 8
  %43 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %42, i64 0, i32 2
  store i64 %41, i64* %43, align 8
  %sunkaddr9 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 16
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to void (%struct.jpeg_common_struct*)***
  %44 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %sunkaddr11, align 8
  %45 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %44, align 8
  %46 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %45(%struct.jpeg_common_struct* %46) #2
  br label %47

; <label>:47:                                     ; preds = %34, %38
  store i32 0, i32* %4, align 4
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %49 = load %struct.jpeg_d_main_controller*, %struct.jpeg_d_main_controller** %48, align 8
  %50 = getelementptr inbounds %struct.jpeg_d_main_controller, %struct.jpeg_d_main_controller* %49, i64 0, i32 1
  %51 = load void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)** %50, align 8
  call void %51(%struct.jpeg_decompress_struct* nonnull %0, i8** %1, i32* nonnull %4, i32 %2) #2
  %52 = load i32, i32* %4, align 4
  %sunkaddr12 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 160
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to i32*
  %53 = load i32, i32* %sunkaddr14, align 8
  %54 = add i32 %53, %52
  store i32 %54, i32* %sunkaddr14, align 8
  br label %55

; <label>:55:                                     ; preds = %47, %26
  %.0 = phi i32 [ 0, %26 ], [ %52, %47 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_read_raw_data(%struct.jpeg_decompress_struct*, i8***, i32) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %5 = load i32, i32* %4, align 4
  %6 = icmp eq i32 %5, 206
  br i1 %6, label %18, label %7

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %9 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %9, i64 0, i32 5
  store i32 18, i32* %10, align 8
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr1 = add i64 %sunkaddr, 28
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  %11 = load i32, i32* %sunkaddr2, align 4
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 6, i32 0, i64 0
  store i32 %11, i32* %13, align 4
  %14 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %15 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %14, align 8
  %16 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %15, align 8
  %17 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %16(%struct.jpeg_common_struct* %17) #2
  br label %18

; <label>:18:                                     ; preds = %3, %7
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 33
  %20 = load i32, i32* %19, align 8
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  %23 = load i32, i32* %22, align 4
  %24 = icmp ult i32 %20, %23
  br i1 %24, label %33, label %25

; <label>:25:                                     ; preds = %18
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i64 0, i32 5
  store i32 119, i32* %28, align 8
  %29 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %30 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %29, i64 0, i32 1
  %31 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %30, align 8
  %32 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %31(%struct.jpeg_common_struct* %32, i32 -1) #2
  br label %71

; <label>:33:                                     ; preds = %18
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 2
  %35 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %34, align 8
  %36 = icmp eq %struct.jpeg_progress_mgr* %35, null
  br i1 %36, label %46, label %37

; <label>:37:                                     ; preds = %33
  %38 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %35, i64 0, i32 1
  store i64 %21, i64* %38, align 8
  %sunkaddr3 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 132
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  %39 = load i32, i32* %sunkaddr5, align 4
  %40 = zext i32 %39 to i64
  %sunkaddr6 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 16
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to %struct.jpeg_progress_mgr**
  %41 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr8, align 8
  %42 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %41, i64 0, i32 2
  store i64 %40, i64* %42, align 8
  %sunkaddr9 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 16
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to void (%struct.jpeg_common_struct*)***
  %43 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %sunkaddr11, align 8
  %44 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %43, align 8
  %45 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %44(%struct.jpeg_common_struct* %45) #2
  br label %46

; <label>:46:                                     ; preds = %33, %37
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %48 = load i32, i32* %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %50 = load i32, i32* %49, align 4
  %51 = mul nsw i32 %50, %48
  %52 = icmp ugt i32 %51, %2
  br i1 %52, label %53, label %61

; <label>:53:                                     ; preds = %46
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %55 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %56 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %55, i64 0, i32 5
  store i32 21, i32* %56, align 8
  %57 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %58 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %57, align 8
  %59 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %58, align 8
  %60 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %59(%struct.jpeg_common_struct* %60) #2
  br label %61

; <label>:61:                                     ; preds = %46, %53
  %62 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %63 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %62, align 8
  %64 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %63, i64 0, i32 3
  %65 = load i32 (%struct.jpeg_decompress_struct*, i8***)*, i32 (%struct.jpeg_decompress_struct*, i8***)** %64, align 8
  %66 = tail call i32 %65(%struct.jpeg_decompress_struct* nonnull %0, i8*** %1) #2
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %71, label %68

; <label>:68:                                     ; preds = %61
  %sunkaddr12 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 160
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to i32*
  %69 = load i32, i32* %sunkaddr14, align 8
  %70 = add i32 %69, %51
  store i32 %70, i32* %sunkaddr14, align 8
  br label %71

; <label>:71:                                     ; preds = %61, %68, %25
  %.0 = phi i32 [ 0, %25 ], [ %51, %68 ], [ 0, %61 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_start_output(%struct.jpeg_decompress_struct*, i32) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %4 = load i32, i32* %3, align 4
  switch i32 %4, label %5 [
    i32 207, label %16
    i32 204, label %16
  ]

; <label>:5:                                      ; preds = %2
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %7 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %7, i64 0, i32 5
  store i32 18, i32* %8, align 8
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr1 = add i64 %sunkaddr, 28
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  %9 = load i32, i32* %sunkaddr2, align 4
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 6, i32 0, i64 0
  store i32 %9, i32* %11, align 4
  %12 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %13 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %12, align 8
  %14 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %13, align 8
  %15 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %14(%struct.jpeg_common_struct* %15) #2
  br label %16

; <label>:16:                                     ; preds = %2, %2, %5
  %17 = icmp sgt i32 %1, 1
  %. = select i1 %17, i32 %1, i32 1
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %19 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %19, i64 0, i32 5
  %21 = load i32, i32* %20, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %27, label %23

; <label>:23:                                     ; preds = %16
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 34
  %25 = load i32, i32* %24, align 4
  %26 = icmp sgt i32 %., %25
  %.. = select i1 %26, i32 %25, i32 %.
  br label %27

; <label>:27:                                     ; preds = %16, %23
  %.1 = phi i32 [ %.., %23 ], [ %., %16 ]
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 36
  store i32 %.1, i32* %28, align 4
  %29 = tail call fastcc i32 @output_pass_setup(%struct.jpeg_decompress_struct* nonnull %0)
  ret i32 %29
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_finish_output(%struct.jpeg_decompress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 4
  %.off = add i32 %3, -205
  %switch = icmp ult i32 %.off, 2
  br i1 %switch, label %4, label %13

; <label>:4:                                      ; preds = %1
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 14
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %thread-pre-split, label %8

; <label>:8:                                      ; preds = %4
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 73
  %10 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %10, i64 0, i32 1
  %12 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %11, align 8
  tail call void %12(%struct.jpeg_decompress_struct* nonnull %0) #2
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr1 = add i64 %sunkaddr, 28
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  store i32 208, i32* %sunkaddr2, align 4
  br label %.preheader

thread-pre-split:                                 ; preds = %4
  %sunkaddr3 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 28
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  %.pr = load i32, i32* %sunkaddr5, align 4
  br label %13

; <label>:13:                                     ; preds = %1, %thread-pre-split
  %14 = phi i32 [ %.pr, %thread-pre-split ], [ %3, %1 ]
  %15 = icmp eq i32 %14, 208
  br i1 %15, label %.preheader, label %16

; <label>:16:                                     ; preds = %13
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i64 0, i32 5
  store i32 18, i32* %19, align 8
  %sunkaddr6 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 28
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i32*
  %20 = load i32, i32* %sunkaddr8, align 4
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i64 0, i32 6, i32 0, i64 0
  store i32 %20, i32* %22, align 4
  %23 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %24 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %23, align 8
  %25 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %24, align 8
  %26 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %25(%struct.jpeg_common_struct* %26) #2
  br label %.preheader

.preheader:                                       ; preds = %13, %16, %8
  %sunkaddr9 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 164
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i32*
  %sunkaddr12 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 172
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to i32*
  %27 = load i32, i32* %sunkaddr11, align 4
  %28 = load i32, i32* %sunkaddr14, align 4
  %29 = icmp sgt i32 %27, %28
  br i1 %29, label %.critedge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  %sunkaddr32 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr33 = add i64 %sunkaddr32, 560
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to %struct.jpeg_input_controller**
  %sunkaddr35 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr36 = add i64 %sunkaddr35, 560
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to i32 (%struct.jpeg_decompress_struct*)***
  %sunkaddr26 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr27 = add i64 %sunkaddr26, 164
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i32*
  %sunkaddr29 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr30 = add i64 %sunkaddr29, 172
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to i32*
  br label %.lr.ph

; <label>:30:                                     ; preds = %38
  %31 = load i32, i32* %sunkaddr28, align 4
  %32 = load i32, i32* %sunkaddr31, align 4
  %33 = icmp sgt i32 %31, %32
  br i1 %33, label %.critedge.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %30
  %34 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %sunkaddr34, align 8
  %35 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %34, i64 0, i32 5
  %36 = load i32, i32* %35, align 4
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %.critedge.loopexit

; <label>:38:                                     ; preds = %.lr.ph
  %39 = load i32 (%struct.jpeg_decompress_struct*)**, i32 (%struct.jpeg_decompress_struct*)*** %sunkaddr37, align 8
  %40 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %39, align 8
  %41 = tail call i32 %40(%struct.jpeg_decompress_struct* nonnull %0) #2
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %.loopexit.loopexit, label %30

.critedge.loopexit:                               ; preds = %30, %.lr.ph
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %.preheader
  %sunkaddr21 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr22 = add i64 %sunkaddr21, 28
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to i32*
  store i32 207, i32* %sunkaddr23, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %38
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.critedge
  %.0 = phi i32 [ 1, %.critedge ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
