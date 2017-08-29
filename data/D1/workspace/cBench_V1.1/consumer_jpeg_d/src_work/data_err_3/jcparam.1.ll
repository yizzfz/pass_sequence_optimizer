; ModuleID = 'jcparam.ll'
source_filename = "jcparam.c"
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
%struct.jpeg_destination_mgr = type { i8*, i64, void (%struct.jpeg_compress_struct*)*, i32 (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)* }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_scan_info = type { i32, [4 x i32], i32, i32, i32, i32 }
%struct.jpeg_comp_master = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, i32, i32 }
%struct.jpeg_c_main_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32)* }
%struct.jpeg_c_prep_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* }
%struct.jpeg_c_coef_controller = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, i8***)* }
%struct.jpeg_marker_writer = type { void (%struct.jpeg_compress_struct*, i32, i8*, i32)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)* }
%struct.jpeg_color_converter = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* }
%struct.jpeg_downsampler = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)*, i32 }
%struct.jpeg_forward_dct = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* }
%struct.jpeg_entropy_encoder = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, void (%struct.jpeg_compress_struct*)* }

@jpeg_set_linear_quality.std_luminance_quant_tbl = internal constant [64 x i32] [i32 16, i32 11, i32 10, i32 16, i32 24, i32 40, i32 51, i32 61, i32 12, i32 12, i32 14, i32 19, i32 26, i32 58, i32 60, i32 55, i32 14, i32 13, i32 16, i32 24, i32 40, i32 57, i32 69, i32 56, i32 14, i32 17, i32 22, i32 29, i32 51, i32 87, i32 80, i32 62, i32 18, i32 22, i32 37, i32 56, i32 68, i32 109, i32 103, i32 77, i32 24, i32 35, i32 55, i32 64, i32 81, i32 104, i32 113, i32 92, i32 49, i32 64, i32 78, i32 87, i32 103, i32 121, i32 120, i32 101, i32 72, i32 92, i32 95, i32 98, i32 112, i32 100, i32 103, i32 99], align 16
@jpeg_set_linear_quality.std_chrominance_quant_tbl = internal constant [64 x i32] [i32 17, i32 18, i32 24, i32 47, i32 99, i32 99, i32 99, i32 99, i32 18, i32 21, i32 26, i32 66, i32 99, i32 99, i32 99, i32 99, i32 24, i32 26, i32 56, i32 99, i32 99, i32 99, i32 99, i32 99, i32 47, i32 66, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99], align 16
@std_huff_tables.bits_dc_luminance = internal constant [17 x i8] c"\00\00\01\05\01\01\01\01\01\01\00\00\00\00\00\00\00", align 16
@std_huff_tables.val_dc_luminance = internal constant [12 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B", align 1
@std_huff_tables.bits_dc_chrominance = internal constant [17 x i8] c"\00\00\03\01\01\01\01\01\01\01\01\01\00\00\00\00\00", align 16
@std_huff_tables.val_dc_chrominance = internal constant [12 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B", align 1
@std_huff_tables.bits_ac_luminance = internal constant [17 x i8] c"\00\00\02\01\03\03\02\04\03\05\05\04\04\00\00\01}", align 16
@std_huff_tables.val_ac_luminance = internal constant [162 x i8] c"\01\02\03\00\04\11\05\12!1A\06\13Qa\07\22q\142\81\91\A1\08#B\B1\C1\15R\D1\F0$3br\82\09\0A\16\17\18\19\1A%&'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\83\84\85\86\87\88\89\8A\92\93\94\95\96\97\98\99\9A\A2\A3\A4\A5\A6\A7\A8\A9\AA\B2\B3\B4\B5\B6\B7\B8\B9\BA\C2\C3\C4\C5\C6\C7\C8\C9\CA\D2\D3\D4\D5\D6\D7\D8\D9\DA\E1\E2\E3\E4\E5\E6\E7\E8\E9\EA\F1\F2\F3\F4\F5\F6\F7\F8\F9\FA", align 16
@std_huff_tables.bits_ac_chrominance = internal constant [17 x i8] c"\00\00\02\01\02\04\04\03\04\07\05\04\04\00\01\02w", align 16
@std_huff_tables.val_ac_chrominance = internal constant [162 x i8] c"\00\01\02\03\11\04\05!1\06\12AQ\07aq\13\222\81\08\14B\91\A1\B1\C1\09#3R\F0\15br\D1\0A\16$4\E1%\F1\17\18\19\1A&'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\82\83\84\85\86\87\88\89\8A\92\93\94\95\96\97\98\99\9A\A2\A3\A4\A5\A6\A7\A8\A9\AA\B2\B3\B4\B5\B6\B7\B8\B9\BA\C2\C3\C4\C5\C6\C7\C8\C9\CA\D2\D3\D4\D5\D6\D7\D8\D9\DA\E2\E3\E4\E5\E6\E7\E8\E9\EA\F2\F3\F4\F5\F6\F7\F8\F9\FA", align 16

; Function Attrs: noinline nounwind uwtable
define void @jpeg_add_quant_table(%struct.jpeg_compress_struct*, i32, i32*, i32, i32) #0 {
  %6 = sext i32 %1 to i64
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 4
  %8 = load i32, i32* %7, align 4
  %9 = icmp eq i32 %8, 100
  br i1 %9, label %21, label %10

; <label>:10:                                     ; preds = %5
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 5
  store i32 18, i32* %13, align 8
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr19 = add i64 %sunkaddr, 28
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i32*
  %14 = load i32, i32* %sunkaddr20, align 4
  %15 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %16 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %15, i64 0, i32 6, i32 0, i64 0
  store i32 %14, i32* %16, align 4
  %17 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %18 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %17, align 8
  %19 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %18, align 8
  %20 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %19(%struct.jpeg_common_struct* %20) #5
  br label %21

; <label>:21:                                     ; preds = %5, %10
  %sunkaddr21 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr22 = shl nsw i64 %6, 3
  %sunkaddr23 = add i64 %sunkaddr21, %sunkaddr22
  %sunkaddr24 = add i64 %sunkaddr23, 88
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to %struct.JQUANT_TBL**
  %22 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %sunkaddr25, align 8
  %23 = icmp eq %struct.JQUANT_TBL* %22, null
  br i1 %23, label %24, label %.preheader

; <label>:24:                                     ; preds = %21
  %25 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %26 = tail call %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct* %25) #5
  %sunkaddr26 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr27 = shl nsw i64 %6, 3
  %sunkaddr28 = add i64 %sunkaddr26, %sunkaddr27
  %sunkaddr29 = add i64 %sunkaddr28, 88
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to %struct.JQUANT_TBL**
  store %struct.JQUANT_TBL* %26, %struct.JQUANT_TBL** %sunkaddr30, align 8
  br label %.preheader

.preheader:                                       ; preds = %24, %21
  %27 = sext i32 %3 to i64
  %28 = icmp eq i32 %4, 0
  %sunkaddr36 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr37 = shl nsw i64 %6, 3
  %sunkaddr38 = add i64 %sunkaddr36, %sunkaddr37
  %sunkaddr39 = add i64 %sunkaddr38, 88
  %sunkaddr40 = inttoptr i64 %sunkaddr39 to %struct.JQUANT_TBL**
  br i1 %28, label %.preheader.split.preheader, label %.preheader.split.us.preheader

.preheader.split.us.preheader:                    ; preds = %.preheader
  br label %.preheader.split.us

.preheader.split.preheader:                       ; preds = %.preheader
  br label %.preheader.split

.preheader.split.us:                              ; preds = %.preheader.split.us.preheader, %.preheader.split.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %.preheader.split.us ], [ 0, %.preheader.split.us.preheader ]
  %29 = getelementptr inbounds i32, i32* %2, i64 %indvars.iv43
  %30 = load i32, i32* %29, align 4
  %31 = zext i32 %30 to i64
  %32 = mul nsw i64 %31, %27
  %33 = add nsw i64 %32, 50
  %34 = icmp slt i64 %33, 100
  %35 = sdiv i64 %33, 100
  %..us = select i1 %34, i64 1, i64 %35
  %36 = icmp slt i64 %..us, 255
  %37 = select i1 %36, i64 %..us, i64 255
  %38 = trunc i64 %37 to i16
  %39 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %sunkaddr40, align 8
  %40 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %39, i64 0, i32 0, i64 %indvars.iv43
  store i16 %38, i16* %40, align 2
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next44, 64
  br i1 %exitcond45, label %.us-lcssa.us.loopexit48, label %.preheader.split.us

