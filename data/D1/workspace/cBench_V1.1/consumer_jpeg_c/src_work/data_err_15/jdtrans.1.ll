; ModuleID = 'jdtrans.ll'
source_filename = "jdtrans.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jvirt_barray_control = type opaque
%struct.jpeg_decompress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_source_mgr*, i32, i32, i32, i32, i32, i32, i32, double, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8**, i32, i32, i32, i32, i32, [64 x i32]*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], i32, %struct.jpeg_component_info*, i32, i32, [16 x i8], [16 x i8], [16 x i8], i32, i32, i8, i16, i16, i32, i8, i32, i32, i32, i32, i32, i8*, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, i32, %struct.jpeg_decomp_master*, %struct.jpeg_d_main_controller*, %struct.jpeg_d_coef_controller*, %struct.jpeg_d_post_controller*, %struct.jpeg_input_controller*, %struct.jpeg_marker_reader*, %struct.jpeg_entropy_decoder*, %struct.jpeg_inverse_dct*, %struct.jpeg_upsampler*, %struct.jpeg_color_deconverter*, %struct.jpeg_color_quantizer* }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.jpeg_source_mgr = type { i8*, i64, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*)* }
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

; Function Attrs: noinline nounwind uwtable
define %struct.jvirt_barray_control** @jpeg_read_coefficients(%struct.jpeg_decompress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 4
  switch i32 %3, label %5 [
    i32 202, label %4
    i32 209, label %.backedge.preheader
  ]

; <label>:4:                                      ; preds = %1
  tail call fastcc void @transdecode_master_selection(%struct.jpeg_decompress_struct* nonnull %0)
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr1 = add i64 %sunkaddr, 28
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  store i32 209, i32* %sunkaddr2, align 4
  br label %.backedge.preheader

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %7 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %7, i64 0, i32 5
  store i32 18, i32* %8, align 8
  %sunkaddr3 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 28
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  %9 = load i32, i32* %sunkaddr5, align 4
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 6, i32 0, i64 0
  store i32 %9, i32* %11, align 4
  %12 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %13 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %12, align 8
  %14 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %13, align 8
  %15 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %14(%struct.jpeg_common_struct* %15) #2
  br label %.backedge.preheader

.backedge.preheader:                              ; preds = %5, %4, %1
  %sunkaddr21 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr22 = add i64 %sunkaddr21, 16
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to %struct.jpeg_progress_mgr**
  %sunkaddr27 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr28 = add i64 %sunkaddr27, 560
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to i32 (%struct.jpeg_decompress_struct*)***
  %sunkaddr30 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr31 = add i64 %sunkaddr30, 16
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to %struct.jpeg_progress_mgr**
  %sunkaddr33 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr34 = add i64 %sunkaddr33, 16
  %sunkaddr35 = inttoptr i64 %sunkaddr34 to %struct.jpeg_progress_mgr**
  %sunkaddr36 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr37 = add i64 %sunkaddr36, 400
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to i32*
  %16 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr24 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr25 = add i64 %sunkaddr24, 16
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to void (%struct.jpeg_common_struct*)***
  br label %.backedge

.backedge:                                        ; preds = %.backedge.backedge, %.backedge.preheader
  %17 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr23, align 8
  %18 = icmp eq %struct.jpeg_progress_mgr* %17, null
  br i1 %18, label %22, label %19

; <label>:19:                                     ; preds = %.backedge
  %20 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %sunkaddr26, align 8
  %21 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %20, align 8
  tail call void %21(%struct.jpeg_common_struct* nonnull %16) #2
  br label %22

; <label>:22:                                     ; preds = %.backedge, %19
  %23 = load i32 (%struct.jpeg_decompress_struct*)**, i32 (%struct.jpeg_decompress_struct*)*** %sunkaddr29, align 8
  %24 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %23, align 8
  %25 = tail call i32 %24(%struct.jpeg_decompress_struct* nonnull %0) #2
  switch i32 %25, label %26 [
    i32 0, label %.loopexit.loopexit
    i32 2, label %43
  ]

; <label>:26:                                     ; preds = %22
  %27 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr32, align 8
  %28 = icmp eq %struct.jpeg_progress_mgr* %27, null
  br i1 %28, label %.backedge.backedge, label %29

; <label>:29:                                     ; preds = %26
  switch i32 %25, label %.backedge.backedge [
    i32 3, label %30
    i32 1, label %30
  ]

; <label>:30:                                     ; preds = %29, %29
  %31 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr35, align 8
  %32 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %31, i64 0, i32 1
  %33 = load i64, i64* %32, align 8
  %34 = add nsw i64 %33, 1
  store i64 %34, i64* %32, align 8
  %35 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr35, align 8
  %36 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %35, i64 0, i32 2
  %37 = load i64, i64* %36, align 8
  %38 = icmp slt i64 %34, %37
  br i1 %38, label %.backedge.backedge, label %39

; <label>:39:                                     ; preds = %30
  %40 = load i32, i32* %sunkaddr38, align 8
  %41 = zext i32 %40 to i64
  %42 = add nsw i64 %41, %37
  %sunkaddr15 = ptrtoint %struct.jpeg_progress_mgr* %35 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 16
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i64*
  store i64 %42, i64* %sunkaddr17, align 8
  br label %.backedge.backedge

.backedge.backedge:                               ; preds = %39, %30, %29, %26
  br label %.backedge

; <label>:43:                                     ; preds = %22
  %sunkaddr18 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr19 = add i64 %sunkaddr18, 28
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i32*
  store i32 210, i32* %sunkaddr20, align 4
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %45 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %44, align 8
  %46 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %45, i64 0, i32 4
  %47 = load %struct.jvirt_barray_control**, %struct.jvirt_barray_control*** %46, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %22
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %43
  %.0 = phi %struct.jvirt_barray_control** [ %47, %43 ], [ null, %.loopexit.loopexit ]
  ret %struct.jvirt_barray_control** %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @transdecode_master_selection(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 45
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %13, label %5

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %7 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %7, i64 0, i32 5
  store i32 1, i32* %8, align 8
  %9 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %10 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %9, align 8
  %11 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %10, align 8
  %12 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %11(%struct.jpeg_common_struct* %12) #2
  br label %19

; <label>:13:                                     ; preds = %1
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 44
  %15 = load i32, i32* %14, align 8
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %18, label %17

; <label>:17:                                     ; preds = %13
  tail call void @jinit_phuff_decoder(%struct.jpeg_decompress_struct* nonnull %0) #2
  br label %19

; <label>:18:                                     ; preds = %13
  tail call void @jinit_huff_decoder(%struct.jpeg_decompress_struct* nonnull %0) #2
  br label %19

; <label>:19:                                     ; preds = %17, %18, %5
  tail call void @jinit_d_coef_controller(%struct.jpeg_decompress_struct* nonnull %0, i32 1) #2
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %21 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %21, i64 0, i32 6
  %23 = bitcast {}** %22 to void (%struct.jpeg_common_struct*)**
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  %25 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %24(%struct.jpeg_common_struct* %25) #2
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %27 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %27, i64 0, i32 2
  %29 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %28, align 8
  tail call void %29(%struct.jpeg_decompress_struct* nonnull %0) #2
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 2
  %31 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %30, align 8
  %32 = icmp eq %struct.jpeg_progress_mgr* %31, null
  br i1 %32, label %64, label %33

; <label>:33:                                     ; preds = %19
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 44
  %35 = load i32, i32* %34, align 8
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %42, label %37

; <label>:37:                                     ; preds = %33
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %39 = load i32, i32* %38, align 8
  %40 = mul nsw i32 %39, 3
  %41 = add nsw i32 %40, 2
  br label %50

; <label>:42:                                     ; preds = %33
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr1 = add i64 %sunkaddr, 560
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to %struct.jpeg_input_controller**
  %43 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %sunkaddr2, align 8
  %44 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %43, i64 0, i32 4
  %45 = load i32, i32* %44, align 8
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %50, label %47

; <label>:47:                                     ; preds = %42
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %49 = load i32, i32* %48, align 8
  br label %50

; <label>:50:                                     ; preds = %47, %42, %37
  %.1 = phi i32 [ %41, %37 ], [ %49, %47 ], [ 1, %42 ]
  %sunkaddr3 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 16
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to %struct.jpeg_progress_mgr**
  %51 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr5, align 8
  %52 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %51, i64 0, i32 1
  store i64 0, i64* %52, align 8
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 60
  %54 = load i32, i32* %53, align 8
  %55 = zext i32 %54 to i64
  %56 = sext i32 %.1 to i64
  %57 = mul nsw i64 %55, %56
  %58 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr5, align 8
  %59 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %58, i64 0, i32 2
  store i64 %57, i64* %59, align 8
  %60 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr5, align 8
  %61 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %60, i64 0, i32 3
  store i32 0, i32* %61, align 8
  %62 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr5, align 8
  %63 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %62, i64 0, i32 4
  store i32 1, i32* %63, align 4
  br label %64

; <label>:64:                                     ; preds = %19, %50
  ret void
}

declare void @jinit_phuff_decoder(%struct.jpeg_decompress_struct*) local_unnamed_addr #1

declare void @jinit_huff_decoder(%struct.jpeg_decompress_struct*) local_unnamed_addr #1

declare void @jinit_d_coef_controller(%struct.jpeg_decompress_struct*, i32) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
