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
define %struct.jvirt_barray_control** @jpeg_read_coefficients(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 4
  switch i32 %3, label %5 [
    i32 202, label %4
    i32 209, label %.preheader
  ]

; <label>:4:                                      ; preds = %1
  tail call void @transdecode_master_selection(%struct.jpeg_decompress_struct* nonnull %0)
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr14 = add i64 %sunkaddr, 28
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to i32*
  store i32 209, i32* %sunkaddr15, align 4
  br label %.preheader

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %7 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %7, i64 0, i32 5
  store i32 18, i32* %8, align 8
  %sunkaddr16 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr17 = add i64 %sunkaddr16, 28
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to i32*
  %9 = load i32, i32* %sunkaddr18, align 4
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 6, i32 0, i64 0
  store i32 %9, i32* %11, align 4
  %12 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %13 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %12, align 8
  %14 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %13, align 8
  %15 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %14(%struct.jpeg_common_struct* %15) #2
  br label %.preheader

.preheader:                                       ; preds = %5, %4, %1
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 2
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %sunkaddr22 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr23 = add i64 %sunkaddr22, 16
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to %struct.jpeg_progress_mgr**
  %sunkaddr25 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr26 = add i64 %sunkaddr25, 16
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to %struct.jpeg_progress_mgr**
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 60
  %sunkaddr19 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr20 = add i64 %sunkaddr19, 16
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to void (%struct.jpeg_common_struct*)***
  %.cast = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %19 = bitcast %struct.jpeg_input_controller** %17 to i32 (%struct.jpeg_decompress_struct*)***
  br label %.backedge

.backedge:                                        ; preds = %.backedge.backedge, %.preheader
  %20 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %16, align 8
  %21 = icmp eq %struct.jpeg_progress_mgr* %20, null
  br i1 %21, label %25, label %22

; <label>:22:                                     ; preds = %.backedge
  %23 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %sunkaddr21, align 8
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  tail call void %24(%struct.jpeg_common_struct* nonnull %.cast) #2
  br label %25

; <label>:25:                                     ; preds = %.backedge, %22
  %26 = load i32 (%struct.jpeg_decompress_struct*)**, i32 (%struct.jpeg_decompress_struct*)*** %19, align 8
  %27 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %26, align 8
  %28 = tail call i32 %27(%struct.jpeg_decompress_struct* nonnull %0) #2
  switch i32 %28, label %29 [
    i32 0, label %.loopexit.loopexit
    i32 2, label %45
  ]

; <label>:29:                                     ; preds = %25
  %30 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr24, align 8
  %31 = icmp eq %struct.jpeg_progress_mgr* %30, null
  br i1 %31, label %.backedge.backedge, label %32

; <label>:32:                                     ; preds = %29
  switch i32 %28, label %.backedge.backedge [
    i32 3, label %33
    i32 1, label %33
  ]

; <label>:33:                                     ; preds = %32, %32
  %34 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %30, i64 0, i32 1
  %35 = load i64, i64* %34, align 8
  %36 = add nsw i64 %35, 1
  store i64 %36, i64* %34, align 8
  %37 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr27, align 8
  %38 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %37, i64 0, i32 2
  %39 = load i64, i64* %38, align 8
  %40 = icmp slt i64 %36, %39
  br i1 %40, label %.backedge.backedge, label %41

; <label>:41:                                     ; preds = %33
  %42 = load i32, i32* %18, align 8
  %43 = zext i32 %42 to i64
  %44 = add nsw i64 %43, %39
  %sunkaddr28 = ptrtoint %struct.jpeg_progress_mgr* %37 to i64
  %sunkaddr29 = add i64 %sunkaddr28, 16
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i64*
  store i64 %44, i64* %sunkaddr30, align 8
  br label %.backedge.backedge

.backedge.backedge:                               ; preds = %41, %33, %29, %32
  br label %.backedge

; <label>:45:                                     ; preds = %25
  %sunkaddr31 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr32 = add i64 %sunkaddr31, 28
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to i32*
  store i32 210, i32* %sunkaddr33, align 4
  %46 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %47 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %47, i64 0, i32 4
  %49 = load %struct.jvirt_barray_control**, %struct.jvirt_barray_control*** %48, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %25
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %45
  %.sroa.0.0 = phi %struct.jvirt_barray_control** [ %49, %45 ], [ null, %.loopexit.loopexit ]
  ret %struct.jvirt_barray_control** %.sroa.0.0
}

; Function Attrs: noinline nounwind uwtable
define internal void @transdecode_master_selection(%struct.jpeg_decompress_struct*) #0 {
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
  br i1 %32, label %65, label %33

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
  br label %51

; <label>:42:                                     ; preds = %33
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %44 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %44, i64 0, i32 4
  %46 = load i32, i32* %45, align 8
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %51, label %48

; <label>:48:                                     ; preds = %42
  %49 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %50 = load i32, i32* %49, align 8
  br label %51

; <label>:51:                                     ; preds = %48, %42, %37
  %storemerge1 = phi i32 [ %41, %37 ], [ %50, %48 ], [ 1, %42 ]
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr13 = add i64 %sunkaddr, 16
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to %struct.jpeg_progress_mgr**
  %52 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr14, align 8
  %53 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %52, i64 0, i32 1
  store i64 0, i64* %53, align 8
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 60
  %55 = load i32, i32* %54, align 8
  %56 = zext i32 %55 to i64
  %57 = sext i32 %storemerge1 to i64
  %58 = mul nsw i64 %56, %57
  %59 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr14, align 8
  %60 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %59, i64 0, i32 2
  store i64 %58, i64* %60, align 8
  %61 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr14, align 8
  %62 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %61, i64 0, i32 3
  store i32 0, i32* %62, align 8
  %63 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr14, align 8
  %64 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %63, i64 0, i32 4
  store i32 1, i32* %64, align 4
  br label %65

; <label>:65:                                     ; preds = %19, %51
  ret void
}

declare void @jinit_phuff_decoder(%struct.jpeg_decompress_struct*) #1

declare void @jinit_huff_decoder(%struct.jpeg_decompress_struct*) #1

declare void @jinit_d_coef_controller(%struct.jpeg_decompress_struct*, i32) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