.preheader.split:                                 ; preds = %.preheader.split.preheader, %.preheader.split
  %indvars.iv = phi i64 [ %indvars.iv.next, %.preheader.split ], [ 0, %.preheader.split.preheader ]
  %41 = getelementptr inbounds i32, i32* %2, i64 %indvars.iv
  %42 = load i32, i32* %41, align 4
  %43 = zext i32 %42 to i64
  %44 = mul nsw i64 %43, %27
  %45 = add nsw i64 %44, 50
  %46 = icmp slt i64 %45, 100
  %47 = sdiv i64 %45, 100
  %. = select i1 %46, i64 1, i64 %47
  %48 = icmp slt i64 %., 32767
  %storemerge2 = select i1 %48, i64 %., i64 32767
  %49 = trunc i64 %storemerge2 to i16
  %50 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %sunkaddr40, align 8
  %51 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %50, i64 0, i32 0, i64 %indvars.iv
  store i16 %49, i16* %51, align 2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 64
  br i1 %exitcond, label %.us-lcssa.us.loopexit, label %.preheader.split

.us-lcssa.us.loopexit:                            ; preds = %.preheader.split
  br label %.us-lcssa.us

.us-lcssa.us.loopexit48:                          ; preds = %.preheader.split.us
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit48, %.us-lcssa.us.loopexit
  %sunkaddr31 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr32 = shl nsw i64 %6, 3
  %sunkaddr33 = add i64 %sunkaddr31, %sunkaddr32
  %sunkaddr34 = add i64 %sunkaddr33, 88
  %sunkaddr35 = inttoptr i64 %sunkaddr34 to %struct.JQUANT_TBL**
  %52 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %sunkaddr35, align 8
  %53 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %52, i64 0, i32 1
  store i32 0, i32* %53, align 4
  ret void
}

declare %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct*) #1

; Function Attrs: noinline nounwind uwtable
define void @jpeg_set_linear_quality(%struct.jpeg_compress_struct*, i32, i32) #0 {
  tail call void @jpeg_add_quant_table(%struct.jpeg_compress_struct* %0, i32 0, i32* getelementptr inbounds ([64 x i32], [64 x i32]* @jpeg_set_linear_quality.std_luminance_quant_tbl, i64 0, i64 0), i32 %1, i32 %2)
  tail call void @jpeg_add_quant_table(%struct.jpeg_compress_struct* %0, i32 1, i32* getelementptr inbounds ([64 x i32], [64 x i32]* @jpeg_set_linear_quality.std_chrominance_quant_tbl, i64 0, i64 0), i32 %1, i32 %2)
  ret void
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i32 @jpeg_quality_scaling(i32) #2 {
  %2 = icmp sgt i32 %0, 1
  %. = select i1 %2, i32 %0, i32 1
  %3 = icmp slt i32 %., 100
  %storemerge2 = select i1 %3, i32 %., i32 100
  %4 = icmp slt i32 %storemerge2, 50
  br i1 %4, label %5, label %7

; <label>:5:                                      ; preds = %1
  %6 = udiv i32 5000, %storemerge2
  br label %10

; <label>:7:                                      ; preds = %1
  %8 = shl nuw nsw i32 %storemerge2, 1
  %9 = sub nsw i32 200, %8
  br label %10

