; ModuleID = 'jcmainct.ll'
source_filename = "jcmainct.c"
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
%struct.jpeg_entropy_encoder = type { {}*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, void (%struct.jpeg_compress_struct*)* }
%struct.my_main_controller = type { %struct.jpeg_c_main_controller, i32, i32, i32, i32, [10 x i8**] }

; Function Attrs: noinline nounwind uwtable
define void @jinit_c_main_controller(%struct.jpeg_compress_struct*, i32) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %4 = bitcast %struct.jpeg_memory_mgr** %3 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %4, align 8
  %6 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %5, align 8
  %7 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %8 = tail call i8* %6(%struct.jpeg_common_struct* %7, i32 1, i64 112) #1
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 52
  %10 = bitcast %struct.jpeg_c_main_controller** %9 to i8**
  store i8* %8, i8** %10, align 8
  %11 = bitcast i8* %8 to void (%struct.jpeg_compress_struct*, i32)**
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_main, void (%struct.jpeg_compress_struct*, i32)** %11, align 8
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 23
  %13 = load i32, i32* %12, align 8
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %.loopexit

; <label>:15:                                     ; preds = %2
  %16 = icmp eq i32 %1, 0
  br i1 %16, label %25, label %17

; <label>:17:                                     ; preds = %15
  %18 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 5
  store i32 4, i32* %21, align 8
  %22 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %23 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %22, align 8
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  tail call void %24(%struct.jpeg_common_struct* %18) #1
  ret void

; <label>:25:                                     ; preds = %15
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %27 = load i32, i32* %26, align 4
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %25
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %30 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %29, align 8
  %31 = ptrtoint i8* %8 to i64
  %32 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr16 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr17 = add i64 %sunkaddr16, 8
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to %struct.jpeg_memory_mgr**
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr19 = add i64 %sunkaddr, 68
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i32*
  br label %33

; <label>:33:                                     ; preds = %33, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %33 ]
  %.03 = phi %struct.jpeg_component_info* [ %30, %.lr.ph ], [ %44, %33 ]
  %34 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr18, align 8
  %35 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %34, i64 0, i32 2
  %36 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %35, align 8
  %37 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 7
  %38 = load i32, i32* %37, align 4
  %39 = shl i32 %38, 3
  %40 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 3
  %41 = load i32, i32* %40, align 4
  %42 = shl nsw i32 %41, 3
  %43 = tail call i8** %36(%struct.jpeg_common_struct* nonnull %32, i32 1, i32 %39, i32 %42) #1
  %sunkaddr7 = shl i64 %indvars.iv, 3
  %sunkaddr8 = add i64 %31, %sunkaddr7
  %sunkaddr9 = add i64 %sunkaddr8, 32
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to i8***
  store i8** %43, i8*** %sunkaddr10, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %44 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 1
  %45 = load i32, i32* %sunkaddr20, align 4
  %46 = sext i32 %45 to i64
  %47 = icmp slt i64 %indvars.iv.next, %46
  br i1 %47, label %33, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %33
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %25, %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_main(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 52
  %4 = bitcast %struct.jpeg_c_main_controller** %3 to %struct.my_main_controller**
  %5 = load %struct.my_main_controller*, %struct.my_main_controller** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 23
  %7 = load i32, i32* %6, align 8
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %24

; <label>:9:                                      ; preds = %2
  %10 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %5, i64 0, i32 1
  store i32 0, i32* %10, align 8
  %11 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %5, i64 0, i32 2
  store i32 0, i32* %11, align 4
  %12 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %5, i64 0, i32 3
  store i32 0, i32* %12, align 8
  %13 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %5, i64 0, i32 4
  store i32 %1, i32* %13, align 4
  %cond = icmp eq i32 %1, 0
  br i1 %cond, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %5, i64 0, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*, i8**, i32*, i32)* @process_data_simple_main, void (%struct.jpeg_compress_struct*, i8**, i32*, i32)** %15, align 8
  br label %24

; <label>:16:                                     ; preds = %9
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i64 0, i32 5
  store i32 4, i32* %19, align 8
  %20 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %21 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %20, align 8
  %22 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %21, align 8
  %23 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %22(%struct.jpeg_common_struct* %23) #1
  ret void

