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
define void @jinit_c_main_controller(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %4 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %4, i64 0, i32 0
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
  br i1 %16, label %24, label %17

; <label>:17:                                     ; preds = %15
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %19 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %19, i64 0, i32 5
  store i32 4, i32* %20, align 8
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i64 0, i32 0
  %23 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %22, align 8
  tail call void %23(%struct.jpeg_common_struct* %7) #1
  br label %.loopexit

; <label>:24:                                     ; preds = %15
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %26 = load i32, i32* %25, align 4
  %27 = icmp sgt i32 %26, 0
  br i1 %27, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %24
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %29 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %28, align 8
  %30 = getelementptr inbounds i8, i8* %8, i64 32
  %31 = bitcast i8* %30 to [10 x i8**]*
  br label %32

; <label>:32:                                     ; preds = %.lr.ph, %32
  %.03 = phi %struct.jpeg_component_info* [ %29, %.lr.ph ], [ %44, %32 ]
  %indvars.iv2 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %32 ]
  %33 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %3, align 8
  %34 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %33, i64 0, i32 2
  %35 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 7
  %37 = load i32, i32* %36, align 4
  %38 = shl i32 %37, 3
  %39 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 3
  %40 = load i32, i32* %39, align 4
  %41 = shl nsw i32 %40, 3
  %42 = tail call i8** %35(%struct.jpeg_common_struct* nonnull %7, i32 1, i32 %38, i32 %41) #1
  %43 = getelementptr inbounds [10 x i8**], [10 x i8**]* %31, i64 0, i64 %indvars.iv2
  store i8** %42, i8*** %43, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv2, 1
  %44 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 1
  %45 = load i32, i32* %25, align 4
  %46 = sext i32 %45 to i64
  %47 = icmp slt i64 %indvars.iv.next, %46
  br i1 %47, label %32, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %32
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %24, %2, %17
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
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 0
  %22 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %21, align 8
  %23 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %22(%struct.jpeg_common_struct* %23) #1
  br label %24

; <label>:24:                                     ; preds = %2, %16, %14
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
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 53
  %15 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 5, i64 0
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %17 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 5, i64 0
  %18 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 3
  br label %19

; <label>:19:                                     ; preds = %.lr.ph, %45
  %20 = load i32, i32* %13, align 4
  %21 = icmp ult i32 %20, 8
  br i1 %21, label %22, label %26

; <label>:22:                                     ; preds = %19
  %23 = load %struct.jpeg_c_prep_controller*, %struct.jpeg_c_prep_controller** %14, align 8
  %24 = getelementptr inbounds %struct.jpeg_c_prep_controller, %struct.jpeg_c_prep_controller* %23, i64 0, i32 1
  %25 = load void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)** %24, align 8
  tail call void %25(%struct.jpeg_compress_struct* nonnull %0, i8** %1, i32* %2, i32 %3, i8*** nonnull %15, i32* nonnull %13, i32 8) #1
  %.pr = load i32, i32* %13, align 4
  br label %26

; <label>:26:                                     ; preds = %22, %19
  %27 = phi i32 [ %.pr, %22 ], [ %20, %19 ]
  %28 = icmp eq i32 %27, 8
  br i1 %28, label %29, label %.loopexit.loopexit

; <label>:29:                                     ; preds = %26
  %30 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %16, align 8
  %31 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %30, i64 0, i32 1
  %32 = load i32 (%struct.jpeg_compress_struct*, i8***)*, i32 (%struct.jpeg_compress_struct*, i8***)** %31, align 8
  %33 = tail call i32 %32(%struct.jpeg_compress_struct* nonnull %0, i8*** nonnull %17) #1
  %34 = icmp eq i32 %33, 0
  %35 = load i32, i32* %18, align 8
  %36 = icmp ne i32 %35, 0
  br i1 %34, label %37, label %41

; <label>:37:                                     ; preds = %29
  br i1 %36, label %.loopexit, label %38

; <label>:38:                                     ; preds = %37
  %39 = load i32, i32* %2, align 4
  %40 = add i32 %39, -1
  store i32 %40, i32* %2, align 4
  store i32 1, i32* %18, align 8
  br label %.loopexit

; <label>:41:                                     ; preds = %29
  br i1 %36, label %42, label %45

; <label>:42:                                     ; preds = %41
  %43 = load i32, i32* %2, align 4
  %44 = add i32 %43, 1
  store i32 %44, i32* %2, align 4
  store i32 0, i32* %18, align 8
  br label %45

; <label>:45:                                     ; preds = %42, %41
  store i32 0, i32* %13, align 4
  %46 = load i32, i32* %8, align 8
  %47 = add i32 %46, 1
  store i32 %47, i32* %8, align 8
  %48 = load i32, i32* %10, align 8
  %49 = icmp ult i32 %47, %48
  br i1 %49, label %19, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %26, %45
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %4, %37, %38
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