; <label>:10:                                     ; preds = %7, %5
  %storemerge = phi i32 [ %9, %7 ], [ %6, %5 ]
  ret i32 %storemerge
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_set_quality(%struct.jpeg_compress_struct*, i32, i32) #0 {
  %4 = tail call i32 @jpeg_quality_scaling(i32 %1)
  tail call void @jpeg_set_linear_quality(%struct.jpeg_compress_struct* %0, i32 %4, i32 %2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_set_defaults(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 100
  br i1 %4, label %16, label %5

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %7 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %7, i64 0, i32 5
  store i32 18, i32* %8, align 8
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr16 = add i64 %sunkaddr, 28
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i32*
  %9 = load i32, i32* %sunkaddr17, align 4
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 6, i32 0, i64 0
  store i32 %9, i32* %11, align 4
  %12 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %13 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %12, align 8
  %14 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %13, align 8
  %15 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %14(%struct.jpeg_common_struct* %15) #5
  br label %16

; <label>:16:                                     ; preds = %1, %5
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %18 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %19 = icmp eq %struct.jpeg_component_info* %18, null
  br i1 %19, label %20, label %26

; <label>:20:                                     ; preds = %16
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %22 = bitcast %struct.jpeg_memory_mgr** %21 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %23 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %22, align 8
  %24 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %23, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %25 = tail call i8* %24(%struct.jpeg_common_struct* %.cast, i32 0, i64 960) #5
  %sunkaddr18 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr19 = add i64 %sunkaddr18, 80
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i8**
  store i8* %25, i8** %sunkaddr20, align 8
  br label %26

; <label>:26:                                     ; preds = %16, %20
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 11
  store i32 8, i32* %27, align 8
  tail call void @jpeg_set_quality(%struct.jpeg_compress_struct* nonnull %0, i32 75, i32 1)
  tail call void @std_huff_tables(%struct.jpeg_compress_struct* nonnull %0)
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 18, i64 0
  store i8 0, i8* %28, align 1
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 19, i64 0
  store i8 1, i8* %29, align 1
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 20, i64 0
  store i8 5, i8* %30, align 1
  %31 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 18, i64 1
  store i8 0, i8* %31, align 1
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 19, i64 1
  store i8 1, i8* %32, align 1
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 20, i64 1
  store i8 5, i8* %33, align 1
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 18, i64 2
  store i8 0, i8* %34, align 1
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 19, i64 2
  store i8 1, i8* %35, align 1
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 20, i64 2
  store i8 5, i8* %36, align 1
  %37 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 18, i64 3
  store i8 0, i8* %37, align 1
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 19, i64 3
  store i8 1, i8* %38, align 1
  %39 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 20, i64 3
  store i8 5, i8* %39, align 1
  %40 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 18, i64 4
  store i8 0, i8* %40, align 1
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 19, i64 4
  store i8 1, i8* %41, align 1
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 20, i64 4
  store i8 5, i8* %42, align 1
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 18, i64 5
  store i8 0, i8* %43, align 1
  %44 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 19, i64 5
  store i8 1, i8* %44, align 1
  %45 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 20, i64 5
  store i8 5, i8* %45, align 1
  %46 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 18, i64 6
  store i8 0, i8* %46, align 1
  %47 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 19, i64 6
  store i8 1, i8* %47, align 1
  %48 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 20, i64 6
  store i8 5, i8* %48, align 1
  %49 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 18, i64 7
  store i8 0, i8* %49, align 1
  %50 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 19, i64 7
  store i8 1, i8* %50, align 1
  %51 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 20, i64 7
  store i8 5, i8* %51, align 1
  %52 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 18, i64 8
  store i8 0, i8* %52, align 1
  %53 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 19, i64 8
  store i8 1, i8* %53, align 1
  %54 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 20, i64 8
  store i8 5, i8* %54, align 1
  %55 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 18, i64 9
  store i8 0, i8* %55, align 1
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 19, i64 9
  store i8 1, i8* %56, align 1
  %57 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 20, i64 9
  store i8 5, i8* %57, align 1
  %58 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 18, i64 10
  store i8 0, i8* %58, align 1
  %59 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 19, i64 10
  store i8 1, i8* %59, align 1
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 20, i64 10
  store i8 5, i8* %60, align 1
  %61 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 18, i64 11
  store i8 0, i8* %61, align 1
  %62 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 19, i64 11
  store i8 1, i8* %62, align 1
  %63 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 20, i64 11
  store i8 5, i8* %63, align 1
  %64 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 18, i64 12
  store i8 0, i8* %64, align 1
  %65 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 19, i64 12
  store i8 1, i8* %65, align 1
  %66 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 20, i64 12
  store i8 5, i8* %66, align 1
  %67 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 18, i64 13
  store i8 0, i8* %67, align 1
  %68 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 19, i64 13
  store i8 1, i8* %68, align 1
  %69 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 20, i64 13
  store i8 5, i8* %69, align 1
  %70 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 18, i64 14
  store i8 0, i8* %70, align 1
  %71 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 19, i64 14
  store i8 1, i8* %71, align 1
  %72 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 20, i64 14
  store i8 5, i8* %72, align 1
  %73 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 18, i64 15
  store i8 0, i8* %73, align 1
  %74 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 19, i64 15
  store i8 1, i8* %74, align 1
  %75 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 20, i64 15
  store i8 5, i8* %75, align 1
  %76 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 22
  %77 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 21
  store i32 0, i32* %77, align 8
  %78 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 25
  %sunkaddr21 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr22 = add i64 %sunkaddr21, 64
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to i32*
  %79 = bitcast %struct.jpeg_scan_info** %76 to i8*
  call void @llvm.memset.p0i8.i64(i8* %79, i8 0, i64 20, i32 8, i1 false)
  %80 = load i32, i32* %sunkaddr23, align 8
  %81 = icmp sgt i32 %80, 8
  %. = zext i1 %81 to i32
  store i32 %., i32* %78, align 8
  %82 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 26
  %83 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 32
  store i8 0, i8* %83, align 4
  %84 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 33
  %85 = bitcast i32* %82 to i8*
  call void @llvm.memset.p0i8.i64(i8* %85, i8 0, i64 20, i32 4, i1 false)
  store i16 1, i16* %84, align 2
  %86 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 34
  store i16 1, i16* %86, align 8
  tail call void @jpeg_default_colorspace(%struct.jpeg_compress_struct* nonnull %0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @std_huff_tables(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 0
  tail call void @add_huff_table(%struct.jpeg_compress_struct* %0, %struct.JHUFF_TBL** %2, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @std_huff_tables.bits_dc_luminance, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @std_huff_tables.val_dc_luminance, i64 0, i64 0))
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 0
  tail call void @add_huff_table(%struct.jpeg_compress_struct* %0, %struct.JHUFF_TBL** %3, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @std_huff_tables.bits_ac_luminance, i64 0, i64 0), i8* getelementptr inbounds ([162 x i8], [162 x i8]* @std_huff_tables.val_ac_luminance, i64 0, i64 0))
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 1
  tail call void @add_huff_table(%struct.jpeg_compress_struct* %0, %struct.JHUFF_TBL** %4, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @std_huff_tables.bits_dc_chrominance, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @std_huff_tables.val_dc_chrominance, i64 0, i64 0))
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 1
  tail call void @add_huff_table(%struct.jpeg_compress_struct* %0, %struct.JHUFF_TBL** %5, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @std_huff_tables.bits_ac_chrominance, i64 0, i64 0), i8* getelementptr inbounds ([162 x i8], [162 x i8]* @std_huff_tables.val_ac_chrominance, i64 0, i64 0))
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_default_colorspace(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 9
  %3 = load i32, i32* %2, align 4
  switch i32 %3, label %10 [
    i32 1, label %4
    i32 2, label %5
    i32 3, label %6
    i32 4, label %7
    i32 5, label %8
    i32 0, label %9
  ]

; <label>:4:                                      ; preds = %1
  tail call void @jpeg_set_colorspace(%struct.jpeg_compress_struct* nonnull %0, i32 1)
  ret void

; <label>:5:                                      ; preds = %1
  tail call void @jpeg_set_colorspace(%struct.jpeg_compress_struct* nonnull %0, i32 3)
  ret void

; <label>:6:                                      ; preds = %1
  tail call void @jpeg_set_colorspace(%struct.jpeg_compress_struct* nonnull %0, i32 3)
  ret void

; <label>:7:                                      ; preds = %1
  tail call void @jpeg_set_colorspace(%struct.jpeg_compress_struct* nonnull %0, i32 4)
  ret void

; <label>:8:                                      ; preds = %1
  tail call void @jpeg_set_colorspace(%struct.jpeg_compress_struct* nonnull %0, i32 5)
  ret void

; <label>:9:                                      ; preds = %1
  tail call void @jpeg_set_colorspace(%struct.jpeg_compress_struct* nonnull %0, i32 0)
  ret void

; <label>:10:                                     ; preds = %1
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 5
  store i32 7, i32* %13, align 8
  %14 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %15 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %14, align 8
  %16 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %15, align 8
  %17 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %16(%struct.jpeg_common_struct* %17) #5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_set_colorspace(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 4
  %4 = load i32, i32* %3, align 4
  %5 = icmp eq i32 %4, 100
  br i1 %5, label %17, label %6

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %8 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %8, i64 0, i32 5
  store i32 18, i32* %9, align 8
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr57 = add i64 %sunkaddr, 28
  %sunkaddr58 = inttoptr i64 %sunkaddr57 to i32*
  %10 = load i32, i32* %sunkaddr58, align 4
  %11 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %12 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 6, i32 0, i64 0
  store i32 %10, i32* %12, align 4
  %13 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %14 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %13, align 8
  %15 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %14, align 8
  %16 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %15(%struct.jpeg_common_struct* %16) #5
  br label %17

; <label>:17:                                     ; preds = %2, %6
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 13
  store i32 %1, i32* %18, align 8
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 31
  store i32 0, i32* %19, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 35
  store i32 0, i32* %20, align 4
  switch i32 %1, label %173 [
    i32 1, label %21
    i32 2, label %31
    i32 3, label %55
    i32 4, label %79
    i32 5, label %110
    i32 0, label %141
  ]

; <label>:21:                                     ; preds = %17
  %sunkaddr59 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr60 = add i64 %sunkaddr59, 280
  %sunkaddr61 = inttoptr i64 %sunkaddr60 to i32*
  store i32 1, i32* %sunkaddr61, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  store i32 1, i32* %22, align 4
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %24 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %24, i64 0, i32 0
  store i32 1, i32* %25, align 8
  %26 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %24, i64 0, i32 2
  store i32 1, i32* %26, align 8
  %27 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %24, i64 0, i32 3
  store i32 1, i32* %27, align 4
  %28 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %24, i64 0, i32 4
  store i32 0, i32* %28, align 8
  %29 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %24, i64 0, i32 5
  store i32 0, i32* %29, align 4
  %30 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %24, i64 0, i32 6
  store i32 0, i32* %30, align 8
  br label %.loopexit

; <label>:31:                                     ; preds = %17
  %sunkaddr62 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr63 = add i64 %sunkaddr62, 292
  %sunkaddr64 = inttoptr i64 %sunkaddr63 to i32*
  store i32 1, i32* %sunkaddr64, align 4
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  store i32 3, i32* %32, align 4
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %34 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %34, i64 0, i32 0
  store i32 82, i32* %35, align 8
  %36 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %34, i64 0, i32 2
  store i32 1, i32* %36, align 8
  %37 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %34, i64 0, i32 3
  store i32 1, i32* %37, align 4
  %38 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %34, i64 0, i32 4
  store i32 0, i32* %38, align 8
  %39 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %34, i64 0, i32 5
  store i32 0, i32* %39, align 4
  %40 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %34, i64 0, i32 6
  store i32 0, i32* %40, align 8
  %41 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %33, align 8
  %42 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %41, i64 1, i32 0
  store i32 71, i32* %42, align 8
  %43 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %41, i64 1, i32 2
  store i32 1, i32* %43, align 8
  %44 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %41, i64 1, i32 3
  store i32 1, i32* %44, align 4
  %45 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %41, i64 1, i32 4
  store i32 0, i32* %45, align 8
  %46 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %41, i64 1, i32 5
  store i32 0, i32* %46, align 4
  %47 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %41, i64 1, i32 6
  store i32 0, i32* %47, align 8
  %48 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %33, align 8
  %49 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %48, i64 2, i32 0
  store i32 66, i32* %49, align 8
  %50 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %48, i64 2, i32 2
  store i32 1, i32* %50, align 8
  %51 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %48, i64 2, i32 3
  store i32 1, i32* %51, align 4
  %52 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %48, i64 2, i32 4
  store i32 0, i32* %52, align 8
  %53 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %48, i64 2, i32 5
  store i32 0, i32* %53, align 4
  %54 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %48, i64 2, i32 6
  store i32 0, i32* %54, align 8
  br label %.loopexit

; <label>:55:                                     ; preds = %17
  %sunkaddr65 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr66 = add i64 %sunkaddr65, 280
  %sunkaddr67 = inttoptr i64 %sunkaddr66 to i32*
  store i32 1, i32* %sunkaddr67, align 8
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  store i32 3, i32* %56, align 4
  %57 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %58 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %57, align 8
  %59 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %58, i64 0, i32 0
  store i32 1, i32* %59, align 8
  %60 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %58, i64 0, i32 2
  store i32 2, i32* %60, align 8
  %61 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %58, i64 0, i32 3
  store i32 2, i32* %61, align 4
  %62 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %58, i64 0, i32 4
  store i32 0, i32* %62, align 8
  %63 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %58, i64 0, i32 5
  store i32 0, i32* %63, align 4
  %64 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %58, i64 0, i32 6
  store i32 0, i32* %64, align 8
  %65 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %57, align 8
  %66 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %65, i64 1, i32 0
  store i32 2, i32* %66, align 8
  %67 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %65, i64 1, i32 2
  store i32 1, i32* %67, align 8
  %68 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %65, i64 1, i32 3
  store i32 1, i32* %68, align 4
  %69 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %65, i64 1, i32 4
  store i32 1, i32* %69, align 8
  %70 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %65, i64 1, i32 5
  store i32 1, i32* %70, align 4
  %71 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %65, i64 1, i32 6
  store i32 1, i32* %71, align 8
  %72 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %57, align 8
  %73 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i64 2, i32 0
  store i32 3, i32* %73, align 8
  %74 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i64 2, i32 2
  store i32 1, i32* %74, align 8
  %75 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i64 2, i32 3
  store i32 1, i32* %75, align 4
  %76 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i64 2, i32 4
  store i32 1, i32* %76, align 8
  %77 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i64 2, i32 5
  store i32 1, i32* %77, align 4
  %78 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i64 2, i32 6
  store i32 1, i32* %78, align 8
  br label %.loopexit

; <label>:79:                                     ; preds = %17
  %sunkaddr68 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr69 = add i64 %sunkaddr68, 292
  %sunkaddr70 = inttoptr i64 %sunkaddr69 to i32*
  store i32 1, i32* %sunkaddr70, align 4
  %80 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  store i32 4, i32* %80, align 4
  %81 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %82 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %81, align 8
  %83 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %82, i64 0, i32 0
  store i32 67, i32* %83, align 8
  %84 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %82, i64 0, i32 2
  store i32 1, i32* %84, align 8
  %85 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %82, i64 0, i32 3
  store i32 1, i32* %85, align 4
  %86 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %82, i64 0, i32 4
  store i32 0, i32* %86, align 8
  %87 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %82, i64 0, i32 5
  store i32 0, i32* %87, align 4
  %88 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %82, i64 0, i32 6
  store i32 0, i32* %88, align 8
  %89 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %81, align 8
  %90 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %89, i64 1, i32 0
  store i32 77, i32* %90, align 8
  %91 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %89, i64 1, i32 2
  store i32 1, i32* %91, align 8
  %92 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %89, i64 1, i32 3
  store i32 1, i32* %92, align 4
  %93 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %89, i64 1, i32 4
  store i32 0, i32* %93, align 8
  %94 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %89, i64 1, i32 5
  store i32 0, i32* %94, align 4
  %95 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %89, i64 1, i32 6
  store i32 0, i32* %95, align 8
  %96 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %81, align 8
  %97 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %96, i64 2, i32 0
  store i32 89, i32* %97, align 8
  %98 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %96, i64 2, i32 2
  store i32 1, i32* %98, align 8
  %99 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %96, i64 2, i32 3
  store i32 1, i32* %99, align 4
  %100 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %96, i64 2, i32 4
  store i32 0, i32* %100, align 8
  %101 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %96, i64 2, i32 5
  store i32 0, i32* %101, align 4
  %102 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %96, i64 2, i32 6
  store i32 0, i32* %102, align 8
  %103 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %81, align 8
  %104 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %103, i64 3, i32 0
  store i32 75, i32* %104, align 8
  %105 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %103, i64 3, i32 2
  store i32 1, i32* %105, align 8
  %106 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %103, i64 3, i32 3
  store i32 1, i32* %106, align 4
  %107 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %103, i64 3, i32 4
  store i32 0, i32* %107, align 8
  %108 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %103, i64 3, i32 5
  store i32 0, i32* %108, align 4
  %109 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %103, i64 3, i32 6
  store i32 0, i32* %109, align 8
  br label %.loopexit

; <label>:110:                                    ; preds = %17
  %sunkaddr71 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr72 = add i64 %sunkaddr71, 292
  %sunkaddr73 = inttoptr i64 %sunkaddr72 to i32*
  store i32 1, i32* %sunkaddr73, align 4
  %111 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  store i32 4, i32* %111, align 4
  %112 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %113 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %112, align 8
  %114 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %113, i64 0, i32 0
  store i32 1, i32* %114, align 8
  %115 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %113, i64 0, i32 2
  store i32 2, i32* %115, align 8
  %116 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %113, i64 0, i32 3
  store i32 2, i32* %116, align 4
  %117 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %113, i64 0, i32 4
  store i32 0, i32* %117, align 8
  %118 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %113, i64 0, i32 5
  store i32 0, i32* %118, align 4
  %119 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %113, i64 0, i32 6
  store i32 0, i32* %119, align 8
  %120 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %112, align 8
  %121 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %120, i64 1, i32 0
  store i32 2, i32* %121, align 8
  %122 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %120, i64 1, i32 2
  store i32 1, i32* %122, align 8
  %123 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %120, i64 1, i32 3
  store i32 1, i32* %123, align 4
  %124 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %120, i64 1, i32 4
  store i32 1, i32* %124, align 8
  %125 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %120, i64 1, i32 5
  store i32 1, i32* %125, align 4
  %126 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %120, i64 1, i32 6
  store i32 1, i32* %126, align 8
  %127 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %112, align 8
  %128 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %127, i64 2, i32 0
  store i32 3, i32* %128, align 8
  %129 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %127, i64 2, i32 2
  store i32 1, i32* %129, align 8
  %130 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %127, i64 2, i32 3
  store i32 1, i32* %130, align 4
  %131 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %127, i64 2, i32 4
  store i32 1, i32* %131, align 8
  %132 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %127, i64 2, i32 5
  store i32 1, i32* %132, align 4
  %133 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %127, i64 2, i32 6
  store i32 1, i32* %133, align 8
  %134 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %112, align 8
  %135 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %134, i64 3, i32 0
  store i32 4, i32* %135, align 8
  %136 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %134, i64 3, i32 2
  store i32 2, i32* %136, align 8
  %137 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %134, i64 3, i32 3
  store i32 2, i32* %137, align 4
  %138 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %134, i64 3, i32 4
  store i32 0, i32* %138, align 8
  %139 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %134, i64 3, i32 5
  store i32 0, i32* %139, align 4
  %140 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %134, i64 3, i32 6
  store i32 0, i32* %140, align 8
  br label %.loopexit

; <label>:141:                                    ; preds = %17
  %142 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  %143 = load i32, i32* %142, align 8
  %144 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  store i32 %143, i32* %144, align 4
  %.off = add i32 %143, -1
  %145 = icmp ugt i32 %.off, 9
  br i1 %145, label %146, label %.preheader

; <label>:146:                                    ; preds = %141
  %147 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %148 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %147, align 8
  %149 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %148, i64 0, i32 5
  store i32 24, i32* %149, align 8
  %sunkaddr74 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr75 = add i64 %sunkaddr74, 68
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to i32*
  %150 = load i32, i32* %sunkaddr76, align 4
  %151 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %147, align 8
  %152 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %151, i64 0, i32 6, i32 0, i64 0
  store i32 %150, i32* %152, align 4
  %153 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %147, align 8
  %154 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %153, i64 0, i32 6, i32 0, i64 1
  store i32 10, i32* %154, align 4
  %155 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %156 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %155, align 8
  %157 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %156, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %157(%struct.jpeg_common_struct* %.cast) #5
  br label %.preheader

.preheader:                                       ; preds = %146, %141
  %sunkaddr77 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr78 = add i64 %sunkaddr77, 68
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to i32*
  %158 = load i32, i32* %sunkaddr79, align 4
  %159 = icmp sgt i32 %158, 0
  br i1 %159, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %.preheader
  %160 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  br label %161

; <label>:161:                                    ; preds = %.lr.ph, %161
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %161 ]
  %162 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %160, align 8
  %163 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %162, i64 %indvars.iv, i32 0
  %164 = trunc i64 %indvars.iv to i32
  store i32 %164, i32* %163, align 8
  %165 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %162, i64 %indvars.iv, i32 2
  store i32 1, i32* %165, align 8
  %166 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %162, i64 %indvars.iv, i32 3
  store i32 1, i32* %166, align 4
  %167 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %162, i64 %indvars.iv, i32 4
  store i32 0, i32* %167, align 8
  %168 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %162, i64 %indvars.iv, i32 5
  store i32 0, i32* %168, align 4
  %169 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %162, i64 %indvars.iv, i32 6
  store i32 0, i32* %169, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %170 = load i32, i32* %sunkaddr79, align 4
  %171 = sext i32 %170 to i64
  %172 = icmp slt i64 %indvars.iv.next, %171
  br i1 %172, label %161, label %.loopexit.loopexit