; <label>:24:                                     ; preds = %2, %14
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @process_data_simple_main(%struct.jpeg_compress_struct*, i8**, i32*, i32) #0 {
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 52
  %6 = bitcast %struct.jpeg_c_main_controller** %5 to %struct.my_main_controller**
  %7 = load %struct.my_main_controller*, %struct.my_main_controller** %6, align 8
  %8 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 1
  %9 = load i32, i32* %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 40
  %11 = load i32, i32* %10, align 8
  %12 = icmp ult i32 %9, %11
  br i1 %12, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %4
  %13 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 2
  %14 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 5, i64 0
  %15 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 5, i64 0
  %sunkaddr32 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr33 = add i64 %sunkaddr32, 440
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to %struct.jpeg_c_prep_controller**
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr35 = add i64 %sunkaddr, 448
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to %struct.jpeg_c_coef_controller**
  %sunkaddr37 = ptrtoint %struct.my_main_controller* %7 to i64
  %sunkaddr38 = add i64 %sunkaddr37, 24
  %sunkaddr39 = inttoptr i64 %sunkaddr38 to i32*
  %sunkaddr43 = ptrtoint %struct.my_main_controller* %7 to i64
  %sunkaddr44 = add i64 %sunkaddr43, 20
  %sunkaddr45 = inttoptr i64 %sunkaddr44 to i32*
  %sunkaddr46 = ptrtoint %struct.my_main_controller* %7 to i64
  %sunkaddr47 = add i64 %sunkaddr46, 16
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to i32*
  %sunkaddr49 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr50 = add i64 %sunkaddr49, 312
  %sunkaddr51 = inttoptr i64 %sunkaddr50 to i32*
  %sunkaddr40 = ptrtoint %struct.my_main_controller* %7 to i64
  %sunkaddr41 = add i64 %sunkaddr40, 24
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to i32*
  br label %16

; <label>:16:                                     ; preds = %42, %.lr.ph
  %17 = load i32, i32* %13, align 4
  %18 = icmp ult i32 %17, 8
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %16
  %20 = load %struct.jpeg_c_prep_controller*, %struct.jpeg_c_prep_controller** %sunkaddr34, align 8
  %21 = getelementptr inbounds %struct.jpeg_c_prep_controller, %struct.jpeg_c_prep_controller* %20, i64 0, i32 1
  %22 = load void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)** %21, align 8
  tail call void %22(%struct.jpeg_compress_struct* nonnull %0, i8** %1, i32* %2, i32 %3, i8*** nonnull %14, i32* nonnull %13, i32 8) #1
  %.pr = load i32, i32* %13, align 4
  br label %23

; <label>:23:                                     ; preds = %16, %19
  %24 = phi i32 [ %.pr, %19 ], [ %17, %16 ]
  %25 = icmp eq i32 %24, 8
  br i1 %25, label %26, label %.loopexit.loopexit

; <label>:26:                                     ; preds = %23
  %27 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %sunkaddr36, align 8
  %28 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %27, i64 0, i32 1
  %29 = load i32 (%struct.jpeg_compress_struct*, i8***)*, i32 (%struct.jpeg_compress_struct*, i8***)** %28, align 8
  %30 = tail call i32 %29(%struct.jpeg_compress_struct* nonnull %0, i8*** nonnull %15) #1
  %31 = icmp eq i32 %30, 0
  %32 = load i32, i32* %sunkaddr39, align 8
  %33 = icmp eq i32 %32, 0
  br i1 %31, label %34, label %38

; <label>:34:                                     ; preds = %26
  br i1 %33, label %35, label %.loopexit

; <label>:35:                                     ; preds = %34
  %36 = load i32, i32* %2, align 4
  %37 = add i32 %36, -1
  store i32 %37, i32* %2, align 4
  %sunkaddr11 = ptrtoint %struct.my_main_controller* %7 to i64
  %sunkaddr12 = add i64 %sunkaddr11, 24
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to i32*
  store i32 1, i32* %sunkaddr13, align 8
  br label %.loopexit

; <label>:38:                                     ; preds = %26
  br i1 %33, label %42, label %39

; <label>:39:                                     ; preds = %38
  %40 = load i32, i32* %2, align 4
  %41 = add i32 %40, 1
  store i32 %41, i32* %2, align 4
  store i32 0, i32* %sunkaddr42, align 8
  br label %42

; <label>:42:                                     ; preds = %38, %39
  store i32 0, i32* %sunkaddr45, align 4
  %43 = load i32, i32* %sunkaddr48, align 8
  %44 = add i32 %43, 1
  store i32 %44, i32* %sunkaddr48, align 8
  %45 = load i32, i32* %sunkaddr51, align 8
  %46 = icmp ult i32 %44, %45
  br i1 %46, label %16, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %23, %42
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %34, %4, %35
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