; <label>:173:                                    ; preds = %17
  %174 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %175 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %174, align 8
  %176 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %175, i64 0, i32 5
  store i32 8, i32* %176, align 8
  %177 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %178 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %177, align 8
  %179 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %178, align 8
  %180 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %179(%struct.jpeg_common_struct* %180) #5
  ret void

.loopexit.loopexit:                               ; preds = %161
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %110, %79, %55, %31, %21
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_simple_progression(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %3 = load i32, i32* %2, align 4
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 4
  %5 = load i32, i32* %4, align 4
  %6 = icmp eq i32 %5, 100
  br i1 %6, label %18, label %7

; <label>:7:                                      ; preds = %1
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %9 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %9, i64 0, i32 5
  store i32 18, i32* %10, align 8
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr21 = add i64 %sunkaddr, 28
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i32*
  %11 = load i32, i32* %sunkaddr22, align 4
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 6, i32 0, i64 0
  store i32 %11, i32* %13, align 4
  %14 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %15 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %14, align 8
  %16 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %15, align 8
  %17 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %16(%struct.jpeg_common_struct* %17) #5
  br label %18

; <label>:18:                                     ; preds = %1, %7
  %19 = icmp eq i32 %3, 3
  br i1 %19, label %20, label %24

; <label>:20:                                     ; preds = %18
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 13
  %22 = load i32, i32* %21, align 8
  %23 = icmp eq i32 %22, 3
  br i1 %23, label %29, label %24

; <label>:24:                                     ; preds = %20, %18
  %25 = icmp sgt i32 %3, 4
  %26 = shl nsw i32 %3, 2
  %27 = or i32 %26, 2
  %28 = mul nsw i32 %3, 6
  %storemerge = select i1 %25, i32 %28, i32 %27
  br label %29

; <label>:29:                                     ; preds = %24, %20
  %storemerge1 = phi i32 [ 10, %20 ], [ %storemerge, %24 ]
  %30 = icmp eq i32 %3, 3
  %31 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %32 = bitcast %struct.jpeg_memory_mgr** %31 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %33 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %32, align 8
  %34 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %33, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %35 = sext i32 %storemerge1 to i64
  %36 = mul nsw i64 %35, 36
  %37 = tail call i8* %34(%struct.jpeg_common_struct* %.cast, i32 0, i64 %36) #5
  %.cast2 = ptrtoint i8* %37 to i64
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 22
  %39 = bitcast %struct.jpeg_scan_info** %38 to i64*
  store i64 %.cast2, i64* %39, align 8
  %40 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 21
  store i32 %storemerge1, i32* %40, align 8
  br i1 %30, label %41, label %57

; <label>:41:                                     ; preds = %29
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 13
  %43 = load i32, i32* %42, align 8
  %44 = icmp eq i32 %43, 3
  br i1 %44, label %45, label %57

; <label>:45:                                     ; preds = %41
  %46 = bitcast i8* %37 to %struct.jpeg_scan_info*
  %47 = tail call %struct.jpeg_scan_info* @fill_dc_scans(%struct.jpeg_scan_info* %46, i32 %3, i32 0, i32 1)
  %48 = tail call %struct.jpeg_scan_info* @fill_a_scan(%struct.jpeg_scan_info* %47, i32 0, i32 1, i32 5, i32 0, i32 2)
  %49 = tail call %struct.jpeg_scan_info* @fill_a_scan(%struct.jpeg_scan_info* %48, i32 2, i32 1, i32 63, i32 0, i32 1)
  %50 = tail call %struct.jpeg_scan_info* @fill_a_scan(%struct.jpeg_scan_info* %49, i32 1, i32 1, i32 63, i32 0, i32 1)
  %51 = tail call %struct.jpeg_scan_info* @fill_a_scan(%struct.jpeg_scan_info* %50, i32 0, i32 6, i32 63, i32 0, i32 2)
  %52 = tail call %struct.jpeg_scan_info* @fill_a_scan(%struct.jpeg_scan_info* %51, i32 0, i32 1, i32 63, i32 2, i32 1)
  %53 = tail call %struct.jpeg_scan_info* @fill_dc_scans(%struct.jpeg_scan_info* %52, i32 %3, i32 1, i32 0)
  %54 = tail call %struct.jpeg_scan_info* @fill_a_scan(%struct.jpeg_scan_info* %53, i32 2, i32 1, i32 63, i32 1, i32 0)
  %55 = tail call %struct.jpeg_scan_info* @fill_a_scan(%struct.jpeg_scan_info* %54, i32 1, i32 1, i32 63, i32 1, i32 0)
  %56 = tail call %struct.jpeg_scan_info* @fill_a_scan(%struct.jpeg_scan_info* %55, i32 0, i32 1, i32 63, i32 1, i32 0)
  ret void

; <label>:57:                                     ; preds = %41, %29
  %58 = bitcast i8* %37 to %struct.jpeg_scan_info*
  %59 = tail call %struct.jpeg_scan_info* @fill_dc_scans(%struct.jpeg_scan_info* %58, i32 %3, i32 0, i32 1)
  %60 = tail call %struct.jpeg_scan_info* @fill_scans(%struct.jpeg_scan_info* %59, i32 %3, i32 1, i32 5, i32 0, i32 2)
  %61 = tail call %struct.jpeg_scan_info* @fill_scans(%struct.jpeg_scan_info* %60, i32 %3, i32 6, i32 63, i32 0, i32 2)
  %62 = tail call %struct.jpeg_scan_info* @fill_scans(%struct.jpeg_scan_info* %61, i32 %3, i32 1, i32 63, i32 2, i32 1)
  %63 = tail call %struct.jpeg_scan_info* @fill_dc_scans(%struct.jpeg_scan_info* %62, i32 %3, i32 1, i32 0)
  %64 = tail call %struct.jpeg_scan_info* @fill_scans(%struct.jpeg_scan_info* %63, i32 %3, i32 1, i32 63, i32 1, i32 0)
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal %struct.jpeg_scan_info* @fill_dc_scans(%struct.jpeg_scan_info*, i32, i32, i32) #3 {
  %5 = icmp slt i32 %1, 5
  br i1 %5, label %6, label %32

; <label>:6:                                      ; preds = %4
  %7 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 0
  store i32 %1, i32* %7, align 4
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %6
  %9 = add i32 %1, -1
  %xtraiter = and i32 %1, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  %10 = add nsw i32 %xtraiter, -1
  %11 = zext i32 %10 to i64
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %12 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 1, i64 %indvars.iv.prol
  %13 = trunc i64 %indvars.iv.prol to i32
  store i32 %13, i32* %12, align 4
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol
  %14 = icmp ult i32 %9, 7
  br i1 %14, label %._crit_edge, label %.lr.ph.preheader15

.lr.ph.preheader15:                               ; preds = %.lr.ph.prol.loopexit
  %15 = add nuw nsw i64 %11, 1
  %wide.trip.count.7 = zext i32 %1 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader15, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph ], [ %15, %.lr.ph.preheader15 ]
  %16 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 1, i64 %indvars.iv
  %17 = trunc i64 %indvars.iv to i32
  store i32 %17, i32* %16, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 1, i64 %indvars.iv.next
  %19 = trunc i64 %indvars.iv.next to i32
  store i32 %19, i32* %18, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %20 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 1, i64 %indvars.iv.next.1
  %21 = trunc i64 %indvars.iv.next.1 to i32
  store i32 %21, i32* %20, align 4
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %22 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 1, i64 %indvars.iv.next.2
  %23 = trunc i64 %indvars.iv.next.2 to i32
  store i32 %23, i32* %22, align 4
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %24 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 1, i64 %indvars.iv.next.3
  %25 = trunc i64 %indvars.iv.next.3 to i32
  store i32 %25, i32* %24, align 4
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %26 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 1, i64 %indvars.iv.next.4
  %27 = trunc i64 %indvars.iv.next.4 to i32
  store i32 %27, i32* %26, align 4
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %28 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 1, i64 %indvars.iv.next.5
  %29 = trunc i64 %indvars.iv.next.5 to i32
  store i32 %29, i32* %28, align 4
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %30 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 1, i64 %indvars.iv.next.6
  %31 = trunc i64 %indvars.iv.next.6 to i32
  store i32 %31, i32* %30, align 4
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, %wide.trip.count.7
  br i1 %exitcond.7, label %._crit_edge.loopexit, label %.lr.ph

; <label>:32:                                     ; preds = %4
  %33 = tail call %struct.jpeg_scan_info* @fill_scans(%struct.jpeg_scan_info* %0, i32 %1, i32 0, i32 0, i32 %2, i32 %3)
  ret %struct.jpeg_scan_info* %33

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.preheader, %.lr.ph.prol.loopexit, %6
  %34 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 3
  store i32 0, i32* %34, align 4
  %35 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 2
  store i32 0, i32* %35, align 4
  %36 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 4
  store i32 %2, i32* %36, align 4
  %37 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 5
  store i32 %3, i32* %37, align 4
  %38 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 1
  ret %struct.jpeg_scan_info* %38
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal %struct.jpeg_scan_info* @fill_a_scan(%struct.jpeg_scan_info*, i32, i32, i32, i32, i32) #3 {
  %7 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 0
  store i32 1, i32* %7, align 4
  %8 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 1, i64 0
  store i32 %1, i32* %8, align 4
  %9 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 2
  store i32 %2, i32* %9, align 4
  %10 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 3
  store i32 %3, i32* %10, align 4
  %11 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 4
  store i32 %4, i32* %11, align 4
  %12 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 5
  store i32 %5, i32* %12, align 4
  %13 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 1
  ret %struct.jpeg_scan_info* %13
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal %struct.jpeg_scan_info* @fill_scans(%struct.jpeg_scan_info*, i32, i32, i32, i32, i32) #3 {
  %7 = icmp sgt i32 %1, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %6
  %8 = add i32 %1, -1
  %9 = zext i32 %8 to i64
  %10 = add nuw nsw i64 %9, 1
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %11 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 0
  store i32 1, i32* %11, align 4
  %12 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 1, i64 0
  store i32 0, i32* %12, align 4
  %13 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 2
  store i32 %2, i32* %13, align 4
  %14 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 3
  store i32 %3, i32* %14, align 4
  %15 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 4
  store i32 %4, i32* %15, align 4
  %16 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 0, i32 5
  store i32 %5, i32* %16, align 4
  %17 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %storemerge10.unr = phi i32 [ 0, %.lr.ph.preheader ], [ 1, %.lr.ph.prol ]
  %.09.unr = phi %struct.jpeg_scan_info* [ %0, %.lr.ph.preheader ], [ %17, %.lr.ph.prol ]
  %18 = icmp eq i32 %8, 0
  br i1 %18, label %._crit_edge.loopexit, label %.lr.ph.preheader13

.lr.ph.preheader13:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader13, %.lr.ph
  %storemerge10 = phi i32 [ %33, %.lr.ph ], [ %storemerge10.unr, %.lr.ph.preheader13 ]
  %.09 = phi %struct.jpeg_scan_info* [ %32, %.lr.ph ], [ %.09.unr, %.lr.ph.preheader13 ]
  %19 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.09, i64 0, i32 0
  store i32 1, i32* %19, align 4
  %20 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.09, i64 0, i32 1, i64 0
  store i32 %storemerge10, i32* %20, align 4
  %21 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.09, i64 0, i32 2
  store i32 %2, i32* %21, align 4
  %22 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.09, i64 0, i32 3
  store i32 %3, i32* %22, align 4
  %23 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.09, i64 0, i32 4
  store i32 %4, i32* %23, align 4
  %24 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.09, i64 0, i32 5
  store i32 %5, i32* %24, align 4
  %25 = add nuw nsw i32 %storemerge10, 1
  %26 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.09, i64 1, i32 0
  store i32 1, i32* %26, align 4
  %27 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.09, i64 1, i32 1, i64 0
  store i32 %25, i32* %27, align 4
  %28 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.09, i64 1, i32 2
  store i32 %2, i32* %28, align 4
  %29 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.09, i64 1, i32 3
  store i32 %3, i32* %29, align 4
  %30 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.09, i64 1, i32 4
  store i32 %4, i32* %30, align 4
  %31 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.09, i64 1, i32 5
  store i32 %5, i32* %31, align 4
  %32 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.09, i64 2
  %33 = add nuw nsw i32 %storemerge10, 2
  %exitcond.1 = icmp eq i32 %33, %1
  br i1 %exitcond.1, label %._crit_edge.loopexit.loopexit, label %.lr.ph

._crit_edge.loopexit.loopexit:                    ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge.loopexit.loopexit, %.lr.ph.prol.loopexit
  %scevgep = getelementptr %struct.jpeg_scan_info, %struct.jpeg_scan_info* %0, i64 %10
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  %.0.lcssa = phi %struct.jpeg_scan_info* [ %0, %6 ], [ %scevgep, %._crit_edge.loopexit ]
  ret %struct.jpeg_scan_info* %.0.lcssa
}

; Function Attrs: noinline nounwind uwtable
define internal void @add_huff_table(%struct.jpeg_compress_struct*, %struct.JHUFF_TBL**, i8*, i8*) #0 {
  %5 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %1, align 8
  %6 = icmp eq %struct.JHUFF_TBL* %5, null
  br i1 %6, label %7, label %10

; <label>:7:                                      ; preds = %4
  %8 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %9 = tail call %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct* %8) #5
  store %struct.JHUFF_TBL* %9, %struct.JHUFF_TBL** %1, align 8
  br label %10

; <label>:10:                                     ; preds = %7, %4
  %11 = bitcast %struct.JHUFF_TBL** %1 to i8**
  %12 = load i8*, i8** %11, align 8
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %2, i64 17, i32 1, i1 false)
  %13 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %1, align 8
  %14 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %13, i64 0, i32 1, i64 0
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %3, i64 256, i32 1, i1 false)
  %15 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %1, align 8
  %16 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %15, i64 0, i32 2
  store i32 0, i32* %16, align 4
  ret void
}

declare %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
